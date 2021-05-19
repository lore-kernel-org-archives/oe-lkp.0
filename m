Content-Type: multipart/mixed; boundary="===============7765449605007259177=="
MIME-Version: 1.0
From: Nadav Amit <namit@vmware.com>
To: lkp@lists.01.org
Subject: Re: [smp] a32a4d8a81: netperf.Throughput_tps -2.1% regression
Date: Wed, 19 May 2021 18:17:35 +0000
Message-ID: <16A4D949-D82D-4034-B5A4-DE4DADE15884@vmware.com>
In-Reply-To: <20210519142742.GA5275@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7765449605007259177==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

[ +PeterZ for reference ]


> On May 19, 2021, at 7:27 AM, kernel test robot <oliver.sang@intel.com> =
wrote:
> =

> =

> =

> Greeting,
> =

> FYI, we noticed a -2.1% regression of netperf.Throughput_tps due to commi=
t:
> =

> =

> commit: a32a4d8a815c4eb6dc64b8962dc13a9dfae70868 ("smp: Run functions con=
currently in smp_call_function_many_cond()")
> https://nam04.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.k=
ernel.org%2Fcgit%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git&amp;data=3D0=
4%7C01%7Cnamit%40vmware.com%7Ca49b22e928144aab039908d91acff8c4%7Cb39138ca3c=
ee4b4aa4d6cd83d9dd62f0%7C0%7C0%7C637570302823256266%7CUnknown%7CTWFpbGZsb3d=
8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&=
amp;sdata=3Dh2VRetBNlEQBvOlkYrRCMCK6%2BukRqlCElYxM8UfVxqI%3D&amp;reserved=
=3D0 master
> =

> =

> in testcase: netperf
> on test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU=
 @ 2.30GHz with 192G memory
> with following parameters:
> =

> 	ip: ipv4
> 	runtime: 300s
> 	nr_threads: 1
> 	cluster: cs-localhost
> 	test: UDP_RR
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> =


[snip]

> commit:
>  v5.12-rc2
>  a32a4d8a81 ("smp: Run functions concurrently in smp_call_function_many_c=
ond()")
> =

>       v5.12-rc2 a32a4d8a815c4eb6dc64b8962dc
> ---------------- ---------------------------
>         %stddev     %change         %stddev
>             \          |                \
>    116903            -2.1%     114404        netperf.Throughput_total_tps
>    116903            -2.1%     114404        netperf.Throughput_tps
>  35066769            -2.1%   34317990        netperf.time.voluntary_conte=
xt_switches
>  35071059            -2.1%   34321258        netperf.workload
>     67295            +1.5%      68333        proc-vmstat.nr_anon_pages
>    463520            -2.1%     453603        vmstat.system.cs
>    535.28 =C2=B1  6%      -8.3%     490.97 =C2=B1 10%  sched_debug.cfs_rq=
:/.util_est_enqueued.max
>      0.02 =C2=B1  8%     -10.8%       0.02 =C2=B1  4%  sched_debug.cpu.nr=
_running.avg
>  76309820 =C2=B1  4%    +320.0%  3.205e+08 =C2=B1158%  cpuidle.C1.time
>  23409116 =C2=B1  3%     +31.0%   30676822 =C2=B1 20%  cpuidle.C1.usage
>  46720133 =C2=B1  2%     -12.9%   40709940 =C2=B1  2%  cpuidle.POLL.usage
>      5282 =C2=B1110%    +317.0%      22029 =C2=B1 58%  numa-vmstat.node3.=
nr_anon_pages
>     11998 =C2=B1 55%    +138.7%      28637 =C2=B1 45%  numa-vmstat.node3.=
nr_inactive_anon
>     11998 =C2=B1 55%    +138.7%      28637 =C2=B1 45%  numa-vmstat.node3.=
nr_zone_inactive_anon
>      8397 =C2=B1136%    +588.7%      57827 =C2=B1 75%  numa-meminfo.node3=
.AnonHugePages
>     21162 =C2=B1110%    +316.7%      88189 =C2=B1 58%  numa-meminfo.node3=
.AnonPages
>     48780 =C2=B1 54%    +136.8%     115533 =C2=B1 45%  numa-meminfo.node3=
.Inactive
>     48780 =C2=B1 54%    +136.8%     115533 =C2=B1 45%  numa-meminfo.node3=
.Inactive(anon)
>    467040            -2.1%     457094        perf-stat.i.context-switches
>      0.01 =C2=B1138%      +0.0        0.03 =C2=B1 73%  perf-stat.i.dTLB-s=
tore-miss-rate%
> 9.415e+08            -2.4%  9.188e+08 =C2=B1  2%  perf-stat.i.dTLB-stores
>      0.01 =C2=B1137%      +0.0        0.03 =C2=B1 73%  perf-stat.overall.=
dTLB-store-miss-rate%
>    465472            -2.1%     455557        perf-stat.ps.context-switches
> 9.385e+08            -2.4%  9.158e+08 =C2=B1  2%  perf-stat.ps.dTLB-stores
>      1.21 =C2=B1 14%      +0.2        1.41 =C2=B1  5%  perf-profile.callt=
race.cycles-pp.__ip_append_data.ip_make_skb.udp_sendmsg.sock_sendmsg.__sys_=
sendto
>      2.05 =C2=B1 10%      +0.3        2.33 =C2=B1  4%  perf-profile.callt=
race.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.seco=
ndary_startup_64_no_verify
>      0.06 =C2=B1  7%      +0.0        0.08 =C2=B1 14%  perf-profile.child=
ren.cycles-pp.__calc_delta
>      0.08 =C2=B1 19%      +0.0        0.10 =C2=B1  9%  perf-profile.child=
ren.cycles-pp._copy_to_user
>      0.09 =C2=B1 22%      +0.0        0.12 =C2=B1  8%  perf-profile.child=
ren.cycles-pp._copy_from_user
>      0.12 =C2=B1 20%      +0.0        0.17 =C2=B1 13%  perf-profile.child=
ren.cycles-pp.exit_to_user_mode_prepare
>      0.14 =C2=B1 11%      +0.1        0.19 =C2=B1  9%  perf-profile.child=
ren.cycles-pp.skb_release_data
>      1.21 =C2=B1 14%      +0.2        1.41 =C2=B1  5%  perf-profile.child=
ren.cycles-pp.__ip_append_data
>      2.07 =C2=B1 11%      +0.3        2.33 =C2=B1  4%  perf-profile.child=
ren.cycles-pp.schedule_idle
>      0.06 =C2=B1  7%      +0.0        0.08 =C2=B1 11%  perf-profile.self.=
cycles-pp.__calc_delta
>      0.19 =C2=B1  8%      +0.0        0.24 =C2=B1  6%  perf-profile.self.=
cycles-pp.__softirqentry_text_start
>      0.24 =C2=B1  8%      +0.1        0.29 =C2=B1  4%  perf-profile.self.=
cycles-pp.__skb_recv_udp
>      0.14 =C2=B1 11%      +0.1        0.19 =C2=B1  9%  perf-profile.self.=
cycles-pp.skb_release_data
>      0.02 =C2=B1142%      +0.1        0.08 =C2=B1 17%  perf-profile.self.=
cycles-pp.sock_alloc_send_pskb
>      0.11 =C2=B1 17%      +0.1        0.19 =C2=B1 13%  perf-profile.self.=
cycles-pp.__ip_append_data
>      0.12 =C2=B1 34%      +0.1        0.26 =C2=B1 22%  perf-profile.self.=
cycles-pp.perf_mux_hrtimer_handler
>      0.87 =C2=B1 13%      +0.2        1.05 =C2=B1  6%  perf-profile.self.=
cycles-pp._raw_spin_lock
>      1287 =C2=B1 42%     +75.3%       2256 =C2=B1 14%  interrupts.CPU111.=
CAL:Function_call_interrupts
>      1326 =C2=B1 43%     +71.0%       2267 =C2=B1 13%  interrupts.CPU119.=
CAL:Function_call_interrupts
>      1300 =C2=B1 45%     +75.9%       2287 =C2=B1 37%  interrupts.CPU120.=
CAL:Function_call_interrupts
>      1299 =C2=B1 45%     +60.1%       2081 =C2=B1 28%  interrupts.CPU128.=
CAL:Function_call_interrupts
>      1305 =C2=B1 45%     +61.7%       2110 =C2=B1 29%  interrupts.CPU131.=
CAL:Function_call_interrupts
>      1299 =C2=B1 45%     +61.8%       2102 =C2=B1 28%  interrupts.CPU139.=
CAL:Function_call_interrupts
>     66.67 =C2=B1133%     -97.2%       1.83 =C2=B1155%  interrupts.CPU14.T=
LB:TLB_shootdowns
>      1299 =C2=B1 45%    +107.8%       2700 =C2=B1 33%  interrupts.CPU142.=
CAL:Function_call_interrupts
>    301.83 =C2=B1128%     -95.6%      13.17 =C2=B1140%  interrupts.CPU149.=
RES:Rescheduling_interrupts
>    389.17 =C2=B1 89%     -73.5%     103.17 =C2=B1 35%  interrupts.CPU164.=
NMI:Non-maskable_interrupts
>    389.17 =C2=B1 89%     -73.5%     103.17 =C2=B1 35%  interrupts.CPU164.=
PMI:Performance_monitoring_interrupts
>      1299 =C2=B1 45%     +60.2%       2081 =C2=B1 28%  interrupts.CPU35.C=
AL:Function_call_interrupts
>      1244 =C2=B1 50%     +66.8%       2076 =C2=B1 27%  interrupts.CPU45.C=
AL:Function_call_interrupts
>      1300 =C2=B1 44%     +59.5%       2075 =C2=B1 28%  interrupts.CPU46.C=
AL:Function_call_interrupts
>      1.50 =C2=B1 63%   +1422.2%      22.83 =C2=B1167%  interrupts.CPU47.R=
ES:Rescheduling_interrupts
>    467.33 =C2=B1 85%     -64.6%     165.67 =C2=B1 74%  interrupts.CPU58.N=
MI:Non-maskable_interrupts
>    467.33 =C2=B1 85%     -64.6%     165.67 =C2=B1 74%  interrupts.CPU58.P=
MI:Performance_monitoring_interrupts
>    306.67 =C2=B1 75%     -59.9%     122.83 =C2=B1 16%  interrupts.CPU68.N=
MI:Non-maskable_interrupts
>    306.67 =C2=B1 75%     -59.9%     122.83 =C2=B1 16%  interrupts.CPU68.P=
MI:Performance_monitoring_interrupts
>      1131 =C2=B1 27%     +61.2%       1822 =C2=B1 35%  interrupts.CPU85.C=
AL:Function_call_interrupts
>      1180 =C2=B1 31%     +79.6%       2119 =C2=B1 24%  interrupts.CPU86.C=
AL:Function_call_interrupts
> =


Could it be a result of a regression that was resolved by commit
641acbf6fd6 ("smp: Micro-optimize smp_call_function_many_cond()")
or does this report mean that the performance regression also
happened on the -rc?


--===============7765449605007259177==
Content-Type: application/pgp-signature
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="signature.asc"

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0KCmlRSXpCQUVCQ0FBZEZpRUVTSkwzb3NsNVlt
eC93OUkxSGFBcVNhYmFEMW9GQW1DbFZqOEFDZ2tRSGFBcVNhYmEKRDFveUNBLzlIeHBSSzFMaTd4
RVZqc0NjWXYxZlQ5dXE5MU4vRUpoWDk2dm9EUCt6SWx1VUxCcmpDenFzZmxlVAo4ZjUxSVNQaUJ5
L1RLd1VIZWxwZ3N3dTIySldRRnJCbXJ5dnhIZEMrRSs5S09jbXlzS3RNWGRHSFFNbHM2dkJGClNq
N2lwVzhnUGhxeTV3T2k0MDRTWXp0U1lPQ2hYdEFRUEVaaUhjU1hkRDBKSGxLTlZFRlkvY3piZkdO
SllMQy8KRDBRNUpXWFpXYmxlb2NwbFhGcVJSSG52S2h4VW5GSU1oQ0dxQ1E1c29OeFd1VDZMYWFs
cm5jYktHaXpsRzhWOAovcW9IbHlTYTAyVDUxVllyd1dUS0FTcmNaK0dQc0N4Vk5PRGwxUWYwWGxB
QWpZaVBqVXdYNDNLTHdSSXBsNHRaCkp3cmIwZlZVOHR3Vk0xd1d3VjFoTTVsb2QvM2JJc2hYZ0xJ
bjlOVnUzODIrN1BqTzZiaWFWRjBMSjgwZDkxTk8KMHBGcTRUUEY0eWc1c2RieHpDUldmMURRNkJK
NjMrMkVOaXBFek1wMVM1NlNuT1RGT3Vzc3BEc3JrR2ZGa3ZSMwo1UjFOSFY2bWFBaGtBa2c0V2JQ
OG9nYmJlcmlLM1pXeVhnY0VkVEVIVVlobU1qdy9ReWg1UXA1OFY3bDJCdHdNCnNmNitQL2NhZVd3
eDlGcytxZW1hMnJNR3IwbTRMS2xVTnFlVTB1TGQvV3BIc0FuNEFIOUVZajBXRVhtblBnNEYKeVlL
UFQ2TkNKMDlDVkNHZFFEL2hVbWhpRVhuQ0VMdFBSanMyTkZXWnhUT080VFFQa1V6TmcwMjZ0R2JV
Q1Q4aApaV24yMjVXUzlYWU1DVi9oSDhGTDVnYWVRMGUyWnF1ZTVVMnFVZG1CaTY5QkNtRVJVUWs9
Cj1pSExZCi0tLS0tRU5EIFBHUCBTSUdOQVRVUkUtLS0tLQo=

--===============7765449605007259177==--

