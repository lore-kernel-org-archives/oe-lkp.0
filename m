Content-Type: multipart/mixed; boundary="===============3589168606509354725=="
MIME-Version: 1.0
From: Andrea Arcangeli <aarcange@redhat.com>
To: lkp@lists.01.org
Subject: Re: [mm] 09bc0443e9: will-it-scale.per_thread_ops -7.2% regression
Date: Sun, 02 May 2021 21:25:54 -0400
Message-ID: <YI9RIp3AaAsWxAUL@redhat.com>
In-Reply-To: <20210427055459.GA32408@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3589168606509354725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

[ CC'ed Peter and Anton ]

On Tue, Apr 27, 2021 at 01:54:59PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -7.2% regression of will-it-scale.per_thread_ops due to=
 commit:
> =

> =

> commit: 09bc0443e9a461b43d3914ea07925e78fa095b66 ("mm: gup: pack has_pinn=
ed in MMF_HAS_PINNED")
> https://git.kernel.org/cgit/linux/kernel/git/andrea/aa.git mapcount_desha=
re

This above commit should increase scalability, not decrease it.

It is also supposed to be a complete noop for mmap2 will-it-scale
testcase. It should not cause a -7.2% regression.

According to the report, the command line you used to reproduce the
regression was:

"/lkp/benchmarks/python3/bin/python3" "./runtest.py" "mmap2" "295" "thread"=
 "88"

I applied your patch below to be able to use the parameters above.

https://github.com/intel/lkp-tests/blob/master/pkg/will-it-scale/will-it-sc=
ale.patch

I substituted the "88" with `nproc` in the invocation because I got
256 cpus (128 per NUMA node).

# numactl --hardware
available: 2 nodes (0-1)
node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 =
24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 =
49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 128 129 130 131 132 133 134 13=
5 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 1=
54 155 156 157 158 159 160 161 162 163 164 165 166 167 168 169 170 171 172 =
173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
node 0 size: 128792 MB
node 0 free: 126741 MB
node 1 cpus: 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84=
 85 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 1=
07 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 =
126 127 192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207 208=
 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 22=
7 228 229 230 231 232 233 234 235 236 237 238 239 240 241 242 243 244 245 2=
46 247 248 249 250 251 252 253 254 255
node 1 size: 128944 MB
node 1 free: 127330 MB
node distances:
node   0   1 =

  0:  10  32 =

  1:  32  10 =


So I run this to try to reproduce the reported -7.2% regression:

# python3 runtest.py mmap2 295 thread `nproc`
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,93460,7.60,0
# python3 runtest.py mmap2 295 thread `nproc`
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,95874,7.44,0
# python3 runtest.py mmap2 295 thread `nproc`
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,92087,7.24,0

mmap2 with "pack has_pinned" patch - Average ops: 93807, stdev: 1565

Then I reverted the MMF_HAS_PINNED commit:

git revert d2f271ca96b42cafd701d445f11af0d2ef993772
# git log --oneline -1
c93250453d1c (HEAD -> main) Revert "mm: gup: pack has_pinned in MMF_HAS_PIN=
NED"

# python3 runtest.py mmap2 295 thread `nproc`
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,89988,5.69,0
# python3 runtest.py mmap2 295 thread `nproc`
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,92176,5.30,0
[root(a)amd-daytona-02 will-it-scale]# python3 runtest.py mmap2 295 thread =
`nproc`
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,93418,5.35,0

tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,25513,0.16,0
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,25428,0.16,0
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,25532,0.16,0

tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,1194950,0.19,0
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,1193455,0.18,0
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,1195060,0.18,0

mmap2 without "pack has_pinned" patch - Average ops: 91860, stdev: 1417 =


With 256 CPUs with the RHEL8 config cloned on a upstream kernel, I get
a 1947 ~2% increase in ops/sec.

So I cannot reproduce your -7.2% regression, to the contrary I
measured a slight improvement (within measurement error).

So I can guess the -7.2% regression you reported is a measurement
error or something specific to your hardware.

The reduction in size of the vma is the only thing that can make a
difference to the mmap2 workload, but if there's a regression it's
just caused by different alignment in the vma and it may be system or
.config specific.

In general it's a sure good thing to have made the vma smaller by
64bits. At best we could reorder the fields, but because I see a 2%
improvement in mmap2 will-it-scale (not a -7% regression) there's no
need to do that.

I attached my .config to this email, so you can test it if you've time
to check if it a more enterprise config with less debug will solve the
regression for you too.

=3D=3D=3D pin_fast will-it-scale follows =3D=3D=3D

In addition, to see a related scalability increase, I added a pin_fast
testcase to will-it-scale that I'm submitting here to Anton (CC'ed).

To run it in lkp-test you only have to add the attached patch on top
of your patch and then call "pin_fast" instead of "mmap2" in the
invocation, like below:

# for i in `seq 3`; do python3 runtest.py pin_fast 295 thread `nproc`; done

I recommend to add this to lkp-test since I think it's much more
interesting than mmap2 and will show huge differences. Ideally we
should add a both FOLL_WRITE test too later.

This is aa.git main branch commit 918037878bcf:

tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,1196513,0.19,0
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,1194664,0.19,0
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,1193194,0.19,0

This is mainline, upstream commit 18a3c5f7abfd:

tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,25641,0.17,0
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,25652,0.16,0
tasks,processes,processes_idle,threads,threads_idle,linear
0,0,100,0,100,0
256,0,0.00,25559,0.16,0

This is a 4668% increase in scalability of pin_user_pages_fast from
the aa.git MM or maybe I did something wrong in the above benchmark?

So it'd be great if you could help me reproduce this result on aa.git
vs mainline for pin_fast performance to verify or invalidate my result
above: I intended to run some perf profiling, but I run out of time
this weekend and next few days I'll be busy with non kernel stuff.

NOTE: you need CONFIG_GUP_TEST=3Dy or pin_fast won't run.

Thanks,
Andrea

> =

> =

> in testcase: will-it-scale
> on test machine: 88 threads Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz wit=
h 128G memory
> with following parameters:
> =

> 	nr_task: 100%
> 	mode: thread
> 	test: mmap2
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> test-description: Will It Scale takes a testcase and runs it from 1 throu=
gh to n parallel copies to see if the testcase will scale. It builds both a=
 process and threads based test in order to see any differences between the=
 two.
> test-url: https://github.com/antonblanchard/will-it-scale
> =

> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install                job.yaml  # job file is attached i=
n this email
>         bin/lkp split-job --compatible job.yaml
>         bin/lkp run                    compatible-job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-202006=
03.cgz/lkp-csl-2sp9/mmap2/will-it-scale/0x5003006
> =

> commit: =

>   9e039594cd ("mm: gup: enable FOLL_MM_SYNC by default for FOLL_LONGTERM")
>   09bc0443e9 ("mm: gup: pack has_pinned in MMF_HAS_PINNED")
> =

> 9e039594cdc4a477 09bc0443e9a461b43d3914ea079 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     209356            -7.2%     194360        will-it-scale.88.threads
>       2.92 =C2=B1  3%     +26.4%       3.69        will-it-scale.88.threa=
ds_idle
>       2378            -7.2%       2208        will-it-scale.per_thread_ops
>     209356            -7.2%     194360        will-it-scale.workload
>       7.27 =C2=B1  3%      +1.1        8.41 =C2=B1  2%  mpstat.cpu.all.id=
le%
>      10622 =C2=B1  3%     +10.1%      11691 =C2=B1  5%  softirqs.CPU0.SCH=
ED
>       3.29 =C2=B1  3%     +21.2%       3.99        turbostat.CPU%c1
>   28286290 =C2=B1  2%     +15.9%   32793894 =C2=B1  4%  cpuidle.POLL.time
>    7522980 =C2=B1  5%     +98.6%   14941499 =C2=B1  9%  cpuidle.POLL.usage
>     416329 =C2=B1  9%     +14.6%     477091 =C2=B1  4%  numa-numastat.nod=
e0.local_node
>     467212 =C2=B1  4%      +6.6%     497952 =C2=B1  4%  numa-numastat.nod=
e0.numa_hit
>      67674 =C2=B1  5%     +95.3%     132158 =C2=B1  9%  vmstat.system.cs
>     186518            +3.3%     192649        vmstat.system.in
>     163448 =C2=B1 23%     +47.5%     241012 =C2=B1 13%  numa-meminfo.node=
0.Active
>     163323 =C2=B1 23%     +47.5%     240825 =C2=B1 13%  numa-meminfo.node=
0.Active(anon)
>     179376 =C2=B1 23%     +45.5%     261077 =C2=B1 12%  numa-meminfo.node=
0.Shmem
>      40810 =C2=B1 23%     +47.4%      60153 =C2=B1 13%  numa-vmstat.node0=
.nr_active_anon
>      44829 =C2=B1 23%     +45.5%      65224 =C2=B1 12%  numa-vmstat.node0=
.nr_shmem
>      40810 =C2=B1 23%     +47.4%      60153 =C2=B1 13%  numa-vmstat.node0=
.nr_zone_active_anon
>     394361 =C2=B1  8%     +27.1%     501420 =C2=B1  6%  meminfo.Active
>     394124 =C2=B1  8%     +27.2%     501180 =C2=B1  6%  meminfo.Active(an=
on)
>      55835 =C2=B1  3%     +11.0%      61958 =C2=B1  4%  meminfo.Mapped
>     422546 =C2=B1  8%     +27.2%     537470 =C2=B1  7%  meminfo.Shmem
>      16425 =C2=B1  2%     +51.1%      24817 =C2=B1  9%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>      47477 =C2=B1 18%    +192.1%     138667 =C2=B1 18%  sched_debug.cfs_r=
q:/.spread0.avg
>      83263 =C2=B1  9%    +118.3%     181767 =C2=B1 14%  sched_debug.cfs_r=
q:/.spread0.max
>     -13422           -87.7%      -1648        sched_debug.cfs_rq:/.spread=
0.min
>      16434 =C2=B1  2%     +50.8%      24791 =C2=B1  9%  sched_debug.cfs_r=
q:/.spread0.stddev
>     406782 =C2=B1  5%     +47.2%     598963 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.avg
>     310888 =C2=B1  5%     +17.6%     365548        sched_debug.cpu.avg_id=
le.stddev
>     118545 =C2=B1  6%     +90.0%     225266 =C2=B1  8%  sched_debug.cpu.n=
r_switches.avg
>     245781 =C2=B1 27%    +188.8%     709718 =C2=B1 24%  sched_debug.cpu.n=
r_switches.max
>      66117 =C2=B1 10%     +58.3%     104638 =C2=B1 11%  sched_debug.cpu.n=
r_switches.min
>      37342 =C2=B1 21%    +164.0%      98565 =C2=B1 11%  sched_debug.cpu.n=
r_switches.stddev
>      98543 =C2=B1  8%     +27.2%     125365 =C2=B1  7%  proc-vmstat.nr_ac=
tive_anon
>     400879 =C2=B1  2%      +7.2%     429563 =C2=B1  2%  proc-vmstat.nr_fi=
le_pages
>      80063            +2.4%      81949        proc-vmstat.nr_inactive_anon
>      14083 =C2=B1  3%     +10.6%      15581 =C2=B1  3%  proc-vmstat.nr_ma=
pped
>     105650 =C2=B1  8%     +27.2%     134381 =C2=B1  7%  proc-vmstat.nr_sh=
mem
>      98543 =C2=B1  8%     +27.2%     125365 =C2=B1  7%  proc-vmstat.nr_zo=
ne_active_anon
>      80063            +2.4%      81949        proc-vmstat.nr_zone_inactiv=
e_anon
>      19908 =C2=B1 34%    +101.3%      40082 =C2=B1 24%  proc-vmstat.numa_=
hint_faults
>      11503 =C2=B1 35%     +96.8%      22644 =C2=B1 19%  proc-vmstat.numa_=
hint_faults_local
>     988411            +4.1%    1028620        proc-vmstat.numa_hit
>     909002 =C2=B1  2%      +4.4%     949281        proc-vmstat.numa_local
>     141126 =C2=B1  8%     +26.1%     178014 =C2=B1  6%  proc-vmstat.pgact=
ivate
>    1052207 =C2=B1  2%      +4.6%    1100817 =C2=B1  2%  proc-vmstat.pgall=
oc_normal
>    1031726            +2.2%    1054889        proc-vmstat.pgfault
>       0.05 =C2=B1 48%     -86.8%       0.01 =C2=B1 55%  perf-sched.sch_de=
lay.avg.ms.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc_pa=
ge_fault.asm_exc_page_fault
>       0.00           -50.0%       0.00        perf-sched.sch_delay.avg.ms=
.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff
>       5.07 =C2=B1 46%     -76.4%       1.19 =C2=B1 72%  perf-sched.sch_de=
lay.max.ms.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc_pa=
ge_fault.asm_exc_page_fault
>       5.23 =C2=B1 15%     -36.5%       3.32 =C2=B1 11%  perf-sched.total_=
wait_and_delay.average.ms
>     368488 =C2=B1 17%     +60.0%     589431 =C2=B1 12%  perf-sched.total_=
wait_and_delay.count.ms
>       5.23 =C2=B1 15%     -36.5%       3.32 =C2=B1 11%  perf-sched.total_=
wait_time.average.ms
>     101.74 =C2=B1  7%     -21.1%      80.30 =C2=B1  6%  perf-sched.wait_a=
nd_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constp=
rop.0.do_sys_poll
>       0.50 =C2=B1152%    +600.0%       3.50 =C2=B1 45%  perf-sched.wait_a=
nd_delay.count.preempt_schedule_common.__cond_resched.__alloc_pages_nodemas=
k.alloc_pages_vma.shmem_alloc_page
>     191568 =C2=B1 18%     +54.8%     296644 =C2=B1 13%  perf-sched.wait_a=
nd_delay.count.rwsem_down_write_slowpath.down_write_killable.__vm_munmap.__=
x64_sys_munmap
>     165645 =C2=B1 17%     +69.5%     280710 =C2=B1 11%  perf-sched.wait_a=
nd_delay.count.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.=
ksys_mmap_pgoff
>     305.17 =C2=B1  6%     +27.4%     388.67 =C2=B1  6%  perf-sched.wait_a=
nd_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constpr=
op.0.do_sys_poll
>       0.47 =C2=B1 12%     +99.4%       0.94 =C2=B1 43%  perf-sched.wait_t=
ime.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.vm_area_=
alloc.mmap_region
>       0.01 =C2=B1  8%     +84.4%       0.01 =C2=B1 78%  perf-sched.wait_t=
ime.avg.ms.preempt_schedule_common.__cond_resched.unmap_page_range.unmap_vm=
as.exit_mmap
>       0.53 =C2=B1 27%     +51.7%       0.80 =C2=B1 19%  perf-sched.wait_t=
ime.avg.ms.preempt_schedule_common.__cond_resched.unmap_vmas.unmap_region._=
_do_munmap
>     101.74 =C2=B1  7%     -21.1%      80.30 =C2=B1  6%  perf-sched.wait_t=
ime.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0=
.do_sys_poll
>       0.05 =C2=B1155%     -84.8%       0.01 =C2=B1 10%  perf-sched.wait_t=
ime.max.ms.preempt_schedule_common.__cond_resched.dput.terminate_walk.path_=
openat
>      28.00 =C2=B1 11%     -29.3%      19.80 =C2=B1 24%  perf-sched.wait_t=
ime.max.ms.rwsem_down_write_slowpath.down_write_killable.__vm_munmap.__x64_=
sys_munmap
>       0.61 =C2=B1  2%     +15.5%       0.70 =C2=B1  6%  perf-stat.i.MPKI
>      42.06            -2.0       40.05        perf-stat.i.cache-miss-rate%
>   37897446 =C2=B1  2%     +14.1%   43237695 =C2=B1  6%  perf-stat.i.cache=
-references
>      67845 =C2=B1  5%     +95.9%     132925 =C2=B1  9%  perf-stat.i.conte=
xt-switches
>     146.28            +7.7%     157.56        perf-stat.i.cpu-migrations
>  3.523e+08            +8.0%  3.804e+08        perf-stat.i.dTLB-stores
>    3232734            +5.5%    3409025        perf-stat.i.iTLB-load-misses
>     158034 =C2=B1  4%     +15.9%     183163 =C2=B1  6%  perf-stat.i.iTLB-=
loads
>      20005 =C2=B1  2%      -5.5%      18908        perf-stat.i.instructio=
ns-per-iTLB-miss
>       0.78 =C2=B1  2%      -9.0%       0.71 =C2=B1  3%  perf-stat.i.major=
-faults
>       1.12 =C2=B1  2%     -62.8%       0.42 =C2=B1  6%  perf-stat.i.metri=
c.K/sec
>       3261            +2.3%       3335        perf-stat.i.minor-faults
>    6559962            +9.8%    7204760        perf-stat.i.node-load-misses
>     715707 =C2=B1  4%     +21.6%     870011 =C2=B1  2%  perf-stat.i.node-=
loads
>    2945897 =C2=B1  2%      +5.3%    3101331        perf-stat.i.node-store=
-misses
>       3261            +2.3%       3336        perf-stat.i.page-faults
>       0.60 =C2=B1  2%     +14.7%       0.69 =C2=B1  6%  perf-stat.overall=
.MPKI
>      41.84            -2.0       39.89        perf-stat.overall.cache-mis=
s-rate%
>      19600 =C2=B1  2%      -5.9%      18451        perf-stat.overall.inst=
ructions-per-iTLB-miss
>   91284826            +7.0%   97675202        perf-stat.overall.path-leng=
th
>   37832361 =C2=B1  2%     +13.9%   43102649 =C2=B1  6%  perf-stat.ps.cach=
e-references
>      67561 =C2=B1  5%     +96.0%     132430 =C2=B1  9%  perf-stat.ps.cont=
ext-switches
>     146.03            +7.6%     157.15        perf-stat.ps.cpu-migrations
>  3.515e+08            +7.9%  3.792e+08        perf-stat.ps.dTLB-stores
>    3221419            +5.5%    3397346        perf-stat.ps.iTLB-load-miss=
es
>     159036 =C2=B1  4%     +15.0%     182914 =C2=B1  6%  perf-stat.ps.iTLB=
-loads
>       0.77 =C2=B1  2%      -9.0%       0.70 =C2=B1  3%  perf-stat.ps.majo=
r-faults
>       3256            +2.2%       3326        perf-stat.ps.minor-faults
>    6539481            +9.8%    7180332        perf-stat.ps.node-load-miss=
es
>     715018 =C2=B1  4%     +21.3%     867381 =C2=B1  2%  perf-stat.ps.node=
-loads
>    2936772 =C2=B1  2%      +5.2%    3090928        perf-stat.ps.node-stor=
e-misses
>       3256            +2.2%       3327        perf-stat.ps.page-faults
>       2.36 =C2=B1 15%      +1.0        3.38 =C2=B1 21%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_st=
artup_entry
>       2.44 =C2=B1 14%      +1.0        3.48 =C2=B1 21%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry=
.start_secondary
>       2.44 =C2=B1 14%      +1.0        3.49 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       2.54 =C2=B1 14%      +1.1        3.65 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_v=
erify
>       2.54 =C2=B1 14%      +1.1        3.65 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64_no_verify
>       2.54 =C2=B1 14%      +1.1        3.65 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>       2.57 =C2=B1 14%      +1.1        3.70 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.secondary_startup_64_no_verify
>      94.44            -1.5       92.97        perf-profile.children.cycle=
s-pp.osq_lock
>      95.76            -1.3       94.48        perf-profile.children.cycle=
s-pp.rwsem_down_write_slowpath
>      95.82            -1.3       94.54        perf-profile.children.cycle=
s-pp.down_write_killable
>       0.28            +0.0        0.30 =C2=B1  2%  perf-profile.children.=
cycles-pp.mmap_region
>       0.23 =C2=B1 13%      +0.0        0.27 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.unwind_next_frame
>       0.09 =C2=B1 21%      +0.1        0.14 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_wakeup_template
>       0.08 =C2=B1 18%      +0.1        0.14 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       0.00            +0.1        0.06 =C2=B1 13%  perf-profile.children.=
cycles-pp.finish_task_switch
>       0.08 =C2=B1 20%      +0.1        0.15 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       0.09 =C2=B1 20%      +0.1        0.15 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.dequeue_task_fair
>       0.10 =C2=B1 21%      +0.1        0.18 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_switch
>       0.48 =C2=B1  8%      +0.1        0.56 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.get_perf_callchain
>       0.15 =C2=B1 19%      +0.1        0.24 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       0.48 =C2=B1  8%      +0.1        0.57 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.perf_callchain
>       0.16 =C2=B1 19%      +0.1        0.25 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.wake_up_q
>       0.51 =C2=B1  9%      +0.1        0.60 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_prepare_sample
>       0.21 =C2=B1 17%      +0.1        0.33 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.rwsem_wake
>       0.57 =C2=B1  9%      +0.1        0.69 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__perf_event_overflow
>       0.57 =C2=B1  8%      +0.1        0.69 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_event_output_forward
>       0.57 =C2=B1  9%      +0.1        0.69 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_swevent_overflow
>       0.59 =C2=B1  9%      +0.1        0.71 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_tp_event
>       0.19 =C2=B1 17%      +0.1        0.33 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.schedule
>       0.27 =C2=B1 16%      +0.2        0.47 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__schedule
>       2.38 =C2=B1 15%      +1.0        3.42 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.intel_idle
>       2.47 =C2=B1 15%      +1.1        3.54 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter
>       2.47 =C2=B1 15%      +1.1        3.54 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>       2.54 =C2=B1 14%      +1.1        3.65 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.start_secondary
>       2.57 =C2=B1 14%      +1.1        3.70 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>       2.57 =C2=B1 14%      +1.1        3.70 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>       2.57 =C2=B1 14%      +1.1        3.70 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.do_idle
>      93.67            -1.4       92.30        perf-profile.self.cycles-pp=
.osq_lock
>       0.04 =C2=B1 45%      +0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.__get_user_nocheck_8
>       0.25 =C2=B1  2%      +0.0        0.29 =C2=B1  4%  perf-profile.self=
.cycles-pp.rwsem_down_write_slowpath
>       2.38 =C2=B1 15%      +1.0        3.42 =C2=B1 21%  perf-profile.self=
.cycles-pp.intel_idle
>    2115803 =C2=B1  6%     +94.2%    4108457 =C2=B1  8%  interrupts.CAL:Fu=
nction_call_interrupts
>      43421 =C2=B1 44%    +236.7%     146198 =C2=B1 27%  interrupts.CPU0.C=
AL:Function_call_interrupts
>       2724 =C2=B1 18%    +146.8%       6723 =C2=B1 22%  interrupts.CPU0.R=
ES:Rescheduling_interrupts
>      27206 =C2=B1 41%    +110.2%      57188 =C2=B1 22%  interrupts.CPU1.C=
AL:Function_call_interrupts
>       1218 =C2=B1 24%     +67.3%       2038 =C2=B1 18%  interrupts.CPU1.R=
ES:Rescheduling_interrupts
>      23112 =C2=B1 41%     +85.9%      42970 =C2=B1 33%  interrupts.CPU10.=
CAL:Function_call_interrupts
>      22432 =C2=B1 40%    +115.6%      48366 =C2=B1 34%  interrupts.CPU11.=
CAL:Function_call_interrupts
>      23804 =C2=B1 31%     +87.1%      44538 =C2=B1 19%  interrupts.CPU12.=
CAL:Function_call_interrupts
>      20800 =C2=B1 38%    +104.2%      42464 =C2=B1 33%  interrupts.CPU13.=
CAL:Function_call_interrupts
>     773.00 =C2=B1 23%     +74.2%       1346 =C2=B1 28%  interrupts.CPU13.=
RES:Rescheduling_interrupts
>      20713 =C2=B1 38%     +94.0%      40193 =C2=B1 28%  interrupts.CPU14.=
CAL:Function_call_interrupts
>      22157 =C2=B1 39%    +109.6%      46439 =C2=B1 33%  interrupts.CPU15.=
CAL:Function_call_interrupts
>      22534 =C2=B1 38%     +98.5%      44731 =C2=B1 31%  interrupts.CPU16.=
CAL:Function_call_interrupts
>     693.17 =C2=B1 19%    +116.2%       1498 =C2=B1 35%  interrupts.CPU16.=
RES:Rescheduling_interrupts
>      22394 =C2=B1 39%     +84.7%      41358 =C2=B1 28%  interrupts.CPU17.=
CAL:Function_call_interrupts
>     819.67 =C2=B1 21%     +89.1%       1550 =C2=B1 33%  interrupts.CPU17.=
RES:Rescheduling_interrupts
>      21418 =C2=B1 46%     +90.0%      40686 =C2=B1 28%  interrupts.CPU18.=
CAL:Function_call_interrupts
>      21648 =C2=B1 40%     +71.6%      37140 =C2=B1 26%  interrupts.CPU19.=
CAL:Function_call_interrupts
>      23363 =C2=B1 35%    +137.2%      55421 =C2=B1 25%  interrupts.CPU2.C=
AL:Function_call_interrupts
>      20569 =C2=B1 34%    +127.9%      46884 =C2=B1 36%  interrupts.CPU20.=
CAL:Function_call_interrupts
>     825.17 =C2=B1 27%     +78.4%       1471 =C2=B1 20%  interrupts.CPU20.=
RES:Rescheduling_interrupts
>      22701 =C2=B1 42%     +91.4%      43449 =C2=B1 32%  interrupts.CPU21.=
CAL:Function_call_interrupts
>     715.67 =C2=B1 33%     +61.5%       1155 =C2=B1 18%  interrupts.CPU21.=
RES:Rescheduling_interrupts
>      25309 =C2=B1 40%    +132.2%      58760 =C2=B1 29%  interrupts.CPU3.C=
AL:Function_call_interrupts
>     740.50 =C2=B1 33%    +129.7%       1700 =C2=B1 41%  interrupts.CPU31.=
RES:Rescheduling_interrupts
>      27266 =C2=B1 43%    +106.5%      56303 =C2=B1 25%  interrupts.CPU4.C=
AL:Function_call_interrupts
>     993.50 =C2=B1 22%     +51.8%       1508 =C2=B1 23%  interrupts.CPU4.R=
ES:Rescheduling_interrupts
>      26021 =C2=B1 25%     +86.1%      48432 =C2=B1 37%  interrupts.CPU43.=
CAL:Function_call_interrupts
>      20269 =C2=B1 43%    +138.8%      48412 =C2=B1 30%  interrupts.CPU44.=
CAL:Function_call_interrupts
>     805.17 =C2=B1 37%    +108.0%       1674 =C2=B1 33%  interrupts.CPU44.=
RES:Rescheduling_interrupts
>      19905 =C2=B1 37%     +95.3%      38865 =C2=B1 22%  interrupts.CPU45.=
CAL:Function_call_interrupts
>      18960 =C2=B1 43%    +121.6%      42014 =C2=B1 30%  interrupts.CPU46.=
CAL:Function_call_interrupts
>      19406 =C2=B1 40%     +86.1%      36110 =C2=B1 34%  interrupts.CPU47.=
CAL:Function_call_interrupts
>      21562 =C2=B1 49%    +100.9%      43320 =C2=B1 24%  interrupts.CPU48.=
CAL:Function_call_interrupts
>      20476 =C2=B1 45%     +99.9%      40930 =C2=B1 28%  interrupts.CPU49.=
CAL:Function_call_interrupts
>      23943 =C2=B1 37%    +110.1%      50303 =C2=B1 30%  interrupts.CPU5.C=
AL:Function_call_interrupts
>      20519 =C2=B1 53%     +97.3%      40475 =C2=B1 24%  interrupts.CPU50.=
CAL:Function_call_interrupts
>     544.67 =C2=B1 39%    +116.5%       1179 =C2=B1 28%  interrupts.CPU50.=
RES:Rescheduling_interrupts
>      18565 =C2=B1 36%    +116.4%      40170 =C2=B1 23%  interrupts.CPU51.=
CAL:Function_call_interrupts
>     533.67 =C2=B1 18%     +71.5%     915.50 =C2=B1 31%  interrupts.CPU51.=
RES:Rescheduling_interrupts
>      19738 =C2=B1 44%    +140.0%      47374 =C2=B1 30%  interrupts.CPU52.=
CAL:Function_call_interrupts
>     652.33 =C2=B1 24%    +109.3%       1365 =C2=B1 50%  interrupts.CPU52.=
RES:Rescheduling_interrupts
>      20103 =C2=B1 36%     +91.7%      38538 =C2=B1 27%  interrupts.CPU53.=
CAL:Function_call_interrupts
>      21229 =C2=B1 44%    +102.7%      43024 =C2=B1 34%  interrupts.CPU54.=
CAL:Function_call_interrupts
>      19127 =C2=B1 43%    +101.6%      38563 =C2=B1 34%  interrupts.CPU55.=
CAL:Function_call_interrupts
>      18950 =C2=B1 43%    +121.5%      41970 =C2=B1 32%  interrupts.CPU56.=
CAL:Function_call_interrupts
>     493.83 =C2=B1 13%    +180.1%       1383 =C2=B1 46%  interrupts.CPU56.=
RES:Rescheduling_interrupts
>      18300 =C2=B1 37%    +126.4%      41427 =C2=B1 27%  interrupts.CPU57.=
CAL:Function_call_interrupts
>      19603 =C2=B1 49%     +80.8%      35447 =C2=B1 30%  interrupts.CPU58.=
CAL:Function_call_interrupts
>     565.33 =C2=B1 24%     +47.2%     832.33 =C2=B1 22%  interrupts.CPU58.=
RES:Rescheduling_interrupts
>      19418 =C2=B1 37%    +122.3%      43164 =C2=B1 37%  interrupts.CPU59.=
CAL:Function_call_interrupts
>     512.17 =C2=B1 31%    +131.6%       1186 =C2=B1 51%  interrupts.CPU59.=
RES:Rescheduling_interrupts
>      25012 =C2=B1 51%     +86.8%      46721 =C2=B1 27%  interrupts.CPU6.C=
AL:Function_call_interrupts
>      20824 =C2=B1 45%     +96.7%      40972 =C2=B1 31%  interrupts.CPU60.=
CAL:Function_call_interrupts
>      21070 =C2=B1 49%     +96.3%      41356 =C2=B1 27%  interrupts.CPU61.=
CAL:Function_call_interrupts
>     588.00 =C2=B1 26%     +93.7%       1138 =C2=B1 22%  interrupts.CPU61.=
RES:Rescheduling_interrupts
>      18454 =C2=B1 44%    +103.5%      37564 =C2=B1 29%  interrupts.CPU62.=
CAL:Function_call_interrupts
>      20713 =C2=B1 48%     +89.4%      39234 =C2=B1 32%  interrupts.CPU63.=
CAL:Function_call_interrupts
>      19581 =C2=B1 43%    +105.7%      40273 =C2=B1 28%  interrupts.CPU64.=
CAL:Function_call_interrupts
>     625.67 =C2=B1 32%     +51.6%     948.33 =C2=B1 12%  interrupts.CPU64.=
RES:Rescheduling_interrupts
>      19381 =C2=B1 39%    +100.9%      38930 =C2=B1 32%  interrupts.CPU65.=
CAL:Function_call_interrupts
>      22881 =C2=B1 36%    +102.2%      46276 =C2=B1 21%  interrupts.CPU7.C=
AL:Function_call_interrupts
>     888.33 =C2=B1 19%     +52.1%       1351 =C2=B1 19%  interrupts.CPU7.R=
ES:Rescheduling_interrupts
>     740.33 =C2=B1 17%     +63.1%       1207 =C2=B1 32%  interrupts.CPU70.=
RES:Rescheduling_interrupts
>     621.17 =C2=B1 29%     +46.4%     909.50 =C2=B1 21%  interrupts.CPU76.=
RES:Rescheduling_interrupts
>      22734 =C2=B1 37%    +118.4%      49658 =C2=B1 26%  interrupts.CPU8.C=
AL:Function_call_interrupts
>     800.67 =C2=B1 15%     +88.2%       1506 =C2=B1 23%  interrupts.CPU8.R=
ES:Rescheduling_interrupts
>     517.00 =C2=B1 45%    +113.9%       1105 =C2=B1 54%  interrupts.CPU85.=
RES:Rescheduling_interrupts
>     653.50 =C2=B1 21%     +60.7%       1050 =C2=B1 25%  interrupts.CPU86.=
RES:Rescheduling_interrupts
>      23712 =C2=B1 39%    +100.9%      47628 =C2=B1 31%  interrupts.CPU9.C=
AL:Function_call_interrupts
>     298.50 =C2=B1  9%     +29.4%     386.17 =C2=B1  7%  interrupts.IWI:IR=
Q_work_interrupts
>      70063 =C2=B1  7%     +66.8%     116840 =C2=B1  6%  interrupts.RES:Re=
scheduling_interrupts
> =

> =

>                                                                          =
       =

>                            will-it-scale.per_thread_ops                  =
       =

>                                                                          =
       =

>   2500 +-----------------------------------------------------------------=
---+   =

>        |                +          +                                     =
   |   =

>   2400 |-+   .+.   +.+  :+    .+  : :      +.      .+.        +    +.+.+ =
   |   =

>        |.++.+   + +   +:  +  +  + : +.+.+.+  +.++.+   ++   + : + .+     :=
   |   =

>        |         +     +   + :   +                      + + ::  +       :=
   |   =

>   2300 |-+                  +                            +  +            =
+  |   =

>        |               O                   O          O         O    O O =
   |   =

>   2200 |-+                O OO O   O  O O O  O OO   O  O O O      OO     =
OO |   =

>        |             O  O        O  O             O         O O          =
   |   =

>   2100 |-+                                                               =
   |   =

>        |                                                                 =
   |   =

>        |                                                                 =
   |   =

>   2000 |-+  O O                                                          =
   |   =

>        | OO     O                                                        =
   |   =

>   1900 +-----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
       =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

> =

> =

> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
> =

> =

> ---
> 0DAY/LKP+ Test Infrastructure                   Open Source Technology Ce=
nter
> https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpo=
ration
> =

> Thanks,
> Oliver Sang
> =


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.12.0-rc8 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23502
> CONFIG_LLD_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_CAN_LINK_STATIC=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> CONFIG_KERNEL_GZIP=3Dy
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> # CONFIG_WATCH_QUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_MSI_IOMMU=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> # CONFIG_CONTEXT_TRACKING_FORCE is not set
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> # end of Timers subsystem
> =

> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> CONFIG_TASKSTATS=3Dy
> CONFIG_TASK_DELAY_ACCT=3Dy
> CONFIG_TASK_XACCT=3Dy
> CONFIG_TASK_IO_ACCOUNTING=3Dy
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RCU=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_NOCB_CPU=3Dy
> # end of RCU Subsystem
> =

> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> # CONFIG_IKHEADERS is not set
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
> =

> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_HAS_INT128=3Dy
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_NUMA_BALANCING=3Dy
> CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_MEMCG_SWAP=3Dy
> CONFIG_MEMCG_KMEM=3Dy
> CONFIG_BLK_CGROUP=3Dy
> CONFIG_CGROUP_WRITEBACK=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> CONFIG_CGROUP_PIDS=3Dy
> CONFIG_CGROUP_RDMA=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_HUGETLB=3Dy
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CGROUP_CPUACCT=3Dy
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_BPF=3Dy
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> CONFIG_TIME_NS=3Dy
> CONFIG_IPC_NS=3Dy
> CONFIG_USER_NS=3Dy
> CONFIG_PID_NS=3Dy
> CONFIG_NET_NS=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> CONFIG_BPF=3Dy
> # CONFIG_EXPERT is not set
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_PRINTK_NMI=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_IO_URING=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> # CONFIG_BPF_LSM is not set
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> CONFIG_BPF_JIT_ALWAYS_ON=3Dy
> CONFIG_BPF_JIT_DEFAULT_ON=3Dy
> # CONFIG_BPF_PRELOAD is not set
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_KCMP=3Dy
> CONFIG_RSEQ=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_HAVE_INTEL_TXT=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_DYNAMIC_PHYSICAL_MASK=3Dy
> CONFIG_PGTABLE_LEVELS=3D5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_ZONE_DMA=3Dy
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_X2APIC=3Dy
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> CONFIG_X86_CPU_RESCTRL=3Dy
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_NUMACHIP is not set
> # CONFIG_X86_VSMP is not set
> CONFIG_X86_UV=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_MID is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> CONFIG_X86_AMD_PLATFORM_DEVICE=3Dy
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> CONFIG_XEN=3Dy
> # CONFIG_XEN_PV is not set
> CONFIG_XEN_PVHVM=3Dy
> CONFIG_XEN_PVHVM_SMP=3Dy
> CONFIG_XEN_PVHVM_GUEST=3Dy
> CONFIG_XEN_SAVE_RESTORE=3Dy
> # CONFIG_XEN_DEBUG_FS is not set
> # CONFIG_XEN_PVH is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> # CONFIG_ACRN_GUEST is not set
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> # CONFIG_GART_IOMMU is not set
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> CONFIG_NR_CPUS_RANGE_END=3D8192
> CONFIG_NR_CPUS_DEFAULT=3D8192
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> CONFIG_SCHED_MC_PRIO=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCELOG_LEGACY=3Dy
> CONFIG_X86_MCE_INTEL=3Dy
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dm
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dm
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
> CONFIG_PERF_EVENTS_AMD_POWER=3Dm
> # end of Performance monitoring
> =

> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> CONFIG_I8K=3Dm
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> CONFIG_MICROCODE_AMD=3Dy
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_X86_5LEVEL=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> CONFIG_AMD_MEM_ENCRYPT=3Dy
> # CONFIG_AMD_MEM_ENCRYPT_ACTIVE_BY_DEFAULT is not set
> CONFIG_NUMA=3Dy
> CONFIG_AMD_NUMA=3Dy
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NUMA_EMU=3Dy
> CONFIG_NODES_SHIFT=3D10
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_ARCH_MEMORY_PROBE is not set
> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> CONFIG_X86_PMEM_LEGACY=3Dm
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_X86_RESERVE_LOW=3D64
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D1
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> # CONFIG_X86_SGX is not set
> CONFIG_EFI=3Dy
> CONFIG_EFI_STUB=3Dy
> CONFIG_EFI_MIXED=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> # CONFIG_KEXEC_SIG is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_KEXEC_JUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_RANDOMIZE_MEMORY=3Dy
> CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0xa
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> # CONFIG_COMPAT_VDSO is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_LIVEPATCH=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_ARCH_HIBERNATION_HEADER=3Dy
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_HIBERNATION=3Dy
> CONFIG_HIBERNATION_SNAPSHOT_DEV=3Dy
> CONFIG_PM_STD_PARTITION=3D""
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> # CONFIG_PM_TEST_SUSPEND is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> # CONFIG_ENERGY_MODEL is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> # CONFIG_ACPI_FPDT is not set
> CONFIG_ACPI_LPIT=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> CONFIG_ACPI_EC_DEBUGFS=3Dm
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dm
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_TAD=3Dm
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_CPPC_LIB=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_IPMI=3Dm
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_PLATFORM_PROFILE=3Dm
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dm
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> CONFIG_ACPI_BGRT=3Dy
> CONFIG_ACPI_NFIT=3Dm
> # CONFIG_NFIT_SECURITY_DEBUG is not set
> CONFIG_ACPI_NUMA=3Dy
> # CONFIG_ACPI_HMAT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> CONFIG_ACPI_APEI_GHES=3Dy
> CONFIG_ACPI_APEI_PCIEAER=3Dy
> CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dm
> CONFIG_ACPI_APEI_ERST_DEBUG=3Dy
> # CONFIG_ACPI_DPTF is not set
> CONFIG_ACPI_WATCHDOG=3Dy
> CONFIG_ACPI_EXTLOG=3Dm
> CONFIG_ACPI_ADXL=3Dy
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_PMIC_OPREGION=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_X86_INTEL_PSTATE=3Dy
> # CONFIG_X86_PCC_CPUFREQ is not set
> CONFIG_X86_ACPI_CPUFREQ=3Dm
> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
> CONFIG_X86_POWERNOW_K8=3Dm
> CONFIG_X86_AMD_FREQ_SENSITIVITY=3Dm
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dm
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dm
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> CONFIG_INTEL_IDLE=3Dy
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_PCI_XEN=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # CONFIG_X86_SYSFB is not set
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> CONFIG_IA32_EMULATION=3Dy
> # CONFIG_X86_X32 is not set
> CONFIG_COMPAT_32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> # end of Binary Emulations
> =

> #
> # Firmware Drivers
> #
> CONFIG_EDD=3Dm
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DMIID=3Dy
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> CONFIG_EFI_VARS=3Dy
> CONFIG_EFI_ESRT=3Dy
> CONFIG_EFI_VARS_PSTORE=3Dy
> CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=3Dy
> CONFIG_EFI_RUNTIME_MAP=3Dy
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=3Dy
> # CONFIG_EFI_BOOTLOADER_CONTROL is not set
> # CONFIG_EFI_CAPSULE_LOADER is not set
> # CONFIG_EFI_TEST is not set
> CONFIG_APPLE_PROPERTIES=3Dy
> # CONFIG_RESET_ATTACK_MITIGATION is not set
> # CONFIG_EFI_RCI2_TABLE is not set
> # CONFIG_EFI_DISABLE_PCI_DMA is not set
> # end of EFI (Extensible Firmware Interface) Support
> =

> CONFIG_UEFI_CPER=3Dy
> CONFIG_UEFI_CPER_X86=3Dy
> CONFIG_EFI_DEV_PATH_PARSER=3Dy
> CONFIG_EFI_EARLYCON=3Dy
> CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_HAVE_KVM_IRQCHIP=3Dy
> CONFIG_HAVE_KVM_IRQFD=3Dy
> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> CONFIG_HAVE_KVM_EVENTFD=3Dy
> CONFIG_KVM_MMIO=3Dy
> CONFIG_KVM_ASYNC_PF=3Dy
> CONFIG_HAVE_KVM_MSI=3Dy
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> CONFIG_KVM_VFIO=3Dy
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> CONFIG_KVM_COMPAT=3Dy
> CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
> CONFIG_HAVE_KVM_NO_POLL=3Dy
> CONFIG_KVM_XFER_TO_GUEST_WORK=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM=3Dm
> CONFIG_KVM_INTEL=3Dm
> # CONFIG_KVM_AMD is not set
> # CONFIG_KVM_XEN is not set
> CONFIG_KVM_MMU_AUDIT=3Dy
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> # CONFIG_STATIC_CALL_SELFTEST is not set
> CONFIG_OPTPROBES=3Dy
> CONFIG_KPROBES_ON_FTRACE=3Dy
> CONFIG_UPROBES=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_KRETPROBES=3Dy
> CONFIG_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> # CONFIG_SECCOMP_CACHE_DEBUG is not set
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> CONFIG_LTO_NONE=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PUD=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_COMPAT_OLD_SIGACTION=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_VMAP_STACK=3Dy
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULE_SIG_FORMAT=3Dy
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> CONFIG_MODULE_SIG=3Dy
> # CONFIG_MODULE_SIG_FORCE is not set
> CONFIG_MODULE_SIG_ALL=3Dy
> # CONFIG_MODULE_SIG_SHA1 is not set
> # CONFIG_MODULE_SIG_SHA224 is not set
> CONFIG_MODULE_SIG_SHA256=3Dy
> # CONFIG_MODULE_SIG_SHA384 is not set
> # CONFIG_MODULE_SIG_SHA512 is not set
> CONFIG_MODULE_SIG_HASH=3D"sha256"
> # CONFIG_MODULE_COMPRESS is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_SCSI_REQUEST=3Dy
> CONFIG_BLK_CGROUP_RWSTAT=3Dy
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_INTEGRITY_T10=3Dm
> CONFIG_BLK_DEV_ZONED=3Dy
> CONFIG_BLK_DEV_THROTTLING=3Dy
> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> # CONFIG_BLK_CMDLINE_PARSER is not set
> CONFIG_BLK_WBT=3Dy
> # CONFIG_BLK_CGROUP_IOLATENCY is not set
> # CONFIG_BLK_CGROUP_IOCOST is not set
> CONFIG_BLK_WBT_MQ=3Dy
> CONFIG_BLK_DEBUG_FS=3Dy
> CONFIG_BLK_DEBUG_FS_ZONED=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> # CONFIG_BLK_INLINE_ENCRYPTION is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> # CONFIG_AIX_PARTITION is not set
> CONFIG_OSF_PARTITION=3Dy
> CONFIG_AMIGA_PARTITION=3Dy
> # CONFIG_ATARI_PARTITION is not set
> CONFIG_MAC_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_BSD_DISKLABEL=3Dy
> CONFIG_MINIX_SUBPARTITION=3Dy
> CONFIG_SOLARIS_X86_PARTITION=3Dy
> CONFIG_UNIXWARE_DISKLABEL=3Dy
> # CONFIG_LDM_PARTITION is not set
> CONFIG_SGI_PARTITION=3Dy
> # CONFIG_ULTRIX_PARTITION is not set
> CONFIG_SUN_PARTITION=3Dy
> CONFIG_KARMA_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> # CONFIG_SYSV68_PARTITION is not set
> # CONFIG_CMDLINE_PARTITION is not set
> # end of Partition Types
> =

> CONFIG_BLOCK_COMPAT=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_BLK_MQ_RDMA=3Dy
> CONFIG_BLK_PM=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> CONFIG_IOSCHED_BFQ=3Dy
> CONFIG_BFQ_GROUP_IOSCHED=3Dy
> # CONFIG_BFQ_CGROUP_DEBUG is not set
> # end of IO Schedulers
> =

> CONFIG_PREEMPT_NOTIFIERS=3Dy
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_READ_UNLOCK=3Dy
> CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_WRITE_UNLOCK=3Dy
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dm
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_NEED_MULTIPLE_NODES=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_NUMA_KEEP_MEMINFO=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG_SPARSE=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_PAGE_REPORTING=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_BOUNCE=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_MEMORY_FAILURE=3Dy
> CONFIG_HWPOISON_INJECT=3Dm
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_THP_SWAP=3Dy
> CONFIG_CLEANCACHE=3Dy
> CONFIG_FRONTSWAP=3Dy
> CONFIG_CMA=3Dy
> # CONFIG_CMA_DEBUG is not set
> # CONFIG_CMA_DEBUGFS is not set
> CONFIG_CMA_AREAS=3D19
> CONFIG_ZSWAP=3Dy
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=3Dy
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lzo"
> CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=3Dy
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
> CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"zbud"
> # CONFIG_ZSWAP_DEFAULT_ON is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> CONFIG_ZSMALLOC=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> CONFIG_ZONE_DEVICE=3Dy
> CONFIG_DEV_PAGEMAP_OPS=3Dy
> CONFIG_HMM_MIRROR=3Dy
> CONFIG_DEVICE_PRIVATE=3Dy
> CONFIG_VMAP_PFN=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> # CONFIG_READ_ONLY_THP_FOR_FS is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_COMPAT_NETLINK_MESSAGES=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> CONFIG_PACKET_DIAG=3Dm
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_UNIX_DIAG=3Dm
> CONFIG_TLS=3Dm
> CONFIG_TLS_DEVICE=3Dy
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_OFFLOAD=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_USER=3Dy
> # CONFIG_XFRM_USER_COMPAT is not set
> # CONFIG_XFRM_INTERFACE is not set
> CONFIG_XFRM_SUB_POLICY=3Dy
> CONFIG_XFRM_MIGRATE=3Dy
> CONFIG_XFRM_STATISTICS=3Dy
> CONFIG_XFRM_AH=3Dm
> CONFIG_XFRM_ESP=3Dm
> CONFIG_XFRM_IPCOMP=3Dm
> CONFIG_NET_KEY=3Dm
> CONFIG_NET_KEY_MIGRATE=3Dy
> # CONFIG_SMC is not set
> CONFIG_XDP_SOCKETS=3Dy
> # CONFIG_XDP_SOCKETS_DIAG is not set
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> CONFIG_IP_FIB_TRIE_STATS=3Dy
> CONFIG_IP_MULTIPLE_TABLES=3Dy
> CONFIG_IP_ROUTE_MULTIPATH=3Dy
> CONFIG_IP_ROUTE_VERBOSE=3Dy
> CONFIG_IP_ROUTE_CLASSID=3Dy
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> CONFIG_NET_IPIP=3Dm
> CONFIG_NET_IPGRE_DEMUX=3Dm
> CONFIG_NET_IP_TUNNEL=3Dm
> CONFIG_NET_IPGRE=3Dm
> CONFIG_NET_IPGRE_BROADCAST=3Dy
> CONFIG_IP_MROUTE_COMMON=3Dy
> CONFIG_IP_MROUTE=3Dy
> CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
> CONFIG_IP_PIMSM_V1=3Dy
> CONFIG_IP_PIMSM_V2=3Dy
> CONFIG_SYN_COOKIES=3Dy
> CONFIG_NET_IPVTI=3Dm
> CONFIG_NET_UDP_TUNNEL=3Dm
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> CONFIG_INET_AH=3Dm
> CONFIG_INET_ESP=3Dm
> CONFIG_INET_ESP_OFFLOAD=3Dm
> # CONFIG_INET_ESPINTCP is not set
> CONFIG_INET_IPCOMP=3Dm
> CONFIG_INET_XFRM_TUNNEL=3Dm
> CONFIG_INET_TUNNEL=3Dm
> CONFIG_INET_DIAG=3Dm
> CONFIG_INET_TCP_DIAG=3Dm
> CONFIG_INET_UDP_DIAG=3Dm
> CONFIG_INET_RAW_DIAG=3Dm
> # CONFIG_INET_DIAG_DESTROY is not set
> CONFIG_TCP_CONG_ADVANCED=3Dy
> CONFIG_TCP_CONG_BIC=3Dm
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_TCP_CONG_WESTWOOD=3Dm
> CONFIG_TCP_CONG_HTCP=3Dm
> CONFIG_TCP_CONG_HSTCP=3Dm
> CONFIG_TCP_CONG_HYBLA=3Dm
> CONFIG_TCP_CONG_VEGAS=3Dm
> CONFIG_TCP_CONG_NV=3Dm
> CONFIG_TCP_CONG_SCALABLE=3Dm
> CONFIG_TCP_CONG_LP=3Dm
> CONFIG_TCP_CONG_VENO=3Dm
> CONFIG_TCP_CONG_YEAH=3Dm
> CONFIG_TCP_CONG_ILLINOIS=3Dm
> CONFIG_TCP_CONG_DCTCP=3Dm
> # CONFIG_TCP_CONG_CDG is not set
> CONFIG_TCP_CONG_BBR=3Dm
> CONFIG_DEFAULT_CUBIC=3Dy
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> CONFIG_TCP_MD5SIG=3Dy
> CONFIG_IPV6=3Dy
> CONFIG_IPV6_ROUTER_PREF=3Dy
> CONFIG_IPV6_ROUTE_INFO=3Dy
> CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> CONFIG_INET6_AH=3Dm
> CONFIG_INET6_ESP=3Dm
> CONFIG_INET6_ESP_OFFLOAD=3Dm
> # CONFIG_INET6_ESPINTCP is not set
> CONFIG_INET6_IPCOMP=3Dm
> CONFIG_IPV6_MIP6=3Dm
> # CONFIG_IPV6_ILA is not set
> CONFIG_INET6_XFRM_TUNNEL=3Dm
> CONFIG_INET6_TUNNEL=3Dm
> CONFIG_IPV6_VTI=3Dm
> CONFIG_IPV6_SIT=3Dm
> CONFIG_IPV6_SIT_6RD=3Dy
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dm
> CONFIG_IPV6_GRE=3Dm
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> CONFIG_IPV6_MROUTE=3Dy
> CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
> CONFIG_IPV6_PIMSM_V2=3Dy
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> CONFIG_NETLABEL=3Dy
> # CONFIG_MPTCP is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> CONFIG_BRIDGE_NETFILTER=3Dm
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> CONFIG_NETFILTER_NETLINK=3Dm
> CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
> CONFIG_NETFILTER_FAMILY_ARP=3Dy
> # CONFIG_NETFILTER_NETLINK_ACCT is not set
> CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
> CONFIG_NETFILTER_NETLINK_LOG=3Dm
> CONFIG_NETFILTER_NETLINK_OSF=3Dm
> CONFIG_NF_CONNTRACK=3Dm
> CONFIG_NF_LOG_COMMON=3Dm
> CONFIG_NF_LOG_NETDEV=3Dm
> CONFIG_NETFILTER_CONNCOUNT=3Dm
> CONFIG_NF_CONNTRACK_MARK=3Dy
> CONFIG_NF_CONNTRACK_SECMARK=3Dy
> CONFIG_NF_CONNTRACK_ZONES=3Dy
> CONFIG_NF_CONNTRACK_PROCFS=3Dy
> CONFIG_NF_CONNTRACK_EVENTS=3Dy
> CONFIG_NF_CONNTRACK_TIMEOUT=3Dy
> CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
> CONFIG_NF_CONNTRACK_LABELS=3Dy
> CONFIG_NF_CT_PROTO_DCCP=3Dy
> CONFIG_NF_CT_PROTO_GRE=3Dy
> CONFIG_NF_CT_PROTO_SCTP=3Dy
> CONFIG_NF_CT_PROTO_UDPLITE=3Dy
> CONFIG_NF_CONNTRACK_AMANDA=3Dm
> CONFIG_NF_CONNTRACK_FTP=3Dm
> CONFIG_NF_CONNTRACK_H323=3Dm
> CONFIG_NF_CONNTRACK_IRC=3Dm
> CONFIG_NF_CONNTRACK_BROADCAST=3Dm
> CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
> CONFIG_NF_CONNTRACK_SNMP=3Dm
> CONFIG_NF_CONNTRACK_PPTP=3Dm
> CONFIG_NF_CONNTRACK_SANE=3Dm
> CONFIG_NF_CONNTRACK_SIP=3Dm
> CONFIG_NF_CONNTRACK_TFTP=3Dm
> CONFIG_NF_CT_NETLINK=3Dm
> CONFIG_NF_CT_NETLINK_TIMEOUT=3Dm
> CONFIG_NF_CT_NETLINK_HELPER=3Dm
> CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
> CONFIG_NF_NAT=3Dm
> CONFIG_NF_NAT_AMANDA=3Dm
> CONFIG_NF_NAT_FTP=3Dm
> CONFIG_NF_NAT_IRC=3Dm
> CONFIG_NF_NAT_SIP=3Dm
> CONFIG_NF_NAT_TFTP=3Dm
> CONFIG_NF_NAT_REDIRECT=3Dy
> CONFIG_NF_NAT_MASQUERADE=3Dy
> CONFIG_NETFILTER_SYNPROXY=3Dm
> CONFIG_NF_TABLES=3Dm
> CONFIG_NF_TABLES_INET=3Dy
> CONFIG_NF_TABLES_NETDEV=3Dy
> CONFIG_NFT_NUMGEN=3Dm
> CONFIG_NFT_CT=3Dm
> CONFIG_NFT_COUNTER=3Dm
> CONFIG_NFT_CONNLIMIT=3Dm
> CONFIG_NFT_LOG=3Dm
> CONFIG_NFT_LIMIT=3Dm
> CONFIG_NFT_MASQ=3Dm
> CONFIG_NFT_REDIR=3Dm
> CONFIG_NFT_NAT=3Dm
> # CONFIG_NFT_TUNNEL is not set
> CONFIG_NFT_OBJREF=3Dm
> CONFIG_NFT_QUEUE=3Dm
> CONFIG_NFT_QUOTA=3Dm
> CONFIG_NFT_REJECT=3Dm
> CONFIG_NFT_REJECT_INET=3Dm
> CONFIG_NFT_COMPAT=3Dm
> CONFIG_NFT_HASH=3Dm
> CONFIG_NFT_FIB=3Dm
> CONFIG_NFT_FIB_INET=3Dm
> # CONFIG_NFT_XFRM is not set
> CONFIG_NFT_SOCKET=3Dm
> # CONFIG_NFT_OSF is not set
> # CONFIG_NFT_TPROXY is not set
> # CONFIG_NFT_SYNPROXY is not set
> CONFIG_NF_DUP_NETDEV=3Dm
> CONFIG_NFT_DUP_NETDEV=3Dm
> CONFIG_NFT_FWD_NETDEV=3Dm
> CONFIG_NFT_FIB_NETDEV=3Dm
> # CONFIG_NFT_REJECT_NETDEV is not set
> # CONFIG_NF_FLOW_TABLE is not set
> CONFIG_NETFILTER_XTABLES=3Dy
> =

> #
> # Xtables combined modules
> #
> CONFIG_NETFILTER_XT_MARK=3Dm
> CONFIG_NETFILTER_XT_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_SET=3Dm
> =

> #
> # Xtables targets
> #
> CONFIG_NETFILTER_XT_TARGET_AUDIT=3Dm
> CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
> CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
> CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_CT=3Dm
> CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
> CONFIG_NETFILTER_XT_TARGET_HL=3Dm
> CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
> # CONFIG_NETFILTER_XT_TARGET_LED is not set
> CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
> CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
> CONFIG_NETFILTER_XT_NAT=3Dm
> CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
> CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
> CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
> CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
> CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
> CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
> CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
> CONFIG_NETFILTER_XT_TARGET_TEE=3Dm
> CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
> CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
> CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
> CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm
> =

> #
> # Xtables matches
> #
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
> CONFIG_NETFILTER_XT_MATCH_CGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
> CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNLABEL=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
> CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
> CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
> CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
> CONFIG_NETFILTER_XT_MATCH_HL=3Dm
> # CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
> CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
> CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
> CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
> CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
> CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
> # CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
> CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
> CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
> CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
> CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
> CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
> CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
> CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
> CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
> CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
> CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
> CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
> CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
> CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
> CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_TIME is not set
> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> # end of Core Netfilter Configuration
> =

> CONFIG_IP_SET=3Dm
> CONFIG_IP_SET_MAX=3D256
> CONFIG_IP_SET_BITMAP_IP=3Dm
> CONFIG_IP_SET_BITMAP_IPMAC=3Dm
> CONFIG_IP_SET_BITMAP_PORT=3Dm
> CONFIG_IP_SET_HASH_IP=3Dm
> CONFIG_IP_SET_HASH_IPMARK=3Dm
> CONFIG_IP_SET_HASH_IPPORT=3Dm
> CONFIG_IP_SET_HASH_IPPORTIP=3Dm
> CONFIG_IP_SET_HASH_IPPORTNET=3Dm
> CONFIG_IP_SET_HASH_IPMAC=3Dm
> CONFIG_IP_SET_HASH_MAC=3Dm
> CONFIG_IP_SET_HASH_NETPORTNET=3Dm
> CONFIG_IP_SET_HASH_NET=3Dm
> CONFIG_IP_SET_HASH_NETNET=3Dm
> CONFIG_IP_SET_HASH_NETPORT=3Dm
> CONFIG_IP_SET_HASH_NETIFACE=3Dm
> CONFIG_IP_SET_LIST_SET=3Dm
> CONFIG_IP_VS=3Dm
> CONFIG_IP_VS_IPV6=3Dy
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=3D12
> =

> #
> # IPVS transport protocol load balancing support
> #
> CONFIG_IP_VS_PROTO_TCP=3Dy
> CONFIG_IP_VS_PROTO_UDP=3Dy
> CONFIG_IP_VS_PROTO_AH_ESP=3Dy
> CONFIG_IP_VS_PROTO_ESP=3Dy
> CONFIG_IP_VS_PROTO_AH=3Dy
> CONFIG_IP_VS_PROTO_SCTP=3Dy
> =

> #
> # IPVS scheduler
> #
> CONFIG_IP_VS_RR=3Dm
> CONFIG_IP_VS_WRR=3Dm
> CONFIG_IP_VS_LC=3Dm
> CONFIG_IP_VS_WLC=3Dm
> CONFIG_IP_VS_FO=3Dm
> CONFIG_IP_VS_OVF=3Dm
> CONFIG_IP_VS_LBLC=3Dm
> CONFIG_IP_VS_LBLCR=3Dm
> CONFIG_IP_VS_DH=3Dm
> CONFIG_IP_VS_SH=3Dm
> # CONFIG_IP_VS_MH is not set
> CONFIG_IP_VS_SED=3Dm
> CONFIG_IP_VS_NQ=3Dm
> # CONFIG_IP_VS_TWOS is not set
> =

> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=3D8
> =

> #
> # IPVS MH scheduler
> #
> CONFIG_IP_VS_MH_TAB_INDEX=3D12
> =

> #
> # IPVS application helper
> #
> CONFIG_IP_VS_FTP=3Dm
> CONFIG_IP_VS_NFCT=3Dy
> CONFIG_IP_VS_PE_SIP=3Dm
> =

> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=3Dm
> CONFIG_NF_SOCKET_IPV4=3Dm
> CONFIG_NF_TPROXY_IPV4=3Dm
> CONFIG_NF_TABLES_IPV4=3Dy
> CONFIG_NFT_REJECT_IPV4=3Dm
> CONFIG_NFT_DUP_IPV4=3Dm
> CONFIG_NFT_FIB_IPV4=3Dm
> CONFIG_NF_TABLES_ARP=3Dy
> CONFIG_NF_DUP_IPV4=3Dm
> CONFIG_NF_LOG_ARP=3Dm
> CONFIG_NF_LOG_IPV4=3Dm
> CONFIG_NF_REJECT_IPV4=3Dm
> CONFIG_NF_NAT_SNMP_BASIC=3Dm
> CONFIG_NF_NAT_PPTP=3Dm
> CONFIG_NF_NAT_H323=3Dm
> CONFIG_IP_NF_IPTABLES=3Dm
> CONFIG_IP_NF_MATCH_AH=3Dm
> CONFIG_IP_NF_MATCH_ECN=3Dm
> CONFIG_IP_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP_NF_MATCH_TTL=3Dm
> CONFIG_IP_NF_FILTER=3Dm
> CONFIG_IP_NF_TARGET_REJECT=3Dm
> CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP_NF_NAT=3Dm
> CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP_NF_TARGET_NETMAP=3Dm
> CONFIG_IP_NF_TARGET_REDIRECT=3Dm
> CONFIG_IP_NF_MANGLE=3Dm
> # CONFIG_IP_NF_TARGET_CLUSTERIP is not set
> CONFIG_IP_NF_TARGET_ECN=3Dm
> CONFIG_IP_NF_TARGET_TTL=3Dm
> CONFIG_IP_NF_RAW=3Dm
> CONFIG_IP_NF_SECURITY=3Dm
> CONFIG_IP_NF_ARPTABLES=3Dm
> CONFIG_IP_NF_ARPFILTER=3Dm
> CONFIG_IP_NF_ARP_MANGLE=3Dm
> # end of IP: Netfilter Configuration
> =

> #
> # IPv6: Netfilter Configuration
> #
> CONFIG_NF_SOCKET_IPV6=3Dm
> CONFIG_NF_TPROXY_IPV6=3Dm
> CONFIG_NF_TABLES_IPV6=3Dy
> CONFIG_NFT_REJECT_IPV6=3Dm
> CONFIG_NFT_DUP_IPV6=3Dm
> CONFIG_NFT_FIB_IPV6=3Dm
> CONFIG_NF_DUP_IPV6=3Dm
> CONFIG_NF_REJECT_IPV6=3Dm
> CONFIG_NF_LOG_IPV6=3Dm
> CONFIG_IP6_NF_IPTABLES=3Dm
> CONFIG_IP6_NF_MATCH_AH=3Dm
> CONFIG_IP6_NF_MATCH_EUI64=3Dm
> CONFIG_IP6_NF_MATCH_FRAG=3Dm
> CONFIG_IP6_NF_MATCH_OPTS=3Dm
> CONFIG_IP6_NF_MATCH_HL=3Dm
> CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
> CONFIG_IP6_NF_MATCH_MH=3Dm
> CONFIG_IP6_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP6_NF_MATCH_RT=3Dm
> # CONFIG_IP6_NF_MATCH_SRH is not set
> # CONFIG_IP6_NF_TARGET_HL is not set
> CONFIG_IP6_NF_FILTER=3Dm
> CONFIG_IP6_NF_TARGET_REJECT=3Dm
> CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP6_NF_MANGLE=3Dm
> CONFIG_IP6_NF_RAW=3Dm
> CONFIG_IP6_NF_SECURITY=3Dm
> CONFIG_IP6_NF_NAT=3Dm
> CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP6_NF_TARGET_NPT=3Dm
> # end of IPv6: Netfilter Configuration
> =

> CONFIG_NF_DEFRAG_IPV6=3Dm
> CONFIG_NF_TABLES_BRIDGE=3Dm
> # CONFIG_NFT_BRIDGE_META is not set
> CONFIG_NFT_BRIDGE_REJECT=3Dm
> CONFIG_NF_LOG_BRIDGE=3Dm
> # CONFIG_NF_CONNTRACK_BRIDGE is not set
> CONFIG_BRIDGE_NF_EBTABLES=3Dm
> CONFIG_BRIDGE_EBT_BROUTE=3Dm
> CONFIG_BRIDGE_EBT_T_FILTER=3Dm
> CONFIG_BRIDGE_EBT_T_NAT=3Dm
> CONFIG_BRIDGE_EBT_802_3=3Dm
> CONFIG_BRIDGE_EBT_AMONG=3Dm
> CONFIG_BRIDGE_EBT_ARP=3Dm
> CONFIG_BRIDGE_EBT_IP=3Dm
> CONFIG_BRIDGE_EBT_IP6=3Dm
> CONFIG_BRIDGE_EBT_LIMIT=3Dm
> CONFIG_BRIDGE_EBT_MARK=3Dm
> CONFIG_BRIDGE_EBT_PKTTYPE=3Dm
> CONFIG_BRIDGE_EBT_STP=3Dm
> CONFIG_BRIDGE_EBT_VLAN=3Dm
> CONFIG_BRIDGE_EBT_ARPREPLY=3Dm
> CONFIG_BRIDGE_EBT_DNAT=3Dm
> CONFIG_BRIDGE_EBT_MARK_T=3Dm
> CONFIG_BRIDGE_EBT_REDIRECT=3Dm
> CONFIG_BRIDGE_EBT_SNAT=3Dm
> CONFIG_BRIDGE_EBT_LOG=3Dm
> CONFIG_BRIDGE_EBT_NFLOG=3Dm
> # CONFIG_BPFILTER is not set
> # CONFIG_IP_DCCP is not set
> CONFIG_IP_SCTP=3Dm
> # CONFIG_SCTP_DBG_OBJCNT is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> CONFIG_INET_SCTP_DIAG=3Dm
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dm
> # CONFIG_TIPC_MEDIA_IB is not set
> CONFIG_TIPC_MEDIA_UDP=3Dy
> CONFIG_TIPC_CRYPTO=3Dy
> CONFIG_TIPC_DIAG=3Dm
> CONFIG_ATM=3Dm
> CONFIG_ATM_CLIP=3Dm
> # CONFIG_ATM_CLIP_NO_ICMP is not set
> CONFIG_ATM_LANE=3Dm
> # CONFIG_ATM_MPOA is not set
> CONFIG_ATM_BR2684=3Dm
> # CONFIG_ATM_BR2684_IPFILTER is not set
> CONFIG_L2TP=3Dm
> CONFIG_L2TP_DEBUGFS=3Dm
> CONFIG_L2TP_V3=3Dy
> CONFIG_L2TP_IP=3Dm
> CONFIG_L2TP_ETH=3Dm
> CONFIG_STP=3Dm
> CONFIG_GARP=3Dm
> CONFIG_MRP=3Dm
> CONFIG_BRIDGE=3Dm
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> # CONFIG_BRIDGE_MRP is not set
> # CONFIG_BRIDGE_CFM is not set
> CONFIG_HAVE_NET_DSA=3Dy
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dm
> CONFIG_VLAN_8021Q_GVRP=3Dy
> CONFIG_VLAN_8021Q_MVRP=3Dy
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dm
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> CONFIG_6LOWPAN=3Dm
> # CONFIG_6LOWPAN_DEBUGFS is not set
> # CONFIG_6LOWPAN_NHC is not set
> CONFIG_IEEE802154=3Dm
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> CONFIG_IEEE802154_SOCKET=3Dm
> CONFIG_IEEE802154_6LOWPAN=3Dm
> CONFIG_MAC802154=3Dm
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dm
> CONFIG_NET_SCH_HTB=3Dm
> CONFIG_NET_SCH_HFSC=3Dm
> CONFIG_NET_SCH_ATM=3Dm
> CONFIG_NET_SCH_PRIO=3Dm
> CONFIG_NET_SCH_MULTIQ=3Dm
> CONFIG_NET_SCH_RED=3Dm
> CONFIG_NET_SCH_SFB=3Dm
> CONFIG_NET_SCH_SFQ=3Dm
> CONFIG_NET_SCH_TEQL=3Dm
> CONFIG_NET_SCH_TBF=3Dm
> # CONFIG_NET_SCH_CBS is not set
> # CONFIG_NET_SCH_ETF is not set
> # CONFIG_NET_SCH_TAPRIO is not set
> CONFIG_NET_SCH_GRED=3Dm
> CONFIG_NET_SCH_DSMARK=3Dm
> CONFIG_NET_SCH_NETEM=3Dm
> CONFIG_NET_SCH_DRR=3Dm
> CONFIG_NET_SCH_MQPRIO=3Dm
> # CONFIG_NET_SCH_SKBPRIO is not set
> CONFIG_NET_SCH_CHOKE=3Dm
> CONFIG_NET_SCH_QFQ=3Dm
> CONFIG_NET_SCH_CODEL=3Dm
> CONFIG_NET_SCH_FQ_CODEL=3Dy
> # CONFIG_NET_SCH_CAKE is not set
> CONFIG_NET_SCH_FQ=3Dm
> CONFIG_NET_SCH_HHF=3Dm
> CONFIG_NET_SCH_PIE=3Dm
> # CONFIG_NET_SCH_FQ_PIE is not set
> CONFIG_NET_SCH_INGRESS=3Dm
> CONFIG_NET_SCH_PLUG=3Dm
> # CONFIG_NET_SCH_ETS is not set
> CONFIG_NET_SCH_DEFAULT=3Dy
> # CONFIG_DEFAULT_FQ is not set
> # CONFIG_DEFAULT_CODEL is not set
> CONFIG_DEFAULT_FQ_CODEL=3Dy
> # CONFIG_DEFAULT_SFQ is not set
> # CONFIG_DEFAULT_PFIFO_FAST is not set
> CONFIG_DEFAULT_NET_SCH=3D"fq_codel"
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dm
> CONFIG_NET_CLS_TCINDEX=3Dm
> CONFIG_NET_CLS_ROUTE4=3Dm
> CONFIG_NET_CLS_FW=3Dm
> CONFIG_NET_CLS_U32=3Dm
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dm
> CONFIG_NET_CLS_RSVP6=3Dm
> CONFIG_NET_CLS_FLOW=3Dm
> CONFIG_NET_CLS_CGROUP=3Dy
> CONFIG_NET_CLS_BPF=3Dm
> CONFIG_NET_CLS_FLOWER=3Dm
> CONFIG_NET_CLS_MATCHALL=3Dm
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dm
> CONFIG_NET_EMATCH_NBYTE=3Dm
> CONFIG_NET_EMATCH_U32=3Dm
> CONFIG_NET_EMATCH_META=3Dm
> CONFIG_NET_EMATCH_TEXT=3Dm
> # CONFIG_NET_EMATCH_CANID is not set
> CONFIG_NET_EMATCH_IPSET=3Dm
> # CONFIG_NET_EMATCH_IPT is not set
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dm
> CONFIG_NET_ACT_GACT=3Dm
> CONFIG_GACT_PROB=3Dy
> CONFIG_NET_ACT_MIRRED=3Dm
> CONFIG_NET_ACT_SAMPLE=3Dm
> # CONFIG_NET_ACT_IPT is not set
> CONFIG_NET_ACT_NAT=3Dm
> CONFIG_NET_ACT_PEDIT=3Dm
> CONFIG_NET_ACT_SIMP=3Dm
> CONFIG_NET_ACT_SKBEDIT=3Dm
> CONFIG_NET_ACT_CSUM=3Dm
> # CONFIG_NET_ACT_MPLS is not set
> CONFIG_NET_ACT_VLAN=3Dm
> CONFIG_NET_ACT_BPF=3Dm
> # CONFIG_NET_ACT_CONNMARK is not set
> # CONFIG_NET_ACT_CTINFO is not set
> CONFIG_NET_ACT_SKBMOD=3Dm
> # CONFIG_NET_ACT_IFE is not set
> CONFIG_NET_ACT_TUNNEL_KEY=3Dm
> # CONFIG_NET_ACT_GATE is not set
> # CONFIG_NET_TC_SKB_EXT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dm
> # CONFIG_BATMAN_ADV is not set
> CONFIG_OPENVSWITCH=3Dm
> CONFIG_OPENVSWITCH_GRE=3Dm
> CONFIG_VSOCKETS=3Dm
> CONFIG_VSOCKETS_DIAG=3Dm
> CONFIG_VSOCKETS_LOOPBACK=3Dm
> CONFIG_VMWARE_VMCI_VSOCKETS=3Dm
> CONFIG_VIRTIO_VSOCKETS=3Dm
> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
> CONFIG_HYPERV_VSOCKETS=3Dm
> CONFIG_NETLINK_DIAG=3Dm
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> CONFIG_MPLS_ROUTING=3Dm
> CONFIG_MPLS_IPTUNNEL=3Dm
> CONFIG_NET_NSH=3Dy
> # CONFIG_HSR is not set
> CONFIG_NET_SWITCHDEV=3Dy
> CONFIG_NET_L3_MASTER_DEV=3Dy
> # CONFIG_QRTR is not set
> # CONFIG_NET_NCSI is not set
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> CONFIG_XPS=3Dy
> CONFIG_CGROUP_NET_PRIO=3Dy
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_BPF_JIT=3Dy
> CONFIG_BPF_STREAM_PARSER=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=3Dm
> CONFIG_NET_DROP_MONITOR=3Dy
> # end of Network testing
> # end of Networking options
> =

> # CONFIG_HAMRADIO is not set
> CONFIG_CAN=3Dm
> CONFIG_CAN_RAW=3Dm
> CONFIG_CAN_BCM=3Dm
> CONFIG_CAN_GW=3Dm
> # CONFIG_CAN_J1939 is not set
> # CONFIG_CAN_ISOTP is not set
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dm
> # CONFIG_CAN_VXCAN is not set
> CONFIG_CAN_SLCAN=3Dm
> CONFIG_CAN_DEV=3Dm
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_KVASER_PCIEFD is not set
> CONFIG_CAN_C_CAN=3Dm
> CONFIG_CAN_C_CAN_PLATFORM=3Dm
> CONFIG_CAN_C_CAN_PCI=3Dm
> CONFIG_CAN_CC770=3Dm
> # CONFIG_CAN_CC770_ISA is not set
> CONFIG_CAN_CC770_PLATFORM=3Dm
> # CONFIG_CAN_IFI_CANFD is not set
> # CONFIG_CAN_M_CAN is not set
> # CONFIG_CAN_PEAK_PCIEFD is not set
> CONFIG_CAN_SJA1000=3Dm
> CONFIG_CAN_EMS_PCI=3Dm
> # CONFIG_CAN_F81601 is not set
> CONFIG_CAN_KVASER_PCI=3Dm
> CONFIG_CAN_PEAK_PCI=3Dm
> CONFIG_CAN_PEAK_PCIEC=3Dy
> CONFIG_CAN_PLX_PCI=3Dm
> # CONFIG_CAN_SJA1000_ISA is not set
> CONFIG_CAN_SJA1000_PLATFORM=3Dm
> CONFIG_CAN_SOFTING=3Dm
> =

> #
> # CAN SPI interfaces
> #
> # CONFIG_CAN_HI311X is not set
> # CONFIG_CAN_MCP251X is not set
> # CONFIG_CAN_MCP251XFD is not set
> # end of CAN SPI interfaces
> =

> #
> # CAN USB interfaces
> #
> # CONFIG_CAN_8DEV_USB is not set
> # CONFIG_CAN_EMS_USB is not set
> # CONFIG_CAN_ESD_USB2 is not set
> # CONFIG_CAN_GS_USB is not set
> # CONFIG_CAN_KVASER_USB is not set
> # CONFIG_CAN_MCBA_USB is not set
> # CONFIG_CAN_PEAK_USB is not set
> # CONFIG_CAN_UCAN is not set
> # end of CAN USB interfaces
> =

> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> CONFIG_BT=3Dm
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dm
> CONFIG_BT_RFCOMM_TTY=3Dy
> CONFIG_BT_BNEP=3Dm
> CONFIG_BT_BNEP_MC_FILTER=3Dy
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_HIDP=3Dm
> CONFIG_BT_HS=3Dy
> CONFIG_BT_LE=3Dy
> # CONFIG_BT_6LOWPAN is not set
> # CONFIG_BT_LEDS is not set
> # CONFIG_BT_MSFTEXT is not set
> CONFIG_BT_DEBUGFS=3Dy
> # CONFIG_BT_SELFTEST is not set
> =

> #
> # Bluetooth device drivers
> #
> # CONFIG_BT_HCIBTUSB is not set
> # CONFIG_BT_HCIBTSDIO is not set
> CONFIG_BT_HCIUART=3Dm
> CONFIG_BT_HCIUART_H4=3Dy
> CONFIG_BT_HCIUART_BCSP=3Dy
> CONFIG_BT_HCIUART_ATH3K=3Dy
> # CONFIG_BT_HCIUART_INTEL is not set
> # CONFIG_BT_HCIUART_AG6XX is not set
> # CONFIG_BT_HCIBCM203X is not set
> # CONFIG_BT_HCIBPA10X is not set
> # CONFIG_BT_HCIBFUSB is not set
> CONFIG_BT_HCIVHCI=3Dm
> CONFIG_BT_MRVL=3Dm
> # CONFIG_BT_MRVL_SDIO is not set
> # CONFIG_BT_MTKSDIO is not set
> # end of Bluetooth device drivers
> =

> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_STREAM_PARSER=3Dy
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> CONFIG_WEXT_CORE=3Dy
> CONFIG_WEXT_PROC=3Dy
> CONFIG_CFG80211=3Dm
> # CONFIG_NL80211_TESTMODE is not set
> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> # CONFIG_CFG80211_DEBUGFS is not set
> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> CONFIG_CFG80211_WEXT=3Dy
> CONFIG_MAC80211=3Dm
> CONFIG_MAC80211_HAS_RC=3Dy
> CONFIG_MAC80211_RC_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
> CONFIG_MAC80211_MESH=3Dy
> CONFIG_MAC80211_LEDS=3Dy
> CONFIG_MAC80211_DEBUGFS=3Dy
> # CONFIG_MAC80211_MESSAGE_TRACING is not set
> # CONFIG_MAC80211_DEBUG_MENU is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_RFKILL=3Dm
> CONFIG_RFKILL_LEDS=3Dy
> CONFIG_RFKILL_INPUT=3Dy
> # CONFIG_RFKILL_GPIO is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_XEN is not set
> # CONFIG_NET_9P_RDMA is not set
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> CONFIG_CEPH_LIB=3Dm
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> # CONFIG_NFC is not set
> CONFIG_PSAMPLE=3Dm
> # CONFIG_NET_IFE is not set
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_SOCK_VALIDATE_XMIT=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_NET_DEVLINK=3Dy
> CONFIG_PAGE_POOL=3Dy
> CONFIG_FAILOVER=3Dm
> CONFIG_ETHTOOL_NETLINK=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_HOTPLUG_PCI_PCIE=3Dy
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIEAER_INJECT=3Dm
> CONFIG_PCIE_ECRC=3Dy
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCIE_DPC=3Dy
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCIE_EDR is not set
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=3Dy
> CONFIG_PCI_PF_STUB=3Dm
> # CONFIG_XEN_PCIDEV_FRONTEND is not set
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> # CONFIG_PCI_P2PDMA is not set
> CONFIG_PCI_LABEL=3Dy
> CONFIG_PCI_HYPERV=3Dm
> CONFIG_HOTPLUG_PCI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI_IBM=3Dm
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> =

> #
> # PCI controller drivers
> #
> CONFIG_VMD=3Dy
> CONFIG_PCI_HYPERV_INTERFACE=3Dm
> =

> #
> # DesignWare PCI Core Support
> #
> # CONFIG_PCIE_DW_PLAT_HOST is not set
> # CONFIG_PCI_MESON is not set
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # end of PCI switch controller drivers
> =

> # CONFIG_CXL_BUS is not set
> # CONFIG_PCCARD is not set
> # CONFIG_RAPIDIO is not set
> =

> #
> # Generic Driver Options
> #
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> # CONFIG_FW_LOADER_COMPRESS is not set
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_PM_QOS_KUNIT_TEST is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_KUNIT_DRIVER_PE_TEST=3Dy
> CONFIG_SYS_HYPERVISOR=3Dy
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dm
> CONFIG_REGMAP_SPI=3Dm
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> =

> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> # CONFIG_GNSS is not set
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dm
> CONFIG_PARPORT_PC=3Dm
> CONFIG_PARPORT_SERIAL=3Dm
> # CONFIG_PARPORT_PC_FIFO is not set
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_AX88796 is not set
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dm
> CONFIG_BLK_DEV_NULL_BLK_FAULT_INJECTION=3Dy
> # CONFIG_BLK_DEV_FD is not set
> CONFIG_CDROM=3Dm
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> # CONFIG_BLK_DEV_UMEM is not set
> CONFIG_BLK_DEV_LOOP=3Dm
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
> # CONFIG_BLK_DEV_CRYPTOLOOP is not set
> # CONFIG_BLK_DEV_DRBD is not set
> CONFIG_BLK_DEV_NBD=3Dm
> # CONFIG_BLK_DEV_SX8 is not set
> CONFIG_BLK_DEV_RAM=3Dm
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D16384
> CONFIG_CDROM_PKTCDVD=3Dm
> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_XEN_BLKDEV_FRONTEND=3Dm
> CONFIG_VIRTIO_BLK=3Dm
> CONFIG_BLK_DEV_RBD=3Dm
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # NVME Support
> #
> CONFIG_NVME_CORE=3Dm
> CONFIG_BLK_DEV_NVME=3Dm
> CONFIG_NVME_MULTIPATH=3Dy
> # CONFIG_NVME_HWMON is not set
> CONFIG_NVME_FABRICS=3Dm
> # CONFIG_NVME_RDMA is not set
> CONFIG_NVME_FC=3Dm
> # CONFIG_NVME_TCP is not set
> CONFIG_NVME_TARGET=3Dm
> # CONFIG_NVME_TARGET_PASSTHRU is not set
> CONFIG_NVME_TARGET_LOOP=3Dm
> # CONFIG_NVME_TARGET_RDMA is not set
> CONFIG_NVME_TARGET_FC=3Dm
> CONFIG_NVME_TARGET_FCLOOP=3Dm
> # CONFIG_NVME_TARGET_TCP is not set
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> # CONFIG_AD525X_DPOT is not set
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=3Dm
> CONFIG_TIFM_7XX1=3Dm
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dm
> CONFIG_SGI_XP=3Dm
> CONFIG_HP_ILO=3Dm
> CONFIG_SGI_GRU=3Dm
> # CONFIG_SGI_GRU_DEBUG is not set
> CONFIG_APDS9802ALS=3Dm
> CONFIG_ISL29003=3Dm
> CONFIG_ISL29020=3Dm
> CONFIG_SENSORS_TSL2550=3Dm
> CONFIG_SENSORS_BH1770=3Dm
> CONFIG_SENSORS_APDS990X=3Dm
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> CONFIG_VMWARE_BALLOON=3Dm
> # CONFIG_LATTICE_ECP3_CONFIG is not set
> # CONFIG_SRAM is not set
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dm
> CONFIG_PVPANIC=3Dy
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> # CONFIG_EEPROM_AT25 is not set
> CONFIG_EEPROM_LEGACY=3Dm
> CONFIG_EEPROM_MAX6875=3Dm
> CONFIG_EEPROM_93CX6=3Dm
> # CONFIG_EEPROM_93XX46 is not set
> # CONFIG_EEPROM_IDT_89HPESX is not set
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dm
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> CONFIG_SENSORS_LIS3_I2C=3Dm
> CONFIG_ALTERA_STAPL=3Dm
> CONFIG_INTEL_MEI=3Dm
> CONFIG_INTEL_MEI_ME=3Dm
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_INTEL_MEI_HDCP is not set
> CONFIG_VMWARE_VMCI=3Dm
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_BCM_VK is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> CONFIG_MISC_RTSX_PCI=3Dm
> # CONFIG_MISC_RTSX_USB is not set
> # CONFIG_HABANA_AI is not set
> # CONFIG_UACCE is not set
> # end of Misc devices
> =

> CONFIG_HAVE_IDE=3Dy
> # CONFIG_IDE is not set
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dm
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_NETLINK=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dm
> CONFIG_CHR_DEV_ST=3Dm
> CONFIG_BLK_DEV_SR=3Dm
> CONFIG_CHR_DEV_SG=3Dm
> CONFIG_CHR_DEV_SCH=3Dm
> CONFIG_SCSI_ENCLOSURE=3Dm
> CONFIG_SCSI_CONSTANTS=3Dy
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dm
> CONFIG_SCSI_FC_ATTRS=3Dm
> CONFIG_SCSI_ISCSI_ATTRS=3Dm
> CONFIG_SCSI_SAS_ATTRS=3Dm
> CONFIG_SCSI_SAS_LIBSAS=3Dm
> CONFIG_SCSI_SAS_ATA=3Dy
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> CONFIG_SCSI_SRP_ATTRS=3Dm
> # end of SCSI Transports
> =

> CONFIG_SCSI_LOWLEVEL=3Dy
> # CONFIG_ISCSI_TCP is not set
> # CONFIG_ISCSI_BOOT_SYSFS is not set
> # CONFIG_SCSI_CXGB3_ISCSI is not set
> # CONFIG_SCSI_CXGB4_ISCSI is not set
> # CONFIG_SCSI_BNX2_ISCSI is not set
> # CONFIG_BE2ISCSI is not set
> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> # CONFIG_SCSI_HPSA is not set
> # CONFIG_SCSI_3W_9XXX is not set
> # CONFIG_SCSI_3W_SAS is not set
> # CONFIG_SCSI_ACARD is not set
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> # CONFIG_SCSI_AIC79XX is not set
> # CONFIG_SCSI_AIC94XX is not set
> # CONFIG_SCSI_MVSAS is not set
> # CONFIG_SCSI_MVUMI is not set
> # CONFIG_SCSI_DPT_I2O is not set
> # CONFIG_SCSI_ADVANSYS is not set
> # CONFIG_SCSI_ARCMSR is not set
> # CONFIG_SCSI_ESAS2R is not set
> # CONFIG_MEGARAID_NEWGEN is not set
> # CONFIG_MEGARAID_LEGACY is not set
> # CONFIG_MEGARAID_SAS is not set
> CONFIG_SCSI_MPT3SAS=3Dm
> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
> # CONFIG_SCSI_MPT2SAS is not set
> # CONFIG_SCSI_SMARTPQI is not set
> # CONFIG_SCSI_UFSHCD is not set
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_SCSI_BUSLOGIC is not set
> # CONFIG_SCSI_MYRB is not set
> # CONFIG_SCSI_MYRS is not set
> # CONFIG_VMWARE_PVSCSI is not set
> # CONFIG_XEN_SCSI_FRONTEND is not set
> CONFIG_HYPERV_STORAGE=3Dm
> # CONFIG_LIBFC is not set
> # CONFIG_SCSI_SNIC is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_FDOMAIN_PCI is not set
> CONFIG_SCSI_ISCI=3Dm
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> # CONFIG_SCSI_PPA is not set
> # CONFIG_SCSI_IMM is not set
> # CONFIG_SCSI_STEX is not set
> # CONFIG_SCSI_SYM53C8XX_2 is not set
> # CONFIG_SCSI_IPR is not set
> # CONFIG_SCSI_QLOGIC_1280 is not set
> # CONFIG_SCSI_QLA_FC is not set
> # CONFIG_SCSI_QLA_ISCSI is not set
> # CONFIG_SCSI_LPFC is not set
> # CONFIG_SCSI_DC395x is not set
> # CONFIG_SCSI_AM53C974 is not set
> # CONFIG_SCSI_WD719X is not set
> CONFIG_SCSI_DEBUG=3Dm
> # CONFIG_SCSI_PMCRAID is not set
> # CONFIG_SCSI_PM8001 is not set
> # CONFIG_SCSI_BFA_FC is not set
> # CONFIG_SCSI_VIRTIO is not set
> # CONFIG_SCSI_CHELSIO_FCOE is not set
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dy
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dy
> CONFIG_SCSI_DH_ALUA=3Dy
> # end of SCSI device support
> =

> CONFIG_ATA=3Dm
> CONFIG_SATA_HOST=3Dy
> CONFIG_PATA_TIMINGS=3Dy
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> CONFIG_ATA_FORCE=3Dy
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dm
> CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> CONFIG_SATA_AHCI_PLATFORM=3Dm
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> # CONFIG_PDC_ADMA is not set
> # CONFIG_SATA_QSTOR is not set
> # CONFIG_SATA_SX4 is not set
> CONFIG_ATA_BMDMA=3Dy
> =

> #
> # SATA SFF controllers with BMDMA
> #
> CONFIG_ATA_PIIX=3Dm
> # CONFIG_SATA_DWC is not set
> # CONFIG_SATA_MV is not set
> # CONFIG_SATA_NV is not set
> # CONFIG_SATA_PROMISE is not set
> # CONFIG_SATA_SIL is not set
> # CONFIG_SATA_SIS is not set
> # CONFIG_SATA_SVW is not set
> # CONFIG_SATA_ULI is not set
> # CONFIG_SATA_VIA is not set
> # CONFIG_SATA_VITESSE is not set
> =

> #
> # PATA SFF controllers with BMDMA
> #
> # CONFIG_PATA_ALI is not set
> # CONFIG_PATA_AMD is not set
> # CONFIG_PATA_ARTOP is not set
> # CONFIG_PATA_ATIIXP is not set
> # CONFIG_PATA_ATP867X is not set
> # CONFIG_PATA_CMD64X is not set
> # CONFIG_PATA_CYPRESS is not set
> # CONFIG_PATA_EFAR is not set
> # CONFIG_PATA_HPT366 is not set
> # CONFIG_PATA_HPT37X is not set
> # CONFIG_PATA_HPT3X2N is not set
> # CONFIG_PATA_HPT3X3 is not set
> # CONFIG_PATA_IT8213 is not set
> # CONFIG_PATA_IT821X is not set
> # CONFIG_PATA_JMICRON is not set
> # CONFIG_PATA_MARVELL is not set
> # CONFIG_PATA_NETCELL is not set
> # CONFIG_PATA_NINJA32 is not set
> # CONFIG_PATA_NS87415 is not set
> # CONFIG_PATA_OLDPIIX is not set
> # CONFIG_PATA_OPTIDMA is not set
> # CONFIG_PATA_PDC2027X is not set
> # CONFIG_PATA_PDC_OLD is not set
> # CONFIG_PATA_RADISYS is not set
> # CONFIG_PATA_RDC is not set
> # CONFIG_PATA_SCH is not set
> # CONFIG_PATA_SERVERWORKS is not set
> # CONFIG_PATA_SIL680 is not set
> # CONFIG_PATA_SIS is not set
> # CONFIG_PATA_TOSHIBA is not set
> # CONFIG_PATA_TRIFLEX is not set
> # CONFIG_PATA_VIA is not set
> # CONFIG_PATA_WINBOND is not set
> =

> #
> # PIO-only SFF controllers
> #
> # CONFIG_PATA_CMD640_PCI is not set
> # CONFIG_PATA_MPIIX is not set
> # CONFIG_PATA_NS87410 is not set
> # CONFIG_PATA_OPTI is not set
> # CONFIG_PATA_RZ1000 is not set
> =

> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_ACPI is not set
> CONFIG_ATA_GENERIC=3Dm
> # CONFIG_PATA_LEGACY is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> CONFIG_MD_AUTODETECT=3Dy
> CONFIG_MD_LINEAR=3Dm
> CONFIG_MD_RAID0=3Dm
> CONFIG_MD_RAID1=3Dm
> CONFIG_MD_RAID10=3Dm
> CONFIG_MD_RAID456=3Dm
> CONFIG_MD_MULTIPATH=3Dm
> CONFIG_MD_FAULTY=3Dm
> CONFIG_MD_CLUSTER=3Dm
> # CONFIG_BCACHE is not set
> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> CONFIG_BLK_DEV_DM=3Dm
> CONFIG_DM_DEBUG=3Dy
> CONFIG_DM_BUFIO=3Dm
> # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> CONFIG_DM_BIO_PRISON=3Dm
> CONFIG_DM_PERSISTENT_DATA=3Dm
> # CONFIG_DM_UNSTRIPED is not set
> CONFIG_DM_CRYPT=3Dm
> CONFIG_DM_SNAPSHOT=3Dm
> CONFIG_DM_THIN_PROVISIONING=3Dm
> CONFIG_DM_CACHE=3Dm
> CONFIG_DM_CACHE_SMQ=3Dm
> CONFIG_DM_WRITECACHE=3Dm
> # CONFIG_DM_EBS is not set
> CONFIG_DM_ERA=3Dm
> # CONFIG_DM_CLONE is not set
> CONFIG_DM_MIRROR=3Dm
> CONFIG_DM_LOG_USERSPACE=3Dm
> CONFIG_DM_RAID=3Dm
> CONFIG_DM_ZERO=3Dm
> CONFIG_DM_MULTIPATH=3Dm
> CONFIG_DM_MULTIPATH_QL=3Dm
> CONFIG_DM_MULTIPATH_ST=3Dm
> # CONFIG_DM_MULTIPATH_HST is not set
> # CONFIG_DM_MULTIPATH_IOA is not set
> CONFIG_DM_DELAY=3Dm
> # CONFIG_DM_DUST is not set
> CONFIG_DM_UEVENT=3Dy
> CONFIG_DM_FLAKEY=3Dm
> CONFIG_DM_VERITY=3Dm
> # CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
> # CONFIG_DM_VERITY_FEC is not set
> CONFIG_DM_SWITCH=3Dm
> CONFIG_DM_LOG_WRITES=3Dm
> CONFIG_DM_INTEGRITY=3Dm
> # CONFIG_DM_ZONED is not set
> CONFIG_TARGET_CORE=3Dm
> CONFIG_TCM_IBLOCK=3Dm
> CONFIG_TCM_FILEIO=3Dm
> CONFIG_TCM_PSCSI=3Dm
> CONFIG_TCM_USER2=3Dm
> CONFIG_LOOPBACK_TARGET=3Dm
> CONFIG_ISCSI_TARGET=3Dm
> # CONFIG_SBP_TARGET is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dm
> CONFIG_FIREWIRE_OHCI=3Dm
> CONFIG_FIREWIRE_SBP2=3Dm
> CONFIG_FIREWIRE_NET=3Dm
> # CONFIG_FIREWIRE_NOSY is not set
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> CONFIG_MAC_EMUMOUSEBTN=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
> # CONFIG_IFB is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_MACSEC is not set
> CONFIG_NETCONSOLE=3Dm
> CONFIG_NETCONSOLE_DYNAMIC=3Dy
> CONFIG_NETPOLL=3Dy
> CONFIG_NET_POLL_CONTROLLER=3Dy
> CONFIG_TUN=3Dm
> # CONFIG_TUN_VNET_CROSS_LE is not set
> CONFIG_VETH=3Dm
> CONFIG_VIRTIO_NET=3Dm
> # CONFIG_NLMON is not set
> # CONFIG_NET_VRF is not set
> # CONFIG_VSOCKMON is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> =

> #
> # Distributed Switch Architecture drivers
> #
> # CONFIG_NET_DSA_MV88E6XXX_PTP is not set
> # end of Distributed Switch Architecture drivers
> =

> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dy
> CONFIG_NET_VENDOR_3COM=3Dy
> # CONFIG_VORTEX is not set
> # CONFIG_TYPHOON is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> # CONFIG_ENA_ETHERNET is not set
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> CONFIG_CAVIUM_PTP=3Dy
> # CONFIG_LIQUIDIO is not set
> # CONFIG_LIQUIDIO_VF is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> # CONFIG_GVE is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> # CONFIG_HINIC is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> CONFIG_E1000E=3Dy
> CONFIG_E1000E_HWTS=3Dy
> CONFIG_IGB=3Dy
> CONFIG_IGB_HWMON=3Dy
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> CONFIG_IXGBE=3Dy
> CONFIG_IXGBE_HWMON=3Dy
> # CONFIG_IXGBE_DCB is not set
> CONFIG_IXGBE_IPSEC=3Dy
> # CONFIG_IXGBEVF is not set
> CONFIG_I40E=3Dy
> # CONFIG_I40E_DCB is not set
> # CONFIG_I40EVF is not set
> # CONFIG_ICE is not set
> # CONFIG_FM10K is not set
> CONFIG_IGC=3Dy
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> # CONFIG_PRESTERA is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> CONFIG_R8169=3Dy
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> # CONFIG_ROCKER is not set
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> CONFIG_PHYLIB=3Dy
> # CONFIG_LED_TRIGGER_PHY is not set
> # CONFIG_FIXED_PHY is not set
> =

> #
> # MII PHY device drivers
> #
> # CONFIG_AMD_PHY is not set
> # CONFIG_ADIN_PHY is not set
> # CONFIG_AQUANTIA_PHY is not set
> # CONFIG_AX88796B_PHY is not set
> # CONFIG_BROADCOM_PHY is not set
> # CONFIG_BCM54140_PHY is not set
> # CONFIG_BCM7XXX_PHY is not set
> # CONFIG_BCM84881_PHY is not set
> # CONFIG_BCM87XX_PHY is not set
> # CONFIG_CICADA_PHY is not set
> # CONFIG_CORTINA_PHY is not set
> # CONFIG_DAVICOM_PHY is not set
> # CONFIG_ICPLUS_PHY is not set
> # CONFIG_LXT_PHY is not set
> # CONFIG_INTEL_XWAY_PHY is not set
> # CONFIG_LSI_ET1011C_PHY is not set
> # CONFIG_MARVELL_PHY is not set
> # CONFIG_MARVELL_10G_PHY is not set
> # CONFIG_MICREL_PHY is not set
> # CONFIG_MICROCHIP_PHY is not set
> # CONFIG_MICROCHIP_T1_PHY is not set
> # CONFIG_MICROSEMI_PHY is not set
> # CONFIG_NATIONAL_PHY is not set
> # CONFIG_NXP_TJA11XX_PHY is not set
> # CONFIG_QSEMI_PHY is not set
> CONFIG_REALTEK_PHY=3Dy
> # CONFIG_RENESAS_PHY is not set
> # CONFIG_ROCKCHIP_PHY is not set
> # CONFIG_SMSC_PHY is not set
> # CONFIG_STE10XP is not set
> # CONFIG_TERANETICS_PHY is not set
> # CONFIG_DP83822_PHY is not set
> # CONFIG_DP83TC811_PHY is not set
> # CONFIG_DP83848_PHY is not set
> # CONFIG_DP83867_PHY is not set
> # CONFIG_DP83869_PHY is not set
> # CONFIG_VITESSE_PHY is not set
> # CONFIG_XILINX_GMII2RGMII is not set
> # CONFIG_MICREL_KS8995MA is not set
> CONFIG_MDIO_DEVICE=3Dy
> CONFIG_MDIO_BUS=3Dy
> CONFIG_MDIO_DEVRES=3Dy
> # CONFIG_MDIO_BITBANG is not set
> # CONFIG_MDIO_BCM_UNIMAC is not set
> # CONFIG_MDIO_MVUSB is not set
> # CONFIG_MDIO_MSCC_MIIM is not set
> # CONFIG_MDIO_THUNDER is not set
> =

> #
> # MDIO Multiplexers
> #
> =

> #
> # PCS device drivers
> #
> # CONFIG_PCS_XPCS is not set
> # end of PCS device drivers
> =

> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> CONFIG_USB_NET_DRIVERS=3Dy
> # CONFIG_USB_CATC is not set
> # CONFIG_USB_KAWETH is not set
> # CONFIG_USB_PEGASUS is not set
> # CONFIG_USB_RTL8150 is not set
> CONFIG_USB_RTL8152=3Dy
> # CONFIG_USB_LAN78XX is not set
> CONFIG_USB_USBNET=3Dy
> CONFIG_USB_NET_AX8817X=3Dy
> CONFIG_USB_NET_AX88179_178A=3Dy
> # CONFIG_USB_NET_CDCETHER is not set
> # CONFIG_USB_NET_CDC_EEM is not set
> # CONFIG_USB_NET_CDC_NCM is not set
> # CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
> # CONFIG_USB_NET_CDC_MBIM is not set
> # CONFIG_USB_NET_DM9601 is not set
> # CONFIG_USB_NET_SR9700 is not set
> # CONFIG_USB_NET_SR9800 is not set
> # CONFIG_USB_NET_SMSC75XX is not set
> # CONFIG_USB_NET_SMSC95XX is not set
> # CONFIG_USB_NET_GL620A is not set
> # CONFIG_USB_NET_NET1080 is not set
> # CONFIG_USB_NET_PLUSB is not set
> # CONFIG_USB_NET_MCS7830 is not set
> # CONFIG_USB_NET_RNDIS_HOST is not set
> # CONFIG_USB_NET_CDC_SUBSET is not set
> # CONFIG_USB_NET_ZAURUS is not set
> # CONFIG_USB_NET_CX82310_ETH is not set
> # CONFIG_USB_NET_KALMIA is not set
> # CONFIG_USB_NET_QMI_WWAN is not set
> # CONFIG_USB_HSO is not set
> # CONFIG_USB_NET_INT51X1 is not set
> # CONFIG_USB_IPHETH is not set
> # CONFIG_USB_SIERRA_NET is not set
> # CONFIG_USB_NET_CH9200 is not set
> # CONFIG_USB_NET_AQC111 is not set
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> # CONFIG_ADM8211 is not set
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K is not set
> # CONFIG_ATH5K_PCI is not set
> # CONFIG_ATH9K is not set
> # CONFIG_ATH9K_HTC is not set
> # CONFIG_CARL9170 is not set
> # CONFIG_ATH6KL is not set
> # CONFIG_AR5523 is not set
> # CONFIG_WIL6210 is not set
> # CONFIG_ATH10K is not set
> # CONFIG_WCN36XX is not set
> # CONFIG_ATH11K is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> # CONFIG_ATMEL is not set
> # CONFIG_AT76C50X_USB is not set
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> # CONFIG_B43 is not set
> # CONFIG_B43LEGACY is not set
> # CONFIG_BRCMSMAC is not set
> # CONFIG_BRCMFMAC is not set
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> # CONFIG_AIRO is not set
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> # CONFIG_IPW2100 is not set
> # CONFIG_IPW2200 is not set
> # CONFIG_IWL4965 is not set
> # CONFIG_IWL3945 is not set
> # CONFIG_IWLWIFI is not set
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> # CONFIG_HERMES is not set
> # CONFIG_P54_COMMON is not set
> # CONFIG_PRISM54 is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> # CONFIG_LIBERTAS is not set
> # CONFIG_LIBERTAS_THINFIRM is not set
> # CONFIG_MWIFIEX is not set
> # CONFIG_MWL8K is not set
> CONFIG_WLAN_VENDOR_MEDIATEK=3Dy
> # CONFIG_MT7601U is not set
> # CONFIG_MT76x0U is not set
> # CONFIG_MT76x0E is not set
> # CONFIG_MT76x2E is not set
> # CONFIG_MT76x2U is not set
> # CONFIG_MT7603E is not set
> # CONFIG_MT7615E is not set
> # CONFIG_MT7663U is not set
> # CONFIG_MT7663S is not set
> # CONFIG_MT7915E is not set
> # CONFIG_MT7921E is not set
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> # CONFIG_WILC1000_SDIO is not set
> # CONFIG_WILC1000_SPI is not set
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> # CONFIG_RT2X00 is not set
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> # CONFIG_RTL8180 is not set
> # CONFIG_RTL8187 is not set
> CONFIG_RTL_CARDS=3Dm
> # CONFIG_RTL8192CE is not set
> # CONFIG_RTL8192SE is not set
> # CONFIG_RTL8192DE is not set
> # CONFIG_RTL8723AE is not set
> # CONFIG_RTL8723BE is not set
> # CONFIG_RTL8188EE is not set
> # CONFIG_RTL8192EE is not set
> # CONFIG_RTL8821AE is not set
> # CONFIG_RTL8192CU is not set
> # CONFIG_RTL8XXXU is not set
> # CONFIG_RTW88 is not set
> CONFIG_WLAN_VENDOR_RSI=3Dy
> # CONFIG_RSI_91X is not set
> CONFIG_WLAN_VENDOR_ST=3Dy
> # CONFIG_CW1200 is not set
> CONFIG_WLAN_VENDOR_TI=3Dy
> # CONFIG_WL1251 is not set
> # CONFIG_WL12XX is not set
> # CONFIG_WL18XX is not set
> # CONFIG_WLCORE is not set
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> # CONFIG_USB_ZD1201 is not set
> # CONFIG_ZD1211RW is not set
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_QTNFMAC_PCIE is not set
> CONFIG_MAC80211_HWSIM=3Dm
> # CONFIG_USB_NET_RNDIS_WLAN is not set
> # CONFIG_VIRT_WIFI is not set
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dm
> # CONFIG_IEEE802154_FAKELB is not set
> # CONFIG_IEEE802154_AT86RF230 is not set
> # CONFIG_IEEE802154_MRF24J40 is not set
> # CONFIG_IEEE802154_CC2520 is not set
> # CONFIG_IEEE802154_ATUSB is not set
> # CONFIG_IEEE802154_ADF7242 is not set
> # CONFIG_IEEE802154_CA8210 is not set
> # CONFIG_IEEE802154_MCR20A is not set
> # CONFIG_IEEE802154_HWSIM is not set
> CONFIG_XEN_NETDEV_FRONTEND=3Dy
> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_HYPERV_NET is not set
> CONFIG_NETDEVSIM=3Dm
> CONFIG_NET_FAILOVER=3Dm
> # CONFIG_ISDN is not set
> # CONFIG_NVM is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dm
> CONFIG_INPUT_SPARSEKMAP=3Dm
> # CONFIG_INPUT_MATRIXKMAP is not set
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dm
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> # CONFIG_KEYBOARD_APPLESPI is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> CONFIG_MOUSE_PS2_ELANTECH=3Dy
> CONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> CONFIG_MOUSE_PS2_VMMOUSE=3Dy
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> CONFIG_MOUSE_SERIAL=3Dm
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dm
> CONFIG_MOUSE_ELAN_I2C=3Dm
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> CONFIG_MOUSE_VSXXXAA=3Dm
> # CONFIG_MOUSE_GPIO is not set
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> CONFIG_RMI4_CORE=3Dm
> CONFIG_RMI4_I2C=3Dm
> CONFIG_RMI4_SPI=3Dm
> CONFIG_RMI4_SMB=3Dm
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dm
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> CONFIG_RMI4_F34=3Dy
> # CONFIG_RMI4_F3A is not set
> # CONFIG_RMI4_F54 is not set
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> # CONFIG_SERIO_CT82C710 is not set
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> CONFIG_SERIO_ALTERA_PS2=3Dm
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=3Dm
> CONFIG_HYPERV_KEYBOARD=3Dm
> # CONFIG_SERIO_GPIO_PS2 is not set
> # CONFIG_USERIO is not set
> # CONFIG_GAMEPORT is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_VT_CONSOLE_SLEEP=3Dy
> CONFIG_HW_CONSOLE=3Dy
> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D64
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=3Dy
> CONFIG_SERIAL_8250_DWLIB=3Dy
> CONFIG_SERIAL_8250_DW=3Dy
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dm
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_BCM63XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_ARC=3Dm
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> CONFIG_SERIAL_NONSTANDARD=3Dy
> # CONFIG_ROCKETPORT is not set
> CONFIG_CYCLADES=3Dm
> # CONFIG_CYZ_INTR is not set
> # CONFIG_MOXA_INTELLIO is not set
> # CONFIG_MOXA_SMARTIO is not set
> CONFIG_SYNCLINK_GT=3Dm
> # CONFIG_ISI is not set
> CONFIG_N_HDLC=3Dm
> CONFIG_N_GSM=3Dm
> CONFIG_NOZOMI=3Dm
> # CONFIG_NULL_TTY is not set
> # CONFIG_TRACE_SINK is not set
> CONFIG_HVC_DRIVER=3Dy
> CONFIG_HVC_IRQ=3Dy
> CONFIG_HVC_XEN=3Dy
> CONFIG_HVC_XEN_FRONTEND=3Dy
> # CONFIG_SERIAL_DEV_BUS is not set
> CONFIG_PRINTER=3Dm
> # CONFIG_LP_CONSOLE is not set
> CONFIG_PPDEV=3Dm
> CONFIG_VIRTIO_CONSOLE=3Dm
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_DMI_DECODE=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SSIF=3Dm
> CONFIG_IPMI_WATCHDOG=3Dm
> CONFIG_IPMI_POWEROFF=3Dm
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> CONFIG_HW_RANDOM_INTEL=3Dm
> CONFIG_HW_RANDOM_AMD=3Dm
> # CONFIG_HW_RANDOM_BA431 is not set
> CONFIG_HW_RANDOM_VIA=3Dm
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> # CONFIG_HW_RANDOM_XIPHERA is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_MWAVE is not set
> CONFIG_DEVMEM=3Dy
> # CONFIG_DEVKMEM is not set
> CONFIG_NVRAM=3Dy
> CONFIG_RAW_DRIVER=3Dy
> CONFIG_MAX_RAW_DEVS=3D8192
> CONFIG_DEVPORT=3Dy
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> # CONFIG_HPET_MMAP_DEFAULT is not set
> CONFIG_HANGCHECK_TIMER=3Dm
> CONFIG_UV_MMTIMER=3Dm
> CONFIG_TCG_TPM=3Dy
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_SPI is not set
> # CONFIG_TCG_TIS_I2C_CR50 is not set
> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> CONFIG_TCG_NSC=3Dm
> CONFIG_TCG_ATMEL=3Dm
> CONFIG_TCG_INFINEON=3Dm
> # CONFIG_TCG_XEN is not set
> CONFIG_TCG_CRB=3Dy
> # CONFIG_TCG_VTPM_PROXY is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dm
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> CONFIG_TELCLOCK=3Dm
> # CONFIG_XILLYBUS is not set
> # end of Character devices
> =

> # CONFIG_RANDOM_TRUST_CPU is not set
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_MUX_GPIO is not set
> # CONFIG_I2C_MUX_LTC4306 is not set
> # CONFIG_I2C_MUX_PCA9541 is not set
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> # end of Multiplexer I2C Chip support
> =

> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCA=3Dm
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=3Dm
> CONFIG_I2C_AMD756_S4882=3Dm
> CONFIG_I2C_AMD8111=3Dm
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dm
> CONFIG_I2C_ISMT=3Dm
> CONFIG_I2C_PIIX4=3Dm
> CONFIG_I2C_NFORCE2=3Dm
> CONFIG_I2C_NFORCE2_S4985=3Dm
> # CONFIG_I2C_NVIDIA_GPU is not set
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> CONFIG_I2C_SIS96X=3Dm
> CONFIG_I2C_VIA=3Dm
> CONFIG_I2C_VIAPRO=3Dm
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dm
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dm
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dm
> CONFIG_I2C_SIMTEC=3Dm
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> CONFIG_I2C_PARPORT=3Dm
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dm
> # end of I2C Hardware Bus support
> =

> CONFIG_I2C_STUB=3Dm
> # CONFIG_I2C_SLAVE is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> CONFIG_SPI=3Dy
> # CONFIG_SPI_DEBUG is not set
> CONFIG_SPI_MASTER=3Dy
> # CONFIG_SPI_MEM is not set
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> # CONFIG_SPI_AXI_SPI_ENGINE is not set
> # CONFIG_SPI_BITBANG is not set
> # CONFIG_SPI_BUTTERFLY is not set
> # CONFIG_SPI_CADENCE is not set
> # CONFIG_SPI_DESIGNWARE is not set
> # CONFIG_SPI_NXP_FLEXSPI is not set
> # CONFIG_SPI_GPIO is not set
> # CONFIG_SPI_LM70_LLP is not set
> # CONFIG_SPI_LANTIQ_SSC is not set
> # CONFIG_SPI_OC_TINY is not set
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_ROCKCHIP is not set
> # CONFIG_SPI_SC18IS602 is not set
> # CONFIG_SPI_SIFIVE is not set
> # CONFIG_SPI_MXIC is not set
> # CONFIG_SPI_XCOMM is not set
> # CONFIG_SPI_XILINX is not set
> # CONFIG_SPI_ZYNQMP_GQSPI is not set
> # CONFIG_SPI_AMD is not set
> =

> #
> # SPI Multiplexer support
> #
> # CONFIG_SPI_MUX is not set
> =

> #
> # SPI Protocol Masters
> #
> # CONFIG_SPI_SPIDEV is not set
> # CONFIG_SPI_LOOPBACK_TEST is not set
> # CONFIG_SPI_TLE62X0 is not set
> # CONFIG_SPI_SLAVE is not set
> CONFIG_SPI_DYNAMIC=3Dy
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> CONFIG_PPS_CLIENT_LDISC=3Dm
> CONFIG_PPS_CLIENT_PARPORT=3Dm
> CONFIG_PPS_CLIENT_GPIO=3Dm
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=3Dy
> # CONFIG_DP83640_PHY is not set
> # CONFIG_PTP_1588_CLOCK_INES is not set
> CONFIG_PTP_1588_CLOCK_KVM=3Dm
> # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
> # CONFIG_PTP_1588_CLOCK_IDTCM is not set
> # CONFIG_PTP_1588_CLOCK_VMW is not set
> # CONFIG_PTP_1588_CLOCK_OCP is not set
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> # CONFIG_DEBUG_PINCTRL is not set
> CONFIG_PINCTRL_AMD=3Dm
> # CONFIG_PINCTRL_MCP23S08 is not set
> # CONFIG_PINCTRL_SX150X is not set
> CONFIG_PINCTRL_BAYTRAIL=3Dy
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> CONFIG_PINCTRL_INTEL=3Dy
> # CONFIG_PINCTRL_ALDERLAKE is not set
> CONFIG_PINCTRL_BROXTON=3Dm
> CONFIG_PINCTRL_CANNONLAKE=3Dm
> CONFIG_PINCTRL_CEDARFORK=3Dm
> CONFIG_PINCTRL_DENVERTON=3Dm
> # CONFIG_PINCTRL_ELKHARTLAKE is not set
> # CONFIG_PINCTRL_EMMITSBURG is not set
> CONFIG_PINCTRL_GEMINILAKE=3Dm
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_JASPERLAKE is not set
> # CONFIG_PINCTRL_LAKEFIELD is not set
> CONFIG_PINCTRL_LEWISBURG=3Dm
> CONFIG_PINCTRL_SUNRISEPOINT=3Dm
> # CONFIG_PINCTRL_TIGERLAKE is not set
> =

> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> =

> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_CDEV=3Dy
> CONFIG_GPIO_CDEV_V1=3Dy
> CONFIG_GPIO_GENERIC=3Dm
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_AMDPT=3Dm
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_ICH=3Dm
> # CONFIG_GPIO_MB86S7X is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_F7188X is not set
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_WINBOND is not set
> # CONFIG_GPIO_WS16C48 is not set
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> # CONFIG_GPIO_PCA953X is not set
> # CONFIG_GPIO_PCA9570 is not set
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
> =

> #
> # SPI GPIO expanders
> #
> # CONFIG_GPIO_MAX3191X is not set
> # CONFIG_GPIO_MAX7301 is not set
> # CONFIG_GPIO_MC33880 is not set
> # CONFIG_GPIO_PISOSR is not set
> # CONFIG_GPIO_XRA1403 is not set
> # end of SPI GPIO expanders
> =

> #
> # USB GPIO expanders
> #
> # end of USB GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> # CONFIG_GPIO_AGGREGATOR is not set
> # CONFIG_GPIO_MOCKUP is not set
> # end of Virtual GPIO drivers
> =

> # CONFIG_W1 is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_CW2015 is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_CHARGER_SBS is not set
> # CONFIG_MANAGER_SBS is not set
> # CONFIG_BATTERY_BQ27XXX is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_LTC4162L is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ2515X is not set
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_BQ25980 is not set
> # CONFIG_CHARGER_BQ256XX is not set
> CONFIG_CHARGER_SMB347=3Dm
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_CHARGER_RT9455 is not set
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dm
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dm
> CONFIG_SENSORS_ABITUGURU3=3Dm
> # CONFIG_SENSORS_AD7314 is not set
> CONFIG_SENSORS_AD7414=3Dm
> CONFIG_SENSORS_AD7418=3Dm
> CONFIG_SENSORS_ADM1021=3Dm
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> CONFIG_SENSORS_ADM1031=3Dm
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dm
> # CONFIG_SENSORS_ADT7310 is not set
> CONFIG_SENSORS_ADT7410=3Dm
> CONFIG_SENSORS_ADT7411=3Dm
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> CONFIG_SENSORS_ADT7475=3Dm
> # CONFIG_SENSORS_AHT10 is not set
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dm
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> CONFIG_SENSORS_K8TEMP=3Dm
> CONFIG_SENSORS_K10TEMP=3Dm
> CONFIG_SENSORS_FAM15H_POWER=3Dm
> # CONFIG_SENSORS_AMD_ENERGY is not set
> CONFIG_SENSORS_APPLESMC=3Dm
> CONFIG_SENSORS_ASB100=3Dm
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dm
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> # CONFIG_SENSORS_DRIVETEMP is not set
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dm
> CONFIG_SENSORS_I5K_AMB=3Dm
> CONFIG_SENSORS_F71805F=3Dm
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_FSCHMD=3Dm
> # CONFIG_SENSORS_FTSTEUTATES is not set
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> # CONFIG_SENSORS_G762 is not set
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dm
> CONFIG_SENSORS_IBMPEX=3Dm
> CONFIG_SENSORS_I5500=3Dm
> CONFIG_SENSORS_CORETEMP=3Dm
> CONFIG_SENSORS_IT87=3Dm
> CONFIG_SENSORS_JC42=3Dm
> # CONFIG_SENSORS_POWR1220 is not set
> CONFIG_SENSORS_LINEAGE=3Dm
> # CONFIG_SENSORS_LTC2945 is not set
> # CONFIG_SENSORS_LTC2947_I2C is not set
> # CONFIG_SENSORS_LTC2947_SPI is not set
> # CONFIG_SENSORS_LTC2990 is not set
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dm
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dm
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dm
> # CONFIG_SENSORS_MAX1111 is not set
> # CONFIG_SENSORS_MAX127 is not set
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dm
> # CONFIG_SENSORS_MAX31722 is not set
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dm
> CONFIG_SENSORS_MAX6642=3Dm
> CONFIG_SENSORS_MAX6650=3Dm
> CONFIG_SENSORS_MAX6697=3Dm
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=3Dm
> # CONFIG_SENSORS_MLXREG_FAN is not set
> # CONFIG_SENSORS_TC654 is not set
> # CONFIG_SENSORS_TPS23861 is not set
> # CONFIG_SENSORS_MR75203 is not set
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=3Dm
> # CONFIG_SENSORS_LM70 is not set
> CONFIG_SENSORS_LM73=3Dm
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dm
> CONFIG_SENSORS_LM78=3Dm
> CONFIG_SENSORS_LM80=3Dm
> CONFIG_SENSORS_LM83=3Dm
> CONFIG_SENSORS_LM85=3Dm
> CONFIG_SENSORS_LM87=3Dm
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dm
> CONFIG_SENSORS_LM95234=3Dm
> CONFIG_SENSORS_LM95241=3Dm
> CONFIG_SENSORS_LM95245=3Dm
> CONFIG_SENSORS_PC87360=3Dm
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775=3Dm
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_NCT7904 is not set
> # CONFIG_SENSORS_NPCM7XX is not set
> CONFIG_SENSORS_PCF8591=3Dm
> CONFIG_PMBUS=3Dm
> CONFIG_SENSORS_PMBUS=3Dm
> # CONFIG_SENSORS_ADM1266 is not set
> CONFIG_SENSORS_ADM1275=3Dm
> # CONFIG_SENSORS_BEL_PFE is not set
> # CONFIG_SENSORS_IBM_CFFPS is not set
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> # CONFIG_SENSORS_IR35221 is not set
> # CONFIG_SENSORS_IR38064 is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dm
> # CONFIG_SENSORS_LTC3815 is not set
> CONFIG_SENSORS_MAX16064=3Dm
> # CONFIG_SENSORS_MAX16601 is not set
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> CONFIG_SENSORS_MAX34440=3Dm
> CONFIG_SENSORS_MAX8688=3Dm
> # CONFIG_SENSORS_MP2975 is not set
> # CONFIG_SENSORS_PM6764TR is not set
> # CONFIG_SENSORS_PXE1610 is not set
> # CONFIG_SENSORS_Q54SJ108A2 is not set
> # CONFIG_SENSORS_TPS40422 is not set
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_UCD9000=3Dm
> CONFIG_SENSORS_UCD9200=3Dm
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=3Dm
> # CONFIG_SENSORS_SBTSI is not set
> CONFIG_SENSORS_SHT15=3Dm
> CONFIG_SENSORS_SHT21=3Dm
> # CONFIG_SENSORS_SHT3x is not set
> # CONFIG_SENSORS_SHTC1 is not set
> CONFIG_SENSORS_SIS5595=3Dm
> CONFIG_SENSORS_DME1737=3Dm
> CONFIG_SENSORS_EMC1403=3Dm
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dm
> CONFIG_SENSORS_SMSC47M1=3Dm
> CONFIG_SENSORS_SMSC47M192=3Dm
> CONFIG_SENSORS_SMSC47B397=3Dm
> CONFIG_SENSORS_SCH56XX_COMMON=3Dm
> CONFIG_SENSORS_SCH5627=3Dm
> CONFIG_SENSORS_SCH5636=3Dm
> # CONFIG_SENSORS_STTS751 is not set
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS7828=3Dm
> # CONFIG_SENSORS_ADS7871 is not set
> CONFIG_SENSORS_AMC6821=3Dm
> CONFIG_SENSORS_INA209=3Dm
> CONFIG_SENSORS_INA2XX=3Dm
> # CONFIG_SENSORS_INA3221 is not set
> # CONFIG_SENSORS_TC74 is not set
> CONFIG_SENSORS_THMC50=3Dm
> CONFIG_SENSORS_TMP102=3Dm
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dm
> CONFIG_SENSORS_TMP421=3Dm
> # CONFIG_SENSORS_TMP513 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> CONFIG_SENSORS_VIA686A=3Dm
> CONFIG_SENSORS_VT1211=3Dm
> CONFIG_SENSORS_VT8231=3Dm
> # CONFIG_SENSORS_W83773G is not set
> CONFIG_SENSORS_W83781D=3Dm
> CONFIG_SENSORS_W83791D=3Dm
> CONFIG_SENSORS_W83792D=3Dm
> CONFIG_SENSORS_W83793=3Dm
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> CONFIG_SENSORS_W83L786NG=3Dm
> CONFIG_SENSORS_W83627HF=3Dm
> CONFIG_SENSORS_W83627EHF=3Dm
> # CONFIG_SENSORS_XGENE is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dm
> CONFIG_SENSORS_ATK0110=3Dm
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> =

> #
> # Intel thermal drivers
> #
> CONFIG_INTEL_POWERCLAMP=3Dm
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> CONFIG_INTEL_SOC_DTS_IOSF_CORE=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> CONFIG_INT340X_THERMAL=3Dm
> CONFIG_ACPI_THERMAL_REL=3Dm
> # CONFIG_INT3406_THERMAL is not set
> CONFIG_PROC_THERMAL_MMIO_RAPL=3Dm
> # end of ACPI INT340X thermal drivers
> =

> CONFIG_INTEL_PCH_THERMAL=3Dm
> # end of Intel thermal drivers
> =

> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> CONFIG_WATCHDOG_SYSFS=3Dy
> =

> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dm
> CONFIG_WDAT_WDT=3Dm
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> # CONFIG_MLX_WDT is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> # CONFIG_ACQUIRE_WDT is not set
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=3Dm
> CONFIG_ALIM7101_WDT=3Dm
> # CONFIG_EBC_C384_WDT is not set
> CONFIG_F71808E_WDT=3Dm
> CONFIG_SP5100_TCO=3Dm
> CONFIG_SBC_FITPC2_WATCHDOG=3Dm
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dm
> CONFIG_IBMASR=3Dm
> # CONFIG_WAFER_WDT is not set
> CONFIG_I6300ESB_WDT=3Dy
> CONFIG_IE6XX_WDT=3Dm
> CONFIG_ITCO_WDT=3Dy
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> CONFIG_IT8712F_WDT=3Dm
> CONFIG_IT87_WDT=3Dm
> CONFIG_HP_WATCHDOG=3Dm
> CONFIG_HPWDT_NMI_DECODING=3Dy
> # CONFIG_SC1200_WDT is not set
> # CONFIG_PC87413_WDT is not set
> CONFIG_NV_TCO=3Dm
> # CONFIG_60XX_WDT is not set
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dm
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_TQMX86_WDT is not set
> CONFIG_VIA_WDT=3Dm
> CONFIG_W83627HF_WDT=3Dm
> CONFIG_W83877F_WDT=3Dm
> CONFIG_W83977F_WDT=3Dm
> CONFIG_MACHZ_WDT=3Dm
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> CONFIG_INTEL_MEI_WDT=3Dm
> # CONFIG_NI903X_WDT is not set
> # CONFIG_NIC7018_WDT is not set
> # CONFIG_MEN_A21_WDT is not set
> CONFIG_XEN_WDT=3Dm
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dm
> CONFIG_WDTPCI=3Dm
> =

> #
> # USB-based Watchdog Cards
> #
> # CONFIG_USBPCWATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dm
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_BCM590XX is not set
> # CONFIG_MFD_BD9571MWV is not set
> # CONFIG_MFD_AXP20X_I2C is not set
> # CONFIG_MFD_MADERA is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> # CONFIG_MFD_DA9063 is not set
> # CONFIG_MFD_DA9150 is not set
> # CONFIG_MFD_DLN2 is not set
> # CONFIG_MFD_MC13XXX_SPI is not set
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_MFD_MP2629 is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dm
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> # CONFIG_MFD_INTEL_PMC_BXT is not set
> # CONFIG_MFD_INTEL_PMT is not set
> # CONFIG_MFD_IQS62X is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MT6360 is not set
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> # CONFIG_EZX_PCAP is not set
> # CONFIG_MFD_VIPERBOARD is not set
> # CONFIG_MFD_RETU is not set
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_SEC_CORE is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dm
> CONFIG_MFD_SM501_GPIO=3Dy
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_ABX500_CORE is not set
> # CONFIG_MFD_SYSCON is not set
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_MFD_PALMAS is not set
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> # CONFIG_MFD_TPS65086 is not set
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_MFD_TPS65912_SPI is not set
> # CONFIG_MFD_TPS80031 is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=3Dm
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_ARIZONA_SPI is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM831X_SPI is not set
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_MFD_INTEL_M10_BMC is not set
> # end of Multifunction device drivers
> =

> # CONFIG_REGULATOR is not set
> CONFIG_RC_CORE=3Dm
> CONFIG_RC_MAP=3Dm
> CONFIG_LIRC=3Dy
> CONFIG_RC_DECODERS=3Dy
> CONFIG_IR_NEC_DECODER=3Dm
> CONFIG_IR_RC5_DECODER=3Dm
> CONFIG_IR_RC6_DECODER=3Dm
> CONFIG_IR_JVC_DECODER=3Dm
> CONFIG_IR_SONY_DECODER=3Dm
> CONFIG_IR_SANYO_DECODER=3Dm
> # CONFIG_IR_SHARP_DECODER is not set
> CONFIG_IR_MCE_KBD_DECODER=3Dm
> # CONFIG_IR_XMP_DECODER is not set
> CONFIG_IR_IMON_DECODER=3Dm
> # CONFIG_IR_RCMM_DECODER is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> CONFIG_IR_ENE=3Dm
> # CONFIG_IR_IMON is not set
> # CONFIG_IR_IMON_RAW is not set
> # CONFIG_IR_MCEUSB is not set
> CONFIG_IR_ITE_CIR=3Dm
> CONFIG_IR_FINTEK=3Dm
> CONFIG_IR_NUVOTON=3Dm
> # CONFIG_IR_REDRAT3 is not set
> # CONFIG_IR_STREAMZAP is not set
> CONFIG_IR_WINBOND_CIR=3Dm
> # CONFIG_IR_IGORPLUGUSB is not set
> # CONFIG_IR_IGUANA is not set
> # CONFIG_IR_TTUSBIR is not set
> # CONFIG_RC_LOOPBACK is not set
> CONFIG_IR_SERIAL=3Dm
> CONFIG_IR_SERIAL_TRANSMITTER=3Dy
> CONFIG_IR_SIR=3Dm
> # CONFIG_RC_XBOX_DVD is not set
> # CONFIG_IR_TOY is not set
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> # CONFIG_CEC_CH7322 is not set
> # CONFIG_CEC_SECO is not set
> # CONFIG_USB_PULSE8_CEC is not set
> # CONFIG_USB_RAINSHADOW_CEC is not set
> CONFIG_MEDIA_SUPPORT=3Dm
> # CONFIG_MEDIA_SUPPORT_FILTER is not set
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> =

> #
> # Media device types
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
> CONFIG_MEDIA_TEST_SUPPORT=3Dy
> # end of Media device types
> =

> #
> # Media core support
> #
> CONFIG_VIDEO_DEV=3Dm
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_DVB_CORE=3Dm
> # end of Media core support
> =

> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2=3Dm
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> # end of Video4Linux options
> =

> #
> # Media controller options
> #
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> # end of Media controller options
> =

> #
> # Digital TV options
> #
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> # end of Digital TV options
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_USB_SUPPORT is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_RADIO_ADAPTERS=3Dy
> # CONFIG_RADIO_SI470X is not set
> # CONFIG_RADIO_SI4713 is not set
> # CONFIG_USB_MR800 is not set
> # CONFIG_USB_DSBR is not set
> # CONFIG_RADIO_MAXIRADIO is not set
> # CONFIG_RADIO_SHARK is not set
> # CONFIG_RADIO_SHARK2 is not set
> # CONFIG_USB_KEENE is not set
> # CONFIG_USB_RAREMONO is not set
> # CONFIG_USB_MA901 is not set
> # CONFIG_RADIO_TEA5764 is not set
> # CONFIG_RADIO_SAA7706H is not set
> # CONFIG_RADIO_TEF6862 is not set
> # CONFIG_RADIO_WL1273 is not set
> CONFIG_VIDEOBUF2_CORE=3Dm
> CONFIG_VIDEOBUF2_V4L2=3Dm
> CONFIG_VIDEOBUF2_MEMOPS=3Dm
> CONFIG_VIDEOBUF2_VMALLOC=3Dm
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> # CONFIG_SDR_PLATFORM_DRIVERS is not set
> =

> #
> # MMC/SDIO DVB adapters
> #
> # CONFIG_SMS_SDIO_DRV is not set
> # CONFIG_V4L_TEST_DRIVERS is not set
> # CONFIG_DVB_TEST_DRIVERS is not set
> =

> #
> # FireWire (IEEE 1394) Adapters
> #
> # CONFIG_DVB_FIREDTV is not set
> # end of Media drivers
> =

> #
> # Media ancillary drivers
> #
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
> =

> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_TVAUDIO is not set
> # CONFIG_VIDEO_TDA7432 is not set
> # CONFIG_VIDEO_TDA9840 is not set
> # CONFIG_VIDEO_TEA6415C is not set
> # CONFIG_VIDEO_TEA6420 is not set
> # CONFIG_VIDEO_MSP3400 is not set
> # CONFIG_VIDEO_CS3308 is not set
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> # CONFIG_VIDEO_TLV320AIC23B is not set
> # CONFIG_VIDEO_UDA1342 is not set
> # CONFIG_VIDEO_WM8775 is not set
> # CONFIG_VIDEO_WM8739 is not set
> # CONFIG_VIDEO_VP27SMPX is not set
> # CONFIG_VIDEO_SONY_BTF_MPX is not set
> # end of Audio decoders, processors and mixers
> =

> #
> # RDS decoders
> #
> # CONFIG_VIDEO_SAA6588 is not set
> # end of RDS decoders
> =

> #
> # Video decoders
> #
> # CONFIG_VIDEO_ADV7180 is not set
> # CONFIG_VIDEO_ADV7183 is not set
> # CONFIG_VIDEO_ADV7604 is not set
> # CONFIG_VIDEO_ADV7842 is not set
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> # CONFIG_VIDEO_BT866 is not set
> # CONFIG_VIDEO_KS0127 is not set
> # CONFIG_VIDEO_ML86V7667 is not set
> # CONFIG_VIDEO_SAA7110 is not set
> # CONFIG_VIDEO_SAA711X is not set
> # CONFIG_VIDEO_TC358743 is not set
> # CONFIG_VIDEO_TVP514X is not set
> # CONFIG_VIDEO_TVP5150 is not set
> # CONFIG_VIDEO_TVP7002 is not set
> # CONFIG_VIDEO_TW2804 is not set
> # CONFIG_VIDEO_TW9903 is not set
> # CONFIG_VIDEO_TW9906 is not set
> # CONFIG_VIDEO_TW9910 is not set
> # CONFIG_VIDEO_VPX3220 is not set
> =

> #
> # Video and audio decoders
> #
> # CONFIG_VIDEO_SAA717X is not set
> # CONFIG_VIDEO_CX25840 is not set
> # end of Video decoders
> =

> #
> # Video encoders
> #
> # CONFIG_VIDEO_SAA7127 is not set
> # CONFIG_VIDEO_SAA7185 is not set
> # CONFIG_VIDEO_ADV7170 is not set
> # CONFIG_VIDEO_ADV7175 is not set
> # CONFIG_VIDEO_ADV7343 is not set
> # CONFIG_VIDEO_ADV7393 is not set
> # CONFIG_VIDEO_ADV7511 is not set
> # CONFIG_VIDEO_AD9389B is not set
> # CONFIG_VIDEO_AK881X is not set
> # CONFIG_VIDEO_THS8200 is not set
> # end of Video encoders
> =

> #
> # Video improvement chips
> #
> # CONFIG_VIDEO_UPD64031A is not set
> # CONFIG_VIDEO_UPD64083 is not set
> # end of Video improvement chips
> =

> #
> # Audio/Video compression chips
> #
> # CONFIG_VIDEO_SAA6752HS is not set
> # end of Audio/Video compression chips
> =

> #
> # SDR tuner chips
> #
> # CONFIG_SDR_MAX2175 is not set
> # end of SDR tuner chips
> =

> #
> # Miscellaneous helper chips
> #
> # CONFIG_VIDEO_THS7303 is not set
> # CONFIG_VIDEO_M52790 is not set
> # CONFIG_VIDEO_I2C is not set
> # CONFIG_VIDEO_ST_MIPID02 is not set
> # end of Miscellaneous helper chips
> =

> #
> # Camera sensor devices
> #
> # CONFIG_VIDEO_HI556 is not set
> # CONFIG_VIDEO_IMX214 is not set
> # CONFIG_VIDEO_IMX219 is not set
> # CONFIG_VIDEO_IMX258 is not set
> # CONFIG_VIDEO_IMX274 is not set
> # CONFIG_VIDEO_IMX290 is not set
> # CONFIG_VIDEO_IMX319 is not set
> # CONFIG_VIDEO_IMX355 is not set
> # CONFIG_VIDEO_OV02A10 is not set
> # CONFIG_VIDEO_OV2640 is not set
> # CONFIG_VIDEO_OV2659 is not set
> # CONFIG_VIDEO_OV2680 is not set
> # CONFIG_VIDEO_OV2685 is not set
> # CONFIG_VIDEO_OV2740 is not set
> # CONFIG_VIDEO_OV5647 is not set
> # CONFIG_VIDEO_OV5648 is not set
> # CONFIG_VIDEO_OV6650 is not set
> # CONFIG_VIDEO_OV5670 is not set
> # CONFIG_VIDEO_OV5675 is not set
> # CONFIG_VIDEO_OV5695 is not set
> # CONFIG_VIDEO_OV7251 is not set
> # CONFIG_VIDEO_OV772X is not set
> # CONFIG_VIDEO_OV7640 is not set
> # CONFIG_VIDEO_OV7670 is not set
> # CONFIG_VIDEO_OV7740 is not set
> # CONFIG_VIDEO_OV8856 is not set
> # CONFIG_VIDEO_OV8865 is not set
> # CONFIG_VIDEO_OV9640 is not set
> # CONFIG_VIDEO_OV9650 is not set
> # CONFIG_VIDEO_OV9734 is not set
> # CONFIG_VIDEO_OV13858 is not set
> # CONFIG_VIDEO_VS6624 is not set
> # CONFIG_VIDEO_MT9M001 is not set
> # CONFIG_VIDEO_MT9M032 is not set
> # CONFIG_VIDEO_MT9M111 is not set
> # CONFIG_VIDEO_MT9P031 is not set
> # CONFIG_VIDEO_MT9T001 is not set
> # CONFIG_VIDEO_MT9T112 is not set
> # CONFIG_VIDEO_MT9V011 is not set
> # CONFIG_VIDEO_MT9V032 is not set
> # CONFIG_VIDEO_MT9V111 is not set
> # CONFIG_VIDEO_SR030PC30 is not set
> # CONFIG_VIDEO_NOON010PC30 is not set
> # CONFIG_VIDEO_M5MOLS is not set
> # CONFIG_VIDEO_RDACM20 is not set
> # CONFIG_VIDEO_RDACM21 is not set
> # CONFIG_VIDEO_RJ54N1 is not set
> # CONFIG_VIDEO_S5K6AA is not set
> # CONFIG_VIDEO_S5K6A3 is not set
> # CONFIG_VIDEO_S5K4ECGX is not set
> # CONFIG_VIDEO_S5K5BAF is not set
> # CONFIG_VIDEO_CCS is not set
> # CONFIG_VIDEO_ET8EK8 is not set
> # CONFIG_VIDEO_S5C73M3 is not set
> # end of Camera sensor devices
> =

> #
> # Lens drivers
> #
> # CONFIG_VIDEO_AD5820 is not set
> # CONFIG_VIDEO_AK7375 is not set
> # CONFIG_VIDEO_DW9714 is not set
> # CONFIG_VIDEO_DW9768 is not set
> # CONFIG_VIDEO_DW9807_VCM is not set
> # end of Lens drivers
> =

> #
> # Flash devices
> #
> # CONFIG_VIDEO_ADP1653 is not set
> # CONFIG_VIDEO_LM3560 is not set
> # CONFIG_VIDEO_LM3646 is not set
> # end of Flash devices
> =

> #
> # SPI helper chips
> #
> # CONFIG_VIDEO_GS1662 is not set
> # end of SPI helper chips
> =

> #
> # Media SPI Adapters
> #
> CONFIG_CXD2880_SPI_DRV=3Dm
> # end of Media SPI Adapters
> =

> CONFIG_MEDIA_TUNER=3Dm
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> CONFIG_MEDIA_TUNER_TDA18250=3Dm
> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> CONFIG_MEDIA_TUNER_TEA5761=3Dm
> CONFIG_MEDIA_TUNER_TEA5767=3Dm
> CONFIG_MEDIA_TUNER_MSI001=3Dm
> CONFIG_MEDIA_TUNER_MT20XX=3Dm
> CONFIG_MEDIA_TUNER_MT2060=3Dm
> CONFIG_MEDIA_TUNER_MT2063=3Dm
> CONFIG_MEDIA_TUNER_MT2266=3Dm
> CONFIG_MEDIA_TUNER_MT2131=3Dm
> CONFIG_MEDIA_TUNER_QT1010=3Dm
> CONFIG_MEDIA_TUNER_XC2028=3Dm
> CONFIG_MEDIA_TUNER_XC5000=3Dm
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> CONFIG_MEDIA_TUNER_MC44S803=3Dm
> CONFIG_MEDIA_TUNER_MAX2165=3Dm
> CONFIG_MEDIA_TUNER_TDA18218=3Dm
> CONFIG_MEDIA_TUNER_FC0011=3Dm
> CONFIG_MEDIA_TUNER_FC0012=3Dm
> CONFIG_MEDIA_TUNER_FC0013=3Dm
> CONFIG_MEDIA_TUNER_TDA18212=3Dm
> CONFIG_MEDIA_TUNER_E4000=3Dm
> CONFIG_MEDIA_TUNER_FC2580=3Dm
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> CONFIG_MEDIA_TUNER_TUA9001=3Dm
> CONFIG_MEDIA_TUNER_SI2157=3Dm
> CONFIG_MEDIA_TUNER_IT913X=3Dm
> CONFIG_MEDIA_TUNER_R820T=3Dm
> CONFIG_MEDIA_TUNER_MXL301RF=3Dm
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> # end of Customize TV tuners
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dm
> CONFIG_DVB_STB6100=3Dm
> CONFIG_DVB_STV090x=3Dm
> CONFIG_DVB_STV0910=3Dm
> CONFIG_DVB_STV6110x=3Dm
> CONFIG_DVB_STV6111=3Dm
> CONFIG_DVB_MXL5XX=3Dm
> CONFIG_DVB_M88DS3103=3Dm
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dm
> CONFIG_DVB_TDA18271C2DD=3Dm
> CONFIG_DVB_SI2165=3Dm
> CONFIG_DVB_MN88472=3Dm
> CONFIG_DVB_MN88473=3Dm
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dm
> CONFIG_DVB_CX24123=3Dm
> CONFIG_DVB_MT312=3Dm
> CONFIG_DVB_ZL10036=3Dm
> CONFIG_DVB_ZL10039=3Dm
> CONFIG_DVB_S5H1420=3Dm
> CONFIG_DVB_STV0288=3Dm
> CONFIG_DVB_STB6000=3Dm
> CONFIG_DVB_STV0299=3Dm
> CONFIG_DVB_STV6110=3Dm
> CONFIG_DVB_STV0900=3Dm
> CONFIG_DVB_TDA8083=3Dm
> CONFIG_DVB_TDA10086=3Dm
> CONFIG_DVB_TDA8261=3Dm
> CONFIG_DVB_VES1X93=3Dm
> CONFIG_DVB_TUNER_ITD1000=3Dm
> CONFIG_DVB_TUNER_CX24113=3Dm
> CONFIG_DVB_TDA826X=3Dm
> CONFIG_DVB_TUA6100=3Dm
> CONFIG_DVB_CX24116=3Dm
> CONFIG_DVB_CX24117=3Dm
> CONFIG_DVB_CX24120=3Dm
> CONFIG_DVB_SI21XX=3Dm
> CONFIG_DVB_TS2020=3Dm
> CONFIG_DVB_DS3000=3Dm
> CONFIG_DVB_MB86A16=3Dm
> CONFIG_DVB_TDA10071=3Dm
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP8870=3Dm
> CONFIG_DVB_SP887X=3Dm
> CONFIG_DVB_CX22700=3Dm
> CONFIG_DVB_CX22702=3Dm
> CONFIG_DVB_S5H1432=3Dm
> CONFIG_DVB_DRXD=3Dm
> CONFIG_DVB_L64781=3Dm
> CONFIG_DVB_TDA1004X=3Dm
> CONFIG_DVB_NXT6000=3Dm
> CONFIG_DVB_MT352=3Dm
> CONFIG_DVB_ZL10353=3Dm
> CONFIG_DVB_DIB3000MB=3Dm
> CONFIG_DVB_DIB3000MC=3Dm
> CONFIG_DVB_DIB7000M=3Dm
> CONFIG_DVB_DIB7000P=3Dm
> CONFIG_DVB_DIB9000=3Dm
> CONFIG_DVB_TDA10048=3Dm
> CONFIG_DVB_AF9013=3Dm
> CONFIG_DVB_EC100=3Dm
> CONFIG_DVB_STV0367=3Dm
> CONFIG_DVB_CXD2820R=3Dm
> CONFIG_DVB_CXD2841ER=3Dm
> CONFIG_DVB_RTL2830=3Dm
> CONFIG_DVB_RTL2832=3Dm
> CONFIG_DVB_RTL2832_SDR=3Dm
> CONFIG_DVB_SI2168=3Dm
> CONFIG_DVB_ZD1301_DEMOD=3Dm
> CONFIG_DVB_CXD2880=3Dm
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dm
> CONFIG_DVB_TDA10021=3Dm
> CONFIG_DVB_TDA10023=3Dm
> CONFIG_DVB_STV0297=3Dm
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dm
> CONFIG_DVB_OR51211=3Dm
> CONFIG_DVB_OR51132=3Dm
> CONFIG_DVB_BCM3510=3Dm
> CONFIG_DVB_LGDT330X=3Dm
> CONFIG_DVB_LGDT3305=3Dm
> CONFIG_DVB_LGDT3306A=3Dm
> CONFIG_DVB_LG2160=3Dm
> CONFIG_DVB_S5H1409=3Dm
> CONFIG_DVB_AU8522=3Dm
> CONFIG_DVB_AU8522_DTV=3Dm
> CONFIG_DVB_AU8522_V4L=3Dm
> CONFIG_DVB_S5H1411=3Dm
> CONFIG_DVB_MXL692=3Dm
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_S921=3Dm
> CONFIG_DVB_DIB8000=3Dm
> CONFIG_DVB_MB86A20S=3Dm
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=3Dm
> CONFIG_DVB_MN88443X=3Dm
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dm
> CONFIG_DVB_TUNER_DIB0070=3Dm
> CONFIG_DVB_TUNER_DIB0090=3Dm
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dm
> CONFIG_DVB_LNBH25=3Dm
> CONFIG_DVB_LNBH29=3Dm
> CONFIG_DVB_LNBP21=3Dm
> CONFIG_DVB_LNBP22=3Dm
> CONFIG_DVB_ISL6405=3Dm
> CONFIG_DVB_ISL6421=3Dm
> CONFIG_DVB_ISL6423=3Dm
> CONFIG_DVB_A8293=3Dm
> CONFIG_DVB_LGS8GL5=3Dm
> CONFIG_DVB_LGS8GXX=3Dm
> CONFIG_DVB_ATBM8830=3Dm
> CONFIG_DVB_TDA665x=3Dm
> CONFIG_DVB_IX2505V=3Dm
> CONFIG_DVB_M88RS2000=3Dm
> CONFIG_DVB_AF9033=3Dm
> CONFIG_DVB_HORUS3A=3Dm
> CONFIG_DVB_ASCOT2E=3Dm
> CONFIG_DVB_HELENE=3Dm
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=3Dm
> CONFIG_DVB_SP2=3Dm
> # end of Customise DVB Frontends
> =

> #
> # Tools to develop new frontends
> #
> # CONFIG_DVB_DUMMY_FE is not set
> # end of Media ancillary drivers
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_INTEL_GTT=3Dm
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D64
> CONFIG_VGA_SWITCHEROO=3Dy
> CONFIG_DRM=3Dm
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> # CONFIG_DRM_DEBUG_SELFTEST is not set
> CONFIG_DRM_KMS_HELPER=3Dm
> CONFIG_DRM_KMS_FB_HELPER=3Dy
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_DRM_FBDEV_OVERALLOC=3D100
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_TTM=3Dm
> CONFIG_DRM_VRAM_HELPER=3Dm
> CONFIG_DRM_TTM_HELPER=3Dm
> CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dm
> CONFIG_DRM_I2C_SIL164=3Dm
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I915=3Dm
> CONFIG_DRM_I915_FORCE_PROBE=3D""
> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> CONFIG_DRM_I915_USERPTR=3Dy
> CONFIG_DRM_I915_GVT=3Dy
> CONFIG_DRM_I915_GVT_KVMGT=3Dm
> CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> # CONFIG_DRM_VGEM is not set
> # CONFIG_DRM_VKMS is not set
> # CONFIG_DRM_VMWGFX is not set
> CONFIG_DRM_GMA500=3Dm
> CONFIG_DRM_GMA600=3Dy
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dm
> CONFIG_DRM_MGAG200=3Dm
> CONFIG_DRM_QXL=3Dm
> CONFIG_DRM_BOCHS=3Dm
> CONFIG_DRM_VIRTIO_GPU=3Dm
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> # end of Display Interface Bridges
> =

> # CONFIG_DRM_ETNAVIV is not set
> CONFIG_DRM_CIRRUS_QEMU=3Dm
> # CONFIG_DRM_GM12U320 is not set
> # CONFIG_TINYDRM_HX8357D is not set
> # CONFIG_TINYDRM_ILI9225 is not set
> # CONFIG_TINYDRM_ILI9341 is not set
> # CONFIG_TINYDRM_ILI9486 is not set
> # CONFIG_TINYDRM_MI0283QT is not set
> # CONFIG_TINYDRM_REPAPER is not set
> # CONFIG_TINYDRM_ST7586 is not set
> # CONFIG_TINYDRM_ST7735R is not set
> # CONFIG_DRM_XEN is not set
> # CONFIG_DRM_VBOXVIDEO is not set
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dm
> CONFIG_FB_SYS_COPYAREA=3Dm
> CONFIG_FB_SYS_IMAGEBLIT=3Dm
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dm
> CONFIG_FB_DEFERRED_IO=3Dy
> # CONFIG_FB_MODE_HELPERS is not set
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_UVESA is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_EFI=3Dy
> # CONFIG_FB_N411 is not set
> # CONFIG_FB_HGA is not set
> # CONFIG_FB_OPENCORES is not set
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_XEN_FBDEV_FRONTEND is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_HYPERV=3Dm
> # CONFIG_FB_SIMPLE is not set
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dm
> # CONFIG_LCD_L4F00242T03 is not set
> # CONFIG_LCD_LMS283GF05 is not set
> # CONFIG_LCD_LTV350QV is not set
> # CONFIG_LCD_ILI922X is not set
> # CONFIG_LCD_ILI9320 is not set
> # CONFIG_LCD_TDO24M is not set
> # CONFIG_LCD_VGG2432A4 is not set
> CONFIG_LCD_PLATFORM=3Dm
> # CONFIG_LCD_AMS369FG06 is not set
> # CONFIG_LCD_LMS501KF03 is not set
> # CONFIG_LCD_HX8357 is not set
> # CONFIG_LCD_OTM3225A is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_KTD253 is not set
> # CONFIG_BACKLIGHT_PWM is not set
> CONFIG_BACKLIGHT_APPLE=3Dm
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> # CONFIG_BACKLIGHT_LM3630A is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> # end of Backlight & LCD device support
> =

> CONFIG_HDMI=3Dy
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
> # end of Console display driver support
> =

> CONFIG_LOGO=3Dy
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> CONFIG_LOGO_LINUX_CLUT224=3Dy
> # end of Graphics support
> =

> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dm
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> # CONFIG_HID_ACCUTOUCH is not set
> CONFIG_HID_ACRUX=3Dm
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_APPLEIR is not set
> CONFIG_HID_ASUS=3Dm
> CONFIG_HID_AUREAL=3Dm
> CONFIG_HID_BELKIN=3Dm
> # CONFIG_HID_BETOP_FF is not set
> # CONFIG_HID_BIGBEN_FF is not set
> CONFIG_HID_CHERRY=3Dm
> CONFIG_HID_CHICONY=3Dm
> # CONFIG_HID_CORSAIR is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> CONFIG_HID_CMEDIA=3Dm
> # CONFIG_HID_CP2112 is not set
> # CONFIG_HID_CREATIVE_SB0540 is not set
> CONFIG_HID_CYPRESS=3Dm
> CONFIG_HID_DRAGONRISE=3Dm
> # CONFIG_DRAGONRISE_FF is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELAN is not set
> CONFIG_HID_ELECOM=3Dm
> # CONFIG_HID_ELO is not set
> CONFIG_HID_EZKEY=3Dm
> CONFIG_HID_GEMBIRD=3Dm
> CONFIG_HID_GFRM=3Dm
> # CONFIG_HID_GLORIOUS is not set
> # CONFIG_HID_HOLTEK is not set
> # CONFIG_HID_VIVALDI is not set
> # CONFIG_HID_GT683R is not set
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dm
> # CONFIG_HID_UCLOGIC is not set
> CONFIG_HID_WALTOP=3Dm
> # CONFIG_HID_VIEWSONIC is not set
> CONFIG_HID_GYRATION=3Dm
> CONFIG_HID_ICADE=3Dm
> CONFIG_HID_ITE=3Dm
> CONFIG_HID_JABRA=3Dm
> CONFIG_HID_TWINHAN=3Dm
> CONFIG_HID_KENSINGTON=3Dm
> CONFIG_HID_LCPOWER=3Dm
> CONFIG_HID_LED=3Dm
> CONFIG_HID_LENOVO=3Dm
> CONFIG_HID_LOGITECH=3Dm
> CONFIG_HID_LOGITECH_DJ=3Dm
> CONFIG_HID_LOGITECH_HIDPP=3Dm
> # CONFIG_LOGITECH_FF is not set
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=3Dm
> CONFIG_HID_MONTEREY=3Dm
> CONFIG_HID_MULTITOUCH=3Dm
> CONFIG_HID_NTI=3Dm
> # CONFIG_HID_NTRIG is not set
> CONFIG_HID_ORTEK=3Dm
> CONFIG_HID_PANTHERLORD=3Dm
> # CONFIG_PANTHERLORD_FF is not set
> # CONFIG_HID_PENMOUNT is not set
> CONFIG_HID_PETALYNX=3Dm
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LCD=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PICOLCD_CIR=3Dy
> CONFIG_HID_PLANTRONICS=3Dm
> # CONFIG_HID_PLAYSTATION is not set
> CONFIG_HID_PRIMAX=3Dm
> # CONFIG_HID_RETRODE is not set
> # CONFIG_HID_ROCCAT is not set
> CONFIG_HID_SAITEK=3Dm
> CONFIG_HID_SAMSUNG=3Dm
> # CONFIG_HID_SONY is not set
> CONFIG_HID_SPEEDLINK=3Dm
> # CONFIG_HID_STEAM is not set
> CONFIG_HID_STEELSERIES=3Dm
> CONFIG_HID_SUNPLUS=3Dm
> CONFIG_HID_RMI=3Dm
> CONFIG_HID_GREENASIA=3Dm
> # CONFIG_GREENASIA_FF is not set
> CONFIG_HID_HYPERV_MOUSE=3Dm
> CONFIG_HID_SMARTJOYPLUS=3Dm
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dm
> CONFIG_HID_TOPSEED=3Dm
> CONFIG_HID_THINGM=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> # CONFIG_THRUSTMASTER_FF is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_U2FZERO is not set
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dm
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dm
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dm
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> CONFIG_HID_ALPS=3Dm
> # CONFIG_HID_MCP2221 is not set
> # end of Special HID drivers
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> # CONFIG_HID_PID is not set
> # CONFIG_USB_HIDDEV is not set
> # end of USB HID support
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID_ACPI is not set
> # end of I2C HID support
> =

> #
> # Intel ISH HID support
> #
> CONFIG_INTEL_ISH_HID=3Dm
> # CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
> # end of Intel ISH HID support
> =

> #
> # AMD SFH HID Support
> #
> # CONFIG_AMD_SFH_HID is not set
> # end of AMD SFH HID Support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_PCI=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=3Dy
> # CONFIG_USB_FEW_INIT_RETRIES is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_PRODUCTLIST is not set
> CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dy
> CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> CONFIG_USB_MON=3Dy
> =

> #
> # USB Host Controller Drivers
> #
> # CONFIG_USB_C67X00_HCD is not set
> CONFIG_USB_XHCI_HCD=3Dy
> # CONFIG_USB_XHCI_DBGCAP is not set
> CONFIG_USB_XHCI_PCI=3Dy
> # CONFIG_USB_XHCI_PCI_RENESAS is not set
> # CONFIG_USB_XHCI_PLATFORM is not set
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> CONFIG_USB_EHCI_PCI=3Dy
> # CONFIG_USB_EHCI_FSL is not set
> # CONFIG_USB_EHCI_HCD_PLATFORM is not set
> # CONFIG_USB_OXU210HP_HCD is not set
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_FOTG210_HCD is not set
> # CONFIG_USB_MAX3421_HCD is not set
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PCI=3Dy
> # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> CONFIG_USB_UHCI_HCD=3Dy
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_HCD_BCMA is not set
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> # CONFIG_USB_PRINTER is not set
> # CONFIG_USB_WDM is not set
> # CONFIG_USB_TMC is not set
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> CONFIG_USB_STORAGE=3Dm
> # CONFIG_USB_STORAGE_DEBUG is not set
> # CONFIG_USB_STORAGE_REALTEK is not set
> # CONFIG_USB_STORAGE_DATAFAB is not set
> # CONFIG_USB_STORAGE_FREECOM is not set
> # CONFIG_USB_STORAGE_ISD200 is not set
> # CONFIG_USB_STORAGE_USBAT is not set
> # CONFIG_USB_STORAGE_SDDR09 is not set
> # CONFIG_USB_STORAGE_SDDR55 is not set
> # CONFIG_USB_STORAGE_JUMPSHOT is not set
> # CONFIG_USB_STORAGE_ALAUDA is not set
> # CONFIG_USB_STORAGE_ONETOUCH is not set
> # CONFIG_USB_STORAGE_KARMA is not set
> # CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> # CONFIG_USB_STORAGE_ENE_UB6250 is not set
> # CONFIG_USB_UAS is not set
> =

> #
> # USB Imaging devices
> #
> # CONFIG_USB_MDC800 is not set
> # CONFIG_USB_MICROTEK is not set
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_CDNS_SUPPORT is not set
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> # CONFIG_USB_DWC2 is not set
> # CONFIG_USB_CHIPIDEA is not set
> # CONFIG_USB_ISP1760 is not set
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> CONFIG_USB_SERIAL=3Dm
> CONFIG_USB_SERIAL_GENERIC=3Dy
> # CONFIG_USB_SERIAL_SIMPLE is not set
> # CONFIG_USB_SERIAL_AIRCABLE is not set
> # CONFIG_USB_SERIAL_ARK3116 is not set
> # CONFIG_USB_SERIAL_BELKIN is not set
> # CONFIG_USB_SERIAL_CH341 is not set
> # CONFIG_USB_SERIAL_WHITEHEAT is not set
> # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> # CONFIG_USB_SERIAL_CP210X is not set
> # CONFIG_USB_SERIAL_CYPRESS_M8 is not set
> # CONFIG_USB_SERIAL_EMPEG is not set
> # CONFIG_USB_SERIAL_FTDI_SIO is not set
> # CONFIG_USB_SERIAL_VISOR is not set
> # CONFIG_USB_SERIAL_IPAQ is not set
> # CONFIG_USB_SERIAL_IR is not set
> # CONFIG_USB_SERIAL_EDGEPORT is not set
> # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> # CONFIG_USB_SERIAL_F81232 is not set
> # CONFIG_USB_SERIAL_F8153X is not set
> # CONFIG_USB_SERIAL_GARMIN is not set
> # CONFIG_USB_SERIAL_IPW is not set
> # CONFIG_USB_SERIAL_IUU is not set
> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> # CONFIG_USB_SERIAL_KEYSPAN is not set
> # CONFIG_USB_SERIAL_KLSI is not set
> # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> # CONFIG_USB_SERIAL_MCT_U232 is not set
> # CONFIG_USB_SERIAL_METRO is not set
> # CONFIG_USB_SERIAL_MOS7720 is not set
> # CONFIG_USB_SERIAL_MOS7840 is not set
> # CONFIG_USB_SERIAL_MXUPORT is not set
> # CONFIG_USB_SERIAL_NAVMAN is not set
> # CONFIG_USB_SERIAL_PL2303 is not set
> # CONFIG_USB_SERIAL_OTI6858 is not set
> # CONFIG_USB_SERIAL_QCAUX is not set
> # CONFIG_USB_SERIAL_QUALCOMM is not set
> # CONFIG_USB_SERIAL_SPCP8X5 is not set
> # CONFIG_USB_SERIAL_SAFE is not set
> # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> # CONFIG_USB_SERIAL_SYMBOL is not set
> # CONFIG_USB_SERIAL_TI is not set
> # CONFIG_USB_SERIAL_CYBERJACK is not set
> # CONFIG_USB_SERIAL_OPTION is not set
> # CONFIG_USB_SERIAL_OMNINET is not set
> # CONFIG_USB_SERIAL_OPTICON is not set
> # CONFIG_USB_SERIAL_XSENS_MT is not set
> # CONFIG_USB_SERIAL_WISHBONE is not set
> # CONFIG_USB_SERIAL_SSU100 is not set
> # CONFIG_USB_SERIAL_QT2 is not set
> # CONFIG_USB_SERIAL_UPD78F0730 is not set
> # CONFIG_USB_SERIAL_XR is not set
> CONFIG_USB_SERIAL_DEBUG=3Dm
> =

> #
> # USB Miscellaneous drivers
> #
> # CONFIG_USB_EMI62 is not set
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> # CONFIG_USB_LEGOTOWER is not set
> # CONFIG_USB_LCD is not set
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> # CONFIG_USB_CYTHERM is not set
> # CONFIG_USB_IDMOUSE is not set
> # CONFIG_USB_FTDI_ELAN is not set
> # CONFIG_USB_APPLEDISPLAY is not set
> # CONFIG_APPLE_MFI_FASTCHARGE is not set
> # CONFIG_USB_SISUSBVGA is not set
> # CONFIG_USB_LD is not set
> # CONFIG_USB_TRANCEVIBRATOR is not set
> # CONFIG_USB_IOWARRIOR is not set
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> # CONFIG_USB_EZUSB_FX2 is not set
> # CONFIG_USB_HUB_USB251XB is not set
> # CONFIG_USB_HSIC_USB3503 is not set
> # CONFIG_USB_HSIC_USB4604 is not set
> # CONFIG_USB_LINK_LAYER_TEST is not set
> # CONFIG_USB_CHAOSKEY is not set
> # CONFIG_USB_ATM is not set
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_ISP1301 is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=3Dy
> # CONFIG_TYPEC_TCPM is not set
> CONFIG_TYPEC_UCSI=3Dy
> # CONFIG_UCSI_CCG is not set
> CONFIG_UCSI_ACPI=3Dy
> # CONFIG_TYPEC_TPS6598X is not set
> # CONFIG_TYPEC_STUSB160X is not set
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> # CONFIG_TYPEC_DP_ALTMODE is not set
> # end of USB Type-C Alternate Mode drivers
> =

> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=3Dm
> CONFIG_MMC_BLOCK=3Dm
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_SDIO_UART=3Dm
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dm
> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dm
> CONFIG_MMC_RICOH_MMC=3Dy
> CONFIG_MMC_SDHCI_ACPI=3Dm
> CONFIG_MMC_SDHCI_PLTFM=3Dm
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> # CONFIG_MMC_WBSD is not set
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_SPI is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> # CONFIG_MMC_VUB300 is not set
> # CONFIG_MMC_USHC is not set
> # CONFIG_MMC_USDHI6ROL0 is not set
> # CONFIG_MMC_REALTEK_PCI is not set
> CONFIG_MMC_CQHCI=3Dm
> # CONFIG_MMC_HSQ is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> # CONFIG_MMC_MTK is not set
> # CONFIG_MMC_SDHCI_XENON is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_APU is not set
> CONFIG_LEDS_LM3530=3Dm
> # CONFIG_LEDS_LM3532 is not set
> # CONFIG_LEDS_LM3642 is not set
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dm
> # CONFIG_LEDS_LP3952 is not set
> # CONFIG_LEDS_LP50XX is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dm
> # CONFIG_LEDS_PCA955X is not set
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_DAC124S085 is not set
> # CONFIG_LEDS_PWM is not set
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_INTEL_SS4200=3Dm
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> # CONFIG_LEDS_LM355x is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dm
> CONFIG_LEDS_MLXCPLD=3Dm
> # CONFIG_LEDS_MLXREG is not set
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> =

> #
> # Flash and Torch LED drivers
> #
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dm
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> # CONFIG_LEDS_TRIGGER_DISK is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dm
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> # CONFIG_LEDS_TRIGGER_NETDEV is not set
> # CONFIG_LEDS_TRIGGER_PATTERN is not set
> CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> # CONFIG_LEDS_TRIGGER_TTY is not set
> =

> #
> # LED Blink
> #
> # CONFIG_LEDS_BLINK is not set
> # CONFIG_ACCESSIBILITY is not set
> CONFIG_INFINIBAND=3Dm
> CONFIG_INFINIBAND_USER_MAD=3Dm
> CONFIG_INFINIBAND_USER_ACCESS=3Dm
> CONFIG_INFINIBAND_USER_MEM=3Dy
> CONFIG_INFINIBAND_ON_DEMAND_PAGING=3Dy
> CONFIG_INFINIBAND_ADDR_TRANS=3Dy
> CONFIG_INFINIBAND_ADDR_TRANS_CONFIGFS=3Dy
> CONFIG_INFINIBAND_VIRT_DMA=3Dy
> # CONFIG_INFINIBAND_MTHCA is not set
> # CONFIG_INFINIBAND_EFA is not set
> # CONFIG_INFINIBAND_I40IW is not set
> # CONFIG_MLX4_INFINIBAND is not set
> # CONFIG_INFINIBAND_OCRDMA is not set
> # CONFIG_INFINIBAND_USNIC is not set
> # CONFIG_INFINIBAND_BNXT_RE is not set
> # CONFIG_INFINIBAND_RDMAVT is not set
> CONFIG_RDMA_RXE=3Dm
> CONFIG_RDMA_SIW=3Dm
> CONFIG_INFINIBAND_IPOIB=3Dm
> # CONFIG_INFINIBAND_IPOIB_CM is not set
> CONFIG_INFINIBAND_IPOIB_DEBUG=3Dy
> # CONFIG_INFINIBAND_IPOIB_DEBUG_DATA is not set
> CONFIG_INFINIBAND_SRP=3Dm
> CONFIG_INFINIBAND_SRPT=3Dm
> # CONFIG_INFINIBAND_ISER is not set
> # CONFIG_INFINIBAND_ISERT is not set
> # CONFIG_INFINIBAND_RTRS_CLIENT is not set
> # CONFIG_INFINIBAND_RTRS_SERVER is not set
> # CONFIG_INFINIBAND_OPA_VNIC is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_DECODE_MCE=3Dm
> CONFIG_EDAC_GHES=3Dy
> CONFIG_EDAC_AMD64=3Dm
> CONFIG_EDAC_E752X=3Dm
> CONFIG_EDAC_I82975X=3Dm
> CONFIG_EDAC_I3000=3Dm
> CONFIG_EDAC_I3200=3Dm
> CONFIG_EDAC_IE31200=3Dm
> CONFIG_EDAC_X38=3Dm
> CONFIG_EDAC_I5400=3Dm
> CONFIG_EDAC_I7CORE=3Dm
> CONFIG_EDAC_I5000=3Dm
> CONFIG_EDAC_I5100=3Dm
> CONFIG_EDAC_I7300=3Dm
> CONFIG_EDAC_SBRIDGE=3Dm
> CONFIG_EDAC_SKX=3Dm
> # CONFIG_EDAC_I10NM is not set
> CONFIG_EDAC_PND2=3Dm
> # CONFIG_EDAC_IGEN6 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_NVMEM=3Dy
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> # CONFIG_RTC_DRV_ABX80X is not set
> CONFIG_RTC_DRV_DS1307=3Dm
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> CONFIG_RTC_DRV_DS1374=3Dm
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=3Dm
> CONFIG_RTC_DRV_MAX6900=3Dm
> CONFIG_RTC_DRV_RS5C372=3Dm
> CONFIG_RTC_DRV_ISL1208=3Dm
> CONFIG_RTC_DRV_ISL12022=3Dm
> CONFIG_RTC_DRV_X1205=3Dm
> CONFIG_RTC_DRV_PCF8523=3Dm
> # CONFIG_RTC_DRV_PCF85063 is not set
> # CONFIG_RTC_DRV_PCF85363 is not set
> CONFIG_RTC_DRV_PCF8563=3Dm
> CONFIG_RTC_DRV_PCF8583=3Dm
> CONFIG_RTC_DRV_M41T80=3Dm
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> CONFIG_RTC_DRV_BQ32K=3Dm
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=3Dm
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dm
> CONFIG_RTC_DRV_RX8025=3Dm
> CONFIG_RTC_DRV_EM3027=3Dm
> # CONFIG_RTC_DRV_RV3028 is not set
> # CONFIG_RTC_DRV_RV3032 is not set
> # CONFIG_RTC_DRV_RV8803 is not set
> # CONFIG_RTC_DRV_SD3078 is not set
> =

> #
> # SPI RTC drivers
> #
> # CONFIG_RTC_DRV_M41T93 is not set
> # CONFIG_RTC_DRV_M41T94 is not set
> # CONFIG_RTC_DRV_DS1302 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> # CONFIG_RTC_DRV_DS1343 is not set
> # CONFIG_RTC_DRV_DS1347 is not set
> # CONFIG_RTC_DRV_DS1390 is not set
> # CONFIG_RTC_DRV_MAX6916 is not set
> # CONFIG_RTC_DRV_R9701 is not set
> CONFIG_RTC_DRV_RX4581=3Dm
> # CONFIG_RTC_DRV_RS5C348 is not set
> # CONFIG_RTC_DRV_MAX6902 is not set
> # CONFIG_RTC_DRV_PCF2123 is not set
> # CONFIG_RTC_DRV_MCP795 is not set
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dm
> CONFIG_RTC_DRV_DS3232_HWMON=3Dy
> # CONFIG_RTC_DRV_PCF2127 is not set
> CONFIG_RTC_DRV_RV3029C2=3Dm
> # CONFIG_RTC_DRV_RV3029_HWMON is not set
> # CONFIG_RTC_DRV_RX6110 is not set
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dm
> CONFIG_RTC_DRV_DS1511=3Dm
> CONFIG_RTC_DRV_DS1553=3Dm
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=3Dm
> CONFIG_RTC_DRV_DS2404=3Dm
> CONFIG_RTC_DRV_STK17TA8=3Dm
> # CONFIG_RTC_DRV_M48T86 is not set
> CONFIG_RTC_DRV_M48T35=3Dm
> CONFIG_RTC_DRV_M48T59=3Dm
> CONFIG_RTC_DRV_MSM6242=3Dm
> CONFIG_RTC_DRV_BQ4802=3Dm
> CONFIG_RTC_DRV_RP5C01=3Dm
> CONFIG_RTC_DRV_V3020=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_FTRTC010 is not set
> =

> #
> # HID Sensor RTC drivers
> #
> CONFIG_DMADEVICES=3Dy
> # CONFIG_DMADEVICES_DEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> # CONFIG_ALTERA_MSGDMA is not set
> CONFIG_INTEL_IDMA64=3Dm
> # CONFIG_INTEL_IDXD is not set
> CONFIG_INTEL_IOATDMA=3Dm
> # CONFIG_PLX_DMA is not set
> # CONFIG_XILINX_ZYNQMP_DPDMA is not set
> # CONFIG_QCOM_HIDMA_MGMT is not set
> # CONFIG_QCOM_HIDMA is not set
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dm
> CONFIG_DW_DMAC_PCI=3Dy
> # CONFIG_DW_EDMA is not set
> # CONFIG_DW_EDMA_PCIE is not set
> CONFIG_HSU_DMA=3Dy
> # CONFIG_SF_PDMA is not set
> # CONFIG_INTEL_LDMA is not set
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> CONFIG_DMATEST=3Dm
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_SW_SYNC is not set
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # end of DMABUF options
> =

> CONFIG_DCA=3Dm
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_PANEL is not set
> CONFIG_UIO=3Dm
> CONFIG_UIO_CIF=3Dm
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> # CONFIG_UIO_DMEM_GENIRQ is not set
> CONFIG_UIO_AEC=3Dm
> CONFIG_UIO_SERCOS3=3Dm
> CONFIG_UIO_PCI_GENERIC=3Dm
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> CONFIG_UIO_HV_GENERIC=3Dm
> CONFIG_VFIO_IOMMU_TYPE1=3Dm
> CONFIG_VFIO_VIRQFD=3Dm
> CONFIG_VFIO=3Dm
> CONFIG_VFIO_NOIOMMU=3Dy
> CONFIG_VFIO_PCI=3Dm
> # CONFIG_VFIO_PCI_VGA is not set
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> # CONFIG_VFIO_PCI_IGD is not set
> CONFIG_VFIO_MDEV=3Dm
> CONFIG_VFIO_MDEV_DEVICE=3Dm
> CONFIG_IRQ_BYPASS_MANAGER=3Dm
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_PCI_LIB=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> # CONFIG_VIRTIO_PMEM is not set
> CONFIG_VIRTIO_BALLOON=3Dm
> CONFIG_VIRTIO_MEM=3Dm
> CONFIG_VIRTIO_INPUT=3Dm
> # CONFIG_VIRTIO_MMIO is not set
> CONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dm
> # CONFIG_VDPA is not set
> CONFIG_VHOST_IOTLB=3Dm
> CONFIG_VHOST=3Dm
> CONFIG_VHOST_MENU=3Dy
> CONFIG_VHOST_NET=3Dm
> # CONFIG_VHOST_SCSI is not set
> CONFIG_VHOST_VSOCK=3Dm
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_HYPERV=3Dm
> CONFIG_HYPERV_TIMER=3Dy
> CONFIG_HYPERV_UTILS=3Dm
> CONFIG_HYPERV_BALLOON=3Dm
> # end of Microsoft Hyper-V guest support
> =

> #
> # Xen driver support
> #
> # CONFIG_XEN_BALLOON is not set
> CONFIG_XEN_DEV_EVTCHN=3Dm
> # CONFIG_XEN_BACKEND is not set
> CONFIG_XENFS=3Dm
> CONFIG_XEN_COMPAT_XENFS=3Dy
> CONFIG_XEN_SYS_HYPERVISOR=3Dy
> CONFIG_XEN_XENBUS_FRONTEND=3Dy
> # CONFIG_XEN_GNTDEV is not set
> # CONFIG_XEN_GRANT_DEV_ALLOC is not set
> # CONFIG_XEN_GRANT_DMA_ALLOC is not set
> CONFIG_SWIOTLB_XEN=3Dy
> # CONFIG_XEN_PVCALLS_FRONTEND is not set
> CONFIG_XEN_PRIVCMD=3Dm
> CONFIG_XEN_EFI=3Dy
> CONFIG_XEN_AUTO_XLATE=3Dy
> CONFIG_XEN_ACPI=3Dy
> # CONFIG_XEN_UNPOPULATED_ALLOC is not set
> # end of Xen driver support
> =

> # CONFIG_GREYBUS is not set
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACPI_WMI=3Dm
> CONFIG_WMI_BMOF=3Dm
> # CONFIG_HUAWEI_WMI is not set
> # CONFIG_UV_SYSFS is not set
> # CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
> CONFIG_INTEL_WMI_THUNDERBOLT=3Dm
> CONFIG_MXM_WMI=3Dm
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_XIAOMI_WMI is not set
> CONFIG_ACERHDF=3Dm
> # CONFIG_ACER_WIRELESS is not set
> CONFIG_ACER_WMI=3Dm
> # CONFIG_AMD_PMC is not set
> CONFIG_APPLE_GMUX=3Dm
> CONFIG_ASUS_LAPTOP=3Dm
> # CONFIG_ASUS_WIRELESS is not set
> CONFIG_ASUS_WMI=3Dm
> CONFIG_ASUS_NB_WMI=3Dm
> CONFIG_EEEPC_LAPTOP=3Dm
> CONFIG_EEEPC_WMI=3Dm
> # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
> CONFIG_AMILO_RFKILL=3Dm
> CONFIG_FUJITSU_LAPTOP=3Dm
> CONFIG_FUJITSU_TABLET=3Dm
> # CONFIG_GPD_POCKET_FAN is not set
> CONFIG_HP_ACCEL=3Dm
> CONFIG_HP_WIRELESS=3Dm
> CONFIG_HP_WMI=3Dm
> # CONFIG_IBM_RTL is not set
> CONFIG_IDEAPAD_LAPTOP=3Dm
> CONFIG_SENSORS_HDAPS=3Dm
> CONFIG_THINKPAD_ACPI=3Dm
> # CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
> # CONFIG_THINKPAD_ACPI_DEBUG is not set
> # CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
> CONFIG_THINKPAD_ACPI_VIDEO=3Dy
> CONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy
> # CONFIG_INTEL_ATOMISP2_PM is not set
> CONFIG_INTEL_HID_EVENT=3Dm
> # CONFIG_INTEL_INT0002_VGPIO is not set
> # CONFIG_INTEL_MENLOW is not set
> CONFIG_INTEL_OAKTRAIL=3Dm
> CONFIG_INTEL_VBTN=3Dm
> CONFIG_MSI_LAPTOP=3Dm
> CONFIG_MSI_WMI=3Dm
> # CONFIG_PCENGINES_APU2 is not set
> CONFIG_SAMSUNG_LAPTOP=3Dm
> CONFIG_SAMSUNG_Q10=3Dm
> CONFIG_TOSHIBA_BT_RFKILL=3Dm
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> CONFIG_ACPI_CMPC=3Dm
> CONFIG_COMPAL_LAPTOP=3Dm
> # CONFIG_LG_LAPTOP is not set
> CONFIG_PANASONIC_LAPTOP=3Dm
> CONFIG_SONY_LAPTOP=3Dm
> CONFIG_SONYPI_COMPAT=3Dy
> # CONFIG_SYSTEM76_ACPI is not set
> CONFIG_TOPSTAR_LAPTOP=3Dm
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> CONFIG_MLX_PLATFORM=3Dm
> CONFIG_INTEL_IPS=3Dm
> CONFIG_INTEL_RST=3Dm
> # CONFIG_INTEL_SMARTCONNECT is not set
> =

> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> =

> CONFIG_INTEL_TURBO_MAX_3=3Dy
> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> CONFIG_INTEL_PMC_CORE=3Dm
> # CONFIG_INTEL_PUNIT_IPC is not set
> # CONFIG_INTEL_SCU_PCI is not set
> # CONFIG_INTEL_SCU_PLATFORM is not set
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_CHROME_PLATFORMS is not set
> CONFIG_MELLANOX_PLATFORM=3Dy
> CONFIG_MLXREG_HOTPLUG=3Dm
> # CONFIG_MLXREG_IO is not set
> CONFIG_SURFACE_PLATFORMS=3Dy
> # CONFIG_SURFACE3_WMI is not set
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_GPE is not set
> # CONFIG_SURFACE_HOTPLUG is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_CLKDEV_LOOKUP=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> # CONFIG_COMMON_CLK_MAX9485 is not set
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_XILINX_VCU is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> CONFIG_PCC=3Dy
> # CONFIG_ALTERA_MBOX is not set
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_IOASID=3Dy
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> CONFIG_IOMMU_IO_PGTABLE=3Dy
> # end of Generic IOMMU Pagetable Support
> =

> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> CONFIG_IOMMU_DMA=3Dy
> CONFIG_AMD_IOMMU=3Dy
> CONFIG_AMD_IOMMU_V2=3Dm
> CONFIG_DMAR_TABLE=3Dy
> CONFIG_INTEL_IOMMU=3Dy
> # CONFIG_INTEL_IOMMU_SVM is not set
> # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
> CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
> # CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON is not set
> CONFIG_IRQ_REMAP=3Dy
> CONFIG_HYPERV_IOMMU=3Dy
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
> =

> # CONFIG_SOUNDWIRE is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Enable LiteX SoC Builder specific drivers
> #
> # end of Enable LiteX SoC Builder specific drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> # CONFIG_PM_DEVFREQ is not set
> # CONFIG_EXTCON is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dm
> # CONFIG_NTB_MSI is not set
> # CONFIG_NTB_AMD is not set
> # CONFIG_NTB_IDT is not set
> # CONFIG_NTB_INTEL is not set
> # CONFIG_NTB_EPF is not set
> # CONFIG_NTB_SWITCHTEC is not set
> # CONFIG_NTB_PINGPONG is not set
> # CONFIG_NTB_TOOL is not set
> # CONFIG_NTB_PERF is not set
> # CONFIG_NTB_TRANSPORT is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_DEBUG is not set
> # CONFIG_PWM_DWC is not set
> CONFIG_PWM_LPSS=3Dm
> CONFIG_PWM_LPSS_PCI=3Dm
> CONFIG_PWM_LPSS_PLATFORM=3Dm
> # CONFIG_PWM_PCA9685 is not set
> =

> #
> # IRQ chip support
> #
> # end of IRQ chip support
> =

> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> =

> #
> # PHY Subsystem
> #
> # CONFIG_GENERIC_PHY is not set
> # CONFIG_USB_LGM_PHY is not set
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_INTEL_LGM_EMMC is not set
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL_CORE=3Dm
> CONFIG_INTEL_RAPL=3Dm
> # CONFIG_IDLE_INJECT is not set
> # CONFIG_DTPM is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> # CONFIG_RAS_CEC is not set
> # CONFIG_USB4 is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # end of Android
> =

> CONFIG_LIBNVDIMM=3Dm
> CONFIG_BLK_DEV_PMEM=3Dm
> CONFIG_ND_BLK=3Dm
> CONFIG_ND_CLAIM=3Dy
> CONFIG_ND_BTT=3Dm
> CONFIG_BTT=3Dy
> CONFIG_ND_PFN=3Dm
> CONFIG_NVDIMM_PFN=3Dy
> CONFIG_NVDIMM_DAX=3Dy
> CONFIG_NVDIMM_KEYS=3Dy
> CONFIG_DAX_DRIVER=3Dy
> CONFIG_DAX=3Dy
> CONFIG_DEV_DAX=3Dm
> CONFIG_DEV_DAX_PMEM=3Dm
> CONFIG_DEV_DAX_KMEM=3Dm
> CONFIG_DEV_DAX_PMEM_COMPAT=3Dm
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> # CONFIG_NVMEM_RMEM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dm
> # CONFIG_STM_PROTO_BASIC is not set
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=3Dm
> CONFIG_STM_SOURCE_CONSOLE=3Dm
> CONFIG_STM_SOURCE_HEARTBEAT=3Dm
> CONFIG_STM_SOURCE_FTRACE=3Dm
> CONFIG_INTEL_TH=3Dm
> CONFIG_INTEL_TH_PCI=3Dm
> CONFIG_INTEL_TH_ACPI=3Dm
> CONFIG_INTEL_TH_GTH=3Dm
> CONFIG_INTEL_TH_STH=3Dm
> CONFIG_INTEL_TH_MSU=3Dm
> CONFIG_INTEL_TH_PTI=3Dm
> # CONFIG_INTEL_TH_DEBUG is not set
> # end of HW tracing support
> =

> # CONFIG_FPGA is not set
> # CONFIG_TEE is not set
> # CONFIG_UNISYS_VISORBUS is not set
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> # CONFIG_INTERCONNECT is not set
> # CONFIG_COUNTER is not set
> # CONFIG_MOST is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_IOMAP=3Dy
> CONFIG_EXT2_FS=3Dm
> CONFIG_EXT2_FS_XATTR=3Dy
> CONFIG_EXT2_FS_POSIX_ACL=3Dy
> CONFIG_EXT2_FS_SECURITY=3Dy
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_EXT4_KUNIT_TESTS=3Dm
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dm
> CONFIG_XFS_SUPPORT_V4=3Dy
> CONFIG_XFS_QUOTA=3Dy
> CONFIG_XFS_POSIX_ACL=3Dy
> CONFIG_XFS_RT=3Dy
> CONFIG_XFS_ONLINE_SCRUB=3Dy
> CONFIG_XFS_ONLINE_REPAIR=3Dy
> CONFIG_XFS_DEBUG=3Dy
> CONFIG_XFS_ASSERT_FATAL=3Dy
> CONFIG_GFS2_FS=3Dm
> CONFIG_GFS2_FS_LOCKING_DLM=3Dy
> CONFIG_OCFS2_FS=3Dm
> CONFIG_OCFS2_FS_O2CB=3Dm
> CONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dm
> CONFIG_OCFS2_FS_STATS=3Dy
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> # CONFIG_OCFS2_DEBUG_FS is not set
> CONFIG_BTRFS_FS=3Dm
> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_BTRFS_FS_REF_VERIFY is not set
> # CONFIG_NILFS2_FS is not set
> CONFIG_F2FS_FS=3Dm
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> CONFIG_F2FS_FS_POSIX_ACL=3Dy
> CONFIG_F2FS_FS_SECURITY=3Dy
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_F2FS_FAULT_INJECTION is not set
> # CONFIG_F2FS_FS_COMPRESSION is not set
> # CONFIG_ZONEFS_FS is not set
> CONFIG_FS_DAX=3Dy
> CONFIG_FS_DAX_PMD=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_MANDATORY_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FS_ENCRYPTION_ALGS=3Dy
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> # CONFIG_VIRTIO_FS is not set
> CONFIG_OVERLAY_FS=3Dm
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
> =

> #
> # Caches
> #
> CONFIG_FSCACHE=3Dm
> CONFIG_FSCACHE_STATS=3Dy
> # CONFIG_FSCACHE_HISTOGRAM is not set
> # CONFIG_FSCACHE_DEBUG is not set
> # CONFIG_FSCACHE_OBJECT_LIST is not set
> CONFIG_CACHEFILES=3Dm
> # CONFIG_CACHEFILES_DEBUG is not set
> # CONFIG_CACHEFILES_HISTOGRAM is not set
> # end of Caches
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dm
> CONFIG_JOLIET=3Dy
> CONFIG_ZISOFS=3Dy
> CONFIG_UDF_FS=3Dm
> # end of CD-ROM/DVD Filesystems
> =

> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dm
> CONFIG_MSDOS_FS=3Dm
> CONFIG_VFAT_FS=3Dm
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> # CONFIG_EXFAT_FS is not set
> # CONFIG_NTFS_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> CONFIG_PROC_VMCORE=3Dy
> CONFIG_PROC_VMCORE_DEVICE_DUMP=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_PROC_CPU_RESCTRL=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> # CONFIG_TMPFS_INODE64 is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> # CONFIG_ECRYPT_FS is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> CONFIG_CRAMFS=3Dm
> CONFIG_CRAMFS_BLOCKDEV=3Dy
> CONFIG_SQUASHFS=3Dm
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> CONFIG_SQUASHFS_XATTR=3Dy
> CONFIG_SQUASHFS_ZLIB=3Dy
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> CONFIG_SQUASHFS_XZ=3Dy
> # CONFIG_SQUASHFS_ZSTD is not set
> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> # CONFIG_VXFS_FS is not set
> CONFIG_MINIX_FS=3Dm
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_QNX6FS_FS is not set
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> # CONFIG_PSTORE_842_COMPRESS is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> # CONFIG_PSTORE_FTRACE is not set
> CONFIG_PSTORE_RAM=3Dm
> # CONFIG_PSTORE_BLK is not set
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> # CONFIG_EROFS_FS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> # CONFIG_NFS_V2 is not set
> CONFIG_NFS_V3=3Dy
> CONFIG_NFS_V3_ACL=3Dy
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> CONFIG_NFS_V4_1=3Dy
> CONFIG_NFS_V4_2=3Dy
> CONFIG_PNFS_FILE_LAYOUT=3Dm
> CONFIG_PNFS_BLOCK=3Dm
> CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
> # CONFIG_NFS_V4_1_MIGRATION is not set
> CONFIG_NFS_V4_SECURITY_LABEL=3Dy
> CONFIG_ROOT_NFS=3Dy
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> CONFIG_NFS_DEBUG=3Dy
> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> # CONFIG_NFS_V4_2_READ_PLUS is not set
> CONFIG_NFSD=3Dm
> CONFIG_NFSD_V2_ACL=3Dy
> CONFIG_NFSD_V3=3Dy
> CONFIG_NFSD_V3_ACL=3Dy
> CONFIG_NFSD_V4=3Dy
> CONFIG_NFSD_PNFS=3Dy
> # CONFIG_NFSD_BLOCKLAYOUT is not set
> CONFIG_NFSD_SCSILAYOUT=3Dy
> # CONFIG_NFSD_FLEXFILELAYOUT is not set
> # CONFIG_NFSD_V4_2_INTER_SSC is not set
> CONFIG_NFSD_V4_SECURITY_LABEL=3Dy
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_ACL_SUPPORT=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_NFS_V4_2_SSC_HELPER=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dm
> CONFIG_SUNRPC_BACKCHANNEL=3Dy
> CONFIG_RPCSEC_GSS_KRB5=3Dm
> # CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
> CONFIG_SUNRPC_DEBUG=3Dy
> CONFIG_SUNRPC_XPRT_RDMA=3Dm
> CONFIG_CEPH_FS=3Dm
> # CONFIG_CEPH_FSCACHE is not set
> CONFIG_CEPH_FS_POSIX_ACL=3Dy
> # CONFIG_CEPH_FS_SECURITY_LABEL is not set
> CONFIG_CIFS=3Dm
> # CONFIG_CIFS_STATS2 is not set
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> CONFIG_CIFS_WEAK_PW_HASH=3Dy
> CONFIG_CIFS_UPCALL=3Dy
> CONFIG_CIFS_XATTR=3Dy
> CONFIG_CIFS_POSIX=3Dy
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> CONFIG_CIFS_DFS_UPCALL=3Dy
> # CONFIG_CIFS_SWN_UPCALL is not set
> # CONFIG_CIFS_SMB_DIRECT is not set
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"utf8"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dm
> CONFIG_NLS_CODEPAGE_775=3Dm
> CONFIG_NLS_CODEPAGE_850=3Dm
> CONFIG_NLS_CODEPAGE_852=3Dm
> CONFIG_NLS_CODEPAGE_855=3Dm
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dm
> CONFIG_NLS_CODEPAGE_861=3Dm
> CONFIG_NLS_CODEPAGE_862=3Dm
> CONFIG_NLS_CODEPAGE_863=3Dm
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> CONFIG_NLS_CODEPAGE_866=3Dm
> CONFIG_NLS_CODEPAGE_869=3Dm
> CONFIG_NLS_CODEPAGE_936=3Dm
> CONFIG_NLS_CODEPAGE_950=3Dm
> CONFIG_NLS_CODEPAGE_932=3Dm
> CONFIG_NLS_CODEPAGE_949=3Dm
> CONFIG_NLS_CODEPAGE_874=3Dm
> CONFIG_NLS_ISO8859_8=3Dm
> CONFIG_NLS_CODEPAGE_1250=3Dm
> CONFIG_NLS_CODEPAGE_1251=3Dm
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dm
> CONFIG_NLS_ISO8859_2=3Dm
> CONFIG_NLS_ISO8859_3=3Dm
> CONFIG_NLS_ISO8859_4=3Dm
> CONFIG_NLS_ISO8859_5=3Dm
> CONFIG_NLS_ISO8859_6=3Dm
> CONFIG_NLS_ISO8859_7=3Dm
> CONFIG_NLS_ISO8859_9=3Dm
> CONFIG_NLS_ISO8859_13=3Dm
> CONFIG_NLS_ISO8859_14=3Dm
> CONFIG_NLS_ISO8859_15=3Dm
> CONFIG_NLS_KOI8_R=3Dm
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dm
> CONFIG_NLS_MAC_CROATIAN=3Dm
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> CONFIG_NLS_MAC_ICELAND=3Dm
> CONFIG_NLS_MAC_INUIT=3Dm
> CONFIG_NLS_MAC_ROMANIAN=3Dm
> CONFIG_NLS_MAC_TURKISH=3Dm
> CONFIG_NLS_UTF8=3Dm
> CONFIG_DLM=3Dm
> CONFIG_DLM_DEBUG=3Dy
> # CONFIG_UNICODE is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITY_WRITABLE_HOOKS=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> CONFIG_PAGE_TABLE_ISOLATION=3Dy
> # CONFIG_SECURITY_INFINIBAND is not set
> CONFIG_SECURITY_NETWORK_XFRM=3Dy
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_INTEL_TXT=3Dy
> CONFIG_LSM_MMAP_MIN_ADDR=3D65535
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_HARDENED_USERCOPY_FALLBACK=3Dy
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_SECURITY_SELINUX=3Dy
> CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
> CONFIG_SECURITY_SELINUX_DISABLE=3Dy
> CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
> CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
> CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
> CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D9
> CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_HASH=3Dy
> CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
> # CONFIG_SECURITY_APPARMOR_DEBUG is not set
> # CONFIG_SECURITY_APPARMOR_KUNIT_TEST is not set
> # CONFIG_SECURITY_LOADPIN is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
> # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
> CONFIG_INTEGRITY_AUDIT=3Dy
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> CONFIG_IMA_LSM_RULES=3Dy
> # CONFIG_IMA_TEMPLATE is not set
> CONFIG_IMA_NG_TEMPLATE=3Dy
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> # CONFIG_IMA_WRITE_POLICY is not set
> # CONFIG_IMA_READ_POLICY is not set
> CONFIG_IMA_APPRAISE=3Dy
> # CONFIG_IMA_ARCH_POLICY is not set
> # CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
> CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
> # CONFIG_IMA_APPRAISE_MODSIG is not set
> CONFIG_IMA_TRUSTED_KEYRING=3Dy
> # CONFIG_IMA_BLACKLIST_KEYRING is not set
> # CONFIG_IMA_LOAD_X509 is not set
> CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
> CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=3Dy
> # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> CONFIG_EVM=3Dy
> CONFIG_EVM_ATTR_FSUUID=3Dy
> # CONFIG_EVM_ADD_XATTRS is not set
> # CONFIG_EVM_LOAD_X509 is not set
> CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
> # CONFIG_DEFAULT_SECURITY_APPARMOR is not set
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_LSM=3D"lockdown,yama,loadpin,safesetid,integrity,selinux,smack,tom=
oyo,apparmor,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dm
> CONFIG_ASYNC_CORE=3Dm
> CONFIG_ASYNC_MEMCPY=3Dm
> CONFIG_ASYNC_XOR=3Dm
> CONFIG_ASYNC_PQ=3Dm
> CONFIG_ASYNC_RAID6_RECOV=3Dm
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dm
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dm
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dm
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dm
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_SIMD=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dm
> CONFIG_CRYPTO_ECC=3Dm
> CONFIG_CRYPTO_ECDH=3Dm
> # CONFIG_CRYPTO_ECRDSA is not set
> # CONFIG_CRYPTO_SM2 is not set
> # CONFIG_CRYPTO_CURVE25519 is not set
> # CONFIG_CRYPTO_CURVE25519_X86 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dm
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dy
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dm
> # CONFIG_CRYPTO_OFB is not set
> CONFIG_CRYPTO_PCBC=3Dm
> CONFIG_CRYPTO_XTS=3Dy
> # CONFIG_CRYPTO_KEYWRAP is not set
> # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> # CONFIG_CRYPTO_ADIANTUM is not set
> CONFIG_CRYPTO_ESSIV=3Dm
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dm
> CONFIG_CRYPTO_VMAC=3Dm
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> CONFIG_CRYPTO_CRC32=3Dm
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> CONFIG_CRYPTO_XXHASH=3Dm
> CONFIG_CRYPTO_BLAKE2B=3Dm
> # CONFIG_CRYPTO_BLAKE2S is not set
> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dm
> CONFIG_CRYPTO_POLY1305_X86_64=3Dm
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> CONFIG_CRYPTO_RMD160=3Dm
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> CONFIG_CRYPTO_SHA512_SSSE3=3Dm
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dm
> # CONFIG_CRYPTO_SM3 is not set
> # CONFIG_CRYPTO_STREEBOG is not set
> CONFIG_CRYPTO_WP512=3Dm
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> # CONFIG_CRYPTO_AES_TI is not set
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dm
> CONFIG_CRYPTO_ARC4=3Dm
> CONFIG_CRYPTO_BLOWFISH=3Dm
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA=3Dm
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
> CONFIG_CRYPTO_CAST_COMMON=3Dm
> CONFIG_CRYPTO_CAST5=3Dm
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAST6=3Dm
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
> CONFIG_CRYPTO_DES=3Dm
> CONFIG_CRYPTO_DES3_EDE_X86_64=3Dm
> CONFIG_CRYPTO_FCRYPT=3Dm
> CONFIG_CRYPTO_KHAZAD=3Dm
> CONFIG_CRYPTO_CHACHA20=3Dm
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dm
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dm
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
> # CONFIG_CRYPTO_SM4 is not set
> CONFIG_CRYPTO_TEA=3Dm
> CONFIG_CRYPTO_TWOFISH=3Dm
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_842 is not set
> # CONFIG_CRYPTO_LZ4 is not set
> # CONFIG_CRYPTO_LZ4HC is not set
> # CONFIG_CRYPTO_ZSTD is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
> # CONFIG_CRYPTO_STATS is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_LIB_ARC4=3Dm
> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_CHACHA is not set
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=3Dm
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dm
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dm
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dm
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> CONFIG_CRYPTO_DEV_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_DD=3Dm
> CONFIG_CRYPTO_DEV_SP_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_CRYPTO=3Dm
> CONFIG_CRYPTO_DEV_SP_PSP=3Dy
> # CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
> CONFIG_CRYPTO_DEV_QAT=3Dm
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
> CONFIG_CRYPTO_DEV_QAT_C62X=3Dm
> # CONFIG_CRYPTO_DEV_QAT_4XXX is not set
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm
> CONFIG_CRYPTO_DEV_NITROX=3Dm
> CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dm
> # CONFIG_CRYPTO_DEV_VIRTIO is not set
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> =

> #
> # Certificates for signature checking
> #
> CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dm
> CONFIG_RAID6_PQ_BENCHMARK=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_CORDIC=3Dm
> # CONFIG_PRIME_NUMBERS is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dm
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC64 is not set
> # CONFIG_CRC4 is not set
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dm
> CONFIG_CRC8=3Dm
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dm
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_TEXTSEARCH=3Dy
> CONFIG_TEXTSEARCH_KMP=3Dm
> CONFIG_TEXTSEARCH_BM=3Dm
> CONFIG_TEXTSEARCH_FSM=3Dm
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_XARRAY_MULTI=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DMA_OPS=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED=3Dy
> CONFIG_SWIOTLB=3Dy
> CONFIG_DMA_COHERENT_POOL=3Dy
> CONFIG_DMA_CMA=3Dy
> # CONFIG_DMA_PERNUMA_CMA is not set
> =

> #
> # Default contiguous memory area size:
> #
> CONFIG_CMA_SIZE_MBYTES=3D200
> CONFIG_CMA_SIZE_SEL_MBYTES=3Dy
> # CONFIG_CMA_SIZE_SEL_PERCENTAGE is not set
> # CONFIG_CMA_SIZE_SEL_MIN is not set
> # CONFIG_CMA_SIZE_SEL_MAX is not set
> CONFIG_CMA_ALIGNMENT=3D8
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> CONFIG_DIMLIB=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_MEMREGION=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_COPY_MC=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_SBITMAP=3Dy
> # CONFIG_STRING_SELFTEST is not set
> # end of Library routines
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> # CONFIG_PRINTK_CALLER is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_DYNAMIC_DEBUG_CORE=3Dy
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> CONFIG_DEBUG_INFO_DWARF4=3Dy
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN is not set
> CONFIG_HAVE_ARCH_KCSAN=3Dy
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_OWNER is not set
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_PAGE_REF is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> # CONFIG_KASAN is not set
> CONFIG_HAVE_ARCH_KFENCE=3Dy
> # CONFIG_KFENCE is not set
> # end of Memory Debugging
> =

> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> # CONFIG_DETECT_HUNG_TASK is not set
> # CONFIG_WQ_WATCHDOG is not set
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> # CONFIG_DEBUG_TIMEKEEPING is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_RWSEMS is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> CONFIG_LOCK_TORTURE_TEST=3Dm
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PLIST is not set
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> # end of Debug kernel data structures
> =

> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> CONFIG_TORTURE_TEST=3Dm
> CONFIG_RCU_SCALE_TEST=3Dm
> CONFIG_RCU_TORTURE_TEST=3Dm
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_DEBUG_BLOCK_EXT_DEVT is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_BOOTTIME_TRACING is not set
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_STACK_TRACER=3Dy
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> CONFIG_HWLAT_TRACER=3Dy
> # CONFIG_MMIOTRACE is not set
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_BLK_DEV_IO_TRACE=3Dy
> CONFIG_KPROBE_EVENTS=3Dy
> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_DYNAMIC_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> # CONFIG_BPF_KPROBE_OVERRIDE is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_FTRACE_MCOUNT_USE_CC=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_SYNTH_EVENTS=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACE_EVENT_INJECT is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dm
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> # CONFIG_FTRACE_RECORD_RECURSION is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> # CONFIG_HIST_TRIGGERS_DEBUG is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> # CONFIG_IO_STRICT_DEVMEM is not set
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> # CONFIG_EFI_PGT_DUMP is not set
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_X86_DECODER_SELFTEST=3Dy
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> CONFIG_KUNIT=3Dy
> # CONFIG_KUNIT_DEBUGFS is not set
> CONFIG_KUNIT_TEST=3Dm
> CONFIG_KUNIT_EXAMPLE_TEST=3Dm
> # CONFIG_KUNIT_ALL_TESTS is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_FAULT_INJECTION=3Dy
> # CONFIG_FAILSLAB is not set
> # CONFIG_FAIL_PAGE_ALLOC is not set
> # CONFIG_FAULT_INJECTION_USERCOPY is not set
> CONFIG_FAIL_MAKE_REQUEST=3Dy
> # CONFIG_FAIL_IO_TIMEOUT is not set
> # CONFIG_FAIL_FUTEX is not set
> CONFIG_FAULT_INJECTION_DEBUG_FS=3Dy
> # CONFIG_FAIL_FUNCTION is not set
> # CONFIG_FAIL_MMC_REQUEST is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> # CONFIG_KCOV is not set
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_LIST_SORT is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_SORT is not set
> # CONFIG_KPROBES_SANITY_TEST is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_ASYNC_RAID6_TEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_STRSCPY is not set
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_BITMAP is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_IDA is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_BITOPS is not set
> # CONFIG_TEST_VMALLOC is not set
> # CONFIG_TEST_USER_COPY is not set
> CONFIG_TEST_BPF=3Dm
> # CONFIG_TEST_BLACKHOLE_DEV is not set
> # CONFIG_FIND_BIT_BENCHMARK is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_BITFIELD_KUNIT is not set
> # CONFIG_RESOURCE_KUNIT_TEST is not set
> CONFIG_SYSCTL_KUNIT_TEST=3Dm
> CONFIG_LIST_KUNIT_TEST=3Dm
> # CONFIG_LINEAR_RANGES_TEST is not set
> # CONFIG_CMDLINE_KUNIT_TEST is not set
> # CONFIG_BITS_TEST is not set
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_KMOD is not set
> # CONFIG_TEST_MEMCAT_P is not set
> # CONFIG_TEST_LIVEPATCH is not set
> # CONFIG_TEST_STACKINIT is not set
> # CONFIG_TEST_MEMINIT is not set
> # CONFIG_TEST_HMM is not set
> # CONFIG_TEST_FREE_PAGES is not set
> # CONFIG_TEST_FPU is not set
> # CONFIG_MEMTEST is not set
> # CONFIG_HYPERV_TESTING is not set
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'will-it-scale'
> 	export testcase=3D'will-it-scale'
> 	export category=3D'benchmark'
> 	export nr_task=3D88
> 	export job_origin=3D'will-it-scale-part2.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit
> queue_at_least_once'
> 	export queue=3D'validate'
> 	export testbox=3D'lkp-csl-2sp9'
> 	export tbox_group=3D'lkp-csl-2sp9'
> 	export kconfig=3D'x86_64-rhel-8.3'
> 	export submit_id=3D'608759c52b01078831ca950a'
> 	export job_file=3D'/lkp/jobs/scheduled/lkp-csl-2sp9/will-it-scale-perfor=
mance-thread-100%-mmap2-ucode=3D0x5003006-monitor=3D05f94038-debian-10.4-x8=
6_64-20200603.cgz-09bc0443e9a461b43d3-20210427-34865-1xvavrp-3.yaml'
> 	export id=3D'b8d9ae1bdf92c253d3004d3baf15f7443dad61ee'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'Cascade Lake'
> 	export nr_node=3D2
> 	export nr_cpu=3D88
> 	export memory=3D'128G'
> 	export nr_hdd_partitions=3D4
> 	export nr_ssd_partitions=3D1
> 	export hdd_partitions=3D'/dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC13Q1R=
D-part*'
> 	export ssd_partitions=3D'/dev/disk/by-id/ata-INTEL_SSDSC2BB480G7_PHDV723=
200JX480BGN-part1'
> 	export rootfs_partition=3D'/dev/disk/by-id/ata-INTEL_SSDSC2BB480G7_PHDV7=
23200JX480BGN-part2'
> 	export brand=3D'Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz'
> 	export commit=3D'09bc0443e9a461b43d3914ea07925e78fa095b66'
> 	export ucode=3D'0x5003006'
> 	export need_kconfig_hw=3D'CONFIG_I40E=3Dy
> CONFIG_SATA_AHCI'
> 	export enqueue_time=3D'2021-04-27 08:24:37 +0800'
> 	export _id=3D'608759c52b01078831ca950a'
> 	export _rt=3D'/result/will-it-scale/performance-thread-100%-mmap2-ucode=
=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp9/debian-10.4-x86_64-20200603.cg=
z/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914ea07925e78fa095b66'
> 	export user=3D'lkp'
> 	export compiler=3D'gcc-9'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export head_commit=3D'3926d03adf72699434b3a4e719cdb6f7854fec60'
> 	export base_commit=3D'bf05bf16c76bb44ab5156223e1e58e26dfe30a88'
> 	export branch=3D'aa/mapcount_deshare'
> 	export rootfs=3D'debian-10.4-x86_64-20200603.cgz'
> 	export monitor_sha=3D'05f94038'
> 	export result_root=3D'/result/will-it-scale/performance-thread-100%-mmap=
2-ucode=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp9/debian-10.4-x86_64-2020=
0603.cgz/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914ea07925e78fa095b66/3'
> 	export scheduler_version=3D'/lkp/lkp/.src-20210425-142307'
> 	export arch=3D'x86_64'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/debian/debian-10.4-x86_64-20200603.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/lkp-csl-2sp9/will-it-scale-performance-thread-1=
00%-mmap2-ucode=3D0x5003006-monitor=3D05f94038-debian-10.4-x86_64-20200603.=
cgz-09bc0443e9a461b43d3-20210427-34865-1xvavrp-3.yaml
> ARCH=3Dx86_64
> kconfig=3Dx86_64-rhel-8.3
> branch=3Daa/mapcount_deshare
> commit=3D09bc0443e9a461b43d3914ea07925e78fa095b66
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914ea079=
25e78fa095b66/vmlinuz-5.12.0-rc8-00027-g09bc0443e9a4
> max_uptime=3D2100
> RESULT_ROOT=3D/result/will-it-scale/performance-thread-100%-mmap2-ucode=
=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp9/debian-10.4-x86_64-20200603.cg=
z/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914ea07925e78fa095b66/3
> LKP_SERVER=3Dinternal-lkp-server
> nokaslr
> selinux=3D0
> debug
> apic=3Ddebug
> sysrq_always_enabled
> rcupdate.rcu_cpu_stall_timeout=3D100
> net.ifnames=3D0
> printk.devkmsg=3Don
> panic=3D-1
> softlockup_panic=3D1
> nmi_watchdog=3Dpanic
> oops=3Dpanic
> load_ramdisk=3D2
> prompt_ramdisk=3D0
> drbd.minor_count=3D8
> systemd.log_level=3Derr
> ignore_loglevel
> console=3Dtty0
> earlyprintk=3DttyS0,115200
> console=3DttyS0,115200
> vga=3Dnormal
> rw'
> 	export modules_initrd=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/09bc0443e9a461=
b43d3914ea07925e78fa095b66/modules.cgz'
> 	export bm_initrd=3D'/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ip=
config_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20201=
211.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608=
.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/will-it-scale_20210401.c=
gz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/will-it-scale-x86_64-a34a85=
c-1_20210401.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200=
714.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/turbostat_20200721.cg=
z,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200=
721.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/perf_20201126.cgz,/os=
image/pkg/debian-10.4-x86_64-20200603.cgz/perf-x86_64-d19cc4bfbff1-1_202104=
01.cgz,/osimage/pkg/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20=
200702.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
> 	export ucode_initrd=3D'/osimage/ucode/intel-ucode-20210222.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-x86_64.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export last_kernel=3D'5.12.0-rc8-11035-g3926d03adf72'
> 	export repeat_to=3D6
> 	export bad_samples=3D'2178
> 2228
> 2139'
> 	export queue_at_least_once=3D1
> 	export kernel=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914=
ea07925e78fa095b66/vmlinuz-5.12.0-rc8-00027-g09bc0443e9a4'
> 	export dequeue_time=3D'2021-04-27 08:25:22 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/lkp-csl-2sp9/will-it-scale-perf=
ormance-thread-100%-mmap2-ucode=3D0x5003006-monitor=3D05f94038-debian-10.4-=
x86_64-20200603.cgz-09bc0443e9a461b43d3-20210427-34865-1xvavrp-3.cgz'
> =

> 	[ -n "$LKP_SRC" ] ||
> 	export LKP_SRC=3D/lkp/${user:-lkp}/src
> }
> =

> run_job()
> {
> 	echo $$ > $TMP/run-job.pid
> =

> 	. $LKP_SRC/lib/http.sh
> 	. $LKP_SRC/lib/job.sh
> 	. $LKP_SRC/lib/env.sh
> =

> 	export_top_env
> =

> 	run_setup $LKP_SRC/setup/cpufreq_governor 'performance'
> =

> 	run_monitor $LKP_SRC/monitors/wrapper kmsg
> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper boot-time
> 	run_monitor $LKP_SRC/monitors/wrapper uptime
> 	run_monitor $LKP_SRC/monitors/wrapper iostat
> 	run_monitor $LKP_SRC/monitors/wrapper heartbeat
> 	run_monitor $LKP_SRC/monitors/wrapper vmstat
> 	run_monitor $LKP_SRC/monitors/wrapper numa-numastat
> 	run_monitor $LKP_SRC/monitors/wrapper numa-vmstat
> 	run_monitor $LKP_SRC/monitors/wrapper numa-meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper proc-vmstat
> 	run_monitor $LKP_SRC/monitors/wrapper proc-stat
> 	run_monitor $LKP_SRC/monitors/wrapper meminfo
> 	run_monitor $LKP_SRC/monitors/wrapper slabinfo
> 	run_monitor $LKP_SRC/monitors/wrapper interrupts
> 	run_monitor $LKP_SRC/monitors/wrapper lock_stat
> 	run_monitor lite_mode=3D1 $LKP_SRC/monitors/wrapper perf-sched
> 	run_monitor $LKP_SRC/monitors/wrapper softirqs
> 	run_monitor $LKP_SRC/monitors/one-shot/wrapper bdi_dev_mapping
> 	run_monitor $LKP_SRC/monitors/wrapper diskstats
> 	run_monitor $LKP_SRC/monitors/wrapper nfsstat
> 	run_monitor $LKP_SRC/monitors/wrapper cpuidle
> 	run_monitor $LKP_SRC/monitors/wrapper cpufreq-stats
> 	run_monitor $LKP_SRC/monitors/wrapper turbostat
> 	run_monitor $LKP_SRC/monitors/wrapper sched_debug
> 	run_monitor $LKP_SRC/monitors/wrapper perf-stat
> 	run_monitor $LKP_SRC/monitors/wrapper mpstat
> 	run_monitor $LKP_SRC/monitors/no-stdout/wrapper perf-profile
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> =

> 	run_test mode=3D'thread' test=3D'mmap2' $LKP_SRC/tests/wrapper will-it-s=
cale
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	env mode=3D'thread' test=3D'mmap2' $LKP_SRC/stats/wrapper will-it-scale
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper boot-time
> 	$LKP_SRC/stats/wrapper uptime
> 	$LKP_SRC/stats/wrapper iostat
> 	$LKP_SRC/stats/wrapper vmstat
> 	$LKP_SRC/stats/wrapper numa-numastat
> 	$LKP_SRC/stats/wrapper numa-vmstat
> 	$LKP_SRC/stats/wrapper numa-meminfo
> 	$LKP_SRC/stats/wrapper proc-vmstat
> 	$LKP_SRC/stats/wrapper meminfo
> 	$LKP_SRC/stats/wrapper slabinfo
> 	$LKP_SRC/stats/wrapper interrupts
> 	$LKP_SRC/stats/wrapper lock_stat
> 	env lite_mode=3D1 $LKP_SRC/stats/wrapper perf-sched
> 	$LKP_SRC/stats/wrapper softirqs
> 	$LKP_SRC/stats/wrapper diskstats
> 	$LKP_SRC/stats/wrapper nfsstat
> 	$LKP_SRC/stats/wrapper cpuidle
> 	$LKP_SRC/stats/wrapper turbostat
> 	$LKP_SRC/stats/wrapper sched_debug
> 	$LKP_SRC/stats/wrapper perf-stat
> 	$LKP_SRC/stats/wrapper mpstat
> 	$LKP_SRC/stats/wrapper perf-profile
> =

> 	$LKP_SRC/stats/wrapper time will-it-scale.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"

> ---
> suite: will-it-scale
> testcase: will-it-scale
> category: benchmark
> nr_task: 100%
> will-it-scale:
>   mode: thread
>   test: mmap2
> job_origin: will-it-scale-part2.yaml
> queue_cmdline_keys:
> - branch
> - commit
> - queue_at_least_once
> queue: bisect
> testbox: lkp-csl-2sp9
> tbox_group: lkp-csl-2sp9
> kconfig: x86_64-rhel-8.3
> submit_id: 608745612b010771a3c97dfd
> job_file: "/lkp/jobs/scheduled/lkp-csl-2sp9/will-it-scale-performance-thr=
ead-100%-mmap2-ucode=3D0x5003006-monitor=3D05f94038-debian-10.4-x86_64-2020=
0603.cgz-09bc0443e9a461b43d3-20210427-29091-12rota-1.yaml"
> id: 539d03b0c7463fea88b945412f8d9eb8aec7b4cd
> queuer_version: "/lkp-src"
> model: Cascade Lake
> nr_node: 2
> nr_cpu: 88
> memory: 128G
> nr_hdd_partitions: 4
> nr_ssd_partitions: 1
> hdd_partitions: "/dev/disk/by-id/ata-ST4000NM0035-1V4107_ZC13Q1RD-part*"
> ssd_partitions: "/dev/disk/by-id/ata-INTEL_SSDSC2BB480G7_PHDV723200JX480B=
GN-part1"
> rootfs_partition: "/dev/disk/by-id/ata-INTEL_SSDSC2BB480G7_PHDV723200JX48=
0BGN-part2"
> brand: Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GHz
> kmsg: =

> boot-time: =

> uptime: =

> iostat: =

> heartbeat: =

> vmstat: =

> numa-numastat: =

> numa-vmstat: =

> numa-meminfo: =

> proc-vmstat: =

> proc-stat: =

> meminfo: =

> slabinfo: =

> interrupts: =

> lock_stat: =

> perf-sched:
>   lite_mode: 1
> softirqs: =

> bdi_dev_mapping: =

> diskstats: =

> nfsstat: =

> cpuidle: =

> cpufreq-stats: =

> turbostat: =

> sched_debug: =

> perf-stat: =

> mpstat: =

> perf-profile: =

> cpufreq_governor: performance
> commit: '09bc0443e9a461b43d3914ea07925e78fa095b66'
> ucode: '0x5003006'
> need_kconfig_hw:
> - CONFIG_I40E=3Dy
> - CONFIG_SATA_AHCI
> enqueue_time: 2021-04-27 06:57:37.478035114 +08:00
> _id: 60874caf2b010771a3c97dfe
> _rt: "/result/will-it-scale/performance-thread-100%-mmap2-ucode=3D0x50030=
06-monitor=3D05f94038/lkp-csl-2sp9/debian-10.4-x86_64-20200603.cgz/x86_64-r=
hel-8.3/gcc-9/09bc0443e9a461b43d3914ea07925e78fa095b66"
> user: lkp
> compiler: gcc-9
> LKP_SERVER: internal-lkp-server
> head_commit: 3926d03adf72699434b3a4e719cdb6f7854fec60
> base_commit: bf05bf16c76bb44ab5156223e1e58e26dfe30a88
> branch: linux-devel/devel-hourly-20210425-134157
> rootfs: debian-10.4-x86_64-20200603.cgz
> monitor_sha: 05f94038
> result_root: "/result/will-it-scale/performance-thread-100%-mmap2-ucode=
=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp9/debian-10.4-x86_64-20200603.cg=
z/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914ea07925e78fa095b66/1"
> scheduler_version: "/lkp/lkp/.src-20210425-142307"
> arch: x86_64
> max_uptime: 2100
> initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/jobs/scheduled/lkp-csl-2sp9/will-it-scale-performance-thread=
-100%-mmap2-ucode=3D0x5003006-monitor=3D05f94038-debian-10.4-x86_64-2020060=
3.cgz-09bc0443e9a461b43d3-20210427-29091-12rota-1.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel-8.3
> - branch=3Dlinux-devel/devel-hourly-20210425-134157
> - commit=3D09bc0443e9a461b43d3914ea07925e78fa095b66
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914ea0=
7925e78fa095b66/vmlinuz-5.12.0-rc8-00027-g09bc0443e9a4
> - max_uptime=3D2100
> - RESULT_ROOT=3D/result/will-it-scale/performance-thread-100%-mmap2-ucode=
=3D0x5003006-monitor=3D05f94038/lkp-csl-2sp9/debian-10.4-x86_64-20200603.cg=
z/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914ea07925e78fa095b66/1
> - LKP_SERVER=3Dinternal-lkp-server
> - nokaslr
> - selinux=3D0
> - debug
> - apic=3Ddebug
> - sysrq_always_enabled
> - rcupdate.rcu_cpu_stall_timeout=3D100
> - net.ifnames=3D0
> - printk.devkmsg=3Don
> - panic=3D-1
> - softlockup_panic=3D1
> - nmi_watchdog=3Dpanic
> - oops=3Dpanic
> - load_ramdisk=3D2
> - prompt_ramdisk=3D0
> - drbd.minor_count=3D8
> - systemd.log_level=3Derr
> - ignore_loglevel
> - console=3Dtty0
> - earlyprintk=3DttyS0,115200
> - console=3DttyS0,115200
> - vga=3Dnormal
> - rw
> modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914e=
a07925e78fa095b66/modules.cgz"
> bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20=
200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20201211.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osi=
mage/deps/debian-10.4-x86_64-20200603.cgz/will-it-scale_20210401.cgz,/osima=
ge/pkg/debian-10.4-x86_64-20200603.cgz/will-it-scale-x86_64-a34a85c-1_20210=
401.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/turbostat_20200721.cgz,/osimag=
e/pkg/debian-10.4-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200721.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/perf_20201126.cgz,/osimage/pkg=
/debian-10.4-x86_64-20200603.cgz/perf-x86_64-d19cc4bfbff1-1_20210401.cgz,/o=
simage/pkg/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cg=
z,/osimage/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
> ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
> lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
> site: inn
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> oom-killer: =

> watchdog: =

> last_kernel: 5.12.0-rc8-00027-g09bc0443e9a4
> repeat_to: 3
> bad_samples:
> - 2178
> - 2228
> - 2139
> =

> #! queue options
> =

> #! user overrides
> queue_at_least_once: 0
> =

> #! schedule options
> kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/09bc0443e9a461b43d3914ea07925e7=
8fa095b66/vmlinuz-5.12.0-rc8-00027-g09bc0443e9a4"
> dequeue_time: 2021-04-27 07:37:55.851112630 +08:00
> =

> #! /lkp/lkp/.src-20210425-142307/include/site/inn
> =

> #! runtime status
> job_state: finished
> loadavg: 62.94 52.43 23.94 1/728 10245
> start_time: '1619480328'
> end_time: '1619480630'
> version: "/lkp/lkp/.src-20210425-142340:01225f6d-dirty:9486817ee"

> =

> for cpu_dir in /sys/devices/system/cpu/cpu[0-9]*
> do
> 	online_file=3D"$cpu_dir"/online
> 	[ -f "$online_file" ] && [ "$(cat "$online_file")" -eq 0 ] && continue
> =

> 	file=3D"$cpu_dir"/cpufreq/scaling_governor
> 	[ -f "$file" ] && echo "performance" > "$file"
> done
> =

>  "/lkp/benchmarks/python3/bin/python3" "./runtest.py" "mmap2" "295" "thre=
ad" "88"


--===============3589168606509354725==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="rhel8-5.12"

IwojIEF1dG9tYXRpY2FsbHkgZ2VuZXJhdGVkIGZpbGU7IERPIE5PVCBFRElULgojIExpbnV4L3g4
NiA1LjEyLjAtcmM4LXJldiBLZXJuZWwgQ29uZmlndXJhdGlvbgojCkNPTkZJR19DQ19WRVJTSU9O
X1RFWFQ9ImdjYyAoR0NDKSA4LjMuMSAyMDE5MTEyMSAoUmVkIEhhdCA4LjMuMS01KSIKQ09ORklH
X0NDX0lTX0dDQz15CkNPTkZJR19HQ0NfVkVSU0lPTj04MDMwMQpDT05GSUdfQ0xBTkdfVkVSU0lP
Tj0wCkNPTkZJR19MRF9JU19CRkQ9eQpDT05GSUdfTERfVkVSU0lPTj0yMzAwMApDT05GSUdfTExE
X1ZFUlNJT049MApDT05GSUdfQ0NfQ0FOX0xJTks9eQpDT05GSUdfQ0NfSEFTX0FTTV9HT1RPPXkK
Q09ORklHX0NDX0hBU19BU01fSU5MSU5FPXkKQ09ORklHX0lSUV9XT1JLPXkKQ09ORklHX0JVSUxE
VElNRV9UQUJMRV9TT1JUPXkKQ09ORklHX1RIUkVBRF9JTkZPX0lOX1RBU0s9eQoKIwojIEdlbmVy
YWwgc2V0dXAKIwpDT05GSUdfSU5JVF9FTlZfQVJHX0xJTUlUPTMyCiMgQ09ORklHX0NPTVBJTEVf
VEVTVCBpcyBub3Qgc2V0CkNPTkZJR19MT0NBTFZFUlNJT049IiIKIyBDT05GSUdfTE9DQUxWRVJT
SU9OX0FVVE8gaXMgbm90IHNldApDT05GSUdfQlVJTERfU0FMVD0iIgpDT05GSUdfSEFWRV9LRVJO
RUxfR1pJUD15CkNPTkZJR19IQVZFX0tFUk5FTF9CWklQMj15CkNPTkZJR19IQVZFX0tFUk5FTF9M
Wk1BPXkKQ09ORklHX0hBVkVfS0VSTkVMX1haPXkKQ09ORklHX0hBVkVfS0VSTkVMX0xaTz15CkNP
TkZJR19IQVZFX0tFUk5FTF9MWjQ9eQpDT05GSUdfSEFWRV9LRVJORUxfWlNURD15CkNPTkZJR19L
RVJORUxfR1pJUD15CiMgQ09ORklHX0tFUk5FTF9CWklQMiBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
Uk5FTF9MWk1BIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VSTkVMX1haIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0VSTkVMX0xaTyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFUk5FTF9MWjQgaXMgbm90IHNldAoj
IENPTkZJR19LRVJORUxfWlNURCBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX0lOSVQ9IiIKQ09O
RklHX0RFRkFVTFRfSE9TVE5BTUU9Iihub25lKSIKQ09ORklHX1NXQVA9eQpDT05GSUdfU1lTVklQ
Qz15CkNPTkZJR19TWVNWSVBDX1NZU0NUTD15CkNPTkZJR19QT1NJWF9NUVVFVUU9eQpDT05GSUdf
UE9TSVhfTVFVRVVFX1NZU0NUTD15CiMgQ09ORklHX1dBVENIX1FVRVVFIGlzIG5vdCBzZXQKQ09O
RklHX0NST1NTX01FTU9SWV9BVFRBQ0g9eQojIENPTkZJR19VU0VMSUIgaXMgbm90IHNldApDT05G
SUdfQVVESVQ9eQpDT05GSUdfSEFWRV9BUkNIX0FVRElUU1lTQ0FMTD15CkNPTkZJR19BVURJVFNZ
U0NBTEw9eQoKIwojIElSUSBzdWJzeXN0ZW0KIwpDT05GSUdfR0VORVJJQ19JUlFfUFJPQkU9eQpD
T05GSUdfR0VORVJJQ19JUlFfU0hPVz15CkNPTkZJR19HRU5FUklDX0lSUV9FRkZFQ1RJVkVfQUZG
X01BU0s9eQpDT05GSUdfR0VORVJJQ19QRU5ESU5HX0lSUT15CkNPTkZJR19HRU5FUklDX0lSUV9N
SUdSQVRJT049eQpDT05GSUdfR0VORVJJQ19JUlFfSU5KRUNUSU9OPXkKQ09ORklHX0hBUkRJUlFT
X1NXX1JFU0VORD15CkNPTkZJR19JUlFfRE9NQUlOPXkKQ09ORklHX0lSUV9ET01BSU5fSElFUkFS
Q0hZPXkKQ09ORklHX0dFTkVSSUNfTVNJX0lSUT15CkNPTkZJR19HRU5FUklDX01TSV9JUlFfRE9N
QUlOPXkKQ09ORklHX0lSUV9NU0lfSU9NTVU9eQpDT05GSUdfR0VORVJJQ19JUlFfTUFUUklYX0FM
TE9DQVRPUj15CkNPTkZJR19HRU5FUklDX0lSUV9SRVNFUlZBVElPTl9NT0RFPXkKQ09ORklHX0lS
UV9GT1JDRURfVEhSRUFESU5HPXkKQ09ORklHX1NQQVJTRV9JUlE9eQojIENPTkZJR19HRU5FUklD
X0lSUV9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBlbmQgb2YgSVJRIHN1YnN5c3RlbQoKQ09ORklHX0NM
T0NLU09VUkNFX1dBVENIRE9HPXkKQ09ORklHX0FSQ0hfQ0xPQ0tTT1VSQ0VfSU5JVD15CkNPTkZJ
R19DTE9DS1NPVVJDRV9WQUxJREFURV9MQVNUX0NZQ0xFPXkKQ09ORklHX0dFTkVSSUNfVElNRV9W
U1lTQ0FMTD15CkNPTkZJR19HRU5FUklDX0NMT0NLRVZFTlRTPXkKQ09ORklHX0dFTkVSSUNfQ0xP
Q0tFVkVOVFNfQlJPQURDQVNUPXkKQ09ORklHX0dFTkVSSUNfQ0xPQ0tFVkVOVFNfTUlOX0FESlVT
VD15CkNPTkZJR19HRU5FUklDX0NNT1NfVVBEQVRFPXkKQ09ORklHX0hBVkVfUE9TSVhfQ1BVX1RJ
TUVSU19UQVNLX1dPUks9eQpDT05GSUdfUE9TSVhfQ1BVX1RJTUVSU19UQVNLX1dPUks9eQoKIwoj
IFRpbWVycyBzdWJzeXN0ZW0KIwpDT05GSUdfVElDS19PTkVTSE9UPXkKQ09ORklHX05PX0haX0NP
TU1PTj15CiMgQ09ORklHX0haX1BFUklPRElDIGlzIG5vdCBzZXQKIyBDT05GSUdfTk9fSFpfSURM
RSBpcyBub3Qgc2V0CkNPTkZJR19OT19IWl9GVUxMPXkKQ09ORklHX0NPTlRFWFRfVFJBQ0tJTkc9
eQojIENPTkZJR19DT05URVhUX1RSQUNLSU5HX0ZPUkNFIGlzIG5vdCBzZXQKQ09ORklHX05PX0ha
PXkKQ09ORklHX0hJR0hfUkVTX1RJTUVSUz15CiMgZW5kIG9mIFRpbWVycyBzdWJzeXN0ZW0KCiMg
Q09ORklHX1BSRUVNUFRfTk9ORSBpcyBub3Qgc2V0CkNPTkZJR19QUkVFTVBUX1ZPTFVOVEFSWT15
CiMgQ09ORklHX1BSRUVNUFQgaXMgbm90IHNldAoKIwojIENQVS9UYXNrIHRpbWUgYW5kIHN0YXRz
IGFjY291bnRpbmcKIwpDT05GSUdfVklSVF9DUFVfQUNDT1VOVElORz15CkNPTkZJR19WSVJUX0NQ
VV9BQ0NPVU5USU5HX0dFTj15CkNPTkZJR19JUlFfVElNRV9BQ0NPVU5USU5HPXkKQ09ORklHX0hB
VkVfU0NIRURfQVZHX0lSUT15CkNPTkZJR19CU0RfUFJPQ0VTU19BQ0NUPXkKQ09ORklHX0JTRF9Q
Uk9DRVNTX0FDQ1RfVjM9eQpDT05GSUdfVEFTS1NUQVRTPXkKQ09ORklHX1RBU0tfREVMQVlfQUND
VD15CkNPTkZJR19UQVNLX1hBQ0NUPXkKQ09ORklHX1RBU0tfSU9fQUNDT1VOVElORz15CkNPTkZJ
R19QU0k9eQpDT05GSUdfUFNJX0RFRkFVTFRfRElTQUJMRUQ9eQojIGVuZCBvZiBDUFUvVGFzayB0
aW1lIGFuZCBzdGF0cyBhY2NvdW50aW5nCgpDT05GSUdfQ1BVX0lTT0xBVElPTj15CgojCiMgUkNV
IFN1YnN5c3RlbQojCkNPTkZJR19UUkVFX1JDVT15CiMgQ09ORklHX1JDVV9FWFBFUlQgaXMgbm90
IHNldApDT05GSUdfU1JDVT15CkNPTkZJR19UUkVFX1NSQ1U9eQpDT05GSUdfVEFTS1NfUkNVX0dF
TkVSSUM9eQpDT05GSUdfVEFTS1NfUlVERV9SQ1U9eQpDT05GSUdfVEFTS1NfVFJBQ0VfUkNVPXkK
Q09ORklHX1JDVV9TVEFMTF9DT01NT049eQpDT05GSUdfUkNVX05FRURfU0VHQ0JMSVNUPXkKQ09O
RklHX1JDVV9OT0NCX0NQVT15CiMgZW5kIG9mIFJDVSBTdWJzeXN0ZW0KCkNPTkZJR19CVUlMRF9C
SU4yQz15CiMgQ09ORklHX0lLQ09ORklHIGlzIG5vdCBzZXQKIyBDT05GSUdfSUtIRUFERVJTIGlz
IG5vdCBzZXQKQ09ORklHX0xPR19CVUZfU0hJRlQ9MjAKQ09ORklHX0xPR19DUFVfTUFYX0JVRl9T
SElGVD0xMgpDT05GSUdfUFJJTlRLX1NBRkVfTE9HX0JVRl9TSElGVD0xMwpDT05GSUdfSEFWRV9V
TlNUQUJMRV9TQ0hFRF9DTE9DSz15CgojCiMgU2NoZWR1bGVyIGZlYXR1cmVzCiMKIyBDT05GSUdf
VUNMQU1QX1RBU0sgaXMgbm90IHNldAojIGVuZCBvZiBTY2hlZHVsZXIgZmVhdHVyZXMKCkNPTkZJ
R19BUkNIX1NVUFBPUlRTX05VTUFfQkFMQU5DSU5HPXkKQ09ORklHX0FSQ0hfV0FOVF9CQVRDSEVE
X1VOTUFQX1RMQl9GTFVTSD15CkNPTkZJR19DQ19IQVNfSU5UMTI4PXkKQ09ORklHX0FSQ0hfU1VQ
UE9SVFNfSU5UMTI4PXkKQ09ORklHX05VTUFfQkFMQU5DSU5HPXkKQ09ORklHX05VTUFfQkFMQU5D
SU5HX0RFRkFVTFRfRU5BQkxFRD15CkNPTkZJR19DR1JPVVBTPXkKQ09ORklHX1BBR0VfQ09VTlRF
Uj15CkNPTkZJR19NRU1DRz15CkNPTkZJR19NRU1DR19TV0FQPXkKQ09ORklHX01FTUNHX0tNRU09
eQpDT05GSUdfQkxLX0NHUk9VUD15CkNPTkZJR19DR1JPVVBfV1JJVEVCQUNLPXkKQ09ORklHX0NH
Uk9VUF9TQ0hFRD15CkNPTkZJR19GQUlSX0dST1VQX1NDSEVEPXkKQ09ORklHX0NGU19CQU5EV0lE
VEg9eQpDT05GSUdfUlRfR1JPVVBfU0NIRUQ9eQpDT05GSUdfQ0dST1VQX1BJRFM9eQpDT05GSUdf
Q0dST1VQX1JETUE9eQpDT05GSUdfQ0dST1VQX0ZSRUVaRVI9eQpDT05GSUdfQ0dST1VQX0hVR0VU
TEI9eQpDT05GSUdfQ1BVU0VUUz15CkNPTkZJR19QUk9DX1BJRF9DUFVTRVQ9eQpDT05GSUdfQ0dS
T1VQX0RFVklDRT15CkNPTkZJR19DR1JPVVBfQ1BVQUNDVD15CkNPTkZJR19DR1JPVVBfUEVSRj15
CkNPTkZJR19DR1JPVVBfQlBGPXkKIyBDT05GSUdfQ0dST1VQX0RFQlVHIGlzIG5vdCBzZXQKQ09O
RklHX1NPQ0tfQ0dST1VQX0RBVEE9eQpDT05GSUdfTkFNRVNQQUNFUz15CkNPTkZJR19VVFNfTlM9
eQpDT05GSUdfVElNRV9OUz15CkNPTkZJR19JUENfTlM9eQpDT05GSUdfVVNFUl9OUz15CkNPTkZJ
R19QSURfTlM9eQpDT05GSUdfTkVUX05TPXkKQ09ORklHX0NIRUNLUE9JTlRfUkVTVE9SRT15CkNP
TkZJR19TQ0hFRF9BVVRPR1JPVVA9eQojIENPTkZJR19TWVNGU19ERVBSRUNBVEVEIGlzIG5vdCBz
ZXQKQ09ORklHX1JFTEFZPXkKQ09ORklHX0JMS19ERVZfSU5JVFJEPXkKQ09ORklHX0lOSVRSQU1G
U19TT1VSQ0U9IiIKQ09ORklHX1JEX0daSVA9eQpDT05GSUdfUkRfQlpJUDI9eQpDT05GSUdfUkRf
TFpNQT15CkNPTkZJR19SRF9YWj15CkNPTkZJR19SRF9MWk89eQpDT05GSUdfUkRfTFo0PXkKQ09O
RklHX1JEX1pTVEQ9eQojIENPTkZJR19CT09UX0NPTkZJRyBpcyBub3Qgc2V0CkNPTkZJR19DQ19P
UFRJTUlaRV9GT1JfUEVSRk9STUFOQ0U9eQojIENPTkZJR19DQ19PUFRJTUlaRV9GT1JfU0laRSBp
cyBub3Qgc2V0CkNPTkZJR19MRF9PUlBIQU5fV0FSTj15CkNPTkZJR19TWVNDVEw9eQpDT05GSUdf
SEFWRV9VSUQxNj15CkNPTkZJR19TWVNDVExfRVhDRVBUSU9OX1RSQUNFPXkKQ09ORklHX0hBVkVf
UENTUEtSX1BMQVRGT1JNPXkKQ09ORklHX0JQRj15CiMgQ09ORklHX0VYUEVSVCBpcyBub3Qgc2V0
CkNPTkZJR19VSUQxNj15CkNPTkZJR19NVUxUSVVTRVI9eQpDT05GSUdfU0dFVE1BU0tfU1lTQ0FM
TD15CkNPTkZJR19TWVNGU19TWVNDQUxMPXkKQ09ORklHX0ZIQU5ETEU9eQpDT05GSUdfUE9TSVhf
VElNRVJTPXkKQ09ORklHX1BSSU5USz15CkNPTkZJR19QUklOVEtfTk1JPXkKQ09ORklHX0JVRz15
CkNPTkZJR19FTEZfQ09SRT15CkNPTkZJR19QQ1NQS1JfUExBVEZPUk09eQpDT05GSUdfQkFTRV9G
VUxMPXkKQ09ORklHX0ZVVEVYPXkKQ09ORklHX0ZVVEVYX1BJPXkKQ09ORklHX0VQT0xMPXkKQ09O
RklHX1NJR05BTEZEPXkKQ09ORklHX1RJTUVSRkQ9eQpDT05GSUdfRVZFTlRGRD15CkNPTkZJR19T
SE1FTT15CkNPTkZJR19BSU89eQpDT05GSUdfSU9fVVJJTkc9eQpDT05GSUdfQURWSVNFX1NZU0NB
TExTPXkKQ09ORklHX0hBVkVfQVJDSF9VU0VSRkFVTFRGRF9XUD15CkNPTkZJR19NRU1CQVJSSUVS
PXkKQ09ORklHX0tBTExTWU1TPXkKQ09ORklHX0tBTExTWU1TX0FMTD15CkNPTkZJR19LQUxMU1lN
U19BQlNPTFVURV9QRVJDUFU9eQpDT05GSUdfS0FMTFNZTVNfQkFTRV9SRUxBVElWRT15CiMgQ09O
RklHX0JQRl9MU00gaXMgbm90IHNldApDT05GSUdfQlBGX1NZU0NBTEw9eQpDT05GSUdfQVJDSF9X
QU5UX0RFRkFVTFRfQlBGX0pJVD15CkNPTkZJR19CUEZfSklUX0FMV0FZU19PTj15CkNPTkZJR19C
UEZfSklUX0RFRkFVTFRfT049eQojIENPTkZJR19CUEZfUFJFTE9BRCBpcyBub3Qgc2V0CkNPTkZJ
R19VU0VSRkFVTFRGRD15CkNPTkZJR19BUkNIX0hBU19NRU1CQVJSSUVSX1NZTkNfQ09SRT15CkNP
TkZJR19LQ01QPXkKQ09ORklHX1JTRVE9eQojIENPTkZJR19FTUJFRERFRCBpcyBub3Qgc2V0CkNP
TkZJR19IQVZFX1BFUkZfRVZFTlRTPXkKCiMKIyBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFu
ZCBDb3VudGVycwojCkNPTkZJR19QRVJGX0VWRU5UUz15CiMgQ09ORklHX0RFQlVHX1BFUkZfVVNF
X1ZNQUxMT0MgaXMgbm90IHNldAojIGVuZCBvZiBLZXJuZWwgUGVyZm9ybWFuY2UgRXZlbnRzIEFu
ZCBDb3VudGVycwoKQ09ORklHX1ZNX0VWRU5UX0NPVU5URVJTPXkKQ09ORklHX1NMVUJfREVCVUc9
eQojIENPTkZJR19DT01QQVRfQlJLIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xBQiBpcyBub3Qgc2V0
CkNPTkZJR19TTFVCPXkKQ09ORklHX1NMQUJfTUVSR0VfREVGQVVMVD15CkNPTkZJR19TTEFCX0ZS
RUVMSVNUX1JBTkRPTT15CiMgQ09ORklHX1NMQUJfRlJFRUxJU1RfSEFSREVORUQgaXMgbm90IHNl
dApDT05GSUdfU0hVRkZMRV9QQUdFX0FMTE9DQVRPUj15CkNPTkZJR19TTFVCX0NQVV9QQVJUSUFM
PXkKQ09ORklHX1NZU1RFTV9EQVRBX1ZFUklGSUNBVElPTj15CkNPTkZJR19QUk9GSUxJTkc9eQpD
T05GSUdfVFJBQ0VQT0lOVFM9eQojIGVuZCBvZiBHZW5lcmFsIHNldHVwCgpDT05GSUdfNjRCSVQ9
eQpDT05GSUdfWDg2XzY0PXkKQ09ORklHX1g4Nj15CkNPTkZJR19JTlNUUlVDVElPTl9ERUNPREVS
PXkKQ09ORklHX09VVFBVVF9GT1JNQVQ9ImVsZjY0LXg4Ni02NCIKQ09ORklHX0xPQ0tERVBfU1VQ
UE9SVD15CkNPTkZJR19TVEFDS1RSQUNFX1NVUFBPUlQ9eQpDT05GSUdfTU1VPXkKQ09ORklHX0FS
Q0hfTU1BUF9STkRfQklUU19NSU49MjgKQ09ORklHX0FSQ0hfTU1BUF9STkRfQklUU19NQVg9MzIK
Q09ORklHX0FSQ0hfTU1BUF9STkRfQ09NUEFUX0JJVFNfTUlOPTgKQ09ORklHX0FSQ0hfTU1BUF9S
TkRfQ09NUEFUX0JJVFNfTUFYPTE2CkNPTkZJR19HRU5FUklDX0lTQV9ETUE9eQpDT05GSUdfR0VO
RVJJQ19CVUc9eQpDT05GSUdfR0VORVJJQ19CVUdfUkVMQVRJVkVfUE9JTlRFUlM9eQpDT05GSUdf
QVJDSF9NQVlfSEFWRV9QQ19GREM9eQpDT05GSUdfR0VORVJJQ19DQUxJQlJBVEVfREVMQVk9eQpD
T05GSUdfQVJDSF9IQVNfQ1BVX1JFTEFYPXkKQ09ORklHX0FSQ0hfSEFTX0NBQ0hFX0xJTkVfU0la
RT15CkNPTkZJR19BUkNIX0hBU19GSUxURVJfUEdQUk9UPXkKQ09ORklHX0hBVkVfU0VUVVBfUEVS
X0NQVV9BUkVBPXkKQ09ORklHX05FRURfUEVSX0NQVV9FTUJFRF9GSVJTVF9DSFVOSz15CkNPTkZJ
R19ORUVEX1BFUl9DUFVfUEFHRV9GSVJTVF9DSFVOSz15CkNPTkZJR19BUkNIX0hJQkVSTkFUSU9O
X1BPU1NJQkxFPXkKQ09ORklHX0FSQ0hfU1VTUEVORF9QT1NTSUJMRT15CkNPTkZJR19BUkNIX1dB
TlRfR0VORVJBTF9IVUdFVExCPXkKQ09ORklHX1pPTkVfRE1BMzI9eQpDT05GSUdfQVVESVRfQVJD
SD15CkNPTkZJR19IQVZFX0lOVEVMX1RYVD15CkNPTkZJR19YODZfNjRfU01QPXkKQ09ORklHX0FS
Q0hfU1VQUE9SVFNfVVBST0JFUz15CkNPTkZJR19GSVhfRUFSTFlDT05fTUVNPXkKQ09ORklHX0RZ
TkFNSUNfUEhZU0lDQUxfTUFTSz15CkNPTkZJR19QR1RBQkxFX0xFVkVMUz01CkNPTkZJR19DQ19I
QVNfU0FORV9TVEFDS1BST1RFQ1RPUj15CgojCiMgUHJvY2Vzc29yIHR5cGUgYW5kIGZlYXR1cmVz
CiMKQ09ORklHX1pPTkVfRE1BPXkKQ09ORklHX1NNUD15CkNPTkZJR19YODZfRkVBVFVSRV9OQU1F
Uz15CkNPTkZJR19YODZfWDJBUElDPXkKQ09ORklHX1g4Nl9NUFBBUlNFPXkKIyBDT05GSUdfR09M
REZJU0ggaXMgbm90IHNldApDT05GSUdfUkVUUE9MSU5FPXkKQ09ORklHX1g4Nl9DUFVfUkVTQ1RS
TD15CkNPTkZJR19YODZfRVhURU5ERURfUExBVEZPUk09eQojIENPTkZJR19YODZfTlVNQUNISVAg
aXMgbm90IHNldAojIENPTkZJR19YODZfVlNNUCBpcyBub3Qgc2V0CkNPTkZJR19YODZfVVY9eQoj
IENPTkZJR19YODZfR09MREZJU0ggaXMgbm90IHNldAojIENPTkZJR19YODZfSU5URUxfTUlEIGlz
IG5vdCBzZXQKQ09ORklHX1g4Nl9JTlRFTF9MUFNTPXkKQ09ORklHX1g4Nl9BTURfUExBVEZPUk1f
REVWSUNFPXkKQ09ORklHX0lPU0ZfTUJJPXkKIyBDT05GSUdfSU9TRl9NQklfREVCVUcgaXMgbm90
IHNldApDT05GSUdfWDg2X1NVUFBPUlRTX01FTU9SWV9GQUlMVVJFPXkKQ09ORklHX1NDSEVEX09N
SVRfRlJBTUVfUE9JTlRFUj15CkNPTkZJR19IWVBFUlZJU09SX0dVRVNUPXkKQ09ORklHX1BBUkFW
SVJUPXkKIyBDT05GSUdfUEFSQVZJUlRfREVCVUcgaXMgbm90IHNldApDT05GSUdfUEFSQVZJUlRf
U1BJTkxPQ0tTPXkKQ09ORklHX1g4Nl9IVl9DQUxMQkFDS19WRUNUT1I9eQpDT05GSUdfWEVOPXkK
IyBDT05GSUdfWEVOX1BWIGlzIG5vdCBzZXQKQ09ORklHX1hFTl9QVkhWTT15CkNPTkZJR19YRU5f
UFZIVk1fU01QPXkKQ09ORklHX1hFTl9QVkhWTV9HVUVTVD15CkNPTkZJR19YRU5fU0FWRV9SRVNU
T1JFPXkKIyBDT05GSUdfWEVOX0RFQlVHX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfWEVOX1BWSCBp
cyBub3Qgc2V0CkNPTkZJR19LVk1fR1VFU1Q9eQpDT05GSUdfQVJDSF9DUFVJRExFX0hBTFRQT0xM
PXkKIyBDT05GSUdfUFZIIGlzIG5vdCBzZXQKQ09ORklHX1BBUkFWSVJUX1RJTUVfQUNDT1VOVElO
Rz15CkNPTkZJR19QQVJBVklSVF9DTE9DSz15CiMgQ09ORklHX0pBSUxIT1VTRV9HVUVTVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FDUk5fR1VFU1QgaXMgbm90IHNldAojIENPTkZJR19NSzggaXMgbm90
IHNldAojIENPTkZJR19NUFNDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUNPUkUyIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUFUT00gaXMgbm90IHNldApDT05GSUdfR0VORVJJQ19DUFU9eQpDT05GSUdfWDg2
X0lOVEVSTk9ERV9DQUNIRV9TSElGVD02CkNPTkZJR19YODZfTDFfQ0FDSEVfU0hJRlQ9NgpDT05G
SUdfWDg2X1RTQz15CkNPTkZJR19YODZfQ01QWENIRzY0PXkKQ09ORklHX1g4Nl9DTU9WPXkKQ09O
RklHX1g4Nl9NSU5JTVVNX0NQVV9GQU1JTFk9NjQKQ09ORklHX1g4Nl9ERUJVR0NUTE1TUj15CkNP
TkZJR19JQTMyX0ZFQVRfQ1RMPXkKQ09ORklHX1g4Nl9WTVhfRkVBVFVSRV9OQU1FUz15CkNPTkZJ
R19DUFVfU1VQX0lOVEVMPXkKQ09ORklHX0NQVV9TVVBfQU1EPXkKQ09ORklHX0NQVV9TVVBfSFlH
T049eQpDT05GSUdfQ1BVX1NVUF9DRU5UQVVSPXkKQ09ORklHX0NQVV9TVVBfWkhBT1hJTj15CkNP
TkZJR19IUEVUX1RJTUVSPXkKQ09ORklHX0hQRVRfRU1VTEFURV9SVEM9eQpDT05GSUdfRE1JPXkK
IyBDT05GSUdfR0FSVF9JT01NVSBpcyBub3Qgc2V0CkNPTkZJR19NQVhTTVA9eQpDT05GSUdfTlJf
Q1BVU19SQU5HRV9CRUdJTj04MTkyCkNPTkZJR19OUl9DUFVTX1JBTkdFX0VORD04MTkyCkNPTkZJ
R19OUl9DUFVTX0RFRkFVTFQ9ODE5MgpDT05GSUdfTlJfQ1BVUz04MTkyCkNPTkZJR19TQ0hFRF9T
TVQ9eQpDT05GSUdfU0NIRURfTUM9eQpDT05GSUdfU0NIRURfTUNfUFJJTz15CkNPTkZJR19YODZf
TE9DQUxfQVBJQz15CkNPTkZJR19YODZfSU9fQVBJQz15CkNPTkZJR19YODZfUkVST1VURV9GT1Jf
QlJPS0VOX0JPT1RfSVJRUz15CkNPTkZJR19YODZfTUNFPXkKQ09ORklHX1g4Nl9NQ0VMT0dfTEVH
QUNZPXkKQ09ORklHX1g4Nl9NQ0VfSU5URUw9eQpDT05GSUdfWDg2X01DRV9BTUQ9eQpDT05GSUdf
WDg2X01DRV9USFJFU0hPTEQ9eQpDT05GSUdfWDg2X01DRV9JTkpFQ1Q9bQoKIwojIFBlcmZvcm1h
bmNlIG1vbml0b3JpbmcKIwpDT05GSUdfUEVSRl9FVkVOVFNfSU5URUxfVU5DT1JFPW0KQ09ORklH
X1BFUkZfRVZFTlRTX0lOVEVMX1JBUEw9bQpDT05GSUdfUEVSRl9FVkVOVFNfSU5URUxfQ1NUQVRF
PW0KQ09ORklHX1BFUkZfRVZFTlRTX0FNRF9QT1dFUj1tCiMgZW5kIG9mIFBlcmZvcm1hbmNlIG1v
bml0b3JpbmcKCkNPTkZJR19YODZfMTZCSVQ9eQpDT05GSUdfWDg2X0VTUEZJWDY0PXkKQ09ORklH
X1g4Nl9WU1lTQ0FMTF9FTVVMQVRJT049eQpDT05GSUdfWDg2X0lPUExfSU9QRVJNPXkKQ09ORklH
X0k4Sz1tCkNPTkZJR19NSUNST0NPREU9eQpDT05GSUdfTUlDUk9DT0RFX0lOVEVMPXkKQ09ORklH
X01JQ1JPQ09ERV9BTUQ9eQpDT05GSUdfTUlDUk9DT0RFX09MRF9JTlRFUkZBQ0U9eQpDT05GSUdf
WDg2X01TUj15CkNPTkZJR19YODZfQ1BVSUQ9eQpDT05GSUdfWDg2XzVMRVZFTD15CkNPTkZJR19Y
ODZfRElSRUNUX0dCUEFHRVM9eQojIENPTkZJR19YODZfQ1BBX1NUQVRJU1RJQ1MgaXMgbm90IHNl
dApDT05GSUdfQU1EX01FTV9FTkNSWVBUPXkKIyBDT05GSUdfQU1EX01FTV9FTkNSWVBUX0FDVElW
RV9CWV9ERUZBVUxUIGlzIG5vdCBzZXQKQ09ORklHX05VTUE9eQpDT05GSUdfQU1EX05VTUE9eQpD
T05GSUdfWDg2XzY0X0FDUElfTlVNQT15CkNPTkZJR19OVU1BX0VNVT15CkNPTkZJR19OT0RFU19T
SElGVD0xMApDT05GSUdfQVJDSF9TUEFSU0VNRU1fRU5BQkxFPXkKQ09ORklHX0FSQ0hfU1BBUlNF
TUVNX0RFRkFVTFQ9eQpDT05GSUdfQVJDSF9TRUxFQ1RfTUVNT1JZX01PREVMPXkKIyBDT05GSUdf
QVJDSF9NRU1PUllfUFJPQkUgaXMgbm90IHNldApDT05GSUdfQVJDSF9QUk9DX0tDT1JFX1RFWFQ9
eQpDT05GSUdfSUxMRUdBTF9QT0lOVEVSX1ZBTFVFPTB4ZGVhZDAwMDAwMDAwMDAwMApDT05GSUdf
WDg2X1BNRU1fTEVHQUNZX0RFVklDRT15CkNPTkZJR19YODZfUE1FTV9MRUdBQ1k9bQpDT05GSUdf
WDg2X0NIRUNLX0JJT1NfQ09SUlVQVElPTj15CiMgQ09ORklHX1g4Nl9CT09UUEFSQU1fTUVNT1JZ
X0NPUlJVUFRJT05fQ0hFQ0sgaXMgbm90IHNldApDT05GSUdfWDg2X1JFU0VSVkVfTE9XPTY0CkNP
TkZJR19NVFJSPXkKQ09ORklHX01UUlJfU0FOSVRJWkVSPXkKQ09ORklHX01UUlJfU0FOSVRJWkVS
X0VOQUJMRV9ERUZBVUxUPTEKQ09ORklHX01UUlJfU0FOSVRJWkVSX1NQQVJFX1JFR19OUl9ERUZB
VUxUPTEKQ09ORklHX1g4Nl9QQVQ9eQpDT05GSUdfQVJDSF9VU0VTX1BHX1VOQ0FDSEVEPXkKQ09O
RklHX0FSQ0hfUkFORE9NPXkKQ09ORklHX1g4Nl9TTUFQPXkKQ09ORklHX1g4Nl9VTUlQPXkKQ09O
RklHX1g4Nl9JTlRFTF9NRU1PUllfUFJPVEVDVElPTl9LRVlTPXkKQ09ORklHX1g4Nl9JTlRFTF9U
U1hfTU9ERV9PRkY9eQojIENPTkZJR19YODZfSU5URUxfVFNYX01PREVfT04gaXMgbm90IHNldAoj
IENPTkZJR19YODZfSU5URUxfVFNYX01PREVfQVVUTyBpcyBub3Qgc2V0CiMgQ09ORklHX1g4Nl9T
R1ggaXMgbm90IHNldApDT05GSUdfRUZJPXkKQ09ORklHX0VGSV9TVFVCPXkKQ09ORklHX0VGSV9N
SVhFRD15CiMgQ09ORklHX0haXzEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0haXzI1MCBpcyBub3Qg
c2V0CiMgQ09ORklHX0haXzMwMCBpcyBub3Qgc2V0CkNPTkZJR19IWl8xMDAwPXkKQ09ORklHX0ha
PTEwMDAKQ09ORklHX1NDSEVEX0hSVElDSz15CkNPTkZJR19LRVhFQz15CkNPTkZJR19LRVhFQ19G
SUxFPXkKQ09ORklHX0FSQ0hfSEFTX0tFWEVDX1BVUkdBVE9SWT15CkNPTkZJR19LRVhFQ19TSUc9
eQojIENPTkZJR19LRVhFQ19TSUdfRk9SQ0UgaXMgbm90IHNldApDT05GSUdfS0VYRUNfQlpJTUFH
RV9WRVJJRllfU0lHPXkKQ09ORklHX0NSQVNIX0RVTVA9eQpDT05GSUdfS0VYRUNfSlVNUD15CkNP
TkZJR19QSFlTSUNBTF9TVEFSVD0weDEwMDAwMDAKQ09ORklHX1JFTE9DQVRBQkxFPXkKQ09ORklH
X1JBTkRPTUlaRV9CQVNFPXkKQ09ORklHX1g4Nl9ORUVEX1JFTE9DUz15CkNPTkZJR19QSFlTSUNB
TF9BTElHTj0weDIwMDAwMApDT05GSUdfRFlOQU1JQ19NRU1PUllfTEFZT1VUPXkKQ09ORklHX1JB
TkRPTUlaRV9NRU1PUlk9eQpDT05GSUdfUkFORE9NSVpFX01FTU9SWV9QSFlTSUNBTF9QQURESU5H
PTB4YQpDT05GSUdfSE9UUExVR19DUFU9eQpDT05GSUdfQk9PVFBBUkFNX0hPVFBMVUdfQ1BVMD15
CiMgQ09ORklHX0RFQlVHX0hPVFBMVUdfQ1BVMCBpcyBub3Qgc2V0CiMgQ09ORklHX0NPTVBBVF9W
RFNPIGlzIG5vdCBzZXQKQ09ORklHX0xFR0FDWV9WU1lTQ0FMTF9FTVVMQVRFPXkKIyBDT05GSUdf
TEVHQUNZX1ZTWVNDQUxMX1hPTkxZIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVHQUNZX1ZTWVNDQUxM
X05PTkUgaXMgbm90IHNldAojIENPTkZJR19DTURMSU5FX0JPT0wgaXMgbm90IHNldApDT05GSUdf
TU9ESUZZX0xEVF9TWVNDQUxMPXkKQ09ORklHX0hBVkVfTElWRVBBVENIPXkKQ09ORklHX0xJVkVQ
QVRDSD15CiMgZW5kIG9mIFByb2Nlc3NvciB0eXBlIGFuZCBmZWF0dXJlcwoKQ09ORklHX0FSQ0hf
SEFTX0FERF9QQUdFUz15CkNPTkZJR19BUkNIX0VOQUJMRV9NRU1PUllfSE9UUExVRz15CkNPTkZJ
R19BUkNIX0VOQUJMRV9NRU1PUllfSE9UUkVNT1ZFPXkKQ09ORklHX1VTRV9QRVJDUFVfTlVNQV9O
T0RFX0lEPXkKQ09ORklHX0FSQ0hfRU5BQkxFX1NQTElUX1BNRF9QVExPQ0s9eQpDT05GSUdfQVJD
SF9FTkFCTEVfSFVHRVBBR0VfTUlHUkFUSU9OPXkKQ09ORklHX0FSQ0hfRU5BQkxFX1RIUF9NSUdS
QVRJT049eQoKIwojIFBvd2VyIG1hbmFnZW1lbnQgYW5kIEFDUEkgb3B0aW9ucwojCkNPTkZJR19B
UkNIX0hJQkVSTkFUSU9OX0hFQURFUj15CkNPTkZJR19TVVNQRU5EPXkKQ09ORklHX1NVU1BFTkRf
RlJFRVpFUj15CkNPTkZJR19ISUJFUk5BVEVfQ0FMTEJBQ0tTPXkKQ09ORklHX0hJQkVSTkFUSU9O
PXkKQ09ORklHX0hJQkVSTkFUSU9OX1NOQVBTSE9UX0RFVj15CkNPTkZJR19QTV9TVERfUEFSVElU
SU9OPSIiCkNPTkZJR19QTV9TTEVFUD15CkNPTkZJR19QTV9TTEVFUF9TTVA9eQojIENPTkZJR19Q
TV9BVVRPU0xFRVAgaXMgbm90IHNldAojIENPTkZJR19QTV9XQUtFTE9DS1MgaXMgbm90IHNldApD
T05GSUdfUE09eQpDT05GSUdfUE1fREVCVUc9eQojIENPTkZJR19QTV9BRFZBTkNFRF9ERUJVRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1BNX1RFU1RfU1VTUEVORCBpcyBub3Qgc2V0CkNPTkZJR19QTV9T
TEVFUF9ERUJVRz15CiMgQ09ORklHX1BNX1RSQUNFX1JUQyBpcyBub3Qgc2V0CkNPTkZJR19QTV9D
TEs9eQpDT05GSUdfUE1fR0VORVJJQ19ET01BSU5TPXkKIyBDT05GSUdfV1FfUE9XRVJfRUZGSUNJ
RU5UX0RFRkFVTFQgaXMgbm90IHNldApDT05GSUdfUE1fR0VORVJJQ19ET01BSU5TX1NMRUVQPXkK
IyBDT05GSUdfRU5FUkdZX01PREVMIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfU1VQUE9SVFNfQUNQ
ST15CkNPTkZJR19BQ1BJPXkKQ09ORklHX0FDUElfTEVHQUNZX1RBQkxFU19MT09LVVA9eQpDT05G
SUdfQVJDSF9NSUdIVF9IQVZFX0FDUElfUERDPXkKQ09ORklHX0FDUElfU1lTVEVNX1BPV0VSX1NU
QVRFU19TVVBQT1JUPXkKIyBDT05GSUdfQUNQSV9ERUJVR0dFUiBpcyBub3Qgc2V0CkNPTkZJR19B
Q1BJX1NQQ1JfVEFCTEU9eQojIENPTkZJR19BQ1BJX0ZQRFQgaXMgbm90IHNldApDT05GSUdfQUNQ
SV9MUElUPXkKQ09ORklHX0FDUElfU0xFRVA9eQpDT05GSUdfQUNQSV9SRVZfT1ZFUlJJREVfUE9T
U0lCTEU9eQpDT05GSUdfQUNQSV9FQ19ERUJVR0ZTPW0KQ09ORklHX0FDUElfQUM9eQpDT05GSUdf
QUNQSV9CQVRURVJZPXkKQ09ORklHX0FDUElfQlVUVE9OPXkKQ09ORklHX0FDUElfVklERU89bQpD
T05GSUdfQUNQSV9GQU49eQpDT05GSUdfQUNQSV9UQUQ9bQpDT05GSUdfQUNQSV9ET0NLPXkKQ09O
RklHX0FDUElfQ1BVX0ZSRVFfUFNTPXkKQ09ORklHX0FDUElfUFJPQ0VTU09SX0NTVEFURT15CkNP
TkZJR19BQ1BJX1BST0NFU1NPUl9JRExFPXkKQ09ORklHX0FDUElfQ1BQQ19MSUI9eQpDT05GSUdf
QUNQSV9QUk9DRVNTT1I9eQpDT05GSUdfQUNQSV9JUE1JPW0KQ09ORklHX0FDUElfSE9UUExVR19D
UFU9eQpDT05GSUdfQUNQSV9QUk9DRVNTT1JfQUdHUkVHQVRPUj1tCkNPTkZJR19BQ1BJX1RIRVJN
QUw9eQpDT05GSUdfQUNQSV9QTEFURk9STV9QUk9GSUxFPW0KQ09ORklHX0FSQ0hfSEFTX0FDUElf
VEFCTEVfVVBHUkFERT15CkNPTkZJR19BQ1BJX1RBQkxFX1VQR1JBREU9eQojIENPTkZJR19BQ1BJ
X0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfUENJX1NMT1Q9eQpDT05GSUdfQUNQSV9DT05U
QUlORVI9eQpDT05GSUdfQUNQSV9IT1RQTFVHX01FTU9SWT15CkNPTkZJR19BQ1BJX0hPVFBMVUdf
SU9BUElDPXkKQ09ORklHX0FDUElfU0JTPW0KQ09ORklHX0FDUElfSEVEPXkKIyBDT05GSUdfQUNQ
SV9DVVNUT01fTUVUSE9EIGlzIG5vdCBzZXQKQ09ORklHX0FDUElfQkdSVD15CkNPTkZJR19BQ1BJ
X05GSVQ9bQojIENPTkZJR19ORklUX1NFQ1VSSVRZX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX0FD
UElfTlVNQT15CkNPTkZJR19BQ1BJX0hNQVQ9eQpDT05GSUdfSEFWRV9BQ1BJX0FQRUk9eQpDT05G
SUdfSEFWRV9BQ1BJX0FQRUlfTk1JPXkKQ09ORklHX0FDUElfQVBFST15CkNPTkZJR19BQ1BJX0FQ
RUlfR0hFUz15CkNPTkZJR19BQ1BJX0FQRUlfUENJRUFFUj15CkNPTkZJR19BQ1BJX0FQRUlfTUVN
T1JZX0ZBSUxVUkU9eQpDT05GSUdfQUNQSV9BUEVJX0VJTko9bQojIENPTkZJR19BQ1BJX0FQRUlf
RVJTVF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0FDUElfRFBURiBpcyBub3Qgc2V0CkNPTkZJ
R19BQ1BJX1dBVENIRE9HPXkKQ09ORklHX0FDUElfRVhUTE9HPW0KQ09ORklHX0FDUElfQURYTD15
CiMgQ09ORklHX0FDUElfQ09ORklHRlMgaXMgbm90IHNldApDT05GSUdfUE1JQ19PUFJFR0lPTj15
CkNPTkZJR19YODZfUE1fVElNRVI9eQoKIwojIENQVSBGcmVxdWVuY3kgc2NhbGluZwojCkNPTkZJ
R19DUFVfRlJFUT15CkNPTkZJR19DUFVfRlJFUV9HT1ZfQVRUUl9TRVQ9eQpDT05GSUdfQ1BVX0ZS
RVFfR09WX0NPTU1PTj15CkNPTkZJR19DUFVfRlJFUV9TVEFUPXkKQ09ORklHX0NQVV9GUkVRX0RF
RkFVTFRfR09WX1BFUkZPUk1BTkNFPXkKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfUE9X
RVJTQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfVVNFUlNQQUNF
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0ZSRVFfREVGQVVMVF9HT1ZfU0NIRURVVElMIGlzIG5v
dCBzZXQKQ09ORklHX0NQVV9GUkVRX0dPVl9QRVJGT1JNQU5DRT15CkNPTkZJR19DUFVfRlJFUV9H
T1ZfUE9XRVJTQVZFPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9VU0VSU1BBQ0U9eQpDT05GSUdfQ1BV
X0ZSRVFfR09WX09OREVNQU5EPXkKQ09ORklHX0NQVV9GUkVRX0dPVl9DT05TRVJWQVRJVkU9eQpD
T05GSUdfQ1BVX0ZSRVFfR09WX1NDSEVEVVRJTD15CgojCiMgQ1BVIGZyZXF1ZW5jeSBzY2FsaW5n
IGRyaXZlcnMKIwpDT05GSUdfWDg2X0lOVEVMX1BTVEFURT15CiMgQ09ORklHX1g4Nl9QQ0NfQ1BV
RlJFUSBpcyBub3Qgc2V0CkNPTkZJR19YODZfQUNQSV9DUFVGUkVRPW0KQ09ORklHX1g4Nl9BQ1BJ
X0NQVUZSRVFfQ1BCPXkKQ09ORklHX1g4Nl9QT1dFUk5PV19LOD1tCkNPTkZJR19YODZfQU1EX0ZS
RVFfU0VOU0lUSVZJVFk9bQojIENPTkZJR19YODZfU1BFRURTVEVQX0NFTlRSSU5PIGlzIG5vdCBz
ZXQKQ09ORklHX1g4Nl9QNF9DTE9DS01PRD1tCgojCiMgc2hhcmVkIG9wdGlvbnMKIwpDT05GSUdf
WDg2X1NQRUVEU1RFUF9MSUI9bQojIGVuZCBvZiBDUFUgRnJlcXVlbmN5IHNjYWxpbmcKCiMKIyBD
UFUgSWRsZQojCkNPTkZJR19DUFVfSURMRT15CiMgQ09ORklHX0NQVV9JRExFX0dPVl9MQURERVIg
aXMgbm90IHNldApDT05GSUdfQ1BVX0lETEVfR09WX01FTlU9eQojIENPTkZJR19DUFVfSURMRV9H
T1ZfVEVPIGlzIG5vdCBzZXQKQ09ORklHX0NQVV9JRExFX0dPVl9IQUxUUE9MTD15CkNPTkZJR19I
QUxUUE9MTF9DUFVJRExFPW0KIyBlbmQgb2YgQ1BVIElkbGUKCkNPTkZJR19JTlRFTF9JRExFPXkK
IyBlbmQgb2YgUG93ZXIgbWFuYWdlbWVudCBhbmQgQUNQSSBvcHRpb25zCgojCiMgQnVzIG9wdGlv
bnMgKFBDSSBldGMuKQojCkNPTkZJR19QQ0lfRElSRUNUPXkKQ09ORklHX1BDSV9NTUNPTkZJRz15
CkNPTkZJR19QQ0lfWEVOPXkKQ09ORklHX01NQ09ORl9GQU0xMEg9eQpDT05GSUdfSVNBX0RNQV9B
UEk9eQpDT05GSUdfQU1EX05CPXkKIyBDT05GSUdfWDg2X1NZU0ZCIGlzIG5vdCBzZXQKIyBlbmQg
b2YgQnVzIG9wdGlvbnMgKFBDSSBldGMuKQoKIwojIEJpbmFyeSBFbXVsYXRpb25zCiMKQ09ORklH
X0lBMzJfRU1VTEFUSU9OPXkKIyBDT05GSUdfWDg2X1gzMiBpcyBub3Qgc2V0CkNPTkZJR19DT01Q
QVRfMzI9eQpDT05GSUdfQ09NUEFUPXkKQ09ORklHX0NPTVBBVF9GT1JfVTY0X0FMSUdOTUVOVD15
CkNPTkZJR19TWVNWSVBDX0NPTVBBVD15CiMgZW5kIG9mIEJpbmFyeSBFbXVsYXRpb25zCgojCiMg
RmlybXdhcmUgRHJpdmVycwojCkNPTkZJR19FREQ9bQojIENPTkZJR19FRERfT0ZGIGlzIG5vdCBz
ZXQKQ09ORklHX0ZJUk1XQVJFX01FTU1BUD15CkNPTkZJR19ETUlJRD15CkNPTkZJR19ETUlfU1lT
RlM9eQpDT05GSUdfRE1JX1NDQU5fTUFDSElORV9OT05fRUZJX0ZBTExCQUNLPXkKQ09ORklHX0lT
Q1NJX0lCRlRfRklORD15CkNPTkZJR19JU0NTSV9JQkZUPW0KQ09ORklHX0ZXX0NGR19TWVNGUz15
CiMgQ09ORklHX0ZXX0NGR19TWVNGU19DTURMSU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfR09PR0xF
X0ZJUk1XQVJFIGlzIG5vdCBzZXQKCiMKIyBFRkkgKEV4dGVuc2libGUgRmlybXdhcmUgSW50ZXJm
YWNlKSBTdXBwb3J0CiMKQ09ORklHX0VGSV9WQVJTPXkKQ09ORklHX0VGSV9FU1JUPXkKQ09ORklH
X0VGSV9WQVJTX1BTVE9SRT15CkNPTkZJR19FRklfVkFSU19QU1RPUkVfREVGQVVMVF9ESVNBQkxF
PXkKQ09ORklHX0VGSV9SVU5USU1FX01BUD15CiMgQ09ORklHX0VGSV9GQUtFX01FTU1BUCBpcyBu
b3Qgc2V0CkNPTkZJR19FRklfU09GVF9SRVNFUlZFPXkKQ09ORklHX0VGSV9SVU5USU1FX1dSQVBQ
RVJTPXkKQ09ORklHX0VGSV9HRU5FUklDX1NUVUJfSU5JVFJEX0NNRExJTkVfTE9BREVSPXkKIyBD
T05GSUdfRUZJX0JPT1RMT0FERVJfQ09OVFJPTCBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9DQVBT
VUxFX0xPQURFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0VGSV9URVNUIGlzIG5vdCBzZXQKQ09ORklH
X0FQUExFX1BST1BFUlRJRVM9eQojIENPTkZJR19SRVNFVF9BVFRBQ0tfTUlUSUdBVElPTiBpcyBu
b3Qgc2V0CkNPTkZJR19FRklfUkNJMl9UQUJMRT15CiMgQ09ORklHX0VGSV9ESVNBQkxFX1BDSV9E
TUEgaXMgbm90IHNldAojIGVuZCBvZiBFRkkgKEV4dGVuc2libGUgRmlybXdhcmUgSW50ZXJmYWNl
KSBTdXBwb3J0CgpDT05GSUdfVUVGSV9DUEVSPXkKQ09ORklHX1VFRklfQ1BFUl9YODY9eQpDT05G
SUdfRUZJX0RFVl9QQVRIX1BBUlNFUj15CkNPTkZJR19FRklfRUFSTFlDT049eQpDT05GSUdfRUZJ
X0NVU1RPTV9TU0RUX09WRVJMQVlTPXkKCiMKIyBUZWdyYSBmaXJtd2FyZSBkcml2ZXIKIwojIGVu
ZCBvZiBUZWdyYSBmaXJtd2FyZSBkcml2ZXIKIyBlbmQgb2YgRmlybXdhcmUgRHJpdmVycwoKQ09O
RklHX0hBVkVfS1ZNPXkKQ09ORklHX0hBVkVfS1ZNX0lSUUNISVA9eQpDT05GSUdfSEFWRV9LVk1f
SVJRRkQ9eQpDT05GSUdfSEFWRV9LVk1fSVJRX1JPVVRJTkc9eQpDT05GSUdfSEFWRV9LVk1fRVZF
TlRGRD15CkNPTkZJR19LVk1fTU1JTz15CkNPTkZJR19LVk1fQVNZTkNfUEY9eQpDT05GSUdfSEFW
RV9LVk1fTVNJPXkKQ09ORklHX0hBVkVfS1ZNX0NQVV9SRUxBWF9JTlRFUkNFUFQ9eQpDT05GSUdf
S1ZNX1ZGSU89eQpDT05GSUdfS1ZNX0dFTkVSSUNfRElSVFlMT0dfUkVBRF9QUk9URUNUPXkKQ09O
RklHX0tWTV9DT01QQVQ9eQpDT05GSUdfSEFWRV9LVk1fSVJRX0JZUEFTUz15CkNPTkZJR19IQVZF
X0tWTV9OT19QT0xMPXkKQ09ORklHX0tWTV9YRkVSX1RPX0dVRVNUX1dPUks9eQpDT05GSUdfVklS
VFVBTElaQVRJT049eQpDT05GSUdfS1ZNPW0KQ09ORklHX0tWTV9JTlRFTD1tCkNPTkZJR19LVk1f
QU1EPW0KQ09ORklHX0tWTV9BTURfU0VWPXkKIyBDT05GSUdfS1ZNX1hFTiBpcyBub3Qgc2V0CkNP
TkZJR19LVk1fTU1VX0FVRElUPXkKQ09ORklHX0FTX0FWWDUxMj15CkNPTkZJR19BU19TSEExX05J
PXkKQ09ORklHX0FTX1NIQTI1Nl9OST15CgojCiMgR2VuZXJhbCBhcmNoaXRlY3R1cmUtZGVwZW5k
ZW50IG9wdGlvbnMKIwpDT05GSUdfQ1JBU0hfQ09SRT15CkNPTkZJR19LRVhFQ19DT1JFPXkKQ09O
RklHX0hPVFBMVUdfU01UPXkKQ09ORklHX0dFTkVSSUNfRU5UUlk9eQpDT05GSUdfS1BST0JFUz15
CkNPTkZJR19KVU1QX0xBQkVMPXkKIyBDT05GSUdfU1RBVElDX0tFWVNfU0VMRlRFU1QgaXMgbm90
IHNldAojIENPTkZJR19TVEFUSUNfQ0FMTF9TRUxGVEVTVCBpcyBub3Qgc2V0CkNPTkZJR19PUFRQ
Uk9CRVM9eQpDT05GSUdfS1BST0JFU19PTl9GVFJBQ0U9eQpDT05GSUdfVVBST0JFUz15CkNPTkZJ
R19IQVZFX0VGRklDSUVOVF9VTkFMSUdORURfQUNDRVNTPXkKQ09ORklHX0FSQ0hfVVNFX0JVSUxU
SU5fQlNXQVA9eQpDT05GSUdfS1JFVFBST0JFUz15CkNPTkZJR19VU0VSX1JFVFVSTl9OT1RJRklF
Uj15CkNPTkZJR19IQVZFX0lPUkVNQVBfUFJPVD15CkNPTkZJR19IQVZFX0tQUk9CRVM9eQpDT05G
SUdfSEFWRV9LUkVUUFJPQkVTPXkKQ09ORklHX0hBVkVfT1BUUFJPQkVTPXkKQ09ORklHX0hBVkVf
S1BST0JFU19PTl9GVFJBQ0U9eQpDT05GSUdfSEFWRV9GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT049
eQpDT05GSUdfSEFWRV9OTUk9eQpDT05GSUdfSEFWRV9BUkNIX1RSQUNFSE9PSz15CkNPTkZJR19I
QVZFX0RNQV9DT05USUdVT1VTPXkKQ09ORklHX0dFTkVSSUNfU01QX0lETEVfVEhSRUFEPXkKQ09O
RklHX0FSQ0hfSEFTX0ZPUlRJRllfU09VUkNFPXkKQ09ORklHX0FSQ0hfSEFTX1NFVF9NRU1PUlk9
eQpDT05GSUdfQVJDSF9IQVNfU0VUX0RJUkVDVF9NQVA9eQpDT05GSUdfSEFWRV9BUkNIX1RIUkVB
RF9TVFJVQ1RfV0hJVEVMSVNUPXkKQ09ORklHX0FSQ0hfV0FOVFNfRFlOQU1JQ19UQVNLX1NUUlVD
VD15CkNPTkZJR19IQVZFX0FTTV9NT0RWRVJTSU9OUz15CkNPTkZJR19IQVZFX1JFR1NfQU5EX1NU
QUNLX0FDQ0VTU19BUEk9eQpDT05GSUdfSEFWRV9SU0VRPXkKQ09ORklHX0hBVkVfRlVOQ1RJT05f
QVJHX0FDQ0VTU19BUEk9eQpDT05GSUdfSEFWRV9IV19CUkVBS1BPSU5UPXkKQ09ORklHX0hBVkVf
TUlYRURfQlJFQUtQT0lOVFNfUkVHUz15CkNPTkZJR19IQVZFX1VTRVJfUkVUVVJOX05PVElGSUVS
PXkKQ09ORklHX0hBVkVfUEVSRl9FVkVOVFNfTk1JPXkKQ09ORklHX0hBVkVfSEFSRExPQ0tVUF9E
RVRFQ1RPUl9QRVJGPXkKQ09ORklHX0hBVkVfUEVSRl9SRUdTPXkKQ09ORklHX0hBVkVfUEVSRl9V
U0VSX1NUQUNLX0RVTVA9eQpDT05GSUdfSEFWRV9BUkNIX0pVTVBfTEFCRUw9eQpDT05GSUdfSEFW
RV9BUkNIX0pVTVBfTEFCRUxfUkVMQVRJVkU9eQpDT05GSUdfTU1VX0dBVEhFUl9UQUJMRV9GUkVF
PXkKQ09ORklHX01NVV9HQVRIRVJfUkNVX1RBQkxFX0ZSRUU9eQpDT05GSUdfQVJDSF9IQVZFX05N
SV9TQUZFX0NNUFhDSEc9eQpDT05GSUdfSEFWRV9BTElHTkVEX1NUUlVDVF9QQUdFPXkKQ09ORklH
X0hBVkVfQ01QWENIR19MT0NBTD15CkNPTkZJR19IQVZFX0NNUFhDSEdfRE9VQkxFPXkKQ09ORklH
X0FSQ0hfV0FOVF9DT01QQVRfSVBDX1BBUlNFX1ZFUlNJT049eQpDT05GSUdfQVJDSF9XQU5UX09M
RF9DT01QQVRfSVBDPXkKQ09ORklHX0hBVkVfQVJDSF9TRUNDT01QPXkKQ09ORklHX0hBVkVfQVJD
SF9TRUNDT01QX0ZJTFRFUj15CkNPTkZJR19TRUNDT01QPXkKQ09ORklHX1NFQ0NPTVBfRklMVEVS
PXkKIyBDT05GSUdfU0VDQ09NUF9DQUNIRV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FS
Q0hfU1RBQ0tMRUFLPXkKQ09ORklHX0hBVkVfU1RBQ0tQUk9URUNUT1I9eQpDT05GSUdfU1RBQ0tQ
Uk9URUNUT1I9eQpDT05GSUdfU1RBQ0tQUk9URUNUT1JfU1RST05HPXkKQ09ORklHX0FSQ0hfU1VQ
UE9SVFNfTFRPX0NMQU5HPXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfTFRPX0NMQU5HX1RISU49eQpD
T05GSUdfTFRPX05PTkU9eQpDT05GSUdfSEFWRV9BUkNIX1dJVEhJTl9TVEFDS19GUkFNRVM9eQpD
T05GSUdfSEFWRV9DT05URVhUX1RSQUNLSU5HPXkKQ09ORklHX0hBVkVfQ09OVEVYVF9UUkFDS0lO
R19PRkZTVEFDSz15CkNPTkZJR19IQVZFX1ZJUlRfQ1BVX0FDQ09VTlRJTkdfR0VOPXkKQ09ORklH
X0hBVkVfSVJRX1RJTUVfQUNDT1VOVElORz15CkNPTkZJR19IQVZFX01PVkVfUFVEPXkKQ09ORklH
X0hBVkVfTU9WRV9QTUQ9eQpDT05GSUdfSEFWRV9BUkNIX1RSQU5TUEFSRU5UX0hVR0VQQUdFPXkK
Q09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQ9eQpDT05GSUdfSEFWRV9B
UkNIX0hVR0VfVk1BUD15CkNPTkZJR19BUkNIX1dBTlRfSFVHRV9QTURfU0hBUkU9eQpDT05GSUdf
SEFWRV9BUkNIX1NPRlRfRElSVFk9eQpDT05GSUdfSEFWRV9NT0RfQVJDSF9TUEVDSUZJQz15CkNP
TkZJR19NT0RVTEVTX1VTRV9FTEZfUkVMQT15CkNPTkZJR19IQVZFX0lSUV9FWElUX09OX0lSUV9T
VEFDSz15CkNPTkZJR19IQVZFX1NPRlRJUlFfT05fT1dOX1NUQUNLPXkKQ09ORklHX0FSQ0hfSEFT
X0VMRl9SQU5ET01JWkU9eQpDT05GSUdfSEFWRV9BUkNIX01NQVBfUk5EX0JJVFM9eQpDT05GSUdf
SEFWRV9FWElUX1RIUkVBRD15CkNPTkZJR19BUkNIX01NQVBfUk5EX0JJVFM9MjgKQ09ORklHX0hB
VkVfQVJDSF9NTUFQX1JORF9DT01QQVRfQklUUz15CkNPTkZJR19BUkNIX01NQVBfUk5EX0NPTVBB
VF9CSVRTPTgKQ09ORklHX0hBVkVfQVJDSF9DT01QQVRfTU1BUF9CQVNFUz15CkNPTkZJR19IQVZF
X1NUQUNLX1ZBTElEQVRJT049eQpDT05GSUdfSEFWRV9SRUxJQUJMRV9TVEFDS1RSQUNFPXkKQ09O
RklHX09MRF9TSUdTVVNQRU5EMz15CkNPTkZJR19DT01QQVRfT0xEX1NJR0FDVElPTj15CkNPTkZJ
R19DT01QQVRfMzJCSVRfVElNRT15CkNPTkZJR19IQVZFX0FSQ0hfVk1BUF9TVEFDSz15CkNPTkZJ
R19WTUFQX1NUQUNLPXkKQ09ORklHX0FSQ0hfSEFTX1NUUklDVF9LRVJORUxfUldYPXkKQ09ORklH
X1NUUklDVF9LRVJORUxfUldYPXkKQ09ORklHX0FSQ0hfSEFTX1NUUklDVF9NT0RVTEVfUldYPXkK
Q09ORklHX1NUUklDVF9NT0RVTEVfUldYPXkKQ09ORklHX0hBVkVfQVJDSF9QUkVMMzJfUkVMT0NB
VElPTlM9eQpDT05GSUdfQVJDSF9VU0VfTUVNUkVNQVBfUFJPVD15CiMgQ09ORklHX0xPQ0tfRVZF
TlRfQ09VTlRTIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX01FTV9FTkNSWVBUPXkKQ09ORklH
X0hBVkVfU1RBVElDX0NBTEw9eQpDT05GSUdfSEFWRV9TVEFUSUNfQ0FMTF9JTkxJTkU9eQpDT05G
SUdfSEFWRV9QUkVFTVBUX0RZTkFNSUM9eQpDT05GSUdfQVJDSF9XQU5UX0xEX09SUEhBTl9XQVJO
PXkKQ09ORklHX0FSQ0hfU1VQUE9SVFNfREVCVUdfUEFHRUFMTE9DPXkKQ09ORklHX0FSQ0hfSEFT
X0VMRkNPUkVfQ09NUEFUPXkKCiMKIyBHQ09WLWJhc2VkIGtlcm5lbCBwcm9maWxpbmcKIwojIENP
TkZJR19HQ09WX0tFUk5FTCBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19HQ09WX1BST0ZJTEVf
QUxMPXkKIyBlbmQgb2YgR0NPVi1iYXNlZCBrZXJuZWwgcHJvZmlsaW5nCgpDT05GSUdfSEFWRV9H
Q0NfUExVR0lOUz15CiMgZW5kIG9mIEdlbmVyYWwgYXJjaGl0ZWN0dXJlLWRlcGVuZGVudCBvcHRp
b25zCgpDT05GSUdfUlRfTVVURVhFUz15CkNPTkZJR19CQVNFX1NNQUxMPTAKQ09ORklHX01PRFVM
RV9TSUdfRk9STUFUPXkKQ09ORklHX01PRFVMRVM9eQpDT05GSUdfTU9EVUxFX0ZPUkNFX0xPQUQ9
eQpDT05GSUdfTU9EVUxFX1VOTE9BRD15CiMgQ09ORklHX01PRFVMRV9GT1JDRV9VTkxPQUQgaXMg
bm90IHNldApDT05GSUdfTU9EVkVSU0lPTlM9eQpDT05GSUdfQVNNX01PRFZFUlNJT05TPXkKQ09O
RklHX01PRFVMRV9TUkNWRVJTSU9OX0FMTD15CkNPTkZJR19NT0RVTEVfU0lHPXkKIyBDT05GSUdf
TU9EVUxFX1NJR19GT1JDRSBpcyBub3Qgc2V0CkNPTkZJR19NT0RVTEVfU0lHX0FMTD15CiMgQ09O
RklHX01PRFVMRV9TSUdfU0hBMSBpcyBub3Qgc2V0CiMgQ09ORklHX01PRFVMRV9TSUdfU0hBMjI0
IGlzIG5vdCBzZXQKQ09ORklHX01PRFVMRV9TSUdfU0hBMjU2PXkKIyBDT05GSUdfTU9EVUxFX1NJ
R19TSEEzODQgaXMgbm90IHNldAojIENPTkZJR19NT0RVTEVfU0lHX1NIQTUxMiBpcyBub3Qgc2V0
CkNPTkZJR19NT0RVTEVfU0lHX0hBU0g9InNoYTI1NiIKIyBDT05GSUdfTU9EVUxFX0NPTVBSRVNT
IGlzIG5vdCBzZXQKIyBDT05GSUdfTU9EVUxFX0FMTE9XX01JU1NJTkdfTkFNRVNQQUNFX0lNUE9S
VFMgaXMgbm90IHNldApDT05GSUdfTU9EVUxFU19UUkVFX0xPT0tVUD15CkNPTkZJR19CTE9DSz15
CkNPTkZJR19CTEtfU0NTSV9SRVFVRVNUPXkKQ09ORklHX0JMS19DR1JPVVBfUldTVEFUPXkKQ09O
RklHX0JMS19ERVZfQlNHPXkKQ09ORklHX0JMS19ERVZfQlNHTElCPXkKQ09ORklHX0JMS19ERVZf
SU5URUdSSVRZPXkKQ09ORklHX0JMS19ERVZfSU5URUdSSVRZX1QxMD1tCiMgQ09ORklHX0JMS19E
RVZfWk9ORUQgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9USFJPVFRMSU5HPXkKIyBDT05GSUdf
QkxLX0RFVl9USFJPVFRMSU5HX0xPVyBpcyBub3Qgc2V0CiMgQ09ORklHX0JMS19DTURMSU5FX1BB
UlNFUiBpcyBub3Qgc2V0CkNPTkZJR19CTEtfV0JUPXkKQ09ORklHX0JMS19DR1JPVVBfSU9MQVRF
TkNZPXkKIyBDT05GSUdfQkxLX0NHUk9VUF9JT0NPU1QgaXMgbm90IHNldApDT05GSUdfQkxLX1dC
VF9NUT15CkNPTkZJR19CTEtfREVCVUdfRlM9eQojIENPTkZJR19CTEtfU0VEX09QQUwgaXMgbm90
IHNldAojIENPTkZJR19CTEtfSU5MSU5FX0VOQ1JZUFRJT04gaXMgbm90IHNldAoKIwojIFBhcnRp
dGlvbiBUeXBlcwojCkNPTkZJR19QQVJUSVRJT05fQURWQU5DRUQ9eQojIENPTkZJR19BQ09STl9Q
QVJUSVRJT04gaXMgbm90IHNldAojIENPTkZJR19BSVhfUEFSVElUSU9OIGlzIG5vdCBzZXQKQ09O
RklHX09TRl9QQVJUSVRJT049eQpDT05GSUdfQU1JR0FfUEFSVElUSU9OPXkKIyBDT05GSUdfQVRB
UklfUEFSVElUSU9OIGlzIG5vdCBzZXQKQ09ORklHX01BQ19QQVJUSVRJT049eQpDT05GSUdfTVNE
T1NfUEFSVElUSU9OPXkKQ09ORklHX0JTRF9ESVNLTEFCRUw9eQpDT05GSUdfTUlOSVhfU1VCUEFS
VElUSU9OPXkKQ09ORklHX1NPTEFSSVNfWDg2X1BBUlRJVElPTj15CkNPTkZJR19VTklYV0FSRV9E
SVNLTEFCRUw9eQojIENPTkZJR19MRE1fUEFSVElUSU9OIGlzIG5vdCBzZXQKQ09ORklHX1NHSV9Q
QVJUSVRJT049eQojIENPTkZJR19VTFRSSVhfUEFSVElUSU9OIGlzIG5vdCBzZXQKQ09ORklHX1NV
Tl9QQVJUSVRJT049eQpDT05GSUdfS0FSTUFfUEFSVElUSU9OPXkKQ09ORklHX0VGSV9QQVJUSVRJ
T049eQojIENPTkZJR19TWVNWNjhfUEFSVElUSU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQ01ETElO
RV9QQVJUSVRJT04gaXMgbm90IHNldAojIGVuZCBvZiBQYXJ0aXRpb24gVHlwZXMKCkNPTkZJR19C
TE9DS19DT01QQVQ9eQpDT05GSUdfQkxLX01RX1BDST15CkNPTkZJR19CTEtfTVFfVklSVElPPXkK
Q09ORklHX0JMS19NUV9SRE1BPXkKQ09ORklHX0JMS19QTT15CgojCiMgSU8gU2NoZWR1bGVycwoj
CkNPTkZJR19NUV9JT1NDSEVEX0RFQURMSU5FPXkKQ09ORklHX01RX0lPU0NIRURfS1lCRVI9eQpD
T05GSUdfSU9TQ0hFRF9CRlE9eQpDT05GSUdfQkZRX0dST1VQX0lPU0NIRUQ9eQojIENPTkZJR19C
RlFfQ0dST1VQX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgSU8gU2NoZWR1bGVycwoKQ09ORklH
X1BSRUVNUFRfTk9USUZJRVJTPXkKQ09ORklHX1BBREFUQT15CkNPTkZJR19BU04xPXkKQ09ORklH
X0lOTElORV9TUElOX1VOTE9DS19JUlE9eQpDT05GSUdfSU5MSU5FX1JFQURfVU5MT0NLPXkKQ09O
RklHX0lOTElORV9SRUFEX1VOTE9DS19JUlE9eQpDT05GSUdfSU5MSU5FX1dSSVRFX1VOTE9DSz15
CkNPTkZJR19JTkxJTkVfV1JJVEVfVU5MT0NLX0lSUT15CkNPTkZJR19BUkNIX1NVUFBPUlRTX0FU
T01JQ19STVc9eQpDT05GSUdfTVVURVhfU1BJTl9PTl9PV05FUj15CkNPTkZJR19SV1NFTV9TUElO
X09OX09XTkVSPXkKQ09ORklHX0xPQ0tfU1BJTl9PTl9PV05FUj15CkNPTkZJR19BUkNIX1VTRV9R
VUVVRURfU1BJTkxPQ0tTPXkKQ09ORklHX1FVRVVFRF9TUElOTE9DS1M9eQpDT05GSUdfQVJDSF9V
U0VfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfUVVFVUVEX1JXTE9DS1M9eQpDT05GSUdfQVJDSF9I
QVNfTk9OX09WRVJMQVBQSU5HX0FERFJFU1NfU1BBQ0U9eQpDT05GSUdfQVJDSF9IQVNfU1lOQ19D
T1JFX0JFRk9SRV9VU0VSTU9ERT15CkNPTkZJR19BUkNIX0hBU19TWVNDQUxMX1dSQVBQRVI9eQpD
T05GSUdfRlJFRVpFUj15CgojCiMgRXhlY3V0YWJsZSBmaWxlIGZvcm1hdHMKIwpDT05GSUdfQklO
Rk1UX0VMRj15CkNPTkZJR19DT01QQVRfQklORk1UX0VMRj15CkNPTkZJR19FTEZDT1JFPXkKQ09O
RklHX0NPUkVfRFVNUF9ERUZBVUxUX0VMRl9IRUFERVJTPXkKQ09ORklHX0JJTkZNVF9TQ1JJUFQ9
eQpDT05GSUdfQklORk1UX01JU0M9bQpDT05GSUdfQ09SRURVTVA9eQojIGVuZCBvZiBFeGVjdXRh
YmxlIGZpbGUgZm9ybWF0cwoKIwojIE1lbW9yeSBNYW5hZ2VtZW50IG9wdGlvbnMKIwpDT05GSUdf
U0VMRUNUX01FTU9SWV9NT0RFTD15CkNPTkZJR19TUEFSU0VNRU1fTUFOVUFMPXkKQ09ORklHX1NQ
QVJTRU1FTT15CkNPTkZJR19ORUVEX01VTFRJUExFX05PREVTPXkKQ09ORklHX1NQQVJTRU1FTV9F
WFRSRU1FPXkKQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQX0VOQUJMRT15CkNPTkZJR19TUEFSU0VN
RU1fVk1FTU1BUD15CkNPTkZJR19IQVZFX0ZBU1RfR1VQPXkKQ09ORklHX05VTUFfS0VFUF9NRU1J
TkZPPXkKQ09ORklHX01FTU9SWV9JU09MQVRJT049eQpDT05GSUdfSEFWRV9CT09UTUVNX0lORk9f
Tk9ERT15CkNPTkZJR19NRU1PUllfSE9UUExVRz15CkNPTkZJR19NRU1PUllfSE9UUExVR19TUEFS
U0U9eQojIENPTkZJR19NRU1PUllfSE9UUExVR19ERUZBVUxUX09OTElORSBpcyBub3Qgc2V0CkNP
TkZJR19NRU1PUllfSE9UUkVNT1ZFPXkKQ09ORklHX1NQTElUX1BUTE9DS19DUFVTPTQKQ09ORklH
X01FTU9SWV9CQUxMT09OPXkKQ09ORklHX0JBTExPT05fQ09NUEFDVElPTj15CkNPTkZJR19DT01Q
QUNUSU9OPXkKQ09ORklHX1BBR0VfUkVQT1JUSU5HPXkKQ09ORklHX01JR1JBVElPTj15CkNPTkZJ
R19DT05USUdfQUxMT0M9eQpDT05GSUdfUEhZU19BRERSX1RfNjRCSVQ9eQpDT05GSUdfQk9VTkNF
PXkKQ09ORklHX1ZJUlRfVE9fQlVTPXkKQ09ORklHX01NVV9OT1RJRklFUj15CkNPTkZJR19LU009
eQpDT05GSUdfREVGQVVMVF9NTUFQX01JTl9BRERSPTQwOTYKQ09ORklHX0FSQ0hfU1VQUE9SVFNf
TUVNT1JZX0ZBSUxVUkU9eQpDT05GSUdfTUVNT1JZX0ZBSUxVUkU9eQpDT05GSUdfSFdQT0lTT05f
SU5KRUNUPW0KQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFPXkKQ09ORklHX1RSQU5TUEFSRU5U
X0hVR0VQQUdFX0FMV0FZUz15CiMgQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFX01BRFZJU0Ug
aXMgbm90IHNldApDT05GSUdfQVJDSF9XQU5UU19USFBfU1dBUD15CkNPTkZJR19USFBfU1dBUD15
CkNPTkZJR19DTEVBTkNBQ0hFPXkKQ09ORklHX0ZST05UU1dBUD15CiMgQ09ORklHX0NNQSBpcyBu
b3Qgc2V0CkNPTkZJR19NRU1fU09GVF9ESVJUWT15CkNPTkZJR19aU1dBUD15CiMgQ09ORklHX1pT
V0FQX0NPTVBSRVNTT1JfREVGQVVMVF9ERUZMQVRFIGlzIG5vdCBzZXQKQ09ORklHX1pTV0FQX0NP
TVBSRVNTT1JfREVGQVVMVF9MWk89eQojIENPTkZJR19aU1dBUF9DT01QUkVTU09SX0RFRkFVTFRf
ODQyIGlzIG5vdCBzZXQKIyBDT05GSUdfWlNXQVBfQ09NUFJFU1NPUl9ERUZBVUxUX0xaNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF9MWjRIQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVF9aU1REIGlzIG5vdCBzZXQKQ09ORklH
X1pTV0FQX0NPTVBSRVNTT1JfREVGQVVMVD0ibHpvIgpDT05GSUdfWlNXQVBfWlBPT0xfREVGQVVM
VF9aQlVEPXkKIyBDT05GSUdfWlNXQVBfWlBPT0xfREVGQVVMVF9aM0ZPTEQgaXMgbm90IHNldAoj
IENPTkZJR19aU1dBUF9aUE9PTF9ERUZBVUxUX1pTTUFMTE9DIGlzIG5vdCBzZXQKQ09ORklHX1pT
V0FQX1pQT09MX0RFRkFVTFQ9InpidWQiCiMgQ09ORklHX1pTV0FQX0RFRkFVTFRfT04gaXMgbm90
IHNldApDT05GSUdfWlBPT0w9eQpDT05GSUdfWkJVRD15CiMgQ09ORklHX1ozRk9MRCBpcyBub3Qg
c2V0CkNPTkZJR19aU01BTExPQz15CkNPTkZJR19aU01BTExPQ19TVEFUPXkKQ09ORklHX0dFTkVS
SUNfRUFSTFlfSU9SRU1BUD15CkNPTkZJR19ERUZFUlJFRF9TVFJVQ1RfUEFHRV9JTklUPXkKQ09O
RklHX0lETEVfUEFHRV9UUkFDS0lORz15CkNPTkZJR19BUkNIX0hBU19QVEVfREVWTUFQPXkKQ09O
RklHX1pPTkVfREVWSUNFPXkKQ09ORklHX0RFVl9QQUdFTUFQX09QUz15CkNPTkZJR19ITU1fTUlS
Uk9SPXkKQ09ORklHX0RFVklDRV9QUklWQVRFPXkKQ09ORklHX1ZNQVBfUEZOPXkKQ09ORklHX0FS
Q0hfVVNFU19ISUdIX1ZNQV9GTEFHUz15CkNPTkZJR19BUkNIX0hBU19QS0VZUz15CiMgQ09ORklH
X1BFUkNQVV9TVEFUUyBpcyBub3Qgc2V0CkNPTkZJR19HVVBfVEVTVD15CiMgQ09ORklHX1JFQURf
T05MWV9USFBfRk9SX0ZTIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX1BURV9TUEVDSUFMPXkK
Q09ORklHX01BUFBJTkdfRElSVFlfSEVMUEVSUz15CiMgZW5kIG9mIE1lbW9yeSBNYW5hZ2VtZW50
IG9wdGlvbnMKCkNPTkZJR19ORVQ9eQpDT05GSUdfTkVUX0lOR1JFU1M9eQpDT05GSUdfTkVUX0VH
UkVTUz15CkNPTkZJR19ORVRfUkVESVJFQ1Q9eQpDT05GSUdfU0tCX0VYVEVOU0lPTlM9eQoKIwoj
IE5ldHdvcmtpbmcgb3B0aW9ucwojCkNPTkZJR19QQUNLRVQ9eQpDT05GSUdfUEFDS0VUX0RJQUc9
bQpDT05GSUdfVU5JWD15CkNPTkZJR19VTklYX1NDTT15CkNPTkZJR19VTklYX0RJQUc9bQpDT05G
SUdfVExTPW0KQ09ORklHX1RMU19ERVZJQ0U9eQojIENPTkZJR19UTFNfVE9FIGlzIG5vdCBzZXQK
Q09ORklHX1hGUk09eQpDT05GSUdfWEZSTV9PRkZMT0FEPXkKQ09ORklHX1hGUk1fQUxHTz15CkNP
TkZJR19YRlJNX1VTRVI9eQojIENPTkZJR19YRlJNX1VTRVJfQ09NUEFUIGlzIG5vdCBzZXQKQ09O
RklHX1hGUk1fSU5URVJGQUNFPW0KQ09ORklHX1hGUk1fU1VCX1BPTElDWT15CkNPTkZJR19YRlJN
X01JR1JBVEU9eQpDT05GSUdfWEZSTV9TVEFUSVNUSUNTPXkKQ09ORklHX1hGUk1fQUg9bQpDT05G
SUdfWEZSTV9FU1A9bQpDT05GSUdfWEZSTV9JUENPTVA9bQpDT05GSUdfTkVUX0tFWT1tCkNPTkZJ
R19ORVRfS0VZX01JR1JBVEU9eQpDT05GSUdfWEZSTV9FU1BJTlRDUD15CiMgQ09ORklHX1NNQyBp
cyBub3Qgc2V0CkNPTkZJR19YRFBfU09DS0VUUz15CkNPTkZJR19YRFBfU09DS0VUU19ESUFHPW0K
Q09ORklHX0lORVQ9eQpDT05GSUdfSVBfTVVMVElDQVNUPXkKQ09ORklHX0lQX0FEVkFOQ0VEX1JP
VVRFUj15CkNPTkZJR19JUF9GSUJfVFJJRV9TVEFUUz15CkNPTkZJR19JUF9NVUxUSVBMRV9UQUJM
RVM9eQpDT05GSUdfSVBfUk9VVEVfTVVMVElQQVRIPXkKQ09ORklHX0lQX1JPVVRFX1ZFUkJPU0U9
eQpDT05GSUdfSVBfUk9VVEVfQ0xBU1NJRD15CiMgQ09ORklHX0lQX1BOUCBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfSVBJUD1tCkNPTkZJR19ORVRfSVBHUkVfREVNVVg9bQpDT05GSUdfTkVUX0lQX1RV
Tk5FTD1tCkNPTkZJR19ORVRfSVBHUkU9bQpDT05GSUdfTkVUX0lQR1JFX0JST0FEQ0FTVD15CkNP
TkZJR19JUF9NUk9VVEVfQ09NTU9OPXkKQ09ORklHX0lQX01ST1VURT15CkNPTkZJR19JUF9NUk9V
VEVfTVVMVElQTEVfVEFCTEVTPXkKQ09ORklHX0lQX1BJTVNNX1YxPXkKQ09ORklHX0lQX1BJTVNN
X1YyPXkKQ09ORklHX1NZTl9DT09LSUVTPXkKQ09ORklHX05FVF9JUFZUST1tCkNPTkZJR19ORVRf
VURQX1RVTk5FTD1tCiMgQ09ORklHX05FVF9GT1UgaXMgbm90IHNldAojIENPTkZJR19ORVRfRk9V
X0lQX1RVTk5FTFMgaXMgbm90IHNldApDT05GSUdfSU5FVF9BSD1tCkNPTkZJR19JTkVUX0VTUD1t
CkNPTkZJR19JTkVUX0VTUF9PRkZMT0FEPW0KQ09ORklHX0lORVRfRVNQSU5UQ1A9eQpDT05GSUdf
SU5FVF9JUENPTVA9bQpDT05GSUdfSU5FVF9YRlJNX1RVTk5FTD1tCkNPTkZJR19JTkVUX1RVTk5F
TD1tCkNPTkZJR19JTkVUX0RJQUc9bQpDT05GSUdfSU5FVF9UQ1BfRElBRz1tCkNPTkZJR19JTkVU
X1VEUF9ESUFHPW0KQ09ORklHX0lORVRfUkFXX0RJQUc9bQojIENPTkZJR19JTkVUX0RJQUdfREVT
VFJPWSBpcyBub3Qgc2V0CkNPTkZJR19UQ1BfQ09OR19BRFZBTkNFRD15CkNPTkZJR19UQ1BfQ09O
R19CSUM9bQpDT05GSUdfVENQX0NPTkdfQ1VCSUM9eQpDT05GSUdfVENQX0NPTkdfV0VTVFdPT0Q9
bQpDT05GSUdfVENQX0NPTkdfSFRDUD1tCkNPTkZJR19UQ1BfQ09OR19IU1RDUD1tCkNPTkZJR19U
Q1BfQ09OR19IWUJMQT1tCkNPTkZJR19UQ1BfQ09OR19WRUdBUz1tCkNPTkZJR19UQ1BfQ09OR19O
Vj1tCkNPTkZJR19UQ1BfQ09OR19TQ0FMQUJMRT1tCkNPTkZJR19UQ1BfQ09OR19MUD1tCkNPTkZJ
R19UQ1BfQ09OR19WRU5PPW0KQ09ORklHX1RDUF9DT05HX1lFQUg9bQpDT05GSUdfVENQX0NPTkdf
SUxMSU5PSVM9bQpDT05GSUdfVENQX0NPTkdfRENUQ1A9bQojIENPTkZJR19UQ1BfQ09OR19DREcg
aXMgbm90IHNldApDT05GSUdfVENQX0NPTkdfQkJSPW0KQ09ORklHX0RFRkFVTFRfQ1VCSUM9eQoj
IENPTkZJR19ERUZBVUxUX1JFTk8gaXMgbm90IHNldApDT05GSUdfREVGQVVMVF9UQ1BfQ09ORz0i
Y3ViaWMiCkNPTkZJR19UQ1BfTUQ1U0lHPXkKQ09ORklHX0lQVjY9eQpDT05GSUdfSVBWNl9ST1VU
RVJfUFJFRj15CkNPTkZJR19JUFY2X1JPVVRFX0lORk89eQpDT05GSUdfSVBWNl9PUFRJTUlTVElD
X0RBRD15CkNPTkZJR19JTkVUNl9BSD1tCkNPTkZJR19JTkVUNl9FU1A9bQpDT05GSUdfSU5FVDZf
RVNQX09GRkxPQUQ9bQpDT05GSUdfSU5FVDZfRVNQSU5UQ1A9eQpDT05GSUdfSU5FVDZfSVBDT01Q
PW0KQ09ORklHX0lQVjZfTUlQNj1tCiMgQ09ORklHX0lQVjZfSUxBIGlzIG5vdCBzZXQKQ09ORklH
X0lORVQ2X1hGUk1fVFVOTkVMPW0KQ09ORklHX0lORVQ2X1RVTk5FTD1tCkNPTkZJR19JUFY2X1ZU
ST1tCkNPTkZJR19JUFY2X1NJVD1tCkNPTkZJR19JUFY2X1NJVF82UkQ9eQpDT05GSUdfSVBWNl9O
RElTQ19OT0RFVFlQRT15CkNPTkZJR19JUFY2X1RVTk5FTD1tCkNPTkZJR19JUFY2X0dSRT1tCkNP
TkZJR19JUFY2X01VTFRJUExFX1RBQkxFUz15CiMgQ09ORklHX0lQVjZfU1VCVFJFRVMgaXMgbm90
IHNldApDT05GSUdfSVBWNl9NUk9VVEU9eQpDT05GSUdfSVBWNl9NUk9VVEVfTVVMVElQTEVfVEFC
TEVTPXkKQ09ORklHX0lQVjZfUElNU01fVjI9eQojIENPTkZJR19JUFY2X1NFRzZfTFdUVU5ORUwg
aXMgbm90IHNldAojIENPTkZJR19JUFY2X1NFRzZfSE1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0lQ
VjZfUlBMX0xXVFVOTkVMIGlzIG5vdCBzZXQKQ09ORklHX05FVExBQkVMPXkKQ09ORklHX01QVENQ
PXkKQ09ORklHX0lORVRfTVBUQ1BfRElBRz1tCkNPTkZJR19NUFRDUF9JUFY2PXkKQ09ORklHX05F
VFdPUktfU0VDTUFSSz15CkNPTkZJR19ORVRfUFRQX0NMQVNTSUZZPXkKQ09ORklHX05FVFdPUktf
UEhZX1RJTUVTVEFNUElORz15CkNPTkZJR19ORVRGSUxURVI9eQpDT05GSUdfTkVURklMVEVSX0FE
VkFOQ0VEPXkKQ09ORklHX0JSSURHRV9ORVRGSUxURVI9bQoKIwojIENvcmUgTmV0ZmlsdGVyIENv
bmZpZ3VyYXRpb24KIwpDT05GSUdfTkVURklMVEVSX0lOR1JFU1M9eQpDT05GSUdfTkVURklMVEVS
X05FVExJTks9bQpDT05GSUdfTkVURklMVEVSX0ZBTUlMWV9CUklER0U9eQpDT05GSUdfTkVURklM
VEVSX0ZBTUlMWV9BUlA9eQojIENPTkZJR19ORVRGSUxURVJfTkVUTElOS19BQ0NUIGlzIG5vdCBz
ZXQKQ09ORklHX05FVEZJTFRFUl9ORVRMSU5LX1FVRVVFPW0KQ09ORklHX05FVEZJTFRFUl9ORVRM
SU5LX0xPRz1tCkNPTkZJR19ORVRGSUxURVJfTkVUTElOS19PU0Y9bQpDT05GSUdfTkZfQ09OTlRS
QUNLPW0KQ09ORklHX05GX0xPR19DT01NT049bQpDT05GSUdfTkZfTE9HX05FVERFVj1tCkNPTkZJ
R19ORVRGSUxURVJfQ09OTkNPVU5UPW0KQ09ORklHX05GX0NPTk5UUkFDS19NQVJLPXkKQ09ORklH
X05GX0NPTk5UUkFDS19TRUNNQVJLPXkKQ09ORklHX05GX0NPTk5UUkFDS19aT05FUz15CkNPTkZJ
R19ORl9DT05OVFJBQ0tfUFJPQ0ZTPXkKQ09ORklHX05GX0NPTk5UUkFDS19FVkVOVFM9eQpDT05G
SUdfTkZfQ09OTlRSQUNLX1RJTUVPVVQ9eQpDT05GSUdfTkZfQ09OTlRSQUNLX1RJTUVTVEFNUD15
CkNPTkZJR19ORl9DT05OVFJBQ0tfTEFCRUxTPXkKQ09ORklHX05GX0NUX1BST1RPX0RDQ1A9eQpD
T05GSUdfTkZfQ1RfUFJPVE9fR1JFPXkKQ09ORklHX05GX0NUX1BST1RPX1NDVFA9eQpDT05GSUdf
TkZfQ1RfUFJPVE9fVURQTElURT15CkNPTkZJR19ORl9DT05OVFJBQ0tfQU1BTkRBPW0KQ09ORklH
X05GX0NPTk5UUkFDS19GVFA9bQpDT05GSUdfTkZfQ09OTlRSQUNLX0gzMjM9bQpDT05GSUdfTkZf
Q09OTlRSQUNLX0lSQz1tCkNPTkZJR19ORl9DT05OVFJBQ0tfQlJPQURDQVNUPW0KQ09ORklHX05G
X0NPTk5UUkFDS19ORVRCSU9TX05TPW0KQ09ORklHX05GX0NPTk5UUkFDS19TTk1QPW0KQ09ORklH
X05GX0NPTk5UUkFDS19QUFRQPW0KQ09ORklHX05GX0NPTk5UUkFDS19TQU5FPW0KQ09ORklHX05G
X0NPTk5UUkFDS19TSVA9bQpDT05GSUdfTkZfQ09OTlRSQUNLX1RGVFA9bQpDT05GSUdfTkZfQ1Rf
TkVUTElOSz1tCkNPTkZJR19ORl9DVF9ORVRMSU5LX1RJTUVPVVQ9bQpDT05GSUdfTkZfQ1RfTkVU
TElOS19IRUxQRVI9bQpDT05GSUdfTkVURklMVEVSX05FVExJTktfR0xVRV9DVD15CkNPTkZJR19O
Rl9OQVQ9bQpDT05GSUdfTkZfTkFUX0FNQU5EQT1tCkNPTkZJR19ORl9OQVRfRlRQPW0KQ09ORklH
X05GX05BVF9JUkM9bQpDT05GSUdfTkZfTkFUX1NJUD1tCkNPTkZJR19ORl9OQVRfVEZUUD1tCkNP
TkZJR19ORl9OQVRfUkVESVJFQ1Q9eQpDT05GSUdfTkZfTkFUX01BU1FVRVJBREU9eQpDT05GSUdf
TkVURklMVEVSX1NZTlBST1hZPW0KQ09ORklHX05GX1RBQkxFUz1tCkNPTkZJR19ORl9UQUJMRVNf
SU5FVD15CkNPTkZJR19ORl9UQUJMRVNfTkVUREVWPXkKQ09ORklHX05GVF9OVU1HRU49bQpDT05G
SUdfTkZUX0NUPW0KQ09ORklHX05GVF9GTE9XX09GRkxPQUQ9bQpDT05GSUdfTkZUX0NPVU5URVI9
bQpDT05GSUdfTkZUX0NPTk5MSU1JVD1tCkNPTkZJR19ORlRfTE9HPW0KQ09ORklHX05GVF9MSU1J
VD1tCkNPTkZJR19ORlRfTUFTUT1tCkNPTkZJR19ORlRfUkVESVI9bQpDT05GSUdfTkZUX05BVD1t
CiMgQ09ORklHX05GVF9UVU5ORUwgaXMgbm90IHNldApDT05GSUdfTkZUX09CSlJFRj1tCkNPTkZJ
R19ORlRfUVVFVUU9bQpDT05GSUdfTkZUX1FVT1RBPW0KQ09ORklHX05GVF9SRUpFQ1Q9bQpDT05G
SUdfTkZUX1JFSkVDVF9JTkVUPW0KQ09ORklHX05GVF9DT01QQVQ9bQpDT05GSUdfTkZUX0hBU0g9
bQpDT05GSUdfTkZUX0ZJQj1tCkNPTkZJR19ORlRfRklCX0lORVQ9bQpDT05GSUdfTkZUX1hGUk09
bQpDT05GSUdfTkZUX1NPQ0tFVD1tCiMgQ09ORklHX05GVF9PU0YgaXMgbm90IHNldApDT05GSUdf
TkZUX1RQUk9YWT1tCiMgQ09ORklHX05GVF9TWU5QUk9YWSBpcyBub3Qgc2V0CkNPTkZJR19ORl9E
VVBfTkVUREVWPW0KQ09ORklHX05GVF9EVVBfTkVUREVWPW0KQ09ORklHX05GVF9GV0RfTkVUREVW
PW0KQ09ORklHX05GVF9GSUJfTkVUREVWPW0KIyBDT05GSUdfTkZUX1JFSkVDVF9ORVRERVYgaXMg
bm90IHNldApDT05GSUdfTkZfRkxPV19UQUJMRV9JTkVUPW0KQ09ORklHX05GX0ZMT1dfVEFCTEU9
bQpDT05GSUdfTkVURklMVEVSX1hUQUJMRVM9eQoKIwojIFh0YWJsZXMgY29tYmluZWQgbW9kdWxl
cwojCkNPTkZJR19ORVRGSUxURVJfWFRfTUFSSz1tCkNPTkZJR19ORVRGSUxURVJfWFRfQ09OTk1B
Uks9bQpDT05GSUdfTkVURklMVEVSX1hUX1NFVD1tCgojCiMgWHRhYmxlcyB0YXJnZXRzCiMKQ09O
RklHX05FVEZJTFRFUl9YVF9UQVJHRVRfQVVESVQ9bQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdF
VF9DSEVDS1NVTT1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0NMQVNTSUZZPW0KQ09ORklH
X05FVEZJTFRFUl9YVF9UQVJHRVRfQ09OTk1BUks9bQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdF
VF9DT05OU0VDTUFSSz1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0NUPW0KQ09ORklHX05F
VEZJTFRFUl9YVF9UQVJHRVRfRFNDUD1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0hMPW0K
Q09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfSE1BUks9bQpDT05GSUdfTkVURklMVEVSX1hUX1RB
UkdFVF9JRExFVElNRVI9bQojIENPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0xFRCBpcyBub3Qg
c2V0CkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX0xPRz1tCkNPTkZJR19ORVRGSUxURVJfWFRf
VEFSR0VUX01BUks9bQpDT05GSUdfTkVURklMVEVSX1hUX05BVD1tCkNPTkZJR19ORVRGSUxURVJf
WFRfVEFSR0VUX05FVE1BUD1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFSR0VUX05GTE9HPW0KQ09O
RklHX05FVEZJTFRFUl9YVF9UQVJHRVRfTkZRVUVVRT1tCkNPTkZJR19ORVRGSUxURVJfWFRfVEFS
R0VUX05PVFJBQ0s9bQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9SQVRFRVNUPW0KQ09ORklH
X05FVEZJTFRFUl9YVF9UQVJHRVRfUkVESVJFQ1Q9bQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdF
VF9NQVNRVUVSQURFPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVEVFPW0KQ09ORklHX05F
VEZJTFRFUl9YVF9UQVJHRVRfVFBST1hZPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVFJB
Q0U9bQpDT05GSUdfTkVURklMVEVSX1hUX1RBUkdFVF9TRUNNQVJLPW0KQ09ORklHX05FVEZJTFRF
Ul9YVF9UQVJHRVRfVENQTVNTPW0KQ09ORklHX05FVEZJTFRFUl9YVF9UQVJHRVRfVENQT1BUU1RS
SVA9bQoKIwojIFh0YWJsZXMgbWF0Y2hlcwojCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQURE
UlRZUEU9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0JQRj1tCkNPTkZJR19ORVRGSUxURVJf
WFRfTUFUQ0hfQ0dST1VQPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9DTFVTVEVSPW0KQ09O
RklHX05FVEZJTFRFUl9YVF9NQVRDSF9DT01NRU5UPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRD
SF9DT05OQllURVM9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0NPTk5MQUJFTD1tCkNPTkZJ
R19ORVRGSUxURVJfWFRfTUFUQ0hfQ09OTkxJTUlUPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRD
SF9DT05OTUFSSz1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfQ09OTlRSQUNLPW0KQ09ORklH
X05FVEZJTFRFUl9YVF9NQVRDSF9DUFU9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0RDQ1A9
bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0RFVkdST1VQPW0KQ09ORklHX05FVEZJTFRFUl9Y
VF9NQVRDSF9EU0NQPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9FQ049bQpDT05GSUdfTkVU
RklMVEVSX1hUX01BVENIX0VTUD1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfSEFTSExJTUlU
PW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9IRUxQRVI9bQpDT05GSUdfTkVURklMVEVSX1hU
X01BVENIX0hMPW0KIyBDT05GSUdfTkVURklMVEVSX1hUX01BVENIX0lQQ09NUCBpcyBub3Qgc2V0
CkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfSVBSQU5HRT1tCkNPTkZJR19ORVRGSUxURVJfWFRf
TUFUQ0hfSVBWUz1tCiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9MMlRQIGlzIG5vdCBzZXQK
Q09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9MRU5HVEg9bQpDT05GSUdfTkVURklMVEVSX1hUX01B
VENIX0xJTUlUPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9NQUM9bQpDT05GSUdfTkVURklM
VEVSX1hUX01BVENIX01BUks9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX01VTFRJUE9SVD1t
CiMgQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9ORkFDQ1QgaXMgbm90IHNldApDT05GSUdfTkVU
RklMVEVSX1hUX01BVENIX09TRj1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfT1dORVI9bQpD
T05GSUdfTkVURklMVEVSX1hUX01BVENIX1BPTElDWT1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFU
Q0hfUEhZU0RFVj1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfUEtUVFlQRT1tCkNPTkZJR19O
RVRGSUxURVJfWFRfTUFUQ0hfUVVPVEE9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1JBVEVF
U1Q9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1JFQUxNPW0KQ09ORklHX05FVEZJTFRFUl9Y
VF9NQVRDSF9SRUNFTlQ9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NDVFA9bQpDT05GSUdf
TkVURklMVEVSX1hUX01BVENIX1NPQ0tFVD1tCkNPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfU1RB
VEU9bQpDT05GSUdfTkVURklMVEVSX1hUX01BVENIX1NUQVRJU1RJQz1tCkNPTkZJR19ORVRGSUxU
RVJfWFRfTUFUQ0hfU1RSSU5HPW0KQ09ORklHX05FVEZJTFRFUl9YVF9NQVRDSF9UQ1BNU1M9bQoj
IENPTkZJR19ORVRGSUxURVJfWFRfTUFUQ0hfVElNRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRGSUxU
RVJfWFRfTUFUQ0hfVTMyPW0KIyBlbmQgb2YgQ29yZSBOZXRmaWx0ZXIgQ29uZmlndXJhdGlvbgoK
Q09ORklHX0lQX1NFVD1tCkNPTkZJR19JUF9TRVRfTUFYPTI1NgpDT05GSUdfSVBfU0VUX0JJVE1B
UF9JUD1tCkNPTkZJR19JUF9TRVRfQklUTUFQX0lQTUFDPW0KQ09ORklHX0lQX1NFVF9CSVRNQVBf
UE9SVD1tCkNPTkZJR19JUF9TRVRfSEFTSF9JUD1tCkNPTkZJR19JUF9TRVRfSEFTSF9JUE1BUks9
bQpDT05GSUdfSVBfU0VUX0hBU0hfSVBQT1JUPW0KQ09ORklHX0lQX1NFVF9IQVNIX0lQUE9SVElQ
PW0KQ09ORklHX0lQX1NFVF9IQVNIX0lQUE9SVE5FVD1tCkNPTkZJR19JUF9TRVRfSEFTSF9JUE1B
Qz1tCkNPTkZJR19JUF9TRVRfSEFTSF9NQUM9bQpDT05GSUdfSVBfU0VUX0hBU0hfTkVUUE9SVE5F
VD1tCkNPTkZJR19JUF9TRVRfSEFTSF9ORVQ9bQpDT05GSUdfSVBfU0VUX0hBU0hfTkVUTkVUPW0K
Q09ORklHX0lQX1NFVF9IQVNIX05FVFBPUlQ9bQpDT05GSUdfSVBfU0VUX0hBU0hfTkVUSUZBQ0U9
bQpDT05GSUdfSVBfU0VUX0xJU1RfU0VUPW0KQ09ORklHX0lQX1ZTPW0KQ09ORklHX0lQX1ZTX0lQ
VjY9eQojIENPTkZJR19JUF9WU19ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19JUF9WU19UQUJfQklU
Uz0xMgoKIwojIElQVlMgdHJhbnNwb3J0IHByb3RvY29sIGxvYWQgYmFsYW5jaW5nIHN1cHBvcnQK
IwpDT05GSUdfSVBfVlNfUFJPVE9fVENQPXkKQ09ORklHX0lQX1ZTX1BST1RPX1VEUD15CkNPTkZJ
R19JUF9WU19QUk9UT19BSF9FU1A9eQpDT05GSUdfSVBfVlNfUFJPVE9fRVNQPXkKQ09ORklHX0lQ
X1ZTX1BST1RPX0FIPXkKQ09ORklHX0lQX1ZTX1BST1RPX1NDVFA9eQoKIwojIElQVlMgc2NoZWR1
bGVyCiMKQ09ORklHX0lQX1ZTX1JSPW0KQ09ORklHX0lQX1ZTX1dSUj1tCkNPTkZJR19JUF9WU19M
Qz1tCkNPTkZJR19JUF9WU19XTEM9bQpDT05GSUdfSVBfVlNfRk89bQpDT05GSUdfSVBfVlNfT1ZG
PW0KQ09ORklHX0lQX1ZTX0xCTEM9bQpDT05GSUdfSVBfVlNfTEJMQ1I9bQpDT05GSUdfSVBfVlNf
REg9bQpDT05GSUdfSVBfVlNfU0g9bQojIENPTkZJR19JUF9WU19NSCBpcyBub3Qgc2V0CkNPTkZJ
R19JUF9WU19TRUQ9bQpDT05GSUdfSVBfVlNfTlE9bQojIENPTkZJR19JUF9WU19UV09TIGlzIG5v
dCBzZXQKCiMKIyBJUFZTIFNIIHNjaGVkdWxlcgojCkNPTkZJR19JUF9WU19TSF9UQUJfQklUUz04
CgojCiMgSVBWUyBNSCBzY2hlZHVsZXIKIwpDT05GSUdfSVBfVlNfTUhfVEFCX0lOREVYPTEyCgoj
CiMgSVBWUyBhcHBsaWNhdGlvbiBoZWxwZXIKIwpDT05GSUdfSVBfVlNfRlRQPW0KQ09ORklHX0lQ
X1ZTX05GQ1Q9eQpDT05GSUdfSVBfVlNfUEVfU0lQPW0KCiMKIyBJUDogTmV0ZmlsdGVyIENvbmZp
Z3VyYXRpb24KIwpDT05GSUdfTkZfREVGUkFHX0lQVjQ9bQpDT05GSUdfTkZfU09DS0VUX0lQVjQ9
bQpDT05GSUdfTkZfVFBST1hZX0lQVjQ9bQpDT05GSUdfTkZfVEFCTEVTX0lQVjQ9eQpDT05GSUdf
TkZUX1JFSkVDVF9JUFY0PW0KQ09ORklHX05GVF9EVVBfSVBWND1tCkNPTkZJR19ORlRfRklCX0lQ
VjQ9bQpDT05GSUdfTkZfVEFCTEVTX0FSUD15CiMgQ09ORklHX05GX0ZMT1dfVEFCTEVfSVBWNCBp
cyBub3Qgc2V0CkNPTkZJR19ORl9EVVBfSVBWND1tCkNPTkZJR19ORl9MT0dfQVJQPW0KQ09ORklH
X05GX0xPR19JUFY0PW0KQ09ORklHX05GX1JFSkVDVF9JUFY0PW0KQ09ORklHX05GX05BVF9TTk1Q
X0JBU0lDPW0KQ09ORklHX05GX05BVF9QUFRQPW0KQ09ORklHX05GX05BVF9IMzIzPW0KQ09ORklH
X0lQX05GX0lQVEFCTEVTPW0KQ09ORklHX0lQX05GX01BVENIX0FIPW0KQ09ORklHX0lQX05GX01B
VENIX0VDTj1tCkNPTkZJR19JUF9ORl9NQVRDSF9SUEZJTFRFUj1tCkNPTkZJR19JUF9ORl9NQVRD
SF9UVEw9bQpDT05GSUdfSVBfTkZfRklMVEVSPW0KQ09ORklHX0lQX05GX1RBUkdFVF9SRUpFQ1Q9
bQpDT05GSUdfSVBfTkZfVEFSR0VUX1NZTlBST1hZPW0KQ09ORklHX0lQX05GX05BVD1tCkNPTkZJ
R19JUF9ORl9UQVJHRVRfTUFTUVVFUkFERT1tCkNPTkZJR19JUF9ORl9UQVJHRVRfTkVUTUFQPW0K
Q09ORklHX0lQX05GX1RBUkdFVF9SRURJUkVDVD1tCkNPTkZJR19JUF9ORl9NQU5HTEU9bQojIENP
TkZJR19JUF9ORl9UQVJHRVRfQ0xVU1RFUklQIGlzIG5vdCBzZXQKQ09ORklHX0lQX05GX1RBUkdF
VF9FQ049bQpDT05GSUdfSVBfTkZfVEFSR0VUX1RUTD1tCkNPTkZJR19JUF9ORl9SQVc9bQpDT05G
SUdfSVBfTkZfU0VDVVJJVFk9bQpDT05GSUdfSVBfTkZfQVJQVEFCTEVTPW0KQ09ORklHX0lQX05G
X0FSUEZJTFRFUj1tCkNPTkZJR19JUF9ORl9BUlBfTUFOR0xFPW0KIyBlbmQgb2YgSVA6IE5ldGZp
bHRlciBDb25maWd1cmF0aW9uCgojCiMgSVB2NjogTmV0ZmlsdGVyIENvbmZpZ3VyYXRpb24KIwpD
T05GSUdfTkZfU09DS0VUX0lQVjY9bQpDT05GSUdfTkZfVFBST1hZX0lQVjY9bQpDT05GSUdfTkZf
VEFCTEVTX0lQVjY9eQpDT05GSUdfTkZUX1JFSkVDVF9JUFY2PW0KQ09ORklHX05GVF9EVVBfSVBW
Nj1tCkNPTkZJR19ORlRfRklCX0lQVjY9bQojIENPTkZJR19ORl9GTE9XX1RBQkxFX0lQVjYgaXMg
bm90IHNldApDT05GSUdfTkZfRFVQX0lQVjY9bQpDT05GSUdfTkZfUkVKRUNUX0lQVjY9bQpDT05G
SUdfTkZfTE9HX0lQVjY9bQpDT05GSUdfSVA2X05GX0lQVEFCTEVTPW0KQ09ORklHX0lQNl9ORl9N
QVRDSF9BSD1tCkNPTkZJR19JUDZfTkZfTUFUQ0hfRVVJNjQ9bQpDT05GSUdfSVA2X05GX01BVENI
X0ZSQUc9bQpDT05GSUdfSVA2X05GX01BVENIX09QVFM9bQpDT05GSUdfSVA2X05GX01BVENIX0hM
PW0KQ09ORklHX0lQNl9ORl9NQVRDSF9JUFY2SEVBREVSPW0KQ09ORklHX0lQNl9ORl9NQVRDSF9N
SD1tCkNPTkZJR19JUDZfTkZfTUFUQ0hfUlBGSUxURVI9bQpDT05GSUdfSVA2X05GX01BVENIX1JU
PW0KIyBDT05GSUdfSVA2X05GX01BVENIX1NSSCBpcyBub3Qgc2V0CiMgQ09ORklHX0lQNl9ORl9U
QVJHRVRfSEwgaXMgbm90IHNldApDT05GSUdfSVA2X05GX0ZJTFRFUj1tCkNPTkZJR19JUDZfTkZf
VEFSR0VUX1JFSkVDVD1tCkNPTkZJR19JUDZfTkZfVEFSR0VUX1NZTlBST1hZPW0KQ09ORklHX0lQ
Nl9ORl9NQU5HTEU9bQpDT05GSUdfSVA2X05GX1JBVz1tCkNPTkZJR19JUDZfTkZfU0VDVVJJVFk9
bQpDT05GSUdfSVA2X05GX05BVD1tCkNPTkZJR19JUDZfTkZfVEFSR0VUX01BU1FVRVJBREU9bQpD
T05GSUdfSVA2X05GX1RBUkdFVF9OUFQ9bQojIGVuZCBvZiBJUHY2OiBOZXRmaWx0ZXIgQ29uZmln
dXJhdGlvbgoKQ09ORklHX05GX0RFRlJBR19JUFY2PW0KQ09ORklHX05GX1RBQkxFU19CUklER0U9
bQojIENPTkZJR19ORlRfQlJJREdFX01FVEEgaXMgbm90IHNldApDT05GSUdfTkZUX0JSSURHRV9S
RUpFQ1Q9bQpDT05GSUdfTkZfTE9HX0JSSURHRT1tCiMgQ09ORklHX05GX0NPTk5UUkFDS19CUklE
R0UgaXMgbm90IHNldApDT05GSUdfQlJJREdFX05GX0VCVEFCTEVTPW0KQ09ORklHX0JSSURHRV9F
QlRfQlJPVVRFPW0KQ09ORklHX0JSSURHRV9FQlRfVF9GSUxURVI9bQpDT05GSUdfQlJJREdFX0VC
VF9UX05BVD1tCkNPTkZJR19CUklER0VfRUJUXzgwMl8zPW0KQ09ORklHX0JSSURHRV9FQlRfQU1P
Tkc9bQpDT05GSUdfQlJJREdFX0VCVF9BUlA9bQpDT05GSUdfQlJJREdFX0VCVF9JUD1tCkNPTkZJ
R19CUklER0VfRUJUX0lQNj1tCkNPTkZJR19CUklER0VfRUJUX0xJTUlUPW0KQ09ORklHX0JSSURH
RV9FQlRfTUFSSz1tCkNPTkZJR19CUklER0VfRUJUX1BLVFRZUEU9bQpDT05GSUdfQlJJREdFX0VC
VF9TVFA9bQpDT05GSUdfQlJJREdFX0VCVF9WTEFOPW0KQ09ORklHX0JSSURHRV9FQlRfQVJQUkVQ
TFk9bQpDT05GSUdfQlJJREdFX0VCVF9ETkFUPW0KQ09ORklHX0JSSURHRV9FQlRfTUFSS19UPW0K
Q09ORklHX0JSSURHRV9FQlRfUkVESVJFQ1Q9bQpDT05GSUdfQlJJREdFX0VCVF9TTkFUPW0KQ09O
RklHX0JSSURHRV9FQlRfTE9HPW0KQ09ORklHX0JSSURHRV9FQlRfTkZMT0c9bQojIENPTkZJR19C
UEZJTFRFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lQX0RDQ1AgaXMgbm90IHNldApDT05GSUdfSVBf
U0NUUD1tCiMgQ09ORklHX1NDVFBfREJHX09CSkNOVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDVFBf
REVGQVVMVF9DT09LSUVfSE1BQ19NRDUgaXMgbm90IHNldApDT05GSUdfU0NUUF9ERUZBVUxUX0NP
T0tJRV9ITUFDX1NIQTE9eQojIENPTkZJR19TQ1RQX0RFRkFVTFRfQ09PS0lFX0hNQUNfTk9ORSBp
cyBub3Qgc2V0CkNPTkZJR19TQ1RQX0NPT0tJRV9ITUFDX01ENT15CkNPTkZJR19TQ1RQX0NPT0tJ
RV9ITUFDX1NIQTE9eQpDT05GSUdfSU5FVF9TQ1RQX0RJQUc9bQojIENPTkZJR19SRFMgaXMgbm90
IHNldApDT05GSUdfVElQQz1tCkNPTkZJR19USVBDX01FRElBX0lCPXkKQ09ORklHX1RJUENfTUVE
SUFfVURQPXkKQ09ORklHX1RJUENfQ1JZUFRPPXkKQ09ORklHX1RJUENfRElBRz1tCkNPTkZJR19B
VE09bQpDT05GSUdfQVRNX0NMSVA9bQojIENPTkZJR19BVE1fQ0xJUF9OT19JQ01QIGlzIG5vdCBz
ZXQKQ09ORklHX0FUTV9MQU5FPW0KIyBDT05GSUdfQVRNX01QT0EgaXMgbm90IHNldApDT05GSUdf
QVRNX0JSMjY4ND1tCiMgQ09ORklHX0FUTV9CUjI2ODRfSVBGSUxURVIgaXMgbm90IHNldApDT05G
SUdfTDJUUD1tCkNPTkZJR19MMlRQX0RFQlVHRlM9bQpDT05GSUdfTDJUUF9WMz15CkNPTkZJR19M
MlRQX0lQPW0KQ09ORklHX0wyVFBfRVRIPW0KQ09ORklHX1NUUD1tCkNPTkZJR19HQVJQPW0KQ09O
RklHX01SUD1tCkNPTkZJR19CUklER0U9bQpDT05GSUdfQlJJREdFX0lHTVBfU05PT1BJTkc9eQpD
T05GSUdfQlJJREdFX1ZMQU5fRklMVEVSSU5HPXkKIyBDT05GSUdfQlJJREdFX01SUCBpcyBub3Qg
c2V0CiMgQ09ORklHX0JSSURHRV9DRk0gaXMgbm90IHNldApDT05GSUdfSEFWRV9ORVRfRFNBPXkK
IyBDT05GSUdfTkVUX0RTQSBpcyBub3Qgc2V0CkNPTkZJR19WTEFOXzgwMjFRPW0KQ09ORklHX1ZM
QU5fODAyMVFfR1ZSUD15CkNPTkZJR19WTEFOXzgwMjFRX01WUlA9eQojIENPTkZJR19ERUNORVQg
aXMgbm90IHNldApDT05GSUdfTExDPW0KIyBDT05GSUdfTExDMiBpcyBub3Qgc2V0CiMgQ09ORklH
X0FUQUxLIGlzIG5vdCBzZXQKIyBDT05GSUdfWDI1IGlzIG5vdCBzZXQKIyBDT05GSUdfTEFQQiBp
cyBub3Qgc2V0CiMgQ09ORklHX1BIT05FVCBpcyBub3Qgc2V0CkNPTkZJR182TE9XUEFOPW0KIyBD
T05GSUdfNkxPV1BBTl9ERUJVR0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfNkxPV1BBTl9OSEMgaXMg
bm90IHNldApDT05GSUdfSUVFRTgwMjE1ND1tCiMgQ09ORklHX0lFRUU4MDIxNTRfTkw4MDIxNTRf
RVhQRVJJTUVOVEFMIGlzIG5vdCBzZXQKQ09ORklHX0lFRUU4MDIxNTRfU09DS0VUPW0KQ09ORklH
X0lFRUU4MDIxNTRfNkxPV1BBTj1tCkNPTkZJR19NQUM4MDIxNTQ9bQpDT05GSUdfTkVUX1NDSEVE
PXkKCiMKIyBRdWV1ZWluZy9TY2hlZHVsaW5nCiMKQ09ORklHX05FVF9TQ0hfQ0JRPW0KQ09ORklH
X05FVF9TQ0hfSFRCPW0KQ09ORklHX05FVF9TQ0hfSEZTQz1tCkNPTkZJR19ORVRfU0NIX0FUTT1t
CkNPTkZJR19ORVRfU0NIX1BSSU89bQpDT05GSUdfTkVUX1NDSF9NVUxUSVE9bQpDT05GSUdfTkVU
X1NDSF9SRUQ9bQpDT05GSUdfTkVUX1NDSF9TRkI9bQpDT05GSUdfTkVUX1NDSF9TRlE9bQpDT05G
SUdfTkVUX1NDSF9URVFMPW0KQ09ORklHX05FVF9TQ0hfVEJGPW0KQ09ORklHX05FVF9TQ0hfQ0JT
PW0KIyBDT05GSUdfTkVUX1NDSF9FVEYgaXMgbm90IHNldAojIENPTkZJR19ORVRfU0NIX1RBUFJJ
TyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfU0NIX0dSRUQ9bQpDT05GSUdfTkVUX1NDSF9EU01BUks9
bQpDT05GSUdfTkVUX1NDSF9ORVRFTT1tCkNPTkZJR19ORVRfU0NIX0RSUj1tCkNPTkZJR19ORVRf
U0NIX01RUFJJTz1tCiMgQ09ORklHX05FVF9TQ0hfU0tCUFJJTyBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfU0NIX0NIT0tFPW0KQ09ORklHX05FVF9TQ0hfUUZRPW0KQ09ORklHX05FVF9TQ0hfQ09ERUw9
bQpDT05GSUdfTkVUX1NDSF9GUV9DT0RFTD15CiMgQ09ORklHX05FVF9TQ0hfQ0FLRSBpcyBub3Qg
c2V0CkNPTkZJR19ORVRfU0NIX0ZRPW0KQ09ORklHX05FVF9TQ0hfSEhGPW0KQ09ORklHX05FVF9T
Q0hfUElFPW0KIyBDT05GSUdfTkVUX1NDSF9GUV9QSUUgaXMgbm90IHNldApDT05GSUdfTkVUX1ND
SF9JTkdSRVNTPW0KQ09ORklHX05FVF9TQ0hfUExVRz1tCkNPTkZJR19ORVRfU0NIX0VUUz1tCkNP
TkZJR19ORVRfU0NIX0RFRkFVTFQ9eQojIENPTkZJR19ERUZBVUxUX0ZRIGlzIG5vdCBzZXQKIyBD
T05GSUdfREVGQVVMVF9DT0RFTCBpcyBub3Qgc2V0CkNPTkZJR19ERUZBVUxUX0ZRX0NPREVMPXkK
IyBDT05GSUdfREVGQVVMVF9TRlEgaXMgbm90IHNldAojIENPTkZJR19ERUZBVUxUX1BGSUZPX0ZB
U1QgaXMgbm90IHNldApDT05GSUdfREVGQVVMVF9ORVRfU0NIPSJmcV9jb2RlbCIKCiMKIyBDbGFz
c2lmaWNhdGlvbgojCkNPTkZJR19ORVRfQ0xTPXkKQ09ORklHX05FVF9DTFNfQkFTSUM9bQpDT05G
SUdfTkVUX0NMU19UQ0lOREVYPW0KQ09ORklHX05FVF9DTFNfUk9VVEU0PW0KQ09ORklHX05FVF9D
TFNfRlc9bQpDT05GSUdfTkVUX0NMU19VMzI9bQpDT05GSUdfQ0xTX1UzMl9QRVJGPXkKQ09ORklH
X0NMU19VMzJfTUFSSz15CkNPTkZJR19ORVRfQ0xTX1JTVlA9bQpDT05GSUdfTkVUX0NMU19SU1ZQ
Nj1tCkNPTkZJR19ORVRfQ0xTX0ZMT1c9bQpDT05GSUdfTkVUX0NMU19DR1JPVVA9eQpDT05GSUdf
TkVUX0NMU19CUEY9bQpDT05GSUdfTkVUX0NMU19GTE9XRVI9bQpDT05GSUdfTkVUX0NMU19NQVRD
SEFMTD1tCkNPTkZJR19ORVRfRU1BVENIPXkKQ09ORklHX05FVF9FTUFUQ0hfU1RBQ0s9MzIKQ09O
RklHX05FVF9FTUFUQ0hfQ01QPW0KQ09ORklHX05FVF9FTUFUQ0hfTkJZVEU9bQpDT05GSUdfTkVU
X0VNQVRDSF9VMzI9bQpDT05GSUdfTkVUX0VNQVRDSF9NRVRBPW0KQ09ORklHX05FVF9FTUFUQ0hf
VEVYVD1tCiMgQ09ORklHX05FVF9FTUFUQ0hfQ0FOSUQgaXMgbm90IHNldApDT05GSUdfTkVUX0VN
QVRDSF9JUFNFVD1tCiMgQ09ORklHX05FVF9FTUFUQ0hfSVBUIGlzIG5vdCBzZXQKQ09ORklHX05F
VF9DTFNfQUNUPXkKQ09ORklHX05FVF9BQ1RfUE9MSUNFPW0KQ09ORklHX05FVF9BQ1RfR0FDVD1t
CkNPTkZJR19HQUNUX1BST0I9eQpDT05GSUdfTkVUX0FDVF9NSVJSRUQ9bQpDT05GSUdfTkVUX0FD
VF9TQU1QTEU9bQojIENPTkZJR19ORVRfQUNUX0lQVCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfQUNU
X05BVD1tCkNPTkZJR19ORVRfQUNUX1BFRElUPW0KQ09ORklHX05FVF9BQ1RfU0lNUD1tCkNPTkZJ
R19ORVRfQUNUX1NLQkVESVQ9bQpDT05GSUdfTkVUX0FDVF9DU1VNPW0KQ09ORklHX05FVF9BQ1Rf
TVBMUz1tCkNPTkZJR19ORVRfQUNUX1ZMQU49bQpDT05GSUdfTkVUX0FDVF9CUEY9bQojIENPTkZJ
R19ORVRfQUNUX0NPTk5NQVJLIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX0FDVF9DVElORk8gaXMg
bm90IHNldApDT05GSUdfTkVUX0FDVF9TS0JNT0Q9bQojIENPTkZJR19ORVRfQUNUX0lGRSBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfQUNUX1RVTk5FTF9LRVk9bQpDT05GSUdfTkVUX0FDVF9DVD1tCiMg
Q09ORklHX05FVF9BQ1RfR0FURSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVENfU0tCX0VYVD15CkNP
TkZJR19ORVRfU0NIX0ZJRk89eQpDT05GSUdfRENCPXkKQ09ORklHX0ROU19SRVNPTFZFUj1tCiMg
Q09ORklHX0JBVE1BTl9BRFYgaXMgbm90IHNldApDT05GSUdfT1BFTlZTV0lUQ0g9bQpDT05GSUdf
T1BFTlZTV0lUQ0hfR1JFPW0KQ09ORklHX09QRU5WU1dJVENIX1ZYTEFOPW0KQ09ORklHX09QRU5W
U1dJVENIX0dFTkVWRT1tCkNPTkZJR19WU09DS0VUUz1tCkNPTkZJR19WU09DS0VUU19ESUFHPW0K
Q09ORklHX1ZTT0NLRVRTX0xPT1BCQUNLPW0KQ09ORklHX1ZNV0FSRV9WTUNJX1ZTT0NLRVRTPW0K
Q09ORklHX1ZJUlRJT19WU09DS0VUUz1tCkNPTkZJR19WSVJUSU9fVlNPQ0tFVFNfQ09NTU9OPW0K
Q09ORklHX0hZUEVSVl9WU09DS0VUUz1tCkNPTkZJR19ORVRMSU5LX0RJQUc9bQpDT05GSUdfTVBM
Uz15CkNPTkZJR19ORVRfTVBMU19HU089eQpDT05GSUdfTVBMU19ST1VUSU5HPW0KQ09ORklHX01Q
TFNfSVBUVU5ORUw9bQpDT05GSUdfTkVUX05TSD15CiMgQ09ORklHX0hTUiBpcyBub3Qgc2V0CkNP
TkZJR19ORVRfU1dJVENIREVWPXkKQ09ORklHX05FVF9MM19NQVNURVJfREVWPXkKIyBDT05GSUdf
UVJUUiBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9OQ1NJIGlzIG5vdCBzZXQKQ09ORklHX1JQUz15
CkNPTkZJR19SRlNfQUNDRUw9eQpDT05GSUdfU09DS19SWF9RVUVVRV9NQVBQSU5HPXkKQ09ORklH
X1hQUz15CkNPTkZJR19DR1JPVVBfTkVUX1BSSU89eQpDT05GSUdfQ0dST1VQX05FVF9DTEFTU0lE
PXkKQ09ORklHX05FVF9SWF9CVVNZX1BPTEw9eQpDT05GSUdfQlFMPXkKQ09ORklHX0JQRl9KSVQ9
eQpDT05GSUdfQlBGX1NUUkVBTV9QQVJTRVI9eQpDT05GSUdfTkVUX0ZMT1dfTElNSVQ9eQoKIwoj
IE5ldHdvcmsgdGVzdGluZwojCkNPTkZJR19ORVRfUEtUR0VOPW0KQ09ORklHX05FVF9EUk9QX01P
TklUT1I9eQojIGVuZCBvZiBOZXR3b3JrIHRlc3RpbmcKIyBlbmQgb2YgTmV0d29ya2luZyBvcHRp
b25zCgojIENPTkZJR19IQU1SQURJTyBpcyBub3Qgc2V0CkNPTkZJR19DQU49bQpDT05GSUdfQ0FO
X1JBVz1tCkNPTkZJR19DQU5fQkNNPW0KQ09ORklHX0NBTl9HVz1tCiMgQ09ORklHX0NBTl9KMTkz
OSBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9JU09UUCBpcyBub3Qgc2V0CgojCiMgQ0FOIERldmlj
ZSBEcml2ZXJzCiMKQ09ORklHX0NBTl9WQ0FOPW0KIyBDT05GSUdfQ0FOX1ZYQ0FOIGlzIG5vdCBz
ZXQKQ09ORklHX0NBTl9TTENBTj1tCkNPTkZJR19DQU5fREVWPW0KQ09ORklHX0NBTl9DQUxDX0JJ
VFRJTUlORz15CiMgQ09ORklHX0NBTl9LVkFTRVJfUENJRUZEIGlzIG5vdCBzZXQKQ09ORklHX0NB
Tl9DX0NBTj1tCkNPTkZJR19DQU5fQ19DQU5fUExBVEZPUk09bQpDT05GSUdfQ0FOX0NfQ0FOX1BD
ST1tCkNPTkZJR19DQU5fQ0M3NzA9bQojIENPTkZJR19DQU5fQ0M3NzBfSVNBIGlzIG5vdCBzZXQK
Q09ORklHX0NBTl9DQzc3MF9QTEFURk9STT1tCiMgQ09ORklHX0NBTl9JRklfQ0FORkQgaXMgbm90
IHNldAojIENPTkZJR19DQU5fTV9DQU4gaXMgbm90IHNldAojIENPTkZJR19DQU5fUEVBS19QQ0lF
RkQgaXMgbm90IHNldApDT05GSUdfQ0FOX1NKQTEwMDA9bQpDT05GSUdfQ0FOX0VNU19QQ0k9bQoj
IENPTkZJR19DQU5fRjgxNjAxIGlzIG5vdCBzZXQKQ09ORklHX0NBTl9LVkFTRVJfUENJPW0KQ09O
RklHX0NBTl9QRUFLX1BDST1tCkNPTkZJR19DQU5fUEVBS19QQ0lFQz15CkNPTkZJR19DQU5fUExY
X1BDST1tCiMgQ09ORklHX0NBTl9TSkExMDAwX0lTQSBpcyBub3Qgc2V0CkNPTkZJR19DQU5fU0pB
MTAwMF9QTEFURk9STT1tCkNPTkZJR19DQU5fU09GVElORz1tCgojCiMgQ0FOIFNQSSBpbnRlcmZh
Y2VzCiMKIyBDT05GSUdfQ0FOX0hJMzExWCBpcyBub3Qgc2V0CiMgQ09ORklHX0NBTl9NQ1AyNTFY
IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FOX01DUDI1MVhGRCBpcyBub3Qgc2V0CiMgZW5kIG9mIENB
TiBTUEkgaW50ZXJmYWNlcwoKIwojIENBTiBVU0IgaW50ZXJmYWNlcwojCkNPTkZJR19DQU5fOERF
Vl9VU0I9bQpDT05GSUdfQ0FOX0VNU19VU0I9bQpDT05GSUdfQ0FOX0VTRF9VU0IyPW0KIyBDT05G
SUdfQ0FOX0dTX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19DQU5fS1ZBU0VSX1VTQj1tCiMgQ09ORklH
X0NBTl9NQ0JBX1VTQiBpcyBub3Qgc2V0CkNPTkZJR19DQU5fUEVBS19VU0I9bQpDT05GSUdfQ0FO
X1VDQU49bQojIGVuZCBvZiBDQU4gVVNCIGludGVyZmFjZXMKCiMgQ09ORklHX0NBTl9ERUJVR19E
RVZJQ0VTIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ0FOIERldmljZSBEcml2ZXJzCgpDT05GSUdfQlQ9
bQpDT05GSUdfQlRfQlJFRFI9eQpDT05GSUdfQlRfUkZDT01NPW0KQ09ORklHX0JUX1JGQ09NTV9U
VFk9eQpDT05GSUdfQlRfQk5FUD1tCkNPTkZJR19CVF9CTkVQX01DX0ZJTFRFUj15CkNPTkZJR19C
VF9CTkVQX1BST1RPX0ZJTFRFUj15CkNPTkZJR19CVF9DTVRQPW0KQ09ORklHX0JUX0hJRFA9bQpD
T05GSUdfQlRfSFM9eQpDT05GSUdfQlRfTEU9eQojIENPTkZJR19CVF82TE9XUEFOIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQlRfTEVEUyBpcyBub3Qgc2V0CiMgQ09ORklHX0JUX01TRlRFWFQgaXMgbm90
IHNldApDT05GSUdfQlRfREVCVUdGUz15CiMgQ09ORklHX0JUX1NFTEZURVNUIGlzIG5vdCBzZXQK
CiMKIyBCbHVldG9vdGggZGV2aWNlIGRyaXZlcnMKIwpDT05GSUdfQlRfSU5URUw9bQpDT05GSUdf
QlRfQkNNPW0KQ09ORklHX0JUX1JUTD1tCkNPTkZJR19CVF9IQ0lCVFVTQj1tCkNPTkZJR19CVF9I
Q0lCVFVTQl9BVVRPU1VTUEVORD15CkNPTkZJR19CVF9IQ0lCVFVTQl9CQ009eQojIENPTkZJR19C
VF9IQ0lCVFVTQl9NVEsgaXMgbm90IHNldApDT05GSUdfQlRfSENJQlRVU0JfUlRMPXkKQ09ORklH
X0JUX0hDSUJUU0RJTz1tCkNPTkZJR19CVF9IQ0lVQVJUPW0KQ09ORklHX0JUX0hDSVVBUlRfSDQ9
eQpDT05GSUdfQlRfSENJVUFSVF9CQ1NQPXkKQ09ORklHX0JUX0hDSVVBUlRfQVRIM0s9eQojIENP
TkZJR19CVF9IQ0lVQVJUX0lOVEVMIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRfSENJVUFSVF9BRzZY
WCBpcyBub3Qgc2V0CkNPTkZJR19CVF9IQ0lCQ00yMDNYPW0KQ09ORklHX0JUX0hDSUJQQTEwWD1t
CkNPTkZJR19CVF9IQ0lCRlVTQj1tCkNPTkZJR19CVF9IQ0lWSENJPW0KQ09ORklHX0JUX01SVkw9
bQpDT05GSUdfQlRfTVJWTF9TRElPPW0KQ09ORklHX0JUX0FUSDNLPW0KIyBDT05GSUdfQlRfTVRL
U0RJTyBpcyBub3Qgc2V0CiMgZW5kIG9mIEJsdWV0b290aCBkZXZpY2UgZHJpdmVycwoKIyBDT05G
SUdfQUZfUlhSUEMgaXMgbm90IHNldAojIENPTkZJR19BRl9LQ00gaXMgbm90IHNldApDT05GSUdf
U1RSRUFNX1BBUlNFUj15CkNPTkZJR19GSUJfUlVMRVM9eQpDT05GSUdfV0lSRUxFU1M9eQpDT05G
SUdfQ0ZHODAyMTE9bQojIENPTkZJR19OTDgwMjExX1RFU1RNT0RFIGlzIG5vdCBzZXQKIyBDT05G
SUdfQ0ZHODAyMTFfREVWRUxPUEVSX1dBUk5JTkdTIGlzIG5vdCBzZXQKQ09ORklHX0NGRzgwMjEx
X1JFUVVJUkVfU0lHTkVEX1JFR0RCPXkKQ09ORklHX0NGRzgwMjExX1VTRV9LRVJORUxfUkVHREJf
S0VZUz15CkNPTkZJR19DRkc4MDIxMV9ERUZBVUxUX1BTPXkKIyBDT05GSUdfQ0ZHODAyMTFfREVC
VUdGUyBpcyBub3Qgc2V0CkNPTkZJR19DRkc4MDIxMV9DUkRBX1NVUFBPUlQ9eQojIENPTkZJR19D
Rkc4MDIxMV9XRVhUIGlzIG5vdCBzZXQKQ09ORklHX01BQzgwMjExPW0KQ09ORklHX01BQzgwMjEx
X0hBU19SQz15CkNPTkZJR19NQUM4MDIxMV9SQ19NSU5TVFJFTD15CkNPTkZJR19NQUM4MDIxMV9S
Q19ERUZBVUxUX01JTlNUUkVMPXkKQ09ORklHX01BQzgwMjExX1JDX0RFRkFVTFQ9Im1pbnN0cmVs
X2h0IgojIENPTkZJR19NQUM4MDIxMV9NRVNIIGlzIG5vdCBzZXQKQ09ORklHX01BQzgwMjExX0xF
RFM9eQpDT05GSUdfTUFDODAyMTFfREVCVUdGUz15CiMgQ09ORklHX01BQzgwMjExX01FU1NBR0Vf
VFJBQ0lORyBpcyBub3Qgc2V0CiMgQ09ORklHX01BQzgwMjExX0RFQlVHX01FTlUgaXMgbm90IHNl
dApDT05GSUdfTUFDODAyMTFfU1RBX0hBU0hfTUFYX1NJWkU9MApDT05GSUdfUkZLSUxMPW0KQ09O
RklHX1JGS0lMTF9MRURTPXkKQ09ORklHX1JGS0lMTF9JTlBVVD15CiMgQ09ORklHX1JGS0lMTF9H
UElPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUXzlQIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FJRiBp
cyBub3Qgc2V0CkNPTkZJR19DRVBIX0xJQj1tCiMgQ09ORklHX0NFUEhfTElCX1BSRVRUWURFQlVH
IGlzIG5vdCBzZXQKQ09ORklHX0NFUEhfTElCX1VTRV9ETlNfUkVTT0xWRVI9eQojIENPTkZJR19O
RkMgaXMgbm90IHNldApDT05GSUdfUFNBTVBMRT1tCiMgQ09ORklHX05FVF9JRkUgaXMgbm90IHNl
dApDT05GSUdfTFdUVU5ORUw9eQpDT05GSUdfTFdUVU5ORUxfQlBGPXkKQ09ORklHX0RTVF9DQUNI
RT15CkNPTkZJR19HUk9fQ0VMTFM9eQpDT05GSUdfU09DS19WQUxJREFURV9YTUlUPXkKQ09ORklH
X05FVF9TT0NLX01TRz15CkNPTkZJR19ORVRfREVWTElOSz15CkNPTkZJR19QQUdFX1BPT0w9eQpD
T05GSUdfRkFJTE9WRVI9bQpDT05GSUdfRVRIVE9PTF9ORVRMSU5LPXkKQ09ORklHX0hBVkVfRUJQ
Rl9KSVQ9eQoKIwojIERldmljZSBEcml2ZXJzCiMKQ09ORklHX0hBVkVfRUlTQT15CiMgQ09ORklH
X0VJU0EgaXMgbm90IHNldApDT05GSUdfSEFWRV9QQ0k9eQpDT05GSUdfUENJPXkKQ09ORklHX1BD
SV9ET01BSU5TPXkKQ09ORklHX1BDSUVQT1JUQlVTPXkKQ09ORklHX0hPVFBMVUdfUENJX1BDSUU9
eQpDT05GSUdfUENJRUFFUj15CkNPTkZJR19QQ0lFQUVSX0lOSkVDVD1tCkNPTkZJR19QQ0lFX0VD
UkM9eQpDT05GSUdfUENJRUFTUE09eQpDT05GSUdfUENJRUFTUE1fREVGQVVMVD15CiMgQ09ORklH
X1BDSUVBU1BNX1BPV0VSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVBU1BNX1BPV0VSX1NV
UEVSU0FWRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BDSUVBU1BNX1BFUkZPUk1BTkNFIGlzIG5vdCBz
ZXQKQ09ORklHX1BDSUVfUE1FPXkKQ09ORklHX1BDSUVfRFBDPXkKIyBDT05GSUdfUENJRV9QVE0g
aXMgbm90IHNldApDT05GSUdfUENJRV9FRFI9eQpDT05GSUdfUENJX01TST15CkNPTkZJR19QQ0lf
TVNJX0lSUV9ET01BSU49eQpDT05GSUdfUENJX1FVSVJLUz15CiMgQ09ORklHX1BDSV9ERUJVRyBp
cyBub3Qgc2V0CiMgQ09ORklHX1BDSV9SRUFMTE9DX0VOQUJMRV9BVVRPIGlzIG5vdCBzZXQKQ09O
RklHX1BDSV9TVFVCPXkKQ09ORklHX1BDSV9QRl9TVFVCPW0KIyBDT05GSUdfWEVOX1BDSURFVl9G
Uk9OVEVORCBpcyBub3Qgc2V0CkNPTkZJR19QQ0lfQVRTPXkKQ09ORklHX1BDSV9MT0NLTEVTU19D
T05GSUc9eQpDT05GSUdfUENJX0lPVj15CkNPTkZJR19QQ0lfUFJJPXkKQ09ORklHX1BDSV9QQVNJ
RD15CiMgQ09ORklHX1BDSV9QMlBETUEgaXMgbm90IHNldApDT05GSUdfUENJX0xBQkVMPXkKQ09O
RklHX1BDSV9IWVBFUlY9bQpDT05GSUdfSE9UUExVR19QQ0k9eQpDT05GSUdfSE9UUExVR19QQ0lf
QUNQST15CkNPTkZJR19IT1RQTFVHX1BDSV9BQ1BJX0lCTT1tCiMgQ09ORklHX0hPVFBMVUdfUENJ
X0NQQ0kgaXMgbm90IHNldApDT05GSUdfSE9UUExVR19QQ0lfU0hQQz15CgojCiMgUENJIGNvbnRy
b2xsZXIgZHJpdmVycwojCkNPTkZJR19WTUQ9eQpDT05GSUdfUENJX0hZUEVSVl9JTlRFUkZBQ0U9
bQoKIwojIERlc2lnbldhcmUgUENJIENvcmUgU3VwcG9ydAojCiMgQ09ORklHX1BDSUVfRFdfUExB
VF9IT1NUIGlzIG5vdCBzZXQKIyBDT05GSUdfUENJX01FU09OIGlzIG5vdCBzZXQKIyBlbmQgb2Yg
RGVzaWduV2FyZSBQQ0kgQ29yZSBTdXBwb3J0CgojCiMgTW9iaXZlaWwgUENJZSBDb3JlIFN1cHBv
cnQKIwojIGVuZCBvZiBNb2JpdmVpbCBQQ0llIENvcmUgU3VwcG9ydAoKIwojIENhZGVuY2UgUENJ
ZSBjb250cm9sbGVycyBzdXBwb3J0CiMKIyBlbmQgb2YgQ2FkZW5jZSBQQ0llIGNvbnRyb2xsZXJz
IHN1cHBvcnQKIyBlbmQgb2YgUENJIGNvbnRyb2xsZXIgZHJpdmVycwoKIwojIFBDSSBFbmRwb2lu
dAojCiMgQ09ORklHX1BDSV9FTkRQT0lOVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFBDSSBFbmRwb2lu
dAoKIwojIFBDSSBzd2l0Y2ggY29udHJvbGxlciBkcml2ZXJzCiMKIyBDT05GSUdfUENJX1NXX1NX
SVRDSFRFQyBpcyBub3Qgc2V0CiMgZW5kIG9mIFBDSSBzd2l0Y2ggY29udHJvbGxlciBkcml2ZXJz
CgojIENPTkZJR19DWExfQlVTIGlzIG5vdCBzZXQKQ09ORklHX1BDQ0FSRD15CiMgQ09ORklHX1BD
TUNJQSBpcyBub3Qgc2V0CkNPTkZJR19DQVJEQlVTPXkKCiMKIyBQQy1jYXJkIGJyaWRnZXMKIwpD
T05GSUdfWUVOVEE9bQpDT05GSUdfWUVOVEFfTzI9eQpDT05GSUdfWUVOVEFfUklDT0g9eQpDT05G
SUdfWUVOVEFfVEk9eQpDT05GSUdfWUVOVEFfRU5FX1RVTkU9eQpDT05GSUdfWUVOVEFfVE9TSElC
QT15CiMgQ09ORklHX1JBUElESU8gaXMgbm90IHNldAoKIwojIEdlbmVyaWMgRHJpdmVyIE9wdGlv
bnMKIwpDT05GSUdfQVVYSUxJQVJZX0JVUz15CiMgQ09ORklHX1VFVkVOVF9IRUxQRVIgaXMgbm90
IHNldApDT05GSUdfREVWVE1QRlM9eQpDT05GSUdfREVWVE1QRlNfTU9VTlQ9eQpDT05GSUdfU1RB
TkRBTE9ORT15CkNPTkZJR19QUkVWRU5UX0ZJUk1XQVJFX0JVSUxEPXkKCiMKIyBGaXJtd2FyZSBs
b2FkZXIKIwpDT05GSUdfRldfTE9BREVSPXkKQ09ORklHX0ZXX0xPQURFUl9QQUdFRF9CVUY9eQpD
T05GSUdfRVhUUkFfRklSTVdBUkU9IiIKQ09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUj15CiMg
Q09ORklHX0ZXX0xPQURFUl9VU0VSX0hFTFBFUl9GQUxMQkFDSyBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZXX0xPQURFUl9DT01QUkVTUyBpcyBub3Qgc2V0CkNPTkZJR19GV19DQUNIRT15CiMgZW5kIG9m
IEZpcm13YXJlIGxvYWRlcgoKQ09ORklHX1dBTlRfREVWX0NPUkVEVU1QPXkKQ09ORklHX0FMTE9X
X0RFVl9DT1JFRFVNUD15CkNPTkZJR19ERVZfQ09SRURVTVA9eQojIENPTkZJR19ERUJVR19EUklW
RVIgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19ERVZSRVMgaXMgbm90IHNldAojIENPTkZJR19E
RUJVR19URVNUX0RSSVZFUl9SRU1PVkUgaXMgbm90IHNldApDT05GSUdfSE1FTV9SRVBPUlRJTkc9
eQojIENPTkZJR19URVNUX0FTWU5DX0RSSVZFUl9QUk9CRSBpcyBub3Qgc2V0CkNPTkZJR19TWVNf
SFlQRVJWSVNPUj15CkNPTkZJR19HRU5FUklDX0NQVV9BVVRPUFJPQkU9eQpDT05GSUdfR0VORVJJ
Q19DUFVfVlVMTkVSQUJJTElUSUVTPXkKQ09ORklHX1JFR01BUD15CkNPTkZJR19SRUdNQVBfSTJD
PXkKQ09ORklHX1JFR01BUF9TUEk9bQpDT05GSUdfUkVHTUFQX0lSUT15CkNPTkZJR19ETUFfU0hB
UkVEX0JVRkZFUj15CiMgQ09ORklHX0RNQV9GRU5DRV9UUkFDRSBpcyBub3Qgc2V0CiMgZW5kIG9m
IEdlbmVyaWMgRHJpdmVyIE9wdGlvbnMKCiMKIyBCdXMgZGV2aWNlcwojCiMgQ09ORklHX01ISV9C
VVMgaXMgbm90IHNldAojIGVuZCBvZiBCdXMgZGV2aWNlcwoKQ09ORklHX0NPTk5FQ1RPUj15CkNP
TkZJR19QUk9DX0VWRU5UUz15CiMgQ09ORklHX0dOU1MgaXMgbm90IHNldApDT05GSUdfTVREPW0K
IyBDT05GSUdfTVREX1RFU1RTIGlzIG5vdCBzZXQKCiMKIyBQYXJ0aXRpb24gcGFyc2VycwojCiMg
Q09ORklHX01URF9BUjdfUEFSVFMgaXMgbm90IHNldAojIENPTkZJR19NVERfQ01ETElORV9QQVJU
UyBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9SRURCT09UX1BBUlRTIGlzIG5vdCBzZXQKIyBlbmQg
b2YgUGFydGl0aW9uIHBhcnNlcnMKCiMKIyBVc2VyIE1vZHVsZXMgQW5kIFRyYW5zbGF0aW9uIExh
eWVycwojCkNPTkZJR19NVERfQkxLREVWUz1tCkNPTkZJR19NVERfQkxPQ0s9bQojIENPTkZJR19N
VERfQkxPQ0tfUk8gaXMgbm90IHNldAojIENPTkZJR19GVEwgaXMgbm90IHNldAojIENPTkZJR19O
RlRMIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5GVEwgaXMgbm90IHNldAojIENPTkZJR19SRkRfRlRM
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1NGREMgaXMgbm90IHNldAojIENPTkZJR19TTV9GVEwgaXMg
bm90IHNldAojIENPTkZJR19NVERfT09QUyBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9TV0FQIGlz
IG5vdCBzZXQKIyBDT05GSUdfTVREX1BBUlRJVElPTkVEX01BU1RFUiBpcyBub3Qgc2V0CgojCiMg
UkFNL1JPTS9GbGFzaCBjaGlwIGRyaXZlcnMKIwojIENPTkZJR19NVERfQ0ZJIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVREX0pFREVDUFJPQkUgaXMgbm90IHNldApDT05GSUdfTVREX01BUF9CQU5LX1dJ
RFRIXzE9eQpDT05GSUdfTVREX01BUF9CQU5LX1dJRFRIXzI9eQpDT05GSUdfTVREX01BUF9CQU5L
X1dJRFRIXzQ9eQpDT05GSUdfTVREX0NGSV9JMT15CkNPTkZJR19NVERfQ0ZJX0kyPXkKIyBDT05G
SUdfTVREX1JBTSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9ST00gaXMgbm90IHNldAojIENPTkZJ
R19NVERfQUJTRU5UIGlzIG5vdCBzZXQKIyBlbmQgb2YgUkFNL1JPTS9GbGFzaCBjaGlwIGRyaXZl
cnMKCiMKIyBNYXBwaW5nIGRyaXZlcnMgZm9yIGNoaXAgYWNjZXNzCiMKIyBDT05GSUdfTVREX0NP
TVBMRVhfTUFQUElOR1MgaXMgbm90IHNldAojIENPTkZJR19NVERfSU5URUxfVlJfTk9SIGlzIG5v
dCBzZXQKIyBDT05GSUdfTVREX1BMQVRSQU0gaXMgbm90IHNldAojIGVuZCBvZiBNYXBwaW5nIGRy
aXZlcnMgZm9yIGNoaXAgYWNjZXNzCgojCiMgU2VsZi1jb250YWluZWQgTVREIGRldmljZSBkcml2
ZXJzCiMKIyBDT05GSUdfTVREX1BNQzU1MSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9EQVRBRkxB
U0ggaXMgbm90IHNldAojIENPTkZJR19NVERfTUNIUDIzSzI1NiBpcyBub3Qgc2V0CiMgQ09ORklH
X01URF9TU1QyNUwgaXMgbm90IHNldAojIENPTkZJR19NVERfU0xSQU0gaXMgbm90IHNldAojIENP
TkZJR19NVERfUEhSQU0gaXMgbm90IHNldAojIENPTkZJR19NVERfTVREUkFNIGlzIG5vdCBzZXQK
IyBDT05GSUdfTVREX0JMT0NLMk1URCBpcyBub3Qgc2V0CgojCiMgRGlzay1Pbi1DaGlwIERldmlj
ZSBEcml2ZXJzCiMKIyBDT05GSUdfTVREX0RPQ0czIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2VsZi1j
b250YWluZWQgTVREIGRldmljZSBkcml2ZXJzCgojCiMgTkFORAojCiMgQ09ORklHX01URF9PTkVO
QU5EIGlzIG5vdCBzZXQKIyBDT05GSUdfTVREX1JBV19OQU5EIGlzIG5vdCBzZXQKIyBDT05GSUdf
TVREX1NQSV9OQU5EIGlzIG5vdCBzZXQKCiMKIyBFQ0MgZW5naW5lIHN1cHBvcnQKIwojIENPTkZJ
R19NVERfTkFORF9FQ0NfU1dfSEFNTUlORyBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9OQU5EX0VD
Q19TV19CQ0ggaXMgbm90IHNldAojIGVuZCBvZiBFQ0MgZW5naW5lIHN1cHBvcnQKIyBlbmQgb2Yg
TkFORAoKIwojIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJpdmVycwojCiMgQ09ORklHX01U
RF9MUEREUiBpcyBub3Qgc2V0CiMgZW5kIG9mIExQRERSICYgTFBERFIyIFBDTSBtZW1vcnkgZHJp
dmVycwoKIyBDT05GSUdfTVREX1NQSV9OT1IgaXMgbm90IHNldApDT05GSUdfTVREX1VCST1tCkNP
TkZJR19NVERfVUJJX1dMX1RIUkVTSE9MRD00MDk2CkNPTkZJR19NVERfVUJJX0JFQl9MSU1JVD0y
MAojIENPTkZJR19NVERfVUJJX0ZBU1RNQVAgaXMgbm90IHNldAojIENPTkZJR19NVERfVUJJX0dM
VUVCSSBpcyBub3Qgc2V0CiMgQ09ORklHX01URF9VQklfQkxPQ0sgaXMgbm90IHNldAojIENPTkZJ
R19NVERfSFlQRVJCVVMgaXMgbm90IHNldAojIENPTkZJR19PRiBpcyBub3Qgc2V0CkNPTkZJR19B
UkNIX01JR0hUX0hBVkVfUENfUEFSUE9SVD15CkNPTkZJR19QQVJQT1JUPW0KQ09ORklHX1BBUlBP
UlRfUEM9bQpDT05GSUdfUEFSUE9SVF9TRVJJQUw9bQojIENPTkZJR19QQVJQT1JUX1BDX0ZJRk8g
aXMgbm90IHNldAojIENPTkZJR19QQVJQT1JUX1BDX1NVUEVSSU8gaXMgbm90IHNldAojIENPTkZJ
R19QQVJQT1JUX0FYODg3OTYgaXMgbm90IHNldApDT05GSUdfUEFSUE9SVF8xMjg0PXkKQ09ORklH
X1BBUlBPUlRfTk9UX1BDPXkKQ09ORklHX1BOUD15CiMgQ09ORklHX1BOUF9ERUJVR19NRVNTQUdF
UyBpcyBub3Qgc2V0CgojCiMgUHJvdG9jb2xzCiMKQ09ORklHX1BOUEFDUEk9eQpDT05GSUdfQkxL
X0RFVj15CkNPTkZJR19CTEtfREVWX05VTExfQkxLPW0KIyBDT05GSUdfQkxLX0RFVl9GRCBpcyBu
b3Qgc2V0CkNPTkZJR19DRFJPTT1tCiMgQ09ORklHX1BBUklERSBpcyBub3Qgc2V0CiMgQ09ORklH
X0JMS19ERVZfUENJRVNTRF9NVElQMzJYWCBpcyBub3Qgc2V0CkNPTkZJR19aUkFNPW0KQ09ORklH
X1pSQU1fREVGX0NPTVBfTFpPUkxFPXkKIyBDT05GSUdfWlJBTV9ERUZfQ09NUF9MWk8gaXMgbm90
IHNldApDT05GSUdfWlJBTV9ERUZfQ09NUD0ibHpvLXJsZSIKQ09ORklHX1pSQU1fV1JJVEVCQUNL
PXkKIyBDT05GSUdfWlJBTV9NRU1PUllfVFJBQ0tJTkcgaXMgbm90IHNldAojIENPTkZJR19CTEtf
REVWX1VNRU0gaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9MT09QPW0KQ09ORklHX0JMS19ERVZf
TE9PUF9NSU5fQ09VTlQ9MAojIENPTkZJR19CTEtfREVWX0NSWVBUT0xPT1AgaXMgbm90IHNldAoj
IENPTkZJR19CTEtfREVWX0RSQkQgaXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9OQkQ9bQojIENP
TkZJR19CTEtfREVWX1NYOCBpcyBub3Qgc2V0CkNPTkZJR19CTEtfREVWX1JBTT1tCkNPTkZJR19C
TEtfREVWX1JBTV9DT1VOVD0xNgpDT05GSUdfQkxLX0RFVl9SQU1fU0laRT0xNjM4NApDT05GSUdf
Q0RST01fUEtUQ0RWRD1tCkNPTkZJR19DRFJPTV9QS1RDRFZEX0JVRkZFUlM9OAojIENPTkZJR19D
RFJPTV9QS1RDRFZEX1dDQUNIRSBpcyBub3Qgc2V0CiMgQ09ORklHX0FUQV9PVkVSX0VUSCBpcyBu
b3Qgc2V0CkNPTkZJR19YRU5fQkxLREVWX0ZST05URU5EPW0KQ09ORklHX1ZJUlRJT19CTEs9bQpD
T05GSUdfQkxLX0RFVl9SQkQ9bQojIENPTkZJR19CTEtfREVWX1JTWFggaXMgbm90IHNldAoKIwoj
IE5WTUUgU3VwcG9ydAojCkNPTkZJR19OVk1FX0NPUkU9bQpDT05GSUdfQkxLX0RFVl9OVk1FPW0K
Q09ORklHX05WTUVfTVVMVElQQVRIPXkKIyBDT05GSUdfTlZNRV9IV01PTiBpcyBub3Qgc2V0CkNP
TkZJR19OVk1FX0ZBQlJJQ1M9bQpDT05GSUdfTlZNRV9SRE1BPW0KQ09ORklHX05WTUVfRkM9bQpD
T05GSUdfTlZNRV9UQ1A9bQpDT05GSUdfTlZNRV9UQVJHRVQ9bQojIENPTkZJR19OVk1FX1RBUkdF
VF9QQVNTVEhSVSBpcyBub3Qgc2V0CkNPTkZJR19OVk1FX1RBUkdFVF9MT09QPW0KQ09ORklHX05W
TUVfVEFSR0VUX1JETUE9bQpDT05GSUdfTlZNRV9UQVJHRVRfRkM9bQpDT05GSUdfTlZNRV9UQVJH
RVRfRkNMT09QPW0KQ09ORklHX05WTUVfVEFSR0VUX1RDUD1tCiMgZW5kIG9mIE5WTUUgU3VwcG9y
dAoKIwojIE1pc2MgZGV2aWNlcwojCkNPTkZJR19TRU5TT1JTX0xJUzNMVjAyRD1tCiMgQ09ORklH
X0FENTI1WF9EUE9UIGlzIG5vdCBzZXQKIyBDT05GSUdfRFVNTVlfSVJRIGlzIG5vdCBzZXQKIyBD
T05GSUdfSUJNX0FTTSBpcyBub3Qgc2V0CiMgQ09ORklHX1BIQU5UT00gaXMgbm90IHNldApDT05G
SUdfVElGTV9DT1JFPW0KQ09ORklHX1RJRk1fN1hYMT1tCiMgQ09ORklHX0lDUzkzMlM0MDEgaXMg
bm90IHNldApDT05GSUdfRU5DTE9TVVJFX1NFUlZJQ0VTPW0KQ09ORklHX1NHSV9YUD1tCkNPTkZJ
R19IUF9JTE89bQpDT05GSUdfU0dJX0dSVT1tCiMgQ09ORklHX1NHSV9HUlVfREVCVUcgaXMgbm90
IHNldApDT05GSUdfQVBEUzk4MDJBTFM9bQpDT05GSUdfSVNMMjkwMDM9bQpDT05GSUdfSVNMMjkw
MjA9bQpDT05GSUdfU0VOU09SU19UU0wyNTUwPW0KQ09ORklHX1NFTlNPUlNfQkgxNzcwPW0KQ09O
RklHX1NFTlNPUlNfQVBEUzk5MFg9bQojIENPTkZJR19ITUM2MzUyIGlzIG5vdCBzZXQKIyBDT05G
SUdfRFMxNjgyIGlzIG5vdCBzZXQKQ09ORklHX1ZNV0FSRV9CQUxMT09OPW0KIyBDT05GSUdfTEFU
VElDRV9FQ1AzX0NPTkZJRyBpcyBub3Qgc2V0CiMgQ09ORklHX1NSQU0gaXMgbm90IHNldAojIENP
TkZJR19QQ0lfRU5EUE9JTlRfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTElOWF9TREZFQyBp
cyBub3Qgc2V0CkNPTkZJR19NSVNDX1JUU1g9bQpDT05GSUdfUFZQQU5JQz15CiMgQ09ORklHX0My
UE9SVCBpcyBub3Qgc2V0CgojCiMgRUVQUk9NIHN1cHBvcnQKIwojIENPTkZJR19FRVBST01fQVQy
NCBpcyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9BVDI1IGlzIG5vdCBzZXQKQ09ORklHX0VFUFJP
TV9MRUdBQ1k9bQpDT05GSUdfRUVQUk9NX01BWDY4NzU9bQpDT05GSUdfRUVQUk9NXzkzQ1g2PW0K
IyBDT05GSUdfRUVQUk9NXzkzWFg0NiBpcyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9JRFRfODlI
UEVTWCBpcyBub3Qgc2V0CiMgQ09ORklHX0VFUFJPTV9FRTEwMDQgaXMgbm90IHNldAojIGVuZCBv
ZiBFRVBST00gc3VwcG9ydAoKQ09ORklHX0NCNzEwX0NPUkU9bQojIENPTkZJR19DQjcxMF9ERUJV
RyBpcyBub3Qgc2V0CkNPTkZJR19DQjcxMF9ERUJVR19BU1NVTVBUSU9OUz15CgojCiMgVGV4YXMg
SW5zdHJ1bWVudHMgc2hhcmVkIHRyYW5zcG9ydCBsaW5lIGRpc2NpcGxpbmUKIwojIENPTkZJR19U
SV9TVCBpcyBub3Qgc2V0CiMgZW5kIG9mIFRleGFzIEluc3RydW1lbnRzIHNoYXJlZCB0cmFuc3Bv
cnQgbGluZSBkaXNjaXBsaW5lCgpDT05GSUdfU0VOU09SU19MSVMzX0kyQz1tCkNPTkZJR19BTFRF
UkFfU1RBUEw9bQpDT05GSUdfSU5URUxfTUVJPW0KQ09ORklHX0lOVEVMX01FSV9NRT1tCiMgQ09O
RklHX0lOVEVMX01FSV9UWEUgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9NRUlfSERDUCBpcyBu
b3Qgc2V0CkNPTkZJR19WTVdBUkVfVk1DST1tCiMgQ09ORklHX0dFTldRRSBpcyBub3Qgc2V0CiMg
Q09ORklHX0VDSE8gaXMgbm90IHNldAojIENPTkZJR19CQ01fVksgaXMgbm90IHNldAojIENPTkZJ
R19NSVNDX0FMQ09SX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19NSVNDX1JUU1hfUENJPW0KQ09ORklH
X01JU0NfUlRTWF9VU0I9bQojIENPTkZJR19IQUJBTkFfQUkgaXMgbm90IHNldAojIENPTkZJR19V
QUNDRSBpcyBub3Qgc2V0CiMgZW5kIG9mIE1pc2MgZGV2aWNlcwoKQ09ORklHX0hBVkVfSURFPXkK
IyBDT05GSUdfSURFIGlzIG5vdCBzZXQKCiMKIyBTQ1NJIGRldmljZSBzdXBwb3J0CiMKQ09ORklH
X1NDU0lfTU9EPXkKQ09ORklHX1JBSURfQVRUUlM9bQpDT05GSUdfU0NTST15CkNPTkZJR19TQ1NJ
X0RNQT15CkNPTkZJR19TQ1NJX05FVExJTks9eQpDT05GSUdfU0NTSV9QUk9DX0ZTPXkKCiMKIyBT
Q1NJIHN1cHBvcnQgdHlwZSAoZGlzaywgdGFwZSwgQ0QtUk9NKQojCkNPTkZJR19CTEtfREVWX1NE
PW0KQ09ORklHX0NIUl9ERVZfU1Q9bQpDT05GSUdfQkxLX0RFVl9TUj1tCkNPTkZJR19DSFJfREVW
X1NHPW0KQ09ORklHX0NIUl9ERVZfU0NIPW0KQ09ORklHX1NDU0lfRU5DTE9TVVJFPW0KQ09ORklH
X1NDU0lfQ09OU1RBTlRTPXkKQ09ORklHX1NDU0lfTE9HR0lORz15CkNPTkZJR19TQ1NJX1NDQU5f
QVNZTkM9eQoKIwojIFNDU0kgVHJhbnNwb3J0cwojCkNPTkZJR19TQ1NJX1NQSV9BVFRSUz1tCkNP
TkZJR19TQ1NJX0ZDX0FUVFJTPW0KQ09ORklHX1NDU0lfSVNDU0lfQVRUUlM9bQpDT05GSUdfU0NT
SV9TQVNfQVRUUlM9bQpDT05GSUdfU0NTSV9TQVNfTElCU0FTPW0KQ09ORklHX1NDU0lfU0FTX0FU
QT15CkNPTkZJR19TQ1NJX1NBU19IT1NUX1NNUD15CkNPTkZJR19TQ1NJX1NSUF9BVFRSUz1tCiMg
ZW5kIG9mIFNDU0kgVHJhbnNwb3J0cwoKQ09ORklHX1NDU0lfTE9XTEVWRUw9eQpDT05GSUdfSVND
U0lfVENQPW0KQ09ORklHX0lTQ1NJX0JPT1RfU1lTRlM9bQojIENPTkZJR19TQ1NJX0NYR0IzX0lT
Q1NJIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfQ1hHQjRfSVNDU0k9bQpDT05GSUdfU0NTSV9CTlgy
X0lTQ1NJPW0KQ09ORklHX1NDU0lfQk5YMlhfRkNPRT1tCkNPTkZJR19CRTJJU0NTST1tCiMgQ09O
RklHX0JMS19ERVZfM1dfWFhYWF9SQUlEIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfSFBTQT1tCiMg
Q09ORklHX1NDU0lfM1dfOVhYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfM1dfU0FTIGlzIG5v
dCBzZXQKIyBDT05GSUdfU0NTSV9BQ0FSRCBpcyBub3Qgc2V0CkNPTkZJR19TQ1NJX0FBQ1JBSUQ9
bQojIENPTkZJR19TQ1NJX0FJQzdYWFggaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FJQzc5WFgg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX0FJQzk0WFggaXMgbm90IHNldAojIENPTkZJR19TQ1NJ
X01WU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9NVlVNSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfRFBUX0kyTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQURWQU5TWVMgaXMgbm90IHNl
dAojIENPTkZJR19TQ1NJX0FSQ01TUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfRVNBUzJSIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUVHQVJBSURfTkVXR0VOIGlzIG5vdCBzZXQKIyBDT05GSUdfTUVH
QVJBSURfTEVHQUNZIGlzIG5vdCBzZXQKQ09ORklHX01FR0FSQUlEX1NBUz1tCkNPTkZJR19TQ1NJ
X01QVDNTQVM9bQpDT05GSUdfU0NTSV9NUFQyU0FTX01BWF9TR0U9MTI4CkNPTkZJR19TQ1NJX01Q
VDNTQVNfTUFYX1NHRT0xMjgKQ09ORklHX1NDU0lfTVBUMlNBUz1tCkNPTkZJR19TQ1NJX1NNQVJU
UFFJPW0KIyBDT05GSUdfU0NTSV9VRlNIQ0QgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0hQVElP
UCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfQlVTTE9HSUMgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX01ZUkIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX01ZUlMgaXMgbm90IHNldApDT05GSUdf
Vk1XQVJFX1BWU0NTST1tCiMgQ09ORklHX1hFTl9TQ1NJX0ZST05URU5EIGlzIG5vdCBzZXQKQ09O
RklHX0hZUEVSVl9TVE9SQUdFPW0KQ09ORklHX0xJQkZDPW0KQ09ORklHX0xJQkZDT0U9bQojIENP
TkZJR19GQ09FIGlzIG5vdCBzZXQKQ09ORklHX0ZDT0VfRk5JQz1tCiMgQ09ORklHX1NDU0lfU05J
QyBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfRE1YMzE5MUQgaXMgbm90IHNldAojIENPTkZJR19T
Q1NJX0ZET01BSU5fUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JU0NJIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0NTSV9JUFMgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX0lOSVRJTyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfSU5JQTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NDU0lfUFBBIGlz
IG5vdCBzZXQKIyBDT05GSUdfU0NTSV9JTU0gaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NURVgg
aXMgbm90IHNldAojIENPTkZJR19TQ1NJX1NZTTUzQzhYWF8yIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0NTSV9JUFIgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1FMT0dJQ18xMjgwIGlzIG5vdCBzZXQK
Q09ORklHX1NDU0lfUUxBX0ZDPW0KIyBDT05GSUdfVENNX1FMQTJYWFggaXMgbm90IHNldApDT05G
SUdfU0NTSV9RTEFfSVNDU0k9bQpDT05GSUdfUUVEST1tCkNPTkZJR19RRURGPW0KQ09ORklHX1ND
U0lfTFBGQz1tCiMgQ09ORklHX1NDU0lfTFBGQ19ERUJVR19GUyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NDU0lfREMzOTV4IGlzIG5vdCBzZXQKIyBDT05GSUdfU0NTSV9BTTUzQzk3NCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NDU0lfV0Q3MTlYIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfREVCVUc9bQojIENP
TkZJR19TQ1NJX1BNQ1JBSUQgaXMgbm90IHNldAojIENPTkZJR19TQ1NJX1BNODAwMSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NDU0lfQkZBX0ZDIGlzIG5vdCBzZXQKQ09ORklHX1NDU0lfVklSVElPPW0K
Q09ORklHX1NDU0lfQ0hFTFNJT19GQ09FPW0KQ09ORklHX1NDU0lfREg9eQpDT05GSUdfU0NTSV9E
SF9SREFDPXkKQ09ORklHX1NDU0lfREhfSFBfU1c9eQpDT05GSUdfU0NTSV9ESF9FTUM9eQpDT05G
SUdfU0NTSV9ESF9BTFVBPXkKIyBlbmQgb2YgU0NTSSBkZXZpY2Ugc3VwcG9ydAoKQ09ORklHX0FU
QT1tCkNPTkZJR19TQVRBX0hPU1Q9eQpDT05GSUdfUEFUQV9USU1JTkdTPXkKQ09ORklHX0FUQV9W
RVJCT1NFX0VSUk9SPXkKQ09ORklHX0FUQV9GT1JDRT15CkNPTkZJR19BVEFfQUNQST15CiMgQ09O
RklHX1NBVEFfWlBPREQgaXMgbm90IHNldApDT05GSUdfU0FUQV9QTVA9eQoKIwojIENvbnRyb2xs
ZXJzIHdpdGggbm9uLVNGRiBuYXRpdmUgaW50ZXJmYWNlCiMKQ09ORklHX1NBVEFfQUhDST1tCkNP
TkZJR19TQVRBX01PQklMRV9MUE1fUE9MSUNZPTAKQ09ORklHX1NBVEFfQUhDSV9QTEFURk9STT1t
CiMgQ09ORklHX1NBVEFfSU5JQzE2MlggaXMgbm90IHNldAojIENPTkZJR19TQVRBX0FDQVJEX0FI
Q0kgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1NJTDI0IGlzIG5vdCBzZXQKQ09ORklHX0FUQV9T
RkY9eQoKIwojIFNGRiBjb250cm9sbGVycyB3aXRoIGN1c3RvbSBETUEgaW50ZXJmYWNlCiMKIyBD
T05GSUdfUERDX0FETUEgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1FTVE9SIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0FUQV9TWDQgaXMgbm90IHNldApDT05GSUdfQVRBX0JNRE1BPXkKCiMKIyBTQVRB
IFNGRiBjb250cm9sbGVycyB3aXRoIEJNRE1BCiMKQ09ORklHX0FUQV9QSUlYPW0KIyBDT05GSUdf
U0FUQV9EV0MgaXMgbm90IHNldAojIENPTkZJR19TQVRBX01WIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0FUQV9OViBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfUFJPTUlTRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NBVEFfU0lMIGlzIG5vdCBzZXQKIyBDT05GSUdfU0FUQV9TSVMgaXMgbm90IHNldAojIENP
TkZJR19TQVRBX1NWVyBpcyBub3Qgc2V0CiMgQ09ORklHX1NBVEFfVUxJIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0FUQV9WSUEgaXMgbm90IHNldAojIENPTkZJR19TQVRBX1ZJVEVTU0UgaXMgbm90IHNl
dAoKIwojIFBBVEEgU0ZGIGNvbnRyb2xsZXJzIHdpdGggQk1ETUEKIwojIENPTkZJR19QQVRBX0FM
SSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQU1EIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9B
UlRPUCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfQVRJSVhQIGlzIG5vdCBzZXQKIyBDT05GSUdf
UEFUQV9BVFA4NjdYIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9DTUQ2NFggaXMgbm90IHNldAoj
IENPTkZJR19QQVRBX0NZUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0VGQVIgaXMgbm90
IHNldAojIENPTkZJR19QQVRBX0hQVDM2NiBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfSFBUMzdY
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9IUFQzWDJOIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9IUFQzWDMgaXMgbm90IHNldAojIENPTkZJR19QQVRBX0lUODIxMyBpcyBub3Qgc2V0CiMgQ09O
RklHX1BBVEFfSVQ4MjFYIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9KTUlDUk9OIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUEFUQV9NQVJWRUxMIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9ORVRDRUxM
IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9OSU5KQTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9OUzg3NDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9PTERQSUlYIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEFUQV9PUFRJRE1BIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9QREMyMDI3WCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1BBVEFfUERDX09MRCBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUkFE
SVNZUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfUkRDIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFU
QV9TQ0ggaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NFUlZFUldPUktTIGlzIG5vdCBzZXQKIyBD
T05GSUdfUEFUQV9TSUw2ODAgaXMgbm90IHNldAojIENPTkZJR19QQVRBX1NJUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1BBVEFfVE9TSElCQSBpcyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfVFJJRkxFWCBp
cyBub3Qgc2V0CiMgQ09ORklHX1BBVEFfVklBIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9XSU5C
T05EIGlzIG5vdCBzZXQKCiMKIyBQSU8tb25seSBTRkYgY29udHJvbGxlcnMKIwojIENPTkZJR19Q
QVRBX0NNRDY0MF9QQ0kgaXMgbm90IHNldAojIENPTkZJR19QQVRBX01QSUlYIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEFUQV9OUzg3NDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfUEFUQV9PUFRJIGlzIG5v
dCBzZXQKIyBDT05GSUdfUEFUQV9SWjEwMDAgaXMgbm90IHNldAoKIwojIEdlbmVyaWMgZmFsbGJh
Y2sgLyBsZWdhY3kgZHJpdmVycwojCiMgQ09ORklHX1BBVEFfQUNQSSBpcyBub3Qgc2V0CkNPTkZJ
R19BVEFfR0VORVJJQz1tCiMgQ09ORklHX1BBVEFfTEVHQUNZIGlzIG5vdCBzZXQKQ09ORklHX01E
PXkKQ09ORklHX0JMS19ERVZfTUQ9eQpDT05GSUdfTURfQVVUT0RFVEVDVD15CkNPTkZJR19NRF9M
SU5FQVI9bQpDT05GSUdfTURfUkFJRDA9bQpDT05GSUdfTURfUkFJRDE9bQpDT05GSUdfTURfUkFJ
RDEwPW0KQ09ORklHX01EX1JBSUQ0NTY9bQojIENPTkZJR19NRF9NVUxUSVBBVEggaXMgbm90IHNl
dApDT05GSUdfTURfRkFVTFRZPW0KQ09ORklHX01EX0NMVVNURVI9bQojIENPTkZJR19CQ0FDSEUg
aXMgbm90IHNldApDT05GSUdfQkxLX0RFVl9ETV9CVUlMVElOPXkKQ09ORklHX0JMS19ERVZfRE09
bQpDT05GSUdfRE1fREVCVUc9eQpDT05GSUdfRE1fQlVGSU89bQojIENPTkZJR19ETV9ERUJVR19C
TE9DS19NQU5BR0VSX0xPQ0tJTkcgaXMgbm90IHNldApDT05GSUdfRE1fQklPX1BSSVNPTj1tCkNP
TkZJR19ETV9QRVJTSVNURU5UX0RBVEE9bQojIENPTkZJR19ETV9VTlNUUklQRUQgaXMgbm90IHNl
dApDT05GSUdfRE1fQ1JZUFQ9bQpDT05GSUdfRE1fU05BUFNIT1Q9bQpDT05GSUdfRE1fVEhJTl9Q
Uk9WSVNJT05JTkc9bQpDT05GSUdfRE1fQ0FDSEU9bQpDT05GSUdfRE1fQ0FDSEVfU01RPW0KQ09O
RklHX0RNX1dSSVRFQ0FDSEU9bQojIENPTkZJR19ETV9FQlMgaXMgbm90IHNldApDT05GSUdfRE1f
RVJBPW0KIyBDT05GSUdfRE1fQ0xPTkUgaXMgbm90IHNldApDT05GSUdfRE1fTUlSUk9SPW0KQ09O
RklHX0RNX0xPR19VU0VSU1BBQ0U9bQpDT05GSUdfRE1fUkFJRD1tCkNPTkZJR19ETV9aRVJPPW0K
Q09ORklHX0RNX01VTFRJUEFUSD1tCkNPTkZJR19ETV9NVUxUSVBBVEhfUUw9bQpDT05GSUdfRE1f
TVVMVElQQVRIX1NUPW0KIyBDT05GSUdfRE1fTVVMVElQQVRIX0hTVCBpcyBub3Qgc2V0CiMgQ09O
RklHX0RNX01VTFRJUEFUSF9JT0EgaXMgbm90IHNldApDT05GSUdfRE1fREVMQVk9bQojIENPTkZJ
R19ETV9EVVNUIGlzIG5vdCBzZXQKQ09ORklHX0RNX1VFVkVOVD15CkNPTkZJR19ETV9GTEFLRVk9
bQpDT05GSUdfRE1fVkVSSVRZPW0KIyBDT05GSUdfRE1fVkVSSVRZX1ZFUklGWV9ST09USEFTSF9T
SUcgaXMgbm90IHNldAojIENPTkZJR19ETV9WRVJJVFlfRkVDIGlzIG5vdCBzZXQKQ09ORklHX0RN
X1NXSVRDSD1tCkNPTkZJR19ETV9MT0dfV1JJVEVTPW0KQ09ORklHX0RNX0lOVEVHUklUWT1tCkNP
TkZJR19UQVJHRVRfQ09SRT1tCkNPTkZJR19UQ01fSUJMT0NLPW0KQ09ORklHX1RDTV9GSUxFSU89
bQpDT05GSUdfVENNX1BTQ1NJPW0KQ09ORklHX1RDTV9VU0VSMj1tCkNPTkZJR19MT09QQkFDS19U
QVJHRVQ9bQojIENPTkZJR19UQ01fRkMgaXMgbm90IHNldApDT05GSUdfSVNDU0lfVEFSR0VUPW0K
Q09ORklHX0lTQ1NJX1RBUkdFVF9DWEdCND1tCiMgQ09ORklHX1NCUF9UQVJHRVQgaXMgbm90IHNl
dApDT05GSUdfRlVTSU9OPXkKQ09ORklHX0ZVU0lPTl9TUEk9bQojIENPTkZJR19GVVNJT05fRkMg
aXMgbm90IHNldApDT05GSUdfRlVTSU9OX1NBUz1tCkNPTkZJR19GVVNJT05fTUFYX1NHRT0xMjgK
IyBDT05GSUdfRlVTSU9OX0NUTCBpcyBub3Qgc2V0CkNPTkZJR19GVVNJT05fTE9HR0lORz15Cgoj
CiMgSUVFRSAxMzk0IChGaXJlV2lyZSkgc3VwcG9ydAojCkNPTkZJR19GSVJFV0lSRT1tCkNPTkZJ
R19GSVJFV0lSRV9PSENJPW0KQ09ORklHX0ZJUkVXSVJFX1NCUDI9bQpDT05GSUdfRklSRVdJUkVf
TkVUPW0KIyBDT05GSUdfRklSRVdJUkVfTk9TWSBpcyBub3Qgc2V0CiMgZW5kIG9mIElFRUUgMTM5
NCAoRmlyZVdpcmUpIHN1cHBvcnQKCkNPTkZJR19NQUNJTlRPU0hfRFJJVkVSUz15CkNPTkZJR19N
QUNfRU1VTU9VU0VCVE49eQpDT05GSUdfTkVUREVWSUNFUz15CkNPTkZJR19NSUk9bQpDT05GSUdf
TkVUX0NPUkU9eQpDT05GSUdfQk9ORElORz1tCkNPTkZJR19EVU1NWT1tCiMgQ09ORklHX1dJUkVH
VUFSRCBpcyBub3Qgc2V0CiMgQ09ORklHX0VRVUFMSVpFUiBpcyBub3Qgc2V0CkNPTkZJR19ORVRf
RkM9eQpDT05GSUdfSUZCPW0KQ09ORklHX05FVF9URUFNPW0KQ09ORklHX05FVF9URUFNX01PREVf
QlJPQURDQVNUPW0KQ09ORklHX05FVF9URUFNX01PREVfUk9VTkRST0JJTj1tCkNPTkZJR19ORVRf
VEVBTV9NT0RFX1JBTkRPTT1tCkNPTkZJR19ORVRfVEVBTV9NT0RFX0FDVElWRUJBQ0tVUD1tCkNP
TkZJR19ORVRfVEVBTV9NT0RFX0xPQURCQUxBTkNFPW0KQ09ORklHX01BQ1ZMQU49bQpDT05GSUdf
TUFDVlRBUD1tCkNPTkZJR19JUFZMQU5fTDNTPXkKQ09ORklHX0lQVkxBTj1tCkNPTkZJR19JUFZU
QVA9bQpDT05GSUdfVlhMQU49bQpDT05GSUdfR0VORVZFPW0KIyBDT05GSUdfQkFSRVVEUCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0dUUCBpcyBub3Qgc2V0CkNPTkZJR19NQUNTRUM9bQpDT05GSUdfTkVU
Q09OU09MRT1tCkNPTkZJR19ORVRDT05TT0xFX0RZTkFNSUM9eQpDT05GSUdfTkVUUE9MTD15CkNP
TkZJR19ORVRfUE9MTF9DT05UUk9MTEVSPXkKQ09ORklHX1RVTj1tCkNPTkZJR19UQVA9bQojIENP
TkZJR19UVU5fVk5FVF9DUk9TU19MRSBpcyBub3Qgc2V0CkNPTkZJR19WRVRIPW0KQ09ORklHX1ZJ
UlRJT19ORVQ9bQpDT05GSUdfTkxNT049bQpDT05GSUdfTkVUX1ZSRj1tCkNPTkZJR19WU09DS01P
Tj1tCiMgQ09ORklHX0FSQ05FVCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUTV9EUklWRVJTIGlzIG5v
dCBzZXQKCiMKIyBEaXN0cmlidXRlZCBTd2l0Y2ggQXJjaGl0ZWN0dXJlIGRyaXZlcnMKIwojIENP
TkZJR19ORVRfRFNBX01WODhFNlhYWF9QVFAgaXMgbm90IHNldAojIGVuZCBvZiBEaXN0cmlidXRl
ZCBTd2l0Y2ggQXJjaGl0ZWN0dXJlIGRyaXZlcnMKCkNPTkZJR19FVEhFUk5FVD15CkNPTkZJR19N
RElPPW0KIyBDT05GSUdfTkVUX1ZFTkRPUl8zQ09NIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZF
TkRPUl9BREFQVEVDIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9BR0VSRSBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9WRU5ET1JfQUxBQ1JJVEVDSCBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfQUxURU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfQUxURVJBX1RTRSBpcyBub3Qgc2V0
CkNPTkZJR19ORVRfVkVORE9SX0FNQVpPTj15CkNPTkZJR19FTkFfRVRIRVJORVQ9bQpDT05GSUdf
TkVUX1ZFTkRPUl9BTUQ9eQojIENPTkZJR19BTUQ4MTExX0VUSCBpcyBub3Qgc2V0CiMgQ09ORklH
X1BDTkVUMzIgaXMgbm90IHNldApDT05GSUdfQU1EX1hHQkU9bQojIENPTkZJR19BTURfWEdCRV9E
Q0IgaXMgbm90IHNldApDT05GSUdfQU1EX1hHQkVfSEFWRV9FQ0M9eQpDT05GSUdfTkVUX1ZFTkRP
Ul9BUVVBTlRJQT15CkNPTkZJR19BUVRJT049bQojIENPTkZJR19ORVRfVkVORE9SX0FSQyBpcyBu
b3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0FUSEVST1M9eQpDT05GSUdfQVRMMj1tCkNPTkZJR19B
VEwxPW0KQ09ORklHX0FUTDFFPW0KQ09ORklHX0FUTDFDPW0KQ09ORklHX0FMWD1tCkNPTkZJR19O
RVRfVkVORE9SX0JST0FEQ09NPXkKIyBDT05GSUdfQjQ0IGlzIG5vdCBzZXQKIyBDT05GSUdfQkNN
R0VORVQgaXMgbm90IHNldApDT05GSUdfQk5YMj1tCkNPTkZJR19DTklDPW0KQ09ORklHX1RJR09O
Mz1tCkNPTkZJR19USUdPTjNfSFdNT049eQpDT05GSUdfQk5YMlg9bQpDT05GSUdfQk5YMlhfU1JJ
T1Y9eQojIENPTkZJR19TWVNURU1QT1JUIGlzIG5vdCBzZXQKQ09ORklHX0JOWFQ9bQpDT05GSUdf
Qk5YVF9TUklPVj15CkNPTkZJR19CTlhUX0ZMT1dFUl9PRkZMT0FEPXkKQ09ORklHX0JOWFRfRENC
PXkKQ09ORklHX0JOWFRfSFdNT049eQpDT05GSUdfTkVUX1ZFTkRPUl9CUk9DQURFPXkKIyBDT05G
SUdfQk5BIGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfQ0FERU5DRT15CiMgQ09ORklHX01B
Q0IgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9DQVZJVU09eQojIENPTkZJR19USFVOREVS
X05JQ19QRiBpcyBub3Qgc2V0CiMgQ09ORklHX1RIVU5ERVJfTklDX1ZGIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEhVTkRFUl9OSUNfQkdYIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhVTkRFUl9OSUNfUkdY
IGlzIG5vdCBzZXQKQ09ORklHX0NBVklVTV9QVFA9eQpDT05GSUdfTElRVUlESU89bQpDT05GSUdf
TElRVUlESU9fVkY9bQpDT05GSUdfTkVUX1ZFTkRPUl9DSEVMU0lPPXkKIyBDT05GSUdfQ0hFTFNJ
T19UMSBpcyBub3Qgc2V0CiMgQ09ORklHX0NIRUxTSU9fVDMgaXMgbm90IHNldApDT05GSUdfQ0hF
TFNJT19UND1tCiMgQ09ORklHX0NIRUxTSU9fVDRfRENCIGlzIG5vdCBzZXQKQ09ORklHX0NIRUxT
SU9fVDRWRj1tCkNPTkZJR19DSEVMU0lPX0xJQj1tCkNPTkZJR19DSEVMU0lPX0lOTElORV9DUllQ
VE89eQpDT05GSUdfQ0hFTFNJT19JUFNFQ19JTkxJTkU9bQpDT05GSUdfQ0hFTFNJT19UTFNfREVW
SUNFPW0KQ09ORklHX05FVF9WRU5ET1JfQ0lTQ089eQpDT05GSUdfRU5JQz1tCiMgQ09ORklHX05F
VF9WRU5ET1JfQ09SVElOQSBpcyBub3Qgc2V0CiMgQ09ORklHX0NYX0VDQVQgaXMgbm90IHNldApD
T05GSUdfRE5FVD1tCkNPTkZJR19ORVRfVkVORE9SX0RFQz15CiMgQ09ORklHX05FVF9UVUxJUCBp
cyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0RMSU5LPXkKQ09ORklHX0RMMks9bQojIENPTkZJ
R19TVU5EQU5DRSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX0VNVUxFWD15CkNPTkZJR19C
RTJORVQ9bQpDT05GSUdfQkUyTkVUX0hXTU9OPXkKIyBDT05GSUdfQkUyTkVUX0JFMiBpcyBub3Qg
c2V0CiMgQ09ORklHX0JFMk5FVF9CRTMgaXMgbm90IHNldApDT05GSUdfQkUyTkVUX0xBTkNFUj15
CkNPTkZJR19CRTJORVRfU0tZSEFXSz15CiMgQ09ORklHX05FVF9WRU5ET1JfRVpDSElQIGlzIG5v
dCBzZXQKQ09ORklHX05FVF9WRU5ET1JfR09PR0xFPXkKQ09ORklHX0dWRT1tCkNPTkZJR19ORVRf
VkVORE9SX0hVQVdFST15CkNPTkZJR19ISU5JQz1tCiMgQ09ORklHX05FVF9WRU5ET1JfSTgyNVhY
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfSU5URUw9eQojIENPTkZJR19FMTAwIGlzIG5v
dCBzZXQKQ09ORklHX0UxMDAwPW0KQ09ORklHX0UxMDAwRT1tCkNPTkZJR19FMTAwMEVfSFdUUz15
CkNPTkZJR19JR0I9bQpDT05GSUdfSUdCX0hXTU9OPXkKQ09ORklHX0lHQl9EQ0E9eQpDT05GSUdf
SUdCVkY9bQojIENPTkZJR19JWEdCIGlzIG5vdCBzZXQKQ09ORklHX0lYR0JFPW0KQ09ORklHX0lY
R0JFX0hXTU9OPXkKQ09ORklHX0lYR0JFX0RDQT15CkNPTkZJR19JWEdCRV9EQ0I9eQpDT05GSUdf
SVhHQkVfSVBTRUM9eQpDT05GSUdfSVhHQkVWRj1tCkNPTkZJR19JWEdCRVZGX0lQU0VDPXkKQ09O
RklHX0k0MEU9bQpDT05GSUdfSTQwRV9EQ0I9eQpDT05GSUdfSUFWRj1tCkNPTkZJR19JNDBFVkY9
bQpDT05GSUdfSUNFPW0KQ09ORklHX0ZNMTBLPW0KQ09ORklHX0lHQz1tCiMgQ09ORklHX0pNRSBp
cyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTUFSVkVMTCBpcyBub3Qgc2V0CkNPTkZJR19O
RVRfVkVORE9SX01FTExBTk9YPXkKQ09ORklHX01MWDRfRU49bQpDT05GSUdfTUxYNF9FTl9EQ0I9
eQpDT05GSUdfTUxYNF9DT1JFPW0KQ09ORklHX01MWDRfREVCVUc9eQojIENPTkZJR19NTFg0X0NP
UkVfR0VOMiBpcyBub3Qgc2V0CkNPTkZJR19NTFg1X0NPUkU9bQpDT05GSUdfTUxYNV9BQ0NFTD15
CkNPTkZJR19NTFg1X0ZQR0E9eQpDT05GSUdfTUxYNV9DT1JFX0VOPXkKQ09ORklHX01MWDVfRU5f
QVJGUz15CkNPTkZJR19NTFg1X0VOX1JYTkZDPXkKQ09ORklHX01MWDVfTVBGUz15CkNPTkZJR19N
TFg1X0VTV0lUQ0g9eQpDT05GSUdfTUxYNV9DTFNfQUNUPXkKQ09ORklHX01MWDVfVENfQ1Q9eQpD
T05GSUdfTUxYNV9DT1JFX0VOX0RDQj15CkNPTkZJR19NTFg1X0NPUkVfSVBPSUI9eQpDT05GSUdf
TUxYNV9GUEdBX0lQU0VDPXkKIyBDT05GSUdfTUxYNV9JUFNFQyBpcyBub3Qgc2V0CkNPTkZJR19N
TFg1X0VOX0lQU0VDPXkKIyBDT05GSUdfTUxYNV9GUEdBX1RMUyBpcyBub3Qgc2V0CkNPTkZJR19N
TFg1X1RMUz15CkNPTkZJR19NTFg1X0VOX1RMUz15CkNPTkZJR19NTFg1X1NXX1NURUVSSU5HPXkK
IyBDT05GSUdfTUxYNV9TRiBpcyBub3Qgc2V0CkNPTkZJR19NTFhTV19DT1JFPW0KQ09ORklHX01M
WFNXX0NPUkVfSFdNT049eQpDT05GSUdfTUxYU1dfQ09SRV9USEVSTUFMPXkKQ09ORklHX01MWFNX
X1BDST1tCkNPTkZJR19NTFhTV19JMkM9bQpDT05GSUdfTUxYU1dfU1dJVENISUI9bQpDT05GSUdf
TUxYU1dfU1dJVENIWDI9bQpDT05GSUdfTUxYU1dfU1BFQ1RSVU09bQpDT05GSUdfTUxYU1dfU1BF
Q1RSVU1fRENCPXkKQ09ORklHX01MWFNXX01JTklNQUw9bQpDT05GSUdfTUxYRlc9bQojIENPTkZJ
R19ORVRfVkVORE9SX01JQ1JFTCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTUlDUk9D
SElQIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9NSUNST1NFTUkgaXMgbm90IHNldApD
T05GSUdfTkVUX1ZFTkRPUl9NWVJJPXkKQ09ORklHX01ZUkkxMEdFPW0KQ09ORklHX01ZUkkxMEdF
X0RDQT15CiMgQ09ORklHX0ZFQUxOWCBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfTkFU
U0VNSSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX05FVEVSSU9OPXkKIyBDT05GSUdfUzJJ
TyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZYR0UgaXMgbm90IHNldApDT05GSUdfTkVUX1ZFTkRPUl9O
RVRST05PTUU9eQpDT05GSUdfTkZQPW0KQ09ORklHX05GUF9BUFBfRkxPV0VSPXkKQ09ORklHX05G
UF9BUFBfQUJNX05JQz15CiMgQ09ORklHX05GUF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX05F
VF9WRU5ET1JfTkkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX05WSURJQSBpcyBub3Qg
c2V0CkNPTkZJR19ORVRfVkVORE9SX09LST15CkNPTkZJR19FVEhPQz1tCkNPTkZJR19ORVRfVkVO
RE9SX1BBQ0tFVF9FTkdJTkVTPXkKIyBDT05GSUdfSEFNQUNISSBpcyBub3Qgc2V0CiMgQ09ORklH
X1lFTExPV0ZJTiBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1BFTlNBTkRPPXkKQ09ORklH
X0lPTklDPW0KQ09ORklHX05FVF9WRU5ET1JfUUxPR0lDPXkKQ09ORklHX1FMQTNYWFg9bQojIENP
TkZJR19RTENOSUMgaXMgbm90IHNldApDT05GSUdfTkVUWEVOX05JQz1tCkNPTkZJR19RRUQ9bQpD
T05GSUdfUUVEX0xMMj15CkNPTkZJR19RRURfU1JJT1Y9eQpDT05GSUdfUUVERT1tCkNPTkZJR19R
RURfUkRNQT15CkNPTkZJR19RRURfSVNDU0k9eQpDT05GSUdfUUVEX0ZDT0U9eQpDT05GSUdfUUVE
X09PTz15CiMgQ09ORklHX05FVF9WRU5ET1JfUVVBTENPTU0gaXMgbm90IHNldAojIENPTkZJR19O
RVRfVkVORE9SX1JEQyBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1JFQUxURUs9eQojIENP
TkZJR19BVFAgaXMgbm90IHNldApDT05GSUdfODEzOUNQPW0KQ09ORklHXzgxMzlUT089bQojIENP
TkZJR184MTM5VE9PX1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHXzgxMzlUT09fVFVORV9UV0lTVEVS
IGlzIG5vdCBzZXQKQ09ORklHXzgxMzlUT09fODEyOT15CiMgQ09ORklHXzgxMzlfT0xEX1JYX1JF
U0VUIGlzIG5vdCBzZXQKQ09ORklHX1I4MTY5PW0KIyBDT05GSUdfTkVUX1ZFTkRPUl9SRU5FU0FT
IGlzIG5vdCBzZXQKQ09ORklHX05FVF9WRU5ET1JfUk9DS0VSPXkKQ09ORklHX1JPQ0tFUj1tCiMg
Q09ORklHX05FVF9WRU5ET1JfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1Jf
U0VFUSBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1NPTEFSRkxBUkU9eQpDT05GSUdfU0ZD
PW0KQ09ORklHX1NGQ19NVEQ9eQpDT05GSUdfU0ZDX01DRElfTU9OPXkKQ09ORklHX1NGQ19TUklP
Vj15CkNPTkZJR19TRkNfTUNESV9MT0dHSU5HPXkKIyBDT05GSUdfU0ZDX0ZBTENPTiBpcyBub3Qg
c2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU0lMQU4gaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVO
RE9SX1NJUyBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9WRU5ET1JfU01TQyBpcyBub3Qgc2V0CiMg
Q09ORklHX05FVF9WRU5ET1JfU09DSU9ORVhUIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9TVE1JQ1JPIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRPUl9TVU4gaXMgbm90IHNldAoj
IENPTkZJR19ORVRfVkVORE9SX1NZTk9QU1lTIGlzIG5vdCBzZXQKIyBDT05GSUdfTkVUX1ZFTkRP
Ul9URUhVVEkgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1RJIGlzIG5vdCBzZXQKIyBD
T05GSUdfTkVUX1ZFTkRPUl9WSUEgaXMgbm90IHNldAojIENPTkZJR19ORVRfVkVORE9SX1dJWk5F
VCBpcyBub3Qgc2V0CkNPTkZJR19ORVRfVkVORE9SX1hJTElOWD15CiMgQ09ORklHX1hJTElOWF9F
TUFDTElURSBpcyBub3Qgc2V0CiMgQ09ORklHX1hJTElOWF9BWElfRU1BQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1hJTElOWF9MTF9URU1BQyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZEREkgaXMgbm90IHNl
dAojIENPTkZJR19ISVBQSSBpcyBub3Qgc2V0CiMgQ09ORklHX05FVF9TQjEwMDAgaXMgbm90IHNl
dApDT05GSUdfUEhZTElCPXkKQ09ORklHX1NXUEhZPXkKQ09ORklHX0xFRF9UUklHR0VSX1BIWT15
CkNPTkZJR19GSVhFRF9QSFk9eQoKIwojIE1JSSBQSFkgZGV2aWNlIGRyaXZlcnMKIwpDT05GSUdf
QU1EX1BIWT1tCiMgQ09ORklHX0FESU5fUEhZIGlzIG5vdCBzZXQKQ09ORklHX0FRVUFOVElBX1BI
WT1tCiMgQ09ORklHX0FYODg3OTZCX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19CUk9BRENPTV9QSFk9
bQojIENPTkZJR19CQ001NDE0MF9QSFkgaXMgbm90IHNldApDT05GSUdfQkNNN1hYWF9QSFk9bQoj
IENPTkZJR19CQ004NDg4MV9QSFkgaXMgbm90IHNldApDT05GSUdfQkNNODdYWF9QSFk9bQpDT05G
SUdfQkNNX05FVF9QSFlMSUI9bQpDT05GSUdfQ0lDQURBX1BIWT1tCkNPTkZJR19DT1JUSU5BX1BI
WT1tCkNPTkZJR19EQVZJQ09NX1BIWT1tCkNPTkZJR19JQ1BMVVNfUEhZPW0KQ09ORklHX0xYVF9Q
SFk9bQpDT05GSUdfSU5URUxfWFdBWV9QSFk9bQpDT05GSUdfTFNJX0VUMTAxMUNfUEhZPW0KQ09O
RklHX01BUlZFTExfUEhZPW0KQ09ORklHX01BUlZFTExfMTBHX1BIWT1tCkNPTkZJR19NSUNSRUxf
UEhZPW0KQ09ORklHX01JQ1JPQ0hJUF9QSFk9bQpDT05GSUdfTUlDUk9DSElQX1QxX1BIWT1tCkNP
TkZJR19NSUNST1NFTUlfUEhZPW0KQ09ORklHX05BVElPTkFMX1BIWT1tCiMgQ09ORklHX05YUF9U
SkExMVhYX1BIWSBpcyBub3Qgc2V0CkNPTkZJR19RU0VNSV9QSFk9bQpDT05GSUdfUkVBTFRFS19Q
SFk9bQpDT05GSUdfUkVORVNBU19QSFk9bQpDT05GSUdfUk9DS0NISVBfUEhZPW0KQ09ORklHX1NN
U0NfUEhZPW0KQ09ORklHX1NURTEwWFA9bQpDT05GSUdfVEVSQU5FVElDU19QSFk9bQpDT05GSUdf
RFA4MzgyMl9QSFk9bQpDT05GSUdfRFA4M1RDODExX1BIWT1tCkNPTkZJR19EUDgzODQ4X1BIWT1t
CkNPTkZJR19EUDgzODY3X1BIWT1tCiMgQ09ORklHX0RQODM4NjlfUEhZIGlzIG5vdCBzZXQKQ09O
RklHX1ZJVEVTU0VfUEhZPW0KQ09ORklHX1hJTElOWF9HTUlJMlJHTUlJPW0KQ09ORklHX01JQ1JF
TF9LUzg5OTVNQT1tCkNPTkZJR19NRElPX0RFVklDRT15CkNPTkZJR19NRElPX0JVUz15CkNPTkZJ
R19NRElPX0RFVlJFUz15CkNPTkZJR19NRElPX0JJVEJBTkc9bQpDT05GSUdfTURJT19CQ01fVU5J
TUFDPW0KQ09ORklHX01ESU9fQ0FWSVVNPW0KIyBDT05GSUdfTURJT19HUElPIGlzIG5vdCBzZXQK
IyBDT05GSUdfTURJT19NVlVTQiBpcyBub3Qgc2V0CkNPTkZJR19NRElPX01TQ0NfTUlJTT1tCkNP
TkZJR19NRElPX1RIVU5ERVI9bQoKIwojIE1ESU8gTXVsdGlwbGV4ZXJzCiMKCiMKIyBQQ1MgZGV2
aWNlIGRyaXZlcnMKIwojIENPTkZJR19QQ1NfWFBDUyBpcyBub3Qgc2V0CiMgZW5kIG9mIFBDUyBk
ZXZpY2UgZHJpdmVycwoKIyBDT05GSUdfUExJUCBpcyBub3Qgc2V0CkNPTkZJR19QUFA9bQpDT05G
SUdfUFBQX0JTRENPTVA9bQpDT05GSUdfUFBQX0RFRkxBVEU9bQpDT05GSUdfUFBQX0ZJTFRFUj15
CkNPTkZJR19QUFBfTVBQRT1tCkNPTkZJR19QUFBfTVVMVElMSU5LPXkKQ09ORklHX1BQUE9BVE09
bQpDT05GSUdfUFBQT0U9bQpDT05GSUdfUFBUUD1tCkNPTkZJR19QUFBPTDJUUD1tCkNPTkZJR19Q
UFBfQVNZTkM9bQpDT05GSUdfUFBQX1NZTkNfVFRZPW0KQ09ORklHX1NMSVA9bQpDT05GSUdfU0xI
Qz1tCkNPTkZJR19TTElQX0NPTVBSRVNTRUQ9eQpDT05GSUdfU0xJUF9TTUFSVD15CiMgQ09ORklH
X1NMSVBfTU9ERV9TTElQNiBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTkVUX0RSSVZFUlM9eQpDT05G
SUdfVVNCX0NBVEM9bQpDT05GSUdfVVNCX0tBV0VUSD1tCkNPTkZJR19VU0JfUEVHQVNVUz1tCkNP
TkZJR19VU0JfUlRMODE1MD1tCkNPTkZJR19VU0JfUlRMODE1Mj1tCkNPTkZJR19VU0JfTEFONzhY
WD1tCkNPTkZJR19VU0JfVVNCTkVUPW0KQ09ORklHX1VTQl9ORVRfQVg4ODE3WD1tCkNPTkZJR19V
U0JfTkVUX0FYODgxNzlfMTc4QT1tCkNPTkZJR19VU0JfTkVUX0NEQ0VUSEVSPW0KQ09ORklHX1VT
Ql9ORVRfQ0RDX0VFTT1tCkNPTkZJR19VU0JfTkVUX0NEQ19OQ009bQpDT05GSUdfVVNCX05FVF9I
VUFXRUlfQ0RDX05DTT1tCkNPTkZJR19VU0JfTkVUX0NEQ19NQklNPW0KQ09ORklHX1VTQl9ORVRf
RE05NjAxPW0KIyBDT05GSUdfVVNCX05FVF9TUjk3MDAgaXMgbm90IHNldAojIENPTkZJR19VU0Jf
TkVUX1NSOTgwMCBpcyBub3Qgc2V0CkNPTkZJR19VU0JfTkVUX1NNU0M3NVhYPW0KQ09ORklHX1VT
Ql9ORVRfU01TQzk1WFg9bQpDT05GSUdfVVNCX05FVF9HTDYyMEE9bQpDT05GSUdfVVNCX05FVF9O
RVQxMDgwPW0KQ09ORklHX1VTQl9ORVRfUExVU0I9bQpDT05GSUdfVVNCX05FVF9NQ1M3ODMwPW0K
Q09ORklHX1VTQl9ORVRfUk5ESVNfSE9TVD1tCkNPTkZJR19VU0JfTkVUX0NEQ19TVUJTRVRfRU5B
QkxFPW0KQ09ORklHX1VTQl9ORVRfQ0RDX1NVQlNFVD1tCkNPTkZJR19VU0JfQUxJX001NjMyPXkK
Q09ORklHX1VTQl9BTjI3MjA9eQpDT05GSUdfVVNCX0JFTEtJTj15CkNPTkZJR19VU0JfQVJNTElO
VVg9eQpDT05GSUdfVVNCX0VQU09OMjg4OD15CkNPTkZJR19VU0JfS0MyMTkwPXkKQ09ORklHX1VT
Ql9ORVRfWkFVUlVTPW0KQ09ORklHX1VTQl9ORVRfQ1g4MjMxMF9FVEg9bQpDT05GSUdfVVNCX05F
VF9LQUxNSUE9bQpDT05GSUdfVVNCX05FVF9RTUlfV1dBTj1tCkNPTkZJR19VU0JfSFNPPW0KQ09O
RklHX1VTQl9ORVRfSU5UNTFYMT1tCkNPTkZJR19VU0JfSVBIRVRIPW0KQ09ORklHX1VTQl9TSUVS
UkFfTkVUPW0KQ09ORklHX1VTQl9WTDYwMD1tCkNPTkZJR19VU0JfTkVUX0NIOTIwMD1tCiMgQ09O
RklHX1VTQl9ORVRfQVFDMTExIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1JUTDgxNTNfRUNNIGlz
IG5vdCBzZXQKQ09ORklHX1dMQU49eQojIENPTkZJR19XTEFOX1ZFTkRPUl9BRE1URUsgaXMgbm90
IHNldApDT05GSUdfQVRIX0NPTU1PTj1tCkNPTkZJR19XTEFOX1ZFTkRPUl9BVEg9eQojIENPTkZJ
R19BVEhfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19BVEg1SyBpcyBub3Qgc2V0CiMgQ09ORklH
X0FUSDVLX1BDSSBpcyBub3Qgc2V0CkNPTkZJR19BVEg5S19IVz1tCkNPTkZJR19BVEg5S19DT01N
T049bQpDT05GSUdfQVRIOUtfQ09NTU9OX0RFQlVHPXkKQ09ORklHX0FUSDlLX0JUQ09FWF9TVVBQ
T1JUPXkKQ09ORklHX0FUSDlLPW0KQ09ORklHX0FUSDlLX1BDST15CkNPTkZJR19BVEg5S19BSEI9
eQpDT05GSUdfQVRIOUtfREVCVUdGUz15CiMgQ09ORklHX0FUSDlLX1NUQVRJT05fU1RBVElTVElD
UyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDlLX0RZTkFDSyBpcyBub3Qgc2V0CkNPTkZJR19BVEg5
S19XT1c9eQpDT05GSUdfQVRIOUtfUkZLSUxMPXkKIyBDT05GSUdfQVRIOUtfQ0hBTk5FTF9DT05U
RVhUIGlzIG5vdCBzZXQKQ09ORklHX0FUSDlLX1BDT0VNPXkKIyBDT05GSUdfQVRIOUtfUENJX05P
X0VFUFJPTSBpcyBub3Qgc2V0CkNPTkZJR19BVEg5S19IVEM9bQojIENPTkZJR19BVEg5S19IVENf
REVCVUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDlLX0hXUk5HIGlzIG5vdCBzZXQKIyBDT05G
SUdfQVRIOUtfQ09NTU9OX1NQRUNUUkFMIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0FSTDkxNzAgaXMg
bm90IHNldAojIENPTkZJR19BVEg2S0wgaXMgbm90IHNldAojIENPTkZJR19BUjU1MjMgaXMgbm90
IHNldAojIENPTkZJR19XSUw2MjEwIGlzIG5vdCBzZXQKQ09ORklHX0FUSDEwSz1tCkNPTkZJR19B
VEgxMEtfQ0U9eQpDT05GSUdfQVRIMTBLX1BDST1tCiMgQ09ORklHX0FUSDEwS19TRElPIGlzIG5v
dCBzZXQKIyBDT05GSUdfQVRIMTBLX1VTQiBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDEwS19ERUJV
RyBpcyBub3Qgc2V0CkNPTkZJR19BVEgxMEtfREVCVUdGUz15CiMgQ09ORklHX0FUSDEwS19TUEVD
VFJBTCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDEwS19UUkFDSU5HIGlzIG5vdCBzZXQKIyBDT05G
SUdfV0NOMzZYWCBpcyBub3Qgc2V0CiMgQ09ORklHX0FUSDExSyBpcyBub3Qgc2V0CiMgQ09ORklH
X1dMQU5fVkVORE9SX0FUTUVMIGlzIG5vdCBzZXQKQ09ORklHX1dMQU5fVkVORE9SX0JST0FEQ09N
PXkKIyBDT05GSUdfQjQzIGlzIG5vdCBzZXQKIyBDT05GSUdfQjQzTEVHQUNZIGlzIG5vdCBzZXQK
Q09ORklHX0JSQ01VVElMPW0KQ09ORklHX0JSQ01TTUFDPW0KQ09ORklHX0JSQ01GTUFDPW0KQ09O
RklHX0JSQ01GTUFDX1BST1RPX0JDREM9eQpDT05GSUdfQlJDTUZNQUNfUFJPVE9fTVNHQlVGPXkK
Q09ORklHX0JSQ01GTUFDX1NESU89eQpDT05GSUdfQlJDTUZNQUNfVVNCPXkKQ09ORklHX0JSQ01G
TUFDX1BDSUU9eQojIENPTkZJR19CUkNNX1RSQUNJTkcgaXMgbm90IHNldAojIENPTkZJR19CUkNN
REJHIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfQ0lTQ08gaXMgbm90IHNldApDT05G
SUdfV0xBTl9WRU5ET1JfSU5URUw9eQojIENPTkZJR19JUFcyMTAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfSVBXMjIwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0lXTDQ5NjUgaXMgbm90IHNldAojIENPTkZJ
R19JV0wzOTQ1IGlzIG5vdCBzZXQKQ09ORklHX0lXTFdJRkk9bQpDT05GSUdfSVdMV0lGSV9MRURT
PXkKQ09ORklHX0lXTERWTT1tCkNPTkZJR19JV0xNVk09bQpDT05GSUdfSVdMV0lGSV9PUE1PREVf
TU9EVUxBUj15CiMgQ09ORklHX0lXTFdJRklfQkNBU1RfRklMVEVSSU5HIGlzIG5vdCBzZXQKCiMK
IyBEZWJ1Z2dpbmcgT3B0aW9ucwojCiMgQ09ORklHX0lXTFdJRklfREVCVUcgaXMgbm90IHNldApD
T05GSUdfSVdMV0lGSV9ERUJVR0ZTPXkKIyBDT05GSUdfSVdMV0lGSV9ERVZJQ0VfVFJBQ0lORyBp
cyBub3Qgc2V0CiMgZW5kIG9mIERlYnVnZ2luZyBPcHRpb25zCgojIENPTkZJR19XTEFOX1ZFTkRP
Ul9JTlRFUlNJTCBpcyBub3Qgc2V0CkNPTkZJR19XTEFOX1ZFTkRPUl9NQVJWRUxMPXkKIyBDT05G
SUdfTElCRVJUQVMgaXMgbm90IHNldAojIENPTkZJR19MSUJFUlRBU19USElORklSTSBpcyBub3Qg
c2V0CkNPTkZJR19NV0lGSUVYPW0KQ09ORklHX01XSUZJRVhfU0RJTz1tCkNPTkZJR19NV0lGSUVY
X1BDSUU9bQpDT05GSUdfTVdJRklFWF9VU0I9bQojIENPTkZJR19NV0w4SyBpcyBub3Qgc2V0CkNP
TkZJR19XTEFOX1ZFTkRPUl9NRURJQVRFSz15CkNPTkZJR19NVDc2MDFVPW0KQ09ORklHX01UNzZf
Q09SRT1tCkNPTkZJR19NVDc2X0xFRFM9eQpDT05GSUdfTVQ3Nl9VU0I9bQpDT05GSUdfTVQ3Nngw
Ml9MSUI9bQpDT05GSUdfTVQ3NngwMl9VU0I9bQpDT05GSUdfTVQ3NngwX0NPTU1PTj1tCkNPTkZJ
R19NVDc2eDBVPW0KIyBDT05GSUdfTVQ3NngwRSBpcyBub3Qgc2V0CkNPTkZJR19NVDc2eDJfQ09N
TU9OPW0KIyBDT05GSUdfTVQ3NngyRSBpcyBub3Qgc2V0CkNPTkZJR19NVDc2eDJVPW0KIyBDT05G
SUdfTVQ3NjAzRSBpcyBub3Qgc2V0CiMgQ09ORklHX01UNzYxNUUgaXMgbm90IHNldAojIENPTkZJ
R19NVDc2NjNVIGlzIG5vdCBzZXQKIyBDT05GSUdfTVQ3NjYzUyBpcyBub3Qgc2V0CiMgQ09ORklH
X01UNzkxNUUgaXMgbm90IHNldAojIENPTkZJR19NVDc5MjFFIGlzIG5vdCBzZXQKQ09ORklHX1dM
QU5fVkVORE9SX01JQ1JPQ0hJUD15CiMgQ09ORklHX1dJTEMxMDAwX1NESU8gaXMgbm90IHNldAoj
IENPTkZJR19XSUxDMTAwMF9TUEkgaXMgbm90IHNldApDT05GSUdfV0xBTl9WRU5ET1JfUkFMSU5L
PXkKQ09ORklHX1JUMlgwMD1tCiMgQ09ORklHX1JUMjQwMFBDSSBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUMjUwMFBDSSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUNjFQQ0kgaXMgbm90IHNldApDT05GSUdf
UlQyODAwUENJPW0KQ09ORklHX1JUMjgwMFBDSV9SVDMzWFg9eQpDT05GSUdfUlQyODAwUENJX1JU
MzVYWD15CkNPTkZJR19SVDI4MDBQQ0lfUlQ1M1hYPXkKQ09ORklHX1JUMjgwMFBDSV9SVDMyOTA9
eQojIENPTkZJR19SVDI1MDBVU0IgaXMgbm90IHNldAojIENPTkZJR19SVDczVVNCIGlzIG5vdCBz
ZXQKQ09ORklHX1JUMjgwMFVTQj1tCkNPTkZJR19SVDI4MDBVU0JfUlQzM1hYPXkKQ09ORklHX1JU
MjgwMFVTQl9SVDM1WFg9eQpDT05GSUdfUlQyODAwVVNCX1JUMzU3Mz15CkNPTkZJR19SVDI4MDBV
U0JfUlQ1M1hYPXkKQ09ORklHX1JUMjgwMFVTQl9SVDU1WFg9eQpDT05GSUdfUlQyODAwVVNCX1VO
S05PV049eQpDT05GSUdfUlQyODAwX0xJQj1tCkNPTkZJR19SVDI4MDBfTElCX01NSU89bQpDT05G
SUdfUlQyWDAwX0xJQl9NTUlPPW0KQ09ORklHX1JUMlgwMF9MSUJfUENJPW0KQ09ORklHX1JUMlgw
MF9MSUJfVVNCPW0KQ09ORklHX1JUMlgwMF9MSUI9bQpDT05GSUdfUlQyWDAwX0xJQl9GSVJNV0FS
RT15CkNPTkZJR19SVDJYMDBfTElCX0NSWVBUTz15CkNPTkZJR19SVDJYMDBfTElCX0xFRFM9eQpD
T05GSUdfUlQyWDAwX0xJQl9ERUJVR0ZTPXkKIyBDT05GSUdfUlQyWDAwX0RFQlVHIGlzIG5vdCBz
ZXQKQ09ORklHX1dMQU5fVkVORE9SX1JFQUxURUs9eQojIENPTkZJR19SVEw4MTgwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUlRMODE4NyBpcyBub3Qgc2V0CkNPTkZJR19SVExfQ0FSRFM9bQpDT05GSUdf
UlRMODE5MkNFPW0KQ09ORklHX1JUTDgxOTJTRT1tCkNPTkZJR19SVEw4MTkyREU9bQpDT05GSUdf
UlRMODcyM0FFPW0KQ09ORklHX1JUTDg3MjNCRT1tCkNPTkZJR19SVEw4MTg4RUU9bQpDT05GSUdf
UlRMODE5MkVFPW0KQ09ORklHX1JUTDg4MjFBRT1tCkNPTkZJR19SVEw4MTkyQ1U9bQpDT05GSUdf
UlRMV0lGST1tCkNPTkZJR19SVExXSUZJX1BDST1tCkNPTkZJR19SVExXSUZJX1VTQj1tCiMgQ09O
RklHX1JUTFdJRklfREVCVUcgaXMgbm90IHNldApDT05GSUdfUlRMODE5MkNfQ09NTU9OPW0KQ09O
RklHX1JUTDg3MjNfQ09NTU9OPW0KQ09ORklHX1JUTEJUQ09FWElTVD1tCkNPTkZJR19SVEw4WFhY
VT1tCiMgQ09ORklHX1JUTDhYWFhVX1VOVEVTVEVEIGlzIG5vdCBzZXQKQ09ORklHX1JUVzg4PW0K
Q09ORklHX1JUVzg4X0NPUkU9bQpDT05GSUdfUlRXODhfUENJPW0KQ09ORklHX1JUVzg4Xzg4MjJC
PW0KQ09ORklHX1JUVzg4Xzg4MjJDPW0KQ09ORklHX1JUVzg4Xzg4MjJCRT1tCkNPTkZJR19SVFc4
OF84ODIyQ0U9bQojIENPTkZJR19SVFc4OF84NzIzREUgaXMgbm90IHNldAojIENPTkZJR19SVFc4
OF84ODIxQ0UgaXMgbm90IHNldAojIENPTkZJR19SVFc4OF9ERUJVRyBpcyBub3Qgc2V0CiMgQ09O
RklHX1JUVzg4X0RFQlVHRlMgaXMgbm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9SU0kgaXMg
bm90IHNldAojIENPTkZJR19XTEFOX1ZFTkRPUl9TVCBpcyBub3Qgc2V0CiMgQ09ORklHX1dMQU5f
VkVORE9SX1RJIGlzIG5vdCBzZXQKIyBDT05GSUdfV0xBTl9WRU5ET1JfWllEQVMgaXMgbm90IHNl
dApDT05GSUdfV0xBTl9WRU5ET1JfUVVBTlRFTk5BPXkKIyBDT05GSUdfUVRORk1BQ19QQ0lFIGlz
IG5vdCBzZXQKQ09ORklHX01BQzgwMjExX0hXU0lNPW0KIyBDT05GSUdfVVNCX05FVF9STkRJU19X
TEFOIGlzIG5vdCBzZXQKIyBDT05GSUdfVklSVF9XSUZJIGlzIG5vdCBzZXQKQ09ORklHX1dBTj15
CiMgQ09ORklHX0xBTk1FRElBIGlzIG5vdCBzZXQKQ09ORklHX0hETEM9bQpDT05GSUdfSERMQ19S
QVc9bQojIENPTkZJR19IRExDX1JBV19FVEggaXMgbm90IHNldApDT05GSUdfSERMQ19DSVNDTz1t
CkNPTkZJR19IRExDX0ZSPW0KQ09ORklHX0hETENfUFBQPW0KCiMKIyBYLjI1L0xBUEIgc3VwcG9y
dCBpcyBkaXNhYmxlZAojCiMgQ09ORklHX1BDSTIwMFNZTiBpcyBub3Qgc2V0CiMgQ09ORklHX1dB
TlhMIGlzIG5vdCBzZXQKIyBDT05GSUdfUEMzMDBUT08gaXMgbm90IHNldAojIENPTkZJR19GQVJT
WU5DIGlzIG5vdCBzZXQKIyBDT05GSUdfU0JOSSBpcyBub3Qgc2V0CkNPTkZJR19JRUVFODAyMTU0
X0RSSVZFUlM9bQpDT05GSUdfSUVFRTgwMjE1NF9GQUtFTEI9bQojIENPTkZJR19JRUVFODAyMTU0
X0FUODZSRjIzMCBpcyBub3Qgc2V0CiMgQ09ORklHX0lFRUU4MDIxNTRfTVJGMjRKNDAgaXMgbm90
IHNldAojIENPTkZJR19JRUVFODAyMTU0X0NDMjUyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0lFRUU4
MDIxNTRfQVRVU0IgaXMgbm90IHNldAojIENPTkZJR19JRUVFODAyMTU0X0FERjcyNDIgaXMgbm90
IHNldAojIENPTkZJR19JRUVFODAyMTU0X0NBODIxMCBpcyBub3Qgc2V0CiMgQ09ORklHX0lFRUU4
MDIxNTRfTUNSMjBBIGlzIG5vdCBzZXQKIyBDT05GSUdfSUVFRTgwMjE1NF9IV1NJTSBpcyBub3Qg
c2V0CkNPTkZJR19YRU5fTkVUREVWX0ZST05URU5EPW0KQ09ORklHX1ZNWE5FVDM9bQpDT05GSUdf
RlVKSVRTVV9FUz1tCkNPTkZJR19VU0I0X05FVD1tCkNPTkZJR19IWVBFUlZfTkVUPW0KQ09ORklH
X05FVERFVlNJTT1tCkNPTkZJR19ORVRfRkFJTE9WRVI9bQpDT05GSUdfSVNETj15CkNPTkZJR19J
U0ROX0NBUEk9eQpDT05GSUdfQ0FQSV9UUkFDRT15CkNPTkZJR19JU0ROX0NBUElfTUlERExFV0FS
RT15CkNPTkZJR19NSVNETj1tCkNPTkZJR19NSVNETl9EU1A9bQpDT05GSUdfTUlTRE5fTDFPSVA9
bQoKIwojIG1JU0ROIGhhcmR3YXJlIGRyaXZlcnMKIwpDT05GSUdfTUlTRE5fSEZDUENJPW0KQ09O
RklHX01JU0ROX0hGQ01VTFRJPW0KQ09ORklHX01JU0ROX0hGQ1VTQj1tCkNPTkZJR19NSVNETl9B
Vk1GUklUWj1tCkNPTkZJR19NSVNETl9TUEVFREZBWD1tCkNPTkZJR19NSVNETl9JTkZJTkVPTj1t
CkNPTkZJR19NSVNETl9XNjY5Mj1tCkNPTkZJR19NSVNETl9ORVRKRVQ9bQpDT05GSUdfTUlTRE5f
SERMQz1tCkNPTkZJR19NSVNETl9JUEFDPW0KQ09ORklHX01JU0ROX0lTQVI9bQojIENPTkZJR19O
Vk0gaXMgbm90IHNldAoKIwojIElucHV0IGRldmljZSBzdXBwb3J0CiMKQ09ORklHX0lOUFVUPXkK
Q09ORklHX0lOUFVUX0xFRFM9eQpDT05GSUdfSU5QVVRfRkZfTUVNTEVTUz1tCkNPTkZJR19JTlBV
VF9TUEFSU0VLTUFQPW0KIyBDT05GSUdfSU5QVVRfTUFUUklYS01BUCBpcyBub3Qgc2V0CgojCiMg
VXNlcmxhbmQgaW50ZXJmYWNlcwojCkNPTkZJR19JTlBVVF9NT1VTRURFVj15CiMgQ09ORklHX0lO
UFVUX01PVVNFREVWX1BTQVVYIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVF
Tl9YPTEwMjQKQ09ORklHX0lOUFVUX01PVVNFREVWX1NDUkVFTl9ZPTc2OApDT05GSUdfSU5QVVRf
Sk9ZREVWPW0KQ09ORklHX0lOUFVUX0VWREVWPXkKIyBDT05GSUdfSU5QVVRfRVZCVUcgaXMgbm90
IHNldAoKIwojIElucHV0IERldmljZSBEcml2ZXJzCiMKQ09ORklHX0lOUFVUX0tFWUJPQVJEPXkK
IyBDT05GSUdfS0VZQk9BUkRfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfQURQNTU4
OCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0FEUDU1ODkgaXMgbm90IHNldAojIENPTkZJ
R19LRVlCT0FSRF9BUFBMRVNQSSBpcyBub3Qgc2V0CkNPTkZJR19LRVlCT0FSRF9BVEtCRD15CiMg
Q09ORklHX0tFWUJPQVJEX1FUMTA1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1FUMTA3
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1FUMjE2MCBpcyBub3Qgc2V0CiMgQ09ORklH
X0tFWUJPQVJEX0RMSU5LX0RJUjY4NSBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX0xLS0JE
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0tF
WUJPQVJEX0dQSU9fUE9MTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfVENBNjQxNiBp
cyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1RDQTg0MTggaXMgbm90IHNldAojIENPTkZJR19L
RVlCT0FSRF9NQVRSSVggaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgzMjMgaXMgbm90
IHNldAojIENPTkZJR19LRVlCT0FSRF9MTTgzMzMgaXMgbm90IHNldAojIENPTkZJR19LRVlCT0FS
RF9NQVg3MzU5IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTUNTIGlzIG5vdCBzZXQKIyBD
T05GSUdfS0VZQk9BUkRfTVBSMTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfTkVXVE9O
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfT1BFTkNPUkVTIGlzIG5vdCBzZXQKIyBDT05G
SUdfS0VZQk9BUkRfU0FNU1VORyBpcyBub3Qgc2V0CiMgQ09ORklHX0tFWUJPQVJEX1NUT1dBV0FZ
IGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfU1VOS0JEIGlzIG5vdCBzZXQKIyBDT05GSUdf
S0VZQk9BUkRfVE0yX1RPVUNIS0VZIGlzIG5vdCBzZXQKIyBDT05GSUdfS0VZQk9BUkRfWFRLQkQg
aXMgbm90IHNldApDT05GSUdfSU5QVVRfTU9VU0U9eQpDT05GSUdfTU9VU0VfUFMyPXkKQ09ORklH
X01PVVNFX1BTMl9BTFBTPXkKQ09ORklHX01PVVNFX1BTMl9CWUQ9eQpDT05GSUdfTU9VU0VfUFMy
X0xPR0lQUzJQUD15CkNPTkZJR19NT1VTRV9QUzJfU1lOQVBUSUNTPXkKQ09ORklHX01PVVNFX1BT
Ml9TWU5BUFRJQ1NfU01CVVM9eQpDT05GSUdfTU9VU0VfUFMyX0NZUFJFU1M9eQpDT05GSUdfTU9V
U0VfUFMyX0xJRkVCT09LPXkKQ09ORklHX01PVVNFX1BTMl9UUkFDS1BPSU5UPXkKQ09ORklHX01P
VVNFX1BTMl9FTEFOVEVDSD15CkNPTkZJR19NT1VTRV9QUzJfRUxBTlRFQ0hfU01CVVM9eQpDT05G
SUdfTU9VU0VfUFMyX1NFTlRFTElDPXkKIyBDT05GSUdfTU9VU0VfUFMyX1RPVUNIS0lUIGlzIG5v
dCBzZXQKQ09ORklHX01PVVNFX1BTMl9GT0NBTFRFQ0g9eQpDT05GSUdfTU9VU0VfUFMyX1ZNTU9V
U0U9eQpDT05GSUdfTU9VU0VfUFMyX1NNQlVTPXkKQ09ORklHX01PVVNFX1NFUklBTD1tCkNPTkZJ
R19NT1VTRV9BUFBMRVRPVUNIPW0KQ09ORklHX01PVVNFX0JDTTU5NzQ9bQpDT05GSUdfTU9VU0Vf
Q1lBUEE9bQpDT05GSUdfTU9VU0VfRUxBTl9JMkM9bQpDT05GSUdfTU9VU0VfRUxBTl9JMkNfSTJD
PXkKQ09ORklHX01PVVNFX0VMQU5fSTJDX1NNQlVTPXkKQ09ORklHX01PVVNFX1ZTWFhYQUE9bQoj
IENPTkZJR19NT1VTRV9HUElPIGlzIG5vdCBzZXQKQ09ORklHX01PVVNFX1NZTkFQVElDU19JMkM9
bQpDT05GSUdfTU9VU0VfU1lOQVBUSUNTX1VTQj1tCiMgQ09ORklHX0lOUFVUX0pPWVNUSUNLIGlz
IG5vdCBzZXQKQ09ORklHX0lOUFVUX1RBQkxFVD15CkNPTkZJR19UQUJMRVRfVVNCX0FDRUNBRD1t
CkNPTkZJR19UQUJMRVRfVVNCX0FJUFRFSz1tCiMgQ09ORklHX1RBQkxFVF9VU0JfSEFOV0FORyBp
cyBub3Qgc2V0CkNPTkZJR19UQUJMRVRfVVNCX0tCVEFCPW0KIyBDT05GSUdfVEFCTEVUX1VTQl9Q
RUdBU1VTIGlzIG5vdCBzZXQKQ09ORklHX1RBQkxFVF9TRVJJQUxfV0FDT000PW0KQ09ORklHX0lO
UFVUX1RPVUNIU0NSRUVOPXkKQ09ORklHX1RPVUNIU0NSRUVOX1BST1BFUlRJRVM9eQojIENPTkZJ
R19UT1VDSFNDUkVFTl9BRFM3ODQ2IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQUQ3
ODc3IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQUQ3ODc5IGlzIG5vdCBzZXQKIyBD
T05GSUdfVE9VQ0hTQ1JFRU5fQURDIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQVRN
RUxfTVhUIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQVVPX1BJWENJUiBpcyBub3Qg
c2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0JVMjEwMTMgaXMgbm90IHNldAojIENPTkZJR19UT1VD
SFNDUkVFTl9CVTIxMDI5IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQ0hJUE9ORV9J
Q044NTA1IGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fQ1k4Q1RNQTE0MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0NZOENUTUcxMTAgaXMgbm90IHNldAojIENPTkZJR19U
T1VDSFNDUkVFTl9DWVRUU1BfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0NZ
VFRTUDRfQ09SRSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0RZTkFQUk8gaXMgbm90
IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9IQU1QU0hJUkUgaXMgbm90IHNldAojIENPTkZJR19U
T1VDSFNDUkVFTl9FRVRJIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fRUdBTEFYX1NF
UklBTCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0VYQzMwMDAgaXMgbm90IHNldAoj
IENPTkZJR19UT1VDSFNDUkVFTl9GVUpJVFNVIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fR09PRElYIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSElERUVQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fSUxJMjEwWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNI
U0NSRUVOX1M2U1k3NjEgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9HVU5aRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX0VLVEYyMTI3IGlzIG5vdCBzZXQKIyBDT05GSUdf
VE9VQ0hTQ1JFRU5fRUxBTiBpcyBub3Qgc2V0CkNPTkZJR19UT1VDSFNDUkVFTl9FTE89bQpDT05G
SUdfVE9VQ0hTQ1JFRU5fV0FDT01fVzgwMDE9bQpDT05GSUdfVE9VQ0hTQ1JFRU5fV0FDT01fSTJD
PW0KIyBDT05GSUdfVE9VQ0hTQ1JFRU5fTUFYMTE4MDEgaXMgbm90IHNldAojIENPTkZJR19UT1VD
SFNDUkVFTl9NQ1M1MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fTU1TMTE0IGlz
IG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fTUVMRkFTX01JUDQgaXMgbm90IHNldAojIENP
TkZJR19UT1VDSFNDUkVFTl9NVE9VQ0ggaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9J
TkVYSU8gaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9NSzcxMiBpcyBub3Qgc2V0CiMg
Q09ORklHX1RPVUNIU0NSRUVOX1BFTk1PVU5UIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JF
RU5fRURUX0ZUNVgwNiBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RPVUNIUklHSFQg
aXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UT1VDSFdJTiBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPVUNIU0NSRUVOX1BJWENJUiBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1dE
VDg3WFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fV005N1hYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVVNCX0NPTVBPU0lURSBpcyBub3Qgc2V0CiMgQ09ORklH
X1RPVUNIU0NSRUVOX1RPVUNISVQyMTMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9U
U0NfU0VSSU8gaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9UU0MyMDA0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVE9VQ0hTQ1JFRU5fVFNDMjAwNSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNI
U0NSRUVOX1RTQzIwMDcgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9STV9UUyBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NJTEVBRCBpcyBub3Qgc2V0CiMgQ09ORklHX1RP
VUNIU0NSRUVOX1NJU19JMkMgaXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9TVDEyMzIg
aXMgbm90IHNldAojIENPTkZJR19UT1VDSFNDUkVFTl9TVE1GVFMgaXMgbm90IHNldAojIENPTkZJ
R19UT1VDSFNDUkVFTl9TVVI0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NVUkZB
Q0UzX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1NYODY1NCBpcyBub3Qgc2V0
CiMgQ09ORklHX1RPVUNIU0NSRUVOX1RQUzY1MDdYIGlzIG5vdCBzZXQKIyBDT05GSUdfVE9VQ0hT
Q1JFRU5fWkVUNjIyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1pGT1JDRSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1JPSE1fQlUyMTAyMyBpcyBub3Qgc2V0CiMgQ09O
RklHX1RPVUNIU0NSRUVOX0lRUzVYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1RPVUNIU0NSRUVOX1pJ
TklUSVggaXMgbm90IHNldApDT05GSUdfSU5QVVRfTUlTQz15CiMgQ09ORklHX0lOUFVUX0FENzE0
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX0JNQTE1MCBpcyBub3Qgc2V0CiMgQ09ORklHX0lO
UFVUX0UzWDBfQlVUVE9OIGlzIG5vdCBzZXQKQ09ORklHX0lOUFVUX1BDU1BLUj1tCiMgQ09ORklH
X0lOUFVUX01NQTg0NTAgaXMgbm90IHNldApDT05GSUdfSU5QVVRfQVBBTkVMPW0KIyBDT05GSUdf
SU5QVVRfR1BJT19CRUVQRVIgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUElPX0RFQ09ERVIg
aXMgbm90IHNldAojIENPTkZJR19JTlBVVF9HUElPX1ZJQlJBIGlzIG5vdCBzZXQKQ09ORklHX0lO
UFVUX0FUTEFTX0JUTlM9bQpDT05GSUdfSU5QVVRfQVRJX1JFTU9URTI9bQpDT05GSUdfSU5QVVRf
S0VZU1BBTl9SRU1PVEU9bQojIENPTkZJR19JTlBVVF9LWFRKOSBpcyBub3Qgc2V0CkNPTkZJR19J
TlBVVF9QT1dFUk1BVEU9bQpDT05GSUdfSU5QVVRfWUVBTElOSz1tCkNPTkZJR19JTlBVVF9DTTEw
OT1tCkNPTkZJR19JTlBVVF9VSU5QVVQ9bQojIENPTkZJR19JTlBVVF9QQ0Y4NTc0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfSU5QVVRfUFdNX0JFRVBFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lOUFVUX1BX
TV9WSUJSQSBpcyBub3Qgc2V0CkNPTkZJR19JTlBVVF9HUElPX1JPVEFSWV9FTkNPREVSPW0KIyBD
T05GSUdfSU5QVVRfREE3MjgwX0hBUFRJQ1MgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9BRFhM
MzRYIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfSU1TX1BDVSBpcyBub3Qgc2V0CiMgQ09ORklH
X0lOUFVUX0lRUzI2OUEgaXMgbm90IHNldAojIENPTkZJR19JTlBVVF9DTUEzMDAwIGlzIG5vdCBz
ZXQKQ09ORklHX0lOUFVUX1hFTl9LQkRERVZfRlJPTlRFTkQ9bQojIENPTkZJR19JTlBVVF9JREVB
UEFEX1NMSURFQkFSIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRFJWMjYwWF9IQVBUSUNTIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5QVVRfRFJWMjY2NV9IQVBUSUNTIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5QVVRfRFJWMjY2N19IQVBUSUNTIGlzIG5vdCBzZXQKQ09ORklHX1JNSTRfQ09SRT1tCkNP
TkZJR19STUk0X0kyQz1tCkNPTkZJR19STUk0X1NQST1tCkNPTkZJR19STUk0X1NNQj1tCkNPTkZJ
R19STUk0X0YwMz15CkNPTkZJR19STUk0X0YwM19TRVJJTz1tCkNPTkZJR19STUk0XzJEX1NFTlNP
Uj15CkNPTkZJR19STUk0X0YxMT15CkNPTkZJR19STUk0X0YxMj15CkNPTkZJR19STUk0X0YzMD15
CkNPTkZJR19STUk0X0YzND15CiMgQ09ORklHX1JNSTRfRjNBIGlzIG5vdCBzZXQKIyBDT05GSUdf
Uk1JNF9GNTQgaXMgbm90IHNldApDT05GSUdfUk1JNF9GNTU9eQoKIwojIEhhcmR3YXJlIEkvTyBw
b3J0cwojCkNPTkZJR19TRVJJTz15CkNPTkZJR19BUkNIX01JR0hUX0hBVkVfUENfU0VSSU89eQpD
T05GSUdfU0VSSU9fSTgwNDI9eQpDT05GSUdfU0VSSU9fU0VSUE9SVD15CiMgQ09ORklHX1NFUklP
X0NUODJDNzEwIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSU9fUEFSS0JEIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VSSU9fUENJUFMyIGlzIG5vdCBzZXQKQ09ORklHX1NFUklPX0xJQlBTMj15CkNPTkZJ
R19TRVJJT19SQVc9bQpDT05GSUdfU0VSSU9fQUxURVJBX1BTMj1tCiMgQ09ORklHX1NFUklPX1BT
Mk1VTFQgaXMgbm90IHNldApDT05GSUdfU0VSSU9fQVJDX1BTMj1tCkNPTkZJR19IWVBFUlZfS0VZ
Qk9BUkQ9bQojIENPTkZJR19TRVJJT19HUElPX1BTMiBpcyBub3Qgc2V0CiMgQ09ORklHX1VTRVJJ
TyBpcyBub3Qgc2V0CiMgQ09ORklHX0dBTUVQT1JUIGlzIG5vdCBzZXQKIyBlbmQgb2YgSGFyZHdh
cmUgSS9PIHBvcnRzCiMgZW5kIG9mIElucHV0IGRldmljZSBzdXBwb3J0CgojCiMgQ2hhcmFjdGVy
IGRldmljZXMKIwpDT05GSUdfVFRZPXkKQ09ORklHX1ZUPXkKQ09ORklHX0NPTlNPTEVfVFJBTlNM
QVRJT05TPXkKQ09ORklHX1ZUX0NPTlNPTEU9eQpDT05GSUdfVlRfQ09OU09MRV9TTEVFUD15CkNP
TkZJR19IV19DT05TT0xFPXkKQ09ORklHX1ZUX0hXX0NPTlNPTEVfQklORElORz15CkNPTkZJR19V
TklYOThfUFRZUz15CiMgQ09ORklHX0xFR0FDWV9QVFlTIGlzIG5vdCBzZXQKQ09ORklHX0xESVND
X0FVVE9MT0FEPXkKCiMKIyBTZXJpYWwgZHJpdmVycwojCkNPTkZJR19TRVJJQUxfRUFSTFlDT049
eQpDT05GSUdfU0VSSUFMXzgyNTA9eQojIENPTkZJR19TRVJJQUxfODI1MF9ERVBSRUNBVEVEX09Q
VElPTlMgaXMgbm90IHNldApDT05GSUdfU0VSSUFMXzgyNTBfUE5QPXkKIyBDT05GSUdfU0VSSUFM
XzgyNTBfMTY1NTBBX1ZBUklBTlRTIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMXzgyNTBfRklO
VEVLIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF84MjUwX0NPTlNPTEU9eQpDT05GSUdfU0VSSUFM
XzgyNTBfRE1BPXkKQ09ORklHX1NFUklBTF84MjUwX1BDST15CkNPTkZJR19TRVJJQUxfODI1MF9F
WEFSPXkKQ09ORklHX1NFUklBTF84MjUwX05SX1VBUlRTPTY0CkNPTkZJR19TRVJJQUxfODI1MF9S
VU5USU1FX1VBUlRTPTQKQ09ORklHX1NFUklBTF84MjUwX0VYVEVOREVEPXkKQ09ORklHX1NFUklB
TF84MjUwX01BTllfUE9SVFM9eQpDT05GSUdfU0VSSUFMXzgyNTBfU0hBUkVfSVJRPXkKIyBDT05G
SUdfU0VSSUFMXzgyNTBfREVURUNUX0lSUSBpcyBub3Qgc2V0CkNPTkZJR19TRVJJQUxfODI1MF9S
U0E9eQpDT05GSUdfU0VSSUFMXzgyNTBfRFdMSUI9eQpDT05GSUdfU0VSSUFMXzgyNTBfRFc9eQoj
IENPTkZJR19TRVJJQUxfODI1MF9SVDI4OFggaXMgbm90IHNldApDT05GSUdfU0VSSUFMXzgyNTBf
TFBTUz15CkNPTkZJR19TRVJJQUxfODI1MF9NSUQ9eQoKIwojIE5vbi04MjUwIHNlcmlhbCBwb3J0
IHN1cHBvcnQKIwojIENPTkZJR19TRVJJQUxfS0dEQl9OTUkgaXMgbm90IHNldAojIENPTkZJR19T
RVJJQUxfTUFYMzEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9NQVgzMTBYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU0VSSUFMX1VBUlRMSVRFIGlzIG5vdCBzZXQKQ09ORklHX1NFUklBTF9DT1JF
PXkKQ09ORklHX1NFUklBTF9DT1JFX0NPTlNPTEU9eQpDT05GSUdfQ09OU09MRV9QT0xMPXkKQ09O
RklHX1NFUklBTF9KU009bQojIENPTkZJR19TRVJJQUxfTEFOVElRIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VSSUFMX1NDQ05YUCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9TQzE2SVM3WFggaXMg
bm90IHNldAojIENPTkZJR19TRVJJQUxfQkNNNjNYWCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklB
TF9BTFRFUkFfSlRBR1VBUlQgaXMgbm90IHNldAojIENPTkZJR19TRVJJQUxfQUxURVJBX1VBUlQg
aXMgbm90IHNldApDT05GSUdfU0VSSUFMX0FSQz1tCkNPTkZJR19TRVJJQUxfQVJDX05SX1BPUlRT
PTEKIyBDT05GSUdfU0VSSUFMX1JQMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFUklBTF9GU0xfTFBV
QVJUIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VSSUFMX0ZTTF9MSU5GTEVYVUFSVCBpcyBub3Qgc2V0
CiMgQ09ORklHX1NFUklBTF9TUFJEIGlzIG5vdCBzZXQKIyBlbmQgb2YgU2VyaWFsIGRyaXZlcnMK
CkNPTkZJR19TRVJJQUxfTUNUUkxfR1BJTz15CkNPTkZJR19TRVJJQUxfTk9OU1RBTkRBUkQ9eQoj
IENPTkZJR19ST0NLRVRQT1JUIGlzIG5vdCBzZXQKQ09ORklHX0NZQ0xBREVTPW0KIyBDT05GSUdf
Q1laX0lOVFIgaXMgbm90IHNldAojIENPTkZJR19NT1hBX0lOVEVMTElPIGlzIG5vdCBzZXQKIyBD
T05GSUdfTU9YQV9TTUFSVElPIGlzIG5vdCBzZXQKQ09ORklHX1NZTkNMSU5LX0dUPW0KIyBDT05G
SUdfSVNJIGlzIG5vdCBzZXQKQ09ORklHX05fSERMQz1tCkNPTkZJR19OX0dTTT1tCkNPTkZJR19O
T1pPTUk9bQojIENPTkZJR19OVUxMX1RUWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RSQUNFX1NJTksg
aXMgbm90IHNldApDT05GSUdfSFZDX0RSSVZFUj15CkNPTkZJR19IVkNfSVJRPXkKQ09ORklHX0hW
Q19YRU49eQpDT05GSUdfSFZDX1hFTl9GUk9OVEVORD15CiMgQ09ORklHX1NFUklBTF9ERVZfQlVT
IGlzIG5vdCBzZXQKQ09ORklHX1BSSU5URVI9bQojIENPTkZJR19MUF9DT05TT0xFIGlzIG5vdCBz
ZXQKQ09ORklHX1BQREVWPW0KQ09ORklHX1ZJUlRJT19DT05TT0xFPW0KQ09ORklHX0lQTUlfSEFO
RExFUj1tCkNPTkZJR19JUE1JX0RNSV9ERUNPREU9eQpDT05GSUdfSVBNSV9QTEFUX0RBVEE9eQpD
T05GSUdfSVBNSV9QQU5JQ19FVkVOVD15CkNPTkZJR19JUE1JX1BBTklDX1NUUklORz15CkNPTkZJ
R19JUE1JX0RFVklDRV9JTlRFUkZBQ0U9bQpDT05GSUdfSVBNSV9TST1tCkNPTkZJR19JUE1JX1NT
SUY9bQpDT05GSUdfSVBNSV9XQVRDSERPRz1tCkNPTkZJR19JUE1JX1BPV0VST0ZGPW0KQ09ORklH
X0hXX1JBTkRPTT15CkNPTkZJR19IV19SQU5ET01fVElNRVJJT01FTT1tCkNPTkZJR19IV19SQU5E
T01fSU5URUw9bQpDT05GSUdfSFdfUkFORE9NX0FNRD1tCiMgQ09ORklHX0hXX1JBTkRPTV9CQTQz
MSBpcyBub3Qgc2V0CkNPTkZJR19IV19SQU5ET01fVklBPW0KQ09ORklHX0hXX1JBTkRPTV9WSVJU
SU89eQojIENPTkZJR19IV19SQU5ET01fWElQSEVSQSBpcyBub3Qgc2V0CiMgQ09ORklHX0FQUExJ
Q09NIGlzIG5vdCBzZXQKIyBDT05GSUdfTVdBVkUgaXMgbm90IHNldApDT05GSUdfREVWTUVNPXkK
IyBDT05GSUdfREVWS01FTSBpcyBub3Qgc2V0CkNPTkZJR19OVlJBTT15CkNPTkZJR19SQVdfRFJJ
VkVSPXkKQ09ORklHX01BWF9SQVdfREVWUz04MTkyCkNPTkZJR19ERVZQT1JUPXkKQ09ORklHX0hQ
RVQ9eQpDT05GSUdfSFBFVF9NTUFQPXkKIyBDT05GSUdfSFBFVF9NTUFQX0RFRkFVTFQgaXMgbm90
IHNldApDT05GSUdfSEFOR0NIRUNLX1RJTUVSPW0KQ09ORklHX1VWX01NVElNRVI9bQpDT05GSUdf
VENHX1RQTT15CkNPTkZJR19IV19SQU5ET01fVFBNPXkKQ09ORklHX1RDR19USVNfQ09SRT15CkNP
TkZJR19UQ0dfVElTPXkKIyBDT05GSUdfVENHX1RJU19TUEkgaXMgbm90IHNldAojIENPTkZJR19U
Q0dfVElTX0kyQ19DUjUwIGlzIG5vdCBzZXQKQ09ORklHX1RDR19USVNfSTJDX0FUTUVMPW0KQ09O
RklHX1RDR19USVNfSTJDX0lORklORU9OPW0KQ09ORklHX1RDR19USVNfSTJDX05VVk9UT049bQpD
T05GSUdfVENHX05TQz1tCkNPTkZJR19UQ0dfQVRNRUw9bQpDT05GSUdfVENHX0lORklORU9OPW0K
IyBDT05GSUdfVENHX1hFTiBpcyBub3Qgc2V0CkNPTkZJR19UQ0dfQ1JCPXkKIyBDT05GSUdfVENH
X1ZUUE1fUFJPWFkgaXMgbm90IHNldApDT05GSUdfVENHX1RJU19TVDMzWlAyND1tCkNPTkZJR19U
Q0dfVElTX1NUMzNaUDI0X0kyQz1tCiMgQ09ORklHX1RDR19USVNfU1QzM1pQMjRfU1BJIGlzIG5v
dCBzZXQKQ09ORklHX1RFTENMT0NLPW0KIyBDT05GSUdfWElMTFlCVVMgaXMgbm90IHNldAojIGVu
ZCBvZiBDaGFyYWN0ZXIgZGV2aWNlcwoKQ09ORklHX1JBTkRPTV9UUlVTVF9DUFU9eQojIENPTkZJ
R19SQU5ET01fVFJVU1RfQk9PVExPQURFUiBpcyBub3Qgc2V0CgojCiMgSTJDIHN1cHBvcnQKIwpD
T05GSUdfSTJDPXkKQ09ORklHX0FDUElfSTJDX09QUkVHSU9OPXkKQ09ORklHX0kyQ19CT0FSRElO
Rk89eQpDT05GSUdfSTJDX0NPTVBBVD15CkNPTkZJR19JMkNfQ0hBUkRFVj1tCkNPTkZJR19JMkNf
TVVYPW0KCiMKIyBNdWx0aXBsZXhlciBJMkMgQ2hpcCBzdXBwb3J0CiMKIyBDT05GSUdfSTJDX01V
WF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9MVEM0MzA2IGlzIG5vdCBzZXQKIyBD
T05GSUdfSTJDX01VWF9QQ0E5NTQxIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9QQ0E5NTR4
IGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX01VWF9SRUcgaXMgbm90IHNldApDT05GSUdfSTJDX01V
WF9NTFhDUExEPW0KIyBlbmQgb2YgTXVsdGlwbGV4ZXIgSTJDIENoaXAgc3VwcG9ydAoKQ09ORklH
X0kyQ19IRUxQRVJfQVVUTz15CkNPTkZJR19JMkNfU01CVVM9bQpDT05GSUdfSTJDX0FMR09CSVQ9
bQpDT05GSUdfSTJDX0FMR09QQ0E9bQoKIwojIEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydAojCgoj
CiMgUEMgU01CdXMgaG9zdCBjb250cm9sbGVyIGRyaXZlcnMKIwojIENPTkZJR19JMkNfQUxJMTUz
NSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19BTEkxNTYzIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJD
X0FMSTE1WDMgaXMgbm90IHNldApDT05GSUdfSTJDX0FNRDc1Nj1tCkNPTkZJR19JMkNfQU1ENzU2
X1M0ODgyPW0KQ09ORklHX0kyQ19BTUQ4MTExPW0KIyBDT05GSUdfSTJDX0FNRF9NUDIgaXMgbm90
IHNldApDT05GSUdfSTJDX0k4MDE9bQpDT05GSUdfSTJDX0lTQ0g9bQpDT05GSUdfSTJDX0lTTVQ9
bQpDT05GSUdfSTJDX1BJSVg0PW0KQ09ORklHX0kyQ19ORk9SQ0UyPW0KQ09ORklHX0kyQ19ORk9S
Q0UyX1M0OTg1PW0KIyBDT05GSUdfSTJDX05WSURJQV9HUFUgaXMgbm90IHNldAojIENPTkZJR19J
MkNfU0lTNTU5NSBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19TSVM2MzAgaXMgbm90IHNldApDT05G
SUdfSTJDX1NJUzk2WD1tCkNPTkZJR19JMkNfVklBPW0KQ09ORklHX0kyQ19WSUFQUk89bQoKIwoj
IEFDUEkgZHJpdmVycwojCkNPTkZJR19JMkNfU0NNST1tCgojCiMgSTJDIHN5c3RlbSBidXMgZHJp
dmVycyAobW9zdGx5IGVtYmVkZGVkIC8gc3lzdGVtLW9uLWNoaXApCiMKIyBDT05GSUdfSTJDX0NC
VVNfR1BJTyBpcyBub3Qgc2V0CkNPTkZJR19JMkNfREVTSUdOV0FSRV9DT1JFPW0KIyBDT05GSUdf
STJDX0RFU0lHTldBUkVfU0xBVkUgaXMgbm90IHNldApDT05GSUdfSTJDX0RFU0lHTldBUkVfUExB
VEZPUk09bQpDT05GSUdfSTJDX0RFU0lHTldBUkVfQkFZVFJBSUw9eQojIENPTkZJR19JMkNfREVT
SUdOV0FSRV9QQ0kgaXMgbm90IHNldAojIENPTkZJR19JMkNfRU1FVjIgaXMgbm90IHNldAojIENP
TkZJR19JMkNfR1BJTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19PQ09SRVMgaXMgbm90IHNldApD
T05GSUdfSTJDX1BDQV9QTEFURk9STT1tCkNPTkZJR19JMkNfU0lNVEVDPW0KIyBDT05GSUdfSTJD
X1hJTElOWCBpcyBub3Qgc2V0CgojCiMgRXh0ZXJuYWwgSTJDL1NNQnVzIGFkYXB0ZXIgZHJpdmVy
cwojCkNPTkZJR19JMkNfRElPTEFOX1UyQz1tCkNPTkZJR19JMkNfUEFSUE9SVD1tCiMgQ09ORklH
X0kyQ19ST0JPVEZVWlpfT1NJRiBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19UQU9TX0VWTSBpcyBu
b3Qgc2V0CkNPTkZJR19JMkNfVElOWV9VU0I9bQpDT05GSUdfSTJDX1ZJUEVSQk9BUkQ9bQoKIwoj
IE90aGVyIEkyQy9TTUJ1cyBidXMgZHJpdmVycwojCkNPTkZJR19JMkNfTUxYQ1BMRD1tCiMgZW5k
IG9mIEkyQyBIYXJkd2FyZSBCdXMgc3VwcG9ydAoKQ09ORklHX0kyQ19TVFVCPW0KIyBDT05GSUdf
STJDX1NMQVZFIGlzIG5vdCBzZXQKIyBDT05GSUdfSTJDX0RFQlVHX0NPUkUgaXMgbm90IHNldAoj
IENPTkZJR19JMkNfREVCVUdfQUxHTyBpcyBub3Qgc2V0CiMgQ09ORklHX0kyQ19ERUJVR19CVVMg
aXMgbm90IHNldAojIGVuZCBvZiBJMkMgc3VwcG9ydAoKIyBDT05GSUdfSTNDIGlzIG5vdCBzZXQK
Q09ORklHX1NQST15CiMgQ09ORklHX1NQSV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19TUElfTUFT
VEVSPXkKIyBDT05GSUdfU1BJX01FTSBpcyBub3Qgc2V0CgojCiMgU1BJIE1hc3RlciBDb250cm9s
bGVyIERyaXZlcnMKIwojIENPTkZJR19TUElfQUxURVJBIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJ
X0FYSV9TUElfRU5HSU5FIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0JJVEJBTkcgaXMgbm90IHNl
dAojIENPTkZJR19TUElfQlVUVEVSRkxZIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0NBREVOQ0Ug
aXMgbm90IHNldAojIENPTkZJR19TUElfREVTSUdOV0FSRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQ
SV9OWFBfRkxFWFNQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9HUElPIGlzIG5vdCBzZXQKIyBD
T05GSUdfU1BJX0xNNzBfTExQIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0xBTlRJUV9TU0MgaXMg
bm90IHNldAojIENPTkZJR19TUElfT0NfVElOWSBpcyBub3Qgc2V0CkNPTkZJR19TUElfUFhBMlhY
PW0KQ09ORklHX1NQSV9QWEEyWFhfUENJPW0KIyBDT05GSUdfU1BJX1JPQ0tDSElQIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU1BJX1NDMThJUzYwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9TSUZJVkUg
aXMgbm90IHNldAojIENPTkZJR19TUElfTVhJQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9YQ09N
TSBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9YSUxJTlggaXMgbm90IHNldAojIENPTkZJR19TUElf
WllOUU1QX0dRU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX0FNRCBpcyBub3Qgc2V0CgojCiMg
U1BJIE11bHRpcGxleGVyIHN1cHBvcnQKIwojIENPTkZJR19TUElfTVVYIGlzIG5vdCBzZXQKCiMK
IyBTUEkgUHJvdG9jb2wgTWFzdGVycwojCiMgQ09ORklHX1NQSV9TUElERVYgaXMgbm90IHNldAoj
IENPTkZJR19TUElfTE9PUEJBQ0tfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1NQSV9UTEU2Mlgw
IGlzIG5vdCBzZXQKIyBDT05GSUdfU1BJX1NMQVZFIGlzIG5vdCBzZXQKQ09ORklHX1NQSV9EWU5B
TUlDPXkKIyBDT05GSUdfU1BNSSBpcyBub3Qgc2V0CiMgQ09ORklHX0hTSSBpcyBub3Qgc2V0CkNP
TkZJR19QUFM9eQojIENPTkZJR19QUFNfREVCVUcgaXMgbm90IHNldAoKIwojIFBQUyBjbGllbnRz
IHN1cHBvcnQKIwojIENPTkZJR19QUFNfQ0xJRU5UX0tUSU1FUiBpcyBub3Qgc2V0CkNPTkZJR19Q
UFNfQ0xJRU5UX0xESVNDPW0KQ09ORklHX1BQU19DTElFTlRfUEFSUE9SVD1tCkNPTkZJR19QUFNf
Q0xJRU5UX0dQSU89bQoKIwojIFBQUyBnZW5lcmF0b3JzIHN1cHBvcnQKIwoKIwojIFBUUCBjbG9j
ayBzdXBwb3J0CiMKQ09ORklHX1BUUF8xNTg4X0NMT0NLPXkKQ09ORklHX0RQODM2NDBfUEhZPW0K
IyBDT05GSUdfUFRQXzE1ODhfQ0xPQ0tfSU5FUyBpcyBub3Qgc2V0CkNPTkZJR19QVFBfMTU4OF9D
TE9DS19LVk09bQojIENPTkZJR19QVFBfMTU4OF9DTE9DS19JRFQ4MlAzMyBpcyBub3Qgc2V0CiMg
Q09ORklHX1BUUF8xNTg4X0NMT0NLX0lEVENNIGlzIG5vdCBzZXQKQ09ORklHX1BUUF8xNTg4X0NM
T0NLX1ZNVz1tCiMgQ09ORklHX1BUUF8xNTg4X0NMT0NLX09DUCBpcyBub3Qgc2V0CiMgZW5kIG9m
IFBUUCBjbG9jayBzdXBwb3J0CgpDT05GSUdfUElOQ1RSTD15CkNPTkZJR19QSU5NVVg9eQpDT05G
SUdfUElOQ09ORj15CkNPTkZJR19HRU5FUklDX1BJTkNPTkY9eQojIENPTkZJR19ERUJVR19QSU5D
VFJMIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfQU1EPW0KIyBDT05GSUdfUElOQ1RSTF9NQ1Ay
M1MwOCBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfU1gxNTBYIGlzIG5vdCBzZXQKQ09ORklH
X1BJTkNUUkxfQkFZVFJBSUw9eQojIENPTkZJR19QSU5DVFJMX0NIRVJSWVZJRVcgaXMgbm90IHNl
dAojIENPTkZJR19QSU5DVFJMX0xZTlhQT0lOVCBpcyBub3Qgc2V0CkNPTkZJR19QSU5DVFJMX0lO
VEVMPXkKIyBDT05GSUdfUElOQ1RSTF9BTERFUkxBS0UgaXMgbm90IHNldApDT05GSUdfUElOQ1RS
TF9CUk9YVE9OPW0KQ09ORklHX1BJTkNUUkxfQ0FOTk9OTEFLRT1tCkNPTkZJR19QSU5DVFJMX0NF
REFSRk9SSz1tCkNPTkZJR19QSU5DVFJMX0RFTlZFUlRPTj1tCiMgQ09ORklHX1BJTkNUUkxfRUxL
SEFSVExBS0UgaXMgbm90IHNldAojIENPTkZJR19QSU5DVFJMX0VNTUlUU0JVUkcgaXMgbm90IHNl
dApDT05GSUdfUElOQ1RSTF9HRU1JTklMQUtFPW0KQ09ORklHX1BJTkNUUkxfSUNFTEFLRT1tCiMg
Q09ORklHX1BJTkNUUkxfSkFTUEVSTEFLRSBpcyBub3Qgc2V0CiMgQ09ORklHX1BJTkNUUkxfTEFL
RUZJRUxEIGlzIG5vdCBzZXQKQ09ORklHX1BJTkNUUkxfTEVXSVNCVVJHPW0KQ09ORklHX1BJTkNU
UkxfU1VOUklTRVBPSU5UPW0KQ09ORklHX1BJTkNUUkxfVElHRVJMQUtFPW0KCiMKIyBSZW5lc2Fz
IHBpbmN0cmwgZHJpdmVycwojCiMgZW5kIG9mIFJlbmVzYXMgcGluY3RybCBkcml2ZXJzCgpDT05G
SUdfR1BJT0xJQj15CkNPTkZJR19HUElPTElCX0ZBU1RQQVRIX0xJTUlUPTUxMgpDT05GSUdfR1BJ
T19BQ1BJPXkKQ09ORklHX0dQSU9MSUJfSVJRQ0hJUD15CiMgQ09ORklHX0RFQlVHX0dQSU8gaXMg
bm90IHNldApDT05GSUdfR1BJT19DREVWPXkKQ09ORklHX0dQSU9fQ0RFVl9WMT15CkNPTkZJR19H
UElPX0dFTkVSSUM9bQoKIwojIE1lbW9yeSBtYXBwZWQgR1BJTyBkcml2ZXJzCiMKQ09ORklHX0dQ
SU9fQU1EUFQ9bQojIENPTkZJR19HUElPX0RXQVBCIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19F
WEFSIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19HRU5FUklDX1BMQVRGT1JNIGlzIG5vdCBzZXQK
Q09ORklHX0dQSU9fSUNIPW0KIyBDT05GSUdfR1BJT19NQjg2UzdYIGlzIG5vdCBzZXQKIyBDT05G
SUdfR1BJT19WWDg1NSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fQU1EX0ZDSCBpcyBub3Qgc2V0
CiMgZW5kIG9mIE1lbW9yeSBtYXBwZWQgR1BJTyBkcml2ZXJzCgojCiMgUG9ydC1tYXBwZWQgSS9P
IEdQSU8gZHJpdmVycwojCiMgQ09ORklHX0dQSU9fRjcxODhYIGlzIG5vdCBzZXQKIyBDT05GSUdf
R1BJT19JVDg3IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19TQ0ggaXMgbm90IHNldAojIENPTkZJ
R19HUElPX1NDSDMxMVggaXMgbm90IHNldAojIENPTkZJR19HUElPX1dJTkJPTkQgaXMgbm90IHNl
dAojIENPTkZJR19HUElPX1dTMTZDNDggaXMgbm90IHNldAojIGVuZCBvZiBQb3J0LW1hcHBlZCBJ
L08gR1BJTyBkcml2ZXJzCgojCiMgSTJDIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdfR1BJT19B
RFA1NTg4IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NQVg3MzAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfR1BJT19NQVg3MzJYIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0E5NTNYIGlzIG5vdCBz
ZXQKIyBDT05GSUdfR1BJT19QQ0E5NTcwIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19QQ0Y4NTdY
IGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19UUElDMjgxMCBpcyBub3Qgc2V0CiMgZW5kIG9mIEky
QyBHUElPIGV4cGFuZGVycwoKIwojIE1GRCBHUElPIGV4cGFuZGVycwojCiMgZW5kIG9mIE1GRCBH
UElPIGV4cGFuZGVycwoKIwojIFBDSSBHUElPIGV4cGFuZGVycwojCiMgQ09ORklHX0dQSU9fQU1E
ODExMSBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTUxfSU9IIGlzIG5vdCBzZXQKIyBDT05GSUdf
R1BJT19QQ0lfSURJT18xNiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUENJRV9JRElPXzI0IGlz
IG5vdCBzZXQKIyBDT05GSUdfR1BJT19SREMzMjFYIGlzIG5vdCBzZXQKIyBlbmQgb2YgUENJIEdQ
SU8gZXhwYW5kZXJzCgojCiMgU1BJIEdQSU8gZXhwYW5kZXJzCiMKIyBDT05GSUdfR1BJT19NQVgz
MTkxWCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fTUFYNzMwMSBpcyBub3Qgc2V0CiMgQ09ORklH
X0dQSU9fTUMzMzg4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0dQSU9fUElTT1NSIGlzIG5vdCBzZXQK
IyBDT05GSUdfR1BJT19YUkExNDAzIGlzIG5vdCBzZXQKIyBlbmQgb2YgU1BJIEdQSU8gZXhwYW5k
ZXJzCgojCiMgVVNCIEdQSU8gZXhwYW5kZXJzCiMKQ09ORklHX0dQSU9fVklQRVJCT0FSRD1tCiMg
ZW5kIG9mIFVTQiBHUElPIGV4cGFuZGVycwoKIwojIFZpcnR1YWwgR1BJTyBkcml2ZXJzCiMKIyBD
T05GSUdfR1BJT19BR0dSRUdBVE9SIGlzIG5vdCBzZXQKIyBDT05GSUdfR1BJT19NT0NLVVAgaXMg
bm90IHNldAojIGVuZCBvZiBWaXJ0dWFsIEdQSU8gZHJpdmVycwoKIyBDT05GSUdfVzEgaXMgbm90
IHNldApDT05GSUdfUE9XRVJfUkVTRVQ9eQojIENPTkZJR19QT1dFUl9SRVNFVF9SRVNUQVJUIGlz
IG5vdCBzZXQKQ09ORklHX1BPV0VSX1NVUFBMWT15CiMgQ09ORklHX1BPV0VSX1NVUFBMWV9ERUJV
RyBpcyBub3Qgc2V0CkNPTkZJR19QT1dFUl9TVVBQTFlfSFdNT049eQojIENPTkZJR19QREFfUE9X
RVIgaXMgbm90IHNldAojIENPTkZJR19HRU5FUklDX0FEQ19CQVRURVJZIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEVTVF9QT1dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQURQNTA2MSBpcyBu
b3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfQ1cyMDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVS
WV9EUzI3ODAgaXMgbm90IHNldAojIENPTkZJR19CQVRURVJZX0RTMjc4MSBpcyBub3Qgc2V0CiMg
Q09ORklHX0JBVFRFUllfRFMyNzgyIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9TQlMgaXMg
bm90IHNldAojIENPTkZJR19DSEFSR0VSX1NCUyBpcyBub3Qgc2V0CiMgQ09ORklHX01BTkFHRVJf
U0JTIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFUVEVSWV9CUTI3WFhYIGlzIG5vdCBzZXQKIyBDT05G
SUdfQkFUVEVSWV9NQVgxNzA0MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBVFRFUllfTUFYMTcwNDIg
aXMgbm90IHNldAojIENPTkZJR19DSEFSR0VSX01BWDg5MDMgaXMgbm90IHNldAojIENPTkZJR19D
SEFSR0VSX0xQODcyNyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfR1BJTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0NIQVJHRVJfTFQzNjUxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9MVEM0
MTYyTCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDE1WCBpcyBub3Qgc2V0CiMgQ09O
RklHX0NIQVJHRVJfQlEyNDI1NyBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNDczNSBp
cyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNTE1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0NI
QVJHRVJfQlEyNTg5MCBpcyBub3Qgc2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNTk4MCBpcyBub3Qg
c2V0CiMgQ09ORklHX0NIQVJHRVJfQlEyNTZYWCBpcyBub3Qgc2V0CkNPTkZJR19DSEFSR0VSX1NN
QjM0Nz1tCiMgQ09ORklHX0JBVFRFUllfR0FVR0VfTFRDMjk0MSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NIQVJHRVJfUlQ5NDU1IGlzIG5vdCBzZXQKIyBDT05GSUdfQ0hBUkdFUl9CRDk5OTU0IGlzIG5v
dCBzZXQKQ09ORklHX0hXTU9OPXkKQ09ORklHX0hXTU9OX1ZJRD1tCiMgQ09ORklHX0hXTU9OX0RF
QlVHX0NISVAgaXMgbm90IHNldAoKIwojIE5hdGl2ZSBkcml2ZXJzCiMKQ09ORklHX1NFTlNPUlNf
QUJJVFVHVVJVPW0KQ09ORklHX1NFTlNPUlNfQUJJVFVHVVJVMz1tCiMgQ09ORklHX1NFTlNPUlNf
QUQ3MzE0IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQUQ3NDE0PW0KQ09ORklHX1NFTlNPUlNf
QUQ3NDE4PW0KQ09ORklHX1NFTlNPUlNfQURNMTAyMT1tCkNPTkZJR19TRU5TT1JTX0FETTEwMjU9
bQpDT05GSUdfU0VOU09SU19BRE0xMDI2PW0KQ09ORklHX1NFTlNPUlNfQURNMTAyOT1tCkNPTkZJ
R19TRU5TT1JTX0FETTEwMzE9bQojIENPTkZJR19TRU5TT1JTX0FETTExNzcgaXMgbm90IHNldApD
T05GSUdfU0VOU09SU19BRE05MjQwPW0KQ09ORklHX1NFTlNPUlNfQURUN1gxMD1tCiMgQ09ORklH
X1NFTlNPUlNfQURUNzMxMCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FEVDc0MTA9bQpDT05G
SUdfU0VOU09SU19BRFQ3NDExPW0KQ09ORklHX1NFTlNPUlNfQURUNzQ2Mj1tCkNPTkZJR19TRU5T
T1JTX0FEVDc0NzA9bQpDT05GSUdfU0VOU09SU19BRFQ3NDc1PW0KIyBDT05GSUdfU0VOU09SU19B
SFQxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQVMzNzAgaXMgbm90IHNldApDT05GSUdf
U0VOU09SU19BU0M3NjIxPW0KIyBDT05GSUdfU0VOU09SU19BWElfRkFOX0NPTlRST0wgaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19LOFRFTVA9bQpDT05GSUdfU0VOU09SU19LMTBURU1QPW0KQ09O
RklHX1NFTlNPUlNfRkFNMTVIX1BPV0VSPW0KIyBDT05GSUdfU0VOU09SU19BTURfRU5FUkdZIGlz
IG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfQVBQTEVTTUM9bQpDT05GSUdfU0VOU09SU19BU0IxMDA9
bQojIENPTkZJR19TRU5TT1JTX0FTUEVFRCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0FUWFAx
PW0KIyBDT05GSUdfU0VOU09SU19DT1JTQUlSX0NQUk8gaXMgbm90IHNldAojIENPTkZJR19TRU5T
T1JTX0NPUlNBSVJfUFNVIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19EUklWRVRFTVAgaXMg
bm90IHNldApDT05GSUdfU0VOU09SU19EUzYyMD1tCkNPTkZJR19TRU5TT1JTX0RTMTYyMT1tCkNP
TkZJR19TRU5TT1JTX0RFTExfU01NPW0KQ09ORklHX1NFTlNPUlNfSTVLX0FNQj1tCkNPTkZJR19T
RU5TT1JTX0Y3MTgwNUY9bQpDT05GSUdfU0VOU09SU19GNzE4ODJGRz1tCkNPTkZJR19TRU5TT1JT
X0Y3NTM3NVM9bQpDT05GSUdfU0VOU09SU19GU0NITUQ9bQojIENPTkZJR19TRU5TT1JTX0ZUU1RF
VVRBVEVTIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfR0w1MThTTT1tCkNPTkZJR19TRU5TT1JT
X0dMNTIwU009bQpDT05GSUdfU0VOU09SU19HNzYwQT1tCiMgQ09ORklHX1NFTlNPUlNfRzc2MiBp
cyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSElINjEzMCBpcyBub3Qgc2V0CkNPTkZJR19TRU5T
T1JTX0lCTUFFTT1tCkNPTkZJR19TRU5TT1JTX0lCTVBFWD1tCiMgQ09ORklHX1NFTlNPUlNfSUlP
X0hXTU9OIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfSTU1MDA9bQpDT05GSUdfU0VOU09SU19D
T1JFVEVNUD1tCkNPTkZJR19TRU5TT1JTX0lUODc9bQpDT05GSUdfU0VOU09SU19KQzQyPW0KIyBD
T05GSUdfU0VOU09SU19QT1dSMTIyMCBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xJTkVBR0U9
bQojIENPTkZJR19TRU5TT1JTX0xUQzI5NDUgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0xU
QzI5NDdfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19MVEMyOTQ3X1NQSSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NFTlNPUlNfTFRDMjk5MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNf
TFRDMjk5MiBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX0xUQzQxNTE9bQpDT05GSUdfU0VOU09S
U19MVEM0MjE1PW0KIyBDT05GSUdfU0VOU09SU19MVEM0MjIyIGlzIG5vdCBzZXQKQ09ORklHX1NF
TlNPUlNfTFRDNDI0NT1tCiMgQ09ORklHX1NFTlNPUlNfTFRDNDI2MCBpcyBub3Qgc2V0CkNPTkZJ
R19TRU5TT1JTX0xUQzQyNjE9bQojIENPTkZJR19TRU5TT1JTX01BWDExMTEgaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX01BWDEyNyBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01BWDE2MDY1
PW0KQ09ORklHX1NFTlNPUlNfTUFYMTYxOT1tCkNPTkZJR19TRU5TT1JTX01BWDE2Njg9bQpDT05G
SUdfU0VOU09SU19NQVgxOTc9bQojIENPTkZJR19TRU5TT1JTX01BWDMxNzIyIGlzIG5vdCBzZXQK
IyBDT05GSUdfU0VOU09SU19NQVgzMTczMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFY
NjYyMSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01BWDY2Mzk9bQpDT05GSUdfU0VOU09SU19N
QVg2NjQyPW0KQ09ORklHX1NFTlNPUlNfTUFYNjY1MD1tCkNPTkZJR19TRU5TT1JTX01BWDY2OTc9
bQojIENPTkZJR19TRU5TT1JTX01BWDMxNzkwIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTUNQ
MzAyMT1tCkNPTkZJR19TRU5TT1JTX01MWFJFR19GQU49bQojIENPTkZJR19TRU5TT1JTX1RDNjU0
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19UUFMyMzg2MSBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfTVI3NTIwMyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfQURDWFggaXMgbm90
IHNldApDT05GSUdfU0VOU09SU19MTTYzPW0KIyBDT05GSUdfU0VOU09SU19MTTcwIGlzIG5vdCBz
ZXQKQ09ORklHX1NFTlNPUlNfTE03Mz1tCkNPTkZJR19TRU5TT1JTX0xNNzU9bQpDT05GSUdfU0VO
U09SU19MTTc3PW0KQ09ORklHX1NFTlNPUlNfTE03OD1tCkNPTkZJR19TRU5TT1JTX0xNODA9bQpD
T05GSUdfU0VOU09SU19MTTgzPW0KQ09ORklHX1NFTlNPUlNfTE04NT1tCkNPTkZJR19TRU5TT1JT
X0xNODc9bQpDT05GSUdfU0VOU09SU19MTTkwPW0KQ09ORklHX1NFTlNPUlNfTE05Mj1tCkNPTkZJ
R19TRU5TT1JTX0xNOTM9bQpDT05GSUdfU0VOU09SU19MTTk1MjM0PW0KQ09ORklHX1NFTlNPUlNf
TE05NTI0MT1tCkNPTkZJR19TRU5TT1JTX0xNOTUyNDU9bQpDT05GSUdfU0VOU09SU19QQzg3MzYw
PW0KQ09ORklHX1NFTlNPUlNfUEM4NzQyNz1tCkNPTkZJR19TRU5TT1JTX05UQ19USEVSTUlTVE9S
PW0KIyBDT05GSUdfU0VOU09SU19OQ1Q2NjgzIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfTkNU
Njc3NT1tCiMgQ09ORklHX1NFTlNPUlNfTkNUNzgwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNP
UlNfTkNUNzkwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTlBDTTdYWCBpcyBub3Qgc2V0
CkNPTkZJR19TRU5TT1JTX1BDRjg1OTE9bQpDT05GSUdfUE1CVVM9bQpDT05GSUdfU0VOU09SU19Q
TUJVUz1tCiMgQ09ORklHX1NFTlNPUlNfQURNMTI2NiBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JT
X0FETTEyNzU9bQojIENPTkZJR19TRU5TT1JTX0JFTF9QRkUgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX0lCTV9DRkZQUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSU5TUFVSX0lQU1BT
IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JUjM1MjIxIGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19JUjM4MDY0IGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19JUlBTNTQwMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSVNMNjgxMzcgaXMgbm90IHNldApDT05GSUdfU0VOU09S
U19MTTI1MDY2PW0KQ09ORklHX1NFTlNPUlNfTFRDMjk3OD1tCiMgQ09ORklHX1NFTlNPUlNfTFRD
MzgxNSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01BWDE2MDY0PW0KIyBDT05GSUdfU0VOU09S
U19NQVgxNjYwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfTUFYMjA3MzAgaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX01BWDIwNzUxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19N
QVgzMTc4NSBpcyBub3Qgc2V0CkNPTkZJR19TRU5TT1JTX01BWDM0NDQwPW0KQ09ORklHX1NFTlNP
UlNfTUFYODY4OD1tCiMgQ09ORklHX1NFTlNPUlNfTVAyOTc1IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0VOU09SU19QTTY3NjRUUiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUFhFMTYxMCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfUTU0U0oxMDhBMiBpcyBub3Qgc2V0CiMgQ09ORklHX1NF
TlNPUlNfVFBTNDA0MjIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RQUzUzNjc5IGlzIG5v
dCBzZXQKQ09ORklHX1NFTlNPUlNfVUNEOTAwMD1tCkNPTkZJR19TRU5TT1JTX1VDRDkyMDA9bQoj
IENPTkZJR19TRU5TT1JTX1hEUEUxMjIgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19aTDYxMDA9
bQojIENPTkZJR19TRU5TT1JTX1NCVFNJIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfU0hUMTU9
bQpDT05GSUdfU0VOU09SU19TSFQyMT1tCiMgQ09ORklHX1NFTlNPUlNfU0hUM3ggaXMgbm90IHNl
dAojIENPTkZJR19TRU5TT1JTX1NIVEMxIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfU0lTNTU5
NT1tCkNPTkZJR19TRU5TT1JTX0RNRTE3Mzc9bQpDT05GSUdfU0VOU09SU19FTUMxNDAzPW0KIyBD
T05GSUdfU0VOU09SU19FTUMyMTAzIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfRU1DNlcyMDE9
bQpDT05GSUdfU0VOU09SU19TTVNDNDdNMT1tCkNPTkZJR19TRU5TT1JTX1NNU0M0N00xOTI9bQpD
T05GSUdfU0VOU09SU19TTVNDNDdCMzk3PW0KQ09ORklHX1NFTlNPUlNfU0NINTZYWF9DT01NT049
bQpDT05GSUdfU0VOU09SU19TQ0g1NjI3PW0KQ09ORklHX1NFTlNPUlNfU0NINTYzNj1tCiMgQ09O
RklHX1NFTlNPUlNfU1RUUzc1MSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfU01NNjY1IGlz
IG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19BREMxMjhEODE4IGlzIG5vdCBzZXQKQ09ORklHX1NF
TlNPUlNfQURTNzgyOD1tCiMgQ09ORklHX1NFTlNPUlNfQURTNzg3MSBpcyBub3Qgc2V0CkNPTkZJ
R19TRU5TT1JTX0FNQzY4MjE9bQpDT05GSUdfU0VOU09SU19JTkEyMDk9bQpDT05GSUdfU0VOU09S
U19JTkEyWFg9bQojIENPTkZJR19TRU5TT1JTX0lOQTMyMjEgaXMgbm90IHNldAojIENPTkZJR19T
RU5TT1JTX1RDNzQgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19USE1DNTA9bQpDT05GSUdfU0VO
U09SU19UTVAxMDI9bQojIENPTkZJR19TRU5TT1JTX1RNUDEwMyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NFTlNPUlNfVE1QMTA4IGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVE1QNDAxPW0KQ09ORklH
X1NFTlNPUlNfVE1QNDIxPW0KIyBDT05GSUdfU0VOU09SU19UTVA1MTMgaXMgbm90IHNldApDT05G
SUdfU0VOU09SU19WSUFfQ1BVVEVNUD1tCkNPTkZJR19TRU5TT1JTX1ZJQTY4NkE9bQpDT05GSUdf
U0VOU09SU19WVDEyMTE9bQpDT05GSUdfU0VOU09SU19WVDgyMzE9bQojIENPTkZJR19TRU5TT1JT
X1c4Mzc3M0cgaXMgbm90IHNldApDT05GSUdfU0VOU09SU19XODM3ODFEPW0KQ09ORklHX1NFTlNP
UlNfVzgzNzkxRD1tCkNPTkZJR19TRU5TT1JTX1c4Mzc5MkQ9bQpDT05GSUdfU0VOU09SU19XODM3
OTM9bQpDT05GSUdfU0VOU09SU19XODM3OTU9bQojIENPTkZJR19TRU5TT1JTX1c4Mzc5NV9GQU5D
VFJMIGlzIG5vdCBzZXQKQ09ORklHX1NFTlNPUlNfVzgzTDc4NVRTPW0KQ09ORklHX1NFTlNPUlNf
VzgzTDc4Nk5HPW0KQ09ORklHX1NFTlNPUlNfVzgzNjI3SEY9bQpDT05GSUdfU0VOU09SU19XODM2
MjdFSEY9bQojIENPTkZJR19TRU5TT1JTX1hHRU5FIGlzIG5vdCBzZXQKCiMKIyBBQ1BJIGRyaXZl
cnMKIwpDT05GSUdfU0VOU09SU19BQ1BJX1BPV0VSPW0KQ09ORklHX1NFTlNPUlNfQVRLMDExMD1t
CkNPTkZJR19USEVSTUFMPXkKIyBDT05GSUdfVEhFUk1BTF9ORVRMSU5LIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEhFUk1BTF9TVEFUSVNUSUNTIGlzIG5vdCBzZXQKQ09ORklHX1RIRVJNQUxfRU1FUkdF
TkNZX1BPV0VST0ZGX0RFTEFZX01TPTAKQ09ORklHX1RIRVJNQUxfSFdNT049eQpDT05GSUdfVEhF
Uk1BTF9XUklUQUJMRV9UUklQUz15CkNPTkZJR19USEVSTUFMX0RFRkFVTFRfR09WX1NURVBfV0lT
RT15CiMgQ09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfRkFJUl9TSEFSRSBpcyBub3Qgc2V0CiMg
Q09ORklHX1RIRVJNQUxfREVGQVVMVF9HT1ZfVVNFUl9TUEFDRSBpcyBub3Qgc2V0CkNPTkZJR19U
SEVSTUFMX0dPVl9GQUlSX1NIQVJFPXkKQ09ORklHX1RIRVJNQUxfR09WX1NURVBfV0lTRT15CkNP
TkZJR19USEVSTUFMX0dPVl9CQU5HX0JBTkc9eQpDT05GSUdfVEhFUk1BTF9HT1ZfVVNFUl9TUEFD
RT15CiMgQ09ORklHX1RIRVJNQUxfRU1VTEFUSU9OIGlzIG5vdCBzZXQKCiMKIyBJbnRlbCB0aGVy
bWFsIGRyaXZlcnMKIwpDT05GSUdfSU5URUxfUE9XRVJDTEFNUD1tCkNPTkZJR19YODZfVEhFUk1B
TF9WRUNUT1I9eQpDT05GSUdfWDg2X1BLR19URU1QX1RIRVJNQUw9bQpDT05GSUdfSU5URUxfU09D
X0RUU19JT1NGX0NPUkU9bQojIENPTkZJR19JTlRFTF9TT0NfRFRTX1RIRVJNQUwgaXMgbm90IHNl
dAoKIwojIEFDUEkgSU5UMzQwWCB0aGVybWFsIGRyaXZlcnMKIwpDT05GSUdfSU5UMzQwWF9USEVS
TUFMPW0KQ09ORklHX0FDUElfVEhFUk1BTF9SRUw9bQojIENPTkZJR19JTlQzNDA2X1RIRVJNQUwg
aXMgbm90IHNldApDT05GSUdfUFJPQ19USEVSTUFMX01NSU9fUkFQTD1tCiMgZW5kIG9mIEFDUEkg
SU5UMzQwWCB0aGVybWFsIGRyaXZlcnMKCkNPTkZJR19JTlRFTF9QQ0hfVEhFUk1BTD1tCiMgZW5k
IG9mIEludGVsIHRoZXJtYWwgZHJpdmVycwoKIyBDT05GSUdfR0VORVJJQ19BRENfVEhFUk1BTCBp
cyBub3Qgc2V0CkNPTkZJR19XQVRDSERPRz15CkNPTkZJR19XQVRDSERPR19DT1JFPXkKIyBDT05G
SUdfV0FUQ0hET0dfTk9XQVlPVVQgaXMgbm90IHNldApDT05GSUdfV0FUQ0hET0dfSEFORExFX0JP
T1RfRU5BQkxFRD15CkNPTkZJR19XQVRDSERPR19PUEVOX1RJTUVPVVQ9MApDT05GSUdfV0FUQ0hE
T0dfU1lTRlM9eQoKIwojIFdhdGNoZG9nIFByZXRpbWVvdXQgR292ZXJub3JzCiMKIyBDT05GSUdf
V0FUQ0hET0dfUFJFVElNRU9VVF9HT1YgaXMgbm90IHNldAoKIwojIFdhdGNoZG9nIERldmljZSBE
cml2ZXJzCiMKQ09ORklHX1NPRlRfV0FUQ0hET0c9bQpDT05GSUdfV0RBVF9XRFQ9bQojIENPTkZJ
R19YSUxJTlhfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19aSUlSQVZFX1dBVENIRE9HIGlz
IG5vdCBzZXQKQ09ORklHX01MWF9XRFQ9bQojIENPTkZJR19DQURFTkNFX1dBVENIRE9HIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFdfV0FUQ0hET0cgaXMgbm90IHNldAojIENPTkZJR19NQVg2M1hYX1dB
VENIRE9HIGlzIG5vdCBzZXQKIyBDT05GSUdfQUNRVUlSRV9XRFQgaXMgbm90IHNldAojIENPTkZJ
R19BRFZBTlRFQ0hfV0RUIGlzIG5vdCBzZXQKQ09ORklHX0FMSU0xNTM1X1dEVD1tCkNPTkZJR19B
TElNNzEwMV9XRFQ9bQojIENPTkZJR19FQkNfQzM4NF9XRFQgaXMgbm90IHNldApDT05GSUdfRjcx
ODA4RV9XRFQ9bQpDT05GSUdfU1A1MTAwX1RDTz1tCkNPTkZJR19TQkNfRklUUEMyX1dBVENIRE9H
PW0KIyBDT05GSUdfRVVST1RFQ0hfV0RUIGlzIG5vdCBzZXQKQ09ORklHX0lCNzAwX1dEVD1tCkNP
TkZJR19JQk1BU1I9bQojIENPTkZJR19XQUZFUl9XRFQgaXMgbm90IHNldApDT05GSUdfSTYzMDBF
U0JfV0RUPW0KQ09ORklHX0lFNlhYX1dEVD1tCkNPTkZJR19JVENPX1dEVD1tCkNPTkZJR19JVENP
X1ZFTkRPUl9TVVBQT1JUPXkKQ09ORklHX0lUODcxMkZfV0RUPW0KQ09ORklHX0lUODdfV0RUPW0K
Q09ORklHX0hQX1dBVENIRE9HPW0KQ09ORklHX0hQV0RUX05NSV9ERUNPRElORz15CiMgQ09ORklH
X1NDMTIwMF9XRFQgaXMgbm90IHNldAojIENPTkZJR19QQzg3NDEzX1dEVCBpcyBub3Qgc2V0CkNP
TkZJR19OVl9UQ089bQojIENPTkZJR182MFhYX1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX0NQVTVf
V0RUIGlzIG5vdCBzZXQKQ09ORklHX1NNU0NfU0NIMzExWF9XRFQ9bQojIENPTkZJR19TTVNDMzdC
Nzg3X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RRTVg4Nl9XRFQgaXMgbm90IHNldApDT05GSUdf
VklBX1dEVD1tCkNPTkZJR19XODM2MjdIRl9XRFQ9bQpDT05GSUdfVzgzODc3Rl9XRFQ9bQpDT05G
SUdfVzgzOTc3Rl9XRFQ9bQpDT05GSUdfTUFDSFpfV0RUPW0KIyBDT05GSUdfU0JDX0VQWF9DM19X
QVRDSERPRyBpcyBub3Qgc2V0CkNPTkZJR19JTlRFTF9NRUlfV0RUPW0KIyBDT05GSUdfTkk5MDNY
X1dEVCBpcyBub3Qgc2V0CiMgQ09ORklHX05JQzcwMThfV0RUIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUVOX0EyMV9XRFQgaXMgbm90IHNldApDT05GSUdfWEVOX1dEVD1tCgojCiMgUENJLWJhc2VkIFdh
dGNoZG9nIENhcmRzCiMKQ09ORklHX1BDSVBDV0FUQ0hET0c9bQpDT05GSUdfV0RUUENJPW0KCiMK
IyBVU0ItYmFzZWQgV2F0Y2hkb2cgQ2FyZHMKIwpDT05GSUdfVVNCUENXQVRDSERPRz1tCkNPTkZJ
R19TU0JfUE9TU0lCTEU9eQojIENPTkZJR19TU0IgaXMgbm90IHNldApDT05GSUdfQkNNQV9QT1NT
SUJMRT15CkNPTkZJR19CQ01BPW0KQ09ORklHX0JDTUFfSE9TVF9QQ0lfUE9TU0lCTEU9eQpDT05G
SUdfQkNNQV9IT1NUX1BDST15CiMgQ09ORklHX0JDTUFfSE9TVF9TT0MgaXMgbm90IHNldApDT05G
SUdfQkNNQV9EUklWRVJfUENJPXkKQ09ORklHX0JDTUFfRFJJVkVSX0dNQUNfQ01OPXkKQ09ORklH
X0JDTUFfRFJJVkVSX0dQSU89eQojIENPTkZJR19CQ01BX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBN
dWx0aWZ1bmN0aW9uIGRldmljZSBkcml2ZXJzCiMKQ09ORklHX01GRF9DT1JFPXkKIyBDT05GSUdf
TUZEX0FTMzcxMSBpcyBub3Qgc2V0CiMgQ09ORklHX1BNSUNfQURQNTUyMCBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9BQVQyODcwX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfQkNNNTkwWFgg
aXMgbm90IHNldAojIENPTkZJR19NRkRfQkQ5NTcxTVdWIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X0FYUDIwWF9JMkMgaXMgbm90IHNldAojIENPTkZJR19NRkRfTUFERVJBIGlzIG5vdCBzZXQKIyBD
T05GSUdfUE1JQ19EQTkwM1ggaXMgbm90IHNldAojIENPTkZJR19NRkRfREE5MDUyX1NQSSBpcyBu
b3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNTJfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RB
OTA1NSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9EQTkwNjIgaXMgbm90IHNldAojIENPTkZJR19N
RkRfREE5MDYzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0RBOTE1MCBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9ETE4yIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01DMTNYWFhfU1BJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfTUZEX01DMTNYWFhfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01QMjYy
OSBpcyBub3Qgc2V0CiMgQ09ORklHX0hUQ19QQVNJQzMgaXMgbm90IHNldAojIENPTkZJR19IVENf
STJDUExEIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0lOVEVMX1FVQVJLX0kyQ19HUElPIGlzIG5v
dCBzZXQKQ09ORklHX0xQQ19JQ0g9bQpDT05GSUdfTFBDX1NDSD1tCiMgQ09ORklHX0lOVEVMX1NP
Q19QTUlDX0NIVERDX1RJIGlzIG5vdCBzZXQKQ09ORklHX01GRF9JTlRFTF9MUFNTPW0KQ09ORklH
X01GRF9JTlRFTF9MUFNTX0FDUEk9bQpDT05GSUdfTUZEX0lOVEVMX0xQU1NfUENJPW0KIyBDT05G
SUdfTUZEX0lOVEVMX1BNQ19CWFQgaXMgbm90IHNldAojIENPTkZJR19NRkRfSU5URUxfUE1UIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0lRUzYyWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9KQU5a
X0NNT0RJTyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9LRU1QTEQgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfODhQTTgwMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF84OFBNODA1IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEXzg4UE04NjBYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDE0NTc3IGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDc3NjkzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01B
WDc3ODQzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX01BWDg5MDcgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTUFYODkyNSBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NQVg4OTk3IGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX01BWDg5OTggaXMgbm90IHNldAojIENPTkZJR19NRkRfTVQ2MzYwIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUZEX01UNjM5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9NRU5GMjFC
TUMgaXMgbm90IHNldAojIENPTkZJR19FWlhfUENBUCBpcyBub3Qgc2V0CkNPTkZJR19NRkRfVklQ
RVJCT0FSRD1tCiMgQ09ORklHX01GRF9SRVRVIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1BDRjUw
NjMzIGlzIG5vdCBzZXQKIyBDT05GSUdfVUNCMTQwMF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1JEQzMyMVggaXMgbm90IHNldAojIENPTkZJR19NRkRfUlQ1MDMzIGlzIG5vdCBzZXQKIyBD
T05GSUdfTUZEX1JDNVQ1ODMgaXMgbm90IHNldAojIENPTkZJR19NRkRfU0VDX0NPUkUgaXMgbm90
IHNldAojIENPTkZJR19NRkRfU0k0NzZYX0NPUkUgaXMgbm90IHNldApDT05GSUdfTUZEX1NNNTAx
PW0KQ09ORklHX01GRF9TTTUwMV9HUElPPXkKIyBDT05GSUdfTUZEX1NLWTgxNDUyIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQUJYNTAwX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19NRkRfU1lTQ09OIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJX0FNMzM1WF9UU0NBREMgaXMgbm90IHNldAojIENPTkZJ
R19NRkRfTFAzOTQzIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0xQODc4OCBpcyBub3Qgc2V0CiMg
Q09ORklHX01GRF9USV9MTVUgaXMgbm90IHNldAojIENPTkZJR19NRkRfUEFMTUFTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVFBTNjEwNVggaXMgbm90IHNldAojIENPTkZJR19UUFM2NTAxMCBpcyBub3Qg
c2V0CiMgQ09ORklHX1RQUzY1MDdYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1MDg2IGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX1RQUzY1MDkwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1RJ
X0xQODczWCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUFM2NTg2WCBpcyBub3Qgc2V0CiMgQ09O
RklHX01GRF9UUFM2NTkxMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUFM2NTkxMl9JMkMgaXMg
bm90IHNldAojIENPTkZJR19NRkRfVFBTNjU5MTJfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZE
X1RQUzgwMDMxIGlzIG5vdCBzZXQKIyBDT05GSUdfVFdMNDAzMF9DT1JFIGlzIG5vdCBzZXQKIyBD
T05GSUdfVFdMNjA0MF9DT1JFIGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX1dMMTI3M19DT1JFIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUZEX0xNMzUzMyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9UUU1Y
ODYgaXMgbm90IHNldApDT05GSUdfTUZEX1ZYODU1PW0KIyBDT05GSUdfTUZEX0FSSVpPTkFfSTJD
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUZEX0FSSVpPTkFfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdf
TUZEX1dNODQwMCBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTgzMVhfSTJDIGlzIG5vdCBzZXQK
IyBDT05GSUdfTUZEX1dNODMxWF9TUEkgaXMgbm90IHNldAojIENPTkZJR19NRkRfV004MzUwX0ky
QyBpcyBub3Qgc2V0CiMgQ09ORklHX01GRF9XTTg5OTQgaXMgbm90IHNldAojIENPTkZJR19NRkRf
SU5URUxfTTEwX0JNQyBpcyBub3Qgc2V0CiMgZW5kIG9mIE11bHRpZnVuY3Rpb24gZGV2aWNlIGRy
aXZlcnMKCiMgQ09ORklHX1JFR1VMQVRPUiBpcyBub3Qgc2V0CkNPTkZJR19SQ19DT1JFPW0KQ09O
RklHX1JDX01BUD1tCkNPTkZJR19MSVJDPXkKQ09ORklHX1JDX0RFQ09ERVJTPXkKQ09ORklHX0lS
X05FQ19ERUNPREVSPW0KQ09ORklHX0lSX1JDNV9ERUNPREVSPW0KQ09ORklHX0lSX1JDNl9ERUNP
REVSPW0KQ09ORklHX0lSX0pWQ19ERUNPREVSPW0KQ09ORklHX0lSX1NPTllfREVDT0RFUj1tCkNP
TkZJR19JUl9TQU5ZT19ERUNPREVSPW0KIyBDT05GSUdfSVJfU0hBUlBfREVDT0RFUiBpcyBub3Qg
c2V0CkNPTkZJR19JUl9NQ0VfS0JEX0RFQ09ERVI9bQojIENPTkZJR19JUl9YTVBfREVDT0RFUiBp
cyBub3Qgc2V0CkNPTkZJR19JUl9JTU9OX0RFQ09ERVI9bQojIENPTkZJR19JUl9SQ01NX0RFQ09E
RVIgaXMgbm90IHNldApDT05GSUdfUkNfREVWSUNFUz15CkNPTkZJR19SQ19BVElfUkVNT1RFPW0K
Q09ORklHX0lSX0VORT1tCkNPTkZJR19JUl9JTU9OPW0KQ09ORklHX0lSX0lNT05fUkFXPW0KQ09O
RklHX0lSX01DRVVTQj1tCkNPTkZJR19JUl9JVEVfQ0lSPW0KQ09ORklHX0lSX0ZJTlRFSz1tCkNP
TkZJR19JUl9OVVZPVE9OPW0KQ09ORklHX0lSX1JFRFJBVDM9bQpDT05GSUdfSVJfU1RSRUFNWkFQ
PW0KQ09ORklHX0lSX1dJTkJPTkRfQ0lSPW0KIyBDT05GSUdfSVJfSUdPUlBMVUdVU0IgaXMgbm90
IHNldApDT05GSUdfSVJfSUdVQU5BPW0KQ09ORklHX0lSX1RUVVNCSVI9bQojIENPTkZJR19SQ19M
T09QQkFDSyBpcyBub3Qgc2V0CkNPTkZJR19JUl9TRVJJQUw9bQpDT05GSUdfSVJfU0VSSUFMX1RS
QU5TTUlUVEVSPXkKQ09ORklHX0lSX1NJUj1tCiMgQ09ORklHX1JDX1hCT1hfRFZEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSVJfVE9ZIGlzIG5vdCBzZXQKQ09ORklHX0NFQ19DT1JFPW0KIyBDT05GSUdf
TUVESUFfQ0VDX1JDIGlzIG5vdCBzZXQKQ09ORklHX01FRElBX0NFQ19TVVBQT1JUPXkKIyBDT05G
SUdfQ0VDX0NINzMyMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NFQ19TRUNPIGlzIG5vdCBzZXQKQ09O
RklHX1VTQl9QVUxTRThfQ0VDPW0KQ09ORklHX1VTQl9SQUlOU0hBRE9XX0NFQz1tCkNPTkZJR19N
RURJQV9TVVBQT1JUPW0KQ09ORklHX01FRElBX1NVUFBPUlRfRklMVEVSPXkKQ09ORklHX01FRElB
X1NVQkRSVl9BVVRPU0VMRUNUPXkKCiMKIyBNZWRpYSBkZXZpY2UgdHlwZXMKIwpDT05GSUdfTUVE
SUFfQ0FNRVJBX1NVUFBPUlQ9eQpDT05GSUdfTUVESUFfQU5BTE9HX1RWX1NVUFBPUlQ9eQpDT05G
SUdfTUVESUFfRElHSVRBTF9UVl9TVVBQT1JUPXkKQ09ORklHX01FRElBX1JBRElPX1NVUFBPUlQ9
eQojIENPTkZJR19NRURJQV9TRFJfU1VQUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX01FRElBX1BM
QVRGT1JNX1NVUFBPUlQgaXMgbm90IHNldAojIENPTkZJR19NRURJQV9URVNUX1NVUFBPUlQgaXMg
bm90IHNldAojIGVuZCBvZiBNZWRpYSBkZXZpY2UgdHlwZXMKCkNPTkZJR19WSURFT19ERVY9bQpD
T05GSUdfTUVESUFfQ09OVFJPTExFUj15CkNPTkZJR19EVkJfQ09SRT1tCgojCiMgVmlkZW80TGlu
dXggb3B0aW9ucwojCkNPTkZJR19WSURFT19WNEwyPW0KQ09ORklHX1ZJREVPX1Y0TDJfSTJDPXkK
IyBDT05GSUdfVklERU9fVjRMMl9TVUJERVZfQVBJIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
QURWX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fRklYRURfTUlOT1JfUkFOR0VTIGlz
IG5vdCBzZXQKQ09ORklHX1ZJREVPX1RVTkVSPW0KQ09ORklHX1ZJREVPQlVGX0dFTj1tCkNPTkZJ
R19WSURFT0JVRl9ETUFfU0c9bQpDT05GSUdfVklERU9CVUZfVk1BTExPQz1tCiMgZW5kIG9mIFZp
ZGVvNExpbnV4IG9wdGlvbnMKCiMKIyBNZWRpYSBjb250cm9sbGVyIG9wdGlvbnMKIwpDT05GSUdf
TUVESUFfQ09OVFJPTExFUl9EVkI9eQojIGVuZCBvZiBNZWRpYSBjb250cm9sbGVyIG9wdGlvbnMK
CiMKIyBEaWdpdGFsIFRWIG9wdGlvbnMKIwojIENPTkZJR19EVkJfTU1BUCBpcyBub3Qgc2V0CkNP
TkZJR19EVkJfTkVUPXkKQ09ORklHX0RWQl9NQVhfQURBUFRFUlM9OApDT05GSUdfRFZCX0RZTkFN
SUNfTUlOT1JTPXkKIyBDT05GSUdfRFZCX0RFTVVYX1NFQ1RJT05fTE9TU19MT0cgaXMgbm90IHNl
dAojIENPTkZJR19EVkJfVUxFX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGlnaXRhbCBUViBv
cHRpb25zCgojCiMgTWVkaWEgZHJpdmVycwojCgojCiMgRHJpdmVycyBmaWx0ZXJlZCBhcyBzZWxl
Y3RlZCBhdCAnRmlsdGVyIG1lZGlhIGRyaXZlcnMnCiMKQ09ORklHX1RUUENJX0VFUFJPTT1tCkNP
TkZJR19NRURJQV9VU0JfU1VQUE9SVD15CgojCiMgV2ViY2FtIGRldmljZXMKIwpDT05GSUdfVVNC
X1ZJREVPX0NMQVNTPW0KQ09ORklHX1VTQl9WSURFT19DTEFTU19JTlBVVF9FVkRFVj15CkNPTkZJ
R19VU0JfR1NQQ0E9bQpDT05GSUdfVVNCX001NjAyPW0KQ09ORklHX1VTQl9TVFYwNlhYPW0KQ09O
RklHX1VTQl9HTDg2MD1tCkNPTkZJR19VU0JfR1NQQ0FfQkVOUT1tCkNPTkZJR19VU0JfR1NQQ0Ff
Q09ORVg9bQpDT05GSUdfVVNCX0dTUENBX0NQSUExPW0KIyBDT05GSUdfVVNCX0dTUENBX0RUQ1Mw
MzMgaXMgbm90IHNldApDT05GSUdfVVNCX0dTUENBX0VUT01TPW0KQ09ORklHX1VTQl9HU1BDQV9G
SU5FUElYPW0KQ09ORklHX1VTQl9HU1BDQV9KRUlMSU5KPW0KQ09ORklHX1VTQl9HU1BDQV9KTDIw
MDVCQ0Q9bQojIENPTkZJR19VU0JfR1NQQ0FfS0lORUNUIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9H
U1BDQV9LT05JQ0E9bQpDT05GSUdfVVNCX0dTUENBX01BUlM9bQpDT05GSUdfVVNCX0dTUENBX01S
OTczMTBBPW0KQ09ORklHX1VTQl9HU1BDQV9OVzgwWD1tCkNPTkZJR19VU0JfR1NQQ0FfT1Y1MTk9
bQpDT05GSUdfVVNCX0dTUENBX09WNTM0PW0KQ09ORklHX1VTQl9HU1BDQV9PVjUzNF85PW0KQ09O
RklHX1VTQl9HU1BDQV9QQUMyMDc9bQpDT05GSUdfVVNCX0dTUENBX1BBQzczMDI9bQpDT05GSUdf
VVNCX0dTUENBX1BBQzczMTE9bQpDT05GSUdfVVNCX0dTUENBX1NFNDAxPW0KQ09ORklHX1VTQl9H
U1BDQV9TTjlDMjAyOD1tCkNPTkZJR19VU0JfR1NQQ0FfU045QzIwWD1tCkNPTkZJR19VU0JfR1NQ
Q0FfU09OSVhCPW0KQ09ORklHX1VTQl9HU1BDQV9TT05JWEo9bQpDT05GSUdfVVNCX0dTUENBX1NQ
Q0E1MDA9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0E1MDE9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0E1
MDU9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0E1MDY9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0E1MDg9
bQpDT05GSUdfVVNCX0dTUENBX1NQQ0E1NjE9bQpDT05GSUdfVVNCX0dTUENBX1NQQ0ExNTI4PW0K
Q09ORklHX1VTQl9HU1BDQV9TUTkwNT1tCkNPTkZJR19VU0JfR1NQQ0FfU1E5MDVDPW0KQ09ORklH
X1VTQl9HU1BDQV9TUTkzMFg9bQpDT05GSUdfVVNCX0dTUENBX1NUSzAxND1tCiMgQ09ORklHX1VT
Ql9HU1BDQV9TVEsxMTM1IGlzIG5vdCBzZXQKQ09ORklHX1VTQl9HU1BDQV9TVFYwNjgwPW0KQ09O
RklHX1VTQl9HU1BDQV9TVU5QTFVTPW0KQ09ORklHX1VTQl9HU1BDQV9UNjEzPW0KQ09ORklHX1VT
Ql9HU1BDQV9UT1BSTz1tCiMgQ09ORklHX1VTQl9HU1BDQV9UT1VQVEVLIGlzIG5vdCBzZXQKQ09O
RklHX1VTQl9HU1BDQV9UVjg1MzI9bQpDT05GSUdfVVNCX0dTUENBX1ZDMDMyWD1tCkNPTkZJR19V
U0JfR1NQQ0FfVklDQU09bQpDT05GSUdfVVNCX0dTUENBX1hJUkxJTktfQ0lUPW0KQ09ORklHX1VT
Ql9HU1BDQV9aQzNYWD1tCkNPTkZJR19VU0JfUFdDPW0KIyBDT05GSUdfVVNCX1BXQ19ERUJVRyBp
cyBub3Qgc2V0CkNPTkZJR19VU0JfUFdDX0lOUFVUX0VWREVWPXkKIyBDT05GSUdfVklERU9fQ1BJ
QTIgaXMgbm90IHNldApDT05GSUdfVVNCX1pSMzY0WFg9bQpDT05GSUdfVVNCX1NUS1dFQkNBTT1t
CkNPTkZJR19VU0JfUzIyNTU9bQojIENPTkZJR19WSURFT19VU0JUViBpcyBub3Qgc2V0CgojCiMg
QW5hbG9nIFRWIFVTQiBkZXZpY2VzCiMKQ09ORklHX1ZJREVPX1BWUlVTQjI9bQpDT05GSUdfVklE
RU9fUFZSVVNCMl9TWVNGUz15CkNPTkZJR19WSURFT19QVlJVU0IyX0RWQj15CiMgQ09ORklHX1ZJ
REVPX1BWUlVTQjJfREVCVUdJRkMgaXMgbm90IHNldApDT05GSUdfVklERU9fSERQVlI9bQojIENP
TkZJR19WSURFT19TVEsxMTYwX0NPTU1PTiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0dPNzAw
NyBpcyBub3Qgc2V0CgojCiMgQW5hbG9nL2RpZ2l0YWwgVFYgVVNCIGRldmljZXMKIwpDT05GSUdf
VklERU9fQVUwODI4PW0KQ09ORklHX1ZJREVPX0FVMDgyOF9WNEwyPXkKIyBDT05GSUdfVklERU9f
QVUwODI4X1JDIGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX0NYMjMxWFg9bQpDT05GSUdfVklERU9f
Q1gyMzFYWF9SQz15CkNPTkZJR19WSURFT19DWDIzMVhYX0FMU0E9bQpDT05GSUdfVklERU9fQ1gy
MzFYWF9EVkI9bQpDT05GSUdfVklERU9fVE02MDAwPW0KQ09ORklHX1ZJREVPX1RNNjAwMF9BTFNB
PW0KQ09ORklHX1ZJREVPX1RNNjAwMF9EVkI9bQoKIwojIERpZ2l0YWwgVFYgVVNCIGRldmljZXMK
IwpDT05GSUdfRFZCX1VTQj1tCiMgQ09ORklHX0RWQl9VU0JfREVCVUcgaXMgbm90IHNldApDT05G
SUdfRFZCX1VTQl9ESUIzMDAwTUM9bQpDT05GSUdfRFZCX1VTQl9BODAwPW0KQ09ORklHX0RWQl9V
U0JfRElCVVNCX01CPW0KIyBDT05GSUdfRFZCX1VTQl9ESUJVU0JfTUJfRkFVTFRZIGlzIG5vdCBz
ZXQKQ09ORklHX0RWQl9VU0JfRElCVVNCX01DPW0KQ09ORklHX0RWQl9VU0JfRElCMDcwMD1tCkNP
TkZJR19EVkJfVVNCX1VNVF8wMTA9bQpDT05GSUdfRFZCX1VTQl9DWFVTQj1tCiMgQ09ORklHX0RW
Ql9VU0JfQ1hVU0JfQU5BTE9HIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9VU0JfTTkyMFg9bQpDT05G
SUdfRFZCX1VTQl9ESUdJVFY9bQpDT05GSUdfRFZCX1VTQl9WUDcwNDU9bQpDT05GSUdfRFZCX1VT
Ql9WUDcwMlg9bQpDT05GSUdfRFZCX1VTQl9HUDhQU0s9bQpDT05GSUdfRFZCX1VTQl9OT1ZBX1Rf
VVNCMj1tCkNPTkZJR19EVkJfVVNCX1RUVVNCMj1tCkNPTkZJR19EVkJfVVNCX0RUVDIwMFU9bQpD
T05GSUdfRFZCX1VTQl9PUEVSQTE9bQpDT05GSUdfRFZCX1VTQl9BRjkwMDU9bQpDT05GSUdfRFZC
X1VTQl9BRjkwMDVfUkVNT1RFPW0KQ09ORklHX0RWQl9VU0JfUENUVjQ1MkU9bQpDT05GSUdfRFZC
X1VTQl9EVzIxMDI9bQpDT05GSUdfRFZCX1VTQl9DSU5FUkdZX1QyPW0KQ09ORklHX0RWQl9VU0Jf
RFRWNTEwMD1tCkNPTkZJR19EVkJfVVNCX0FaNjAyNz1tCkNPTkZJR19EVkJfVVNCX1RFQ0hOSVNB
VF9VU0IyPW0KQ09ORklHX0RWQl9VU0JfVjI9bQpDT05GSUdfRFZCX1VTQl9BRjkwMTU9bQpDT05G
SUdfRFZCX1VTQl9BRjkwMzU9bQpDT05GSUdfRFZCX1VTQl9BTllTRUU9bQpDT05GSUdfRFZCX1VT
Ql9BVTY2MTA9bQpDT05GSUdfRFZCX1VTQl9BWjYwMDc9bQpDT05GSUdfRFZCX1VTQl9DRTYyMzA9
bQpDT05GSUdfRFZCX1VTQl9FQzE2OD1tCkNPTkZJR19EVkJfVVNCX0dMODYxPW0KQ09ORklHX0RW
Ql9VU0JfTE1FMjUxMD1tCkNPTkZJR19EVkJfVVNCX01YTDExMVNGPW0KQ09ORklHX0RWQl9VU0Jf
UlRMMjhYWFU9bQojIENPTkZJR19EVkJfVVNCX0RWQlNLWSBpcyBub3Qgc2V0CiMgQ09ORklHX0RW
Ql9VU0JfWkQxMzAxIGlzIG5vdCBzZXQKQ09ORklHX0RWQl9UVFVTQl9CVURHRVQ9bQpDT05GSUdf
RFZCX1RUVVNCX0RFQz1tCkNPTkZJR19TTVNfVVNCX0RSVj1tCkNPTkZJR19EVkJfQjJDMl9GTEVY
Q09QX1VTQj1tCiMgQ09ORklHX0RWQl9CMkMyX0ZMRVhDT1BfVVNCX0RFQlVHIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFZCX0FTMTAyIGlzIG5vdCBzZXQKCiMKIyBXZWJjYW0sIFRWIChhbmFsb2cvZGln
aXRhbCkgVVNCIGRldmljZXMKIwpDT05GSUdfVklERU9fRU0yOFhYPW0KIyBDT05GSUdfVklERU9f
RU0yOFhYX1Y0TDIgaXMgbm90IHNldApDT05GSUdfVklERU9fRU0yOFhYX0FMU0E9bQpDT05GSUdf
VklERU9fRU0yOFhYX0RWQj1tCkNPTkZJR19WSURFT19FTTI4WFhfUkM9bQpDT05GSUdfTUVESUFf
UENJX1NVUFBPUlQ9eQoKIwojIE1lZGlhIGNhcHR1cmUgc3VwcG9ydAojCiMgQ09ORklHX1ZJREVP
X01FWUUgaXMgbm90IHNldAojIENPTkZJR19WSURFT19TT0xPNlgxMCBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX1RXNTg2NCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1RXNjggaXMgbm90IHNl
dAojIENPTkZJR19WSURFT19UVzY4NlggaXMgbm90IHNldAoKIwojIE1lZGlhIGNhcHR1cmUvYW5h
bG9nIFRWIHN1cHBvcnQKIwpDT05GSUdfVklERU9fSVZUVj1tCiMgQ09ORklHX1ZJREVPX0lWVFZf
REVQUkVDQVRFRF9JT0NUTFMgaXMgbm90IHNldAojIENPTkZJR19WSURFT19JVlRWX0FMU0EgaXMg
bm90IHNldApDT05GSUdfVklERU9fRkJfSVZUVj1tCiMgQ09ORklHX1ZJREVPX0ZCX0lWVFZfRk9S
Q0VfUEFUIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSEVYSVVNX0dFTUlOSSBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX0hFWElVTV9PUklPTiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01Y
QiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0RUMzE1NSBpcyBub3Qgc2V0CgojCiMgTWVkaWEg
Y2FwdHVyZS9hbmFsb2cvaHlicmlkIFRWIHN1cHBvcnQKIwpDT05GSUdfVklERU9fQ1gxOD1tCkNP
TkZJR19WSURFT19DWDE4X0FMU0E9bQpDT05GSUdfVklERU9fQ1gyMzg4NT1tCkNPTkZJR19NRURJ
QV9BTFRFUkFfQ0k9bQojIENPTkZJR19WSURFT19DWDI1ODIxIGlzIG5vdCBzZXQKQ09ORklHX1ZJ
REVPX0NYODg9bQpDT05GSUdfVklERU9fQ1g4OF9BTFNBPW0KQ09ORklHX1ZJREVPX0NYODhfQkxB
Q0tCSVJEPW0KQ09ORklHX1ZJREVPX0NYODhfRFZCPW0KIyBDT05GSUdfVklERU9fQ1g4OF9FTkFC
TEVfVlAzMDU0IGlzIG5vdCBzZXQKQ09ORklHX1ZJREVPX0NYODhfTVBFRz1tCkNPTkZJR19WSURF
T19CVDg0OD1tCkNPTkZJR19EVkJfQlQ4WFg9bQpDT05GSUdfVklERU9fU0FBNzEzND1tCkNPTkZJ
R19WSURFT19TQUE3MTM0X0FMU0E9bQpDT05GSUdfVklERU9fU0FBNzEzNF9SQz15CkNPTkZJR19W
SURFT19TQUE3MTM0X0RWQj1tCkNPTkZJR19WSURFT19TQUE3MTY0PW0KCiMKIyBNZWRpYSBkaWdp
dGFsIFRWIFBDSSBBZGFwdGVycwojCkNPTkZJR19EVkJfQVY3MTEwX0lSPXkKQ09ORklHX0RWQl9B
VjcxMTA9bQpDT05GSUdfRFZCX0FWNzExMF9PU0Q9eQpDT05GSUdfRFZCX0JVREdFVF9DT1JFPW0K
Q09ORklHX0RWQl9CVURHRVQ9bQpDT05GSUdfRFZCX0JVREdFVF9DST1tCkNPTkZJR19EVkJfQlVE
R0VUX0FWPW0KQ09ORklHX0RWQl9CVURHRVRfUEFUQ0g9bQpDT05GSUdfRFZCX0IyQzJfRkxFWENP
UF9QQ0k9bQojIENPTkZJR19EVkJfQjJDMl9GTEVYQ09QX1BDSV9ERUJVRyBpcyBub3Qgc2V0CkNP
TkZJR19EVkJfUExVVE8yPW0KQ09ORklHX0RWQl9ETTExMDU9bQpDT05GSUdfRFZCX1BUMT1tCiMg
Q09ORklHX0RWQl9QVDMgaXMgbm90IHNldApDT05GSUdfTUFOVElTX0NPUkU9bQpDT05GSUdfRFZC
X01BTlRJUz1tCkNPTkZJR19EVkJfSE9QUEVSPW0KQ09ORklHX0RWQl9OR0VORT1tCkNPTkZJR19E
VkJfRERCUklER0U9bQojIENPTkZJR19EVkJfRERCUklER0VfTVNJRU5BQkxFIGlzIG5vdCBzZXQK
IyBDT05GSUdfRFZCX1NNSVBDSUUgaXMgbm90IHNldAojIENPTkZJR19EVkJfTkVUVVBfVU5JRFZC
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSVBVM19DSU8yIGlzIG5vdCBzZXQKQ09ORklHX1JB
RElPX0FEQVBURVJTPXkKQ09ORklHX1JBRElPX1RFQTU3NVg9bQojIENPTkZJR19SQURJT19TSTQ3
MFggaXMgbm90IHNldAojIENPTkZJR19SQURJT19TSTQ3MTMgaXMgbm90IHNldAojIENPTkZJR19V
U0JfTVI4MDAgaXMgbm90IHNldAojIENPTkZJR19VU0JfRFNCUiBpcyBub3Qgc2V0CiMgQ09ORklH
X1JBRElPX01BWElSQURJTyBpcyBub3Qgc2V0CiMgQ09ORklHX1JBRElPX1NIQVJLIGlzIG5vdCBz
ZXQKIyBDT05GSUdfUkFESU9fU0hBUksyIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0tFRU5FIGlz
IG5vdCBzZXQKIyBDT05GSUdfVVNCX1JBUkVNT05PIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX01B
OTAxIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFESU9fVEVBNTc2NCBpcyBub3Qgc2V0CiMgQ09ORklH
X1JBRElPX1NBQTc3MDZIIGlzIG5vdCBzZXQKIyBDT05GSUdfUkFESU9fVEVGNjg2MiBpcyBub3Qg
c2V0CiMgQ09ORklHX1JBRElPX1dMMTI3MyBpcyBub3Qgc2V0CkNPTkZJR19NRURJQV9DT01NT05f
T1BUSU9OUz15CgojCiMgY29tbW9uIGRyaXZlciBvcHRpb25zCiMKQ09ORklHX1ZJREVPX0NYMjM0
MVg9bQpDT05GSUdfVklERU9fVFZFRVBST009bQpDT05GSUdfQ1lQUkVTU19GSVJNV0FSRT1tCkNP
TkZJR19WSURFT0JVRjJfQ09SRT1tCkNPTkZJR19WSURFT0JVRjJfVjRMMj1tCkNPTkZJR19WSURF
T0JVRjJfTUVNT1BTPW0KQ09ORklHX1ZJREVPQlVGMl9WTUFMTE9DPW0KQ09ORklHX1ZJREVPQlVG
Ml9ETUFfU0c9bQpDT05GSUdfVklERU9CVUYyX0RWQj1tCkNPTkZJR19EVkJfQjJDMl9GTEVYQ09Q
PW0KQ09ORklHX1ZJREVPX1NBQTcxNDY9bQpDT05GSUdfVklERU9fU0FBNzE0Nl9WVj1tCkNPTkZJ
R19TTVNfU0lBTk9fTURUVj1tCkNPTkZJR19TTVNfU0lBTk9fUkM9eQoKIwojIEZpcmVXaXJlIChJ
RUVFIDEzOTQpIEFkYXB0ZXJzCiMKQ09ORklHX0RWQl9GSVJFRFRWPW0KQ09ORklHX0RWQl9GSVJF
RFRWX0lOUFVUPXkKIyBlbmQgb2YgTWVkaWEgZHJpdmVycwoKQ09ORklHX01FRElBX0hJREVfQU5D
SUxMQVJZX1NVQkRSVj15CgojCiMgTWVkaWEgYW5jaWxsYXJ5IGRyaXZlcnMKIwpDT05GSUdfTUVE
SUFfQVRUQUNIPXkKCiMKIyBJUiBJMkMgZHJpdmVyIGF1dG8tc2VsZWN0ZWQgYnkgJ0F1dG9zZWxl
Y3QgYW5jaWxsYXJ5IGRyaXZlcnMnCiMKQ09ORklHX1ZJREVPX0lSX0kyQz1tCgojCiMgYXVkaW8s
IHZpZGVvIGFuZCByYWRpbyBJMkMgZHJpdmVycyBhdXRvLXNlbGVjdGVkIGJ5ICdBdXRvc2VsZWN0
IGFuY2lsbGFyeSBkcml2ZXJzJwojCkNPTkZJR19WSURFT19UVkFVRElPPW0KQ09ORklHX1ZJREVP
X1REQTc0MzI9bQpDT05GSUdfVklERU9fTVNQMzQwMD1tCkNPTkZJR19WSURFT19DUzMzMDg9bQpD
T05GSUdfVklERU9fQ1M1MzQ1PW0KQ09ORklHX1ZJREVPX0NTNTNMMzJBPW0KQ09ORklHX1ZJREVP
X1dNODc3NT1tCkNPTkZJR19WSURFT19XTTg3Mzk9bQpDT05GSUdfVklERU9fVlAyN1NNUFg9bQpD
T05GSUdfVklERU9fU0FBNjU4OD1tCkNPTkZJR19WSURFT19TQUE3MTFYPW0KCiMKIyBWaWRlbyBh
bmQgYXVkaW8gZGVjb2RlcnMKIwpDT05GSUdfVklERU9fU0FBNzE3WD1tCkNPTkZJR19WSURFT19D
WDI1ODQwPW0KQ09ORklHX1ZJREVPX1NBQTcxMjc9bQpDT05GSUdfVklERU9fVVBENjQwMzFBPW0K
Q09ORklHX1ZJREVPX1VQRDY0MDgzPW0KQ09ORklHX1ZJREVPX1NBQTY3NTJIUz1tCkNPTkZJR19W
SURFT19NNTI3OTA9bQoKIwojIENhbWVyYSBzZW5zb3IgZGV2aWNlcwojCiMgQ09ORklHX1ZJREVP
X0hJNTU2IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMjE0IGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fSU1YMjE5IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMjU4IGlzIG5vdCBz
ZXQKIyBDT05GSUdfVklERU9fSU1YMjc0IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMjkw
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fSU1YMzE5IGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fSU1YMzU1IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fT1YwMkExMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX09WMjY0MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WMjY1OSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WMjY4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09W
MjY4NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WMjc0MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX09WNTY0NyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNTY0OCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX09WNjY1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNTY3MCBp
cyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNTY3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVP
X09WNTY5NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNzI1MSBpcyBub3Qgc2V0CiMgQ09O
RklHX1ZJREVPX09WNzcyWCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNzY0MCBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX09WNzY3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WNzc0
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WODg1NiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJ
REVPX09WODg2NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WOTY0MCBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX09WOTY1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WOTczNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1ZJREVPX09WMTM4NTggaXMgbm90IHNldAojIENPTkZJR19WSURFT19W
UzY2MjQgaXMgbm90IHNldAojIENPTkZJR19WSURFT19NVDlNMDAxIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fTVQ5TTAzMiBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01UOU0xMTEgaXMgbm90
IHNldAojIENPTkZJR19WSURFT19NVDlQMDMxIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVQ5
VDAwMSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX01UOVQxMTIgaXMgbm90IHNldAojIENPTkZJ
R19WSURFT19NVDlWMDExIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fTVQ5VjAzMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZJREVPX01UOVYxMTEgaXMgbm90IHNldAojIENPTkZJR19WSURFT19TUjAz
MFBDMzAgaXMgbm90IHNldAojIENPTkZJR19WSURFT19OT09OMDEwUEMzMCBpcyBub3Qgc2V0CiMg
Q09ORklHX1ZJREVPX001TU9MUyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX1JEQUNNMjAgaXMg
bm90IHNldAojIENPTkZJR19WSURFT19SREFDTTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9f
Uko1NE4xIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fUzVLNkFBIGlzIG5vdCBzZXQKIyBDT05G
SUdfVklERU9fUzVLNkEzIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fUzVLNEVDR1ggaXMgbm90
IHNldAojIENPTkZJR19WSURFT19TNUs1QkFGIGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fQ0NT
IGlzIG5vdCBzZXQKIyBDT05GSUdfVklERU9fRVQ4RUs4IGlzIG5vdCBzZXQKIyBDT05GSUdfVklE
RU9fUzVDNzNNMyBpcyBub3Qgc2V0CiMgZW5kIG9mIENhbWVyYSBzZW5zb3IgZGV2aWNlcwoKIwoj
IExlbnMgZHJpdmVycwojCiMgQ09ORklHX1ZJREVPX0FENTgyMCBpcyBub3Qgc2V0CiMgQ09ORklH
X1ZJREVPX0FLNzM3NSBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0RXOTcxNCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZJREVPX0RXOTc2OCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0RXOTgwN19W
Q00gaXMgbm90IHNldAojIGVuZCBvZiBMZW5zIGRyaXZlcnMKCiMKIyBGbGFzaCBkZXZpY2VzCiMK
IyBDT05GSUdfVklERU9fQURQMTY1MyBpcyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0xNMzU2MCBp
cyBub3Qgc2V0CiMgQ09ORklHX1ZJREVPX0xNMzY0NiBpcyBub3Qgc2V0CiMgZW5kIG9mIEZsYXNo
IGRldmljZXMKCiMKIyBTUEkgSTJDIGRyaXZlcnMgYXV0by1zZWxlY3RlZCBieSAnQXV0b3NlbGVj
dCBhbmNpbGxhcnkgZHJpdmVycycKIwoKIwojIE1lZGlhIFNQSSBBZGFwdGVycwojCiMgQ09ORklH
X0NYRDI4ODBfU1BJX0RSViBpcyBub3Qgc2V0CiMgZW5kIG9mIE1lZGlhIFNQSSBBZGFwdGVycwoK
Q09ORklHX01FRElBX1RVTkVSPW0KCiMKIyBUdW5lciBkcml2ZXJzIGF1dG8tc2VsZWN0ZWQgYnkg
J0F1dG9zZWxlY3QgYW5jaWxsYXJ5IGRyaXZlcnMnCiMKQ09ORklHX01FRElBX1RVTkVSX1NJTVBM
RT1tCkNPTkZJR19NRURJQV9UVU5FUl9UREExODI1MD1tCkNPTkZJR19NRURJQV9UVU5FUl9UREE4
MjkwPW0KQ09ORklHX01FRElBX1RVTkVSX1REQTgyN1g9bQpDT05GSUdfTUVESUFfVFVORVJfVERB
MTgyNzE9bQpDT05GSUdfTUVESUFfVFVORVJfVERBOTg4Nz1tCkNPTkZJR19NRURJQV9UVU5FUl9U
RUE1NzYxPW0KQ09ORklHX01FRElBX1RVTkVSX1RFQTU3Njc9bQpDT05GSUdfTUVESUFfVFVORVJf
TVQyMFhYPW0KQ09ORklHX01FRElBX1RVTkVSX01UMjA2MD1tCkNPTkZJR19NRURJQV9UVU5FUl9N
VDIwNjM9bQpDT05GSUdfTUVESUFfVFVORVJfTVQyMjY2PW0KQ09ORklHX01FRElBX1RVTkVSX01U
MjEzMT1tCkNPTkZJR19NRURJQV9UVU5FUl9RVDEwMTA9bQpDT05GSUdfTUVESUFfVFVORVJfWEMy
MDI4PW0KQ09ORklHX01FRElBX1RVTkVSX1hDNTAwMD1tCkNPTkZJR19NRURJQV9UVU5FUl9YQzQw
MDA9bQpDT05GSUdfTUVESUFfVFVORVJfTVhMNTAwNVM9bQpDT05GSUdfTUVESUFfVFVORVJfTVhM
NTAwN1Q9bQpDT05GSUdfTUVESUFfVFVORVJfTUM0NFM4MDM9bQpDT05GSUdfTUVESUFfVFVORVJf
TUFYMjE2NT1tCkNPTkZJR19NRURJQV9UVU5FUl9UREExODIxOD1tCkNPTkZJR19NRURJQV9UVU5F
Ul9GQzAwMTE9bQpDT05GSUdfTUVESUFfVFVORVJfRkMwMDEyPW0KQ09ORklHX01FRElBX1RVTkVS
X0ZDMDAxMz1tCkNPTkZJR19NRURJQV9UVU5FUl9UREExODIxMj1tCkNPTkZJR19NRURJQV9UVU5F
Ul9FNDAwMD1tCkNPTkZJR19NRURJQV9UVU5FUl9GQzI1ODA9bQpDT05GSUdfTUVESUFfVFVORVJf
TTg4UlM2MDAwVD1tCkNPTkZJR19NRURJQV9UVU5FUl9UVUE5MDAxPW0KQ09ORklHX01FRElBX1RV
TkVSX1NJMjE1Nz1tCkNPTkZJR19NRURJQV9UVU5FUl9JVDkxM1g9bQpDT05GSUdfTUVESUFfVFVO
RVJfUjgyMFQ9bQpDT05GSUdfTUVESUFfVFVORVJfUU0xRDFDMDA0Mj1tCkNPTkZJR19NRURJQV9U
VU5FUl9RTTFEMUIwMDA0PW0KCiMKIyBEVkIgRnJvbnRlbmQgZHJpdmVycyBhdXRvLXNlbGVjdGVk
IGJ5ICdBdXRvc2VsZWN0IGFuY2lsbGFyeSBkcml2ZXJzJwojCgojCiMgTXVsdGlzdGFuZGFyZCAo
c2F0ZWxsaXRlKSBmcm9udGVuZHMKIwpDT05GSUdfRFZCX1NUQjA4OTk9bQpDT05GSUdfRFZCX1NU
QjYxMDA9bQpDT05GSUdfRFZCX1NUVjA5MHg9bQpDT05GSUdfRFZCX1NUVjA5MTA9bQpDT05GSUdf
RFZCX1NUVjYxMTB4PW0KQ09ORklHX0RWQl9TVFY2MTExPW0KQ09ORklHX0RWQl9NWEw1WFg9bQpD
T05GSUdfRFZCX004OERTMzEwMz1tCgojCiMgTXVsdGlzdGFuZGFyZCAoY2FibGUgKyB0ZXJyZXN0
cmlhbCkgZnJvbnRlbmRzCiMKQ09ORklHX0RWQl9EUlhLPW0KQ09ORklHX0RWQl9UREExODI3MUMy
REQ9bQpDT05GSUdfRFZCX1NJMjE2NT1tCkNPTkZJR19EVkJfTU44ODQ3Mj1tCkNPTkZJR19EVkJf
TU44ODQ3Mz1tCgojCiMgRFZCLVMgKHNhdGVsbGl0ZSkgZnJvbnRlbmRzCiMKQ09ORklHX0RWQl9D
WDI0MTEwPW0KQ09ORklHX0RWQl9DWDI0MTIzPW0KQ09ORklHX0RWQl9NVDMxMj1tCkNPTkZJR19E
VkJfWkwxMDAzNj1tCkNPTkZJR19EVkJfWkwxMDAzOT1tCkNPTkZJR19EVkJfUzVIMTQyMD1tCkNP
TkZJR19EVkJfU1RWMDI4OD1tCkNPTkZJR19EVkJfU1RCNjAwMD1tCkNPTkZJR19EVkJfU1RWMDI5
OT1tCkNPTkZJR19EVkJfU1RWNjExMD1tCkNPTkZJR19EVkJfU1RWMDkwMD1tCkNPTkZJR19EVkJf
VERBODA4Mz1tCkNPTkZJR19EVkJfVERBMTAwODY9bQpDT05GSUdfRFZCX1REQTgyNjE9bQpDT05G
SUdfRFZCX1ZFUzFYOTM9bQpDT05GSUdfRFZCX1RVTkVSX0lURDEwMDA9bQpDT05GSUdfRFZCX1RV
TkVSX0NYMjQxMTM9bQpDT05GSUdfRFZCX1REQTgyNlg9bQpDT05GSUdfRFZCX1RVQTYxMDA9bQpD
T05GSUdfRFZCX0NYMjQxMTY9bQpDT05GSUdfRFZCX0NYMjQxMTc9bQpDT05GSUdfRFZCX0NYMjQx
MjA9bQpDT05GSUdfRFZCX1NJMjFYWD1tCkNPTkZJR19EVkJfVFMyMDIwPW0KQ09ORklHX0RWQl9E
UzMwMDA9bQpDT05GSUdfRFZCX01CODZBMTY9bQpDT05GSUdfRFZCX1REQTEwMDcxPW0KCiMKIyBE
VkItVCAodGVycmVzdHJpYWwpIGZyb250ZW5kcwojCkNPTkZJR19EVkJfU1A4ODcwPW0KQ09ORklH
X0RWQl9TUDg4N1g9bQpDT05GSUdfRFZCX0NYMjI3MDA9bQpDT05GSUdfRFZCX0NYMjI3MDI9bQpD
T05GSUdfRFZCX0RSWEQ9bQpDT05GSUdfRFZCX0w2NDc4MT1tCkNPTkZJR19EVkJfVERBMTAwNFg9
bQpDT05GSUdfRFZCX05YVDYwMDA9bQpDT05GSUdfRFZCX01UMzUyPW0KQ09ORklHX0RWQl9aTDEw
MzUzPW0KQ09ORklHX0RWQl9ESUIzMDAwTUI9bQpDT05GSUdfRFZCX0RJQjMwMDBNQz1tCkNPTkZJ
R19EVkJfRElCNzAwME09bQpDT05GSUdfRFZCX0RJQjcwMDBQPW0KQ09ORklHX0RWQl9UREExMDA0
OD1tCkNPTkZJR19EVkJfQUY5MDEzPW0KQ09ORklHX0RWQl9FQzEwMD1tCkNPTkZJR19EVkJfU1RW
MDM2Nz1tCkNPTkZJR19EVkJfQ1hEMjgyMFI9bQpDT05GSUdfRFZCX0NYRDI4NDFFUj1tCkNPTkZJ
R19EVkJfUlRMMjgzMD1tCkNPTkZJR19EVkJfUlRMMjgzMj1tCkNPTkZJR19EVkJfU0kyMTY4PW0K
Q09ORklHX0RWQl9HUDhQU0tfRkU9bQoKIwojIERWQi1DIChjYWJsZSkgZnJvbnRlbmRzCiMKQ09O
RklHX0RWQl9WRVMxODIwPW0KQ09ORklHX0RWQl9UREExMDAyMT1tCkNPTkZJR19EVkJfVERBMTAw
MjM9bQpDT05GSUdfRFZCX1NUVjAyOTc9bQoKIwojIEFUU0MgKE5vcnRoIEFtZXJpY2FuL0tvcmVh
biBUZXJyZXN0cmlhbC9DYWJsZSBEVFYpIGZyb250ZW5kcwojCkNPTkZJR19EVkJfTlhUMjAwWD1t
CkNPTkZJR19EVkJfT1I1MTIxMT1tCkNPTkZJR19EVkJfT1I1MTEzMj1tCkNPTkZJR19EVkJfQkNN
MzUxMD1tCkNPTkZJR19EVkJfTEdEVDMzMFg9bQpDT05GSUdfRFZCX0xHRFQzMzA1PW0KQ09ORklH
X0RWQl9MR0RUMzMwNkE9bQpDT05GSUdfRFZCX0xHMjE2MD1tCkNPTkZJR19EVkJfUzVIMTQwOT1t
CkNPTkZJR19EVkJfQVU4NTIyPW0KQ09ORklHX0RWQl9BVTg1MjJfRFRWPW0KQ09ORklHX0RWQl9B
VTg1MjJfVjRMPW0KQ09ORklHX0RWQl9TNUgxNDExPW0KQ09ORklHX0RWQl9NWEw2OTI9bQoKIwoj
IElTREItVCAodGVycmVzdHJpYWwpIGZyb250ZW5kcwojCkNPTkZJR19EVkJfUzkyMT1tCkNPTkZJ
R19EVkJfRElCODAwMD1tCkNPTkZJR19EVkJfTUI4NkEyMFM9bQoKIwojIElTREItUyAoc2F0ZWxs
aXRlKSAmIElTREItVCAodGVycmVzdHJpYWwpIGZyb250ZW5kcwojCkNPTkZJR19EVkJfVEM5MDUy
Mj1tCgojCiMgRGlnaXRhbCB0ZXJyZXN0cmlhbCBvbmx5IHR1bmVycy9QTEwKIwpDT05GSUdfRFZC
X1BMTD1tCkNPTkZJR19EVkJfVFVORVJfRElCMDA3MD1tCkNPTkZJR19EVkJfVFVORVJfRElCMDA5
MD1tCgojCiMgU0VDIGNvbnRyb2wgZGV2aWNlcyBmb3IgRFZCLVMKIwpDT05GSUdfRFZCX0RSWDM5
WFlKPW0KQ09ORklHX0RWQl9MTkJIMjU9bQpDT05GSUdfRFZCX0xOQlAyMT1tCkNPTkZJR19EVkJf
TE5CUDIyPW0KQ09ORklHX0RWQl9JU0w2NDA1PW0KQ09ORklHX0RWQl9JU0w2NDIxPW0KQ09ORklH
X0RWQl9JU0w2NDIzPW0KQ09ORklHX0RWQl9BODI5Mz1tCkNPTkZJR19EVkJfTEdTOEdYWD1tCkNP
TkZJR19EVkJfQVRCTTg4MzA9bQpDT05GSUdfRFZCX1REQTY2NXg9bQpDT05GSUdfRFZCX0lYMjUw
NVY9bQpDT05GSUdfRFZCX004OFJTMjAwMD1tCkNPTkZJR19EVkJfQUY5MDMzPW0KCiMKIyBDb21t
b24gSW50ZXJmYWNlIChFTjUwMjIxKSBjb250cm9sbGVyIGRyaXZlcnMKIwpDT05GSUdfRFZCX0NY
RDIwOTk9bQojIGVuZCBvZiBNZWRpYSBhbmNpbGxhcnkgZHJpdmVycwoKIwojIEdyYXBoaWNzIHN1
cHBvcnQKIwojIENPTkZJR19BR1AgaXMgbm90IHNldApDT05GSUdfSU5URUxfR1RUPW0KQ09ORklH
X1ZHQV9BUkI9eQpDT05GSUdfVkdBX0FSQl9NQVhfR1BVUz02NApDT05GSUdfVkdBX1NXSVRDSEVS
T089eQpDT05GSUdfRFJNPW0KQ09ORklHX0RSTV9NSVBJX0RTST15CkNPTkZJR19EUk1fRFBfQVVY
X0NIQVJERVY9eQojIENPTkZJR19EUk1fREVCVUdfU0VMRlRFU1QgaXMgbm90IHNldApDT05GSUdf
RFJNX0tNU19IRUxQRVI9bQpDT05GSUdfRFJNX0tNU19GQl9IRUxQRVI9eQpDT05GSUdfRFJNX0ZC
REVWX0VNVUxBVElPTj15CkNPTkZJR19EUk1fRkJERVZfT1ZFUkFMTE9DPTEwMApDT05GSUdfRFJN
X0xPQURfRURJRF9GSVJNV0FSRT15CiMgQ09ORklHX0RSTV9EUF9DRUMgaXMgbm90IHNldApDT05G
SUdfRFJNX1RUTT1tCkNPTkZJR19EUk1fVlJBTV9IRUxQRVI9bQpDT05GSUdfRFJNX1RUTV9IRUxQ
RVI9bQpDT05GSUdfRFJNX0dFTV9TSE1FTV9IRUxQRVI9eQpDT05GSUdfRFJNX1NDSEVEPW0KCiMK
IyBJMkMgZW5jb2RlciBvciBoZWxwZXIgY2hpcHMKIwpDT05GSUdfRFJNX0kyQ19DSDcwMDY9bQpD
T05GSUdfRFJNX0kyQ19TSUwxNjQ9bQojIENPTkZJR19EUk1fSTJDX05YUF9UREE5OThYIGlzIG5v
dCBzZXQKIyBDT05GSUdfRFJNX0kyQ19OWFBfVERBOTk1MCBpcyBub3Qgc2V0CiMgZW5kIG9mIEky
QyBlbmNvZGVyIG9yIGhlbHBlciBjaGlwcwoKIwojIEFSTSBkZXZpY2VzCiMKIyBlbmQgb2YgQVJN
IGRldmljZXMKCkNPTkZJR19EUk1fUkFERU9OPW0KQ09ORklHX0RSTV9SQURFT05fVVNFUlBUUj15
CkNPTkZJR19EUk1fQU1ER1BVPW0KIyBDT05GSUdfRFJNX0FNREdQVV9TSSBpcyBub3Qgc2V0CiMg
Q09ORklHX0RSTV9BTURHUFVfQ0lLIGlzIG5vdCBzZXQKQ09ORklHX0RSTV9BTURHUFVfVVNFUlBU
Uj15CiMgQ09ORklHX0RSTV9BTURHUFVfR0FSVF9ERUJVR0ZTIGlzIG5vdCBzZXQKCiMKIyBBQ1Ag
KEF1ZGlvIENvUHJvY2Vzc29yKSBDb25maWd1cmF0aW9uCiMKQ09ORklHX0RSTV9BTURfQUNQPXkK
IyBlbmQgb2YgQUNQIChBdWRpbyBDb1Byb2Nlc3NvcikgQ29uZmlndXJhdGlvbgoKIwojIERpc3Bs
YXkgRW5naW5lIENvbmZpZ3VyYXRpb24KIwpDT05GSUdfRFJNX0FNRF9EQz15CkNPTkZJR19EUk1f
QU1EX0RDX0RDTj15CiMgQ09ORklHX0RSTV9BTURfRENfSERDUCBpcyBub3Qgc2V0CiMgQ09ORklH
X0RSTV9BTURfRENfU0kgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19LRVJORUxfREMgaXMgbm90
IHNldAojIGVuZCBvZiBEaXNwbGF5IEVuZ2luZSBDb25maWd1cmF0aW9uCgpDT05GSUdfSFNBX0FN
RD15CkNPTkZJR19EUk1fTk9VVkVBVT1tCiMgQ09ORklHX05PVVZFQVVfTEVHQUNZX0NUWF9TVVBQ
T1JUIGlzIG5vdCBzZXQKQ09ORklHX05PVVZFQVVfREVCVUc9NQpDT05GSUdfTk9VVkVBVV9ERUJV
R19ERUZBVUxUPTMKIyBDT05GSUdfTk9VVkVBVV9ERUJVR19NTVUgaXMgbm90IHNldAojIENPTkZJ
R19OT1VWRUFVX0RFQlVHX1BVU0ggaXMgbm90IHNldApDT05GSUdfRFJNX05PVVZFQVVfQkFDS0xJ
R0hUPXkKQ09ORklHX0RSTV9JOTE1PW0KQ09ORklHX0RSTV9JOTE1X0ZPUkNFX1BST0JFPSIiCkNP
TkZJR19EUk1fSTkxNV9DQVBUVVJFX0VSUk9SPXkKQ09ORklHX0RSTV9JOTE1X0NPTVBSRVNTX0VS
Uk9SPXkKQ09ORklHX0RSTV9JOTE1X1VTRVJQVFI9eQpDT05GSUdfRFJNX0k5MTVfR1ZUPXkKQ09O
RklHX0RSTV9JOTE1X0dWVF9LVk1HVD1tCkNPTkZJR19EUk1fSTkxNV9GRU5DRV9USU1FT1VUPTEw
MDAwCkNPTkZJR19EUk1fSTkxNV9VU0VSRkFVTFRfQVVUT1NVU1BFTkQ9MjUwCkNPTkZJR19EUk1f
STkxNV9IRUFSVEJFQVRfSU5URVJWQUw9MjUwMApDT05GSUdfRFJNX0k5MTVfUFJFRU1QVF9USU1F
T1VUPTY0MApDT05GSUdfRFJNX0k5MTVfTUFYX1JFUVVFU1RfQlVTWVdBSVQ9ODAwMApDT05GSUdf
RFJNX0k5MTVfU1RPUF9USU1FT1VUPTEwMApDT05GSUdfRFJNX0k5MTVfVElNRVNMSUNFX0RVUkFU
SU9OPTEKIyBDT05GSUdfRFJNX1ZHRU0gaXMgbm90IHNldApDT05GSUdfRFJNX1ZLTVM9bQpDT05G
SUdfRFJNX1ZNV0dGWD1tCkNPTkZJR19EUk1fVk1XR0ZYX0ZCQ09OPXkKQ09ORklHX0RSTV9HTUE1
MDA9bQpDT05GSUdfRFJNX0dNQTYwMD15CkNPTkZJR19EUk1fVURMPW0KQ09ORklHX0RSTV9BU1Q9
bQpDT05GSUdfRFJNX01HQUcyMDA9bQpDT05GSUdfRFJNX1FYTD1tCkNPTkZJR19EUk1fQk9DSFM9
bQpDT05GSUdfRFJNX1ZJUlRJT19HUFU9bQpDT05GSUdfRFJNX1BBTkVMPXkKCiMKIyBEaXNwbGF5
IFBhbmVscwojCiMgQ09ORklHX0RSTV9QQU5FTF9SQVNQQkVSUllQSV9UT1VDSFNDUkVFTiBpcyBu
b3Qgc2V0CiMgZW5kIG9mIERpc3BsYXkgUGFuZWxzCgpDT05GSUdfRFJNX0JSSURHRT15CkNPTkZJ
R19EUk1fUEFORUxfQlJJREdFPXkKCiMKIyBEaXNwbGF5IEludGVyZmFjZSBCcmlkZ2VzCiMKIyBD
T05GSUdfRFJNX0FOQUxPR0lYX0FOWDc4WFggaXMgbm90IHNldAojIGVuZCBvZiBEaXNwbGF5IElu
dGVyZmFjZSBCcmlkZ2VzCgojIENPTkZJR19EUk1fRVROQVZJViBpcyBub3Qgc2V0CkNPTkZJR19E
Uk1fQ0lSUlVTX1FFTVU9bQojIENPTkZJR19EUk1fR00xMlUzMjAgaXMgbm90IHNldAojIENPTkZJ
R19USU5ZRFJNX0hYODM1N0QgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX0lMSTkyMjUgaXMg
bm90IHNldAojIENPTkZJR19USU5ZRFJNX0lMSTkzNDEgaXMgbm90IHNldAojIENPTkZJR19USU5Z
RFJNX0lMSTk0ODYgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX01JMDI4M1FUIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVElOWURSTV9SRVBBUEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfVElOWURSTV9T
VDc1ODYgaXMgbm90IHNldAojIENPTkZJR19USU5ZRFJNX1NUNzczNVIgaXMgbm90IHNldAojIENP
TkZJR19EUk1fWEVOIGlzIG5vdCBzZXQKIyBDT05GSUdfRFJNX1ZCT1hWSURFTyBpcyBub3Qgc2V0
CiMgQ09ORklHX0RSTV9MRUdBQ1kgaXMgbm90IHNldApDT05GSUdfRFJNX1BBTkVMX09SSUVOVEFU
SU9OX1FVSVJLUz15CgojCiMgRnJhbWUgYnVmZmVyIERldmljZXMKIwpDT05GSUdfRkJfQ01ETElO
RT15CkNPTkZJR19GQl9OT1RJRlk9eQpDT05GSUdfRkI9eQojIENPTkZJR19GSVJNV0FSRV9FRElE
IGlzIG5vdCBzZXQKQ09ORklHX0ZCX0JPT1RfVkVTQV9TVVBQT1JUPXkKQ09ORklHX0ZCX0NGQl9G
SUxMUkVDVD15CkNPTkZJR19GQl9DRkJfQ09QWUFSRUE9eQpDT05GSUdfRkJfQ0ZCX0lNQUdFQkxJ
VD15CkNPTkZJR19GQl9TWVNfRklMTFJFQ1Q9bQpDT05GSUdfRkJfU1lTX0NPUFlBUkVBPW0KQ09O
RklHX0ZCX1NZU19JTUFHRUJMSVQ9bQojIENPTkZJR19GQl9GT1JFSUdOX0VORElBTiBpcyBub3Qg
c2V0CkNPTkZJR19GQl9TWVNfRk9QUz1tCkNPTkZJR19GQl9ERUZFUlJFRF9JTz15CiMgQ09ORklH
X0ZCX01PREVfSEVMUEVSUyBpcyBub3Qgc2V0CkNPTkZJR19GQl9USUxFQkxJVFRJTkc9eQoKIwoj
IEZyYW1lIGJ1ZmZlciBoYXJkd2FyZSBkcml2ZXJzCiMKIyBDT05GSUdfRkJfQ0lSUlVTIGlzIG5v
dCBzZXQKIyBDT05GSUdfRkJfUE0yIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQ1lCRVIyMDAwIGlz
IG5vdCBzZXQKIyBDT05GSUdfRkJfQVJDIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfQVNJTElBTlQg
aXMgbm90IHNldAojIENPTkZJR19GQl9JTVNUVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZHQTE2
IGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVVZFU0EgaXMgbm90IHNldApDT05GSUdfRkJfVkVTQT15
CkNPTkZJR19GQl9FRkk9eQojIENPTkZJR19GQl9ONDExIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJf
SEdBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfT1BFTkNPUkVTIGlzIG5vdCBzZXQKIyBDT05GSUdf
RkJfUzFEMTNYWFggaXMgbm90IHNldAojIENPTkZJR19GQl9OVklESUEgaXMgbm90IHNldAojIENP
TkZJR19GQl9SSVZBIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfSTc0MCBpcyBub3Qgc2V0CiMgQ09O
RklHX0ZCX0xFODA1NzggaXMgbm90IHNldAojIENPTkZJR19GQl9NQVRST1ggaXMgbm90IHNldAoj
IENPTkZJR19GQl9SQURFT04gaXMgbm90IHNldAojIENPTkZJR19GQl9BVFkxMjggaXMgbm90IHNl
dAojIENPTkZJR19GQl9BVFkgaXMgbm90IHNldAojIENPTkZJR19GQl9TMyBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZCX1NBVkFHRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NJUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0ZCX1ZJQSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX05FT01BR0lDIGlzIG5vdCBzZXQK
IyBDT05GSUdfRkJfS1lSTyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCXzNERlggaXMgbm90IHNldAoj
IENPTkZJR19GQl9WT09ET08xIGlzIG5vdCBzZXQKIyBDT05GSUdfRkJfVlQ4NjIzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRkJfVFJJREVOVCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0FSSyBpcyBub3Qg
c2V0CiMgQ09ORklHX0ZCX1BNMyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX0NBUk1JTkUgaXMgbm90
IHNldAojIENPTkZJR19GQl9TTTUwMSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NNU0NVRlggaXMg
bm90IHNldAojIENPTkZJR19GQl9VREwgaXMgbm90IHNldAojIENPTkZJR19GQl9JQk1fR1hUNDUw
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1ZJUlRVQUwgaXMgbm90IHNldAojIENPTkZJR19YRU5f
RkJERVZfRlJPTlRFTkQgaXMgbm90IHNldAojIENPTkZJR19GQl9NRVRST05PTUUgaXMgbm90IHNl
dAojIENPTkZJR19GQl9NQjg2MlhYIGlzIG5vdCBzZXQKQ09ORklHX0ZCX0hZUEVSVj1tCiMgQ09O
RklHX0ZCX1NJTVBMRSBpcyBub3Qgc2V0CiMgQ09ORklHX0ZCX1NNNzEyIGlzIG5vdCBzZXQKIyBl
bmQgb2YgRnJhbWUgYnVmZmVyIERldmljZXMKCiMKIyBCYWNrbGlnaHQgJiBMQ0QgZGV2aWNlIHN1
cHBvcnQKIwpDT05GSUdfTENEX0NMQVNTX0RFVklDRT1tCiMgQ09ORklHX0xDRF9MNEYwMDI0MlQw
MyBpcyBub3Qgc2V0CiMgQ09ORklHX0xDRF9MTVMyODNHRjA1IGlzIG5vdCBzZXQKIyBDT05GSUdf
TENEX0xUVjM1MFFWIGlzIG5vdCBzZXQKIyBDT05GSUdfTENEX0lMSTkyMlggaXMgbm90IHNldAoj
IENPTkZJR19MQ0RfSUxJOTMyMCBpcyBub3Qgc2V0CiMgQ09ORklHX0xDRF9URE8yNE0gaXMgbm90
IHNldAojIENPTkZJR19MQ0RfVkdHMjQzMkE0IGlzIG5vdCBzZXQKQ09ORklHX0xDRF9QTEFURk9S
TT1tCiMgQ09ORklHX0xDRF9BTVMzNjlGRzA2IGlzIG5vdCBzZXQKIyBDT05GSUdfTENEX0xNUzUw
MUtGMDMgaXMgbm90IHNldAojIENPTkZJR19MQ0RfSFg4MzU3IGlzIG5vdCBzZXQKIyBDT05GSUdf
TENEX09UTTMyMjVBIGlzIG5vdCBzZXQKQ09ORklHX0JBQ0tMSUdIVF9DTEFTU19ERVZJQ0U9eQoj
IENPTkZJR19CQUNLTElHSFRfS1REMjUzIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX1BX
TSBpcyBub3Qgc2V0CkNPTkZJR19CQUNLTElHSFRfQVBQTEU9bQojIENPTkZJR19CQUNLTElHSFRf
UUNPTV9XTEVEIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX1NBSEFSQSBpcyBub3Qgc2V0
CiMgQ09ORklHX0JBQ0tMSUdIVF9BRFA4ODYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hU
X0FEUDg4NzAgaXMgbm90IHNldAojIENPTkZJR19CQUNLTElHSFRfTE0zNjMwQSBpcyBub3Qgc2V0
CiMgQ09ORklHX0JBQ0tMSUdIVF9MTTM2MzkgaXMgbm90IHNldApDT05GSUdfQkFDS0xJR0hUX0xQ
ODU1WD1tCiMgQ09ORklHX0JBQ0tMSUdIVF9HUElPIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJ
R0hUX0xWNTIwN0xQIGlzIG5vdCBzZXQKIyBDT05GSUdfQkFDS0xJR0hUX0JENjEwNyBpcyBub3Qg
c2V0CiMgQ09ORklHX0JBQ0tMSUdIVF9BUkNYQ05OIGlzIG5vdCBzZXQKIyBlbmQgb2YgQmFja2xp
Z2h0ICYgTENEIGRldmljZSBzdXBwb3J0CgpDT05GSUdfSERNST15CgojCiMgQ29uc29sZSBkaXNw
bGF5IGRyaXZlciBzdXBwb3J0CiMKQ09ORklHX1ZHQV9DT05TT0xFPXkKQ09ORklHX0RVTU1ZX0NP
TlNPTEU9eQpDT05GSUdfRFVNTVlfQ09OU09MRV9DT0xVTU5TPTgwCkNPTkZJR19EVU1NWV9DT05T
T0xFX1JPV1M9MjUKQ09ORklHX0ZSQU1FQlVGRkVSX0NPTlNPTEU9eQpDT05GSUdfRlJBTUVCVUZG
RVJfQ09OU09MRV9ERVRFQ1RfUFJJTUFSWT15CkNPTkZJR19GUkFNRUJVRkZFUl9DT05TT0xFX1JP
VEFUSU9OPXkKIyBDT05GSUdfRlJBTUVCVUZGRVJfQ09OU09MRV9ERUZFUlJFRF9UQUtFT1ZFUiBp
cyBub3Qgc2V0CiMgZW5kIG9mIENvbnNvbGUgZGlzcGxheSBkcml2ZXIgc3VwcG9ydAoKQ09ORklH
X0xPR089eQojIENPTkZJR19MT0dPX0xJTlVYX01PTk8gaXMgbm90IHNldAojIENPTkZJR19MT0dP
X0xJTlVYX1ZHQTE2IGlzIG5vdCBzZXQKQ09ORklHX0xPR09fTElOVVhfQ0xVVDIyND15CiMgZW5k
IG9mIEdyYXBoaWNzIHN1cHBvcnQKCkNPTkZJR19TT1VORD1tCkNPTkZJR19TT1VORF9PU1NfQ09S
RT15CkNPTkZJR19TT1VORF9PU1NfQ09SRV9QUkVDTEFJTT15CkNPTkZJR19TTkQ9bQpDT05GSUdf
U05EX1RJTUVSPW0KQ09ORklHX1NORF9QQ009bQpDT05GSUdfU05EX1BDTV9FTEQ9eQpDT05GSUdf
U05EX0hXREVQPW0KQ09ORklHX1NORF9TRVFfREVWSUNFPW0KQ09ORklHX1NORF9SQVdNSURJPW0K
Q09ORklHX1NORF9DT01QUkVTU19PRkZMT0FEPW0KQ09ORklHX1NORF9KQUNLPXkKQ09ORklHX1NO
RF9KQUNLX0lOUFVUX0RFVj15CkNPTkZJR19TTkRfT1NTRU1VTD15CiMgQ09ORklHX1NORF9NSVhF
Ul9PU1MgaXMgbm90IHNldAojIENPTkZJR19TTkRfUENNX09TUyBpcyBub3Qgc2V0CkNPTkZJR19T
TkRfUENNX1RJTUVSPXkKQ09ORklHX1NORF9IUlRJTUVSPW0KQ09ORklHX1NORF9EWU5BTUlDX01J
Tk9SUz15CkNPTkZJR19TTkRfTUFYX0NBUkRTPTMyCiMgQ09ORklHX1NORF9TVVBQT1JUX09MRF9B
UEkgaXMgbm90IHNldApDT05GSUdfU05EX1BST0NfRlM9eQpDT05GSUdfU05EX1ZFUkJPU0VfUFJP
Q0ZTPXkKIyBDT05GSUdfU05EX1ZFUkJPU0VfUFJJTlRLIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1NORF9WTUFTVEVSPXkKQ09ORklHX1NORF9ETUFfU0dC
VUY9eQpDT05GSUdfU05EX1NFUVVFTkNFUj1tCkNPTkZJR19TTkRfU0VRX0RVTU1ZPW0KQ09ORklH
X1NORF9TRVFVRU5DRVJfT1NTPW0KQ09ORklHX1NORF9TRVFfSFJUSU1FUl9ERUZBVUxUPXkKQ09O
RklHX1NORF9TRVFfTUlESV9FVkVOVD1tCkNPTkZJR19TTkRfU0VRX01JREk9bQpDT05GSUdfU05E
X1NFUV9NSURJX0VNVUw9bQpDT05GSUdfU05EX1NFUV9WSVJNSURJPW0KQ09ORklHX1NORF9NUFU0
MDFfVUFSVD1tCkNPTkZJR19TTkRfT1BMM19MSUI9bQpDT05GSUdfU05EX09QTDNfTElCX1NFUT1t
CkNPTkZJR19TTkRfVlhfTElCPW0KQ09ORklHX1NORF9BQzk3X0NPREVDPW0KQ09ORklHX1NORF9E
UklWRVJTPXkKQ09ORklHX1NORF9QQ1NQPW0KQ09ORklHX1NORF9EVU1NWT1tCkNPTkZJR19TTkRf
QUxPT1A9bQpDT05GSUdfU05EX1ZJUk1JREk9bQpDT05GSUdfU05EX01UUEFWPW0KIyBDT05GSUdf
U05EX01UUzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NFUklBTF9VMTY1NTAgaXMgbm90IHNl
dApDT05GSUdfU05EX01QVTQwMT1tCiMgQ09ORklHX1NORF9QT1JUTUFOMlg0IGlzIG5vdCBzZXQK
Q09ORklHX1NORF9BQzk3X1BPV0VSX1NBVkU9eQpDT05GSUdfU05EX0FDOTdfUE9XRVJfU0FWRV9E
RUZBVUxUPTUKQ09ORklHX1NORF9QQ0k9eQpDT05GSUdfU05EX0FEMTg4OT1tCiMgQ09ORklHX1NO
RF9BTFMzMDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfQUxTNDAwMCBpcyBub3Qgc2V0CkNPTkZJ
R19TTkRfQUxJNTQ1MT1tCkNPTkZJR19TTkRfQVNJSFBJPW0KQ09ORklHX1NORF9BVElJWFA9bQpD
T05GSUdfU05EX0FUSUlYUF9NT0RFTT1tCkNPTkZJR19TTkRfQVU4ODEwPW0KQ09ORklHX1NORF9B
VTg4MjA9bQpDT05GSUdfU05EX0FVODgzMD1tCiMgQ09ORklHX1NORF9BVzIgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfQVpUMzMyOCBpcyBub3Qgc2V0CkNPTkZJR19TTkRfQlQ4N1g9bQojIENPTkZJ
R19TTkRfQlQ4N1hfT1ZFUkNMT0NLIGlzIG5vdCBzZXQKQ09ORklHX1NORF9DQTAxMDY9bQpDT05G
SUdfU05EX0NNSVBDST1tCkNPTkZJR19TTkRfT1hZR0VOX0xJQj1tCkNPTkZJR19TTkRfT1hZR0VO
PW0KIyBDT05GSUdfU05EX0NTNDI4MSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfQ1M0NlhYPW0KQ09O
RklHX1NORF9DUzQ2WFhfTkVXX0RTUD15CkNPTkZJR19TTkRfQ1RYRkk9bQpDT05GSUdfU05EX0RB
UkxBMjA9bQpDT05GSUdfU05EX0dJTkEyMD1tCkNPTkZJR19TTkRfTEFZTEEyMD1tCkNPTkZJR19T
TkRfREFSTEEyND1tCkNPTkZJR19TTkRfR0lOQTI0PW0KQ09ORklHX1NORF9MQVlMQTI0PW0KQ09O
RklHX1NORF9NT05BPW0KQ09ORklHX1NORF9NSUE9bQpDT05GSUdfU05EX0VDSE8zRz1tCkNPTkZJ
R19TTkRfSU5ESUdPPW0KQ09ORklHX1NORF9JTkRJR09JTz1tCkNPTkZJR19TTkRfSU5ESUdPREo9
bQpDT05GSUdfU05EX0lORElHT0lPWD1tCkNPTkZJR19TTkRfSU5ESUdPREpYPW0KQ09ORklHX1NO
RF9FTVUxMEsxPW0KQ09ORklHX1NORF9FTVUxMEsxX1NFUT1tCkNPTkZJR19TTkRfRU1VMTBLMVg9
bQpDT05GSUdfU05EX0VOUzEzNzA9bQpDT05GSUdfU05EX0VOUzEzNzE9bQojIENPTkZJR19TTkRf
RVMxOTM4IGlzIG5vdCBzZXQKQ09ORklHX1NORF9FUzE5Njg9bQpDT05GSUdfU05EX0VTMTk2OF9J
TlBVVD15CkNPTkZJR19TTkRfRVMxOTY4X1JBRElPPXkKIyBDT05GSUdfU05EX0ZNODAxIGlzIG5v
dCBzZXQKQ09ORklHX1NORF9IRFNQPW0KQ09ORklHX1NORF9IRFNQTT1tCkNPTkZJR19TTkRfSUNF
MTcxMj1tCkNPTkZJR19TTkRfSUNFMTcyND1tCkNPTkZJR19TTkRfSU5URUw4WDA9bQpDT05GSUdf
U05EX0lOVEVMOFgwTT1tCkNPTkZJR19TTkRfS09SRzEyMTI9bQpDT05GSUdfU05EX0xPTEE9bQpD
T05GSUdfU05EX0xYNjQ2NEVTPW0KQ09ORklHX1NORF9NQUVTVFJPMz1tCkNPTkZJR19TTkRfTUFF
U1RSTzNfSU5QVVQ9eQpDT05GSUdfU05EX01JWEFSVD1tCiMgQ09ORklHX1NORF9OTTI1NiBpcyBu
b3Qgc2V0CkNPTkZJR19TTkRfUENYSFI9bQojIENPTkZJR19TTkRfUklQVElERSBpcyBub3Qgc2V0
CkNPTkZJR19TTkRfUk1FMzI9bQpDT05GSUdfU05EX1JNRTk2PW0KQ09ORklHX1NORF9STUU5NjUy
PW0KIyBDT05GSUdfU05EX1NPTklDVklCRVMgaXMgbm90IHNldApDT05GSUdfU05EX1RSSURFTlQ9
bQpDT05GSUdfU05EX1ZJQTgyWFg9bQpDT05GSUdfU05EX1ZJQTgyWFhfTU9ERU09bQpDT05GSUdf
U05EX1ZJUlRVT1NPPW0KQ09ORklHX1NORF9WWDIyMj1tCiMgQ09ORklHX1NORF9ZTUZQQ0kgaXMg
bm90IHNldAoKIwojIEhELUF1ZGlvCiMKQ09ORklHX1NORF9IREE9bQpDT05GSUdfU05EX0hEQV9H
RU5FUklDX0xFRFM9eQpDT05GSUdfU05EX0hEQV9JTlRFTD1tCkNPTkZJR19TTkRfSERBX0hXREVQ
PXkKQ09ORklHX1NORF9IREFfUkVDT05GSUc9eQpDT05GSUdfU05EX0hEQV9JTlBVVF9CRUVQPXkK
Q09ORklHX1NORF9IREFfSU5QVVRfQkVFUF9NT0RFPTAKQ09ORklHX1NORF9IREFfUEFUQ0hfTE9B
REVSPXkKQ09ORklHX1NORF9IREFfQ09ERUNfUkVBTFRFSz1tCkNPTkZJR19TTkRfSERBX0NPREVD
X0FOQUxPRz1tCkNPTkZJR19TTkRfSERBX0NPREVDX1NJR01BVEVMPW0KQ09ORklHX1NORF9IREFf
Q09ERUNfVklBPW0KQ09ORklHX1NORF9IREFfQ09ERUNfSERNST1tCkNPTkZJR19TTkRfSERBX0NP
REVDX0NJUlJVUz1tCkNPTkZJR19TTkRfSERBX0NPREVDX0NPTkVYQU5UPW0KQ09ORklHX1NORF9I
REFfQ09ERUNfQ0EwMTEwPW0KQ09ORklHX1NORF9IREFfQ09ERUNfQ0EwMTMyPW0KQ09ORklHX1NO
RF9IREFfQ09ERUNfQ0EwMTMyX0RTUD15CkNPTkZJR19TTkRfSERBX0NPREVDX0NNRURJQT1tCkNP
TkZJR19TTkRfSERBX0NPREVDX1NJMzA1ND1tCkNPTkZJR19TTkRfSERBX0dFTkVSSUM9bQpDT05G
SUdfU05EX0hEQV9QT1dFUl9TQVZFX0RFRkFVTFQ9MAojIENPTkZJR19TTkRfSERBX0lOVEVMX0hE
TUlfU0lMRU5UX1NUUkVBTSBpcyBub3Qgc2V0CiMgZW5kIG9mIEhELUF1ZGlvCgpDT05GSUdfU05E
X0hEQV9DT1JFPW0KQ09ORklHX1NORF9IREFfRFNQX0xPQURFUj15CkNPTkZJR19TTkRfSERBX0NP
TVBPTkVOVD15CkNPTkZJR19TTkRfSERBX0k5MTU9eQpDT05GSUdfU05EX0hEQV9FWFRfQ09SRT1t
CkNPTkZJR19TTkRfSERBX1BSRUFMTE9DX1NJWkU9NTEyCkNPTkZJR19TTkRfSU5URUxfTkhMVD15
CkNPTkZJR19TTkRfSU5URUxfRFNQX0NPTkZJRz1tCkNPTkZJR19TTkRfSU5URUxfU09VTkRXSVJF
X0FDUEk9bQojIENPTkZJR19TTkRfSU5URUxfQllUX1BSRUZFUl9TT0YgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU1BJIGlzIG5vdCBzZXQKQ09ORklHX1NORF9VU0I9eQpDT05GSUdfU05EX1VTQl9B
VURJTz1tCkNPTkZJR19TTkRfVVNCX0FVRElPX1VTRV9NRURJQV9DT05UUk9MTEVSPXkKQ09ORklH
X1NORF9VU0JfVUExMDE9bQpDT05GSUdfU05EX1VTQl9VU1gyWT1tCkNPTkZJR19TTkRfVVNCX0NB
SUFRPW0KQ09ORklHX1NORF9VU0JfQ0FJQVFfSU5QVVQ9eQpDT05GSUdfU05EX1VTQl9VUzEyMkw9
bQpDT05GSUdfU05EX1VTQl82RklSRT1tCkNPTkZJR19TTkRfVVNCX0hJRkFDRT1tCkNPTkZJR19T
TkRfQkNEMjAwMD1tCkNPTkZJR19TTkRfVVNCX0xJTkU2PW0KQ09ORklHX1NORF9VU0JfUE9EPW0K
Q09ORklHX1NORF9VU0JfUE9ESEQ9bQpDT05GSUdfU05EX1VTQl9UT05FUE9SVD1tCkNPTkZJR19T
TkRfVVNCX1ZBUklBWD1tCkNPTkZJR19TTkRfRklSRVdJUkU9eQpDT05GSUdfU05EX0ZJUkVXSVJF
X0xJQj1tCkNPTkZJR19TTkRfRElDRT1tCkNPTkZJR19TTkRfT1hGVz1tCkNPTkZJR19TTkRfSVNJ
R0hUPW0KQ09ORklHX1NORF9GSVJFV09SS1M9bQpDT05GSUdfU05EX0JFQk9CPW0KQ09ORklHX1NO
RF9GSVJFV0lSRV9ESUdJMDBYPW0KQ09ORklHX1NORF9GSVJFV0lSRV9UQVNDQU09bQpDT05GSUdf
U05EX0ZJUkVXSVJFX01PVFU9bQpDT05GSUdfU05EX0ZJUkVGQUNFPW0KQ09ORklHX1NORF9TT0M9
bQpDT05GSUdfU05EX1NPQ19DT01QUkVTUz15CkNPTkZJR19TTkRfU09DX1RPUE9MT0dZPXkKQ09O
RklHX1NORF9TT0NfQUNQST1tCiMgQ09ORklHX1NORF9TT0NfQURJIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19BTURfQUNQIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BTURfQUNQM3gg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FNRF9SRU5PSVIgaXMgbm90IHNldAojIENPTkZJ
R19TTkRfQVRNRUxfU09DIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0JDTTYzWFhfSTJTX1dISVNU
TEVSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX0RFU0lHTldBUkVfSTJTIGlzIG5vdCBzZXQKCiMK
IyBTb0MgQXVkaW8gZm9yIEZyZWVzY2FsZSBDUFVzCiMKCiMKIyBDb21tb24gU29DIEF1ZGlvIG9w
dGlvbnMgZm9yIEZyZWVzY2FsZSBDUFVzOgojCiMgQ09ORklHX1NORF9TT0NfRlNMX0FTUkMgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9TQUkgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX0ZTTF9BVURNSVggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9TU0kgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9TUERJRiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfRlNMX0VTQUkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9NSUNGSUwgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0ZTTF9YQ1ZSIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19JTVhfQVVETVVYIGlzIG5vdCBzZXQKIyBlbmQgb2YgU29DIEF1ZGlvIGZvciBGcmVlc2NhbGUg
Q1BVcwoKIyBDT05GSUdfU05EX0kyU19ISTYyMTBfSTJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19JTUcgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19JTlRFTF9TU1RfVE9QTEVWRUw9eQpD
T05GSUdfU05EX1NPQ19JTlRFTF9TU1Q9bQojIENPTkZJR19TTkRfU09DX0lOVEVMX0NBVFBUIGlz
IG5vdCBzZXQKQ09ORklHX1NORF9TU1RfQVRPTV9ISUZJMl9QTEFURk9STT1tCiMgQ09ORklHX1NO
RF9TU1RfQVRPTV9ISUZJMl9QTEFURk9STV9QQ0kgaXMgbm90IHNldApDT05GSUdfU05EX1NTVF9B
VE9NX0hJRkkyX1BMQVRGT1JNX0FDUEk9bQpDT05GSUdfU05EX1NPQ19JTlRFTF9TS1lMQUtFPW0K
Q09ORklHX1NORF9TT0NfSU5URUxfU0tMPW0KQ09ORklHX1NORF9TT0NfSU5URUxfQVBMPW0KQ09O
RklHX1NORF9TT0NfSU5URUxfS0JMPW0KQ09ORklHX1NORF9TT0NfSU5URUxfR0xLPW0KQ09ORklH
X1NORF9TT0NfSU5URUxfQ05MPW0KQ09ORklHX1NORF9TT0NfSU5URUxfQ0ZMPW0KQ09ORklHX1NO
RF9TT0NfSU5URUxfQ01MX0g9bQpDT05GSUdfU05EX1NPQ19JTlRFTF9DTUxfTFA9bQpDT05GSUdf
U05EX1NPQ19JTlRFTF9TS1lMQUtFX0ZBTUlMWT1tCkNPTkZJR19TTkRfU09DX0lOVEVMX1NLWUxB
S0VfU1NQX0NMSz1tCiMgQ09ORklHX1NORF9TT0NfSU5URUxfU0tZTEFLRV9IREFVRElPX0NPREVD
IGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfSU5URUxfU0tZTEFLRV9DT01NT049bQpDT05GSUdf
U05EX1NPQ19BQ1BJX0lOVEVMX01BVENIPW0KQ09ORklHX1NORF9TT0NfSU5URUxfTUFDSD15CkNP
TkZJR19TTkRfU09DX0lOVEVMX1VTRVJfRlJJRU5ETFlfTE9OR19OQU1FUz15CkNPTkZJR19TTkRf
U09DX0lOVEVMX0JEV19SVDU2NTBfTUFDSD1tCkNPTkZJR19TTkRfU09DX0lOVEVMX0JEV19SVDU2
NzdfTUFDSD1tCkNPTkZJR19TTkRfU09DX0lOVEVMX0JST0FEV0VMTF9NQUNIPW0KQ09ORklHX1NO
RF9TT0NfSU5URUxfQllUQ1JfUlQ1NjQwX01BQ0g9bQpDT05GSUdfU05EX1NPQ19JTlRFTF9CWVRD
Ul9SVDU2NTFfTUFDSD1tCkNPTkZJR19TTkRfU09DX0lOVEVMX0NIVF9CU1dfUlQ1NjcyX01BQ0g9
bQpDT05GSUdfU05EX1NPQ19JTlRFTF9DSFRfQlNXX1JUNTY0NV9NQUNIPW0KQ09ORklHX1NORF9T
T0NfSU5URUxfQ0hUX0JTV19NQVg5ODA5MF9USV9NQUNIPW0KQ09ORklHX1NORF9TT0NfSU5URUxf
Q0hUX0JTV19OQVU4ODI0X01BQ0g9bQpDT05GSUdfU05EX1NPQ19JTlRFTF9CWVRfQ0hUX0NYMjA3
MlhfTUFDSD1tCkNPTkZJR19TTkRfU09DX0lOVEVMX0JZVF9DSFRfREE3MjEzX01BQ0g9bQpDT05G
SUdfU05EX1NPQ19JTlRFTF9CWVRfQ0hUX0VTODMxNl9NQUNIPW0KQ09ORklHX1NORF9TT0NfSU5U
RUxfQllUX0NIVF9OT0NPREVDX01BQ0g9bQpDT05GSUdfU05EX1NPQ19JTlRFTF9TS0xfUlQyODZf
TUFDSD1tCkNPTkZJR19TTkRfU09DX0lOVEVMX1NLTF9OQVU4OEwyNV9TU000NTY3X01BQ0g9bQpD
T05GSUdfU05EX1NPQ19JTlRFTF9TS0xfTkFVODhMMjVfTUFYOTgzNTdBX01BQ0g9bQpDT05GSUdf
U05EX1NPQ19JTlRFTF9EQTcyMTlfTUFYOTgzNTdBX0dFTkVSSUM9bQpDT05GSUdfU05EX1NPQ19J
TlRFTF9CWFRfREE3MjE5X01BWDk4MzU3QV9DT01NT049bQpDT05GSUdfU05EX1NPQ19JTlRFTF9C
WFRfREE3MjE5X01BWDk4MzU3QV9NQUNIPW0KQ09ORklHX1NORF9TT0NfSU5URUxfQlhUX1JUMjk4
X01BQ0g9bQojIENPTkZJR19TTkRfU09DX0lOVEVMX1NPRl9XTTg4MDRfTUFDSCBpcyBub3Qgc2V0
CkNPTkZJR19TTkRfU09DX0lOVEVMX0tCTF9SVDU2NjNfTUFYOTg5MjdfTUFDSD1tCkNPTkZJR19T
TkRfU09DX0lOVEVMX0tCTF9SVDU2NjNfUlQ1NTE0X01BWDk4OTI3X01BQ0g9bQpDT05GSUdfU05E
X1NPQ19JTlRFTF9LQkxfREE3MjE5X01BWDk4MzU3QV9NQUNIPW0KQ09ORklHX1NORF9TT0NfSU5U
RUxfS0JMX0RBNzIxOV9NQVg5ODkyN19NQUNIPW0KQ09ORklHX1NORF9TT0NfSU5URUxfS0JMX1JU
NTY2MF9NQUNIPW0KQ09ORklHX1NORF9TT0NfSU5URUxfR0xLX0RBNzIxOV9NQVg5ODM1N0FfTUFD
SD1tCkNPTkZJR19TTkRfU09DX0lOVEVMX0dMS19SVDU2ODJfTUFYOTgzNTdBX01BQ0g9bQpDT05G
SUdfU05EX1NPQ19JTlRFTF9TS0xfSERBX0RTUF9HRU5FUklDX01BQ0g9bQpDT05GSUdfU05EX1NP
Q19JTlRFTF9TT0ZfUlQ1NjgyX01BQ0g9bQpDT05GSUdfU05EX1NPQ19JTlRFTF9TT0ZfUENNNTEy
eF9NQUNIPW0KQ09ORklHX1NORF9TT0NfSU5URUxfQ01MX0xQX0RBNzIxOV9NQVg5ODM1N0FfTUFD
SD1tCkNPTkZJR19TTkRfU09DX0lOVEVMX1NPRl9DTUxfUlQxMDExX1JUNTY4Ml9NQUNIPW0KQ09O
RklHX1NORF9TT0NfSU5URUxfU09GX0RBNzIxOV9NQVg5ODM3M19NQUNIPW0KIyBDT05GSUdfU05E
X1NPQ19JTlRFTF9FSExfUlQ1NjYwX01BQ0ggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01U
S19CVENWU0QgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19TT0ZfVE9QTEVWRUw9eQpDT05GSUdf
U05EX1NPQ19TT0ZfUENJX0RFVj1tCkNPTkZJR19TTkRfU09DX1NPRl9QQ0k9bQpDT05GSUdfU05E
X1NPQ19TT0ZfQUNQST1tCkNPTkZJR19TTkRfU09DX1NPRl9BQ1BJX0RFVj1tCiMgQ09ORklHX1NO
RF9TT0NfU09GX0RFQlVHX1BST0JFUyBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX1NPRj1tCkNP
TkZJR19TTkRfU09DX1NPRl9QUk9CRV9XT1JLX1FVRVVFPXkKQ09ORklHX1NORF9TT0NfU09GX0lO
VEVMX1RPUExFVkVMPXkKQ09ORklHX1NORF9TT0NfU09GX0lOVEVMX0hJRklfRVBfSVBDPW0KQ09O
RklHX1NORF9TT0NfU09GX0lOVEVMX0FUT01fSElGSV9FUD1tCkNPTkZJR19TTkRfU09DX1NPRl9J
TlRFTF9DT01NT049bQpDT05GSUdfU05EX1NPQ19TT0ZfQkFZVFJBSUw9bQpDT05GSUdfU05EX1NP
Q19TT0ZfQlJPQURXRUxMPW0KQ09ORklHX1NORF9TT0NfU09GX01FUlJJRklFTEQ9bQpDT05GSUdf
U05EX1NPQ19TT0ZfSU5URUxfQVBMPW0KQ09ORklHX1NORF9TT0NfU09GX0FQT0xMT0xBS0U9bQpD
T05GSUdfU05EX1NPQ19TT0ZfR0VNSU5JTEFLRT1tCkNPTkZJR19TTkRfU09DX1NPRl9JTlRFTF9D
Tkw9bQpDT05GSUdfU05EX1NPQ19TT0ZfQ0FOTk9OTEFLRT1tCkNPTkZJR19TTkRfU09DX1NPRl9D
T0ZGRUVMQUtFPW0KQ09ORklHX1NORF9TT0NfU09GX0NPTUVUTEFLRT1tCkNPTkZJR19TTkRfU09D
X1NPRl9JTlRFTF9JQ0w9bQpDT05GSUdfU05EX1NPQ19TT0ZfSUNFTEFLRT1tCkNPTkZJR19TTkRf
U09DX1NPRl9KQVNQRVJMQUtFPW0KQ09ORklHX1NORF9TT0NfU09GX0lOVEVMX1RHTD1tCkNPTkZJ
R19TTkRfU09DX1NPRl9USUdFUkxBS0U9bQpDT05GSUdfU05EX1NPQ19TT0ZfRUxLSEFSVExBS0U9
bQpDT05GSUdfU05EX1NPQ19TT0ZfQUxERVJMQUtFPW0KQ09ORklHX1NORF9TT0NfU09GX0hEQV9D
T01NT049bQpDT05GSUdfU05EX1NPQ19TT0ZfSERBX0xJTks9eQpDT05GSUdfU05EX1NPQ19TT0Zf
SERBX0FVRElPX0NPREVDPXkKIyBDT05GSUdfU05EX1NPQ19TT0ZfSERBX0FMV0FZU19FTkFCTEVf
RE1JX0wxIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfU09GX0hEQV9MSU5LX0JBU0VMSU5FPW0K
Q09ORklHX1NORF9TT0NfU09GX0hEQT1tCkNPTkZJR19TTkRfU09DX1NPRl9JTlRFTF9TT1VORFdJ
UkVfTElOS19CQVNFTElORT1tCkNPTkZJR19TTkRfU09DX1NPRl9YVEVOU0E9bQoKIwojIFNUTWlj
cm9lbGVjdHJvbmljcyBTVE0zMiBTT0MgYXVkaW8gc3VwcG9ydAojCiMgZW5kIG9mIFNUTWljcm9l
bGVjdHJvbmljcyBTVE0zMiBTT0MgYXVkaW8gc3VwcG9ydAoKIyBDT05GSUdfU05EX1NPQ19YSUxJ
TlhfSTJTIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19YSUxJTlhfQVVESU9fRk9STUFUVEVS
IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19YSUxJTlhfU1BESUYgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX1hURlBHQV9JMlMgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19JMkNfQU5E
X1NQST1tCgojCiMgQ09ERUMgZHJpdmVycwojCiMgQ09ORklHX1NORF9TT0NfQUM5N19DT0RFQyBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQURBVTEzNzJfSTJDIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19BREFVMTM3Ml9TUEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FEQVUx
NzAxIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19BREFVMTc2MV9JMkMgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX0FEQVUxNzYxX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
QURBVTcwMDIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FEQVU3MTE4X0hXIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19BREFVNzExOF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX0FLNDEwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQUs0MTE4IGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19BSzQ0NTggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNDU1
NCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQUs0NjEzIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19BSzQ2NDIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0FLNTM4NiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfQUs1NTU4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19B
TEM1NjIzIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19CRDI4NjIzIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19CVF9TQ08gaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTMzVMMzIg
aXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTMzVMMzMgaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX0NTMzVMMzQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTMzVMMzUgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX0NTMzVMMzYgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X0NTNDJMNDIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDJMNTFfSTJDIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyTDUyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19D
UzQyTDU2IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyTDczIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19DUzQyMzQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0NTNDI2NSBp
cyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0MjcwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19DUzQyNzFfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyNzFfU1BJIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQyWFg4X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfQ1M0MzEzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfQ1M0MzQxIGlzIG5v
dCBzZXQKIyBDT05GSUdfU05EX1NPQ19DUzQzNDkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09D
X0NTNTNMMzAgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19DWDIwNzJYPW0KQ09ORklHX1NORF9T
T0NfREE3MjEzPW0KQ09ORklHX1NORF9TT0NfREE3MjE5PW0KQ09ORklHX1NORF9TT0NfRE1JQz1t
CiMgQ09ORklHX1NORF9TT0NfRVM3MTM0IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19FUzcy
NDEgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19FUzgzMTY9bQojIENPTkZJR19TTkRfU09DX0VT
ODMyOF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0VTODMyOF9TUEkgaXMgbm90IHNl
dAojIENPTkZJR19TTkRfU09DX0dUTTYwMSBpcyBub3Qgc2V0CkNPTkZJR19TTkRfU09DX0hEQUNf
SERNST1tCkNPTkZJR19TTkRfU09DX0hEQUNfSERBPW0KIyBDT05GSUdfU05EX1NPQ19JTk5PX1JL
MzAzNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTUFYOTgwODggaXMgbm90IHNldApDT05G
SUdfU05EX1NPQ19NQVg5ODA5MD1tCkNPTkZJR19TTkRfU09DX01BWDk4MzU3QT1tCiMgQ09ORklH
X1NORF9TT0NfTUFYOTg1MDQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01BWDk4NjcgaXMg
bm90IHNldApDT05GSUdfU05EX1NPQ19NQVg5ODkyNz1tCkNPTkZJR19TTkRfU09DX01BWDk4Mzcz
PW0KQ09ORklHX1NORF9TT0NfTUFYOTgzNzNfSTJDPW0KQ09ORklHX1NORF9TT0NfTUFYOTgzOTA9
bQojIENPTkZJR19TTkRfU09DX01BWDk4NjAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX01T
TTg5MTZfV0NEX0RJR0lUQUwgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTE2ODEgaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTE3ODlfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19QQ00xNzlYX0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENNMTc5WF9T
UEkgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTE4NlhfSTJDIGlzIG5vdCBzZXQKIyBD
T05GSUdfU05EX1NPQ19QQ00xODZYX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENN
MzA2MF9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1BDTTMwNjBfU1BJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19QQ00zMTY4QV9JMkMgaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX1BDTTMxNjhBX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUENNNTEwMkEgaXMg
bm90IHNldApDT05GSUdfU05EX1NPQ19QQ001MTJ4PW0KQ09ORklHX1NORF9TT0NfUENNNTEyeF9J
MkM9bQojIENPTkZJR19TTkRfU09DX1BDTTUxMnhfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19SSzMzMjggaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19STDYyMzE9bQpDT05GSUdfU05E
X1NPQ19STDYzNDdBPW0KQ09ORklHX1NORF9TT0NfUlQyODY9bQpDT05GSUdfU05EX1NPQ19SVDI5
OD1tCkNPTkZJR19TTkRfU09DX1JUMTAxMT1tCkNPTkZJR19TTkRfU09DX1JUMTAxNT1tCkNPTkZJ
R19TTkRfU09DX1JUNTUxND1tCkNPTkZJR19TTkRfU09DX1JUNTUxNF9TUEk9bQojIENPTkZJR19T
TkRfU09DX1JUNTYxNiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfUlQ1NjMxIGlzIG5vdCBz
ZXQKQ09ORklHX1NORF9TT0NfUlQ1NjQwPW0KQ09ORklHX1NORF9TT0NfUlQ1NjQ1PW0KQ09ORklH
X1NORF9TT0NfUlQ1NjUxPW0KIyBDT05GSUdfU05EX1NPQ19SVDU2NTkgaXMgbm90IHNldApDT05G
SUdfU05EX1NPQ19SVDU2NjA9bQpDT05GSUdfU05EX1NPQ19SVDU2NjM9bQpDT05GSUdfU05EX1NP
Q19SVDU2NzA9bQpDT05GSUdfU05EX1NPQ19SVDU2Nzc9bQpDT05GSUdfU05EX1NPQ19SVDU2Nzdf
U1BJPW0KQ09ORklHX1NORF9TT0NfUlQ1NjgyPW0KQ09ORklHX1NORF9TT0NfUlQ1NjgyX0kyQz1t
CiMgQ09ORklHX1NORF9TT0NfU0dUTDUwMDAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1NJ
TVBMRV9BTVBMSUZJRVIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1NJTVBMRV9NVVggaXMg
bm90IHNldAojIENPTkZJR19TTkRfU09DX1NQRElGIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19TU00yMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19TU00yNjAyX1NQSSBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfU1NNMjYwMl9JMkMgaXMgbm90IHNldApDT05GSUdfU05EX1NP
Q19TU000NTY3PW0KIyBDT05GSUdfU05EX1NPQ19TVEEzMlggaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1NUQTM1MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfU1RJX1NBUyBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfVEFTMjU1MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
VEFTMjU2MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTMjc2NCBpcyBub3Qgc2V0CiMg
Q09ORklHX1NORF9TT0NfVEFTMjc3MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTA4
NiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNTcxWCBpcyBub3Qgc2V0CiMgQ09ORklH
X1NORF9TT0NfVEFTNTcyMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVEFTNjQyNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVERBNzQxOSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfVEZBOTg3OSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVExWMzIwQUlDMjNfSTJDIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMyM19TUEkgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX1RMVjMyMEFJQzMxWFggaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1RM
VjMyMEFJQzMyWDRfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19UTFYzMjBBSUMzMlg0
X1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfVExWMzIwQUlDM1ggaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX1RMVjMyMEFEQ1gxNDAgaXMgbm90IHNldApDT05GSUdfU05EX1NPQ19U
UzNBMjI3RT1tCiMgQ09ORklHX1NORF9TT0NfVFNDUzQyWFggaXMgbm90IHNldAojIENPTkZJR19T
TkRfU09DX1RTQ1M0NTQgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1VEQTEzMzQgaXMgbm90
IHNldAojIENPTkZJR19TTkRfU09DX1dNODUxMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0Nf
V004NTIzIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg1MjQgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX1dNODU4MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzExIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg3MjggaXMgbm90IHNldAojIENPTkZJR19TTkRf
U09DX1dNODczMSBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzM3IGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19XTTg3NDEgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODc1
MCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004NzUzIGlzIG5vdCBzZXQKIyBDT05GSUdf
U05EX1NPQ19XTTg3NzAgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODc3NiBpcyBub3Qg
c2V0CiMgQ09ORklHX1NORF9TT0NfV004NzgyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19X
TTg4MDRfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19XTTg4MDRfU1BJIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19XTTg5MDMgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dN
ODkwNCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004OTYwIGlzIG5vdCBzZXQKIyBDT05G
SUdfU05EX1NPQ19XTTg5NjIgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1dNODk3NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfV004OTc4IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NP
Q19XTTg5ODUgaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX1pMMzgwNjAgaXMgbm90IHNldAoj
IENPTkZJR19TTkRfU09DX1pYX0FVRDk2UDIyIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19N
QVg5NzU5IGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19NVDYzNTEgaXMgbm90IHNldAojIENP
TkZJR19TTkRfU09DX01UNjM1OCBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTVQ2NjYwIGlz
IG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19OQVU4MzE1IGlzIG5vdCBzZXQKIyBDT05GSUdfU05E
X1NPQ19OQVU4NTQwIGlzIG5vdCBzZXQKIyBDT05GSUdfU05EX1NPQ19OQVU4ODEwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfU05EX1NPQ19OQVU4ODIyIGlzIG5vdCBzZXQKQ09ORklHX1NORF9TT0NfTkFV
ODgyND1tCkNPTkZJR19TTkRfU09DX05BVTg4MjU9bQojIENPTkZJR19TTkRfU09DX1RQQTYxMzBB
MiBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9TT0NfTFBBU1NfV1NBX01BQ1JPIGlzIG5vdCBzZXQK
IyBDT05GSUdfU05EX1NPQ19MUEFTU19WQV9NQUNSTyBpcyBub3Qgc2V0CiMgQ09ORklHX1NORF9T
T0NfTFBBU1NfUlhfTUFDUk8gaXMgbm90IHNldAojIENPTkZJR19TTkRfU09DX0xQQVNTX1RYX01B
Q1JPIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ09ERUMgZHJpdmVycwoKIyBDT05GSUdfU05EX1NJTVBM
RV9DQVJEIGlzIG5vdCBzZXQKQ09ORklHX1NORF9YODY9eQpDT05GSUdfSERNSV9MUEVfQVVESU89
bQpDT05GSUdfU05EX1NZTlRIX0VNVVg9bQpDT05GSUdfU05EX1hFTl9GUk9OVEVORD1tCkNPTkZJ
R19BQzk3X0JVUz1tCgojCiMgSElEIHN1cHBvcnQKIwpDT05GSUdfSElEPXkKQ09ORklHX0hJRF9C
QVRURVJZX1NUUkVOR1RIPXkKQ09ORklHX0hJRFJBVz15CkNPTkZJR19VSElEPW0KQ09ORklHX0hJ
RF9HRU5FUklDPXkKCiMKIyBTcGVjaWFsIEhJRCBkcml2ZXJzCiMKQ09ORklHX0hJRF9BNFRFQ0g9
bQojIENPTkZJR19ISURfQUNDVVRPVUNIIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9BQ1JVWD1tCiMg
Q09ORklHX0hJRF9BQ1JVWF9GRiBpcyBub3Qgc2V0CkNPTkZJR19ISURfQVBQTEU9bQpDT05GSUdf
SElEX0FQUExFSVI9bQpDT05GSUdfSElEX0FTVVM9bQpDT05GSUdfSElEX0FVUkVBTD1tCkNPTkZJ
R19ISURfQkVMS0lOPW0KQ09ORklHX0hJRF9CRVRPUF9GRj1tCiMgQ09ORklHX0hJRF9CSUdCRU5f
RkYgaXMgbm90IHNldApDT05GSUdfSElEX0NIRVJSWT1tCkNPTkZJR19ISURfQ0hJQ09OWT1tCkNP
TkZJR19ISURfQ09SU0FJUj1tCiMgQ09ORklHX0hJRF9DT1VHQVIgaXMgbm90IHNldAojIENPTkZJ
R19ISURfTUFDQUxMWSBpcyBub3Qgc2V0CkNPTkZJR19ISURfUFJPRElLRVlTPW0KQ09ORklHX0hJ
RF9DTUVESUE9bQojIENPTkZJR19ISURfQ1AyMTEyIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX0NS
RUFUSVZFX1NCMDU0MCBpcyBub3Qgc2V0CkNPTkZJR19ISURfQ1lQUkVTUz1tCkNPTkZJR19ISURf
RFJBR09OUklTRT1tCiMgQ09ORklHX0RSQUdPTlJJU0VfRkYgaXMgbm90IHNldAojIENPTkZJR19I
SURfRU1TX0ZGIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9FTEFOPW0KQ09ORklHX0hJRF9FTEVDT009
bQpDT05GSUdfSElEX0VMTz1tCkNPTkZJR19ISURfRVpLRVk9bQpDT05GSUdfSElEX0dFTUJJUkQ9
bQpDT05GSUdfSElEX0dGUk09bQojIENPTkZJR19ISURfR0xPUklPVVMgaXMgbm90IHNldApDT05G
SUdfSElEX0hPTFRFSz1tCiMgQ09ORklHX0hPTFRFS19GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0hJ
RF9WSVZBTERJIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9HVDY4M1I9bQpDT05GSUdfSElEX0tFWVRP
VUNIPW0KQ09ORklHX0hJRF9LWUU9bQpDT05GSUdfSElEX1VDTE9HSUM9bQpDT05GSUdfSElEX1dB
TFRPUD1tCiMgQ09ORklHX0hJRF9WSUVXU09OSUMgaXMgbm90IHNldApDT05GSUdfSElEX0dZUkFU
SU9OPW0KQ09ORklHX0hJRF9JQ0FERT1tCkNPTkZJR19ISURfSVRFPW0KQ09ORklHX0hJRF9KQUJS
QT1tCkNPTkZJR19ISURfVFdJTkhBTj1tCkNPTkZJR19ISURfS0VOU0lOR1RPTj1tCkNPTkZJR19I
SURfTENQT1dFUj1tCkNPTkZJR19ISURfTEVEPW0KQ09ORklHX0hJRF9MRU5PVk89bQpDT05GSUdf
SElEX0xPR0lURUNIPW0KQ09ORklHX0hJRF9MT0dJVEVDSF9ESj1tCkNPTkZJR19ISURfTE9HSVRF
Q0hfSElEUFA9bQojIENPTkZJR19MT0dJVEVDSF9GRiBpcyBub3Qgc2V0CiMgQ09ORklHX0xPR0lS
VU1CTEVQQUQyX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfTE9HSUc5NDBfRkYgaXMgbm90IHNldAoj
IENPTkZJR19MT0dJV0hFRUxTX0ZGIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9NQUdJQ01PVVNFPXkK
IyBDT05GSUdfSElEX01BTFRST04gaXMgbm90IHNldAojIENPTkZJR19ISURfTUFZRkxBU0ggaXMg
bm90IHNldAojIENPTkZJR19ISURfUkVEUkFHT04gaXMgbm90IHNldApDT05GSUdfSElEX01JQ1JP
U09GVD1tCkNPTkZJR19ISURfTU9OVEVSRVk9bQpDT05GSUdfSElEX01VTFRJVE9VQ0g9bQpDT05G
SUdfSElEX05UST1tCkNPTkZJR19ISURfTlRSSUc9eQpDT05GSUdfSElEX09SVEVLPW0KQ09ORklH
X0hJRF9QQU5USEVSTE9SRD1tCiMgQ09ORklHX1BBTlRIRVJMT1JEX0ZGIGlzIG5vdCBzZXQKQ09O
RklHX0hJRF9QRU5NT1VOVD1tCkNPTkZJR19ISURfUEVUQUxZTlg9bQpDT05GSUdfSElEX1BJQ09M
Q0Q9bQpDT05GSUdfSElEX1BJQ09MQ0RfRkI9eQpDT05GSUdfSElEX1BJQ09MQ0RfQkFDS0xJR0hU
PXkKQ09ORklHX0hJRF9QSUNPTENEX0xDRD15CkNPTkZJR19ISURfUElDT0xDRF9MRURTPXkKQ09O
RklHX0hJRF9QSUNPTENEX0NJUj15CkNPTkZJR19ISURfUExBTlRST05JQ1M9bQojIENPTkZJR19I
SURfUExBWVNUQVRJT04gaXMgbm90IHNldApDT05GSUdfSElEX1BSSU1BWD1tCiMgQ09ORklHX0hJ
RF9SRVRST0RFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9ST0NDQVQ9bQpDT05GSUdfSElEX1NBSVRF
Sz1tCkNPTkZJR19ISURfU0FNU1VORz1tCkNPTkZJR19ISURfU09OWT1tCkNPTkZJR19TT05ZX0ZG
PXkKQ09ORklHX0hJRF9TUEVFRExJTks9bQojIENPTkZJR19ISURfU1RFQU0gaXMgbm90IHNldApD
T05GSUdfSElEX1NURUVMU0VSSUVTPW0KQ09ORklHX0hJRF9TVU5QTFVTPW0KQ09ORklHX0hJRF9S
TUk9bQpDT05GSUdfSElEX0dSRUVOQVNJQT1tCiMgQ09ORklHX0dSRUVOQVNJQV9GRiBpcyBub3Qg
c2V0CkNPTkZJR19ISURfSFlQRVJWX01PVVNFPW0KQ09ORklHX0hJRF9TTUFSVEpPWVBMVVM9bQoj
IENPTkZJR19TTUFSVEpPWVBMVVNfRkYgaXMgbm90IHNldApDT05GSUdfSElEX1RJVk89bQpDT05G
SUdfSElEX1RPUFNFRUQ9bQpDT05GSUdfSElEX1RISU5HTT1tCkNPTkZJR19ISURfVEhSVVNUTUFT
VEVSPW0KIyBDT05GSUdfVEhSVVNUTUFTVEVSX0ZGIGlzIG5vdCBzZXQKIyBDT05GSUdfSElEX1VE
UkFXX1BTMyBpcyBub3Qgc2V0CiMgQ09ORklHX0hJRF9VMkZaRVJPIGlzIG5vdCBzZXQKQ09ORklH
X0hJRF9XQUNPTT1tCkNPTkZJR19ISURfV0lJTU9URT1tCkNPTkZJR19ISURfWElOTU89bQpDT05G
SUdfSElEX1pFUk9QTFVTPW0KIyBDT05GSUdfWkVST1BMVVNfRkYgaXMgbm90IHNldApDT05GSUdf
SElEX1pZREFDUk9OPW0KQ09ORklHX0hJRF9TRU5TT1JfSFVCPXkKQ09ORklHX0hJRF9TRU5TT1Jf
Q1VTVE9NX1NFTlNPUj1tCkNPTkZJR19ISURfQUxQUz1tCiMgQ09ORklHX0hJRF9NQ1AyMjIxIGlz
IG5vdCBzZXQKIyBlbmQgb2YgU3BlY2lhbCBISUQgZHJpdmVycwoKIwojIFVTQiBISUQgc3VwcG9y
dAojCkNPTkZJR19VU0JfSElEPXkKQ09ORklHX0hJRF9QSUQ9eQpDT05GSUdfVVNCX0hJRERFVj15
CiMgZW5kIG9mIFVTQiBISUQgc3VwcG9ydAoKIwojIEkyQyBISUQgc3VwcG9ydAojCiMgQ09ORklH
X0kyQ19ISURfQUNQSSBpcyBub3Qgc2V0CiMgZW5kIG9mIEkyQyBISUQgc3VwcG9ydAoKIwojIElu
dGVsIElTSCBISUQgc3VwcG9ydAojCkNPTkZJR19JTlRFTF9JU0hfSElEPW0KIyBDT05GSUdfSU5U
RUxfSVNIX0ZJUk1XQVJFX0RPV05MT0FERVIgaXMgbm90IHNldAojIGVuZCBvZiBJbnRlbCBJU0gg
SElEIHN1cHBvcnQKCiMKIyBBTUQgU0ZIIEhJRCBTdXBwb3J0CiMKIyBDT05GSUdfQU1EX1NGSF9I
SUQgaXMgbm90IHNldAojIGVuZCBvZiBBTUQgU0ZIIEhJRCBTdXBwb3J0CiMgZW5kIG9mIEhJRCBz
dXBwb3J0CgpDT05GSUdfVVNCX09IQ0lfTElUVExFX0VORElBTj15CkNPTkZJR19VU0JfU1VQUE9S
VD15CkNPTkZJR19VU0JfQ09NTU9OPXkKQ09ORklHX1VTQl9MRURfVFJJRz15CiMgQ09ORklHX1VT
Ql9VTFBJX0JVUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DT05OX0dQSU8gaXMgbm90IHNldApD
T05GSUdfVVNCX0FSQ0hfSEFTX0hDRD15CkNPTkZJR19VU0I9eQpDT05GSUdfVVNCX1BDST15CkNP
TkZJR19VU0JfQU5OT1VOQ0VfTkVXX0RFVklDRVM9eQoKIwojIE1pc2NlbGxhbmVvdXMgVVNCIG9w
dGlvbnMKIwpDT05GSUdfVVNCX0RFRkFVTFRfUEVSU0lTVD15CiMgQ09ORklHX1VTQl9GRVdfSU5J
VF9SRVRSSUVTIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0RZTkFNSUNfTUlOT1JTIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX09URyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9PVEdfUFJPRFVDVExJ
U1QgaXMgbm90IHNldApDT05GSUdfVVNCX0xFRFNfVFJJR0dFUl9VU0JQT1JUPW0KQ09ORklHX1VT
Ql9BVVRPU1VTUEVORF9ERUxBWT0yCkNPTkZJR19VU0JfTU9OPXkKCiMKIyBVU0IgSG9zdCBDb250
cm9sbGVyIERyaXZlcnMKIwojIENPTkZJR19VU0JfQzY3WDAwX0hDRCBpcyBub3Qgc2V0CkNPTkZJ
R19VU0JfWEhDSV9IQ0Q9eQpDT05GSUdfVVNCX1hIQ0lfREJHQ0FQPXkKQ09ORklHX1VTQl9YSENJ
X1BDST15CiMgQ09ORklHX1VTQl9YSENJX1BDSV9SRU5FU0FTIGlzIG5vdCBzZXQKIyBDT05GSUdf
VVNCX1hIQ0lfUExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfVVNCX0VIQ0lfSENEPXkKQ09ORklH
X1VTQl9FSENJX1JPT1RfSFVCX1RUPXkKQ09ORklHX1VTQl9FSENJX1RUX05FV1NDSEVEPXkKQ09O
RklHX1VTQl9FSENJX1BDST15CiMgQ09ORklHX1VTQl9FSENJX0ZTTCBpcyBub3Qgc2V0CiMgQ09O
RklHX1VTQl9FSENJX0hDRF9QTEFURk9STSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9PWFUyMTBI
UF9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfSVNQMTE2WF9IQ0QgaXMgbm90IHNldAojIENP
TkZJR19VU0JfRk9URzIxMF9IQ0QgaXMgbm90IHNldAojIENPTkZJR19VU0JfTUFYMzQyMV9IQ0Qg
aXMgbm90IHNldApDT05GSUdfVVNCX09IQ0lfSENEPXkKQ09ORklHX1VTQl9PSENJX0hDRF9QQ0k9
eQojIENPTkZJR19VU0JfT0hDSV9IQ0RfUExBVEZPUk0gaXMgbm90IHNldApDT05GSUdfVVNCX1VI
Q0lfSENEPXkKIyBDT05GSUdfVVNCX1UxMzJfSENEIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX1NM
ODExX0hDRCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9SOEE2NjU5N19IQ0QgaXMgbm90IHNldAoj
IENPTkZJR19VU0JfSENEX0JDTUEgaXMgbm90IHNldAojIENPTkZJR19VU0JfSENEX1RFU1RfTU9E
RSBpcyBub3Qgc2V0CgojCiMgVVNCIERldmljZSBDbGFzcyBkcml2ZXJzCiMKQ09ORklHX1VTQl9B
Q009bQpDT05GSUdfVVNCX1BSSU5URVI9bQpDT05GSUdfVVNCX1dETT1tCkNPTkZJR19VU0JfVE1D
PW0KCiMKIyBOT1RFOiBVU0JfU1RPUkFHRSBkZXBlbmRzIG9uIFNDU0kgYnV0IEJMS19ERVZfU0Qg
bWF5CiMKCiMKIyBhbHNvIGJlIG5lZWRlZDsgc2VlIFVTQl9TVE9SQUdFIEhlbHAgZm9yIG1vcmUg
aW5mbwojCkNPTkZJR19VU0JfU1RPUkFHRT1tCiMgQ09ORklHX1VTQl9TVE9SQUdFX0RFQlVHIGlz
IG5vdCBzZXQKQ09ORklHX1VTQl9TVE9SQUdFX1JFQUxURUs9bQpDT05GSUdfUkVBTFRFS19BVVRP
UE09eQpDT05GSUdfVVNCX1NUT1JBR0VfREFUQUZBQj1tCkNPTkZJR19VU0JfU1RPUkFHRV9GUkVF
Q09NPW0KQ09ORklHX1VTQl9TVE9SQUdFX0lTRDIwMD1tCkNPTkZJR19VU0JfU1RPUkFHRV9VU0JB
VD1tCkNPTkZJR19VU0JfU1RPUkFHRV9TRERSMDk9bQpDT05GSUdfVVNCX1NUT1JBR0VfU0REUjU1
PW0KQ09ORklHX1VTQl9TVE9SQUdFX0pVTVBTSE9UPW0KQ09ORklHX1VTQl9TVE9SQUdFX0FMQVVE
QT1tCkNPTkZJR19VU0JfU1RPUkFHRV9PTkVUT1VDSD1tCkNPTkZJR19VU0JfU1RPUkFHRV9LQVJN
QT1tCkNPTkZJR19VU0JfU1RPUkFHRV9DWVBSRVNTX0FUQUNCPW0KQ09ORklHX1VTQl9TVE9SQUdF
X0VORV9VQjYyNTA9bQpDT05GSUdfVVNCX1VBUz1tCgojCiMgVVNCIEltYWdpbmcgZGV2aWNlcwoj
CkNPTkZJR19VU0JfTURDODAwPW0KQ09ORklHX1VTQl9NSUNST1RFSz1tCiMgQ09ORklHX1VTQklQ
X0NPUkUgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ0ROU19TVVBQT1JUIGlzIG5vdCBzZXQKIyBD
T05GSUdfVVNCX01VU0JfSERSQyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9EV0MzIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVVNCX0RXQzIgaXMgbm90IHNldAojIENPTkZJR19VU0JfQ0hJUElERUEgaXMg
bm90IHNldAojIENPTkZJR19VU0JfSVNQMTc2MCBpcyBub3Qgc2V0CgojCiMgVVNCIHBvcnQgZHJp
dmVycwojCkNPTkZJR19VU0JfVVNTNzIwPW0KQ09ORklHX1VTQl9TRVJJQUw9eQpDT05GSUdfVVNC
X1NFUklBTF9DT05TT0xFPXkKQ09ORklHX1VTQl9TRVJJQUxfR0VORVJJQz15CiMgQ09ORklHX1VT
Ql9TRVJJQUxfU0lNUExFIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9TRVJJQUxfQUlSQ0FCTEU9bQpD
T05GSUdfVVNCX1NFUklBTF9BUkszMTE2PW0KQ09ORklHX1VTQl9TRVJJQUxfQkVMS0lOPW0KQ09O
RklHX1VTQl9TRVJJQUxfQ0gzNDE9bQpDT05GSUdfVVNCX1NFUklBTF9XSElURUhFQVQ9bQpDT05G
SUdfVVNCX1NFUklBTF9ESUdJX0FDQ0VMRVBPUlQ9bQpDT05GSUdfVVNCX1NFUklBTF9DUDIxMFg9
bQpDT05GSUdfVVNCX1NFUklBTF9DWVBSRVNTX004PW0KQ09ORklHX1VTQl9TRVJJQUxfRU1QRUc9
bQpDT05GSUdfVVNCX1NFUklBTF9GVERJX1NJTz1tCkNPTkZJR19VU0JfU0VSSUFMX1ZJU09SPW0K
Q09ORklHX1VTQl9TRVJJQUxfSVBBUT1tCkNPTkZJR19VU0JfU0VSSUFMX0lSPW0KQ09ORklHX1VT
Ql9TRVJJQUxfRURHRVBPUlQ9bQpDT05GSUdfVVNCX1NFUklBTF9FREdFUE9SVF9UST1tCiMgQ09O
RklHX1VTQl9TRVJJQUxfRjgxMjMyIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9TRVJJQUxfRjgxNTNY
PW0KQ09ORklHX1VTQl9TRVJJQUxfR0FSTUlOPW0KQ09ORklHX1VTQl9TRVJJQUxfSVBXPW0KQ09O
RklHX1VTQl9TRVJJQUxfSVVVPW0KQ09ORklHX1VTQl9TRVJJQUxfS0VZU1BBTl9QREE9bQpDT05G
SUdfVVNCX1NFUklBTF9LRVlTUEFOPW0KQ09ORklHX1VTQl9TRVJJQUxfS0xTST1tCkNPTkZJR19V
U0JfU0VSSUFMX0tPQklMX1NDVD1tCkNPTkZJR19VU0JfU0VSSUFMX01DVF9VMjMyPW0KIyBDT05G
SUdfVVNCX1NFUklBTF9NRVRSTyBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFMX01PUzc3MjA9
bQpDT05GSUdfVVNCX1NFUklBTF9NT1M3NzE1X1BBUlBPUlQ9eQpDT05GSUdfVVNCX1NFUklBTF9N
T1M3ODQwPW0KQ09ORklHX1VTQl9TRVJJQUxfTVhVUE9SVD1tCkNPTkZJR19VU0JfU0VSSUFMX05B
Vk1BTj1tCkNPTkZJR19VU0JfU0VSSUFMX1BMMjMwMz1tCkNPTkZJR19VU0JfU0VSSUFMX09USTY4
NTg9bQpDT05GSUdfVVNCX1NFUklBTF9RQ0FVWD1tCkNPTkZJR19VU0JfU0VSSUFMX1FVQUxDT01N
PW0KQ09ORklHX1VTQl9TRVJJQUxfU1BDUDhYNT1tCkNPTkZJR19VU0JfU0VSSUFMX1NBRkU9bQpD
T05GSUdfVVNCX1NFUklBTF9TQUZFX1BBRERFRD15CkNPTkZJR19VU0JfU0VSSUFMX1NJRVJSQVdJ
UkVMRVNTPW0KQ09ORklHX1VTQl9TRVJJQUxfU1lNQk9MPW0KQ09ORklHX1VTQl9TRVJJQUxfVEk9
bQpDT05GSUdfVVNCX1NFUklBTF9DWUJFUkpBQ0s9bQpDT05GSUdfVVNCX1NFUklBTF9XV0FOPW0K
Q09ORklHX1VTQl9TRVJJQUxfT1BUSU9OPW0KQ09ORklHX1VTQl9TRVJJQUxfT01OSU5FVD1tCkNP
TkZJR19VU0JfU0VSSUFMX09QVElDT049bQpDT05GSUdfVVNCX1NFUklBTF9YU0VOU19NVD1tCiMg
Q09ORklHX1VTQl9TRVJJQUxfV0lTSEJPTkUgaXMgbm90IHNldApDT05GSUdfVVNCX1NFUklBTF9T
U1UxMDA9bQpDT05GSUdfVVNCX1NFUklBTF9RVDI9bQpDT05GSUdfVVNCX1NFUklBTF9VUEQ3OEYw
NzMwPW0KIyBDT05GSUdfVVNCX1NFUklBTF9YUiBpcyBub3Qgc2V0CkNPTkZJR19VU0JfU0VSSUFM
X0RFQlVHPW0KCiMKIyBVU0IgTWlzY2VsbGFuZW91cyBkcml2ZXJzCiMKQ09ORklHX1VTQl9FTUk2
Mj1tCkNPTkZJR19VU0JfRU1JMjY9bQpDT05GSUdfVVNCX0FEVVRVWD1tCkNPTkZJR19VU0JfU0VW
U0VHPW0KQ09ORklHX1VTQl9MRUdPVE9XRVI9bQpDT05GSUdfVVNCX0xDRD1tCiMgQ09ORklHX1VT
Ql9DWVBSRVNTX0NZN0M2MyBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9DWVRIRVJNIGlzIG5vdCBz
ZXQKQ09ORklHX1VTQl9JRE1PVVNFPW0KQ09ORklHX1VTQl9GVERJX0VMQU49bQpDT05GSUdfVVNC
X0FQUExFRElTUExBWT1tCiMgQ09ORklHX0FQUExFX01GSV9GQVNUQ0hBUkdFIGlzIG5vdCBzZXQK
Q09ORklHX1VTQl9TSVNVU0JWR0E9bQpDT05GSUdfVVNCX0xEPW0KIyBDT05GSUdfVVNCX1RSQU5D
RVZJQlJBVE9SIGlzIG5vdCBzZXQKQ09ORklHX1VTQl9JT1dBUlJJT1I9bQojIENPTkZJR19VU0Jf
VEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQl9FSFNFVF9URVNUX0ZJWFRVUkUgaXMgbm90IHNl
dApDT05GSUdfVVNCX0lTSUdIVEZXPW0KIyBDT05GSUdfVVNCX1lVUkVYIGlzIG5vdCBzZXQKQ09O
RklHX1VTQl9FWlVTQl9GWDI9bQojIENPTkZJR19VU0JfSFVCX1VTQjI1MVhCIGlzIG5vdCBzZXQK
Q09ORklHX1VTQl9IU0lDX1VTQjM1MDM9bQojIENPTkZJR19VU0JfSFNJQ19VU0I0NjA0IGlzIG5v
dCBzZXQKIyBDT05GSUdfVVNCX0xJTktfTEFZRVJfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1VT
Ql9DSEFPU0tFWSBpcyBub3Qgc2V0CkNPTkZJR19VU0JfQVRNPW0KQ09ORklHX1VTQl9TUEVFRFRP
VUNIPW0KQ09ORklHX1VTQl9DWEFDUlU9bQpDT05GSUdfVVNCX1VFQUdMRUFUTT1tCkNPTkZJR19V
U0JfWFVTQkFUTT1tCgojCiMgVVNCIFBoeXNpY2FsIExheWVyIGRyaXZlcnMKIwojIENPTkZJR19O
T1BfVVNCX1hDRUlWIGlzIG5vdCBzZXQKIyBDT05GSUdfVVNCX0dQSU9fVkJVUyBpcyBub3Qgc2V0
CiMgQ09ORklHX1VTQl9JU1AxMzAxIGlzIG5vdCBzZXQKIyBlbmQgb2YgVVNCIFBoeXNpY2FsIExh
eWVyIGRyaXZlcnMKCiMgQ09ORklHX1VTQl9HQURHRVQgaXMgbm90IHNldApDT05GSUdfVFlQRUM9
eQpDT05GSUdfVFlQRUNfVENQTT15CkNPTkZJR19UWVBFQ19UQ1BDST15CkNPTkZJR19UWVBFQ19S
VDE3MTFIPXkKIyBDT05GSUdfVFlQRUNfVENQQ0lfTUFYSU0gaXMgbm90IHNldApDT05GSUdfVFlQ
RUNfRlVTQjMwMj1tCkNPTkZJR19UWVBFQ19VQ1NJPXkKIyBDT05GSUdfVUNTSV9DQ0cgaXMgbm90
IHNldApDT05GSUdfVUNTSV9BQ1BJPXkKIyBDT05GSUdfVFlQRUNfSEQzU1MzMjIwIGlzIG5vdCBz
ZXQKQ09ORklHX1RZUEVDX1RQUzY1OThYPW0KIyBDT05GSUdfVFlQRUNfU1RVU0IxNjBYIGlzIG5v
dCBzZXQKCiMKIyBVU0IgVHlwZS1DIE11bHRpcGxleGVyL0RlTXVsdGlwbGV4ZXIgU3dpdGNoIHN1
cHBvcnQKIwpDT05GSUdfVFlQRUNfTVVYX1BJM1VTQjMwNTMyPW0KIyBlbmQgb2YgVVNCIFR5cGUt
QyBNdWx0aXBsZXhlci9EZU11bHRpcGxleGVyIFN3aXRjaCBzdXBwb3J0CgojCiMgVVNCIFR5cGUt
QyBBbHRlcm5hdGUgTW9kZSBkcml2ZXJzCiMKQ09ORklHX1RZUEVDX0RQX0FMVE1PREU9eQojIENP
TkZJR19UWVBFQ19OVklESUFfQUxUTU9ERSBpcyBub3Qgc2V0CiMgZW5kIG9mIFVTQiBUeXBlLUMg
QWx0ZXJuYXRlIE1vZGUgZHJpdmVycwoKQ09ORklHX1VTQl9ST0xFX1NXSVRDSD15CkNPTkZJR19V
U0JfUk9MRVNfSU5URUxfWEhDST15CkNPTkZJR19NTUM9bQpDT05GSUdfTU1DX0JMT0NLPW0KQ09O
RklHX01NQ19CTE9DS19NSU5PUlM9OApDT05GSUdfU0RJT19VQVJUPW0KIyBDT05GSUdfTU1DX1RF
U1QgaXMgbm90IHNldAoKIwojIE1NQy9TRC9TRElPIEhvc3QgQ29udHJvbGxlciBEcml2ZXJzCiMK
IyBDT05GSUdfTU1DX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX01NQ19TREhDST1tCkNPTkZJR19N
TUNfU0RIQ0lfSU9fQUNDRVNTT1JTPXkKQ09ORklHX01NQ19TREhDSV9QQ0k9bQpDT05GSUdfTU1D
X1JJQ09IX01NQz15CkNPTkZJR19NTUNfU0RIQ0lfQUNQST1tCkNPTkZJR19NTUNfU0RIQ0lfUExU
Rk09bQojIENPTkZJR19NTUNfU0RIQ0lfRl9TREgzMCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQ19X
QlNEIGlzIG5vdCBzZXQKQ09ORklHX01NQ19USUZNX1NEPW0KIyBDT05GSUdfTU1DX1NQSSBpcyBu
b3Qgc2V0CkNPTkZJR19NTUNfQ0I3MTA9bQpDT05GSUdfTU1DX1ZJQV9TRE1NQz1tCkNPTkZJR19N
TUNfVlVCMzAwPW0KQ09ORklHX01NQ19VU0hDPW0KIyBDT05GSUdfTU1DX1VTREhJNlJPTDAgaXMg
bm90IHNldApDT05GSUdfTU1DX1JFQUxURUtfUENJPW0KQ09ORklHX01NQ19SRUFMVEVLX1VTQj1t
CkNPTkZJR19NTUNfQ1FIQ0k9bQojIENPTkZJR19NTUNfSFNRIGlzIG5vdCBzZXQKIyBDT05GSUdf
TU1DX1RPU0hJQkFfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1DX01USyBpcyBub3Qgc2V0CiMg
Q09ORklHX01NQ19TREhDSV9YRU5PTiBpcyBub3Qgc2V0CkNPTkZJR19NRU1TVElDSz1tCiMgQ09O
RklHX01FTVNUSUNLX0RFQlVHIGlzIG5vdCBzZXQKCiMKIyBNZW1vcnlTdGljayBkcml2ZXJzCiMK
IyBDT05GSUdfTUVNU1RJQ0tfVU5TQUZFX1JFU1VNRSBpcyBub3Qgc2V0CkNPTkZJR19NU1BST19C
TE9DSz1tCiMgQ09ORklHX01TX0JMT0NLIGlzIG5vdCBzZXQKCiMKIyBNZW1vcnlTdGljayBIb3N0
IENvbnRyb2xsZXIgRHJpdmVycwojCkNPTkZJR19NRU1TVElDS19USUZNX01TPW0KQ09ORklHX01F
TVNUSUNLX0pNSUNST05fMzhYPW0KQ09ORklHX01FTVNUSUNLX1I1OTI9bQpDT05GSUdfTUVNU1RJ
Q0tfUkVBTFRFS19QQ0k9bQpDT05GSUdfTUVNU1RJQ0tfUkVBTFRFS19VU0I9bQpDT05GSUdfTkVX
X0xFRFM9eQpDT05GSUdfTEVEU19DTEFTUz15CiMgQ09ORklHX0xFRFNfQ0xBU1NfRkxBU0ggaXMg
bm90IHNldAojIENPTkZJR19MRURTX0NMQVNTX01VTFRJQ09MT1IgaXMgbm90IHNldAojIENPTkZJ
R19MRURTX0JSSUdIVE5FU1NfSFdfQ0hBTkdFRCBpcyBub3Qgc2V0CgojCiMgTEVEIGRyaXZlcnMK
IwojIENPTkZJR19MRURTX0FQVSBpcyBub3Qgc2V0CkNPTkZJR19MRURTX0xNMzUzMD1tCiMgQ09O
RklHX0xFRFNfTE0zNTMyIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM2NDIgaXMgbm90IHNl
dAojIENPTkZJR19MRURTX1BDQTk1MzIgaXMgbm90IHNldAojIENPTkZJR19MRURTX0dQSU8gaXMg
bm90IHNldApDT05GSUdfTEVEU19MUDM5NDQ9bQojIENPTkZJR19MRURTX0xQMzk1MiBpcyBub3Qg
c2V0CiMgQ09ORklHX0xFRFNfTFA1MFhYIGlzIG5vdCBzZXQKQ09ORklHX0xFRFNfQ0xFVk9fTUFJ
TD1tCiMgQ09ORklHX0xFRFNfUENBOTU1WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfUENBOTYz
WCBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfREFDMTI0UzA4NSBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfUFdNIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19CRDI4MDIgaXMgbm90IHNldApDT05G
SUdfTEVEU19JTlRFTF9TUzQyMDA9bQojIENPTkZJR19MRURTX1RDQTY1MDcgaXMgbm90IHNldAoj
IENPTkZJR19MRURTX1RMQzU5MVhYIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19MTTM1NXggaXMg
bm90IHNldAoKIwojIExFRCBkcml2ZXIgZm9yIGJsaW5rKDEpIFVTQiBSR0IgTEVEIGlzIHVuZGVy
IFNwZWNpYWwgSElEIGRyaXZlcnMgKEhJRF9USElOR00pCiMKQ09ORklHX0xFRFNfQkxJTktNPW0K
Q09ORklHX0xFRFNfTUxYQ1BMRD1tCkNPTkZJR19MRURTX01MWFJFRz1tCiMgQ09ORklHX0xFRFNf
VVNFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfTklDNzhCWCBpcyBub3Qgc2V0CiMgQ09ORklH
X0xFRFNfVElfTE1VX0NPTU1PTiBpcyBub3Qgc2V0CgojCiMgRmxhc2ggYW5kIFRvcmNoIExFRCBk
cml2ZXJzCiMKCiMKIyBMRUQgVHJpZ2dlcnMKIwpDT05GSUdfTEVEU19UUklHR0VSUz15CkNPTkZJ
R19MRURTX1RSSUdHRVJfVElNRVI9bQpDT05GSUdfTEVEU19UUklHR0VSX09ORVNIT1Q9bQpDT05G
SUdfTEVEU19UUklHR0VSX0RJU0s9eQojIENPTkZJR19MRURTX1RSSUdHRVJfTVREIGlzIG5vdCBz
ZXQKQ09ORklHX0xFRFNfVFJJR0dFUl9IRUFSVEJFQVQ9bQpDT05GSUdfTEVEU19UUklHR0VSX0JB
Q0tMSUdIVD1tCiMgQ09ORklHX0xFRFNfVFJJR0dFUl9DUFUgaXMgbm90IHNldAojIENPTkZJR19M
RURTX1RSSUdHRVJfQUNUSVZJVFkgaXMgbm90IHNldApDT05GSUdfTEVEU19UUklHR0VSX0dQSU89
bQpDT05GSUdfTEVEU19UUklHR0VSX0RFRkFVTFRfT049bQoKIwojIGlwdGFibGVzIHRyaWdnZXIg
aXMgdW5kZXIgTmV0ZmlsdGVyIGNvbmZpZyAoTEVEIHRhcmdldCkKIwpDT05GSUdfTEVEU19UUklH
R0VSX1RSQU5TSUVOVD1tCkNPTkZJR19MRURTX1RSSUdHRVJfQ0FNRVJBPW0KIyBDT05GSUdfTEVE
U19UUklHR0VSX1BBTklDIGlzIG5vdCBzZXQKIyBDT05GSUdfTEVEU19UUklHR0VSX05FVERFViBp
cyBub3Qgc2V0CiMgQ09ORklHX0xFRFNfVFJJR0dFUl9QQVRURVJOIGlzIG5vdCBzZXQKQ09ORklH
X0xFRFNfVFJJR0dFUl9BVURJTz1tCiMgQ09ORklHX0xFRFNfVFJJR0dFUl9UVFkgaXMgbm90IHNl
dAoKIwojIExFRCBCbGluawojCiMgQ09ORklHX0xFRFNfQkxJTksgaXMgbm90IHNldAojIENPTkZJ
R19BQ0NFU1NJQklMSVRZIGlzIG5vdCBzZXQKQ09ORklHX0lORklOSUJBTkQ9bQpDT05GSUdfSU5G
SU5JQkFORF9VU0VSX01BRD1tCkNPTkZJR19JTkZJTklCQU5EX1VTRVJfQUNDRVNTPW0KQ09ORklH
X0lORklOSUJBTkRfVVNFUl9NRU09eQpDT05GSUdfSU5GSU5JQkFORF9PTl9ERU1BTkRfUEFHSU5H
PXkKQ09ORklHX0lORklOSUJBTkRfQUREUl9UUkFOUz15CkNPTkZJR19JTkZJTklCQU5EX0FERFJf
VFJBTlNfQ09ORklHRlM9eQpDT05GSUdfSU5GSU5JQkFORF9WSVJUX0RNQT15CiMgQ09ORklHX0lO
RklOSUJBTkRfTVRIQ0EgaXMgbm90IHNldAojIENPTkZJR19JTkZJTklCQU5EX1FJQiBpcyBub3Qg
c2V0CkNPTkZJR19JTkZJTklCQU5EX0NYR0I0PW0KIyBDT05GSUdfSU5GSU5JQkFORF9FRkEgaXMg
bm90IHNldApDT05GSUdfSU5GSU5JQkFORF9JNDBJVz1tCkNPTkZJR19NTFg0X0lORklOSUJBTkQ9
bQpDT05GSUdfTUxYNV9JTkZJTklCQU5EPW0KIyBDT05GSUdfSU5GSU5JQkFORF9PQ1JETUEgaXMg
bm90IHNldApDT05GSUdfSU5GSU5JQkFORF9WTVdBUkVfUFZSRE1BPW0KQ09ORklHX0lORklOSUJB
TkRfVVNOSUM9bQpDT05GSUdfSU5GSU5JQkFORF9CTlhUX1JFPW0KQ09ORklHX0lORklOSUJBTkRf
SEZJMT1tCiMgQ09ORklHX0hGSTFfREVCVUdfU0RNQV9PUkRFUiBpcyBub3Qgc2V0CiMgQ09ORklH
X1NETUFfVkVSQk9TSVRZIGlzIG5vdCBzZXQKQ09ORklHX0lORklOSUJBTkRfUUVEUj1tCkNPTkZJ
R19JTkZJTklCQU5EX1JETUFWVD1tCkNPTkZJR19SRE1BX1JYRT1tCkNPTkZJR19SRE1BX1NJVz1t
CkNPTkZJR19JTkZJTklCQU5EX0lQT0lCPW0KQ09ORklHX0lORklOSUJBTkRfSVBPSUJfQ009eQpD
T05GSUdfSU5GSU5JQkFORF9JUE9JQl9ERUJVRz15CiMgQ09ORklHX0lORklOSUJBTkRfSVBPSUJf
REVCVUdfREFUQSBpcyBub3Qgc2V0CkNPTkZJR19JTkZJTklCQU5EX1NSUD1tCkNPTkZJR19JTkZJ
TklCQU5EX1NSUFQ9bQpDT05GSUdfSU5GSU5JQkFORF9JU0VSPW0KQ09ORklHX0lORklOSUJBTkRf
SVNFUlQ9bQojIENPTkZJR19JTkZJTklCQU5EX1JUUlNfQ0xJRU5UIGlzIG5vdCBzZXQKIyBDT05G
SUdfSU5GSU5JQkFORF9SVFJTX1NFUlZFUiBpcyBub3Qgc2V0CkNPTkZJR19JTkZJTklCQU5EX09Q
QV9WTklDPW0KQ09ORklHX0VEQUNfQVRPTUlDX1NDUlVCPXkKQ09ORklHX0VEQUNfU1VQUE9SVD15
CkNPTkZJR19FREFDPXkKQ09ORklHX0VEQUNfTEVHQUNZX1NZU0ZTPXkKIyBDT05GSUdfRURBQ19E
RUJVRyBpcyBub3Qgc2V0CkNPTkZJR19FREFDX0RFQ09ERV9NQ0U9bQpDT05GSUdfRURBQ19HSEVT
PXkKQ09ORklHX0VEQUNfQU1ENjQ9bQpDT05GSUdfRURBQ19FNzUyWD1tCkNPTkZJR19FREFDX0k4
Mjk3NVg9bQpDT05GSUdfRURBQ19JMzAwMD1tCkNPTkZJR19FREFDX0kzMjAwPW0KQ09ORklHX0VE
QUNfSUUzMTIwMD1tCkNPTkZJR19FREFDX1gzOD1tCkNPTkZJR19FREFDX0k1NDAwPW0KQ09ORklH
X0VEQUNfSTdDT1JFPW0KQ09ORklHX0VEQUNfSTUwMDA9bQpDT05GSUdfRURBQ19JNTEwMD1tCkNP
TkZJR19FREFDX0k3MzAwPW0KQ09ORklHX0VEQUNfU0JSSURHRT1tCkNPTkZJR19FREFDX1NLWD1t
CkNPTkZJR19FREFDX0kxME5NPW0KQ09ORklHX0VEQUNfUE5EMj1tCiMgQ09ORklHX0VEQUNfSUdF
TjYgaXMgbm90IHNldApDT05GSUdfUlRDX0xJQj15CkNPTkZJR19SVENfTUMxNDY4MThfTElCPXkK
Q09ORklHX1JUQ19DTEFTUz15CkNPTkZJR19SVENfSENUT1NZUz15CkNPTkZJR19SVENfSENUT1NZ
U19ERVZJQ0U9InJ0YzAiCiMgQ09ORklHX1JUQ19TWVNUT0hDIGlzIG5vdCBzZXQKIyBDT05GSUdf
UlRDX0RFQlVHIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19OVk1FTT15CgojCiMgUlRDIGludGVyZmFj
ZXMKIwpDT05GSUdfUlRDX0lOVEZfU1lTRlM9eQpDT05GSUdfUlRDX0lOVEZfUFJPQz15CkNPTkZJ
R19SVENfSU5URl9ERVY9eQojIENPTkZJR19SVENfSU5URl9ERVZfVUlFX0VNVUwgaXMgbm90IHNl
dAojIENPTkZJR19SVENfRFJWX1RFU1QgaXMgbm90IHNldAoKIwojIEkyQyBSVEMgZHJpdmVycwoj
CiMgQ09ORklHX1JUQ19EUlZfQUJCNVpFUzMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0FC
RU9aOSBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfQUJYODBYIGlzIG5vdCBzZXQKQ09ORklH
X1JUQ19EUlZfRFMxMzA3PW0KIyBDT05GSUdfUlRDX0RSVl9EUzEzMDdfQ0VOVFVSWSBpcyBub3Qg
c2V0CkNPTkZJR19SVENfRFJWX0RTMTM3ND1tCiMgQ09ORklHX1JUQ19EUlZfRFMxMzc0X1dEVCBp
cyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0RTMTY3Mj1tCkNPTkZJR19SVENfRFJWX01BWDY5MDA9
bQpDT05GSUdfUlRDX0RSVl9SUzVDMzcyPW0KQ09ORklHX1JUQ19EUlZfSVNMMTIwOD1tCkNPTkZJ
R19SVENfRFJWX0lTTDEyMDIyPW0KQ09ORklHX1JUQ19EUlZfWDEyMDU9bQpDT05GSUdfUlRDX0RS
Vl9QQ0Y4NTIzPW0KIyBDT05GSUdfUlRDX0RSVl9QQ0Y4NTA2MyBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfUENGODUzNjMgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9QQ0Y4NTYzPW0KQ09O
RklHX1JUQ19EUlZfUENGODU4Mz1tCkNPTkZJR19SVENfRFJWX000MVQ4MD1tCkNPTkZJR19SVENf
RFJWX000MVQ4MF9XRFQ9eQpDT05GSUdfUlRDX0RSVl9CUTMySz1tCiMgQ09ORklHX1JUQ19EUlZf
UzM1MzkwQSBpcyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0ZNMzEzMD1tCiMgQ09ORklHX1JUQ19E
UlZfUlg4MDEwIGlzIG5vdCBzZXQKQ09ORklHX1JUQ19EUlZfUlg4NTgxPW0KQ09ORklHX1JUQ19E
UlZfUlg4MDI1PW0KQ09ORklHX1JUQ19EUlZfRU0zMDI3PW0KIyBDT05GSUdfUlRDX0RSVl9SVjMw
MjggaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX1JWMzAzMiBpcyBub3Qgc2V0CiMgQ09ORklH
X1JUQ19EUlZfUlY4ODAzIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9TRDMwNzggaXMgbm90
IHNldAoKIwojIFNQSSBSVEMgZHJpdmVycwojCiMgQ09ORklHX1JUQ19EUlZfTTQxVDkzIGlzIG5v
dCBzZXQKIyBDT05GSUdfUlRDX0RSVl9NNDFUOTQgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJW
X0RTMTMwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxMzA1IGlzIG5vdCBzZXQKIyBD
T05GSUdfUlRDX0RSVl9EUzEzNDMgaXMgbm90IHNldAojIENPTkZJR19SVENfRFJWX0RTMTM0NyBp
cyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfRFMxMzkwIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRD
X0RSVl9NQVg2OTE2IGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9SOTcwMSBpcyBub3Qgc2V0
CkNPTkZJR19SVENfRFJWX1JYNDU4MT1tCiMgQ09ORklHX1JUQ19EUlZfUlM1QzM0OCBpcyBub3Qg
c2V0CiMgQ09ORklHX1JUQ19EUlZfTUFYNjkwMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZf
UENGMjEyMyBpcyBub3Qgc2V0CiMgQ09ORklHX1JUQ19EUlZfTUNQNzk1IGlzIG5vdCBzZXQKQ09O
RklHX1JUQ19JMkNfQU5EX1NQST15CgojCiMgU1BJIGFuZCBJMkMgUlRDIGRyaXZlcnMKIwpDT05G
SUdfUlRDX0RSVl9EUzMyMzI9bQpDT05GSUdfUlRDX0RSVl9EUzMyMzJfSFdNT049eQojIENPTkZJ
R19SVENfRFJWX1BDRjIxMjcgaXMgbm90IHNldApDT05GSUdfUlRDX0RSVl9SVjMwMjlDMj1tCiMg
Q09ORklHX1JUQ19EUlZfUlYzMDI5X0hXTU9OIGlzIG5vdCBzZXQKIyBDT05GSUdfUlRDX0RSVl9S
WDYxMTAgaXMgbm90IHNldAoKIwojIFBsYXRmb3JtIFJUQyBkcml2ZXJzCiMKQ09ORklHX1JUQ19E
UlZfQ01PUz15CkNPTkZJR19SVENfRFJWX0RTMTI4Nj1tCkNPTkZJR19SVENfRFJWX0RTMTUxMT1t
CkNPTkZJR19SVENfRFJWX0RTMTU1Mz1tCiMgQ09ORklHX1JUQ19EUlZfRFMxNjg1X0ZBTUlMWSBp
cyBub3Qgc2V0CkNPTkZJR19SVENfRFJWX0RTMTc0Mj1tCkNPTkZJR19SVENfRFJWX0RTMjQwND1t
CkNPTkZJR19SVENfRFJWX1NUSzE3VEE4PW0KIyBDT05GSUdfUlRDX0RSVl9NNDhUODYgaXMgbm90
IHNldApDT05GSUdfUlRDX0RSVl9NNDhUMzU9bQpDT05GSUdfUlRDX0RSVl9NNDhUNTk9bQpDT05G
SUdfUlRDX0RSVl9NU002MjQyPW0KQ09ORklHX1JUQ19EUlZfQlE0ODAyPW0KQ09ORklHX1JUQ19E
UlZfUlA1QzAxPW0KQ09ORklHX1JUQ19EUlZfVjMwMjA9bQoKIwojIG9uLUNQVSBSVEMgZHJpdmVy
cwojCiMgQ09ORklHX1JUQ19EUlZfRlRSVEMwMTAgaXMgbm90IHNldAoKIwojIEhJRCBTZW5zb3Ig
UlRDIGRyaXZlcnMKIwojIENPTkZJR19SVENfRFJWX0hJRF9TRU5TT1JfVElNRSBpcyBub3Qgc2V0
CkNPTkZJR19ETUFERVZJQ0VTPXkKIyBDT05GSUdfRE1BREVWSUNFU19ERUJVRyBpcyBub3Qgc2V0
CgojCiMgRE1BIERldmljZXMKIwpDT05GSUdfRE1BX0VOR0lORT15CkNPTkZJR19ETUFfVklSVFVB
TF9DSEFOTkVMUz15CkNPTkZJR19ETUFfQUNQST15CiMgQ09ORklHX0FMVEVSQV9NU0dETUEgaXMg
bm90IHNldApDT05GSUdfSU5URUxfSURNQTY0PW0KIyBDT05GSUdfSU5URUxfSURYRCBpcyBub3Qg
c2V0CkNPTkZJR19JTlRFTF9JT0FURE1BPW0KIyBDT05GSUdfUExYX0RNQSBpcyBub3Qgc2V0CiMg
Q09ORklHX1hJTElOWF9aWU5RTVBfRFBETUEgaXMgbm90IHNldAojIENPTkZJR19RQ09NX0hJRE1B
X01HTVQgaXMgbm90IHNldAojIENPTkZJR19RQ09NX0hJRE1BIGlzIG5vdCBzZXQKQ09ORklHX0RX
X0RNQUNfQ09SRT15CkNPTkZJR19EV19ETUFDPW0KQ09ORklHX0RXX0RNQUNfUENJPXkKIyBDT05G
SUdfRFdfRURNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0RXX0VETUFfUENJRSBpcyBub3Qgc2V0CkNP
TkZJR19IU1VfRE1BPXkKIyBDT05GSUdfU0ZfUERNQSBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVM
X0xETUEgaXMgbm90IHNldAoKIwojIERNQSBDbGllbnRzCiMKQ09ORklHX0FTWU5DX1RYX0RNQT15
CkNPTkZJR19ETUFURVNUPW0KQ09ORklHX0RNQV9FTkdJTkVfUkFJRD15CgojCiMgRE1BQlVGIG9w
dGlvbnMKIwpDT05GSUdfU1lOQ19GSUxFPXkKIyBDT05GSUdfU1dfU1lOQyBpcyBub3Qgc2V0CiMg
Q09ORklHX1VETUFCVUYgaXMgbm90IHNldAojIENPTkZJR19ETUFCVUZfTU9WRV9OT1RJRlkgaXMg
bm90IHNldAojIENPTkZJR19ETUFCVUZfREVCVUcgaXMgbm90IHNldAojIENPTkZJR19ETUFCVUZf
U0VMRlRFU1RTIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BQlVGX0hFQVBTIGlzIG5vdCBzZXQKIyBl
bmQgb2YgRE1BQlVGIG9wdGlvbnMKCkNPTkZJR19EQ0E9bQojIENPTkZJR19BVVhESVNQTEFZIGlz
IG5vdCBzZXQKIyBDT05GSUdfUEFORUwgaXMgbm90IHNldApDT05GSUdfVUlPPW0KQ09ORklHX1VJ
T19DSUY9bQpDT05GSUdfVUlPX1BEUlZfR0VOSVJRPW0KIyBDT05GSUdfVUlPX0RNRU1fR0VOSVJR
IGlzIG5vdCBzZXQKQ09ORklHX1VJT19BRUM9bQpDT05GSUdfVUlPX1NFUkNPUzM9bQpDT05GSUdf
VUlPX1BDSV9HRU5FUklDPW0KIyBDT05GSUdfVUlPX05FVFggaXMgbm90IHNldAojIENPTkZJR19V
SU9fUFJVU1MgaXMgbm90IHNldAojIENPTkZJR19VSU9fTUY2MjQgaXMgbm90IHNldApDT05GSUdf
VUlPX0hWX0dFTkVSSUM9bQpDT05GSUdfVkZJT19JT01NVV9UWVBFMT1tCkNPTkZJR19WRklPX1ZJ
UlFGRD1tCkNPTkZJR19WRklPPW0KQ09ORklHX1ZGSU9fTk9JT01NVT15CkNPTkZJR19WRklPX1BD
ST1tCiMgQ09ORklHX1ZGSU9fUENJX1ZHQSBpcyBub3Qgc2V0CkNPTkZJR19WRklPX1BDSV9NTUFQ
PXkKQ09ORklHX1ZGSU9fUENJX0lOVFg9eQojIENPTkZJR19WRklPX1BDSV9JR0QgaXMgbm90IHNl
dApDT05GSUdfVkZJT19NREVWPW0KQ09ORklHX1ZGSU9fTURFVl9ERVZJQ0U9bQpDT05GSUdfSVJR
X0JZUEFTU19NQU5BR0VSPW0KIyBDT05GSUdfVklSVF9EUklWRVJTIGlzIG5vdCBzZXQKQ09ORklH
X1ZJUlRJTz15CkNPTkZJR19WSVJUSU9fUENJX0xJQj15CkNPTkZJR19WSVJUSU9fTUVOVT15CkNP
TkZJR19WSVJUSU9fUENJPXkKQ09ORklHX1ZJUlRJT19QQ0lfTEVHQUNZPXkKQ09ORklHX1ZJUlRJ
T19WRFBBPW0KIyBDT05GSUdfVklSVElPX1BNRU0gaXMgbm90IHNldApDT05GSUdfVklSVElPX0JB
TExPT049bQpDT05GSUdfVklSVElPX01FTT1tCkNPTkZJR19WSVJUSU9fSU5QVVQ9bQojIENPTkZJ
R19WSVJUSU9fTU1JTyBpcyBub3Qgc2V0CkNPTkZJR19WSVJUSU9fRE1BX1NIQVJFRF9CVUZGRVI9
bQpDT05GSUdfVkRQQT1tCkNPTkZJR19WRFBBX1NJTT1tCiMgQ09ORklHX1ZEUEFfU0lNX05FVCBp
cyBub3Qgc2V0CkNPTkZJR19JRkNWRj1tCiMgQ09ORklHX01MWDVfVkRQQV9ORVQgaXMgbm90IHNl
dApDT05GSUdfVkhPU1RfSU9UTEI9bQpDT05GSUdfVkhPU1RfUklORz1tCkNPTkZJR19WSE9TVD1t
CkNPTkZJR19WSE9TVF9NRU5VPXkKQ09ORklHX1ZIT1NUX05FVD1tCiMgQ09ORklHX1ZIT1NUX1ND
U0kgaXMgbm90IHNldApDT05GSUdfVkhPU1RfVlNPQ0s9bQpDT05GSUdfVkhPU1RfVkRQQT1tCiMg
Q09ORklHX1ZIT1NUX0NST1NTX0VORElBTl9MRUdBQ1kgaXMgbm90IHNldAoKIwojIE1pY3Jvc29m
dCBIeXBlci1WIGd1ZXN0IHN1cHBvcnQKIwpDT05GSUdfSFlQRVJWPW0KQ09ORklHX0hZUEVSVl9U
SU1FUj15CkNPTkZJR19IWVBFUlZfVVRJTFM9bQpDT05GSUdfSFlQRVJWX0JBTExPT049bQojIGVu
ZCBvZiBNaWNyb3NvZnQgSHlwZXItViBndWVzdCBzdXBwb3J0CgojCiMgWGVuIGRyaXZlciBzdXBw
b3J0CiMKIyBDT05GSUdfWEVOX0JBTExPT04gaXMgbm90IHNldApDT05GSUdfWEVOX0RFVl9FVlRD
SE49bQojIENPTkZJR19YRU5fQkFDS0VORCBpcyBub3Qgc2V0CkNPTkZJR19YRU5GUz1tCkNPTkZJ
R19YRU5fQ09NUEFUX1hFTkZTPXkKQ09ORklHX1hFTl9TWVNfSFlQRVJWSVNPUj15CkNPTkZJR19Y
RU5fWEVOQlVTX0ZST05URU5EPXkKIyBDT05GSUdfWEVOX0dOVERFViBpcyBub3Qgc2V0CiMgQ09O
RklHX1hFTl9HUkFOVF9ERVZfQUxMT0MgaXMgbm90IHNldAojIENPTkZJR19YRU5fR1JBTlRfRE1B
X0FMTE9DIGlzIG5vdCBzZXQKQ09ORklHX1NXSU9UTEJfWEVOPXkKIyBDT05GSUdfWEVOX1BWQ0FM
TFNfRlJPTlRFTkQgaXMgbm90IHNldApDT05GSUdfWEVOX1BSSVZDTUQ9bQpDT05GSUdfWEVOX0VG
ST15CkNPTkZJR19YRU5fQVVUT19YTEFURT15CkNPTkZJR19YRU5fQUNQST15CkNPTkZJR19YRU5f
RlJPTlRfUEdESVJfU0hCVUY9bQojIENPTkZJR19YRU5fVU5QT1BVTEFURURfQUxMT0MgaXMgbm90
IHNldAojIGVuZCBvZiBYZW4gZHJpdmVyIHN1cHBvcnQKCiMgQ09ORklHX0dSRVlCVVMgaXMgbm90
IHNldAojIENPTkZJR19TVEFHSU5HIGlzIG5vdCBzZXQKQ09ORklHX1g4Nl9QTEFURk9STV9ERVZJ
Q0VTPXkKQ09ORklHX0FDUElfV01JPW0KQ09ORklHX1dNSV9CTU9GPW0KIyBDT05GSUdfSFVBV0VJ
X1dNSSBpcyBub3Qgc2V0CiMgQ09ORklHX1VWX1NZU0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5U
RUxfV01JX1NCTF9GV19VUERBVEUgaXMgbm90IHNldApDT05GSUdfSU5URUxfV01JX1RIVU5ERVJC
T0xUPW0KQ09ORklHX01YTV9XTUk9bQojIENPTkZJR19QRUFRX1dNSSBpcyBub3Qgc2V0CiMgQ09O
RklHX1hJQU9NSV9XTUkgaXMgbm90IHNldApDT05GSUdfQUNFUkhERj1tCiMgQ09ORklHX0FDRVJf
V0lSRUxFU1MgaXMgbm90IHNldApDT05GSUdfQUNFUl9XTUk9bQojIENPTkZJR19BTURfUE1DIGlz
IG5vdCBzZXQKQ09ORklHX0FQUExFX0dNVVg9bQpDT05GSUdfQVNVU19MQVBUT1A9bQojIENPTkZJ
R19BU1VTX1dJUkVMRVNTIGlzIG5vdCBzZXQKQ09ORklHX0FTVVNfV01JPW0KQ09ORklHX0FTVVNf
TkJfV01JPW0KQ09ORklHX0VFRVBDX0xBUFRPUD1tCkNPTkZJR19FRUVQQ19XTUk9bQojIENPTkZJ
R19YODZfUExBVEZPUk1fRFJJVkVSU19ERUxMIGlzIG5vdCBzZXQKQ09ORklHX0FNSUxPX1JGS0lM
TD1tCkNPTkZJR19GVUpJVFNVX0xBUFRPUD1tCkNPTkZJR19GVUpJVFNVX1RBQkxFVD1tCiMgQ09O
RklHX0dQRF9QT0NLRVRfRkFOIGlzIG5vdCBzZXQKQ09ORklHX0hQX0FDQ0VMPW0KQ09ORklHX0hQ
X1dJUkVMRVNTPW0KQ09ORklHX0hQX1dNST1tCiMgQ09ORklHX0lCTV9SVEwgaXMgbm90IHNldApD
T05GSUdfSURFQVBBRF9MQVBUT1A9bQpDT05GSUdfU0VOU09SU19IREFQUz1tCkNPTkZJR19USElO
S1BBRF9BQ1BJPW0KQ09ORklHX1RISU5LUEFEX0FDUElfQUxTQV9TVVBQT1JUPXkKIyBDT05GSUdf
VEhJTktQQURfQUNQSV9ERUJVR0ZBQ0lMSVRJRVMgaXMgbm90IHNldAojIENPTkZJR19USElOS1BB
RF9BQ1BJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfVEhJTktQQURfQUNQSV9VTlNBRkVfTEVE
UyBpcyBub3Qgc2V0CkNPTkZJR19USElOS1BBRF9BQ1BJX1ZJREVPPXkKQ09ORklHX1RISU5LUEFE
X0FDUElfSE9US0VZX1BPTEw9eQojIENPTkZJR19JTlRFTF9BVE9NSVNQMl9QTSBpcyBub3Qgc2V0
CkNPTkZJR19JTlRFTF9ISURfRVZFTlQ9bQojIENPTkZJR19JTlRFTF9JTlQwMDAyX1ZHUElPIGlz
IG5vdCBzZXQKIyBDT05GSUdfSU5URUxfTUVOTE9XIGlzIG5vdCBzZXQKQ09ORklHX0lOVEVMX09B
S1RSQUlMPW0KQ09ORklHX0lOVEVMX1ZCVE49bQpDT05GSUdfTVNJX0xBUFRPUD1tCkNPTkZJR19N
U0lfV01JPW0KIyBDT05GSUdfUENFTkdJTkVTX0FQVTIgaXMgbm90IHNldApDT05GSUdfU0FNU1VO
R19MQVBUT1A9bQpDT05GSUdfU0FNU1VOR19RMTA9bQojIENPTkZJR19BQ1BJX1RPU0hJQkEgaXMg
bm90IHNldApDT05GSUdfVE9TSElCQV9CVF9SRktJTEw9bQojIENPTkZJR19UT1NISUJBX0hBUFMg
aXMgbm90IHNldAojIENPTkZJR19UT1NISUJBX1dNSSBpcyBub3Qgc2V0CkNPTkZJR19BQ1BJX0NN
UEM9bQpDT05GSUdfQ09NUEFMX0xBUFRPUD1tCiMgQ09ORklHX0xHX0xBUFRPUCBpcyBub3Qgc2V0
CkNPTkZJR19QQU5BU09OSUNfTEFQVE9QPW0KQ09ORklHX1NPTllfTEFQVE9QPW0KQ09ORklHX1NP
TllQSV9DT01QQVQ9eQojIENPTkZJR19TWVNURU03Nl9BQ1BJIGlzIG5vdCBzZXQKQ09ORklHX1RP
UFNUQVJfTEFQVE9QPW0KIyBDT05GSUdfSTJDX01VTFRJX0lOU1RBTlRJQVRFIGlzIG5vdCBzZXQK
Q09ORklHX01MWF9QTEFURk9STT1tCkNPTkZJR19JTlRFTF9JUFM9bQpDT05GSUdfSU5URUxfUlNU
PW0KIyBDT05GSUdfSU5URUxfU01BUlRDT05ORUNUIGlzIG5vdCBzZXQKCiMKIyBJbnRlbCBTcGVl
ZCBTZWxlY3QgVGVjaG5vbG9neSBpbnRlcmZhY2Ugc3VwcG9ydAojCkNPTkZJR19JTlRFTF9TUEVF
RF9TRUxFQ1RfSU5URVJGQUNFPW0KIyBlbmQgb2YgSW50ZWwgU3BlZWQgU2VsZWN0IFRlY2hub2xv
Z3kgaW50ZXJmYWNlIHN1cHBvcnQKCkNPTkZJR19JTlRFTF9UVVJCT19NQVhfMz15CiMgQ09ORklH
X0lOVEVMX1VOQ09SRV9GUkVRX0NPTlRST0wgaXMgbm90IHNldApDT05GSUdfSU5URUxfUE1DX0NP
UkU9bQojIENPTkZJR19JTlRFTF9QVU5JVF9JUEMgaXMgbm90IHNldAojIENPTkZJR19JTlRFTF9T
Q1VfUENJIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URUxfU0NVX1BMQVRGT1JNIGlzIG5vdCBzZXQK
Q09ORklHX1BNQ19BVE9NPXkKIyBDT05GSUdfQ0hST01FX1BMQVRGT1JNUyBpcyBub3Qgc2V0CkNP
TkZJR19NRUxMQU5PWF9QTEFURk9STT15CkNPTkZJR19NTFhSRUdfSE9UUExVRz1tCkNPTkZJR19N
TFhSRUdfSU89bQpDT05GSUdfU1VSRkFDRV9QTEFURk9STVM9eQojIENPTkZJR19TVVJGQUNFM19X
TUkgaXMgbm90IHNldAojIENPTkZJR19TVVJGQUNFXzNfUE9XRVJfT1BSRUdJT04gaXMgbm90IHNl
dAojIENPTkZJR19TVVJGQUNFX0dQRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NVUkZBQ0VfSE9UUExV
RyBpcyBub3Qgc2V0CiMgQ09ORklHX1NVUkZBQ0VfUFJPM19CVVRUT04gaXMgbm90IHNldApDT05G
SUdfSEFWRV9DTEs9eQpDT05GSUdfQ0xLREVWX0xPT0tVUD15CkNPTkZJR19IQVZFX0NMS19QUkVQ
QVJFPXkKQ09ORklHX0NPTU1PTl9DTEs9eQojIENPTkZJR19DT01NT05fQ0xLX01BWDk0ODUgaXMg
bm90IHNldAojIENPTkZJR19DT01NT05fQ0xLX1NJNTM0MSBpcyBub3Qgc2V0CiMgQ09ORklHX0NP
TU1PTl9DTEtfU0k1MzUxIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19TSTU0NCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NPTU1PTl9DTEtfQ0RDRTcwNiBpcyBub3Qgc2V0CiMgQ09ORklHX0NP
TU1PTl9DTEtfQ1MyMDAwX0NQIGlzIG5vdCBzZXQKIyBDT05GSUdfQ09NTU9OX0NMS19QV00gaXMg
bm90IHNldAojIENPTkZJR19YSUxJTlhfVkNVIGlzIG5vdCBzZXQKQ09ORklHX0hXU1BJTkxPQ0s9
eQoKIwojIENsb2NrIFNvdXJjZSBkcml2ZXJzCiMKQ09ORklHX0NMS0VWVF9JODI1Mz15CkNPTkZJ
R19JODI1M19MT0NLPXkKQ09ORklHX0NMS0JMRF9JODI1Mz15CiMgZW5kIG9mIENsb2NrIFNvdXJj
ZSBkcml2ZXJzCgpDT05GSUdfTUFJTEJPWD15CkNPTkZJR19QQ0M9eQojIENPTkZJR19BTFRFUkFf
TUJPWCBpcyBub3Qgc2V0CkNPTkZJR19JT01NVV9JT1ZBPXkKQ09ORklHX0lPQVNJRD15CkNPTkZJ
R19JT01NVV9BUEk9eQpDT05GSUdfSU9NTVVfU1VQUE9SVD15CgojCiMgR2VuZXJpYyBJT01NVSBQ
YWdldGFibGUgU3VwcG9ydAojCkNPTkZJR19JT01NVV9JT19QR1RBQkxFPXkKIyBlbmQgb2YgR2Vu
ZXJpYyBJT01NVSBQYWdldGFibGUgU3VwcG9ydAoKIyBDT05GSUdfSU9NTVVfREVCVUdGUyBpcyBu
b3Qgc2V0CkNPTkZJR19JT01NVV9ERUZBVUxUX1BBU1NUSFJPVUdIPXkKQ09ORklHX0lPTU1VX0RN
QT15CkNPTkZJR19BTURfSU9NTVU9eQpDT05GSUdfQU1EX0lPTU1VX1YyPW0KQ09ORklHX0RNQVJf
VEFCTEU9eQpDT05GSUdfSU5URUxfSU9NTVU9eQojIENPTkZJR19JTlRFTF9JT01NVV9TVk0gaXMg
bm90IHNldAojIENPTkZJR19JTlRFTF9JT01NVV9ERUZBVUxUX09OIGlzIG5vdCBzZXQKQ09ORklH
X0lOVEVMX0lPTU1VX0ZMT1BQWV9XQT15CiMgQ09ORklHX0lOVEVMX0lPTU1VX1NDQUxBQkxFX01P
REVfREVGQVVMVF9PTiBpcyBub3Qgc2V0CkNPTkZJR19JUlFfUkVNQVA9eQpDT05GSUdfSFlQRVJW
X0lPTU1VPXkKCiMKIyBSZW1vdGVwcm9jIGRyaXZlcnMKIwojIENPTkZJR19SRU1PVEVQUk9DIGlz
IG5vdCBzZXQKIyBlbmQgb2YgUmVtb3RlcHJvYyBkcml2ZXJzCgojCiMgUnBtc2cgZHJpdmVycwoj
CiMgQ09ORklHX1JQTVNHX1FDT01fR0xJTktfUlBNIGlzIG5vdCBzZXQKIyBDT05GSUdfUlBNU0df
VklSVElPIGlzIG5vdCBzZXQKIyBlbmQgb2YgUnBtc2cgZHJpdmVycwoKIyBDT05GSUdfU09VTkRX
SVJFIGlzIG5vdCBzZXQKCiMKIyBTT0MgKFN5c3RlbSBPbiBDaGlwKSBzcGVjaWZpYyBEcml2ZXJz
CiMKCiMKIyBBbWxvZ2ljIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQW1sb2dpYyBTb0MgZHJpdmVy
cwoKIwojIEJyb2FkY29tIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgQnJvYWRjb20gU29DIGRyaXZl
cnMKCiMKIyBOWFAvRnJlZXNjYWxlIFFvcklRIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgTlhQL0Zy
ZWVzY2FsZSBRb3JJUSBTb0MgZHJpdmVycwoKIwojIGkuTVggU29DIGRyaXZlcnMKIwojIGVuZCBv
ZiBpLk1YIFNvQyBkcml2ZXJzCgojCiMgRW5hYmxlIExpdGVYIFNvQyBCdWlsZGVyIHNwZWNpZmlj
IGRyaXZlcnMKIwojIGVuZCBvZiBFbmFibGUgTGl0ZVggU29DIEJ1aWxkZXIgc3BlY2lmaWMgZHJp
dmVycwoKIwojIFF1YWxjb21tIFNvQyBkcml2ZXJzCiMKIyBlbmQgb2YgUXVhbGNvbW0gU29DIGRy
aXZlcnMKCiMgQ09ORklHX1NPQ19USSBpcyBub3Qgc2V0CgojCiMgWGlsaW54IFNvQyBkcml2ZXJz
CiMKIyBlbmQgb2YgWGlsaW54IFNvQyBkcml2ZXJzCiMgZW5kIG9mIFNPQyAoU3lzdGVtIE9uIENo
aXApIHNwZWNpZmljIERyaXZlcnMKCiMgQ09ORklHX1BNX0RFVkZSRVEgaXMgbm90IHNldAojIENP
TkZJR19FWFRDT04gaXMgbm90IHNldAojIENPTkZJR19NRU1PUlkgaXMgbm90IHNldApDT05GSUdf
SUlPPW0KQ09ORklHX0lJT19CVUZGRVI9eQojIENPTkZJR19JSU9fQlVGRkVSX0NCIGlzIG5vdCBz
ZXQKIyBDT05GSUdfSUlPX0JVRkZFUl9ETUEgaXMgbm90IHNldAojIENPTkZJR19JSU9fQlVGRkVS
X0RNQUVOR0lORSBpcyBub3Qgc2V0CiMgQ09ORklHX0lJT19CVUZGRVJfSFdfQ09OU1VNRVIgaXMg
bm90IHNldApDT05GSUdfSUlPX0tGSUZPX0JVRj1tCkNPTkZJR19JSU9fVFJJR0dFUkVEX0JVRkZF
Uj1tCiMgQ09ORklHX0lJT19DT05GSUdGUyBpcyBub3Qgc2V0CkNPTkZJR19JSU9fVFJJR0dFUj15
CkNPTkZJR19JSU9fQ09OU1VNRVJTX1BFUl9UUklHR0VSPTIKIyBDT05GSUdfSUlPX1NXX0RFVklD
RSBpcyBub3Qgc2V0CiMgQ09ORklHX0lJT19TV19UUklHR0VSIGlzIG5vdCBzZXQKIyBDT05GSUdf
SUlPX1RSSUdHRVJFRF9FVkVOVCBpcyBub3Qgc2V0CgojCiMgQWNjZWxlcm9tZXRlcnMKIwojIENP
TkZJR19BRElTMTYyMDEgaXMgbm90IHNldAojIENPTkZJR19BRElTMTYyMDkgaXMgbm90IHNldAoj
IENPTkZJR19BRFhMMzQ1X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX0FEWEwzNDVfU1BJIGlzIG5v
dCBzZXQKIyBDT05GSUdfQURYTDM3Ml9TUEkgaXMgbm90IHNldAojIENPTkZJR19BRFhMMzcyX0ky
QyBpcyBub3Qgc2V0CiMgQ09ORklHX0JNQTE4MCBpcyBub3Qgc2V0CiMgQ09ORklHX0JNQTIyMCBp
cyBub3Qgc2V0CiMgQ09ORklHX0JNQTQwMCBpcyBub3Qgc2V0CiMgQ09ORklHX0JNQzE1MF9BQ0NF
TCBpcyBub3Qgc2V0CiMgQ09ORklHX0RBMjgwIGlzIG5vdCBzZXQKIyBDT05GSUdfREEzMTEgaXMg
bm90IHNldAojIENPTkZJR19ETUFSRDA5IGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BUkQxMCBpcyBu
b3Qgc2V0CkNPTkZJR19ISURfU0VOU09SX0FDQ0VMXzNEPW0KIyBDT05GSUdfSUlPX1NUX0FDQ0VM
XzNBWElTIGlzIG5vdCBzZXQKIyBDT05GSUdfS1hTRDkgaXMgbm90IHNldAojIENPTkZJR19LWENK
SzEwMTMgaXMgbm90IHNldAojIENPTkZJR19NQzMyMzAgaXMgbm90IHNldAojIENPTkZJR19NTUE3
NDU1X0kyQyBpcyBub3Qgc2V0CiMgQ09ORklHX01NQTc0NTVfU1BJIGlzIG5vdCBzZXQKIyBDT05G
SUdfTU1BNzY2MCBpcyBub3Qgc2V0CiMgQ09ORklHX01NQTg0NTIgaXMgbm90IHNldAojIENPTkZJ
R19NTUE5NTUxIGlzIG5vdCBzZXQKIyBDT05GSUdfTU1BOTU1MyBpcyBub3Qgc2V0CiMgQ09ORklH
X01YQzQwMDUgaXMgbm90IHNldAojIENPTkZJR19NWEM2MjU1IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0NBMzAwMCBpcyBub3Qgc2V0CiMgQ09ORklHX1NUSzgzMTIgaXMgbm90IHNldAojIENPTkZJR19T
VEs4QkE1MCBpcyBub3Qgc2V0CiMgZW5kIG9mIEFjY2VsZXJvbWV0ZXJzCgojCiMgQW5hbG9nIHRv
IGRpZ2l0YWwgY29udmVydGVycwojCiMgQ09ORklHX0FENzA5MVI1IGlzIG5vdCBzZXQKIyBDT05G
SUdfQUQ3MTI0IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3MTkyIGlzIG5vdCBzZXQKIyBDT05GSUdf
QUQ3MjY2IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3MjkxIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3
MjkyIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3Mjk4IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NDc2
IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NjA2X0lGQUNFX1BBUkFMTEVMIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUQ3NjA2X0lGQUNFX1NQSSBpcyBub3Qgc2V0CiMgQ09ORklHX0FENzc2NiBpcyBub3Qg
c2V0CiMgQ09ORklHX0FENzc2OF8xIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NzgwIGlzIG5vdCBz
ZXQKIyBDT05GSUdfQUQ3NzkxIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3NzkzIGlzIG5vdCBzZXQK
IyBDT05GSUdfQUQ3ODg3IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3OTIzIGlzIG5vdCBzZXQKIyBD
T05GSUdfQUQ3OTQ5IGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ3OTlYIGlzIG5vdCBzZXQKIyBDT05G
SUdfQUQ5NDY3IGlzIG5vdCBzZXQKIyBDT05GSUdfSEk4NDM1IGlzIG5vdCBzZXQKIyBDT05GSUdf
SFg3MTEgaXMgbm90IHNldAojIENPTkZJR19JTkEyWFhfQURDIGlzIG5vdCBzZXQKIyBDT05GSUdf
TFRDMjQ3MSBpcyBub3Qgc2V0CiMgQ09ORklHX0xUQzI0ODUgaXMgbm90IHNldAojIENPTkZJR19M
VEMyNDk2IGlzIG5vdCBzZXQKIyBDT05GSUdfTFRDMjQ5NyBpcyBub3Qgc2V0CiMgQ09ORklHX01B
WDEwMjcgaXMgbm90IHNldAojIENPTkZJR19NQVgxMTEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX01B
WDExMTggaXMgbm90IHNldAojIENPTkZJR19NQVgxMjQxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFY
MTM2MyBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDk2MTEgaXMgbm90IHNldAojIENPTkZJR19NQ1Az
MjBYIGlzIG5vdCBzZXQKIyBDT05GSUdfTUNQMzQyMiBpcyBub3Qgc2V0CiMgQ09ORklHX01DUDM5
MTEgaXMgbm90IHNldAojIENPTkZJR19OQVU3ODAyIGlzIG5vdCBzZXQKIyBDT05GSUdfVElfQURD
MDgxQyBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEQzA4MzIgaXMgbm90IHNldAojIENPTkZJR19U
SV9BREMwODRTMDIxIGlzIG5vdCBzZXQKIyBDT05GSUdfVElfQURDMTIxMzggaXMgbm90IHNldAoj
IENPTkZJR19USV9BREMxMDhTMTAyIGlzIG5vdCBzZXQKIyBDT05GSUdfVElfQURDMTI4UzA1MiBp
cyBub3Qgc2V0CiMgQ09ORklHX1RJX0FEQzE2MVM2MjYgaXMgbm90IHNldAojIENPTkZJR19USV9B
RFMxMDE1IGlzIG5vdCBzZXQKIyBDT05GSUdfVElfQURTNzk1MCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RJX1RMQzQ1NDEgaXMgbm90IHNldAojIENPTkZJR19WSVBFUkJPQVJEX0FEQyBpcyBub3Qgc2V0
CiMgQ09ORklHX1hJTElOWF9YQURDIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5hbG9nIHRvIGRpZ2l0
YWwgY29udmVydGVycwoKIwojIEFuYWxvZyBGcm9udCBFbmRzCiMKIyBlbmQgb2YgQW5hbG9nIEZy
b250IEVuZHMKCiMKIyBBbXBsaWZpZXJzCiMKIyBDT05GSUdfQUQ4MzY2IGlzIG5vdCBzZXQKIyBD
T05GSUdfSE1DNDI1IGlzIG5vdCBzZXQKIyBlbmQgb2YgQW1wbGlmaWVycwoKIwojIENoZW1pY2Fs
IFNlbnNvcnMKIwojIENPTkZJR19BVExBU19QSF9TRU5TT1IgaXMgbm90IHNldAojIENPTkZJR19B
VExBU19FWk9fU0VOU09SIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1FNjgwIGlzIG5vdCBzZXQKIyBD
T05GSUdfQ0NTODExIGlzIG5vdCBzZXQKIyBDT05GSUdfSUFRQ09SRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NDRDMwX0NPUkUgaXMgbm90IHNldAojIENPTkZJR19TRU5TSVJJT05fU0dQMzAgaXMgbm90
IHNldAojIENPTkZJR19TUFMzMCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZaODlYIGlzIG5vdCBzZXQK
IyBlbmQgb2YgQ2hlbWljYWwgU2Vuc29ycwoKIwojIEhpZCBTZW5zb3IgSUlPIENvbW1vbgojCkNP
TkZJR19ISURfU0VOU09SX0lJT19DT01NT049bQpDT05GSUdfSElEX1NFTlNPUl9JSU9fVFJJR0dF
Uj1tCiMgZW5kIG9mIEhpZCBTZW5zb3IgSUlPIENvbW1vbgoKIwojIFNTUCBTZW5zb3IgQ29tbW9u
CiMKIyBDT05GSUdfSUlPX1NTUF9TRU5TT1JIVUIgaXMgbm90IHNldAojIGVuZCBvZiBTU1AgU2Vu
c29yIENvbW1vbgoKIwojIERpZ2l0YWwgdG8gYW5hbG9nIGNvbnZlcnRlcnMKIwojIENPTkZJR19B
RDUwNjQgaXMgbm90IHNldAojIENPTkZJR19BRDUzNjAgaXMgbm90IHNldAojIENPTkZJR19BRDUz
ODAgaXMgbm90IHNldAojIENPTkZJR19BRDU0MjEgaXMgbm90IHNldAojIENPTkZJR19BRDU0NDYg
aXMgbm90IHNldAojIENPTkZJR19BRDU0NDkgaXMgbm90IHNldAojIENPTkZJR19BRDU1OTJSIGlz
IG5vdCBzZXQKIyBDT05GSUdfQUQ1NTkzUiBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTUwNCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0FENTYyNFJfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1Njg2X1NQ
SSBpcyBub3Qgc2V0CiMgQ09ORklHX0FENTY5Nl9JMkMgaXMgbm90IHNldAojIENPTkZJR19BRDU3
NTUgaXMgbm90IHNldAojIENPTkZJR19BRDU3NTggaXMgbm90IHNldAojIENPTkZJR19BRDU3NjEg
aXMgbm90IHNldAojIENPTkZJR19BRDU3NjQgaXMgbm90IHNldAojIENPTkZJR19BRDU3NjYgaXMg
bm90IHNldAojIENPTkZJR19BRDU3NzBSIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ1NzkxIGlzIG5v
dCBzZXQKIyBDT05GSUdfQUQ3MzAzIGlzIG5vdCBzZXQKIyBDT05GSUdfQUQ4ODAxIGlzIG5vdCBz
ZXQKIyBDT05GSUdfRFM0NDI0IGlzIG5vdCBzZXQKIyBDT05GSUdfTFRDMTY2MCBpcyBub3Qgc2V0
CiMgQ09ORklHX0xUQzI2MzIgaXMgbm90IHNldAojIENPTkZJR19NNjIzMzIgaXMgbm90IHNldAoj
IENPTkZJR19NQVg1MTcgaXMgbm90IHNldAojIENPTkZJR19NQ1A0NzI1IGlzIG5vdCBzZXQKIyBD
T05GSUdfTUNQNDkyMiBpcyBub3Qgc2V0CiMgQ09ORklHX1RJX0RBQzA4MlMwODUgaXMgbm90IHNl
dAojIENPTkZJR19USV9EQUM1NTcxIGlzIG5vdCBzZXQKIyBDT05GSUdfVElfREFDNzMxMSBpcyBu
b3Qgc2V0CiMgQ09ORklHX1RJX0RBQzc2MTIgaXMgbm90IHNldAojIGVuZCBvZiBEaWdpdGFsIHRv
IGFuYWxvZyBjb252ZXJ0ZXJzCgojCiMgSUlPIGR1bW15IGRyaXZlcgojCiMgZW5kIG9mIElJTyBk
dW1teSBkcml2ZXIKCiMKIyBGcmVxdWVuY3kgU3ludGhlc2l6ZXJzIEREUy9QTEwKIwoKIwojIENs
b2NrIEdlbmVyYXRvci9EaXN0cmlidXRpb24KIwojIENPTkZJR19BRDk1MjMgaXMgbm90IHNldAoj
IGVuZCBvZiBDbG9jayBHZW5lcmF0b3IvRGlzdHJpYnV0aW9uCgojCiMgUGhhc2UtTG9ja2VkIExv
b3AgKFBMTCkgZnJlcXVlbmN5IHN5bnRoZXNpemVycwojCiMgQ09ORklHX0FERjQzNTAgaXMgbm90
IHNldAojIENPTkZJR19BREY0MzcxIGlzIG5vdCBzZXQKIyBlbmQgb2YgUGhhc2UtTG9ja2VkIExv
b3AgKFBMTCkgZnJlcXVlbmN5IHN5bnRoZXNpemVycwojIGVuZCBvZiBGcmVxdWVuY3kgU3ludGhl
c2l6ZXJzIEREUy9QTEwKCiMKIyBEaWdpdGFsIGd5cm9zY29wZSBzZW5zb3JzCiMKIyBDT05GSUdf
QURJUzE2MDgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQURJUzE2MTMwIGlzIG5vdCBzZXQKIyBDT05G
SUdfQURJUzE2MTM2IGlzIG5vdCBzZXQKIyBDT05GSUdfQURJUzE2MjYwIGlzIG5vdCBzZXQKIyBD
T05GSUdfQURYUlMyOTAgaXMgbm90IHNldAojIENPTkZJR19BRFhSUzQ1MCBpcyBub3Qgc2V0CiMg
Q09ORklHX0JNRzE2MCBpcyBub3Qgc2V0CiMgQ09ORklHX0ZYQVMyMTAwMkMgaXMgbm90IHNldApD
T05GSUdfSElEX1NFTlNPUl9HWVJPXzNEPW0KIyBDT05GSUdfTVBVMzA1MF9JMkMgaXMgbm90IHNl
dAojIENPTkZJR19JSU9fU1RfR1lST18zQVhJUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lURzMyMDAg
aXMgbm90IHNldAojIGVuZCBvZiBEaWdpdGFsIGd5cm9zY29wZSBzZW5zb3JzCgojCiMgSGVhbHRo
IFNlbnNvcnMKIwoKIwojIEhlYXJ0IFJhdGUgTW9uaXRvcnMKIwojIENPTkZJR19BRkU0NDAzIGlz
IG5vdCBzZXQKIyBDT05GSUdfQUZFNDQwNCBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDMwMTAwIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUFYMzAxMDIgaXMgbm90IHNldAojIGVuZCBvZiBIZWFydCBSYXRl
IE1vbml0b3JzCiMgZW5kIG9mIEhlYWx0aCBTZW5zb3JzCgojCiMgSHVtaWRpdHkgc2Vuc29ycwoj
CiMgQ09ORklHX0FNMjMxNSBpcyBub3Qgc2V0CiMgQ09ORklHX0RIVDExIGlzIG5vdCBzZXQKIyBD
T05GSUdfSERDMTAwWCBpcyBub3Qgc2V0CiMgQ09ORklHX0hEQzIwMTAgaXMgbm90IHNldApDT05G
SUdfSElEX1NFTlNPUl9IVU1JRElUWT1tCiMgQ09ORklHX0hUUzIyMSBpcyBub3Qgc2V0CiMgQ09O
RklHX0hUVTIxIGlzIG5vdCBzZXQKIyBDT05GSUdfU0k3MDA1IGlzIG5vdCBzZXQKIyBDT05GSUdf
U0k3MDIwIGlzIG5vdCBzZXQKIyBlbmQgb2YgSHVtaWRpdHkgc2Vuc29ycwoKIwojIEluZXJ0aWFs
IG1lYXN1cmVtZW50IHVuaXRzCiMKIyBDT05GSUdfQURJUzE2NDAwIGlzIG5vdCBzZXQKIyBDT05G
SUdfQURJUzE2NDYwIGlzIG5vdCBzZXQKIyBDT05GSUdfQURJUzE2NDc1IGlzIG5vdCBzZXQKIyBD
T05GSUdfQURJUzE2NDgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQk1JMTYwX0kyQyBpcyBub3Qgc2V0
CiMgQ09ORklHX0JNSTE2MF9TUEkgaXMgbm90IHNldAojIENPTkZJR19GWE9TODcwMF9JMkMgaXMg
bm90IHNldAojIENPTkZJR19GWE9TODcwMF9TUEkgaXMgbm90IHNldAojIENPTkZJR19LTVg2MSBp
cyBub3Qgc2V0CiMgQ09ORklHX0lOVl9JQ000MjYwMF9JMkMgaXMgbm90IHNldAojIENPTkZJR19J
TlZfSUNNNDI2MDBfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5WX01QVTYwNTBfSTJDIGlzIG5v
dCBzZXQKIyBDT05GSUdfSU5WX01QVTYwNTBfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfSUlPX1NU
X0xTTTZEU1ggaXMgbm90IHNldAojIGVuZCBvZiBJbmVydGlhbCBtZWFzdXJlbWVudCB1bml0cwoK
IwojIExpZ2h0IHNlbnNvcnMKIwojIENPTkZJR19BQ1BJX0FMUyBpcyBub3Qgc2V0CiMgQ09ORklH
X0FESkRfUzMxMSBpcyBub3Qgc2V0CiMgQ09ORklHX0FEVVgxMDIwIGlzIG5vdCBzZXQKIyBDT05G
SUdfQUwzMDEwIGlzIG5vdCBzZXQKIyBDT05GSUdfQUwzMzIwQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0FQRFM5MzAwIGlzIG5vdCBzZXQKIyBDT05GSUdfQVBEUzk5NjAgaXMgbm90IHNldAojIENPTkZJ
R19BUzczMjExIGlzIG5vdCBzZXQKIyBDT05GSUdfQkgxNzUwIGlzIG5vdCBzZXQKIyBDT05GSUdf
QkgxNzgwIGlzIG5vdCBzZXQKIyBDT05GSUdfQ00zMjE4MSBpcyBub3Qgc2V0CiMgQ09ORklHX0NN
MzIzMiBpcyBub3Qgc2V0CiMgQ09ORklHX0NNMzMyMyBpcyBub3Qgc2V0CiMgQ09ORklHX0NNMzY2
NTEgaXMgbm90IHNldAojIENPTkZJR19HUDJBUDAwMiBpcyBub3Qgc2V0CiMgQ09ORklHX0dQMkFQ
MDIwQTAwRiBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSVNMMjkwMTggaXMgbm90IHNldAoj
IENPTkZJR19TRU5TT1JTX0lTTDI5MDI4IGlzIG5vdCBzZXQKIyBDT05GSUdfSVNMMjkxMjUgaXMg
bm90IHNldApDT05GSUdfSElEX1NFTlNPUl9BTFM9bQpDT05GSUdfSElEX1NFTlNPUl9QUk9YPW0K
IyBDT05GSUdfSlNBMTIxMiBpcyBub3Qgc2V0CiMgQ09ORklHX1JQUjA1MjEgaXMgbm90IHNldAoj
IENPTkZJR19MVFI1MDEgaXMgbm90IHNldAojIENPTkZJR19MVjAxMDRDUyBpcyBub3Qgc2V0CiMg
Q09ORklHX01BWDQ0MDAwIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFYNDQwMDkgaXMgbm90IHNldAoj
IENPTkZJR19OT0ExMzA1IGlzIG5vdCBzZXQKIyBDT05GSUdfT1BUMzAwMSBpcyBub3Qgc2V0CiMg
Q09ORklHX1BBMTIyMDMwMDEgaXMgbm90IHNldAojIENPTkZJR19TSTExMzMgaXMgbm90IHNldAoj
IENPTkZJR19TSTExNDUgaXMgbm90IHNldAojIENPTkZJR19TVEszMzEwIGlzIG5vdCBzZXQKIyBD
T05GSUdfU1RfVVZJUzI1IGlzIG5vdCBzZXQKIyBDT05GSUdfVENTMzQxNCBpcyBub3Qgc2V0CiMg
Q09ORklHX1RDUzM0NzIgaXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX1RTTDI1NjMgaXMgbm90
IHNldAojIENPTkZJR19UU0wyNTgzIGlzIG5vdCBzZXQKIyBDT05GSUdfVFNMMjc3MiBpcyBub3Qg
c2V0CiMgQ09ORklHX1RTTDQ1MzEgaXMgbm90IHNldAojIENPTkZJR19VUzUxODJEIGlzIG5vdCBz
ZXQKIyBDT05GSUdfVkNOTDQwMDAgaXMgbm90IHNldAojIENPTkZJR19WQ05MNDAzNSBpcyBub3Qg
c2V0CiMgQ09ORklHX1ZFTUw2MDMwIGlzIG5vdCBzZXQKIyBDT05GSUdfVkVNTDYwNzAgaXMgbm90
IHNldAojIENPTkZJR19WTDYxODAgaXMgbm90IHNldAojIENPTkZJR19aT1BUMjIwMSBpcyBub3Qg
c2V0CiMgZW5kIG9mIExpZ2h0IHNlbnNvcnMKCiMKIyBNYWduZXRvbWV0ZXIgc2Vuc29ycwojCiMg
Q09ORklHX0FLODk3NSBpcyBub3Qgc2V0CiMgQ09ORklHX0FLMDk5MTEgaXMgbm90IHNldAojIENP
TkZJR19CTUMxNTBfTUFHTl9JMkMgaXMgbm90IHNldAojIENPTkZJR19CTUMxNTBfTUFHTl9TUEkg
aXMgbm90IHNldAojIENPTkZJR19NQUczMTEwIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9TRU5TT1Jf
TUFHTkVUT01FVEVSXzNEPW0KIyBDT05GSUdfTU1DMzUyNDAgaXMgbm90IHNldAojIENPTkZJR19J
SU9fU1RfTUFHTl8zQVhJUyBpcyBub3Qgc2V0CiMgQ09ORklHX1NFTlNPUlNfSE1DNTg0M19JMkMg
aXMgbm90IHNldAojIENPTkZJR19TRU5TT1JTX0hNQzU4NDNfU1BJIGlzIG5vdCBzZXQKIyBDT05G
SUdfU0VOU09SU19STTMxMDBfSTJDIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VOU09SU19STTMxMDBf
U1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfWUFNQUhBX1lBUzUzMCBpcyBub3Qgc2V0CiMgZW5kIG9m
IE1hZ25ldG9tZXRlciBzZW5zb3JzCgojCiMgTXVsdGlwbGV4ZXJzCiMKIyBlbmQgb2YgTXVsdGlw
bGV4ZXJzCgojCiMgSW5jbGlub21ldGVyIHNlbnNvcnMKIwpDT05GSUdfSElEX1NFTlNPUl9JTkNM
SU5PTUVURVJfM0Q9bQpDT05GSUdfSElEX1NFTlNPUl9ERVZJQ0VfUk9UQVRJT049bQojIGVuZCBv
ZiBJbmNsaW5vbWV0ZXIgc2Vuc29ycwoKIwojIFRyaWdnZXJzIC0gc3RhbmRhbG9uZQojCiMgQ09O
RklHX0lJT19JTlRFUlJVUFRfVFJJR0dFUiBpcyBub3Qgc2V0CiMgQ09ORklHX0lJT19TWVNGU19U
UklHR0VSIGlzIG5vdCBzZXQKIyBlbmQgb2YgVHJpZ2dlcnMgLSBzdGFuZGFsb25lCgojCiMgTGlu
ZWFyIGFuZCBhbmd1bGFyIHBvc2l0aW9uIHNlbnNvcnMKIwojIENPTkZJR19ISURfU0VOU09SX0NV
U1RPTV9JTlRFTF9ISU5HRSBpcyBub3Qgc2V0CiMgZW5kIG9mIExpbmVhciBhbmQgYW5ndWxhciBw
b3NpdGlvbiBzZW5zb3JzCgojCiMgRGlnaXRhbCBwb3RlbnRpb21ldGVycwojCiMgQ09ORklHX0FE
NTI3MiBpcyBub3Qgc2V0CiMgQ09ORklHX0RTMTgwMyBpcyBub3Qgc2V0CiMgQ09ORklHX01BWDU0
MzIgaXMgbm90IHNldAojIENPTkZJR19NQVg1NDgxIGlzIG5vdCBzZXQKIyBDT05GSUdfTUFYNTQ4
NyBpcyBub3Qgc2V0CiMgQ09ORklHX01DUDQwMTggaXMgbm90IHNldAojIENPTkZJR19NQ1A0MTMx
IGlzIG5vdCBzZXQKIyBDT05GSUdfTUNQNDUzMSBpcyBub3Qgc2V0CiMgQ09ORklHX01DUDQxMDEw
IGlzIG5vdCBzZXQKIyBDT05GSUdfVFBMMDEwMiBpcyBub3Qgc2V0CiMgZW5kIG9mIERpZ2l0YWwg
cG90ZW50aW9tZXRlcnMKCiMKIyBEaWdpdGFsIHBvdGVudGlvc3RhdHMKIwojIENPTkZJR19MTVA5
MTAwMCBpcyBub3Qgc2V0CiMgZW5kIG9mIERpZ2l0YWwgcG90ZW50aW9zdGF0cwoKIwojIFByZXNz
dXJlIHNlbnNvcnMKIwojIENPTkZJR19BQlAwNjBNRyBpcyBub3Qgc2V0CiMgQ09ORklHX0JNUDI4
MCBpcyBub3Qgc2V0CiMgQ09ORklHX0RMSEw2MEQgaXMgbm90IHNldAojIENPTkZJR19EUFMzMTAg
aXMgbm90IHNldApDT05GSUdfSElEX1NFTlNPUl9QUkVTUz1tCiMgQ09ORklHX0hQMDMgaXMgbm90
IHNldAojIENPTkZJR19JQ1AxMDEwMCBpcyBub3Qgc2V0CiMgQ09ORklHX01QTDExNV9JMkMgaXMg
bm90IHNldAojIENPTkZJR19NUEwxMTVfU1BJIGlzIG5vdCBzZXQKIyBDT05GSUdfTVBMMzExNSBp
cyBub3Qgc2V0CiMgQ09ORklHX01TNTYxMSBpcyBub3Qgc2V0CiMgQ09ORklHX01TNTYzNyBpcyBu
b3Qgc2V0CiMgQ09ORklHX0lJT19TVF9QUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1Q1NDAzIGlz
IG5vdCBzZXQKIyBDT05GSUdfSFAyMDZDIGlzIG5vdCBzZXQKIyBDT05GSUdfWlBBMjMyNiBpcyBu
b3Qgc2V0CiMgZW5kIG9mIFByZXNzdXJlIHNlbnNvcnMKCiMKIyBMaWdodG5pbmcgc2Vuc29ycwoj
CiMgQ09ORklHX0FTMzkzNSBpcyBub3Qgc2V0CiMgZW5kIG9mIExpZ2h0bmluZyBzZW5zb3JzCgoj
CiMgUHJveGltaXR5IGFuZCBkaXN0YW5jZSBzZW5zb3JzCiMKIyBDT05GSUdfSVNMMjk1MDEgaXMg
bm90IHNldAojIENPTkZJR19MSURBUl9MSVRFX1YyIGlzIG5vdCBzZXQKIyBDT05GSUdfTUIxMjMy
IGlzIG5vdCBzZXQKIyBDT05GSUdfUElORyBpcyBub3Qgc2V0CiMgQ09ORklHX1JGRDc3NDAyIGlz
IG5vdCBzZXQKIyBDT05GSUdfU1JGMDQgaXMgbm90IHNldAojIENPTkZJR19TWDkzMTAgaXMgbm90
IHNldAojIENPTkZJR19TWDk1MDAgaXMgbm90IHNldAojIENPTkZJR19TUkYwOCBpcyBub3Qgc2V0
CiMgQ09ORklHX1ZDTkwzMDIwIGlzIG5vdCBzZXQKIyBDT05GSUdfVkw1M0wwWF9JMkMgaXMgbm90
IHNldAojIGVuZCBvZiBQcm94aW1pdHkgYW5kIGRpc3RhbmNlIHNlbnNvcnMKCiMKIyBSZXNvbHZl
ciB0byBkaWdpdGFsIGNvbnZlcnRlcnMKIwojIENPTkZJR19BRDJTOTAgaXMgbm90IHNldAojIENP
TkZJR19BRDJTMTIwMCBpcyBub3Qgc2V0CiMgZW5kIG9mIFJlc29sdmVyIHRvIGRpZ2l0YWwgY29u
dmVydGVycwoKIwojIFRlbXBlcmF0dXJlIHNlbnNvcnMKIwojIENPTkZJR19MVEMyOTgzIGlzIG5v
dCBzZXQKIyBDT05GSUdfTUFYSU1fVEhFUk1PQ09VUExFIGlzIG5vdCBzZXQKQ09ORklHX0hJRF9T
RU5TT1JfVEVNUD1tCiMgQ09ORklHX01MWDkwNjE0IGlzIG5vdCBzZXQKIyBDT05GSUdfTUxYOTA2
MzIgaXMgbm90IHNldAojIENPTkZJR19UTVAwMDYgaXMgbm90IHNldAojIENPTkZJR19UTVAwMDcg
aXMgbm90IHNldAojIENPTkZJR19UU1lTMDEgaXMgbm90IHNldAojIENPTkZJR19UU1lTMDJEIGlz
IG5vdCBzZXQKIyBDT05GSUdfTUFYMzE4NTYgaXMgbm90IHNldAojIGVuZCBvZiBUZW1wZXJhdHVy
ZSBzZW5zb3JzCgpDT05GSUdfTlRCPW0KIyBDT05GSUdfTlRCX01TSSBpcyBub3Qgc2V0CiMgQ09O
RklHX05UQl9BTUQgaXMgbm90IHNldAojIENPTkZJR19OVEJfSURUIGlzIG5vdCBzZXQKIyBDT05G
SUdfTlRCX0lOVEVMIGlzIG5vdCBzZXQKIyBDT05GSUdfTlRCX0VQRiBpcyBub3Qgc2V0CiMgQ09O
RklHX05UQl9TV0lUQ0hURUMgaXMgbm90IHNldAojIENPTkZJR19OVEJfUElOR1BPTkcgaXMgbm90
IHNldAojIENPTkZJR19OVEJfVE9PTCBpcyBub3Qgc2V0CiMgQ09ORklHX05UQl9QRVJGIGlzIG5v
dCBzZXQKIyBDT05GSUdfTlRCX1RSQU5TUE9SVCBpcyBub3Qgc2V0CiMgQ09ORklHX1ZNRV9CVVMg
aXMgbm90IHNldApDT05GSUdfUFdNPXkKQ09ORklHX1BXTV9TWVNGUz15CiMgQ09ORklHX1BXTV9E
RUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX1BXTV9EV0MgaXMgbm90IHNldApDT05GSUdfUFdNX0xQ
U1M9bQpDT05GSUdfUFdNX0xQU1NfUENJPW0KQ09ORklHX1BXTV9MUFNTX1BMQVRGT1JNPW0KIyBD
T05GSUdfUFdNX1BDQTk2ODUgaXMgbm90IHNldAoKIwojIElSUSBjaGlwIHN1cHBvcnQKIwojIGVu
ZCBvZiBJUlEgY2hpcCBzdXBwb3J0CgojIENPTkZJR19JUEFDS19CVVMgaXMgbm90IHNldAojIENP
TkZJR19SRVNFVF9DT05UUk9MTEVSIGlzIG5vdCBzZXQKCiMKIyBQSFkgU3Vic3lzdGVtCiMKIyBD
T05GSUdfR0VORVJJQ19QSFkgaXMgbm90IHNldAojIENPTkZJR19VU0JfTEdNX1BIWSBpcyBub3Qg
c2V0CiMgQ09ORklHX0JDTV9LT05BX1VTQjJfUEhZIGlzIG5vdCBzZXQKIyBDT05GSUdfUEhZX1BY
QV8yOE5NX0hTSUMgaXMgbm90IHNldAojIENPTkZJR19QSFlfUFhBXzI4Tk1fVVNCMiBpcyBub3Qg
c2V0CiMgQ09ORklHX1BIWV9DUENBUF9VU0IgaXMgbm90IHNldAojIENPTkZJR19QSFlfSU5URUxf
TEdNX0VNTUMgaXMgbm90IHNldAojIGVuZCBvZiBQSFkgU3Vic3lzdGVtCgpDT05GSUdfUE9XRVJD
QVA9eQpDT05GSUdfSU5URUxfUkFQTF9DT1JFPW0KQ09ORklHX0lOVEVMX1JBUEw9bQojIENPTkZJ
R19JRExFX0lOSkVDVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RUUE0gaXMgbm90IHNldAojIENPTkZJ
R19NQ0IgaXMgbm90IHNldAoKIwojIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAojCiMgZW5k
IG9mIFBlcmZvcm1hbmNlIG1vbml0b3Igc3VwcG9ydAoKQ09ORklHX1JBUz15CiMgQ09ORklHX1JB
U19DRUMgaXMgbm90IHNldApDT05GSUdfVVNCND15CiMgQ09ORklHX1VTQjRfREVCVUdGU19XUklU
RSBpcyBub3Qgc2V0CiMgQ09ORklHX1VTQjRfRE1BX1RFU1QgaXMgbm90IHNldAoKIwojIEFuZHJv
aWQKIwojIENPTkZJR19BTkRST0lEIGlzIG5vdCBzZXQKIyBlbmQgb2YgQW5kcm9pZAoKQ09ORklH
X0xJQk5WRElNTT1tCkNPTkZJR19CTEtfREVWX1BNRU09bQpDT05GSUdfTkRfQkxLPW0KQ09ORklH
X05EX0NMQUlNPXkKQ09ORklHX05EX0JUVD1tCkNPTkZJR19CVFQ9eQpDT05GSUdfTkRfUEZOPW0K
Q09ORklHX05WRElNTV9QRk49eQpDT05GSUdfTlZESU1NX0RBWD15CkNPTkZJR19OVkRJTU1fS0VZ
Uz15CkNPTkZJR19EQVhfRFJJVkVSPXkKQ09ORklHX0RBWD15CkNPTkZJR19ERVZfREFYPW0KQ09O
RklHX0RFVl9EQVhfUE1FTT1tCkNPTkZJR19ERVZfREFYX0hNRU09bQpDT05GSUdfREVWX0RBWF9I
TUVNX0RFVklDRVM9eQpDT05GSUdfREVWX0RBWF9LTUVNPW0KQ09ORklHX0RFVl9EQVhfUE1FTV9D
T01QQVQ9bQpDT05GSUdfTlZNRU09eQpDT05GSUdfTlZNRU1fU1lTRlM9eQojIENPTkZJR19OVk1F
TV9STUVNIGlzIG5vdCBzZXQKCiMKIyBIVyB0cmFjaW5nIHN1cHBvcnQKIwpDT05GSUdfU1RNPW0K
IyBDT05GSUdfU1RNX1BST1RPX0JBU0lDIGlzIG5vdCBzZXQKIyBDT05GSUdfU1RNX1BST1RPX1NZ
U19UIGlzIG5vdCBzZXQKQ09ORklHX1NUTV9EVU1NWT1tCkNPTkZJR19TVE1fU09VUkNFX0NPTlNP
TEU9bQpDT05GSUdfU1RNX1NPVVJDRV9IRUFSVEJFQVQ9bQpDT05GSUdfU1RNX1NPVVJDRV9GVFJB
Q0U9bQpDT05GSUdfSU5URUxfVEg9bQpDT05GSUdfSU5URUxfVEhfUENJPW0KQ09ORklHX0lOVEVM
X1RIX0FDUEk9bQpDT05GSUdfSU5URUxfVEhfR1RIPW0KQ09ORklHX0lOVEVMX1RIX1NUSD1tCkNP
TkZJR19JTlRFTF9USF9NU1U9bQpDT05GSUdfSU5URUxfVEhfUFRJPW0KIyBDT05GSUdfSU5URUxf
VEhfREVCVUcgaXMgbm90IHNldAojIGVuZCBvZiBIVyB0cmFjaW5nIHN1cHBvcnQKCiMgQ09ORklH
X0ZQR0EgaXMgbm90IHNldAojIENPTkZJR19URUUgaXMgbm90IHNldAojIENPTkZJR19VTklTWVNf
VklTT1JCVVMgaXMgbm90IHNldAojIENPTkZJR19TSU9YIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xJ
TUJVUyBpcyBub3Qgc2V0CiMgQ09ORklHX0lOVEVSQ09OTkVDVCBpcyBub3Qgc2V0CiMgQ09ORklH
X0NPVU5URVIgaXMgbm90IHNldAojIENPTkZJR19NT1NUIGlzIG5vdCBzZXQKIyBlbmQgb2YgRGV2
aWNlIERyaXZlcnMKCiMKIyBGaWxlIHN5c3RlbXMKIwpDT05GSUdfRENBQ0hFX1dPUkRfQUNDRVNT
PXkKIyBDT05GSUdfVkFMSURBVEVfRlNfUEFSU0VSIGlzIG5vdCBzZXQKQ09ORklHX0ZTX0lPTUFQ
PXkKIyBDT05GSUdfRVhUMl9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0VYVDNfRlMgaXMgbm90IHNl
dApDT05GSUdfRVhUNF9GUz1tCkNPTkZJR19FWFQ0X1VTRV9GT1JfRVhUMj15CkNPTkZJR19FWFQ0
X0ZTX1BPU0lYX0FDTD15CkNPTkZJR19FWFQ0X0ZTX1NFQ1VSSVRZPXkKIyBDT05GSUdfRVhUNF9E
RUJVRyBpcyBub3Qgc2V0CkNPTkZJR19KQkQyPW0KIyBDT05GSUdfSkJEMl9ERUJVRyBpcyBub3Qg
c2V0CkNPTkZJR19GU19NQkNBQ0hFPW0KIyBDT05GSUdfUkVJU0VSRlNfRlMgaXMgbm90IHNldAoj
IENPTkZJR19KRlNfRlMgaXMgbm90IHNldApDT05GSUdfWEZTX0ZTPW0KQ09ORklHX1hGU19TVVBQ
T1JUX1Y0PXkKQ09ORklHX1hGU19RVU9UQT15CkNPTkZJR19YRlNfUE9TSVhfQUNMPXkKIyBDT05G
SUdfWEZTX1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX09OTElORV9TQ1JVQiBpcyBub3Qgc2V0
CiMgQ09ORklHX1hGU19XQVJOIGlzIG5vdCBzZXQKIyBDT05GSUdfWEZTX0RFQlVHIGlzIG5vdCBz
ZXQKQ09ORklHX0dGUzJfRlM9bQpDT05GSUdfR0ZTMl9GU19MT0NLSU5HX0RMTT15CiMgQ09ORklH
X09DRlMyX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQlRSRlNfRlMgaXMgbm90IHNldAojIENPTkZJ
R19OSUxGUzJfRlMgaXMgbm90IHNldAojIENPTkZJR19GMkZTX0ZTIGlzIG5vdCBzZXQKQ09ORklH
X0ZTX0RBWD15CkNPTkZJR19GU19EQVhfUE1EPXkKQ09ORklHX0ZTX1BPU0lYX0FDTD15CkNPTkZJ
R19FWFBPUlRGUz15CkNPTkZJR19FWFBPUlRGU19CTE9DS19PUFM9eQpDT05GSUdfRklMRV9MT0NL
SU5HPXkKIyBDT05GSUdfTUFOREFUT1JZX0ZJTEVfTE9DS0lORyBpcyBub3Qgc2V0CiMgQ09ORklH
X0ZTX0VOQ1JZUFRJT04gaXMgbm90IHNldAojIENPTkZJR19GU19WRVJJVFkgaXMgbm90IHNldApD
T05GSUdfRlNOT1RJRlk9eQpDT05GSUdfRE5PVElGWT15CkNPTkZJR19JTk9USUZZX1VTRVI9eQpD
T05GSUdfRkFOT1RJRlk9eQpDT05GSUdfRkFOT1RJRllfQUNDRVNTX1BFUk1JU1NJT05TPXkKQ09O
RklHX1FVT1RBPXkKQ09ORklHX1FVT1RBX05FVExJTktfSU5URVJGQUNFPXkKQ09ORklHX1BSSU5U
X1FVT1RBX1dBUk5JTkc9eQojIENPTkZJR19RVU9UQV9ERUJVRyBpcyBub3Qgc2V0CkNPTkZJR19R
VU9UQV9UUkVFPXkKIyBDT05GSUdfUUZNVF9WMSBpcyBub3Qgc2V0CkNPTkZJR19RRk1UX1YyPXkK
Q09ORklHX1FVT1RBQ1RMPXkKQ09ORklHX0FVVE9GUzRfRlM9eQpDT05GSUdfQVVUT0ZTX0ZTPXkK
Q09ORklHX0ZVU0VfRlM9bQpDT05GSUdfQ1VTRT1tCkNPTkZJR19WSVJUSU9fRlM9bQpDT05GSUdf
RlVTRV9EQVg9eQpDT05GSUdfT1ZFUkxBWV9GUz1tCiMgQ09ORklHX09WRVJMQVlfRlNfUkVESVJF
Q1RfRElSIGlzIG5vdCBzZXQKIyBDT05GSUdfT1ZFUkxBWV9GU19SRURJUkVDVF9BTFdBWVNfRk9M
TE9XIGlzIG5vdCBzZXQKIyBDT05GSUdfT1ZFUkxBWV9GU19JTkRFWCBpcyBub3Qgc2V0CiMgQ09O
RklHX09WRVJMQVlfRlNfWElOT19BVVRPIGlzIG5vdCBzZXQKIyBDT05GSUdfT1ZFUkxBWV9GU19N
RVRBQ09QWSBpcyBub3Qgc2V0CgojCiMgQ2FjaGVzCiMKQ09ORklHX0ZTQ0FDSEU9bQpDT05GSUdf
RlNDQUNIRV9TVEFUUz15CiMgQ09ORklHX0ZTQ0FDSEVfSElTVE9HUkFNIGlzIG5vdCBzZXQKIyBD
T05GSUdfRlNDQUNIRV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0ZTQ0FDSEVfT0JKRUNUX0xJ
U1QgaXMgbm90IHNldApDT05GSUdfQ0FDSEVGSUxFUz1tCiMgQ09ORklHX0NBQ0hFRklMRVNfREVC
VUcgaXMgbm90IHNldAojIENPTkZJR19DQUNIRUZJTEVTX0hJU1RPR1JBTSBpcyBub3Qgc2V0CiMg
ZW5kIG9mIENhY2hlcwoKIwojIENELVJPTS9EVkQgRmlsZXN5c3RlbXMKIwpDT05GSUdfSVNPOTY2
MF9GUz1tCkNPTkZJR19KT0xJRVQ9eQpDT05GSUdfWklTT0ZTPXkKQ09ORklHX1VERl9GUz1tCiMg
ZW5kIG9mIENELVJPTS9EVkQgRmlsZXN5c3RlbXMKCiMKIyBET1MvRkFUL0VYRkFUL05UIEZpbGVz
eXN0ZW1zCiMKQ09ORklHX0ZBVF9GUz1tCkNPTkZJR19NU0RPU19GUz1tCkNPTkZJR19WRkFUX0ZT
PW0KQ09ORklHX0ZBVF9ERUZBVUxUX0NPREVQQUdFPTQzNwpDT05GSUdfRkFUX0RFRkFVTFRfSU9D
SEFSU0VUPSJhc2NpaSIKIyBDT05GSUdfRkFUX0RFRkFVTFRfVVRGOCBpcyBub3Qgc2V0CiMgQ09O
RklHX0VYRkFUX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTlRGU19GUyBpcyBub3Qgc2V0CiMgZW5k
IG9mIERPUy9GQVQvRVhGQVQvTlQgRmlsZXN5c3RlbXMKCiMKIyBQc2V1ZG8gZmlsZXN5c3RlbXMK
IwpDT05GSUdfUFJPQ19GUz15CkNPTkZJR19QUk9DX0tDT1JFPXkKQ09ORklHX1BST0NfVk1DT1JF
PXkKQ09ORklHX1BST0NfVk1DT1JFX0RFVklDRV9EVU1QPXkKQ09ORklHX1BST0NfU1lTQ1RMPXkK
Q09ORklHX1BST0NfUEFHRV9NT05JVE9SPXkKQ09ORklHX1BST0NfQ0hJTERSRU49eQpDT05GSUdf
UFJPQ19QSURfQVJDSF9TVEFUVVM9eQpDT05GSUdfUFJPQ19DUFVfUkVTQ1RSTD15CkNPTkZJR19L
RVJORlM9eQpDT05GSUdfU1lTRlM9eQpDT05GSUdfVE1QRlM9eQpDT05GSUdfVE1QRlNfUE9TSVhf
QUNMPXkKQ09ORklHX1RNUEZTX1hBVFRSPXkKIyBDT05GSUdfVE1QRlNfSU5PREU2NCBpcyBub3Qg
c2V0CkNPTkZJR19IVUdFVExCRlM9eQpDT05GSUdfSFVHRVRMQl9QQUdFPXkKQ09ORklHX01FTUZE
X0NSRUFURT15CkNPTkZJR19BUkNIX0hBU19HSUdBTlRJQ19QQUdFPXkKQ09ORklHX0NPTkZJR0ZT
X0ZTPXkKQ09ORklHX0VGSVZBUl9GUz15CiMgZW5kIG9mIFBzZXVkbyBmaWxlc3lzdGVtcwoKQ09O
RklHX01JU0NfRklMRVNZU1RFTVM9eQojIENPTkZJR19PUkFOR0VGU19GUyBpcyBub3Qgc2V0CiMg
Q09ORklHX0FERlNfRlMgaXMgbm90IHNldAojIENPTkZJR19BRkZTX0ZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfRUNSWVBUX0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfSEZTX0ZTIGlzIG5vdCBzZXQKIyBD
T05GSUdfSEZTUExVU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX0JFRlNfRlMgaXMgbm90IHNldAoj
IENPTkZJR19CRlNfRlMgaXMgbm90IHNldAojIENPTkZJR19FRlNfRlMgaXMgbm90IHNldAojIENP
TkZJR19KRkZTMl9GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1VCSUZTX0ZTIGlzIG5vdCBzZXQKQ09O
RklHX0NSQU1GUz1tCkNPTkZJR19DUkFNRlNfQkxPQ0tERVY9eQojIENPTkZJR19DUkFNRlNfTVRE
IGlzIG5vdCBzZXQKQ09ORklHX1NRVUFTSEZTPW0KIyBDT05GSUdfU1FVQVNIRlNfRklMRV9DQUNI
RSBpcyBub3Qgc2V0CkNPTkZJR19TUVVBU0hGU19GSUxFX0RJUkVDVD15CiMgQ09ORklHX1NRVUFT
SEZTX0RFQ09NUF9TSU5HTEUgaXMgbm90IHNldAojIENPTkZJR19TUVVBU0hGU19ERUNPTVBfTVVM
VEkgaXMgbm90IHNldApDT05GSUdfU1FVQVNIRlNfREVDT01QX01VTFRJX1BFUkNQVT15CkNPTkZJ
R19TUVVBU0hGU19YQVRUUj15CkNPTkZJR19TUVVBU0hGU19aTElCPXkKIyBDT05GSUdfU1FVQVNI
RlNfTFo0IGlzIG5vdCBzZXQKQ09ORklHX1NRVUFTSEZTX0xaTz15CkNPTkZJR19TUVVBU0hGU19Y
Wj15CiMgQ09ORklHX1NRVUFTSEZTX1pTVEQgaXMgbm90IHNldAojIENPTkZJR19TUVVBU0hGU180
S19ERVZCTEtfU0laRSBpcyBub3Qgc2V0CiMgQ09ORklHX1NRVUFTSEZTX0VNQkVEREVEIGlzIG5v
dCBzZXQKQ09ORklHX1NRVUFTSEZTX0ZSQUdNRU5UX0NBQ0hFX1NJWkU9MwojIENPTkZJR19WWEZT
X0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfTUlOSVhfRlMgaXMgbm90IHNldAojIENPTkZJR19PTUZT
X0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfSFBGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1FOWDRG
U19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1FOWDZGU19GUyBpcyBub3Qgc2V0CiMgQ09ORklHX1JP
TUZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX1BTVE9SRT15CkNPTkZJR19QU1RPUkVfREVGQVVMVF9L
TVNHX0JZVEVTPTEwMjQwCkNPTkZJR19QU1RPUkVfREVGTEFURV9DT01QUkVTUz15CiMgQ09ORklH
X1BTVE9SRV9MWk9fQ09NUFJFU1MgaXMgbm90IHNldAojIENPTkZJR19QU1RPUkVfTFo0X0NPTVBS
RVNTIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFX0xaNEhDX0NPTVBSRVNTIGlzIG5vdCBzZXQK
IyBDT05GSUdfUFNUT1JFXzg0Ml9DT01QUkVTUyBpcyBub3Qgc2V0CiMgQ09ORklHX1BTVE9SRV9a
U1REX0NPTVBSRVNTIGlzIG5vdCBzZXQKQ09ORklHX1BTVE9SRV9DT01QUkVTUz15CkNPTkZJR19Q
U1RPUkVfREVGTEFURV9DT01QUkVTU19ERUZBVUxUPXkKQ09ORklHX1BTVE9SRV9DT01QUkVTU19E
RUZBVUxUPSJkZWZsYXRlIgojIENPTkZJR19QU1RPUkVfQ09OU09MRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1BTVE9SRV9QTVNHIGlzIG5vdCBzZXQKIyBDT05GSUdfUFNUT1JFX0ZUUkFDRSBpcyBub3Qg
c2V0CkNPTkZJR19QU1RPUkVfUkFNPW0KIyBDT05GSUdfUFNUT1JFX0JMSyBpcyBub3Qgc2V0CiMg
Q09ORklHX1NZU1ZfRlMgaXMgbm90IHNldAojIENPTkZJR19VRlNfRlMgaXMgbm90IHNldAojIENP
TkZJR19FUk9GU19GUyBpcyBub3Qgc2V0CkNPTkZJR19ORVRXT1JLX0ZJTEVTWVNURU1TPXkKQ09O
RklHX05GU19GUz1tCiMgQ09ORklHX05GU19WMiBpcyBub3Qgc2V0CkNPTkZJR19ORlNfVjM9bQpD
T05GSUdfTkZTX1YzX0FDTD15CkNPTkZJR19ORlNfVjQ9bQojIENPTkZJR19ORlNfU1dBUCBpcyBu
b3Qgc2V0CkNPTkZJR19ORlNfVjRfMT15CkNPTkZJR19ORlNfVjRfMj15CkNPTkZJR19QTkZTX0ZJ
TEVfTEFZT1VUPW0KQ09ORklHX1BORlNfQkxPQ0s9bQpDT05GSUdfUE5GU19GTEVYRklMRV9MQVlP
VVQ9bQpDT05GSUdfTkZTX1Y0XzFfSU1QTEVNRU5UQVRJT05fSURfRE9NQUlOPSJrZXJuZWwub3Jn
IgojIENPTkZJR19ORlNfVjRfMV9NSUdSQVRJT04gaXMgbm90IHNldApDT05GSUdfTkZTX1Y0X1NF
Q1VSSVRZX0xBQkVMPXkKQ09ORklHX05GU19GU0NBQ0hFPXkKIyBDT05GSUdfTkZTX1VTRV9MRUdB
Q1lfRE5TIGlzIG5vdCBzZXQKQ09ORklHX05GU19VU0VfS0VSTkVMX0ROUz15CkNPTkZJR19ORlNf
REVCVUc9eQpDT05GSUdfTkZTX0RJU0FCTEVfVURQX1NVUFBPUlQ9eQojIENPTkZJR19ORlNfVjRf
Ml9SRUFEX1BMVVMgaXMgbm90IHNldApDT05GSUdfTkZTRD1tCkNPTkZJR19ORlNEX1YyX0FDTD15
CkNPTkZJR19ORlNEX1YzPXkKQ09ORklHX05GU0RfVjNfQUNMPXkKQ09ORklHX05GU0RfVjQ9eQpD
T05GSUdfTkZTRF9QTkZTPXkKIyBDT05GSUdfTkZTRF9CTE9DS0xBWU9VVCBpcyBub3Qgc2V0CkNP
TkZJR19ORlNEX1NDU0lMQVlPVVQ9eQojIENPTkZJR19ORlNEX0ZMRVhGSUxFTEFZT1VUIGlzIG5v
dCBzZXQKIyBDT05GSUdfTkZTRF9WNF8yX0lOVEVSX1NTQyBpcyBub3Qgc2V0CkNPTkZJR19ORlNE
X1Y0X1NFQ1VSSVRZX0xBQkVMPXkKQ09ORklHX0dSQUNFX1BFUklPRD1tCkNPTkZJR19MT0NLRD1t
CkNPTkZJR19MT0NLRF9WND15CkNPTkZJR19ORlNfQUNMX1NVUFBPUlQ9bQpDT05GSUdfTkZTX0NP
TU1PTj15CkNPTkZJR19ORlNfVjRfMl9TU0NfSEVMUEVSPW0KQ09ORklHX1NVTlJQQz1tCkNPTkZJ
R19TVU5SUENfR1NTPW0KQ09ORklHX1NVTlJQQ19CQUNLQ0hBTk5FTD15CkNPTkZJR19SUENTRUNf
R1NTX0tSQjU9bQojIENPTkZJR19TVU5SUENfRElTQUJMRV9JTlNFQ1VSRV9FTkNUWVBFUyBpcyBu
b3Qgc2V0CkNPTkZJR19TVU5SUENfREVCVUc9eQpDT05GSUdfU1VOUlBDX1hQUlRfUkRNQT1tCkNP
TkZJR19DRVBIX0ZTPW0KIyBDT05GSUdfQ0VQSF9GU0NBQ0hFIGlzIG5vdCBzZXQKQ09ORklHX0NF
UEhfRlNfUE9TSVhfQUNMPXkKQ09ORklHX0NFUEhfRlNfU0VDVVJJVFlfTEFCRUw9eQpDT05GSUdf
Q0lGUz1tCiMgQ09ORklHX0NJRlNfU1RBVFMyIGlzIG5vdCBzZXQKQ09ORklHX0NJRlNfQUxMT1df
SU5TRUNVUkVfTEVHQUNZPXkKQ09ORklHX0NJRlNfV0VBS19QV19IQVNIPXkKQ09ORklHX0NJRlNf
VVBDQUxMPXkKQ09ORklHX0NJRlNfWEFUVFI9eQpDT05GSUdfQ0lGU19QT1NJWD15CkNPTkZJR19D
SUZTX0RFQlVHPXkKIyBDT05GSUdfQ0lGU19ERUJVRzIgaXMgbm90IHNldAojIENPTkZJR19DSUZT
X0RFQlVHX0RVTVBfS0VZUyBpcyBub3Qgc2V0CkNPTkZJR19DSUZTX0RGU19VUENBTEw9eQojIENP
TkZJR19DSUZTX1NXTl9VUENBTEwgaXMgbm90IHNldAojIENPTkZJR19DSUZTX1NNQl9ESVJFQ1Qg
aXMgbm90IHNldAojIENPTkZJR19DSUZTX0ZTQ0FDSEUgaXMgbm90IHNldAojIENPTkZJR19DT0RB
X0ZTIGlzIG5vdCBzZXQKIyBDT05GSUdfQUZTX0ZTIGlzIG5vdCBzZXQKQ09ORklHX05MUz15CkNP
TkZJR19OTFNfREVGQVVMVD0idXRmOCIKQ09ORklHX05MU19DT0RFUEFHRV80Mzc9eQpDT05GSUdf
TkxTX0NPREVQQUdFXzczNz1tCkNPTkZJR19OTFNfQ09ERVBBR0VfNzc1PW0KQ09ORklHX05MU19D
T0RFUEFHRV84NTA9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg1Mj1tCkNPTkZJR19OTFNfQ09ERVBB
R0VfODU1PW0KQ09ORklHX05MU19DT0RFUEFHRV84NTc9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2
MD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODYxPW0KQ09ORklHX05MU19DT0RFUEFHRV84NjI9bQpD
T05GSUdfTkxTX0NPREVQQUdFXzg2Mz1tCkNPTkZJR19OTFNfQ09ERVBBR0VfODY0PW0KQ09ORklH
X05MU19DT0RFUEFHRV84NjU9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg2Nj1tCkNPTkZJR19OTFNf
Q09ERVBBR0VfODY5PW0KQ09ORklHX05MU19DT0RFUEFHRV85MzY9bQpDT05GSUdfTkxTX0NPREVQ
QUdFXzk1MD1tCkNPTkZJR19OTFNfQ09ERVBBR0VfOTMyPW0KQ09ORklHX05MU19DT0RFUEFHRV85
NDk9bQpDT05GSUdfTkxTX0NPREVQQUdFXzg3ND1tCkNPTkZJR19OTFNfSVNPODg1OV84PW0KQ09O
RklHX05MU19DT0RFUEFHRV8xMjUwPW0KQ09ORklHX05MU19DT0RFUEFHRV8xMjUxPW0KQ09ORklH
X05MU19BU0NJST15CkNPTkZJR19OTFNfSVNPODg1OV8xPW0KQ09ORklHX05MU19JU084ODU5XzI9
bQpDT05GSUdfTkxTX0lTTzg4NTlfMz1tCkNPTkZJR19OTFNfSVNPODg1OV80PW0KQ09ORklHX05M
U19JU084ODU5XzU9bQpDT05GSUdfTkxTX0lTTzg4NTlfNj1tCkNPTkZJR19OTFNfSVNPODg1OV83
PW0KQ09ORklHX05MU19JU084ODU5Xzk9bQpDT05GSUdfTkxTX0lTTzg4NTlfMTM9bQpDT05GSUdf
TkxTX0lTTzg4NTlfMTQ9bQpDT05GSUdfTkxTX0lTTzg4NTlfMTU9bQpDT05GSUdfTkxTX0tPSThf
Uj1tCkNPTkZJR19OTFNfS09JOF9VPW0KQ09ORklHX05MU19NQUNfUk9NQU49bQpDT05GSUdfTkxT
X01BQ19DRUxUSUM9bQpDT05GSUdfTkxTX01BQ19DRU5URVVSTz1tCkNPTkZJR19OTFNfTUFDX0NS
T0FUSUFOPW0KQ09ORklHX05MU19NQUNfQ1lSSUxMSUM9bQpDT05GSUdfTkxTX01BQ19HQUVMSUM9
bQpDT05GSUdfTkxTX01BQ19HUkVFSz1tCkNPTkZJR19OTFNfTUFDX0lDRUxBTkQ9bQpDT05GSUdf
TkxTX01BQ19JTlVJVD1tCkNPTkZJR19OTFNfTUFDX1JPTUFOSUFOPW0KQ09ORklHX05MU19NQUNf
VFVSS0lTSD1tCkNPTkZJR19OTFNfVVRGOD1tCkNPTkZJR19ETE09bQpDT05GSUdfRExNX0RFQlVH
PXkKIyBDT05GSUdfVU5JQ09ERSBpcyBub3Qgc2V0CkNPTkZJR19JT19XUT15CiMgZW5kIG9mIEZp
bGUgc3lzdGVtcwoKIwojIFNlY3VyaXR5IG9wdGlvbnMKIwpDT05GSUdfS0VZUz15CiMgQ09ORklH
X0tFWVNfUkVRVUVTVF9DQUNIRSBpcyBub3Qgc2V0CkNPTkZJR19QRVJTSVNURU5UX0tFWVJJTkdT
PXkKQ09ORklHX1RSVVNURURfS0VZUz15CkNPTkZJR19FTkNSWVBURURfS0VZUz15CiMgQ09ORklH
X0tFWV9ESF9PUEVSQVRJT05TIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfRE1FU0dfUkVT
VFJJQ1QgaXMgbm90IHNldApDT05GSUdfU0VDVVJJVFk9eQpDT05GSUdfU0VDVVJJVFlfV1JJVEFC
TEVfSE9PS1M9eQpDT05GSUdfU0VDVVJJVFlGUz15CkNPTkZJR19TRUNVUklUWV9ORVRXT1JLPXkK
Q09ORklHX1BBR0VfVEFCTEVfSVNPTEFUSU9OPXkKQ09ORklHX1NFQ1VSSVRZX0lORklOSUJBTkQ9
eQpDT05GSUdfU0VDVVJJVFlfTkVUV09SS19YRlJNPXkKIyBDT05GSUdfU0VDVVJJVFlfUEFUSCBp
cyBub3Qgc2V0CkNPTkZJR19JTlRFTF9UWFQ9eQpDT05GSUdfTFNNX01NQVBfTUlOX0FERFI9NjU1
MzUKQ09ORklHX0hBVkVfSEFSREVORURfVVNFUkNPUFlfQUxMT0NBVE9SPXkKQ09ORklHX0hBUkRF
TkVEX1VTRVJDT1BZPXkKQ09ORklHX0hBUkRFTkVEX1VTRVJDT1BZX0ZBTExCQUNLPXkKQ09ORklH
X0ZPUlRJRllfU09VUkNFPXkKIyBDT05GSUdfU1RBVElDX1VTRVJNT0RFSEVMUEVSIGlzIG5vdCBz
ZXQKQ09ORklHX1NFQ1VSSVRZX1NFTElOVVg9eQpDT05GSUdfU0VDVVJJVFlfU0VMSU5VWF9CT09U
UEFSQU09eQpDT05GSUdfU0VDVVJJVFlfU0VMSU5VWF9ESVNBQkxFPXkKQ09ORklHX1NFQ1VSSVRZ
X1NFTElOVVhfREVWRUxPUD15CkNPTkZJR19TRUNVUklUWV9TRUxJTlVYX0FWQ19TVEFUUz15CkNP
TkZJR19TRUNVUklUWV9TRUxJTlVYX0NIRUNLUkVRUFJPVF9WQUxVRT0xCkNPTkZJR19TRUNVUklU
WV9TRUxJTlVYX1NJRFRBQl9IQVNIX0JJVFM9OQpDT05GSUdfU0VDVVJJVFlfU0VMSU5VWF9TSUQy
U1RSX0NBQ0hFX1NJWkU9MjU2CiMgQ09ORklHX1NFQ1VSSVRZX1NNQUNLIGlzIG5vdCBzZXQKIyBD
T05GSUdfU0VDVVJJVFlfVE9NT1lPIGlzIG5vdCBzZXQKIyBDT05GSUdfU0VDVVJJVFlfQVBQQVJN
T1IgaXMgbm90IHNldAojIENPTkZJR19TRUNVUklUWV9MT0FEUElOIGlzIG5vdCBzZXQKQ09ORklH
X1NFQ1VSSVRZX1lBTUE9eQojIENPTkZJR19TRUNVUklUWV9TQUZFU0VUSUQgaXMgbm90IHNldAoj
IENPTkZJR19TRUNVUklUWV9MT0NLRE9XTl9MU00gaXMgbm90IHNldApDT05GSUdfSU5URUdSSVRZ
PXkKQ09ORklHX0lOVEVHUklUWV9TSUdOQVRVUkU9eQpDT05GSUdfSU5URUdSSVRZX0FTWU1NRVRS
SUNfS0VZUz15CkNPTkZJR19JTlRFR1JJVFlfVFJVU1RFRF9LRVlSSU5HPXkKQ09ORklHX0lOVEVH
UklUWV9QTEFURk9STV9LRVlSSU5HPXkKQ09ORklHX0xPQURfVUVGSV9LRVlTPXkKQ09ORklHX0lO
VEVHUklUWV9BVURJVD15CkNPTkZJR19JTUE9eQpDT05GSUdfSU1BX01FQVNVUkVfUENSX0lEWD0x
MApDT05GSUdfSU1BX0xTTV9SVUxFUz15CiMgQ09ORklHX0lNQV9URU1QTEFURSBpcyBub3Qgc2V0
CkNPTkZJR19JTUFfTkdfVEVNUExBVEU9eQojIENPTkZJR19JTUFfU0lHX1RFTVBMQVRFIGlzIG5v
dCBzZXQKQ09ORklHX0lNQV9ERUZBVUxUX1RFTVBMQVRFPSJpbWEtbmciCkNPTkZJR19JTUFfREVG
QVVMVF9IQVNIX1NIQTE9eQojIENPTkZJR19JTUFfREVGQVVMVF9IQVNIX1NIQTI1NiBpcyBub3Qg
c2V0CkNPTkZJR19JTUFfREVGQVVMVF9IQVNIPSJzaGExIgojIENPTkZJR19JTUFfV1JJVEVfUE9M
SUNZIGlzIG5vdCBzZXQKIyBDT05GSUdfSU1BX1JFQURfUE9MSUNZIGlzIG5vdCBzZXQKQ09ORklH
X0lNQV9BUFBSQUlTRT15CiMgQ09ORklHX0lNQV9BUkNIX1BPTElDWSBpcyBub3Qgc2V0CiMgQ09O
RklHX0lNQV9BUFBSQUlTRV9CVUlMRF9QT0xJQ1kgaXMgbm90IHNldApDT05GSUdfSU1BX0FQUFJB
SVNFX0JPT1RQQVJBTT15CiMgQ09ORklHX0lNQV9BUFBSQUlTRV9NT0RTSUcgaXMgbm90IHNldApD
T05GSUdfSU1BX1RSVVNURURfS0VZUklORz15CiMgQ09ORklHX0lNQV9CTEFDS0xJU1RfS0VZUklO
RyBpcyBub3Qgc2V0CiMgQ09ORklHX0lNQV9MT0FEX1g1MDkgaXMgbm90IHNldApDT05GSUdfSU1B
X01FQVNVUkVfQVNZTU1FVFJJQ19LRVlTPXkKQ09ORklHX0lNQV9RVUVVRV9FQVJMWV9CT09UX0tF
WVM9eQojIENPTkZJR19JTUFfU0VDVVJFX0FORF9PUl9UUlVTVEVEX0JPT1QgaXMgbm90IHNldApD
T05GSUdfRVZNPXkKQ09ORklHX0VWTV9BVFRSX0ZTVVVJRD15CiMgQ09ORklHX0VWTV9BRERfWEFU
VFJTIGlzIG5vdCBzZXQKIyBDT05GSUdfRVZNX0xPQURfWDUwOSBpcyBub3Qgc2V0CkNPTkZJR19E
RUZBVUxUX1NFQ1VSSVRZX1NFTElOVVg9eQojIENPTkZJR19ERUZBVUxUX1NFQ1VSSVRZX0RBQyBp
cyBub3Qgc2V0CkNPTkZJR19MU009ImxvY2tkb3duLHlhbWEsbG9hZHBpbixzYWZlc2V0aWQsaW50
ZWdyaXR5LHNlbGludXgsc21hY2ssdG9tb3lvLGFwcGFybW9yLGJwZiIKCiMKIyBLZXJuZWwgaGFy
ZGVuaW5nIG9wdGlvbnMKIwoKIwojIE1lbW9yeSBpbml0aWFsaXphdGlvbgojCkNPTkZJR19JTklU
X1NUQUNLX05PTkU9eQojIENPTkZJR19JTklUX09OX0FMTE9DX0RFRkFVTFRfT04gaXMgbm90IHNl
dAojIENPTkZJR19JTklUX09OX0ZSRUVfREVGQVVMVF9PTiBpcyBub3Qgc2V0CiMgZW5kIG9mIE1l
bW9yeSBpbml0aWFsaXphdGlvbgojIGVuZCBvZiBLZXJuZWwgaGFyZGVuaW5nIG9wdGlvbnMKIyBl
bmQgb2YgU2VjdXJpdHkgb3B0aW9ucwoKQ09ORklHX1hPUl9CTE9DS1M9bQpDT05GSUdfQVNZTkNf
Q09SRT1tCkNPTkZJR19BU1lOQ19NRU1DUFk9bQpDT05GSUdfQVNZTkNfWE9SPW0KQ09ORklHX0FT
WU5DX1BRPW0KQ09ORklHX0FTWU5DX1JBSUQ2X1JFQ09WPW0KQ09ORklHX0NSWVBUTz15CgojCiMg
Q3J5cHRvIGNvcmUgb3IgaGVscGVyCiMKQ09ORklHX0NSWVBUT19GSVBTPXkKQ09ORklHX0NSWVBU
T19BTEdBUEk9eQpDT05GSUdfQ1JZUFRPX0FMR0FQSTI9eQpDT05GSUdfQ1JZUFRPX0FFQUQ9eQpD
T05GSUdfQ1JZUFRPX0FFQUQyPXkKQ09ORklHX0NSWVBUT19TS0NJUEhFUj15CkNPTkZJR19DUllQ
VE9fU0tDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19IQVNIPXkKQ09ORklHX0NSWVBUT19IQVNIMj15
CkNPTkZJR19DUllQVE9fUk5HPXkKQ09ORklHX0NSWVBUT19STkcyPXkKQ09ORklHX0NSWVBUT19S
TkdfREVGQVVMVD1tCkNPTkZJR19DUllQVE9fQUtDSVBIRVIyPXkKQ09ORklHX0NSWVBUT19BS0NJ
UEhFUj15CkNPTkZJR19DUllQVE9fS1BQMj15CkNPTkZJR19DUllQVE9fS1BQPW0KQ09ORklHX0NS
WVBUT19BQ09NUDI9eQpDT05GSUdfQ1JZUFRPX01BTkFHRVI9eQpDT05GSUdfQ1JZUFRPX01BTkFH
RVIyPXkKQ09ORklHX0NSWVBUT19VU0VSPW0KIyBDT05GSUdfQ1JZUFRPX01BTkFHRVJfRElTQUJM
RV9URVNUUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19NQU5BR0VSX0VYVFJBX1RFU1RTIGlz
IG5vdCBzZXQKQ09ORklHX0NSWVBUT19HRjEyOE1VTD15CkNPTkZJR19DUllQVE9fTlVMTD15CkNP
TkZJR19DUllQVE9fTlVMTDI9eQpDT05GSUdfQ1JZUFRPX1BDUllQVD1tCkNPTkZJR19DUllQVE9f
Q1JZUFREPXkKQ09ORklHX0NSWVBUT19BVVRIRU5DPXkKQ09ORklHX0NSWVBUT19URVNUPW0KQ09O
RklHX0NSWVBUT19TSU1EPXkKCiMKIyBQdWJsaWMta2V5IGNyeXB0b2dyYXBoeQojCkNPTkZJR19D
UllQVE9fUlNBPXkKQ09ORklHX0NSWVBUT19ESD1tCkNPTkZJR19DUllQVE9fRUNDPW0KQ09ORklH
X0NSWVBUT19FQ0RIPW0KIyBDT05GSUdfQ1JZUFRPX0VDUkRTQSBpcyBub3Qgc2V0CiMgQ09ORklH
X0NSWVBUT19TTTIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQ1VSVkUyNTUxOSBpcyBub3Qg
c2V0CiMgQ09ORklHX0NSWVBUT19DVVJWRTI1NTE5X1g4NiBpcyBub3Qgc2V0CgojCiMgQXV0aGVu
dGljYXRlZCBFbmNyeXB0aW9uIHdpdGggQXNzb2NpYXRlZCBEYXRhCiMKQ09ORklHX0NSWVBUT19D
Q009bQpDT05GSUdfQ1JZUFRPX0dDTT15CkNPTkZJR19DUllQVE9fQ0hBQ0hBMjBQT0xZMTMwNT1t
CiMgQ09ORklHX0NSWVBUT19BRUdJUzEyOCBpcyBub3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BRUdJ
UzEyOF9BRVNOSV9TU0UyIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19TRVFJVj1tCkNPTkZJR19D
UllQVE9fRUNIQUlOSVY9bQoKIwojIEJsb2NrIG1vZGVzCiMKQ09ORklHX0NSWVBUT19DQkM9eQpD
T05GSUdfQ1JZUFRPX0NGQj15CkNPTkZJR19DUllQVE9fQ1RSPXkKQ09ORklHX0NSWVBUT19DVFM9
eQpDT05GSUdfQ1JZUFRPX0VDQj15CkNPTkZJR19DUllQVE9fTFJXPW0KIyBDT05GSUdfQ1JZUFRP
X09GQiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fUENCQz1tCkNPTkZJR19DUllQVE9fWFRTPW0K
IyBDT05GSUdfQ1JZUFRPX0tFWVdSQVAgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTkhQT0xZ
MTMwNV9TU0UyIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX05IUE9MWTEzMDVfQVZYMiBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19BRElBTlRVTSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9f
RVNTSVY9eQoKIwojIEhhc2ggbW9kZXMKIwpDT05GSUdfQ1JZUFRPX0NNQUM9bQpDT05GSUdfQ1JZ
UFRPX0hNQUM9eQpDT05GSUdfQ1JZUFRPX1hDQkM9bQpDT05GSUdfQ1JZUFRPX1ZNQUM9bQoKIwoj
IERpZ2VzdAojCkNPTkZJR19DUllQVE9fQ1JDMzJDPXkKQ09ORklHX0NSWVBUT19DUkMzMkNfSU5U
RUw9bQpDT05GSUdfQ1JZUFRPX0NSQzMyPW0KQ09ORklHX0NSWVBUT19DUkMzMl9QQ0xNVUw9bQoj
IENPTkZJR19DUllQVE9fWFhIQVNIIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0JMQUtFMkIg
aXMgbm90IHNldAojIENPTkZJR19DUllQVE9fQkxBS0UyUyBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19CTEFLRTJTX1g4NiBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fQ1JDVDEwRElGPXkKQ09O
RklHX0NSWVBUT19DUkNUMTBESUZfUENMTVVMPW0KQ09ORklHX0NSWVBUT19HSEFTSD15CkNPTkZJ
R19DUllQVE9fUE9MWTEzMDU9bQpDT05GSUdfQ1JZUFRPX1BPTFkxMzA1X1g4Nl82ND1tCkNPTkZJ
R19DUllQVE9fTUQ0PW0KQ09ORklHX0NSWVBUT19NRDU9eQpDT05GSUdfQ1JZUFRPX01JQ0hBRUxf
TUlDPW0KQ09ORklHX0NSWVBUT19STUQxNjA9bQpDT05GSUdfQ1JZUFRPX1NIQTE9eQpDT05GSUdf
Q1JZUFRPX1NIQTFfU1NTRTM9eQpDT05GSUdfQ1JZUFRPX1NIQTI1Nl9TU1NFMz15CkNPTkZJR19D
UllQVE9fU0hBNTEyX1NTU0UzPW0KQ09ORklHX0NSWVBUT19TSEEyNTY9eQpDT05GSUdfQ1JZUFRP
X1NIQTUxMj1tCkNPTkZJR19DUllQVE9fU0hBMz1tCiMgQ09ORklHX0NSWVBUT19TTTMgaXMgbm90
IHNldAojIENPTkZJR19DUllQVE9fU1RSRUVCT0cgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX1dQ
NTEyPW0KQ09ORklHX0NSWVBUT19HSEFTSF9DTE1VTF9OSV9JTlRFTD1tCgojCiMgQ2lwaGVycwoj
CkNPTkZJR19DUllQVE9fQUVTPXkKIyBDT05GSUdfQ1JZUFRPX0FFU19USSBpcyBub3Qgc2V0CkNP
TkZJR19DUllQVE9fQUVTX05JX0lOVEVMPXkKQ09ORklHX0NSWVBUT19BTlVCSVM9bQpDT05GSUdf
Q1JZUFRPX0FSQzQ9bQpDT05GSUdfQ1JZUFRPX0JMT1dGSVNIPW0KQ09ORklHX0NSWVBUT19CTE9X
RklTSF9DT01NT049bQpDT05GSUdfQ1JZUFRPX0JMT1dGSVNIX1g4Nl82ND1tCkNPTkZJR19DUllQ
VE9fQ0FNRUxMSUE9bQpDT05GSUdfQ1JZUFRPX0NBTUVMTElBX1g4Nl82ND1tCkNPTkZJR19DUllQ
VE9fQ0FNRUxMSUFfQUVTTklfQVZYX1g4Nl82ND1tCkNPTkZJR19DUllQVE9fQ0FNRUxMSUFfQUVT
TklfQVZYMl9YODZfNjQ9bQpDT05GSUdfQ1JZUFRPX0NBU1RfQ09NTU9OPW0KQ09ORklHX0NSWVBU
T19DQVNUNT1tCkNPTkZJR19DUllQVE9fQ0FTVDVfQVZYX1g4Nl82ND1tCkNPTkZJR19DUllQVE9f
Q0FTVDY9bQpDT05GSUdfQ1JZUFRPX0NBU1Q2X0FWWF9YODZfNjQ9bQpDT05GSUdfQ1JZUFRPX0RF
Uz1tCkNPTkZJR19DUllQVE9fREVTM19FREVfWDg2XzY0PW0KQ09ORklHX0NSWVBUT19GQ1JZUFQ9
bQpDT05GSUdfQ1JZUFRPX0tIQVpBRD1tCkNPTkZJR19DUllQVE9fQ0hBQ0hBMjA9bQpDT05GSUdf
Q1JZUFRPX0NIQUNIQTIwX1g4Nl82ND1tCkNPTkZJR19DUllQVE9fU0VFRD1tCkNPTkZJR19DUllQ
VE9fU0VSUEVOVD1tCkNPTkZJR19DUllQVE9fU0VSUEVOVF9TU0UyX1g4Nl82ND1tCkNPTkZJR19D
UllQVE9fU0VSUEVOVF9BVlhfWDg2XzY0PW0KQ09ORklHX0NSWVBUT19TRVJQRU5UX0FWWDJfWDg2
XzY0PW0KIyBDT05GSUdfQ1JZUFRPX1NNNCBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fVEVBPW0K
Q09ORklHX0NSWVBUT19UV09GSVNIPW0KQ09ORklHX0NSWVBUT19UV09GSVNIX0NPTU1PTj1tCkNP
TkZJR19DUllQVE9fVFdPRklTSF9YODZfNjQ9bQpDT05GSUdfQ1JZUFRPX1RXT0ZJU0hfWDg2XzY0
XzNXQVk9bQpDT05GSUdfQ1JZUFRPX1RXT0ZJU0hfQVZYX1g4Nl82ND1tCgojCiMgQ29tcHJlc3Np
b24KIwpDT05GSUdfQ1JZUFRPX0RFRkxBVEU9eQpDT05GSUdfQ1JZUFRPX0xaTz15CiMgQ09ORklH
X0NSWVBUT184NDIgaXMgbm90IHNldAojIENPTkZJR19DUllQVE9fTFo0IGlzIG5vdCBzZXQKIyBD
T05GSUdfQ1JZUFRPX0xaNEhDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX1pTVEQgaXMgbm90
IHNldAoKIwojIFJhbmRvbSBOdW1iZXIgR2VuZXJhdGlvbgojCkNPTkZJR19DUllQVE9fQU5TSV9D
UFJORz1tCkNPTkZJR19DUllQVE9fRFJCR19NRU5VPXkKQ09ORklHX0NSWVBUT19EUkJHX0hNQUM9
eQpDT05GSUdfQ1JZUFRPX0RSQkdfSEFTSD15CkNPTkZJR19DUllQVE9fRFJCR19DVFI9eQpDT05G
SUdfQ1JZUFRPX0RSQkc9eQpDT05GSUdfQ1JZUFRPX0pJVFRFUkVOVFJPUFk9eQpDT05GSUdfQ1JZ
UFRPX1VTRVJfQVBJPXkKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9IQVNIPXkKQ09ORklHX0NSWVBU
T19VU0VSX0FQSV9TS0NJUEhFUj15CkNPTkZJR19DUllQVE9fVVNFUl9BUElfUk5HPXkKIyBDT05G
SUdfQ1JZUFRPX1VTRVJfQVBJX1JOR19DQVZQIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19VU0VS
X0FQSV9BRUFEPXkKQ09ORklHX0NSWVBUT19VU0VSX0FQSV9FTkFCTEVfT0JTT0xFVEU9eQojIENP
TkZJR19DUllQVE9fU1RBVFMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0hBU0hfSU5GTz15Cgoj
CiMgQ3J5cHRvIGxpYnJhcnkgcm91dGluZXMKIwpDT05GSUdfQ1JZUFRPX0xJQl9BRVM9eQpDT05G
SUdfQ1JZUFRPX0xJQl9BUkM0PW0KIyBDT05GSUdfQ1JZUFRPX0xJQl9CTEFLRTJTIGlzIG5vdCBz
ZXQKQ09ORklHX0NSWVBUT19BUkNIX0hBVkVfTElCX0NIQUNIQT1tCkNPTkZJR19DUllQVE9fTElC
X0NIQUNIQV9HRU5FUklDPW0KIyBDT05GSUdfQ1JZUFRPX0xJQl9DSEFDSEEgaXMgbm90IHNldAoj
IENPTkZJR19DUllQVE9fTElCX0NVUlZFMjU1MTkgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0xJ
Ql9ERVM9bQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNV9SU0laRT0xMQpDT05GSUdfQ1JZUFRP
X0FSQ0hfSEFWRV9MSUJfUE9MWTEzMDU9bQpDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNV9HRU5F
UklDPW0KIyBDT05GSUdfQ1JZUFRPX0xJQl9QT0xZMTMwNSBpcyBub3Qgc2V0CiMgQ09ORklHX0NS
WVBUT19MSUJfQ0hBQ0hBMjBQT0xZMTMwNSBpcyBub3Qgc2V0CkNPTkZJR19DUllQVE9fTElCX1NI
QTI1Nj15CkNPTkZJR19DUllQVE9fSFc9eQpDT05GSUdfQ1JZUFRPX0RFVl9QQURMT0NLPW0KQ09O
RklHX0NSWVBUT19ERVZfUEFETE9DS19BRVM9bQpDT05GSUdfQ1JZUFRPX0RFVl9QQURMT0NLX1NI
QT1tCiMgQ09ORklHX0NSWVBUT19ERVZfQVRNRUxfRUNDIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZ
UFRPX0RFVl9BVE1FTF9TSEEyMDRBIGlzIG5vdCBzZXQKQ09ORklHX0NSWVBUT19ERVZfQ0NQPXkK
Q09ORklHX0NSWVBUT19ERVZfQ0NQX0REPW0KQ09ORklHX0NSWVBUT19ERVZfU1BfQ0NQPXkKQ09O
RklHX0NSWVBUT19ERVZfQ0NQX0NSWVBUTz1tCkNPTkZJR19DUllQVE9fREVWX1NQX1BTUD15CiMg
Q09ORklHX0NSWVBUT19ERVZfQ0NQX0RFQlVHRlMgaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RF
Vl9RQVQ9bQpDT05GSUdfQ1JZUFRPX0RFVl9RQVRfREg4OTV4Q0M9bQpDT05GSUdfQ1JZUFRPX0RF
Vl9RQVRfQzNYWFg9bQpDT05GSUdfQ1JZUFRPX0RFVl9RQVRfQzYyWD1tCiMgQ09ORklHX0NSWVBU
T19ERVZfUUFUXzRYWFggaXMgbm90IHNldApDT05GSUdfQ1JZUFRPX0RFVl9RQVRfREg4OTV4Q0NW
Rj1tCkNPTkZJR19DUllQVE9fREVWX1FBVF9DM1hYWFZGPW0KQ09ORklHX0NSWVBUT19ERVZfUUFU
X0M2MlhWRj1tCkNPTkZJR19DUllQVE9fREVWX05JVFJPWD1tCkNPTkZJR19DUllQVE9fREVWX05J
VFJPWF9DTk41NVhYPW0KQ09ORklHX0NSWVBUT19ERVZfQ0hFTFNJTz1tCiMgQ09ORklHX0NSWVBU
T19ERVZfVklSVElPIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JZUFRPX0RFVl9TQUZFWENFTCBpcyBu
b3Qgc2V0CiMgQ09ORklHX0NSWVBUT19ERVZfQU1MT0dJQ19HWEwgaXMgbm90IHNldApDT05GSUdf
QVNZTU1FVFJJQ19LRVlfVFlQRT15CkNPTkZJR19BU1lNTUVUUklDX1BVQkxJQ19LRVlfU1VCVFlQ
RT15CiMgQ09ORklHX0FTWU1NRVRSSUNfVFBNX0tFWV9TVUJUWVBFIGlzIG5vdCBzZXQKQ09ORklH
X1g1MDlfQ0VSVElGSUNBVEVfUEFSU0VSPXkKIyBDT05GSUdfUEtDUzhfUFJJVkFURV9LRVlfUEFS
U0VSIGlzIG5vdCBzZXQKQ09ORklHX1BLQ1M3X01FU1NBR0VfUEFSU0VSPXkKIyBDT05GSUdfUEtD
UzdfVEVTVF9LRVkgaXMgbm90IHNldApDT05GSUdfU0lHTkVEX1BFX0ZJTEVfVkVSSUZJQ0FUSU9O
PXkKCiMKIyBDZXJ0aWZpY2F0ZXMgZm9yIHNpZ25hdHVyZSBjaGVja2luZwojCkNPTkZJR19NT0RV
TEVfU0lHX0tFWT0iY2VydHMvc2lnbmluZ19rZXkucGVtIgpDT05GSUdfU1lTVEVNX1RSVVNURURf
S0VZUklORz15CkNPTkZJR19TWVNURU1fVFJVU1RFRF9LRVlTPSIiCiMgQ09ORklHX1NZU1RFTV9F
WFRSQV9DRVJUSUZJQ0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX1NFQ09OREFSWV9UUlVTVEVEX0tF
WVJJTkcgaXMgbm90IHNldApDT05GSUdfU1lTVEVNX0JMQUNLTElTVF9LRVlSSU5HPXkKQ09ORklH
X1NZU1RFTV9CTEFDS0xJU1RfSEFTSF9MSVNUPSIiCiMgZW5kIG9mIENlcnRpZmljYXRlcyBmb3Ig
c2lnbmF0dXJlIGNoZWNraW5nCgpDT05GSUdfQklOQVJZX1BSSU5URj15CgojCiMgTGlicmFyeSBy
b3V0aW5lcwojCkNPTkZJR19SQUlENl9QUT1tCkNPTkZJR19SQUlENl9QUV9CRU5DSE1BUks9eQoj
IENPTkZJR19QQUNLSU5HIGlzIG5vdCBzZXQKQ09ORklHX0JJVFJFVkVSU0U9eQpDT05GSUdfR0VO
RVJJQ19TVFJOQ1BZX0ZST01fVVNFUj15CkNPTkZJR19HRU5FUklDX1NUUk5MRU5fVVNFUj15CkNP
TkZJR19HRU5FUklDX05FVF9VVElMUz15CkNPTkZJR19HRU5FUklDX0ZJTkRfRklSU1RfQklUPXkK
Q09ORklHX0NPUkRJQz1tCiMgQ09ORklHX1BSSU1FX05VTUJFUlMgaXMgbm90IHNldApDT05GSUdf
UkFUSU9OQUw9eQpDT05GSUdfR0VORVJJQ19QQ0lfSU9NQVA9eQpDT05GSUdfR0VORVJJQ19JT01B
UD15CkNPTkZJR19BUkNIX1VTRV9DTVBYQ0hHX0xPQ0tSRUY9eQpDT05GSUdfQVJDSF9IQVNfRkFT
VF9NVUxUSVBMSUVSPXkKQ09ORklHX0FSQ0hfVVNFX1NZTV9BTk5PVEFUSU9OUz15CkNPTkZJR19D
UkNfQ0NJVFQ9eQpDT05GSUdfQ1JDMTY9eQpDT05GSUdfQ1JDX1QxMERJRj15CkNPTkZJR19DUkNf
SVRVX1Q9bQpDT05GSUdfQ1JDMzI9eQojIENPTkZJR19DUkMzMl9TRUxGVEVTVCBpcyBub3Qgc2V0
CkNPTkZJR19DUkMzMl9TTElDRUJZOD15CiMgQ09ORklHX0NSQzMyX1NMSUNFQlk0IGlzIG5vdCBz
ZXQKIyBDT05GSUdfQ1JDMzJfU0FSV0FURSBpcyBub3Qgc2V0CiMgQ09ORklHX0NSQzMyX0JJVCBp
cyBub3Qgc2V0CiMgQ09ORklHX0NSQzY0IGlzIG5vdCBzZXQKIyBDT05GSUdfQ1JDNCBpcyBub3Qg
c2V0CkNPTkZJR19DUkM3PW0KQ09ORklHX0xJQkNSQzMyQz1tCkNPTkZJR19DUkM4PW0KQ09ORklH
X1hYSEFTSD15CiMgQ09ORklHX1JBTkRPTTMyX1NFTEZURVNUIGlzIG5vdCBzZXQKQ09ORklHX1pM
SUJfSU5GTEFURT15CkNPTkZJR19aTElCX0RFRkxBVEU9eQpDT05GSUdfTFpPX0NPTVBSRVNTPXkK
Q09ORklHX0xaT19ERUNPTVBSRVNTPXkKQ09ORklHX0xaNF9ERUNPTVBSRVNTPXkKQ09ORklHX1pT
VERfREVDT01QUkVTUz15CkNPTkZJR19YWl9ERUM9eQpDT05GSUdfWFpfREVDX1g4Nj15CkNPTkZJ
R19YWl9ERUNfUE9XRVJQQz15CkNPTkZJR19YWl9ERUNfSUE2ND15CkNPTkZJR19YWl9ERUNfQVJN
PXkKQ09ORklHX1haX0RFQ19BUk1USFVNQj15CkNPTkZJR19YWl9ERUNfU1BBUkM9eQpDT05GSUdf
WFpfREVDX0JDSj15CiMgQ09ORklHX1haX0RFQ19URVNUIGlzIG5vdCBzZXQKQ09ORklHX0RFQ09N
UFJFU1NfR1pJUD15CkNPTkZJR19ERUNPTVBSRVNTX0JaSVAyPXkKQ09ORklHX0RFQ09NUFJFU1Nf
TFpNQT15CkNPTkZJR19ERUNPTVBSRVNTX1haPXkKQ09ORklHX0RFQ09NUFJFU1NfTFpPPXkKQ09O
RklHX0RFQ09NUFJFU1NfTFo0PXkKQ09ORklHX0RFQ09NUFJFU1NfWlNURD15CkNPTkZJR19HRU5F
UklDX0FMTE9DQVRPUj15CkNPTkZJR19SRUVEX1NPTE9NT049bQpDT05GSUdfUkVFRF9TT0xPTU9O
X0VOQzg9eQpDT05GSUdfUkVFRF9TT0xPTU9OX0RFQzg9eQpDT05GSUdfVEVYVFNFQVJDSD15CkNP
TkZJR19URVhUU0VBUkNIX0tNUD1tCkNPTkZJR19URVhUU0VBUkNIX0JNPW0KQ09ORklHX1RFWFRT
RUFSQ0hfRlNNPW0KQ09ORklHX0JUUkVFPXkKQ09ORklHX0lOVEVSVkFMX1RSRUU9eQpDT05GSUdf
WEFSUkFZX01VTFRJPXkKQ09ORklHX0FTU09DSUFUSVZFX0FSUkFZPXkKQ09ORklHX0hBU19JT01F
TT15CkNPTkZJR19IQVNfSU9QT1JUX01BUD15CkNPTkZJR19IQVNfRE1BPXkKQ09ORklHX0RNQV9P
UFM9eQpDT05GSUdfTkVFRF9TR19ETUFfTEVOR1RIPXkKQ09ORklHX05FRURfRE1BX01BUF9TVEFU
RT15CkNPTkZJR19BUkNIX0RNQV9BRERSX1RfNjRCSVQ9eQpDT05GSUdfQVJDSF9IQVNfRk9SQ0Vf
RE1BX1VORU5DUllQVEVEPXkKQ09ORklHX1NXSU9UTEI9eQpDT05GSUdfRE1BX0NPSEVSRU5UX1BP
T0w9eQojIENPTkZJR19ETUFfQVBJX0RFQlVHIGlzIG5vdCBzZXQKIyBDT05GSUdfRE1BX01BUF9C
RU5DSE1BUksgaXMgbm90IHNldApDT05GSUdfU0dMX0FMTE9DPXkKQ09ORklHX0NIRUNLX1NJR05B
VFVSRT15CkNPTkZJR19DUFVNQVNLX09GRlNUQUNLPXkKQ09ORklHX0NQVV9STUFQPXkKQ09ORklH
X0RRTD15CkNPTkZJR19HTE9CPXkKIyBDT05GSUdfR0xPQl9TRUxGVEVTVCBpcyBub3Qgc2V0CkNP
TkZJR19OTEFUVFI9eQpDT05GSUdfQ0xaX1RBQj15CkNPTkZJR19JUlFfUE9MTD15CkNPTkZJR19N
UElMSUI9eQpDT05GSUdfU0lHTkFUVVJFPXkKQ09ORklHX0RJTUxJQj15CkNPTkZJR19PSURfUkVH
SVNUUlk9eQpDT05GSUdfVUNTMl9TVFJJTkc9eQpDT05GSUdfSEFWRV9HRU5FUklDX1ZEU089eQpD
T05GSUdfR0VORVJJQ19HRVRUSU1FT0ZEQVk9eQpDT05GSUdfR0VORVJJQ19WRFNPX1RJTUVfTlM9
eQpDT05GSUdfRk9OVF9TVVBQT1JUPXkKIyBDT05GSUdfRk9OVFMgaXMgbm90IHNldApDT05GSUdf
Rk9OVF84eDg9eQpDT05GSUdfRk9OVF84eDE2PXkKQ09ORklHX1NHX1BPT0w9eQpDT05GSUdfQVJD
SF9IQVNfUE1FTV9BUEk9eQpDT05GSUdfTUVNUkVHSU9OPXkKQ09ORklHX0FSQ0hfSEFTX1VBQ0NF
U1NfRkxVU0hDQUNIRT15CkNPTkZJR19BUkNIX0hBU19DT1BZX01DPXkKQ09ORklHX0FSQ0hfU1RB
Q0tXQUxLPXkKQ09ORklHX1NUQUNLREVQT1Q9eQpDT05GSUdfU1RBQ0tfSEFTSF9PUkRFUj0yMApD
T05GSUdfU0JJVE1BUD15CkNPTkZJR19QQVJNQU49bQpDT05GSUdfT0JKQUdHPW0KIyBDT05GSUdf
U1RSSU5HX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBlbmQgb2YgTGlicmFyeSByb3V0aW5lcwoKQ09O
RklHX1BMRE1GVz15CgojCiMgS2VybmVsIGhhY2tpbmcKIwoKIwojIHByaW50ayBhbmQgZG1lc2cg
b3B0aW9ucwojCkNPTkZJR19QUklOVEtfVElNRT15CiMgQ09ORklHX1BSSU5US19DQUxMRVIgaXMg
bm90IHNldApDT05GSUdfQ09OU09MRV9MT0dMRVZFTF9ERUZBVUxUPTcKQ09ORklHX0NPTlNPTEVf
TE9HTEVWRUxfUVVJRVQ9NApDT05GSUdfTUVTU0FHRV9MT0dMRVZFTF9ERUZBVUxUPTQKQ09ORklH
X0JPT1RfUFJJTlRLX0RFTEFZPXkKQ09ORklHX0RZTkFNSUNfREVCVUc9eQpDT05GSUdfRFlOQU1J
Q19ERUJVR19DT1JFPXkKQ09ORklHX1NZTUJPTElDX0VSUk5BTUU9eQpDT05GSUdfREVCVUdfQlVH
VkVSQk9TRT15CiMgZW5kIG9mIHByaW50ayBhbmQgZG1lc2cgb3B0aW9ucwoKIwojIENvbXBpbGUt
dGltZSBjaGVja3MgYW5kIGNvbXBpbGVyIG9wdGlvbnMKIwpDT05GSUdfREVCVUdfSU5GTz15CiMg
Q09ORklHX0RFQlVHX0lORk9fUkVEVUNFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lORk9f
Q09NUFJFU1NFRCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0lORk9fU1BMSVQgaXMgbm90IHNl
dApDT05GSUdfREVCVUdfSU5GT19EV0FSRl9UT09MQ0hBSU5fREVGQVVMVD15CiMgQ09ORklHX0RF
QlVHX0lORk9fRFdBUkY0IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfSU5GT19EV0FSRjUgaXMg
bm90IHNldAojIENPTkZJR19ERUJVR19JTkZPX0JURiBpcyBub3Qgc2V0CiMgQ09ORklHX0dEQl9T
Q1JJUFRTIGlzIG5vdCBzZXQKQ09ORklHX0ZSQU1FX1dBUk49MjA0OApDT05GSUdfU1RSSVBfQVNN
X1NZTVM9eQojIENPTkZJR19SRUFEQUJMRV9BU00gaXMgbm90IHNldAojIENPTkZJR19IRUFERVJT
X0lOU1RBTEwgaXMgbm90IHNldApDT05GSUdfREVCVUdfU0VDVElPTl9NSVNNQVRDSD15CkNPTkZJ
R19TRUNUSU9OX01JU01BVENIX1dBUk5fT05MWT15CkNPTkZJR19TVEFDS19WQUxJREFUSU9OPXkK
IyBDT05GSUdfREVCVUdfRk9SQ0VfV0VBS19QRVJfQ1BVIGlzIG5vdCBzZXQKIyBlbmQgb2YgQ29t
cGlsZS10aW1lIGNoZWNrcyBhbmQgY29tcGlsZXIgb3B0aW9ucwoKIwojIEdlbmVyaWMgS2VybmVs
IERlYnVnZ2luZyBJbnN0cnVtZW50cwojCkNPTkZJR19NQUdJQ19TWVNSUT15CkNPTkZJR19NQUdJ
Q19TWVNSUV9ERUZBVUxUX0VOQUJMRT0weDEKQ09ORklHX01BR0lDX1NZU1JRX1NFUklBTD15CkNP
TkZJR19NQUdJQ19TWVNSUV9TRVJJQUxfU0VRVUVOQ0U9IiIKQ09ORklHX0RFQlVHX0ZTPXkKQ09O
RklHX0RFQlVHX0ZTX0FMTE9XX0FMTD15CiMgQ09ORklHX0RFQlVHX0ZTX0RJU0FMTE9XX01PVU5U
IGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfRlNfQUxMT1dfTk9ORSBpcyBub3Qgc2V0CkNPTkZJ
R19IQVZFX0FSQ0hfS0dEQj15CkNPTkZJR19LR0RCPXkKQ09ORklHX0tHREJfSE9OT1VSX0JMT0NL
TElTVD15CkNPTkZJR19LR0RCX1NFUklBTF9DT05TT0xFPXkKQ09ORklHX0tHREJfVEVTVFM9eQoj
IENPTkZJR19LR0RCX1RFU1RTX09OX0JPT1QgaXMgbm90IHNldApDT05GSUdfS0dEQl9MT1dfTEVW
RUxfVFJBUD15CkNPTkZJR19LR0RCX0tEQj15CkNPTkZJR19LREJfREVGQVVMVF9FTkFCTEU9MHgw
CkNPTkZJR19LREJfS0VZQk9BUkQ9eQpDT05GSUdfS0RCX0NPTlRJTlVFX0NBVEFTVFJPUEhJQz0w
CkNPTkZJR19BUkNIX0hBU19FQVJMWV9ERUJVRz15CkNPTkZJR19BUkNIX0hBU19VQlNBTl9TQU5J
VElaRV9BTEw9eQojIENPTkZJR19VQlNBTiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0NT
QU49eQojIGVuZCBvZiBHZW5lcmljIEtlcm5lbCBEZWJ1Z2dpbmcgSW5zdHJ1bWVudHMKCkNPTkZJ
R19ERUJVR19LRVJORUw9eQpDT05GSUdfREVCVUdfTUlTQz15CgojCiMgTWVtb3J5IERlYnVnZ2lu
ZwojCkNPTkZJR19QQUdFX0VYVEVOU0lPTj15CiMgQ09ORklHX0RFQlVHX1BBR0VBTExPQyBpcyBu
b3Qgc2V0CkNPTkZJR19QQUdFX09XTkVSPXkKIyBDT05GSUdfUEFHRV9QT0lTT05JTkcgaXMgbm90
IHNldAojIENPTkZJR19ERUJVR19QQUdFX1JFRiBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1JP
REFUQV9URVNUIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1dYPXkKIyBDT05GSUdf
REVCVUdfV1ggaXMgbm90IHNldApDT05GSUdfR0VORVJJQ19QVERVTVA9eQojIENPTkZJR19QVERV
TVBfREVCVUdGUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX09CSkVDVFMgaXMgbm90IHNldAoj
IENPTkZJR19TTFVCX0RFQlVHX09OIGlzIG5vdCBzZXQKIyBDT05GSUdfU0xVQl9TVEFUUyBpcyBu
b3Qgc2V0CkNPTkZJR19IQVZFX0RFQlVHX0tNRU1MRUFLPXkKIyBDT05GSUdfREVCVUdfS01FTUxF
QUsgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TVEFDS19VU0FHRSBpcyBub3Qgc2V0CiMgQ09O
RklHX1NDSEVEX1NUQUNLX0VORF9DSEVDSyBpcyBub3Qgc2V0CkNPTkZJR19BUkNIX0hBU19ERUJV
R19WTV9QR1RBQkxFPXkKIyBDT05GSUdfREVCVUdfVk0gaXMgbm90IHNldAojIENPTkZJR19ERUJV
R19WTV9QR1RBQkxFIGlzIG5vdCBzZXQKQ09ORklHX0FSQ0hfSEFTX0RFQlVHX1ZJUlRVQUw9eQoj
IENPTkZJR19ERUJVR19WSVJUVUFMIGlzIG5vdCBzZXQKQ09ORklHX0RFQlVHX01FTU9SWV9JTklU
PXkKIyBDT05GSUdfREVCVUdfUEVSX0NQVV9NQVBTIGlzIG5vdCBzZXQKQ09ORklHX0hBVkVfQVJD
SF9LQVNBTj15CkNPTkZJR19IQVZFX0FSQ0hfS0FTQU5fVk1BTExPQz15CkNPTkZJR19DQ19IQVNf
S0FTQU5fR0VORVJJQz15CkNPTkZJR19DQ19IQVNfV09SS0lOR19OT1NBTklUSVpFX0FERFJFU1M9
eQojIENPTkZJR19LQVNBTiBpcyBub3Qgc2V0CkNPTkZJR19IQVZFX0FSQ0hfS0ZFTkNFPXkKIyBD
T05GSUdfS0ZFTkNFIGlzIG5vdCBzZXQKIyBlbmQgb2YgTWVtb3J5IERlYnVnZ2luZwoKQ09ORklH
X0RFQlVHX1NISVJRPXkKCiMKIyBEZWJ1ZyBPb3BzLCBMb2NrdXBzIGFuZCBIYW5ncwojCkNPTkZJ
R19QQU5JQ19PTl9PT1BTPXkKQ09ORklHX1BBTklDX09OX09PUFNfVkFMVUU9MQpDT05GSUdfUEFO
SUNfVElNRU9VVD0wCkNPTkZJR19MT0NLVVBfREVURUNUT1I9eQpDT05GSUdfU09GVExPQ0tVUF9E
RVRFQ1RPUj15CiMgQ09ORklHX0JPT1RQQVJBTV9TT0ZUTE9DS1VQX1BBTklDIGlzIG5vdCBzZXQK
Q09ORklHX0JPT1RQQVJBTV9TT0ZUTE9DS1VQX1BBTklDX1ZBTFVFPTAKQ09ORklHX0hBUkRMT0NL
VVBfREVURUNUT1JfUEVSRj15CkNPTkZJR19IQVJETE9DS1VQX0NIRUNLX1RJTUVTVEFNUD15CkNP
TkZJR19IQVJETE9DS1VQX0RFVEVDVE9SPXkKQ09ORklHX0JPT1RQQVJBTV9IQVJETE9DS1VQX1BB
TklDPXkKQ09ORklHX0JPT1RQQVJBTV9IQVJETE9DS1VQX1BBTklDX1ZBTFVFPTEKQ09ORklHX0RF
VEVDVF9IVU5HX1RBU0s9eQpDT05GSUdfREVGQVVMVF9IVU5HX1RBU0tfVElNRU9VVD0xMjAKIyBD
T05GSUdfQk9PVFBBUkFNX0hVTkdfVEFTS19QQU5JQyBpcyBub3Qgc2V0CkNPTkZJR19CT09UUEFS
QU1fSFVOR19UQVNLX1BBTklDX1ZBTFVFPTAKIyBDT05GSUdfV1FfV0FUQ0hET0cgaXMgbm90IHNl
dAojIENPTkZJR19URVNUX0xPQ0tVUCBpcyBub3Qgc2V0CiMgZW5kIG9mIERlYnVnIE9vcHMsIExv
Y2t1cHMgYW5kIEhhbmdzCgojCiMgU2NoZWR1bGVyIERlYnVnZ2luZwojCkNPTkZJR19TQ0hFRF9E
RUJVRz15CkNPTkZJR19TQ0hFRF9JTkZPPXkKQ09ORklHX1NDSEVEU1RBVFM9eQojIGVuZCBvZiBT
Y2hlZHVsZXIgRGVidWdnaW5nCgojIENPTkZJR19ERUJVR19USU1FS0VFUElORyBpcyBub3Qgc2V0
CgojCiMgTG9jayBEZWJ1Z2dpbmcgKHNwaW5sb2NrcywgbXV0ZXhlcywgZXRjLi4uKQojCkNPTkZJ
R19MT0NLX0RFQlVHR0lOR19TVVBQT1JUPXkKIyBDT05GSUdfUFJPVkVfTE9DS0lORyBpcyBub3Qg
c2V0CiMgQ09ORklHX0xPQ0tfU1RBVCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1JUX01VVEVY
RVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19TUElOTE9DSyBpcyBub3Qgc2V0CiMgQ09ORklH
X0RFQlVHX01VVEVYRVMgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19XV19NVVRFWF9TTE9XUEFU
SCBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX1JXU0VNUyBpcyBub3Qgc2V0CiMgQ09ORklHX0RF
QlVHX0xPQ0tfQUxMT0MgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19BVE9NSUNfU0xFRVAgaXMg
bm90IHNldAojIENPTkZJR19ERUJVR19MT0NLSU5HX0FQSV9TRUxGVEVTVFMgaXMgbm90IHNldApD
T05GSUdfTE9DS19UT1JUVVJFX1RFU1Q9bQojIENPTkZJR19XV19NVVRFWF9TRUxGVEVTVCBpcyBu
b3Qgc2V0CiMgQ09ORklHX1NDRl9UT1JUVVJFX1RFU1QgaXMgbm90IHNldAojIENPTkZJR19DU0Rf
TE9DS19XQUlUX0RFQlVHIGlzIG5vdCBzZXQKIyBlbmQgb2YgTG9jayBEZWJ1Z2dpbmcgKHNwaW5s
b2NrcywgbXV0ZXhlcywgZXRjLi4uKQoKIyBDT05GSUdfREVCVUdfSVJRRkxBR1MgaXMgbm90IHNl
dApDT05GSUdfU1RBQ0tUUkFDRT15CiMgQ09ORklHX1dBUk5fQUxMX1VOU0VFREVEX1JBTkRPTSBp
cyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0tPQkpFQ1QgaXMgbm90IHNldAoKIwojIERlYnVnIGtl
cm5lbCBkYXRhIHN0cnVjdHVyZXMKIwpDT05GSUdfREVCVUdfTElTVD15CiMgQ09ORklHX0RFQlVH
X1BMSVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfREVCVUdfU0cgaXMgbm90IHNldAojIENPTkZJR19E
RUJVR19OT1RJRklFUlMgaXMgbm90IHNldApDT05GSUdfQlVHX09OX0RBVEFfQ09SUlVQVElPTj15
CiMgZW5kIG9mIERlYnVnIGtlcm5lbCBkYXRhIHN0cnVjdHVyZXMKCiMgQ09ORklHX0RFQlVHX0NS
RURFTlRJQUxTIGlzIG5vdCBzZXQKCiMKIyBSQ1UgRGVidWdnaW5nCiMKQ09ORklHX1RPUlRVUkVf
VEVTVD1tCiMgQ09ORklHX1JDVV9TQ0FMRV9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUkNVX1RP
UlRVUkVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JDVV9SRUZfU0NBTEVfVEVTVCBpcyBub3Qg
c2V0CkNPTkZJR19SQ1VfQ1BVX1NUQUxMX1RJTUVPVVQ9NjAKIyBDT05GSUdfUkNVX1RSQUNFIGlz
IG5vdCBzZXQKIyBDT05GSUdfUkNVX0VRU19ERUJVRyBpcyBub3Qgc2V0CiMgZW5kIG9mIFJDVSBE
ZWJ1Z2dpbmcKCiMgQ09ORklHX0RFQlVHX1dRX0ZPUkNFX1JSX0NQVSBpcyBub3Qgc2V0CiMgQ09O
RklHX0RFQlVHX0JMT0NLX0VYVF9ERVZUIGlzIG5vdCBzZXQKIyBDT05GSUdfQ1BVX0hPVFBMVUdf
U1RBVEVfQ09OVFJPTCBpcyBub3Qgc2V0CiMgQ09ORklHX0xBVEVOQ1lUT1AgaXMgbm90IHNldApD
T05GSUdfVVNFUl9TVEFDS1RSQUNFX1NVUFBPUlQ9eQpDT05GSUdfTk9QX1RSQUNFUj15CkNPTkZJ
R19IQVZFX0ZVTkNUSU9OX1RSQUNFUj15CkNPTkZJR19IQVZFX0ZVTkNUSU9OX0dSQVBIX1RSQUNF
Uj15CkNPTkZJR19IQVZFX0RZTkFNSUNfRlRSQUNFPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJB
Q0VfV0lUSF9SRUdTPXkKQ09ORklHX0hBVkVfRFlOQU1JQ19GVFJBQ0VfV0lUSF9ESVJFQ1RfQ0FM
TFM9eQpDT05GSUdfSEFWRV9EWU5BTUlDX0ZUUkFDRV9XSVRIX0FSR1M9eQpDT05GSUdfSEFWRV9G
VFJBQ0VfTUNPVU5UX1JFQ09SRD15CkNPTkZJR19IQVZFX1NZU0NBTExfVFJBQ0VQT0lOVFM9eQpD
T05GSUdfSEFWRV9GRU5UUlk9eQpDT05GSUdfSEFWRV9PQkpUT09MX01DT1VOVD15CkNPTkZJR19I
QVZFX0NfUkVDT1JETUNPVU5UPXkKQ09ORklHX1RSQUNFUl9NQVhfVFJBQ0U9eQpDT05GSUdfVFJB
Q0VfQ0xPQ0s9eQpDT05GSUdfUklOR19CVUZGRVI9eQpDT05GSUdfRVZFTlRfVFJBQ0lORz15CkNP
TkZJR19DT05URVhUX1NXSVRDSF9UUkFDRVI9eQpDT05GSUdfVFJBQ0lORz15CkNPTkZJR19HRU5F
UklDX1RSQUNFUj15CkNPTkZJR19UUkFDSU5HX1NVUFBPUlQ9eQpDT05GSUdfRlRSQUNFPXkKIyBD
T05GSUdfQk9PVFRJTUVfVFJBQ0lORyBpcyBub3Qgc2V0CkNPTkZJR19GVU5DVElPTl9UUkFDRVI9
eQpDT05GSUdfRlVOQ1RJT05fR1JBUEhfVFJBQ0VSPXkKQ09ORklHX0RZTkFNSUNfRlRSQUNFPXkK
Q09ORklHX0RZTkFNSUNfRlRSQUNFX1dJVEhfUkVHUz15CkNPTkZJR19EWU5BTUlDX0ZUUkFDRV9X
SVRIX0RJUkVDVF9DQUxMUz15CkNPTkZJR19GVU5DVElPTl9QUk9GSUxFUj15CkNPTkZJR19TVEFD
S19UUkFDRVI9eQojIENPTkZJR19JUlFTT0ZGX1RSQUNFUiBpcyBub3Qgc2V0CkNPTkZJR19TQ0hF
RF9UUkFDRVI9eQpDT05GSUdfSFdMQVRfVFJBQ0VSPXkKIyBDT05GSUdfTU1JT1RSQUNFIGlzIG5v
dCBzZXQKQ09ORklHX0ZUUkFDRV9TWVNDQUxMUz15CkNPTkZJR19UUkFDRVJfU05BUFNIT1Q9eQoj
IENPTkZJR19UUkFDRVJfU05BUFNIT1RfUEVSX0NQVV9TV0FQIGlzIG5vdCBzZXQKQ09ORklHX0JS
QU5DSF9QUk9GSUxFX05PTkU9eQojIENPTkZJR19QUk9GSUxFX0FOTk9UQVRFRF9CUkFOQ0hFUyBp
cyBub3Qgc2V0CkNPTkZJR19CTEtfREVWX0lPX1RSQUNFPXkKQ09ORklHX0tQUk9CRV9FVkVOVFM9
eQojIENPTkZJR19LUFJPQkVfRVZFTlRTX09OX05PVFJBQ0UgaXMgbm90IHNldApDT05GSUdfVVBS
T0JFX0VWRU5UUz15CkNPTkZJR19CUEZfRVZFTlRTPXkKQ09ORklHX0RZTkFNSUNfRVZFTlRTPXkK
Q09ORklHX1BST0JFX0VWRU5UUz15CiMgQ09ORklHX0JQRl9LUFJPQkVfT1ZFUlJJREUgaXMgbm90
IHNldApDT05GSUdfRlRSQUNFX01DT1VOVF9SRUNPUkQ9eQpDT05GSUdfRlRSQUNFX01DT1VOVF9V
U0VfQ0M9eQpDT05GSUdfVFJBQ0lOR19NQVA9eQpDT05GSUdfU1lOVEhfRVZFTlRTPXkKQ09ORklH
X0hJU1RfVFJJR0dFUlM9eQojIENPTkZJR19UUkFDRV9FVkVOVF9JTkpFQ1QgaXMgbm90IHNldAoj
IENPTkZJR19UUkFDRVBPSU5UX0JFTkNITUFSSyBpcyBub3Qgc2V0CkNPTkZJR19SSU5HX0JVRkZF
Ul9CRU5DSE1BUks9bQojIENPTkZJR19UUkFDRV9FVkFMX01BUF9GSUxFIGlzIG5vdCBzZXQKIyBD
T05GSUdfRlRSQUNFX1JFQ09SRF9SRUNVUlNJT04gaXMgbm90IHNldAojIENPTkZJR19GVFJBQ0Vf
U1RBUlRVUF9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfUklOR19CVUZGRVJfU1RBUlRVUF9URVNU
IGlzIG5vdCBzZXQKIyBDT05GSUdfUklOR19CVUZGRVJfVkFMSURBVEVfVElNRV9ERUxUQVMgaXMg
bm90IHNldAojIENPTkZJR19QUkVFTVBUSVJRX0RFTEFZX1RFU1QgaXMgbm90IHNldAojIENPTkZJ
R19TWU5USF9FVkVOVF9HRU5fVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0tQUk9CRV9FVkVOVF9H
RU5fVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0hJU1RfVFJJR0dFUlNfREVCVUcgaXMgbm90IHNl
dApDT05GSUdfUFJPVklERV9PSENJMTM5NF9ETUFfSU5JVD15CiMgQ09ORklHX1NBTVBMRVMgaXMg
bm90IHNldApDT05GSUdfQVJDSF9IQVNfREVWTUVNX0lTX0FMTE9XRUQ9eQpDT05GSUdfU1RSSUNU
X0RFVk1FTT15CiMgQ09ORklHX0lPX1NUUklDVF9ERVZNRU0gaXMgbm90IHNldAoKIwojIHg4NiBE
ZWJ1Z2dpbmcKIwpDT05GSUdfVFJBQ0VfSVJRRkxBR1NfU1VQUE9SVD15CkNPTkZJR19UUkFDRV9J
UlFGTEFHU19OTUlfU1VQUE9SVD15CkNPTkZJR19FQVJMWV9QUklOVEtfVVNCPXkKIyBDT05GSUdf
WDg2X1ZFUkJPU0VfQk9PVFVQIGlzIG5vdCBzZXQKQ09ORklHX0VBUkxZX1BSSU5USz15CkNPTkZJ
R19FQVJMWV9QUklOVEtfREJHUD15CkNPTkZJR19FQVJMWV9QUklOVEtfVVNCX1hEQkM9eQojIENP
TkZJR19FRklfUEdUX0RVTVAgaXMgbm90IHNldAojIENPTkZJR19ERUJVR19UTEJGTFVTSCBpcyBu
b3Qgc2V0CkNPTkZJR19IQVZFX01NSU9UUkFDRV9TVVBQT1JUPXkKQ09ORklHX1g4Nl9ERUNPREVS
X1NFTEZURVNUPXkKQ09ORklHX0lPX0RFTEFZXzBYODA9eQojIENPTkZJR19JT19ERUxBWV8wWEVE
IGlzIG5vdCBzZXQKIyBDT05GSUdfSU9fREVMQVlfVURFTEFZIGlzIG5vdCBzZXQKIyBDT05GSUdf
SU9fREVMQVlfTk9ORSBpcyBub3Qgc2V0CkNPTkZJR19ERUJVR19CT09UX1BBUkFNUz15CiMgQ09O
RklHX0NQQV9ERUJVRyBpcyBub3Qgc2V0CiMgQ09ORklHX0RFQlVHX0VOVFJZIGlzIG5vdCBzZXQK
IyBDT05GSUdfREVCVUdfTk1JX1NFTEZURVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfWDg2X0RFQlVH
X0ZQVSBpcyBub3Qgc2V0CiMgQ09ORklHX1BVTklUX0FUT01fREVCVUcgaXMgbm90IHNldApDT05G
SUdfVU5XSU5ERVJfT1JDPXkKIyBDT05GSUdfVU5XSU5ERVJfRlJBTUVfUE9JTlRFUiBpcyBub3Qg
c2V0CiMgZW5kIG9mIHg4NiBEZWJ1Z2dpbmcKCiMKIyBLZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJh
Z2UKIwojIENPTkZJR19LVU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX05PVElGSUVSX0VSUk9SX0lO
SkVDVElPTiBpcyBub3Qgc2V0CkNPTkZJR19GVU5DVElPTl9FUlJPUl9JTkpFQ1RJT049eQojIENP
TkZJR19GQVVMVF9JTkpFQ1RJT04gaXMgbm90IHNldApDT05GSUdfQVJDSF9IQVNfS0NPVj15CkNP
TkZJR19DQ19IQVNfU0FOQ09WX1RSQUNFX1BDPXkKIyBDT05GSUdfS0NPViBpcyBub3Qgc2V0CkNP
TkZJR19SVU5USU1FX1RFU1RJTkdfTUVOVT15CiMgQ09ORklHX0xLRFRNIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEVTVF9MSVNUX1NPUlQgaXMgbm90IHNldAojIENPTkZJR19URVNUX01JTl9IRUFQIGlz
IG5vdCBzZXQKIyBDT05GSUdfVEVTVF9TT1JUIGlzIG5vdCBzZXQKIyBDT05GSUdfS1BST0JFU19T
QU5JVFlfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX0JBQ0tUUkFDRV9TRUxGX1RFU1QgaXMgbm90
IHNldAojIENPTkZJR19SQlRSRUVfVEVTVCBpcyBub3Qgc2V0CiMgQ09ORklHX1JFRURfU09MT01P
Tl9URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSU5URVJWQUxfVFJFRV9URVNUIGlzIG5vdCBzZXQK
IyBDT05GSUdfUEVSQ1BVX1RFU1QgaXMgbm90IHNldApDT05GSUdfQVRPTUlDNjRfU0VMRlRFU1Q9
eQpDT05GSUdfQVNZTkNfUkFJRDZfVEVTVD1tCiMgQ09ORklHX1RFU1RfSEVYRFVNUCBpcyBub3Qg
c2V0CiMgQ09ORklHX1RFU1RfU1RSSU5HX0hFTFBFUlMgaXMgbm90IHNldAojIENPTkZJR19URVNU
X1NUUlNDUFkgaXMgbm90IHNldApDT05GSUdfVEVTVF9LU1RSVE9YPXkKIyBDT05GSUdfVEVTVF9Q
UklOVEYgaXMgbm90IHNldAojIENPTkZJR19URVNUX0JJVE1BUCBpcyBub3Qgc2V0CiMgQ09ORklH
X1RFU1RfVVVJRCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfWEFSUkFZIGlzIG5vdCBzZXQKIyBD
T05GSUdfVEVTVF9PVkVSRkxPVyBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfUkhBU0hUQUJMRSBp
cyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSEFTSCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSURB
IGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9QQVJNQU4gaXMgbm90IHNldAojIENPTkZJR19URVNU
X0xLTSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfQklUT1BTIGlzIG5vdCBzZXQKIyBDT05GSUdf
VEVTVF9WTUFMTE9DIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9VU0VSX0NPUFkgaXMgbm90IHNl
dApDT05GSUdfVEVTVF9CUEY9bQojIENPTkZJR19URVNUX0JMQUNLSE9MRV9ERVYgaXMgbm90IHNl
dAojIENPTkZJR19GSU5EX0JJVF9CRU5DSE1BUksgaXMgbm90IHNldAojIENPTkZJR19URVNUX0ZJ
Uk1XQVJFIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9TWVNDVEwgaXMgbm90IHNldAojIENPTkZJ
R19URVNUX1VERUxBWSBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfU1RBVElDX0tFWVMgaXMgbm90
IHNldAojIENPTkZJR19URVNUX0tNT0QgaXMgbm90IHNldAojIENPTkZJR19URVNUX01FTUNBVF9Q
IGlzIG5vdCBzZXQKQ09ORklHX1RFU1RfTElWRVBBVENIPW0KIyBDT05GSUdfVEVTVF9PQkpBR0cg
aXMgbm90IHNldAojIENPTkZJR19URVNUX1NUQUNLSU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RF
U1RfTUVNSU5JVCBpcyBub3Qgc2V0CiMgQ09ORklHX1RFU1RfSE1NIGlzIG5vdCBzZXQKIyBDT05G
SUdfVEVTVF9GUkVFX1BBR0VTIGlzIG5vdCBzZXQKIyBDT05GSUdfVEVTVF9GUFUgaXMgbm90IHNl
dAojIENPTkZJR19NRU1URVNUIGlzIG5vdCBzZXQKIyBDT05GSUdfSFlQRVJWX1RFU1RJTkcgaXMg
bm90IHNldAojIGVuZCBvZiBLZXJuZWwgVGVzdGluZyBhbmQgQ292ZXJhZ2UKIyBlbmQgb2YgS2Vy
bmVsIGhhY2tpbmcK

--===============3589168606509354725==
Content-Type: text/x-diff
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-pin_user_pages_fast-SMP-scalability-benchmark.patch"

RnJvbSA4NWRmMjFmZTM5NjNmMmE3MDg2MzI1M2VlNzQ0NWU1ZmU2MjRjOTY2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbmRyZWEgQXJjYW5nZWxpIDxhYXJjYW5nZUByZWRoYXQuY29t
PgpEYXRlOiBTYXQsIDEgTWF5IDIwMjEgMTg6MTE6NTQgLTA0MDAKU3ViamVjdDogW1BBVENIIDEv
MV0gcGluX3VzZXJfcGFnZXNfZmFzdCBTTVAgc2NhbGFiaWxpdHkgYmVuY2htYXJrCgpUaGlzIHJl
cXVpcmVzIHRoZSBrZXJuZWwgYnVpbHQgd2l0aCBDT05GSUdfR1VQX0ZBU1Q9eSBhbmQgaXQgbXVz
dCBiZQpydW4gYXMgcm9vdCBpdCB3b24ndCBiZSBhYmxlIHRvIG9wZW4gL3N5cy9rZXJuZWwvZGVi
dWcvZ3VwX3Rlc3QuCgpTaWduZWQtb2ZmLWJ5OiBBbmRyZWEgQXJjYW5nZWxpIDxhYXJjYW5nZUBy
ZWRoYXQuY29tPgotLS0KIHRlc3RzL3Bpbl9mYXN0LmMgfCA2OCArKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRp
b25zKCspCiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvcGluX2Zhc3QuYwoKZGlmZiAtLWdpdCBh
L3Rlc3RzL3Bpbl9mYXN0LmMgYi90ZXN0cy9waW5fZmFzdC5jCm5ldyBmaWxlIG1vZGUgMTAwNjQ0
CmluZGV4IDAwMDAwMDAuLmIxZTYyODIKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0cy9waW5fZmFz
dC5jCkBAIC0wLDAgKzEsNjggQEAKKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
LW9yLWxhdGVyICovCisjZGVmaW5lIF9HTlVfU09VUkNFCisjaW5jbHVkZSA8ZmNudGwuaD4KKyNp
bmNsdWRlIDxzdGRsaWIuaD4KKyNpbmNsdWRlIDx1bmlzdGQuaD4KKyNpbmNsdWRlIDxzdHJpbmcu
aD4KKyNpbmNsdWRlIDxhc3NlcnQuaD4KKyNpbmNsdWRlIDxzeXMvcHJjdGwuaD4KKyNpbmNsdWRl
IDxzeXMvaW9jdGwuaD4KKyNpbmNsdWRlIDxzeXMvbW1hbi5oPgorCisvKiBleGVyY2lzZXMgcGlu
X3VzZXJfcGFnZXNfZmFzdCwgcmVxdWlyZXMgYSBrZXJuZWwgd2l0aCBDT05GSUdfR1VQX1RFU1Q9
eSAqLworY2hhciAqdGVzdGNhc2VfZGVzY3JpcHRpb24gPSAicGluX3VzZXJfcGFnZXNfZmFzdCBT
TVAgc2NhbGFiaWxpdHkgYmVuY2htYXJrIjsKKworc3RhdGljIGludCBndXBfZmQ7CisjZGVmaW5l
IE5SX1BBR0VTIDEwMjQKKyNkZWZpbmUgQlVGTEVOIChnZXRwYWdlc2l6ZSgpICogTlJfUEFHRVMp
CisKKyNkZWZpbmUgR1VQX1RFU1RfTUFYX1BBR0VTX1RPX0RVTVAJCTgKKyNkZWZpbmUgUElOX0ZB
U1RfQkVOQ0hNQVJLCV9JT1dSKCdnJywgMiwgc3RydWN0IGd1cF90ZXN0KQorCitzdHJ1Y3QgZ3Vw
X3Rlc3QgeworCV9fdTY0IGdldF9kZWx0YV91c2VjOworCV9fdTY0IHB1dF9kZWx0YV91c2VjOwor
CV9fdTY0IGFkZHI7CisJX191NjQgc2l6ZTsKKwlfX3UzMiBucl9wYWdlc19wZXJfY2FsbDsKKwlf
X3UzMiBmbGFnczsKKwkvKgorCSAqIEVhY2ggbm9uLXplcm8gZW50cnkgaXMgdGhlIG51bWJlciBv
ZiB0aGUgcGFnZSAoMS1iYXNlZDogZmlyc3QgcGFnZSBpcworCSAqIHBhZ2UgMSwgc28gdGhhdCB6
ZXJvIGVudHJpZXMgbWVhbiAiZG8gbm90aGluZyIpIGZyb20gdGhlIC5hZGRyIGJhc2UuCisJICov
CisJX191MzIgd2hpY2hfcGFnZXNbR1VQX1RFU1RfTUFYX1BBR0VTX1RPX0RVTVBdOworfTsKKwor
dm9pZCB0ZXN0Y2FzZV9wcmVwYXJlKHVuc2lnbmVkIGxvbmcgbnJfdGFza3MpCit7CisJZ3VwX2Zk
ID0gb3BlbigiL3N5cy9rZXJuZWwvZGVidWcvZ3VwX3Rlc3QiLCBPX1JEV1IpOworCWFzc2VydChn
dXBfZmQgPj0gMCk7Cit9CisKK3ZvaWQgdGVzdGNhc2UodW5zaWduZWQgbG9uZyBsb25nICppdGVy
YXRpb25zLCB1bnNpZ25lZCBsb25nIG5yKQoreworCWNoYXIgKnAgPSBhbGlnbmVkX2FsbG9jKGdl
dHBhZ2VzaXplKCkqNTEyLCBCVUZMRU4pOworCWFzc2VydChwKTsKKwlhc3NlcnQoIW1hZHZpc2Uo
cCwgQlVGTEVOLCBNQURWX0hVR0VQQUdFKSk7CisJZm9yIChpbnQgaSA9IDA7IGkgPCBOUl9QQUdF
UzsgaSsrKQorCQlwW2dldHBhZ2VzaXplKCkqaV0gPSAwOworCisJc3RydWN0IGd1cF90ZXN0IGd1
cCA9IHsKKwkJLnNpemUgPSBCVUZMRU4sCisJCS5hZGRyID0gKHVuc2lnbmVkIGxvbmcpcCwKKwkJ
Lm5yX3BhZ2VzX3Blcl9jYWxsID0gMSwKKwl9OworCisJd2hpbGUgKDEpIHsKKwkJYXNzZXJ0KCFp
b2N0bChndXBfZmQsIFBJTl9GQVNUX0JFTkNITUFSSywgJmd1cCkpOworCisJCSgqaXRlcmF0aW9u
cykrKzsKKwl9CisKKwlmcmVlKHApOworfQorCit2b2lkIHRlc3RjYXNlX2NsZWFudXAodm9pZCkK
K3sKKwlhc3NlcnQoIWNsb3NlKGd1cF9mZCkpOworfQo=

--===============3589168606509354725==--

