Content-Type: multipart/mixed; boundary="===============5985448671725214683=="
MIME-Version: 1.0
From: Valentin Schneider <valentin.schneider@arm.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] b360fb5e59: stress-ng.vm-segv.ops_per_sec -13.9% regression
Date: Tue, 23 Feb 2021 12:36:26 +0000
Message-ID: <jhjim6jhsfp.mognet@arm.com>
In-Reply-To: <20210223023004.GB25487@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5985448671725214683==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 23/02/21 10:30, kernel test robot wrote:
> Greeting,
>
> FYI, we noticed a -13.9% regression of stress-ng.vm-segv.ops_per_sec due =
to commit:
>
>
> commit: b360fb5e5954a8a440ef95bf11257e2e7ea90340 ("[PATCH v2 1/7] sched/f=
air: Ignore percpu threads for imbalance pulls")
> url: https://github.com/0day-ci/linux/commits/Valentin-Schneider/sched-fa=
ir-misfit-task-load-balance-tweaks/20210219-211028
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git c5e6fc08fe=
b2b88dc5dac2f3c817e1c2a4cafda4
>
> in testcase: stress-ng
> on test machine: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with=
 512G memory
> with following parameters:
>
> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 60s
> 	fs: ext4
> 	class: vm
> 	test: vm-segv
> 	cpufreq_governor: performance
> 	ucode: 0x5003003
>
>
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install                job.yaml  # job file is attached i=
n this email
>         bin/lkp split-job --compatible job.yaml
>         bin/lkp run                    compatible-job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/test/testcase/testtime/ucode:
>   vm/gcc-9/performance/1HDD/ext4/x86_64-rhel-8.3/10%/debian-10.4-x86_64-2=
0200603.cgz/lkp-csl-2sp7/vm-segv/stress-ng/60s/0x5003003
>
> commit: =

>   c5e6fc08fe ("sched,x86: Allow !PREEMPT_DYNAMIC")
>   b360fb5e59 ("sched/fair: Ignore percpu threads for imbalance pulls")
>
> c5e6fc08feb2b88d b360fb5e5954a8a440ef95bf112 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           1:6           -3%           1:6     perf-profile.children.cycle=
s-pp.error_entry
>           0:6           -1%           0:6     perf-profile.self.cycles-pp=
.error_entry
>          %stddev     %change         %stddev
>              \          |                \  =

>      11324 =C3=AF=C2=BF=C2=BD  3%     -28.1%       8140 =C3=AF=C2=BF=C2=
=BD  3%  stress-ng.time.involuntary_context_switches
>       6818 =C3=AF=C2=BF=C2=BD 15%    +315.2%      28311 =C3=AF=C2=BF=C2=
=BD 12%  stress-ng.time.major_page_faults
>   30952041           -12.8%   26988502        stress-ng.time.minor_page_f=
aults

>     378.82            +5.3%     398.75        stress-ng.time.system_time
>     215.82           -10.0%     194.24        stress-ng.time.user_time
>   62102177           -13.9%   53448474        stress-ng.time.voluntary_co=
ntext_switches
>     810348           -13.9%     698034        stress-ng.vm-segv.ops
>      13505           -13.9%      11633        stress-ng.vm-segv.ops_per_s=
ec

My hunch was that this could be due to the balance interval no longer being
increased when load balance catches pcpu kworkers, but that's not the case:
we would still have LBF_ALL_PINNED, which will still double the balance
interval if no task was moved.

I'm not sure which stat to look at wrt softirqs; this seems to say there
weren't that many more:

>       1.11            -0.3        0.85        mpstat.cpu.all.irq%
>       0.18            -0.0        0.16        mpstat.cpu.all.soft%
>       0.40            -0.1        0.35        mpstat.cpu.all.usr%

But this does:

>      11501 =C3=AF=C2=BF=C2=BD  5%      +9.6%      12610 =C3=AF=C2=BF=C2=
=BD  6%  softirqs.CPU12.RCU
>      10678 =C3=AF=C2=BF=C2=BD  5%     +16.0%      12383 =C3=AF=C2=BF=C2=
=BD  2%  softirqs.CPU16.RCU
>      10871 =C3=AF=C2=BF=C2=BD  4%     +13.1%      12294 =C3=AF=C2=BF=C2=
=BD  2%  softirqs.CPU17.RCU
>      10724 =C3=AF=C2=BF=C2=BD  2%     +13.8%      12205 =C3=AF=C2=BF=C2=
=BD  3%  softirqs.CPU18.RCU
>      10810 =C3=AF=C2=BF=C2=BD  4%     +16.2%      12560 =C3=AF=C2=BF=C2=
=BD  3%  softirqs.CPU19.RCU
>      10647 =C3=AF=C2=BF=C2=BD  6%     +16.2%      12372 =C3=AF=C2=BF=C2=
=BD  6%  softirqs.CPU20.RCU
>      10863 =C3=AF=C2=BF=C2=BD  3%     +14.7%      12461 =C3=AF=C2=BF=C2=
=BD  3%  softirqs.CPU21.RCU
>      11231 =C3=AF=C2=BF=C2=BD  5%     +14.6%      12873 =C3=AF=C2=BF=C2=
=BD  6%  softirqs.CPU22.RCU
>      11141 =C3=AF=C2=BF=C2=BD  6%     +21.0%      13480 =C3=AF=C2=BF=C2=
=BD  8%  softirqs.CPU64.RCU
>      11209 =C3=AF=C2=BF=C2=BD  6%     +20.8%      13545 =C3=AF=C2=BF=C2=
=BD  2%  softirqs.CPU65.RCU
>      11108 =C3=AF=C2=BF=C2=BD  3%     +20.0%      13334 =C3=AF=C2=BF=C2=
=BD  6%  softirqs.CPU66.RCU
>      11414 =C3=AF=C2=BF=C2=BD  9%     +16.9%      13345 =C3=AF=C2=BF=C2=
=BD  6%  softirqs.CPU67.RCU
>      11162 =C3=AF=C2=BF=C2=BD  4%     +16.2%      12968 =C3=AF=C2=BF=C2=
=BD  9%  softirqs.CPU68.RCU
>      11035 =C3=AF=C2=BF=C2=BD  5%     +13.6%      12533 =C3=AF=C2=BF=C2=
=BD  4%  softirqs.CPU69.RCU
>      11003 =C3=AF=C2=BF=C2=BD  5%     +18.9%      13078 =C3=AF=C2=BF=C2=
=BD  8%  softirqs.CPU70.RCU
>      11097 =C3=AF=C2=BF=C2=BD  4%     +14.9%      12756 =C3=AF=C2=BF=C2=
=BD  5%  softirqs.CPU71.RCU
--===============5985448671725214683==--

