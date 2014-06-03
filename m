Content-Type: multipart/mixed; boundary="===============4884357861122035933=="
MIME-Version: 1.0
From: Jet Chen <jet.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [rcu] 5057f55e543: +1307.4% time.involuntary_context_switches
Date: Tue, 03 Jun 2014 12:16:53 +0800
Message-ID: <538D4C35.8000506@intel.com>
In-Reply-To: <20140603031828.GB9092@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============4884357861122035933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 06/03/2014 11:18 AM, Fengguang Wu wrote:
> On Tue, Jun 03, 2014 at 10:49:11AM +0800, Jet Chen wrote:
>> TO: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>> CC: LKML <linux-kernel@vger.kernel.org>
>> CC: lkp(a)01.org
>>
>> FYI, we noticed the below changes on
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/paulmck/linux-rcu.git rcu/=
fixes
>> commit 5057f55e543b7859cfd26bc281291795eac93f8a ("rcu: Bind RCU grace-pe=
riod kthreads if NO_HZ_FULL")
>>
>> Here highlight some major changes:
> =

> What's the kernels it's comparing?  The headers here should not be
> removed.
> =

>>       7946 ~13%   +1307.4%     111846 ~ 2%  TOTAL time.involuntary_conte=
xt_switches
>>  2.127e+09 ~ 0%     -23.5%  1.628e+09 ~ 4%  TOTAL qperf.udp.recv_bw
>>  2.128e+09 ~ 0%     -23.3%  1.633e+09 ~ 4%  TOTAL qperf.udp.send_bw
>>  2.101e+10 ~ 2%     -18.7%  1.707e+10 ~ 2%  TOTAL iperf.tcp.receiver.bps
>>  2.101e+10 ~ 2%     -18.7%  1.707e+10 ~ 2%  TOTAL iperf.tcp.sender.bps
>>  6.115e+09 ~ 5%     -17.9%  5.022e+09 ~ 6%  TOTAL qperf.sctp.bw
>>   2.83e+09 ~ 1%     -12.5%  2.476e+09 ~ 3%  TOTAL qperf.tcp.bw
>>      26070 ~ 0%      -1.2%      25768 ~ 0%  TOTAL will-it-scale.per_proc=
ess_ops
>>       0.40 ~ 0%      +1.9%       0.41 ~ 1%  TOTAL will-it-scale.scalabil=
ity
>>    1113433 ~ 7%    +137.1%    2639530 ~ 3%  TOTAL cpuidle.C4-ATM.time
>>        786 ~20%     +71.8%       1350 ~15%  TOTAL cpuidle.POLL.usage
>>      47106 ~ 8%     +53.8%      72472 ~ 3%  TOTAL cpuidle.C1E-ATM.usage
>>        659 ~ 7%     +50.6%        992 ~ 3%  TOTAL cpuidle.C3-IVT.usage
>>       3026 ~ 8%     +42.9%       4324 ~ 3%  TOTAL cpuidle.C4-ATM.usage
>>    5062629 ~ 4%     +26.6%    6408492 ~ 2%  TOTAL cpuidle.C1E-ATM.time
>>     402345 ~ 2%     -18.9%     326211 ~ 0%  TOTAL cpuidle.C6-IVT.usage
>>        944 ~ 9%     +17.0%       1105 ~ 8%  TOTAL cpuidle.C1E-IVT.usage
>>     403926 ~ 0%     -17.3%     333985 ~ 1%  TOTAL cpuidle.C7-SNB.usage
>>     124425 ~ 0%     -16.4%     103999 ~ 0%  TOTAL cpuidle.C6-ATM.usage
>>
>>
>> full comparison result:
> =

> What's the command for producing the full result?

here I use
	compare -a 5057f55e543b7859cfd26bc281291795eac93f8a~ 5057f55e543b7859cfd26=
bc281291795eac93f8a

> =

> Thanks,
> Fengguang
> =

>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>  2.127e+09 ~ 0%     -23.5%  1.628e+09 ~ 4%  bens/qperf/600s
>>  2.127e+09 ~ 0%     -23.5%  1.628e+09 ~ 4%  TOTAL qperf.udp.recv_bw
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>  2.128e+09 ~ 0%     -23.3%  1.633e+09 ~ 4%  bens/qperf/600s
>>  2.128e+09 ~ 0%     -23.3%  1.633e+09 ~ 4%  TOTAL qperf.udp.send_bw
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>  2.101e+10 ~ 2%     -18.7%  1.707e+10 ~ 2%  bens/iperf/300s-tcp
>>  2.101e+10 ~ 2%     -18.7%  1.707e+10 ~ 2%  TOTAL iperf.tcp.receiver.bps
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>  2.101e+10 ~ 2%     -18.7%  1.707e+10 ~ 2%  bens/iperf/300s-tcp
>>  2.101e+10 ~ 2%     -18.7%  1.707e+10 ~ 2%  TOTAL iperf.tcp.sender.bps
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>  1.331e+09 ~ 2%      -5.8%  1.255e+09 ~ 2%  bens/qperf/600s
>>    2.4e+09 ~ 6%     -30.4%  1.671e+09 ~12%  brickland3/qperf/600s
>>  2.384e+09 ~ 7%     -12.1%  2.096e+09 ~ 3%  lkp-sb03/qperf/600s
>>  6.115e+09 ~ 5%     -17.9%  5.022e+09 ~ 6%  TOTAL qperf.sctp.bw
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>   2.83e+09 ~ 1%     -12.5%  2.476e+09 ~ 3%  bens/qperf/600s
>>   2.83e+09 ~ 1%     -12.5%  2.476e+09 ~ 3%  TOTAL qperf.tcp.bw
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      26070 ~ 0%      -1.2%      25768 ~ 0%  lkp-a03/will-it-scale/unlink1
>>      26070 ~ 0%      -1.2%      25768 ~ 0%  TOTAL will-it-scale.per_proc=
ess_ops
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       0.40 ~ 0%      +1.9%       0.41 ~ 1%  lkp-a03/will-it-scale/unlink1
>>       0.40 ~ 0%      +1.9%       0.41 ~ 1%  TOTAL will-it-scale.scalabil=
ity
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       5951 ~ 4%     -61.0%       2318 ~ 4%  lkp-a03/will-it-scale/unlink1
>>       5951 ~ 4%     -61.0%       2318 ~ 4%  TOTAL slabinfo.kmalloc-256.a=
ctive_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        373 ~ 4%     -60.7%        146 ~ 4%  lkp-a03/will-it-scale/unlink1
>>        373 ~ 4%     -60.7%        146 ~ 4%  TOTAL slabinfo.kmalloc-256.n=
um_slabs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        373 ~ 4%     -60.7%        146 ~ 4%  lkp-a03/will-it-scale/unlink1
>>        373 ~ 4%     -60.7%        146 ~ 4%  TOTAL slabinfo.kmalloc-256.a=
ctive_slabs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       5990 ~ 4%     -60.7%       2355 ~ 4%  lkp-a03/will-it-scale/unlink1
>>       5990 ~ 4%     -60.7%       2355 ~ 4%  TOTAL slabinfo.kmalloc-256.n=
um_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>  2.272e+08 ~ 1%     -13.3%   1.97e+08 ~ 2%  bens/qperf/600s
>>    1507825 ~ 0%     -20.5%    1198788 ~ 0%  lkp-a03/will-it-scale/unlink1
>>  2.287e+08 ~ 1%     -13.3%  1.982e+08 ~ 2%  TOTAL proc-vmstat.pgalloc_dm=
a32
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>    1113433 ~ 7%    +137.1%    2639530 ~ 3%  lkp-a03/will-it-scale/unlink1
>>    1113433 ~ 7%    +137.1%    2639530 ~ 3%  TOTAL cpuidle.C4-ATM.time
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       6269 ~ 4%     -57.8%       2647 ~ 4%  lkp-a03/will-it-scale/unlink1
>>       6269 ~ 4%     -57.8%       2647 ~ 4%  TOTAL slabinfo.shmem_inode_c=
ache.active_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       6306 ~ 4%     -57.4%       2688 ~ 4%  lkp-a03/will-it-scale/unlink1
>>       6306 ~ 4%     -57.4%       2688 ~ 4%  TOTAL slabinfo.shmem_inode_c=
ache.num_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        262 ~ 4%     -57.5%        111 ~ 4%  lkp-a03/will-it-scale/unlink1
>>        262 ~ 4%     -57.5%        111 ~ 4%  TOTAL slabinfo.shmem_inode_c=
ache.active_slabs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        262 ~ 4%     -57.5%        111 ~ 4%  lkp-a03/will-it-scale/unlink1
>>        262 ~ 4%     -57.5%        111 ~ 4%  TOTAL slabinfo.shmem_inode_c=
ache.num_slabs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        786 ~20%     +71.8%       1350 ~15%  lkp-sb03/qperf/600s
>>        786 ~20%     +71.8%       1350 ~15%  TOTAL cpuidle.POLL.usage
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       0.23 ~ 7%     -40.0%       0.14 ~ 5%  lkp-sb03/qperf/600s
>>       0.23 ~ 7%     -40.0%       0.14 ~ 5%  TOTAL turbostat.%c3
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      47106 ~ 8%     +53.8%      72472 ~ 3%  lkp-a03/will-it-scale/unlink1
>>      47106 ~ 8%     +53.8%      72472 ~ 3%  TOTAL cpuidle.C1E-ATM.usage
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1.14 ~28%     -45.0%       0.63 ~43%  lkp-sb03/qperf/600s
>>       1.14 ~28%     -45.0%       0.63 ~43%  TOTAL perf-profile.cpu-cycle=
s.copy_user_generic_string.skb_copy_datagram_iovec.tcp_recvmsg.inet_recvmsg=
.sock_aio_read
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        659 ~ 7%     +50.6%        992 ~ 3%  brickland3/qperf/600s
>>        659 ~ 7%     +50.6%        992 ~ 3%  TOTAL cpuidle.C3-IVT.usage
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       3026 ~ 8%     +42.9%       4324 ~ 3%  lkp-a03/will-it-scale/unlink1
>>       3026 ~ 8%     +42.9%       4324 ~ 3%  TOTAL cpuidle.C4-ATM.usage
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        258 ~ 9%     -19.8%        207 ~13%  brickland3/qperf/600s
>>        258 ~ 9%     -19.8%        207 ~13%  TOTAL numa-vmstat.node1.nr_p=
age_table_pages
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1041 ~ 9%     -19.3%        839 ~12%  brickland3/qperf/600s
>>       1041 ~ 9%     -19.3%        839 ~12%  TOTAL numa-meminfo.node1.Pag=
eTables
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      53062 ~ 2%     -35.1%      34464 ~ 3%  bens/qperf/600s
>>     109531 ~13%     +46.9%     160928 ~ 5%  brickland3/qperf/600s
>>      72773 ~ 1%     +40.8%     102483 ~ 1%  lkp-a03/will-it-scale/unlink1
>>      67902 ~ 1%     +13.8%      77302 ~ 3%  lkp-sb03/qperf/600s
>>     303269 ~ 6%     +23.7%     375178 ~ 3%  TOTAL softirqs.RCU
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      80344 ~ 1%     -26.2%      59325 ~ 2%  bens/qperf/600s
>>      65012 ~ 0%     -30.9%      44916 ~ 0%  lkp-a03/will-it-scale/unlink1
>>     145357 ~ 1%     -28.3%     104241 ~ 1%  TOTAL softirqs.SCHED
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>    5062629 ~ 4%     +26.6%    6408492 ~ 2%  lkp-a03/will-it-scale/unlink1
>>    5062629 ~ 4%     +26.6%    6408492 ~ 2%  TOTAL cpuidle.C1E-ATM.time
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       5015 ~ 0%     -19.1%       4054 ~ 0%  lkp-a03/will-it-scale/unlink1
>>       5015 ~ 0%     -19.1%       4054 ~ 0%  TOTAL proc-vmstat.nr_slab_un=
reclaimable
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>     402345 ~ 2%     -18.9%     326211 ~ 0%  brickland3/qperf/600s
>>     402345 ~ 2%     -18.9%     326211 ~ 0%  TOTAL cpuidle.C6-IVT.usage
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        944 ~ 9%     +17.0%       1105 ~ 8%  brickland3/qperf/600s
>>        944 ~ 9%     +17.0%       1105 ~ 8%  TOTAL cpuidle.C1E-IVT.usage
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      32956 ~ 3%     +17.5%      38713 ~ 8%  brickland3/qperf/600s
>>      32956 ~ 3%     +17.5%      38713 ~ 8%  TOTAL numa-meminfo.node3.Act=
ive
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      19858 ~ 1%     -18.1%      16267 ~ 0%  lkp-a03/will-it-scale/unlink1
>>      19858 ~ 1%     -18.1%      16267 ~ 0%  TOTAL meminfo.SUnreclaim
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>     403926 ~ 0%     -17.3%     333985 ~ 1%  lkp-sb03/qperf/600s
>>     403926 ~ 0%     -17.3%     333985 ~ 1%  TOTAL cpuidle.C7-SNB.usage
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>   74689352 ~ 1%     -13.3%   64771743 ~ 2%  bens/qperf/600s
>>    2539322 ~ 0%     -20.6%    2015084 ~ 0%  lkp-a03/will-it-scale/unlink1
>>   77228675 ~ 1%     -13.5%   66786827 ~ 2%  TOTAL proc-vmstat.pgalloc_no=
rmal
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>  3.019e+08 ~ 1%     -13.3%  2.618e+08 ~ 2%  bens/qperf/600s
>>    4047283 ~ 0%     -20.6%    3214087 ~ 0%  lkp-a03/will-it-scale/unlink1
>>  3.059e+08 ~ 1%     -13.4%   2.65e+08 ~ 2%  TOTAL proc-vmstat.pgfree
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>     124425 ~ 0%     -16.4%     103999 ~ 0%  lkp-a03/will-it-scale/unlink1
>>     124425 ~ 0%     -16.4%     103999 ~ 0%  TOTAL cpuidle.C6-ATM.usage
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>   23538414 ~ 0%     -12.9%   20506157 ~ 2%  bens/qperf/600s
>>    2496727 ~ 0%     -19.5%    2010351 ~ 0%  lkp-a03/will-it-scale/unlink1
>>   26035141 ~ 0%     -13.5%   22516509 ~ 2%  TOTAL proc-vmstat.numa_hit
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>   23538414 ~ 0%     -12.9%   20506157 ~ 2%  bens/qperf/600s
>>    2496727 ~ 0%     -19.5%    2010351 ~ 0%  lkp-a03/will-it-scale/unlink1
>>   26035141 ~ 0%     -13.5%   22516509 ~ 2%  TOTAL proc-vmstat.numa_local
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       4196 ~ 4%     -18.1%       3438 ~ 4%  brickland3/qperf/600s
>>       4196 ~ 4%     -18.1%       3438 ~ 4%  TOTAL meminfo.PageTables
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1036 ~ 4%     -17.6%        853 ~ 4%  brickland3/qperf/600s
>>       1036 ~ 4%     -17.6%        853 ~ 4%  TOTAL proc-vmstat.nr_page_ta=
ble_pages
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>    5817789 ~ 8%     +18.0%    6867050 ~ 7%  lkp-sb03/qperf/600s
>>    5817789 ~ 8%     +18.0%    6867050 ~ 7%  TOTAL meminfo.DirectMap2M
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      48.12 ~ 0%     -11.7%      42.46 ~ 6%  brickland3/qperf/600s
>>      48.12 ~ 0%     -11.7%      42.46 ~ 6%  TOTAL turbostat.%pc2
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       6542 ~ 6%     +12.6%       7364 ~ 4%  brickland3/qperf/600s
>>       6542 ~ 6%     +12.6%       7364 ~ 4%  TOTAL numa-meminfo.node3.Act=
ive(anon)
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1636 ~ 6%     +12.5%       1841 ~ 4%  brickland3/qperf/600s
>>       1636 ~ 6%     +12.5%       1841 ~ 4%  TOTAL numa-vmstat.node3.nr_a=
ctive_anon
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1415 ~ 3%     +13.3%       1602 ~ 1%  brickland3/qperf/600s
>>       1415 ~ 3%     +13.3%       1602 ~ 1%  TOTAL numa-meminfo.node1.Ker=
nelStack
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      47493 ~ 4%     -11.0%      42252 ~ 5%  brickland3/qperf/600s
>>      47493 ~ 4%     -11.0%      42252 ~ 5%  TOTAL numa-meminfo.node1.Slab
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      12789 ~ 1%     -10.9%      11391 ~ 2%  bens/qperf/600s
>>      12789 ~ 1%     -10.9%      11391 ~ 2%  TOTAL softirqs.HRTIMER
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1275 ~ 7%     -12.2%       1120 ~ 4%  brickland3/qperf/600s
>>       1275 ~ 7%     -12.2%       1120 ~ 4%  TOTAL numa-vmstat.node1.nr_a=
non_pages
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       8813 ~ 4%     -11.7%       7784 ~ 6%  brickland3/qperf/600s
>>       8813 ~ 4%     -11.7%       7784 ~ 6%  TOTAL numa-vmstat.node1.nr_s=
lab_unreclaimable
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      35254 ~ 4%     -11.7%      31138 ~ 6%  brickland3/qperf/600s
>>      35254 ~ 4%     -11.7%      31138 ~ 6%  TOTAL numa-meminfo.node1.SUn=
reclaim
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       5095 ~ 7%     -12.1%       4478 ~ 4%  brickland3/qperf/600s
>>       5095 ~ 7%     -12.1%       4478 ~ 4%  TOTAL numa-meminfo.node1.Ano=
nPages
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       6764 ~ 5%     +11.5%       7542 ~ 4%  brickland3/qperf/600s
>>       6764 ~ 5%     +11.5%       7542 ~ 4%  TOTAL numa-meminfo.node3.Ano=
nPages
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1691 ~ 5%     +11.4%       1884 ~ 4%  brickland3/qperf/600s
>>       1691 ~ 5%     +11.4%       1884 ~ 4%  TOTAL numa-vmstat.node3.nr_a=
non_pages
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       0.99 ~10%     +16.0%       1.15 ~ 8%  bens/qperf/600s
>>       0.99 ~10%     +16.0%       1.15 ~ 8%  TOTAL perf-profile.cpu-cycle=
s.tcp_rcv_established.tcp_v4_do_rcv.tcp_prequeue_process.tcp_recvmsg.inet_r=
ecvmsg
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      10946 ~ 2%      -9.0%       9957 ~ 1%  lkp-sb03/qperf/600s
>>      10946 ~ 2%      -9.0%       9957 ~ 1%  TOTAL slabinfo.kmalloc-192.a=
ctive_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       0.78 ~10%     +18.9%       0.92 ~ 7%  lkp-sb03/qperf/600s
>>       0.78 ~10%     +18.9%       0.92 ~ 7%  TOTAL perf-profile.cpu-cycle=
s.enqueue_entity.enqueue_task_fair.enqueue_task.activate_task.ttwu_do_activ=
ate
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       4838 ~ 4%      -7.7%       4465 ~ 2%  brickland3/qperf/600s
>>       4838 ~ 4%      -7.7%       4465 ~ 2%  TOTAL slabinfo.signal_cache.=
num_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       4838 ~ 4%      -7.7%       4465 ~ 2%  brickland3/qperf/600s
>>       4838 ~ 4%      -7.7%       4465 ~ 2%  TOTAL slabinfo.signal_cache.=
active_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      10948 ~ 2%      -8.9%       9977 ~ 1%  lkp-sb03/qperf/600s
>>      10948 ~ 2%      -8.9%       9977 ~ 1%  TOTAL slabinfo.kmalloc-192.n=
um_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       8138 ~ 7%     -12.2%       7145 ~ 2%  lkp-sb03/qperf/600s
>>       8138 ~ 7%     -12.2%       7145 ~ 2%  TOTAL slabinfo.anon_vma.acti=
ve_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       8138 ~ 7%     -12.2%       7145 ~ 2%  lkp-sb03/qperf/600s
>>       8138 ~ 7%     -12.2%       7145 ~ 2%  TOTAL slabinfo.anon_vma.num_=
objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1877 ~ 0%      -9.5%       1699 ~ 0%  lkp-a03/will-it-scale/unlink1
>>       1877 ~ 0%      -9.5%       1699 ~ 0%  TOTAL slabinfo.dentry.active=
_slabs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1877 ~ 0%      -9.5%       1699 ~ 0%  lkp-a03/will-it-scale/unlink1
>>       1877 ~ 0%      -9.5%       1699 ~ 0%  TOTAL slabinfo.dentry.num_sl=
abs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      39391 ~ 0%      -9.5%      35638 ~ 0%  lkp-a03/will-it-scale/unlink1
>>      39391 ~ 0%      -9.5%      35638 ~ 0%  TOTAL slabinfo.dentry.active=
_objs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      39441 ~ 0%      -9.5%      35702 ~ 0%  lkp-a03/will-it-scale/unlink1
>>      39441 ~ 0%      -9.5%      35702 ~ 0%  TOTAL slabinfo.dentry.num_ob=
js
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>     481253 ~ 0%      -8.9%     438624 ~ 0%  bens/qperf/600s
>>     481253 ~ 0%      -8.9%     438624 ~ 0%  TOTAL softirqs.TIMER
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1297 ~33%    +565.9%       8640 ~ 7%  bens/iperf/300s-tcp
>>       2788 ~ 3%    +588.8%      19204 ~ 4%  bens/qperf/600s
>>       1191 ~ 5%   +1200.9%      15493 ~ 4%  brickland3/qperf/600s
>>       1535 ~ 9%   +3404.4%      53799 ~ 0%  lkp-a03/will-it-scale/unlink1
>>       1135 ~26%   +1195.9%      14709 ~ 4%  lkp-sb03/qperf/600s
>>       7946 ~13%   +1307.4%     111846 ~ 2%  TOTAL time.involuntary_conte=
xt_switches
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>   42351859 ~ 0%      -5.3%   40114932 ~ 0%  bens/qperf/600s
>>   43015383 ~ 1%      -4.4%   41143092 ~ 0%  brickland3/qperf/600s
>>       7205 ~14%    +320.9%      30329 ~ 5%  lkp-a03/will-it-scale/unlink1
>>   85374447 ~ 1%      -4.8%   81288354 ~ 0%  TOTAL time.voluntary_context=
_switches
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>     141174 ~ 1%      -5.4%     133551 ~ 0%  bens/qperf/600s
>>     143982 ~ 1%      -4.4%     137600 ~ 0%  brickland3/qperf/600s
>>       2199 ~ 3%     +34.1%       2949 ~ 1%  lkp-a03/will-it-scale/unlink1
>>     287355 ~ 1%      -4.6%     274101 ~ 0%  TOTAL vmstat.system.cs
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>      72398 ~ 1%      -5.4%      68503 ~ 0%  bens/qperf/600s
>>       3708 ~ 0%      +2.0%       3781 ~ 0%  lkp-a03/will-it-scale/unlink1
>>       8789 ~ 4%     +22.3%      10749 ~15%  lkp-sb03/qperf/600s
>>      84895 ~ 1%      -2.2%      83034 ~ 2%  TOTAL vmstat.system.in
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>       1.51 ~ 0%      -5.3%       1.43 ~ 1%  brickland3/qperf/600s
>>       5.43 ~ 1%      -2.8%       5.28 ~ 0%  lkp-sb03/qperf/600s
>>       6.94 ~ 1%      -3.3%       6.71 ~ 0%  TOTAL turbostat.%c0
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        146 ~ 0%      -2.2%        143 ~ 0%  bens/qperf/600s
>>        147 ~ 1%      -4.8%        140 ~ 1%  brickland3/qperf/600s
>>        293 ~ 0%      -3.5%        283 ~ 0%  TOTAL time.percent_of_cpu_th=
is_job_got
>>
>> 71a9b26963f8c2d  5057f55e543b7859cfd26bc28
>> ---------------  -------------------------
>>        872 ~ 0%      -2.3%        853 ~ 0%  bens/qperf/600s
>>        874 ~ 1%      -4.6%        834 ~ 1%  brickland3/qperf/600s
>>       1747 ~ 0%      -3.4%       1687 ~ 0%  TOTAL time.system_time
>>
>>
>> Legend:
>> 	~XX%    - stddev percent
>> 	[+-]XX% - change percent
>>
>>
>>
>> Disclaimer:
>> Results have been estimated based on internal Intel analysis and are pro=
vided
>> for informational purposes only. Any difference in system hardware or so=
ftware
>> design or configuration may affect actual performance.
>>
>> Thanks,
>> Jet
>>
> =

>> echo performance > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
>> echo performance > /sys/devices/system/cpu/cpu1/cpufreq/scaling_governor
>> echo performance > /sys/devices/system/cpu/cpu2/cpufreq/scaling_governor
>> echo performance > /sys/devices/system/cpu/cpu3/cpufreq/scaling_governor
>> ./runtest.py unlink1 32 1 2 3 4
>>
>=20

--===============4884357861122035933==--

