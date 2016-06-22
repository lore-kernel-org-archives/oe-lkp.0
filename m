Content-Type: multipart/mixed; boundary="===============7672997831179034239=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 795ae7a0de: pixz.throughput -9.1% regression
Date: Wed, 22 Jun 2016 17:24:15 -0400
Message-ID: <20160622212415.GA24150@cmpxchg.org>
In-Reply-To: <20160608053726.GA20879@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============7672997831179034239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Jun 08, 2016 at 01:37:26PM +0800, Ye Xiaolong wrote:
> On Tue, Jun 07, 2016 at 05:56:27PM -0400, Johannes Weiner wrote:
> >But just to make sure I'm looking at the right code, can you first try
> >the following patch on top of Linus's current tree and see if that
> >gets performance back to normal? It's a partial revert of the
> >watermarks that singles out the fair zone allocator:
> =

> Seems that this patch doesn't help to gets performance back.
> I've attached the comparison result among 3ed3a4f, 795ae7ay, v4.7-rc2 and
> 1fe49ba5 ("mm: revert fairness batching to before the watermarks were")
> with perf profile information.  You can find it via searching 'perf-profi=
le'.

Sorry for the delay, and thank you for running these. I still can't
reproduce this.

> 3ed3a4f0ddffece9 795ae7a0de6b834a0cc202aa55                   v4.7-rc2 1f=
e49ba5002a50aefd5b6c4913
> ---------------- -------------------------- -------------------------- --=
------------------------
>        fail:runs  %reproduction    fail:runs  %reproduction    fail:runs =
 %reproduction    fail:runs
>            |             |             |             |             |     =
        |             |
>            :4            0%            :7            0%            :4    =
       50%           2:4     kmsg.DHCP/BOOTP:Reply_not_for_us,op[#]xid[#]
>            :4           50%           2:7            0%            :4    =
        0%            :4     kmsg.Spurious_LAPIC_timer_interrupt_on_cpu
>            :4            0%            :7           14%           1:4    =
       25%           1:4     kmsg.igb#:#:#:exceed_max#second
>          %stddev     %change         %stddev     %change         %stddev =
    %change         %stddev
>              \          |                \          |                \   =
       |                \
>   78505362 =C2=B1  0%      -9.2%   71298182 =C2=B1  0%     -11.8%   69280=
014 =C2=B1  0%      -9.1%   71350485 =C2=B1  0%  pixz.throughput
>    5586220 =C2=B1  2%      -1.6%    5498492 =C2=B1  2%      +6.5%    5950=
210 =C2=B1  1%      +8.4%    6052963 =C2=B1  1%  pixz.time.involuntary_cont=
ext_switches
>    4582198 =C2=B1  2%      -3.6%    4416275 =C2=B1  2%      -8.6%    4189=
304 =C2=B1  4%      -8.0%    4214839 =C2=B1  0%  pixz.time.minor_page_faults
>       4530 =C2=B1  0%      +1.0%       4575 =C2=B1  0%      -1.6%       4=
458 =C2=B1  0%      -1.3%       4469 =C2=B1  0%  pixz.time.percent_of_cpu_t=
his_job_got
>      92.03 =C2=B1  0%      +5.6%      97.23 =C2=B1 11%     +31.3%     120=
.83 =C2=B1  1%     +30.4%     119.98 =C2=B1  0%  pixz.time.system_time
>      14911 =C2=B1  0%      +2.1%      15218 =C2=B1  0%      -1.0%      14=
759 =C2=B1  1%      -1.0%      14764 =C2=B1  0%  pixz.time.user_time
>    6586930 =C2=B1  0%      -8.4%    6033444 =C2=B1  1%      -4.4%    6295=
529 =C2=B1  1%      -2.6%    6416460 =C2=B1  1%  pixz.time.voluntary_contex=
t_switches
>    2179703 =C2=B1  4%      +4.8%    2285049 =C2=B1  2%     -15.3%    1846=
752 =C2=B1 16%      -8.2%    2000913 =C2=B1  4%  softirqs.RCU
>      92.03 =C2=B1  0%      +5.6%      97.23 =C2=B1 11%     +31.3%     120=
.83 =C2=B1  1%     +30.4%     119.98 =C2=B1  0%  time.system_time
>       2237 =C2=B1  2%      -2.9%       2172 =C2=B1  7%     +16.3%       2=
601 =C2=B1  7%      +8.0%       2416 =C2=B1  6%  uptime.idle
>      49869 =C2=B1  1%     -12.6%      43583 =C2=B1  8%     -18.0%      40=
917 =C2=B1  0%     -16.3%      41728 =C2=B1  1%  vmstat.system.cs
>      97890 =C2=B1  1%      -0.0%      97848 =C2=B1  3%      +7.4%     105=
143 =C2=B1  2%      +6.8%     104518 =C2=B1  2%  vmstat.system.in
>     105682 =C2=B1  1%      +0.6%     106297 =C2=B1  1%     -85.2%      15=
631 =C2=B1  4%     -85.1%      15768 =C2=B1  1%  meminfo.Active(file)
>     390126 =C2=B1  0%      -0.2%     389529 =C2=B1  0%     +23.9%     483=
296 =C2=B1  0%     +23.9%     483194 =C2=B1  0%  meminfo.Inactive
>     380750 =C2=B1  0%      -0.2%     380141 =C2=B1  0%     +24.5%     473=
891 =C2=B1  0%     +24.4%     473760 =C2=B1  0%  meminfo.Inactive(file)
>       2401 =C2=B1107%     +76.9%       4247 =C2=B1 79%     -99.8%       5=
.75 =C2=B1 18%     -99.7%       6.75 =C2=B1 39%  numa-numastat.node0.other_=
node
>    2074670 =C2=B1  2%     -11.3%    1840052 =C2=B1 11%     -21.1%    1637=
071 =C2=B1 12%     -22.5%    1607724 =C2=B1  7%  numa-numastat.node1.local_=
node
>    2081648 =C2=B1  2%     -11.4%    1844923 =C2=B1 11%     -21.4%    1637=
081 =C2=B1 12%     -22.8%    1607730 =C2=B1  7%  numa-numastat.node1.numa_h=
it
>       6977 =C2=B1 36%     -30.2%       4871 =C2=B1 66%     -99.8%      10=
.50 =C2=B1 17%     -99.9%       5.50 =C2=B1 20%  numa-numastat.node1.other_=
node
>   13061458 =C2=B1 19%      -3.3%   12634644 =C2=B1 24%     +33.5%   17435=
714 =C2=B1 47%     +58.3%   20674526 =C2=B1 14%  cpuidle.C1-IVT.time
>     193807 =C2=B1 15%     +26.8%     245657 =C2=B1 76%    +101.8%     391=
021 =C2=B1  8%    +115.5%     417669 =C2=B1 20%  cpuidle.C1-IVT.usage
>  8.866e+08 =C2=B1  2%     -15.6%  7.479e+08 =C2=B1  6%     +25.0%  1.108e=
+09 =C2=B1  5%     +21.0%  1.073e+09 =C2=B1  4%  cpuidle.C6-IVT.time
>      93283 =C2=B1  0%     -13.2%      80988 =C2=B1  3%    +300.6%     373=
726 =C2=B1121%     +20.8%     112719 =C2=B1  1%  cpuidle.C6-IVT.usage
>    8559466 =C2=B1 20%     -39.3%    5195127 =C2=B1 40%     -98.1%     159=
481 =C2=B1173%    -100.0%      97.50 =C2=B1 40%  cpuidle.POLL.time
>     771388 =C2=B1  9%     -53.4%     359081 =C2=B1 52%     -99.9%     959=
.00 =C2=B1167%    -100.0%      40.50 =C2=B1 39%  cpuidle.POLL.usage
>      94.35 =C2=B1  0%      +1.0%      95.28 =C2=B1  0%      -1.6%      92=
.81 =C2=B1  0%      -1.4%      93.00 =C2=B1  0%  turbostat.%Busy
>       2824 =C2=B1  0%      +1.0%       2851 =C2=B1  0%      -1.6%       2=
777 =C2=B1  0%      -1.4%       2784 =C2=B1  0%  turbostat.Avg_MHz
>       3.57 =C2=B1  3%     -20.9%       2.83 =C2=B1  6%     +18.6%       4=
.24 =C2=B1  6%      +9.4%       3.91 =C2=B1  4%  turbostat.CPU%c1
>       2.07 =C2=B1  3%      -8.8%       1.89 =C2=B1 10%     +42.0%       2=
.95 =C2=B1 13%     +48.7%       3.08 =C2=B1  4%  turbostat.CPU%c6
>     157.67 =C2=B1  0%      -0.7%     156.51 =C2=B1  0%      -1.4%     155=
.47 =C2=B1  0%      -1.4%     155.39 =C2=B1  0%  turbostat.CorWatt
>       0.17 =C2=B1 17%      -2.9%       0.17 =C2=B1 23%    +151.4%       0=
.44 =C2=B1 23%     +88.6%       0.33 =C2=B1 11%  turbostat.Pkg%pc2
>     192.71 =C2=B1  0%      -0.8%     191.15 =C2=B1  0%      -1.4%     190=
.10 =C2=B1  0%      -1.3%     190.12 =C2=B1  0%  turbostat.PkgWatt
>      22.36 =C2=B1  0%      -8.4%      20.49 =C2=B1  0%     -10.3%      20=
.05 =C2=B1  0%      -8.1%      20.55 =C2=B1  0%  turbostat.RAMWatt
>      53301 =C2=B1  2%      +0.3%      53439 =C2=B1  5%     -85.3%       7=
826 =C2=B1  4%     -85.2%       7898 =C2=B1  1%  numa-meminfo.node0.Active(=
file)
>     194536 =C2=B1  2%      +0.8%     196145 =C2=B1  2%     +24.4%     241=
970 =C2=B1  1%     +25.2%     243537 =C2=B1  1%  numa-meminfo.node0.Inactive
>     189951 =C2=B1  0%      -0.1%     189801 =C2=B1  1%     +24.7%     236=
921 =C2=B1  0%     +24.7%     236864 =C2=B1  0%  numa-meminfo.node0.Inactiv=
e(file)
>      10240 =C2=B1  2%      -1.0%      10138 =C2=B1  3%     -16.2%       8=
580 =C2=B1  3%     -17.6%       8442 =C2=B1  1%  numa-meminfo.node0.KernelS=
tack
>      26406 =C2=B1  4%      -8.4%      24183 =C2=B1  7%     -10.2%      23=
723 =C2=B1  2%      -4.7%      25152 =C2=B1  5%  numa-meminfo.node0.SReclai=
mable
>      52381 =C2=B1  1%      +0.9%      52856 =C2=B1  3%     -85.1%       7=
804 =C2=B1  4%     -85.0%       7867 =C2=B1  2%  numa-meminfo.node1.Active(=
file)
>     195602 =C2=B1  2%      -1.1%     193393 =C2=B1  2%     +23.4%     241=
343 =C2=B1  1%     +22.5%     239683 =C2=B1  1%  numa-meminfo.node1.Inactive
>     190797 =C2=B1  0%      -0.2%     190340 =C2=B1  1%     +24.2%     236=
969 =C2=B1  0%     +24.2%     236897 =C2=B1  0%  numa-meminfo.node1.Inactiv=
e(file)
>       4188 =C2=B1  6%      +2.4%       4289 =C2=B1  5%     +42.2%       5=
955 =C2=B1  4%     +45.0%       6073 =C2=B1  2%  numa-meminfo.node1.KernelS=
tack
>      22906 =C2=B1  4%     +10.5%      25314 =C2=B1  6%     +13.4%      25=
980 =C2=B1  2%      +8.5%      24850 =C2=B1  5%  numa-meminfo.node1.SReclai=
mable
>      13324 =C2=B1  2%      +0.3%      13359 =C2=B1  5%     -85.3%       1=
956 =C2=B1  4%     -85.2%       1974 =C2=B1  1%  numa-vmstat.node0.nr_activ=
e_file
>     454.25 =C2=B1  2%    +773.4%       3967 =C2=B1  2%    +794.3%       4=
062 =C2=B1  3%    +194.4%       1337 =C2=B1  2%  numa-vmstat.node0.nr_alloc=
_batch
>      47488 =C2=B1  0%      -0.1%      47449 =C2=B1  1%     +24.7%      59=
229 =C2=B1  0%     +24.7%      59215 =C2=B1  0%  numa-vmstat.node0.nr_inact=
ive_file
>     639.25 =C2=B1  2%      -1.0%     633.00 =C2=B1  3%     -16.2%     536=
.00 =C2=B1  3%     -17.5%     527.25 =C2=B1  1%  numa-vmstat.node0.nr_kerne=
l_stack
>       6600 =C2=B1  4%      -8.4%       6045 =C2=B1  7%     -10.2%       5=
930 =C2=B1  2%      -4.7%       6287 =C2=B1  5%  numa-vmstat.node0.nr_slab_=
reclaimable
>      69675 =C2=B1  3%      +3.0%      71759 =C2=B1  4%    -100.0%       2=
.50 =C2=B1 66%    -100.0%       3.75 =C2=B1 51%  numa-vmstat.node0.numa_oth=
er
>      13094 =C2=B1  1%      +0.9%      13213 =C2=B1  3%     -85.1%       1=
950 =C2=B1  4%     -85.0%       1966 =C2=B1  2%  numa-vmstat.node1.nr_activ=
e_file
>     563.00 =C2=B1  2%    +642.6%       4181 =C2=B1  3%    +631.5%       4=
118 =C2=B1  4%    +162.8%       1479 =C2=B1  2%  numa-vmstat.node1.nr_alloc=
_batch
>      47699 =C2=B1  0%      -0.2%      47584 =C2=B1  1%     +24.2%      59=
241 =C2=B1  0%     +24.2%      59223 =C2=B1  0%  numa-vmstat.node1.nr_inact=
ive_file
>     261.25 =C2=B1  6%      +2.4%     267.57 =C2=B1  5%     +42.3%     371=
.75 =C2=B1  4%     +45.3%     379.50 =C2=B1  2%  numa-vmstat.node1.nr_kerne=
l_stack
>       5726 =C2=B1  4%     +10.5%       6328 =C2=B1  6%     +13.4%       6=
495 =C2=B1  2%      +8.5%       6212 =C2=B1  5%  numa-vmstat.node1.nr_slab_=
reclaimable
>    1254802 =C2=B1  3%      -9.6%    1134298 =C2=B1 10%     -19.6%    1008=
654 =C2=B1  9%     -21.0%     990900 =C2=B1  5%  numa-vmstat.node1.numa_hit
>    1232554 =C2=B1  3%      -9.6%    1113884 =C2=B1 10%     -18.2%    1008=
648 =C2=B1  9%     -19.6%     990898 =C2=B1  5%  numa-vmstat.node1.numa_loc=
al
>      22247 =C2=B1 11%      -8.2%      20414 =C2=B1 16%    -100.0%       5=
.75 =C2=B1 18%    -100.0%       1.75 =C2=B1 24%  numa-vmstat.node1.numa_oth=
er
>      26419 =C2=B1  1%      +0.6%      26573 =C2=B1  1%     -85.2%       3=
907 =C2=B1  4%     -85.1%       3941 =C2=B1  1%  proc-vmstat.nr_active_file
>     946.75 =C2=B1  3%    +764.9%       8188 =C2=B1  2%    +745.5%       8=
004 =C2=B1  1%    +196.1%       2803 =C2=B1  1%  proc-vmstat.nr_alloc_batch
>      95188 =C2=B1  0%      -0.2%      95035 =C2=B1  0%     +24.5%     118=
472 =C2=B1  0%     +24.4%     118440 =C2=B1  0%  proc-vmstat.nr_inactive_fi=
le
>    3005733 =C2=B1  3%      -4.4%    2872963 =C2=B1  2%     -14.6%    2566=
600 =C2=B1  6%     -13.9%    2587727 =C2=B1  1%  proc-vmstat.numa_hint_faul=
ts_local
>    3652636 =C2=B1  1%      -4.4%    3492233 =C2=B1  2%     -16.5%    3049=
926 =C2=B1  2%     -14.0%    3139498 =C2=B1  0%  proc-vmstat.numa_hit
>    3643257 =C2=B1  1%      -4.4%    3483323 =C2=B1  2%     -16.3%    3049=
910 =C2=B1  2%     -13.8%    3139486 =C2=B1  0%  proc-vmstat.numa_local
>       9379 =C2=B1  0%      -5.0%       8909 =C2=B1 12%     -99.8%      16=
.25 =C2=B1  7%     -99.9%      12.25 =C2=B1 27%  proc-vmstat.numa_other
>    4924994 =C2=B1  3%      +0.9%    4966927 =C2=B1  9%     +38.2%    6804=
572 =C2=B1  5%     +38.7%    6831202 =C2=B1  4%  proc-vmstat.numa_pages_mig=
rated
>       8510 =C2=B1  0%      +1.5%       8638 =C2=B1  1%     -27.1%       6=
204 =C2=B1 31%     -11.2%       7554 =C2=B1  1%  proc-vmstat.pgactivate
>    2403080 =C2=B1  2%     -58.7%     993450 =C2=B1  2%     -57.0%    1033=
978 =C2=B1  4%     -39.3%    1457730 =C2=B1  3%  proc-vmstat.pgalloc_dma32
>   15038432 =C2=B1  0%      +8.1%   16250009 =C2=B1  3%     +16.9%   17583=
879 =C2=B1  2%     +14.9%   17277548 =C2=B1  1%  proc-vmstat.pgalloc_normal
>      32128 =C2=B1 22%     +41.4%      45421 =C2=B1 21%    +391.6%     157=
952 =C2=B1  9%    +333.9%     139392 =C2=B1 11%  proc-vmstat.pgmigrate_fail
>    4924994 =C2=B1  3%      +0.9%    4966927 =C2=B1  9%     +38.2%    6804=
572 =C2=B1  5%     +38.7%    6831202 =C2=B1  4%  proc-vmstat.pgmigrate_succ=
ess
>      25886 =C2=B1  2%      -1.2%      25585 =C2=B1  4%     +12.0%      28=
981 =C2=B1  2%     +12.5%      29132 =C2=B1  2%  proc-vmstat.thp_deferred_s=
plit_page
>     632.75 =C2=B1  3%      -1.6%     622.43 =C2=B1  3%     -18.1%     518=
.50 =C2=B1  2%     -19.4%     510.00 =C2=B1  0%  slabinfo.RAW.active_objs
>     632.75 =C2=B1  3%      -1.6%     622.43 =C2=B1  3%     -18.1%     518=
.50 =C2=B1  2%     -19.4%     510.00 =C2=B1  0%  slabinfo.RAW.num_objs
>       1512 =C2=B1  1%      -0.6%       1502 =C2=B1  1%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  slabinfo.UNIX.active_objs
>       1512 =C2=B1  1%      -0.6%       1502 =C2=B1  1%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  slabinfo.UNIX.num_objs
>     766.50 =C2=B1 10%      +7.5%     823.86 =C2=B1 10%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  slabinfo.avc_xperms_node.a=
ctive_objs
>     766.50 =C2=B1 10%      +7.5%     823.86 =C2=B1 10%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  slabinfo.avc_xperms_node.n=
um_objs
>     507.00 =C2=B1  9%     +16.1%     588.57 =C2=B1 10%     +21.1%     614=
.00 =C2=B1  4%      +3.1%     522.75 =C2=B1 10%  slabinfo.file_lock_cache.a=
ctive_objs
>     507.00 =C2=B1  9%     +16.1%     588.57 =C2=B1 10%     +21.1%     614=
.00 =C2=B1  4%      +3.1%     522.75 =C2=B1 10%  slabinfo.file_lock_cache.n=
um_objs
>      13334 =C2=B1  4%      +6.9%      14255 =C2=B1  4%     +12.1%      14=
952 =C2=B1  4%     +11.8%      14907 =C2=B1 11%  slabinfo.kmalloc-512.num_o=
bjs
>     357.00 =C2=B1  2%      +0.7%     359.43 =C2=B1  1%     +35.2%     482=
.75 =C2=B1  0%     +33.9%     478.00 =C2=B1  0%  slabinfo.kmalloc-8192.num_=
objs
>       8080 =C2=B1  3%      +1.9%       8233 =C2=B1  4%     +16.8%       9=
441 =C2=B1  5%     +17.2%       9470 =C2=B1  1%  slabinfo.kmalloc-96.active=
_objs
>       8125 =C2=B1  3%      +1.9%       8281 =C2=B1  4%     +16.8%       9=
488 =C2=B1  5%     +17.1%       9511 =C2=B1  1%  slabinfo.kmalloc-96.num_ob=
js
>       1112 =C2=B1  4%      -2.5%       1084 =C2=B1  5%      +6.6%       1=
186 =C2=B1 11%     +11.9%       1244 =C2=B1  2%  slabinfo.task_group.active=
_objs
>       1112 =C2=B1  4%      -2.5%       1084 =C2=B1  5%      +6.6%       1=
186 =C2=B1 11%     +11.9%       1244 =C2=B1  2%  slabinfo.task_group.num_ob=
js
>      18.81 =C2=B1  7%     +12.4%      21.13 =C2=B1 28%  +4.5e+06%     837=
325 =C2=B1  3%  +4.5e+06%     846688 =C2=B1  0%  sched_debug.cfs_rq:/.load.=
avg
>      90.42 =C2=B1 75%     +88.7%     170.62 =C2=B1137%  +1.1e+06%    1028=
138 =C2=B1  0%  +1.3e+06%    1157227 =C2=B1 19%  sched_debug.cfs_rq:/.load.=
max
>      10.83 =C2=B1 25%     +13.6%      12.31 =C2=B1 12%  +4.6e+06%     500=
135 =C2=B1 62%  +5.8e+06%     625582 =C2=B1 11%  sched_debug.cfs_rq:/.load.=
min
>      12.00 =C2=B1 81%     +96.8%      23.63 =C2=B1144%  +9.6e+05%     115=
762 =C2=B1 29%    +8e+05%      96269 =C2=B1 29%  sched_debug.cfs_rq:/.load.=
stddev
>      26.71 =C2=B1 11%      -8.9%      24.33 =C2=B1 10%   +2902.0%     801=
.76 =C2=B1  2%   +2935.3%     810.66 =C2=B1  0%  sched_debug.cfs_rq:/.load_=
avg.avg
>     241.42 =C2=B1 34%     -32.4%     163.29 =C2=B1 54%    +294.1%     951=
.38 =C2=B1  2%    +299.9%     965.33 =C2=B1  3%  sched_debug.cfs_rq:/.load_=
avg.max
>      14.13 =C2=B1  5%      +4.8%      14.81 =C2=B1  4%   +3872.3%     561=
.08 =C2=B1 18%   +4326.5%     625.25 =C2=B1  5%  sched_debug.cfs_rq:/.load_=
avg.min
>      37.52 =C2=B1 37%     -35.7%      24.15 =C2=B1 48%    +103.7%      76=
.43 =C2=B1 19%     +49.9%      56.27 =C2=B1  7%  sched_debug.cfs_rq:/.load_=
avg.stddev
>    6864771 =C2=B1  0%      +1.6%    6971358 =C2=B1  0%     -97.9%     146=
805 =C2=B1  0%     -97.9%     147296 =C2=B1  0%  sched_debug.cfs_rq:/.min_v=
runtime.avg
>    6984488 =C2=B1  0%      +1.2%    7071775 =C2=B1  0%     -97.7%     158=
812 =C2=B1  0%     -97.7%     160483 =C2=B1  1%  sched_debug.cfs_rq:/.min_v=
runtime.max
>    6522931 =C2=B1  1%      +1.2%    6598038 =C2=B1  1%     -97.8%     141=
019 =C2=B1  1%     -97.8%     141943 =C2=B1  0%  sched_debug.cfs_rq:/.min_v=
runtime.min
>      80297 =C2=B1  7%      -5.5%      75882 =C2=B1 12%     -95.3%       3=
775 =C2=B1  7%     -95.4%       3703 =C2=B1  9%  sched_debug.cfs_rq:/.min_v=
runtime.stddev
>      16.76 =C2=B1  1%      +1.4%      16.98 =C2=B1  0%   +4570.6%     782=
.68 =C2=B1  2%   +4662.4%     798.07 =C2=B1  0%  sched_debug.cfs_rq:/.runna=
ble_load_avg.avg
>      28.88 =C2=B1  7%     +10.6%      31.93 =C2=B1  7%   +3065.5%     914=
.04 =C2=B1  3%   +3138.1%     935.00 =C2=B1  1%  sched_debug.cfs_rq:/.runna=
ble_load_avg.max
>       9.54 =C2=B1 28%     +18.5%      11.31 =C2=B1 11%   +4105.7%     401=
.29 =C2=B1 62%   +5300.0%     515.25 =C2=B1 13%  sched_debug.cfs_rq:/.runna=
ble_load_avg.min
>       2.92 =C2=B1 11%      +2.0%       2.98 =C2=B1 10%   +3057.4%      92=
.11 =C2=B1 45%   +2153.7%      65.75 =C2=B1 13%  sched_debug.cfs_rq:/.runna=
ble_load_avg.stddev
>      83900 =C2=B1 25%     -46.8%      44629 =C2=B1 65%     -98.9%     894=
.85 =C2=B1155%     -99.8%     201.22 =C2=B1111%  sched_debug.cfs_rq:/.sprea=
d0.max
>    -377675 =C2=B1-21%     +13.7%    -429229 =C2=B1-20%     -95.5%     -16=
912 =C2=B1 -5%     -95.1%     -18353 =C2=B1-11%  sched_debug.cfs_rq:/.sprea=
d0.min
>      80284 =C2=B1  7%      -5.5%      75895 =C2=B1 12%     -95.3%       3=
778 =C2=B1  7%     -95.4%       3707 =C2=B1  9%  sched_debug.cfs_rq:/.sprea=
d0.stddev
>      81.92 =C2=B1 23%     -30.5%      56.96 =C2=B1 12%      -6.6%      76=
.55 =C2=B1 29%     -28.3%      58.74 =C2=B1  9%  sched_debug.cfs_rq:/.util_=
avg.stddev
>     249892 =C2=B1 16%      -2.1%     244699 =C2=B1 33%     +94.1%     485=
129 =C2=B1 13%    +114.3%     535496 =C2=B1 22%  sched_debug.cpu.avg_idle.m=
in
>     149745 =C2=B1  9%     +13.0%     169186 =C2=B1  7%     -28.0%     107=
794 =C2=B1 16%      -8.4%     137183 =C2=B1 70%  sched_debug.cpu.avg_idle.s=
tddev
>       2.94 =C2=B1 10%     +21.0%       3.56 =C2=B1 33%    +107.3%       6=
.10 =C2=B1  7%     +84.9%       5.44 =C2=B1 11%  sched_debug.cpu.clock.stdd=
ev
>       2.94 =C2=B1 10%     +21.0%       3.56 =C2=B1 33%    +107.3%       6=
.10 =C2=B1  7%     +84.9%       5.44 =C2=B1 11%  sched_debug.cpu.clock_task=
.stddev
>      17.64 =C2=B1  9%      -0.9%      17.48 =C2=B1  7%   +4333.8%     781=
.92 =C2=B1  2%   +4425.8%     798.14 =C2=B1  0%  sched_debug.cpu.cpu_load[0=
].avg
>      69.46 =C2=B1103%     -20.3%      55.38 =C2=B1102%   +1216.0%     914=
.04 =C2=B1  3%   +1246.3%     935.08 =C2=B1  1%  sched_debug.cpu.cpu_load[0=
].max
>      11.08 =C2=B1 24%     +25.0%      13.86 =C2=B1 12%   +3294.7%     376=
.25 =C2=B1 67%   +4554.1%     515.83 =C2=B1 12%  sched_debug.cpu.cpu_load[0=
].min
>       8.49 =C2=B1115%     -28.6%       6.06 =C2=B1132%   +1028.8%      95=
.82 =C2=B1 43%    +674.4%      65.73 =C2=B1 13%  sched_debug.cpu.cpu_load[0=
].stddev
>      17.31 =C2=B1  5%      -0.1%      17.29 =C2=B1  3%   +4472.2%     791=
.32 =C2=B1  2%   +4547.7%     804.39 =C2=B1  0%  sched_debug.cpu.cpu_load[1=
].avg
>      48.17 =C2=B1 72%      -8.0%      44.33 =C2=B1 60%   +1832.6%     930=
.88 =C2=B1  2%   +1837.6%     933.29 =C2=B1  1%  sched_debug.cpu.cpu_load[1=
].max
>      12.04 =C2=B1 16%     +15.5%      13.90 =C2=B1 11%   +4315.6%     531=
.71 =C2=B1 19%   +5030.8%     617.83 =C2=B1  4%  sched_debug.cpu.cpu_load[1=
].min
>       5.37 =C2=B1 86%     -16.0%       4.51 =C2=B1 82%   +1297.0%      75=
.04 =C2=B1 37%    +890.6%      53.21 =C2=B1 14%  sched_debug.cpu.cpu_load[1=
].stddev
>      17.22 =C2=B1  3%      -0.2%      17.19 =C2=B1  1%   +4482.9%     788=
.99 =C2=B1  2%   +4559.4%     802.18 =C2=B1  0%  sched_debug.cpu.cpu_load[2=
].avg
>      40.29 =C2=B1 36%      -4.6%      38.43 =C2=B1 32%   +2179.5%     918=
.46 =C2=B1  1%   +2210.0%     930.75 =C2=B1  1%  sched_debug.cpu.cpu_load[2=
].max
>      12.25 =C2=B1 16%     +13.1%      13.86 =C2=B1 10%   +4163.6%     522=
.29 =C2=B1 21%   +4879.3%     609.96 =C2=B1  5%  sched_debug.cpu.cpu_load[2=
].min
>       4.29 =C2=B1 45%     -13.7%       3.70 =C2=B1 44%   +1627.3%      74=
.02 =C2=B1 36%   +1125.0%      52.50 =C2=B1 13%  sched_debug.cpu.cpu_load[2=
].stddev
>      17.16 =C2=B1  2%      -0.2%      17.13 =C2=B1  1%   +4483.1%     786=
.38 =C2=B1  2%   +4563.1%     800.09 =C2=B1  0%  sched_debug.cpu.cpu_load[3=
].avg
>      36.12 =C2=B1 14%      -3.7%      34.79 =C2=B1 15%   +2413.4%     907=
.96 =C2=B1  2%   +2461.4%     925.29 =C2=B1  1%  sched_debug.cpu.cpu_load[3=
].max
>      12.38 =C2=B1 15%     +12.7%      13.95 =C2=B1  9%   +3985.2%     505=
.54 =C2=B1 25%   +4706.1%     594.75 =C2=B1  4%  sched_debug.cpu.cpu_load[3=
].min
>       3.72 =C2=B1 21%     -14.2%       3.19 =C2=B1 22%   +1887.6%      73=
.94 =C2=B1 37%   +1343.2%      53.69 =C2=B1 10%  sched_debug.cpu.cpu_load[3=
].stddev
>      17.12 =C2=B1  1%      -0.1%      17.10 =C2=B1  1%   +4478.8%     783=
.84 =C2=B1  2%   +4561.4%     797.98 =C2=B1  0%  sched_debug.cpu.cpu_load[4=
].avg
>      33.42 =C2=B1  2%      -2.6%      32.55 =C2=B1  7%   +2573.3%     893=
.33 =C2=B1  3%   +2633.2%     913.33 =C2=B1  1%  sched_debug.cpu.cpu_load[4=
].max
>      12.88 =C2=B1 12%     +10.4%      14.21 =C2=B1  7%   +3701.3%     489=
.42 =C2=B1 26%   +4365.7%     574.96 =C2=B1  6%  sched_debug.cpu.cpu_load[4=
].min
>       3.30 =C2=B1  5%     -12.2%       2.89 =C2=B1 14%   +2147.0%      74=
.10 =C2=B1 38%   +1571.6%      55.12 =C2=B1  9%  sched_debug.cpu.cpu_load[4=
].stddev
>       1722 =C2=B1 32%     +14.8%       1977 =C2=B1 39%     +50.3%       2=
588 =C2=B1 58%     +49.2%       2570 =C2=B1 17%  sched_debug.cpu.curr->pid.=
min
>      20.57 =C2=B1  7%      +5.1%      21.62 =C2=B1 27%  +4.1e+06%     835=
527 =C2=B1  2%  +4.1e+06%     847625 =C2=B1  0%  sched_debug.cpu.load.avg
>     169.12 =C2=B1 41%     +15.5%     195.38 =C2=B1117%  +6.1e+05%    1027=
133 =C2=B1  0%  +7.1e+05%    1200175 =C2=B1 14%  sched_debug.cpu.load.max
>      10.88 =C2=B1 25%     +13.2%      12.31 =C2=B1 12%  +4.6e+06%     500=
134 =C2=B1 62%  +5.8e+06%     625582 =C2=B1 11%  sched_debug.cpu.load.min
>      23.05 =C2=B1 44%     +17.7%      27.14 =C2=B1122%  +4.9e+05%     113=
672 =C2=B1 31%  +4.4e+05%     102223 =C2=B1 24%  sched_debug.cpu.load.stddev
>       0.00 =C2=B1  2%      +2.4%       0.00 =C2=B1  1%     +31.6%       0=
.00 =C2=B1 14%     +20.6%       0.00 =C2=B1 17%  sched_debug.cpu.next_balan=
ce.stddev
>       1623 =C2=B1  9%      +4.1%       1689 =C2=B1  8%     +74.5%       2=
831 =C2=B1  3%     +73.9%       2823 =C2=B1  7%  sched_debug.cpu.nr_load_up=
dates.stddev
>     159639 =C2=B1  1%     -11.5%     141259 =C2=B1  8%     -17.0%     132=
534 =C2=B1  1%     -15.7%     134652 =C2=B1  1%  sched_debug.cpu.nr_switche=
s.avg
>      11.79 =C2=B1 15%      +9.0%      12.86 =C2=B1 25%    +268.6%      43=
.46 =C2=B1 18%    +273.9%      44.08 =C2=B1 11%  sched_debug.cpu.nr_uninter=
ruptible.max
>     -16.00 =C2=B1-13%      -5.2%     -15.17 =C2=B1-22%    +337.5%     -70=
.00 =C2=B1-10%    +336.7%     -69.88 =C2=B1-26%  sched_debug.cpu.nr_uninter=
ruptible.min
>       5.10 =C2=B1  9%      -1.0%       5.05 =C2=B1  8%    +414.2%      26=
.25 =C2=B1 16%    +399.5%      25.50 =C2=B1 10%  sched_debug.cpu.nr_uninter=
ruptible.stddev
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       1=
.01 =C2=B1139%      +Inf%       6.56 =C2=B1 22%  perf-profile.cycles-pp.__a=
ccount_scheduler_latency.enqueue_entity.enqueue_task_fair.activate_task.ttw=
u_do_activate
>       0.00 =C2=B1 -1%      +Inf%       5.76 =C2=B1172%      +Inf%       5=
.79 =C2=B1122%      +Inf%      16.45 =C2=B1 16%  perf-profile.cycles-pp.__d=
o_page_fault.do_page_fault.page_fault
>       0.00 =C2=B1 -1%      +Inf%       1.58 =C2=B1162%      +Inf%       4=
.57 =C2=B1139%      +Inf%       3.30 =C2=B1 19%  perf-profile.cycles-pp.__h=
rtimer_run_queues.hrtimer_interrupt.local_apic_timer_interrupt.smp_apic_tim=
er_interrupt.apic_timer_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.93 =C2=B1158%      +Inf%       1=
.05 =C2=B1102%      +Inf%       3.13 =C2=B1 16%  perf-profile.cycles-pp.__k=
ernel_text_address.print_context_stack.dump_trace.save_stack_trace_tsk.__ac=
count_scheduler_latency
>       0.00 =C2=B1 -1%      +Inf%       0.40 =C2=B1159%      +Inf%       0=
.57 =C2=B1104%      +Inf%       1.18 =C2=B1  6%  perf-profile.cycles-pp.__s=
chedule.schedule.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCAL=
L_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       0.59 =C2=B1159%      +Inf%       0=
.83 =C2=B1100%      +Inf%       2.00 =C2=B1 23%  perf-profile.cycles-pp.__s=
chedule.schedule.pipe_wait.pipe_write.__vfs_write
>       0.00 =C2=B1 -1%      +Inf%       6.44 =C2=B1159%      +Inf%       8=
.27 =C2=B1108%      +Inf%      19.49 =C2=B1 11%  perf-profile.cycles-pp.__v=
fs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       3.43 =C2=B1158%      +Inf%       4=
.53 =C2=B1100%      +Inf%      11.07 =C2=B1 16%  perf-profile.cycles-pp.__v=
fs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       3.18 =C2=B1158%      +Inf%       3=
.39 =C2=B1102%      +Inf%       9.81 =C2=B1 22%  perf-profile.cycles-pp.__w=
ake_up_common.__wake_up_sync_key.pipe_read.__vfs_read.vfs_read
>       0.00 =C2=B1 -1%      +Inf%       3.24 =C2=B1158%      +Inf%       3=
.44 =C2=B1102%      +Inf%      10.05 =C2=B1 22%  perf-profile.cycles-pp.__w=
ake_up_sync_key.pipe_read.__vfs_read.vfs_read.sys_read
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       1=
.23 =C2=B1141%      +Inf%       8.04 =C2=B1 21%  perf-profile.cycles-pp.act=
ivate_task.ttwu_do_activate.try_to_wake_up.default_wake_function.autoremove=
_wake_function
>       0.00 =C2=B1 -1%      +Inf%       0.23 =C2=B1166%      +Inf%       0=
.34 =C2=B1104%      +Inf%       0.81 =C2=B1 27%  perf-profile.cycles-pp.ano=
n_pipe_buf_release.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
>       0.02 =C2=B1  0%  +10478.6%       2.12 =C2=B1162%  +31737.5%       6=
.37 =C2=B1138%  +22075.0%       4.43 =C2=B1 18%  perf-profile.cycles-pp.api=
c_timer_interrupt
>       0.00 =C2=B1 -1%      +Inf%       3.14 =C2=B1158%      +Inf%       3=
.38 =C2=B1102%      +Inf%       9.79 =C2=B1 22%  perf-profile.cycles-pp.aut=
oremove_wake_function.__wake_up_common.__wake_up_sync_key.pipe_read.__vfs_r=
ead
>       0.00 =C2=B1 -1%      +Inf%       0.24 =C2=B1159%      +Inf%       0=
.51 =C2=B1100%      +Inf%       1.00 =C2=B1 24%  perf-profile.cycles-pp.bit=
_cursor.fb_flashcursor.process_one_work.worker_thread.kthread
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       2=
.84 =C2=B1153%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.cal=
l_console_drivers.constprop.23.console_unlock.vprintk_emit.vprintk_default.=
printk
>      27.10 =C2=B1 20%     -53.0%      12.73 =C2=B1105%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.cal=
l_cpuidle
>       0.00 =C2=B1 -1%      +Inf%       4.85 =C2=B1181%      +Inf%      15=
.07 =C2=B1118%      +Inf%      29.07 =C2=B1  9%  perf-profile.cycles-pp.cal=
l_cpuidle.cpu_startup_entry.start_secondary
>       0.02 =C2=B1 19%   +5855.6%       1.34 =C2=B1175%   +5722.2%       1=
.31 =C2=B1107%  +14988.9%       3.40 =C2=B1  9%  perf-profile.cycles-pp.cal=
l_function_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.08 =C2=B1244%      +Inf%       2=
.84 =C2=B1153%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.con=
sole_unlock.vprintk_emit.vprintk_default.printk.perf_duration_warn
>       0.00 =C2=B1 -1%      +Inf%       2.23 =C2=B1182%      +Inf%       2=
.46 =C2=B1131%      +Inf%       6.55 =C2=B1 31%  perf-profile.cycles-pp.cop=
y_page.migrate_misplaced_transhuge_page.do_huge_pmd_numa_page.handle_mm_fau=
lt.__do_page_fault
>       0.00 =C2=B1 -1%      +Inf%       2.42 =C2=B1159%      +Inf%       3=
.04 =C2=B1100%      +Inf%       7.95 =C2=B1 16%  perf-profile.cycles-pp.cop=
y_page_from_iter.pipe_write.__vfs_write.vfs_write.sys_write
>       0.00 =C2=B1 -1%      +Inf%       0.35 =C2=B1160%      +Inf%       0=
.49 =C2=B1104%      +Inf%       0.98 =C2=B1 19%  perf-profile.cycles-pp.cop=
y_page_from_iter_iovec.copy_page_from_iter.pipe_write.__vfs_write.vfs_write
>       0.00 =C2=B1 -1%      +Inf%       2.25 =C2=B1163%      +Inf%       3=
.46 =C2=B1114%      +Inf%       6.78 =C2=B1 17%  perf-profile.cycles-pp.cop=
y_page_to_iter.pipe_read.__vfs_read.vfs_read.sys_read
>       0.00 =C2=B1 -1%      +Inf%       2.04 =C2=B1159%      +Inf%       2=
.55 =C2=B1101%      +Inf%       6.82 =C2=B1 16%  perf-profile.cycles-pp.cop=
y_user_enhanced_fast_string.copy_page_from_iter.pipe_write.__vfs_write.vfs_=
write
>       0.00 =C2=B1 -1%      +Inf%       2.02 =C2=B1160%      +Inf%       3=
.12 =C2=B1110%      +Inf%       6.31 =C2=B1 15%  perf-profile.cycles-pp.cop=
y_user_enhanced_fast_string.copy_page_to_iter.pipe_read.__vfs_read.vfs_read
>      28.68 =C2=B1 21%     -55.2%      12.84 =C2=B1105%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.cpu=
_startup_entry
>       0.00 =C2=B1 -1%      +Inf%       4.91 =C2=B1181%      +Inf%      15=
.14 =C2=B1118%      +Inf%      29.36 =C2=B1  8%  perf-profile.cycles-pp.cpu=
_startup_entry.start_secondary
>      27.10 =C2=B1 20%     -53.0%      12.73 =C2=B1105%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.cpu=
idle_enter
>       0.00 =C2=B1 -1%      +Inf%       4.85 =C2=B1181%      +Inf%      15=
.07 =C2=B1118%      +Inf%      29.07 =C2=B1  9%  perf-profile.cycles-pp.cpu=
idle_enter.call_cpuidle.cpu_startup_entry.start_secondary
>      26.95 =C2=B1 20%     -53.2%      12.62 =C2=B1105%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.cpu=
idle_enter_state
>       0.00 =C2=B1 -1%      +Inf%       4.79 =C2=B1181%      +Inf%      15=
.03 =C2=B1118%      +Inf%      28.79 =C2=B1  9%  perf-profile.cycles-pp.cpu=
idle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry.start_seconda=
ry
>       0.00 =C2=B1 -1%      +Inf%       0.34 =C2=B1158%      +Inf%       0=
.54 =C2=B1103%      +Inf%       1.14 =C2=B1 28%  perf-profile.cycles-pp.dea=
ctivate_task.__schedule.schedule.pipe_wait.pipe_write
>       0.00 =C2=B1 -1%      +Inf%       3.12 =C2=B1158%      +Inf%       3=
.37 =C2=B1102%      +Inf%       9.75 =C2=B1 22%  perf-profile.cycles-pp.def=
ault_wake_function.autoremove_wake_function.__wake_up_common.__wake_up_sync=
_key.pipe_read
>       0.00 =C2=B1 -1%      +Inf%       0.29 =C2=B1159%      +Inf%       0=
.41 =C2=B1100%      +Inf%       0.97 =C2=B1 30%  perf-profile.cycles-pp.deq=
ueue_task_fair.deactivate_task.__schedule.schedule.pipe_wait
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       0=
.16 =C2=B1173%      +Inf%       0.88 =C2=B1 39%  perf-profile.cycles-pp.do_=
execveat_common.isra.34.sys_execve.do_syscall_64.return_from_SYSCALL_64.exe=
cve
>       0.00 =C2=B1 -1%      +Inf%       2.92 =C2=B1179%      +Inf%       3=
.08 =C2=B1131%      +Inf%       8.56 =C2=B1 30%  perf-profile.cycles-pp.do_=
huge_pmd_numa_page.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>       0.00 =C2=B1 -1%      +Inf%       5.78 =C2=B1172%      +Inf%       5=
.81 =C2=B1122%      +Inf%      16.48 =C2=B1 16%  perf-profile.cycles-pp.do_=
page_fault.page_fault
>       0.00 =C2=B1 -1%      +Inf%       0.32 =C2=B1165%      +Inf%       0=
.17 =C2=B1173%      +Inf%       0.89 =C2=B1 39%  perf-profile.cycles-pp.do_=
syscall_64.return_from_SYSCALL_64.execve
>       0.00 =C2=B1 -1%      +Inf%       1.78 =C2=B1158%      +Inf%       0=
.96 =C2=B1141%      +Inf%       6.24 =C2=B1 22%  perf-profile.cycles-pp.dum=
p_trace.save_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enq=
ueue_task_fair
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       1=
.14 =C2=B1140%      +Inf%       7.53 =C2=B1 22%  perf-profile.cycles-pp.enq=
ueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       1=
.21 =C2=B1141%      +Inf%       7.86 =C2=B1 21%  perf-profile.cycles-pp.enq=
ueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.default_wake_f=
unction
>       0.02 =C2=B1  0%  +55407.1%      11.10 =C2=B1157%  +71087.5%      14=
.24 =C2=B1103%  +1.7e+05%      34.11 =C2=B1 11%  perf-profile.cycles-pp.ent=
ry_SYSCALL_64_fastpath
>       0.03 =C2=B1 47%   +1120.8%       0.34 =C2=B1155%    +509.1%       0=
.17 =C2=B1173%   +3127.3%       0.89 =C2=B1 39%  perf-profile.cycles-pp.exe=
cve
>       0.00 =C2=B1 -1%      +Inf%       0.47 =C2=B1160%      +Inf%       0=
.64 =C2=B1104%      +Inf%       1.35 =C2=B1  4%  perf-profile.cycles-pp.exi=
t_to_usermode_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       0.24 =C2=B1159%      +Inf%       0=
.56 =C2=B1101%      +Inf%       1.20 =C2=B1 28%  perf-profile.cycles-pp.fb_=
flashcursor.process_one_work.worker_thread.kthread.ret_from_fork
>       0.00 =C2=B1 -1%      +Inf%       0.94 =C2=B1179%      +Inf%       1=
.05 =C2=B1105%      +Inf%       2.70 =C2=B1 11%  perf-profile.cycles-pp.flu=
sh_smp_call_function_queue.generic_smp_call_function_single_interrupt.smp_c=
all_function_interrupt.call_function_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.39 =C2=B1180%      +Inf%       0=
.39 =C2=B1107%      +Inf%       1.25 =C2=B1 13%  perf-profile.cycles-pp.flu=
sh_tlb_func.flush_smp_call_function_queue.generic_smp_call_function_single_=
interrupt.smp_call_function_interrupt.call_function_interrupt
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       0=
.95 =C2=B1115%      +Inf%       2.86 =C2=B1 21%  perf-profile.cycles-pp.flu=
sh_tlb_page.ptep_clear_flush.try_to_unmap_one.rmap_walk_anon.rmap_walk
>       0.00 =C2=B1 -1%      +Inf%       1.12 =C2=B1177%      +Inf%       1=
.06 =C2=B1104%      +Inf%       2.79 =C2=B1 11%  perf-profile.cycles-pp.gen=
eric_smp_call_function_single_interrupt.smp_call_function_interrupt.call_fu=
nction_interrupt
>       0.00 =C2=B1 -1%      +Inf%       5.49 =C2=B1172%      +Inf%       5=
.56 =C2=B1123%      +Inf%      15.77 =C2=B1 17%  perf-profile.cycles-pp.han=
dle_mm_fault.__do_page_fault.do_page_fault.page_fault
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       2=
.08 =C2=B1112%      +Inf%       6.05 =C2=B1 16%  perf-profile.cycles-pp.han=
dle_pte_fault.handle_mm_fault.__do_page_fault.do_page_fault.page_fault
>       0.00 =C2=B1 -1%      +Inf%       1.79 =C2=B1163%      +Inf%       5=
.26 =C2=B1138%      +Inf%       3.69 =C2=B1 19%  perf-profile.cycles-pp.hrt=
imer_interrupt.local_apic_timer_interrupt.smp_apic_timer_interrupt.apic_tim=
er_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.32 =C2=B1159%      +Inf%       0=
.19 =C2=B1173%      +Inf%       0.91 =C2=B1 33%  perf-profile.cycles-pp.idl=
e_cpu.select_idle_sibling.select_task_rq_fair.try_to_wake_up.default_wake_f=
unction
>      24.41 =C2=B1 20%     -50.5%      12.09 =C2=B1104%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.int=
el_idle
>       0.00 =C2=B1 -1%      +Inf%       3.67 =C2=B1234%      +Inf%       4=
.27 =C2=B1165%      +Inf%      28.93 =C2=B1  9%  perf-profile.cycles-pp.int=
el_idle.cpuidle_enter_state.cpuidle_enter.call_cpuidle.cpu_startup_entry
>       0.11 =C2=B1100%     -25.2%       0.08 =C2=B1244%   +2352.4%       2=
.57 =C2=B1150%    +709.5%       0.85 =C2=B1 20%  perf-profile.cycles-pp.irq=
_work_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.08 =C2=B1244%      +Inf%       2=
.57 =C2=B1150%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.irq=
_work_run.smp_irq_work_interrupt.irq_work_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.08 =C2=B1244%      +Inf%       2=
.57 =C2=B1150%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.irq=
_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_work_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.37 =C2=B1160%      +Inf%       0=
.37 =C2=B1103%      +Inf%       1.33 =C2=B1 13%  perf-profile.cycles-pp.is_=
module_text_address.__kernel_text_address.print_context_stack.dump_trace.sa=
ve_stack_trace_tsk
>       0.00 =C2=B1 -1%      +Inf%       0.44 =C2=B1160%      +Inf%       0=
.85 =C2=B1100%      +Inf%       1.86 =C2=B1 14%  perf-profile.cycles-pp.kth=
read.ret_from_fork
>       0.00 =C2=B1 -1%      +Inf%       1.83 =C2=B1163%      +Inf%       5=
.35 =C2=B1138%      +Inf%       3.82 =C2=B1 19%  perf-profile.cycles-pp.loc=
al_apic_timer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.24 =C2=B1159%      +Inf%       0=
.47 =C2=B1100%      +Inf%       0.99 =C2=B1 25%  perf-profile.cycles-pp.mem=
cpy_erms.mga_imageblit.soft_cursor.bit_cursor.fb_flashcursor
>       0.00 =C2=B1 -1%      +Inf%       0.24 =C2=B1159%      +Inf%       0=
.51 =C2=B1100%      +Inf%       1.00 =C2=B1 24%  perf-profile.cycles-pp.mga=
_imageblit.soft_cursor.bit_cursor.fb_flashcursor.process_one_work
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       1=
.51 =C2=B1115%      +Inf%       4.33 =C2=B1 21%  perf-profile.cycles-pp.mig=
rate_misplaced_page.handle_pte_fault.handle_mm_fault.__do_page_fault.do_pag=
e_fault
>       0.00 =C2=B1 -1%      +Inf%       2.79 =C2=B1183%      +Inf%       3=
.05 =C2=B1132%      +Inf%       8.22 =C2=B1 30%  perf-profile.cycles-pp.mig=
rate_misplaced_transhuge_page.do_huge_pmd_numa_page.handle_mm_fault.__do_pa=
ge_fault.do_page_fault
>       0.00 =C2=B1 -1%      +Inf%       0.28 =C2=B1244%      +Inf%       0=
.33 =C2=B1173%      +Inf%       1.07 =C2=B1 26%  perf-profile.cycles-pp.mig=
rate_page_copy.migrate_misplaced_transhuge_page.do_huge_pmd_numa_page.handl=
e_mm_fault.__do_page_fault
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       1=
.23 =C2=B1116%      +Inf%       3.82 =C2=B1 20%  perf-profile.cycles-pp.mig=
rate_pages.migrate_misplaced_page.handle_pte_fault.handle_mm_fault.__do_pag=
e_fault
>       0.40 =C2=B1162%     -77.9%       0.09 =C2=B1154%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.mut=
ex_spin_on_owner.isra.4
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       0=
.94 =C2=B1116%      +Inf%       2.82 =C2=B1 20%  perf-profile.cycles-pp.nat=
ive_flush_tlb_others.flush_tlb_page.ptep_clear_flush.try_to_unmap_one.rmap_=
walk_anon
>       0.01 =C2=B1100%   +4914.3%       0.50 =C2=B1162%   +7425.0%       0=
.75 =C2=B1126%  +12500.0%       1.26 =C2=B1 17%  perf-profile.cycles-pp.nat=
ive_irq_return_iret
>       0.00 =C2=B1 -1%      +Inf%       0.44 =C2=B1188%      +Inf%       0=
.37 =C2=B1173%      +Inf%       1.20 =C2=B1 22%  perf-profile.cycles-pp.nat=
ive_send_call_func_ipi.smp_call_function_many.native_flush_tlb_others.flush=
_tlb_page.ptep_clear_flush
>       0.02 =C2=B1 19%  +25709.5%       5.81 =C2=B1171%  +25733.3%       5=
.81 =C2=B1122%  +73266.7%      16.51 =C2=B1 16%  perf-profile.cycles-pp.pag=
e_fault
>       0.00 =C2=B1 -1%      +Inf%       0.08 =C2=B1244%      +Inf%       2=
.57 =C2=B1150%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.per=
f_duration_warn.irq_work_run_list.irq_work_run.smp_irq_work_interrupt.irq_w=
ork_interrupt
>       0.50 =C2=B1104%      -6.2%       0.47 =C2=B1157%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.pip=
e_read
>       0.00 =C2=B1 -1%      +Inf%       6.10 =C2=B1159%      +Inf%       7=
.73 =C2=B1109%      +Inf%      18.29 =C2=B1 11%  perf-profile.cycles-pp.pip=
e_read.__vfs_read.vfs_read.sys_read.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       0.80 =C2=B1158%      +Inf%       1=
.03 =C2=B1100%      +Inf%       2.40 =C2=B1 24%  perf-profile.cycles-pp.pip=
e_wait.pipe_write.__vfs_write.vfs_write.sys_write
>       0.00 =C2=B1 -1%      +Inf%       3.41 =C2=B1158%      +Inf%       2=
.56 =C2=B1147%      +Inf%      11.80 =C2=B1 18%  perf-profile.cycles-pp.pip=
e_write.__vfs_write.vfs_write.sys_write.entry_SYSCALL_64_fastpath
>       2.49 =C2=B1 40%     -79.0%       0.52 =C2=B1151%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.pol=
l_idle
>       0.00 =C2=B1 -1%      +Inf%       1.69 =C2=B1158%      +Inf%       0=
.87 =C2=B1139%      +Inf%       5.77 =C2=B1 22%  perf-profile.cycles-pp.pri=
nt_context_stack.dump_trace.save_stack_trace_tsk.__account_scheduler_latenc=
y.enqueue_entity
>       0.00 =C2=B1 -1%      +Inf%       0.08 =C2=B1244%      +Inf%       2=
.57 =C2=B1150%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.pri=
ntk.perf_duration_warn.irq_work_run_list.irq_work_run.smp_irq_work_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.25 =C2=B1160%      +Inf%       0=
.60 =C2=B1100%      +Inf%       1.21 =C2=B1 27%  perf-profile.cycles-pp.pro=
cess_one_work.worker_thread.kthread.ret_from_fork
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       0=
.95 =C2=B1115%      +Inf%       2.87 =C2=B1 21%  perf-profile.cycles-pp.pte=
p_clear_flush.try_to_unmap_one.rmap_walk_anon.rmap_walk.try_to_unmap
>       0.02 =C2=B1  0%    +807.1%       0.18 =C2=B1209%   +1700.0%       0=
.36 =C2=B1102%   +4900.0%       1.00 =C2=B1 29%  perf-profile.cycles-pp.read
>       1.11 =C2=B1 61%     -97.6%       0.03 =C2=B1216%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.res=
t_init
>       0.02 =C2=B1 24%   +2479.6%       0.45 =C2=B1153%   +4742.9%       0=
.85 =C2=B1100%  +10542.9%       1.86 =C2=B1 14%  perf-profile.cycles-pp.ret=
_from_fork
>       0.00 =C2=B1 -1%      +Inf%       0.32 =C2=B1165%      +Inf%       0=
.17 =C2=B1173%      +Inf%       0.89 =C2=B1 39%  perf-profile.cycles-pp.ret=
urn_from_SYSCALL_64.execve
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       0=
.98 =C2=B1116%      +Inf%       2.97 =C2=B1 23%  perf-profile.cycles-pp.rma=
p_walk.try_to_unmap.migrate_pages.migrate_misplaced_page.handle_pte_fault
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       0=
.97 =C2=B1115%      +Inf%       2.97 =C2=B1 23%  perf-profile.cycles-pp.rma=
p_walk_anon.rmap_walk.try_to_unmap.migrate_pages.migrate_misplaced_page
>       0.00 =C2=B1 -1%      +Inf%       1.79 =C2=B1158%      +Inf%       0=
.97 =C2=B1139%      +Inf%       6.27 =C2=B1 22%  perf-profile.cycles-pp.sav=
e_stack_trace_tsk.__account_scheduler_latency.enqueue_entity.enqueue_task_f=
air.activate_task
>       0.00 =C2=B1 -1%      +Inf%       0.43 =C2=B1159%      +Inf%       0=
.61 =C2=B1103%      +Inf%       1.27 =C2=B1  3%  perf-profile.cycles-pp.sch=
edule.exit_to_usermode_loop.syscall_return_slowpath.entry_SYSCALL_64_fastpa=
th
>       0.00 =C2=B1 -1%      +Inf%       0.60 =C2=B1159%      +Inf%       0=
.88 =C2=B1100%      +Inf%       2.06 =C2=B1 22%  perf-profile.cycles-pp.sch=
edule.pipe_wait.pipe_write.__vfs_write.vfs_write
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       2=
.38 =C2=B1136%      +Inf%       1.74 =C2=B1 20%  perf-profile.cycles-pp.sch=
eduler_tick.update_process_times.tick_sched_handle.isra.17.tick_sched_timer=
.__hrtimer_run_queues
>       0.00 =C2=B1 -1%      +Inf%       0.42 =C2=B1159%      +Inf%       0=
.42 =C2=B1113%      +Inf%       1.28 =C2=B1 28%  perf-profile.cycles-pp.sel=
ect_idle_sibling.select_task_rq_fair.try_to_wake_up.default_wake_function.a=
utoremove_wake_function
>       0.00 =C2=B1 -1%      +Inf%       0.51 =C2=B1158%      +Inf%       0=
.53 =C2=B1109%      +Inf%       1.54 =C2=B1 27%  perf-profile.cycles-pp.sel=
ect_task_rq_fair.try_to_wake_up.default_wake_function.autoremove_wake_funct=
ion.__wake_up_common
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       2=
.69 =C2=B1152%      +Inf%       0.84 =C2=B1 19%  perf-profile.cycles-pp.ser=
ial8250_console_putchar.uart_console_write.serial8250_console_write.univ825=
0_console_write.call_console_drivers.constprop.23
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       2=
.69 =C2=B1152%      +Inf%       0.84 =C2=B1 19%  perf-profile.cycles-pp.ser=
ial8250_console_write.univ8250_console_write.call_console_drivers.constprop=
.23.console_unlock.vprintk_emit
>       0.00 =C2=B1 -1%      +Inf%       2.04 =C2=B1163%      +Inf%       6=
.27 =C2=B1138%      +Inf%       4.34 =C2=B1 18%  perf-profile.cycles-pp.smp=
_apic_timer_interrupt.apic_timer_interrupt
>       0.00 =C2=B1 -1%      +Inf%       1.28 =C2=B1178%      +Inf%       1=
.21 =C2=B1105%      +Inf%       3.17 =C2=B1  8%  perf-profile.cycles-pp.smp=
_call_function_interrupt.call_function_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.93 =C2=B1177%      +Inf%       0=
.94 =C2=B1116%      +Inf%       2.80 =C2=B1 19%  perf-profile.cycles-pp.smp=
_call_function_many.native_flush_tlb_others.flush_tlb_page.ptep_clear_flush=
.try_to_unmap_one
>       0.00 =C2=B1 -1%      +Inf%       0.08 =C2=B1244%      +Inf%       2=
.57 =C2=B1150%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.smp=
_irq_work_interrupt.irq_work_interrupt
>       0.00 =C2=B1 -1%      +Inf%       0.24 =C2=B1159%      +Inf%       0=
.51 =C2=B1100%      +Inf%       1.00 =C2=B1 24%  perf-profile.cycles-pp.sof=
t_cursor.bit_cursor.fb_flashcursor.process_one_work.worker_thread
>       1.11 =C2=B1 61%     -97.6%       0.03 =C2=B1216%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.sta=
rt_kernel
>       0.00 =C2=B1 -1%      +Inf%       0.32 =C2=B1165%      +Inf%       0=
.17 =C2=B1173%      +Inf%       0.89 =C2=B1 39%  perf-profile.cycles-pp.sys=
_execve.do_syscall_64.return_from_SYSCALL_64.execve
>       0.00 =C2=B1 -1%      +Inf%       6.82 =C2=B1159%      +Inf%       8=
.52 =C2=B1108%      +Inf%      20.43 =C2=B1 11%  perf-profile.cycles-pp.sys=
_read.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       3.45 =C2=B1158%      +Inf%       4=
.57 =C2=B1100%      +Inf%      11.18 =C2=B1 16%  perf-profile.cycles-pp.sys=
_write.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       0.49 =C2=B1159%      +Inf%       0=
.64 =C2=B1103%      +Inf%       1.44 =C2=B1  5%  perf-profile.cycles-pp.sys=
call_return_slowpath.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       1=
.70 =C2=B1141%      +Inf%       1.16 =C2=B1 25%  perf-profile.cycles-pp.tas=
k_tick_fair.scheduler_tick.update_process_times.tick_sched_handle.isra.17.t=
ick_sched_timer
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       3=
.39 =C2=B1134%      +Inf%       2.78 =C2=B1 22%  perf-profile.cycles-pp.tic=
k_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_queues.hrtimer_interr=
upt.local_apic_timer_interrupt
>       0.00 =C2=B1 -1%      +Inf%       1.35 =C2=B1162%      +Inf%       3=
.59 =C2=B1135%      +Inf%       2.89 =C2=B1 22%  perf-profile.cycles-pp.tic=
k_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.local_apic_timer_inter=
rupt.smp_apic_timer_interrupt
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       0=
.98 =C2=B1116%      +Inf%       3.00 =C2=B1 23%  perf-profile.cycles-pp.try=
_to_unmap.migrate_pages.migrate_misplaced_page.handle_pte_fault.handle_mm_f=
ault
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       0=
.95 =C2=B1115%      +Inf%       2.94 =C2=B1 23%  perf-profile.cycles-pp.try=
_to_unmap_one.rmap_walk_anon.rmap_walk.try_to_unmap.migrate_pages
>       0.00 =C2=B1 -1%      +Inf%       3.11 =C2=B1158%      +Inf%       1=
.66 =C2=B1143%      +Inf%      10.32 =C2=B1 21%  perf-profile.cycles-pp.try=
_to_wake_up.default_wake_function.autoremove_wake_function.__wake_up_common=
.__wake_up_sync_key
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       1=
.33 =C2=B1143%      +Inf%       8.29 =C2=B1 21%  perf-profile.cycles-pp.ttw=
u_do_activate.try_to_wake_up.default_wake_function.autoremove_wake_function=
.__wake_up_common
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       2=
.69 =C2=B1152%      +Inf%       0.84 =C2=B1 19%  perf-profile.cycles-pp.uar=
t_console_write.serial8250_console_write.univ8250_console_write.call_consol=
e_drivers.constprop.23.console_unlock
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       2=
.69 =C2=B1152%      +Inf%       0.84 =C2=B1 19%  perf-profile.cycles-pp.uni=
v8250_console_write.call_console_drivers.constprop.23.console_unlock.vprint=
k_emit.vprintk_default
>       0.00 =C2=B1 -1%      +NaN%       0.00 =C2=B1 -1%      +Inf%       3=
.30 =C2=B1133%      +Inf%       2.70 =C2=B1 22%  perf-profile.cycles-pp.upd=
ate_process_times.tick_sched_handle.isra.17.tick_sched_timer.__hrtimer_run_=
queues.hrtimer_interrupt
>       0.00 =C2=B1 -1%      +Inf%       6.74 =C2=B1159%      +Inf%       8=
.48 =C2=B1108%      +Inf%      20.19 =C2=B1 11%  perf-profile.cycles-pp.vfs=
_read.sys_read.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       3.45 =C2=B1158%      +Inf%       4=
.55 =C2=B1100%      +Inf%      11.15 =C2=B1 16%  perf-profile.cycles-pp.vfs=
_write.sys_write.entry_SYSCALL_64_fastpath
>       0.00 =C2=B1 -1%      +Inf%       0.08 =C2=B1244%      +Inf%       2=
.84 =C2=B1153%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.vpr=
intk_default.printk.perf_duration_warn.irq_work_run_list.irq_work_run
>       0.00 =C2=B1 -1%      +Inf%       0.08 =C2=B1244%      +Inf%       2=
.84 =C2=B1153%      +Inf%       0.85 =C2=B1 20%  perf-profile.cycles-pp.vpr=
intk_emit.vprintk_default.printk.perf_duration_warn.irq_work_run_list
>       0.00 =C2=B1 -1%      +Inf%       0.07 =C2=B1244%      +Inf%       2=
.59 =C2=B1152%      +Inf%       0.81 =C2=B1 19%  perf-profile.cycles-pp.wai=
t_for_xmitr.serial8250_console_putchar.uart_console_write.serial8250_consol=
e_write.univ8250_console_write
>       0.00 =C2=B1 -1%      +Inf%       0.25 =C2=B1160%      +Inf%       0=
.61 =C2=B1100%      +Inf%       1.23 =C2=B1 26%  perf-profile.cycles-pp.wor=
ker_thread.kthread.ret_from_fork
>       1.11 =C2=B1 61%     -85.6%       0.16 =C2=B1199%     -87.8%       0=
.14 =C2=B1173%     -85.8%       0.16 =C2=B1173%  perf-profile.cycles-pp.x86=
_64_start_kernel
>       1.11 =C2=B1 61%     -97.6%       0.03 =C2=B1216%    -100.0%       0=
.00 =C2=B1 -1%    -100.0%       0.00 =C2=B1 -1%  perf-profile.cycles-pp.x86=
_64_start_reservations

The main increases that stick out to me are in the read() from the
pipe (both in the copy as well as increased wakeups to the writer),
and increased NUMA balancing activity (page faults and migrations).

If NUMA balancing doesn't settle, the NUMA page faults can reduce
throughput of the single ruby script that writes input data to the
pixz pipe, which in turn will no longer saturate the 48 compression
threads and so explain the increased incidence of hitting an empty
pipe and issuing a wakeup.

But why would NUMA balancing be impacted after this patch? The only
place where NUMA balancing uses the watermark directly is to determine
whether it can migrate toward a specific node (and indirectly during
allocation of a huge page). But your NUMA nodes shouldn't be nearly
full: when I run pixz with 48 threads, it consumes ~600MB of memory.
Your nodes have 33G each. Surely, it should always find the free
memory to be plenty, even after the patch raised the watermarks? A
difference in THP success rate isn't indicated in stats, either.

To be sure, this is a minimal test system with nothing else running,
right?

Could you please collect periodic snapshots of /proc/zoneinfo while
the pixz test is running? Something like this would be great:

while sleep 1; do cat /proc/zoneinfo >> zoneinfo.log; done

(both on last good and first bad)

Thanks

--===============7672997831179034239==--

