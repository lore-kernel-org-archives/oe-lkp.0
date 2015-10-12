Content-Type: multipart/mixed; boundary="===============4096501292677276610=="
MIME-Version: 1.0
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 98d8fd8126: -20.8% hackbench.throughput
Date: Mon, 12 Oct 2015 19:43:46 +0100
Message-ID: <561BFF62.20503@arm.com>
In-Reply-To: <87si64mv9a.fsf@yhuang-dev.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4096501292677276610==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Ying,

On 24/09/15 03:00, kernel test robot wrote:
> FYI, we noticed the below changes on
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git sched/core
> commit 98d8fd8126676f7ba6e133e65b2ca4b17989d32c ("sched/fair: Initialize =
task load and utilization before placing task on rq")
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> tbox_group/testcase/rootfs/kconfig/compiler/nr_threads/mode/ipc:
>   lkp-ws02/hackbench/debian-x86_64-2015-02-07.cgz/x86_64-rhel/gcc-4.9/160=
0%/process/pipe
> =

> commit: =

>   231678b768da07d19ab5683a39eeb0c250631d02
>   98d8fd8126676f7ba6e133e65b2ca4b17989d32c
> =

> 231678b768da07d1 98d8fd8126676f7ba6e133e65b =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     188818 =C2=B1  1%     -20.8%     149585 =C2=B1  1%  hackbench.through=
put

[...]

> =

> lkp-ws02: Westmere-EP
> Memory: 16G
> =

> =

> =

> =

>                       hackbench.time.involuntary_context_switches
> =

>     3e+08 ++------------------------O------------------------------------=
---+
>           O  O         O   O     O                                       =
   |
>   2.5e+08 ++     O                                                O  O   =
O  O
>           |         O                   O     O      O                   =
   |
>           |                   O                   O     O   O            =
   |
>     2e+08 ++                               O                             =
   |
>           |                                                    O         =
   |
>   1.5e+08 ++                                                             =
   |
>           |                                                              =
   |
>     1e+08 ++                                                             =
   |
>           |                                  .*...*..*..*...*..*         =
   |
>           *..*...*..*..*...*..  .*..  ..*..*.                            =
   |
>     5e+07 ++                  *.    *.                                   =
   |
>           |                                                              =
   |
>         0 ++-------------------------------------------------------------=
---+
> =

>                                   vmstat.system.in
> =

>   300000 ++--------------------------------------------------------------=
---+
>          |                O     O   O                                    =
   |
>          O            O      O                                       O   =
O  |
>   250000 ++ O   O                                                 O      =
   O
>          |         O                                                     =
   |
>          |                             O      O  O   O  O  O             =
   |
>   200000 ++                                O                   O         =
   |
>          |                                                               =
   |
>   150000 ++                                                              =
   |
>          |                                                               =
   |
>          |                                                               =
   |
>   100000 ++                                                              =
   |
>          |           .*...                   .*..*...*..*..*...*         =
   |
>          *..*...*..*.     *..  .*...  .*...*.                            =
   |
>    50000 ++------------------*------*------------------------------------=
---+
> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml

I try to recreate this on one of my Intel machines (Xeon CPU E5-2650 v2
@ 2.60GHz) w/ 16 logical cpus. We haven't seen anything near a 20%
performance degradation for hackbench when we were running our hackbench
tests on 5/6 core arm machines as well as on a IVB-EP (2*10*2) Intel
machine.

So I cloned the repo:

# git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg
/lkp-tests.git lkp-tests

and ran the hackbench example:

root # lkp install $LKP_SRC/jobs/hackbench.yaml

root # lkp split-job $LKP_SRC/jobs/hackbench.yaml

root # lkp run ./hackbench-50%-threads-socket.yaml

2015-10-12 19:27:20 /usr/bin/hackbench -g 8 --threads -l 60000
Running in threaded mode with 8 groups using 40 file descriptors each
(=3D=3D 320 tasks)
Each sender will pass 60000 messages of 100 bytes
...
wait for background monitors: perf-profile uptime proc-vmstat proc-stat
meminfo slabinfo interrupts softirqs diskstats cpuidle turbostat sched_debug

root # lkp result hackbench

/result/hackbench/50%-threads-socket-50/$MACHINE/ubuntu/defconfig/gcc-4.8/3=
.16.0-50-generic/0/

But I can't get any statistics out of it?

root # lkp stat hackbench
runs sum average stddev% case

Thanks for your help in advance!

-- Dietmar

[...]


--===============4096501292677276610==--

