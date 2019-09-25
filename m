Content-Type: multipart/mixed; boundary="===============8123527607336953173=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [SUNRPC] 0472e47660: fsmark.app_overhead 16.0% regression
Date: Wed, 25 Sep 2019 17:00:03 +0800
Message-ID: <17e6b70e-7148-73a0-045c-a74d0d2795ad@linux.intel.com>
In-Reply-To: <f46834cb-5429-2f2a-bf20-99f00afc36c1@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8123527607336953173==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 8/30/2019 8:43 AM, Xing Zhengjun wrote:
> =

> =

> On 8/7/2019 3:56 PM, Xing Zhengjun wrote:
>>
>>
>> On 7/24/2019 1:17 PM, Xing Zhengjun wrote:
>>>
>>>
>>> On 7/12/2019 2:42 PM, Xing Zhengjun wrote:
>>>> Hi Trond,
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 I attached perf-profile part big changes, hop=
e it is useful for =

>>>> analyzing the issue.
>>>
>>> Ping...
>>
>> ping...
>>
> ping...

ping...

>>>
>>>>
>>>>
>>>> In testcase: fsmark
>>>> on test machine: 40 threads Intel(R) Xeon(R) CPU E5-2690 v2 @ =

>>>> 3.00GHz with 384G memory
>>>> with following parameters:
>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 iterations: 20x
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nr_threads: 64t
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disk: 1BRD_48G
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fs: xfs
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fs2: nfsv4
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 filesize: 4M
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 test_size: 80G
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sync_method: fsyncBef=
oreClose
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpufreq_governor: per=
formance
>>>>
>>>> test-description: The fsmark is a file system benchmark to test =

>>>> synchronous write workloads, for example, mail servers workload.
>>>> test-url: https://sourceforge.net/projects/fsmark/
>>>>
>>>> commit:
>>>> =C2=A0=C2=A0 e791f8e938 ("SUNRPC: Convert xs_send_kvec() to use iov_it=
er_kvec()")
>>>> =C2=A0=C2=A0 0472e47660 ("SUNRPC: Convert socket page send code to use =

>>>> iov_iter()")
>>>>
>>>> e791f8e9380d945e 0472e476604998c127f3c80d291
>>>> ---------------- ---------------------------
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 %stddev=C2=A0=
=C2=A0=C2=A0=C2=A0 %change=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
%stddev
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 \
>>>> =C2=A0=C2=A0=C2=A0=C2=A0 527.29=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -22.6%=C2=A0=C2=A0=C2=A0=C2=A0 407.96=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 fsmark.files_per_sec
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.97 =C2=B1 11%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.88 =C2=B1=C2=
=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.smp_apic_timer_interrupt.apic_timer_i=
nterrupt.cpuidle_enter_state.do_idle.cpu_startup_entry =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 0.93 =C2=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.tcp_write_xmit.tcp_sendmsg_locked.tcp=
_sendmsg.sock_sendmsg.xs_sendpages =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.11 =C2=B1 10%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +0.9=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 3.05 =C2=B1=C2=
=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.apic_timer_interrupt.cpuidle_enter_st=
ate.do_idle.cpu_startup_entry.start_secondary =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.29 =C2=B1=C2=A0 2%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +1.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.46 =C2=
=B1=C2=A0 7% =

>>>> perf-profile.calltrace.cycles-pp.svc_recv.nfsd.kthread.ret_from_fork
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.61 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.70 =C2=B1=C2=
=A0 2% =

>>>> perf-profile.calltrace.cycles-pp.worker_thread.kthread.ret_from_fork
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.27 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.40 =C2=B1=C2=
=A0 2% =

>>>> perf-profile.calltrace.cycles-pp.process_one_work.worker_thread.kthrea=
d.ret_from_fork =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.52 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +3.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37.78 =C2=B1=C2=A0 2% =

>>>> perf-profile.calltrace.cycles-pp.ret_from_fork
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.52 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +3.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37.78 =C2=B1=C2=A0 2% =

>>>> perf-profile.calltrace.cycles-pp.kthread.ret_from_fork
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 3.41 =C2=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.memcpy_erms.memcpy_from_page._copy_fr=
om_iter_full.tcp_sendmsg_locked.tcp_sendmsg =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 3.44 =C2=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.memcpy_from_page._copy_from_iter_full=
.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 3.54 =C2=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp._copy_from_iter_full.tcp_sendmsg_lock=
ed.tcp_sendmsg.sock_sendmsg.xs_sendpages =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.30 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.02 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.calltrace.cycles-pp.__rpc_execute.rpc_async_schedule.proc=
ess_one_work.worker_thread.kthread =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.30 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.02 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.calltrace.cycles-pp.rpc_async_schedule.process_one_work.w=
orker_thread.kthread.ret_from_fork =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.81 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.59 =C2=
=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.call_transmit.__rpc_execute.rpc_async=
_schedule.process_one_work.worker_thread =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.80 =C2=B1=C2=A0 3%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.59 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.calltrace.cycles-pp.xprt_transmit.call_transmit.__rpc_exe=
cute.rpc_async_schedule.process_one_work =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.73 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.54 =C2=
=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.xs_tcp_send_request.xprt_transmit.cal=
l_transmit.__rpc_execute.rpc_async_schedule =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.72 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.54 =C2=
=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.xs_sendpages.xs_tcp_send_request.xprt=
_transmit.call_transmit.__rpc_execute =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +5.4=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5.42 =C2=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_s=
endmsg.xs_sendpages.xs_tcp_send_request =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +5.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5.52 =C2=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.tcp_sendmsg.sock_sendmsg.xs_sendpages=
.xs_tcp_send_request.xprt_transmit =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +5.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 5.53 =C2=B1=C2=A0 4% =

>>>> perf-profile.calltrace.cycles-pp.sock_sendmsg.xs_sendpages.xs_tcp_send=
_request.xprt_transmit.call_transmit =

>>>>
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.61 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.70 =C2=B1=C2=
=A0 2% =

>>>> perf-profile.children.cycles-pp.worker_thread
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 9.27 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.1=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 12.40 =C2=B1=C2=
=A0 2% =

>>>> perf-profile.children.cycles-pp.process_one_work
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.19=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 9.40 =C2=B1=C2=A0 4% =

>>>> perf-profile.children.cycles-pp.memcpy_erms
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.53 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +3.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37.78 =C2=B1=C2=A0 2% =

>>>> perf-profile.children.cycles-pp.ret_from_fork
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 34.52 =C2=B1=C2=A0 4%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +3.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 37.78 =C2=B1=C2=A0 2% =

>>>> perf-profile.children.cycles-pp.kthread
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 3.46 =C2=B1=C2=A0 4% =

>>>> perf-profile.children.cycles-pp.memcpy_from_page
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.00=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.6=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 3.56 =C2=B1=C2=A0 4% =

>>>> perf-profile.children.cycles-pp._copy_from_iter_full
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.47 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.18 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.children.cycles-pp.__rpc_execute
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2.30 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.7=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.02 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.children.cycles-pp.rpc_async_schedule
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.90 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.67 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.children.cycles-pp.call_transmit
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.89 =C2=B1=C2=A0 3%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.66 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.children.cycles-pp.xprt_transmit
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.82 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.62 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.children.cycles-pp.xs_tcp_send_request
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.81 =C2=B1=C2=A0 4%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +3.8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.62 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.children.cycles-pp.xs_sendpages
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.21 =C2=B1 17%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +5.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.48 =C2=B1=C2=
=A0 4% =

>>>> perf-profile.children.cycles-pp.tcp_sendmsg_locked
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.25 =C2=B1 18%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +5.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.59 =C2=B1=C2=
=A0 3% =

>>>> perf-profile.children.cycles-pp.tcp_sendmsg
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0.26 =C2=B1 16%=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 +5.3=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5.60 =C2=B1=C2=
=A0 3% =

>>>> perf-profile.children.cycles-pp.sock_sendmsg
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.19 =C2=B1=C2=A0 5%=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 +0.5=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1.68 =C2=
=B1=C2=A0 3% =

>>>> perf-profile.self.cycles-pp.get_page_from_freelist
>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.10=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 +3.2=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 9.27 =C2=B1=C2=A0 4% =

>>>> perf-profile.self.cycles-pp.memcpy_erms
>>>>
>>>>
>>>> On 7/9/2019 10:39 AM, Xing Zhengjun wrote:
>>>>> Hi Trond,
>>>>>
>>>>> On 7/8/2019 7:44 PM, Trond Myklebust wrote:
>>>>>> I've asked several times now about how to interpret your results. =

>>>>>> As far as I can tell from your numbers, the overhead appears to be =

>>>>>> entirely contained in the NUMA section of your results.
>>>>>> IOW: it would appear to be a scheduling overhead due to NUMA. I've =

>>>>>> been asking whether or not that is a correct interpretation of the =

>>>>>> numbers you published.
>>>>> Thanks for your feedback. I used the same hardware and the same =

>>>>> test parameters to test the two commits:
>>>>> =C2=A0=C2=A0=C2=A0 e791f8e938 ("SUNRPC: Convert xs_send_kvec() to use =

>>>>> iov_iter_kvec()")
>>>>> =C2=A0=C2=A0=C2=A0 0472e47660 ("SUNRPC: Convert socket page send code=
 to use =

>>>>> iov_iter()")
>>>>>
>>>>> If it is caused by NUMA, why only commit 0472e47660 throughput is =

>>>>> decreased? The filesystem we test is NFS, commit 0472e47660 is =

>>>>> related with the network, could you help to check if have any other =

>>>>> clues for the regression. Thanks.
>>>>>
>>>>
>>>
>>
> =


-- =

Zhengjun Xing

--===============8123527607336953173==--

