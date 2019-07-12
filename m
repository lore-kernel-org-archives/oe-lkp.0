Content-Type: multipart/mixed; boundary="===============7966607820037311466=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] 0472e47660: fsmark.app_overhead 16.0% regression
Date: Fri, 12 Jul 2019 14:42:59 +0800
Message-ID: <b4e5ab18-6329-f22e-3962-230c965b0b5d@linux.intel.com>
In-Reply-To: <e29f82e0-6847-b264-300b-130bb31399d1@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7966607820037311466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Trond,

     I attached perf-profile part big changes, hope it is useful for =

analyzing the issue.


In testcase: fsmark
on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ 3.00GHz =

with 384G memory
with following parameters:

         iterations: 20x
         nr_threads: 64t
         disk: 1BRD_48G
         fs: xfs
         fs2: nfsv4
         filesize: 4M
         test_size: 80G
         sync_method: fsyncBeforeClose
         cpufreq_governor: performance

test-description: The fsmark is a file system benchmark to test =

synchronous write workloads, for example, mail servers workload.
test-url: https://sourceforge.net/projects/fsmark/

commit:
   e791f8e938 ("SUNRPC: Convert xs_send_kvec() to use iov_iter_kvec()")
   0472e47660 ("SUNRPC: Convert socket page send code to use iov_iter()")

e791f8e9380d945e 0472e476604998c127f3c80d291
---------------- ---------------------------
          %stddev     %change         %stddev
              \          |                \
     527.29           -22.6%     407.96        fsmark.files_per_sec
       1.97 =C2=B1 11%      +0.9        2.88 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interr=
upt.cpuidle_enter_state.do_idle.cpu_startup_entry
       0.00            +0.9        0.93 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp_send=
msg.sock_sendmsg.xs_sendpages
       2.11 =C2=B1 10%      +0.9        3.05 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.d=
o_idle.cpu_startup_entry.start_secondary
       5.29 =C2=B1  2%      +1.2        6.46 =C2=B1  7% =

perf-profile.calltrace.cycles-pp.svc_recv.nfsd.kthread.ret_from_fork
       9.61 =C2=B1  5%      +3.1       12.70 =C2=B1  2% =

perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
       9.27 =C2=B1  5%      +3.1       12.40 =C2=B1  2% =

perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthread.ret=
_from_fork
      34.52 =C2=B1  4%      +3.3       37.78 =C2=B1  2% =

perf-profile.calltrace.cycles-pp.ret_from_fork
      34.52 =C2=B1  4%      +3.3       37.78 =C2=B1  2% =

perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
       0.00            +3.4        3.41 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.memcpy_erms.memcpy_from_page._copy_from_it=
er_full.tcp_sendmsg_locked.tcp_sendmsg
       0.00            +3.4        3.44 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.memcpy_from_page._copy_from_iter_full.tcp_=
sendmsg_locked.tcp_sendmsg.sock_sendmsg
       0.00            +3.5        3.54 =C2=B1  4% =

perf-profile.calltrace.cycles-pp._copy_from_iter_full.tcp_sendmsg_locked.tc=
p_sendmsg.sock_sendmsg.xs_sendpages
       2.30 =C2=B1  5%      +3.7        6.02 =C2=B1  3% =

perf-profile.calltrace.cycles-pp.__rpc_execute.rpc_async_schedule.process_o=
ne_work.worker_thread.kthread
       2.30 =C2=B1  5%      +3.7        6.02 =C2=B1  3% =

perf-profile.calltrace.cycles-pp.rpc_async_schedule.process_one_work.worker=
_thread.kthread.ret_from_fork
       1.81 =C2=B1  4%      +3.8        5.59 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.call_transmit.__rpc_execute.rpc_async_sche=
dule.process_one_work.worker_thread
       1.80 =C2=B1  3%      +3.8        5.59 =C2=B1  3% =

perf-profile.calltrace.cycles-pp.xprt_transmit.call_transmit.__rpc_execute.=
rpc_async_schedule.process_one_work
       1.73 =C2=B1  4%      +3.8        5.54 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.xs_tcp_send_request.xprt_transmit.call_tra=
nsmit.__rpc_execute.rpc_async_schedule
       1.72 =C2=B1  4%      +3.8        5.54 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.xs_sendpages.xs_tcp_send_request.xprt_tran=
smit.call_transmit.__rpc_execute
       0.00            +5.4        5.42 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendms=
g.xs_sendpages.xs_tcp_send_request
       0.00            +5.5        5.52 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.tcp_sendmsg.sock_sendmsg.xs_sendpages.xs_t=
cp_send_request.xprt_transmit
       0.00            +5.5        5.53 =C2=B1  4% =

perf-profile.calltrace.cycles-pp.sock_sendmsg.xs_sendpages.xs_tcp_send_requ=
est.xprt_transmit.call_transmit
       9.61 =C2=B1  5%      +3.1       12.70 =C2=B1  2% =

perf-profile.children.cycles-pp.worker_thread
       9.27 =C2=B1  5%      +3.1       12.40 =C2=B1  2% =

perf-profile.children.cycles-pp.process_one_work
       6.19            +3.2        9.40 =C2=B1  4% =

perf-profile.children.cycles-pp.memcpy_erms
      34.53 =C2=B1  4%      +3.3       37.78 =C2=B1  2% =

perf-profile.children.cycles-pp.ret_from_fork
      34.52 =C2=B1  4%      +3.3       37.78 =C2=B1  2% =

perf-profile.children.cycles-pp.kthread
       0.00            +3.5        3.46 =C2=B1  4% =

perf-profile.children.cycles-pp.memcpy_from_page
       0.00            +3.6        3.56 =C2=B1  4% =

perf-profile.children.cycles-pp._copy_from_iter_full
       2.47 =C2=B1  4%      +3.7        6.18 =C2=B1  3% =

perf-profile.children.cycles-pp.__rpc_execute
       2.30 =C2=B1  5%      +3.7        6.02 =C2=B1  3% =

perf-profile.children.cycles-pp.rpc_async_schedule
       1.90 =C2=B1  4%      +3.8        5.67 =C2=B1  3% =

perf-profile.children.cycles-pp.call_transmit
       1.89 =C2=B1  3%      +3.8        5.66 =C2=B1  3% =

perf-profile.children.cycles-pp.xprt_transmit
       1.82 =C2=B1  4%      +3.8        5.62 =C2=B1  3% =

perf-profile.children.cycles-pp.xs_tcp_send_request
       1.81 =C2=B1  4%      +3.8        5.62 =C2=B1  3% =

perf-profile.children.cycles-pp.xs_sendpages
       0.21 =C2=B1 17%      +5.3        5.48 =C2=B1  4% =

perf-profile.children.cycles-pp.tcp_sendmsg_locked
       0.25 =C2=B1 18%      +5.3        5.59 =C2=B1  3% =

perf-profile.children.cycles-pp.tcp_sendmsg
       0.26 =C2=B1 16%      +5.3        5.60 =C2=B1  3% =

perf-profile.children.cycles-pp.sock_sendmsg
       1.19 =C2=B1  5%      +0.5        1.68 =C2=B1  3% =

perf-profile.self.cycles-pp.get_page_from_freelist
       6.10            +3.2        9.27 =C2=B1  4% =

perf-profile.self.cycles-pp.memcpy_erms


On 7/9/2019 10:39 AM, Xing Zhengjun wrote:
> Hi Trond,
> =

> On 7/8/2019 7:44 PM, Trond Myklebust wrote:
>> I've asked several times now about how to interpret your results. As =

>> far as I can tell from your numbers, the overhead appears to be =

>> entirely contained in the NUMA section of your results.
>> IOW: it would appear to be a scheduling overhead due to NUMA. I've =

>> been asking whether or not that is a correct interpretation of the =

>> numbers you published.
> Thanks for your feedback. I used the same hardware and the same test =

> parameters to test the two commits:
>  =C2=A0=C2=A0 e791f8e938 ("SUNRPC: Convert xs_send_kvec() to use iov_iter=
_kvec()")
>  =C2=A0=C2=A0 0472e47660 ("SUNRPC: Convert socket page send code to use i=
ov_iter()")
> =

> If it is caused by NUMA, why only commit 0472e47660 throughput is =

> decreased? The filesystem we test is NFS, commit 0472e47660 is related =

> with the network, could you help to check if have any other clues for =

> the regression. Thanks.
> =


-- =

Zhengjun Xing

--===============7966607820037311466==--

