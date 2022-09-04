Content-Type: multipart/mixed; boundary="===============1541807499653480464=="
MIME-Version: 1.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: lkp@lists.01.org
Subject: Re: [copy_page_{to, from}_iter()] 59bb69c67c: hackbench.throughput -37.6% regression
Date: Sun, 04 Sep 2022 12:44:11 +0200
Message-ID: <5d611439-3b09-af07-b579-139eee276a70@leemhuis.info>
In-Reply-To: <8a410343-b82a-0972-0f26-cc63b50d2ef9@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1541807499653480464==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

As per recent general discussions with the 0-day folks, I'm dropping
below regression from the list of tracked issues, as there were no
replies from any developers the report was sent to. That for example can
happen if the developers considered the difference of no practical
relevance, as they assume it only materializes in micro-benchmarks.

Not sure if that or something else is the reason why this particular
report was ignored, but I lack the bandwidth to follow-up on each and
every some CI system found and reported. At the same time I don't want
to keep these reports in the list of tracked issues forever, as that
creates noise and makes it harder to spot the important issues in
regzbot's reports and lists. That's why I hearby remove it:

#regzbot invalid: 0-day report that didn't get tracktion; might be of no
relevance

Ciao, Thorsten

On 22.08.22 03:13, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -37.6% regression of hackbench.throughput due to commit:
> =

> =

> commit: 59bb69c67cf1475a04cd5629d9c4f6dbbcba5e4a
> ("copy_page_{to,from}_iter(): switch iovec variants to generic")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: hackbench
> on test machine: 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CPU @
> 2.50GHz with 128G memory
> with following parameters:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0nr_threads: 100%
> =C2=A0=C2=A0=C2=A0=C2=A0iterations: 4
> =C2=A0=C2=A0=C2=A0=C2=A0mode: threads
> =C2=A0=C2=A0=C2=A0=C2=A0ipc: pipe
> =C2=A0=C2=A0=C2=A0=C2=A0cpufreq_governor: performance
> =C2=A0=C2=A0=C2=A0=C2=A0ucode: 0x7002501
> =

> test-description: Hackbench is both a benchmark and a stress test for
> the Linux kernel scheduler.
> test-url:
> https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/sc=
hed/cfs-scheduler/hackbench.c
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <yujie.liu@intel.com>
> =

> =

> To reproduce:
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 git clone https://github.com/i=
ntel/lkp-tests.git
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cd lkp-tests
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp install job.yaml=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # job file is =
attached
> in this email
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bin/lkp split-job --compatible=
 job.yaml # generate the yaml file
> for lkp run
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sudo bin/lkp run generated-yam=
l-file
> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # if come across any failure t=
hat blocks the test,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # please remove ~/.lkp and /lk=
p dir to run from a clean state.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/t=
box_group/testcase/ucode:
> =C2=A0
> gcc-11/performance/pipe/4/x86_64-rhel-8.3/threads/100%/debian-11.1-x86_64=
-20220510.cgz/lkp-cpl-4sp1/hackbench/0x7002501
> =

> commit:
> =C2=A0 164f4064ca ("keep iocb_flags() result cached in struct file")
> =C2=A0 59bb69c67c ("copy_page_{to,from}_iter(): switch iovec variants to
> generic")
> =

> 164f4064ca81eefc 59bb69c67cf1475a04cd5629d9c
> ---------------- ---------------------------
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=C2=A0=C2=
=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
\=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
> =C2=A0=C2=A0=C2=A0 489102=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -37.6%=C2=A0=C2=A0=C2=A0=C2=A0 305349 =C2=B1 13%=C2=A0 hackben=
ch.throughput
> =C2=A0=C2=A0=C2=A0 152.60=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +80.1%=C2=A0=C2=A0=C2=A0=C2=A0 274.90 =C2=B1 10%=C2=A0 hackben=
ch.time.elapsed_time
> =C2=A0=C2=A0=C2=A0 152.60=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +80.1%=C2=A0=C2=A0=C2=A0=C2=A0 274.90 =C2=B1 10%=C2=A0
> hackbench.time.elapsed_time.max
> =C2=A01.404e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +10=
1.3%=C2=A0 2.827e+09 =C2=B1 14%=C2=A0
> hackbench.time.involuntary_context_switches
> =C2=A0=C2=A0=C2=A0 986.17 =C2=B1 18%=C2=A0=C2=A0=C2=A0 +136.2%=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 2328 =C2=B1 15%=C2=A0
> hackbench.time.major_page_faults
> =C2=A0=C2=A0=C2=A0 274197 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0 +142.3%=C2=A0=
=C2=A0=C2=A0=C2=A0 664339 =C2=B1 13%=C2=A0
> hackbench.time.minor_page_faults
> =C2=A0=C2=A0=C2=A0=C2=A0 13936=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -3.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13497=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> hackbench.time.percent_of_cpu_this_job_got
> =C2=A0=C2=A0=C2=A0=C2=A0 19872=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +75.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34829 =C2=B1 11%=C2=
=A0 hackbench.time.system_time
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1396=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +63.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2282 =
=C2=B1 11%=C2=A0 hackbench.time.user_time
> =C2=A02.338e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +79.0%=C2=A0 4.184e+09 =C2=B1=C2=A0 9%=C2=A0
> hackbench.time.voluntary_context_switches
> =C2=A0 13265456 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 -22.9%=C2=A0=C2=A0 102=
29449 =C2=B1=C2=A0 9%=C2=A0 cpuidle..usage
> =C2=A0=C2=A0=C2=A0 198.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +61.5%=C2=A0=C2=A0=C2=A0=C2=A0 320.24 =C2=B1=C2=A0 9%=C2=A0 up=
time.boot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +3.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.95 =C2=B1=C2=A0 =
6%=C2=A0 mpstat.cpu.all.irq%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1=C2=A0 =
9%=C2=A0 mpstat.cpu.all.soft%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1463=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +22.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1789 =
=C2=B1=C2=A0 6%=C2=A0 vmstat.procs.r
> =C2=A0=C2=A0 1813234=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +53.8%=C2=A0=C2=A0=C2=A0 2788498 =C2=B1=C2=A0 8%=C2=A0 vmstat.sys=
tem.in
> =C2=A0=C2=A0=C2=A0=C2=A0 57096 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +133.1%=C2=A0=
=C2=A0=C2=A0=C2=A0 133100 =C2=B1 49%=C2=A0 meminfo.Active
> =C2=A0=C2=A0=C2=A0=C2=A0 56878 =C2=B1 14%=C2=A0=C2=A0=C2=A0 +133.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 132977 =C2=B1 49%=C2=A0 meminfo.Active(anon)
> =C2=A0=C2=A0=C2=A0 160758 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +34.3%=
=C2=A0=C2=A0=C2=A0=C2=A0 215911 =C2=B1=C2=A0 6%=C2=A0 meminfo.AnonHugePages
> =C2=A0=C2=A0=C2=A0 326854 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +95.0%=
=C2=A0=C2=A0=C2=A0=C2=A0 637420 =C2=B1=C2=A0 7%=C2=A0 meminfo.Mapped
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3031=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 30=
93=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 turbostat.Bzy_MHz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 67%=C2=A0=C2=A0=C2=A0=C2=A0 -8=
9.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 38%=C2=A0 turbostat.CP=
U%c6
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -23.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =
=C2=B1=C2=A0 6%=C2=A0 turbostat.IPC
> =C2=A03.029e+08=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +17=
2.5%=C2=A0 8.253e+08 =C2=B1=C2=A0 4%=C2=A0 turbostat.IRQ
> =C2=A0=C2=A0 3398377 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0 -84.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 520088 =C2=B1 12%=C2=A0 turbostat.POLL
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 70%=C2=A0 tu=
rbostat.POLL%
> =C2=A0=C2=A0=C2=A0=C2=A0 10.02=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +37.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 13.79=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 turbostat.RAMWatt
> =C2=A0 14027902 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -69.3%=C2=A0=C2=A0=C2=
=A0 4313384 =C2=B1 24%=C2=A0
> numa-numastat.node0.local_node
> =C2=A0 14083684 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -69.1%=C2=A0=C2=A0=C2=
=A0 4354549 =C2=B1 24%=C2=A0 numa-numastat.node0.numa_hit
> =C2=A0 12038117 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -62.5%=C2=A0=C2=A0=C2=
=A0 4519914 =C2=B1 37%=C2=A0
> numa-numastat.node1.local_node
> =C2=A0 12092443 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -62.2%=C2=A0=C2=A0=C2=
=A0 4567078 =C2=B1 36%=C2=A0 numa-numastat.node1.numa_hit
> =C2=A0 11573244 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -67.1%=C2=A0=C2=
=A0=C2=A0 3801899 =C2=B1 10%=C2=A0
> numa-numastat.node2.local_node
> =C2=A0 11615332 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -66.8%=C2=A0=C2=
=A0=C2=A0 3851401 =C2=B1 11%=C2=A0 numa-numastat.node2.numa_hit
> =C2=A0 11405434 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -55.6%=C2=A0=C2=
=A0=C2=A0 5062395 =C2=B1 23%=C2=A0
> numa-numastat.node3.local_node
> =C2=A0 11447818 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -55.3%=C2=A0=C2=
=A0=C2=A0 5119841 =C2=B1 23%=C2=A0 numa-numastat.node3.numa_hit
> =C2=A0=C2=A0=C2=A0=C2=A0 67489 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +63.9%=
=C2=A0=C2=A0=C2=A0=C2=A0 110630 =C2=B1 13%=C2=A0 numa-meminfo.node0.Mapped
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4571 =C2=B1136%=C2=A0=C2=A0=C2=A0 +348.9%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20520 =C2=B1 81%=C2=A0
> numa-meminfo.node1.AnonHugePages
> =C2=A0=C2=A0=C2=A0=C2=A0 66557 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 +48.4%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 98758 =C2=B1 13%=C2=A0 numa-meminfo.node1.Ma=
pped
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5303 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0 +11.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5921 =C2=B1=C2=A0 7%=C2=A0
> numa-meminfo.node2.KernelStack
> =C2=A0=C2=A0=C2=A0=C2=A0 52917 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +8=
6.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 98805 =C2=B1=C2=A0 6%=C2=A0 numa-meminfo=
.node2.Mapped
> =C2=A0=C2=A0=C2=A0=C2=A0 53719 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +80.8%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 97098 =C2=B1 14%=C2=A0 numa-meminfo.node3.Ac=
tive
> =C2=A0=C2=A0=C2=A0=C2=A0 53607 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 +81.1%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 97079 =C2=B1 14%=C2=A0
> numa-meminfo.node3.Active(anon)
> =C2=A0=C2=A0=C2=A0 141608 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +135.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 333801 =C2=B1=C2=A0 9%=C2=A0 numa-meminfo.node3.Mapped
> =C2=A0=C2=A0 1295651 =C2=B1 28%=C2=A0=C2=A0=C2=A0=C2=A0 +84.6%=C2=A0=C2=
=A0=C2=A0 2391708 =C2=B1 42%=C2=A0 numa-meminfo.node3.MemUsed
> =C2=A0=C2=A0=C2=A0=C2=A0 17123 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 +62.9%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27899 =C2=B1 14%=C2=A0 numa-vmstat.node0.nr_=
mapped
> =C2=A0 14083744 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -69.1%=C2=A0=C2=A0=C2=
=A0 4354624 =C2=B1 24%=C2=A0 numa-vmstat.node0.numa_hit
> =C2=A0 14027962 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 -69.3%=C2=A0=C2=A0=C2=
=A0 4313459 =C2=B1 24%=C2=A0 numa-vmstat.node0.numa_local
> =C2=A0=C2=A0=C2=A0=C2=A0 16922 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0 +46.8%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24848 =C2=B1 13%=C2=A0 numa-vmstat.node1.nr_=
mapped
> =C2=A0 12092369 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -62.2%=C2=A0=C2=A0=C2=
=A0 4567042 =C2=B1 36%=C2=A0 numa-vmstat.node1.numa_hit
> =C2=A0 12038043 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -62.5%=C2=A0=C2=A0=C2=
=A0 4519877 =C2=B1 37%=C2=A0 numa-vmstat.node1.numa_local
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5303 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0 +11.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5920 =C2=B1=C2=A0 7%=C2=A0
> numa-vmstat.node2.nr_kernel_stack
> =C2=A0=C2=A0=C2=A0=C2=A0 13496 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +8=
4.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24884 =C2=B1=C2=A0 6%=C2=A0 numa-vmstat.=
node2.nr_mapped
> =C2=A0 11615668 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -66.8%=C2=A0=C2=
=A0=C2=A0 3851152 =C2=B1 11%=C2=A0 numa-vmstat.node2.numa_hit
> =C2=A0 11573580 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -67.2%=C2=A0=C2=
=A0=C2=A0 3801650 =C2=B1 10%=C2=A0 numa-vmstat.node2.numa_local
> =C2=A0=C2=A0=C2=A0=C2=A0 13880 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +75.0%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24296 =C2=B1 16%=C2=A0
> numa-vmstat.node3.nr_active_anon
> =C2=A0=C2=A0=C2=A0=C2=A0 36367 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0 +130.7%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 83911 =C2=B1 10%=C2=A0 numa-vmstat.node3.nr_=
mapped
> =C2=A0=C2=A0=C2=A0=C2=A0 13880 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 +75.0%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 24296 =C2=B1 16%=C2=A0
> numa-vmstat.node3.nr_zone_active_anon
> =C2=A0 11447946 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -55.3%=C2=A0=C2=
=A0=C2=A0 5119567 =C2=B1 23%=C2=A0 numa-vmstat.node3.numa_hit
> =C2=A0 11405562 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -55.6%=C2=A0=C2=
=A0=C2=A0 5062121 =C2=B1 23%=C2=A0 numa-vmstat.node3.numa_local
> =C2=A0=C2=A0=C2=A0=C2=A0 14221 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +133.7%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 33239 =C2=B1 49%=C2=A0 proc-vmstat.nr_active_anon
> =C2=A0=C2=A0=C2=A0=C2=A0 87510=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +6.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 92997=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_anon_pages
> =C2=A0=C2=A0=C2=A0 100316=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 -6.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 94080=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 proc-vmstat.nr_kernel_stack
> =C2=A0=C2=A0=C2=A0=C2=A0 81858 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +9=
4.7%=C2=A0=C2=A0=C2=A0=C2=A0 159397 =C2=B1=C2=A0 8%=C2=A0 proc-vmstat.nr_ma=
pped
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1443=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +4.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15=
14=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> proc-vmstat.nr_page_table_pages
> =C2=A0=C2=A0=C2=A0=C2=A0 34015=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +2.0%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34707=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> proc-vmstat.nr_slab_reclaimable
> =C2=A0=C2=A0=C2=A0=C2=A0 99374=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -1.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 97758=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> proc-vmstat.nr_slab_unreclaimable
> =C2=A0=C2=A0=C2=A0=C2=A0 14221 =C2=B1 12%=C2=A0=C2=A0=C2=A0 +133.7%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 33239 =C2=B1 49%=C2=A0
> proc-vmstat.nr_zone_active_anon
> =C2=A0=C2=A0=C2=A0 367327 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +98.5%=C2=A0=
=C2=A0=C2=A0=C2=A0 729299 =C2=B1=C2=A0 8%=C2=A0 proc-vmstat.numa_hint_faults
> =C2=A0=C2=A0=C2=A0 219391 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +139.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 526037 =C2=B1 11%=C2=A0
> proc-vmstat.numa_hint_faults_local
> =C2=A0 49242297 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -63.7%=C2=A0=C2=
=A0 17894676 =C2=B1 14%=C2=A0 proc-vmstat.numa_hit
> =C2=A0 49047749 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -63.9%=C2=A0=C2=
=A0 17699399 =C2=B1 14%=C2=A0 proc-vmstat.numa_local
> =C2=A0=C2=A0=C2=A0=C2=A0 62425 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +70.6%=
=C2=A0=C2=A0=C2=A0=C2=A0 106470 =C2=B1 14%=C2=A0
> proc-vmstat.numa_pages_migrated
> =C2=A0=C2=A0=C2=A0 590356 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0=C2=A0 +72.2%=
=C2=A0=C2=A0=C2=A0 1016367 =C2=B1=C2=A0 5%=C2=A0 proc-vmstat.numa_pte_updat=
es
> =C2=A0 49230729 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -63.7%=C2=A0=C2=
=A0 17893980 =C2=B1 14%=C2=A0 proc-vmstat.pgalloc_normal
> =C2=A0=C2=A0 1177103 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +52.5%=C2=A0=
=C2=A0=C2=A0 1795115 =C2=B1=C2=A0 5%=C2=A0 proc-vmstat.pgfault
> =C2=A0 48382203 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 -64.7%=C2=A0=C2=
=A0 17055561 =C2=B1 12%=C2=A0 proc-vmstat.pgfree
> =C2=A0=C2=A0=C2=A0=C2=A0 62425 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0 +70.6%=
=C2=A0=C2=A0=C2=A0=C2=A0 106470 =C2=B1 14%=C2=A0 proc-vmstat.pgmigrate_succ=
ess
> =C2=A0=C2=A0=C2=A0=C2=A0 24411=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +33.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32664 =C2=B1=C2=A0 =
6%=C2=A0 proc-vmstat.pgreuse
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1 44%=C2=A0=C2=A0=C2=A0 +288.5%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.16 =C2=B1 61%=C2=A0
> sched_debug.cfs_rq:/.h_nr_running.min
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.62 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0 -5=
0.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.28 =C2=B1 25%=C2=A0
> sched_debug.cfs_rq:/.h_nr_running.stddev
> =C2=A0=C2=A0=C2=A0=C2=A0 31.46 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0 -34.9%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20.48 =C2=B1 21%=C2=A0
> sched_debug.cfs_rq:/.load_avg.avg
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.17 =C2=B1 42%=C2=A0=C2=A0=C2=A0 +127.9%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.66 =C2=B1 28%=C2=A0
> sched_debug.cfs_rq:/.load_avg.min
> =C2=A0=C2=A0=C2=A0=C2=A0 87.49 =C2=B1 18%=C2=A0=C2=A0=C2=A0=C2=A0 -33.2%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 58.48 =C2=B1 24%=C2=A0
> sched_debug.cfs_rq:/.load_avg.stddev
> =C2=A0=C2=A0 8625569=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +113.5%=C2=A0=C2=A0 18419082 =C2=B1=C2=A0 9%=C2=A0
> sched_debug.cfs_rq:/.min_vruntime.avg
> =C2=A0 10168067 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0 +147.5%=C2=A0=C2=A0 251=
67143 =C2=B1 12%=C2=A0
> sched_debug.cfs_rq:/.min_vruntime.max
> =C2=A0=C2=A0 7592982 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0 +100.6%=C2=A0=C2=
=A0 15232132 =C2=B1 13%=C2=A0
> sched_debug.cfs_rq:/.min_vruntime.min
> =C2=A0=C2=A0=C2=A0 617068 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +160.1%=C2=A0=C2=
=A0=C2=A0 1604747 =C2=B1=C2=A0 8%=C2=A0
> sched_debug.cfs_rq:/.min_vruntime.stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.69=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +15.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.80 =
=C2=B1=C2=A0 3%=C2=A0
> sched_debug.cfs_rq:/.nr_running.avg
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0 +6=
3.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.72 =C2=B1 20%=C2=A0
> sched_debug.cfs_rq:/.nr_running.min
> =C2=A0=C2=A0=C2=A0=C2=A0 20.05 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0 -53.0%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.43 =C2=B1 36%=C2=A0
> sched_debug.cfs_rq:/.removed.load_avg.avg
> =C2=A0=C2=A0=C2=A0 341.33=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 -37.0%=C2=A0=C2=A0=C2=A0=C2=A0 214.90 =C2=B1=C2=A0 8%=C2=A0
> sched_debug.cfs_rq:/.removed.load_avg.max
> =C2=A0=C2=A0=C2=A0=C2=A0 78.01 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -44.9%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 43.02 =C2=B1 13%=C2=A0
> sched_debug.cfs_rq:/.removed.load_avg.stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.16 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -5=
0.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.56 =C2=B1 32%=C2=A0
> sched_debug.cfs_rq:/.removed.runnable_avg.avg
> =C2=A0=C2=A0=C2=A0 176.72 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -36.3%=
=C2=A0=C2=A0=C2=A0=C2=A0 112.65 =C2=B1=C2=A0 7%=C2=A0
> sched_debug.cfs_rq:/.removed.runnable_avg.max
> =C2=A0=C2=A0=C2=A0=C2=A0 36.16 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -41.7%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.08 =C2=B1 11%=C2=A0
> sched_debug.cfs_rq:/.removed.runnable_avg.stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.16 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -5=
0.3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.55 =C2=B1 32%=C2=A0
> sched_debug.cfs_rq:/.removed.util_avg.avg
> =C2=A0=C2=A0=C2=A0 176.72 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 -36.4%=
=C2=A0=C2=A0=C2=A0=C2=A0 112.42 =C2=B1=C2=A0 8%=C2=A0
> sched_debug.cfs_rq:/.removed.util_avg.max
> =C2=A0=C2=A0=C2=A0=C2=A0 36.16 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0 -41.8%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 21.06 =C2=B1 11%=C2=A0
> sched_debug.cfs_rq:/.removed.util_avg.stddev
> =C2=A0=C2=A0 1638316 =C2=B1 32%=C2=A0=C2=A0=C2=A0 +285.2%=C2=A0=C2=A0=C2=
=A0 6311285 =C2=B1 18%=C2=A0
> sched_debug.cfs_rq:/.spread0.max
> =C2=A0=C2=A0 -846609=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +332.4%=C2=A0=C2=A0 -3660690=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> sched_debug.cfs_rq:/.spread0.min
> =C2=A0=C2=A0=C2=A0 600389 =C2=B1 15%=C2=A0=C2=A0=C2=A0 +164.3%=C2=A0=C2=
=A0=C2=A0 1586953 =C2=B1=C2=A0 7%=C2=A0
> sched_debug.cfs_rq:/.spread0.stddev
> =C2=A0=C2=A0=C2=A0 724.12 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +15.6%=
=C2=A0=C2=A0=C2=A0=C2=A0 836.78 =C2=B1=C2=A0 4%=C2=A0
> sched_debug.cfs_rq:/.util_avg.avg
> =C2=A0=C2=A0=C2=A0 301.06 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0 +67.7%=C2=A0=
=C2=A0=C2=A0=C2=A0 504.82 =C2=B1=C2=A0 9%=C2=A0
> sched_debug.cfs_rq:/.util_avg.min
> =C2=A0=C2=A0=C2=A0 199.53 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0 -29.8%=
=C2=A0=C2=A0=C2=A0=C2=A0 140.12 =C2=B1=C2=A0 9%=C2=A0
> sched_debug.cfs_rq:/.util_avg.stddev
> =C2=A0=C2=A0=C2=A0 334.32 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +53.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 512.20 =C2=B1 16%=C2=A0
> sched_debug.cfs_rq:/.util_est_enqueued.avg
> =C2=A0=C2=A0=C2=A0=C2=A0 16.06 =C2=B1 63%=C2=A0=C2=A0=C2=A0 +502.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 96.68 =C2=B1 55%=C2=A0
> sched_debug.cfs_rq:/.util_est_enqueued.min
> =C2=A0=C2=A0=C2=A0 105237 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +60.0%=
=C2=A0=C2=A0=C2=A0=C2=A0 168333 =C2=B1=C2=A0 7%=C2=A0 sched_debug.cpu.clock=
.avg
> =C2=A0=C2=A0=C2=A0 105780 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +61.4%=
=C2=A0=C2=A0=C2=A0=C2=A0 170776 =C2=B1=C2=A0 7%=C2=A0 sched_debug.cpu.clock=
.max
> =C2=A0=C2=A0=C2=A0 104562 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +57.9%=
=C2=A0=C2=A0=C2=A0=C2=A0 165117 =C2=B1=C2=A0 7%=C2=A0 sched_debug.cpu.clock=
.min
> =C2=A0=C2=A0=C2=A0 374.97 =C2=B1 58%=C2=A0=C2=A0=C2=A0 +328.7%=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 1607 =C2=B1 52%=C2=A0 sched_debug.cpu.clock.std=
dev
> =C2=A0=C2=A0=C2=A0 104364 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +55.3%=
=C2=A0=C2=A0=C2=A0=C2=A0 162027 =C2=B1=C2=A0 7%=C2=A0
> sched_debug.cpu.clock_task.avg
> =C2=A0=C2=A0=C2=A0 105020 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +57.9%=
=C2=A0=C2=A0=C2=A0=C2=A0 165873 =C2=B1=C2=A0 6%=C2=A0
> sched_debug.cpu.clock_task.max
> =C2=A0=C2=A0=C2=A0 101770 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +54.2%=
=C2=A0=C2=A0=C2=A0=C2=A0 156906 =C2=B1=C2=A0 7%=C2=A0
> sched_debug.cpu.clock_task.min
> =C2=A0=C2=A0=C2=A0 519.26 =C2=B1 40%=C2=A0=C2=A0=C2=A0 +251.6%=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 1825 =C2=B1 32%=C2=A0
> sched_debug.cpu.clock_task.stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8702 =C2=B1 50%=C2=A0=C2=A0=C2=A0=C2=A0 +4=
7.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12838 =C2=B1 11%=C2=A0 sched_debug.cpu.c=
urr->pid.min
> =C2=A0=C2=A0 1397213 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0 -31.6%=C2=A0=C2=
=A0=C2=A0=C2=A0 955865 =C2=B1 27%=C2=A0
> sched_debug.cpu.max_idle_balance_cost.max
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 57%=C2=A0=C2=A0=C2=A0 +325.8%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 52%=C2=A0
> sched_debug.cpu.next_balance.stddev
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 33%=C2=A0=C2=A0=C2=A0 +351.7%=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.26 =C2=B1 53%=C2=A0
> sched_debug.cpu.nr_running.min
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.66 =C2=B1 13%=C2=A0=C2=A0=C2=A0=C2=A0 -5=
0.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.32 =C2=B1 26%=C2=A0
> sched_debug.cpu.nr_running.stddev
> =C2=A0 10618467=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +11=
6.7%=C2=A0=C2=A0 23010023 =C2=B1 10%=C2=A0
> sched_debug.cpu.nr_switches.avg
> =C2=A0 11604438 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0 +146.5%=C2=A0=C2=A0 286=
05638 =C2=B1=C2=A0 9%=C2=A0
> sched_debug.cpu.nr_switches.max
> =C2=A0=C2=A0 9614849 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +69.4%=C2=A0=
=C2=A0 16290926 =C2=B1 11%=C2=A0
> sched_debug.cpu.nr_switches.min
> =C2=A0=C2=A0=C2=A0 409020 =C2=B1 26%=C2=A0=C2=A0=C2=A0 +482.2%=C2=A0=C2=
=A0=C2=A0 2381126 =C2=B1 14%=C2=A0
> sched_debug.cpu.nr_switches.stddev
> =C2=A0=C2=A0=C2=A0 104527 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +57.9%=
=C2=A0=C2=A0=C2=A0=C2=A0 165046 =C2=B1=C2=A0 7%=C2=A0 sched_debug.cpu_clk
> =C2=A0=C2=A0=C2=A0 103657 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +58.4%=
=C2=A0=C2=A0=C2=A0=C2=A0 164178 =C2=B1=C2=A0 7%=C2=A0 sched_debug.ktime
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1181%=C2=A0 +10052.7%=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1141%=C2=A0
> sched_debug.rt_rq:/.rt_time.avg
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1218%=C2=A0 +11898.7%=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 45.56 =C2=B1142%=C2=A0
> sched_debug.rt_rq:/.rt_time.max
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.03 =C2=B1210%=C2=A0 +11503.4%=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.78 =C2=B1142%=C2=A0
> sched_debug.rt_rq:/.rt_time.stddev
> =C2=A0=C2=A0=C2=A0 105896 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +57.2%=
=C2=A0=C2=A0=C2=A0=C2=A0 166486 =C2=B1=C2=A0 7%=C2=A0 sched_debug.sched_clk
> =C2=A0=C2=A0=C2=A0=C2=A0 11.37=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +9.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.51=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.MPKI
> =C2=A04.608e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -22.9%=C2=A0 3.553e+10 =C2=B1=C2=A0 4%=C2=A0
> perf-stat.i.branch-instructions
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.98=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.17=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.branch-miss-=
rate%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.23 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=
=A0 +13.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 17.25 =C2=B1=C2=A0 3%=C2=A0 p=
erf-stat.i.cache-miss-rate%
> =C2=A0 94243104 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +232.8%=C2=A0 3.136e+08=
 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.cache-misses
> =C2=A02.441e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -14.5%=C2=A0 2.086e+09 =C2=B1=C2=A0 5%=C2=A0 perf-stat.i.cache-referenc=
es
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.99=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +60.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.20 =
=C2=B1=C2=A0 8%=C2=A0 perf-stat.i.cpi
> =C2=A04.246e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +2.6%=C2=A0 4.358e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
erf-stat.i.cpu-cycles
> =C2=A0=C2=A0 1946034 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0 +31.7%=C2=A0=
=C2=A0=C2=A0 2562014 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.cpu-migrations
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4979 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=
=A0 -71.5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1419 =C2=B1=C2=A0 3%=C2=A0
> perf-stat.i.cycles-between-cache-misses
> =C2=A06.662e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -23.5%=C2=A0=C2=A0=C2=A0 5.1e+10 =C2=B1=C2=A0 5%=C2=A0 perf-stat.i.dTLB=
-loads
> =C2=A0=C2=A0=C2=A0 187259 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +69.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 318016 =C2=B1=C2=A0 9%=C2=A0 perf-stat.i.dTLB-store-miss=
es
> =C2=A03.956e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -22.8%=C2=A0 3.055e+10 =C2=B1=C2=A0 5%=C2=A0 perf-stat.i.dTLB-stores
> =C2=A01.177e+08 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -35.3%=C2=A0=C2=
=A0 76112476 =C2=B1=C2=A0 6%=C2=A0 perf-stat.i.iTLB-load-misses
> =C2=A02.256e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -22.8%=C2=A0 1.742e+11 =C2=B1=C2=A0 5%=C2=A0 perf-stat.i.instructions
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1992 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0 +20.2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2394 =C2=B1=C2=A0 2%=C2=A0
> perf-stat.i.instructions-per-iTLB-miss
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -23.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =
=C2=B1=C2=A0 6%=C2=A0 perf-stat.i.ipc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.95=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +2.7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.=
02=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.i.metric.GHz
> =C2=A0=C2=A0=C2=A0 490.25 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +131.1%=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1133 =C2=B1=C2=A0 6%=C2=A0 perf-stat.i.metri=
c.K/sec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1073=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -22.9%=C2=A0=C2=A0=C2=A0=C2=A0 827.94 =C2=B1=C2=A0=
 5%=C2=A0 perf-stat.i.metric.M/sec
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6951 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=
=A0 -13.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6017 =C2=B1=C2=A0 6%=C2=A0 p=
erf-stat.i.minor-faults
> =C2=A0=C2=A0=C2=A0=C2=A0 87.95=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +6.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 94.67=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> perf-stat.i.node-load-miss-rate%
> =C2=A0 23701486 =C2=B1 11%=C2=A0=C2=A0=C2=A0 +465.2%=C2=A0=C2=A0 1.34e+08=
 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.node-load-misses
> =C2=A0=C2=A0 2999385 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +144.4%=C2=A0=C2=
=A0=C2=A0 7330698 =C2=B1=C2=A0 2%=C2=A0 perf-stat.i.node-loads
> =C2=A0=C2=A0=C2=A0=C2=A0 69.45 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +2=
8.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 98.01=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> perf-stat.i.node-store-miss-rate%
> =C2=A0 10499384 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +314.7%=C2=A0=C2=A0 435=
41240 =C2=B1=C2=A0 3%=C2=A0 perf-stat.i.node-store-misses
> =C2=A0=C2=A0 4750209 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -82.2%=C2=A0=
=C2=A0=C2=A0=C2=A0 845534 =C2=B1 29%=C2=A0 perf-stat.i.node-stores
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6960 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=
=A0 -13.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6027 =C2=B1=C2=A0 6%=C2=A0 p=
erf-stat.i.page-faults
> =C2=A0=C2=A0=C2=A0=C2=A0 10.79=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +10.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.96=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.overall.MPKI
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.94=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> perf-stat.overall.branch-miss-rate%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.87 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=
=A0 +11.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 15.04 =C2=B1=C2=A0 3%=C2=A0
> perf-stat.overall.cache-miss-rate%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.87=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +33.4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.50 =
=C2=B1=C2=A0 5%=C2=A0 perf-stat.overall.cpi
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4497 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0 -69.1%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1389 =C2=B1=C2=A0 3%=C2=A0
> perf-stat.overall.cycles-between-cache-misses
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1 10%=C2=
=A0
> perf-stat.overall.dTLB-load-miss-rate%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00 =C2=B1=C2=A0 8%=C2=
=A0
> perf-stat.overall.dTLB-store-miss-rate%
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1923 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=
=A0 +18.9%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2286 =C2=B1=C2=A0 2%=C2=A0
> perf-stat.overall.instructions-per-iTLB-miss
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -24.8%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =
=C2=B1=C2=A0 6%=C2=A0 perf-stat.overall.ipc
> =C2=A0=C2=A0=C2=A0=C2=A0 88.60=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 +6.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 94.80=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> perf-stat.overall.node-load-miss-rate%
> =C2=A0=C2=A0=C2=A0=C2=A0 68.41 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +2=
9.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 98.04=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0
> perf-stat.overall.node-store-miss-rate%
> =C2=A04.584e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -22.7%=C2=A0 3.545e+10 =C2=B1=C2=A0 4%=C2=A0
> perf-stat.ps.branch-instructions
> =C2=A0 93789280 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0 +232.8%=C2=A0 3.122e+08=
 =C2=B1=C2=A0 2%=C2=A0 perf-stat.ps.cache-misses
> =C2=A02.422e+09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -14.2%=C2=A0 2.078e+09 =C2=B1=C2=A0 5%=C2=A0 perf-stat.ps.cache-referen=
ces
> =C2=A04.205e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +3.0%=C2=A0 4.332e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 p=
erf-stat.ps.cpu-cycles
> =C2=A0=C2=A0 1916167 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0 +32.3%=C2=A0=
=C2=A0=C2=A0 2534886 =C2=B1=C2=A0 3%=C2=A0 perf-stat.ps.cpu-migrations
> =C2=A06.634e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -23.3%=C2=A0 5.091e+10 =C2=B1=C2=A0 5%=C2=A0 perf-stat.ps.dTLB-loads
> =C2=A0=C2=A0=C2=A0 185792 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0 +70.4%=C2=A0=
=C2=A0=C2=A0=C2=A0 316635 =C2=B1=C2=A0 9%=C2=A0
> perf-stat.ps.dTLB-store-misses
> =C2=A03.939e+10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -22.6%=C2=A0=C2=A0 3.05e+10 =C2=B1=C2=A0 5%=C2=A0 perf-stat.ps.dTLB-sto=
res
> =C2=A01.171e+08 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0 -35.0%=C2=A0=C2=
=A0 76093293 =C2=B1=C2=A0 6%=C2=A0 perf-stat.ps.iTLB-load-misses
> =C2=A02.245e+11=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -22.6%=C2=A0 1.738e+11 =C2=B1=C2=A0 5%=C2=A0 perf-stat.ps.instructions
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6810 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0 -12.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5951 =C2=B1=C2=A0 6%=C2=A0 p=
erf-stat.ps.minor-faults
> =C2=A0 23430403 =C2=B1 10%=C2=A0=C2=A0=C2=A0 +468.8%=C2=A0 1.333e+08 =C2=
=B1=C2=A0 3%=C2=A0 perf-stat.ps.node-load-misses
> =C2=A0=C2=A0 3007245 =C2=B1=C2=A0 8%=C2=A0=C2=A0=C2=A0 +142.9%=C2=A0=C2=
=A0=C2=A0 7304955=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 perf-stat.ps.no=
de-loads
> =C2=A0 10398685 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0 +316.5%=C2=A0=C2=A0 433=
06438 =C2=B1=C2=A0 3%=C2=A0
> perf-stat.ps.node-store-misses
> =C2=A0=C2=A0 4785933 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -81.8%=C2=A0=
=C2=A0=C2=A0=C2=A0 871562 =C2=B1 28%=C2=A0 perf-stat.ps.node-stores
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6818 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=
=A0 -12.6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5961 =C2=B1=C2=A0 6%=C2=A0 p=
erf-stat.ps.page-faults
> =C2=A03.473e+13=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +38.3%=C2=A0 4.803e+13 =C2=B1=C2=A0 6%=C2=A0 perf-stat.total.instructio=
ns
> =C2=A0=C2=A0=C2=A0=C2=A0 42.84 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -32.5=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.29 =C2=B1128%=C2=A0
> perf-profile.calltrace.cycles-pp.__get_user_nocheck_8.perf_callchain_user=
.get_perf_callchain.perf_callchain.perf_prepare_sample
> =C2=A0=C2=A0=C2=A0=C2=A0 41.85 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -31.8=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.04 =C2=B1128%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_callchain.perf_prepare_sample.perf_=
event_output_forward.__perf_event_overflow.perf_tp_event
> =C2=A0=C2=A0=C2=A0=C2=A0 41.79 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -31.8=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.02 =C2=B1128%=C2=A0
> perf-profile.calltrace.cycles-pp.get_perf_callchain.perf_callchain.perf_p=
repare_sample.perf_event_output_forward.__perf_event_overflow
> =C2=A0=C2=A0=C2=A0=C2=A0 30.90 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -23.5=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.40 =C2=B1127%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_callchain_user.get_perf_callchain.p=
erf_callchain.perf_prepare_sample.perf_event_output_forward
> =C2=A0=C2=A0=C2=A0=C2=A0 18.12 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -14.0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.11 =C2=B1127%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_event_output_forward.__perf_event_o=
verflow.perf_tp_event.perf_trace_sched_stat_runtime.update_curr
> =C2=A0=C2=A0=C2=A0=C2=A0 17.93 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -13.9=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.07 =C2=B1127%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_prepare_sample.perf_event_output_fo=
rward.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_runtime
> =C2=A0=C2=A0=C2=A0=C2=A0 14.00 =C2=B1 54%=C2=A0=C2=A0=C2=A0=C2=A0 -11.4=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.62 =C2=B1152%=C2=A0
> perf-profile.calltrace.cycles-pp.asm_exc_page_fault.__get_user_nocheck_8.=
perf_callchain_user.get_perf_callchain.perf_callchain
> =C2=A0=C2=A0=C2=A0=C2=A0 31.01 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -1=
0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20.50 =C2=B1 24%=C2=A0
> perf-profile.calltrace.cycles-pp.__schedule.schedule.pipe_read.new_sync_r=
ead.vfs_read
> =C2=A0=C2=A0=C2=A0=C2=A0 31.10 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=A0 -1=
0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 20.69 =C2=B1 23%=C2=A0
> perf-profile.calltrace.cycles-pp.schedule.pipe_read.new_sync_read.vfs_rea=
d.ksys_read
> =C2=A0=C2=A0=C2=A0=C2=A0 13.76 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0 -10.3=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.43 =C2=B1125%=C2=A0
> perf-profile.calltrace.cycles-pp.__perf_event_overflow.perf_tp_event.perf=
_trace_sched_switch.__schedule.schedule
> =C2=A0=C2=A0=C2=A0=C2=A0 13.73 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0 -10.3=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.42 =C2=B1125%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_event_output_forward.__perf_event_o=
verflow.perf_tp_event.perf_trace_sched_switch.__schedule
> =C2=A0=C2=A0=C2=A0=C2=A0 41.24 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -1=
0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31.11 =C2=B1 11%=C2=A0
> perf-profile.calltrace.cycles-pp.try_to_wake_up.autoremove_wake_function.=
__wake_up_common.__wake_up_common_lock.pipe_write
> =C2=A0=C2=A0=C2=A0=C2=A0 13.51 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0 -10.1=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.39 =C2=B1125%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_prepare_sample.perf_event_output_fo=
rward.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch
> =C2=A0=C2=A0=C2=A0=C2=A0 41.49 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -9.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31.83 =C2=B1 10%=C2=A0
> perf-profile.calltrace.cycles-pp.autoremove_wake_function.__wake_up_commo=
n.__wake_up_common_lock.pipe_write.new_sync_write
> =C2=A0=C2=A0=C2=A0=C2=A0 41.71 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -9.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32.56 =C2=B1 10%=C2=A0
> perf-profile.calltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.p=
ipe_write.new_sync_write.vfs_write
> =C2=A0=C2=A0=C2=A0=C2=A0 17.44 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -8.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.20 =C2=B1 23%=C2=A0
> perf-profile.calltrace.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_t=
o_wake_up.autoremove_wake_function.__wake_up_common
> =C2=A0=C2=A0=C2=A0=C2=A0 10.14 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
8.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.98 =C2=B1151%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_callchain_kernel.get_perf_callchain=
.perf_callchain.perf_prepare_sample.perf_event_output_forward
> =C2=A0=C2=A0=C2=A0=C2=A0 17.53 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -8.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.42 =C2=B1 22%=C2=A0
> perf-profile.calltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremo=
ve_wake_function.__wake_up_common.__wake_up_common_lock
> =C2=A0=C2=A0=C2=A0=C2=A0 42.61 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -8.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.58 =C2=B1 10%=C2=A0
> perf-profile.calltrace.cycles-pp.__wake_up_common_lock.pipe_write.new_syn=
c_write.vfs_write.ksys_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.46 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.97 =C2=B1127%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_trace_sched_stat_runtime.update_cur=
r.enqueue_entity.enqueue_task_fair.ttwu_do_activate
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.20 =C2=B1 47%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.83 =C2=B1149%=C2=A0
> perf-profile.calltrace.cycles-pp.exc_page_fault.asm_exc_page_fault.__get_=
user_nocheck_8.perf_callchain_user.get_perf_callchain
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.20 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.88 =C2=B1129%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_tp_event.perf_trace_sched_stat_runt=
ime.update_curr.enqueue_entity.enqueue_task_fair
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.11 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.86 =C2=B1129%=C2=A0
> perf-profile.calltrace.cycles-pp.__perf_event_overflow.perf_tp_event.perf=
_trace_sched_stat_runtime.update_curr.enqueue_entity
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.99 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.81 =C2=B1 71%=C2=A0
> perf-profile.calltrace.cycles-pp.update_curr.enqueue_entity.enqueue_task_=
fair.ttwu_do_activate.try_to_wake_up
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.27 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.28 =C2=B1128%=C2=A0
> perf-profile.calltrace.cycles-pp.__perf_event_overflow.perf_tp_event.perf=
_trace_sched_wakeup_template.try_to_wake_up.autoremove_wake_function
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.25 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.28 =C2=B1128%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_event_output_forward.__perf_event_o=
verflow.perf_tp_event.perf_trace_sched_wakeup_template.try_to_wake_up
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.28 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.36 =C2=B1124%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_trace_sched_stat_runtime.update_cur=
r.dequeue_entity.dequeue_task_fair.__schedule
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.16 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.26 =C2=B1128%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_prepare_sample.perf_event_output_fo=
rward.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_template
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.15 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.29 =C2=B1125%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_tp_event.perf_trace_sched_stat_runt=
ime.update_curr.dequeue_entity.dequeue_task_fair
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.04 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.26 =C2=B1125%=C2=A0
> perf-profile.calltrace.cycles-pp.__perf_event_overflow.perf_tp_event.perf=
_trace_sched_stat_runtime.update_curr.dequeue_entity
> =C2=A0=C2=A0=C2=A0=C2=A0 11.81 =C2=B1 27%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
6.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.15 =C2=B1 30%=C2=A0
> perf-profile.calltrace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do=
_activate.try_to_wake_up.autoremove_wake_function
> =C2=A0=C2=A0=C2=A0=C2=A0 16.02 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.38 =C2=B1 33%=C2=A0
> perf-profile.calltrace.cycles-pp.dequeue_task_fair.__schedule.schedule.pi=
pe_read.new_sync_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.83 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.26 =C2=B1124%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_trace_sched_switch.__schedule.sched=
ule.pipe_read.new_sync_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.66 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.18 =C2=B1125%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__=
schedule.schedule.pipe_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.73 =C2=B1 39%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.25 =C2=B1 83%=C2=A0
> perf-profile.calltrace.cycles-pp.update_curr.dequeue_entity.dequeue_task_=
fair.__schedule.schedule
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.59 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.12 =C2=B1 90%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_tp_event.perf_trace_sched_wakeup_te=
mplate.try_to_wake_up.autoremove_wake_function.__wake_up_common
> =C2=A0=C2=A0=C2=A0=C2=A0 10.53 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
5.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.78 =C2=B1 49%=C2=A0
> perf-profile.calltrace.cycles-pp.dequeue_entity.dequeue_task_fair.__sched=
ule.schedule.pipe_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.88 =C2=B1 39%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -5.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.15 =C2=B1 63%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_trace_sched_wakeup_template.try_to_=
wake_up.autoremove_wake_function.__wake_up_common.__wake_up_common_lock
> =C2=A0=C2=A0=C2=A0=C2=A0 35.84 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31.34 =C2=B1=C2=A0 8%=C2=A0
> perf-profile.calltrace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_re=
ad.do_syscall_64
> =C2=A0=C2=A0=C2=A0=C2=A0 36.07 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31.80 =C2=B1=C2=A0 7%=C2=A0
> perf-profile.calltrace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.36 =C2=B1 45%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.36 =C2=B1123%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_trace_sched_switch.__schedule.sched=
ule.exit_to_user_mode_loop.exit_to_user_mode_prepare
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.24 =C2=B1 46%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.29 =C2=B1125%=C2=A0
> perf-profile.calltrace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__=
schedule.schedule.exit_to_user_mode_loop
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.10 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.34 =C2=B1 37%=C2=
=A0
> perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_sp=
in_lock.try_to_wake_up.autoremove_wake_function.__wake_up_common
> =C2=A0=C2=A0=C2=A0=C2=A0 36.68 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.04 =C2=B1=C2=A0 6%=C2=A0
> perf-profile.calltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_S=
YSCALL_64_after_hwframe.__libc_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.86 =C2=B1 62%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1223%=C2=A0
> perf-profile.calltrace.cycles-pp.__unwind_start.perf_callchain_kernel.get=
_perf_callchain.perf_callchain.perf_prepare_sample
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.36 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -3.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.22 =C2=B1 18%=C2=
=A0
> perf-profile.calltrace.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove=
_wake_function.__wake_up_common.__wake_up_common_lock
> =C2=A0=C2=A0=C2=A0=C2=A0 37.32 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.64 =C2=B1=C2=A0 5%=C2=A0
> perf-profile.calltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64=
_after_hwframe.__libc_read.start_thread
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.10 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.66 =C2=B1 21%=C2=A0
> perf-profile.calltrace.cycles-pp.__schedule.schedule.exit_to_user_mode_lo=
op.exit_to_user_mode_prepare.syscall_exit_to_user_mode
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.15 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.76 =C2=B1 20%=C2=A0
> perf-profile.calltrace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_=
user_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.22 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.91 =C2=B1 19%=C2=A0
> perf-profile.calltrace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode=
_prepare.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.16 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.19 =C2=B1 33%=C2=
=A0
> perf-profile.calltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_sp=
in_lock.__schedule.schedule.pipe_read
> =C2=A0=C2=A0=C2=A0=C2=A0 38.53 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36.57 =C2=B1=C2=A0 4%=C2=A0
> perf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.__libc_read.start_thread
> =C2=A0=C2=A0=C2=A0=C2=A0 38.68=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 36.84 =C2=
=B1=C2=A0 4%=C2=A0
> perf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_re=
ad.start_thread
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.32 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.63 =C2=B1 19%=C2=
=A0
> perf-profile.calltrace.cycles-pp._raw_spin_lock.__schedule.schedule.pipe_=
read.new_sync_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1 72%=C2=
=A0
> perf-profile.calltrace.cycles-pp._raw_spin_lock.__schedule.schedule.exit_=
to_user_mode_loop.exit_to_user_mode_prepare
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1102%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.08 =C2=B1 23%=C2=A0
> perf-profile.calltrace.cycles-pp.__pthread_disable_asynccancel.start_thre=
ad
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.64 =C2=B1 10%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.44 =C2=B1 21%=C2=A0
> perf-profile.calltrace.cycles-pp._raw_spin_unlock_irqrestore.__wake_up_co=
mmon_lock.pipe_write.new_sync_write.vfs_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.81 =C2=B1 33%=C2=A0
> perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__sysvec_call_functio=
n_single.sysvec_call_function_single.asm_sysvec_call_function_single._raw_s=
pin_unlock_irqrestore
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.90 =C2=B1 48%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.78 =C2=B1 26%=C2=A0
> perf-profile.calltrace.cycles-pp.copy_page_to_iter.pipe_read.new_sync_rea=
d.vfs_read.ksys_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.94 =C2=B1 22%=C2=A0
> perf-profile.calltrace.cycles-pp.file_update_time.pipe_write.new_sync_wri=
te.vfs_write.ksys_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.94 =C2=B1 27%=C2=A0
> perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.try_to_wake_up.au=
toremove_wake_function.__wake_up_common.__wake_up_common_lock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.98 =C2=B1 29%=C2=A0
> perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_cal=
l_function_single.asm_sysvec_call_function_single._raw_spin_unlock_irqresto=
re.__wake_up_common_lock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.00 =C2=B1 28%=C2=A0
> perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_c=
all_function_single._raw_spin_unlock_irqrestore.__wake_up_common_lock.pipe_=
write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1223%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.15 =C2=B1 27%=C2=A0
> perf-profile.calltrace.cycles-pp.task_h_load.wake_affine.select_task_rq_f=
air.select_task_rq.try_to_wake_up
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1223%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.14 =C2=B1 29%=C2=A0
> perf-profile.calltrace.cycles-pp.prepare_task_switch.__schedule.schedule.=
pipe_read.new_sync_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.09 =C2=B1 24%=C2=A0
> perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string._copy_to_=
iter.copy_page_to_iter.pipe_read.new_sync_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1146%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.33 =C2=B1 18%=C2=A0
> perf-profile.calltrace.cycles-pp.mutex_unlock.pipe_write.new_sync_write.v=
fs_write.ksys_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.47 =C2=B1 45%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.57 =C2=B1 17%=C2=A0
> perf-profile.calltrace.cycles-pp.finish_task_switch.__schedule.schedule.p=
ipe_read.new_sync_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.11 =C2=B1 26%=C2=A0
> perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single._raw_spi=
n_unlock_irqrestore.__wake_up_common_lock.pipe_write.new_sync_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.13 =C2=B1 46%=C2=A0
> perf-profile.calltrace.cycles-pp.sched_ttwu_pending.__sysvec_call_functio=
n_single.sysvec_call_function_single.asm_sysvec_call_function_single.finish=
_task_switch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.20 =C2=B1 24%=C2=A0
> perf-profile.calltrace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.autor=
emove_wake_function.__wake_up_common.__wake_up_common_lock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.32 =C2=B1 40%=C2=A0
> perf-profile.calltrace.cycles-pp.__sysvec_call_function_single.sysvec_cal=
l_function_single.asm_sysvec_call_function_single.finish_task_switch.__sche=
dule
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.34 =C2=B1 40%=C2=A0
> perf-profile.calltrace.cycles-pp.sysvec_call_function_single.asm_sysvec_c=
all_function_single.finish_task_switch.__schedule.schedule
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.53 =C2=B1 28%=C2=A0
> perf-profile.calltrace.cycles-pp.available_idle_cpu.select_idle_cpu.selec=
t_idle_sibling.select_task_rq_fair.select_task_rq
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.36 =C2=B1 18%=C2=A0
> perf-profile.calltrace.cycles-pp.asm_sysvec_call_function_single.finish_t=
ask_switch.__schedule.schedule.pipe_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1100%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.70 =C2=B1 35%=C2=A0
> perf-profile.calltrace.cycles-pp.switch_fpu_return.exit_to_user_mode_prep=
are.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1104%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.82 =C2=B1 23%=C2=A0
> perf-profile.calltrace.cycles-pp.__fget_files.__fdget_pos.ksys_write.do_s=
yscall_64.entry_SYSCALL_64_after_hwframe
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.40 =C2=B1 25%=C2=A0
> perf-profile.calltrace.cycles-pp.copy_user_enhanced_fast_string.copyin._c=
opy_from_iter.pipe_write.new_sync_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 80%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.99 =C2=B1 22%=C2=A0
> perf-profile.calltrace.cycles-pp.__fdget_pos.ksys_write.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.__libc_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1141%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.64 =C2=B1 28%=C2=A0
> perf-profile.calltrace.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_e=
vent.pipe_read.new_sync_read.vfs_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1103%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.85 =C2=B1 27%=C2=A0
> perf-profile.calltrace.cycles-pp.wake_affine.select_task_rq_fair.select_t=
ask_rq.try_to_wake_up.autoremove_wake_function
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.49 =C2=B1 25%=C2=A0
> perf-profile.calltrace.cycles-pp.copyin._copy_from_iter.pipe_write.new_sy=
nc_write.vfs_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.56 =C2=B1 27%=C2=A0
> perf-profile.calltrace.cycles-pp._copy_to_iter.copy_page_to_iter.pipe_rea=
d.new_sync_read.vfs_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1 81%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.27 =C2=B1 22%=C2=A0
> perf-profile.calltrace.cycles-pp.mutex_lock.pipe_write.new_sync_write.vfs=
_write.ksys_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.03 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.26 =C2=B1 29%=C2=A0
> perf-profile.calltrace.cycles-pp.select_idle_cpu.select_idle_sibling.sele=
ct_task_rq_fair.select_task_rq.try_to_wake_up
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1 74%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.11 =C2=B1 28%=C2=A0
> perf-profile.calltrace.cycles-pp.prepare_to_wait_event.pipe_read.new_sync=
_read.vfs_read.ksys_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 2.99 =C2=B1 28%=C2=A0
> perf-profile.calltrace.cycles-pp._copy_from_iter.pipe_write.new_sync_writ=
e.vfs_write.ksys_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.65 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.43 =C2=B1 28%=C2=A0
> perf-profile.calltrace.cycles-pp.select_idle_sibling.select_task_rq_fair.=
select_task_rq.try_to_wake_up.autoremove_wake_function
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.36 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +5.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.61 =C2=B1 26%=C2=A0
> perf-profile.calltrace.cycles-pp.select_task_rq_fair.select_task_rq.try_t=
o_wake_up.autoremove_wake_function.__wake_up_common
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.47 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +5.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.97 =C2=B1 26%=C2=A0
> perf-profile.calltrace.cycles-pp.select_task_rq.try_to_wake_up.autoremove=
_wake_function.__wake_up_common.__wake_up_common_lock
> =C2=A0=C2=A0=C2=A0=C2=A0 45.25 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -34.3=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.95 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.__perf_event_overflow
> =C2=A0=C2=A0=C2=A0=C2=A0 45.18 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -34.3=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.93 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.perf_event_output_forward
> =C2=A0=C2=A0=C2=A0=C2=A0 45.97 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -34.1=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.91 =C2=B1116%=C2=A0
> perf-profile.children.cycles-pp.perf_tp_event
> =C2=A0=C2=A0=C2=A0=C2=A0 44.74 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -33.9=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.82 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.perf_prepare_sample
> =C2=A0=C2=A0=C2=A0=C2=A0 44.00 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -33.4=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.64 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.perf_callchain
> =C2=A0=C2=A0=C2=A0=C2=A0 43.94 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -33.3=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10.63 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.get_perf_callchain
> =C2=A0=C2=A0=C2=A0=C2=A0 32.59 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -24.7=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.89 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.perf_callchain_user
> =C2=A0=C2=A0=C2=A0=C2=A0 32.34 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -24.5=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.83 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.__get_user_nocheck_8
> =C2=A0=C2=A0=C2=A0=C2=A0 19.92 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0 -14.9=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.05 =C2=B1114%=C2=A0
> perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
> =C2=A0=C2=A0=C2=A0=C2=A0 40.50 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -13.6=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 26.91 =C2=B1 22%=C2=A0
> perf-profile.children.cycles-pp.__schedule
> =C2=A0=C2=A0=C2=A0=C2=A0 40.47 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0 -13.4=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 27.04 =C2=B1 22%=C2=A0
> perf-profile.children.cycles-pp.schedule
> =C2=A0=C2=A0=C2=A0=C2=A0 21.52 =C2=B1 36%=C2=A0=C2=A0=C2=A0=C2=A0 -13.4=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.17 =C2=B1 62%=C2=A0
> perf-profile.children.cycles-pp.update_curr
> =C2=A0=C2=A0=C2=A0=C2=A0 17.49 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0 -12.9=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.64 =C2=B1114%=C2=A0
> perf-profile.children.cycles-pp.native_irq_return_iret
> =C2=A0=C2=A0=C2=A0=C2=A0 14.83 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0 -11.0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.81 =C2=B1117%=C2=A0
> perf-profile.children.cycles-pp.perf_trace_sched_switch
> =C2=A0=C2=A0=C2=A0=C2=A0 42.34 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -1=
0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31.63 =C2=B1 10%=C2=A0
> perf-profile.children.cycles-pp.try_to_wake_up
> =C2=A0=C2=A0=C2=A0=C2=A0 42.51 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0 -1=
0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 32.34 =C2=B1 10%=C2=A0
> perf-profile.children.cycles-pp.autoremove_wake_function
> =C2=A0=C2=A0=C2=A0=C2=A0 13.06 =C2=B1 45%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
9.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.12 =C2=B1128%=C2=A0
> perf-profile.children.cycles-pp.asm_exc_page_fault
> =C2=A0=C2=A0=C2=A0=C2=A0 42.72 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -9.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.08 =C2=B1=C2=A0 9%=C2=A0
> perf-profile.children.cycles-pp.__wake_up_common
> =C2=A0=C2=A0=C2=A0=C2=A0 43.67 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -8.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 35.17 =C2=B1=C2=A0 9%=C2=A0
> perf-profile.children.cycles-pp.__wake_up_common_lock
> =C2=A0=C2=A0=C2=A0=C2=A0 10.98 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
8.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.64 =C2=B1125%=C2=A0
> perf-profile.children.cycles-pp.perf_callchain_kernel
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.78 =C2=B1 45%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -7.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.34 =C2=B1128%=C2=A0
> perf-profile.children.cycles-pp.exc_page_fault
> =C2=A0=C2=A0=C2=A0=C2=A0 16.53 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.58 =C2=B1 33%=C2=A0
> perf-profile.children.cycles-pp.dequeue_task_fair
> =C2=A0=C2=A0=C2=A0=C2=A0 18.15 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.66 =C2=B1 24%=C2=A0
> perf-profile.children.cycles-pp.enqueue_task_fair
> =C2=A0=C2=A0=C2=A0=C2=A0 10.64 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.14 =C2=B1 36%=C2=A0
> perf-profile.children.cycles-pp.native_queued_spin_lock_slowpath
> =C2=A0=C2=A0=C2=A0=C2=A0 18.24 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 11.90 =C2=B1 23%=C2=A0
> perf-profile.children.cycles-pp.ttwu_do_activate
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.29 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.96 =C2=B1125%=C2=A0
> perf-profile.children.cycles-pp.unwind_next_frame
> =C2=A0=C2=A0=C2=A0=C2=A0 10.93 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
6.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.88 =C2=B1 48%=C2=A0
> perf-profile.children.cycles-pp.dequeue_entity
> =C2=A0=C2=A0=C2=A0=C2=A0 10.16 =C2=B1 38%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
5.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.22 =C2=B1 62%=C2=A0
> perf-profile.children.cycles-pp.perf_trace_sched_wakeup_template
> =C2=A0=C2=A0=C2=A0=C2=A0 12.40 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -=
5.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.53 =C2=B1 31%=C2=A0
> perf-profile.children.cycles-pp.enqueue_entity
> =C2=A0=C2=A0=C2=A0=C2=A0 11.22 =C2=B1=C2=A0 7%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.45 =C2=B1 13%=C2=A0
> perf-profile.children.cycles-pp._raw_spin_lock
> =C2=A0=C2=A0=C2=A0=C2=A0 35.89 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31.45 =C2=B1=C2=A0 8%=C2=A0
> perf-profile.children.cycles-pp.pipe_read
> =C2=A0=C2=A0=C2=A0=C2=A0 36.10 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -4.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 31.85 =C2=B1=C2=A0 7%=C2=A0
> perf-profile.children.cycles-pp.new_sync_read
> =C2=A0=C2=A0=C2=A0=C2=A0 95.76 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 91.97 =C2=B1=C2=A0 2%=C2=A0
> perf-profile.children.cycles-pp.do_syscall_64
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.85 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.16 =C2=B1125%=C2=A0
> perf-profile.children.cycles-pp.__unwind_start
> =C2=A0=C2=A0=C2=A0=C2=A0 96.04=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 -3.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 92.44 =C2=
=B1=C2=A0 2%=C2=A0
> perf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
> =C2=A0=C2=A0=C2=A0=C2=A0 36.72 =C2=B1=C2=A0 3%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 33.13 =C2=B1=C2=A0 6%=C2=A0
> perf-profile.children.cycles-pp.vfs_read
> =C2=A0=C2=A0=C2=A0=C2=A0 37.36 =C2=B1=C2=A0 2%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.71 =C2=B1=C2=A0 5%=C2=A0
> perf-profile.children.cycles-pp.ksys_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.57 =C2=B1 23%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.24 =C2=B1 18%=C2=A0
> perf-profile.children.cycles-pp.exit_to_user_mode_loop
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.24 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.__orc_find
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.02 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1132%=C2=A0
> perf-profile.children.cycles-pp.perf_trace_sched_migrate_task
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.45 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1127%=C2=A0
> perf-profile.children.cycles-pp.bad_get_user
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.28 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1125%=C2=A0
> perf-profile.children.cycles-pp.unwind_get_return_address
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.25 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1124%=C2=A0
> perf-profile.children.cycles-pp.orc_find
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.97 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 45%=C2=A0
> perf-profile.children.cycles-pp.copy_page_from_iter
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.19 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1125%=C2=A0
> perf-profile.children.cycles-pp.stack_access_ok
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.07 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1126%=C2=A0
> perf-profile.children.cycles-pp.__kernel_text_address
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.85 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1125%=C2=A0
> perf-profile.children.cycles-pp.kernel_text_address
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.80 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1124%=C2=A0
> perf-profile.children.cycles-pp.kernelmode_fixup_or_oops
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.71 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1123%=C2=A0
> perf-profile.children.cycles-pp.fixup_exception
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1124%=C2=A0
> perf-profile.children.cycles-pp.search_exception_tables
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1123%=C2=A0
> perf-profile.children.cycles-pp.search_extable
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1124%=C2=A0
> perf-profile.children.cycles-pp.bsearch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.11 =C2=B1124%=C2=A0
> perf-profile.children.cycles-pp.__perf_event_header__init_id
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.51 =C2=B1 19%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 42%=C2=A0
> perf-profile.children.cycles-pp.scheduler_tick
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1121%=C2=A0
> perf-profile.children.cycles-pp.cmp_ex_search
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 32%=C2=A0
> perf-profile.children.cycles-pp.update_process_times
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.33 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1125%=C2=A0
> perf-profile.children.cycles-pp.core_kernel_text
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 31%=C2=A0
> perf-profile.children.cycles-pp.tick_sched_handle
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.44 =C2=B1 20%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 53%=C2=A0
> perf-profile.children.cycles-pp.task_tick_fair
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.35 =C2=B1 24%=C2=A0
> perf-profile.children.cycles-pp.__hrtimer_run_queues
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.55 =C2=B1 16%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1 26%=C2=A0
> perf-profile.children.cycles-pp.tick_sched_timer
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1127%=C2=A0
> perf-profile.children.cycles-pp.perf_output_begin_forward
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1125%=C2=A0
> perf-profile.children.cycles-pp.ftrace_graph_ret_addr
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.70 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 10%=C2=A0
> perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.70 =C2=B1 12%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 10%=C2=A0
> perf-profile.children.cycles-pp.hrtimer_interrupt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.75 =C2=B1 11%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.60 =C2=B1=C2=A0 9%=C2=
=A0
> perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1121%=C2=A0
> perf-profile.children.cycles-pp.__task_pid_nr_ns
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 62%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 72%=C2=A0
> perf-profile.children.cycles-pp.__cmd_record
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.13 =C2=B1 14%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.10 =C2=B1 14%=C2=A0
> perf-profile.children.cycles-pp.perf_trace_buf_alloc
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 11%=C2=
=A0
> perf-profile.children.cycles-pp.__irq_exit_rcu
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 75%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 22%=C2=A0
> perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 21%=C2=A0
> perf-profile.children.cycles-pp.anon_pipe_buf_release
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.11 =C2=B1 29%=C2=A0
> perf-profile.children.cycles-pp.__mnt_want_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 24%=C2=
=A0
> perf-profile.children.cycles-pp.generic_update_time
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1223%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 49%=C2=A0
> perf-profile.children.cycles-pp.mutex_spin_on_owner
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.18 =C2=B1 25%=C2=A0
> perf-profile.children.cycles-pp.place_entity
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1 75%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 46%=C2=A0
> perf-profile.children.cycles-pp.remove_entity_load_avg
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 38%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.41 =C2=B1 20%=C2=A0
> perf-profile.children.cycles-pp.aa_file_perm
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1 23%=C2=
=A0
> perf-profile.children.cycles-pp.__mark_inode_dirty
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1 23%=C2=A0
> perf-profile.children.cycles-pp.atime_needs_update
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 99%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 22%=C2=A0
> perf-profile.children.cycles-pp.llist_reverse_order
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.17 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 42%=C2=A0
> perf-profile.children.cycles-pp.migrate_task_rq_fair
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.82 =C2=B1 20%=C2=A0
> perf-profile.children.cycles-pp.touch_atime
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1 24%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.87 =C2=B1 20%=C2=A0
> perf-profile.children.cycles-pp.__list_del_entry_valid
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.55 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.14 =C2=B1 24%=C2=A0
> perf-profile.children.cycles-pp.apparmor_file_permission
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.74 =C2=B1 20%=C2=A0
> perf-profile.children.cycles-pp.__flush_smp_call_function_queue
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.24 =C2=B1 25%=C2=A0
> perf-profile.children.cycles-pp.security_file_permission
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.45 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.08 =C2=B1 23%=C2=A0
> perf-profile.children.cycles-pp.__pthread_disable_asynccancel
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.32 =C2=B1 29%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.95 =C2=B1 22%=C2=A0
> perf-profile.children.cycles-pp.file_update_time
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.13 =C2=B1 23%=C2=A0
> perf-profile.children.cycles-pp.__update_load_avg_se
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.20 =C2=B1 22%=C2=A0
> perf-profile.children.cycles-pp.__update_load_avg_cfs_rq
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.16 =C2=B1 27%=C2=A0
> perf-profile.children.cycles-pp.restore_fpregs_from_fpstate
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1 46%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 29%=C2=A0
> perf-profile.children.cycles-pp.fput
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.77 =C2=B1 29%=C2=A0
> perf-profile.children.cycles-pp.__smp_call_single_queue
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 99%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.80 =C2=B1 29%=C2=A0
> perf-profile.children.cycles-pp.llist_add_batch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 49%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.15 =C2=B1 27%=C2=A0
> perf-profile.children.cycles-pp.task_h_load
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.07 =C2=B1 31%=C2=A0
> perf-profile.children.cycles-pp._raw_spin_lock_irq
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.92 =C2=B1 47%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.80 =C2=B1 26%=C2=A0
> perf-profile.children.cycles-pp.copy_page_to_iter
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1 28%=C2=A0
> perf-profile.children.cycles-pp.__switch_to_asm
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.74 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.82 =C2=B1 27%=C2=A0
> perf-profile.children.cycles-pp.switch_fpu_return
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.21 =C2=B1 24%=C2=A0
> perf-profile.children.cycles-pp.ttwu_queue_wakelist
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1 48%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.51 =C2=B1 25%=C2=A0
> perf-profile.children.cycles-pp.copyin
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.63 =C2=B1 50%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.90 =C2=B1 20%=C2=A0
> perf-profile.children.cycles-pp.mutex_unlock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.90 =C2=B1 29%=C2=A0
> perf-profile.children.cycles-pp.prepare_task_switch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.87 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.18 =C2=B1 11%=C2=
=A0
> perf-profile.children.cycles-pp._raw_spin_unlock_irqrestore
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.85 =C2=B1 27%=C2=A0
> perf-profile.children.cycles-pp.wake_affine
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.86 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.22 =C2=B1 22%=C2=A0
> perf-profile.children.cycles-pp.__fget_files
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.06 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.64 =C2=B1 21%=C2=A0
> perf-profile.children.cycles-pp.__fdget_pos
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.59 =C2=B1 27%=C2=A0
> perf-profile.children.cycles-pp._copy_to_iter
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.91 =C2=B1=C2=A0 9%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.51 =C2=B1 16%=C2=
=A0
> perf-profile.children.cycles-pp.finish_task_switch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.87 =C2=B1 45%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.62 =C2=B1 23%=C2=A0
> perf-profile.children.cycles-pp.copy_user_enhanced_fast_string
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.18 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.24 =C2=B1 23%=C2=A0
> perf-profile.children.cycles-pp.mutex_lock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.71 =C2=B1 29%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.85 =C2=B1 27%=C2=A0
> perf-profile.children.cycles-pp.available_idle_cpu
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.08 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.39 =C2=B1 28%=C2=A0
> perf-profile.children.cycles-pp.select_idle_cpu
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.90 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.24 =C2=B1 27%=C2=A0
> perf-profile.children.cycles-pp._raw_spin_lock_irqsave
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.73 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.15 =C2=B1 28%=C2=A0
> perf-profile.children.cycles-pp.prepare_to_wait_event
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.41 =C2=B1 16%=C2=A0
> perf-profile.children.cycles-pp.sched_ttwu_pending
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 3.01 =C2=B1 28%=C2=A0
> perf-profile.children.cycles-pp._copy_from_iter
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.97 =C2=B1 12%=C2=A0
> perf-profile.children.cycles-pp.__sysvec_call_function_single
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.58 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.03 =C2=B1 12%=C2=A0
> perf-profile.children.cycles-pp.sysvec_call_function_single
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.71 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.58 =C2=B1 28%=C2=A0
> perf-profile.children.cycles-pp.select_idle_sibling
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.62 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +3.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.52 =C2=B1 10%=C2=A0
> perf-profile.children.cycles-pp.asm_sysvec_call_function_single
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.42 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +5.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 7.75 =C2=B1 26%=C2=A0
> perf-profile.children.cycles-pp.select_task_rq_fair
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.53 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +5.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.12 =C2=B1 26%=C2=A0
> perf-profile.children.cycles-pp.select_task_rq
> =C2=A0=C2=A0=C2=A0=C2=A0 17.49 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0 -12.9=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.64 =C2=B1114%=C2=A0
> perf-profile.self.cycles-pp.native_irq_return_iret
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 8.85 =C2=B1 46%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.08 =C2=B1130%=C2=A0
> perf-profile.self.cycles-pp.exc_page_fault
> =C2=A0=C2=A0=C2=A0=C2=A0 10.63 =C2=B1=C2=A0 6%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -6.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.14 =C2=B1 36%=C2=A0
> perf-profile.self.cycles-pp.native_queued_spin_lock_slowpath
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4.76 =C2=B1 43%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -3.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.12 =C2=B1126%=C2=A0
> perf-profile.self.cycles-pp.__get_user_nocheck_8
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.48 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -2.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.83 =C2=B1125%=C2=A0
> perf-profile.self.cycles-pp.unwind_next_frame
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.23 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.53 =C2=B1126%=C2=A0
> perf-profile.self.cycles-pp.__orc_find
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.20 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1124%=C2=A0
> perf-profile.self.cycles-pp.orc_find
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.08 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1124%=C2=A0
> perf-profile.self.cycles-pp.stack_access_ok
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.91 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1126%=C2=A0
> perf-profile.self.cycles-pp.perf_callchain_kernel
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.46 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1124%=C2=A0
> perf-profile.self.cycles-pp.__unwind_start
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1126%=C2=A0
> perf-profile.self.cycles-pp.kernel_text_address
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1 38%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1124%=C2=A0
> perf-profile.self.cycles-pp.cmp_ex_search
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1127%=C2=A0
> perf-profile.self.cycles-pp.asm_exc_page_fault
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 42%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.07 =C2=B1127%=C2=A0
> perf-profile.self.cycles-pp.get_perf_callchain
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1127%=C2=A0
> perf-profile.self.cycles-pp.perf_output_begin_forward
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.06 =C2=B1121%=C2=A0
> perf-profile.self.cycles-pp.__task_pid_nr_ns
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 46%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 -0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 45%=C2=A0
> perf-profile.self.cycles-pp.copy_page_from_iter
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.11 =C2=B1 27%=C2=A0
> perf-profile.self.cycles-pp.__mnt_want_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.01 =C2=B1223%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.15 =C2=B1 51%=C2=A0
> perf-profile.self.cycles-pp.mutex_spin_on_owner
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 32%=C2=A0
> perf-profile.self.cycles-pp.ttwu_do_activate
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.16 =C2=B1 22%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1 18%=C2=A0
> perf-profile.self.cycles-pp.dequeue_entity
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.16 =C2=B1 23%=C2=A0
> perf-profile.self.cycles-pp.place_entity
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1 21%=C2=A0
> perf-profile.self.cycles-pp.atime_needs_update
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 56%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 24%=C2=A0
> perf-profile.self.cycles-pp.wake_affine
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.19 =C2=B1 34%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 20%=C2=A0
> perf-profile.self.cycles-pp.__fdget_pos
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.18 =C2=B1 39%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1 20%=C2=A0
> perf-profile.self.cycles-pp.aa_file_perm
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.09 =C2=B1=C2=A0 5%=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 23%=C2=
=A0
> perf-profile.self.cycles-pp.__mark_inode_dirty
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.08 =C2=B1 59%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1 41%=C2=A0
> perf-profile.self.cycles-pp.migrate_task_rq_fair
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 17%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.46 =C2=B1 20%=C2=A0
> perf-profile.self.cycles-pp._raw_spin_unlock_irqrestore
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 21%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.38 =C2=B1 18%=C2=A0
> perf-profile.self.cycles-pp.finish_task_switch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.12 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 27%=C2=A0
> perf-profile.self.cycles-pp.select_task_rq
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.25 =C2=B1 34%=C2=A0
> perf-profile.self.cycles-pp._copy_to_iter
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 41%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.50 =C2=B1 23%=C2=A0
> perf-profile.self.cycles-pp.vfs_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 0.26 =C2=B1 18%=C2=A0
> perf-profile.self.cycles-pp.sched_ttwu_pending
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 15%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.79 =C2=B1 10%=C2=A0
> perf-profile.self.cycles-pp.perf_tp_event
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 99%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.30 =C2=B1 22%=C2=A0
> perf-profile.self.cycles-pp.llist_reverse_order
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.05 =C2=B1 74%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1 14%=C2=A0
> perf-profile.self.cycles-pp.ttwu_queue_wakelist
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.14 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.47 =C2=B1 22%=C2=A0
> perf-profile.self.cycles-pp.file_update_time
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.04 =C2=B1 71%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 15%=C2=A0
> perf-profile.self.cycles-pp.__flush_smp_call_function_queue
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 28%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.73 =C2=B1 21%=C2=A0
> perf-profile.self.cycles-pp.dequeue_task_fair
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.22 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.74 =C2=B1 21%=C2=A0
> perf-profile.self.cycles-pp.__wake_up_common
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.29 =C2=B1 25%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.84 =C2=B1 20%=C2=A0
> perf-profile.self.cycles-pp.__list_del_entry_valid
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.36 =C2=B1 30%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.92 =C2=B1 19%=C2=A0
> perf-profile.self.cycles-pp.enqueue_task_fair
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.43 =C2=B1 45%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.00 =C2=B1 25%=C2=A0
> perf-profile.self.cycles-pp.__pthread_disable_asynccancel
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.31 =C2=B1 46%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.94 =C2=B1 30%=C2=A0
> perf-profile.self.cycles-pp.fput
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.48 =C2=B1 26%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.11 =C2=B1 23%=C2=A0
> perf-profile.self.cycles-pp.__update_load_avg_se
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.52 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.16 =C2=B1 21%=C2=A0
> perf-profile.self.cycles-pp.__update_load_avg_cfs_rq
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.56 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.22 =C2=B1 22%=C2=A0
> perf-profile.self.cycles-pp.pipe_read
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.49 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.16 =C2=B1 27%=C2=A0
> perf-profile.self.cycles-pp.restore_fpregs_from_fpstate
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.23 =C2=B1 31%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.94 =C2=B1 23%=C2=A0
> perf-profile.self.cycles-pp.perf_trace_sched_wakeup_template
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.02 =C2=B1 99%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.80 =C2=B1 29%=C2=A0
> perf-profile.self.cycles-pp.llist_add_batch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.37 =C2=B1 49%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.15 =C2=B1 27%=C2=A0
> perf-profile.self.cycles-pp.task_h_load
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.24 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.04 =C2=B1 31%=C2=A0
> perf-profile.self.cycles-pp._raw_spin_lock_irq
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.34 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.18 =C2=B1 29%=C2=A0
> perf-profile.self.cycles-pp.select_idle_sibling
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.28 =C2=B1 35%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +0.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.13 =C2=B1 29%=C2=A0
> perf-profile.self.cycles-pp.prepare_to_wait_event
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.40 =C2=B1 45%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.39 =C2=B1 28%=C2=A0
> perf-profile.self.cycles-pp.prepare_task_switch
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.59 =C2=B1 33%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.59 =C2=B1 28%=C2=A0
> perf-profile.self.cycles-pp.__switch_to_asm
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.54 =C2=B1 40%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.61 =C2=B1 28%=C2=A0
> perf-profile.self.cycles-pp.pipe_write
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 50%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.81 =C2=B1 20%=C2=A0
> perf-profile.self.cycles-pp.mutex_unlock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.85 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.13 =C2=B1 22%=C2=A0
> perf-profile.self.cycles-pp.__fget_files
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +1.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 1.28 =C2=B1 33%=C2=A0
> perf-profile.self.cycles-pp._copy_from_iter
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.19 =C2=B1 24%=C2=A0
> perf-profile.self.cycles-pp.__schedule
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.77 =C2=B1 44%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.31 =C2=B1 24%=C2=A0
> perf-profile.self.cycles-pp.mutex_lock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.84 =C2=B1 46%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.47 =C2=B1 23%=C2=A0
> perf-profile.self.cycles-pp.copy_user_enhanced_fast_string
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.61 =C2=B1 37%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +1.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.34 =C2=B1 30%=C2=A0
> perf-profile.self.cycles-pp._raw_spin_lock
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.69 =C2=B1 29%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.83 =C2=B1 27%=C2=A0
> perf-profile.self.cycles-pp.available_idle_cpu
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.86 =C2=B1 32%=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 +2.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.21 =C2=B1 27%=C2=A0
> perf-profile.self.cycles-pp._raw_spin_lock_irqsave
> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are
> provided
> for informational purposes only. Any difference in system hardware or
> software
> design or configuration may affect actual performance.
> =

> =

> #regzbot introduced: 59bb69c67c
>=20
--===============1541807499653480464==--

