Content-Type: multipart/mixed; boundary="===============4061602740567518022=="
MIME-Version: 1.0
From: Wang, Kemi <kemi.wang@intel.com>
To: lkp@lists.01.org
Subject: Re: [tcp] a337531b94: netperf.Throughput_Mbps -6.1% regression
Date: Sun, 28 Oct 2018 01:43:02 +0000
Message-ID: <25017BF213203E48912DB000DE5F5E1E7632A249@SHSMSX101.ccr.corp.intel.com>
In-Reply-To: <e22a09c4-8bbb-e482-6e1e-59ea1111eda3@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4061602740567518022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Eric
   Thanks for the info.
   We rerun the test and verified that this issue has been fixed with commi=
t 041a14d2671573611ffd6412bc16e2f64469f7fb.
   Only about  0.1% performance difference was observed.
 =



-----Original Message-----
From: LKP [mailto:lkp-bounces(a)lists.01.org] On Behalf Of Eric Dumazet
Sent: Wednesday, October 24, 2018 9:27 PM
To: Chen, Rong A <rong.a.chen@intel.com>; Yuchung Cheng <ycheng@google.=
com>
Cc: Soheil Hassas Yeganeh <soheil@google.com>; netdev(a)vger.kernel.org; =
LKML <linux-kernel@vger.kernel.org>; Eric Dumazet <edumazet@google.com>=
; lkp(a)01.org; Wei Wang <weiwan@google.com>; Neal Cardwell <ncardwell@=
google.com>; David S. Miller <davem@davemloft.net>
Subject: Re: [LKP] [tcp] a337531b94: netperf.Throughput_Mbps -6.1% regressi=
on

Hi Rong

This has been reported already, and we believe this has been fixed with :

commit 041a14d2671573611ffd6412bc16e2f64469f7fb
Author: Yuchung Cheng <ycheng@google.com>
Date:   Mon Oct 1 15:42:32 2018 -0700

    tcp: start receiver buffer autotuning sooner
    =

    Previously receiver buffer auto-tuning starts after receiving
    one advertised window amount of data. After the initial receiver
    buffer was raised by patch a337531b942b ("tcp: up initial rmem to
    128KB and SYN rwin to around 64KB"), the reciver buffer may take
    too long to start raising. To address this issue, this patch lowers
    the initial bytes expected to receive roughly the expected sender's
    initial window.
    =

    Fixes: a337531b942b ("tcp: up initial rmem to 128KB and SYN rwin to aro=
und 64KB")
    Signed-off-by: Yuchung Cheng <ycheng@google.com>
    Signed-off-by: Wei Wang <weiwan@google.com>
    Signed-off-by: Neal Cardwell <ncardwell@google.com>
    Signed-off-by: Eric Dumazet <edumazet@google.com>
    Reviewed-by: Soheil Hassas Yeganeh <soheil@google.com>
    Signed-off-by: David S. Miller <davem@davemloft.net>


Thanks

On 10/24/2018 05:13 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -6.1% regression of netperf.Throughput_Mbps due to comm=
it:
> =

> =

> commit: a337531b942bd8a03e7052444d7e36972aac2d92 ("tcp: up initial rmem t=
o 128KB and SYN rwin to around 64KB")
> https://git.kernel.org/cgit/linux/kernel/git/davem/net-next.git master
> =

> in testcase: netperf
> on test machine: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 8G=
 memory
> with following parameters:
> =

> 	ip: ipv4
> 	runtime: 900s
> 	nr_threads: 200%
> 	cluster: cs-localhost
> 	test: TCP_STREAM
> 	ucode: 0x7000013
> 	cpufreq_governor: performance
> =

> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
--------------+
> | testcase: change | netperf: netperf.Throughput_Mbps -1.0% regression   =
              |
> | test machine     | 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz wit=
h 8G memory   |
> | test parameters  | cluster=3Dcs-localhost                              =
                |
> |                  | cpufreq_governor=3Dperformance                      =
                |
> |                  | ip=3Dipv4                                           =
                |
> |                  | nr_threads=3D200%                                   =
                |
> |                  | runtime=3D300s                                      =
                |
> |                  | send_size=3D5K                                      =
                |
> |                  | test=3DTCP_SENDFILE                                 =
                |
> |                  | ucode=3D0x7000013                                   =
                |
> +------------------+-----------------------------------------------------=
--------------+
> | testcase: change | netperf: netperf.Throughput_Mbps -5.9% regression   =
              |
> | test machine     | 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz wit=
h 8G memory   |
> | test parameters  | cluster=3Dcs-localhost                              =
                |
> |                  | cpufreq_governor=3Dperformance                      =
                |
> |                  | ip=3Dipv4                                           =
                |
> |                  | nr_threads=3D200%                                   =
                |
> |                  | runtime=3D900s                                      =
                |
> |                  | test=3DTCP_MAERTS                                   =
                |
> |                  | ucode=3D0x7000013                                   =
                |
> +------------------+-----------------------------------------------------=
--------------+
> | testcase: change | netperf: netperf.Throughput_Mbps -3.2% regression   =
              |
> | test machine     | 4 threads Intel(R) Core(TM) i5-3317U CPU @ 1.70GHz w=
ith 4G memory |
> | test parameters  | cluster=3Dcs-localhost                              =
                |
> |                  | cpufreq_governor=3Dperformance                      =
                |
> |                  | ip=3Dipv4                                           =
                |
> |                  | nr_threads=3D200%                                   =
                |
> |                  | runtime=3D900s                                      =
                |
> |                  | test=3DTCP_MAERTS                                   =
                |
> |                  | ucode=3D0x20                                        =
                |
> +------------------+-----------------------------------------------------=
--------------+
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
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-7/performance/ipv4/x86_64-rhel-7.2/200%/debian-x86_64-=
2018-04-03.cgz/900s/lkp-bdw-de1/TCP_STREAM/netperf/0x7000013
> =

> commit: =

>   3ff6cde846 ("hns3: Another build fix.")
>   a337531b94 ("tcp: up initial rmem to 128KB and SYN rwin to around 64KB")
> =

> 3ff6cde846857d45 a337531b942bd8a03e7052444d =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4           50%           2:4     dmesg.WARNING:at#for_ip_int=
errupt_entry/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>       2497            -6.1%       2345        netperf.Throughput_Mbps
>      79924            -6.1%      75061        netperf.Throughput_total_Mb=
ps
>     186513           +11.3%     207590        netperf.time.involuntary_co=
ntext_switches
>  5.488e+08            -6.1%  5.154e+08        netperf.workload
>       1172 =C2=B1 34%     -37.6%     731.75 =C2=B1  5%  cpuidle.C1E.usage
>       1137 =C2=B1 34%     -40.0%     682.25 =C2=B1  8%  turbostat.C1E
>       2775 =C2=B1 11%     +17.5%       3261 =C2=B1  9%  sched_debug.cpu.n=
r_switches.stddev
>       0.01 =C2=B1 17%     +28.2%       0.01 =C2=B1 10%  sched_debug.rt_rq=
:/.rt_time.avg
>       0.14 =C2=B1 17%     +28.2%       0.18 =C2=B1 10%  sched_debug.rt_rq=
:/.rt_time.max
>       0.03 =C2=B1 17%     +28.2%       0.04 =C2=B1 10%  sched_debug.rt_rq=
:/.rt_time.stddev
>      66336            +0.9%      66948        proc-vmstat.nr_anon_pages
>  2.755e+08            -6.1%  2.588e+08        proc-vmstat.numa_hit
>  2.755e+08            -6.1%  2.588e+08        proc-vmstat.numa_local
>  2.197e+09            -6.1%  2.064e+09        proc-vmstat.pgalloc_normal
>  2.197e+09            -6.1%  2.064e+09        proc-vmstat.pgfree
>  5.903e+11            -7.9%  5.438e+11        perf-stat.branch-instructio=
ns
>       2.68            -0.0        2.64        perf-stat.branch-miss-rate%
>  1.582e+10            -9.2%  1.436e+10        perf-stat.branch-misses
>   6.26e+11            -4.7%  5.964e+11        perf-stat.cache-misses
>   6.26e+11            -4.7%  5.964e+11        perf-stat.cache-references
>      11.69            +8.6%      12.69        perf-stat.cpi
>     123723            +2.1%     126291        perf-stat.cpu-migrations
>       0.09 =C2=B1  2%      +0.0        0.09        perf-stat.dTLB-load-mi=
ss-rate%
>  1.475e+12            -7.1%   1.37e+12        perf-stat.dTLB-loads
>  1.094e+12            -6.9%  1.018e+12        perf-stat.dTLB-stores
>  2.912e+08 =C2=B1  5%     -13.0%  2.533e+08        perf-stat.iTLB-loads
>  3.019e+12            -7.9%  2.781e+12        perf-stat.instructions
>       0.09            -7.9%       0.08        perf-stat.ipc
>       5500            -1.9%       5394        perf-stat.path-length
>       0.53 =C2=B1  2%      -0.2        0.38 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit=
.__tcp_push_pending_frames
>       0.63 =C2=B1  2%      -0.1        0.58 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.syscall_return_via_sysret
>       0.73 =C2=B1  3%      +0.1        0.78 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.tcp_clean_rtx_queue.tcp_ack.tcp_rcv_established.tcp_v4_do_r=
cv.tcp_v4_rcv
>       0.96            +0.1        1.03        perf-profile.calltrace.cycl=
es-pp.tcp_ack.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver=
_finish
>      98.02            +0.1       98.13        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>      97.88            +0.1       98.00        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.70 =C2=B1  3%      -0.1        0.64 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.syscall_return_via_sysret
>       0.26 =C2=B1  5%      -0.0        0.21 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_bh
>       0.28 =C2=B1  5%      -0.0        0.24 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.lock_sock_nested
>       0.46 =C2=B1  4%      -0.0        0.43 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.nf_hook_slow
>       0.21 =C2=B1  8%      -0.0        0.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tcp_rcv_space_adjust
>       0.08 =C2=B1  5%      -0.0        0.06        perf-profile.children.=
cycles-pp.entry_SYSCALL_64_stage2
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ip_finish_output
>       0.17 =C2=B1  6%      +0.0        0.20 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tcp_event_new_data_sent
>       0.24 =C2=B1  4%      +0.0        0.27 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.mod_timer
>       0.15 =C2=B1  2%      +0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__might_sleep
>       0.80 =C2=B1  3%      +0.0        0.84 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tcp_clean_rtx_queue
>       0.30 =C2=B1  3%      +0.1        0.36 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__might_fault
>       1.61 =C2=B1  4%      +0.1        1.69        perf-profile.children.=
cycles-pp.__release_sock
>       1.06 =C2=B1  2%      +0.1        1.14        perf-profile.children.=
cycles-pp.tcp_ack
>      98.24            +0.1       98.36        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      98.09            +0.1       98.23        perf-profile.children.cycle=
s-pp.do_syscall_64
>      70.28            +0.6       70.86        perf-profile.children.cycle=
s-pp.copy_user_enhanced_fast_string
>       1.56            -0.1        1.48 =C2=B1  3%  perf-profile.self.cycl=
es-pp.copy_page_to_iter
>       0.70 =C2=B1  3%      -0.1        0.64 =C2=B1  4%  perf-profile.self=
.cycles-pp.syscall_return_via_sysret
>       1.37 =C2=B1  2%      -0.1        1.32 =C2=B1  2%  perf-profile.self=
.cycles-pp.__free_pages_ok
>       0.55 =C2=B1  3%      -0.0        0.50 =C2=B1  3%  perf-profile.self=
.cycles-pp.__alloc_skb
>       0.44 =C2=B1  3%      -0.0        0.40 =C2=B1  5%  perf-profile.self=
.cycles-pp.tcp_recvmsg
>       0.16 =C2=B1  9%      -0.0        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.sock_has_perm
>       0.08 =C2=B1  6%      -0.0        0.06        perf-profile.self.cycl=
es-pp.entry_SYSCALL_64_stage2
>       0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.tcp_clean_rtx_queue
>       0.14 =C2=B1  6%      +0.0        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.__might_sleep
>      69.25            +0.5       69.77        perf-profile.self.cycles-pp=
.copy_user_enhanced_fast_string
> =

> =

>                                                                          =
       =

>                               netperf.Throughput_Mbps                    =
       =

>                                                                          =
       =

>   3000 +-+---------------------------------------------------------------=
---+   =

>        |                                                                 =
   |   =

>   2500 +-+..+.+..+.+..+.+..+.+..+.+..+.+..+.+.+..+.+..+.+..+.+..+.+..+.+.=
.+.|   =

>        O O  O O  O O  O O  O O  O O  O O  O O O  O O  O O  O O  O O      =
   |   =

>        | :                                                               =
   |   =

>   2000 +-+                                                               =
   |   =

>        |:                                                                =
   |   =

>   1500 +-+                                                               =
   |   =

>        |:                                                                =
   |   =

>   1000 +-+                                                               =
   |   =

>        |:                                                                =
   |   =

>        |:                                                                =
   |   =

>    500 +-+                                                               =
   |   =

>        |                                                                 =
   |   =

>      0 +-+---------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             netperf.Throughput_total_Mbps                =
       =

>                                                                          =
       =

>   90000 +-+--------------------------------------------------------------=
---+   =

>         |                                                                =
   |   =

>   80000 O-O..O.O..O.O..O.O.O..O.O..O.O..O.O.O..O.O..O.O..O.O.O..O.O..+.+.=
.+.|   =

>   70000 +-+                                                              =
   |   =

>         | :                                                              =
   |   =

>   60000 +-+                                                              =
   |   =

>   50000 +-+                                                              =
   |   =

>         |:                                                               =
   |   =

>   40000 +-+                                                              =
   |   =

>   30000 +-+                                                              =
   |   =

>         |:                                                               =
   |   =

>   20000 +-+                                                              =
   |   =

>   10000 +-+                                                              =
   |   =

>         |                                                                =
   |   =

>       0 +-+--------------------------------------------------------------=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                   netperf.workload                       =
       =

>                                                                          =
       =

>   6e+08 +-+--------------------------------------------------------------=
---+   =

>         | +..+.+..+.+..+.+.+..+.+..+.+..+.+.+..+.+..+.+..+.+.+..+.+..+.+.=
.+.|   =

>   5e+08 O-O  O O  O O  O O O  O O  O O  O O O  O O  O O  O O O  O O      =
   |   =

>         | :                                                              =
   |   =

>         | :                                                              =
   |   =

>   4e+08 +-+                                                              =
   |   =

>         |:                                                               =
   |   =

>   3e+08 +-+                                                              =
   |   =

>         |:                                                               =
   |   =

>   2e+08 +-+                                                              =
   |   =

>         |:                                                               =
   |   =

>         |                                                                =
   |   =

>   1e+08 +-+                                                              =
   |   =

>         |                                                                =
   |   =

>       0 +-+--------------------------------------------------------------=
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
> lkp-bdw-de1: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 8G mem=
ory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/se=
nd_size/tbox_group/test/testcase/ucode:
>   cs-localhost/gcc-7/performance/ipv4/x86_64-rhel-7.2/200%/debian-x86_64-=
2018-04-03.cgz/300s/5K/lkp-bdw-de1/TCP_SENDFILE/netperf/0x7000013
> =

> commit: =

>   3ff6cde846 ("hns3: Another build fix.")
>   a337531b94 ("tcp: up initial rmem to 128KB and SYN rwin to around 64KB")
> =

> 3ff6cde846857d45 a337531b942bd8a03e7052444d =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           1:4          -25%            :4     dmesg.WARNING:at#for_ip_int=
errupt_entry/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>       5211            -1.0%       5160        netperf.Throughput_Mbps
>     166777            -1.0%     165138        netperf.Throughput_total_Mb=
ps
>       1268            -1.6%       1247        netperf.time.percent_of_cpu=
_this_job_got
>       3539            -1.6%       3481        netperf.time.system_time
>     282.77            -1.5%     278.54        netperf.time.user_time
>    1435875            -1.0%    1421780        netperf.time.voluntary_cont=
ext_switches
>  1.222e+09            -1.0%   1.21e+09        netperf.workload
>      22728            -1.3%      22437        vmstat.system.cs
>    1218263 =C2=B1  3%      -5.6%    1150027 =C2=B1  4%  proc-vmstat.pgall=
oc_normal
>    1197588 =C2=B1  4%      -6.0%    1125684 =C2=B1  4%  proc-vmstat.pgfree
>       3424 =C2=B1 17%     -28.2%       2456 =C2=B1 21%  sched_debug.cpu.n=
r_load_updates.stddev
>       9.00 =C2=B1 11%     -19.9%       7.21 =C2=B1 11%  sched_debug.cpu.n=
r_uninterruptible.max
>   35344728 =C2=B1 33%     -94.5%    1954598 =C2=B1144%  cpuidle.C3.time
>      79217 =C2=B1 32%     -95.5%       3571 =C2=B1115%  cpuidle.C3.usage
>   13342584 =C2=B1 19%    +253.4%   47153200 =C2=B1 34%  cpuidle.C6.time
>      17886 =C2=B1 21%    +185.8%      51115 =C2=B1 34%  cpuidle.C6.usage
>       4295 =C2=B1 24%    +108.0%       8934 =C2=B1 53%  cpuidle.POLL.time
>      79180 =C2=B1 32%     -95.6%       3487 =C2=B1118%  turbostat.C3
>       0.73 =C2=B1 32%      -0.7        0.04 =C2=B1144%  turbostat.C3%
>      17693 =C2=B1 21%    +187.9%      50931 =C2=B1 34%  turbostat.C6
>       0.27 =C2=B1 19%      +0.7        0.97 =C2=B1 34%  turbostat.C6%
>       0.35 =C2=B1 30%     -89.9%       0.04 =C2=B1173%  turbostat.CPU%c3
>       0.08 =C2=B1  6%    +693.3%       0.59 =C2=B1 38%  turbostat.CPU%c6
>       2.95            +3.1%       3.04        turbostat.RAMWatt
>  1.711e+12            -1.3%  1.689e+12        perf-stat.branch-instructio=
ns
>  5.345e+10            -1.2%  5.283e+10        perf-stat.branch-misses
>  9.417e+10           +16.7%  1.099e+11        perf-stat.cache-misses
>  9.417e+10           +16.7%  1.099e+11        perf-stat.cache-references
>    6927335            -1.1%    6849494        perf-stat.context-switches
>  2.936e+12            -1.3%  2.899e+12        perf-stat.dTLB-loads
>  1.796e+12            -1.3%  1.773e+12        perf-stat.dTLB-stores
>      80.43            +3.5       83.95        perf-stat.iTLB-load-miss-ra=
te%
>  3.809e+09 =C2=B1  4%      -4.7%  3.629e+09 =C2=B1  2%  perf-stat.iTLB-lo=
ad-misses
>  9.248e+08 =C2=B1  3%     -25.0%  6.934e+08        perf-stat.iTLB-loads
>  8.835e+12            -1.3%  8.719e+12        perf-stat.instructions
>      69.17            -1.1       68.08        perf-profile.calltrace.cycl=
es-pp.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      65.80            -1.0       64.79        perf-profile.calltrace.cycl=
es-pp.do_sendfile.__x64_sys_sendfile64.do_syscall_64.entry_SYSCALL_64_after=
_hwframe
>      55.88            -0.8       55.04        perf-profile.calltrace.cycl=
es-pp.do_splice_direct.do_sendfile.__x64_sys_sendfile64.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>      52.32            -0.8       51.56        perf-profile.calltrace.cycl=
es-pp.splice_direct_to_actor.do_splice_direct.do_sendfile.__x64_sys_sendfil=
e64.do_syscall_64
>      35.71            -0.6       35.11        perf-profile.calltrace.cycl=
es-pp.direct_splice_actor.splice_direct_to_actor.do_splice_direct.do_sendfi=
le.__x64_sys_sendfile64
>      34.84            -0.6       34.26        perf-profile.calltrace.cycl=
es-pp.splice_from_pipe.direct_splice_actor.splice_direct_to_actor.do_splice=
_direct.do_sendfile
>      33.94            -0.5       33.41        perf-profile.calltrace.cycl=
es-pp.__splice_from_pipe.splice_from_pipe.direct_splice_actor.splice_direct=
_to_actor.do_splice_direct
>      26.16            -0.5       25.70        perf-profile.calltrace.cycl=
es-pp.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sendpage.pipe_to_send=
page
>      30.02            -0.5       29.55        perf-profile.calltrace.cycl=
es-pp.pipe_to_sendpage.__splice_from_pipe.splice_from_pipe.direct_splice_ac=
tor.splice_direct_to_actor
>      28.77            -0.4       28.34        perf-profile.calltrace.cycl=
es-pp.sock_sendpage.pipe_to_sendpage.__splice_from_pipe.splice_from_pipe.di=
rect_splice_actor
>      27.68            -0.4       27.27        perf-profile.calltrace.cycl=
es-pp.inet_sendpage.kernel_sendpage.sock_sendpage.pipe_to_sendpage.__splice=
_from_pipe
>      27.98            -0.4       27.58        perf-profile.calltrace.cycl=
es-pp.kernel_sendpage.sock_sendpage.pipe_to_sendpage.__splice_from_pipe.spl=
ice_from_pipe
>      20.30            -0.3       19.95        perf-profile.calltrace.cycl=
es-pp.tcp_sendpage_locked.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_s=
endpage
>      19.49            -0.3       19.16        perf-profile.calltrace.cycl=
es-pp.do_tcp_sendpages.tcp_sendpage_locked.tcp_sendpage.inet_sendpage.kerne=
l_sendpage
>       9.78            -0.2        9.53        perf-profile.calltrace.cycl=
es-pp.tcp_write_xmit.__tcp_push_pending_frames.do_tcp_sendpages.tcp_sendpag=
e_locked.tcp_sendpage
>       9.94            -0.2        9.70        perf-profile.calltrace.cycl=
es-pp.__tcp_push_pending_frames.do_tcp_sendpages.tcp_sendpage_locked.tcp_se=
ndpage.inet_sendpage
>       6.32            -0.2        6.09        perf-profile.calltrace.cycl=
es-pp.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_frames.do_tcp_se=
ndpages.tcp_sendpage_locked
>       5.59            -0.2        5.42        perf-profile.calltrace.cycl=
es-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_push_pending_=
frames.do_tcp_sendpages
>       5.19            -0.2        5.02        perf-profile.calltrace.cycl=
es-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_write_xmit.__tcp_pus=
h_pending_frames
>       4.79            -0.2        4.62        perf-profile.calltrace.cycl=
es-pp.ip_rcv.__netif_receive_skb_one_core.process_backlog.net_rx_action.__s=
oftirqentry_text_start
>       5.51            -0.2        5.35        perf-profile.calltrace.cycl=
es-pp.__softirqentry_text_start.do_softirq_own_stack.do_softirq.__local_bh_=
enable_ip.ip_finish_output2
>       5.00            -0.2        4.84        perf-profile.calltrace.cycl=
es-pp.__netif_receive_skb_one_core.process_backlog.net_rx_action.__softirqe=
ntry_text_start.do_softirq_own_stack
>       5.52            -0.2        5.36        perf-profile.calltrace.cycl=
es-pp.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.ip_finish_output=
2.ip_output
>       5.37            -0.2        5.21        perf-profile.calltrace.cycl=
es-pp.net_rx_action.__softirqentry_text_start.do_softirq_own_stack.do_softi=
rq.__local_bh_enable_ip
>       4.68            -0.2        4.53        perf-profile.calltrace.cycl=
es-pp.security_file_permission.do_sendfile.__x64_sys_sendfile64.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
>       5.61            -0.2        5.46        perf-profile.calltrace.cycl=
es-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_output.__ip_queu=
e_xmit
>       5.21            -0.2        5.06        perf-profile.calltrace.cycl=
es-pp.process_backlog.net_rx_action.__softirqentry_text_start.do_softirq_ow=
n_stack.do_softirq
>       4.58            -0.2        4.42        perf-profile.calltrace.cycl=
es-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_wr=
ite_xmit
>       5.66            -0.2        5.50        perf-profile.calltrace.cycl=
es-pp.__local_bh_enable_ip.ip_finish_output2.ip_output.__ip_queue_xmit.__tc=
p_transmit_skb
>       4.39            -0.2        4.24        perf-profile.calltrace.cycl=
es-pp.__entry_SYSCALL_64_trampoline
>       2.87 =C2=B1  2%      -0.1        2.76        perf-profile.calltrace=
.cycles-pp.selinux_file_permission.security_file_permission.do_sendfile.__x=
64_sys_sendfile64.do_syscall_64
>       1.25 =C2=B1  3%      -0.1        1.15        perf-profile.calltrace=
.cycles-pp.__inode_security_revalidate.selinux_file_permission.security_fil=
e_permission.do_sendfile.__x64_sys_sendfile64
>       4.30            -0.1        4.20        perf-profile.calltrace.cycl=
es-pp.ip_local_deliver_finish.ip_local_deliver.ip_rcv.__netif_receive_skb_o=
ne_core.process_backlog
>       1.86            -0.1        1.77 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.release_sock.tcp_sendpage.inet_sendpage.kernel_sendpage.sock_sen=
dpage
>       1.14            -0.1        1.08 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.file_has_perm.security_file_permission.do_splice_direct.do_sendf=
ile.__x64_sys_sendfile64
>       0.69            -0.1        0.63        perf-profile.calltrace.cycl=
es-pp.tcp_release_cb.release_sock.tcp_sendpage.inet_sendpage.kernel_sendpage
>       0.61 =C2=B1  2%      -0.1        0.56 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__might_fault.__x64_sys_sendfile64.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>       0.61 =C2=B1  2%      -0.0        0.57 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.avc_has_perm.file_has_perm.security_file_permission.do_spli=
ce_direct.do_sendfile
>       0.57 =C2=B1  2%      +0.0        0.61 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.___might_sleep.__might_fault.copy_page_to_iter.skb_copy_dat=
agram_iter.tcp_recvmsg
>      90.63            +0.2       90.83        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      91.39            +0.2       91.62        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>      20.12            +1.3       21.46        perf-profile.calltrace.cycl=
es-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      20.10            +1.3       21.44        perf-profile.calltrace.cycl=
es-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
>      19.84            +1.4       21.24        perf-profile.calltrace.cycl=
es-pp.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall=
_64
>      19.89            +1.4       21.30        perf-profile.calltrace.cycl=
es-pp.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>      15.07            +1.6       16.65        perf-profile.calltrace.cycl=
es-pp.skb_copy_datagram_iter.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_=
sys_recvfrom
>      14.25            +1.6       15.82        perf-profile.calltrace.cycl=
es-pp.copy_page_to_iter.skb_copy_datagram_iter.tcp_recvmsg.inet_recvmsg.__s=
ys_recvfrom
>      11.15            +1.6       12.74        perf-profile.calltrace.cycl=
es-pp.copyout.copy_page_to_iter.skb_copy_datagram_iter.tcp_recvmsg.inet_rec=
vmsg
>      10.84            +1.6       12.45        perf-profile.calltrace.cycl=
es-pp.copy_user_enhanced_fast_string.copyout.copy_page_to_iter.skb_copy_dat=
agram_iter.tcp_recvmsg
>      69.33            -1.1       68.23        perf-profile.children.cycle=
s-pp.__x64_sys_sendfile64
>      65.94            -1.0       64.92        perf-profile.children.cycle=
s-pp.do_sendfile
>      55.98            -0.8       55.14        perf-profile.children.cycle=
s-pp.do_splice_direct
>      52.38            -0.8       51.60        perf-profile.children.cycle=
s-pp.splice_direct_to_actor
>      35.77            -0.6       35.16        perf-profile.children.cycle=
s-pp.direct_splice_actor
>      34.91            -0.6       34.33        perf-profile.children.cycle=
s-pp.splice_from_pipe
>      34.07            -0.5       33.53        perf-profile.children.cycle=
s-pp.__splice_from_pipe
>      30.09            -0.5       29.62        perf-profile.children.cycle=
s-pp.pipe_to_sendpage
>      26.31            -0.5       25.86        perf-profile.children.cycle=
s-pp.tcp_sendpage
>      28.85            -0.4       28.42        perf-profile.children.cycle=
s-pp.sock_sendpage
>      27.75            -0.4       27.33        perf-profile.children.cycle=
s-pp.inet_sendpage
>      28.05            -0.4       27.65        perf-profile.children.cycle=
s-pp.kernel_sendpage
>      20.38            -0.3       20.03        perf-profile.children.cycle=
s-pp.tcp_sendpage_locked
>      19.62            -0.3       19.29        perf-profile.children.cycle=
s-pp.do_tcp_sendpages
>       9.69            -0.3        9.42        perf-profile.children.cycle=
s-pp.security_file_permission
>       8.60            -0.2        8.38        perf-profile.children.cycle=
s-pp.__tcp_transmit_skb
>      10.66            -0.2       10.43        perf-profile.children.cycle=
s-pp.tcp_write_xmit
>      10.79            -0.2       10.56        perf-profile.children.cycle=
s-pp.__tcp_push_pending_frames
>       7.82            -0.2        7.64        perf-profile.children.cycle=
s-pp.__ip_queue_xmit
>       7.38            -0.2        7.20        perf-profile.children.cycle=
s-pp.ip_output
>       6.36            -0.2        6.19        perf-profile.children.cycle=
s-pp.__local_bh_enable_ip
>       5.95            -0.2        5.78        perf-profile.children.cycle=
s-pp.__entry_SYSCALL_64_trampoline
>       4.86            -0.2        4.69        perf-profile.children.cycle=
s-pp.ip_rcv
>       5.07            -0.2        4.91        perf-profile.children.cycle=
s-pp.__netif_receive_skb_one_core
>       5.44            -0.2        5.29        perf-profile.children.cycle=
s-pp.net_rx_action
>       5.58            -0.2        5.42        perf-profile.children.cycle=
s-pp.do_softirq_own_stack
>       5.28            -0.2        5.13        perf-profile.children.cycle=
s-pp.process_backlog
>       6.70            -0.2        6.55        perf-profile.children.cycle=
s-pp.ip_finish_output2
>       5.67            -0.1        5.52        perf-profile.children.cycle=
s-pp.do_softirq
>       2.76 =C2=B1  3%      -0.1        2.62        perf-profile.children.=
cycles-pp.__inode_security_revalidate
>       1.39 =C2=B1  4%      -0.1        1.27 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp._cond_resched
>       4.45            -0.1        4.34        perf-profile.children.cycle=
s-pp.ip_local_deliver
>       0.73 =C2=B1  5%      -0.1        0.64 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.rcu_all_qs
>       0.72            -0.1        0.65        perf-profile.children.cycle=
s-pp.tcp_release_cb
>       0.30 =C2=B1  5%      -0.1        0.24 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.tcp_rcv_space_adjust
>       0.43 =C2=B1  4%      -0.0        0.39 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.copy_user_generic_unrolled
>       0.17 =C2=B1  7%      -0.0        0.12 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ip_rcv_finish_core
>       0.19 =C2=B1  7%      -0.0        0.15 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ip_rcv_finish
>       0.14 =C2=B1  5%      -0.0        0.11 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.tcp_rearm_rto
>       0.10 =C2=B1 11%      -0.0        0.06 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.sockfd_lookup_light
>       0.07 =C2=B1  5%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.skb_entail
>       0.11 =C2=B1  3%      +0.0        0.13 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.51 =C2=B1  3%      +0.0        0.55 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.tcp_established_options
>      90.70            +0.2       90.90        perf-profile.children.cycle=
s-pp.do_syscall_64
>      91.47            +0.2       91.70        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      20.13            +1.3       21.47        perf-profile.children.cycle=
s-pp.__x64_sys_recvfrom
>      20.10            +1.3       21.44        perf-profile.children.cycle=
s-pp.__sys_recvfrom
>      19.89            +1.4       21.30        perf-profile.children.cycle=
s-pp.inet_recvmsg
>      19.84            +1.4       21.26        perf-profile.children.cycle=
s-pp.tcp_recvmsg
>      16.63            +1.6       18.19        perf-profile.children.cycle=
s-pp.copy_page_to_iter
>      15.08            +1.6       16.66        perf-profile.children.cycle=
s-pp.skb_copy_datagram_iter
>      11.24            +1.6       12.82        perf-profile.children.cycle=
s-pp.copyout
>      11.24            +1.6       12.82        perf-profile.children.cycle=
s-pp.copy_user_enhanced_fast_string
>       5.68            -0.2        5.51        perf-profile.self.cycles-pp=
.__entry_SYSCALL_64_trampoline
>       0.67            -0.1        0.60 =C2=B1  2%  perf-profile.self.cycl=
es-pp.tcp_release_cb
>       0.93 =C2=B1  2%      -0.1        0.86 =C2=B1  2%  perf-profile.self=
.cycles-pp.__inode_security_revalidate
>       1.09 =C2=B1  2%      -0.0        1.05 =C2=B1  2%  perf-profile.self=
.cycles-pp.do_syscall_64
>       0.16 =C2=B1  9%      -0.0        0.12 =C2=B1  7%  perf-profile.self=
.cycles-pp.ip_rcv_finish_core
>       0.09 =C2=B1 11%      -0.0        0.05 =C2=B1 62%  perf-profile.self=
.cycles-pp.__tcp_ack_snd_check
>       0.40 =C2=B1  3%      -0.0        0.36 =C2=B1  7%  perf-profile.self=
.cycles-pp.copy_user_generic_unrolled
>       0.80            -0.0        0.77 =C2=B1  2%  perf-profile.self.cycl=
es-pp.current_time
>       0.28 =C2=B1  2%      -0.0        0.25 =C2=B1  3%  perf-profile.self=
.cycles-pp.tcp_recvmsg
>       0.27 =C2=B1  6%      -0.0        0.24 =C2=B1  5%  perf-profile.self=
.cycles-pp.__alloc_skb
>       0.18 =C2=B1  6%      -0.0        0.15 =C2=B1  7%  perf-profile.self=
.cycles-pp.tcp_mstamp_refresh
>       0.10 =C2=B1  5%      -0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.__tcp_select_window
>       0.22 =C2=B1  3%      +0.0        0.24 =C2=B1  2%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.46 =C2=B1  5%      +0.0        0.51 =C2=B1  4%  perf-profile.self=
.cycles-pp.tcp_established_options
>      11.14            +1.5       12.68        perf-profile.self.cycles-pp=
.copy_user_enhanced_fast_string
> =

> =

> =

> *************************************************************************=
**************************
> lkp-bdw-de1: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 8G mem=
ory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-7/performance/ipv4/x86_64-rhel-7.2/200%/debian-x86_64-=
2018-04-03.cgz/900s/lkp-bdw-de1/TCP_MAERTS/netperf/0x7000013
> =

> commit: =

>   3ff6cde846 ("hns3: Another build fix.")
>   a337531b94 ("tcp: up initial rmem to 128KB and SYN rwin to around 64KB")
> =

> 3ff6cde846857d45 a337531b942bd8a03e7052444d =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           1:4            2%           1:4     perf-profile.children.cycle=
s-pp.schedule_timeout
>          %stddev     %change         %stddev
>              \          |                \  =

>       2497            -5.9%       2349        netperf.Throughput_Mbps
>      79914            -5.9%      75172        netperf.Throughput_total_Mb=
ps
>       2472            +4.7%       2588        netperf.time.maximum_reside=
nt_set_size
>       8998            +8.0%       9715        netperf.time.minor_page_fau=
lts
>      88.91           -13.7%      76.77        netperf.time.user_time
>  5.487e+08            -5.9%  5.162e+08        netperf.workload
>   50507215 =C2=B1 49%     -63.0%   18671277 =C2=B1 27%  cpuidle.C3.time
>     111760 =C2=B1  6%     +12.4%     125584 =C2=B1  3%  meminfo.DirectMap=
4k
>       0.35 =C2=B1 49%      -0.2        0.13 =C2=B1 29%  turbostat.C3%
>      42.19            -1.2%      41.70        turbostat.PkgWatt
>       1988            +9.6%       2180 =C2=B1  2%  sched_debug.cfs_rq:/.u=
til_est_enqueued.max
>     401.62 =C2=B1  3%     +11.2%     446.64 =C2=B1  4%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>       3.91 =C2=B1 12%     -18.4%       3.19 =C2=B1 14%  sched_debug.cpu.n=
r_uninterruptible.stddev
>     697.25 =C2=B1  4%     +48.3%       1034 =C2=B1 19%  slabinfo.dmaengin=
e-unmap-16.active_objs
>     697.25 =C2=B1  4%     +48.3%       1034 =C2=B1 19%  slabinfo.dmaengin=
e-unmap-16.num_objs
>       1464 =C2=B1 11%     -20.9%       1157 =C2=B1  9%  slabinfo.skbuff_h=
ead_cache.active_objs
>       1464 =C2=B1 11%     -20.9%       1157 =C2=B1  9%  slabinfo.skbuff_h=
ead_cache.num_objs
>      70462            +1.3%      71390        proc-vmstat.nr_active_anon
>      66190            +1.5%      67154        proc-vmstat.nr_anon_pages
>      70462            +1.3%      71390        proc-vmstat.nr_zone_active_=
anon
>  2.756e+08            -6.0%  2.592e+08        proc-vmstat.numa_hit
>  2.756e+08            -6.0%  2.592e+08        proc-vmstat.numa_local
>  2.197e+09            -6.0%  2.067e+09        proc-vmstat.pgalloc_normal
>  2.197e+09            -6.0%  2.066e+09        proc-vmstat.pgfree
>  5.831e+11            -7.8%  5.377e+11        perf-stat.branch-instructio=
ns
>  1.567e+10            -8.9%  1.428e+10        perf-stat.branch-misses
>  6.246e+11            -4.4%  5.974e+11        perf-stat.cache-misses
>  6.246e+11            -4.4%  5.974e+11        perf-stat.cache-references
>      11.79            +8.4%      12.78        perf-stat.cpi
>     122574            +2.4%     125502        perf-stat.cpu-migrations
>  1.473e+12            -7.0%  1.369e+12        perf-stat.dTLB-loads
>       0.07 =C2=B1 13%      +0.0        0.09 =C2=B1  6%  perf-stat.dTLB-st=
ore-miss-rate%
>   7.83e+08 =C2=B1 13%     +15.6%  9.049e+08 =C2=B1  6%  perf-stat.dTLB-st=
ore-misses
>  1.092e+12            -6.8%  1.017e+12        perf-stat.dTLB-stores
>  1.153e+09           -10.1%  1.037e+09        perf-stat.iTLB-load-misses
>   2.66e+08 =C2=B1  4%      -7.0%  2.474e+08        perf-stat.iTLB-loads
>  2.994e+12            -7.8%  2.761e+12        perf-stat.instructions
>       0.08            -7.8%       0.08        perf-stat.ipc
>       5456            -2.0%       5348        perf-stat.path-length
>       2.62            -0.1        2.49        perf-profile.calltrace.cycl=
es-pp.tcp_write_xmit.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_d=
o_rcv.tcp_v4_rcv
>       2.64            -0.1        2.51        perf-profile.calltrace.cycl=
es-pp.__tcp_push_pending_frames.tcp_rcv_established.tcp_v4_do_rcv.tcp_v4_rc=
v.ip_local_deliver_finish
>       2.83            -0.1        2.73        perf-profile.calltrace.cycl=
es-pp.__free_pages_ok.skb_release_data.__kfree_skb.tcp_recvmsg.inet_recvmsg
>       3.64            -0.1        3.54        perf-profile.calltrace.cycl=
es-pp.__kfree_skb.tcp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom
>       3.27            -0.1        3.18        perf-profile.calltrace.cycl=
es-pp.skb_release_data.__kfree_skb.tcp_recvmsg.inet_recvmsg.__sys_recvfrom
>      98.03            +0.1       98.11        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>      97.89            +0.1       97.96        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.44 =C2=B1 58%      +0.3        0.71 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.copy_user_enh=
anced_fast_string.copyout.copy_page_to_iter
>       2.92 =C2=B1  6%      +0.4        3.29 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.apic_timer_interrupt.copy_user_enhanced_fast_string.copyout=
.copy_page_to_iter.skb_copy_datagram_iter
>       0.00            +0.5        0.55 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.=
copy_user_enhanced_fast_string.copyout
>       3.64            -0.1        3.52        perf-profile.children.cycle=
s-pp.tcp_write_xmit
>       3.60            -0.1        3.48        perf-profile.children.cycle=
s-pp.__tcp_push_pending_frames
>       2.84            -0.1        2.74        perf-profile.children.cycle=
s-pp.__free_pages_ok
>       4.08            -0.1        4.00        perf-profile.children.cycle=
s-pp.__kfree_skb
>       0.80 =C2=B1  2%      -0.1        0.74 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__entry_SYSCALL_64_trampoline
>       0.23 =C2=B1  4%      -0.0        0.20 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__sk_mem_schedule
>       0.22 =C2=B1  4%      -0.0        0.19 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__sk_mem_raise_allocated
>       0.06            -0.0        0.04 =C2=B1 57%  perf-profile.children.=
cycles-pp.tcp_release_cb
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.__tcp_select_window
>       0.23            +0.0        0.24 =C2=B1  2%  perf-profile.children.=
cycles-pp.__tcp_send_ack
>       0.06 =C2=B1 11%      +0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.___perf_sw_event
>       0.06 =C2=B1 14%      +0.0        0.09 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.tcp_write_timer_handler
>       0.12 =C2=B1  7%      +0.0        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.06 =C2=B1 11%      +0.0        0.09 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.call_timer_fn
>       0.17 =C2=B1  4%      +0.0        0.20 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.___slab_alloc
>       0.18 =C2=B1  4%      +0.0        0.21 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__slab_alloc
>       0.05 =C2=B1 58%      +0.0        0.08 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.tcp_write_timer
>       0.04 =C2=B1 58%      +0.0        0.08 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.tcp_send_loss_probe
>       0.32 =C2=B1  3%      +0.0        0.35        perf-profile.children.=
cycles-pp.kmem_cache_alloc_node
>       0.14 =C2=B1  7%      +0.0        0.19 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.preempt_schedule_common
>       0.21 =C2=B1 12%      +0.1        0.27 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.task_tick_fair
>       0.00            +0.1        0.06 =C2=B1 11%  perf-profile.children.=
cycles-pp.__tcp_retransmit_skb
>       0.51 =C2=B1  3%      +0.1        0.57 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__sched_text_start
>       1.61            +0.1        1.68 =C2=B1  2%  perf-profile.children.=
cycles-pp.__release_sock
>       1.06 =C2=B1  3%      +0.1        1.14 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tcp_ack
>       0.28 =C2=B1  9%      +0.1        0.36 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>      98.09            +0.1       98.18        perf-profile.children.cycle=
s-pp.do_syscall_64
>      98.23            +0.1       98.32        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>       0.49 =C2=B1  8%      +0.1        0.58 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.50 =C2=B1  8%      +0.1        0.61 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.54 =C2=B1  9%      +0.1        0.67 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       0.79 =C2=B1  8%      +0.1        0.93 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.93 =C2=B1  9%      +0.2        1.09 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       1.13 =C2=B1 10%      +0.2        1.37 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.smp_apic_timer_interrupt
>       2.51 =C2=B1  6%      +0.4        2.87 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.apic_timer_interrupt
>      70.21            +0.4       70.63        perf-profile.children.cycle=
s-pp.copy_user_enhanced_fast_string
>       1.61            -0.1        1.49 =C2=B1  2%  perf-profile.self.cycl=
es-pp.copy_page_to_iter
>       0.78 =C2=B1  2%      -0.1        0.72 =C2=B1  3%  perf-profile.self=
.cycles-pp.__entry_SYSCALL_64_trampoline
>       1.37            -0.1        1.32        perf-profile.self.cycles-pp=
.__free_pages_ok
>       0.21 =C2=B1  5%      -0.0        0.18 =C2=B1  4%  perf-profile.self=
.cycles-pp.__sk_mem_raise_allocated
>       0.65 =C2=B1  2%      -0.0        0.62        perf-profile.self.cycl=
es-pp.free_one_page
>       0.41 =C2=B1  2%      -0.0        0.39 =C2=B1  4%  perf-profile.self=
.cycles-pp.skb_copy_datagram_iter
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1 15%  perf-profile.self=
.cycles-pp.__tcp_select_window
>       0.10 =C2=B1  5%      -0.0        0.08 =C2=B1  8%  perf-profile.self=
.cycles-pp.import_single_range
>       0.14 =C2=B1  5%      +0.0        0.16 =C2=B1  5%  perf-profile.self=
.cycles-pp.___slab_alloc
>       0.19 =C2=B1  3%      +0.0        0.21 =C2=B1  3%  perf-profile.self=
.cycles-pp.kmem_cache_alloc_node
>       0.15 =C2=B1  4%      +0.0        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.__might_sleep
>       0.03 =C2=B1100%      +0.0        0.07 =C2=B1 13%  perf-profile.self=
.cycles-pp.___perf_sw_event
> =

> =

> =

> *************************************************************************=
**************************
> lkp-u410: 4 threads Intel(R) Core(TM) i5-3317U CPU @ 1.70GHz with 4G memo=
ry
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-7/performance/ipv4/x86_64-rhel-7.2/200%/debian-x86_64-=
2018-04-03.cgz/900s/lkp-u410/TCP_MAERTS/netperf/0x20
> =

> commit: =

>   3ff6cde846 ("hns3: Another build fix.")
>   a337531b94 ("tcp: up initial rmem to 128KB and SYN rwin to around 64KB")
> =

> 3ff6cde846857d45 a337531b942bd8a03e7052444d =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           4:4         -100%            :4     dmesg.RIP:intel_modeset_ini=
t[i915]
>           4:4         -100%            :4     dmesg.WARNING:at_drivers/gp=
u/drm/i915/intel_display.c:#intel_modeset_init[i915]
>           2:4           -3%           2:4     perf-profile.children.cycle=
s-pp.schedule_timeout
>          %stddev     %change         %stddev
>              \          |                \  =

>       3879            -3.2%       3753        netperf.Throughput_Mbps
>      31036            -3.2%      30030        netperf.Throughput_total_Mb=
ps
>       2463            +3.6%       2552        netperf.time.maximum_reside=
nt_set_size
>       2499            +7.5%       2685        netperf.time.minor_page_fau=
lts
>      24.96           -14.8%      21.28 =C2=B1  8%  netperf.time.user_time
>     543040 =C2=B1 13%     -15.9%     456816 =C2=B1  2%  netperf.time.volu=
ntary_context_switches
>  2.131e+08            -3.2%  2.062e+08        netperf.workload
>      21274            +3.3%      21986        interrupts.CAL:Function_cal=
l_interrupts
>     826.00 =C2=B1  6%     -27.1%     602.00 =C2=B1 23%  slabinfo.skbuff_h=
ead_cache.active_objs
>       3904 =C2=B1  2%      -4.5%       3728        vmstat.system.cs
>      56.50 =C2=B1  2%      +8.8%      61.50 =C2=B1  5%  turbostat.CoreTmp
>      56.75 =C2=B1  2%      +8.4%      61.50 =C2=B1  5%  turbostat.PkgTmp
>       4224 =C2=B1173%    +294.2%      16653 =C2=B1 52%  sched_debug.cfs_r=
q:/.spread0.avg
>     110.92 =C2=B1  8%     -22.2%      86.34 =C2=B1 10%  sched_debug.cfs_r=
q:/.util_avg.stddev
>     896147 =C2=B1  3%     -11.3%     795033 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.max
>     162406 =C2=B1  9%     -26.1%     119960 =C2=B1 21%  sched_debug.cpu.a=
vg_idle.stddev
>      59886 =C2=B1  3%      -3.8%      57590        proc-vmstat.nr_dirty_b=
ackground_threshold
>     119920 =C2=B1  3%      -3.8%     115322        proc-vmstat.nr_dirty_t=
hreshold
>     628429 =C2=B1  3%      -3.7%     605425        proc-vmstat.nr_free_pa=
ges
>  1.071e+08            -3.2%  1.036e+08        proc-vmstat.numa_hit
>  1.071e+08            -3.2%  1.036e+08        proc-vmstat.numa_local
>  8.503e+08            -3.2%  8.229e+08        proc-vmstat.pgfree
>  2.265e+11            -5.7%  2.135e+11        perf-stat.branch-instructio=
ns
>       3.01            -0.1        2.94        perf-stat.branch-miss-rate%
>  6.809e+09            -7.8%  6.279e+09 =C2=B1  3%  perf-stat.branch-misses
>      30.13            +2.0       32.13        perf-stat.cache-miss-rate%
>  5.149e+10            +3.2%  5.314e+10        perf-stat.cache-misses
>  1.709e+11            -3.2%  1.654e+11        perf-stat.cache-references
>    3532029 =C2=B1  2%      -4.5%    3373137        perf-stat.context-swit=
ches
>       7.31            +6.2%       7.76        perf-stat.cpi
>  5.633e+09 =C2=B1  2%      -5.8%  5.308e+09        perf-stat.dTLB-load-mi=
sses
>  7.264e+11            -4.1%  6.964e+11        perf-stat.dTLB-loads
>   6.35e+11            -4.0%  6.097e+11        perf-stat.dTLB-stores
>  4.029e+08            -7.1%  3.743e+08 =C2=B1  2%  perf-stat.iTLB-load-mi=
sses
>  1.157e+12            -5.7%  1.091e+12        perf-stat.instructions
>       0.14            -5.8%       0.13        perf-stat.ipc
>       5426            -2.5%       5289        perf-stat.path-length
>       1.16 =C2=B1  6%      -0.2        0.99 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__entry_SYSCALL_64_trampoline
>       0.99 =C2=B1  6%      -0.1        0.88 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.tcp_v4_do_rcv.__release_sock.release_sock.tcp_recvmsg.inet_=
recvmsg
>      96.58            +0.3       96.87        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>      26.12 =C2=B1  2%      +1.3       27.40        perf-profile.calltrace=
.cycles-pp.copy_user_enhanced_fast_string.copyin._copy_from_iter_full.tcp_s=
endmsg_locked.tcp_sendmsg
>      26.39 =C2=B1  2%      +1.3       27.69        perf-profile.calltrace=
.cycles-pp.copyin._copy_from_iter_full.tcp_sendmsg_locked.tcp_sendmsg.sock_=
sendmsg
>      27.12 =C2=B1  3%      +1.4       28.48        perf-profile.calltrace=
.cycles-pp._copy_from_iter_full.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg=
.__sys_sendto
>      41.73 =C2=B1  2%      +1.7       43.40 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.__sys_sendto.__=
x64_sys_sendto
>      43.17 =C2=B1  2%      +1.7       44.87 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_s=
yscall_64
>      43.75 =C2=B1  2%      +1.8       45.51        perf-profile.calltrace=
.cycles-pp.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
>      44.88 =C2=B1  2%      +1.8       46.63        perf-profile.calltrace=
.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      44.73 =C2=B1  2%      +1.8       46.53        perf-profile.calltrace=
.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
>       1.38 =C2=B1  6%      -0.2        1.20 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__entry_SYSCALL_64_trampoline
>       0.42 =C2=B1  9%      -0.1        0.31 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.tcp_queue_rcv
>       0.79 =C2=B1  6%      -0.1        0.68 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ktime_get_with_offset
>       0.32 =C2=B1 12%      -0.1        0.21 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.35 =C2=B1 12%      -0.1        0.26 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.tcp_try_coalesce
>       0.29 =C2=B1 10%      -0.1        0.20 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.skb_try_coalesce
>       0.88 =C2=B1  2%      -0.1        0.79 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.tcp_mstamp_refresh
>       0.32 =C2=B1  9%      -0.1        0.26 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.ip_local_out
>       0.41 =C2=B1  3%      +0.0        0.45 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.selinux_ip_postroute
>       0.03 =C2=B1102%      +0.1        0.09 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.lock_timer_base
>       0.00            +0.1        0.08 =C2=B1 29%  perf-profile.children.=
cycles-pp.raw_local_deliver
>       0.57 =C2=B1  4%      +0.1        0.66 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tcp_event_new_data_sent
>       0.20 =C2=B1 28%      +0.1        0.29 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp._cond_resched
>      64.27            +0.5       64.78        perf-profile.children.cycle=
s-pp.copy_user_enhanced_fast_string
>      26.41 =C2=B1  2%      +1.3       27.70        perf-profile.children.=
cycles-pp.copyin
>      27.16 =C2=B1  3%      +1.3       28.50        perf-profile.children.=
cycles-pp._copy_from_iter_full
>      41.76 =C2=B1  2%      +1.7       43.44 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tcp_sendmsg_locked
>      43.19 =C2=B1  2%      +1.7       44.88 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tcp_sendmsg
>      44.88 =C2=B1  2%      +1.8       46.65        perf-profile.children.=
cycles-pp.__x64_sys_sendto
>      43.75 =C2=B1  2%      +1.8       45.51        perf-profile.children.=
cycles-pp.sock_sendmsg
>      44.74 =C2=B1  2%      +1.8       46.54        perf-profile.children.=
cycles-pp.__sys_sendto
>       1.21 =C2=B1  8%      -0.2        0.99 =C2=B1  5%  perf-profile.self=
.cycles-pp.copy_page_to_iter
>       1.32 =C2=B1  6%      -0.2        1.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.__entry_SYSCALL_64_trampoline
>       0.29 =C2=B1  9%      -0.1        0.20 =C2=B1 18%  perf-profile.self=
.cycles-pp.skb_try_coalesce
>       0.50 =C2=B1  9%      -0.1        0.42 =C2=B1 10%  perf-profile.self=
.cycles-pp.ktime_get_with_offset
>       0.19 =C2=B1 14%      -0.1        0.12 =C2=B1 10%  perf-profile.self=
.cycles-pp.__local_bh_enable_ip
>       0.08 =C2=B1 10%      -0.0        0.03 =C2=B1102%  perf-profile.self=
.cycles-pp.selinux_sock_rcv_skb_compat
>       0.13 =C2=B1  3%      -0.0        0.08 =C2=B1 57%  perf-profile.self=
.cycles-pp.__x64_sys_sendto
>       0.07 =C2=B1 12%      -0.0        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp._raw_spin_unlock_irqrestore
>       0.11 =C2=B1 11%      -0.0        0.08 =C2=B1 22%  perf-profile.self=
.cycles-pp.__sys_recvfrom
>       0.05 =C2=B1 61%      +0.0        0.09 =C2=B1 11%  perf-profile.self=
.cycles-pp.selinux_ip_postroute
>       0.09 =C2=B1 20%      +0.1        0.15 =C2=B1 31%  perf-profile.self=
.cycles-pp.rcu_all_qs
>       0.00            +0.1        0.07 =C2=B1 28%  perf-profile.self.cycl=
es-pp.raw_local_deliver
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

> Thanks,
> Rong Chen
> =

_______________________________________________
LKP mailing list
LKP(a)lists.01.org
https://lists.01.org/mailman/listinfo/lkp

--===============4061602740567518022==--

