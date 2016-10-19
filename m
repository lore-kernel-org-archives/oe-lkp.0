Content-Type: multipart/mixed; boundary="===============2129579708977031189=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [tcp] 3613b3dbd1: netpipe.bigger_5M_Mbps.avg -5.5% regression
Date: Wed, 19 Oct 2016 07:10:44 +0200
Message-ID: <CANn89iL0gYoR1k5vccAcsBe=y+dr_MZNJZ0P4Q9J9-V1+HXGQA@mail.gmail.com>
In-Reply-To: <20161019015400.GA343@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2129579708977031189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2016 at 3:54 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed a -5.5% regression of netpipe.bigger_5M_Mbps.avg due to c=
ommit:
>
> commit 3613b3dbd1ade9a6a626dae1f608c57638eb5e8a ("tcp: prepare skbs for b=
etter sack shifting")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
>
> in testcase: netpipe
> on test machine: qemu-system-x86_64 -enable-kvm -cpu host -smp 4 -m 6G
> with following parameters:
>
>         test: tcp
>         cluster: cs-localhost
>
> NetPIPE is a protocol independent performance tool that encapsulates the =
best of ttcp and netperf and visually represents the network performance un=
der a variety of conditions.
>
>
> Disclaimer:
> Results have been estimated based on internal Intel analysis and are prov=
ided
> for informational purposes only. Any difference in system hardware or sof=
tware
> design or configuration may affect actual performance.
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/kconfig/rootfs/tbox_group/test/testcase:
>   cs-localhost/gcc-6/x86_64-rhel-7.2/debian-x86_64-2016-08-31.cgz/vm-lkp-=
a08/tcp/netpipe
>
> commit:
>   e812bd905a (" wireless-drivers-next patches for 4.9")
>   3613b3dbd1 ("tcp: prepare skbs for better sack shifting")
>
> e812bd905a5cf00f 3613b3dbd1ade9a6a626dae1f6
> ---------------- --------------------------
>        fail:runs  %reproduction    fail:runs
>            |             |             |
>          %stddev     %change         %stddev
>              \          |                \
>       2427 =C4=85  0%      -5.5%       2294 =C4=85  0%  netpipe.bigger_5M=
_Mbps.avg
>       1764 =C4=85  1%      +5.0%       1853 =C4=85  0%  netpipe.time.elap=
sed_time
>       1764 =C4=85  1%      +5.0%       1853 =C4=85  0%  netpipe.time.elap=
sed_time.max
>      84.75 =C4=85  0%      -2.1%      83.00 =C4=85  0%  netpipe.time.perc=
ent_of_cpu_this_job_got
>       1497 =C4=85  1%      +3.2%       1546 =C4=85  0%  netpipe.time.syst=
em_time
>    1378335 =C4=85  1%     +28.6%    1772455 =C4=85  1%  netpipe.time.volu=
ntary_context_switches
>      14140 =C4=85  3%      +6.6%      15079 =C4=85  2%  interrupts.CAL:Fu=
nction_call_interrupts
>     393.25 =C4=85  2%     -29.1%     279.00 =C4=85  2%  slabinfo.kmalloc-=
2048.active_objs
>     412.00 =C4=85  1%     -32.3%     279.00 =C4=85  2%  slabinfo.kmalloc-=
2048.num_objs
>       4069 =C4=85  0%     +17.5%       4779 =C4=85  0%  vmstat.system.cs
>       2961 =C4=85  0%      +5.3%       3118 =C4=85  0%  vmstat.system.in
>     229439 =C4=85 94%   +6926.4%   16121408 =C4=85172%  latency_stats.avg=
.max
>     141971 =C4=85160%  +11239.9%   16099418 =C4=85172%  latency_stats.avg=
.nfs_wait_on_request.nfs_writepage_setup.nfs_updatepage.nfs_write_end.gener=
ic_perform_write.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCA=
LL_64_fastpath
>      90183 =C4=85153%     -55.4%      40178 =C4=85 84%  latency_stats.avg=
.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.en=
try_SYSCALL_64_fastpath
>     839.25 =C4=85 21%   +1114.0%      10188 =C4=85125%  latency_stats.avg=
.rpc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_syn=
c_sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4=
].nfs4_proc_lookup.[nfsv4].nfs_lookup.lookup_slow.walk_component.path_looku=
pat
>     414419 =C4=85 86%   +7661.1%   32163484 =C4=85172%  latency_stats.max=
.max
>     257867 =C4=85166%  +12362.7%   32137192 =C4=85172%  latency_stats.max=
.nfs_wait_on_request.nfs_writepage_setup.nfs_updatepage.nfs_write_end.gener=
ic_perform_write.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCA=
LL_64_fastpath
>      81137 =C4=85155%     -94.7%       4265 =C4=85 45%  latency_stats.max=
.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
>      90183 =C4=85153%     -55.4%      40178 =C4=85 84%  latency_stats.max=
.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.en=
try_SYSCALL_64_fastpath
>     839.25 =C4=85 21%   +1114.0%      10188 =C4=85125%  latency_stats.max=
.rpc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_syn=
c_sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4=
].nfs4_proc_lookup.[nfsv4].nfs_lookup.lookup_slow.walk_component.path_looku=
pat
>       6232 =C4=85 87%    -100.0%       0.00 =C4=85 -1%  latency_stats.sum=
.call_rwsem_down_read_failed.__do_page_fault.trace_do_page_fault.do_async_p=
age_fault.async_page_fault.skb_copy_datagram_iter.tcp_rcv_established.tcp_v=
4_do_rcv.tcp_prequeue_process.tcp_recvmsg.inet_recvmsg.sock_recvmsg
>       1107 =C4=85 62%    +964.9%      11788 =C4=85 55%  latency_stats.sum=
.call_rwsem_down_read_failed.proc_pid_cmdline_read.__vfs_read.vfs_read.SyS_=
read.do_syscall_64.return_from_SYSCALL_64
>     276091 =C4=85166%  +11542.5%   32143926 =C4=85172%  latency_stats.sum=
.nfs_wait_on_request.nfs_writepage_setup.nfs_updatepage.nfs_write_end.gener=
ic_perform_write.nfs_file_write.__vfs_write.vfs_write.SyS_write.entry_SYSCA=
LL_64_fastpath
>      97392 =C4=85128%     -82.9%      16660 =C4=85 29%  latency_stats.sum=
.pipe_read.__vfs_read.vfs_read.SyS_read.entry_SYSCALL_64_fastpath
>      90183 =C4=85153%     -55.4%      40178 =C4=85 84%  latency_stats.sum=
.proc_cgroup_show.proc_single_show.seq_read.__vfs_read.vfs_read.SyS_read.en=
try_SYSCALL_64_fastpath
>     839.25 =C4=85 21%   +1114.0%      10188 =C4=85125%  latency_stats.sum=
.rpc_wait_bit_killable.__rpc_execute.rpc_execute.rpc_run_task.nfs4_call_syn=
c_sequence.[nfsv4]._nfs4_proc_lookup.[nfsv4].nfs4_proc_lookup_common.[nfsv4=
].nfs4_proc_lookup.[nfsv4].nfs_lookup.lookup_slow.walk_component.path_looku=
pat
>       3561 =C4=85 11%     +12.9%       4020 =C4=85  6%  sched_debug.cpu.c=
urr->pid.avg
>       9783 =C4=85  6%     +11.8%      10942 =C4=85  3%  sched_debug.cpu.c=
urr->pid.max
>       4222 =C4=85  7%     +11.3%       4701 =C4=85  3%  sched_debug.cpu.c=
urr->pid.stddev
>    3988122 =C4=85 13%     +24.4%    4962088 =C4=85  4%  sched_debug.cpu.m=
ax_idle_balance_cost.max
>    1330791 =C4=85 13%     +30.8%    1740923 =C4=85  4%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>     576379 =C4=85  1%      +9.7%     632485 =C4=85  3%  sched_debug.cpu.n=
r_load_updates.max
>     987546 =C4=85  1%     +20.0%    1184637 =C4=85  1%  sched_debug.cpu.n=
r_switches.avg
>    1074939 =C4=85  2%     +23.9%    1332366 =C4=85  3%  sched_debug.cpu.n=
r_switches.max
>      67934 =C4=85 31%    +110.9%     143278 =C4=85  5%  sched_debug.cpu.n=
r_switches.stddev
>     -15.31 =C4=85-32%     -41.6%      -8.93 =C4=85-57%  sched_debug.cpu.n=
r_uninterruptible.min
>     990916 =C4=85  1%     +20.2%    1190867 =C4=85  1%  sched_debug.cpu.s=
ched_count.avg
>    1079929 =C4=85  2%     +24.2%    1341786 =C4=85  3%  sched_debug.cpu.s=
ched_count.max
>      69632 =C4=85 31%    +111.3%     147114 =C4=85  5%  sched_debug.cpu.s=
ched_count.stddev
>     386683 =C4=85  1%     +25.2%     483992 =C4=85  2%  sched_debug.cpu.s=
ched_goidle.avg
>     424674 =C4=85  1%     +29.4%     549482 =C4=85  1%  sched_debug.cpu.s=
ched_goidle.max
>      33344 =C4=85 23%    +107.5%      69183 =C4=85  9%  sched_debug.cpu.s=
ched_goidle.stddev
>     513012 =C4=85  1%     +19.1%     610887 =C4=85  1%  sched_debug.cpu.t=
twu_count.avg
>     570351 =C4=85  5%     +24.2%     708599 =C4=85  5%  sched_debug.cpu.t=
twu_count.max
>      40059 =C4=85 42%    +112.3%      85064 =C4=85 14%  sched_debug.cpu.t=
twu_count.stddev
>
>
>
>
> Thanks,
> Xiaolong

Thanks for the report.

I could not reproduce your results, assuming it is netperf over loopback.

Problem with synthetic tests like that is that a small change can
cascade effects.

In your stats I can see a high number of context switches that a
normal netperf does not exhibit.

Also, maybe the problem is because you are using VM, maybe some NUMA
pinning or something...


Small hack to be able to enable/disable my patch, without having to
reboot and thus have  less variability.

edumazet(a)manihi:/ssd/git/net-next$ git diff net/ipv4/tcp.c
diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
index 3251fe71f39f..55afe7b16016 100644
--- a/net/ipv4/tcp.c
+++ b/net/ipv4/tcp.c
@@ -1035,7 +1035,7 @@ EXPORT_SYMBOL(tcp_sendpage);
  */
 static int linear_payload_sz(bool first_skb)
 {
-       if (first_skb)
+       if (first_skb || (netdev_max_backlog & 1))
                return SKB_WITH_OVERHEAD(2048 - MAX_TCP_HEADER);
        return 0;
 }

Then :

lpk51:~# echo 1000 >/proc/sys/net/core/netdev_max_backlog
lpk51:~# perf stat -a -C0,1 ./netperf -H 127.0.0.1 -Cc -T0,1
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
127.0.0.1 () port 0 AF_INET : cpu bind
port 0 protocol 6
Recv   Send    Send                          Utilization       Service Dema=
nd
Socket Socket  Message  Elapsed              Send     Recv     Send    Recv
Size   Size    Size     Time     Throughput  local    remote   local   remo=
te
bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us/KB

 87380  16384  16384    10.00      45854.74   5.90     5.90     0.337   0.3=
37

 Performance counter stats for 'system wide':

      20005.989547      task-clock (msec)         #    2.000 CPUs
utilized
         1,568,042      context-switches          #    0.078 M/sec
                 2      cpu-migrations            #    0.000 K/sec
               121      page-faults               #    0.006 K/sec
    69,260,921,315      cycles                    #    3.462 GHz
              [83.33%]
    49,197,585,858      stalled-cycles-frontend   #   71.03% frontend
cycles idle    [83.34%]
    30,069,741,080      stalled-cycles-backend    #   43.42% backend
cycles idle    [66.67%]
    32,341,104,986      instructions              #    0.47  insns per
cycle
                                                  #    1.52  stalled
cycles per insn [83.34%]
     5,887,445,456      branches                  #  294.284 M/sec
              [83.34%]
        65,533,193      branch-misses             #    1.11% of all
branches         [83.33%]

      10.003057093 seconds time elapsed

lpk51:~# echo 1001 >/proc/sys/net/core/netdev_max_backlog
lpk51:~# perf stat -a -C0,1 ./netperf -H 127.0.0.1 -Cc -T0,1
MIGRATED TCP STREAM TEST from 0.0.0.0 (0.0.0.0) port 0 AF_INET to
127.0.0.1 () port 0 AF_INET : cpu bind
port 0 protocol 6
Recv   Send    Send                          Utilization       Service Dema=
nd
Socket Socket  Message  Elapsed              Send     Recv     Send    Recv
Size   Size    Size     Time     Throughput  local    remote   local   remo=
te
bytes  bytes   bytes    secs.    10^6bits/s  % S      % S      us/KB   us/KB

 87380  16384  16384    10.00      45267.63   5.94     5.94     0.344   0.3=
44

 Performance counter stats for 'system wide':

      20006.713062      task-clock (msec)         #    2.000 CPUs
utilized
         1,466,531      context-switches          #    0.073 M/sec
                 2      cpu-migrations            #    0.000 K/sec
               120      page-faults               #    0.006 K/sec
    69,743,911,198      cycles                    #    3.486 GHz
              [83.33%]
    49,509,413,005      stalled-cycles-frontend   #   70.99% frontend
cycles idle    [83.34%]
    28,186,805,983      stalled-cycles-backend    #   40.41% backend
cycles idle    [66.67%]
    31,662,971,822      instructions              #    0.45  insns per
cycle
                                                  #    1.56  stalled
cycles per insn [83.34%]
     5,751,313,010      branches                  #  287.469 M/sec
              [83.34%]
        69,213,717      branch-misses             #    1.20% of all
branches         [83.33%]

      10.002924757 seconds time elapsed

--===============2129579708977031189==--

