Content-Type: multipart/mixed; boundary="===============6596120921848537165=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/fair] 6c8116c914: stress-ng.mmapfork.ops_per_sec -38.0% regression
Date: Fri, 24 Apr 2020 16:15:45 +0800
Message-ID: <74c86b02-bf93-db33-dbea-9b1934c3c9ab@linux.intel.com>
In-Reply-To: <20200421004749.GC26573@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6596120921848537165==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Tao,

    Do you have time to take a look at this? Thanks.

On 4/21/2020 8:47 AM, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a 56.4% improvement of stress-ng.fifo.ops_per_sec due to =
commit:
> =

> =

> commit: 6c8116c914b65be5e4d6f66d69c8142eb0648c22 ("sched/fair: Fix condit=
ion of avg_load calculation")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: stress-ng
> on test machine: 88 threads Intel(R) Xeon(R) CPU E5-2699 v4 @ 2.20GHz wit=
h 128G memory
> with following parameters:
> =

> 	nr_threads: 100%
> 	disk: 1HDD
> 	testtime: 1s
> 	class: scheduler
> 	cpufreq_governor: performance
> 	ucode: 0xb000038
> 	sc_pid_max: 4194304
> =

> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
-----------------+
> | testcase: change | stress-ng: stress-ng.mmapfork.ops_per_sec -19.2% reg=
ression          |
> | test machine     | 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz =
with 192G memory |
> | test parameters  | class=3Dvm                                          =
                   |
> |                  | cpufreq_governor=3Dperformance                      =
                   |
> |                  | disk=3D1HDD                                         =
                   |
> |                  | fs=3Dext4                                           =
                   |
> |                  | nr_threads=3D10%                                    =
                   |
> |                  | testtime=3D1s                                       =
                   |
> |                  | ucode=3D0x500002c                                   =
                   |
> +------------------+-----------------------------------------------------=
-----------------+
> =

> =

> =

> =

> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
> =

> =

> To reproduce:
> =

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install job.yaml  # job file is attached in this email
>          bin/lkp run     job.yaml
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/kconfig/nr_threads/rootfs/sc_pid_max=
/tbox_group/testcase/testtime/ucode:
>    scheduler/gcc-7/performance/1HDD/x86_64-rhel-7.6/100%/debian-x86_64-20=
191114.cgz/4194304/lkp-bdw-ep6/stress-ng/1s/0xb000038
> =

> commit:
>    e94f80f6c4 ("sched/rt: cpupri_find: Trigger a full search as fallback")
>    6c8116c914 ("sched/fair: Fix condition of avg_load calculation")
> =

> e94f80f6c4902000 6c8116c914b65be5e4d6f66d69c
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>             :4           25%           1:4     dmesg.WARNING:at#for_ip_in=
terrupt_entry/0x
>             :4           25%           1:4     dmesg.WARNING:at_ip___perf=
_sw_event/0x
>             :4           25%           1:4     dmesg.WARNING:at_ip__slab_=
free/0x
>           %stddev     %change         %stddev
>               \          |                \
>     3986602 =C2=B1 12%     +56.5%    6237290 =C2=B1 11%  stress-ng.fifo.o=
ps
>     3982065 =C2=B1 12%     +56.4%    6228889 =C2=B1 11%  stress-ng.fifo.o=
ps_per_sec
>       20066 =C2=B1  5%      -9.0%      18250 =C2=B1  5%  stress-ng.fork.o=
ps
>       20043 =C2=B1  5%      -9.0%      18239 =C2=B1  6%  stress-ng.fork.o=
ps_per_sec
>       29.08 =C2=B1  2%     -38.0%      18.01        stress-ng.mmapfork.op=
s_per_sec
>        2200            +3.8%       2284        stress-ng.time.system_time
>    19775571 =C2=B1 12%     +28.2%   25357609 =C2=B1  6%  numa-numastat.no=
de1.local_node
>    19843883 =C2=B1 12%     +28.1%   25427059 =C2=B1  6%  numa-numastat.no=
de1.numa_hit
>        4489 =C2=B1 15%     -21.5%       3523 =C2=B1  3%  sched_debug.cfs_=
rq:/.runnable_avg.max
>      929.25           -12.0%     818.19 =C2=B1  7%  sched_debug.cfs_rq:/.=
runnable_avg.stddev
>        1449 =C2=B1 26%     -25.8%       1075 =C2=B1  5%  sched_debug.cfs_=
rq:/.util_avg.max
>       28692            +9.2%      31327 =C2=B1  5%  softirqs.CPU44.TIMER
>       22999 =C2=B1  3%     +13.7%      26141 =C2=B1  6%  softirqs.CPU56.R=
CU
>       28464 =C2=B1  4%      +9.9%      31279 =C2=B1  6%  softirqs.CPU56.T=
IMER
>       30.25 =C2=B1  2%      -6.6%      28.25        vmstat.cpu.id
>       60.00            +4.6%      62.75        vmstat.cpu.sy
>     2526959 =C2=B1  3%     +69.1%    4273296 =C2=B1  2%  vmstat.memory.ca=
che
>      371.25 =C2=B1  9%     +27.1%     472.00 =C2=B1  5%  vmstat.procs.r
>       30.16 =C2=B1  3%      -6.0%      28.35 =C2=B1  2%  iostat.cpu.idle
>       60.99            +3.6%      63.22        iostat.cpu.system
>        8.39 =C2=B1  2%      -4.9%       7.98        iostat.cpu.user
>        3.10 =C2=B1173%    -100.0%       0.00        iostat.sdc.await.max
>        3.10 =C2=B1173%    -100.0%       0.00        iostat.sdc.r_await.max
>        1082 =C2=B1  9%     +11.4%       1206 =C2=B1  4%  slabinfo.kmalloc=
-128.active_slabs
>       34667 =C2=B1  9%     +11.3%      38602 =C2=B1  4%  slabinfo.kmalloc=
-128.num_objs
>        1082 =C2=B1  9%     +11.4%       1206 =C2=B1  4%  slabinfo.kmalloc=
-128.num_slabs
>      454.50 =C2=B1 11%     +21.0%     549.75 =C2=B1 22%  slabinfo.kmalloc=
-192.active_slabs
>       19110 =C2=B1 10%     +20.9%      23108 =C2=B1 22%  slabinfo.kmalloc=
-192.num_objs
>      454.50 =C2=B1 11%     +21.0%     549.75 =C2=B1 22%  slabinfo.kmalloc=
-192.num_slabs
>      106621            -7.8%      98257 =C2=B1  5%  slabinfo.kmalloc-32.a=
ctive_objs
>       37329 =C2=B1  3%     +20.6%      45034        slabinfo.radix_tree_n=
ode.active_objs
>      706.25 =C2=B1  3%     +24.5%     879.25        slabinfo.radix_tree_n=
ode.active_slabs
>       39573 =C2=B1  3%     +24.5%      49252        slabinfo.radix_tree_n=
ode.num_objs
>      706.25 =C2=B1  3%     +24.5%     879.25        slabinfo.radix_tree_n=
ode.num_slabs
>     1318829 =C2=B1  8%     +49.7%    1974635 =C2=B1 10%  meminfo.Active
>     1318549 =C2=B1  8%     +49.7%    1974352 =C2=B1 10%  meminfo.Active(a=
non)
>      723296 =C2=B1 17%     +41.1%    1020590 =C2=B1 15%  meminfo.AnonHuge=
Pages
>      905050 =C2=B1 11%     +40.9%    1274793 =C2=B1 16%  meminfo.AnonPages
>     2271966 =C2=B1  3%     +83.7%    4173221        meminfo.Cached
>    62076918 =C2=B1  3%     +12.6%   69917857 =C2=B1  5%  meminfo.Committe=
d_AS
>      815680 =C2=B1  7%    +198.4%    2434139 =C2=B1  2%  meminfo.Inactive
>      815324 =C2=B1  7%    +198.5%    2433786 =C2=B1  2%  meminfo.Inactive=
(anon)
>      840619 =C2=B1  7%    +192.4%    2457795 =C2=B1  2%  meminfo.Mapped
>     4535703 =C2=B1  4%     +51.0%    6849231 =C2=B1  3%  meminfo.Memused
>       66386 =C2=B1  5%     +20.2%      79763 =C2=B1  4%  meminfo.PageTabl=
es
>     1210719 =C2=B1  5%    +157.1%    3112278 =C2=B1  2%  meminfo.Shmem
>      509312 =C2=B1  6%     +75.4%     893498        meminfo.max_used_kB
>      323591 =C2=B1  5%     +48.3%     479732 =C2=B1 10%  proc-vmstat.nr_a=
ctive_anon
>      225088 =C2=B1  9%     +40.2%     315590 =C2=B1 14%  proc-vmstat.nr_a=
non_pages
>      362.50 =C2=B1 16%     +35.7%     492.00 =C2=B1 14%  proc-vmstat.nr_a=
non_transparent_hugepages
>     3164981            -1.8%    3108432        proc-vmstat.nr_dirty_backg=
round_threshold
>     6337701            -1.8%    6224466        proc-vmstat.nr_dirty_thres=
hold
>      562051 =C2=B1  3%     +82.2%    1023916 =C2=B1  2%  proc-vmstat.nr_f=
ile_pages
>    31851080            -1.8%   31284538        proc-vmstat.nr_free_pages
>      201936 =C2=B1  8%    +196.7%     599169 =C2=B1  3%  proc-vmstat.nr_i=
nactive_anon
>      208366 =C2=B1  8%    +190.5%     605371 =C2=B1  3%  proc-vmstat.nr_m=
apped
>       16350 =C2=B1  3%     +24.7%      20391 =C2=B1  7%  proc-vmstat.nr_p=
age_table_pages
>      296735 =C2=B1  6%    +155.7%     758662 =C2=B1  3%  proc-vmstat.nr_s=
hmem
>      323592 =C2=B1  5%     +48.3%     479731 =C2=B1 10%  proc-vmstat.nr_z=
one_active_anon
>      201936 =C2=B1  8%    +196.7%     599168 =C2=B1  3%  proc-vmstat.nr_z=
one_inactive_anon
>    14509555 =C2=B1  2%      +6.5%   15449984        proc-vmstat.pgactivate
>      565861 =C2=B1 54%     -93.7%      35832 =C2=B1 28%  numa-meminfo.nod=
e0.Inactive
>      565602 =C2=B1 54%     -93.7%      35573 =C2=B1 28%  numa-meminfo.nod=
e0.Inactive(anon)
>      583972 =C2=B1 52%     -91.4%      50225 =C2=B1 20%  numa-meminfo.nod=
e0.Mapped
>      627138 =C2=B1 20%    +131.7%    1453311 =C2=B1  9%  numa-meminfo.nod=
e1.Active
>      627070 =C2=B1 20%    +131.8%    1453285 =C2=B1  9%  numa-meminfo.nod=
e1.Active(anon)
>      327555 =C2=B1 17%    +109.1%     684899 =C2=B1  9%  numa-meminfo.nod=
e1.AnonHugePages
>      460420 =C2=B1 11%     +76.5%     812769 =C2=B1 16%  numa-meminfo.nod=
e1.AnonPages
>      968393 =C2=B1 45%    +265.8%    3542629 =C2=B1  3%  numa-meminfo.nod=
e1.FilePages
>      270293 =C2=B1115%    +784.7%    2391349 =C2=B1  3%  numa-meminfo.nod=
e1.Inactive
>      270196 =C2=B1116%    +785.0%    2391255 =C2=B1  3%  numa-meminfo.nod=
e1.Inactive(anon)
>       94282 =C2=B1  6%     +14.1%     107588 =C2=B1  4%  numa-meminfo.nod=
e1.KReclaimable
>      277310 =C2=B1113%    +765.8%    2401026 =C2=B1  2%  numa-meminfo.nod=
e1.Mapped
>     2101472 =C2=B1 20%    +143.0%    5106156 =C2=B1  3%  numa-meminfo.nod=
e1.MemUsed
>       30839 =C2=B1 14%     +75.9%      54240 =C2=B1  5%  numa-meminfo.nod=
e1.PageTables
>       94282 =C2=B1  6%     +14.1%     107588 =C2=B1  4%  numa-meminfo.nod=
e1.SReclaimable
>      428801 =C2=B1102%    +603.2%    3015356 =C2=B1  3%  numa-meminfo.nod=
e1.Shmem
>      319011 =C2=B1 32%     -53.5%     148357 =C2=B1  3%  numa-vmstat.node=
0.nr_file_pages
>      136650 =C2=B1 54%     -90.3%      13199 =C2=B1 47%  numa-vmstat.node=
0.nr_inactive_anon
>      141251 =C2=B1 52%     -88.0%      16942 =C2=B1 37%  numa-vmstat.node=
0.nr_mapped
>        9345 =C2=B1 15%     -29.0%       6638 =C2=B1  9%  numa-vmstat.node=
0.nr_page_table_pages
>      188582 =C2=B1 54%     -92.1%      14926 =C2=B1 42%  numa-vmstat.node=
0.nr_shmem
>      136645 =C2=B1 54%     -90.3%      13189 =C2=B1 47%  numa-vmstat.node=
0.nr_zone_inactive_anon
>    11178939 =C2=B1  9%     -17.1%    9271727 =C2=B1  7%  numa-vmstat.node=
0.numa_hit
>    10982245 =C2=B1  9%     -17.1%    9101421 =C2=B1  7%  numa-vmstat.node=
0.numa_local
>      158792 =C2=B1 23%    +130.0%     365220 =C2=B1 12%  numa-vmstat.node=
1.nr_active_anon
>      114790 =C2=B1 11%     +76.4%     202539 =C2=B1 17%  numa-vmstat.node=
1.nr_anon_pages
>      160.50 =C2=B1 19%    +107.3%     332.75 =C2=B1  9%  numa-vmstat.node=
1.nr_anon_transparent_hugepages
>      244507 =C2=B1 46%    +262.7%     886783 =C2=B1  2%  numa-vmstat.node=
1.nr_file_pages
>       68248 =C2=B1122%    +773.8%     596360        numa-vmstat.node1.nr_=
inactive_anon
>       70043 =C2=B1119%    +755.1%     598917        numa-vmstat.node1.nr_=
mapped
>        8117 =C2=B1 22%     +66.1%      13481 =C2=B1  3%  numa-vmstat.node=
1.nr_page_table_pages
>      109596 =C2=B1104%    +588.9%     754961 =C2=B1  3%  numa-vmstat.node=
1.nr_shmem
>       23655 =C2=B1  7%     +13.4%      26828 =C2=B1  4%  numa-vmstat.node=
1.nr_slab_reclaimable
>      158794 =C2=B1 23%    +130.0%     365223 =C2=B1 12%  numa-vmstat.node=
1.nr_zone_active_anon
>       68248 =C2=B1122%    +773.8%     596359        numa-vmstat.node1.nr_=
zone_inactive_anon
>    10597757 =C2=B1  6%     +31.0%   13877833 =C2=B1  2%  numa-vmstat.node=
1.numa_hit
>    10518704 =C2=B1  6%     +30.8%   13763501 =C2=B1  3%  numa-vmstat.node=
1.numa_local
>      130.75 =C2=B1 26%     -78.4%      28.25 =C2=B1 11%  interrupts.36:IR=
-PCI-MSI.1572867-edge.eth0-TxRx-2
>      454956 =C2=B1 13%     -45.1%     249594 =C2=B1 38%  interrupts.CPU14=
.LOC:Local_timer_interrupts
>       17625 =C2=B1 28%     +80.2%      31751 =C2=B1 37%  interrupts.CPU14=
.RES:Rescheduling_interrupts
>      130.75 =C2=B1 26%     -78.4%      28.25 =C2=B1 11%  interrupts.CPU15=
.36:IR-PCI-MSI.1572867-edge.eth0-TxRx-2
>      263948 =C2=B1 23%     -25.7%     196017 =C2=B1  2%  interrupts.CPU15=
.LOC:Local_timer_interrupts
>      425840 =C2=B1 19%     -53.7%     197051 =C2=B1  4%  interrupts.CPU17=
.LOC:Local_timer_interrupts
>       44187 =C2=B1 27%     -53.8%      20406 =C2=B1 39%  interrupts.CPU18=
.RES:Rescheduling_interrupts
>        2400 =C2=B1149%     -91.2%     211.50 =C2=B1143%  interrupts.CPU2.=
IWI:IRQ_work_interrupts
>      432176 =C2=B1 16%     -51.2%     211015 =C2=B1  9%  interrupts.CPU2.=
LOC:Local_timer_interrupts
>      444388 =C2=B1 20%     -44.4%     246924 =C2=B1 34%  interrupts.CPU20=
.LOC:Local_timer_interrupts
>        1763 =C2=B1 11%     +31.8%       2324 =C2=B1 13%  interrupts.CPU25=
.TLB:TLB_shootdowns
>      428063 =C2=B1  7%     -33.9%     282779 =C2=B1 33%  interrupts.CPU27=
.LOC:Local_timer_interrupts
>       19879 =C2=B1 66%     +94.7%      38706 =C2=B1 47%  interrupts.CPU29=
.RES:Rescheduling_interrupts
>        1459 =C2=B1 17%     +62.3%       2369 =C2=B1 22%  interrupts.CPU32=
.TLB:TLB_shootdowns
>        1593 =C2=B1 17%     +35.2%       2154 =C2=B1 15%  interrupts.CPU33=
.TLB:TLB_shootdowns
>        1388 =C2=B1 21%     +57.5%       2185 =C2=B1 19%  interrupts.CPU34=
.TLB:TLB_shootdowns
>       44877 =C2=B1 50%     -52.3%      21390 =C2=B1 19%  interrupts.CPU36=
.RES:Rescheduling_interrupts
>        6002 =C2=B1 35%     -34.7%       3920 =C2=B1  8%  interrupts.CPU37=
.CAL:Function_call_interrupts
>      519.00 =C2=B1159%     -95.2%      24.75 =C2=B1 51%  interrupts.CPU4.=
IWI:IRQ_work_interrupts
>      371753 =C2=B1 25%     -46.6%     198407 =C2=B1  6%  interrupts.CPU4.=
LOC:Local_timer_interrupts
>        1490 =C2=B1 19%     +42.9%       2130 =C2=B1  7%  interrupts.CPU41=
.TLB:TLB_shootdowns
>        6738 =C2=B1 41%     -34.0%       4449 =C2=B1 19%  interrupts.CPU45=
.CAL:Function_call_interrupts
>        1145 =C2=B1124%     -82.6%     199.25 =C2=B1153%  interrupts.CPU46=
.IWI:IRQ_work_interrupts
>      275.75 =C2=B1141%     -94.2%      16.00 =C2=B1 84%  interrupts.CPU48=
.IWI:IRQ_work_interrupts
>      310.00 =C2=B1134%     -93.1%      21.25 =C2=B1103%  interrupts.CPU49=
.IWI:IRQ_work_interrupts
>      463385 =C2=B1  3%     -57.3%     197853 =C2=B1  6%  interrupts.CPU49=
.LOC:Local_timer_interrupts
>        7206 =C2=B1 33%     -36.7%       4558 =C2=B1 10%  interrupts.CPU5.=
CAL:Function_call_interrupts
>      264579 =C2=B1 13%     -24.5%     199834 =C2=B1  2%  interrupts.CPU5.=
LOC:Local_timer_interrupts
>        5463 =C2=B1 14%     -26.3%       4025 =C2=B1 11%  interrupts.CPU50=
.CAL:Function_call_interrupts
>        7063 =C2=B1 31%     -41.3%       4147 =C2=B1 13%  interrupts.CPU54=
.CAL:Function_call_interrupts
>      287711 =C2=B1 25%     -31.7%     196499 =C2=B1  6%  interrupts.CPU55=
.LOC:Local_timer_interrupts
>      415854 =C2=B1  8%     -41.4%     243719 =C2=B1 33%  interrupts.CPU57=
.LOC:Local_timer_interrupts
>      324710 =C2=B1 32%     -38.3%     200427 =C2=B1 11%  interrupts.CPU6.=
LOC:Local_timer_interrupts
>      343106 =C2=B1 32%     -27.0%     250512 =C2=B1 35%  interrupts.CPU61=
.LOC:Local_timer_interrupts
>      395834 =C2=B1 19%     -49.0%     201844 =C2=B1 17%  interrupts.CPU63=
.LOC:Local_timer_interrupts
>      483611 =C2=B1 24%     -48.4%     249593 =C2=B1 31%  interrupts.CPU64=
.LOC:Local_timer_interrupts
>        1885 =C2=B1 13%     +37.5%       2591 =C2=B1 23%  interrupts.CPU69=
.TLB:TLB_shootdowns
>      382720 =C2=B1 33%     -38.5%     235483 =C2=B1 34%  interrupts.CPU7.=
LOC:Local_timer_interrupts
>        1437 =C2=B1 11%     +37.1%       1970 =C2=B1 16%  interrupts.CPU70=
.TLB:TLB_shootdowns
>        3844 =C2=B1 34%     +64.2%       6312 =C2=B1  2%  interrupts.CPU71=
.NMI:Non-maskable_interrupts
>        3844 =C2=B1 34%     +64.2%       6312 =C2=B1  2%  interrupts.CPU71=
.PMI:Performance_monitoring_interrupts
>       54451 =C2=B1 37%     -65.6%      18725 =C2=B1 51%  interrupts.CPU71=
.RES:Rescheduling_interrupts
>        1710 =C2=B1  6%     +27.2%       2176 =C2=B1 10%  interrupts.CPU72=
.TLB:TLB_shootdowns
>      350141 =C2=B1 20%     -32.6%     236073 =C2=B1 29%  interrupts.CPU74=
.LOC:Local_timer_interrupts
>        1172 =C2=B1 18%     +80.1%       2112 =C2=B1 10%  interrupts.CPU76=
.TLB:TLB_shootdowns
>       59169 =C2=B1 36%     -56.0%      26026 =C2=B1 56%  interrupts.CPU84=
.RES:Rescheduling_interrupts
>      409027 =C2=B1 39%     -41.4%     239528 =C2=B1 25%  interrupts.CPU86=
.LOC:Local_timer_interrupts
>        1543 =C2=B1 14%     +24.6%       1922 =C2=B1  9%  interrupts.CPU86=
.TLB:TLB_shootdowns
>        8.71 =C2=B1  7%      -3.8        4.92 =C2=B1 23%  perf-profile.cal=
ltrace.cycles-pp.__wake_up_common_lock.pipe_write.new_sync_write.vfs_write.=
ksys_write
>        8.66 =C2=B1  7%      -3.8        4.89 =C2=B1 23%  perf-profile.cal=
ltrace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_write.new_sync=
_write.vfs_write
>        8.61 =C2=B1  7%      -3.8        4.84 =C2=B1 23%  perf-profile.cal=
ltrace.cycles-pp.pollwake.__wake_up_common.__wake_up_common_lock.pipe_write=
.new_sync_write
>        8.60 =C2=B1  7%      -3.8        4.83 =C2=B1 23%  perf-profile.cal=
ltrace.cycles-pp.try_to_wake_up.pollwake.__wake_up_common.__wake_up_common_=
lock.pipe_write
>       10.58 =C2=B1  4%      -3.7        6.87 =C2=B1 17%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock_irqsave.__account_scheduler_latency.enqueue=
_entity.enqueue_task_fair.activate_task
>       10.46 =C2=B1  5%      -3.7        6.77 =C2=B1 17%  perf-profile.cal=
ltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__=
account_scheduler_latency.enqueue_entity.enqueue_task_fair
>       11.46 =C2=B1  4%      -3.6        7.81 =C2=B1 14%  perf-profile.cal=
ltrace.cycles-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fa=
ir.activate_task.ttwu_do_activate
>       11.71 =C2=B1  4%      -3.6        8.07 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_act=
ivate.try_to_wake_up
>        8.92 =C2=B1  7%      -3.6        5.31 =C2=B1 22%  perf-profile.cal=
ltrace.cycles-pp.pipe_write.new_sync_write.vfs_write.ksys_write.do_syscall_=
64
>        9.02 =C2=B1  7%      -3.6        5.42 =C2=B1 22%  perf-profile.cal=
ltrace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>        7.95 =C2=B1  6%      -3.6        4.36 =C2=B1 23%  perf-profile.cal=
ltrace.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.pollwake.__w=
ake_up_common
>        7.95 =C2=B1  6%      -3.6        4.36 =C2=B1 23%  perf-profile.cal=
ltrace.cycles-pp.ttwu_do_activate.try_to_wake_up.pollwake.__wake_up_common.=
__wake_up_common_lock
>        7.94 =C2=B1  6%      -3.6        4.36 =C2=B1 23%  perf-profile.cal=
ltrace.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wa=
ke_up.pollwake
>       14.89 =C2=B1  4%      -3.6       11.31 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.__GI___libc_write
>       14.94 =C2=B1  4%      -3.6       11.37 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__=
GI___libc_write
>       15.40 =C2=B1  3%      -3.4       12.01 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___libc_w=
rite
>       15.42 =C2=B1  3%      -3.4       12.04 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__GI___libc_write
>       15.70 =C2=B1  3%      -3.3       12.39 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp.__GI___libc_write
>        4.89 =C2=B1 13%      -2.0        2.94 =C2=B1 25%  perf-profile.cal=
ltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.fsnotify_a=
dd_event.fanotify_handle_event.fsnotify
>        1.67 =C2=B1 23%      -0.6        1.11 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock.fsnotify_add_event.fanotify_handle_event.fs=
notify.do_sys_openat2
>        1.98 =C2=B1  8%      -0.5        1.50 =C2=B1 10%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock.fsnotify_add_event.fanotify_handle_event.fs=
notify.__fput
>        2.54 =C2=B1  3%      -0.4        2.14 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.fsnotify_add_event.fanotify_handle_event.fsnotify.__fput.t=
ask_work_run
>        0.66 =C2=B1  9%      -0.4        0.27 =C2=B1100%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock.fsnotify_add_event.fanotify_handle_event.fs=
notify.vfs_read
>        2.84            -0.3        2.55 =C2=B1  6%  perf-profile.calltrac=
e.cycles-pp.fsnotify_add_event.fanotify_handle_event.fsnotify.do_sys_openat=
2.do_sys_open
>        2.83 =C2=B1  2%      -0.3        2.56 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.fanotify_handle_event.fsnotify.__fput.task_work_run.exit_t=
o_usermode_loop
>        0.69 =C2=B1  5%      -0.3        0.43 =C2=B1 58%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock.fsnotify_add_event.fanotify_handle_event.fs=
notify.vfs_write
>        2.91 =C2=B1  2%      -0.3        2.65 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.fsnotify.__fput.task_work_run.exit_to_usermode_loop.do_sys=
call_64
>        7.23            -0.2        6.99        perf-profile.calltrace.cyc=
les-pp.__fput.task_work_run.exit_to_usermode_loop.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
>        3.10            -0.2        2.90 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.fanotify_handle_event.fsnotify.do_sys_openat2.do_sys_open.do_sy=
scall_64
>        0.94 =C2=B1  8%      -0.1        0.80 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.pagevec_lru_move_fn.lru_add_drain_cpu.lru_add_drain.unmap_=
region.__do_munmap
>        0.95 =C2=B1  8%      -0.1        0.82 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.lru_add_drain_cpu.lru_add_drain.unmap_region.__do_munmap._=
_vm_munmap
>        0.77 =C2=B1 10%      -0.1        0.64 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.pa=
gevec_lru_move_fn.lru_add_drain_cpu.lru_add_drain
>        0.79 =C2=B1 10%      -0.1        0.66 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock_irqsave.pagevec_lru_move_fn.lru_add_drain_c=
pu.lru_add_drain.unmap_region
>        0.95 =C2=B1  8%      -0.1        0.82 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.lru_add_drain.unmap_region.__do_munmap.__vm_munmap.__x64_s=
ys_munmap
>        0.87 =C2=B1  3%      -0.1        0.75 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.fsnotify_add_event.fanotify_handle_event.fsnotify.vfs_read=
.ksys_read
>        0.85 =C2=B1  3%      -0.1        0.74 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.fsnotify_add_event.fanotify_handle_event.fsnotify.vfs_writ=
e.ksys_write
>        1.25 =C2=B1  6%      -0.1        1.14 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_s=
yscall_64
>        4.21            -0.1        4.10        perf-profile.calltrace.cyc=
les-pp.task_work_run.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.__GI___libc_close
>        4.27            -0.1        4.16        perf-profile.calltrace.cyc=
les-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwframe._=
_GI___libc_close
>        1.35 =C2=B1  5%      -0.1        1.25 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.munmap
>        1.33 =C2=B1  5%      -0.1        1.23 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
>        1.34 =C2=B1  5%      -0.1        1.24 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.munmap
>        1.85            -0.1        1.75 =C2=B1  4%  perf-profile.calltrac=
e.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.seconda=
ry_startup_64
>        0.97 =C2=B1  2%      -0.1        0.89 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.fanotify_handle_event.fsnotify.vfs_read.ksys_read.do_sysca=
ll_64
>        1.02 =C2=B1  2%      -0.1        0.96 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.fsnotify.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>        0.86 =C2=B1  8%      +0.1        0.96 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.copy_page_range.dup_mm.copy_process._do_fork.__x64_sys_clo=
ne
>        0.85 =C2=B1  7%      +0.1        0.95 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.copy_p4d_range.copy_page_range.dup_mm.copy_process._do_fork
>        0.66 =C2=B1  5%      +0.1        0.79 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.apparmor_file_alloc_security.security_file_alloc.__alloc_f=
ile.alloc_empty_file.dentry_open
>        0.69 =C2=B1  4%      +0.1        0.82 =C2=B1 11%  perf-profile.cal=
ltrace.cycles-pp.security_file_alloc.__alloc_file.alloc_empty_file.dentry_o=
pen.fanotify_read
>        0.67 =C2=B1  4%      +0.1        0.81 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp.apparmor_file_free_security.security_file_free.__fput.task=
_work_run.exit_to_usermode_loop
>        0.68 =C2=B1  5%      +0.1        0.82 =C2=B1 12%  perf-profile.cal=
ltrace.cycles-pp.security_file_free.__fput.task_work_run.exit_to_usermode_l=
oop.do_syscall_64
>        0.30 =C2=B1100%      +0.4        0.67 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.fanotify_merge.fsnotify_add_event.fanotify_handle_event.fs=
notify.do_sys_openat2
>        5.06 =C2=B1  3%      +0.5        5.55 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.__GI___libc_read
>        5.11 =C2=B1  3%      +0.5        5.60 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__G=
I___libc_read
>        5.53 =C2=B1  3%      +0.7        6.22 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___libc_r=
ead
>        5.55 =C2=B1  3%      +0.7        6.24 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.__GI___libc_read
>        5.87 =C2=B1  3%      +0.8        6.66 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__GI___libc_read
>        2.06            +2.0        4.05 =C2=B1 71%  perf-profile.calltrac=
e.cycles-pp.page_fault
>        2.00            +2.0        3.99 =C2=B1 72%  perf-profile.calltrac=
e.cycles-pp.do_page_fault.page_fault
>        1.72            +2.0        3.73 =C2=B1 78%  perf-profile.calltrac=
e.cycles-pp.__handle_mm_fault.handle_mm_fault.do_page_fault.page_fault
>        1.77            +2.0        3.78 =C2=B1 77%  perf-profile.calltrac=
e.cycles-pp.handle_mm_fault.do_page_fault.page_fault
>       30.85 =C2=B1  2%      -5.8       25.06 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.native_queued_spin_lock_slowpath
>       16.38 =C2=B1  4%      -4.0       12.35 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.try_to_wake_up
>       14.81 =C2=B1  3%      -3.9       10.96 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock_irqsave
>        9.39 =C2=B1  6%      -3.8        5.57 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.__wake_up_common_lock
>        8.72 =C2=B1  7%      -3.8        4.90 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.pollwake
>       13.03 =C2=B1  4%      -3.8        9.24 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.enqueue_task_fair
>       13.03 =C2=B1  4%      -3.8        9.26 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.ttwu_do_activate
>       13.05 =C2=B1  4%      -3.8        9.28 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.activate_task
>       12.34 =C2=B1  4%      -3.8        8.58 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.__account_scheduler_latency
>       12.75 =C2=B1  4%      -3.7        9.00 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.enqueue_entity
>       13.76 =C2=B1  4%      -3.7       10.04 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.__wake_up_common
>        8.93 =C2=B1  7%      -3.6        5.31 =C2=B1 22%  perf-profile.chi=
ldren.cycles-pp.pipe_write
>        9.30 =C2=B1  6%      -3.6        5.72 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.new_sync_write
>       15.09 =C2=B1  3%      -3.5       11.57 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.ksys_write
>       15.26 =C2=B1  3%      -3.5       11.75 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.vfs_write
>       15.80 =C2=B1  3%      -3.3       12.55 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__GI___libc_write
>       77.73            -3.0       74.69 =C2=B1  4%  perf-profile.children=
.cycles-pp.do_syscall_64
>       77.85            -3.0       74.83 =C2=B1  4%  perf-profile.children=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>       17.37 =C2=B1  4%      -1.7       15.68 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock
>        6.95 =C2=B1  5%      -1.2        5.79 =C2=B1 26%  perf-profile.chi=
ldren.cycles-pp.rwsem_down_write_slowpath
>        6.87 =C2=B1  5%      -1.2        5.71 =C2=B1 26%  perf-profile.chi=
ldren.cycles-pp.rwsem_optimistic_spin
>        7.29 =C2=B1  2%      -1.0        6.33 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.fsnotify_add_event
>        8.05            -0.6        7.42 =C2=B1  4%  perf-profile.children=
.cycles-pp.fanotify_handle_event
>        8.41            -0.6        7.84 =C2=B1  4%  perf-profile.children=
.cycles-pp.fsnotify
>        7.33            -0.3        7.08        perf-profile.children.cycl=
es-pp.__fput
>        7.76            -0.2        7.51        perf-profile.children.cycl=
es-pp.exit_to_usermode_loop
>        1.01 =C2=B1  7%      -0.1        0.88 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.lru_add_drain
>        0.96 =C2=B1  7%      -0.1        0.83 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__pagevec_release
>        1.03 =C2=B1  7%      -0.1        0.91 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.lru_add_drain_cpu
>        1.02 =C2=B1  7%      -0.1        0.90 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.pagevec_lru_move_fn
>        1.46 =C2=B1  6%      -0.1        1.35 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.unmap_region
>        1.87            -0.1        1.78 =C2=B1  4%  perf-profile.children=
.cycles-pp.schedule_idle
>        1.49 =C2=B1  5%      -0.1        1.40        perf-profile.children=
.cycles-pp.__x64_sys_munmap
>        0.58 =C2=B1 11%      -0.1        0.52 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.load_balance
>        0.60 =C2=B1  5%      -0.1        0.54 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.truncate_inode_pages_range
>        0.11 =C2=B1  3%      -0.0        0.10 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.seq_show
>        0.11 =C2=B1  3%      -0.0        0.10 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.seq_printf
>        0.11            -0.0        0.10 =C2=B1  4%  perf-profile.children=
.cycles-pp.seq_vprintf
>        0.09 =C2=B1  4%      +0.0        0.11 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.__check_object_size
>        0.09 =C2=B1  4%      +0.0        0.11 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.current_time
>        0.25 =C2=B1  2%      +0.0        0.27 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.update_process_times
>        0.29 =C2=B1  4%      +0.0        0.31 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.generic_file_write_iter
>        0.31 =C2=B1  3%      +0.0        0.33        perf-profile.children=
.cycles-pp.new_inode_pseudo
>        0.18 =C2=B1  5%      +0.0        0.21 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.__might_sleep
>        0.34 =C2=B1  4%      +0.0        0.38 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.do_wp_page
>        0.01 =C2=B1173%      +0.0        0.06 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.icmp_sk_exit
>        0.30 =C2=B1  4%      +0.0        0.35 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.wp_page_copy
>        0.22 =C2=B1  3%      +0.0        0.27 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.fput_many
>        0.60 =C2=B1  5%      +0.1        0.66 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.rcu_core
>        0.23 =C2=B1  4%      +0.1        0.28 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.__pte_alloc
>        0.45 =C2=B1  6%      +0.1        0.51 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.pte_alloc_one
>        0.23 =C2=B1 12%      +0.1        0.29 =C2=B1 16%  perf-profile.chi=
ldren.cycles-pp.cleanup_net
>        0.42 =C2=B1  6%      +0.1        0.48 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.prep_new_page
>        0.39 =C2=B1  6%      +0.1        0.45 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.memset_erms
>        0.76 =C2=B1  2%      +0.1        0.83 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.kmem_cache_alloc
>        0.23 =C2=B1 19%      +0.1        0.31        perf-profile.children=
.cycles-pp.path_put
>        0.73 =C2=B1  3%      +0.1        0.81 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__softirqentry_text_start
>        0.22 =C2=B1 13%      +0.1        0.32 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.put_pid
>        0.47 =C2=B1  8%      +0.1        0.57 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.___might_sleep
>        0.68 =C2=B1  4%      +0.1        0.79 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.get_page_from_freelist
>        0.76 =C2=B1  4%      +0.1        0.87 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__alloc_pages_nodemask
>        0.35 =C2=B1  4%      +0.1        0.48 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.fanotify_alloc_event
>        0.79 =C2=B1  4%      +0.1        0.92 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.apparmor_file_alloc_security
>        0.86 =C2=B1  3%      +0.1        0.99 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.security_file_alloc
>        1.30 =C2=B1  3%      +0.1        1.45 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.__alloc_file
>        0.85 =C2=B1  6%      +0.1        1.00 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.syscall_return_via_sysret
>        0.73 =C2=B1  4%      +0.1        0.88 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.security_file_free
>        0.72 =C2=B1  4%      +0.2        0.87 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.apparmor_file_free_security
>        1.32 =C2=B1  3%      +0.2        1.47 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.alloc_empty_file
>        1.29 =C2=B1  5%      +0.2        1.45 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.copy_page_range
>        1.26 =C2=B1  4%      +0.2        1.41 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.copy_p4d_range
>        0.46 =C2=B1 17%      +0.2        0.64 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.fanotify_free_event
>        1.45 =C2=B1 24%      +0.4        1.90 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.fanotify_merge
>        5.23 =C2=B1  2%      +0.5        5.70 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.vfs_read
>        5.24 =C2=B1  2%      +0.5        5.72 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.ksys_read
>        5.90 =C2=B1  3%      +0.8        6.69 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__GI___libc_read
>        2.83 =C2=B1  2%      +2.0        4.79 =C2=B1 59%  perf-profile.chi=
ldren.cycles-pp.page_fault
>        2.69 =C2=B1  2%      +2.0        4.66 =C2=B1 61%  perf-profile.chi=
ldren.cycles-pp.do_page_fault
>       30.71            -5.8       24.94 =C2=B1  4%  perf-profile.self.cyc=
les-pp.native_queued_spin_lock_slowpath
>        0.09            +0.0        0.11 =C2=B1 12%  perf-profile.self.cyc=
les-pp.vma_interval_tree_remove
>        0.10            +0.0        0.12 =C2=B1 13%  perf-profile.self.cyc=
les-pp.__rb_insert_augmented
>        0.13 =C2=B1  5%      +0.0        0.15 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.entry_SYSCALL_64_after_hwframe
>        0.15 =C2=B1  4%      +0.0        0.18 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.fput_many
>        0.28            +0.0        0.32 =C2=B1  3%  perf-profile.self.cyc=
les-pp.kmem_cache_alloc
>        0.14 =C2=B1  9%      +0.0        0.19 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.fanotify_alloc_event
>        0.19 =C2=B1  3%      +0.0        0.24 =C2=B1 21%  perf-profile.sel=
f.cycles-pp.anon_vma_clone
>        0.31 =C2=B1 10%      +0.1        0.37 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.fsnotify
>        0.38 =C2=B1  7%      +0.1        0.43        perf-profile.self.cyc=
les-pp.memset_erms
>        0.21 =C2=B1 13%      +0.1        0.30 =C2=B1 14%  perf-profile.sel=
f.cycles-pp.put_pid
>        0.68 =C2=B1  5%      +0.1        0.78 =C2=B1  5%  perf-profile.sel=
f.cycles-pp._raw_spin_lock_irqsave
>        0.45 =C2=B1  8%      +0.1        0.55 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.___might_sleep
>        0.77 =C2=B1  4%      +0.1        0.89 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.apparmor_file_alloc_security
>        0.99 =C2=B1  4%      +0.1        1.12 =C2=B1  2%  perf-profile.sel=
f.cycles-pp._raw_spin_lock
>        0.85 =C2=B1  6%      +0.1        1.00 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.syscall_return_via_sysret
>        0.71 =C2=B1  4%      +0.1        0.86 =C2=B1 11%  perf-profile.sel=
f.cycles-pp.apparmor_file_free_security
>        1.44 =C2=B1 23%      +0.4        1.88 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.fanotify_merge
> =

> =

>                                                                          =
        =

>                           stress-ng.mmapfork.ops_per_sec
>                                                                          =
        =

>    36 +------------------------------------------------------------------=
----+
>    34 |-+      +                                                         =
    |
>       |       + :             +..           +     +                      =
    |
>    32 |..+.. +  :            +             : :   : :    +..+..           =
    |
>    30 |-+   +    :          +    +..  .+.. :  :  :  :  +              .+.=
.   |
>       |          :  .+..  .+        +.    +   : :   : +       +..+..+.   =
 +..|
>    28 |-+         +.    +.                     +     +                   =
    |
>    26 |-+                                                                =
    |
>    24 |-+                                                                =
    |
>       |                                                                  =
    |
>    22 |-+                                                                =
    |
>    20 |-+               O                                                =
    |
>       |  O  O  O  O  O                    O O  O  O  O     O     O       =
    |
>    18 |-+                  O  O  O  O  O                O     O          =
    |
>    16 +------------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
        =

> [*] bisect-good sample
> [O] bisect-bad  sample
> =

> *************************************************************************=
**************************
> lkp-csl-2sp5: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with 19=
2G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/testcase/testtime/ucode:
>    vm/gcc-7/performance/1HDD/ext4/x86_64-rhel-7.6/10%/debian-x86_64-20191=
114.cgz/lkp-csl-2sp5/stress-ng/1s/0x500002c
> =

> commit:
>    e94f80f6c4 ("sched/rt: cpupri_find: Trigger a full search as fallback")
>    6c8116c914 ("sched/fair: Fix condition of avg_load calculation")
> =

> e94f80f6c4902000 6c8116c914b65be5e4d6f66d69c
> ---------------- ---------------------------
>         fail:runs  %reproduction    fail:runs
>             |             |             |
>             :4           50%           2:4     dmesg.WARNING:at_ip_native=
_sched_clock/0x
>            1:4          -25%            :4     kmsg.Memory_failure:#:reco=
very_action_for_clean_LRU_page:Recovered
>             :4           25%           1:4     kmsg.Memory_failure:#:reco=
very_action_for_high-order_kernel_page:Ignored
>            1:4          -25%            :4     kmsg.Memory_failure:#:reco=
very_action_for_reserved_kernel_page:Failed
>            1:4          -25%            :4     kmsg.Memory_failure:#:rese=
rved_kernel_page_still_referenced_by#users
>            0:4           15%           1:4     perf-profile.calltrace.cyc=
les-pp.error_entry
>            2:4           -9%           1:4     perf-profile.children.cycl=
es-pp.error_entry
>            0:4           -2%           0:4     perf-profile.self.cycles-p=
p.error_entry
>           %stddev     %change         %stddev
>               \          |                \
>        1.45 =C2=B1  4%     -19.2%       1.17        stress-ng.mmapfork.op=
s_per_sec
>       34.69            +3.8%      36.02        stress-ng.time.elapsed_time
>       34.69            +3.8%      36.02        stress-ng.time.elapsed_tim=
e.max
>       25456 =C2=B1  3%     +61.0%      40992        stress-ng.time.involu=
ntary_context_switches
>    48979390            -1.7%   48167776        stress-ng.time.minor_page_=
faults
>        2216            +8.6%       2407        stress-ng.time.percent_of_=
cpu_this_job_got
>      678.84           +13.8%     772.64        stress-ng.time.system_time
>       90.09 =C2=B1  2%      +5.1%      94.70        stress-ng.time.user_t=
ime
>     3736135            -8.1%    3432912 =C2=B1  4%  stress-ng.vm-splice.o=
ps
>     3736645            -8.1%    3433013 =C2=B1  4%  stress-ng.vm-splice.o=
ps_per_sec
>       22.94            +2.9       25.82        mpstat.cpu.all.sys%
>       64068           +20.9%      77445        slabinfo.radix_tree_node.a=
ctive_objs
>        1191           +24.5%       1483        slabinfo.radix_tree_node.a=
ctive_slabs
>       66763           +24.5%      83089        slabinfo.radix_tree_node.n=
um_objs
>        1191           +24.5%       1483        slabinfo.radix_tree_node.n=
um_slabs
>       13465 =C2=B1  5%      -7.5%      12458 =C2=B1  4%  softirqs.CPU54.R=
CU
>       21991 =C2=B1  9%     -12.2%      19314 =C2=B1  2%  softirqs.CPU67.T=
IMER
>       18381 =C2=B1  3%     +15.7%      21272 =C2=B1 11%  softirqs.CPU78.T=
IMER
>       19718 =C2=B1  5%      -6.2%      18501 =C2=B1  6%  softirqs.CPU85.T=
IMER
>       75.25            -4.3%      72.00        vmstat.cpu.id
>     7158306           +55.5%   11133290        vmstat.memory.cache
>       41.00           +21.1%      49.67        vmstat.procs.r
>      164992            -2.7%     160484        vmstat.system.cs
>        5119 =C2=B1 27%     +26.0%       6449        sched_debug.cfs_rq:/.=
min_vruntime.min
>       40.68 =C2=B1 43%     -44.2%      22.70 =C2=B1 56%  sched_debug.cfs_=
rq:/.removed.load_avg.avg
>      193.17 =C2=B1 22%     -25.4%     144.08 =C2=B1 27%  sched_debug.cfs_=
rq:/.removed.load_avg.stddev
>       40.68 =C2=B1 43%     -44.2%      22.70 =C2=B1 56%  sched_debug.cfs_=
rq:/.removed.runnable_avg.avg
>      193.17 =C2=B1 22%     -25.4%     144.08 =C2=B1 27%  sched_debug.cfs_=
rq:/.removed.runnable_avg.stddev
>       75.65            -3.8%      72.79        iostat.cpu.idle
>       21.71           +12.9%      24.51        iostat.cpu.system
>        3.38 =C2=B1173%    -100.0%       0.00        iostat.sdb.avgqu-sz.m=
ax
>       55.24 =C2=B1173%    -100.0%       0.00        iostat.sdb.await.max
>        7.86 =C2=B1173%    -100.0%       0.00        iostat.sdb.r_await.max
>        0.50 =C2=B1173%    -100.0%       0.00        iostat.sdb.svctm.max
>       73.58 =C2=B1173%    -100.0%       0.00        iostat.sdb.w_await.max
>     3441402           +37.0%    4713857 =C2=B1  2%  meminfo.Active
>     3435631           +37.0%    4708095 =C2=B1  2%  meminfo.Active(anon)
>     7080694 =C2=B1  2%     +57.1%   11123426        meminfo.Cached
>    15441325           +16.2%   17935592        meminfo.Committed_AS
>     4095008 =C2=B1  2%     +64.3%    6730005        meminfo.Inactive
>     4091903 =C2=B1  2%     +64.4%    6726722        meminfo.Inactive(anon)
>     3878376 =C2=B1  2%     +68.4%    6532231        meminfo.Mapped
>     9729489           +40.4%   13657740        meminfo.Memused
>       24152 =C2=B1  2%     +27.3%      30748        meminfo.PageTables
>     5975926 =C2=B1  2%     +67.6%   10018605        meminfo.Shmem
>     1449016           +34.8%    1953751        meminfo.max_used_kB
>      858313           +36.8%    1173864 =C2=B1  2%  proc-vmstat.nr_active=
_anon
>      406781            -8.2%     373619 =C2=B1  2%  proc-vmstat.nr_anon_p=
ages
>     4645359            -2.1%    4548445        proc-vmstat.nr_dirty_backg=
round_threshold
>     9302077            -2.1%    9108013        proc-vmstat.nr_dirty_thres=
hold
>     1771956           +56.2%    2768047        proc-vmstat.nr_file_pages
>    46738540            -2.1%   45771374        proc-vmstat.nr_free_pages
>     1030382 =C2=B1  2%     +62.8%    1677583        proc-vmstat.nr_inacti=
ve_anon
>      975596 =C2=B1  2%     +67.0%    1628805        proc-vmstat.nr_mapped
>       15306 =C2=B1  2%      -4.8%      14573 =C2=B1  4%  proc-vmstat.nr_m=
lock
>        6053           +26.9%       7682        proc-vmstat.nr_page_table_=
pages
>     1495457 =C2=B1  2%     +66.6%    2491556        proc-vmstat.nr_shmem
>       28335            +7.4%      30444        proc-vmstat.nr_slab_reclai=
mable
>      858313           +36.8%    1173863 =C2=B1  2%  proc-vmstat.nr_zone_a=
ctive_anon
>     1030382 =C2=B1  2%     +62.8%    1677583        proc-vmstat.nr_zone_i=
nactive_anon
>       44230 =C2=B1  7%     +38.1%      61075 =C2=B1  6%  proc-vmstat.numa=
_pages_migrated
>       44230 =C2=B1  7%     +38.1%      61075 =C2=B1  6%  proc-vmstat.pgmi=
grate_success
>       21392 =C2=B1  7%     +17.8%      25205 =C2=B1  3%  interrupts.CPU1.=
CAL:Function_call_interrupts
>       29824 =C2=B1  8%     +60.3%      47813 =C2=B1 16%  interrupts.CPU1.=
TLB:TLB_shootdowns
>       93.75 =C2=B1 22%    +298.6%     373.67 =C2=B1 34%  interrupts.CPU10=
.RES:Rescheduling_interrupts
>       28425 =C2=B1  9%     +35.6%      38542 =C2=B1 10%  interrupts.CPU10=
.TLB:TLB_shootdowns
>       28648 =C2=B1  9%     +21.9%      34913 =C2=B1  9%  interrupts.CPU11=
.TLB:TLB_shootdowns
>       20812 =C2=B1 10%     +15.8%      24090 =C2=B1  3%  interrupts.CPU12=
.CAL:Function_call_interrupts
>       28668 =C2=B1 11%     +35.8%      38941 =C2=B1 13%  interrupts.CPU12=
.TLB:TLB_shootdowns
>       97.50 =C2=B1 18%    +205.3%     297.67 =C2=B1 43%  interrupts.CPU14=
.RES:Rescheduling_interrupts
>      152.00 =C2=B1 77%    +627.0%       1105 =C2=B1 81%  interrupts.CPU15=
.RES:Rescheduling_interrupts
>       30393 =C2=B1 12%     +43.5%      43611 =C2=B1 19%  interrupts.CPU15=
.TLB:TLB_shootdowns
>       20253 =C2=B1  5%     +18.7%      24046 =C2=B1  4%  interrupts.CPU18=
.CAL:Function_call_interrupts
>       19382 =C2=B1 14%     +26.8%      24576 =C2=B1  8%  interrupts.CPU19=
.CAL:Function_call_interrupts
>       26649 =C2=B1 12%     +57.4%      41941 =C2=B1 18%  interrupts.CPU19=
.TLB:TLB_shootdowns
>       30299 =C2=B1  9%     +38.1%      41829 =C2=B1 20%  interrupts.CPU22=
.TLB:TLB_shootdowns
>       43754 =C2=B1 18%     -37.5%      27337 =C2=B1  2%  interrupts.CPU25=
.TLB:TLB_shootdowns
>       40282 =C2=B1 31%     -27.2%      29321 =C2=B1 18%  interrupts.CPU26=
.TLB:TLB_shootdowns
>      524.75 =C2=B1 52%     -62.3%     198.00 =C2=B1 57%  interrupts.CPU27=
.RES:Rescheduling_interrupts
>      381.25 =C2=B1 53%     -45.1%     209.33 =C2=B1102%  interrupts.CPU30=
.RES:Rescheduling_interrupts
>      224.00 =C2=B1 84%     -54.9%     101.00 =C2=B1 54%  interrupts.CPU35=
.RES:Rescheduling_interrupts
>       39260 =C2=B1 29%     -33.2%      26214 =C2=B1 25%  interrupts.CPU36=
.TLB:TLB_shootdowns
>       20901 =C2=B1 11%     +13.9%      23801 =C2=B1  4%  interrupts.CPU4.=
CAL:Function_call_interrupts
>       29418 =C2=B1 11%     -13.1%      25571 =C2=B1  6%  interrupts.CPU40=
.TLB:TLB_shootdowns
>       22467 =C2=B1  6%     -21.6%      17610 =C2=B1 10%  interrupts.CPU43=
.CAL:Function_call_interrupts
>       20028 =C2=B1  9%     +20.9%      24219 =C2=B1  7%  interrupts.CPU47=
.CAL:Function_call_interrupts
>       28186 =C2=B1 10%     +33.3%      37576 =C2=B1 21%  interrupts.CPU47=
.TLB:TLB_shootdowns
>       20503 =C2=B1  4%     +15.4%      23664 =C2=B1  3%  interrupts.CPU49=
.CAL:Function_call_interrupts
>       29724 =C2=B1  6%     +44.8%      43046 =C2=B1 34%  interrupts.CPU52=
.TLB:TLB_shootdowns
>       20812 =C2=B1  6%     +23.5%      25710 =C2=B1  2%  interrupts.CPU53=
.CAL:Function_call_interrupts
>       28228 =C2=B1  7%     +25.4%      35402 =C2=B1  3%  interrupts.CPU53=
.TLB:TLB_shootdowns
>       30617 =C2=B1  5%     +13.0%      34602 =C2=B1  5%  interrupts.CPU56=
.TLB:TLB_shootdowns
>       28393 =C2=B1  9%     +14.2%      32419 =C2=B1  4%  interrupts.CPU59=
.TLB:TLB_shootdowns
>       26886 =C2=B1 14%     +33.6%      35911 =C2=B1 17%  interrupts.CPU6.=
TLB:TLB_shootdowns
>        3607 =C2=B1 30%     -71.4%       1031 =C2=B1 40%  interrupts.CPU60=
.NMI:Non-maskable_interrupts
>        3607 =C2=B1 30%     -71.4%       1031 =C2=B1 40%  interrupts.CPU60=
.PMI:Performance_monitoring_interrupts
>       20497 =C2=B1  7%     +17.8%      24149 =C2=B1  6%  interrupts.CPU61=
.CAL:Function_call_interrupts
>       28713 =C2=B1 11%     +29.1%      37066 =C2=B1 14%  interrupts.CPU61=
.TLB:TLB_shootdowns
>       20400 =C2=B1  2%     +17.9%      24051 =C2=B1  3%  interrupts.CPU63=
.CAL:Function_call_interrupts
>       28404 =C2=B1  2%     +36.6%      38793 =C2=B1 21%  interrupts.CPU63=
.TLB:TLB_shootdowns
>      332.50 =C2=B1 74%     -84.0%      53.33 =C2=B1 39%  interrupts.CPU88=
.RES:Rescheduling_interrupts
>       55727 =C2=B1 23%     -47.1%      29476 =C2=B1  9%  interrupts.CPU91=
.TLB:TLB_shootdowns
>       41957 =C2=B1 29%     -42.7%      24035 =C2=B1  6%  interrupts.CPU92=
.TLB:TLB_shootdowns
>      516.25 =C2=B1 57%     -83.0%      88.00 =C2=B1 65%  interrupts.CPU93=
.RES:Rescheduling_interrupts
>       21481 =C2=B1  6%     -17.5%      17720 =C2=B1  9%  interrupts.CPU95=
.CAL:Function_call_interrupts
>       43882 =C2=B1 33%     -45.1%      24079 =C2=B1 10%  interrupts.CPU95=
.TLB:TLB_shootdowns
>       34.47 =C2=B1 18%      -7.4       27.02 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_s=
tartup_entry
>       36.75 =C2=B1 16%      -7.2       29.55 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entr=
y.start_secondary
>       36.91 =C2=B1 15%      -7.1       29.79 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.se=
condary_startup_64
>       37.86 =C2=B1 14%      -6.7       31.20 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startu=
p_64
>       37.86 =C2=B1 14%      -6.6       31.21 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>       37.86 =C2=B1 14%      -6.6       31.21 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.start_secondary.secondary_startup_64
>       38.16 =C2=B1 15%      -6.5       31.62 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.secondary_startup_64
>        0.61 =C2=B1  9%      +0.1        0.69 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.tlb_finish_mmu.zap_page_range.do_madvise.__x64_sys_madvise=
.do_syscall_64
>        0.84 =C2=B1  5%      +0.1        0.93 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.clear_page_erms.prep_new_page.get_page_from_freelist.__all=
oc_pages_nodemask.alloc_pages_vma
>        0.93 =C2=B1  4%      +0.1        1.03 =C2=B1  4%  perf-profile.cal=
ltrace.cycles-pp.mem_cgroup_try_charge.mem_cgroup_try_charge_delay.handle_p=
te_fault.__handle_mm_fault.handle_mm_fault
>        1.13 =C2=B1  5%      +0.1        1.26 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.mem_cgroup_try_charge_delay.handle_pte_fault.__handle_mm_f=
ault.handle_mm_fault.do_page_fault
>        1.17 =C2=B1  6%      +0.1        1.30 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.prep_new_page.get_page_from_freelist.__alloc_pages_nodemas=
k.alloc_pages_vma.handle_pte_fault
>        1.55 =C2=B1  2%      +0.1        1.70 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp._raw_spin_lock.handle_pte_fault.__handle_mm_fault.handle_m=
m_fault.do_page_fault
>        0.92 =C2=B1 13%      +0.2        1.09 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_inte=
rrupt.cpuidle_enter_state.cpuidle_enter
>        1.63 =C2=B1  6%      +0.2        1.83 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.get_page_from_freelist.__alloc_pages_nodemask.alloc_pages_=
vma.handle_pte_fault.__handle_mm_fault
>        1.75 =C2=B1  6%      +0.2        1.96 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.__alloc_pages_nodemask.alloc_pages_vma.handle_pte_fault.__=
handle_mm_fault.handle_mm_fault
>        1.86 =C2=B1  6%      +0.2        2.08 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.alloc_pages_vma.handle_pte_fault.__handle_mm_fault.handle_=
mm_fault.do_page_fault
>        2.01 =C2=B1  9%      +0.3        2.28 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_=
idle.cpu_startup_entry
>        0.28 =C2=B1100%      +0.3        0.58 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.do_brk_flags.__x64_sys_brk.do_syscall_64.entry_SYSCALL_64_=
after_hwframe.brk
>        0.28 =C2=B1100%      +0.3        0.59 =C2=B1  5%  perf-profile.cal=
ltrace.cycles-pp.flush_tlb_mm_range.tlb_flush_mmu.tlb_finish_mmu.zap_page_r=
ange.do_madvise
>        0.81 =C2=B1  8%      +0.4        1.17 =C2=B1 16%  perf-profile.cal=
ltrace.cycles-pp.release_pages.__pagevec_release.shmem_undo_range.shmem_tru=
ncate_range.shmem_evict_inode
>        0.82 =C2=B1  8%      +0.4        1.17 =C2=B1 17%  perf-profile.cal=
ltrace.cycles-pp.__pagevec_release.shmem_undo_range.shmem_truncate_range.sh=
mem_evict_inode.evict
>        2.18 =C2=B1  4%      +0.4        2.57        perf-profile.calltrac=
e.cycles-pp.release_pages.tlb_flush_mmu.unmap_page_range.unmap_vmas.exit_mm=
ap
>        2.22 =C2=B1  4%      +0.4        2.62        perf-profile.calltrac=
e.cycles-pp.tlb_flush_mmu.unmap_page_range.unmap_vmas.exit_mmap.mmput
>        2.35 =C2=B1  8%      +0.4        2.77 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.get_signal.do_signal.exit_to_usermode_loop.prepare_exit_to=
_usermode.swapgs_restore_regs_and_return_to_usermode
>        2.34 =C2=B1  8%      +0.4        2.76 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.do_group_exit.get_signal.do_signal.exit_to_usermode_loop.p=
repare_exit_to_usermode
>        2.36 =C2=B1  8%      +0.4        2.78 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.do_signal.exit_to_usermode_loop.prepare_exit_to_usermode.s=
wapgs_restore_regs_and_return_to_usermode
>        2.36 =C2=B1  8%      +0.4        2.78 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.exit_to_usermode_loop.prepare_exit_to_usermode.swapgs_rest=
ore_regs_and_return_to_usermode
>        2.40 =C2=B1  8%      +0.4        2.83 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>        2.37 =C2=B1  8%      +0.4        2.80 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.prepare_exit_to_usermode.swapgs_restore_regs_and_return_to=
_usermode
>        2.76 =C2=B1  7%      +0.5        3.27        perf-profile.calltrac=
e.cycles-pp.unmap_page_range.unmap_vmas.exit_mmap.mmput.do_exit
>        2.77 =C2=B1  7%      +0.5        3.28        perf-profile.calltrac=
e.cycles-pp.unmap_vmas.exit_mmap.mmput.do_exit.do_group_exit
>        5.51 =C2=B1  3%      +0.6        6.14 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.handle_pte_fault.__handle_mm_fault.handle_mm_fault.do_page=
_fault.page_fault
>        0.35 =C2=B1100%      +0.7        1.01 =C2=B1  8%  perf-profile.cal=
ltrace.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.seco=
ndary_startup_64
>        6.29 =C2=B1 11%      +1.0        7.33 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_read_slowpath.__=
x64_sys_msync.do_syscall_64
>        7.17 =C2=B1 11%      +1.2        8.34 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_read_slowpath.__x64_sys_m=
sync.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        7.57 =C2=B1 11%      +1.2        8.81 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.rwsem_down_read_slowpath.__x64_sys_msync.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
>        9.61 =C2=B1 11%      +1.3       10.93        perf-profile.calltrac=
e.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_w=
rite_killable.do_madvise
>        9.17 =C2=B1 11%      +1.4       10.56 =C2=B1  3%  perf-profile.cal=
ltrace.cycles-pp.__x64_sys_msync.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
>       11.68 =C2=B1 11%      +1.6       13.29 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write=
_killable.do_madvise.__x64_sys_madvise
>       12.11 =C2=B1 12%      +1.6       13.76 =C2=B1  2%  perf-profile.cal=
ltrace.cycles-pp.rwsem_down_write_slowpath.down_write_killable.do_madvise._=
_x64_sys_madvise.do_syscall_64
>       34.59 =C2=B1 18%      -7.4       27.14 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.intel_idle
>       37.20 =C2=B1 16%      -7.0       30.20 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.cpuidle_enter_state
>       37.20 =C2=B1 16%      -7.0       30.20 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.cpuidle_enter
>       37.86 =C2=B1 14%      -6.6       31.21 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.start_secondary
>       38.16 =C2=B1 15%      -6.5       31.62 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.secondary_startup_64
>       38.16 =C2=B1 15%      -6.5       31.62 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.cpu_startup_entry
>       38.17 =C2=B1 15%      -6.5       31.63 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.do_idle
>        0.23 =C2=B1 25%      -0.1        0.17 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.irq_enter
>        0.08 =C2=B1  5%      +0.0        0.09 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.select_task_rq_fair
>        0.07 =C2=B1 13%      +0.0        0.08 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.security_file_alloc
>        0.06 =C2=B1 11%      +0.0        0.08 =C2=B1 10%  perf-profile.chi=
ldren.cycles-pp.__pthread_enable_asynccancel
>        0.18 =C2=B1  2%      +0.0        0.21 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__perf_sw_event
>        0.04 =C2=B1 57%      +0.0        0.06 =C2=B1  7%  perf-profile.chi=
ldren.cycles-pp.apparmor_file_alloc_security
>        0.19 =C2=B1  7%      +0.0        0.22 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.page_remove_rmap
>        0.08 =C2=B1 13%      +0.0        0.11 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.uncharge_batch
>        0.15 =C2=B1 14%      +0.0        0.18 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.__alloc_file
>        0.15 =C2=B1 10%      +0.0        0.18 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.alloc_empty_file
>        0.20 =C2=B1 10%      +0.0        0.24 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.___slab_alloc
>        0.14 =C2=B1 11%      +0.0        0.18 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.alloc_set_pte
>        0.15 =C2=B1 14%      +0.0        0.18 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.alloc_file
>        0.39 =C2=B1  6%      +0.0        0.44 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.___might_sleep
>        0.01 =C2=B1173%      +0.0        0.06 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.free_pcp_prepare
>        0.28 =C2=B1 10%      +0.0        0.33        perf-profile.children=
.cycles-pp.syscall_return_via_sysret
>        0.10 =C2=B1 23%      +0.1        0.15 =C2=B1 14%  perf-profile.chi=
ldren.cycles-pp.irq_work_run_list
>        0.00            +0.1        0.05        perf-profile.children.cycl=
es-pp.call_rcu
>        0.52 =C2=B1  6%      +0.1        0.58 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.do_brk_flags
>        0.21 =C2=B1 14%      +0.1        0.27        perf-profile.children=
.cycles-pp.alloc_file_pseudo
>        0.39 =C2=B1  9%      +0.1        0.45 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.up_write
>        0.46 =C2=B1  4%      +0.1        0.52 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.sync_regs
>        0.36 =C2=B1 10%      +0.1        0.43 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.on_each_cpu_cond_mask
>        0.16 =C2=B1 33%      +0.1        0.24 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.tick_nohz_irq_exit
>        0.23 =C2=B1 19%      +0.1        0.32 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.filemap_map_pages
>        0.42 =C2=B1 15%      +0.1        0.52 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.osq_unlock
>        0.61 =C2=B1 12%      +0.1        0.72 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.smp_call_function_many_cond
>        1.28 =C2=B1  5%      +0.1        1.39 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.mem_cgroup_try_charge_delay
>        1.31 =C2=B1  5%      +0.1        1.43 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.prep_new_page
>        0.86 =C2=B1 13%      +0.1        1.01        perf-profile.children=
.cycles-pp.mmap_region
>        2.23 =C2=B1  6%      +0.2        2.43 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.get_page_from_freelist
>        2.44 =C2=B1  6%      +0.2        2.67 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__alloc_pages_nodemask
>        2.48 =C2=B1  7%      +0.2        2.73 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.alloc_pages_vma
>        2.40 =C2=B1  8%      +0.4        2.83 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>        2.38 =C2=B1  8%      +0.4        2.80 =C2=B1  6%  perf-profile.chi=
ldren.cycles-pp.prepare_exit_to_usermode
>        3.12 =C2=B1  2%      +0.4        3.55        perf-profile.children=
.cycles-pp.unmap_page_range
>        3.07 =C2=B1  2%      +0.4        3.50        perf-profile.children=
.cycles-pp.unmap_vmas
>        0.57 =C2=B1 25%      +0.5        1.02 =C2=B1  8%  perf-profile.chi=
ldren.cycles-pp.menu_select
>        4.06 =C2=B1  4%      +0.5        4.58        perf-profile.children=
.cycles-pp.tlb_flush_mmu
>        4.83 =C2=B1  4%      +0.5        5.36        perf-profile.children=
.cycles-pp.release_pages
>        6.64 =C2=B1  5%      +0.8        7.41 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.handle_pte_fault
>        9.18 =C2=B1 11%      +1.4       10.57 =C2=B1  3%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_msync
>        9.69 =C2=B1 11%      +1.5       11.19        perf-profile.children=
.cycles-pp.rwsem_down_read_slowpath
>       12.15 =C2=B1 12%      +1.7       13.87 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.rwsem_down_write_slowpath
>       17.80 =C2=B1 11%      +2.6       20.44 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.osq_lock
>       20.98 =C2=B1 11%      +3.1       24.05 =C2=B1  2%  perf-profile.chi=
ldren.cycles-pp.rwsem_optimistic_spin
>       34.59 =C2=B1 18%      -7.4       27.14 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.intel_idle
>        0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.do_brk_flags
>        0.07 =C2=B1 11%      +0.0        0.09        perf-profile.self.cyc=
les-pp.anon_vma_interval_tree_remove
>        0.06 =C2=B1 11%      +0.0        0.08 =C2=B1 10%  perf-profile.sel=
f.cycles-pp.__pthread_enable_asynccancel
>        0.15 =C2=B1  7%      +0.0        0.18 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.page_remove_rmap
>        0.17 =C2=B1  6%      +0.0        0.19 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.find_get_entries
>        0.17 =C2=B1  6%      +0.0        0.19 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.handle_mm_fault
>        0.23 =C2=B1  6%      +0.0        0.26 =C2=B1  4%  perf-profile.sel=
f.cycles-pp._raw_spin_lock_irq
>        0.37 =C2=B1  6%      +0.0        0.42 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.___might_sleep
>        0.21 =C2=B1  8%      +0.0        0.26 =C2=B1  4%  perf-profile.sel=
f.cycles-pp.do_madvise
>        0.28 =C2=B1 10%      +0.0        0.33        perf-profile.self.cyc=
les-pp.syscall_return_via_sysret
>        0.39 =C2=B1  8%      +0.1        0.44 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.up_write
>        0.13 =C2=B1 22%      +0.1        0.19 =C2=B1  6%  perf-profile.sel=
f.cycles-pp.filemap_map_pages
>        0.45 =C2=B1  3%      +0.1        0.52 =C2=B1  8%  perf-profile.sel=
f.cycles-pp.sync_regs
>        0.67 =C2=B1  6%      +0.1        0.75        perf-profile.self.cyc=
les-pp.get_page_from_freelist
>        0.42 =C2=B1 16%      +0.1        0.51 =C2=B1  3%  perf-profile.sel=
f.cycles-pp.osq_unlock
>        0.20 =C2=B1 18%      +0.2        0.40 =C2=B1  7%  perf-profile.sel=
f.cycles-pp.cpuidle_enter_state
>        1.94 =C2=B1  5%      +0.2        2.15        perf-profile.self.cyc=
les-pp._raw_spin_lock
>        0.20 =C2=B1 39%      +0.4        0.56 =C2=B1  5%  perf-profile.sel=
f.cycles-pp.menu_select
>       17.31 =C2=B1 11%      +2.6       19.86 =C2=B1  2%  perf-profile.sel=
f.cycles-pp.osq_lock
> =

> =

> =

> *************************************************************************=
**************************
> lkp-hsw-d01: 8 threads Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz with 8G me=
mory
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

> =

> _______________________________________________
> LKP mailing list -- lkp(a)lists.01.org
> To unsubscribe send an email to lkp-leave(a)lists.01.org
> =


-- =

Zhengjun Xing
--===============6596120921848537165==--

