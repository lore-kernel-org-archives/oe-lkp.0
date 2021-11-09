Content-Type: multipart/mixed; boundary="===============3867080730747451975=="
MIME-Version: 1.0
From: Kees Cook <keescook@chromium.org>
To: lkp@lists.01.org
Subject: Re: [fs] a0918006f9: netperf.Throughput_tps -11.6% regression
Date: Tue, 09 Nov 2021 09:21:42 -0800
Message-ID: <202111090920.4958E610D1@keescook>
In-Reply-To: <20211105064159.GB17949@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3867080730747451975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 05, 2021 at 02:41:59PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -11.6% regression of netperf.Throughput_tps due to comm=
it:
> =

> =

> commit: a0918006f9284b77397ae4f163f055c3e0f987b2 ("[PATCH v15 1/3] fs: Ad=
d trusted_for(2) syscall implementation and related sysctl")
> url: https://github.com/0day-ci/linux/commits/Micka-l-Sala-n/Add-trusted_=
for-2-was-O_MAYEXEC/20211013-032533
> patch link: https://lore.kernel.org/kernel-hardening/20211012192410.23560=
90-2-mic(a)digikod.net
> =

> in testcase: netperf
> on test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU=
 @ 2.30GHz with 192G memory
> with following parameters:
> =

> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 16
> 	cluster: cs-localhost
> 	test: TCP_CRR
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
> =

> =

> please be noted we made out some further analysis/tests, as Fengwei menti=
oned:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
> Here is my investigation result of this regression:
> =

> If I add patch to make sure the kernel function address and data address =
is
> almost same even with this patch, there is almost no performance delta(0.=
1%)
> w/o the patch.
> =

> And if I only make sure function address same w/o the patch, the performa=
nce
> delta is about 5.1%.
> =

> So suppose this regression is triggered by different function and data ad=
dress.
> We don't know why the different address could bring such kind of regressi=
on yet
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D
> =

> =

> we also tested on other platforms.
> on a Cooper Lake (Intel(R) Xeon(R) Gold 5318H CPU @ 2.50GHz with 128G mem=
ory),
> we also observed regression but the gap is smaller:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/16/debian-10.4-x86_=
64-20200603.cgz/300s/lkp-cpl-4sp1/TCP_CRR/netperf/0x700001e
> =

> commit:
>   v5.15-rc4
>   a0918006f9284b77397ae4f163f055c3e0f987b2
> =

>        v5.15-rc4 a0918006f9284b77397ae4f163f
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     333492            -5.7%     314346 =C2=B1  2%  netperf.Throughput_tot=
al_tps
>      20843            -4.5%      19896        netperf.Throughput_tps
> =

> =

> but no regression on a 96 threads 2 sockets Ice Lake with 256G memory:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/16/debian-10.4-x86_=
64-20200603.cgz/300s/lkp-icl-2sp1/TCP_CRR/netperf/0xb000280
> =

> commit:
>   v5.15-rc4
>   a0918006f9284b77397ae4f163f055c3e0f987b2
> =

>        v5.15-rc4 a0918006f9284b77397ae4f163f
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>     555600            -0.1%     555305        netperf.Throughput_total_tps
>      34725            -0.1%      34706        netperf.Throughput_tps
> =

> =

> Fengwei also helped review these results and commented:
> I suppose these three CPUs have different cache policy. It also could be
> related with netperf throughput testing.

Does moving the syscall implementation somewhere else change things?
That's a _huge_ performance change for something that isn't even called.
What's going on here?

-Kees

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
>         sudo bin/lkp install job.yaml           # job file is attached in=
 this email
>         bin/lkp split-job --compatible job.yaml # generate the yaml file =
for lkp run
>         sudo bin/lkp run generated-yaml-file
> =

>         # if come across any failure that blocks the test,
>         # please remove ~/.lkp and /lkp dir to run from a clean state.
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-9/performance/ipv4/x86_64-rhel-8.3/16/debian-10.4-x86_=
64-20200603.cgz/300s/lkp-csl-2ap3/TCP_CRR/netperf/0x5003006
> =

> commit: =

>   v5.15-rc4
>   a0918006f9 ("fs: Add trusted_for(2) syscall implementation and related =
sysctl")
> =

>        v5.15-rc4 a0918006f9284b77397ae4f163f =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     354692           -11.6%     313620        netperf.Throughput_total_tps
>      22168           -11.6%      19601        netperf.Throughput_tps
>  2.075e+08           -11.6%  1.834e+08        netperf.time.voluntary_cont=
ext_switches
>  1.064e+08           -11.6%   94086163        netperf.workload
>       0.27 =C2=B1 35%      -0.1        0.22 =C2=B1  2%  mpstat.cpu.all.us=
r%
>    2207583            -6.3%    2068413        vmstat.system.cs
>    3029480 =C2=B1  6%     -23.3%    2324079 =C2=B1  7%  interrupts.CAL:Fu=
nction_call_interrupts
>      13768 =C2=B1 25%     -35.6%       8872 =C2=B1 23%  interrupts.CPU30.=
CAL:Function_call_interrupts
>    2014617 =C2=B1 16%     -26.3%    1485200 =C2=B1 24%  softirqs.CPU180.N=
ET_RX
>  3.268e+08           -12.1%  2.874e+08        softirqs.NET_RX
>     287881 =C2=B1  2%     +24.6%     358692        softirqs.TIMER
>    3207001            -9.6%    2899010        perf-sched.wait_and_delay.c=
ount.schedule_timeout.inet_csk_accept.inet_accept.do_accept
>       0.01 =C2=B1 15%     +67.1%       0.01 =C2=B1  9%  perf-sched.wait_t=
ime.avg.ms.preempt_schedule_common.__cond_resched.__release_sock.release_so=
ck.sk_wait_data
>       0.02 =C2=B1  2%     +23.3%       0.03 =C2=B1 21%  perf-sched.wait_t=
ime.avg.ms.preempt_schedule_common.__cond_resched.aa_sk_perm.security_socke=
t_accept.do_accept
>       0.01           +20.0%       0.01        perf-sched.wait_time.avg.ms=
.schedule_timeout.wait_woken.sk_wait_data.tcp_recvmsg_locked
>      63320 =C2=B1  2%     -10.6%      56615 =C2=B1  2%  slabinfo.sock_ino=
de_cache.active_objs
>       1626 =C2=B1  2%     -10.6%       1454 =C2=B1  2%  slabinfo.sock_ino=
de_cache.active_slabs
>      63445 =C2=B1  2%     -10.6%      56722 =C2=B1  2%  slabinfo.sock_ino=
de_cache.num_objs
>       1626 =C2=B1  2%     -10.6%       1454 =C2=B1  2%  slabinfo.sock_ino=
de_cache.num_slabs
>      49195            -3.2%      47624        proc-vmstat.nr_slab_reclaim=
able
>    4278441            -6.6%    3996109        proc-vmstat.numa_hit
>    4052317 =C2=B1  2%      -7.4%    3751341        proc-vmstat.numa_local
>    4285136            -6.5%    4006356        proc-vmstat.pgalloc_normal
>    1704913           -11.4%    1511123        proc-vmstat.pgfree
>  9.382e+09           -10.1%  8.438e+09        perf-stat.i.branch-instruct=
ions
>  1.391e+08           -10.0%  1.252e+08        perf-stat.i.branch-misses
>      13.98            +2.2       16.20        perf-stat.i.cache-miss-rate%
>   87082775           +14.0%   99273064        perf-stat.i.cache-misses
>    2231661            -6.4%    2088571        perf-stat.i.context-switches
>       1.65            +8.6%       1.79        perf-stat.i.cpi
>  7.603e+10            -2.1%  7.441e+10        perf-stat.i.cpu-cycles
>     907.53 =C2=B1  2%     -13.0%     789.92 =C2=B1  2%  perf-stat.i.cycle=
s-between-cache-misses
>     920324 =C2=B1 19%     -20.3%     733572 =C2=B1  5%  perf-stat.i.dTLB-=
load-misses
>  1.417e+10           -10.3%  1.271e+10        perf-stat.i.dTLB-loads
>     182445 =C2=B1 16%     -57.6%      77419 =C2=B1  9%  perf-stat.i.dTLB-=
store-misses
>  8.254e+09           -10.3%  7.403e+09        perf-stat.i.dTLB-stores
>      88.23            -1.7       86.52        perf-stat.i.iTLB-load-miss-=
rate%
>   96633753           -11.0%   85983323        perf-stat.i.iTLB-load-misses
>   12277057            +4.0%   12766535        perf-stat.i.iTLB-loads
>  4.741e+10           -10.2%  4.259e+10        perf-stat.i.instructions
>       0.62            -8.2%       0.57        perf-stat.i.ipc
>       0.40            -2.1%       0.39        perf-stat.i.metric.GHz
>     168.88           -10.1%     151.87        perf-stat.i.metric.M/sec
>   16134360 =C2=B1  2%     +15.0%   18550862        perf-stat.i.node-load-=
misses
>    1576525 =C2=B1  2%     +10.0%    1734370 =C2=B1  2%  perf-stat.i.node-=
loads
>   10027868           -11.5%    8871598        perf-stat.i.node-store-miss=
es
>     386034 =C2=B1  3%     -16.0%     324290 =C2=B1  7%  perf-stat.i.node-=
stores
>      13.15            +9.2%      14.36        perf-stat.overall.MPKI
>      13.97            +2.3       16.23        perf-stat.overall.cache-mis=
s-rate%
>       1.60            +8.9%       1.75        perf-stat.overall.cpi
>     873.29           -14.2%     749.60        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.00 =C2=B1 15%      -0.0        0.00 =C2=B1  9%  perf-stat.overall=
.dTLB-store-miss-rate%
>      88.73            -1.7       87.07        perf-stat.overall.iTLB-load=
-miss-rate%
>       0.62            -8.2%       0.57        perf-stat.overall.ipc
>     135778            +1.7%     138069        perf-stat.overall.path-leng=
th
>  9.351e+09           -10.1%   8.41e+09        perf-stat.ps.branch-instruc=
tions
>  1.387e+08           -10.0%  1.248e+08        perf-stat.ps.branch-misses
>   86797490           +14.0%   98949207        perf-stat.ps.cache-misses
>    2224197            -6.4%    2081616        perf-stat.ps.context-switch=
es
>  7.578e+10            -2.1%  7.416e+10        perf-stat.ps.cpu-cycles
>     917495 =C2=B1 19%     -20.3%     731365 =C2=B1  5%  perf-stat.ps.dTLB=
-load-misses
>  1.412e+10           -10.3%  1.267e+10        perf-stat.ps.dTLB-loads
>     181859 =C2=B1 16%     -57.6%      77179 =C2=B1  9%  perf-stat.ps.dTLB=
-store-misses
>  8.227e+09           -10.3%  7.379e+09        perf-stat.ps.dTLB-stores
>   96313891           -11.0%   85700283        perf-stat.ps.iTLB-load-miss=
es
>   12236194            +4.0%   12724086        perf-stat.ps.iTLB-loads
>  4.726e+10           -10.2%  4.245e+10        perf-stat.ps.instructions
>   16081690 =C2=B1  2%     +15.0%   18490522        perf-stat.ps.node-load=
-misses
>    1571411 =C2=B1  2%     +10.0%    1728755 =C2=B1  2%  perf-stat.ps.node=
-loads
>    9995103           -11.5%    8842824        perf-stat.ps.node-store-mis=
ses
>     385193 =C2=B1  3%     -16.0%     323588 =C2=B1  7%  perf-stat.ps.node=
-stores
>  1.445e+13           -10.1%  1.299e+13        perf-stat.total.instructions
>       1.51 =C2=B1  7%      -0.2        1.29 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
>       1.53 =C2=B1  7%      -0.2        1.31 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       1.53 =C2=B1  7%      -0.2        1.31 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       1.48 =C2=B1  7%      -0.2        1.26 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.rcu_core.__softirqentry_text_start.run_ksoftirqd.smpboot_th=
read_fn.kthread
>       1.49 =C2=B1  7%      -0.2        1.27 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.run_ksoftirqd.smpboot_thread_fn.k=
thread.ret_from_fork
>       1.50 =C2=B1  7%      -0.2        1.27 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
>       1.47 =C2=B1  7%      -0.2        1.25 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.rcu_do_batch.rcu_core.__softirqentry_text_start.run_ksoftir=
qd.smpboot_thread_fn
>       1.41 =C2=B1  7%      -0.2        1.19 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.kmem_cache_free.rcu_do_batch.rcu_core.__softirqentry_text_s=
tart.run_ksoftirqd
>       1.25 =C2=B1  7%      -0.2        1.06 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.obj_cgroup_uncharge_pages.kmem_cache_free.rcu_do_batch.rcu_=
core.__softirqentry_text_start
>       1.21 =C2=B1  7%      -0.2        1.03 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.page_counter_uncharge.obj_cgroup_uncharge_pages.kmem_cache_=
free.rcu_do_batch.rcu_core
>       0.94 =C2=B1  7%      -0.1        0.80 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.page_counter_cancel.page_counter_uncharge.obj_cgroup_unchar=
ge_pages.kmem_cache_free.rcu_do_batch
>       0.62 =C2=B1  7%      +0.2        0.80 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.tcp_rcv_state_process.tcp_child_process.tcp_v4_rcv.ip_proto=
col_deliver_rcu.ip_local_deliver_finish
>       1.51 =C2=B1  7%      -0.2        1.29 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.smpboot_thread_fn
>       1.53 =C2=B1  7%      -0.2        1.31 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       1.53 =C2=B1  7%      -0.2        1.31 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.kthread
>       1.50 =C2=B1  7%      -0.2        1.27 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.run_ksoftirqd
>       1.73 =C2=B1  6%      -0.2        1.51 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_bh
>       1.25 =C2=B1  5%      -0.2        1.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.lock_sock_nested
>       1.03 =C2=B1  7%      -0.1        0.88 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       0.83 =C2=B1  6%      -0.1        0.72 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.sk_clone_lock
>       0.84 =C2=B1  6%      -0.1        0.73 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.inet_csk_clone_lock
>       0.45 =C2=B1  8%      -0.1        0.34 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__tcp_get_metrics
>       0.70 =C2=B1  6%      -0.1        0.60 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.percpu_counter_add_batch
>       0.52 =C2=B1  8%      -0.1        0.42 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_get_metrics
>       0.72 =C2=B1  5%      -0.1        0.62 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.sk_forced_mem_schedule
>       0.32 =C2=B1  7%      -0.1        0.24 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.sk_filter_trim_cap
>       0.49 =C2=B1  7%      -0.1        0.41 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.tcp_v4_destroy_sock
>       0.26 =C2=B1  7%      -0.0        0.22 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.ip_finish_output
>       0.29 =C2=B1  6%      -0.0        0.25 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.tcp_write_queue_purge
>       0.16 =C2=B1 10%      -0.0        0.12 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.get_obj_cgroup_from_current
>       0.10 =C2=B1  8%      -0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__destroy_inode
>       0.10 =C2=B1  8%      -0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.destroy_inode
>       0.10 =C2=B1  9%      -0.0        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.sock_put
>       0.10 =C2=B1 10%      -0.0        0.07 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.d_instantiate
>       0.08 =C2=B1 11%      -0.0        0.06 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc_trace
>       0.11 =C2=B1  8%      +0.0        0.15 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__inet_lookup_listener
>       0.08 =C2=B1  9%      +0.0        0.12 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.inet_lhash2_lookup
>       0.10 =C2=B1  7%      +0.0        0.14 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tcp_ca_openreq_child
>       0.08 =C2=B1  9%      +0.0        0.13 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.tcp_newly_delivered
>       0.08 =C2=B1  6%      +0.0        0.12 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.tcp_mtup_init
>       0.09 =C2=B1  8%      +0.1        0.15 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_stream_memory_free
>       0.24 =C2=B1  6%      +0.1        0.30 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.ip_rcv_core
>       0.06 =C2=B1  9%      +0.1        0.12 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tcp_push
>       0.11 =C2=B1  9%      +0.1        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tcp_synack_rtt_meas
>       0.00 =C2=B1412%      +0.1        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.tcp_rack_update_reo_wnd
>       0.20 =C2=B1  8%      +0.1        0.28 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_assign_congestion_control
>       0.34 =C2=B1  8%      +0.1        0.42 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_init_metrics
>       0.14 =C2=B1  6%      +0.1        0.22 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.tcp_sync_mss
>       0.33 =C2=B1  5%      +0.1        0.41 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.inet_csk_route_req
>       0.31 =C2=B1  6%      +0.1        0.40 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.inet_csk_route_child_sock
>       0.13 =C2=B1  8%      +0.1        0.22 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.skb_entail
>       0.21 =C2=B1  6%      +0.1        0.32 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.ip_rcv_finish_core
>       0.24 =C2=B1  5%      +0.1        0.35 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.ip_rcv_finish
>       0.20 =C2=B1  7%      +0.1        0.32 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tcp_select_initial_window
>       0.14 =C2=B1  5%      +0.1        0.26 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.secure_tcp_ts_off
>       0.45 =C2=B1  6%      +0.1        0.58 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_finish_connect
>       0.23 =C2=B1  5%      +0.1        0.35 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tcp_parse_options
>       0.17 =C2=B1  7%      +0.1        0.31 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_update_pacing_rate
>       0.20 =C2=B1  7%      +0.1        0.35 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_openreq_init_rwin
>       0.27 =C2=B1  9%      +0.1        0.42 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tcp_connect_init
>       0.45 =C2=B1  7%      +0.2        0.60 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tcp_v4_init_sock
>       0.44 =C2=B1  7%      +0.2        0.60 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_init_sock
>       0.23 =C2=B1  7%      +0.2        0.39 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_schedule_loss_probe
>       0.35 =C2=B1  6%      +0.2        0.57 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.inet_sk_rebuild_header
>       0.25 =C2=B1  9%      +0.2        0.49 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__tcp_select_window
>       0.35 =C2=B1  6%      +0.3        0.61 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_ack_update_rtt
>       0.76 =C2=B1  5%      +0.3        1.04 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ip_route_output_flow
>       0.78 =C2=B1  6%      +0.3        1.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_init_transfer
>       1.78 =C2=B1  6%      +0.3        2.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_conn_request
>       1.07 =C2=B1  4%      +0.4        1.44 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ip_route_output_key_hash
>       1.02 =C2=B1  5%      +0.4        1.40 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ip_route_output_key_hash_rcu
>       2.02 =C2=B1  5%      +0.5        2.50 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_ack
>       1.04 =C2=B1  7%      +0.6        1.63 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__sk_dst_check
>       1.18 =C2=B1  7%      +0.7        1.86 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.ipv4_dst_check
>       5.95 =C2=B1  5%      +0.9        6.87 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tcp_v4_connect
>       1.02 =C2=B1  7%      -0.2        0.87 =C2=B1  5%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>       0.44 =C2=B1  8%      -0.1        0.34 =C2=B1  6%  perf-profile.self=
.cycles-pp.__tcp_get_metrics
>       0.69 =C2=B1  6%      -0.1        0.59 =C2=B1  6%  perf-profile.self=
.cycles-pp.percpu_counter_add_batch
>       0.71 =C2=B1  5%      -0.1        0.61 =C2=B1  6%  perf-profile.self=
.cycles-pp.sk_forced_mem_schedule
>       0.32 =C2=B1  6%      -0.1        0.26 =C2=B1  8%  perf-profile.self=
.cycles-pp.ip_finish_output2
>       0.35 =C2=B1  7%      -0.1        0.29 =C2=B1  5%  perf-profile.self=
.cycles-pp.tcp_recvmsg_locked
>       0.15 =C2=B1  7%      -0.0        0.12 =C2=B1  8%  perf-profile.self=
.cycles-pp.exit_to_user_mode_prepare
>       0.17 =C2=B1  6%      -0.0        0.14 =C2=B1 10%  perf-profile.self=
.cycles-pp.__skb_clone
>       0.07 =C2=B1  5%      -0.0        0.04 =C2=B1 43%  perf-profile.self=
.cycles-pp.sk_filter_trim_cap
>       0.09 =C2=B1  9%      -0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.dequeue_task_fair
>       0.08 =C2=B1  7%      -0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.release_sock
>       0.07 =C2=B1 10%      +0.0        0.09 =C2=B1  9%  perf-profile.self=
.cycles-pp.tcp_create_openreq_child
>       0.11 =C2=B1  7%      +0.0        0.15 =C2=B1  5%  perf-profile.self=
.cycles-pp.tcp_connect
>       0.08 =C2=B1  9%      +0.0        0.12 =C2=B1  8%  perf-profile.self=
.cycles-pp.inet_lhash2_lookup
>       0.09 =C2=B1  9%      +0.0        0.13 =C2=B1  6%  perf-profile.self=
.cycles-pp.inet_csk_get_port
>       0.08 =C2=B1 10%      +0.0        0.12 =C2=B1  8%  perf-profile.self=
.cycles-pp.tcp_init_transfer
>       0.08 =C2=B1  9%      +0.0        0.13 =C2=B1  8%  perf-profile.self=
.cycles-pp.tcp_newly_delivered
>       0.07 =C2=B1  7%      +0.0        0.12 =C2=B1  9%  perf-profile.self=
.cycles-pp.tcp_mtup_init
>       0.35 =C2=B1  5%      +0.1        0.40 =C2=B1  5%  perf-profile.self=
.cycles-pp.__ip_queue_xmit
>       0.16 =C2=B1  7%      +0.1        0.22 =C2=B1  6%  perf-profile.self=
.cycles-pp.__inet_bind
>       0.09 =C2=B1  8%      +0.1        0.15 =C2=B1  6%  perf-profile.self=
.cycles-pp.tcp_stream_memory_free
>       0.24 =C2=B1  6%      +0.1        0.30 =C2=B1  8%  perf-profile.self=
.cycles-pp.ip_rcv_core
>       0.06 =C2=B1  9%      +0.1        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.tcp_push
>       0.00            +0.1        0.07 =C2=B1 11%  perf-profile.self.cycl=
es-pp.tcp_rack_update_reo_wnd
>       0.23 =C2=B1  8%      +0.1        0.30 =C2=B1  6%  perf-profile.self=
.cycles-pp.ip_output
>       0.20 =C2=B1  8%      +0.1        0.28 =C2=B1  5%  perf-profile.self=
.cycles-pp.tcp_assign_congestion_control
>       0.10 =C2=B1  8%      +0.1        0.18 =C2=B1  7%  perf-profile.self=
.cycles-pp.tcp_v4_syn_recv_sock
>       0.09 =C2=B1  7%      +0.1        0.17 =C2=B1  7%  perf-profile.self=
.cycles-pp.tcp_openreq_init_rwin
>       0.07 =C2=B1 10%      +0.1        0.16 =C2=B1  6%  perf-profile.self=
.cycles-pp.tcp_v4_send_synack
>       0.13 =C2=B1  7%      +0.1        0.22 =C2=B1  7%  perf-profile.self=
.cycles-pp.tcp_sync_mss
>       0.12 =C2=B1  8%      +0.1        0.20 =C2=B1  7%  perf-profile.self=
.cycles-pp.skb_entail
>       0.18 =C2=B1  8%      +0.1        0.27 =C2=B1  6%  perf-profile.self=
.cycles-pp.ip_protocol_deliver_rcu
>       0.21 =C2=B1  5%      +0.1        0.31 =C2=B1  6%  perf-profile.self=
.cycles-pp.ip_rcv_finish_core
>       0.15 =C2=B1  9%      +0.1        0.26 =C2=B1  6%  perf-profile.self=
.cycles-pp.tcp_update_metrics
>       0.20 =C2=B1  8%      +0.1        0.31 =C2=B1  5%  perf-profile.self=
.cycles-pp.tcp_select_initial_window
>       0.12 =C2=B1  9%      +0.1        0.25 =C2=B1  8%  perf-profile.self=
.cycles-pp.tcp_connect_init
>       0.11 =C2=B1  8%      +0.1        0.24 =C2=B1  8%  perf-profile.self=
.cycles-pp.secure_tcp_ts_off
>       0.22 =C2=B1  5%      +0.1        0.35 =C2=B1  5%  perf-profile.self=
.cycles-pp.tcp_parse_options
>       0.13 =C2=B1 12%      +0.1        0.27 =C2=B1  7%  perf-profile.self=
.cycles-pp.tcp_init_metrics
>       0.17 =C2=B1  7%      +0.1        0.30 =C2=B1  7%  perf-profile.self=
.cycles-pp.tcp_update_pacing_rate
>       0.17 =C2=B1 10%      +0.2        0.32 =C2=B1  6%  perf-profile.self=
.cycles-pp.tcp_init_sock
>       0.18 =C2=B1  8%      +0.2        0.35 =C2=B1  6%  perf-profile.self=
.cycles-pp.tcp_schedule_loss_probe
>       0.42 =C2=B1  8%      +0.2        0.62 =C2=B1  7%  perf-profile.self=
.cycles-pp.tcp_write_xmit
>       0.25 =C2=B1  8%      +0.2        0.48 =C2=B1  7%  perf-profile.self=
.cycles-pp.__tcp_select_window
>       0.28 =C2=B1  8%      +0.3        0.56 =C2=B1  5%  perf-profile.self=
.cycles-pp.tcp_ack_update_rtt
>       0.71 =C2=B1  5%      +0.4        1.09 =C2=B1  6%  perf-profile.self=
.cycles-pp.ip_route_output_key_hash_rcu
>       1.17 =C2=B1  7%      +0.7        1.84 =C2=B1  7%  perf-profile.self=
.cycles-pp.ipv4_dst_check
> =

> =

>                                                                          =
       =

>                                netperf.Throughput_tps                    =
       =

>                                                                          =
       =

>   22500 +----------------------------------------------------------------=
---+   =

>         |        ...+......                           ...+......+.....+..=
...|   =

>   22000 |.....+..          +.....+.....+.....+.....+..                   =
   |   =

>         |                                                                =
   |   =

>         |                                                                =
   |   =

>   21500 |-+                                                              =
   |   =

>         |                                                                =
   |   =

>   21000 |-+                                                              =
   |   =

>         |                                                                =
   |   =

>   20500 |-+                                                              =
   |   =

>         |                                                                =
   |   =

>         |                                                                =
   |   =

>   20000 |-+                                                              =
   |   =

>         |     O     O            O     O                 O               =
   |   =

>   19500 +----------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             netperf.Throughput_total_tps                 =
       =

>                                                                          =
       =

>   360000 +---------------------------------------------------------------=
---+   =

>   355000 |-+      ...+.....                ...+.....   ...+..         +..=
...|   =

>          |.....+..         +.....+.....+...         +..                  =
   |   =

>   350000 |-+                                                             =
   |   =

>   345000 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>   340000 |-+                                                             =
   |   =

>   335000 |-+                                                             =
   |   =

>   330000 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>   325000 |-+                                                             =
   |   =

>   320000 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>   315000 |-+   O     O     O     O     O      O     O     O     O     O  =
   |   =

>   310000 +---------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                    netperf.workload                      =
       =

>                                                                          =
       =

>   1.08e+08 +-------------------------------------------------------------=
---+   =

>            |        ...+.....+.....         ..+.....   ...+..         +..=
...|   =

>   1.06e+08 |.....+..               +.....+..        +..                  =
   |   =

>   1.04e+08 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>   1.02e+08 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>      1e+08 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>    9.8e+07 |-+                                                           =
   |   =

>    9.6e+07 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>    9.4e+07 |-+   O     O     O     O     O    O     O     O     O     O  =
   |   =

>            |                                                             =
   |   =

>    9.2e+07 +-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                         netperf.time.voluntary_context_switches          =
       =

>                                                                          =
       =

>    2.1e+08 +-------------------------------------------------------------=
---+   =

>            |.....+.....+.....+.....+.....+....+.....   ...+..         +..=
...|   =

>   2.05e+08 |-+                                      +..                  =
   |   =

>            |                                                             =
   |   =

>            |                                                             =
   |   =

>      2e+08 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>   1.95e+08 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>    1.9e+08 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>            |                                                             =
   |   =

>   1.85e+08 |-+   O     O     O     O     O          O     O              =
   |   =

>            |                                  O                 O     O  =
   |   =

>    1.8e+08 +-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                                                          =
       =

>                                                                          =
       =

>    0.006 +---------------------------------------------------------------=
---+   =

>          |                                                               =
   |   =

>          |                                                               =
   |   =

>   0.0058 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>          |                                                               =
   |   =

>   0.0056 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>   0.0054 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>          |                                                               =
   |   =

>   0.0052 |-+                                                             =
   |   =

>          |                                                               =
   |   =

>          |                                                               =
   |   =

>    0.005 +---------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                                                          =
       =

>                                                                          =
       =

>   3.25e+06 +-------------------------------------------------------------=
---+   =

>            |.....   ...+....          ...+....+.....+.....+.....   ...+..=
...|   =

>    3.2e+06 |-+   +..        .   ...+..                          +..      =
   |   =

>            |                 +..                                         =
   |   =

>   3.15e+06 |-+                                                           =
   |   =

>    3.1e+06 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>   3.05e+06 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>      3e+06 |-+                                                           =
   |   =

>   2.95e+06 |-+                                                           =
   |   =

>            |                                                             =
   |   =

>    2.9e+06 |-+   O     O     O           O    O     O     O     O     O  =
   |   =

>            |                       O                                     =
   |   =

>   2.85e+06 +-------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
       =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

> *************************************************************************=
**************************
> lkp-icl-2sp1: 96 threads 2 sockets Ice Lake with 256G memory
> =

> =

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



> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'netperf'
> 	export testcase=3D'netperf'
> 	export category=3D'benchmark'
> 	export disable_latency_stats=3D1
> 	export set_nic_irq_affinity=3D1
> 	export ip=3D'ipv4'
> 	export runtime=3D300
> 	export nr_threads=3D16
> 	export cluster=3D'cs-localhost'
> 	export job_origin=3D'netperf-small-threads.yaml'
> 	export queue_cmdline_keys=3D
> 	export queue=3D'vip'
> 	export testbox=3D'lkp-csl-2ap3'
> 	export tbox_group=3D'lkp-csl-2ap3'
> 	export kconfig=3D'x86_64-rhel-8.3'
> 	export submit_id=3D'617960e80b9a930a5af4f104'
> 	export job_file=3D'/lkp/jobs/scheduled/lkp-csl-2ap3/netperf-cs-localhost=
-performance-ipv4-16-300s-TCP_CRR-ucode=3D0x5003006-debian-10.4-x86_64-2020=
0603.cgz-a0918006f9284b77397ae4f163-20211027-68186-ja0nr3-6.yaml'
> 	export id=3D'fbecc857f957790eb9cfac7363705ffadfda23f9'
> 	export queuer_version=3D'/lkp/xsang/.src-20211027-151141'
> 	export model=3D'Cascade Lake'
> 	export nr_node=3D4
> 	export nr_cpu=3D192
> 	export memory=3D'192G'
> 	export ssd_partitions=3D
> 	export rootfs_partition=3D'LABEL=3DLKP-ROOTFS'
> 	export kernel_cmdline_hw=3D'acpi_rsdp=3D0x67f44014'
> 	export brand=3D'Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz'
> 	export commit=3D'a0918006f9284b77397ae4f163f055c3e0f987b2'
> 	export need_kconfig_hw=3D'{"IGB"=3D>"y"}
> BLK_DEV_NVME'
> 	export ucode=3D'0x5003006'
> 	export enqueue_time=3D'2021-10-27 22:23:36 +0800'
> 	export _id=3D'617960f00b9a930a5af4f10a'
> 	export _rt=3D'/result/netperf/cs-localhost-performance-ipv4-16-300s-TCP_=
CRR-ucode=3D0x5003006/lkp-csl-2ap3/debian-10.4-x86_64-20200603.cgz/x86_64-r=
hel-8.3/gcc-9/a0918006f9284b77397ae4f163f055c3e0f987b2'
> 	export user=3D'lkp'
> 	export compiler=3D'gcc-9'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export head_commit=3D'955f175760f41ad2a80b07a390bac9a0444a47a6'
> 	export base_commit=3D'519d81956ee277b4419c723adfb154603c2565ba'
> 	export branch=3D'linux-devel/devel-hourly-20211025-030231'
> 	export rootfs=3D'debian-10.4-x86_64-20200603.cgz'
> 	export result_root=3D'/result/netperf/cs-localhost-performance-ipv4-16-3=
00s-TCP_CRR-ucode=3D0x5003006/lkp-csl-2ap3/debian-10.4-x86_64-20200603.cgz/=
x86_64-rhel-8.3/gcc-9/a0918006f9284b77397ae4f163f055c3e0f987b2/8'
> 	export scheduler_version=3D'/lkp/lkp/.src-20211027-140142'
> 	export arch=3D'x86_64'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/debian/debian-10.4-x86_64-20200603.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> user=3Dlkp
> job=3D/lkp/jobs/scheduled/lkp-csl-2ap3/netperf-cs-localhost-performance-i=
pv4-16-300s-TCP_CRR-ucode=3D0x5003006-debian-10.4-x86_64-20200603.cgz-a0918=
006f9284b77397ae4f163-20211027-68186-ja0nr3-6.yaml
> ARCH=3Dx86_64
> kconfig=3Dx86_64-rhel-8.3
> branch=3Dlinux-devel/devel-hourly-20211025-030231
> commit=3Da0918006f9284b77397ae4f163f055c3e0f987b2
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/a0918006f9284b77397ae4f163f=
055c3e0f987b2/vmlinuz-5.15.0-rc4-00001-ga0918006f928
> acpi_rsdp=3D0x67f44014
> max_uptime=3D2100
> RESULT_ROOT=3D/result/netperf/cs-localhost-performance-ipv4-16-300s-TCP_C=
RR-ucode=3D0x5003006/lkp-csl-2ap3/debian-10.4-x86_64-20200603.cgz/x86_64-rh=
el-8.3/gcc-9/a0918006f9284b77397ae4f163f055c3e0f987b2/8
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
> 	export modules_initrd=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/a0918006f9284b=
77397ae4f163f055c3e0f987b2/modules.cgz'
> 	export bm_initrd=3D'/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ip=
config_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20210=
707.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608=
.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/netperf_20210930.cgz,/os=
image/pkg/debian-10.4-x86_64-20200603.cgz/netperf-x86_64-2.7-0_20211027.cgz=
,/osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/osimage=
/deps/debian-10.4-x86_64-20200603.cgz/turbostat_20200721.cgz,/osimage/pkg/d=
ebian-10.4-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200721.cgz,/osimage=
/deps/debian-10.4-x86_64-20200603.cgz/perf_20211027.cgz,/osimage/pkg/debian=
-10.4-x86_64-20200603.cgz/perf-x86_64-d25f27432f80-1_20211027.cgz,/osimage/=
pkg/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cgz,/osim=
age/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz,/osimage/deps/debi=
an-10.4-x86_64-20200603.cgz/cluster_20211026.cgz'
> 	export ucode_initrd=3D'/osimage/ucode/intel-ucode-20210222.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-x86_64.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export last_kernel=3D'5.15.0-rc6-wt-12022-g955f175760f4'
> 	export queue_at_least_once=3D0
> 	export schedule_notify_address=3D
> 	export kernel=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/a0918006f9284b77397ae4=
f163f055c3e0f987b2/vmlinuz-5.15.0-rc4-00001-ga0918006f928'
> 	export dequeue_time=3D'2021-10-28 03:03:20 +0800'
> 	export node_roles=3D'server client'
> 	export job_initrd=3D'/lkp/jobs/scheduled/lkp-csl-2ap3/netperf-cs-localho=
st-performance-ipv4-16-300s-TCP_CRR-ucode=3D0x5003006-debian-10.4-x86_64-20=
200603.cgz-a0918006f9284b77397ae4f163-20211027-68186-ja0nr3-6.cgz'
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
> 	run_monitor lite_mode=3D1 $LKP_SRC/monitors/no-stdout/wrapper perf-profi=
le
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> =

> 	if role server
> 	then
> 		start_daemon $LKP_SRC/daemon/netserver
> 	fi
> =

> 	if role client
> 	then
> 		run_test test=3D'TCP_CRR' $LKP_SRC/tests/wrapper netperf
> 	fi
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	env test=3D'TCP_CRR' $LKP_SRC/stats/wrapper netperf
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
> 	env lite_mode=3D1 $LKP_SRC/stats/wrapper perf-profile
> =

> 	$LKP_SRC/stats/wrapper time netperf.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"

> ---
> :#! jobs/netperf-small-threads.yaml:
> suite: netperf
> testcase: netperf
> category: benchmark
> :# upto 90% CPU cycles may be used by latency stats:
> disable_latency_stats: 1
> set_nic_irq_affinity: 1
> ip: ipv4
> runtime: 300s
> nr_threads: 16
> cluster: cs-localhost
> if role server:
>   netserver:
> if role client:
>   netperf:
>     test: TCP_CRR
> job_origin: netperf-small-threads.yaml
> :#! queue options:
> queue_cmdline_keys: []
> queue: vip
> testbox: lkp-csl-2ap3
> tbox_group: lkp-csl-2ap3
> kconfig: x86_64-rhel-8.3
> submit_id: 617960e80b9a930a5af4f104
> job_file: "/lkp/jobs/scheduled/lkp-csl-2ap3/netperf-cs-localhost-performa=
nce-ipv4-16-300s-TCP_CRR-ucode=3D0x5003006-debian-10.4-x86_64-20200603.cgz-=
a0918006f9284b77397ae4f163-20211027-68186-ja0nr3-4.yaml"
> id: d804900eed74d058b23143a825d247e0f8d03392
> queuer_version: "/lkp/xsang/.src-20211027-151141"
> :#! hosts/lkp-csl-2ap3:
> model: Cascade Lake
> nr_node: 4
> nr_cpu: 192
> memory: 192G
> ssd_partitions:
> rootfs_partition: LABEL=3DLKP-ROOTFS
> kernel_cmdline_hw: acpi_rsdp=3D0x67f44014
> brand: Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz
> :#! include/category/benchmark:
> kmsg:
> boot-time:
> uptime:
> iostat:
> heartbeat:
> vmstat:
> numa-numastat:
> numa-vmstat:
> numa-meminfo:
> proc-vmstat:
> proc-stat:
> meminfo:
> slabinfo:
> interrupts:
> lock_stat:
> perf-sched:
>   lite_mode: 1
> softirqs:
> bdi_dev_mapping:
> diskstats:
> nfsstat:
> cpuidle:
> cpufreq-stats:
> turbostat:
> sched_debug:
> perf-stat:
> mpstat:
> perf-profile:
>   lite_mode: 1
> :#! include/category/ALL:
> cpufreq_governor: performance
> :#! include/queue/cyclic:
> commit: a0918006f9284b77397ae4f163f055c3e0f987b2
> :#! include/testbox/lkp-csl-2ap3:
> need_kconfig_hw:
> - IGB: y
> - BLK_DEV_NVME
> ucode: '0x5003006'
> enqueue_time: 2021-10-27 22:23:36.647383432 +08:00
> _id: 617960f00b9a930a5af4f108
> _rt: "/result/netperf/cs-localhost-performance-ipv4-16-300s-TCP_CRR-ucode=
=3D0x5003006/lkp-csl-2ap3/debian-10.4-x86_64-20200603.cgz/x86_64-rhel-8.3/g=
cc-9/a0918006f9284b77397ae4f163f055c3e0f987b2"
> :#! schedule options:
> user: lkp
> compiler: gcc-9
> LKP_SERVER: internal-lkp-server
> head_commit: 955f175760f41ad2a80b07a390bac9a0444a47a6
> base_commit: 519d81956ee277b4419c723adfb154603c2565ba
> branch: linux-devel/devel-hourly-20211025-030231
> rootfs: debian-10.4-x86_64-20200603.cgz
> result_root: "/result/netperf/cs-localhost-performance-ipv4-16-300s-TCP_C=
RR-ucode=3D0x5003006/lkp-csl-2ap3/debian-10.4-x86_64-20200603.cgz/x86_64-rh=
el-8.3/gcc-9/a0918006f9284b77397ae4f163f055c3e0f987b2/0"
> scheduler_version: "/lkp/lkp/.src-20211027-140142"
> arch: x86_64
> max_uptime: 2100
> initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/jobs/scheduled/lkp-csl-2ap3/netperf-cs-localhost-performance=
-ipv4-16-300s-TCP_CRR-ucode=3D0x5003006-debian-10.4-x86_64-20200603.cgz-a09=
18006f9284b77397ae4f163-20211027-68186-ja0nr3-4.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel-8.3
> - branch=3Dlinux-devel/devel-hourly-20211025-030231
> - commit=3Da0918006f9284b77397ae4f163f055c3e0f987b2
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/a0918006f9284b77397ae4f16=
3f055c3e0f987b2/vmlinuz-5.15.0-rc4-00001-ga0918006f928
> - acpi_rsdp=3D0x67f44014
> - max_uptime=3D2100
> - RESULT_ROOT=3D/result/netperf/cs-localhost-performance-ipv4-16-300s-TCP=
_CRR-ucode=3D0x5003006/lkp-csl-2ap3/debian-10.4-x86_64-20200603.cgz/x86_64-=
rhel-8.3/gcc-9/a0918006f9284b77397ae4f163f055c3e0f987b2/0
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
> modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/a0918006f9284b77397ae4f=
163f055c3e0f987b2/modules.cgz"
> bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20=
200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20210707.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osi=
mage/deps/debian-10.4-x86_64-20200603.cgz/netperf_20210930.cgz,/osimage/pkg=
/debian-10.4-x86_64-20200603.cgz/netperf-x86_64-2.7-0_20211025.cgz,/osimage=
/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/osimage/deps/deb=
ian-10.4-x86_64-20200603.cgz/turbostat_20200721.cgz,/osimage/pkg/debian-10.=
4-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200721.cgz,/osimage/deps/deb=
ian-10.4-x86_64-20200603.cgz/perf_20211027.cgz,/osimage/pkg/debian-10.4-x86=
_64-20200603.cgz/perf-x86_64-d25f27432f80-1_20211027.cgz,/osimage/pkg/debia=
n-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cgz,/osimage/deps/=
debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz,/osimage/deps/debian-10.4-x=
86_64-20200603.cgz/cluster_20211026.cgz"
> ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
> lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
> site: inn
> :#! /lkp/lkp/.src-20211026-143536/include/site/inn:
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> oom-killer:
> watchdog:
> :#! runtime status:
> last_kernel: 5.15.0-rc6-wt-12022-g955f175760f4
> queue_at_least_once: 0
> :#! /lkp/lkp/.src-20211026-205023/include/site/inn:
> :#! user overrides:
> schedule_notify_address:
> kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/a0918006f9284b77397ae4f163f055c=
3e0f987b2/vmlinuz-5.15.0-rc4-00001-ga0918006f928"
> dequeue_time: 2021-10-28 02:02:15.174367353 +08:00
> :#! /lkp/lkp/.src-20211027-140142/include/site/inn:
> job_state: finished
> loadavg: 6.09 10.58 5.53 1/1355 19660
> start_time: '1635357811'
> end_time: '1635358116'
> version: "/lkp/lkp/.src-20211027-140222:5f87ddf4:8610dc698"

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

> netserver -4 -D
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> netperf -4 -H 127.0.0.1 -t TCP_CRR -c -C -l 300  &
> wait


-- =

Kees Cook
--===============3867080730747451975==--

