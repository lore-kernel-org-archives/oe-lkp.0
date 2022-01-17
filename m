Content-Type: multipart/mixed; boundary="===============5972076149530397708=="
MIME-Version: 1.0
From: Filipe Manana <fdmanana@kernel.org>
To: lkp@lists.01.org
Subject: Re: [btrfs] 1a61b300c0: fsmark.files_per_sec -69.3% regression
Date: Mon, 17 Jan 2022 12:08:25 +0000
Message-ID: <YeVcOXAsCcA7ijoX@debian9.Home>
In-Reply-To: <20220117082426.GE32491@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5972076149530397708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 04:24:26PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -69.3% regression of fsmark.files_per_sec due to commit:
> =

> =

> commit: 1a61b300c09b1d034534372349e8f9d3aba6c392 ("btrfs: fix log tree cl=
eanup after a transaction abort")
> https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

A bit surprising but it does make sense.

The problem is that after this change we have to keep track of log tree ext=
ent buffers in memory, in an
io tree, not just until their writeback finishes, but until the transaction=
 is committed. So there's an
extra memory usage because of that.

As that patch is not yet on Linus' tree, I'll send an alternative approach =
to address the issue it
fixes.

Thanks.

> =

> in testcase: fsmark
> on test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU=
 @ 2.30GHz with 192G memory
> with following parameters:
> =

> 	iterations: 8
> 	disk: 1SSD
> 	nr_threads: 4
> 	fs: btrfs
> 	filesize: 8K
> 	test_size: 24G
> 	sync_method: fsyncBeforeClose
> 	nr_directories: 16d
> 	nr_files_per_directory: 256fpd
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> test-description: The fsmark is a file system benchmark to test synchrono=
us write workloads, for example, mail servers workload.
> test-url: https://sourceforge.net/projects/fsmark/
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | fsmark: fsmark.files_per_sec -79.6% regression      =
                                |
> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242=
 CPU @ 2.30GHz with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | disk=3D1SSD                                         =
                                  |
> |                  | filesize=3D9B                                       =
                                  |
> |                  | fs=3Dbtrfs                                          =
                                  |
> |                  | iterations=3D8                                      =
                                  |
> |                  | nr_directories=3D16d                                =
                                  |
> |                  | nr_files_per_directory=3D256fpd                     =
                                  |
> |                  | nr_threads=3D4                                      =
                                  |
> |                  | sync_method=3DfsyncBeforeClose                      =
                                  |
> |                  | test_size=3D16G                                     =
                                  |
> |                  | ucode=3D0x5003006                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
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
> compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_director=
ies/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_si=
ze/testcase/ucode:
>   gcc-9/performance/1SSD/8K/btrfs/8/x86_64-rhel-8.3/16d/256fpd/4/debian-1=
0.4-x86_64-20200603.cgz/fsyncBeforeClose/lkp-csl-2ap4/24G/fsmark/0x5003006
> =

> commit: =

>   dd503c2d5d ("btrfs: remove write and wait of struct walk_control")
>   1a61b300c0 ("btrfs: fix log tree cleanup after a transaction abort")
> =

> dd503c2d5db4f864 1a61b300c09b1d034534372349e =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    1693267           +27.7%    2162171        fsmark.app_overhead
>      10798           -69.3%       3316        fsmark.files_per_sec
>     309.11          +214.5%     972.20        fsmark.time.elapsed_time
>     309.11          +214.5%     972.20        fsmark.time.elapsed_time.max
>  3.284e+08            -5.2%  3.112e+08        fsmark.time.file_system_out=
puts
>       1441 =C2=B1  4%    +149.9%       3601 =C2=B1  5%  fsmark.time.invol=
untary_context_switches
>     186.17           +35.1%     251.50        fsmark.time.percent_of_cpu_=
this_job_got
>     565.65          +330.6%       2435        fsmark.time.system_time
>   16705992           +10.4%   18445401        fsmark.time.voluntary_conte=
xt_switches
>       2.68 =C2=B1 10%     +21.2%       3.25 =C2=B1 12%  iostat.cpu.system
>   59912963          +189.9%  1.737e+08 =C2=B1 18%  turbostat.IRQ
>  5.763e+10          +211.5%  1.795e+11        cpuidle..time
>  1.422e+08          +161.1%  3.715e+08 =C2=B1 13%  cpuidle..usage
>     360.08          +183.3%       1020        uptime.boot
>      66292          +184.3%     188463        uptime.idle
>       0.15 =C2=B1  2%      -0.1        0.03 =C2=B1  4%  mpstat.cpu.all.io=
wait%
>       1.01 =C2=B1  2%      +0.3        1.34        mpstat.cpu.all.sys%
>       0.04 =C2=B1  6%      -0.0        0.02 =C2=B1  2%  mpstat.cpu.all.us=
r%
>       7453 =C2=B1  8%     -17.1%       6179 =C2=B1  4%  numa-vmstat.node1=
.nr_kernel_stack
>       1708 =C2=B1 31%     -62.7%     636.83 =C2=B1109%  numa-vmstat.node3=
.nr_mapped
>       7873 =C2=B1 16%     -47.9%       4100 =C2=B1 27%  numa-vmstat.node3=
.nr_shmem
>     550115           -69.6%     167016        vmstat.io.bo
>     132793           -64.2%      47581        vmstat.system.cs
>     415010           -10.3%     372330 =C2=B1 13%  vmstat.system.in
>       7453 =C2=B1  8%     -17.1%       6178 =C2=B1  4%  numa-meminfo.node=
1.KernelStack
>       2842 =C2=B1 97%     -77.4%     642.00 =C2=B1202%  numa-meminfo.node=
2.Mapped
>       6989 =C2=B1 40%     -64.6%       2475 =C2=B1113%  numa-meminfo.node=
3.Mapped
>      30481 =C2=B1 17%     -46.7%      16242 =C2=B1 28%  numa-meminfo.node=
3.Shmem
>      35959 =C2=B1110%   +1474.0%     565979 =C2=B1 31%  numa-numastat.nod=
e1.local_node
>     111652 =C2=B1 27%    +484.9%     653045 =C2=B1 27%  numa-numastat.nod=
e1.numa_hit
>     223279 =C2=B1 20%     +82.7%     407926 =C2=B1 20%  numa-numastat.nod=
e3.local_node
>     310312 =C2=B1 15%     +59.5%     494965 =C2=B1 16%  numa-numastat.nod=
e3.numa_hit
>    6974599 =C2=B1  2%     -27.2%    5074968 =C2=B1  4%  meminfo.Active
>      12971 =C2=B1  2%     +64.3%      21312 =C2=B1  5%  meminfo.Active(an=
on)
>    6961627 =C2=B1  2%     -27.4%    5053654 =C2=B1  4%  meminfo.Active(fi=
le)
>      31060           -10.4%      27841        meminfo.KernelStack
>      41619           -11.3%      36929        meminfo.Mapped
>       3246 =C2=B1  2%     +63.7%       5315 =C2=B1  5%  proc-vmstat.nr_ac=
tive_anon
>    1740701 =C2=B1  2%     -27.4%    1263351 =C2=B1  4%  proc-vmstat.nr_ac=
tive_file
>      76345            -3.1%      73949        proc-vmstat.nr_anon_pages
>   41235116            -5.2%   39106395        proc-vmstat.nr_dirtied
>      43614            +3.7%      45222        proc-vmstat.nr_dirty
>    5617766            -7.5%    5199209        proc-vmstat.nr_file_pages
>   42179045            +1.1%   42663739        proc-vmstat.nr_free_pages
>      84985            -6.7%      79262        proc-vmstat.nr_inactive_anon
>    3223721            +1.9%    3283642        proc-vmstat.nr_inactive_file
>      31071           -10.4%      27834        proc-vmstat.nr_kernel_stack
>      10853           -12.6%       9483        proc-vmstat.nr_mapped
>       1067            -6.2%       1001        proc-vmstat.nr_page_table_p=
ages
>      11852            -9.3%      10748 =C2=B1  3%  proc-vmstat.nr_shmem
>     841480            +2.3%     860894        proc-vmstat.nr_slab_reclaim=
able
>     356995            -1.5%     351806        proc-vmstat.nr_slab_unrecla=
imable
>   41233733            -5.2%   39103309        proc-vmstat.nr_written
>       3246 =C2=B1  2%     +63.7%       5315 =C2=B1  5%  proc-vmstat.nr_zo=
ne_active_anon
>    1740701 =C2=B1  2%     -27.4%    1263351 =C2=B1  4%  proc-vmstat.nr_zo=
ne_active_file
>      84985            -6.7%      79262        proc-vmstat.nr_zone_inactiv=
e_anon
>    3223721            +1.9%    3283642        proc-vmstat.nr_zone_inactiv=
e_file
>      43649            +3.6%      45237        proc-vmstat.nr_zone_write_p=
ending
>   10743944           +11.0%   11920715        proc-vmstat.numa_hit
>   10486008           +11.2%   11660052        proc-vmstat.numa_local
>     256213 =C2=B1  4%     +30.9%     335278 =C2=B1  4%  proc-vmstat.numa_=
pte_updates
>    1427645 =C2=B1  3%     -23.9%    1085954 =C2=B1  9%  proc-vmstat.pgact=
ivate
>   10759480           +11.1%   11959093        proc-vmstat.pgalloc_normal
>    1493167          +163.2%    3930462        proc-vmstat.pgfault
>   10721038 =C2=B1  2%     +11.8%   11989241        proc-vmstat.pgfree
>  1.717e+08            -5.2%  1.628e+08        proc-vmstat.pgpgout
>      80248          +176.9%     222186 =C2=B1  2%  proc-vmstat.pgreuse
>      10.92 =C2=B1 41%    +251.5%      38.40 =C2=B1 28%  perf-stat.i.MPKI
>  1.686e+09           -25.0%  1.264e+09 =C2=B1  2%  perf-stat.i.branch-ins=
tructions
>       1.02 =C2=B1 51%      +1.1        2.15 =C2=B1 44%  perf-stat.i.branc=
h-miss-rate%
>      11.78 =C2=B1 18%      -8.4        3.34 =C2=B1 10%  perf-stat.i.cache=
-miss-rate%
>    8696874 =C2=B1 16%     -40.1%    5206070 =C2=B1 34%  perf-stat.i.cache=
-misses
>   93006209 =C2=B1 40%    +113.7%  1.988e+08 =C2=B1 27%  perf-stat.i.cache=
-references
>     133991           -64.4%      47669        perf-stat.i.context-switches
>       1.61 =C2=B1 10%     +77.9%       2.86 =C2=B1 12%  perf-stat.i.cpi
>     207.27            -4.3%     198.27        perf-stat.i.cpu-migrations
>       1734 =C2=B1  6%    +116.5%       3755 =C2=B1 31%  perf-stat.i.cycle=
s-between-cache-misses
>   2.27e+09           -36.4%  1.444e+09 =C2=B1  2%  perf-stat.i.dTLB-loads
>  1.079e+09           -51.3%   5.25e+08 =C2=B1  3%  perf-stat.i.dTLB-stores
>    2773451 =C2=B1  3%     -36.8%    1752389 =C2=B1  7%  perf-stat.i.iTLB-=
load-misses
>    6627866 =C2=B1  6%     -45.5%    3612274 =C2=B1 21%  perf-stat.i.iTLB-=
loads
>  8.541e+09           -36.0%  5.466e+09 =C2=B1  2%  perf-stat.i.instructio=
ns
>       0.63 =C2=B1  8%     -41.7%       0.37 =C2=B1 12%  perf-stat.i.ipc
>       1.25           -67.0%       0.41 =C2=B1  7%  perf-stat.i.major-faul=
ts
>      26.22           -33.4%      17.47 =C2=B1  3%  perf-stat.i.metric.M/s=
ec
>       4353           -11.6%       3849        perf-stat.i.minor-faults
>      28.34 =C2=B1 13%     +20.4       48.76 =C2=B1  3%  perf-stat.i.node-=
load-miss-rate%
>    1784907           -68.1%     569781        perf-stat.i.node-loads
>      17.67 =C2=B1 27%     +14.5       32.19 =C2=B1 10%  perf-stat.i.node-=
store-miss-rate%
>    1006231 =C2=B1  3%     -64.7%     355642 =C2=B1  6%  perf-stat.i.node-=
stores
>       4355           -11.6%       3849        perf-stat.i.page-faults
>      10.89 =C2=B1 40%    +235.4%      36.51 =C2=B1 28%  perf-stat.overall=
.MPKI
>       1.03 =C2=B1 49%      +1.1        2.12 =C2=B1 44%  perf-stat.overall=
.branch-miss-rate%
>       9.93 =C2=B1 14%      -7.4        2.56 =C2=B1  8%  perf-stat.overall=
.cache-miss-rate%
>       1.59 =C2=B1  9%     +73.4%       2.76 =C2=B1 12%  perf-stat.overall=
.cpi
>       1579 =C2=B1  5%    +100.2%       3162 =C2=B1 24%  perf-stat.overall=
.cycles-between-cache-misses
>       0.63 =C2=B1  8%     -41.9%       0.37 =C2=B1 12%  perf-stat.overall=
.ipc
>      24.89 =C2=B1 13%     +21.3       46.16 =C2=B1  8%  perf-stat.overall=
.node-load-miss-rate%
>      17.64 =C2=B1 25%     +13.7       31.38 =C2=B1 15%  perf-stat.overall=
.node-store-miss-rate%
>  1.681e+09           -24.9%  1.263e+09 =C2=B1  2%  perf-stat.ps.branch-in=
structions
>    8670511 =C2=B1 16%     -40.0%    5200670 =C2=B1 34%  perf-stat.ps.cach=
e-misses
>   92696590 =C2=B1 40%    +114.2%  1.986e+08 =C2=B1 27%  perf-stat.ps.cach=
e-references
>     133536           -64.3%      47605        perf-stat.ps.context-switch=
es
>     206.59            -4.1%     198.06        perf-stat.ps.cpu-migrations
>  2.262e+09           -36.2%  1.443e+09 =C2=B1  2%  perf-stat.ps.dTLB-loads
>  1.075e+09           -51.2%  5.244e+08 =C2=B1  3%  perf-stat.ps.dTLB-stor=
es
>    2764305 =C2=B1  3%     -36.7%    1750404 =C2=B1  7%  perf-stat.ps.iTLB=
-load-misses
>    6605641 =C2=B1  6%     -45.4%    3608091 =C2=B1 21%  perf-stat.ps.iTLB=
-loads
>  8.513e+09           -35.9%   5.46e+09 =C2=B1  2%  perf-stat.ps.instructi=
ons
>       1.25           -67.0%       0.41 =C2=B1  7%  perf-stat.ps.major-fau=
lts
>       4337           -11.4%       3844        perf-stat.ps.minor-faults
>    1779749           -68.0%     569282        perf-stat.ps.node-loads
>    1003217 =C2=B1  3%     -64.6%     355265 =C2=B1  6%  perf-stat.ps.node=
-stores
>       4338           -11.4%       3844        perf-stat.ps.page-faults
>   2.64e+12          +101.3%  5.315e+12 =C2=B1  2%  perf-stat.total.instru=
ctions
>      47976 =C2=B1 15%    +257.9%     171687 =C2=B1 19%  softirqs.CPU0.RCU
>      47168          +180.0%     132067 =C2=B1  4%  softirqs.CPU0.SCHED
>      51434 =C2=B1 22%    +275.5%     193128 =C2=B1 21%  softirqs.CPU1.RCU
>      43547 =C2=B1 15%    +239.0%     147607 =C2=B1 22%  softirqs.CPU1.SCH=
ED
>      53628 =C2=B1 22%    +260.3%     193225 =C2=B1 12%  softirqs.CPU10.RCU
>      46209 =C2=B1  7%    +240.8%     157488 =C2=B1 16%  softirqs.CPU10.SC=
HED
>      41543 =C2=B1 19%    +270.4%     153875 =C2=B1 18%  softirqs.CPU100.R=
CU
>      41317          +198.7%     123436 =C2=B1  2%  softirqs.CPU100.SCHED
>      42175 =C2=B1 18%    +264.2%     153611 =C2=B1 18%  softirqs.CPU101.R=
CU
>      41592 =C2=B1  2%    +191.0%     121049 =C2=B1  3%  softirqs.CPU101.S=
CHED
>      43980 =C2=B1 19%    +249.1%     153528 =C2=B1 16%  softirqs.CPU102.R=
CU
>      41317 =C2=B1  2%    +202.6%     125009        softirqs.CPU102.SCHED
>      41478 =C2=B1 19%    +265.9%     151785 =C2=B1 18%  softirqs.CPU103.R=
CU
>      40483 =C2=B1  3%    +201.7%     122122 =C2=B1  2%  softirqs.CPU103.S=
CHED
>      40685 =C2=B1 18%    +254.6%     144288 =C2=B1 16%  softirqs.CPU104.R=
CU
>      40294 =C2=B1  3%    +189.8%     116773 =C2=B1  4%  softirqs.CPU104.S=
CHED
>      42983 =C2=B1 18%    +250.3%     150574 =C2=B1 19%  softirqs.CPU105.R=
CU
>      41556          +191.9%     121290 =C2=B1  7%  softirqs.CPU105.SCHED
>      43022 =C2=B1 17%    +257.3%     153739 =C2=B1 19%  softirqs.CPU106.R=
CU
>      37758 =C2=B1 25%    +216.4%     119467 =C2=B1  6%  softirqs.CPU106.S=
CHED
>      42788 =C2=B1 21%    +258.1%     153241 =C2=B1 15%  softirqs.CPU107.R=
CU
>      41843 =C2=B1  2%    +183.8%     118749 =C2=B1  7%  softirqs.CPU107.S=
CHED
>      42845 =C2=B1 15%    +267.4%     157401 =C2=B1 18%  softirqs.CPU108.R=
CU
>      42237          +187.3%     121351 =C2=B1  4%  softirqs.CPU108.SCHED
>      42293 =C2=B1 17%    +236.1%     142135 =C2=B1 16%  softirqs.CPU109.R=
CU
>      41362 =C2=B1  2%    +200.8%     124425 =C2=B1  3%  softirqs.CPU109.S=
CHED
>      48453 =C2=B1 12%    +261.6%     175223 =C2=B1 19%  softirqs.CPU11.RCU
>      48735 =C2=B1 18%    +183.4%     138131 =C2=B1 13%  softirqs.CPU11.SC=
HED
>      40644 =C2=B1 20%    +253.7%     143757 =C2=B1 17%  softirqs.CPU110.R=
CU
>      41110 =C2=B1  3%    +190.2%     119302 =C2=B1  4%  softirqs.CPU110.S=
CHED
>      41486 =C2=B1 18%    +261.4%     149920 =C2=B1 16%  softirqs.CPU111.R=
CU
>      41832 =C2=B1  2%    +191.0%     121750 =C2=B1  3%  softirqs.CPU111.S=
CHED
>      39377 =C2=B1 18%    +226.7%     128641 =C2=B1 18%  softirqs.CPU112.R=
CU
>      40013 =C2=B1  8%    +204.3%     121773 =C2=B1  3%  softirqs.CPU112.S=
CHED
>      49821 =C2=B1 27%    +202.9%     150883 =C2=B1 14%  softirqs.CPU113.R=
CU
>      44545 =C2=B1 12%    +210.8%     138439 =C2=B1  9%  softirqs.CPU113.S=
CHED
>      41024 =C2=B1 21%    +232.3%     136334 =C2=B1 18%  softirqs.CPU114.R=
CU
>      42679 =C2=B1  2%    +174.9%     117341 =C2=B1  6%  softirqs.CPU114.S=
CHED
>      51244 =C2=B1 29%    +196.3%     151833 =C2=B1 13%  softirqs.CPU115.R=
CU
>      45818 =C2=B1  8%    +208.4%     141320 =C2=B1 10%  softirqs.CPU115.S=
CHED
>      48095 =C2=B1 14%    +196.4%     142558 =C2=B1 20%  softirqs.CPU116.R=
CU
>      44696 =C2=B1  5%    +190.3%     129754 =C2=B1 18%  softirqs.CPU116.S=
CHED
>      43739 =C2=B1 18%    +212.5%     136681 =C2=B1 18%  softirqs.CPU117.R=
CU
>      43118 =C2=B1  3%    +183.4%     122201 =C2=B1  4%  softirqs.CPU117.S=
CHED
>      47700 =C2=B1 26%    +218.8%     152070 =C2=B1 25%  softirqs.CPU118.R=
CU
>      44380 =C2=B1  6%    +187.7%     127669 =C2=B1 27%  softirqs.CPU118.S=
CHED
>      47016 =C2=B1 16%    +203.3%     142611 =C2=B1 18%  softirqs.CPU119.R=
CU
>      41382 =C2=B1 19%    +179.5%     115658 =C2=B1 18%  softirqs.CPU119.S=
CHED
>      44608 =C2=B1 18%    +279.6%     169333 =C2=B1 17%  softirqs.CPU12.RCU
>      43775 =C2=B1  2%    +193.5%     128499 =C2=B1  2%  softirqs.CPU12.SC=
HED
>      44136 =C2=B1 17%    +223.6%     142847 =C2=B1 16%  softirqs.CPU120.R=
CU
>      43181          +198.7%     128978        softirqs.CPU120.SCHED
>      39889 =C2=B1 20%    +211.9%     124411 =C2=B1 17%  softirqs.CPU121.R=
CU
>      39687 =C2=B1 18%    +225.4%     129141        softirqs.CPU121.SCHED
>      40695 =C2=B1 19%    +205.1%     124161 =C2=B1 14%  softirqs.CPU122.R=
CU
>      42719          +201.9%     128991        softirqs.CPU122.SCHED
>      42156 =C2=B1 17%    +234.7%     141093 =C2=B1 13%  softirqs.CPU123.R=
CU
>      40098 =C2=B1 16%    +222.4%     129267        softirqs.CPU123.SCHED
>      42220 =C2=B1 18%    +239.9%     143519 =C2=B1 14%  softirqs.CPU124.R=
CU
>      43005          +199.6%     128831        softirqs.CPU124.SCHED
>      42387 =C2=B1 18%    +241.0%     144536 =C2=B1 13%  softirqs.CPU125.R=
CU
>      42942          +199.7%     128688        softirqs.CPU125.SCHED
>      41968 =C2=B1 17%    +238.0%     141872 =C2=B1 14%  softirqs.CPU126.R=
CU
>      43047          +199.2%     128796        softirqs.CPU126.SCHED
>      40429 =C2=B1 18%    +229.9%     133370 =C2=B1 15%  softirqs.CPU127.R=
CU
>      42890          +200.5%     128904        softirqs.CPU127.SCHED
>      48217 =C2=B1 16%    +244.5%     166100 =C2=B1 13%  softirqs.CPU128.R=
CU
>      42893          +199.7%     128534        softirqs.CPU128.SCHED
>      48941 =C2=B1 17%    +262.6%     177454 =C2=B1 15%  softirqs.CPU129.R=
CU
>      42940          +176.2%     118609 =C2=B1 18%  softirqs.CPU129.SCHED
>      55036 =C2=B1 23%    +233.4%     183509 =C2=B1 10%  softirqs.CPU13.RCU
>      52316 =C2=B1 21%    +207.1%     160681 =C2=B1 14%  softirqs.CPU13.SC=
HED
>      48310 =C2=B1 16%    +253.7%     170891 =C2=B1 13%  softirqs.CPU130.R=
CU
>      42924          +199.8%     128689        softirqs.CPU130.SCHED
>      50605 =C2=B1 18%    +261.4%     182894 =C2=B1 15%  softirqs.CPU131.R=
CU
>      42946          +199.8%     128751        softirqs.CPU131.SCHED
>      50618 =C2=B1 17%    +257.9%     181155 =C2=B1 14%  softirqs.CPU132.R=
CU
>      42950          +199.9%     128823        softirqs.CPU132.SCHED
>      47107 =C2=B1 16%    +228.9%     154953 =C2=B1 14%  softirqs.CPU133.R=
CU
>      42859          +199.7%     128457        softirqs.CPU133.SCHED
>      47255 =C2=B1 16%    +253.5%     167059 =C2=B1 13%  softirqs.CPU134.R=
CU
>      42869          +199.9%     128578        softirqs.CPU134.SCHED
>      48997 =C2=B1 17%    +263.0%     177884 =C2=B1 16%  softirqs.CPU135.R=
CU
>      43088          +198.5%     128617        softirqs.CPU135.SCHED
>      48290 =C2=B1 17%    +231.1%     159866 =C2=B1 12%  softirqs.CPU136.R=
CU
>      42871          +199.7%     128486        softirqs.CPU136.SCHED
>      50797 =C2=B1 18%    +253.8%     179726 =C2=B1 15%  softirqs.CPU137.R=
CU
>      42855          +200.4%     128740        softirqs.CPU137.SCHED
>      50699 =C2=B1 17%    +250.8%     177866 =C2=B1 19%  softirqs.CPU138.R=
CU
>      42914          +199.5%     128513        softirqs.CPU138.SCHED
>      50423 =C2=B1 17%    +245.4%     174159 =C2=B1 15%  softirqs.CPU139.R=
CU
>      42979          +199.6%     128778        softirqs.CPU139.SCHED
>      52819 =C2=B1 20%    +219.3%     168636 =C2=B1 18%  softirqs.CPU14.RCU
>      43159 =C2=B1 13%    +209.6%     133628 =C2=B1 16%  softirqs.CPU14.SC=
HED
>      46894 =C2=B1 16%    +278.5%     177496 =C2=B1 16%  softirqs.CPU140.R=
CU
>      43124          +198.4%     128690        softirqs.CPU140.SCHED
>      49658 =C2=B1 17%    +245.7%     171649 =C2=B1 12%  softirqs.CPU141.R=
CU
>      43089          +197.8%     128335        softirqs.CPU141.SCHED
>      46164 =C2=B1 29%    +291.6%     180797 =C2=B1 15%  softirqs.CPU142.R=
CU
>      42946          +200.1%     128881        softirqs.CPU142.SCHED
>      49975 =C2=B1 17%    +233.4%     166629 =C2=B1 20%  softirqs.CPU143.R=
CU
>      43226          +197.7%     128696        softirqs.CPU143.SCHED
>      47691 =C2=B1 16%    +254.9%     169272 =C2=B1 16%  softirqs.CPU144.R=
CU
>      39846 =C2=B1 18%    +219.0%     127096 =C2=B1  3%  softirqs.CPU144.S=
CHED
>      47014 =C2=B1 16%    +237.7%     158783 =C2=B1  9%  softirqs.CPU145.R=
CU
>      42817          +196.6%     127008 =C2=B1  2%  softirqs.CPU145.SCHED
>      44737 =C2=B1 18%    +238.4%     151384 =C2=B1 13%  softirqs.CPU146.R=
CU
>      42881          +196.0%     126941 =C2=B1  3%  softirqs.CPU146.SCHED
>      48710 =C2=B1 18%    +263.8%     177218 =C2=B1 15%  softirqs.CPU147.R=
CU
>      42869          +198.1%     127792 =C2=B1  2%  softirqs.CPU147.SCHED
>      48313 =C2=B1 19%    +266.6%     177140 =C2=B1 17%  softirqs.CPU148.R=
CU
>      42667          +197.8%     127064 =C2=B1  2%  softirqs.CPU148.SCHED
>      48745 =C2=B1 19%    +267.5%     179137 =C2=B1 17%  softirqs.CPU149.R=
CU
>      42779          +191.5%     124719 =C2=B1  5%  softirqs.CPU149.SCHED
>      55797 =C2=B1 22%    +202.4%     168757 =C2=B1 25%  softirqs.CPU15.RCU
>      47221 =C2=B1 11%    +185.3%     134730 =C2=B1 17%  softirqs.CPU15.SC=
HED
>      49276 =C2=B1 18%    +263.5%     179135 =C2=B1 16%  softirqs.CPU150.R=
CU
>      42737          +198.9%     127761 =C2=B1  2%  softirqs.CPU150.SCHED
>      48546 =C2=B1 19%    +257.1%     173353 =C2=B1 14%  softirqs.CPU151.R=
CU
>      42744          +197.7%     127256 =C2=B1  2%  softirqs.CPU151.SCHED
>      47510 =C2=B1 19%    +268.4%     175050 =C2=B1 17%  softirqs.CPU152.R=
CU
>      43159          +195.2%     127387 =C2=B1  2%  softirqs.CPU152.SCHED
>      47736 =C2=B1 17%    +254.1%     169020 =C2=B1 14%  softirqs.CPU153.R=
CU
>      42572          +198.8%     127216 =C2=B1  2%  softirqs.CPU153.SCHED
>      49147 =C2=B1 18%    +260.8%     177322 =C2=B1 15%  softirqs.CPU154.R=
CU
>      42684          +192.1%     124671 =C2=B1  6%  softirqs.CPU154.SCHED
>      49797 =C2=B1 19%    +259.2%     178865 =C2=B1 16%  softirqs.CPU155.R=
CU
>      42812          +191.2%     124665 =C2=B1  4%  softirqs.CPU155.SCHED
>      45522 =C2=B1 16%    +257.2%     162586 =C2=B1 14%  softirqs.CPU156.R=
CU
>      42444 =C2=B1  2%    +198.5%     126691 =C2=B1  2%  softirqs.CPU156.S=
CHED
>      45992 =C2=B1 17%    +253.9%     162770 =C2=B1 14%  softirqs.CPU157.R=
CU
>      42499          +198.1%     126676 =C2=B1  3%  softirqs.CPU157.SCHED
>      48781 =C2=B1 19%    +259.2%     175202 =C2=B1 17%  softirqs.CPU158.R=
CU
>      42565          +199.9%     127672 =C2=B1  2%  softirqs.CPU158.SCHED
>      43221 =C2=B1 13%    +282.9%     165496 =C2=B1 15%  softirqs.CPU159.R=
CU
>      42456          +199.7%     127247 =C2=B1  2%  softirqs.CPU159.SCHED
>      43889 =C2=B1 15%    +217.8%     139494 =C2=B1 20%  softirqs.CPU16.RCU
>      43807 =C2=B1  4%    +189.4%     126785 =C2=B1  4%  softirqs.CPU16.SC=
HED
>      46851 =C2=B1 18%    +223.7%     151649 =C2=B1 20%  softirqs.CPU160.R=
CU
>      42661          +198.0%     127128 =C2=B1  3%  softirqs.CPU160.SCHED
>      48331 =C2=B1 17%    +229.3%     159146 =C2=B1 19%  softirqs.CPU161.R=
CU
>      43157          +194.8%     127235 =C2=B1  2%  softirqs.CPU161.SCHED
>      43141 =C2=B1 20%    +214.8%     135819 =C2=B1 22%  softirqs.CPU162.R=
CU
>      42300 =C2=B1  2%    +199.3%     126619 =C2=B1  3%  softirqs.CPU162.S=
CHED
>      46485 =C2=B1 17%    +234.6%     155555 =C2=B1 18%  softirqs.CPU163.R=
CU
>      42606          +196.8%     126464 =C2=B1  3%  softirqs.CPU163.SCHED
>      50580 =C2=B1 17%    +217.2%     160421 =C2=B1 15%  softirqs.CPU164.R=
CU
>      43720 =C2=B1  5%    +208.9%     135065 =C2=B1 11%  softirqs.CPU164.S=
CHED
>      46832 =C2=B1 16%    +227.4%     153312 =C2=B1 18%  softirqs.CPU165.R=
CU
>      43201          +194.5%     127249 =C2=B1  2%  softirqs.CPU165.SCHED
>      48015 =C2=B1 16%    +239.6%     163069 =C2=B1 18%  softirqs.CPU166.R=
CU
>      42996          +196.3%     127414 =C2=B1  2%  softirqs.CPU166.SCHED
>      49610 =C2=B1 17%    +217.9%     157708 =C2=B1 16%  softirqs.CPU167.R=
CU
>      42104 =C2=B1  6%    +181.6%     118568 =C2=B1 14%  softirqs.CPU167.S=
CHED
>      45412 =C2=B1 18%    +242.1%     155368 =C2=B1 15%  softirqs.CPU168.R=
CU
>      37913 =C2=B1 28%    +235.9%     127357 =C2=B1  2%  softirqs.CPU168.S=
CHED
>      42364 =C2=B1 17%    +237.9%     143165 =C2=B1 16%  softirqs.CPU169.R=
CU
>      42947          +196.9%     127511 =C2=B1  2%  softirqs.CPU169.SCHED
>      41809 =C2=B1 16%    +226.8%     136639 =C2=B1 18%  softirqs.CPU17.RCU
>      43062 =C2=B1  2%    +184.6%     122557 =C2=B1  3%  softirqs.CPU17.SC=
HED
>      41355 =C2=B1 18%    +235.0%     138528 =C2=B1 17%  softirqs.CPU170.R=
CU
>      42981          +195.6%     127038 =C2=B1  2%  softirqs.CPU170.SCHED
>      44314 =C2=B1 17%    +254.2%     156976 =C2=B1 15%  softirqs.CPU171.R=
CU
>      42797          +198.4%     127690 =C2=B1  2%  softirqs.CPU171.SCHED
>      42907 =C2=B1 18%    +255.1%     152357 =C2=B1 15%  softirqs.CPU172.R=
CU
>      42782          +197.2%     127138 =C2=B1  2%  softirqs.CPU172.SCHED
>      44525 =C2=B1 17%    +249.4%     155577 =C2=B1 16%  softirqs.CPU173.R=
CU
>      42965          +196.8%     127535 =C2=B1  2%  softirqs.CPU173.SCHED
>      44451 =C2=B1 17%    +253.6%     157160 =C2=B1 16%  softirqs.CPU174.R=
CU
>      39726 =C2=B1 17%    +202.8%     120305 =C2=B1 12%  softirqs.CPU174.S=
CHED
>      43013 =C2=B1 17%    +243.7%     147830 =C2=B1 15%  softirqs.CPU175.R=
CU
>      42875          +196.2%     127007 =C2=B1  2%  softirqs.CPU175.SCHED
>      48247 =C2=B1 17%    +265.0%     176099 =C2=B1 13%  softirqs.CPU176.R=
CU
>      42918          +196.9%     127435 =C2=B1  2%  softirqs.CPU176.SCHED
>      47684 =C2=B1 16%    +259.4%     171352 =C2=B1 13%  softirqs.CPU177.R=
CU
>      42930          +197.0%     127486 =C2=B1  2%  softirqs.CPU177.SCHED
>      48461 =C2=B1 17%    +270.9%     179734 =C2=B1 14%  softirqs.CPU178.R=
CU
>      42903          +197.0%     127416 =C2=B1  2%  softirqs.CPU178.SCHED
>      49351 =C2=B1 18%    +258.6%     176969 =C2=B1 15%  softirqs.CPU179.R=
CU
>      42835          +198.0%     127641 =C2=B1  2%  softirqs.CPU179.SCHED
>      42112 =C2=B1 18%    +232.2%     139876 =C2=B1 18%  softirqs.CPU18.RCU
>      41917 =C2=B1  6%    +188.8%     121070 =C2=B1  6%  softirqs.CPU18.SC=
HED
>      46700 =C2=B1 15%    +256.6%     166553 =C2=B1 15%  softirqs.CPU180.R=
CU
>      42770          +197.1%     127081 =C2=B1  2%  softirqs.CPU180.SCHED
>      46319 =C2=B1 16%    +251.4%     162763 =C2=B1 13%  softirqs.CPU181.R=
CU
>      42811          +196.3%     126870 =C2=B1  2%  softirqs.CPU181.SCHED
>      49048 =C2=B1 17%    +269.2%     181069 =C2=B1 15%  softirqs.CPU182.R=
CU
>      42901          +197.1%     127479 =C2=B1  2%  softirqs.CPU182.SCHED
>      46991 =C2=B1 15%    +243.9%     161593 =C2=B1 13%  softirqs.CPU183.R=
CU
>      42758          +197.2%     127081 =C2=B1  2%  softirqs.CPU183.SCHED
>      48663 =C2=B1 16%    +259.0%     174707 =C2=B1 13%  softirqs.CPU184.R=
CU
>      42692          +198.8%     127565 =C2=B1  2%  softirqs.CPU184.SCHED
>      49390 =C2=B1 17%    +261.0%     178275 =C2=B1 14%  softirqs.CPU185.R=
CU
>      42892          +197.0%     127411 =C2=B1  2%  softirqs.CPU185.SCHED
>      40647 =C2=B1 24%    +281.6%     155111 =C2=B1 16%  softirqs.CPU186.R=
CU
>      43084          +194.4%     126861 =C2=B1  2%  softirqs.CPU186.SCHED
>      49093 =C2=B1 15%    +270.0%     181656 =C2=B1 15%  softirqs.CPU187.R=
CU
>      42737          +197.7%     127220 =C2=B1  2%  softirqs.CPU187.SCHED
>      48869 =C2=B1 18%    +273.1%     182329 =C2=B1 16%  softirqs.CPU188.R=
CU
>      42782          +197.7%     127359 =C2=B1  2%  softirqs.CPU188.SCHED
>      46694 =C2=B1 16%    +266.7%     171220 =C2=B1 14%  softirqs.CPU189.R=
CU
>      42509          +199.1%     127150 =C2=B1  2%  softirqs.CPU189.SCHED
>      40050 =C2=B1 19%    +240.9%     136513 =C2=B1 18%  softirqs.CPU19.RCU
>      39309 =C2=B1 17%    +209.7%     121760 =C2=B1  6%  softirqs.CPU19.SC=
HED
>      48637 =C2=B1 17%    +272.5%     181180 =C2=B1 16%  softirqs.CPU190.R=
CU
>      42877 =C2=B1  2%    +206.4%     131354 =C2=B1  7%  softirqs.CPU190.S=
CHED
>      47627 =C2=B1 15%    +254.5%     168848 =C2=B1 13%  softirqs.CPU191.R=
CU
>      28001 =C2=B1 23%    +240.7%      95412 =C2=B1 29%  softirqs.CPU191.S=
CHED
>      54426 =C2=B1 18%    +221.3%     174885 =C2=B1 23%  softirqs.CPU2.RCU
>      44916 =C2=B1  6%    +187.0%     128892 =C2=B1 25%  softirqs.CPU2.SCH=
ED
>      40331 =C2=B1 19%    +231.5%     133709 =C2=B1 17%  softirqs.CPU20.RCU
>      39401 =C2=B1 17%    +221.4%     126625 =C2=B1  5%  softirqs.CPU20.SC=
HED
>      39891 =C2=B1 19%    +243.9%     137191 =C2=B1 19%  softirqs.CPU21.RCU
>      39521 =C2=B1 17%    +236.4%     132930 =C2=B1 17%  softirqs.CPU22.RCU
>      42309          +189.2%     122370 =C2=B1  5%  softirqs.CPU22.SCHED
>      39369 =C2=B1 19%    +243.9%     135409 =C2=B1 18%  softirqs.CPU23.RCU
>      41982          +197.6%     124944        softirqs.CPU23.SCHED
>      43827 =C2=B1 17%    +230.4%     144800 =C2=B1 17%  softirqs.CPU24.RCU
>      43392          +175.1%     119368 =C2=B1 19%  softirqs.CPU24.SCHED
>      39340 =C2=B1 18%    +215.8%     124243 =C2=B1 20%  softirqs.CPU25.RCU
>      42674          +201.6%     128703        softirqs.CPU25.SCHED
>      41063 =C2=B1 17%    +220.5%     131589 =C2=B1 16%  softirqs.CPU26.RCU
>      44950 =C2=B1 10%    +190.5%     130563 =C2=B1  3%  softirqs.CPU26.SC=
HED
>      42200 =C2=B1 17%    +245.9%     145986 =C2=B1 14%  softirqs.CPU27.RCU
>      43888 =C2=B1  3%    +197.5%     130586 =C2=B1  3%  softirqs.CPU27.SC=
HED
>      42448 =C2=B1 18%    +239.8%     144233 =C2=B1 14%  softirqs.CPU28.RCU
>      42899          +201.1%     129177        softirqs.CPU28.SCHED
>      40082 =C2=B1 18%    +264.6%     146157 =C2=B1 13%  softirqs.CPU29.RCU
>      53587 =C2=B1 20%    +141.1%     129212        softirqs.CPU29.SCHED
>      45978 =C2=B1 24%    +264.0%     167357 =C2=B1 22%  softirqs.CPU3.RCU
>      42350 =C2=B1  4%    +194.7%     124827 =C2=B1  2%  softirqs.CPU3.SCH=
ED
>      42308 =C2=B1 17%    +238.6%     143261 =C2=B1 14%  softirqs.CPU30.RCU
>      44139 =C2=B1  4%    +190.6%     128281        softirqs.CPU30.SCHED
>      39958 =C2=B1 21%    +241.3%     136377 =C2=B1 15%  softirqs.CPU31.RCU
>      61474 =C2=B1 32%    +109.1%     128561        softirqs.CPU31.SCHED
>      50434 =C2=B1 15%    +237.7%     170309 =C2=B1 11%  softirqs.CPU32.RCU
>      43540 =C2=B1  3%    +196.0%     128860        softirqs.CPU32.SCHED
>      50391 =C2=B1 16%    +251.2%     176949 =C2=B1 15%  softirqs.CPU33.RCU
>      45705 =C2=B1 13%    +181.7%     128738        softirqs.CPU33.SCHED
>      49965 =C2=B1 15%    +253.6%     176666 =C2=B1 13%  softirqs.CPU34.RCU
>      42883          +199.7%     128527        softirqs.CPU34.SCHED
>      51875 =C2=B1 17%    +259.2%     186362 =C2=B1 13%  softirqs.CPU35.RCU
>      43448 =C2=B1  2%    +195.8%     128522        softirqs.CPU35.SCHED
>      52075 =C2=B1 15%    +254.3%     184529 =C2=B1 13%  softirqs.CPU36.RCU
>      42919          +199.6%     128584        softirqs.CPU36.SCHED
>      48685 =C2=B1 16%    +229.1%     160202 =C2=B1 14%  softirqs.CPU37.RCU
>      42690          +200.9%     128461        softirqs.CPU37.SCHED
>      49203 =C2=B1 16%    +249.0%     171741 =C2=B1 13%  softirqs.CPU38.RCU
>      42846          +182.4%     120982 =C2=B1 17%  softirqs.CPU38.SCHED
>      50971 =C2=B1 16%    +253.9%     180392 =C2=B1 16%  softirqs.CPU39.RCU
>      42890          +200.2%     128754        softirqs.CPU39.SCHED
>      50852 =C2=B1 20%    +276.7%     191550 =C2=B1 14%  softirqs.CPU4.RCU
>      44115 =C2=B1  6%    +253.5%     155969 =C2=B1 16%  softirqs.CPU4.SCH=
ED
>      49870 =C2=B1 15%    +226.2%     162692 =C2=B1 13%  softirqs.CPU40.RCU
>      42850          +205.4%     130844 =C2=B1  4%  softirqs.CPU40.SCHED
>      11.83 =C2=B1 17%  +42850.7%       5082 =C2=B1222%  softirqs.CPU40.TI=
MER
>      51256 =C2=B1 16%    +258.7%     183849 =C2=B1 15%  softirqs.CPU41.RCU
>      46670 =C2=B1 17%    +175.6%     128620        softirqs.CPU41.SCHED
>      52995 =C2=B1 13%    +243.3%     181911 =C2=B1 17%  softirqs.CPU42.RCU
>      42980          +198.9%     128479        softirqs.CPU42.SCHED
>      52444 =C2=B1 16%    +240.5%     178580 =C2=B1 15%  softirqs.CPU43.RCU
>      43010          +197.9%     128145        softirqs.CPU43.SCHED
>      50509 =C2=B1 15%    +261.1%     182399 =C2=B1 15%  softirqs.CPU44.RCU
>      43255 =C2=B1  2%    +198.5%     129135        softirqs.CPU44.SCHED
>      51524 =C2=B1 16%    +241.7%     176076 =C2=B1 12%  softirqs.CPU45.RCU
>      43126          +197.9%     128493        softirqs.CPU45.SCHED
>      52276 =C2=B1 17%    +250.2%     183055 =C2=B1 13%  softirqs.CPU46.RCU
>      42954          +199.6%     128692        softirqs.CPU46.SCHED
>      52168 =C2=B1 16%    +228.4%     171301 =C2=B1 20%  softirqs.CPU47.RCU
>      42939          +200.2%     128907        softirqs.CPU47.SCHED
>      53681 =C2=B1 15%    +231.6%     178016 =C2=B1 14%  softirqs.CPU48.RCU
>      43740 =C2=B1  2%    +191.9%     127684 =C2=B1  2%  softirqs.CPU48.SC=
HED
>      49552 =C2=B1 16%    +237.7%     167333 =C2=B1  8%  softirqs.CPU49.RCU
>      42962          +196.1%     127208 =C2=B1  2%  softirqs.CPU49.SCHED
>      49029 =C2=B1 14%    +255.8%     174467 =C2=B1 18%  softirqs.CPU5.RCU
>      43874 =C2=B1  4%    +199.9%     131564 =C2=B1  5%  softirqs.CPU5.SCH=
ED
>      50757 =C2=B1 21%    +215.7%     160254 =C2=B1 14%  softirqs.CPU50.RCU
>      44004 =C2=B1  5%    +193.6%     129191 =C2=B1  3%  softirqs.CPU50.SC=
HED
>      51333 =C2=B1 16%    +264.0%     186847 =C2=B1 13%  softirqs.CPU51.RCU
>      43064          +173.7%     117859 =C2=B1 18%  softirqs.CPU51.SCHED
>      51372 =C2=B1 16%    +259.9%     184905 =C2=B1 15%  softirqs.CPU52.RCU
>      42624          +199.8%     127808 =C2=B1  2%  softirqs.CPU52.SCHED
>      52646 =C2=B1 16%    +268.1%     193772 =C2=B1 12%  softirqs.CPU53.RCU
>      43279 =C2=B1  2%    +214.7%     136197 =C2=B1 13%  softirqs.CPU53.SC=
HED
>      51606 =C2=B1 16%    +261.5%     186539 =C2=B1 14%  softirqs.CPU54.RCU
>      42691          +198.2%     127300 =C2=B1  2%  softirqs.CPU54.SCHED
>      50188 =C2=B1 15%    +252.5%     176918 =C2=B1 13%  softirqs.CPU55.RCU
>      39940 =C2=B1 16%    +220.0%     127793        softirqs.CPU55.SCHED
>      50110 =C2=B1 16%    +279.9%     190347 =C2=B1 12%  softirqs.CPU56.RCU
>      43453 =C2=B1  2%    +218.5%     138402 =C2=B1 16%  softirqs.CPU56.SC=
HED
>      49678 =C2=B1 15%    +260.7%     179197 =C2=B1 11%  softirqs.CPU57.RCU
>      42419          +204.0%     128955 =C2=B1  2%  softirqs.CPU57.SCHED
>      51036 =C2=B1 17%    +264.3%     185947 =C2=B1 13%  softirqs.CPU58.RCU
>      42674          +200.9%     128427        softirqs.CPU58.SCHED
>      52214 =C2=B1 18%    +268.3%     192302 =C2=B1 11%  softirqs.CPU59.RCU
>      42919          +215.3%     135304 =C2=B1 11%  softirqs.CPU59.SCHED
>      45835 =C2=B1 20%    +246.6%     158888 =C2=B1 15%  softirqs.CPU6.RCU
>      42428          +200.5%     127488 =C2=B1  2%  softirqs.CPU6.SCHED
>      47933 =C2=B1 15%    +255.5%     170407 =C2=B1 13%  softirqs.CPU60.RCU
>      42799          +202.9%     129618 =C2=B1  4%  softirqs.CPU60.SCHED
>      49088 =C2=B1 16%    +246.0%     169846 =C2=B1 11%  softirqs.CPU61.RCU
>      43356 =C2=B1  2%    +193.9%     127410 =C2=B1  2%  softirqs.CPU61.SC=
HED
>      53333 =C2=B1 18%    +254.6%     189122 =C2=B1 11%  softirqs.CPU62.RCU
>      43861 =C2=B1  4%    +209.8%     135861 =C2=B1 12%  softirqs.CPU62.SC=
HED
>      53241 =C2=B1 22%    +236.8%     179298 =C2=B1 13%  softirqs.CPU63.RCU
>      44674 =C2=B1  8%    +205.8%     136632 =C2=B1 14%  softirqs.CPU63.SC=
HED
>      49905 =C2=B1 14%    +215.5%     157474 =C2=B1 18%  softirqs.CPU64.RCU
>      43368 =C2=B1  2%    +198.3%     129382 =C2=B1  2%  softirqs.CPU64.SC=
HED
>      48982 =C2=B1 16%    +226.6%     160001 =C2=B1 18%  softirqs.CPU65.RCU
>      43072          +197.4%     128104        softirqs.CPU65.SCHED
>      45954 =C2=B1 20%    +196.8%     136398 =C2=B1 22%  softirqs.CPU66.RCU
>      42649          +199.1%     127549 =C2=B1  2%  softirqs.CPU66.SCHED
>      47346 =C2=B1 17%    +231.5%     156959 =C2=B1 14%  softirqs.CPU67.RCU
>      42757          +197.7%     127294 =C2=B1  2%  softirqs.CPU67.SCHED
>      21.00 =C2=B1 78%  +35142.1%       7400 =C2=B1221%  softirqs.CPU67.TI=
MER
>      48696 =C2=B1 17%    +234.0%     162652 =C2=B1 22%  softirqs.CPU68.RCU
>      42961          +196.8%     127499 =C2=B1  2%  softirqs.CPU68.SCHED
>      46723 =C2=B1 19%    +241.6%     159592 =C2=B1 14%  softirqs.CPU69.RCU
>      42165 =C2=B1  2%    +208.5%     130068 =C2=B1  5%  softirqs.CPU69.SC=
HED
>      46511 =C2=B1 12%    +311.3%     191298 =C2=B1 11%  softirqs.CPU7.RCU
>      42704 =C2=B1  2%    +267.8%     157047 =C2=B1 15%  softirqs.CPU7.SCH=
ED
>      48338 =C2=B1 18%    +244.8%     166664 =C2=B1 17%  softirqs.CPU70.RCU
>      42794          +198.1%     127548 =C2=B1  2%  softirqs.CPU70.SCHED
>      46911 =C2=B1 19%    +238.4%     158759 =C2=B1 18%  softirqs.CPU71.RCU
>      43148          +195.7%     127600 =C2=B1  2%  softirqs.CPU71.SCHED
>      47114 =C2=B1 16%    +241.6%     160935 =C2=B1 15%  softirqs.CPU72.RCU
>      42568          +191.3%     123982 =C2=B1  6%  softirqs.CPU72.SCHED
>      44503 =C2=B1 17%    +240.8%     151658 =C2=B1 15%  softirqs.CPU73.RCU
>      42500          +184.6%     120955 =C2=B1 16%  softirqs.CPU73.SCHED
>      43480 =C2=B1 19%    +230.4%     143673 =C2=B1 18%  softirqs.CPU74.RCU
>      42477          +183.4%     120389 =C2=B1 11%  softirqs.CPU74.SCHED
>      45923 =C2=B1 17%    +246.7%     159220 =C2=B1 14%  softirqs.CPU75.RCU
>      42440          +199.4%     127053 =C2=B1  2%  softirqs.CPU75.SCHED
>      45853 =C2=B1 19%    +242.4%     156991 =C2=B1 15%  softirqs.CPU76.RCU
>      42526          +201.0%     127994 =C2=B1  3%  softirqs.CPU76.SCHED
>      45711 =C2=B1 17%    +246.0%     158164 =C2=B1 16%  softirqs.CPU77.RCU
>      42384          +199.7%     127037 =C2=B1  2%  softirqs.CPU77.SCHED
>      45632 =C2=B1 16%    +245.0%     157419 =C2=B1 14%  softirqs.CPU78.RCU
>      42568          +197.3%     126542 =C2=B1  2%  softirqs.CPU78.SCHED
>      45016 =C2=B1 17%    +236.6%     151502 =C2=B1 14%  softirqs.CPU79.RCU
>      42256          +199.1%     126390 =C2=B1  2%  softirqs.CPU79.SCHED
>      45137 =C2=B1 11%    +272.8%     168281 =C2=B1 19%  softirqs.CPU8.RCU
>      44416 =C2=B1  9%    +209.3%     137371 =C2=B1 16%  softirqs.CPU8.SCH=
ED
>      49887 =C2=B1 17%    +265.9%     182560 =C2=B1 13%  softirqs.CPU80.RCU
>      42640          +195.7%     126093 =C2=B1  2%  softirqs.CPU80.SCHED
>      47646 =C2=B1 15%    +262.9%     172885 =C2=B1 13%  softirqs.CPU81.RCU
>      42582          +196.8%     126400 =C2=B1  2%  softirqs.CPU81.SCHED
>      49622 =C2=B1 18%    +270.0%     183592 =C2=B1 14%  softirqs.CPU82.RCU
>      42458          +198.6%     126761 =C2=B1  2%  softirqs.CPU82.SCHED
>      49861 =C2=B1 17%    +258.5%     178732 =C2=B1 14%  softirqs.CPU83.RCU
>      42577          +198.4%     127038 =C2=B1  2%  softirqs.CPU83.SCHED
>      47320 =C2=B1 15%    +253.2%     167129 =C2=B1 13%  softirqs.CPU84.RCU
>      42307          +198.2%     126152 =C2=B1  2%  softirqs.CPU84.SCHED
>      47744 =C2=B1 15%    +250.8%     167497 =C2=B1 12%  softirqs.CPU85.RCU
>      42189          +199.4%     126299 =C2=B1  3%  softirqs.CPU85.SCHED
>      48849 =C2=B1 19%    +275.9%     183609 =C2=B1 14%  softirqs.CPU86.RCU
>      42347          +199.8%     126939 =C2=B1  2%  softirqs.CPU86.SCHED
>      47686 =C2=B1 16%    +242.0%     163098 =C2=B1 13%  softirqs.CPU87.RCU
>      42395          +199.0%     126761 =C2=B1  2%  softirqs.CPU87.SCHED
>      48776 =C2=B1 16%    +259.3%     175253 =C2=B1 13%  softirqs.CPU88.RCU
>      42344          +182.2%     119513 =C2=B1 12%  softirqs.CPU88.SCHED
>      50336 =C2=B1 17%    +258.6%     180495 =C2=B1 13%  softirqs.CPU89.RCU
>      42601          +197.1%     126559 =C2=B1  2%  softirqs.CPU89.SCHED
>      44394 =C2=B1 14%    +259.4%     159563 =C2=B1 18%  softirqs.CPU9.RCU
>      42487          +199.3%     127156 =C2=B1  3%  softirqs.CPU9.SCHED
>      46308 =C2=B1 19%    +242.4%     158563 =C2=B1 16%  softirqs.CPU90.RCU
>      42469          +197.7%     126423 =C2=B1  2%  softirqs.CPU90.SCHED
>      50144 =C2=B1 16%    +268.2%     184632 =C2=B1 15%  softirqs.CPU91.RCU
>      42500          +197.7%     126505 =C2=B1  2%  softirqs.CPU91.SCHED
>      50364 =C2=B1 17%    +264.4%     183530 =C2=B1 15%  softirqs.CPU92.RCU
>      42544          +197.9%     126755 =C2=B1  2%  softirqs.CPU92.SCHED
>      47189 =C2=B1 17%    +268.9%     174087 =C2=B1 13%  softirqs.CPU93.RCU
>      42182          +200.0%     126554 =C2=B1  2%  softirqs.CPU93.SCHED
>      50818 =C2=B1 18%    +263.4%     184692 =C2=B1 15%  softirqs.CPU94.RCU
>      42768          +196.9%     126978 =C2=B1  2%  softirqs.CPU94.SCHED
>      49496 =C2=B1 15%    +247.3%     171917 =C2=B1 11%  softirqs.CPU95.RCU
>      22401 =C2=B1 11%    +270.9%      83076 =C2=B1 46%  softirqs.CPU95.SC=
HED
>      42634 =C2=B1 18%    +266.4%     156208 =C2=B1 19%  softirqs.CPU96.RCU
>      41316 =C2=B1 17%    +269.4%     152640 =C2=B1 18%  softirqs.CPU97.RCU
>      41578 =C2=B1  3%    +195.2%     122722 =C2=B1  2%  softirqs.CPU97.SC=
HED
>      41991 =C2=B1 20%    +266.1%     153710 =C2=B1 17%  softirqs.CPU98.RCU
>      40589 =C2=B1  5%    +197.9%     120925 =C2=B1  3%  softirqs.CPU98.SC=
HED
>      43012 =C2=B1 18%    +254.8%     152628 =C2=B1 18%  softirqs.CPU99.RCU
>      42041 =C2=B1  2%    +191.2%     122444 =C2=B1  2%  softirqs.CPU99.SC=
HED
>      18511 =C2=B1 46%    +211.2%      57608 =C2=B1 27%  softirqs.NET_RX
>    9023846 =C2=B1 15%    +248.2%   31418582 =C2=B1 12%  softirqs.RCU
>    8211849          +197.7%   24442961        softirqs.SCHED
>      60379 =C2=B1  2%    +163.2%     158940 =C2=B1  3%  softirqs.TIMER
>       6.22 =C2=B1  4%      -4.2        2.04 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.btree_write_cache_pages.do_writepages.filemap_fdatawrite_wb=
c.filemap_fdatawrite_range.btrfs_write_marked_extents
>      62.31 =C2=B1  2%      -4.2       58.15 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>      62.31 =C2=B1  2%      -4.2       58.15 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_v=
erify
>      62.27 =C2=B1  2%      -4.2       58.11 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64_no_verify
>       4.96 =C2=B1  5%      -4.0        1.01 =C2=B1 41%  perf-profile.call=
trace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_sta=
rtup_entry
>      62.50 =C2=B1  2%      -3.8       58.74 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.secondary_startup_64_no_verify
>      56.59 =C2=B1  2%      -3.8       52.83 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry=
.start_secondary
>       5.68 =C2=B1  4%      -3.6        2.04 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_s=
ync_log.btrfs_sync_file.do_fsync
>       5.68 =C2=B1  4%      -3.6        2.04 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.filemap_fdatawrite_wbc.filemap_fdatawrite_range.btrfs_write=
_marked_extents.btrfs_sync_log.btrfs_sync_file
>       5.67 =C2=B1  4%      -3.6        2.04 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.filemap_fdatawrite_ran=
ge.btrfs_write_marked_extents.btrfs_sync_log
>       5.10 =C2=B1  9%      -3.4        1.73 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.submit_one_bio.btree_write_cache_pages.do_writepages.filema=
p_fdatawrite_wbc.filemap_fdatawrite_range
>       5.09 =C2=B1  9%      -3.4        1.72 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.btrfs_submit_metadata_bio.submit_one_bio.btree_write_cache_=
pages.do_writepages.filemap_fdatawrite_wbc
>       4.90 =C2=B1  9%      -3.3        1.63 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.btree_csum_one_bio.btrfs_submit_metadata_bio.submit_one_bio=
.btree_write_cache_pages.do_writepages
>       4.88 =C2=B1  9%      -3.2        1.63 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.csum_one_extent_buffer.btree_csum_one_bio.btrfs_submit_meta=
data_bio.submit_one_bio.btree_write_cache_pages
>       2.94 =C2=B1  4%      -1.9        1.08 =C2=B1 28%  perf-profile.call=
trace.cycles-pp.check_leaf.csum_one_extent_buffer.btree_csum_one_bio.btrfs_=
submit_metadata_bio.submit_one_bio
>       3.21 =C2=B1  3%      -1.7        1.52 =C2=B1 25%  perf-profile.call=
trace.cycles-pp.open64
>       3.20 =C2=B1  3%      -1.7        1.52 =C2=B1 25%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
>       3.19 =C2=B1  3%      -1.7        1.51 =C2=B1 25%  perf-profile.call=
trace.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe.op=
en64
>       3.19 =C2=B1  3%      -1.7        1.52 =C2=B1 25%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
>       3.18 =C2=B1  3%      -1.7        1.51 =C2=B1 25%  perf-profile.call=
trace.cycles-pp.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.open64
>       3.14 =C2=B1  3%      -1.6        1.49 =C2=B1 25%  perf-profile.call=
trace.cycles-pp.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>       3.13 =C2=B1  3%      -1.6        1.49 =C2=B1 25%  perf-profile.call=
trace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.do_sys_open.do_sysc=
all_64
>       2.62 =C2=B1 12%      -1.5        1.08 =C2=B1 28%  perf-profile.call=
trace.cycles-pp.worker_thread.kthread.ret_from_fork
>       2.72 =C2=B1 11%      -1.3        1.40 =C2=B1 44%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       2.72 =C2=B1 11%      -1.3        1.40 =C2=B1 44%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       2.24 =C2=B1 12%      -1.3        0.92 =C2=B1 30%  perf-profile.call=
trace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
>       1.96 =C2=B1 11%      -1.3        0.69 =C2=B1 54%  perf-profile.call=
trace.cycles-pp.btrfs_work_helper.process_one_work.worker_thread.kthread.re=
t_from_fork
>       2.37 =C2=B1  3%      -1.2        1.16 =C2=B1 26%  perf-profile.call=
trace.cycles-pp.btrfs_create.path_openat.do_filp_open.do_sys_openat2.do_sys=
_open
>       1.58 =C2=B1  6%      -1.1        0.44 =C2=B1 74%  perf-profile.call=
trace.cycles-pp.start_ordered_ops.btrfs_sync_file.do_fsync.__x64_sys_fsync.=
do_syscall_64
>       1.59 =C2=B1  9%      -1.1        0.45 =C2=B1 73%  perf-profile.call=
trace.cycles-pp.btrfs_finish_ordered_io.btrfs_work_helper.process_one_work.=
worker_thread.kthread
>       2.94 =C2=B1  4%      -1.0        1.92 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.copy_items.btrfs_log_inode.btrfs_log_inode_parent.btrfs_log=
_dentry_safe.btrfs_sync_file
>       1.30 =C2=B1  2%      -1.0        0.32 =C2=B1102%  perf-profile.call=
trace.cycles-pp.btrfs_get_32.check_leaf.csum_one_extent_buffer.btree_csum_o=
ne_bio.btrfs_submit_metadata_bio
>       1.30 =C2=B1  7%      -1.0        0.34 =C2=B1100%  perf-profile.call=
trace.cycles-pp.write
>       1.29 =C2=B1  7%      -1.0        0.33 =C2=B1100%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
>       1.29 =C2=B1  7%      -1.0        0.33 =C2=B1100%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>       1.28 =C2=B1  7%      -1.0        0.33 =C2=B1100%  perf-profile.call=
trace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wri=
te
>       1.27 =C2=B1  7%      -0.9        0.33 =C2=B1100%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.write
>       1.25 =C2=B1  7%      -0.9        0.32 =C2=B1101%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       1.59 =C2=B1  6%      -0.9        0.68 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.btrfs_wait_ordered_range.btrfs_sync_file.do_fsync.__x64_sys=
_fsync.do_syscall_64
>       1.20 =C2=B1  6%      -0.9        0.30 =C2=B1100%  perf-profile.call=
trace.cycles-pp.btrfs_file_write_iter.new_sync_write.vfs_write.ksys_write.d=
o_syscall_64
>       1.19 =C2=B1  6%      -0.9        0.30 =C2=B1100%  perf-profile.call=
trace.cycles-pp.btrfs_buffered_write.btrfs_file_write_iter.new_sync_write.v=
fs_write.ksys_write
>       1.55 =C2=B1  5%      -0.9        0.69 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       1.53 =C2=B1  5%      -0.8        0.68 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_se=
condary
>       0.89 =C2=B1  6%      -0.6        0.33 =C2=B1101%  perf-profile.call=
trace.cycles-pp.btrfs_new_inode.btrfs_create.path_openat.do_filp_open.do_sy=
s_openat2
>       1.93 =C2=B1  2%      -0.5        1.43 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.btrfs_csum_file_blocks.log_csums.copy_items.btrfs_log_inode=
.btrfs_log_inode_parent
>       1.93 =C2=B1  2%      -0.5        1.43 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.log_csums.copy_items.btrfs_log_inode.btrfs_log_inode_parent=
.btrfs_log_dentry_safe
>       1.27 =C2=B1  3%      -0.2        1.05 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_lookup_csum.btrfs_csum_file_blocks.log_csums.copy_ite=
ms.btrfs_log_inode
>       1.26 =C2=B1  3%      -0.2        1.05 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_search_slot.btrfs_lookup_csum.btrfs_csum_file_blocks.=
log_csums.copy_items
>       1.49 =C2=B1  9%      +0.2        1.72 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_ti=
mer_interrupt.cpuidle_enter_state.cpuidle_enter
>       6.84 =C2=B1  3%      +1.3        8.16 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.btrfs_log_inode.btrfs_log_inode_parent.btrfs_log_dentry_saf=
e.btrfs_sync_file.do_fsync
>       0.36 =C2=B1 71%      +1.4        1.78 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.btrfs_alloc_tree_block.__btrfs_cow_block.btrfs_cow_block.bt=
rfs_search_slot.btrfs_truncate_inode_items
>       5.75 =C2=B1  4%      +1.5        7.27 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.btrfs_write_marked_extents.btrfs_sync_log.btrfs_sync_file.d=
o_fsync.__x64_sys_fsync
>       0.00            +1.6        1.56 =C2=B1 22%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.set_extent_bit.b=
trfs_alloc_tree_block.__btrfs_cow_block
>       0.00            +1.6        1.57 =C2=B1 22%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.set_extent_bit.btrfs_alloc_tree_block.__btrfs_cow=
_block.btrfs_cow_block
>       0.00            +1.6        1.61 =C2=B1 22%  perf-profile.calltrace=
.cycles-pp.set_extent_bit.btrfs_alloc_tree_block.__btrfs_cow_block.btrfs_co=
w_block.btrfs_search_slot
>       0.00            +2.1        2.08 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__clear_extent_b=
it.clear_extent_bit.delete_tree_block
>       0.00            +2.1        2.09 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.__clear_extent_bit.clear_extent_bit.delete_tree_b=
lock.__btrfs_cow_block
>       0.00            +2.1        2.12 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.__clear_extent_bit.clear_extent_bit.delete_tree_block.__btrfs_co=
w_block.btrfs_cow_block
>       0.00            +2.1        2.12 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.clear_extent_bit.delete_tree_block.__btrfs_cow_block.btrfs_cow_b=
lock.btrfs_search_slot
>       1.10 =C2=B1  6%      +2.2        3.26 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.mutex_spin_on_owner.__mutex_lock.btrfs_log_inode_parent.btr=
fs_log_dentry_safe.btrfs_sync_file
>       0.00            +2.2        2.18 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.delete_tree_block.__btrfs_cow_block.btrfs_cow_block.btrfs_search=
_slot.btrfs_truncate_inode_items
>       1.78 =C2=B1  3%      +2.6        4.36 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.btrfs_cow_block.btrfs_search_slot.btrfs_truncate_inode_item=
s.truncate_inode_items.btrfs_log_inode
>       1.77 =C2=B1  3%      +2.6        4.36 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__btrfs_cow_block.btrfs_cow_block.btrfs_search_slot.btrfs_t=
runcate_inode_items.truncate_inode_items
>       0.71 =C2=B1  4%      +2.8        3.49 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.osq_lock.__mutex_lock.btrfs_log_inode_parent.btrfs_log_dent=
ry_safe.btrfs_sync_file
>       2.89 =C2=B1  3%      +2.8        5.72 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.btrfs_truncate_inode_items.truncate_inode_items.btrfs_log_i=
node.btrfs_log_inode_parent.btrfs_log_dentry_safe
>       2.89 =C2=B1  3%      +2.8        5.72 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.truncate_inode_items.btrfs_log_inode.btrfs_log_inode_parent=
.btrfs_log_dentry_safe.btrfs_sync_file
>       2.83 =C2=B1  3%      +2.8        5.68 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.btrfs_search_slot.btrfs_truncate_inode_items.truncate_inode=
_items.btrfs_log_inode.btrfs_log_inode_parent
>       0.00            +4.0        3.95 =C2=B1 17%  perf-profile.calltrace=
.cycles-pp.rb_next.find_first_extent_bit_state.find_first_extent_bit.__btrf=
s_wait_marked_extents.btrfs_wait_tree_log_extents
>       0.00            +4.0        4.04 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.rb_next.find_first_extent_bit_state.find_first_extent_bit.btrfs_=
write_marked_extents.btrfs_sync_log
>       0.68 =C2=B1  6%      +4.6        5.31 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.btrfs_wait_tree_log_extents.btrfs_sync_log.btrfs_sync_file.=
do_fsync.__x64_sys_fsync
>       0.68 =C2=B1  7%      +4.6        5.31 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.__btrfs_wait_marked_extents.btrfs_wait_tree_log_extents.btr=
fs_sync_log.btrfs_sync_file.do_fsync
>       1.83 =C2=B1  5%      +4.9        6.76 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.__mutex_lock.btrfs_log_inode_parent.btrfs_log_dentry_safe.b=
trfs_sync_file.do_fsync
>       0.00            +5.2        5.16 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.find_first_extent_bit_state.find_first_extent_bit.__btrfs_wait_m=
arked_extents.btrfs_wait_tree_log_extents.btrfs_sync_log
>       0.00            +5.2        5.18 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.find_first_extent_bit.__btrfs_wait_marked_extents.btrfs_wait_tre=
e_log_extents.btrfs_sync_log.btrfs_sync_file
>       0.00            +5.2        5.18 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.find_first_extent_bit_state.find_first_extent_bit.btrfs_write_ma=
rked_extents.btrfs_sync_log.btrfs_sync_file
>       0.00            +5.2        5.20 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.find_first_extent_bit.btrfs_write_marked_extents.btrfs_sync_log.=
btrfs_sync_file.do_fsync
>      12.75 =C2=B1  3%      +5.5       18.25 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.btrfs_sync_log.btrfs_sync_file.do_fsync.__x64_sys_fsync.do_=
syscall_64
>       8.80 =C2=B1  3%      +6.2       15.01 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.btrfs_log_dentry_safe.btrfs_sync_file.do_fsync.__x64_sys_fs=
ync.do_syscall_64
>       8.79 =C2=B1  3%      +6.2       15.00 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.btrfs_log_inode_parent.btrfs_log_dentry_safe.btrfs_sync_fil=
e.do_fsync.__x64_sys_fsync
>      26.42 =C2=B1  3%      +8.4       34.83 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.fsync
>      26.33 =C2=B1  3%      +8.5       34.79 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.fsync
>      26.32 =C2=B1  3%      +8.5       34.78 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.fsync
>      26.30 =C2=B1  3%      +8.5       34.77 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.fsync
>      26.29 =C2=B1  3%      +8.5       34.76 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.btrfs_sync_file.do_fsync.__x64_sys_fsync.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>      26.30 =C2=B1  3%      +8.5       34.77 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.do_fsync.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.fsync
>       7.77 =C2=B1  4%      -5.1        2.72 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.do_writepages
>       7.76 =C2=B1  4%      -5.0        2.72 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.filemap_fdatawrite_range
>       7.75 =C2=B1  4%      -5.0        2.71 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.filemap_fdatawrite_wbc
>      62.31 =C2=B1  2%      -4.2       58.15 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.start_secondary
>       6.22 =C2=B1  4%      -4.1        2.15 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btree_write_cache_pages
>       5.00 =C2=B1  5%      -4.0        1.03 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.poll_idle
>      62.50 =C2=B1  2%      -3.8       58.73 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.do_idle
>      62.50 =C2=B1  2%      -3.8       58.74 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>      62.50 =C2=B1  2%      -3.8       58.74 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>       5.65 =C2=B1  4%      -3.7        1.97 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.submit_one_bio
>       5.33 =C2=B1  5%      -3.5        1.83 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.btrfs_submit_metadata_bio
>       5.14 =C2=B1  5%      -3.4        1.74 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.btree_csum_one_bio
>       5.12 =C2=B1  5%      -3.4        1.73 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.csum_one_extent_buffer
>       6.04 =C2=B1  4%      -3.1        2.96 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.perf_tp_event
>       5.72 =C2=B1  4%      -3.0        2.72 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__schedule
>       5.88 =C2=B1  4%      -3.0        2.89 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.perf_swevent_overflow
>       5.86 =C2=B1  3%      -3.0        2.88 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__perf_event_overflow
>       5.84 =C2=B1  3%      -3.0        2.87 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.perf_event_output_forward
>       5.05 =C2=B1  3%      -2.5        2.52 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.perf_prepare_sample
>       4.79 =C2=B1  3%      -2.4        2.41 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.perf_callchain
>       4.78 =C2=B1  3%      -2.4        2.40 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.get_perf_callchain
>       3.42 =C2=B1  3%      -2.2        1.18 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.check_leaf
>       4.18 =C2=B1  3%      -2.2        2.02 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.schedule
>       3.92 =C2=B1  3%      -1.9        1.97 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.perf_callchain_kernel
>       3.21 =C2=B1  3%      -1.7        1.52 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.open64
>       3.22 =C2=B1  3%      -1.7        1.57 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.do_sys_open
>       3.22 =C2=B1  3%      -1.6        1.57 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.do_sys_openat2
>       3.17 =C2=B1  3%      -1.6        1.54 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       3.16 =C2=B1  3%      -1.6        1.54 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.path_openat
>       2.50 =C2=B1  9%      -1.6        0.93 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.asm_common_interrupt
>       2.49 =C2=B1  9%      -1.6        0.92 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.common_interrupt
>       2.62 =C2=B1 12%      -1.5        1.08 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       2.42 =C2=B1  9%      -1.5        0.90 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__common_interrupt
>       2.42 =C2=B1  9%      -1.5        0.90 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.handle_edge_irq
>       2.40 =C2=B1  9%      -1.5        0.88 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.handle_irq_event
>       2.39 =C2=B1  9%      -1.5        0.88 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.handle_irq_event_percpu
>       2.36 =C2=B1  9%      -1.5        0.87 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__handle_irq_event_percpu
>       3.01 =C2=B1  3%      -1.5        1.52 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.unwind_next_frame
>       2.35 =C2=B1  9%      -1.5        0.87 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.nvme_irq
>       2.61 =C2=B1  6%      -1.4        1.19 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       2.22 =C2=B1  9%      -1.4        0.82 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.blk_mq_end_request_batch
>       2.14 =C2=B1 10%      -1.4        0.79 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.blk_update_request
>       2.60 =C2=B1  8%      -1.3        1.27 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.btrfs_insert_empty_items
>       2.73 =C2=B1 11%      -1.3        1.40 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       2.72 =C2=B1 11%      -1.3        1.40 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.kthread
>       2.24 =C2=B1 12%      -1.3        0.92 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       2.34 =C2=B1  4%      -1.3        1.05 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_switch
>       2.37 =C2=B1  3%      -1.2        1.16 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.btrfs_create
>       1.96 =C2=B1 11%      -1.2        0.77 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.btrfs_work_helper
>       1.86 =C2=B1 10%      -1.2        0.68 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_end_bio
>       1.72 =C2=B1  6%      -1.2        0.54 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.read_extent_buffer
>       1.86 =C2=B1  4%      -1.1        0.72 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.folio_wait_bit
>       1.73 =C2=B1  2%      -1.1        0.62 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.btrfs_get_32
>       1.67 =C2=B1  6%      -1.1        0.55 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__filemap_fdatawait_range
>       1.67 =C2=B1  6%      -1.1        0.56 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.filemap_fdatawait_range
>       1.80 =C2=B1  4%      -1.1        0.69 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.io_schedule
>       2.12 =C2=B1  4%      -1.1        1.03 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.dequeue_task_fair
>       1.72 =C2=B1  9%      -1.1        0.65 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>       2.09 =C2=B1  4%      -1.1        1.02 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       1.39 =C2=B1 21%      -1.0        0.34 =C2=B1113%  perf-profile.chil=
dren.cycles-pp.btrfs_commit_transaction
>       2.95 =C2=B1  4%      -1.0        1.92 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.copy_items
>       1.55 =C2=B1  6%      -1.0        0.53 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.folio_wait_writeback
>       1.59 =C2=B1  9%      -1.0        0.60 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.btrfs_finish_ordered_io
>       1.58 =C2=B1  6%      -1.0        0.60 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.start_ordered_ops
>       1.85 =C2=B1  6%      -1.0        0.87 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_wakeup_template
>       1.52 =C2=B1  6%      -1.0        0.56 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.extent_writepages
>       1.52 =C2=B1  6%      -1.0        0.56 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.btrfs_fdatawrite_range
>       1.69 =C2=B1  7%      -0.9        0.76 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.ksys_write
>       2.08 =C2=B1  4%      -0.9        1.16 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.update_curr
>       1.68 =C2=B1  7%      -0.9        0.76 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       1.59 =C2=B1  6%      -0.9        0.68 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_wait_ordered_range
>       1.66 =C2=B1  7%      -0.9        0.74 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>       1.95 =C2=B1  4%      -0.9        1.09 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_stat_runtime
>       1.55 =C2=B1  5%      -0.9        0.70 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       1.22 =C2=B1  7%      -0.9        0.36 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_check_node
>       1.27 =C2=B1 11%      -0.8        0.43 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.folio_end_writeback
>       1.18 =C2=B1  2%      -0.8        0.40 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.copy_extent_buffer_full
>       1.19 =C2=B1  9%      -0.8        0.41 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.extent_write_cache_pages
>       1.18 =C2=B1  2%      -0.8        0.40 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.copy_page
>       1.30 =C2=B1  7%      -0.8        0.54 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.write
>       1.20 =C2=B1  6%      -0.7        0.49 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btrfs_file_write_iter
>       1.11 =C2=B1 10%      -0.7        0.40 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.read_block_for_search
>       1.19 =C2=B1  6%      -0.7        0.49 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btrfs_buffered_write
>       1.09 =C2=B1 11%      -0.7        0.39 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.folio_wake_bit
>       1.01 =C2=B1 10%      -0.7        0.34 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.__extent_writepage
>       1.04 =C2=B1 11%      -0.7        0.38 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.wake_page_function
>       2.15 =C2=B1  3%      -0.6        1.50 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.btrfs_csum_file_blocks
>       1.00 =C2=B1  6%      -0.6        0.36 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btrfs_add_link
>       1.15 =C2=B1  7%      -0.6        0.52 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__unwind_start
>       0.96 =C2=B1  6%      -0.6        0.33 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.find_extent_buffer
>       0.96 =C2=B1  6%      -0.6        0.34 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_insert_dir_item
>       1.12 =C2=B1 11%      -0.6        0.50 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.end_bio_extent_writepage
>       1.26 =C2=B1  2%      -0.6        0.68 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__orc_find
>       0.79 =C2=B1 11%      -0.6        0.23 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.writepage_delalloc
>       0.80 =C2=B1  8%      -0.5        0.26 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.insert_with_overflow
>       0.73 =C2=B1  7%      -0.5        0.20 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_reserve_extent
>       0.66 =C2=B1 12%      -0.5        0.15 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.end_bio_extent_buffer_writepage
>       0.69 =C2=B1 11%      -0.5        0.19 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btrfs_run_delalloc_range
>       1.93 =C2=B1  2%      -0.5        1.43 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.log_csums
>       0.68 =C2=B1 10%      -0.5        0.18 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.cow_file_range
>       0.77 =C2=B1  6%      -0.5        0.28 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.find_extent_buffer_nolock
>       0.67 =C2=B1  7%      -0.5        0.18 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.find_free_extent
>       1.02 =C2=B1  5%      -0.5        0.55 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.orc_find
>       0.56 =C2=B1  8%      -0.4        0.12 =C2=B1119%  perf-profile.chil=
dren.cycles-pp.btrfs_write_and_wait_transaction
>       0.66 =C2=B1  6%      -0.4        0.23 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.setup_items_for_insert
>       0.71 =C2=B1 11%      -0.4        0.28 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.insert_reserved_file_extent
>       0.70 =C2=B1  8%      -0.4        0.28 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>       0.66 =C2=B1  5%      -0.4        0.26 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.generic_bin_search
>       0.67 =C2=B1  6%      -0.4        0.26 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_match_dir
>       0.79 =C2=B1  3%      -0.4        0.39 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.perf_callchain_user
>       0.62 =C2=B1  7%      -0.4        0.23 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_comp_cpu_keys
>       0.66 =C2=B1  9%      -0.4        0.26 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.autoremove_wake_function
>       0.62 =C2=B1  4%      -0.4        0.22 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.write_one_eb
>       0.42 =C2=B1 18%      -0.4        0.03 =C2=B1103%  perf-profile.chil=
dren.cycles-pp.__irqentry_text_start
>       0.58 =C2=B1  5%      -0.4        0.19 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.check_setget_bounds
>       0.75 =C2=B1  4%      -0.4        0.37 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__get_user_nocheck_8
>       1.12 =C2=B1  6%      -0.4        0.76 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__btrfs_tree_read_lock
>       0.66 =C2=B1  4%      -0.3        0.31 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_update_root
>       0.63 =C2=B1  8%      -0.3        0.28 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.perf_output_sample
>       0.89 =C2=B1  6%      -0.3        0.55 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.btrfs_new_inode
>       0.78 =C2=B1  5%      -0.3        0.44 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.btrfs_read_lock_root_node
>       0.55 =C2=B1  6%      -0.3        0.21 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_dir_item
>       0.80 =C2=B1  8%      -0.3        0.48 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.51 =C2=B1  6%      -0.3        0.20 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.folio_mark_dirty
>       0.49 =C2=B1  6%      -0.3        0.18 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.__set_page_dirty_nobuffers
>       1.40 =C2=B1  3%      -0.3        1.09 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_csum
>       0.61 =C2=B1  8%      -0.3        0.31 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.unwind_get_return_address
>       0.47 =C2=B1 10%      -0.3        0.16 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.btrfs_get_64
>       0.48 =C2=B1  7%      -0.3        0.18 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.filemap_dirty_folio
>       0.69 =C2=B1  3%      -0.3        0.39 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.asm_exc_page_fault
>       0.42 =C2=B1  9%      -0.3        0.12 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.down_read
>       0.47 =C2=B1 10%      -0.3        0.18 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.crc32c_pcl_intel_update
>       0.48 =C2=B1  5%      -0.3        0.19 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_mark_buffer_dirty
>       0.46 =C2=B1 12%      -0.3        0.18 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.csum_tree_block
>       0.53 =C2=B1  6%      -0.3        0.25 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       0.45 =C2=B1  5%      -0.3        0.18 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.btrfs_start_ordered_extent
>       0.56 =C2=B1  8%      -0.3        0.29 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__kernel_text_address
>       0.44 =C2=B1  5%      -0.3        0.18 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.set_extent_buffer_dirty
>       0.46 =C2=B1 22%      -0.3        0.20 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.pagecache_get_page
>       0.54 =C2=B1  5%      -0.3        0.28 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.btrfs_release_path
>       0.45 =C2=B1 23%      -0.3        0.19 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.__filemap_get_folio
>       0.42 =C2=B1 21%      -0.3        0.16 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.alloc_extent_buffer
>       0.43 =C2=B1 13%      -0.3        0.18 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.btrfs_drop_extents
>       0.44 =C2=B1  5%      -0.3        0.19 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.queue_work_on
>       0.44 =C2=B1  5%      -0.2        0.19 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.__queue_work
>       0.42 =C2=B1  7%      -0.2        0.18 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.perf_output_copy
>       0.42 =C2=B1  8%      -0.2        0.18 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.end_extent_writepage
>       0.49 =C2=B1  9%      -0.2        0.26 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.kernel_text_address
>       0.42 =C2=B1  8%      -0.2        0.18 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.btrfs_mark_ordered_io_finished
>       0.38 =C2=B1 11%      -0.2        0.15 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__radix_tree_lookup
>       0.91 =C2=B1  8%      -0.2        0.68 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.rwsem_down_read_slowpath
>       0.41 =C2=B1  9%      -0.2        0.18 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.memcpy_erms
>       0.34 =C2=B1 13%      -0.2        0.11 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.__folio_end_writeback
>       0.42 =C2=B1 10%      -0.2        0.19 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.split_leaf
>       0.32 =C2=B1 10%      -0.2        0.10 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.btrfs_free_tree_block
>       0.32 =C2=B1  7%      -0.2        0.11 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.btrfs_dirty_pages
>       0.34 =C2=B1  6%      -0.2        0.14 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup
>       0.50 =C2=B1  6%      -0.2        0.29 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.write_all_supers
>       0.34 =C2=B1  6%      -0.2        0.14 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_dentry
>       0.37 =C2=B1 11%      -0.2        0.17 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.copy_page_from_iter_atomic
>       0.31 =C2=B1  7%      -0.2        0.12 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.btrfs_check_ref_name_override
>       0.35 =C2=B1  9%      -0.2        0.16 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       0.36 =C2=B1 11%      -0.2        0.16 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.copy_user_enhanced_fast_string
>       0.36 =C2=B1 11%      -0.2        0.16 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.copyin
>       0.36 =C2=B1 11%      -0.2        0.18 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_map_bio
>       0.22 =C2=B1 13%      -0.2        0.04 =C2=B1106%  perf-profile.chil=
dren.cycles-pp.check_dir_item
>       0.41 =C2=B1  9%      -0.2        0.23 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.__libc_write
>       0.30 =C2=B1 17%      -0.2        0.12 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_file_extent
>       0.22 =C2=B1  7%      -0.2        0.04 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_csums_range
>       0.41 =C2=B1  9%      -0.2        0.23 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.generic_file_write_iter
>       0.41 =C2=B1  9%      -0.2        0.23 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       0.41 =C2=B1  9%      -0.2        0.23 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       0.33 =C2=B1  9%      -0.2        0.16 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       0.32 =C2=B1 10%      -0.2        0.15 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.pick_next_task_fair
>       0.31 =C2=B1 11%      -0.2        0.14 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_submit_data_bio
>       0.29 =C2=B1  7%      -0.2        0.12 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.prepare_pages
>       0.28 =C2=B1 10%      -0.2        0.10 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__folio_mark_dirty
>       0.38 =C2=B1 12%      -0.2        0.21 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.btrfs_next_old_leaf
>       0.25 =C2=B1  5%      -0.2        0.08 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__folio_start_writeback
>       0.26 =C2=B1 12%      -0.2        0.09 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.check_extent_data_item
>       0.30 =C2=B1  6%      -0.2        0.14 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.btrfs_update_inode
>       0.22 =C2=B1 21%      -0.2        0.06 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.memmove
>       0.32 =C2=B1 18%      -0.2        0.16 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__module_address
>       0.25 =C2=B1  7%      -0.2        0.10 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.pin_down_extent
>       0.22 =C2=B1 16%      -0.2        0.07 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__reserve_bytes
>       0.22 =C2=B1  8%      -0.2        0.07 =C2=B1 58%  perf-profile.chil=
dren.cycles-pp.btrfs_set_token_32
>       0.30 =C2=B1  7%      -0.1        0.16 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_search_forward
>       0.26 =C2=B1  6%      -0.1        0.12 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.btrfs_delayed_update_inode
>       0.22 =C2=B1 18%      -0.1        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_reserve_metadata_bytes
>       0.29 =C2=B1 11%      -0.1        0.14 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.submit_bio_noacct
>       0.20 =C2=B1 12%      -0.1        0.06 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.push_leaf_right
>       0.20 =C2=B1 31%      -0.1        0.06 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.filemap_add_folio
>       0.26 =C2=B1 11%      -0.1        0.12 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       0.18 =C2=B1 23%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.mark_extent_buffer_accessed
>       0.23 =C2=B1 13%      -0.1        0.09 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.btrfs_end_super_write
>       0.28 =C2=B1 10%      -0.1        0.14 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.blk_mq_submit_bio
>       0.19 =C2=B1 12%      -0.1        0.05 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.memcpy_extent_buffer
>       0.17 =C2=B1 12%      -0.1        0.04 =C2=B1101%  perf-profile.chil=
dren.cycles-pp.btrfs_get_token_32
>       0.19 =C2=B1 30%      -0.1        0.05 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.__filemap_add_folio
>       0.19 =C2=B1 14%      -0.1        0.06 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.btrfs_root_node
>       0.29 =C2=B1 13%      -0.1        0.16 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.24 =C2=B1 14%      -0.1        0.11 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.btrfs_write_check
>       0.22 =C2=B1  5%      -0.1        0.10 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.stack_access_ok
>       0.21 =C2=B1  7%      -0.1        0.09 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.start_transaction
>       0.17 =C2=B1  2%      -0.1        0.05 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.folio_clear_dirty_for_io
>       0.16 =C2=B1 27%      -0.1        0.04 =C2=B1101%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_inode
>       0.16 =C2=B1 20%      -0.1        0.03 =C2=B1103%  perf-profile.chil=
dren.cycles-pp.block_group_cache_tree_search
>       0.20 =C2=B1 16%      -0.1        0.08 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.xas_load
>       0.30 =C2=B1 12%      -0.1        0.17 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.find_next_csum_offset
>       0.22 =C2=B1 12%      -0.1        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.dentry_needs_remove_privs
>       0.22 =C2=B1 14%      -0.1        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.file_remove_privs
>       0.19 =C2=B1 10%      -0.1        0.07 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.btrfs_copy_from_user
>       0.24 =C2=B1  9%      -0.1        0.12 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.__poll
>       0.24 =C2=B1  9%      -0.1        0.12 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.__x64_sys_poll
>       0.24 =C2=B1  9%      -0.1        0.12 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.do_sys_poll
>       0.20 =C2=B1 11%      -0.1        0.09 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.free_extent_buffer
>       0.21 =C2=B1 13%      -0.1        0.09 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.cap_inode_need_killpriv
>       0.14 =C2=B1 11%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.find_get_pages_range_tag
>       0.24 =C2=B1 20%      -0.1        0.13 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.is_module_text_address
>       0.21 =C2=B1 13%      -0.1        0.10 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.security_inode_need_killpriv
>       0.15 =C2=B1 19%      -0.1        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.__push_leaf_right
>       0.18 =C2=B1  5%      -0.1        0.07 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.down_write
>       0.14 =C2=B1 17%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.read_tree_block
>       0.20 =C2=B1 13%      -0.1        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__vfs_getxattr
>       0.20 =C2=B1 10%      -0.1        0.09 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.submit_extent_page
>       0.15 =C2=B1 12%      -0.1        0.04 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.pagevec_lookup_range_tag
>       0.16 =C2=B1 12%      -0.1        0.04 =C2=B1 75%  perf-profile.chil=
dren.cycles-pp.nvme_queue_rq
>       0.14 =C2=B1 19%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.btrfs_read_node_slot
>       0.22 =C2=B1 21%      -0.1        0.11 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.__module_text_address
>       0.16 =C2=B1 13%      -0.1        0.05 =C2=B1 74%  perf-profile.chil=
dren.cycles-pp.blk_mq_flush_plug_list
>       0.16 =C2=B1 13%      -0.1        0.05 =C2=B1 74%  perf-profile.chil=
dren.cycles-pp.blk_flush_plug
>       0.16 =C2=B1 12%      -0.1        0.06 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.__blk_mq_try_issue_directly
>       0.23 =C2=B1  8%      -0.1        0.12 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.btrfs_free_path
>       0.17 =C2=B1 17%      -0.1        0.07 =C2=B1 53%  perf-profile.chil=
dren.cycles-pp.__mod_lruvec_page_state
>       0.23 =C2=B1  9%      -0.1        0.13 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.20 =C2=B1 13%      -0.1        0.10 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.__extent_writepage_io
>       0.21 =C2=B1  7%      -0.1        0.10 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.mkdir
>       0.15 =C2=B1 13%      -0.1        0.05 =C2=B1 75%  perf-profile.chil=
dren.cycles-pp.blk_mq_request_issue_directly
>       0.13 =C2=B1  7%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.inode_tree_add
>       0.17 =C2=B1  4%      -0.1        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__might_resched
>       0.18 =C2=B1 13%      -0.1        0.08 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.btrfs_getxattr
>       0.14 =C2=B1  9%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.btrfs_csum_one_bio
>       0.14 =C2=B1 15%      -0.1        0.04 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.alloc_extent_state
>       0.16 =C2=B1 10%      -0.1        0.07 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.blk_finish_plug
>       0.12 =C2=B1 10%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.__crc32c_pcl_intel_finup
>       0.12 =C2=B1 27%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.btrfs_insert_delayed_dir_index
>       0.15 =C2=B1 13%      -0.1        0.06 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.__perf_event_header__init_id
>       0.19 =C2=B1  6%      -0.1        0.10 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__x64_sys_mkdir
>       0.13 =C2=B1 17%      -0.1        0.04 =C2=B1 75%  perf-profile.chil=
dren.cycles-pp.find_free_extent_clustered
>       0.16 =C2=B1  3%      -0.1        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.insert_state
>       0.12 =C2=B1  9%      -0.1        0.03 =C2=B1103%  perf-profile.chil=
dren.cycles-pp.btrfs_get_or_create_delayed_node
>       0.18 =C2=B1 14%      -0.1        0.09 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__close
>       0.11 =C2=B1 31%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.__raw_callee_save___native_queued_spin_unlock
>       0.12 =C2=B1  8%      -0.1        0.03 =C2=B1105%  perf-profile.chil=
dren.cycles-pp.btrfs_leaf_free_space
>       0.19 =C2=B1  8%      -0.1        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.mutex_lock
>       0.18 =C2=B1  7%      -0.1        0.10 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.release_extent_buffer
>       0.15 =C2=B1 13%      -0.1        0.07 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.___slab_alloc
>       0.14 =C2=B1 17%      -0.1        0.06 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.select_task_rq_fair
>       0.15 =C2=B1 14%      -0.1        0.07 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__slab_alloc
>       0.15 =C2=B1 14%      -0.1        0.07 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_xattr
>       0.11 =C2=B1  5%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.___perf_sw_event
>       0.14 =C2=B1  4%      -0.1        0.06 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.13 =C2=B1  7%      -0.1        0.05 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.memzero_extent_buffer
>       0.11 =C2=B1 15%      -0.1        0.03 =C2=B1102%  perf-profile.chil=
dren.cycles-pp.get_page_from_freelist
>       0.16 =C2=B1  8%      -0.1        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.do_mkdirat
>       0.16 =C2=B1 10%      -0.1        0.09 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode
>       0.12 =C2=B1 23%      -0.1        0.04 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.btrfs_alloc_from_cluster
>       0.19 =C2=B1  7%      -0.1        0.11 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.__etree_search
>       0.12 =C2=B1 12%      -0.1        0.04 =C2=B1101%  perf-profile.chil=
dren.cycles-pp.new_inode
>       0.13 =C2=B1 18%      -0.1        0.06 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_call_function_single
>       0.14 =C2=B1 10%      -0.1        0.07 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       0.14 =C2=B1 19%      -0.1        0.06 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__alloc_pages
>       0.15 =C2=B1 10%      -0.1        0.08 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.filename_create
>       0.10 =C2=B1 11%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.dput
>       0.26 =C2=B1  9%      -0.1        0.19 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.exc_page_fault
>       0.10 =C2=B1  7%      -0.1        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.mutex_unlock
>       0.10 =C2=B1  8%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.allocate_slab
>       0.11 =C2=B1 15%      -0.1        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.kernelmode_fixup_or_oops
>       0.15 =C2=B1  9%      -0.1        0.08 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.perf_poll
>       0.10 =C2=B1 10%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.btrfs_alloc_reserved_file_extent
>       0.15 =C2=B1 11%      -0.1        0.08 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       0.10 =C2=B1  8%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.__cond_resched
>       0.12 =C2=B1 11%      -0.1        0.05 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.__vsprintf_chk
>       0.20 =C2=B1 13%      -0.1        0.13 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.unlock_up
>       0.14 =C2=B1 14%      -0.1        0.07 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.write_dev_supers
>       0.12 =C2=B1  9%      -0.1        0.05 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.filename_parentat
>       0.10 =C2=B1 10%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.btrfs_add_delayed_data_ref
>       0.10 =C2=B1 12%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.shmem_getpage_gfp
>       0.10 =C2=B1 12%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.shmem_write_begin
>       0.11 =C2=B1 15%      -0.1        0.05 =C2=B1 76%  perf-profile.chil=
dren.cycles-pp.new_inode_pseudo
>       0.11 =C2=B1  9%      -0.1        0.05 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.path_parentat
>       0.10 =C2=B1 17%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.sysvec_call_function_single
>       0.09 =C2=B1 13%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.clear_state_bit
>       0.23 =C2=B1  5%      -0.1        0.17 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_log_all_xattrs
>       0.10 =C2=B1 13%      -0.1        0.05 =C2=B1 75%  perf-profile.chil=
dren.cycles-pp.alloc_inode
>       0.08 =C2=B1 17%      -0.1        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.vfprintf
>       0.09 =C2=B1 15%      -0.1        0.04 =C2=B1 75%  perf-profile.chil=
dren.cycles-pp.up_write
>       0.12 =C2=B1 14%      -0.1        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.task_work_run
>       0.10 =C2=B1 11%      -0.0        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.__fput
>       0.08 =C2=B1 13%      -0.0        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.do_open
>       0.11 =C2=B1 22%      -0.0        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.push_leaf_left
>       0.14 =C2=B1 10%      -0.0        0.11 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.link_path_walk
>       0.18 =C2=B1  9%      +0.1        0.24 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.task_tick_fair
>       0.95 =C2=B1 14%      +0.3        1.24 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.62 =C2=B1  6%      +0.4        1.02 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.rwsem_spin_on_owner
>       6.31 =C2=B1  4%      +1.1        7.38 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_write_marked_extents
>       6.84 =C2=B1  3%      +1.3        8.16 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.btrfs_log_inode
>       0.95 =C2=B1 11%      +1.4        2.30 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_alloc_tree_block
>       0.50 =C2=B1  6%      +1.6        2.11 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.set_extent_bit
>       0.21 =C2=B1  9%      +2.1        2.28 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__clear_extent_bit
>       0.16 =C2=B1  5%      +2.1        2.26 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.clear_extent_bit
>       3.14 =C2=B1  3%      +2.2        5.30 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.btrfs_cow_block
>       3.12 =C2=B1  3%      +2.2        5.29 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__btrfs_cow_block
>       0.00            +2.3        2.32 =C2=B1 10%  perf-profile.children.=
cycles-pp.delete_tree_block
>       3.43 =C2=B1  3%      +2.5        5.93 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.mutex_spin_on_owner
>       2.89 =C2=B1  3%      +2.8        5.72 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_truncate_inode_items
>       2.89 =C2=B1  3%      +2.8        5.72 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.truncate_inode_items
>       2.35 =C2=B1  4%      +3.3        5.64 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.osq_lock
>       1.58 =C2=B1  6%      +3.3        4.90 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       0.30 =C2=B1 16%      +3.9        4.20 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       0.68 =C2=B1  6%      +4.6        5.31 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_wait_tree_log_extents
>       0.68 =C2=B1  6%      +4.6        5.31 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__btrfs_wait_marked_extents
>      12.75 =C2=B1  3%      +5.5       18.25 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.btrfs_sync_log
>      32.39 =C2=B1  3%      +5.6       38.03 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>      32.38 =C2=B1  3%      +5.6       38.02 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       5.70 =C2=B1  3%      +5.7       11.38 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.__mutex_lock
>       8.80 =C2=B1  3%      +6.2       15.01 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.btrfs_log_dentry_safe
>       8.79 =C2=B1  3%      +6.2       15.00 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.btrfs_log_inode_parent
>       0.12 =C2=B1 32%      +8.2        8.32 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.rb_next
>      26.42 =C2=B1  3%      +8.4       34.83 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.fsync
>      26.30 =C2=B1  3%      +8.5       34.76 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_sync_file
>      26.30 =C2=B1  3%      +8.5       34.77 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__x64_sys_fsync
>      26.30 =C2=B1  3%      +8.5       34.77 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.do_fsync
>       0.09 =C2=B1 10%     +10.3       10.39 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.find_first_extent_bit
>       0.02 =C2=B1142%     +10.4       10.38 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.find_first_extent_bit_state
>       4.06 =C2=B1  5%      -3.3        0.78 =C2=B1 41%  perf-profile.self=
.cycles-pp.poll_idle
>       1.64 =C2=B1  5%      -1.1        0.52 =C2=B1 22%  perf-profile.self=
.cycles-pp.read_extent_buffer
>       1.32 =C2=B1  2%      -0.9        0.45 =C2=B1 32%  perf-profile.self=
.cycles-pp.btrfs_get_32
>       1.15 =C2=B1  3%      -0.8        0.39 =C2=B1 22%  perf-profile.self=
.cycles-pp.copy_page
>       1.36 =C2=B1  4%      -0.6        0.71 =C2=B1 18%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       1.26 =C2=B1  2%      -0.6        0.68 =C2=B1 17%  perf-profile.self=
.cycles-pp.__orc_find
>       1.00 =C2=B1  9%      -0.5        0.47 =C2=B1 23%  perf-profile.self=
.cycles-pp.unwind_next_frame
>       0.63 =C2=B1  5%      -0.4        0.22 =C2=B1 25%  perf-profile.self=
.cycles-pp.check_leaf
>       0.58 =C2=B1  8%      -0.4        0.21 =C2=B1 23%  perf-profile.self=
.cycles-pp.btrfs_comp_cpu_keys
>       0.52 =C2=B1  4%      -0.3        0.17 =C2=B1 28%  perf-profile.self=
.cycles-pp.check_setget_bounds
>       0.40 =C2=B1  9%      -0.3        0.14 =C2=B1 19%  perf-profile.self=
.cycles-pp.find_extent_buffer_nolock
>       0.68 =C2=B1  9%      -0.3        0.43 =C2=B1 23%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.35 =C2=B1 10%      -0.2        0.10 =C2=B1 27%  perf-profile.self=
.cycles-pp.down_read
>       0.42 =C2=B1  6%      -0.2        0.20 =C2=B1 27%  perf-profile.self=
.cycles-pp.__get_user_nocheck_8
>       0.40 =C2=B1  9%      -0.2        0.17 =C2=B1 24%  perf-profile.self=
.cycles-pp.memcpy_erms
>       0.37 =C2=B1 11%      -0.2        0.15 =C2=B1 23%  perf-profile.self=
.cycles-pp.__radix_tree_lookup
>       0.34 =C2=B1  6%      -0.2        0.13 =C2=B1 26%  perf-profile.self=
.cycles-pp.btrfs_get_64
>       0.35 =C2=B1 11%      -0.2        0.16 =C2=B1 28%  perf-profile.self=
.cycles-pp.copy_user_enhanced_fast_string
>       0.29 =C2=B1  8%      -0.2        0.12 =C2=B1 22%  perf-profile.self=
.cycles-pp.generic_bin_search
>       0.28 =C2=B1  8%      -0.2        0.11 =C2=B1 18%  perf-profile.self=
.cycles-pp.__schedule
>       0.35 =C2=B1  9%      -0.2        0.19 =C2=B1 16%  perf-profile.self=
.cycles-pp.orc_find
>       0.31 =C2=B1 19%      -0.2        0.16 =C2=B1 17%  perf-profile.self=
.cycles-pp.__module_address
>       0.21 =C2=B1 11%      -0.2        0.06 =C2=B1 18%  perf-profile.self=
.cycles-pp.memmove
>       0.25 =C2=B1  8%      -0.1        0.11 =C2=B1 29%  perf-profile.self=
.cycles-pp.btrfs_search_slot
>       0.16 =C2=B1  6%      -0.1        0.04 =C2=B1101%  perf-profile.self=
.cycles-pp.__btrfs_cow_block
>       0.16 =C2=B1 15%      -0.1        0.04 =C2=B1 77%  perf-profile.self=
.cycles-pp.btrfs_set_token_32
>       0.21 =C2=B1  4%      -0.1        0.09 =C2=B1 16%  perf-profile.self=
.cycles-pp.stack_access_ok
>       0.18 =C2=B1  7%      -0.1        0.06 =C2=B1 52%  perf-profile.self=
.cycles-pp.btrfs_root_node
>       0.14 =C2=B1  9%      -0.1        0.03 =C2=B1101%  perf-profile.self=
.cycles-pp.btrfs_get_token_32
>       0.21 =C2=B1  5%      -0.1        0.11 =C2=B1 20%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       0.20 =C2=B1  8%      -0.1        0.10 =C2=B1 23%  perf-profile.self=
.cycles-pp.perf_callchain_kernel
>       0.17 =C2=B1  5%      -0.1        0.07 =C2=B1 18%  perf-profile.self=
.cycles-pp.__might_resched
>       0.16 =C2=B1 17%      -0.1        0.07 =C2=B1 21%  perf-profile.self=
.cycles-pp.xas_load
>       0.14 =C2=B1  8%      -0.1        0.06 =C2=B1 46%  perf-profile.self=
.cycles-pp.down_write
>       0.14 =C2=B1  5%      -0.1        0.05 =C2=B1 45%  perf-profile.self=
.cycles-pp.perf_output_copy
>       0.12 =C2=B1  6%      -0.1        0.04 =C2=B1101%  perf-profile.self=
.cycles-pp.kmem_cache_free
>       0.12 =C2=B1  8%      -0.1        0.04 =C2=B1 72%  perf-profile.self=
.cycles-pp.memzero_extent_buffer
>       0.10 =C2=B1  7%      -0.1        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.___perf_sw_event
>       0.10 =C2=B1  7%      -0.1        0.02 =C2=B1 99%  perf-profile.self=
.cycles-pp.inode_tree_add
>       0.10 =C2=B1 13%      -0.1        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.kernel_text_address
>       0.17 =C2=B1  8%      -0.1        0.10 =C2=B1 27%  perf-profile.self=
.cycles-pp.__etree_search
>       0.14 =C2=B1  6%      -0.1        0.08 =C2=B1 24%  perf-profile.self=
.cycles-pp.mutex_lock
>       0.09 =C2=B1 15%      -0.1        0.03 =C2=B1103%  perf-profile.self=
.cycles-pp.up_write
>       0.08 =C2=B1 13%      -0.1        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.free_extent_buffer
>       0.07 =C2=B1 15%      -0.0        0.04 =C2=B1 72%  perf-profile.self=
.cycles-pp.__update_load_avg_cfs_rq
>       0.06 =C2=B1 32%      +0.0        0.11 =C2=B1 39%  perf-profile.self=
.cycles-pp.sysvec_apic_timer_interrupt
>       0.14 =C2=B1 18%      +0.1        0.20 =C2=B1 15%  perf-profile.self=
.cycles-pp.irqtime_account_irq
>       0.58 =C2=B1  7%      +0.4        0.99 =C2=B1 16%  perf-profile.self=
.cycles-pp.rwsem_spin_on_owner
>       0.00            +2.1        2.09 =C2=B1 12%  perf-profile.self.cycl=
es-pp.find_first_extent_bit_state
>       3.38 =C2=B1  3%      +2.5        5.86 =C2=B1 13%  perf-profile.self=
.cycles-pp.mutex_spin_on_owner
>       2.31 =C2=B1  4%      +3.3        5.59 =C2=B1 17%  perf-profile.self=
.cycles-pp.osq_lock
>       0.30 =C2=B1 15%      +3.8        4.08 =C2=B1 15%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>       0.11 =C2=B1 32%      +7.9        8.04 =C2=B1 16%  perf-profile.self=
.cycles-pp.rb_next
> =

> =

> *************************************************************************=
**************************
> lkp-csl-2ap4: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU @ =
2.30GHz with 192G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_director=
ies/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_si=
ze/testcase/ucode:
>   gcc-9/performance/1SSD/9B/btrfs/8/x86_64-rhel-8.3/16d/256fpd/4/debian-1=
0.4-x86_64-20200603.cgz/fsyncBeforeClose/lkp-csl-2ap4/16G/fsmark/0x5003006
> =

> commit: =

>   dd503c2d5d ("btrfs: remove write and wait of struct walk_control")
>   1a61b300c0 ("btrfs: fix log tree cleanup after a transaction abort")
> =

> dd503c2d5db4f864 1a61b300c09b1d034534372349e =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    2244545           +22.9%    2758277        fsmark.app_overhead
>      13249 =C2=B1  2%     -79.6%       2697        fsmark.files_per_sec
>     336.80 =C2=B1  2%    +368.8%       1578        fsmark.time.elapsed_ti=
me
>     336.80 =C2=B1  2%    +368.8%       1578        fsmark.time.elapsed_ti=
me.max
>   2.97e+08 =C2=B1  2%      +3.5%  3.073e+08        fsmark.time.file_syste=
m_outputs
>       1518 =C2=B1 14%    +276.6%       5717 =C2=B1  2%  fsmark.time.invol=
untary_context_switches
>     150.83           +58.9%     239.67        fsmark.time.percent_of_cpu_=
this_job_got
>     495.22 =C2=B1  4%    +661.6%       3771        fsmark.time.system_time
>   10447820           -10.8%    9322318        fsmark.time.voluntary_conte=
xt_switches
>   6.28e+10 =C2=B1  2%    +365.7%  2.924e+11        cpuidle..time
>  1.269e+08 =C2=B1 20%    +302.3%  5.104e+08 =C2=B1 20%  cpuidle..usage
>   57547330 =C2=B1 22%    +335.0%  2.504e+08 =C2=B1 25%  turbostat.IRQ
>      84.94 =C2=B1  2%    -100.0%       0.00        turbostat.PkgWatt
>     386.64 =C2=B1  2%    +321.7%       1630        uptime.boot
>      71228 =C2=B1  2%    +324.3%     302205        uptime.idle
>       0.15 =C2=B1  4%      -0.1        0.02 =C2=B1  3%  mpstat.cpu.all.io=
wait%
>       0.82 =C2=B1  5%      +0.5        1.27        mpstat.cpu.all.sys%
>       0.04            -0.0        0.02 =C2=B1  4%  mpstat.cpu.all.usr%
>     106253 =C2=B1 69%   +1076.7%    1250289 =C2=B1 52%  numa-numastat.nod=
e1.local_node
>     190300 =C2=B1 39%    +602.7%    1337292 =C2=B1 49%  numa-numastat.nod=
e1.numa_hit
>     216240 =C2=B1 82%    +747.8%    1833203 =C2=B1136%  numa-numastat.nod=
e3.local_node
>     294059 =C2=B1 53%    +547.5%    1903933 =C2=B1129%  numa-numastat.nod=
e3.numa_hit
>     411999           -77.6%      92286        vmstat.io.bo
>   26486798           -28.0%   19073084        vmstat.memory.cache
>       1.00          +100.0%       2.00        vmstat.procs.r
>      67089 =C2=B1  2%     -78.0%      14778        vmstat.system.cs
>       9672 =C2=B1  7%     -15.3%       8190 =C2=B1 13%  numa-meminfo.node=
0.KernelStack
>       7037 =C2=B1  5%     -11.6%       6221 =C2=B1  7%  numa-meminfo.node=
1.KernelStack
>       2525 =C2=B1152%     -98.5%      38.17 =C2=B1 15%  numa-meminfo.node=
2.Mapped
>       8280 =C2=B1 32%   +9252.2%     774412 =C2=B1219%  numa-meminfo.node=
3.Active
>       7168 =C2=B1  8%    +106.4%      14799 =C2=B1 35%  numa-meminfo.node=
3.Active(anon)
>      18538 =C2=B1 46%   +2914.9%     558907 =C2=B1209%  numa-meminfo.node=
3.KReclaimable
>      18538 =C2=B1 46%   +2914.9%     558907 =C2=B1209%  numa-meminfo.node=
3.SReclaimable
>       9679 =C2=B1  8%     -15.4%       8187 =C2=B1 13%  numa-vmstat.node0=
.nr_kernel_stack
>       7039 =C2=B1  5%     -11.6%       6222 =C2=B1  7%  numa-vmstat.node1=
.nr_kernel_stack
>       1796 =C2=B1  8%    +106.0%       3700 =C2=B1 35%  numa-vmstat.node3=
.nr_active_anon
>       4640 =C2=B1 46%   +2912.0%     139768 =C2=B1209%  numa-vmstat.node3=
.nr_slab_reclaimable
>       1796 =C2=B1  8%    +106.0%       3700 =C2=B1 35%  numa-vmstat.node3=
.nr_zone_active_anon
>     534483 =C2=B1 15%    +223.9%    1731211 =C2=B1107%  numa-vmstat.node3=
.numa_hit
>     430615 =C2=B1 22%    +280.3%    1637437 =C2=B1116%  numa-vmstat.node3=
.numa_local
>   11415411 =C2=B1  2%     -60.8%    4476212 =C2=B1  3%  meminfo.Active
>      12176 =C2=B1  3%    +123.3%      27193 =C2=B1  2%  meminfo.Active(an=
on)
>   11403234 =C2=B1  2%     -61.0%    4449019 =C2=B1  3%  meminfo.Active(fi=
le)
>   23361738           -32.3%   15805338        meminfo.Cached
>     272329           -14.2%     233545        meminfo.Dirty
>      30627           -11.2%      27204        meminfo.KernelStack
>   29731200           -26.5%   21846541        meminfo.Memused
>      37689 =C2=B1  2%     +26.7%      47741        meminfo.Shmem
>   30540485           -27.9%   22026958        meminfo.max_used_kB
>       3038 =C2=B1  3%    +123.7%       6797 =C2=B1  2%  proc-vmstat.nr_ac=
tive_anon
>    2850306 =C2=B1  2%     -61.0%    1112326 =C2=B1  3%  proc-vmstat.nr_ac=
tive_file
>      79182            -3.2%      76623        proc-vmstat.nr_anon_pages
>   37250006 =C2=B1  2%      +3.7%   38642606        proc-vmstat.nr_dirtied
>      68085           -14.2%      58414        proc-vmstat.nr_dirty
>    5839686           -32.3%    3951870        proc-vmstat.nr_file_pages
>   41996583            +4.7%   43966332        proc-vmstat.nr_free_pages
>      85461            -4.5%      81650        proc-vmstat.nr_inactive_anon
>    2338534            -6.5%    2186147        proc-vmstat.nr_inactive_file
>      30634           -11.2%      27203        proc-vmstat.nr_kernel_stack
>      10032            -7.9%       9243        proc-vmstat.nr_mapped
>       1062            -6.9%     989.17        proc-vmstat.nr_page_table_p=
ages
>       9335           +27.8%      11928        proc-vmstat.nr_shmem
>     800757            +2.3%     819391        proc-vmstat.nr_slab_reclaim=
able
>     369020            -4.6%     352061        proc-vmstat.nr_slab_unrecla=
imable
>   37248723 =C2=B1  2%      +3.7%   38639214        proc-vmstat.nr_written
>       3038 =C2=B1  3%    +123.7%       6797 =C2=B1  2%  proc-vmstat.nr_zo=
ne_active_anon
>    2850306 =C2=B1  2%     -61.0%    1112326 =C2=B1  3%  proc-vmstat.nr_zo=
ne_active_file
>      85461            -4.5%      81650        proc-vmstat.nr_zone_inactiv=
e_anon
>    2338534            -6.5%    2186147        proc-vmstat.nr_zone_inactiv=
e_file
>      68163           -14.2%      58457        proc-vmstat.nr_zone_write_p=
ending
>   10406307            +5.5%   10978428        proc-vmstat.numa_hit
>   10147588            +5.6%   10719407        proc-vmstat.numa_local
>     318544 =C2=B1  7%     +25.8%     400574 =C2=B1  4%  proc-vmstat.numa_=
pte_updates
>    2820943 =C2=B1  4%     -61.3%    1091827 =C2=B1  8%  proc-vmstat.pgact=
ivate
>   10418164            +6.0%   11038540        proc-vmstat.pgalloc_normal
>    1576108          +290.3%    6151439        proc-vmstat.pgfault
>  1.402e+08 =C2=B1  2%      +4.1%   1.46e+08        proc-vmstat.pgpgout
>      86238          +305.7%     349864        proc-vmstat.pgreuse
>      18.60 =C2=B1 50%    +137.4%      44.17 =C2=B1 31%  perf-stat.i.MPKI
>  1.227e+09 =C2=B1  2%     -13.9%  1.056e+09 =C2=B1  3%  perf-stat.i.branc=
h-instructions
>      12.58 =C2=B1 46%      -9.6        2.96 =C2=B1  7%  perf-stat.i.cache=
-miss-rate%
>   10514212 =C2=B1 10%     -58.0%    4416388 =C2=B1 36%  perf-stat.i.cache=
-misses
>      67622 =C2=B1  2%     -78.1%      14779        perf-stat.i.context-sw=
itches
>       1.97 =C2=B1 13%     +66.7%       3.28 =C2=B1 12%  perf-stat.i.cpi
>     202.44            -4.1%     194.22        perf-stat.i.cpu-migrations
>       1259 =C2=B1  6%    +227.7%       4126 =C2=B1 35%  perf-stat.i.cycle=
s-between-cache-misses
>   1.66e+09 =C2=B1  2%     -30.5%  1.153e+09 =C2=B1  3%  perf-stat.i.dTLB-=
loads
>  8.328e+08 =C2=B1  2%     -54.2%  3.818e+08 =C2=B1  5%  perf-stat.i.dTLB-=
stores
>    2445823 =C2=B1  6%     -38.7%    1499909 =C2=B1  9%  perf-stat.i.iTLB-=
load-misses
>  6.241e+09 =C2=B1  2%     -30.4%  4.344e+09 =C2=B1  4%  perf-stat.i.instr=
uctions
>       0.52 =C2=B1 13%     -38.9%       0.32 =C2=B1 12%  perf-stat.i.ipc
>       1.16 =C2=B1  2%     -76.8%       0.27 =C2=B1 13%  perf-stat.i.major=
-faults
>      19.38 =C2=B1  2%     -27.4%      14.07        perf-stat.i.metric.M/s=
ec
>       4223           -11.2%       3751        perf-stat.i.minor-faults
>      34.13 =C2=B1 25%     +18.0       52.09 =C2=B1  9%  perf-stat.i.node-=
load-miss-rate%
>    1032812 =C2=B1 50%     -61.0%     403177 =C2=B1 20%  perf-stat.i.node-=
load-misses
>    1813182 =C2=B1  7%     -75.5%     443843 =C2=B1  7%  perf-stat.i.node-=
loads
>     379204 =C2=B1 57%     -63.8%     137132 =C2=B1 13%  perf-stat.i.node-=
store-misses
>     842872 =C2=B1 14%     -72.9%     228776 =C2=B1  8%  perf-stat.i.node-=
stores
>       4224           -11.2%       3751        perf-stat.i.page-faults
>      18.27 =C2=B1 49%    +133.0%      42.55 =C2=B1 31%  perf-stat.overall=
.MPKI
>      11.65 =C2=B1 43%      -9.3        2.36 =C2=B1  8%  perf-stat.overall=
.cache-miss-rate%
>       1.94 =C2=B1 13%     +65.0%       3.20 =C2=B1 12%  perf-stat.overall=
.cpi
>       1149 =C2=B1  7%    +203.0%       3483 =C2=B1 28%  perf-stat.overall=
.cycles-between-cache-misses
>       0.53 =C2=B1 13%     -39.5%       0.32 =C2=B1 12%  perf-stat.overall=
.ipc
>  1.224e+09 =C2=B1  2%     -13.7%  1.056e+09 =C2=B1  3%  perf-stat.ps.bran=
ch-instructions
>   10484718 =C2=B1 10%     -57.9%    4413301 =C2=B1 36%  perf-stat.ps.cach=
e-misses
>      67413 =C2=B1  2%     -78.1%      14762        perf-stat.ps.context-s=
witches
>     201.83            -3.8%     194.11        perf-stat.ps.cpu-migrations
>  1.655e+09 =C2=B1  2%     -30.4%  1.152e+09 =C2=B1  3%  perf-stat.ps.dTLB=
-loads
>  8.303e+08 =C2=B1  2%     -54.1%  3.815e+08 =C2=B1  5%  perf-stat.ps.dTLB=
-stores
>    2438383 =C2=B1  6%     -38.5%    1498800 =C2=B1  9%  perf-stat.ps.iTLB=
-load-misses
>  6.222e+09 =C2=B1  2%     -30.2%  4.341e+09 =C2=B1  4%  perf-stat.ps.inst=
ructions
>       1.16 =C2=B1  2%     -76.7%       0.27 =C2=B1 13%  perf-stat.ps.majo=
r-faults
>       4207           -10.9%       3748        perf-stat.ps.minor-faults
>    1029887 =C2=B1 50%     -60.9%     402840 =C2=B1 20%  perf-stat.ps.node=
-load-misses
>    1808344 =C2=B1  7%     -75.5%     443539 =C2=B1  7%  perf-stat.ps.node=
-loads
>     378187 =C2=B1 57%     -63.8%     137029 =C2=B1 13%  perf-stat.ps.node=
-store-misses
>     840484 =C2=B1 14%     -72.8%     228574 =C2=B1  8%  perf-stat.ps.node=
-stores
>       4208           -10.9%       3748        perf-stat.ps.page-faults
>  2.104e+12 =C2=B1  4%    +226.3%  6.866e+12 =C2=B1  4%  perf-stat.total.i=
nstructions
>      64.88 =C2=B1  4%     -11.1       53.82 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.secondary_startup_64_no_verify
>      64.38 =C2=B1  4%     -10.8       53.60 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_v=
erify
>      64.38 =C2=B1  4%     -10.8       53.60 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>      64.34 =C2=B1  4%     -10.8       53.57 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64_no_verify
>      58.96 =C2=B1  5%      -9.0       49.92 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>      58.20 =C2=B1  5%      -8.9       49.28 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry=
.start_secondary
>       5.66 =C2=B1 10%      -4.9        0.72 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.btree_write_cache_pages.do_writepages.filemap_fdatawrite_wb=
c.filemap_fdatawrite_range.btrfs_write_marked_extents
>      39.59 =C2=B1  9%      -4.7       34.85 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_st=
artup_entry
>       5.39 =C2=B1  9%      -4.7        0.72 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_s=
ync_log.btrfs_sync_file.do_fsync
>       5.39 =C2=B1  9%      -4.7        0.72 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.filemap_fdatawrite_wbc.filemap_fdatawrite_range.btrfs_write=
_marked_extents.btrfs_sync_log.btrfs_sync_file
>       5.37 =C2=B1  9%      -4.7        0.72 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.filemap_fdatawrite_ran=
ge.btrfs_write_marked_extents.btrfs_sync_log
>       4.40 =C2=B1  9%      -4.1        0.29 =C2=B1100%  perf-profile.call=
trace.cycles-pp.btrfs_submit_metadata_bio.submit_one_bio.btree_write_cache_=
pages.do_writepages.filemap_fdatawrite_wbc
>       4.40 =C2=B1  9%      -4.0        0.37 =C2=B1 71%  perf-profile.call=
trace.cycles-pp.submit_one_bio.btree_write_cache_pages.do_writepages.filema=
p_fdatawrite_wbc.filemap_fdatawrite_range
>       4.61 =C2=B1 11%      -3.9        0.66 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.open64
>       4.59 =C2=B1 11%      -3.9        0.66 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.open64
>       4.59 =C2=B1 10%      -3.9        0.66 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.open64
>       4.58 =C2=B1 10%      -3.9        0.66 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe.op=
en64
>       4.57 =C2=B1 10%      -3.9        0.66 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_sys_openat2.do_sys_open.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.open64
>       4.50 =C2=B1 10%      -3.9        0.65 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_filp_open.do_sys_openat2.do_sys_open.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>       4.49 =C2=B1 10%      -3.8        0.65 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.path_openat.do_filp_open.do_sys_openat2.do_sys_open.do_sysc=
all_64
>       3.40 =C2=B1 10%      -3.1        0.26 =C2=B1100%  perf-profile.call=
trace.cycles-pp.btrfs_create.path_openat.do_filp_open.do_sys_openat2.do_sys=
_open
>       1.38 =C2=B1 19%      -1.1        0.26 =C2=B1100%  perf-profile.call=
trace.cycles-pp.record__finish_output.cmd_record.cmd_sched.run_builtin.main
>       1.38 =C2=B1 19%      -1.1        0.26 =C2=B1100%  perf-profile.call=
trace.cycles-pp.perf_session__process_events.record__finish_output.cmd_reco=
rd.cmd_sched.run_builtin
>       1.49 =C2=B1 17%      -0.9        0.62 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.cmd_record.cmd_sched.run_builtin.main.__libc_start_main
>       1.49 =C2=B1 17%      -0.9        0.62 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.cmd_sched.run_builtin.main.__libc_start_main
>       1.53 =C2=B1 19%      -0.9        0.67 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__libc_start_main
>       1.53 =C2=B1 19%      -0.9        0.67 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.main.__libc_start_main
>       1.53 =C2=B1 19%      -0.9        0.67 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.run_builtin.main.__libc_start_main
>       0.79 =C2=B1 19%      +1.3        2.10 =C2=B1 30%  perf-profile.call=
trace.cycles-pp.btrfs_alloc_tree_block.__btrfs_cow_block.btrfs_cow_block.bt=
rfs_search_slot.btrfs_truncate_inode_items
>       3.29 =C2=B1  7%      +1.6        4.86 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.mutex_spin_on_owner.__mutex_lock.wait_log_commit.btrfs_sync=
_log.btrfs_sync_file
>       0.00            +2.0        1.97 =C2=B1 30%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.set_extent_bit.b=
trfs_alloc_tree_block.__btrfs_cow_block
>       0.00            +2.0        1.98 =C2=B1 30%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.set_extent_bit.btrfs_alloc_tree_block.__btrfs_cow=
_block.btrfs_cow_block
>       0.00            +2.0        2.00 =C2=B1 30%  perf-profile.calltrace=
.cycles-pp.set_extent_bit.btrfs_alloc_tree_block.__btrfs_cow_block.btrfs_co=
w_block.btrfs_search_slot
>       5.49 =C2=B1  9%      +3.0        8.47 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.btrfs_write_marked_extents.btrfs_sync_log.btrfs_sync_file.d=
o_fsync.__x64_sys_fsync
>       5.48 =C2=B1  9%      +3.0        8.51 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.wait_log_commit.btrfs_sync_log.btrfs_sync_file.do_fsync.__x=
64_sys_fsync
>       0.00            +3.1        3.14 =C2=B1 36%  perf-profile.calltrace=
.cycles-pp.mutex_spin_on_owner.__mutex_lock.btrfs_log_inode_parent.btrfs_lo=
g_dentry_safe.btrfs_sync_file
>       4.22 =C2=B1  8%      +4.1        8.35 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__mutex_lock.wait_log_commit.btrfs_sync_log.btrfs_sync_file=
.do_fsync
>       5.13 =C2=B1 13%      +4.5        9.62 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.btrfs_log_inode.btrfs_log_inode_parent.btrfs_log_dentry_saf=
e.btrfs_sync_file.do_fsync
>       0.00            +4.6        4.58 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.osq_lock.__mutex_lock.btrfs_log_inode_parent.btrfs_log_dentry_sa=
fe.btrfs_sync_file
>       2.58 =C2=B1 12%      +4.6        7.20 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.btrfs_cow_block.btrfs_search_slot.btrfs_truncate_inode_item=
s.truncate_inode_items.btrfs_log_inode
>       2.57 =C2=B1 12%      +4.6        7.20 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__btrfs_cow_block.btrfs_cow_block.btrfs_search_slot.btrfs_t=
runcate_inode_items.truncate_inode_items
>       0.00            +4.8        4.82 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__clear_extent_b=
it.clear_extent_bit.delete_tree_block
>       0.00            +4.8        4.82 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.__clear_extent_bit.clear_extent_bit.delete_tree_b=
lock.__btrfs_cow_block
>       0.00            +4.8        4.84 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.__clear_extent_bit.clear_extent_bit.delete_tree_block.__btrfs_co=
w_block.btrfs_cow_block
>       0.00            +4.8        4.84 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.clear_extent_bit.delete_tree_block.__btrfs_cow_block.btrfs_cow_b=
lock.btrfs_search_slot
>       0.00            +4.9        4.88 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.delete_tree_block.__btrfs_cow_block.btrfs_cow_block.btrfs_search=
_slot.btrfs_truncate_inode_items
>       0.00            +6.0        5.97 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.rb_next.find_first_extent_bit_state.find_first_extent_bit.btrfs_=
write_marked_extents.btrfs_sync_log
>       3.28 =C2=B1 13%      +6.0        9.32 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.truncate_inode_items.btrfs_log_inode.btrfs_log_inode_parent=
.btrfs_log_dentry_safe.btrfs_sync_file
>       3.28 =C2=B1 13%      +6.0        9.32 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.btrfs_truncate_inode_items.truncate_inode_items.btrfs_log_i=
node.btrfs_log_inode_parent.btrfs_log_dentry_safe
>       0.00            +6.1        6.08 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.rb_next.find_first_extent_bit_state.find_first_extent_bit.__btrf=
s_wait_marked_extents.btrfs_wait_tree_log_extents
>       3.22 =C2=B1 13%      +6.1        9.32 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.btrfs_search_slot.btrfs_truncate_inode_items.truncate_inode=
_items.btrfs_log_inode.btrfs_log_inode_parent
>       0.88 =C2=B1  6%      +7.1        7.97 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.btrfs_wait_tree_log_extents.btrfs_sync_log.btrfs_sync_file.=
do_fsync.__x64_sys_fsync
>       0.86 =C2=B1  6%      +7.1        7.97 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__btrfs_wait_marked_extents.btrfs_wait_tree_log_extents.btr=
fs_sync_log.btrfs_sync_file.do_fsync
>       0.50 =C2=B1 45%      +7.2        7.73 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__mutex_lock.btrfs_log_inode_parent.btrfs_log_dentry_safe.b=
trfs_sync_file.do_fsync
>       0.00            +7.7        7.71 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.find_first_extent_bit_state.find_first_extent_bit.btrfs_write_ma=
rked_extents.btrfs_sync_log.btrfs_sync_file
>       0.00            +7.7        7.73 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.find_first_extent_bit.btrfs_write_marked_extents.btrfs_sync_log.=
btrfs_sync_file.do_fsync
>       0.00            +7.9        7.89 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.find_first_extent_bit_state.find_first_extent_bit.__btrfs_wait_m=
arked_extents.btrfs_wait_tree_log_extents.btrfs_sync_log
>       0.00            +7.9        7.91 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.find_first_extent_bit.__btrfs_wait_marked_extents.btrfs_wait_tre=
e_log_extents.btrfs_sync_log.btrfs_sync_file
>      14.56 =C2=B1  8%     +10.9       25.48 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.btrfs_sync_log.btrfs_sync_file.do_fsync.__x64_sys_fsync.do_=
syscall_64
>       5.85 =C2=B1 12%     +11.5       17.36 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.btrfs_log_dentry_safe.btrfs_sync_file.do_fsync.__x64_sys_fs=
ync.do_syscall_64
>       5.84 =C2=B1 13%     +11.5       17.36 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.btrfs_log_inode_parent.btrfs_log_dentry_safe.btrfs_sync_fil=
e.do_fsync.__x64_sys_fsync
>      23.60 =C2=B1  9%     +19.6       43.17 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.fsync
>      23.49 =C2=B1  9%     +19.7       43.15 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.fsync
>      23.48 =C2=B1  9%     +19.7       43.15 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.fsync
>      23.46 =C2=B1  9%     +19.7       43.14 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.fsync
>      23.46 =C2=B1  9%     +19.7       43.14 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.do_fsync.__x64_sys_fsync.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.fsync
>      23.45 =C2=B1  9%     +19.7       43.14 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.btrfs_sync_file.do_fsync.__x64_sys_fsync.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>      64.88 =C2=B1  4%     -11.1       53.82 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>      64.88 =C2=B1  4%     -11.1       53.82 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>      64.87 =C2=B1  4%     -11.1       53.82 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.do_idle
>      64.38 =C2=B1  4%     -10.8       53.60 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.start_secondary
>      59.43 =C2=B1  5%      -9.3       50.13 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter
>      59.40 =C2=B1  5%      -9.3       50.11 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>       7.94 =C2=B1  9%      -7.0        0.99 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.filemap_fdatawrite_range
>       7.94 =C2=B1  9%      -7.0        0.99 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.do_writepages
>       7.92 =C2=B1  9%      -6.9        0.98 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.filemap_fdatawrite_wbc
>       5.66 =C2=B1 10%      -4.9        0.72 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.btree_write_cache_pages
>       4.61 =C2=B1 11%      -3.9        0.66 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.open64
>       4.65 =C2=B1 10%      -3.9        0.73 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.do_sys_open
>       4.64 =C2=B1 10%      -3.9        0.73 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.do_sys_openat2
>       4.41 =C2=B1  9%      -3.9        0.53 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.submit_one_bio
>       4.40 =C2=B1  9%      -3.9        0.53 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.btrfs_submit_metadata_bio
>       4.57 =C2=B1 10%      -3.9        0.72 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       4.57 =C2=B1 10%      -3.9        0.72 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.path_openat
>       4.12 =C2=B1  9%      -3.6        0.47 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.btree_csum_one_bio
>       4.10 =C2=B1  9%      -3.6        0.47 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.csum_one_extent_buffer
>       3.33 =C2=B1 45%      -3.1        0.20 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.poll_idle
>       3.76 =C2=B1  7%      -3.1        0.68 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__schedule
>       3.90 =C2=B1  8%      -3.0        0.87 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.perf_tp_event
>       3.80 =C2=B1  8%      -3.0        0.85 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.perf_swevent_overflow
>       3.80 =C2=B1  8%      -3.0        0.85 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__perf_event_overflow
>       3.78 =C2=B1  8%      -2.9        0.84 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.perf_event_output_forward
>       3.40 =C2=B1 10%      -2.9        0.46 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.btrfs_create
>       3.30 =C2=B1  9%      -2.5        0.76 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.perf_prepare_sample
>       3.13 =C2=B1  9%      -2.4        0.71 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.perf_callchain
>       3.12 =C2=B1  9%      -2.4        0.71 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.get_perf_callchain
>       2.83 =C2=B1  8%      -2.3        0.48 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.schedule
>       2.38 =C2=B1  9%      -2.0        0.34 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_insert_empty_items
>       2.27 =C2=B1 12%      -2.0        0.27 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.start_ordered_ops
>       2.26 =C2=B1 11%      -2.0        0.26 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.btrfs_fdatawrite_range
>       2.25 =C2=B1 11%      -2.0        0.26 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.extent_writepages
>       2.22 =C2=B1 11%      -2.0        0.26 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.extent_write_cache_pages
>       2.44 =C2=B1  9%      -1.9        0.58 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.perf_callchain_kernel
>       2.02 =C2=B1 12%      -1.8        0.22 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__extent_writepage
>       2.00 =C2=B1 12%      -1.8        0.22 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.writepage_delalloc
>       1.95 =C2=B1  7%      -1.7        0.24 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.read_extent_buffer
>       1.92 =C2=B1 12%      -1.7        0.21 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_run_delalloc_range
>       1.90 =C2=B1 12%      -1.7        0.20 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.cow_file_range
>       1.89 =C2=B1 10%      -1.7        0.23 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.btrfs_check_node
>       2.01 =C2=B1 10%      -1.6        0.37 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.ksys_write
>       1.99 =C2=B1 10%      -1.6        0.36 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       1.95 =C2=B1  9%      -1.6        0.36 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>       1.67 =C2=B1 18%      -1.5        0.16 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.check_leaf
>       1.78 =C2=B1 10%      -1.5        0.29 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.write
>       1.59 =C2=B1 13%      -1.4        0.16 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.cow_file_range_inline
>       1.86 =C2=B1  9%      -1.4        0.44 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.unwind_next_frame
>       1.62 =C2=B1 11%      -1.4        0.24 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_file_write_iter
>       1.61 =C2=B1 11%      -1.4        0.24 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_buffered_write
>       1.51 =C2=B1  9%      -1.3        0.17 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.btrfs_add_link
>       1.45 =C2=B1  9%      -1.3        0.16 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_insert_dir_item
>       1.54 =C2=B1  8%      -1.3        0.26 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       1.48 =C2=B1  7%      -1.3        0.22 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_switch
>       1.49 =C2=B1 11%      -1.2        0.25 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.dequeue_task_fair
>       1.41 =C2=B1 11%      -1.2        0.17 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.copy_extent_buffer_full
>       1.41 =C2=B1 11%      -1.2        0.18 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.copy_page
>       1.46 =C2=B1 11%      -1.2        0.25 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       1.36 =C2=B1 11%      -1.2        0.18 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.asm_common_interrupt
>       1.34 =C2=B1 11%      -1.2        0.18 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.common_interrupt
>       1.29 =C2=B1 11%      -1.1        0.17 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__common_interrupt
>       1.28 =C2=B1 12%      -1.1        0.17 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.handle_edge_irq
>       1.25 =C2=B1 14%      -1.1        0.14 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.read_block_for_search
>       1.26 =C2=B1 11%      -1.1        0.16 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.handle_irq_event
>       1.26 =C2=B1 11%      -1.1        0.16 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.handle_irq_event_percpu
>       1.24 =C2=B1 11%      -1.1        0.16 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.__handle_irq_event_percpu
>       1.24 =C2=B1 12%      -1.1        0.16 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.nvme_irq
>       1.17 =C2=B1  8%      -1.0        0.13 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.insert_with_overflow
>       1.16 =C2=B1  8%      -1.0        0.16 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>       1.18 =C2=B1  9%      -1.0        0.18 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btrfs_new_inode
>       1.12 =C2=B1  7%      -1.0        0.13 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.folio_wait_bit
>       1.12 =C2=B1 11%      -1.0        0.14 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.blk_mq_end_request_batch
>       1.50 =C2=B1 10%      -1.0        0.53 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.update_curr
>       1.09 =C2=B1 11%      -1.0        0.12 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.find_extent_buffer
>       1.07 =C2=B1  7%      -1.0        0.12 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.io_schedule
>       1.07 =C2=B1 12%      -0.9        0.12 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.blk_update_request
>       1.41 =C2=B1 11%      -0.9        0.50 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_stat_runtime
>       1.08 =C2=B1  8%      -0.9        0.17 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_wakeup_template
>       1.00 =C2=B1 13%      -0.9        0.10 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.btrfs_drop_extents
>       1.38 =C2=B1 19%      -0.9        0.50 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.record__finish_output
>       1.38 =C2=B1 19%      -0.9        0.50 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.perf_session__process_events
>       1.49 =C2=B1 17%      -0.9        0.62 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.cmd_record
>       1.49 =C2=B1 17%      -0.9        0.62 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.cmd_sched
>       1.53 =C2=B1 19%      -0.9        0.67 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       1.53 =C2=B1 19%      -0.9        0.67 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.main
>       1.53 =C2=B1 19%      -0.9        0.67 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.run_builtin
>       1.15 =C2=B1 10%      -0.8        0.32 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.96 =C2=B1 14%      -0.8        0.13 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_match_dir
>       1.15 =C2=B1 10%      -0.8        0.32 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       1.00 =C2=B1  7%      -0.8        0.17 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.btrfs_update_root
>       0.98 =C2=B1 11%      -0.8        0.18 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       0.94 =C2=B1 11%      -0.8        0.18 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.85 =C2=B1 11%      -0.7        0.10 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.find_extent_buffer_nolock
>       0.94 =C2=B1  8%      -0.7        0.19 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       0.83 =C2=B1 17%      -0.7        0.09 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_get_32
>       0.85 =C2=B1 11%      -0.7        0.13 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.write_one_eb
>       1.19 =C2=B1 17%      -0.7        0.47 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.process_simple
>       0.74 =C2=B1 13%      -0.7        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.btrfs_end_bio
>       0.72 =C2=B1 12%      -0.7        0.06 =C2=B1 50%  perf-profile.chil=
dren.cycles-pp.btrfs_work_helper
>       0.70 =C2=B1 13%      -0.7        0.04 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.folio_end_writeback
>       0.77 =C2=B1 15%      -0.7        0.10 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_dir_item
>       0.72 =C2=B1 12%      -0.7        0.06 =C2=B1 50%  perf-profile.chil=
dren.cycles-pp.btrfs_async_run_delayed_root
>       0.70 =C2=B1 12%      -0.7        0.04 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.end_bio_extent_buffer_writepage
>       0.72 =C2=B1 11%      -0.6        0.10 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.generic_bin_search
>       0.69 =C2=B1  9%      -0.6        0.09 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.setup_items_for_insert
>       0.79 =C2=B1  9%      -0.6        0.20 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__orc_find
>       0.62 =C2=B1 16%      -0.6        0.04 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_file_extent
>       0.67 =C2=B1 14%      -0.6        0.09 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.prepare_pages
>       0.75 =C2=B1 10%      -0.6        0.18 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.write_all_supers
>       0.64 =C2=B1 10%      -0.6        0.09 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.folio_mark_dirty
>       0.69 =C2=B1 12%      -0.5        0.16 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.__btrfs_tree_read_lock
>       0.62 =C2=B1 10%      -0.5        0.08 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.__set_page_dirty_nobuffers
>       0.66 =C2=B1 12%      -0.5        0.13 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       0.63 =C2=B1 10%      -0.5        0.10 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>       0.78 =C2=B1 20%      -0.5        0.26 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__ordered_events__flush
>       0.77 =C2=B1 20%      -0.5        0.25 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.perf_session__process_user_event
>       0.58 =C2=B1  9%      -0.5        0.07 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.folio_wake_bit
>       0.67 =C2=B1 10%      -0.5        0.16 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__unwind_start
>       0.60 =C2=B1  9%      -0.5        0.08 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.filemap_dirty_folio
>       0.60 =C2=B1 10%      -0.5        0.10 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.split_leaf
>       0.58 =C2=B1 10%      -0.5        0.09 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.autoremove_wake_function
>       0.56 =C2=B1  9%      -0.5        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.wake_page_function
>       0.62 =C2=B1  9%      -0.5        0.12 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.perf_callchain_user
>       0.56 =C2=B1 11%      -0.5        0.08 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.btrfs_comp_cpu_keys
>       0.76 =C2=B1 20%      -0.5        0.28 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.perf_session__deliver_event
>       0.55 =C2=B1  8%      -0.5        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_release_path
>       0.53 =C2=B1 17%      -0.5        0.05 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.btrfs_get_64
>       0.64 =C2=B1 12%      -0.5        0.16 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.orc_find
>       0.82 =C2=B1 11%      -0.5        0.34 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.55 =C2=B1 10%      -0.5        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.btrfs_mark_buffer_dirty
>       0.58 =C2=B1  9%      -0.5        0.12 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__get_user_nocheck_8
>       0.52 =C2=B1 28%      -0.4        0.08 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.alloc_extent_buffer
>       0.51 =C2=B1 11%      -0.4        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.crc32c_pcl_intel_update
>       0.50 =C2=B1  9%      -0.4        0.07 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.set_extent_buffer_dirty
>       0.50 =C2=B1  9%      -0.4        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.csum_tree_block
>       0.46 =C2=B1 11%      -0.4        0.05 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.__radix_tree_lookup
>       0.57 =C2=B1 11%      -0.4        0.16 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.btrfs_read_lock_root_node
>       0.48 =C2=B1 17%      -0.4        0.07 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup
>       0.48 =C2=B1 17%      -0.4        0.07 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_dentry
>       0.55 =C2=B1 16%      -0.4        0.15 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.copy_items
>       0.44 =C2=B1 15%      -0.4        0.05 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.prepare_uptodate_page
>       0.43 =C2=B1 16%      -0.4        0.05 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.btrfs_readpage
>       0.50 =C2=B1 12%      -0.4        0.12 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.rwsem_down_read_slowpath
>       0.44 =C2=B1 33%      -0.4        0.06 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.pagecache_get_page
>       0.40 =C2=B1 16%      -0.4        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.check_setget_bounds
>       0.43 =C2=B1 34%      -0.4        0.06 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.__filemap_get_folio
>       0.41 =C2=B1 14%      -0.4        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.btrfs_update_inode
>       0.41 =C2=B1 13%      -0.4        0.05 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.btrfs_check_ref_name_override
>       0.55 =C2=B1  7%      -0.3        0.20 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.asm_exc_page_fault
>       0.35 =C2=B1 13%      -0.3        0.03 =C2=B1101%  perf-profile.chil=
dren.cycles-pp.btrfs_delayed_update_inode
>       0.38 =C2=B1  9%      -0.3        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.perf_output_sample
>       0.37 =C2=B1 15%      -0.3        0.05 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.btrfs_write_check
>       0.41 =C2=B1 12%      -0.3        0.09 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.unwind_get_return_address
>       0.34 =C2=B1 10%      -0.3        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.btrfs_dirty_pages
>       0.36 =C2=B1 15%      -0.3        0.05 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.btrfs_reserve_extent
>       0.34 =C2=B1 16%      -0.3        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.file_remove_privs
>       0.35 =C2=B1 10%      -0.3        0.06 =C2=B1 52%  perf-profile.chil=
dren.cycles-pp.btrfs_free_tree_block
>       0.33 =C2=B1 16%      -0.3        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.dentry_needs_remove_privs
>       0.33 =C2=B1 11%      -0.3        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.__folio_mark_dirty
>       0.38 =C2=B1 13%      -0.3        0.08 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__kernel_text_address
>       0.31 =C2=B1 15%      -0.3        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.find_free_extent
>       0.33 =C2=B1 11%      -0.3        0.07 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.kernel_text_address
>       0.31 =C2=B1 11%      -0.2        0.07 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.rwsem_wake
>       0.29 =C2=B1  5%      -0.2        0.05 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.mkdir
>       0.28 =C2=B1 17%      -0.2        0.05 =C2=B1 74%  perf-profile.chil=
dren.cycles-pp.btrfs_map_bio
>       0.31 =C2=B1  6%      -0.2        0.08 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.wake_up_q
>       0.26 =C2=B1  7%      -0.2        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.__x64_sys_mkdir
>       0.24 =C2=B1 13%      -0.2        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.perf_output_copy
>       0.28 =C2=B1 14%      -0.2        0.06 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_end_super_write
>       0.25 =C2=B1 13%      -0.2        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.memcpy_erms
>       0.25 =C2=B1 14%      -0.2        0.04 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.mutex_lock
>       0.26 =C2=B1 18%      -0.2        0.06 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.submit_bio_noacct
>       0.23 =C2=B1 13%      -0.2        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.down_read
>       0.26 =C2=B1 16%      -0.2        0.06 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.blk_mq_submit_bio
>       0.27 =C2=B1  8%      -0.2        0.08 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__close
>       0.22 =C2=B1 21%      -0.2        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.__might_resched
>       0.24 =C2=B1  8%      -0.2        0.05 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.pick_next_task_fair
>       0.21 =C2=B1  6%      -0.2        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.do_mkdirat
>       0.27 =C2=B1 10%      -0.2        0.08 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.__libc_write
>       0.26 =C2=B1 10%      -0.2        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.generic_file_write_iter
>       0.26 =C2=B1 10%      -0.2        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       0.26 =C2=B1 10%      -0.2        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       0.26 =C2=B1  8%      -0.2        0.08 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode
>       0.21 =C2=B1 13%      -0.2        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       0.21 =C2=B1 19%      -0.2        0.04 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.write_dev_supers
>       0.26 =C2=B1 12%      -0.2        0.08 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.unlock_up
>       0.24 =C2=B1  5%      -0.2        0.07 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       0.20 =C2=B1  3%      -0.1        0.06 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.task_work_run
>       0.19 =C2=B1 12%      -0.1        0.05 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.__etree_search
>       0.22 =C2=B1 70%      -0.1        0.08 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp._find_next_bit
>       0.22 =C2=B1  5%      -0.1        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.link_path_walk
>       0.35 =C2=B1  9%      -0.1        0.22 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.machines__deliver_event
>       0.16 =C2=B1 17%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.push_leaf_left
>       0.17 =C2=B1  4%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.__fput
>       0.27 =C2=B1 18%      -0.1        0.16 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.ordered_events__queue
>       0.15 =C2=B1  7%      -0.1        0.05 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.13 =C2=B1 22%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.do_sys_poll
>       0.13 =C2=B1 22%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.__x64_sys_poll
>       0.13 =C2=B1 22%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.__poll
>       0.24 =C2=B1 10%      -0.1        0.13 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.exc_page_fault
>       0.25 =C2=B1 18%      -0.1        0.15 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.queue_event
>       0.14 =C2=B1 33%      -0.1        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.21 =C2=B1  7%      -0.1        0.12 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.build_id__mark_dso_hit
>       0.14 =C2=B1 15%      -0.1        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.newidle_balance
>       0.14 =C2=B1  6%      -0.1        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.walk_component
>       0.11 =C2=B1  9%      -0.0        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.idle_cpu
>       0.14 =C2=B1  8%      -0.0        0.11 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.thread__find_map
>       0.07 =C2=B1 11%      -0.0        0.04 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.user_path_at_empty
>       0.11 =C2=B1  9%      -0.0        0.08 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.handle_mm_fault
>       0.10 =C2=B1 11%      -0.0        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__handle_mm_fault
>       0.17 =C2=B1 15%      +0.2        0.33 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.task_tick_fair
>       1.13 =C2=B1 18%      +1.1        2.20 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.btrfs_alloc_tree_block
>       0.75 =C2=B1 12%      +1.4        2.13 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.set_extent_bit
>       0.18 =C2=B1 27%      +1.7        1.90 =C2=B1102%  perf-profile.chil=
dren.cycles-pp.rwsem_spin_on_owner
>       5.79 =C2=B1 10%      +2.7        8.47 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_write_marked_extents
>       5.48 =C2=B1  9%      +3.0        8.51 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.wait_log_commit
>       3.61 =C2=B1 11%      +3.8        7.38 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.btrfs_cow_block
>       3.60 =C2=B1 11%      +3.8        7.38 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__btrfs_cow_block
>       3.61 =C2=B1  6%      +4.4        8.01 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.mutex_spin_on_owner
>       5.14 =C2=B1 13%      +4.5        9.62 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.btrfs_log_inode
>       0.26 =C2=B1 16%      +4.6        4.88 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__clear_extent_bit
>       0.07 =C2=B1 29%      +4.8        4.85 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.clear_extent_bit
>       0.00            +4.9        4.91 =C2=B1 14%  perf-profile.children.=
cycles-pp.delete_tree_block
>       1.83 =C2=B1  9%      +5.5        7.34 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       3.28 =C2=B1 13%      +6.0        9.32 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.truncate_inode_items
>       3.28 =C2=B1 13%      +6.0        9.32 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.btrfs_truncate_inode_items
>       0.34 =C2=B1 15%      +6.6        6.92 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       1.33 =C2=B1 17%      +6.8        8.08 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.osq_lock
>       0.88 =C2=B1  6%      +7.1        7.97 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.btrfs_wait_tree_log_extents
>       0.86 =C2=B1  6%      +7.1        7.97 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__btrfs_wait_marked_extents
>      14.57 =C2=B1  8%     +10.9       25.48 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.btrfs_sync_log
>       4.93 =C2=B1  8%     +11.2       16.09 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__mutex_lock
>       5.85 =C2=B1 12%     +11.5       17.36 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.btrfs_log_dentry_safe
>       5.84 =C2=B1 13%     +11.5       17.36 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.btrfs_log_inode_parent
>       0.18 =C2=B1 31%     +12.2       12.40 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.rb_next
>      31.52 =C2=B1  9%     +13.5       45.01 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>      31.50 =C2=B1  9%     +13.5       45.01 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       0.11 =C2=B1 34%     +15.5       15.64 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.find_first_extent_bit
>       0.02 =C2=B1149%     +15.6       15.64 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.find_first_extent_bit_state
>      23.60 =C2=B1  9%     +19.6       43.17 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.fsync
>      23.46 =C2=B1  9%     +19.7       43.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__x64_sys_fsync
>      23.46 =C2=B1  9%     +19.7       43.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.do_fsync
>      23.45 =C2=B1  9%     +19.7       43.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.btrfs_sync_file
>       2.92 =C2=B1 48%      -2.7        0.17 =C2=B1 32%  perf-profile.self=
.cycles-pp.poll_idle
>       1.90 =C2=B1  8%      -1.7        0.23 =C2=B1 10%  perf-profile.self=
.cycles-pp.read_extent_buffer
>       1.38 =C2=B1 10%      -1.2        0.18 =C2=B1 12%  perf-profile.self=
.cycles-pp.copy_page
>       1.61 =C2=B1  9%      -1.2        0.44 =C2=B1 10%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.79 =C2=B1  9%      -0.6        0.20 =C2=B1 10%  perf-profile.self=
.cycles-pp.__orc_find
>       0.65 =C2=B1 17%      -0.6        0.07 =C2=B1 48%  perf-profile.self=
.cycles-pp.btrfs_get_32
>       0.62 =C2=B1 12%      -0.5        0.14 =C2=B1 15%  perf-profile.self=
.cycles-pp.unwind_next_frame
>       0.52 =C2=B1 11%      -0.5        0.06 =C2=B1 48%  perf-profile.self=
.cycles-pp.btrfs_comp_cpu_keys
>       0.45 =C2=B1 14%      -0.4        0.05 =C2=B1 46%  perf-profile.self=
.cycles-pp.__radix_tree_lookup
>       0.42 =C2=B1 16%      -0.4        0.04 =C2=B1 45%  perf-profile.self=
.cycles-pp.find_extent_buffer_nolock
>       0.66 =C2=B1  9%      -0.4        0.30 =C2=B1 10%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.33 =C2=B1 13%      -0.3        0.02 =C2=B1 99%  perf-profile.self=
.cycles-pp.check_setget_bounds
>       0.34 =C2=B1  9%      -0.3        0.04 =C2=B1 73%  perf-profile.self=
.cycles-pp.generic_bin_search
>       0.32 =C2=B1 18%      -0.3        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.btrfs_search_slot
>       0.31 =C2=B1  8%      -0.3        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.__get_user_nocheck_8
>       0.26 =C2=B1 13%      -0.2        0.05 =C2=B1 45%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       0.24 =C2=B1 12%      -0.2        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.memcpy_erms
>       0.20 =C2=B1  8%      -0.2        0.03 =C2=B1 70%  perf-profile.self=
.cycles-pp.__might_resched
>       0.22 =C2=B1 12%      -0.2        0.06 =C2=B1 11%  perf-profile.self=
.cycles-pp.orc_find
>       0.18 =C2=B1  9%      -0.1        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.__etree_search
>       0.21 =C2=B1 69%      -0.1        0.08 =C2=B1 24%  perf-profile.self=
.cycles-pp._find_next_bit
>       0.24 =C2=B1 18%      -0.1        0.15 =C2=B1 13%  perf-profile.self=
.cycles-pp.queue_event
>       0.10 =C2=B1 10%      -0.0        0.07 =C2=B1 16%  perf-profile.self=
.cycles-pp.idle_cpu
>       0.16 =C2=B1 30%      +1.7        1.88 =C2=B1102%  perf-profile.self=
.cycles-pp.rwsem_spin_on_owner
>       0.00            +3.3        3.29 =C2=B1 10%  perf-profile.self.cycl=
es-pp.find_first_extent_bit_state
>       3.56 =C2=B1  7%      +4.4        7.93 =C2=B1  5%  perf-profile.self=
.cycles-pp.mutex_spin_on_owner
>       0.34 =C2=B1 15%      +6.4        6.77 =C2=B1  6%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>       1.31 =C2=B1 17%      +6.7        7.98 =C2=B1  7%  perf-profile.self=
.cycles-pp.osq_lock
>       0.16 =C2=B1 24%     +11.9       12.04 =C2=B1  6%  perf-profile.self=
.cycles-pp.rb_next
>      63652 =C2=B1  4%    +342.1%     281400 =C2=B1 22%  softirqs.CPU0.RCU
>      49340 =C2=B1  3%    +323.7%     209037 =C2=B1  4%  softirqs.CPU0.SCH=
ED
>      77569 =C2=B1 22%    +301.1%     311142 =C2=B1 16%  softirqs.CPU1.RCU
>      51305 =C2=B1  5%    +440.7%     277414 =C2=B1 12%  softirqs.CPU1.SCH=
ED
>      63598 =C2=B1  7%    +393.4%     313821 =C2=B1 12%  softirqs.CPU10.RCU
>      46668 =C2=B1  3%    +442.9%     253366 =C2=B1 12%  softirqs.CPU10.SC=
HED
>      56913 =C2=B1  8%    +372.7%     269022 =C2=B1 24%  softirqs.CPU100.R=
CU
>      44647 =C2=B1  4%    +342.7%     197632 =C2=B1  4%  softirqs.CPU100.S=
CHED
>      54306 =C2=B1  5%    +428.0%     286713 =C2=B1 24%  softirqs.CPU101.R=
CU
>      43536 =C2=B1  5%    +352.3%     196901 =C2=B1  3%  softirqs.CPU101.S=
CHED
>      57307 =C2=B1  5%    +403.7%     288668 =C2=B1 24%  softirqs.CPU102.R=
CU
>      44116 =C2=B1  5%    +344.9%     196272 =C2=B1  3%  softirqs.CPU102.S=
CHED
>      55926 =C2=B1  5%    +396.2%     277483 =C2=B1 24%  softirqs.CPU103.R=
CU
>      43612 =C2=B1  5%    +344.3%     193773 =C2=B1  3%  softirqs.CPU103.S=
CHED
>      52019 =C2=B1 12%    +409.4%     264966 =C2=B1 25%  softirqs.CPU104.R=
CU
>      37370 =C2=B1 24%    +406.0%     189092 =C2=B1  4%  softirqs.CPU104.S=
CHED
>      58110 =C2=B1  5%    +399.9%     290468 =C2=B1 23%  softirqs.CPU105.R=
CU
>      43964 =C2=B1  5%    +350.1%     197899 =C2=B1  4%  softirqs.CPU105.S=
CHED
>      57196 =C2=B1  4%    +389.7%     280102 =C2=B1 24%  softirqs.CPU106.R=
CU
>      43755 =C2=B1  5%    +350.2%     196999 =C2=B1  3%  softirqs.CPU106.S=
CHED
>      57359 =C2=B1  5%    +401.5%     287675 =C2=B1 24%  softirqs.CPU107.R=
CU
>      43586 =C2=B1  5%    +348.2%     195346 =C2=B1  4%  softirqs.CPU107.S=
CHED
>      58033 =C2=B1  5%    +394.4%     286918 =C2=B1 23%  softirqs.CPU108.R=
CU
>      43774 =C2=B1  4%    +348.7%     196415 =C2=B1  3%  softirqs.CPU108.S=
CHED
>      55569 =C2=B1  9%    +396.6%     275947 =C2=B1 24%  softirqs.CPU109.R=
CU
>      40526 =C2=B1 16%    +379.0%     194101 =C2=B1  3%  softirqs.CPU109.S=
CHED
>      63823 =C2=B1 12%    +356.7%     291484 =C2=B1 21%  softirqs.CPU11.RCU
>      46707 =C2=B1  7%    +339.0%     205048 =C2=B1  4%  softirqs.CPU11.SC=
HED
>      55191 =C2=B1  4%    +376.4%     262942 =C2=B1 18%  softirqs.CPU110.R=
CU
>      42677 =C2=B1  5%    +346.8%     190674 =C2=B1  4%  softirqs.CPU110.S=
CHED
>      57155 =C2=B1  6%    +390.3%     280242 =C2=B1 21%  softirqs.CPU111.R=
CU
>      43508 =C2=B1  5%    +346.8%     194411 =C2=B1  3%  softirqs.CPU111.S=
CHED
>      48597 =C2=B1  5%    +408.8%     247256 =C2=B1 24%  softirqs.CPU112.R=
CU
>      43644 =C2=B1  5%    +306.3%     177304 =C2=B1 19%  softirqs.CPU112.S=
CHED
>      57125 =C2=B1 24%    +395.7%     283157 =C2=B1 16%  softirqs.CPU113.R=
CU
>      46364 =C2=B1  8%    +424.7%     243265 =C2=B1 13%  softirqs.CPU113.S=
CHED
>      51740 =C2=B1  7%    +404.6%     261059 =C2=B1 22%  softirqs.CPU114.R=
CU
>      42019 =C2=B1 18%    +374.5%     199368 =C2=B1  3%  softirqs.CPU114.S=
CHED
>      58832 =C2=B1 23%    +385.0%     285311 =C2=B1 13%  softirqs.CPU115.R=
CU
>      46274 =C2=B1  9%    +479.9%     268326 =C2=B1 11%  softirqs.CPU115.S=
CHED
>      54480 =C2=B1  7%    +377.9%     260376 =C2=B1 20%  softirqs.CPU116.R=
CU
>      45349 =C2=B1  5%    +350.6%     204338 =C2=B1  3%  softirqs.CPU116.S=
CHED
>      53106 =C2=B1 10%    +369.5%     249325 =C2=B1 20%  softirqs.CPU117.R=
CU
>      44834 =C2=B1  2%    +346.3%     200104 =C2=B1  3%  softirqs.CPU117.S=
CHED
>      69617 =C2=B1 19%    +310.4%     285713 =C2=B1 13%  softirqs.CPU118.R=
CU
>      49272 =C2=B1  4%    +427.5%     259921 =C2=B1 10%  softirqs.CPU118.S=
CHED
>      56984 =C2=B1  4%    +356.1%     259910 =C2=B1 20%  softirqs.CPU119.R=
CU
>      44993 =C2=B1  5%    +356.8%     205534 =C2=B1  3%  softirqs.CPU119.S=
CHED
>       3971 =C2=B1 82%    +570.9%      26643 =C2=B1 33%  softirqs.CPU12.NE=
T_RX
>      60932 =C2=B1  6%    +379.2%     291960 =C2=B1 20%  softirqs.CPU12.RCU
>      45366 =C2=B1  4%    +350.9%     204570 =C2=B1  4%  softirqs.CPU12.SC=
HED
>      52992 =C2=B1 10%    +348.7%     237785 =C2=B1 16%  softirqs.CPU120.R=
CU
>      42449 =C2=B1 18%    +377.7%     202781 =C2=B1  4%  softirqs.CPU120.S=
CHED
>      47849 =C2=B1 10%    +365.3%     222632 =C2=B1 12%  softirqs.CPU121.R=
CU
>      45212 =C2=B1  3%    +338.1%     198056 =C2=B1  9%  softirqs.CPU121.S=
CHED
>      49431 =C2=B1 10%    +365.1%     229896 =C2=B1 12%  softirqs.CPU122.R=
CU
>      45367 =C2=B1  4%    +352.7%     205373 =C2=B1  2%  softirqs.CPU122.S=
CHED
>      53860 =C2=B1 12%    +336.8%     235268 =C2=B1 14%  softirqs.CPU123.R=
CU
>      42520 =C2=B1 15%    +385.5%     206453 =C2=B1  2%  softirqs.CPU123.S=
CHED
>      53023 =C2=B1 12%    +354.0%     240730 =C2=B1 13%  softirqs.CPU124.R=
CU
>      45270 =C2=B1  3%    +355.2%     206090 =C2=B1  2%  softirqs.CPU124.S=
CHED
>      53843 =C2=B1 12%    +323.7%     228115 =C2=B1 10%  softirqs.CPU125.R=
CU
>      45383 =C2=B1  3%    +354.5%     206269 =C2=B1  2%  softirqs.CPU125.S=
CHED
>      50612 =C2=B1 10%    +354.2%     229899 =C2=B1 14%  softirqs.CPU126.R=
CU
>      43458 =C2=B1 11%    +373.3%     205690 =C2=B1  2%  softirqs.CPU126.S=
CHED
>      47811 =C2=B1 10%    +354.5%     217312 =C2=B1 15%  softirqs.CPU127.R=
CU
>      45393 =C2=B1  3%    +350.9%     204676 =C2=B1  2%  softirqs.CPU127.S=
CHED
>      60930 =C2=B1 11%    +344.5%     270847 =C2=B1 15%  softirqs.CPU128.R=
CU
>      44984 =C2=B1  4%    +355.5%     204927 =C2=B1  2%  softirqs.CPU128.S=
CHED
>      63281 =C2=B1 16%    +319.1%     265212 =C2=B1 17%  softirqs.CPU129.R=
CU
>      44936 =C2=B1  3%    +357.9%     205778 =C2=B1  2%  softirqs.CPU129.S=
CHED
>       2554 =C2=B1126%    +781.9%      22525 =C2=B1 79%  softirqs.CPU13.NE=
T_RX
>      59587 =C2=B1  8%    +411.2%     304622 =C2=B1 15%  softirqs.CPU13.RCU
>      44708 =C2=B1  6%    +430.8%     237330 =C2=B1 17%  softirqs.CPU13.SC=
HED
>      61517 =C2=B1 11%    +357.2%     281242 =C2=B1 11%  softirqs.CPU130.R=
CU
>      44925 =C2=B1  3%    +356.9%     205246 =C2=B1  2%  softirqs.CPU130.S=
CHED
>      65236 =C2=B1 16%    +349.5%     293206 =C2=B1 12%  softirqs.CPU131.R=
CU
>      45403 =C2=B1  3%    +352.8%     205592 =C2=B1  2%  softirqs.CPU131.S=
CHED
>      62192 =C2=B1 14%    +375.4%     295674 =C2=B1 13%  softirqs.CPU132.R=
CU
>      42904 =C2=B1 14%    +378.8%     205413 =C2=B1  2%  softirqs.CPU132.S=
CHED
>      58253 =C2=B1  6%    +364.4%     270520 =C2=B1 13%  softirqs.CPU133.R=
CU
>      45293 =C2=B1  2%    +351.7%     204596 =C2=B1  2%  softirqs.CPU133.S=
CHED
>      61163 =C2=B1 10%    +351.1%     275886 =C2=B1  8%  softirqs.CPU134.R=
CU
>      45033 =C2=B1  3%    +354.5%     204692 =C2=B1  2%  softirqs.CPU134.S=
CHED
>      64743 =C2=B1 17%    +338.5%     283887 =C2=B1  9%  softirqs.CPU135.R=
CU
>      45320 =C2=B1  3%    +354.4%     205955 =C2=B1  2%  softirqs.CPU135.S=
CHED
>      59767 =C2=B1 10%    +362.4%     276383 =C2=B1 11%  softirqs.CPU136.R=
CU
>      45304 =C2=B1  3%    +352.6%     205044 =C2=B1  2%  softirqs.CPU136.S=
CHED
>      66245 =C2=B1 16%    +347.1%     296169 =C2=B1 11%  softirqs.CPU137.R=
CU
>      45400 =C2=B1  3%    +346.8%     202857 =C2=B1  4%  softirqs.CPU137.S=
CHED
>      12.67 =C2=B1 15%  +28681.6%       3645 =C2=B1222%  softirqs.CPU137.T=
IMER
>      63311 =C2=B1 19%    +356.8%     289197 =C2=B1 14%  softirqs.CPU138.R=
CU
>      45374 =C2=B1  3%    +353.9%     205954 =C2=B1  2%  softirqs.CPU138.S=
CHED
>      65646 =C2=B1 15%    +327.8%     280826 =C2=B1 12%  softirqs.CPU139.R=
CU
>      45240 =C2=B1  3%    +340.2%     199168 =C2=B1  2%  softirqs.CPU139.S=
CHED
>      16.00 =C2=B1 25%  +56830.2%       9108 =C2=B1215%  softirqs.CPU139.T=
IMER
>      60185 =C2=B1  6%    +371.6%     283832 =C2=B1 24%  softirqs.CPU14.RCU
>      41827 =C2=B1 17%    +379.4%     200505 =C2=B1  2%  softirqs.CPU14.SC=
HED
>      65300 =C2=B1 18%    +342.3%     288816 =C2=B1 12%  softirqs.CPU140.R=
CU
>      45340 =C2=B1  3%    +353.8%     205747 =C2=B1  2%  softirqs.CPU140.S=
CHED
>      62410 =C2=B1 13%    +350.8%     281343 =C2=B1 10%  softirqs.CPU141.R=
CU
>      45172 =C2=B1  4%    +354.8%     205421 =C2=B1  2%  softirqs.CPU141.S=
CHED
>      66114 =C2=B1 16%    +345.3%     294423 =C2=B1 12%  softirqs.CPU142.R=
CU
>      44910 =C2=B1  5%    +357.8%     205590 =C2=B1  2%  softirqs.CPU142.S=
CHED
>      59908 =C2=B1 26%    +365.1%     278631 =C2=B1 16%  softirqs.CPU143.R=
CU
>      45322 =C2=B1  3%    +354.2%     205841 =C2=B1  2%  softirqs.CPU143.S=
CHED
>      58563 =C2=B1 17%    +355.5%     266765 =C2=B1 19%  softirqs.CPU144.R=
CU
>      45398 =C2=B1  3%    +269.3%     167665 =C2=B1 32%  softirqs.CPU144.S=
CHED
>      57117 =C2=B1 14%    +353.1%     258821 =C2=B1 16%  softirqs.CPU145.R=
CU
>      44873 =C2=B1  3%    +359.9%     206370 =C2=B1  2%  softirqs.CPU145.S=
CHED
>      53695 =C2=B1 12%    +379.9%     257672 =C2=B1 15%  softirqs.CPU146.R=
CU
>      45108 =C2=B1  3%    +356.0%     205710 =C2=B1  2%  softirqs.CPU146.S=
CHED
>      60494 =C2=B1 19%    +362.9%     280037 =C2=B1 11%  softirqs.CPU147.R=
CU
>      45342 =C2=B1  2%    +355.8%     206659        softirqs.CPU147.SCHED
>      61708 =C2=B1 17%    +355.0%     280785 =C2=B1 12%  softirqs.CPU148.R=
CU
>      44963 =C2=B1  2%    +325.1%     191135 =C2=B1 17%  softirqs.CPU148.S=
CHED
>      62685 =C2=B1 19%    +354.7%     285033 =C2=B1 12%  softirqs.CPU149.R=
CU
>      44887 =C2=B1  2%    +359.8%     206389        softirqs.CPU149.SCHED
>      60025 =C2=B1  9%    +374.5%     284843 =C2=B1 22%  softirqs.CPU15.RCU
>      46873 =C2=B1 12%    +305.0%     189826 =C2=B1 15%  softirqs.CPU15.SC=
HED
>      63745 =C2=B1 17%    +341.1%     281196 =C2=B1 13%  softirqs.CPU150.R=
CU
>      45400 =C2=B1  3%    +354.2%     206227 =C2=B1  2%  softirqs.CPU150.S=
CHED
>      59142 =C2=B1 17%    +391.8%     290854 =C2=B1 13%  softirqs.CPU151.R=
CU
>      45063 =C2=B1  3%    +356.8%     205846 =C2=B1  2%  softirqs.CPU151.S=
CHED
>      62173 =C2=B1 19%    +368.5%     291301 =C2=B1 12%  softirqs.CPU152.R=
CU
>      44941 =C2=B1  3%    +359.9%     206698        softirqs.CPU152.SCHED
>      60823 =C2=B1 14%    +362.7%     281461 =C2=B1 14%  softirqs.CPU153.R=
CU
>      45298 =C2=B1  3%    +354.9%     206063 =C2=B1  2%  softirqs.CPU153.S=
CHED
>      63059 =C2=B1 18%    +374.1%     298987 =C2=B1 12%  softirqs.CPU154.R=
CU
>      44578 =C2=B1  2%    +362.7%     206273 =C2=B1  2%  softirqs.CPU154.S=
CHED
>      63445 =C2=B1 19%    +372.1%     299518 =C2=B1 11%  softirqs.CPU155.R=
CU
>      45381 =C2=B1  3%    +355.2%     206577        softirqs.CPU155.SCHED
>      56287 =C2=B1 13%    +384.0%     272439 =C2=B1 15%  softirqs.CPU156.R=
CU
>      44609 =C2=B1  3%    +360.3%     205323 =C2=B1  2%  softirqs.CPU156.S=
CHED
>      58413 =C2=B1 13%    +368.8%     273828 =C2=B1 14%  softirqs.CPU157.R=
CU
>      44570 =C2=B1  3%    +360.9%     205442 =C2=B1  2%  softirqs.CPU157.S=
CHED
>      62362 =C2=B1 18%    +356.1%     284451 =C2=B1 12%  softirqs.CPU158.R=
CU
>      44831 =C2=B1  2%    +360.7%     206536        softirqs.CPU158.SCHED
>      58942 =C2=B1 12%    +362.7%     272740 =C2=B1 18%  softirqs.CPU159.R=
CU
>      44870 =C2=B1  2%    +358.8%     205858 =C2=B1  2%  softirqs.CPU159.S=
CHED
>      52648 =C2=B1  7%    +370.0%     247431 =C2=B1 19%  softirqs.CPU16.RCU
>      45545 =C2=B1  4%    +303.5%     183786 =C2=B1 18%  softirqs.CPU16.SC=
HED
>      54794 =C2=B1 18%    +404.5%     276449 =C2=B1  9%  softirqs.CPU160.R=
CU
>      45248 =C2=B1  3%    +356.2%     206408        softirqs.CPU160.SCHED
>      56431 =C2=B1 17%    +402.2%     283391 =C2=B1  9%  softirqs.CPU161.R=
CU
>      45258 =C2=B1  3%    +356.5%     206609        softirqs.CPU161.SCHED
>      50149 =C2=B1 16%    +394.1%     247814 =C2=B1 18%  softirqs.CPU162.R=
CU
>      44263 =C2=B1  3%    +363.7%     205261 =C2=B1  2%  softirqs.CPU162.S=
CHED
>      56212 =C2=B1 17%    +385.9%     273156 =C2=B1  9%  softirqs.CPU163.R=
CU
>      44865 =C2=B1  3%    +359.1%     205966 =C2=B1  2%  softirqs.CPU163.S=
CHED
>      56988 =C2=B1 22%    +399.2%     284493 =C2=B1  9%  softirqs.CPU164.R=
CU
>      45379 =C2=B1  2%    +355.2%     206584        softirqs.CPU164.SCHED
>      54719 =C2=B1 15%    +390.0%     268124 =C2=B1 13%  softirqs.CPU165.R=
CU
>      44588 =C2=B1  3%    +361.1%     205613 =C2=B1  2%  softirqs.CPU165.S=
CHED
>      58206 =C2=B1 18%    +373.3%     275474 =C2=B1 18%  softirqs.CPU166.R=
CU
>      44633 =C2=B1  3%    +362.5%     206428        softirqs.CPU166.SCHED
>      57704 =C2=B1 17%    +395.9%     286158 =C2=B1 10%  softirqs.CPU167.R=
CU
>      45202 =C2=B1  2%    +356.6%     206389 =C2=B1  2%  softirqs.CPU167.S=
CHED
>      55062 =C2=B1 14%    +354.5%     250266 =C2=B1 17%  softirqs.CPU168.R=
CU
>      42774 =C2=B1 17%    +348.3%     191774 =C2=B1 18%  softirqs.CPU168.S=
CHED
>      51581 =C2=B1 16%    +352.2%     233273 =C2=B1 12%  softirqs.CPU169.R=
CU
>      45634 =C2=B1  3%    +357.5%     208756        softirqs.CPU169.SCHED
>     109.33 =C2=B1150%   +2088.3%       2392 =C2=B1157%  softirqs.CPU169.T=
IMER
>      51076 =C2=B1  8%    +400.3%     255559 =C2=B1 22%  softirqs.CPU17.RCU
>      43946 =C2=B1  8%    +355.4%     200130 =C2=B1  3%  softirqs.CPU17.SC=
HED
>      49451 =C2=B1 11%    +385.0%     239833 =C2=B1 13%  softirqs.CPU170.R=
CU
>      45525 =C2=B1  3%    +357.1%     208092        softirqs.CPU170.SCHED
>      57199 =C2=B1 17%    +349.3%     257006 =C2=B1  9%  softirqs.CPU171.R=
CU
>      45644 =C2=B1  3%    +355.7%     208002        softirqs.CPU171.SCHED
>      17.67 =C2=B1 42%  +36935.8%       6543 =C2=B1219%  softirqs.CPU171.T=
IMER
>      55843 =C2=B1 18%    +347.9%     250126 =C2=B1  8%  softirqs.CPU172.R=
CU
>      45312 =C2=B1  4%    +358.8%     207902        softirqs.CPU172.SCHED
>      56791 =C2=B1 17%    +357.4%     259792 =C2=B1  8%  softirqs.CPU173.R=
CU
>      45497 =C2=B1  3%    +356.9%     207893        softirqs.CPU173.SCHED
>      56186 =C2=B1 17%    +357.9%     257270 =C2=B1  9%  softirqs.CPU174.R=
CU
>      45426 =C2=B1  3%    +357.6%     207862        softirqs.CPU174.SCHED
>      54313 =C2=B1 14%    +354.2%     246718 =C2=B1  8%  softirqs.CPU175.R=
CU
>      45485 =C2=B1  3%    +356.4%     207576        softirqs.CPU175.SCHED
>      57429 =C2=B1 18%    +392.5%     282841 =C2=B1 17%  softirqs.CPU176.R=
CU
>      45934 =C2=B1  3%    +352.6%     207919        softirqs.CPU176.SCHED
>      57061 =C2=B1 13%    +377.7%     272553 =C2=B1 14%  softirqs.CPU177.R=
CU
>      45238 =C2=B1  4%    +359.9%     208050        softirqs.CPU177.SCHED
>      59204 =C2=B1 16%    +390.7%     290508 =C2=B1 11%  softirqs.CPU178.R=
CU
>      44756 =C2=B1  4%    +364.7%     207983        softirqs.CPU178.SCHED
>      61089 =C2=B1 16%    +381.9%     294400 =C2=B1 12%  softirqs.CPU179.R=
CU
>      45622 =C2=B1  3%    +356.1%     208097        softirqs.CPU179.SCHED
>      53248 =C2=B1  7%    +389.6%     260710 =C2=B1 20%  softirqs.CPU18.RCU
>      42303 =C2=B1 15%    +380.1%     203100 =C2=B1  3%  softirqs.CPU18.SC=
HED
>      56495 =C2=B1 11%    +381.1%     271819 =C2=B1 12%  softirqs.CPU180.R=
CU
>      45165 =C2=B1  4%    +324.4%     191661 =C2=B1 18%  softirqs.CPU180.S=
CHED
>      56109 =C2=B1 12%    +374.0%     265983 =C2=B1 12%  softirqs.CPU181.R=
CU
>      45113 =C2=B1  3%    +360.7%     207829        softirqs.CPU181.SCHED
>      61889 =C2=B1 16%    +361.8%     285815 =C2=B1  9%  softirqs.CPU182.R=
CU
>      45606 =C2=B1  3%    +356.1%     208024        softirqs.CPU182.SCHED
>      57114 =C2=B1 11%    +389.6%     279620 =C2=B1 16%  softirqs.CPU183.R=
CU
>      45233 =C2=B1  4%    +344.6%     201088 =C2=B1  7%  softirqs.CPU183.S=
CHED
>      61548 =C2=B1 15%    +375.1%     292441 =C2=B1 12%  softirqs.CPU184.R=
CU
>      45836 =C2=B1  2%    +360.2%     210937 =C2=B1  3%  softirqs.CPU184.S=
CHED
>      63265 =C2=B1 17%    +376.7%     301557 =C2=B1 13%  softirqs.CPU185.R=
CU
>      45427 =C2=B1  3%    +387.2%     221324 =C2=B1 14%  softirqs.CPU185.S=
CHED
>      55427 =C2=B1  8%    +393.6%     273596 =C2=B1 19%  softirqs.CPU186.R=
CU
>      45019 =C2=B1  5%    +371.4%     212211 =C2=B1  4%  softirqs.CPU186.S=
CHED
>      61836 =C2=B1 16%    +375.6%     294062 =C2=B1 18%  softirqs.CPU187.R=
CU
>      45495 =C2=B1  4%    +389.6%     222739 =C2=B1 14%  softirqs.CPU187.S=
CHED
>      63091 =C2=B1 18%    +363.7%     292538 =C2=B1 17%  softirqs.CPU188.R=
CU
>      45246 =C2=B1  3%    +369.7%     212530 =C2=B1  4%  softirqs.CPU188.S=
CHED
>      60039 =C2=B1 14%    +365.2%     279312 =C2=B1 15%  softirqs.CPU189.R=
CU
>      45293 =C2=B1  3%    +372.8%     214132 =C2=B1  6%  softirqs.CPU189.S=
CHED
>      49889 =C2=B1  7%    +395.7%     247286 =C2=B1 23%  softirqs.CPU19.RCU
>      44310 =C2=B1  4%    +356.3%     202195        softirqs.CPU19.SCHED
>      61474 =C2=B1 17%    +369.3%     288500 =C2=B1 23%  softirqs.CPU190.R=
CU
>      45783 =C2=B1  3%    +395.9%     227022 =C2=B1 18%  softirqs.CPU190.S=
CHED
>      56580 =C2=B1 15%    +392.8%     278821 =C2=B1 13%  softirqs.CPU191.R=
CU
>      38811 =C2=B1 25%    +284.3%     149137 =C2=B1 26%  softirqs.CPU191.S=
CHED
>      68047 =C2=B1  9%    +304.3%     275101 =C2=B1 22%  softirqs.CPU2.RCU
>      45157 =C2=B1 18%    +355.3%     205616 =C2=B1  4%  softirqs.CPU2.SCH=
ED
>      51325 =C2=B1  2%    +392.8%     252926 =C2=B1 22%  softirqs.CPU20.RCU
>      44653 =C2=B1  4%    +347.1%     199634 =C2=B1  3%  softirqs.CPU20.SC=
HED
>      50340 =C2=B1  7%    +386.5%     244919 =C2=B1 20%  softirqs.CPU21.RCU
>      41791 =C2=B1 16%    +371.4%     197016 =C2=B1  3%  softirqs.CPU21.SC=
HED
>      51067 =C2=B1  8%    +390.5%     250469 =C2=B1 22%  softirqs.CPU22.RCU
>      42769 =C2=B1 14%    +366.6%     199543 =C2=B1  3%  softirqs.CPU22.SC=
HED
>      51188 =C2=B1  6%    +387.8%     249670 =C2=B1 24%  softirqs.CPU23.RCU
>      44890 =C2=B1  3%    +345.1%     199786 =C2=B1  3%  softirqs.CPU23.SC=
HED
>      52297 =C2=B1 10%    +357.2%     239089 =C2=B1 16%  softirqs.CPU24.RCU
>      46179 =C2=B1  2%    +348.4%     207072 =C2=B1  3%  softirqs.CPU24.SC=
HED
>      47969 =C2=B1 10%    +360.0%     220664 =C2=B1 14%  softirqs.CPU25.RCU
>      45420 =C2=B1  3%    +351.8%     205216 =C2=B1  2%  softirqs.CPU25.SC=
HED
>      82.33 =C2=B1127%   +6649.8%       5557 =C2=B1137%  softirqs.CPU25.TI=
MER
>      49379 =C2=B1 10%    +358.5%     226384 =C2=B1 14%  softirqs.CPU26.RCU
>      45515 =C2=B1  3%    +357.8%     208350 =C2=B1  4%  softirqs.CPU26.SC=
HED
>      20.50 =C2=B1 97%  +33919.5%       6974 =C2=B1139%  softirqs.CPU26.TI=
MER
>      55152 =C2=B1 11%    +329.1%     236637 =C2=B1 14%  softirqs.CPU27.RCU
>      45778 =C2=B1  3%    +349.3%     205684 =C2=B1  2%  softirqs.CPU27.SC=
HED
>      54946 =C2=B1 12%    +337.3%     240300 =C2=B1 13%  softirqs.CPU28.RCU
>      42795 =C2=B1 11%    +383.6%     206975 =C2=B1  2%  softirqs.CPU28.SC=
HED
>      55072 =C2=B1 13%    +317.2%     229748 =C2=B1 10%  softirqs.CPU29.RCU
>      46681 =C2=B1  5%    +341.5%     206110        softirqs.CPU29.SCHED
>      64262 =C2=B1  6%    +353.4%     291339 =C2=B1 21%  softirqs.CPU3.RCU
>      45244 =C2=B1  3%    +352.0%     204498 =C2=B1  4%  softirqs.CPU3.SCH=
ED
>      52963 =C2=B1 10%    +330.5%     228029 =C2=B1 14%  softirqs.CPU30.RCU
>      44973 =C2=B1  3%    +364.7%     209004 =C2=B1  5%  softirqs.CPU30.SC=
HED
>      47012 =C2=B1 15%    +360.5%     216483 =C2=B1 15%  softirqs.CPU31.RCU
>      48839 =C2=B1 12%    +320.1%     205164 =C2=B1  3%  softirqs.CPU31.SC=
HED
>      62062 =C2=B1  9%    +344.0%     275539 =C2=B1 14%  softirqs.CPU32.RCU
>      44656 =C2=B1  3%    +359.3%     205125 =C2=B1  2%  softirqs.CPU32.SC=
HED
>      64600 =C2=B1 14%    +318.1%     270075 =C2=B1 17%  softirqs.CPU33.RCU
>      44995 =C2=B1  3%    +356.5%     205428 =C2=B1  2%  softirqs.CPU33.SC=
HED
>      62063 =C2=B1 11%    +358.6%     284614 =C2=B1 11%  softirqs.CPU34.RCU
>      46874 =C2=B1  6%    +336.9%     204784 =C2=B1  2%  softirqs.CPU34.SC=
HED
>      64581 =C2=B1 13%    +353.8%     293098 =C2=B1 11%  softirqs.CPU35.RCU
>      46826 =C2=B1  7%    +342.6%     207236 =C2=B1  3%  softirqs.CPU35.SC=
HED
>      62382 =C2=B1 14%    +378.1%     298226 =C2=B1 11%  softirqs.CPU36.RCU
>      49083 =C2=B1 16%    +319.3%     205786 =C2=B1  2%  softirqs.CPU36.SC=
HED
>      58767 =C2=B1  6%    +359.5%     270030 =C2=B1 12%  softirqs.CPU37.RCU
>      45319 =C2=B1  3%    +350.7%     204245 =C2=B1  2%  softirqs.CPU37.SC=
HED
>      61252 =C2=B1  9%    +353.6%     277816 =C2=B1 10%  softirqs.CPU38.RCU
>      45140 =C2=B1  3%    +352.4%     204200 =C2=B1  2%  softirqs.CPU38.SC=
HED
>      64814 =C2=B1 14%    +345.4%     288672 =C2=B1  8%  softirqs.CPU39.RCU
>      45445 =C2=B1  3%    +352.5%     205627 =C2=B1  2%  softirqs.CPU39.SC=
HED
>      72447 =C2=B1 15%    +322.2%     305901 =C2=B1 18%  softirqs.CPU4.RCU
>      48515 =C2=B1  3%    +438.5%     261238 =C2=B1 11%  softirqs.CPU4.SCH=
ED
>      60628 =C2=B1  8%    +360.2%     278994 =C2=B1 10%  softirqs.CPU40.RCU
>      44990 =C2=B1  3%    +358.8%     206425 =C2=B1  3%  softirqs.CPU40.SC=
HED
>      66477 =C2=B1 14%    +356.4%     303430 =C2=B1 11%  softirqs.CPU41.RCU
>      45648 =C2=B1  3%    +354.4%     207413 =C2=B1  3%  softirqs.CPU41.SC=
HED
>      67773 =C2=B1 17%    +326.5%     289049 =C2=B1 19%  softirqs.CPU42.RCU
>      42284 =C2=B1 15%    +386.9%     205884        softirqs.CPU42.SCHED
>      66206 =C2=B1 14%    +336.1%     288703 =C2=B1 13%  softirqs.CPU43.RCU
>      45434 =C2=B1  3%    +351.9%     205307 =C2=B1  2%  softirqs.CPU43.SC=
HED
>      11.67 =C2=B1 25%  +46575.7%       5445 =C2=B1194%  softirqs.CPU43.TI=
MER
>      66411 =C2=B1 16%    +344.1%     294945 =C2=B1 11%  softirqs.CPU44.RCU
>      45627 =C2=B1  2%    +351.2%     205878        softirqs.CPU44.SCHED
>      63997 =C2=B1 12%    +352.1%     289319 =C2=B1 10%  softirqs.CPU45.RCU
>      45702 =C2=B1  3%    +349.2%     205309 =C2=B1  2%  softirqs.CPU45.SC=
HED
>      66475 =C2=B1 16%    +354.3%     302004 =C2=B1 11%  softirqs.CPU46.RCU
>      45399 =C2=B1  4%    +353.2%     205728 =C2=B1  2%  softirqs.CPU46.SC=
HED
>      64940 =C2=B1 13%    +338.2%     284588 =C2=B1 15%  softirqs.CPU47.RCU
>      45948 =C2=B1  3%    +347.1%     205433 =C2=B1  2%  softirqs.CPU47.SC=
HED
>      60645 =C2=B1 17%    +359.7%     278803 =C2=B1 20%  softirqs.CPU48.RCU
>      45368 =C2=B1  2%    +353.2%     205613 =C2=B1  2%  softirqs.CPU48.SC=
HED
>      59256 =C2=B1 12%    +360.7%     272994 =C2=B1 16%  softirqs.CPU49.RCU
>      45210 =C2=B1  3%    +354.9%     205646 =C2=B1  2%  softirqs.CPU49.SC=
HED
>      68114 =C2=B1 14%    +327.1%     290884 =C2=B1 20%  softirqs.CPU5.RCU
>      56403 =C2=B1 51%    +245.9%     195106 =C2=B1 17%  softirqs.CPU5.SCH=
ED
>      57773 =C2=B1  9%    +361.9%     266846 =C2=B1 16%  softirqs.CPU50.RCU
>      42648 =C2=B1 16%    +381.4%     205329 =C2=B1  2%  softirqs.CPU50.SC=
HED
>      63894 =C2=B1 16%    +354.5%     290411 =C2=B1 12%  softirqs.CPU51.RCU
>      45821 =C2=B1  4%    +345.1%     203948 =C2=B1  3%  softirqs.CPU51.SC=
HED
>      62871 =C2=B1 17%    +357.0%     287303 =C2=B1 12%  softirqs.CPU52.RCU
>      45508 =C2=B1  2%    +352.9%     206120        softirqs.CPU52.SCHED
>      67967 =C2=B1 15%    +324.9%     288781 =C2=B1 12%  softirqs.CPU53.RCU
>      47032 =C2=B1 10%    +303.8%     189894 =C2=B1 19%  softirqs.CPU53.SC=
HED
>      65244 =C2=B1 15%    +333.5%     282855 =C2=B1 12%  softirqs.CPU54.RCU
>      45663 =C2=B1  3%    +347.0%     204113 =C2=B1  3%  softirqs.CPU54.SC=
HED
>      59563 =C2=B1 16%    +390.3%     292045 =C2=B1 13%  softirqs.CPU55.RCU
>      45424 =C2=B1  3%    +352.5%     205550 =C2=B1  2%  softirqs.CPU55.SC=
HED
>      68697 =C2=B1 16%    +336.1%     299594 =C2=B1 11%  softirqs.CPU56.RCU
>      47117 =C2=B1 11%    +337.2%     206013        softirqs.CPU56.SCHED
>      62397 =C2=B1 12%    +363.5%     289229 =C2=B1 14%  softirqs.CPU57.RCU
>      42533 =C2=B1 12%    +344.9%     189219 =C2=B1 18%  softirqs.CPU57.SC=
HED
>      64451 =C2=B1 16%    +376.4%     307026 =C2=B1 11%  softirqs.CPU58.RCU
>      45128 =C2=B1  4%    +354.9%     205272        softirqs.CPU58.SCHED
>      67900 =C2=B1 14%    +353.2%     307718 =C2=B1 10%  softirqs.CPU59.RCU
>      46343 =C2=B1  8%    +345.0%     206239        softirqs.CPU59.SCHED
>      63234 =C2=B1  6%    +356.1%     288392 =C2=B1 22%  softirqs.CPU6.RCU
>      44442 =C2=B1  7%    +359.3%     204137 =C2=B1  4%  softirqs.CPU6.SCH=
ED
>      59115 =C2=B1  9%    +378.5%     282874 =C2=B1 16%  softirqs.CPU60.RCU
>      45396 =C2=B1  3%    +352.0%     205203 =C2=B1  2%  softirqs.CPU60.SC=
HED
>      59494 =C2=B1  9%    +368.0%     278421 =C2=B1 14%  softirqs.CPU61.RCU
>      45655 =C2=B1  3%    +349.7%     205298 =C2=B1  2%  softirqs.CPU61.SC=
HED
>      65960 =C2=B1 14%    +341.6%     291281 =C2=B1 11%  softirqs.CPU62.RCU
>      46434 =C2=B1  6%    +344.1%     206206        softirqs.CPU62.SCHED
>      61572 =C2=B1 10%    +339.5%     270610 =C2=B1 20%  softirqs.CPU63.RCU
>      40841 =C2=B1 19%    +403.7%     205723 =C2=B1  2%  softirqs.CPU63.SC=
HED
>      64.83 =C2=B1124%   +8867.4%       5813 =C2=B1162%  softirqs.CPU63.TI=
MER
>      55899 =C2=B1 17%    +402.1%     280642 =C2=B1 10%  softirqs.CPU64.RCU
>      45271 =C2=B1  3%    +354.9%     205920 =C2=B1  2%  softirqs.CPU64.SC=
HED
>      56599 =C2=B1 19%    +404.9%     285780 =C2=B1  9%  softirqs.CPU65.RCU
>      45115 =C2=B1  3%    +357.2%     206261        softirqs.CPU65.SCHED
>      50803 =C2=B1 16%    +402.1%     255070 =C2=B1 20%  softirqs.CPU66.RCU
>      45109 =C2=B1  2%    +355.2%     205323 =C2=B1  2%  softirqs.CPU66.SC=
HED
>      57587 =C2=B1 17%    +387.2%     280551 =C2=B1 11%  softirqs.CPU67.RCU
>      44830 =C2=B1  2%    +359.2%     205864 =C2=B1  2%  softirqs.CPU67.SC=
HED
>      58698 =C2=B1 20%    +392.8%     289238 =C2=B1  9%  softirqs.CPU68.RCU
>      45091 =C2=B1  3%    +357.3%     206205        softirqs.CPU68.SCHED
>      55763 =C2=B1 16%    +391.3%     273967 =C2=B1 13%  softirqs.CPU69.RCU
>      45122 =C2=B1  2%    +356.5%     205996 =C2=B1  2%  softirqs.CPU69.SC=
HED
>      67476 =C2=B1 16%    +369.9%     317099 =C2=B1 15%  softirqs.CPU7.RCU
>      46833 =C2=B1  5%    +389.0%     229008 =C2=B1 27%  softirqs.CPU7.SCH=
ED
>      58868 =C2=B1 17%    +376.5%     280531 =C2=B1 17%  softirqs.CPU70.RCU
>      45317 =C2=B1  2%    +354.2%     205815        softirqs.CPU70.SCHED
>      58439 =C2=B1 18%    +395.2%     289404 =C2=B1 10%  softirqs.CPU71.RCU
>      44994 =C2=B1  3%    +358.1%     206131 =C2=B1  2%  softirqs.CPU71.SC=
HED
>      56194 =C2=B1 14%    +369.1%     263625 =C2=B1 15%  softirqs.CPU72.RCU
>      45606 =C2=B1  2%    +365.5%     212316 =C2=B1  4%  softirqs.CPU72.SC=
HED
>      53492 =C2=B1 15%    +384.8%     259308 =C2=B1 18%  softirqs.CPU73.RCU
>      42384 =C2=B1 18%    +431.9%     225421 =C2=B1 17%  softirqs.CPU73.SC=
HED
>      50421 =C2=B1 11%    +406.3%     255290 =C2=B1 15%  softirqs.CPU74.RCU
>      45056 =C2=B1  3%    +365.8%     209866 =C2=B1  3%  softirqs.CPU74.SC=
HED
>      58777 =C2=B1 18%    +365.5%     273592 =C2=B1  8%  softirqs.CPU75.RCU
>      41914 =C2=B1 18%    +399.4%     209311 =C2=B1  2%  softirqs.CPU75.SC=
HED
>      57403 =C2=B1 17%    +370.0%     269822 =C2=B1 10%  softirqs.CPU76.RCU
>      45059 =C2=B1  3%    +385.7%     218874 =C2=B1 13%  softirqs.CPU76.SC=
HED
>      58353 =C2=B1 16%    +361.4%     269221 =C2=B1  8%  softirqs.CPU77.RCU
>      45602 =C2=B1  2%    +355.4%     207662 =C2=B1  2%  softirqs.CPU77.SC=
HED
>      57557 =C2=B1 17%    +361.9%     265888 =C2=B1  8%  softirqs.CPU78.RCU
>      45130 =C2=B1  3%    +360.3%     207718        softirqs.CPU78.SCHED
>      55270 =C2=B1 15%    +382.6%     266740 =C2=B1 13%  softirqs.CPU79.RCU
>      45451 =C2=B1  3%    +375.0%     215880 =C2=B1  9%  softirqs.CPU79.SC=
HED
>      63442 =C2=B1 14%    +344.3%     281856 =C2=B1 23%  softirqs.CPU8.RCU
>      45979 =C2=B1  9%    +338.6%     201664 =C2=B1  7%  softirqs.CPU8.SCH=
ED
>      60531 =C2=B1 15%    +351.2%     273091 =C2=B1 13%  softirqs.CPU80.RCU
>      45469 =C2=B1  2%    +356.2%     207450        softirqs.CPU80.SCHED
>      57455 =C2=B1 14%    +380.5%     276047 =C2=B1 14%  softirqs.CPU81.RCU
>      45116 =C2=B1  2%    +359.3%     207237        softirqs.CPU81.SCHED
>      61087 =C2=B1 16%    +395.8%     302853 =C2=B1 14%  softirqs.CPU82.RCU
>      45382 =C2=B1  2%    +369.5%     213085 =C2=B1  5%  softirqs.CPU82.SC=
HED
>      62548 =C2=B1 16%    +387.7%     305020 =C2=B1 13%  softirqs.CPU83.RCU
>      45310 =C2=B1  2%    +356.8%     206982        softirqs.CPU83.SCHED
>      57140 =C2=B1 11%    +384.5%     276871 =C2=B1 12%  softirqs.CPU84.RCU
>      45086 =C2=B1  3%    +360.7%     207726        softirqs.CPU84.SCHED
>      57323 =C2=B1 12%    +380.8%     275640 =C2=B1 13%  softirqs.CPU85.RCU
>      44947 =C2=B1  3%    +367.6%     210170 =C2=B1  3%  softirqs.CPU85.SC=
HED
>      61528 =C2=B1 23%    +379.2%     294822 =C2=B1  9%  softirqs.CPU86.RCU
>      44995 =C2=B1  3%    +359.1%     206572        softirqs.CPU86.SCHED
>      57346 =C2=B1 11%    +389.3%     280586 =C2=B1 16%  softirqs.CPU87.RCU
>      45045 =C2=B1  3%    +365.4%     209654 =C2=B1  3%  softirqs.CPU87.SC=
HED
>      62158 =C2=B1 16%    +363.4%     288048 =C2=B1 10%  softirqs.CPU88.RCU
>      45696 =C2=B1  3%    +353.3%     207149        softirqs.CPU88.SCHED
>      63807 =C2=B1 17%    +362.8%     295316 =C2=B1 10%  softirqs.CPU89.RCU
>      44745 =C2=B1  3%    +362.3%     206843        softirqs.CPU89.SCHED
>      60946 =C2=B1  9%    +379.3%     292107 =C2=B1 21%  softirqs.CPU9.RCU
>      45163 =C2=B1  6%    +319.5%     189443 =C2=B1 16%  softirqs.CPU9.SCH=
ED
>      56147 =C2=B1  9%    +389.5%     274854 =C2=B1 18%  softirqs.CPU90.RCU
>      45042 =C2=B1  3%    +358.9%     206712        softirqs.CPU90.SCHED
>      63372 =C2=B1 16%    +352.6%     286837 =C2=B1 12%  softirqs.CPU91.RCU
>      44906 =C2=B1  3%    +361.6%     207303        softirqs.CPU91.SCHED
>      63607 =C2=B1 17%    +366.1%     296504 =C2=B1 15%  softirqs.CPU92.RCU
>      45203 =C2=B1  3%    +358.6%     207307        softirqs.CPU92.SCHED
>      60249 =C2=B1 14%    +363.4%     279200 =C2=B1 14%  softirqs.CPU93.RCU
>      45105 =C2=B1  4%    +359.6%     207292        softirqs.CPU93.SCHED
>      63877 =C2=B1 16%    +341.6%     282102 =C2=B1 18%  softirqs.CPU94.RCU
>      45311 =C2=B1  3%    +320.0%     190313 =C2=B1 18%  softirqs.CPU94.SC=
HED
>      59543 =C2=B1 15%    +376.4%     283663 =C2=B1 14%  softirqs.CPU95.RCU
>      23940 =C2=B1 15%    +553.1%     156351 =C2=B1 36%  softirqs.CPU95.SC=
HED
>      58260 =C2=B1  8%    +356.8%     266158 =C2=B1 27%  softirqs.CPU96.RCU
>      41169 =C2=B1 11%    +363.7%     190900 =C2=B1  5%  softirqs.CPU96.SC=
HED
>      54490 =C2=B1 11%    +388.3%     266082 =C2=B1 24%  softirqs.CPU97.RCU
>      44509 =C2=B1  5%    +344.1%     197655 =C2=B1  3%  softirqs.CPU97.SC=
HED
>      58098 =C2=B1 10%    +367.1%     271353 =C2=B1 24%  softirqs.CPU98.RCU
>      43164 =C2=B1  6%    +315.5%     179359 =C2=B1 16%  softirqs.CPU98.SC=
HED
>      58008 =C2=B1  9%    +391.1%     284903 =C2=B1 24%  softirqs.CPU99.RCU
>      44783 =C2=B1  5%    +332.6%     193736 =C2=B1  3%  softirqs.CPU99.SC=
HED
>      20297 =C2=B1 52%    +243.9%      69801 =C2=B1 33%  softirqs.NET_RX
>   11324902 =C2=B1 10%    +366.3%   52803478 =C2=B1 11%  softirqs.RCU
>    8624664 =C2=B1  3%    +357.9%   39489702        softirqs.SCHED
>      64250 =C2=B1  2%    +284.5%     247050 =C2=B1  5%  softirqs.TIMER
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


> #
> # Automatically generated file; DO NOT EDIT.
> # Linux/x86_64 5.16.0-rc8 Kernel Configuration
> #
> CONFIG_CC_VERSION_TEXT=3D"gcc-9 (Debian 9.3.0-22) 9.3.0"
> CONFIG_CC_IS_GCC=3Dy
> CONFIG_GCC_VERSION=3D90300
> CONFIG_CLANG_VERSION=3D0
> CONFIG_AS_IS_GNU=3Dy
> CONFIG_AS_VERSION=3D23502
> CONFIG_LD_IS_BFD=3Dy
> CONFIG_LD_VERSION=3D23502
> CONFIG_LLD_VERSION=3D0
> CONFIG_CC_CAN_LINK=3Dy
> CONFIG_CC_CAN_LINK_STATIC=3Dy
> CONFIG_CC_HAS_ASM_GOTO=3Dy
> CONFIG_CC_HAS_ASM_INLINE=3Dy
> CONFIG_CC_HAS_NO_PROFILE_FN_ATTR=3Dy
> CONFIG_IRQ_WORK=3Dy
> CONFIG_BUILDTIME_TABLE_SORT=3Dy
> CONFIG_THREAD_INFO_IN_TASK=3Dy
> =

> #
> # General setup
> #
> CONFIG_INIT_ENV_ARG_LIMIT=3D32
> # CONFIG_COMPILE_TEST is not set
> # CONFIG_WERROR is not set
> CONFIG_LOCALVERSION=3D""
> CONFIG_LOCALVERSION_AUTO=3Dy
> CONFIG_BUILD_SALT=3D""
> CONFIG_HAVE_KERNEL_GZIP=3Dy
> CONFIG_HAVE_KERNEL_BZIP2=3Dy
> CONFIG_HAVE_KERNEL_LZMA=3Dy
> CONFIG_HAVE_KERNEL_XZ=3Dy
> CONFIG_HAVE_KERNEL_LZO=3Dy
> CONFIG_HAVE_KERNEL_LZ4=3Dy
> CONFIG_HAVE_KERNEL_ZSTD=3Dy
> CONFIG_KERNEL_GZIP=3Dy
> # CONFIG_KERNEL_BZIP2 is not set
> # CONFIG_KERNEL_LZMA is not set
> # CONFIG_KERNEL_XZ is not set
> # CONFIG_KERNEL_LZO is not set
> # CONFIG_KERNEL_LZ4 is not set
> # CONFIG_KERNEL_ZSTD is not set
> CONFIG_DEFAULT_INIT=3D""
> CONFIG_DEFAULT_HOSTNAME=3D"(none)"
> CONFIG_SWAP=3Dy
> CONFIG_SYSVIPC=3Dy
> CONFIG_SYSVIPC_SYSCTL=3Dy
> CONFIG_POSIX_MQUEUE=3Dy
> CONFIG_POSIX_MQUEUE_SYSCTL=3Dy
> # CONFIG_WATCH_QUEUE is not set
> CONFIG_CROSS_MEMORY_ATTACH=3Dy
> # CONFIG_USELIB is not set
> CONFIG_AUDIT=3Dy
> CONFIG_HAVE_ARCH_AUDITSYSCALL=3Dy
> CONFIG_AUDITSYSCALL=3Dy
> =

> #
> # IRQ subsystem
> #
> CONFIG_GENERIC_IRQ_PROBE=3Dy
> CONFIG_GENERIC_IRQ_SHOW=3Dy
> CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK=3Dy
> CONFIG_GENERIC_PENDING_IRQ=3Dy
> CONFIG_GENERIC_IRQ_MIGRATION=3Dy
> CONFIG_GENERIC_IRQ_INJECTION=3Dy
> CONFIG_HARDIRQS_SW_RESEND=3Dy
> CONFIG_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_DOMAIN_HIERARCHY=3Dy
> CONFIG_GENERIC_MSI_IRQ=3Dy
> CONFIG_GENERIC_MSI_IRQ_DOMAIN=3Dy
> CONFIG_IRQ_MSI_IOMMU=3Dy
> CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR=3Dy
> CONFIG_GENERIC_IRQ_RESERVATION_MODE=3Dy
> CONFIG_IRQ_FORCED_THREADING=3Dy
> CONFIG_SPARSE_IRQ=3Dy
> # CONFIG_GENERIC_IRQ_DEBUGFS is not set
> # end of IRQ subsystem
> =

> CONFIG_CLOCKSOURCE_WATCHDOG=3Dy
> CONFIG_ARCH_CLOCKSOURCE_INIT=3Dy
> CONFIG_CLOCKSOURCE_VALIDATE_LAST_CYCLE=3Dy
> CONFIG_GENERIC_TIME_VSYSCALL=3Dy
> CONFIG_GENERIC_CLOCKEVENTS=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_BROADCAST=3Dy
> CONFIG_GENERIC_CLOCKEVENTS_MIN_ADJUST=3Dy
> CONFIG_GENERIC_CMOS_UPDATE=3Dy
> CONFIG_HAVE_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> CONFIG_POSIX_CPU_TIMERS_TASK_WORK=3Dy
> =

> #
> # Timers subsystem
> #
> CONFIG_TICK_ONESHOT=3Dy
> CONFIG_NO_HZ_COMMON=3Dy
> # CONFIG_HZ_PERIODIC is not set
> # CONFIG_NO_HZ_IDLE is not set
> CONFIG_NO_HZ_FULL=3Dy
> CONFIG_CONTEXT_TRACKING=3Dy
> # CONFIG_CONTEXT_TRACKING_FORCE is not set
> CONFIG_NO_HZ=3Dy
> CONFIG_HIGH_RES_TIMERS=3Dy
> # end of Timers subsystem
> =

> CONFIG_BPF=3Dy
> CONFIG_HAVE_EBPF_JIT=3Dy
> CONFIG_ARCH_WANT_DEFAULT_BPF_JIT=3Dy
> =

> #
> # BPF subsystem
> #
> CONFIG_BPF_SYSCALL=3Dy
> CONFIG_BPF_JIT=3Dy
> CONFIG_BPF_JIT_ALWAYS_ON=3Dy
> CONFIG_BPF_JIT_DEFAULT_ON=3Dy
> CONFIG_BPF_UNPRIV_DEFAULT_OFF=3Dy
> # CONFIG_BPF_PRELOAD is not set
> # CONFIG_BPF_LSM is not set
> # end of BPF subsystem
> =

> CONFIG_PREEMPT_VOLUNTARY_BUILD=3Dy
> # CONFIG_PREEMPT_NONE is not set
> CONFIG_PREEMPT_VOLUNTARY=3Dy
> # CONFIG_PREEMPT is not set
> CONFIG_PREEMPT_COUNT=3Dy
> # CONFIG_PREEMPT_DYNAMIC is not set
> # CONFIG_SCHED_CORE is not set
> =

> #
> # CPU/Task time and stats accounting
> #
> CONFIG_VIRT_CPU_ACCOUNTING=3Dy
> CONFIG_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_SCHED_AVG_IRQ=3Dy
> CONFIG_BSD_PROCESS_ACCT=3Dy
> CONFIG_BSD_PROCESS_ACCT_V3=3Dy
> CONFIG_TASKSTATS=3Dy
> CONFIG_TASK_DELAY_ACCT=3Dy
> CONFIG_TASK_XACCT=3Dy
> CONFIG_TASK_IO_ACCOUNTING=3Dy
> # CONFIG_PSI is not set
> # end of CPU/Task time and stats accounting
> =

> CONFIG_CPU_ISOLATION=3Dy
> =

> #
> # RCU Subsystem
> #
> CONFIG_TREE_RCU=3Dy
> # CONFIG_RCU_EXPERT is not set
> CONFIG_SRCU=3Dy
> CONFIG_TREE_SRCU=3Dy
> CONFIG_TASKS_RCU_GENERIC=3Dy
> CONFIG_TASKS_RUDE_RCU=3Dy
> CONFIG_TASKS_TRACE_RCU=3Dy
> CONFIG_RCU_STALL_COMMON=3Dy
> CONFIG_RCU_NEED_SEGCBLIST=3Dy
> CONFIG_RCU_NOCB_CPU=3Dy
> # end of RCU Subsystem
> =

> CONFIG_BUILD_BIN2C=3Dy
> CONFIG_IKCONFIG=3Dy
> CONFIG_IKCONFIG_PROC=3Dy
> # CONFIG_IKHEADERS is not set
> CONFIG_LOG_BUF_SHIFT=3D20
> CONFIG_LOG_CPU_MAX_BUF_SHIFT=3D12
> CONFIG_PRINTK_SAFE_LOG_BUF_SHIFT=3D13
> # CONFIG_PRINTK_INDEX is not set
> CONFIG_HAVE_UNSTABLE_SCHED_CLOCK=3Dy
> =

> #
> # Scheduler features
> #
> # CONFIG_UCLAMP_TASK is not set
> # end of Scheduler features
> =

> CONFIG_ARCH_SUPPORTS_NUMA_BALANCING=3Dy
> CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH=3Dy
> CONFIG_CC_HAS_INT128=3Dy
> CONFIG_CC_IMPLICIT_FALLTHROUGH=3D"-Wimplicit-fallthrough=3D5"
> CONFIG_ARCH_SUPPORTS_INT128=3Dy
> CONFIG_NUMA_BALANCING=3Dy
> CONFIG_NUMA_BALANCING_DEFAULT_ENABLED=3Dy
> CONFIG_CGROUPS=3Dy
> CONFIG_PAGE_COUNTER=3Dy
> CONFIG_MEMCG=3Dy
> CONFIG_MEMCG_SWAP=3Dy
> CONFIG_MEMCG_KMEM=3Dy
> CONFIG_BLK_CGROUP=3Dy
> CONFIG_CGROUP_WRITEBACK=3Dy
> CONFIG_CGROUP_SCHED=3Dy
> CONFIG_FAIR_GROUP_SCHED=3Dy
> CONFIG_CFS_BANDWIDTH=3Dy
> CONFIG_RT_GROUP_SCHED=3Dy
> CONFIG_CGROUP_PIDS=3Dy
> CONFIG_CGROUP_RDMA=3Dy
> CONFIG_CGROUP_FREEZER=3Dy
> CONFIG_CGROUP_HUGETLB=3Dy
> CONFIG_CPUSETS=3Dy
> CONFIG_PROC_PID_CPUSET=3Dy
> CONFIG_CGROUP_DEVICE=3Dy
> CONFIG_CGROUP_CPUACCT=3Dy
> CONFIG_CGROUP_PERF=3Dy
> CONFIG_CGROUP_BPF=3Dy
> # CONFIG_CGROUP_MISC is not set
> # CONFIG_CGROUP_DEBUG is not set
> CONFIG_SOCK_CGROUP_DATA=3Dy
> CONFIG_NAMESPACES=3Dy
> CONFIG_UTS_NS=3Dy
> CONFIG_TIME_NS=3Dy
> CONFIG_IPC_NS=3Dy
> CONFIG_USER_NS=3Dy
> CONFIG_PID_NS=3Dy
> CONFIG_NET_NS=3Dy
> # CONFIG_CHECKPOINT_RESTORE is not set
> CONFIG_SCHED_AUTOGROUP=3Dy
> # CONFIG_SYSFS_DEPRECATED is not set
> CONFIG_RELAY=3Dy
> CONFIG_BLK_DEV_INITRD=3Dy
> CONFIG_INITRAMFS_SOURCE=3D""
> CONFIG_RD_GZIP=3Dy
> CONFIG_RD_BZIP2=3Dy
> CONFIG_RD_LZMA=3Dy
> CONFIG_RD_XZ=3Dy
> CONFIG_RD_LZO=3Dy
> CONFIG_RD_LZ4=3Dy
> CONFIG_RD_ZSTD=3Dy
> # CONFIG_BOOT_CONFIG is not set
> CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE=3Dy
> # CONFIG_CC_OPTIMIZE_FOR_SIZE is not set
> CONFIG_LD_ORPHAN_WARN=3Dy
> CONFIG_SYSCTL=3Dy
> CONFIG_HAVE_UID16=3Dy
> CONFIG_SYSCTL_EXCEPTION_TRACE=3Dy
> CONFIG_HAVE_PCSPKR_PLATFORM=3Dy
> # CONFIG_EXPERT is not set
> CONFIG_UID16=3Dy
> CONFIG_MULTIUSER=3Dy
> CONFIG_SGETMASK_SYSCALL=3Dy
> CONFIG_SYSFS_SYSCALL=3Dy
> CONFIG_FHANDLE=3Dy
> CONFIG_POSIX_TIMERS=3Dy
> CONFIG_PRINTK=3Dy
> CONFIG_BUG=3Dy
> CONFIG_ELF_CORE=3Dy
> CONFIG_PCSPKR_PLATFORM=3Dy
> CONFIG_BASE_FULL=3Dy
> CONFIG_FUTEX=3Dy
> CONFIG_FUTEX_PI=3Dy
> CONFIG_EPOLL=3Dy
> CONFIG_SIGNALFD=3Dy
> CONFIG_TIMERFD=3Dy
> CONFIG_EVENTFD=3Dy
> CONFIG_SHMEM=3Dy
> CONFIG_AIO=3Dy
> CONFIG_IO_URING=3Dy
> CONFIG_ADVISE_SYSCALLS=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_WP=3Dy
> CONFIG_HAVE_ARCH_USERFAULTFD_MINOR=3Dy
> CONFIG_MEMBARRIER=3Dy
> CONFIG_KALLSYMS=3Dy
> CONFIG_KALLSYMS_ALL=3Dy
> CONFIG_KALLSYMS_ABSOLUTE_PERCPU=3Dy
> CONFIG_KALLSYMS_BASE_RELATIVE=3Dy
> CONFIG_USERFAULTFD=3Dy
> CONFIG_ARCH_HAS_MEMBARRIER_SYNC_CORE=3Dy
> CONFIG_KCMP=3Dy
> CONFIG_RSEQ=3Dy
> # CONFIG_EMBEDDED is not set
> CONFIG_HAVE_PERF_EVENTS=3Dy
> =

> #
> # Kernel Performance Events And Counters
> #
> CONFIG_PERF_EVENTS=3Dy
> # CONFIG_DEBUG_PERF_USE_VMALLOC is not set
> # end of Kernel Performance Events And Counters
> =

> CONFIG_VM_EVENT_COUNTERS=3Dy
> CONFIG_SLUB_DEBUG=3Dy
> # CONFIG_COMPAT_BRK is not set
> # CONFIG_SLAB is not set
> CONFIG_SLUB=3Dy
> CONFIG_SLAB_MERGE_DEFAULT=3Dy
> CONFIG_SLAB_FREELIST_RANDOM=3Dy
> # CONFIG_SLAB_FREELIST_HARDENED is not set
> CONFIG_SHUFFLE_PAGE_ALLOCATOR=3Dy
> CONFIG_SLUB_CPU_PARTIAL=3Dy
> CONFIG_SYSTEM_DATA_VERIFICATION=3Dy
> CONFIG_PROFILING=3Dy
> CONFIG_TRACEPOINTS=3Dy
> # end of General setup
> =

> CONFIG_64BIT=3Dy
> CONFIG_X86_64=3Dy
> CONFIG_X86=3Dy
> CONFIG_INSTRUCTION_DECODER=3Dy
> CONFIG_OUTPUT_FORMAT=3D"elf64-x86-64"
> CONFIG_LOCKDEP_SUPPORT=3Dy
> CONFIG_STACKTRACE_SUPPORT=3Dy
> CONFIG_MMU=3Dy
> CONFIG_ARCH_MMAP_RND_BITS_MIN=3D28
> CONFIG_ARCH_MMAP_RND_BITS_MAX=3D32
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MIN=3D8
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS_MAX=3D16
> CONFIG_GENERIC_ISA_DMA=3Dy
> CONFIG_GENERIC_BUG=3Dy
> CONFIG_GENERIC_BUG_RELATIVE_POINTERS=3Dy
> CONFIG_ARCH_MAY_HAVE_PC_FDC=3Dy
> CONFIG_GENERIC_CALIBRATE_DELAY=3Dy
> CONFIG_ARCH_HAS_CPU_RELAX=3Dy
> CONFIG_ARCH_HAS_FILTER_PGPROT=3Dy
> CONFIG_HAVE_SETUP_PER_CPU_AREA=3Dy
> CONFIG_NEED_PER_CPU_EMBED_FIRST_CHUNK=3Dy
> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK=3Dy
> CONFIG_ARCH_HIBERNATION_POSSIBLE=3Dy
> CONFIG_ARCH_NR_GPIO=3D1024
> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> CONFIG_ARCH_WANT_GENERAL_HUGETLB=3Dy
> CONFIG_AUDIT_ARCH=3Dy
> CONFIG_HAVE_INTEL_TXT=3Dy
> CONFIG_X86_64_SMP=3Dy
> CONFIG_ARCH_SUPPORTS_UPROBES=3Dy
> CONFIG_FIX_EARLYCON_MEM=3Dy
> CONFIG_PGTABLE_LEVELS=3D5
> CONFIG_CC_HAS_SANE_STACKPROTECTOR=3Dy
> =

> #
> # Processor type and features
> #
> CONFIG_SMP=3Dy
> CONFIG_X86_FEATURE_NAMES=3Dy
> CONFIG_X86_X2APIC=3Dy
> CONFIG_X86_MPPARSE=3Dy
> # CONFIG_GOLDFISH is not set
> CONFIG_RETPOLINE=3Dy
> # CONFIG_X86_CPU_RESCTRL is not set
> CONFIG_X86_EXTENDED_PLATFORM=3Dy
> # CONFIG_X86_NUMACHIP is not set
> # CONFIG_X86_VSMP is not set
> CONFIG_X86_UV=3Dy
> # CONFIG_X86_GOLDFISH is not set
> # CONFIG_X86_INTEL_MID is not set
> CONFIG_X86_INTEL_LPSS=3Dy
> # CONFIG_X86_AMD_PLATFORM_DEVICE is not set
> CONFIG_IOSF_MBI=3Dy
> # CONFIG_IOSF_MBI_DEBUG is not set
> CONFIG_X86_SUPPORTS_MEMORY_FAILURE=3Dy
> # CONFIG_SCHED_OMIT_FRAME_POINTER is not set
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> # CONFIG_PARAVIRT_DEBUG is not set
> CONFIG_PARAVIRT_SPINLOCKS=3Dy
> CONFIG_X86_HV_CALLBACK_VECTOR=3Dy
> # CONFIG_XEN is not set
> CONFIG_KVM_GUEST=3Dy
> CONFIG_ARCH_CPUIDLE_HALTPOLL=3Dy
> # CONFIG_PVH is not set
> CONFIG_PARAVIRT_TIME_ACCOUNTING=3Dy
> CONFIG_PARAVIRT_CLOCK=3Dy
> # CONFIG_JAILHOUSE_GUEST is not set
> # CONFIG_ACRN_GUEST is not set
> # CONFIG_MK8 is not set
> # CONFIG_MPSC is not set
> # CONFIG_MCORE2 is not set
> # CONFIG_MATOM is not set
> CONFIG_GENERIC_CPU=3Dy
> CONFIG_X86_INTERNODE_CACHE_SHIFT=3D6
> CONFIG_X86_L1_CACHE_SHIFT=3D6
> CONFIG_X86_TSC=3Dy
> CONFIG_X86_CMPXCHG64=3Dy
> CONFIG_X86_CMOV=3Dy
> CONFIG_X86_MINIMUM_CPU_FAMILY=3D64
> CONFIG_X86_DEBUGCTLMSR=3Dy
> CONFIG_IA32_FEAT_CTL=3Dy
> CONFIG_X86_VMX_FEATURE_NAMES=3Dy
> CONFIG_CPU_SUP_INTEL=3Dy
> CONFIG_CPU_SUP_AMD=3Dy
> CONFIG_CPU_SUP_HYGON=3Dy
> CONFIG_CPU_SUP_CENTAUR=3Dy
> CONFIG_CPU_SUP_ZHAOXIN=3Dy
> CONFIG_HPET_TIMER=3Dy
> CONFIG_HPET_EMULATE_RTC=3Dy
> CONFIG_DMI=3Dy
> # CONFIG_GART_IOMMU is not set
> CONFIG_MAXSMP=3Dy
> CONFIG_NR_CPUS_RANGE_BEGIN=3D8192
> CONFIG_NR_CPUS_RANGE_END=3D8192
> CONFIG_NR_CPUS_DEFAULT=3D8192
> CONFIG_NR_CPUS=3D8192
> CONFIG_SCHED_CLUSTER=3Dy
> CONFIG_SCHED_SMT=3Dy
> CONFIG_SCHED_MC=3Dy
> CONFIG_SCHED_MC_PRIO=3Dy
> CONFIG_X86_LOCAL_APIC=3Dy
> CONFIG_X86_IO_APIC=3Dy
> CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=3Dy
> CONFIG_X86_MCE=3Dy
> CONFIG_X86_MCELOG_LEGACY=3Dy
> CONFIG_X86_MCE_INTEL=3Dy
> CONFIG_X86_MCE_AMD=3Dy
> CONFIG_X86_MCE_THRESHOLD=3Dy
> CONFIG_X86_MCE_INJECT=3Dm
> =

> #
> # Performance monitoring
> #
> CONFIG_PERF_EVENTS_INTEL_UNCORE=3Dm
> CONFIG_PERF_EVENTS_INTEL_RAPL=3Dm
> CONFIG_PERF_EVENTS_INTEL_CSTATE=3Dm
> # CONFIG_PERF_EVENTS_AMD_POWER is not set
> CONFIG_PERF_EVENTS_AMD_UNCORE=3Dy
> # end of Performance monitoring
> =

> CONFIG_X86_16BIT=3Dy
> CONFIG_X86_ESPFIX64=3Dy
> CONFIG_X86_VSYSCALL_EMULATION=3Dy
> CONFIG_X86_IOPL_IOPERM=3Dy
> CONFIG_I8K=3Dm
> CONFIG_MICROCODE=3Dy
> CONFIG_MICROCODE_INTEL=3Dy
> CONFIG_MICROCODE_AMD=3Dy
> CONFIG_MICROCODE_OLD_INTERFACE=3Dy
> CONFIG_X86_MSR=3Dy
> CONFIG_X86_CPUID=3Dy
> CONFIG_X86_5LEVEL=3Dy
> CONFIG_X86_DIRECT_GBPAGES=3Dy
> # CONFIG_X86_CPA_STATISTICS is not set
> # CONFIG_AMD_MEM_ENCRYPT is not set
> CONFIG_NUMA=3Dy
> # CONFIG_AMD_NUMA is not set
> CONFIG_X86_64_ACPI_NUMA=3Dy
> CONFIG_NUMA_EMU=3Dy
> CONFIG_NODES_SHIFT=3D10
> CONFIG_ARCH_SPARSEMEM_ENABLE=3Dy
> CONFIG_ARCH_SPARSEMEM_DEFAULT=3Dy
> CONFIG_ARCH_SELECT_MEMORY_MODEL=3Dy
> # CONFIG_ARCH_MEMORY_PROBE is not set
> CONFIG_ARCH_PROC_KCORE_TEXT=3Dy
> CONFIG_ILLEGAL_POINTER_VALUE=3D0xdead000000000000
> CONFIG_X86_PMEM_LEGACY_DEVICE=3Dy
> CONFIG_X86_PMEM_LEGACY=3Dm
> CONFIG_X86_CHECK_BIOS_CORRUPTION=3Dy
> # CONFIG_X86_BOOTPARAM_MEMORY_CORRUPTION_CHECK is not set
> CONFIG_MTRR=3Dy
> CONFIG_MTRR_SANITIZER=3Dy
> CONFIG_MTRR_SANITIZER_ENABLE_DEFAULT=3D1
> CONFIG_MTRR_SANITIZER_SPARE_REG_NR_DEFAULT=3D1
> CONFIG_X86_PAT=3Dy
> CONFIG_ARCH_USES_PG_UNCACHED=3Dy
> CONFIG_ARCH_RANDOM=3Dy
> CONFIG_X86_SMAP=3Dy
> CONFIG_X86_UMIP=3Dy
> CONFIG_X86_INTEL_MEMORY_PROTECTION_KEYS=3Dy
> CONFIG_X86_INTEL_TSX_MODE_OFF=3Dy
> # CONFIG_X86_INTEL_TSX_MODE_ON is not set
> # CONFIG_X86_INTEL_TSX_MODE_AUTO is not set
> # CONFIG_X86_SGX is not set
> CONFIG_EFI=3Dy
> CONFIG_EFI_STUB=3Dy
> CONFIG_EFI_MIXED=3Dy
> # CONFIG_HZ_100 is not set
> # CONFIG_HZ_250 is not set
> # CONFIG_HZ_300 is not set
> CONFIG_HZ_1000=3Dy
> CONFIG_HZ=3D1000
> CONFIG_SCHED_HRTICK=3Dy
> CONFIG_KEXEC=3Dy
> CONFIG_KEXEC_FILE=3Dy
> CONFIG_ARCH_HAS_KEXEC_PURGATORY=3Dy
> # CONFIG_KEXEC_SIG is not set
> CONFIG_CRASH_DUMP=3Dy
> CONFIG_KEXEC_JUMP=3Dy
> CONFIG_PHYSICAL_START=3D0x1000000
> CONFIG_RELOCATABLE=3Dy
> CONFIG_RANDOMIZE_BASE=3Dy
> CONFIG_X86_NEED_RELOCS=3Dy
> CONFIG_PHYSICAL_ALIGN=3D0x200000
> CONFIG_DYNAMIC_MEMORY_LAYOUT=3Dy
> CONFIG_RANDOMIZE_MEMORY=3Dy
> CONFIG_RANDOMIZE_MEMORY_PHYSICAL_PADDING=3D0xa
> CONFIG_HOTPLUG_CPU=3Dy
> CONFIG_BOOTPARAM_HOTPLUG_CPU0=3Dy
> # CONFIG_DEBUG_HOTPLUG_CPU0 is not set
> # CONFIG_COMPAT_VDSO is not set
> CONFIG_LEGACY_VSYSCALL_EMULATE=3Dy
> # CONFIG_LEGACY_VSYSCALL_XONLY is not set
> # CONFIG_LEGACY_VSYSCALL_NONE is not set
> # CONFIG_CMDLINE_BOOL is not set
> CONFIG_MODIFY_LDT_SYSCALL=3Dy
> # CONFIG_STRICT_SIGALTSTACK_SIZE is not set
> CONFIG_HAVE_LIVEPATCH=3Dy
> CONFIG_LIVEPATCH=3Dy
> # end of Processor type and features
> =

> CONFIG_ARCH_HAS_ADD_PAGES=3Dy
> CONFIG_ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE=3Dy
> CONFIG_USE_PERCPU_NUMA_NODE_ID=3Dy
> =

> #
> # Power management and ACPI options
> #
> CONFIG_ARCH_HIBERNATION_HEADER=3Dy
> CONFIG_SUSPEND=3Dy
> CONFIG_SUSPEND_FREEZER=3Dy
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_HIBERNATION=3Dy
> CONFIG_HIBERNATION_SNAPSHOT_DEV=3Dy
> CONFIG_PM_STD_PARTITION=3D""
> CONFIG_PM_SLEEP=3Dy
> CONFIG_PM_SLEEP_SMP=3Dy
> # CONFIG_PM_AUTOSLEEP is not set
> # CONFIG_PM_WAKELOCKS is not set
> CONFIG_PM=3Dy
> CONFIG_PM_DEBUG=3Dy
> # CONFIG_PM_ADVANCED_DEBUG is not set
> # CONFIG_PM_TEST_SUSPEND is not set
> CONFIG_PM_SLEEP_DEBUG=3Dy
> # CONFIG_PM_TRACE_RTC is not set
> CONFIG_PM_CLK=3Dy
> # CONFIG_WQ_POWER_EFFICIENT_DEFAULT is not set
> # CONFIG_ENERGY_MODEL is not set
> CONFIG_ARCH_SUPPORTS_ACPI=3Dy
> CONFIG_ACPI=3Dy
> CONFIG_ACPI_LEGACY_TABLES_LOOKUP=3Dy
> CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC=3Dy
> CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT=3Dy
> # CONFIG_ACPI_DEBUGGER is not set
> CONFIG_ACPI_SPCR_TABLE=3Dy
> # CONFIG_ACPI_FPDT is not set
> CONFIG_ACPI_LPIT=3Dy
> CONFIG_ACPI_SLEEP=3Dy
> CONFIG_ACPI_REV_OVERRIDE_POSSIBLE=3Dy
> CONFIG_ACPI_EC_DEBUGFS=3Dm
> CONFIG_ACPI_AC=3Dy
> CONFIG_ACPI_BATTERY=3Dy
> CONFIG_ACPI_BUTTON=3Dy
> CONFIG_ACPI_VIDEO=3Dm
> CONFIG_ACPI_FAN=3Dy
> CONFIG_ACPI_TAD=3Dm
> CONFIG_ACPI_DOCK=3Dy
> CONFIG_ACPI_CPU_FREQ_PSS=3Dy
> CONFIG_ACPI_PROCESSOR_CSTATE=3Dy
> CONFIG_ACPI_PROCESSOR_IDLE=3Dy
> CONFIG_ACPI_CPPC_LIB=3Dy
> CONFIG_ACPI_PROCESSOR=3Dy
> CONFIG_ACPI_IPMI=3Dm
> CONFIG_ACPI_HOTPLUG_CPU=3Dy
> CONFIG_ACPI_PROCESSOR_AGGREGATOR=3Dm
> CONFIG_ACPI_THERMAL=3Dy
> CONFIG_ACPI_PLATFORM_PROFILE=3Dm
> CONFIG_ARCH_HAS_ACPI_TABLE_UPGRADE=3Dy
> CONFIG_ACPI_TABLE_UPGRADE=3Dy
> # CONFIG_ACPI_DEBUG is not set
> CONFIG_ACPI_PCI_SLOT=3Dy
> CONFIG_ACPI_CONTAINER=3Dy
> CONFIG_ACPI_HOTPLUG_MEMORY=3Dy
> CONFIG_ACPI_HOTPLUG_IOAPIC=3Dy
> CONFIG_ACPI_SBS=3Dm
> CONFIG_ACPI_HED=3Dy
> # CONFIG_ACPI_CUSTOM_METHOD is not set
> CONFIG_ACPI_BGRT=3Dy
> CONFIG_ACPI_NFIT=3Dm
> # CONFIG_NFIT_SECURITY_DEBUG is not set
> CONFIG_ACPI_NUMA=3Dy
> # CONFIG_ACPI_HMAT is not set
> CONFIG_HAVE_ACPI_APEI=3Dy
> CONFIG_HAVE_ACPI_APEI_NMI=3Dy
> CONFIG_ACPI_APEI=3Dy
> CONFIG_ACPI_APEI_GHES=3Dy
> CONFIG_ACPI_APEI_PCIEAER=3Dy
> CONFIG_ACPI_APEI_MEMORY_FAILURE=3Dy
> CONFIG_ACPI_APEI_EINJ=3Dm
> # CONFIG_ACPI_APEI_ERST_DEBUG is not set
> # CONFIG_ACPI_DPTF is not set
> CONFIG_ACPI_WATCHDOG=3Dy
> CONFIG_ACPI_EXTLOG=3Dm
> CONFIG_ACPI_ADXL=3Dy
> # CONFIG_ACPI_CONFIGFS is not set
> CONFIG_PMIC_OPREGION=3Dy
> CONFIG_X86_PM_TIMER=3Dy
> CONFIG_ACPI_PRMT=3Dy
> =

> #
> # CPU Frequency scaling
> #
> CONFIG_CPU_FREQ=3Dy
> CONFIG_CPU_FREQ_GOV_ATTR_SET=3Dy
> CONFIG_CPU_FREQ_GOV_COMMON=3Dy
> CONFIG_CPU_FREQ_STAT=3Dy
> CONFIG_CPU_FREQ_DEFAULT_GOV_PERFORMANCE=3Dy
> # CONFIG_CPU_FREQ_DEFAULT_GOV_POWERSAVE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_USERSPACE is not set
> # CONFIG_CPU_FREQ_DEFAULT_GOV_SCHEDUTIL is not set
> CONFIG_CPU_FREQ_GOV_PERFORMANCE=3Dy
> CONFIG_CPU_FREQ_GOV_POWERSAVE=3Dy
> CONFIG_CPU_FREQ_GOV_USERSPACE=3Dy
> CONFIG_CPU_FREQ_GOV_ONDEMAND=3Dy
> CONFIG_CPU_FREQ_GOV_CONSERVATIVE=3Dy
> CONFIG_CPU_FREQ_GOV_SCHEDUTIL=3Dy
> =

> #
> # CPU frequency scaling drivers
> #
> CONFIG_X86_INTEL_PSTATE=3Dy
> # CONFIG_X86_PCC_CPUFREQ is not set
> CONFIG_X86_ACPI_CPUFREQ=3Dm
> CONFIG_X86_ACPI_CPUFREQ_CPB=3Dy
> CONFIG_X86_POWERNOW_K8=3Dm
> # CONFIG_X86_AMD_FREQ_SENSITIVITY is not set
> # CONFIG_X86_SPEEDSTEP_CENTRINO is not set
> CONFIG_X86_P4_CLOCKMOD=3Dm
> =

> #
> # shared options
> #
> CONFIG_X86_SPEEDSTEP_LIB=3Dm
> # end of CPU Frequency scaling
> =

> #
> # CPU Idle
> #
> CONFIG_CPU_IDLE=3Dy
> # CONFIG_CPU_IDLE_GOV_LADDER is not set
> CONFIG_CPU_IDLE_GOV_MENU=3Dy
> # CONFIG_CPU_IDLE_GOV_TEO is not set
> # CONFIG_CPU_IDLE_GOV_HALTPOLL is not set
> CONFIG_HALTPOLL_CPUIDLE=3Dy
> # end of CPU Idle
> =

> CONFIG_INTEL_IDLE=3Dy
> # end of Power management and ACPI options
> =

> #
> # Bus options (PCI etc.)
> #
> CONFIG_PCI_DIRECT=3Dy
> CONFIG_PCI_MMCONFIG=3Dy
> CONFIG_MMCONF_FAM10H=3Dy
> CONFIG_ISA_DMA_API=3Dy
> CONFIG_AMD_NB=3Dy
> # end of Bus options (PCI etc.)
> =

> #
> # Binary Emulations
> #
> CONFIG_IA32_EMULATION=3Dy
> # CONFIG_X86_X32 is not set
> CONFIG_COMPAT_32=3Dy
> CONFIG_COMPAT=3Dy
> CONFIG_COMPAT_FOR_U64_ALIGNMENT=3Dy
> CONFIG_SYSVIPC_COMPAT=3Dy
> # end of Binary Emulations
> =

> CONFIG_HAVE_KVM=3Dy
> CONFIG_HAVE_KVM_IRQCHIP=3Dy
> CONFIG_HAVE_KVM_IRQFD=3Dy
> CONFIG_HAVE_KVM_IRQ_ROUTING=3Dy
> CONFIG_HAVE_KVM_EVENTFD=3Dy
> CONFIG_KVM_MMIO=3Dy
> CONFIG_KVM_ASYNC_PF=3Dy
> CONFIG_HAVE_KVM_MSI=3Dy
> CONFIG_HAVE_KVM_CPU_RELAX_INTERCEPT=3Dy
> CONFIG_KVM_VFIO=3Dy
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=3Dy
> CONFIG_KVM_COMPAT=3Dy
> CONFIG_HAVE_KVM_IRQ_BYPASS=3Dy
> CONFIG_HAVE_KVM_NO_POLL=3Dy
> CONFIG_KVM_XFER_TO_GUEST_WORK=3Dy
> CONFIG_HAVE_KVM_PM_NOTIFIER=3Dy
> CONFIG_VIRTUALIZATION=3Dy
> CONFIG_KVM=3Dm
> CONFIG_KVM_INTEL=3Dm
> # CONFIG_KVM_AMD is not set
> # CONFIG_KVM_XEN is not set
> CONFIG_KVM_MMU_AUDIT=3Dy
> CONFIG_AS_AVX512=3Dy
> CONFIG_AS_SHA1_NI=3Dy
> CONFIG_AS_SHA256_NI=3Dy
> CONFIG_AS_TPAUSE=3Dy
> =

> #
> # General architecture-dependent options
> #
> CONFIG_CRASH_CORE=3Dy
> CONFIG_KEXEC_CORE=3Dy
> CONFIG_HOTPLUG_SMT=3Dy
> CONFIG_GENERIC_ENTRY=3Dy
> CONFIG_KPROBES=3Dy
> CONFIG_JUMP_LABEL=3Dy
> # CONFIG_STATIC_KEYS_SELFTEST is not set
> # CONFIG_STATIC_CALL_SELFTEST is not set
> CONFIG_OPTPROBES=3Dy
> CONFIG_KPROBES_ON_FTRACE=3Dy
> CONFIG_UPROBES=3Dy
> CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS=3Dy
> CONFIG_ARCH_USE_BUILTIN_BSWAP=3Dy
> CONFIG_KRETPROBES=3Dy
> CONFIG_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_IOREMAP_PROT=3Dy
> CONFIG_HAVE_KPROBES=3Dy
> CONFIG_HAVE_KRETPROBES=3Dy
> CONFIG_HAVE_OPTPROBES=3Dy
> CONFIG_HAVE_KPROBES_ON_FTRACE=3Dy
> CONFIG_ARCH_CORRECT_STACKTRACE_ON_KRETPROBE=3Dy
> CONFIG_HAVE_FUNCTION_ERROR_INJECTION=3Dy
> CONFIG_HAVE_NMI=3Dy
> CONFIG_TRACE_IRQFLAGS_SUPPORT=3Dy
> CONFIG_HAVE_ARCH_TRACEHOOK=3Dy
> CONFIG_HAVE_DMA_CONTIGUOUS=3Dy
> CONFIG_GENERIC_SMP_IDLE_THREAD=3Dy
> CONFIG_ARCH_HAS_FORTIFY_SOURCE=3Dy
> CONFIG_ARCH_HAS_SET_MEMORY=3Dy
> CONFIG_ARCH_HAS_SET_DIRECT_MAP=3Dy
> CONFIG_HAVE_ARCH_THREAD_STRUCT_WHITELIST=3Dy
> CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT=3Dy
> CONFIG_ARCH_WANTS_NO_INSTR=3Dy
> CONFIG_HAVE_ASM_MODVERSIONS=3Dy
> CONFIG_HAVE_REGS_AND_STACK_ACCESS_API=3Dy
> CONFIG_HAVE_RSEQ=3Dy
> CONFIG_HAVE_FUNCTION_ARG_ACCESS_API=3Dy
> CONFIG_HAVE_HW_BREAKPOINT=3Dy
> CONFIG_HAVE_MIXED_BREAKPOINTS_REGS=3Dy
> CONFIG_HAVE_USER_RETURN_NOTIFIER=3Dy
> CONFIG_HAVE_PERF_EVENTS_NMI=3Dy
> CONFIG_HAVE_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HAVE_PERF_REGS=3Dy
> CONFIG_HAVE_PERF_USER_STACK_DUMP=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL=3Dy
> CONFIG_HAVE_ARCH_JUMP_LABEL_RELATIVE=3Dy
> CONFIG_MMU_GATHER_TABLE_FREE=3Dy
> CONFIG_MMU_GATHER_RCU_TABLE_FREE=3Dy
> CONFIG_ARCH_HAVE_NMI_SAFE_CMPXCHG=3Dy
> CONFIG_HAVE_ALIGNED_STRUCT_PAGE=3Dy
> CONFIG_HAVE_CMPXCHG_LOCAL=3Dy
> CONFIG_HAVE_CMPXCHG_DOUBLE=3Dy
> CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION=3Dy
> CONFIG_ARCH_WANT_OLD_COMPAT_IPC=3Dy
> CONFIG_HAVE_ARCH_SECCOMP=3Dy
> CONFIG_HAVE_ARCH_SECCOMP_FILTER=3Dy
> CONFIG_SECCOMP=3Dy
> CONFIG_SECCOMP_FILTER=3Dy
> # CONFIG_SECCOMP_CACHE_DEBUG is not set
> CONFIG_HAVE_ARCH_STACKLEAK=3Dy
> CONFIG_HAVE_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR=3Dy
> CONFIG_STACKPROTECTOR_STRONG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG=3Dy
> CONFIG_ARCH_SUPPORTS_LTO_CLANG_THIN=3Dy
> CONFIG_LTO_NONE=3Dy
> CONFIG_HAVE_ARCH_WITHIN_STACK_FRAMES=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING=3Dy
> CONFIG_HAVE_CONTEXT_TRACKING_OFFSTACK=3Dy
> CONFIG_HAVE_VIRT_CPU_ACCOUNTING_GEN=3Dy
> CONFIG_HAVE_IRQ_TIME_ACCOUNTING=3Dy
> CONFIG_HAVE_MOVE_PUD=3Dy
> CONFIG_HAVE_MOVE_PMD=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=3Dy
> CONFIG_HAVE_ARCH_HUGE_VMAP=3Dy
> CONFIG_ARCH_WANT_HUGE_PMD_SHARE=3Dy
> CONFIG_HAVE_ARCH_SOFT_DIRTY=3Dy
> CONFIG_HAVE_MOD_ARCH_SPECIFIC=3Dy
> CONFIG_MODULES_USE_ELF_RELA=3Dy
> CONFIG_HAVE_IRQ_EXIT_ON_IRQ_STACK=3Dy
> CONFIG_HAVE_SOFTIRQ_ON_OWN_STACK=3Dy
> CONFIG_ARCH_HAS_ELF_RANDOMIZE=3Dy
> CONFIG_HAVE_ARCH_MMAP_RND_BITS=3Dy
> CONFIG_HAVE_EXIT_THREAD=3Dy
> CONFIG_ARCH_MMAP_RND_BITS=3D28
> CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS=3Dy
> CONFIG_ARCH_MMAP_RND_COMPAT_BITS=3D8
> CONFIG_HAVE_ARCH_COMPAT_MMAP_BASES=3Dy
> CONFIG_PAGE_SIZE_LESS_THAN_64KB=3Dy
> CONFIG_HAVE_STACK_VALIDATION=3Dy
> CONFIG_HAVE_RELIABLE_STACKTRACE=3Dy
> CONFIG_OLD_SIGSUSPEND3=3Dy
> CONFIG_COMPAT_OLD_SIGACTION=3Dy
> CONFIG_COMPAT_32BIT_TIME=3Dy
> CONFIG_HAVE_ARCH_VMAP_STACK=3Dy
> CONFIG_VMAP_STACK=3Dy
> CONFIG_HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET=3Dy
> # CONFIG_RANDOMIZE_KSTACK_OFFSET_DEFAULT is not set
> CONFIG_ARCH_HAS_STRICT_KERNEL_RWX=3Dy
> CONFIG_STRICT_KERNEL_RWX=3Dy
> CONFIG_ARCH_HAS_STRICT_MODULE_RWX=3Dy
> CONFIG_STRICT_MODULE_RWX=3Dy
> CONFIG_HAVE_ARCH_PREL32_RELOCATIONS=3Dy
> CONFIG_ARCH_USE_MEMREMAP_PROT=3Dy
> # CONFIG_LOCK_EVENT_COUNTS is not set
> CONFIG_ARCH_HAS_MEM_ENCRYPT=3Dy
> CONFIG_HAVE_STATIC_CALL=3Dy
> CONFIG_HAVE_STATIC_CALL_INLINE=3Dy
> CONFIG_HAVE_PREEMPT_DYNAMIC=3Dy
> CONFIG_ARCH_WANT_LD_ORPHAN_WARN=3Dy
> CONFIG_ARCH_SUPPORTS_DEBUG_PAGEALLOC=3Dy
> CONFIG_ARCH_HAS_ELFCORE_COMPAT=3Dy
> CONFIG_ARCH_HAS_PARANOID_L1D_FLUSH=3Dy
> CONFIG_DYNAMIC_SIGFRAME=3Dy
> =

> #
> # GCOV-based kernel profiling
> #
> # CONFIG_GCOV_KERNEL is not set
> CONFIG_ARCH_HAS_GCOV_PROFILE_ALL=3Dy
> # end of GCOV-based kernel profiling
> =

> CONFIG_HAVE_GCC_PLUGINS=3Dy
> # end of General architecture-dependent options
> =

> CONFIG_RT_MUTEXES=3Dy
> CONFIG_BASE_SMALL=3D0
> CONFIG_MODULE_SIG_FORMAT=3Dy
> CONFIG_MODULES=3Dy
> CONFIG_MODULE_FORCE_LOAD=3Dy
> CONFIG_MODULE_UNLOAD=3Dy
> # CONFIG_MODULE_FORCE_UNLOAD is not set
> # CONFIG_MODVERSIONS is not set
> # CONFIG_MODULE_SRCVERSION_ALL is not set
> CONFIG_MODULE_SIG=3Dy
> # CONFIG_MODULE_SIG_FORCE is not set
> CONFIG_MODULE_SIG_ALL=3Dy
> # CONFIG_MODULE_SIG_SHA1 is not set
> # CONFIG_MODULE_SIG_SHA224 is not set
> CONFIG_MODULE_SIG_SHA256=3Dy
> # CONFIG_MODULE_SIG_SHA384 is not set
> # CONFIG_MODULE_SIG_SHA512 is not set
> CONFIG_MODULE_SIG_HASH=3D"sha256"
> CONFIG_MODULE_COMPRESS_NONE=3Dy
> # CONFIG_MODULE_COMPRESS_GZIP is not set
> # CONFIG_MODULE_COMPRESS_XZ is not set
> # CONFIG_MODULE_COMPRESS_ZSTD is not set
> # CONFIG_MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS is not set
> CONFIG_MODPROBE_PATH=3D"/sbin/modprobe"
> CONFIG_MODULES_TREE_LOOKUP=3Dy
> CONFIG_BLOCK=3Dy
> CONFIG_BLK_CGROUP_RWSTAT=3Dy
> CONFIG_BLK_DEV_BSG_COMMON=3Dy
> CONFIG_BLK_DEV_BSGLIB=3Dy
> CONFIG_BLK_DEV_INTEGRITY=3Dy
> CONFIG_BLK_DEV_INTEGRITY_T10=3Dm
> # CONFIG_BLK_DEV_ZONED is not set
> CONFIG_BLK_DEV_THROTTLING=3Dy
> # CONFIG_BLK_DEV_THROTTLING_LOW is not set
> CONFIG_BLK_WBT=3Dy
> CONFIG_BLK_WBT_MQ=3Dy
> # CONFIG_BLK_CGROUP_IOLATENCY is not set
> # CONFIG_BLK_CGROUP_FC_APPID is not set
> # CONFIG_BLK_CGROUP_IOCOST is not set
> # CONFIG_BLK_CGROUP_IOPRIO is not set
> CONFIG_BLK_DEBUG_FS=3Dy
> # CONFIG_BLK_SED_OPAL is not set
> # CONFIG_BLK_INLINE_ENCRYPTION is not set
> =

> #
> # Partition Types
> #
> CONFIG_PARTITION_ADVANCED=3Dy
> # CONFIG_ACORN_PARTITION is not set
> # CONFIG_AIX_PARTITION is not set
> CONFIG_OSF_PARTITION=3Dy
> CONFIG_AMIGA_PARTITION=3Dy
> # CONFIG_ATARI_PARTITION is not set
> CONFIG_MAC_PARTITION=3Dy
> CONFIG_MSDOS_PARTITION=3Dy
> CONFIG_BSD_DISKLABEL=3Dy
> CONFIG_MINIX_SUBPARTITION=3Dy
> CONFIG_SOLARIS_X86_PARTITION=3Dy
> CONFIG_UNIXWARE_DISKLABEL=3Dy
> # CONFIG_LDM_PARTITION is not set
> CONFIG_SGI_PARTITION=3Dy
> # CONFIG_ULTRIX_PARTITION is not set
> CONFIG_SUN_PARTITION=3Dy
> CONFIG_KARMA_PARTITION=3Dy
> CONFIG_EFI_PARTITION=3Dy
> # CONFIG_SYSV68_PARTITION is not set
> # CONFIG_CMDLINE_PARTITION is not set
> # end of Partition Types
> =

> CONFIG_BLOCK_COMPAT=3Dy
> CONFIG_BLK_MQ_PCI=3Dy
> CONFIG_BLK_MQ_VIRTIO=3Dy
> CONFIG_BLK_PM=3Dy
> CONFIG_BLOCK_HOLDER_DEPRECATED=3Dy
> =

> #
> # IO Schedulers
> #
> CONFIG_MQ_IOSCHED_DEADLINE=3Dy
> CONFIG_MQ_IOSCHED_KYBER=3Dy
> CONFIG_IOSCHED_BFQ=3Dy
> CONFIG_BFQ_GROUP_IOSCHED=3Dy
> # CONFIG_BFQ_CGROUP_DEBUG is not set
> # end of IO Schedulers
> =

> CONFIG_PREEMPT_NOTIFIERS=3Dy
> CONFIG_PADATA=3Dy
> CONFIG_ASN1=3Dy
> CONFIG_INLINE_SPIN_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_READ_UNLOCK=3Dy
> CONFIG_INLINE_READ_UNLOCK_IRQ=3Dy
> CONFIG_INLINE_WRITE_UNLOCK=3Dy
> CONFIG_INLINE_WRITE_UNLOCK_IRQ=3Dy
> CONFIG_ARCH_SUPPORTS_ATOMIC_RMW=3Dy
> CONFIG_MUTEX_SPIN_ON_OWNER=3Dy
> CONFIG_RWSEM_SPIN_ON_OWNER=3Dy
> CONFIG_LOCK_SPIN_ON_OWNER=3Dy
> CONFIG_ARCH_USE_QUEUED_SPINLOCKS=3Dy
> CONFIG_QUEUED_SPINLOCKS=3Dy
> CONFIG_ARCH_USE_QUEUED_RWLOCKS=3Dy
> CONFIG_QUEUED_RWLOCKS=3Dy
> CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE=3Dy
> CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE=3Dy
> CONFIG_ARCH_HAS_SYSCALL_WRAPPER=3Dy
> CONFIG_FREEZER=3Dy
> =

> #
> # Executable file formats
> #
> CONFIG_BINFMT_ELF=3Dy
> CONFIG_COMPAT_BINFMT_ELF=3Dy
> CONFIG_ELFCORE=3Dy
> CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS=3Dy
> CONFIG_BINFMT_SCRIPT=3Dy
> CONFIG_BINFMT_MISC=3Dm
> CONFIG_COREDUMP=3Dy
> # end of Executable file formats
> =

> #
> # Memory Management options
> #
> CONFIG_SELECT_MEMORY_MODEL=3Dy
> CONFIG_SPARSEMEM_MANUAL=3Dy
> CONFIG_SPARSEMEM=3Dy
> CONFIG_SPARSEMEM_EXTREME=3Dy
> CONFIG_SPARSEMEM_VMEMMAP_ENABLE=3Dy
> CONFIG_SPARSEMEM_VMEMMAP=3Dy
> CONFIG_HAVE_FAST_GUP=3Dy
> CONFIG_NUMA_KEEP_MEMINFO=3Dy
> CONFIG_MEMORY_ISOLATION=3Dy
> CONFIG_EXCLUSIVE_SYSTEM_RAM=3Dy
> CONFIG_HAVE_BOOTMEM_INFO_NODE=3Dy
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_ARCH_ENABLE_MEMORY_HOTREMOVE=3Dy
> CONFIG_MEMORY_HOTREMOVE=3Dy
> CONFIG_MHP_MEMMAP_ON_MEMORY=3Dy
> CONFIG_SPLIT_PTLOCK_CPUS=3D4
> CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK=3Dy
> CONFIG_MEMORY_BALLOON=3Dy
> CONFIG_BALLOON_COMPACTION=3Dy
> CONFIG_COMPACTION=3Dy
> CONFIG_PAGE_REPORTING=3Dy
> CONFIG_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION=3Dy
> CONFIG_ARCH_ENABLE_THP_MIGRATION=3Dy
> CONFIG_CONTIG_ALLOC=3Dy
> CONFIG_PHYS_ADDR_T_64BIT=3Dy
> CONFIG_VIRT_TO_BUS=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_KSM=3Dy
> CONFIG_DEFAULT_MMAP_MIN_ADDR=3D4096
> CONFIG_ARCH_SUPPORTS_MEMORY_FAILURE=3Dy
> CONFIG_MEMORY_FAILURE=3Dy
> CONFIG_HWPOISON_INJECT=3Dm
> CONFIG_TRANSPARENT_HUGEPAGE=3Dy
> CONFIG_TRANSPARENT_HUGEPAGE_ALWAYS=3Dy
> # CONFIG_TRANSPARENT_HUGEPAGE_MADVISE is not set
> CONFIG_ARCH_WANTS_THP_SWAP=3Dy
> CONFIG_THP_SWAP=3Dy
> CONFIG_CLEANCACHE=3Dy
> CONFIG_FRONTSWAP=3Dy
> # CONFIG_CMA is not set
> CONFIG_ZSWAP=3Dy
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_DEFLATE is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZO=3Dy
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_842 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4 is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_LZ4HC is not set
> # CONFIG_ZSWAP_COMPRESSOR_DEFAULT_ZSTD is not set
> CONFIG_ZSWAP_COMPRESSOR_DEFAULT=3D"lzo"
> CONFIG_ZSWAP_ZPOOL_DEFAULT_ZBUD=3Dy
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_Z3FOLD is not set
> # CONFIG_ZSWAP_ZPOOL_DEFAULT_ZSMALLOC is not set
> CONFIG_ZSWAP_ZPOOL_DEFAULT=3D"zbud"
> # CONFIG_ZSWAP_DEFAULT_ON is not set
> CONFIG_ZPOOL=3Dy
> CONFIG_ZBUD=3Dy
> # CONFIG_Z3FOLD is not set
> CONFIG_ZSMALLOC=3Dy
> CONFIG_ZSMALLOC_STAT=3Dy
> CONFIG_GENERIC_EARLY_IOREMAP=3Dy
> CONFIG_DEFERRED_STRUCT_PAGE_INIT=3Dy
> CONFIG_PAGE_IDLE_FLAG=3Dy
> CONFIG_IDLE_PAGE_TRACKING=3Dy
> CONFIG_ARCH_HAS_CACHE_LINE_SIZE=3Dy
> CONFIG_ARCH_HAS_PTE_DEVMAP=3Dy
> CONFIG_ZONE_DMA=3Dy
> CONFIG_ZONE_DMA32=3Dy
> CONFIG_ZONE_DEVICE=3Dy
> CONFIG_DEV_PAGEMAP_OPS=3Dy
> CONFIG_DEVICE_PRIVATE=3Dy
> CONFIG_VMAP_PFN=3Dy
> CONFIG_ARCH_USES_HIGH_VMA_FLAGS=3Dy
> CONFIG_ARCH_HAS_PKEYS=3Dy
> # CONFIG_PERCPU_STATS is not set
> # CONFIG_GUP_TEST is not set
> # CONFIG_READ_ONLY_THP_FOR_FS is not set
> CONFIG_ARCH_HAS_PTE_SPECIAL=3Dy
> CONFIG_SECRETMEM=3Dy
> =

> #
> # Data Access Monitoring
> #
> # CONFIG_DAMON is not set
> # end of Data Access Monitoring
> # end of Memory Management options
> =

> CONFIG_NET=3Dy
> CONFIG_NET_INGRESS=3Dy
> CONFIG_NET_EGRESS=3Dy
> CONFIG_SKB_EXTENSIONS=3Dy
> =

> #
> # Networking options
> #
> CONFIG_PACKET=3Dy
> CONFIG_PACKET_DIAG=3Dm
> CONFIG_UNIX=3Dy
> CONFIG_UNIX_SCM=3Dy
> CONFIG_AF_UNIX_OOB=3Dy
> CONFIG_UNIX_DIAG=3Dm
> CONFIG_TLS=3Dm
> CONFIG_TLS_DEVICE=3Dy
> # CONFIG_TLS_TOE is not set
> CONFIG_XFRM=3Dy
> CONFIG_XFRM_OFFLOAD=3Dy
> CONFIG_XFRM_ALGO=3Dy
> CONFIG_XFRM_USER=3Dy
> # CONFIG_XFRM_USER_COMPAT is not set
> # CONFIG_XFRM_INTERFACE is not set
> CONFIG_XFRM_SUB_POLICY=3Dy
> CONFIG_XFRM_MIGRATE=3Dy
> CONFIG_XFRM_STATISTICS=3Dy
> CONFIG_XFRM_AH=3Dm
> CONFIG_XFRM_ESP=3Dm
> CONFIG_XFRM_IPCOMP=3Dm
> CONFIG_NET_KEY=3Dm
> CONFIG_NET_KEY_MIGRATE=3Dy
> CONFIG_XDP_SOCKETS=3Dy
> # CONFIG_XDP_SOCKETS_DIAG is not set
> CONFIG_INET=3Dy
> CONFIG_IP_MULTICAST=3Dy
> CONFIG_IP_ADVANCED_ROUTER=3Dy
> CONFIG_IP_FIB_TRIE_STATS=3Dy
> CONFIG_IP_MULTIPLE_TABLES=3Dy
> CONFIG_IP_ROUTE_MULTIPATH=3Dy
> CONFIG_IP_ROUTE_VERBOSE=3Dy
> CONFIG_IP_ROUTE_CLASSID=3Dy
> CONFIG_IP_PNP=3Dy
> CONFIG_IP_PNP_DHCP=3Dy
> # CONFIG_IP_PNP_BOOTP is not set
> # CONFIG_IP_PNP_RARP is not set
> CONFIG_NET_IPIP=3Dm
> CONFIG_NET_IPGRE_DEMUX=3Dm
> CONFIG_NET_IP_TUNNEL=3Dm
> CONFIG_NET_IPGRE=3Dm
> CONFIG_NET_IPGRE_BROADCAST=3Dy
> CONFIG_IP_MROUTE_COMMON=3Dy
> CONFIG_IP_MROUTE=3Dy
> CONFIG_IP_MROUTE_MULTIPLE_TABLES=3Dy
> CONFIG_IP_PIMSM_V1=3Dy
> CONFIG_IP_PIMSM_V2=3Dy
> CONFIG_SYN_COOKIES=3Dy
> CONFIG_NET_IPVTI=3Dm
> CONFIG_NET_UDP_TUNNEL=3Dm
> # CONFIG_NET_FOU is not set
> # CONFIG_NET_FOU_IP_TUNNELS is not set
> CONFIG_INET_AH=3Dm
> CONFIG_INET_ESP=3Dm
> CONFIG_INET_ESP_OFFLOAD=3Dm
> # CONFIG_INET_ESPINTCP is not set
> CONFIG_INET_IPCOMP=3Dm
> CONFIG_INET_XFRM_TUNNEL=3Dm
> CONFIG_INET_TUNNEL=3Dm
> CONFIG_INET_DIAG=3Dm
> CONFIG_INET_TCP_DIAG=3Dm
> CONFIG_INET_UDP_DIAG=3Dm
> CONFIG_INET_RAW_DIAG=3Dm
> # CONFIG_INET_DIAG_DESTROY is not set
> CONFIG_TCP_CONG_ADVANCED=3Dy
> CONFIG_TCP_CONG_BIC=3Dm
> CONFIG_TCP_CONG_CUBIC=3Dy
> CONFIG_TCP_CONG_WESTWOOD=3Dm
> CONFIG_TCP_CONG_HTCP=3Dm
> CONFIG_TCP_CONG_HSTCP=3Dm
> CONFIG_TCP_CONG_HYBLA=3Dm
> CONFIG_TCP_CONG_VEGAS=3Dm
> CONFIG_TCP_CONG_NV=3Dm
> CONFIG_TCP_CONG_SCALABLE=3Dm
> CONFIG_TCP_CONG_LP=3Dm
> CONFIG_TCP_CONG_VENO=3Dm
> CONFIG_TCP_CONG_YEAH=3Dm
> CONFIG_TCP_CONG_ILLINOIS=3Dm
> CONFIG_TCP_CONG_DCTCP=3Dm
> # CONFIG_TCP_CONG_CDG is not set
> CONFIG_TCP_CONG_BBR=3Dm
> CONFIG_DEFAULT_CUBIC=3Dy
> # CONFIG_DEFAULT_RENO is not set
> CONFIG_DEFAULT_TCP_CONG=3D"cubic"
> CONFIG_TCP_MD5SIG=3Dy
> CONFIG_IPV6=3Dy
> CONFIG_IPV6_ROUTER_PREF=3Dy
> CONFIG_IPV6_ROUTE_INFO=3Dy
> CONFIG_IPV6_OPTIMISTIC_DAD=3Dy
> CONFIG_INET6_AH=3Dm
> CONFIG_INET6_ESP=3Dm
> CONFIG_INET6_ESP_OFFLOAD=3Dm
> # CONFIG_INET6_ESPINTCP is not set
> CONFIG_INET6_IPCOMP=3Dm
> CONFIG_IPV6_MIP6=3Dm
> # CONFIG_IPV6_ILA is not set
> CONFIG_INET6_XFRM_TUNNEL=3Dm
> CONFIG_INET6_TUNNEL=3Dm
> CONFIG_IPV6_VTI=3Dm
> CONFIG_IPV6_SIT=3Dm
> CONFIG_IPV6_SIT_6RD=3Dy
> CONFIG_IPV6_NDISC_NODETYPE=3Dy
> CONFIG_IPV6_TUNNEL=3Dm
> CONFIG_IPV6_GRE=3Dm
> CONFIG_IPV6_MULTIPLE_TABLES=3Dy
> # CONFIG_IPV6_SUBTREES is not set
> CONFIG_IPV6_MROUTE=3Dy
> CONFIG_IPV6_MROUTE_MULTIPLE_TABLES=3Dy
> CONFIG_IPV6_PIMSM_V2=3Dy
> # CONFIG_IPV6_SEG6_LWTUNNEL is not set
> # CONFIG_IPV6_SEG6_HMAC is not set
> # CONFIG_IPV6_RPL_LWTUNNEL is not set
> # CONFIG_IPV6_IOAM6_LWTUNNEL is not set
> CONFIG_NETLABEL=3Dy
> # CONFIG_MPTCP is not set
> CONFIG_NETWORK_SECMARK=3Dy
> CONFIG_NET_PTP_CLASSIFY=3Dy
> CONFIG_NETWORK_PHY_TIMESTAMPING=3Dy
> CONFIG_NETFILTER=3Dy
> CONFIG_NETFILTER_ADVANCED=3Dy
> CONFIG_BRIDGE_NETFILTER=3Dm
> =

> #
> # Core Netfilter Configuration
> #
> CONFIG_NETFILTER_INGRESS=3Dy
> CONFIG_NETFILTER_EGRESS=3Dy
> CONFIG_NETFILTER_SKIP_EGRESS=3Dy
> CONFIG_NETFILTER_NETLINK=3Dm
> CONFIG_NETFILTER_FAMILY_BRIDGE=3Dy
> CONFIG_NETFILTER_FAMILY_ARP=3Dy
> # CONFIG_NETFILTER_NETLINK_HOOK is not set
> # CONFIG_NETFILTER_NETLINK_ACCT is not set
> CONFIG_NETFILTER_NETLINK_QUEUE=3Dm
> CONFIG_NETFILTER_NETLINK_LOG=3Dm
> CONFIG_NETFILTER_NETLINK_OSF=3Dm
> CONFIG_NF_CONNTRACK=3Dm
> CONFIG_NF_LOG_SYSLOG=3Dm
> CONFIG_NETFILTER_CONNCOUNT=3Dm
> CONFIG_NF_CONNTRACK_MARK=3Dy
> CONFIG_NF_CONNTRACK_SECMARK=3Dy
> CONFIG_NF_CONNTRACK_ZONES=3Dy
> CONFIG_NF_CONNTRACK_PROCFS=3Dy
> CONFIG_NF_CONNTRACK_EVENTS=3Dy
> CONFIG_NF_CONNTRACK_TIMEOUT=3Dy
> CONFIG_NF_CONNTRACK_TIMESTAMP=3Dy
> CONFIG_NF_CONNTRACK_LABELS=3Dy
> CONFIG_NF_CT_PROTO_DCCP=3Dy
> CONFIG_NF_CT_PROTO_GRE=3Dy
> CONFIG_NF_CT_PROTO_SCTP=3Dy
> CONFIG_NF_CT_PROTO_UDPLITE=3Dy
> CONFIG_NF_CONNTRACK_AMANDA=3Dm
> CONFIG_NF_CONNTRACK_FTP=3Dm
> CONFIG_NF_CONNTRACK_H323=3Dm
> CONFIG_NF_CONNTRACK_IRC=3Dm
> CONFIG_NF_CONNTRACK_BROADCAST=3Dm
> CONFIG_NF_CONNTRACK_NETBIOS_NS=3Dm
> CONFIG_NF_CONNTRACK_SNMP=3Dm
> CONFIG_NF_CONNTRACK_PPTP=3Dm
> CONFIG_NF_CONNTRACK_SANE=3Dm
> CONFIG_NF_CONNTRACK_SIP=3Dm
> CONFIG_NF_CONNTRACK_TFTP=3Dm
> CONFIG_NF_CT_NETLINK=3Dm
> CONFIG_NF_CT_NETLINK_TIMEOUT=3Dm
> CONFIG_NF_CT_NETLINK_HELPER=3Dm
> CONFIG_NETFILTER_NETLINK_GLUE_CT=3Dy
> CONFIG_NF_NAT=3Dm
> CONFIG_NF_NAT_AMANDA=3Dm
> CONFIG_NF_NAT_FTP=3Dm
> CONFIG_NF_NAT_IRC=3Dm
> CONFIG_NF_NAT_SIP=3Dm
> CONFIG_NF_NAT_TFTP=3Dm
> CONFIG_NF_NAT_REDIRECT=3Dy
> CONFIG_NF_NAT_MASQUERADE=3Dy
> CONFIG_NETFILTER_SYNPROXY=3Dm
> CONFIG_NF_TABLES=3Dm
> CONFIG_NF_TABLES_INET=3Dy
> CONFIG_NF_TABLES_NETDEV=3Dy
> CONFIG_NFT_NUMGEN=3Dm
> CONFIG_NFT_CT=3Dm
> CONFIG_NFT_COUNTER=3Dm
> CONFIG_NFT_CONNLIMIT=3Dm
> CONFIG_NFT_LOG=3Dm
> CONFIG_NFT_LIMIT=3Dm
> CONFIG_NFT_MASQ=3Dm
> CONFIG_NFT_REDIR=3Dm
> CONFIG_NFT_NAT=3Dm
> # CONFIG_NFT_TUNNEL is not set
> CONFIG_NFT_OBJREF=3Dm
> CONFIG_NFT_QUEUE=3Dm
> CONFIG_NFT_QUOTA=3Dm
> CONFIG_NFT_REJECT=3Dm
> CONFIG_NFT_REJECT_INET=3Dm
> CONFIG_NFT_COMPAT=3Dm
> CONFIG_NFT_HASH=3Dm
> CONFIG_NFT_FIB=3Dm
> CONFIG_NFT_FIB_INET=3Dm
> # CONFIG_NFT_XFRM is not set
> CONFIG_NFT_SOCKET=3Dm
> # CONFIG_NFT_OSF is not set
> # CONFIG_NFT_TPROXY is not set
> # CONFIG_NFT_SYNPROXY is not set
> CONFIG_NF_DUP_NETDEV=3Dm
> CONFIG_NFT_DUP_NETDEV=3Dm
> CONFIG_NFT_FWD_NETDEV=3Dm
> CONFIG_NFT_FIB_NETDEV=3Dm
> # CONFIG_NFT_REJECT_NETDEV is not set
> # CONFIG_NF_FLOW_TABLE is not set
> CONFIG_NETFILTER_XTABLES=3Dy
> CONFIG_NETFILTER_XTABLES_COMPAT=3Dy
> =

> #
> # Xtables combined modules
> #
> CONFIG_NETFILTER_XT_MARK=3Dm
> CONFIG_NETFILTER_XT_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_SET=3Dm
> =

> #
> # Xtables targets
> #
> CONFIG_NETFILTER_XT_TARGET_AUDIT=3Dm
> CONFIG_NETFILTER_XT_TARGET_CHECKSUM=3Dm
> CONFIG_NETFILTER_XT_TARGET_CLASSIFY=3Dm
> CONFIG_NETFILTER_XT_TARGET_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_CONNSECMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_CT=3Dm
> CONFIG_NETFILTER_XT_TARGET_DSCP=3Dm
> CONFIG_NETFILTER_XT_TARGET_HL=3Dm
> CONFIG_NETFILTER_XT_TARGET_HMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_IDLETIMER=3Dm
> # CONFIG_NETFILTER_XT_TARGET_LED is not set
> CONFIG_NETFILTER_XT_TARGET_LOG=3Dm
> CONFIG_NETFILTER_XT_TARGET_MARK=3Dm
> CONFIG_NETFILTER_XT_NAT=3Dm
> CONFIG_NETFILTER_XT_TARGET_NETMAP=3Dm
> CONFIG_NETFILTER_XT_TARGET_NFLOG=3Dm
> CONFIG_NETFILTER_XT_TARGET_NFQUEUE=3Dm
> CONFIG_NETFILTER_XT_TARGET_NOTRACK=3Dm
> CONFIG_NETFILTER_XT_TARGET_RATEEST=3Dm
> CONFIG_NETFILTER_XT_TARGET_REDIRECT=3Dm
> CONFIG_NETFILTER_XT_TARGET_MASQUERADE=3Dm
> CONFIG_NETFILTER_XT_TARGET_TEE=3Dm
> CONFIG_NETFILTER_XT_TARGET_TPROXY=3Dm
> CONFIG_NETFILTER_XT_TARGET_TRACE=3Dm
> CONFIG_NETFILTER_XT_TARGET_SECMARK=3Dm
> CONFIG_NETFILTER_XT_TARGET_TCPMSS=3Dm
> CONFIG_NETFILTER_XT_TARGET_TCPOPTSTRIP=3Dm
> =

> #
> # Xtables matches
> #
> CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=3Dm
> CONFIG_NETFILTER_XT_MATCH_BPF=3Dm
> CONFIG_NETFILTER_XT_MATCH_CGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_CLUSTER=3Dm
> CONFIG_NETFILTER_XT_MATCH_COMMENT=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNBYTES=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNLABEL=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNMARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CONNTRACK=3Dm
> CONFIG_NETFILTER_XT_MATCH_CPU=3Dm
> CONFIG_NETFILTER_XT_MATCH_DCCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DEVGROUP=3Dm
> CONFIG_NETFILTER_XT_MATCH_DSCP=3Dm
> CONFIG_NETFILTER_XT_MATCH_ECN=3Dm
> CONFIG_NETFILTER_XT_MATCH_ESP=3Dm
> CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_HELPER=3Dm
> CONFIG_NETFILTER_XT_MATCH_HL=3Dm
> # CONFIG_NETFILTER_XT_MATCH_IPCOMP is not set
> CONFIG_NETFILTER_XT_MATCH_IPRANGE=3Dm
> CONFIG_NETFILTER_XT_MATCH_IPVS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_L2TP is not set
> CONFIG_NETFILTER_XT_MATCH_LENGTH=3Dm
> CONFIG_NETFILTER_XT_MATCH_LIMIT=3Dm
> CONFIG_NETFILTER_XT_MATCH_MAC=3Dm
> CONFIG_NETFILTER_XT_MATCH_MARK=3Dm
> CONFIG_NETFILTER_XT_MATCH_MULTIPORT=3Dm
> # CONFIG_NETFILTER_XT_MATCH_NFACCT is not set
> CONFIG_NETFILTER_XT_MATCH_OSF=3Dm
> CONFIG_NETFILTER_XT_MATCH_OWNER=3Dm
> CONFIG_NETFILTER_XT_MATCH_POLICY=3Dm
> CONFIG_NETFILTER_XT_MATCH_PHYSDEV=3Dm
> CONFIG_NETFILTER_XT_MATCH_PKTTYPE=3Dm
> CONFIG_NETFILTER_XT_MATCH_QUOTA=3Dm
> CONFIG_NETFILTER_XT_MATCH_RATEEST=3Dm
> CONFIG_NETFILTER_XT_MATCH_REALM=3Dm
> CONFIG_NETFILTER_XT_MATCH_RECENT=3Dm
> CONFIG_NETFILTER_XT_MATCH_SCTP=3Dm
> CONFIG_NETFILTER_XT_MATCH_SOCKET=3Dm
> CONFIG_NETFILTER_XT_MATCH_STATE=3Dm
> CONFIG_NETFILTER_XT_MATCH_STATISTIC=3Dm
> CONFIG_NETFILTER_XT_MATCH_STRING=3Dm
> CONFIG_NETFILTER_XT_MATCH_TCPMSS=3Dm
> # CONFIG_NETFILTER_XT_MATCH_TIME is not set
> # CONFIG_NETFILTER_XT_MATCH_U32 is not set
> # end of Core Netfilter Configuration
> =

> CONFIG_IP_SET=3Dm
> CONFIG_IP_SET_MAX=3D256
> CONFIG_IP_SET_BITMAP_IP=3Dm
> CONFIG_IP_SET_BITMAP_IPMAC=3Dm
> CONFIG_IP_SET_BITMAP_PORT=3Dm
> CONFIG_IP_SET_HASH_IP=3Dm
> CONFIG_IP_SET_HASH_IPMARK=3Dm
> CONFIG_IP_SET_HASH_IPPORT=3Dm
> CONFIG_IP_SET_HASH_IPPORTIP=3Dm
> CONFIG_IP_SET_HASH_IPPORTNET=3Dm
> CONFIG_IP_SET_HASH_IPMAC=3Dm
> CONFIG_IP_SET_HASH_MAC=3Dm
> CONFIG_IP_SET_HASH_NETPORTNET=3Dm
> CONFIG_IP_SET_HASH_NET=3Dm
> CONFIG_IP_SET_HASH_NETNET=3Dm
> CONFIG_IP_SET_HASH_NETPORT=3Dm
> CONFIG_IP_SET_HASH_NETIFACE=3Dm
> CONFIG_IP_SET_LIST_SET=3Dm
> CONFIG_IP_VS=3Dm
> CONFIG_IP_VS_IPV6=3Dy
> # CONFIG_IP_VS_DEBUG is not set
> CONFIG_IP_VS_TAB_BITS=3D12
> =

> #
> # IPVS transport protocol load balancing support
> #
> CONFIG_IP_VS_PROTO_TCP=3Dy
> CONFIG_IP_VS_PROTO_UDP=3Dy
> CONFIG_IP_VS_PROTO_AH_ESP=3Dy
> CONFIG_IP_VS_PROTO_ESP=3Dy
> CONFIG_IP_VS_PROTO_AH=3Dy
> CONFIG_IP_VS_PROTO_SCTP=3Dy
> =

> #
> # IPVS scheduler
> #
> CONFIG_IP_VS_RR=3Dm
> CONFIG_IP_VS_WRR=3Dm
> CONFIG_IP_VS_LC=3Dm
> CONFIG_IP_VS_WLC=3Dm
> CONFIG_IP_VS_FO=3Dm
> CONFIG_IP_VS_OVF=3Dm
> CONFIG_IP_VS_LBLC=3Dm
> CONFIG_IP_VS_LBLCR=3Dm
> CONFIG_IP_VS_DH=3Dm
> CONFIG_IP_VS_SH=3Dm
> # CONFIG_IP_VS_MH is not set
> CONFIG_IP_VS_SED=3Dm
> CONFIG_IP_VS_NQ=3Dm
> # CONFIG_IP_VS_TWOS is not set
> =

> #
> # IPVS SH scheduler
> #
> CONFIG_IP_VS_SH_TAB_BITS=3D8
> =

> #
> # IPVS MH scheduler
> #
> CONFIG_IP_VS_MH_TAB_INDEX=3D12
> =

> #
> # IPVS application helper
> #
> CONFIG_IP_VS_FTP=3Dm
> CONFIG_IP_VS_NFCT=3Dy
> CONFIG_IP_VS_PE_SIP=3Dm
> =

> #
> # IP: Netfilter Configuration
> #
> CONFIG_NF_DEFRAG_IPV4=3Dm
> CONFIG_NF_SOCKET_IPV4=3Dm
> CONFIG_NF_TPROXY_IPV4=3Dm
> CONFIG_NF_TABLES_IPV4=3Dy
> CONFIG_NFT_REJECT_IPV4=3Dm
> CONFIG_NFT_DUP_IPV4=3Dm
> CONFIG_NFT_FIB_IPV4=3Dm
> CONFIG_NF_TABLES_ARP=3Dy
> CONFIG_NF_DUP_IPV4=3Dm
> CONFIG_NF_LOG_ARP=3Dm
> CONFIG_NF_LOG_IPV4=3Dm
> CONFIG_NF_REJECT_IPV4=3Dm
> CONFIG_NF_NAT_SNMP_BASIC=3Dm
> CONFIG_NF_NAT_PPTP=3Dm
> CONFIG_NF_NAT_H323=3Dm
> CONFIG_IP_NF_IPTABLES=3Dm
> CONFIG_IP_NF_MATCH_AH=3Dm
> CONFIG_IP_NF_MATCH_ECN=3Dm
> CONFIG_IP_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP_NF_MATCH_TTL=3Dm
> CONFIG_IP_NF_FILTER=3Dm
> CONFIG_IP_NF_TARGET_REJECT=3Dm
> CONFIG_IP_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP_NF_NAT=3Dm
> CONFIG_IP_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP_NF_TARGET_NETMAP=3Dm
> CONFIG_IP_NF_TARGET_REDIRECT=3Dm
> CONFIG_IP_NF_MANGLE=3Dm
> # CONFIG_IP_NF_TARGET_CLUSTERIP is not set
> CONFIG_IP_NF_TARGET_ECN=3Dm
> CONFIG_IP_NF_TARGET_TTL=3Dm
> CONFIG_IP_NF_RAW=3Dm
> CONFIG_IP_NF_SECURITY=3Dm
> CONFIG_IP_NF_ARPTABLES=3Dm
> CONFIG_IP_NF_ARPFILTER=3Dm
> CONFIG_IP_NF_ARP_MANGLE=3Dm
> # end of IP: Netfilter Configuration
> =

> #
> # IPv6: Netfilter Configuration
> #
> CONFIG_NF_SOCKET_IPV6=3Dm
> CONFIG_NF_TPROXY_IPV6=3Dm
> CONFIG_NF_TABLES_IPV6=3Dy
> CONFIG_NFT_REJECT_IPV6=3Dm
> CONFIG_NFT_DUP_IPV6=3Dm
> CONFIG_NFT_FIB_IPV6=3Dm
> CONFIG_NF_DUP_IPV6=3Dm
> CONFIG_NF_REJECT_IPV6=3Dm
> CONFIG_NF_LOG_IPV6=3Dm
> CONFIG_IP6_NF_IPTABLES=3Dm
> CONFIG_IP6_NF_MATCH_AH=3Dm
> CONFIG_IP6_NF_MATCH_EUI64=3Dm
> CONFIG_IP6_NF_MATCH_FRAG=3Dm
> CONFIG_IP6_NF_MATCH_OPTS=3Dm
> CONFIG_IP6_NF_MATCH_HL=3Dm
> CONFIG_IP6_NF_MATCH_IPV6HEADER=3Dm
> CONFIG_IP6_NF_MATCH_MH=3Dm
> CONFIG_IP6_NF_MATCH_RPFILTER=3Dm
> CONFIG_IP6_NF_MATCH_RT=3Dm
> # CONFIG_IP6_NF_MATCH_SRH is not set
> # CONFIG_IP6_NF_TARGET_HL is not set
> CONFIG_IP6_NF_FILTER=3Dm
> CONFIG_IP6_NF_TARGET_REJECT=3Dm
> CONFIG_IP6_NF_TARGET_SYNPROXY=3Dm
> CONFIG_IP6_NF_MANGLE=3Dm
> CONFIG_IP6_NF_RAW=3Dm
> CONFIG_IP6_NF_SECURITY=3Dm
> CONFIG_IP6_NF_NAT=3Dm
> CONFIG_IP6_NF_TARGET_MASQUERADE=3Dm
> CONFIG_IP6_NF_TARGET_NPT=3Dm
> # end of IPv6: Netfilter Configuration
> =

> CONFIG_NF_DEFRAG_IPV6=3Dm
> CONFIG_NF_TABLES_BRIDGE=3Dm
> # CONFIG_NFT_BRIDGE_META is not set
> CONFIG_NFT_BRIDGE_REJECT=3Dm
> # CONFIG_NF_CONNTRACK_BRIDGE is not set
> CONFIG_BRIDGE_NF_EBTABLES=3Dm
> CONFIG_BRIDGE_EBT_BROUTE=3Dm
> CONFIG_BRIDGE_EBT_T_FILTER=3Dm
> CONFIG_BRIDGE_EBT_T_NAT=3Dm
> CONFIG_BRIDGE_EBT_802_3=3Dm
> CONFIG_BRIDGE_EBT_AMONG=3Dm
> CONFIG_BRIDGE_EBT_ARP=3Dm
> CONFIG_BRIDGE_EBT_IP=3Dm
> CONFIG_BRIDGE_EBT_IP6=3Dm
> CONFIG_BRIDGE_EBT_LIMIT=3Dm
> CONFIG_BRIDGE_EBT_MARK=3Dm
> CONFIG_BRIDGE_EBT_PKTTYPE=3Dm
> CONFIG_BRIDGE_EBT_STP=3Dm
> CONFIG_BRIDGE_EBT_VLAN=3Dm
> CONFIG_BRIDGE_EBT_ARPREPLY=3Dm
> CONFIG_BRIDGE_EBT_DNAT=3Dm
> CONFIG_BRIDGE_EBT_MARK_T=3Dm
> CONFIG_BRIDGE_EBT_REDIRECT=3Dm
> CONFIG_BRIDGE_EBT_SNAT=3Dm
> CONFIG_BRIDGE_EBT_LOG=3Dm
> CONFIG_BRIDGE_EBT_NFLOG=3Dm
> # CONFIG_BPFILTER is not set
> CONFIG_IP_DCCP=3Dy
> CONFIG_INET_DCCP_DIAG=3Dm
> =

> #
> # DCCP CCIDs Configuration
> #
> # CONFIG_IP_DCCP_CCID2_DEBUG is not set
> CONFIG_IP_DCCP_CCID3=3Dy
> # CONFIG_IP_DCCP_CCID3_DEBUG is not set
> CONFIG_IP_DCCP_TFRC_LIB=3Dy
> # end of DCCP CCIDs Configuration
> =

> #
> # DCCP Kernel Hacking
> #
> # CONFIG_IP_DCCP_DEBUG is not set
> # end of DCCP Kernel Hacking
> =

> CONFIG_IP_SCTP=3Dm
> # CONFIG_SCTP_DBG_OBJCNT is not set
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_MD5 is not set
> CONFIG_SCTP_DEFAULT_COOKIE_HMAC_SHA1=3Dy
> # CONFIG_SCTP_DEFAULT_COOKIE_HMAC_NONE is not set
> CONFIG_SCTP_COOKIE_HMAC_MD5=3Dy
> CONFIG_SCTP_COOKIE_HMAC_SHA1=3Dy
> CONFIG_INET_SCTP_DIAG=3Dm
> # CONFIG_RDS is not set
> CONFIG_TIPC=3Dm
> CONFIG_TIPC_MEDIA_UDP=3Dy
> CONFIG_TIPC_CRYPTO=3Dy
> CONFIG_TIPC_DIAG=3Dm
> CONFIG_ATM=3Dm
> CONFIG_ATM_CLIP=3Dm
> # CONFIG_ATM_CLIP_NO_ICMP is not set
> CONFIG_ATM_LANE=3Dm
> # CONFIG_ATM_MPOA is not set
> CONFIG_ATM_BR2684=3Dm
> # CONFIG_ATM_BR2684_IPFILTER is not set
> CONFIG_L2TP=3Dm
> CONFIG_L2TP_DEBUGFS=3Dm
> CONFIG_L2TP_V3=3Dy
> CONFIG_L2TP_IP=3Dm
> CONFIG_L2TP_ETH=3Dm
> CONFIG_STP=3Dm
> CONFIG_GARP=3Dm
> CONFIG_MRP=3Dm
> CONFIG_BRIDGE=3Dm
> CONFIG_BRIDGE_IGMP_SNOOPING=3Dy
> CONFIG_BRIDGE_VLAN_FILTERING=3Dy
> # CONFIG_BRIDGE_MRP is not set
> # CONFIG_BRIDGE_CFM is not set
> # CONFIG_NET_DSA is not set
> CONFIG_VLAN_8021Q=3Dm
> CONFIG_VLAN_8021Q_GVRP=3Dy
> CONFIG_VLAN_8021Q_MVRP=3Dy
> # CONFIG_DECNET is not set
> CONFIG_LLC=3Dm
> # CONFIG_LLC2 is not set
> # CONFIG_ATALK is not set
> # CONFIG_X25 is not set
> # CONFIG_LAPB is not set
> # CONFIG_PHONET is not set
> CONFIG_6LOWPAN=3Dm
> # CONFIG_6LOWPAN_DEBUGFS is not set
> # CONFIG_6LOWPAN_NHC is not set
> CONFIG_IEEE802154=3Dm
> # CONFIG_IEEE802154_NL802154_EXPERIMENTAL is not set
> CONFIG_IEEE802154_SOCKET=3Dm
> CONFIG_IEEE802154_6LOWPAN=3Dm
> CONFIG_MAC802154=3Dm
> CONFIG_NET_SCHED=3Dy
> =

> #
> # Queueing/Scheduling
> #
> CONFIG_NET_SCH_CBQ=3Dm
> CONFIG_NET_SCH_HTB=3Dm
> CONFIG_NET_SCH_HFSC=3Dm
> CONFIG_NET_SCH_ATM=3Dm
> CONFIG_NET_SCH_PRIO=3Dm
> CONFIG_NET_SCH_MULTIQ=3Dm
> CONFIG_NET_SCH_RED=3Dm
> CONFIG_NET_SCH_SFB=3Dm
> CONFIG_NET_SCH_SFQ=3Dm
> CONFIG_NET_SCH_TEQL=3Dm
> CONFIG_NET_SCH_TBF=3Dm
> # CONFIG_NET_SCH_CBS is not set
> # CONFIG_NET_SCH_ETF is not set
> # CONFIG_NET_SCH_TAPRIO is not set
> CONFIG_NET_SCH_GRED=3Dm
> CONFIG_NET_SCH_DSMARK=3Dm
> CONFIG_NET_SCH_NETEM=3Dm
> CONFIG_NET_SCH_DRR=3Dm
> CONFIG_NET_SCH_MQPRIO=3Dm
> # CONFIG_NET_SCH_SKBPRIO is not set
> CONFIG_NET_SCH_CHOKE=3Dm
> CONFIG_NET_SCH_QFQ=3Dm
> CONFIG_NET_SCH_CODEL=3Dm
> CONFIG_NET_SCH_FQ_CODEL=3Dy
> # CONFIG_NET_SCH_CAKE is not set
> CONFIG_NET_SCH_FQ=3Dm
> CONFIG_NET_SCH_HHF=3Dm
> CONFIG_NET_SCH_PIE=3Dm
> # CONFIG_NET_SCH_FQ_PIE is not set
> CONFIG_NET_SCH_INGRESS=3Dm
> CONFIG_NET_SCH_PLUG=3Dm
> # CONFIG_NET_SCH_ETS is not set
> CONFIG_NET_SCH_DEFAULT=3Dy
> # CONFIG_DEFAULT_FQ is not set
> # CONFIG_DEFAULT_CODEL is not set
> CONFIG_DEFAULT_FQ_CODEL=3Dy
> # CONFIG_DEFAULT_SFQ is not set
> # CONFIG_DEFAULT_PFIFO_FAST is not set
> CONFIG_DEFAULT_NET_SCH=3D"fq_codel"
> =

> #
> # Classification
> #
> CONFIG_NET_CLS=3Dy
> CONFIG_NET_CLS_BASIC=3Dm
> CONFIG_NET_CLS_TCINDEX=3Dm
> CONFIG_NET_CLS_ROUTE4=3Dm
> CONFIG_NET_CLS_FW=3Dm
> CONFIG_NET_CLS_U32=3Dm
> CONFIG_CLS_U32_PERF=3Dy
> CONFIG_CLS_U32_MARK=3Dy
> CONFIG_NET_CLS_RSVP=3Dm
> CONFIG_NET_CLS_RSVP6=3Dm
> CONFIG_NET_CLS_FLOW=3Dm
> CONFIG_NET_CLS_CGROUP=3Dy
> CONFIG_NET_CLS_BPF=3Dm
> CONFIG_NET_CLS_FLOWER=3Dm
> CONFIG_NET_CLS_MATCHALL=3Dm
> CONFIG_NET_EMATCH=3Dy
> CONFIG_NET_EMATCH_STACK=3D32
> CONFIG_NET_EMATCH_CMP=3Dm
> CONFIG_NET_EMATCH_NBYTE=3Dm
> CONFIG_NET_EMATCH_U32=3Dm
> CONFIG_NET_EMATCH_META=3Dm
> CONFIG_NET_EMATCH_TEXT=3Dm
> # CONFIG_NET_EMATCH_CANID is not set
> CONFIG_NET_EMATCH_IPSET=3Dm
> # CONFIG_NET_EMATCH_IPT is not set
> CONFIG_NET_CLS_ACT=3Dy
> CONFIG_NET_ACT_POLICE=3Dm
> CONFIG_NET_ACT_GACT=3Dm
> CONFIG_GACT_PROB=3Dy
> CONFIG_NET_ACT_MIRRED=3Dm
> CONFIG_NET_ACT_SAMPLE=3Dm
> # CONFIG_NET_ACT_IPT is not set
> CONFIG_NET_ACT_NAT=3Dm
> CONFIG_NET_ACT_PEDIT=3Dm
> CONFIG_NET_ACT_SIMP=3Dm
> CONFIG_NET_ACT_SKBEDIT=3Dm
> CONFIG_NET_ACT_CSUM=3Dm
> # CONFIG_NET_ACT_MPLS is not set
> CONFIG_NET_ACT_VLAN=3Dm
> CONFIG_NET_ACT_BPF=3Dm
> # CONFIG_NET_ACT_CONNMARK is not set
> # CONFIG_NET_ACT_CTINFO is not set
> CONFIG_NET_ACT_SKBMOD=3Dm
> # CONFIG_NET_ACT_IFE is not set
> CONFIG_NET_ACT_TUNNEL_KEY=3Dm
> # CONFIG_NET_ACT_GATE is not set
> # CONFIG_NET_TC_SKB_EXT is not set
> CONFIG_NET_SCH_FIFO=3Dy
> CONFIG_DCB=3Dy
> CONFIG_DNS_RESOLVER=3Dm
> # CONFIG_BATMAN_ADV is not set
> CONFIG_OPENVSWITCH=3Dm
> CONFIG_OPENVSWITCH_GRE=3Dm
> CONFIG_VSOCKETS=3Dm
> CONFIG_VSOCKETS_DIAG=3Dm
> CONFIG_VSOCKETS_LOOPBACK=3Dm
> CONFIG_VMWARE_VMCI_VSOCKETS=3Dm
> CONFIG_VIRTIO_VSOCKETS=3Dm
> CONFIG_VIRTIO_VSOCKETS_COMMON=3Dm
> CONFIG_HYPERV_VSOCKETS=3Dm
> CONFIG_NETLINK_DIAG=3Dm
> CONFIG_MPLS=3Dy
> CONFIG_NET_MPLS_GSO=3Dy
> CONFIG_MPLS_ROUTING=3Dm
> CONFIG_MPLS_IPTUNNEL=3Dm
> CONFIG_NET_NSH=3Dy
> # CONFIG_HSR is not set
> CONFIG_NET_SWITCHDEV=3Dy
> CONFIG_NET_L3_MASTER_DEV=3Dy
> # CONFIG_QRTR is not set
> # CONFIG_NET_NCSI is not set
> CONFIG_PCPU_DEV_REFCNT=3Dy
> CONFIG_RPS=3Dy
> CONFIG_RFS_ACCEL=3Dy
> CONFIG_SOCK_RX_QUEUE_MAPPING=3Dy
> CONFIG_XPS=3Dy
> CONFIG_CGROUP_NET_PRIO=3Dy
> CONFIG_CGROUP_NET_CLASSID=3Dy
> CONFIG_NET_RX_BUSY_POLL=3Dy
> CONFIG_BQL=3Dy
> CONFIG_BPF_STREAM_PARSER=3Dy
> CONFIG_NET_FLOW_LIMIT=3Dy
> =

> #
> # Network testing
> #
> CONFIG_NET_PKTGEN=3Dm
> CONFIG_NET_DROP_MONITOR=3Dy
> # end of Network testing
> # end of Networking options
> =

> # CONFIG_HAMRADIO is not set
> CONFIG_CAN=3Dm
> CONFIG_CAN_RAW=3Dm
> CONFIG_CAN_BCM=3Dm
> CONFIG_CAN_GW=3Dm
> # CONFIG_CAN_J1939 is not set
> # CONFIG_CAN_ISOTP is not set
> =

> #
> # CAN Device Drivers
> #
> CONFIG_CAN_VCAN=3Dm
> # CONFIG_CAN_VXCAN is not set
> CONFIG_CAN_SLCAN=3Dm
> CONFIG_CAN_DEV=3Dm
> CONFIG_CAN_CALC_BITTIMING=3Dy
> # CONFIG_CAN_KVASER_PCIEFD is not set
> CONFIG_CAN_C_CAN=3Dm
> CONFIG_CAN_C_CAN_PLATFORM=3Dm
> CONFIG_CAN_C_CAN_PCI=3Dm
> CONFIG_CAN_CC770=3Dm
> # CONFIG_CAN_CC770_ISA is not set
> CONFIG_CAN_CC770_PLATFORM=3Dm
> # CONFIG_CAN_IFI_CANFD is not set
> # CONFIG_CAN_M_CAN is not set
> # CONFIG_CAN_PEAK_PCIEFD is not set
> CONFIG_CAN_SJA1000=3Dm
> CONFIG_CAN_EMS_PCI=3Dm
> # CONFIG_CAN_F81601 is not set
> CONFIG_CAN_KVASER_PCI=3Dm
> CONFIG_CAN_PEAK_PCI=3Dm
> CONFIG_CAN_PEAK_PCIEC=3Dy
> CONFIG_CAN_PLX_PCI=3Dm
> # CONFIG_CAN_SJA1000_ISA is not set
> CONFIG_CAN_SJA1000_PLATFORM=3Dm
> CONFIG_CAN_SOFTING=3Dm
> =

> #
> # CAN SPI interfaces
> #
> # CONFIG_CAN_HI311X is not set
> # CONFIG_CAN_MCP251X is not set
> # CONFIG_CAN_MCP251XFD is not set
> # end of CAN SPI interfaces
> =

> #
> # CAN USB interfaces
> #
> # CONFIG_CAN_8DEV_USB is not set
> # CONFIG_CAN_EMS_USB is not set
> # CONFIG_CAN_ESD_USB2 is not set
> # CONFIG_CAN_ETAS_ES58X is not set
> # CONFIG_CAN_GS_USB is not set
> # CONFIG_CAN_KVASER_USB is not set
> # CONFIG_CAN_MCBA_USB is not set
> # CONFIG_CAN_PEAK_USB is not set
> # CONFIG_CAN_UCAN is not set
> # end of CAN USB interfaces
> =

> # CONFIG_CAN_DEBUG_DEVICES is not set
> # end of CAN Device Drivers
> =

> CONFIG_BT=3Dm
> CONFIG_BT_BREDR=3Dy
> CONFIG_BT_RFCOMM=3Dm
> CONFIG_BT_RFCOMM_TTY=3Dy
> CONFIG_BT_BNEP=3Dm
> CONFIG_BT_BNEP_MC_FILTER=3Dy
> CONFIG_BT_BNEP_PROTO_FILTER=3Dy
> CONFIG_BT_HIDP=3Dm
> CONFIG_BT_HS=3Dy
> CONFIG_BT_LE=3Dy
> # CONFIG_BT_6LOWPAN is not set
> # CONFIG_BT_LEDS is not set
> # CONFIG_BT_MSFTEXT is not set
> # CONFIG_BT_AOSPEXT is not set
> CONFIG_BT_DEBUGFS=3Dy
> # CONFIG_BT_SELFTEST is not set
> =

> #
> # Bluetooth device drivers
> #
> # CONFIG_BT_HCIBTUSB is not set
> # CONFIG_BT_HCIBTSDIO is not set
> CONFIG_BT_HCIUART=3Dm
> CONFIG_BT_HCIUART_H4=3Dy
> CONFIG_BT_HCIUART_BCSP=3Dy
> CONFIG_BT_HCIUART_ATH3K=3Dy
> # CONFIG_BT_HCIUART_INTEL is not set
> # CONFIG_BT_HCIUART_AG6XX is not set
> # CONFIG_BT_HCIBCM203X is not set
> # CONFIG_BT_HCIBPA10X is not set
> # CONFIG_BT_HCIBFUSB is not set
> CONFIG_BT_HCIVHCI=3Dm
> CONFIG_BT_MRVL=3Dm
> # CONFIG_BT_MRVL_SDIO is not set
> # CONFIG_BT_MTKSDIO is not set
> # CONFIG_BT_VIRTIO is not set
> # end of Bluetooth device drivers
> =

> # CONFIG_AF_RXRPC is not set
> # CONFIG_AF_KCM is not set
> CONFIG_STREAM_PARSER=3Dy
> # CONFIG_MCTP is not set
> CONFIG_FIB_RULES=3Dy
> CONFIG_WIRELESS=3Dy
> CONFIG_CFG80211=3Dm
> # CONFIG_NL80211_TESTMODE is not set
> # CONFIG_CFG80211_DEVELOPER_WARNINGS is not set
> CONFIG_CFG80211_REQUIRE_SIGNED_REGDB=3Dy
> CONFIG_CFG80211_USE_KERNEL_REGDB_KEYS=3Dy
> CONFIG_CFG80211_DEFAULT_PS=3Dy
> # CONFIG_CFG80211_DEBUGFS is not set
> CONFIG_CFG80211_CRDA_SUPPORT=3Dy
> # CONFIG_CFG80211_WEXT is not set
> CONFIG_MAC80211=3Dm
> CONFIG_MAC80211_HAS_RC=3Dy
> CONFIG_MAC80211_RC_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT_MINSTREL=3Dy
> CONFIG_MAC80211_RC_DEFAULT=3D"minstrel_ht"
> # CONFIG_MAC80211_MESH is not set
> CONFIG_MAC80211_LEDS=3Dy
> CONFIG_MAC80211_DEBUGFS=3Dy
> # CONFIG_MAC80211_MESSAGE_TRACING is not set
> # CONFIG_MAC80211_DEBUG_MENU is not set
> CONFIG_MAC80211_STA_HASH_MAX_SIZE=3D0
> CONFIG_RFKILL=3Dm
> CONFIG_RFKILL_LEDS=3Dy
> CONFIG_RFKILL_INPUT=3Dy
> # CONFIG_RFKILL_GPIO is not set
> CONFIG_NET_9P=3Dy
> CONFIG_NET_9P_VIRTIO=3Dy
> # CONFIG_NET_9P_DEBUG is not set
> # CONFIG_CAIF is not set
> CONFIG_CEPH_LIB=3Dm
> # CONFIG_CEPH_LIB_PRETTYDEBUG is not set
> CONFIG_CEPH_LIB_USE_DNS_RESOLVER=3Dy
> # CONFIG_NFC is not set
> CONFIG_PSAMPLE=3Dm
> # CONFIG_NET_IFE is not set
> CONFIG_LWTUNNEL=3Dy
> CONFIG_LWTUNNEL_BPF=3Dy
> CONFIG_DST_CACHE=3Dy
> CONFIG_GRO_CELLS=3Dy
> CONFIG_SOCK_VALIDATE_XMIT=3Dy
> CONFIG_NET_SELFTESTS=3Dy
> CONFIG_NET_SOCK_MSG=3Dy
> CONFIG_FAILOVER=3Dm
> CONFIG_ETHTOOL_NETLINK=3Dy
> =

> #
> # Device Drivers
> #
> CONFIG_HAVE_EISA=3Dy
> # CONFIG_EISA is not set
> CONFIG_HAVE_PCI=3Dy
> CONFIG_PCI=3Dy
> CONFIG_PCI_DOMAINS=3Dy
> CONFIG_PCIEPORTBUS=3Dy
> CONFIG_HOTPLUG_PCI_PCIE=3Dy
> CONFIG_PCIEAER=3Dy
> CONFIG_PCIEAER_INJECT=3Dm
> CONFIG_PCIE_ECRC=3Dy
> CONFIG_PCIEASPM=3Dy
> CONFIG_PCIEASPM_DEFAULT=3Dy
> # CONFIG_PCIEASPM_POWERSAVE is not set
> # CONFIG_PCIEASPM_POWER_SUPERSAVE is not set
> # CONFIG_PCIEASPM_PERFORMANCE is not set
> CONFIG_PCIE_PME=3Dy
> CONFIG_PCIE_DPC=3Dy
> # CONFIG_PCIE_PTM is not set
> # CONFIG_PCIE_EDR is not set
> CONFIG_PCI_MSI=3Dy
> CONFIG_PCI_MSI_IRQ_DOMAIN=3Dy
> CONFIG_PCI_QUIRKS=3Dy
> # CONFIG_PCI_DEBUG is not set
> # CONFIG_PCI_REALLOC_ENABLE_AUTO is not set
> CONFIG_PCI_STUB=3Dy
> CONFIG_PCI_PF_STUB=3Dm
> CONFIG_PCI_ATS=3Dy
> CONFIG_PCI_LOCKLESS_CONFIG=3Dy
> CONFIG_PCI_IOV=3Dy
> CONFIG_PCI_PRI=3Dy
> CONFIG_PCI_PASID=3Dy
> # CONFIG_PCI_P2PDMA is not set
> CONFIG_PCI_LABEL=3Dy
> CONFIG_PCI_HYPERV=3Dm
> CONFIG_HOTPLUG_PCI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI=3Dy
> CONFIG_HOTPLUG_PCI_ACPI_IBM=3Dm
> # CONFIG_HOTPLUG_PCI_CPCI is not set
> CONFIG_HOTPLUG_PCI_SHPC=3Dy
> =

> #
> # PCI controller drivers
> #
> CONFIG_VMD=3Dy
> CONFIG_PCI_HYPERV_INTERFACE=3Dm
> =

> #
> # DesignWare PCI Core Support
> #
> # CONFIG_PCIE_DW_PLAT_HOST is not set
> # CONFIG_PCI_MESON is not set
> # end of DesignWare PCI Core Support
> =

> #
> # Mobiveil PCIe Core Support
> #
> # end of Mobiveil PCIe Core Support
> =

> #
> # Cadence PCIe controllers support
> #
> # end of Cadence PCIe controllers support
> # end of PCI controller drivers
> =

> #
> # PCI Endpoint
> #
> # CONFIG_PCI_ENDPOINT is not set
> # end of PCI Endpoint
> =

> #
> # PCI switch controller drivers
> #
> # CONFIG_PCI_SW_SWITCHTEC is not set
> # end of PCI switch controller drivers
> =

> # CONFIG_CXL_BUS is not set
> # CONFIG_PCCARD is not set
> # CONFIG_RAPIDIO is not set
> =

> #
> # Generic Driver Options
> #
> CONFIG_AUXILIARY_BUS=3Dy
> # CONFIG_UEVENT_HELPER is not set
> CONFIG_DEVTMPFS=3Dy
> CONFIG_DEVTMPFS_MOUNT=3Dy
> CONFIG_STANDALONE=3Dy
> CONFIG_PREVENT_FIRMWARE_BUILD=3Dy
> =

> #
> # Firmware loader
> #
> CONFIG_FW_LOADER=3Dy
> CONFIG_FW_LOADER_PAGED_BUF=3Dy
> CONFIG_EXTRA_FIRMWARE=3D""
> CONFIG_FW_LOADER_USER_HELPER=3Dy
> # CONFIG_FW_LOADER_USER_HELPER_FALLBACK is not set
> # CONFIG_FW_LOADER_COMPRESS is not set
> CONFIG_FW_CACHE=3Dy
> # end of Firmware loader
> =

> CONFIG_ALLOW_DEV_COREDUMP=3Dy
> # CONFIG_DEBUG_DRIVER is not set
> # CONFIG_DEBUG_DEVRES is not set
> # CONFIG_DEBUG_TEST_DRIVER_REMOVE is not set
> # CONFIG_TEST_ASYNC_DRIVER_PROBE is not set
> CONFIG_GENERIC_CPU_AUTOPROBE=3Dy
> CONFIG_GENERIC_CPU_VULNERABILITIES=3Dy
> CONFIG_REGMAP=3Dy
> CONFIG_REGMAP_I2C=3Dm
> CONFIG_REGMAP_SPI=3Dm
> CONFIG_DMA_SHARED_BUFFER=3Dy
> # CONFIG_DMA_FENCE_TRACE is not set
> # end of Generic Driver Options
> =

> #
> # Bus devices
> #
> # CONFIG_MHI_BUS is not set
> # end of Bus devices
> =

> CONFIG_CONNECTOR=3Dy
> CONFIG_PROC_EVENTS=3Dy
> =

> #
> # Firmware Drivers
> #
> =

> #
> # ARM System Control and Management Interface Protocol
> #
> # end of ARM System Control and Management Interface Protocol
> =

> CONFIG_EDD=3Dm
> # CONFIG_EDD_OFF is not set
> CONFIG_FIRMWARE_MEMMAP=3Dy
> CONFIG_DMIID=3Dy
> CONFIG_DMI_SYSFS=3Dy
> CONFIG_DMI_SCAN_MACHINE_NON_EFI_FALLBACK=3Dy
> # CONFIG_ISCSI_IBFT is not set
> CONFIG_FW_CFG_SYSFS=3Dy
> # CONFIG_FW_CFG_SYSFS_CMDLINE is not set
> CONFIG_SYSFB=3Dy
> # CONFIG_SYSFB_SIMPLEFB is not set
> # CONFIG_GOOGLE_FIRMWARE is not set
> =

> #
> # EFI (Extensible Firmware Interface) Support
> #
> CONFIG_EFI_VARS=3Dy
> CONFIG_EFI_ESRT=3Dy
> CONFIG_EFI_VARS_PSTORE=3Dy
> CONFIG_EFI_VARS_PSTORE_DEFAULT_DISABLE=3Dy
> CONFIG_EFI_RUNTIME_MAP=3Dy
> # CONFIG_EFI_FAKE_MEMMAP is not set
> CONFIG_EFI_RUNTIME_WRAPPERS=3Dy
> CONFIG_EFI_GENERIC_STUB_INITRD_CMDLINE_LOADER=3Dy
> # CONFIG_EFI_BOOTLOADER_CONTROL is not set
> # CONFIG_EFI_CAPSULE_LOADER is not set
> # CONFIG_EFI_TEST is not set
> CONFIG_APPLE_PROPERTIES=3Dy
> # CONFIG_RESET_ATTACK_MITIGATION is not set
> # CONFIG_EFI_RCI2_TABLE is not set
> # CONFIG_EFI_DISABLE_PCI_DMA is not set
> # end of EFI (Extensible Firmware Interface) Support
> =

> CONFIG_UEFI_CPER=3Dy
> CONFIG_UEFI_CPER_X86=3Dy
> CONFIG_EFI_DEV_PATH_PARSER=3Dy
> CONFIG_EFI_EARLYCON=3Dy
> CONFIG_EFI_CUSTOM_SSDT_OVERLAYS=3Dy
> =

> #
> # Tegra firmware driver
> #
> # end of Tegra firmware driver
> # end of Firmware Drivers
> =

> # CONFIG_GNSS is not set
> # CONFIG_MTD is not set
> # CONFIG_OF is not set
> CONFIG_ARCH_MIGHT_HAVE_PC_PARPORT=3Dy
> CONFIG_PARPORT=3Dm
> CONFIG_PARPORT_PC=3Dm
> CONFIG_PARPORT_SERIAL=3Dm
> # CONFIG_PARPORT_PC_FIFO is not set
> # CONFIG_PARPORT_PC_SUPERIO is not set
> # CONFIG_PARPORT_AX88796 is not set
> CONFIG_PARPORT_1284=3Dy
> CONFIG_PNP=3Dy
> # CONFIG_PNP_DEBUG_MESSAGES is not set
> =

> #
> # Protocols
> #
> CONFIG_PNPACPI=3Dy
> CONFIG_BLK_DEV=3Dy
> CONFIG_BLK_DEV_NULL_BLK=3Dm
> # CONFIG_BLK_DEV_FD is not set
> CONFIG_CDROM=3Dm
> # CONFIG_PARIDE is not set
> # CONFIG_BLK_DEV_PCIESSD_MTIP32XX is not set
> # CONFIG_ZRAM is not set
> CONFIG_BLK_DEV_LOOP=3Dm
> CONFIG_BLK_DEV_LOOP_MIN_COUNT=3D0
> # CONFIG_BLK_DEV_DRBD is not set
> CONFIG_BLK_DEV_NBD=3Dm
> # CONFIG_BLK_DEV_SX8 is not set
> CONFIG_BLK_DEV_RAM=3Dm
> CONFIG_BLK_DEV_RAM_COUNT=3D16
> CONFIG_BLK_DEV_RAM_SIZE=3D16384
> CONFIG_CDROM_PKTCDVD=3Dm
> CONFIG_CDROM_PKTCDVD_BUFFERS=3D8
> # CONFIG_CDROM_PKTCDVD_WCACHE is not set
> # CONFIG_ATA_OVER_ETH is not set
> CONFIG_VIRTIO_BLK=3Dm
> CONFIG_BLK_DEV_RBD=3Dm
> # CONFIG_BLK_DEV_RSXX is not set
> =

> #
> # NVME Support
> #
> CONFIG_NVME_CORE=3Dm
> CONFIG_BLK_DEV_NVME=3Dm
> CONFIG_NVME_MULTIPATH=3Dy
> # CONFIG_NVME_HWMON is not set
> CONFIG_NVME_FABRICS=3Dm
> CONFIG_NVME_FC=3Dm
> # CONFIG_NVME_TCP is not set
> CONFIG_NVME_TARGET=3Dm
> # CONFIG_NVME_TARGET_PASSTHRU is not set
> CONFIG_NVME_TARGET_LOOP=3Dm
> CONFIG_NVME_TARGET_FC=3Dm
> CONFIG_NVME_TARGET_FCLOOP=3Dm
> # CONFIG_NVME_TARGET_TCP is not set
> # end of NVME Support
> =

> #
> # Misc devices
> #
> CONFIG_SENSORS_LIS3LV02D=3Dm
> # CONFIG_AD525X_DPOT is not set
> # CONFIG_DUMMY_IRQ is not set
> # CONFIG_IBM_ASM is not set
> # CONFIG_PHANTOM is not set
> CONFIG_TIFM_CORE=3Dm
> CONFIG_TIFM_7XX1=3Dm
> # CONFIG_ICS932S401 is not set
> CONFIG_ENCLOSURE_SERVICES=3Dm
> CONFIG_SGI_XP=3Dm
> CONFIG_HP_ILO=3Dm
> CONFIG_SGI_GRU=3Dm
> # CONFIG_SGI_GRU_DEBUG is not set
> CONFIG_APDS9802ALS=3Dm
> CONFIG_ISL29003=3Dm
> CONFIG_ISL29020=3Dm
> CONFIG_SENSORS_TSL2550=3Dm
> CONFIG_SENSORS_BH1770=3Dm
> CONFIG_SENSORS_APDS990X=3Dm
> # CONFIG_HMC6352 is not set
> # CONFIG_DS1682 is not set
> CONFIG_VMWARE_BALLOON=3Dm
> # CONFIG_LATTICE_ECP3_CONFIG is not set
> # CONFIG_SRAM is not set
> # CONFIG_DW_XDATA_PCIE is not set
> # CONFIG_PCI_ENDPOINT_TEST is not set
> # CONFIG_XILINX_SDFEC is not set
> CONFIG_MISC_RTSX=3Dm
> # CONFIG_C2PORT is not set
> =

> #
> # EEPROM support
> #
> # CONFIG_EEPROM_AT24 is not set
> # CONFIG_EEPROM_AT25 is not set
> CONFIG_EEPROM_LEGACY=3Dm
> CONFIG_EEPROM_MAX6875=3Dm
> CONFIG_EEPROM_93CX6=3Dm
> # CONFIG_EEPROM_93XX46 is not set
> # CONFIG_EEPROM_IDT_89HPESX is not set
> # CONFIG_EEPROM_EE1004 is not set
> # end of EEPROM support
> =

> CONFIG_CB710_CORE=3Dm
> # CONFIG_CB710_DEBUG is not set
> CONFIG_CB710_DEBUG_ASSUMPTIONS=3Dy
> =

> #
> # Texas Instruments shared transport line discipline
> #
> # CONFIG_TI_ST is not set
> # end of Texas Instruments shared transport line discipline
> =

> CONFIG_SENSORS_LIS3_I2C=3Dm
> CONFIG_ALTERA_STAPL=3Dm
> CONFIG_INTEL_MEI=3Dm
> CONFIG_INTEL_MEI_ME=3Dm
> # CONFIG_INTEL_MEI_TXE is not set
> # CONFIG_INTEL_MEI_HDCP is not set
> # CONFIG_INTEL_MEI_PXP is not set
> CONFIG_VMWARE_VMCI=3Dm
> # CONFIG_GENWQE is not set
> # CONFIG_ECHO is not set
> # CONFIG_BCM_VK is not set
> # CONFIG_MISC_ALCOR_PCI is not set
> CONFIG_MISC_RTSX_PCI=3Dm
> # CONFIG_MISC_RTSX_USB is not set
> # CONFIG_HABANA_AI is not set
> # CONFIG_UACCE is not set
> CONFIG_PVPANIC=3Dy
> # CONFIG_PVPANIC_MMIO is not set
> # CONFIG_PVPANIC_PCI is not set
> # end of Misc devices
> =

> #
> # SCSI device support
> #
> CONFIG_SCSI_MOD=3Dy
> CONFIG_RAID_ATTRS=3Dm
> CONFIG_SCSI_COMMON=3Dy
> CONFIG_SCSI=3Dy
> CONFIG_SCSI_DMA=3Dy
> CONFIG_SCSI_NETLINK=3Dy
> CONFIG_SCSI_PROC_FS=3Dy
> =

> #
> # SCSI support type (disk, tape, CD-ROM)
> #
> CONFIG_BLK_DEV_SD=3Dm
> CONFIG_CHR_DEV_ST=3Dm
> CONFIG_BLK_DEV_SR=3Dm
> CONFIG_CHR_DEV_SG=3Dm
> CONFIG_BLK_DEV_BSG=3Dy
> CONFIG_CHR_DEV_SCH=3Dm
> CONFIG_SCSI_ENCLOSURE=3Dm
> CONFIG_SCSI_CONSTANTS=3Dy
> CONFIG_SCSI_LOGGING=3Dy
> CONFIG_SCSI_SCAN_ASYNC=3Dy
> =

> #
> # SCSI Transports
> #
> CONFIG_SCSI_SPI_ATTRS=3Dm
> CONFIG_SCSI_FC_ATTRS=3Dm
> CONFIG_SCSI_ISCSI_ATTRS=3Dm
> CONFIG_SCSI_SAS_ATTRS=3Dm
> CONFIG_SCSI_SAS_LIBSAS=3Dm
> CONFIG_SCSI_SAS_ATA=3Dy
> CONFIG_SCSI_SAS_HOST_SMP=3Dy
> CONFIG_SCSI_SRP_ATTRS=3Dm
> # end of SCSI Transports
> =

> CONFIG_SCSI_LOWLEVEL=3Dy
> # CONFIG_ISCSI_TCP is not set
> # CONFIG_ISCSI_BOOT_SYSFS is not set
> # CONFIG_SCSI_CXGB3_ISCSI is not set
> # CONFIG_SCSI_CXGB4_ISCSI is not set
> # CONFIG_SCSI_BNX2_ISCSI is not set
> # CONFIG_BE2ISCSI is not set
> # CONFIG_BLK_DEV_3W_XXXX_RAID is not set
> # CONFIG_SCSI_HPSA is not set
> # CONFIG_SCSI_3W_9XXX is not set
> # CONFIG_SCSI_3W_SAS is not set
> # CONFIG_SCSI_ACARD is not set
> # CONFIG_SCSI_AACRAID is not set
> # CONFIG_SCSI_AIC7XXX is not set
> # CONFIG_SCSI_AIC79XX is not set
> # CONFIG_SCSI_AIC94XX is not set
> # CONFIG_SCSI_MVSAS is not set
> # CONFIG_SCSI_MVUMI is not set
> # CONFIG_SCSI_DPT_I2O is not set
> # CONFIG_SCSI_ADVANSYS is not set
> # CONFIG_SCSI_ARCMSR is not set
> # CONFIG_SCSI_ESAS2R is not set
> # CONFIG_MEGARAID_NEWGEN is not set
> # CONFIG_MEGARAID_LEGACY is not set
> # CONFIG_MEGARAID_SAS is not set
> CONFIG_SCSI_MPT3SAS=3Dm
> CONFIG_SCSI_MPT2SAS_MAX_SGE=3D128
> CONFIG_SCSI_MPT3SAS_MAX_SGE=3D128
> # CONFIG_SCSI_MPT2SAS is not set
> # CONFIG_SCSI_MPI3MR is not set
> # CONFIG_SCSI_SMARTPQI is not set
> # CONFIG_SCSI_UFSHCD is not set
> # CONFIG_SCSI_UFS_HWMON is not set
> # CONFIG_SCSI_HPTIOP is not set
> # CONFIG_SCSI_BUSLOGIC is not set
> # CONFIG_SCSI_MYRB is not set
> # CONFIG_SCSI_MYRS is not set
> # CONFIG_VMWARE_PVSCSI is not set
> CONFIG_HYPERV_STORAGE=3Dm
> # CONFIG_LIBFC is not set
> # CONFIG_SCSI_SNIC is not set
> # CONFIG_SCSI_DMX3191D is not set
> # CONFIG_SCSI_FDOMAIN_PCI is not set
> CONFIG_SCSI_ISCI=3Dm
> # CONFIG_SCSI_IPS is not set
> # CONFIG_SCSI_INITIO is not set
> # CONFIG_SCSI_INIA100 is not set
> # CONFIG_SCSI_PPA is not set
> # CONFIG_SCSI_IMM is not set
> # CONFIG_SCSI_STEX is not set
> # CONFIG_SCSI_SYM53C8XX_2 is not set
> # CONFIG_SCSI_IPR is not set
> # CONFIG_SCSI_QLOGIC_1280 is not set
> # CONFIG_SCSI_QLA_FC is not set
> # CONFIG_SCSI_QLA_ISCSI is not set
> # CONFIG_SCSI_LPFC is not set
> # CONFIG_SCSI_EFCT is not set
> # CONFIG_SCSI_DC395x is not set
> # CONFIG_SCSI_AM53C974 is not set
> # CONFIG_SCSI_WD719X is not set
> CONFIG_SCSI_DEBUG=3Dm
> # CONFIG_SCSI_PMCRAID is not set
> # CONFIG_SCSI_PM8001 is not set
> # CONFIG_SCSI_BFA_FC is not set
> # CONFIG_SCSI_VIRTIO is not set
> # CONFIG_SCSI_CHELSIO_FCOE is not set
> CONFIG_SCSI_DH=3Dy
> CONFIG_SCSI_DH_RDAC=3Dy
> CONFIG_SCSI_DH_HP_SW=3Dy
> CONFIG_SCSI_DH_EMC=3Dy
> CONFIG_SCSI_DH_ALUA=3Dy
> # end of SCSI device support
> =

> CONFIG_ATA=3Dm
> CONFIG_SATA_HOST=3Dy
> CONFIG_PATA_TIMINGS=3Dy
> CONFIG_ATA_VERBOSE_ERROR=3Dy
> CONFIG_ATA_FORCE=3Dy
> CONFIG_ATA_ACPI=3Dy
> # CONFIG_SATA_ZPODD is not set
> CONFIG_SATA_PMP=3Dy
> =

> #
> # Controllers with non-SFF native interface
> #
> CONFIG_SATA_AHCI=3Dm
> CONFIG_SATA_MOBILE_LPM_POLICY=3D0
> CONFIG_SATA_AHCI_PLATFORM=3Dm
> # CONFIG_SATA_INIC162X is not set
> # CONFIG_SATA_ACARD_AHCI is not set
> # CONFIG_SATA_SIL24 is not set
> CONFIG_ATA_SFF=3Dy
> =

> #
> # SFF controllers with custom DMA interface
> #
> # CONFIG_PDC_ADMA is not set
> # CONFIG_SATA_QSTOR is not set
> # CONFIG_SATA_SX4 is not set
> CONFIG_ATA_BMDMA=3Dy
> =

> #
> # SATA SFF controllers with BMDMA
> #
> CONFIG_ATA_PIIX=3Dm
> # CONFIG_SATA_DWC is not set
> # CONFIG_SATA_MV is not set
> # CONFIG_SATA_NV is not set
> # CONFIG_SATA_PROMISE is not set
> # CONFIG_SATA_SIL is not set
> # CONFIG_SATA_SIS is not set
> # CONFIG_SATA_SVW is not set
> # CONFIG_SATA_ULI is not set
> # CONFIG_SATA_VIA is not set
> # CONFIG_SATA_VITESSE is not set
> =

> #
> # PATA SFF controllers with BMDMA
> #
> # CONFIG_PATA_ALI is not set
> # CONFIG_PATA_AMD is not set
> # CONFIG_PATA_ARTOP is not set
> # CONFIG_PATA_ATIIXP is not set
> # CONFIG_PATA_ATP867X is not set
> # CONFIG_PATA_CMD64X is not set
> # CONFIG_PATA_CYPRESS is not set
> # CONFIG_PATA_EFAR is not set
> # CONFIG_PATA_HPT366 is not set
> # CONFIG_PATA_HPT37X is not set
> # CONFIG_PATA_HPT3X2N is not set
> # CONFIG_PATA_HPT3X3 is not set
> # CONFIG_PATA_IT8213 is not set
> # CONFIG_PATA_IT821X is not set
> # CONFIG_PATA_JMICRON is not set
> # CONFIG_PATA_MARVELL is not set
> # CONFIG_PATA_NETCELL is not set
> # CONFIG_PATA_NINJA32 is not set
> # CONFIG_PATA_NS87415 is not set
> # CONFIG_PATA_OLDPIIX is not set
> # CONFIG_PATA_OPTIDMA is not set
> # CONFIG_PATA_PDC2027X is not set
> # CONFIG_PATA_PDC_OLD is not set
> # CONFIG_PATA_RADISYS is not set
> # CONFIG_PATA_RDC is not set
> # CONFIG_PATA_SCH is not set
> # CONFIG_PATA_SERVERWORKS is not set
> # CONFIG_PATA_SIL680 is not set
> # CONFIG_PATA_SIS is not set
> # CONFIG_PATA_TOSHIBA is not set
> # CONFIG_PATA_TRIFLEX is not set
> # CONFIG_PATA_VIA is not set
> # CONFIG_PATA_WINBOND is not set
> =

> #
> # PIO-only SFF controllers
> #
> # CONFIG_PATA_CMD640_PCI is not set
> # CONFIG_PATA_MPIIX is not set
> # CONFIG_PATA_NS87410 is not set
> # CONFIG_PATA_OPTI is not set
> # CONFIG_PATA_RZ1000 is not set
> =

> #
> # Generic fallback / legacy drivers
> #
> # CONFIG_PATA_ACPI is not set
> CONFIG_ATA_GENERIC=3Dm
> # CONFIG_PATA_LEGACY is not set
> CONFIG_MD=3Dy
> CONFIG_BLK_DEV_MD=3Dy
> CONFIG_MD_AUTODETECT=3Dy
> CONFIG_MD_LINEAR=3Dm
> CONFIG_MD_RAID0=3Dm
> CONFIG_MD_RAID1=3Dm
> CONFIG_MD_RAID10=3Dm
> CONFIG_MD_RAID456=3Dm
> # CONFIG_MD_MULTIPATH is not set
> CONFIG_MD_FAULTY=3Dm
> CONFIG_MD_CLUSTER=3Dm
> # CONFIG_BCACHE is not set
> CONFIG_BLK_DEV_DM_BUILTIN=3Dy
> CONFIG_BLK_DEV_DM=3Dm
> CONFIG_DM_DEBUG=3Dy
> CONFIG_DM_BUFIO=3Dm
> # CONFIG_DM_DEBUG_BLOCK_MANAGER_LOCKING is not set
> CONFIG_DM_BIO_PRISON=3Dm
> CONFIG_DM_PERSISTENT_DATA=3Dm
> # CONFIG_DM_UNSTRIPED is not set
> CONFIG_DM_CRYPT=3Dm
> CONFIG_DM_SNAPSHOT=3Dm
> CONFIG_DM_THIN_PROVISIONING=3Dm
> CONFIG_DM_CACHE=3Dm
> CONFIG_DM_CACHE_SMQ=3Dm
> CONFIG_DM_WRITECACHE=3Dm
> # CONFIG_DM_EBS is not set
> CONFIG_DM_ERA=3Dm
> # CONFIG_DM_CLONE is not set
> CONFIG_DM_MIRROR=3Dm
> CONFIG_DM_LOG_USERSPACE=3Dm
> CONFIG_DM_RAID=3Dm
> CONFIG_DM_ZERO=3Dm
> CONFIG_DM_MULTIPATH=3Dm
> CONFIG_DM_MULTIPATH_QL=3Dm
> CONFIG_DM_MULTIPATH_ST=3Dm
> # CONFIG_DM_MULTIPATH_HST is not set
> # CONFIG_DM_MULTIPATH_IOA is not set
> CONFIG_DM_DELAY=3Dm
> # CONFIG_DM_DUST is not set
> CONFIG_DM_UEVENT=3Dy
> CONFIG_DM_FLAKEY=3Dm
> CONFIG_DM_VERITY=3Dm
> # CONFIG_DM_VERITY_VERIFY_ROOTHASH_SIG is not set
> # CONFIG_DM_VERITY_FEC is not set
> CONFIG_DM_SWITCH=3Dm
> CONFIG_DM_LOG_WRITES=3Dm
> CONFIG_DM_INTEGRITY=3Dm
> CONFIG_DM_AUDIT=3Dy
> CONFIG_TARGET_CORE=3Dm
> CONFIG_TCM_IBLOCK=3Dm
> CONFIG_TCM_FILEIO=3Dm
> CONFIG_TCM_PSCSI=3Dm
> CONFIG_TCM_USER2=3Dm
> CONFIG_LOOPBACK_TARGET=3Dm
> CONFIG_ISCSI_TARGET=3Dm
> # CONFIG_SBP_TARGET is not set
> # CONFIG_FUSION is not set
> =

> #
> # IEEE 1394 (FireWire) support
> #
> CONFIG_FIREWIRE=3Dm
> CONFIG_FIREWIRE_OHCI=3Dm
> CONFIG_FIREWIRE_SBP2=3Dm
> CONFIG_FIREWIRE_NET=3Dm
> # CONFIG_FIREWIRE_NOSY is not set
> # end of IEEE 1394 (FireWire) support
> =

> CONFIG_MACINTOSH_DRIVERS=3Dy
> CONFIG_MAC_EMUMOUSEBTN=3Dy
> CONFIG_NETDEVICES=3Dy
> CONFIG_MII=3Dy
> CONFIG_NET_CORE=3Dy
> # CONFIG_BONDING is not set
> # CONFIG_DUMMY is not set
> # CONFIG_WIREGUARD is not set
> # CONFIG_EQUALIZER is not set
> # CONFIG_NET_FC is not set
> # CONFIG_IFB is not set
> # CONFIG_NET_TEAM is not set
> # CONFIG_MACVLAN is not set
> # CONFIG_IPVLAN is not set
> # CONFIG_VXLAN is not set
> # CONFIG_GENEVE is not set
> # CONFIG_BAREUDP is not set
> # CONFIG_GTP is not set
> # CONFIG_AMT is not set
> # CONFIG_MACSEC is not set
> CONFIG_NETCONSOLE=3Dm
> CONFIG_NETCONSOLE_DYNAMIC=3Dy
> CONFIG_NETPOLL=3Dy
> CONFIG_NET_POLL_CONTROLLER=3Dy
> CONFIG_TUN=3Dm
> # CONFIG_TUN_VNET_CROSS_LE is not set
> # CONFIG_VETH is not set
> CONFIG_VIRTIO_NET=3Dm
> # CONFIG_NLMON is not set
> # CONFIG_NET_VRF is not set
> # CONFIG_VSOCKMON is not set
> # CONFIG_ARCNET is not set
> CONFIG_ATM_DRIVERS=3Dy
> # CONFIG_ATM_DUMMY is not set
> # CONFIG_ATM_TCP is not set
> # CONFIG_ATM_LANAI is not set
> # CONFIG_ATM_ENI is not set
> # CONFIG_ATM_FIRESTREAM is not set
> # CONFIG_ATM_ZATM is not set
> # CONFIG_ATM_NICSTAR is not set
> # CONFIG_ATM_IDT77252 is not set
> # CONFIG_ATM_AMBASSADOR is not set
> # CONFIG_ATM_HORIZON is not set
> # CONFIG_ATM_IA is not set
> # CONFIG_ATM_FORE200E is not set
> # CONFIG_ATM_HE is not set
> # CONFIG_ATM_SOLOS is not set
> CONFIG_ETHERNET=3Dy
> CONFIG_MDIO=3Dy
> # CONFIG_NET_VENDOR_3COM is not set
> CONFIG_NET_VENDOR_ADAPTEC=3Dy
> # CONFIG_ADAPTEC_STARFIRE is not set
> CONFIG_NET_VENDOR_AGERE=3Dy
> # CONFIG_ET131X is not set
> CONFIG_NET_VENDOR_ALACRITECH=3Dy
> # CONFIG_SLICOSS is not set
> CONFIG_NET_VENDOR_ALTEON=3Dy
> # CONFIG_ACENIC is not set
> # CONFIG_ALTERA_TSE is not set
> CONFIG_NET_VENDOR_AMAZON=3Dy
> # CONFIG_ENA_ETHERNET is not set
> CONFIG_NET_VENDOR_AMD=3Dy
> # CONFIG_AMD8111_ETH is not set
> # CONFIG_PCNET32 is not set
> # CONFIG_AMD_XGBE is not set
> CONFIG_NET_VENDOR_AQUANTIA=3Dy
> # CONFIG_AQTION is not set
> CONFIG_NET_VENDOR_ARC=3Dy
> CONFIG_NET_VENDOR_ASIX=3Dy
> # CONFIG_SPI_AX88796C is not set
> CONFIG_NET_VENDOR_ATHEROS=3Dy
> # CONFIG_ATL2 is not set
> # CONFIG_ATL1 is not set
> # CONFIG_ATL1E is not set
> # CONFIG_ATL1C is not set
> # CONFIG_ALX is not set
> CONFIG_NET_VENDOR_BROADCOM=3Dy
> # CONFIG_B44 is not set
> # CONFIG_BCMGENET is not set
> # CONFIG_BNX2 is not set
> # CONFIG_CNIC is not set
> # CONFIG_TIGON3 is not set
> # CONFIG_BNX2X is not set
> # CONFIG_SYSTEMPORT is not set
> # CONFIG_BNXT is not set
> CONFIG_NET_VENDOR_BROCADE=3Dy
> # CONFIG_BNA is not set
> CONFIG_NET_VENDOR_CADENCE=3Dy
> # CONFIG_MACB is not set
> CONFIG_NET_VENDOR_CAVIUM=3Dy
> # CONFIG_THUNDER_NIC_PF is not set
> # CONFIG_THUNDER_NIC_VF is not set
> # CONFIG_THUNDER_NIC_BGX is not set
> # CONFIG_THUNDER_NIC_RGX is not set
> CONFIG_CAVIUM_PTP=3Dy
> # CONFIG_LIQUIDIO is not set
> # CONFIG_LIQUIDIO_VF is not set
> CONFIG_NET_VENDOR_CHELSIO=3Dy
> # CONFIG_CHELSIO_T1 is not set
> # CONFIG_CHELSIO_T3 is not set
> # CONFIG_CHELSIO_T4 is not set
> # CONFIG_CHELSIO_T4VF is not set
> CONFIG_NET_VENDOR_CISCO=3Dy
> # CONFIG_ENIC is not set
> CONFIG_NET_VENDOR_CORTINA=3Dy
> # CONFIG_CX_ECAT is not set
> # CONFIG_DNET is not set
> CONFIG_NET_VENDOR_DEC=3Dy
> # CONFIG_NET_TULIP is not set
> CONFIG_NET_VENDOR_DLINK=3Dy
> # CONFIG_DL2K is not set
> # CONFIG_SUNDANCE is not set
> CONFIG_NET_VENDOR_EMULEX=3Dy
> # CONFIG_BE2NET is not set
> CONFIG_NET_VENDOR_EZCHIP=3Dy
> CONFIG_NET_VENDOR_GOOGLE=3Dy
> # CONFIG_GVE is not set
> CONFIG_NET_VENDOR_HUAWEI=3Dy
> # CONFIG_HINIC is not set
> CONFIG_NET_VENDOR_I825XX=3Dy
> CONFIG_NET_VENDOR_INTEL=3Dy
> # CONFIG_E100 is not set
> CONFIG_E1000=3Dy
> CONFIG_E1000E=3Dy
> CONFIG_E1000E_HWTS=3Dy
> CONFIG_IGB=3Dy
> CONFIG_IGB_HWMON=3Dy
> # CONFIG_IGBVF is not set
> # CONFIG_IXGB is not set
> CONFIG_IXGBE=3Dy
> CONFIG_IXGBE_HWMON=3Dy
> # CONFIG_IXGBE_DCB is not set
> CONFIG_IXGBE_IPSEC=3Dy
> # CONFIG_IXGBEVF is not set
> CONFIG_I40E=3Dy
> # CONFIG_I40E_DCB is not set
> # CONFIG_I40EVF is not set
> # CONFIG_ICE is not set
> # CONFIG_FM10K is not set
> CONFIG_IGC=3Dy
> CONFIG_NET_VENDOR_MICROSOFT=3Dy
> # CONFIG_MICROSOFT_MANA is not set
> # CONFIG_JME is not set
> CONFIG_NET_VENDOR_LITEX=3Dy
> CONFIG_NET_VENDOR_MARVELL=3Dy
> # CONFIG_MVMDIO is not set
> # CONFIG_SKGE is not set
> # CONFIG_SKY2 is not set
> # CONFIG_PRESTERA is not set
> CONFIG_NET_VENDOR_MELLANOX=3Dy
> # CONFIG_MLX4_EN is not set
> # CONFIG_MLX5_CORE is not set
> # CONFIG_MLXSW_CORE is not set
> # CONFIG_MLXFW is not set
> CONFIG_NET_VENDOR_MICREL=3Dy
> # CONFIG_KS8842 is not set
> # CONFIG_KS8851 is not set
> # CONFIG_KS8851_MLL is not set
> # CONFIG_KSZ884X_PCI is not set
> CONFIG_NET_VENDOR_MICROCHIP=3Dy
> # CONFIG_ENC28J60 is not set
> # CONFIG_ENCX24J600 is not set
> # CONFIG_LAN743X is not set
> CONFIG_NET_VENDOR_MICROSEMI=3Dy
> CONFIG_NET_VENDOR_MYRI=3Dy
> # CONFIG_MYRI10GE is not set
> # CONFIG_FEALNX is not set
> CONFIG_NET_VENDOR_NATSEMI=3Dy
> # CONFIG_NATSEMI is not set
> # CONFIG_NS83820 is not set
> CONFIG_NET_VENDOR_NETERION=3Dy
> # CONFIG_S2IO is not set
> # CONFIG_VXGE is not set
> CONFIG_NET_VENDOR_NETRONOME=3Dy
> # CONFIG_NFP is not set
> CONFIG_NET_VENDOR_NI=3Dy
> # CONFIG_NI_XGE_MANAGEMENT_ENET is not set
> CONFIG_NET_VENDOR_8390=3Dy
> # CONFIG_NE2K_PCI is not set
> CONFIG_NET_VENDOR_NVIDIA=3Dy
> # CONFIG_FORCEDETH is not set
> CONFIG_NET_VENDOR_OKI=3Dy
> # CONFIG_ETHOC is not set
> CONFIG_NET_VENDOR_PACKET_ENGINES=3Dy
> # CONFIG_HAMACHI is not set
> # CONFIG_YELLOWFIN is not set
> CONFIG_NET_VENDOR_PENSANDO=3Dy
> # CONFIG_IONIC is not set
> CONFIG_NET_VENDOR_QLOGIC=3Dy
> # CONFIG_QLA3XXX is not set
> # CONFIG_QLCNIC is not set
> # CONFIG_NETXEN_NIC is not set
> # CONFIG_QED is not set
> CONFIG_NET_VENDOR_QUALCOMM=3Dy
> # CONFIG_QCOM_EMAC is not set
> # CONFIG_RMNET is not set
> CONFIG_NET_VENDOR_RDC=3Dy
> # CONFIG_R6040 is not set
> CONFIG_NET_VENDOR_REALTEK=3Dy
> # CONFIG_ATP is not set
> # CONFIG_8139CP is not set
> # CONFIG_8139TOO is not set
> CONFIG_R8169=3Dy
> CONFIG_NET_VENDOR_RENESAS=3Dy
> CONFIG_NET_VENDOR_ROCKER=3Dy
> # CONFIG_ROCKER is not set
> CONFIG_NET_VENDOR_SAMSUNG=3Dy
> # CONFIG_SXGBE_ETH is not set
> CONFIG_NET_VENDOR_SEEQ=3Dy
> CONFIG_NET_VENDOR_SOLARFLARE=3Dy
> # CONFIG_SFC is not set
> # CONFIG_SFC_FALCON is not set
> CONFIG_NET_VENDOR_SILAN=3Dy
> # CONFIG_SC92031 is not set
> CONFIG_NET_VENDOR_SIS=3Dy
> # CONFIG_SIS900 is not set
> # CONFIG_SIS190 is not set
> CONFIG_NET_VENDOR_SMSC=3Dy
> # CONFIG_EPIC100 is not set
> # CONFIG_SMSC911X is not set
> # CONFIG_SMSC9420 is not set
> CONFIG_NET_VENDOR_SOCIONEXT=3Dy
> CONFIG_NET_VENDOR_STMICRO=3Dy
> # CONFIG_STMMAC_ETH is not set
> CONFIG_NET_VENDOR_SUN=3Dy
> # CONFIG_HAPPYMEAL is not set
> # CONFIG_SUNGEM is not set
> # CONFIG_CASSINI is not set
> # CONFIG_NIU is not set
> CONFIG_NET_VENDOR_SYNOPSYS=3Dy
> # CONFIG_DWC_XLGMAC is not set
> CONFIG_NET_VENDOR_TEHUTI=3Dy
> # CONFIG_TEHUTI is not set
> CONFIG_NET_VENDOR_TI=3Dy
> # CONFIG_TI_CPSW_PHY_SEL is not set
> # CONFIG_TLAN is not set
> CONFIG_NET_VENDOR_VIA=3Dy
> # CONFIG_VIA_RHINE is not set
> # CONFIG_VIA_VELOCITY is not set
> CONFIG_NET_VENDOR_WIZNET=3Dy
> # CONFIG_WIZNET_W5100 is not set
> # CONFIG_WIZNET_W5300 is not set
> CONFIG_NET_VENDOR_XILINX=3Dy
> # CONFIG_XILINX_EMACLITE is not set
> # CONFIG_XILINX_AXI_EMAC is not set
> # CONFIG_XILINX_LL_TEMAC is not set
> # CONFIG_FDDI is not set
> # CONFIG_HIPPI is not set
> # CONFIG_NET_SB1000 is not set
> CONFIG_PHYLIB=3Dy
> CONFIG_SWPHY=3Dy
> # CONFIG_LED_TRIGGER_PHY is not set
> CONFIG_FIXED_PHY=3Dy
> =

> #
> # MII PHY device drivers
> #
> # CONFIG_AMD_PHY is not set
> # CONFIG_ADIN_PHY is not set
> # CONFIG_AQUANTIA_PHY is not set
> CONFIG_AX88796B_PHY=3Dy
> # CONFIG_BROADCOM_PHY is not set
> # CONFIG_BCM54140_PHY is not set
> # CONFIG_BCM7XXX_PHY is not set
> # CONFIG_BCM84881_PHY is not set
> # CONFIG_BCM87XX_PHY is not set
> # CONFIG_CICADA_PHY is not set
> # CONFIG_CORTINA_PHY is not set
> # CONFIG_DAVICOM_PHY is not set
> # CONFIG_ICPLUS_PHY is not set
> # CONFIG_LXT_PHY is not set
> # CONFIG_INTEL_XWAY_PHY is not set
> # CONFIG_LSI_ET1011C_PHY is not set
> # CONFIG_MARVELL_PHY is not set
> # CONFIG_MARVELL_10G_PHY is not set
> # CONFIG_MARVELL_88X2222_PHY is not set
> # CONFIG_MAXLINEAR_GPHY is not set
> # CONFIG_MEDIATEK_GE_PHY is not set
> # CONFIG_MICREL_PHY is not set
> # CONFIG_MICROCHIP_PHY is not set
> # CONFIG_MICROCHIP_T1_PHY is not set
> # CONFIG_MICROSEMI_PHY is not set
> # CONFIG_MOTORCOMM_PHY is not set
> # CONFIG_NATIONAL_PHY is not set
> # CONFIG_NXP_C45_TJA11XX_PHY is not set
> # CONFIG_NXP_TJA11XX_PHY is not set
> # CONFIG_QSEMI_PHY is not set
> CONFIG_REALTEK_PHY=3Dy
> # CONFIG_RENESAS_PHY is not set
> # CONFIG_ROCKCHIP_PHY is not set
> # CONFIG_SMSC_PHY is not set
> # CONFIG_STE10XP is not set
> # CONFIG_TERANETICS_PHY is not set
> # CONFIG_DP83822_PHY is not set
> # CONFIG_DP83TC811_PHY is not set
> # CONFIG_DP83848_PHY is not set
> # CONFIG_DP83867_PHY is not set
> # CONFIG_DP83869_PHY is not set
> # CONFIG_VITESSE_PHY is not set
> # CONFIG_XILINX_GMII2RGMII is not set
> # CONFIG_MICREL_KS8995MA is not set
> CONFIG_MDIO_DEVICE=3Dy
> CONFIG_MDIO_BUS=3Dy
> CONFIG_FWNODE_MDIO=3Dy
> CONFIG_ACPI_MDIO=3Dy
> CONFIG_MDIO_DEVRES=3Dy
> # CONFIG_MDIO_BITBANG is not set
> # CONFIG_MDIO_BCM_UNIMAC is not set
> # CONFIG_MDIO_MVUSB is not set
> # CONFIG_MDIO_MSCC_MIIM is not set
> # CONFIG_MDIO_THUNDER is not set
> =

> #
> # MDIO Multiplexers
> #
> =

> #
> # PCS device drivers
> #
> # CONFIG_PCS_XPCS is not set
> # end of PCS device drivers
> =

> # CONFIG_PLIP is not set
> # CONFIG_PPP is not set
> # CONFIG_SLIP is not set
> CONFIG_USB_NET_DRIVERS=3Dy
> # CONFIG_USB_CATC is not set
> # CONFIG_USB_KAWETH is not set
> # CONFIG_USB_PEGASUS is not set
> # CONFIG_USB_RTL8150 is not set
> CONFIG_USB_RTL8152=3Dy
> # CONFIG_USB_LAN78XX is not set
> CONFIG_USB_USBNET=3Dy
> CONFIG_USB_NET_AX8817X=3Dy
> CONFIG_USB_NET_AX88179_178A=3Dy
> # CONFIG_USB_NET_CDCETHER is not set
> # CONFIG_USB_NET_CDC_EEM is not set
> # CONFIG_USB_NET_CDC_NCM is not set
> # CONFIG_USB_NET_HUAWEI_CDC_NCM is not set
> # CONFIG_USB_NET_CDC_MBIM is not set
> # CONFIG_USB_NET_DM9601 is not set
> # CONFIG_USB_NET_SR9700 is not set
> # CONFIG_USB_NET_SR9800 is not set
> # CONFIG_USB_NET_SMSC75XX is not set
> # CONFIG_USB_NET_SMSC95XX is not set
> # CONFIG_USB_NET_GL620A is not set
> # CONFIG_USB_NET_NET1080 is not set
> # CONFIG_USB_NET_PLUSB is not set
> # CONFIG_USB_NET_MCS7830 is not set
> # CONFIG_USB_NET_RNDIS_HOST is not set
> # CONFIG_USB_NET_CDC_SUBSET is not set
> # CONFIG_USB_NET_ZAURUS is not set
> # CONFIG_USB_NET_CX82310_ETH is not set
> # CONFIG_USB_NET_KALMIA is not set
> # CONFIG_USB_NET_QMI_WWAN is not set
> # CONFIG_USB_HSO is not set
> # CONFIG_USB_NET_INT51X1 is not set
> # CONFIG_USB_IPHETH is not set
> # CONFIG_USB_SIERRA_NET is not set
> # CONFIG_USB_NET_CH9200 is not set
> # CONFIG_USB_NET_AQC111 is not set
> CONFIG_WLAN=3Dy
> CONFIG_WLAN_VENDOR_ADMTEK=3Dy
> # CONFIG_ADM8211 is not set
> CONFIG_WLAN_VENDOR_ATH=3Dy
> # CONFIG_ATH_DEBUG is not set
> # CONFIG_ATH5K is not set
> # CONFIG_ATH5K_PCI is not set
> # CONFIG_ATH9K is not set
> # CONFIG_ATH9K_HTC is not set
> # CONFIG_CARL9170 is not set
> # CONFIG_ATH6KL is not set
> # CONFIG_AR5523 is not set
> # CONFIG_WIL6210 is not set
> # CONFIG_ATH10K is not set
> # CONFIG_WCN36XX is not set
> # CONFIG_ATH11K is not set
> CONFIG_WLAN_VENDOR_ATMEL=3Dy
> # CONFIG_ATMEL is not set
> # CONFIG_AT76C50X_USB is not set
> CONFIG_WLAN_VENDOR_BROADCOM=3Dy
> # CONFIG_B43 is not set
> # CONFIG_B43LEGACY is not set
> # CONFIG_BRCMSMAC is not set
> # CONFIG_BRCMFMAC is not set
> CONFIG_WLAN_VENDOR_CISCO=3Dy
> # CONFIG_AIRO is not set
> CONFIG_WLAN_VENDOR_INTEL=3Dy
> # CONFIG_IPW2100 is not set
> # CONFIG_IPW2200 is not set
> # CONFIG_IWL4965 is not set
> # CONFIG_IWL3945 is not set
> # CONFIG_IWLWIFI is not set
> CONFIG_WLAN_VENDOR_INTERSIL=3Dy
> # CONFIG_HOSTAP is not set
> # CONFIG_HERMES is not set
> # CONFIG_P54_COMMON is not set
> CONFIG_WLAN_VENDOR_MARVELL=3Dy
> # CONFIG_LIBERTAS is not set
> # CONFIG_LIBERTAS_THINFIRM is not set
> # CONFIG_MWIFIEX is not set
> # CONFIG_MWL8K is not set
> # CONFIG_WLAN_VENDOR_MEDIATEK is not set
> CONFIG_WLAN_VENDOR_MICROCHIP=3Dy
> # CONFIG_WILC1000_SDIO is not set
> # CONFIG_WILC1000_SPI is not set
> CONFIG_WLAN_VENDOR_RALINK=3Dy
> # CONFIG_RT2X00 is not set
> CONFIG_WLAN_VENDOR_REALTEK=3Dy
> # CONFIG_RTL8180 is not set
> # CONFIG_RTL8187 is not set
> CONFIG_RTL_CARDS=3Dm
> # CONFIG_RTL8192CE is not set
> # CONFIG_RTL8192SE is not set
> # CONFIG_RTL8192DE is not set
> # CONFIG_RTL8723AE is not set
> # CONFIG_RTL8723BE is not set
> # CONFIG_RTL8188EE is not set
> # CONFIG_RTL8192EE is not set
> # CONFIG_RTL8821AE is not set
> # CONFIG_RTL8192CU is not set
> # CONFIG_RTL8XXXU is not set
> # CONFIG_RTW88 is not set
> # CONFIG_RTW89 is not set
> CONFIG_WLAN_VENDOR_RSI=3Dy
> # CONFIG_RSI_91X is not set
> CONFIG_WLAN_VENDOR_ST=3Dy
> # CONFIG_CW1200 is not set
> CONFIG_WLAN_VENDOR_TI=3Dy
> # CONFIG_WL1251 is not set
> # CONFIG_WL12XX is not set
> # CONFIG_WL18XX is not set
> # CONFIG_WLCORE is not set
> CONFIG_WLAN_VENDOR_ZYDAS=3Dy
> # CONFIG_USB_ZD1201 is not set
> # CONFIG_ZD1211RW is not set
> CONFIG_WLAN_VENDOR_QUANTENNA=3Dy
> # CONFIG_QTNFMAC_PCIE is not set
> # CONFIG_MAC80211_HWSIM is not set
> # CONFIG_USB_NET_RNDIS_WLAN is not set
> # CONFIG_VIRT_WIFI is not set
> # CONFIG_WAN is not set
> CONFIG_IEEE802154_DRIVERS=3Dm
> # CONFIG_IEEE802154_FAKELB is not set
> # CONFIG_IEEE802154_AT86RF230 is not set
> # CONFIG_IEEE802154_MRF24J40 is not set
> # CONFIG_IEEE802154_CC2520 is not set
> # CONFIG_IEEE802154_ATUSB is not set
> # CONFIG_IEEE802154_ADF7242 is not set
> # CONFIG_IEEE802154_CA8210 is not set
> # CONFIG_IEEE802154_MCR20A is not set
> # CONFIG_IEEE802154_HWSIM is not set
> =

> #
> # Wireless WAN
> #
> # CONFIG_WWAN is not set
> # end of Wireless WAN
> =

> # CONFIG_VMXNET3 is not set
> # CONFIG_FUJITSU_ES is not set
> # CONFIG_HYPERV_NET is not set
> # CONFIG_NETDEVSIM is not set
> CONFIG_NET_FAILOVER=3Dm
> # CONFIG_ISDN is not set
> =

> #
> # Input device support
> #
> CONFIG_INPUT=3Dy
> CONFIG_INPUT_LEDS=3Dy
> CONFIG_INPUT_FF_MEMLESS=3Dm
> CONFIG_INPUT_SPARSEKMAP=3Dm
> # CONFIG_INPUT_MATRIXKMAP is not set
> =

> #
> # Userland interfaces
> #
> CONFIG_INPUT_MOUSEDEV=3Dy
> # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
> CONFIG_INPUT_MOUSEDEV_SCREEN_X=3D1024
> CONFIG_INPUT_MOUSEDEV_SCREEN_Y=3D768
> CONFIG_INPUT_JOYDEV=3Dm
> CONFIG_INPUT_EVDEV=3Dy
> # CONFIG_INPUT_EVBUG is not set
> =

> #
> # Input Device Drivers
> #
> CONFIG_INPUT_KEYBOARD=3Dy
> # CONFIG_KEYBOARD_ADP5588 is not set
> # CONFIG_KEYBOARD_ADP5589 is not set
> # CONFIG_KEYBOARD_APPLESPI is not set
> CONFIG_KEYBOARD_ATKBD=3Dy
> # CONFIG_KEYBOARD_QT1050 is not set
> # CONFIG_KEYBOARD_QT1070 is not set
> # CONFIG_KEYBOARD_QT2160 is not set
> # CONFIG_KEYBOARD_DLINK_DIR685 is not set
> # CONFIG_KEYBOARD_LKKBD is not set
> # CONFIG_KEYBOARD_GPIO is not set
> # CONFIG_KEYBOARD_GPIO_POLLED is not set
> # CONFIG_KEYBOARD_TCA6416 is not set
> # CONFIG_KEYBOARD_TCA8418 is not set
> # CONFIG_KEYBOARD_MATRIX is not set
> # CONFIG_KEYBOARD_LM8323 is not set
> # CONFIG_KEYBOARD_LM8333 is not set
> # CONFIG_KEYBOARD_MAX7359 is not set
> # CONFIG_KEYBOARD_MCS is not set
> # CONFIG_KEYBOARD_MPR121 is not set
> # CONFIG_KEYBOARD_NEWTON is not set
> # CONFIG_KEYBOARD_OPENCORES is not set
> # CONFIG_KEYBOARD_SAMSUNG is not set
> # CONFIG_KEYBOARD_STOWAWAY is not set
> # CONFIG_KEYBOARD_SUNKBD is not set
> # CONFIG_KEYBOARD_TM2_TOUCHKEY is not set
> # CONFIG_KEYBOARD_XTKBD is not set
> # CONFIG_KEYBOARD_CYPRESS_SF is not set
> CONFIG_INPUT_MOUSE=3Dy
> CONFIG_MOUSE_PS2=3Dy
> CONFIG_MOUSE_PS2_ALPS=3Dy
> CONFIG_MOUSE_PS2_BYD=3Dy
> CONFIG_MOUSE_PS2_LOGIPS2PP=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS=3Dy
> CONFIG_MOUSE_PS2_SYNAPTICS_SMBUS=3Dy
> CONFIG_MOUSE_PS2_CYPRESS=3Dy
> CONFIG_MOUSE_PS2_LIFEBOOK=3Dy
> CONFIG_MOUSE_PS2_TRACKPOINT=3Dy
> CONFIG_MOUSE_PS2_ELANTECH=3Dy
> CONFIG_MOUSE_PS2_ELANTECH_SMBUS=3Dy
> CONFIG_MOUSE_PS2_SENTELIC=3Dy
> # CONFIG_MOUSE_PS2_TOUCHKIT is not set
> CONFIG_MOUSE_PS2_FOCALTECH=3Dy
> CONFIG_MOUSE_PS2_VMMOUSE=3Dy
> CONFIG_MOUSE_PS2_SMBUS=3Dy
> CONFIG_MOUSE_SERIAL=3Dm
> # CONFIG_MOUSE_APPLETOUCH is not set
> # CONFIG_MOUSE_BCM5974 is not set
> CONFIG_MOUSE_CYAPA=3Dm
> CONFIG_MOUSE_ELAN_I2C=3Dm
> CONFIG_MOUSE_ELAN_I2C_I2C=3Dy
> CONFIG_MOUSE_ELAN_I2C_SMBUS=3Dy
> CONFIG_MOUSE_VSXXXAA=3Dm
> # CONFIG_MOUSE_GPIO is not set
> CONFIG_MOUSE_SYNAPTICS_I2C=3Dm
> # CONFIG_MOUSE_SYNAPTICS_USB is not set
> # CONFIG_INPUT_JOYSTICK is not set
> # CONFIG_INPUT_TABLET is not set
> # CONFIG_INPUT_TOUCHSCREEN is not set
> # CONFIG_INPUT_MISC is not set
> CONFIG_RMI4_CORE=3Dm
> CONFIG_RMI4_I2C=3Dm
> CONFIG_RMI4_SPI=3Dm
> CONFIG_RMI4_SMB=3Dm
> CONFIG_RMI4_F03=3Dy
> CONFIG_RMI4_F03_SERIO=3Dm
> CONFIG_RMI4_2D_SENSOR=3Dy
> CONFIG_RMI4_F11=3Dy
> CONFIG_RMI4_F12=3Dy
> CONFIG_RMI4_F30=3Dy
> CONFIG_RMI4_F34=3Dy
> # CONFIG_RMI4_F3A is not set
> # CONFIG_RMI4_F54 is not set
> CONFIG_RMI4_F55=3Dy
> =

> #
> # Hardware I/O ports
> #
> CONFIG_SERIO=3Dy
> CONFIG_ARCH_MIGHT_HAVE_PC_SERIO=3Dy
> CONFIG_SERIO_I8042=3Dy
> CONFIG_SERIO_SERPORT=3Dy
> # CONFIG_SERIO_CT82C710 is not set
> # CONFIG_SERIO_PARKBD is not set
> # CONFIG_SERIO_PCIPS2 is not set
> CONFIG_SERIO_LIBPS2=3Dy
> CONFIG_SERIO_RAW=3Dm
> CONFIG_SERIO_ALTERA_PS2=3Dm
> # CONFIG_SERIO_PS2MULT is not set
> CONFIG_SERIO_ARC_PS2=3Dm
> CONFIG_HYPERV_KEYBOARD=3Dm
> # CONFIG_SERIO_GPIO_PS2 is not set
> # CONFIG_USERIO is not set
> # CONFIG_GAMEPORT is not set
> # end of Hardware I/O ports
> # end of Input device support
> =

> #
> # Character devices
> #
> CONFIG_TTY=3Dy
> CONFIG_VT=3Dy
> CONFIG_CONSOLE_TRANSLATIONS=3Dy
> CONFIG_VT_CONSOLE=3Dy
> CONFIG_VT_CONSOLE_SLEEP=3Dy
> CONFIG_HW_CONSOLE=3Dy
> CONFIG_VT_HW_CONSOLE_BINDING=3Dy
> CONFIG_UNIX98_PTYS=3Dy
> # CONFIG_LEGACY_PTYS is not set
> CONFIG_LDISC_AUTOLOAD=3Dy
> =

> #
> # Serial drivers
> #
> CONFIG_SERIAL_EARLYCON=3Dy
> CONFIG_SERIAL_8250=3Dy
> # CONFIG_SERIAL_8250_DEPRECATED_OPTIONS is not set
> CONFIG_SERIAL_8250_PNP=3Dy
> # CONFIG_SERIAL_8250_16550A_VARIANTS is not set
> # CONFIG_SERIAL_8250_FINTEK is not set
> CONFIG_SERIAL_8250_CONSOLE=3Dy
> CONFIG_SERIAL_8250_DMA=3Dy
> CONFIG_SERIAL_8250_PCI=3Dy
> CONFIG_SERIAL_8250_EXAR=3Dy
> CONFIG_SERIAL_8250_NR_UARTS=3D64
> CONFIG_SERIAL_8250_RUNTIME_UARTS=3D4
> CONFIG_SERIAL_8250_EXTENDED=3Dy
> CONFIG_SERIAL_8250_MANY_PORTS=3Dy
> CONFIG_SERIAL_8250_SHARE_IRQ=3Dy
> # CONFIG_SERIAL_8250_DETECT_IRQ is not set
> CONFIG_SERIAL_8250_RSA=3Dy
> CONFIG_SERIAL_8250_DWLIB=3Dy
> CONFIG_SERIAL_8250_DW=3Dy
> # CONFIG_SERIAL_8250_RT288X is not set
> CONFIG_SERIAL_8250_LPSS=3Dy
> CONFIG_SERIAL_8250_MID=3Dy
> =

> #
> # Non-8250 serial port support
> #
> # CONFIG_SERIAL_MAX3100 is not set
> # CONFIG_SERIAL_MAX310X is not set
> # CONFIG_SERIAL_UARTLITE is not set
> CONFIG_SERIAL_CORE=3Dy
> CONFIG_SERIAL_CORE_CONSOLE=3Dy
> CONFIG_SERIAL_JSM=3Dm
> # CONFIG_SERIAL_LANTIQ is not set
> # CONFIG_SERIAL_SCCNXP is not set
> # CONFIG_SERIAL_SC16IS7XX is not set
> # CONFIG_SERIAL_BCM63XX is not set
> # CONFIG_SERIAL_ALTERA_JTAGUART is not set
> # CONFIG_SERIAL_ALTERA_UART is not set
> CONFIG_SERIAL_ARC=3Dm
> CONFIG_SERIAL_ARC_NR_PORTS=3D1
> # CONFIG_SERIAL_RP2 is not set
> # CONFIG_SERIAL_FSL_LPUART is not set
> # CONFIG_SERIAL_FSL_LINFLEXUART is not set
> # CONFIG_SERIAL_SPRD is not set
> # end of Serial drivers
> =

> CONFIG_SERIAL_MCTRL_GPIO=3Dy
> CONFIG_SERIAL_NONSTANDARD=3Dy
> # CONFIG_MOXA_INTELLIO is not set
> # CONFIG_MOXA_SMARTIO is not set
> CONFIG_SYNCLINK_GT=3Dm
> CONFIG_N_HDLC=3Dm
> CONFIG_N_GSM=3Dm
> CONFIG_NOZOMI=3Dm
> # CONFIG_NULL_TTY is not set
> CONFIG_HVC_DRIVER=3Dy
> # CONFIG_SERIAL_DEV_BUS is not set
> CONFIG_PRINTER=3Dm
> # CONFIG_LP_CONSOLE is not set
> CONFIG_PPDEV=3Dm
> CONFIG_VIRTIO_CONSOLE=3Dm
> CONFIG_IPMI_HANDLER=3Dm
> CONFIG_IPMI_DMI_DECODE=3Dy
> CONFIG_IPMI_PLAT_DATA=3Dy
> CONFIG_IPMI_PANIC_EVENT=3Dy
> CONFIG_IPMI_PANIC_STRING=3Dy
> CONFIG_IPMI_DEVICE_INTERFACE=3Dm
> CONFIG_IPMI_SI=3Dm
> CONFIG_IPMI_SSIF=3Dm
> CONFIG_IPMI_WATCHDOG=3Dm
> CONFIG_IPMI_POWEROFF=3Dm
> CONFIG_HW_RANDOM=3Dy
> CONFIG_HW_RANDOM_TIMERIOMEM=3Dm
> CONFIG_HW_RANDOM_INTEL=3Dm
> CONFIG_HW_RANDOM_AMD=3Dm
> # CONFIG_HW_RANDOM_BA431 is not set
> CONFIG_HW_RANDOM_VIA=3Dm
> CONFIG_HW_RANDOM_VIRTIO=3Dy
> # CONFIG_HW_RANDOM_XIPHERA is not set
> # CONFIG_APPLICOM is not set
> # CONFIG_MWAVE is not set
> CONFIG_DEVMEM=3Dy
> CONFIG_NVRAM=3Dy
> CONFIG_DEVPORT=3Dy
> CONFIG_HPET=3Dy
> CONFIG_HPET_MMAP=3Dy
> # CONFIG_HPET_MMAP_DEFAULT is not set
> CONFIG_HANGCHECK_TIMER=3Dm
> CONFIG_UV_MMTIMER=3Dm
> CONFIG_TCG_TPM=3Dy
> CONFIG_HW_RANDOM_TPM=3Dy
> CONFIG_TCG_TIS_CORE=3Dy
> CONFIG_TCG_TIS=3Dy
> # CONFIG_TCG_TIS_SPI is not set
> # CONFIG_TCG_TIS_I2C_CR50 is not set
> CONFIG_TCG_TIS_I2C_ATMEL=3Dm
> CONFIG_TCG_TIS_I2C_INFINEON=3Dm
> CONFIG_TCG_TIS_I2C_NUVOTON=3Dm
> CONFIG_TCG_NSC=3Dm
> CONFIG_TCG_ATMEL=3Dm
> CONFIG_TCG_INFINEON=3Dm
> CONFIG_TCG_CRB=3Dy
> # CONFIG_TCG_VTPM_PROXY is not set
> CONFIG_TCG_TIS_ST33ZP24=3Dm
> CONFIG_TCG_TIS_ST33ZP24_I2C=3Dm
> # CONFIG_TCG_TIS_ST33ZP24_SPI is not set
> CONFIG_TELCLOCK=3Dm
> # CONFIG_XILLYBUS is not set
> # CONFIG_XILLYUSB is not set
> # CONFIG_RANDOM_TRUST_CPU is not set
> # CONFIG_RANDOM_TRUST_BOOTLOADER is not set
> # end of Character devices
> =

> #
> # I2C support
> #
> CONFIG_I2C=3Dy
> CONFIG_ACPI_I2C_OPREGION=3Dy
> CONFIG_I2C_BOARDINFO=3Dy
> CONFIG_I2C_COMPAT=3Dy
> CONFIG_I2C_CHARDEV=3Dm
> CONFIG_I2C_MUX=3Dm
> =

> #
> # Multiplexer I2C Chip support
> #
> # CONFIG_I2C_MUX_GPIO is not set
> # CONFIG_I2C_MUX_LTC4306 is not set
> # CONFIG_I2C_MUX_PCA9541 is not set
> # CONFIG_I2C_MUX_PCA954x is not set
> # CONFIG_I2C_MUX_REG is not set
> CONFIG_I2C_MUX_MLXCPLD=3Dm
> # end of Multiplexer I2C Chip support
> =

> CONFIG_I2C_HELPER_AUTO=3Dy
> CONFIG_I2C_SMBUS=3Dy
> CONFIG_I2C_ALGOBIT=3Dy
> CONFIG_I2C_ALGOPCA=3Dm
> =

> #
> # I2C Hardware Bus support
> #
> =

> #
> # PC SMBus host controller drivers
> #
> # CONFIG_I2C_ALI1535 is not set
> # CONFIG_I2C_ALI1563 is not set
> # CONFIG_I2C_ALI15X3 is not set
> CONFIG_I2C_AMD756=3Dm
> CONFIG_I2C_AMD756_S4882=3Dm
> CONFIG_I2C_AMD8111=3Dm
> # CONFIG_I2C_AMD_MP2 is not set
> CONFIG_I2C_I801=3Dy
> CONFIG_I2C_ISCH=3Dm
> CONFIG_I2C_ISMT=3Dm
> CONFIG_I2C_PIIX4=3Dm
> CONFIG_I2C_NFORCE2=3Dm
> CONFIG_I2C_NFORCE2_S4985=3Dm
> # CONFIG_I2C_NVIDIA_GPU is not set
> # CONFIG_I2C_SIS5595 is not set
> # CONFIG_I2C_SIS630 is not set
> CONFIG_I2C_SIS96X=3Dm
> CONFIG_I2C_VIA=3Dm
> CONFIG_I2C_VIAPRO=3Dm
> =

> #
> # ACPI drivers
> #
> CONFIG_I2C_SCMI=3Dm
> =

> #
> # I2C system bus drivers (mostly embedded / system-on-chip)
> #
> # CONFIG_I2C_CBUS_GPIO is not set
> CONFIG_I2C_DESIGNWARE_CORE=3Dm
> # CONFIG_I2C_DESIGNWARE_SLAVE is not set
> CONFIG_I2C_DESIGNWARE_PLATFORM=3Dm
> CONFIG_I2C_DESIGNWARE_BAYTRAIL=3Dy
> # CONFIG_I2C_DESIGNWARE_PCI is not set
> # CONFIG_I2C_EMEV2 is not set
> # CONFIG_I2C_GPIO is not set
> # CONFIG_I2C_OCORES is not set
> CONFIG_I2C_PCA_PLATFORM=3Dm
> CONFIG_I2C_SIMTEC=3Dm
> # CONFIG_I2C_XILINX is not set
> =

> #
> # External I2C/SMBus adapter drivers
> #
> # CONFIG_I2C_DIOLAN_U2C is not set
> # CONFIG_I2C_CP2615 is not set
> CONFIG_I2C_PARPORT=3Dm
> # CONFIG_I2C_ROBOTFUZZ_OSIF is not set
> # CONFIG_I2C_TAOS_EVM is not set
> # CONFIG_I2C_TINY_USB is not set
> =

> #
> # Other I2C/SMBus bus drivers
> #
> CONFIG_I2C_MLXCPLD=3Dm
> # CONFIG_I2C_VIRTIO is not set
> # end of I2C Hardware Bus support
> =

> CONFIG_I2C_STUB=3Dm
> # CONFIG_I2C_SLAVE is not set
> # CONFIG_I2C_DEBUG_CORE is not set
> # CONFIG_I2C_DEBUG_ALGO is not set
> # CONFIG_I2C_DEBUG_BUS is not set
> # end of I2C support
> =

> # CONFIG_I3C is not set
> CONFIG_SPI=3Dy
> # CONFIG_SPI_DEBUG is not set
> CONFIG_SPI_MASTER=3Dy
> # CONFIG_SPI_MEM is not set
> =

> #
> # SPI Master Controller Drivers
> #
> # CONFIG_SPI_ALTERA is not set
> # CONFIG_SPI_AXI_SPI_ENGINE is not set
> # CONFIG_SPI_BITBANG is not set
> # CONFIG_SPI_BUTTERFLY is not set
> # CONFIG_SPI_CADENCE is not set
> # CONFIG_SPI_DESIGNWARE is not set
> # CONFIG_SPI_NXP_FLEXSPI is not set
> # CONFIG_SPI_GPIO is not set
> # CONFIG_SPI_LM70_LLP is not set
> # CONFIG_SPI_LANTIQ_SSC is not set
> # CONFIG_SPI_OC_TINY is not set
> # CONFIG_SPI_PXA2XX is not set
> # CONFIG_SPI_ROCKCHIP is not set
> # CONFIG_SPI_SC18IS602 is not set
> # CONFIG_SPI_SIFIVE is not set
> # CONFIG_SPI_MXIC is not set
> # CONFIG_SPI_XCOMM is not set
> # CONFIG_SPI_XILINX is not set
> # CONFIG_SPI_ZYNQMP_GQSPI is not set
> # CONFIG_SPI_AMD is not set
> =

> #
> # SPI Multiplexer support
> #
> # CONFIG_SPI_MUX is not set
> =

> #
> # SPI Protocol Masters
> #
> # CONFIG_SPI_SPIDEV is not set
> # CONFIG_SPI_LOOPBACK_TEST is not set
> # CONFIG_SPI_TLE62X0 is not set
> # CONFIG_SPI_SLAVE is not set
> CONFIG_SPI_DYNAMIC=3Dy
> # CONFIG_SPMI is not set
> # CONFIG_HSI is not set
> CONFIG_PPS=3Dy
> # CONFIG_PPS_DEBUG is not set
> =

> #
> # PPS clients support
> #
> # CONFIG_PPS_CLIENT_KTIMER is not set
> CONFIG_PPS_CLIENT_LDISC=3Dm
> CONFIG_PPS_CLIENT_PARPORT=3Dm
> CONFIG_PPS_CLIENT_GPIO=3Dm
> =

> #
> # PPS generators support
> #
> =

> #
> # PTP clock support
> #
> CONFIG_PTP_1588_CLOCK=3Dy
> CONFIG_PTP_1588_CLOCK_OPTIONAL=3Dy
> # CONFIG_DP83640_PHY is not set
> # CONFIG_PTP_1588_CLOCK_INES is not set
> CONFIG_PTP_1588_CLOCK_KVM=3Dm
> # CONFIG_PTP_1588_CLOCK_IDT82P33 is not set
> # CONFIG_PTP_1588_CLOCK_IDTCM is not set
> # CONFIG_PTP_1588_CLOCK_VMW is not set
> # end of PTP clock support
> =

> CONFIG_PINCTRL=3Dy
> CONFIG_PINMUX=3Dy
> CONFIG_PINCONF=3Dy
> CONFIG_GENERIC_PINCONF=3Dy
> # CONFIG_DEBUG_PINCTRL is not set
> CONFIG_PINCTRL_AMD=3Dm
> # CONFIG_PINCTRL_MCP23S08 is not set
> # CONFIG_PINCTRL_SX150X is not set
> =

> #
> # Intel pinctrl drivers
> #
> CONFIG_PINCTRL_BAYTRAIL=3Dy
> # CONFIG_PINCTRL_CHERRYVIEW is not set
> # CONFIG_PINCTRL_LYNXPOINT is not set
> CONFIG_PINCTRL_INTEL=3Dy
> # CONFIG_PINCTRL_ALDERLAKE is not set
> CONFIG_PINCTRL_BROXTON=3Dm
> CONFIG_PINCTRL_CANNONLAKE=3Dm
> CONFIG_PINCTRL_CEDARFORK=3Dm
> CONFIG_PINCTRL_DENVERTON=3Dm
> # CONFIG_PINCTRL_ELKHARTLAKE is not set
> # CONFIG_PINCTRL_EMMITSBURG is not set
> CONFIG_PINCTRL_GEMINILAKE=3Dm
> # CONFIG_PINCTRL_ICELAKE is not set
> # CONFIG_PINCTRL_JASPERLAKE is not set
> # CONFIG_PINCTRL_LAKEFIELD is not set
> CONFIG_PINCTRL_LEWISBURG=3Dm
> CONFIG_PINCTRL_SUNRISEPOINT=3Dm
> # CONFIG_PINCTRL_TIGERLAKE is not set
> # end of Intel pinctrl drivers
> =

> #
> # Renesas pinctrl drivers
> #
> # end of Renesas pinctrl drivers
> =

> CONFIG_GPIOLIB=3Dy
> CONFIG_GPIOLIB_FASTPATH_LIMIT=3D512
> CONFIG_GPIO_ACPI=3Dy
> CONFIG_GPIOLIB_IRQCHIP=3Dy
> # CONFIG_DEBUG_GPIO is not set
> CONFIG_GPIO_CDEV=3Dy
> CONFIG_GPIO_CDEV_V1=3Dy
> CONFIG_GPIO_GENERIC=3Dm
> =

> #
> # Memory mapped GPIO drivers
> #
> CONFIG_GPIO_AMDPT=3Dm
> # CONFIG_GPIO_DWAPB is not set
> # CONFIG_GPIO_EXAR is not set
> # CONFIG_GPIO_GENERIC_PLATFORM is not set
> CONFIG_GPIO_ICH=3Dm
> # CONFIG_GPIO_MB86S7X is not set
> # CONFIG_GPIO_VX855 is not set
> # CONFIG_GPIO_AMD_FCH is not set
> # end of Memory mapped GPIO drivers
> =

> #
> # Port-mapped I/O GPIO drivers
> #
> # CONFIG_GPIO_F7188X is not set
> # CONFIG_GPIO_IT87 is not set
> # CONFIG_GPIO_SCH is not set
> # CONFIG_GPIO_SCH311X is not set
> # CONFIG_GPIO_WINBOND is not set
> # CONFIG_GPIO_WS16C48 is not set
> # end of Port-mapped I/O GPIO drivers
> =

> #
> # I2C GPIO expanders
> #
> # CONFIG_GPIO_ADP5588 is not set
> # CONFIG_GPIO_MAX7300 is not set
> # CONFIG_GPIO_MAX732X is not set
> # CONFIG_GPIO_PCA953X is not set
> # CONFIG_GPIO_PCA9570 is not set
> # CONFIG_GPIO_PCF857X is not set
> # CONFIG_GPIO_TPIC2810 is not set
> # end of I2C GPIO expanders
> =

> #
> # MFD GPIO expanders
> #
> # end of MFD GPIO expanders
> =

> #
> # PCI GPIO expanders
> #
> # CONFIG_GPIO_AMD8111 is not set
> # CONFIG_GPIO_BT8XX is not set
> # CONFIG_GPIO_ML_IOH is not set
> # CONFIG_GPIO_PCI_IDIO_16 is not set
> # CONFIG_GPIO_PCIE_IDIO_24 is not set
> # CONFIG_GPIO_RDC321X is not set
> # end of PCI GPIO expanders
> =

> #
> # SPI GPIO expanders
> #
> # CONFIG_GPIO_MAX3191X is not set
> # CONFIG_GPIO_MAX7301 is not set
> # CONFIG_GPIO_MC33880 is not set
> # CONFIG_GPIO_PISOSR is not set
> # CONFIG_GPIO_XRA1403 is not set
> # end of SPI GPIO expanders
> =

> #
> # USB GPIO expanders
> #
> # end of USB GPIO expanders
> =

> #
> # Virtual GPIO drivers
> #
> # CONFIG_GPIO_AGGREGATOR is not set
> # CONFIG_GPIO_MOCKUP is not set
> # CONFIG_GPIO_VIRTIO is not set
> # end of Virtual GPIO drivers
> =

> # CONFIG_W1 is not set
> CONFIG_POWER_RESET=3Dy
> # CONFIG_POWER_RESET_RESTART is not set
> CONFIG_POWER_SUPPLY=3Dy
> # CONFIG_POWER_SUPPLY_DEBUG is not set
> CONFIG_POWER_SUPPLY_HWMON=3Dy
> # CONFIG_PDA_POWER is not set
> # CONFIG_TEST_POWER is not set
> # CONFIG_CHARGER_ADP5061 is not set
> # CONFIG_BATTERY_CW2015 is not set
> # CONFIG_BATTERY_DS2780 is not set
> # CONFIG_BATTERY_DS2781 is not set
> # CONFIG_BATTERY_DS2782 is not set
> # CONFIG_BATTERY_SBS is not set
> # CONFIG_CHARGER_SBS is not set
> # CONFIG_MANAGER_SBS is not set
> # CONFIG_BATTERY_BQ27XXX is not set
> # CONFIG_BATTERY_MAX17040 is not set
> # CONFIG_BATTERY_MAX17042 is not set
> # CONFIG_CHARGER_MAX8903 is not set
> # CONFIG_CHARGER_LP8727 is not set
> # CONFIG_CHARGER_GPIO is not set
> # CONFIG_CHARGER_LT3651 is not set
> # CONFIG_CHARGER_LTC4162L is not set
> # CONFIG_CHARGER_BQ2415X is not set
> # CONFIG_CHARGER_BQ24257 is not set
> # CONFIG_CHARGER_BQ24735 is not set
> # CONFIG_CHARGER_BQ2515X is not set
> # CONFIG_CHARGER_BQ25890 is not set
> # CONFIG_CHARGER_BQ25980 is not set
> # CONFIG_CHARGER_BQ256XX is not set
> # CONFIG_BATTERY_GAUGE_LTC2941 is not set
> # CONFIG_BATTERY_GOLDFISH is not set
> # CONFIG_BATTERY_RT5033 is not set
> # CONFIG_CHARGER_RT9455 is not set
> # CONFIG_CHARGER_BD99954 is not set
> CONFIG_HWMON=3Dy
> CONFIG_HWMON_VID=3Dm
> # CONFIG_HWMON_DEBUG_CHIP is not set
> =

> #
> # Native drivers
> #
> CONFIG_SENSORS_ABITUGURU=3Dm
> CONFIG_SENSORS_ABITUGURU3=3Dm
> # CONFIG_SENSORS_AD7314 is not set
> CONFIG_SENSORS_AD7414=3Dm
> CONFIG_SENSORS_AD7418=3Dm
> CONFIG_SENSORS_ADM1021=3Dm
> CONFIG_SENSORS_ADM1025=3Dm
> CONFIG_SENSORS_ADM1026=3Dm
> CONFIG_SENSORS_ADM1029=3Dm
> CONFIG_SENSORS_ADM1031=3Dm
> # CONFIG_SENSORS_ADM1177 is not set
> CONFIG_SENSORS_ADM9240=3Dm
> CONFIG_SENSORS_ADT7X10=3Dm
> # CONFIG_SENSORS_ADT7310 is not set
> CONFIG_SENSORS_ADT7410=3Dm
> CONFIG_SENSORS_ADT7411=3Dm
> CONFIG_SENSORS_ADT7462=3Dm
> CONFIG_SENSORS_ADT7470=3Dm
> CONFIG_SENSORS_ADT7475=3Dm
> # CONFIG_SENSORS_AHT10 is not set
> # CONFIG_SENSORS_AQUACOMPUTER_D5NEXT is not set
> # CONFIG_SENSORS_AS370 is not set
> CONFIG_SENSORS_ASC7621=3Dm
> # CONFIG_SENSORS_AXI_FAN_CONTROL is not set
> CONFIG_SENSORS_K8TEMP=3Dm
> CONFIG_SENSORS_K10TEMP=3Dm
> CONFIG_SENSORS_FAM15H_POWER=3Dm
> CONFIG_SENSORS_APPLESMC=3Dm
> CONFIG_SENSORS_ASB100=3Dm
> # CONFIG_SENSORS_ASPEED is not set
> CONFIG_SENSORS_ATXP1=3Dm
> # CONFIG_SENSORS_CORSAIR_CPRO is not set
> # CONFIG_SENSORS_CORSAIR_PSU is not set
> # CONFIG_SENSORS_DRIVETEMP is not set
> CONFIG_SENSORS_DS620=3Dm
> CONFIG_SENSORS_DS1621=3Dm
> CONFIG_SENSORS_DELL_SMM=3Dm
> CONFIG_SENSORS_I5K_AMB=3Dm
> CONFIG_SENSORS_F71805F=3Dm
> CONFIG_SENSORS_F71882FG=3Dm
> CONFIG_SENSORS_F75375S=3Dm
> CONFIG_SENSORS_FSCHMD=3Dm
> # CONFIG_SENSORS_FTSTEUTATES is not set
> CONFIG_SENSORS_GL518SM=3Dm
> CONFIG_SENSORS_GL520SM=3Dm
> CONFIG_SENSORS_G760A=3Dm
> # CONFIG_SENSORS_G762 is not set
> # CONFIG_SENSORS_HIH6130 is not set
> CONFIG_SENSORS_IBMAEM=3Dm
> CONFIG_SENSORS_IBMPEX=3Dm
> CONFIG_SENSORS_I5500=3Dm
> CONFIG_SENSORS_CORETEMP=3Dm
> CONFIG_SENSORS_IT87=3Dm
> CONFIG_SENSORS_JC42=3Dm
> # CONFIG_SENSORS_POWR1220 is not set
> CONFIG_SENSORS_LINEAGE=3Dm
> # CONFIG_SENSORS_LTC2945 is not set
> # CONFIG_SENSORS_LTC2947_I2C is not set
> # CONFIG_SENSORS_LTC2947_SPI is not set
> # CONFIG_SENSORS_LTC2990 is not set
> # CONFIG_SENSORS_LTC2992 is not set
> CONFIG_SENSORS_LTC4151=3Dm
> CONFIG_SENSORS_LTC4215=3Dm
> # CONFIG_SENSORS_LTC4222 is not set
> CONFIG_SENSORS_LTC4245=3Dm
> # CONFIG_SENSORS_LTC4260 is not set
> CONFIG_SENSORS_LTC4261=3Dm
> # CONFIG_SENSORS_MAX1111 is not set
> # CONFIG_SENSORS_MAX127 is not set
> CONFIG_SENSORS_MAX16065=3Dm
> CONFIG_SENSORS_MAX1619=3Dm
> CONFIG_SENSORS_MAX1668=3Dm
> CONFIG_SENSORS_MAX197=3Dm
> # CONFIG_SENSORS_MAX31722 is not set
> # CONFIG_SENSORS_MAX31730 is not set
> # CONFIG_SENSORS_MAX6620 is not set
> # CONFIG_SENSORS_MAX6621 is not set
> CONFIG_SENSORS_MAX6639=3Dm
> CONFIG_SENSORS_MAX6642=3Dm
> CONFIG_SENSORS_MAX6650=3Dm
> CONFIG_SENSORS_MAX6697=3Dm
> # CONFIG_SENSORS_MAX31790 is not set
> CONFIG_SENSORS_MCP3021=3Dm
> # CONFIG_SENSORS_MLXREG_FAN is not set
> # CONFIG_SENSORS_TC654 is not set
> # CONFIG_SENSORS_TPS23861 is not set
> # CONFIG_SENSORS_MR75203 is not set
> # CONFIG_SENSORS_ADCXX is not set
> CONFIG_SENSORS_LM63=3Dm
> # CONFIG_SENSORS_LM70 is not set
> CONFIG_SENSORS_LM73=3Dm
> CONFIG_SENSORS_LM75=3Dm
> CONFIG_SENSORS_LM77=3Dm
> CONFIG_SENSORS_LM78=3Dm
> CONFIG_SENSORS_LM80=3Dm
> CONFIG_SENSORS_LM83=3Dm
> CONFIG_SENSORS_LM85=3Dm
> CONFIG_SENSORS_LM87=3Dm
> CONFIG_SENSORS_LM90=3Dm
> CONFIG_SENSORS_LM92=3Dm
> CONFIG_SENSORS_LM93=3Dm
> CONFIG_SENSORS_LM95234=3Dm
> CONFIG_SENSORS_LM95241=3Dm
> CONFIG_SENSORS_LM95245=3Dm
> CONFIG_SENSORS_PC87360=3Dm
> CONFIG_SENSORS_PC87427=3Dm
> CONFIG_SENSORS_NTC_THERMISTOR=3Dm
> # CONFIG_SENSORS_NCT6683 is not set
> CONFIG_SENSORS_NCT6775=3Dm
> # CONFIG_SENSORS_NCT7802 is not set
> # CONFIG_SENSORS_NCT7904 is not set
> # CONFIG_SENSORS_NPCM7XX is not set
> # CONFIG_SENSORS_NZXT_KRAKEN2 is not set
> CONFIG_SENSORS_PCF8591=3Dm
> CONFIG_PMBUS=3Dm
> CONFIG_SENSORS_PMBUS=3Dm
> # CONFIG_SENSORS_ADM1266 is not set
> CONFIG_SENSORS_ADM1275=3Dm
> # CONFIG_SENSORS_BEL_PFE is not set
> # CONFIG_SENSORS_BPA_RS600 is not set
> # CONFIG_SENSORS_FSP_3Y is not set
> # CONFIG_SENSORS_IBM_CFFPS is not set
> # CONFIG_SENSORS_DPS920AB is not set
> # CONFIG_SENSORS_INSPUR_IPSPS is not set
> # CONFIG_SENSORS_IR35221 is not set
> # CONFIG_SENSORS_IR36021 is not set
> # CONFIG_SENSORS_IR38064 is not set
> # CONFIG_SENSORS_IRPS5401 is not set
> # CONFIG_SENSORS_ISL68137 is not set
> CONFIG_SENSORS_LM25066=3Dm
> CONFIG_SENSORS_LTC2978=3Dm
> # CONFIG_SENSORS_LTC3815 is not set
> # CONFIG_SENSORS_MAX15301 is not set
> CONFIG_SENSORS_MAX16064=3Dm
> # CONFIG_SENSORS_MAX16601 is not set
> # CONFIG_SENSORS_MAX20730 is not set
> # CONFIG_SENSORS_MAX20751 is not set
> # CONFIG_SENSORS_MAX31785 is not set
> CONFIG_SENSORS_MAX34440=3Dm
> CONFIG_SENSORS_MAX8688=3Dm
> # CONFIG_SENSORS_MP2888 is not set
> # CONFIG_SENSORS_MP2975 is not set
> # CONFIG_SENSORS_PIM4328 is not set
> # CONFIG_SENSORS_PM6764TR is not set
> # CONFIG_SENSORS_PXE1610 is not set
> # CONFIG_SENSORS_Q54SJ108A2 is not set
> # CONFIG_SENSORS_STPDDC60 is not set
> # CONFIG_SENSORS_TPS40422 is not set
> # CONFIG_SENSORS_TPS53679 is not set
> CONFIG_SENSORS_UCD9000=3Dm
> CONFIG_SENSORS_UCD9200=3Dm
> # CONFIG_SENSORS_XDPE122 is not set
> CONFIG_SENSORS_ZL6100=3Dm
> # CONFIG_SENSORS_SBTSI is not set
> # CONFIG_SENSORS_SBRMI is not set
> CONFIG_SENSORS_SHT15=3Dm
> CONFIG_SENSORS_SHT21=3Dm
> # CONFIG_SENSORS_SHT3x is not set
> # CONFIG_SENSORS_SHT4x is not set
> # CONFIG_SENSORS_SHTC1 is not set
> CONFIG_SENSORS_SIS5595=3Dm
> CONFIG_SENSORS_DME1737=3Dm
> CONFIG_SENSORS_EMC1403=3Dm
> # CONFIG_SENSORS_EMC2103 is not set
> CONFIG_SENSORS_EMC6W201=3Dm
> CONFIG_SENSORS_SMSC47M1=3Dm
> CONFIG_SENSORS_SMSC47M192=3Dm
> CONFIG_SENSORS_SMSC47B397=3Dm
> CONFIG_SENSORS_SCH56XX_COMMON=3Dm
> CONFIG_SENSORS_SCH5627=3Dm
> CONFIG_SENSORS_SCH5636=3Dm
> # CONFIG_SENSORS_STTS751 is not set
> # CONFIG_SENSORS_SMM665 is not set
> # CONFIG_SENSORS_ADC128D818 is not set
> CONFIG_SENSORS_ADS7828=3Dm
> # CONFIG_SENSORS_ADS7871 is not set
> CONFIG_SENSORS_AMC6821=3Dm
> CONFIG_SENSORS_INA209=3Dm
> CONFIG_SENSORS_INA2XX=3Dm
> # CONFIG_SENSORS_INA3221 is not set
> # CONFIG_SENSORS_TC74 is not set
> CONFIG_SENSORS_THMC50=3Dm
> CONFIG_SENSORS_TMP102=3Dm
> # CONFIG_SENSORS_TMP103 is not set
> # CONFIG_SENSORS_TMP108 is not set
> CONFIG_SENSORS_TMP401=3Dm
> CONFIG_SENSORS_TMP421=3Dm
> # CONFIG_SENSORS_TMP513 is not set
> CONFIG_SENSORS_VIA_CPUTEMP=3Dm
> CONFIG_SENSORS_VIA686A=3Dm
> CONFIG_SENSORS_VT1211=3Dm
> CONFIG_SENSORS_VT8231=3Dm
> # CONFIG_SENSORS_W83773G is not set
> CONFIG_SENSORS_W83781D=3Dm
> CONFIG_SENSORS_W83791D=3Dm
> CONFIG_SENSORS_W83792D=3Dm
> CONFIG_SENSORS_W83793=3Dm
> CONFIG_SENSORS_W83795=3Dm
> # CONFIG_SENSORS_W83795_FANCTRL is not set
> CONFIG_SENSORS_W83L785TS=3Dm
> CONFIG_SENSORS_W83L786NG=3Dm
> CONFIG_SENSORS_W83627HF=3Dm
> CONFIG_SENSORS_W83627EHF=3Dm
> # CONFIG_SENSORS_XGENE is not set
> =

> #
> # ACPI drivers
> #
> CONFIG_SENSORS_ACPI_POWER=3Dm
> CONFIG_SENSORS_ATK0110=3Dm
> CONFIG_THERMAL=3Dy
> # CONFIG_THERMAL_NETLINK is not set
> # CONFIG_THERMAL_STATISTICS is not set
> CONFIG_THERMAL_EMERGENCY_POWEROFF_DELAY_MS=3D0
> CONFIG_THERMAL_HWMON=3Dy
> CONFIG_THERMAL_WRITABLE_TRIPS=3Dy
> CONFIG_THERMAL_DEFAULT_GOV_STEP_WISE=3Dy
> # CONFIG_THERMAL_DEFAULT_GOV_FAIR_SHARE is not set
> # CONFIG_THERMAL_DEFAULT_GOV_USER_SPACE is not set
> CONFIG_THERMAL_GOV_FAIR_SHARE=3Dy
> CONFIG_THERMAL_GOV_STEP_WISE=3Dy
> CONFIG_THERMAL_GOV_BANG_BANG=3Dy
> CONFIG_THERMAL_GOV_USER_SPACE=3Dy
> # CONFIG_THERMAL_EMULATION is not set
> =

> #
> # Intel thermal drivers
> #
> CONFIG_INTEL_POWERCLAMP=3Dm
> CONFIG_X86_THERMAL_VECTOR=3Dy
> CONFIG_X86_PKG_TEMP_THERMAL=3Dm
> # CONFIG_INTEL_SOC_DTS_THERMAL is not set
> =

> #
> # ACPI INT340X thermal drivers
> #
> # CONFIG_INT340X_THERMAL is not set
> # end of ACPI INT340X thermal drivers
> =

> CONFIG_INTEL_PCH_THERMAL=3Dm
> # CONFIG_INTEL_TCC_COOLING is not set
> # CONFIG_INTEL_MENLOW is not set
> # end of Intel thermal drivers
> =

> CONFIG_WATCHDOG=3Dy
> CONFIG_WATCHDOG_CORE=3Dy
> # CONFIG_WATCHDOG_NOWAYOUT is not set
> CONFIG_WATCHDOG_HANDLE_BOOT_ENABLED=3Dy
> CONFIG_WATCHDOG_OPEN_TIMEOUT=3D0
> CONFIG_WATCHDOG_SYSFS=3Dy
> # CONFIG_WATCHDOG_HRTIMER_PRETIMEOUT is not set
> =

> #
> # Watchdog Pretimeout Governors
> #
> # CONFIG_WATCHDOG_PRETIMEOUT_GOV is not set
> =

> #
> # Watchdog Device Drivers
> #
> CONFIG_SOFT_WATCHDOG=3Dm
> CONFIG_WDAT_WDT=3Dm
> # CONFIG_XILINX_WATCHDOG is not set
> # CONFIG_ZIIRAVE_WATCHDOG is not set
> # CONFIG_MLX_WDT is not set
> # CONFIG_CADENCE_WATCHDOG is not set
> # CONFIG_DW_WATCHDOG is not set
> # CONFIG_MAX63XX_WATCHDOG is not set
> # CONFIG_ACQUIRE_WDT is not set
> # CONFIG_ADVANTECH_WDT is not set
> CONFIG_ALIM1535_WDT=3Dm
> CONFIG_ALIM7101_WDT=3Dm
> # CONFIG_EBC_C384_WDT is not set
> CONFIG_F71808E_WDT=3Dm
> CONFIG_SP5100_TCO=3Dm
> CONFIG_SBC_FITPC2_WATCHDOG=3Dm
> # CONFIG_EUROTECH_WDT is not set
> CONFIG_IB700_WDT=3Dm
> CONFIG_IBMASR=3Dm
> # CONFIG_WAFER_WDT is not set
> CONFIG_I6300ESB_WDT=3Dy
> CONFIG_IE6XX_WDT=3Dm
> CONFIG_ITCO_WDT=3Dy
> CONFIG_ITCO_VENDOR_SUPPORT=3Dy
> CONFIG_IT8712F_WDT=3Dm
> CONFIG_IT87_WDT=3Dm
> CONFIG_HP_WATCHDOG=3Dm
> CONFIG_HPWDT_NMI_DECODING=3Dy
> # CONFIG_SC1200_WDT is not set
> # CONFIG_PC87413_WDT is not set
> CONFIG_NV_TCO=3Dm
> # CONFIG_60XX_WDT is not set
> # CONFIG_CPU5_WDT is not set
> CONFIG_SMSC_SCH311X_WDT=3Dm
> # CONFIG_SMSC37B787_WDT is not set
> # CONFIG_TQMX86_WDT is not set
> CONFIG_VIA_WDT=3Dm
> CONFIG_W83627HF_WDT=3Dm
> CONFIG_W83877F_WDT=3Dm
> CONFIG_W83977F_WDT=3Dm
> CONFIG_MACHZ_WDT=3Dm
> # CONFIG_SBC_EPX_C3_WATCHDOG is not set
> CONFIG_INTEL_MEI_WDT=3Dm
> # CONFIG_NI903X_WDT is not set
> # CONFIG_NIC7018_WDT is not set
> # CONFIG_MEN_A21_WDT is not set
> =

> #
> # PCI-based Watchdog Cards
> #
> CONFIG_PCIPCWATCHDOG=3Dm
> CONFIG_WDTPCI=3Dm
> =

> #
> # USB-based Watchdog Cards
> #
> # CONFIG_USBPCWATCHDOG is not set
> CONFIG_SSB_POSSIBLE=3Dy
> # CONFIG_SSB is not set
> CONFIG_BCMA_POSSIBLE=3Dy
> CONFIG_BCMA=3Dm
> CONFIG_BCMA_HOST_PCI_POSSIBLE=3Dy
> CONFIG_BCMA_HOST_PCI=3Dy
> # CONFIG_BCMA_HOST_SOC is not set
> CONFIG_BCMA_DRIVER_PCI=3Dy
> CONFIG_BCMA_DRIVER_GMAC_CMN=3Dy
> CONFIG_BCMA_DRIVER_GPIO=3Dy
> # CONFIG_BCMA_DEBUG is not set
> =

> #
> # Multifunction device drivers
> #
> CONFIG_MFD_CORE=3Dy
> # CONFIG_MFD_AS3711 is not set
> # CONFIG_PMIC_ADP5520 is not set
> # CONFIG_MFD_AAT2870_CORE is not set
> # CONFIG_MFD_BCM590XX is not set
> # CONFIG_MFD_BD9571MWV is not set
> # CONFIG_MFD_AXP20X_I2C is not set
> # CONFIG_MFD_MADERA is not set
> # CONFIG_PMIC_DA903X is not set
> # CONFIG_MFD_DA9052_SPI is not set
> # CONFIG_MFD_DA9052_I2C is not set
> # CONFIG_MFD_DA9055 is not set
> # CONFIG_MFD_DA9062 is not set
> # CONFIG_MFD_DA9063 is not set
> # CONFIG_MFD_DA9150 is not set
> # CONFIG_MFD_DLN2 is not set
> # CONFIG_MFD_MC13XXX_SPI is not set
> # CONFIG_MFD_MC13XXX_I2C is not set
> # CONFIG_MFD_MP2629 is not set
> # CONFIG_HTC_PASIC3 is not set
> # CONFIG_HTC_I2CPLD is not set
> # CONFIG_MFD_INTEL_QUARK_I2C_GPIO is not set
> CONFIG_LPC_ICH=3Dy
> CONFIG_LPC_SCH=3Dm
> # CONFIG_INTEL_SOC_PMIC_CHTDC_TI is not set
> CONFIG_MFD_INTEL_LPSS=3Dy
> CONFIG_MFD_INTEL_LPSS_ACPI=3Dy
> CONFIG_MFD_INTEL_LPSS_PCI=3Dy
> # CONFIG_MFD_INTEL_PMC_BXT is not set
> # CONFIG_MFD_INTEL_PMT is not set
> # CONFIG_MFD_IQS62X is not set
> # CONFIG_MFD_JANZ_CMODIO is not set
> # CONFIG_MFD_KEMPLD is not set
> # CONFIG_MFD_88PM800 is not set
> # CONFIG_MFD_88PM805 is not set
> # CONFIG_MFD_88PM860X is not set
> # CONFIG_MFD_MAX14577 is not set
> # CONFIG_MFD_MAX77693 is not set
> # CONFIG_MFD_MAX77843 is not set
> # CONFIG_MFD_MAX8907 is not set
> # CONFIG_MFD_MAX8925 is not set
> # CONFIG_MFD_MAX8997 is not set
> # CONFIG_MFD_MAX8998 is not set
> # CONFIG_MFD_MT6360 is not set
> # CONFIG_MFD_MT6397 is not set
> # CONFIG_MFD_MENF21BMC is not set
> # CONFIG_EZX_PCAP is not set
> # CONFIG_MFD_VIPERBOARD is not set
> # CONFIG_MFD_RETU is not set
> # CONFIG_MFD_PCF50633 is not set
> # CONFIG_MFD_RDC321X is not set
> # CONFIG_MFD_RT4831 is not set
> # CONFIG_MFD_RT5033 is not set
> # CONFIG_MFD_RC5T583 is not set
> # CONFIG_MFD_SI476X_CORE is not set
> CONFIG_MFD_SM501=3Dm
> CONFIG_MFD_SM501_GPIO=3Dy
> # CONFIG_MFD_SKY81452 is not set
> # CONFIG_MFD_SYSCON is not set
> # CONFIG_MFD_TI_AM335X_TSCADC is not set
> # CONFIG_MFD_LP3943 is not set
> # CONFIG_MFD_LP8788 is not set
> # CONFIG_MFD_TI_LMU is not set
> # CONFIG_MFD_PALMAS is not set
> # CONFIG_TPS6105X is not set
> # CONFIG_TPS65010 is not set
> # CONFIG_TPS6507X is not set
> # CONFIG_MFD_TPS65086 is not set
> # CONFIG_MFD_TPS65090 is not set
> # CONFIG_MFD_TI_LP873X is not set
> # CONFIG_MFD_TPS6586X is not set
> # CONFIG_MFD_TPS65910 is not set
> # CONFIG_MFD_TPS65912_I2C is not set
> # CONFIG_MFD_TPS65912_SPI is not set
> # CONFIG_TWL4030_CORE is not set
> # CONFIG_TWL6040_CORE is not set
> # CONFIG_MFD_WL1273_CORE is not set
> # CONFIG_MFD_LM3533 is not set
> # CONFIG_MFD_TQMX86 is not set
> CONFIG_MFD_VX855=3Dm
> # CONFIG_MFD_ARIZONA_I2C is not set
> # CONFIG_MFD_ARIZONA_SPI is not set
> # CONFIG_MFD_WM8400 is not set
> # CONFIG_MFD_WM831X_I2C is not set
> # CONFIG_MFD_WM831X_SPI is not set
> # CONFIG_MFD_WM8350_I2C is not set
> # CONFIG_MFD_WM8994 is not set
> # CONFIG_MFD_ATC260X_I2C is not set
> # CONFIG_MFD_INTEL_M10_BMC is not set
> # end of Multifunction device drivers
> =

> # CONFIG_REGULATOR is not set
> CONFIG_RC_CORE=3Dm
> CONFIG_RC_MAP=3Dm
> CONFIG_LIRC=3Dy
> CONFIG_RC_DECODERS=3Dy
> CONFIG_IR_NEC_DECODER=3Dm
> CONFIG_IR_RC5_DECODER=3Dm
> CONFIG_IR_RC6_DECODER=3Dm
> CONFIG_IR_JVC_DECODER=3Dm
> CONFIG_IR_SONY_DECODER=3Dm
> CONFIG_IR_SANYO_DECODER=3Dm
> # CONFIG_IR_SHARP_DECODER is not set
> CONFIG_IR_MCE_KBD_DECODER=3Dm
> # CONFIG_IR_XMP_DECODER is not set
> CONFIG_IR_IMON_DECODER=3Dm
> # CONFIG_IR_RCMM_DECODER is not set
> CONFIG_RC_DEVICES=3Dy
> # CONFIG_RC_ATI_REMOTE is not set
> CONFIG_IR_ENE=3Dm
> # CONFIG_IR_IMON is not set
> # CONFIG_IR_IMON_RAW is not set
> # CONFIG_IR_MCEUSB is not set
> CONFIG_IR_ITE_CIR=3Dm
> CONFIG_IR_FINTEK=3Dm
> CONFIG_IR_NUVOTON=3Dm
> # CONFIG_IR_REDRAT3 is not set
> # CONFIG_IR_STREAMZAP is not set
> CONFIG_IR_WINBOND_CIR=3Dm
> # CONFIG_IR_IGORPLUGUSB is not set
> # CONFIG_IR_IGUANA is not set
> # CONFIG_IR_TTUSBIR is not set
> # CONFIG_RC_LOOPBACK is not set
> CONFIG_IR_SERIAL=3Dm
> CONFIG_IR_SERIAL_TRANSMITTER=3Dy
> # CONFIG_RC_XBOX_DVD is not set
> # CONFIG_IR_TOY is not set
> =

> #
> # CEC support
> #
> CONFIG_MEDIA_CEC_SUPPORT=3Dy
> # CONFIG_CEC_CH7322 is not set
> # CONFIG_CEC_SECO is not set
> # CONFIG_USB_PULSE8_CEC is not set
> # CONFIG_USB_RAINSHADOW_CEC is not set
> # end of CEC support
> =

> CONFIG_MEDIA_SUPPORT=3Dm
> # CONFIG_MEDIA_SUPPORT_FILTER is not set
> # CONFIG_MEDIA_SUBDRV_AUTOSELECT is not set
> =

> #
> # Media device types
> #
> CONFIG_MEDIA_CAMERA_SUPPORT=3Dy
> CONFIG_MEDIA_ANALOG_TV_SUPPORT=3Dy
> CONFIG_MEDIA_DIGITAL_TV_SUPPORT=3Dy
> CONFIG_MEDIA_RADIO_SUPPORT=3Dy
> CONFIG_MEDIA_SDR_SUPPORT=3Dy
> CONFIG_MEDIA_PLATFORM_SUPPORT=3Dy
> CONFIG_MEDIA_TEST_SUPPORT=3Dy
> # end of Media device types
> =

> #
> # Media core support
> #
> CONFIG_VIDEO_DEV=3Dm
> CONFIG_MEDIA_CONTROLLER=3Dy
> CONFIG_DVB_CORE=3Dm
> # end of Media core support
> =

> #
> # Video4Linux options
> #
> CONFIG_VIDEO_V4L2=3Dm
> CONFIG_VIDEO_V4L2_I2C=3Dy
> CONFIG_VIDEO_V4L2_SUBDEV_API=3Dy
> # CONFIG_VIDEO_ADV_DEBUG is not set
> # CONFIG_VIDEO_FIXED_MINOR_RANGES is not set
> # end of Video4Linux options
> =

> #
> # Media controller options
> #
> # CONFIG_MEDIA_CONTROLLER_DVB is not set
> # end of Media controller options
> =

> #
> # Digital TV options
> #
> # CONFIG_DVB_MMAP is not set
> CONFIG_DVB_NET=3Dy
> CONFIG_DVB_MAX_ADAPTERS=3D16
> CONFIG_DVB_DYNAMIC_MINORS=3Dy
> # CONFIG_DVB_DEMUX_SECTION_LOSS_LOG is not set
> # CONFIG_DVB_ULE_DEBUG is not set
> # end of Digital TV options
> =

> #
> # Media drivers
> #
> # CONFIG_MEDIA_USB_SUPPORT is not set
> # CONFIG_MEDIA_PCI_SUPPORT is not set
> CONFIG_RADIO_ADAPTERS=3Dy
> # CONFIG_RADIO_SI470X is not set
> # CONFIG_RADIO_SI4713 is not set
> # CONFIG_USB_MR800 is not set
> # CONFIG_USB_DSBR is not set
> # CONFIG_RADIO_MAXIRADIO is not set
> # CONFIG_RADIO_SHARK is not set
> # CONFIG_RADIO_SHARK2 is not set
> # CONFIG_USB_KEENE is not set
> # CONFIG_USB_RAREMONO is not set
> # CONFIG_USB_MA901 is not set
> # CONFIG_RADIO_TEA5764 is not set
> # CONFIG_RADIO_SAA7706H is not set
> # CONFIG_RADIO_TEF6862 is not set
> # CONFIG_RADIO_WL1273 is not set
> CONFIG_VIDEOBUF2_CORE=3Dm
> CONFIG_VIDEOBUF2_V4L2=3Dm
> CONFIG_VIDEOBUF2_MEMOPS=3Dm
> CONFIG_VIDEOBUF2_VMALLOC=3Dm
> # CONFIG_V4L_PLATFORM_DRIVERS is not set
> # CONFIG_V4L_MEM2MEM_DRIVERS is not set
> # CONFIG_DVB_PLATFORM_DRIVERS is not set
> # CONFIG_SDR_PLATFORM_DRIVERS is not set
> =

> #
> # MMC/SDIO DVB adapters
> #
> # CONFIG_SMS_SDIO_DRV is not set
> # CONFIG_V4L_TEST_DRIVERS is not set
> # CONFIG_DVB_TEST_DRIVERS is not set
> =

> #
> # FireWire (IEEE 1394) Adapters
> #
> # CONFIG_DVB_FIREDTV is not set
> # end of Media drivers
> =

> #
> # Media ancillary drivers
> #
> CONFIG_MEDIA_ATTACH=3Dy
> CONFIG_VIDEO_IR_I2C=3Dm
> =

> #
> # Audio decoders, processors and mixers
> #
> # CONFIG_VIDEO_TVAUDIO is not set
> # CONFIG_VIDEO_TDA7432 is not set
> # CONFIG_VIDEO_TDA9840 is not set
> # CONFIG_VIDEO_TEA6415C is not set
> # CONFIG_VIDEO_TEA6420 is not set
> # CONFIG_VIDEO_MSP3400 is not set
> # CONFIG_VIDEO_CS3308 is not set
> # CONFIG_VIDEO_CS5345 is not set
> # CONFIG_VIDEO_CS53L32A is not set
> # CONFIG_VIDEO_TLV320AIC23B is not set
> # CONFIG_VIDEO_UDA1342 is not set
> # CONFIG_VIDEO_WM8775 is not set
> # CONFIG_VIDEO_WM8739 is not set
> # CONFIG_VIDEO_VP27SMPX is not set
> # CONFIG_VIDEO_SONY_BTF_MPX is not set
> # end of Audio decoders, processors and mixers
> =

> #
> # RDS decoders
> #
> # CONFIG_VIDEO_SAA6588 is not set
> # end of RDS decoders
> =

> #
> # Video decoders
> #
> # CONFIG_VIDEO_ADV7180 is not set
> # CONFIG_VIDEO_ADV7183 is not set
> # CONFIG_VIDEO_ADV7604 is not set
> # CONFIG_VIDEO_ADV7842 is not set
> # CONFIG_VIDEO_BT819 is not set
> # CONFIG_VIDEO_BT856 is not set
> # CONFIG_VIDEO_BT866 is not set
> # CONFIG_VIDEO_KS0127 is not set
> # CONFIG_VIDEO_ML86V7667 is not set
> # CONFIG_VIDEO_SAA7110 is not set
> # CONFIG_VIDEO_SAA711X is not set
> # CONFIG_VIDEO_TC358743 is not set
> # CONFIG_VIDEO_TVP514X is not set
> # CONFIG_VIDEO_TVP5150 is not set
> # CONFIG_VIDEO_TVP7002 is not set
> # CONFIG_VIDEO_TW2804 is not set
> # CONFIG_VIDEO_TW9903 is not set
> # CONFIG_VIDEO_TW9906 is not set
> # CONFIG_VIDEO_TW9910 is not set
> # CONFIG_VIDEO_VPX3220 is not set
> =

> #
> # Video and audio decoders
> #
> # CONFIG_VIDEO_SAA717X is not set
> # CONFIG_VIDEO_CX25840 is not set
> # end of Video decoders
> =

> #
> # Video encoders
> #
> # CONFIG_VIDEO_SAA7127 is not set
> # CONFIG_VIDEO_SAA7185 is not set
> # CONFIG_VIDEO_ADV7170 is not set
> # CONFIG_VIDEO_ADV7175 is not set
> # CONFIG_VIDEO_ADV7343 is not set
> # CONFIG_VIDEO_ADV7393 is not set
> # CONFIG_VIDEO_ADV7511 is not set
> # CONFIG_VIDEO_AD9389B is not set
> # CONFIG_VIDEO_AK881X is not set
> # CONFIG_VIDEO_THS8200 is not set
> # end of Video encoders
> =

> #
> # Video improvement chips
> #
> # CONFIG_VIDEO_UPD64031A is not set
> # CONFIG_VIDEO_UPD64083 is not set
> # end of Video improvement chips
> =

> #
> # Audio/Video compression chips
> #
> # CONFIG_VIDEO_SAA6752HS is not set
> # end of Audio/Video compression chips
> =

> #
> # SDR tuner chips
> #
> # CONFIG_SDR_MAX2175 is not set
> # end of SDR tuner chips
> =

> #
> # Miscellaneous helper chips
> #
> # CONFIG_VIDEO_THS7303 is not set
> # CONFIG_VIDEO_M52790 is not set
> # CONFIG_VIDEO_I2C is not set
> # CONFIG_VIDEO_ST_MIPID02 is not set
> # end of Miscellaneous helper chips
> =

> #
> # Camera sensor devices
> #
> # CONFIG_VIDEO_HI556 is not set
> # CONFIG_VIDEO_HI846 is not set
> # CONFIG_VIDEO_IMX208 is not set
> # CONFIG_VIDEO_IMX214 is not set
> # CONFIG_VIDEO_IMX219 is not set
> # CONFIG_VIDEO_IMX258 is not set
> # CONFIG_VIDEO_IMX274 is not set
> # CONFIG_VIDEO_IMX290 is not set
> # CONFIG_VIDEO_IMX319 is not set
> # CONFIG_VIDEO_IMX355 is not set
> # CONFIG_VIDEO_OV02A10 is not set
> # CONFIG_VIDEO_OV2640 is not set
> # CONFIG_VIDEO_OV2659 is not set
> # CONFIG_VIDEO_OV2680 is not set
> # CONFIG_VIDEO_OV2685 is not set
> # CONFIG_VIDEO_OV2740 is not set
> # CONFIG_VIDEO_OV5647 is not set
> # CONFIG_VIDEO_OV5648 is not set
> # CONFIG_VIDEO_OV6650 is not set
> # CONFIG_VIDEO_OV5670 is not set
> # CONFIG_VIDEO_OV5675 is not set
> # CONFIG_VIDEO_OV5695 is not set
> # CONFIG_VIDEO_OV7251 is not set
> # CONFIG_VIDEO_OV772X is not set
> # CONFIG_VIDEO_OV7640 is not set
> # CONFIG_VIDEO_OV7670 is not set
> # CONFIG_VIDEO_OV7740 is not set
> # CONFIG_VIDEO_OV8856 is not set
> # CONFIG_VIDEO_OV8865 is not set
> # CONFIG_VIDEO_OV9640 is not set
> # CONFIG_VIDEO_OV9650 is not set
> # CONFIG_VIDEO_OV9734 is not set
> # CONFIG_VIDEO_OV13858 is not set
> # CONFIG_VIDEO_OV13B10 is not set
> # CONFIG_VIDEO_VS6624 is not set
> # CONFIG_VIDEO_MT9M001 is not set
> # CONFIG_VIDEO_MT9M032 is not set
> # CONFIG_VIDEO_MT9M111 is not set
> # CONFIG_VIDEO_MT9P031 is not set
> # CONFIG_VIDEO_MT9T001 is not set
> # CONFIG_VIDEO_MT9T112 is not set
> # CONFIG_VIDEO_MT9V011 is not set
> # CONFIG_VIDEO_MT9V032 is not set
> # CONFIG_VIDEO_MT9V111 is not set
> # CONFIG_VIDEO_SR030PC30 is not set
> # CONFIG_VIDEO_NOON010PC30 is not set
> # CONFIG_VIDEO_M5MOLS is not set
> # CONFIG_VIDEO_RDACM20 is not set
> # CONFIG_VIDEO_RDACM21 is not set
> # CONFIG_VIDEO_RJ54N1 is not set
> # CONFIG_VIDEO_S5K6AA is not set
> # CONFIG_VIDEO_S5K6A3 is not set
> # CONFIG_VIDEO_S5K4ECGX is not set
> # CONFIG_VIDEO_S5K5BAF is not set
> # CONFIG_VIDEO_CCS is not set
> # CONFIG_VIDEO_ET8EK8 is not set
> # CONFIG_VIDEO_S5C73M3 is not set
> # end of Camera sensor devices
> =

> #
> # Lens drivers
> #
> # CONFIG_VIDEO_AD5820 is not set
> # CONFIG_VIDEO_AK7375 is not set
> # CONFIG_VIDEO_DW9714 is not set
> # CONFIG_VIDEO_DW9768 is not set
> # CONFIG_VIDEO_DW9807_VCM is not set
> # end of Lens drivers
> =

> #
> # Flash devices
> #
> # CONFIG_VIDEO_ADP1653 is not set
> # CONFIG_VIDEO_LM3560 is not set
> # CONFIG_VIDEO_LM3646 is not set
> # end of Flash devices
> =

> #
> # SPI helper chips
> #
> # CONFIG_VIDEO_GS1662 is not set
> # end of SPI helper chips
> =

> #
> # Media SPI Adapters
> #
> CONFIG_CXD2880_SPI_DRV=3Dm
> # end of Media SPI Adapters
> =

> CONFIG_MEDIA_TUNER=3Dm
> =

> #
> # Customize TV tuners
> #
> CONFIG_MEDIA_TUNER_SIMPLE=3Dm
> CONFIG_MEDIA_TUNER_TDA18250=3Dm
> CONFIG_MEDIA_TUNER_TDA8290=3Dm
> CONFIG_MEDIA_TUNER_TDA827X=3Dm
> CONFIG_MEDIA_TUNER_TDA18271=3Dm
> CONFIG_MEDIA_TUNER_TDA9887=3Dm
> CONFIG_MEDIA_TUNER_TEA5761=3Dm
> CONFIG_MEDIA_TUNER_TEA5767=3Dm
> CONFIG_MEDIA_TUNER_MSI001=3Dm
> CONFIG_MEDIA_TUNER_MT20XX=3Dm
> CONFIG_MEDIA_TUNER_MT2060=3Dm
> CONFIG_MEDIA_TUNER_MT2063=3Dm
> CONFIG_MEDIA_TUNER_MT2266=3Dm
> CONFIG_MEDIA_TUNER_MT2131=3Dm
> CONFIG_MEDIA_TUNER_QT1010=3Dm
> CONFIG_MEDIA_TUNER_XC2028=3Dm
> CONFIG_MEDIA_TUNER_XC5000=3Dm
> CONFIG_MEDIA_TUNER_XC4000=3Dm
> CONFIG_MEDIA_TUNER_MXL5005S=3Dm
> CONFIG_MEDIA_TUNER_MXL5007T=3Dm
> CONFIG_MEDIA_TUNER_MC44S803=3Dm
> CONFIG_MEDIA_TUNER_MAX2165=3Dm
> CONFIG_MEDIA_TUNER_TDA18218=3Dm
> CONFIG_MEDIA_TUNER_FC0011=3Dm
> CONFIG_MEDIA_TUNER_FC0012=3Dm
> CONFIG_MEDIA_TUNER_FC0013=3Dm
> CONFIG_MEDIA_TUNER_TDA18212=3Dm
> CONFIG_MEDIA_TUNER_E4000=3Dm
> CONFIG_MEDIA_TUNER_FC2580=3Dm
> CONFIG_MEDIA_TUNER_M88RS6000T=3Dm
> CONFIG_MEDIA_TUNER_TUA9001=3Dm
> CONFIG_MEDIA_TUNER_SI2157=3Dm
> CONFIG_MEDIA_TUNER_IT913X=3Dm
> CONFIG_MEDIA_TUNER_R820T=3Dm
> CONFIG_MEDIA_TUNER_MXL301RF=3Dm
> CONFIG_MEDIA_TUNER_QM1D1C0042=3Dm
> CONFIG_MEDIA_TUNER_QM1D1B0004=3Dm
> # end of Customize TV tuners
> =

> #
> # Customise DVB Frontends
> #
> =

> #
> # Multistandard (satellite) frontends
> #
> CONFIG_DVB_STB0899=3Dm
> CONFIG_DVB_STB6100=3Dm
> CONFIG_DVB_STV090x=3Dm
> CONFIG_DVB_STV0910=3Dm
> CONFIG_DVB_STV6110x=3Dm
> CONFIG_DVB_STV6111=3Dm
> CONFIG_DVB_MXL5XX=3Dm
> CONFIG_DVB_M88DS3103=3Dm
> =

> #
> # Multistandard (cable + terrestrial) frontends
> #
> CONFIG_DVB_DRXK=3Dm
> CONFIG_DVB_TDA18271C2DD=3Dm
> CONFIG_DVB_SI2165=3Dm
> CONFIG_DVB_MN88472=3Dm
> CONFIG_DVB_MN88473=3Dm
> =

> #
> # DVB-S (satellite) frontends
> #
> CONFIG_DVB_CX24110=3Dm
> CONFIG_DVB_CX24123=3Dm
> CONFIG_DVB_MT312=3Dm
> CONFIG_DVB_ZL10036=3Dm
> CONFIG_DVB_ZL10039=3Dm
> CONFIG_DVB_S5H1420=3Dm
> CONFIG_DVB_STV0288=3Dm
> CONFIG_DVB_STB6000=3Dm
> CONFIG_DVB_STV0299=3Dm
> CONFIG_DVB_STV6110=3Dm
> CONFIG_DVB_STV0900=3Dm
> CONFIG_DVB_TDA8083=3Dm
> CONFIG_DVB_TDA10086=3Dm
> CONFIG_DVB_TDA8261=3Dm
> CONFIG_DVB_VES1X93=3Dm
> CONFIG_DVB_TUNER_ITD1000=3Dm
> CONFIG_DVB_TUNER_CX24113=3Dm
> CONFIG_DVB_TDA826X=3Dm
> CONFIG_DVB_TUA6100=3Dm
> CONFIG_DVB_CX24116=3Dm
> CONFIG_DVB_CX24117=3Dm
> CONFIG_DVB_CX24120=3Dm
> CONFIG_DVB_SI21XX=3Dm
> CONFIG_DVB_TS2020=3Dm
> CONFIG_DVB_DS3000=3Dm
> CONFIG_DVB_MB86A16=3Dm
> CONFIG_DVB_TDA10071=3Dm
> =

> #
> # DVB-T (terrestrial) frontends
> #
> CONFIG_DVB_SP887X=3Dm
> CONFIG_DVB_CX22700=3Dm
> CONFIG_DVB_CX22702=3Dm
> CONFIG_DVB_S5H1432=3Dm
> CONFIG_DVB_DRXD=3Dm
> CONFIG_DVB_L64781=3Dm
> CONFIG_DVB_TDA1004X=3Dm
> CONFIG_DVB_NXT6000=3Dm
> CONFIG_DVB_MT352=3Dm
> CONFIG_DVB_ZL10353=3Dm
> CONFIG_DVB_DIB3000MB=3Dm
> CONFIG_DVB_DIB3000MC=3Dm
> CONFIG_DVB_DIB7000M=3Dm
> CONFIG_DVB_DIB7000P=3Dm
> CONFIG_DVB_DIB9000=3Dm
> CONFIG_DVB_TDA10048=3Dm
> CONFIG_DVB_AF9013=3Dm
> CONFIG_DVB_EC100=3Dm
> CONFIG_DVB_STV0367=3Dm
> CONFIG_DVB_CXD2820R=3Dm
> CONFIG_DVB_CXD2841ER=3Dm
> CONFIG_DVB_RTL2830=3Dm
> CONFIG_DVB_RTL2832=3Dm
> CONFIG_DVB_RTL2832_SDR=3Dm
> CONFIG_DVB_SI2168=3Dm
> CONFIG_DVB_ZD1301_DEMOD=3Dm
> CONFIG_DVB_CXD2880=3Dm
> =

> #
> # DVB-C (cable) frontends
> #
> CONFIG_DVB_VES1820=3Dm
> CONFIG_DVB_TDA10021=3Dm
> CONFIG_DVB_TDA10023=3Dm
> CONFIG_DVB_STV0297=3Dm
> =

> #
> # ATSC (North American/Korean Terrestrial/Cable DTV) frontends
> #
> CONFIG_DVB_NXT200X=3Dm
> CONFIG_DVB_OR51211=3Dm
> CONFIG_DVB_OR51132=3Dm
> CONFIG_DVB_BCM3510=3Dm
> CONFIG_DVB_LGDT330X=3Dm
> CONFIG_DVB_LGDT3305=3Dm
> CONFIG_DVB_LGDT3306A=3Dm
> CONFIG_DVB_LG2160=3Dm
> CONFIG_DVB_S5H1409=3Dm
> CONFIG_DVB_AU8522=3Dm
> CONFIG_DVB_AU8522_DTV=3Dm
> CONFIG_DVB_AU8522_V4L=3Dm
> CONFIG_DVB_S5H1411=3Dm
> CONFIG_DVB_MXL692=3Dm
> =

> #
> # ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_S921=3Dm
> CONFIG_DVB_DIB8000=3Dm
> CONFIG_DVB_MB86A20S=3Dm
> =

> #
> # ISDB-S (satellite) & ISDB-T (terrestrial) frontends
> #
> CONFIG_DVB_TC90522=3Dm
> CONFIG_DVB_MN88443X=3Dm
> =

> #
> # Digital terrestrial only tuners/PLL
> #
> CONFIG_DVB_PLL=3Dm
> CONFIG_DVB_TUNER_DIB0070=3Dm
> CONFIG_DVB_TUNER_DIB0090=3Dm
> =

> #
> # SEC control devices for DVB-S
> #
> CONFIG_DVB_DRX39XYJ=3Dm
> CONFIG_DVB_LNBH25=3Dm
> CONFIG_DVB_LNBH29=3Dm
> CONFIG_DVB_LNBP21=3Dm
> CONFIG_DVB_LNBP22=3Dm
> CONFIG_DVB_ISL6405=3Dm
> CONFIG_DVB_ISL6421=3Dm
> CONFIG_DVB_ISL6423=3Dm
> CONFIG_DVB_A8293=3Dm
> CONFIG_DVB_LGS8GL5=3Dm
> CONFIG_DVB_LGS8GXX=3Dm
> CONFIG_DVB_ATBM8830=3Dm
> CONFIG_DVB_TDA665x=3Dm
> CONFIG_DVB_IX2505V=3Dm
> CONFIG_DVB_M88RS2000=3Dm
> CONFIG_DVB_AF9033=3Dm
> CONFIG_DVB_HORUS3A=3Dm
> CONFIG_DVB_ASCOT2E=3Dm
> CONFIG_DVB_HELENE=3Dm
> =

> #
> # Common Interface (EN50221) controller drivers
> #
> CONFIG_DVB_CXD2099=3Dm
> CONFIG_DVB_SP2=3Dm
> # end of Customise DVB Frontends
> =

> #
> # Tools to develop new frontends
> #
> # CONFIG_DVB_DUMMY_FE is not set
> # end of Media ancillary drivers
> =

> #
> # Graphics support
> #
> # CONFIG_AGP is not set
> CONFIG_INTEL_GTT=3Dm
> CONFIG_VGA_ARB=3Dy
> CONFIG_VGA_ARB_MAX_GPUS=3D64
> CONFIG_VGA_SWITCHEROO=3Dy
> CONFIG_DRM=3Dm
> CONFIG_DRM_MIPI_DSI=3Dy
> CONFIG_DRM_DP_AUX_CHARDEV=3Dy
> # CONFIG_DRM_DEBUG_SELFTEST is not set
> CONFIG_DRM_KMS_HELPER=3Dm
> CONFIG_DRM_FBDEV_EMULATION=3Dy
> CONFIG_DRM_FBDEV_OVERALLOC=3D100
> CONFIG_DRM_LOAD_EDID_FIRMWARE=3Dy
> # CONFIG_DRM_DP_CEC is not set
> CONFIG_DRM_TTM=3Dm
> CONFIG_DRM_VRAM_HELPER=3Dm
> CONFIG_DRM_TTM_HELPER=3Dm
> CONFIG_DRM_GEM_SHMEM_HELPER=3Dy
> =

> #
> # I2C encoder or helper chips
> #
> CONFIG_DRM_I2C_CH7006=3Dm
> CONFIG_DRM_I2C_SIL164=3Dm
> # CONFIG_DRM_I2C_NXP_TDA998X is not set
> # CONFIG_DRM_I2C_NXP_TDA9950 is not set
> # end of I2C encoder or helper chips
> =

> #
> # ARM devices
> #
> # end of ARM devices
> =

> # CONFIG_DRM_RADEON is not set
> # CONFIG_DRM_AMDGPU is not set
> # CONFIG_DRM_NOUVEAU is not set
> CONFIG_DRM_I915=3Dm
> CONFIG_DRM_I915_FORCE_PROBE=3D""
> CONFIG_DRM_I915_CAPTURE_ERROR=3Dy
> CONFIG_DRM_I915_COMPRESS_ERROR=3Dy
> CONFIG_DRM_I915_USERPTR=3Dy
> CONFIG_DRM_I915_GVT=3Dy
> # CONFIG_DRM_I915_GVT_KVMGT is not set
> CONFIG_DRM_I915_REQUEST_TIMEOUT=3D20000
> CONFIG_DRM_I915_FENCE_TIMEOUT=3D10000
> CONFIG_DRM_I915_USERFAULT_AUTOSUSPEND=3D250
> CONFIG_DRM_I915_HEARTBEAT_INTERVAL=3D2500
> CONFIG_DRM_I915_PREEMPT_TIMEOUT=3D640
> CONFIG_DRM_I915_MAX_REQUEST_BUSYWAIT=3D8000
> CONFIG_DRM_I915_STOP_TIMEOUT=3D100
> CONFIG_DRM_I915_TIMESLICE_DURATION=3D1
> # CONFIG_DRM_VGEM is not set
> # CONFIG_DRM_VKMS is not set
> # CONFIG_DRM_VMWGFX is not set
> CONFIG_DRM_GMA500=3Dm
> # CONFIG_DRM_UDL is not set
> CONFIG_DRM_AST=3Dm
> CONFIG_DRM_MGAG200=3Dm
> CONFIG_DRM_QXL=3Dm
> CONFIG_DRM_VIRTIO_GPU=3Dm
> CONFIG_DRM_PANEL=3Dy
> =

> #
> # Display Panels
> #
> # CONFIG_DRM_PANEL_RASPBERRYPI_TOUCHSCREEN is not set
> # CONFIG_DRM_PANEL_WIDECHIPS_WS2401 is not set
> # end of Display Panels
> =

> CONFIG_DRM_BRIDGE=3Dy
> CONFIG_DRM_PANEL_BRIDGE=3Dy
> =

> #
> # Display Interface Bridges
> #
> # CONFIG_DRM_ANALOGIX_ANX78XX is not set
> # end of Display Interface Bridges
> =

> # CONFIG_DRM_ETNAVIV is not set
> CONFIG_DRM_BOCHS=3Dm
> CONFIG_DRM_CIRRUS_QEMU=3Dm
> # CONFIG_DRM_GM12U320 is not set
> # CONFIG_DRM_SIMPLEDRM is not set
> # CONFIG_TINYDRM_HX8357D is not set
> # CONFIG_TINYDRM_ILI9225 is not set
> # CONFIG_TINYDRM_ILI9341 is not set
> # CONFIG_TINYDRM_ILI9486 is not set
> # CONFIG_TINYDRM_MI0283QT is not set
> # CONFIG_TINYDRM_REPAPER is not set
> # CONFIG_TINYDRM_ST7586 is not set
> # CONFIG_TINYDRM_ST7735R is not set
> # CONFIG_DRM_VBOXVIDEO is not set
> # CONFIG_DRM_GUD is not set
> # CONFIG_DRM_HYPERV is not set
> # CONFIG_DRM_LEGACY is not set
> CONFIG_DRM_PANEL_ORIENTATION_QUIRKS=3Dy
> =

> #
> # Frame buffer Devices
> #
> CONFIG_FB_CMDLINE=3Dy
> CONFIG_FB_NOTIFY=3Dy
> CONFIG_FB=3Dy
> # CONFIG_FIRMWARE_EDID is not set
> CONFIG_FB_BOOT_VESA_SUPPORT=3Dy
> CONFIG_FB_CFB_FILLRECT=3Dy
> CONFIG_FB_CFB_COPYAREA=3Dy
> CONFIG_FB_CFB_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FILLRECT=3Dm
> CONFIG_FB_SYS_COPYAREA=3Dm
> CONFIG_FB_SYS_IMAGEBLIT=3Dm
> # CONFIG_FB_FOREIGN_ENDIAN is not set
> CONFIG_FB_SYS_FOPS=3Dm
> CONFIG_FB_DEFERRED_IO=3Dy
> # CONFIG_FB_MODE_HELPERS is not set
> CONFIG_FB_TILEBLITTING=3Dy
> =

> #
> # Frame buffer hardware drivers
> #
> # CONFIG_FB_CIRRUS is not set
> # CONFIG_FB_PM2 is not set
> # CONFIG_FB_CYBER2000 is not set
> # CONFIG_FB_ARC is not set
> # CONFIG_FB_ASILIANT is not set
> # CONFIG_FB_IMSTT is not set
> # CONFIG_FB_VGA16 is not set
> # CONFIG_FB_UVESA is not set
> CONFIG_FB_VESA=3Dy
> CONFIG_FB_EFI=3Dy
> # CONFIG_FB_N411 is not set
> # CONFIG_FB_HGA is not set
> # CONFIG_FB_OPENCORES is not set
> # CONFIG_FB_S1D13XXX is not set
> # CONFIG_FB_NVIDIA is not set
> # CONFIG_FB_RIVA is not set
> # CONFIG_FB_I740 is not set
> # CONFIG_FB_LE80578 is not set
> # CONFIG_FB_MATROX is not set
> # CONFIG_FB_RADEON is not set
> # CONFIG_FB_ATY128 is not set
> # CONFIG_FB_ATY is not set
> # CONFIG_FB_S3 is not set
> # CONFIG_FB_SAVAGE is not set
> # CONFIG_FB_SIS is not set
> # CONFIG_FB_VIA is not set
> # CONFIG_FB_NEOMAGIC is not set
> # CONFIG_FB_KYRO is not set
> # CONFIG_FB_3DFX is not set
> # CONFIG_FB_VOODOO1 is not set
> # CONFIG_FB_VT8623 is not set
> # CONFIG_FB_TRIDENT is not set
> # CONFIG_FB_ARK is not set
> # CONFIG_FB_PM3 is not set
> # CONFIG_FB_CARMINE is not set
> # CONFIG_FB_SM501 is not set
> # CONFIG_FB_SMSCUFX is not set
> # CONFIG_FB_UDL is not set
> # CONFIG_FB_IBM_GXT4500 is not set
> # CONFIG_FB_VIRTUAL is not set
> # CONFIG_FB_METRONOME is not set
> # CONFIG_FB_MB862XX is not set
> CONFIG_FB_HYPERV=3Dm
> # CONFIG_FB_SIMPLE is not set
> # CONFIG_FB_SSD1307 is not set
> # CONFIG_FB_SM712 is not set
> # end of Frame buffer Devices
> =

> #
> # Backlight & LCD device support
> #
> CONFIG_LCD_CLASS_DEVICE=3Dm
> # CONFIG_LCD_L4F00242T03 is not set
> # CONFIG_LCD_LMS283GF05 is not set
> # CONFIG_LCD_LTV350QV is not set
> # CONFIG_LCD_ILI922X is not set
> # CONFIG_LCD_ILI9320 is not set
> # CONFIG_LCD_TDO24M is not set
> # CONFIG_LCD_VGG2432A4 is not set
> CONFIG_LCD_PLATFORM=3Dm
> # CONFIG_LCD_AMS369FG06 is not set
> # CONFIG_LCD_LMS501KF03 is not set
> # CONFIG_LCD_HX8357 is not set
> # CONFIG_LCD_OTM3225A is not set
> CONFIG_BACKLIGHT_CLASS_DEVICE=3Dy
> # CONFIG_BACKLIGHT_KTD253 is not set
> # CONFIG_BACKLIGHT_PWM is not set
> CONFIG_BACKLIGHT_APPLE=3Dm
> # CONFIG_BACKLIGHT_QCOM_WLED is not set
> # CONFIG_BACKLIGHT_SAHARA is not set
> # CONFIG_BACKLIGHT_ADP8860 is not set
> # CONFIG_BACKLIGHT_ADP8870 is not set
> # CONFIG_BACKLIGHT_LM3630A is not set
> # CONFIG_BACKLIGHT_LM3639 is not set
> CONFIG_BACKLIGHT_LP855X=3Dm
> # CONFIG_BACKLIGHT_GPIO is not set
> # CONFIG_BACKLIGHT_LV5207LP is not set
> # CONFIG_BACKLIGHT_BD6107 is not set
> # CONFIG_BACKLIGHT_ARCXCNN is not set
> # end of Backlight & LCD device support
> =

> CONFIG_HDMI=3Dy
> =

> #
> # Console display driver support
> #
> CONFIG_VGA_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE=3Dy
> CONFIG_DUMMY_CONSOLE_COLUMNS=3D80
> CONFIG_DUMMY_CONSOLE_ROWS=3D25
> CONFIG_FRAMEBUFFER_CONSOLE=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_DETECT_PRIMARY=3Dy
> CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=3Dy
> # CONFIG_FRAMEBUFFER_CONSOLE_DEFERRED_TAKEOVER is not set
> # end of Console display driver support
> =

> CONFIG_LOGO=3Dy
> # CONFIG_LOGO_LINUX_MONO is not set
> # CONFIG_LOGO_LINUX_VGA16 is not set
> CONFIG_LOGO_LINUX_CLUT224=3Dy
> # end of Graphics support
> =

> # CONFIG_SOUND is not set
> =

> #
> # HID support
> #
> CONFIG_HID=3Dy
> CONFIG_HID_BATTERY_STRENGTH=3Dy
> CONFIG_HIDRAW=3Dy
> CONFIG_UHID=3Dm
> CONFIG_HID_GENERIC=3Dy
> =

> #
> # Special HID drivers
> #
> CONFIG_HID_A4TECH=3Dm
> # CONFIG_HID_ACCUTOUCH is not set
> CONFIG_HID_ACRUX=3Dm
> # CONFIG_HID_ACRUX_FF is not set
> CONFIG_HID_APPLE=3Dm
> # CONFIG_HID_APPLEIR is not set
> CONFIG_HID_ASUS=3Dm
> CONFIG_HID_AUREAL=3Dm
> CONFIG_HID_BELKIN=3Dm
> # CONFIG_HID_BETOP_FF is not set
> # CONFIG_HID_BIGBEN_FF is not set
> CONFIG_HID_CHERRY=3Dm
> # CONFIG_HID_CHICONY is not set
> # CONFIG_HID_CORSAIR is not set
> # CONFIG_HID_COUGAR is not set
> # CONFIG_HID_MACALLY is not set
> CONFIG_HID_CMEDIA=3Dm
> # CONFIG_HID_CP2112 is not set
> # CONFIG_HID_CREATIVE_SB0540 is not set
> CONFIG_HID_CYPRESS=3Dm
> CONFIG_HID_DRAGONRISE=3Dm
> # CONFIG_DRAGONRISE_FF is not set
> # CONFIG_HID_EMS_FF is not set
> # CONFIG_HID_ELAN is not set
> CONFIG_HID_ELECOM=3Dm
> # CONFIG_HID_ELO is not set
> CONFIG_HID_EZKEY=3Dm
> # CONFIG_HID_FT260 is not set
> CONFIG_HID_GEMBIRD=3Dm
> CONFIG_HID_GFRM=3Dm
> # CONFIG_HID_GLORIOUS is not set
> # CONFIG_HID_HOLTEK is not set
> # CONFIG_HID_VIVALDI is not set
> # CONFIG_HID_GT683R is not set
> CONFIG_HID_KEYTOUCH=3Dm
> CONFIG_HID_KYE=3Dm
> # CONFIG_HID_UCLOGIC is not set
> CONFIG_HID_WALTOP=3Dm
> # CONFIG_HID_VIEWSONIC is not set
> # CONFIG_HID_XIAOMI is not set
> CONFIG_HID_GYRATION=3Dm
> CONFIG_HID_ICADE=3Dm
> CONFIG_HID_ITE=3Dm
> CONFIG_HID_JABRA=3Dm
> CONFIG_HID_TWINHAN=3Dm
> CONFIG_HID_KENSINGTON=3Dm
> CONFIG_HID_LCPOWER=3Dm
> CONFIG_HID_LED=3Dm
> CONFIG_HID_LENOVO=3Dm
> CONFIG_HID_LOGITECH=3Dm
> CONFIG_HID_LOGITECH_DJ=3Dm
> CONFIG_HID_LOGITECH_HIDPP=3Dm
> # CONFIG_LOGITECH_FF is not set
> # CONFIG_LOGIRUMBLEPAD2_FF is not set
> # CONFIG_LOGIG940_FF is not set
> # CONFIG_LOGIWHEELS_FF is not set
> CONFIG_HID_MAGICMOUSE=3Dy
> # CONFIG_HID_MALTRON is not set
> # CONFIG_HID_MAYFLASH is not set
> # CONFIG_HID_REDRAGON is not set
> CONFIG_HID_MICROSOFT=3Dm
> CONFIG_HID_MONTEREY=3Dm
> CONFIG_HID_MULTITOUCH=3Dm
> # CONFIG_HID_NINTENDO is not set
> CONFIG_HID_NTI=3Dm
> # CONFIG_HID_NTRIG is not set
> CONFIG_HID_ORTEK=3Dm
> CONFIG_HID_PANTHERLORD=3Dm
> # CONFIG_PANTHERLORD_FF is not set
> # CONFIG_HID_PENMOUNT is not set
> CONFIG_HID_PETALYNX=3Dm
> CONFIG_HID_PICOLCD=3Dm
> CONFIG_HID_PICOLCD_FB=3Dy
> CONFIG_HID_PICOLCD_BACKLIGHT=3Dy
> CONFIG_HID_PICOLCD_LCD=3Dy
> CONFIG_HID_PICOLCD_LEDS=3Dy
> CONFIG_HID_PICOLCD_CIR=3Dy
> CONFIG_HID_PLANTRONICS=3Dm
> CONFIG_HID_PRIMAX=3Dm
> # CONFIG_HID_RETRODE is not set
> # CONFIG_HID_ROCCAT is not set
> CONFIG_HID_SAITEK=3Dm
> CONFIG_HID_SAMSUNG=3Dm
> # CONFIG_HID_SEMITEK is not set
> # CONFIG_HID_SONY is not set
> CONFIG_HID_SPEEDLINK=3Dm
> # CONFIG_HID_STEAM is not set
> CONFIG_HID_STEELSERIES=3Dm
> CONFIG_HID_SUNPLUS=3Dm
> CONFIG_HID_RMI=3Dm
> CONFIG_HID_GREENASIA=3Dm
> # CONFIG_GREENASIA_FF is not set
> CONFIG_HID_HYPERV_MOUSE=3Dm
> CONFIG_HID_SMARTJOYPLUS=3Dm
> # CONFIG_SMARTJOYPLUS_FF is not set
> CONFIG_HID_TIVO=3Dm
> CONFIG_HID_TOPSEED=3Dm
> CONFIG_HID_THINGM=3Dm
> CONFIG_HID_THRUSTMASTER=3Dm
> # CONFIG_THRUSTMASTER_FF is not set
> # CONFIG_HID_UDRAW_PS3 is not set
> # CONFIG_HID_U2FZERO is not set
> # CONFIG_HID_WACOM is not set
> CONFIG_HID_WIIMOTE=3Dm
> CONFIG_HID_XINMO=3Dm
> CONFIG_HID_ZEROPLUS=3Dm
> # CONFIG_ZEROPLUS_FF is not set
> CONFIG_HID_ZYDACRON=3Dm
> CONFIG_HID_SENSOR_HUB=3Dy
> CONFIG_HID_SENSOR_CUSTOM_SENSOR=3Dm
> CONFIG_HID_ALPS=3Dm
> # CONFIG_HID_MCP2221 is not set
> # end of Special HID drivers
> =

> #
> # USB HID support
> #
> CONFIG_USB_HID=3Dy
> # CONFIG_HID_PID is not set
> # CONFIG_USB_HIDDEV is not set
> # end of USB HID support
> =

> #
> # I2C HID support
> #
> # CONFIG_I2C_HID_ACPI is not set
> # end of I2C HID support
> =

> #
> # Intel ISH HID support
> #
> CONFIG_INTEL_ISH_HID=3Dm
> # CONFIG_INTEL_ISH_FIRMWARE_DOWNLOADER is not set
> # end of Intel ISH HID support
> =

> #
> # AMD SFH HID Support
> #
> # CONFIG_AMD_SFH_HID is not set
> # end of AMD SFH HID Support
> # end of HID support
> =

> CONFIG_USB_OHCI_LITTLE_ENDIAN=3Dy
> CONFIG_USB_SUPPORT=3Dy
> CONFIG_USB_COMMON=3Dy
> # CONFIG_USB_LED_TRIG is not set
> # CONFIG_USB_ULPI_BUS is not set
> # CONFIG_USB_CONN_GPIO is not set
> CONFIG_USB_ARCH_HAS_HCD=3Dy
> CONFIG_USB=3Dy
> CONFIG_USB_PCI=3Dy
> CONFIG_USB_ANNOUNCE_NEW_DEVICES=3Dy
> =

> #
> # Miscellaneous USB options
> #
> CONFIG_USB_DEFAULT_PERSIST=3Dy
> # CONFIG_USB_FEW_INIT_RETRIES is not set
> # CONFIG_USB_DYNAMIC_MINORS is not set
> # CONFIG_USB_OTG is not set
> # CONFIG_USB_OTG_PRODUCTLIST is not set
> CONFIG_USB_LEDS_TRIGGER_USBPORT=3Dy
> CONFIG_USB_AUTOSUSPEND_DELAY=3D2
> CONFIG_USB_MON=3Dy
> =

> #
> # USB Host Controller Drivers
> #
> # CONFIG_USB_C67X00_HCD is not set
> CONFIG_USB_XHCI_HCD=3Dy
> # CONFIG_USB_XHCI_DBGCAP is not set
> CONFIG_USB_XHCI_PCI=3Dy
> # CONFIG_USB_XHCI_PCI_RENESAS is not set
> # CONFIG_USB_XHCI_PLATFORM is not set
> CONFIG_USB_EHCI_HCD=3Dy
> CONFIG_USB_EHCI_ROOT_HUB_TT=3Dy
> CONFIG_USB_EHCI_TT_NEWSCHED=3Dy
> CONFIG_USB_EHCI_PCI=3Dy
> # CONFIG_USB_EHCI_FSL is not set
> # CONFIG_USB_EHCI_HCD_PLATFORM is not set
> # CONFIG_USB_OXU210HP_HCD is not set
> # CONFIG_USB_ISP116X_HCD is not set
> # CONFIG_USB_FOTG210_HCD is not set
> # CONFIG_USB_MAX3421_HCD is not set
> CONFIG_USB_OHCI_HCD=3Dy
> CONFIG_USB_OHCI_HCD_PCI=3Dy
> # CONFIG_USB_OHCI_HCD_PLATFORM is not set
> CONFIG_USB_UHCI_HCD=3Dy
> # CONFIG_USB_SL811_HCD is not set
> # CONFIG_USB_R8A66597_HCD is not set
> # CONFIG_USB_HCD_BCMA is not set
> # CONFIG_USB_HCD_TEST_MODE is not set
> =

> #
> # USB Device Class drivers
> #
> # CONFIG_USB_ACM is not set
> # CONFIG_USB_PRINTER is not set
> # CONFIG_USB_WDM is not set
> # CONFIG_USB_TMC is not set
> =

> #
> # NOTE: USB_STORAGE depends on SCSI but BLK_DEV_SD may
> #
> =

> #
> # also be needed; see USB_STORAGE Help for more info
> #
> CONFIG_USB_STORAGE=3Dm
> # CONFIG_USB_STORAGE_DEBUG is not set
> # CONFIG_USB_STORAGE_REALTEK is not set
> # CONFIG_USB_STORAGE_DATAFAB is not set
> # CONFIG_USB_STORAGE_FREECOM is not set
> # CONFIG_USB_STORAGE_ISD200 is not set
> # CONFIG_USB_STORAGE_USBAT is not set
> # CONFIG_USB_STORAGE_SDDR09 is not set
> # CONFIG_USB_STORAGE_SDDR55 is not set
> # CONFIG_USB_STORAGE_JUMPSHOT is not set
> # CONFIG_USB_STORAGE_ALAUDA is not set
> # CONFIG_USB_STORAGE_ONETOUCH is not set
> # CONFIG_USB_STORAGE_KARMA is not set
> # CONFIG_USB_STORAGE_CYPRESS_ATACB is not set
> # CONFIG_USB_STORAGE_ENE_UB6250 is not set
> # CONFIG_USB_UAS is not set
> =

> #
> # USB Imaging devices
> #
> # CONFIG_USB_MDC800 is not set
> # CONFIG_USB_MICROTEK is not set
> # CONFIG_USBIP_CORE is not set
> # CONFIG_USB_CDNS_SUPPORT is not set
> # CONFIG_USB_MUSB_HDRC is not set
> # CONFIG_USB_DWC3 is not set
> # CONFIG_USB_DWC2 is not set
> # CONFIG_USB_CHIPIDEA is not set
> # CONFIG_USB_ISP1760 is not set
> =

> #
> # USB port drivers
> #
> # CONFIG_USB_USS720 is not set
> CONFIG_USB_SERIAL=3Dm
> CONFIG_USB_SERIAL_GENERIC=3Dy
> # CONFIG_USB_SERIAL_SIMPLE is not set
> # CONFIG_USB_SERIAL_AIRCABLE is not set
> # CONFIG_USB_SERIAL_ARK3116 is not set
> # CONFIG_USB_SERIAL_BELKIN is not set
> # CONFIG_USB_SERIAL_CH341 is not set
> # CONFIG_USB_SERIAL_WHITEHEAT is not set
> # CONFIG_USB_SERIAL_DIGI_ACCELEPORT is not set
> # CONFIG_USB_SERIAL_CP210X is not set
> # CONFIG_USB_SERIAL_CYPRESS_M8 is not set
> # CONFIG_USB_SERIAL_EMPEG is not set
> # CONFIG_USB_SERIAL_FTDI_SIO is not set
> # CONFIG_USB_SERIAL_VISOR is not set
> # CONFIG_USB_SERIAL_IPAQ is not set
> # CONFIG_USB_SERIAL_IR is not set
> # CONFIG_USB_SERIAL_EDGEPORT is not set
> # CONFIG_USB_SERIAL_EDGEPORT_TI is not set
> # CONFIG_USB_SERIAL_F81232 is not set
> # CONFIG_USB_SERIAL_F8153X is not set
> # CONFIG_USB_SERIAL_GARMIN is not set
> # CONFIG_USB_SERIAL_IPW is not set
> # CONFIG_USB_SERIAL_IUU is not set
> # CONFIG_USB_SERIAL_KEYSPAN_PDA is not set
> # CONFIG_USB_SERIAL_KEYSPAN is not set
> # CONFIG_USB_SERIAL_KLSI is not set
> # CONFIG_USB_SERIAL_KOBIL_SCT is not set
> # CONFIG_USB_SERIAL_MCT_U232 is not set
> # CONFIG_USB_SERIAL_METRO is not set
> # CONFIG_USB_SERIAL_MOS7720 is not set
> # CONFIG_USB_SERIAL_MOS7840 is not set
> # CONFIG_USB_SERIAL_MXUPORT is not set
> # CONFIG_USB_SERIAL_NAVMAN is not set
> # CONFIG_USB_SERIAL_PL2303 is not set
> # CONFIG_USB_SERIAL_OTI6858 is not set
> # CONFIG_USB_SERIAL_QCAUX is not set
> # CONFIG_USB_SERIAL_QUALCOMM is not set
> # CONFIG_USB_SERIAL_SPCP8X5 is not set
> # CONFIG_USB_SERIAL_SAFE is not set
> # CONFIG_USB_SERIAL_SIERRAWIRELESS is not set
> # CONFIG_USB_SERIAL_SYMBOL is not set
> # CONFIG_USB_SERIAL_TI is not set
> # CONFIG_USB_SERIAL_CYBERJACK is not set
> # CONFIG_USB_SERIAL_OPTION is not set
> # CONFIG_USB_SERIAL_OMNINET is not set
> # CONFIG_USB_SERIAL_OPTICON is not set
> # CONFIG_USB_SERIAL_XSENS_MT is not set
> # CONFIG_USB_SERIAL_WISHBONE is not set
> # CONFIG_USB_SERIAL_SSU100 is not set
> # CONFIG_USB_SERIAL_QT2 is not set
> # CONFIG_USB_SERIAL_UPD78F0730 is not set
> # CONFIG_USB_SERIAL_XR is not set
> CONFIG_USB_SERIAL_DEBUG=3Dm
> =

> #
> # USB Miscellaneous drivers
> #
> # CONFIG_USB_EMI62 is not set
> # CONFIG_USB_EMI26 is not set
> # CONFIG_USB_ADUTUX is not set
> # CONFIG_USB_SEVSEG is not set
> # CONFIG_USB_LEGOTOWER is not set
> # CONFIG_USB_LCD is not set
> # CONFIG_USB_CYPRESS_CY7C63 is not set
> # CONFIG_USB_CYTHERM is not set
> # CONFIG_USB_IDMOUSE is not set
> # CONFIG_USB_FTDI_ELAN is not set
> # CONFIG_USB_APPLEDISPLAY is not set
> # CONFIG_APPLE_MFI_FASTCHARGE is not set
> # CONFIG_USB_SISUSBVGA is not set
> # CONFIG_USB_LD is not set
> # CONFIG_USB_TRANCEVIBRATOR is not set
> # CONFIG_USB_IOWARRIOR is not set
> # CONFIG_USB_TEST is not set
> # CONFIG_USB_EHSET_TEST_FIXTURE is not set
> # CONFIG_USB_ISIGHTFW is not set
> # CONFIG_USB_YUREX is not set
> # CONFIG_USB_EZUSB_FX2 is not set
> # CONFIG_USB_HUB_USB251XB is not set
> # CONFIG_USB_HSIC_USB3503 is not set
> # CONFIG_USB_HSIC_USB4604 is not set
> # CONFIG_USB_LINK_LAYER_TEST is not set
> # CONFIG_USB_CHAOSKEY is not set
> # CONFIG_USB_ATM is not set
> =

> #
> # USB Physical Layer drivers
> #
> # CONFIG_NOP_USB_XCEIV is not set
> # CONFIG_USB_GPIO_VBUS is not set
> # CONFIG_USB_ISP1301 is not set
> # end of USB Physical Layer drivers
> =

> # CONFIG_USB_GADGET is not set
> CONFIG_TYPEC=3Dy
> # CONFIG_TYPEC_TCPM is not set
> CONFIG_TYPEC_UCSI=3Dy
> # CONFIG_UCSI_CCG is not set
> CONFIG_UCSI_ACPI=3Dy
> # CONFIG_TYPEC_TPS6598X is not set
> # CONFIG_TYPEC_STUSB160X is not set
> =

> #
> # USB Type-C Multiplexer/DeMultiplexer Switch support
> #
> # CONFIG_TYPEC_MUX_PI3USB30532 is not set
> # end of USB Type-C Multiplexer/DeMultiplexer Switch support
> =

> #
> # USB Type-C Alternate Mode drivers
> #
> # CONFIG_TYPEC_DP_ALTMODE is not set
> # end of USB Type-C Alternate Mode drivers
> =

> # CONFIG_USB_ROLE_SWITCH is not set
> CONFIG_MMC=3Dm
> CONFIG_MMC_BLOCK=3Dm
> CONFIG_MMC_BLOCK_MINORS=3D8
> CONFIG_SDIO_UART=3Dm
> # CONFIG_MMC_TEST is not set
> =

> #
> # MMC/SD/SDIO Host Controller Drivers
> #
> # CONFIG_MMC_DEBUG is not set
> CONFIG_MMC_SDHCI=3Dm
> CONFIG_MMC_SDHCI_IO_ACCESSORS=3Dy
> CONFIG_MMC_SDHCI_PCI=3Dm
> CONFIG_MMC_RICOH_MMC=3Dy
> CONFIG_MMC_SDHCI_ACPI=3Dm
> CONFIG_MMC_SDHCI_PLTFM=3Dm
> # CONFIG_MMC_SDHCI_F_SDH30 is not set
> # CONFIG_MMC_WBSD is not set
> # CONFIG_MMC_TIFM_SD is not set
> # CONFIG_MMC_SPI is not set
> # CONFIG_MMC_CB710 is not set
> # CONFIG_MMC_VIA_SDMMC is not set
> # CONFIG_MMC_VUB300 is not set
> # CONFIG_MMC_USHC is not set
> # CONFIG_MMC_USDHI6ROL0 is not set
> # CONFIG_MMC_REALTEK_PCI is not set
> CONFIG_MMC_CQHCI=3Dm
> # CONFIG_MMC_HSQ is not set
> # CONFIG_MMC_TOSHIBA_PCI is not set
> # CONFIG_MMC_MTK is not set
> # CONFIG_MMC_SDHCI_XENON is not set
> # CONFIG_MEMSTICK is not set
> CONFIG_NEW_LEDS=3Dy
> CONFIG_LEDS_CLASS=3Dy
> # CONFIG_LEDS_CLASS_FLASH is not set
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> # CONFIG_LEDS_BRIGHTNESS_HW_CHANGED is not set
> =

> #
> # LED drivers
> #
> # CONFIG_LEDS_APU is not set
> CONFIG_LEDS_LM3530=3Dm
> # CONFIG_LEDS_LM3532 is not set
> # CONFIG_LEDS_LM3642 is not set
> # CONFIG_LEDS_PCA9532 is not set
> # CONFIG_LEDS_GPIO is not set
> CONFIG_LEDS_LP3944=3Dm
> # CONFIG_LEDS_LP3952 is not set
> # CONFIG_LEDS_LP50XX is not set
> CONFIG_LEDS_CLEVO_MAIL=3Dm
> # CONFIG_LEDS_PCA955X is not set
> # CONFIG_LEDS_PCA963X is not set
> # CONFIG_LEDS_DAC124S085 is not set
> # CONFIG_LEDS_PWM is not set
> # CONFIG_LEDS_BD2802 is not set
> CONFIG_LEDS_INTEL_SS4200=3Dm
> CONFIG_LEDS_LT3593=3Dm
> # CONFIG_LEDS_TCA6507 is not set
> # CONFIG_LEDS_TLC591XX is not set
> # CONFIG_LEDS_LM355x is not set
> =

> #
> # LED driver for blink(1) USB RGB LED is under Special HID drivers (HID_T=
HINGM)
> #
> CONFIG_LEDS_BLINKM=3Dm
> CONFIG_LEDS_MLXCPLD=3Dm
> # CONFIG_LEDS_MLXREG is not set
> # CONFIG_LEDS_USER is not set
> # CONFIG_LEDS_NIC78BX is not set
> # CONFIG_LEDS_TI_LMU_COMMON is not set
> =

> #
> # Flash and Torch LED drivers
> #
> =

> #
> # LED Triggers
> #
> CONFIG_LEDS_TRIGGERS=3Dy
> CONFIG_LEDS_TRIGGER_TIMER=3Dm
> CONFIG_LEDS_TRIGGER_ONESHOT=3Dm
> # CONFIG_LEDS_TRIGGER_DISK is not set
> CONFIG_LEDS_TRIGGER_HEARTBEAT=3Dm
> CONFIG_LEDS_TRIGGER_BACKLIGHT=3Dm
> # CONFIG_LEDS_TRIGGER_CPU is not set
> # CONFIG_LEDS_TRIGGER_ACTIVITY is not set
> CONFIG_LEDS_TRIGGER_GPIO=3Dm
> CONFIG_LEDS_TRIGGER_DEFAULT_ON=3Dm
> =

> #
> # iptables trigger is under Netfilter config (LED target)
> #
> CONFIG_LEDS_TRIGGER_TRANSIENT=3Dm
> CONFIG_LEDS_TRIGGER_CAMERA=3Dm
> # CONFIG_LEDS_TRIGGER_PANIC is not set
> # CONFIG_LEDS_TRIGGER_NETDEV is not set
> # CONFIG_LEDS_TRIGGER_PATTERN is not set
> CONFIG_LEDS_TRIGGER_AUDIO=3Dm
> # CONFIG_LEDS_TRIGGER_TTY is not set
> # CONFIG_ACCESSIBILITY is not set
> # CONFIG_INFINIBAND is not set
> CONFIG_EDAC_ATOMIC_SCRUB=3Dy
> CONFIG_EDAC_SUPPORT=3Dy
> CONFIG_EDAC=3Dy
> CONFIG_EDAC_LEGACY_SYSFS=3Dy
> # CONFIG_EDAC_DEBUG is not set
> CONFIG_EDAC_DECODE_MCE=3Dm
> CONFIG_EDAC_GHES=3Dy
> CONFIG_EDAC_AMD64=3Dm
> CONFIG_EDAC_E752X=3Dm
> CONFIG_EDAC_I82975X=3Dm
> CONFIG_EDAC_I3000=3Dm
> CONFIG_EDAC_I3200=3Dm
> CONFIG_EDAC_IE31200=3Dm
> CONFIG_EDAC_X38=3Dm
> CONFIG_EDAC_I5400=3Dm
> CONFIG_EDAC_I7CORE=3Dm
> CONFIG_EDAC_I5000=3Dm
> CONFIG_EDAC_I5100=3Dm
> CONFIG_EDAC_I7300=3Dm
> CONFIG_EDAC_SBRIDGE=3Dm
> CONFIG_EDAC_SKX=3Dm
> # CONFIG_EDAC_I10NM is not set
> CONFIG_EDAC_PND2=3Dm
> # CONFIG_EDAC_IGEN6 is not set
> CONFIG_RTC_LIB=3Dy
> CONFIG_RTC_MC146818_LIB=3Dy
> CONFIG_RTC_CLASS=3Dy
> CONFIG_RTC_HCTOSYS=3Dy
> CONFIG_RTC_HCTOSYS_DEVICE=3D"rtc0"
> # CONFIG_RTC_SYSTOHC is not set
> # CONFIG_RTC_DEBUG is not set
> CONFIG_RTC_NVMEM=3Dy
> =

> #
> # RTC interfaces
> #
> CONFIG_RTC_INTF_SYSFS=3Dy
> CONFIG_RTC_INTF_PROC=3Dy
> CONFIG_RTC_INTF_DEV=3Dy
> # CONFIG_RTC_INTF_DEV_UIE_EMUL is not set
> # CONFIG_RTC_DRV_TEST is not set
> =

> #
> # I2C RTC drivers
> #
> # CONFIG_RTC_DRV_ABB5ZES3 is not set
> # CONFIG_RTC_DRV_ABEOZ9 is not set
> # CONFIG_RTC_DRV_ABX80X is not set
> CONFIG_RTC_DRV_DS1307=3Dm
> # CONFIG_RTC_DRV_DS1307_CENTURY is not set
> CONFIG_RTC_DRV_DS1374=3Dm
> # CONFIG_RTC_DRV_DS1374_WDT is not set
> CONFIG_RTC_DRV_DS1672=3Dm
> CONFIG_RTC_DRV_MAX6900=3Dm
> CONFIG_RTC_DRV_RS5C372=3Dm
> CONFIG_RTC_DRV_ISL1208=3Dm
> CONFIG_RTC_DRV_ISL12022=3Dm
> CONFIG_RTC_DRV_X1205=3Dm
> CONFIG_RTC_DRV_PCF8523=3Dm
> # CONFIG_RTC_DRV_PCF85063 is not set
> # CONFIG_RTC_DRV_PCF85363 is not set
> CONFIG_RTC_DRV_PCF8563=3Dm
> CONFIG_RTC_DRV_PCF8583=3Dm
> CONFIG_RTC_DRV_M41T80=3Dm
> CONFIG_RTC_DRV_M41T80_WDT=3Dy
> CONFIG_RTC_DRV_BQ32K=3Dm
> # CONFIG_RTC_DRV_S35390A is not set
> CONFIG_RTC_DRV_FM3130=3Dm
> # CONFIG_RTC_DRV_RX8010 is not set
> CONFIG_RTC_DRV_RX8581=3Dm
> CONFIG_RTC_DRV_RX8025=3Dm
> CONFIG_RTC_DRV_EM3027=3Dm
> # CONFIG_RTC_DRV_RV3028 is not set
> # CONFIG_RTC_DRV_RV3032 is not set
> # CONFIG_RTC_DRV_RV8803 is not set
> # CONFIG_RTC_DRV_SD3078 is not set
> =

> #
> # SPI RTC drivers
> #
> # CONFIG_RTC_DRV_M41T93 is not set
> # CONFIG_RTC_DRV_M41T94 is not set
> # CONFIG_RTC_DRV_DS1302 is not set
> # CONFIG_RTC_DRV_DS1305 is not set
> # CONFIG_RTC_DRV_DS1343 is not set
> # CONFIG_RTC_DRV_DS1347 is not set
> # CONFIG_RTC_DRV_DS1390 is not set
> # CONFIG_RTC_DRV_MAX6916 is not set
> # CONFIG_RTC_DRV_R9701 is not set
> CONFIG_RTC_DRV_RX4581=3Dm
> # CONFIG_RTC_DRV_RS5C348 is not set
> # CONFIG_RTC_DRV_MAX6902 is not set
> # CONFIG_RTC_DRV_PCF2123 is not set
> # CONFIG_RTC_DRV_MCP795 is not set
> CONFIG_RTC_I2C_AND_SPI=3Dy
> =

> #
> # SPI and I2C RTC drivers
> #
> CONFIG_RTC_DRV_DS3232=3Dm
> CONFIG_RTC_DRV_DS3232_HWMON=3Dy
> # CONFIG_RTC_DRV_PCF2127 is not set
> CONFIG_RTC_DRV_RV3029C2=3Dm
> # CONFIG_RTC_DRV_RV3029_HWMON is not set
> # CONFIG_RTC_DRV_RX6110 is not set
> =

> #
> # Platform RTC drivers
> #
> CONFIG_RTC_DRV_CMOS=3Dy
> CONFIG_RTC_DRV_DS1286=3Dm
> CONFIG_RTC_DRV_DS1511=3Dm
> CONFIG_RTC_DRV_DS1553=3Dm
> # CONFIG_RTC_DRV_DS1685_FAMILY is not set
> CONFIG_RTC_DRV_DS1742=3Dm
> CONFIG_RTC_DRV_DS2404=3Dm
> CONFIG_RTC_DRV_STK17TA8=3Dm
> # CONFIG_RTC_DRV_M48T86 is not set
> CONFIG_RTC_DRV_M48T35=3Dm
> CONFIG_RTC_DRV_M48T59=3Dm
> CONFIG_RTC_DRV_MSM6242=3Dm
> CONFIG_RTC_DRV_BQ4802=3Dm
> CONFIG_RTC_DRV_RP5C01=3Dm
> CONFIG_RTC_DRV_V3020=3Dm
> =

> #
> # on-CPU RTC drivers
> #
> # CONFIG_RTC_DRV_FTRTC010 is not set
> =

> #
> # HID Sensor RTC drivers
> #
> # CONFIG_RTC_DRV_GOLDFISH is not set
> CONFIG_DMADEVICES=3Dy
> # CONFIG_DMADEVICES_DEBUG is not set
> =

> #
> # DMA Devices
> #
> CONFIG_DMA_ENGINE=3Dy
> CONFIG_DMA_VIRTUAL_CHANNELS=3Dy
> CONFIG_DMA_ACPI=3Dy
> # CONFIG_ALTERA_MSGDMA is not set
> CONFIG_INTEL_IDMA64=3Dm
> # CONFIG_INTEL_IDXD is not set
> # CONFIG_INTEL_IDXD_COMPAT is not set
> CONFIG_INTEL_IOATDMA=3Dm
> # CONFIG_PLX_DMA is not set
> # CONFIG_AMD_PTDMA is not set
> # CONFIG_QCOM_HIDMA_MGMT is not set
> # CONFIG_QCOM_HIDMA is not set
> CONFIG_DW_DMAC_CORE=3Dy
> CONFIG_DW_DMAC=3Dm
> CONFIG_DW_DMAC_PCI=3Dy
> # CONFIG_DW_EDMA is not set
> # CONFIG_DW_EDMA_PCIE is not set
> CONFIG_HSU_DMA=3Dy
> # CONFIG_SF_PDMA is not set
> # CONFIG_INTEL_LDMA is not set
> =

> #
> # DMA Clients
> #
> CONFIG_ASYNC_TX_DMA=3Dy
> CONFIG_DMATEST=3Dm
> CONFIG_DMA_ENGINE_RAID=3Dy
> =

> #
> # DMABUF options
> #
> CONFIG_SYNC_FILE=3Dy
> # CONFIG_SW_SYNC is not set
> # CONFIG_UDMABUF is not set
> # CONFIG_DMABUF_MOVE_NOTIFY is not set
> # CONFIG_DMABUF_DEBUG is not set
> # CONFIG_DMABUF_SELFTESTS is not set
> # CONFIG_DMABUF_HEAPS is not set
> # CONFIG_DMABUF_SYSFS_STATS is not set
> # end of DMABUF options
> =

> CONFIG_DCA=3Dm
> # CONFIG_AUXDISPLAY is not set
> # CONFIG_PANEL is not set
> CONFIG_UIO=3Dm
> CONFIG_UIO_CIF=3Dm
> CONFIG_UIO_PDRV_GENIRQ=3Dm
> # CONFIG_UIO_DMEM_GENIRQ is not set
> CONFIG_UIO_AEC=3Dm
> CONFIG_UIO_SERCOS3=3Dm
> CONFIG_UIO_PCI_GENERIC=3Dm
> # CONFIG_UIO_NETX is not set
> # CONFIG_UIO_PRUSS is not set
> # CONFIG_UIO_MF624 is not set
> CONFIG_UIO_HV_GENERIC=3Dm
> CONFIG_VFIO=3Dm
> CONFIG_VFIO_IOMMU_TYPE1=3Dm
> CONFIG_VFIO_VIRQFD=3Dm
> CONFIG_VFIO_NOIOMMU=3Dy
> CONFIG_VFIO_PCI_CORE=3Dm
> CONFIG_VFIO_PCI_MMAP=3Dy
> CONFIG_VFIO_PCI_INTX=3Dy
> CONFIG_VFIO_PCI=3Dm
> # CONFIG_VFIO_PCI_VGA is not set
> # CONFIG_VFIO_PCI_IGD is not set
> CONFIG_VFIO_MDEV=3Dm
> CONFIG_IRQ_BYPASS_MANAGER=3Dm
> # CONFIG_VIRT_DRIVERS is not set
> CONFIG_VIRTIO=3Dy
> CONFIG_VIRTIO_PCI_LIB=3Dy
> CONFIG_VIRTIO_PCI_LIB_LEGACY=3Dy
> CONFIG_VIRTIO_MENU=3Dy
> CONFIG_VIRTIO_PCI=3Dy
> CONFIG_VIRTIO_PCI_LEGACY=3Dy
> # CONFIG_VIRTIO_PMEM is not set
> CONFIG_VIRTIO_BALLOON=3Dm
> CONFIG_VIRTIO_MEM=3Dm
> CONFIG_VIRTIO_INPUT=3Dm
> # CONFIG_VIRTIO_MMIO is not set
> CONFIG_VIRTIO_DMA_SHARED_BUFFER=3Dm
> # CONFIG_VDPA is not set
> CONFIG_VHOST_IOTLB=3Dm
> CONFIG_VHOST=3Dm
> CONFIG_VHOST_MENU=3Dy
> CONFIG_VHOST_NET=3Dm
> # CONFIG_VHOST_SCSI is not set
> CONFIG_VHOST_VSOCK=3Dm
> # CONFIG_VHOST_CROSS_ENDIAN_LEGACY is not set
> =

> #
> # Microsoft Hyper-V guest support
> #
> CONFIG_HYPERV=3Dm
> CONFIG_HYPERV_TIMER=3Dy
> CONFIG_HYPERV_UTILS=3Dm
> CONFIG_HYPERV_BALLOON=3Dm
> # end of Microsoft Hyper-V guest support
> =

> # CONFIG_GREYBUS is not set
> # CONFIG_COMEDI is not set
> # CONFIG_STAGING is not set
> CONFIG_X86_PLATFORM_DEVICES=3Dy
> CONFIG_ACPI_WMI=3Dm
> CONFIG_WMI_BMOF=3Dm
> # CONFIG_HUAWEI_WMI is not set
> # CONFIG_UV_SYSFS is not set
> CONFIG_MXM_WMI=3Dm
> # CONFIG_PEAQ_WMI is not set
> # CONFIG_NVIDIA_WMI_EC_BACKLIGHT is not set
> # CONFIG_XIAOMI_WMI is not set
> # CONFIG_GIGABYTE_WMI is not set
> CONFIG_ACERHDF=3Dm
> # CONFIG_ACER_WIRELESS is not set
> CONFIG_ACER_WMI=3Dm
> # CONFIG_AMD_PMC is not set
> # CONFIG_ADV_SWBUTTON is not set
> CONFIG_APPLE_GMUX=3Dm
> CONFIG_ASUS_LAPTOP=3Dm
> # CONFIG_ASUS_WIRELESS is not set
> CONFIG_ASUS_WMI=3Dm
> CONFIG_ASUS_NB_WMI=3Dm
> # CONFIG_MERAKI_MX100 is not set
> CONFIG_EEEPC_LAPTOP=3Dm
> CONFIG_EEEPC_WMI=3Dm
> # CONFIG_X86_PLATFORM_DRIVERS_DELL is not set
> CONFIG_AMILO_RFKILL=3Dm
> CONFIG_FUJITSU_LAPTOP=3Dm
> CONFIG_FUJITSU_TABLET=3Dm
> # CONFIG_GPD_POCKET_FAN is not set
> CONFIG_HP_ACCEL=3Dm
> # CONFIG_WIRELESS_HOTKEY is not set
> CONFIG_HP_WMI=3Dm
> # CONFIG_IBM_RTL is not set
> CONFIG_IDEAPAD_LAPTOP=3Dm
> CONFIG_SENSORS_HDAPS=3Dm
> CONFIG_THINKPAD_ACPI=3Dm
> # CONFIG_THINKPAD_ACPI_DEBUGFACILITIES is not set
> # CONFIG_THINKPAD_ACPI_DEBUG is not set
> # CONFIG_THINKPAD_ACPI_UNSAFE_LEDS is not set
> CONFIG_THINKPAD_ACPI_VIDEO=3Dy
> CONFIG_THINKPAD_ACPI_HOTKEY_POLL=3Dy
> # CONFIG_THINKPAD_LMI is not set
> # CONFIG_INTEL_ATOMISP2_PM is not set
> # CONFIG_INTEL_SAR_INT1092 is not set
> CONFIG_INTEL_PMC_CORE=3Dm
> =

> #
> # Intel Speed Select Technology interface support
> #
> # CONFIG_INTEL_SPEED_SELECT_INTERFACE is not set
> # end of Intel Speed Select Technology interface support
> =

> CONFIG_INTEL_WMI=3Dy
> # CONFIG_INTEL_WMI_SBL_FW_UPDATE is not set
> CONFIG_INTEL_WMI_THUNDERBOLT=3Dm
> CONFIG_INTEL_HID_EVENT=3Dm
> CONFIG_INTEL_VBTN=3Dm
> # CONFIG_INTEL_INT0002_VGPIO is not set
> CONFIG_INTEL_OAKTRAIL=3Dm
> # CONFIG_INTEL_ISHTP_ECLITE is not set
> # CONFIG_INTEL_PUNIT_IPC is not set
> CONFIG_INTEL_RST=3Dm
> # CONFIG_INTEL_SMARTCONNECT is not set
> CONFIG_INTEL_TURBO_MAX_3=3Dy
> # CONFIG_INTEL_UNCORE_FREQ_CONTROL is not set
> CONFIG_MSI_LAPTOP=3Dm
> CONFIG_MSI_WMI=3Dm
> # CONFIG_PCENGINES_APU2 is not set
> # CONFIG_BARCO_P50_GPIO is not set
> CONFIG_SAMSUNG_LAPTOP=3Dm
> CONFIG_SAMSUNG_Q10=3Dm
> CONFIG_TOSHIBA_BT_RFKILL=3Dm
> # CONFIG_TOSHIBA_HAPS is not set
> # CONFIG_TOSHIBA_WMI is not set
> CONFIG_ACPI_CMPC=3Dm
> CONFIG_COMPAL_LAPTOP=3Dm
> # CONFIG_LG_LAPTOP is not set
> CONFIG_PANASONIC_LAPTOP=3Dm
> CONFIG_SONY_LAPTOP=3Dm
> CONFIG_SONYPI_COMPAT=3Dy
> # CONFIG_SYSTEM76_ACPI is not set
> CONFIG_TOPSTAR_LAPTOP=3Dm
> # CONFIG_I2C_MULTI_INSTANTIATE is not set
> CONFIG_MLX_PLATFORM=3Dm
> CONFIG_INTEL_IPS=3Dm
> # CONFIG_INTEL_SCU_PCI is not set
> # CONFIG_INTEL_SCU_PLATFORM is not set
> CONFIG_PMC_ATOM=3Dy
> # CONFIG_CHROME_PLATFORMS is not set
> CONFIG_MELLANOX_PLATFORM=3Dy
> CONFIG_MLXREG_HOTPLUG=3Dm
> # CONFIG_MLXREG_IO is not set
> # CONFIG_MLXREG_LC is not set
> CONFIG_SURFACE_PLATFORMS=3Dy
> # CONFIG_SURFACE3_WMI is not set
> # CONFIG_SURFACE_3_POWER_OPREGION is not set
> # CONFIG_SURFACE_GPE is not set
> # CONFIG_SURFACE_HOTPLUG is not set
> # CONFIG_SURFACE_PRO3_BUTTON is not set
> CONFIG_HAVE_CLK=3Dy
> CONFIG_HAVE_CLK_PREPARE=3Dy
> CONFIG_COMMON_CLK=3Dy
> # CONFIG_LMK04832 is not set
> # CONFIG_COMMON_CLK_MAX9485 is not set
> # CONFIG_COMMON_CLK_SI5341 is not set
> # CONFIG_COMMON_CLK_SI5351 is not set
> # CONFIG_COMMON_CLK_SI544 is not set
> # CONFIG_COMMON_CLK_CDCE706 is not set
> # CONFIG_COMMON_CLK_CS2000_CP is not set
> # CONFIG_COMMON_CLK_PWM is not set
> # CONFIG_XILINX_VCU is not set
> CONFIG_HWSPINLOCK=3Dy
> =

> #
> # Clock Source drivers
> #
> CONFIG_CLKEVT_I8253=3Dy
> CONFIG_I8253_LOCK=3Dy
> CONFIG_CLKBLD_I8253=3Dy
> # end of Clock Source drivers
> =

> CONFIG_MAILBOX=3Dy
> CONFIG_PCC=3Dy
> # CONFIG_ALTERA_MBOX is not set
> CONFIG_IOMMU_IOVA=3Dy
> CONFIG_IOASID=3Dy
> CONFIG_IOMMU_API=3Dy
> CONFIG_IOMMU_SUPPORT=3Dy
> =

> #
> # Generic IOMMU Pagetable Support
> #
> # end of Generic IOMMU Pagetable Support
> =

> # CONFIG_IOMMU_DEBUGFS is not set
> # CONFIG_IOMMU_DEFAULT_DMA_STRICT is not set
> CONFIG_IOMMU_DEFAULT_DMA_LAZY=3Dy
> # CONFIG_IOMMU_DEFAULT_PASSTHROUGH is not set
> CONFIG_IOMMU_DMA=3Dy
> # CONFIG_AMD_IOMMU is not set
> CONFIG_DMAR_TABLE=3Dy
> CONFIG_INTEL_IOMMU=3Dy
> # CONFIG_INTEL_IOMMU_SVM is not set
> # CONFIG_INTEL_IOMMU_DEFAULT_ON is not set
> CONFIG_INTEL_IOMMU_FLOPPY_WA=3Dy
> CONFIG_INTEL_IOMMU_SCALABLE_MODE_DEFAULT_ON=3Dy
> CONFIG_IRQ_REMAP=3Dy
> CONFIG_HYPERV_IOMMU=3Dy
> # CONFIG_VIRTIO_IOMMU is not set
> =

> #
> # Remoteproc drivers
> #
> # CONFIG_REMOTEPROC is not set
> # end of Remoteproc drivers
> =

> #
> # Rpmsg drivers
> #
> # CONFIG_RPMSG_QCOM_GLINK_RPM is not set
> # CONFIG_RPMSG_VIRTIO is not set
> # end of Rpmsg drivers
> =

> # CONFIG_SOUNDWIRE is not set
> =

> #
> # SOC (System On Chip) specific Drivers
> #
> =

> #
> # Amlogic SoC drivers
> #
> # end of Amlogic SoC drivers
> =

> #
> # Broadcom SoC drivers
> #
> # end of Broadcom SoC drivers
> =

> #
> # NXP/Freescale QorIQ SoC drivers
> #
> # end of NXP/Freescale QorIQ SoC drivers
> =

> #
> # i.MX SoC drivers
> #
> # end of i.MX SoC drivers
> =

> #
> # Enable LiteX SoC Builder specific drivers
> #
> # end of Enable LiteX SoC Builder specific drivers
> =

> #
> # Qualcomm SoC drivers
> #
> # end of Qualcomm SoC drivers
> =

> # CONFIG_SOC_TI is not set
> =

> #
> # Xilinx SoC drivers
> #
> # end of Xilinx SoC drivers
> # end of SOC (System On Chip) specific Drivers
> =

> # CONFIG_PM_DEVFREQ is not set
> # CONFIG_EXTCON is not set
> # CONFIG_MEMORY is not set
> # CONFIG_IIO is not set
> CONFIG_NTB=3Dm
> # CONFIG_NTB_MSI is not set
> # CONFIG_NTB_AMD is not set
> # CONFIG_NTB_IDT is not set
> # CONFIG_NTB_INTEL is not set
> # CONFIG_NTB_EPF is not set
> # CONFIG_NTB_SWITCHTEC is not set
> # CONFIG_NTB_PINGPONG is not set
> # CONFIG_NTB_TOOL is not set
> # CONFIG_NTB_PERF is not set
> # CONFIG_NTB_TRANSPORT is not set
> # CONFIG_VME_BUS is not set
> CONFIG_PWM=3Dy
> CONFIG_PWM_SYSFS=3Dy
> # CONFIG_PWM_DEBUG is not set
> # CONFIG_PWM_DWC is not set
> CONFIG_PWM_LPSS=3Dm
> CONFIG_PWM_LPSS_PCI=3Dm
> CONFIG_PWM_LPSS_PLATFORM=3Dm
> # CONFIG_PWM_PCA9685 is not set
> =

> #
> # IRQ chip support
> #
> # end of IRQ chip support
> =

> # CONFIG_IPACK_BUS is not set
> # CONFIG_RESET_CONTROLLER is not set
> =

> #
> # PHY Subsystem
> #
> # CONFIG_GENERIC_PHY is not set
> # CONFIG_USB_LGM_PHY is not set
> # CONFIG_PHY_CAN_TRANSCEIVER is not set
> =

> #
> # PHY drivers for Broadcom platforms
> #
> # CONFIG_BCM_KONA_USB2_PHY is not set
> # end of PHY drivers for Broadcom platforms
> =

> # CONFIG_PHY_PXA_28NM_HSIC is not set
> # CONFIG_PHY_PXA_28NM_USB2 is not set
> # CONFIG_PHY_INTEL_LGM_EMMC is not set
> # end of PHY Subsystem
> =

> CONFIG_POWERCAP=3Dy
> CONFIG_INTEL_RAPL_CORE=3Dm
> CONFIG_INTEL_RAPL=3Dm
> # CONFIG_IDLE_INJECT is not set
> # CONFIG_DTPM is not set
> # CONFIG_MCB is not set
> =

> #
> # Performance monitor support
> #
> # end of Performance monitor support
> =

> CONFIG_RAS=3Dy
> # CONFIG_RAS_CEC is not set
> # CONFIG_USB4 is not set
> =

> #
> # Android
> #
> # CONFIG_ANDROID is not set
> # end of Android
> =

> CONFIG_LIBNVDIMM=3Dm
> CONFIG_BLK_DEV_PMEM=3Dm
> CONFIG_ND_BLK=3Dm
> CONFIG_ND_CLAIM=3Dy
> CONFIG_ND_BTT=3Dm
> CONFIG_BTT=3Dy
> CONFIG_ND_PFN=3Dm
> CONFIG_NVDIMM_PFN=3Dy
> CONFIG_NVDIMM_DAX=3Dy
> CONFIG_NVDIMM_KEYS=3Dy
> CONFIG_DAX_DRIVER=3Dy
> CONFIG_DAX=3Dy
> CONFIG_DEV_DAX=3Dm
> CONFIG_DEV_DAX_PMEM=3Dm
> CONFIG_DEV_DAX_KMEM=3Dm
> CONFIG_DEV_DAX_PMEM_COMPAT=3Dm
> CONFIG_NVMEM=3Dy
> CONFIG_NVMEM_SYSFS=3Dy
> # CONFIG_NVMEM_RMEM is not set
> =

> #
> # HW tracing support
> #
> CONFIG_STM=3Dm
> # CONFIG_STM_PROTO_BASIC is not set
> # CONFIG_STM_PROTO_SYS_T is not set
> CONFIG_STM_DUMMY=3Dm
> CONFIG_STM_SOURCE_CONSOLE=3Dm
> CONFIG_STM_SOURCE_HEARTBEAT=3Dm
> CONFIG_STM_SOURCE_FTRACE=3Dm
> CONFIG_INTEL_TH=3Dm
> CONFIG_INTEL_TH_PCI=3Dm
> CONFIG_INTEL_TH_ACPI=3Dm
> CONFIG_INTEL_TH_GTH=3Dm
> CONFIG_INTEL_TH_STH=3Dm
> CONFIG_INTEL_TH_MSU=3Dm
> CONFIG_INTEL_TH_PTI=3Dm
> # CONFIG_INTEL_TH_DEBUG is not set
> # end of HW tracing support
> =

> # CONFIG_FPGA is not set
> # CONFIG_TEE is not set
> # CONFIG_UNISYS_VISORBUS is not set
> # CONFIG_SIOX is not set
> # CONFIG_SLIMBUS is not set
> # CONFIG_INTERCONNECT is not set
> # CONFIG_COUNTER is not set
> # CONFIG_MOST is not set
> # end of Device Drivers
> =

> #
> # File systems
> #
> CONFIG_DCACHE_WORD_ACCESS=3Dy
> # CONFIG_VALIDATE_FS_PARSER is not set
> CONFIG_FS_IOMAP=3Dy
> CONFIG_EXT2_FS=3Dm
> # CONFIG_EXT2_FS_XATTR is not set
> # CONFIG_EXT3_FS is not set
> CONFIG_EXT4_FS=3Dy
> CONFIG_EXT4_FS_POSIX_ACL=3Dy
> CONFIG_EXT4_FS_SECURITY=3Dy
> # CONFIG_EXT4_DEBUG is not set
> CONFIG_JBD2=3Dy
> # CONFIG_JBD2_DEBUG is not set
> CONFIG_FS_MBCACHE=3Dy
> # CONFIG_REISERFS_FS is not set
> # CONFIG_JFS_FS is not set
> CONFIG_XFS_FS=3Dm
> CONFIG_XFS_SUPPORT_V4=3Dy
> CONFIG_XFS_QUOTA=3Dy
> CONFIG_XFS_POSIX_ACL=3Dy
> CONFIG_XFS_RT=3Dy
> CONFIG_XFS_ONLINE_SCRUB=3Dy
> # CONFIG_XFS_ONLINE_REPAIR is not set
> CONFIG_XFS_DEBUG=3Dy
> CONFIG_XFS_ASSERT_FATAL=3Dy
> CONFIG_GFS2_FS=3Dm
> CONFIG_GFS2_FS_LOCKING_DLM=3Dy
> CONFIG_OCFS2_FS=3Dm
> CONFIG_OCFS2_FS_O2CB=3Dm
> CONFIG_OCFS2_FS_USERSPACE_CLUSTER=3Dm
> CONFIG_OCFS2_FS_STATS=3Dy
> CONFIG_OCFS2_DEBUG_MASKLOG=3Dy
> # CONFIG_OCFS2_DEBUG_FS is not set
> CONFIG_BTRFS_FS=3Dm
> CONFIG_BTRFS_FS_POSIX_ACL=3Dy
> # CONFIG_BTRFS_FS_CHECK_INTEGRITY is not set
> # CONFIG_BTRFS_FS_RUN_SANITY_TESTS is not set
> # CONFIG_BTRFS_DEBUG is not set
> # CONFIG_BTRFS_ASSERT is not set
> # CONFIG_BTRFS_FS_REF_VERIFY is not set
> # CONFIG_NILFS2_FS is not set
> CONFIG_F2FS_FS=3Dm
> CONFIG_F2FS_STAT_FS=3Dy
> CONFIG_F2FS_FS_XATTR=3Dy
> CONFIG_F2FS_FS_POSIX_ACL=3Dy
> # CONFIG_F2FS_FS_SECURITY is not set
> # CONFIG_F2FS_CHECK_FS is not set
> # CONFIG_F2FS_FAULT_INJECTION is not set
> # CONFIG_F2FS_FS_COMPRESSION is not set
> CONFIG_F2FS_IOSTAT=3Dy
> CONFIG_FS_DAX=3Dy
> CONFIG_FS_DAX_PMD=3Dy
> CONFIG_FS_POSIX_ACL=3Dy
> CONFIG_EXPORTFS=3Dy
> CONFIG_EXPORTFS_BLOCK_OPS=3Dy
> CONFIG_FILE_LOCKING=3Dy
> CONFIG_FS_ENCRYPTION=3Dy
> CONFIG_FS_ENCRYPTION_ALGS=3Dy
> # CONFIG_FS_VERITY is not set
> CONFIG_FSNOTIFY=3Dy
> CONFIG_DNOTIFY=3Dy
> CONFIG_INOTIFY_USER=3Dy
> CONFIG_FANOTIFY=3Dy
> CONFIG_FANOTIFY_ACCESS_PERMISSIONS=3Dy
> CONFIG_QUOTA=3Dy
> CONFIG_QUOTA_NETLINK_INTERFACE=3Dy
> CONFIG_PRINT_QUOTA_WARNING=3Dy
> # CONFIG_QUOTA_DEBUG is not set
> CONFIG_QUOTA_TREE=3Dy
> # CONFIG_QFMT_V1 is not set
> CONFIG_QFMT_V2=3Dy
> CONFIG_QUOTACTL=3Dy
> CONFIG_AUTOFS4_FS=3Dy
> CONFIG_AUTOFS_FS=3Dy
> CONFIG_FUSE_FS=3Dm
> CONFIG_CUSE=3Dm
> # CONFIG_VIRTIO_FS is not set
> CONFIG_OVERLAY_FS=3Dm
> # CONFIG_OVERLAY_FS_REDIRECT_DIR is not set
> # CONFIG_OVERLAY_FS_REDIRECT_ALWAYS_FOLLOW is not set
> # CONFIG_OVERLAY_FS_INDEX is not set
> # CONFIG_OVERLAY_FS_XINO_AUTO is not set
> # CONFIG_OVERLAY_FS_METACOPY is not set
> =

> #
> # Caches
> #
> CONFIG_NETFS_SUPPORT=3Dm
> CONFIG_NETFS_STATS=3Dy
> CONFIG_FSCACHE=3Dm
> CONFIG_FSCACHE_STATS=3Dy
> # CONFIG_FSCACHE_DEBUG is not set
> CONFIG_CACHEFILES=3Dm
> # CONFIG_CACHEFILES_DEBUG is not set
> # end of Caches
> =

> #
> # CD-ROM/DVD Filesystems
> #
> CONFIG_ISO9660_FS=3Dm
> CONFIG_JOLIET=3Dy
> CONFIG_ZISOFS=3Dy
> CONFIG_UDF_FS=3Dm
> # end of CD-ROM/DVD Filesystems
> =

> #
> # DOS/FAT/EXFAT/NT Filesystems
> #
> CONFIG_FAT_FS=3Dm
> CONFIG_MSDOS_FS=3Dm
> CONFIG_VFAT_FS=3Dm
> CONFIG_FAT_DEFAULT_CODEPAGE=3D437
> CONFIG_FAT_DEFAULT_IOCHARSET=3D"ascii"
> # CONFIG_FAT_DEFAULT_UTF8 is not set
> # CONFIG_EXFAT_FS is not set
> # CONFIG_NTFS_FS is not set
> # CONFIG_NTFS3_FS is not set
> # end of DOS/FAT/EXFAT/NT Filesystems
> =

> #
> # Pseudo filesystems
> #
> CONFIG_PROC_FS=3Dy
> CONFIG_PROC_KCORE=3Dy
> CONFIG_PROC_VMCORE=3Dy
> CONFIG_PROC_VMCORE_DEVICE_DUMP=3Dy
> CONFIG_PROC_SYSCTL=3Dy
> CONFIG_PROC_PAGE_MONITOR=3Dy
> CONFIG_PROC_CHILDREN=3Dy
> CONFIG_PROC_PID_ARCH_STATUS=3Dy
> CONFIG_KERNFS=3Dy
> CONFIG_SYSFS=3Dy
> CONFIG_TMPFS=3Dy
> CONFIG_TMPFS_POSIX_ACL=3Dy
> CONFIG_TMPFS_XATTR=3Dy
> # CONFIG_TMPFS_INODE64 is not set
> CONFIG_HUGETLBFS=3Dy
> CONFIG_HUGETLB_PAGE=3Dy
> CONFIG_HUGETLB_PAGE_FREE_VMEMMAP=3Dy
> # CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON is not set
> CONFIG_MEMFD_CREATE=3Dy
> CONFIG_ARCH_HAS_GIGANTIC_PAGE=3Dy
> CONFIG_CONFIGFS_FS=3Dy
> CONFIG_EFIVAR_FS=3Dy
> # end of Pseudo filesystems
> =

> CONFIG_MISC_FILESYSTEMS=3Dy
> # CONFIG_ORANGEFS_FS is not set
> # CONFIG_ADFS_FS is not set
> # CONFIG_AFFS_FS is not set
> # CONFIG_ECRYPT_FS is not set
> # CONFIG_HFS_FS is not set
> # CONFIG_HFSPLUS_FS is not set
> # CONFIG_BEFS_FS is not set
> # CONFIG_BFS_FS is not set
> # CONFIG_EFS_FS is not set
> CONFIG_CRAMFS=3Dm
> CONFIG_CRAMFS_BLOCKDEV=3Dy
> CONFIG_SQUASHFS=3Dm
> # CONFIG_SQUASHFS_FILE_CACHE is not set
> CONFIG_SQUASHFS_FILE_DIRECT=3Dy
> # CONFIG_SQUASHFS_DECOMP_SINGLE is not set
> # CONFIG_SQUASHFS_DECOMP_MULTI is not set
> CONFIG_SQUASHFS_DECOMP_MULTI_PERCPU=3Dy
> CONFIG_SQUASHFS_XATTR=3Dy
> CONFIG_SQUASHFS_ZLIB=3Dy
> # CONFIG_SQUASHFS_LZ4 is not set
> CONFIG_SQUASHFS_LZO=3Dy
> CONFIG_SQUASHFS_XZ=3Dy
> # CONFIG_SQUASHFS_ZSTD is not set
> # CONFIG_SQUASHFS_4K_DEVBLK_SIZE is not set
> # CONFIG_SQUASHFS_EMBEDDED is not set
> CONFIG_SQUASHFS_FRAGMENT_CACHE_SIZE=3D3
> # CONFIG_VXFS_FS is not set
> # CONFIG_MINIX_FS is not set
> # CONFIG_OMFS_FS is not set
> # CONFIG_HPFS_FS is not set
> # CONFIG_QNX4FS_FS is not set
> # CONFIG_QNX6FS_FS is not set
> # CONFIG_ROMFS_FS is not set
> CONFIG_PSTORE=3Dy
> CONFIG_PSTORE_DEFAULT_KMSG_BYTES=3D10240
> CONFIG_PSTORE_DEFLATE_COMPRESS=3Dy
> # CONFIG_PSTORE_LZO_COMPRESS is not set
> # CONFIG_PSTORE_LZ4_COMPRESS is not set
> # CONFIG_PSTORE_LZ4HC_COMPRESS is not set
> # CONFIG_PSTORE_842_COMPRESS is not set
> # CONFIG_PSTORE_ZSTD_COMPRESS is not set
> CONFIG_PSTORE_COMPRESS=3Dy
> CONFIG_PSTORE_DEFLATE_COMPRESS_DEFAULT=3Dy
> CONFIG_PSTORE_COMPRESS_DEFAULT=3D"deflate"
> # CONFIG_PSTORE_CONSOLE is not set
> # CONFIG_PSTORE_PMSG is not set
> # CONFIG_PSTORE_FTRACE is not set
> CONFIG_PSTORE_RAM=3Dm
> # CONFIG_PSTORE_BLK is not set
> # CONFIG_SYSV_FS is not set
> # CONFIG_UFS_FS is not set
> # CONFIG_EROFS_FS is not set
> CONFIG_NETWORK_FILESYSTEMS=3Dy
> CONFIG_NFS_FS=3Dy
> # CONFIG_NFS_V2 is not set
> CONFIG_NFS_V3=3Dy
> CONFIG_NFS_V3_ACL=3Dy
> CONFIG_NFS_V4=3Dm
> # CONFIG_NFS_SWAP is not set
> CONFIG_NFS_V4_1=3Dy
> CONFIG_NFS_V4_2=3Dy
> CONFIG_PNFS_FILE_LAYOUT=3Dm
> CONFIG_PNFS_BLOCK=3Dm
> CONFIG_PNFS_FLEXFILE_LAYOUT=3Dm
> CONFIG_NFS_V4_1_IMPLEMENTATION_ID_DOMAIN=3D"kernel.org"
> # CONFIG_NFS_V4_1_MIGRATION is not set
> CONFIG_NFS_V4_SECURITY_LABEL=3Dy
> CONFIG_ROOT_NFS=3Dy
> # CONFIG_NFS_USE_LEGACY_DNS is not set
> CONFIG_NFS_USE_KERNEL_DNS=3Dy
> CONFIG_NFS_DEBUG=3Dy
> CONFIG_NFS_DISABLE_UDP_SUPPORT=3Dy
> # CONFIG_NFS_V4_2_READ_PLUS is not set
> CONFIG_NFSD=3Dm
> CONFIG_NFSD_V2_ACL=3Dy
> CONFIG_NFSD_V3=3Dy
> CONFIG_NFSD_V3_ACL=3Dy
> CONFIG_NFSD_V4=3Dy
> CONFIG_NFSD_PNFS=3Dy
> # CONFIG_NFSD_BLOCKLAYOUT is not set
> CONFIG_NFSD_SCSILAYOUT=3Dy
> # CONFIG_NFSD_FLEXFILELAYOUT is not set
> # CONFIG_NFSD_V4_2_INTER_SSC is not set
> CONFIG_NFSD_V4_SECURITY_LABEL=3Dy
> CONFIG_GRACE_PERIOD=3Dy
> CONFIG_LOCKD=3Dy
> CONFIG_LOCKD_V4=3Dy
> CONFIG_NFS_ACL_SUPPORT=3Dy
> CONFIG_NFS_COMMON=3Dy
> CONFIG_NFS_V4_2_SSC_HELPER=3Dy
> CONFIG_SUNRPC=3Dy
> CONFIG_SUNRPC_GSS=3Dm
> CONFIG_SUNRPC_BACKCHANNEL=3Dy
> CONFIG_RPCSEC_GSS_KRB5=3Dm
> # CONFIG_SUNRPC_DISABLE_INSECURE_ENCTYPES is not set
> CONFIG_SUNRPC_DEBUG=3Dy
> CONFIG_CEPH_FS=3Dm
> # CONFIG_CEPH_FSCACHE is not set
> CONFIG_CEPH_FS_POSIX_ACL=3Dy
> # CONFIG_CEPH_FS_SECURITY_LABEL is not set
> CONFIG_CIFS=3Dm
> CONFIG_CIFS_STATS2=3Dy
> CONFIG_CIFS_ALLOW_INSECURE_LEGACY=3Dy
> CONFIG_CIFS_UPCALL=3Dy
> CONFIG_CIFS_XATTR=3Dy
> CONFIG_CIFS_POSIX=3Dy
> CONFIG_CIFS_DEBUG=3Dy
> # CONFIG_CIFS_DEBUG2 is not set
> # CONFIG_CIFS_DEBUG_DUMP_KEYS is not set
> CONFIG_CIFS_DFS_UPCALL=3Dy
> # CONFIG_CIFS_SWN_UPCALL is not set
> # CONFIG_CIFS_FSCACHE is not set
> # CONFIG_SMB_SERVER is not set
> CONFIG_SMBFS_COMMON=3Dm
> # CONFIG_CODA_FS is not set
> # CONFIG_AFS_FS is not set
> # CONFIG_9P_FS is not set
> CONFIG_NLS=3Dy
> CONFIG_NLS_DEFAULT=3D"utf8"
> CONFIG_NLS_CODEPAGE_437=3Dy
> CONFIG_NLS_CODEPAGE_737=3Dm
> CONFIG_NLS_CODEPAGE_775=3Dm
> CONFIG_NLS_CODEPAGE_850=3Dm
> CONFIG_NLS_CODEPAGE_852=3Dm
> CONFIG_NLS_CODEPAGE_855=3Dm
> CONFIG_NLS_CODEPAGE_857=3Dm
> CONFIG_NLS_CODEPAGE_860=3Dm
> CONFIG_NLS_CODEPAGE_861=3Dm
> CONFIG_NLS_CODEPAGE_862=3Dm
> CONFIG_NLS_CODEPAGE_863=3Dm
> CONFIG_NLS_CODEPAGE_864=3Dm
> CONFIG_NLS_CODEPAGE_865=3Dm
> CONFIG_NLS_CODEPAGE_866=3Dm
> CONFIG_NLS_CODEPAGE_869=3Dm
> CONFIG_NLS_CODEPAGE_936=3Dm
> CONFIG_NLS_CODEPAGE_950=3Dm
> CONFIG_NLS_CODEPAGE_932=3Dm
> CONFIG_NLS_CODEPAGE_949=3Dm
> CONFIG_NLS_CODEPAGE_874=3Dm
> CONFIG_NLS_ISO8859_8=3Dm
> CONFIG_NLS_CODEPAGE_1250=3Dm
> CONFIG_NLS_CODEPAGE_1251=3Dm
> CONFIG_NLS_ASCII=3Dy
> CONFIG_NLS_ISO8859_1=3Dm
> CONFIG_NLS_ISO8859_2=3Dm
> CONFIG_NLS_ISO8859_3=3Dm
> CONFIG_NLS_ISO8859_4=3Dm
> CONFIG_NLS_ISO8859_5=3Dm
> CONFIG_NLS_ISO8859_6=3Dm
> CONFIG_NLS_ISO8859_7=3Dm
> CONFIG_NLS_ISO8859_9=3Dm
> CONFIG_NLS_ISO8859_13=3Dm
> CONFIG_NLS_ISO8859_14=3Dm
> CONFIG_NLS_ISO8859_15=3Dm
> CONFIG_NLS_KOI8_R=3Dm
> CONFIG_NLS_KOI8_U=3Dm
> CONFIG_NLS_MAC_ROMAN=3Dm
> CONFIG_NLS_MAC_CELTIC=3Dm
> CONFIG_NLS_MAC_CENTEURO=3Dm
> CONFIG_NLS_MAC_CROATIAN=3Dm
> CONFIG_NLS_MAC_CYRILLIC=3Dm
> CONFIG_NLS_MAC_GAELIC=3Dm
> CONFIG_NLS_MAC_GREEK=3Dm
> CONFIG_NLS_MAC_ICELAND=3Dm
> CONFIG_NLS_MAC_INUIT=3Dm
> CONFIG_NLS_MAC_ROMANIAN=3Dm
> CONFIG_NLS_MAC_TURKISH=3Dm
> CONFIG_NLS_UTF8=3Dm
> CONFIG_DLM=3Dm
> CONFIG_DLM_DEBUG=3Dy
> # CONFIG_UNICODE is not set
> CONFIG_IO_WQ=3Dy
> # end of File systems
> =

> #
> # Security options
> #
> CONFIG_KEYS=3Dy
> # CONFIG_KEYS_REQUEST_CACHE is not set
> CONFIG_PERSISTENT_KEYRINGS=3Dy
> CONFIG_TRUSTED_KEYS=3Dy
> CONFIG_ENCRYPTED_KEYS=3Dy
> # CONFIG_KEY_DH_OPERATIONS is not set
> # CONFIG_SECURITY_DMESG_RESTRICT is not set
> CONFIG_SECURITY=3Dy
> CONFIG_SECURITY_WRITABLE_HOOKS=3Dy
> CONFIG_SECURITYFS=3Dy
> CONFIG_SECURITY_NETWORK=3Dy
> CONFIG_PAGE_TABLE_ISOLATION=3Dy
> CONFIG_SECURITY_NETWORK_XFRM=3Dy
> CONFIG_SECURITY_PATH=3Dy
> CONFIG_INTEL_TXT=3Dy
> CONFIG_LSM_MMAP_MIN_ADDR=3D65535
> CONFIG_HAVE_HARDENED_USERCOPY_ALLOCATOR=3Dy
> CONFIG_HARDENED_USERCOPY=3Dy
> CONFIG_FORTIFY_SOURCE=3Dy
> # CONFIG_STATIC_USERMODEHELPER is not set
> CONFIG_SECURITY_SELINUX=3Dy
> CONFIG_SECURITY_SELINUX_BOOTPARAM=3Dy
> CONFIG_SECURITY_SELINUX_DISABLE=3Dy
> CONFIG_SECURITY_SELINUX_DEVELOP=3Dy
> CONFIG_SECURITY_SELINUX_AVC_STATS=3Dy
> CONFIG_SECURITY_SELINUX_CHECKREQPROT_VALUE=3D1
> CONFIG_SECURITY_SELINUX_SIDTAB_HASH_BITS=3D9
> CONFIG_SECURITY_SELINUX_SID2STR_CACHE_SIZE=3D256
> # CONFIG_SECURITY_SMACK is not set
> # CONFIG_SECURITY_TOMOYO is not set
> CONFIG_SECURITY_APPARMOR=3Dy
> CONFIG_SECURITY_APPARMOR_HASH=3Dy
> CONFIG_SECURITY_APPARMOR_HASH_DEFAULT=3Dy
> # CONFIG_SECURITY_APPARMOR_DEBUG is not set
> # CONFIG_SECURITY_LOADPIN is not set
> CONFIG_SECURITY_YAMA=3Dy
> # CONFIG_SECURITY_SAFESETID is not set
> # CONFIG_SECURITY_LOCKDOWN_LSM is not set
> # CONFIG_SECURITY_LANDLOCK is not set
> CONFIG_INTEGRITY=3Dy
> CONFIG_INTEGRITY_SIGNATURE=3Dy
> CONFIG_INTEGRITY_ASYMMETRIC_KEYS=3Dy
> CONFIG_INTEGRITY_TRUSTED_KEYRING=3Dy
> # CONFIG_INTEGRITY_PLATFORM_KEYRING is not set
> CONFIG_INTEGRITY_AUDIT=3Dy
> CONFIG_IMA=3Dy
> CONFIG_IMA_MEASURE_PCR_IDX=3D10
> CONFIG_IMA_LSM_RULES=3Dy
> # CONFIG_IMA_TEMPLATE is not set
> CONFIG_IMA_NG_TEMPLATE=3Dy
> # CONFIG_IMA_SIG_TEMPLATE is not set
> CONFIG_IMA_DEFAULT_TEMPLATE=3D"ima-ng"
> CONFIG_IMA_DEFAULT_HASH_SHA1=3Dy
> # CONFIG_IMA_DEFAULT_HASH_SHA256 is not set
> # CONFIG_IMA_DEFAULT_HASH_SHA512 is not set
> CONFIG_IMA_DEFAULT_HASH=3D"sha1"
> # CONFIG_IMA_WRITE_POLICY is not set
> # CONFIG_IMA_READ_POLICY is not set
> CONFIG_IMA_APPRAISE=3Dy
> # CONFIG_IMA_ARCH_POLICY is not set
> # CONFIG_IMA_APPRAISE_BUILD_POLICY is not set
> CONFIG_IMA_APPRAISE_BOOTPARAM=3Dy
> # CONFIG_IMA_APPRAISE_MODSIG is not set
> CONFIG_IMA_TRUSTED_KEYRING=3Dy
> # CONFIG_IMA_BLACKLIST_KEYRING is not set
> # CONFIG_IMA_LOAD_X509 is not set
> CONFIG_IMA_MEASURE_ASYMMETRIC_KEYS=3Dy
> CONFIG_IMA_QUEUE_EARLY_BOOT_KEYS=3Dy
> # CONFIG_IMA_SECURE_AND_OR_TRUSTED_BOOT is not set
> # CONFIG_IMA_DISABLE_HTABLE is not set
> CONFIG_EVM=3Dy
> CONFIG_EVM_ATTR_FSUUID=3Dy
> # CONFIG_EVM_ADD_XATTRS is not set
> # CONFIG_EVM_LOAD_X509 is not set
> CONFIG_DEFAULT_SECURITY_SELINUX=3Dy
> # CONFIG_DEFAULT_SECURITY_APPARMOR is not set
> # CONFIG_DEFAULT_SECURITY_DAC is not set
> CONFIG_LSM=3D"landlock,lockdown,yama,loadpin,safesetid,integrity,selinux,=
smack,tomoyo,apparmor,bpf"
> =

> #
> # Kernel hardening options
> #
> =

> #
> # Memory initialization
> #
> CONFIG_INIT_STACK_NONE=3Dy
> # CONFIG_INIT_ON_ALLOC_DEFAULT_ON is not set
> # CONFIG_INIT_ON_FREE_DEFAULT_ON is not set
> # end of Memory initialization
> # end of Kernel hardening options
> # end of Security options
> =

> CONFIG_XOR_BLOCKS=3Dm
> CONFIG_ASYNC_CORE=3Dm
> CONFIG_ASYNC_MEMCPY=3Dm
> CONFIG_ASYNC_XOR=3Dm
> CONFIG_ASYNC_PQ=3Dm
> CONFIG_ASYNC_RAID6_RECOV=3Dm
> CONFIG_CRYPTO=3Dy
> =

> #
> # Crypto core or helper
> #
> CONFIG_CRYPTO_ALGAPI=3Dy
> CONFIG_CRYPTO_ALGAPI2=3Dy
> CONFIG_CRYPTO_AEAD=3Dy
> CONFIG_CRYPTO_AEAD2=3Dy
> CONFIG_CRYPTO_SKCIPHER=3Dy
> CONFIG_CRYPTO_SKCIPHER2=3Dy
> CONFIG_CRYPTO_HASH=3Dy
> CONFIG_CRYPTO_HASH2=3Dy
> CONFIG_CRYPTO_RNG=3Dy
> CONFIG_CRYPTO_RNG2=3Dy
> CONFIG_CRYPTO_RNG_DEFAULT=3Dy
> CONFIG_CRYPTO_AKCIPHER2=3Dy
> CONFIG_CRYPTO_AKCIPHER=3Dy
> CONFIG_CRYPTO_KPP2=3Dy
> CONFIG_CRYPTO_KPP=3Dm
> CONFIG_CRYPTO_ACOMP2=3Dy
> CONFIG_CRYPTO_MANAGER=3Dy
> CONFIG_CRYPTO_MANAGER2=3Dy
> CONFIG_CRYPTO_USER=3Dm
> CONFIG_CRYPTO_MANAGER_DISABLE_TESTS=3Dy
> CONFIG_CRYPTO_GF128MUL=3Dy
> CONFIG_CRYPTO_NULL=3Dy
> CONFIG_CRYPTO_NULL2=3Dy
> CONFIG_CRYPTO_PCRYPT=3Dm
> CONFIG_CRYPTO_CRYPTD=3Dy
> CONFIG_CRYPTO_AUTHENC=3Dm
> CONFIG_CRYPTO_TEST=3Dm
> CONFIG_CRYPTO_SIMD=3Dy
> =

> #
> # Public-key cryptography
> #
> CONFIG_CRYPTO_RSA=3Dy
> CONFIG_CRYPTO_DH=3Dm
> CONFIG_CRYPTO_ECC=3Dm
> CONFIG_CRYPTO_ECDH=3Dm
> # CONFIG_CRYPTO_ECDSA is not set
> # CONFIG_CRYPTO_ECRDSA is not set
> # CONFIG_CRYPTO_SM2 is not set
> # CONFIG_CRYPTO_CURVE25519 is not set
> # CONFIG_CRYPTO_CURVE25519_X86 is not set
> =

> #
> # Authenticated Encryption with Associated Data
> #
> CONFIG_CRYPTO_CCM=3Dm
> CONFIG_CRYPTO_GCM=3Dy
> CONFIG_CRYPTO_CHACHA20POLY1305=3Dm
> # CONFIG_CRYPTO_AEGIS128 is not set
> # CONFIG_CRYPTO_AEGIS128_AESNI_SSE2 is not set
> CONFIG_CRYPTO_SEQIV=3Dy
> CONFIG_CRYPTO_ECHAINIV=3Dm
> =

> #
> # Block modes
> #
> CONFIG_CRYPTO_CBC=3Dy
> CONFIG_CRYPTO_CFB=3Dy
> CONFIG_CRYPTO_CTR=3Dy
> CONFIG_CRYPTO_CTS=3Dm
> CONFIG_CRYPTO_ECB=3Dy
> CONFIG_CRYPTO_LRW=3Dm
> CONFIG_CRYPTO_OFB=3Dm
> CONFIG_CRYPTO_PCBC=3Dm
> CONFIG_CRYPTO_XTS=3Dm
> # CONFIG_CRYPTO_KEYWRAP is not set
> # CONFIG_CRYPTO_NHPOLY1305_SSE2 is not set
> # CONFIG_CRYPTO_NHPOLY1305_AVX2 is not set
> # CONFIG_CRYPTO_ADIANTUM is not set
> CONFIG_CRYPTO_ESSIV=3Dm
> =

> #
> # Hash modes
> #
> CONFIG_CRYPTO_CMAC=3Dm
> CONFIG_CRYPTO_HMAC=3Dy
> CONFIG_CRYPTO_XCBC=3Dm
> CONFIG_CRYPTO_VMAC=3Dm
> =

> #
> # Digest
> #
> CONFIG_CRYPTO_CRC32C=3Dy
> CONFIG_CRYPTO_CRC32C_INTEL=3Dm
> CONFIG_CRYPTO_CRC32=3Dm
> CONFIG_CRYPTO_CRC32_PCLMUL=3Dm
> CONFIG_CRYPTO_XXHASH=3Dm
> CONFIG_CRYPTO_BLAKE2B=3Dm
> # CONFIG_CRYPTO_BLAKE2S is not set
> # CONFIG_CRYPTO_BLAKE2S_X86 is not set
> CONFIG_CRYPTO_CRCT10DIF=3Dy
> CONFIG_CRYPTO_CRCT10DIF_PCLMUL=3Dm
> CONFIG_CRYPTO_GHASH=3Dy
> CONFIG_CRYPTO_POLY1305=3Dm
> CONFIG_CRYPTO_POLY1305_X86_64=3Dm
> CONFIG_CRYPTO_MD4=3Dm
> CONFIG_CRYPTO_MD5=3Dy
> CONFIG_CRYPTO_MICHAEL_MIC=3Dm
> CONFIG_CRYPTO_RMD160=3Dm
> CONFIG_CRYPTO_SHA1=3Dy
> CONFIG_CRYPTO_SHA1_SSSE3=3Dy
> CONFIG_CRYPTO_SHA256_SSSE3=3Dy
> CONFIG_CRYPTO_SHA512_SSSE3=3Dm
> CONFIG_CRYPTO_SHA256=3Dy
> CONFIG_CRYPTO_SHA512=3Dy
> CONFIG_CRYPTO_SHA3=3Dm
> # CONFIG_CRYPTO_SM3 is not set
> # CONFIG_CRYPTO_STREEBOG is not set
> CONFIG_CRYPTO_WP512=3Dm
> CONFIG_CRYPTO_GHASH_CLMUL_NI_INTEL=3Dm
> =

> #
> # Ciphers
> #
> CONFIG_CRYPTO_AES=3Dy
> # CONFIG_CRYPTO_AES_TI is not set
> CONFIG_CRYPTO_AES_NI_INTEL=3Dy
> CONFIG_CRYPTO_ANUBIS=3Dm
> CONFIG_CRYPTO_ARC4=3Dm
> CONFIG_CRYPTO_BLOWFISH=3Dm
> CONFIG_CRYPTO_BLOWFISH_COMMON=3Dm
> CONFIG_CRYPTO_BLOWFISH_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA=3Dm
> CONFIG_CRYPTO_CAMELLIA_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAMELLIA_AESNI_AVX2_X86_64=3Dm
> CONFIG_CRYPTO_CAST_COMMON=3Dm
> CONFIG_CRYPTO_CAST5=3Dm
> CONFIG_CRYPTO_CAST5_AVX_X86_64=3Dm
> CONFIG_CRYPTO_CAST6=3Dm
> CONFIG_CRYPTO_CAST6_AVX_X86_64=3Dm
> CONFIG_CRYPTO_DES=3Dm
> # CONFIG_CRYPTO_DES3_EDE_X86_64 is not set
> CONFIG_CRYPTO_FCRYPT=3Dm
> CONFIG_CRYPTO_KHAZAD=3Dm
> CONFIG_CRYPTO_CHACHA20=3Dm
> CONFIG_CRYPTO_CHACHA20_X86_64=3Dm
> CONFIG_CRYPTO_SEED=3Dm
> CONFIG_CRYPTO_SERPENT=3Dm
> CONFIG_CRYPTO_SERPENT_SSE2_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX_X86_64=3Dm
> CONFIG_CRYPTO_SERPENT_AVX2_X86_64=3Dm
> CONFIG_CRYPTO_SM4=3Dm
> # CONFIG_CRYPTO_SM4_AESNI_AVX_X86_64 is not set
> # CONFIG_CRYPTO_SM4_AESNI_AVX2_X86_64 is not set
> CONFIG_CRYPTO_TEA=3Dm
> CONFIG_CRYPTO_TWOFISH=3Dm
> CONFIG_CRYPTO_TWOFISH_COMMON=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64=3Dm
> CONFIG_CRYPTO_TWOFISH_X86_64_3WAY=3Dm
> CONFIG_CRYPTO_TWOFISH_AVX_X86_64=3Dm
> =

> #
> # Compression
> #
> CONFIG_CRYPTO_DEFLATE=3Dy
> CONFIG_CRYPTO_LZO=3Dy
> # CONFIG_CRYPTO_842 is not set
> # CONFIG_CRYPTO_LZ4 is not set
> # CONFIG_CRYPTO_LZ4HC is not set
> # CONFIG_CRYPTO_ZSTD is not set
> =

> #
> # Random Number Generation
> #
> CONFIG_CRYPTO_ANSI_CPRNG=3Dm
> CONFIG_CRYPTO_DRBG_MENU=3Dy
> CONFIG_CRYPTO_DRBG_HMAC=3Dy
> CONFIG_CRYPTO_DRBG_HASH=3Dy
> CONFIG_CRYPTO_DRBG_CTR=3Dy
> CONFIG_CRYPTO_DRBG=3Dy
> CONFIG_CRYPTO_JITTERENTROPY=3Dy
> CONFIG_CRYPTO_USER_API=3Dy
> CONFIG_CRYPTO_USER_API_HASH=3Dy
> CONFIG_CRYPTO_USER_API_SKCIPHER=3Dy
> CONFIG_CRYPTO_USER_API_RNG=3Dy
> # CONFIG_CRYPTO_USER_API_RNG_CAVP is not set
> CONFIG_CRYPTO_USER_API_AEAD=3Dy
> CONFIG_CRYPTO_USER_API_ENABLE_OBSOLETE=3Dy
> # CONFIG_CRYPTO_STATS is not set
> CONFIG_CRYPTO_HASH_INFO=3Dy
> =

> #
> # Crypto library routines
> #
> CONFIG_CRYPTO_LIB_AES=3Dy
> CONFIG_CRYPTO_LIB_ARC4=3Dm
> # CONFIG_CRYPTO_LIB_BLAKE2S is not set
> CONFIG_CRYPTO_ARCH_HAVE_LIB_CHACHA=3Dm
> CONFIG_CRYPTO_LIB_CHACHA_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_CHACHA is not set
> # CONFIG_CRYPTO_LIB_CURVE25519 is not set
> CONFIG_CRYPTO_LIB_DES=3Dm
> CONFIG_CRYPTO_LIB_POLY1305_RSIZE=3D11
> CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305=3Dm
> CONFIG_CRYPTO_LIB_POLY1305_GENERIC=3Dm
> # CONFIG_CRYPTO_LIB_POLY1305 is not set
> # CONFIG_CRYPTO_LIB_CHACHA20POLY1305 is not set
> CONFIG_CRYPTO_LIB_SHA256=3Dy
> CONFIG_CRYPTO_LIB_SM4=3Dm
> CONFIG_CRYPTO_HW=3Dy
> CONFIG_CRYPTO_DEV_PADLOCK=3Dm
> CONFIG_CRYPTO_DEV_PADLOCK_AES=3Dm
> CONFIG_CRYPTO_DEV_PADLOCK_SHA=3Dm
> # CONFIG_CRYPTO_DEV_ATMEL_ECC is not set
> # CONFIG_CRYPTO_DEV_ATMEL_SHA204A is not set
> CONFIG_CRYPTO_DEV_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_DD=3Dm
> CONFIG_CRYPTO_DEV_SP_CCP=3Dy
> CONFIG_CRYPTO_DEV_CCP_CRYPTO=3Dm
> CONFIG_CRYPTO_DEV_SP_PSP=3Dy
> # CONFIG_CRYPTO_DEV_CCP_DEBUGFS is not set
> CONFIG_CRYPTO_DEV_QAT=3Dm
> CONFIG_CRYPTO_DEV_QAT_DH895xCC=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXX=3Dm
> CONFIG_CRYPTO_DEV_QAT_C62X=3Dm
> # CONFIG_CRYPTO_DEV_QAT_4XXX is not set
> CONFIG_CRYPTO_DEV_QAT_DH895xCCVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C3XXXVF=3Dm
> CONFIG_CRYPTO_DEV_QAT_C62XVF=3Dm
> CONFIG_CRYPTO_DEV_NITROX=3Dm
> CONFIG_CRYPTO_DEV_NITROX_CNN55XX=3Dm
> # CONFIG_CRYPTO_DEV_VIRTIO is not set
> # CONFIG_CRYPTO_DEV_SAFEXCEL is not set
> # CONFIG_CRYPTO_DEV_AMLOGIC_GXL is not set
> CONFIG_ASYMMETRIC_KEY_TYPE=3Dy
> CONFIG_ASYMMETRIC_PUBLIC_KEY_SUBTYPE=3Dy
> # CONFIG_ASYMMETRIC_TPM_KEY_SUBTYPE is not set
> CONFIG_X509_CERTIFICATE_PARSER=3Dy
> # CONFIG_PKCS8_PRIVATE_KEY_PARSER is not set
> CONFIG_PKCS7_MESSAGE_PARSER=3Dy
> # CONFIG_PKCS7_TEST_KEY is not set
> CONFIG_SIGNED_PE_FILE_VERIFICATION=3Dy
> =

> #
> # Certificates for signature checking
> #
> CONFIG_MODULE_SIG_KEY=3D"certs/signing_key.pem"
> CONFIG_MODULE_SIG_KEY_TYPE_RSA=3Dy
> # CONFIG_MODULE_SIG_KEY_TYPE_ECDSA is not set
> CONFIG_SYSTEM_TRUSTED_KEYRING=3Dy
> CONFIG_SYSTEM_TRUSTED_KEYS=3D""
> # CONFIG_SYSTEM_EXTRA_CERTIFICATE is not set
> # CONFIG_SECONDARY_TRUSTED_KEYRING is not set
> CONFIG_SYSTEM_BLACKLIST_KEYRING=3Dy
> CONFIG_SYSTEM_BLACKLIST_HASH_LIST=3D""
> # CONFIG_SYSTEM_REVOCATION_LIST is not set
> # end of Certificates for signature checking
> =

> CONFIG_BINARY_PRINTF=3Dy
> =

> #
> # Library routines
> #
> CONFIG_RAID6_PQ=3Dm
> CONFIG_RAID6_PQ_BENCHMARK=3Dy
> # CONFIG_PACKING is not set
> CONFIG_BITREVERSE=3Dy
> CONFIG_GENERIC_STRNCPY_FROM_USER=3Dy
> CONFIG_GENERIC_STRNLEN_USER=3Dy
> CONFIG_GENERIC_NET_UTILS=3Dy
> CONFIG_GENERIC_FIND_FIRST_BIT=3Dy
> CONFIG_CORDIC=3Dm
> # CONFIG_PRIME_NUMBERS is not set
> CONFIG_RATIONAL=3Dy
> CONFIG_GENERIC_PCI_IOMAP=3Dy
> CONFIG_GENERIC_IOMAP=3Dy
> CONFIG_ARCH_USE_CMPXCHG_LOCKREF=3Dy
> CONFIG_ARCH_HAS_FAST_MULTIPLIER=3Dy
> CONFIG_ARCH_USE_SYM_ANNOTATIONS=3Dy
> CONFIG_CRC_CCITT=3Dy
> CONFIG_CRC16=3Dy
> CONFIG_CRC_T10DIF=3Dy
> CONFIG_CRC_ITU_T=3Dm
> CONFIG_CRC32=3Dy
> # CONFIG_CRC32_SELFTEST is not set
> CONFIG_CRC32_SLICEBY8=3Dy
> # CONFIG_CRC32_SLICEBY4 is not set
> # CONFIG_CRC32_SARWATE is not set
> # CONFIG_CRC32_BIT is not set
> # CONFIG_CRC64 is not set
> # CONFIG_CRC4 is not set
> CONFIG_CRC7=3Dm
> CONFIG_LIBCRC32C=3Dm
> CONFIG_CRC8=3Dm
> CONFIG_XXHASH=3Dy
> # CONFIG_RANDOM32_SELFTEST is not set
> CONFIG_ZLIB_INFLATE=3Dy
> CONFIG_ZLIB_DEFLATE=3Dy
> CONFIG_LZO_COMPRESS=3Dy
> CONFIG_LZO_DECOMPRESS=3Dy
> CONFIG_LZ4_DECOMPRESS=3Dy
> CONFIG_ZSTD_COMPRESS=3Dm
> CONFIG_ZSTD_DECOMPRESS=3Dy
> CONFIG_XZ_DEC=3Dy
> CONFIG_XZ_DEC_X86=3Dy
> CONFIG_XZ_DEC_POWERPC=3Dy
> CONFIG_XZ_DEC_IA64=3Dy
> CONFIG_XZ_DEC_ARM=3Dy
> CONFIG_XZ_DEC_ARMTHUMB=3Dy
> CONFIG_XZ_DEC_SPARC=3Dy
> # CONFIG_XZ_DEC_MICROLZMA is not set
> CONFIG_XZ_DEC_BCJ=3Dy
> # CONFIG_XZ_DEC_TEST is not set
> CONFIG_DECOMPRESS_GZIP=3Dy
> CONFIG_DECOMPRESS_BZIP2=3Dy
> CONFIG_DECOMPRESS_LZMA=3Dy
> CONFIG_DECOMPRESS_XZ=3Dy
> CONFIG_DECOMPRESS_LZO=3Dy
> CONFIG_DECOMPRESS_LZ4=3Dy
> CONFIG_DECOMPRESS_ZSTD=3Dy
> CONFIG_GENERIC_ALLOCATOR=3Dy
> CONFIG_REED_SOLOMON=3Dm
> CONFIG_REED_SOLOMON_ENC8=3Dy
> CONFIG_REED_SOLOMON_DEC8=3Dy
> CONFIG_TEXTSEARCH=3Dy
> CONFIG_TEXTSEARCH_KMP=3Dm
> CONFIG_TEXTSEARCH_BM=3Dm
> CONFIG_TEXTSEARCH_FSM=3Dm
> CONFIG_INTERVAL_TREE=3Dy
> CONFIG_XARRAY_MULTI=3Dy
> CONFIG_ASSOCIATIVE_ARRAY=3Dy
> CONFIG_HAS_IOMEM=3Dy
> CONFIG_HAS_IOPORT_MAP=3Dy
> CONFIG_HAS_DMA=3Dy
> CONFIG_DMA_OPS=3Dy
> CONFIG_NEED_SG_DMA_LENGTH=3Dy
> CONFIG_NEED_DMA_MAP_STATE=3Dy
> CONFIG_ARCH_DMA_ADDR_T_64BIT=3Dy
> CONFIG_SWIOTLB=3Dy
> # CONFIG_DMA_API_DEBUG is not set
> # CONFIG_DMA_MAP_BENCHMARK is not set
> CONFIG_SGL_ALLOC=3Dy
> CONFIG_CHECK_SIGNATURE=3Dy
> CONFIG_CPUMASK_OFFSTACK=3Dy
> CONFIG_CPU_RMAP=3Dy
> CONFIG_DQL=3Dy
> CONFIG_GLOB=3Dy
> # CONFIG_GLOB_SELFTEST is not set
> CONFIG_NLATTR=3Dy
> CONFIG_CLZ_TAB=3Dy
> CONFIG_IRQ_POLL=3Dy
> CONFIG_MPILIB=3Dy
> CONFIG_SIGNATURE=3Dy
> CONFIG_OID_REGISTRY=3Dy
> CONFIG_UCS2_STRING=3Dy
> CONFIG_HAVE_GENERIC_VDSO=3Dy
> CONFIG_GENERIC_GETTIMEOFDAY=3Dy
> CONFIG_GENERIC_VDSO_TIME_NS=3Dy
> CONFIG_FONT_SUPPORT=3Dy
> # CONFIG_FONTS is not set
> CONFIG_FONT_8x8=3Dy
> CONFIG_FONT_8x16=3Dy
> CONFIG_SG_POOL=3Dy
> CONFIG_ARCH_HAS_PMEM_API=3Dy
> CONFIG_MEMREGION=3Dy
> CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE=3Dy
> CONFIG_ARCH_HAS_COPY_MC=3Dy
> CONFIG_ARCH_STACKWALK=3Dy
> CONFIG_SBITMAP=3Dy
> # end of Library routines
> =

> CONFIG_ASN1_ENCODER=3Dy
> =

> #
> # Kernel hacking
> #
> =

> #
> # printk and dmesg options
> #
> CONFIG_PRINTK_TIME=3Dy
> CONFIG_PRINTK_CALLER=3Dy
> # CONFIG_STACKTRACE_BUILD_ID is not set
> CONFIG_CONSOLE_LOGLEVEL_DEFAULT=3D7
> CONFIG_CONSOLE_LOGLEVEL_QUIET=3D4
> CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3D4
> CONFIG_BOOT_PRINTK_DELAY=3Dy
> CONFIG_DYNAMIC_DEBUG=3Dy
> CONFIG_DYNAMIC_DEBUG_CORE=3Dy
> CONFIG_SYMBOLIC_ERRNAME=3Dy
> CONFIG_DEBUG_BUGVERBOSE=3Dy
> # end of printk and dmesg options
> =

> #
> # Compile-time checks and compiler options
> #
> CONFIG_DEBUG_INFO=3Dy
> CONFIG_DEBUG_INFO_REDUCED=3Dy
> # CONFIG_DEBUG_INFO_COMPRESSED is not set
> # CONFIG_DEBUG_INFO_SPLIT is not set
> # CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT is not set
> CONFIG_DEBUG_INFO_DWARF4=3Dy
> # CONFIG_DEBUG_INFO_DWARF5 is not set
> CONFIG_PAHOLE_HAS_SPLIT_BTF=3Dy
> # CONFIG_GDB_SCRIPTS is not set
> CONFIG_FRAME_WARN=3D2048
> CONFIG_STRIP_ASM_SYMS=3Dy
> # CONFIG_READABLE_ASM is not set
> # CONFIG_HEADERS_INSTALL is not set
> CONFIG_DEBUG_SECTION_MISMATCH=3Dy
> CONFIG_SECTION_MISMATCH_WARN_ONLY=3Dy
> CONFIG_STACK_VALIDATION=3Dy
> # CONFIG_DEBUG_FORCE_WEAK_PER_CPU is not set
> # end of Compile-time checks and compiler options
> =

> #
> # Generic Kernel Debugging Instruments
> #
> CONFIG_MAGIC_SYSRQ=3Dy
> CONFIG_MAGIC_SYSRQ_DEFAULT_ENABLE=3D0x1
> CONFIG_MAGIC_SYSRQ_SERIAL=3Dy
> CONFIG_MAGIC_SYSRQ_SERIAL_SEQUENCE=3D""
> CONFIG_DEBUG_FS=3Dy
> CONFIG_DEBUG_FS_ALLOW_ALL=3Dy
> # CONFIG_DEBUG_FS_DISALLOW_MOUNT is not set
> # CONFIG_DEBUG_FS_ALLOW_NONE is not set
> CONFIG_HAVE_ARCH_KGDB=3Dy
> # CONFIG_KGDB is not set
> CONFIG_ARCH_HAS_UBSAN_SANITIZE_ALL=3Dy
> # CONFIG_UBSAN is not set
> CONFIG_HAVE_ARCH_KCSAN=3Dy
> # end of Generic Kernel Debugging Instruments
> =

> CONFIG_DEBUG_KERNEL=3Dy
> CONFIG_DEBUG_MISC=3Dy
> =

> #
> # Memory Debugging
> #
> # CONFIG_PAGE_EXTENSION is not set
> # CONFIG_DEBUG_PAGEALLOC is not set
> # CONFIG_PAGE_OWNER is not set
> # CONFIG_PAGE_POISONING is not set
> # CONFIG_DEBUG_PAGE_REF is not set
> # CONFIG_DEBUG_RODATA_TEST is not set
> CONFIG_ARCH_HAS_DEBUG_WX=3Dy
> # CONFIG_DEBUG_WX is not set
> CONFIG_GENERIC_PTDUMP=3Dy
> # CONFIG_PTDUMP_DEBUGFS is not set
> # CONFIG_DEBUG_OBJECTS is not set
> # CONFIG_SLUB_DEBUG_ON is not set
> # CONFIG_SLUB_STATS is not set
> CONFIG_HAVE_DEBUG_KMEMLEAK=3Dy
> # CONFIG_DEBUG_KMEMLEAK is not set
> # CONFIG_DEBUG_STACK_USAGE is not set
> # CONFIG_SCHED_STACK_END_CHECK is not set
> CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE=3Dy
> # CONFIG_DEBUG_VM is not set
> # CONFIG_DEBUG_VM_PGTABLE is not set
> CONFIG_ARCH_HAS_DEBUG_VIRTUAL=3Dy
> # CONFIG_DEBUG_VIRTUAL is not set
> CONFIG_DEBUG_MEMORY_INIT=3Dy
> # CONFIG_DEBUG_PER_CPU_MAPS is not set
> CONFIG_HAVE_ARCH_KASAN=3Dy
> CONFIG_HAVE_ARCH_KASAN_VMALLOC=3Dy
> CONFIG_CC_HAS_KASAN_GENERIC=3Dy
> CONFIG_CC_HAS_WORKING_NOSANITIZE_ADDRESS=3Dy
> # CONFIG_KASAN is not set
> CONFIG_HAVE_ARCH_KFENCE=3Dy
> # CONFIG_KFENCE is not set
> # end of Memory Debugging
> =

> CONFIG_DEBUG_SHIRQ=3Dy
> =

> #
> # Debug Oops, Lockups and Hangs
> #
> CONFIG_PANIC_ON_OOPS=3Dy
> CONFIG_PANIC_ON_OOPS_VALUE=3D1
> CONFIG_PANIC_TIMEOUT=3D0
> CONFIG_LOCKUP_DETECTOR=3Dy
> CONFIG_SOFTLOCKUP_DETECTOR=3Dy
> # CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC is not set
> CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC_VALUE=3D0
> CONFIG_HARDLOCKUP_DETECTOR_PERF=3Dy
> CONFIG_HARDLOCKUP_CHECK_TIMESTAMP=3Dy
> CONFIG_HARDLOCKUP_DETECTOR=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC=3Dy
> CONFIG_BOOTPARAM_HARDLOCKUP_PANIC_VALUE=3D1
> CONFIG_DETECT_HUNG_TASK=3Dy
> CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=3D480
> # CONFIG_BOOTPARAM_HUNG_TASK_PANIC is not set
> CONFIG_BOOTPARAM_HUNG_TASK_PANIC_VALUE=3D0
> CONFIG_WQ_WATCHDOG=3Dy
> # CONFIG_TEST_LOCKUP is not set
> # end of Debug Oops, Lockups and Hangs
> =

> #
> # Scheduler Debugging
> #
> CONFIG_SCHED_DEBUG=3Dy
> CONFIG_SCHED_INFO=3Dy
> CONFIG_SCHEDSTATS=3Dy
> # end of Scheduler Debugging
> =

> # CONFIG_DEBUG_TIMEKEEPING is not set
> =

> #
> # Lock Debugging (spinlocks, mutexes, etc...)
> #
> CONFIG_LOCK_DEBUGGING_SUPPORT=3Dy
> # CONFIG_PROVE_LOCKING is not set
> # CONFIG_LOCK_STAT is not set
> # CONFIG_DEBUG_RT_MUTEXES is not set
> # CONFIG_DEBUG_SPINLOCK is not set
> # CONFIG_DEBUG_MUTEXES is not set
> # CONFIG_DEBUG_WW_MUTEX_SLOWPATH is not set
> # CONFIG_DEBUG_RWSEMS is not set
> # CONFIG_DEBUG_LOCK_ALLOC is not set
> CONFIG_DEBUG_ATOMIC_SLEEP=3Dy
> # CONFIG_DEBUG_LOCKING_API_SELFTESTS is not set
> # CONFIG_LOCK_TORTURE_TEST is not set
> # CONFIG_WW_MUTEX_SELFTEST is not set
> # CONFIG_SCF_TORTURE_TEST is not set
> # CONFIG_CSD_LOCK_WAIT_DEBUG is not set
> # end of Lock Debugging (spinlocks, mutexes, etc...)
> =

> # CONFIG_DEBUG_IRQFLAGS is not set
> CONFIG_STACKTRACE=3Dy
> # CONFIG_WARN_ALL_UNSEEDED_RANDOM is not set
> # CONFIG_DEBUG_KOBJECT is not set
> =

> #
> # Debug kernel data structures
> #
> CONFIG_DEBUG_LIST=3Dy
> # CONFIG_DEBUG_PLIST is not set
> # CONFIG_DEBUG_SG is not set
> # CONFIG_DEBUG_NOTIFIERS is not set
> CONFIG_BUG_ON_DATA_CORRUPTION=3Dy
> # end of Debug kernel data structures
> =

> # CONFIG_DEBUG_CREDENTIALS is not set
> =

> #
> # RCU Debugging
> #
> # CONFIG_RCU_SCALE_TEST is not set
> # CONFIG_RCU_TORTURE_TEST is not set
> # CONFIG_RCU_REF_SCALE_TEST is not set
> CONFIG_RCU_CPU_STALL_TIMEOUT=3D60
> # CONFIG_RCU_TRACE is not set
> # CONFIG_RCU_EQS_DEBUG is not set
> # end of RCU Debugging
> =

> # CONFIG_DEBUG_WQ_FORCE_RR_CPU is not set
> # CONFIG_CPU_HOTPLUG_STATE_CONTROL is not set
> CONFIG_LATENCYTOP=3Dy
> CONFIG_USER_STACKTRACE_SUPPORT=3Dy
> CONFIG_NOP_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_TRACER=3Dy
> CONFIG_HAVE_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_HAVE_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_HAVE_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=3Dy
> CONFIG_HAVE_FENTRY=3Dy
> CONFIG_HAVE_OBJTOOL_MCOUNT=3Dy
> CONFIG_HAVE_C_RECORDMCOUNT=3Dy
> CONFIG_TRACER_MAX_TRACE=3Dy
> CONFIG_TRACE_CLOCK=3Dy
> CONFIG_RING_BUFFER=3Dy
> CONFIG_EVENT_TRACING=3Dy
> CONFIG_CONTEXT_SWITCH_TRACER=3Dy
> CONFIG_TRACING=3Dy
> CONFIG_GENERIC_TRACER=3Dy
> CONFIG_TRACING_SUPPORT=3Dy
> CONFIG_FTRACE=3Dy
> # CONFIG_BOOTTIME_TRACING is not set
> CONFIG_FUNCTION_TRACER=3Dy
> CONFIG_FUNCTION_GRAPH_TRACER=3Dy
> CONFIG_DYNAMIC_FTRACE=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_REGS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS=3Dy
> CONFIG_DYNAMIC_FTRACE_WITH_ARGS=3Dy
> CONFIG_FUNCTION_PROFILER=3Dy
> CONFIG_STACK_TRACER=3Dy
> # CONFIG_IRQSOFF_TRACER is not set
> CONFIG_SCHED_TRACER=3Dy
> CONFIG_HWLAT_TRACER=3Dy
> # CONFIG_OSNOISE_TRACER is not set
> # CONFIG_TIMERLAT_TRACER is not set
> # CONFIG_MMIOTRACE is not set
> CONFIG_FTRACE_SYSCALLS=3Dy
> CONFIG_TRACER_SNAPSHOT=3Dy
> # CONFIG_TRACER_SNAPSHOT_PER_CPU_SWAP is not set
> CONFIG_BRANCH_PROFILE_NONE=3Dy
> # CONFIG_PROFILE_ANNOTATED_BRANCHES is not set
> CONFIG_BLK_DEV_IO_TRACE=3Dy
> CONFIG_KPROBE_EVENTS=3Dy
> # CONFIG_KPROBE_EVENTS_ON_NOTRACE is not set
> CONFIG_UPROBE_EVENTS=3Dy
> CONFIG_BPF_EVENTS=3Dy
> CONFIG_DYNAMIC_EVENTS=3Dy
> CONFIG_PROBE_EVENTS=3Dy
> # CONFIG_BPF_KPROBE_OVERRIDE is not set
> CONFIG_FTRACE_MCOUNT_RECORD=3Dy
> CONFIG_FTRACE_MCOUNT_USE_CC=3Dy
> CONFIG_TRACING_MAP=3Dy
> CONFIG_SYNTH_EVENTS=3Dy
> CONFIG_HIST_TRIGGERS=3Dy
> # CONFIG_TRACE_EVENT_INJECT is not set
> # CONFIG_TRACEPOINT_BENCHMARK is not set
> CONFIG_RING_BUFFER_BENCHMARK=3Dm
> # CONFIG_TRACE_EVAL_MAP_FILE is not set
> # CONFIG_FTRACE_RECORD_RECURSION is not set
> # CONFIG_FTRACE_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_STARTUP_TEST is not set
> # CONFIG_RING_BUFFER_VALIDATE_TIME_DELTAS is not set
> # CONFIG_PREEMPTIRQ_DELAY_TEST is not set
> # CONFIG_SYNTH_EVENT_GEN_TEST is not set
> # CONFIG_KPROBE_EVENT_GEN_TEST is not set
> # CONFIG_HIST_TRIGGERS_DEBUG is not set
> CONFIG_PROVIDE_OHCI1394_DMA_INIT=3Dy
> # CONFIG_SAMPLES is not set
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT=3Dy
> CONFIG_HAVE_SAMPLE_FTRACE_DIRECT_MULTI=3Dy
> CONFIG_ARCH_HAS_DEVMEM_IS_ALLOWED=3Dy
> CONFIG_STRICT_DEVMEM=3Dy
> # CONFIG_IO_STRICT_DEVMEM is not set
> =

> #
> # x86 Debugging
> #
> CONFIG_TRACE_IRQFLAGS_NMI_SUPPORT=3Dy
> CONFIG_EARLY_PRINTK_USB=3Dy
> CONFIG_X86_VERBOSE_BOOTUP=3Dy
> CONFIG_EARLY_PRINTK=3Dy
> CONFIG_EARLY_PRINTK_DBGP=3Dy
> CONFIG_EARLY_PRINTK_USB_XDBC=3Dy
> # CONFIG_EFI_PGT_DUMP is not set
> # CONFIG_DEBUG_TLBFLUSH is not set
> CONFIG_HAVE_MMIOTRACE_SUPPORT=3Dy
> CONFIG_X86_DECODER_SELFTEST=3Dy
> CONFIG_IO_DELAY_0X80=3Dy
> # CONFIG_IO_DELAY_0XED is not set
> # CONFIG_IO_DELAY_UDELAY is not set
> # CONFIG_IO_DELAY_NONE is not set
> CONFIG_DEBUG_BOOT_PARAMS=3Dy
> # CONFIG_CPA_DEBUG is not set
> # CONFIG_DEBUG_ENTRY is not set
> # CONFIG_DEBUG_NMI_SELFTEST is not set
> # CONFIG_X86_DEBUG_FPU is not set
> # CONFIG_PUNIT_ATOM_DEBUG is not set
> CONFIG_UNWINDER_ORC=3Dy
> # CONFIG_UNWINDER_FRAME_POINTER is not set
> # end of x86 Debugging
> =

> #
> # Kernel Testing and Coverage
> #
> # CONFIG_KUNIT is not set
> # CONFIG_NOTIFIER_ERROR_INJECTION is not set
> CONFIG_FUNCTION_ERROR_INJECTION=3Dy
> # CONFIG_FAULT_INJECTION is not set
> CONFIG_ARCH_HAS_KCOV=3Dy
> CONFIG_CC_HAS_SANCOV_TRACE_PC=3Dy
> # CONFIG_KCOV is not set
> CONFIG_RUNTIME_TESTING_MENU=3Dy
> # CONFIG_LKDTM is not set
> # CONFIG_TEST_MIN_HEAP is not set
> # CONFIG_TEST_DIV64 is not set
> # CONFIG_BACKTRACE_SELF_TEST is not set
> # CONFIG_RBTREE_TEST is not set
> # CONFIG_REED_SOLOMON_TEST is not set
> # CONFIG_INTERVAL_TREE_TEST is not set
> # CONFIG_PERCPU_TEST is not set
> CONFIG_ATOMIC64_SELFTEST=3Dy
> # CONFIG_ASYNC_RAID6_TEST is not set
> # CONFIG_TEST_HEXDUMP is not set
> # CONFIG_STRING_SELFTEST is not set
> # CONFIG_TEST_STRING_HELPERS is not set
> # CONFIG_TEST_STRSCPY is not set
> # CONFIG_TEST_KSTRTOX is not set
> # CONFIG_TEST_PRINTF is not set
> # CONFIG_TEST_SCANF is not set
> # CONFIG_TEST_BITMAP is not set
> # CONFIG_TEST_UUID is not set
> # CONFIG_TEST_XARRAY is not set
> # CONFIG_TEST_OVERFLOW is not set
> # CONFIG_TEST_RHASHTABLE is not set
> # CONFIG_TEST_HASH is not set
> # CONFIG_TEST_IDA is not set
> # CONFIG_TEST_LKM is not set
> # CONFIG_TEST_BITOPS is not set
> # CONFIG_TEST_VMALLOC is not set
> # CONFIG_TEST_USER_COPY is not set
> CONFIG_TEST_BPF=3Dm
> # CONFIG_TEST_BLACKHOLE_DEV is not set
> # CONFIG_FIND_BIT_BENCHMARK is not set
> # CONFIG_TEST_FIRMWARE is not set
> # CONFIG_TEST_SYSCTL is not set
> # CONFIG_TEST_UDELAY is not set
> # CONFIG_TEST_STATIC_KEYS is not set
> # CONFIG_TEST_KMOD is not set
> # CONFIG_TEST_MEMCAT_P is not set
> # CONFIG_TEST_LIVEPATCH is not set
> # CONFIG_TEST_STACKINIT is not set
> # CONFIG_TEST_MEMINIT is not set
> # CONFIG_TEST_HMM is not set
> # CONFIG_TEST_FREE_PAGES is not set
> # CONFIG_TEST_FPU is not set
> # CONFIG_TEST_CLOCKSOURCE_WATCHDOG is not set
> CONFIG_ARCH_USE_MEMTEST=3Dy
> # CONFIG_MEMTEST is not set
> # CONFIG_HYPERV_TESTING is not set
> # end of Kernel Testing and Coverage
> # end of Kernel hacking

> #!/bin/sh
> =

> export_top_env()
> {
> 	export suite=3D'fsmark'
> 	export testcase=3D'fsmark'
> 	export category=3D'benchmark'
> 	export iterations=3D8
> 	export nr_threads=3D4
> 	export job_origin=3D'fsmark-1ssd-nvme-small.yaml'
> 	export queue_cmdline_keys=3D'branch
> commit'
> 	export queue=3D'validate'
> 	export testbox=3D'lkp-csl-2ap4'
> 	export tbox_group=3D'lkp-csl-2ap4'
> 	export kconfig=3D'x86_64-rhel-8.3'
> 	export submit_id=3D'61e15820f05c2c6d34a8c32f'
> 	export job_file=3D'/lkp/jobs/scheduled/lkp-csl-2ap4/fsmark-performance-1=
SSD-8K-btrfs-8-16d-256fpd-4-fsyncBeforeClose-24G-ucode=3D0x5003006-debian-1=
0.4-x86_64-20200603.cgz-1a61b300c09-20220114-27956-1t9w6di-3.yaml'
> 	export id=3D'30760960528f87554d426b02ae9c6f134e7f1946'
> 	export queuer_version=3D'/lkp-src'
> 	export model=3D'Cascade Lake'
> 	export nr_node=3D4
> 	export nr_cpu=3D192
> 	export memory=3D'192G'
> 	export ssd_partitions=3D'/dev/disk/by-id/nvme-INTEL_SSDPECME016T4_CVF870=
91000G1P6IGN-*-part1'
> 	export rootfs_partition=3D'LABEL=3DLKP-ROOTFS'
> 	export kernel_cmdline_hw=3D'acpi_rsdp=3D0x67f44014'
> 	export brand=3D'Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz'
> 	export need_kconfig=3D'BLK_DEV_SD
> SCSI
> {"BLOCK"=3D>"y"}
> SATA_AHCI
> SATA_AHCI_PLATFORM
> ATA
> {"PCI"=3D>"y"}
> BTRFS_FS
> NFSD'
> 	export commit=3D'1a61b300c09b1d034534372349e8f9d3aba6c392'
> 	export need_kconfig_hw=3D'{"IGB"=3D>"y"}
> BLK_DEV_NVME'
> 	export ucode=3D'0x5003006'
> 	export enqueue_time=3D'2022-01-14 19:01:52 +0800'
> 	export _id=3D'61e15820f05c2c6d34a8c32f'
> 	export _rt=3D'/result/fsmark/performance-1SSD-8K-btrfs-8-16d-256fpd-4-fs=
yncBeforeClose-24G-ucode=3D0x5003006/lkp-csl-2ap4/debian-10.4-x86_64-202006=
03.cgz/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372349e8f9d3aba6c392'
> 	export user=3D'lkp'
> 	export compiler=3D'gcc-9'
> 	export LKP_SERVER=3D'internal-lkp-server'
> 	export head_commit=3D'23d9943864d9bb4a4476d4237ff603021281b74a'
> 	export base_commit=3D'c9e6606c7fe92b50a02ce51dda82586ebdf99b48'
> 	export branch=3D'linux-next/master'
> 	export rootfs=3D'debian-10.4-x86_64-20200603.cgz'
> 	export result_root=3D'/result/fsmark/performance-1SSD-8K-btrfs-8-16d-256=
fpd-4-fsyncBeforeClose-24G-ucode=3D0x5003006/lkp-csl-2ap4/debian-10.4-x86_6=
4-20200603.cgz/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372349e8f9d3aba6c3=
92/3'
> 	export scheduler_version=3D'/lkp/lkp/.src-20220114-102716'
> 	export arch=3D'x86_64'
> 	export max_uptime=3D2100
> 	export initrd=3D'/osimage/debian/debian-10.4-x86_64-20200603.cgz'
> 	export bootloader_append=3D'root=3D/dev/ram0
> RESULT_ROOT=3D/result/fsmark/performance-1SSD-8K-btrfs-8-16d-256fpd-4-fsy=
ncBeforeClose-24G-ucode=3D0x5003006/lkp-csl-2ap4/debian-10.4-x86_64-2020060=
3.cgz/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372349e8f9d3aba6c392/3
> BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372349e=
8f9d3aba6c392/vmlinuz-5.16.0-rc8-00117-g1a61b300c09b
> branch=3Dlinux-next/master
> job=3D/lkp/jobs/scheduled/lkp-csl-2ap4/fsmark-performance-1SSD-8K-btrfs-8=
-16d-256fpd-4-fsyncBeforeClose-24G-ucode=3D0x5003006-debian-10.4-x86_64-202=
00603.cgz-1a61b300c09-20220114-27956-1t9w6di-3.yaml
> user=3Dlkp
> ARCH=3Dx86_64
> kconfig=3Dx86_64-rhel-8.3
> commit=3D1a61b300c09b1d034534372349e8f9d3aba6c392
> acpi_rsdp=3D0x67f44014
> max_uptime=3D2100
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
> 	export modules_initrd=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d=
034534372349e8f9d3aba6c392/modules.cgz'
> 	export bm_initrd=3D'/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ip=
config_20200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20220=
105.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608=
.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/fs_20210917.cgz,/osimage=
/pkg/debian-10.4-x86_64-20200603.cgz/fsmark-x86_64-698ee57-1_20220112.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/osimage/d=
eps/debian-10.4-x86_64-20200603.cgz/turbostat_20200721.cgz,/osimage/pkg/deb=
ian-10.4-x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200721.cgz,/osimage/d=
eps/debian-10.4-x86_64-20200603.cgz/perf_20220101.cgz,/osimage/pkg/debian-1=
0.4-x86_64-20200603.cgz/perf-x86_64-362f533a2a10-1_20220113.cgz,/osimage/pk=
g/debian-10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cgz,/osimag=
e/deps/debian-10.4-x86_64-20200603.cgz/hw_20200715.cgz'
> 	export ucode_initrd=3D'/osimage/ucode/intel-ucode-20210222.cgz'
> 	export lkp_initrd=3D'/osimage/user/lkp/lkp-x86_64.cgz'
> 	export site=3D'inn'
> 	export LKP_CGI_PORT=3D80
> 	export LKP_CIFS_PORT=3D139
> 	export last_kernel=3D'5.16.0-rc8-06580-g23d9943864d9'
> 	export repeat_to=3D6
> 	export schedule_notify_address=3D
> 	export kernel=3D'/pkg/linux/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d03453437=
2349e8f9d3aba6c392/vmlinuz-5.16.0-rc8-00117-g1a61b300c09b'
> 	export dequeue_time=3D'2022-01-14 19:29:13 +0800'
> 	export job_initrd=3D'/lkp/jobs/scheduled/lkp-csl-2ap4/fsmark-performance=
-1SSD-8K-btrfs-8-16d-256fpd-4-fsyncBeforeClose-24G-ucode=3D0x5003006-debian=
-10.4-x86_64-20200603.cgz-1a61b300c09-20220114-27956-1t9w6di-3.cgz'
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

> 	run_setup nr_ssd=3D1 $LKP_SRC/setup/disk
> =

> 	run_setup fs=3D'btrfs' $LKP_SRC/setup/fs
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
> 	run_monitor debug_mode=3D0 $LKP_SRC/monitors/no-stdout/wrapper perf-prof=
ile
> 	run_monitor $LKP_SRC/monitors/wrapper oom-killer
> 	run_monitor $LKP_SRC/monitors/plain/watchdog
> =

> 	run_test filesize=3D'8K' test_size=3D'24G' sync_method=3D'fsyncBeforeClo=
se' nr_directories=3D'16d' nr_files_per_directory=3D'256fpd' $LKP_SRC/tests=
/wrapper fsmark
> }
> =

> extract_stats()
> {
> 	export stats_part_begin=3D
> 	export stats_part_end=3D
> =

> 	env filesize=3D'8K' test_size=3D'24G' sync_method=3D'fsyncBeforeClose' n=
r_directories=3D'16d' nr_files_per_directory=3D'256fpd' $LKP_SRC/stats/wrap=
per fsmark
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
> 	env debug_mode=3D0 $LKP_SRC/stats/wrapper perf-profile
> =

> 	$LKP_SRC/stats/wrapper time fsmark.time
> 	$LKP_SRC/stats/wrapper dmesg
> 	$LKP_SRC/stats/wrapper kmsg
> 	$LKP_SRC/stats/wrapper last_state
> 	$LKP_SRC/stats/wrapper stderr
> 	$LKP_SRC/stats/wrapper time
> }
> =

> "$@"

> ---
> :#! jobs/fsmark-1ssd-nvme-small.yaml:
> suite: fsmark
> testcase: fsmark
> category: benchmark
> iterations: 8
> disk: 1SSD
> nr_threads: 4
> fs: btrfs
> fsmark:
>   filesize: 8K
>   test_size: 24G
>   sync_method: fsyncBeforeClose
>   nr_directories: 16d
>   nr_files_per_directory: 256fpd
> job_origin: fsmark-1ssd-nvme-small.yaml
> :#! queue options:
> queue_cmdline_keys:
> - branch
> - commit
> queue: bisect
> testbox: lkp-csl-2ap4
> tbox_group: lkp-csl-2ap4
> kconfig: x86_64-rhel-8.3
> submit_id: 61e1081df05c2c5b1b205913
> job_file: "/lkp/jobs/scheduled/lkp-csl-2ap4/fsmark-performance-1SSD-8K-bt=
rfs-8-16d-256fpd-4-fsyncBeforeClose-24G-ucode=3D0x5003006-debian-10.4-x86_6=
4-20200603.cgz-1a61b300c09-20220114-23323-bwklhd-2.yaml"
> id: a33a2eac220eacd1d900b8174d5b09d4b19de90d
> queuer_version: "/lkp-src"
> :#! hosts/lkp-csl-2ap4:
> model: Cascade Lake
> nr_node: 4
> nr_cpu: 192
> memory: 192G
> ssd_partitions: "/dev/disk/by-id/nvme-INTEL_SSDPECME016T4_CVF87091000G1P6=
IGN-*-part1"
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
>   debug_mode: 0
> :#! include/category/ALL:
> cpufreq_governor: performance
> :#! include/disk/nr_ssd:
> need_kconfig:
> - BLK_DEV_SD
> - SCSI
> - BLOCK: y
> - SATA_AHCI
> - SATA_AHCI_PLATFORM
> - ATA
> - PCI: y
> - BTRFS_FS
> - NFSD
> :#! include/fs/OTHERS:
> :#! include/queue/cyclic:
> commit: 1a61b300c09b1d034534372349e8f9d3aba6c392
> :#! include/testbox/lkp-csl-2ap4:
> need_kconfig_hw:
> - IGB: y
> - BLK_DEV_NVME
> ucode: '0x5003006'
> :#! include/fsmark:
> enqueue_time: 2022-01-14 13:20:29.435699947 +08:00
> _id: 61e10d96f05c2c5b1b205915
> _rt: "/result/fsmark/performance-1SSD-8K-btrfs-8-16d-256fpd-4-fsyncBefore=
Close-24G-ucode=3D0x5003006/lkp-csl-2ap4/debian-10.4-x86_64-20200603.cgz/x8=
6_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372349e8f9d3aba6c392"
> :#! schedule options:
> user: lkp
> compiler: gcc-9
> LKP_SERVER: internal-lkp-server
> head_commit: 23d9943864d9bb4a4476d4237ff603021281b74a
> base_commit: c9e6606c7fe92b50a02ce51dda82586ebdf99b48
> branch: linux-devel/devel-hourly-20220110-012702
> rootfs: debian-10.4-x86_64-20200603.cgz
> result_root: "/result/fsmark/performance-1SSD-8K-btrfs-8-16d-256fpd-4-fsy=
ncBeforeClose-24G-ucode=3D0x5003006/lkp-csl-2ap4/debian-10.4-x86_64-2020060=
3.cgz/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372349e8f9d3aba6c392/0"
> scheduler_version: "/lkp/lkp/.src-20220114-102716"
> arch: x86_64
> max_uptime: 2100
> initrd: "/osimage/debian/debian-10.4-x86_64-20200603.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - RESULT_ROOT=3D/result/fsmark/performance-1SSD-8K-btrfs-8-16d-256fpd-4-f=
syncBeforeClose-24G-ucode=3D0x5003006/lkp-csl-2ap4/debian-10.4-x86_64-20200=
603.cgz/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372349e8f9d3aba6c392/0
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d03453437234=
9e8f9d3aba6c392/vmlinuz-5.16.0-rc8-00117-g1a61b300c09b
> - branch=3Dlinux-devel/devel-hourly-20220110-012702
> - job=3D/lkp/jobs/scheduled/lkp-csl-2ap4/fsmark-performance-1SSD-8K-btrfs=
-8-16d-256fpd-4-fsyncBeforeClose-24G-ucode=3D0x5003006-debian-10.4-x86_64-2=
0200603.cgz-1a61b300c09-20220114-23323-bwklhd-2.yaml
> - user=3Dlkp
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel-8.3
> - commit=3D1a61b300c09b1d034534372349e8f9d3aba6c392
> - acpi_rsdp=3D0x67f44014
> - max_uptime=3D2100
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
> modules_initrd: "/pkg/linux/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372=
349e8f9d3aba6c392/modules.cgz"
> bm_initrd: "/osimage/deps/debian-10.4-x86_64-20200603.cgz/run-ipconfig_20=
200608.cgz,/osimage/deps/debian-10.4-x86_64-20200603.cgz/lkp_20220105.cgz,/=
osimage/deps/debian-10.4-x86_64-20200603.cgz/rsync-rootfs_20200608.cgz,/osi=
mage/deps/debian-10.4-x86_64-20200603.cgz/fs_20210917.cgz,/osimage/pkg/debi=
an-10.4-x86_64-20200603.cgz/fsmark-x86_64-698ee57-1_20220112.cgz,/osimage/d=
eps/debian-10.4-x86_64-20200603.cgz/mpstat_20200714.cgz,/osimage/deps/debia=
n-10.4-x86_64-20200603.cgz/turbostat_20200721.cgz,/osimage/pkg/debian-10.4-=
x86_64-20200603.cgz/turbostat-x86_64-3.7-4_20200721.cgz,/osimage/deps/debia=
n-10.4-x86_64-20200603.cgz/perf_20220101.cgz,/osimage/pkg/debian-10.4-x86_6=
4-20200603.cgz/perf-x86_64-362f533a2a10-1_20220113.cgz,/osimage/pkg/debian-=
10.4-x86_64-20200603.cgz/sar-x86_64-34c92ae-1_20200702.cgz,/osimage/deps/de=
bian-10.4-x86_64-20200603.cgz/hw_20200715.cgz"
> ucode_initrd: "/osimage/ucode/intel-ucode-20210222.cgz"
> lkp_initrd: "/osimage/user/lkp/lkp-x86_64.cgz"
> site: inn
> :#! /cephfs/db/releases/20220110210807/lkp-src/include/site/inn:
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> oom-killer:
> watchdog:
> :#! runtime status:
> last_kernel: 5.16.0-wt-ath-08762-g8113de0a1f5c
> repeat_to: 3
> schedule_notify_address:
> :#! user overrides:
> kernel: "/pkg/linux/x86_64-rhel-8.3/gcc-9/1a61b300c09b1d034534372349e8f9d=
3aba6c392/vmlinuz-5.16.0-rc8-00117-g1a61b300c09b"
> dequeue_time: 2022-01-14 15:49:26.429322873 +08:00
> :#! /cephfs/db/releases/20220114102343/lkp-src/include/site/inn:
> job_state: finished
> loadavg: 3.07 3.75 2.67 1/1365 39754
> start_time: '1642146658'
> end_time: '1642147619'
> version: "/lkp/lkp/.src-20220114-102801:cf13e694:4c8d5b395"

> dmsetup remove_all
> wipefs -a --force /dev/nvme1n1p1
> mkfs -t btrfs /dev/nvme1n1p1
> mkdir -p /fs/nvme1n1p1
> mount -t btrfs /dev/nvme1n1p1 /fs/nvme1n1p1
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

> fs_mark -d /fs/nvme1n1p1/1 -d /fs/nvme1n1p1/2 -d /fs/nvme1n1p1/3 -d /fs/n=
vme1n1p1/4 -D 16 -N 256 -n 98304 -L 8 -S 1 -s 8192

--===============5972076149530397708==--

