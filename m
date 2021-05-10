Content-Type: multipart/mixed; boundary="===============5122180235784828487=="
MIME-Version: 1.0
From: Xing, Zhengjun <zhengjun.xing@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 80cb403876: stress-ng.sockabuse.ops_per_sec -81.3% regression
Date: Mon, 10 May 2021 16:33:25 +0800
Message-ID: <11bb5248-14d7-0daa-180c-811310f85177@intel.com>
In-Reply-To: <YIENVTyG7/ok4awU@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5122180235784828487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

On 4/22/2021 1:44 PM, Andrea Arcangeli wrote:
> Hello,
>
> thanks a lot for the help benchmarking and regression testing my
> aa.git tree.
>
> So I've been looking right now what the problem was with the
> regression you reported to a scheduler optimization I did in my aa.git
> tree.
>
> On Fri, Mar 05, 2021 at 04:12:14PM +0800, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -81.3% regression of stress-ng.sockabuse.ops_per_sec d=
ue to commit:
>>
>>
>> commit: 80cb403876fc973389d6ea100a3eea11d81e6f2d ("sched/fair: skip sele=
ct_idle_sibling() in presence of sync wakeups")
>> https://git.kernel.org/cgit/linux/kernel/git/andrea/aa.git master
>>
>>
>> in testcase: stress-ng
>> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz wit=
h 192G memory
>> with following parameters:
>>
>> 	nr_threads: 100%
>> 	disk: 1HDD
>> 	testtime: 60s
>> 	class: network
>> 	test: sockabuse
>> 	cpufreq_governor: performance
>> 	ucode: 0x5003006
> Could you confirm the -81.3% regression is with the following test
> command line:
>
>        ./stress-ng --timeout 60 --times --verify --metrics-brief --sockab=
use `nproc`
Sorry for the late.

I re-test it many times, the regression still exists.
I find that your test machine has 16 CPUs,=C2=A0 but this issue happened on=
 a =

machine with 96 CPUs.
Maybe increase the CPU numbers can easy to reproduce the issue.

2021-04-26 07:14:15 stress-ng --timeout 60 --times --verify =

--metrics-brief --sockabuse 96
stress-ng: info:=C2=A0 [2793] dispatching hogs: 96 sockabuse
stress-ng: info:=C2=A0 [2793] successful run completed in 60.03s (1 min, 0.=
03 =

secs)
stress-ng: info:=C2=A0 [2793] stressor=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
bogo ops real time=C2=A0 usr time=C2=A0 =

sys time=C2=A0=C2=A0 bogo ops/s=C2=A0=C2=A0=C2=A0=C2=A0 bogo ops/s
stress-ng: info:=C2=A0 [2793]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (secs) (secs)=C2=A0=C2=A0=C2=A0 =

(secs)=C2=A0=C2=A0 (real time) (usr+sys time)
stress-ng: info:=C2=A0 [2793] sockabuse=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 96021=C2=A0=C2=A0=C2=A0=C2=A0 60.00 4.65=C2=A0=C2=A0=C2=A0=C2=
=A0 =

66.79=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1600.34=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 1344.08
stress-ng: info:=C2=A0 [2793] for a 60.03s run time:
stress-ng: info:=C2=A0 [2793]=C2=A0=C2=A0=C2=A0 5762.61s available CPU time
stress-ng: info:=C2=A0 [2793]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.61s use=
r time=C2=A0=C2=A0 (=C2=A0 0.10%)
stress-ng: info:=C2=A0 [2793]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 67.77s system t=
ime (=C2=A0 1.18%)
stress-ng: info:=C2=A0 [2793]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 73.38s total ti=
me=C2=A0 (=C2=A0 1.27%)
stress-ng: info:=C2=A0 [2793] load average: 2.55 0.87 0.31

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/disk/testtime/class/=
test/cpufreq_governor/ucode:
lkp-csl-2sp5/stress-ng/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-=
9/100%/1HDD/60s/network/sockabuse/performance/0x5003006

commit:
 =C2=A0 05091b2b63b3cf127a1b28abd17e5416babf61bf
 =C2=A0 80cb403876fc973389d6ea100a3eea11d81e6f2d

05091b2b63b3cf12 80cb403876fc973389d6ea100a3
---------------- ---------------------------
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=A0=
=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
 =C2=A0=C2=A0=C2=A0 516345=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -80.0%=C2=A0=C2=A0=C2=A0=C2=A0 103073 =C2=B1=C2=A0 5% stress-n=
g.sockabuse.ops
 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8605=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -80.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1717 =C2=
=B1=C2=A0 5% =

stress-ng.sockabuse.ops_per_sec


>
> If yes, then I wonder if the lkp script may be doing a mistake. Aren't
> more bogo ops or more ops/sec and higher CPU utilization better and desir=
ed?
>
> The improvement in ops/sec for sockabuse looks massive with aa.git
> compared to upstream.
>
> In addition it also wins the other tcp benchmarks by 67.1%.
>
> Could you re-check (and if necessary correct) your stress-ng sockabuse
> reporting logic in lkp to be sure it's not reversed?
>
> The following are my results.
>
> upstream commit 151501160401e2dc669ea7dac2c599b53f220c33:
>
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse `=
nproc`
> stress-ng: info:  [11485] dispatching hogs: 16 sockabuse
> stress-ng: info:  [11485] successful run completed in 60.00s (1 min, 0.00=
 secs)
> stress-ng: info:  [11485] stressor       bogo ops real time  usr time  sy=
s time   bogo ops/s     bogo ops/s
> stress-ng: info:  [11485]                           (secs)    (secs)    (=
secs)   (real time) (usr+sys time)
> stress-ng: info:  [11485] sockabuse         79249     60.00     35.27    =
238.43      1320.81         289.55
> stress-ng: info:  [11485] for a 60.00s run time:
> stress-ng: info:  [11485]     960.07s available CPU time
> stress-ng: info:  [11485]      35.44s user time   (  3.69%)
> stress-ng: info:  [11485]     238.59s system time ( 24.85%)
> stress-ng: info:  [11485]     274.03s total time  ( 28.54%)
> stress-ng: info:  [11485] load average: 4.30 1.71 0.69
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse `=
nproc`
> stress-ng: info:  [11576] dispatching hogs: 16 sockabuse
> stress-ng: info:  [11576] successful run completed in 60.00s (1 min, 0.00=
 secs)
> stress-ng: info:  [11576] stressor       bogo ops real time  usr time  sy=
s time   bogo ops/s     bogo ops/s
> stress-ng: info:  [11576]                           (secs)    (secs)    (=
secs)   (real time) (usr+sys time)
> stress-ng: info:  [11576] sockabuse         78151     60.00     34.51    =
234.79      1302.51         290.20
> stress-ng: info:  [11576] for a 60.00s run time:
> stress-ng: info:  [11576]     960.08s available CPU time
> stress-ng: info:  [11576]      34.67s user time   (  3.61%)
> stress-ng: info:  [11576]     234.95s system time ( 24.47%)
> stress-ng: info:  [11576]     269.62s total time  ( 28.08%)
> stress-ng: info:  [11576] load average: 4.76 2.35 1.01
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse $=
[`nproc`/2]
> stress-ng: info:  [11687] dispatching hogs: 8 sockabuse
> stress-ng: info:  [11687] successful run completed in 60.00s (1 min, 0.00=
 secs)
> stress-ng: info:  [11687] stressor       bogo ops real time  usr time  sy=
s time   bogo ops/s     bogo ops/s
> stress-ng: info:  [11687]                           (secs)    (secs)    (=
secs)   (real time) (usr+sys time)
> stress-ng: info:  [11687] sockabuse         36426     60.00     18.89    =
123.67       607.10         255.51
> stress-ng: info:  [11687] for a 60.00s run time:
> stress-ng: info:  [11687]     960.04s available CPU time
> stress-ng: info:  [11687]      18.96s user time   (  1.97%)
> stress-ng: info:  [11687]     123.76s system time ( 12.89%)
> stress-ng: info:  [11687]     142.72s total time  ( 14.87%)
> stress-ng: info:  [11687] load average: 1.67 1.84 0.99
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse $=
[`nproc`/2]
> stress-ng: info:  [11763] dispatching hogs: 8 sockabuse
> stress-ng: info:  [11763] successful run completed in 60.00s (1 min, 0.00=
 secs)
> stress-ng: info:  [11763] stressor       bogo ops real time  usr time  sy=
s time   bogo ops/s     bogo ops/s
> stress-ng: info:  [11763]                           (secs)    (secs)    (=
secs)   (real time) (usr+sys time)
> stress-ng: info:  [11763] sockabuse         36238     60.00     18.47    =
123.14       603.96         255.90
> stress-ng: info:  [11763] for a 60.00s run time:
> stress-ng: info:  [11763]     960.04s available CPU time
> stress-ng: info:  [11763]      18.55s user time   (  1.93%)
> stress-ng: info:  [11763]     123.22s system time ( 12.83%)
> stress-ng: info:  [11763]     141.77s total time  ( 14.77%)
> stress-ng: info:  [11763] load average: 2.45 1.92 1.10
>
> aa.git main branch:
>
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse `=
nproc`
> stress-ng: info:  [1484] dispatching hogs: 16 sockabuse
> stress-ng: info:  [1484] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [1484] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [1484]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [1484] sockabuse        227572     60.00     69.34    4=
58.66      3792.85         431.01
> stress-ng: info:  [1484] for a 60.00s run time:
> stress-ng: info:  [1484]     960.07s available CPU time
> stress-ng: info:  [1484]      69.50s user time   (  7.24%)
> stress-ng: info:  [1484]     458.82s system time ( 47.79%)
> stress-ng: info:  [1484]     528.32s total time  ( 55.03%)
> stress-ng: info:  [1484] load average: 9.72 4.63 1.96
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse `=
nproc`
> stress-ng: info:  [1560] dispatching hogs: 16 sockabuse
> stress-ng: info:  [1560] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [1560] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [1560]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [1560] sockabuse        225473     60.00     69.17    4=
56.73      3757.87         428.74
> stress-ng: info:  [1560] for a 60.00s run time:
> stress-ng: info:  [1560]     960.07s available CPU time
> stress-ng: info:  [1560]      69.34s user time   (  7.22%)
> stress-ng: info:  [1560]     456.88s system time ( 47.59%)
> stress-ng: info:  [1560]     526.22s total time  ( 54.81%)
> stress-ng: info:  [1560] load average: 12.22 6.29 2.71
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse $=
[`nproc`/2]
> stress-ng: info:  [1259] dispatching hogs: 8 sockabuse
> stress-ng: info:  [1259] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [1259] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [1259]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [1259] sockabuse        137434     60.00     45.26    2=
91.80      2290.54         407.74
> stress-ng: info:  [1259] for a 60.00s run time:
> stress-ng: info:  [1259]     960.05s available CPU time
> stress-ng: info:  [1259]      45.33s user time   (  4.72%)
> stress-ng: info:  [1259]     291.88s system time ( 30.40%)
> stress-ng: info:  [1259]     337.21s total time  ( 35.12%)
> stress-ng: info:  [1259] load average: 6.41 2.10 0.76
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse $=
[`nproc`/2]
> stress-ng: info:  [1411] dispatching hogs: 8 sockabuse
> stress-ng: info:  [1411] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [1411] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [1411]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [1411] sockabuse        139263     60.00     45.97    2=
94.32      2321.04         409.25
> stress-ng: info:  [1411] for a 60.00s run time:
> stress-ng: info:  [1411]     960.03s available CPU time
> stress-ng: info:  [1411]      46.05s user time   (  4.80%)
> stress-ng: info:  [1411]     294.40s system time ( 30.67%)
> stress-ng: info:  [1411]     340.45s total time  ( 35.46%)
> stress-ng: info:  [1411] load average: 6.74 3.15 1.26
>
> aa.git main + "git revert" of "sched/fair: skip select_idle_sibling() in =
presence of sync wakeups":
>
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse `=
nproc`
> stress-ng: info:  [1297] dispatching hogs: 16 sockabuse
> stress-ng: info:  [1297] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [1297] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [1297]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [1297] sockabuse         79820     60.00     35.61    2=
39.91      1330.33         289.71
> stress-ng: info:  [1297] for a 60.00s run time:
> stress-ng: info:  [1297]     960.08s available CPU time
> stress-ng: info:  [1297]      35.75s user time   (  3.72%)
> stress-ng: info:  [1297]     240.07s system time ( 25.01%)
> stress-ng: info:  [1297]     275.82s total time  ( 28.73%)
> stress-ng: info:  [1297] load average: 4.67 1.62 0.59
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse `=
nproc`
> stress-ng: info:  [1371] dispatching hogs: 16 sockabuse
> stress-ng: info:  [1371] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [1371] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [1371]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [1371] sockabuse         80553     60.00     35.76    2=
41.33      1342.54         290.71
> stress-ng: info:  [1371] for a 60.00s run time:
> stress-ng: info:  [1371]     960.07s available CPU time
> stress-ng: info:  [1371]      35.95s user time   (  3.74%)
> stress-ng: info:  [1371]     241.48s system time ( 25.15%)
> stress-ng: info:  [1371]     277.43s total time  ( 28.90%)
> stress-ng: info:  [1371] load average: 4.50 2.17 0.86
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse $=
[`nproc`/2]
> stress-ng: info:  [1459] dispatching hogs: 8 sockabuse
> stress-ng: info:  [1459] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [1459] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [1459]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [1459] sockabuse         36641     60.00     18.98    1=
23.23       610.68         257.65
> stress-ng: info:  [1459] for a 60.00s run time:
> stress-ng: info:  [1459]     960.04s available CPU time
> stress-ng: info:  [1459]      19.07s user time   (  1.99%)
> stress-ng: info:  [1459]     123.31s system time ( 12.84%)
> stress-ng: info:  [1459]     142.38s total time  ( 14.83%)
> stress-ng: info:  [1459] load average: 2.65 2.07 0.94
> # ./stress-ng --timeout 60 --times --verify --metrics-brief --sockabuse $=
[`nproc`/2]
> stress-ng: info:  [1509] dispatching hogs: 8 sockabuse
> stress-ng: info:  [1509] successful run completed in 60.00s (1 min, 0.00 =
secs)
> stress-ng: info:  [1509] stressor       bogo ops real time  usr time  sys=
 time   bogo ops/s     bogo ops/s
> stress-ng: info:  [1509]                           (secs)    (secs)    (s=
ecs)   (real time) (usr+sys time)
> stress-ng: info:  [1509] sockabuse         36339     60.00     18.65    1=
21.20       605.65         259.84
> stress-ng: info:  [1509] for a 60.00s run time:
> stress-ng: info:  [1509]     960.04s available CPU time
> stress-ng: info:  [1509]      18.72s user time   (  1.95%)
> stress-ng: info:  [1509]     121.28s system time ( 12.63%)
> stress-ng: info:  [1509]     140.00s total time  ( 14.58%)
> stress-ng: info:  [1509] load average: 3.05 2.26 1.08
>
>
> Thanks,
> Andrea
>
>>
>> In addition to that, the commit also has significant impact on the follo=
wing tests:
>>
>> +------------------+----------------------------------------------------=
-----------------------+
>> | testcase: change | netperf: netperf.Throughput_tps 67.1% improvement  =
                       |
>> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.=
30GHz with 192G memory |
>> | test parameters  | cluster=3Dcs-localhost                             =
                         |
>> |                  | cpufreq_governor=3Dperformance                     =
                         |
>> |                  | ip=3Dipv4                                          =
                         |
>> |                  | nr_threads=3D25%                                   =
                         |
>> |                  | runtime=3D300s                                     =
                         |
>> |                  | test=3DTCP_RR                                      =
                         |
>> |                  | ucode=3D0x5003006                                  =
                         |
>> +------------------+----------------------------------------------------=
-----------------------+
>> | testcase: change | netperf: netperf.Throughput_Mbps -68.3% regression =
                       |
>> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.=
30GHz with 192G memory |
>> | test parameters  | cluster=3Dcs-localhost                             =
                         |
>> |                  | cpufreq_governor=3Dperformance                     =
                         |
>> |                  | ip=3Dipv4                                          =
                         |
>> |                  | nr_threads=3D50%                                   =
                         |
>> |                  | runtime=3D300s                                     =
                         |
>> |                  | send_size=3D10K                                    =
                         |
>> |                  | test=3DSCTP_STREAM_MANY                            =
                         |
>> |                  | ucode=3D0x5003006                                  =
                         |
>> +------------------+----------------------------------------------------=
-----------------------+
>>
>>
>> If you fix the issue, kindly add following tag
>> Reported-by: kernel test robot <oliver.sang@intel.com>
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install                job.yaml  # job file is attached=
 in this email
>>          bin/lkp split-job --compatible job.yaml
>>          bin/lkp run                    compatible-job.yaml
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/tbox_grou=
p/test/testcase/testtime/ucode:
>>    network/gcc-9/performance/1HDD/x86_64-rhel-8.3/100%/debian-10.4-x86_6=
4-20200603.cgz/lkp-csl-2sp5/sockabuse/stress-ng/60s/0x5003006
>>
>> commit:
>>    05091b2b63 ("mm: soft_dirty: fail CLEAR_REFS_SOFT_DIRTY if not built =
into the kernel")
>>    80cb403876 ("sched/fair: skip select_idle_sibling() in presence of sy=
nc wakeups")
>>
>> 05091b2b63b3cf12 80cb403876fc973389d6ea100a3
>> ---------------- ---------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>      526514           -81.3%      98633 =C2=B1  4%  stress-ng.sockabuse.=
ops
>>        8775           -81.3%       1643 =C2=B1  4%  stress-ng.sockabuse.=
ops_per_sec
>>       25444 =C2=B1  5%    +655.9%     192343 =C2=B1  5%  stress-ng.time.=
involuntary_context_switches
>>       17857            -7.4%      16541        stress-ng.time.minor_page=
_faults
>>      794.50 =C2=B1 10%     -84.5%     122.83 =C2=B1  4%  stress-ng.time.=
percent_of_cpu_this_job_got
>>      438.79 =C2=B1  2%     -84.0%      70.36 =C2=B1  3%  stress-ng.time.=
system_time
>>       54.63 =C2=B1 78%     -89.0%       6.03 =C2=B1  4%  stress-ng.time.=
user_time
>>    17248703           -81.7%    3152423 =C2=B1  4%  stress-ng.time.volun=
tary_context_switches
>>       15.00            +1.0%      15.15        boot-time.dhcp
>>        2130 =C2=B1  2%      +4.6%       2227 =C2=B1  2%  boot-time.idle
>>        7803 =C2=B1 10%     -65.8%       2668 =C2=B1 16%  numa-meminfo.no=
de1.Active
>>        7590 =C2=B1 10%     -66.1%       2569 =C2=B1 15%  numa-meminfo.no=
de1.Active(anon)
>>        1897 =C2=B1 10%     -66.1%     642.33 =C2=B1 15%  numa-vmstat.nod=
e1.nr_active_anon
>>        1897 =C2=B1 10%     -66.1%     642.33 =C2=B1 15%  numa-vmstat.nod=
e1.nr_zone_active_anon
>>       88.04            +9.9%      96.75        iostat.cpu.idle
>>       10.86           -72.5%       2.99 =C2=B1  2%  iostat.cpu.system
>>        1.10 =C2=B1 65%     -76.1%       0.26 =C2=B1  2%  iostat.cpu.user
>>        9259 =C2=B1  5%     -53.0%       4355        meminfo.Active
>>        8990 =C2=B1  5%     -54.5%       4086        meminfo.Active(anon)
>>       28602           -17.9%      23477        meminfo.Shmem
>>   1.267e+09 =C2=B1  2%     -99.9%    1651430 =C2=B1  8%  cpuidle.C1.time
>>    14333463           -99.9%      20726 =C2=B1  5%  cpuidle.C1.usage
>>     4336234 =C2=B1 18%     -99.4%      24150 =C2=B1 10%  cpuidle.POLL.ti=
me
>>      412758 =C2=B1 20%     -99.7%       1148 =C2=B1 10%  cpuidle.POLL.us=
age
>>        0.79 =C2=B1  2%      +0.4        1.21        mpstat.cpu.all.irq%
>>        2.14 =C2=B1  2%      -1.8        0.37 =C2=B1  3%  mpstat.cpu.all.=
soft%
>>        7.09            -5.9        1.19 =C2=B1  3%  mpstat.cpu.all.sys%
>>        1.03 =C2=B1 64%      -0.8        0.25 =C2=B1  2%  mpstat.cpu.all.=
usr%
>>       87.67            +9.5%      96.00        vmstat.cpu.id
>>        9.83 =C2=B1 13%     -86.4%       1.33 =C2=B1 35%  vmstat.procs.r
>>      532294           -89.4%      56520 =C2=B1  4%  vmstat.system.cs
>>      201553            -4.5%     192433        vmstat.system.in
>>        3344 =C2=B1  5%     +13.7%       3804 =C2=B1  3%  slabinfo.TCP.ac=
tive_objs
>>        3349 =C2=B1  5%     +13.6%       3805 =C2=B1  3%  slabinfo.TCP.nu=
m_objs
>>       31994            -8.6%      29244        slabinfo.filp.active_objs
>>        2959 =C2=B1  2%     +58.3%       4684 =C2=B1  8%  slabinfo.trace_=
event_file.active_objs
>>        2959 =C2=B1  2%     +58.3%       4684 =C2=B1  8%  slabinfo.trace_=
event_file.num_objs
>>        0.01 =C2=B1 37%    -100.0%       0.00        perf-sched.sch_delay=
.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_6=
4_after_hwframe.[unknown]
>>        0.01 =C2=B1 25%     +88.7%       0.02 =C2=B1 11%  perf-sched.sch_=
delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSC=
ALL_64_after_hwframe.[unknown]
>>      314.00 =C2=B1 11%    +116.0%     678.17 =C2=B1 43%  perf-sched.tota=
l_wait_and_delay.count.ms
>>        0.01 =C2=B1 13%     -87.7%       0.00 =C2=B1223%  perf-sched.wait=
_and_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.cons=
tprop.0.do_select
>>        0.55 =C2=B1 49%    +169.0%       1.48 =C2=B1 77%  perf-sched.wait=
_and_delay.avg.ms.worker_thread.kthread.ret_from_fork
>>        1.50 =C2=B1 33%  +13344.4%     201.67 =C2=B1 79%  perf-sched.wait=
_and_delay.count.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_=
SYSCALL_64_after_hwframe.[unknown]
>>        0.01 =C2=B1 25%    +417.0%       0.05 =C2=B1 87%  perf-sched.wait=
_and_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry=
_SYSCALL_64_after_hwframe.[unknown]
>>        0.01 =C2=B1 13%     -87.7%       0.00 =C2=B1223%  perf-sched.wait=
_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.cons=
tprop.0.do_select
>>        0.13 =C2=B1121%    +700.6%       1.04 =C2=B1 87%  perf-sched.wait=
_time.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>        2247 =C2=B1  5%     -54.6%       1021        proc-vmstat.nr_activ=
e_anon
>>        7151           -17.9%       5869        proc-vmstat.nr_shmem
>>        2247 =C2=B1  5%     -54.6%       1021        proc-vmstat.nr_zone_=
active_anon
>>        5290 =C2=B1 53%     -69.7%       1603 =C2=B1147%  proc-vmstat.num=
a_hint_faults
>>      389745            +4.1%     405820        proc-vmstat.numa_hit
>>      303149            +5.3%     319218        proc-vmstat.numa_local
>>        4850 =C2=B1  7%     -76.7%       1132 =C2=B1  5%  proc-vmstat.pga=
ctivate
>>      443853           +24.4%     552265 =C2=B1  2%  proc-vmstat.pgalloc_=
normal
>>      238244            -3.6%     229720        proc-vmstat.pgfault
>>      298399           +37.6%     410611 =C2=B1  2%  proc-vmstat.pgfree
>>      660.42 =C2=B1 26%     +46.6%     968.17 =C2=B1 10%  sched_debug.cfs=
_rq:/.load_avg.max
>>       33806 =C2=B1 36%     -47.1%      17896 =C2=B1 24%  sched_debug.cfs=
_rq:/.min_vruntime.avg
>>        4724 =C2=B1 17%     -24.1%       3587 =C2=B1  9%  sched_debug.cfs=
_rq:/.min_vruntime.stddev
>>      230.80 =C2=B1 28%     +48.4%     342.61 =C2=B1  5%  sched_debug.cfs=
_rq:/.runnable_avg.stddev
>>        4725 =C2=B1 17%     -24.1%       3587 =C2=B1  9%  sched_debug.cfs=
_rq:/.spread0.stddev
>>      230.26 =C2=B1 27%     +48.2%     341.21 =C2=B1  5%  sched_debug.cfs=
_rq:/.util_avg.stddev
>>      583.83 =C2=B1 29%     +42.5%     832.17        sched_debug.cfs_rq:/=
.util_est_enqueued.max
>>       92.06 =C2=B1 30%     +42.9%     131.53 =C2=B1 21%  sched_debug.cfs=
_rq:/.util_est_enqueued.stddev
>>      524678 =C2=B1 24%     +60.4%     841440 =C2=B1  2%  sched_debug.cpu=
.avg_idle.avg
>>      308.17 =C2=B1 25%     -30.6%     213.73 =C2=B1 28%  sched_debug.cpu=
.curr->pid.avg
>>      826.53 =C2=B1 12%     -19.7%     663.56 =C2=B1 14%  sched_debug.cpu=
.curr->pid.stddev
>>      115976 =C2=B1 69%     -98.8%       1364        sched_debug.cpu.nr_s=
witches.avg
>>       90168 =C2=B1 71%     -99.5%     443.00 =C2=B1 31%  sched_debug.cpu=
.nr_switches.min
>>       15827 =C2=B1 83%     -93.5%       1024 =C2=B1  5%  sched_debug.cpu=
.nr_switches.stddev
>>        9.94           -38.6%       6.10 =C2=B1 12%  perf-stat.i.MPKI
>>   4.414e+09           -77.1%  1.011e+09 =C2=B1  2%  perf-stat.i.branch-i=
nstructions
>>        1.74            +0.2        1.92 =C2=B1  5%  perf-stat.i.branch-m=
iss-rate%
>>    74302215           -71.7%   21003192 =C2=B1  4%  perf-stat.i.branch-m=
isses
>>        5.69 =C2=B1  5%      +8.0       13.74 =C2=B1 13%  perf-stat.i.cac=
he-miss-rate%
>>    11304963 =C2=B1  6%     -65.5%    3905372 =C2=B1  6%  perf-stat.i.cac=
he-misses
>>   2.185e+08           -86.9%   28635626 =C2=B1 10%  perf-stat.i.cache-re=
ferences
>>      550896           -89.4%      58412 =C2=B1  4%  perf-stat.i.context-=
switches
>>   3.285e+10 =C2=B1  7%     -78.2%  7.167e+09 =C2=B1  2%  perf-stat.i.cpu=
-cycles
>>      976.28 =C2=B1 13%     -38.4%     601.54 =C2=B1  3%  perf-stat.i.cpu=
-migrations
>>        2926 =C2=B1  2%     -36.0%       1872 =C2=B1  5%  perf-stat.i.cyc=
les-between-cache-misses
>>      879761 =C2=B1 50%     -69.9%     264507 =C2=B1 75%  perf-stat.i.dTL=
B-load-misses
>>   6.295e+09           -77.7%  1.402e+09 =C2=B1  3%  perf-stat.i.dTLB-loa=
ds
>>       97101 =C2=B1  5%     -57.1%      41624 =C2=B1 57%  perf-stat.i.dTL=
B-store-misses
>>   3.677e+09           -78.7%  7.817e+08 =C2=B1  3%  perf-stat.i.dTLB-sto=
res
>>       73.92            -1.9       72.01        perf-stat.i.iTLB-load-mis=
s-rate%
>>    43356190 =C2=B1  2%     -79.7%    8789163 =C2=B1  4%  perf-stat.i.iTL=
B-load-misses
>>    14401086 =C2=B1  2%     -77.7%    3214173 =C2=B1  2%  perf-stat.i.iTL=
B-loads
>>   2.164e+10           -77.0%  4.973e+09 =C2=B1  2%  perf-stat.i.instruct=
ions
>>      658.11            +3.7%     682.44 =C2=B1  2%  perf-stat.i.instruct=
ions-per-iTLB-miss
>>        0.34 =C2=B1  7%     -78.2%       0.07 =C2=B1  2%  perf-stat.i.met=
ric.GHz
>>        0.55 =C2=B1 48%    +130.0%       1.28 =C2=B1  7%  perf-stat.i.met=
ric.K/sec
>>      152.35           -77.9%      33.63 =C2=B1  3%  perf-stat.i.metric.M=
/sec
>>        3413            -3.8%       3284        perf-stat.i.minor-faults
>>       82.39            +2.1       84.50        perf-stat.i.node-load-mis=
s-rate%
>>     2378991 =C2=B1  6%     -56.2%    1041248 =C2=B1  2%  perf-stat.i.nod=
e-load-misses
>>      499715 =C2=B1  6%     -60.9%     195150 =C2=B1  4%  perf-stat.i.nod=
e-loads
>>       86.96           -10.4       76.52 =C2=B1  2%  perf-stat.i.node-sto=
re-miss-rate%
>>     1805311 =C2=B1  6%     -77.1%     413780 =C2=B1  4%  perf-stat.i.nod=
e-store-misses
>>      235644 =C2=B1 10%     -41.6%     137603 =C2=B1  8%  perf-stat.i.nod=
e-stores
>>        3425            -3.8%       3296        perf-stat.i.page-faults
>>       10.10           -42.9%       5.76 =C2=B1 11%  perf-stat.overall.MP=
KI
>>        1.68            +0.4        2.08 =C2=B1  4%  perf-stat.overall.br=
anch-miss-rate%
>>        5.17 =C2=B1  5%      +8.6       13.82 =C2=B1 13%  perf-stat.overa=
ll.cache-miss-rate%
>>        2904 =C2=B1  3%     -36.6%       1840 =C2=B1  5%  perf-stat.overa=
ll.cycles-between-cache-misses
>>        0.00 =C2=B1  5%      +0.0        0.01 =C2=B1 58%  perf-stat.overa=
ll.dTLB-store-miss-rate%
>>       75.05            -1.8       73.21        perf-stat.overall.iTLB-lo=
ad-miss-rate%
>>      499.41 =C2=B1  2%     +13.4%     566.32        perf-stat.overall.in=
structions-per-iTLB-miss
>>       82.64            +1.6       84.22        perf-stat.overall.node-lo=
ad-miss-rate%
>>       88.41           -13.4       75.02 =C2=B1  2%  perf-stat.overall.no=
de-store-miss-rate%
>>   4.343e+09           -77.1%  9.955e+08 =C2=B1  2%  perf-stat.ps.branch-=
instructions
>>    73120339           -71.7%   20682483 =C2=B1  4%  perf-stat.ps.branch-=
misses
>>    11123479 =C2=B1  6%     -65.4%    3844726 =C2=B1  6%  perf-stat.ps.ca=
che-misses
>>    2.15e+08           -86.9%   28183805 =C2=B1 10%  perf-stat.ps.cache-r=
eferences
>>      541960           -89.4%      57477 =C2=B1  4%  perf-stat.ps.context=
-switches
>>   3.232e+10 =C2=B1  7%     -78.2%  7.055e+09 =C2=B1  2%  perf-stat.ps.cp=
u-cycles
>>      960.49 =C2=B1 13%     -38.4%     591.96 =C2=B1  3%  perf-stat.ps.cp=
u-migrations
>>      865567 =C2=B1 50%     -69.9%     260323 =C2=B1 75%  perf-stat.ps.dT=
LB-load-misses
>>   6.194e+09           -77.7%  1.379e+09 =C2=B1  3%  perf-stat.ps.dTLB-lo=
ads
>>       95569 =C2=B1  5%     -57.1%      40986 =C2=B1 57%  perf-stat.ps.dT=
LB-store-misses
>>   3.618e+09           -78.7%  7.694e+08 =C2=B1  3%  perf-stat.ps.dTLB-st=
ores
>>    42653601 =C2=B1  2%     -79.7%    8648774 =C2=B1  4%  perf-stat.ps.iT=
LB-load-misses
>>    14168190 =C2=B1  2%     -77.7%    3163030 =C2=B1  2%  perf-stat.ps.iT=
LB-loads
>>   2.129e+10           -77.0%  4.895e+09 =C2=B1  2%  perf-stat.ps.instruc=
tions
>>        3363            -3.8%       3234        perf-stat.ps.minor-faults
>>     2340634 =C2=B1  6%     -56.2%    1024819 =C2=B1  2%  perf-stat.ps.no=
de-load-misses
>>      491746 =C2=B1  6%     -60.9%     192112 =C2=B1  4%  perf-stat.ps.no=
de-loads
>>     1776065 =C2=B1  6%     -77.1%     407266 =C2=B1  4%  perf-stat.ps.no=
de-store-misses
>>      232066 =C2=B1 10%     -41.6%     135529 =C2=B1  8%  perf-stat.ps.no=
de-stores
>>        3375            -3.8%       3246        perf-stat.ps.page-faults
>>   1.347e+12           -77.0%  3.097e+11 =C2=B1  2%  perf-stat.total.inst=
ructions
>>      204276 =C2=B1 10%     -80.1%      40639 =C2=B1 16%  softirqs.CPU0.N=
ET_RX
>>      204566 =C2=B1 12%     -82.7%      35293 =C2=B1 20%  softirqs.CPU1.N=
ET_RX
>>      200973 =C2=B1 11%     -80.0%      40129 =C2=B1 22%  softirqs.CPU10.=
NET_RX
>>       14649 =C2=B1  5%     -22.3%      11377 =C2=B1  5%  softirqs.CPU10.=
RCU
>>      193429 =C2=B1 11%     -79.5%      39672 =C2=B1 19%  softirqs.CPU11.=
NET_RX
>>       14216 =C2=B1  5%     -20.2%      11342 =C2=B1  5%  softirqs.CPU11.=
RCU
>>      192097 =C2=B1 13%     -81.1%      36213 =C2=B1 22%  softirqs.CPU12.=
NET_RX
>>       14506 =C2=B1  6%     -22.7%      11216 =C2=B1  3%  softirqs.CPU12.=
RCU
>>      195618 =C2=B1 11%     -83.3%      32757 =C2=B1 20%  softirqs.CPU13.=
NET_RX
>>       14059 =C2=B1  5%     -22.0%      10968 =C2=B1  5%  softirqs.CPU13.=
RCU
>>      201701 =C2=B1 13%     -80.7%      38982 =C2=B1 16%  softirqs.CPU14.=
NET_RX
>>       14322 =C2=B1  6%     -22.7%      11075 =C2=B1  2%  softirqs.CPU14.=
RCU
>>      200512 =C2=B1 14%     -81.9%      36238 =C2=B1 15%  softirqs.CPU15.=
NET_RX
>>       14495 =C2=B1  5%     -24.0%      11023 =C2=B1  4%  softirqs.CPU15.=
RCU
>>      200306 =C2=B1 10%     -81.3%      37444 =C2=B1 24%  softirqs.CPU16.=
NET_RX
>>       14655 =C2=B1  5%     -28.5%      10474 =C2=B1  3%  softirqs.CPU16.=
RCU
>>      199288 =C2=B1  9%     -80.8%      38303 =C2=B1 21%  softirqs.CPU17.=
NET_RX
>>       14444 =C2=B1  6%     -27.5%      10469 =C2=B1  3%  softirqs.CPU17.=
RCU
>>      194256 =C2=B1 13%     -78.9%      41023 =C2=B1 22%  softirqs.CPU18.=
NET_RX
>>       14563 =C2=B1  6%     -26.9%      10651 =C2=B1  5%  softirqs.CPU18.=
RCU
>>      188424 =C2=B1 12%     -78.8%      39936 =C2=B1 19%  softirqs.CPU19.=
NET_RX
>>       14266 =C2=B1  5%     -25.7%      10606 =C2=B1  4%  softirqs.CPU19.=
RCU
>>      205211 =C2=B1 11%     -80.8%      39403 =C2=B1 19%  softirqs.CPU2.N=
ET_RX
>>       15042 =C2=B1  6%     -23.5%      11511 =C2=B1  3%  softirqs.CPU2.R=
CU
>>      194184 =C2=B1  9%     -78.9%      41058 =C2=B1 20%  softirqs.CPU20.=
NET_RX
>>       14222 =C2=B1  4%     -25.2%      10632 =C2=B1  3%  softirqs.CPU20.=
RCU
>>      193132 =C2=B1 11%     -79.6%      39477 =C2=B1 32%  softirqs.CPU21.=
NET_RX
>>       14400 =C2=B1  6%     -25.4%      10748 =C2=B1 10%  softirqs.CPU21.=
RCU
>>      191023 =C2=B1 11%     -79.5%      39089 =C2=B1 12%  softirqs.CPU22.=
NET_RX
>>       15013 =C2=B1 14%     -29.1%      10649 =C2=B1  3%  softirqs.CPU22.=
RCU
>>      191291 =C2=B1 12%     -78.7%      40739 =C2=B1 14%  softirqs.CPU23.=
NET_RX
>>       14415 =C2=B1  6%     -24.1%      10938 =C2=B1  5%  softirqs.CPU23.=
RCU
>>      213932 =C2=B1  6%     -86.5%      28975 =C2=B1 17%  softirqs.CPU24.=
NET_RX
>>       15541 =C2=B1  4%     -31.0%      10722 =C2=B1  4%  softirqs.CPU24.=
RCU
>>      226264 =C2=B1  6%     -86.5%      30448 =C2=B1 12%  softirqs.CPU25.=
NET_RX
>>       15333 =C2=B1  5%     -33.0%      10268 =C2=B1  5%  softirqs.CPU25.=
RCU
>>      218129 =C2=B1  7%     -85.4%      31891 =C2=B1 21%  softirqs.CPU26.=
NET_RX
>>       15106 =C2=B1  3%     -28.7%      10765 =C2=B1  7%  softirqs.CPU26.=
RCU
>>      223067 =C2=B1  8%     -86.5%      30225 =C2=B1 23%  softirqs.CPU27.=
NET_RX
>>       15388 =C2=B1  5%     -33.5%      10239 =C2=B1  3%  softirqs.CPU27.=
RCU
>>      223385 =C2=B1  9%     -87.5%      28021 =C2=B1 14%  softirqs.CPU28.=
NET_RX
>>       15324 =C2=B1  4%     -33.6%      10174 =C2=B1  3%  softirqs.CPU28.=
RCU
>>      219898 =C2=B1  6%     -86.2%      30328 =C2=B1 12%  softirqs.CPU29.=
NET_RX
>>       15386 =C2=B1  3%     -31.7%      10509 =C2=B1  5%  softirqs.CPU29.=
RCU
>>      200741 =C2=B1 13%     -80.6%      39007 =C2=B1 12%  softirqs.CPU3.N=
ET_RX
>>       15319 =C2=B1  7%     -26.5%      11253 =C2=B1  3%  softirqs.CPU3.R=
CU
>>      210466 =C2=B1  7%     -85.7%      30180 =C2=B1  9%  softirqs.CPU30.=
NET_RX
>>       15146 =C2=B1  4%     -32.9%      10160 =C2=B1  3%  softirqs.CPU30.=
RCU
>>      218446 =C2=B1  7%     -86.8%      28878 =C2=B1 19%  softirqs.CPU31.=
NET_RX
>>       14893 =C2=B1  4%     -32.9%       9998 =C2=B1  4%  softirqs.CPU31.=
RCU
>>      223574 =C2=B1  8%     -86.2%      30809 =C2=B1 18%  softirqs.CPU32.=
NET_RX
>>       14930 =C2=B1  6%     -26.9%      10920 =C2=B1 11%  softirqs.CPU32.=
RCU
>>      223764 =C2=B1 13%     -86.7%      29666 =C2=B1 17%  softirqs.CPU33.=
NET_RX
>>       15279 =C2=B1  7%     -27.6%      11063 =C2=B1  4%  softirqs.CPU33.=
RCU
>>      225171 =C2=B1  8%     -86.2%      31118 =C2=B1 14%  softirqs.CPU34.=
NET_RX
>>       15521 =C2=B1  5%     -27.7%      11227 =C2=B1  5%  softirqs.CPU34.=
RCU
>>      223481 =C2=B1 11%     -83.9%      35968 =C2=B1 13%  softirqs.CPU35.=
NET_RX
>>       15498 =C2=B1  7%     -24.7%      11667 =C2=B1  4%  softirqs.CPU35.=
RCU
>>      220914 =C2=B1 10%     -84.6%      33988 =C2=B1 11%  softirqs.CPU36.=
NET_RX
>>       15153 =C2=B1  5%     -25.1%      11350 =C2=B1  5%  softirqs.CPU36.=
RCU
>>      224403 =C2=B1  7%     -84.3%      35336 =C2=B1  8%  softirqs.CPU37.=
NET_RX
>>       15289 =C2=B1  4%     -25.9%      11325 =C2=B1  5%  softirqs.CPU37.=
RCU
>>      222302 =C2=B1 10%     -85.9%      31417 =C2=B1  9%  softirqs.CPU38.=
NET_RX
>>       15032 =C2=B1  5%     -25.7%      11171 =C2=B1  4%  softirqs.CPU38.=
RCU
>>      225678 =C2=B1 11%     -85.3%      33065 =C2=B1 14%  softirqs.CPU39.=
NET_RX
>>       15437 =C2=B1  5%     -26.6%      11334 =C2=B1  4%  softirqs.CPU39.=
RCU
>>      200358 =C2=B1 15%     -79.8%      40502 =C2=B1 16%  softirqs.CPU4.N=
ET_RX
>>       14869 =C2=B1  5%     -21.3%      11705 =C2=B1  6%  softirqs.CPU4.R=
CU
>>      223515 =C2=B1 10%     -86.1%      31141 =C2=B1 11%  softirqs.CPU40.=
NET_RX
>>       15422 =C2=B1  5%     -25.1%      11551 =C2=B1  4%  softirqs.CPU40.=
RCU
>>      220029 =C2=B1 10%     -86.2%      30466 =C2=B1 19%  softirqs.CPU41.=
NET_RX
>>       15348 =C2=B1  7%     -25.9%      11376 =C2=B1  4%  softirqs.CPU41.=
RCU
>>      216303 =C2=B1 11%     -86.2%      29744 =C2=B1  5%  softirqs.CPU42.=
NET_RX
>>       15001 =C2=B1  6%     -24.9%      11265 =C2=B1  4%  softirqs.CPU42.=
RCU
>>      220377 =C2=B1  9%     -86.2%      30340 =C2=B1 19%  softirqs.CPU43.=
NET_RX
>>       15217 =C2=B1  5%     -26.2%      11234 =C2=B1  2%  softirqs.CPU43.=
RCU
>>      216644 =C2=B1  9%     -86.3%      29781 =C2=B1 12%  softirqs.CPU44.=
NET_RX
>>       15029 =C2=B1  6%     -25.7%      11169 =C2=B1  4%  softirqs.CPU44.=
RCU
>>      216718 =C2=B1 13%     -86.3%      29735 =C2=B1 23%  softirqs.CPU45.=
NET_RX
>>       14981 =C2=B1  6%     -26.0%      11088 =C2=B1  4%  softirqs.CPU45.=
RCU
>>      221886 =C2=B1 10%     -85.9%      31276 =C2=B1 11%  softirqs.CPU46.=
NET_RX
>>       15645 =C2=B1  5%     -30.4%      10895 =C2=B1  9%  softirqs.CPU46.=
RCU
>>      216760 =C2=B1 11%     -85.4%      31583 =C2=B1 24%  softirqs.CPU47.=
NET_RX
>>       15380 =C2=B1  5%     -25.7%      11422 =C2=B1  9%  softirqs.CPU47.=
RCU
>>      191137 =C2=B1 12%     -79.3%      39552 =C2=B1 18%  softirqs.CPU48.=
NET_RX
>>      195579 =C2=B1 11%     -79.3%      40407 =C2=B1 17%  softirqs.CPU49.=
NET_RX
>>       14355 =C2=B1  5%     -29.8%      10076 =C2=B1  9%  softirqs.CPU49.=
RCU
>>      193922 =C2=B1 15%     -79.4%      39908 =C2=B1 18%  softirqs.CPU5.N=
ET_RX
>>       14482 =C2=B1  7%     -22.0%      11296 =C2=B1  7%  softirqs.CPU5.R=
CU
>>      197105 =C2=B1 13%     -80.7%      38036 =C2=B1 15%  softirqs.CPU50.=
NET_RX
>>       14177 =C2=B1  7%     -23.8%      10804 =C2=B1  8%  softirqs.CPU50.=
RCU
>>      198348 =C2=B1 11%     -82.4%      34986 =C2=B1 14%  softirqs.CPU51.=
NET_RX
>>       14565 =C2=B1  6%     -23.3%      11175 =C2=B1  4%  softirqs.CPU51.=
RCU
>>      193489 =C2=B1 11%     -80.6%      37528 =C2=B1 22%  softirqs.CPU52.=
NET_RX
>>       14436 =C2=B1  6%     -23.0%      11115 =C2=B1  4%  softirqs.CPU52.=
RCU
>>      191148 =C2=B1 13%     -80.3%      37572 =C2=B1  7%  softirqs.CPU53.=
NET_RX
>>       14325 =C2=B1  7%     -22.0%      11179 =C2=B1  4%  softirqs.CPU53.=
RCU
>>      187166 =C2=B1 14%     -80.3%      36913 =C2=B1 16%  softirqs.CPU54.=
NET_RX
>>       14436 =C2=B1  6%     -22.9%      11126 =C2=B1  4%  softirqs.CPU54.=
RCU
>>      194125 =C2=B1 14%     -83.4%      32271 =C2=B1 14%  softirqs.CPU55.=
NET_RX
>>       14065 =C2=B1  6%     -23.7%      10729 =C2=B1  4%  softirqs.CPU55.=
RCU
>>      194516 =C2=B1 14%     -81.1%      36852 =C2=B1 17%  softirqs.CPU56.=
NET_RX
>>       13992 =C2=B1  6%     -20.5%      11125 =C2=B1  4%  softirqs.CPU56.=
RCU
>>      186688 =C2=B1 16%     -79.9%      37589 =C2=B1 21%  softirqs.CPU57.=
NET_RX
>>       13771 =C2=B1  6%     -18.4%      11238 =C2=B1  7%  softirqs.CPU57.=
RCU
>>      190417 =C2=B1 16%     -80.4%      37412 =C2=B1 28%  softirqs.CPU58.=
NET_RX
>>       14280 =C2=B1  7%     -22.5%      11064 =C2=B1  6%  softirqs.CPU58.=
RCU
>>      182918 =C2=B1 18%     -78.7%      38887 =C2=B1 18%  softirqs.CPU59.=
NET_RX
>>       14172 =C2=B1  8%     -20.9%      11210 =C2=B1  2%  softirqs.CPU59.=
RCU
>>      191866 =C2=B1 12%     -78.4%      41365 =C2=B1 16%  softirqs.CPU6.N=
ET_RX
>>       14301 =C2=B1  6%     -19.2%      11549 =C2=B1  6%  softirqs.CPU6.R=
CU
>>      184545 =C2=B1 17%     -80.8%      35472 =C2=B1 24%  softirqs.CPU60.=
NET_RX
>>       14104 =C2=B1  7%     -20.3%      11239 =C2=B1  4%  softirqs.CPU60.=
RCU
>>      190976 =C2=B1 14%     -83.5%      31440 =C2=B1 19%  softirqs.CPU61.=
NET_RX
>>       13933 =C2=B1  6%     -24.1%      10569 =C2=B1  3%  softirqs.CPU61.=
RCU
>>      192008 =C2=B1 13%     -82.0%      34534 =C2=B1 18%  softirqs.CPU62.=
NET_RX
>>       13708 =C2=B1  6%     -23.2%      10532 =C2=B1  3%  softirqs.CPU62.=
RCU
>>      194234 =C2=B1 10%     -82.8%      33364 =C2=B1 13%  softirqs.CPU63.=
NET_RX
>>       14348 =C2=B1  4%     -25.2%      10735 =C2=B1  3%  softirqs.CPU63.=
RCU
>>      198239 =C2=B1 12%     -82.1%      35409 =C2=B1 21%  softirqs.CPU64.=
NET_RX
>>       14459 =C2=B1  5%     -28.1%      10399 =C2=B1  3%  softirqs.CPU64.=
RCU
>>      193022 =C2=B1 13%     -79.5%      39665 =C2=B1 20%  softirqs.CPU65.=
NET_RX
>>       14131 =C2=B1  6%     -24.4%      10676 =C2=B1  6%  softirqs.CPU65.=
RCU
>>      186531 =C2=B1 13%     -79.6%      38127 =C2=B1 26%  softirqs.CPU66.=
NET_RX
>>       14467 =C2=B1  7%     -25.1%      10836 =C2=B1  5%  softirqs.CPU66.=
RCU
>>      196085 =C2=B1 14%     -81.3%      36572 =C2=B1 23%  softirqs.CPU67.=
NET_RX
>>       14462 =C2=B1  6%     -28.0%      10406 =C2=B1  5%  softirqs.CPU67.=
RCU
>>      196879 =C2=B1 18%     -80.8%      37760 =C2=B1 23%  softirqs.CPU68.=
NET_RX
>>       14690 =C2=B1 10%     -27.0%      10724 =C2=B1  3%  softirqs.CPU68.=
RCU
>>      197696 =C2=B1 17%     -81.0%      37546 =C2=B1 21%  softirqs.CPU69.=
NET_RX
>>       14428 =C2=B1  9%     -28.8%      10274 =C2=B1  2%  softirqs.CPU69.=
RCU
>>      192465 =C2=B1 14%     -81.4%      35856 =C2=B1 14%  softirqs.CPU7.N=
ET_RX
>>       14356 =C2=B1  5%     -24.5%      10844 =C2=B1  7%  softirqs.CPU7.R=
CU
>>      192564 =C2=B1 15%     -79.0%      40510 =C2=B1 13%  softirqs.CPU70.=
NET_RX
>>       14204 =C2=B1  6%     -25.3%      10614 =C2=B1  2%  softirqs.CPU70.=
RCU
>>      198843 =C2=B1 16%     -81.0%      37774 =C2=B1 15%  softirqs.CPU71.=
NET_RX
>>       14738 =C2=B1  7%     -28.3%      10573 =C2=B1  3%  softirqs.CPU71.=
RCU
>>      204456 =C2=B1 11%     -86.7%      27134 =C2=B1 13%  softirqs.CPU72.=
NET_RX
>>       15190 =C2=B1  5%     -33.4%      10116 =C2=B1  2%  softirqs.CPU72.=
RCU
>>      218493 =C2=B1 12%     -86.9%      28680 =C2=B1 15%  softirqs.CPU73.=
NET_RX
>>       14743 =C2=B1  7%     -32.9%       9899 =C2=B1  2%  softirqs.CPU73.=
RCU
>>      223714 =C2=B1 11%     -86.6%      29902 =C2=B1 16%  softirqs.CPU74.=
NET_RX
>>       15211 =C2=B1  6%     -34.4%       9972 =C2=B1  3%  softirqs.CPU74.=
RCU
>>      214778 =C2=B1 12%     -87.3%      27368 =C2=B1 20%  softirqs.CPU75.=
NET_RX
>>       14766 =C2=B1  6%     -28.9%      10496 =C2=B1  6%  softirqs.CPU75.=
RCU
>>      221198 =C2=B1 12%     -88.4%      25760 =C2=B1  9%  softirqs.CPU76.=
NET_RX
>>       15607 =C2=B1  8%     -35.4%      10078 =C2=B1  5%  softirqs.CPU76.=
RCU
>>      207277 =C2=B1 11%     -86.1%      28790 =C2=B1 12%  softirqs.CPU77.=
NET_RX
>>       14832 =C2=B1  6%     -31.2%      10203 =C2=B1  3%  softirqs.CPU77.=
RCU
>>      209163 =C2=B1  9%     -86.5%      28255 =C2=B1  8%  softirqs.CPU78.=
NET_RX
>>       14930 =C2=B1  4%     -32.7%      10041        softirqs.CPU78.RCU
>>      213370 =C2=B1 11%     -86.6%      28597 =C2=B1 13%  softirqs.CPU79.=
NET_RX
>>       14645 =C2=B1  6%     -33.0%       9813 =C2=B1  3%  softirqs.CPU79.=
RCU
>>      193444 =C2=B1 12%     -82.5%      33798 =C2=B1 20%  softirqs.CPU8.N=
ET_RX
>>       14265 =C2=B1  6%     -24.5%      10769 =C2=B1  7%  softirqs.CPU8.R=
CU
>>      220156 =C2=B1 13%     -87.6%      27319 =C2=B1 30%  softirqs.CPU80.=
NET_RX
>>       14935 =C2=B1  7%     -28.9%      10625 =C2=B1  7%  softirqs.CPU80.=
RCU
>>      218483 =C2=B1 15%     -86.6%      29281 =C2=B1 19%  softirqs.CPU81.=
NET_RX
>>       15018 =C2=B1  7%     -28.6%      10719 =C2=B1  4%  softirqs.CPU81.=
RCU
>>      213804 =C2=B1 11%     -85.6%      30878 =C2=B1 13%  softirqs.CPU82.=
NET_RX
>>       15245 =C2=B1  5%     -27.2%      11094 =C2=B1  2%  softirqs.CPU82.=
RCU
>>      208828 =C2=B1 11%     -85.6%      30119 =C2=B1 16%  softirqs.CPU83.=
NET_RX
>>       14827 =C2=B1  6%     -24.9%      11140 =C2=B1  5%  softirqs.CPU83.=
RCU
>>      215657 =C2=B1 11%     -85.3%      31665 =C2=B1 14%  softirqs.CPU84.=
NET_RX
>>       15341 =C2=B1  6%     -27.1%      11188 =C2=B1  4%  softirqs.CPU84.=
RCU
>>      218553 =C2=B1 13%     -85.6%      31560 =C2=B1 16%  softirqs.CPU85.=
NET_RX
>>       14826 =C2=B1  7%     -27.4%      10762 =C2=B1  6%  softirqs.CPU85.=
RCU
>>      214946 =C2=B1 11%     -85.7%      30704 =C2=B1  7%  softirqs.CPU86.=
NET_RX
>>       14901 =C2=B1  6%     -26.3%      10982 =C2=B1  4%  softirqs.CPU86.=
RCU
>>      212016 =C2=B1  9%     -84.6%      32592 =C2=B1  9%  softirqs.CPU87.=
NET_RX
>>       14629 =C2=B1  4%     -21.5%      11484 =C2=B1  5%  softirqs.CPU87.=
RCU
>>      218771 =C2=B1  9%     -88.8%      24419 =C2=B1 18%  softirqs.CPU88.=
NET_RX
>>       15263 =C2=B1  4%     -30.2%      10648 =C2=B1  4%  softirqs.CPU88.=
RCU
>>      214889 =C2=B1 10%     -86.7%      28655 =C2=B1 15%  softirqs.CPU89.=
NET_RX
>>       15230 =C2=B1  3%     -25.7%      11315 =C2=B1  4%  softirqs.CPU89.=
RCU
>>      199432 =C2=B1 11%     -79.2%      41399 =C2=B1 24%  softirqs.CPU9.N=
ET_RX
>>       14474 =C2=B1  6%     -21.7%      11330 =C2=B1  9%  softirqs.CPU9.R=
CU
>>      220600 =C2=B1 11%     -86.6%      29617 =C2=B1  9%  softirqs.CPU90.=
NET_RX
>>       14842 =C2=B1  4%     -27.9%      10698 =C2=B1  4%  softirqs.CPU90.=
RCU
>>      215116 =C2=B1 13%     -85.9%      30430 =C2=B1 17%  softirqs.CPU91.=
NET_RX
>>       15470 =C2=B1 10%     -28.9%      11005 =C2=B1  5%  softirqs.CPU91.=
RCU
>>      216060 =C2=B1 13%     -87.2%      27656 =C2=B1 19%  softirqs.CPU92.=
NET_RX
>>       15021 =C2=B1  8%     -27.3%      10928 =C2=B1  6%  softirqs.CPU92.=
RCU
>>      223485 =C2=B1 13%     -88.1%      26696 =C2=B1 19%  softirqs.CPU93.=
NET_RX
>>       15207 =C2=B1  6%     -29.1%      10787 =C2=B1  5%  softirqs.CPU93.=
RCU
>>      215588 =C2=B1 10%     -86.7%      28628 =C2=B1 11%  softirqs.CPU94.=
NET_RX
>>       14928 =C2=B1  5%     -26.5%      10968 =C2=B1  5%  softirqs.CPU94.=
RCU
>>      211339 =C2=B1  7%     -86.1%      29458 =C2=B1 20%  softirqs.CPU95.=
NET_RX
>>       14795 =C2=B1  5%     -24.9%      11114 =C2=B1  4%  softirqs.CPU95.=
RCU
>>    19812686           -83.6%    3253019 =C2=B1  4%  softirqs.NET_RX
>>     1422322           -26.2%    1049108        softirqs.RCU
>>       25154           -39.8%      15145 =C2=B1  2%  softirqs.TIMER
>>      139150 =C2=B1 14%     -62.6%      52019        interrupts.CAL:Funct=
ion_call_interrupts
>>        1149 =C2=B1 30%     -81.1%     217.83 =C2=B1 42%  interrupts.CPU0=
.NMI:Non-maskable_interrupts
>>        1149 =C2=B1 30%     -81.1%     217.83 =C2=B1 42%  interrupts.CPU0=
.PMI:Performance_monitoring_interrupts
>>      519.00 =C2=B1 17%     -98.8%       6.00 =C2=B1 48%  interrupts.CPU0=
.RES:Rescheduling_interrupts
>>        1419 =C2=B1 19%     -80.4%     277.83 =C2=B1 30%  interrupts.CPU1=
.NMI:Non-maskable_interrupts
>>        1419 =C2=B1 19%     -80.4%     277.83 =C2=B1 30%  interrupts.CPU1=
.PMI:Performance_monitoring_interrupts
>>      514.83 =C2=B1 10%     -98.0%      10.50 =C2=B1 92%  interrupts.CPU1=
.RES:Rescheduling_interrupts
>>        1558 =C2=B1 20%     -68.7%     488.17 =C2=B1 15%  interrupts.CPU1=
0.CAL:Function_call_interrupts
>>        1406 =C2=B1 14%     -80.0%     281.00 =C2=B1 35%  interrupts.CPU1=
0.NMI:Non-maskable_interrupts
>>        1406 =C2=B1 14%     -80.0%     281.00 =C2=B1 35%  interrupts.CPU1=
0.PMI:Performance_monitoring_interrupts
>>      504.67 =C2=B1 14%     -99.0%       5.00 =C2=B1 47%  interrupts.CPU1=
0.RES:Rescheduling_interrupts
>>        1421 =C2=B1 16%     -63.1%     524.67        interrupts.CPU11.CAL=
:Function_call_interrupts
>>        1252 =C2=B1 28%     -75.1%     312.33 =C2=B1 37%  interrupts.CPU1=
1.NMI:Non-maskable_interrupts
>>        1252 =C2=B1 28%     -75.1%     312.33 =C2=B1 37%  interrupts.CPU1=
1.PMI:Performance_monitoring_interrupts
>>      466.00 =C2=B1 12%     -99.1%       4.00 =C2=B1 25%  interrupts.CPU1=
1.RES:Rescheduling_interrupts
>>        1489 =C2=B1 15%     -65.1%     519.67        interrupts.CPU12.CAL=
:Function_call_interrupts
>>        1416 =C2=B1 17%     -86.6%     189.17 =C2=B1 21%  interrupts.CPU1=
2.NMI:Non-maskable_interrupts
>>        1416 =C2=B1 17%     -86.6%     189.17 =C2=B1 21%  interrupts.CPU1=
2.PMI:Performance_monitoring_interrupts
>>      501.00 =C2=B1 11%     -99.0%       4.83 =C2=B1 40%  interrupts.CPU1=
2.RES:Rescheduling_interrupts
>>        1394 =C2=B1 16%     -62.9%     517.50        interrupts.CPU13.CAL=
:Function_call_interrupts
>>        1287 =C2=B1 24%     -86.4%     175.67 =C2=B1 34%  interrupts.CPU1=
3.NMI:Non-maskable_interrupts
>>        1287 =C2=B1 24%     -86.4%     175.67 =C2=B1 34%  interrupts.CPU1=
3.PMI:Performance_monitoring_interrupts
>>      466.33 =C2=B1 14%     -99.0%       4.83 =C2=B1 98%  interrupts.CPU1=
3.RES:Rescheduling_interrupts
>>        1412 =C2=B1 15%     -63.2%     519.67        interrupts.CPU14.CAL=
:Function_call_interrupts
>>        1190 =C2=B1 36%     -84.1%     189.17 =C2=B1 36%  interrupts.CPU1=
4.NMI:Non-maskable_interrupts
>>        1190 =C2=B1 36%     -84.1%     189.17 =C2=B1 36%  interrupts.CPU1=
4.PMI:Performance_monitoring_interrupts
>>      474.50 =C2=B1 17%     -99.2%       4.00 =C2=B1 57%  interrupts.CPU1=
4.RES:Rescheduling_interrupts
>>        1354 =C2=B1 16%     -62.2%     511.33 =C2=B1  7%  interrupts.CPU1=
5.CAL:Function_call_interrupts
>>        1127 =C2=B1 23%     -78.9%     237.33 =C2=B1 35%  interrupts.CPU1=
5.NMI:Non-maskable_interrupts
>>        1127 =C2=B1 23%     -78.9%     237.33 =C2=B1 35%  interrupts.CPU1=
5.PMI:Performance_monitoring_interrupts
>>      510.67 =C2=B1 17%     -98.8%       6.00 =C2=B1 73%  interrupts.CPU1=
5.RES:Rescheduling_interrupts
>>        1432 =C2=B1 25%     -63.9%     517.67        interrupts.CPU16.CAL=
:Function_call_interrupts
>>        1117 =C2=B1 38%     -80.2%     221.67 =C2=B1 42%  interrupts.CPU1=
6.NMI:Non-maskable_interrupts
>>        1117 =C2=B1 38%     -80.2%     221.67 =C2=B1 42%  interrupts.CPU1=
6.PMI:Performance_monitoring_interrupts
>>      487.33 =C2=B1 14%     -99.0%       4.83 =C2=B1 52%  interrupts.CPU1=
6.RES:Rescheduling_interrupts
>>        1427 =C2=B1 11%     -63.1%     527.17        interrupts.CPU17.CAL=
:Function_call_interrupts
>>        1215 =C2=B1 35%     -77.7%     270.67 =C2=B1 32%  interrupts.CPU1=
7.NMI:Non-maskable_interrupts
>>        1215 =C2=B1 35%     -77.7%     270.67 =C2=B1 32%  interrupts.CPU1=
7.PMI:Performance_monitoring_interrupts
>>      478.33 =C2=B1 11%     -98.4%       7.50 =C2=B1 49%  interrupts.CPU1=
7.RES:Rescheduling_interrupts
>>        1572 =C2=B1 26%     -66.2%     530.67 =C2=B1  3%  interrupts.CPU1=
8.CAL:Function_call_interrupts
>>        1093 =C2=B1 48%     -73.2%     293.33 =C2=B1 34%  interrupts.CPU1=
8.NMI:Non-maskable_interrupts
>>        1093 =C2=B1 48%     -73.2%     293.33 =C2=B1 34%  interrupts.CPU1=
8.PMI:Performance_monitoring_interrupts
>>      481.17 =C2=B1 16%     -98.5%       7.17 =C2=B1114%  interrupts.CPU1=
8.RES:Rescheduling_interrupts
>>        1363 =C2=B1 16%     -61.6%     523.33 =C2=B1  2%  interrupts.CPU1=
9.CAL:Function_call_interrupts
>>        1159 =C2=B1 33%     -75.5%     284.33 =C2=B1 39%  interrupts.CPU1=
9.NMI:Non-maskable_interrupts
>>        1159 =C2=B1 33%     -75.5%     284.33 =C2=B1 39%  interrupts.CPU1=
9.PMI:Performance_monitoring_interrupts
>>      474.67 =C2=B1 15%     -98.8%       5.67 =C2=B1 50%  interrupts.CPU1=
9.RES:Rescheduling_interrupts
>>        1463 =C2=B1 17%     -85.0%     219.50 =C2=B1 37%  interrupts.CPU2=
.NMI:Non-maskable_interrupts
>>        1463 =C2=B1 17%     -85.0%     219.50 =C2=B1 37%  interrupts.CPU2=
.PMI:Performance_monitoring_interrupts
>>      502.50 =C2=B1 21%     -98.4%       8.17 =C2=B1 61%  interrupts.CPU2=
.RES:Rescheduling_interrupts
>>        1364 =C2=B1 21%     -61.6%     524.33        interrupts.CPU20.CAL=
:Function_call_interrupts
>>        1165 =C2=B1 30%     -75.3%     288.50 =C2=B1 32%  interrupts.CPU2=
0.NMI:Non-maskable_interrupts
>>        1165 =C2=B1 30%     -75.3%     288.50 =C2=B1 32%  interrupts.CPU2=
0.PMI:Performance_monitoring_interrupts
>>      474.17 =C2=B1  9%     -98.4%       7.50 =C2=B1 46%  interrupts.CPU2=
0.RES:Rescheduling_interrupts
>>        1398 =C2=B1 14%     -62.5%     524.33        interrupts.CPU21.CAL=
:Function_call_interrupts
>>        1143 =C2=B1 34%     -72.2%     317.50 =C2=B1 34%  interrupts.CPU2=
1.NMI:Non-maskable_interrupts
>>        1143 =C2=B1 34%     -72.2%     317.50 =C2=B1 34%  interrupts.CPU2=
1.PMI:Performance_monitoring_interrupts
>>      466.83 =C2=B1 14%     -98.9%       5.00 =C2=B1 63%  interrupts.CPU2=
1.RES:Rescheduling_interrupts
>>        1423 =C2=B1 16%     -62.9%     527.83 =C2=B1  2%  interrupts.CPU2=
2.CAL:Function_call_interrupts
>>        1283 =C2=B1 29%     -80.1%     255.83 =C2=B1 38%  interrupts.CPU2=
2.NMI:Non-maskable_interrupts
>>        1283 =C2=B1 29%     -80.1%     255.83 =C2=B1 38%  interrupts.CPU2=
2.PMI:Performance_monitoring_interrupts
>>      443.83 =C2=B1 12%     -98.8%       5.33 =C2=B1 42%  interrupts.CPU2=
2.RES:Rescheduling_interrupts
>>        1435 =C2=B1 19%     -63.4%     525.67 =C2=B1  2%  interrupts.CPU2=
3.CAL:Function_call_interrupts
>>        1382 =C2=B1 18%     -81.2%     259.67 =C2=B1 29%  interrupts.CPU2=
3.NMI:Non-maskable_interrupts
>>        1382 =C2=B1 18%     -81.2%     259.67 =C2=B1 29%  interrupts.CPU2=
3.PMI:Performance_monitoring_interrupts
>>      477.00 =C2=B1 17%     -99.3%       3.17 =C2=B1 46%  interrupts.CPU2=
3.RES:Rescheduling_interrupts
>>        1427 =C2=B1 18%     -63.7%     517.83        interrupts.CPU24.CAL=
:Function_call_interrupts
>>        1446 =C2=B1 10%     -83.9%     232.50 =C2=B1 23%  interrupts.CPU2=
4.NMI:Non-maskable_interrupts
>>        1446 =C2=B1 10%     -83.9%     232.50 =C2=B1 23%  interrupts.CPU2=
4.PMI:Performance_monitoring_interrupts
>>      615.17 =C2=B1 10%     -99.3%       4.50 =C2=B1 37%  interrupts.CPU2=
4.RES:Rescheduling_interrupts
>>        1383 =C2=B1 18%     -62.3%     520.83        interrupts.CPU25.CAL=
:Function_call_interrupts
>>        1213 =C2=B1 29%     -82.3%     215.00 =C2=B1 26%  interrupts.CPU2=
5.NMI:Non-maskable_interrupts
>>        1213 =C2=B1 29%     -82.3%     215.00 =C2=B1 26%  interrupts.CPU2=
5.PMI:Performance_monitoring_interrupts
>>      545.33 =C2=B1  6%     -99.0%       5.33 =C2=B1 25%  interrupts.CPU2=
5.RES:Rescheduling_interrupts
>>        1587 =C2=B1 15%     -70.2%     473.33 =C2=B1 14%  interrupts.CPU2=
6.CAL:Function_call_interrupts
>>        1211 =C2=B1 30%     -80.4%     237.00 =C2=B1 40%  interrupts.CPU2=
6.NMI:Non-maskable_interrupts
>>        1211 =C2=B1 30%     -80.4%     237.00 =C2=B1 40%  interrupts.CPU2=
6.PMI:Performance_monitoring_interrupts
>>      515.33 =C2=B1 12%     -99.4%       3.33 =C2=B1 68%  interrupts.CPU2=
6.RES:Rescheduling_interrupts
>>        1432 =C2=B1 22%     -63.7%     519.50        interrupts.CPU27.CAL=
:Function_call_interrupts
>>        1278 =C2=B1 25%     -77.4%     288.83 =C2=B1 31%  interrupts.CPU2=
7.NMI:Non-maskable_interrupts
>>        1278 =C2=B1 25%     -77.4%     288.83 =C2=B1 31%  interrupts.CPU2=
7.PMI:Performance_monitoring_interrupts
>>      572.33 =C2=B1 11%     -99.5%       2.67 =C2=B1 73%  interrupts.CPU2=
7.RES:Rescheduling_interrupts
>>        1432 =C2=B1 12%     -65.7%     491.17 =C2=B1 15%  interrupts.CPU2=
8.CAL:Function_call_interrupts
>>        1127 =C2=B1 35%     -78.2%     245.33 =C2=B1 22%  interrupts.CPU2=
8.NMI:Non-maskable_interrupts
>>        1127 =C2=B1 35%     -78.2%     245.33 =C2=B1 22%  interrupts.CPU2=
8.PMI:Performance_monitoring_interrupts
>>      564.50 =C2=B1 10%     -99.4%       3.67 =C2=B1 64%  interrupts.CPU2=
8.RES:Rescheduling_interrupts
>>        1466 =C2=B1 10%     -64.5%     520.67        interrupts.CPU29.CAL=
:Function_call_interrupts
>>        1246 =C2=B1 31%     -80.6%     241.17 =C2=B1 17%  interrupts.CPU2=
9.NMI:Non-maskable_interrupts
>>        1246 =C2=B1 31%     -80.6%     241.17 =C2=B1 17%  interrupts.CPU2=
9.PMI:Performance_monitoring_interrupts
>>      558.00 =C2=B1  9%     -99.4%       3.33 =C2=B1 80%  interrupts.CPU2=
9.RES:Rescheduling_interrupts
>>        1594 =C2=B1 25%     -49.6%     803.67 =C2=B1 47%  interrupts.CPU3=
.CAL:Function_call_interrupts
>>        1442 =C2=B1 17%     -82.5%     252.17 =C2=B1 41%  interrupts.CPU3=
.NMI:Non-maskable_interrupts
>>        1442 =C2=B1 17%     -82.5%     252.17 =C2=B1 41%  interrupts.CPU3=
.PMI:Performance_monitoring_interrupts
>>      486.83 =C2=B1 14%     -98.8%       5.83 =C2=B1 58%  interrupts.CPU3=
.RES:Rescheduling_interrupts
>>        1460 =C2=B1 14%     -64.4%     520.33        interrupts.CPU30.CAL=
:Function_call_interrupts
>>        1406 =C2=B1 24%     -83.8%     227.50 =C2=B1 11%  interrupts.CPU3=
0.NMI:Non-maskable_interrupts
>>        1406 =C2=B1 24%     -83.8%     227.50 =C2=B1 11%  interrupts.CPU3=
0.PMI:Performance_monitoring_interrupts
>>      539.50 =C2=B1  9%     -99.6%       2.00 =C2=B1 40%  interrupts.CPU3=
0.RES:Rescheduling_interrupts
>>        1545 =C2=B1 18%     -67.5%     502.67 =C2=B1  5%  interrupts.CPU3=
1.CAL:Function_call_interrupts
>>        1387 =C2=B1 23%     -82.1%     248.00 =C2=B1 21%  interrupts.CPU3=
1.NMI:Non-maskable_interrupts
>>        1387 =C2=B1 23%     -82.1%     248.00 =C2=B1 21%  interrupts.CPU3=
1.PMI:Performance_monitoring_interrupts
>>      559.83 =C2=B1  9%     -99.5%       3.00 =C2=B1 27%  interrupts.CPU3=
1.RES:Rescheduling_interrupts
>>        1366 =C2=B1 16%     -62.4%     514.00        interrupts.CPU32.CAL=
:Function_call_interrupts
>>        1235 =C2=B1 28%     -79.6%     252.00 =C2=B1 34%  interrupts.CPU3=
2.NMI:Non-maskable_interrupts
>>        1235 =C2=B1 28%     -79.6%     252.00 =C2=B1 34%  interrupts.CPU3=
2.PMI:Performance_monitoring_interrupts
>>      528.83 =C2=B1  9%     -99.2%       4.00 =C2=B1 38%  interrupts.CPU3=
2.RES:Rescheduling_interrupts
>>        1418 =C2=B1 19%     -63.4%     519.00        interrupts.CPU33.CAL=
:Function_call_interrupts
>>        1268 =C2=B1 28%     -76.8%     294.00 =C2=B1 29%  interrupts.CPU3=
3.NMI:Non-maskable_interrupts
>>        1268 =C2=B1 28%     -76.8%     294.00 =C2=B1 29%  interrupts.CPU3=
3.PMI:Performance_monitoring_interrupts
>>      550.67 =C2=B1 11%     -99.0%       5.50 =C2=B1 42%  interrupts.CPU3=
3.RES:Rescheduling_interrupts
>>        1495 =C2=B1 17%     -65.0%     523.67 =C2=B1  2%  interrupts.CPU3=
4.CAL:Function_call_interrupts
>>        1373 =C2=B1 23%     -79.1%     286.67 =C2=B1 23%  interrupts.CPU3=
4.NMI:Non-maskable_interrupts
>>        1373 =C2=B1 23%     -79.1%     286.67 =C2=B1 23%  interrupts.CPU3=
4.PMI:Performance_monitoring_interrupts
>>      553.33 =C2=B1 12%     -99.1%       5.00 =C2=B1 51%  interrupts.CPU3=
4.RES:Rescheduling_interrupts
>>        1400 =C2=B1 11%     -62.6%     524.00        interrupts.CPU35.CAL=
:Function_call_interrupts
>>        1238 =C2=B1 32%     -78.3%     268.33 =C2=B1 30%  interrupts.CPU3=
5.NMI:Non-maskable_interrupts
>>        1238 =C2=B1 32%     -78.3%     268.33 =C2=B1 30%  interrupts.CPU3=
5.PMI:Performance_monitoring_interrupts
>>      551.67 =C2=B1 14%     -99.5%       2.50 =C2=B1 50%  interrupts.CPU3=
5.RES:Rescheduling_interrupts
>>        1584 =C2=B1 16%     -67.3%     518.17        interrupts.CPU36.CAL=
:Function_call_interrupts
>>        1222 =C2=B1 26%     -80.2%     241.83 =C2=B1 38%  interrupts.CPU3=
6.NMI:Non-maskable_interrupts
>>        1222 =C2=B1 26%     -80.2%     241.83 =C2=B1 38%  interrupts.CPU3=
6.PMI:Performance_monitoring_interrupts
>>      557.83 =C2=B1 11%     -99.3%       3.83 =C2=B1 55%  interrupts.CPU3=
6.RES:Rescheduling_interrupts
>>        1396 =C2=B1 17%     -62.9%     517.50        interrupts.CPU37.CAL=
:Function_call_interrupts
>>        1412 =C2=B1 24%     -82.6%     246.33 =C2=B1  8%  interrupts.CPU3=
7.NMI:Non-maskable_interrupts
>>        1412 =C2=B1 24%     -82.6%     246.33 =C2=B1  8%  interrupts.CPU3=
7.PMI:Performance_monitoring_interrupts
>>      538.33 =C2=B1 11%     -99.4%       3.33 =C2=B1 14%  interrupts.CPU3=
7.RES:Rescheduling_interrupts
>>        1457 =C2=B1 16%     -64.3%     520.17        interrupts.CPU38.CAL=
:Function_call_interrupts
>>        1364 =C2=B1 24%     -80.2%     269.83 =C2=B1 21%  interrupts.CPU3=
8.NMI:Non-maskable_interrupts
>>        1364 =C2=B1 24%     -80.2%     269.83 =C2=B1 21%  interrupts.CPU3=
8.PMI:Performance_monitoring_interrupts
>>      544.33 =C2=B1 16%     -98.3%       9.00 =C2=B1102%  interrupts.CPU3=
8.RES:Rescheduling_interrupts
>>        1412 =C2=B1 17%     -63.2%     519.67        interrupts.CPU39.CAL=
:Function_call_interrupts
>>        1379 =C2=B1 22%     -77.9%     305.17 =C2=B1 37%  interrupts.CPU3=
9.NMI:Non-maskable_interrupts
>>        1379 =C2=B1 22%     -77.9%     305.17 =C2=B1 37%  interrupts.CPU3=
9.PMI:Performance_monitoring_interrupts
>>      532.17 =C2=B1 10%     -99.3%       3.83 =C2=B1 48%  interrupts.CPU3=
9.RES:Rescheduling_interrupts
>>        1367 =C2=B1 12%     -49.3%     693.67 =C2=B1 34%  interrupts.CPU4=
.CAL:Function_call_interrupts
>>        1398 =C2=B1 18%     -86.5%     188.17 =C2=B1 54%  interrupts.CPU4=
.NMI:Non-maskable_interrupts
>>        1398 =C2=B1 18%     -86.5%     188.17 =C2=B1 54%  interrupts.CPU4=
.PMI:Performance_monitoring_interrupts
>>      504.17 =C2=B1 22%     -99.2%       4.00 =C2=B1 64%  interrupts.CPU4=
.RES:Rescheduling_interrupts
>>        1432 =C2=B1 12%     -63.9%     517.33        interrupts.CPU40.CAL=
:Function_call_interrupts
>>        1403 =C2=B1 20%     -83.7%     229.33 =C2=B1 14%  interrupts.CPU4=
0.NMI:Non-maskable_interrupts
>>        1403 =C2=B1 20%     -83.7%     229.33 =C2=B1 14%  interrupts.CPU4=
0.PMI:Performance_monitoring_interrupts
>>      543.33 =C2=B1 12%     -99.4%       3.17 =C2=B1 38%  interrupts.CPU4=
0.RES:Rescheduling_interrupts
>>        1557 =C2=B1 16%     -66.1%     527.67        interrupts.CPU41.CAL=
:Function_call_interrupts
>>        1255 =C2=B1 27%     -78.8%     265.50 =C2=B1 21%  interrupts.CPU4=
1.NMI:Non-maskable_interrupts
>>        1255 =C2=B1 27%     -78.8%     265.50 =C2=B1 21%  interrupts.CPU4=
1.PMI:Performance_monitoring_interrupts
>>      550.33 =C2=B1 12%     -98.6%       7.83 =C2=B1109%  interrupts.CPU4=
1.RES:Rescheduling_interrupts
>>        1437 =C2=B1 21%     -63.9%     518.33        interrupts.CPU42.CAL=
:Function_call_interrupts
>>        1264 =C2=B1 27%     -81.3%     236.67 =C2=B1 34%  interrupts.CPU4=
2.NMI:Non-maskable_interrupts
>>        1264 =C2=B1 27%     -81.3%     236.67 =C2=B1 34%  interrupts.CPU4=
2.PMI:Performance_monitoring_interrupts
>>      529.83 =C2=B1 13%     -99.4%       3.33 =C2=B1 33%  interrupts.CPU4=
2.RES:Rescheduling_interrupts
>>        1431 =C2=B1 12%     -63.6%     521.50        interrupts.CPU43.CAL=
:Function_call_interrupts
>>        1430 =C2=B1 24%     -80.6%     277.67 =C2=B1 15%  interrupts.CPU4=
3.NMI:Non-maskable_interrupts
>>        1430 =C2=B1 24%     -80.6%     277.67 =C2=B1 15%  interrupts.CPU4=
3.PMI:Performance_monitoring_interrupts
>>      550.83 =C2=B1 10%     -99.4%       3.50 =C2=B1 65%  interrupts.CPU4=
3.RES:Rescheduling_interrupts
>>        1501 =C2=B1 17%     -65.1%     523.83 =C2=B1  2%  interrupts.CPU4=
4.CAL:Function_call_interrupts
>>        1374 =C2=B1 26%     -84.0%     220.00 =C2=B1 31%  interrupts.CPU4=
4.NMI:Non-maskable_interrupts
>>        1374 =C2=B1 26%     -84.0%     220.00 =C2=B1 31%  interrupts.CPU4=
4.PMI:Performance_monitoring_interrupts
>>      534.00 =C2=B1 12%     -99.0%       5.33 =C2=B1115%  interrupts.CPU4=
4.RES:Rescheduling_interrupts
>>        1633 =C2=B1 20%     -68.0%     522.17        interrupts.CPU45.CAL=
:Function_call_interrupts
>>        1392 =C2=B1 23%     -83.4%     231.33 =C2=B1 30%  interrupts.CPU4=
5.NMI:Non-maskable_interrupts
>>        1392 =C2=B1 23%     -83.4%     231.33 =C2=B1 30%  interrupts.CPU4=
5.PMI:Performance_monitoring_interrupts
>>      523.33 =C2=B1 15%     -99.2%       4.33 =C2=B1 34%  interrupts.CPU4=
5.RES:Rescheduling_interrupts
>>        1453 =C2=B1 22%     -63.9%     525.17        interrupts.CPU46.CAL=
:Function_call_interrupts
>>        1442 =C2=B1 23%     -81.7%     264.00 =C2=B1 27%  interrupts.CPU4=
6.NMI:Non-maskable_interrupts
>>        1442 =C2=B1 23%     -81.7%     264.00 =C2=B1 27%  interrupts.CPU4=
6.PMI:Performance_monitoring_interrupts
>>      553.00 =C2=B1 13%     -99.4%       3.33 =C2=B1 72%  interrupts.CPU4=
6.RES:Rescheduling_interrupts
>>        1443 =C2=B1 15%     -63.7%     524.00 =C2=B1  2%  interrupts.CPU4=
7.CAL:Function_call_interrupts
>>        1318 =C2=B1 21%     -80.8%     253.33 =C2=B1 27%  interrupts.CPU4=
7.NMI:Non-maskable_interrupts
>>        1318 =C2=B1 21%     -80.8%     253.33 =C2=B1 27%  interrupts.CPU4=
7.PMI:Performance_monitoring_interrupts
>>      555.17 =C2=B1 13%     -99.5%       2.83 =C2=B1 24%  interrupts.CPU4=
7.RES:Rescheduling_interrupts
>>        1380 =C2=B1 18%     -62.4%     519.50        interrupts.CPU48.CAL=
:Function_call_interrupts
>>        1345 =C2=B1 19%     -80.4%     263.83 =C2=B1 24%  interrupts.CPU4=
8.NMI:Non-maskable_interrupts
>>        1345 =C2=B1 19%     -80.4%     263.83 =C2=B1 24%  interrupts.CPU4=
8.PMI:Performance_monitoring_interrupts
>>      490.17 =C2=B1 14%     -99.0%       5.00 =C2=B1 69%  interrupts.CPU4=
8.RES:Rescheduling_interrupts
>>        1399 =C2=B1 19%     -62.4%     526.33        interrupts.CPU49.CAL=
:Function_call_interrupts
>>        1265 =C2=B1 20%     -78.9%     266.50 =C2=B1 17%  interrupts.CPU4=
9.NMI:Non-maskable_interrupts
>>        1265 =C2=B1 20%     -78.9%     266.50 =C2=B1 17%  interrupts.CPU4=
9.PMI:Performance_monitoring_interrupts
>>      535.83 =C2=B1 21%     -99.3%       4.00 =C2=B1 38%  interrupts.CPU4=
9.RES:Rescheduling_interrupts
>>        1402 =C2=B1 18%     -63.2%     516.50 =C2=B1 16%  interrupts.CPU5=
.CAL:Function_call_interrupts
>>        1243 =C2=B1 23%     -75.2%     308.83 =C2=B1 21%  interrupts.CPU5=
.NMI:Non-maskable_interrupts
>>        1243 =C2=B1 23%     -75.2%     308.83 =C2=B1 21%  interrupts.CPU5=
.PMI:Performance_monitoring_interrupts
>>      453.00 =C2=B1 14%     -98.4%       7.33 =C2=B1 94%  interrupts.CPU5=
.RES:Rescheduling_interrupts
>>        1422 =C2=B1 19%     -62.8%     528.83 =C2=B1  2%  interrupts.CPU5=
0.CAL:Function_call_interrupts
>>        1298 =C2=B1 16%     -79.2%     270.33 =C2=B1 28%  interrupts.CPU5=
0.NMI:Non-maskable_interrupts
>>        1298 =C2=B1 16%     -79.2%     270.33 =C2=B1 28%  interrupts.CPU5=
0.PMI:Performance_monitoring_interrupts
>>      498.67 =C2=B1 17%     -98.8%       6.17 =C2=B1104%  interrupts.CPU5=
0.RES:Rescheduling_interrupts
>>        1410 =C2=B1 17%     -63.3%     517.17        interrupts.CPU51.CAL=
:Function_call_interrupts
>>        1290 =C2=B1 19%     -80.5%     252.17 =C2=B1 26%  interrupts.CPU5=
1.NMI:Non-maskable_interrupts
>>        1290 =C2=B1 19%     -80.5%     252.17 =C2=B1 26%  interrupts.CPU5=
1.PMI:Performance_monitoring_interrupts
>>      505.00 =C2=B1 15%     -98.9%       5.33 =C2=B1 83%  interrupts.CPU5=
1.RES:Rescheduling_interrupts
>>        1479 =C2=B1 17%     -64.7%     522.17        interrupts.CPU52.CAL=
:Function_call_interrupts
>>        1225 =C2=B1 22%     -80.0%     244.67 =C2=B1 21%  interrupts.CPU5=
2.NMI:Non-maskable_interrupts
>>        1225 =C2=B1 22%     -80.0%     244.67 =C2=B1 21%  interrupts.CPU5=
2.PMI:Performance_monitoring_interrupts
>>      478.17 =C2=B1 15%     -99.5%       2.50 =C2=B1 75%  interrupts.CPU5=
2.RES:Rescheduling_interrupts
>>        1315 =C2=B1 18%     -59.5%     533.50 =C2=B1  3%  interrupts.CPU5=
3.CAL:Function_call_interrupts
>>        1253 =C2=B1 22%     -75.1%     311.50 =C2=B1 31%  interrupts.CPU5=
3.NMI:Non-maskable_interrupts
>>        1253 =C2=B1 22%     -75.1%     311.50 =C2=B1 31%  interrupts.CPU5=
3.PMI:Performance_monitoring_interrupts
>>      473.17 =C2=B1 17%     -98.3%       8.17 =C2=B1 68%  interrupts.CPU5=
3.RES:Rescheduling_interrupts
>>        1397 =C2=B1 17%     -62.7%     520.67        interrupts.CPU54.CAL=
:Function_call_interrupts
>>        1445 =C2=B1 16%     -79.0%     303.83 =C2=B1 29%  interrupts.CPU5=
4.NMI:Non-maskable_interrupts
>>        1445 =C2=B1 16%     -79.0%     303.83 =C2=B1 29%  interrupts.CPU5=
4.PMI:Performance_monitoring_interrupts
>>      477.50 =C2=B1 21%     -99.1%       4.17 =C2=B1 76%  interrupts.CPU5=
4.RES:Rescheduling_interrupts
>>        1415 =C2=B1 14%     -63.3%     520.17        interrupts.CPU55.CAL=
:Function_call_interrupts
>>        1379 =C2=B1 14%     -78.5%     296.17 =C2=B1 25%  interrupts.CPU5=
5.NMI:Non-maskable_interrupts
>>        1379 =C2=B1 14%     -78.5%     296.17 =C2=B1 25%  interrupts.CPU5=
5.PMI:Performance_monitoring_interrupts
>>      472.67 =C2=B1 19%     -99.3%       3.33 =C2=B1 86%  interrupts.CPU5=
5.RES:Rescheduling_interrupts
>>        1360 =C2=B1 21%     -61.7%     521.50        interrupts.CPU56.CAL=
:Function_call_interrupts
>>        1365 =C2=B1 15%     -79.8%     275.83 =C2=B1 28%  interrupts.CPU5=
6.NMI:Non-maskable_interrupts
>>        1365 =C2=B1 15%     -79.8%     275.83 =C2=B1 28%  interrupts.CPU5=
6.PMI:Performance_monitoring_interrupts
>>      477.83 =C2=B1 17%     -99.3%       3.33 =C2=B1 66%  interrupts.CPU5=
6.RES:Rescheduling_interrupts
>>        1498 =C2=B1 18%     -65.3%     520.50        interrupts.CPU57.CAL=
:Function_call_interrupts
>>        1334 =C2=B1 17%     -74.5%     340.83 =C2=B1 24%  interrupts.CPU5=
7.NMI:Non-maskable_interrupts
>>        1334 =C2=B1 17%     -74.5%     340.83 =C2=B1 24%  interrupts.CPU5=
7.PMI:Performance_monitoring_interrupts
>>      465.83 =C2=B1 16%     -99.5%       2.17 =C2=B1 49%  interrupts.CPU5=
7.RES:Rescheduling_interrupts
>>        1439 =C2=B1 21%     -63.9%     519.83 =C2=B1  2%  interrupts.CPU5=
8.CAL:Function_call_interrupts
>>        1295 =C2=B1 29%     -80.2%     256.00 =C2=B1 18%  interrupts.CPU5=
8.NMI:Non-maskable_interrupts
>>        1295 =C2=B1 29%     -80.2%     256.00 =C2=B1 18%  interrupts.CPU5=
8.PMI:Performance_monitoring_interrupts
>>      460.00 =C2=B1 19%     -99.4%       2.83 =C2=B1 68%  interrupts.CPU5=
8.RES:Rescheduling_interrupts
>>        1347 =C2=B1 15%     -61.1%     524.17        interrupts.CPU59.CAL=
:Function_call_interrupts
>>        1341 =C2=B1 18%     -75.1%     334.67 =C2=B1 29%  interrupts.CPU5=
9.NMI:Non-maskable_interrupts
>>        1341 =C2=B1 18%     -75.1%     334.67 =C2=B1 29%  interrupts.CPU5=
9.PMI:Performance_monitoring_interrupts
>>      461.50 =C2=B1 19%     -99.0%       4.67 =C2=B1 84%  interrupts.CPU5=
9.RES:Rescheduling_interrupts
>>        1464 =C2=B1 19%     -64.1%     526.50        interrupts.CPU6.CAL:=
Function_call_interrupts
>>        1459 =C2=B1 14%     -80.8%     280.33 =C2=B1 38%  interrupts.CPU6=
.NMI:Non-maskable_interrupts
>>        1459 =C2=B1 14%     -80.8%     280.33 =C2=B1 38%  interrupts.CPU6=
.PMI:Performance_monitoring_interrupts
>>      472.17 =C2=B1 19%     -99.2%       3.67 =C2=B1 48%  interrupts.CPU6=
.RES:Rescheduling_interrupts
>>        1337 =C2=B1 18%     -61.2%     518.67        interrupts.CPU60.CAL=
:Function_call_interrupts
>>        1401 =C2=B1 17%     -81.1%     265.33 =C2=B1 19%  interrupts.CPU6=
0.NMI:Non-maskable_interrupts
>>        1401 =C2=B1 17%     -81.1%     265.33 =C2=B1 19%  interrupts.CPU6=
0.PMI:Performance_monitoring_interrupts
>>      471.50 =C2=B1 20%     -99.5%       2.50 =C2=B1 30%  interrupts.CPU6=
0.RES:Rescheduling_interrupts
>>        1415 =C2=B1 19%     -64.3%     505.50 =C2=B1  4%  interrupts.CPU6=
1.CAL:Function_call_interrupts
>>        1408 =C2=B1 19%     -84.4%     220.00 =C2=B1 22%  interrupts.CPU6=
1.NMI:Non-maskable_interrupts
>>        1408 =C2=B1 19%     -84.4%     220.00 =C2=B1 22%  interrupts.CPU6=
1.PMI:Performance_monitoring_interrupts
>>      476.83 =C2=B1 17%     -99.3%       3.50 =C2=B1 54%  interrupts.CPU6=
1.RES:Rescheduling_interrupts
>>        1301 =C2=B1 24%     -60.2%     518.17        interrupts.CPU62.CAL=
:Function_call_interrupts
>>        1290 =C2=B1 32%     -81.5%     238.33 =C2=B1 24%  interrupts.CPU6=
2.NMI:Non-maskable_interrupts
>>        1290 =C2=B1 32%     -81.5%     238.33 =C2=B1 24%  interrupts.CPU6=
2.PMI:Performance_monitoring_interrupts
>>      478.67 =C2=B1 19%     -99.3%       3.50 =C2=B1 42%  interrupts.CPU6=
2.RES:Rescheduling_interrupts
>>        1370 =C2=B1 11%     -61.9%     521.67        interrupts.CPU63.CAL=
:Function_call_interrupts
>>        1402 =C2=B1 16%     -80.5%     273.33 =C2=B1 18%  interrupts.CPU6=
3.NMI:Non-maskable_interrupts
>>        1402 =C2=B1 16%     -80.5%     273.33 =C2=B1 18%  interrupts.CPU6=
3.PMI:Performance_monitoring_interrupts
>>      480.67 =C2=B1 17%     -99.2%       3.83 =C2=B1 68%  interrupts.CPU6=
3.RES:Rescheduling_interrupts
>>        1405 =C2=B1 15%     -62.8%     523.50 =C2=B1  2%  interrupts.CPU6=
4.CAL:Function_call_interrupts
>>        1452 =C2=B1 13%     -83.9%     233.50 =C2=B1 15%  interrupts.CPU6=
4.NMI:Non-maskable_interrupts
>>        1452 =C2=B1 13%     -83.9%     233.50 =C2=B1 15%  interrupts.CPU6=
4.PMI:Performance_monitoring_interrupts
>>      495.67 =C2=B1 15%     -99.3%       3.33 =C2=B1 47%  interrupts.CPU6=
4.RES:Rescheduling_interrupts
>>        1385 =C2=B1 13%     -62.1%     524.83        interrupts.CPU65.CAL=
:Function_call_interrupts
>>        1247 =C2=B1 15%     -76.9%     287.67 =C2=B1 17%  interrupts.CPU6=
5.NMI:Non-maskable_interrupts
>>        1247 =C2=B1 15%     -76.9%     287.67 =C2=B1 17%  interrupts.CPU6=
5.PMI:Performance_monitoring_interrupts
>>      477.33 =C2=B1 14%     -99.1%       4.17 =C2=B1 37%  interrupts.CPU6=
5.RES:Rescheduling_interrupts
>>        1639 =C2=B1 27%     -68.8%     512.00 =C2=B1  5%  interrupts.CPU6=
6.CAL:Function_call_interrupts
>>        1079 =C2=B1 19%     -73.1%     290.67 =C2=B1 40%  interrupts.CPU6=
6.NMI:Non-maskable_interrupts
>>        1079 =C2=B1 19%     -73.1%     290.67 =C2=B1 40%  interrupts.CPU6=
6.PMI:Performance_monitoring_interrupts
>>      466.00 =C2=B1 14%     -99.4%       3.00 =C2=B1 50%  interrupts.CPU6=
6.RES:Rescheduling_interrupts
>>        1324 =C2=B1 17%     -60.9%     518.00        interrupts.CPU67.CAL=
:Function_call_interrupts
>>        1245 =C2=B1 18%     -76.3%     295.50 =C2=B1 24%  interrupts.CPU6=
7.NMI:Non-maskable_interrupts
>>        1245 =C2=B1 18%     -76.3%     295.50 =C2=B1 24%  interrupts.CPU6=
7.PMI:Performance_monitoring_interrupts
>>      498.83 =C2=B1 12%     -99.3%       3.67 =C2=B1 48%  interrupts.CPU6=
7.RES:Rescheduling_interrupts
>>        1363 =C2=B1 21%     -61.7%     521.67        interrupts.CPU68.CAL=
:Function_call_interrupts
>>        1413 =C2=B1 13%     -78.9%     298.67 =C2=B1 22%  interrupts.CPU6=
8.NMI:Non-maskable_interrupts
>>        1413 =C2=B1 13%     -78.9%     298.67 =C2=B1 22%  interrupts.CPU6=
8.PMI:Performance_monitoring_interrupts
>>      515.67 =C2=B1 17%     -99.3%       3.50 =C2=B1 27%  interrupts.CPU6=
8.RES:Rescheduling_interrupts
>>        1350 =C2=B1 18%     -61.6%     518.33        interrupts.CPU69.CAL=
:Function_call_interrupts
>>        1219 =C2=B1 13%     -72.7%     332.67 =C2=B1 23%  interrupts.CPU6=
9.NMI:Non-maskable_interrupts
>>        1219 =C2=B1 13%     -72.7%     332.67 =C2=B1 23%  interrupts.CPU6=
9.PMI:Performance_monitoring_interrupts
>>      502.67 =C2=B1 15%     -99.4%       3.00 =C2=B1 63%  interrupts.CPU6=
9.RES:Rescheduling_interrupts
>>        1350 =C2=B1 16%     -61.4%     520.50        interrupts.CPU7.CAL:=
Function_call_interrupts
>>        1382 =C2=B1 14%     -80.2%     273.33 =C2=B1 41%  interrupts.CPU7=
.NMI:Non-maskable_interrupts
>>        1382 =C2=B1 14%     -80.2%     273.33 =C2=B1 41%  interrupts.CPU7=
.PMI:Performance_monitoring_interrupts
>>      480.00 =C2=B1 20%     -99.5%       2.50 =C2=B1 44%  interrupts.CPU7=
.RES:Rescheduling_interrupts
>>        1372 =C2=B1 23%     -62.0%     521.17 =C2=B1  2%  interrupts.CPU7=
0.CAL:Function_call_interrupts
>>        1387 =C2=B1 17%     -76.1%     331.17 =C2=B1 29%  interrupts.CPU7=
0.NMI:Non-maskable_interrupts
>>        1387 =C2=B1 17%     -76.1%     331.17 =C2=B1 29%  interrupts.CPU7=
0.PMI:Performance_monitoring_interrupts
>>      493.50 =C2=B1 19%     -99.1%       4.33 =C2=B1 52%  interrupts.CPU7=
0.RES:Rescheduling_interrupts
>>        1375 =C2=B1 15%     -61.9%     524.17 =C2=B1  2%  interrupts.CPU7=
1.CAL:Function_call_interrupts
>>        1404 =C2=B1 17%     -79.9%     282.83 =C2=B1 18%  interrupts.CPU7=
1.NMI:Non-maskable_interrupts
>>        1404 =C2=B1 17%     -79.9%     282.83 =C2=B1 18%  interrupts.CPU7=
1.PMI:Performance_monitoring_interrupts
>>      510.50 =C2=B1 20%     -99.3%       3.67 =C2=B1 30%  interrupts.CPU7=
1.RES:Rescheduling_interrupts
>>        1432 =C2=B1 14%     -63.5%     522.17        interrupts.CPU72.CAL=
:Function_call_interrupts
>>        1455 =C2=B1  9%     -82.4%     255.50 =C2=B1 12%  interrupts.CPU7=
2.NMI:Non-maskable_interrupts
>>        1455 =C2=B1  9%     -82.4%     255.50 =C2=B1 12%  interrupts.CPU7=
2.PMI:Performance_monitoring_interrupts
>>      568.83 =C2=B1 12%     -99.2%       4.50 =C2=B1 42%  interrupts.CPU7=
2.RES:Rescheduling_interrupts
>>        1571 =C2=B1 21%     -66.8%     521.00        interrupts.CPU73.CAL=
:Function_call_interrupts
>>        1501 =C2=B1 14%     -84.3%     236.33 =C2=B1 19%  interrupts.CPU7=
3.NMI:Non-maskable_interrupts
>>        1501 =C2=B1 14%     -84.3%     236.33 =C2=B1 19%  interrupts.CPU7=
3.PMI:Performance_monitoring_interrupts
>>      546.33 =C2=B1 15%     -99.6%       2.17 =C2=B1 41%  interrupts.CPU7=
3.RES:Rescheduling_interrupts
>>        1512 =C2=B1 16%     -65.4%     523.17        interrupts.CPU74.CAL=
:Function_call_interrupts
>>        1475 =C2=B1 14%     -83.3%     246.67 =C2=B1 39%  interrupts.CPU7=
4.NMI:Non-maskable_interrupts
>>        1475 =C2=B1 14%     -83.3%     246.67 =C2=B1 39%  interrupts.CPU7=
4.PMI:Performance_monitoring_interrupts
>>      543.33 =C2=B1 12%     -99.3%       4.00 =C2=B1 80%  interrupts.CPU7=
4.RES:Rescheduling_interrupts
>>        1480 =C2=B1 19%     -64.7%     522.50        interrupts.CPU75.CAL=
:Function_call_interrupts
>>        1552 =C2=B1 12%     -85.4%     227.17 =C2=B1 41%  interrupts.CPU7=
5.NMI:Non-maskable_interrupts
>>        1552 =C2=B1 12%     -85.4%     227.17 =C2=B1 41%  interrupts.CPU7=
5.PMI:Performance_monitoring_interrupts
>>      559.17 =C2=B1 14%     -99.5%       2.67 =C2=B1 85%  interrupts.CPU7=
5.RES:Rescheduling_interrupts
>>        1516 =C2=B1 11%     -65.5%     523.50        interrupts.CPU76.CAL=
:Function_call_interrupts
>>        1393 =C2=B1 25%     -84.3%     218.17 =C2=B1 28%  interrupts.CPU7=
6.NMI:Non-maskable_interrupts
>>        1393 =C2=B1 25%     -84.3%     218.17 =C2=B1 28%  interrupts.CPU7=
6.PMI:Performance_monitoring_interrupts
>>      553.17 =C2=B1 15%     -99.3%       4.00 =C2=B1 57%  interrupts.CPU7=
6.RES:Rescheduling_interrupts
>>        1435 =C2=B1 11%     -63.6%     522.33        interrupts.CPU77.CAL=
:Function_call_interrupts
>>        1405 =C2=B1 26%     -86.0%     196.67 =C2=B1 38%  interrupts.CPU7=
7.NMI:Non-maskable_interrupts
>>        1405 =C2=B1 26%     -86.0%     196.67 =C2=B1 38%  interrupts.CPU7=
7.PMI:Performance_monitoring_interrupts
>>      556.17 =C2=B1 13%     -99.5%       2.83 =C2=B1 59%  interrupts.CPU7=
7.RES:Rescheduling_interrupts
>>        1469 =C2=B1 15%     -64.5%     521.17        interrupts.CPU78.CAL=
:Function_call_interrupts
>>        1411 =C2=B1 24%     -85.0%     212.17 =C2=B1 20%  interrupts.CPU7=
8.NMI:Non-maskable_interrupts
>>        1411 =C2=B1 24%     -85.0%     212.17 =C2=B1 20%  interrupts.CPU7=
8.PMI:Performance_monitoring_interrupts
>>      542.50 =C2=B1 10%     -99.8%       1.33 =C2=B1 55%  interrupts.CPU7=
8.RES:Rescheduling_interrupts
>>        1416 =C2=B1 12%     -63.2%     521.17        interrupts.CPU79.CAL=
:Function_call_interrupts
>>        1421 =C2=B1 28%     -83.9%     228.67 =C2=B1 30%  interrupts.CPU7=
9.NMI:Non-maskable_interrupts
>>        1421 =C2=B1 28%     -83.9%     228.67 =C2=B1 30%  interrupts.CPU7=
9.PMI:Performance_monitoring_interrupts
>>      553.50 =C2=B1 15%     -99.4%       3.17 =C2=B1 42%  interrupts.CPU7=
9.RES:Rescheduling_interrupts
>>        1391 =C2=B1 17%     -61.8%     531.83 =C2=B1  3%  interrupts.CPU8=
.CAL:Function_call_interrupts
>>        1377 =C2=B1 16%     -83.5%     227.50 =C2=B1 37%  interrupts.CPU8=
.NMI:Non-maskable_interrupts
>>        1377 =C2=B1 16%     -83.5%     227.50 =C2=B1 37%  interrupts.CPU8=
.PMI:Performance_monitoring_interrupts
>>      473.33 =C2=B1 18%     -98.6%       6.50 =C2=B1 72%  interrupts.CPU8=
.RES:Rescheduling_interrupts
>>        1406 =C2=B1 20%     -63.2%     518.00        interrupts.CPU80.CAL=
:Function_call_interrupts
>>        1275 =C2=B1 36%     -84.1%     203.00 =C2=B1 38%  interrupts.CPU8=
0.NMI:Non-maskable_interrupts
>>        1275 =C2=B1 36%     -84.1%     203.00 =C2=B1 38%  interrupts.CPU8=
0.PMI:Performance_monitoring_interrupts
>>      529.00 =C2=B1 14%     -99.7%       1.83 =C2=B1 79%  interrupts.CPU8=
0.RES:Rescheduling_interrupts
>>        1467 =C2=B1 20%     -64.3%     523.33        interrupts.CPU81.CAL=
:Function_call_interrupts
>>        1291 =C2=B1 33%     -82.5%     225.83 =C2=B1 35%  interrupts.CPU8=
1.NMI:Non-maskable_interrupts
>>        1291 =C2=B1 33%     -82.5%     225.83 =C2=B1 35%  interrupts.CPU8=
1.PMI:Performance_monitoring_interrupts
>>      555.83 =C2=B1 12%     -98.8%       6.83 =C2=B1178%  interrupts.CPU8=
1.RES:Rescheduling_interrupts
>>        1486 =C2=B1 18%     -64.6%     527.00 =C2=B1  2%  interrupts.CPU8=
2.CAL:Function_call_interrupts
>>        1276 =C2=B1 35%     -81.6%     234.50 =C2=B1 40%  interrupts.CPU8=
2.NMI:Non-maskable_interrupts
>>        1276 =C2=B1 35%     -81.6%     234.50 =C2=B1 40%  interrupts.CPU8=
2.PMI:Performance_monitoring_interrupts
>>      546.33 =C2=B1 12%     -99.6%       2.00 =C2=B1 70%  interrupts.CPU8=
2.RES:Rescheduling_interrupts
>>        1471 =C2=B1 13%     -64.5%     522.33        interrupts.CPU83.CAL=
:Function_call_interrupts
>>        1231 =C2=B1 33%     -80.4%     241.33 =C2=B1 36%  interrupts.CPU8=
3.NMI:Non-maskable_interrupts
>>        1231 =C2=B1 33%     -80.4%     241.33 =C2=B1 36%  interrupts.CPU8=
3.PMI:Performance_monitoring_interrupts
>>      539.67 =C2=B1 10%     -99.7%       1.83 =C2=B1 37%  interrupts.CPU8=
3.RES:Rescheduling_interrupts
>>        1380 =C2=B1  9%     -64.0%     497.17 =C2=B1 13%  interrupts.CPU8=
4.CAL:Function_call_interrupts
>>        1243 =C2=B1 33%     -81.1%     235.33 =C2=B1 41%  interrupts.CPU8=
4.NMI:Non-maskable_interrupts
>>        1243 =C2=B1 33%     -81.1%     235.33 =C2=B1 41%  interrupts.CPU8=
4.PMI:Performance_monitoring_interrupts
>>      572.17 =C2=B1 17%     -99.5%       2.67 =C2=B1 55%  interrupts.CPU8=
4.RES:Rescheduling_interrupts
>>        1442 =C2=B1 19%     -65.3%     499.83 =C2=B1 14%  interrupts.CPU8=
5.CAL:Function_call_interrupts
>>        1304 =C2=B1 35%     -83.2%     218.67 =C2=B1 17%  interrupts.CPU8=
5.NMI:Non-maskable_interrupts
>>        1304 =C2=B1 35%     -83.2%     218.67 =C2=B1 17%  interrupts.CPU8=
5.PMI:Performance_monitoring_interrupts
>>      536.50 =C2=B1 14%     -99.6%       2.00 =C2=B1 81%  interrupts.CPU8=
5.RES:Rescheduling_interrupts
>>        1428 =C2=B1 15%     -62.9%     529.50 =C2=B1  2%  interrupts.CPU8=
6.CAL:Function_call_interrupts
>>        1236 =C2=B1 35%     -81.9%     223.50 =C2=B1 33%  interrupts.CPU8=
6.NMI:Non-maskable_interrupts
>>        1236 =C2=B1 35%     -81.9%     223.50 =C2=B1 33%  interrupts.CPU8=
6.PMI:Performance_monitoring_interrupts
>>      542.33 =C2=B1 14%     -99.7%       1.67 =C2=B1 89%  interrupts.CPU8=
6.RES:Rescheduling_interrupts
>>        1468 =C2=B1 17%     -63.6%     534.67        interrupts.CPU87.CAL=
:Function_call_interrupts
>>        1139 =C2=B1 37%     -72.9%     309.33 =C2=B1 32%  interrupts.CPU8=
7.NMI:Non-maskable_interrupts
>>        1139 =C2=B1 37%     -72.9%     309.33 =C2=B1 32%  interrupts.CPU8=
7.PMI:Performance_monitoring_interrupts
>>      538.83 =C2=B1  9%     -99.6%       2.17 =C2=B1 56%  interrupts.CPU8=
7.RES:Rescheduling_interrupts
>>        1528 =C2=B1 14%     -65.3%     530.83        interrupts.CPU88.CAL=
:Function_call_interrupts
>>        1147 =C2=B1 37%     -81.8%     209.00 =C2=B1 23%  interrupts.CPU8=
8.NMI:Non-maskable_interrupts
>>        1147 =C2=B1 37%     -81.8%     209.00 =C2=B1 23%  interrupts.CPU8=
8.PMI:Performance_monitoring_interrupts
>>      554.83 =C2=B1 10%     -98.9%       6.17 =C2=B1109%  interrupts.CPU8=
8.RES:Rescheduling_interrupts
>>        1453 =C2=B1 19%     -63.5%     530.83 =C2=B1  2%  interrupts.CPU8=
9.CAL:Function_call_interrupts
>>        1243 =C2=B1 29%     -82.1%     223.17 =C2=B1 13%  interrupts.CPU8=
9.NMI:Non-maskable_interrupts
>>        1243 =C2=B1 29%     -82.1%     223.17 =C2=B1 13%  interrupts.CPU8=
9.PMI:Performance_monitoring_interrupts
>>      552.17 =C2=B1 11%     -99.7%       1.83 =C2=B1 58%  interrupts.CPU8=
9.RES:Rescheduling_interrupts
>>        1372 =C2=B1 14%     -61.5%     527.83        interrupts.CPU9.CAL:=
Function_call_interrupts
>>        1370 =C2=B1 15%     -74.3%     352.00 =C2=B1 24%  interrupts.CPU9=
.NMI:Non-maskable_interrupts
>>        1370 =C2=B1 15%     -74.3%     352.00 =C2=B1 24%  interrupts.CPU9=
.PMI:Performance_monitoring_interrupts
>>      489.67 =C2=B1 15%     -98.6%       6.67 =C2=B1 80%  interrupts.CPU9=
.RES:Rescheduling_interrupts
>>        1478 =C2=B1 18%     -64.2%     529.17 =C2=B1  3%  interrupts.CPU9=
0.CAL:Function_call_interrupts
>>        1280 =C2=B1 27%     -82.9%     219.50 =C2=B1 27%  interrupts.CPU9=
0.NMI:Non-maskable_interrupts
>>        1280 =C2=B1 27%     -82.9%     219.50 =C2=B1 27%  interrupts.CPU9=
0.PMI:Performance_monitoring_interrupts
>>      545.00 =C2=B1 11%     -99.1%       4.67 =C2=B1 29%  interrupts.CPU9=
0.RES:Rescheduling_interrupts
>>        1422 =C2=B1 12%     -62.9%     527.83        interrupts.CPU91.CAL=
:Function_call_interrupts
>>        1283 =C2=B1 28%     -78.6%     275.17 =C2=B1 18%  interrupts.CPU9=
1.NMI:Non-maskable_interrupts
>>        1283 =C2=B1 28%     -78.6%     275.17 =C2=B1 18%  interrupts.CPU9=
1.PMI:Performance_monitoring_interrupts
>>      539.50 =C2=B1 12%     -99.7%       1.83 =C2=B1 48%  interrupts.CPU9=
1.RES:Rescheduling_interrupts
>>        1465 =C2=B1 18%     -64.2%     523.83 =C2=B1  2%  interrupts.CPU9=
2.CAL:Function_call_interrupts
>>        1233 =C2=B1 34%     -82.4%     217.00 =C2=B1 30%  interrupts.CPU9=
2.NMI:Non-maskable_interrupts
>>        1233 =C2=B1 34%     -82.4%     217.00 =C2=B1 30%  interrupts.CPU9=
2.PMI:Performance_monitoring_interrupts
>>      536.00 =C2=B1 15%     -99.5%       2.50 =C2=B1 38%  interrupts.CPU9=
2.RES:Rescheduling_interrupts
>>        1486 =C2=B1 21%     -64.9%     521.33        interrupts.CPU93.CAL=
:Function_call_interrupts
>>        1301 =C2=B1 34%     -81.5%     240.33 =C2=B1 16%  interrupts.CPU9=
3.NMI:Non-maskable_interrupts
>>        1301 =C2=B1 34%     -81.5%     240.33 =C2=B1 16%  interrupts.CPU9=
3.PMI:Performance_monitoring_interrupts
>>      543.67 =C2=B1 15%     -99.7%       1.67 =C2=B1 89%  interrupts.CPU9=
3.RES:Rescheduling_interrupts
>>        1470 =C2=B1 19%     -64.0%     529.67        interrupts.CPU94.CAL=
:Function_call_interrupts
>>        1284 =C2=B1 30%     -78.0%     282.33 =C2=B1 13%  interrupts.CPU9=
4.NMI:Non-maskable_interrupts
>>        1284 =C2=B1 30%     -78.0%     282.33 =C2=B1 13%  interrupts.CPU9=
4.PMI:Performance_monitoring_interrupts
>>      542.67 =C2=B1 13%     -99.4%       3.17 =C2=B1 21%  interrupts.CPU9=
4.RES:Rescheduling_interrupts
>>        1394 =C2=B1 12%     -62.8%     518.17 =C2=B1  2%  interrupts.CPU9=
5.CAL:Function_call_interrupts
>>        1210 =C2=B1 31%     -77.1%     277.33 =C2=B1 18%  interrupts.CPU9=
5.NMI:Non-maskable_interrupts
>>        1210 =C2=B1 31%     -77.1%     277.33 =C2=B1 18%  interrupts.CPU9=
5.PMI:Performance_monitoring_interrupts
>>      527.00 =C2=B1 10%     -98.6%       7.33 =C2=B1126%  interrupts.CPU9=
5.RES:Rescheduling_interrupts
>>      126031 =C2=B1  9%     -80.4%      24673 =C2=B1  6%  interrupts.NMI:=
Non-maskable_interrupts
>>      126031 =C2=B1  9%     -80.4%      24673 =C2=B1  6%  interrupts.PMI:=
Performance_monitoring_interrupts
>>       49557 =C2=B1  5%     -99.2%     403.00 =C2=B1  7%  interrupts.RES:=
Rescheduling_interrupts
>>       46.03 =C2=B1  2%      -8.1       37.90 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>>       39.97 =C2=B1  6%      -6.0       33.98 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>        9.39 =C2=B1  6%      -2.3        7.11 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__local_bh_enable_ip.ip_finish_output2.ip_output.__ip_que=
ue_xmit.__tcp_transmit_skb
>>        9.35 =C2=B1  6%      -2.3        7.08 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_outp=
ut.__ip_queue_xmit
>>        9.25 =C2=B1  6%      -2.2        7.00 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__softirqentry_text_start.do_softirq.__local_bh_enable_ip=
.ip_finish_output2.ip_output
>>        5.70 =C2=B1  7%      -2.2        3.54 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do=
_syscall_64
>>        5.78 =C2=B1  7%      -2.2        3.62 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>>        5.84 =C2=B1  7%      -2.2        3.68 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
>>        5.85 =C2=B1  7%      -2.2        3.70 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
>>        8.28 =C2=B1  6%      -2.1        6.14 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.=
net_rx_action.__softirqentry_text_start
>>        2.77 =C2=B1  2%      -2.1        0.64 =C2=B1 11%  perf-profile.ca=
lltrace.cycles-pp.rcu_core.__softirqentry_text_start.irq_exit_rcu.sysvec_ap=
ic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>>        8.54 =C2=B1  6%      -2.1        6.43 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.__softirqentry_=
text_start.do_softirq
>>        5.54 =C2=B1 57%      -2.1        3.44 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
>>        8.03 =C2=B1  6%      -2.1        5.95 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.ip_rcv.__netif_receive_skb_one_core.process_backlog.__nap=
i_poll.net_rx_action
>>        8.59 =C2=B1  6%      -2.0        6.54 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__napi_poll.net_rx_action.__softirqentry_text_start.do_so=
ftirq.__local_bh_enable_ip
>>        7.58 =C2=B1  6%      -2.0        5.54 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finis=
h.ip_local_deliver.ip_rcv
>>        8.77 =C2=B1  6%      -2.0        6.73 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.net_rx_action.__softirqentry_text_start.do_softirq.__loca=
l_bh_enable_ip.ip_finish_output2
>>        7.74 =C2=B1  6%      -2.0        5.74 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.ip_local_deliver.ip_rcv.__netif_receive_skb_one_core.proc=
ess_backlog.__napi_poll
>>        7.72 =C2=B1  6%      -2.0        5.72 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.ip_local_deliver_finish.ip_local_deliver.ip_rcv.__netif_r=
eceive_skb_one_core.process_backlog
>>        7.68 =C2=B1  6%      -2.0        5.70 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_=
deliver.ip_rcv.__netif_receive_skb_one_core
>>        5.11 =C2=B1  7%      -2.0        3.13 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto.=
__x64_sys_sendto
>>       13.38 =C2=B1  6%      -1.8       11.58 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__sys_connect.__x64_sys_connect.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
>>       13.41 =C2=B1  6%      -1.8       11.61 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.__x64_sys_connect.do_syscall_64.entry_SYSCALL_64_after_hw=
frame
>>       13.00 =C2=B1  6%      -1.8       11.23 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.inet_stream_connect.__sys_connect.__x64_sys_connect.do_sy=
scall_64.entry_SYSCALL_64_after_hwframe
>>        3.98 =C2=B1  7%      -1.5        2.44 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_lock=
ed.tcp_sendmsg.sock_sendmsg
>>        3.99 =C2=B1  7%      -1.5        2.47 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.=
sock_sendmsg.__sys_sendto
>>        3.30 =C2=B1  7%      -1.4        1.88 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_fram=
es.tcp_sendmsg_locked.tcp_sendmsg
>>        3.13 =C2=B1  7%      -1.4        1.75 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xm=
it.__tcp_push_pending_frames
>>        3.17 =C2=B1  7%      -1.4        1.79 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_p=
ush_pending_frames.tcp_sendmsg_locked
>>        3.08 =C2=B1  7%      -1.4        1.72 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmi=
t_skb.tcp_write_xmit
>>        3.03 =C2=B1  2%      -1.1        1.93 =C2=B1 11%  perf-profile.ca=
lltrace.cycles-pp.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_=
interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>>        2.82 =C2=B1  7%      -1.1        1.73 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.tcp_disconnect.__inet_stream_connect.inet_stream_connect.=
__sys_connect.__x64_sys_connect
>>        3.18 =C2=B1  7%      -1.0        2.23 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local=
_deliver_finish.ip_local_deliver
>>        1.11 =C2=B1  7%      -0.9        0.26 =C2=B1100%  perf-profile.ca=
lltrace.cycles-pp.tcp_data_queue.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_r=
cv.ip_protocol_deliver_rcu
>>        2.14 =C2=B1  7%      -0.8        1.32 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.__sys_recvfro=
m.__x64_sys_recvfrom
>>        1.82 =C2=B1  7%      -0.8        1.00 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_protocol_=
deliver_rcu.ip_local_deliver_finish
>>        2.35 =C2=B1  7%      -0.8        1.56 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>>        2.34 =C2=B1  7%      -0.8        1.54 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>>        2.20 =C2=B1  7%      -0.8        1.41 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfro=
m.do_syscall_64
>>        2.21 =C2=B1  7%      -0.8        1.43 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
>>        1.92 =C2=B1  8%      -0.7        1.18 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.tcp_send_active_reset.tcp_disconnect.__inet_stream_connec=
t.inet_stream_connect.__sys_connect
>>        3.10 =C2=B1  3%      -0.7        2.39 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_=
timer_interrupt.cpuidle_enter_state.cpuidle_enter
>>        3.40 =C2=B1  4%      -0.7        2.73 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.task_work_run.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.entry_SYSCALL_64_after_hwframe
>>        1.70 =C2=B1  8%      -0.6        1.05 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.__tcp_transmit_skb.tcp_send_active_reset.tcp_disconnect._=
_inet_stream_connect.inet_stream_connect
>>        3.24 =C2=B1  3%      -0.6        2.61 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.__fput.task_work_run.exit_to_user_mode_prepare.syscall_ex=
it_to_user_mode.entry_SYSCALL_64_after_hwframe
>>        3.81 =C2=B1  4%      -0.6        3.20 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry=
_SYSCALL_64_after_hwframe
>>        1.53 =C2=B1  8%      -0.6        0.98 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_send_active_reset.=
tcp_disconnect.__inet_stream_connect
>>        4.31 =C2=B1  5%      -0.5        3.77        perf-profile.calltra=
ce.cycles-pp.tcp_rcv_synsent_state_process.tcp_rcv_state_process.tcp_v4_do_=
rcv.__release_sock.release_sock
>>        4.01 =C2=B1  6%      -0.5        3.49        perf-profile.calltra=
ce.cycles-pp.tcp_rcv_state_process.tcp_v4_do_rcv.__release_sock.release_soc=
k.__inet_stream_connect
>>        1.42 =C2=B1  8%      -0.5        0.92 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_send_act=
ive_reset.tcp_disconnect
>>        1.32 =C2=B1  8%      -0.4        0.88 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmi=
t_skb.tcp_send_active_reset
>>        3.24 =C2=B1  5%      -0.4        2.81        perf-profile.calltra=
ce.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_rcv_synsent_state_proce=
ss.tcp_rcv_state_process.tcp_v4_do_rcv
>>        3.35 =C2=B1  5%      -0.4        2.92        perf-profile.calltra=
ce.cycles-pp.__tcp_transmit_skb.tcp_rcv_synsent_state_process.tcp_rcv_state=
_process.tcp_v4_do_rcv.__release_sock
>>        3.13 =C2=B1  5%      -0.4        2.71        perf-profile.calltra=
ce.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb=
.tcp_rcv_synsent_state_process
>>        1.97 =C2=B1  4%      -0.4        1.56 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.__x64_sys_socket.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
>>        1.96 =C2=B1  4%      -0.4        1.55 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.__sys_socket.__x64_sys_socket.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
>>        3.18 =C2=B1  5%      -0.4        2.77        perf-profile.calltra=
ce.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_rcv_synsent_s=
tate_process.tcp_rcv_state_process
>>        2.31 =C2=B1  6%      -0.4        1.89 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
>>        2.23 =C2=B1  6%      -0.4        1.82 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>>        2.08 =C2=B1  6%      -0.4        1.67 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.en=
try_SYSCALL_64_after_hwframe
>>        1.80 =C2=B1  4%      -0.4        1.43 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.inet_release.__sock_release.sock_close.__fput.task_work_r=
un
>>        1.88 =C2=B1  4%      -0.4        1.52 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.sock_close.__fput.task_work_run.exit_to_user_mode_prepare=
.syscall_exit_to_user_mode
>>        1.86 =C2=B1  4%      -0.4        1.50 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.__sock_release.sock_close.__fput.task_work_run.exit_to_us=
er_mode_prepare
>>        2.53 =C2=B1  6%      -0.3        2.19 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_sysc=
all_64
>>        0.91 =C2=B1  5%      -0.3        0.61 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.__sk_destruct.inet_release.__sock_release.sock_close.__fp=
ut
>>        1.05 =C2=B1  5%      -0.3        0.80 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.=
__sys_recvfrom
>>        1.29 =C2=B1  4%      -0.2        1.06 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.__sock_create.__sys_socket.__x64_sys_socket.do_syscall_64=
.entry_SYSCALL_64_after_hwframe
>>        0.58 =C2=B1  6%      -0.2        0.36 =C2=B1 71%  perf-profile.ca=
lltrace.cycles-pp.__x64_sys_utimensat.do_syscall_64.entry_SYSCALL_64_after_=
hwframe
>>        1.03 =C2=B1  5%      -0.2        0.81 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.tcp_v4_syn_recv_sock.tcp_check_req.tcp_v4_rcv.ip_protocol=
_deliver_rcu.ip_local_deliver_finish
>>        0.92 =C2=B1  5%      -0.2        0.71 =C2=B1 12%  perf-profile.ca=
lltrace.cycles-pp.__dentry_kill.__fput.task_work_run.exit_to_user_mode_prep=
are.syscall_exit_to_user_mode
>>        1.34 =C2=B1  5%      -0.2        1.14 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.tcp_child_process.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_l=
ocal_deliver_finish.ip_local_deliver
>>        0.90 =C2=B1  5%      -0.2        0.72 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.sock_def_readable.tcp_child_process.tcp_v4_rcv.ip_protoco=
l_deliver_rcu.ip_local_deliver_finish
>>        0.86 =C2=B1  6%      -0.2        0.68 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.wait_woken.sk_wait_data.tcp_recvmsg_locked.tcp_recvmsg.in=
et_recvmsg
>>        0.65 =C2=B1  3%      -0.2        0.48 =C2=B1 44%  perf-profile.ca=
lltrace.cycles-pp.__tcp_close.tcp_close.inet_release.__sock_release.sock_cl=
ose
>>        0.85 =C2=B1  5%      -0.2        0.70 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.tcp_child_process=
.tcp_v4_rcv.ip_protocol_deliver_rcu
>>        0.76 =C2=B1  5%      -0.1        0.62 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.=
__wake_up_common_lock.sock_def_readable
>>        0.79 =C2=B1  6%      -0.1        0.66 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.=
tcp_child_process.tcp_v4_rcv
>>        0.97 =C2=B1  7%      -0.1        0.84 =C2=B1 10%  perf-profile.ca=
lltrace.cycles-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_=
syscall_64
>>        0.74 =C2=B1  3%      -0.1        0.61 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.inet_create.__sock_create.__sys_socket.__x64_sys_socket.d=
o_syscall_64
>>        0.77 =C2=B1  6%      -0.1        0.65 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_commo=
n_lock.sock_def_readable.tcp_child_process
>>        0.73 =C2=B1  6%      -0.1        0.62 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.schedule.schedule_timeout.wait_woken.sk_wait_data.tcp_rec=
vmsg_locked
>>        0.75 =C2=B1  6%      -0.1        0.65 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_lock=
ed.tcp_recvmsg
>>        0.70 =C2=B1  6%      -0.1        0.60 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__schedule.schedule.schedule_timeout.wait_woken.sk_wait_d=
ata
>>        0.77 =C2=B1  3%      -0.1        0.69 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.tcp_close.inet_release.__sock_release.sock_close.__fput
>>        0.77 =C2=B1  9%      +0.2        0.97 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.schedule_timeout.inet_csk_accept.inet_accept.__sys_accept=
4_file.__sys_accept4
>>        0.71 =C2=B1  9%      +0.2        0.91 =C2=B1  4%  perf-profile.ca=
lltrace.cycles-pp.__schedule.schedule.schedule_timeout.inet_csk_accept.inet=
_accept
>>        0.73 =C2=B1  9%      +0.2        0.94 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.schedule.schedule_timeout.inet_csk_accept.inet_accept.__s=
ys_accept4_file
>>        0.00            +0.5        0.55 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.ktime_get.tick_nohz_irq_exit.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state
>>        0.00            +0.6        0.57 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.tick_nohz_irq_exit.sysvec_apic_timer_interrupt.asm_sysvec_apic=
_timer_interrupt.cpuidle_enter_state.cpuidle_enter
>>        0.00            +0.6        0.58 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt
>>        0.00            +0.6        0.60 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_interrup=
t.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>>        0.00            +0.7        0.65 =C2=B1 17%  perf-profile.calltra=
ce.cycles-pp.rebalance_domains.__softirqentry_text_start.irq_exit_rcu.sysve=
c_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>>        0.00            +0.7        0.73 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_bal=
ance.pick_next_task_fair
>>        0.00            +0.7        0.75 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task=
_fair.__schedule
>>        0.00            +0.8        0.76 =C2=B1 13%  perf-profile.calltra=
ce.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do=
_idle.cpu_startup_entry
>>        0.00            +0.8        0.78 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.sc=
hedule
>>        0.00            +0.8        0.82 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.do_nan=
osleep
>>        0.00            +0.8        0.83 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.pick_next_task_fair.__schedule.schedule.do_nanosleep.hrtimer_n=
anosleep
>>        0.00            +0.9        0.86 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state
>>        0.00            +0.9        0.88 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.__schedule.schedule.do_nanosleep.hrtimer_nanosleep.__x64_sys_n=
anosleep
>>        0.00            +0.9        0.88 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.schedule.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do=
_syscall_64
>>        0.00            +0.9        0.90 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_time=
r_interrupt.cpuidle_enter_state.cpuidle_enter
>>        0.00            +0.9        0.90 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
>>        0.00            +0.9        0.91 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>>        0.00            +0.9        0.92 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.__x64_sys_nanosleep.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
>>        0.00            +0.9        0.95 =C2=B1 12%  perf-profile.calltra=
ce.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_ent=
ry.start_secondary
>>        0.00            +1.1        1.09 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sch=
ed_timer.__hrtimer_run_queues
>>        0.75 =C2=B1  6%      +1.6        2.35 =C2=B1 21%  perf-profile.ca=
lltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>>        0.00            +1.6        1.63 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.__sysvec=
_apic_timer_interrupt.sysvec_apic_timer_interrupt
>>        0.00            +2.0        1.96 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrti=
mer_run_queues.hrtimer_interrupt
>>        0.00            +2.0        2.01 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtime=
r_interrupt.__sysvec_apic_timer_interrupt
>>        0.09 =C2=B1223%      +2.2        2.28 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic=
_timer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>>        0.00            +2.3        2.31 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysv=
ec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>>        0.68 =C2=B1  5%      +2.8        3.48 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_time=
r_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>>        1.34 =C2=B1  5%      +5.3        6.66 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_ap=
ic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>>        1.36 =C2=B1  5%      +5.4        6.75 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt=
.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
>>        4.78 =C2=B1  3%      +6.1       10.90 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interru=
pt.cpuidle_enter_state.cpuidle_enter.do_idle
>>       48.08 =C2=B1  2%      +6.7       54.73 =C2=B1  3%  perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_ent=
ry.start_secondary
>>       48.27 =C2=B1  2%      +7.1       55.40 =C2=B1  2%  perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.s=
econdary_startup_64_no_verify
>>       50.81 =C2=B1  2%      +7.7       58.52        perf-profile.calltra=
ce.cycles-pp.start_secondary.secondary_startup_64_no_verify
>>       50.80 =C2=B1  2%      +7.7       58.52        perf-profile.calltra=
ce.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_veri=
fy
>>       50.78 =C2=B1  2%      +7.7       58.50        perf-profile.calltra=
ce.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64=
_no_verify
>>       51.25 =C2=B1  2%      +7.8       59.03        perf-profile.calltra=
ce.cycles-pp.secondary_startup_64_no_verify
>>        4.97 =C2=B1  4%      +8.5       13.50 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuid=
le_enter.do_idle.cpu_startup_entry
>>       46.12 =C2=B1  2%      -7.9       38.20 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.entry_SYSCALL_64_after_hwframe
>>       40.03 =C2=B1  6%      -5.8       34.26 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.do_syscall_64
>>       12.88 =C2=B1  4%      -3.5        9.41 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.__softirqentry_text_start
>>        4.51            -3.2        1.30 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.kmem_cache_free
>>        3.39 =C2=B1  2%      -2.7        0.66 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.rcu_do_batch
>>        3.46 =C2=B1  2%      -2.6        0.85 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.rcu_core
>>       11.93 =C2=B1  6%      -2.5        9.47        perf-profile.childre=
n.cycles-pp.__tcp_transmit_skb
>>       11.17 =C2=B1  6%      -2.3        8.87 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__ip_queue_xmit
>>       10.82 =C2=B1  6%      -2.2        8.60 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.ip_output
>>       10.46 =C2=B1  6%      -2.2        8.29 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.ip_finish_output2
>>        5.71 =C2=B1  7%      -2.2        3.55 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_sendmsg
>>        5.84 =C2=B1  7%      -2.2        3.68 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__sys_sendto
>>        5.78 =C2=B1  7%      -2.2        3.62 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.sock_sendmsg
>>        5.86 =C2=B1  7%      -2.2        3.70 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_sendto
>>        5.59 =C2=B1 57%      -2.1        3.49 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.syscall_exit_to_user_mode
>>        9.53 =C2=B1  6%      -2.0        7.48 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__local_bh_enable_ip
>>        9.38 =C2=B1  6%      -2.0        7.34 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.do_softirq
>>        5.11 =C2=B1  7%      -2.0        3.13 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_sendmsg_locked
>>        8.61 =C2=B1  6%      -1.8        6.79 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__napi_poll
>>        8.56 =C2=B1  6%      -1.8        6.75 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.process_backlog
>>        8.78 =C2=B1  6%      -1.8        6.98 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.net_rx_action
>>       13.38 =C2=B1  6%      -1.8       11.58 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__sys_connect
>>       13.42 =C2=B1  6%      -1.8       11.62 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_connect
>>       13.01 =C2=B1  6%      -1.8       11.24 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.inet_stream_connect
>>        8.29 =C2=B1  6%      -1.8        6.54 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__netif_receive_skb_one_core
>>        8.04 =C2=B1  6%      -1.7        6.32 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.ip_rcv
>>        7.75 =C2=B1  6%      -1.7        6.09 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.ip_local_deliver
>>        7.72 =C2=B1  6%      -1.7        6.07 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.ip_local_deliver_finish
>>        7.70 =C2=B1  6%      -1.6        6.05 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.ip_protocol_deliver_rcu
>>        7.60 =C2=B1  6%      -1.6        5.98 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.tcp_v4_rcv
>>        3.98 =C2=B1  7%      -1.5        2.45 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_write_xmit
>>        3.99 =C2=B1  7%      -1.5        2.47 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__tcp_push_pending_frames
>>        1.87 =C2=B1  3%      -1.4        0.46 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.refill_obj_stock
>>        2.83 =C2=B1  7%      -1.1        1.74 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.tcp_disconnect
>>        3.51 =C2=B1  2%      -1.0        2.50 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.irq_exit_rcu
>>        1.01 =C2=B1  8%      -0.9        0.08 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.schedule_idle
>>        1.19 =C2=B1  3%      -0.9        0.31 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.drain_obj_stock
>>        2.14 =C2=B1  7%      -0.8        1.33 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_recvmsg_locked
>>        2.35 =C2=B1  7%      -0.8        1.56 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_recvfrom
>>        2.34 =C2=B1  7%      -0.8        1.55 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__sys_recvfrom
>>        2.20 =C2=B1  7%      -0.8        1.41 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.tcp_recvmsg
>>        2.21 =C2=B1  7%      -0.8        1.43 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.inet_recvmsg
>>        1.92 =C2=B1  8%      -0.7        1.18 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.tcp_send_active_reset
>>        1.86 =C2=B1  6%      -0.7        1.12 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.sock_def_readable
>>        5.82 =C2=B1  6%      -0.7        5.09        perf-profile.childre=
n.cycles-pp.tcp_rcv_state_process
>>        3.40 =C2=B1  4%      -0.7        2.74 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.task_work_run
>>        1.10 =C2=B1  9%      -0.6        0.46 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.copy_user_enhanced_fast_string
>>        1.28 =C2=B1  7%      -0.6        0.65 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.tcp_data_queue
>>        3.26 =C2=B1  3%      -0.6        2.62 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.__fput
>>        1.85 =C2=B1  6%      -0.6        1.24 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.__wake_up_common_lock
>>        1.71 =C2=B1  6%      -0.6        1.11 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__wake_up_common
>>        3.83 =C2=B1  4%      -0.6        3.24 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.exit_to_user_mode_prepare
>>        1.65 =C2=B1  6%      -0.6        1.09 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.try_to_wake_up
>>        4.31 =C2=B1  5%      -0.5        3.77        perf-profile.childre=
n.cycles-pp.tcp_rcv_synsent_state_process
>>        2.01 =C2=B1  6%      -0.5        1.51 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.kmem_cache_alloc
>>        0.86 =C2=B1  7%      -0.5        0.39 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock_bh
>>        1.97 =C2=B1  4%      -0.4        1.56 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_socket
>>        1.96 =C2=B1  4%      -0.4        1.55 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__sys_socket
>>        2.24 =C2=B1  6%      -0.4        1.83 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__vm_munmap
>>        2.31 =C2=B1  6%      -0.4        1.90 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_munmap
>>        2.09 =C2=B1  6%      -0.4        1.69 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__do_munmap
>>        0.62 =C2=B1  6%      -0.4        0.23 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.dequeue_entity
>>        0.67 =C2=B1 10%      -0.4        0.30 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__skb_datagram_iter
>>        1.80 =C2=B1  4%      -0.4        1.43 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.inet_release
>>        1.88 =C2=B1  4%      -0.4        1.52 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.sock_close
>>        0.67 =C2=B1 10%      -0.4        0.31 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.skb_copy_datagram_iter
>>        1.86 =C2=B1  4%      -0.4        1.51 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__sock_release
>>        1.01 =C2=B1  4%      -0.4        0.65 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__sk_destruct
>>        0.55 =C2=B1 12%      -0.3        0.21 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.copyout
>>        0.57 =C2=B1 12%      -0.3        0.23 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp._copy_to_iter
>>        0.65 =C2=B1  7%      -0.3        0.32 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.lock_sock_nested
>>        2.54 =C2=B1  6%      -0.3        2.22 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.mmap_region
>>        0.44 =C2=B1  6%      -0.3        0.13 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.copyin
>>        0.55 =C2=B1  7%      -0.3        0.25 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__inet_lookup_established
>>        0.46 =C2=B1  6%      -0.3        0.16 =C2=B1 19%  perf-profile.ch=
ildren.cycles-pp._copy_from_iter_full
>>        1.13 =C2=B1  6%      -0.3        0.85 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.alloc_file_pseudo
>>        1.14 =C2=B1  6%      -0.3        0.86 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.sock_alloc_file
>>        1.05 =C2=B1  5%      -0.3        0.80 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sk_wait_data
>>        0.68 =C2=B1  7%      -0.3        0.43 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.dequeue_task_fair
>>        0.41 =C2=B1  9%      -0.3        0.15 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.page_counter_cancel
>>        0.58 =C2=B1  5%      -0.3        0.33 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.get_obj_cgroup_from_current
>>        0.41 =C2=B1  9%      -0.3        0.16 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.page_counter_uncharge
>>        0.40 =C2=B1  8%      -0.2        0.15 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.__memcg_kmem_uncharge
>>        0.34 =C2=B1 11%      -0.2        0.10 =C2=B1 19%  perf-profile.ch=
ildren.cycles-pp.set_next_entity
>>        1.30 =C2=B1  4%      -0.2        1.07 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__sock_create
>>        0.54 =C2=B1  5%      -0.2        0.32 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.enqueue_entity
>>        1.03 =C2=B1  5%      -0.2        0.82 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.tcp_v4_syn_recv_sock
>>        0.91 =C2=B1  7%      -0.2        0.71 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_ack
>>        0.92 =C2=B1  5%      -0.2        0.72 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.__dentry_kill
>>        1.34 =C2=B1  5%      -0.2        1.15 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_child_process
>>        0.26 =C2=B1  7%      -0.2        0.07 =C2=B1 37%  perf-profile.ch=
ildren.cycles-pp.__slab_free
>>        0.33 =C2=B1  4%      -0.2        0.15 =C2=B1 19%  perf-profile.ch=
ildren.cycles-pp.dst_release
>>        0.88 =C2=B1  6%      -0.2        0.71 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.wait_woken
>>        0.46 =C2=B1  7%      -0.2        0.29 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.__kfree_skb
>>        0.64 =C2=B1  7%      -0.2        0.47 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.alloc_file
>>        1.15 =C2=B1  5%      -0.2        0.99 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__dev_queue_xmit
>>        0.47 =C2=B1  4%      -0.2        0.32 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.remove_vma
>>        0.49 =C2=B1  6%      -0.1        0.34 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.sk_clone_lock
>>        0.60 =C2=B1  5%      -0.1        0.45 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__alloc_file
>>        0.62 =C2=B1  6%      -0.1        0.47 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.alloc_empty_file
>>        0.71 =C2=B1  7%      -0.1        0.56 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.ttwu_do_activate
>>        0.69 =C2=B1  6%      -0.1        0.55 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.enqueue_task_fair
>>        0.51 =C2=B1  6%      -0.1        0.37 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.inet_csk_clone_lock
>>        0.26 =C2=B1  8%      -0.1        0.12 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.select_task_rq_fair
>>        0.60 =C2=B1  5%      -0.1        0.47 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.tcp_create_openreq_child
>>        0.74 =C2=B1  3%      -0.1        0.61 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.inet_create
>>        0.40 =C2=B1 10%      -0.1        0.28 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.obj_cgroup_charge
>>        0.61 =C2=B1  6%      -0.1        0.48 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.vm_area_alloc
>>        0.35 =C2=B1  7%      -0.1        0.23 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.d_alloc_pseudo
>>        0.77 =C2=B1  6%      -0.1        0.66 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.autoremove_wake_function
>>        0.35 =C2=B1  7%      -0.1        0.23 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__d_alloc
>>        0.26 =C2=B1  9%      -0.1        0.15 =C2=B1 19%  perf-profile.ch=
ildren.cycles-pp.page_counter_try_charge
>>        0.47 =C2=B1 10%      -0.1        0.36 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.update_load_avg
>>        0.46 =C2=B1  5%      -0.1        0.35 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.sk_alloc
>>        0.30 =C2=B1  8%      -0.1        0.20 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.tcp_set_state
>>        0.29 =C2=B1 10%      -0.1        0.19 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.__memcg_kmem_charge
>>        0.46 =C2=B1  7%      -0.1        0.35 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.tcp_clean_rtx_queue
>>        0.16 =C2=B1 12%      -0.1        0.06 =C2=B1 19%  perf-profile.ch=
ildren.cycles-pp.ipv4_dst_check
>>        0.42 =C2=B1  6%      -0.1        0.32 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.sk_prot_alloc
>>        0.40 =C2=B1  4%      -0.1        0.31 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.percpu_counter_add_batch
>>        0.44 =C2=B1  8%      -0.1        0.35 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.sock_alloc_inode
>>        0.17 =C2=B1  5%      -0.1        0.08 =C2=B1 33%  perf-profile.ch=
ildren.cycles-pp.security_file_free
>>        0.65 =C2=B1  3%      -0.1        0.56 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__tcp_close
>>        0.22 =C2=B1  4%      -0.1        0.13 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sk_stop_timer
>>        0.36 =C2=B1  8%      -0.1        0.28 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.aa_sk_perm
>>        0.16 =C2=B1  5%      -0.1        0.08 =C2=B1 35%  perf-profile.ch=
ildren.cycles-pp.apparmor_file_free_security
>>        0.18 =C2=B1 10%      -0.1        0.09 =C2=B1 30%  perf-profile.ch=
ildren.cycles-pp.__sk_dst_check
>>        0.22 =C2=B1  4%      -0.1        0.14 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.inet_csk_clear_xmit_timers
>>        0.26 =C2=B1  7%      -0.1        0.18 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.security_file_alloc
>>        0.20 =C2=B1  7%      -0.1        0.11 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.lock_timer_base
>>        0.20 =C2=B1  8%      -0.1        0.12 =C2=B1 23%  perf-profile.ch=
ildren.cycles-pp.apparmor_file_alloc_security
>>        0.18 =C2=B1  6%      -0.1        0.10 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.skb_release_all
>>        0.15 =C2=B1  9%      -0.1        0.07 =C2=B1 23%  perf-profile.ch=
ildren.cycles-pp.skb_release_head_state
>>        0.77 =C2=B1  3%      -0.1        0.70 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.tcp_close
>>        0.15 =C2=B1 13%      -0.1        0.08 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.ip_rcv_finish
>>        0.12 =C2=B1 14%      -0.1        0.05 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.ip_rcv_finish_core
>>        0.13 =C2=B1  5%      -0.1        0.06 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.skb_release_data
>>        0.47 =C2=B1  3%      -0.1        0.41 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.inet_csk_destroy_sock
>>        0.16 =C2=B1 10%      -0.1        0.10 =C2=B1 24%  perf-profile.ch=
ildren.cycles-pp.security_sk_free
>>        0.13 =C2=B1  8%      -0.1        0.07 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.__ksize
>>        0.13 =C2=B1  6%      -0.1        0.07 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.inet_unhash
>>        0.58 =C2=B1  6%      -0.1        0.52 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_utimensat
>>        0.27 =C2=B1  9%      -0.1        0.21 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.mod_timer
>>        0.10 =C2=B1 11%      -0.1        0.04 =C2=B1 75%  perf-profile.ch=
ildren.cycles-pp.__skb_clone
>>        0.30 =C2=B1  6%      -0.1        0.24 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.vma_link
>>        0.22 =C2=B1  7%      -0.1        0.16 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.memcpy_erms
>>        0.19 =C2=B1  7%      -0.1        0.14 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.sk_reset_timer
>>        0.20 =C2=B1  8%      -0.1        0.14 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.validate_xmit_skb
>>        0.16 =C2=B1  8%      -0.1        0.11 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.tcp_event_new_data_sent
>>        0.17 =C2=B1  7%      -0.1        0.12 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.__switch_to
>>        0.21 =C2=B1  9%      -0.1        0.16 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.ip_finish_output
>>        0.15 =C2=B1  9%      -0.0        0.10 =C2=B1 23%  perf-profile.ch=
ildren.cycles-pp.apparmor_sk_clone_security
>>        0.15 =C2=B1  5%      -0.0        0.10 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.del_timer
>>        0.15 =C2=B1 11%      -0.0        0.10 =C2=B1 24%  perf-profile.ch=
ildren.cycles-pp.security_sk_clone
>>        0.25 =C2=B1  4%      -0.0        0.21 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sk_forced_mem_schedule
>>        0.07 =C2=B1  9%      -0.0        0.03 =C2=B1100%  perf-profile.ch=
ildren.cycles-pp.tcp_rcv_space_adjust
>>        0.09 =C2=B1 16%      -0.0        0.04 =C2=B1 72%  perf-profile.ch=
ildren.cycles-pp.tcp_schedule_loss_probe
>>        0.11 =C2=B1  9%      -0.0        0.07 =C2=B1 45%  perf-profile.ch=
ildren.cycles-pp.apparmor_sk_free_security
>>        0.15 =C2=B1  4%      -0.0        0.11 =C2=B1 18%  perf-profile.ch=
ildren.cycles-pp.inet_csk_route_req
>>        0.17 =C2=B1  9%      -0.0        0.12 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.kmem_cache_alloc_trace
>>        0.10 =C2=B1 14%      -0.0        0.06 =C2=B1 51%  perf-profile.ch=
ildren.cycles-pp.__inet_lookup_listener
>>        0.19 =C2=B1 11%      -0.0        0.15 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.common_file_perm
>>        0.15 =C2=B1  9%      -0.0        0.11 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.__switch_to_asm
>>        0.11 =C2=B1 13%      -0.0        0.07 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.check_preempt_curr
>>        0.10 =C2=B1  7%      -0.0        0.06 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.__vma_link_rb
>>        0.17 =C2=B1  9%      -0.0        0.13 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.evm_protected_xattr
>>        0.15 =C2=B1  7%      -0.0        0.12 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.__mark_inode_dirty
>>        0.11 =C2=B1 14%      -0.0        0.09 =C2=B1 22%  perf-profile.ch=
ildren.cycles-pp.ttwu_do_wakeup
>>        0.10 =C2=B1  8%      -0.0        0.07 =C2=B1 18%  perf-profile.ch=
ildren.cycles-pp.security_socket_getpeername
>>        0.14 =C2=B1 10%      -0.0        0.11 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_copy_file_range
>>        0.07 =C2=B1  7%      -0.0        0.05 =C2=B1 45%  perf-profile.ch=
ildren.cycles-pp.lock_sock_fast
>>        0.08 =C2=B1 11%      +0.0        0.10 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.reweight_entity
>>        0.12 =C2=B1 15%      +0.0        0.16 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__update_load_avg_cfs_rq
>>        0.05            +0.0        0.09 =C2=B1 20%  perf-profile.childre=
n.cycles-pp.hrtimer_wakeup
>>        0.09 =C2=B1 10%      +0.0        0.13 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock_irq
>>        0.09 =C2=B1 15%      +0.0        0.14 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.tcp_done
>>        0.04 =C2=B1 71%      +0.1        0.09 =C2=B1 18%  perf-profile.ch=
ildren.cycles-pp.rb_next
>>        0.00            +0.1        0.05 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.filemap_map_pages
>>        0.14 =C2=B1  8%      +0.1        0.20 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.sock_def_wakeup
>>        0.00            +0.1        0.06 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.do_fault
>>        0.00            +0.1        0.07 =C2=B1 27%  perf-profile.childre=
n.cycles-pp.do_sys_openat2
>>        0.00            +0.1        0.07 =C2=B1 27%  perf-profile.childre=
n.cycles-pp.do_sys_open
>>        0.00            +0.1        0.07 =C2=B1 32%  perf-profile.childre=
n.cycles-pp.mmput
>>        0.00            +0.1        0.07 =C2=B1 32%  perf-profile.childre=
n.cycles-pp.exit_mmap
>>        0.36 =C2=B1 10%      +0.1        0.43 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.update_rq_clock
>>        0.01 =C2=B1223%      +0.1        0.08 =C2=B1 24%  perf-profile.ch=
ildren.cycles-pp.rb_erase
>>        0.00            +0.1        0.08 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.execve
>>        0.00            +0.1        0.08 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.__x64_sys_execve
>>        0.00            +0.1        0.08 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.do_execveat_common
>>        0.09 =C2=B1 12%      +0.1        0.17 =C2=B1 33%  perf-profile.ch=
ildren.cycles-pp._raw_spin_unlock_irqrestore
>>        0.07 =C2=B1  9%      +0.1        0.15 =C2=B1 27%  perf-profile.ch=
ildren.cycles-pp.tsc_verify_tsc_adjust
>>        0.07 =C2=B1 12%      +0.1        0.16 =C2=B1 26%  perf-profile.ch=
ildren.cycles-pp.arch_cpu_idle_enter
>>        0.05 =C2=B1  9%      +0.1        0.14 =C2=B1 23%  perf-profile.ch=
ildren.cycles-pp.rcu_eqs_exit
>>        0.00            +0.1        0.09 =C2=B1  5%  perf-profile.childre=
n.cycles-pp.rcu_gp_kthread
>>        0.11 =C2=B1 13%      +0.1        0.21 =C2=B1 19%  perf-profile.ch=
ildren.cycles-pp.nr_iowait_cpu
>>        0.00            +0.1        0.09 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.__handle_mm_fault
>>        0.00            +0.1        0.10 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.__hrtimer_get_next_event
>>        0.00            +0.1        0.10 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.memcpy_toio
>>        0.00            +0.1        0.10 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.drm_fb_helper_damage_work
>>        0.00            +0.1        0.10 =C2=B1 12%  perf-profile.childre=
n.cycles-pp.handle_mm_fault
>>        0.11 =C2=B1 13%      +0.1        0.21 =C2=B1 20%  perf-profile.ch=
ildren.cycles-pp.update_ts_time_stats
>>        0.00            +0.1        0.11 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.do_user_addr_fault
>>        0.00            +0.1        0.11 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.exc_page_fault
>>        0.02 =C2=B1142%      +0.1        0.13 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp._find_next_bit
>>        0.08 =C2=B1 10%      +0.1        0.20 =C2=B1 21%  perf-profile.ch=
ildren.cycles-pp.rcu_idle_exit
>>        0.00            +0.1        0.12 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.process_one_work
>>        0.00            +0.1        0.12 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.cpumask_next_and
>>        0.04 =C2=B1 73%      +0.1        0.16 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.switch_fpu_return
>>        0.00            +0.1        0.12 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.asm_exc_page_fault
>>        0.00            +0.1        0.12 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.hrtimer_next_event_without
>>        0.00            +0.1        0.12 =C2=B1 17%  perf-profile.childre=
n.cycles-pp.get_next_timer_interrupt
>>        0.00            +0.1        0.13 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.worker_thread
>>        0.01 =C2=B1223%      +0.1        0.14 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.note_gp_changes
>>        0.01 =C2=B1223%      +0.1        0.15 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.timerqueue_del
>>        0.05 =C2=B1 45%      +0.1        0.19 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.update_irq_load_avg
>>        0.18 =C2=B1 12%      +0.1        0.32 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.tcp_reset
>>        0.10 =C2=B1  7%      +0.1        0.25 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.switch_mm_irqs_off
>>        0.02 =C2=B1141%      +0.2        0.17 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__remove_hrtimer
>>        0.00            +0.2        0.15 =C2=B1 21%  perf-profile.childre=
n.cycles-pp.timerqueue_add
>>        0.00            +0.2        0.16 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.__hrtimer_next_event_base
>>        0.00            +0.2        0.17 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.enqueue_hrtimer
>>        0.00            +0.2        0.19 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.load_new_mm_cr3
>>        0.01 =C2=B1223%      +0.2        0.19 =C2=B1 24%  perf-profile.ch=
ildren.cycles-pp.arch_scale_freq_tick
>>        0.08 =C2=B1  8%      +0.2        0.28 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.calc_global_load_tick
>>        0.21 =C2=B1 12%      +0.2        0.42 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.kthread
>>        0.21 =C2=B1 12%      +0.2        0.42 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.ret_from_fork
>>        0.01 =C2=B1223%      +0.2        0.21 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.__intel_pmu_enable_all
>>        0.27 =C2=B1 13%      +0.2        0.49 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.tcp_validate_incoming
>>        0.06 =C2=B1  8%      +0.2        0.30 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.rcu_sched_clock_irq
>>        0.08 =C2=B1 14%      +0.2        0.32 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp._raw_spin_trylock
>>        0.28 =C2=B1 10%      +0.3        0.55 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.native_sched_clock
>>        0.10 =C2=B1 14%      +0.3        0.36 =C2=B1 18%  perf-profile.ch=
ildren.cycles-pp.run_rebalance_domains
>>        0.29 =C2=B1 11%      +0.3        0.56 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.sched_clock
>>        0.09 =C2=B1 17%      +0.3        0.38 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.update_blocked_averages
>>        0.04 =C2=B1 71%      +0.3        0.34 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.io_serial_in
>>        0.00            +0.3        0.31 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.timekeeping_max_deferment
>>        0.33 =C2=B1 11%      +0.3        0.65 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.sched_clock_cpu
>>        0.45 =C2=B1  8%      +0.3        0.78 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.read_tsc
>>        0.03 =C2=B1 99%      +0.3        0.37 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.idle_cpu
>>        0.06 =C2=B1  9%      +0.4        0.41 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.serial8250_console_putchar
>>        0.11 =C2=B1 13%      +0.4        0.48 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.ktime_get_update_offsets_now
>>        0.06 =C2=B1 11%      +0.4        0.42 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.wait_for_xmitr
>>        0.06 =C2=B1 11%      +0.4        0.43 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.uart_console_write
>>        0.07 =C2=B1 11%      +0.4        0.44 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.serial8250_console_write
>>        0.26 =C2=B1  9%      +0.4        0.66 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.irqtime_account_irq
>>        0.07 =C2=B1 14%      +0.4        0.48 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.irq_work_run
>>        0.07 =C2=B1 14%      +0.4        0.48 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.printk
>>        0.07 =C2=B1 14%      +0.4        0.48 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.vprintk_emit
>>        0.07 =C2=B1 14%      +0.4        0.48 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.console_unlock
>>        0.08 =C2=B1 16%      +0.4        0.49 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.irq_work_run_list
>>        0.07 =C2=B1 14%      +0.4        0.49 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.asm_sysvec_irq_work
>>        0.07 =C2=B1 14%      +0.4        0.49 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.sysvec_irq_work
>>        0.07 =C2=B1 14%      +0.4        0.49 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__sysvec_irq_work
>>        0.07 =C2=B1 14%      +0.4        0.49 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.irq_work_single
>>        0.12 =C2=B1 11%      +0.5        0.57 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_irq_exit
>>        0.10 =C2=B1 15%      +0.5        0.56 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.perf_mux_hrtimer_handler
>>        0.11 =C2=B1  9%      +0.5        0.62 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.lapic_next_deadline
>>        0.14 =C2=B1 16%      +0.5        0.66 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.rebalance_domains
>>        0.10 =C2=B1 11%      +0.5        0.62 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.native_irq_return_iret
>>        0.11 =C2=B1 10%      +0.7        0.77 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_next_event
>>        0.62 =C2=B1 10%      +0.7        1.28 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.pick_next_task_fair
>>        0.16 =C2=B1 17%      +0.7        0.87 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.tick_irq_enter
>>        0.17 =C2=B1 17%      +0.7        0.91 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.irq_enter_rcu
>>        0.15 =C2=B1 12%      +0.8        0.96 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_get_sleep_length
>>        0.06 =C2=B1 13%      +0.8        0.90 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.do_nanosleep
>>        0.07 =C2=B1 12%      +0.8        0.92 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_nanosleep
>>        0.06 =C2=B1 14%      +0.8        0.91 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.hrtimer_nanosleep
>>        0.14 =C2=B1 16%      +0.9        1.01 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.newidle_balance
>>        0.25 =C2=B1  7%      +0.9        1.16 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.scheduler_tick
>>        0.12 =C2=B1 18%      +1.0        1.13 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.update_sd_lb_stats
>>        0.12 =C2=B1 18%      +1.0        1.16 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.find_busiest_group
>>        1.52 =C2=B1  8%      +1.0        2.56 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.schedule
>>        0.15 =C2=B1 16%      +1.1        1.28 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.load_balance
>>        0.45 =C2=B1  7%      +1.6        2.06 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.update_process_times
>>        0.77 =C2=B1  6%      +1.6        2.38 =C2=B1 21%  perf-profile.ch=
ildren.cycles-pp.menu_select
>>        0.47 =C2=B1  7%      +1.6        2.10 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.tick_sched_handle
>>        0.55 =C2=B1  9%      +1.8        2.34 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.clockevents_program_event
>>        0.57 =C2=B1  5%      +1.8        2.42 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.tick_sched_timer
>>        1.11 =C2=B1  7%      +2.3        3.45 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.ktime_get
>>        0.85 =C2=B1  6%      +2.8        3.63 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__hrtimer_run_queues
>>        1.60 =C2=B1  5%      +5.3        6.91 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.hrtimer_interrupt
>>        1.63 =C2=B1  6%      +5.4        7.00 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__sysvec_apic_timer_interrupt
>>        5.48 =C2=B1  3%      +5.8       11.28 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.sysvec_apic_timer_interrupt
>>        5.70 =C2=B1  3%      +7.0       12.70 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.asm_sysvec_apic_timer_interrupt
>>       48.68 =C2=B1  2%      +7.2       55.86 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.cpuidle_enter_state
>>       48.69 =C2=B1  2%      +7.2       55.88 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.cpuidle_enter
>>       50.81 =C2=B1  2%      +7.7       58.52        perf-profile.childre=
n.cycles-pp.start_secondary
>>       51.25 =C2=B1  2%      +7.8       59.03        perf-profile.childre=
n.cycles-pp.secondary_startup_64_no_verify
>>       51.25 =C2=B1  2%      +7.8       59.03        perf-profile.childre=
n.cycles-pp.cpu_startup_entry
>>       51.24 =C2=B1  2%      +7.8       59.03        perf-profile.childre=
n.cycles-pp.do_idle
>>        2.41 =C2=B1  2%      -1.7        0.70 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.kmem_cache_free
>>        1.08 =C2=B1  9%      -0.6        0.44 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.copy_user_enhanced_fast_string
>>        0.76 =C2=B1  3%      -0.6        0.15 =C2=B1 26%  perf-profile.se=
lf.cycles-pp.drain_obj_stock
>>        0.67 =C2=B1  4%      -0.5        0.14 =C2=B1 23%  perf-profile.se=
lf.cycles-pp.refill_obj_stock
>>        0.69 =C2=B1  6%      -0.3        0.37 =C2=B1 10%  perf-profile.se=
lf.cycles-pp._raw_spin_lock_bh
>>        0.45 =C2=B1  8%      -0.3        0.20 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.__inet_lookup_established
>>        0.53 =C2=B1  7%      -0.2        0.28 =C2=B1 15%  perf-profile.se=
lf.cycles-pp.get_obj_cgroup_from_current
>>        0.35 =C2=B1  7%      -0.2        0.14 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.page_counter_cancel
>>        0.42 =C2=B1  9%      -0.2        0.22 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.__schedule
>>        0.26 =C2=B1  6%      -0.2        0.07 =C2=B1 37%  perf-profile.se=
lf.cycles-pp.__slab_free
>>        0.32 =C2=B1  4%      -0.2        0.15 =C2=B1 18%  perf-profile.se=
lf.cycles-pp.dst_release
>>        0.69 =C2=B1  7%      -0.1        0.55 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.kmem_cache_alloc
>>        0.24 =C2=B1  7%      -0.1        0.10 =C2=B1 17%  perf-profile.se=
lf.cycles-pp.tcp_sendmsg_locked
>>        0.17 =C2=B1  8%      -0.1        0.05 =C2=B1 49%  perf-profile.se=
lf.cycles-pp.enqueue_entity
>>        0.25 =C2=B1  9%      -0.1        0.14 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.update_rq_clock
>>        0.15 =C2=B1 12%      -0.1        0.06 =C2=B1 19%  perf-profile.se=
lf.cycles-pp.ipv4_dst_check
>>        0.23 =C2=B1  9%      -0.1        0.14 =C2=B1 15%  perf-profile.se=
lf.cycles-pp.page_counter_try_charge
>>        0.38 =C2=B1  4%      -0.1        0.30 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.percpu_counter_add_batch
>>        0.16 =C2=B1  4%      -0.1        0.08 =C2=B1 32%  perf-profile.se=
lf.cycles-pp.apparmor_file_free_security
>>        0.18 =C2=B1  7%      -0.1        0.10 =C2=B1 22%  perf-profile.se=
lf.cycles-pp.apparmor_file_alloc_security
>>        0.29 =C2=B1 11%      -0.1        0.21 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.__sk_destruct
>>        0.15 =C2=B1 12%      -0.1        0.08 =C2=B1 20%  perf-profile.se=
lf.cycles-pp.enqueue_task_fair
>>        0.21 =C2=B1 14%      -0.1        0.14 =C2=B1 23%  perf-profile.se=
lf.cycles-pp.update_load_avg
>>        0.29 =C2=B1  8%      -0.1        0.22 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.aa_sk_perm
>>        0.13 =C2=B1  5%      -0.1        0.06 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.skb_release_data
>>        0.12 =C2=B1 14%      -0.1        0.05 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.ip_rcv_finish_core
>>        0.28 =C2=B1  8%      -0.1        0.22 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.tcp_ack
>>        0.13 =C2=B1  8%      -0.1        0.07 =C2=B1 19%  perf-profile.se=
lf.cycles-pp.__ksize
>>        0.12 =C2=B1  9%      -0.1        0.06 =C2=B1 23%  perf-profile.se=
lf.cycles-pp.wait_woken
>>        0.21 =C2=B1  8%      -0.1        0.15 =C2=B1  4%  perf-profile.se=
lf.cycles-pp.memcpy_erms
>>        0.14 =C2=B1  8%      -0.1        0.08 =C2=B1 16%  perf-profile.se=
lf.cycles-pp.update_curr
>>        0.21 =C2=B1  5%      -0.1        0.16 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.__dev_queue_xmit
>>        0.08 =C2=B1 14%      -0.1        0.03 =C2=B1100%  perf-profile.se=
lf.cycles-pp.__skb_clone
>>        0.16 =C2=B1  8%      -0.1        0.11 =C2=B1 18%  perf-profile.se=
lf.cycles-pp.__switch_to
>>        0.09 =C2=B1 13%      -0.0        0.04 =C2=B1 45%  perf-profile.se=
lf.cycles-pp.tcp_conn_request
>>        0.14 =C2=B1 10%      -0.0        0.10 =C2=B1 23%  perf-profile.se=
lf.cycles-pp.apparmor_sk_clone_security
>>        0.25 =C2=B1  5%      -0.0        0.20 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.sk_forced_mem_schedule
>>        0.27 =C2=B1  5%      -0.0        0.23 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.ip_route_output_key_hash_rcu
>>        0.16 =C2=B1 10%      -0.0        0.12 =C2=B1 18%  perf-profile.se=
lf.cycles-pp.common_file_perm
>>        0.09 =C2=B1  9%      -0.0        0.05 =C2=B1 45%  perf-profile.se=
lf.cycles-pp.tcp_set_state
>>        0.11 =C2=B1 12%      -0.0        0.07 =C2=B1 47%  perf-profile.se=
lf.cycles-pp.validate_xmit_skb
>>        0.10 =C2=B1  8%      -0.0        0.06 =C2=B1 50%  perf-profile.se=
lf.cycles-pp.sk_alloc
>>        0.15 =C2=B1  9%      -0.0        0.11 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.__switch_to_asm
>>        0.10 =C2=B1  6%      -0.0        0.06 =C2=B1 49%  perf-profile.se=
lf.cycles-pp.apparmor_socket_post_create
>>        0.12 =C2=B1  6%      -0.0        0.08 =C2=B1 22%  perf-profile.se=
lf.cycles-pp.try_to_wake_up
>>        0.10 =C2=B1  7%      -0.0        0.06 =C2=B1 16%  perf-profile.se=
lf.cycles-pp.__vma_link_rb
>>        0.09 =C2=B1  7%      -0.0        0.06 =C2=B1 47%  perf-profile.se=
lf.cycles-pp.switch_mm_irqs_off
>>        0.15 =C2=B1  9%      -0.0        0.11 =C2=B1 17%  perf-profile.se=
lf.cycles-pp.__update_load_avg_se
>>        0.17 =C2=B1 10%      -0.0        0.14 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.do_mmap
>>        0.17 =C2=B1  5%      -0.0        0.13 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.unmap_page_range
>>        0.11 =C2=B1  4%      -0.0        0.08 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.__mark_inode_dirty
>>        0.10 =C2=B1 13%      -0.0        0.07 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.kmem_cache_alloc_trace
>>        0.12 =C2=B1  8%      -0.0        0.09 =C2=B1 20%  perf-profile.se=
lf.cycles-pp.__kmalloc_node_track_caller
>>        0.08 =C2=B1 13%      -0.0        0.05 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.reweight_entity
>>        0.07 =C2=B1  5%      -0.0        0.05 =C2=B1 45%  perf-profile.se=
lf.cycles-pp.enqueue_to_backlog
>>        0.12 =C2=B1 13%      +0.0        0.16 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__update_load_avg_cfs_rq
>>        0.06 =C2=B1  9%      +0.0        0.10 =C2=B1  9%  perf-profile.se=
lf.cycles-pp._raw_spin_unlock_irqrestore
>>        0.03 =C2=B1 70%      +0.0        0.08 =C2=B1 20%  perf-profile.se=
lf.cycles-pp.rb_next
>>        0.01 =C2=B1223%      +0.1        0.07 =C2=B1 22%  perf-profile.se=
lf.cycles-pp.rb_erase
>>        0.00            +0.1        0.07 =C2=B1 16%  perf-profile.self.cy=
cles-pp.load_balance
>>        0.00            +0.1        0.08 =C2=B1 38%  perf-profile.self.cy=
cles-pp.rebalance_domains
>>        0.06 =C2=B1 11%      +0.1        0.14 =C2=B1 24%  perf-profile.se=
lf.cycles-pp.tsc_verify_tsc_adjust
>>        0.11 =C2=B1 15%      +0.1        0.20 =C2=B1 18%  perf-profile.se=
lf.cycles-pp.nr_iowait_cpu
>>        0.00            +0.1        0.09 =C2=B1 20%  perf-profile.self.cy=
cles-pp.scheduler_tick
>>        0.00            +0.1        0.10 =C2=B1  9%  perf-profile.self.cy=
cles-pp.memcpy_toio
>>        0.00            +0.1        0.10 =C2=B1 15%  perf-profile.self.cy=
cles-pp.timerqueue_add
>>        0.00            +0.1        0.11 =C2=B1 26%  perf-profile.self.cy=
cles-pp.perf_mux_hrtimer_handler
>>        0.02 =C2=B1142%      +0.1        0.12 =C2=B1 15%  perf-profile.se=
lf.cycles-pp._find_next_bit
>>        0.00            +0.1        0.11 =C2=B1 23%  perf-profile.self.cy=
cles-pp.asm_sysvec_apic_timer_interrupt
>>        0.04 =C2=B1 71%      +0.1        0.15 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.switch_fpu_return
>>        0.00            +0.1        0.13 =C2=B1 28%  perf-profile.self.cy=
cles-pp.__hrtimer_run_queues
>>        0.02 =C2=B1141%      +0.1        0.15 =C2=B1 28%  perf-profile.se=
lf.cycles-pp.update_blocked_averages
>>        0.05 =C2=B1 45%      +0.1        0.19 =C2=B1 16%  perf-profile.se=
lf.cycles-pp.update_irq_load_avg
>>        0.00            +0.1        0.15 =C2=B1 22%  perf-profile.self.cy=
cles-pp.hrtimer_interrupt
>>        0.00            +0.1        0.15 =C2=B1  7%  perf-profile.self.cy=
cles-pp.__hrtimer_next_event_base
>>        0.00            +0.2        0.19 =C2=B1 13%  perf-profile.self.cy=
cles-pp.load_new_mm_cr3
>>        0.01 =C2=B1223%      +0.2        0.19 =C2=B1 24%  perf-profile.se=
lf.cycles-pp.arch_scale_freq_tick
>>        0.08 =C2=B1  8%      +0.2        0.28 =C2=B1 15%  perf-profile.se=
lf.cycles-pp.calc_global_load_tick
>>        0.08 =C2=B1 14%      +0.2        0.28 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.tick_nohz_next_event
>>        0.01 =C2=B1223%      +0.2        0.21 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.__intel_pmu_enable_all
>>        0.03 =C2=B1 70%      +0.2        0.26 =C2=B1 16%  perf-profile.se=
lf.cycles-pp.rcu_sched_clock_irq
>>        0.09 =C2=B1 10%      +0.2        0.34 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.irqtime_account_irq
>>        0.08 =C2=B1 14%      +0.2        0.32 =C2=B1 17%  perf-profile.se=
lf.cycles-pp._raw_spin_trylock
>>        0.26 =C2=B1 11%      +0.2        0.51 =C2=B1  4%  perf-profile.se=
lf.cycles-pp.native_sched_clock
>>        0.10 =C2=B1 15%      +0.3        0.39 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.ktime_get_update_offsets_now
>>        0.04 =C2=B1 71%      +0.3        0.34 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.io_serial_in
>>        0.00            +0.3        0.31 =C2=B1 18%  perf-profile.self.cy=
cles-pp.timekeeping_max_deferment
>>        0.43 =C2=B1  8%      +0.3        0.76 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.read_tsc
>>        0.09 =C2=B1 10%      +0.3        0.42 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.update_process_times
>>        0.03 =C2=B1 99%      +0.3        0.37 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.idle_cpu
>>        0.11 =C2=B1  9%      +0.5        0.62 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.lapic_next_deadline
>>        0.10 =C2=B1 11%      +0.5        0.62 =C2=B1  4%  perf-profile.se=
lf.cycles-pp.native_irq_return_iret
>>        0.09 =C2=B1 20%      +0.7        0.82 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.update_sd_lb_stats
>>        0.50 =C2=B1  7%      +0.8        1.29 =C2=B1 31%  perf-profile.se=
lf.cycles-pp.menu_select
>>        0.30 =C2=B1  9%      +1.7        1.97 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.cpuidle_enter_state
>>        0.80 =C2=B1  8%      +2.1        2.87 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.ktime_get
>>
>>
>>                                                                         =
         =

>>                               stress-ng.time.user_time
>>                                                                         =
         =

>>    160 +----------------------------------------------------------------=
-----+
>>        |                                                                =
  +  |
>>    140 |-+                                                              =
  :  |
>>    120 |-+                                                              =
  :  |
>>        |                                                                =
 ::  |
>>    100 |-+                                                              =
 ::  |
>>        |                                                                =
 : : |
>>     80 |-+                                                              =
 : : |
>>        |                                                                =
 : : |
>>     60 |-+                                                              =
:  : |
>>     40 |-+                                                              =
:  : |
>>        |.++.+.++.++.+.++.+.++.++.+.++.+.++.++.+.++.+.++.++.+.++.+.++.++.=
+  +.|
>>     20 |-+                                                              =
     |
>>        | OO O OO OO O OO O OO OO O OO O OO OO O OO O OO OO              =
     |
>>      0 +----------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
                                                                           =
              =

>>                              stress-ng.time.system_time
>>                                                                         =
         =

>>    500 +----------------------------------------------------------------=
-----+
>>        |       +.                                             +.        =
 .+  |
>>    450 |.++.+.+  ++.+.++.+.++.++.+.++.+.++.++.+.+ .+.+ .++.+.+  +.++.++.=
+  +.|
>>    400 |-+                                       +    +                 =
     |
>>        |                                                                =
     |
>>    350 |-+                                                              =
     |
>>    300 |-+                                                              =
     |
>>        |                                                                =
     |
>>    250 |-+                                                              =
     |
>>    200 |-+                                                              =
     |
>>        |                                                                =
     |
>>    150 |-+                                                              =
     |
>>    100 |-O       OO    O                                                =
     |
>>        |  O O OO    O O  O OO OO O OO O OO OO O OO O OO OO              =
     |
>>     50 +----------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
                                                                           =
              =

>>                      stress-ng.time.percent_of_cpu_this_job_got
>>                                                                         =
         =

>>    1000 +---------------------------------------------------------------=
-----+
>>         |                                                               =
  :  |
>>     900 |-+                                                             =
 : : |
>>     800 |.+    .+. +.    .++.++.   +.+     +.   +.            .+        =
 : +.|
>>         | ++.++   +  ++.+       +.+   +.+.+  +.+  ++.+.++.++.+  +.++.+.+=
+    |
>>     700 |-+                                                             =
     |
>>     600 |-+                                                             =
     |
>>         |                                                               =
     |
>>     500 |-+                                                             =
     |
>>     400 |-+                                                             =
     |
>>         |                                                               =
     |
>>     300 |-+                                                             =
     |
>>     200 |-+                                                             =
     |
>>         | OO OO O OO OO O  O OO   O  OO O  O           O                =
     |
>>     100 +---------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
                                                                           =
              =

>>                            stress-ng.time.minor_page_faults
>>                                                                         =
         =

>>    18500 +--------------------------------------------------------------=
-----+
>>          |                                                              =
     |
>>          |                      .+       +                         .+   =
+    |
>>    18000 |-+ .+                + :      + :  +.+.+           +.   +  +  =
:+   |
>>          | :+  :       +.++   +   :  +.+  +.+     :  +.   +.+  + +    +:=
  + +|
>>          |:    +.  .+. :   + +    +.+             +. : + +      +      +=
   + |
>>    17500 |:+     ++   +     +                       +   +               =
     |
>>          |                                                              =
     |
>>    17000 |-+                                                            =
     |
>>          |                                                              =
     |
>>          |  O       O     O         O                O O                =
     |
>>    16500 |-O      O   O  O  O    OO  O    O O    O  O   O O             =
     |
>>          |       O     O      OO       O O   O O                        =
     |
>>          |    OO                                  O                     =
     |
>>    16000 +--------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
                                                                           =
              =

>>                         stress-ng.time.voluntary_context_switches
>>                                                                         =
         =

>>    1.8e+07 +------------------------------------------------------------=
-----+
>>            |.++.+   +.++.++     +.+.+     +        ++.+.++.++.++.++.++.+=
+.+  |
>>    1.6e+07 |-+                                                          =
     |
>>    1.4e+07 |-+                                                          =
     |
>>            |                                                            =
     |
>>    1.2e+07 |-+                                                          =
     |
>>            |                                                            =
     |
>>      1e+07 |-+                                                          =
     |
>>            |                                                            =
     |
>>      8e+06 |-+                                                          =
     |
>>      6e+06 |-+                                                          =
     |
>>            |        O                                                   =
     |
>>      4e+06 |-O  OO O  OO OO  O O       OO                               =
     |
>>            |  O             O   O O OO    OO OO OO OO O OO O            =
     |
>>      2e+06 +------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
                                                                           =
              =

>>                       stress-ng.time.involuntary_context_switches
>>                                                                         =
         =

>>    240000 +-------------------------------------------------------------=
-----+
>>    220000 |-+         O   O                                             =
     |
>>           |             O                              O O              =
     |
>>    200000 |-+O                O OO O    OO OO      O      O             =
     |
>>    180000 |-+              O O      O O        O    O O                 =
     |
>>    160000 |-+      O O                        O  O                      =
     |
>>    140000 |-O  OO O                                                     =
     |
>>           |                                                             =
     |
>>    120000 |-+                                                           =
     |
>>    100000 |-+                                                           =
     |
>>     80000 |-+                                                           =
     |
>>     60000 |-+                                                           =
     |
>>           |                                                             =
     |
>>     40000 |-+                                                           =
 .+  |
>>     20000 +-------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
                                                                           =
              =

>>                                 stress-ng.sockabuse.ops
>>                                                                         =
         =

>>    550000 +-------------------------------------------------------------=
-----+
>>    500000 |.++.++  +.++.+.+     ++.+     +     +   ++.++.++.++.+.++.++.+=
+  +.|
>>           |                                                             =
     |
>>    450000 |-+                                                           =
     |
>>    400000 |-+                                                           =
     |
>>           |                                                             =
     |
>>    350000 |-+                                                           =
     |
>>    300000 |-+                                                           =
     |
>>    250000 |-+                                                           =
     |
>>           |                                                             =
     |
>>    200000 |-+                                                           =
     |
>>    150000 |-O     OO O    O                                             =
     |
>>           |  O OO     O O  O OO OO OO O OO OO O  O     O                =
     |
>>    100000 |-+                                  O   OO O  OO             =
     |
>>     50000 +-------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
                                                                           =
              =

>>                            stress-ng.sockabuse.ops_per_sec
>>                                                                         =
         =

>>    9000 +---------------------------------------------------------------=
-----+
>>         | ++.+    +   +                 +         ++.+.++.++.+     +   +=
+    |
>>    8000 |-+                                                             =
     |
>>    7000 |-+                                                             =
     |
>>         |                                                               =
     |
>>    6000 |-+                                                             =
     |
>>         |                                                               =
     |
>>    5000 |-+                                                             =
     |
>>         |                                                               =
     |
>>    4000 |-+                                                             =
     |
>>    3000 |-+                                                             =
     |
>>         | O       OO    O                                               =
     |
>>    2000 |-+O OO O    OO    O OO   O  OO O  O                            =
     |
>>         |                 O     O  O      O  O OO OO O OO O             =
     |
>>    1000 +---------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
         =

>> [*] bisect-good sample
>> [O] bisect-bad  sample
>>
>> ************************************************************************=
***************************
>> lkp-csl-2ap3: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz w=
ith 192G memory
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/t=
box_group/test/testcase/ucode:
>>    cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/25%/debian-10.4-x=
86_64-20200603.cgz/300s/lkp-csl-2ap3/TCP_RR/netperf/0x5003006
>>
>> commit:
>>    05091b2b63 ("mm: soft_dirty: fail CLEAR_REFS_SOFT_DIRTY if not built =
into the kernel")
>>    80cb403876 ("sched/fair: skip select_idle_sibling() in presence of sy=
nc wakeups")
>>
>> 05091b2b63b3cf12 80cb403876fc973389d6ea100a3
>> ---------------- ---------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>     4134315           +67.1%    6908149        netperf.Throughput_total_=
tps
>>       86131           +67.1%     143919        netperf.Throughput_tps
>>       33441        +4.5e+06%  1.508e+09 =C2=B1 22%  netperf.time.involun=
tary_context_switches
>>       20597           -13.9%      17741 =C2=B1  2%  netperf.time.minor_p=
age_faults
>>        2034            -9.2%       1847 =C2=B1  3%  netperf.time.percent=
_of_cpu_this_job_got
>>        5830           -11.6%       5155 =C2=B1  4%  netperf.time.system_=
time
>>      296.10           +37.9%     408.25        netperf.time.user_time
>>    1.24e+09           -54.5%  5.646e+08 =C2=B1 58%  netperf.time.volunta=
ry_context_switches
>>    1.24e+09           +67.1%  2.072e+09        netperf.workload
>>       99749 =C2=B1  5%     -26.5%      73294 =C2=B1  3%  meminfo.Active
>>       99749 =C2=B1  5%     -26.5%      73294 =C2=B1  3%  meminfo.Active(=
anon)
>>        8.92            -2.9        6.05        mpstat.cpu.all.soft%
>>       18.09            -2.6       15.54        mpstat.cpu.all.sys%
>>        1.15            +0.4        1.58 =C2=B1  3%  mpstat.cpu.all.usr%
>>       19843 =C2=B1  4%     -30.9%      13716 =C2=B1  7%  numa-vmstat.nod=
e3.nr_active_anon
>>        7350 =C2=B1 86%    +235.0%      24620 =C2=B1 36%  numa-vmstat.nod=
e3.nr_anon_pages
>>       19843 =C2=B1  4%     -30.9%      13716 =C2=B1  7%  numa-vmstat.nod=
e3.nr_zone_active_anon
>>   7.587e+09 =C2=B1  4%     -99.2%   58483423 =C2=B1135%  cpuidle.C1.time
>>   1.683e+09 =C2=B1  2%     -99.5%    8551248 =C2=B1144%  cpuidle.C1.usage
>>   2.759e+09 =C2=B1  8%     -98.3%   46169220 =C2=B1168%  cpuidle.POLL.ti=
me
>>   7.989e+08 =C2=B1  9%     -99.7%    2127858 =C2=B1167%  cpuidle.POLL.us=
age
>>       79204 =C2=B1  4%     -30.9%      54727 =C2=B1  7%  numa-meminfo.no=
de3.Active
>>       79204 =C2=B1  4%     -30.9%      54727 =C2=B1  7%  numa-meminfo.no=
de3.Active(anon)
>>        7850 =C2=B1137%    +519.5%      48629 =C2=B1 46%  numa-meminfo.no=
de3.AnonHugePages
>>       29407 =C2=B1 86%    +234.8%      98448 =C2=B1 36%  numa-meminfo.no=
de3.AnonPages
>>       24857 =C2=B1  5%     -26.5%      18267 =C2=B1  3%  proc-vmstat.nr_=
active_anon
>>      773707            -7.9%     712705 =C2=B1  2%  proc-vmstat.nr_mapped
>>       24857 =C2=B1  5%     -26.5%      18267 =C2=B1  3%  proc-vmstat.nr_=
zone_active_anon
>>       26473 =C2=B1  3%     -21.4%      20809 =C2=B1  3%  proc-vmstat.pga=
ctivate
>>       68.00            +8.8%      74.00        vmstat.cpu.id
>>       59.17           +25.4%      74.17        vmstat.procs.r
>>    16317385           -16.3%   13652857        vmstat.system.cs
>>      400157            -2.5%     389989        vmstat.system.in
>>      838.83 =C2=B1  6%     +18.7%     995.83 =C2=B1  6%  slabinfo.TCP.ac=
tive_objs
>>      838.83 =C2=B1  6%     +18.7%     995.83 =C2=B1  6%  slabinfo.TCP.nu=
m_objs
>>        2823 =C2=B1  9%     +27.0%       3585 =C2=B1  7%  slabinfo.dmaeng=
ine-unmap-16.active_objs
>>        2823 =C2=B1  9%     +27.0%       3585 =C2=B1  7%  slabinfo.dmaeng=
ine-unmap-16.num_objs
>>       98793 =C2=B1  5%     -11.3%      87633        slabinfo.filp.active=
_objs
>>        1545 =C2=B1  5%     -11.2%       1372        slabinfo.filp.active=
_slabs
>>       98957 =C2=B1  5%     -11.2%      87884        slabinfo.filp.num_ob=
js
>>        1545 =C2=B1  5%     -11.2%       1372        slabinfo.filp.num_sl=
abs
>>        2708 =C2=B1 14%     +19.9%       3247 =C2=B1  3%  slabinfo.fsnoti=
fy_mark_connector.active_objs
>>        2708 =C2=B1 14%     +19.9%       3247 =C2=B1  3%  slabinfo.fsnoti=
fy_mark_connector.num_objs
>>        4837 =C2=B1  5%     +11.8%       5410 =C2=B1  3%  slabinfo.kmallo=
c-rcl-64.active_objs
>>        4837 =C2=B1  5%     +11.8%       5410 =C2=B1  3%  slabinfo.kmallo=
c-rcl-64.num_objs
>>        2255 =C2=B1  5%     +48.1%       3340 =C2=B1  5%  slabinfo.reques=
t_sock_TCP.active_objs
>>        2255 =C2=B1  5%     +48.1%       3340 =C2=B1  5%  slabinfo.reques=
t_sock_TCP.num_objs
>>        3725 =C2=B1  3%     +74.9%       6514 =C2=B1 12%  slabinfo.trace_=
event_file.active_objs
>>        3725 =C2=B1  3%     +74.9%       6514 =C2=B1 12%  slabinfo.trace_=
event_file.num_objs
>>       93470 =C2=B1 14%     -99.4%     533.72 =C2=B1138%  sched_debug.cfs=
_rq:/.MIN_vruntime.avg
>>     1730077 =C2=B1  7%     -94.7%      91175 =C2=B1139%  sched_debug.cfs=
_rq:/.MIN_vruntime.max
>>      357638 =C2=B1  9%     -98.1%       6955 =C2=B1138%  sched_debug.cfs=
_rq:/.MIN_vruntime.stddev
>>        7816 =C2=B1  4%     -26.6%       5740 =C2=B1  7%  sched_debug.cfs=
_rq:/.load.avg
>>       26935 =C2=B1  5%    +131.1%      62257 =C2=B1103%  sched_debug.cfs=
_rq:/.load.max
>>        6.65 =C2=B1  7%     +20.5%       8.01 =C2=B1  7%  sched_debug.cfs=
_rq:/.load_avg.avg
>>       93470 =C2=B1 14%     -99.4%     533.72 =C2=B1138%  sched_debug.cfs=
_rq:/.max_vruntime.avg
>>     1730077 =C2=B1  7%     -94.7%      91175 =C2=B1139%  sched_debug.cfs=
_rq:/.max_vruntime.max
>>      357638 =C2=B1  9%     -98.1%       6955 =C2=B1138%  sched_debug.cfs=
_rq:/.max_vruntime.stddev
>>      976926 =C2=B1  8%     +24.2%    1212908        sched_debug.cfs_rq:/=
.min_vruntime.min
>>      186635 =C2=B1 11%     -33.3%     124538 =C2=B1  9%  sched_debug.cfs=
_rq:/.min_vruntime.stddev
>>        0.35 =C2=B1  3%     -30.1%       0.24 =C2=B1  4%  sched_debug.cfs=
_rq:/.nr_running.avg
>>      270.45           +51.5%     409.68 =C2=B1  4%  sched_debug.cfs_rq:/=
.runnable_avg.avg
>>      868.51 =C2=B1  4%     +64.5%       1428        sched_debug.cfs_rq:/=
.runnable_avg.max
>>      233.89          +143.0%     568.45        sched_debug.cfs_rq:/.runn=
able_avg.stddev
>>      368248 =C2=B1  9%    -146.9%    -172655        sched_debug.cfs_rq:/=
.spread0.avg
>>     1093458 =C2=B1 20%     -34.8%     713080 =C2=B1 24%  sched_debug.cfs=
_rq:/.spread0.max
>>     -134749          +189.6%    -390273        sched_debug.cfs_rq:/.spre=
ad0.min
>>      186651 =C2=B1 11%     -33.2%     124592 =C2=B1  9%  sched_debug.cfs=
_rq:/.spread0.stddev
>>      868.17 =C2=B1  4%     +21.0%       1050 =C2=B1  2%  sched_debug.cfs=
_rq:/.util_avg.max
>>      233.66           +70.9%     399.34        sched_debug.cfs_rq:/.util=
_avg.stddev
>>      700.42 =C2=B1  7%     +40.1%     981.08 =C2=B1  2%  sched_debug.cfs=
_rq:/.util_est_enqueued.max
>>      210.13           +53.8%     323.27 =C2=B1  2%  sched_debug.cfs_rq:/=
.util_est_enqueued.stddev
>>      398575 =C2=B1  4%     +85.1%     737843        sched_debug.cpu.avg_=
idle.avg
>>        3223 =C2=B1  4%  +11256.8%     366120 =C2=B1  4%  sched_debug.cpu=
.avg_idle.min
>>      407707 =C2=B1  4%     -44.5%     226270 =C2=B1  4%  sched_debug.cpu=
.avg_idle.stddev
>>        8.16 =C2=B1  3%     +40.1%      11.43 =C2=B1  6%  sched_debug.cpu=
.clock.stddev
>>        1877 =C2=B1  7%     -45.0%       1032 =C2=B1  5%  sched_debug.cpu=
.clock_task.stddev
>>        0.00 =C2=B1  6%     +66.2%       0.00 =C2=B1  6%  sched_debug.cpu=
.next_balance.stddev
>>        0.27           +30.6%       0.36 =C2=B1  4%  sched_debug.cpu.nr_r=
unning.avg
>>        1.00          +102.8%       2.03 =C2=B1  3%  sched_debug.cpu.nr_r=
unning.max
>>        0.42           +56.0%       0.66        sched_debug.cpu.nr_runnin=
g.stddev
>>    15821295 =C2=B1  7%     -20.3%   12607104 =C2=B1  2%  sched_debug.cpu=
.nr_switches.max
>>     1616322 =C2=B1 10%     -56.1%     710287 =C2=B1 13%  sched_debug.cpu=
.nr_switches.stddev
>>       22.89           -97.9%       0.49 =C2=B1  9%  perf-stat.i.MPKI
>>   3.303e+10           +21.8%  4.024e+10        perf-stat.i.branch-instru=
ctions
>>        1.56            +0.0        1.60        perf-stat.i.branch-miss-r=
ate%
>>   5.045e+08           +25.9%  6.351e+08        perf-stat.i.branch-misses
>>        1.87 =C2=B1 23%     +37.7       39.58 =C2=B1 18%  perf-stat.i.cac=
he-miss-rate%
>>    63466408 =C2=B1 22%     -40.6%   37691548 =C2=B1 25%  perf-stat.i.cac=
he-misses
>>   3.609e+09           -97.4%   93036558 =C2=B1 10%  perf-stat.i.cache-re=
ferences
>>    16436949           -16.3%   13749701        perf-stat.i.context-switc=
hes
>>        1.55           -48.8%       0.80        perf-stat.i.cpi
>>   2.455e+11           -35.7%  1.579e+11        perf-stat.i.cpu-cycles
>>      912.50 =C2=B1  5%   +1488.4%      14494 =C2=B1  4%  perf-stat.i.cpu=
-migrations
>>        0.01 =C2=B1  2%      -0.0        0.01 =C2=B1  2%  perf-stat.i.dTL=
B-load-miss-rate%
>>     5782867           -12.6%    5054593 =C2=B1  2%  perf-stat.i.dTLB-loa=
d-misses
>>   4.696e+10           +27.4%  5.981e+10        perf-stat.i.dTLB-loads
>>        0.00 =C2=B1  5%      -0.0        0.00 =C2=B1  8%  perf-stat.i.dTL=
B-store-miss-rate%
>>      299881 =C2=B1  2%     -37.5%     187379 =C2=B1  4%  perf-stat.i.dTL=
B-store-misses
>>     2.7e+10           +26.1%  3.403e+10        perf-stat.i.dTLB-stores
>>       77.89            -1.0       76.86        perf-stat.i.iTLB-load-mis=
s-rate%
>>   3.762e+08           +35.9%  5.112e+08        perf-stat.i.iTLB-load-mis=
ses
>>   1.059e+08 =C2=B1  2%     +45.1%  1.537e+08        perf-stat.i.iTLB-loa=
ds
>>   1.604e+11           +24.5%  1.996e+11        perf-stat.i.instructions
>>      436.26            -7.3%     404.60        perf-stat.i.instructions-=
per-iTLB-miss
>>        0.65           +93.6%       1.26        perf-stat.i.ipc
>>        1.28           -35.7%       0.82        perf-stat.i.metric.GHz
>>        0.66 =C2=B1 19%     -43.8%       0.37 =C2=B1 14%  perf-stat.i.met=
ric.K/sec
>>      576.77           +21.3%     699.83        perf-stat.i.metric.M/sec
>>      496167 =C2=B1 19%     -50.5%     245482 =C2=B1 14%  perf-stat.i.nod=
e-stores
>>       22.51           -97.9%       0.47 =C2=B1 11%  perf-stat.overall.MP=
KI
>>        1.53            +0.1        1.58        perf-stat.overall.branch-=
miss-rate%
>>        1.76 =C2=B1 24%     +38.1       39.88 =C2=B1 17%  perf-stat.overa=
ll.cache-miss-rate%
>>        1.53           -48.3%       0.79        perf-stat.overall.cpi
>>        0.01 =C2=B1  2%      -0.0        0.01 =C2=B1  2%  perf-stat.overa=
ll.dTLB-load-miss-rate%
>>        0.00 =C2=B1  2%      -0.0        0.00 =C2=B1  4%  perf-stat.overa=
ll.dTLB-store-miss-rate%
>>       78.02            -1.1       76.88        perf-stat.overall.iTLB-lo=
ad-miss-rate%
>>      426.29            -8.4%     390.48        perf-stat.overall.instruc=
tions-per-iTLB-miss
>>        0.65           +93.5%       1.26        perf-stat.overall.ipc
>>       38918           -25.6%      28952        perf-stat.overall.path-le=
ngth
>>   3.292e+10           +21.8%   4.01e+10        perf-stat.ps.branch-instr=
uctions
>>   5.027e+08           +25.9%   6.33e+08        perf-stat.ps.branch-misses
>>    63241572 =C2=B1 22%     -40.6%   37565660 =C2=B1 25%  perf-stat.ps.ca=
che-misses
>>   3.596e+09           -97.4%   92734972 =C2=B1 10%  perf-stat.ps.cache-r=
eferences
>>    16379117           -16.3%   13702803        perf-stat.ps.context-swit=
ches
>>   2.446e+11           -35.7%  1.574e+11        perf-stat.ps.cpu-cycles
>>      910.23 =C2=B1  4%   +1486.9%      14444 =C2=B1  4%  perf-stat.ps.cp=
u-migrations
>>     5746475           -12.6%    5024544 =C2=B1  2%  perf-stat.ps.dTLB-lo=
ad-misses
>>   4.679e+10           +27.4%  5.961e+10        perf-stat.ps.dTLB-loads
>>      298170 =C2=B1  2%     -37.5%     186371 =C2=B1  4%  perf-stat.ps.dT=
LB-store-misses
>>    2.69e+10           +26.1%  3.392e+10        perf-stat.ps.dTLB-stores
>>   3.748e+08           +35.9%  5.094e+08        perf-stat.ps.iTLB-load-mi=
sses
>>   1.056e+08 =C2=B1  2%     +45.1%  1.532e+08        perf-stat.ps.iTLB-lo=
ads
>>   1.598e+11           +24.5%  1.989e+11        perf-stat.ps.instructions
>>      494202 =C2=B1 19%     -50.5%     244515 =C2=B1 14%  perf-stat.ps.no=
de-stores
>>   4.827e+13           +24.3%      6e+13        perf-stat.total.instructi=
ons
>>     4514963 =C2=B1  3%    +169.8%   12183158 =C2=B1  3%  softirqs.CPU0.N=
ET_RX
>>       57840 =C2=B1  2%     -30.4%      40272 =C2=B1  3%  softirqs.CPU0.S=
CHED
>>     5634038 =C2=B1  3%     +86.7%   10517528 =C2=B1 12%  softirqs.CPU1.N=
ET_RX
>>       58880 =C2=B1  3%     -36.7%      37261 =C2=B1  2%  softirqs.CPU1.S=
CHED
>>     6269988 =C2=B1 14%     +77.8%   11148514 =C2=B1  3%  softirqs.CPU10.=
NET_RX
>>       57439 =C2=B1 11%     -35.0%      37356 =C2=B1  2%  softirqs.CPU10.=
SCHED
>>     7241135 =C2=B1  4%     +41.8%   10265566 =C2=B1  3%  softirqs.CPU100=
.NET_RX
>>       60946           -39.2%      37042        softirqs.CPU100.SCHED
>>     7034921 =C2=B1  2%     +46.0%   10270525 =C2=B1  4%  softirqs.CPU101=
.NET_RX
>>       60583 =C2=B1  2%     -38.8%      37104 =C2=B1  2%  softirqs.CPU101=
.SCHED
>>     6962924 =C2=B1  3%     +49.4%   10404653 =C2=B1  2%  softirqs.CPU102=
.NET_RX
>>       60340           -38.9%      36850 =C2=B1  2%  softirqs.CPU102.SCHED
>>     6558093 =C2=B1 11%     +56.2%   10244063 =C2=B1  3%  softirqs.CPU103=
.NET_RX
>>       58544 =C2=B1  3%     -36.8%      37023        softirqs.CPU103.SCHED
>>     6733196 =C2=B1  3%     +49.5%   10066182 =C2=B1  3%  softirqs.CPU104=
.NET_RX
>>       59321           -37.8%      36913        softirqs.CPU104.SCHED
>>     6519101 =C2=B1  7%     +59.5%   10396727 =C2=B1  3%  softirqs.CPU105=
.NET_RX
>>       58655 =C2=B1  2%     -36.8%      37059        softirqs.CPU105.SCHED
>>     6186986 =C2=B1 13%     +67.4%   10355864 =C2=B1  3%  softirqs.CPU106=
.NET_RX
>>       58038 =C2=B1  4%     -36.2%      37008        softirqs.CPU106.SCHED
>>     6206558 =C2=B1  5%     +69.8%   10538252 =C2=B1  3%  softirqs.CPU107=
.NET_RX
>>       58186           -35.8%      37383 =C2=B1  2%  softirqs.CPU107.SCHED
>>     6127652 =C2=B1  4%     +73.0%   10603852 =C2=B1  3%  softirqs.CPU108=
.NET_RX
>>       58036 =C2=B1  2%     -36.2%      37049        softirqs.CPU108.SCHED
>>     6184698 =C2=B1  9%     +72.8%   10687153 =C2=B1  3%  softirqs.CPU109=
.NET_RX
>>     6622329 =C2=B1  3%     +71.4%   11350082 =C2=B1  3%  softirqs.CPU11.=
NET_RX
>>       59840           -37.2%      37568        softirqs.CPU11.SCHED
>>     6104182 =C2=B1  4%     +74.2%   10633270 =C2=B1  4%  softirqs.CPU110=
.NET_RX
>>       57509           -35.9%      36847        softirqs.CPU110.SCHED
>>     5897499 =C2=B1  6%     +85.0%   10912911 =C2=B1  5%  softirqs.CPU111=
.NET_RX
>>       57086 =C2=B1  2%     -35.5%      36844        softirqs.CPU111.SCHED
>>     5863767 =C2=B1  5%     +86.5%   10938178 =C2=B1  4%  softirqs.CPU112=
.NET_RX
>>       57268 =C2=B1  2%     -35.3%      37045        softirqs.CPU112.SCHED
>>     5795209 =C2=B1  4%     +89.0%   10951254 =C2=B1  4%  softirqs.CPU113=
.NET_RX
>>       57250 =C2=B1  2%     -35.4%      36967 =C2=B1  2%  softirqs.CPU113=
.SCHED
>>     5587321 =C2=B1  2%     +96.5%   10980817 =C2=B1  3%  softirqs.CPU114=
.NET_RX
>>       55953           -34.4%      36707        softirqs.CPU114.SCHED
>>     5815735 =C2=B1  6%     +86.0%   10815586 =C2=B1  2%  softirqs.CPU115=
.NET_RX
>>       56878 =C2=B1  2%     -34.8%      37082        softirqs.CPU115.SCHED
>>     5523247 =C2=B1  4%     +97.7%   10917021 =C2=B1  4%  softirqs.CPU116=
.NET_RX
>>       55909 =C2=B1  2%     -34.0%      36914        softirqs.CPU116.SCHED
>>     5561341 =C2=B1 10%     +91.3%   10636098 =C2=B1  3%  softirqs.CPU117=
.NET_RX
>>       56390 =C2=B1  3%     -33.6%      37467 =C2=B1  2%  softirqs.CPU117=
.SCHED
>>     5356126 =C2=B1  6%     +99.6%   10688404 =C2=B1  2%  softirqs.CPU118=
.NET_RX
>>       55733 =C2=B1  2%     -33.4%      37123        softirqs.CPU118.SCHED
>>     5252554 =C2=B1  8%    +104.0%   10714740 =C2=B1  7%  softirqs.CPU119=
.NET_RX
>>       55090 =C2=B1  4%     -32.5%      37170 =C2=B1  2%  softirqs.CPU119=
.SCHED
>>     6851646 =C2=B1  2%     +69.9%   11639026 =C2=B1  3%  softirqs.CPU12.=
NET_RX
>>       60064           -37.6%      37510        softirqs.CPU12.SCHED
>>     7297854 =C2=B1  6%     +46.4%   10681376 =C2=B1  4%  softirqs.CPU120=
.NET_RX
>>       61368 =C2=B1  3%     -39.2%      37287 =C2=B1  2%  softirqs.CPU120=
.SCHED
>>     7586100 =C2=B1  5%     +35.3%   10263413 =C2=B1  4%  softirqs.CPU121=
.NET_RX
>>       61578           -40.2%      36825 =C2=B1  2%  softirqs.CPU121.SCHED
>>     7476433 =C2=B1  5%     +38.9%   10386319 =C2=B1  2%  softirqs.CPU122=
.NET_RX
>>       61090           -39.3%      37057 =C2=B1  2%  softirqs.CPU122.SCHED
>>     7203246 =C2=B1  6%     +41.7%   10206666 =C2=B1  3%  softirqs.CPU123=
.NET_RX
>>       60221 =C2=B1  2%     -38.7%      36937 =C2=B1  2%  softirqs.CPU123=
.SCHED
>>     7300444 =C2=B1  4%     +42.5%   10405106 =C2=B1  3%  softirqs.CPU124=
.NET_RX
>>       60637 =C2=B1  2%     -38.9%      37043        softirqs.CPU124.SCHED
>>     6961275 =C2=B1  4%     +46.8%   10216271        softirqs.CPU125.NET_=
RX
>>       59941 =C2=B1  2%     -38.0%      37192 =C2=B1  2%  softirqs.CPU125=
.SCHED
>>     6938201 =C2=B1  6%     +50.2%   10419353 =C2=B1  4%  softirqs.CPU126=
.NET_RX
>>       60078 =C2=B1  2%     -38.3%      37058 =C2=B1  2%  softirqs.CPU126=
.SCHED
>>     6802153 =C2=B1  5%     +53.5%   10440688 =C2=B1  4%  softirqs.CPU127=
.NET_RX
>>       59156 =C2=B1  2%     -37.6%      36903 =C2=B1  2%  softirqs.CPU127=
.SCHED
>>     6751732 =C2=B1  4%     +54.8%   10453928 =C2=B1  4%  softirqs.CPU128=
.NET_RX
>>       58859 =C2=B1  2%     -37.3%      36927        softirqs.CPU128.SCHED
>>     6358125 =C2=B1  3%     +65.0%   10492964 =C2=B1  4%  softirqs.CPU129=
.NET_RX
>>       57746           -36.2%      36826        softirqs.CPU129.SCHED
>>     6976515 =C2=B1  4%     +70.7%   11906748 =C2=B1  2%  softirqs.CPU13.=
NET_RX
>>       60301 =C2=B1  2%     -38.4%      37141 =C2=B1  2%  softirqs.CPU13.=
SCHED
>>     6360817 =C2=B1  4%     +65.9%   10550231 =C2=B1  2%  softirqs.CPU130=
.NET_RX
>>       58248 =C2=B1  2%     -36.6%      36941 =C2=B1  2%  softirqs.CPU130=
.SCHED
>>     6214510 =C2=B1  2%     +71.7%   10667355 =C2=B1  2%  softirqs.CPU131=
.NET_RX
>>       57781           -36.1%      36930        softirqs.CPU131.SCHED
>>     5930272 =C2=B1  4%     +82.8%   10843308 =C2=B1  3%  softirqs.CPU132=
.NET_RX
>>       56616 =C2=B1  2%     -34.9%      36837        softirqs.CPU132.SCHED
>>     5960286 =C2=B1  8%     +78.0%   10608780 =C2=B1  3%  softirqs.CPU133=
.NET_RX
>>       56719 =C2=B1  2%     -35.1%      36823        softirqs.CPU133.SCHED
>>     6053122 =C2=B1  2%     +72.9%   10464450 =C2=B1  6%  softirqs.CPU134=
.NET_RX
>>       56873           -35.0%      36994        softirqs.CPU134.SCHED
>>     5959110 =C2=B1  3%     +76.8%   10538148 =C2=B1  4%  softirqs.CPU135=
.NET_RX
>>       57237 =C2=B1  3%     -35.8%      36762        softirqs.CPU135.SCHED
>>     5605751 =C2=B1  5%     +88.0%   10540431 =C2=B1  5%  softirqs.CPU136=
.NET_RX
>>       55670 =C2=B1  2%     -33.5%      37008 =C2=B1  2%  softirqs.CPU136=
.SCHED
>>     5654261 =C2=B1  2%     +93.4%   10937033 =C2=B1  5%  softirqs.CPU137=
.NET_RX
>>       55949           -33.9%      36996 =C2=B1  2%  softirqs.CPU137.SCHED
>>     5408923           +99.7%   10802914 =C2=B1  4%  softirqs.CPU138.NET_=
RX
>>       55266           -32.9%      37075 =C2=B1  2%  softirqs.CPU138.SCHED
>>     5488790 =C2=B1  4%     +98.4%   10889700 =C2=B1  4%  softirqs.CPU139=
.NET_RX
>>       53394 =C2=B1 13%     -31.2%      36745        softirqs.CPU139.SCHED
>>     7148184 =C2=B1  3%     +62.3%   11601276 =C2=B1  3%  softirqs.CPU14.=
NET_RX
>>       59830 =C2=B1  2%     -38.8%      36618 =C2=B1  2%  softirqs.CPU14.=
SCHED
>>     5587970 =C2=B1  2%     +95.1%   10901019 =C2=B1  4%  softirqs.CPU140=
.NET_RX
>>       55865           -34.4%      36642        softirqs.CPU140.SCHED
>>     5430179 =C2=B1  7%    +101.5%   10939152 =C2=B1  6%  softirqs.CPU141=
.NET_RX
>>       55081 =C2=B1  2%     -33.3%      36726 =C2=B1  2%  softirqs.CPU141=
.SCHED
>>     5229197 =C2=B1  3%    +106.0%   10772146 =C2=B1  5%  softirqs.CPU142=
.NET_RX
>>       54899           -32.5%      37036 =C2=B1  2%  softirqs.CPU142.SCHED
>>     5014410 =C2=B1  7%    +123.4%   11202194 =C2=B1  3%  softirqs.CPU143=
.NET_RX
>>       54372 =C2=B1  2%     -32.2%      36879 =C2=B1  2%  softirqs.CPU143=
.SCHED
>>       62483 =C2=B1  2%     -43.3%      35401 =C2=B1  5%  softirqs.CPU144=
.SCHED
>>     7237355 =C2=B1  6%     +38.2%   10001842 =C2=B1  2%  softirqs.CPU145=
.NET_RX
>>       60667           -38.8%      37104 =C2=B1  3%  softirqs.CPU145.SCHED
>>     7028773 =C2=B1  4%     +44.0%   10118629 =C2=B1  4%  softirqs.CPU146=
.NET_RX
>>       59848           -38.6%      36734        softirqs.CPU146.SCHED
>>     6811480 =C2=B1  5%     +51.5%   10319620 =C2=B1  4%  softirqs.CPU147=
.NET_RX
>>       58922 =C2=B1  2%     -37.5%      36818 =C2=B1  2%  softirqs.CPU147=
.SCHED
>>     6980805 =C2=B1  6%     +48.5%   10365526 =C2=B1  3%  softirqs.CPU148=
.NET_RX
>>       58354 =C2=B1  7%     -37.1%      36716 =C2=B1  2%  softirqs.CPU148=
.SCHED
>>     6821998 =C2=B1  3%     +47.9%   10090321 =C2=B1  4%  softirqs.CPU149=
.NET_RX
>>       58645 =C2=B1  3%     -37.1%      36876 =C2=B1  2%  softirqs.CPU149=
.SCHED
>>     7226811 =C2=B1  4%     +61.1%   11642848 =C2=B1  4%  softirqs.CPU15.=
NET_RX
>>       60774 =C2=B1  2%     -39.4%      36801        softirqs.CPU15.SCHED
>>     6460338 =C2=B1  5%     +58.0%   10210461 =C2=B1  3%  softirqs.CPU150=
.NET_RX
>>       58411 =C2=B1  2%     -36.7%      36955 =C2=B1  2%  softirqs.CPU150=
.SCHED
>>     6265442 =C2=B1  6%     +62.7%   10196809 =C2=B1  6%  softirqs.CPU151=
.NET_RX
>>       54934 =C2=B1 12%     -34.3%      36065 =C2=B1  4%  softirqs.CPU151=
.SCHED
>>     6311123 =C2=B1  5%     +64.2%   10359970 =C2=B1  4%  softirqs.CPU152=
.NET_RX
>>       57808 =C2=B1  2%     -36.6%      36632        softirqs.CPU152.SCHED
>>     6483359 =C2=B1  3%     +62.5%   10534866 =C2=B1  4%  softirqs.CPU153=
.NET_RX
>>       58149 =C2=B1  2%     -37.0%      36622        softirqs.CPU153.SCHED
>>     6345313 =C2=B1  4%     +60.2%   10162351 =C2=B1  3%  softirqs.CPU154=
.NET_RX
>>       57752 =C2=B1  2%     -36.6%      36588        softirqs.CPU154.SCHED
>>     6099781 =C2=B1  5%     +68.1%   10252061 =C2=B1  3%  softirqs.CPU155=
.NET_RX
>>       57352 =C2=B1  2%     -35.6%      36951 =C2=B1  2%  softirqs.CPU155=
.SCHED
>>     5398202 =C2=B1 10%     +92.8%   10409302 =C2=B1  3%  softirqs.CPU156=
.NET_RX
>>       55717 =C2=B1  4%     -33.9%      36813 =C2=B1  2%  softirqs.CPU156=
.SCHED
>>     5849102 =C2=B1  6%     +79.1%   10477773 =C2=B1  4%  softirqs.CPU157=
.NET_RX
>>       56328 =C2=B1  2%     -35.2%      36521 =C2=B1  2%  softirqs.CPU157=
.SCHED
>>     5824038 =C2=B1  4%     +79.1%   10428210 =C2=B1  3%  softirqs.CPU158=
.NET_RX
>>       56297 =C2=B1  2%     -34.9%      36653 =C2=B1  2%  softirqs.CPU158=
.SCHED
>>     5486147 =C2=B1  5%     +85.0%   10147814 =C2=B1  9%  softirqs.CPU159=
.NET_RX
>>       55531 =C2=B1  2%     -35.1%      36027 =C2=B1  5%  softirqs.CPU159=
.SCHED
>>     7245464 =C2=B1  3%     +63.5%   11848001 =C2=B1  3%  softirqs.CPU16.=
NET_RX
>>       61285           -39.8%      36882        softirqs.CPU16.SCHED
>>     5529243 =C2=B1  5%     +89.0%   10449760        softirqs.CPU160.NET_=
RX
>>       55603 =C2=B1  2%     -34.0%      36681 =C2=B1  2%  softirqs.CPU160=
.SCHED
>>     5522986 =C2=B1  9%     +94.6%   10746380 =C2=B1  4%  softirqs.CPU161=
.NET_RX
>>       55768 =C2=B1  3%     -34.3%      36644 =C2=B1  2%  softirqs.CPU161=
.SCHED
>>     5452189 =C2=B1  8%     +95.5%   10657847 =C2=B1  3%  softirqs.CPU162=
.NET_RX
>>       55302 =C2=B1  2%     -33.8%      36602 =C2=B1  2%  softirqs.CPU162=
.SCHED
>>     5381098 =C2=B1  6%     +96.4%   10568979 =C2=B1  3%  softirqs.CPU163=
.NET_RX
>>       55131           -33.6%      36626 =C2=B1  2%  softirqs.CPU163.SCHED
>>     5242191 =C2=B1  4%     +99.7%   10469781 =C2=B1  4%  softirqs.CPU164=
.NET_RX
>>       54699 =C2=B1  2%     -32.7%      36805 =C2=B1  2%  softirqs.CPU164=
.SCHED
>>     5206030 =C2=B1  7%    +104.9%   10667743 =C2=B1  5%  softirqs.CPU165=
.NET_RX
>>       54566 =C2=B1  2%     -32.9%      36631 =C2=B1  2%  softirqs.CPU165=
.SCHED
>>     4938399 =C2=B1  8%    +114.0%   10569918 =C2=B1  6%  softirqs.CPU166=
.NET_RX
>>       52836 =C2=B1  5%     -30.0%      37009 =C2=B1  2%  softirqs.CPU166=
.SCHED
>>     4600973 =C2=B1 12%    +137.0%   10903116 =C2=B1  4%  softirqs.CPU167=
.NET_RX
>>       52887 =C2=B1  4%     -30.6%      36697 =C2=B1  2%  softirqs.CPU167=
.SCHED
>>     7258184 =C2=B1  2%     +39.6%   10135289 =C2=B1  4%  softirqs.CPU168=
.NET_RX
>>       61930           -40.9%      36577 =C2=B1  3%  softirqs.CPU168.SCHED
>>     7087784 =C2=B1  3%     +36.1%    9646626 =C2=B1  3%  softirqs.CPU169=
.NET_RX
>>       60140           -39.4%      36440 =C2=B1  3%  softirqs.CPU169.SCHED
>>     7340805 =C2=B1  2%     +61.5%   11853638 =C2=B1  3%  softirqs.CPU17.=
NET_RX
>>       61443           -39.9%      36927        softirqs.CPU17.SCHED
>>     6810915 =C2=B1 10%     +47.2%   10026759 =C2=B1  3%  softirqs.CPU170=
.NET_RX
>>       59162 =C2=B1  3%     -37.5%      36983 =C2=B1  2%  softirqs.CPU170=
.SCHED
>>     6839765 =C2=B1  5%     +46.1%    9993731 =C2=B1  3%  softirqs.CPU171=
.NET_RX
>>       59234 =C2=B1  2%     -37.7%      36917 =C2=B1  2%  softirqs.CPU171=
.SCHED
>>     6653593 =C2=B1  7%     +50.1%    9985043 =C2=B1  4%  softirqs.CPU172=
.NET_RX
>>       58729 =C2=B1  3%     -38.2%      36307 =C2=B1  4%  softirqs.CPU172=
.SCHED
>>     6445021 =C2=B1  5%     +54.9%    9982798 =C2=B1  5%  softirqs.CPU173=
.NET_RX
>>       58179 =C2=B1  2%     -36.7%      36806 =C2=B1  3%  softirqs.CPU173=
.SCHED
>>     6322355 =C2=B1  5%     +60.5%   10145804 =C2=B1  3%  softirqs.CPU174=
.NET_RX
>>       57871 =C2=B1  2%     -36.9%      36529        softirqs.CPU174.SCHED
>>     6412831 =C2=B1  6%     +59.7%   10241471 =C2=B1  3%  softirqs.CPU175=
.NET_RX
>>       58111 =C2=B1  2%     -36.6%      36834 =C2=B1  2%  softirqs.CPU175=
.SCHED
>>     6124588 =C2=B1  2%     +60.3%    9819732 =C2=B1  6%  softirqs.CPU176=
.NET_RX
>>       57037           -36.6%      36176        softirqs.CPU176.SCHED
>>     6291783 =C2=B1  4%     +62.0%   10195232 =C2=B1  2%  softirqs.CPU177=
.NET_RX
>>       57487 =C2=B1  2%     -36.3%      36630        softirqs.CPU177.SCHED
>>     5991747 =C2=B1  2%     +68.3%   10085293 =C2=B1  3%  softirqs.CPU178=
.NET_RX
>>       55676 =C2=B1  4%     -34.1%      36668 =C2=B1  2%  softirqs.CPU178=
.SCHED
>>     5751221 =C2=B1  6%     +79.0%   10291874 =C2=B1  4%  softirqs.CPU179=
.NET_RX
>>       56585 =C2=B1  2%     -34.9%      36840 =C2=B1  2%  softirqs.CPU179=
.SCHED
>>     7415739           +60.1%   11870125        softirqs.CPU18.NET_RX
>>       61255           -39.5%      37035        softirqs.CPU18.SCHED
>>     5760963 =C2=B1  4%     +79.5%   10338403 =C2=B1  3%  softirqs.CPU180=
.NET_RX
>>       56148 =C2=B1  2%     -34.8%      36615 =C2=B1  2%  softirqs.CPU180=
.SCHED
>>     5562199 =C2=B1  4%     +81.8%   10112011 =C2=B1  2%  softirqs.CPU181=
.NET_RX
>>       55401           -33.9%      36617 =C2=B1  2%  softirqs.CPU181.SCHED
>>     5401775 =C2=B1  2%     +85.5%   10022833 =C2=B1  5%  softirqs.CPU182=
.NET_RX
>>       55131           -33.3%      36781 =C2=B1  2%  softirqs.CPU182.SCHED
>>     5551903 =C2=B1  7%     +83.3%   10175757 =C2=B1  4%  softirqs.CPU183=
.NET_RX
>>       55616 =C2=B1  2%     -33.8%      36838 =C2=B1  2%  softirqs.CPU183=
.SCHED
>>     5306997 =C2=B1  7%     +91.3%   10153212 =C2=B1  4%  softirqs.CPU184=
.NET_RX
>>       55007           -33.1%      36814 =C2=B1  2%  softirqs.CPU184.SCHED
>>     5214015 =C2=B1  5%     +98.5%   10351025 =C2=B1  2%  softirqs.CPU185=
.NET_RX
>>       53340 =C2=B1  4%     -31.1%      36732 =C2=B1  2%  softirqs.CPU185=
.SCHED
>>     5057205 =C2=B1  6%    +101.0%   10163171 =C2=B1  2%  softirqs.CPU186=
.NET_RX
>>       54063           -32.2%      36635 =C2=B1  2%  softirqs.CPU186.SCHED
>>     5200059 =C2=B1  7%    +104.6%   10638965 =C2=B1  3%  softirqs.CPU187=
.NET_RX
>>       54811           -32.1%      37231 =C2=B1  3%  softirqs.CPU187.SCHED
>>     4851796          +114.5%   10407381 =C2=B1  4%  softirqs.CPU188.NET_=
RX
>>       53528           -31.0%      36960 =C2=B1  3%  softirqs.CPU188.SCHED
>>     4996521 =C2=B1  4%    +107.6%   10370918 =C2=B1  3%  softirqs.CPU189=
.NET_RX
>>       53713           -31.3%      36892 =C2=B1  3%  softirqs.CPU189.SCHED
>>     7306763 =C2=B1  3%     +59.3%   11636735 =C2=B1  2%  softirqs.CPU19.=
NET_RX
>>       61205           -39.7%      36913        softirqs.CPU19.SCHED
>>     4758879 =C2=B1  6%    +118.7%   10406074 =C2=B1  6%  softirqs.CPU190=
.NET_RX
>>       53370           -31.1%      36786 =C2=B1  2%  softirqs.CPU190.SCHED
>>     3951800 =C2=B1  3%    +174.5%   10849027 =C2=B1  4%  softirqs.CPU191=
.NET_RX
>>       51184 =C2=B1  2%     -28.4%      36659 =C2=B1  2%  softirqs.CPU191=
.SCHED
>>     5740039 =C2=B1  3%     +89.5%   10877773 =C2=B1  3%  softirqs.CPU2.N=
ET_RX
>>       57113           -34.7%      37303        softirqs.CPU2.SCHED
>>     7576104 =C2=B1  2%     +56.1%   11823596 =C2=B1  3%  softirqs.CPU20.=
NET_RX
>>       61872           -40.3%      36933        softirqs.CPU20.SCHED
>>     7509902 =C2=B1  4%     +52.5%   11454156 =C2=B1  4%  softirqs.CPU21.=
NET_RX
>>       61531           -39.0%      37561 =C2=B1  2%  softirqs.CPU21.SCHED
>>     7488254 =C2=B1  4%     +51.0%   11304817 =C2=B1  3%  softirqs.CPU22.=
NET_RX
>>       61459           -39.7%      37070        softirqs.CPU22.SCHED
>>     7335812 =C2=B1  3%     +56.2%   11455330 =C2=B1  6%  softirqs.CPU23.=
NET_RX
>>       61242           -39.7%      36932 =C2=B1  2%  softirqs.CPU23.SCHED
>>     5800335 =C2=B1  5%     +90.5%   11047189 =C2=B1  5%  softirqs.CPU24.=
NET_RX
>>       57782           -34.9%      37637 =C2=B1  2%  softirqs.CPU24.SCHED
>>     5754868 =C2=B1  3%     +93.0%   11106541 =C2=B1  4%  softirqs.CPU25.=
NET_RX
>>       56393           -34.1%      37175        softirqs.CPU25.SCHED
>>     5930016 =C2=B1  4%     +86.4%   11051566 =C2=B1  4%  softirqs.CPU26.=
NET_RX
>>       56908           -35.1%      36961        softirqs.CPU26.SCHED
>>     6040426 =C2=B1  3%     +80.5%   10905523 =C2=B1  5%  softirqs.CPU27.=
NET_RX
>>       57361           -35.5%      37008        softirqs.CPU27.SCHED
>>     6088119           +82.0%   11080115 =C2=B1  4%  softirqs.CPU28.NET_RX
>>       55596 =C2=B1  6%     -33.3%      37106 =C2=B1  2%  softirqs.CPU28.=
SCHED
>>     6196805           +77.3%   10984267 =C2=B1  3%  softirqs.CPU29.NET_RX
>>       57764           -35.8%      37098        softirqs.CPU29.SCHED
>>     6049135 =C2=B1  4%     +83.2%   11083909 =C2=B1  3%  softirqs.CPU3.N=
ET_RX
>>       57856 =C2=B1  2%     -35.7%      37210        softirqs.CPU3.SCHED
>>     6236088 =C2=B1  5%     +78.2%   11115435 =C2=B1  5%  softirqs.CPU30.=
NET_RX
>>       58114           -36.4%      36982        softirqs.CPU30.SCHED
>>     6425681 =C2=B1  5%     +75.5%   11279359 =C2=B1  3%  softirqs.CPU31.=
NET_RX
>>       58527           -36.8%      36966        softirqs.CPU31.SCHED
>>     6633133 =C2=B1  5%     +69.5%   11243068 =C2=B1  4%  softirqs.CPU32.=
NET_RX
>>       57182 =C2=B1  5%     -35.7%      36782        softirqs.CPU32.SCHED
>>     6776068 =C2=B1  3%     +67.6%   11358275 =C2=B1  4%  softirqs.CPU33.=
NET_RX
>>       58986           -37.4%      36949        softirqs.CPU33.SCHED
>>     6825976 =C2=B1  7%     +66.9%   11390625 =C2=B1  4%  softirqs.CPU34.=
NET_RX
>>       59388           -37.7%      36976        softirqs.CPU34.SCHED
>>     6820899 =C2=B1  3%     +66.4%   11349378 =C2=B1  4%  softirqs.CPU35.=
NET_RX
>>       59266           -37.3%      37138 =C2=B1  2%  softirqs.CPU35.SCHED
>>     7186886 =C2=B1  4%     +60.8%   11554767 =C2=B1  5%  softirqs.CPU36.=
NET_RX
>>       59440 =C2=B1  2%     -38.0%      36844        softirqs.CPU36.SCHED
>>     6857780 =C2=B1 11%     +63.6%   11222236 =C2=B1  3%  softirqs.CPU37.=
NET_RX
>>       58235 =C2=B1  7%     -36.7%      36865        softirqs.CPU37.SCHED
>>     7300240 =C2=B1  4%     +52.7%   11148682 =C2=B1  5%  softirqs.CPU38.=
NET_RX
>>       60374           -38.4%      37186        softirqs.CPU38.SCHED
>>     7295259 =C2=B1  4%     +56.0%   11379950 =C2=B1  5%  softirqs.CPU39.=
NET_RX
>>       60387           -39.1%      36782        softirqs.CPU39.SCHED
>>     6105873 =C2=B1  5%     +79.1%   10937367 =C2=B1  3%  softirqs.CPU4.N=
ET_RX
>>       57077 =C2=B1  3%     -35.1%      37043 =C2=B1  2%  softirqs.CPU4.S=
CHED
>>     7400499 =C2=B1  6%     +52.3%   11270072 =C2=B1  5%  softirqs.CPU40.=
NET_RX
>>       60390 =C2=B1  2%     -38.8%      36988 =C2=B1  2%  softirqs.CPU40.=
SCHED
>>     7315643 =C2=B1  5%     +58.5%   11595431 =C2=B1  5%  softirqs.CPU41.=
NET_RX
>>       59572 =C2=B1  2%     -38.2%      36809 =C2=B1  2%  softirqs.CPU41.=
SCHED
>>     7533937 =C2=B1  4%     +53.8%   11584960 =C2=B1  5%  softirqs.CPU42.=
NET_RX
>>       61077           -39.7%      36855 =C2=B1  2%  softirqs.CPU42.SCHED
>>     7512855 =C2=B1  2%     +54.9%   11640656 =C2=B1  4%  softirqs.CPU43.=
NET_RX
>>       59750 =C2=B1  4%     -38.6%      36688        softirqs.CPU43.SCHED
>>     7480159 =C2=B1  4%     +54.9%   11589961 =C2=B1  5%  softirqs.CPU44.=
NET_RX
>>       60570           -39.4%      36699        softirqs.CPU44.SCHED
>>     7698312 =C2=B1  6%     +51.4%   11658111 =C2=B1  5%  softirqs.CPU45.=
NET_RX
>>       61078 =C2=B1  2%     -40.0%      36637 =C2=B1  2%  softirqs.CPU45.=
SCHED
>>     7677475 =C2=B1  3%     +51.5%   11628165 =C2=B1  5%  softirqs.CPU46.=
NET_RX
>>       61355           -40.0%      36794        softirqs.CPU46.SCHED
>>     7451573 =C2=B1  7%     +60.1%   11930059 =C2=B1  4%  softirqs.CPU47.=
NET_RX
>>       59945 =C2=B1  3%     -38.8%      36694 =C2=B1  2%  softirqs.CPU47.=
SCHED
>>     5562477 =C2=B1  7%     +90.4%   10590086 =C2=B1 14%  softirqs.CPU48.=
NET_RX
>>       57699           -38.5%      35458 =C2=B1  7%  softirqs.CPU48.SCHED
>>     5849224 =C2=B1  3%     +84.8%   10809359 =C2=B1  3%  softirqs.CPU49.=
NET_RX
>>       56885 =C2=B1  2%     -35.0%      36956 =C2=B1  2%  softirqs.CPU49.=
SCHED
>>     6218482 =C2=B1  2%     +77.9%   11064858 =C2=B1  4%  softirqs.CPU5.N=
ET_RX
>>       58495           -36.3%      37285        softirqs.CPU5.SCHED
>>     5954641 =C2=B1  2%     +78.8%   10649132 =C2=B1  3%  softirqs.CPU50.=
NET_RX
>>       56566 =C2=B1  2%     -34.8%      36908 =C2=B1  2%  softirqs.CPU50.=
SCHED
>>     6152135 =C2=B1  2%     +77.5%   10917629 =C2=B1  2%  softirqs.CPU51.=
NET_RX
>>       57426           -35.8%      36844        softirqs.CPU51.SCHED
>>     6207371 =C2=B1  6%     +78.4%   11072262 =C2=B1  3%  softirqs.CPU52.=
NET_RX
>>       57753 =C2=B1  2%     -36.3%      36775        softirqs.CPU52.SCHED
>>     6237188 =C2=B1  2%     +73.5%   10824328 =C2=B1  4%  softirqs.CPU53.=
NET_RX
>>       57835           -36.0%      36993 =C2=B1  2%  softirqs.CPU53.SCHED
>>     6314375 =C2=B1  3%     +73.1%   10930219 =C2=B1  3%  softirqs.CPU54.=
NET_RX
>>       57536 =C2=B1  2%     -36.9%      36309 =C2=B1  3%  softirqs.CPU54.=
SCHED
>>     6693440 =C2=B1  3%     +62.0%   10842305 =C2=B1  6%  softirqs.CPU55.=
NET_RX
>>       58943           -38.1%      36515 =C2=B1  3%  softirqs.CPU55.SCHED
>>     6718092 =C2=B1  4%     +64.0%   11018458 =C2=B1  3%  softirqs.CPU56.=
NET_RX
>>       58799           -37.4%      36787        softirqs.CPU56.SCHED
>>     6714367 =C2=B1  6%     +67.3%   11230991 =C2=B1  3%  softirqs.CPU57.=
NET_RX
>>       58804           -37.6%      36685 =C2=B1  2%  softirqs.CPU57.SCHED
>>     6847717 =C2=B1  6%     +59.4%   10913545 =C2=B1  4%  softirqs.CPU58.=
NET_RX
>>       58958           -38.1%      36477 =C2=B1  2%  softirqs.CPU58.SCHED
>>     6886490 =C2=B1  5%     +58.6%   10919323 =C2=B1  3%  softirqs.CPU59.=
NET_RX
>>       59391 =C2=B1  2%     -38.0%      36793        softirqs.CPU59.SCHED
>>     6132078 =C2=B1  2%     +82.9%   11215048 =C2=B1  2%  softirqs.CPU6.N=
ET_RX
>>       56891 =C2=B1  5%     -34.9%      37008 =C2=B1  2%  softirqs.CPU6.S=
CHED
>>     6658418 =C2=B1 16%     +64.3%   10938908 =C2=B1  4%  softirqs.CPU60.=
NET_RX
>>       56943 =C2=B1 14%     -35.4%      36759        softirqs.CPU60.SCHED
>>     7096065 =C2=B1  4%     +57.9%   11205108 =C2=B1  4%  softirqs.CPU61.=
NET_RX
>>       59774           -38.6%      36698 =C2=B1  2%  softirqs.CPU61.SCHED
>>     7165172 =C2=B1  6%     +55.4%   11133824 =C2=B1  3%  softirqs.CPU62.=
NET_RX
>>       59905           -38.9%      36610 =C2=B1  2%  softirqs.CPU62.SCHED
>>     7403101 =C2=B1  4%     +44.9%   10728572 =C2=B1  9%  softirqs.CPU63.=
NET_RX
>>       59711 =C2=B1  3%     -39.0%      36415 =C2=B1  3%  softirqs.CPU63.=
SCHED
>>     7380820 =C2=B1  3%     +51.8%   11206611        softirqs.CPU64.NET_RX
>>       57884 =C2=B1  9%     -36.9%      36540 =C2=B1  2%  softirqs.CPU64.=
SCHED
>>     7277084 =C2=B1  4%     +53.9%   11202374 =C2=B1  4%  softirqs.CPU65.=
NET_RX
>>     7313739 =C2=B1  2%     +54.7%   11314947 =C2=B1  3%  softirqs.CPU66.=
NET_RX
>>       60637           -39.7%      36587 =C2=B1  2%  softirqs.CPU66.SCHED
>>     7418890 =C2=B1  4%     +53.1%   11361631 =C2=B1  4%  softirqs.CPU67.=
NET_RX
>>       60903           -39.8%      36662 =C2=B1  2%  softirqs.CPU67.SCHED
>>     7600552 =C2=B1  3%     +46.2%   11111320 =C2=B1  5%  softirqs.CPU68.=
NET_RX
>>       60852           -39.6%      36783 =C2=B1  2%  softirqs.CPU68.SCHED
>>     7601894 =C2=B1  4%     +50.4%   11430910 =C2=B1  4%  softirqs.CPU69.=
NET_RX
>>       60567 =C2=B1  2%     -39.6%      36582        softirqs.CPU69.SCHED
>>     6167089 =C2=B1  8%     +76.9%   10909770 =C2=B1  3%  softirqs.CPU7.N=
ET_RX
>>       56262 =C2=B1  7%     -34.0%      37134        softirqs.CPU7.SCHED
>>     7570600 =C2=B1  4%     +49.4%   11313467 =C2=B1  4%  softirqs.CPU70.=
NET_RX
>>       61066           -39.8%      36769 =C2=B1  2%  softirqs.CPU70.SCHED
>>     7197343 =C2=B1 13%     +59.4%   11473693 =C2=B1  3%  softirqs.CPU71.=
NET_RX
>>       58746 =C2=B1  9%     -37.7%      36599 =C2=B1  2%  softirqs.CPU71.=
SCHED
>>     5531091 =C2=B1  2%     +94.4%   10751784 =C2=B1  4%  softirqs.CPU72.=
NET_RX
>>       56526 =C2=B1  3%     -35.3%      36553 =C2=B1  2%  softirqs.CPU72.=
SCHED
>>     5952868 =C2=B1  2%     +70.8%   10168335 =C2=B1  3%  softirqs.CPU73.=
NET_RX
>>       57055           -36.1%      36480 =C2=B1  4%  softirqs.CPU73.SCHED
>>     6245559 =C2=B1  8%     +71.6%   10718352 =C2=B1  2%  softirqs.CPU74.=
NET_RX
>>       57611 =C2=B1  2%     -35.7%      37021 =C2=B1  2%  softirqs.CPU74.=
SCHED
>>     6190240 =C2=B1  3%     +68.4%   10425989 =C2=B1  3%  softirqs.CPU75.=
NET_RX
>>       57346           -35.0%      37282        softirqs.CPU75.SCHED
>>     6320590 =C2=B1  4%     +66.0%   10492682 =C2=B1  4%  softirqs.CPU76.=
NET_RX
>>       58006           -36.6%      36795 =C2=B1  3%  softirqs.CPU76.SCHED
>>     6508382 =C2=B1  4%     +64.3%   10695343 =C2=B1  3%  softirqs.CPU77.=
NET_RX
>>       56510 =C2=B1  7%     -34.9%      36784 =C2=B1  2%  softirqs.CPU77.=
SCHED
>>     6450275 =C2=B1  4%     +65.8%   10694574 =C2=B1  4%  softirqs.CPU78.=
NET_RX
>>       58357           -36.7%      36965 =C2=B1  2%  softirqs.CPU78.SCHED
>>     6505206 =C2=B1  6%     +67.2%   10877359 =C2=B1  2%  softirqs.CPU79.=
NET_RX
>>       57847           -36.5%      36732        softirqs.CPU79.SCHED
>>     6598303 =C2=B1  2%     +65.2%   10899125 =C2=B1  3%  softirqs.CPU8.N=
ET_RX
>>       59052           -37.2%      37057        softirqs.CPU8.SCHED
>>     6791966 =C2=B1  3%     +54.0%   10460422 =C2=B1  8%  softirqs.CPU80.=
NET_RX
>>       54567 =C2=B1 11%     -31.5%      37390 =C2=B1  4%  softirqs.CPU80.=
SCHED
>>     6531754 =C2=B1  4%     +65.3%   10797850 =C2=B1  2%  softirqs.CPU81.=
NET_RX
>>       57092 =C2=B1  3%     -35.4%      36856 =C2=B1  2%  softirqs.CPU81.=
SCHED
>>     6849824 =C2=B1  2%     +57.4%   10782517 =C2=B1  3%  softirqs.CPU82.=
NET_RX
>>       59509           -38.4%      36641 =C2=B1  2%  softirqs.CPU82.SCHED
>>     6863223 =C2=B1  3%     +58.0%   10846577 =C2=B1  4%  softirqs.CPU83.=
NET_RX
>>       59410           -37.9%      36893 =C2=B1  2%  softirqs.CPU83.SCHED
>>     6984325 =C2=B1  4%     +57.6%   11004391 =C2=B1  2%  softirqs.CPU84.=
NET_RX
>>       59456           -38.4%      36616 =C2=B1  2%  softirqs.CPU84.SCHED
>>     7194531 =C2=B1  5%     +51.8%   10919137 =C2=B1  3%  softirqs.CPU85.=
NET_RX
>>       60688 =C2=B1  2%     -39.7%      36574        softirqs.CPU85.SCHED
>>     7366154 =C2=B1  3%     +46.3%   10779464 =C2=B1  5%  softirqs.CPU86.=
NET_RX
>>       58016 =C2=B1  8%     -36.9%      36621 =C2=B1  4%  softirqs.CPU86.=
SCHED
>>     7128684 =C2=B1  3%     +54.0%   10978903 =C2=B1  3%  softirqs.CPU87.=
NET_RX
>>       59650           -38.4%      36717 =C2=B1  2%  softirqs.CPU87.SCHED
>>     7267496 =C2=B1  3%     +50.3%   10924014 =C2=B1  3%  softirqs.CPU88.=
NET_RX
>>       60424 =C2=B1  2%     -39.2%      36746        softirqs.CPU88.SCHED
>>     7274996 =C2=B1  3%     +51.1%   10993672 =C2=B1  4%  softirqs.CPU89.=
NET_RX
>>       60521           -39.0%      36894 =C2=B1  3%  softirqs.CPU89.SCHED
>>     6623239 =C2=B1  5%     +69.2%   11204637 =C2=B1  3%  softirqs.CPU9.N=
ET_RX
>>       58624 =C2=B1  2%     -37.3%      36774 =C2=B1  2%  softirqs.CPU9.S=
CHED
>>     7111856 =C2=B1  8%     +54.1%   10960081 =C2=B1  2%  softirqs.CPU90.=
NET_RX
>>       58163 =C2=B1  6%     -36.6%      36849 =C2=B1  2%  softirqs.CPU90.=
SCHED
>>     7207569 =C2=B1  6%     +57.1%   11320956 =C2=B1  2%  softirqs.CPU91.=
NET_RX
>>       59941 =C2=B1  2%     -38.5%      36879 =C2=B1  2%  softirqs.CPU91.=
SCHED
>>     7539746 =C2=B1  2%     +47.1%   11091791 =C2=B1  4%  softirqs.CPU92.=
NET_RX
>>       60379           -38.8%      36972 =C2=B1  4%  softirqs.CPU92.SCHED
>>     7345043 =C2=B1  3%     +53.1%   11245274 =C2=B1  2%  softirqs.CPU93.=
NET_RX
>>       59903 =C2=B1  2%     -38.3%      36944 =C2=B1  3%  softirqs.CPU93.=
SCHED
>>     7448070 =C2=B1  3%     +48.7%   11077126 =C2=B1  6%  softirqs.CPU94.=
NET_RX
>>       60855           -40.9%      35949 =C2=B1  5%  softirqs.CPU94.SCHED
>>     7452206           +51.9%   11321247 =C2=B1  4%  softirqs.CPU95.NET_RX
>>     8025194           +32.2%   10605609 =C2=B1  3%  softirqs.CPU96.NET_RX
>>       62206 =C2=B1  2%     -40.9%      36794 =C2=B1  2%  softirqs.CPU96.=
SCHED
>>       59096 =C2=B1 10%     -40.0%      35471 =C2=B1  8%  softirqs.CPU97.=
SCHED
>>     7664102 =C2=B1  3%     +34.3%   10291655 =C2=B1  4%  softirqs.CPU98.=
NET_RX
>>       62174           -40.0%      37277        softirqs.CPU98.SCHED
>>     7329850 =C2=B1  2%     +41.8%   10391597 =C2=B1  4%  softirqs.CPU99.=
NET_RX
>>       61398           -39.4%      37223 =C2=B1  2%  softirqs.CPU99.SCHED
>>    1.24e+09           +67.1%  2.072e+09        softirqs.NET_RX
>>    11129059           -36.4%    7076379 =C2=B1  2%  softirqs.SCHED
>>       35083 =C2=B1  5%    +210.1%     108796 =C2=B1  3%  softirqs.TIMER
>>       53.81 =C2=B1  5%     -23.6       30.23 =C2=B1 16%  perf-profile.ca=
lltrace.cycles-pp.secondary_startup_64_no_verify
>>       53.50 =C2=B1  5%     -23.4       30.07 =C2=B1 16%  perf-profile.ca=
lltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>>       53.48 =C2=B1  5%     -23.4       30.07 =C2=B1 16%  perf-profile.ca=
lltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no=
_verify
>>       53.41 =C2=B1  5%     -23.3       30.07 =C2=B1 16%  perf-profile.ca=
lltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_start=
up_64_no_verify
>>       45.15 =C2=B1  8%     -15.9       29.25 =C2=B1 17%  perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_ent=
ry.start_secondary
>>       45.21 =C2=B1  8%     -15.7       29.48 =C2=B1 17%  perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.s=
econdary_startup_64_no_verify
>>        8.02 =C2=B1 14%      -7.9        0.11 =C2=B1223%  perf-profile.ca=
lltrace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_s=
tartup_entry
>>        7.70 =C2=B1  7%      -2.9        4.76 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__wake_up_common_lock.sock_def_readable.tcp_rcv_establish=
ed.tcp_v4_do_rcv.tcp_v4_rcv
>>        7.98 =C2=B1  7%      -2.8        5.16 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.sock_def_readable.tcp_rcv_established.tcp_v4_do_rcv.tcp_v=
4_rcv.ip_protocol_deliver_rcu
>>        7.17 =C2=B1  7%      -2.6        4.54 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.=
tcp_rcv_established.tcp_v4_do_rcv
>>        6.80 =C2=B1  8%      -2.5        4.31 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.try_to_wake_up.__wake_up_common.__wake_up_common_lock.soc=
k_def_readable.tcp_rcv_established
>>        2.71 =C2=B1  7%      -1.9        0.78 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.sche=
dule_timeout
>>        2.23 =C2=B1  7%      -1.4        0.84 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_=
wake_up.__wake_up_common
>>        1.60 =C2=B1  7%      -1.2        0.40 =C2=B1 70%  perf-profile.ca=
lltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>>        3.05 =C2=B1  7%      -1.1        1.98 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.wa=
it_woken
>>        2.95 =C2=B1  7%      -0.8        2.10 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.__wake_up_common.__wake_u=
p_common_lock.sock_def_readable
>>        2.89 =C2=B1  7%      -0.8        2.05 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.__wake_=
up_common.__wake_up_common_lock
>>        0.94 =C2=B1  6%      -0.3        0.64 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.__inet_lookup_established.tcp_v4_rcv.ip_protocol_deliver_=
rcu.ip_local_deliver_finish.ip_local_deliver
>>        0.59 =C2=B1  5%      +0.1        0.70 =C2=B1 10%  perf-profile.ca=
lltrace.cycles-pp.tcp_current_mss.tcp_send_mss.tcp_sendmsg_locked.tcp_sendm=
sg.sock_sendmsg
>>        0.63 =C2=B1  4%      +0.2        0.80 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.tcp_send_mss.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.=
__sys_sendto
>>        0.50 =C2=B1 44%      +0.4        0.90 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__switch_to_asm
>>        1.28 =C2=B1  7%      +0.4        1.71 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__alloc_skb.sk_stream_alloc_skb.tcp_sendmsg_locked.tcp_se=
ndmsg.sock_sendmsg
>>        0.00            +0.6        0.59 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.__skb_clone.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pendi=
ng_frames.tcp_sendmsg_locked
>>        1.33 =C2=B1  7%      +0.6        1.94 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.sk_stream_alloc_skb.tcp_sendmsg_locked.tcp_sendmsg.sock_s=
endmsg.__sys_sendto
>>        0.00            +0.6        0.62 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.ttwu_do_wakeup.try_to_wake_up.__wake_up_common.__wake_up_commo=
n_lock.sock_def_readable
>>        0.00            +0.6        0.63 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.ip_finish_output.ip_output.__ip_queue_xmit.__tcp_transmit_skb.=
tcp_write_xmit
>>        0.00            +0.6        0.63 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.copy_fpregs_to_fpstate
>>        0.00            +0.7        0.67 =C2=B1 16%  perf-profile.calltra=
ce.cycles-pp.netif_rx_internal.netif_rx.loopback_xmit.dev_hard_start_xmit._=
_dev_queue_xmit
>>        0.00            +0.7        0.69 =C2=B1 16%  perf-profile.calltra=
ce.cycles-pp.netif_rx.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip=
_finish_output2
>>        0.00            +0.7        0.71 =C2=B1  4%  perf-profile.calltra=
ce.cycles-pp.tcp_event_new_data_sent.tcp_write_xmit.__tcp_push_pending_fram=
es.tcp_sendmsg_locked.tcp_sendmsg
>>        0.00            +0.7        0.72 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.load_new_mm_cr3.switch_mm_irqs_off.__schedule.schedule.exit_to=
_user_mode_prepare
>>        0.00            +0.7        0.74 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.load_new_mm_cr3.switch_mm_irqs_off.__schedule.schedule.schedul=
e_timeout
>>        0.00            +0.8        0.75 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.sk_filter_trim_cap.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local=
_deliver_finish.ip_local_deliver
>>        0.00            +0.8        0.79 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.irqtime_account_irq.__softirqentry_text_start.do_softirq.__loc=
al_bh_enable_ip.ip_finish_output2
>>        0.00            +0.9        0.85 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cp=
uidle_enter_state.cpuidle_enter.do_idle
>>        0.00            +0.9        0.89 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp._copy_from_iter_full.tcp_sendmsg_locked.tcp_sendmsg.sock_sendm=
sg.__sys_sendto
>>        0.09 =C2=B1223%      +1.0        1.08 =C2=B1 11%  perf-profile.ca=
lltrace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuid=
le_enter.do_idle.cpu_startup_entry
>>        0.00            +1.0        1.01 =C2=B1 24%  perf-profile.calltra=
ce.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.wait_=
woken
>>        0.68 =C2=B1  8%      +1.0        1.71 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip_fin=
ish_output2.ip_output
>>        0.77 =C2=B1  8%      +1.1        1.87 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.ip=
_output.__ip_queue_xmit
>>        0.00            +1.2        1.16 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.pick_next_task_fair.__schedule.schedule.exit_to_user_mode_prep=
are.syscall_exit_to_user_mode
>>        0.00            +1.2        1.16 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.switch_mm_irqs_off.__schedule.schedule.schedule_timeout.wait_w=
oken
>>        0.00            +1.2        1.17 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.switch_mm_irqs_off.__schedule.schedule.exit_to_user_mode_prepa=
re.syscall_exit_to_user_mode
>>        3.18 =C2=B1  6%      +1.3        4.51 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_p=
rotocol_deliver_rcu
>>        0.00            +1.5        1.48 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.switch_fpu_return.exit_to_user_mode_prepare.syscall_exit_to_us=
er_mode.entry_SYSCALL_64_after_hwframe
>>        1.44 =C2=B1  4%      +1.5        2.98 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_output.__ip_queue_x=
mit.__tcp_transmit_skb
>>        0.00            +3.7        3.74 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.__schedule.schedule.exit_to_user_mode_prepare.syscall_exit_to_=
user_mode.entry_SYSCALL_64_after_hwframe
>>        0.00            +3.9        3.92 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.schedule.exit_to_user_mode_prepare.syscall_exit_to_user_mode.e=
ntry_SYSCALL_64_after_hwframe
>>       20.12 =C2=B1  6%      +5.3       25.46 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xm=
it.__tcp_push_pending_frames
>>       21.02 =C2=B1  6%      +5.8       26.87 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_p=
ush_pending_frames.tcp_sendmsg_locked
>>        0.00            +6.0        6.00 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSC=
ALL_64_after_hwframe
>>        0.00            +6.3        6.31 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe
>>       22.43 =C2=B1  6%      +7.1       29.57 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_fram=
es.tcp_sendmsg_locked.tcp_sendmsg
>>       23.68 =C2=B1  6%      +8.3       32.01 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_sendmsg_lock=
ed.tcp_sendmsg.sock_sendmsg
>>       23.75 =C2=B1  6%      +8.6       32.38 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__tcp_push_pending_frames.tcp_sendmsg_locked.tcp_sendmsg.=
sock_sendmsg.__sys_sendto
>>       27.78 =C2=B1  6%     +10.7       38.47 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto.=
__x64_sys_sendto
>>       28.27 =C2=B1  6%     +11.4       39.69 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do=
_syscall_64
>>       28.61 =C2=B1  6%     +11.9       40.51 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>>       29.09 =C2=B1  6%     +12.5       41.61 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
>>       29.19 =C2=B1  6%     +12.8       41.95 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
>>       43.43 =C2=B1  6%     +14.8       58.22 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>       44.10 =C2=B1  6%     +21.5       65.63 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>>       53.81 =C2=B1  5%     -23.6       30.23 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.secondary_startup_64_no_verify
>>       53.81 =C2=B1  5%     -23.6       30.23 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.cpu_startup_entry
>>       53.74 =C2=B1  5%     -23.5       30.23 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.do_idle
>>       53.50 =C2=B1  5%     -23.4       30.07 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.start_secondary
>>       45.48 =C2=B1  8%     -15.8       29.64 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.cpuidle_enter
>>       45.47 =C2=B1  8%     -15.8       29.64 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.cpuidle_enter_state
>>        8.06 =C2=B1 14%      -7.9        0.15 =C2=B1161%  perf-profile.ch=
ildren.cycles-pp.poll_idle
>>        7.70 =C2=B1  7%      -2.9        4.77 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__wake_up_common_lock
>>        7.99 =C2=B1  7%      -2.8        5.17 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sock_def_readable
>>        7.17 =C2=B1  7%      -2.6        4.54 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__wake_up_common
>>        6.81 =C2=B1  8%      -2.5        4.32 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.try_to_wake_up
>>        2.72 =C2=B1  8%      -1.9        0.79 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.dequeue_entity
>>        2.27 =C2=B1  8%      -1.4        0.87 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.enqueue_entity
>>        1.81 =C2=B1  7%      -1.3        0.52 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock_irqsave
>>        1.61 =C2=B1  7%      -1.1        0.53 =C2=B1 21%  perf-profile.ch=
ildren.cycles-pp.menu_select
>>        3.05 =C2=B1  8%      -1.1        1.98 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.dequeue_task_fair
>>        1.60 =C2=B1  7%      -1.0        0.55 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.set_next_entity
>>        1.56 =C2=B1  8%      -1.0        0.55 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.update_rq_clock
>>        2.95 =C2=B1  7%      -0.8        2.11 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.ttwu_do_activate
>>        2.89 =C2=B1  7%      -0.8        2.06 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.enqueue_task_fair
>>        0.71 =C2=B1  6%      -0.6        0.14 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_get_sleep_length
>>        1.99 =C2=B1  8%      -0.6        1.43 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.update_load_avg
>>        0.61 =C2=B1  8%      -0.5        0.15 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.remove_wait_queue
>>        0.45 =C2=B1  7%      -0.3        0.12 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_next_event
>>        0.95 =C2=B1  6%      -0.3        0.64 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__inet_lookup_established
>>        0.58 =C2=B1  7%      -0.3        0.28 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__ksize
>>        0.73 =C2=B1  8%      -0.3        0.48 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.select_task_rq_fair
>>        0.32 =C2=B1  8%      -0.2        0.09 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.resched_curr
>>        0.23 =C2=B1  7%      -0.2        0.03 =C2=B1 70%  perf-profile.ch=
ildren.cycles-pp.available_idle_cpu
>>        0.80 =C2=B1  7%      -0.2        0.64 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.skb_release_data
>>        0.31 =C2=B1  5%      -0.1        0.17 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.start_kernel
>>        0.32 =C2=B1  7%      -0.1        0.21 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.tcp_check_space
>>        0.26 =C2=B1  8%      -0.1        0.15 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.perf_tp_event
>>        0.18 =C2=B1  6%      -0.1        0.09 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.rb_first
>>        0.12 =C2=B1 10%      -0.0        0.09 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__cgroup_account_cputime
>>        0.12 =C2=B1  5%      +0.0        0.15 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.update_min_vruntime
>>        0.05 =C2=B1  8%      +0.0        0.08 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.timekeeping_max_deferment
>>        0.03 =C2=B1 70%      +0.0        0.07 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.inet_sendmsg
>>        0.10 =C2=B1 11%      +0.0        0.15 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.woken_wake_function
>>        0.07 =C2=B1  8%      +0.0        0.11 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__enqueue_entity
>>        0.11 =C2=B1  9%      +0.1        0.16 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__rdgsbase_inactive
>>        0.21 =C2=B1  6%      +0.1        0.27 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.sk_page_frag_refill
>>        0.00            +0.1        0.05 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.tcp_push
>>        0.07 =C2=B1  5%      +0.1        0.12 =C2=B1 22%  perf-profile.ch=
ildren.cycles-pp.perf_trace_sched_switch
>>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.tcp_send_delayed_ack
>>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.tcp_small_queue_check
>>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.skb_clone_tx_timestamp
>>        0.02 =C2=B1141%      +0.1        0.07 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.perf_trace_buf_update
>>        0.00            +0.1        0.06 =C2=B1  6%  perf-profile.childre=
n.cycles-pp.__fdget
>>        0.00            +0.1        0.06 =C2=B1 25%  perf-profile.childre=
n.cycles-pp.kmalloc_slab
>>        0.10 =C2=B1  6%      +0.1        0.16 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.tcp_v4_fill_cb
>>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.apparmor_ip_postroute
>>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.eth_type_trans
>>        0.05            +0.1        0.11 =C2=B1  6%  perf-profile.childre=
n.cycles-pp.syscall_enter_from_user_mode
>>        0.00            +0.1        0.06 =C2=B1 21%  perf-profile.childre=
n.cycles-pp.rcu_note_context_switch
>>        0.00            +0.1        0.06 =C2=B1  6%  perf-profile.childre=
n.cycles-pp.tcp_rack_update_reo_wnd
>>        0.01 =C2=B1223%      +0.1        0.07 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.rb_erase
>>        0.14 =C2=B1 10%      +0.1        0.20 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.migrate_enable
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.ksoftirqd_running
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.switch_ldt
>>        0.00            +0.1        0.07 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.validate_xmit_xfrm
>>        0.01 =C2=B1223%      +0.1        0.07 =C2=B1 20%  perf-profile.ch=
ildren.cycles-pp.__tcp_ack_snd_check
>>        0.14 =C2=B1  9%      +0.1        0.20 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.tick_sched_handle
>>        0.07 =C2=B1 10%      +0.1        0.14 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_event_data_recv
>>        0.00            +0.1        0.07 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.tcp_chrono_stop
>>        0.00            +0.1        0.07 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.tick_nohz_irq_exit
>>        0.00            +0.1        0.07 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.skb_network_protocol
>>        0.14 =C2=B1  8%      +0.1        0.20 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.update_process_times
>>        0.11 =C2=B1 10%      +0.1        0.18 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.tcp_established_options
>>        0.00            +0.1        0.07 =C2=B1  5%  perf-profile.childre=
n.cycles-pp.ttwu_queue_wakelist
>>        0.13 =C2=B1  9%      +0.1        0.20 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_cleanup_rbuf
>>        0.00            +0.1        0.07 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.rb_insert_color
>>        0.20 =C2=B1  8%      +0.1        0.28 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__wrgsbase_inactive
>>        0.00            +0.1        0.08 =C2=B1 17%  perf-profile.childre=
n.cycles-pp.apparmor_ipv4_postroute
>>        0.06 =C2=B1 11%      +0.1        0.14 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__usecs_to_jiffies
>>        0.30 =C2=B1 11%      +0.1        0.38 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.ip_local_out
>>        0.12 =C2=B1 10%      +0.1        0.20 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.clockevents_program_event
>>        0.03 =C2=B1 99%      +0.1        0.11 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sk_free
>>        0.00            +0.1        0.08 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.check_cfs_rq_runtime
>>        0.07 =C2=B1 11%      +0.1        0.15 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.bictcp_cwnd_event
>>        0.15 =C2=B1  7%      +0.1        0.23 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.tick_sched_timer
>>        0.06 =C2=B1  6%      +0.1        0.15 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.migrate_disable
>>        0.15 =C2=B1  4%      +0.1        0.24 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.irq_exit_rcu
>>        0.07 =C2=B1  8%      +0.1        0.16 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.rcu_read_unlock_strict
>>        0.05 =C2=B1 45%      +0.1        0.13 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.rcu_nocb_flush_deferred_wakeup
>>        0.07 =C2=B1  5%      +0.1        0.16 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__copy_skb_header
>>        0.23 =C2=B1  9%      +0.1        0.32 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.tcp_ack_update_rtt
>>        0.06 =C2=B1  9%      +0.1        0.15 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.syscall_exit_to_user_mode_prepare
>>        0.01 =C2=B1223%      +0.1        0.10 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.raw_local_deliver
>>        0.05 =C2=B1 45%      +0.1        0.14 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.__build_skb_around
>>        0.05 =C2=B1  9%      +0.1        0.15 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.iov_iter_advance
>>        0.00            +0.1        0.09 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.tcp_v4_inbound_md5_hash
>>        0.07 =C2=B1  8%      +0.1        0.17 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.rcu_all_qs
>>        0.06 =C2=B1 11%      +0.1        0.16 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.inet_ehashfn
>>        0.15 =C2=B1  8%      +0.1        0.25 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__might_fault
>>        0.01 =C2=B1223%      +0.1        0.11 =C2=B1 20%  perf-profile.ch=
ildren.cycles-pp.tick_irq_enter
>>        0.12 =C2=B1  9%      +0.1        0.22 =C2=B1  3%  perf-profile.ch=
ildren.cycles-pp.tcp_update_skb_after_send
>>        0.01 =C2=B1223%      +0.1        0.11 =C2=B1 21%  perf-profile.ch=
ildren.cycles-pp.irq_enter_rcu
>>        0.00            +0.1        0.10 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.wakeup_preempt_entity
>>        0.00            +0.1        0.10 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.perf_trace_buf_alloc
>>        0.12 =C2=B1  8%      +0.1        0.23 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__x86_indirect_thunk_rax
>>        0.00            +0.1        0.10 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.tcp_rate_skb_delivered
>>        0.06 =C2=B1 11%      +0.1        0.17 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.netif_skb_features
>>        0.09 =C2=B1  7%      +0.1        0.19 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__list_del_entry_valid
>>        0.07 =C2=B1  7%      +0.1        0.17 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__tcp_select_window
>>        0.20 =C2=B1 15%      +0.1        0.31 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.__hrtimer_run_queues
>>        0.04 =C2=B1 71%      +0.1        0.14 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.entry_SYSCALL_64_safe_stack
>>        0.33 =C2=B1  9%      +0.1        0.44 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.finish_task_switch
>>        0.06 =C2=B1  8%      +0.1        0.17 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__list_add_valid
>>        0.59 =C2=B1  5%      +0.1        0.71 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.tcp_current_mss
>>        0.08 =C2=B1  6%      +0.1        0.19 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sock_rfree
>>        0.00            +0.1        0.11 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.tcp_newly_delivered
>>        0.10 =C2=B1  8%      +0.1        0.21 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.tcp_release_cb
>>        0.07 =C2=B1 10%      +0.1        0.19 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.kfree_skbmem
>>        0.07 =C2=B1  7%      +0.1        0.18 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.sock_put
>>        0.10 =C2=B1  7%      +0.1        0.22 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.tcp_rate_skb_sent
>>        0.09 =C2=B1 18%      +0.1        0.22 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.cpuacct_charge
>>        0.03 =C2=B1 70%      +0.1        0.17 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.tcp_rate_gen
>>        0.19 =C2=B1  8%      +0.1        0.33 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.mod_timer
>>        0.14 =C2=B1  8%      +0.1        0.28 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.__calc_delta
>>        0.00            +0.1        0.14 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.apparmor_socket_sock_rcv_skb
>>        0.05 =C2=B1 45%      +0.1        0.19 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.bictcp_cong_avoid
>>        0.07 =C2=B1 10%      +0.2        0.23 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.bictcp_acked
>>        0.46 =C2=B1  7%      +0.2        0.62 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.ttwu_do_wakeup
>>        0.43 =C2=B1  8%      +0.2        0.59 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.check_preempt_curr
>>        0.04 =C2=B1 45%      +0.2        0.21 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.nf_hook_slow
>>        0.00            +0.2        0.17 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.set_next_buddy
>>        0.63 =C2=B1  4%      +0.2        0.80 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.tcp_send_mss
>>        0.22 =C2=B1  7%      +0.2        0.39 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sk_reset_timer
>>        0.05 =C2=B1 44%      +0.2        0.22 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.security_sock_rcv_skb
>>        0.00            +0.2        0.17 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.clear_buddies
>>        0.20 =C2=B1  8%      +0.2        0.38 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.___perf_sw_event
>>        0.42 =C2=B1  8%      +0.2        0.60 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__skb_clone
>>        0.09 =C2=B1  8%      +0.2        0.27 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.import_single_range
>>        0.15 =C2=B1  9%      +0.2        0.33 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__cond_resched
>>        0.60 =C2=B1  7%      +0.2        0.79 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.native_sched_clock
>>        0.09 =C2=B1  8%      +0.2        0.28 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.ip_rcv_core
>>        0.22 =C2=B1  8%      +0.2        0.42 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__might_sleep
>>        0.63 =C2=B1  7%      +0.2        0.82 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sched_clock
>>        0.70 =C2=B1  7%      +0.2        0.90 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sched_clock_cpu
>>        0.16 =C2=B1 14%      +0.2        0.36 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__ip_finish_output
>>        0.15 =C2=B1  7%      +0.2        0.35 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.validate_xmit_skb
>>        0.26 =C2=B1  7%      +0.2        0.47 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__kmalloc_node_track_caller
>>        0.36 =C2=B1 14%      +0.2        0.58 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.hrtimer_interrupt
>>        0.37 =C2=B1 14%      +0.2        0.59 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.__sysvec_apic_timer_interrupt
>>        0.13 =C2=B1  8%      +0.2        0.35 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.tcp_update_pacing_rate
>>        0.20 =C2=B1  8%      +0.2        0.43 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.security_socket_recvmsg
>>        0.10 =C2=B1  8%      +0.2        0.34 =C2=B1 70%  perf-profile.ch=
ildren.cycles-pp.newidle_balance
>>        0.28 =C2=B1  6%      +0.2        0.53 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.kmalloc_reserve
>>        0.32 =C2=B1  7%      +0.3        0.58 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_schedule_loss_probe
>>        0.91 =C2=B1  7%      +0.3        1.17 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock_bh
>>        0.22 =C2=B1  7%      +0.3        0.48 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sock_recvmsg
>>        0.62 =C2=B1  8%      +0.3        0.89 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__switch_to
>>        0.34 =C2=B1  9%      +0.3        0.61 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.___might_sleep
>>        0.21 =C2=B1  8%      +0.3        0.48 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.kmem_cache_alloc_node
>>        0.08 =C2=B1  7%      +0.3        0.35 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.kfree
>>        0.15 =C2=B1  7%      +0.3        0.43 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.security_socket_sendmsg
>>        0.44 =C2=B1  5%      +0.3        0.73 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tcp_event_new_data_sent
>>        0.22 =C2=B1  9%      +0.3        0.52 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.enqueue_to_backlog
>>        0.35 =C2=B1  7%      +0.3        0.64 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.ip_finish_output
>>        0.42 =C2=B1  7%      +0.3        0.74 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.reweight_entity
>>        0.00            +0.3        0.33 =C2=B1 65%  perf-profile.childre=
n.cycles-pp.find_busiest_group
>>        0.00            +0.3        0.33 =C2=B1 65%  perf-profile.childre=
n.cycles-pp.update_sd_lb_stats
>>        0.19 =C2=B1  7%      +0.3        0.52 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.tcp_wfree
>>        0.10 =C2=B1  8%      +0.4        0.45 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.copy_user_enhanced_fast_string
>>        0.18 =C2=B1 11%      +0.4        0.54 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__entry_text_start
>>        0.58 =C2=B1  7%      +0.4        0.95 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__check_object_size
>>        0.00            +0.4        0.37 =C2=B1 64%  perf-profile.childre=
n.cycles-pp.load_balance
>>        0.28 =C2=B1  9%      +0.4        0.68 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.netif_rx_internal
>>        0.24 =C2=B1  9%      +0.4        0.64 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.copy_fpregs_to_fpstate
>>        0.10 =C2=B1  9%      +0.4        0.49 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.__virt_addr_valid
>>        0.30 =C2=B1  9%      +0.4        0.70 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.netif_rx
>>        0.14 =C2=B1  7%      +0.4        0.54 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.copyin
>>        0.29 =C2=B1  7%      +0.4        0.71 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.aa_sk_perm
>>        0.13 =C2=B1 14%      +0.4        0.55 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__netif_receive_skb_core
>>        1.29 =C2=B1  7%      +0.4        1.72 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__alloc_skb
>>        0.58 =C2=B1 13%      +0.4        1.02 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.sysvec_apic_timer_interrupt
>>        0.27 =C2=B1 10%      +0.4        0.71 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__fget_light
>>        0.08 =C2=B1  8%      +0.5        0.54 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.put_prev_entity
>>        0.57 =C2=B1  7%      +0.5        1.04 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.read_tsc
>>        0.60 =C2=B1  8%      +0.5        1.08 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__switch_to_asm
>>        0.46 =C2=B1  7%      +0.5        0.95 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__cgroup_bpf_run_filter_skb
>>        0.26 =C2=B1  9%      +0.5        0.77 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sk_filter_trim_cap
>>        0.00            +0.5        0.53 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.check_preempt_wakeup
>>        0.36 =C2=B1  6%      +0.5        0.90 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.irqtime_account_irq
>>        1.23 =C2=B1  7%      +0.5        1.77 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.ktime_get
>>        0.34 =C2=B1  9%      +0.6        0.90 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.sockfd_lookup_light
>>        0.33 =C2=B1  8%      +0.6        0.91 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp._copy_from_iter_full
>>        0.48 =C2=B1  6%      +0.6        1.08 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.release_sock
>>        1.34 =C2=B1  7%      +0.6        1.94 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sk_stream_alloc_skb
>>        0.48 =C2=B1  8%      +0.6        1.09 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.tcp_mstamp_refresh
>>        0.37 =C2=B1  7%      +0.6        1.00 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.syscall_return_via_sysret
>>        0.64 =C2=B1 17%      +0.6        1.28 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.asm_sysvec_apic_timer_interrupt
>>        0.69 =C2=B1  8%      +1.0        1.73 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.loopback_xmit
>>        0.77 =C2=B1  8%      +1.1        1.88 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.dev_hard_start_xmit
>>        0.14 =C2=B1  9%      +1.4        1.49 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.switch_fpu_return
>>        3.20 =C2=B1  6%      +1.4        4.57 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.tcp_ack
>>        1.45 =C2=B1  4%      +1.5        2.99 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__dev_queue_xmit
>>        0.00            +1.8        1.77 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.load_new_mm_cr3
>>        0.44 =C2=B1  7%      +1.9        2.35 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.switch_mm_irqs_off
>>        5.66 =C2=B1  8%      +4.5       10.16 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.schedule
>>       20.13 =C2=B1  6%      +5.4       25.49 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.ip_output
>>        0.22 =C2=B1  7%      +5.8        6.05 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.exit_to_user_mode_prepare
>>       21.03 =C2=B1  6%      +5.9       26.89 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__ip_queue_xmit
>>        0.34 =C2=B1  7%      +6.0        6.35 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.syscall_exit_to_user_mode
>>       22.45 =C2=B1  6%      +7.2       29.62 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__tcp_transmit_skb
>>       23.71 =C2=B1  6%      +8.4       32.13 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.tcp_write_xmit
>>       23.76 =C2=B1  6%      +8.6       32.39 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__tcp_push_pending_frames
>>       27.80 =C2=B1  6%     +10.7       38.51 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.tcp_sendmsg_locked
>>       28.29 =C2=B1  6%     +11.5       39.76 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.tcp_sendmsg
>>       28.62 =C2=B1  6%     +11.9       40.53 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.sock_sendmsg
>>       29.09 =C2=B1  6%     +12.5       41.62 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__sys_sendto
>>       29.20 =C2=B1  6%     +12.8       42.01 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__x64_sys_sendto
>>       43.46 =C2=B1  6%     +14.8       58.26 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.do_syscall_64
>>       44.14 =C2=B1  6%     +21.6       65.69 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.entry_SYSCALL_64_after_hwframe
>>        7.89 =C2=B1 14%      -7.8        0.13 =C2=B1167%  perf-profile.se=
lf.cycles-pp.poll_idle
>>        1.80 =C2=B1  7%      -1.3        0.51 =C2=B1  7%  perf-profile.se=
lf.cycles-pp._raw_spin_lock_irqsave
>>        1.29 =C2=B1  9%      -1.1        0.17 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.update_rq_clock
>>        0.95 =C2=B1  7%      -0.8        0.13 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.set_next_entity
>>        1.79 =C2=B1  8%      -0.7        1.05 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__schedule
>>        0.75 =C2=B1  7%      -0.6        0.18 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.enqueue_entity
>>        1.00 =C2=B1  8%      -0.5        0.55 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.update_load_avg
>>        0.88 =C2=B1  6%      -0.4        0.48 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__inet_lookup_established
>>        0.62 =C2=B1  7%      -0.3        0.30 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.enqueue_task_fair
>>        0.68 =C2=B1  8%      -0.3        0.37 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.wait_woken
>>        0.70 =C2=B1  9%      -0.3        0.39 =C2=B1 26%  perf-profile.se=
lf.cycles-pp.menu_select
>>        0.57 =C2=B1  8%      -0.3        0.27 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__ksize
>>        0.60 =C2=B1  9%      -0.3        0.31 =C2=B1  4%  perf-profile.se=
lf.cycles-pp.tcp_rcv_established
>>        0.35 =C2=B1  8%      -0.3        0.09 =C2=B1  4%  perf-profile.se=
lf.cycles-pp.tcp_rcv_space_adjust
>>        0.50 =C2=B1  9%      -0.3        0.24 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__skb_datagram_iter
>>        0.32 =C2=B1  8%      -0.2        0.08 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.resched_curr
>>        0.44 =C2=B1  8%      -0.2        0.21 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.try_to_wake_up
>>        0.75 =C2=B1  9%      -0.2        0.56 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.update_curr
>>        0.23 =C2=B1  8%      -0.2        0.03 =C2=B1 70%  perf-profile.se=
lf.cycles-pp.available_idle_cpu
>>        0.29 =C2=B1  7%      -0.2        0.11 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.dequeue_entity
>>        0.33 =C2=B1  8%      -0.2        0.15 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.pick_next_entity
>>        0.81 =C2=B1  6%      -0.2        0.65 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.tcp_recvmsg_locked
>>        0.80 =C2=B1  7%      -0.2        0.64 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.skb_release_data
>>        0.36 =C2=B1  8%      -0.1        0.21 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.schedule_timeout
>>        0.23 =C2=B1  6%      -0.1        0.08 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__wake_up_common
>>        0.22 =C2=B1  8%      -0.1        0.08 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.perf_tp_event
>>        0.31 =C2=B1  7%      -0.1        0.20 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.tcp_check_space
>>        0.17 =C2=B1  8%      -0.1        0.07 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.rb_first
>>        0.43 =C2=B1  8%      -0.1        0.33 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.schedule
>>        0.42 =C2=B1  8%      -0.1        0.34 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.reweight_entity
>>        0.11 =C2=B1  6%      -0.1        0.06 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.check_preempt_curr
>>        0.10 =C2=B1 10%      -0.0        0.08 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.tcp_rate_check_app_limited
>>        0.07 =C2=B1  7%      -0.0        0.04 =C2=B1 45%  perf-profile.se=
lf.cycles-pp.rb_next
>>        0.07 =C2=B1  6%      -0.0        0.06 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.__might_fault
>>        0.05            +0.0        0.08 =C2=B1 16%  perf-profile.self.cy=
cles-pp.timekeeping_max_deferment
>>        0.10 =C2=B1 12%      +0.0        0.14 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.woken_wake_function
>>        0.07 =C2=B1  5%      +0.0        0.11 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.put_prev_entity
>>        0.06 =C2=B1 11%      +0.0        0.10 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__enqueue_entity
>>        0.13 =C2=B1 11%      +0.0        0.18 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.migrate_enable
>>        0.11 =C2=B1  9%      +0.1        0.16 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__rdgsbase_inactive
>>        0.10 =C2=B1  9%      +0.1        0.15 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.tcp_v4_fill_cb
>>        0.22 =C2=B1 10%      +0.1        0.27 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.tcp_ack_update_rtt
>>        0.06 =C2=B1 11%      +0.1        0.12 =C2=B1 23%  perf-profile.se=
lf.cycles-pp.perf_trace_sched_switch
>>        0.00            +0.1        0.05 =C2=B1  9%  perf-profile.self.cy=
cles-pp.tcp_chrono_stop
>>        0.00            +0.1        0.05 =C2=B1  9%  perf-profile.self.cy=
cles-pp.ksoftirqd_running
>>        0.00            +0.1        0.05 =C2=B1  9%  perf-profile.self.cy=
cles-pp.tcp_rack_update_reo_wnd
>>        0.00            +0.1        0.05 =C2=B1  9%  perf-profile.self.cy=
cles-pp.eth_type_trans
>>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.self.cy=
cles-pp.apparmor_ip_postroute
>>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.self.cy=
cles-pp.tcp_send_delayed_ack
>>        0.01 =C2=B1223%      +0.1        0.07 =C2=B1 19%  perf-profile.se=
lf.cycles-pp.__tcp_ack_snd_check
>>        0.00            +0.1        0.06 =C2=B1 18%  perf-profile.self.cy=
cles-pp.skb_network_protocol
>>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.self.cy=
cles-pp.check_cfs_rq_runtime
>>        0.09 =C2=B1  8%      +0.1        0.15 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.dev_hard_start_xmit
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.__build_skb_around
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.kmalloc_reserve
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.perf_trace_buf_alloc
>>        0.07 =C2=B1  7%      +0.1        0.13 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.tcp_event_data_recv
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.validate_xmit_xfrm
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.switch_ldt
>>        0.04 =C2=B1 45%      +0.1        0.11 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.rcu_all_qs
>>        0.04 =C2=B1 44%      +0.1        0.11 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.syscall_enter_from_user_mode
>>        0.02 =C2=B1141%      +0.1        0.08 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.netif_rx_internal
>>        0.00            +0.1        0.07 =C2=B1  7%  perf-profile.self.cy=
cles-pp.sk_page_frag_refill
>>        0.11 =C2=B1 10%      +0.1        0.18 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.tcp_established_options
>>        0.08 =C2=B1 11%      +0.1        0.15 =C2=B1  2%  perf-profile.se=
lf.cycles-pp.tcp_update_skb_after_send
>>        0.00            +0.1        0.07 =C2=B1  5%  perf-profile.self.cy=
cles-pp.ip_local_deliver
>>        0.00            +0.1        0.07 =C2=B1 15%  perf-profile.self.cy=
cles-pp.security_sock_rcv_skb
>>        0.00            +0.1        0.07 =C2=B1 13%  perf-profile.self.cy=
cles-pp.rb_erase
>>        0.00            +0.1        0.07 =C2=B1  5%  perf-profile.self.cy=
cles-pp.ttwu_queue_wakelist
>>        0.00            +0.1        0.07 =C2=B1 13%  perf-profile.self.cy=
cles-pp.rb_insert_color
>>        0.00            +0.1        0.07 =C2=B1  8%  perf-profile.self.cy=
cles-pp.ip_rcv
>>        0.00            +0.1        0.07 =C2=B1 14%  perf-profile.self.cy=
cles-pp.sk_reset_timer
>>        0.00            +0.1        0.07 =C2=B1 20%  perf-profile.self.cy=
cles-pp.apparmor_ipv4_postroute
>>        0.00            +0.1        0.07 =C2=B1  9%  perf-profile.self.cy=
cles-pp.tcp_v4_inbound_md5_hash
>>        0.20 =C2=B1  8%      +0.1        0.28 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__wrgsbase_inactive
>>        0.07 =C2=B1  5%      +0.1        0.14 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.lock_sock_nested
>>        0.09 =C2=B1  7%      +0.1        0.17 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.__x86_indirect_thunk_rax
>>        0.06 =C2=B1  8%      +0.1        0.13 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.syscall_exit_to_user_mode_prepare
>>        0.00            +0.1        0.08 =C2=B1 10%  perf-profile.self.cy=
cles-pp.__wake_up_common_lock
>>        0.03 =C2=B1 99%      +0.1        0.10 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.tcp_send_mss
>>        0.00            +0.1        0.08 =C2=B1  9%  perf-profile.self.cy=
cles-pp.ip_local_deliver_finish
>>        0.06 =C2=B1  6%      +0.1        0.14 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.rcu_read_unlock_strict
>>        0.00            +0.1        0.08 =C2=B1  8%  perf-profile.self.cy=
cles-pp.ip_rcv_finish
>>        0.00            +0.1        0.08 =C2=B1 11%  perf-profile.self.cy=
cles-pp.nf_hook_slow
>>        0.06 =C2=B1  6%      +0.1        0.14 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.migrate_disable
>>        0.06 =C2=B1 11%      +0.1        0.14 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.bictcp_cwnd_event
>>        0.03 =C2=B1 70%      +0.1        0.11 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.tcp_mstamp_refresh
>>        0.03 =C2=B1 70%      +0.1        0.11 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__usecs_to_jiffies
>>        0.03 =C2=B1 70%      +0.1        0.12 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.rcu_nocb_flush_deferred_wakeup
>>        0.07 =C2=B1  7%      +0.1        0.15 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__copy_skb_header
>>        0.03 =C2=B1 99%      +0.1        0.11 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.sk_free
>>        0.00            +0.1        0.08 =C2=B1  8%  perf-profile.self.cy=
cles-pp.ip_finish_output
>>        0.07 =C2=B1 11%      +0.1        0.15 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.sockfd_lookup_light
>>        0.05 =C2=B1  8%      +0.1        0.14 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.iov_iter_advance
>>        0.08 =C2=B1 10%      +0.1        0.17 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__list_del_entry_valid
>>        0.07 =C2=B1 10%      +0.1        0.17 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.validate_xmit_skb
>>        0.35 =C2=B1  9%      +0.1        0.45 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__skb_clone
>>        0.00            +0.1        0.09 =C2=B1  5%  perf-profile.self.cy=
cles-pp.tcp_rate_skb_delivered
>>        0.00            +0.1        0.09 =C2=B1 10%  perf-profile.self.cy=
cles-pp.raw_local_deliver
>>        0.00            +0.1        0.09 =C2=B1  5%  perf-profile.self.cy=
cles-pp.__ip_local_out
>>        0.06 =C2=B1 11%      +0.1        0.16 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.inet_ehashfn
>>        0.29 =C2=B1 13%      +0.1        0.39 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.tcp_current_mss
>>        0.00            +0.1        0.10 =C2=B1 10%  perf-profile.self.cy=
cles-pp.wakeup_preempt_entity
>>        0.07 =C2=B1  7%      +0.1        0.17 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.__cond_resched
>>        0.07 =C2=B1  9%      +0.1        0.17 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.ip_protocol_deliver_rcu
>>        0.28 =C2=B1  8%      +0.1        0.38 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.sock_def_readable
>>        0.07 =C2=B1 11%      +0.1        0.17 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__tcp_select_window
>>        0.09 =C2=B1  7%      +0.1        0.20 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.tcp_release_cb
>>        0.01 =C2=B1223%      +0.1        0.11 =C2=B1 11%  perf-profile.se=
lf.cycles-pp._copy_from_iter_full
>>        0.21 =C2=B1  8%      +0.1        0.32 =C2=B1  4%  perf-profile.se=
lf.cycles-pp.tcp_schedule_loss_probe
>>        0.00            +0.1        0.11 =C2=B1  8%  perf-profile.self.cy=
cles-pp.tcp_newly_delivered
>>        0.00            +0.1        0.11 =C2=B1 11%  perf-profile.self.cy=
cles-pp.netif_skb_features
>>        0.04 =C2=B1 71%      +0.1        0.14 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.entry_SYSCALL_64_safe_stack
>>        0.09 =C2=B1 10%      +0.1        0.20 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.release_sock
>>        0.07 =C2=B1 10%      +0.1        0.18 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.kfree_skbmem
>>        0.07 =C2=B1  6%      +0.1        0.18 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.sock_rfree
>>        0.04 =C2=B1 44%      +0.1        0.15 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__list_add_valid
>>        0.05 =C2=B1  9%      +0.1        0.17 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.sk_filter_trim_cap
>>        0.06 =C2=B1  7%      +0.1        0.18 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.sock_put
>>        0.18 =C2=B1  8%      +0.1        0.30 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.mod_timer
>>        0.10 =C2=B1  7%      +0.1        0.22 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.tcp_rate_skb_sent
>>        0.34 =C2=B1  9%      +0.1        0.46 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__softirqentry_text_start
>>        0.06 =C2=B1  9%      +0.1        0.19 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.tcp_recvmsg
>>        0.06 =C2=B1  7%      +0.1        0.19 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.syscall_exit_to_user_mode
>>        0.15 =C2=B1  8%      +0.1        0.28 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.pick_next_task_fair
>>        0.00            +0.1        0.13 =C2=B1 11%  perf-profile.self.cy=
cles-pp.set_next_buddy
>>        0.14 =C2=B1  8%      +0.1        0.27 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.__calc_delta
>>        0.27 =C2=B1  9%      +0.1        0.40 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.finish_task_switch
>>        0.09 =C2=B1 18%      +0.1        0.22 =C2=B1 15%  perf-profile.se=
lf.cycles-pp.cpuacct_charge
>>        0.00            +0.1        0.13 =C2=B1 10%  perf-profile.self.cy=
cles-pp.skb_copy_datagram_iter
>>        0.46 =C2=B1  7%      +0.1        0.59 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.update_cfs_group
>>        0.00            +0.1        0.13 =C2=B1 59%  perf-profile.self.cy=
cles-pp.update_sd_lb_stats
>>        0.00            +0.1        0.14 =C2=B1 10%  perf-profile.self.cy=
cles-pp.apparmor_socket_sock_rcv_skb
>>        0.43 =C2=B1  7%      +0.1        0.57 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.switch_mm_irqs_off
>>        0.13 =C2=B1  8%      +0.1        0.27 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__kmalloc_node_track_caller
>>        0.06 =C2=B1  8%      +0.1        0.20 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.inet_recvmsg
>>        0.11 =C2=B1  6%      +0.1        0.26 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.enqueue_to_backlog
>>        0.02 =C2=B1141%      +0.1        0.16 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.tcp_rate_gen
>>        0.13 =C2=B1 11%      +0.1        0.27 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.sock_sendmsg
>>        0.47 =C2=B1  7%      +0.1        0.61 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.__dev_queue_xmit
>>        0.04 =C2=B1 44%      +0.1        0.19 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.bictcp_cong_avoid
>>        0.14 =C2=B1 10%      +0.1        0.29 =C2=B1 15%  perf-profile.se=
lf.cycles-pp.irqtime_account_irq
>>        0.11 =C2=B1  8%      +0.2        0.26 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.do_softirq
>>        0.12 =C2=B1  7%      +0.2        0.27 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.__x64_sys_recvfrom
>>        0.07 =C2=B1 10%      +0.2        0.23 =C2=B1  7%  perf-profile.se=
lf.cycles-pp._copy_to_iter
>>        0.07 =C2=B1  8%      +0.2        0.22 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.bictcp_acked
>>        0.15 =C2=B1  9%      +0.2        0.31 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.___perf_sw_event
>>        0.00            +0.2        0.16 =C2=B1  6%  perf-profile.self.cy=
cles-pp.clear_buddies
>>        0.08 =C2=B1  8%      +0.2        0.24 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.kmem_cache_free
>>        0.22 =C2=B1  5%      +0.2        0.38 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.sk_wait_data
>>        0.02 =C2=B1141%      +0.2        0.19 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.sk_stream_alloc_skb
>>        0.13 =C2=B1 10%      +0.2        0.31 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.kmem_cache_alloc_node
>>        0.08 =C2=B1  7%      +0.2        0.26 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.import_single_range
>>        0.19 =C2=B1  7%      +0.2        0.36 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__alloc_skb
>>        0.10 =C2=B1 10%      +0.2        0.28 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.tcp_sendmsg
>>        0.10 =C2=B1 10%      +0.2        0.29 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__ip_finish_output
>>        0.57 =C2=B1  7%      +0.2        0.76 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.native_sched_clock
>>        0.15 =C2=B1  5%      +0.2        0.33 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.tcp_event_new_data_sent
>>        0.11 =C2=B1  8%      +0.2        0.30 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.loopback_xmit
>>        0.08 =C2=B1  8%      +0.2        0.27 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.ip_rcv_core
>>        0.00            +0.2        0.21 =C2=B1  8%  perf-profile.self.cy=
cles-pp.__netif_receive_skb_one_core
>>        0.13 =C2=B1  8%      +0.2        0.35 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.tcp_update_pacing_rate
>>        0.17 =C2=B1  8%      +0.2        0.39 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.__might_sleep
>>        0.58 =C2=B1  8%      +0.2        0.81 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__switch_to
>>        0.20 =C2=B1  6%      +0.2        0.42 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.do_syscall_64
>>        0.13 =C2=B1  9%      +0.2        0.37 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__sys_recvfrom
>>        0.19 =C2=B1  9%      +0.2        0.42 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.select_task_rq_fair
>>        0.03 =C2=B1 70%      +0.2        0.27 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.__tcp_push_pending_frames
>>        0.19 =C2=B1 10%      +0.2        0.44 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.aa_sk_perm
>>        0.89 =C2=B1  7%      +0.3        1.14 =C2=B1  6%  perf-profile.se=
lf.cycles-pp._raw_spin_lock_bh
>>        0.34 =C2=B1  8%      +0.3        0.59 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.___might_sleep
>>        0.55 =C2=B1  5%      +0.3        0.81 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.tcp_ack
>>        0.08 =C2=B1 12%      +0.3        0.34 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.kfree
>>        0.00            +0.3        0.27 =C2=B1  8%  perf-profile.self.cy=
cles-pp.check_preempt_wakeup
>>        0.17 =C2=B1  6%      +0.3        0.44 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.ip_output
>>        0.11 =C2=B1 10%      +0.3        0.40 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.__x64_sys_sendto
>>        0.23 =C2=B1  8%      +0.3        0.54 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__local_bh_enable_ip
>>        0.22 =C2=B1  9%      +0.3        0.54 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__sys_sendto
>>        0.39 =C2=B1  7%      +0.3        0.71 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.tcp_clean_rtx_queue
>>        0.18 =C2=B1 33%      +0.3        0.50 =C2=B1 33%  perf-profile.se=
lf.cycles-pp.cpuidle_enter_state
>>        0.26 =C2=B1  7%      +0.3        0.58 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__cgroup_bpf_run_filter_skb
>>        0.18 =C2=B1  8%      +0.3        0.51 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.tcp_wfree
>>        1.00 =C2=B1  7%      +0.3        1.34 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.tcp_sendmsg_locked
>>        0.09 =C2=B1  8%      +0.3        0.43 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.copy_user_enhanced_fast_string
>>        0.18 =C2=B1 11%      +0.4        0.54 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__entry_text_start
>>        0.23 =C2=B1  8%      +0.4        0.60 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.process_backlog
>>        0.09 =C2=B1 10%      +0.4        0.48 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.__virt_addr_valid
>>        0.23 =C2=B1  6%      +0.4        0.62 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__ip_queue_xmit
>>        0.24 =C2=B1  7%      +0.4        0.63 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.copy_fpregs_to_fpstate
>>        0.12 =C2=B1  9%      +0.4        0.55 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__netif_receive_skb_core
>>        0.33 =C2=B1  7%      +0.4        0.76 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.net_rx_action
>>        0.27 =C2=B1  9%      +0.4        0.70 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__fget_light
>>        0.55 =C2=B1  7%      +0.5        1.01 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.read_tsc
>>        0.60 =C2=B1  8%      +0.5        1.07 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__switch_to_asm
>>        0.06 =C2=B1  8%      +0.5        0.53 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.exit_to_user_mode_prepare
>>        0.33 =C2=B1  6%      +0.5        0.85 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.tcp_write_xmit
>>        0.54 =C2=B1  8%      +0.6        1.15 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__tcp_transmit_skb
>>        0.36 =C2=B1  7%      +0.6        0.98 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.syscall_return_via_sysret
>>        0.33 =C2=B1 11%      +0.6        0.97 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.ip_finish_output2
>>        0.34 =C2=B1  7%      +0.7        1.08 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.entry_SYSCALL_64_after_hwframe
>>        0.13 =C2=B1  8%      +1.3        1.46 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.switch_fpu_return
>>        0.00            +1.8        1.76 =C2=B1  8%  perf-profile.self.cy=
cles-pp.load_new_mm_cr3
>>     1085775 =C2=B1  9%    +103.2%    2205895 =C2=B1  6%  interrupts.CAL:=
Function_call_interrupts
>>        4580 =C2=B1  7%     -26.6%       3360 =C2=B1  9%  interrupts.CPU0=
.NMI:Non-maskable_interrupts
>>        4580 =C2=B1  7%     -26.6%       3360 =C2=B1  9%  interrupts.CPU0=
.PMI:Performance_monitoring_interrupts
>>       13481 =C2=B1  6%     -96.1%     531.17 =C2=B1  6%  interrupts.CPU0=
.RES:Rescheduling_interrupts
>>       13337 =C2=B1 13%     -97.8%     290.17 =C2=B1  9%  interrupts.CPU1=
.RES:Rescheduling_interrupts
>>       13737 =C2=B1 13%     -97.8%     304.17 =C2=B1  7%  interrupts.CPU1=
0.RES:Rescheduling_interrupts
>>        5262 =C2=B1 26%    +110.0%      11051 =C2=B1  7%  interrupts.CPU1=
00.CAL:Function_call_interrupts
>>        4933 =C2=B1 18%     -49.7%       2483 =C2=B1 40%  interrupts.CPU1=
00.NMI:Non-maskable_interrupts
>>        4933 =C2=B1 18%     -49.7%       2483 =C2=B1 40%  interrupts.CPU1=
00.PMI:Performance_monitoring_interrupts
>>       14635 =C2=B1  7%     -98.3%     244.67 =C2=B1  5%  interrupts.CPU1=
00.RES:Rescheduling_interrupts
>>        5305 =C2=B1  7%     -53.9%       2444 =C2=B1 22%  interrupts.CPU1=
01.NMI:Non-maskable_interrupts
>>        5305 =C2=B1  7%     -53.9%       2444 =C2=B1 22%  interrupts.CPU1=
01.PMI:Performance_monitoring_interrupts
>>       15254 =C2=B1  6%     -98.5%     235.33 =C2=B1  8%  interrupts.CPU1=
01.RES:Rescheduling_interrupts
>>        5526 =C2=B1 34%    +105.0%      11328 =C2=B1  9%  interrupts.CPU1=
02.CAL:Function_call_interrupts
>>        5261 =C2=B1  9%     -49.2%       2671 =C2=B1 25%  interrupts.CPU1=
02.NMI:Non-maskable_interrupts
>>        5261 =C2=B1  9%     -49.2%       2671 =C2=B1 25%  interrupts.CPU1=
02.PMI:Performance_monitoring_interrupts
>>       14577 =C2=B1  5%     -98.4%     228.83 =C2=B1  7%  interrupts.CPU1=
02.RES:Rescheduling_interrupts
>>        4528 =C2=B1 21%    +141.4%      10930 =C2=B1  6%  interrupts.CPU1=
03.CAL:Function_call_interrupts
>>        5055 =C2=B1 12%     -48.1%       2621 =C2=B1 32%  interrupts.CPU1=
03.NMI:Non-maskable_interrupts
>>        5055 =C2=B1 12%     -48.1%       2621 =C2=B1 32%  interrupts.CPU1=
03.PMI:Performance_monitoring_interrupts
>>       14412 =C2=B1 10%     -98.4%     233.50 =C2=B1  6%  interrupts.CPU1=
03.RES:Rescheduling_interrupts
>>        4368 =C2=B1 27%    +147.3%      10803 =C2=B1  5%  interrupts.CPU1=
04.CAL:Function_call_interrupts
>>        5070 =C2=B1 17%     -37.3%       3179 =C2=B1  8%  interrupts.CPU1=
04.NMI:Non-maskable_interrupts
>>        5070 =C2=B1 17%     -37.3%       3179 =C2=B1  8%  interrupts.CPU1=
04.PMI:Performance_monitoring_interrupts
>>       14352 =C2=B1  4%     -98.5%     219.67 =C2=B1  7%  interrupts.CPU1=
04.RES:Rescheduling_interrupts
>>        5158 =C2=B1 19%    +115.8%      11132 =C2=B1  7%  interrupts.CPU1=
05.CAL:Function_call_interrupts
>>        5012 =C2=B1 15%     -48.0%       2605 =C2=B1 23%  interrupts.CPU1=
05.NMI:Non-maskable_interrupts
>>        5012 =C2=B1 15%     -48.0%       2605 =C2=B1 23%  interrupts.CPU1=
05.PMI:Performance_monitoring_interrupts
>>       14035 =C2=B1  8%     -98.4%     229.33 =C2=B1  9%  interrupts.CPU1=
05.RES:Rescheduling_interrupts
>>        6680 =C2=B1 41%     +67.4%      11182 =C2=B1  7%  interrupts.CPU1=
06.CAL:Function_call_interrupts
>>        4961 =C2=B1 13%     -39.7%       2993 =C2=B1 27%  interrupts.CPU1=
06.NMI:Non-maskable_interrupts
>>        4961 =C2=B1 13%     -39.7%       2993 =C2=B1 27%  interrupts.CPU1=
06.PMI:Performance_monitoring_interrupts
>>       13041 =C2=B1 12%     -98.1%     242.17 =C2=B1  3%  interrupts.CPU1=
06.RES:Rescheduling_interrupts
>>        5135 =C2=B1 52%    +125.8%      11594 =C2=B1 11%  interrupts.CPU1=
07.CAL:Function_call_interrupts
>>        4971 =C2=B1  9%     -50.8%       2445 =C2=B1 34%  interrupts.CPU1=
07.NMI:Non-maskable_interrupts
>>        4971 =C2=B1  9%     -50.8%       2445 =C2=B1 34%  interrupts.CPU1=
07.PMI:Performance_monitoring_interrupts
>>       14356 =C2=B1  8%     -98.4%     229.33 =C2=B1  7%  interrupts.CPU1=
07.RES:Rescheduling_interrupts
>>        6126 =C2=B1 39%     +85.6%      11372 =C2=B1  7%  interrupts.CPU1=
08.CAL:Function_call_interrupts
>>       13840 =C2=B1  5%     -98.3%     241.33 =C2=B1  7%  interrupts.CPU1=
08.RES:Rescheduling_interrupts
>>        6228 =C2=B1 46%     +85.4%      11547 =C2=B1  6%  interrupts.CPU1=
09.CAL:Function_call_interrupts
>>       13960 =C2=B1  8%     -98.3%     236.67 =C2=B1 11%  interrupts.CPU1=
09.RES:Rescheduling_interrupts
>>       14690 =C2=B1 10%     -97.7%     339.00 =C2=B1  3%  interrupts.CPU1=
1.RES:Rescheduling_interrupts
>>        5261 =C2=B1 28%    +114.4%      11279 =C2=B1  6%  interrupts.CPU1=
10.CAL:Function_call_interrupts
>>       12802 =C2=B1  5%     -98.1%     239.00 =C2=B1  4%  interrupts.CPU1=
10.RES:Rescheduling_interrupts
>>        4523 =C2=B1 37%    +154.6%      11514 =C2=B1  9%  interrupts.CPU1=
11.CAL:Function_call_interrupts
>>       13061 =C2=B1  6%     -98.1%     251.67 =C2=B1  9%  interrupts.CPU1=
11.RES:Rescheduling_interrupts
>>        6218 =C2=B1 22%     +88.5%      11723 =C2=B1  8%  interrupts.CPU1=
12.CAL:Function_call_interrupts
>>       13369 =C2=B1  6%     -98.3%     231.50 =C2=B1  9%  interrupts.CPU1=
12.RES:Rescheduling_interrupts
>>        5317 =C2=B1 12%     -48.7%       2727 =C2=B1 17%  interrupts.CPU1=
13.NMI:Non-maskable_interrupts
>>        5317 =C2=B1 12%     -48.7%       2727 =C2=B1 17%  interrupts.CPU1=
13.PMI:Performance_monitoring_interrupts
>>       12180 =C2=B1  4%     -98.0%     239.50 =C2=B1  8%  interrupts.CPU1=
13.RES:Rescheduling_interrupts
>>        5066 =C2=B1 34%    +130.7%      11687 =C2=B1  7%  interrupts.CPU1=
14.CAL:Function_call_interrupts
>>       12885 =C2=B1  5%     -98.2%     230.33 =C2=B1  9%  interrupts.CPU1=
14.RES:Rescheduling_interrupts
>>        6247 =C2=B1 50%     +84.6%      11533 =C2=B1  4%  interrupts.CPU1=
15.CAL:Function_call_interrupts
>>       12906 =C2=B1  4%     -98.1%     248.83 =C2=B1  7%  interrupts.CPU1=
15.RES:Rescheduling_interrupts
>>       12058 =C2=B1  7%     -98.2%     222.17 =C2=B1 10%  interrupts.CPU1=
16.RES:Rescheduling_interrupts
>>        5486 =C2=B1 23%    +109.3%      11483 =C2=B1  9%  interrupts.CPU1=
17.CAL:Function_call_interrupts
>>       12547 =C2=B1  9%     -98.2%     221.17 =C2=B1 12%  interrupts.CPU1=
17.RES:Rescheduling_interrupts
>>        5380 =C2=B1 51%    +110.1%      11307 =C2=B1  7%  interrupts.CPU1=
18.CAL:Function_call_interrupts
>>       12257 =C2=B1  7%     -98.1%     229.17 =C2=B1  4%  interrupts.CPU1=
18.RES:Rescheduling_interrupts
>>       12139 =C2=B1  6%     -98.0%     243.67 =C2=B1  3%  interrupts.CPU1=
19.RES:Rescheduling_interrupts
>>       15231 =C2=B1  3%     -97.7%     356.83 =C2=B1  9%  interrupts.CPU1=
2.RES:Rescheduling_interrupts
>>        5264 =C2=B1 25%    +121.3%      11653 =C2=B1  5%  interrupts.CPU1=
20.CAL:Function_call_interrupts
>>       15207 =C2=B1  9%     -98.7%     204.17 =C2=B1  8%  interrupts.CPU1=
20.RES:Rescheduling_interrupts
>>        5812 =C2=B1 10%     -53.0%       2729 =C2=B1 18%  interrupts.CPU1=
21.NMI:Non-maskable_interrupts
>>        5812 =C2=B1 10%     -53.0%       2729 =C2=B1 18%  interrupts.CPU1=
21.PMI:Performance_monitoring_interrupts
>>       15216 =C2=B1  8%     -98.6%     218.83 =C2=B1  8%  interrupts.CPU1=
21.RES:Rescheduling_interrupts
>>        5202 =C2=B1 36%    +112.6%      11062 =C2=B1  8%  interrupts.CPU1=
22.CAL:Function_call_interrupts
>>        5262 =C2=B1  4%     -43.3%       2983 =C2=B1 17%  interrupts.CPU1=
22.NMI:Non-maskable_interrupts
>>        5262 =C2=B1  4%     -43.3%       2983 =C2=B1 17%  interrupts.CPU1=
22.PMI:Performance_monitoring_interrupts
>>       14638 =C2=B1  4%     -98.5%     221.00 =C2=B1  9%  interrupts.CPU1=
22.RES:Rescheduling_interrupts
>>        5529 =C2=B1 15%     -43.6%       3117 =C2=B1 14%  interrupts.CPU1=
23.NMI:Non-maskable_interrupts
>>        5529 =C2=B1 15%     -43.6%       3117 =C2=B1 14%  interrupts.CPU1=
23.PMI:Performance_monitoring_interrupts
>>       14287 =C2=B1  7%     -98.5%     214.33 =C2=B1  5%  interrupts.CPU1=
23.RES:Rescheduling_interrupts
>>        4426 =C2=B1 31%    +150.8%      11102 =C2=B1  6%  interrupts.CPU1=
24.CAL:Function_call_interrupts
>>       14512 =C2=B1  8%     -98.5%     214.33 =C2=B1  9%  interrupts.CPU1=
24.RES:Rescheduling_interrupts
>>        5201 =C2=B1 24%    +109.6%      10904 =C2=B1  6%  interrupts.CPU1=
25.CAL:Function_call_interrupts
>>       14116 =C2=B1  2%     -98.5%     206.00 =C2=B1  6%  interrupts.CPU1=
25.RES:Rescheduling_interrupts
>>       14369 =C2=B1 10%     -98.6%     207.33 =C2=B1  8%  interrupts.CPU1=
26.RES:Rescheduling_interrupts
>>        4555 =C2=B1 23%    +143.5%      11090 =C2=B1  7%  interrupts.CPU1=
27.CAL:Function_call_interrupts
>>       13969 =C2=B1  7%     -98.5%     212.17 =C2=B1  4%  interrupts.CPU1=
27.RES:Rescheduling_interrupts
>>        4294 =C2=B1 23%    +156.3%      11006 =C2=B1  7%  interrupts.CPU1=
28.CAL:Function_call_interrupts
>>       13475 =C2=B1  8%     -98.4%     213.67 =C2=B1  3%  interrupts.CPU1=
28.RES:Rescheduling_interrupts
>>        4584 =C2=B1 38%    +143.3%      11155 =C2=B1  7%  interrupts.CPU1=
29.CAL:Function_call_interrupts
>>       12688 =C2=B1  6%     -98.4%     206.17 =C2=B1  4%  interrupts.CPU1=
29.RES:Rescheduling_interrupts
>>        6404 =C2=B1 15%     +97.6%      12658 =C2=B1  5%  interrupts.CPU1=
3.CAL:Function_call_interrupts
>>       14996 =C2=B1 14%     -97.3%     405.33 =C2=B1  7%  interrupts.CPU1=
3.RES:Rescheduling_interrupts
>>        5215 =C2=B1 42%    +114.7%      11198 =C2=B1  7%  interrupts.CPU1=
30.CAL:Function_call_interrupts
>>       12990 =C2=B1  9%     -98.4%     209.67 =C2=B1 11%  interrupts.CPU1=
30.RES:Rescheduling_interrupts
>>        4488 =C2=B1 32%    +151.5%      11287 =C2=B1  7%  interrupts.CPU1=
31.CAL:Function_call_interrupts
>>       12730 =C2=B1  6%     -98.3%     218.83 =C2=B1  4%  interrupts.CPU1=
31.RES:Rescheduling_interrupts
>>        3942 =C2=B1 35%    +183.7%      11184 =C2=B1  4%  interrupts.CPU1=
32.CAL:Function_call_interrupts
>>       12515 =C2=B1  6%     -98.1%     232.33 =C2=B1  6%  interrupts.CPU1=
32.RES:Rescheduling_interrupts
>>        4164 =C2=B1 17%    +164.9%      11030 =C2=B1  5%  interrupts.CPU1=
33.CAL:Function_call_interrupts
>>       12292 =C2=B1  3%     -98.2%     225.83 =C2=B1 11%  interrupts.CPU1=
33.RES:Rescheduling_interrupts
>>        4521 =C2=B1 22%    +146.8%      11156 =C2=B1  8%  interrupts.CPU1=
34.CAL:Function_call_interrupts
>>       11967 =C2=B1  6%     -98.2%     215.67 =C2=B1  8%  interrupts.CPU1=
34.RES:Rescheduling_interrupts
>>        4023 =C2=B1 30%    +174.4%      11041 =C2=B1  6%  interrupts.CPU1=
35.CAL:Function_call_interrupts
>>       12387 =C2=B1  9%     -98.2%     220.50 =C2=B1  6%  interrupts.CPU1=
35.RES:Rescheduling_interrupts
>>        5494 =C2=B1 32%    +101.6%      11078 =C2=B1  6%  interrupts.CPU1=
36.CAL:Function_call_interrupts
>>       11194 =C2=B1  7%     -98.0%     228.67 =C2=B1  9%  interrupts.CPU1=
36.RES:Rescheduling_interrupts
>>        3542 =C2=B1 35%    +220.2%      11345 =C2=B1  7%  interrupts.CPU1=
37.CAL:Function_call_interrupts
>>       11023 =C2=B1  5%     -97.9%     229.33 =C2=B1  2%  interrupts.CPU1=
37.RES:Rescheduling_interrupts
>>        4729 =C2=B1 21%    +142.7%      11476 =C2=B1  8%  interrupts.CPU1=
38.CAL:Function_call_interrupts
>>       11287 =C2=B1  7%     -98.1%     216.50 =C2=B1  9%  interrupts.CPU1=
38.RES:Rescheduling_interrupts
>>        3768 =C2=B1 22%    +199.3%      11278 =C2=B1  6%  interrupts.CPU1=
39.CAL:Function_call_interrupts
>>       11420 =C2=B1 12%     -97.9%     234.17 =C2=B1  7%  interrupts.CPU1=
39.RES:Rescheduling_interrupts
>>       14444 =C2=B1  6%     -97.1%     412.83 =C2=B1  5%  interrupts.CPU1=
4.RES:Rescheduling_interrupts
>>        4832 =C2=B1 35%    +130.2%      11124 =C2=B1  5%  interrupts.CPU1=
40.CAL:Function_call_interrupts
>>       11604 =C2=B1  6%     -98.1%     225.33 =C2=B1  7%  interrupts.CPU1=
40.RES:Rescheduling_interrupts
>>        4560 =C2=B1 34%    +150.1%      11406 =C2=B1  6%  interrupts.CPU1=
41.CAL:Function_call_interrupts
>>       11137 =C2=B1 15%     -98.0%     225.17 =C2=B1  7%  interrupts.CPU1=
41.RES:Rescheduling_interrupts
>>        4919 =C2=B1 44%    +131.2%      11370 =C2=B1  6%  interrupts.CPU1=
42.CAL:Function_call_interrupts
>>        4638 =C2=B1 16%     -34.5%       3039 =C2=B1 17%  interrupts.CPU1=
42.NMI:Non-maskable_interrupts
>>        4638 =C2=B1 16%     -34.5%       3039 =C2=B1 17%  interrupts.CPU1=
42.PMI:Performance_monitoring_interrupts
>>       10864 =C2=B1  6%     -98.0%     217.83 =C2=B1  8%  interrupts.CPU1=
42.RES:Rescheduling_interrupts
>>        4481 =C2=B1 17%     -32.4%       3027 =C2=B1  9%  interrupts.CPU1=
43.NMI:Non-maskable_interrupts
>>        4481 =C2=B1 17%     -32.4%       3027 =C2=B1  9%  interrupts.CPU1=
43.PMI:Performance_monitoring_interrupts
>>       10788 =C2=B1  9%     -97.9%     226.17 =C2=B1 10%  interrupts.CPU1=
43.RES:Rescheduling_interrupts
>>        7058 =C2=B1 19%     +49.5%      10555 =C2=B1 13%  interrupts.CPU1=
44.CAL:Function_call_interrupts
>>        5164 =C2=B1 16%     -41.9%       3000 =C2=B1 33%  interrupts.CPU1=
44.NMI:Non-maskable_interrupts
>>        5164 =C2=B1 16%     -41.9%       3000 =C2=B1 33%  interrupts.CPU1=
44.PMI:Performance_monitoring_interrupts
>>       15972 =C2=B1  7%     -98.7%     212.33 =C2=B1  9%  interrupts.CPU1=
44.RES:Rescheduling_interrupts
>>        5057 =C2=B1 36%    +114.3%      10838 =C2=B1  8%  interrupts.CPU1=
45.CAL:Function_call_interrupts
>>        4907 =C2=B1 15%     -37.1%       3087 =C2=B1 20%  interrupts.CPU1=
45.NMI:Non-maskable_interrupts
>>        4907 =C2=B1 15%     -37.1%       3087 =C2=B1 20%  interrupts.CPU1=
45.PMI:Performance_monitoring_interrupts
>>       14838 =C2=B1  6%     -98.6%     203.83 =C2=B1  9%  interrupts.CPU1=
45.RES:Rescheduling_interrupts
>>        5495 =C2=B1  6%     -51.0%       2693 =C2=B1 18%  interrupts.CPU1=
46.NMI:Non-maskable_interrupts
>>        5495 =C2=B1  6%     -51.0%       2693 =C2=B1 18%  interrupts.CPU1=
46.PMI:Performance_monitoring_interrupts
>>       14024 =C2=B1  9%     -98.4%     220.67 =C2=B1  8%  interrupts.CPU1=
46.RES:Rescheduling_interrupts
>>        5031 =C2=B1 13%     -42.6%       2887 =C2=B1 21%  interrupts.CPU1=
47.NMI:Non-maskable_interrupts
>>        5031 =C2=B1 13%     -42.6%       2887 =C2=B1 21%  interrupts.CPU1=
47.PMI:Performance_monitoring_interrupts
>>       13216 =C2=B1  8%     -98.4%     212.00 =C2=B1  4%  interrupts.CPU1=
47.RES:Rescheduling_interrupts
>>        5049 =C2=B1 32%    +114.2%      10817 =C2=B1  5%  interrupts.CPU1=
48.CAL:Function_call_interrupts
>>        5718 =C2=B1  7%     -48.0%       2971 =C2=B1 18%  interrupts.CPU1=
48.NMI:Non-maskable_interrupts
>>        5718 =C2=B1  7%     -48.0%       2971 =C2=B1 18%  interrupts.CPU1=
48.PMI:Performance_monitoring_interrupts
>>       13002 =C2=B1 10%     -98.3%     223.17 =C2=B1  8%  interrupts.CPU1=
48.RES:Rescheduling_interrupts
>>        5697 =C2=B1  5%     -47.5%       2991 =C2=B1 15%  interrupts.CPU1=
49.NMI:Non-maskable_interrupts
>>        5697 =C2=B1  5%     -47.5%       2991 =C2=B1 15%  interrupts.CPU1=
49.PMI:Performance_monitoring_interrupts
>>       13366 =C2=B1 10%     -98.4%     213.00 =C2=B1 10%  interrupts.CPU1=
49.RES:Rescheduling_interrupts
>>        6145 =C2=B1 26%    +103.3%      12494 =C2=B1  8%  interrupts.CPU1=
5.CAL:Function_call_interrupts
>>        5148 =C2=B1  9%     -47.1%       2721 =C2=B1 28%  interrupts.CPU1=
5.NMI:Non-maskable_interrupts
>>        5148 =C2=B1  9%     -47.1%       2721 =C2=B1 28%  interrupts.CPU1=
5.PMI:Performance_monitoring_interrupts
>>       14863 =C2=B1  9%     -97.4%     392.50 =C2=B1  5%  interrupts.CPU1=
5.RES:Rescheduling_interrupts
>>        4825 =C2=B1 26%    +123.2%      10770 =C2=B1  6%  interrupts.CPU1=
50.CAL:Function_call_interrupts
>>       13127 =C2=B1 10%     -98.4%     213.50 =C2=B1  8%  interrupts.CPU1=
50.RES:Rescheduling_interrupts
>>        3893 =C2=B1 22%    +172.1%      10593 =C2=B1  7%  interrupts.CPU1=
51.CAL:Function_call_interrupts
>>       12604 =C2=B1 11%     -98.2%     222.33 =C2=B1  5%  interrupts.CPU1=
51.RES:Rescheduling_interrupts
>>        4303 =C2=B1 12%    +149.0%      10717 =C2=B1  6%  interrupts.CPU1=
52.CAL:Function_call_interrupts
>>       13019 =C2=B1  9%     -98.3%     219.50 =C2=B1  5%  interrupts.CPU1=
52.RES:Rescheduling_interrupts
>>        4420 =C2=B1 28%    +148.2%      10972 =C2=B1  4%  interrupts.CPU1=
53.CAL:Function_call_interrupts
>>       13112 =C2=B1 12%     -98.3%     224.00 =C2=B1 10%  interrupts.CPU1=
53.RES:Rescheduling_interrupts
>>        5174 =C2=B1 30%    +103.8%      10547 =C2=B1  5%  interrupts.CPU1=
54.CAL:Function_call_interrupts
>>        4583 =C2=B1 24%     -39.0%       2797 =C2=B1 17%  interrupts.CPU1=
54.NMI:Non-maskable_interrupts
>>        4583 =C2=B1 24%     -39.0%       2797 =C2=B1 17%  interrupts.CPU1=
54.PMI:Performance_monitoring_interrupts
>>       12675 =C2=B1 14%     -98.3%     215.17 =C2=B1  8%  interrupts.CPU1=
54.RES:Rescheduling_interrupts
>>       12278 =C2=B1  8%     -98.3%     213.33 =C2=B1  8%  interrupts.CPU1=
55.RES:Rescheduling_interrupts
>>        3057 =C2=B1 28%    +250.5%      10716 =C2=B1  5%  interrupts.CPU1=
56.CAL:Function_call_interrupts
>>       11612 =C2=B1 17%     -98.1%     216.17 =C2=B1  6%  interrupts.CPU1=
56.RES:Rescheduling_interrupts
>>        3772 =C2=B1 13%    +189.3%      10911 =C2=B1  4%  interrupts.CPU1=
57.CAL:Function_call_interrupts
>>       12530 =C2=B1  9%     -98.3%     216.67 =C2=B1  6%  interrupts.CPU1=
57.RES:Rescheduling_interrupts
>>        4559 =C2=B1 36%    +138.2%      10862 =C2=B1  6%  interrupts.CPU1=
58.CAL:Function_call_interrupts
>>       11416 =C2=B1 11%     -98.0%     228.50 =C2=B1  8%  interrupts.CPU1=
58.RES:Rescheduling_interrupts
>>        4941 =C2=B1 28%    +111.5%      10452 =C2=B1 10%  interrupts.CPU1=
59.CAL:Function_call_interrupts
>>       11209 =C2=B1 13%     -98.0%     228.33 =C2=B1  5%  interrupts.CPU1=
59.RES:Rescheduling_interrupts
>>        7998 =C2=B1 28%     +58.2%      12653 =C2=B1  6%  interrupts.CPU1=
6.CAL:Function_call_interrupts
>>        5403 =C2=B1  9%     -52.0%       2596 =C2=B1 38%  interrupts.CPU1=
6.NMI:Non-maskable_interrupts
>>        5403 =C2=B1  9%     -52.0%       2596 =C2=B1 38%  interrupts.CPU1=
6.PMI:Performance_monitoring_interrupts
>>       15509 =C2=B1  7%     -97.5%     388.67 =C2=B1  5%  interrupts.CPU1=
6.RES:Rescheduling_interrupts
>>        4029 =C2=B1 35%    +166.5%      10739 =C2=B1  6%  interrupts.CPU1=
60.CAL:Function_call_interrupts
>>       11572 =C2=B1 11%     -98.2%     212.00 =C2=B1  9%  interrupts.CPU1=
60.RES:Rescheduling_interrupts
>>        4566 =C2=B1 42%    +142.3%      11063 =C2=B1  9%  interrupts.CPU1=
61.CAL:Function_call_interrupts
>>       11720 =C2=B1 16%     -98.1%     226.00 =C2=B1  6%  interrupts.CPU1=
61.RES:Rescheduling_interrupts
>>        3840 =C2=B1 27%    +183.4%      10883 =C2=B1  5%  interrupts.CPU1=
62.CAL:Function_call_interrupts
>>       10965 =C2=B1 11%     -97.9%     225.67 =C2=B1  6%  interrupts.CPU1=
62.RES:Rescheduling_interrupts
>>        4469 =C2=B1 29%    +144.0%      10905 =C2=B1  5%  interrupts.CPU1=
63.CAL:Function_call_interrupts
>>        4506 =C2=B1  8%     -32.8%       3030 =C2=B1 16%  interrupts.CPU1=
63.NMI:Non-maskable_interrupts
>>        4506 =C2=B1  8%     -32.8%       3030 =C2=B1 16%  interrupts.CPU1=
63.PMI:Performance_monitoring_interrupts
>>       11026 =C2=B1 14%     -98.0%     222.83 =C2=B1 10%  interrupts.CPU1=
63.RES:Rescheduling_interrupts
>>        4023 =C2=B1 27%    +169.1%      10827 =C2=B1  5%  interrupts.CPU1=
64.CAL:Function_call_interrupts
>>       10755 =C2=B1 12%     -97.8%     234.17 =C2=B1  6%  interrupts.CPU1=
64.RES:Rescheduling_interrupts
>>        4212 =C2=B1 26%    +162.4%      11052 =C2=B1  8%  interrupts.CPU1=
65.CAL:Function_call_interrupts
>>        5212 =C2=B1  8%     -40.6%       3097 =C2=B1 13%  interrupts.CPU1=
65.NMI:Non-maskable_interrupts
>>        5212 =C2=B1  8%     -40.6%       3097 =C2=B1 13%  interrupts.CPU1=
65.PMI:Performance_monitoring_interrupts
>>       10404 =C2=B1 14%     -97.8%     231.00 =C2=B1  3%  interrupts.CPU1=
65.RES:Rescheduling_interrupts
>>        4404 =C2=B1 40%    +151.8%      11088 =C2=B1  9%  interrupts.CPU1=
66.CAL:Function_call_interrupts
>>       10553 =C2=B1 13%     -97.8%     232.00 =C2=B1  6%  interrupts.CPU1=
66.RES:Rescheduling_interrupts
>>        4067 =C2=B1 32%    +173.1%      11110 =C2=B1  5%  interrupts.CPU1=
67.CAL:Function_call_interrupts
>>        9977 =C2=B1 17%     -97.7%     228.50 =C2=B1 10%  interrupts.CPU1=
67.RES:Rescheduling_interrupts
>>        5089 =C2=B1 51%    +114.3%      10908 =C2=B1  6%  interrupts.CPU1=
68.CAL:Function_call_interrupts
>>        5643 =C2=B1  6%     -51.2%       2751 =C2=B1  9%  interrupts.CPU1=
68.NMI:Non-maskable_interrupts
>>        5643 =C2=B1  6%     -51.2%       2751 =C2=B1  9%  interrupts.CPU1=
68.PMI:Performance_monitoring_interrupts
>>       15403 =C2=B1  5%     -98.6%     212.67 =C2=B1  7%  interrupts.CPU1=
68.RES:Rescheduling_interrupts
>>        4631 =C2=B1 52%    +122.2%      10289 =C2=B1  9%  interrupts.CPU1=
69.CAL:Function_call_interrupts
>>        5323 =C2=B1  6%     -47.1%       2817 =C2=B1  7%  interrupts.CPU1=
69.NMI:Non-maskable_interrupts
>>        5323 =C2=B1  6%     -47.1%       2817 =C2=B1  7%  interrupts.CPU1=
69.PMI:Performance_monitoring_interrupts
>>       14238 =C2=B1  5%     -98.6%     205.33 =C2=B1  7%  interrupts.CPU1=
69.RES:Rescheduling_interrupts
>>        5115 =C2=B1  9%     -46.4%       2743 =C2=B1 31%  interrupts.CPU1=
7.NMI:Non-maskable_interrupts
>>        5115 =C2=B1  9%     -46.4%       2743 =C2=B1 31%  interrupts.CPU1=
7.PMI:Performance_monitoring_interrupts
>>       14625 =C2=B1  7%     -97.5%     361.33 =C2=B1  3%  interrupts.CPU1=
7.RES:Rescheduling_interrupts
>>        4246 =C2=B1 23%    +149.8%      10604 =C2=B1  6%  interrupts.CPU1=
70.CAL:Function_call_interrupts
>>        5181 =C2=B1 14%     -60.6%       2039 =C2=B1 39%  interrupts.CPU1=
70.NMI:Non-maskable_interrupts
>>        5181 =C2=B1 14%     -60.6%       2039 =C2=B1 39%  interrupts.CPU1=
70.PMI:Performance_monitoring_interrupts
>>       13844 =C2=B1 10%     -98.5%     214.00 =C2=B1 11%  interrupts.CPU1=
70.RES:Rescheduling_interrupts
>>        4578 =C2=B1 24%    +128.4%      10458 =C2=B1  6%  interrupts.CPU1=
71.CAL:Function_call_interrupts
>>        5346 =C2=B1  7%     -52.3%       2552 =C2=B1 23%  interrupts.CPU1=
71.NMI:Non-maskable_interrupts
>>        5346 =C2=B1  7%     -52.3%       2552 =C2=B1 23%  interrupts.CPU1=
71.PMI:Performance_monitoring_interrupts
>>       13329 =C2=B1  6%     -98.4%     207.83 =C2=B1  7%  interrupts.CPU1=
71.RES:Rescheduling_interrupts
>>        3689 =C2=B1 40%    +183.4%      10455 =C2=B1 10%  interrupts.CPU1=
72.CAL:Function_call_interrupts
>>        5297 =C2=B1 10%     -56.6%       2300 =C2=B1 43%  interrupts.CPU1=
72.NMI:Non-maskable_interrupts
>>        5297 =C2=B1 10%     -56.6%       2300 =C2=B1 43%  interrupts.CPU1=
72.PMI:Performance_monitoring_interrupts
>>       12853 =C2=B1 10%     -98.2%     226.83 =C2=B1  7%  interrupts.CPU1=
72.RES:Rescheduling_interrupts
>>        4999 =C2=B1 31%    +113.0%      10648 =C2=B1 12%  interrupts.CPU1=
73.CAL:Function_call_interrupts
>>        5198 =C2=B1 10%     -43.2%       2951 =C2=B1  5%  interrupts.CPU1=
73.NMI:Non-maskable_interrupts
>>        5198 =C2=B1 10%     -43.2%       2951 =C2=B1  5%  interrupts.CPU1=
73.PMI:Performance_monitoring_interrupts
>>       12857 =C2=B1  8%     -98.4%     210.50 =C2=B1  8%  interrupts.CPU1=
73.RES:Rescheduling_interrupts
>>        4147 =C2=B1 39%    +156.3%      10630 =C2=B1  3%  interrupts.CPU1=
74.CAL:Function_call_interrupts
>>        5506 =C2=B1 12%     -43.1%       3135 =C2=B1  9%  interrupts.CPU1=
74.NMI:Non-maskable_interrupts
>>        5506 =C2=B1 12%     -43.1%       3135 =C2=B1  9%  interrupts.CPU1=
74.PMI:Performance_monitoring_interrupts
>>       12839 =C2=B1  6%     -98.3%     221.50 =C2=B1  5%  interrupts.CPU1=
74.RES:Rescheduling_interrupts
>>        3944 =C2=B1 19%    +176.3%      10899 =C2=B1  7%  interrupts.CPU1=
75.CAL:Function_call_interrupts
>>        5182 =C2=B1  7%     -41.9%       3009 =C2=B1 15%  interrupts.CPU1=
75.NMI:Non-maskable_interrupts
>>        5182 =C2=B1  7%     -41.9%       3009 =C2=B1 15%  interrupts.CPU1=
75.PMI:Performance_monitoring_interrupts
>>       12955 =C2=B1 10%     -98.3%     220.00 =C2=B1  9%  interrupts.CPU1=
75.RES:Rescheduling_interrupts
>>        4507 =C2=B1 25%    +128.6%      10301 =C2=B1  2%  interrupts.CPU1=
76.CAL:Function_call_interrupts
>>        5591 =C2=B1 11%     -47.9%       2910 =C2=B1  7%  interrupts.CPU1=
76.NMI:Non-maskable_interrupts
>>        5591 =C2=B1 11%     -47.9%       2910 =C2=B1  7%  interrupts.CPU1=
76.PMI:Performance_monitoring_interrupts
>>       12622 =C2=B1  6%     -98.4%     206.00 =C2=B1  8%  interrupts.CPU1=
76.RES:Rescheduling_interrupts
>>        4142 =C2=B1 22%    +155.2%      10569 =C2=B1  5%  interrupts.CPU1=
77.CAL:Function_call_interrupts
>>        5247 =C2=B1 12%     -53.0%       2467 =C2=B1 25%  interrupts.CPU1=
77.NMI:Non-maskable_interrupts
>>        5247 =C2=B1 12%     -53.0%       2467 =C2=B1 25%  interrupts.CPU1=
77.PMI:Performance_monitoring_interrupts
>>       12928 =C2=B1  8%     -98.3%     215.50 =C2=B1  9%  interrupts.CPU1=
77.RES:Rescheduling_interrupts
>>        4240 =C2=B1 55%    +148.3%      10527 =C2=B1  7%  interrupts.CPU1=
78.CAL:Function_call_interrupts
>>        4969 =C2=B1 12%     -41.1%       2928 =C2=B1 30%  interrupts.CPU1=
78.NMI:Non-maskable_interrupts
>>        4969 =C2=B1 12%     -41.1%       2928 =C2=B1 30%  interrupts.CPU1=
78.PMI:Performance_monitoring_interrupts
>>       12137 =C2=B1  7%     -98.3%     212.00 =C2=B1 10%  interrupts.CPU1=
78.RES:Rescheduling_interrupts
>>        4851 =C2=B1 34%    +124.6%      10899 =C2=B1 10%  interrupts.CPU1=
79.CAL:Function_call_interrupts
>>        5044 =C2=B1 12%     -33.8%       3341 =C2=B1 18%  interrupts.CPU1=
79.NMI:Non-maskable_interrupts
>>        5044 =C2=B1 12%     -33.8%       3341 =C2=B1 18%  interrupts.CPU1=
79.PMI:Performance_monitoring_interrupts
>>       12741 =C2=B1 10%     -98.4%     207.83 =C2=B1 13%  interrupts.CPU1=
79.RES:Rescheduling_interrupts
>>        7397 =C2=B1 28%     +71.2%      12664 =C2=B1  6%  interrupts.CPU1=
8.CAL:Function_call_interrupts
>>       15737 =C2=B1  6%     -97.6%     372.17 =C2=B1  5%  interrupts.CPU1=
8.RES:Rescheduling_interrupts
>>        3960 =C2=B1 40%    +168.3%      10625 =C2=B1  5%  interrupts.CPU1=
80.CAL:Function_call_interrupts
>>        4894 =C2=B1 15%     -37.1%       3076 =C2=B1 20%  interrupts.CPU1=
80.NMI:Non-maskable_interrupts
>>        4894 =C2=B1 15%     -37.1%       3076 =C2=B1 20%  interrupts.CPU1=
80.PMI:Performance_monitoring_interrupts
>>       12189 =C2=B1  7%     -98.2%     217.33 =C2=B1  9%  interrupts.CPU1=
80.RES:Rescheduling_interrupts
>>        3184 =C2=B1 36%    +230.8%      10535 =C2=B1  5%  interrupts.CPU1=
81.CAL:Function_call_interrupts
>>        4991 =C2=B1  6%     -47.6%       2617 =C2=B1 24%  interrupts.CPU1=
81.NMI:Non-maskable_interrupts
>>        4991 =C2=B1  6%     -47.6%       2617 =C2=B1 24%  interrupts.CPU1=
81.PMI:Performance_monitoring_interrupts
>>       11432 =C2=B1  4%     -98.1%     216.50 =C2=B1  8%  interrupts.CPU1=
81.RES:Rescheduling_interrupts
>>        4380 =C2=B1 48%    +141.9%      10593 =C2=B1  9%  interrupts.CPU1=
82.CAL:Function_call_interrupts
>>        4574 =C2=B1 10%     -34.8%       2984 =C2=B1 13%  interrupts.CPU1=
82.NMI:Non-maskable_interrupts
>>        4574 =C2=B1 10%     -34.8%       2984 =C2=B1 13%  interrupts.CPU1=
82.PMI:Performance_monitoring_interrupts
>>       11149 =C2=B1  8%     -98.0%     221.50 =C2=B1  9%  interrupts.CPU1=
82.RES:Rescheduling_interrupts
>>        2863 =C2=B1 21%    +277.5%      10808 =C2=B1 10%  interrupts.CPU1=
83.CAL:Function_call_interrupts
>>       11355 =C2=B1  9%     -98.1%     214.83 =C2=B1  8%  interrupts.CPU1=
83.RES:Rescheduling_interrupts
>>        3650 =C2=B1 11%    +189.5%      10569 =C2=B1  5%  interrupts.CPU1=
84.CAL:Function_call_interrupts
>>        4565 =C2=B1 17%     -46.9%       2422 =C2=B1 34%  interrupts.CPU1=
84.NMI:Non-maskable_interrupts
>>        4565 =C2=B1 17%     -46.9%       2422 =C2=B1 34%  interrupts.CPU1=
84.PMI:Performance_monitoring_interrupts
>>       11385 =C2=B1  5%     -98.1%     213.67 =C2=B1 11%  interrupts.CPU1=
84.RES:Rescheduling_interrupts
>>        3438 =C2=B1 29%    +210.6%      10678 =C2=B1  5%  interrupts.CPU1=
85.CAL:Function_call_interrupts
>>        4909 =C2=B1 12%     -43.3%       2784 =C2=B1 31%  interrupts.CPU1=
85.NMI:Non-maskable_interrupts
>>        4909 =C2=B1 12%     -43.3%       2784 =C2=B1 31%  interrupts.CPU1=
85.PMI:Performance_monitoring_interrupts
>>       10774 =C2=B1  7%     -98.0%     220.00 =C2=B1 10%  interrupts.CPU1=
85.RES:Rescheduling_interrupts
>>        3189 =C2=B1 25%    +231.2%      10562 =C2=B1  5%  interrupts.CPU1=
86.CAL:Function_call_interrupts
>>        5067 =C2=B1 10%     -54.2%       2318 =C2=B1 35%  interrupts.CPU1=
86.NMI:Non-maskable_interrupts
>>        5067 =C2=B1 10%     -54.2%       2318 =C2=B1 35%  interrupts.CPU1=
86.PMI:Performance_monitoring_interrupts
>>       10820 =C2=B1  5%     -98.0%     219.67 =C2=B1  9%  interrupts.CPU1=
86.RES:Rescheduling_interrupts
>>        3755 =C2=B1 39%    +193.5%      11024 =C2=B1  6%  interrupts.CPU1=
87.CAL:Function_call_interrupts
>>        4966 =C2=B1 10%     -46.5%       2657 =C2=B1 17%  interrupts.CPU1=
87.NMI:Non-maskable_interrupts
>>        4966 =C2=B1 10%     -46.5%       2657 =C2=B1 17%  interrupts.CPU1=
87.PMI:Performance_monitoring_interrupts
>>       10738 =C2=B1  7%     -97.9%     220.83 =C2=B1  9%  interrupts.CPU1=
87.RES:Rescheduling_interrupts
>>        4581 =C2=B1 38%    +132.7%      10661 =C2=B1  5%  interrupts.CPU1=
88.CAL:Function_call_interrupts
>>        4688 =C2=B1 21%     -50.0%       2344 =C2=B1 42%  interrupts.CPU1=
88.NMI:Non-maskable_interrupts
>>        4688 =C2=B1 21%     -50.0%       2344 =C2=B1 42%  interrupts.CPU1=
88.PMI:Performance_monitoring_interrupts
>>       10311 =C2=B1  5%     -97.9%     217.33 =C2=B1  8%  interrupts.CPU1=
88.RES:Rescheduling_interrupts
>>        3414 =C2=B1 27%    +213.7%      10711 =C2=B1  6%  interrupts.CPU1=
89.CAL:Function_call_interrupts
>>       10423 =C2=B1  5%     -97.8%     225.17 =C2=B1 10%  interrupts.CPU1=
89.RES:Rescheduling_interrupts
>>        7370 =C2=B1 36%     +68.2%      12397 =C2=B1  5%  interrupts.CPU1=
9.CAL:Function_call_interrupts
>>        4663 =C2=B1 16%     -38.8%       2853 =C2=B1 24%  interrupts.CPU1=
9.NMI:Non-maskable_interrupts
>>        4663 =C2=B1 16%     -38.8%       2853 =C2=B1 24%  interrupts.CPU1=
9.PMI:Performance_monitoring_interrupts
>>       15096 =C2=B1  9%     -97.7%     354.67 =C2=B1  7%  interrupts.CPU1=
9.RES:Rescheduling_interrupts
>>        3269 =C2=B1 27%    +228.8%      10748 =C2=B1  7%  interrupts.CPU1=
90.CAL:Function_call_interrupts
>>        9950 =C2=B1  4%     -97.8%     222.17 =C2=B1 11%  interrupts.CPU1=
90.RES:Rescheduling_interrupts
>>        2868 =C2=B1 32%    +294.1%      11303 =C2=B1  8%  interrupts.CPU1=
91.CAL:Function_call_interrupts
>>        8701 =C2=B1  9%     -97.2%     244.50 =C2=B1  6%  interrupts.CPU1=
91.RES:Rescheduling_interrupts
>>        8884 =C2=B1 22%     +35.9%      12070 =C2=B1  7%  interrupts.CPU2=
.CAL:Function_call_interrupts
>>        4541 =C2=B1 21%     -47.1%       2403 =C2=B1 19%  interrupts.CPU2=
.NMI:Non-maskable_interrupts
>>        4541 =C2=B1 21%     -47.1%       2403 =C2=B1 19%  interrupts.CPU2=
.PMI:Performance_monitoring_interrupts
>>       12621 =C2=B1  5%     -97.7%     289.00 =C2=B1  4%  interrupts.CPU2=
.RES:Rescheduling_interrupts
>>        6739 =C2=B1 27%     +86.1%      12540 =C2=B1  7%  interrupts.CPU2=
0.CAL:Function_call_interrupts
>>       15539 =C2=B1  6%     -97.7%     351.00 =C2=B1  6%  interrupts.CPU2=
0.RES:Rescheduling_interrupts
>>        8176 =C2=B1 28%     +53.3%      12530 =C2=B1  8%  interrupts.CPU2=
1.CAL:Function_call_interrupts
>>       15814 =C2=B1  9%     -97.9%     326.50 =C2=B1  5%  interrupts.CPU2=
1.RES:Rescheduling_interrupts
>>        7268 =C2=B1 33%     +69.5%      12317 =C2=B1  7%  interrupts.CPU2=
2.CAL:Function_call_interrupts
>>       15429 =C2=B1  8%     -97.9%     323.67 =C2=B1  8%  interrupts.CPU2=
2.RES:Rescheduling_interrupts
>>       15907 =C2=B1  7%     -98.0%     316.67 =C2=B1  8%  interrupts.CPU2=
3.RES:Rescheduling_interrupts
>>        6256 =C2=B1 42%    +101.8%      12629 =C2=B1  4%  interrupts.CPU2=
4.CAL:Function_call_interrupts
>>       13346 =C2=B1  5%     -98.2%     242.50 =C2=B1  6%  interrupts.CPU2=
4.RES:Rescheduling_interrupts
>>       12397 =C2=B1  7%     -97.9%     264.17 =C2=B1  7%  interrupts.CPU2=
5.RES:Rescheduling_interrupts
>>        3942 =C2=B1 22%     -42.6%       2263 =C2=B1 39%  interrupts.CPU2=
6.NMI:Non-maskable_interrupts
>>        3942 =C2=B1 22%     -42.6%       2263 =C2=B1 39%  interrupts.CPU2=
6.PMI:Performance_monitoring_interrupts
>>       12450 =C2=B1  5%     -97.9%     261.17 =C2=B1  3%  interrupts.CPU2=
6.RES:Rescheduling_interrupts
>>        8027 =C2=B1 27%     +46.9%      11793 =C2=B1  5%  interrupts.CPU2=
7.CAL:Function_call_interrupts
>>       12743 =C2=B1  8%     -97.9%     264.00 =C2=B1  4%  interrupts.CPU2=
7.RES:Rescheduling_interrupts
>>       12376 =C2=B1  5%     -97.9%     263.00 =C2=B1  5%  interrupts.CPU2=
8.RES:Rescheduling_interrupts
>>       12483 =C2=B1  6%     -97.8%     269.00 =C2=B1  6%  interrupts.CPU2=
9.RES:Rescheduling_interrupts
>>       12733 =C2=B1  7%     -97.8%     282.17 =C2=B1  6%  interrupts.CPU3=
.RES:Rescheduling_interrupts
>>        7098 =C2=B1 23%     +67.8%      11908 =C2=B1  4%  interrupts.CPU3=
0.CAL:Function_call_interrupts
>>       12784 =C2=B1  8%     -97.8%     275.67 =C2=B1  2%  interrupts.CPU3=
0.RES:Rescheduling_interrupts
>>        4389 =C2=B1 34%    +175.2%      12078 =C2=B1  5%  interrupts.CPU3=
1.CAL:Function_call_interrupts
>>       13017 =C2=B1  6%     -97.8%     282.17 =C2=B1  4%  interrupts.CPU3=
1.RES:Rescheduling_interrupts
>>        6068 =C2=B1 28%     +97.7%      11996 =C2=B1  7%  interrupts.CPU3=
2.CAL:Function_call_interrupts
>>       12752 =C2=B1  9%     -97.8%     281.33 =C2=B1  5%  interrupts.CPU3=
2.RES:Rescheduling_interrupts
>>        6118 =C2=B1 15%     +97.6%      12088 =C2=B1  6%  interrupts.CPU3=
3.CAL:Function_call_interrupts
>>       12984 =C2=B1  6%     -97.9%     278.83 =C2=B1  6%  interrupts.CPU3=
3.RES:Rescheduling_interrupts
>>       13109 =C2=B1  8%     -97.8%     293.00 =C2=B1  4%  interrupts.CPU3=
4.RES:Rescheduling_interrupts
>>        5773 =C2=B1 24%    +113.0%      12298 =C2=B1  9%  interrupts.CPU3=
5.CAL:Function_call_interrupts
>>       14004 =C2=B1  6%     -98.0%     277.33 =C2=B1  7%  interrupts.CPU3=
5.RES:Rescheduling_interrupts
>>        5888 =C2=B1 26%    +106.9%      12182 =C2=B1  4%  interrupts.CPU3=
6.CAL:Function_call_interrupts
>>       14417 =C2=B1  8%     -98.0%     286.50 =C2=B1  8%  interrupts.CPU3=
6.RES:Rescheduling_interrupts
>>        6769 =C2=B1 48%     +76.5%      11946 =C2=B1  5%  interrupts.CPU3=
7.CAL:Function_call_interrupts
>>       13272 =C2=B1  8%     -97.9%     280.33 =C2=B1  4%  interrupts.CPU3=
7.RES:Rescheduling_interrupts
>>        6165 =C2=B1 39%     +93.5%      11933 =C2=B1  7%  interrupts.CPU3=
8.CAL:Function_call_interrupts
>>       13914 =C2=B1  5%     -97.9%     290.33 =C2=B1  6%  interrupts.CPU3=
8.RES:Rescheduling_interrupts
>>        6752 =C2=B1 31%     +76.9%      11945 =C2=B1  6%  interrupts.CPU3=
9.CAL:Function_call_interrupts
>>       13964 =C2=B1  9%     -97.8%     301.50 =C2=B1  4%  interrupts.CPU3=
9.RES:Rescheduling_interrupts
>>        6749 =C2=B1 19%     +78.6%      12051 =C2=B1  8%  interrupts.CPU4=
.CAL:Function_call_interrupts
>>        4612 =C2=B1 22%     -48.9%       2356 =C2=B1 16%  interrupts.CPU4=
.NMI:Non-maskable_interrupts
>>        4612 =C2=B1 22%     -48.9%       2356 =C2=B1 16%  interrupts.CPU4=
.PMI:Performance_monitoring_interrupts
>>       13024 =C2=B1  3%     -97.8%     291.50 =C2=B1  7%  interrupts.CPU4=
.RES:Rescheduling_interrupts
>>        6856 =C2=B1 38%     +78.1%      12209 =C2=B1  8%  interrupts.CPU4=
0.CAL:Function_call_interrupts
>>       13140 =C2=B1  5%     -97.8%     282.83 =C2=B1  7%  interrupts.CPU4=
0.RES:Rescheduling_interrupts
>>        4971 =C2=B1 42%    +146.4%      12247 =C2=B1  5%  interrupts.CPU4=
1.CAL:Function_call_interrupts
>>       13326 =C2=B1  9%     -97.9%     281.33 =C2=B1  7%  interrupts.CPU4=
1.RES:Rescheduling_interrupts
>>        5631 =C2=B1 48%    +118.5%      12304 =C2=B1  8%  interrupts.CPU4=
2.CAL:Function_call_interrupts
>>       14330 =C2=B1  5%     -98.0%     293.00 =C2=B1  5%  interrupts.CPU4=
2.RES:Rescheduling_interrupts
>>        5706 =C2=B1 37%    +112.7%      12140 =C2=B1  6%  interrupts.CPU4=
3.CAL:Function_call_interrupts
>>        5376 =C2=B1  6%     -45.0%       2955 =C2=B1  9%  interrupts.CPU4=
3.NMI:Non-maskable_interrupts
>>        5376 =C2=B1  6%     -45.0%       2955 =C2=B1  9%  interrupts.CPU4=
3.PMI:Performance_monitoring_interrupts
>>       13890 =C2=B1  8%     -97.8%     299.00 =C2=B1  8%  interrupts.CPU4=
3.RES:Rescheduling_interrupts
>>        5926 =C2=B1 22%    +103.6%      12066 =C2=B1  5%  interrupts.CPU4=
4.CAL:Function_call_interrupts
>>        5224 =C2=B1 12%     -41.8%       3043 =C2=B1 24%  interrupts.CPU4=
4.NMI:Non-maskable_interrupts
>>        5224 =C2=B1 12%     -41.8%       3043 =C2=B1 24%  interrupts.CPU4=
4.PMI:Performance_monitoring_interrupts
>>       13959 =C2=B1  4%     -97.9%     289.50 =C2=B1  5%  interrupts.CPU4=
4.RES:Rescheduling_interrupts
>>       13962 =C2=B1  7%     -97.9%     296.00 =C2=B1  3%  interrupts.CPU4=
5.RES:Rescheduling_interrupts
>>        6404 =C2=B1 18%     +88.9%      12095 =C2=B1  4%  interrupts.CPU4=
6.CAL:Function_call_interrupts
>>       14599 =C2=B1  5%     -98.0%     297.50 =C2=B1  6%  interrupts.CPU4=
6.RES:Rescheduling_interrupts
>>        5240 =C2=B1 51%    +137.1%      12425 =C2=B1  6%  interrupts.CPU4=
7.CAL:Function_call_interrupts
>>       14800 =C2=B1  6%     -98.0%     296.83 =C2=B1  6%  interrupts.CPU4=
7.RES:Rescheduling_interrupts
>>        6326 =C2=B1 40%     +81.6%      11488 =C2=B1 14%  interrupts.CPU4=
8.CAL:Function_call_interrupts
>>       13941 =C2=B1  9%     -98.1%     262.00 =C2=B1  8%  interrupts.CPU4=
8.RES:Rescheduling_interrupts
>>       13382 =C2=B1 13%     -98.0%     264.50 =C2=B1 10%  interrupts.CPU4=
9.RES:Rescheduling_interrupts
>>       13445 =C2=B1  7%     -97.9%     280.67 =C2=B1  7%  interrupts.CPU5=
.RES:Rescheduling_interrupts
>>        6046 =C2=B1 27%     +92.2%      11619 =C2=B1  9%  interrupts.CPU5=
0.CAL:Function_call_interrupts
>>       12493 =C2=B1 10%     -98.0%     254.83 =C2=B1  5%  interrupts.CPU5=
0.RES:Rescheduling_interrupts
>>        6465 =C2=B1 16%     +81.1%      11710 =C2=B1  6%  interrupts.CPU5=
1.CAL:Function_call_interrupts
>>       12632 =C2=B1 15%     -97.9%     270.33 =C2=B1  8%  interrupts.CPU5=
1.RES:Rescheduling_interrupts
>>        6012 =C2=B1 40%     +95.7%      11768 =C2=B1  5%  interrupts.CPU5=
2.CAL:Function_call_interrupts
>>        4710 =C2=B1 14%     -40.3%       2813 =C2=B1 30%  interrupts.CPU5=
2.NMI:Non-maskable_interrupts
>>        4710 =C2=B1 14%     -40.3%       2813 =C2=B1 30%  interrupts.CPU5=
2.PMI:Performance_monitoring_interrupts
>>       12009 =C2=B1 13%     -97.7%     275.50 =C2=B1  6%  interrupts.CPU5=
2.RES:Rescheduling_interrupts
>>        4800 =C2=B1 13%     -41.5%       2809 =C2=B1 24%  interrupts.CPU5=
3.NMI:Non-maskable_interrupts
>>        4800 =C2=B1 13%     -41.5%       2809 =C2=B1 24%  interrupts.CPU5=
3.PMI:Performance_monitoring_interrupts
>>       12540 =C2=B1 12%     -97.9%     266.83 =C2=B1  6%  interrupts.CPU5=
3.RES:Rescheduling_interrupts
>>        6785 =C2=B1 26%     +71.2%      11618 =C2=B1  5%  interrupts.CPU5=
4.CAL:Function_call_interrupts
>>        5194 =C2=B1 12%     -40.1%       3111 =C2=B1  9%  interrupts.CPU5=
4.NMI:Non-maskable_interrupts
>>        5194 =C2=B1 12%     -40.1%       3111 =C2=B1  9%  interrupts.CPU5=
4.PMI:Performance_monitoring_interrupts
>>       12964 =C2=B1 12%     -98.0%     265.17 =C2=B1  4%  interrupts.CPU5=
4.RES:Rescheduling_interrupts
>>        4948 =C2=B1 25%    +132.1%      11483 =C2=B1  8%  interrupts.CPU5=
5.CAL:Function_call_interrupts
>>        5166 =C2=B1  7%     -42.4%       2978 =C2=B1 10%  interrupts.CPU5=
5.NMI:Non-maskable_interrupts
>>        5166 =C2=B1  7%     -42.4%       2978 =C2=B1 10%  interrupts.CPU5=
5.PMI:Performance_monitoring_interrupts
>>       13610 =C2=B1 11%     -98.0%     275.00 =C2=B1  4%  interrupts.CPU5=
5.RES:Rescheduling_interrupts
>>        5062 =C2=B1 12%     -43.5%       2862 =C2=B1  5%  interrupts.CPU5=
6.NMI:Non-maskable_interrupts
>>        5062 =C2=B1 12%     -43.5%       2862 =C2=B1  5%  interrupts.CPU5=
6.PMI:Performance_monitoring_interrupts
>>       13249 =C2=B1  8%     -97.9%     276.83 =C2=B1  4%  interrupts.CPU5=
6.RES:Rescheduling_interrupts
>>        5607 =C2=B1 35%    +111.4%      11852 =C2=B1  4%  interrupts.CPU5=
7.CAL:Function_call_interrupts
>>       12827 =C2=B1  9%     -97.7%     288.67 =C2=B1  5%  interrupts.CPU5=
7.RES:Rescheduling_interrupts
>>        4795 =C2=B1 30%    +139.7%      11495 =C2=B1  4%  interrupts.CPU5=
8.CAL:Function_call_interrupts
>>       12880 =C2=B1  7%     -97.8%     278.83 =C2=B1  5%  interrupts.CPU5=
8.RES:Rescheduling_interrupts
>>        4826 =C2=B1 12%     -36.0%       3087 =C2=B1 12%  interrupts.CPU5=
9.NMI:Non-maskable_interrupts
>>        4826 =C2=B1 12%     -36.0%       3087 =C2=B1 12%  interrupts.CPU5=
9.PMI:Performance_monitoring_interrupts
>>       13111 =C2=B1  8%     -97.9%     278.67 =C2=B1  5%  interrupts.CPU5=
9.RES:Rescheduling_interrupts
>>        6095 =C2=B1 26%     +98.9%      12125 =C2=B1  8%  interrupts.CPU6=
.CAL:Function_call_interrupts
>>       13577 =C2=B1  6%     -97.9%     286.33 =C2=B1  5%  interrupts.CPU6=
.RES:Rescheduling_interrupts
>>        5275 =C2=B1 49%    +119.3%      11570 =C2=B1  5%  interrupts.CPU6=
0.CAL:Function_call_interrupts
>>        5053 =C2=B1 12%     -41.1%       2976 =C2=B1 24%  interrupts.CPU6=
0.NMI:Non-maskable_interrupts
>>        5053 =C2=B1 12%     -41.1%       2976 =C2=B1 24%  interrupts.CPU6=
0.PMI:Performance_monitoring_interrupts
>>       13307 =C2=B1 20%     -97.9%     284.17 =C2=B1  3%  interrupts.CPU6=
0.RES:Rescheduling_interrupts
>>        6288 =C2=B1 38%     +87.8%      11812 =C2=B1  6%  interrupts.CPU6=
1.CAL:Function_call_interrupts
>>       13839 =C2=B1  6%     -97.9%     288.17 =C2=B1  3%  interrupts.CPU6=
1.RES:Rescheduling_interrupts
>>        5976 =C2=B1 41%     +95.9%      11707 =C2=B1  6%  interrupts.CPU6=
2.CAL:Function_call_interrupts
>>       13270 =C2=B1  6%     -97.8%     286.83 =C2=B1  7%  interrupts.CPU6=
2.RES:Rescheduling_interrupts
>>        6101 =C2=B1 22%     +87.0%      11409 =C2=B1 11%  interrupts.CPU6=
3.CAL:Function_call_interrupts
>>       13694 =C2=B1 10%     -97.9%     287.17 =C2=B1  7%  interrupts.CPU6=
3.RES:Rescheduling_interrupts
>>       13598 =C2=B1  7%     -97.9%     281.17 =C2=B1  5%  interrupts.CPU6=
4.RES:Rescheduling_interrupts
>>        5703 =C2=B1 42%    +108.0%      11865 =C2=B1  8%  interrupts.CPU6=
5.CAL:Function_call_interrupts
>>        5282 =C2=B1  8%     -47.4%       2779 =C2=B1 25%  interrupts.CPU6=
5.NMI:Non-maskable_interrupts
>>        5282 =C2=B1  8%     -47.4%       2779 =C2=B1 25%  interrupts.CPU6=
5.PMI:Performance_monitoring_interrupts
>>       13807 =C2=B1 10%     -97.9%     283.33 =C2=B1  6%  interrupts.CPU6=
5.RES:Rescheduling_interrupts
>>        6019 =C2=B1 40%     +97.3%      11877 =C2=B1  7%  interrupts.CPU6=
6.CAL:Function_call_interrupts
>>        5171 =C2=B1  8%     -42.1%       2994 =C2=B1 25%  interrupts.CPU6=
6.NMI:Non-maskable_interrupts
>>        5171 =C2=B1  8%     -42.1%       2994 =C2=B1 25%  interrupts.CPU6=
6.PMI:Performance_monitoring_interrupts
>>       13553 =C2=B1 11%     -97.9%     284.67 =C2=B1  5%  interrupts.CPU6=
6.RES:Rescheduling_interrupts
>>        5195 =C2=B1  8%     -39.0%       3170 =C2=B1 18%  interrupts.CPU6=
7.NMI:Non-maskable_interrupts
>>        5195 =C2=B1  8%     -39.0%       3170 =C2=B1 18%  interrupts.CPU6=
7.PMI:Performance_monitoring_interrupts
>>       14174 =C2=B1  9%     -98.0%     289.67 =C2=B1  8%  interrupts.CPU6=
7.RES:Rescheduling_interrupts
>>        4957 =C2=B1 11%     -40.3%       2958 =C2=B1 26%  interrupts.CPU6=
8.NMI:Non-maskable_interrupts
>>        4957 =C2=B1 11%     -40.3%       2958 =C2=B1 26%  interrupts.CPU6=
8.PMI:Performance_monitoring_interrupts
>>       14226 =C2=B1 13%     -98.0%     289.17 =C2=B1  3%  interrupts.CPU6=
8.RES:Rescheduling_interrupts
>>        4802 =C2=B1 34%    +147.0%      11861 =C2=B1  7%  interrupts.CPU6=
9.CAL:Function_call_interrupts
>>        5249 =C2=B1 10%     -45.0%       2890 =C2=B1 26%  interrupts.CPU6=
9.NMI:Non-maskable_interrupts
>>        5249 =C2=B1 10%     -45.0%       2890 =C2=B1 26%  interrupts.CPU6=
9.PMI:Performance_monitoring_interrupts
>>       13655 =C2=B1  8%     -97.8%     302.17 =C2=B1  5%  interrupts.CPU6=
9.RES:Rescheduling_interrupts
>>        6223 =C2=B1 41%     +94.3%      12095 =C2=B1  8%  interrupts.CPU7=
.CAL:Function_call_interrupts
>>       13145 =C2=B1  7%     -97.7%     300.50 =C2=B1  4%  interrupts.CPU7=
.RES:Rescheduling_interrupts
>>        5612 =C2=B1 42%    +111.6%      11877 =C2=B1  8%  interrupts.CPU7=
0.CAL:Function_call_interrupts
>>       14319 =C2=B1  9%     -98.0%     285.17 =C2=B1  4%  interrupts.CPU7=
0.RES:Rescheduling_interrupts
>>        4830 =C2=B1 31%    +149.2%      12038 =C2=B1  6%  interrupts.CPU7=
1.CAL:Function_call_interrupts
>>        4897 =C2=B1  8%     -44.9%       2698 =C2=B1 31%  interrupts.CPU7=
1.NMI:Non-maskable_interrupts
>>        4897 =C2=B1  8%     -44.9%       2698 =C2=B1 31%  interrupts.CPU7=
1.PMI:Performance_monitoring_interrupts
>>       13938 =C2=B1 13%     -97.9%     288.33 =C2=B1  5%  interrupts.CPU7=
1.RES:Rescheduling_interrupts
>>        5319 =C2=B1 25%    +118.5%      11621 =C2=B1  4%  interrupts.CPU7=
2.CAL:Function_call_interrupts
>>        4791 =C2=B1  9%     -43.5%       2706 =C2=B1 23%  interrupts.CPU7=
2.NMI:Non-maskable_interrupts
>>        4791 =C2=B1  9%     -43.5%       2706 =C2=B1 23%  interrupts.CPU7=
2.PMI:Performance_monitoring_interrupts
>>       12941 =C2=B1  6%     -97.7%     294.50 =C2=B1  8%  interrupts.CPU7=
2.RES:Rescheduling_interrupts
>>       12559 =C2=B1  6%     -97.8%     270.50 =C2=B1  6%  interrupts.CPU7=
3.RES:Rescheduling_interrupts
>>        4760 =C2=B1 23%     -48.0%       2474 =C2=B1 19%  interrupts.CPU7=
4.NMI:Non-maskable_interrupts
>>        4760 =C2=B1 23%     -48.0%       2474 =C2=B1 19%  interrupts.CPU7=
4.PMI:Performance_monitoring_interrupts
>>       13056 =C2=B1  7%     -97.9%     279.00 =C2=B1  8%  interrupts.CPU7=
4.RES:Rescheduling_interrupts
>>        6681 =C2=B1 35%     +71.1%      11435 =C2=B1  7%  interrupts.CPU7=
5.CAL:Function_call_interrupts
>>       12140 =C2=B1  6%     -97.8%     269.83 =C2=B1  6%  interrupts.CPU7=
5.RES:Rescheduling_interrupts
>>        5478 =C2=B1 40%    +107.7%      11380 =C2=B1 10%  interrupts.CPU7=
6.CAL:Function_call_interrupts
>>       12287 =C2=B1  7%     -97.8%     274.50 =C2=B1  8%  interrupts.CPU7=
6.RES:Rescheduling_interrupts
>>        6466 =C2=B1 19%     +76.6%      11417 =C2=B1  8%  interrupts.CPU7=
7.CAL:Function_call_interrupts
>>       12545 =C2=B1  6%     -97.8%     277.17 =C2=B1  4%  interrupts.CPU7=
7.RES:Rescheduling_interrupts
>>        6260 =C2=B1 34%     +86.7%      11687 =C2=B1  7%  interrupts.CPU7=
8.CAL:Function_call_interrupts
>>       12776 =C2=B1  6%     -97.9%     274.17 =C2=B1  6%  interrupts.CPU7=
8.RES:Rescheduling_interrupts
>>        6153 =C2=B1 39%     +87.0%      11508 =C2=B1  5%  interrupts.CPU7=
9.CAL:Function_call_interrupts
>>       12726 =C2=B1  5%     -97.8%     274.50 =C2=B1  5%  interrupts.CPU7=
9.RES:Rescheduling_interrupts
>>       13879 =C2=B1  7%     -97.9%     296.50 =C2=B1  6%  interrupts.CPU8=
.RES:Rescheduling_interrupts
>>        6421 =C2=B1 18%     +89.6%      12176 =C2=B1 17%  interrupts.CPU8=
0.CAL:Function_call_interrupts
>>       12908 =C2=B1  7%     -97.9%     271.33 =C2=B1  8%  interrupts.CPU8=
0.RES:Rescheduling_interrupts
>>        6573 =C2=B1 21%     +74.4%      11465 =C2=B1  5%  interrupts.CPU8=
1.CAL:Function_call_interrupts
>>       12539 =C2=B1  7%     -97.7%     286.67 =C2=B1  4%  interrupts.CPU8=
1.RES:Rescheduling_interrupts
>>        5439 =C2=B1 41%    +112.7%      11570 =C2=B1  8%  interrupts.CPU8=
2.CAL:Function_call_interrupts
>>       13207 =C2=B1  6%     -97.9%     278.33 =C2=B1  8%  interrupts.CPU8=
2.RES:Rescheduling_interrupts
>>        5567 =C2=B1 17%    +109.0%      11638 =C2=B1  6%  interrupts.CPU8=
3.CAL:Function_call_interrupts
>>       13569 =C2=B1  6%     -97.9%     287.50 =C2=B1  5%  interrupts.CPU8=
3.RES:Rescheduling_interrupts
>>        5949 =C2=B1 35%     +94.4%      11566 =C2=B1  5%  interrupts.CPU8=
4.CAL:Function_call_interrupts
>>       13345 =C2=B1  3%     -97.8%     298.17 =C2=B1  8%  interrupts.CPU8=
4.RES:Rescheduling_interrupts
>>        5189 =C2=B1 35%    +123.1%      11577 =C2=B1  7%  interrupts.CPU8=
5.CAL:Function_call_interrupts
>>        5030 =C2=B1  7%     -56.2%       2203 =C2=B1 34%  interrupts.CPU8=
5.NMI:Non-maskable_interrupts
>>        5030 =C2=B1  7%     -56.2%       2203 =C2=B1 34%  interrupts.CPU8=
5.PMI:Performance_monitoring_interrupts
>>       14240 =C2=B1  8%     -98.1%     273.50 =C2=B1  6%  interrupts.CPU8=
5.RES:Rescheduling_interrupts
>>        5293 =C2=B1 48%    +119.5%      11617 =C2=B1 10%  interrupts.CPU8=
6.CAL:Function_call_interrupts
>>        5032 =C2=B1 12%     -44.7%       2782 =C2=B1 22%  interrupts.CPU8=
6.NMI:Non-maskable_interrupts
>>        5032 =C2=B1 12%     -44.7%       2782 =C2=B1 22%  interrupts.CPU8=
6.PMI:Performance_monitoring_interrupts
>>       13424           -97.9%     282.00 =C2=B1  6%  interrupts.CPU86.RES=
:Rescheduling_interrupts
>>        5020 =C2=B1 44%    +128.0%      11446 =C2=B1  6%  interrupts.CPU8=
7.CAL:Function_call_interrupts
>>       13634 =C2=B1  5%     -98.0%     279.50 =C2=B1  7%  interrupts.CPU8=
7.RES:Rescheduling_interrupts
>>        5626 =C2=B1 31%    +103.8%      11468 =C2=B1  5%  interrupts.CPU8=
8.CAL:Function_call_interrupts
>>        3970 =C2=B1 23%     -47.2%       2096 =C2=B1 20%  interrupts.CPU8=
8.NMI:Non-maskable_interrupts
>>        3970 =C2=B1 23%     -47.2%       2096 =C2=B1 20%  interrupts.CPU8=
8.PMI:Performance_monitoring_interrupts
>>       14193 =C2=B1  7%     -97.9%     291.17 =C2=B1  2%  interrupts.CPU8=
8.RES:Rescheduling_interrupts
>>       13875 =C2=B1  8%     -98.0%     282.33 =C2=B1  5%  interrupts.CPU8=
9.RES:Rescheduling_interrupts
>>        5939 =C2=B1 19%    +104.2%      12126 =C2=B1  5%  interrupts.CPU9=
.CAL:Function_call_interrupts
>>       13628 =C2=B1  9%     -97.8%     302.17 =C2=B1  5%  interrupts.CPU9=
.RES:Rescheduling_interrupts
>>       13985 =C2=B1  9%     -97.9%     294.50 =C2=B1  5%  interrupts.CPU9=
0.RES:Rescheduling_interrupts
>>        4776 =C2=B1 16%     -43.2%       2713 =C2=B1 23%  interrupts.CPU9=
1.NMI:Non-maskable_interrupts
>>        4776 =C2=B1 16%     -43.2%       2713 =C2=B1 23%  interrupts.CPU9=
1.PMI:Performance_monitoring_interrupts
>>       13539 =C2=B1  7%     -97.9%     281.67 =C2=B1  8%  interrupts.CPU9=
1.RES:Rescheduling_interrupts
>>        5352 =C2=B1 30%    +119.4%      11742 =C2=B1  8%  interrupts.CPU9=
2.CAL:Function_call_interrupts
>>        5296 =C2=B1 15%     -46.9%       2814 =C2=B1 25%  interrupts.CPU9=
2.NMI:Non-maskable_interrupts
>>        5296 =C2=B1 15%     -46.9%       2814 =C2=B1 25%  interrupts.CPU9=
2.PMI:Performance_monitoring_interrupts
>>       14548 =C2=B1  8%     -98.0%     286.50 =C2=B1  5%  interrupts.CPU9=
2.RES:Rescheduling_interrupts
>>        5726 =C2=B1 45%    +106.3%      11815 =C2=B1  8%  interrupts.CPU9=
3.CAL:Function_call_interrupts
>>        5441 =C2=B1 10%     -51.2%       2655 =C2=B1 34%  interrupts.CPU9=
3.NMI:Non-maskable_interrupts
>>        5441 =C2=B1 10%     -51.2%       2655 =C2=B1 34%  interrupts.CPU9=
3.PMI:Performance_monitoring_interrupts
>>       13368 =C2=B1  5%     -97.9%     286.67 =C2=B1  5%  interrupts.CPU9=
3.RES:Rescheduling_interrupts
>>        5171 =C2=B1  8%     -45.6%       2811 =C2=B1 34%  interrupts.CPU9=
4.NMI:Non-maskable_interrupts
>>        5171 =C2=B1  8%     -45.6%       2811 =C2=B1 34%  interrupts.CPU9=
4.PMI:Performance_monitoring_interrupts
>>       14512 =C2=B1  5%     -97.9%     302.67 =C2=B1  4%  interrupts.CPU9=
4.RES:Rescheduling_interrupts
>>        4059 =C2=B1 47%    +195.1%      11981 =C2=B1  7%  interrupts.CPU9=
5.CAL:Function_call_interrupts
>>        4784 =C2=B1  4%     -47.2%       2525 =C2=B1 25%  interrupts.CPU9=
5.NMI:Non-maskable_interrupts
>>        4784 =C2=B1  4%     -47.2%       2525 =C2=B1 25%  interrupts.CPU9=
5.PMI:Performance_monitoring_interrupts
>>       13780 =C2=B1  7%     -97.9%     294.17 =C2=B1  7%  interrupts.CPU9=
5.RES:Rescheduling_interrupts
>>       18135 =C2=B1  8%     -98.6%     248.00 =C2=B1  9%  interrupts.CPU9=
6.RES:Rescheduling_interrupts
>>        5769 =C2=B1 31%     +87.4%      10812 =C2=B1 14%  interrupts.CPU9=
7.CAL:Function_call_interrupts
>>        4654 =C2=B1 19%     -49.5%       2352 =C2=B1 44%  interrupts.CPU9=
7.NMI:Non-maskable_interrupts
>>        4654 =C2=B1 19%     -49.5%       2352 =C2=B1 44%  interrupts.CPU9=
7.PMI:Performance_monitoring_interrupts
>>       15791 =C2=B1  5%     -98.4%     253.67 =C2=B1  8%  interrupts.CPU9=
7.RES:Rescheduling_interrupts
>>        5596 =C2=B1 18%    +100.7%      11232 =C2=B1  8%  interrupts.CPU9=
8.CAL:Function_call_interrupts
>>        4822 =C2=B1 17%     -53.3%       2253 =C2=B1 47%  interrupts.CPU9=
8.NMI:Non-maskable_interrupts
>>        4822 =C2=B1 17%     -53.3%       2253 =C2=B1 47%  interrupts.CPU9=
8.PMI:Performance_monitoring_interrupts
>>       16409 =C2=B1  6%     -98.5%     246.00 =C2=B1  9%  interrupts.CPU9=
8.RES:Rescheduling_interrupts
>>       15212 =C2=B1  7%     -98.3%     254.50 =C2=B1  8%  interrupts.CPU9=
9.RES:Rescheduling_interrupts
>>      898888 =C2=B1  8%     -38.6%     551599 =C2=B1  7%  interrupts.NMI:=
Non-maskable_interrupts
>>      898888 =C2=B1  8%     -38.6%     551599 =C2=B1  7%  interrupts.PMI:=
Performance_monitoring_interrupts
>>     2531134 =C2=B1  4%     -98.0%      49852 =C2=B1  3%  interrupts.RES:=
Rescheduling_interrupts
>>
>>
>>
>> ************************************************************************=
***************************
>> lkp-csl-2ap3: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz w=
ith 192G memory
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/s=
end_size/tbox_group/test/testcase/ucode:
>>    cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/50%/debian-10.4-x=
86_64-20200603.cgz/300s/10K/lkp-csl-2ap3/SCTP_STREAM_MANY/netperf/0x5003006
>>
>> commit:
>>    05091b2b63 ("mm: soft_dirty: fail CLEAR_REFS_SOFT_DIRTY if not built =
into the kernel")
>>    80cb403876 ("sched/fair: skip select_idle_sibling() in presence of sy=
nc wakeups")
>>
>> 05091b2b63b3cf12 80cb403876fc973389d6ea100a3
>> ---------------- ---------------------------
>>         fail:runs  %reproduction    fail:runs
>>             |             |             |
>>             :3          200%           6:6     stderr.[perf_record:Captu=
red_and_wrote#MB/tmp/lkp/perf-sched.data(#samples)]
>>           %stddev     %change         %stddev
>>               \          |                \
>>        3465           -68.3%       1099 =C2=B1  9%  netperf.Throughput_M=
bps
>>      332659           -68.3%     105556 =C2=B1  9%  netperf.Throughput_t=
otal_Mbps
>>       74215        +72007.3%   53514680 =C2=B1  9%  netperf.time.involun=
tary_context_switches
>>       30758            +3.0%      31674        netperf.time.minor_page_f=
aults
>>        8942           -95.8%     376.17 =C2=B1 11%  netperf.time.percent=
_of_cpu_this_job_got
>>       26809           -95.9%       1107 =C2=B1 11%  netperf.time.system_=
time
>>      139.61 =C2=B1  3%     -81.1%      26.42 =C2=B1  9%  netperf.time.us=
er_time
>>        3922 =C2=B1 12%   +9339.7%     370286 =C2=B1 11%  netperf.time.vo=
luntary_context_switches
>>   1.218e+09           -68.3%  3.866e+08 =C2=B1  9%  netperf.workload
>>       29979          +104.9%      61419        uptime.idle
>>   1.929e+09 =C2=B1  7%     -85.4%  2.808e+08 =C2=B1218%  cpuidle.C1.time
>>    57749397 =C2=B1  3%     -85.7%    8248310 =C2=B1217%  cpuidle.C1.usage
>>   3.341e+08           -73.1%   89819528 =C2=B1 45%  cpuidle.C1E.usage
>>       55.61 =C2=B1 11%     +39.9       95.50        mpstat.cpu.all.idle%
>>        0.59 =C2=B1 16%      +0.2        0.82 =C2=B1  6%  mpstat.cpu.all.=
irq%
>>        2.01 =C2=B1 14%      -1.5        0.55 =C2=B1  7%  mpstat.cpu.all.=
soft%
>>       41.14 =C2=B1 14%     -38.2        2.98 =C2=B1 11%  mpstat.cpu.all.=
sys%
>>        0.66 =C2=B1  5%      -0.5        0.15 =C2=B1  8%  mpstat.cpu.all.=
usr%
>>       40.67          +133.2%      94.83        vmstat.cpu.id
>>       58.00           -92.8%       4.17 =C2=B1  8%  vmstat.cpu.sy
>>     6710900           -71.5%    1912498 =C2=B1  4%  vmstat.memory.cache
>>      113.33           -90.7%      10.50 =C2=B1 10%  vmstat.procs.r
>>     2291838           -84.0%     367097 =C2=B1  9%  vmstat.system.cs
>>      395561            -2.6%     385448        vmstat.system.in
>>   3.931e+08           -67.5%  1.276e+08 =C2=B1  9%  numa-numastat.node0.=
local_node
>>   3.932e+08           -67.5%  1.277e+08 =C2=B1  9%  numa-numastat.node0.=
numa_hit
>>   3.967e+08           -69.1%  1.224e+08 =C2=B1  9%  numa-numastat.node1.=
local_node
>>   3.968e+08           -69.1%  1.224e+08 =C2=B1  9%  numa-numastat.node1.=
numa_hit
>>    3.91e+08           -68.7%  1.224e+08 =C2=B1 10%  numa-numastat.node2.=
local_node
>>   3.911e+08           -68.7%  1.225e+08 =C2=B1 10%  numa-numastat.node2.=
numa_hit
>>     3.9e+08           -67.7%   1.26e+08 =C2=B1  8%  numa-numastat.node3.=
local_node
>>   3.901e+08           -67.7%  1.261e+08 =C2=B1  8%  numa-numastat.node3.=
numa_hit
>>     2468634 =C2=B1 10%     -69.8%     745569 =C2=B1  9%  meminfo.Active
>>     2468634 =C2=B1 10%     -69.8%     745569 =C2=B1  9%  meminfo.Active(=
anon)
>>     6560244           -72.8%    1785042 =C2=B1  4%  meminfo.Cached
>>     6107215           -78.7%    1299967 =C2=B1  5%  meminfo.Committed_AS
>>     3490949 =C2=B1  7%     -88.2%     411914        meminfo.Inactive
>>     3490949 =C2=B1  7%     -88.2%     411914        meminfo.Inactive(ano=
n)
>>      137767            -9.6%     124480        meminfo.KReclaimable
>>     2263834 =C2=B1 10%     -96.6%      77564 =C2=B1  6%  meminfo.Mapped
>>     9229487           -55.5%    4111088        meminfo.Memused
>>       16075 =C2=B1  3%     -27.0%      11740        meminfo.PageTables
>>      137767            -9.6%     124480        meminfo.SReclaimable
>>     5590619           -85.4%     815418 =C2=B1  9%  meminfo.Shmem
>>     9578252           -49.4%    4843280        meminfo.max_used_kB
>>       89377 =C2=B1  2%     -78.7%      19064 =C2=B1 14%  numa-meminfo.no=
de0.Mapped
>>        6606 =C2=B1 17%     -63.3%       2422 =C2=B1 17%  numa-meminfo.no=
de0.PageTables
>>      367002 =C2=B1107%     -96.3%      13609 =C2=B1  4%  numa-meminfo.no=
de1.Mapped
>>     1566505 =C2=B1 71%     -96.1%      61412 =C2=B1215%  numa-meminfo.no=
de2.Active
>>     1566505 =C2=B1 71%     -96.1%      61412 =C2=B1215%  numa-meminfo.no=
de2.Active(anon)
>>      114502 =C2=B1 26%     -76.7%      26642 =C2=B1 80%  numa-meminfo.no=
de2.AnonHugePages
>>      172988 =C2=B1 13%     -66.6%      57740 =C2=B1 49%  numa-meminfo.no=
de2.AnonPages
>>     3488970 =C2=B1 65%     -91.0%     313662 =C2=B1 42%  numa-meminfo.no=
de2.FilePages
>>     1830313 =C2=B1 63%     -96.4%      66046 =C2=B1 35%  numa-meminfo.no=
de2.Inactive
>>     1830313 =C2=B1 63%     -96.4%      66046 =C2=B1 35%  numa-meminfo.no=
de2.Inactive(anon)
>>     1145528 =C2=B1 68%     -98.5%      17223 =C2=B1 16%  numa-meminfo.no=
de2.Mapped
>>     4238823 =C2=B1 54%     -79.9%     852429 =C2=B1 12%  numa-meminfo.no=
de2.MemUsed
>>     3223967 =C2=B1 71%     -97.8%      69932 =C2=B1196%  numa-meminfo.no=
de2.Shmem
>>      273841 =C2=B1 50%    +145.1%     671086 =C2=B1 26%  numa-meminfo.no=
de3.Active
>>      273841 =C2=B1 50%    +145.1%     671086 =C2=B1 26%  numa-meminfo.no=
de3.Active(anon)
>>       67862 =C2=B1 77%     +67.4%     113603 =C2=B1 42%  numa-meminfo.no=
de3.AnonPages
>>      652683 =C2=B1 60%     -95.2%      31495 =C2=B1 19%  numa-meminfo.no=
de3.Mapped
>>       22442 =C2=B1  2%     -78.8%       4767 =C2=B1 14%  numa-vmstat.nod=
e0.nr_mapped
>>        1654 =C2=B1 17%     -63.4%     605.67 =C2=B1 16%  numa-vmstat.nod=
e0.nr_page_table_pages
>>    1.96e+08           -67.1%   64413544 =C2=B1 10%  numa-vmstat.node0.nu=
ma_hit
>>   1.959e+08           -67.2%   64312152 =C2=B1 10%  numa-vmstat.node0.nu=
ma_local
>>       92323 =C2=B1107%     -96.3%       3402 =C2=B1  4%  numa-vmstat.nod=
e1.nr_mapped
>>    1.98e+08           -67.9%   63535084 =C2=B1  9%  numa-vmstat.node1.nu=
ma_hit
>>   1.979e+08           -68.0%   63407511 =C2=B1  9%  numa-vmstat.node1.nu=
ma_local
>>      392482 =C2=B1 71%     -96.1%      15398 =C2=B1215%  numa-vmstat.nod=
e2.nr_active_anon
>>       43146 =C2=B1 13%     -66.7%      14376 =C2=B1 49%  numa-vmstat.nod=
e2.nr_anon_pages
>>      873989 =C2=B1 65%     -91.0%      78446 =C2=B1 42%  numa-vmstat.nod=
e2.nr_file_pages
>>      458378 =C2=B1 63%     -96.4%      16440 =C2=B1 36%  numa-vmstat.nod=
e2.nr_inactive_anon
>>      288815 =C2=B1 68%     -98.5%       4279 =C2=B1 16%  numa-vmstat.nod=
e2.nr_mapped
>>      807738 =C2=B1 71%     -97.8%      17513 =C2=B1196%  numa-vmstat.nod=
e2.nr_shmem
>>      392482 =C2=B1 71%     -96.1%      15398 =C2=B1215%  numa-vmstat.nod=
e2.nr_zone_active_anon
>>      458378 =C2=B1 63%     -96.4%      16440 =C2=B1 36%  numa-vmstat.nod=
e2.nr_zone_inactive_anon
>>   1.951e+08           -68.7%   60993091 =C2=B1  9%  numa-vmstat.node2.nu=
ma_hit
>>   1.949e+08           -68.8%   60852563 =C2=B1  9%  numa-vmstat.node2.nu=
ma_local
>>       68591 =C2=B1 50%    +145.0%     168063 =C2=B1 26%  numa-vmstat.nod=
e3.nr_active_anon
>>       16870 =C2=B1 78%     +67.9%      28321 =C2=B1 42%  numa-vmstat.nod=
e3.nr_anon_pages
>>      163477 =C2=B1 60%     -95.3%       7764 =C2=B1 19%  numa-vmstat.nod=
e3.nr_mapped
>>       68591 =C2=B1 50%    +145.0%     168063 =C2=B1 26%  numa-vmstat.nod=
e3.nr_zone_active_anon
>>   1.945e+08           -67.1%   63905780 =C2=B1  9%  numa-vmstat.node3.nu=
ma_hit
>>   1.944e+08           -67.2%   63761928 =C2=B1  9%  numa-vmstat.node3.nu=
ma_local
>>      615372 =C2=B1 10%     -69.8%     185617 =C2=B1 10%  proc-vmstat.nr_=
active_anon
>>       92190            -7.0%      85771        proc-vmstat.nr_anon_pages
>>     4687387            +2.7%    4814727        proc-vmstat.nr_dirty_back=
ground_threshold
>>     9386235            +2.7%    9641228        proc-vmstat.nr_dirty_thre=
shold
>>     1635837           -72.7%     445923 =C2=B1  4%  proc-vmstat.nr_file_=
pages
>>    47125404            +2.7%   48400722        proc-vmstat.nr_free_pages
>>      870340 =C2=B1  7%     -88.1%     103477        proc-vmstat.nr_inact=
ive_anon
>>      561249 =C2=B1 10%     -96.4%      20226 =C2=B1  6%  proc-vmstat.nr_=
mapped
>>        4018 =C2=B1  3%     -27.1%       2931        proc-vmstat.nr_page_=
table_pages
>>     1393431           -85.4%     203517 =C2=B1  9%  proc-vmstat.nr_shmem
>>       34429            -9.6%      31116        proc-vmstat.nr_slab_recla=
imable
>>       87838            +5.0%      92250        proc-vmstat.nr_slab_unrec=
laimable
>>      615372 =C2=B1 10%     -69.8%     185617 =C2=B1 10%  proc-vmstat.nr_=
zone_active_anon
>>      870340 =C2=B1  7%     -88.1%     103477        proc-vmstat.nr_zone_=
inactive_anon
>>      530386 =C2=B1  4%     -85.5%      77127 =C2=B1 32%  proc-vmstat.num=
a_hint_faults
>>      228804 =C2=B1 12%     -90.8%      21025 =C2=B1 43%  proc-vmstat.num=
a_hint_faults_local
>>   1.569e+09           -68.3%   4.98e+08 =C2=B1  9%  proc-vmstat.numa_hit
>>   1.568e+09           -68.3%  4.978e+08 =C2=B1  9%  proc-vmstat.numa_loc=
al
>>      861263           -62.6%     322538 =C2=B1 13%  proc-vmstat.numa_pte=
_updates
>>      148556 =C2=B1  7%    +189.2%     429639 =C2=B1  4%  proc-vmstat.pga=
ctivate
>>   9.054e+09           -68.3%  2.871e+09 =C2=B1  9%  proc-vmstat.pgalloc_=
normal
>>     2161073           -31.0%    1491735 =C2=B1  2%  proc-vmstat.pgfault
>>   9.051e+09           -68.3%   2.87e+09 =C2=B1  9%  proc-vmstat.pgfree
>>        4692 =C2=B1  3%     -11.4%       4157 =C2=B1  5%  slabinfo.PING.a=
ctive_objs
>>        4692 =C2=B1  3%     -11.4%       4157 =C2=B1  5%  slabinfo.PING.n=
um_objs
>>        2815 =C2=B1  2%     -26.7%       2064 =C2=B1  8%  slabinfo.SCTP.a=
ctive_objs
>>        2815 =C2=B1  2%     -26.7%       2064 =C2=B1  8%  slabinfo.SCTP.n=
um_objs
>>        1173           -20.7%     931.17 =C2=B1 12%  slabinfo.TCP.active_=
objs
>>        1173           -20.7%     931.17 =C2=B1 12%  slabinfo.TCP.num_objs
>>        5390 =C2=B1  4%     -16.0%       4528 =C2=B1  5%  slabinfo.dmaeng=
ine-unmap-16.active_objs
>>        5390 =C2=B1  4%     -16.0%       4528 =C2=B1  5%  slabinfo.dmaeng=
ine-unmap-16.num_objs
>>        7826 =C2=B1  5%     +13.4%       8877 =C2=B1  2%  slabinfo.files_=
cache.active_objs
>>        7826 =C2=B1  5%     +13.4%       8877 =C2=B1  2%  slabinfo.files_=
cache.num_objs
>>       96171 =C2=B1  5%     -11.8%      84807 =C2=B1  3%  slabinfo.filp.a=
ctive_objs
>>        1505 =C2=B1  5%     -11.7%       1328 =C2=B1  3%  slabinfo.filp.a=
ctive_slabs
>>       96338 =C2=B1  5%     -11.7%      85064 =C2=B1  3%  slabinfo.filp.n=
um_objs
>>        1505 =C2=B1  5%     -11.7%       1328 =C2=B1  3%  slabinfo.filp.n=
um_slabs
>>       43605           -44.0%      24398        slabinfo.radix_tree_node.=
active_objs
>>      778.33           -44.1%     435.17        slabinfo.radix_tree_node.=
active_slabs
>>       43605           -44.0%      24398        slabinfo.radix_tree_node.=
num_objs
>>      778.33           -44.1%     435.17        slabinfo.radix_tree_node.=
num_slabs
>>        4302           -22.4%       3340 =C2=B1 13%  slabinfo.request_soc=
k_TCP.active_objs
>>        4302           -22.4%       3340 =C2=B1 13%  slabinfo.request_soc=
k_TCP.num_objs
>>        6574 =C2=B1  3%      +8.5%       7135        slabinfo.signal_cach=
e.active_objs
>>        6589 =C2=B1  3%      +8.6%       7155        slabinfo.signal_cach=
e.num_objs
>>        7027           -37.0%       4429 =C2=B1 13%  slabinfo.skbuff_fclo=
ne_cache.active_objs
>>        7027           -37.0%       4429 =C2=B1 13%  slabinfo.skbuff_fclo=
ne_cache.num_objs
>>       13904 =C2=B1  6%     +33.1%      18510 =C2=B1  4%  slabinfo.skbuff=
_head_cache.active_objs
>>       13947 =C2=B1  6%     +32.7%      18510 =C2=B1  4%  slabinfo.skbuff=
_head_cache.num_objs
>>       10450 =C2=B1  4%      +9.6%      11452        slabinfo.task_delay_=
info.active_objs
>>       10450 =C2=B1  4%      +9.6%      11452        slabinfo.task_delay_=
info.num_objs
>>        3840           +51.6%       5822 =C2=B1  9%  slabinfo.trace_event=
_file.active_objs
>>        3840           +51.6%       5822 =C2=B1  9%  slabinfo.trace_event=
_file.num_objs
>>        0.00 =C2=B1 70%    +475.0%       0.01 =C2=B1  9%  perf-sched.sch_=
delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>        0.00 =C2=B1 70%    +210.0%       0.01 =C2=B1 23%  perf-sched.sch_=
delay.avg.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.migrate_ta=
sk_to.task_numa_migrate
>>        0.00 =C2=B1 71%     +96.2%       0.01 =C2=B1 14%  perf-sched.sch_=
delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
>>        0.00 =C2=B1 99%    +689.3%       0.04 =C2=B1 90%  perf-sched.sch_=
delay.avg.ms.schedule_timeout.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg
>>        0.00 =C2=B1 70%    +425.0%       0.02 =C2=B1  2%  perf-sched.sch_=
delay.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recv=
msg
>>        0.02 =C2=B1 71%    +115.2%       0.04 =C2=B1 42%  perf-sched.sch_=
delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSC=
ALL_64_after_hwframe.[unknown]
>>        0.06 =C2=B1108%   +3756.4%       2.42 =C2=B1 17%  perf-sched.sch_=
delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
>>        0.06 =C2=B1 70%   +3410.4%       2.20 =C2=B1 81%  perf-sched.sch_=
delay.max.ms.preempt_schedule_common.__cond_resched.__release_sock.release_=
sock.sctp_sendmsg
>>        0.01 =C2=B1 77%    +331.3%       0.02 =C2=B1 25%  perf-sched.sch_=
delay.max.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.migrate_ta=
sk_to.task_numa_migrate
>>        0.05 =C2=B1 96%  +2.1e+05%     105.10 =C2=B1 97%  perf-sched.sch_=
delay.max.ms.schedule_timeout.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg
>>        0.00 =C2=B1 70%    +175.0%       0.01 =C2=B1  4%  perf-sched.tota=
l_sch_delay.average.ms
>>        0.27 =C2=B1 70%    +982.7%       2.97 =C2=B1  7%  perf-sched.tota=
l_wait_and_delay.average.ms
>>        3422 =C2=B1 72%    +158.3%       8840 =C2=B1  6%  perf-sched.tota=
l_wait_and_delay.max.ms
>>        0.27 =C2=B1 70%    +992.6%       2.96 =C2=B1  7%  perf-sched.tota=
l_wait_time.average.ms
>>        3422 =C2=B1 72%    +158.3%       8840 =C2=B1  6%  perf-sched.tota=
l_wait_time.max.ms
>>        0.19 =C2=B1141%   +9589.9%      18.83 =C2=B1 48%  perf-sched.wait=
_and_delay.avg.ms.preempt_schedule_common.__cond_resched.generic_perform_wr=
ite.__generic_file_write_iter.generic_file_write_iter
>>        3.08 =C2=B1 70%    +224.6%       9.98 =C2=B1 32%  perf-sched.wait=
_and_delay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>        2.20 =C2=B1141%   +2400.9%      54.96 =C2=B1 14%  perf-sched.wait=
_and_delay.avg.ms.schedule_timeout.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_s=
endmsg
>>        0.05 =C2=B1 70%   +1707.9%       0.84 =C2=B1  8%  perf-sched.wait=
_and_delay.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet=
_recvmsg
>>        1661 =C2=B1 70%    +158.5%       4293 =C2=B1  3%  perf-sched.wait=
_and_delay.count.pipe_read.new_sync_read.vfs_read.ksys_read
>>      906.33 =C2=B1 71%  +1.2e+05%    1081218 =C2=B1  9%  perf-sched.wait=
_and_delay.count.preempt_schedule_common.__cond_resched.__release_sock.rele=
ase_sock.sctp_sendmsg
>>       14.33 =C2=B1 70%   +4682.6%     685.50 =C2=B1  4%  perf-sched.wait=
_and_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.const=
prop.0.do_sys_poll
>>       20.67 =C2=B1141%  +69923.4%      14471 =C2=B1 15%  perf-sched.wait=
_and_delay.count.schedule_timeout.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_se=
ndmsg
>>        1782 =C2=B1 70%    +189.4%       5156 =C2=B1 19%  perf-sched.wait=
_and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
>>        3.13 =C2=B1141%    +839.8%      29.44 =C2=B1 35%  perf-sched.wait=
_and_delay.max.ms.preempt_schedule_common.__cond_resched.generic_perform_wr=
ite.__generic_file_write_iter.generic_file_write_iter
>>       20.00 =C2=B1 71%   +1087.5%     237.48 =C2=B1 36%  perf-sched.wait=
_and_delay.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>       67.94 =C2=B1141%    +973.7%     729.48 =C2=B1 63%  perf-sched.wait=
_and_delay.max.ms.schedule_timeout.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_s=
endmsg
>>      138.60 =C2=B1 70%    +375.2%     658.56 =C2=B1 59%  perf-sched.wait=
_and_delay.max.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet=
_recvmsg
>>        3422 =C2=B1 72%    +158.3%       8840 =C2=B1  6%  perf-sched.wait=
_and_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
>>        0.21 =C2=B1123%   +8754.5%      18.83 =C2=B1 48%  perf-sched.wait=
_time.avg.ms.preempt_schedule_common.__cond_resched.generic_perform_write._=
_generic_file_write_iter.generic_file_write_iter
>>        0.82 =C2=B1 75%    +313.5%       3.40 =C2=B1 10%  perf-sched.wait=
_time.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
>>        3.07 =C2=B1 70%    +225.3%       9.97 =C2=B1 32%  perf-sched.wait=
_time.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>        2.21 =C2=B1139%   +2385.2%      54.92 =C2=B1 14%  perf-sched.wait=
_time.avg.ms.schedule_timeout.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg
>>        0.04 =C2=B1 70%   +1806.5%       0.83 =C2=B1  8%  perf-sched.wait=
_time.avg.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recv=
msg
>>        3.20 =C2=B1136%    +818.9%      29.44 =C2=B1 35%  perf-sched.wait=
_time.max.ms.preempt_schedule_common.__cond_resched.generic_perform_write._=
_generic_file_write_iter.generic_file_write_iter
>>        1.66 =C2=B1102%    +200.9%       4.98        perf-sched.wait_time=
.max.ms.rcu_gp_kthread.kthread.ret_from_fork
>>       17.66 =C2=B1 71%   +1244.7%     237.47 =C2=B1 36%  perf-sched.wait=
_time.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
>>       68.12 =C2=B1140%    +919.6%     694.63 =C2=B1 70%  perf-sched.wait=
_time.max.ms.schedule_timeout.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg
>>      138.59 =C2=B1 70%    +351.4%     625.66 =C2=B1 66%  perf-sched.wait=
_time.max.ms.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recv=
msg
>>        3422 =C2=B1 72%    +158.3%       8840 =C2=B1  6%  perf-sched.wait=
_time.max.ms.smpboot_thread_fn.kthread.ret_from_fork
>>       71860 =C2=B1 12%    -100.0%      17.98 =C2=B1223%  sched_debug.cfs=
_rq:/.MIN_vruntime.avg
>>     8514387 =C2=B1  8%    -100.0%       3183 =C2=B1223%  sched_debug.cfs=
_rq:/.MIN_vruntime.max
>>      711918 =C2=B1  4%    -100.0%     238.60 =C2=B1223%  sched_debug.cfs=
_rq:/.MIN_vruntime.stddev
>>       15567 =C2=B1 14%   +1034.2%     176558 =C2=B1  7%  sched_debug.cfs=
_rq:/.load.max
>>        4753 =C2=B1  6%    +459.5%      26592 =C2=B1  7%  sched_debug.cfs=
_rq:/.load.stddev
>>      192.80 =C2=B1 12%     +46.3%     282.01 =C2=B1 17%  sched_debug.cfs=
_rq:/.load_avg.max
>>       25.64 =C2=B1 19%     +38.0%      35.38 =C2=B1 15%  sched_debug.cfs=
_rq:/.load_avg.stddev
>>       71860 =C2=B1 12%    -100.0%      17.98 =C2=B1223%  sched_debug.cfs=
_rq:/.max_vruntime.avg
>>     8514387 =C2=B1  8%    -100.0%       3183 =C2=B1223%  sched_debug.cfs=
_rq:/.max_vruntime.max
>>      711918 =C2=B1  4%    -100.0%     238.60 =C2=B1223%  sched_debug.cfs=
_rq:/.max_vruntime.stddev
>>     7786210           -99.0%      76578 =C2=B1 20%  sched_debug.cfs_rq:/=
.min_vruntime.avg
>>    12595194           -99.0%     129916 =C2=B1 18%  sched_debug.cfs_rq:/=
.min_vruntime.max
>>     2658841 =C2=B1  2%     -97.9%      56298 =C2=B1 23%  sched_debug.cfs=
_rq:/.min_vruntime.min
>>     2553156 =C2=B1  3%     -99.6%       8966 =C2=B1  9%  sched_debug.cfs=
_rq:/.min_vruntime.stddev
>>        0.49           -91.4%       0.04 =C2=B1 12%  sched_debug.cfs_rq:/=
.nr_running.avg
>>        0.43           -54.1%       0.20 =C2=B1  5%  sched_debug.cfs_rq:/=
.nr_running.stddev
>>      512.97           -86.2%      70.68 =C2=B1  9%  sched_debug.cfs_rq:/=
.runnable_avg.avg
>>        1060 =C2=B1  2%     +22.3%       1296 =C2=B1  4%  sched_debug.cfs=
_rq:/.runnable_avg.max
>>      387.80           -45.9%     209.92 =C2=B1  7%  sched_debug.cfs_rq:/=
.runnable_avg.stddev
>>     4954639 =C2=B1 29%     -99.1%      47032 =C2=B1 41%  sched_debug.cfs=
_rq:/.spread0.max
>>    -4981749           -99.5%     -26550        sched_debug.cfs_rq:/.spre=
ad0.min
>>     2553293 =C2=B1  3%     -99.6%       8966 =C2=B1  9%  sched_debug.cfs=
_rq:/.spread0.stddev
>>      512.81           -88.6%      58.48 =C2=B1  9%  sched_debug.cfs_rq:/=
.util_avg.avg
>>        1060 =C2=B1  2%      -8.1%     974.30 =C2=B1  4%  sched_debug.cfs=
_rq:/.util_avg.max
>>      387.78           -58.1%     162.65 =C2=B1  6%  sched_debug.cfs_rq:/=
.util_avg.stddev
>>      423.34           -95.5%      19.13 =C2=B1 17%  sched_debug.cfs_rq:/=
.util_est_enqueued.avg
>>      985.27           -13.3%     853.87 =C2=B1  6%  sched_debug.cfs_rq:/=
.util_est_enqueued.max
>>      409.77           -73.4%     108.97 =C2=B1 12%  sched_debug.cfs_rq:/=
.util_est_enqueued.stddev
>>      502046 =C2=B1  2%     +81.0%     908802        sched_debug.cpu.avg_=
idle.avg
>>       18977 =C2=B1  2%   +1753.2%     351699 =C2=B1  8%  sched_debug.cpu=
.avg_idle.min
>>      480775 =C2=B1 22%     -64.0%     173088 =C2=B1  2%  sched_debug.cpu=
.avg_idle.stddev
>>      155123           +14.3%     177368 =C2=B1  8%  sched_debug.cpu.cloc=
k_task.avg
>>      146715           +15.4%     169244 =C2=B1  8%  sched_debug.cpu.cloc=
k_task.min
>>        1829 =C2=B1  2%     -60.5%     722.65 =C2=B1  5%  sched_debug.cpu=
.clock_task.stddev
>>        1848 =C2=B1  2%     -90.5%     175.33 =C2=B1 15%  sched_debug.cpu=
.curr->pid.avg
>>        1670           -44.9%     919.75 =C2=B1 11%  sched_debug.cpu.curr=
->pid.stddev
>>        0.00 =C2=B1 12%     -34.2%       0.00 =C2=B1  7%  sched_debug.cpu=
.next_balance.stddev
>>        0.49           -88.9%       0.05 =C2=B1 13%  sched_debug.cpu.nr_r=
unning.avg
>>        1.07 =C2=B1  8%     +70.8%       1.82 =C2=B1  5%  sched_debug.cpu=
.nr_running.max
>>        0.43           -36.5%       0.27 =C2=B1  7%  sched_debug.cpu.nr_r=
unning.stddev
>>     1434564           -80.9%     273873 =C2=B1 15%  sched_debug.cpu.nr_s=
witches.avg
>>     2961784           -86.3%     404637 =C2=B1 13%  sched_debug.cpu.nr_s=
witches.max
>>       74159 =C2=B1 23%    +133.7%     173295 =C2=B1 21%  sched_debug.cpu=
.nr_switches.min
>>      728693 =C2=B1  3%     -94.3%      41366 =C2=B1 10%  sched_debug.cpu=
.nr_switches.stddev
>>        0.00           -34.7%       0.00 =C2=B1 27%  sched_debug.cpu.nr_u=
ninterruptible.avg
>>       28.54           -38.4%      17.58 =C2=B1  5%  perf-stat.i.MPKI
>>   1.942e+10           -76.8%   4.51e+09 =C2=B1  8%  perf-stat.i.branch-i=
nstructions
>>        1.06            +0.2        1.24 =C2=B1  2%  perf-stat.i.branch-m=
iss-rate%
>>   2.024e+08           -72.3%   56001773 =C2=B1 11%  perf-stat.i.branch-m=
isses
>>        0.50 =C2=B1  5%      +2.1        2.57 =C2=B1 12%  perf-stat.i.cac=
he-miss-rate%
>>    11034781 =C2=B1  7%     -16.7%    9191451 =C2=B1  6%  perf-stat.i.cac=
he-misses
>>   2.599e+09           -84.6%  3.996e+08 =C2=B1 15%  perf-stat.i.cache-re=
ferences
>>     2307795           -84.0%     369797 =C2=B1  9%  perf-stat.i.context-=
switches
>>        3.97           -61.0%       1.55 =C2=B1  2%  perf-stat.i.cpi
>>   3.612e+11           -90.4%   3.45e+10 =C2=B1  7%  perf-stat.i.cpu-cycl=
es
>>        8649 =C2=B1  4%     -55.6%       3842 =C2=B1 13%  perf-stat.i.cpu=
-migrations
>>       38278 =C2=B1  9%     -89.9%       3870 =C2=B1  6%  perf-stat.i.cyc=
les-between-cache-misses
>>        0.04 =C2=B1 14%      -0.0        0.01 =C2=B1 50%  perf-stat.i.dTL=
B-load-miss-rate%
>>     9072813 =C2=B1 14%     -96.5%     317355 =C2=B1 54%  perf-stat.i.dTL=
B-load-misses
>>    2.51e+10           -74.8%  6.313e+09 =C2=B1  8%  perf-stat.i.dTLB-loa=
ds
>>        0.02 =C2=B1  3%      -0.0        0.00 =C2=B1 25%  perf-stat.i.dTL=
B-store-miss-rate%
>>     1805231 =C2=B1  3%     -93.0%     125977 =C2=B1 32%  perf-stat.i.dTL=
B-store-misses
>>   1.197e+10           -69.6%  3.645e+09 =C2=B1  8%  perf-stat.i.dTLB-sto=
res
>>       55.78           +20.2       76.03        perf-stat.i.iTLB-load-mis=
s-rate%
>>   1.408e+08           -70.5%   41514812 =C2=B1  9%  perf-stat.i.iTLB-loa=
d-misses
>>   1.114e+08           -88.4%   12863472 =C2=B1  4%  perf-stat.i.iTLB-loa=
ds
>>   9.148e+10           -75.5%  2.238e+10 =C2=B1  8%  perf-stat.i.instruct=
ions
>>      656.57           -15.2%     556.86        perf-stat.i.instructions-=
per-iTLB-miss
>>        0.25          +154.9%       0.65 =C2=B1  2%  perf-stat.i.ipc
>>        1.88           -90.4%       0.18 =C2=B1  7%  perf-stat.i.metric.G=
Hz
>>        0.79 =C2=B1  7%     +76.9%       1.40 =C2=B1  8%  perf-stat.i.met=
ric.K/sec
>>      308.37           -74.9%      77.51 =C2=B1  8%  perf-stat.i.metric.M=
/sec
>>        7019           -31.4%       4818        perf-stat.i.minor-faults
>>       95.30            -2.8       92.52        perf-stat.i.node-load-mis=
s-rate%
>>     4245968 =C2=B1 10%     -46.2%    2282264 =C2=B1  8%  perf-stat.i.nod=
e-load-misses
>>     1369803 =C2=B1  4%     -50.6%     676523 =C2=B1 10%  perf-stat.i.nod=
e-store-misses
>>      205347 =C2=B1 13%     -68.9%      63938 =C2=B1 47%  perf-stat.i.nod=
e-stores
>>        7021           -31.3%       4820        perf-stat.i.page-faults
>>       28.41           -37.4%      17.77 =C2=B1  5%  perf-stat.overall.MP=
KI
>>        1.04            +0.2        1.24 =C2=B1  2%  perf-stat.overall.br=
anch-miss-rate%
>>        0.43 =C2=B1  7%      +1.9        2.34 =C2=B1 12%  perf-stat.overa=
ll.cache-miss-rate%
>>        3.95           -60.9%       1.54 =C2=B1  2%  perf-stat.overall.cpi
>>       32893 =C2=B1  8%     -88.6%       3757 =C2=B1  6%  perf-stat.overa=
ll.cycles-between-cache-misses
>>        0.04 =C2=B1 14%      -0.0        0.00 =C2=B1 47%  perf-stat.overa=
ll.dTLB-load-miss-rate%
>>        0.02 =C2=B1  3%      -0.0        0.00 =C2=B1 24%  perf-stat.overa=
ll.dTLB-store-miss-rate%
>>       55.84           +20.4       76.27        perf-stat.overall.iTLB-lo=
ad-miss-rate%
>>      649.68           -16.9%     539.61        perf-stat.overall.instruc=
tions-per-iTLB-miss
>>        0.25          +156.0%       0.65 =C2=B1  2%  perf-stat.overall.ipc
>>       95.32            -3.0       92.35        perf-stat.overall.node-lo=
ad-miss-rate%
>>       22631           -22.9%      17454        perf-stat.overall.path-le=
ngth
>>   1.935e+10           -76.8%  4.495e+09 =C2=B1  8%  perf-stat.ps.branch-=
instructions
>>   2.017e+08           -72.3%   55823595 =C2=B1 11%  perf-stat.ps.branch-=
misses
>>    11014009 =C2=B1  7%     -16.8%    9161109 =C2=B1  6%  perf-stat.ps.ca=
che-misses
>>    2.59e+09           -84.6%  3.983e+08 =C2=B1 15%  perf-stat.ps.cache-r=
eferences
>>     2299906           -84.0%     368553 =C2=B1  9%  perf-stat.ps.context=
-switches
>>     3.6e+11           -90.4%  3.439e+10 =C2=B1  7%  perf-stat.ps.cpu-cyc=
les
>>        8611 =C2=B1  3%     -55.5%       3829 =C2=B1 13%  perf-stat.ps.cp=
u-migrations
>>     8998085 =C2=B1 14%     -96.5%     316355 =C2=B1 54%  perf-stat.ps.dT=
LB-load-misses
>>   2.502e+10           -74.9%  6.292e+09 =C2=B1  8%  perf-stat.ps.dTLB-lo=
ads
>>     1798299 =C2=B1  3%     -93.0%     125557 =C2=B1 32%  perf-stat.ps.dT=
LB-store-misses
>>   1.193e+10           -69.6%  3.633e+09 =C2=B1  8%  perf-stat.ps.dTLB-st=
ores
>>   1.404e+08           -70.5%   41374488 =C2=B1  9%  perf-stat.ps.iTLB-lo=
ad-misses
>>    1.11e+08           -88.4%   12819803 =C2=B1  4%  perf-stat.ps.iTLB-lo=
ads
>>   9.118e+10           -75.5%   2.23e+10 =C2=B1  8%  perf-stat.ps.instruc=
tions
>>        7004           -31.4%       4801        perf-stat.ps.minor-faults
>>     4234356 =C2=B1 10%     -46.3%    2274791 =C2=B1  8%  perf-stat.ps.no=
de-load-misses
>>     1368078 =C2=B1  4%     -50.7%     674434 =C2=B1 10%  perf-stat.ps.no=
de-store-misses
>>      206042 =C2=B1 13%     -69.0%      63795 =C2=B1 47%  perf-stat.ps.no=
de-stores
>>        7005           -31.4%       4802        perf-stat.ps.page-faults
>>   2.757e+13           -75.5%  6.745e+12 =C2=B1  8%  perf-stat.total.inst=
ructions
>>      815772 =C2=B1 27%     -57.3%     348453 =C2=B1 11%  softirqs.CPU0.N=
ET_RX
>>        9412 =C2=B1 21%    +110.1%      19771 =C2=B1 10%  softirqs.CPU0.R=
CU
>>       28552 =C2=B1 13%     +45.7%      41612        softirqs.CPU0.SCHED
>>     1313640 =C2=B1 26%     -74.4%     336754 =C2=B1  9%  softirqs.CPU1.N=
ET_RX
>>        6704 =C2=B1  9%    +165.6%      17804 =C2=B1  8%  softirqs.CPU1.R=
CU
>>       19291 =C2=B1 33%    +100.7%      38726        softirqs.CPU1.SCHED
>>     1005800 =C2=B1  9%     -68.5%     317193 =C2=B1 11%  softirqs.CPU10.=
NET_RX
>>        5750 =C2=B1 10%    +208.9%      17762 =C2=B1  8%  softirqs.CPU10.=
RCU
>>       23707 =C2=B1 20%     +62.9%      38607 =C2=B1  2%  softirqs.CPU10.=
SCHED
>>      498762 =C2=B1  7%     -47.0%     264435 =C2=B1 12%  softirqs.CPU100=
.NET_RX
>>        5213 =C2=B1  5%    +231.6%      17286 =C2=B1  8%  softirqs.CPU100=
.RCU
>>        5274 =C2=B1  4%    +222.5%      17011 =C2=B1  7%  softirqs.CPU101=
.RCU
>>      546534 =C2=B1 51%     -51.1%     266999 =C2=B1 10%  softirqs.CPU102=
.NET_RX
>>        5127 =C2=B1  2%    +232.6%      17051 =C2=B1  8%  softirqs.CPU102=
.RCU
>>        5260 =C2=B1  4%    +225.0%      17097 =C2=B1  8%  softirqs.CPU103=
.RCU
>>      477746 =C2=B1 26%     -40.7%     283150 =C2=B1 11%  softirqs.CPU104=
.NET_RX
>>        5087 =C2=B1  2%    +232.1%      16896 =C2=B1  8%  softirqs.CPU104=
.RCU
>>      800989 =C2=B1 38%     -66.5%     268701 =C2=B1 12%  softirqs.CPU105=
.NET_RX
>>        4902          +244.3%      16880 =C2=B1  7%  softirqs.CPU105.RCU
>>       28237 =C2=B1 25%     +36.1%      38442        softirqs.CPU105.SCHED
>>      788006 =C2=B1 27%     -64.3%     281238 =C2=B1 16%  softirqs.CPU106=
.NET_RX
>>        5098 =C2=B1  4%    +229.4%      16792 =C2=B1  8%  softirqs.CPU106=
.RCU
>>       28845 =C2=B1 15%     +33.8%      38596        softirqs.CPU106.SCHED
>>        5075          +234.2%      16965 =C2=B1  7%  softirqs.CPU107.RCU
>>        5054          +236.2%      16989 =C2=B1  6%  softirqs.CPU108.RCU
>>        4936          +247.9%      17172 =C2=B1  8%  softirqs.CPU109.RCU
>>     1369740 =C2=B1 14%     -76.3%     324047 =C2=B1 11%  softirqs.CPU11.=
NET_RX
>>        6757 =C2=B1 14%    +156.7%      17347 =C2=B1  6%  softirqs.CPU11.=
RCU
>>       17912 =C2=B1 19%    +113.2%      38190        softirqs.CPU11.SCHED
>>        5110 =C2=B1  4%    +222.9%      16500 =C2=B1  8%  softirqs.CPU110=
.RCU
>>        4945 =C2=B1  2%    +240.7%      16851 =C2=B1  7%  softirqs.CPU111=
.RCU
>>        5555 =C2=B1  8%    +202.1%      16782 =C2=B1  7%  softirqs.CPU112=
.RCU
>>        5004 =C2=B1  4%    +235.8%      16806 =C2=B1  9%  softirqs.CPU113=
.RCU
>>      726227 =C2=B1 43%     -61.0%     283516 =C2=B1 14%  softirqs.CPU114=
.NET_RX
>>        5160 =C2=B1  6%    +215.0%      16256 =C2=B1  8%  softirqs.CPU114=
.RCU
>>       29766 =C2=B1 22%     +27.6%      37968        softirqs.CPU114.SCHED
>>      758309 =C2=B1 38%     -63.0%     280883 =C2=B1 15%  softirqs.CPU115=
.NET_RX
>>        5062 =C2=B1  2%    +243.6%      17394 =C2=B1  5%  softirqs.CPU115=
.RCU
>>       28346 =C2=B1 21%     +35.6%      38438        softirqs.CPU115.SCHED
>>      625790 =C2=B1 27%     -57.3%     267503 =C2=B1 12%  softirqs.CPU116=
.NET_RX
>>        5155 =C2=B1  4%    +224.7%      16740 =C2=B1  7%  softirqs.CPU116=
.RCU
>>       32111 =C2=B1 10%     +20.0%      38522        softirqs.CPU116.SCHED
>>      667501 =C2=B1 39%     -59.6%     269469 =C2=B1 15%  softirqs.CPU117=
.NET_RX
>>        5011          +238.0%      16940 =C2=B1  7%  softirqs.CPU117.RCU
>>       30539 =C2=B1 17%     +26.8%      38714        softirqs.CPU117.SCHED
>>        4994 =C2=B1  2%    +235.5%      16755 =C2=B1  8%  softirqs.CPU118=
.RCU
>>      563493 =C2=B1 20%     -50.9%     276859 =C2=B1  7%  softirqs.CPU119=
.NET_RX
>>        5086 =C2=B1  2%    +227.3%      16649 =C2=B1  7%  softirqs.CPU119=
.RCU
>>       32378 =C2=B1  8%     +18.5%      38377        softirqs.CPU119.SCHED
>>     1375275 =C2=B1 13%     -77.6%     307845 =C2=B1 13%  softirqs.CPU12.=
NET_RX
>>        5781 =C2=B1  2%    +195.5%      17084 =C2=B1  6%  softirqs.CPU12.=
RCU
>>       17029 =C2=B1 22%    +124.9%      38295        softirqs.CPU12.SCHED
>>      807593 =C2=B1 29%     -62.9%     299477 =C2=B1 12%  softirqs.CPU120=
.NET_RX
>>        5085 =C2=B1  4%    +243.8%      17485 =C2=B1  8%  softirqs.CPU120=
.RCU
>>       27938 =C2=B1 20%     +37.5%      38427        softirqs.CPU120.SCHED
>>      823087 =C2=B1 18%     -66.8%     273039 =C2=B1 17%  softirqs.CPU121=
.NET_RX
>>        4986          +238.9%      16900 =C2=B1  8%  softirqs.CPU121.RCU
>>       25832 =C2=B1  9%     +48.6%      38379        softirqs.CPU121.SCHED
>>      731173 =C2=B1 63%     -63.7%     265095 =C2=B1 18%  softirqs.CPU122=
.NET_RX
>>        4986 =C2=B1  4%    +248.9%      17394 =C2=B1  9%  softirqs.CPU122=
.RCU
>>        5139 =C2=B1  5%    +237.0%      17322 =C2=B1  6%  softirqs.CPU123=
.RCU
>>      869090 =C2=B1  7%     -71.0%     252143 =C2=B1 13%  softirqs.CPU124=
.NET_RX
>>        5009 =C2=B1  3%    +242.7%      17168 =C2=B1  7%  softirqs.CPU124=
.RCU
>>       26422 =C2=B1  5%     +46.6%      38725        softirqs.CPU124.SCHED
>>      644647 =C2=B1 36%     -61.6%     247265 =C2=B1 21%  softirqs.CPU125=
.NET_RX
>>        5054 =C2=B1  3%    +235.3%      16949 =C2=B1  7%  softirqs.CPU125=
.RCU
>>       31677 =C2=B1 17%     +22.0%      38640        softirqs.CPU125.SCHED
>>        5191 =C2=B1  7%    +232.5%      17262 =C2=B1  8%  softirqs.CPU126=
.RCU
>>      623310 =C2=B1 39%     -60.0%     249301 =C2=B1  8%  softirqs.CPU127=
.NET_RX
>>        4974          +237.9%      16808 =C2=B1  7%  softirqs.CPU127.RCU
>>       31603 =C2=B1 18%     +21.5%      38406        softirqs.CPU127.SCHED
>>        5058 =C2=B1  7%    +250.1%      17711 =C2=B1  9%  softirqs.CPU128=
.RCU
>>      908165 =C2=B1 37%     -72.4%     250740 =C2=B1 13%  softirqs.CPU129=
.NET_RX
>>        5097 =C2=B1  4%    +242.6%      17464 =C2=B1  7%  softirqs.CPU129=
.RCU
>>       25183 =C2=B1 31%     +52.5%      38400        softirqs.CPU129.SCHED
>>     1044612 =C2=B1 32%     -69.3%     320374 =C2=B1 20%  softirqs.CPU13.=
NET_RX
>>        5377 =C2=B1  3%    +222.9%      17364 =C2=B1  9%  softirqs.CPU13.=
RCU
>>       23880 =C2=B1 29%     +59.9%      38193        softirqs.CPU13.SCHED
>>     1047700 =C2=B1 31%     -76.4%     246748 =C2=B1 17%  softirqs.CPU130=
.NET_RX
>>        4834 =C2=B1  2%    +265.1%      17647 =C2=B1  7%  softirqs.CPU130=
.RCU
>>       21922 =C2=B1 34%     +76.3%      38641        softirqs.CPU130.SCHED
>>      805863 =C2=B1 34%     -68.0%     257579 =C2=B1  9%  softirqs.CPU131=
.NET_RX
>>        4948 =C2=B1  2%    +261.6%      17892 =C2=B1  8%  softirqs.CPU131=
.RCU
>>       27973 =C2=B1 24%     +37.4%      38435        softirqs.CPU131.SCHED
>>      516629 =C2=B1 47%     -53.1%     242416 =C2=B1 13%  softirqs.CPU132=
.NET_RX
>>        5199 =C2=B1  7%    +236.9%      17514 =C2=B1  6%  softirqs.CPU132=
.RCU
>>        5084 =C2=B1  4%    +246.5%      17616 =C2=B1  7%  softirqs.CPU133=
.RCU
>>        4808 =C2=B1  2%    +262.8%      17443 =C2=B1  7%  softirqs.CPU134=
.RCU
>>      568994 =C2=B1 43%     -54.6%     258562 =C2=B1 12%  softirqs.CPU135=
.NET_RX
>>        4922 =C2=B1  3%    +254.0%      17425 =C2=B1  7%  softirqs.CPU135=
.RCU
>>      909414 =C2=B1 44%     -70.3%     269933 =C2=B1 10%  softirqs.CPU136=
.NET_RX
>>        4887          +267.3%      17951 =C2=B1  9%  softirqs.CPU136.RCU
>>       24963 =C2=B1 36%     +54.5%      38569        softirqs.CPU136.SCHED
>>        4964 =C2=B1  5%    +256.4%      17694 =C2=B1  8%  softirqs.CPU137=
.RCU
>>     1061980 =C2=B1 11%     -73.0%     286873 =C2=B1 18%  softirqs.CPU138=
.NET_RX
>>        4784          +268.5%      17628 =C2=B1  8%  softirqs.CPU138.RCU
>>       21354 =C2=B1 13%     +80.2%      38474        softirqs.CPU138.SCHED
>>        4868 =C2=B1  2%    +262.9%      17666 =C2=B1  9%  softirqs.CPU139=
.RCU
>>     1273066 =C2=B1 22%     -74.6%     323309 =C2=B1 17%  softirqs.CPU14.=
NET_RX
>>        5586 =C2=B1  5%    +204.1%      16985 =C2=B1  7%  softirqs.CPU14.=
RCU
>>       19028 =C2=B1 33%    +100.4%      38139        softirqs.CPU14.SCHED
>>      951508 =C2=B1 31%     -69.4%     290718 =C2=B1  9%  softirqs.CPU140=
.NET_RX
>>        5075 =C2=B1  7%    +249.3%      17728 =C2=B1  8%  softirqs.CPU140=
.RCU
>>       24837 =C2=B1 29%     +55.2%      38551        softirqs.CPU140.SCHED
>>        4987 =C2=B1  5%    +252.8%      17596 =C2=B1  8%  softirqs.CPU141=
.RCU
>>      936720 =C2=B1 24%     -69.9%     282308 =C2=B1 14%  softirqs.CPU142=
.NET_RX
>>        4838 =C2=B1  4%    +261.2%      17474 =C2=B1  7%  softirqs.CPU142=
.RCU
>>       24365 =C2=B1 22%     +58.8%      38686        softirqs.CPU142.SCHED
>>        5037 =C2=B1  8%    +250.0%      17629 =C2=B1  7%  softirqs.CPU143=
.RCU
>>        5267 =C2=B1  6%    +227.5%      17251 =C2=B1  4%  softirqs.CPU144=
.RCU
>>     1070540 =C2=B1 20%     -75.2%     265781 =C2=B1 19%  softirqs.CPU145=
.NET_RX
>>        4962 =C2=B1  3%    +250.7%      17404 =C2=B1  8%  softirqs.CPU145=
.RCU
>>       21399 =C2=B1 28%     +78.3%      38162        softirqs.CPU145.SCHED
>>      528769 =C2=B1 21%     -53.6%     245165 =C2=B1  7%  softirqs.CPU146=
.NET_RX
>>        5017 =C2=B1  4%    +250.4%      17582 =C2=B1  6%  softirqs.CPU146=
.RCU
>>       34852 =C2=B1  7%     +11.8%      38966        softirqs.CPU146.SCHED
>>      802944 =C2=B1 49%     -68.5%     252611 =C2=B1 19%  softirqs.CPU147=
.NET_RX
>>        4942 =C2=B1  4%    +251.8%      17388 =C2=B1  7%  softirqs.CPU147=
.RCU
>>      850984 =C2=B1 51%     -68.8%     265398 =C2=B1 14%  softirqs.CPU148=
.NET_RX
>>        5076 =C2=B1  8%    +246.4%      17587 =C2=B1  7%  softirqs.CPU148=
.RCU
>>       26406 =C2=B1 41%     +46.4%      38663        softirqs.CPU148.SCHED
>>      745213 =C2=B1 48%     -64.7%     262709 =C2=B1 10%  softirqs.CPU149=
.NET_RX
>>        5546 =C2=B1  5%    +220.5%      17776 =C2=B1  5%  softirqs.CPU149=
.RCU
>>      996354 =C2=B1 47%     -67.3%     326223 =C2=B1 12%  softirqs.CPU15.=
NET_RX
>>        5454 =C2=B1  5%    +222.2%      17572 =C2=B1  8%  softirqs.CPU15.=
RCU
>>       22124 =C2=B1 30%     +70.3%      37666        softirqs.CPU15.SCHED
>>      635779 =C2=B1 18%     -57.4%     271013 =C2=B1  5%  softirqs.CPU150=
.NET_RX
>>        5217 =C2=B1  7%    +238.9%      17681 =C2=B1  7%  softirqs.CPU150=
.RCU
>>       32357 =C2=B1  8%     +19.5%      38667        softirqs.CPU150.SCHED
>>      643219 =C2=B1 39%     -58.4%     267686 =C2=B1 13%  softirqs.CPU151=
.NET_RX
>>        5682 =C2=B1 21%    +209.9%      17613 =C2=B1  6%  softirqs.CPU151=
.RCU
>>       31413 =C2=B1 19%     +22.6%      38514        softirqs.CPU151.SCHED
>>      668025 =C2=B1  9%     -60.9%     260917 =C2=B1 15%  softirqs.CPU152=
.NET_RX
>>        4990 =C2=B1  2%    +252.3%      17579 =C2=B1  7%  softirqs.CPU152=
.RCU
>>       31312 =C2=B1  4%     +23.1%      38535        softirqs.CPU152.SCHED
>>      835707 =C2=B1 69%     -70.4%     247281 =C2=B1  8%  softirqs.CPU153=
.NET_RX
>>        5719 =C2=B1 18%    +207.1%      17563 =C2=B1 10%  softirqs.CPU153=
.RCU
>>      774203 =C2=B1 33%     -68.8%     241420 =C2=B1 17%  softirqs.CPU154=
.NET_RX
>>        5151 =C2=B1 11%    +233.2%      17162 =C2=B1  7%  softirqs.CPU154=
.RCU
>>       28774 =C2=B1 20%     +33.0%      38262        softirqs.CPU154.SCHED
>>        4970 =C2=B1  2%    +253.1%      17551 =C2=B1  6%  softirqs.CPU155=
.RCU
>>      872634 =C2=B1 28%     -70.3%     259114 =C2=B1  9%  softirqs.CPU156=
.NET_RX
>>        4899 =C2=B1  4%    +259.2%      17599 =C2=B1  7%  softirqs.CPU156=
.RCU
>>       26066 =C2=B1 23%     +48.6%      38725        softirqs.CPU156.SCHED
>>      747527 =C2=B1 32%     -63.1%     275672 =C2=B1 11%  softirqs.CPU157=
.NET_RX
>>        4905 =C2=B1  5%    +255.0%      17411 =C2=B1  7%  softirqs.CPU157=
.RCU
>>       28984 =C2=B1 19%     +31.6%      38138        softirqs.CPU157.SCHED
>>      764072 =C2=B1 46%     -68.4%     241660 =C2=B1 11%  softirqs.CPU158=
.NET_RX
>>        4841          +256.9%      17277 =C2=B1  6%  softirqs.CPU158.RCU
>>       28804 =C2=B1 29%     +33.8%      38551        softirqs.CPU158.SCHED
>>      701507 =C2=B1 28%     -63.7%     254773 =C2=B1 14%  softirqs.CPU159=
.NET_RX
>>        4818          +255.4%      17127 =C2=B1  7%  softirqs.CPU159.RCU
>>       30348 =C2=B1 14%     +28.0%      38844        softirqs.CPU159.SCHED
>>     1095130 =C2=B1 41%     -70.7%     320706 =C2=B1 15%  softirqs.CPU16.=
NET_RX
>>        5515          +221.8%      17745 =C2=B1  9%  softirqs.CPU16.RCU
>>       21919 =C2=B1 41%     +74.0%      38145        softirqs.CPU16.SCHED
>>      857472 =C2=B1 22%     -68.3%     271489 =C2=B1 18%  softirqs.CPU160=
.NET_RX
>>        5020 =C2=B1  2%    +239.8%      17058 =C2=B1  6%  softirqs.CPU160=
.RCU
>>       25584 =C2=B1 24%     +50.5%      38499        softirqs.CPU160.SCHED
>>     1011388 =C2=B1 28%     -73.2%     270582 =C2=B1 14%  softirqs.CPU161=
.NET_RX
>>        5132 =C2=B1  5%    +237.6%      17328 =C2=B1  7%  softirqs.CPU161=
.RCU
>>       21581 =C2=B1 21%     +78.9%      38616        softirqs.CPU161.SCHED
>>        5064 =C2=B1  6%    +242.4%      17340 =C2=B1  7%  softirqs.CPU162=
.RCU
>>      530886 =C2=B1 39%     -54.0%     244216 =C2=B1 15%  softirqs.CPU163=
.NET_RX
>>        5134 =C2=B1  2%    +230.5%      16968 =C2=B1  7%  softirqs.CPU163=
.RCU
>>      604775 =C2=B1 26%     -57.0%     260093 =C2=B1 18%  softirqs.CPU164=
.NET_RX
>>        5114 =C2=B1  2%    +232.6%      17012 =C2=B1  7%  softirqs.CPU164=
.RCU
>>       32353 =C2=B1 11%     +18.8%      38438        softirqs.CPU164.SCHED
>>        5074 =C2=B1  6%    +236.8%      17088 =C2=B1  7%  softirqs.CPU165=
.RCU
>>      641834 =C2=B1 27%     -58.3%     267963 =C2=B1  7%  softirqs.CPU166=
.NET_RX
>>        5408 =C2=B1  8%    +218.8%      17238 =C2=B1  7%  softirqs.CPU166=
.RCU
>>       31993 =C2=B1 12%     +20.8%      38644        softirqs.CPU166.SCHED
>>      790818 =C2=B1 37%     -65.0%     276391 =C2=B1  8%  softirqs.CPU167=
.NET_RX
>>        5101          +237.9%      17238 =C2=B1  7%  softirqs.CPU167.RCU
>>       27808 =C2=B1 25%     +38.8%      38590        softirqs.CPU167.SCHED
>>      832046 =C2=B1 28%     -61.7%     318923 =C2=B1 11%  softirqs.CPU168=
.NET_RX
>>        4586          +256.3%      16338 =C2=B1  7%  softirqs.CPU168.RCU
>>       26980 =C2=B1 18%     +43.5%      38704        softirqs.CPU168.SCHED
>>      782156 =C2=B1 48%     -64.1%     280591 =C2=B1 15%  softirqs.CPU169=
.NET_RX
>>        4752 =C2=B1  5%    +236.4%      15985 =C2=B1  9%  softirqs.CPU169=
.RCU
>>       28110 =C2=B1 31%     +37.5%      38662 =C2=B1  3%  softirqs.CPU169=
.SCHED
>>     1436583 =C2=B1 11%     -78.9%     302719 =C2=B1 11%  softirqs.CPU17.=
NET_RX
>>        5305 =C2=B1  3%    +223.8%      17180 =C2=B1  8%  softirqs.CPU17.=
RCU
>>       13351 =C2=B1 27%    +185.3%      38084        softirqs.CPU17.SCHED
>>      933080 =C2=B1 49%     -70.2%     278387 =C2=B1  7%  softirqs.CPU170=
.NET_RX
>>        5219 =C2=B1  8%    +209.8%      16169 =C2=B1  7%  softirqs.CPU170=
.RCU
>>       24667 =C2=B1 40%     +57.2%      38768        softirqs.CPU170.SCHED
>>      977241 =C2=B1 55%     -72.3%     270965 =C2=B1 14%  softirqs.CPU171=
.NET_RX
>>        4542          +254.1%      16083 =C2=B1  7%  softirqs.CPU171.RCU
>>       23916 =C2=B1 51%     +62.6%      38876        softirqs.CPU171.SCHED
>>        4755 =C2=B1  2%    +242.0%      16264 =C2=B1  7%  softirqs.CPU172=
.RCU
>>      803537 =C2=B1 40%     -66.7%     267749 =C2=B1 12%  softirqs.CPU173=
.NET_RX
>>        4543          +262.2%      16452 =C2=B1  6%  softirqs.CPU173.RCU
>>       27905 =C2=B1 25%     +37.7%      38419        softirqs.CPU173.SCHED
>>     1148752 =C2=B1 27%     -77.2%     261705 =C2=B1 11%  softirqs.CPU174=
.NET_RX
>>        5801 =C2=B1 34%    +182.2%      16368 =C2=B1  7%  softirqs.CPU174=
.RCU
>>       19703 =C2=B1 42%     +95.9%      38592        softirqs.CPU174.SCHED
>>      721122 =C2=B1 33%     -62.4%     270809 =C2=B1 18%  softirqs.CPU175=
.NET_RX
>>        4671 =C2=B1  5%    +242.8%      16011 =C2=B1  8%  softirqs.CPU175=
.RCU
>>       29516 =C2=B1 20%     +30.7%      38575        softirqs.CPU175.SCHED
>>      826375 =C2=B1 48%     -68.4%     260876 =C2=B1 10%  softirqs.CPU176=
.NET_RX
>>        4828 =C2=B1  9%    +236.0%      16222 =C2=B1  8%  softirqs.CPU176=
.RCU
>>       27129 =C2=B1 31%     +42.0%      38511        softirqs.CPU176.SCHED
>>     1441813 =C2=B1 13%     -82.2%     257318 =C2=B1 10%  softirqs.CPU177=
.NET_RX
>>        4527 =C2=B1  4%    +261.1%      16350 =C2=B1  7%  softirqs.CPU177=
.RCU
>>       12961 =C2=B1 33%    +197.8%      38597        softirqs.CPU177.SCHED
>>        4906 =C2=B1  9%    +233.2%      16347 =C2=B1  8%  softirqs.CPU178=
.RCU
>>      861076 =C2=B1 27%     -69.8%     259918 =C2=B1 14%  softirqs.CPU179=
.NET_RX
>>        4617 =C2=B1  2%    +256.5%      16462 =C2=B1  8%  softirqs.CPU179=
.RCU
>>       26094 =C2=B1 20%     +48.1%      38639        softirqs.CPU179.SCHED
>>     1098723 =C2=B1 24%     -70.2%     327034 =C2=B1 13%  softirqs.CPU18.=
NET_RX
>>        5582 =C2=B1  4%    +201.2%      16813 =C2=B1  8%  softirqs.CPU18.=
RCU
>>       22680 =C2=B1 29%     +67.5%      37997        softirqs.CPU18.SCHED
>>        4455          +258.3%      15961 =C2=B1  7%  softirqs.CPU180.RCU
>>      826449 =C2=B1 42%     -68.5%     260119 =C2=B1 10%  softirqs.CPU181=
.NET_RX
>>        4470          +255.4%      15888 =C2=B1  7%  softirqs.CPU181.RCU
>>       26996 =C2=B1 28%     +40.7%      37975        softirqs.CPU181.SCHED
>>      725117 =C2=B1 17%     -61.2%     281097 =C2=B1  8%  softirqs.CPU182=
.NET_RX
>>        4459 =C2=B1  2%    +257.8%      15955 =C2=B1  8%  softirqs.CPU182=
.RCU
>>       28949 =C2=B1 11%     +33.2%      38553        softirqs.CPU182.SCHED
>>      873833 =C2=B1 25%     -69.3%     268250 =C2=B1 14%  softirqs.CPU183=
.NET_RX
>>        4550          +257.3%      16260 =C2=B1  8%  softirqs.CPU183.RCU
>>       26272 =C2=B1 18%     +47.4%      38728        softirqs.CPU183.SCHED
>>     1034302 =C2=B1 38%     -73.4%     275581 =C2=B1 12%  softirqs.CPU184=
.NET_RX
>>        5229 =C2=B1 10%    +212.5%      16340 =C2=B1  8%  softirqs.CPU184=
.RCU
>>       22137 =C2=B1 45%     +74.7%      38670        softirqs.CPU184.SCHED
>>      914770 =C2=B1 29%     -72.5%     251150 =C2=B1 15%  softirqs.CPU185=
.NET_RX
>>        4506          +262.7%      16342 =C2=B1  9%  softirqs.CPU185.RCU
>>       25315 =C2=B1 24%     +52.8%      38687        softirqs.CPU185.SCHED
>>      752760 =C2=B1 16%     -65.3%     261576 =C2=B1 15%  softirqs.CPU186=
.NET_RX
>>        4448          +279.2%      16867 =C2=B1 11%  softirqs.CPU186.RCU
>>       28391 =C2=B1 10%     +35.9%      38571        softirqs.CPU186.SCHED
>>      622111 =C2=B1 26%     -55.8%     274977 =C2=B1 12%  softirqs.CPU187=
.NET_RX
>>        4484          +262.7%      16262 =C2=B1  8%  softirqs.CPU187.RCU
>>       31749 =C2=B1 10%     +21.3%      38508        softirqs.CPU187.SCHED
>>        4498          +259.3%      16163 =C2=B1  9%  softirqs.CPU188.RCU
>>      745269 =C2=B1 11%     -64.2%     266883 =C2=B1 12%  softirqs.CPU189=
.NET_RX
>>        4423 =C2=B1  2%    +267.7%      16264 =C2=B1  9%  softirqs.CPU189=
.RCU
>>       28913 =C2=B1  6%     +36.3%      39398 =C2=B1  3%  softirqs.CPU189=
.SCHED
>>     1116168 =C2=B1 25%     -71.5%     318126 =C2=B1 20%  softirqs.CPU19.=
NET_RX
>>        5241          +227.2%      17146 =C2=B1  8%  softirqs.CPU19.RCU
>>       22184 =C2=B1 27%     +71.5%      38038        softirqs.CPU19.SCHED
>>      386640 =C2=B1 20%     -32.4%     261421 =C2=B1 14%  softirqs.CPU190=
.NET_RX
>>        4516          +258.8%      16205 =C2=B1  8%  softirqs.CPU190.RCU
>>      736449 =C2=B1 41%     -65.2%     256033 =C2=B1 12%  softirqs.CPU191=
.NET_RX
>>        4692 =C2=B1  3%    +253.5%      16589 =C2=B1  7%  softirqs.CPU191=
.RCU
>>       28479 =C2=B1 24%     +36.3%      38825        softirqs.CPU191.SCHED
>>      779845 =C2=B1  8%     -60.0%     312189 =C2=B1 14%  softirqs.CPU2.N=
ET_RX
>>        5304 =C2=B1  5%    +228.1%      17403 =C2=B1  7%  softirqs.CPU2.R=
CU
>>       29051 =C2=B1  7%     +31.4%      38176        softirqs.CPU2.SCHED
>>     1233384 =C2=B1 12%     -75.2%     305867 =C2=B1 13%  softirqs.CPU20.=
NET_RX
>>        5289          +221.7%      17018 =C2=B1  8%  softirqs.CPU20.RCU
>>       19674 =C2=B1 20%     +94.0%      38162        softirqs.CPU20.SCHED
>>     1183965 =C2=B1 21%     -73.0%     319757 =C2=B1  9%  softirqs.CPU21.=
NET_RX
>>        5189          +243.4%      17821 =C2=B1 11%  softirqs.CPU21.RCU
>>       20730 =C2=B1 25%     +83.6%      38069        softirqs.CPU21.SCHED
>>     1181134 =C2=B1 42%     -73.2%     316958 =C2=B1 13%  softirqs.CPU22.=
NET_RX
>>        5251          +227.8%      17212 =C2=B1  7%  softirqs.CPU22.RCU
>>       19422 =C2=B1 55%     +96.3%      38121        softirqs.CPU22.SCHED
>>     1237919 =C2=B1 13%     -76.5%     291236 =C2=B1 11%  softirqs.CPU23.=
NET_RX
>>        5386 =C2=B1  4%    +215.2%      16975 =C2=B1  9%  softirqs.CPU23.=
RCU
>>       18410 =C2=B1 12%    +107.8%      38260        softirqs.CPU23.SCHED
>>     1164998 =C2=B1 16%     -69.6%     353967 =C2=B1  9%  softirqs.CPU24.=
NET_RX
>>        5212 =C2=B1  2%    +242.4%      17844 =C2=B1  8%  softirqs.CPU24.=
RCU
>>       18812 =C2=B1 29%    +103.7%      38318        softirqs.CPU24.SCHED
>>     1074397 =C2=B1 10%     -70.0%     322114 =C2=B1 18%  softirqs.CPU25.=
NET_RX
>>        5195 =C2=B1  4%    +232.1%      17254 =C2=B1  7%  softirqs.CPU25.=
RCU
>>       20215 =C2=B1  6%     +88.3%      38069        softirqs.CPU25.SCHED
>>     1111065 =C2=B1 42%     -72.7%     303301 =C2=B1 12%  softirqs.CPU26.=
NET_RX
>>        5069          +241.1%      17291 =C2=B1  7%  softirqs.CPU26.RCU
>>       21612 =C2=B1 53%     +75.8%      38000        softirqs.CPU26.SCHED
>>     1242129 =C2=B1 28%     -75.5%     304801 =C2=B1 12%  softirqs.CPU27.=
NET_RX
>>        5199 =C2=B1  4%    +236.0%      17469 =C2=B1  8%  softirqs.CPU27.=
RCU
>>       18406 =C2=B1 45%    +108.0%      38278        softirqs.CPU27.SCHED
>>      980439 =C2=B1  9%     -69.0%     303856 =C2=B1 10%  softirqs.CPU28.=
NET_RX
>>        5230          +232.2%      17374 =C2=B1  7%  softirqs.CPU28.RCU
>>       24472 =C2=B1  9%     +55.5%      38043        softirqs.CPU28.SCHED
>>     1192075 =C2=B1 20%     -76.4%     280869 =C2=B1 20%  softirqs.CPU29.=
NET_RX
>>        5216 =C2=B1  3%    +233.5%      17395 =C2=B1  7%  softirqs.CPU29.=
RCU
>>       19167 =C2=B1 27%     +98.6%      38059        softirqs.CPU29.SCHED
>>     1332056 =C2=B1  9%     -77.7%     297356 =C2=B1  8%  softirqs.CPU3.N=
ET_RX
>>        5370 =C2=B1  4%    +226.3%      17522 =C2=B1  8%  softirqs.CPU3.R=
CU
>>       17127 =C2=B1 18%    +122.0%      38017        softirqs.CPU3.SCHED
>>     1329309 =C2=B1 17%     -77.3%     302026 =C2=B1 13%  softirqs.CPU30.=
NET_RX
>>        5217 =C2=B1  4%    +238.3%      17652 =C2=B1  8%  softirqs.CPU30.=
RCU
>>       16171 =C2=B1 35%    +136.1%      38179        softirqs.CPU30.SCHED
>>     1176327 =C2=B1 21%     -75.1%     292622 =C2=B1  6%  softirqs.CPU31.=
NET_RX
>>        5053          +240.1%      17187 =C2=B1  7%  softirqs.CPU31.RCU
>>       20481 =C2=B1 31%     +86.6%      38223        softirqs.CPU31.SCHED
>>     1026734 =C2=B1 53%     -71.6%     291969 =C2=B1  9%  softirqs.CPU32.=
NET_RX
>>        5199 =C2=B1  3%    +249.8%      18187 =C2=B1  7%  softirqs.CPU32.=
RCU
>>      894623 =C2=B1 39%     -67.1%     294120 =C2=B1 16%  softirqs.CPU33.=
NET_RX
>>        5107 =C2=B1  2%    +261.0%      18436 =C2=B1  8%  softirqs.CPU33.=
RCU
>>       26920 =C2=B1 31%     +42.4%      38329        softirqs.CPU33.SCHED
>>      805032 =C2=B1 39%     -65.6%     277311 =C2=B1 14%  softirqs.CPU34.=
NET_RX
>>        5287 =C2=B1  3%    +248.6%      18433 =C2=B1  7%  softirqs.CPU34.=
RCU
>>       27099 =C2=B1 22%     +40.7%      38119        softirqs.CPU34.SCHED
>>      991001 =C2=B1 25%     -70.5%     292114 =C2=B1 10%  softirqs.CPU35.=
NET_RX
>>        5323 =C2=B1  4%    +248.3%      18543 =C2=B1  8%  softirqs.CPU35.=
RCU
>>       24162 =C2=B1 24%     +59.0%      38410        softirqs.CPU35.SCHED
>>     1312195 =C2=B1 16%     -78.0%     288356 =C2=B1 13%  softirqs.CPU36.=
NET_RX
>>        5133 =C2=B1  4%    +250.1%      17972 =C2=B1  6%  softirqs.CPU36.=
RCU
>>       16381 =C2=B1 31%    +132.2%      38032        softirqs.CPU36.SCHED
>>     1245960 =C2=B1 32%     -76.5%     292954 =C2=B1  8%  softirqs.CPU37.=
NET_RX
>>        5224 =C2=B1  3%    +248.5%      18207 =C2=B1  7%  softirqs.CPU37.=
RCU
>>       18363 =C2=B1 51%    +107.4%      38078        softirqs.CPU37.SCHED
>>        5191 =C2=B1  2%    +248.0%      18066 =C2=B1  7%  softirqs.CPU38.=
RCU
>>     1232139 =C2=B1 18%     -74.5%     314192 =C2=B1  6%  softirqs.CPU39.=
NET_RX
>>        5287 =C2=B1  4%    +248.6%      18434 =C2=B1  7%  softirqs.CPU39.=
RCU
>>       18601 =C2=B1 32%    +104.2%      37990        softirqs.CPU39.SCHED
>>     1347333           -76.9%     310609 =C2=B1 13%  softirqs.CPU4.NET_RX
>>        5307 =C2=B1  2%    +229.0%      17463 =C2=B1  7%  softirqs.CPU4.R=
CU
>>       16503 =C2=B1  5%    +124.8%      37098        softirqs.CPU4.SCHED
>>      897437 =C2=B1 46%     -66.4%     301266 =C2=B1 12%  softirqs.CPU40.=
NET_RX
>>        5175 =C2=B1  2%    +256.6%      18456 =C2=B1  8%  softirqs.CPU40.=
RCU
>>     1243220 =C2=B1 35%     -75.8%     300554 =C2=B1 10%  softirqs.CPU41.=
NET_RX
>>        5625 =C2=B1 13%    +230.2%      18575 =C2=B1  8%  softirqs.CPU41.=
RCU
>>       18304 =C2=B1 57%    +108.6%      38185        softirqs.CPU41.SCHED
>>      883211 =C2=B1 29%     -65.1%     308222 =C2=B1 17%  softirqs.CPU42.=
NET_RX
>>        5114          +251.8%      17993 =C2=B1  8%  softirqs.CPU42.RCU
>>       26545 =C2=B1 22%     +43.9%      38210        softirqs.CPU42.SCHED
>>     1345051 =C2=B1 16%     -77.0%     309227 =C2=B1 14%  softirqs.CPU43.=
NET_RX
>>        5150 =C2=B1  3%    +254.1%      18240 =C2=B1  8%  softirqs.CPU43.=
RCU
>>       16301 =C2=B1 32%    +134.1%      38163        softirqs.CPU43.SCHED
>>      910704 =C2=B1 34%     -64.8%     320350 =C2=B1  7%  softirqs.CPU44.=
NET_RX
>>        5710 =C2=B1 10%    +220.6%      18310 =C2=B1  8%  softirqs.CPU44.=
RCU
>>       25874 =C2=B1 27%     +47.8%      38253        softirqs.CPU44.SCHED
>>     1385863 =C2=B1 17%     -77.5%     312196 =C2=B1 10%  softirqs.CPU45.=
NET_RX
>>        5259 =C2=B1  4%    +249.3%      18371 =C2=B1  8%  softirqs.CPU45.=
RCU
>>       15359 =C2=B1 40%    +146.7%      37885        softirqs.CPU45.SCHED
>>      871017 =C2=B1 27%     -65.2%     303086 =C2=B1 15%  softirqs.CPU46.=
NET_RX
>>        5147 =C2=B1  2%    +256.7%      18361 =C2=B1  7%  softirqs.CPU46.=
RCU
>>       27602 =C2=B1 22%     +38.5%      38237        softirqs.CPU46.SCHED
>>     1409080 =C2=B1 21%     -78.8%     299241 =C2=B1  8%  softirqs.CPU47.=
NET_RX
>>        5239          +255.7%      18637 =C2=B1  7%  softirqs.CPU47.RCU
>>       14646 =C2=B1 52%    +160.6%      38164        softirqs.CPU47.SCHED
>>     1117844 =C2=B1 21%     -69.6%     339425 =C2=B1 12%  softirqs.CPU48.=
NET_RX
>>        5381 =C2=B1  3%    +223.4%      17401 =C2=B1  5%  softirqs.CPU48.=
RCU
>>       20036 =C2=B1 23%     +92.3%      38529 =C2=B1  2%  softirqs.CPU48.=
SCHED
>>      840735 =C2=B1 19%     -63.1%     310542 =C2=B1 16%  softirqs.CPU49.=
NET_RX
>>        5508 =C2=B1  9%    +226.4%      17978 =C2=B1  5%  softirqs.CPU49.=
RCU
>>       26684 =C2=B1 14%     +42.6%      38059        softirqs.CPU49.SCHED
>>     1258154 =C2=B1 24%     -75.2%     312071 =C2=B1  9%  softirqs.CPU5.N=
ET_RX
>>        5561 =C2=B1  6%    +216.4%      17594 =C2=B1  8%  softirqs.CPU5.R=
CU
>>       19399 =C2=B1 38%     +96.1%      38049        softirqs.CPU5.SCHED
>>     1290329 =C2=B1  5%     -78.1%     282085 =C2=B1  9%  softirqs.CPU50.=
NET_RX
>>        6175 =C2=B1 13%    +188.5%      17814 =C2=B1  6%  softirqs.CPU50.=
RCU
>>       16317 =C2=B1  4%    +133.9%      38165        softirqs.CPU50.SCHED
>>     1019381 =C2=B1 35%     -70.9%     296422 =C2=B1 18%  softirqs.CPU51.=
NET_RX
>>        5323          +234.9%      17828 =C2=B1  6%  softirqs.CPU51.RCU
>>       22717 =C2=B1 31%     +68.6%      38291        softirqs.CPU51.SCHED
>>      972274 =C2=B1 43%     -69.1%     300206 =C2=B1 16%  softirqs.CPU52.=
NET_RX
>>        5426 =C2=B1  4%    +230.8%      17947 =C2=B1  6%  softirqs.CPU52.=
RCU
>>       24388 =C2=B1 38%     +56.6%      38179        softirqs.CPU52.SCHED
>>     1059926 =C2=B1 35%     -71.6%     301419 =C2=B1 12%  softirqs.CPU53.=
NET_RX
>>        5691 =C2=B1  8%    +215.5%      17955 =C2=B1  6%  softirqs.CPU53.=
RCU
>>       22225 =C2=B1 35%     +72.3%      38291        softirqs.CPU53.SCHED
>>     1124170 =C2=B1 12%     -72.1%     313243 =C2=B1 10%  softirqs.CPU54.=
NET_RX
>>        5412 =C2=B1  2%    +242.9%      18562 =C2=B1 11%  softirqs.CPU54.=
RCU
>>       20158 =C2=B1 14%     +87.4%      37784        softirqs.CPU54.SCHED
>>     1158216 =C2=B1 25%     -73.4%     307943 =C2=B1 11%  softirqs.CPU55.=
NET_RX
>>        5328 =C2=B1  3%    +235.6%      17882 =C2=B1  6%  softirqs.CPU55.=
RCU
>>       19841 =C2=B1 32%     +91.5%      37991        softirqs.CPU55.SCHED
>>     1100047 =C2=B1  7%     -72.9%     297828 =C2=B1 14%  softirqs.CPU56.=
NET_RX
>>        5233 =C2=B1  2%    +241.9%      17894 =C2=B1  6%  softirqs.CPU56.=
RCU
>>       20486 =C2=B1  4%     +86.2%      38143        softirqs.CPU56.SCHED
>>        5181 =C2=B1  4%    +241.5%      17693 =C2=B1  7%  softirqs.CPU57.=
RCU
>>     1030974 =C2=B1 26%     -73.1%     276839 =C2=B1 19%  softirqs.CPU58.=
NET_RX
>>        5179          +234.0%      17296 =C2=B1  6%  softirqs.CPU58.RCU
>>       22840 =C2=B1 31%     +66.9%      38129        softirqs.CPU58.SCHED
>>     1389824 =C2=B1 24%     -77.9%     307690 =C2=B1  8%  softirqs.CPU59.=
NET_RX
>>        5252 =C2=B1  2%    +241.5%      17938 =C2=B1  6%  softirqs.CPU59.=
RCU
>>       14539 =C2=B1 51%    +162.8%      38210        softirqs.CPU59.SCHED
>>     1296100 =C2=B1 20%     -75.9%     312963 =C2=B1 10%  softirqs.CPU6.N=
ET_RX
>>        5249 =C2=B1  3%    +234.6%      17563 =C2=B1  8%  softirqs.CPU6.R=
CU
>>       18158 =C2=B1 29%    +110.3%      38194        softirqs.CPU6.SCHED
>>      905022 =C2=B1 28%     -67.4%     294614 =C2=B1 10%  softirqs.CPU60.=
NET_RX
>>        5423 =C2=B1  3%    +230.0%      17898 =C2=B1  6%  softirqs.CPU60.=
RCU
>>       26187 =C2=B1 21%     +45.8%      38170        softirqs.CPU60.SCHED
>>     1010705 =C2=B1 25%     -69.6%     307548 =C2=B1  4%  softirqs.CPU61.=
NET_RX
>>        5309          +233.3%      17697 =C2=B1  6%  softirqs.CPU61.RCU
>>       23611 =C2=B1 23%     +60.7%      37942        softirqs.CPU61.SCHED
>>     1012623 =C2=B1 35%     -72.6%     277411 =C2=B1 10%  softirqs.CPU62.=
NET_RX
>>        5374 =C2=B1  2%    +230.0%      17737 =C2=B1  6%  softirqs.CPU62.=
RCU
>>       23213 =C2=B1 38%     +64.4%      38170        softirqs.CPU62.SCHED
>>     1104829 =C2=B1 19%     -72.3%     306121 =C2=B1 13%  softirqs.CPU63.=
NET_RX
>>        5172 =C2=B1  4%    +239.6%      17566 =C2=B1  6%  softirqs.CPU63.=
RCU
>>       21294 =C2=B1 20%     +78.9%      38088        softirqs.CPU63.SCHED
>>      919625 =C2=B1 21%     -66.0%     312753 =C2=B1 14%  softirqs.CPU64.=
NET_RX
>>        5193          +242.0%      17757 =C2=B1  6%  softirqs.CPU64.RCU
>>       26150 =C2=B1 19%     +44.9%      37888        softirqs.CPU64.SCHED
>>      791716 =C2=B1 35%     -59.3%     322468 =C2=B1 13%  softirqs.CPU65.=
NET_RX
>>        5363          +236.5%      18046 =C2=B1  6%  softirqs.CPU65.RCU
>>       28357 =C2=B1 25%     +34.2%      38055        softirqs.CPU65.SCHED
>>     1312986 =C2=B1 20%     -78.1%     287656 =C2=B1 16%  softirqs.CPU66.=
NET_RX
>>        5389 =C2=B1  2%    +233.5%      17972 =C2=B1  7%  softirqs.CPU66.=
RCU
>>       16705 =C2=B1 39%    +127.5%      37998        softirqs.CPU66.SCHED
>>     1239719 =C2=B1 14%     -76.5%     291072 =C2=B1 14%  softirqs.CPU67.=
NET_RX
>>        5362          +229.8%      17686 =C2=B1  7%  softirqs.CPU67.RCU
>>       17947 =C2=B1 25%    +112.1%      38067        softirqs.CPU67.SCHED
>>     1190454 =C2=B1 15%     -74.4%     304163 =C2=B1 15%  softirqs.CPU68.=
NET_RX
>>        5434 =C2=B1  3%    +226.8%      17762 =C2=B1  7%  softirqs.CPU68.=
RCU
>>       19579 =C2=B1 19%     +95.4%      38252        softirqs.CPU68.SCHED
>>     1105716 =C2=B1 45%     -72.1%     308498 =C2=B1 13%  softirqs.CPU69.=
NET_RX
>>        5407          +230.3%      17857 =C2=B1  6%  softirqs.CPU69.RCU
>>     1446467 =C2=B1 25%     -78.5%     311179 =C2=B1  8%  softirqs.CPU7.N=
ET_RX
>>        5355 =C2=B1  3%    +226.4%      17479 =C2=B1  7%  softirqs.CPU7.R=
CU
>>       14928 =C2=B1 50%    +153.4%      37827        softirqs.CPU7.SCHED
>>     1134423 =C2=B1 10%     -73.0%     305951 =C2=B1 10%  softirqs.CPU70.=
NET_RX
>>        5318          +240.1%      18089 =C2=B1  8%  softirqs.CPU70.RCU
>>       20041 =C2=B1 17%     +90.0%      38072        softirqs.CPU70.SCHED
>>     1005130 =C2=B1 32%     -68.6%     316109 =C2=B1  9%  softirqs.CPU71.=
NET_RX
>>        5460 =C2=B1  3%    +226.7%      17841 =C2=B1  7%  softirqs.CPU71.=
RCU
>>       24140 =C2=B1 31%     +56.9%      37877        softirqs.CPU71.SCHED
>>     1042259 =C2=B1 18%     -66.3%     351008 =C2=B1 11%  softirqs.CPU72.=
NET_RX
>>        4815          +246.9%      16703 =C2=B1  8%  softirqs.CPU72.RCU
>>       21446 =C2=B1 21%     +79.9%      38591 =C2=B1  2%  softirqs.CPU72.=
SCHED
>>     1036011 =C2=B1 31%     -68.9%     322259 =C2=B1 10%  softirqs.CPU73.=
NET_RX
>>        4921 =C2=B1  2%    +238.4%      16652 =C2=B1  8%  softirqs.CPU73.=
RCU
>>       22119 =C2=B1 34%     +71.3%      37897        softirqs.CPU73.SCHED
>>      858128 =C2=B1 48%     -62.9%     318741 =C2=B1  9%  softirqs.CPU74.=
NET_RX
>>        5980 =C2=B1 12%    +181.1%      16807 =C2=B1  7%  softirqs.CPU74.=
RCU
>>       26741 =C2=B1 35%     +42.5%      38105        softirqs.CPU74.SCHED
>>        5179 =C2=B1  2%    +223.2%      16738 =C2=B1  8%  softirqs.CPU75.=
RCU
>>     1477485 =C2=B1  7%     -80.5%     287802 =C2=B1 14%  softirqs.CPU76.=
NET_RX
>>        4841          +248.0%      16844 =C2=B1  8%  softirqs.CPU76.RCU
>>       12068 =C2=B1 12%    +215.9%      38128        softirqs.CPU76.SCHED
>>     1005490 =C2=B1 29%     -69.3%     308208 =C2=B1  9%  softirqs.CPU77.=
NET_RX
>>        4885          +248.5%      17028 =C2=B1  8%  softirqs.CPU77.RCU
>>       23080 =C2=B1 33%     +64.2%      37893        softirqs.CPU77.SCHED
>>      687769 =C2=B1 41%     -56.8%     297227 =C2=B1 11%  softirqs.CPU78.=
NET_RX
>>        4849          +255.2%      17224 =C2=B1  5%  softirqs.CPU78.RCU
>>     1072165 =C2=B1 23%     -72.0%     299887 =C2=B1 15%  softirqs.CPU79.=
NET_RX
>>        4782          +241.3%      16321 =C2=B1 10%  softirqs.CPU79.RCU
>>       21789 =C2=B1 23%     +76.7%      38492 =C2=B1  3%  softirqs.CPU79.=
SCHED
>>     1335986 =C2=B1  9%     -76.0%     320693 =C2=B1 11%  softirqs.CPU8.N=
ET_RX
>>        5337 =C2=B1  2%    +225.7%      17381 =C2=B1  8%  softirqs.CPU8.R=
CU
>>       17494 =C2=B1 14%    +114.3%      37490 =C2=B1  2%  softirqs.CPU8.S=
CHED
>>      943421 =C2=B1 40%     -67.6%     305653 =C2=B1 13%  softirqs.CPU80.=
NET_RX
>>        4890 =C2=B1  2%    +256.2%      17416 =C2=B1  8%  softirqs.CPU80.=
RCU
>>       24125 =C2=B1 34%     +57.2%      37920        softirqs.CPU80.SCHED
>>        4732 =C2=B1  2%    +263.0%      17179 =C2=B1  8%  softirqs.CPU81.=
RCU
>>     1178720 =C2=B1 27%     -72.9%     319521 =C2=B1 13%  softirqs.CPU82.=
NET_RX
>>        4726          +263.3%      17171 =C2=B1  8%  softirqs.CPU82.RCU
>>       19193 =C2=B1 36%     +98.4%      38072        softirqs.CPU82.SCHED
>>      963450 =C2=B1 25%     -68.6%     302594 =C2=B1 13%  softirqs.CPU83.=
NET_RX
>>        4861          +256.0%      17306 =C2=B1  8%  softirqs.CPU83.RCU
>>       24058 =C2=B1 27%     +57.6%      37919        softirqs.CPU83.SCHED
>>     1297794 =C2=B1 15%     -76.2%     309477 =C2=B1 12%  softirqs.CPU84.=
NET_RX
>>        5137 =C2=B1  8%    +234.3%      17172 =C2=B1  6%  softirqs.CPU84.=
RCU
>>       16306 =C2=B1 23%    +133.1%      38005        softirqs.CPU84.SCHED
>>     1002585 =C2=B1 34%     -70.4%     296532 =C2=B1 12%  softirqs.CPU85.=
NET_RX
>>        4779          +258.5%      17136 =C2=B1  6%  softirqs.CPU85.RCU
>>       22988 =C2=B1 33%     +66.2%      38200        softirqs.CPU85.SCHED
>>     1092887 =C2=B1 13%     -71.0%     317385 =C2=B1  9%  softirqs.CPU86.=
NET_RX
>>        4721          +263.4%      17157 =C2=B1  8%  softirqs.CPU86.RCU
>>       21265 =C2=B1 11%     +78.7%      38002        softirqs.CPU86.SCHED
>>      911742 =C2=B1 20%     -66.8%     303076 =C2=B1 10%  softirqs.CPU87.=
NET_RX
>>        4899 =C2=B1  6%    +252.3%      17259 =C2=B1  7%  softirqs.CPU87.=
RCU
>>       25375 =C2=B1 19%     +49.7%      37995        softirqs.CPU87.SCHED
>>        4782          +260.5%      17238 =C2=B1  7%  softirqs.CPU88.RCU
>>      872318 =C2=B1 29%     -64.5%     309398 =C2=B1 14%  softirqs.CPU89.=
NET_RX
>>        4743          +264.4%      17284 =C2=B1  8%  softirqs.CPU89.RCU
>>       26011 =C2=B1 23%     +45.9%      37950        softirqs.CPU89.SCHED
>>     1050010 =C2=B1 31%     -70.3%     311865 =C2=B1 16%  softirqs.CPU9.N=
ET_RX
>>        5239 =C2=B1  2%    +230.4%      17311 =C2=B1  7%  softirqs.CPU9.R=
CU
>>       23288 =C2=B1 27%     +63.9%      38162        softirqs.CPU9.SCHED
>>     1048107 =C2=B1  9%     -70.0%     314815 =C2=B1 14%  softirqs.CPU90.=
NET_RX
>>        4682          +271.6%      17396 =C2=B1  7%  softirqs.CPU90.RCU
>>       22266 =C2=B1  9%     +70.5%      37967        softirqs.CPU90.SCHED
>>     1164391 =C2=B1 14%     -72.1%     324617 =C2=B1  9%  softirqs.CPU91.=
NET_RX
>>        4717          +268.7%      17395 =C2=B1  7%  softirqs.CPU91.RCU
>>       19393 =C2=B1 24%     +96.0%      38009        softirqs.CPU91.SCHED
>>     1262650 =C2=B1 16%     -74.6%     321277 =C2=B1 13%  softirqs.CPU92.=
NET_RX
>>        4772          +273.6%      17831 =C2=B1 11%  softirqs.CPU92.RCU
>>       16181 =C2=B1 21%    +137.0%      38348        softirqs.CPU92.SCHED
>>     1020555 =C2=B1  8%     -68.5%     321451 =C2=B1 10%  softirqs.CPU93.=
NET_RX
>>        4705 =C2=B1  2%    +266.2%      17230 =C2=B1  9%  softirqs.CPU93.=
RCU
>>       22589 =C2=B1 10%     +69.4%      38270        softirqs.CPU93.SCHED
>>     1431195 =C2=B1  6%     -78.4%     309843 =C2=B1 14%  softirqs.CPU94.=
NET_RX
>>        4659          +269.4%      17213 =C2=B1  9%  softirqs.CPU94.RCU
>>       13298 =C2=B1  9%    +188.5%      38362 =C2=B1  2%  softirqs.CPU94.=
SCHED
>>     1012879 =C2=B1 27%     -70.1%     302707 =C2=B1 12%  softirqs.CPU95.=
NET_RX
>>        4789 =C2=B1  4%    +265.3%      17492 =C2=B1  5%  softirqs.CPU95.=
RCU
>>       15915 =C2=B1 27%    +137.9%      37854        softirqs.CPU95.SCHED
>>     1075360 =C2=B1 21%     -71.3%     308092 =C2=B1 11%  softirqs.CPU96.=
NET_RX
>>        5122 =C2=B1  5%    +229.0%      16853 =C2=B1  6%  softirqs.CPU96.=
RCU
>>       22688 =C2=B1 24%     +66.9%      37857        softirqs.CPU96.SCHED
>>        5069          +234.5%      16956 =C2=B1  6%  softirqs.CPU97.RCU
>>      998146 =C2=B1 14%     -72.8%     271312 =C2=B1 17%  softirqs.CPU98.=
NET_RX
>>        5085          +234.0%      16986 =C2=B1  6%  softirqs.CPU98.RCU
>>       23290 =C2=B1  6%     +66.3%      38736        softirqs.CPU98.SCHED
>>      488330 =C2=B1 35%     -47.2%     257938 =C2=B1 15%  softirqs.CPU99.=
NET_RX
>>        5289 =C2=B1  4%    +226.3%      17259 =C2=B1  8%  softirqs.CPU99.=
RCU
>>   1.741e+08           -68.2%   55284221 =C2=B1  9%  softirqs.NET_RX
>>      986127          +237.0%    3323621 =C2=B1  7%  softirqs.RCU
>>     4913766           +49.8%    7361050        softirqs.SCHED
>>      167438           -29.3%     118387        softirqs.TIMER
>>       22.11           -22.0        0.09 =C2=B1223%  perf-profile.calltra=
ce.cycles-pp._raw_spin_lock_irqsave.rmqueue.get_page_from_freelist.__alloc_=
pages_nodemask.kmalloc_large_node
>>       21.90           -21.9        0.00        perf-profile.calltrace.cy=
cles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rmqueue.get=
_page_from_freelist.__alloc_pages_nodemask
>>       22.89           -21.8        1.12 =C2=B1 19%  perf-profile.calltra=
ce.cycles-pp.rmqueue.get_page_from_freelist.__alloc_pages_nodemask.kmalloc_=
large_node.__kmalloc_node_track_caller
>>       23.17           -21.6        1.60 =C2=B1 16%  perf-profile.calltra=
ce.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.kmalloc_large_no=
de.__kmalloc_node_track_caller.kmalloc_reserve
>>       23.31           -21.4        1.89 =C2=B1 16%  perf-profile.calltra=
ce.cycles-pp.__alloc_pages_nodemask.kmalloc_large_node.__kmalloc_node_track=
_caller.kmalloc_reserve.__alloc_skb
>>       52.02           -18.2       33.83 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.sctp_sendmsg.sock_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys=
_sendmsg
>>       52.12           -18.0       34.17 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.sock_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_s=
yscall_64
>>       17.39           -17.3        0.11 =C2=B1223%  perf-profile.calltra=
ce.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.free_one_page.=
__free_pages_ok.consume_skb
>>       17.57           -17.2        0.33 =C2=B1107%  perf-profile.calltra=
ce.cycles-pp._raw_spin_lock.free_one_page.__free_pages_ok.consume_skb.sctp_=
chunk_put
>>       52.45           -17.2       35.28 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
>>       17.85           -17.1        0.76 =C2=B1 53%  perf-profile.calltra=
ce.cycles-pp.free_one_page.__free_pages_ok.consume_skb.sctp_chunk_put.sctp_=
outq_sack
>>       18.02           -17.1        0.97 =C2=B1 50%  perf-profile.calltra=
ce.cycles-pp.__free_pages_ok.consume_skb.sctp_chunk_put.sctp_outq_sack.sctp=
_cmd_interpreter
>>       18.25           -16.7        1.53 =C2=B1 47%  perf-profile.calltra=
ce.cycles-pp.consume_skb.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpreter=
.sctp_do_sm
>>       18.33           -16.6        1.68 =C2=B1 47%  perf-profile.calltra=
ce.cycles-pp.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.=
sctp_assoc_bh_rcv
>>       18.25           -16.5        1.75 =C2=B1 47%  perf-profile.calltra=
ce.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb._sctp_=
make_chunk.sctp_make_datafrag_empty
>>       18.26           -16.5        1.77 =C2=B1 47%  perf-profile.calltra=
ce.cycles-pp.kmalloc_reserve.__alloc_skb._sctp_make_chunk.sctp_make_datafra=
g_empty.sctp_datamsg_from_user
>>       52.76           -16.4       36.38 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>>       18.53           -16.3        2.21 =C2=B1 47%  perf-profile.calltra=
ce.cycles-pp.__alloc_skb._sctp_make_chunk.sctp_make_datafrag_empty.sctp_dat=
amsg_from_user.sctp_sendmsg_to_asoc
>>       18.24           -16.2        2.03 =C2=B1 15%  perf-profile.calltra=
ce.cycles-pp.kmalloc_large_node.__kmalloc_node_track_caller.kmalloc_reserve=
.__alloc_skb._sctp_make_chunk
>>       52.84           -16.2       36.63 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>       18.67           -16.1        2.56 =C2=B1 47%  perf-profile.calltra=
ce.cycles-pp._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from_us=
er.sctp_sendmsg_to_asoc.sctp_sendmsg
>>       18.81           -15.9        2.91 =C2=B1 13%  perf-profile.calltra=
ce.cycles-pp.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_r=
cv.sctp_backlog_rcv
>>       18.83           -15.8        3.02 =C2=B1 47%  perf-profile.calltra=
ce.cycles-pp.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendmsg_t=
o_asoc.sctp_sendmsg.sock_sendmsg
>>       61.08 =C2=B1  2%     -15.7       45.39 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>       61.25 =C2=B1  2%     -15.1       46.14 =C2=B1  9%  perf-profile.ca=
lltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>>       23.42           -14.0        9.43 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.sctp_assoc_bh_rcv.sctp_backlog_rcv.__release_sock.release_sock=
.sctp_sendmsg
>>       23.42           -14.0        9.45 =C2=B1 11%  perf-profile.calltra=
ce.cycles-pp.sctp_do_sm.sctp_assoc_bh_rcv.sctp_backlog_rcv.__release_sock.r=
elease_sock
>>       23.50           -13.9        9.63 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sctp_backlog=
_rcv.__release_sock
>>       24.21           -13.4       10.85 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.sctp_backlog_rcv.__release_sock.release_sock.sctp_sendmsg.sock=
_sendmsg
>>       24.23           -12.7       11.48 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.__release_sock.release_sock.sctp_sendmsg.sock_sendmsg.____sys_=
sendmsg
>>       24.26           -12.7       11.58 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.release_sock.sctp_sendmsg.sock_sendmsg.____sys_sendmsg.___sys_=
sendmsg
>>       21.22           -10.8       10.46 =C2=B1 11%  perf-profile.calltra=
ce.cycles-pp.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_=
sendmsg.____sys_sendmsg
>>       27.33            -6.3       21.01 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg.____sys_sendmsg=
.___sys_sendmsg
>>        5.16            -5.1        0.09 =C2=B1223%  perf-profile.calltra=
ce.cycles-pp.kmalloc_reserve.__alloc_skb.sctp_packet_transmit.sctp_outq_flu=
sh.sctp_cmd_interpreter
>>        5.16            -5.1        0.09 =C2=B1223%  perf-profile.calltra=
ce.cycles-pp.__kmalloc_node_track_caller.kmalloc_reserve.__alloc_skb.sctp_p=
acket_transmit.sctp_outq_flush
>>        5.16            -5.1        0.09 =C2=B1223%  perf-profile.calltra=
ce.cycles-pp.kmalloc_large_node.__kmalloc_node_track_caller.kmalloc_reserve=
.__alloc_skb.sctp_packet_transmit
>>        5.22            -5.0        0.19 =C2=B1223%  perf-profile.calltra=
ce.cycles-pp.__alloc_skb.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_inte=
rpreter.sctp_do_sm
>>        4.80 =C2=B1 20%      -4.1        0.74 =C2=B1 11%  perf-profile.ca=
lltrace.cycles-pp.kfree_skb.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sy=
s_recvmsg
>>        0.83 =C2=B1 18%      +0.5        1.30 =C2=B1 11%  perf-profile.ca=
lltrace.cycles-pp.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg.____sys_=
recvmsg.___sys_recvmsg
>>        0.00            +0.5        0.55 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.preempt_schedule_common.__cond_resched.__release_sock.release_=
sock.sctp_sendmsg
>>        0.00            +0.6        0.56 =C2=B1  6%  perf-profile.calltra=
ce.cycles-pp.__cond_resched.__release_sock.release_sock.sctp_sendmsg.sock_s=
endmsg
>>        0.00            +0.6        0.56 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.sctp_ulpevent_make_rcvmsg.sctp_ulpq_tail_data.sctp_cmd_interpr=
eter.sctp_do_sm.sctp_assoc_bh_rcv
>>        0.00            +0.6        0.62 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.ktime_get.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt
>>        0.00            +0.6        0.65 =C2=B1  2%  perf-profile.calltra=
ce.cycles-pp.rebalance_domains.__softirqentry_text_start.irq_exit_rcu.sysve=
c_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>>        0.00            +0.7        0.66 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.__copy_msghdr_from_user.copy_msghdr_from_user.sendmsg_copy_msg=
hdr.___sys_sendmsg.__sys_sendmsg
>>        0.00            +0.7        0.70 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.timekeeping_max_deferment.tick_nohz_next_event.tick_nohz_get_s=
leep_length.menu_select.do_idle
>>        0.00            +0.7        0.72 =C2=B1  4%  perf-profile.calltra=
ce.cycles-pp.copy_msghdr_from_user.recvmsg_copy_msghdr.___sys_recvmsg.__sys=
_recvmsg.do_syscall_64
>>        0.00            +0.7        0.73 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.sctp_ulpq_tail_event.sctp_ulpq_tail_data.sctp_cmd_interpreter.=
sctp_do_sm.sctp_assoc_bh_rcv
>>        0.00            +0.7        0.73 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_=
rcv.sctp_rcv
>>        0.00            +0.7        0.74 =C2=B1  4%  perf-profile.calltra=
ce.cycles-pp.recvmsg_copy_msghdr.___sys_recvmsg.__sys_recvmsg.do_syscall_64=
.entry_SYSCALL_64_after_hwframe
>>        0.00            +0.7        0.74 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_s=
ysvec_apic_timer_interrupt.cpuidle_enter_state
>>        0.00            +0.8        0.76 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.irq_enter_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_time=
r_interrupt.cpuidle_enter_state.cpuidle_enter
>>        0.00            +0.8        0.83 =C2=B1 12%  perf-profile.calltra=
ce.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.__sysvec=
_apic_timer_interrupt.sysvec_apic_timer_interrupt
>>        1.10 =C2=B1  2%      +0.9        2.04 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.sctp_ulpq_tail_data.sctp_cmd_interpreter.sctp_do_sm.sctp_=
assoc_bh_rcv.sctp_rcv
>>        0.00            +1.0        0.95 =C2=B1 14%  perf-profile.calltra=
ce.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrti=
mer_run_queues.hrtimer_interrupt
>>        0.00            +1.0        0.96 =C2=B1 14%  perf-profile.calltra=
ce.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtime=
r_interrupt.__sysvec_apic_timer_interrupt
>>        0.00            +1.0        1.02 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.copy_msghdr_from_user.sendmsg_copy_msghdr.___sys_sendmsg.__sys=
_sendmsg.do_syscall_64
>>        0.00            +1.0        1.03 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.sendmsg_copy_msghdr.___sys_sendmsg.__sys_sendmsg.do_syscall_64=
.entry_SYSCALL_64_after_hwframe
>>        0.00            +1.0        1.03 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do=
_idle.cpu_startup_entry
>>        0.00            +1.1        1.06 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.__softirqentry_text_start.irq_exit_rcu.sysvec_apic_timer_inter=
rupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>>        0.00            +1.1        1.06 =C2=B1 12%  perf-profile.calltra=
ce.cycles-pp.__schedule.schedule.schedule_timeout.sctp_skb_recv_datagram.sc=
tp_recvmsg
>>        0.00            +1.1        1.09 =C2=B1 12%  perf-profile.calltra=
ce.cycles-pp.schedule.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.=
inet_recvmsg
>>        0.00            +1.1        1.10 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_time=
r_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>>        0.00            +1.1        1.11 =C2=B1 12%  perf-profile.calltra=
ce.cycles-pp.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recv=
msg.____sys_recvmsg
>>        0.00            +1.1        1.13 =C2=B1  5%  perf-profile.calltra=
ce.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_ent=
ry.start_secondary
>>        0.00            +1.1        1.14 =C2=B1 13%  perf-profile.calltra=
ce.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__sysv=
ec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>>        0.00            +1.4        1.45 =C2=B1  4%  perf-profile.calltra=
ce.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer=
_interrupt.cpuidle_enter_state.cpuidle_enter
>>        0.00            +1.7        1.65 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_int=
errupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>>        1.57 =C2=B1  2%      +1.7        3.26 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sctp_rc=
v.ip_protocol_deliver_rcu
>>        1.13 =C2=B1 29%      +1.7        2.86 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.copy_user_enhanced_fast_string.copyout._copy_to_iter.__sk=
b_datagram_iter.skb_copy_datagram_iter
>>        1.14 =C2=B1 30%      +1.7        2.88 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.copyout._copy_to_iter.__skb_datagram_iter.skb_copy_datagr=
am_iter.sctp_recvmsg
>>        1.19 =C2=B1 30%      +1.8        3.00 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.=
sctp_recvmsg.inet_recvmsg
>>        1.36 =C2=B1 29%      +1.9        3.24 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.sctp_recvmsg.i=
net_recvmsg.____sys_recvmsg
>>        1.36 =C2=B1 30%      +1.9        3.25 =C2=B1  7%  perf-profile.ca=
lltrace.cycles-pp.skb_copy_datagram_iter.sctp_recvmsg.inet_recvmsg.____sys_=
recvmsg.___sys_recvmsg
>>        1.79 =C2=B1  2%      +2.0        3.76 =C2=B1  5%  perf-profile.ca=
lltrace.cycles-pp.sctp_do_sm.sctp_assoc_bh_rcv.sctp_rcv.ip_protocol_deliver=
_rcu.ip_local_deliver_finish
>>        1.92 =C2=B1  2%      +2.3        4.20 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.sctp_assoc_bh_rcv.sctp_rcv.ip_protocol_deliver_rcu.ip_loc=
al_deliver_finish.ip_local_deliver
>>        5.27            +2.3        7.54 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_=
rcv.sctp_backlog_rcv
>>        5.06            +2.5        7.54 =C2=B1  9%  perf-profile.calltra=
ce.cycles-pp.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_interpreter.sctp=
_do_sm.sctp_assoc_bh_rcv
>>        2.36 =C2=B1  2%      +2.9        5.27 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.sctp_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.=
ip_local_deliver.ip_rcv
>>        2.39 =C2=B1  2%      +3.0        5.37 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.ip_local_=
deliver.ip_rcv.__netif_receive_skb_one_core
>>        2.40 =C2=B1  2%      +3.0        5.39 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ip_local_deliver_finish.ip_local_deliver.ip_rcv.__netif_r=
eceive_skb_one_core.process_backlog
>>        2.40 =C2=B1  2%      +3.0        5.42 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ip_local_deliver.ip_rcv.__netif_receive_skb_one_core.proc=
ess_backlog.__napi_poll
>>        2.45 =C2=B1  2%      +3.1        5.55 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ip_rcv.__netif_receive_skb_one_core.process_backlog.__nap=
i_poll.net_rx_action
>>        2.48 =C2=B1  2%      +3.2        5.67 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.=
net_rx_action.__softirqentry_text_start
>>        0.00            +3.2        3.23 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_ti=
mer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>>        0.00            +3.3        3.27 =C2=B1  7%  perf-profile.calltra=
ce.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_=
sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
>>        2.52 =C2=B1  2%      +3.3        5.82 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.process_backlog.__napi_poll.net_rx_action.__softirqentry_=
text_start.do_softirq
>>        2.53 =C2=B1  2%      +3.3        5.83 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__napi_poll.net_rx_action.__softirqentry_text_start.do_so=
ftirq.__local_bh_enable_ip
>>        2.56 =C2=B1  2%      +3.3        5.91 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.net_rx_action.__softirqentry_text_start.do_softirq.__loca=
l_bh_enable_ip.ip_finish_output2
>>        2.63 =C2=B1  2%      +3.4        6.05 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__softirqentry_text_start.do_softirq.__local_bh_enable_ip=
.ip_finish_output2.ip_output
>>        2.64 =C2=B1  2%      +3.5        6.10 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_outp=
ut.__ip_queue_xmit
>>        2.65 =C2=B1  2%      +3.5        6.14 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__local_bh_enable_ip.ip_finish_output2.ip_output.__ip_que=
ue_xmit.sctp_packet_transmit
>>        2.72 =C2=B1  2%      +3.7        6.41 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.sctp_packet_t=
ransmit.sctp_outq_flush
>>        2.77 =C2=B1  2%      +3.8        6.52 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.ip_output.__ip_queue_xmit.sctp_packet_transmit.sctp_outq_=
flush.sctp_cmd_interpreter
>>        2.79 =C2=B1  2%      +3.8        6.62 =C2=B1  6%  perf-profile.ca=
lltrace.cycles-pp.__ip_queue_xmit.sctp_packet_transmit.sctp_outq_flush.sctp=
_cmd_interpreter.sctp_do_sm
>>        0.00            +4.4        4.35 =C2=B1 11%  perf-profile.calltra=
ce.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondar=
y_startup_64_no_verify
>>        2.12            +4.5        6.63 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.memcpy_erms.sctp_packet_pack.sctp_packet_transmit.sctp_outq_fl=
ush.sctp_cmd_interpreter
>>        2.21            +4.7        6.90 =C2=B1 10%  perf-profile.calltra=
ce.cycles-pp.sctp_packet_pack.sctp_packet_transmit.sctp_outq_flush.sctp_cmd=
_interpreter.sctp_do_sm
>>        0.00            +6.1        6.06 =C2=B1  3%  perf-profile.calltra=
ce.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cp=
uidle_enter_state.cpuidle_enter.do_idle
>>       37.56 =C2=B1  3%      +7.6       45.15 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_ent=
ry.start_secondary
>>       37.57 =C2=B1  3%     +10.1       47.67 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.s=
econdary_startup_64_no_verify
>>        0.00           +11.2       11.16 =C2=B1  8%  perf-profile.calltra=
ce.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_en=
ter.do_idle.cpu_startup_entry
>>       38.28 =C2=B1  3%     +14.1       52.37 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_start=
up_64_no_verify
>>       38.29 =C2=B1  3%     +14.1       52.38 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no=
_verify
>>       38.29 =C2=B1  3%     +14.1       52.38 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>>       38.40 =C2=B1  3%     +14.3       52.66 =C2=B1  8%  perf-profile.ca=
lltrace.cycles-pp.secondary_startup_64_no_verify
>>       43.97           -43.2        0.80 =C2=B1 30%  perf-profile.childre=
n.cycles-pp.native_queued_spin_lock_slowpath
>>       22.23           -21.5        0.74 =C2=B1 16%  perf-profile.childre=
n.cycles-pp._raw_spin_lock_irqsave
>>       22.91           -21.3        1.58 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.rmqueue
>>       22.43 =C2=B1  3%     -21.2        1.19 =C2=B1 22%  perf-profile.ch=
ildren.cycles-pp.free_one_page
>>       22.68 =C2=B1  3%     -21.1        1.56 =C2=B1 17%  perf-profile.ch=
ildren.cycles-pp.__free_pages_ok
>>       22.21 =C2=B1  3%     -21.0        1.17 =C2=B1 21%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock
>>       23.18           -20.9        2.25 =C2=B1 15%  perf-profile.childre=
n.cycles-pp.get_page_from_freelist
>>       23.32           -20.7        2.60 =C2=B1 15%  perf-profile.childre=
n.cycles-pp.__alloc_pages_nodemask
>>       23.41           -20.6        2.78 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.kmalloc_large_node
>>       23.44           -20.6        2.88 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.__kmalloc_node_track_caller
>>       23.45           -20.5        2.92 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.kmalloc_reserve
>>       23.80           -20.1        3.69 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.__alloc_skb
>>       52.03           -18.2       33.84 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.sctp_sendmsg
>>       52.12           -17.9       34.18 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.sock_sendmsg
>>       52.46           -17.2       35.29 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.____sys_sendmsg
>>       52.76           -16.4       36.39 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.___sys_sendmsg
>>       18.35           -16.3        2.02 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.consume_skb
>>       18.57           -16.3        2.27 =C2=B1 40%  perf-profile.childre=
n.cycles-pp.sctp_chunk_put
>>       52.84           -16.2       36.64 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.__sys_sendmsg
>>       18.81           -15.8        2.96 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.sctp_outq_sack
>>       18.83           -15.8        3.04 =C2=B1 46%  perf-profile.childre=
n.cycles-pp.sctp_make_datafrag_empty
>>       61.12 =C2=B1  2%     -15.6       45.47 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.do_syscall_64
>>       18.72           -15.6        3.11 =C2=B1 16%  perf-profile.childre=
n.cycles-pp._sctp_make_chunk
>>       61.29 =C2=B1  2%     -15.0       46.24 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.entry_SYSCALL_64_after_hwframe
>>       24.21           -13.3       10.92 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.sctp_backlog_rcv
>>       24.23           -12.7       11.55 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.__release_sock
>>       24.29           -12.4       11.92 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.release_sock
>>       25.35           -11.5       13.81 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.sctp_assoc_bh_rcv
>>       21.22           -10.7       10.47 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.sctp_datamsg_from_user
>>       30.01            -9.5       20.47 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.sctp_cmd_interpreter
>>       30.06            -9.4       20.63 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.sctp_do_sm
>>       27.33            -6.3       21.02 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.sctp_sendmsg_to_asoc
>>        4.80 =C2=B1 20%      -4.1        0.75 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.kfree_skb
>>        0.17 =C2=B1  7%      -0.1        0.12 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.dequeue_entity
>>        0.20 =C2=B1  2%      -0.1        0.14 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.enqueue_entity
>>        0.05 =C2=B1  8%      +0.0        0.08 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.__update_load_avg_cfs_rq
>>        0.18 =C2=B1  9%      +0.0        0.22 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.update_load_avg
>>        0.02 =C2=B1141%      +0.0        0.06 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.___perf_sw_event
>>        0.05            +0.1        0.10 =C2=B1 16%  perf-profile.childre=
n.cycles-pp.__free_pages
>>        0.00            +0.1        0.06 =C2=B1 13%  perf-profile.childre=
n.cycles-pp._find_next_bit
>>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.worker_thread
>>        0.00            +0.1        0.06 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.validate_xmit_skb
>>        0.00            +0.1        0.06 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.enqueue_hrtimer
>>        0.00            +0.1        0.06 =C2=B1 13%  perf-profile.childre=
n.cycles-pp._raw_spin_lock_irq
>>        0.00            +0.1        0.06 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.ipv4_mtu
>>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.__remove_hrtimer
>>        0.04 =C2=B1 71%      +0.1        0.10 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__switch_to
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.entry_SYSCALL_64_safe_stack
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.__hrtimer_next_event_base
>>        0.00            +0.1        0.06 =C2=B1 17%  perf-profile.childre=
n.cycles-pp.check_preempt_wakeup
>>        0.00            +0.1        0.06 =C2=B1 19%  perf-profile.childre=
n.cycles-pp.serial8250_console_putchar
>>        0.03 =C2=B1 70%      +0.1        0.10 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.update_cfs_group
>>        0.00            +0.1        0.06 =C2=B1 21%  perf-profile.childre=
n.cycles-pp.serial8250_console_write
>>        0.00            +0.1        0.06 =C2=B1 21%  perf-profile.childre=
n.cycles-pp.uart_console_write
>>        0.00            +0.1        0.06 =C2=B1 21%  perf-profile.childre=
n.cycles-pp.wait_for_xmitr
>>        0.00            +0.1        0.07 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.put_prev_entity
>>        0.00            +0.1        0.07 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.cpumask_next_and
>>        0.00            +0.1        0.07 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.__mod_lruvec_page_state
>>        0.13 =C2=B1 26%      +0.1        0.20 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.simple_copy_to_iter
>>        0.10 =C2=B1  8%      +0.1        0.17 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__mod_node_page_state
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.update_irq_load_avg
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.ip_send_check
>>        0.00            +0.1        0.07 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.sctp_ulpevent_init
>>        0.00            +0.1        0.07 =C2=B1 16%  perf-profile.childre=
n.cycles-pp.rcu_idle_exit
>>        0.00            +0.1        0.07 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.check_preempt_curr
>>        0.00            +0.1        0.07 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.iov_iter_advance
>>        0.00            +0.1        0.07 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.ttwu_do_wakeup
>>        0.00            +0.1        0.07 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.hrtimer_next_event_without
>>        0.25 =C2=B1  5%      +0.1        0.32 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.ttwu_do_activate
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.asm_sysvec_irq_work
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.sysvec_irq_work
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.__sysvec_irq_work
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.irq_work_run
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.irq_work_single
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.printk
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.vprintk_emit
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.console_unlock
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.childre=
n.cycles-pp.copy_fpregs_to_fpstate
>>        0.00            +0.1        0.07 =C2=B1 21%  perf-profile.childre=
n.cycles-pp.sctp_ulpq_order
>>        0.00            +0.1        0.07 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.del_timer
>>        0.24 =C2=B1  3%      +0.1        0.32 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.enqueue_task_fair
>>        0.00            +0.1        0.08 =C2=B1 16%  perf-profile.childre=
n.cycles-pp.sctp_hash_key
>>        0.00            +0.1        0.08 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.rcu_all_qs
>>        0.00            +0.1        0.08 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.check_stack_object
>>        0.04 =C2=B1 71%      +0.1        0.12 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.skb_release_data
>>        0.00            +0.1        0.08 =C2=B1 15%  perf-profile.childre=
n.cycles-pp.irq_work_run_list
>>        0.00            +0.1        0.08 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.arch_scale_freq_tick
>>        0.04 =C2=B1 71%      +0.1        0.12 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.__switch_to_asm
>>        0.00            +0.1        0.08 =C2=B1 22%  perf-profile.childre=
n.cycles-pp.reweight_entity
>>        0.00            +0.1        0.08 =C2=B1 29%  perf-profile.childre=
n.cycles-pp.rcu_sched_clock_irq
>>        0.56 =C2=B1  3%      +0.1        0.65 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__wake_up_common
>>        0.54 =C2=B1  2%      +0.1        0.62 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.try_to_wake_up
>>        0.05 =C2=B1  8%      +0.1        0.14 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sctp_outq_flush_ctrl
>>        0.00            +0.1        0.09 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.syscall_exit_to_user_mode_prepare
>>        0.00            +0.1        0.09 =C2=B1 17%  perf-profile.childre=
n.cycles-pp.__ip_local_out
>>        0.00            +0.1        0.09 =C2=B1 17%  perf-profile.childre=
n.cycles-pp.__netif_receive_skb_core
>>        0.05            +0.1        0.14 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.mod_timer
>>        0.00            +0.1        0.09 =C2=B1 12%  perf-profile.childre=
n.cycles-pp.get_next_timer_interrupt
>>        0.00            +0.1        0.09 =C2=B1 31%  perf-profile.childre=
n.cycles-pp.ipv4_dst_check
>>        0.06 =C2=B1  7%      +0.1        0.15 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sctp_outq_tail
>>        0.05            +0.1        0.14 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.sctp_association_hold
>>        0.00            +0.1        0.09 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.lock_timer_base
>>        0.19 =C2=B1  6%      +0.1        0.28 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.dequeue_task_fair
>>        0.33 =C2=B1 12%      +0.1        0.42 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.kmem_cache_free
>>        0.05            +0.1        0.14 =C2=B1 12%  perf-profile.childre=
n.cycles-pp.kmem_cache_alloc_trace
>>        0.00            +0.1        0.09 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.ip_local_out
>>        0.00            +0.1        0.09 =C2=B1 19%  perf-profile.childre=
n.cycles-pp.sctp_chunk_abandoned
>>        0.55 =C2=B1  3%      +0.1        0.64 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.autoremove_wake_function
>>        0.06 =C2=B1  7%      +0.1        0.16 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.skb_set_owner_w
>>        0.00            +0.1        0.10 =C2=B1  4%  perf-profile.childre=
n.cycles-pp.update_ts_time_stats
>>        0.09 =C2=B1  5%      +0.1        0.19 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.prep_compound_page
>>        0.00            +0.1        0.10 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.__check_heap_object
>>        0.00            +0.1        0.10 =C2=B1 12%  perf-profile.childre=
n.cycles-pp.kthread
>>        0.00            +0.1        0.10 =C2=B1  6%  perf-profile.childre=
n.cycles-pp.nr_iowait_cpu
>>        0.00            +0.1        0.10 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.__put_user_nocheck_8
>>        0.00            +0.1        0.10 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.ret_from_fork
>>        0.00            +0.1        0.10 =C2=B1 23%  perf-profile.childre=
n.cycles-pp.sctp_validate_data
>>        0.00            +0.1        0.10 =C2=B1 16%  perf-profile.childre=
n.cycles-pp.__put_user_nocheck_4
>>        0.00            +0.1        0.10 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.sctp_transport_reset_t3_rtx
>>        0.00            +0.1        0.10 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.__intel_pmu_enable_all
>>        0.05 =C2=B1  8%      +0.1        0.16 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sctp_transport_put
>>        0.00            +0.1        0.11 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.ip_finish_output
>>        0.00            +0.1        0.11 =C2=B1 26%  perf-profile.childre=
n.cycles-pp.account_process_tick
>>        0.00            +0.1        0.11 =C2=B1 12%  perf-profile.childre=
n.cycles-pp.enqueue_to_backlog
>>        0.10 =C2=B1  4%      +0.1        0.21 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.prep_new_page
>>        0.09 =C2=B1  5%      +0.1        0.20 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.update_curr
>>        0.00            +0.1        0.11 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.sctp_packet_append_chunk
>>        0.07 =C2=B1 11%      +0.1        0.18 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sctp_transport_hold
>>        0.02 =C2=B1141%      +0.1        0.13 =C2=B1 29%  perf-profile.ch=
ildren.cycles-pp.sctp_assoc_rwnd_increase
>>        0.00            +0.1        0.11 =C2=B1 20%  perf-profile.childre=
n.cycles-pp.tsc_verify_tsc_adjust
>>        0.03 =C2=B1 70%      +0.1        0.15 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sock_wfree
>>        0.29            +0.1        0.41 =C2=B1 17%  perf-profile.childre=
n.cycles-pp.__free_one_page
>>        0.00            +0.1        0.12 =C2=B1 19%  perf-profile.childre=
n.cycles-pp.arch_cpu_idle_enter
>>        0.09 =C2=B1  5%      +0.1        0.22 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.update_rq_clock
>>        0.00            +0.1        0.12 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.__ksize
>>        0.00            +0.1        0.12 =C2=B1 15%  perf-profile.childre=
n.cycles-pp.dst_release
>>        0.00            +0.1        0.12 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.netif_rx_internal
>>        0.00            +0.1        0.13 =C2=B1 28%  perf-profile.childre=
n.cycles-pp.calc_global_load_tick
>>        0.02 =C2=B1141%      +0.1        0.14 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.sctp_chunk_hold
>>        0.00            +0.1        0.13 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.netif_rx
>>        0.00            +0.1        0.13 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.__genradix_ptr
>>        0.03 =C2=B1 70%      +0.1        0.16 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__x86_indirect_thunk_rax
>>        0.06 =C2=B1 13%      +0.1        0.19 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sctp_association_put
>>        0.07            +0.1        0.20 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.sctp_v4_xmit
>>        0.06 =C2=B1  7%      +0.1        0.20 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.__kmalloc
>>        0.02 =C2=B1141%      +0.1        0.16 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.__cgroup_bpf_run_filter_skb
>>        0.69 =C2=B1  2%      +0.1        0.83 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sctp_ulpq_tail_event
>>        0.08 =C2=B1  6%      +0.1        0.23 =C2=B1 16%  perf-profile.ch=
ildren.cycles-pp.__copy_skb_header
>>        0.09 =C2=B1  5%      +0.2        0.24 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sctp_check_transmitted
>>        0.19 =C2=B1  2%      +0.2        0.35 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.__list_add_valid
>>        0.00            +0.2        0.16 =C2=B1 16%  perf-profile.childre=
n.cycles-pp.sk_filter_trim_cap
>>        0.08 =C2=B1 26%      +0.2        0.24 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.security_socket_recvmsg
>>        0.11 =C2=B1100%      +0.2        0.28 =C2=B1 24%  perf-profile.ch=
ildren.cycles-pp.start_kernel
>>        0.00            +0.2        0.16 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.skb_clone
>>        0.07            +0.2        0.23 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.sock_kfree_s
>>        0.06 =C2=B1  7%      +0.2        0.23 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.native_sched_clock
>>        0.00            +0.2        0.17 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.run_rebalance_domains
>>        0.17 =C2=B1  7%      +0.2        0.34 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sctp_addrs_lookup_transport
>>        0.03 =C2=B1 70%      +0.2        0.20 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__entry_text_start
>>        0.08 =C2=B1 24%      +0.2        0.26 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sock_recvmsg
>>        0.08 =C2=B1  5%      +0.2        0.26 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.sctp_ulpevent_receive_data
>>        0.00            +0.2        0.17 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.update_blocked_averages
>>        0.07 =C2=B1 11%      +0.2        0.24 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__sctp_packet_append_chunk
>>        0.06 =C2=B1  7%      +0.2        0.24 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.sched_clock
>>        0.14 =C2=B1  3%      +0.2        0.32 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.sctp_eat_data
>>        0.00            +0.2        0.18 =C2=B1 16%  perf-profile.childre=
n.cycles-pp.switch_fpu_return
>>        0.08            +0.2        0.26 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.sctp_inq_pop
>>        0.18 =C2=B1  7%      +0.2        0.36 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__sctp_rcv_lookup
>>        0.29            +0.2        0.48 =C2=B1 17%  perf-profile.childre=
n.cycles-pp.sctp_datamsg_put
>>        0.10 =C2=B1 12%      +0.2        0.28 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.__fget_light
>>        0.00            +0.2        0.19 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.idle_cpu
>>        0.07 =C2=B1  6%      +0.2        0.27 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.security_socket_sendmsg
>>        0.09            +0.2        0.28 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.kmem_cache_alloc_node
>>        0.00            +0.2        0.19 =C2=B1 15%  perf-profile.childre=
n.cycles-pp.skb_put
>>        0.07 =C2=B1  6%      +0.2        0.27 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.sched_clock_cpu
>>        0.08 =C2=B1  5%      +0.2        0.28 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.sock_kmalloc
>>        0.00            +0.2        0.20 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.load_new_mm_cr3
>>        0.08 =C2=B1  5%      +0.2        0.29 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.loopback_xmit
>>        0.10 =C2=B1 12%      +0.2        0.30 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__virt_addr_valid
>>        0.09 =C2=B1  5%      +0.2        0.29 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.move_addr_to_kernel
>>        0.09 =C2=B1  5%      +0.2        0.29 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.memset_erms
>>        0.20 =C2=B1  9%      +0.2        0.41 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sctp_hash_cmp
>>        0.11            +0.2        0.33 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.__zone_watermark_ok
>>        0.12 =C2=B1  3%      +0.2        0.35 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.__skb_clone
>>        0.09 =C2=B1  5%      +0.2        0.31 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.dev_hard_start_xmit
>>        0.11            +0.2        0.34 =C2=B1 19%  perf-profile.childre=
n.cycles-pp.sctp_sched_fcfs_dequeue
>>        0.36 =C2=B1 30%      +0.2        0.60 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp._raw_spin_lock_bh
>>        0.11 =C2=B1  7%      +0.2        0.34 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__might_sleep
>>        0.12 =C2=B1 10%      +0.2        0.35 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sockfd_lookup_light
>>        0.13 =C2=B1 13%      +0.2        0.36 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.__might_fault
>>        0.10 =C2=B1  4%      +0.2        0.34 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.sctp_wfree
>>        0.02 =C2=B1141%      +0.2        0.26 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.exit_to_user_mode_prepare
>>        0.18 =C2=B1  4%      +0.2        0.43 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.sctp_sf_eat_data_6_2
>>        0.16 =C2=B1  6%      +0.3        0.41 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sctp_packet_config
>>        0.13 =C2=B1 12%      +0.3        0.38 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.___might_sleep
>>        0.11 =C2=B1 11%      +0.3        0.37 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.aa_sk_perm
>>        0.17 =C2=B1  9%      +0.3        0.43 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.sctp_epaddr_lookup_transport
>>        0.00            +0.3        0.27 =C2=B1  6%  perf-profile.childre=
n.cycles-pp.lapic_next_deadline
>>        0.00            +0.3        0.28 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.switch_mm_irqs_off
>>        0.11 =C2=B1 14%      +0.3        0.40 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.syscall_return_via_sysret
>>        0.08 =C2=B1  5%      +0.3        0.38 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.read_tsc
>>        0.10 =C2=B1 16%      +0.3        0.40 =C2=B1 14%  perf-profile.ch=
ildren.cycles-pp.syscall_exit_to_user_mode
>>        0.00            +0.3        0.31 =C2=B1 15%  perf-profile.childre=
n.cycles-pp.perf_mux_hrtimer_handler
>>        0.00            +0.3        0.32 =C2=B1 11%  perf-profile.childre=
n.cycles-pp.ktime_get_update_offsets_now
>>        0.13 =C2=B1  3%      +0.3        0.46 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__dev_queue_xmit
>>        0.18 =C2=B1  6%      +0.3        0.51 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sctp_outq_select_transport
>>        0.11 =C2=B1  4%      +0.3        0.44 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sctp_packet_transmit_chunk
>>        0.16 =C2=B1  2%      +0.4        0.52 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.sctp_chunkify
>>        0.22 =C2=B1  3%      +0.4        0.60 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.kfree
>>        0.17 =C2=B1 14%      +0.4        0.55 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.iovec_from_user
>>        0.14 =C2=B1  5%      +0.4        0.52 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.copy_user_generic_unrolled
>>        0.00            +0.4        0.38 =C2=B1  6%  perf-profile.childre=
n.cycles-pp._raw_spin_trylock
>>        0.00            +0.4        0.40 =C2=B1  5%  perf-profile.childre=
n.cycles-pp.tick_nohz_irq_exit
>>        0.00            +0.4        0.40 =C2=B1  6%  perf-profile.childre=
n.cycles-pp.native_irq_return_iret
>>        0.18 =C2=B1  2%      +0.4        0.59 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.kmem_cache_alloc
>>        0.39            +0.4        0.81 =C2=B1 15%  perf-profile.childre=
n.cycles-pp.__list_del_entry_valid
>>        0.29 =C2=B1 11%      +0.4        0.72 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__check_object_size
>>        0.14 =C2=B1  3%      +0.4        0.57 =C2=B1 29%  perf-profile.ch=
ildren.cycles-pp.sctp_addto_chunk
>>        0.20 =C2=B1  6%      +0.5        0.66 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.skb_release_head_state
>>        0.10 =C2=B1  4%      +0.5        0.56 =C2=B1 15%  perf-profile.ch=
ildren.cycles-pp.scheduler_tick
>>        0.21 =C2=B1  6%      +0.5        0.67 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.skb_release_all
>>        0.22 =C2=B1 13%      +0.5        0.69 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.__import_iovec
>>        0.83 =C2=B1 18%      +0.5        1.31 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.sctp_skb_recv_datagram
>>        0.00            +0.5        0.48 =C2=B1 17%  perf-profile.childre=
n.cycles-pp.newidle_balance
>>        0.22 =C2=B1 14%      +0.5        0.73 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.import_iovec
>>        0.21 =C2=B1 27%      +0.5        0.74 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.recvmsg_copy_msghdr
>>        0.07            +0.5        0.61 =C2=B1  7%  perf-profile.childre=
n.cycles-pp.irqtime_account_irq
>>        0.00            +0.6        0.55 =C2=B1  6%  perf-profile.childre=
n.cycles-pp.preempt_schedule_common
>>        0.19 =C2=B1 28%      +0.6        0.75 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.pick_next_task_fair
>>        0.00            +0.6        0.58 =C2=B1 14%  perf-profile.childre=
n.cycles-pp.update_sd_lb_stats
>>        0.00            +0.6        0.59 =C2=B1 15%  perf-profile.childre=
n.cycles-pp.find_busiest_group
>>        0.06 =C2=B1  8%      +0.7        0.71 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__cond_resched
>>        0.00            +0.7        0.66 =C2=B1  2%  perf-profile.childre=
n.cycles-pp.rebalance_domains
>>        0.00            +0.7        0.66 =C2=B1 13%  perf-profile.childre=
n.cycles-pp.load_balance
>>        0.35 =C2=B1  2%      +0.7        1.02 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.sctp_ulpevent_make_rcvmsg
>>        0.09            +0.7        0.78 =C2=B1154%  perf-profile.childre=
n.cycles-pp.sctp_make_sack
>>        0.00            +0.7        0.71 =C2=B1  5%  perf-profile.childre=
n.cycles-pp.timekeeping_max_deferment
>>        0.24 =C2=B1  8%      +0.7        0.97 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__copy_msghdr_from_user
>>        0.00            +0.8        0.75 =C2=B1  9%  perf-profile.childre=
n.cycles-pp.tick_irq_enter
>>        0.28 =C2=B1  2%      +0.8        1.03 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.sendmsg_copy_msghdr
>>        0.00            +0.8        0.76 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.irq_enter_rcu
>>        0.42 =C2=B1  6%      +0.8        1.20 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.schedule_timeout
>>        0.40 =C2=B1  5%      +0.8        1.23 =C2=B1 12%  perf-profile.ch=
ildren.cycles-pp.schedule
>>        0.15 =C2=B1  3%      +0.9        1.01 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.update_process_times
>>        0.15 =C2=B1  3%      +0.9        1.02 =C2=B1 13%  perf-profile.ch=
ildren.cycles-pp.tick_sched_handle
>>        1.10 =C2=B1  2%      +1.0        2.06 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.sctp_ulpq_tail_data
>>        0.06 =C2=B1  7%      +1.0        1.04 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_next_event
>>        0.36 =C2=B1  9%      +1.0        1.37 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp._copy_from_user
>>        0.00            +1.0        1.04 =C2=B1197%  perf-profile.childre=
n.cycles-pp.sctp_chunk_assign_ssn
>>        0.17 =C2=B1  2%      +1.0        1.21 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.tick_sched_timer
>>        0.73 =C2=B1 15%      +1.0        1.78 =C2=B1 10%  perf-profile.ch=
ildren.cycles-pp.__schedule
>>        0.08 =C2=B1  5%      +1.0        1.13 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.clockevents_program_event
>>        0.08 =C2=B1  5%      +1.1        1.14 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.tick_nohz_get_sleep_length
>>        0.48 =C2=B1 10%      +1.3        1.76 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.copy_msghdr_from_user
>>        0.09 =C2=B1  5%      +1.4        1.47 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.irq_exit_rcu
>>        0.22 =C2=B1  2%      +1.5        1.75 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.__hrtimer_run_queues
>>        1.14 =C2=B1 30%      +1.7        2.88 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.copyout
>>        1.19 =C2=B1 30%      +1.8        3.00 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp._copy_to_iter
>>        1.36 =C2=B1 29%      +1.9        3.24 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.__skb_datagram_iter
>>        1.36 =C2=B1 30%      +1.9        3.26 =C2=B1  7%  perf-profile.ch=
ildren.cycles-pp.skb_copy_datagram_iter
>>        0.22 =C2=B1  7%      +2.1        2.31 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.ktime_get
>>        0.36 =C2=B1  3%      +3.0        3.38 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.hrtimer_interrupt
>>        0.37 =C2=B1  3%      +3.0        3.41 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__sysvec_apic_timer_interrupt
>>        2.36 =C2=B1  2%      +3.1        5.42 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.sctp_rcv
>>        2.39 =C2=B1  2%      +3.1        5.52 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.ip_protocol_deliver_rcu
>>        2.40 =C2=B1  2%      +3.1        5.55 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.ip_local_deliver_finish
>>        2.41 =C2=B1  2%      +3.2        5.58 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.ip_local_deliver
>>        2.45 =C2=B1  2%      +3.3        5.70 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.ip_rcv
>>        2.48 =C2=B1  2%      +3.3        5.82 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__netif_receive_skb_one_core
>>        2.53 =C2=B1  2%      +3.5        5.99 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__napi_poll
>>        2.52 =C2=B1  2%      +3.5        5.98 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.process_backlog
>>        2.57 =C2=B1  2%      +3.5        6.07 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.net_rx_action
>>        2.65 =C2=B1  2%      +3.6        6.20 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.do_softirq
>>        1.96            +3.6        5.55 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.copyin
>>        2.67 =C2=B1  2%      +3.6        6.29 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__local_bh_enable_ip
>>        2.00            +3.7        5.71 =C2=B1 10%  perf-profile.childre=
n.cycles-pp._copy_from_iter_full
>>        2.77 =C2=B1  2%      +3.9        6.68 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.ip_finish_output2
>>        2.84 =C2=B1  2%      +4.0        6.86 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.ip_output
>>        2.88 =C2=B1  2%      +4.1        7.00 =C2=B1  6%  perf-profile.ch=
ildren.cycles-pp.__ip_queue_xmit
>>        0.17 =C2=B1  2%      +4.2        4.38 =C2=B1 11%  perf-profile.ch=
ildren.cycles-pp.menu_select
>>        2.69 =C2=B1  2%      +4.5        7.22 =C2=B1  5%  perf-profile.ch=
ildren.cycles-pp.__softirqentry_text_start
>>        2.15            +4.6        6.79 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.memcpy_erms
>>       10.45            +4.8       15.24 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.sctp_packet_transmit
>>        2.28            +4.8        7.12 =C2=B1 10%  perf-profile.childre=
n.cycles-pp.sctp_packet_pack
>>        3.17 =C2=B1  9%      +5.6        8.80 =C2=B1  9%  perf-profile.ch=
ildren.cycles-pp.copy_user_enhanced_fast_string
>>        0.51 =C2=B1  4%      +5.7        6.25 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.sysvec_apic_timer_interrupt
>>       11.07            +6.1       17.21 =C2=B1  8%  perf-profile.childre=
n.cycles-pp.sctp_outq_flush
>>        0.57 =C2=B1  3%      +8.3        8.87 =C2=B1  4%  perf-profile.ch=
ildren.cycles-pp.asm_sysvec_apic_timer_interrupt
>>       37.69 =C2=B1  3%     +10.2       47.92 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.cpuidle_enter_state
>>       37.69 =C2=B1  3%     +10.2       47.93 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.cpuidle_enter
>>       38.29 =C2=B1  3%     +14.1       52.38 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.start_secondary
>>       38.40 =C2=B1  3%     +14.3       52.66 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.secondary_startup_64_no_verify
>>       38.40 =C2=B1  3%     +14.3       52.66 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.cpu_startup_entry
>>       38.40 =C2=B1  3%     +14.3       52.66 =C2=B1  8%  perf-profile.ch=
ildren.cycles-pp.do_idle
>>       43.97           -43.2        0.79 =C2=B1 30%  perf-profile.self.cy=
cles-pp.native_queued_spin_lock_slowpath
>>        0.06 =C2=B1  7%      +0.0        0.09 =C2=B1 23%  perf-profile.se=
lf.cycles-pp.update_rq_clock
>>        0.05 =C2=B1  8%      +0.0        0.08 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__update_load_avg_cfs_rq
>>        0.05            +0.0        0.08 =C2=B1 17%  perf-profile.self.cy=
cles-pp.sctp_ulpevent_make_rcvmsg
>>        0.03 =C2=B1 70%      +0.0        0.07 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.do_syscall_64
>>        0.06 =C2=B1  7%      +0.0        0.10 =C2=B1 16%  perf-profile.se=
lf.cycles-pp.sctp_addto_chunk
>>        0.05 =C2=B1  8%      +0.0        0.09 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.update_curr
>>        0.08 =C2=B1  5%      +0.0        0.13 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.sctp_eat_data
>>        0.06 =C2=B1  8%      +0.0        0.10 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.sctp_data_ready
>>        0.00            +0.1        0.05 =C2=B1  9%  perf-profile.self.cy=
cles-pp.sctp_hash_cmp
>>        0.00            +0.1        0.05 =C2=B1  9%  perf-profile.self.cy=
cles-pp.__hrtimer_next_event_base
>>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.self.cy=
cles-pp.hrtimer_interrupt
>>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.self.cy=
cles-pp.pick_next_task_fair
>>        0.04 =C2=B1 73%      +0.1        0.10 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__switch_to
>>        0.00            +0.1        0.06 =C2=B1 13%  perf-profile.self.cy=
cles-pp.__sys_recvmsg
>>        0.00            +0.1        0.06 =C2=B1 13%  perf-profile.self.cy=
cles-pp._raw_spin_lock_irq
>>        0.00            +0.1        0.06 =C2=B1 18%  perf-profile.self.cy=
cles-pp.__sys_sendmsg
>>        0.03 =C2=B1 70%      +0.1        0.09 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.do_idle
>>        0.00            +0.1        0.06 =C2=B1 18%  perf-profile.self.cy=
cles-pp.ip_output
>>        0.02 =C2=B1141%      +0.1        0.07 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.sctp_assoc_rwnd_increase
>>        0.05 =C2=B1  8%      +0.1        0.11 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.sctp_epaddr_lookup_transport
>>        0.05            +0.1        0.11 =C2=B1  9%  perf-profile.self.cy=
cles-pp.sctp_outq_tail
>>        0.00            +0.1        0.06 =C2=B1  9%  perf-profile.self.cy=
cles-pp.entry_SYSCALL_64_safe_stack
>>        0.00            +0.1        0.06 =C2=B1 17%  perf-profile.self.cy=
cles-pp.kmalloc_large_node
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.select_task_rq_fair
>>        0.03 =C2=B1 70%      +0.1        0.10 =C2=B1 15%  perf-profile.se=
lf.cycles-pp.update_cfs_group
>>        0.00            +0.1        0.06 =C2=B1 19%  perf-profile.self.cy=
cles-pp.sockfd_lookup_light
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.sock_kfree_s
>>        0.00            +0.1        0.06 =C2=B1  7%  perf-profile.self.cy=
cles-pp.copy_msghdr_from_user
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.move_addr_to_kernel
>>        0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cy=
cles-pp.__dev_queue_xmit
>>        0.10 =C2=B1  8%      +0.1        0.17 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__mod_node_page_state
>>        0.02 =C2=B1141%      +0.1        0.08 =C2=B1 13%  perf-profile.se=
lf.cycles-pp._copy_to_iter
>>        0.00            +0.1        0.07 =C2=B1  7%  perf-profile.self.cy=
cles-pp.__mod_lruvec_page_state
>>        0.00            +0.1        0.07 =C2=B1 10%  perf-profile.self.cy=
cles-pp.sctp_chunkify
>>        0.00            +0.1        0.07 =C2=B1 10%  perf-profile.self.cy=
cles-pp.check_stack_object
>>        0.00            +0.1        0.07 =C2=B1 15%  perf-profile.self.cy=
cles-pp.iov_iter_advance
>>        0.03 =C2=B1 70%      +0.1        0.10 =C2=B1 16%  perf-profile.se=
lf.cycles-pp.__free_pages
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.self.cy=
cles-pp.update_irq_load_avg
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.self.cy=
cles-pp.ip_send_check
>>        0.00            +0.1        0.07 =C2=B1 14%  perf-profile.self.cy=
cles-pp.switch_mm_irqs_off
>>        0.00            +0.1        0.07 =C2=B1  8%  perf-profile.self.cy=
cles-pp.sctp_ulpevent_init
>>        0.11            +0.1        0.18 =C2=B1 17%  perf-profile.self.cy=
cles-pp.__free_one_page
>>        0.00            +0.1        0.07 =C2=B1 29%  perf-profile.self.cy=
cles-pp.rcu_sched_clock_irq
>>        0.00            +0.1        0.07 =C2=B1 14%  perf-profile.self.cy=
cles-pp.__ip_queue_xmit
>>        0.06            +0.1        0.13 =C2=B1 16%  perf-profile.self.cy=
cles-pp.get_page_from_freelist
>>        0.00            +0.1        0.07 =C2=B1 18%  perf-profile.self.cy=
cles-pp.copy_fpregs_to_fpstate
>>        0.00            +0.1        0.07 =C2=B1 12%  perf-profile.self.cy=
cles-pp.___sys_recvmsg
>>        0.00            +0.1        0.07 =C2=B1 10%  perf-profile.self.cy=
cles-pp.net_rx_action
>>        0.00            +0.1        0.07 =C2=B1 12%  perf-profile.self.cy=
cles-pp.sctp_outq_select_transport
>>        0.00            +0.1        0.08 =C2=B1 16%  perf-profile.self.cy=
cles-pp.rebalance_domains
>>        0.00            +0.1        0.08 =C2=B1 16%  perf-profile.self.cy=
cles-pp.sctp_hash_key
>>        0.04 =C2=B1 71%      +0.1        0.12 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.skb_release_data
>>        0.00            +0.1        0.08 =C2=B1  8%  perf-profile.self.cy=
cles-pp.arch_scale_freq_tick
>>        0.04 =C2=B1 71%      +0.1        0.12 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.__switch_to_asm
>>        0.00            +0.1        0.08 =C2=B1 13%  perf-profile.self.cy=
cles-pp.sock_kmalloc
>>        0.00            +0.1        0.08 =C2=B1 10%  perf-profile.self.cy=
cles-pp.__might_fault
>>        0.00            +0.1        0.08 =C2=B1 14%  perf-profile.self.cy=
cles-pp.syscall_exit_to_user_mode_prepare
>>        0.00            +0.1        0.08 =C2=B1 13%  perf-profile.self.cy=
cles-pp.iovec_from_user
>>        0.00            +0.1        0.08 =C2=B1  8%  perf-profile.self.cy=
cles-pp.__cond_resched
>>        0.00            +0.1        0.08 =C2=B1 28%  perf-profile.self.cy=
cles-pp.perf_mux_hrtimer_handler
>>        0.07            +0.1        0.15 =C2=B1 12%  perf-profile.self.cy=
cles-pp.sctp_rcv
>>        0.03 =C2=B1 70%      +0.1        0.12 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__skb_clone
>>        0.00            +0.1        0.09 =C2=B1 14%  perf-profile.self.cy=
cles-pp.sctp_addrs_lookup_transport
>>        0.00            +0.1        0.09 =C2=B1 18%  perf-profile.self.cy=
cles-pp.__netif_receive_skb_core
>>        0.00            +0.1        0.09 =C2=B1  8%  perf-profile.self.cy=
cles-pp.process_backlog
>>        0.05            +0.1        0.14 =C2=B1  7%  perf-profile.self.cy=
cles-pp.sctp_association_hold
>>        0.00            +0.1        0.09 =C2=B1 13%  perf-profile.self.cy=
cles-pp.__kmalloc_node_track_caller
>>        0.00            +0.1        0.09 =C2=B1 13%  perf-profile.self.cy=
cles-pp.sctp_outq_sack
>>        0.00            +0.1        0.09 =C2=B1 12%  perf-profile.self.cy=
cles-pp.kmem_cache_alloc_trace
>>        0.09 =C2=B1  5%      +0.1        0.18 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.prep_compound_page
>>        0.00            +0.1        0.09 =C2=B1 18%  perf-profile.self.cy=
cles-pp.__local_bh_enable_ip
>>        0.00            +0.1        0.09 =C2=B1 11%  perf-profile.self.cy=
cles-pp.__kmalloc
>>        0.00            +0.1        0.09 =C2=B1 19%  perf-profile.self.cy=
cles-pp.sctp_chunk_abandoned
>>        0.00            +0.1        0.09 =C2=B1  9%  perf-profile.self.cy=
cles-pp.__cgroup_bpf_run_filter_skb
>>        0.02 =C2=B1141%      +0.1        0.11 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.____sys_recvmsg
>>        0.00            +0.1        0.09 =C2=B1 14%  perf-profile.self.cy=
cles-pp.__softirqentry_text_start
>>        0.00            +0.1        0.09 =C2=B1 13%  perf-profile.self.cy=
cles-pp.__sctp_packet_append_chunk
>>        0.06            +0.1        0.15 =C2=B1 12%  perf-profile.self.cy=
cles-pp.skb_set_owner_w
>>        0.00            +0.1        0.10 =C2=B1 15%  perf-profile.self.cy=
cles-pp.sctp_sf_eat_data_6_2
>>        0.00            +0.1        0.10 =C2=B1 13%  perf-profile.self.cy=
cles-pp.__check_heap_object
>>        0.00            +0.1        0.10 =C2=B1  6%  perf-profile.self.cy=
cles-pp.nr_iowait_cpu
>>        0.00            +0.1        0.10 =C2=B1 10%  perf-profile.self.cy=
cles-pp.__put_user_nocheck_8
>>        0.03 =C2=B1 70%      +0.1        0.13 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.sctp_assoc_bh_rcv
>>        0.00            +0.1        0.10 =C2=B1 25%  perf-profile.self.cy=
cles-pp.sctp_make_datafrag_empty
>>        0.09 =C2=B1 30%      +0.1        0.19 =C2=B1 14%  perf-profile.se=
lf.cycles-pp.sctp_recvmsg
>>        0.07 =C2=B1 11%      +0.1        0.17 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.sctp_transport_hold
>>        0.00            +0.1        0.10 =C2=B1 23%  perf-profile.self.cy=
cles-pp.sctp_sched_dequeue_common
>>        0.00            +0.1        0.10 =C2=B1  8%  perf-profile.self.cy=
cles-pp.sctp_check_transmitted
>>        0.00            +0.1        0.10 =C2=B1 13%  perf-profile.self.cy=
cles-pp.__put_user_nocheck_4
>>        0.05            +0.1        0.15 =C2=B1  8%  perf-profile.self.cy=
cles-pp.sctp_transport_put
>>        0.00            +0.1        0.10 =C2=B1 13%  perf-profile.self.cy=
cles-pp.__intel_pmu_enable_all
>>        0.03 =C2=B1 70%      +0.1        0.14 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.__import_iovec
>>        0.00            +0.1        0.11 =C2=B1 26%  perf-profile.self.cy=
cles-pp.account_process_tick
>>        0.00            +0.1        0.11 =C2=B1 12%  perf-profile.self.cy=
cles-pp.sctp_packet_append_chunk
>>        0.00            +0.1        0.11 =C2=B1 12%  perf-profile.self.cy=
cles-pp.__x86_indirect_thunk_rax
>>        0.00            +0.1        0.11 =C2=B1 17%  perf-profile.self.cy=
cles-pp.tsc_verify_tsc_adjust
>>        0.00            +0.1        0.11 =C2=B1 17%  perf-profile.self.cy=
cles-pp.sctp_chunk_assign_ssn
>>        0.05 =C2=B1  8%      +0.1        0.17 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.sctp_do_sm
>>        0.00            +0.1        0.12 =C2=B1  8%  perf-profile.self.cy=
cles-pp.sctp_inq_pop
>>        0.00            +0.1        0.12 =C2=B1 16%  perf-profile.self.cy=
cles-pp.__genradix_ptr
>>        0.00            +0.1        0.12 =C2=B1 10%  perf-profile.self.cy=
cles-pp.____sys_sendmsg
>>        0.14 =C2=B1 11%      +0.1        0.26 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__check_object_size
>>        0.00            +0.1        0.12 =C2=B1  9%  perf-profile.self.cy=
cles-pp.__ksize
>>        0.00            +0.1        0.12 =C2=B1 12%  perf-profile.self.cy=
cles-pp.sctp_ulpq_tail_data
>>        0.33 =C2=B1  3%      +0.1        0.45 =C2=B1  7%  perf-profile.se=
lf.cycles-pp._raw_spin_lock_irqsave
>>        0.02 =C2=B1141%      +0.1        0.14 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.sctp_packet_transmit
>>        0.00            +0.1        0.12 =C2=B1 15%  perf-profile.self.cy=
cles-pp.dst_release
>>        0.02 =C2=B1141%      +0.1        0.14 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.sctp_chunk_hold
>>        0.02 =C2=B1141%      +0.1        0.14 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.sock_wfree
>>        0.00            +0.1        0.13 =C2=B1 28%  perf-profile.self.cy=
cles-pp.calc_global_load_tick
>>        0.00            +0.1        0.13 =C2=B1 14%  perf-profile.self.cy=
cles-pp.__copy_msghdr_from_user
>>        0.07            +0.1        0.20 =C2=B1 10%  perf-profile.self.cy=
cles-pp.sctp_v4_xmit
>>        0.06 =C2=B1 13%      +0.1        0.19 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.sctp_association_put
>>        0.02 =C2=B1141%      +0.1        0.15 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.ip_finish_output2
>>        0.00            +0.1        0.14 =C2=B1 23%  perf-profile.self.cy=
cles-pp.sctp_sched_fcfs_dequeue
>>        0.00            +0.1        0.14 =C2=B1  6%  perf-profile.self.cy=
cles-pp.sctp_ulpevent_receive_data
>>        0.25            +0.1        0.40 =C2=B1 17%  perf-profile.self.cy=
cles-pp.sctp_datamsg_put
>>        0.09 =C2=B1  5%      +0.1        0.23 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.sctp_sendmsg_to_asoc
>>        0.18 =C2=B1  2%      +0.1        0.33 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.__list_add_valid
>>        0.08 =C2=B1  6%      +0.1        0.22 =C2=B1 16%  perf-profile.se=
lf.cycles-pp.__copy_skb_header
>>        0.06            +0.1        0.21 =C2=B1  8%  perf-profile.self.cy=
cles-pp.kmem_cache_alloc_node
>>        0.06            +0.1        0.21 =C2=B1  5%  perf-profile.self.cy=
cles-pp.sctp_wfree
>>        0.10 =C2=B1  4%      +0.2        0.26 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.sctp_cmd_interpreter
>>        0.06            +0.2        0.22 =C2=B1  5%  perf-profile.self.cy=
cles-pp.native_sched_clock
>>        0.04 =C2=B1 71%      +0.2        0.20 =C2=B1  3%  perf-profile.se=
lf.cycles-pp._copy_from_user
>>        0.31            +0.2        0.48 =C2=B1 12%  perf-profile.self.cy=
cles-pp.rmqueue
>>        0.13 =C2=B1  3%      +0.2        0.30 =C2=B1 13%  perf-profile.se=
lf.cycles-pp.__alloc_pages_nodemask
>>        0.03 =C2=B1 70%      +0.2        0.20 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.__entry_text_start
>>        0.00            +0.2        0.17 =C2=B1 16%  perf-profile.self.cy=
cles-pp.switch_fpu_return
>>        0.10            +0.2        0.27 =C2=B1 11%  perf-profile.self.cy=
cles-pp.__alloc_skb
>>        0.12 =C2=B1  6%      +0.2        0.29 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.sctp_packet_config
>>        0.08            +0.2        0.26 =C2=B1 12%  perf-profile.self.cy=
cles-pp.sctp_packet_pack
>>        0.00            +0.2        0.18 =C2=B1 13%  perf-profile.self.cy=
cles-pp.skb_put
>>        0.10 =C2=B1 12%      +0.2        0.28 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__fget_light
>>        0.00            +0.2        0.18 =C2=B1 28%  perf-profile.self.cy=
cles-pp.update_process_times
>>        0.00            +0.2        0.19 =C2=B1 15%  perf-profile.self.cy=
cles-pp.idle_cpu
>>        0.09 =C2=B1 13%      +0.2        0.28 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.aa_sk_perm
>>        0.09 =C2=B1 13%      +0.2        0.29 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.__virt_addr_valid
>>        0.00            +0.2        0.20 =C2=B1 11%  perf-profile.self.cy=
cles-pp.load_new_mm_cr3
>>        0.08 =C2=B1  5%      +0.2        0.28 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.memset_erms
>>        0.11 =C2=B1  4%      +0.2        0.31 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.sctp_sendmsg
>>        0.10 =C2=B1  9%      +0.2        0.30 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.__might_sleep
>>        0.13 =C2=B1  9%      +0.2        0.35 =C2=B1  3%  perf-profile.se=
lf.cycles-pp.__free_pages_ok
>>        0.11 =C2=B1  4%      +0.2        0.33 =C2=B1 12%  perf-profile.se=
lf.cycles-pp.__zone_watermark_ok
>>        0.00            +0.2        0.23 =C2=B1 17%  perf-profile.self.cy=
cles-pp.tick_nohz_next_event
>>        0.17 =C2=B1  9%      +0.2        0.40 =C2=B1 11%  perf-profile.se=
lf.cycles-pp.kmem_cache_free
>>        0.13 =C2=B1 12%      +0.2        0.37 =C2=B1 10%  perf-profile.se=
lf.cycles-pp.___might_sleep
>>        0.12 =C2=B1 13%      +0.3        0.38 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.sctp_chunk_put
>>        0.00            +0.3        0.27 =C2=B1  6%  perf-profile.self.cy=
cles-pp.lapic_next_deadline
>>        0.10            +0.3        0.38 =C2=B1  8%  perf-profile.self.cy=
cles-pp.kmem_cache_alloc
>>        0.11 =C2=B1 15%      +0.3        0.39 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.syscall_return_via_sysret
>>        0.00            +0.3        0.28 =C2=B1 12%  perf-profile.self.cy=
cles-pp.ktime_get_update_offsets_now
>>        0.08 =C2=B1  6%      +0.3        0.37 =C2=B1  6%  perf-profile.se=
lf.cycles-pp.read_tsc
>>        0.07 =C2=B1 12%      +0.3        0.38 =C2=B1  5%  perf-profile.se=
lf.cycles-pp.entry_SYSCALL_64_after_hwframe
>>        0.16 =C2=B1  3%      +0.3        0.47 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.kfree
>>        0.38 =C2=B1  5%      +0.3        0.72 =C2=B1 15%  perf-profile.se=
lf.cycles-pp._raw_spin_lock
>>        0.15 =C2=B1  5%      +0.3        0.50 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.sctp_outq_flush
>>        0.13 =C2=B1  9%      +0.4        0.50 =C2=B1  8%  perf-profile.se=
lf.cycles-pp.copy_user_generic_unrolled
>>        0.00            +0.4        0.38 =C2=B1  7%  perf-profile.self.cy=
cles-pp._raw_spin_trylock
>>        0.12 =C2=B1 13%      +0.4        0.50 =C2=B1 12%  perf-profile.se=
lf.cycles-pp._raw_spin_lock_bh
>>        0.38            +0.4        0.78 =C2=B1 15%  perf-profile.self.cy=
cles-pp.__list_del_entry_valid
>>        0.00            +0.4        0.40 =C2=B1  5%  perf-profile.self.cy=
cles-pp.update_sd_lb_stats
>>        0.00            +0.4        0.40 =C2=B1  6%  perf-profile.self.cy=
cles-pp.native_irq_return_iret
>>        0.00            +0.5        0.48 =C2=B1 10%  perf-profile.self.cy=
cles-pp.irqtime_account_irq
>>        0.25            +0.5        0.78 =C2=B1 12%  perf-profile.self.cy=
cles-pp.sctp_datamsg_from_user
>>        0.00            +0.7        0.71 =C2=B1  5%  perf-profile.self.cy=
cles-pp.timekeeping_max_deferment
>>        0.14 =C2=B1  8%      +1.8        1.97 =C2=B1  7%  perf-profile.se=
lf.cycles-pp.ktime_get
>>        0.07 =C2=B1  6%      +3.1        3.19 =C2=B1 16%  perf-profile.se=
lf.cycles-pp.menu_select
>>        2.14            +4.6        6.75 =C2=B1 10%  perf-profile.self.cy=
cles-pp.memcpy_erms
>>        0.02 =C2=B1141%      +5.2        5.21 =C2=B1 21%  perf-profile.se=
lf.cycles-pp.cpuidle_enter_state
>>        3.15 =C2=B1  9%      +5.6        8.75 =C2=B1  9%  perf-profile.se=
lf.cycles-pp.copy_user_enhanced_fast_string
>>      193866          +507.7%    1178182 =C2=B1 12%  interrupts.CAL:Funct=
ion_call_interrupts
>>        1527 =C2=B1 33%    +435.4%       8179 =C2=B1 11%  interrupts.CPU0=
.CAL:Function_call_interrupts
>>        7839 =C2=B1  7%     -91.6%     657.67 =C2=B1 39%  interrupts.CPU0=
.NMI:Non-maskable_interrupts
>>        7839 =C2=B1  7%     -91.6%     657.67 =C2=B1 39%  interrupts.CPU0=
.PMI:Performance_monitoring_interrupts
>>        4025 =C2=B1 13%     -96.8%     128.83 =C2=B1 26%  interrupts.CPU0=
.RES:Rescheduling_interrupts
>>       42.33 =C2=B1 99%    +337.0%     185.00 =C2=B1 35%  interrupts.CPU0=
.TLB:TLB_shootdowns
>>        1302 =C2=B1 14%    +491.9%       7706 =C2=B1 16%  interrupts.CPU1=
.CAL:Function_call_interrupts
>>        8579           -92.2%     671.67 =C2=B1 16%  interrupts.CPU1.NMI:=
Non-maskable_interrupts
>>        8579           -92.2%     671.67 =C2=B1 16%  interrupts.CPU1.PMI:=
Performance_monitoring_interrupts
>>        2396 =C2=B1 38%     -97.2%      67.83 =C2=B1 42%  interrupts.CPU1=
.RES:Rescheduling_interrupts
>>        9.00 =C2=B1117%    +801.9%      81.17 =C2=B1 83%  interrupts.CPU1=
.TLB:TLB_shootdowns
>>      981.33          +580.7%       6679 =C2=B1 18%  interrupts.CPU10.CAL=
:Function_call_interrupts
>>        8047 =C2=B1  3%     -93.5%     526.67 =C2=B1 41%  interrupts.CPU1=
0.NMI:Non-maskable_interrupts
>>        8047 =C2=B1  3%     -93.5%     526.67 =C2=B1 41%  interrupts.CPU1=
0.PMI:Performance_monitoring_interrupts
>>        3220 =C2=B1 30%     -98.0%      64.00 =C2=B1 51%  interrupts.CPU1=
0.RES:Rescheduling_interrupts
>>        1071 =C2=B1 11%    +446.5%       5854 =C2=B1  9%  interrupts.CPU1=
00.CAL:Function_call_interrupts
>>        7644 =C2=B1  6%     -92.5%     570.33 =C2=B1 45%  interrupts.CPU1=
00.NMI:Non-maskable_interrupts
>>        7644 =C2=B1  6%     -92.5%     570.33 =C2=B1 45%  interrupts.CPU1=
00.PMI:Performance_monitoring_interrupts
>>        4528 =C2=B1 13%     -99.1%      39.83 =C2=B1 51%  interrupts.CPU1=
00.RES:Rescheduling_interrupts
>>        1116 =C2=B1 11%    +435.9%       5984 =C2=B1  9%  interrupts.CPU1=
01.CAL:Function_call_interrupts
>>        7937 =C2=B1  8%     -92.5%     597.17 =C2=B1 25%  interrupts.CPU1=
01.NMI:Non-maskable_interrupts
>>        7937 =C2=B1  8%     -92.5%     597.17 =C2=B1 25%  interrupts.CPU1=
01.PMI:Performance_monitoring_interrupts
>>        4637 =C2=B1 31%     -98.5%      70.33 =C2=B1 37%  interrupts.CPU1=
01.RES:Rescheduling_interrupts
>>      970.00 =C2=B1  3%    +503.2%       5850 =C2=B1  6%  interrupts.CPU1=
02.CAL:Function_call_interrupts
>>        7898 =C2=B1  9%     -91.6%     661.00 =C2=B1 26%  interrupts.CPU1=
02.NMI:Non-maskable_interrupts
>>        7898 =C2=B1  9%     -91.6%     661.00 =C2=B1 26%  interrupts.CPU1=
02.PMI:Performance_monitoring_interrupts
>>        4719 =C2=B1 13%     -98.9%      51.33 =C2=B1 49%  interrupts.CPU1=
02.RES:Rescheduling_interrupts
>>        1030 =C2=B1  6%    +471.9%       5892 =C2=B1  8%  interrupts.CPU1=
03.CAL:Function_call_interrupts
>>        7602 =C2=B1  5%     -92.2%     593.67 =C2=B1 32%  interrupts.CPU1=
03.NMI:Non-maskable_interrupts
>>        7602 =C2=B1  5%     -92.2%     593.67 =C2=B1 32%  interrupts.CPU1=
03.PMI:Performance_monitoring_interrupts
>>        5250 =C2=B1 26%     -98.9%      58.17 =C2=B1 63%  interrupts.CPU1=
03.RES:Rescheduling_interrupts
>>        1088 =C2=B1  9%    +421.9%       5680 =C2=B1  8%  interrupts.CPU1=
04.CAL:Function_call_interrupts
>>        8192 =C2=B1  5%     -94.8%     426.33 =C2=B1 36%  interrupts.CPU1=
04.NMI:Non-maskable_interrupts
>>        8192 =C2=B1  5%     -94.8%     426.33 =C2=B1 36%  interrupts.CPU1=
04.PMI:Performance_monitoring_interrupts
>>        4888 =C2=B1 12%     -99.2%      38.00 =C2=B1 64%  interrupts.CPU1=
04.RES:Rescheduling_interrupts
>>        1009 =C2=B1  9%    +480.3%       5857 =C2=B1  9%  interrupts.CPU1=
05.CAL:Function_call_interrupts
>>        8428 =C2=B1  4%     -92.4%     638.33 =C2=B1 20%  interrupts.CPU1=
05.NMI:Non-maskable_interrupts
>>        8428 =C2=B1  4%     -92.4%     638.33 =C2=B1 20%  interrupts.CPU1=
05.PMI:Performance_monitoring_interrupts
>>        3591 =C2=B1 22%     -98.5%      52.67 =C2=B1 31%  interrupts.CPU1=
05.RES:Rescheduling_interrupts
>>        1056 =C2=B1 10%    +483.2%       6162 =C2=B1 21%  interrupts.CPU1=
06.CAL:Function_call_interrupts
>>        8180 =C2=B1  3%     -92.5%     616.83 =C2=B1 30%  interrupts.CPU1=
06.NMI:Non-maskable_interrupts
>>        8180 =C2=B1  3%     -92.5%     616.83 =C2=B1 30%  interrupts.CPU1=
06.PMI:Performance_monitoring_interrupts
>>        4024 =C2=B1 21%     -98.6%      58.17 =C2=B1 59%  interrupts.CPU1=
06.RES:Rescheduling_interrupts
>>      979.33 =C2=B1  2%    +524.2%       6113 =C2=B1  9%  interrupts.CPU1=
07.CAL:Function_call_interrupts
>>        7624 =C2=B1 12%     -90.6%     717.83 =C2=B1 28%  interrupts.CPU1=
07.NMI:Non-maskable_interrupts
>>        7624 =C2=B1 12%     -90.6%     717.83 =C2=B1 28%  interrupts.CPU1=
07.PMI:Performance_monitoring_interrupts
>>        4957 =C2=B1 18%     -99.0%      51.83 =C2=B1 27%  interrupts.CPU1=
07.RES:Rescheduling_interrupts
>>      993.00 =C2=B1  3%    +496.3%       5921 =C2=B1  9%  interrupts.CPU1=
08.CAL:Function_call_interrupts
>>        7535 =C2=B1  8%     -92.3%     576.67 =C2=B1 35%  interrupts.CPU1=
08.NMI:Non-maskable_interrupts
>>        7535 =C2=B1  8%     -92.3%     576.67 =C2=B1 35%  interrupts.CPU1=
08.PMI:Performance_monitoring_interrupts
>>        4697 =C2=B1 13%     -98.9%      51.33 =C2=B1 44%  interrupts.CPU1=
08.RES:Rescheduling_interrupts
>>      986.33          +504.0%       5957 =C2=B1 12%  interrupts.CPU109.CA=
L:Function_call_interrupts
>>        7260 =C2=B1 15%     -90.8%     668.00 =C2=B1 23%  interrupts.CPU1=
09.NMI:Non-maskable_interrupts
>>        7260 =C2=B1 15%     -90.8%     668.00 =C2=B1 23%  interrupts.CPU1=
09.PMI:Performance_monitoring_interrupts
>>        3632 =C2=B1 38%     -98.4%      58.17 =C2=B1 42%  interrupts.CPU1=
09.RES:Rescheduling_interrupts
>>      966.00          +621.8%       6973 =C2=B1 12%  interrupts.CPU11.CAL=
:Function_call_interrupts
>>        8024           -90.8%     741.67 =C2=B1 33%  interrupts.CPU11.NMI=
:Non-maskable_interrupts
>>        8024           -90.8%     741.67 =C2=B1 33%  interrupts.CPU11.PMI=
:Performance_monitoring_interrupts
>>        2131 =C2=B1 18%     -95.4%      97.50 =C2=B1 42%  interrupts.CPU1=
1.RES:Rescheduling_interrupts
>>      979.33 =C2=B1  8%    +496.3%       5839 =C2=B1 11%  interrupts.CPU1=
10.CAL:Function_call_interrupts
>>        7487 =C2=B1  8%     -90.1%     744.83 =C2=B1 38%  interrupts.CPU1=
10.NMI:Non-maskable_interrupts
>>        7487 =C2=B1  8%     -90.1%     744.83 =C2=B1 38%  interrupts.CPU1=
10.PMI:Performance_monitoring_interrupts
>>        4319 =C2=B1 10%     -99.2%      35.67 =C2=B1 51%  interrupts.CPU1=
10.RES:Rescheduling_interrupts
>>      988.00 =C2=B1  4%    +484.4%       5773 =C2=B1  9%  interrupts.CPU1=
11.CAL:Function_call_interrupts
>>        7882 =C2=B1  9%     -91.1%     705.17 =C2=B1 33%  interrupts.CPU1=
11.NMI:Non-maskable_interrupts
>>        7882 =C2=B1  9%     -91.1%     705.17 =C2=B1 33%  interrupts.CPU1=
11.PMI:Performance_monitoring_interrupts
>>        3780 =C2=B1 42%     -98.9%      40.83 =C2=B1 73%  interrupts.CPU1=
11.RES:Rescheduling_interrupts
>>        1097 =C2=B1  9%    +439.2%       5914 =C2=B1 10%  interrupts.CPU1=
12.CAL:Function_call_interrupts
>>        7731 =C2=B1  9%     -91.5%     658.50 =C2=B1 44%  interrupts.CPU1=
12.NMI:Non-maskable_interrupts
>>        7731 =C2=B1  9%     -91.5%     658.50 =C2=B1 44%  interrupts.CPU1=
12.PMI:Performance_monitoring_interrupts
>>        3730 =C2=B1 21%     -98.8%      45.50 =C2=B1 62%  interrupts.CPU1=
12.RES:Rescheduling_interrupts
>>        1062 =C2=B1  8%    +451.6%       5857 =C2=B1  7%  interrupts.CPU1=
13.CAL:Function_call_interrupts
>>        7971           -94.0%     479.00 =C2=B1 32%  interrupts.CPU113.NM=
I:Non-maskable_interrupts
>>        7971           -94.0%     479.00 =C2=B1 32%  interrupts.CPU113.PM=
I:Performance_monitoring_interrupts
>>        4755 =C2=B1  5%     -98.5%      69.33 =C2=B1 67%  interrupts.CPU1=
13.RES:Rescheduling_interrupts
>>        1109 =C2=B1 14%    +437.2%       5958 =C2=B1 11%  interrupts.CPU1=
14.CAL:Function_call_interrupts
>>        8124           -94.6%     439.00 =C2=B1 36%  interrupts.CPU114.NM=
I:Non-maskable_interrupts
>>        8124           -94.6%     439.00 =C2=B1 36%  interrupts.CPU114.PM=
I:Performance_monitoring_interrupts
>>        4289 =C2=B1 37%     -99.0%      44.00 =C2=B1 89%  interrupts.CPU1=
14.RES:Rescheduling_interrupts
>>      967.67 =C2=B1  2%    +522.3%       6022 =C2=B1 12%  interrupts.CPU1=
15.CAL:Function_call_interrupts
>>        5866 =C2=B1 34%     -90.8%     538.33 =C2=B1 37%  interrupts.CPU1=
15.NMI:Non-maskable_interrupts
>>        5866 =C2=B1 34%     -90.8%     538.33 =C2=B1 37%  interrupts.CPU1=
15.PMI:Performance_monitoring_interrupts
>>        3539 =C2=B1 40%     -98.7%      45.00 =C2=B1 58%  interrupts.CPU1=
15.RES:Rescheduling_interrupts
>>        1016 =C2=B1  4%    +480.2%       5894 =C2=B1 11%  interrupts.CPU1=
16.CAL:Function_call_interrupts
>>        7958 =C2=B1  7%     -91.5%     676.50 =C2=B1 20%  interrupts.CPU1=
16.NMI:Non-maskable_interrupts
>>        7958 =C2=B1  7%     -91.5%     676.50 =C2=B1 20%  interrupts.CPU1=
16.PMI:Performance_monitoring_interrupts
>>        4158 =C2=B1 16%     -98.9%      45.67 =C2=B1 57%  interrupts.CPU1=
16.RES:Rescheduling_interrupts
>>      983.33 =C2=B1  4%    +503.4%       5933 =C2=B1  9%  interrupts.CPU1=
17.CAL:Function_call_interrupts
>>        7506 =C2=B1  3%     -92.9%     531.17 =C2=B1 28%  interrupts.CPU1=
17.NMI:Non-maskable_interrupts
>>        7506 =C2=B1  3%     -92.9%     531.17 =C2=B1 28%  interrupts.CPU1=
17.PMI:Performance_monitoring_interrupts
>>        3800 =C2=B1 20%     -98.8%      46.33 =C2=B1 33%  interrupts.CPU1=
17.RES:Rescheduling_interrupts
>>        1091 =C2=B1 13%    +436.1%       5849 =C2=B1  6%  interrupts.CPU1=
18.CAL:Function_call_interrupts
>>        7758 =C2=B1 17%     -92.2%     604.33 =C2=B1 40%  interrupts.CPU1=
18.NMI:Non-maskable_interrupts
>>        7758 =C2=B1 17%     -92.2%     604.33 =C2=B1 40%  interrupts.CPU1=
18.PMI:Performance_monitoring_interrupts
>>        3717 =C2=B1 46%     -98.4%      60.00 =C2=B1 39%  interrupts.CPU1=
18.RES:Rescheduling_interrupts
>>        1091 =C2=B1 12%    +437.9%       5872 =C2=B1  6%  interrupts.CPU1=
19.CAL:Function_call_interrupts
>>        7658 =C2=B1 14%     -92.0%     615.00 =C2=B1 26%  interrupts.CPU1=
19.NMI:Non-maskable_interrupts
>>        7658 =C2=B1 14%     -92.0%     615.00 =C2=B1 26%  interrupts.CPU1=
19.PMI:Performance_monitoring_interrupts
>>        4046 =C2=B1 14%     -98.9%      46.33 =C2=B1 44%  interrupts.CPU1=
19.RES:Rescheduling_interrupts
>>      963.33          +592.6%       6672 =C2=B1 10%  interrupts.CPU12.CAL=
:Function_call_interrupts
>>        8049 =C2=B1  5%     -93.3%     539.67 =C2=B1 42%  interrupts.CPU1=
2.NMI:Non-maskable_interrupts
>>        8049 =C2=B1  5%     -93.3%     539.67 =C2=B1 42%  interrupts.CPU1=
2.PMI:Performance_monitoring_interrupts
>>        2398 =C2=B1 31%     -96.1%      92.50 =C2=B1 43%  interrupts.CPU1=
2.RES:Rescheduling_interrupts
>>        1000 =C2=B1  9%    +511.2%       6116 =C2=B1 17%  interrupts.CPU1=
20.CAL:Function_call_interrupts
>>        7886 =C2=B1  4%     -92.8%     571.17 =C2=B1 42%  interrupts.CPU1=
20.NMI:Non-maskable_interrupts
>>        7886 =C2=B1  4%     -92.8%     571.17 =C2=B1 42%  interrupts.CPU1=
20.PMI:Performance_monitoring_interrupts
>>        5494 =C2=B1 34%     -99.2%      46.67 =C2=B1 63%  interrupts.CPU1=
20.RES:Rescheduling_interrupts
>>      927.33          +536.2%       5899 =C2=B1 18%  interrupts.CPU121.CA=
L:Function_call_interrupts
>>        8397 =C2=B1  3%     -94.4%     468.33 =C2=B1  8%  interrupts.CPU1=
21.NMI:Non-maskable_interrupts
>>        8397 =C2=B1  3%     -94.4%     468.33 =C2=B1  8%  interrupts.CPU1=
21.PMI:Performance_monitoring_interrupts
>>        4748 =C2=B1 13%     -99.2%      39.00 =C2=B1 72%  interrupts.CPU1=
21.RES:Rescheduling_interrupts
>>      981.00 =C2=B1  6%    +485.0%       5739 =C2=B1 19%  interrupts.CPU1=
22.CAL:Function_call_interrupts
>>        8139 =C2=B1 10%     -93.1%     562.33 =C2=B1 27%  interrupts.CPU1=
22.NMI:Non-maskable_interrupts
>>        8139 =C2=B1 10%     -93.1%     562.33 =C2=B1 27%  interrupts.CPU1=
22.PMI:Performance_monitoring_interrupts
>>        5389 =C2=B1 47%     -99.2%      45.33 =C2=B1 76%  interrupts.CPU1=
22.RES:Rescheduling_interrupts
>>      939.67          +510.0%       5731 =C2=B1 19%  interrupts.CPU123.CA=
L:Function_call_interrupts
>>        7914 =C2=B1  9%     -92.2%     614.67 =C2=B1 32%  interrupts.CPU1=
23.NMI:Non-maskable_interrupts
>>        7914 =C2=B1  9%     -92.2%     614.67 =C2=B1 32%  interrupts.CPU1=
23.PMI:Performance_monitoring_interrupts
>>        5801 =C2=B1 34%     -99.3%      41.83 =C2=B1 82%  interrupts.CPU1=
23.RES:Rescheduling_interrupts
>>        1053 =C2=B1 16%    +424.6%       5525 =C2=B1 17%  interrupts.CPU1=
24.CAL:Function_call_interrupts
>>        7937 =C2=B1 10%     -93.5%     518.50 =C2=B1 40%  interrupts.CPU1=
24.NMI:Non-maskable_interrupts
>>        7937 =C2=B1 10%     -93.5%     518.50 =C2=B1 40%  interrupts.CPU1=
24.PMI:Performance_monitoring_interrupts
>>        4429 =C2=B1 12%     -99.0%      42.17 =C2=B1 79%  interrupts.CPU1=
24.RES:Rescheduling_interrupts
>>      946.33          +483.2%       5519 =C2=B1 22%  interrupts.CPU125.CA=
L:Function_call_interrupts
>>        7929 =C2=B1  9%     -94.7%     420.00 =C2=B1 55%  interrupts.CPU1=
25.NMI:Non-maskable_interrupts
>>        7929 =C2=B1  9%     -94.7%     420.00 =C2=B1 55%  interrupts.CPU1=
25.PMI:Performance_monitoring_interrupts
>>        5138 =C2=B1 21%     -99.2%      40.50 =C2=B1 65%  interrupts.CPU1=
25.RES:Rescheduling_interrupts
>>      984.67 =C2=B1  6%    +478.8%       5698 =C2=B1 19%  interrupts.CPU1=
26.CAL:Function_call_interrupts
>>        7758 =C2=B1  3%     -93.5%     504.50 =C2=B1 44%  interrupts.CPU1=
26.NMI:Non-maskable_interrupts
>>        7758 =C2=B1  3%     -93.5%     504.50 =C2=B1 44%  interrupts.CPU1=
26.PMI:Performance_monitoring_interrupts
>>        5744 =C2=B1 30%     -99.2%      44.00 =C2=B1 68%  interrupts.CPU1=
26.RES:Rescheduling_interrupts
>>        1022 =C2=B1 11%    +449.7%       5621 =C2=B1 15%  interrupts.CPU1=
27.CAL:Function_call_interrupts
>>        8123 =C2=B1  5%     -91.8%     664.33 =C2=B1 56%  interrupts.CPU1=
27.NMI:Non-maskable_interrupts
>>        8123 =C2=B1  5%     -91.8%     664.33 =C2=B1 56%  interrupts.CPU1=
27.PMI:Performance_monitoring_interrupts
>>        5200 =C2=B1 17%     -99.1%      45.67 =C2=B1 73%  interrupts.CPU1=
27.RES:Rescheduling_interrupts
>>      971.00 =C2=B1  4%    +478.5%       5617 =C2=B1 21%  interrupts.CPU1=
28.CAL:Function_call_interrupts
>>        8093 =C2=B1  6%     -93.8%     503.17 =C2=B1 29%  interrupts.CPU1=
28.NMI:Non-maskable_interrupts
>>        8093 =C2=B1  6%     -93.8%     503.17 =C2=B1 29%  interrupts.CPU1=
28.PMI:Performance_monitoring_interrupts
>>        4360 =C2=B1 52%     -99.1%      38.33 =C2=B1 95%  interrupts.CPU1=
28.RES:Rescheduling_interrupts
>>        1000 =C2=B1  9%    +444.9%       5452 =C2=B1 16%  interrupts.CPU1=
29.CAL:Function_call_interrupts
>>        7954 =C2=B1  8%     -90.7%     738.50 =C2=B1 28%  interrupts.CPU1=
29.NMI:Non-maskable_interrupts
>>        7954 =C2=B1  8%     -90.7%     738.50 =C2=B1 28%  interrupts.CPU1=
29.PMI:Performance_monitoring_interrupts
>>        3957 =C2=B1 42%     -99.0%      39.00 =C2=B1 81%  interrupts.CPU1=
29.RES:Rescheduling_interrupts
>>      993.67 =C2=B1  3%    +570.7%       6664 =C2=B1 10%  interrupts.CPU1=
3.CAL:Function_call_interrupts
>>        7872 =C2=B1  2%     -92.1%     624.83 =C2=B1 30%  interrupts.CPU1=
3.NMI:Non-maskable_interrupts
>>        7872 =C2=B1  2%     -92.1%     624.83 =C2=B1 30%  interrupts.CPU1=
3.PMI:Performance_monitoring_interrupts
>>        3968 =C2=B1 28%     -98.0%      81.00 =C2=B1 23%  interrupts.CPU1=
3.RES:Rescheduling_interrupts
>>      955.67 =C2=B1  3%    +464.8%       5398 =C2=B1 19%  interrupts.CPU1=
30.CAL:Function_call_interrupts
>>        8292 =C2=B1  4%     -92.4%     634.33 =C2=B1 23%  interrupts.CPU1=
30.NMI:Non-maskable_interrupts
>>        8292 =C2=B1  4%     -92.4%     634.33 =C2=B1 23%  interrupts.CPU1=
30.PMI:Performance_monitoring_interrupts
>>        2770 =C2=B1 27%     -98.4%      44.83 =C2=B1 84%  interrupts.CPU1=
30.RES:Rescheduling_interrupts
>>      962.00 =C2=B1  3%    +494.1%       5715 =C2=B1 20%  interrupts.CPU1=
31.CAL:Function_call_interrupts
>>        8381 =C2=B1  4%     -91.0%     754.33 =C2=B1 44%  interrupts.CPU1=
31.NMI:Non-maskable_interrupts
>>        8381 =C2=B1  4%     -91.0%     754.33 =C2=B1 44%  interrupts.CPU1=
31.PMI:Performance_monitoring_interrupts
>>        4669 =C2=B1 20%     -99.0%      46.33 =C2=B1 83%  interrupts.CPU1=
31.RES:Rescheduling_interrupts
>>      996.00 =C2=B1  7%    +467.2%       5649 =C2=B1 17%  interrupts.CPU1=
32.CAL:Function_call_interrupts
>>        6287 =C2=B1 34%     -90.9%     569.83 =C2=B1 20%  interrupts.CPU1=
32.NMI:Non-maskable_interrupts
>>        6287 =C2=B1 34%     -90.9%     569.83 =C2=B1 20%  interrupts.CPU1=
32.PMI:Performance_monitoring_interrupts
>>        5832 =C2=B1 23%     -99.3%      41.00 =C2=B1 76%  interrupts.CPU1=
32.RES:Rescheduling_interrupts
>>        1009 =C2=B1  9%    +458.3%       5634 =C2=B1 17%  interrupts.CPU1=
33.CAL:Function_call_interrupts
>>        8112 =C2=B1  3%     -92.1%     644.67 =C2=B1 11%  interrupts.CPU1=
33.NMI:Non-maskable_interrupts
>>        8112 =C2=B1  3%     -92.1%     644.67 =C2=B1 11%  interrupts.CPU1=
33.PMI:Performance_monitoring_interrupts
>>        5312 =C2=B1 45%     -99.3%      35.00 =C2=B1 88%  interrupts.CPU1=
33.RES:Rescheduling_interrupts
>>      978.00 =C2=B1  6%    +464.4%       5520 =C2=B1 19%  interrupts.CPU1=
34.CAL:Function_call_interrupts
>>        7706 =C2=B1 12%     -93.9%     472.17 =C2=B1 45%  interrupts.CPU1=
34.NMI:Non-maskable_interrupts
>>        7706 =C2=B1 12%     -93.9%     472.17 =C2=B1 45%  interrupts.CPU1=
34.PMI:Performance_monitoring_interrupts
>>        3729 =C2=B1 52%     -98.9%      39.67 =C2=B1 53%  interrupts.CPU1=
34.RES:Rescheduling_interrupts
>>      960.00 =C2=B1  3%    +488.9%       5653 =C2=B1 15%  interrupts.CPU1=
35.CAL:Function_call_interrupts
>>        7890 =C2=B1 10%     -88.8%     880.33 =C2=B1 38%  interrupts.CPU1=
35.NMI:Non-maskable_interrupts
>>        7890 =C2=B1 10%     -88.8%     880.33 =C2=B1 38%  interrupts.CPU1=
35.PMI:Performance_monitoring_interrupts
>>        5624 =C2=B1 31%     -99.2%      43.50 =C2=B1 69%  interrupts.CPU1=
35.RES:Rescheduling_interrupts
>>        1034 =C2=B1 13%    +443.6%       5624 =C2=B1 14%  interrupts.CPU1=
36.CAL:Function_call_interrupts
>>        8406 =C2=B1  5%     -94.2%     487.67 =C2=B1 33%  interrupts.CPU1=
36.NMI:Non-maskable_interrupts
>>        8406 =C2=B1  5%     -94.2%     487.67 =C2=B1 33%  interrupts.CPU1=
36.PMI:Performance_monitoring_interrupts
>>        3449 =C2=B1 36%     -98.9%      39.50 =C2=B1 82%  interrupts.CPU1=
36.RES:Rescheduling_interrupts
>>        1068 =C2=B1 17%    +432.5%       5690 =C2=B1 17%  interrupts.CPU1=
37.CAL:Function_call_interrupts
>>        8298 =C2=B1  3%     -92.3%     641.83 =C2=B1 44%  interrupts.CPU1=
37.NMI:Non-maskable_interrupts
>>        8298 =C2=B1  3%     -92.3%     641.83 =C2=B1 44%  interrupts.CPU1=
37.PMI:Performance_monitoring_interrupts
>>        5296 =C2=B1 44%     -99.2%      39.83 =C2=B1 84%  interrupts.CPU1=
37.RES:Rescheduling_interrupts
>>      978.67 =C2=B1  6%    +488.5%       5759 =C2=B1 18%  interrupts.CPU1=
38.CAL:Function_call_interrupts
>>        8040 =C2=B1  6%     -92.7%     583.17 =C2=B1 35%  interrupts.CPU1=
38.NMI:Non-maskable_interrupts
>>        8040 =C2=B1  6%     -92.7%     583.17 =C2=B1 35%  interrupts.CPU1=
38.PMI:Performance_monitoring_interrupts
>>        3035 =C2=B1 17%     -98.6%      41.83 =C2=B1 80%  interrupts.CPU1=
38.RES:Rescheduling_interrupts
>>        1013 =C2=B1 10%    +458.4%       5659 =C2=B1 17%  interrupts.CPU1=
39.CAL:Function_call_interrupts
>>        7957 =C2=B1  7%     -93.6%     510.67 =C2=B1 46%  interrupts.CPU1=
39.NMI:Non-maskable_interrupts
>>        7957 =C2=B1  7%     -93.6%     510.67 =C2=B1 46%  interrupts.CPU1=
39.PMI:Performance_monitoring_interrupts
>>        5710 =C2=B1  9%     -99.2%      46.33 =C2=B1 83%  interrupts.CPU1=
39.RES:Rescheduling_interrupts
>>        1034 =C2=B1  5%    +529.2%       6506 =C2=B1 10%  interrupts.CPU1=
4.CAL:Function_call_interrupts
>>        8375 =C2=B1  5%     -90.6%     785.17 =C2=B1 27%  interrupts.CPU1=
4.NMI:Non-maskable_interrupts
>>        8375 =C2=B1  5%     -90.6%     785.17 =C2=B1 27%  interrupts.CPU1=
4.PMI:Performance_monitoring_interrupts
>>        2770 =C2=B1 47%     -97.0%      82.67 =C2=B1 40%  interrupts.CPU1=
4.RES:Rescheduling_interrupts
>>      989.33 =C2=B1  8%    +482.8%       5765 =C2=B1 14%  interrupts.CPU1=
40.CAL:Function_call_interrupts
>>        8159 =C2=B1  4%     -92.9%     582.83 =C2=B1 36%  interrupts.CPU1=
40.NMI:Non-maskable_interrupts
>>        8159 =C2=B1  4%     -92.9%     582.83 =C2=B1 36%  interrupts.CPU1=
40.PMI:Performance_monitoring_interrupts
>>        3658 =C2=B1 34%     -99.0%      36.50 =C2=B1 86%  interrupts.CPU1=
40.RES:Rescheduling_interrupts
>>        1003 =C2=B1  9%    +465.7%       5674 =C2=B1 18%  interrupts.CPU1=
41.CAL:Function_call_interrupts
>>        8107 =C2=B1  5%     -91.6%     685.00 =C2=B1 26%  interrupts.CPU1=
41.NMI:Non-maskable_interrupts
>>        8107 =C2=B1  5%     -91.6%     685.00 =C2=B1 26%  interrupts.CPU1=
41.PMI:Performance_monitoring_interrupts
>>        5360 =C2=B1 35%     -99.2%      42.00 =C2=B1 67%  interrupts.CPU1=
41.RES:Rescheduling_interrupts
>>      970.33 =C2=B1  5%    +501.4%       5835 =C2=B1 24%  interrupts.CPU1=
42.CAL:Function_call_interrupts
>>        7947 =C2=B1 12%     -93.1%     549.67 =C2=B1 37%  interrupts.CPU1=
42.NMI:Non-maskable_interrupts
>>        7947 =C2=B1 12%     -93.1%     549.67 =C2=B1 37%  interrupts.CPU1=
42.PMI:Performance_monitoring_interrupts
>>        3739 =C2=B1 39%     -98.9%      42.00 =C2=B1 87%  interrupts.CPU1=
42.RES:Rescheduling_interrupts
>>        1060 =C2=B1 15%    +428.9%       5606 =C2=B1 14%  interrupts.CPU1=
43.CAL:Function_call_interrupts
>>        7841 =C2=B1  4%     -91.8%     643.50 =C2=B1 23%  interrupts.CPU1=
43.NMI:Non-maskable_interrupts
>>        7841 =C2=B1  4%     -91.8%     643.50 =C2=B1 23%  interrupts.CPU1=
43.PMI:Performance_monitoring_interrupts
>>        6071 =C2=B1 32%     -99.3%      44.33 =C2=B1 75%  interrupts.CPU1=
43.RES:Rescheduling_interrupts
>>        1025 =C2=B1  3%    +529.9%       6461 =C2=B1 12%  interrupts.CPU1=
44.CAL:Function_call_interrupts
>>        8327 =C2=B1  3%     -91.4%     714.50 =C2=B1 34%  interrupts.CPU1=
44.NMI:Non-maskable_interrupts
>>        8327 =C2=B1  3%     -91.4%     714.50 =C2=B1 34%  interrupts.CPU1=
44.PMI:Performance_monitoring_interrupts
>>        4706 =C2=B1 26%     -99.0%      49.33 =C2=B1 52%  interrupts.CPU1=
44.RES:Rescheduling_interrupts
>>        5.67 =C2=B1 81%    +664.7%      43.33 =C2=B1 86%  interrupts.CPU1=
44.TLB:TLB_shootdowns
>>      994.67 =C2=B1  2%    +493.0%       5898 =C2=B1 12%  interrupts.CPU1=
45.CAL:Function_call_interrupts
>>        8395 =C2=B1  3%     -94.4%     472.33 =C2=B1 30%  interrupts.CPU1=
45.NMI:Non-maskable_interrupts
>>        8395 =C2=B1  3%     -94.4%     472.33 =C2=B1 30%  interrupts.CPU1=
45.PMI:Performance_monitoring_interrupts
>>        3213 =C2=B1 37%     -98.7%      41.33 =C2=B1 77%  interrupts.CPU1=
45.RES:Rescheduling_interrupts
>>        1071 =C2=B1  3%    +432.1%       5702 =C2=B1 16%  interrupts.CPU1=
46.CAL:Function_call_interrupts
>>        8300 =C2=B1  3%     -95.2%     399.67 =C2=B1 46%  interrupts.CPU1=
46.NMI:Non-maskable_interrupts
>>        8300 =C2=B1  3%     -95.2%     399.67 =C2=B1 46%  interrupts.CPU1=
46.PMI:Performance_monitoring_interrupts
>>        5909 =C2=B1  2%     -99.3%      42.33 =C2=B1 59%  interrupts.CPU1=
46.RES:Rescheduling_interrupts
>>        1046 =C2=B1  2%    +444.7%       5699 =C2=B1 15%  interrupts.CPU1=
47.CAL:Function_call_interrupts
>>        7832 =C2=B1 10%     -93.7%     492.50 =C2=B1 45%  interrupts.CPU1=
47.NMI:Non-maskable_interrupts
>>        7832 =C2=B1 10%     -93.7%     492.50 =C2=B1 45%  interrupts.CPU1=
47.PMI:Performance_monitoring_interrupts
>>        4298 =C2=B1 27%     -99.0%      40.83 =C2=B1 64%  interrupts.CPU1=
47.RES:Rescheduling_interrupts
>>        1028 =C2=B1  5%    +455.5%       5714 =C2=B1 11%  interrupts.CPU1=
48.CAL:Function_call_interrupts
>>        7808 =C2=B1  9%     -91.3%     675.50 =C2=B1 27%  interrupts.CPU1=
48.NMI:Non-maskable_interrupts
>>        7808 =C2=B1  9%     -91.3%     675.50 =C2=B1 27%  interrupts.CPU1=
48.PMI:Performance_monitoring_interrupts
>>        3766 =C2=B1 47%     -99.1%      34.33 =C2=B1 72%  interrupts.CPU1=
48.RES:Rescheduling_interrupts
>>        1046 =C2=B1 11%    +452.5%       5779 =C2=B1 12%  interrupts.CPU1=
49.CAL:Function_call_interrupts
>>        8231 =C2=B1  4%     -91.8%     678.83 =C2=B1 36%  interrupts.CPU1=
49.NMI:Non-maskable_interrupts
>>        8231 =C2=B1  4%     -91.8%     678.83 =C2=B1 36%  interrupts.CPU1=
49.PMI:Performance_monitoring_interrupts
>>        4239 =C2=B1 25%     -99.1%      37.83 =C2=B1 66%  interrupts.CPU1=
49.RES:Rescheduling_interrupts
>>        1103 =C2=B1 14%    +484.8%       6450 =C2=B1 11%  interrupts.CPU1=
5.CAL:Function_call_interrupts
>>        8058 =C2=B1  6%     -91.4%     691.33 =C2=B1 28%  interrupts.CPU1=
5.NMI:Non-maskable_interrupts
>>        8058 =C2=B1  6%     -91.4%     691.33 =C2=B1 28%  interrupts.CPU1=
5.PMI:Performance_monitoring_interrupts
>>        3289 =C2=B1 37%     -98.1%      62.83 =C2=B1 51%  interrupts.CPU1=
5.RES:Rescheduling_interrupts
>>        1521 =C2=B1 44%    +299.3%       6075 =C2=B1 15%  interrupts.CPU1=
50.CAL:Function_call_interrupts
>>        7914 =C2=B1  3%     -94.0%     474.83 =C2=B1 53%  interrupts.CPU1=
50.NMI:Non-maskable_interrupts
>>        7914 =C2=B1  3%     -94.0%     474.83 =C2=B1 53%  interrupts.CPU1=
50.PMI:Performance_monitoring_interrupts
>>        4969 =C2=B1 12%     -99.1%      46.00 =C2=B1 67%  interrupts.CPU1=
50.RES:Rescheduling_interrupts
>>        1060          +477.5%       6123 =C2=B1 16%  interrupts.CPU151.CA=
L:Function_call_interrupts
>>        8320 =C2=B1  6%     -91.1%     741.50 =C2=B1 26%  interrupts.CPU1=
51.NMI:Non-maskable_interrupts
>>        8320 =C2=B1  6%     -91.1%     741.50 =C2=B1 26%  interrupts.CPU1=
51.PMI:Performance_monitoring_interrupts
>>        4602 =C2=B1 18%     -99.1%      39.50 =C2=B1 66%  interrupts.CPU1=
51.RES:Rescheduling_interrupts
>>        1052          +460.1%       5891 =C2=B1 15%  interrupts.CPU152.CA=
L:Function_call_interrupts
>>        7527 =C2=B1  9%     -92.9%     538.00 =C2=B1 51%  interrupts.CPU1=
52.NMI:Non-maskable_interrupts
>>        7527 =C2=B1  9%     -92.9%     538.00 =C2=B1 51%  interrupts.CPU1=
52.PMI:Performance_monitoring_interrupts
>>        4974 =C2=B1  7%     -99.2%      40.33 =C2=B1 63%  interrupts.CPU1=
52.RES:Rescheduling_interrupts
>>        1060 =C2=B1  8%    +437.9%       5705 =C2=B1  9%  interrupts.CPU1=
53.CAL:Function_call_interrupts
>>        8645           -92.8%     624.00 =C2=B1 36%  interrupts.CPU153.NM=
I:Non-maskable_interrupts
>>        8645           -92.8%     624.00 =C2=B1 36%  interrupts.CPU153.PM=
I:Performance_monitoring_interrupts
>>        3947 =C2=B1 62%     -98.9%      41.67 =C2=B1 68%  interrupts.CPU1=
53.RES:Rescheduling_interrupts
>>        1136 =C2=B1  9%    +382.4%       5482 =C2=B1 12%  interrupts.CPU1=
54.CAL:Function_call_interrupts
>>        8154 =C2=B1  5%     -92.2%     637.17 =C2=B1 35%  interrupts.CPU1=
54.NMI:Non-maskable_interrupts
>>        8154 =C2=B1  5%     -92.2%     637.17 =C2=B1 35%  interrupts.CPU1=
54.PMI:Performance_monitoring_interrupts
>>        4503 =C2=B1 29%     -99.1%      41.17 =C2=B1 60%  interrupts.CPU1=
54.RES:Rescheduling_interrupts
>>      975.00 =C2=B1 26%    +485.3%       5706 =C2=B1 10%  interrupts.CPU1=
55.CAL:Function_call_interrupts
>>        8111 =C2=B1  5%     -93.9%     492.67 =C2=B1 29%  interrupts.CPU1=
55.NMI:Non-maskable_interrupts
>>        8111 =C2=B1  5%     -93.9%     492.67 =C2=B1 29%  interrupts.CPU1=
55.PMI:Performance_monitoring_interrupts
>>        5479 =C2=B1 26%     -99.2%      43.50 =C2=B1 66%  interrupts.CPU1=
55.RES:Rescheduling_interrupts
>>      988.33          +494.9%       5879 =C2=B1 12%  interrupts.CPU156.CA=
L:Function_call_interrupts
>>        8388 =C2=B1  4%     -94.1%     494.00 =C2=B1 50%  interrupts.CPU1=
56.NMI:Non-maskable_interrupts
>>        8388 =C2=B1  4%     -94.1%     494.00 =C2=B1 50%  interrupts.CPU1=
56.PMI:Performance_monitoring_interrupts
>>        3565 =C2=B1 19%     -98.7%      44.67 =C2=B1 61%  interrupts.CPU1=
56.RES:Rescheduling_interrupts
>>        1045 =C2=B1  3%    +461.8%       5870 =C2=B1  8%  interrupts.CPU1=
57.CAL:Function_call_interrupts
>>        8129 =C2=B1  5%     -89.8%     828.50 =C2=B1 33%  interrupts.CPU1=
57.NMI:Non-maskable_interrupts
>>        8129 =C2=B1  5%     -89.8%     828.50 =C2=B1 33%  interrupts.CPU1=
57.PMI:Performance_monitoring_interrupts
>>        4317 =C2=B1  7%     -99.1%      39.67 =C2=B1 68%  interrupts.CPU1=
57.RES:Rescheduling_interrupts
>>        1015 =C2=B1  6%    +469.4%       5781 =C2=B1 12%  interrupts.CPU1=
58.CAL:Function_call_interrupts
>>        8306 =C2=B1  4%     -92.1%     654.83 =C2=B1 44%  interrupts.CPU1=
58.NMI:Non-maskable_interrupts
>>        8306 =C2=B1  4%     -92.1%     654.83 =C2=B1 44%  interrupts.CPU1=
58.PMI:Performance_monitoring_interrupts
>>        3996 =C2=B1 38%     -98.9%      42.83 =C2=B1 60%  interrupts.CPU1=
58.RES:Rescheduling_interrupts
>>        1085 =C2=B1  6%    +432.9%       5785 =C2=B1 13%  interrupts.CPU1=
59.CAL:Function_call_interrupts
>>        8378 =C2=B1  5%     -93.9%     510.50 =C2=B1 53%  interrupts.CPU1=
59.NMI:Non-maskable_interrupts
>>        8378 =C2=B1  5%     -93.9%     510.50 =C2=B1 53%  interrupts.CPU1=
59.PMI:Performance_monitoring_interrupts
>>        4461 =C2=B1 13%     -98.9%      48.33 =C2=B1 49%  interrupts.CPU1=
59.RES:Rescheduling_interrupts
>>      966.67 =C2=B1  2%    +584.9%       6621 =C2=B1 11%  interrupts.CPU1=
6.CAL:Function_call_interrupts
>>        8707           -91.1%     776.33 =C2=B1 32%  interrupts.CPU16.NMI=
:Non-maskable_interrupts
>>        8707           -91.1%     776.33 =C2=B1 32%  interrupts.CPU16.PMI=
:Performance_monitoring_interrupts
>>        2965 =C2=B1 57%     -97.9%      63.50 =C2=B1 45%  interrupts.CPU1=
6.RES:Rescheduling_interrupts
>>        1002 =C2=B1  4%    +483.1%       5842 =C2=B1 14%  interrupts.CPU1=
60.CAL:Function_call_interrupts
>>        8620           -94.0%     517.50 =C2=B1 49%  interrupts.CPU160.NM=
I:Non-maskable_interrupts
>>        8620           -94.0%     517.50 =C2=B1 49%  interrupts.CPU160.PM=
I:Performance_monitoring_interrupts
>>        3210 =C2=B1 25%     -98.5%      49.17 =C2=B1 56%  interrupts.CPU1=
60.RES:Rescheduling_interrupts
>>      996.33 =C2=B1  3%    +499.8%       5976 =C2=B1 10%  interrupts.CPU1=
61.CAL:Function_call_interrupts
>>        8421 =C2=B1  4%     -92.9%     599.67 =C2=B1 36%  interrupts.CPU1=
61.NMI:Non-maskable_interrupts
>>        8421 =C2=B1  4%     -92.9%     599.67 =C2=B1 36%  interrupts.CPU1=
61.PMI:Performance_monitoring_interrupts
>>        2779 =C2=B1 41%     -98.5%      41.50 =C2=B1 70%  interrupts.CPU1=
61.RES:Rescheduling_interrupts
>>        1045 =C2=B1  6%    +437.6%       5618 =C2=B1 11%  interrupts.CPU1=
62.CAL:Function_call_interrupts
>>        8440 =C2=B1  4%     -92.1%     667.33 =C2=B1 48%  interrupts.CPU1=
62.NMI:Non-maskable_interrupts
>>        8440 =C2=B1  4%     -92.1%     667.33 =C2=B1 48%  interrupts.CPU1=
62.PMI:Performance_monitoring_interrupts
>>        5001 =C2=B1 25%     -99.2%      41.67 =C2=B1 60%  interrupts.CPU1=
62.RES:Rescheduling_interrupts
>>        1183 =C2=B1 23%    +382.4%       5707 =C2=B1 12%  interrupts.CPU1=
63.CAL:Function_call_interrupts
>>        7655           -92.3%     591.17 =C2=B1 30%  interrupts.CPU163.NM=
I:Non-maskable_interrupts
>>        7655           -92.3%     591.17 =C2=B1 30%  interrupts.CPU163.PM=
I:Performance_monitoring_interrupts
>>        4991 =C2=B1 20%     -99.2%      40.50 =C2=B1 63%  interrupts.CPU1=
63.RES:Rescheduling_interrupts
>>        1180 =C2=B1 11%    +383.9%       5713 =C2=B1 12%  interrupts.CPU1=
64.CAL:Function_call_interrupts
>>        7837 =C2=B1  4%     -91.2%     689.50 =C2=B1 37%  interrupts.CPU1=
64.NMI:Non-maskable_interrupts
>>        7837 =C2=B1  4%     -91.2%     689.50 =C2=B1 37%  interrupts.CPU1=
64.PMI:Performance_monitoring_interrupts
>>        4831 =C2=B1  2%     -99.1%      43.67 =C2=B1 64%  interrupts.CPU1=
64.RES:Rescheduling_interrupts
>>      994.67 =C2=B1  4%    +476.5%       5734 =C2=B1 11%  interrupts.CPU1=
65.CAL:Function_call_interrupts
>>        7850 =C2=B1  7%     -91.9%     638.17 =C2=B1 35%  interrupts.CPU1=
65.NMI:Non-maskable_interrupts
>>        7850 =C2=B1  7%     -91.9%     638.17 =C2=B1 35%  interrupts.CPU1=
65.PMI:Performance_monitoring_interrupts
>>        4294 =C2=B1 49%     -99.1%      37.50 =C2=B1 56%  interrupts.CPU1=
65.RES:Rescheduling_interrupts
>>        1033 =C2=B1  2%    +464.3%       5833 =C2=B1 10%  interrupts.CPU1=
66.CAL:Function_call_interrupts
>>        8128 =C2=B1  3%     -93.9%     496.17 =C2=B1 45%  interrupts.CPU1=
66.NMI:Non-maskable_interrupts
>>        8128 =C2=B1  3%     -93.9%     496.17 =C2=B1 45%  interrupts.CPU1=
66.PMI:Performance_monitoring_interrupts
>>        4545 =C2=B1 26%     -99.2%      37.00 =C2=B1 51%  interrupts.CPU1=
66.RES:Rescheduling_interrupts
>>      995.67 =C2=B1  2%    +509.1%       6064 =C2=B1 12%  interrupts.CPU1=
67.CAL:Function_call_interrupts
>>        8500 =C2=B1  2%     -92.8%     615.00 =C2=B1 31%  interrupts.CPU1=
67.NMI:Non-maskable_interrupts
>>        8500 =C2=B1  2%     -92.8%     615.00 =C2=B1 31%  interrupts.CPU1=
67.PMI:Performance_monitoring_interrupts
>>        3596 =C2=B1 23%     -98.7%      47.50 =C2=B1 68%  interrupts.CPU1=
67.RES:Rescheduling_interrupts
>>      941.67          +576.4%       6369 =C2=B1  7%  interrupts.CPU168.CA=
L:Function_call_interrupts
>>        8373 =C2=B1  3%     -91.5%     711.00 =C2=B1 44%  interrupts.CPU1=
68.NMI:Non-maskable_interrupts
>>        8373 =C2=B1  3%     -91.5%     711.00 =C2=B1 44%  interrupts.CPU1=
68.PMI:Performance_monitoring_interrupts
>>        3982 =C2=B1 29%     -98.9%      45.00 =C2=B1 50%  interrupts.CPU1=
68.RES:Rescheduling_interrupts
>>      937.67          +643.4%       6970 =C2=B1 31%  interrupts.CPU169.CA=
L:Function_call_interrupts
>>        8208 =C2=B1  4%     -93.3%     549.33 =C2=B1 17%  interrupts.CPU1=
69.NMI:Non-maskable_interrupts
>>        8208 =C2=B1  4%     -93.3%     549.33 =C2=B1 17%  interrupts.CPU1=
69.PMI:Performance_monitoring_interrupts
>>        4092 =C2=B1 42%     -99.1%      38.83 =C2=B1 51%  interrupts.CPU1=
69.RES:Rescheduling_interrupts
>>      963.33          +573.3%       6486 =C2=B1 10%  interrupts.CPU17.CAL=
:Function_call_interrupts
>>        6871 =C2=B1 32%     -92.2%     532.83 =C2=B1 24%  interrupts.CPU1=
7.NMI:Non-maskable_interrupts
>>        6871 =C2=B1 32%     -92.2%     532.83 =C2=B1 24%  interrupts.CPU1=
7.PMI:Performance_monitoring_interrupts
>>        1326 =C2=B1 38%     -94.9%      68.00 =C2=B1 50%  interrupts.CPU1=
7.RES:Rescheduling_interrupts
>>      934.67          +521.7%       5810 =C2=B1  9%  interrupts.CPU170.CA=
L:Function_call_interrupts
>>        7989 =C2=B1  6%     -92.9%     565.00 =C2=B1 68%  interrupts.CPU1=
70.NMI:Non-maskable_interrupts
>>        7989 =C2=B1  6%     -92.9%     565.00 =C2=B1 68%  interrupts.CPU1=
70.PMI:Performance_monitoring_interrupts
>>        3632 =C2=B1 58%     -98.8%      45.00 =C2=B1 57%  interrupts.CPU1=
70.RES:Rescheduling_interrupts
>>      937.67          +551.5%       6109 =C2=B1 21%  interrupts.CPU171.CA=
L:Function_call_interrupts
>>        8523 =C2=B1  2%     -91.7%     711.33 =C2=B1 22%  interrupts.CPU1=
71.NMI:Non-maskable_interrupts
>>        8523 =C2=B1  2%     -91.7%     711.33 =C2=B1 22%  interrupts.CPU1=
71.PMI:Performance_monitoring_interrupts
>>        3383 =C2=B1 61%     -98.6%      45.83 =C2=B1 62%  interrupts.CPU1=
71.RES:Rescheduling_interrupts
>>      941.33          +503.3%       5678 =C2=B1 13%  interrupts.CPU172.CA=
L:Function_call_interrupts
>>        8054 =C2=B1  3%     -94.1%     478.17 =C2=B1 32%  interrupts.CPU1=
72.NMI:Non-maskable_interrupts
>>        8054 =C2=B1  3%     -94.1%     478.17 =C2=B1 32%  interrupts.CPU1=
72.PMI:Performance_monitoring_interrupts
>>        6042 =C2=B1  6%     -99.4%      37.17 =C2=B1 53%  interrupts.CPU1=
72.RES:Rescheduling_interrupts
>>      935.33          +510.7%       5712 =C2=B1 10%  interrupts.CPU173.CA=
L:Function_call_interrupts
>>        7947 =C2=B1  3%     -94.6%     431.00 =C2=B1 44%  interrupts.CPU1=
73.NMI:Non-maskable_interrupts
>>        7947 =C2=B1  3%     -94.6%     431.00 =C2=B1 44%  interrupts.CPU1=
73.PMI:Performance_monitoring_interrupts
>>        3727 =C2=B1 38%     -98.9%      40.00 =C2=B1 72%  interrupts.CPU1=
73.RES:Rescheduling_interrupts
>>      935.33          +536.2%       5950 =C2=B1 18%  interrupts.CPU174.CA=
L:Function_call_interrupts
>>        7631 =C2=B1  2%     -93.9%     469.00 =C2=B1 35%  interrupts.CPU1=
74.NMI:Non-maskable_interrupts
>>        7631 =C2=B1  2%     -93.9%     469.00 =C2=B1 35%  interrupts.CPU1=
74.PMI:Performance_monitoring_interrupts
>>        2743 =C2=B1 37%     -98.6%      37.67 =C2=B1 45%  interrupts.CPU1=
74.RES:Rescheduling_interrupts
>>      940.00          +534.2%       5961 =C2=B1 13%  interrupts.CPU175.CA=
L:Function_call_interrupts
>>        8223 =C2=B1  4%     -93.0%     577.67 =C2=B1 31%  interrupts.CPU1=
75.NMI:Non-maskable_interrupts
>>        8223 =C2=B1  4%     -93.0%     577.67 =C2=B1 31%  interrupts.CPU1=
75.PMI:Performance_monitoring_interrupts
>>        4275 =C2=B1 19%     -99.1%      37.50 =C2=B1 48%  interrupts.CPU1=
75.RES:Rescheduling_interrupts
>>      936.67          +502.4%       5642 =C2=B1 12%  interrupts.CPU176.CA=
L:Function_call_interrupts
>>        7604 =C2=B1  8%     -91.3%     659.17 =C2=B1 49%  interrupts.CPU1=
76.NMI:Non-maskable_interrupts
>>        7604 =C2=B1  8%     -91.3%     659.17 =C2=B1 49%  interrupts.CPU1=
76.PMI:Performance_monitoring_interrupts
>>        3831 =C2=B1 34%     -98.9%      41.50 =C2=B1 44%  interrupts.CPU1=
76.RES:Rescheduling_interrupts
>>      939.00          +497.9%       5614 =C2=B1 11%  interrupts.CPU177.CA=
L:Function_call_interrupts
>>        8436 =C2=B1  4%     -93.3%     563.33 =C2=B1 23%  interrupts.CPU1=
77.NMI:Non-maskable_interrupts
>>        8436 =C2=B1  4%     -93.3%     563.33 =C2=B1 23%  interrupts.CPU1=
77.PMI:Performance_monitoring_interrupts
>>        1456 =C2=B1 42%     -97.8%      32.17 =C2=B1 52%  interrupts.CPU1=
77.RES:Rescheduling_interrupts
>>      951.00          +524.3%       5937 =C2=B1 12%  interrupts.CPU178.CA=
L:Function_call_interrupts
>>        8436 =C2=B1  2%     -91.3%     730.83 =C2=B1 27%  interrupts.CPU1=
78.NMI:Non-maskable_interrupts
>>        8436 =C2=B1  2%     -91.3%     730.83 =C2=B1 27%  interrupts.CPU1=
78.PMI:Performance_monitoring_interrupts
>>        4682 =C2=B1 33%     -99.2%      39.17 =C2=B1 66%  interrupts.CPU1=
78.RES:Rescheduling_interrupts
>>      952.67 =C2=B1  2%    +508.5%       5797 =C2=B1  9%  interrupts.CPU1=
79.CAL:Function_call_interrupts
>>        8618           -94.1%     511.17 =C2=B1 50%  interrupts.CPU179.NM=
I:Non-maskable_interrupts
>>        8618           -94.1%     511.17 =C2=B1 50%  interrupts.CPU179.PM=
I:Performance_monitoring_interrupts
>>        3674 =C2=B1 29%     -99.0%      37.00 =C2=B1 55%  interrupts.CPU1=
79.RES:Rescheduling_interrupts
>>        1115 =C2=B1 17%    +505.3%       6751 =C2=B1 11%  interrupts.CPU1=
8.CAL:Function_call_interrupts
>>        6946 =C2=B1 29%     -92.3%     532.33 =C2=B1 33%  interrupts.CPU1=
8.NMI:Non-maskable_interrupts
>>        6946 =C2=B1 29%     -92.3%     532.33 =C2=B1 33%  interrupts.CPU1=
8.PMI:Performance_monitoring_interrupts
>>        3301 =C2=B1 38%     -98.2%      60.83 =C2=B1 55%  interrupts.CPU1=
8.RES:Rescheduling_interrupts
>>      942.00          +523.7%       5875 =C2=B1 10%  interrupts.CPU180.CA=
L:Function_call_interrupts
>>        8288 =C2=B1  3%     -92.2%     648.00 =C2=B1 36%  interrupts.CPU1=
80.NMI:Non-maskable_interrupts
>>        8288 =C2=B1  3%     -92.2%     648.00 =C2=B1 36%  interrupts.CPU1=
80.PMI:Performance_monitoring_interrupts
>>        5209 =C2=B1 19%     -99.2%      40.67 =C2=B1 57%  interrupts.CPU1=
80.RES:Rescheduling_interrupts
>>      963.67 =C2=B1  2%    +490.6%       5691 =C2=B1 10%  interrupts.CPU1=
81.CAL:Function_call_interrupts
>>        8714           -93.1%     597.83 =C2=B1 40%  interrupts.CPU181.NM=
I:Non-maskable_interrupts
>>        8714           -93.1%     597.83 =C2=B1 40%  interrupts.CPU181.PM=
I:Performance_monitoring_interrupts
>>        3643 =C2=B1 34%     -98.8%      44.17 =C2=B1 48%  interrupts.CPU1=
81.RES:Rescheduling_interrupts
>>      940.67          +499.4%       5638 =C2=B1  6%  interrupts.CPU182.CA=
L:Function_call_interrupts
>>        8559 =C2=B1  2%     -94.5%     474.50 =C2=B1 39%  interrupts.CPU1=
82.NMI:Non-maskable_interrupts
>>        8559 =C2=B1  2%     -94.5%     474.50 =C2=B1 39%  interrupts.CPU1=
82.PMI:Performance_monitoring_interrupts
>>        3749 =C2=B1  5%     -98.9%      40.17 =C2=B1 41%  interrupts.CPU1=
82.RES:Rescheduling_interrupts
>>      940.67          +510.7%       5744 =C2=B1 12%  interrupts.CPU183.CA=
L:Function_call_interrupts
>>        8501 =C2=B1  3%     -94.2%     491.67 =C2=B1 48%  interrupts.CPU1=
83.NMI:Non-maskable_interrupts
>>        8501 =C2=B1  3%     -94.2%     491.67 =C2=B1 48%  interrupts.CPU1=
83.PMI:Performance_monitoring_interrupts
>>        3525 =C2=B1 27%     -98.9%      38.00 =C2=B1 43%  interrupts.CPU1=
83.RES:Rescheduling_interrupts
>>      939.33          +523.2%       5853 =C2=B1 14%  interrupts.CPU184.CA=
L:Function_call_interrupts
>>        8296           -93.0%     583.83 =C2=B1 38%  interrupts.CPU184.NM=
I:Non-maskable_interrupts
>>        8296           -93.0%     583.83 =C2=B1 38%  interrupts.CPU184.PM=
I:Performance_monitoring_interrupts
>>        2753 =C2=B1 53%     -98.5%      40.33 =C2=B1 46%  interrupts.CPU1=
84.RES:Rescheduling_interrupts
>>      945.33          +498.8%       5660 =C2=B1 10%  interrupts.CPU185.CA=
L:Function_call_interrupts
>>        8367 =C2=B1  2%     -93.0%     584.67 =C2=B1 30%  interrupts.CPU1=
85.NMI:Non-maskable_interrupts
>>        8367 =C2=B1  2%     -93.0%     584.67 =C2=B1 30%  interrupts.CPU1=
85.PMI:Performance_monitoring_interrupts
>>        3665 =C2=B1 18%     -99.0%      38.00 =C2=B1 58%  interrupts.CPU1=
85.RES:Rescheduling_interrupts
>>      938.67          +539.9%       6006 =C2=B1 21%  interrupts.CPU186.CA=
L:Function_call_interrupts
>>        8492           -92.5%     637.17 =C2=B1 27%  interrupts.CPU186.NM=
I:Non-maskable_interrupts
>>        8492           -92.5%     637.17 =C2=B1 27%  interrupts.CPU186.PM=
I:Performance_monitoring_interrupts
>>        4228 =C2=B1 11%     -99.1%      39.33 =C2=B1 67%  interrupts.CPU1=
86.RES:Rescheduling_interrupts
>>      937.33          +532.8%       5931 =C2=B1 11%  interrupts.CPU187.CA=
L:Function_call_interrupts
>>        8086 =C2=B1 10%     -92.8%     582.67 =C2=B1 46%  interrupts.CPU1=
87.NMI:Non-maskable_interrupts
>>        8086 =C2=B1 10%     -92.8%     582.67 =C2=B1 46%  interrupts.CPU1=
87.PMI:Performance_monitoring_interrupts
>>        4506 =C2=B1 19%     -99.2%      35.00 =C2=B1 52%  interrupts.CPU1=
87.RES:Rescheduling_interrupts
>>      936.67          +538.8%       5983 =C2=B1 13%  interrupts.CPU188.CA=
L:Function_call_interrupts
>>        6751 =C2=B1 28%     -91.9%     548.17 =C2=B1 26%  interrupts.CPU1=
88.NMI:Non-maskable_interrupts
>>        6751 =C2=B1 28%     -91.9%     548.17 =C2=B1 26%  interrupts.CPU1=
88.PMI:Performance_monitoring_interrupts
>>        4599 =C2=B1 18%     -99.1%      40.17 =C2=B1 50%  interrupts.CPU1=
88.RES:Rescheduling_interrupts
>>      935.00          +507.6%       5681 =C2=B1 10%  interrupts.CPU189.CA=
L:Function_call_interrupts
>>        8364 =C2=B1  3%     -93.3%     563.17 =C2=B1 42%  interrupts.CPU1=
89.NMI:Non-maskable_interrupts
>>        8364 =C2=B1  3%     -93.3%     563.17 =C2=B1 42%  interrupts.CPU1=
89.PMI:Performance_monitoring_interrupts
>>        4035 =C2=B1  6%     -98.9%      44.33 =C2=B1 58%  interrupts.CPU1=
89.RES:Rescheduling_interrupts
>>        1469 =C2=B1 48%    +364.8%       6827 =C2=B1 15%  interrupts.CPU1=
9.CAL:Function_call_interrupts
>>        8011 =C2=B1  3%     -91.2%     706.33 =C2=B1 25%  interrupts.CPU1=
9.NMI:Non-maskable_interrupts
>>        8011 =C2=B1  3%     -91.2%     706.33 =C2=B1 25%  interrupts.CPU1=
9.PMI:Performance_monitoring_interrupts
>>        3018 =C2=B1 32%     -97.9%      62.50 =C2=B1 54%  interrupts.CPU1=
9.RES:Rescheduling_interrupts
>>      942.00          +503.9%       5689 =C2=B1 14%  interrupts.CPU190.CA=
L:Function_call_interrupts
>>        8093 =C2=B1  2%     -93.9%     493.00 =C2=B1 67%  interrupts.CPU1=
90.NMI:Non-maskable_interrupts
>>        8093 =C2=B1  2%     -93.9%     493.00 =C2=B1 67%  interrupts.CPU1=
90.PMI:Performance_monitoring_interrupts
>>        5019 =C2=B1 12%     -99.3%      34.83 =C2=B1 69%  interrupts.CPU1=
90.RES:Rescheduling_interrupts
>>      978.00 =C2=B1  2%    +503.4%       5901 =C2=B1 22%  interrupts.CPU1=
91.CAL:Function_call_interrupts
>>        7135 =C2=B1  6%     -93.8%     442.67 =C2=B1 29%  interrupts.CPU1=
91.NMI:Non-maskable_interrupts
>>        7135 =C2=B1  6%     -93.8%     442.67 =C2=B1 29%  interrupts.CPU1=
91.PMI:Performance_monitoring_interrupts
>>        3771 =C2=B1 41%     -98.8%      45.67 =C2=B1 48%  interrupts.CPU1=
91.RES:Rescheduling_interrupts
>>        1344 =C2=B1 32%    +401.0%       6735 =C2=B1 13%  interrupts.CPU2=
.CAL:Function_call_interrupts
>>        6863 =C2=B1 28%     -91.7%     570.00 =C2=B1 26%  interrupts.CPU2=
.NMI:Non-maskable_interrupts
>>        6863 =C2=B1 28%     -91.7%     570.00 =C2=B1 26%  interrupts.CPU2=
.PMI:Performance_monitoring_interrupts
>>        3686 =C2=B1 15%     -98.3%      63.67 =C2=B1 47%  interrupts.CPU2=
.RES:Rescheduling_interrupts
>>      951.00          +606.0%       6713 =C2=B1 16%  interrupts.CPU20.CAL=
:Function_call_interrupts
>>        7956 =C2=B1  4%     -90.7%     741.50 =C2=B1 19%  interrupts.CPU2=
0.NMI:Non-maskable_interrupts
>>        7956 =C2=B1  4%     -90.7%     741.50 =C2=B1 19%  interrupts.CPU2=
0.PMI:Performance_monitoring_interrupts
>>        2484 =C2=B1 42%     -97.5%      61.50 =C2=B1 48%  interrupts.CPU2=
0.RES:Rescheduling_interrupts
>>      972.33          +595.9%       6766 =C2=B1 11%  interrupts.CPU21.CAL=
:Function_call_interrupts
>>        8118 =C2=B1  3%     -93.5%     531.00 =C2=B1 38%  interrupts.CPU2=
1.NMI:Non-maskable_interrupts
>>        8118 =C2=B1  3%     -93.5%     531.00 =C2=B1 38%  interrupts.CPU2=
1.PMI:Performance_monitoring_interrupts
>>        3013 =C2=B1 35%     -97.9%      64.17 =C2=B1 68%  interrupts.CPU2=
1.RES:Rescheduling_interrupts
>>        1050 =C2=B1 14%    +518.6%       6497 =C2=B1  6%  interrupts.CPU2=
2.CAL:Function_call_interrupts
>>        8482 =C2=B1  2%     -93.5%     554.33 =C2=B1 48%  interrupts.CPU2=
2.NMI:Non-maskable_interrupts
>>        8482 =C2=B1  2%     -93.5%     554.33 =C2=B1 48%  interrupts.CPU2=
2.PMI:Performance_monitoring_interrupts
>>        2678 =C2=B1 72%     -97.6%      63.17 =C2=B1 57%  interrupts.CPU2=
2.RES:Rescheduling_interrupts
>>        1022 =C2=B1  9%    +541.5%       6560 =C2=B1  7%  interrupts.CPU2=
3.CAL:Function_call_interrupts
>>        8519 =C2=B1  2%     -92.8%     611.33 =C2=B1 36%  interrupts.CPU2=
3.NMI:Non-maskable_interrupts
>>        8519 =C2=B1  2%     -92.8%     611.33 =C2=B1 36%  interrupts.CPU2=
3.PMI:Performance_monitoring_interrupts
>>        2199 =C2=B1  7%     -97.3%      58.67 =C2=B1 48%  interrupts.CPU2=
3.RES:Rescheduling_interrupts
>>        1060 =C2=B1 14%    +542.6%       6813 =C2=B1 16%  interrupts.CPU2=
4.CAL:Function_call_interrupts
>>        8531 =C2=B1  2%     -93.1%     584.83 =C2=B1 43%  interrupts.CPU2=
4.NMI:Non-maskable_interrupts
>>        8531 =C2=B1  2%     -93.1%     584.83 =C2=B1 43%  interrupts.CPU2=
4.PMI:Performance_monitoring_interrupts
>>        2789 =C2=B1 44%     -97.7%      63.67 =C2=B1 53%  interrupts.CPU2=
4.RES:Rescheduling_interrupts
>>      993.67 =C2=B1  6%    +567.1%       6628 =C2=B1 24%  interrupts.CPU2=
5.CAL:Function_call_interrupts
>>        8267           -93.6%     531.17 =C2=B1 47%  interrupts.CPU25.NMI=
:Non-maskable_interrupts
>>        8267           -93.6%     531.17 =C2=B1 47%  interrupts.CPU25.PMI=
:Performance_monitoring_interrupts
>>        3251 =C2=B1 27%     -98.5%      48.33 =C2=B1 60%  interrupts.CPU2=
5.RES:Rescheduling_interrupts
>>       10.67 =C2=B1 82%    +578.1%      72.33 =C2=B1 59%  interrupts.CPU2=
5.TLB:TLB_shootdowns
>>      949.67          +553.1%       6202 =C2=B1 16%  interrupts.CPU26.CAL=
:Function_call_interrupts
>>        8043           -93.0%     567.00 =C2=B1 40%  interrupts.CPU26.NMI=
:Non-maskable_interrupts
>>        8043           -93.0%     567.00 =C2=B1 40%  interrupts.CPU26.PMI=
:Performance_monitoring_interrupts
>>        3858 =C2=B1 50%     -98.6%      52.67 =C2=B1 52%  interrupts.CPU2=
6.RES:Rescheduling_interrupts
>>      996.33 =C2=B1  7%    +517.8%       6155 =C2=B1 15%  interrupts.CPU2=
7.CAL:Function_call_interrupts
>>        8078 =C2=B1  6%     -92.8%     578.83 =C2=B1 65%  interrupts.CPU2=
7.NMI:Non-maskable_interrupts
>>        8078 =C2=B1  6%     -92.8%     578.83 =C2=B1 65%  interrupts.CPU2=
7.PMI:Performance_monitoring_interrupts
>>        3047 =C2=B1 55%     -98.4%      49.67 =C2=B1 64%  interrupts.CPU2=
7.RES:Rescheduling_interrupts
>>      972.33 =C2=B1  4%    +519.3%       6021 =C2=B1 15%  interrupts.CPU2=
8.CAL:Function_call_interrupts
>>        8128 =C2=B1  6%     -93.5%     526.00 =C2=B1 41%  interrupts.CPU2=
8.NMI:Non-maskable_interrupts
>>        8128 =C2=B1  6%     -93.5%     526.00 =C2=B1 41%  interrupts.CPU2=
8.PMI:Performance_monitoring_interrupts
>>        4260 =C2=B1  9%     -98.8%      50.83 =C2=B1 67%  interrupts.CPU2=
8.RES:Rescheduling_interrupts
>>      988.00 =C2=B1  6%    +512.3%       6050 =C2=B1 19%  interrupts.CPU2=
9.CAL:Function_call_interrupts
>>        8064 =C2=B1  6%     -94.1%     471.83 =C2=B1 48%  interrupts.CPU2=
9.NMI:Non-maskable_interrupts
>>        8064 =C2=B1  6%     -94.1%     471.83 =C2=B1 48%  interrupts.CPU2=
9.PMI:Performance_monitoring_interrupts
>>        3068 =C2=B1 49%     -98.5%      44.67 =C2=B1 63%  interrupts.CPU2=
9.RES:Rescheduling_interrupts
>>        1135 =C2=B1 15%    +473.6%       6513 =C2=B1 14%  interrupts.CPU3=
.CAL:Function_call_interrupts
>>        8318 =C2=B1  3%     -92.2%     652.50 =C2=B1 39%  interrupts.CPU3=
.NMI:Non-maskable_interrupts
>>        8318 =C2=B1  3%     -92.2%     652.50 =C2=B1 39%  interrupts.CPU3=
.PMI:Performance_monitoring_interrupts
>>        1918 =C2=B1 31%     -97.0%      57.67 =C2=B1 49%  interrupts.CPU3=
.RES:Rescheduling_interrupts
>>      946.33          +578.1%       6416 =C2=B1 18%  interrupts.CPU30.CAL=
:Function_call_interrupts
>>        6904 =C2=B1 28%     -91.1%     617.17 =C2=B1 54%  interrupts.CPU3=
0.NMI:Non-maskable_interrupts
>>        6904 =C2=B1 28%     -91.1%     617.17 =C2=B1 54%  interrupts.CPU3=
0.PMI:Performance_monitoring_interrupts
>>        2762 =C2=B1 44%     -98.1%      53.83 =C2=B1 63%  interrupts.CPU3=
0.RES:Rescheduling_interrupts
>>      937.00          +551.3%       6102 =C2=B1 19%  interrupts.CPU31.CAL=
:Function_call_interrupts
>>        8564           -91.5%     724.83 =C2=B1 47%  interrupts.CPU31.NMI=
:Non-maskable_interrupts
>>        8564           -91.5%     724.83 =C2=B1 47%  interrupts.CPU31.PMI=
:Performance_monitoring_interrupts
>>        3744 =C2=B1 37%     -98.7%      47.67 =C2=B1 79%  interrupts.CPU3=
1.RES:Rescheduling_interrupts
>>      960.33          +539.2%       6138 =C2=B1 15%  interrupts.CPU32.CAL=
:Function_call_interrupts
>>        8375 =C2=B1  3%     -94.2%     486.00 =C2=B1 25%  interrupts.CPU3=
2.NMI:Non-maskable_interrupts
>>        8375 =C2=B1  3%     -94.2%     486.00 =C2=B1 25%  interrupts.CPU3=
2.PMI:Performance_monitoring_interrupts
>>        4681 =C2=B1 66%     -98.9%      51.83 =C2=B1 57%  interrupts.CPU3=
2.RES:Rescheduling_interrupts
>>      951.67          +508.4%       5789 =C2=B1 16%  interrupts.CPU33.CAL=
:Function_call_interrupts
>>        8339 =C2=B1  3%     -91.4%     719.33 =C2=B1 33%  interrupts.CPU3=
3.NMI:Non-maskable_interrupts
>>        8339 =C2=B1  3%     -91.4%     719.33 =C2=B1 33%  interrupts.CPU3=
3.PMI:Performance_monitoring_interrupts
>>        4752 =C2=B1 45%     -99.0%      46.67 =C2=B1 63%  interrupts.CPU3=
3.RES:Rescheduling_interrupts
>>        1300 =C2=B1 37%    +351.7%       5872 =C2=B1 16%  interrupts.CPU3=
4.CAL:Function_call_interrupts
>>        8313 =C2=B1  2%     -93.3%     558.00 =C2=B1 31%  interrupts.CPU3=
4.NMI:Non-maskable_interrupts
>>        8313 =C2=B1  2%     -93.3%     558.00 =C2=B1 31%  interrupts.CPU3=
4.PMI:Performance_monitoring_interrupts
>>        5641 =C2=B1 33%     -99.2%      46.17 =C2=B1 64%  interrupts.CPU3=
4.RES:Rescheduling_interrupts
>>      945.67          +562.3%       6262 =C2=B1 18%  interrupts.CPU35.CAL=
:Function_call_interrupts
>>        8322 =C2=B1  3%     -91.7%     689.17 =C2=B1 55%  interrupts.CPU3=
5.NMI:Non-maskable_interrupts
>>        8322 =C2=B1  3%     -91.7%     689.17 =C2=B1 55%  interrupts.CPU3=
5.PMI:Performance_monitoring_interrupts
>>        3934 =C2=B1 43%     -98.7%      50.50 =C2=B1 60%  interrupts.CPU3=
5.RES:Rescheduling_interrupts
>>      937.00          +564.8%       6229 =C2=B1 20%  interrupts.CPU36.CAL=
:Function_call_interrupts
>>        8426 =C2=B1  2%     -93.8%     526.33 =C2=B1 41%  interrupts.CPU3=
6.NMI:Non-maskable_interrupts
>>        8426 =C2=B1  2%     -93.8%     526.33 =C2=B1 41%  interrupts.CPU3=
6.PMI:Performance_monitoring_interrupts
>>        2474 =C2=B1 49%     -98.1%      46.17 =C2=B1 64%  interrupts.CPU3=
6.RES:Rescheduling_interrupts
>>        1049 =C2=B1 15%    +481.4%       6100 =C2=B1 16%  interrupts.CPU3=
7.CAL:Function_call_interrupts
>>        8470 =C2=B1  2%     -92.3%     652.17 =C2=B1 11%  interrupts.CPU3=
7.NMI:Non-maskable_interrupts
>>        8470 =C2=B1  2%     -92.3%     652.17 =C2=B1 11%  interrupts.CPU3=
7.PMI:Performance_monitoring_interrupts
>>        3230 =C2=B1 67%     -98.3%      54.17 =C2=B1 52%  interrupts.CPU3=
7.RES:Rescheduling_interrupts
>>        1027 =C2=B1 11%    +472.8%       5883 =C2=B1 16%  interrupts.CPU3=
8.CAL:Function_call_interrupts
>>        8360 =C2=B1  3%     -94.0%     498.33 =C2=B1 43%  interrupts.CPU3=
8.NMI:Non-maskable_interrupts
>>        8360 =C2=B1  3%     -94.0%     498.33 =C2=B1 43%  interrupts.CPU3=
8.PMI:Performance_monitoring_interrupts
>>        5045 =C2=B1 65%     -99.0%      48.83 =C2=B1 57%  interrupts.CPU3=
8.RES:Rescheduling_interrupts
>>      940.00          +558.5%       6190 =C2=B1 14%  interrupts.CPU39.CAL=
:Function_call_interrupts
>>        8183 =C2=B1  5%     -89.3%     878.83 =C2=B1 46%  interrupts.CPU3=
9.NMI:Non-maskable_interrupts
>>        8183 =C2=B1  5%     -89.3%     878.83 =C2=B1 46%  interrupts.CPU3=
9.PMI:Performance_monitoring_interrupts
>>        2832 =C2=B1 29%     -98.2%      51.33 =C2=B1 52%  interrupts.CPU3=
9.RES:Rescheduling_interrupts
>>      942.67 =C2=B1  4%    +577.7%       6388 =C2=B1  9%  interrupts.CPU4=
.CAL:Function_call_interrupts
>>        7081 =C2=B1 27%     -91.2%     620.67 =C2=B1 28%  interrupts.CPU4=
.NMI:Non-maskable_interrupts
>>        7081 =C2=B1 27%     -91.2%     620.67 =C2=B1 28%  interrupts.CPU4=
.PMI:Performance_monitoring_interrupts
>>        2484 =C2=B1 13%     -97.7%      57.83 =C2=B1 50%  interrupts.CPU4=
.RES:Rescheduling_interrupts
>>      944.33          +541.9%       6061 =C2=B1 15%  interrupts.CPU40.CAL=
:Function_call_interrupts
>>        8291 =C2=B1  3%     -94.7%     436.83 =C2=B1 31%  interrupts.CPU4=
0.NMI:Non-maskable_interrupts
>>        8291 =C2=B1  3%     -94.7%     436.83 =C2=B1 31%  interrupts.CPU4=
0.PMI:Performance_monitoring_interrupts
>>        4620 =C2=B1 48%     -98.9%      49.83 =C2=B1 66%  interrupts.CPU4=
0.RES:Rescheduling_interrupts
>>      946.67          +556.1%       6210 =C2=B1 15%  interrupts.CPU41.CAL=
:Function_call_interrupts
>>        8571 =C2=B1  2%     -93.0%     596.83 =C2=B1 49%  interrupts.CPU4=
1.NMI:Non-maskable_interrupts
>>        8571 =C2=B1  2%     -93.0%     596.83 =C2=B1 49%  interrupts.CPU4=
1.PMI:Performance_monitoring_interrupts
>>        2595 =C2=B1 67%     -98.0%      50.83 =C2=B1 57%  interrupts.CPU4=
1.RES:Rescheduling_interrupts
>>      973.67 =C2=B1  5%    +560.0%       6426 =C2=B1 20%  interrupts.CPU4=
2.CAL:Function_call_interrupts
>>        8355 =C2=B1  3%     -93.8%     516.83 =C2=B1 46%  interrupts.CPU4=
2.NMI:Non-maskable_interrupts
>>        8355 =C2=B1  3%     -93.8%     516.83 =C2=B1 46%  interrupts.CPU4=
2.PMI:Performance_monitoring_interrupts
>>        5314 =C2=B1 36%     -99.1%      48.00 =C2=B1 63%  interrupts.CPU4=
2.RES:Rescheduling_interrupts
>>      954.33 =C2=B1  3%    +556.5%       6264 =C2=B1 18%  interrupts.CPU4=
3.CAL:Function_call_interrupts
>>        8170           -94.4%     454.83 =C2=B1 59%  interrupts.CPU43.NMI=
:Non-maskable_interrupts
>>        8170           -94.4%     454.83 =C2=B1 59%  interrupts.CPU43.PMI=
:Performance_monitoring_interrupts
>>        3373 =C2=B1 57%     -98.6%      47.83 =C2=B1 69%  interrupts.CPU4=
3.RES:Rescheduling_interrupts
>>      946.67          +578.6%       6423 =C2=B1 19%  interrupts.CPU44.CAL=
:Function_call_interrupts
>>        8401 =C2=B1  3%     -94.1%     493.33 =C2=B1 38%  interrupts.CPU4=
4.NMI:Non-maskable_interrupts
>>        8401 =C2=B1  3%     -94.1%     493.33 =C2=B1 38%  interrupts.CPU4=
4.PMI:Performance_monitoring_interrupts
>>        4765 =C2=B1 44%     -99.0%      49.67 =C2=B1 53%  interrupts.CPU4=
4.RES:Rescheduling_interrupts
>>      960.33 =C2=B1  2%    +530.7%       6056 =C2=B1 16%  interrupts.CPU4=
5.CAL:Function_call_interrupts
>>        8444 =C2=B1  2%     -92.5%     631.00 =C2=B1 34%  interrupts.CPU4=
5.NMI:Non-maskable_interrupts
>>        8444 =C2=B1  2%     -92.5%     631.00 =C2=B1 34%  interrupts.CPU4=
5.PMI:Performance_monitoring_interrupts
>>        2556 =C2=B1 49%     -98.0%      52.17 =C2=B1 71%  interrupts.CPU4=
5.RES:Rescheduling_interrupts
>>      974.00 =C2=B1  4%    +534.1%       6176 =C2=B1 16%  interrupts.CPU4=
6.CAL:Function_call_interrupts
>>        6701 =C2=B1 28%     -91.5%     567.83 =C2=B1 44%  interrupts.CPU4=
6.NMI:Non-maskable_interrupts
>>        6701 =C2=B1 28%     -91.5%     567.83 =C2=B1 44%  interrupts.CPU4=
6.PMI:Performance_monitoring_interrupts
>>        4845 =C2=B1 32%     -99.0%      47.17 =C2=B1 58%  interrupts.CPU4=
6.RES:Rescheduling_interrupts
>>      939.33          +547.9%       6086 =C2=B1 15%  interrupts.CPU47.CAL=
:Function_call_interrupts
>>        7257 =C2=B1 28%     -91.3%     628.50 =C2=B1 34%  interrupts.CPU4=
7.NMI:Non-maskable_interrupts
>>        7257 =C2=B1 28%     -91.3%     628.50 =C2=B1 34%  interrupts.CPU4=
7.PMI:Performance_monitoring_interrupts
>>        1996 =C2=B1 61%     -97.8%      44.50 =C2=B1 67%  interrupts.CPU4=
7.RES:Rescheduling_interrupts
>>        1040 =C2=B1  4%    +595.6%       7233 =C2=B1 14%  interrupts.CPU4=
8.CAL:Function_call_interrupts
>>        7152 =C2=B1 30%     -90.1%     711.33 =C2=B1 34%  interrupts.CPU4=
8.NMI:Non-maskable_interrupts
>>        7152 =C2=B1 30%     -90.1%     711.33 =C2=B1 34%  interrupts.CPU4=
8.PMI:Performance_monitoring_interrupts
>>        2944 =C2=B1 30%     -97.9%      61.50 =C2=B1 47%  interrupts.CPU4=
8.RES:Rescheduling_interrupts
>>        1121 =C2=B1  7%    +468.9%       6381 =C2=B1 11%  interrupts.CPU4=
9.CAL:Function_call_interrupts
>>        6924 =C2=B1 26%     -92.9%     492.33 =C2=B1 32%  interrupts.CPU4=
9.NMI:Non-maskable_interrupts
>>        6924 =C2=B1 26%     -92.9%     492.33 =C2=B1 32%  interrupts.CPU4=
9.PMI:Performance_monitoring_interrupts
>>        3687 =C2=B1 18%     -98.6%      51.33 =C2=B1 57%  interrupts.CPU4=
9.RES:Rescheduling_interrupts
>>       13.67 =C2=B1131%    +440.2%      73.83 =C2=B1 55%  interrupts.CPU4=
9.TLB:TLB_shootdowns
>>      981.00 =C2=B1  4%    +581.5%       6685 =C2=B1 16%  interrupts.CPU5=
.CAL:Function_call_interrupts
>>        6868 =C2=B1 25%     -91.4%     588.83 =C2=B1 36%  interrupts.CPU5=
.NMI:Non-maskable_interrupts
>>        6868 =C2=B1 25%     -91.4%     588.83 =C2=B1 36%  interrupts.CPU5=
.PMI:Performance_monitoring_interrupts
>>        2457 =C2=B1 49%     -97.8%      55.17 =C2=B1 48%  interrupts.CPU5=
.RES:Rescheduling_interrupts
>>      998.00 =C2=B1  3%    +524.9%       6236 =C2=B1 13%  interrupts.CPU5=
0.CAL:Function_call_interrupts
>>        6884 =C2=B1 26%     -93.5%     449.67 =C2=B1 50%  interrupts.CPU5=
0.NMI:Non-maskable_interrupts
>>        6884 =C2=B1 26%     -93.5%     449.67 =C2=B1 50%  interrupts.CPU5=
0.PMI:Performance_monitoring_interrupts
>>        1939 =C2=B1  9%     -97.4%      51.17 =C2=B1 49%  interrupts.CPU5=
0.RES:Rescheduling_interrupts
>>        1075 =C2=B1  4%    +493.7%       6382 =C2=B1 19%  interrupts.CPU5=
1.CAL:Function_call_interrupts
>>        6619 =C2=B1 28%     -91.0%     599.00 =C2=B1 39%  interrupts.CPU5=
1.NMI:Non-maskable_interrupts
>>        6619 =C2=B1 28%     -91.0%     599.00 =C2=B1 39%  interrupts.CPU5=
1.PMI:Performance_monitoring_interrupts
>>        3299 =C2=B1 40%     -98.3%      57.50 =C2=B1 54%  interrupts.CPU5=
1.RES:Rescheduling_interrupts
>>        1168 =C2=B1  9%    +442.0%       6333 =C2=B1 12%  interrupts.CPU5=
2.CAL:Function_call_interrupts
>>        6529 =C2=B1 23%     -88.5%     750.83 =C2=B1 13%  interrupts.CPU5=
2.NMI:Non-maskable_interrupts
>>        6529 =C2=B1 23%     -88.5%     750.83 =C2=B1 13%  interrupts.CPU5=
2.PMI:Performance_monitoring_interrupts
>>        3559 =C2=B1 48%     -98.5%      54.83 =C2=B1 64%  interrupts.CPU5=
2.RES:Rescheduling_interrupts
>>        1023 =C2=B1  7%    +565.1%       6804 =C2=B1 27%  interrupts.CPU5=
3.CAL:Function_call_interrupts
>>        8240 =C2=B1  4%     -90.6%     773.33 =C2=B1 26%  interrupts.CPU5=
3.NMI:Non-maskable_interrupts
>>        8240 =C2=B1  4%     -90.6%     773.33 =C2=B1 26%  interrupts.CPU5=
3.PMI:Performance_monitoring_interrupts
>>        3254 =C2=B1 46%     -98.2%      58.50 =C2=B1 50%  interrupts.CPU5=
3.RES:Rescheduling_interrupts
>>      976.00          +569.3%       6532 =C2=B1 10%  interrupts.CPU54.CAL=
:Function_call_interrupts
>>        8541 =C2=B1  2%     -93.7%     536.00 =C2=B1 44%  interrupts.CPU5=
4.NMI:Non-maskable_interrupts
>>        8541 =C2=B1  2%     -93.7%     536.00 =C2=B1 44%  interrupts.CPU5=
4.PMI:Performance_monitoring_interrupts
>>        2577 =C2=B1 25%     -98.1%      50.00 =C2=B1 65%  interrupts.CPU5=
4.RES:Rescheduling_interrupts
>>        1080 =C2=B1 10%    +513.7%       6631 =C2=B1 15%  interrupts.CPU5=
5.CAL:Function_call_interrupts
>>        6683 =C2=B1 27%     -87.9%     810.50 =C2=B1 13%  interrupts.CPU5=
5.NMI:Non-maskable_interrupts
>>        6683 =C2=B1 27%     -87.9%     810.50 =C2=B1 13%  interrupts.CPU5=
5.PMI:Performance_monitoring_interrupts
>>        3148 =C2=B1 37%     -98.4%      50.33 =C2=B1 55%  interrupts.CPU5=
5.RES:Rescheduling_interrupts
>>        1076 =C2=B1  4%    +492.1%       6370 =C2=B1 11%  interrupts.CPU5=
6.CAL:Function_call_interrupts
>>        5711 =C2=B1 37%     -88.9%     632.17 =C2=B1 33%  interrupts.CPU5=
6.NMI:Non-maskable_interrupts
>>        5711 =C2=B1 37%     -88.9%     632.17 =C2=B1 33%  interrupts.CPU5=
6.PMI:Performance_monitoring_interrupts
>>        2685 =C2=B1  4%     -98.1%      49.83 =C2=B1 50%  interrupts.CPU5=
6.RES:Rescheduling_interrupts
>>        1109 =C2=B1 14%    +468.8%       6307 =C2=B1 14%  interrupts.CPU5=
7.CAL:Function_call_interrupts
>>        5589 =C2=B1 39%     -87.4%     705.17 =C2=B1 27%  interrupts.CPU5=
7.NMI:Non-maskable_interrupts
>>        5589 =C2=B1 39%     -87.4%     705.17 =C2=B1 27%  interrupts.CPU5=
7.PMI:Performance_monitoring_interrupts
>>        3899 =C2=B1 69%     -98.6%      53.33 =C2=B1 46%  interrupts.CPU5=
7.RES:Rescheduling_interrupts
>>        1089 =C2=B1  9%    +461.7%       6120 =C2=B1 14%  interrupts.CPU5=
8.CAL:Function_call_interrupts
>>        5466 =C2=B1 33%     -87.5%     682.00 =C2=B1 27%  interrupts.CPU5=
8.NMI:Non-maskable_interrupts
>>        5466 =C2=B1 33%     -87.5%     682.00 =C2=B1 27%  interrupts.CPU5=
8.PMI:Performance_monitoring_interrupts
>>        3442 =C2=B1 40%     -98.5%      52.83 =C2=B1 58%  interrupts.CPU5=
8.RES:Rescheduling_interrupts
>>        1023 =C2=B1  9%    +523.1%       6374 =C2=B1 18%  interrupts.CPU5=
9.CAL:Function_call_interrupts
>>        5498 =C2=B1 30%     -89.0%     604.67 =C2=B1 25%  interrupts.CPU5=
9.NMI:Non-maskable_interrupts
>>        5498 =C2=B1 30%     -89.0%     604.67 =C2=B1 25%  interrupts.CPU5=
9.PMI:Performance_monitoring_interrupts
>>        2080 =C2=B1 75%     -97.6%      49.33 =C2=B1 51%  interrupts.CPU5=
9.RES:Rescheduling_interrupts
>>      994.00          +570.3%       6662 =C2=B1 10%  interrupts.CPU6.CAL:=
Function_call_interrupts
>>        6981 =C2=B1 29%     -90.1%     693.33 =C2=B1 34%  interrupts.CPU6=
.NMI:Non-maskable_interrupts
>>        6981 =C2=B1 29%     -90.1%     693.33 =C2=B1 34%  interrupts.CPU6=
.PMI:Performance_monitoring_interrupts
>>        2443 =C2=B1 52%     -97.9%      52.17 =C2=B1 39%  interrupts.CPU6=
.RES:Rescheduling_interrupts
>>        1050 =C2=B1  7%    +522.2%       6534 =C2=B1 10%  interrupts.CPU6=
0.CAL:Function_call_interrupts
>>        5389 =C2=B1 34%     -90.1%     535.67 =C2=B1 39%  interrupts.CPU6=
0.NMI:Non-maskable_interrupts
>>        5389 =C2=B1 34%     -90.1%     535.67 =C2=B1 39%  interrupts.CPU6=
0.PMI:Performance_monitoring_interrupts
>>        4308 =C2=B1 29%     -98.7%      55.17 =C2=B1 56%  interrupts.CPU6=
0.RES:Rescheduling_interrupts
>>        1114 =C2=B1  8%    +498.6%       6670 =C2=B1 11%  interrupts.CPU6=
1.CAL:Function_call_interrupts
>>        5643 =C2=B1 37%     -84.8%     855.17 =C2=B1 35%  interrupts.CPU6=
1.NMI:Non-maskable_interrupts
>>        5643 =C2=B1 37%     -84.8%     855.17 =C2=B1 35%  interrupts.CPU6=
1.PMI:Performance_monitoring_interrupts
>>        3581 =C2=B1 33%     -98.6%      48.67 =C2=B1 47%  interrupts.CPU6=
1.RES:Rescheduling_interrupts
>>        1042 =C2=B1  6%    +498.0%       6231 =C2=B1 10%  interrupts.CPU6=
2.CAL:Function_call_interrupts
>>        5721 =C2=B1 36%     -88.6%     651.67 =C2=B1 54%  interrupts.CPU6=
2.NMI:Non-maskable_interrupts
>>        5721 =C2=B1 36%     -88.6%     651.67 =C2=B1 54%  interrupts.CPU6=
2.PMI:Performance_monitoring_interrupts
>>        3630 =C2=B1 47%     -98.6%      51.83 =C2=B1 60%  interrupts.CPU6=
2.RES:Rescheduling_interrupts
>>        1103 =C2=B1  6%    +464.5%       6228 =C2=B1 11%  interrupts.CPU6=
3.CAL:Function_call_interrupts
>>        5488 =C2=B1 41%     -90.9%     498.33 =C2=B1 46%  interrupts.CPU6=
3.NMI:Non-maskable_interrupts
>>        5488 =C2=B1 41%     -90.9%     498.33 =C2=B1 46%  interrupts.CPU6=
3.PMI:Performance_monitoring_interrupts
>>        3372 =C2=B1 27%     -98.4%      54.00 =C2=B1 48%  interrupts.CPU6=
3.RES:Rescheduling_interrupts
>>        1045 =C2=B1  2%    +497.1%       6243 =C2=B1 11%  interrupts.CPU6=
4.CAL:Function_call_interrupts
>>        6775 =C2=B1 25%     -92.0%     542.00 =C2=B1 50%  interrupts.CPU6=
4.NMI:Non-maskable_interrupts
>>        6775 =C2=B1 25%     -92.0%     542.00 =C2=B1 50%  interrupts.CPU6=
4.PMI:Performance_monitoring_interrupts
>>        4520 =C2=B1 23%     -98.9%      51.17 =C2=B1 52%  interrupts.CPU6=
4.RES:Rescheduling_interrupts
>>      982.67          +560.2%       6488 =C2=B1 11%  interrupts.CPU65.CAL=
:Function_call_interrupts
>>        8168 =C2=B1  5%     -92.4%     617.17 =C2=B1 34%  interrupts.CPU6=
5.NMI:Non-maskable_interrupts
>>        8168 =C2=B1  5%     -92.4%     617.17 =C2=B1 34%  interrupts.CPU6=
5.PMI:Performance_monitoring_interrupts
>>        4537 =C2=B1 28%     -98.9%      48.17 =C2=B1 72%  interrupts.CPU6=
5.RES:Rescheduling_interrupts
>>      844.33 =C2=B1 24%    +643.4%       6277 =C2=B1 13%  interrupts.CPU6=
6.CAL:Function_call_interrupts
>>        8266 =C2=B1  2%     -91.2%     725.33 =C2=B1 37%  interrupts.CPU6=
6.NMI:Non-maskable_interrupts
>>        8266 =C2=B1  2%     -91.2%     725.33 =C2=B1 37%  interrupts.CPU6=
6.PMI:Performance_monitoring_interrupts
>>        2431 =C2=B1 66%     -97.9%      50.83 =C2=B1 66%  interrupts.CPU6=
6.RES:Rescheduling_interrupts
>>        1016 =C2=B1  3%    +535.8%       6464 =C2=B1 15%  interrupts.CPU6=
7.CAL:Function_call_interrupts
>>        8269 =C2=B1  3%     -92.5%     622.17 =C2=B1 33%  interrupts.CPU6=
7.NMI:Non-maskable_interrupts
>>        8269 =C2=B1  3%     -92.5%     622.17 =C2=B1 33%  interrupts.CPU6=
7.PMI:Performance_monitoring_interrupts
>>        2559 =C2=B1 37%     -97.9%      53.33 =C2=B1 57%  interrupts.CPU6=
7.RES:Rescheduling_interrupts
>>        1051 =C2=B1  9%    +504.5%       6357 =C2=B1 13%  interrupts.CPU6=
8.CAL:Function_call_interrupts
>>        5611 =C2=B1 34%     -86.7%     748.83 =C2=B1 25%  interrupts.CPU6=
8.NMI:Non-maskable_interrupts
>>        5611 =C2=B1 34%     -86.7%     748.83 =C2=B1 25%  interrupts.CPU6=
8.PMI:Performance_monitoring_interrupts
>>        2993 =C2=B1 25%     -98.4%      48.83 =C2=B1 52%  interrupts.CPU6=
8.RES:Rescheduling_interrupts
>>        1023 =C2=B1 12%    +514.6%       6289 =C2=B1 13%  interrupts.CPU6=
9.CAL:Function_call_interrupts
>>        5415 =C2=B1 35%     -89.7%     555.83 =C2=B1 34%  interrupts.CPU6=
9.NMI:Non-maskable_interrupts
>>        5415 =C2=B1 35%     -89.7%     555.83 =C2=B1 34%  interrupts.CPU6=
9.PMI:Performance_monitoring_interrupts
>>        3350 =C2=B1 79%     -98.5%      51.83 =C2=B1 61%  interrupts.CPU6=
9.RES:Rescheduling_interrupts
>>      979.67          +554.3%       6410 =C2=B1 11%  interrupts.CPU7.CAL:=
Function_call_interrupts
>>        7015 =C2=B1 26%     -92.3%     540.50 =C2=B1 32%  interrupts.CPU7=
.NMI:Non-maskable_interrupts
>>        7015 =C2=B1 26%     -92.3%     540.50 =C2=B1 32%  interrupts.CPU7=
.PMI:Performance_monitoring_interrupts
>>        1808 =C2=B1 54%     -97.4%      47.00 =C2=B1 53%  interrupts.CPU7=
.RES:Rescheduling_interrupts
>>      991.67 =C2=B1  2%    +548.7%       6432 =C2=B1 11%  interrupts.CPU7=
0.CAL:Function_call_interrupts
>>        5398 =C2=B1 35%     -90.1%     534.33 =C2=B1 37%  interrupts.CPU7=
0.NMI:Non-maskable_interrupts
>>        5398 =C2=B1 35%     -90.1%     534.33 =C2=B1 37%  interrupts.CPU7=
0.PMI:Performance_monitoring_interrupts
>>        2961 =C2=B1 26%     -98.3%      49.50 =C2=B1 46%  interrupts.CPU7=
0.RES:Rescheduling_interrupts
>>      988.33 =C2=B1  3%    +565.9%       6581 =C2=B1 11%  interrupts.CPU7=
1.CAL:Function_call_interrupts
>>        5417 =C2=B1 34%     -86.2%     746.83 =C2=B1 58%  interrupts.CPU7=
1.NMI:Non-maskable_interrupts
>>        5417 =C2=B1 34%     -86.2%     746.83 =C2=B1 58%  interrupts.CPU7=
1.PMI:Performance_monitoring_interrupts
>>        4275 =C2=B1 43%     -98.8%      51.33 =C2=B1 61%  interrupts.CPU7=
1.RES:Rescheduling_interrupts
>>      948.33          +638.3%       7002 =C2=B1  6%  interrupts.CPU72.CAL=
:Function_call_interrupts
>>        5698 =C2=B1 37%     -85.7%     814.67 =C2=B1 35%  interrupts.CPU7=
2.NMI:Non-maskable_interrupts
>>        5698 =C2=B1 37%     -85.7%     814.67 =C2=B1 35%  interrupts.CPU7=
2.PMI:Performance_monitoring_interrupts
>>        2806 =C2=B1 31%     -97.6%      66.00 =C2=B1 42%  interrupts.CPU7=
2.RES:Rescheduling_interrupts
>>       29.67 =C2=B1 54%    +885.4%     292.33 =C2=B1 62%  interrupts.CPU7=
2.TLB:TLB_shootdowns
>>      952.67          +580.7%       6484 =C2=B1 10%  interrupts.CPU73.CAL=
:Function_call_interrupts
>>        7046 =C2=B1 27%     -90.6%     661.33 =C2=B1 30%  interrupts.CPU7=
3.NMI:Non-maskable_interrupts
>>        7046 =C2=B1 27%     -90.6%     661.33 =C2=B1 30%  interrupts.CPU7=
3.PMI:Performance_monitoring_interrupts
>>        3184 =C2=B1 47%     -98.4%      51.33 =C2=B1 56%  interrupts.CPU7=
3.RES:Rescheduling_interrupts
>>      947.33          +570.5%       6351 =C2=B1  9%  interrupts.CPU74.CAL=
:Function_call_interrupts
>>        7904 =C2=B1 10%     -93.3%     531.50 =C2=B1 74%  interrupts.CPU7=
4.NMI:Non-maskable_interrupts
>>        7904 =C2=B1 10%     -93.3%     531.50 =C2=B1 74%  interrupts.CPU7=
4.PMI:Performance_monitoring_interrupts
>>        3650 =C2=B1 42%     -98.7%      49.17 =C2=B1 45%  interrupts.CPU7=
4.RES:Rescheduling_interrupts
>>      949.33          +552.6%       6195 =C2=B1 11%  interrupts.CPU75.CAL=
:Function_call_interrupts
>>        8457 =C2=B1  2%     -91.7%     703.83 =C2=B1 44%  interrupts.CPU7=
5.NMI:Non-maskable_interrupts
>>        8457 =C2=B1  2%     -91.7%     703.83 =C2=B1 44%  interrupts.CPU7=
5.PMI:Performance_monitoring_interrupts
>>        3813 =C2=B1 37%     -98.8%      47.67 =C2=B1 49%  interrupts.CPU7=
5.RES:Rescheduling_interrupts
>>      936.67          +554.5%       6130 =C2=B1 11%  interrupts.CPU76.CAL=
:Function_call_interrupts
>>        8464 =C2=B1  2%     -93.8%     527.00 =C2=B1 45%  interrupts.CPU7=
6.NMI:Non-maskable_interrupts
>>        8464 =C2=B1  2%     -93.8%     527.00 =C2=B1 45%  interrupts.CPU7=
6.PMI:Performance_monitoring_interrupts
>>        1278 =C2=B1 28%     -95.8%      53.17 =C2=B1 42%  interrupts.CPU7=
6.RES:Rescheduling_interrupts
>>      946.67          +571.2%       6354 =C2=B1 14%  interrupts.CPU77.CAL=
:Function_call_interrupts
>>        6825 =C2=B1 28%     -92.0%     549.33 =C2=B1 44%  interrupts.CPU7=
7.NMI:Non-maskable_interrupts
>>        6825 =C2=B1 28%     -92.0%     549.33 =C2=B1 44%  interrupts.CPU7=
7.PMI:Performance_monitoring_interrupts
>>        3098 =C2=B1 34%     -98.3%      52.50 =C2=B1 58%  interrupts.CPU7=
7.RES:Rescheduling_interrupts
>>      944.33          +566.9%       6297 =C2=B1 13%  interrupts.CPU78.CAL=
:Function_call_interrupts
>>        5760 =C2=B1 36%     -91.0%     519.33 =C2=B1 15%  interrupts.CPU7=
8.NMI:Non-maskable_interrupts
>>        5760 =C2=B1 36%     -91.0%     519.33 =C2=B1 15%  interrupts.CPU7=
8.PMI:Performance_monitoring_interrupts
>>        4224 =C2=B1 37%     -98.7%      52.83 =C2=B1 43%  interrupts.CPU7=
8.RES:Rescheduling_interrupts
>>      948.33 =C2=B1  2%    +576.5%       6415 =C2=B1 11%  interrupts.CPU7=
9.CAL:Function_call_interrupts
>>        5753 =C2=B1 36%     -89.6%     600.50 =C2=B1 30%  interrupts.CPU7=
9.NMI:Non-maskable_interrupts
>>        5753 =C2=B1 36%     -89.6%     600.50 =C2=B1 30%  interrupts.CPU7=
9.PMI:Performance_monitoring_interrupts
>>        2781 =C2=B1 32%     -98.1%      53.00 =C2=B1 43%  interrupts.CPU7=
9.RES:Rescheduling_interrupts
>>        1070 =C2=B1 11%    +521.8%       6655 =C2=B1 13%  interrupts.CPU8=
.CAL:Function_call_interrupts
>>        6924 =C2=B1 29%     -91.6%     581.00 =C2=B1 36%  interrupts.CPU8=
.NMI:Non-maskable_interrupts
>>        6924 =C2=B1 29%     -91.6%     581.00 =C2=B1 36%  interrupts.CPU8=
.PMI:Performance_monitoring_interrupts
>>        2162 =C2=B1 12%     -97.2%      60.83 =C2=B1 42%  interrupts.CPU8=
.RES:Rescheduling_interrupts
>>      938.67          +557.4%       6170 =C2=B1 10%  interrupts.CPU80.CAL=
:Function_call_interrupts
>>        6750 =C2=B1 27%     -90.0%     671.83 =C2=B1 51%  interrupts.CPU8=
0.NMI:Non-maskable_interrupts
>>        6750 =C2=B1 27%     -90.0%     671.83 =C2=B1 51%  interrupts.CPU8=
0.PMI:Performance_monitoring_interrupts
>>        3511 =C2=B1 25%     -98.6%      48.00 =C2=B1 43%  interrupts.CPU8=
0.RES:Rescheduling_interrupts
>>      943.33          +579.2%       6407 =C2=B1 17%  interrupts.CPU81.CAL=
:Function_call_interrupts
>>        6992 =C2=B1 28%     -92.2%     543.17 =C2=B1 26%  interrupts.CPU8=
1.NMI:Non-maskable_interrupts
>>        6992 =C2=B1 28%     -92.2%     543.17 =C2=B1 26%  interrupts.CPU8=
1.PMI:Performance_monitoring_interrupts
>>        5467 =C2=B1 17%     -99.1%      46.67 =C2=B1 47%  interrupts.CPU8=
1.RES:Rescheduling_interrupts
>>      939.33          +577.7%       6365 =C2=B1 10%  interrupts.CPU82.CAL=
:Function_call_interrupts
>>        6901 =C2=B1 29%     -89.4%     731.67 =C2=B1 31%  interrupts.CPU8=
2.NMI:Non-maskable_interrupts
>>        6901 =C2=B1 29%     -89.4%     731.67 =C2=B1 31%  interrupts.CPU8=
2.PMI:Performance_monitoring_interrupts
>>        2433 =C2=B1 70%     -97.8%      52.33 =C2=B1 58%  interrupts.CPU8=
2.RES:Rescheduling_interrupts
>>      969.33 =C2=B1  3%    +574.3%       6536 =C2=B1 12%  interrupts.CPU8=
3.CAL:Function_call_interrupts
>>        6887 =C2=B1 26%     -91.8%     564.00 =C2=B1 42%  interrupts.CPU8=
3.NMI:Non-maskable_interrupts
>>        6887 =C2=B1 26%     -91.8%     564.00 =C2=B1 42%  interrupts.CPU8=
3.PMI:Performance_monitoring_interrupts
>>        3200 =C2=B1 51%     -98.4%      50.00 =C2=B1 59%  interrupts.CPU8=
3.RES:Rescheduling_interrupts
>>      937.33          +594.5%       6510 =C2=B1 12%  interrupts.CPU84.CAL=
:Function_call_interrupts
>>        7002 =C2=B1 33%     -90.0%     701.67 =C2=B1 28%  interrupts.CPU8=
4.NMI:Non-maskable_interrupts
>>        7002 =C2=B1 33%     -90.0%     701.67 =C2=B1 28%  interrupts.CPU8=
4.PMI:Performance_monitoring_interrupts
>>        1983 =C2=B1 36%     -97.3%      53.67 =C2=B1 50%  interrupts.CPU8=
4.RES:Rescheduling_interrupts
>>      957.67 =C2=B1  3%    +562.1%       6340 =C2=B1 13%  interrupts.CPU8=
5.CAL:Function_call_interrupts
>>        6788 =C2=B1 28%     -91.1%     605.67 =C2=B1 30%  interrupts.CPU8=
5.NMI:Non-maskable_interrupts
>>        6788 =C2=B1 28%     -91.1%     605.67 =C2=B1 30%  interrupts.CPU8=
5.PMI:Performance_monitoring_interrupts
>>        3385 =C2=B1 23%     -98.5%      51.00 =C2=B1 45%  interrupts.CPU8=
5.RES:Rescheduling_interrupts
>>      951.33 =C2=B1  2%    +562.4%       6301 =C2=B1 10%  interrupts.CPU8=
6.CAL:Function_call_interrupts
>>        6944 =C2=B1 29%     -92.6%     511.67 =C2=B1 37%  interrupts.CPU8=
6.NMI:Non-maskable_interrupts
>>        6944 =C2=B1 29%     -92.6%     511.67 =C2=B1 37%  interrupts.CPU8=
6.PMI:Performance_monitoring_interrupts
>>        3196 =C2=B1 15%     -98.3%      55.83 =C2=B1 41%  interrupts.CPU8=
6.RES:Rescheduling_interrupts
>>      951.00 =C2=B1  2%    +543.5%       6119 =C2=B1 10%  interrupts.CPU8=
7.CAL:Function_call_interrupts
>>        8435 =C2=B1  2%     -93.2%     574.17 =C2=B1 47%  interrupts.CPU8=
7.NMI:Non-maskable_interrupts
>>        8435 =C2=B1  2%     -93.2%     574.17 =C2=B1 47%  interrupts.CPU8=
7.PMI:Performance_monitoring_interrupts
>>        3787 =C2=B1  7%     -98.7%      47.50 =C2=B1 51%  interrupts.CPU8=
7.RES:Rescheduling_interrupts
>>      945.00          +582.8%       6452 =C2=B1 13%  interrupts.CPU88.CAL=
:Function_call_interrupts
>>        6794 =C2=B1 25%     -91.2%     599.83 =C2=B1 38%  interrupts.CPU8=
8.NMI:Non-maskable_interrupts
>>        6794 =C2=B1 25%     -91.2%     599.83 =C2=B1 38%  interrupts.CPU8=
8.PMI:Performance_monitoring_interrupts
>>        4413 =C2=B1 34%     -98.8%      52.33 =C2=B1 45%  interrupts.CPU8=
8.RES:Rescheduling_interrupts
>>      934.33          +569.6%       6256 =C2=B1 11%  interrupts.CPU89.CAL=
:Function_call_interrupts
>>        6948 =C2=B1 28%     -90.0%     697.33 =C2=B1 32%  interrupts.CPU8=
9.NMI:Non-maskable_interrupts
>>        6948 =C2=B1 28%     -90.0%     697.33 =C2=B1 32%  interrupts.CPU8=
9.PMI:Performance_monitoring_interrupts
>>        3620 =C2=B1 26%     -98.6%      51.17 =C2=B1 50%  interrupts.CPU8=
9.RES:Rescheduling_interrupts
>>        1010 =C2=B1  5%    +541.5%       6479 =C2=B1  9%  interrupts.CPU9=
.CAL:Function_call_interrupts
>>        7841 =C2=B1  9%     -91.6%     657.67 =C2=B1 38%  interrupts.CPU9=
.NMI:Non-maskable_interrupts
>>        7841 =C2=B1  9%     -91.6%     657.67 =C2=B1 38%  interrupts.CPU9=
.PMI:Performance_monitoring_interrupts
>>        2984 =C2=B1 31%     -98.3%      52.00 =C2=B1 40%  interrupts.CPU9=
.RES:Rescheduling_interrupts
>>      941.00          +573.6%       6338 =C2=B1 11%  interrupts.CPU90.CAL=
:Function_call_interrupts
>>        6973 =C2=B1 26%     -89.8%     709.17 =C2=B1 44%  interrupts.CPU9=
0.NMI:Non-maskable_interrupts
>>        6973 =C2=B1 26%     -89.8%     709.17 =C2=B1 44%  interrupts.CPU9=
0.PMI:Performance_monitoring_interrupts
>>        2981 =C2=B1 20%     -98.3%      50.67 =C2=B1 43%  interrupts.CPU9=
0.RES:Rescheduling_interrupts
>>      948.67 =C2=B1  2%    +580.9%       6459 =C2=B1 11%  interrupts.CPU9=
1.CAL:Function_call_interrupts
>>        6641 =C2=B1 33%     -92.0%     534.00 =C2=B1 31%  interrupts.CPU9=
1.NMI:Non-maskable_interrupts
>>        6641 =C2=B1 33%     -92.0%     534.00 =C2=B1 31%  interrupts.CPU9=
1.PMI:Performance_monitoring_interrupts
>>        2661 =C2=B1 26%     -97.9%      56.50 =C2=B1 56%  interrupts.CPU9=
1.RES:Rescheduling_interrupts
>>      945.00          +579.0%       6416 =C2=B1 12%  interrupts.CPU92.CAL=
:Function_call_interrupts
>>        6873 =C2=B1 29%     -91.3%     599.17 =C2=B1 49%  interrupts.CPU9=
2.NMI:Non-maskable_interrupts
>>        6873 =C2=B1 29%     -91.3%     599.17 =C2=B1 49%  interrupts.CPU9=
2.PMI:Performance_monitoring_interrupts
>>        2422 =C2=B1 34%     -97.9%      50.33 =C2=B1 48%  interrupts.CPU9=
2.RES:Rescheduling_interrupts
>>      944.00          +564.1%       6269 =C2=B1 10%  interrupts.CPU93.CAL=
:Function_call_interrupts
>>        6978 =C2=B1 28%     -92.0%     555.67 =C2=B1 39%  interrupts.CPU9=
3.NMI:Non-maskable_interrupts
>>        6978 =C2=B1 28%     -92.0%     555.67 =C2=B1 39%  interrupts.CPU9=
3.PMI:Performance_monitoring_interrupts
>>        3044 =C2=B1 18%     -98.3%      50.33 =C2=B1 50%  interrupts.CPU9=
3.RES:Rescheduling_interrupts
>>      951.67          +565.3%       6331 =C2=B1 15%  interrupts.CPU94.CAL=
:Function_call_interrupts
>>        6772 =C2=B1 28%     -91.5%     577.50 =C2=B1 52%  interrupts.CPU9=
4.NMI:Non-maskable_interrupts
>>        6772 =C2=B1 28%     -91.5%     577.50 =C2=B1 52%  interrupts.CPU9=
4.PMI:Performance_monitoring_interrupts
>>        1605 =C2=B1 15%     -96.8%      51.00 =C2=B1 46%  interrupts.CPU9=
4.RES:Rescheduling_interrupts
>>      944.00          +570.4%       6328 =C2=B1 15%  interrupts.CPU95.CAL=
:Function_call_interrupts
>>        7244 =C2=B1 28%     -93.5%     471.50 =C2=B1 32%  interrupts.CPU9=
5.NMI:Non-maskable_interrupts
>>        7244 =C2=B1 28%     -93.5%     471.50 =C2=B1 32%  interrupts.CPU9=
5.PMI:Performance_monitoring_interrupts
>>        3001 =C2=B1 30%     -98.4%      46.83 =C2=B1 39%  interrupts.CPU9=
5.RES:Rescheduling_interrupts
>>      972.67 =C2=B1  2%    +583.5%       6647 =C2=B1  9%  interrupts.CPU9=
6.CAL:Function_call_interrupts
>>        3809 =C2=B1  9%     -83.7%     621.33 =C2=B1 36%  interrupts.CPU9=
6.NMI:Non-maskable_interrupts
>>        3809 =C2=B1  9%     -83.7%     621.33 =C2=B1 36%  interrupts.CPU9=
6.PMI:Performance_monitoring_interrupts
>>        3135 =C2=B1 32%     -98.4%      49.50 =C2=B1 49%  interrupts.CPU9=
6.RES:Rescheduling_interrupts
>>        1017 =C2=B1  2%    +520.7%       6313 =C2=B1  8%  interrupts.CPU9=
7.CAL:Function_call_interrupts
>>        6329 =C2=B1 26%     -90.1%     627.00 =C2=B1 19%  interrupts.CPU9=
7.NMI:Non-maskable_interrupts
>>        6329 =C2=B1 26%     -90.1%     627.00 =C2=B1 19%  interrupts.CPU9=
7.PMI:Performance_monitoring_interrupts
>>        5147 =C2=B1 23%     -99.1%      47.33 =C2=B1 63%  interrupts.CPU9=
7.RES:Rescheduling_interrupts
>>      974.33 =C2=B1  3%    +524.4%       6084 =C2=B1 14%  interrupts.CPU9=
8.CAL:Function_call_interrupts
>>        6476 =C2=B1 29%     -91.3%     561.33 =C2=B1 30%  interrupts.CPU9=
8.NMI:Non-maskable_interrupts
>>        6476 =C2=B1 29%     -91.3%     561.33 =C2=B1 30%  interrupts.CPU9=
8.PMI:Performance_monitoring_interrupts
>>        3420 =C2=B1 18%     -98.8%      42.33 =C2=B1 64%  interrupts.CPU9=
8.RES:Rescheduling_interrupts
>>        1018 =C2=B1  6%    +498.1%       6090 =C2=B1 20%  interrupts.CPU9=
9.CAL:Function_call_interrupts
>>        7812 =C2=B1 10%     -92.2%     607.17 =C2=B1 32%  interrupts.CPU9=
9.NMI:Non-maskable_interrupts
>>        7812 =C2=B1 10%     -92.2%     607.17 =C2=B1 32%  interrupts.CPU9=
9.PMI:Performance_monitoring_interrupts
>>        5101 =C2=B1 11%     -99.0%      52.17 =C2=B1 55%  interrupts.CPU9=
9.RES:Rescheduling_interrupts
>>        7227           -87.6%     893.67 =C2=B1 10%  interrupts.IWI:IRQ_w=
ork_interrupts
>>     1467313           -92.1%     115529 =C2=B1  2%  interrupts.NMI:Non-m=
askable_interrupts
>>     1467313           -92.1%     115529 =C2=B1  2%  interrupts.PMI:Perfo=
rmance_monitoring_interrupts
>>      723979 =C2=B1  5%     -98.7%       9492 =C2=B1 53%  interrupts.RES:=
Rescheduling_interrupts
>>
>>
>>
>>
>>
>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>>
>>
>> ---
>> 0DAY/LKP+ Test Infrastructure                   Open Source Technology C=
enter
>> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corp=
oration
>>
>> Thanks,
>> Oliver Sang
>>
>> #
>> # Automatically generated file; DO NOT EDIT.
>> # Linux/x86_64 5.12.0-rc1 Kernel Configuration
>> #
>> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
>> CONFIG_CC_IS_GCC=3Dy
>> CONFIG_GCC_VERSION=3D90300
>> CONFIG_CLANG_VERSION=3D0
>> CONFIG_LD_IS_BFD=3Dy
>> CONFIG_LD_VERSION=3D23502
>> CONFIG_LLD_VERSION=3D0
>> CONFIG_CC_CAN_LINK=3Dy
>> CONFIG_CC_CAN_LINK_STATIC=3Dy
>> CONFIG_CC_HAS_ASM_GOTO=3Dy
>> CONFIG_CC_HAS_ASM_INLINE=3Dy
>> CONFIG_IRQ_WORK=3Dy
>> CONFIG_BUILDTIME_TABLE_SORT=3Dy
>> CONFIG_THREAD_INFO_IN_TASK=3Dy
>>
>> #
>> # General setup
>> #
>> CONFIG_INIT_ENV_ARG_LIMIT=3D32
>> # CONFIG_COMPILE_TEST is not set
>> CONFIG_LOCALVERSION=3D""
>> CONFIG_LOCALVERSION_AUTO=3Dy
>> CONFIG_BUILD_SALT=3D""
>> CONFIG_HAVE_KERNEL_GZIP=3Dy
>> CONFIG_HAVE_KERNEL_BZIP2=3Dy
>> CONFIG_HAVE_KERNEL_LZMA=3Dy
>> CONFIG_HAVE_KERNEL_XZ=3Dy
>> CONFIG_HAVE_KERNEL_LZO=3Dy
>> CONFIG_HAVE_KERNEL_LZ4=3Dy
>> CONFIG_HAVE_KERNEL_ZSTD=3Dy
>> CONFIG_KERNEL_GZIP=3Dy
>> # CONFIG_KERNEL_BZIP2 is not set
>> # CONFIG_KERNEL_LZMA is not set
>> # CONFIG_KERNEL_XZ is not set
>> # CONFIG_KERNEL_LZO is not set
>> # CONFIG_KERNEL_LZ4 is not set
>> # CONFIG_KERNEL_ZSTD is not set
>> CONFIG_DEFAULT_INIT=3D""
>> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
>> CONFIG_SWAP=3Dy
>> CONFIG_SYSVIPC=3Dy
>> CONFIG_SYSVIPC_SYSCTL=3Dy
>> CONFIG_POSIX_MQUEUE=3Dy
>> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
>> # CONFIG_WATCH_QUEUE is not set
>> CONFIG_CROSS_MEMORY_ATTACH=3Dy
>> # CONFIG_USELIB is not set
>> CONFIG_AUDIT=3Dy
>> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
>> CONFIG_AUDITSYSCALL=3Dy
>>
>> #
>> # IRQ subsystem
>> #
>> CONFIG_GENERIC_IRQ_PROBE=3Dy
>> CONFIG_GENERIC_IRQ_SHOW=3Dy
>> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
>> CONFIG_GENERIC_PENDING_IRQ=3Dy
>> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
>> CONFIG_GENERIC_IRQ_INJECTION=3Dy
>> CONFIG_HARDIRQS_SW_RESEND=3Dy
>> CONFIG_IRQ_DOMAIN=3Dy
>> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
>> CONFIG_GENERIC_MSI_IRQ=3Dy
>> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
>> CONFIG_IRQ_MSI_IOMMU=3Dy
>> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
>> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
>> CONFIG_IRQ_FORCED_THREADING=3Dy
>> CONFIG_SPARSE_IRQ=3Dy
>> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
>> # end of IRQ subsystem
>>
>> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
>> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
>> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
>> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
>> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
>> CONFIG_GENERIC_CMOS_UPDATE=3Dy
>> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
>> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
>>
>> #
>> # Timers subsystem
>> #
>> CONFIG_TICK_ONESHOT=3Dy
>> CONFIG_NO_HZ_COMMON=3Dy
>> # CONFIG_HZ_PERIODIC is not set
>> # CONFIG_NO_HZ_IDLE is not set
>> CONFIG_NO_HZ_FULL=3Dy
>> CONFIG_CONTEXT_TRACKING=3Dy
>> # CONFIG_CONTEXT_TRACKING_FORCE is not set
>> CONFIG_NO_HZ=3Dy
>> CONFIG_HIGH_RES_TIMERS=3Dy
>> # end of Timers subsystem
>>
>> # CONFIG_PREEMPT_NONE is not set
>> CONFIG_PREEMPT_VOLUNTARY=3Dy
>> # CONFIG_PREEMPT is not set
>> CONFIG_PREEMPT_COUNT=3Dy
>>
>> #
>> # CPU/Task time and stats accounting
>> #
>> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
>> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
>> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
>> CONFIG_BSD_PROCESS_ACCT=3Dy
>> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
>> CONFIG_TASKSTATS=3Dy
>> CONFIG_TASK_DELAY_ACCT=3Dy
>> CONFIG_TASK_XACCT=3Dy
>> CONFIG_TASK_IO_ACCOUNTING=3Dy
>> # CONFIG_PSI is not set
>> # end of CPU/Task time and stats accounting
>>
>> CONFIG_CPU_ISOLATION=3Dy
>>
>> #
>> # RCU Subsystem
>> #
>> CONFIG_TREE_RCU=3Dy
>> # CONFIG_RCU_EXPERT is not set
>> CONFIG_SRCU=3Dy
>> CONFIG_TREE_SRCU=3Dy
>> CONFIG_TASKS_RCU_GENERIC=3Dy
>> CONFIG_TASKS_RCU=3Dy
>> CONFIG_TASKS_RUDE_RCU=3Dy
>> CONFIG_TASKS_TRACE_RCU=3Dy
>> CONFIG_RCU_STALL_COMMON=3Dy
>> CONFIG_RCU_NEED_SEGCBLIST=3Dy
>> CONFIG_RCU_NOCB_CPU=3Dy
>> # end of RCU Subsystem
>>
>> CONFIG_BUILD_BIN2C=3Dy
>> CONFIG_IKCONFIG=3Dy
>> CONFIG_IKCONFIG_PROC=3Dy
>> # CONFIG_IKHEADERS is not set
>> CONFIG_LOG_BUF_SHIFT=3D20
>> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
>> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
>> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
>>
>> #
>> # Scheduler features
>> #
>> # CONFIG_UCLAMP_TASK is not set
>> # end of Scheduler features
>>
>> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
>> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
>> CONFIG_CC_HAS_INT128=3Dy
>> CONFIG_ARCH_SUPPORTS_INT128=3Dy
>> CONFIG_NUMA_BALANCING=3Dy
>> CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
>> CONFIG_CGROUPS=3Dy
>> CONFIG_PAGE_COUNTER=3Dy
>> CONFIG_MEMCG=3Dy
>> CONFIG_MEMCG_SWAP=3Dy
>> CONFIG_MEMCG_KMEM=3Dy
>> CONFIG_BLK_CGROUP=3Dy
>> CONFIG_CGROUP_WRITEBACK=3Dy
>> CONFIG_CGROUP_SCHED=3Dy
>> CONFIG_FAIR_GROUP_SCHED=3Dy
>> CONFIG_CFS_BANDWIDTH=3Dy
>> CONFIG_RT_GROUP_SCHED=3Dy
>> CONFIG_CGROUP_PIDS=3Dy
>> CONFIG_CGROUP_RDMA=3Dy
>> CONFIG_CGROUP_FREEZER=3Dy
>> CONFIG_CGROUP_HUGETLB=3Dy
>> CONFIG_CPUSETS=3Dy
>> CONFIG_PROC_PID_CPUSET=3Dy
>> CONFIG_CGROUP_DEVICE=3Dy
>> CONFIG_CGROUP_CPUACCT=3Dy
>> CONFIG_CGROUP_PERF=3Dy
>> CONFIG_CGROUP_BPF=3Dy
>> # CONFIG_CGROUP_DEBUG is not set
>> CONFIG_SOCK_CGROUP_DATA=3Dy
>> CONFIG_NAMESPACES=3Dy
>> CONFIG_UTS_NS=3Dy
>> CONFIG_TIME_NS=3Dy
>> CONFIG_IPC_NS=3Dy
>> CONFIG_USER_NS=3Dy
>> CONFIG_PID_NS=3Dy
>> CONFIG_NET_NS=3Dy
>> # CONFIG_CHECKPOINT_RESTORE is not set
>> CONFIG_SCHED_AUTOGROUP=3Dy
>> # CONFIG_SYSFS_DEPRECATED is not set
>> CONFIG_RELAY=3Dy
>> CONFIG_BLK_DEV_INITRD=3Dy
>> CONFIG_INITRAMFS_SOURCE=3D""
>> CONFIG_RD_GZIP=3Dy
>> CONFIG_RD_BZIP2=3Dy
>> CONFIG_RD_LZMA=3Dy
>> CONFIG_RD_XZ=3Dy
>> CONFIG_RD_LZO=3Dy
>> CONFIG_RD_LZ4=3Dy
>> CONFIG_RD_ZSTD=3Dy
>> # CONFIG_BOOT_CONFIG is not set
>> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
>> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
>> CONFIG_LD_ORPHAN_WARN=3Dy
>> CONFIG_SYSCTL=3Dy
>> CONFIG_HAVE_UID16=3Dy
>> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
>> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
>> CONFIG_BPF=3Dy
>> # CONFIG_EXPERT is not set
>> CONFIG_UID16=3Dy
>> CONFIG_MULTIUSER=3Dy
>> CONFIG_SGETMASK_SYSCALL=3Dy
>> CONFIG_SYSFS_SYSCALL=3Dy
>> CONFIG_FHANDLE=3Dy
>> CONFIG_POSIX_TIMERS=3Dy
>> CONFIG_PRINTK=3Dy
>> CONFIG_PRINTK_NMI=3Dy
>> CONFIG_BUG=3Dy
>> CONFIG_ELF_CORE=3Dy
>> CONFIG_PCSPKR_PLATFORM=3Dy
>> CONFIG_BASE_FULL=3Dy
>> CONFIG_FUTEX=3Dy
>> CONFIG_FUTEX_PI=3Dy
>> CONFIG_EPOLL=3Dy
>> CONFIG_SIGNALFD=3Dy
>> CONFIG_TIMERFD=3Dy
>> CONFIG_EVENTFD=3Dy
>> CONFIG_SHMEM=3Dy
>> CONFIG_AIO=3Dy
>> CONFIG_IO_URING=3Dy
>> CONFIG_ADVISE_SYSCALLS=3Dy
>> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
>> CONFIG_MEMBARRIER=3Dy
>> CONFIG_KALLSYMS=3Dy
>> CONFIG_KALLSYMS_ALL=3Dy
>> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
>> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
>> # CONFIG_BPF_LSM is not set
>> CONFIG_BPF_SYSCALL=3Dy
>> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
>> CONFIG_BPF_JIT_ALWAYS_ON=3Dy
>> CONFIG_BPF_JIT_DEFAULT_ON=3Dy
>> # CONFIG_BPF_PRELOAD is not set
>> CONFIG_USERFAULTFD=3Dy
>> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
>> CONFIG_KCMP=3Dy
>> CONFIG_RSEQ=3Dy
>> # CONFIG_EMBEDDED is not set
>> CONFIG_HAVE_PERF_EVENTS=3Dy
>>
>> #
>> # Kernel Performance Events And Counters
>> #
>> CONFIG_PERF_EVENTS=3Dy
>> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
>> # end of Kernel Performance Events And Counters
>>
>> CONFIG_VM_EVENT_COUNTERS=3Dy
>> CONFIG_SLUB_DEBUG=3Dy
>> # CONFIG_COMPAT_BRK is not set
>> # CONFIG_SLAB is not set
>> CONFIG_SLUB=3Dy
>> CONFIG_SLAB_MERGE_DEFAULT=3Dy
>> CONFIG_SLAB_FREELIST_RANDOM=3Dy
>> # CONFIG_SLAB_FREELIST_HARDENED is not set
>> CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
>> CONFIG_SLUB_CPU_PARTIAL=3Dy
>> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
>> CONFIG_PROFILING=3Dy
>> CONFIG_TRACEPOINTS=3Dy
>> # end of General setup
>>
>> CONFIG_64BIT=3Dy
>> CONFIG_X86_64=3Dy
>> CONFIG_X86=3Dy
>> CONFIG_INSTRUCTION_DECODER=3Dy
>> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
>> CONFIG_LOCKDEP_SUPPORT=3Dy
>> CONFIG_STACKTRACE_SUPPORT=3Dy
>> CONFIG_MMU=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
>> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
>> CONFIG_GENERIC_ISA_DMA=3Dy
>> CONFIG_GENERIC_BUG=3Dy
>> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
>> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
>> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
>> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
>> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
>> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
>> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
>> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
>> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
>> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
>> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
>> CONFIG_ZONE_DMA32=3Dy
>> CONFIG_AUDIT_ARCH=3Dy
>> CONFIG_HAVE_INTEL_TXT=3Dy
>> CONFIG_X86_64_SMP=3Dy
>> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
>> CONFIG_FIX_EARLYCON_MEM=3Dy
>> CONFIG_DYNAMIC_PHYSICAL_MASK=3Dy
>> CONFIG_PGTABLE_LEVELS=3D5
>> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
>>
>> #
>> # Processor type and features
>> #
>> CONFIG_ZONE_DMA=3Dy
>> CONFIG_SMP=3Dy
>> CONFIG_X86_FEATURE_NAMES=3Dy
>> CONFIG_X86_X2APIC=3Dy
>> CONFIG_X86_MPPARSE=3Dy
>> # CONFIG_GOLDFISH is not set
>> CONFIG_RETPOLINE=3Dy
>> CONFIG_X86_CPU_RESCTRL=3Dy
>> CONFIG_X86_EXTENDED_PLATFORM=3Dy
>> # CONFIG_X86_NUMACHIP is not set
>> # CONFIG_X86_VSMP is not set
>> CONFIG_X86_UV=3Dy
>> # CONFIG_X86_GOLDFISH is not set
>> # CONFIG_X86_INTEL_MID is not set
>> CONFIG_X86_INTEL_LPSS=3Dy
>> CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
>> CONFIG_IOSF_MBI=3Dy
>> # CONFIG_IOSF_MBI_DEBUG is not set
>> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
>> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
>> CONFIG_HYPERVISOR_GUEST=3Dy
>> CONFIG_PARAVIRT=3Dy
>> # CONFIG_PARAVIRT_DEBUG is not set
>> CONFIG_PARAVIRT_SPINLOCKS=3Dy
>> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
>> CONFIG_XEN=3Dy
>> # CONFIG_XEN_PV is not set
>> CONFIG_XEN_PVHVM=3Dy
>> CONFIG_XEN_PVHVM_SMP=3Dy
>> CONFIG_XEN_PVHVM_GUEST=3Dy
>> CONFIG_XEN_SAVE_RESTORE=3Dy
>> # CONFIG_XEN_DEBUG_FS is not set
>> # CONFIG_XEN_PVH is not set
>> CONFIG_KVM_GUEST=3Dy
>> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
>> # CONFIG_PVH is not set
>> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
>> CONFIG_PARAVIRT_CLOCK=3Dy
>> # CONFIG_JAILHOUSE_GUEST is not set
>> # CONFIG_ACRN_GUEST is not set
>> # CONFIG_MK8 is not set
>> # CONFIG_MPSC is not set
>> # CONFIG_MCORE2 is not set
>> # CONFIG_MATOM is not set
>> CONFIG_GENERIC_CPU=3Dy
>> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
>> CONFIG_X86_L1_CACHE_SHIFT=3D6
>> CONFIG_X86_TSC=3Dy
>> CONFIG_X86_CMPXCHG64=3Dy
>> CONFIG_X86_CMOV=3Dy
>> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
>> CONFIG_X86_DEBUGCTLMSR=3Dy
>> CONFIG_IA32_FEAT_CTL=3Dy
>> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
>> CONFIG_CPU_SUP_INTEL=3Dy
>> CONFIG_CPU_SUP_AMD=3Dy
>> CONFIG_CPU_SUP_HYGON=3Dy
>> CONFIG_CPU_SUP_CENTAUR=3Dy
>> CONFIG_CPU_SUP_ZHAOXIN=3Dy
>> CONFIG_HPET_TIMER=3Dy
>> CONFIG_HPET_EMULATE_RTC=3Dy
>> CONFIG_DMI=3Dy
>> # CONFIG_GART_IOMMU is not set
>> CONFIG_MAXSMP=3Dy
>> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
>> CONFIG_NR_CPUS_RANGE_END=3D8192
>> CONFIG_NR_CPUS_DEFAULT=3D8192
>> CONFIG_NR_CPUS=3D8192
>> CONFIG_SCHED_SMT=3Dy
>> CONFIG_SCHED_MC=3Dy
>> CONFIG_SCHED_MC_PRIO=3Dy
>> CONFIG_X86_LOCAL_APIC=3Dy
>> CONFIG_X86_IO_APIC=3Dy
>> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
>> CONFIG_X86_MCE=3Dy
>> CONFIG_X86_MCELOG_LEGACY=3Dy
>> CONFIG_X86_MCE_INTEL=3Dy
>> CONFIG_X86_MCE_AMD=3Dy
>> CONFIG_X86_MCE_THRESHOLD=3Dy
>> CONFIG_X86_MCE_INJECT=3Dm
>>
>> #
>> # Performance monitoring
>> #
>> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dm
>> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
>> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
>> CONFIG_PERF_EVENTS_AMD_POWER=3Dm
>> # end of Performance monitoring
>>
>> CONFIG_X86_16BIT=3Dy
>> CONFIG_X86_ESPFIX64=3Dy
>> CONFIG_X86_VSYSCALL_EMULATION=3Dy
>> CONFIG_X86_IOPL_IOPERM=3Dy
>> CONFIG_I8K=3Dm
>> CONFIG_MICROCODE=3Dy
>> CONFIG_MICROCODE_INTEL=3Dy
>> CONFIG_MICROCODE_AMD=3Dy
>> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
>> CONFIG_X86_MSR=3Dy
>> CONFIG_X86_CPUID=3Dy
>> CONFIG_X86_5LEVEL=3Dy
>> CONFIG_X86_DIRECT_GBPAGES=3Dy
>> # CONFIG_X86_CPA_STATISTICS is not set
>> CONFIG_AMD_MEM_ENCRYPT=3Dy
>> # CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
>> CONFIG_NUMA=3Dy
>> CONFIG_AMD_NUMA=3Dy
>> CONFIG_X86_64_ACPI_NUMA=3Dy
>> CONFIG_NUMA_EMU=3Dy
>> CONFIG_NODES_SHIFT=3D10
>> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
>> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
>> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
>> # CONFIG_ARCH_MEMORY_PROBE is not set
>> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
>> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
>> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
>> CONFIG_X86_PMEM_LEGACY=3Dm
>> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
>> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
>> CONFIG_X86_RESERVE_LOW=3D64
>> CONFIG_MTRR=3Dy
>> CONFIG_MTRR_SANITIZER=3Dy
>> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D1
>> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
>> CONFIG_X86_PAT=3Dy
>> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
>> CONFIG_ARCH_RANDOM=3Dy
>> CONFIG_X86_SMAP=3Dy
>> CONFIG_X86_UMIP=3Dy
>> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
>> CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
>> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
>> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
>> # CONFIG_X86_SGX is not set
>> CONFIG_EFI=3Dy
>> CONFIG_EFI_STUB=3Dy
>> CONFIG_EFI_MIXED=3Dy
>> # CONFIG_HZ_100 is not set
>> # CONFIG_HZ_250 is not set
>> # CONFIG_HZ_300 is not set
>> CONFIG_HZ_1000=3Dy
>> CONFIG_HZ=3D1000
>> CONFIG_SCHED_HRTICK=3Dy
>> CONFIG_KEXEC=3Dy
>> CONFIG_KEXEC_FILE=3Dy
>> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
>> # CONFIG_KEXEC_SIG is not set
>> CONFIG_CRASH_DUMP=3Dy
>> CONFIG_KEXEC_JUMP=3Dy
>> CONFIG_PHYSICAL_START=3D0x1000000
>> CONFIG_RELOCATABLE=3Dy
>> CONFIG_RANDOMIZE_BASE=3Dy
>> CONFIG_X86_NEED_RELOCS=3Dy
>> CONFIG_PHYSICAL_ALIGN=3D0x200000
>> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
>> CONFIG_RANDOMIZE_MEMORY=3Dy
>> CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0xa
>> CONFIG_HOTPLUG_CPU=3Dy
>> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
>> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
>> # CONFIG_COMPAT_VDSO is not set
>> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
>> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
>> # CONFIG_LEGACY_VSYSCALL_NONE is not set
>> # CONFIG_CMDLINE_BOOL is not set
>> CONFIG_MODIFY_LDT_SYSCALL=3Dy
>> CONFIG_HAVE_LIVEPATCH=3Dy
>> CONFIG_LIVEPATCH=3Dy
>> # end of Processor type and features
>>
>> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
>> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
>> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
>> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
>> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
>> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
>>
>> #
>> # Power management and ACPI options
>> #
>> CONFIG_ARCH_HIBERNATION_HEADER=3Dy
>> CONFIG_SUSPEND=3Dy
>> CONFIG_SUSPEND_FREEZER=3Dy
>> CONFIG_HIBERNATE_CALLBACKS=3Dy
>> CONFIG_HIBERNATION=3Dy
>> CONFIG_HIBERNATION_SNAPSHOT_DEV=3Dy
>> CONFIG_PM_STD_PARTITION=3D""
>> CONFIG_PM_SLEEP=3Dy
>> CONFIG_PM_SLEEP_SMP=3Dy
>> # CONFIG_PM_AUTOSLEEP is not set
>> # CONFIG_PM_WAKELOCKS is not set
>> CONFIG_PM=3Dy
>> CONFIG_PM_DEBUG=3Dy
>> # CONFIG_PM_ADVANCED_DEBUG is not set
>> # CONFIG_PM_TEST_SUSPEND is not set
>> CONFIG_PM_SLEEP_DEBUG=3Dy
>> # CONFIG_PM_TRACE_RTC is not set
>> CONFIG_PM_CLK=3Dy
>> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
>> # CONFIG_ENERGY_MODEL is not set
>> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
>> CONFIG_ACPI=3Dy
>> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
>> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
>> # CONFIG_ACPI_DEBUGGER is not set
>> CONFIG_ACPI_SPCR_TABLE=3Dy
>> # CONFIG_ACPI_FPDT is not set
>> CONFIG_ACPI_LPIT=3Dy
>> CONFIG_ACPI_SLEEP=3Dy
>> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
>> CONFIG_ACPI_EC_DEBUGFS=3Dm
>> CONFIG_ACPI_AC=3Dy
>> CONFIG_ACPI_BATTERY=3Dy
>> CONFIG_ACPI_BUTTON=3Dy
>> CONFIG_ACPI_VIDEO=3Dm
>> CONFIG_ACPI_FAN=3Dy
>> CONFIG_ACPI_TAD=3Dm
>> CONFIG_ACPI_DOCK=3Dy
>> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
>> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
>> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
>> CONFIG_ACPI_CPPC_LIB=3Dy
>> CONFIG_ACPI_PROCESSOR=3Dy
>> CONFIG_ACPI_IPMI=3Dm
>> CONFIG_ACPI_HOTPLUG_CPU=3Dy
>> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
>> CONFIG_ACPI_THERMAL=3Dy
>> CONFIG_ACPI_PLATFORM_PROFILE=3Dm
>> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
>> CONFIG_ACPI_TABLE_UPGRADE=3Dy
>> # CONFIG_ACPI_DEBUG is not set
>> CONFIG_ACPI_PCI_SLOT=3Dy
>> CONFIG_ACPI_CONTAINER=3Dy
>> CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
>> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
>> CONFIG_ACPI_SBS=3Dm
>> CONFIG_ACPI_HED=3Dy
>> # CONFIG_ACPI_CUSTOM_METHOD is not set
>> CONFIG_ACPI_BGRT=3Dy
>> CONFIG_ACPI_NFIT=3Dm
>> # CONFIG_NFIT_SECURITY_DEBUG is not set
>> CONFIG_ACPI_NUMA=3Dy
>> # CONFIG_ACPI_HMAT is not set
>> CONFIG_HAVE_ACPI_APEI=3Dy
>> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
>> CONFIG_ACPI_APEI=3Dy
>> CONFIG_ACPI_APEI_GHES=3Dy
>> CONFIG_ACPI_APEI_PCIEAER=3Dy
>> CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
>> CONFIG_ACPI_APEI_EINJ=3Dm
>> CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
>> # CONFIG_ACPI_DPTF is not set
>> CONFIG_ACPI_WATCHDOG=3Dy
>> CONFIG_ACPI_EXTLOG=3Dm
>> CONFIG_ACPI_ADXL=3Dy
>> # CONFIG_ACPI_CONFIGFS is not set
>> CONFIG_PMIC_OPREGION=3Dy
>> CONFIG_X86_PM_TIMER=3Dy
>>
>> #
>> # CPU Frequency scaling
>> #
>> CONFIG_CPU_FREQ=3Dy
>> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
>> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
>> CONFIG_CPU_FREQ_STAT=3Dy
>> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
>> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
>> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
>> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
>> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
>> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
>> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
>> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
>>
>> #
>> # CPU frequency scaling drivers
>> #
>> CONFIG_X86_INTEL_PSTATE=3Dy
>> # CONFIG_X86_PCC_CPUFREQ is not set
>> CONFIG_X86_ACPI_CPUFREQ=3Dm
>> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
>> CONFIG_X86_POWERNOW_K8=3Dm
>> CONFIG_X86_AMD_FREQ_SENSITIVITY=3Dm
>> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
>> CONFIG_X86_P4_CLOCKMOD=3Dm
>>
>> #
>> # shared options
>> #
>> CONFIG_X86_SPEEDSTEP_LIB=3Dm
>> # end of CPU Frequency scaling
>>
>> #
>> # CPU Idle
>> #
>> CONFIG_CPU_IDLE=3Dy
>> # CONFIG_CPU_IDLE_GOV_LADDER is not set
>> CONFIG_CPU_IDLE_GOV_MENU=3Dy
>> # CONFIG_CPU_IDLE_GOV_TEO is not set
>> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
>> CONFIG_HALTPOLL_CPUIDLE=3Dy
>> # end of CPU Idle
>>
>> CONFIG_INTEL_IDLE=3Dy
>> # end of Power management and ACPI options
>>
>> #
>> # Bus options (PCI etc.)
>> #
>> CONFIG_PCI_DIRECT=3Dy
>> CONFIG_PCI_MMCONFIG=3Dy
>> CONFIG_PCI_XEN=3Dy
>> CONFIG_MMCONF_FAM10H=3Dy
>> CONFIG_ISA_DMA_API=3Dy
>> CONFIG_AMD_NB=3Dy
>> # CONFIG_X86_SYSFB is not set
>> # end of Bus options (PCI etc.)
>>
>> #
>> # Binary Emulations
>> #
>> CONFIG_IA32_EMULATION=3Dy
>> # CONFIG_X86_X32 is not set
>> CONFIG_COMPAT_32=3Dy
>> CONFIG_COMPAT=3Dy
>> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
>> CONFIG_SYSVIPC_COMPAT=3Dy
>> # end of Binary Emulations
>>
>> #
>> # Firmware Drivers
>> #
>> CONFIG_EDD=3Dm
>> # CONFIG_EDD_OFF is not set
>> CONFIG_FIRMWARE_MEMMAP=3Dy
>> CONFIG_DMIID=3Dy
>> CONFIG_DMI_SYSFS=3Dy
>> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
>> # CONFIG_ISCSI_IBFT is not set
>> CONFIG_FW_CFG_SYSFS=3Dy
>> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
>> # CONFIG_GOOGLE_FIRMWARE is not set
>>
>> #
>> # EFI (Extensible Firmware Interface) Support
>> #
>> CONFIG_EFI_VARS=3Dy
>> CONFIG_EFI_ESRT=3Dy
>> CONFIG_EFI_VARS_PSTORE=3Dy
>> CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=3Dy
>> CONFIG_EFI_RUNTIME_MAP=3Dy
>> # CONFIG_EFI_FAKE_MEMMAP is not set
>> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
>> CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=3Dy
>> # CONFIG_EFI_BOOTLOADER_CONTROL is not set
>> # CONFIG_EFI_CAPSULE_LOADER is not set
>> # CONFIG_EFI_TEST is not set
>> CONFIG_APPLE_PROPERTIES=3Dy
>> # CONFIG_RESET_ATTACK_MITIGATION is not set
>> # CONFIG_EFI_RCI2_TABLE is not set
>> # CONFIG_EFI_DISABLE_PCI_DMA is not set
>> # end of EFI (Extensible Firmware Interface) Support
>>
>> CONFIG_UEFI_CPER=3Dy
>> CONFIG_UEFI_CPER_X86=3Dy
>> CONFIG_EFI_DEV_PATH_PARSER=3Dy
>> CONFIG_EFI_EARLYCON=3Dy
>> CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=3Dy
>>
>> #
>> # Tegra firmware driver
>> #
>> # end of Tegra firmware driver
>> # end of Firmware Drivers
>>
>> CONFIG_HAVE_KVM=3Dy
>> CONFIG_HAVE_KVM_IRQCHIP=3Dy
>> CONFIG_HAVE_KVM_IRQFD=3Dy
>> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
>> CONFIG_HAVE_KVM_EVENTFD=3Dy
>> CONFIG_KVM_MMIO=3Dy
>> CONFIG_KVM_ASYNC_PF=3Dy
>> CONFIG_HAVE_KVM_MSI=3Dy
>> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
>> CONFIG_KVM_VFIO=3Dy
>> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
>> CONFIG_KVM_COMPAT=3Dy
>> CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
>> CONFIG_HAVE_KVM_NO_POLL=3Dy
>> CONFIG_KVM_XFER_TO_GUEST_WORK=3Dy
>> CONFIG_VIRTUALIZATION=3Dy
>> CONFIG_KVM=3Dm
>> CONFIG_KVM_INTEL=3Dm
>> # CONFIG_KVM_AMD is not set
>> CONFIG_KVM_MMU_AUDIT=3Dy
>> CONFIG_AS_AVX512=3Dy
>> CONFIG_AS_SHA1_NI=3Dy
>> CONFIG_AS_SHA256_NI=3Dy
>> CONFIG_AS_TPAUSE=3Dy
>>
>> #
>> # General architecture-dependent options
>> #
>> CONFIG_CRASH_CORE=3Dy
>> CONFIG_KEXEC_CORE=3Dy
>> CONFIG_HOTPLUG_SMT=3Dy
>> CONFIG_GENERIC_ENTRY=3Dy
>> CONFIG_KPROBES=3Dy
>> CONFIG_JUMP_LABEL=3Dy
>> # CONFIG_STATIC_KEYS_SELFTEST is not set
>> # CONFIG_STATIC_CALL_SELFTEST is not set
>> CONFIG_OPTPROBES=3Dy
>> CONFIG_KPROBES_ON_FTRACE=3Dy
>> CONFIG_UPROBES=3Dy
>> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
>> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
>> CONFIG_KRETPROBES=3Dy
>> CONFIG_USER_RETURN_NOTIFIER=3Dy
>> CONFIG_HAVE_IOREMAP_PROT=3Dy
>> CONFIG_HAVE_KPROBES=3Dy
>> CONFIG_HAVE_KRETPROBES=3Dy
>> CONFIG_HAVE_OPTPROBES=3Dy
>> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
>> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
>> CONFIG_HAVE_NMI=3Dy
>> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
>> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
>> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
>> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
>> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
>> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
>> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
>> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
>> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
>> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
>> CONFIG_HAVE_RSEQ=3Dy
>> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
>> CONFIG_HAVE_HW_BREAKPOINT=3Dy
>> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
>> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
>> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
>> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
>> CONFIG_HAVE_PERF_REGS=3Dy
>> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
>> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
>> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
>> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
>> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
>> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
>> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
>> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
>> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
>> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
>> CONFIG_HAVE_ARCH_SECCOMP=3Dy
>> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
>> CONFIG_SECCOMP=3Dy
>> CONFIG_SECCOMP_FILTER=3Dy
>> # CONFIG_SECCOMP_CACHE_DEBUG is not set
>> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
>> CONFIG_HAVE_STACKPROTECTOR=3Dy
>> CONFIG_STACKPROTECTOR=3Dy
>> CONFIG_STACKPROTECTOR_STRONG=3Dy
>> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
>> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
>> CONFIG_LTO_NONE=3Dy
>> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
>> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
>> CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
>> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
>> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
>> CONFIG_HAVE_MOVE_PUD=3Dy
>> CONFIG_HAVE_MOVE_PMD=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
>> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
>> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
>> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
>> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
>> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
>> CONFIG_MODULES_USE_ELF_RELA=3Dy
>> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
>> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
>> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
>> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
>> CONFIG_HAVE_EXIT_THREAD=3Dy
>> CONFIG_ARCH_MMAP_RND_BITS=3D28
>> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
>> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
>> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
>> CONFIG_HAVE_STACK_VALIDATION=3Dy
>> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
>> CONFIG_OLD_SIGSUSPEND3=3Dy
>> CONFIG_COMPAT_OLD_SIGACTION=3Dy
>> CONFIG_COMPAT_32BIT_TIME=3Dy
>> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
>> CONFIG_VMAP_STACK=3Dy
>> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
>> CONFIG_STRICT_KERNEL_RWX=3Dy
>> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
>> CONFIG_STRICT_MODULE_RWX=3Dy
>> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
>> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
>> # CONFIG_LOCK_EVENT_COUNTS is not set
>> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
>> CONFIG_HAVE_STATIC_CALL=3Dy
>> CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
>> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
>> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
>> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
>> CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
>>
>> #
>> # GCOV-based kernel profiling
>> #
>> # CONFIG_GCOV_KERNEL is not set
>> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
>> # end of GCOV-based kernel profiling
>>
>> CONFIG_HAVE_GCC_PLUGINS=3Dy
>> # end of General architecture-dependent options
>>
>> CONFIG_RT_MUTEXES=3Dy
>> CONFIG_BASE_SMALL=3D0
>> CONFIG_MODULE_SIG_FORMAT=3Dy
>> CONFIG_MODULES=3Dy
>> CONFIG_MODULE_FORCE_LOAD=3Dy
>> CONFIG_MODULE_UNLOAD=3Dy
>> # CONFIG_MODULE_FORCE_UNLOAD is not set
>> # CONFIG_MODVERSIONS is not set
>> # CONFIG_MODULE_SRCVERSION_ALL is not set
>> CONFIG_MODULE_SIG=3Dy
>> # CONFIG_MODULE_SIG_FORCE is not set
>> CONFIG_MODULE_SIG_ALL=3Dy
>> # CONFIG_MODULE_SIG_SHA1 is not set
>> # CONFIG_MODULE_SIG_SHA224 is not set
>> CONFIG_MODULE_SIG_SHA256=3Dy
>> # CONFIG_MODULE_SIG_SHA384 is not set
>> # CONFIG_MODULE_SIG_SHA512 is not set
>> CONFIG_MODULE_SIG_HASH=3D"sha256"
>> # CONFIG_MODULE_COMPRESS is not set
>> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
>> CONFIG_MODULES_TREE_LOOKUP=3Dy
>> CONFIG_BLOCK=3Dy
>> CONFIG_BLK_SCSI_REQUEST=3Dy
>> CONFIG_BLK_CGROUP_RWSTAT=3Dy
>> CONFIG_BLK_DEV_BSG=3Dy
>> CONFIG_BLK_DEV_BSGLIB=3Dy
>> CONFIG_BLK_DEV_INTEGRITY=3Dy
>> CONFIG_BLK_DEV_INTEGRITY_T10=3Dm
>> CONFIG_BLK_DEV_ZONED=3Dy
>> CONFIG_BLK_DEV_THROTTLING=3Dy
>> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
>> # CONFIG_BLK_CMDLINE_PARSER is not set
>> CONFIG_BLK_WBT=3Dy
>> # CONFIG_BLK_CGROUP_IOLATENCY is not set
>> # CONFIG_BLK_CGROUP_IOCOST is not set
>> CONFIG_BLK_WBT_MQ=3Dy
>> CONFIG_BLK_DEBUG_FS=3Dy
>> CONFIG_BLK_DEBUG_FS_ZONED=3Dy
>> # CONFIG_BLK_SED_OPAL is not set
>> # CONFIG_BLK_INLINE_ENCRYPTION is not set
>>
>> #
>> # Partition Types
>> #
>> CONFIG_PARTITION_ADVANCED=3Dy
>> # CONFIG_ACORN_PARTITION is not set
>> # CONFIG_AIX_PARTITION is not set
>> CONFIG_OSF_PARTITION=3Dy
>> CONFIG_AMIGA_PARTITION=3Dy
>> # CONFIG_ATARI_PARTITION is not set
>> CONFIG_MAC_PARTITION=3Dy
>> CONFIG_MSDOS_PARTITION=3Dy
>> CONFIG_BSD_DISKLABEL=3Dy
>> CONFIG_MINIX_SUBPARTITION=3Dy
>> CONFIG_SOLARIS_X86_PARTITION=3Dy
>> CONFIG_UNIXWARE_DISKLABEL=3Dy
>> # CONFIG_LDM_PARTITION is not set
>> CONFIG_SGI_PARTITION=3Dy
>> # CONFIG_ULTRIX_PARTITION is not set
>> CONFIG_SUN_PARTITION=3Dy
>> CONFIG_KARMA_PARTITION=3Dy
>> CONFIG_EFI_PARTITION=3Dy
>> # CONFIG_SYSV68_PARTITION is not set
>> # CONFIG_CMDLINE_PARTITION is not set
>> # end of Partition Types
>>
>> CONFIG_BLOCK_COMPAT=3Dy
>> CONFIG_BLK_MQ_PCI=3Dy
>> CONFIG_BLK_MQ_VIRTIO=3Dy
>> CONFIG_BLK_MQ_RDMA=3Dy
>> CONFIG_BLK_PM=3Dy
>>
>> #
>> # IO Schedulers
>> #
>> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
>> CONFIG_MQ_IOSCHED_KYBER=3Dy
>> CONFIG_IOSCHED_BFQ=3Dy
>> CONFIG_BFQ_GROUP_IOSCHED=3Dy
>> # CONFIG_BFQ_CGROUP_DEBUG is not set
>> # end of IO Schedulers
>>
>> CONFIG_PREEMPT_NOTIFIERS=3Dy
>> CONFIG_PADATA=3Dy
>> CONFIG_ASN1=3Dy
>> CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
>> CONFIG_INLINE_READ_UNLOCK=3Dy
>> CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
>> CONFIG_INLINE_WRITE_UNLOCK=3Dy
>> CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
>> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
>> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
>> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
>> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
>> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
>> CONFIG_QUEUED_SPINLOCKS=3Dy
>> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
>> CONFIG_QUEUED_RWLOCKS=3Dy
>> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
>> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
>> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
>> CONFIG_FREEZER=3Dy
>>
>> #
>> # Executable file formats
>> #
>> CONFIG_BINFMT_ELF=3Dy
>> CONFIG_COMPAT_BINFMT_ELF=3Dy
>> CONFIG_ELFCORE=3Dy
>> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
>> CONFIG_BINFMT_SCRIPT=3Dy
>> CONFIG_BINFMT_MISC=3Dm
>> CONFIG_COREDUMP=3Dy
>> # end of Executable file formats
>>
>> #
>> # Memory Management options
>> #
>> CONFIG_SELECT_MEMORY_MODEL=3Dy
>> CONFIG_SPARSEMEM_MANUAL=3Dy
>> CONFIG_SPARSEMEM=3Dy
>> CONFIG_NEED_MULTIPLE_NODES=3Dy
>> CONFIG_SPARSEMEM_EXTREME=3Dy
>> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
>> CONFIG_SPARSEMEM_VMEMMAP=3Dy
>> CONFIG_HAVE_FAST_GUP=3Dy
>> CONFIG_NUMA_KEEP_MEMINFO=3Dy
>> CONFIG_MEMORY_ISOLATION=3Dy
>> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
>> CONFIG_MEMORY_HOTPLUG=3Dy
>> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
>> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
>> CONFIG_MEMORY_HOTREMOVE=3Dy
>> CONFIG_SPLIT_PTLOCK_CPUS=3D4
>> CONFIG_MEMORY_BALLOON=3Dy
>> CONFIG_BALLOON_COMPACTION=3Dy
>> CONFIG_COMPACTION=3Dy
>> CONFIG_PAGE_REPORTING=3Dy
>> CONFIG_MIGRATION=3Dy
>> CONFIG_CONTIG_ALLOC=3Dy
>> CONFIG_PHYS_ADDR_T_64BIT=3Dy
>> CONFIG_BOUNCE=3Dy
>> CONFIG_VIRT_TO_BUS=3Dy
>> CONFIG_MMU_NOTIFIER=3Dy
>> CONFIG_KSM=3Dy
>> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
>> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
>> CONFIG_MEMORY_FAILURE=3Dy
>> CONFIG_HWPOISON_INJECT=3Dm
>> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
>> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
>> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
>> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
>> CONFIG_THP_SWAP=3Dy
>> CONFIG_CLEANCACHE=3Dy
>> CONFIG_FRONTSWAP=3Dy
>> CONFIG_CMA=3Dy
>> # CONFIG_CMA_DEBUG is not set
>> # CONFIG_CMA_DEBUGFS is not set
>> CONFIG_CMA_AREAS=3D19
>> CONFIG_ZSWAP=3Dy
>> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
>> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=3Dy
>> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
>> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
>> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
>> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
>> CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lzo"
>> CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=3Dy
>> # CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
>> # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
>> CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"zbud"
>> # CONFIG_ZSWAP_DEFAULT_ON is not set
>> CONFIG_ZPOOL=3Dy
>> CONFIG_ZBUD=3Dy
>> # CONFIG_Z3FOLD is not set
>> CONFIG_ZSMALLOC=3Dy
>> CONFIG_ZSMALLOC_STAT=3Dy
>> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
>> CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
>> CONFIG_IDLE_PAGE_TRACKING=3Dy
>> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
>> CONFIG_ZONE_DEVICE=3Dy
>> CONFIG_DEV_PAGEMAP_OPS=3Dy
>> CONFIG_HMM_MIRROR=3Dy
>> CONFIG_DEVICE_PRIVATE=3Dy
>> CONFIG_VMAP_PFN=3Dy
>> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
>> CONFIG_ARCH_HAS_PKEYS=3Dy
>> # CONFIG_PERCPU_STATS is not set
>> # CONFIG_GUP_TEST is not set
>> # CONFIG_READ_ONLY_THP_FOR_FS is not set
>> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
>> CONFIG_MAPPING_DIRTY_HELPERS=3Dy
>> # end of Memory Management options
>>
>> CONFIG_NET=3Dy
>> CONFIG_COMPAT_NETLINK_MESSAGES=3Dy
>> CONFIG_NET_INGRESS=3Dy
>> CONFIG_NET_EGRESS=3Dy
>> CONFIG_SKB_EXTENSIONS=3Dy
>>
>> #
>> # Networking options
>> #
>> CONFIG_PACKET=3Dy
>> CONFIG_PACKET_DIAG=3Dm
>> CONFIG_UNIX=3Dy
>> CONFIG_UNIX_SCM=3Dy
>> CONFIG_UNIX_DIAG=3Dm
>> CONFIG_TLS=3Dm
>> CONFIG_TLS_DEVICE=3Dy
>> # CONFIG_TLS_TOE is not set
>> CONFIG_XFRM=3Dy
>> CONFIG_XFRM_OFFLOAD=3Dy
>> CONFIG_XFRM_ALGO=3Dy
>> CONFIG_XFRM_USER=3Dy
>> # CONFIG_XFRM_USER_COMPAT is not set
>> # CONFIG_XFRM_INTERFACE is not set
>> CONFIG_XFRM_SUB_POLICY=3Dy
>> CONFIG_XFRM_MIGRATE=3Dy
>> CONFIG_XFRM_STATISTICS=3Dy
>> CONFIG_XFRM_AH=3Dm
>> CONFIG_XFRM_ESP=3Dm
>> CONFIG_XFRM_IPCOMP=3Dm
>> CONFIG_NET_KEY=3Dm
>> CONFIG_NET_KEY_MIGRATE=3Dy
>> # CONFIG_SMC is not set
>> CONFIG_XDP_SOCKETS=3Dy
>> # CONFIG_XDP_SOCKETS_DIAG is not set
>> CONFIG_INET=3Dy
>> CONFIG_IP_MULTICAST=3Dy
>> CONFIG_IP_ADVANCED_ROUTER=3Dy
>> CONFIG_IP_FIB_TRIE_STATS=3Dy
>> CONFIG_IP_MULTIPLE_TABLES=3Dy
>> CONFIG_IP_ROUTE_MULTIPATH=3Dy
>> CONFIG_IP_ROUTE_VERBOSE=3Dy
>> CONFIG_IP_ROUTE_CLASSID=3Dy
>> CONFIG_IP_PNP=3Dy
>> CONFIG_IP_PNP_DHCP=3Dy
>> # CONFIG_IP_PNP_BOOTP is not set
>> # CONFIG_IP_PNP_RARP is not set
>> CONFIG_NET_IPIP=3Dm
>> CONFIG_NET_IPGRE_DEMUX=3Dm
>> CONFIG_NET_IP_TUNNEL=3Dm
>> CONFIG_NET_IPGRE=3Dm
>> CONFIG_NET_IPGRE_BROADCAST=3Dy
>> CONFIG_IP_MROUTE_COMMON=3Dy
>> CONFIG_IP_MROUTE=3Dy
>> CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
>> CONFIG_IP_PIMSM_V1=3Dy
>> CONFIG_IP_PIMSM_V2=3Dy
>> CONFIG_SYN_COOKIES=3Dy
>> CONFIG_NET_IPVTI=3Dm
>> CONFIG_NET_UDP_TUNNEL=3Dm
>> # CONFIG_NET_FOU is not set
>> # CONFIG_NET_FOU_IP_TUNNELS is not set
>> CONFIG_INET_AH=3Dm
>> CONFIG_INET_ESP=3Dm
>> CONFIG_INET_ESP_OFFLOAD=3Dm
>> # CONFIG_INET_ESPINTCP is not set
>> CONFIG_INET_IPCOMP=3Dm
>> CONFIG_INET_XFRM_TUNNEL=3Dm
>> CONFIG_INET_TUNNEL=3Dm
>> CONFIG_INET_DIAG=3Dm
>> CONFIG_INET_TCP_DIAG=3Dm
>> CONFIG_INET_UDP_DIAG=3Dm
>> CONFIG_INET_RAW_DIAG=3Dm
>> # CONFIG_INET_DIAG_DESTROY is not set
>> CONFIG_TCP_CONG_ADVANCED=3Dy
>> CONFIG_TCP_CONG_BIC=3Dm
>> CONFIG_TCP_CONG_CUBIC=3Dy
>> CONFIG_TCP_CONG_WESTWOOD=3Dm
>> CONFIG_TCP_CONG_HTCP=3Dm
>> CONFIG_TCP_CONG_HSTCP=3Dm
>> CONFIG_TCP_CONG_HYBLA=3Dm
>> CONFIG_TCP_CONG_VEGAS=3Dm
>> CONFIG_TCP_CONG_NV=3Dm
>> CONFIG_TCP_CONG_SCALABLE=3Dm
>> CONFIG_TCP_CONG_LP=3Dm
>> CONFIG_TCP_CONG_VENO=3Dm
>> CONFIG_TCP_CONG_YEAH=3Dm
>> CONFIG_TCP_CONG_ILLINOIS=3Dm
>> CONFIG_TCP_CONG_DCTCP=3Dm
>> # CONFIG_TCP_CONG_CDG is not set
>> CONFIG_TCP_CONG_BBR=3Dm
>> CONFIG_DEFAULT_CUBIC=3Dy
>> # CONFIG_DEFAULT_RENO is not set
>> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
>> CONFIG_TCP_MD5SIG=3Dy
>> CONFIG_IPV6=3Dy
>> CONFIG_IPV6_ROUTER_PREF=3Dy
>> CONFIG_IPV6_ROUTE_INFO=3Dy
>> CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
>> CONFIG_INET6_AH=3Dm
>> CONFIG_INET6_ESP=3Dm
>> CONFIG_INET6_ESP_OFFLOAD=3Dm
>> # CONFIG_INET6_ESPINTCP is not set
>> CONFIG_INET6_IPCOMP=3Dm
>> CONFIG_IPV6_MIP6=3Dm
>> # CONFIG_IPV6_ILA is not set
>> CONFIG_INET6_XFRM_TUNNEL=3Dm
>> CONFIG_INET6_TUNNEL=3Dm
>> CONFIG_IPV6_VTI=3Dm
>> CONFIG_IPV6_SIT=3Dm
>> CONFIG_IPV6_SIT_6RD=3Dy
>> CONFIG_IPV6_NDISC_NODETYPE=3Dy
>> CONFIG_IPV6_TUNNEL=3Dm
>> CONFIG_IPV6_GRE=3Dm
>> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
>> # CONFIG_IPV6_SUBTREES is not set
>> CONFIG_IPV6_MROUTE=3Dy
>> CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
>> CONFIG_IPV6_PIMSM_V2=3Dy
>> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
>> # CONFIG_IPV6_SEG6_HMAC is not set
>> # CONFIG_IPV6_RPL_LWTUNNEL is not set
>> CONFIG_NETLABEL=3Dy
>> # CONFIG_MPTCP is not set
>> CONFIG_NETWORK_SECMARK=3Dy
>> CONFIG_NET_PTP_CLASSIFY=3Dy
>> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
>> CONFIG_NETFILTER=3Dy
>> CONFIG_NETFILTER_ADVANCED=3Dy
>> CONFIG_BRIDGE_NETFILTER=3Dm
>>
>> #
>> # Core Netfilter Configuration
>> #
>> CONFIG_NETFILTER_INGRESS=3Dy
>> CONFIG_NETFILTER_NETLINK=3Dm
>> CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
>> CONFIG_NETFILTER_FAMILY_ARP=3Dy
>> # CONFIG_NETFILTER_NETLINK_ACCT is not set
>> CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
>> CONFIG_NETFILTER_NETLINK_LOG=3Dm
>> CONFIG_NETFILTER_NETLINK_OSF=3Dm
>> CONFIG_NF_CONNTRACK=3Dm
>> CONFIG_NF_LOG_COMMON=3Dm
>> CONFIG_NF_LOG_NETDEV=3Dm
>> CONFIG_NETFILTER_CONNCOUNT=3Dm
>> CONFIG_NF_CONNTRACK_MARK=3Dy
>> CONFIG_NF_CONNTRACK_SECMARK=3Dy
>> CONFIG_NF_CONNTRACK_ZONES=3Dy
>> CONFIG_NF_CONNTRACK_PROCFS=3Dy
>> CONFIG_NF_CONNTRACK_EVENTS=3Dy
>> CONFIG_NF_CONNTRACK_TIMEOUT=3Dy
>> CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
>> CONFIG_NF_CONNTRACK_LABELS=3Dy
>> CONFIG_NF_CT_PROTO_DCCP=3Dy
>> CONFIG_NF_CT_PROTO_GRE=3Dy
>> CONFIG_NF_CT_PROTO_SCTP=3Dy
>> CONFIG_NF_CT_PROTO_UDPLITE=3Dy
>> CONFIG_NF_CONNTRACK_AMANDA=3Dm
>> CONFIG_NF_CONNTRACK_FTP=3Dm
>> CONFIG_NF_CONNTRACK_H323=3Dm
>> CONFIG_NF_CONNTRACK_IRC=3Dm
>> CONFIG_NF_CONNTRACK_BROADCAST=3Dm
>> CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
>> CONFIG_NF_CONNTRACK_SNMP=3Dm
>> CONFIG_NF_CONNTRACK_PPTP=3Dm
>> CONFIG_NF_CONNTRACK_SANE=3Dm
>> CONFIG_NF_CONNTRACK_SIP=3Dm
>> CONFIG_NF_CONNTRACK_TFTP=3Dm
>> CONFIG_NF_CT_NETLINK=3Dm
>> CONFIG_NF_CT_NETLINK_TIMEOUT=3Dm
>> CONFIG_NF_CT_NETLINK_HELPER=3Dm
>> CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
>> CONFIG_NF_NAT=3Dm
>> CONFIG_NF_NAT_AMANDA=3Dm
>> CONFIG_NF_NAT_FTP=3Dm
>> CONFIG_NF_NAT_IRC=3Dm
>> CONFIG_NF_NAT_SIP=3Dm
>> CONFIG_NF_NAT_TFTP=3Dm
>> CONFIG_NF_NAT_REDIRECT=3Dy
>> CONFIG_NF_NAT_MASQUERADE=3Dy
>> CONFIG_NETFILTER_SYNPROXY=3Dm
>> CONFIG_NF_TABLES=3Dm
>> CONFIG_NF_TABLES_INET=3Dy
>> CONFIG_NF_TABLES_NETDEV=3Dy
>> CONFIG_NFT_NUMGEN=3Dm
>> CONFIG_NFT_CT=3Dm
>> CONFIG_NFT_COUNTER=3Dm
>> CONFIG_NFT_CONNLIMIT=3Dm
>> CONFIG_NFT_LOG=3Dm
>> CONFIG_NFT_LIMIT=3Dm
>> CONFIG_NFT_MASQ=3Dm
>> CONFIG_NFT_REDIR=3Dm
>> CONFIG_NFT_NAT=3Dm
>> # CONFIG_NFT_TUNNEL is not set
>> CONFIG_NFT_OBJREF=3Dm
>> CONFIG_NFT_QUEUE=3Dm
>> CONFIG_NFT_QUOTA=3Dm
>> CONFIG_NFT_REJECT=3Dm
>> CONFIG_NFT_REJECT_INET=3Dm
>> CONFIG_NFT_COMPAT=3Dm
>> CONFIG_NFT_HASH=3Dm
>> CONFIG_NFT_FIB=3Dm
>> CONFIG_NFT_FIB_INET=3Dm
>> # CONFIG_NFT_XFRM is not set
>> CONFIG_NFT_SOCKET=3Dm
>> # CONFIG_NFT_OSF is not set
>> # CONFIG_NFT_TPROXY is not set
>> # CONFIG_NFT_SYNPROXY is not set
>> CONFIG_NF_DUP_NETDEV=3Dm
>> CONFIG_NFT_DUP_NETDEV=3Dm
>> CONFIG_NFT_FWD_NETDEV=3Dm
>> CONFIG_NFT_FIB_NETDEV=3Dm
>> # CONFIG_NFT_REJECT_NETDEV is not set
>> # CONFIG_NF_FLOW_TABLE is not set
>> CONFIG_NETFILTER_XTABLES=3Dy
>>
>> #
>> # Xtables combined modules
>> #
>> CONFIG_NETFILTER_XT_MARK=3Dm
>> CONFIG_NETFILTER_XT_CONNMARK=3Dm
>> CONFIG_NETFILTER_XT_SET=3Dm
>>
>> #
>> # Xtables targets
>> #
>> CONFIG_NETFILTER_XT_TARGET_AUDIT=3Dm
>> CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
>> CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
>> CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
>> CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
>> CONFIG_NETFILTER_XT_TARGET_CT=3Dm
>> CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
>> CONFIG_NETFILTER_XT_TARGET_HL=3Dm
>> CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
>> CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
>> # CONFIG_NETFILTER_XT_TARGET_LED is not set
>> CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
>> CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
>> CONFIG_NETFILTER_XT_NAT=3Dm
>> CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
>> CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
>> CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
>> CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
>> CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
>> CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
>> CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
>> CONFIG_NETFILTER_XT_TARGET_TEE=3Dm
>> CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
>> CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
>> CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
>> CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
>> CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm
>>
>> #
>> # Xtables matches
>> #
>> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
>> CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CGROUP=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
>> CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CONNLABEL=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
>> CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
>> CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
>> CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
>> CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
>> CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
>> CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
>> CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
>> CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
>> CONFIG_NETFILTER_XT_MATCH_HL=3Dm
>> # CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
>> CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
>> CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
>> # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
>> CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
>> CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
>> CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
>> CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
>> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
>> # CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
>> CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
>> CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
>> CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
>> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
>> CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
>> CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
>> CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
>> CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
>> CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
>> CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
>> CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
>> CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
>> CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
>> CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
>> CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
>> # CONFIG_NETFILTER_XT_MATCH_TIME is not set
>> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
>> # end of Core Netfilter Configuration
>>
>> CONFIG_IP_SET=3Dm
>> CONFIG_IP_SET_MAX=3D256
>> CONFIG_IP_SET_BITMAP_IP=3Dm
>> CONFIG_IP_SET_BITMAP_IPMAC=3Dm
>> CONFIG_IP_SET_BITMAP_PORT=3Dm
>> CONFIG_IP_SET_HASH_IP=3Dm
>> CONFIG_IP_SET_HASH_IPMARK=3Dm
>> CONFIG_IP_SET_HASH_IPPORT=3Dm
>> CONFIG_IP_SET_HASH_IPPORTIP=3Dm
>> CONFIG_IP_SET_HASH_IPPORTNET=3Dm
>> CONFIG_IP_SET_HASH_IPMAC=3Dm
>> CONFIG_IP_SET_HASH_MAC=3Dm
>> CONFIG_IP_SET_HASH_NETPORTNET=3Dm
>> CONFIG_IP_SET_HASH_NET=3Dm
>> CONFIG_IP_SET_HASH_NETNET=3Dm
>> CONFIG_IP_SET_HASH_NETPORT=3Dm
>> CONFIG_IP_SET_HASH_NETIFACE=3Dm
>> CONFIG_IP_SET_LIST_SET=3Dm
>> CONFIG_IP_VS=3Dm
>> CONFIG_IP_VS_IPV6=3Dy
>> # CONFIG_IP_VS_DEBUG is not set
>> CONFIG_IP_VS_TAB_BITS=3D12
>>
>> #
>> # IPVS transport protocol load balancing support
>> #
>> CONFIG_IP_VS_PROTO_TCP=3Dy
>> CONFIG_IP_VS_PROTO_UDP=3Dy
>> CONFIG_IP_VS_PROTO_AH_ESP=3Dy
>> CONFIG_IP_VS_PROTO_ESP=3Dy
>> CONFIG_IP_VS_PROTO_AH=3Dy
>> CONFIG_IP_VS_PROTO_SCTP=3Dy
>>
>> #
>> # IPVS scheduler
>> #
>> CONFIG_IP_VS_RR=3Dm
>> CONFIG_IP_VS_WRR=3Dm
>> CONFIG_IP_VS_LC=3Dm
>> CONFIG_IP_VS_WLC=3Dm
>> CONFIG_IP_VS_FO=3Dm
>> CONFIG_IP_VS_OVF=3Dm
>> CONFIG_IP_VS_LBLC=3Dm
>> CONFIG_IP_VS_LBLCR=3Dm
>> CONFIG_IP_VS_DH=3Dm
>> CONFIG_IP_VS_SH=3Dm
>> # CONFIG_IP_VS_MH is not set
>> CONFIG_IP_VS_SED=3Dm
>> CONFIG_IP_VS_NQ=3Dm
>> # CONFIG_IP_VS_TWOS is not set
>>
>> #
>> # IPVS SH scheduler
>> #
>> CONFIG_IP_VS_SH_TAB_BITS=3D8
>>
>> #
>> # IPVS MH scheduler
>> #
>> CONFIG_IP_VS_MH_TAB_INDEX=3D12
>>
>> #
>> # IPVS application helper
>> #
>> CONFIG_IP_VS_FTP=3Dm
>> CONFIG_IP_VS_NFCT=3Dy
>> CONFIG_IP_VS_PE_SIP=3Dm
>>
>> #
>> # IP: Netfilter Configuration
>> #
>> CONFIG_NF_DEFRAG_IPV4=3Dm
>> CONFIG_NF_SOCKET_IPV4=3Dm
>> CONFIG_NF_TPROXY_IPV4=3Dm
>> CONFIG_NF_TABLES_IPV4=3Dy
>> CONFIG_NFT_REJECT_IPV4=3Dm
>> CONFIG_NFT_DUP_IPV4=3Dm
>> CONFIG_NFT_FIB_IPV4=3Dm
>> CONFIG_NF_TABLES_ARP=3Dy
>> CONFIG_NF_DUP_IPV4=3Dm
>> CONFIG_NF_LOG_ARP=3Dm
>> CONFIG_NF_LOG_IPV4=3Dm
>> CONFIG_NF_REJECT_IPV4=3Dm
>> CONFIG_NF_NAT_SNMP_BASIC=3Dm
>> CONFIG_NF_NAT_PPTP=3Dm
>> CONFIG_NF_NAT_H323=3Dm
>> CONFIG_IP_NF_IPTABLES=3Dm
>> CONFIG_IP_NF_MATCH_AH=3Dm
>> CONFIG_IP_NF_MATCH_ECN=3Dm
>> CONFIG_IP_NF_MATCH_RPFILTER=3Dm
>> CONFIG_IP_NF_MATCH_TTL=3Dm
>> CONFIG_IP_NF_FILTER=3Dm
>> CONFIG_IP_NF_TARGET_REJECT=3Dm
>> CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
>> CONFIG_IP_NF_NAT=3Dm
>> CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
>> CONFIG_IP_NF_TARGET_NETMAP=3Dm
>> CONFIG_IP_NF_TARGET_REDIRECT=3Dm
>> CONFIG_IP_NF_MANGLE=3Dm
>> # CONFIG_IP_NF_TARGET_CLUSTERIP is not set
>> CONFIG_IP_NF_TARGET_ECN=3Dm
>> CONFIG_IP_NF_TARGET_TTL=3Dm
>> CONFIG_IP_NF_RAW=3Dm
>> CONFIG_IP_NF_SECURITY=3Dm
>> CONFIG_IP_NF_ARPTABLES=3Dm
>> CONFIG_IP_NF_ARPFILTER=3Dm
>> CONFIG_IP_NF_ARP_MANGLE=3Dm
>> # end of IP: Netfilter Configuration
>>
>> #
>> # IPv6: Netfilter Configuration
>> #
>> CONFIG_NF_SOCKET_IPV6=3Dm
>> CONFIG_NF_TPROXY_IPV6=3Dm
>> CONFIG_NF_TABLES_IPV6=3Dy
>> CONFIG_NFT_REJECT_IPV6=3Dm
>> CONFIG_NFT_DUP_IPV6=3Dm
>> CONFIG_NFT_FIB_IPV6=3Dm
>> CONFIG_NF_DUP_IPV6=3Dm
>> CONFIG_NF_REJECT_IPV6=3Dm
>> CONFIG_NF_LOG_IPV6=3Dm
>> CONFIG_IP6_NF_IPTABLES=3Dm
>> CONFIG_IP6_NF_MATCH_AH=3Dm
>> CONFIG_IP6_NF_MATCH_EUI64=3Dm
>> CONFIG_IP6_NF_MATCH_FRAG=3Dm
>> CONFIG_IP6_NF_MATCH_OPTS=3Dm
>> CONFIG_IP6_NF_MATCH_HL=3Dm
>> CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
>> CONFIG_IP6_NF_MATCH_MH=3Dm
>> CONFIG_IP6_NF_MATCH_RPFILTER=3Dm
>> CONFIG_IP6_NF_MATCH_RT=3Dm
>> # CONFIG_IP6_NF_MATCH_SRH is not set
>> # CONFIG_IP6_NF_TARGET_HL is not set
>> CONFIG_IP6_NF_FILTER=3Dm
>> CONFIG_IP6_NF_TARGET_REJECT=3Dm
>> CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
>> CONFIG_IP6_NF_MANGLE=3Dm
>> CONFIG_IP6_NF_RAW=3Dm
>> CONFIG_IP6_NF_SECURITY=3Dm
>> CONFIG_IP6_NF_NAT=3Dm
>> CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
>> CONFIG_IP6_NF_TARGET_NPT=3Dm
>> # end of IPv6: Netfilter Configuration
>>
>> CONFIG_NF_DEFRAG_IPV6=3Dm
>> CONFIG_NF_TABLES_BRIDGE=3Dm
>> # CONFIG_NFT_BRIDGE_META is not set
>> CONFIG_NFT_BRIDGE_REJECT=3Dm
>> CONFIG_NF_LOG_BRIDGE=3Dm
>> # CONFIG_NF_CONNTRACK_BRIDGE is not set
>> CONFIG_BRIDGE_NF_EBTABLES=3Dm
>> CONFIG_BRIDGE_EBT_BROUTE=3Dm
>> CONFIG_BRIDGE_EBT_T_FILTER=3Dm
>> CONFIG_BRIDGE_EBT_T_NAT=3Dm
>> CONFIG_BRIDGE_EBT_802_3=3Dm
>> CONFIG_BRIDGE_EBT_AMONG=3Dm
>> CONFIG_BRIDGE_EBT_ARP=3Dm
>> CONFIG_BRIDGE_EBT_IP=3Dm
>> CONFIG_BRIDGE_EBT_IP6=3Dm
>> CONFIG_BRIDGE_EBT_LIMIT=3Dm
>> CONFIG_BRIDGE_EBT_MARK=3Dm
>> CONFIG_BRIDGE_EBT_PKTTYPE=3Dm
>> CONFIG_BRIDGE_EBT_STP=3Dm
>> CONFIG_BRIDGE_EBT_VLAN=3Dm
>> CONFIG_BRIDGE_EBT_ARPREPLY=3Dm
>> CONFIG_BRIDGE_EBT_DNAT=3Dm
>> CONFIG_BRIDGE_EBT_MARK_T=3Dm
>> CONFIG_BRIDGE_EBT_REDIRECT=3Dm
>> CONFIG_BRIDGE_EBT_SNAT=3Dm
>> CONFIG_BRIDGE_EBT_LOG=3Dm
>> CONFIG_BRIDGE_EBT_NFLOG=3Dm
>> # CONFIG_BPFILTER is not set
>> # CONFIG_IP_DCCP is not set
>> CONFIG_IP_SCTP=3Dm
>> # CONFIG_SCTP_DBG_OBJCNT is not set
>> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
>> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
>> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
>> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
>> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
>> CONFIG_INET_SCTP_DIAG=3Dm
>> # CONFIG_RDS is not set
>> CONFIG_TIPC=3Dm
>> # CONFIG_TIPC_MEDIA_IB is not set
>> CONFIG_TIPC_MEDIA_UDP=3Dy
>> CONFIG_TIPC_CRYPTO=3Dy
>> CONFIG_TIPC_DIAG=3Dm
>> CONFIG_ATM=3Dm
>> CONFIG_ATM_CLIP=3Dm
>> # CONFIG_ATM_CLIP_NO_ICMP is not set
>> CONFIG_ATM_LANE=3Dm
>> # CONFIG_ATM_MPOA is not set
>> CONFIG_ATM_BR2684=3Dm
>> # CONFIG_ATM_BR2684_IPFILTER is not set
>> CONFIG_L2TP=3Dm
>> CONFIG_L2TP_DEBUGFS=3Dm
>> CONFIG_L2TP_V3=3Dy
>> CONFIG_L2TP_IP=3Dm
>> CONFIG_L2TP_ETH=3Dm
>> CONFIG_STP=3Dm
>> CONFIG_GARP=3Dm
>> CONFIG_MRP=3Dm
>> CONFIG_BRIDGE=3Dm
>> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
>> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
>> # CONFIG_BRIDGE_MRP is not set
>> # CONFIG_BRIDGE_CFM is not set
>> CONFIG_HAVE_NET_DSA=3Dy
>> # CONFIG_NET_DSA is not set
>> CONFIG_VLAN_8021Q=3Dm
>> CONFIG_VLAN_8021Q_GVRP=3Dy
>> CONFIG_VLAN_8021Q_MVRP=3Dy
>> # CONFIG_DECNET is not set
>> CONFIG_LLC=3Dm
>> # CONFIG_LLC2 is not set
>> # CONFIG_ATALK is not set
>> # CONFIG_X25 is not set
>> # CONFIG_LAPB is not set
>> # CONFIG_PHONET is not set
>> CONFIG_6LOWPAN=3Dm
>> # CONFIG_6LOWPAN_DEBUGFS is not set
>> # CONFIG_6LOWPAN_NHC is not set
>> CONFIG_IEEE802154=3Dm
>> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
>> CONFIG_IEEE802154_SOCKET=3Dm
>> CONFIG_IEEE802154_6LOWPAN=3Dm
>> CONFIG_MAC802154=3Dm
>> CONFIG_NET_SCHED=3Dy
>>
>> #
>> # Queueing/Scheduling
>> #
>> CONFIG_NET_SCH_CBQ=3Dm
>> CONFIG_NET_SCH_HTB=3Dm
>> CONFIG_NET_SCH_HFSC=3Dm
>> CONFIG_NET_SCH_ATM=3Dm
>> CONFIG_NET_SCH_PRIO=3Dm
>> CONFIG_NET_SCH_MULTIQ=3Dm
>> CONFIG_NET_SCH_RED=3Dm
>> CONFIG_NET_SCH_SFB=3Dm
>> CONFIG_NET_SCH_SFQ=3Dm
>> CONFIG_NET_SCH_TEQL=3Dm
>> CONFIG_NET_SCH_TBF=3Dm
>> # CONFIG_NET_SCH_CBS is not set
>> # CONFIG_NET_SCH_ETF is not set
>> # CONFIG_NET_SCH_TAPRIO is not set
>> CONFIG_NET_SCH_GRED=3Dm
>> CONFIG_NET_SCH_DSMARK=3Dm
>> CONFIG_NET_SCH_NETEM=3Dm
>> CONFIG_NET_SCH_DRR=3Dm
>> CONFIG_NET_SCH_MQPRIO=3Dm
>> # CONFIG_NET_SCH_SKBPRIO is not set
>> CONFIG_NET_SCH_CHOKE=3Dm
>> CONFIG_NET_SCH_QFQ=3Dm
>> CONFIG_NET_SCH_CODEL=3Dm
>> CONFIG_NET_SCH_FQ_CODEL=3Dy
>> # CONFIG_NET_SCH_CAKE is not set
>> CONFIG_NET_SCH_FQ=3Dm
>> CONFIG_NET_SCH_HHF=3Dm
>> CONFIG_NET_SCH_PIE=3Dm
>> # CONFIG_NET_SCH_FQ_PIE is not set
>> CONFIG_NET_SCH_INGRESS=3Dm
>> CONFIG_NET_SCH_PLUG=3Dm
>> # CONFIG_NET_SCH_ETS is not set
>> CONFIG_NET_SCH_DEFAULT=3Dy
>> # CONFIG_DEFAULT_FQ is not set
>> # CONFIG_DEFAULT_CODEL is not set
>> CONFIG_DEFAULT_FQ_CODEL=3Dy
>> # CONFIG_DEFAULT_SFQ is not set
>> # CONFIG_DEFAULT_PFIFO_FAST is not set
>> CONFIG_DEFAULT_NET_SCH=3D"fq_codel"
>>
>> #
>> # Classification
>> #
>> CONFIG_NET_CLS=3Dy
>> CONFIG_NET_CLS_BASIC=3Dm
>> CONFIG_NET_CLS_TCINDEX=3Dm
>> CONFIG_NET_CLS_ROUTE4=3Dm
>> CONFIG_NET_CLS_FW=3Dm
>> CONFIG_NET_CLS_U32=3Dm
>> CONFIG_CLS_U32_PERF=3Dy
>> CONFIG_CLS_U32_MARK=3Dy
>> CONFIG_NET_CLS_RSVP=3Dm
>> CONFIG_NET_CLS_RSVP6=3Dm
>> CONFIG_NET_CLS_FLOW=3Dm
>> CONFIG_NET_CLS_CGROUP=3Dy
>> CONFIG_NET_CLS_BPF=3Dm
>> CONFIG_NET_CLS_FLOWER=3Dm
>> CONFIG_NET_CLS_MATCHALL=3Dm
>> CONFIG_NET_EMATCH=3Dy
>> CONFIG_NET_EMATCH_STACK=3D32
>> CONFIG_NET_EMATCH_CMP=3Dm
>> CONFIG_NET_EMATCH_NBYTE=3Dm
>> CONFIG_NET_EMATCH_U32=3Dm
>> CONFIG_NET_EMATCH_META=3Dm
>> CONFIG_NET_EMATCH_TEXT=3Dm
>> # CONFIG_NET_EMATCH_CANID is not set
>> CONFIG_NET_EMATCH_IPSET=3Dm
>> # CONFIG_NET_EMATCH_IPT is not set
>> CONFIG_NET_CLS_ACT=3Dy
>> CONFIG_NET_ACT_POLICE=3Dm
>> CONFIG_NET_ACT_GACT=3Dm
>> CONFIG_GACT_PROB=3Dy
>> CONFIG_NET_ACT_MIRRED=3Dm
>> CONFIG_NET_ACT_SAMPLE=3Dm
>> # CONFIG_NET_ACT_IPT is not set
>> CONFIG_NET_ACT_NAT=3Dm
>> CONFIG_NET_ACT_PEDIT=3Dm
>> CONFIG_NET_ACT_SIMP=3Dm
>> CONFIG_NET_ACT_SKBEDIT=3Dm
>> CONFIG_NET_ACT_CSUM=3Dm
>> # CONFIG_NET_ACT_MPLS is not set
>> CONFIG_NET_ACT_VLAN=3Dm
>> CONFIG_NET_ACT_BPF=3Dm
>> # CONFIG_NET_ACT_CONNMARK is not set
>> # CONFIG_NET_ACT_CTINFO is not set
>> CONFIG_NET_ACT_SKBMOD=3Dm
>> # CONFIG_NET_ACT_IFE is not set
>> CONFIG_NET_ACT_TUNNEL_KEY=3Dm
>> # CONFIG_NET_ACT_GATE is not set
>> # CONFIG_NET_TC_SKB_EXT is not set
>> CONFIG_NET_SCH_FIFO=3Dy
>> CONFIG_DCB=3Dy
>> CONFIG_DNS_RESOLVER=3Dm
>> # CONFIG_BATMAN_ADV is not set
>> CONFIG_OPENVSWITCH=3Dm
>> CONFIG_OPENVSWITCH_GRE=3Dm
>> CONFIG_VSOCKETS=3Dm
>> CONFIG_VSOCKETS_DIAG=3Dm
>> CONFIG_VSOCKETS_LOOPBACK=3Dm
>> CONFIG_VMWARE_VMCI_VSOCKETS=3Dm
>> CONFIG_VIRTIO_VSOCKETS=3Dm
>> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
>> CONFIG_HYPERV_VSOCKETS=3Dm
>> CONFIG_NETLINK_DIAG=3Dm
>> CONFIG_MPLS=3Dy
>> CONFIG_NET_MPLS_GSO=3Dy
>> CONFIG_MPLS_ROUTING=3Dm
>> CONFIG_MPLS_IPTUNNEL=3Dm
>> CONFIG_NET_NSH=3Dy
>> # CONFIG_HSR is not set
>> CONFIG_NET_SWITCHDEV=3Dy
>> CONFIG_NET_L3_MASTER_DEV=3Dy
>> # CONFIG_QRTR is not set
>> # CONFIG_NET_NCSI is not set
>> CONFIG_RPS=3Dy
>> CONFIG_RFS_ACCEL=3Dy
>> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
>> CONFIG_XPS=3Dy
>> CONFIG_CGROUP_NET_PRIO=3Dy
>> CONFIG_CGROUP_NET_CLASSID=3Dy
>> CONFIG_NET_RX_BUSY_POLL=3Dy
>> CONFIG_BQL=3Dy
>> CONFIG_BPF_JIT=3Dy
>> CONFIG_BPF_STREAM_PARSER=3Dy
>> CONFIG_NET_FLOW_LIMIT=3Dy
>>
>> #
>> # Network testing
>> #
>> CONFIG_NET_PKTGEN=3Dm
>> CONFIG_NET_DROP_MONITOR=3Dy
>> # end of Network testing
>> # end of Networking options
>>
>> # CONFIG_HAMRADIO is not set
>> CONFIG_CAN=3Dm
>> CONFIG_CAN_RAW=3Dm
>> CONFIG_CAN_BCM=3Dm
>> CONFIG_CAN_GW=3Dm
>> # CONFIG_CAN_J1939 is not set
>> # CONFIG_CAN_ISOTP is not set
>>
>> #
>> # CAN Device Drivers
>> #
>> CONFIG_CAN_VCAN=3Dm
>> # CONFIG_CAN_VXCAN is not set
>> CONFIG_CAN_SLCAN=3Dm
>> CONFIG_CAN_DEV=3Dm
>> CONFIG_CAN_CALC_BITTIMING=3Dy
>> # CONFIG_CAN_KVASER_PCIEFD is not set
>> CONFIG_CAN_C_CAN=3Dm
>> CONFIG_CAN_C_CAN_PLATFORM=3Dm
>> CONFIG_CAN_C_CAN_PCI=3Dm
>> CONFIG_CAN_CC770=3Dm
>> # CONFIG_CAN_CC770_ISA is not set
>> CONFIG_CAN_CC770_PLATFORM=3Dm
>> # CONFIG_CAN_IFI_CANFD is not set
>> # CONFIG_CAN_M_CAN is not set
>> # CONFIG_CAN_PEAK_PCIEFD is not set
>> CONFIG_CAN_SJA1000=3Dm
>> CONFIG_CAN_EMS_PCI=3Dm
>> # CONFIG_CAN_F81601 is not set
>> CONFIG_CAN_KVASER_PCI=3Dm
>> CONFIG_CAN_PEAK_PCI=3Dm
>> CONFIG_CAN_PEAK_PCIEC=3Dy
>> CONFIG_CAN_PLX_PCI=3Dm
>> # CONFIG_CAN_SJA1000_ISA is not set
>> CONFIG_CAN_SJA1000_PLATFORM=3Dm
>> CONFIG_CAN_SOFTING=3Dm
>>
>> #
>> # CAN SPI interfaces
>> #
>> # CONFIG_CAN_HI311X is not set
>> # CONFIG_CAN_MCP251X is not set
>> # CONFIG_CAN_MCP251XFD is not set
>> # end of CAN SPI interfaces
>>
>> #
>> # CAN USB interfaces
>> #
>> # CONFIG_CAN_8DEV_USB is not set
>> # CONFIG_CAN_EMS_USB is not set
>> # CONFIG_CAN_ESD_USB2 is not set
>> # CONFIG_CAN_GS_USB is not set
>> # CONFIG_CAN_KVASER_USB is not set
>> # CONFIG_CAN_MCBA_USB is not set
>> # CONFIG_CAN_PEAK_USB is not set
>> # CONFIG_CAN_UCAN is not set
>> # end of CAN USB interfaces
>>
>> # CONFIG_CAN_DEBUG_DEVICES is not set
>> # end of CAN Device Drivers
>>
>> CONFIG_BT=3Dm
>> CONFIG_BT_BREDR=3Dy
>> CONFIG_BT_RFCOMM=3Dm
>> CONFIG_BT_RFCOMM_TTY=3Dy
>> CONFIG_BT_BNEP=3Dm
>> CONFIG_BT_BNEP_MC_FILTER=3Dy
>> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
>> CONFIG_BT_HIDP=3Dm
>> CONFIG_BT_HS=3Dy
>> CONFIG_BT_LE=3Dy
>> # CONFIG_BT_6LOWPAN is not set
>> # CONFIG_BT_LEDS is not set
>> # CONFIG_BT_MSFTEXT is not set
>> CONFIG_BT_DEBUGFS=3Dy
>> # CONFIG_BT_SELFTEST is not set
>>
>> #
>> # Bluetooth device drivers
>> #
>> # CONFIG_BT_HCIBTUSB is not set
>> # CONFIG_BT_HCIBTSDIO is not set
>> CONFIG_BT_HCIUART=3Dm
>> CONFIG_BT_HCIUART_H4=3Dy
>> CONFIG_BT_HCIUART_BCSP=3Dy
>> CONFIG_BT_HCIUART_ATH3K=3Dy
>> # CONFIG_BT_HCIUART_INTEL is not set
>> # CONFIG_BT_HCIUART_AG6XX is not set
>> # CONFIG_BT_HCIBCM203X is not set
>> # CONFIG_BT_HCIBPA10X is not set
>> # CONFIG_BT_HCIBFUSB is not set
>> CONFIG_BT_HCIVHCI=3Dm
>> CONFIG_BT_MRVL=3Dm
>> # CONFIG_BT_MRVL_SDIO is not set
>> # CONFIG_BT_MTKSDIO is not set
>> # end of Bluetooth device drivers
>>
>> # CONFIG_AF_RXRPC is not set
>> # CONFIG_AF_KCM is not set
>> CONFIG_STREAM_PARSER=3Dy
>> CONFIG_FIB_RULES=3Dy
>> CONFIG_WIRELESS=3Dy
>> CONFIG_WEXT_CORE=3Dy
>> CONFIG_WEXT_PROC=3Dy
>> CONFIG_CFG80211=3Dm
>> # CONFIG_NL80211_TESTMODE is not set
>> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
>> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
>> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
>> CONFIG_CFG80211_DEFAULT_PS=3Dy
>> # CONFIG_CFG80211_DEBUGFS is not set
>> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
>> CONFIG_CFG80211_WEXT=3Dy
>> CONFIG_MAC80211=3Dm
>> CONFIG_MAC80211_HAS_RC=3Dy
>> CONFIG_MAC80211_RC_MINSTREL=3Dy
>> CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
>> CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
>> CONFIG_MAC80211_MESH=3Dy
>> CONFIG_MAC80211_LEDS=3Dy
>> CONFIG_MAC80211_DEBUGFS=3Dy
>> # CONFIG_MAC80211_MESSAGE_TRACING is not set
>> # CONFIG_MAC80211_DEBUG_MENU is not set
>> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
>> CONFIG_RFKILL=3Dm
>> CONFIG_RFKILL_LEDS=3Dy
>> CONFIG_RFKILL_INPUT=3Dy
>> # CONFIG_RFKILL_GPIO is not set
>> CONFIG_NET_9P=3Dy
>> CONFIG_NET_9P_VIRTIO=3Dy
>> # CONFIG_NET_9P_XEN is not set
>> # CONFIG_NET_9P_RDMA is not set
>> # CONFIG_NET_9P_DEBUG is not set
>> # CONFIG_CAIF is not set
>> CONFIG_CEPH_LIB=3Dm
>> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
>> CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
>> # CONFIG_NFC is not set
>> CONFIG_PSAMPLE=3Dm
>> # CONFIG_NET_IFE is not set
>> CONFIG_LWTUNNEL=3Dy
>> CONFIG_LWTUNNEL_BPF=3Dy
>> CONFIG_DST_CACHE=3Dy
>> CONFIG_GRO_CELLS=3Dy
>> CONFIG_SOCK_VALIDATE_XMIT=3Dy
>> CONFIG_NET_SOCK_MSG=3Dy
>> CONFIG_NET_DEVLINK=3Dy
>> CONFIG_PAGE_POOL=3Dy
>> CONFIG_FAILOVER=3Dm
>> CONFIG_ETHTOOL_NETLINK=3Dy
>> CONFIG_HAVE_EBPF_JIT=3Dy
>>
>> #
>> # Device Drivers
>> #
>> CONFIG_HAVE_EISA=3Dy
>> # CONFIG_EISA is not set
>> CONFIG_HAVE_PCI=3Dy
>> CONFIG_PCI=3Dy
>> CONFIG_PCI_DOMAINS=3Dy
>> CONFIG_PCIEPORTBUS=3Dy
>> CONFIG_HOTPLUG_PCI_PCIE=3Dy
>> CONFIG_PCIEAER=3Dy
>> CONFIG_PCIEAER_INJECT=3Dm
>> CONFIG_PCIE_ECRC=3Dy
>> CONFIG_PCIEASPM=3Dy
>> CONFIG_PCIEASPM_DEFAULT=3Dy
>> # CONFIG_PCIEASPM_POWERSAVE is not set
>> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
>> # CONFIG_PCIEASPM_PERFORMANCE is not set
>> CONFIG_PCIE_PME=3Dy
>> CONFIG_PCIE_DPC=3Dy
>> # CONFIG_PCIE_PTM is not set
>> # CONFIG_PCIE_EDR is not set
>> CONFIG_PCI_MSI=3Dy
>> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
>> CONFIG_PCI_QUIRKS=3Dy
>> # CONFIG_PCI_DEBUG is not set
>> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
>> CONFIG_PCI_STUB=3Dy
>> CONFIG_PCI_PF_STUB=3Dm
>> # CONFIG_XEN_PCIDEV_FRONTEND is not set
>> CONFIG_PCI_ATS=3Dy
>> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
>> CONFIG_PCI_IOV=3Dy
>> CONFIG_PCI_PRI=3Dy
>> CONFIG_PCI_PASID=3Dy
>> # CONFIG_PCI_P2PDMA is not set
>> CONFIG_PCI_LABEL=3Dy
>> CONFIG_PCI_HYPERV=3Dm
>> CONFIG_HOTPLUG_PCI=3Dy
>> CONFIG_HOTPLUG_PCI_ACPI=3Dy
>> CONFIG_HOTPLUG_PCI_ACPI_IBM=3Dm
>> # CONFIG_HOTPLUG_PCI_CPCI is not set
>> CONFIG_HOTPLUG_PCI_SHPC=3Dy
>>
>> #
>> # PCI controller drivers
>> #
>> CONFIG_VMD=3Dy
>> CONFIG_PCI_HYPERV_INTERFACE=3Dm
>>
>> #
>> # DesignWare PCI Core Support
>> #
>> # CONFIG_PCIE_DW_PLAT_HOST is not set
>> # CONFIG_PCI_MESON is not set
>> # end of DesignWare PCI Core Support
>>
>> #
>> # Mobiveil PCIe Core Support
>> #
>> # end of Mobiveil PCIe Core Support
>>
>> #
>> # Cadence PCIe controllers support
>> #
>> # end of Cadence PCIe controllers support
>> # end of PCI controller drivers
>>
>> #
>> # PCI Endpoint
>> #
>> # CONFIG_PCI_ENDPOINT is not set
>> # end of PCI Endpoint
>>
>> #
>> # PCI switch controller drivers
>> #
>> # CONFIG_PCI_SW_SWITCHTEC is not set
>> # end of PCI switch controller drivers
>>
>> # CONFIG_CXL_BUS is not set
>> # CONFIG_PCCARD is not set
>> # CONFIG_RAPIDIO is not set
>>
>> #
>> # Generic Driver Options
>> #
>> # CONFIG_UEVENT_HELPER is not set
>> CONFIG_DEVTMPFS=3Dy
>> CONFIG_DEVTMPFS_MOUNT=3Dy
>> CONFIG_STANDALONE=3Dy
>> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
>>
>> #
>> # Firmware loader
>> #
>> CONFIG_FW_LOADER=3Dy
>> CONFIG_FW_LOADER_PAGED_BUF=3Dy
>> CONFIG_EXTRA_FIRMWARE=3D""
>> CONFIG_FW_LOADER_USER_HELPER=3Dy
>> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
>> # CONFIG_FW_LOADER_COMPRESS is not set
>> CONFIG_FW_CACHE=3Dy
>> # end of Firmware loader
>>
>> CONFIG_ALLOW_DEV_COREDUMP=3Dy
>> # CONFIG_DEBUG_DRIVER is not set
>> # CONFIG_DEBUG_DEVRES is not set
>> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
>> # CONFIG_PM_QOS_KUNIT_TEST is not set
>> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
>> CONFIG_KUNIT_DRIVER_PE_TEST=3Dy
>> CONFIG_SYS_HYPERVISOR=3Dy
>> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
>> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
>> CONFIG_REGMAP=3Dy
>> CONFIG_REGMAP_I2C=3Dm
>> CONFIG_REGMAP_SPI=3Dm
>> CONFIG_DMA_SHARED_BUFFER=3Dy
>> # CONFIG_DMA_FENCE_TRACE is not set
>> # end of Generic Driver Options
>>
>> #
>> # Bus devices
>> #
>> # CONFIG_MHI_BUS is not set
>> # end of Bus devices
>>
>> CONFIG_CONNECTOR=3Dy
>> CONFIG_PROC_EVENTS=3Dy
>> # CONFIG_GNSS is not set
>> # CONFIG_MTD is not set
>> # CONFIG_OF is not set
>> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
>> CONFIG_PARPORT=3Dm
>> CONFIG_PARPORT_PC=3Dm
>> CONFIG_PARPORT_SERIAL=3Dm
>> # CONFIG_PARPORT_PC_FIFO is not set
>> # CONFIG_PARPORT_PC_SUPERIO is not set
>> # CONFIG_PARPORT_AX88796 is not set
>> CONFIG_PARPORT_1284=3Dy
>> CONFIG_PNP=3Dy
>> # CONFIG_PNP_DEBUG_MESSAGES is not set
>>
>> #
>> # Protocols
>> #
>> CONFIG_PNPACPI=3Dy
>> CONFIG_BLK_DEV=3Dy
>> CONFIG_BLK_DEV_NULL_BLK=3Dm
>> CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=3Dy
>> # CONFIG_BLK_DEV_FD is not set
>> CONFIG_CDROM=3Dm
>> # CONFIG_PARIDE is not set
>> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
>> # CONFIG_ZRAM is not set
>> # CONFIG_BLK_DEV_UMEM is not set
>> CONFIG_BLK_DEV_LOOP=3Dm
>> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
>> # CONFIG_BLK_DEV_CRYPTOLOOP is not set
>> # CONFIG_BLK_DEV_DRBD is not set
>> CONFIG_BLK_DEV_NBD=3Dm
>> # CONFIG_BLK_DEV_SX8 is not set
>> CONFIG_BLK_DEV_RAM=3Dm
>> CONFIG_BLK_DEV_RAM_COUNT=3D16
>> CONFIG_BLK_DEV_RAM_SIZE=3D16384
>> CONFIG_CDROM_PKTCDVD=3Dm
>> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
>> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
>> # CONFIG_ATA_OVER_ETH is not set
>> CONFIG_XEN_BLKDEV_FRONTEND=3Dm
>> CONFIG_VIRTIO_BLK=3Dm
>> CONFIG_BLK_DEV_RBD=3Dm
>> # CONFIG_BLK_DEV_RSXX is not set
>>
>> #
>> # NVME Support
>> #
>> CONFIG_NVME_CORE=3Dm
>> CONFIG_BLK_DEV_NVME=3Dm
>> CONFIG_NVME_MULTIPATH=3Dy
>> # CONFIG_NVME_HWMON is not set
>> CONFIG_NVME_FABRICS=3Dm
>> # CONFIG_NVME_RDMA is not set
>> CONFIG_NVME_FC=3Dm
>> # CONFIG_NVME_TCP is not set
>> CONFIG_NVME_TARGET=3Dm
>> # CONFIG_NVME_TARGET_PASSTHRU is not set
>> CONFIG_NVME_TARGET_LOOP=3Dm
>> # CONFIG_NVME_TARGET_RDMA is not set
>> CONFIG_NVME_TARGET_FC=3Dm
>> CONFIG_NVME_TARGET_FCLOOP=3Dm
>> # CONFIG_NVME_TARGET_TCP is not set
>> # end of NVME Support
>>
>> #
>> # Misc devices
>> #
>> CONFIG_SENSORS_LIS3LV02D=3Dm
>> # CONFIG_AD525X_DPOT is not set
>> # CONFIG_DUMMY_IRQ is not set
>> # CONFIG_IBM_ASM is not set
>> # CONFIG_PHANTOM is not set
>> CONFIG_TIFM_CORE=3Dm
>> CONFIG_TIFM_7XX1=3Dm
>> # CONFIG_ICS932S401 is not set
>> CONFIG_ENCLOSURE_SERVICES=3Dm
>> CONFIG_SGI_XP=3Dm
>> CONFIG_HP_ILO=3Dm
>> CONFIG_SGI_GRU=3Dm
>> # CONFIG_SGI_GRU_DEBUG is not set
>> CONFIG_APDS9802ALS=3Dm
>> CONFIG_ISL29003=3Dm
>> CONFIG_ISL29020=3Dm
>> CONFIG_SENSORS_TSL2550=3Dm
>> CONFIG_SENSORS_BH1770=3Dm
>> CONFIG_SENSORS_APDS990X=3Dm
>> # CONFIG_HMC6352 is not set
>> # CONFIG_DS1682 is not set
>> CONFIG_VMWARE_BALLOON=3Dm
>> # CONFIG_LATTICE_ECP3_CONFIG is not set
>> # CONFIG_SRAM is not set
>> # CONFIG_PCI_ENDPOINT_TEST is not set
>> # CONFIG_XILINX_SDFEC is not set
>> CONFIG_MISC_RTSX=3Dm
>> CONFIG_PVPANIC=3Dy
>> # CONFIG_C2PORT is not set
>>
>> #
>> # EEPROM support
>> #
>> # CONFIG_EEPROM_AT24 is not set
>> # CONFIG_EEPROM_AT25 is not set
>> CONFIG_EEPROM_LEGACY=3Dm
>> CONFIG_EEPROM_MAX6875=3Dm
>> CONFIG_EEPROM_93CX6=3Dm
>> # CONFIG_EEPROM_93XX46 is not set
>> # CONFIG_EEPROM_IDT_89HPESX is not set
>> # CONFIG_EEPROM_EE1004 is not set
>> # end of EEPROM support
>>
>> CONFIG_CB710_CORE=3Dm
>> # CONFIG_CB710_DEBUG is not set
>> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
>>
>> #
>> # Texas Instruments shared transport line discipline
>> #
>> # CONFIG_TI_ST is not set
>> # end of Texas Instruments shared transport line discipline
>>
>> CONFIG_SENSORS_LIS3_I2C=3Dm
>> CONFIG_ALTERA_STAPL=3Dm
>> CONFIG_INTEL_MEI=3Dm
>> CONFIG_INTEL_MEI_ME=3Dm
>> # CONFIG_INTEL_MEI_TXE is not set
>> # CONFIG_INTEL_MEI_HDCP is not set
>> CONFIG_VMWARE_VMCI=3Dm
>> # CONFIG_GENWQE is not set
>> # CONFIG_ECHO is not set
>> # CONFIG_BCM_VK is not set
>> # CONFIG_MISC_ALCOR_PCI is not set
>> CONFIG_MISC_RTSX_PCI=3Dm
>> # CONFIG_MISC_RTSX_USB is not set
>> # CONFIG_HABANA_AI is not set
>> # CONFIG_UACCE is not set
>> # end of Misc devices
>>
>> CONFIG_HAVE_IDE=3Dy
>> # CONFIG_IDE is not set
>>
>> #
>> # SCSI device support
>> #
>> CONFIG_SCSI_MOD=3Dy
>> CONFIG_RAID_ATTRS=3Dm
>> CONFIG_SCSI=3Dy
>> CONFIG_SCSI_DMA=3Dy
>> CONFIG_SCSI_NETLINK=3Dy
>> CONFIG_SCSI_PROC_FS=3Dy
>>
>> #
>> # SCSI support type (disk, tape, CD-ROM)
>> #
>> CONFIG_BLK_DEV_SD=3Dm
>> CONFIG_CHR_DEV_ST=3Dm
>> CONFIG_BLK_DEV_SR=3Dm
>> CONFIG_CHR_DEV_SG=3Dm
>> CONFIG_CHR_DEV_SCH=3Dm
>> CONFIG_SCSI_ENCLOSURE=3Dm
>> CONFIG_SCSI_CONSTANTS=3Dy
>> CONFIG_SCSI_LOGGING=3Dy
>> CONFIG_SCSI_SCAN_ASYNC=3Dy
>>
>> #
>> # SCSI Transports
>> #
>> CONFIG_SCSI_SPI_ATTRS=3Dm
>> CONFIG_SCSI_FC_ATTRS=3Dm
>> CONFIG_SCSI_ISCSI_ATTRS=3Dm
>> CONFIG_SCSI_SAS_ATTRS=3Dm
>> CONFIG_SCSI_SAS_LIBSAS=3Dm
>> CONFIG_SCSI_SAS_ATA=3Dy
>> CONFIG_SCSI_SAS_HOST_SMP=3Dy
>> CONFIG_SCSI_SRP_ATTRS=3Dm
>> # end of SCSI Transports
>>
>> CONFIG_SCSI_LOWLEVEL=3Dy
>> # CONFIG_ISCSI_TCP is not set
>> # CONFIG_ISCSI_BOOT_SYSFS is not set
>> # CONFIG_SCSI_CXGB3_ISCSI is not set
>> # CONFIG_SCSI_CXGB4_ISCSI is not set
>> # CONFIG_SCSI_BNX2_ISCSI is not set
>> # CONFIG_BE2ISCSI is not set
>> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
>> # CONFIG_SCSI_HPSA is not set
>> # CONFIG_SCSI_3W_9XXX is not set
>> # CONFIG_SCSI_3W_SAS is not set
>> # CONFIG_SCSI_ACARD is not set
>> # CONFIG_SCSI_AACRAID is not set
>> # CONFIG_SCSI_AIC7XXX is not set
>> # CONFIG_SCSI_AIC79XX is not set
>> # CONFIG_SCSI_AIC94XX is not set
>> # CONFIG_SCSI_MVSAS is not set
>> # CONFIG_SCSI_MVUMI is not set
>> # CONFIG_SCSI_DPT_I2O is not set
>> # CONFIG_SCSI_ADVANSYS is not set
>> # CONFIG_SCSI_ARCMSR is not set
>> # CONFIG_SCSI_ESAS2R is not set
>> # CONFIG_MEGARAID_NEWGEN is not set
>> # CONFIG_MEGARAID_LEGACY is not set
>> # CONFIG_MEGARAID_SAS is not set
>> CONFIG_SCSI_MPT3SAS=3Dm
>> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
>> CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
>> # CONFIG_SCSI_MPT2SAS is not set
>> # CONFIG_SCSI_SMARTPQI is not set
>> # CONFIG_SCSI_UFSHCD is not set
>> # CONFIG_SCSI_HPTIOP is not set
>> # CONFIG_SCSI_BUSLOGIC is not set
>> # CONFIG_SCSI_MYRB is not set
>> # CONFIG_SCSI_MYRS is not set
>> # CONFIG_VMWARE_PVSCSI is not set
>> # CONFIG_XEN_SCSI_FRONTEND is not set
>> CONFIG_HYPERV_STORAGE=3Dm
>> # CONFIG_LIBFC is not set
>> # CONFIG_SCSI_SNIC is not set
>> # CONFIG_SCSI_DMX3191D is not set
>> # CONFIG_SCSI_FDOMAIN_PCI is not set
>> CONFIG_SCSI_ISCI=3Dm
>> # CONFIG_SCSI_IPS is not set
>> # CONFIG_SCSI_INITIO is not set
>> # CONFIG_SCSI_INIA100 is not set
>> # CONFIG_SCSI_PPA is not set
>> # CONFIG_SCSI_IMM is not set
>> # CONFIG_SCSI_STEX is not set
>> # CONFIG_SCSI_SYM53C8XX_2 is not set
>> # CONFIG_SCSI_IPR is not set
>> # CONFIG_SCSI_QLOGIC_1280 is not set
>> # CONFIG_SCSI_QLA_FC is not set
>> # CONFIG_SCSI_QLA_ISCSI is not set
>> # CONFIG_SCSI_LPFC is not set
>> # CONFIG_SCSI_DC395x is not set
>> # CONFIG_SCSI_AM53C974 is not set
>> # CONFIG_SCSI_WD719X is not set
>> CONFIG_SCSI_DEBUG=3Dm
>> # CONFIG_SCSI_PMCRAID is not set
>> # CONFIG_SCSI_PM8001 is not set
>> # CONFIG_SCSI_BFA_FC is not set
>> # CONFIG_SCSI_VIRTIO is not set
>> # CONFIG_SCSI_CHELSIO_FCOE is not set
>> CONFIG_SCSI_DH=3Dy
>> CONFIG_SCSI_DH_RDAC=3Dy
>> CONFIG_SCSI_DH_HP_SW=3Dy
>> CONFIG_SCSI_DH_EMC=3Dy
>> CONFIG_SCSI_DH_ALUA=3Dy
>> # end of SCSI device support
>>
>> CONFIG_ATA=3Dm
>> CONFIG_SATA_HOST=3Dy
>> CONFIG_PATA_TIMINGS=3Dy
>> CONFIG_ATA_VERBOSE_ERROR=3Dy
>> CONFIG_ATA_FORCE=3Dy
>> CONFIG_ATA_ACPI=3Dy
>> # CONFIG_SATA_ZPODD is not set
>> CONFIG_SATA_PMP=3Dy
>>
>> #
>> # Controllers with non-SFF native interface
>> #
>> CONFIG_SATA_AHCI=3Dm
>> CONFIG_SATA_MOBILE_LPM_POLICY=3D0
>> CONFIG_SATA_AHCI_PLATFORM=3Dm
>> # CONFIG_SATA_INIC162X is not set
>> # CONFIG_SATA_ACARD_AHCI is not set
>> # CONFIG_SATA_SIL24 is not set
>> CONFIG_ATA_SFF=3Dy
>>
>> #
>> # SFF controllers with custom DMA interface
>> #
>> # CONFIG_PDC_ADMA is not set
>> # CONFIG_SATA_QSTOR is not set
>> # CONFIG_SATA_SX4 is not set
>> CONFIG_ATA_BMDMA=3Dy
>>
>> #
>> # SATA SFF controllers with BMDMA
>> #
>> CONFIG_ATA_PIIX=3Dm
>> # CONFIG_SATA_DWC is not set
>> # CONFIG_SATA_MV is not set
>> # CONFIG_SATA_NV is not set
>> # CONFIG_SATA_PROMISE is not set
>> # CONFIG_SATA_SIL is not set
>> # CONFIG_SATA_SIS is not set
>> # CONFIG_SATA_SVW is not set
>> # CONFIG_SATA_ULI is not set
>> # CONFIG_SATA_VIA is not set
>> # CONFIG_SATA_VITESSE is not set
>>
>> #
>> # PATA SFF controllers with BMDMA
>> #
>> # CONFIG_PATA_ALI is not set
>> # CONFIG_PATA_AMD is not set
>> # CONFIG_PATA_ARTOP is not set
>> # CONFIG_PATA_ATIIXP is not set
>> # CONFIG_PATA_ATP867X is not set
>> # CONFIG_PATA_CMD64X is not set
>> # CONFIG_PATA_CYPRESS is not set
>> # CONFIG_PATA_EFAR is not set
>> # CONFIG_PATA_HPT366 is not set
>> # CONFIG_PATA_HPT37X is not set
>> # CONFIG_PATA_HPT3X2N is not set
>> # CONFIG_PATA_HPT3X3 is not set
>> # CONFIG_PATA_IT8213 is not set
>> # CONFIG_PATA_IT821X is not set
>> # CONFIG_PATA_JMICRON is not set
>> # CONFIG_PATA_MARVELL is not set
>> # CONFIG_PATA_NETCELL is not set
>> # CONFIG_PATA_NINJA32 is not set
>> # CONFIG_PATA_NS87415 is not set
>> # CONFIG_PATA_OLDPIIX is not set
>> # CONFIG_PATA_OPTIDMA is not set
>> # CONFIG_PATA_PDC2027X is not set
>> # CONFIG_PATA_PDC_OLD is not set
>> # CONFIG_PATA_RADISYS is not set
>> # CONFIG_PATA_RDC is not set
>> # CONFIG_PATA_SCH is not set
>> # CONFIG_PATA_SERVERWORKS is not set
>> # CONFIG_PATA_SIL680 is not set
>> # CONFIG_PATA_SIS is not set
>> # CONFIG_PATA_TOSHIBA is not set
>> # CONFIG_PATA_TRIFLEX is not set
>> # CONFIG_PATA_VIA is not set
>> # CONFIG_PATA_WINBOND is not set
>>
>> #
>> # PIO-only SFF controllers
>> #
>> # CONFIG_PATA_CMD640_PCI is not set
>> # CONFIG_PATA_MPIIX is not set
>> # CONFIG_PATA_NS87410 is not set
>> # CONFIG_PATA_OPTI is not set
>> # CONFIG_PATA_RZ1000 is not set
>>
>> #
>> # Generic fallback / legacy drivers
>> #
>> # CONFIG_PATA_ACPI is not set
>> CONFIG_ATA_GENERIC=3Dm
>> # CONFIG_PATA_LEGACY is not set
>> CONFIG_MD=3Dy
>> CONFIG_BLK_DEV_MD=3Dy
>> CONFIG_MD_AUTODETECT=3Dy
>> CONFIG_MD_LINEAR=3Dm
>> CONFIG_MD_RAID0=3Dm
>> CONFIG_MD_RAID1=3Dm
>> CONFIG_MD_RAID10=3Dm
>> CONFIG_MD_RAID456=3Dm
>> CONFIG_MD_MULTIPATH=3Dm
>> CONFIG_MD_FAULTY=3Dm
>> CONFIG_MD_CLUSTER=3Dm
>> # CONFIG_BCACHE is not set
>> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
>> CONFIG_BLK_DEV_DM=3Dm
>> CONFIG_DM_DEBUG=3Dy
>> CONFIG_DM_BUFIO=3Dm
>> # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
>> CONFIG_DM_BIO_PRISON=3Dm
>> CONFIG_DM_PERSISTENT_DATA=3Dm
>> # CONFIG_DM_UNSTRIPED is not set
>> CONFIG_DM_CRYPT=3Dm
>> CONFIG_DM_SNAPSHOT=3Dm
>> CONFIG_DM_THIN_PROVISIONING=3Dm
>> CONFIG_DM_CACHE=3Dm
>> CONFIG_DM_CACHE_SMQ=3Dm
>> CONFIG_DM_WRITECACHE=3Dm
>> # CONFIG_DM_EBS is not set
>> CONFIG_DM_ERA=3Dm
>> # CONFIG_DM_CLONE is not set
>> CONFIG_DM_MIRROR=3Dm
>> CONFIG_DM_LOG_USERSPACE=3Dm
>> CONFIG_DM_RAID=3Dm
>> CONFIG_DM_ZERO=3Dm
>> CONFIG_DM_MULTIPATH=3Dm
>> CONFIG_DM_MULTIPATH_QL=3Dm
>> CONFIG_DM_MULTIPATH_ST=3Dm
>> # CONFIG_DM_MULTIPATH_HST is not set
>> # CONFIG_DM_MULTIPATH_IOA is not set
>> CONFIG_DM_DELAY=3Dm
>> # CONFIG_DM_DUST is not set
>> CONFIG_DM_UEVENT=3Dy
>> CONFIG_DM_FLAKEY=3Dm
>> CONFIG_DM_VERITY=3Dm
>> # CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
>> # CONFIG_DM_VERITY_FEC is not set
>> CONFIG_DM_SWITCH=3Dm
>> CONFIG_DM_LOG_WRITES=3Dm
>> CONFIG_DM_INTEGRITY=3Dm
>> # CONFIG_DM_ZONED is not set
>> CONFIG_TARGET_CORE=3Dm
>> CONFIG_TCM_IBLOCK=3Dm
>> CONFIG_TCM_FILEIO=3Dm
>> CONFIG_TCM_PSCSI=3Dm
>> CONFIG_TCM_USER2=3Dm
>> CONFIG_LOOPBACK_TARGET=3Dm
>> CONFIG_ISCSI_TARGET=3Dm
>> # CONFIG_SBP_TARGET is not set
>> # CONFIG_FUSION is not set
>>
>> #
>> # IEEE 1394 (FireWire) support
>> #
>> CONFIG_FIREWIRE=3Dm
>> CONFIG_FIREWIRE_OHCI=3Dm
>> CONFIG_FIREWIRE_SBP2=3Dm
>> CONFIG_FIREWIRE_NET=3Dm
>> # CONFIG_FIREWIRE_NOSY is not set
>> # end of IEEE 1394 (FireWire) support
>>
>> CONFIG_MACINTOSH_DRIVERS=3Dy
>> CONFIG_MAC_EMUMOUSEBTN=3Dy
>> CONFIG_NETDEVICES=3Dy
>> CONFIG_MII=3Dy
>> CONFIG_NET_CORE=3Dy
>> # CONFIG_BONDING is not set
>> # CONFIG_DUMMY is not set
>> # CONFIG_WIREGUARD is not set
>> # CONFIG_EQUALIZER is not set
>> # CONFIG_NET_FC is not set
>> # CONFIG_IFB is not set
>> # CONFIG_NET_TEAM is not set
>> # CONFIG_MACVLAN is not set
>> # CONFIG_IPVLAN is not set
>> # CONFIG_VXLAN is not set
>> # CONFIG_GENEVE is not set
>> # CONFIG_BAREUDP is not set
>> # CONFIG_GTP is not set
>> # CONFIG_MACSEC is not set
>> CONFIG_NETCONSOLE=3Dm
>> CONFIG_NETCONSOLE_DYNAMIC=3Dy
>> CONFIG_NETPOLL=3Dy
>> CONFIG_NET_POLL_CONTROLLER=3Dy
>> CONFIG_TUN=3Dm
>> # CONFIG_TUN_VNET_CROSS_LE is not set
>> CONFIG_VETH=3Dm
>> CONFIG_VIRTIO_NET=3Dm
>> # CONFIG_NLMON is not set
>> # CONFIG_NET_VRF is not set
>> # CONFIG_VSOCKMON is not set
>> # CONFIG_ARCNET is not set
>> CONFIG_ATM_DRIVERS=3Dy
>> # CONFIG_ATM_DUMMY is not set
>> # CONFIG_ATM_TCP is not set
>> # CONFIG_ATM_LANAI is not set
>> # CONFIG_ATM_ENI is not set
>> # CONFIG_ATM_FIRESTREAM is not set
>> # CONFIG_ATM_ZATM is not set
>> # CONFIG_ATM_NICSTAR is not set
>> # CONFIG_ATM_IDT77252 is not set
>> # CONFIG_ATM_AMBASSADOR is not set
>> # CONFIG_ATM_HORIZON is not set
>> # CONFIG_ATM_IA is not set
>> # CONFIG_ATM_FORE200E is not set
>> # CONFIG_ATM_HE is not set
>> # CONFIG_ATM_SOLOS is not set
>>
>> #
>> # Distributed Switch Architecture drivers
>> #
>> # CONFIG_NET_DSA_MV88E6XXX_PTP is not set
>> # end of Distributed Switch Architecture drivers
>>
>> CONFIG_ETHERNET=3Dy
>> CONFIG_MDIO=3Dy
>> CONFIG_NET_VENDOR_3COM=3Dy
>> # CONFIG_VORTEX is not set
>> # CONFIG_TYPHOON is not set
>> CONFIG_NET_VENDOR_ADAPTEC=3Dy
>> # CONFIG_ADAPTEC_STARFIRE is not set
>> CONFIG_NET_VENDOR_AGERE=3Dy
>> # CONFIG_ET131X is not set
>> CONFIG_NET_VENDOR_ALACRITECH=3Dy
>> # CONFIG_SLICOSS is not set
>> CONFIG_NET_VENDOR_ALTEON=3Dy
>> # CONFIG_ACENIC is not set
>> # CONFIG_ALTERA_TSE is not set
>> CONFIG_NET_VENDOR_AMAZON=3Dy
>> # CONFIG_ENA_ETHERNET is not set
>> CONFIG_NET_VENDOR_AMD=3Dy
>> # CONFIG_AMD8111_ETH is not set
>> # CONFIG_PCNET32 is not set
>> # CONFIG_AMD_XGBE is not set
>> CONFIG_NET_VENDOR_AQUANTIA=3Dy
>> # CONFIG_AQTION is not set
>> CONFIG_NET_VENDOR_ARC=3Dy
>> CONFIG_NET_VENDOR_ATHEROS=3Dy
>> # CONFIG_ATL2 is not set
>> # CONFIG_ATL1 is not set
>> # CONFIG_ATL1E is not set
>> # CONFIG_ATL1C is not set
>> # CONFIG_ALX is not set
>> CONFIG_NET_VENDOR_BROADCOM=3Dy
>> # CONFIG_B44 is not set
>> # CONFIG_BCMGENET is not set
>> # CONFIG_BNX2 is not set
>> # CONFIG_CNIC is not set
>> # CONFIG_TIGON3 is not set
>> # CONFIG_BNX2X is not set
>> # CONFIG_SYSTEMPORT is not set
>> # CONFIG_BNXT is not set
>> CONFIG_NET_VENDOR_BROCADE=3Dy
>> # CONFIG_BNA is not set
>> CONFIG_NET_VENDOR_CADENCE=3Dy
>> # CONFIG_MACB is not set
>> CONFIG_NET_VENDOR_CAVIUM=3Dy
>> # CONFIG_THUNDER_NIC_PF is not set
>> # CONFIG_THUNDER_NIC_VF is not set
>> # CONFIG_THUNDER_NIC_BGX is not set
>> # CONFIG_THUNDER_NIC_RGX is not set
>> CONFIG_CAVIUM_PTP=3Dy
>> # CONFIG_LIQUIDIO is not set
>> # CONFIG_LIQUIDIO_VF is not set
>> CONFIG_NET_VENDOR_CHELSIO=3Dy
>> # CONFIG_CHELSIO_T1 is not set
>> # CONFIG_CHELSIO_T3 is not set
>> # CONFIG_CHELSIO_T4 is not set
>> # CONFIG_CHELSIO_T4VF is not set
>> CONFIG_NET_VENDOR_CISCO=3Dy
>> # CONFIG_ENIC is not set
>> CONFIG_NET_VENDOR_CORTINA=3Dy
>> # CONFIG_CX_ECAT is not set
>> # CONFIG_DNET is not set
>> CONFIG_NET_VENDOR_DEC=3Dy
>> # CONFIG_NET_TULIP is not set
>> CONFIG_NET_VENDOR_DLINK=3Dy
>> # CONFIG_DL2K is not set
>> # CONFIG_SUNDANCE is not set
>> CONFIG_NET_VENDOR_EMULEX=3Dy
>> # CONFIG_BE2NET is not set
>> CONFIG_NET_VENDOR_EZCHIP=3Dy
>> CONFIG_NET_VENDOR_GOOGLE=3Dy
>> # CONFIG_GVE is not set
>> CONFIG_NET_VENDOR_HUAWEI=3Dy
>> # CONFIG_HINIC is not set
>> CONFIG_NET_VENDOR_I825XX=3Dy
>> CONFIG_NET_VENDOR_INTEL=3Dy
>> # CONFIG_E100 is not set
>> CONFIG_E1000=3Dy
>> CONFIG_E1000E=3Dy
>> CONFIG_E1000E_HWTS=3Dy
>> CONFIG_IGB=3Dy
>> CONFIG_IGB_HWMON=3Dy
>> # CONFIG_IGBVF is not set
>> # CONFIG_IXGB is not set
>> CONFIG_IXGBE=3Dy
>> CONFIG_IXGBE_HWMON=3Dy
>> # CONFIG_IXGBE_DCB is not set
>> CONFIG_IXGBE_IPSEC=3Dy
>> # CONFIG_IXGBEVF is not set
>> CONFIG_I40E=3Dy
>> # CONFIG_I40E_DCB is not set
>> # CONFIG_I40EVF is not set
>> # CONFIG_ICE is not set
>> # CONFIG_FM10K is not set
>> # CONFIG_IGC is not set
>> # CONFIG_JME is not set
>> CONFIG_NET_VENDOR_MARVELL=3Dy
>> # CONFIG_MVMDIO is not set
>> # CONFIG_SKGE is not set
>> # CONFIG_SKY2 is not set
>> # CONFIG_PRESTERA is not set
>> CONFIG_NET_VENDOR_MELLANOX=3Dy
>> # CONFIG_MLX4_EN is not set
>> # CONFIG_MLX5_CORE is not set
>> # CONFIG_MLXSW_CORE is not set
>> # CONFIG_MLXFW is not set
>> CONFIG_NET_VENDOR_MICREL=3Dy
>> # CONFIG_KS8842 is not set
>> # CONFIG_KS8851 is not set
>> # CONFIG_KS8851_MLL is not set
>> # CONFIG_KSZ884X_PCI is not set
>> CONFIG_NET_VENDOR_MICROCHIP=3Dy
>> # CONFIG_ENC28J60 is not set
>> # CONFIG_ENCX24J600 is not set
>> # CONFIG_LAN743X is not set
>> CONFIG_NET_VENDOR_MICROSEMI=3Dy
>> CONFIG_NET_VENDOR_MYRI=3Dy
>> # CONFIG_MYRI10GE is not set
>> # CONFIG_FEALNX is not set
>> CONFIG_NET_VENDOR_NATSEMI=3Dy
>> # CONFIG_NATSEMI is not set
>> # CONFIG_NS83820 is not set
>> CONFIG_NET_VENDOR_NETERION=3Dy
>> # CONFIG_S2IO is not set
>> # CONFIG_VXGE is not set
>> CONFIG_NET_VENDOR_NETRONOME=3Dy
>> # CONFIG_NFP is not set
>> CONFIG_NET_VENDOR_NI=3Dy
>> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
>> CONFIG_NET_VENDOR_8390=3Dy
>> # CONFIG_NE2K_PCI is not set
>> CONFIG_NET_VENDOR_NVIDIA=3Dy
>> # CONFIG_FORCEDETH is not set
>> CONFIG_NET_VENDOR_OKI=3Dy
>> # CONFIG_ETHOC is not set
>> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
>> # CONFIG_HAMACHI is not set
>> # CONFIG_YELLOWFIN is not set
>> CONFIG_NET_VENDOR_PENSANDO=3Dy
>> # CONFIG_IONIC is not set
>> CONFIG_NET_VENDOR_QLOGIC=3Dy
>> # CONFIG_QLA3XXX is not set
>> # CONFIG_QLCNIC is not set
>> # CONFIG_NETXEN_NIC is not set
>> # CONFIG_QED is not set
>> CONFIG_NET_VENDOR_QUALCOMM=3Dy
>> # CONFIG_QCOM_EMAC is not set
>> # CONFIG_RMNET is not set
>> CONFIG_NET_VENDOR_RDC=3Dy
>> # CONFIG_R6040 is not set
>> CONFIG_NET_VENDOR_REALTEK=3Dy
>> # CONFIG_ATP is not set
>> # CONFIG_8139CP is not set
>> # CONFIG_8139TOO is not set
>> CONFIG_R8169=3Dy
>> CONFIG_NET_VENDOR_RENESAS=3Dy
>> CONFIG_NET_VENDOR_ROCKER=3Dy
>> # CONFIG_ROCKER is not set
>> CONFIG_NET_VENDOR_SAMSUNG=3Dy
>> # CONFIG_SXGBE_ETH is not set
>> CONFIG_NET_VENDOR_SEEQ=3Dy
>> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
>> # CONFIG_SFC is not set
>> # CONFIG_SFC_FALCON is not set
>> CONFIG_NET_VENDOR_SILAN=3Dy
>> # CONFIG_SC92031 is not set
>> CONFIG_NET_VENDOR_SIS=3Dy
>> # CONFIG_SIS900 is not set
>> # CONFIG_SIS190 is not set
>> CONFIG_NET_VENDOR_SMSC=3Dy
>> # CONFIG_EPIC100 is not set
>> # CONFIG_SMSC911X is not set
>> # CONFIG_SMSC9420 is not set
>> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
>> CONFIG_NET_VENDOR_STMICRO=3Dy
>> # CONFIG_STMMAC_ETH is not set
>> CONFIG_NET_VENDOR_SUN=3Dy
>> # CONFIG_HAPPYMEAL is not set
>> # CONFIG_SUNGEM is not set
>> # CONFIG_CASSINI is not set
>> # CONFIG_NIU is not set
>> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
>> # CONFIG_DWC_XLGMAC is not set
>> CONFIG_NET_VENDOR_TEHUTI=3Dy
>> # CONFIG_TEHUTI is not set
>> CONFIG_NET_VENDOR_TI=3Dy
>> # CONFIG_TI_CPSW_PHY_SEL is not set
>> # CONFIG_TLAN is not set
>> CONFIG_NET_VENDOR_VIA=3Dy
>> # CONFIG_VIA_RHINE is not set
>> # CONFIG_VIA_VELOCITY is not set
>> CONFIG_NET_VENDOR_WIZNET=3Dy
>> # CONFIG_WIZNET_W5100 is not set
>> # CONFIG_WIZNET_W5300 is not set
>> CONFIG_NET_VENDOR_XILINX=3Dy
>> # CONFIG_XILINX_EMACLITE is not set
>> # CONFIG_XILINX_AXI_EMAC is not set
>> # CONFIG_XILINX_LL_TEMAC is not set
>> # CONFIG_FDDI is not set
>> # CONFIG_HIPPI is not set
>> # CONFIG_NET_SB1000 is not set
>> CONFIG_PHYLIB=3Dy
>> # CONFIG_LED_TRIGGER_PHY is not set
>> # CONFIG_FIXED_PHY is not set
>>
>> #
>> # MII PHY device drivers
>> #
>> # CONFIG_AMD_PHY is not set
>> # CONFIG_ADIN_PHY is not set
>> # CONFIG_AQUANTIA_PHY is not set
>> # CONFIG_AX88796B_PHY is not set
>> # CONFIG_BROADCOM_PHY is not set
>> # CONFIG_BCM54140_PHY is not set
>> # CONFIG_BCM7XXX_PHY is not set
>> # CONFIG_BCM84881_PHY is not set
>> # CONFIG_BCM87XX_PHY is not set
>> # CONFIG_CICADA_PHY is not set
>> # CONFIG_CORTINA_PHY is not set
>> # CONFIG_DAVICOM_PHY is not set
>> # CONFIG_ICPLUS_PHY is not set
>> # CONFIG_LXT_PHY is not set
>> # CONFIG_INTEL_XWAY_PHY is not set
>> # CONFIG_LSI_ET1011C_PHY is not set
>> # CONFIG_MARVELL_PHY is not set
>> # CONFIG_MARVELL_10G_PHY is not set
>> # CONFIG_MICREL_PHY is not set
>> # CONFIG_MICROCHIP_PHY is not set
>> # CONFIG_MICROCHIP_T1_PHY is not set
>> # CONFIG_MICROSEMI_PHY is not set
>> # CONFIG_NATIONAL_PHY is not set
>> # CONFIG_NXP_TJA11XX_PHY is not set
>> # CONFIG_QSEMI_PHY is not set
>> CONFIG_REALTEK_PHY=3Dy
>> # CONFIG_RENESAS_PHY is not set
>> # CONFIG_ROCKCHIP_PHY is not set
>> # CONFIG_SMSC_PHY is not set
>> # CONFIG_STE10XP is not set
>> # CONFIG_TERANETICS_PHY is not set
>> # CONFIG_DP83822_PHY is not set
>> # CONFIG_DP83TC811_PHY is not set
>> # CONFIG_DP83848_PHY is not set
>> # CONFIG_DP83867_PHY is not set
>> # CONFIG_DP83869_PHY is not set
>> # CONFIG_VITESSE_PHY is not set
>> # CONFIG_XILINX_GMII2RGMII is not set
>> # CONFIG_MICREL_KS8995MA is not set
>> CONFIG_MDIO_DEVICE=3Dy
>> CONFIG_MDIO_BUS=3Dy
>> CONFIG_MDIO_DEVRES=3Dy
>> # CONFIG_MDIO_BITBANG is not set
>> # CONFIG_MDIO_BCM_UNIMAC is not set
>> # CONFIG_MDIO_MVUSB is not set
>> # CONFIG_MDIO_MSCC_MIIM is not set
>> # CONFIG_MDIO_THUNDER is not set
>>
>> #
>> # MDIO Multiplexers
>> #
>>
>> #
>> # PCS device drivers
>> #
>> # CONFIG_PCS_XPCS is not set
>> # end of PCS device drivers
>>
>> # CONFIG_PLIP is not set
>> # CONFIG_PPP is not set
>> # CONFIG_SLIP is not set
>> CONFIG_USB_NET_DRIVERS=3Dy
>> # CONFIG_USB_CATC is not set
>> # CONFIG_USB_KAWETH is not set
>> # CONFIG_USB_PEGASUS is not set
>> # CONFIG_USB_RTL8150 is not set
>> CONFIG_USB_RTL8152=3Dy
>> # CONFIG_USB_LAN78XX is not set
>> CONFIG_USB_USBNET=3Dy
>> CONFIG_USB_NET_AX8817X=3Dy
>> CONFIG_USB_NET_AX88179_178A=3Dy
>> # CONFIG_USB_NET_CDCETHER is not set
>> # CONFIG_USB_NET_CDC_EEM is not set
>> # CONFIG_USB_NET_CDC_NCM is not set
>> # CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
>> # CONFIG_USB_NET_CDC_MBIM is not set
>> # CONFIG_USB_NET_DM9601 is not set
>> # CONFIG_USB_NET_SR9700 is not set
>> # CONFIG_USB_NET_SR9800 is not set
>> # CONFIG_USB_NET_SMSC75XX is not set
>> # CONFIG_USB_NET_SMSC95XX is not set
>> # CONFIG_USB_NET_GL620A is not set
>> # CONFIG_USB_NET_NET1080 is not set
>> # CONFIG_USB_NET_PLUSB is not set
>> # CONFIG_USB_NET_MCS7830 is not set
>> # CONFIG_USB_NET_RNDIS_HOST is not set
>> # CONFIG_USB_NET_CDC_SUBSET is not set
>> # CONFIG_USB_NET_ZAURUS is not set
>> # CONFIG_USB_NET_CX82310_ETH is not set
>> # CONFIG_USB_NET_KALMIA is not set
>> # CONFIG_USB_NET_QMI_WWAN is not set
>> # CONFIG_USB_HSO is not set
>> # CONFIG_USB_NET_INT51X1 is not set
>> # CONFIG_USB_IPHETH is not set
>> # CONFIG_USB_SIERRA_NET is not set
>> # CONFIG_USB_NET_CH9200 is not set
>> # CONFIG_USB_NET_AQC111 is not set
>> CONFIG_WLAN=3Dy
>> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
>> # CONFIG_ADM8211 is not set
>> CONFIG_WLAN_VENDOR_ATH=3Dy
>> # CONFIG_ATH_DEBUG is not set
>> # CONFIG_ATH5K is not set
>> # CONFIG_ATH5K_PCI is not set
>> # CONFIG_ATH9K is not set
>> # CONFIG_ATH9K_HTC is not set
>> # CONFIG_CARL9170 is not set
>> # CONFIG_ATH6KL is not set
>> # CONFIG_AR5523 is not set
>> # CONFIG_WIL6210 is not set
>> # CONFIG_ATH10K is not set
>> # CONFIG_WCN36XX is not set
>> # CONFIG_ATH11K is not set
>> CONFIG_WLAN_VENDOR_ATMEL=3Dy
>> # CONFIG_ATMEL is not set
>> # CONFIG_AT76C50X_USB is not set
>> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
>> # CONFIG_B43 is not set
>> # CONFIG_B43LEGACY is not set
>> # CONFIG_BRCMSMAC is not set
>> # CONFIG_BRCMFMAC is not set
>> CONFIG_WLAN_VENDOR_CISCO=3Dy
>> # CONFIG_AIRO is not set
>> CONFIG_WLAN_VENDOR_INTEL=3Dy
>> # CONFIG_IPW2100 is not set
>> # CONFIG_IPW2200 is not set
>> # CONFIG_IWL4965 is not set
>> # CONFIG_IWL3945 is not set
>> # CONFIG_IWLWIFI is not set
>> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
>> # CONFIG_HOSTAP is not set
>> # CONFIG_HERMES is not set
>> # CONFIG_P54_COMMON is not set
>> # CONFIG_PRISM54 is not set
>> CONFIG_WLAN_VENDOR_MARVELL=3Dy
>> # CONFIG_LIBERTAS is not set
>> # CONFIG_LIBERTAS_THINFIRM is not set
>> # CONFIG_MWIFIEX is not set
>> # CONFIG_MWL8K is not set
>> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
>> # CONFIG_MT7601U is not set
>> # CONFIG_MT76x0U is not set
>> # CONFIG_MT76x0E is not set
>> # CONFIG_MT76x2E is not set
>> # CONFIG_MT76x2U is not set
>> # CONFIG_MT7603E is not set
>> # CONFIG_MT7615E is not set
>> # CONFIG_MT7663U is not set
>> # CONFIG_MT7663S is not set
>> # CONFIG_MT7915E is not set
>> # CONFIG_MT7921E is not set
>> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
>> # CONFIG_WILC1000_SDIO is not set
>> # CONFIG_WILC1000_SPI is not set
>> CONFIG_WLAN_VENDOR_RALINK=3Dy
>> # CONFIG_RT2X00 is not set
>> CONFIG_WLAN_VENDOR_REALTEK=3Dy
>> # CONFIG_RTL8180 is not set
>> # CONFIG_RTL8187 is not set
>> CONFIG_RTL_CARDS=3Dm
>> # CONFIG_RTL8192CE is not set
>> # CONFIG_RTL8192SE is not set
>> # CONFIG_RTL8192DE is not set
>> # CONFIG_RTL8723AE is not set
>> # CONFIG_RTL8723BE is not set
>> # CONFIG_RTL8188EE is not set
>> # CONFIG_RTL8192EE is not set
>> # CONFIG_RTL8821AE is not set
>> # CONFIG_RTL8192CU is not set
>> # CONFIG_RTL8XXXU is not set
>> # CONFIG_RTW88 is not set
>> CONFIG_WLAN_VENDOR_RSI=3Dy
>> # CONFIG_RSI_91X is not set
>> CONFIG_WLAN_VENDOR_ST=3Dy
>> # CONFIG_CW1200 is not set
>> CONFIG_WLAN_VENDOR_TI=3Dy
>> # CONFIG_WL1251 is not set
>> # CONFIG_WL12XX is not set
>> # CONFIG_WL18XX is not set
>> # CONFIG_WLCORE is not set
>> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
>> # CONFIG_USB_ZD1201 is not set
>> # CONFIG_ZD1211RW is not set
>> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
>> # CONFIG_QTNFMAC_PCIE is not set
>> CONFIG_MAC80211_HWSIM=3Dm
>> # CONFIG_USB_NET_RNDIS_WLAN is not set
>> # CONFIG_VIRT_WIFI is not set
>> # CONFIG_WAN is not set
>> CONFIG_IEEE802154_DRIVERS=3Dm
>> # CONFIG_IEEE802154_FAKELB is not set
>> # CONFIG_IEEE802154_AT86RF230 is not set
>> # CONFIG_IEEE802154_MRF24J40 is not set
>> # CONFIG_IEEE802154_CC2520 is not set
>> # CONFIG_IEEE802154_ATUSB is not set
>> # CONFIG_IEEE802154_ADF7242 is not set
>> # CONFIG_IEEE802154_CA8210 is not set
>> # CONFIG_IEEE802154_MCR20A is not set
>> # CONFIG_IEEE802154_HWSIM is not set
>> CONFIG_XEN_NETDEV_FRONTEND=3Dy
>> # CONFIG_VMXNET3 is not set
>> # CONFIG_FUJITSU_ES is not set
>> # CONFIG_HYPERV_NET is not set
>> CONFIG_NETDEVSIM=3Dm
>> CONFIG_NET_FAILOVER=3Dm
>> # CONFIG_ISDN is not set
>> # CONFIG_NVM is not set
>>
>> #
>> # Input device support
>> #
>> CONFIG_INPUT=3Dy
>> CONFIG_INPUT_LEDS=3Dy
>> CONFIG_INPUT_FF_MEMLESS=3Dm
>> CONFIG_INPUT_SPARSEKMAP=3Dm
>> # CONFIG_INPUT_MATRIXKMAP is not set
>>
>> #
>> # Userland interfaces
>> #
>> CONFIG_INPUT_MOUSEDEV=3Dy
>> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
>> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
>> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
>> CONFIG_INPUT_JOYDEV=3Dm
>> CONFIG_INPUT_EVDEV=3Dy
>> # CONFIG_INPUT_EVBUG is not set
>>
>> #
>> # Input Device Drivers
>> #
>> CONFIG_INPUT_KEYBOARD=3Dy
>> # CONFIG_KEYBOARD_ADP5588 is not set
>> # CONFIG_KEYBOARD_ADP5589 is not set
>> # CONFIG_KEYBOARD_APPLESPI is not set
>> CONFIG_KEYBOARD_ATKBD=3Dy
>> # CONFIG_KEYBOARD_QT1050 is not set
>> # CONFIG_KEYBOARD_QT1070 is not set
>> # CONFIG_KEYBOARD_QT2160 is not set
>> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
>> # CONFIG_KEYBOARD_LKKBD is not set
>> # CONFIG_KEYBOARD_GPIO is not set
>> # CONFIG_KEYBOARD_GPIO_POLLED is not set
>> # CONFIG_KEYBOARD_TCA6416 is not set
>> # CONFIG_KEYBOARD_TCA8418 is not set
>> # CONFIG_KEYBOARD_MATRIX is not set
>> # CONFIG_KEYBOARD_LM8323 is not set
>> # CONFIG_KEYBOARD_LM8333 is not set
>> # CONFIG_KEYBOARD_MAX7359 is not set
>> # CONFIG_KEYBOARD_MCS is not set
>> # CONFIG_KEYBOARD_MPR121 is not set
>> # CONFIG_KEYBOARD_NEWTON is not set
>> # CONFIG_KEYBOARD_OPENCORES is not set
>> # CONFIG_KEYBOARD_SAMSUNG is not set
>> # CONFIG_KEYBOARD_STOWAWAY is not set
>> # CONFIG_KEYBOARD_SUNKBD is not set
>> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
>> # CONFIG_KEYBOARD_XTKBD is not set
>> CONFIG_INPUT_MOUSE=3Dy
>> CONFIG_MOUSE_PS2=3Dy
>> CONFIG_MOUSE_PS2_ALPS=3Dy
>> CONFIG_MOUSE_PS2_BYD=3Dy
>> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
>> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
>> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
>> CONFIG_MOUSE_PS2_CYPRESS=3Dy
>> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
>> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
>> CONFIG_MOUSE_PS2_ELANTECH=3Dy
>> CONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy
>> CONFIG_MOUSE_PS2_SENTELIC=3Dy
>> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
>> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
>> CONFIG_MOUSE_PS2_VMMOUSE=3Dy
>> CONFIG_MOUSE_PS2_SMBUS=3Dy
>> CONFIG_MOUSE_SERIAL=3Dm
>> # CONFIG_MOUSE_APPLETOUCH is not set
>> # CONFIG_MOUSE_BCM5974 is not set
>> CONFIG_MOUSE_CYAPA=3Dm
>> CONFIG_MOUSE_ELAN_I2C=3Dm
>> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
>> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
>> CONFIG_MOUSE_VSXXXAA=3Dm
>> # CONFIG_MOUSE_GPIO is not set
>> CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
>> # CONFIG_MOUSE_SYNAPTICS_USB is not set
>> # CONFIG_INPUT_JOYSTICK is not set
>> # CONFIG_INPUT_TABLET is not set
>> # CONFIG_INPUT_TOUCHSCREEN is not set
>> # CONFIG_INPUT_MISC is not set
>> CONFIG_RMI4_CORE=3Dm
>> CONFIG_RMI4_I2C=3Dm
>> CONFIG_RMI4_SPI=3Dm
>> CONFIG_RMI4_SMB=3Dm
>> CONFIG_RMI4_F03=3Dy
>> CONFIG_RMI4_F03_SERIO=3Dm
>> CONFIG_RMI4_2D_SENSOR=3Dy
>> CONFIG_RMI4_F11=3Dy
>> CONFIG_RMI4_F12=3Dy
>> CONFIG_RMI4_F30=3Dy
>> CONFIG_RMI4_F34=3Dy
>> # CONFIG_RMI4_F3A is not set
>> # CONFIG_RMI4_F54 is not set
>> CONFIG_RMI4_F55=3Dy
>>
>> #
>> # Hardware I/O ports
>> #
>> CONFIG_SERIO=3Dy
>> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
>> CONFIG_SERIO_I8042=3Dy
>> CONFIG_SERIO_SERPORT=3Dy
>> # CONFIG_SERIO_CT82C710 is not set
>> # CONFIG_SERIO_PARKBD is not set
>> # CONFIG_SERIO_PCIPS2 is not set
>> CONFIG_SERIO_LIBPS2=3Dy
>> CONFIG_SERIO_RAW=3Dm
>> CONFIG_SERIO_ALTERA_PS2=3Dm
>> # CONFIG_SERIO_PS2MULT is not set
>> CONFIG_SERIO_ARC_PS2=3Dm
>> CONFIG_HYPERV_KEYBOARD=3Dm
>> # CONFIG_SERIO_GPIO_PS2 is not set
>> # CONFIG_USERIO is not set
>> # CONFIG_GAMEPORT is not set
>> # end of Hardware I/O ports
>> # end of Input device support
>>
>> #
>> # Character devices
>> #
>> CONFIG_TTY=3Dy
>> CONFIG_VT=3Dy
>> CONFIG_CONSOLE_TRANSLATIONS=3Dy
>> CONFIG_VT_CONSOLE=3Dy
>> CONFIG_VT_CONSOLE_SLEEP=3Dy
>> CONFIG_HW_CONSOLE=3Dy
>> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
>> CONFIG_UNIX98_PTYS=3Dy
>> # CONFIG_LEGACY_PTYS is not set
>> CONFIG_LDISC_AUTOLOAD=3Dy
>>
>> #
>> # Serial drivers
>> #
>> CONFIG_SERIAL_EARLYCON=3Dy
>> CONFIG_SERIAL_8250=3Dy
>> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
>> CONFIG_SERIAL_8250_PNP=3Dy
>> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
>> # CONFIG_SERIAL_8250_FINTEK is not set
>> CONFIG_SERIAL_8250_CONSOLE=3Dy
>> CONFIG_SERIAL_8250_DMA=3Dy
>> CONFIG_SERIAL_8250_PCI=3Dy
>> CONFIG_SERIAL_8250_EXAR=3Dy
>> CONFIG_SERIAL_8250_NR_UARTS=3D64
>> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
>> CONFIG_SERIAL_8250_EXTENDED=3Dy
>> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
>> CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
>> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
>> CONFIG_SERIAL_8250_RSA=3Dy
>> CONFIG_SERIAL_8250_DWLIB=3Dy
>> CONFIG_SERIAL_8250_DW=3Dy
>> # CONFIG_SERIAL_8250_RT288X is not set
>> CONFIG_SERIAL_8250_LPSS=3Dy
>> CONFIG_SERIAL_8250_MID=3Dy
>>
>> #
>> # Non-8250 serial port support
>> #
>> # CONFIG_SERIAL_MAX3100 is not set
>> # CONFIG_SERIAL_MAX310X is not set
>> # CONFIG_SERIAL_UARTLITE is not set
>> CONFIG_SERIAL_CORE=3Dy
>> CONFIG_SERIAL_CORE_CONSOLE=3Dy
>> CONFIG_SERIAL_JSM=3Dm
>> # CONFIG_SERIAL_LANTIQ is not set
>> # CONFIG_SERIAL_SCCNXP is not set
>> # CONFIG_SERIAL_SC16IS7XX is not set
>> # CONFIG_SERIAL_BCM63XX is not set
>> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
>> # CONFIG_SERIAL_ALTERA_UART is not set
>> CONFIG_SERIAL_ARC=3Dm
>> CONFIG_SERIAL_ARC_NR_PORTS=3D1
>> # CONFIG_SERIAL_RP2 is not set
>> # CONFIG_SERIAL_FSL_LPUART is not set
>> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
>> # CONFIG_SERIAL_SPRD is not set
>> # end of Serial drivers
>>
>> CONFIG_SERIAL_MCTRL_GPIO=3Dy
>> CONFIG_SERIAL_NONSTANDARD=3Dy
>> # CONFIG_ROCKETPORT is not set
>> CONFIG_CYCLADES=3Dm
>> # CONFIG_CYZ_INTR is not set
>> # CONFIG_MOXA_INTELLIO is not set
>> # CONFIG_MOXA_SMARTIO is not set
>> CONFIG_SYNCLINK_GT=3Dm
>> # CONFIG_ISI is not set
>> CONFIG_N_HDLC=3Dm
>> CONFIG_N_GSM=3Dm
>> CONFIG_NOZOMI=3Dm
>> # CONFIG_NULL_TTY is not set
>> # CONFIG_TRACE_SINK is not set
>> CONFIG_HVC_DRIVER=3Dy
>> CONFIG_HVC_IRQ=3Dy
>> CONFIG_HVC_XEN=3Dy
>> CONFIG_HVC_XEN_FRONTEND=3Dy
>> # CONFIG_SERIAL_DEV_BUS is not set
>> CONFIG_PRINTER=3Dm
>> # CONFIG_LP_CONSOLE is not set
>> CONFIG_PPDEV=3Dm
>> CONFIG_VIRTIO_CONSOLE=3Dm
>> CONFIG_IPMI_HANDLER=3Dm
>> CONFIG_IPMI_DMI_DECODE=3Dy
>> CONFIG_IPMI_PLAT_DATA=3Dy
>> CONFIG_IPMI_PANIC_EVENT=3Dy
>> CONFIG_IPMI_PANIC_STRING=3Dy
>> CONFIG_IPMI_DEVICE_INTERFACE=3Dm
>> CONFIG_IPMI_SI=3Dm
>> CONFIG_IPMI_SSIF=3Dm
>> CONFIG_IPMI_WATCHDOG=3Dm
>> CONFIG_IPMI_POWEROFF=3Dm
>> CONFIG_HW_RANDOM=3Dy
>> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
>> CONFIG_HW_RANDOM_INTEL=3Dm
>> CONFIG_HW_RANDOM_AMD=3Dm
>> # CONFIG_HW_RANDOM_BA431 is not set
>> CONFIG_HW_RANDOM_VIA=3Dm
>> CONFIG_HW_RANDOM_VIRTIO=3Dy
>> # CONFIG_HW_RANDOM_XIPHERA is not set
>> # CONFIG_APPLICOM is not set
>> # CONFIG_MWAVE is not set
>> CONFIG_DEVMEM=3Dy
>> # CONFIG_DEVKMEM is not set
>> CONFIG_NVRAM=3Dy
>> CONFIG_RAW_DRIVER=3Dy
>> CONFIG_MAX_RAW_DEVS=3D8192
>> CONFIG_DEVPORT=3Dy
>> CONFIG_HPET=3Dy
>> CONFIG_HPET_MMAP=3Dy
>> # CONFIG_HPET_MMAP_DEFAULT is not set
>> CONFIG_HANGCHECK_TIMER=3Dm
>> CONFIG_UV_MMTIMER=3Dm
>> CONFIG_TCG_TPM=3Dy
>> CONFIG_HW_RANDOM_TPM=3Dy
>> CONFIG_TCG_TIS_CORE=3Dy
>> CONFIG_TCG_TIS=3Dy
>> # CONFIG_TCG_TIS_SPI is not set
>> # CONFIG_TCG_TIS_I2C_CR50 is not set
>> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
>> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
>> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
>> CONFIG_TCG_NSC=3Dm
>> CONFIG_TCG_ATMEL=3Dm
>> CONFIG_TCG_INFINEON=3Dm
>> # CONFIG_TCG_XEN is not set
>> CONFIG_TCG_CRB=3Dy
>> # CONFIG_TCG_VTPM_PROXY is not set
>> CONFIG_TCG_TIS_ST33ZP24=3Dm
>> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
>> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
>> CONFIG_TELCLOCK=3Dm
>> # CONFIG_XILLYBUS is not set
>> # end of Character devices
>>
>> # CONFIG_RANDOM_TRUST_CPU is not set
>> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
>>
>> #
>> # I2C support
>> #
>> CONFIG_I2C=3Dy
>> CONFIG_ACPI_I2C_OPREGION=3Dy
>> CONFIG_I2C_BOARDINFO=3Dy
>> CONFIG_I2C_COMPAT=3Dy
>> CONFIG_I2C_CHARDEV=3Dm
>> CONFIG_I2C_MUX=3Dm
>>
>> #
>> # Multiplexer I2C Chip support
>> #
>> # CONFIG_I2C_MUX_GPIO is not set
>> # CONFIG_I2C_MUX_LTC4306 is not set
>> # CONFIG_I2C_MUX_PCA9541 is not set
>> # CONFIG_I2C_MUX_PCA954x is not set
>> # CONFIG_I2C_MUX_REG is not set
>> CONFIG_I2C_MUX_MLXCPLD=3Dm
>> # end of Multiplexer I2C Chip support
>>
>> CONFIG_I2C_HELPER_AUTO=3Dy
>> CONFIG_I2C_SMBUS=3Dy
>> CONFIG_I2C_ALGOBIT=3Dy
>> CONFIG_I2C_ALGOPCA=3Dm
>>
>> #
>> # I2C Hardware Bus support
>> #
>>
>> #
>> # PC SMBus host controller drivers
>> #
>> # CONFIG_I2C_ALI1535 is not set
>> # CONFIG_I2C_ALI1563 is not set
>> # CONFIG_I2C_ALI15X3 is not set
>> CONFIG_I2C_AMD756=3Dm
>> CONFIG_I2C_AMD756_S4882=3Dm
>> CONFIG_I2C_AMD8111=3Dm
>> # CONFIG_I2C_AMD_MP2 is not set
>> CONFIG_I2C_I801=3Dy
>> CONFIG_I2C_ISCH=3Dm
>> CONFIG_I2C_ISMT=3Dm
>> CONFIG_I2C_PIIX4=3Dm
>> CONFIG_I2C_NFORCE2=3Dm
>> CONFIG_I2C_NFORCE2_S4985=3Dm
>> # CONFIG_I2C_NVIDIA_GPU is not set
>> # CONFIG_I2C_SIS5595 is not set
>> # CONFIG_I2C_SIS630 is not set
>> CONFIG_I2C_SIS96X=3Dm
>> CONFIG_I2C_VIA=3Dm
>> CONFIG_I2C_VIAPRO=3Dm
>>
>> #
>> # ACPI drivers
>> #
>> CONFIG_I2C_SCMI=3Dm
>>
>> #
>> # I2C system bus drivers (mostly embedded / system-on-chip)
>> #
>> # CONFIG_I2C_CBUS_GPIO is not set
>> CONFIG_I2C_DESIGNWARE_CORE=3Dm
>> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
>> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
>> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
>> # CONFIG_I2C_DESIGNWARE_PCI is not set
>> # CONFIG_I2C_EMEV2 is not set
>> # CONFIG_I2C_GPIO is not set
>> # CONFIG_I2C_OCORES is not set
>> CONFIG_I2C_PCA_PLATFORM=3Dm
>> CONFIG_I2C_SIMTEC=3Dm
>> # CONFIG_I2C_XILINX is not set
>>
>> #
>> # External I2C/SMBus adapter drivers
>> #
>> # CONFIG_I2C_DIOLAN_U2C is not set
>> CONFIG_I2C_PARPORT=3Dm
>> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
>> # CONFIG_I2C_TAOS_EVM is not set
>> # CONFIG_I2C_TINY_USB is not set
>>
>> #
>> # Other I2C/SMBus bus drivers
>> #
>> CONFIG_I2C_MLXCPLD=3Dm
>> # end of I2C Hardware Bus support
>>
>> CONFIG_I2C_STUB=3Dm
>> # CONFIG_I2C_SLAVE is not set
>> # CONFIG_I2C_DEBUG_CORE is not set
>> # CONFIG_I2C_DEBUG_ALGO is not set
>> # CONFIG_I2C_DEBUG_BUS is not set
>> # end of I2C support
>>
>> # CONFIG_I3C is not set
>> CONFIG_SPI=3Dy
>> # CONFIG_SPI_DEBUG is not set
>> CONFIG_SPI_MASTER=3Dy
>> # CONFIG_SPI_MEM is not set
>>
>> #
>> # SPI Master Controller Drivers
>> #
>> # CONFIG_SPI_ALTERA is not set
>> # CONFIG_SPI_AXI_SPI_ENGINE is not set
>> # CONFIG_SPI_BITBANG is not set
>> # CONFIG_SPI_BUTTERFLY is not set
>> # CONFIG_SPI_CADENCE is not set
>> # CONFIG_SPI_DESIGNWARE is not set
>> # CONFIG_SPI_NXP_FLEXSPI is not set
>> # CONFIG_SPI_GPIO is not set
>> # CONFIG_SPI_LM70_LLP is not set
>> # CONFIG_SPI_LANTIQ_SSC is not set
>> # CONFIG_SPI_OC_TINY is not set
>> # CONFIG_SPI_PXA2XX is not set
>> # CONFIG_SPI_ROCKCHIP is not set
>> # CONFIG_SPI_SC18IS602 is not set
>> # CONFIG_SPI_SIFIVE is not set
>> # CONFIG_SPI_MXIC is not set
>> # CONFIG_SPI_XCOMM is not set
>> # CONFIG_SPI_XILINX is not set
>> # CONFIG_SPI_ZYNQMP_GQSPI is not set
>> # CONFIG_SPI_AMD is not set
>>
>> #
>> # SPI Multiplexer support
>> #
>> # CONFIG_SPI_MUX is not set
>>
>> #
>> # SPI Protocol Masters
>> #
>> # CONFIG_SPI_SPIDEV is not set
>> # CONFIG_SPI_LOOPBACK_TEST is not set
>> # CONFIG_SPI_TLE62X0 is not set
>> # CONFIG_SPI_SLAVE is not set
>> CONFIG_SPI_DYNAMIC=3Dy
>> # CONFIG_SPMI is not set
>> # CONFIG_HSI is not set
>> CONFIG_PPS=3Dy
>> # CONFIG_PPS_DEBUG is not set
>>
>> #
>> # PPS clients support
>> #
>> # CONFIG_PPS_CLIENT_KTIMER is not set
>> CONFIG_PPS_CLIENT_LDISC=3Dm
>> CONFIG_PPS_CLIENT_PARPORT=3Dm
>> CONFIG_PPS_CLIENT_GPIO=3Dm
>>
>> #
>> # PPS generators support
>> #
>>
>> #
>> # PTP clock support
>> #
>> CONFIG_PTP_1588_CLOCK=3Dy
>> # CONFIG_DP83640_PHY is not set
>> # CONFIG_PTP_1588_CLOCK_INES is not set
>> CONFIG_PTP_1588_CLOCK_KVM=3Dm
>> # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
>> # CONFIG_PTP_1588_CLOCK_IDTCM is not set
>> # CONFIG_PTP_1588_CLOCK_VMW is not set
>> # CONFIG_PTP_1588_CLOCK_OCP is not set
>> # end of PTP clock support
>>
>> CONFIG_PINCTRL=3Dy
>> CONFIG_PINMUX=3Dy
>> CONFIG_PINCONF=3Dy
>> CONFIG_GENERIC_PINCONF=3Dy
>> # CONFIG_DEBUG_PINCTRL is not set
>> CONFIG_PINCTRL_AMD=3Dm
>> # CONFIG_PINCTRL_MCP23S08 is not set
>> # CONFIG_PINCTRL_SX150X is not set
>> CONFIG_PINCTRL_BAYTRAIL=3Dy
>> # CONFIG_PINCTRL_CHERRYVIEW is not set
>> # CONFIG_PINCTRL_LYNXPOINT is not set
>> CONFIG_PINCTRL_INTEL=3Dy
>> # CONFIG_PINCTRL_ALDERLAKE is not set
>> CONFIG_PINCTRL_BROXTON=3Dm
>> CONFIG_PINCTRL_CANNONLAKE=3Dm
>> CONFIG_PINCTRL_CEDARFORK=3Dm
>> CONFIG_PINCTRL_DENVERTON=3Dm
>> # CONFIG_PINCTRL_ELKHARTLAKE is not set
>> # CONFIG_PINCTRL_EMMITSBURG is not set
>> CONFIG_PINCTRL_GEMINILAKE=3Dm
>> # CONFIG_PINCTRL_ICELAKE is not set
>> # CONFIG_PINCTRL_JASPERLAKE is not set
>> # CONFIG_PINCTRL_LAKEFIELD is not set
>> CONFIG_PINCTRL_LEWISBURG=3Dm
>> CONFIG_PINCTRL_SUNRISEPOINT=3Dm
>> # CONFIG_PINCTRL_TIGERLAKE is not set
>>
>> #
>> # Renesas pinctrl drivers
>> #
>> # end of Renesas pinctrl drivers
>>
>> CONFIG_GPIOLIB=3Dy
>> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
>> CONFIG_GPIO_ACPI=3Dy
>> CONFIG_GPIOLIB_IRQCHIP=3Dy
>> # CONFIG_DEBUG_GPIO is not set
>> CONFIG_GPIO_CDEV=3Dy
>> CONFIG_GPIO_CDEV_V1=3Dy
>> CONFIG_GPIO_GENERIC=3Dm
>>
>> #
>> # Memory mapped GPIO drivers
>> #
>> CONFIG_GPIO_AMDPT=3Dm
>> # CONFIG_GPIO_DWAPB is not set
>> # CONFIG_GPIO_EXAR is not set
>> # CONFIG_GPIO_GENERIC_PLATFORM is not set
>> CONFIG_GPIO_ICH=3Dm
>> # CONFIG_GPIO_MB86S7X is not set
>> # CONFIG_GPIO_VX855 is not set
>> # CONFIG_GPIO_AMD_FCH is not set
>> # end of Memory mapped GPIO drivers
>>
>> #
>> # Port-mapped I/O GPIO drivers
>> #
>> # CONFIG_GPIO_F7188X is not set
>> # CONFIG_GPIO_IT87 is not set
>> # CONFIG_GPIO_SCH is not set
>> # CONFIG_GPIO_SCH311X is not set
>> # CONFIG_GPIO_WINBOND is not set
>> # CONFIG_GPIO_WS16C48 is not set
>> # end of Port-mapped I/O GPIO drivers
>>
>> #
>> # I2C GPIO expanders
>> #
>> # CONFIG_GPIO_ADP5588 is not set
>> # CONFIG_GPIO_MAX7300 is not set
>> # CONFIG_GPIO_MAX732X is not set
>> # CONFIG_GPIO_PCA953X is not set
>> # CONFIG_GPIO_PCA9570 is not set
>> # CONFIG_GPIO_PCF857X is not set
>> # CONFIG_GPIO_TPIC2810 is not set
>> # end of I2C GPIO expanders
>>
>> #
>> # MFD GPIO expanders
>> #
>> # end of MFD GPIO expanders
>>
>> #
>> # PCI GPIO expanders
>> #
>> # CONFIG_GPIO_AMD8111 is not set
>> # CONFIG_GPIO_BT8XX is not set
>> # CONFIG_GPIO_ML_IOH is not set
>> # CONFIG_GPIO_PCI_IDIO_16 is not set
>> # CONFIG_GPIO_PCIE_IDIO_24 is not set
>> # CONFIG_GPIO_RDC321X is not set
>> # end of PCI GPIO expanders
>>
>> #
>> # SPI GPIO expanders
>> #
>> # CONFIG_GPIO_MAX3191X is not set
>> # CONFIG_GPIO_MAX7301 is not set
>> # CONFIG_GPIO_MC33880 is not set
>> # CONFIG_GPIO_PISOSR is not set
>> # CONFIG_GPIO_XRA1403 is not set
>> # end of SPI GPIO expanders
>>
>> #
>> # USB GPIO expanders
>> #
>> # end of USB GPIO expanders
>>
>> #
>> # Virtual GPIO drivers
>> #
>> # CONFIG_GPIO_AGGREGATOR is not set
>> # CONFIG_GPIO_MOCKUP is not set
>> # end of Virtual GPIO drivers
>>
>> # CONFIG_W1 is not set
>> CONFIG_POWER_RESET=3Dy
>> # CONFIG_POWER_RESET_RESTART is not set
>> CONFIG_POWER_SUPPLY=3Dy
>> # CONFIG_POWER_SUPPLY_DEBUG is not set
>> CONFIG_POWER_SUPPLY_HWMON=3Dy
>> # CONFIG_PDA_POWER is not set
>> # CONFIG_TEST_POWER is not set
>> # CONFIG_CHARGER_ADP5061 is not set
>> # CONFIG_BATTERY_CW2015 is not set
>> # CONFIG_BATTERY_DS2780 is not set
>> # CONFIG_BATTERY_DS2781 is not set
>> # CONFIG_BATTERY_DS2782 is not set
>> # CONFIG_BATTERY_SBS is not set
>> # CONFIG_CHARGER_SBS is not set
>> # CONFIG_MANAGER_SBS is not set
>> # CONFIG_BATTERY_BQ27XXX is not set
>> # CONFIG_BATTERY_MAX17040 is not set
>> # CONFIG_BATTERY_MAX17042 is not set
>> # CONFIG_CHARGER_MAX8903 is not set
>> # CONFIG_CHARGER_LP8727 is not set
>> # CONFIG_CHARGER_GPIO is not set
>> # CONFIG_CHARGER_LT3651 is not set
>> # CONFIG_CHARGER_LTC4162L is not set
>> # CONFIG_CHARGER_BQ2415X is not set
>> # CONFIG_CHARGER_BQ24257 is not set
>> # CONFIG_CHARGER_BQ24735 is not set
>> # CONFIG_CHARGER_BQ2515X is not set
>> # CONFIG_CHARGER_BQ25890 is not set
>> # CONFIG_CHARGER_BQ25980 is not set
>> # CONFIG_CHARGER_BQ256XX is not set
>> CONFIG_CHARGER_SMB347=3Dm
>> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
>> # CONFIG_CHARGER_RT9455 is not set
>> # CONFIG_CHARGER_BD99954 is not set
>> CONFIG_HWMON=3Dy
>> CONFIG_HWMON_VID=3Dm
>> # CONFIG_HWMON_DEBUG_CHIP is not set
>>
>> #
>> # Native drivers
>> #
>> CONFIG_SENSORS_ABITUGURU=3Dm
>> CONFIG_SENSORS_ABITUGURU3=3Dm
>> # CONFIG_SENSORS_AD7314 is not set
>> CONFIG_SENSORS_AD7414=3Dm
>> CONFIG_SENSORS_AD7418=3Dm
>> CONFIG_SENSORS_ADM1021=3Dm
>> CONFIG_SENSORS_ADM1025=3Dm
>> CONFIG_SENSORS_ADM1026=3Dm
>> CONFIG_SENSORS_ADM1029=3Dm
>> CONFIG_SENSORS_ADM1031=3Dm
>> # CONFIG_SENSORS_ADM1177 is not set
>> CONFIG_SENSORS_ADM9240=3Dm
>> CONFIG_SENSORS_ADT7X10=3Dm
>> # CONFIG_SENSORS_ADT7310 is not set
>> CONFIG_SENSORS_ADT7410=3Dm
>> CONFIG_SENSORS_ADT7411=3Dm
>> CONFIG_SENSORS_ADT7462=3Dm
>> CONFIG_SENSORS_ADT7470=3Dm
>> CONFIG_SENSORS_ADT7475=3Dm
>> # CONFIG_SENSORS_AHT10 is not set
>> # CONFIG_SENSORS_AS370 is not set
>> CONFIG_SENSORS_ASC7621=3Dm
>> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
>> CONFIG_SENSORS_K8TEMP=3Dm
>> CONFIG_SENSORS_K10TEMP=3Dm
>> CONFIG_SENSORS_FAM15H_POWER=3Dm
>> # CONFIG_SENSORS_AMD_ENERGY is not set
>> CONFIG_SENSORS_APPLESMC=3Dm
>> CONFIG_SENSORS_ASB100=3Dm
>> # CONFIG_SENSORS_ASPEED is not set
>> CONFIG_SENSORS_ATXP1=3Dm
>> # CONFIG_SENSORS_CORSAIR_CPRO is not set
>> # CONFIG_SENSORS_CORSAIR_PSU is not set
>> # CONFIG_SENSORS_DRIVETEMP is not set
>> CONFIG_SENSORS_DS620=3Dm
>> CONFIG_SENSORS_DS1621=3Dm
>> CONFIG_SENSORS_DELL_SMM=3Dm
>> CONFIG_SENSORS_I5K_AMB=3Dm
>> CONFIG_SENSORS_F71805F=3Dm
>> CONFIG_SENSORS_F71882FG=3Dm
>> CONFIG_SENSORS_F75375S=3Dm
>> CONFIG_SENSORS_FSCHMD=3Dm
>> # CONFIG_SENSORS_FTSTEUTATES is not set
>> CONFIG_SENSORS_GL518SM=3Dm
>> CONFIG_SENSORS_GL520SM=3Dm
>> CONFIG_SENSORS_G760A=3Dm
>> # CONFIG_SENSORS_G762 is not set
>> # CONFIG_SENSORS_HIH6130 is not set
>> CONFIG_SENSORS_IBMAEM=3Dm
>> CONFIG_SENSORS_IBMPEX=3Dm
>> CONFIG_SENSORS_I5500=3Dm
>> CONFIG_SENSORS_CORETEMP=3Dm
>> CONFIG_SENSORS_IT87=3Dm
>> CONFIG_SENSORS_JC42=3Dm
>> # CONFIG_SENSORS_POWR1220 is not set
>> CONFIG_SENSORS_LINEAGE=3Dm
>> # CONFIG_SENSORS_LTC2945 is not set
>> # CONFIG_SENSORS_LTC2947_I2C is not set
>> # CONFIG_SENSORS_LTC2947_SPI is not set
>> # CONFIG_SENSORS_LTC2990 is not set
>> # CONFIG_SENSORS_LTC2992 is not set
>> CONFIG_SENSORS_LTC4151=3Dm
>> CONFIG_SENSORS_LTC4215=3Dm
>> # CONFIG_SENSORS_LTC4222 is not set
>> CONFIG_SENSORS_LTC4245=3Dm
>> # CONFIG_SENSORS_LTC4260 is not set
>> CONFIG_SENSORS_LTC4261=3Dm
>> # CONFIG_SENSORS_MAX1111 is not set
>> # CONFIG_SENSORS_MAX127 is not set
>> CONFIG_SENSORS_MAX16065=3Dm
>> CONFIG_SENSORS_MAX1619=3Dm
>> CONFIG_SENSORS_MAX1668=3Dm
>> CONFIG_SENSORS_MAX197=3Dm
>> # CONFIG_SENSORS_MAX31722 is not set
>> # CONFIG_SENSORS_MAX31730 is not set
>> # CONFIG_SENSORS_MAX6621 is not set
>> CONFIG_SENSORS_MAX6639=3Dm
>> CONFIG_SENSORS_MAX6642=3Dm
>> CONFIG_SENSORS_MAX6650=3Dm
>> CONFIG_SENSORS_MAX6697=3Dm
>> # CONFIG_SENSORS_MAX31790 is not set
>> CONFIG_SENSORS_MCP3021=3Dm
>> # CONFIG_SENSORS_MLXREG_FAN is not set
>> # CONFIG_SENSORS_TC654 is not set
>> # CONFIG_SENSORS_TPS23861 is not set
>> # CONFIG_SENSORS_MR75203 is not set
>> # CONFIG_SENSORS_ADCXX is not set
>> CONFIG_SENSORS_LM63=3Dm
>> # CONFIG_SENSORS_LM70 is not set
>> CONFIG_SENSORS_LM73=3Dm
>> CONFIG_SENSORS_LM75=3Dm
>> CONFIG_SENSORS_LM77=3Dm
>> CONFIG_SENSORS_LM78=3Dm
>> CONFIG_SENSORS_LM80=3Dm
>> CONFIG_SENSORS_LM83=3Dm
>> CONFIG_SENSORS_LM85=3Dm
>> CONFIG_SENSORS_LM87=3Dm
>> CONFIG_SENSORS_LM90=3Dm
>> CONFIG_SENSORS_LM92=3Dm
>> CONFIG_SENSORS_LM93=3Dm
>> CONFIG_SENSORS_LM95234=3Dm
>> CONFIG_SENSORS_LM95241=3Dm
>> CONFIG_SENSORS_LM95245=3Dm
>> CONFIG_SENSORS_PC87360=3Dm
>> CONFIG_SENSORS_PC87427=3Dm
>> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
>> # CONFIG_SENSORS_NCT6683 is not set
>> CONFIG_SENSORS_NCT6775=3Dm
>> # CONFIG_SENSORS_NCT7802 is not set
>> # CONFIG_SENSORS_NCT7904 is not set
>> # CONFIG_SENSORS_NPCM7XX is not set
>> CONFIG_SENSORS_PCF8591=3Dm
>> CONFIG_PMBUS=3Dm
>> CONFIG_SENSORS_PMBUS=3Dm
>> # CONFIG_SENSORS_ADM1266 is not set
>> CONFIG_SENSORS_ADM1275=3Dm
>> # CONFIG_SENSORS_BEL_PFE is not set
>> # CONFIG_SENSORS_IBM_CFFPS is not set
>> # CONFIG_SENSORS_INSPUR_IPSPS is not set
>> # CONFIG_SENSORS_IR35221 is not set
>> # CONFIG_SENSORS_IR38064 is not set
>> # CONFIG_SENSORS_IRPS5401 is not set
>> # CONFIG_SENSORS_ISL68137 is not set
>> CONFIG_SENSORS_LM25066=3Dm
>> CONFIG_SENSORS_LTC2978=3Dm
>> # CONFIG_SENSORS_LTC3815 is not set
>> CONFIG_SENSORS_MAX16064=3Dm
>> # CONFIG_SENSORS_MAX16601 is not set
>> # CONFIG_SENSORS_MAX20730 is not set
>> # CONFIG_SENSORS_MAX20751 is not set
>> # CONFIG_SENSORS_MAX31785 is not set
>> CONFIG_SENSORS_MAX34440=3Dm
>> CONFIG_SENSORS_MAX8688=3Dm
>> # CONFIG_SENSORS_MP2975 is not set
>> # CONFIG_SENSORS_PM6764TR is not set
>> # CONFIG_SENSORS_PXE1610 is not set
>> # CONFIG_SENSORS_Q54SJ108A2 is not set
>> # CONFIG_SENSORS_TPS40422 is not set
>> # CONFIG_SENSORS_TPS53679 is not set
>> CONFIG_SENSORS_UCD9000=3Dm
>> CONFIG_SENSORS_UCD9200=3Dm
>> # CONFIG_SENSORS_XDPE122 is not set
>> CONFIG_SENSORS_ZL6100=3Dm
>> # CONFIG_SENSORS_SBTSI is not set
>> CONFIG_SENSORS_SHT15=3Dm
>> CONFIG_SENSORS_SHT21=3Dm
>> # CONFIG_SENSORS_SHT3x is not set
>> # CONFIG_SENSORS_SHTC1 is not set
>> CONFIG_SENSORS_SIS5595=3Dm
>> CONFIG_SENSORS_DME1737=3Dm
>> CONFIG_SENSORS_EMC1403=3Dm
>> # CONFIG_SENSORS_EMC2103 is not set
>> CONFIG_SENSORS_EMC6W201=3Dm
>> CONFIG_SENSORS_SMSC47M1=3Dm
>> CONFIG_SENSORS_SMSC47M192=3Dm
>> CONFIG_SENSORS_SMSC47B397=3Dm
>> CONFIG_SENSORS_SCH56XX_COMMON=3Dm
>> CONFIG_SENSORS_SCH5627=3Dm
>> CONFIG_SENSORS_SCH5636=3Dm
>> # CONFIG_SENSORS_STTS751 is not set
>> # CONFIG_SENSORS_SMM665 is not set
>> # CONFIG_SENSORS_ADC128D818 is not set
>> CONFIG_SENSORS_ADS7828=3Dm
>> # CONFIG_SENSORS_ADS7871 is not set
>> CONFIG_SENSORS_AMC6821=3Dm
>> CONFIG_SENSORS_INA209=3Dm
>> CONFIG_SENSORS_INA2XX=3Dm
>> # CONFIG_SENSORS_INA3221 is not set
>> # CONFIG_SENSORS_TC74 is not set
>> CONFIG_SENSORS_THMC50=3Dm
>> CONFIG_SENSORS_TMP102=3Dm
>> # CONFIG_SENSORS_TMP103 is not set
>> # CONFIG_SENSORS_TMP108 is not set
>> CONFIG_SENSORS_TMP401=3Dm
>> CONFIG_SENSORS_TMP421=3Dm
>> # CONFIG_SENSORS_TMP513 is not set
>> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
>> CONFIG_SENSORS_VIA686A=3Dm
>> CONFIG_SENSORS_VT1211=3Dm
>> CONFIG_SENSORS_VT8231=3Dm
>> # CONFIG_SENSORS_W83773G is not set
>> CONFIG_SENSORS_W83781D=3Dm
>> CONFIG_SENSORS_W83791D=3Dm
>> CONFIG_SENSORS_W83792D=3Dm
>> CONFIG_SENSORS_W83793=3Dm
>> CONFIG_SENSORS_W83795=3Dm
>> # CONFIG_SENSORS_W83795_FANCTRL is not set
>> CONFIG_SENSORS_W83L785TS=3Dm
>> CONFIG_SENSORS_W83L786NG=3Dm
>> CONFIG_SENSORS_W83627HF=3Dm
>> CONFIG_SENSORS_W83627EHF=3Dm
>> # CONFIG_SENSORS_XGENE is not set
>>
>> #
>> # ACPI drivers
>> #
>> CONFIG_SENSORS_ACPI_POWER=3Dm
>> CONFIG_SENSORS_ATK0110=3Dm
>> CONFIG_THERMAL=3Dy
>> # CONFIG_THERMAL_NETLINK is not set
>> # CONFIG_THERMAL_STATISTICS is not set
>> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
>> CONFIG_THERMAL_HWMON=3Dy
>> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
>> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
>> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
>> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
>> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
>> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
>> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
>> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
>> # CONFIG_THERMAL_EMULATION is not set
>>
>> #
>> # Intel thermal drivers
>> #
>> CONFIG_INTEL_POWERCLAMP=3Dm
>> CONFIG_X86_THERMAL_VECTOR=3Dy
>> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
>> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dm
>> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
>>
>> #
>> # ACPI INT340X thermal drivers
>> #
>> CONFIG_INT340X_THERMAL=3Dm
>> CONFIG_ACPI_THERMAL_REL=3Dm
>> # CONFIG_INT3406_THERMAL is not set
>> CONFIG_PROC_THERMAL_MMIO_RAPL=3Dm
>> # end of ACPI INT340X thermal drivers
>>
>> CONFIG_INTEL_PCH_THERMAL=3Dm
>> # end of Intel thermal drivers
>>
>> CONFIG_WATCHDOG=3Dy
>> CONFIG_WATCHDOG_CORE=3Dy
>> # CONFIG_WATCHDOG_NOWAYOUT is not set
>> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
>> CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
>> CONFIG_WATCHDOG_SYSFS=3Dy
>>
>> #
>> # Watchdog Pretimeout Governors
>> #
>> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
>>
>> #
>> # Watchdog Device Drivers
>> #
>> CONFIG_SOFT_WATCHDOG=3Dm
>> CONFIG_WDAT_WDT=3Dm
>> # CONFIG_XILINX_WATCHDOG is not set
>> # CONFIG_ZIIRAVE_WATCHDOG is not set
>> # CONFIG_MLX_WDT is not set
>> # CONFIG_CADENCE_WATCHDOG is not set
>> # CONFIG_DW_WATCHDOG is not set
>> # CONFIG_MAX63XX_WATCHDOG is not set
>> # CONFIG_ACQUIRE_WDT is not set
>> # CONFIG_ADVANTECH_WDT is not set
>> CONFIG_ALIM1535_WDT=3Dm
>> CONFIG_ALIM7101_WDT=3Dm
>> # CONFIG_EBC_C384_WDT is not set
>> CONFIG_F71808E_WDT=3Dm
>> CONFIG_SP5100_TCO=3Dm
>> CONFIG_SBC_FITPC2_WATCHDOG=3Dm
>> # CONFIG_EUROTECH_WDT is not set
>> CONFIG_IB700_WDT=3Dm
>> CONFIG_IBMASR=3Dm
>> # CONFIG_WAFER_WDT is not set
>> CONFIG_I6300ESB_WDT=3Dy
>> CONFIG_IE6XX_WDT=3Dm
>> CONFIG_ITCO_WDT=3Dy
>> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
>> CONFIG_IT8712F_WDT=3Dm
>> CONFIG_IT87_WDT=3Dm
>> CONFIG_HP_WATCHDOG=3Dm
>> CONFIG_HPWDT_NMI_DECODING=3Dy
>> # CONFIG_SC1200_WDT is not set
>> # CONFIG_PC87413_WDT is not set
>> CONFIG_NV_TCO=3Dm
>> # CONFIG_60XX_WDT is not set
>> # CONFIG_CPU5_WDT is not set
>> CONFIG_SMSC_SCH311X_WDT=3Dm
>> # CONFIG_SMSC37B787_WDT is not set
>> # CONFIG_TQMX86_WDT is not set
>> CONFIG_VIA_WDT=3Dm
>> CONFIG_W83627HF_WDT=3Dm
>> CONFIG_W83877F_WDT=3Dm
>> CONFIG_W83977F_WDT=3Dm
>> CONFIG_MACHZ_WDT=3Dm
>> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
>> CONFIG_INTEL_MEI_WDT=3Dm
>> # CONFIG_NI903X_WDT is not set
>> # CONFIG_NIC7018_WDT is not set
>> # CONFIG_MEN_A21_WDT is not set
>> CONFIG_XEN_WDT=3Dm
>>
>> #
>> # PCI-based Watchdog Cards
>> #
>> CONFIG_PCIPCWATCHDOG=3Dm
>> CONFIG_WDTPCI=3Dm
>>
>> #
>> # USB-based Watchdog Cards
>> #
>> # CONFIG_USBPCWATCHDOG is not set
>> CONFIG_SSB_POSSIBLE=3Dy
>> # CONFIG_SSB is not set
>> CONFIG_BCMA_POSSIBLE=3Dy
>> CONFIG_BCMA=3Dm
>> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
>> CONFIG_BCMA_HOST_PCI=3Dy
>> # CONFIG_BCMA_HOST_SOC is not set
>> CONFIG_BCMA_DRIVER_PCI=3Dy
>> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
>> CONFIG_BCMA_DRIVER_GPIO=3Dy
>> # CONFIG_BCMA_DEBUG is not set
>>
>> #
>> # Multifunction device drivers
>> #
>> CONFIG_MFD_CORE=3Dy
>> # CONFIG_MFD_AS3711 is not set
>> # CONFIG_PMIC_ADP5520 is not set
>> # CONFIG_MFD_AAT2870_CORE is not set
>> # CONFIG_MFD_BCM590XX is not set
>> # CONFIG_MFD_BD9571MWV is not set
>> # CONFIG_MFD_AXP20X_I2C is not set
>> # CONFIG_MFD_MADERA is not set
>> # CONFIG_PMIC_DA903X is not set
>> # CONFIG_MFD_DA9052_SPI is not set
>> # CONFIG_MFD_DA9052_I2C is not set
>> # CONFIG_MFD_DA9055 is not set
>> # CONFIG_MFD_DA9062 is not set
>> # CONFIG_MFD_DA9063 is not set
>> # CONFIG_MFD_DA9150 is not set
>> # CONFIG_MFD_DLN2 is not set
>> # CONFIG_MFD_MC13XXX_SPI is not set
>> # CONFIG_MFD_MC13XXX_I2C is not set
>> # CONFIG_MFD_MP2629 is not set
>> # CONFIG_HTC_PASIC3 is not set
>> # CONFIG_HTC_I2CPLD is not set
>> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
>> CONFIG_LPC_ICH=3Dy
>> CONFIG_LPC_SCH=3Dm
>> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
>> CONFIG_MFD_INTEL_LPSS=3Dy
>> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
>> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
>> # CONFIG_MFD_INTEL_PMC_BXT is not set
>> # CONFIG_MFD_INTEL_PMT is not set
>> # CONFIG_MFD_IQS62X is not set
>> # CONFIG_MFD_JANZ_CMODIO is not set
>> # CONFIG_MFD_KEMPLD is not set
>> # CONFIG_MFD_88PM800 is not set
>> # CONFIG_MFD_88PM805 is not set
>> # CONFIG_MFD_88PM860X is not set
>> # CONFIG_MFD_MAX14577 is not set
>> # CONFIG_MFD_MAX77693 is not set
>> # CONFIG_MFD_MAX77843 is not set
>> # CONFIG_MFD_MAX8907 is not set
>> # CONFIG_MFD_MAX8925 is not set
>> # CONFIG_MFD_MAX8997 is not set
>> # CONFIG_MFD_MAX8998 is not set
>> # CONFIG_MFD_MT6360 is not set
>> # CONFIG_MFD_MT6397 is not set
>> # CONFIG_MFD_MENF21BMC is not set
>> # CONFIG_EZX_PCAP is not set
>> # CONFIG_MFD_VIPERBOARD is not set
>> # CONFIG_MFD_RETU is not set
>> # CONFIG_MFD_PCF50633 is not set
>> # CONFIG_MFD_RDC321X is not set
>> # CONFIG_MFD_RT5033 is not set
>> # CONFIG_MFD_RC5T583 is not set
>> # CONFIG_MFD_SEC_CORE is not set
>> # CONFIG_MFD_SI476X_CORE is not set
>> CONFIG_MFD_SM501=3Dm
>> CONFIG_MFD_SM501_GPIO=3Dy
>> # CONFIG_MFD_SKY81452 is not set
>> # CONFIG_ABX500_CORE is not set
>> # CONFIG_MFD_SYSCON is not set
>> # CONFIG_MFD_TI_AM335X_TSCADC is not set
>> # CONFIG_MFD_LP3943 is not set
>> # CONFIG_MFD_LP8788 is not set
>> # CONFIG_MFD_TI_LMU is not set
>> # CONFIG_MFD_PALMAS is not set
>> # CONFIG_TPS6105X is not set
>> # CONFIG_TPS65010 is not set
>> # CONFIG_TPS6507X is not set
>> # CONFIG_MFD_TPS65086 is not set
>> # CONFIG_MFD_TPS65090 is not set
>> # CONFIG_MFD_TI_LP873X is not set
>> # CONFIG_MFD_TPS6586X is not set
>> # CONFIG_MFD_TPS65910 is not set
>> # CONFIG_MFD_TPS65912_I2C is not set
>> # CONFIG_MFD_TPS65912_SPI is not set
>> # CONFIG_MFD_TPS80031 is not set
>> # CONFIG_TWL4030_CORE is not set
>> # CONFIG_TWL6040_CORE is not set
>> # CONFIG_MFD_WL1273_CORE is not set
>> # CONFIG_MFD_LM3533 is not set
>> # CONFIG_MFD_TQMX86 is not set
>> CONFIG_MFD_VX855=3Dm
>> # CONFIG_MFD_ARIZONA_I2C is not set
>> # CONFIG_MFD_ARIZONA_SPI is not set
>> # CONFIG_MFD_WM8400 is not set
>> # CONFIG_MFD_WM831X_I2C is not set
>> # CONFIG_MFD_WM831X_SPI is not set
>> # CONFIG_MFD_WM8350_I2C is not set
>> # CONFIG_MFD_WM8994 is not set
>> # CONFIG_MFD_INTEL_M10_BMC is not set
>> # end of Multifunction device drivers
>>
>> # CONFIG_REGULATOR is not set
>> CONFIG_RC_CORE=3Dm
>> CONFIG_RC_MAP=3Dm
>> CONFIG_LIRC=3Dy
>> CONFIG_RC_DECODERS=3Dy
>> CONFIG_IR_NEC_DECODER=3Dm
>> CONFIG_IR_RC5_DECODER=3Dm
>> CONFIG_IR_RC6_DECODER=3Dm
>> CONFIG_IR_JVC_DECODER=3Dm
>> CONFIG_IR_SONY_DECODER=3Dm
>> CONFIG_IR_SANYO_DECODER=3Dm
>> # CONFIG_IR_SHARP_DECODER is not set
>> CONFIG_IR_MCE_KBD_DECODER=3Dm
>> # CONFIG_IR_XMP_DECODER is not set
>> CONFIG_IR_IMON_DECODER=3Dm
>> # CONFIG_IR_RCMM_DECODER is not set
>> CONFIG_RC_DEVICES=3Dy
>> # CONFIG_RC_ATI_REMOTE is not set
>> CONFIG_IR_ENE=3Dm
>> # CONFIG_IR_IMON is not set
>> # CONFIG_IR_IMON_RAW is not set
>> # CONFIG_IR_MCEUSB is not set
>> CONFIG_IR_ITE_CIR=3Dm
>> CONFIG_IR_FINTEK=3Dm
>> CONFIG_IR_NUVOTON=3Dm
>> # CONFIG_IR_REDRAT3 is not set
>> # CONFIG_IR_STREAMZAP is not set
>> CONFIG_IR_WINBOND_CIR=3Dm
>> # CONFIG_IR_IGORPLUGUSB is not set
>> # CONFIG_IR_IGUANA is not set
>> # CONFIG_IR_TTUSBIR is not set
>> # CONFIG_RC_LOOPBACK is not set
>> CONFIG_IR_SERIAL=3Dm
>> CONFIG_IR_SERIAL_TRANSMITTER=3Dy
>> CONFIG_IR_SIR=3Dm
>> # CONFIG_RC_XBOX_DVD is not set
>> # CONFIG_IR_TOY is not set
>> CONFIG_MEDIA_CEC_SUPPORT=3Dy
>> # CONFIG_CEC_CH7322 is not set
>> # CONFIG_CEC_SECO is not set
>> # CONFIG_USB_PULSE8_CEC is not set
>> # CONFIG_USB_RAINSHADOW_CEC is not set
>> CONFIG_MEDIA_SUPPORT=3Dm
>> # CONFIG_MEDIA_SUPPORT_FILTER is not set
>> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
>>
>> #
>> # Media device types
>> #
>> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
>> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
>> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
>> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
>> CONFIG_MEDIA_SDR_SUPPORT=3Dy
>> CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
>> CONFIG_MEDIA_TEST_SUPPORT=3Dy
>> # end of Media device types
>>
>> #
>> # Media core support
>> #
>> CONFIG_VIDEO_DEV=3Dm
>> CONFIG_MEDIA_CONTROLLER=3Dy
>> CONFIG_DVB_CORE=3Dm
>> # end of Media core support
>>
>> #
>> # Video4Linux options
>> #
>> CONFIG_VIDEO_V4L2=3Dm
>> CONFIG_VIDEO_V4L2_I2C=3Dy
>> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
>> # CONFIG_VIDEO_ADV_DEBUG is not set
>> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
>> # end of Video4Linux options
>>
>> #
>> # Media controller options
>> #
>> # CONFIG_MEDIA_CONTROLLER_DVB is not set
>> # end of Media controller options
>>
>> #
>> # Digital TV options
>> #
>> # CONFIG_DVB_MMAP is not set
>> CONFIG_DVB_NET=3Dy
>> CONFIG_DVB_MAX_ADAPTERS=3D16
>> CONFIG_DVB_DYNAMIC_MINORS=3Dy
>> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
>> # CONFIG_DVB_ULE_DEBUG is not set
>> # end of Digital TV options
>>
>> #
>> # Media drivers
>> #
>> # CONFIG_MEDIA_USB_SUPPORT is not set
>> # CONFIG_MEDIA_PCI_SUPPORT is not set
>> CONFIG_RADIO_ADAPTERS=3Dy
>> # CONFIG_RADIO_SI470X is not set
>> # CONFIG_RADIO_SI4713 is not set
>> # CONFIG_USB_MR800 is not set
>> # CONFIG_USB_DSBR is not set
>> # CONFIG_RADIO_MAXIRADIO is not set
>> # CONFIG_RADIO_SHARK is not set
>> # CONFIG_RADIO_SHARK2 is not set
>> # CONFIG_USB_KEENE is not set
>> # CONFIG_USB_RAREMONO is not set
>> # CONFIG_USB_MA901 is not set
>> # CONFIG_RADIO_TEA5764 is not set
>> # CONFIG_RADIO_SAA7706H is not set
>> # CONFIG_RADIO_TEF6862 is not set
>> # CONFIG_RADIO_WL1273 is not set
>> CONFIG_VIDEOBUF2_CORE=3Dm
>> CONFIG_VIDEOBUF2_V4L2=3Dm
>> CONFIG_VIDEOBUF2_MEMOPS=3Dm
>> CONFIG_VIDEOBUF2_VMALLOC=3Dm
>> # CONFIG_V4L_PLATFORM_DRIVERS is not set
>> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
>> # CONFIG_DVB_PLATFORM_DRIVERS is not set
>> # CONFIG_SDR_PLATFORM_DRIVERS is not set
>>
>> #
>> # MMC/SDIO DVB adapters
>> #
>> # CONFIG_SMS_SDIO_DRV is not set
>> # CONFIG_V4L_TEST_DRIVERS is not set
>> # CONFIG_DVB_TEST_DRIVERS is not set
>>
>> #
>> # FireWire (IEEE 1394) Adapters
>> #
>> # CONFIG_DVB_FIREDTV is not set
>> # end of Media drivers
>>
>> #
>> # Media ancillary drivers
>> #
>> CONFIG_MEDIA_ATTACH=3Dy
>> CONFIG_VIDEO_IR_I2C=3Dm
>>
>> #
>> # Audio decoders, processors and mixers
>> #
>> # CONFIG_VIDEO_TVAUDIO is not set
>> # CONFIG_VIDEO_TDA7432 is not set
>> # CONFIG_VIDEO_TDA9840 is not set
>> # CONFIG_VIDEO_TEA6415C is not set
>> # CONFIG_VIDEO_TEA6420 is not set
>> # CONFIG_VIDEO_MSP3400 is not set
>> # CONFIG_VIDEO_CS3308 is not set
>> # CONFIG_VIDEO_CS5345 is not set
>> # CONFIG_VIDEO_CS53L32A is not set
>> # CONFIG_VIDEO_TLV320AIC23B is not set
>> # CONFIG_VIDEO_UDA1342 is not set
>> # CONFIG_VIDEO_WM8775 is not set
>> # CONFIG_VIDEO_WM8739 is not set
>> # CONFIG_VIDEO_VP27SMPX is not set
>> # CONFIG_VIDEO_SONY_BTF_MPX is not set
>> # end of Audio decoders, processors and mixers
>>
>> #
>> # RDS decoders
>> #
>> # CONFIG_VIDEO_SAA6588 is not set
>> # end of RDS decoders
>>
>> #
>> # Video decoders
>> #
>> # CONFIG_VIDEO_ADV7180 is not set
>> # CONFIG_VIDEO_ADV7183 is not set
>> # CONFIG_VIDEO_ADV7604 is not set
>> # CONFIG_VIDEO_ADV7842 is not set
>> # CONFIG_VIDEO_BT819 is not set
>> # CONFIG_VIDEO_BT856 is not set
>> # CONFIG_VIDEO_BT866 is not set
>> # CONFIG_VIDEO_KS0127 is not set
>> # CONFIG_VIDEO_ML86V7667 is not set
>> # CONFIG_VIDEO_SAA7110 is not set
>> # CONFIG_VIDEO_SAA711X is not set
>> # CONFIG_VIDEO_TC358743 is not set
>> # CONFIG_VIDEO_TVP514X is not set
>> # CONFIG_VIDEO_TVP5150 is not set
>> # CONFIG_VIDEO_TVP7002 is not set
>> # CONFIG_VIDEO_TW2804 is not set
>> # CONFIG_VIDEO_TW9903 is not set
>> # CONFIG_VIDEO_TW9906 is not set
>> # CONFIG_VIDEO_TW9910 is not set
>> # CONFIG_VIDEO_VPX3220 is not set
>>
>> #
>> # Video and audio decoders
>> #
>> # CONFIG_VIDEO_SAA717X is not set
>> # CONFIG_VIDEO_CX25840 is not set
>> # end of Video decoders
>>
>> #
>> # Video encoders
>> #
>> # CONFIG_VIDEO_SAA7127 is not set
>> # CONFIG_VIDEO_SAA7185 is not set
>> # CONFIG_VIDEO_ADV7170 is not set
>> # CONFIG_VIDEO_ADV7175 is not set
>> # CONFIG_VIDEO_ADV7343 is not set
>> # CONFIG_VIDEO_ADV7393 is not set
>> # CONFIG_VIDEO_ADV7511 is not set
>> # CONFIG_VIDEO_AD9389B is not set
>> # CONFIG_VIDEO_AK881X is not set
>> # CONFIG_VIDEO_THS8200 is not set
>> # end of Video encoders
>>
>> #
>> # Video improvement chips
>> #
>> # CONFIG_VIDEO_UPD64031A is not set
>> # CONFIG_VIDEO_UPD64083 is not set
>> # end of Video improvement chips
>>
>> #
>> # Audio/Video compression chips
>> #
>> # CONFIG_VIDEO_SAA6752HS is not set
>> # end of Audio/Video compression chips
>>
>> #
>> # SDR tuner chips
>> #
>> # CONFIG_SDR_MAX2175 is not set
>> # end of SDR tuner chips
>>
>> #
>> # Miscellaneous helper chips
>> #
>> # CONFIG_VIDEO_THS7303 is not set
>> # CONFIG_VIDEO_M52790 is not set
>> # CONFIG_VIDEO_I2C is not set
>> # CONFIG_VIDEO_ST_MIPID02 is not set
>> # end of Miscellaneous helper chips
>>
>> #
>> # Camera sensor devices
>> #
>> # CONFIG_VIDEO_HI556 is not set
>> # CONFIG_VIDEO_IMX214 is not set
>> # CONFIG_VIDEO_IMX219 is not set
>> # CONFIG_VIDEO_IMX258 is not set
>> # CONFIG_VIDEO_IMX274 is not set
>> # CONFIG_VIDEO_IMX290 is not set
>> # CONFIG_VIDEO_IMX319 is not set
>> # CONFIG_VIDEO_IMX355 is not set
>> # CONFIG_VIDEO_OV02A10 is not set
>> # CONFIG_VIDEO_OV2640 is not set
>> # CONFIG_VIDEO_OV2659 is not set
>> # CONFIG_VIDEO_OV2680 is not set
>> # CONFIG_VIDEO_OV2685 is not set
>> # CONFIG_VIDEO_OV2740 is not set
>> # CONFIG_VIDEO_OV5647 is not set
>> # CONFIG_VIDEO_OV5648 is not set
>> # CONFIG_VIDEO_OV6650 is not set
>> # CONFIG_VIDEO_OV5670 is not set
>> # CONFIG_VIDEO_OV5675 is not set
>> # CONFIG_VIDEO_OV5695 is not set
>> # CONFIG_VIDEO_OV7251 is not set
>> # CONFIG_VIDEO_OV772X is not set
>> # CONFIG_VIDEO_OV7640 is not set
>> # CONFIG_VIDEO_OV7670 is not set
>> # CONFIG_VIDEO_OV7740 is not set
>> # CONFIG_VIDEO_OV8856 is not set
>> # CONFIG_VIDEO_OV8865 is not set
>> # CONFIG_VIDEO_OV9640 is not set
>> # CONFIG_VIDEO_OV9650 is not set
>> # CONFIG_VIDEO_OV9734 is not set
>> # CONFIG_VIDEO_OV13858 is not set
>> # CONFIG_VIDEO_VS6624 is not set
>> # CONFIG_VIDEO_MT9M001 is not set
>> # CONFIG_VIDEO_MT9M032 is not set
>> # CONFIG_VIDEO_MT9M111 is not set
>> # CONFIG_VIDEO_MT9P031 is not set
>> # CONFIG_VIDEO_MT9T001 is not set
>> # CONFIG_VIDEO_MT9T112 is not set
>> # CONFIG_VIDEO_MT9V011 is not set
>> # CONFIG_VIDEO_MT9V032 is not set
>> # CONFIG_VIDEO_MT9V111 is not set
>> # CONFIG_VIDEO_SR030PC30 is not set
>> # CONFIG_VIDEO_NOON010PC30 is not set
>> # CONFIG_VIDEO_M5MOLS is not set
>> # CONFIG_VIDEO_RDACM20 is not set
>> # CONFIG_VIDEO_RDACM21 is not set
>> # CONFIG_VIDEO_RJ54N1 is not set
>> # CONFIG_VIDEO_S5K6AA is not set
>> # CONFIG_VIDEO_S5K6A3 is not set
>> # CONFIG_VIDEO_S5K4ECGX is not set
>> # CONFIG_VIDEO_S5K5BAF is not set
>> # CONFIG_VIDEO_CCS is not set
>> # CONFIG_VIDEO_ET8EK8 is not set
>> # CONFIG_VIDEO_S5C73M3 is not set
>> # end of Camera sensor devices
>>
>> #
>> # Lens drivers
>> #
>> # CONFIG_VIDEO_AD5820 is not set
>> # CONFIG_VIDEO_AK7375 is not set
>> # CONFIG_VIDEO_DW9714 is not set
>> # CONFIG_VIDEO_DW9768 is not set
>> # CONFIG_VIDEO_DW9807_VCM is not set
>> # end of Lens drivers
>>
>> #
>> # Flash devices
>> #
>> # CONFIG_VIDEO_ADP1653 is not set
>> # CONFIG_VIDEO_LM3560 is not set
>> # CONFIG_VIDEO_LM3646 is not set
>> # end of Flash devices
>>
>> #
>> # SPI helper chips
>> #
>> # CONFIG_VIDEO_GS1662 is not set
>> # end of SPI helper chips
>>
>> #
>> # Media SPI Adapters
>> #
>> CONFIG_CXD2880_SPI_DRV=3Dm
>> # end of Media SPI Adapters
>>
>> CONFIG_MEDIA_TUNER=3Dm
>>
>> #
>> # Customize TV tuners
>> #
>> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
>> CONFIG_MEDIA_TUNER_TDA18250=3Dm
>> CONFIG_MEDIA_TUNER_TDA8290=3Dm
>> CONFIG_MEDIA_TUNER_TDA827X=3Dm
>> CONFIG_MEDIA_TUNER_TDA18271=3Dm
>> CONFIG_MEDIA_TUNER_TDA9887=3Dm
>> CONFIG_MEDIA_TUNER_TEA5761=3Dm
>> CONFIG_MEDIA_TUNER_TEA5767=3Dm
>> CONFIG_MEDIA_TUNER_MSI001=3Dm
>> CONFIG_MEDIA_TUNER_MT20XX=3Dm
>> CONFIG_MEDIA_TUNER_MT2060=3Dm
>> CONFIG_MEDIA_TUNER_MT2063=3Dm
>> CONFIG_MEDIA_TUNER_MT2266=3Dm
>> CONFIG_MEDIA_TUNER_MT2131=3Dm
>> CONFIG_MEDIA_TUNER_QT1010=3Dm
>> CONFIG_MEDIA_TUNER_XC2028=3Dm
>> CONFIG_MEDIA_TUNER_XC5000=3Dm
>> CONFIG_MEDIA_TUNER_XC4000=3Dm
>> CONFIG_MEDIA_TUNER_MXL5005S=3Dm
>> CONFIG_MEDIA_TUNER_MXL5007T=3Dm
>> CONFIG_MEDIA_TUNER_MC44S803=3Dm
>> CONFIG_MEDIA_TUNER_MAX2165=3Dm
>> CONFIG_MEDIA_TUNER_TDA18218=3Dm
>> CONFIG_MEDIA_TUNER_FC0011=3Dm
>> CONFIG_MEDIA_TUNER_FC0012=3Dm
>> CONFIG_MEDIA_TUNER_FC0013=3Dm
>> CONFIG_MEDIA_TUNER_TDA18212=3Dm
>> CONFIG_MEDIA_TUNER_E4000=3Dm
>> CONFIG_MEDIA_TUNER_FC2580=3Dm
>> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
>> CONFIG_MEDIA_TUNER_TUA9001=3Dm
>> CONFIG_MEDIA_TUNER_SI2157=3Dm
>> CONFIG_MEDIA_TUNER_IT913X=3Dm
>> CONFIG_MEDIA_TUNER_R820T=3Dm
>> CONFIG_MEDIA_TUNER_MXL301RF=3Dm
>> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
>> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
>> # end of Customize TV tuners
>>
>> #
>> # Customise DVB Frontends
>> #
>>
>> #
>> # Multistandard (satellite) frontends
>> #
>> CONFIG_DVB_STB0899=3Dm
>> CONFIG_DVB_STB6100=3Dm
>> CONFIG_DVB_STV090x=3Dm
>> CONFIG_DVB_STV0910=3Dm
>> CONFIG_DVB_STV6110x=3Dm
>> CONFIG_DVB_STV6111=3Dm
>> CONFIG_DVB_MXL5XX=3Dm
>> CONFIG_DVB_M88DS3103=3Dm
>>
>> #
>> # Multistandard (cable + terrestrial) frontends
>> #
>> CONFIG_DVB_DRXK=3Dm
>> CONFIG_DVB_TDA18271C2DD=3Dm
>> CONFIG_DVB_SI2165=3Dm
>> CONFIG_DVB_MN88472=3Dm
>> CONFIG_DVB_MN88473=3Dm
>>
>> #
>> # DVB-S (satellite) frontends
>> #
>> CONFIG_DVB_CX24110=3Dm
>> CONFIG_DVB_CX24123=3Dm
>> CONFIG_DVB_MT312=3Dm
>> CONFIG_DVB_ZL10036=3Dm
>> CONFIG_DVB_ZL10039=3Dm
>> CONFIG_DVB_S5H1420=3Dm
>> CONFIG_DVB_STV0288=3Dm
>> CONFIG_DVB_STB6000=3Dm
>> CONFIG_DVB_STV0299=3Dm
>> CONFIG_DVB_STV6110=3Dm
>> CONFIG_DVB_STV0900=3Dm
>> CONFIG_DVB_TDA8083=3Dm
>> CONFIG_DVB_TDA10086=3Dm
>> CONFIG_DVB_TDA8261=3Dm
>> CONFIG_DVB_VES1X93=3Dm
>> CONFIG_DVB_TUNER_ITD1000=3Dm
>> CONFIG_DVB_TUNER_CX24113=3Dm
>> CONFIG_DVB_TDA826X=3Dm
>> CONFIG_DVB_TUA6100=3Dm
>> CONFIG_DVB_CX24116=3Dm
>> CONFIG_DVB_CX24117=3Dm
>> CONFIG_DVB_CX24120=3Dm
>> CONFIG_DVB_SI21XX=3Dm
>> CONFIG_DVB_TS2020=3Dm
>> CONFIG_DVB_DS3000=3Dm
>> CONFIG_DVB_MB86A16=3Dm
>> CONFIG_DVB_TDA10071=3Dm
>>
>> #
>> # DVB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_SP8870=3Dm
>> CONFIG_DVB_SP887X=3Dm
>> CONFIG_DVB_CX22700=3Dm
>> CONFIG_DVB_CX22702=3Dm
>> CONFIG_DVB_S5H1432=3Dm
>> CONFIG_DVB_DRXD=3Dm
>> CONFIG_DVB_L64781=3Dm
>> CONFIG_DVB_TDA1004X=3Dm
>> CONFIG_DVB_NXT6000=3Dm
>> CONFIG_DVB_MT352=3Dm
>> CONFIG_DVB_ZL10353=3Dm
>> CONFIG_DVB_DIB3000MB=3Dm
>> CONFIG_DVB_DIB3000MC=3Dm
>> CONFIG_DVB_DIB7000M=3Dm
>> CONFIG_DVB_DIB7000P=3Dm
>> CONFIG_DVB_DIB9000=3Dm
>> CONFIG_DVB_TDA10048=3Dm
>> CONFIG_DVB_AF9013=3Dm
>> CONFIG_DVB_EC100=3Dm
>> CONFIG_DVB_STV0367=3Dm
>> CONFIG_DVB_CXD2820R=3Dm
>> CONFIG_DVB_CXD2841ER=3Dm
>> CONFIG_DVB_RTL2830=3Dm
>> CONFIG_DVB_RTL2832=3Dm
>> CONFIG_DVB_RTL2832_SDR=3Dm
>> CONFIG_DVB_SI2168=3Dm
>> CONFIG_DVB_ZD1301_DEMOD=3Dm
>> CONFIG_DVB_CXD2880=3Dm
>>
>> #
>> # DVB-C (cable) frontends
>> #
>> CONFIG_DVB_VES1820=3Dm
>> CONFIG_DVB_TDA10021=3Dm
>> CONFIG_DVB_TDA10023=3Dm
>> CONFIG_DVB_STV0297=3Dm
>>
>> #
>> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
>> #
>> CONFIG_DVB_NXT200X=3Dm
>> CONFIG_DVB_OR51211=3Dm
>> CONFIG_DVB_OR51132=3Dm
>> CONFIG_DVB_BCM3510=3Dm
>> CONFIG_DVB_LGDT330X=3Dm
>> CONFIG_DVB_LGDT3305=3Dm
>> CONFIG_DVB_LGDT3306A=3Dm
>> CONFIG_DVB_LG2160=3Dm
>> CONFIG_DVB_S5H1409=3Dm
>> CONFIG_DVB_AU8522=3Dm
>> CONFIG_DVB_AU8522_DTV=3Dm
>> CONFIG_DVB_AU8522_V4L=3Dm
>> CONFIG_DVB_S5H1411=3Dm
>> CONFIG_DVB_MXL692=3Dm
>>
>> #
>> # ISDB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_S921=3Dm
>> CONFIG_DVB_DIB8000=3Dm
>> CONFIG_DVB_MB86A20S=3Dm
>>
>> #
>> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
>> #
>> CONFIG_DVB_TC90522=3Dm
>> CONFIG_DVB_MN88443X=3Dm
>>
>> #
>> # Digital terrestrial only tuners/PLL
>> #
>> CONFIG_DVB_PLL=3Dm
>> CONFIG_DVB_TUNER_DIB0070=3Dm
>> CONFIG_DVB_TUNER_DIB0090=3Dm
>>
>> #
>> # SEC control devices for DVB-S
>> #
>> CONFIG_DVB_DRX39XYJ=3Dm
>> CONFIG_DVB_LNBH25=3Dm
>> CONFIG_DVB_LNBH29=3Dm
>> CONFIG_DVB_LNBP21=3Dm
>> CONFIG_DVB_LNBP22=3Dm
>> CONFIG_DVB_ISL6405=3Dm
>> CONFIG_DVB_ISL6421=3Dm
>> CONFIG_DVB_ISL6423=3Dm
>> CONFIG_DVB_A8293=3Dm
>> CONFIG_DVB_LGS8GL5=3Dm
>> CONFIG_DVB_LGS8GXX=3Dm
>> CONFIG_DVB_ATBM8830=3Dm
>> CONFIG_DVB_TDA665x=3Dm
>> CONFIG_DVB_IX2505V=3Dm
>> CONFIG_DVB_M88RS2000=3Dm
>> CONFIG_DVB_AF9033=3Dm
>> CONFIG_DVB_HORUS3A=3Dm
>> CONFIG_DVB_ASCOT2E=3Dm
>> CONFIG_DVB_HELENE=3Dm
>>
>> #
>> # Common Interface (EN50221) controller drivers
>> #
>> CONFIG_DVB_CXD2099=3Dm
>> CONFIG_DVB_SP2=3Dm
>> # end of Customise DVB Frontends
>>
>> #
>> # Tools to develop new frontends
>> #
>> # CONFIG_DVB_DUMMY_FE is not set
>> # end of Media ancillary drivers
>>
>> #
>> # Graphics support
>> #
>> # CONFIG_AGP is not set
>> CONFIG_INTEL_GTT=3Dm
>> CONFIG_VGA_ARB=3Dy
>> CONFIG_VGA_ARB_MAX_GPUS=3D64
>> CONFIG_VGA_SWITCHEROO=3Dy
>> CONFIG_DRM=3Dm
>> CONFIG_DRM_MIPI_DSI=3Dy
>> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
>> # CONFIG_DRM_DEBUG_SELFTEST is not set
>> CONFIG_DRM_KMS_HELPER=3Dm
>> CONFIG_DRM_KMS_FB_HELPER=3Dy
>> CONFIG_DRM_FBDEV_EMULATION=3Dy
>> CONFIG_DRM_FBDEV_OVERALLOC=3D100
>> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
>> # CONFIG_DRM_DP_CEC is not set
>> CONFIG_DRM_TTM=3Dm
>> CONFIG_DRM_VRAM_HELPER=3Dm
>> CONFIG_DRM_TTM_HELPER=3Dm
>> CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
>>
>> #
>> # I2C encoder or helper chips
>> #
>> CONFIG_DRM_I2C_CH7006=3Dm
>> CONFIG_DRM_I2C_SIL164=3Dm
>> # CONFIG_DRM_I2C_NXP_TDA998X is not set
>> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
>> # end of I2C encoder or helper chips
>>
>> #
>> # ARM devices
>> #
>> # end of ARM devices
>>
>> # CONFIG_DRM_RADEON is not set
>> # CONFIG_DRM_AMDGPU is not set
>> # CONFIG_DRM_NOUVEAU is not set
>> CONFIG_DRM_I915=3Dm
>> CONFIG_DRM_I915_FORCE_PROBE=3D""
>> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
>> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
>> CONFIG_DRM_I915_USERPTR=3Dy
>> CONFIG_DRM_I915_GVT=3Dy
>> CONFIG_DRM_I915_GVT_KVMGT=3Dm
>> CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
>> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
>> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
>> CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
>> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
>> CONFIG_DRM_I915_STOP_TIMEOUT=3D100
>> CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
>> # CONFIG_DRM_VGEM is not set
>> # CONFIG_DRM_VKMS is not set
>> CONFIG_DRM_VMWGFX=3Dm
>> CONFIG_DRM_VMWGFX_FBCON=3Dy
>> CONFIG_DRM_GMA500=3Dm
>> CONFIG_DRM_GMA600=3Dy
>> # CONFIG_DRM_UDL is not set
>> CONFIG_DRM_AST=3Dm
>> CONFIG_DRM_MGAG200=3Dm
>> CONFIG_DRM_QXL=3Dm
>> CONFIG_DRM_BOCHS=3Dm
>> CONFIG_DRM_VIRTIO_GPU=3Dm
>> CONFIG_DRM_PANEL=3Dy
>>
>> #
>> # Display Panels
>> #
>> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
>> # end of Display Panels
>>
>> CONFIG_DRM_BRIDGE=3Dy
>> CONFIG_DRM_PANEL_BRIDGE=3Dy
>>
>> #
>> # Display Interface Bridges
>> #
>> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
>> # end of Display Interface Bridges
>>
>> # CONFIG_DRM_ETNAVIV is not set
>> CONFIG_DRM_CIRRUS_QEMU=3Dm
>> # CONFIG_DRM_GM12U320 is not set
>> # CONFIG_TINYDRM_HX8357D is not set
>> # CONFIG_TINYDRM_ILI9225 is not set
>> # CONFIG_TINYDRM_ILI9341 is not set
>> # CONFIG_TINYDRM_ILI9486 is not set
>> # CONFIG_TINYDRM_MI0283QT is not set
>> # CONFIG_TINYDRM_REPAPER is not set
>> # CONFIG_TINYDRM_ST7586 is not set
>> # CONFIG_TINYDRM_ST7735R is not set
>> # CONFIG_DRM_XEN is not set
>> # CONFIG_DRM_VBOXVIDEO is not set
>> # CONFIG_DRM_LEGACY is not set
>> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
>>
>> #
>> # Frame buffer Devices
>> #
>> CONFIG_FB_CMDLINE=3Dy
>> CONFIG_FB_NOTIFY=3Dy
>> CONFIG_FB=3Dy
>> # CONFIG_FIRMWARE_EDID is not set
>> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
>> CONFIG_FB_CFB_FILLRECT=3Dy
>> CONFIG_FB_CFB_COPYAREA=3Dy
>> CONFIG_FB_CFB_IMAGEBLIT=3Dy
>> CONFIG_FB_SYS_FILLRECT=3Dm
>> CONFIG_FB_SYS_COPYAREA=3Dm
>> CONFIG_FB_SYS_IMAGEBLIT=3Dm
>> # CONFIG_FB_FOREIGN_ENDIAN is not set
>> CONFIG_FB_SYS_FOPS=3Dm
>> CONFIG_FB_DEFERRED_IO=3Dy
>> # CONFIG_FB_MODE_HELPERS is not set
>> CONFIG_FB_TILEBLITTING=3Dy
>>
>> #
>> # Frame buffer hardware drivers
>> #
>> # CONFIG_FB_CIRRUS is not set
>> # CONFIG_FB_PM2 is not set
>> # CONFIG_FB_CYBER2000 is not set
>> # CONFIG_FB_ARC is not set
>> # CONFIG_FB_ASILIANT is not set
>> # CONFIG_FB_IMSTT is not set
>> # CONFIG_FB_VGA16 is not set
>> # CONFIG_FB_UVESA is not set
>> CONFIG_FB_VESA=3Dy
>> CONFIG_FB_EFI=3Dy
>> # CONFIG_FB_N411 is not set
>> # CONFIG_FB_HGA is not set
>> # CONFIG_FB_OPENCORES is not set
>> # CONFIG_FB_S1D13XXX is not set
>> # CONFIG_FB_NVIDIA is not set
>> # CONFIG_FB_RIVA is not set
>> # CONFIG_FB_I740 is not set
>> # CONFIG_FB_LE80578 is not set
>> # CONFIG_FB_MATROX is not set
>> # CONFIG_FB_RADEON is not set
>> # CONFIG_FB_ATY128 is not set
>> # CONFIG_FB_ATY is not set
>> # CONFIG_FB_S3 is not set
>> # CONFIG_FB_SAVAGE is not set
>> # CONFIG_FB_SIS is not set
>> # CONFIG_FB_VIA is not set
>> # CONFIG_FB_NEOMAGIC is not set
>> # CONFIG_FB_KYRO is not set
>> # CONFIG_FB_3DFX is not set
>> # CONFIG_FB_VOODOO1 is not set
>> # CONFIG_FB_VT8623 is not set
>> # CONFIG_FB_TRIDENT is not set
>> # CONFIG_FB_ARK is not set
>> # CONFIG_FB_PM3 is not set
>> # CONFIG_FB_CARMINE is not set
>> # CONFIG_FB_SM501 is not set
>> # CONFIG_FB_SMSCUFX is not set
>> # CONFIG_FB_UDL is not set
>> # CONFIG_FB_IBM_GXT4500 is not set
>> # CONFIG_FB_VIRTUAL is not set
>> # CONFIG_XEN_FBDEV_FRONTEND is not set
>> # CONFIG_FB_METRONOME is not set
>> # CONFIG_FB_MB862XX is not set
>> CONFIG_FB_HYPERV=3Dm
>> # CONFIG_FB_SIMPLE is not set
>> # CONFIG_FB_SM712 is not set
>> # end of Frame buffer Devices
>>
>> #
>> # Backlight & LCD device support
>> #
>> CONFIG_LCD_CLASS_DEVICE=3Dm
>> # CONFIG_LCD_L4F00242T03 is not set
>> # CONFIG_LCD_LMS283GF05 is not set
>> # CONFIG_LCD_LTV350QV is not set
>> # CONFIG_LCD_ILI922X is not set
>> # CONFIG_LCD_ILI9320 is not set
>> # CONFIG_LCD_TDO24M is not set
>> # CONFIG_LCD_VGG2432A4 is not set
>> CONFIG_LCD_PLATFORM=3Dm
>> # CONFIG_LCD_AMS369FG06 is not set
>> # CONFIG_LCD_LMS501KF03 is not set
>> # CONFIG_LCD_HX8357 is not set
>> # CONFIG_LCD_OTM3225A is not set
>> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
>> # CONFIG_BACKLIGHT_KTD253 is not set
>> # CONFIG_BACKLIGHT_PWM is not set
>> CONFIG_BACKLIGHT_APPLE=3Dm
>> # CONFIG_BACKLIGHT_QCOM_WLED is not set
>> # CONFIG_BACKLIGHT_SAHARA is not set
>> # CONFIG_BACKLIGHT_ADP8860 is not set
>> # CONFIG_BACKLIGHT_ADP8870 is not set
>> # CONFIG_BACKLIGHT_LM3630A is not set
>> # CONFIG_BACKLIGHT_LM3639 is not set
>> CONFIG_BACKLIGHT_LP855X=3Dm
>> # CONFIG_BACKLIGHT_GPIO is not set
>> # CONFIG_BACKLIGHT_LV5207LP is not set
>> # CONFIG_BACKLIGHT_BD6107 is not set
>> # CONFIG_BACKLIGHT_ARCXCNN is not set
>> # end of Backlight & LCD device support
>>
>> CONFIG_HDMI=3Dy
>>
>> #
>> # Console display driver support
>> #
>> CONFIG_VGA_CONSOLE=3Dy
>> CONFIG_DUMMY_CONSOLE=3Dy
>> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
>> CONFIG_DUMMY_CONSOLE_ROWS=3D25
>> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
>> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
>> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
>> # CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
>> # end of Console display driver support
>>
>> CONFIG_LOGO=3Dy
>> # CONFIG_LOGO_LINUX_MONO is not set
>> # CONFIG_LOGO_LINUX_VGA16 is not set
>> CONFIG_LOGO_LINUX_CLUT224=3Dy
>> # end of Graphics support
>>
>> # CONFIG_SOUND is not set
>>
>> #
>> # HID support
>> #
>> CONFIG_HID=3Dy
>> CONFIG_HID_BATTERY_STRENGTH=3Dy
>> CONFIG_HIDRAW=3Dy
>> CONFIG_UHID=3Dm
>> CONFIG_HID_GENERIC=3Dy
>>
>> #
>> # Special HID drivers
>> #
>> CONFIG_HID_A4TECH=3Dm
>> # CONFIG_HID_ACCUTOUCH is not set
>> CONFIG_HID_ACRUX=3Dm
>> # CONFIG_HID_ACRUX_FF is not set
>> CONFIG_HID_APPLE=3Dm
>> # CONFIG_HID_APPLEIR is not set
>> CONFIG_HID_ASUS=3Dm
>> CONFIG_HID_AUREAL=3Dm
>> CONFIG_HID_BELKIN=3Dm
>> # CONFIG_HID_BETOP_FF is not set
>> # CONFIG_HID_BIGBEN_FF is not set
>> CONFIG_HID_CHERRY=3Dm
>> CONFIG_HID_CHICONY=3Dm
>> # CONFIG_HID_CORSAIR is not set
>> # CONFIG_HID_COUGAR is not set
>> # CONFIG_HID_MACALLY is not set
>> CONFIG_HID_CMEDIA=3Dm
>> # CONFIG_HID_CP2112 is not set
>> # CONFIG_HID_CREATIVE_SB0540 is not set
>> CONFIG_HID_CYPRESS=3Dm
>> CONFIG_HID_DRAGONRISE=3Dm
>> # CONFIG_DRAGONRISE_FF is not set
>> # CONFIG_HID_EMS_FF is not set
>> # CONFIG_HID_ELAN is not set
>> CONFIG_HID_ELECOM=3Dm
>> # CONFIG_HID_ELO is not set
>> CONFIG_HID_EZKEY=3Dm
>> CONFIG_HID_GEMBIRD=3Dm
>> CONFIG_HID_GFRM=3Dm
>> # CONFIG_HID_GLORIOUS is not set
>> # CONFIG_HID_HOLTEK is not set
>> # CONFIG_HID_VIVALDI is not set
>> # CONFIG_HID_GT683R is not set
>> CONFIG_HID_KEYTOUCH=3Dm
>> CONFIG_HID_KYE=3Dm
>> # CONFIG_HID_UCLOGIC is not set
>> CONFIG_HID_WALTOP=3Dm
>> # CONFIG_HID_VIEWSONIC is not set
>> CONFIG_HID_GYRATION=3Dm
>> CONFIG_HID_ICADE=3Dm
>> CONFIG_HID_ITE=3Dm
>> CONFIG_HID_JABRA=3Dm
>> CONFIG_HID_TWINHAN=3Dm
>> CONFIG_HID_KENSINGTON=3Dm
>> CONFIG_HID_LCPOWER=3Dm
>> CONFIG_HID_LED=3Dm
>> CONFIG_HID_LENOVO=3Dm
>> CONFIG_HID_LOGITECH=3Dm
>> CONFIG_HID_LOGITECH_DJ=3Dm
>> CONFIG_HID_LOGITECH_HIDPP=3Dm
>> # CONFIG_LOGITECH_FF is not set
>> # CONFIG_LOGIRUMBLEPAD2_FF is not set
>> # CONFIG_LOGIG940_FF is not set
>> # CONFIG_LOGIWHEELS_FF is not set
>> CONFIG_HID_MAGICMOUSE=3Dy
>> # CONFIG_HID_MALTRON is not set
>> # CONFIG_HID_MAYFLASH is not set
>> # CONFIG_HID_REDRAGON is not set
>> CONFIG_HID_MICROSOFT=3Dm
>> CONFIG_HID_MONTEREY=3Dm
>> CONFIG_HID_MULTITOUCH=3Dm
>> CONFIG_HID_NTI=3Dm
>> # CONFIG_HID_NTRIG is not set
>> CONFIG_HID_ORTEK=3Dm
>> CONFIG_HID_PANTHERLORD=3Dm
>> # CONFIG_PANTHERLORD_FF is not set
>> # CONFIG_HID_PENMOUNT is not set
>> CONFIG_HID_PETALYNX=3Dm
>> CONFIG_HID_PICOLCD=3Dm
>> CONFIG_HID_PICOLCD_FB=3Dy
>> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
>> CONFIG_HID_PICOLCD_LCD=3Dy
>> CONFIG_HID_PICOLCD_LEDS=3Dy
>> CONFIG_HID_PICOLCD_CIR=3Dy
>> CONFIG_HID_PLANTRONICS=3Dm
>> # CONFIG_HID_PLAYSTATION is not set
>> CONFIG_HID_PRIMAX=3Dm
>> # CONFIG_HID_RETRODE is not set
>> # CONFIG_HID_ROCCAT is not set
>> CONFIG_HID_SAITEK=3Dm
>> CONFIG_HID_SAMSUNG=3Dm
>> # CONFIG_HID_SONY is not set
>> CONFIG_HID_SPEEDLINK=3Dm
>> # CONFIG_HID_STEAM is not set
>> CONFIG_HID_STEELSERIES=3Dm
>> CONFIG_HID_SUNPLUS=3Dm
>> CONFIG_HID_RMI=3Dm
>> CONFIG_HID_GREENASIA=3Dm
>> # CONFIG_GREENASIA_FF is not set
>> CONFIG_HID_HYPERV_MOUSE=3Dm
>> CONFIG_HID_SMARTJOYPLUS=3Dm
>> # CONFIG_SMARTJOYPLUS_FF is not set
>> CONFIG_HID_TIVO=3Dm
>> CONFIG_HID_TOPSEED=3Dm
>> CONFIG_HID_THINGM=3Dm
>> CONFIG_HID_THRUSTMASTER=3Dm
>> # CONFIG_THRUSTMASTER_FF is not set
>> # CONFIG_HID_UDRAW_PS3 is not set
>> # CONFIG_HID_U2FZERO is not set
>> # CONFIG_HID_WACOM is not set
>> CONFIG_HID_WIIMOTE=3Dm
>> CONFIG_HID_XINMO=3Dm
>> CONFIG_HID_ZEROPLUS=3Dm
>> # CONFIG_ZEROPLUS_FF is not set
>> CONFIG_HID_ZYDACRON=3Dm
>> CONFIG_HID_SENSOR_HUB=3Dy
>> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
>> CONFIG_HID_ALPS=3Dm
>> # CONFIG_HID_MCP2221 is not set
>> # end of Special HID drivers
>>
>> #
>> # USB HID support
>> #
>> CONFIG_USB_HID=3Dy
>> # CONFIG_HID_PID is not set
>> # CONFIG_USB_HIDDEV is not set
>> # end of USB HID support
>>
>> #
>> # I2C HID support
>> #
>> # CONFIG_I2C_HID_ACPI is not set
>> # end of I2C HID support
>>
>> #
>> # Intel ISH HID support
>> #
>> CONFIG_INTEL_ISH_HID=3Dm
>> # CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
>> # end of Intel ISH HID support
>>
>> #
>> # AMD SFH HID Support
>> #
>> # CONFIG_AMD_SFH_HID is not set
>> # end of AMD SFH HID Support
>> # end of HID support
>>
>> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
>> CONFIG_USB_SUPPORT=3Dy
>> CONFIG_USB_COMMON=3Dy
>> # CONFIG_USB_LED_TRIG is not set
>> # CONFIG_USB_ULPI_BUS is not set
>> # CONFIG_USB_CONN_GPIO is not set
>> CONFIG_USB_ARCH_HAS_HCD=3Dy
>> CONFIG_USB=3Dy
>> CONFIG_USB_PCI=3Dy
>> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
>>
>> #
>> # Miscellaneous USB options
>> #
>> CONFIG_USB_DEFAULT_PERSIST=3Dy
>> # CONFIG_USB_FEW_INIT_RETRIES is not set
>> # CONFIG_USB_DYNAMIC_MINORS is not set
>> # CONFIG_USB_OTG is not set
>> # CONFIG_USB_OTG_PRODUCTLIST is not set
>> CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dy
>> CONFIG_USB_AUTOSUSPEND_DELAY=3D2
>> CONFIG_USB_MON=3Dy
>>
>> #
>> # USB Host Controller Drivers
>> #
>> # CONFIG_USB_C67X00_HCD is not set
>> CONFIG_USB_XHCI_HCD=3Dy
>> # CONFIG_USB_XHCI_DBGCAP is not set
>> CONFIG_USB_XHCI_PCI=3Dy
>> # CONFIG_USB_XHCI_PCI_RENESAS is not set
>> # CONFIG_USB_XHCI_PLATFORM is not set
>> CONFIG_USB_EHCI_HCD=3Dy
>> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
>> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
>> CONFIG_USB_EHCI_PCI=3Dy
>> # CONFIG_USB_EHCI_FSL is not set
>> # CONFIG_USB_EHCI_HCD_PLATFORM is not set
>> # CONFIG_USB_OXU210HP_HCD is not set
>> # CONFIG_USB_ISP116X_HCD is not set
>> # CONFIG_USB_FOTG210_HCD is not set
>> # CONFIG_USB_MAX3421_HCD is not set
>> CONFIG_USB_OHCI_HCD=3Dy
>> CONFIG_USB_OHCI_HCD_PCI=3Dy
>> # CONFIG_USB_OHCI_HCD_PLATFORM is not set
>> CONFIG_USB_UHCI_HCD=3Dy
>> # CONFIG_USB_SL811_HCD is not set
>> # CONFIG_USB_R8A66597_HCD is not set
>> # CONFIG_USB_HCD_BCMA is not set
>> # CONFIG_USB_HCD_TEST_MODE is not set
>>
>> #
>> # USB Device Class drivers
>> #
>> # CONFIG_USB_ACM is not set
>> # CONFIG_USB_PRINTER is not set
>> # CONFIG_USB_WDM is not set
>> # CONFIG_USB_TMC is not set
>>
>> #
>> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
>> #
>>
>> #
>> # also be needed; see USB_STORAGE Help for more info
>> #
>> CONFIG_USB_STORAGE=3Dm
>> # CONFIG_USB_STORAGE_DEBUG is not set
>> # CONFIG_USB_STORAGE_REALTEK is not set
>> # CONFIG_USB_STORAGE_DATAFAB is not set
>> # CONFIG_USB_STORAGE_FREECOM is not set
>> # CONFIG_USB_STORAGE_ISD200 is not set
>> # CONFIG_USB_STORAGE_USBAT is not set
>> # CONFIG_USB_STORAGE_SDDR09 is not set
>> # CONFIG_USB_STORAGE_SDDR55 is not set
>> # CONFIG_USB_STORAGE_JUMPSHOT is not set
>> # CONFIG_USB_STORAGE_ALAUDA is not set
>> # CONFIG_USB_STORAGE_ONETOUCH is not set
>> # CONFIG_USB_STORAGE_KARMA is not set
>> # CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
>> # CONFIG_USB_STORAGE_ENE_UB6250 is not set
>> # CONFIG_USB_UAS is not set
>>
>> #
>> # USB Imaging devices
>> #
>> # CONFIG_USB_MDC800 is not set
>> # CONFIG_USB_MICROTEK is not set
>> # CONFIG_USBIP_CORE is not set
>> # CONFIG_USB_CDNS_SUPPORT is not set
>> # CONFIG_USB_MUSB_HDRC is not set
>> # CONFIG_USB_DWC3 is not set
>> # CONFIG_USB_DWC2 is not set
>> # CONFIG_USB_CHIPIDEA is not set
>> # CONFIG_USB_ISP1760 is not set
>>
>> #
>> # USB port drivers
>> #
>> # CONFIG_USB_USS720 is not set
>> CONFIG_USB_SERIAL=3Dm
>> CONFIG_USB_SERIAL_GENERIC=3Dy
>> # CONFIG_USB_SERIAL_SIMPLE is not set
>> # CONFIG_USB_SERIAL_AIRCABLE is not set
>> # CONFIG_USB_SERIAL_ARK3116 is not set
>> # CONFIG_USB_SERIAL_BELKIN is not set
>> # CONFIG_USB_SERIAL_CH341 is not set
>> # CONFIG_USB_SERIAL_WHITEHEAT is not set
>> # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
>> # CONFIG_USB_SERIAL_CP210X is not set
>> # CONFIG_USB_SERIAL_CYPRESS_M8 is not set
>> # CONFIG_USB_SERIAL_EMPEG is not set
>> # CONFIG_USB_SERIAL_FTDI_SIO is not set
>> # CONFIG_USB_SERIAL_VISOR is not set
>> # CONFIG_USB_SERIAL_IPAQ is not set
>> # CONFIG_USB_SERIAL_IR is not set
>> # CONFIG_USB_SERIAL_EDGEPORT is not set
>> # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
>> # CONFIG_USB_SERIAL_F81232 is not set
>> # CONFIG_USB_SERIAL_F8153X is not set
>> # CONFIG_USB_SERIAL_GARMIN is not set
>> # CONFIG_USB_SERIAL_IPW is not set
>> # CONFIG_USB_SERIAL_IUU is not set
>> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
>> # CONFIG_USB_SERIAL_KEYSPAN is not set
>> # CONFIG_USB_SERIAL_KLSI is not set
>> # CONFIG_USB_SERIAL_KOBIL_SCT is not set
>> # CONFIG_USB_SERIAL_MCT_U232 is not set
>> # CONFIG_USB_SERIAL_METRO is not set
>> # CONFIG_USB_SERIAL_MOS7720 is not set
>> # CONFIG_USB_SERIAL_MOS7840 is not set
>> # CONFIG_USB_SERIAL_MXUPORT is not set
>> # CONFIG_USB_SERIAL_NAVMAN is not set
>> # CONFIG_USB_SERIAL_PL2303 is not set
>> # CONFIG_USB_SERIAL_OTI6858 is not set
>> # CONFIG_USB_SERIAL_QCAUX is not set
>> # CONFIG_USB_SERIAL_QUALCOMM is not set
>> # CONFIG_USB_SERIAL_SPCP8X5 is not set
>> # CONFIG_USB_SERIAL_SAFE is not set
>> # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
>> # CONFIG_USB_SERIAL_SYMBOL is not set
>> # CONFIG_USB_SERIAL_TI is not set
>> # CONFIG_USB_SERIAL_CYBERJACK is not set
>> # CONFIG_USB_SERIAL_OPTION is not set
>> # CONFIG_USB_SERIAL_OMNINET is not set
>> # CONFIG_USB_SERIAL_OPTICON is not set
>> # CONFIG_USB_SERIAL_XSENS_MT is not set
>> # CONFIG_USB_SERIAL_WISHBONE is not set
>> # CONFIG_USB_SERIAL_SSU100 is not set
>> # CONFIG_USB_SERIAL_QT2 is not set
>> # CONFIG_USB_SERIAL_UPD78F0730 is not set
>> # CONFIG_USB_SERIAL_XR is not set
>> CONFIG_USB_SERIAL_DEBUG=3Dm
>>
>> #
>> # USB Miscellaneous drivers
>> #
>> # CONFIG_USB_EMI62 is not set
>> # CONFIG_USB_EMI26 is not set
>> # CONFIG_USB_ADUTUX is not set
>> # CONFIG_USB_SEVSEG is not set
>> # CONFIG_USB_LEGOTOWER is not set
>> # CONFIG_USB_LCD is not set
>> # CONFIG_USB_CYPRESS_CY7C63 is not set
>> # CONFIG_USB_CYTHERM is not set
>> # CONFIG_USB_IDMOUSE is not set
>> # CONFIG_USB_FTDI_ELAN is not set
>> # CONFIG_USB_APPLEDISPLAY is not set
>> # CONFIG_APPLE_MFI_FASTCHARGE is not set
>> # CONFIG_USB_SISUSBVGA is not set
>> # CONFIG_USB_LD is not set
>> # CONFIG_USB_TRANCEVIBRATOR is not set
>> # CONFIG_USB_IOWARRIOR is not set
>> # CONFIG_USB_TEST is not set
>> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
>> # CONFIG_USB_ISIGHTFW is not set
>> # CONFIG_USB_YUREX is not set
>> # CONFIG_USB_EZUSB_FX2 is not set
>> # CONFIG_USB_HUB_USB251XB is not set
>> # CONFIG_USB_HSIC_USB3503 is not set
>> # CONFIG_USB_HSIC_USB4604 is not set
>> # CONFIG_USB_LINK_LAYER_TEST is not set
>> # CONFIG_USB_CHAOSKEY is not set
>> # CONFIG_USB_ATM is not set
>>
>> #
>> # USB Physical Layer drivers
>> #
>> # CONFIG_NOP_USB_XCEIV is not set
>> # CONFIG_USB_GPIO_VBUS is not set
>> # CONFIG_USB_ISP1301 is not set
>> # end of USB Physical Layer drivers
>>
>> # CONFIG_USB_GADGET is not set
>> CONFIG_TYPEC=3Dy
>> # CONFIG_TYPEC_TCPM is not set
>> CONFIG_TYPEC_UCSI=3Dy
>> # CONFIG_UCSI_CCG is not set
>> CONFIG_UCSI_ACPI=3Dy
>> # CONFIG_TYPEC_TPS6598X is not set
>> # CONFIG_TYPEC_STUSB160X is not set
>>
>> #
>> # USB Type-C Multiplexer/DeMultiplexer Switch support
>> #
>> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
>> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
>>
>> #
>> # USB Type-C Alternate Mode drivers
>> #
>> # CONFIG_TYPEC_DP_ALTMODE is not set
>> # end of USB Type-C Alternate Mode drivers
>>
>> # CONFIG_USB_ROLE_SWITCH is not set
>> CONFIG_MMC=3Dm
>> CONFIG_MMC_BLOCK=3Dm
>> CONFIG_MMC_BLOCK_MINORS=3D8
>> CONFIG_SDIO_UART=3Dm
>> # CONFIG_MMC_TEST is not set
>>
>> #
>> # MMC/SD/SDIO Host Controller Drivers
>> #
>> # CONFIG_MMC_DEBUG is not set
>> CONFIG_MMC_SDHCI=3Dm
>> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
>> CONFIG_MMC_SDHCI_PCI=3Dm
>> CONFIG_MMC_RICOH_MMC=3Dy
>> CONFIG_MMC_SDHCI_ACPI=3Dm
>> CONFIG_MMC_SDHCI_PLTFM=3Dm
>> # CONFIG_MMC_SDHCI_F_SDH30 is not set
>> # CONFIG_MMC_WBSD is not set
>> # CONFIG_MMC_TIFM_SD is not set
>> # CONFIG_MMC_SPI is not set
>> # CONFIG_MMC_CB710 is not set
>> # CONFIG_MMC_VIA_SDMMC is not set
>> # CONFIG_MMC_VUB300 is not set
>> # CONFIG_MMC_USHC is not set
>> # CONFIG_MMC_USDHI6ROL0 is not set
>> # CONFIG_MMC_REALTEK_PCI is not set
>> CONFIG_MMC_CQHCI=3Dm
>> # CONFIG_MMC_HSQ is not set
>> # CONFIG_MMC_TOSHIBA_PCI is not set
>> # CONFIG_MMC_MTK is not set
>> # CONFIG_MMC_SDHCI_XENON is not set
>> # CONFIG_MEMSTICK is not set
>> CONFIG_NEW_LEDS=3Dy
>> CONFIG_LEDS_CLASS=3Dy
>> # CONFIG_LEDS_CLASS_FLASH is not set
>> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
>> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
>>
>> #
>> # LED drivers
>> #
>> # CONFIG_LEDS_APU is not set
>> CONFIG_LEDS_LM3530=3Dm
>> # CONFIG_LEDS_LM3532 is not set
>> # CONFIG_LEDS_LM3642 is not set
>> # CONFIG_LEDS_PCA9532 is not set
>> # CONFIG_LEDS_GPIO is not set
>> CONFIG_LEDS_LP3944=3Dm
>> # CONFIG_LEDS_LP3952 is not set
>> # CONFIG_LEDS_LP50XX is not set
>> CONFIG_LEDS_CLEVO_MAIL=3Dm
>> # CONFIG_LEDS_PCA955X is not set
>> # CONFIG_LEDS_PCA963X is not set
>> # CONFIG_LEDS_DAC124S085 is not set
>> # CONFIG_LEDS_PWM is not set
>> # CONFIG_LEDS_BD2802 is not set
>> CONFIG_LEDS_INTEL_SS4200=3Dm
>> # CONFIG_LEDS_TCA6507 is not set
>> # CONFIG_LEDS_TLC591XX is not set
>> # CONFIG_LEDS_LM355x is not set
>>
>> #
>> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_=
THINGM)
>> #
>> CONFIG_LEDS_BLINKM=3Dm
>> CONFIG_LEDS_MLXCPLD=3Dm
>> # CONFIG_LEDS_MLXREG is not set
>> # CONFIG_LEDS_USER is not set
>> # CONFIG_LEDS_NIC78BX is not set
>> # CONFIG_LEDS_TI_LMU_COMMON is not set
>>
>> #
>> # Flash and Torch LED drivers
>> #
>>
>> #
>> # LED Triggers
>> #
>> CONFIG_LEDS_TRIGGERS=3Dy
>> CONFIG_LEDS_TRIGGER_TIMER=3Dm
>> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
>> # CONFIG_LEDS_TRIGGER_DISK is not set
>> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
>> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
>> # CONFIG_LEDS_TRIGGER_CPU is not set
>> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
>> CONFIG_LEDS_TRIGGER_GPIO=3Dm
>> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
>>
>> #
>> # iptables trigger is under Netfilter config (LED target)
>> #
>> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
>> CONFIG_LEDS_TRIGGER_CAMERA=3Dm
>> # CONFIG_LEDS_TRIGGER_PANIC is not set
>> # CONFIG_LEDS_TRIGGER_NETDEV is not set
>> # CONFIG_LEDS_TRIGGER_PATTERN is not set
>> CONFIG_LEDS_TRIGGER_AUDIO=3Dm
>> # CONFIG_LEDS_TRIGGER_TTY is not set
>>
>> #
>> # LED Blink
>> #
>> # CONFIG_LEDS_BLINK is not set
>> # CONFIG_ACCESSIBILITY is not set
>> CONFIG_INFINIBAND=3Dm
>> CONFIG_INFINIBAND_USER_MAD=3Dm
>> CONFIG_INFINIBAND_USER_ACCESS=3Dm
>> CONFIG_INFINIBAND_USER_MEM=3Dy
>> CONFIG_INFINIBAND_ON_DEMAND_PAGING=3Dy
>> CONFIG_INFINIBAND_ADDR_TRANS=3Dy
>> CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=3Dy
>> CONFIG_INFINIBAND_VIRT_DMA=3Dy
>> # CONFIG_INFINIBAND_MTHCA is not set
>> # CONFIG_INFINIBAND_EFA is not set
>> # CONFIG_INFINIBAND_I40IW is not set
>> # CONFIG_MLX4_INFINIBAND is not set
>> # CONFIG_INFINIBAND_OCRDMA is not set
>> # CONFIG_INFINIBAND_USNIC is not set
>> # CONFIG_INFINIBAND_BNXT_RE is not set
>> # CONFIG_INFINIBAND_RDMAVT is not set
>> CONFIG_RDMA_RXE=3Dm
>> CONFIG_RDMA_SIW=3Dm
>> CONFIG_INFINIBAND_IPOIB=3Dm
>> # CONFIG_INFINIBAND_IPOIB_CM is not set
>> CONFIG_INFINIBAND_IPOIB_DEBUG=3Dy
>> # CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
>> CONFIG_INFINIBAND_SRP=3Dm
>> CONFIG_INFINIBAND_SRPT=3Dm
>> # CONFIG_INFINIBAND_ISER is not set
>> # CONFIG_INFINIBAND_ISERT is not set
>> # CONFIG_INFINIBAND_RTRS_CLIENT is not set
>> # CONFIG_INFINIBAND_RTRS_SERVER is not set
>> # CONFIG_INFINIBAND_OPA_VNIC is not set
>> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
>> CONFIG_EDAC_SUPPORT=3Dy
>> CONFIG_EDAC=3Dy
>> CONFIG_EDAC_LEGACY_SYSFS=3Dy
>> # CONFIG_EDAC_DEBUG is not set
>> CONFIG_EDAC_DECODE_MCE=3Dm
>> CONFIG_EDAC_GHES=3Dy
>> CONFIG_EDAC_AMD64=3Dm
>> CONFIG_EDAC_E752X=3Dm
>> CONFIG_EDAC_I82975X=3Dm
>> CONFIG_EDAC_I3000=3Dm
>> CONFIG_EDAC_I3200=3Dm
>> CONFIG_EDAC_IE31200=3Dm
>> CONFIG_EDAC_X38=3Dm
>> CONFIG_EDAC_I5400=3Dm
>> CONFIG_EDAC_I7CORE=3Dm
>> CONFIG_EDAC_I5000=3Dm
>> CONFIG_EDAC_I5100=3Dm
>> CONFIG_EDAC_I7300=3Dm
>> CONFIG_EDAC_SBRIDGE=3Dm
>> CONFIG_EDAC_SKX=3Dm
>> # CONFIG_EDAC_I10NM is not set
>> CONFIG_EDAC_PND2=3Dm
>> # CONFIG_EDAC_IGEN6 is not set
>> CONFIG_RTC_LIB=3Dy
>> CONFIG_RTC_MC146818_LIB=3Dy
>> CONFIG_RTC_CLASS=3Dy
>> CONFIG_RTC_HCTOSYS=3Dy
>> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
>> # CONFIG_RTC_SYSTOHC is not set
>> # CONFIG_RTC_DEBUG is not set
>> CONFIG_RTC_NVMEM=3Dy
>>
>> #
>> # RTC interfaces
>> #
>> CONFIG_RTC_INTF_SYSFS=3Dy
>> CONFIG_RTC_INTF_PROC=3Dy
>> CONFIG_RTC_INTF_DEV=3Dy
>> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
>> # CONFIG_RTC_DRV_TEST is not set
>>
>> #
>> # I2C RTC drivers
>> #
>> # CONFIG_RTC_DRV_ABB5ZES3 is not set
>> # CONFIG_RTC_DRV_ABEOZ9 is not set
>> # CONFIG_RTC_DRV_ABX80X is not set
>> CONFIG_RTC_DRV_DS1307=3Dm
>> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
>> CONFIG_RTC_DRV_DS1374=3Dm
>> # CONFIG_RTC_DRV_DS1374_WDT is not set
>> CONFIG_RTC_DRV_DS1672=3Dm
>> CONFIG_RTC_DRV_MAX6900=3Dm
>> CONFIG_RTC_DRV_RS5C372=3Dm
>> CONFIG_RTC_DRV_ISL1208=3Dm
>> CONFIG_RTC_DRV_ISL12022=3Dm
>> CONFIG_RTC_DRV_X1205=3Dm
>> CONFIG_RTC_DRV_PCF8523=3Dm
>> # CONFIG_RTC_DRV_PCF85063 is not set
>> # CONFIG_RTC_DRV_PCF85363 is not set
>> CONFIG_RTC_DRV_PCF8563=3Dm
>> CONFIG_RTC_DRV_PCF8583=3Dm
>> CONFIG_RTC_DRV_M41T80=3Dm
>> CONFIG_RTC_DRV_M41T80_WDT=3Dy
>> CONFIG_RTC_DRV_BQ32K=3Dm
>> # CONFIG_RTC_DRV_S35390A is not set
>> CONFIG_RTC_DRV_FM3130=3Dm
>> # CONFIG_RTC_DRV_RX8010 is not set
>> CONFIG_RTC_DRV_RX8581=3Dm
>> CONFIG_RTC_DRV_RX8025=3Dm
>> CONFIG_RTC_DRV_EM3027=3Dm
>> # CONFIG_RTC_DRV_RV3028 is not set
>> # CONFIG_RTC_DRV_RV3032 is not set
>> # CONFIG_RTC_DRV_RV8803 is not set
>> # CONFIG_RTC_DRV_SD3078 is not set
>>
>> #
>> # SPI RTC drivers
>> #
>> # CONFIG_RTC_DRV_M41T93 is not set
>> # CONFIG_RTC_DRV_M41T94 is not set
>> # CONFIG_RTC_DRV_DS1302 is not set
>> # CONFIG_RTC_DRV_DS1305 is not set
>> # CONFIG_RTC_DRV_DS1343 is not set
>> # CONFIG_RTC_DRV_DS1347 is not set
>> # CONFIG_RTC_DRV_DS1390 is not set
>> # CONFIG_RTC_DRV_MAX6916 is not set
>> # CONFIG_RTC_DRV_R9701 is not set
>> CONFIG_RTC_DRV_RX4581=3Dm
>> # CONFIG_RTC_DRV_RS5C348 is not set
>> # CONFIG_RTC_DRV_MAX6902 is not set
>> # CONFIG_RTC_DRV_PCF2123 is not set
>> # CONFIG_RTC_DRV_MCP795 is not set
>> CONFIG_RTC_I2C_AND_SPI=3Dy
>>
>> #
>> # SPI and I2C RTC drivers
>> #
>> CONFIG_RTC_DRV_DS3232=3Dm
>> CONFIG_RTC_DRV_DS3232_HWMON=3Dy
>> # CONFIG_RTC_DRV_PCF2127 is not set
>> CONFIG_RTC_DRV_RV3029C2=3Dm
>> # CONFIG_RTC_DRV_RV3029_HWMON is not set
>> # CONFIG_RTC_DRV_RX6110 is not set
>>
>> #
>> # Platform RTC drivers
>> #
>> CONFIG_RTC_DRV_CMOS=3Dy
>> CONFIG_RTC_DRV_DS1286=3Dm
>> CONFIG_RTC_DRV_DS1511=3Dm
>> CONFIG_RTC_DRV_DS1553=3Dm
>> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
>> CONFIG_RTC_DRV_DS1742=3Dm
>> CONFIG_RTC_DRV_DS2404=3Dm
>> CONFIG_RTC_DRV_STK17TA8=3Dm
>> # CONFIG_RTC_DRV_M48T86 is not set
>> CONFIG_RTC_DRV_M48T35=3Dm
>> CONFIG_RTC_DRV_M48T59=3Dm
>> CONFIG_RTC_DRV_MSM6242=3Dm
>> CONFIG_RTC_DRV_BQ4802=3Dm
>> CONFIG_RTC_DRV_RP5C01=3Dm
>> CONFIG_RTC_DRV_V3020=3Dm
>>
>> #
>> # on-CPU RTC drivers
>> #
>> # CONFIG_RTC_DRV_FTRTC010 is not set
>>
>> #
>> # HID Sensor RTC drivers
>> #
>> CONFIG_DMADEVICES=3Dy
>> # CONFIG_DMADEVICES_DEBUG is not set
>>
>> #
>> # DMA Devices
>> #
>> CONFIG_DMA_ENGINE=3Dy
>> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
>> CONFIG_DMA_ACPI=3Dy
>> # CONFIG_ALTERA_MSGDMA is not set
>> CONFIG_INTEL_IDMA64=3Dm
>> # CONFIG_INTEL_IDXD is not set
>> CONFIG_INTEL_IOATDMA=3Dm
>> # CONFIG_PLX_DMA is not set
>> # CONFIG_XILINX_ZYNQMP_DPDMA is not set
>> # CONFIG_QCOM_HIDMA_MGMT is not set
>> # CONFIG_QCOM_HIDMA is not set
>> CONFIG_DW_DMAC_CORE=3Dy
>> CONFIG_DW_DMAC=3Dm
>> CONFIG_DW_DMAC_PCI=3Dy
>> # CONFIG_DW_EDMA is not set
>> # CONFIG_DW_EDMA_PCIE is not set
>> CONFIG_HSU_DMA=3Dy
>> # CONFIG_SF_PDMA is not set
>> # CONFIG_INTEL_LDMA is not set
>>
>> #
>> # DMA Clients
>> #
>> CONFIG_ASYNC_TX_DMA=3Dy
>> CONFIG_DMATEST=3Dm
>> CONFIG_DMA_ENGINE_RAID=3Dy
>>
>> #
>> # DMABUF options
>> #
>> CONFIG_SYNC_FILE=3Dy
>> # CONFIG_SW_SYNC is not set
>> # CONFIG_UDMABUF is not set
>> # CONFIG_DMABUF_MOVE_NOTIFY is not set
>> # CONFIG_DMABUF_DEBUG is not set
>> # CONFIG_DMABUF_SELFTESTS is not set
>> # CONFIG_DMABUF_HEAPS is not set
>> # end of DMABUF options
>>
>> CONFIG_DCA=3Dm
>> # CONFIG_AUXDISPLAY is not set
>> # CONFIG_PANEL is not set
>> CONFIG_UIO=3Dm
>> CONFIG_UIO_CIF=3Dm
>> CONFIG_UIO_PDRV_GENIRQ=3Dm
>> # CONFIG_UIO_DMEM_GENIRQ is not set
>> CONFIG_UIO_AEC=3Dm
>> CONFIG_UIO_SERCOS3=3Dm
>> CONFIG_UIO_PCI_GENERIC=3Dm
>> # CONFIG_UIO_NETX is not set
>> # CONFIG_UIO_PRUSS is not set
>> # CONFIG_UIO_MF624 is not set
>> CONFIG_UIO_HV_GENERIC=3Dm
>> CONFIG_VFIO_IOMMU_TYPE1=3Dm
>> CONFIG_VFIO_VIRQFD=3Dm
>> CONFIG_VFIO=3Dm
>> CONFIG_VFIO_NOIOMMU=3Dy
>> CONFIG_VFIO_PCI=3Dm
>> # CONFIG_VFIO_PCI_VGA is not set
>> CONFIG_VFIO_PCI_MMAP=3Dy
>> CONFIG_VFIO_PCI_INTX=3Dy
>> # CONFIG_VFIO_PCI_IGD is not set
>> CONFIG_VFIO_MDEV=3Dm
>> CONFIG_VFIO_MDEV_DEVICE=3Dm
>> CONFIG_IRQ_BYPASS_MANAGER=3Dm
>> # CONFIG_VIRT_DRIVERS is not set
>> CONFIG_VIRTIO=3Dy
>> CONFIG_VIRTIO_PCI_LIB=3Dy
>> CONFIG_VIRTIO_MENU=3Dy
>> CONFIG_VIRTIO_PCI=3Dy
>> CONFIG_VIRTIO_PCI_LEGACY=3Dy
>> # CONFIG_VIRTIO_PMEM is not set
>> CONFIG_VIRTIO_BALLOON=3Dm
>> CONFIG_VIRTIO_MEM=3Dm
>> CONFIG_VIRTIO_INPUT=3Dm
>> # CONFIG_VIRTIO_MMIO is not set
>> CONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dm
>> # CONFIG_VDPA is not set
>> CONFIG_VHOST_IOTLB=3Dm
>> CONFIG_VHOST=3Dm
>> CONFIG_VHOST_MENU=3Dy
>> CONFIG_VHOST_NET=3Dm
>> # CONFIG_VHOST_SCSI is not set
>> CONFIG_VHOST_VSOCK=3Dm
>> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
>>
>> #
>> # Microsoft Hyper-V guest support
>> #
>> CONFIG_HYPERV=3Dm
>> CONFIG_HYPERV_TIMER=3Dy
>> CONFIG_HYPERV_UTILS=3Dm
>> CONFIG_HYPERV_BALLOON=3Dm
>> # end of Microsoft Hyper-V guest support
>>
>> #
>> # Xen driver support
>> #
>> # CONFIG_XEN_BALLOON is not set
>> CONFIG_XEN_DEV_EVTCHN=3Dm
>> # CONFIG_XEN_BACKEND is not set
>> CONFIG_XENFS=3Dm
>> CONFIG_XEN_COMPAT_XENFS=3Dy
>> CONFIG_XEN_SYS_HYPERVISOR=3Dy
>> CONFIG_XEN_XENBUS_FRONTEND=3Dy
>> # CONFIG_XEN_GNTDEV is not set
>> # CONFIG_XEN_GRANT_DEV_ALLOC is not set
>> # CONFIG_XEN_GRANT_DMA_ALLOC is not set
>> CONFIG_SWIOTLB_XEN=3Dy
>> # CONFIG_XEN_PVCALLS_FRONTEND is not set
>> CONFIG_XEN_PRIVCMD=3Dm
>> CONFIG_XEN_EFI=3Dy
>> CONFIG_XEN_AUTO_XLATE=3Dy
>> CONFIG_XEN_ACPI=3Dy
>> # CONFIG_XEN_UNPOPULATED_ALLOC is not set
>> # end of Xen driver support
>>
>> # CONFIG_GREYBUS is not set
>> # CONFIG_STAGING is not set
>> CONFIG_X86_PLATFORM_DEVICES=3Dy
>> CONFIG_ACPI_WMI=3Dm
>> CONFIG_WMI_BMOF=3Dm
>> # CONFIG_HUAWEI_WMI is not set
>> # CONFIG_UV_SYSFS is not set
>> # CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
>> CONFIG_INTEL_WMI_THUNDERBOLT=3Dm
>> CONFIG_MXM_WMI=3Dm
>> # CONFIG_PEAQ_WMI is not set
>> # CONFIG_XIAOMI_WMI is not set
>> CONFIG_ACERHDF=3Dm
>> # CONFIG_ACER_WIRELESS is not set
>> CONFIG_ACER_WMI=3Dm
>> # CONFIG_AMD_PMC is not set
>> CONFIG_APPLE_GMUX=3Dm
>> CONFIG_ASUS_LAPTOP=3Dm
>> # CONFIG_ASUS_WIRELESS is not set
>> CONFIG_ASUS_WMI=3Dm
>> CONFIG_ASUS_NB_WMI=3Dm
>> CONFIG_EEEPC_LAPTOP=3Dm
>> CONFIG_EEEPC_WMI=3Dm
>> # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
>> CONFIG_AMILO_RFKILL=3Dm
>> CONFIG_FUJITSU_LAPTOP=3Dm
>> CONFIG_FUJITSU_TABLET=3Dm
>> # CONFIG_GPD_POCKET_FAN is not set
>> CONFIG_HP_ACCEL=3Dm
>> CONFIG_HP_WIRELESS=3Dm
>> CONFIG_HP_WMI=3Dm
>> # CONFIG_IBM_RTL is not set
>> CONFIG_IDEAPAD_LAPTOP=3Dm
>> CONFIG_SENSORS_HDAPS=3Dm
>> CONFIG_THINKPAD_ACPI=3Dm
>> # CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
>> # CONFIG_THINKPAD_ACPI_DEBUG is not set
>> # CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
>> CONFIG_THINKPAD_ACPI_VIDEO=3Dy
>> CONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy
>> # CONFIG_INTEL_ATOMISP2_PM is not set
>> CONFIG_INTEL_HID_EVENT=3Dm
>> # CONFIG_INTEL_INT0002_VGPIO is not set
>> # CONFIG_INTEL_MENLOW is not set
>> CONFIG_INTEL_OAKTRAIL=3Dm
>> CONFIG_INTEL_VBTN=3Dm
>> CONFIG_MSI_LAPTOP=3Dm
>> CONFIG_MSI_WMI=3Dm
>> # CONFIG_PCENGINES_APU2 is not set
>> CONFIG_SAMSUNG_LAPTOP=3Dm
>> CONFIG_SAMSUNG_Q10=3Dm
>> CONFIG_TOSHIBA_BT_RFKILL=3Dm
>> # CONFIG_TOSHIBA_HAPS is not set
>> # CONFIG_TOSHIBA_WMI is not set
>> CONFIG_ACPI_CMPC=3Dm
>> CONFIG_COMPAL_LAPTOP=3Dm
>> # CONFIG_LG_LAPTOP is not set
>> CONFIG_PANASONIC_LAPTOP=3Dm
>> CONFIG_SONY_LAPTOP=3Dm
>> CONFIG_SONYPI_COMPAT=3Dy
>> # CONFIG_SYSTEM76_ACPI is not set
>> CONFIG_TOPSTAR_LAPTOP=3Dm
>> # CONFIG_I2C_MULTI_INSTANTIATE is not set
>> CONFIG_MLX_PLATFORM=3Dm
>> CONFIG_INTEL_IPS=3Dm
>> CONFIG_INTEL_RST=3Dm
>> # CONFIG_INTEL_SMARTCONNECT is not set
>>
>> #
>> # Intel Speed Select Technology interface support
>> #
>> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
>> # end of Intel Speed Select Technology interface support
>>
>> CONFIG_INTEL_TURBO_MAX_3=3Dy
>> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
>> CONFIG_INTEL_PMC_CORE=3Dm
>> # CONFIG_INTEL_PUNIT_IPC is not set
>> # CONFIG_INTEL_SCU_PCI is not set
>> # CONFIG_INTEL_SCU_PLATFORM is not set
>> CONFIG_PMC_ATOM=3Dy
>> # CONFIG_CHROME_PLATFORMS is not set
>> CONFIG_MELLANOX_PLATFORM=3Dy
>> CONFIG_MLXREG_HOTPLUG=3Dm
>> # CONFIG_MLXREG_IO is not set
>> CONFIG_SURFACE_PLATFORMS=3Dy
>> # CONFIG_SURFACE3_WMI is not set
>> # CONFIG_SURFACE_3_POWER_OPREGION is not set
>> # CONFIG_SURFACE_GPE is not set
>> # CONFIG_SURFACE_HOTPLUG is not set
>> # CONFIG_SURFACE_PRO3_BUTTON is not set
>> CONFIG_HAVE_CLK=3Dy
>> CONFIG_CLKDEV_LOOKUP=3Dy
>> CONFIG_HAVE_CLK_PREPARE=3Dy
>> CONFIG_COMMON_CLK=3Dy
>> # CONFIG_COMMON_CLK_MAX9485 is not set
>> # CONFIG_COMMON_CLK_SI5341 is not set
>> # CONFIG_COMMON_CLK_SI5351 is not set
>> # CONFIG_COMMON_CLK_SI544 is not set
>> # CONFIG_COMMON_CLK_CDCE706 is not set
>> # CONFIG_COMMON_CLK_CS2000_CP is not set
>> # CONFIG_COMMON_CLK_PWM is not set
>> # CONFIG_XILINX_VCU is not set
>> CONFIG_HWSPINLOCK=3Dy
>>
>> #
>> # Clock Source drivers
>> #
>> CONFIG_CLKEVT_I8253=3Dy
>> CONFIG_I8253_LOCK=3Dy
>> CONFIG_CLKBLD_I8253=3Dy
>> # end of Clock Source drivers
>>
>> CONFIG_MAILBOX=3Dy
>> CONFIG_PCC=3Dy
>> # CONFIG_ALTERA_MBOX is not set
>> CONFIG_IOMMU_IOVA=3Dy
>> CONFIG_IOASID=3Dy
>> CONFIG_IOMMU_API=3Dy
>> CONFIG_IOMMU_SUPPORT=3Dy
>>
>> #
>> # Generic IOMMU Pagetable Support
>> #
>> CONFIG_IOMMU_IO_PGTABLE=3Dy
>> # end of Generic IOMMU Pagetable Support
>>
>> # CONFIG_IOMMU_DEBUGFS is not set
>> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
>> CONFIG_IOMMU_DMA=3Dy
>> CONFIG_AMD_IOMMU=3Dy
>> CONFIG_AMD_IOMMU_V2=3Dm
>> CONFIG_DMAR_TABLE=3Dy
>> CONFIG_INTEL_IOMMU=3Dy
>> # CONFIG_INTEL_IOMMU_SVM is not set
>> # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
>> CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
>> # CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
>> CONFIG_IRQ_REMAP=3Dy
>> CONFIG_HYPERV_IOMMU=3Dy
>>
>> #
>> # Remoteproc drivers
>> #
>> # CONFIG_REMOTEPROC is not set
>> # end of Remoteproc drivers
>>
>> #
>> # Rpmsg drivers
>> #
>> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
>> # CONFIG_RPMSG_VIRTIO is not set
>> # end of Rpmsg drivers
>>
>> # CONFIG_SOUNDWIRE is not set
>>
>> #
>> # SOC (System On Chip) specific Drivers
>> #
>>
>> #
>> # Amlogic SoC drivers
>> #
>> # end of Amlogic SoC drivers
>>
>> #
>> # Broadcom SoC drivers
>> #
>> # end of Broadcom SoC drivers
>>
>> #
>> # NXP/Freescale QorIQ SoC drivers
>> #
>> # end of NXP/Freescale QorIQ SoC drivers
>>
>> #
>> # i.MX SoC drivers
>> #
>> # end of i.MX SoC drivers
>>
>> #
>> # Enable LiteX SoC Builder specific drivers
>> #
>> # end of Enable LiteX SoC Builder specific drivers
>>
>> #
>> # Qualcomm SoC drivers
>> #
>> # end of Qualcomm SoC drivers
>>
>> # CONFIG_SOC_TI is not set
>>
>> #
>> # Xilinx SoC drivers
>> #
>> # end of Xilinx SoC drivers
>> # end of SOC (System On Chip) specific Drivers
>>
>> # CONFIG_PM_DEVFREQ is not set
>> # CONFIG_EXTCON is not set
>> # CONFIG_MEMORY is not set
>> # CONFIG_IIO is not set
>> CONFIG_NTB=3Dm
>> # CONFIG_NTB_MSI is not set
>> # CONFIG_NTB_AMD is not set
>> # CONFIG_NTB_IDT is not set
>> # CONFIG_NTB_INTEL is not set
>> # CONFIG_NTB_EPF is not set
>> # CONFIG_NTB_SWITCHTEC is not set
>> # CONFIG_NTB_PINGPONG is not set
>> # CONFIG_NTB_TOOL is not set
>> # CONFIG_NTB_PERF is not set
>> # CONFIG_NTB_TRANSPORT is not set
>> # CONFIG_VME_BUS is not set
>> CONFIG_PWM=3Dy
>> CONFIG_PWM_SYSFS=3Dy
>> # CONFIG_PWM_DEBUG is not set
>> # CONFIG_PWM_DWC is not set
>> CONFIG_PWM_LPSS=3Dm
>> CONFIG_PWM_LPSS_PCI=3Dm
>> CONFIG_PWM_LPSS_PLATFORM=3Dm
>> # CONFIG_PWM_PCA9685 is not set
>>
>> #
>> # IRQ chip support
>> #
>> # end of IRQ chip support
>>
>> # CONFIG_IPACK_BUS is not set
>> # CONFIG_RESET_CONTROLLER is not set
>>
>> #
>> # PHY Subsystem
>> #
>> # CONFIG_GENERIC_PHY is not set
>> # CONFIG_USB_LGM_PHY is not set
>> # CONFIG_BCM_KONA_USB2_PHY is not set
>> # CONFIG_PHY_PXA_28NM_HSIC is not set
>> # CONFIG_PHY_PXA_28NM_USB2 is not set
>> # CONFIG_PHY_INTEL_LGM_EMMC is not set
>> # end of PHY Subsystem
>>
>> CONFIG_POWERCAP=3Dy
>> CONFIG_INTEL_RAPL_CORE=3Dm
>> CONFIG_INTEL_RAPL=3Dm
>> # CONFIG_IDLE_INJECT is not set
>> # CONFIG_DTPM is not set
>> # CONFIG_MCB is not set
>>
>> #
>> # Performance monitor support
>> #
>> # end of Performance monitor support
>>
>> CONFIG_RAS=3Dy
>> # CONFIG_RAS_CEC is not set
>> # CONFIG_USB4 is not set
>>
>> #
>> # Android
>> #
>> # CONFIG_ANDROID is not set
>> # end of Android
>>
>> CONFIG_LIBNVDIMM=3Dm
>> CONFIG_BLK_DEV_PMEM=3Dm
>> CONFIG_ND_BLK=3Dm
>> CONFIG_ND_CLAIM=3Dy
>> CONFIG_ND_BTT=3Dm
>> CONFIG_BTT=3Dy
>> CONFIG_ND_PFN=3Dm
>> CONFIG_NVDIMM_PFN=3Dy
>> CONFIG_NVDIMM_DAX=3Dy
>> CONFIG_NVDIMM_KEYS=3Dy
>> CONFIG_DAX_DRIVER=3Dy
>> CONFIG_DAX=3Dy
>> CONFIG_DEV_DAX=3Dm
>> CONFIG_DEV_DAX_PMEM=3Dm
>> CONFIG_DEV_DAX_KMEM=3Dm
>> CONFIG_DEV_DAX_PMEM_COMPAT=3Dm
>> CONFIG_NVMEM=3Dy
>> CONFIG_NVMEM_SYSFS=3Dy
>> # CONFIG_NVMEM_RMEM is not set
>>
>> #
>> # HW tracing support
>> #
>> CONFIG_STM=3Dm
>> # CONFIG_STM_PROTO_BASIC is not set
>> # CONFIG_STM_PROTO_SYS_T is not set
>> CONFIG_STM_DUMMY=3Dm
>> CONFIG_STM_SOURCE_CONSOLE=3Dm
>> CONFIG_STM_SOURCE_HEARTBEAT=3Dm
>> CONFIG_STM_SOURCE_FTRACE=3Dm
>> CONFIG_INTEL_TH=3Dm
>> CONFIG_INTEL_TH_PCI=3Dm
>> CONFIG_INTEL_TH_ACPI=3Dm
>> CONFIG_INTEL_TH_GTH=3Dm
>> CONFIG_INTEL_TH_STH=3Dm
>> CONFIG_INTEL_TH_MSU=3Dm
>> CONFIG_INTEL_TH_PTI=3Dm
>> # CONFIG_INTEL_TH_DEBUG is not set
>> # end of HW tracing support
>>
>> # CONFIG_FPGA is not set
>> # CONFIG_TEE is not set
>> # CONFIG_UNISYS_VISORBUS is not set
>> # CONFIG_SIOX is not set
>> # CONFIG_SLIMBUS is not set
>> # CONFIG_INTERCONNECT is not set
>> # CONFIG_COUNTER is not set
>> # CONFIG_MOST is not set
>> # end of Device Drivers
>>
>> #
>> # File systems
>> #
>> CONFIG_DCACHE_WORD_ACCESS=3Dy
>> # CONFIG_VALIDATE_FS_PARSER is not set
>> CONFIG_FS_IOMAP=3Dy
>> CONFIG_EXT2_FS=3Dm
>> CONFIG_EXT2_FS_XATTR=3Dy
>> CONFIG_EXT2_FS_POSIX_ACL=3Dy
>> CONFIG_EXT2_FS_SECURITY=3Dy
>> # CONFIG_EXT3_FS is not set
>> CONFIG_EXT4_FS=3Dy
>> CONFIG_EXT4_FS_POSIX_ACL=3Dy
>> CONFIG_EXT4_FS_SECURITY=3Dy
>> # CONFIG_EXT4_DEBUG is not set
>> CONFIG_EXT4_KUNIT_TESTS=3Dm
>> CONFIG_JBD2=3Dy
>> # CONFIG_JBD2_DEBUG is not set
>> CONFIG_FS_MBCACHE=3Dy
>> # CONFIG_REISERFS_FS is not set
>> # CONFIG_JFS_FS is not set
>> CONFIG_XFS_FS=3Dm
>> CONFIG_XFS_SUPPORT_V4=3Dy
>> CONFIG_XFS_QUOTA=3Dy
>> CONFIG_XFS_POSIX_ACL=3Dy
>> CONFIG_XFS_RT=3Dy
>> CONFIG_XFS_ONLINE_SCRUB=3Dy
>> CONFIG_XFS_ONLINE_REPAIR=3Dy
>> CONFIG_XFS_DEBUG=3Dy
>> CONFIG_XFS_ASSERT_FATAL=3Dy
>> CONFIG_GFS2_FS=3Dm
>> CONFIG_GFS2_FS_LOCKING_DLM=3Dy
>> CONFIG_OCFS2_FS=3Dm
>> CONFIG_OCFS2_FS_O2CB=3Dm
>> CONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dm
>> CONFIG_OCFS2_FS_STATS=3Dy
>> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
>> # CONFIG_OCFS2_DEBUG_FS is not set
>> CONFIG_BTRFS_FS=3Dm
>> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
>> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
>> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
>> # CONFIG_BTRFS_DEBUG is not set
>> # CONFIG_BTRFS_ASSERT is not set
>> # CONFIG_BTRFS_FS_REF_VERIFY is not set
>> # CONFIG_NILFS2_FS is not set
>> CONFIG_F2FS_FS=3Dm
>> CONFIG_F2FS_STAT_FS=3Dy
>> CONFIG_F2FS_FS_XATTR=3Dy
>> CONFIG_F2FS_FS_POSIX_ACL=3Dy
>> CONFIG_F2FS_FS_SECURITY=3Dy
>> # CONFIG_F2FS_CHECK_FS is not set
>> # CONFIG_F2FS_FAULT_INJECTION is not set
>> # CONFIG_F2FS_FS_COMPRESSION is not set
>> # CONFIG_ZONEFS_FS is not set
>> CONFIG_FS_DAX=3Dy
>> CONFIG_FS_DAX_PMD=3Dy
>> CONFIG_FS_POSIX_ACL=3Dy
>> CONFIG_EXPORTFS=3Dy
>> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
>> CONFIG_FILE_LOCKING=3Dy
>> CONFIG_MANDATORY_FILE_LOCKING=3Dy
>> CONFIG_FS_ENCRYPTION=3Dy
>> CONFIG_FS_ENCRYPTION_ALGS=3Dy
>> # CONFIG_FS_VERITY is not set
>> CONFIG_FSNOTIFY=3Dy
>> CONFIG_DNOTIFY=3Dy
>> CONFIG_INOTIFY_USER=3Dy
>> CONFIG_FANOTIFY=3Dy
>> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
>> CONFIG_QUOTA=3Dy
>> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
>> CONFIG_PRINT_QUOTA_WARNING=3Dy
>> # CONFIG_QUOTA_DEBUG is not set
>> CONFIG_QUOTA_TREE=3Dy
>> # CONFIG_QFMT_V1 is not set
>> CONFIG_QFMT_V2=3Dy
>> CONFIG_QUOTACTL=3Dy
>> CONFIG_AUTOFS4_FS=3Dy
>> CONFIG_AUTOFS_FS=3Dy
>> CONFIG_FUSE_FS=3Dm
>> CONFIG_CUSE=3Dm
>> # CONFIG_VIRTIO_FS is not set
>> CONFIG_OVERLAY_FS=3Dm
>> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
>> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
>> # CONFIG_OVERLAY_FS_INDEX is not set
>> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
>> # CONFIG_OVERLAY_FS_METACOPY is not set
>>
>> #
>> # Caches
>> #
>> CONFIG_FSCACHE=3Dm
>> CONFIG_FSCACHE_STATS=3Dy
>> # CONFIG_FSCACHE_HISTOGRAM is not set
>> # CONFIG_FSCACHE_DEBUG is not set
>> # CONFIG_FSCACHE_OBJECT_LIST is not set
>> CONFIG_CACHEFILES=3Dm
>> # CONFIG_CACHEFILES_DEBUG is not set
>> # CONFIG_CACHEFILES_HISTOGRAM is not set
>> # end of Caches
>>
>> #
>> # CD-ROM/DVD Filesystems
>> #
>> CONFIG_ISO9660_FS=3Dm
>> CONFIG_JOLIET=3Dy
>> CONFIG_ZISOFS=3Dy
>> CONFIG_UDF_FS=3Dm
>> # end of CD-ROM/DVD Filesystems
>>
>> #
>> # DOS/FAT/EXFAT/NT Filesystems
>> #
>> CONFIG_FAT_FS=3Dm
>> CONFIG_MSDOS_FS=3Dm
>> CONFIG_VFAT_FS=3Dm
>> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
>> CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
>> # CONFIG_FAT_DEFAULT_UTF8 is not set
>> # CONFIG_EXFAT_FS is not set
>> # CONFIG_NTFS_FS is not set
>> # end of DOS/FAT/EXFAT/NT Filesystems
>>
>> #
>> # Pseudo filesystems
>> #
>> CONFIG_PROC_FS=3Dy
>> CONFIG_PROC_KCORE=3Dy
>> CONFIG_PROC_VMCORE=3Dy
>> CONFIG_PROC_VMCORE_DEVICE_DUMP=3Dy
>> CONFIG_PROC_SYSCTL=3Dy
>> CONFIG_PROC_PAGE_MONITOR=3Dy
>> CONFIG_PROC_CHILDREN=3Dy
>> CONFIG_PROC_PID_ARCH_STATUS=3Dy
>> CONFIG_PROC_CPU_RESCTRL=3Dy
>> CONFIG_KERNFS=3Dy
>> CONFIG_SYSFS=3Dy
>> CONFIG_TMPFS=3Dy
>> CONFIG_TMPFS_POSIX_ACL=3Dy
>> CONFIG_TMPFS_XATTR=3Dy
>> # CONFIG_TMPFS_INODE64 is not set
>> CONFIG_HUGETLBFS=3Dy
>> CONFIG_HUGETLB_PAGE=3Dy
>> CONFIG_MEMFD_CREATE=3Dy
>> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
>> CONFIG_CONFIGFS_FS=3Dy
>> CONFIG_EFIVAR_FS=3Dy
>> # end of Pseudo filesystems
>>
>> CONFIG_MISC_FILESYSTEMS=3Dy
>> # CONFIG_ORANGEFS_FS is not set
>> # CONFIG_ADFS_FS is not set
>> # CONFIG_AFFS_FS is not set
>> # CONFIG_ECRYPT_FS is not set
>> # CONFIG_HFS_FS is not set
>> # CONFIG_HFSPLUS_FS is not set
>> # CONFIG_BEFS_FS is not set
>> # CONFIG_BFS_FS is not set
>> # CONFIG_EFS_FS is not set
>> CONFIG_CRAMFS=3Dm
>> CONFIG_CRAMFS_BLOCKDEV=3Dy
>> CONFIG_SQUASHFS=3Dm
>> # CONFIG_SQUASHFS_FILE_CACHE is not set
>> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
>> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
>> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
>> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
>> CONFIG_SQUASHFS_XATTR=3Dy
>> CONFIG_SQUASHFS_ZLIB=3Dy
>> # CONFIG_SQUASHFS_LZ4 is not set
>> CONFIG_SQUASHFS_LZO=3Dy
>> CONFIG_SQUASHFS_XZ=3Dy
>> # CONFIG_SQUASHFS_ZSTD is not set
>> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
>> # CONFIG_SQUASHFS_EMBEDDED is not set
>> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
>> # CONFIG_VXFS_FS is not set
>> CONFIG_MINIX_FS=3Dm
>> # CONFIG_OMFS_FS is not set
>> # CONFIG_HPFS_FS is not set
>> # CONFIG_QNX4FS_FS is not set
>> # CONFIG_QNX6FS_FS is not set
>> # CONFIG_ROMFS_FS is not set
>> CONFIG_PSTORE=3Dy
>> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
>> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
>> # CONFIG_PSTORE_LZO_COMPRESS is not set
>> # CONFIG_PSTORE_LZ4_COMPRESS is not set
>> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
>> # CONFIG_PSTORE_842_COMPRESS is not set
>> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
>> CONFIG_PSTORE_COMPRESS=3Dy
>> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
>> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
>> # CONFIG_PSTORE_CONSOLE is not set
>> # CONFIG_PSTORE_PMSG is not set
>> # CONFIG_PSTORE_FTRACE is not set
>> CONFIG_PSTORE_RAM=3Dm
>> # CONFIG_PSTORE_BLK is not set
>> # CONFIG_SYSV_FS is not set
>> # CONFIG_UFS_FS is not set
>> # CONFIG_EROFS_FS is not set
>> CONFIG_NETWORK_FILESYSTEMS=3Dy
>> CONFIG_NFS_FS=3Dy
>> # CONFIG_NFS_V2 is not set
>> CONFIG_NFS_V3=3Dy
>> CONFIG_NFS_V3_ACL=3Dy
>> CONFIG_NFS_V4=3Dm
>> # CONFIG_NFS_SWAP is not set
>> CONFIG_NFS_V4_1=3Dy
>> CONFIG_NFS_V4_2=3Dy
>> CONFIG_PNFS_FILE_LAYOUT=3Dm
>> CONFIG_PNFS_BLOCK=3Dm
>> CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
>> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
>> # CONFIG_NFS_V4_1_MIGRATION is not set
>> CONFIG_NFS_V4_SECURITY_LABEL=3Dy
>> CONFIG_ROOT_NFS=3Dy
>> # CONFIG_NFS_USE_LEGACY_DNS is not set
>> CONFIG_NFS_USE_KERNEL_DNS=3Dy
>> CONFIG_NFS_DEBUG=3Dy
>> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
>> # CONFIG_NFS_V4_2_READ_PLUS is not set
>> CONFIG_NFSD=3Dm
>> CONFIG_NFSD_V2_ACL=3Dy
>> CONFIG_NFSD_V3=3Dy
>> CONFIG_NFSD_V3_ACL=3Dy
>> CONFIG_NFSD_V4=3Dy
>> CONFIG_NFSD_PNFS=3Dy
>> # CONFIG_NFSD_BLOCKLAYOUT is not set
>> CONFIG_NFSD_SCSILAYOUT=3Dy
>> # CONFIG_NFSD_FLEXFILELAYOUT is not set
>> # CONFIG_NFSD_V4_2_INTER_SSC is not set
>> CONFIG_NFSD_V4_SECURITY_LABEL=3Dy
>> CONFIG_GRACE_PERIOD=3Dy
>> CONFIG_LOCKD=3Dy
>> CONFIG_LOCKD_V4=3Dy
>> CONFIG_NFS_ACL_SUPPORT=3Dy
>> CONFIG_NFS_COMMON=3Dy
>> CONFIG_NFS_V4_2_SSC_HELPER=3Dy
>> CONFIG_SUNRPC=3Dy
>> CONFIG_SUNRPC_GSS=3Dm
>> CONFIG_SUNRPC_BACKCHANNEL=3Dy
>> CONFIG_RPCSEC_GSS_KRB5=3Dm
>> # CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
>> CONFIG_SUNRPC_DEBUG=3Dy
>> CONFIG_SUNRPC_XPRT_RDMA=3Dm
>> CONFIG_CEPH_FS=3Dm
>> # CONFIG_CEPH_FSCACHE is not set
>> CONFIG_CEPH_FS_POSIX_ACL=3Dy
>> # CONFIG_CEPH_FS_SECURITY_LABEL is not set
>> CONFIG_CIFS=3Dm
>> # CONFIG_CIFS_STATS2 is not set
>> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
>> CONFIG_CIFS_WEAK_PW_HASH=3Dy
>> CONFIG_CIFS_UPCALL=3Dy
>> CONFIG_CIFS_XATTR=3Dy
>> CONFIG_CIFS_POSIX=3Dy
>> CONFIG_CIFS_DEBUG=3Dy
>> # CONFIG_CIFS_DEBUG2 is not set
>> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
>> CONFIG_CIFS_DFS_UPCALL=3Dy
>> # CONFIG_CIFS_SWN_UPCALL is not set
>> # CONFIG_CIFS_SMB_DIRECT is not set
>> # CONFIG_CIFS_FSCACHE is not set
>> # CONFIG_CODA_FS is not set
>> # CONFIG_AFS_FS is not set
>> # CONFIG_9P_FS is not set
>> CONFIG_NLS=3Dy
>> CONFIG_NLS_DEFAULT=3D"utf8"
>> CONFIG_NLS_CODEPAGE_437=3Dy
>> CONFIG_NLS_CODEPAGE_737=3Dm
>> CONFIG_NLS_CODEPAGE_775=3Dm
>> CONFIG_NLS_CODEPAGE_850=3Dm
>> CONFIG_NLS_CODEPAGE_852=3Dm
>> CONFIG_NLS_CODEPAGE_855=3Dm
>> CONFIG_NLS_CODEPAGE_857=3Dm
>> CONFIG_NLS_CODEPAGE_860=3Dm
>> CONFIG_NLS_CODEPAGE_861=3Dm
>> CONFIG_NLS_CODEPAGE_862=3Dm
>> CONFIG_NLS_CODEPAGE_863=3Dm
>> CONFIG_NLS_CODEPAGE_864=3Dm
>> CONFIG_NLS_CODEPAGE_865=3Dm
>> CONFIG_NLS_CODEPAGE_866=3Dm
>> CONFIG_NLS_CODEPAGE_869=3Dm
>> CONFIG_NLS_CODEPAGE_936=3Dm
>> CONFIG_NLS_CODEPAGE_950=3Dm
>> CONFIG_NLS_CODEPAGE_932=3Dm
>> CONFIG_NLS_CODEPAGE_949=3Dm
>> CONFIG_NLS_CODEPAGE_874=3Dm
>> CONFIG_NLS_ISO8859_8=3Dm
>> CONFIG_NLS_CODEPAGE_1250=3Dm
>> CONFIG_NLS_CODEPAGE_1251=3Dm
>> CONFIG_NLS_ASCII=3Dy
>> CONFIG_NLS_ISO8859_1=3Dm
>> CONFIG_NLS_ISO8859_2=3Dm
>> CONFIG_NLS_ISO8859_3=3Dm
>> CONFIG_NLS_ISO8859_4=3Dm
>> CONFIG_NLS_ISO8859_5=3Dm
>> CONFIG_NLS_ISO8859_6=3Dm
>> CONFIG_NLS_ISO8859_7=3Dm
>> CONFIG_NLS_ISO8859_9=3Dm
>> CONFIG_NLS_ISO8859_13=3Dm
>> CONFIG_NLS_ISO8859_14=3Dm
>> CONFIG_NLS_ISO8859_15=3Dm
>> CONFIG_NLS_KOI8_R=3Dm
>> CONFIG_NLS_KOI8_U=3Dm
>> CONFIG_NLS_MAC_ROMAN=3Dm
>> CONFIG_NLS_MAC_CELTIC=3Dm
>> CONFIG_NLS_MAC_CENTEURO=3Dm
>> CONFIG_NLS_MAC_CROATIAN=3Dm
>> CONFIG_NLS_MAC_CYRILLIC=3Dm
>> CONFIG_NLS_MAC_GAELIC=3Dm
>> CONFIG_NLS_MAC_GREEK=3Dm
>> CONFIG_NLS_MAC_ICELAND=3Dm
>> CONFIG_NLS_MAC_INUIT=3Dm
>> CONFIG_NLS_MAC_ROMANIAN=3Dm
>> CONFIG_NLS_MAC_TURKISH=3Dm
>> CONFIG_NLS_UTF8=3Dm
>> CONFIG_DLM=3Dm
>> CONFIG_DLM_DEBUG=3Dy
>> # CONFIG_UNICODE is not set
>> CONFIG_IO_WQ=3Dy
>> # end of File systems
>>
>> #
>> # Security options
>> #
>> CONFIG_KEYS=3Dy
>> # CONFIG_KEYS_REQUEST_CACHE is not set
>> CONFIG_PERSISTENT_KEYRINGS=3Dy
>> CONFIG_TRUSTED_KEYS=3Dy
>> CONFIG_ENCRYPTED_KEYS=3Dy
>> # CONFIG_KEY_DH_OPERATIONS is not set
>> # CONFIG_SECURITY_DMESG_RESTRICT is not set
>> CONFIG_SECURITY=3Dy
>> CONFIG_SECURITY_WRITABLE_HOOKS=3Dy
>> CONFIG_SECURITYFS=3Dy
>> CONFIG_SECURITY_NETWORK=3Dy
>> CONFIG_PAGE_TABLE_ISOLATION=3Dy
>> # CONFIG_SECURITY_INFINIBAND is not set
>> CONFIG_SECURITY_NETWORK_XFRM=3Dy
>> CONFIG_SECURITY_PATH=3Dy
>> CONFIG_INTEL_TXT=3Dy
>> CONFIG_LSM_MMAP_MIN_ADDR=3D65535
>> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
>> CONFIG_HARDENED_USERCOPY=3Dy
>> CONFIG_HARDENED_USERCOPY_FALLBACK=3Dy
>> CONFIG_FORTIFY_SOURCE=3Dy
>> # CONFIG_STATIC_USERMODEHELPER is not set
>> CONFIG_SECURITY_SELINUX=3Dy
>> CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
>> CONFIG_SECURITY_SELINUX_DISABLE=3Dy
>> CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
>> CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
>> CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
>> CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D9
>> CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256
>> # CONFIG_SECURITY_SMACK is not set
>> # CONFIG_SECURITY_TOMOYO is not set
>> CONFIG_SECURITY_APPARMOR=3Dy
>> CONFIG_SECURITY_APPARMOR_HASH=3Dy
>> CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
>> # CONFIG_SECURITY_APPARMOR_DEBUG is not set
>> # CONFIG_SECURITY_APPARMOR_KUNIT_TEST is not set
>> # CONFIG_SECURITY_LOADPIN is not set
>> CONFIG_SECURITY_YAMA=3Dy
>> # CONFIG_SECURITY_SAFESETID is not set
>> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
>> CONFIG_INTEGRITY=3Dy
>> CONFIG_INTEGRITY_SIGNATURE=3Dy
>> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
>> CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
>> # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
>> CONFIG_INTEGRITY_AUDIT=3Dy
>> CONFIG_IMA=3Dy
>> CONFIG_IMA_MEASURE_PCR_IDX=3D10
>> CONFIG_IMA_LSM_RULES=3Dy
>> # CONFIG_IMA_TEMPLATE is not set
>> CONFIG_IMA_NG_TEMPLATE=3Dy
>> # CONFIG_IMA_SIG_TEMPLATE is not set
>> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
>> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
>> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
>> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
>> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
>> # CONFIG_IMA_WRITE_POLICY is not set
>> # CONFIG_IMA_READ_POLICY is not set
>> CONFIG_IMA_APPRAISE=3Dy
>> # CONFIG_IMA_ARCH_POLICY is not set
>> # CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
>> CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
>> # CONFIG_IMA_APPRAISE_MODSIG is not set
>> CONFIG_IMA_TRUSTED_KEYRING=3Dy
>> # CONFIG_IMA_BLACKLIST_KEYRING is not set
>> # CONFIG_IMA_LOAD_X509 is not set
>> CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
>> CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=3Dy
>> # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
>> CONFIG_EVM=3Dy
>> CONFIG_EVM_ATTR_FSUUID=3Dy
>> # CONFIG_EVM_ADD_XATTRS is not set
>> # CONFIG_EVM_LOAD_X509 is not set
>> CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
>> # CONFIG_DEFAULT_SECURITY_APPARMOR is not set
>> # CONFIG_DEFAULT_SECURITY_DAC is not set
>> CONFIG_LSM=3D"lockdown,yama,loadpin,safesetid,integrity,selinux,smack,to=
moyo,apparmor,bpf"
>>
>> #
>> # Kernel hardening options
>> #
>>
>> #
>> # Memory initialization
>> #
>> CONFIG_INIT_STACK_NONE=3Dy
>> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
>> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
>> # end of Memory initialization
>> # end of Kernel hardening options
>> # end of Security options
>>
>> CONFIG_XOR_BLOCKS=3Dm
>> CONFIG_ASYNC_CORE=3Dm
>> CONFIG_ASYNC_MEMCPY=3Dm
>> CONFIG_ASYNC_XOR=3Dm
>> CONFIG_ASYNC_PQ=3Dm
>> CONFIG_ASYNC_RAID6_RECOV=3Dm
>> CONFIG_CRYPTO=3Dy
>>
>> #
>> # Crypto core or helper
>> #
>> CONFIG_CRYPTO_ALGAPI=3Dy
>> CONFIG_CRYPTO_ALGAPI2=3Dy
>> CONFIG_CRYPTO_AEAD=3Dy
>> CONFIG_CRYPTO_AEAD2=3Dy
>> CONFIG_CRYPTO_SKCIPHER=3Dy
>> CONFIG_CRYPTO_SKCIPHER2=3Dy
>> CONFIG_CRYPTO_HASH=3Dy
>> CONFIG_CRYPTO_HASH2=3Dy
>> CONFIG_CRYPTO_RNG=3Dy
>> CONFIG_CRYPTO_RNG2=3Dy
>> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
>> CONFIG_CRYPTO_AKCIPHER2=3Dy
>> CONFIG_CRYPTO_AKCIPHER=3Dy
>> CONFIG_CRYPTO_KPP2=3Dy
>> CONFIG_CRYPTO_KPP=3Dm
>> CONFIG_CRYPTO_ACOMP2=3Dy
>> CONFIG_CRYPTO_MANAGER=3Dy
>> CONFIG_CRYPTO_MANAGER2=3Dy
>> CONFIG_CRYPTO_USER=3Dm
>> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
>> CONFIG_CRYPTO_GF128MUL=3Dy
>> CONFIG_CRYPTO_NULL=3Dy
>> CONFIG_CRYPTO_NULL2=3Dy
>> CONFIG_CRYPTO_PCRYPT=3Dm
>> CONFIG_CRYPTO_CRYPTD=3Dy
>> CONFIG_CRYPTO_AUTHENC=3Dm
>> CONFIG_CRYPTO_TEST=3Dm
>> CONFIG_CRYPTO_SIMD=3Dy
>>
>> #
>> # Public-key cryptography
>> #
>> CONFIG_CRYPTO_RSA=3Dy
>> CONFIG_CRYPTO_DH=3Dm
>> CONFIG_CRYPTO_ECC=3Dm
>> CONFIG_CRYPTO_ECDH=3Dm
>> # CONFIG_CRYPTO_ECRDSA is not set
>> # CONFIG_CRYPTO_SM2 is not set
>> # CONFIG_CRYPTO_CURVE25519 is not set
>> # CONFIG_CRYPTO_CURVE25519_X86 is not set
>>
>> #
>> # Authenticated Encryption with Associated Data
>> #
>> CONFIG_CRYPTO_CCM=3Dm
>> CONFIG_CRYPTO_GCM=3Dy
>> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
>> # CONFIG_CRYPTO_AEGIS128 is not set
>> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
>> CONFIG_CRYPTO_SEQIV=3Dy
>> CONFIG_CRYPTO_ECHAINIV=3Dm
>>
>> #
>> # Block modes
>> #
>> CONFIG_CRYPTO_CBC=3Dy
>> CONFIG_CRYPTO_CFB=3Dy
>> CONFIG_CRYPTO_CTR=3Dy
>> CONFIG_CRYPTO_CTS=3Dy
>> CONFIG_CRYPTO_ECB=3Dy
>> CONFIG_CRYPTO_LRW=3Dm
>> # CONFIG_CRYPTO_OFB is not set
>> CONFIG_CRYPTO_PCBC=3Dm
>> CONFIG_CRYPTO_XTS=3Dy
>> # CONFIG_CRYPTO_KEYWRAP is not set
>> # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
>> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
>> # CONFIG_CRYPTO_ADIANTUM is not set
>> CONFIG_CRYPTO_ESSIV=3Dm
>>
>> #
>> # Hash modes
>> #
>> CONFIG_CRYPTO_CMAC=3Dm
>> CONFIG_CRYPTO_HMAC=3Dy
>> CONFIG_CRYPTO_XCBC=3Dm
>> CONFIG_CRYPTO_VMAC=3Dm
>>
>> #
>> # Digest
>> #
>> CONFIG_CRYPTO_CRC32C=3Dy
>> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
>> CONFIG_CRYPTO_CRC32=3Dm
>> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
>> CONFIG_CRYPTO_XXHASH=3Dm
>> CONFIG_CRYPTO_BLAKE2B=3Dm
>> # CONFIG_CRYPTO_BLAKE2S is not set
>> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
>> CONFIG_CRYPTO_CRCT10DIF=3Dy
>> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
>> CONFIG_CRYPTO_GHASH=3Dy
>> CONFIG_CRYPTO_POLY1305=3Dm
>> CONFIG_CRYPTO_POLY1305_X86_64=3Dm
>> CONFIG_CRYPTO_MD4=3Dm
>> CONFIG_CRYPTO_MD5=3Dy
>> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
>> CONFIG_CRYPTO_RMD160=3Dm
>> CONFIG_CRYPTO_SHA1=3Dy
>> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
>> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
>> CONFIG_CRYPTO_SHA512_SSSE3=3Dm
>> CONFIG_CRYPTO_SHA256=3Dy
>> CONFIG_CRYPTO_SHA512=3Dy
>> CONFIG_CRYPTO_SHA3=3Dm
>> # CONFIG_CRYPTO_SM3 is not set
>> # CONFIG_CRYPTO_STREEBOG is not set
>> CONFIG_CRYPTO_WP512=3Dm
>> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
>>
>> #
>> # Ciphers
>> #
>> CONFIG_CRYPTO_AES=3Dy
>> # CONFIG_CRYPTO_AES_TI is not set
>> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
>> CONFIG_CRYPTO_ANUBIS=3Dm
>> CONFIG_CRYPTO_ARC4=3Dm
>> CONFIG_CRYPTO_BLOWFISH=3Dm
>> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
>> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
>> CONFIG_CRYPTO_CAMELLIA=3Dm
>> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
>> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
>> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
>> CONFIG_CRYPTO_CAST_COMMON=3Dm
>> CONFIG_CRYPTO_CAST5=3Dm
>> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
>> CONFIG_CRYPTO_CAST6=3Dm
>> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
>> CONFIG_CRYPTO_DES=3Dm
>> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dm
>> CONFIG_CRYPTO_FCRYPT=3Dm
>> CONFIG_CRYPTO_KHAZAD=3Dm
>> CONFIG_CRYPTO_CHACHA20=3Dm
>> CONFIG_CRYPTO_CHACHA20_X86_64=3Dm
>> CONFIG_CRYPTO_SEED=3Dm
>> CONFIG_CRYPTO_SERPENT=3Dm
>> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm
>> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
>> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
>> # CONFIG_CRYPTO_SM4 is not set
>> CONFIG_CRYPTO_TEA=3Dm
>> CONFIG_CRYPTO_TWOFISH=3Dm
>> CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
>> CONFIG_CRYPTO_TWOFISH_X86_64=3Dm
>> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm
>> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm
>>
>> #
>> # Compression
>> #
>> CONFIG_CRYPTO_DEFLATE=3Dy
>> CONFIG_CRYPTO_LZO=3Dy
>> # CONFIG_CRYPTO_842 is not set
>> # CONFIG_CRYPTO_LZ4 is not set
>> # CONFIG_CRYPTO_LZ4HC is not set
>> # CONFIG_CRYPTO_ZSTD is not set
>>
>> #
>> # Random Number Generation
>> #
>> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
>> CONFIG_CRYPTO_DRBG_MENU=3Dy
>> CONFIG_CRYPTO_DRBG_HMAC=3Dy
>> CONFIG_CRYPTO_DRBG_HASH=3Dy
>> CONFIG_CRYPTO_DRBG_CTR=3Dy
>> CONFIG_CRYPTO_DRBG=3Dy
>> CONFIG_CRYPTO_JITTERENTROPY=3Dy
>> CONFIG_CRYPTO_USER_API=3Dy
>> CONFIG_CRYPTO_USER_API_HASH=3Dy
>> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
>> CONFIG_CRYPTO_USER_API_RNG=3Dy
>> # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
>> CONFIG_CRYPTO_USER_API_AEAD=3Dy
>> CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
>> # CONFIG_CRYPTO_STATS is not set
>> CONFIG_CRYPTO_HASH_INFO=3Dy
>>
>> #
>> # Crypto library routines
>> #
>> CONFIG_CRYPTO_LIB_AES=3Dy
>> CONFIG_CRYPTO_LIB_ARC4=3Dm
>> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
>> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
>> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dm
>> # CONFIG_CRYPTO_LIB_CHACHA is not set
>> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
>> CONFIG_CRYPTO_LIB_DES=3Dm
>> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
>> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dm
>> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dm
>> # CONFIG_CRYPTO_LIB_POLY1305 is not set
>> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
>> CONFIG_CRYPTO_LIB_SHA256=3Dy
>> CONFIG_CRYPTO_HW=3Dy
>> CONFIG_CRYPTO_DEV_PADLOCK=3Dm
>> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dm
>> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
>> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
>> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
>> CONFIG_CRYPTO_DEV_CCP=3Dy
>> CONFIG_CRYPTO_DEV_CCP_DD=3Dm
>> CONFIG_CRYPTO_DEV_SP_CCP=3Dy
>> CONFIG_CRYPTO_DEV_CCP_CRYPTO=3Dm
>> CONFIG_CRYPTO_DEV_SP_PSP=3Dy
>> # CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
>> CONFIG_CRYPTO_DEV_QAT=3Dm
>> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dm
>> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
>> CONFIG_CRYPTO_DEV_QAT_C62X=3Dm
>> # CONFIG_CRYPTO_DEV_QAT_4XXX is not set
>> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm
>> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm
>> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm
>> CONFIG_CRYPTO_DEV_NITROX=3Dm
>> CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dm
>> # CONFIG_CRYPTO_DEV_VIRTIO is not set
>> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
>> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
>> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
>> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
>> # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
>> CONFIG_X509_CERTIFICATE_PARSER=3Dy
>> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
>> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
>> # CONFIG_PKCS7_TEST_KEY is not set
>> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
>>
>> #
>> # Certificates for signature checking
>> #
>> CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
>> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
>> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
>> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
>> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
>> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
>> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
>> # end of Certificates for signature checking
>>
>> CONFIG_BINARY_PRINTF=3Dy
>>
>> #
>> # Library routines
>> #
>> CONFIG_RAID6_PQ=3Dm
>> CONFIG_RAID6_PQ_BENCHMARK=3Dy
>> # CONFIG_PACKING is not set
>> CONFIG_BITREVERSE=3Dy
>> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
>> CONFIG_GENERIC_STRNLEN_USER=3Dy
>> CONFIG_GENERIC_NET_UTILS=3Dy
>> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
>> CONFIG_CORDIC=3Dm
>> # CONFIG_PRIME_NUMBERS is not set
>> CONFIG_RATIONAL=3Dy
>> CONFIG_GENERIC_PCI_IOMAP=3Dy
>> CONFIG_GENERIC_IOMAP=3Dy
>> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
>> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
>> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
>> CONFIG_CRC_CCITT=3Dy
>> CONFIG_CRC16=3Dy
>> CONFIG_CRC_T10DIF=3Dy
>> CONFIG_CRC_ITU_T=3Dm
>> CONFIG_CRC32=3Dy
>> # CONFIG_CRC32_SELFTEST is not set
>> CONFIG_CRC32_SLICEBY8=3Dy
>> # CONFIG_CRC32_SLICEBY4 is not set
>> # CONFIG_CRC32_SARWATE is not set
>> # CONFIG_CRC32_BIT is not set
>> # CONFIG_CRC64 is not set
>> # CONFIG_CRC4 is not set
>> CONFIG_CRC7=3Dm
>> CONFIG_LIBCRC32C=3Dm
>> CONFIG_CRC8=3Dm
>> CONFIG_XXHASH=3Dy
>> # CONFIG_RANDOM32_SELFTEST is not set
>> CONFIG_ZLIB_INFLATE=3Dy
>> CONFIG_ZLIB_DEFLATE=3Dy
>> CONFIG_LZO_COMPRESS=3Dy
>> CONFIG_LZO_DECOMPRESS=3Dy
>> CONFIG_LZ4_DECOMPRESS=3Dy
>> CONFIG_ZSTD_COMPRESS=3Dm
>> CONFIG_ZSTD_DECOMPRESS=3Dy
>> CONFIG_XZ_DEC=3Dy
>> CONFIG_XZ_DEC_X86=3Dy
>> CONFIG_XZ_DEC_POWERPC=3Dy
>> CONFIG_XZ_DEC_IA64=3Dy
>> CONFIG_XZ_DEC_ARM=3Dy
>> CONFIG_XZ_DEC_ARMTHUMB=3Dy
>> CONFIG_XZ_DEC_SPARC=3Dy
>> CONFIG_XZ_DEC_BCJ=3Dy
>> # CONFIG_XZ_DEC_TEST is not set
>> CONFIG_DECOMPRESS_GZIP=3Dy
>> CONFIG_DECOMPRESS_BZIP2=3Dy
>> CONFIG_DECOMPRESS_LZMA=3Dy
>> CONFIG_DECOMPRESS_XZ=3Dy
>> CONFIG_DECOMPRESS_LZO=3Dy
>> CONFIG_DECOMPRESS_LZ4=3Dy
>> CONFIG_DECOMPRESS_ZSTD=3Dy
>> CONFIG_GENERIC_ALLOCATOR=3Dy
>> CONFIG_REED_SOLOMON=3Dm
>> CONFIG_REED_SOLOMON_ENC8=3Dy
>> CONFIG_REED_SOLOMON_DEC8=3Dy
>> CONFIG_TEXTSEARCH=3Dy
>> CONFIG_TEXTSEARCH_KMP=3Dm
>> CONFIG_TEXTSEARCH_BM=3Dm
>> CONFIG_TEXTSEARCH_FSM=3Dm
>> CONFIG_INTERVAL_TREE=3Dy
>> CONFIG_XARRAY_MULTI=3Dy
>> CONFIG_ASSOCIATIVE_ARRAY=3Dy
>> CONFIG_HAS_IOMEM=3Dy
>> CONFIG_HAS_IOPORT_MAP=3Dy
>> CONFIG_HAS_DMA=3Dy
>> CONFIG_DMA_OPS=3Dy
>> CONFIG_NEED_SG_DMA_LENGTH=3Dy
>> CONFIG_NEED_DMA_MAP_STATE=3Dy
>> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
>> CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=3Dy
>> CONFIG_SWIOTLB=3Dy
>> CONFIG_DMA_COHERENT_POOL=3Dy
>> CONFIG_DMA_CMA=3Dy
>> # CONFIG_DMA_PERNUMA_CMA is not set
>>
>> #
>> # Default contiguous memory area size:
>> #
>> CONFIG_CMA_SIZE_MBYTES=3D200
>> CONFIG_CMA_SIZE_SEL_MBYTES=3Dy
>> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
>> # CONFIG_CMA_SIZE_SEL_MIN is not set
>> # CONFIG_CMA_SIZE_SEL_MAX is not set
>> CONFIG_CMA_ALIGNMENT=3D8
>> # CONFIG_DMA_API_DEBUG is not set
>> # CONFIG_DMA_MAP_BENCHMARK is not set
>> CONFIG_SGL_ALLOC=3Dy
>> CONFIG_CHECK_SIGNATURE=3Dy
>> CONFIG_CPUMASK_OFFSTACK=3Dy
>> CONFIG_CPU_RMAP=3Dy
>> CONFIG_DQL=3Dy
>> CONFIG_GLOB=3Dy
>> # CONFIG_GLOB_SELFTEST is not set
>> CONFIG_NLATTR=3Dy
>> CONFIG_CLZ_TAB=3Dy
>> CONFIG_IRQ_POLL=3Dy
>> CONFIG_MPILIB=3Dy
>> CONFIG_SIGNATURE=3Dy
>> CONFIG_DIMLIB=3Dy
>> CONFIG_OID_REGISTRY=3Dy
>> CONFIG_UCS2_STRING=3Dy
>> CONFIG_HAVE_GENERIC_VDSO=3Dy
>> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
>> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
>> CONFIG_FONT_SUPPORT=3Dy
>> # CONFIG_FONTS is not set
>> CONFIG_FONT_8x8=3Dy
>> CONFIG_FONT_8x16=3Dy
>> CONFIG_SG_POOL=3Dy
>> CONFIG_ARCH_HAS_PMEM_API=3Dy
>> CONFIG_MEMREGION=3Dy
>> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
>> CONFIG_ARCH_HAS_COPY_MC=3Dy
>> CONFIG_ARCH_STACKWALK=3Dy
>> CONFIG_SBITMAP=3Dy
>> # CONFIG_STRING_SELFTEST is not set
>> # end of Library routines
>>
>> #
>> # Kernel hacking
>> #
>>
>> #
>> # printk and dmesg options
>> #
>> CONFIG_PRINTK_TIME=3Dy
>> # CONFIG_PRINTK_CALLER is not set
>> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
>> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
>> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
>> CONFIG_BOOT_PRINTK_DELAY=3Dy
>> CONFIG_DYNAMIC_DEBUG=3Dy
>> CONFIG_DYNAMIC_DEBUG_CORE=3Dy
>> CONFIG_SYMBOLIC_ERRNAME=3Dy
>> CONFIG_DEBUG_BUGVERBOSE=3Dy
>> # end of printk and dmesg options
>>
>> #
>> # Compile-time checks and compiler options
>> #
>> CONFIG_DEBUG_INFO=3Dy
>> CONFIG_DEBUG_INFO_REDUCED=3Dy
>> # CONFIG_DEBUG_INFO_COMPRESSED is not set
>> # CONFIG_DEBUG_INFO_SPLIT is not set
>> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
>> CONFIG_DEBUG_INFO_DWARF4=3Dy
>> # CONFIG_DEBUG_INFO_DWARF5 is not set
>> # CONFIG_GDB_SCRIPTS is not set
>> CONFIG_FRAME_WARN=3D2048
>> CONFIG_STRIP_ASM_SYMS=3Dy
>> # CONFIG_READABLE_ASM is not set
>> # CONFIG_HEADERS_INSTALL is not set
>> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
>> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
>> CONFIG_STACK_VALIDATION=3Dy
>> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
>> # end of Compile-time checks and compiler options
>>
>> #
>> # Generic Kernel Debugging Instruments
>> #
>> CONFIG_MAGIC_SYSRQ=3Dy
>> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
>> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
>> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
>> CONFIG_DEBUG_FS=3Dy
>> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
>> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
>> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
>> CONFIG_HAVE_ARCH_KGDB=3Dy
>> # CONFIG_KGDB is not set
>> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
>> # CONFIG_UBSAN is not set
>> CONFIG_HAVE_ARCH_KCSAN=3Dy
>> # end of Generic Kernel Debugging Instruments
>>
>> CONFIG_DEBUG_KERNEL=3Dy
>> CONFIG_DEBUG_MISC=3Dy
>>
>> #
>> # Memory Debugging
>> #
>> # CONFIG_PAGE_EXTENSION is not set
>> # CONFIG_DEBUG_PAGEALLOC is not set
>> # CONFIG_PAGE_OWNER is not set
>> # CONFIG_PAGE_POISONING is not set
>> # CONFIG_DEBUG_PAGE_REF is not set
>> # CONFIG_DEBUG_RODATA_TEST is not set
>> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
>> # CONFIG_DEBUG_WX is not set
>> CONFIG_GENERIC_PTDUMP=3Dy
>> # CONFIG_PTDUMP_DEBUGFS is not set
>> # CONFIG_DEBUG_OBJECTS is not set
>> # CONFIG_SLUB_DEBUG_ON is not set
>> # CONFIG_SLUB_STATS is not set
>> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
>> # CONFIG_DEBUG_KMEMLEAK is not set
>> # CONFIG_DEBUG_STACK_USAGE is not set
>> # CONFIG_SCHED_STACK_END_CHECK is not set
>> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
>> # CONFIG_DEBUG_VM is not set
>> # CONFIG_DEBUG_VM_PGTABLE is not set
>> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
>> # CONFIG_DEBUG_VIRTUAL is not set
>> CONFIG_DEBUG_MEMORY_INIT=3Dy
>> # CONFIG_DEBUG_PER_CPU_MAPS is not set
>> CONFIG_HAVE_ARCH_KASAN=3Dy
>> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
>> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
>> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
>> # CONFIG_KASAN is not set
>> CONFIG_HAVE_ARCH_KFENCE=3Dy
>> # CONFIG_KFENCE is not set
>> # end of Memory Debugging
>>
>> CONFIG_DEBUG_SHIRQ=3Dy
>>
>> #
>> # Debug Oops, Lockups and Hangs
>> #
>> CONFIG_PANIC_ON_OOPS=3Dy
>> CONFIG_PANIC_ON_OOPS_VALUE=3D1
>> CONFIG_PANIC_TIMEOUT=3D0
>> CONFIG_LOCKUP_DETECTOR=3Dy
>> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
>> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
>> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
>> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
>> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
>> CONFIG_HARDLOCKUP_DETECTOR=3Dy
>> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
>> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
>> # CONFIG_DETECT_HUNG_TASK is not set
>> # CONFIG_WQ_WATCHDOG is not set
>> # CONFIG_TEST_LOCKUP is not set
>> # end of Debug Oops, Lockups and Hangs
>>
>> #
>> # Scheduler Debugging
>> #
>> CONFIG_SCHED_DEBUG=3Dy
>> CONFIG_SCHED_INFO=3Dy
>> CONFIG_SCHEDSTATS=3Dy
>> # end of Scheduler Debugging
>>
>> # CONFIG_DEBUG_TIMEKEEPING is not set
>>
>> #
>> # Lock Debugging (spinlocks, mutexes, etc...)
>> #
>> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
>> # CONFIG_PROVE_LOCKING is not set
>> # CONFIG_LOCK_STAT is not set
>> # CONFIG_DEBUG_RT_MUTEXES is not set
>> # CONFIG_DEBUG_SPINLOCK is not set
>> # CONFIG_DEBUG_MUTEXES is not set
>> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
>> # CONFIG_DEBUG_RWSEMS is not set
>> # CONFIG_DEBUG_LOCK_ALLOC is not set
>> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
>> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
>> CONFIG_LOCK_TORTURE_TEST=3Dm
>> # CONFIG_WW_MUTEX_SELFTEST is not set
>> # CONFIG_SCF_TORTURE_TEST is not set
>> # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
>> # end of Lock Debugging (spinlocks, mutexes, etc...)
>>
>> # CONFIG_DEBUG_IRQFLAGS is not set
>> CONFIG_STACKTRACE=3Dy
>> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
>> # CONFIG_DEBUG_KOBJECT is not set
>>
>> #
>> # Debug kernel data structures
>> #
>> CONFIG_DEBUG_LIST=3Dy
>> # CONFIG_DEBUG_PLIST is not set
>> # CONFIG_DEBUG_SG is not set
>> # CONFIG_DEBUG_NOTIFIERS is not set
>> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
>> # end of Debug kernel data structures
>>
>> # CONFIG_DEBUG_CREDENTIALS is not set
>>
>> #
>> # RCU Debugging
>> #
>> CONFIG_TORTURE_TEST=3Dm
>> CONFIG_RCU_SCALE_TEST=3Dm
>> CONFIG_RCU_TORTURE_TEST=3Dm
>> # CONFIG_RCU_REF_SCALE_TEST is not set
>> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
>> # CONFIG_RCU_TRACE is not set
>> # CONFIG_RCU_EQS_DEBUG is not set
>> # end of RCU Debugging
>>
>> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
>> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
>> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
>> CONFIG_LATENCYTOP=3Dy
>> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
>> CONFIG_NOP_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_TRACER=3Dy
>> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
>> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
>> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
>> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
>> CONFIG_HAVE_FENTRY=3Dy
>> CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
>> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
>> CONFIG_TRACER_MAX_TRACE=3Dy
>> CONFIG_TRACE_CLOCK=3Dy
>> CONFIG_RING_BUFFER=3Dy
>> CONFIG_EVENT_TRACING=3Dy
>> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
>> CONFIG_TRACING=3Dy
>> CONFIG_GENERIC_TRACER=3Dy
>> CONFIG_TRACING_SUPPORT=3Dy
>> CONFIG_FTRACE=3Dy
>> # CONFIG_BOOTTIME_TRACING is not set
>> CONFIG_FUNCTION_TRACER=3Dy
>> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
>> CONFIG_DYNAMIC_FTRACE=3Dy
>> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
>> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
>> CONFIG_FUNCTION_PROFILER=3Dy
>> CONFIG_STACK_TRACER=3Dy
>> # CONFIG_IRQSOFF_TRACER is not set
>> CONFIG_SCHED_TRACER=3Dy
>> CONFIG_HWLAT_TRACER=3Dy
>> # CONFIG_MMIOTRACE is not set
>> CONFIG_FTRACE_SYSCALLS=3Dy
>> CONFIG_TRACER_SNAPSHOT=3Dy
>> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
>> CONFIG_BRANCH_PROFILE_NONE=3Dy
>> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
>> CONFIG_BLK_DEV_IO_TRACE=3Dy
>> CONFIG_KPROBE_EVENTS=3Dy
>> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
>> CONFIG_UPROBE_EVENTS=3Dy
>> CONFIG_BPF_EVENTS=3Dy
>> CONFIG_DYNAMIC_EVENTS=3Dy
>> CONFIG_PROBE_EVENTS=3Dy
>> # CONFIG_BPF_KPROBE_OVERRIDE is not set
>> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
>> CONFIG_FTRACE_MCOUNT_USE_CC=3Dy
>> CONFIG_TRACING_MAP=3Dy
>> CONFIG_SYNTH_EVENTS=3Dy
>> CONFIG_HIST_TRIGGERS=3Dy
>> # CONFIG_TRACE_EVENT_INJECT is not set
>> # CONFIG_TRACEPOINT_BENCHMARK is not set
>> CONFIG_RING_BUFFER_BENCHMARK=3Dm
>> # CONFIG_TRACE_EVAL_MAP_FILE is not set
>> # CONFIG_FTRACE_RECORD_RECURSION is not set
>> # CONFIG_FTRACE_STARTUP_TEST is not set
>> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
>> # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
>> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
>> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
>> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
>> # CONFIG_HIST_TRIGGERS_DEBUG is not set
>> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
>> # CONFIG_SAMPLES is not set
>> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
>> CONFIG_STRICT_DEVMEM=3Dy
>> # CONFIG_IO_STRICT_DEVMEM is not set
>>
>> #
>> # x86 Debugging
>> #
>> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
>> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
>> CONFIG_EARLY_PRINTK_USB=3Dy
>> CONFIG_X86_VERBOSE_BOOTUP=3Dy
>> CONFIG_EARLY_PRINTK=3Dy
>> CONFIG_EARLY_PRINTK_DBGP=3Dy
>> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
>> # CONFIG_EFI_PGT_DUMP is not set
>> # CONFIG_DEBUG_TLBFLUSH is not set
>> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
>> CONFIG_X86_DECODER_SELFTEST=3Dy
>> CONFIG_IO_DELAY_0X80=3Dy
>> # CONFIG_IO_DELAY_0XED is not set
>> # CONFIG_IO_DELAY_UDELAY is not set
>> # CONFIG_IO_DELAY_NONE is not set
>> CONFIG_DEBUG_BOOT_PARAMS=3Dy
>> # CONFIG_CPA_DEBUG is not set
>> # CONFIG_DEBUG_ENTRY is not set
>> # CONFIG_DEBUG_NMI_SELFTEST is not set
>> # CONFIG_X86_DEBUG_FPU is not set
>> # CONFIG_PUNIT_ATOM_DEBUG is not set
>> CONFIG_UNWINDER_ORC=3Dy
>> # CONFIG_UNWINDER_FRAME_POINTER is not set
>> # end of x86 Debugging
>>
>> #
>> # Kernel Testing and Coverage
>> #
>> CONFIG_KUNIT=3Dy
>> # CONFIG_KUNIT_DEBUGFS is not set
>> CONFIG_KUNIT_TEST=3Dm
>> CONFIG_KUNIT_EXAMPLE_TEST=3Dm
>> # CONFIG_KUNIT_ALL_TESTS is not set
>> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
>> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
>> CONFIG_FAULT_INJECTION=3Dy
>> # CONFIG_FAILSLAB is not set
>> # CONFIG_FAIL_PAGE_ALLOC is not set
>> # CONFIG_FAULT_INJECTION_USERCOPY is not set
>> CONFIG_FAIL_MAKE_REQUEST=3Dy
>> # CONFIG_FAIL_IO_TIMEOUT is not set
>> # CONFIG_FAIL_FUTEX is not set
>> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
>> # CONFIG_FAIL_FUNCTION is not set
>> # CONFIG_FAIL_MMC_REQUEST is not set
>> CONFIG_ARCH_HAS_KCOV=3Dy
>> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
>> # CONFIG_KCOV is not set
>> CONFIG_RUNTIME_TESTING_MENU=3Dy
>> # CONFIG_LKDTM is not set
>> # CONFIG_TEST_LIST_SORT is not set
>> # CONFIG_TEST_MIN_HEAP is not set
>> # CONFIG_TEST_SORT is not set
>> # CONFIG_KPROBES_SANITY_TEST is not set
>> # CONFIG_BACKTRACE_SELF_TEST is not set
>> # CONFIG_RBTREE_TEST is not set
>> # CONFIG_REED_SOLOMON_TEST is not set
>> # CONFIG_INTERVAL_TREE_TEST is not set
>> # CONFIG_PERCPU_TEST is not set
>> CONFIG_ATOMIC64_SELFTEST=3Dy
>> # CONFIG_ASYNC_RAID6_TEST is not set
>> # CONFIG_TEST_HEXDUMP is not set
>> # CONFIG_TEST_STRING_HELPERS is not set
>> # CONFIG_TEST_STRSCPY is not set
>> # CONFIG_TEST_KSTRTOX is not set
>> # CONFIG_TEST_PRINTF is not set
>> # CONFIG_TEST_BITMAP is not set
>> # CONFIG_TEST_UUID is not set
>> # CONFIG_TEST_XARRAY is not set
>> # CONFIG_TEST_OVERFLOW is not set
>> # CONFIG_TEST_RHASHTABLE is not set
>> # CONFIG_TEST_HASH is not set
>> # CONFIG_TEST_IDA is not set
>> # CONFIG_TEST_LKM is not set
>> # CONFIG_TEST_BITOPS is not set
>> # CONFIG_TEST_VMALLOC is not set
>> # CONFIG_TEST_USER_COPY is not set
>> CONFIG_TEST_BPF=3Dm
>> # CONFIG_TEST_BLACKHOLE_DEV is not set
>> # CONFIG_FIND_BIT_BENCHMARK is not set
>> # CONFIG_TEST_FIRMWARE is not set
>> # CONFIG_TEST_SYSCTL is not set
>> # CONFIG_BITFIELD_KUNIT is not set
>> # CONFIG_RESOURCE_KUNIT_TEST is not set
>> CONFIG_SYSCTL_KUNIT_TEST=3Dm
>> CONFIG_LIST_KUNIT_TEST=3Dm
>> # CONFIG_LINEAR_RANGES_TEST is not set
>> # CONFIG_CMDLINE_KUNIT_TEST is not set
>> # CONFIG_BITS_TEST is not set
>> # CONFIG_TEST_UDELAY is not set
>> # CONFIG_TEST_STATIC_KEYS is not set
>> # CONFIG_TEST_KMOD is not set
>> # CONFIG_TEST_MEMCAT_P is not set
>> # CONFIG_TEST_LIVEPATCH is not set
>> # CONFIG_TEST_STACKINIT is not set
>> # CONFIG_TEST_MEMINIT is not set
>> # CONFIG_TEST_HMM is not set
>> # CONFIG_TEST_FREE_PAGES is not set
>> # CONFIG_TEST_FPU is not set
>> # CONFIG_MEMTEST is not set
>> # CONFIG_HYPERV_TESTING is not set
>> # end of Kernel Testing and Coverage
>> # end of Kernel hacking
>> #!/bin/sh
>>
>> export_top_env()
>> {
>> 	export suite=3D'stress-ng'
>> 	export testcase=3D'stress-ng'
>> 	export category=3D'benchmark'
>> 	export nr_threads=3D96
>> 	export testtime=3D60
>> 	export job_origin=3D'stress-ng-class-network.yaml'
>> 	export queue_cmdline_keys=3D'branch
>> commit
>> queue_at_least_once'
>> 	export queue=3D'validate'
>> 	export testbox=3D'lkp-csl-2sp5'
>> 	export tbox_group=3D'lkp-csl-2sp5'
>> 	export kconfig=3D'x86_64-rhel-8.3'
>> 	export submit_id=3D'6041ab46140aa5ef4f1c4c04'
>> 	export job_file=3D'/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-network-p=
erformance-1HDD-100%-sockabuse-60s-ucode=3D0x5003006-monitor=3D70d6d718-deb=
ian-10.4-x86_64-20200603.cgz-80cb40387-20210305-61263-1jt66rf-5.yaml'
>> 	export id=3D'7934427cd6f11d2a13bb8dbb357b108c35342b79'
>> 	export queuer_version=3D'/lkp-src'
>> 	export model=3D'Cascade Lake'
>> 	export nr_node=3D2
>> 	export nr_cpu=3D96
>> 	export memory=3D'192G'
>> 	export nr_hdd_partitions=3D1
>> 	export nr_ssd_partitions=3D1
>> 	export hdd_partitions=3D'/dev/disk/by-id/ata-ST1000NM0011_Z1N2QGYK-part=
5'
>> 	export ssd_partitions=3D'/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL42=
04006P800RGN-part1'
>> 	export swap_partitions=3D
>> 	export rootfs_partition=3D'/dev/disk/by-id/ata-ST1000NM0011_Z1N2QGYK-pa=
rt3'
>> 	export brand=3D'Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz'
>> 	export need_kconfig=3D'CONFIG_BLK_DEV_SD
>> CONFIG_SCSI
>> CONFIG_BLOCK=3Dy
>> CONFIG_SATA_AHCI
>> CONFIG_SATA_AHCI_PLATFORM
>> CONFIG_ATA
>> CONFIG_PCI=3Dy
>> CONFIG_SECURITY_APPARMOR=3Dy'
>> 	export commit=3D'80cb403876fc973389d6ea100a3eea11d81e6f2d'
>> 	export need_kconfig_hw=3D'CONFIG_I40E=3Dy
>> CONFIG_SATA_AHCI'
>> 	export ucode=3D'0x5003006'
>> 	export enqueue_time=3D'2021-03-05 11:53:44 +0800'
>> 	export _id=3D'6041ab77140aa5ef4f1c4c06'
>> 	export _rt=3D'/result/stress-ng/network-performance-1HDD-100%-sockabuse=
-60s-ucode=3D0x5003006-monitor=3D70d6d718/lkp-csl-2sp5/debian-10.4-x86_64-2=
0200603.cgz/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea100a3eea11d81e6f2d'
>> 	export user=3D'lkp'
>> 	export compiler=3D'gcc-9'
>> 	export LKP_SERVER=3D'internal-lkp-server'
>> 	export head_commit=3D'f82f5fda4a5958fcc1050091dac03a8774345a83'
>> 	export base_commit=3D'fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8'
>> 	export branch=3D'aa/master'
>> 	export rootfs=3D'debian-10.4-x86_64-20200603.cgz'
>> 	export monitor_sha=3D'70d6d718'
>> 	export result_root=3D'/result/stress-ng/network-performance-1HDD-100%-s=
ockabuse-60s-ucode=3D0x5003006-monitor=3D70d6d718/lkp-csl-2sp5/debian-10.4-=
x86_64-20200603.cgz/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea100a3eea11d=
81e6f2d/3'
>> 	export scheduler_version=3D'/lkp/lkp/.src-20210304-151455'
>> 	export arch=3D'x86_64'
>> 	export max_uptime=3D2100
>> 	export initrd=3D'/osimage/debian/debian-10.4-x86_64-20200603.cgz'
>> 	export bootloader_append=3D'root=3D/dev/ram0
>> user=3Dlkp
>> job=3D/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-network-performance-1HD=
D-100%-sockabuse-60s-ucode=3D0x5003006-monitor=3D70d6d718-debian-10.4-x86_6=
4-20200603.cgz-80cb40387-20210305-61263-1jt66rf-5.yaml
>> ARCH=3Dx86_64
>> kconfig=3Dx86_64-rhel-8.3
>> branch=3Daa/master
>> commit=3D80cb403876fc973389d6ea100a3eea11d81e6f2d
>> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea100a=
3eea11d81e6f2d/vmlinuz-5.12.0-rc1-00052-g80cb403876fc
>> max_uptime=3D2100
>> RESULT_ROOT=3D/result/stress-ng/network-performance-1HDD-100%-sockabuse-=
60s-ucode=3D0x5003006-monitor=3D70d6d718/lkp-csl-2sp5/debian-10.4-x86_64-20=
200603.cgz/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea100a3eea11d81e6f2d/3
>> LKP_SERVER=3Dinternal-lkp-server
>> nokaslr
>> selinux=3D0
>> debug
>> apic=3Ddebug
>> sysrq_always_enabled
>> rcupdate.rcu_cpu_stall_timeout=3D100
>> net.ifnames=3D0
>> printk.devkmsg=3Don
>> panic=3D-1
>> softlockup_panic=3D1
>> nmi_watchdog=3Dpanic
>> oops=3Dpanic
>> load_ramdisk=3D2
>> prompt_ramdisk=3D0
>> drbd.minor_count=3D8
>> systemd.log_level=3Derr
>> ignore_loglevel
>> console=3Dtty0
>> earlyprintk=3DttyS0,115200
>> console=3DttyS0,115200
>> vga=3Dnormal
>> rw'
>> 	export modules_initrd=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/80cb403876fc9=
73389d6ea100a3eea11d81e6f2d/modules.cgz'
>> 	export bm_initrd=3D'/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-i=
pconfig_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_2020=
1211.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_2020060=
8.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/stress-ng_20210105.cgz,=
/osimage/pkg/debian-10.4-x86_64-20200603.cgz/stress-ng-x86_64-0.11-06_20210=
105.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/perf_20201126.cgz,/osimage/pkg=
/debian-10.4-x86_64-20200603.cgz/perf-x86_64-e71ba9452f0b-1_20210106.cgz,/o=
simage/pkg/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cg=
z,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
>> 	export ucode_initrd=3D'/osimage/ucode/intel-ucode-20210222.cgz'
>> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-x86_64.cgz'
>> 	export site=3D'inn'
>> 	export LKP_CGI_PORT=3D80
>> 	export LKP_CIFS_PORT=3D139
>> 	export last_kernel=3D'5.12.0-rc1-03516-gf82f5fda4a59'
>> 	export repeat_to=3D6
>> 	export queue_at_least_once=3D1
>> 	export kernel=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6e=
a100a3eea11d81e6f2d/vmlinuz-5.12.0-rc1-00052-g80cb403876fc'
>> 	export dequeue_time=3D'2021-03-05 11:56:12 +0800'
>> 	export job_initrd=3D'/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-network=
-performance-1HDD-100%-sockabuse-60s-ucode=3D0x5003006-monitor=3D70d6d718-d=
ebian-10.4-x86_64-20200603.cgz-80cb40387-20210305-61263-1jt66rf-5.cgz'
>>
>> 	[ -n "$LKP_SRC" ] ||
>> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
>> }
>>
>> run_job()
>> {
>> 	echo $$ > $TMP/run-job.pid
>>
>> 	. $LKP_SRC/lib/http.sh
>> 	. $LKP_SRC/lib/job.sh
>> 	. $LKP_SRC/lib/env.sh
>>
>> 	export_top_env
>>
>> 	run_setup nr_hdd=3D1 $LKP_SRC/setup/disk
>>
>> 	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'
>>
>> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
>> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
>> 	run_monitor $LKP_SRC/monitors/wrapper uptime
>> 	run_monitor $LKP_SRC/monitors/wrapper iostat
>> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
>> 	run_monitor $LKP_SRC/monitors/wrapper vmstat
>> 	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
>> 	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
>> 	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
>> 	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
>> 	run_monitor $LKP_SRC/monitors/wrapper proc-stat
>> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
>> 	run_monitor $LKP_SRC/monitors/wrapper slabinfo
>> 	run_monitor $LKP_SRC/monitors/wrapper interrupts
>> 	run_monitor $LKP_SRC/monitors/wrapper lock_stat
>> 	run_monitor lite_mode=3D1 $LKP_SRC/monitors/wrapper perf-sched
>> 	run_monitor $LKP_SRC/monitors/wrapper softirqs
>> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
>> 	run_monitor $LKP_SRC/monitors/wrapper diskstats
>> 	run_monitor $LKP_SRC/monitors/wrapper nfsstat
>> 	run_monitor $LKP_SRC/monitors/wrapper cpuidle
>> 	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
>> 	run_monitor $LKP_SRC/monitors/wrapper sched_debug
>> 	run_monitor $LKP_SRC/monitors/wrapper perf-stat
>> 	run_monitor $LKP_SRC/monitors/wrapper mpstat
>> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper perf-profile
>> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
>> 	run_monitor $LKP_SRC/monitors/plain/watchdog
>>
>> 	run_test class=3D'network' test=3D'sockabuse' $LKP_SRC/tests/wrapper st=
ress-ng
>> }
>>
>> extract_stats()
>> {
>> 	export stats_part_begin=3D
>> 	export stats_part_end=3D
>>
>> 	env class=3D'network' test=3D'sockabuse' $LKP_SRC/stats/wrapper stress-=
ng
>> 	$LKP_SRC/stats/wrapper kmsg
>> 	$LKP_SRC/stats/wrapper boot-time
>> 	$LKP_SRC/stats/wrapper uptime
>> 	$LKP_SRC/stats/wrapper iostat
>> 	$LKP_SRC/stats/wrapper vmstat
>> 	$LKP_SRC/stats/wrapper numa-numastat
>> 	$LKP_SRC/stats/wrapper numa-vmstat
>> 	$LKP_SRC/stats/wrapper numa-meminfo
>> 	$LKP_SRC/stats/wrapper proc-vmstat
>> 	$LKP_SRC/stats/wrapper meminfo
>> 	$LKP_SRC/stats/wrapper slabinfo
>> 	$LKP_SRC/stats/wrapper interrupts
>> 	$LKP_SRC/stats/wrapper lock_stat
>> 	env lite_mode=3D1 $LKP_SRC/stats/wrapper perf-sched
>> 	$LKP_SRC/stats/wrapper softirqs
>> 	$LKP_SRC/stats/wrapper diskstats
>> 	$LKP_SRC/stats/wrapper nfsstat
>> 	$LKP_SRC/stats/wrapper cpuidle
>> 	$LKP_SRC/stats/wrapper sched_debug
>> 	$LKP_SRC/stats/wrapper perf-stat
>> 	$LKP_SRC/stats/wrapper mpstat
>> 	$LKP_SRC/stats/wrapper perf-profile
>>
>> 	$LKP_SRC/stats/wrapper time stress-ng.time
>> 	$LKP_SRC/stats/wrapper dmesg
>> 	$LKP_SRC/stats/wrapper kmsg
>> 	$LKP_SRC/stats/wrapper last_state
>> 	$LKP_SRC/stats/wrapper stderr
>> 	$LKP_SRC/stats/wrapper time
>> }
>>
>> "$@"
>> ---
>>
>> #! jobs/stress-ng-class-network.yaml
>> suite: stress-ng
>> testcase: stress-ng
>> category: benchmark
>> nr_threads: 100%
>> disk: 1HDD
>> testtime: 60s
>> stress-ng:
>>    class: network
>>    test: sockabuse
>> job_origin: stress-ng-class-network.yaml
>>
>> #! queue options
>> queue_cmdline_keys:
>> - branch
>> - commit
>> - queue_at_least_once
>> queue: bisect
>> testbox: lkp-csl-2sp5
>> tbox_group: lkp-csl-2sp5
>> kconfig: x86_64-rhel-8.3
>> submit_id: 6041981f140aa5e9b2f3bbeb
>> job_file: "/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-network-performanc=
e-1HDD-100%-sockabuse-60s-ucode=3D0x5003006-monitor=3D70d6d718-debian-10.4-=
x86_64-20200603.cgz-80cb40387-20210305-59826-1h9y5zq-2.yaml"
>> id: 1b92d8e9452e055b722173bdc773cf46a0be7616
>> queuer_version: "/lkp-src"
>>
>> #! hosts/lkp-csl-2sp5
>> model: Cascade Lake
>> nr_node: 2
>> nr_cpu: 96
>> memory: 192G
>> nr_hdd_partitions: 1
>> nr_ssd_partitions: 1
>> hdd_partitions: "/dev/disk/by-id/ata-ST1000NM0011_Z1N2QGYK-part5"
>> ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BB800G4_PHWL4204006P800=
RGN-part1"
>> swap_partitions:
>> rootfs_partition: "/dev/disk/by-id/ata-ST1000NM0011_Z1N2QGYK-part3"
>> brand: Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz
>>
>> #! include/category/benchmark
>> kmsg:
>> boot-time:
>> uptime:
>> iostat:
>> heartbeat:
>> vmstat:
>> numa-numastat:
>> numa-vmstat:
>> numa-meminfo:
>> proc-vmstat:
>> proc-stat:
>> meminfo:
>> slabinfo:
>> interrupts:
>> lock_stat:
>> perf-sched:
>>    lite_mode: 1
>> softirqs:
>> bdi_dev_mapping:
>> diskstats:
>> nfsstat:
>> cpuidle:
>> cpufreq-stats:
>> sched_debug:
>> perf-stat:
>> mpstat:
>> perf-profile:
>>
>> #! include/category/ALL
>> cpufreq_governor: performance
>>
>> #! include/disk/nr_hdd
>> need_kconfig:
>> - CONFIG_BLK_DEV_SD
>> - CONFIG_SCSI
>> - CONFIG_BLOCK=3Dy
>> - CONFIG_SATA_AHCI
>> - CONFIG_SATA_AHCI_PLATFORM
>> - CONFIG_ATA
>> - CONFIG_PCI=3Dy
>> - CONFIG_SECURITY_APPARMOR=3Dy
>>
>> #! include/stress-ng
>>
>> #! include/queue/cyclic
>> commit: 80cb403876fc973389d6ea100a3eea11d81e6f2d
>>
>> #! include/testbox/lkp-csl-2sp5
>> need_kconfig_hw:
>> - CONFIG_I40E=3Dy
>> - CONFIG_SATA_AHCI
>> ucode: '0x5003006'
>> enqueue_time: 2021-03-05 10:32:01.522161200 +08:00
>> _id: 60419b28140aa5e9b2f3bbed
>> _rt: "/result/stress-ng/network-performance-1HDD-100%-sockabuse-60s-ucod=
e=3D0x5003006-monitor=3D70d6d718/lkp-csl-2sp5/debian-10.4-x86_64-20200603.c=
gz/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea100a3eea11d81e6f2d"
>>
>> #! schedule options
>> user: lkp
>> compiler: gcc-9
>> LKP_SERVER: internal-lkp-server
>> head_commit: f82f5fda4a5958fcc1050091dac03a8774345a83
>> base_commit: fe07bfda2fb9cdef8a4d4008a409bb02f35f1bd8
>> branch: linux-devel/devel-hourly-20210304-162318
>> rootfs: debian-10.4-x86_64-20200603.cgz
>> monitor_sha: 70d6d718
>> result_root: "/result/stress-ng/network-performance-1HDD-100%-sockabuse-=
60s-ucode=3D0x5003006-monitor=3D70d6d718/lkp-csl-2sp5/debian-10.4-x86_64-20=
200603.cgz/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea100a3eea11d81e6f2d/0"
>> scheduler_version: "/lkp/lkp/.src-20210304-151455"
>> arch: x86_64
>> max_uptime: 2100
>> initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
>> bootloader_append:
>> - root=3D/dev/ram0
>> - user=3Dlkp
>> - job=3D/lkp/jobs/scheduled/lkp-csl-2sp5/stress-ng-network-performance-1=
HDD-100%-sockabuse-60s-ucode=3D0x5003006-monitor=3D70d6d718-debian-10.4-x86=
_64-20200603.cgz-80cb40387-20210305-59826-1h9y5zq-2.yaml
>> - ARCH=3Dx86_64
>> - kconfig=3Dx86_64-rhel-8.3
>> - branch=3Dlinux-devel/devel-hourly-20210304-162318
>> - commit=3D80cb403876fc973389d6ea100a3eea11d81e6f2d
>> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea10=
0a3eea11d81e6f2d/vmlinuz-5.12.0-rc1-00052-g80cb403876fc
>> - max_uptime=3D2100
>> - RESULT_ROOT=3D/result/stress-ng/network-performance-1HDD-100%-sockabus=
e-60s-ucode=3D0x5003006-monitor=3D70d6d718/lkp-csl-2sp5/debian-10.4-x86_64-=
20200603.cgz/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea100a3eea11d81e6f2d=
/0
>> - LKP_SERVER=3Dinternal-lkp-server
>> - nokaslr
>> - selinux=3D0
>> - debug
>> - apic=3Ddebug
>> - sysrq_always_enabled
>> - rcupdate.rcu_cpu_stall_timeout=3D100
>> - net.ifnames=3D0
>> - printk.devkmsg=3Don
>> - panic=3D-1
>> - softlockup_panic=3D1
>> - nmi_watchdog=3Dpanic
>> - oops=3Dpanic
>> - load_ramdisk=3D2
>> - prompt_ramdisk=3D0
>> - drbd.minor_count=3D8
>> - systemd.log_level=3Derr
>> - ignore_loglevel
>> - console=3Dtty0
>> - earlyprintk=3DttyS0,115200
>> - console=3DttyS0,115200
>> - vga=3Dnormal
>> - rw
>> modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea=
100a3eea11d81e6f2d/modules.cgz"
>> bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_2=
0200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20201211.cgz,=
/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/os=
image/deps/debian-10.4-x86_64-20200603.cgz/stress-ng_20210105.cgz,/osimage/=
pkg/debian-10.4-x86_64-20200603.cgz/stress-ng-x86_64-0.11-06_20210105.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/osimage/d=
eps/debian-10.4-x86_64-20200603.cgz/perf_20201126.cgz,/osimage/pkg/debian-1=
0.4-x86_64-20200603.cgz/perf-x86_64-e71ba9452f0b-1_20210106.cgz,/osimage/pk=
g/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cgz,/osimag=
e/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
>> ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
>> lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
>> site: inn
>>
>> #! /lkp/lkp/.src-20210304-151455/include/site/inn
>> LKP_CGI_PORT: 80
>> LKP_CIFS_PORT: 139
>> oom-killer:
>> watchdog:
>>
>> #! runtime status
>> last_kernel: 5.12.0-rc1-intel-next-00549-g47abbb46378b
>> repeat_to: 3
>>
>> #! user overrides
>> queue_at_least_once: 0
>> kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/80cb403876fc973389d6ea100a3eea=
11d81e6f2d/vmlinuz-5.12.0-rc1-00052-g80cb403876fc"
>> dequeue_time: 2021-03-05 10:45:57.430040685 +08:00
>> job_state: finished
>> loadavg: 1.28 0.49 0.18 1/887 4533
>> start_time: '1614912405'
>> end_time: '1614912467'
>> version: "/lkp/lkp/.src-20210304-151526:5ad520b4:ecf99d3f4"
>> for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
>> do
>> 	online_file=3D"$cpu_dir"/online
>> 	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue
>>
>> 	file=3D"$cpu_dir"/cpufreq/scaling_governor
>> 	[ -f "$file" ] && echo "performance" > "$file"
>> done
>>
>>   "stress-ng" "--timeout" "60" "--times" "--verify" "--metrics-brief" "-=
-sockabuse" "96"
> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org

-- =

Zhengjun Xing

--===============5122180235784828487==--

