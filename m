Content-Type: multipart/mixed; boundary="===============8420432539818982845=="
MIME-Version: 1.0
From: Steven Rostedt <rostedt@goodmis.org>
To: lkp@lists.01.org
Subject: Re: [function_graph] 8114865ff8: netperf.Throughput_tps -1.1% regression
Date: Tue, 11 Dec 2018 09:05:32 -0500
Message-ID: <20181211090532.56284ee4@gandalf.local.home>
In-Reply-To: <20181211091631.GQ23332@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8420432539818982845==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, 11 Dec 2018 17:16:31 +0800
kernel test robot <rong.a.chen@intel.com> wrote:

> Greeting,
> =

> FYI, we noticed a -1.1% regression of netperf.Throughput_tps due to commi=
t:
> =

> =

> commit: 8114865ff82e200b383e46821c25cb0625b842b5 ("function_graph: Create=
 function_graph_enter() to consolidate architecture code")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

This must be a false positive, as the commit in question simply adds a
function that nothing calls.

-- Steve

> =

> in testcase: netperf
> on test machine: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with 8=
G memory
> with following parameters:
> =

> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 200%
> 	cluster: cs-localhost
> 	test: TCP_CRR
> 	ucode: 0x25
> 	cpufreq_governor: performance
> =

> test-description: Netperf is a benchmark that can be use to measure vario=
us aspect of networking performance.
> test-url: http://www.netperf.org/netperf/
> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->  =

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
2018-04-03.cgz/300s/lkp-hsw-d01/TCP_CRR/netperf/0x25
> =

> commit: =

>   v4.20-rc3
>   8114865ff8 ("function_graph: Create function_graph_enter() to consolida=
te architecture code")
> =

>        v4.20-rc3 8114865ff82e200b383e46821c =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           2:5          -40%            :4     dmesg.WARNING:at#for_ip_swa=
pgs_restore_regs_and_return_to_usermode/0x
>           2:5          -40%            :4     dmesg.WARNING:stack_recursi=
on
>            :5           20%           1:4     kmsg.drm:drm_atomic_helper_=
wait_for_dependencies[drm_kms_helper]]*ERROR*[CONNECTOR:#:VGA-#]flip_done_t=
imed_out
>            :5           20%           1:4     kmsg.drm:drm_atomic_helper_=
wait_for_dependencies[drm_kms_helper]]*ERROR*[CRTC:#:pipe_A]flip_done_timed=
_out
>            :5           20%           1:4     kmsg.drm:drm_atomic_helper_=
wait_for_dependencies[drm_kms_helper]]*ERROR*[PLANE:#:primary_A]flip_done_t=
imed_out
>            :5           20%           1:4     kmsg.drm:drm_atomic_helper_=
wait_for_flip_done[drm_kms_helper]]*ERROR*[CRTC:#:pipe_A]flip_done_timed_out
>           1:5          -10%           1:4     perf-profile.calltrace.cycl=
es-pp.dequeue_entity.dequeue_task_fair.__sched_text_start.schedule.schedule=
_timeout
>          26:5          -93%          21:4     perf-profile.children.cycle=
s-pp.schedule_timeout
>           0:5           -1%           0:4     perf-profile.self.cycles-pp=
.schedule_timeout
>          %stddev     %change         %stddev
>              \          |                \  =

>     131277            -1.1%     129833        netperf.Throughput_total_tps
>       8204            -1.1%       8114        netperf.Throughput_tps
>     104.96            -1.6%     103.25        netperf.time.user_time
>   39321448            -1.1%   38880992        netperf.time.voluntary_cont=
ext_switches
>   39383220            -1.1%   38949992        netperf.workload
>     327.02          -100.0%       0.00        uptime.boot
>     179.66 =C2=B1  8%    -100.0%       0.00        uptime.idle
>       4174 =C2=B1 10%     +12.4%       4692 =C2=B1 12%  slabinfo.anon_vma=
.active_objs
>       4174 =C2=B1 10%     +12.4%       4692 =C2=B1 12%  slabinfo.anon_vma=
.num_objs
>      39.00          +229.5%     128.50 =C2=B1 27%  slabinfo.buffer_head.a=
ctive_objs
>      39.00          +229.5%     128.50 =C2=B1 27%  slabinfo.buffer_head.n=
um_objs
>       0.43 =C2=B1  9%     -19.6%       0.34 =C2=B1 13%  sched_debug.cfs_r=
q:/.nr_running.stddev
>      12140 =C2=B1114%    +330.4%      52248 =C2=B1 73%  sched_debug.cpu.a=
vg_idle.min
>       0.88 =C2=B1  8%     +24.1%       1.09 =C2=B1  4%  sched_debug.cpu.c=
lock.stddev
>       0.88 =C2=B1  8%     +24.1%       1.09 =C2=B1  4%  sched_debug.cpu.c=
lock_task.stddev
>     163.75 =C2=B1  2%      +6.7%     174.67 =C2=B1  4%  sched_debug.cpu.c=
pu_load[0].avg
>     238.17 =C2=B1  3%     +24.7%     296.96 =C2=B1 17%  sched_debug.cpu.c=
pu_load[0].max
>     215.03 =C2=B1  2%     +16.7%     251.04 =C2=B1  8%  sched_debug.cpu.c=
pu_load[1].max
>      20.65 =C2=B1 12%     +19.2%      24.61 =C2=B1  7%  sched_debug.cpu.c=
pu_load[2].stddev
>      62804            +2.0%      64053        proc-vmstat.nr_active_anon
>       1.00        +10950.0%     110.50 =C2=B1 73%  proc-vmstat.nr_active_=
file
>      61258            +2.0%      62489        proc-vmstat.nr_anon_pages
>      23.00          +303.3%      92.75 =C2=B1 38%  proc-vmstat.nr_inactiv=
e_file
>       3854            +8.2%       4170        proc-vmstat.nr_kernel_stack
>       9474            +2.0%       9666        proc-vmstat.nr_slab_reclaim=
able
>       8753            +2.7%       8988        proc-vmstat.nr_slab_unrecla=
imable
>      62807            +2.0%      64055        proc-vmstat.nr_zone_active_=
anon
>       1.00        +10950.0%     110.50 =C2=B1 73%  proc-vmstat.nr_zone_ac=
tive_file
>      23.00          +303.3%      92.75 =C2=B1 38%  proc-vmstat.nr_zone_in=
active_file
>     461366            +4.9%     483771 =C2=B1  2%  proc-vmstat.numa_hit
>     461366            +4.9%     483771 =C2=B1  2%  proc-vmstat.numa_local
>  8.459e+11            -1.3%  8.347e+11        perf-stat.branch-instructio=
ns
>   81655384            -1.1%   80758043        perf-stat.context-switches
>       2.04            +1.3%       2.07        perf-stat.cpi
>      56426 =C2=B1  3%      -8.7%      51533 =C2=B1  5%  perf-stat.cpu-mig=
rations
>       0.10 =C2=B1  2%      +0.0        0.10 =C2=B1  3%  perf-stat.dTLB-st=
ore-miss-rate%
>  8.433e+11            -1.1%  8.337e+11        perf-stat.dTLB-stores
>      75.15            +1.9       77.05        perf-stat.iTLB-load-miss-ra=
te%
>  8.967e+08           -10.2%  8.056e+08        perf-stat.iTLB-loads
>  4.324e+12            -1.3%  4.267e+12        perf-stat.instructions
>       0.49            -1.2%       0.48        perf-stat.ipc
>     390422            +0.8%     393664        perf-stat.minor-faults
>   17227761 =C2=B1  3%     +15.0%   19812916 =C2=B1  2%  perf-stat.node-st=
ores
>     390422            +0.8%     393654        perf-stat.page-faults
>       1.74 =C2=B1 15%      -0.3        1.43 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.security_sock_rcv_skb.sk_filter_trim_cap.tcp_filter.tcp_v4_=
rcv.ip_local_deliver_finish
>       1.53 =C2=B1  6%      -0.2        1.35 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.selinux_socket_sock_rcv_skb.security_sock_rcv_skb.sk_filter=
_trim_cap.tcp_filter.tcp_v4_rcv
>       1.06 =C2=B1  3%      -0.1        0.99 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.tcp_send_fin.tcp_close.inet_release.__sock_release.sock_clo=
se
>       2.24            +0.1        2.30        perf-profile.calltrace.cycl=
es-pp.tcp_rcv_established.tcp_v4_do_rcv.__release_sock.release_sock.tcp_sen=
dmsg
>       0.88 =C2=B1  2%      +0.1        0.95 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_fin.tcp_data_queue.t=
cp_rcv_state_process
>       1.08 =C2=B1  2%      +0.1        1.17 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__tcp_transmit_skb.tcp_fin.tcp_data_queue.tcp_rcv_state_pro=
cess.tcp_v4_do_rcv
>       2.54            +0.1        2.65        perf-profile.calltrace.cycl=
es-pp.__release_sock.release_sock.tcp_sendmsg.sock_sendmsg.__sys_sendto
>       2.68 =C2=B1  2%      +0.1        2.80        perf-profile.calltrace=
.cycles-pp.release_sock.tcp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sen=
dto
>       3.03 =C2=B1  2%      +0.1        3.16        perf-profile.calltrace=
.cycles-pp.tcp_fin.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v=
4_rcv
>       0.71 =C2=B1  7%      +0.1        0.84 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.ip_output.tcp_v4_send_synack.tcp_conn_request.tcp_rcv_state=
_process.tcp_v4_do_rcv
>       3.19 =C2=B1  2%      +0.2        3.36        perf-profile.calltrace=
.cycles-pp.tcp_data_queue.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv.ip=
_local_deliver_finish
>       0.33 =C2=B1 82%      +0.3        0.63 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       0.33 =C2=B1 82%      +0.3        0.63 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>      12.33            +0.4       12.77 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.tcp_v4_connect.__inet_stream_connect.inet_stream_connect.__sys_c=
onnect.__x64_sys_connect
>      30.28            +0.5       30.73        perf-profile.calltrace.cycl=
es-pp.ip_local_deliver.ip_rcv.__netif_receive_skb_one_core.process_backlog.=
net_rx_action
>       7.34 =C2=B1  2%      +0.5        7.79 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.ip_output.__ip_queue_xmit.__tcp_transmit_skb.tcp_connect.tc=
p_v4_connect
>      32.67            +0.5       33.13        perf-profile.calltrace.cycl=
es-pp.__netif_receive_skb_one_core.process_backlog.net_rx_action.__softirqe=
ntry_text_start.do_softirq_own_stack
>       7.21 =C2=B1  2%      +0.5        7.69 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.ip_finish_output2.ip_output.__ip_queue_xmit.__tcp_transmit_=
skb.tcp_connect
>       8.80 =C2=B1  2%      +0.5        9.28        perf-profile.calltrace=
.cycles-pp.tcp_rcv_state_process.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver_=
finish.ip_local_deliver
>      10.34            +0.5       10.88 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.tcp_connect.tcp_v4_connect.__inet_stream_connect.inet_stream_con=
nect.__sys_connect
>      34.75            +0.5       35.30        perf-profile.calltrace.cycl=
es-pp.__softirqentry_text_start.do_softirq_own_stack.do_softirq.__local_bh_=
enable_ip.ip_finish_output2
>      34.88            +0.6       35.43        perf-profile.calltrace.cycl=
es-pp.do_softirq_own_stack.do_softirq.__local_bh_enable_ip.ip_finish_output=
2.ip_output
>      16.15            +0.6       16.70 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.tcp_v4_do_rcv.tcp_v4_rcv.ip_local_deliver_finish.ip_local_delive=
r.ip_rcv
>       8.86 =C2=B1  2%      +0.6        9.44 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__tcp_transmit_skb.tcp_connect.tcp_v4_connect.__inet_stream=
_connect.inet_stream_connect
>      35.25            +0.6       35.84        perf-profile.calltrace.cycl=
es-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_output.__ip_queu=
e_xmit
>      34.18            +0.6       34.78        perf-profile.calltrace.cycl=
es-pp.net_rx_action.__softirqentry_text_start.do_softirq_own_stack.do_softi=
rq.__local_bh_enable_ip
>       8.31 =C2=B1  2%      +0.6        8.92 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__ip_queue_xmit.__tcp_transmit_skb.tcp_connect.tcp_v4_conne=
ct.__inet_stream_connect
>      35.35            +0.7       36.01        perf-profile.calltrace.cycl=
es-pp.__local_bh_enable_ip.ip_finish_output2.ip_output.__ip_queue_xmit.__tc=
p_transmit_skb
>       2.33 =C2=B1  5%      -0.2        2.10        perf-profile.children.=
cycles-pp.security_sock_rcv_skb
>       2.21 =C2=B1  5%      -0.2        1.99        perf-profile.children.=
cycles-pp.selinux_socket_sock_rcv_skb
>       2.51 =C2=B1  5%      -0.2        2.30        perf-profile.children.=
cycles-pp.sk_filter_trim_cap
>       1.59 =C2=B1  6%      -0.2        1.42        perf-profile.children.=
cycles-pp.selinux_sock_rcv_skb_compat
>       1.91 =C2=B1  6%      -0.2        1.75        perf-profile.children.=
cycles-pp._raw_spin_lock
>       1.49 =C2=B1  4%      -0.1        1.36 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__kfree_skb
>       0.61 =C2=B1  9%      -0.1        0.50 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.sock_def_wakeup
>       0.97 =C2=B1  3%      -0.1        0.88 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.avc_has_perm
>       0.56 =C2=B1  6%      -0.1        0.47 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__x64_sys_close
>       0.37 =C2=B1 10%      -0.1        0.29 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp._copy_from_iter_full
>       0.62 =C2=B1  3%      -0.1        0.54 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__fget_light
>       0.26 =C2=B1 13%      -0.1        0.19 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.security_file_alloc
>       0.42 =C2=B1  2%      -0.1        0.35 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.copy_user_generic_unrolled
>       0.23 =C2=B1 11%      -0.1        0.16 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.selinux_file_alloc_security
>       1.06 =C2=B1  3%      -0.1        1.00 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tcp_send_fin
>       0.11 =C2=B1 18%      -0.1        0.05 =C2=B1 58%  perf-profile.chil=
dren.cycles-pp.sel_netnode_find
>       0.13 =C2=B1 16%      -0.1        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.sel_netnode_sid
>       0.39 =C2=B1  6%      -0.1        0.34 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.skb_release_data
>       0.34 =C2=B1 10%      -0.1        0.29 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.filp_close
>       0.20 =C2=B1  5%      -0.0        0.15 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.tcp_update_skb_after_send
>       0.36 =C2=B1  7%      -0.0        0.32 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_se
>       0.12 =C2=B1 14%      -0.0        0.09 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.__tcp_ack_snd_check
>       0.15 =C2=B1 14%      -0.0        0.11 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.init_timer_key
>       0.15 =C2=B1  4%      -0.0        0.12 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.remove_wait_queue
>       0.08 =C2=B1 17%      -0.0        0.06        perf-profile.children.=
cycles-pp.ip_build_and_send_pkt
>       0.15 =C2=B1  6%      +0.0        0.17 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__usecs_to_jiffies
>       0.04 =C2=B1 51%      +0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.find_exception
>       0.09 =C2=B1 11%      +0.0        0.11 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.tcp_newly_delivered
>       0.09 =C2=B1 15%      +0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.xfrm_lookup_with_ifid
>       0.12 =C2=B1 15%      +0.0        0.15 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.get_nohz_timer_target
>       0.17 =C2=B1 11%      +0.0        0.20 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.tcp_md5_do_lookup
>       0.02 =C2=B1123%      +0.0        0.06 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.security_sk_classify_flow
>       0.08 =C2=B1 21%      +0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp._raw_spin_trylock
>       0.04 =C2=B1 83%      +0.0        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.activate_task
>       0.05 =C2=B1 54%      +0.0        0.09 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.tcp_urg
>       0.19 =C2=B1  8%      +0.0        0.23 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.tcp_rearm_rto
>       0.01 =C2=B1200%      +0.0        0.06 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.skb_free_head
>       0.10 =C2=B1  9%      +0.0        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.xfrm_lookup_route
>       0.39 =C2=B1  5%      +0.1        0.44 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.ip_rcv_core
>       0.14 =C2=B1 19%      +0.1        0.19 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.__inet_lookup_listener
>       0.01 =C2=B1200%      +0.1        0.06 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.blkcg_maybe_throttle_current
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.ip_mc_drop_socket
>       0.58 =C2=B1  4%      +0.1        0.64 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sk_prot_alloc
>       0.60 =C2=B1  4%      +0.1        0.66 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__might_sleep
>       0.15 =C2=B1 25%      +0.1        0.21 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.eth_type_trans
>       1.13 =C2=B1  2%      +0.1        1.21 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.inet_csk_destroy_sock
>       0.78 =C2=B1  2%      +0.1        0.87 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.tcp_mstamp_refresh
>       0.52 =C2=B1  8%      +0.1        0.63 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.52 =C2=B1  8%      +0.1        0.64 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.56 =C2=B1 11%      +0.1        0.68 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ip_finish_output
>       3.44            +0.1        3.57        perf-profile.children.cycle=
s-pp.tcp_fin
>       4.81            +0.1        4.95        perf-profile.children.cycle=
s-pp.tcp_data_queue
>      12.35            +0.4       12.78 =C2=B1  2%  perf-profile.children.=
cycles-pp.tcp_v4_connect
>      32.75            +0.5       33.20        perf-profile.children.cycle=
s-pp.__netif_receive_skb_one_core
>      10.35            +0.5       10.89 =C2=B1  3%  perf-profile.children.=
cycles-pp.tcp_connect
>      34.90            +0.6       35.45        perf-profile.children.cycle=
s-pp.do_softirq_own_stack
>      34.29            +0.6       34.86        perf-profile.children.cycle=
s-pp.net_rx_action
>      45.59            +0.6       46.19        perf-profile.children.cycle=
s-pp.__tcp_transmit_skb
>      35.37            +0.6       35.99        perf-profile.children.cycle=
s-pp.__softirqentry_text_start
>      42.97            +0.7       43.69        perf-profile.children.cycle=
s-pp.__ip_queue_xmit
>      35.89            +0.7       36.62        perf-profile.children.cycle=
s-pp.__local_bh_enable_ip
>      41.33            +0.8       42.10        perf-profile.children.cycle=
s-pp.ip_output
>      39.17            +0.8       39.94        perf-profile.children.cycle=
s-pp.ip_finish_output2
>       0.88 =C2=B1  4%      -0.1        0.74 =C2=B1  3%  perf-profile.self=
.cycles-pp.tcp_write_xmit
>       0.61 =C2=B1  2%      -0.1        0.54 =C2=B1  3%  perf-profile.self=
.cycles-pp.__fget_light
>       0.23 =C2=B1  5%      -0.1        0.15 =C2=B1 18%  perf-profile.self=
.cycles-pp.tcp_v4_connect
>       0.93 =C2=B1  3%      -0.1        0.86 =C2=B1  6%  perf-profile.self=
.cycles-pp.avc_has_perm
>       0.41 =C2=B1  2%      -0.1        0.34 =C2=B1 12%  perf-profile.self=
.cycles-pp.copy_user_generic_unrolled
>       0.11 =C2=B1 18%      -0.1        0.05 =C2=B1 58%  perf-profile.self=
.cycles-pp.sel_netnode_find
>       0.39 =C2=B1  8%      -0.1        0.32 =C2=B1  6%  perf-profile.self=
.cycles-pp.selinux_ip_postroute
>       0.11 =C2=B1 24%      -0.1        0.05 =C2=B1 58%  perf-profile.self=
.cycles-pp.security_d_instantiate
>       0.16 =C2=B1  7%      -0.1        0.11 =C2=B1 13%  perf-profile.self=
.cycles-pp.tcp_send_fin
>       0.35 =C2=B1  6%      -0.1        0.30 =C2=B1  6%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.10 =C2=B1 15%      -0.0        0.06 =C2=B1 58%  perf-profile.self=
.cycles-pp.__x64_sys_close
>       0.07 =C2=B1 16%      -0.0        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.inet_release
>       0.35 =C2=B1  7%      -0.0        0.31 =C2=B1  2%  perf-profile.self=
.cycles-pp.tcp_parse_options
>       0.09 =C2=B1 15%      -0.0        0.05 =C2=B1 58%  perf-profile.self=
.cycles-pp.__sys_socket
>       0.13 =C2=B1  8%      -0.0        0.10 =C2=B1 17%  perf-profile.self=
.cycles-pp.sk_stream_alloc_skb
>       0.12 =C2=B1 13%      -0.0        0.08 =C2=B1 19%  perf-profile.self=
.cycles-pp.__tcp_ack_snd_check
>       0.14 =C2=B1 12%      -0.0        0.10 =C2=B1 12%  perf-profile.self=
.cycles-pp.skb_release_all
>       0.16 =C2=B1 10%      -0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.__inet_bind
>       0.18 =C2=B1  8%      -0.0        0.15 =C2=B1  5%  perf-profile.self=
.cycles-pp.sk_clone_lock
>       0.16 =C2=B1  5%      -0.0        0.14 =C2=B1 11%  perf-profile.self=
.cycles-pp.__wake_up_common
>       0.09 =C2=B1  8%      +0.0        0.11 =C2=B1 11%  perf-profile.self=
.cycles-pp.ip_local_out
>       0.08 =C2=B1 12%      +0.0        0.11 =C2=B1  9%  perf-profile.self=
.cycles-pp.xfrm_lookup_with_ifid
>       0.11 =C2=B1  8%      +0.0        0.14 =C2=B1  8%  perf-profile.self=
.cycles-pp.__usecs_to_jiffies
>       0.16 =C2=B1 10%      +0.0        0.19 =C2=B1  4%  perf-profile.self=
.cycles-pp.tcp_rearm_rto
>       0.07 =C2=B1  6%      +0.0        0.11 =C2=B1 14%  perf-profile.self=
.cycles-pp.__dentry_kill
>       0.24 =C2=B1  7%      +0.0        0.28 =C2=B1  6%  perf-profile.self=
.cycles-pp.tcp_ack_update_rtt
>       0.08 =C2=B1 12%      +0.0        0.11 =C2=B1 15%  perf-profile.self=
.cycles-pp.tcp_newly_delivered
>       0.14 =C2=B1 16%      +0.0        0.17 =C2=B1 13%  perf-profile.self=
.cycles-pp.skb_push
>       0.06 =C2=B1 54%      +0.0        0.10 =C2=B1 11%  perf-profile.self=
.cycles-pp._raw_spin_unlock_bh
>       0.08 =C2=B1 11%      +0.0        0.12 =C2=B1 17%  perf-profile.self=
.cycles-pp.tcp_init_transfer
>       0.07 =C2=B1 23%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp._raw_spin_trylock
>       0.14 =C2=B1 13%      +0.0        0.18 =C2=B1  9%  perf-profile.self=
.cycles-pp.account_entity_dequeue
>       0.01 =C2=B1200%      +0.0        0.06 =C2=B1  9%  perf-profile.self=
.cycles-pp.skb_free_head
>       0.38 =C2=B1  5%      +0.1        0.43 =C2=B1  7%  perf-profile.self=
.cycles-pp.ip_rcv_core
>       0.06 =C2=B1 12%      +0.1        0.11 =C2=B1 25%  perf-profile.self=
.cycles-pp.tcp_filter
>       0.14 =C2=B1 19%      +0.1        0.19 =C2=B1 22%  perf-profile.self=
.cycles-pp.__inet_lookup_listener
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.ip_mc_drop_socket
>       0.10 =C2=B1 26%      +0.1        0.15 =C2=B1 11%  perf-profile.self=
.cycles-pp.tcp_make_synack
>       0.03 =C2=B1 82%      +0.1        0.09 =C2=B1 24%  perf-profile.self=
.cycles-pp.tcp_urg
>       0.51 =C2=B1  6%      +0.1        0.57 =C2=B1  3%  perf-profile.self=
.cycles-pp.__might_sleep
>       0.14 =C2=B1 28%      +0.1        0.21 =C2=B1 20%  perf-profile.self=
.cycles-pp.eth_type_trans
>       0.54 =C2=B1  5%      +0.1        0.61 =C2=B1  4%  perf-profile.self=
.cycles-pp.__kmalloc_node_track_caller
>       0.44 =C2=B1  5%      +0.1        0.51 =C2=B1  4%  perf-profile.self=
.cycles-pp.enqueue_to_backlog
>       0.45 =C2=B1 10%      +0.1        0.53        perf-profile.self.cycl=
es-pp.net_rx_action
>       0.28 =C2=B1  8%      +0.1        0.36 =C2=B1  6%  perf-profile.self=
.cycles-pp.ip_local_deliver_finish
>       0.70 =C2=B1  7%      +0.1        0.79 =C2=B1  6%  perf-profile.self=
.cycles-pp.__dev_queue_xmit
>       0.52 =C2=B1  4%      +0.1        0.64 =C2=B1  9%  perf-profile.self=
.cycles-pp.mod_timer
>       1.54 =C2=B1  3%      +0.1        1.67 =C2=B1  3%  perf-profile.self=
.cycles-pp.__tcp_transmit_skb
>       0.28 =C2=B1  5%      +0.1        0.41 =C2=B1  8%  perf-profile.self=
.cycles-pp.ip_finish_output
>       0.68 =C2=B1  5%      +0.1        0.83 =C2=B1  4%  perf-profile.self=
.cycles-pp.__local_bh_enable_ip
>       0.22 =C2=B1 10%      +0.3        0.49 =C2=B1  3%  perf-profile.self=
.cycles-pp.dev_hard_start_xmit
> =

> =

>                                                                          =
       =

>                         netperf.time.voluntary_context_switches          =
       =

>                                                                          =
       =

>     4e+07 O-+O-O--O--O-O----O--O------------O--O--O-O--O--O-O--O-O--O----=
---+   =

>           |                         O     O                              =
   |   =

>   3.5e+07 +-+                                                            =
   |   =

>     3e+07 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>   2.5e+07 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>     2e+07 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>   1.5e+07 +-+                                                            =
   |   =

>     1e+07 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>     5e+06 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>         0 +-+-------------O-------O----O---------------------------------=
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

> Thanks,
> Rong Chen


--===============8420432539818982845==--

