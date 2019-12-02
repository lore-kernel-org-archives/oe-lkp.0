Content-Type: multipart/mixed; boundary="===============2121479835343299410=="
MIME-Version: 1.0
From: Qu WenRuo <wqu@suse.com>
To: lkp@lists.01.org
Subject: Re: [btrfs] c6bbf24815: aim7.jobs-per-min -80.1% regression
Date: Mon, 02 Dec 2019 00:12:42 +0000
Message-ID: <6bc21514-52ac-f2fa-0d13-dd663d9ae889@suse.com>
In-Reply-To: <20191201152549.GM18573@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============2121479835343299410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 2019/12/1 =E4=B8=8B=E5=8D=8811:25, kernel test robot wrote:
> Greeting,
> =

> FYI, we noticed a -80.1% regression of aim7.jobs-per-min due to commit:
> =

> =

> commit: c6bbf24815f95a4928984ff16a9a01c9c3670eb1 ("[PATCH RFC] btrfs: spa=
ce-info: Make over-commit threshold to 87.5% of a new chunk")
> url: https://github.com/0day-ci/linux/commits/Qu-Wenruo/btrfs-space-info-=
Make-over-commit-threshold-to-87-5-of-a-new-chunk/20191125-200934

That patch will be discarded.

And just as I expected, that hugely reduced over-commit threshold will
dramastically reduce performance.

Thanks for the confirmation,
Qu

> =

> =

> in testcase: aim7
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
> =

> 	disk: 4BRD_12G
> 	md: RAID0
> 	fs: btrfs
> 	test: disk_wrt
> 	load: 1500
> 	cpufreq_governor: performance
> 	ucode: 0x500002c
> =

> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
-------------------+
> | testcase: change | fio-basic: fio.write_bw_MBps -79.2% regression      =
                   |
> | test machine     | 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GH=
z with 256G memory |
> | test parameters  | bs=3D4k                                             =
                     |
> |                  | cpufreq_governor=3Dperformance                      =
                     |
> |                  | disk=3D1SSD                                         =
                     |
> |                  | fs=3Dbtrfs                                          =
                     |
> |                  | ioengine=3Dsync                                     =
                     |
> |                  | nr_task=3D1                                         =
                     |
> |                  | runtime=3D300s                                      =
                     |
> |                  | rw=3Drandwrite                                      =
                     |
> |                  | test_size=3D128G                                    =
                     |
> |                  | ucode=3D0xb000038                                   =
                     |
> +------------------+-----------------------------------------------------=
-------------------+
> | testcase: change | blogbench: blogbench.write_score -19.9% regression  =
                   |
> | test machine     | 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz wit=
h 48G memory       |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                     |
> |                  | disk=3D1SSD                                         =
                     |
> |                  | fs=3Dbtrfs                                          =
                     |
> |                  | ucode=3D0x7000019                                   =
                     |
> +------------------+-----------------------------------------------------=
-------------------+
> | testcase: change | fio-basic: fio.write_bw_MBps -19.8% regression      =
                   |
> | test machine     | 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz =
with 192G memory   |
> | test parameters  | bs=3D4M                                             =
                     |
> |                  | cpufreq_governor=3Dperformance                      =
                     |
> |                  | disk=3D1HDD                                         =
                     |
> |                  | fs=3Dbtrfs                                          =
                     |
> |                  | ioengine=3Dsync                                     =
                     |
> |                  | nr_task=3D100%                                      =
                     |
> |                  | runtime=3D300s                                      =
                     |
> |                  | rw=3Drandwrite                                      =
                     |
> |                  | test_size=3D128G                                    =
                     |
> |                  | ucode=3D0x500002c                                   =
                     |
> +------------------+-----------------------------------------------------=
-------------------+
> | testcase: change | fio-basic: boot-time.boot 2.6% regression           =
                   |
> | test machine     | 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz =
with 192G memory   |
> | test parameters  | bs=3D4k                                             =
                     |
> |                  | cpufreq_governor=3Dperformance                      =
                     |
> |                  | direct=3Ddirect                                     =
                     |
> |                  | disk=3D1HDD                                         =
                     |
> |                  | fs=3Dbtrfs                                          =
                     |
> |                  | ioengine=3Dsync                                     =
                     |
> |                  | nr_task=3D1                                         =
                     |
> |                  | runtime=3D300s                                      =
                     |
> |                  | rw=3Dwrite                                          =
                     |
> |                  | test_size=3D128G                                    =
                     |
> |                  | ucode=3D0x500002c                                   =
                     |
> +------------------+-----------------------------------------------------=
-------------------+
> =

> =

> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <rong.a.chen@intel.com>
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
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
testcase/ucode:
>   gcc-7/performance/4BRD_12G/btrfs/x86_64-rhel-7.6/1500/RAID0/debian-x86_=
64-2019-11-14.cgz/lkp-csl-2ap2/disk_wrt/aim7/0x500002c
> =

> commit: =

>   v5.4
>   c6bbf24815 ("btrfs: space-info: Make over-commit threshold to 87.5% of =
a new chunk")
> =

>             v5.4 c6bbf24815f95a4928984ff16a9 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           2:5          -40%            :4     stderr.libkmod:ERROR../libk=
mod/libkmod-module.c:#kmod_module_get_holders:could_not_open'/sys/module/pc=
c_cpufreq/holders':No_such_file_or_directory
>          %stddev     %change         %stddev
>              \          |                \  =

>      32070           -80.1%       6372        aim7.jobs-per-min
>     280.80          +403.0%       1412        aim7.time.elapsed_time
>     280.80          +403.0%       1412        aim7.time.elapsed_time.max
>  3.097e+08            +6.6%  3.301e+08        aim7.time.file_system_outpu=
ts
>    3945212 =C2=B1  4%     -50.7%    1943551        aim7.time.involuntary_=
context_switches
>     278698 =C2=B1  3%    +301.7%    1119432 =C2=B1  4%  aim7.time.minor_p=
age_faults
>      51621          +279.0%     195633        aim7.time.system_time
>      13.15 =C2=B1 10%    +409.2%      66.95        aim7.time.user_time
>    2515400         +6218.6%  1.589e+08        aim7.time.voluntary_context=
_switches
>       5.07 =C2=B1  3%    +425.6%      26.63 =C2=B1  2%  iostat.cpu.idle
>      94.88           -23.2%      72.88        iostat.cpu.system
>      28.12 =C2=B1  9%   +8105.6%       2307 =C2=B1  6%  iostat.md0.w/s
>       4733 =C2=B1  9%    +714.4%      38551        iostat.md0.wkB/s
>       4.42 =C2=B1  3%     +22.1       26.55 =C2=B1  2%  mpstat.cpu.all.id=
le%
>       0.00 =C2=B1126%      +0.5        0.45 =C2=B1  2%  mpstat.cpu.all.io=
wait%
>       0.00 =C2=B1 83%      -0.0        0.00 =C2=B1 54%  mpstat.cpu.all.so=
ft%
>      95.53           -22.6       72.97        mpstat.cpu.all.sys%
>       0.05 =C2=B1  5%      -0.0        0.03        mpstat.cpu.all.usr%
>   10317394 =C2=B1 41%   +8698.3%  9.078e+08 =C2=B1 11%  cpuidle.C1.time
>     171768 =C2=B1 89%  +15857.4%   27409795 =C2=B1  7%  cpuidle.C1.usage
>  7.734e+08 =C2=B1 85%   +6332.0%  4.974e+10 =C2=B1 31%  cpuidle.C1E.time
>    2516186 =C2=B1 44%   +8114.6%  2.067e+08 =C2=B1 12%  cpuidle.C1E.usage
>    4435070 =C2=B1141%   +4626.3%  2.096e+08 =C2=B1  4%  cpuidle.POLL.time
>      17288 =C2=B1 58%  +11772.9%    2052654 =C2=B1  4%  cpuidle.POLL.usage
>    9930111           +10.6%   10979883        numa-numastat.node0.local_n=
ode
>    9955641           +10.5%   11004822        numa-numastat.node0.numa_hit
>    9870230           +11.2%   10977774        numa-numastat.node1.local_n=
ode
>    9895773           +11.3%   11014041        numa-numastat.node1.numa_hit
>      25544 =C2=B1 49%     +42.0%      36266        numa-numastat.node1.ot=
her_node
>    9872061           +13.4%   11199076        numa-numastat.node2.local_n=
ode
>    9898892           +13.4%   11224375        numa-numastat.node2.numa_hit
>       4.20 =C2=B1  9%    +519.0%      26.00 =C2=B1  3%  vmstat.cpu.id
>      94.80           -23.7%      72.33        vmstat.cpu.sy
>       3252 =C2=B1  9%    +825.9%      30110 =C2=B1  2%  vmstat.io.bo
>       0.00         +1e+102%       1.00        vmstat.procs.b
>     388.60 =C2=B1  2%     -56.9%     167.67        vmstat.procs.r
>      26478          +716.5%     216191        vmstat.system.cs
>     395377            +3.9%     410772        vmstat.system.in
>       1508           -23.1%       1161        turbostat.Avg_MHz
>      95.67           -22.0       73.64        turbostat.Busy%
>      84956 =C2=B1 84%  +16529.8%   14128081 =C2=B1  9%  turbostat.C1
>       0.01 =C2=B1 33%      +0.2        0.17 =C2=B1 12%  turbostat.C1%
>    1278885 =C2=B1 44%   +8136.5%  1.053e+08 =C2=B1 12%  turbostat.C1E
>       0.72 =C2=B1 85%      +8.6        9.35 =C2=B1 32%  turbostat.C1E%
>       2.71 =C2=B1 15%    +855.5%      25.89 =C2=B1  3%  turbostat.CPU%c1
>       1.62 =C2=B1 24%     -71.3%       0.47 =C2=B1 37%  turbostat.CPU%c6
>   57158740          +418.8%  2.965e+08        turbostat.IRQ
>       1.52 =C2=B1 37%     -68.4%       0.48 =C2=B1 45%  turbostat.Pkg%pc2
>     267.13            -7.9%     246.13        turbostat.PkgWatt
>     548937 =C2=B1  2%     -37.4%     343830        meminfo.Active(anon)
>     197374 =C2=B1  2%    +132.2%     458217        meminfo.Active(file)
>     170663 =C2=B1  4%     +17.8%     201089        meminfo.AnonHugePages
>    1849215           -12.6%    1615467        meminfo.Committed_AS
>     193809 =C2=B1  2%     +16.1%     224969        meminfo.Dirty
>      37725 =C2=B1  5%    +209.4%     116738        meminfo.Inactive
>      33862 =C2=B1  5%     -19.9%      27131        meminfo.Inactive(anon)
>       3861 =C2=B1 13%   +2220.5%      89606 =C2=B1  2%  meminfo.Inactive(=
file)
>     117664           +11.2%     130830        meminfo.KReclaimable
>      37784 =C2=B1  5%     -36.2%      24094        meminfo.Mapped
>    3838612          +111.6%    8121943 =C2=B1  2%  meminfo.Memused
>     117664           +11.2%     130830        meminfo.SReclaimable
>     347303           +32.3%     459515        meminfo.SUnreclaim
>     268188 =C2=B1  8%     -77.3%      60946 =C2=B1  5%  meminfo.Shmem
>     464967           +27.0%     590346        meminfo.Slab
>      40.20 =C2=B1 33%   +3686.9%       1522 =C2=B1 11%  meminfo.Writeback
>      15535           -57.4%       6611 =C2=B1  6%  meminfo.max_used_kB
>      49533 =C2=B1  2%    +160.0%     128787 =C2=B1 25%  numa-meminfo.node=
0.Active(file)
>      48479 =C2=B1  2%     +15.5%      55971        numa-meminfo.node0.Dir=
ty
>      22506 =C2=B1 20%     +87.7%      42247 =C2=B1  3%  numa-meminfo.node=
0.Inactive
>       1078 =C2=B1 34%   +1984.5%      22479 =C2=B1  4%  numa-meminfo.node=
0.Inactive(file)
>      13251 =C2=B1 14%     -23.2%      10176        numa-meminfo.node0.Map=
ped
>    1024479 =C2=B1 17%    +103.0%    2080012 =C2=B1 15%  numa-meminfo.node=
0.MemUsed
>      48815 =C2=B1  2%     +74.1%      84996 =C2=B1 29%  numa-meminfo.node=
1.Active(file)
>      48070 =C2=B1  2%     +17.1%      56311        numa-meminfo.node1.Dir=
ty
>     322514 =C2=B1  2%     +16.8%     376661 =C2=B1  6%  numa-meminfo.node=
1.FilePages
>       1965 =C2=B1  9%   +1196.8%      25492 =C2=B1  5%  numa-meminfo.node=
1.Inactive
>       1216 =C2=B1 26%    +151.5%       3059 =C2=B1 30%  numa-meminfo.node=
1.Inactive(anon)
>     748.80 =C2=B1 27%   +2895.9%      22433 =C2=B1  2%  numa-meminfo.node=
1.Inactive(file)
>       6837 =C2=B1  7%     -32.4%       4624        numa-meminfo.node1.Map=
ped
>     851838 =C2=B1 16%    +104.7%    1743858 =C2=B1 16%  numa-meminfo.node=
1.MemUsed
>      49048 =C2=B1  2%    +119.2%     107536 =C2=B1 13%  numa-meminfo.node=
2.Active(file)
>      48431 =C2=B1  2%     +16.4%      56384        numa-meminfo.node2.Dir=
ty
>       4706 =C2=B1108%    +418.7%      24416 =C2=B1  4%  numa-meminfo.node=
2.Inactive
>     836.20 =C2=B1 46%   +2567.8%      22308 =C2=B1  2%  numa-meminfo.node=
2.Inactive(file)
>       8072 =C2=B1 34%     -42.3%       4659        numa-meminfo.node2.Map=
ped
>     856364 =C2=B1 11%    +157.6%    2206418 =C2=B1  7%  numa-meminfo.node=
2.MemUsed
>     585.00 =C2=B1 71%   +3494.1%      21025 =C2=B1130%  numa-meminfo.node=
2.PageTables
>      60300 =C2=B1  4%     +48.7%      89636 =C2=B1 26%  numa-meminfo.node=
2.SUnreclaim
>      80131 =C2=B1  8%     +49.4%     119735 =C2=B1 30%  numa-meminfo.node=
2.Slab
>      49431 =C2=B1  3%    +176.8%     136812 =C2=B1  9%  numa-meminfo.node=
3.Active(file)
>      48121 =C2=B1  2%     +15.6%      55615        numa-meminfo.node3.Dir=
ty
>       8414 =C2=B1 53%    +192.2%      24588 =C2=B1  6%  numa-meminfo.node=
3.Inactive
>       1191 =C2=B1 24%   +1778.9%      22392 =C2=B1  3%  numa-meminfo.node=
3.Inactive(file)
>       9527 =C2=B1 24%     -51.3%       4636        numa-meminfo.node3.Map=
ped
>    1104787 =C2=B1 23%     +89.3%    2091596 =C2=B1 10%  numa-meminfo.node=
3.MemUsed
>     137251 =C2=B1  2%     -37.4%      85956        proc-vmstat.nr_active_=
anon
>      49361 =C2=B1  2%    +132.0%     114528        proc-vmstat.nr_active_=
file
>   38663432            +8.6%   41974260        proc-vmstat.nr_dirtied
>      48437 =C2=B1  3%     +15.8%      56105        proc-vmstat.nr_dirty
>    4826945            -2.0%    4728671        proc-vmstat.nr_dirty_backgr=
ound_threshold
>    9665693            -2.0%    9468904        proc-vmstat.nr_dirty_thresh=
old
>     390609            +8.7%     424645        proc-vmstat.nr_file_pages
>   48472732            -2.2%   47401946        proc-vmstat.nr_free_pages
>       8422 =C2=B1  4%     -19.5%       6782        proc-vmstat.nr_inactiv=
e_anon
>     965.40 =C2=B1 13%   +2220.4%      22401 =C2=B1  2%  proc-vmstat.nr_in=
active_file
>       9490 =C2=B1  4%     -35.2%       6147        proc-vmstat.nr_mapped
>     317.00 =C2=B1 50%     +43.7%     455.67 =C2=B1  9%  proc-vmstat.nr_ml=
ock
>      13426 =C2=B1  5%     +10.6%      14850 =C2=B1  4%  proc-vmstat.nr_pa=
ge_table_pages
>      67036 =C2=B1  8%     -77.3%      15236 =C2=B1  5%  proc-vmstat.nr_sh=
mem
>      29417           +11.2%      32707        proc-vmstat.nr_slab_reclaim=
able
>      86822           +32.3%     114877        proc-vmstat.nr_slab_unrecla=
imable
>      14.00 =C2=B1 46%   +2926.2%     423.67 =C2=B1 19%  proc-vmstat.nr_wr=
iteback
>     230567 =C2=B1  9%   +4520.5%   10653348 =C2=B1  2%  proc-vmstat.nr_wr=
itten
>     137251 =C2=B1  2%     -37.4%      85956        proc-vmstat.nr_zone_ac=
tive_anon
>      49361 =C2=B1  2%    +132.0%     114528        proc-vmstat.nr_zone_ac=
tive_file
>       8422 =C2=B1  4%     -19.5%       6782        proc-vmstat.nr_zone_in=
active_anon
>     965.40 =C2=B1 13%   +2220.4%      22401 =C2=B1  2%  proc-vmstat.nr_zo=
ne_inactive_file
>      48249 =C2=B1  3%     +17.7%      56801        proc-vmstat.nr_zone_wr=
ite_pending
>     204165 =C2=B1  5%    +411.7%    1044639 =C2=B1  5%  proc-vmstat.numa_=
hint_faults
>     153009 =C2=B1  6%    +350.7%     689603 =C2=B1  7%  proc-vmstat.numa_=
hint_faults_local
>   39680217           +11.1%   44072979        proc-vmstat.numa_hit
>   39584298           +11.1%   43962666        proc-vmstat.numa_local
>      95918           +15.0%     110313        proc-vmstat.numa_other
>      27527 =C2=B1  5%    +233.4%      91773 =C2=B1  2%  proc-vmstat.numa_=
pages_migrated
>     217049 =C2=B1  7%    +390.0%    1063518 =C2=B1  4%  proc-vmstat.numa_=
pte_updates
>    3033120           +85.1%    5615220        proc-vmstat.pgactivate
>   39865153           +11.8%   44556621        proc-vmstat.pgalloc_normal
>    1238327          +367.5%    5789500        proc-vmstat.pgfault
>   39734124            +8.6%   43135750        proc-vmstat.pgfree
>      27527 =C2=B1  5%    +233.4%      91773 =C2=B1  2%  proc-vmstat.pgmig=
rate_success
>     922053 =C2=B1  9%   +4520.0%   42598858 =C2=B1  2%  proc-vmstat.pgpgo=
ut
>       1007 =C2=B1  3%      +9.6%       1104        proc-vmstat.unevictabl=
e_pgs_culled
>      12395 =C2=B1  2%    +159.7%      32191 =C2=B1 25%  numa-vmstat.node0=
.nr_active_file
>    4643034           +14.2%    5301322        numa-vmstat.node0.nr_dirtied
>      12155 =C2=B1  3%     +15.3%      14015        numa-vmstat.node0.nr_d=
irty
>     269.20 =C2=B1 34%   +1985.1%       5613 =C2=B1  4%  numa-vmstat.node0=
.nr_inactive_file
>       3354 =C2=B1 17%     -24.2%       2544        numa-vmstat.node0.nr_m=
apped
>      91.40 =C2=B1 58%     +52.4%     139.33 =C2=B1 15%  numa-vmstat.node0=
.nr_mlock
>       2.00 =C2=B1 44%   +4983.3%     101.67 =C2=B1 13%  numa-vmstat.node0=
.nr_writeback
>      25980 =C2=B1 16%   +5855.2%    1547176 =C2=B1  6%  numa-vmstat.node0=
.nr_written
>      12394 =C2=B1  2%    +159.7%      32191 =C2=B1 25%  numa-vmstat.node0=
.nr_zone_active_file
>     269.20 =C2=B1 34%   +1985.1%       5613 =C2=B1  4%  numa-vmstat.node0=
.nr_zone_inactive_file
>      12100 =C2=B1  2%     +17.3%      14193        numa-vmstat.node0.nr_z=
one_write_pending
>    5342759           +12.8%    6027732        numa-vmstat.node0.numa_hit
>    5317823 =C2=B1  2%     +12.9%    6004957        numa-vmstat.node0.numa=
_local
>      12225 =C2=B1  2%     +73.9%      21265 =C2=B1 29%  numa-vmstat.node1=
.nr_active_file
>    4633020           +12.2%    5197958        numa-vmstat.node1.nr_dirtied
>      12036 =C2=B1  2%     +17.2%      14111        numa-vmstat.node1.nr_d=
irty
>      80639 =C2=B1  2%     +16.8%      94187 =C2=B1  6%  numa-vmstat.node1=
.nr_file_pages
>     302.40 =C2=B1 27%    +152.8%     764.33 =C2=B1 30%  numa-vmstat.node1=
.nr_inactive_anon
>     186.60 =C2=B1 27%   +2904.1%       5605 =C2=B1  2%  numa-vmstat.node1=
.nr_inactive_file
>       1736 =C2=B1  3%     -33.4%       1155        numa-vmstat.node1.nr_m=
apped
>       2.20 =C2=B1 66%   +4597.0%     103.33 =C2=B1 14%  numa-vmstat.node1=
.nr_writeback
>      25133 =C2=B1 15%   +5577.3%    1426891 =C2=B1  3%  numa-vmstat.node1=
.nr_written
>      12225 =C2=B1  2%     +73.9%      21265 =C2=B1 29%  numa-vmstat.node1=
.nr_zone_active_file
>     302.40 =C2=B1 27%    +152.8%     764.33 =C2=B1 30%  numa-vmstat.node1=
.nr_zone_inactive_anon
>     186.60 =C2=B1 27%   +2904.1%       5605 =C2=B1  2%  numa-vmstat.node1=
.nr_zone_inactive_file
>      12000 =C2=B1  2%     +19.0%      14282        numa-vmstat.node1.nr_z=
one_write_pending
>    5065734           +13.9%    5772157        numa-vmstat.node1.numa_hit
>    4952944           +14.1%    5650441        numa-vmstat.node1.numa_local
>      12186 =C2=B1  2%    +120.6%      26888 =C2=B1 13%  numa-vmstat.node2=
.nr_active_file
>    4634627           +14.5%    5308170        numa-vmstat.node2.nr_dirtied
>      12051 =C2=B1  2%     +17.0%      14099        numa-vmstat.node2.nr_d=
irty
>     209.00 =C2=B1 46%   +2569.1%       5578 =C2=B1  2%  numa-vmstat.node2=
.nr_inactive_file
>       1973 =C2=B1 29%     -38.9%       1206 =C2=B1  5%  numa-vmstat.node2=
.nr_mapped
>     146.20 =C2=B1 71%   +3497.1%       5259 =C2=B1130%  numa-vmstat.node2=
.nr_page_table_pages
>      15073 =C2=B1  4%     +48.7%      22410 =C2=B1 26%  numa-vmstat.node2=
.nr_slab_unreclaimable
>       2.60 =C2=B1 52%   +3784.6%     101.00 =C2=B1 16%  numa-vmstat.node2=
.nr_writeback
>      25376 =C2=B1  9%   +5885.4%    1518868 =C2=B1  3%  numa-vmstat.node2=
.nr_written
>      12185 =C2=B1  2%    +120.7%      26889 =C2=B1 13%  numa-vmstat.node2=
.nr_zone_active_file
>     209.00 =C2=B1 46%   +2569.1%       5578 =C2=B1  2%  numa-vmstat.node2=
.nr_zone_inactive_file
>      12035 =C2=B1  2%     +18.6%      14271        numa-vmstat.node2.nr_z=
one_write_pending
>    5055872           +16.1%    5871437 =C2=B1  2%  numa-vmstat.node2.numa=
_hit
>    4941737           +16.6%    5760556 =C2=B1  2%  numa-vmstat.node2.numa=
_local
>      12375 =C2=B1  3%    +176.3%      34199 =C2=B1  9%  numa-vmstat.node3=
.nr_active_file
>    4641415           +15.1%    5343310        numa-vmstat.node3.nr_dirtied
>      12067 =C2=B1  3%     +15.1%      13889        numa-vmstat.node3.nr_d=
irty
>     297.60 =C2=B1 24%   +1781.9%       5600 =C2=B1  3%  numa-vmstat.node3=
.nr_inactive_file
>       2487 =C2=B1 25%     -50.1%       1242 =C2=B1  5%  numa-vmstat.node3=
.nr_mapped
>       2.40 =C2=B1 77%   +4066.7%     100.00 =C2=B1 15%  numa-vmstat.node3=
.nr_writeback
>      27048 =C2=B1  8%   +5825.6%    1602749        numa-vmstat.node3.nr_w=
ritten
>      12375 =C2=B1  3%    +176.4%      34199 =C2=B1  9%  numa-vmstat.node3=
.nr_zone_active_file
>     297.60 =C2=B1 24%   +1781.9%       5600 =C2=B1  3%  numa-vmstat.node3=
.nr_zone_inactive_file
>      11989 =C2=B1  3%     +17.3%      14063        numa-vmstat.node3.nr_z=
one_write_pending
>    5173752           +11.3%    5760155 =C2=B1  3%  numa-vmstat.node3.numa=
_hit
>    5068067 =C2=B1  2%     +11.5%    5649478 =C2=B1  3%  numa-vmstat.node3=
.numa_local
>  1.239e+10           -24.8%   9.32e+09        perf-stat.i.branch-instruct=
ions
>   22081791 =C2=B1  2%     -13.8%   19033846        perf-stat.i.branch-mis=
ses
>      53.35 =C2=B1  4%     -18.8       34.55        perf-stat.i.cache-miss=
-rate%
>   46191736 =C2=B1 11%     -43.6%   26052198 =C2=B1  2%  perf-stat.i.cache=
-misses
>      26966          +704.7%     216993        perf-stat.i.context-switches
>      11.05            -1.8%      10.85        perf-stat.i.cpi
>  5.732e+11           -24.1%  4.353e+11        perf-stat.i.cpu-cycles
>       4345          +907.9%      43795        perf-stat.i.cpu-migrations
>      12405 =C2=B1 13%     +43.0%      17742 =C2=B1  3%  perf-stat.i.cycle=
s-between-cache-misses
>     802971 =C2=B1 19%    +146.9%    1982139 =C2=B1 13%  perf-stat.i.dTLB-=
load-misses
>  1.308e+10           -26.4%  9.625e+09        perf-stat.i.dTLB-loads
>       0.01 =C2=B1 35%      +0.0        0.02 =C2=B1  5%  perf-stat.i.dTLB-=
store-miss-rate%
>      55413 =C2=B1 12%    +122.0%     123010 =C2=B1  6%  perf-stat.i.dTLB-=
store-misses
>  1.189e+09           -39.5%   7.19e+08        perf-stat.i.dTLB-stores
>      75.66           -36.9       38.79 =C2=B1  2%  perf-stat.i.iTLB-load-=
miss-rate%
>    5545889 =C2=B1  7%     -16.7%    4618937 =C2=B1  4%  perf-stat.i.iTLB-=
load-misses
>    1776875          +321.9%    7497189        perf-stat.i.iTLB-loads
>  5.118e+10           -25.4%  3.817e+10        perf-stat.i.instructions
>       0.09 =C2=B1  2%      +6.6%       0.10        perf-stat.i.ipc
>       4188            -4.4%       4002        perf-stat.i.minor-faults
>   11607086 =C2=B1  4%      +3.9%   12063996        perf-stat.i.node-load-=
misses
>      93.93            +3.1       97.07        perf-stat.i.node-store-miss=
-rate%
>    6497150           -31.8%    4428602        perf-stat.i.node-store-miss=
es
>     393359           -65.1%     137163 =C2=B1  2%  perf-stat.i.node-stores
>       4188            -4.4%       4002        perf-stat.i.page-faults
>       1.70 =C2=B1  7%     +18.0%       2.00 =C2=B1  2%  perf-stat.overall=
.MPKI
>       0.18 =C2=B1  2%      +0.0        0.20        perf-stat.overall.bran=
ch-miss-rate%
>      53.03 =C2=B1  5%     -18.9       34.11 =C2=B1  2%  perf-stat.overall=
.cache-miss-rate%
>      11.20            +1.8%      11.40        perf-stat.overall.cpi
>      12606 =C2=B1 13%     +32.6%      16719 =C2=B1  3%  perf-stat.overall=
.cycles-between-cache-misses
>       0.01 =C2=B1 19%      +0.0        0.02 =C2=B1 12%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.00 =C2=B1 12%      +0.0        0.02 =C2=B1  5%  perf-stat.overall=
.dTLB-store-miss-rate%
>      75.68           -37.6       38.11 =C2=B1  2%  perf-stat.overall.iTLB=
-load-miss-rate%
>       0.09            -1.8%       0.09        perf-stat.overall.ipc
>      94.29            +2.7       97.00        perf-stat.overall.node-stor=
e-miss-rate%
>  1.234e+10           -24.5%  9.312e+09        perf-stat.ps.branch-instruc=
tions
>   22002244 =C2=B1  2%     -13.5%   19021265        perf-stat.ps.branch-mi=
sses
>   46012188 =C2=B1 11%     -43.4%   26033755 =C2=B1  2%  perf-stat.ps.cach=
e-misses
>      26860          +707.3%     216847        perf-stat.ps.context-switch=
es
>   5.71e+11           -23.8%  4.349e+11        perf-stat.ps.cpu-cycles
>       4327          +911.0%      43756        perf-stat.ps.cpu-migrations
>     800662 =C2=B1 19%    +147.4%    1980780 =C2=B1 13%  perf-stat.ps.dTLB=
-load-misses
>  1.303e+10           -26.2%  9.617e+09        perf-stat.ps.dTLB-loads
>      55333 =C2=B1 12%    +122.2%     122941 =C2=B1  6%  perf-stat.ps.dTLB=
-store-misses
>  1.184e+09           -39.3%  7.186e+08        perf-stat.ps.dTLB-stores
>    5524896 =C2=B1  7%     -16.5%    4615635 =C2=B1  4%  perf-stat.ps.iTLB=
-load-misses
>    1770181          +323.2%    7491635        perf-stat.ps.iTLB-loads
>  5.098e+10           -25.2%  3.814e+10        perf-stat.ps.instructions
>       4173            -4.1%       4000        perf-stat.ps.minor-faults
>   11561545 =C2=B1  4%      +4.3%   12054966        perf-stat.ps.node-load=
-misses
>    6471592           -31.6%    4425307        perf-stat.ps.node-store-mis=
ses
>     391827           -65.0%     137085 =C2=B1  2%  perf-stat.ps.node-stor=
es
>       4173            -4.1%       4000        perf-stat.ps.page-faults
>  1.419e+13          +279.1%  5.377e+13        perf-stat.total.instructions
>      11252         +1012.1%     125128        slabinfo.Acpi-State.active_=
objs
>     220.20         +1018.2%       2462        slabinfo.Acpi-State.active_=
slabs
>      11252         +1016.2%     125596        slabinfo.Acpi-State.num_objs
>     220.20         +1018.2%       2462        slabinfo.Acpi-State.num_sla=
bs
>      21789           +19.9%      26130        slabinfo.avc_xperms_data.ac=
tive_objs
>      21789           +19.9%      26130        slabinfo.avc_xperms_data.nu=
m_objs
>     197.40 =C2=B1 14%    +178.8%     550.33 =C2=B1  2%  slabinfo.biovec-1=
28.active_objs
>     197.40 =C2=B1 14%    +178.8%     550.33 =C2=B1  2%  slabinfo.biovec-1=
28.num_objs
>     328.80 =C2=B1 13%    +957.0%       3475        slabinfo.biovec-max.ac=
tive_objs
>      41.60 =C2=B1 14%    +990.5%     453.67        slabinfo.biovec-max.ac=
tive_slabs
>     334.60 =C2=B1 13%    +986.6%       3635        slabinfo.biovec-max.nu=
m_objs
>      41.60 =C2=B1 14%    +990.5%     453.67        slabinfo.biovec-max.nu=
m_slabs
>       6898          +656.0%      52147 =C2=B1  2%  slabinfo.blkdev_ioc.ac=
tive_objs
>     176.40          +662.3%       1344 =C2=B1  2%  slabinfo.blkdev_ioc.ac=
tive_slabs
>       6898          +660.4%      52455 =C2=B1  2%  slabinfo.blkdev_ioc.nu=
m_objs
>     176.40          +662.3%       1344 =C2=B1  2%  slabinfo.blkdev_ioc.nu=
m_slabs
>      10568          +949.1%     110872        slabinfo.btrfs_extent_map.a=
ctive_objs
>     188.20          +960.2%       1995        slabinfo.btrfs_extent_map.a=
ctive_slabs
>      10568          +957.6%     111774        slabinfo.btrfs_extent_map.n=
um_objs
>     188.20          +960.2%       1995        slabinfo.btrfs_extent_map.n=
um_slabs
>     564.00 =C2=B1 30%   +8876.4%      50627        slabinfo.btrfs_ordered=
_extent.active_objs
>      14.00 =C2=B1 30%   +9273.8%       1312        slabinfo.btrfs_ordered=
_extent.active_slabs
>     564.00 =C2=B1 30%   +8977.5%      51197        slabinfo.btrfs_ordered=
_extent.num_objs
>      14.00 =C2=B1 30%   +9273.8%       1312        slabinfo.btrfs_ordered=
_extent.num_slabs
>       2199 =C2=B1  9%    +268.2%       8099        slabinfo.dmaengine-unm=
ap-16.active_objs
>      52.00 =C2=B1 10%    +269.2%     192.00        slabinfo.dmaengine-unm=
ap-16.active_slabs
>       2199 =C2=B1  9%    +268.2%       8099        slabinfo.dmaengine-unm=
ap-16.num_objs
>      52.00 =C2=B1 10%    +269.2%     192.00        slabinfo.dmaengine-unm=
ap-16.num_slabs
>       3790 =C2=B1  7%     +27.0%       4815 =C2=B1 11%  slabinfo.eventpol=
l_pwq.active_objs
>       3790 =C2=B1  7%     +27.0%       4815 =C2=B1 11%  slabinfo.eventpol=
l_pwq.num_objs
>     930.40 =C2=B1  8%     -14.4%     796.00 =C2=B1  4%  slabinfo.file_loc=
k_cache.active_objs
>     930.40 =C2=B1  8%     -14.4%     796.00 =C2=B1  4%  slabinfo.file_loc=
k_cache.num_objs
>       6674          +754.3%      57022 =C2=B1  2%  slabinfo.khugepaged_mm=
_slot.active_objs
>     184.80          +762.9%       1594 =C2=B1  2%  slabinfo.khugepaged_mm=
_slot.active_slabs
>       6674          +760.3%      57420 =C2=B1  2%  slabinfo.khugepaged_mm=
_slot.num_objs
>     184.80          +762.9%       1594 =C2=B1  2%  slabinfo.khugepaged_mm=
_slot.num_slabs
>      14047          +220.9%      45078 =C2=B1  2%  slabinfo.kmalloc-128.a=
ctive_objs
>     219.20          +221.2%     704.00 =C2=B1  2%  slabinfo.kmalloc-128.a=
ctive_slabs
>      14047          +221.0%      45096 =C2=B1  2%  slabinfo.kmalloc-128.n=
um_objs
>     219.20          +221.2%     704.00 =C2=B1  2%  slabinfo.kmalloc-128.n=
um_slabs
>      10835           +35.7%      14701 =C2=B1  2%  slabinfo.kmalloc-192.a=
ctive_objs
>      10892           +35.0%      14704 =C2=B1  2%  slabinfo.kmalloc-192.n=
um_objs
>       9063           +51.8%      13762 =C2=B1  2%  slabinfo.kmalloc-1k.ac=
tive_objs
>     285.40           +51.2%     431.67 =C2=B1  2%  slabinfo.kmalloc-1k.ac=
tive_slabs
>       9148           +51.2%      13832 =C2=B1  2%  slabinfo.kmalloc-1k.nu=
m_objs
>     285.40           +51.2%     431.67 =C2=B1  2%  slabinfo.kmalloc-1k.nu=
m_slabs
>      24649 =C2=B1  2%     +13.8%      28057 =C2=B1  2%  slabinfo.kmalloc-=
512.active_objs
>      24864 =C2=B1  2%     +13.7%      28275 =C2=B1  2%  slabinfo.kmalloc-=
512.num_objs
>      89133          +153.3%     225734        slabinfo.kmalloc-64.active_=
objs
>       1395          +153.6%       3537        slabinfo.kmalloc-64.active_=
slabs
>      89341          +153.5%     226461        slabinfo.kmalloc-64.num_objs
>       1395          +153.6%       3537        slabinfo.kmalloc-64.num_sla=
bs
>     768.00 =C2=B1  9%     -30.6%     533.33 =C2=B1 14%  slabinfo.kmalloc-=
rcl-128.active_objs
>     768.00 =C2=B1  9%     -30.6%     533.33 =C2=B1 14%  slabinfo.kmalloc-=
rcl-128.num_objs
>       5492 =C2=B1 12%     -15.1%       4665 =C2=B1  3%  slabinfo.kmalloc-=
rcl-64.active_objs
>       5492 =C2=B1 12%     -15.1%       4665 =C2=B1  3%  slabinfo.kmalloc-=
rcl-64.num_objs
>       1741 =C2=B1  9%   +1508.7%      28013 =C2=B1  3%  slabinfo.mnt_cach=
e.active_objs
>      33.60 =C2=B1  9%   +1554.8%     556.00 =C2=B1  3%  slabinfo.mnt_cach=
e.active_slabs
>       1741 =C2=B1  9%   +1530.2%      28387 =C2=B1  3%  slabinfo.mnt_cach=
e.num_objs
>      33.60 =C2=B1  9%   +1554.8%     556.00 =C2=B1  3%  slabinfo.mnt_cach=
e.num_slabs
>     203.60 =C2=B1  6%    +234.3%     680.67 =C2=B1  9%  slabinfo.nfs_read=
_data.active_objs
>     203.60 =C2=B1  6%    +234.3%     680.67 =C2=B1  9%  slabinfo.nfs_read=
_data.num_objs
>      10668          +323.9%      45227 =C2=B1  3%  slabinfo.numa_policy.a=
ctive_objs
>     171.40          +325.5%     729.33 =C2=B1  3%  slabinfo.numa_policy.a=
ctive_slabs
>      10668          +323.9%      45227 =C2=B1  3%  slabinfo.numa_policy.n=
um_objs
>     171.40          +325.5%     729.33 =C2=B1  3%  slabinfo.numa_policy.n=
um_slabs
>       1879 =C2=B1  5%     +13.8%       2137 =C2=B1  2%  slabinfo.pool_wor=
kqueue.active_objs
>       1981 =C2=B1  6%     +11.9%       2217        slabinfo.pool_workqueu=
e.num_objs
>      25512 =C2=B1  2%     +82.4%      46538        slabinfo.radix_tree_no=
de.active_objs
>     455.40           +82.4%     830.67        slabinfo.radix_tree_node.ac=
tive_slabs
>      25531 =C2=B1  2%     +82.3%      46539        slabinfo.radix_tree_no=
de.num_objs
>     455.40           +82.4%     830.67        slabinfo.radix_tree_node.nu=
m_slabs
>     946.40 =C2=B1  9%    +139.2%       2263 =C2=B1  5%  slabinfo.skbuff_f=
clone_cache.active_objs
>     946.40 =C2=B1  9%    +139.2%       2263 =C2=B1  5%  slabinfo.skbuff_f=
clone_cache.num_objs
>       1412 =C2=B1  3%      +8.2%       1528 =C2=B1  3%  slabinfo.task_gro=
up.active_objs
>       1412 =C2=B1  3%      +8.2%       1528 =C2=B1  3%  slabinfo.task_gro=
up.num_objs
>     221.20 =C2=B1 26%    +276.0%     831.67 =C2=B1 10%  slabinfo.xfrm_sta=
te.active_objs
>     221.20 =C2=B1 26%    +276.0%     831.67 =C2=B1 10%  slabinfo.xfrm_sta=
te.num_objs
>      21437 =C2=B1169%    +429.1%     113415 =C2=B1 34%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>     111337          +336.0%     485426        sched_debug.cfs_rq:/.exec_c=
lock.avg
>     114024          +335.9%     496989        sched_debug.cfs_rq:/.exec_c=
lock.max
>     106338          +353.6%     482362        sched_debug.cfs_rq:/.exec_c=
lock.min
>     485.08 =C2=B1 13%    +295.1%       1916 =C2=B1 12%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>       5442 =C2=B1 14%    +136.4%      12863 =C2=B1 10%  sched_debug.cfs_r=
q:/.load.avg
>     145420 =C2=B1113%    +591.9%    1006104        sched_debug.cfs_rq:/.l=
oad.max
>      11936 =C2=B1 96%    +577.6%      80877 =C2=B1  5%  sched_debug.cfs_r=
q:/.load.stddev
>       0.56 =C2=B1 26%     +58.7%       0.89 =C2=B1  9%  sched_debug.cfs_r=
q:/.load_avg.min
>      21437 =C2=B1169%    +429.1%     113415 =C2=B1 34%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>   29440037          +193.4%   86379771        sched_debug.cfs_rq:/.min_vr=
untime.avg
>   30948401          +181.7%   87183621        sched_debug.cfs_rq:/.min_vr=
untime.max
>   27332485          +194.9%   80601349        sched_debug.cfs_rq:/.min_vr=
untime.min
>     557893 =C2=B1  4%     +99.1%    1110644        sched_debug.cfs_rq:/.m=
in_vruntime.stddev
>       0.81            -9.0%       0.73        sched_debug.cfs_rq:/.nr_run=
ning.avg
>       0.10 =C2=B1 14%    +151.1%       0.26 =C2=B1 11%  sched_debug.cfs_r=
q:/.nr_running.stddev
>       0.72 =C2=B1 18%   +3052.8%      22.73 =C2=B1  5%  sched_debug.cfs_r=
q:/.nr_spread_over.avg
>      18.88 =C2=B1 10%    +825.7%     174.78 =C2=B1 15%  sched_debug.cfs_r=
q:/.nr_spread_over.max
>       1.76 =C2=B1  3%    +655.1%      13.26 =C2=B1 13%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>       4.39 =C2=B1  6%    +104.6%       8.97        sched_debug.cfs_rq:/.r=
unnable_load_avg.avg
>      37.56 =C2=B1 30%   +2401.4%     939.53 =C2=B1  3%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>       4.87 =C2=B1 21%   +1314.7%      68.92 =C2=B1  3%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>       5215 =C2=B1 16%    +138.9%      12459 =C2=B1 11%  sched_debug.cfs_r=
q:/.runnable_weight.avg
>     143546 =C2=B1115%    +600.7%    1005842        sched_debug.cfs_rq:/.r=
unnable_weight.max
>      11850 =C2=B1 97%    +584.7%      81141 =C2=B1  5%  sched_debug.cfs_r=
q:/.runnable_weight.stddev
>   -1016222          +405.3%   -5135327        sched_debug.cfs_rq:/.spread=
0.min
>     556298 =C2=B1  4%     +99.8%    1111257        sched_debug.cfs_rq:/.s=
pread0.stddev
>       2228 =C2=B1 13%     -39.0%       1359        sched_debug.cfs_rq:/.u=
til_avg.max
>     253.40 =C2=B1  7%     +48.7%     376.92 =C2=B1  6%  sched_debug.cfs_r=
q:/.util_avg.min
>     302.60 =C2=B1 11%     -49.6%     152.59 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_avg.stddev
>     861.58 =C2=B1  5%     -64.8%     303.44 =C2=B1  4%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>       2815 =C2=B1 14%     -64.9%     987.92        sched_debug.cfs_rq:/.u=
til_est_enqueued.max
>     458.44 =C2=B1  7%     -66.9%     151.93 =C2=B1  4%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>     501454 =C2=B1  2%     -18.0%     411239        sched_debug.cpu.avg_id=
le.avg
>    1149976 =C2=B1 13%     -25.9%     852675 =C2=B1  3%  sched_debug.cpu.a=
vg_idle.max
>      88583 =C2=B1 10%     -24.3%      67045 =C2=B1  2%  sched_debug.cpu.a=
vg_idle.min
>     238306 =C2=B1  2%     -33.3%     158953 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.stddev
>     164543          +348.1%     737273        sched_debug.cpu.clock.avg
>     164650          +347.8%     737340        sched_debug.cpu.clock.max
>     164409          +348.4%     737199        sched_debug.cpu.clock.min
>      69.02 =C2=B1 21%     -42.2%      39.92        sched_debug.cpu.clock.=
stddev
>     164543          +348.1%     737273        sched_debug.cpu.clock_task.=
avg
>     164650          +347.8%     737340        sched_debug.cpu.clock_task.=
max
>     164409          +348.4%     737199        sched_debug.cpu.clock_task.=
min
>      69.02 =C2=B1 21%     -42.2%      39.92        sched_debug.cpu.clock_=
task.stddev
>       7700 =C2=B1  4%    +218.9%      24553 =C2=B1  3%  sched_debug.cpu.c=
urr->pid.max
>     669.60 =C2=B1  3%    +215.8%       2114        sched_debug.cpu.curr->=
pid.stddev
>       0.00 =C2=B1  5%     -36.3%       0.00 =C2=B1  5%  sched_debug.cpu.n=
ext_balance.stddev
>       1.72 =C2=B1 11%     -47.7%       0.90 =C2=B1  4%  sched_debug.cpu.n=
r_running.avg
>       5.64 =C2=B1 21%     -64.8%       1.99 =C2=B1  6%  sched_debug.cpu.n=
r_running.max
>       0.92 =C2=B1 11%     -50.7%       0.45        sched_debug.cpu.nr_run=
ning.stddev
>      18287         +4335.0%     811042        sched_debug.cpu.nr_switches=
.avg
>      30879 =C2=B1  6%   +3343.4%    1063313 =C2=B1  6%  sched_debug.cpu.n=
r_switches.max
>      16348         +4339.5%     725790        sched_debug.cpu.nr_switches=
.min
>       1716 =C2=B1  7%   +2885.6%      51247 =C2=B1  3%  sched_debug.cpu.n=
r_switches.stddev
>       4.53 =C2=B1  3%     +44.5%       6.55        sched_debug.cpu.nr_uni=
nterruptible.avg
>     304.28 =C2=B1  9%   +1266.0%       4156 =C2=B1  3%  sched_debug.cpu.n=
r_uninterruptible.max
>    -231.72         +1580.3%      -3893        sched_debug.cpu.nr_uninterr=
uptible.min
>      88.71 =C2=B1  3%   +1730.0%       1623 =C2=B1  2%  sched_debug.cpu.n=
r_uninterruptible.stddev
>      16905         +4688.5%     809524        sched_debug.cpu.sched_count=
.avg
>      22542 =C2=B1  4%   +4610.3%    1061845 =C2=B1  6%  sched_debug.cpu.s=
ched_count.max
>      15528         +4565.3%     724441        sched_debug.cpu.sched_count=
.min
>     951.11 =C2=B1  7%   +5282.8%      51196 =C2=B1  3%  sched_debug.cpu.s=
ched_count.stddev
>       1345 =C2=B1  9%  +24927.1%     336689        sched_debug.cpu.sched_=
goidle.avg
>       3786 =C2=B1  3%  +12139.2%     463382 =C2=B1  7%  sched_debug.cpu.s=
ched_goidle.max
>       1085 =C2=B1 11%  +26980.4%     293854 =C2=B1  2%  sched_debug.cpu.s=
ched_goidle.min
>     302.18 =C2=B1  7%   +8431.2%      25779 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.stddev
>       6306 =C2=B1  2%   +7319.7%     467943        sched_debug.cpu.ttwu_c=
ount.avg
>      18513 =C2=B1  9%   +3541.8%     674231 =C2=B1 14%  sched_debug.cpu.t=
twu_count.max
>       2295 =C2=B1  2%  +18030.7%     416158        sched_debug.cpu.ttwu_c=
ount.min
>       3005 =C2=B1  5%   +1018.7%      33624 =C2=B1 12%  sched_debug.cpu.t=
twu_count.stddev
>     712.53 =C2=B1  2%   +2987.5%      21999 =C2=B1  3%  sched_debug.cpu.t=
twu_local.avg
>       2785 =C2=B1 18%    +799.4%      25055 =C2=B1  3%  sched_debug.cpu.t=
twu_local.max
>     401.68 =C2=B1  2%   +4920.5%      20166 =C2=B1  2%  sched_debug.cpu.t=
twu_local.min
>     311.42 =C2=B1 14%     +88.0%     585.51 =C2=B1  3%  sched_debug.cpu.t=
twu_local.stddev
>     164407          +348.4%     737198        sched_debug.cpu_clk
>     160360          +357.2%     733150        sched_debug.ktime
>       3.02          -100.0%       0.00        sched_debug.rt_rq:/.rt_runt=
ime.stddev
>     164924          +347.3%     737715        sched_debug.sched_clk
>       6948 =C2=B1  7%    +590.2%      47953 =C2=B1  3%  softirqs.CPU0.RCU
>      15616 =C2=B1  8%   +1391.4%     232912 =C2=B1  2%  softirqs.CPU0.SCH=
ED
>     112053 =C2=B1 16%    +299.2%     447317        softirqs.CPU0.TIMER
>       9606 =C2=B1 25%    +422.4%      50188 =C2=B1  3%  softirqs.CPU1.RCU
>       7290 =C2=B1 13%   +2996.0%     225695        softirqs.CPU1.SCHED
>      99794 =C2=B1  3%    +316.4%     415549 =C2=B1  2%  softirqs.CPU1.TIM=
ER
>       7122 =C2=B1  4%    +599.8%      49839 =C2=B1  3%  softirqs.CPU10.RCU
>       6567 =C2=B1  2%   +3318.5%     224499 =C2=B1  2%  softirqs.CPU10.SC=
HED
>     100895 =C2=B1  3%    +321.4%     425178        softirqs.CPU10.TIMER
>       6615 =C2=B1  4%    +629.5%      48258 =C2=B1  2%  softirqs.CPU100.R=
CU
>       6444 =C2=B1  4%   +3330.3%     221062 =C2=B1  2%  softirqs.CPU100.S=
CHED
>     100442 =C2=B1  4%    +321.3%     423118        softirqs.CPU100.TIMER
>       6824 =C2=B1  6%    +608.8%      48371 =C2=B1  2%  softirqs.CPU101.R=
CU
>       6753 =C2=B1  7%   +3198.2%     222724 =C2=B1  2%  softirqs.CPU101.S=
CHED
>     100450 =C2=B1  4%    +322.2%     424145        softirqs.CPU101.TIMER
>       6564 =C2=B1  3%    +629.7%      47900 =C2=B1  2%  softirqs.CPU102.R=
CU
>       6458 =C2=B1  3%   +3297.1%     219385 =C2=B1  3%  softirqs.CPU102.S=
CHED
>     100065 =C2=B1  3%    +323.1%     423371        softirqs.CPU102.TIMER
>       6716 =C2=B1  3%    +606.9%      47479        softirqs.CPU103.RCU
>       6535 =C2=B1  2%   +3307.1%     222660        softirqs.CPU103.SCHED
>      99348 =C2=B1  3%    +422.5%     519120 =C2=B1 27%  softirqs.CPU103.T=
IMER
>       6748 =C2=B1  4%    +618.7%      48499 =C2=B1  2%  softirqs.CPU104.R=
CU
>       6549 =C2=B1  2%   +3279.5%     221341 =C2=B1  2%  softirqs.CPU104.S=
CHED
>      99323 =C2=B1  3%    +322.9%     420049        softirqs.CPU104.TIMER
>       6690 =C2=B1  4%    +621.4%      48267 =C2=B1  3%  softirqs.CPU105.R=
CU
>       6529         +3295.7%     221733        softirqs.CPU105.SCHED
>      99487 =C2=B1  3%    +323.1%     420911        softirqs.CPU105.TIMER
>       6595 =C2=B1  5%    +629.8%      48136 =C2=B1  3%  softirqs.CPU106.R=
CU
>       6447 =C2=B1  2%   +3332.5%     221318 =C2=B1  2%  softirqs.CPU106.S=
CHED
>     100048 =C2=B1  3%    +322.2%     422440        softirqs.CPU106.TIMER
>       6489 =C2=B1  6%    +637.1%      47828 =C2=B1  3%  softirqs.CPU107.R=
CU
>       6567 =C2=B1  7%   +3289.8%     222605        softirqs.CPU107.SCHED
>     101721 =C2=B1  5%    +315.5%     422698        softirqs.CPU107.TIMER
>       6703 =C2=B1  8%    +624.2%      48544 =C2=B1  4%  softirqs.CPU108.R=
CU
>       6501 =C2=B1  6%   +3329.0%     222936        softirqs.CPU108.SCHED
>     100442 =C2=B1  4%    +321.9%     423812        softirqs.CPU108.TIMER
>       7748 =C2=B1 22%    +525.2%      48446 =C2=B1  2%  softirqs.CPU109.R=
CU
>       6692 =C2=B1  7%   +3231.0%     222923        softirqs.CPU109.SCHED
>      99658 =C2=B1  4%    +320.2%     418799        softirqs.CPU109.TIMER
>       7084 =C2=B1  5%    +598.9%      49512 =C2=B1  3%  softirqs.CPU11.RCU
>       6589 =C2=B1  4%   +3308.5%     224588 =C2=B1  2%  softirqs.CPU11.SC=
HED
>     111261 =C2=B1 19%    +282.3%     425380        softirqs.CPU11.TIMER
>       6676 =C2=B1  4%    +627.2%      48549 =C2=B1  3%  softirqs.CPU110.R=
CU
>       6529 =C2=B1  2%   +3313.5%     222883        softirqs.CPU110.SCHED
>     100473 =C2=B1  4%    +318.0%     420016        softirqs.CPU110.TIMER
>       6871 =C2=B1 10%    +598.3%      47982 =C2=B1  2%  softirqs.CPU111.R=
CU
>       6769 =C2=B1  9%   +3192.2%     222869        softirqs.CPU111.SCHED
>     100334 =C2=B1  4%    +320.0%     421361        softirqs.CPU111.TIMER
>       6591 =C2=B1  5%    +634.7%      48427 =C2=B1  3%  softirqs.CPU112.R=
CU
>       6484 =C2=B1  2%   +3325.8%     222130 =C2=B1  2%  softirqs.CPU112.S=
CHED
>     100066 =C2=B1  3%    +321.8%     422083        softirqs.CPU112.TIMER
>       6775 =C2=B1  8%    +617.9%      48644 =C2=B1  3%  softirqs.CPU113.R=
CU
>       6506 =C2=B1  3%   +3322.0%     222636        softirqs.CPU113.SCHED
>     101137 =C2=B1  4%    +318.3%     423010        softirqs.CPU113.TIMER
>       7112 =C2=B1 10%    +581.6%      48476 =C2=B1  3%  softirqs.CPU114.R=
CU
>       6700 =C2=B1  5%   +3238.4%     223676        softirqs.CPU114.SCHED
>     100962 =C2=B1  4%    +318.9%     422958        softirqs.CPU114.TIMER
>       7016 =C2=B1 13%    +579.1%      47649 =C2=B1  4%  softirqs.CPU115.R=
CU
>       6823 =C2=B1  6%   +3188.0%     224352        softirqs.CPU115.SCHED
>     100539 =C2=B1  4%    +417.2%     519981 =C2=B1 25%  softirqs.CPU115.T=
IMER
>       6566 =C2=B1  5%    +636.4%      48353 =C2=B1  3%  softirqs.CPU116.R=
CU
>       6505 =C2=B1  3%   +3333.6%     223365        softirqs.CPU116.SCHED
>     109750 =C2=B1 18%    +283.9%     421295        softirqs.CPU116.TIMER
>       7045 =C2=B1 10%    +583.1%      48127 =C2=B1  4%  softirqs.CPU117.R=
CU
>       6488 =C2=B1  2%   +3334.0%     222805        softirqs.CPU117.SCHED
>     100503 =C2=B1  3%    +318.7%     420840        softirqs.CPU117.TIMER
>       6562 =C2=B1  4%    +639.4%      48518 =C2=B1  3%  softirqs.CPU118.R=
CU
>       6731 =C2=B1  3%   +3219.5%     223443        softirqs.CPU118.SCHED
>     100293 =C2=B1  3%    +320.4%     421588        softirqs.CPU118.TIMER
>       6450 =C2=B1  3%    +654.3%      48658 =C2=B1  3%  softirqs.CPU119.R=
CU
>       6437 =C2=B1  2%   +3373.2%     223592        softirqs.CPU119.SCHED
>      99973 =C2=B1  4%    +322.4%     422306        softirqs.CPU119.TIMER
>       7284 =C2=B1  6%    +584.2%      49839 =C2=B1  4%  softirqs.CPU12.RCU
>       6567 =C2=B1  2%   +3342.6%     226076        softirqs.CPU12.SCHED
>     101374 =C2=B1  3%    +319.8%     425528        softirqs.CPU12.TIMER
>       6296 =C2=B1  8%    +692.1%      49871 =C2=B1  4%  softirqs.CPU120.R=
CU
>       6352 =C2=B1  4%   +3430.1%     224262        softirqs.CPU120.SCHED
>      97480 =C2=B1  6%    +344.5%     433272        softirqs.CPU120.TIMER
>       6370 =C2=B1  4%    +675.3%      49385 =C2=B1  4%  softirqs.CPU121.R=
CU
>       6385 =C2=B1  3%   +3413.3%     224323        softirqs.CPU121.SCHED
>      95827 =C2=B1  4%    +349.7%     430902        softirqs.CPU121.TIMER
>       6423 =C2=B1  3%    +669.6%      49437 =C2=B1  4%  softirqs.CPU122.R=
CU
>       6388 =C2=B1  3%   +3408.0%     224121        softirqs.CPU122.SCHED
>      95887 =C2=B1  4%    +350.4%     431902        softirqs.CPU122.TIMER
>       6454 =C2=B1  5%    +672.6%      49868 =C2=B1  4%  softirqs.CPU123.R=
CU
>       6391 =C2=B1  3%   +3419.8%     224964        softirqs.CPU123.SCHED
>      96070 =C2=B1  4%    +350.4%     432731        softirqs.CPU123.TIMER
>       6506 =C2=B1  7%    +668.5%      49999 =C2=B1  4%  softirqs.CPU124.R=
CU
>       6515 =C2=B1  6%   +3336.7%     223920        softirqs.CPU124.SCHED
>      97095 =C2=B1  3%    +345.4%     432489        softirqs.CPU124.TIMER
>       6646 =C2=B1  5%    +655.6%      50222 =C2=B1  4%  softirqs.CPU125.R=
CU
>       6508 =C2=B1  4%   +3346.3%     224286        softirqs.CPU125.SCHED
>      97177 =C2=B1  4%    +344.3%     431799        softirqs.CPU125.TIMER
>       6340 =C2=B1  4%    +685.4%      49799 =C2=B1  4%  softirqs.CPU126.R=
CU
>       6374 =C2=B1  2%   +3420.2%     224390        softirqs.CPU126.SCHED
>      96860 =C2=B1  4%    +346.0%     431964        softirqs.CPU126.TIMER
>       6428 =C2=B1  5%    +672.9%      49680 =C2=B1  4%  softirqs.CPU127.R=
CU
>       6431 =C2=B1  3%   +3389.6%     224427        softirqs.CPU127.SCHED
>      96044 =C2=B1  4%    +348.7%     430963        softirqs.CPU127.TIMER
>       6441 =C2=B1  4%    +667.8%      49459 =C2=B1  4%  softirqs.CPU128.R=
CU
>       6375 =C2=B1  3%   +3413.5%     223990        softirqs.CPU128.SCHED
>      95379 =C2=B1  4%    +352.3%     431364        softirqs.CPU128.TIMER
>       6382 =C2=B1  5%    +680.0%      49782 =C2=B1  4%  softirqs.CPU129.R=
CU
>       6417 =C2=B1  3%   +3392.9%     224137        softirqs.CPU129.SCHED
>      95636 =C2=B1  4%    +350.3%     430691        softirqs.CPU129.TIMER
>       7674 =C2=B1 10%    +536.4%      48840 =C2=B1  3%  softirqs.CPU13.RCU
>       6467 =C2=B1  3%   +3389.8%     225710        softirqs.CPU13.SCHED
>      99553 =C2=B1  3%    +323.6%     421661        softirqs.CPU13.TIMER
>       6430 =C2=B1  3%    +676.3%      49923 =C2=B1  4%  softirqs.CPU130.R=
CU
>       6377 =C2=B1  3%   +3412.7%     224035        softirqs.CPU130.SCHED
>      96447 =C2=B1  4%    +348.4%     432453        softirqs.CPU130.TIMER
>       6868 =C2=B1 11%    +630.8%      50196 =C2=B1  4%  softirqs.CPU131.R=
CU
>       6444 =C2=B1  2%   +3380.0%     224255        softirqs.CPU131.SCHED
>      96405 =C2=B1  4%    +348.9%     432742        softirqs.CPU131.TIMER
>       6456 =C2=B1  4%    +679.4%      50321 =C2=B1  4%  softirqs.CPU132.R=
CU
>       6373 =C2=B1  3%   +3419.3%     224298        softirqs.CPU132.SCHED
>      96916 =C2=B1  3%    +347.3%     433553        softirqs.CPU132.TIMER
>       6387 =C2=B1  3%    +663.2%      48745 =C2=B1  4%  softirqs.CPU133.R=
CU
>       6375 =C2=B1  3%   +3410.6%     223806        softirqs.CPU133.SCHED
>      95280 =C2=B1  4%    +351.6%     430273        softirqs.CPU133.TIMER
>       6391 =C2=B1  4%    +675.0%      49530 =C2=B1  5%  softirqs.CPU134.R=
CU
>       6345 =C2=B1  3%   +3435.7%     224352        softirqs.CPU134.SCHED
>      95886 =C2=B1  4%    +348.9%     430430        softirqs.CPU134.TIMER
>       6401 =C2=B1  3%    +675.7%      49659 =C2=B1  4%  softirqs.CPU135.R=
CU
>       6366 =C2=B1  4%   +3428.0%     224599        softirqs.CPU135.SCHED
>      95857 =C2=B1  4%    +350.1%     431407        softirqs.CPU135.TIMER
>       6361 =C2=B1  4%    +677.5%      49456 =C2=B1  4%  softirqs.CPU136.R=
CU
>       6329 =C2=B1  4%   +3445.9%     224443        softirqs.CPU136.SCHED
>      96260 =C2=B1  4%    +349.2%     432394        softirqs.CPU136.TIMER
>       6658 =C2=B1  3%    +653.9%      50194 =C2=B1  4%  softirqs.CPU137.R=
CU
>       6394 =C2=B1  2%   +3415.8%     224806        softirqs.CPU137.SCHED
>      96907 =C2=B1  4%    +346.2%     432390        softirqs.CPU137.TIMER
>       6568 =C2=B1  4%    +675.4%      50934 =C2=B1  4%  softirqs.CPU138.R=
CU
>       6468 =C2=B1  2%   +3380.1%     225112        softirqs.CPU138.SCHED
>      96747 =C2=B1  4%    +348.4%     433792        softirqs.CPU138.TIMER
>       6371 =C2=B1  5%    +681.4%      49789 =C2=B1  4%  softirqs.CPU139.R=
CU
>       6367 =C2=B1  3%   +3420.5%     224177        softirqs.CPU139.SCHED
>      95658 =C2=B1  4%    +350.7%     431141        softirqs.CPU139.TIMER
>       7339 =C2=B1  9%    +565.1%      48812 =C2=B1  3%  softirqs.CPU14.RCU
>       6486 =C2=B1  3%   +3378.0%     225581        softirqs.CPU14.SCHED
>     100587 =C2=B1  3%    +320.4%     422882        softirqs.CPU14.TIMER
>       6413 =C2=B1  3%    +669.3%      49337 =C2=B1  3%  softirqs.CPU140.R=
CU
>       6338 =C2=B1  3%   +3440.7%     224433        softirqs.CPU140.SCHED
>      96029 =C2=B1  4%    +348.3%     430493        softirqs.CPU140.TIMER
>       6440 =C2=B1  3%    +675.8%      49965 =C2=B1  4%  softirqs.CPU141.R=
CU
>       6360 =C2=B1  3%   +3435.2%     224864        softirqs.CPU141.SCHED
>      96068 =C2=B1  4%    +348.5%     430837        softirqs.CPU141.TIMER
>       6423 =C2=B1  3%    +686.1%      50497 =C2=B1  4%  softirqs.CPU142.R=
CU
>       6359 =C2=B1  3%   +3435.3%     224828        softirqs.CPU142.SCHED
>      96602 =C2=B1  5%    +347.2%     432006        softirqs.CPU142.TIMER
>       6433 =C2=B1  6%    +682.4%      50333 =C2=B1  4%  softirqs.CPU143.R=
CU
>       6447 =C2=B1  2%   +3395.2%     225337        softirqs.CPU143.SCHED
>      96533 =C2=B1  4%    +347.5%     431956        softirqs.CPU143.TIMER
>       6823 =C2=B1 10%    +630.2%      49826 =C2=B1  3%  softirqs.CPU144.R=
CU
>       6212 =C2=B1  3%   +3510.5%     224298        softirqs.CPU144.SCHED
>      97037 =C2=B1  5%    +348.7%     435396        softirqs.CPU144.TIMER
>       6562 =C2=B1  4%    +656.7%      49652 =C2=B1  3%  softirqs.CPU145.R=
CU
>       6336 =C2=B1  4%   +3430.4%     223709        softirqs.CPU145.SCHED
>      96523 =C2=B1  4%    +347.4%     431880        softirqs.CPU145.TIMER
>       6641 =C2=B1  7%    +639.0%      49081 =C2=B1  3%  softirqs.CPU146.R=
CU
>       6454 =C2=B1  7%   +3364.1%     223600        softirqs.CPU146.SCHED
>      96693 =C2=B1  3%    +348.2%     433393        softirqs.CPU146.TIMER
>       6506 =C2=B1  4%    +668.5%      50002 =C2=B1  4%  softirqs.CPU147.R=
CU
>       6327 =C2=B1  3%   +3435.5%     223710        softirqs.CPU147.SCHED
>      96523 =C2=B1  4%    +349.1%     433473        softirqs.CPU147.TIMER
>       6397 =C2=B1  3%    +679.4%      49861 =C2=B1  4%  softirqs.CPU148.R=
CU
>       6347 =C2=B1  3%   +3427.2%     223879        softirqs.CPU148.SCHED
>      97132 =C2=B1  3%    +346.8%     434002        softirqs.CPU148.TIMER
>       6461 =C2=B1  4%    +673.8%      49998 =C2=B1  4%  softirqs.CPU149.R=
CU
>       6433         +3379.9%     223879        softirqs.CPU149.SCHED
>      97410 =C2=B1  4%    +345.4%     433895        softirqs.CPU149.TIMER
>       7389 =C2=B1  6%    +566.7%      49259 =C2=B1  2%  softirqs.CPU15.RCU
>       6553         +3337.7%     225283 =C2=B1  2%  softirqs.CPU15.SCHED
>     100550 =C2=B1  3%    +322.7%     425021        softirqs.CPU15.TIMER
>       6453 =C2=B1  4%    +680.1%      50346 =C2=B1  4%  softirqs.CPU150.R=
CU
>       6394 =C2=B1  4%   +3407.6%     224302        softirqs.CPU150.SCHED
>      96768 =C2=B1  4%    +349.9%     435333        softirqs.CPU150.TIMER
>       6655 =C2=B1  3%    +659.0%      50519 =C2=B1  3%  softirqs.CPU151.R=
CU
>       6332 =C2=B1  4%   +3430.7%     223580        softirqs.CPU151.SCHED
>      96749 =C2=B1  4%    +347.8%     433255        softirqs.CPU151.TIMER
>       6411 =C2=B1  4%    +676.0%      49755 =C2=B1  3%  softirqs.CPU152.R=
CU
>       6292 =C2=B1  3%   +3460.9%     224051        softirqs.CPU152.SCHED
>      96017 =C2=B1  4%    +350.9%     432901        softirqs.CPU152.TIMER
>       6396 =C2=B1  3%    +674.9%      49566 =C2=B1  4%  softirqs.CPU153.R=
CU
>       6341 =C2=B1  3%   +3432.3%     223982        softirqs.CPU153.SCHED
>      96789 =C2=B1  4%    +348.5%     434085        softirqs.CPU153.TIMER
>       6439 =C2=B1  3%    +674.6%      49883 =C2=B1  4%  softirqs.CPU154.R=
CU
>       6334 =C2=B1  4%   +3441.9%     224342        softirqs.CPU154.SCHED
>      96597 =C2=B1  4%    +349.7%     434437        softirqs.CPU154.TIMER
>       6408 =C2=B1  3%    +675.8%      49718 =C2=B1  3%  softirqs.CPU155.R=
CU
>       6385 =C2=B1  3%   +3410.0%     224113        softirqs.CPU155.SCHED
>      96637 =C2=B1  4%    +349.6%     434494        softirqs.CPU155.TIMER
>       6406 =C2=B1  3%    +677.4%      49808 =C2=B1  3%  softirqs.CPU156.R=
CU
>       6312 =C2=B1  3%   +3447.8%     223948        softirqs.CPU156.SCHED
>      95816 =C2=B1  4%    +351.3%     432439        softirqs.CPU156.TIMER
>       6480 =C2=B1  4%    +670.2%      49908 =C2=B1  3%  softirqs.CPU157.R=
CU
>       6363 =C2=B1  3%   +3422.9%     224175        softirqs.CPU157.SCHED
>      95578 =C2=B1  4%    +352.2%     432243        softirqs.CPU157.TIMER
>       6337 =C2=B1  4%    +683.4%      49643 =C2=B1  4%  softirqs.CPU158.R=
CU
>       6303 =C2=B1  3%   +3468.7%     224934        softirqs.CPU158.SCHED
>      96174 =C2=B1  4%    +350.5%     433290        softirqs.CPU158.TIMER
>       6321 =C2=B1  4%    +678.0%      49184 =C2=B1  3%  softirqs.CPU159.R=
CU
>       6317 =C2=B1  4%   +3451.1%     224339        softirqs.CPU159.SCHED
>      96610 =C2=B1  4%    +348.9%     433639        softirqs.CPU159.TIMER
>       6975 =C2=B1  5%    +603.2%      49054 =C2=B1  3%  softirqs.CPU16.RCU
>       6446 =C2=B1  3%   +3406.1%     226003        softirqs.CPU16.SCHED
>     100522 =C2=B1  3%    +322.0%     424202        softirqs.CPU16.TIMER
>       6281 =C2=B1  5%    +708.3%      50773 =C2=B1  3%  softirqs.CPU160.R=
CU
>       6315 =C2=B1  3%   +3458.1%     224719        softirqs.CPU160.SCHED
>      96502 =C2=B1  4%    +351.1%     435331        softirqs.CPU160.TIMER
>       6284 =C2=B1  4%    +707.8%      50761 =C2=B1  2%  softirqs.CPU161.R=
CU
>       6273 =C2=B1  4%   +3485.3%     224906        softirqs.CPU161.SCHED
>      96666 =C2=B1  4%    +349.8%     434841        softirqs.CPU161.TIMER
>       6360 =C2=B1  4%    +679.9%      49601 =C2=B1  3%  softirqs.CPU162.R=
CU
>       6323 =C2=B1  3%   +3448.0%     224359        softirqs.CPU162.SCHED
>      95878 =C2=B1  4%    +350.9%     432282        softirqs.CPU162.TIMER
>       6189 =C2=B1  4%    +712.8%      50306 =C2=B1  3%  softirqs.CPU163.R=
CU
>       6325 =C2=B1  3%   +3448.3%     224436        softirqs.CPU163.SCHED
>      95704 =C2=B1  4%    +351.6%     432242        softirqs.CPU163.TIMER
>       6256 =C2=B1  3%    +699.8%      50038 =C2=B1  3%  softirqs.CPU164.R=
CU
>       6392 =C2=B1  4%   +3412.8%     224558        softirqs.CPU164.SCHED
>      96614 =C2=B1  3%    +348.3%     433084        softirqs.CPU164.TIMER
>       6283 =C2=B1  4%    +694.0%      49889 =C2=B1  3%  softirqs.CPU165.R=
CU
>       6357 =C2=B1  3%   +3438.9%     224982        softirqs.CPU165.SCHED
>      96598 =C2=B1  4%    +347.9%     432624        softirqs.CPU165.TIMER
>       6399 =C2=B1  4%    +688.9%      50481 =C2=B1  3%  softirqs.CPU166.R=
CU
>       6379 =C2=B1  4%   +3420.4%     224597        softirqs.CPU166.SCHED
>      96634 =C2=B1  4%    +348.0%     432935        softirqs.CPU166.TIMER
>       6421 =C2=B1  6%    +682.6%      50256 =C2=B1  3%  softirqs.CPU167.R=
CU
>       6323 =C2=B1  3%   +3459.5%     225097        softirqs.CPU167.SCHED
>      96734 =C2=B1  3%    +347.3%     432683        softirqs.CPU167.TIMER
>       6351 =C2=B1 14%    +644.4%      47276 =C2=B1  4%  softirqs.CPU168.R=
CU
>       6510 =C2=B1  8%   +3266.8%     219187        softirqs.CPU168.SCHED
>     105010 =C2=B1  5%    +324.7%     445958        softirqs.CPU168.TIMER
>       6035 =C2=B1  2%    +680.9%      47128 =C2=B1  4%  softirqs.CPU169.R=
CU
>       6390         +3327.9%     219062 =C2=B1  2%  softirqs.CPU169.SCHED
>     104329 =C2=B1  4%    +323.8%     442143        softirqs.CPU169.TIMER
>       7421 =C2=B1 12%    +560.9%      49048 =C2=B1  3%  softirqs.CPU17.RCU
>       6557 =C2=B1  3%   +3331.6%     225013        softirqs.CPU17.SCHED
>     101494 =C2=B1  4%    +319.0%     425286        softirqs.CPU17.TIMER
>       6378 =C2=B1 12%    +640.7%      47249 =C2=B1  4%  softirqs.CPU170.R=
CU
>       6657 =C2=B1  7%   +3174.0%     217958        softirqs.CPU170.SCHED
>     105000 =C2=B1  5%    +321.8%     442861        softirqs.CPU170.TIMER
>       6241 =C2=B1 10%    +658.2%      47320 =C2=B1  4%  softirqs.CPU171.R=
CU
>       6578 =C2=B1  4%   +3203.9%     217350 =C2=B1  2%  softirqs.CPU171.S=
CHED
>     104848 =C2=B1  5%    +321.9%     442372        softirqs.CPU171.TIMER
>       6272 =C2=B1 10%    +660.0%      47669 =C2=B1  3%  softirqs.CPU172.R=
CU
>       6334 =C2=B1  2%   +3368.2%     219687 =C2=B1  2%  softirqs.CPU172.S=
CHED
>     105809 =C2=B1  5%    +319.7%     444094        softirqs.CPU172.TIMER
>       5887 =C2=B1  6%    +707.9%      47564 =C2=B1  3%  softirqs.CPU173.R=
CU
>       6349 =C2=B1  3%   +3347.4%     218886        softirqs.CPU173.SCHED
>     105989 =C2=B1  2%    +318.6%     443706        softirqs.CPU173.TIMER
>       6013 =C2=B1  6%    +692.0%      47623 =C2=B1  4%  softirqs.CPU174.R=
CU
>       6358 =C2=B1  3%   +3333.0%     218284 =C2=B1  2%  softirqs.CPU174.S=
CHED
>     104940 =C2=B1  4%    +323.6%     444502        softirqs.CPU174.TIMER
>       6120 =C2=B1  7%    +669.2%      47082 =C2=B1  4%  softirqs.CPU175.R=
CU
>       6445 =C2=B1  4%   +3315.0%     220118        softirqs.CPU175.SCHED
>     104128 =C2=B1  4%    +322.9%     440349        softirqs.CPU175.TIMER
>       6207 =C2=B1  5%    +665.9%      47546 =C2=B1  5%  softirqs.CPU176.R=
CU
>       6419 =C2=B1  4%   +3306.7%     218692        softirqs.CPU176.SCHED
>     103653 =C2=B1  4%    +326.0%     441529        softirqs.CPU176.TIMER
>       6302 =C2=B1  6%    +655.7%      47629 =C2=B1  5%  softirqs.CPU177.R=
CU
>       6500 =C2=B1  5%   +3250.9%     217824        softirqs.CPU177.SCHED
>     104027 =C2=B1  4%    +324.0%     441032        softirqs.CPU177.TIMER
>       6615 =C2=B1  9%    +622.3%      47782 =C2=B1  4%  softirqs.CPU178.R=
CU
>       6514 =C2=B1  8%   +3246.5%     218011 =C2=B1  2%  softirqs.CPU178.S=
CHED
>     106246 =C2=B1  5%    +317.2%     443232        softirqs.CPU178.TIMER
>       6190 =C2=B1  5%    +673.0%      47846 =C2=B1  4%  softirqs.CPU179.R=
CU
>       6481 =C2=B1  4%   +3290.4%     219730        softirqs.CPU179.SCHED
>     104903 =C2=B1  4%    +323.6%     444347        softirqs.CPU179.TIMER
>       7103 =C2=B1  7%    +591.0%      49084 =C2=B1  4%  softirqs.CPU18.RCU
>       6451 =C2=B1  3%   +3362.0%     223332 =C2=B1  2%  softirqs.CPU18.SC=
HED
>     100928 =C2=B1  3%    +321.4%     425321        softirqs.CPU18.TIMER
>       6697 =C2=B1 15%    +609.8%      47538 =C2=B1  4%  softirqs.CPU180.R=
CU
>       6677 =C2=B1  8%   +3132.0%     215827 =C2=B1  2%  softirqs.CPU180.S=
CHED
>     106667 =C2=B1  4%    +315.5%     443202        softirqs.CPU180.TIMER
>       6316 =C2=B1  6%    +657.5%      47852 =C2=B1  4%  softirqs.CPU181.R=
CU
>       6414 =C2=B1  6%   +3308.0%     218590 =C2=B1  2%  softirqs.CPU181.S=
CHED
>     103954 =C2=B1  3%    +325.1%     441947        softirqs.CPU181.TIMER
>       6204 =C2=B1  3%    +664.2%      47415 =C2=B1  4%  softirqs.CPU182.R=
CU
>       6373 =C2=B1  3%   +3326.7%     218413 =C2=B1  2%  softirqs.CPU182.S=
CHED
>     103886 =C2=B1  4%    +326.2%     442806        softirqs.CPU182.TIMER
>       6535 =C2=B1 10%    +629.4%      47670 =C2=B1  4%  softirqs.CPU183.R=
CU
>       6582 =C2=B1  8%   +3238.0%     219705        softirqs.CPU183.SCHED
>     105135 =C2=B1  3%    +320.3%     441839        softirqs.CPU183.TIMER
>       6115 =C2=B1  4%    +676.4%      47478 =C2=B1  4%  softirqs.CPU184.R=
CU
>       6406         +3306.3%     218227        softirqs.CPU184.SCHED
>     104866 =C2=B1  4%    +323.1%     443645        softirqs.CPU184.TIMER
>       6246 =C2=B1  4%    +662.9%      47652 =C2=B1  4%  softirqs.CPU185.R=
CU
>       6474 =C2=B1  3%   +3296.9%     219926        softirqs.CPU185.SCHED
>     105087 =C2=B1  4%    +322.8%     444308        softirqs.CPU185.TIMER
>       6323 =C2=B1  4%    +656.1%      47810 =C2=B1  4%  softirqs.CPU186.R=
CU
>       6518 =C2=B1  3%   +3256.5%     218785        softirqs.CPU186.SCHED
>     105062 =C2=B1  4%    +322.6%     443982        softirqs.CPU186.TIMER
>       6173 =C2=B1  4%    +672.9%      47709 =C2=B1  5%  softirqs.CPU187.R=
CU
>       6385 =C2=B1  4%   +3321.6%     218468        softirqs.CPU187.SCHED
>     103774 =C2=B1  4%    +325.4%     441429        softirqs.CPU187.TIMER
>       6030 =C2=B1  4%    +692.4%      47786 =C2=B1  4%  softirqs.CPU188.R=
CU
>       6371 =C2=B1  3%   +3325.8%     218255 =C2=B1  2%  softirqs.CPU188.S=
CHED
>     103813 =C2=B1  4%    +325.8%     442046        softirqs.CPU188.TIMER
>       5979 =C2=B1  4%    +693.3%      47439 =C2=B1  4%  softirqs.CPU189.R=
CU
>       6288 =C2=B1  3%   +3366.1%     217960 =C2=B1  3%  softirqs.CPU189.S=
CHED
>     103626 =C2=B1  4%    +326.7%     442132        softirqs.CPU189.TIMER
>       7324 =C2=B1  6%    +558.1%      48203 =C2=B1  5%  softirqs.CPU19.RCU
>       6636 =C2=B1  4%   +3291.8%     225079        softirqs.CPU19.SCHED
>     100607 =C2=B1  3%    +313.9%     416431 =C2=B1  3%  softirqs.CPU19.TI=
MER
>       5976 =C2=B1  4%    +697.9%      47686 =C2=B1  4%  softirqs.CPU190.R=
CU
>       6261 =C2=B1  3%   +3402.9%     219327        softirqs.CPU190.SCHED
>     103842 =C2=B1  4%    +327.6%     444070        softirqs.CPU190.TIMER
>       6146 =C2=B1  4%    +673.0%      47514 =C2=B1  4%  softirqs.CPU191.R=
CU
>       6427         +3312.5%     219333        softirqs.CPU191.SCHED
>     104566 =C2=B1  4%    +323.9%     443286        softirqs.CPU191.TIMER
>       7513 =C2=B1  6%    +551.6%      48955 =C2=B1  3%  softirqs.CPU2.RCU
>       6997 =C2=B1  4%   +3125.1%     225665        softirqs.CPU2.SCHED
>     100560 =C2=B1  3%    +320.3%     422698        softirqs.CPU2.TIMER
>       6802 =C2=B1  2%    +623.7%      49229 =C2=B1  4%  softirqs.CPU20.RCU
>       6472 =C2=B1  3%   +3367.9%     224461        softirqs.CPU20.SCHED
>     103134 =C2=B1  6%    +310.4%     423310        softirqs.CPU20.TIMER
>       7162 =C2=B1  7%    +586.1%      49138 =C2=B1  3%  softirqs.CPU21.RCU
>       6440 =C2=B1  4%   +3369.2%     223417 =C2=B1  2%  softirqs.CPU21.SC=
HED
>     101213 =C2=B1  2%    +317.5%     422612        softirqs.CPU21.TIMER
>       7286 =C2=B1  4%    +571.8%      48948 =C2=B1  3%  softirqs.CPU22.RCU
>       6684 =C2=B1  7%   +3260.0%     224604        softirqs.CPU22.SCHED
>     100987 =C2=B1  4%    +320.3%     424462        softirqs.CPU22.TIMER
>       6954 =C2=B1  4%    +603.3%      48912 =C2=B1  3%  softirqs.CPU23.RCU
>       6462 =C2=B1  5%   +3354.3%     223216 =C2=B1  2%  softirqs.CPU23.SC=
HED
>     100810 =C2=B1  4%    +321.5%     424953        softirqs.CPU23.TIMER
>       7270 =C2=B1  9%    +592.0%      50314 =C2=B1  4%  softirqs.CPU24.RCU
>       6476 =C2=B1  2%   +3417.8%     227840        softirqs.CPU24.SCHED
>     106950 =C2=B1 21%    +306.5%     434754        softirqs.CPU24.TIMER
>       6891 =C2=B1  3%    +628.4%      50200 =C2=B1  4%  softirqs.CPU25.RCU
>       6530 =C2=B1  2%   +3391.6%     228029        softirqs.CPU25.SCHED
>      96906 =C2=B1  4%    +346.6%     432807        softirqs.CPU25.TIMER
>       6890 =C2=B1  4%    +625.4%      49982 =C2=B1  4%  softirqs.CPU26.RCU
>       6399 =C2=B1  2%   +3460.5%     227867        softirqs.CPU26.SCHED
>      96608 =C2=B1  4%    +348.5%     433286        softirqs.CPU26.TIMER
>       6929 =C2=B1  3%    +625.6%      50282 =C2=B1  4%  softirqs.CPU27.RCU
>       6440 =C2=B1  2%   +3441.9%     228117        softirqs.CPU27.SCHED
>      96717 =C2=B1  4%    +348.1%     433422        softirqs.CPU27.TIMER
>       6884 =C2=B1  4%    +630.6%      50302 =C2=B1  4%  softirqs.CPU28.RCU
>       6347 =C2=B1  2%   +3495.4%     228198        softirqs.CPU28.SCHED
>      97454 =C2=B1  4%    +345.6%     434233        softirqs.CPU28.TIMER
>       6958 =C2=B1  6%    +621.6%      50212 =C2=B1  4%  softirqs.CPU29.RCU
>       6496 =C2=B1  4%   +3410.9%     228070        softirqs.CPU29.SCHED
>      97721 =C2=B1  4%    +343.9%     433820        softirqs.CPU29.TIMER
>       7137 =C2=B1  7%    +588.8%      49162 =C2=B1  3%  softirqs.CPU3.RCU
>       6657 =C2=B1  5%   +3304.9%     226681        softirqs.CPU3.SCHED
>     100488 =C2=B1  3%    +322.9%     424944        softirqs.CPU3.TIMER
>       6847 =C2=B1  3%    +630.0%      49989 =C2=B1  4%  softirqs.CPU30.RCU
>       6412 =C2=B1  2%   +3449.7%     227609        softirqs.CPU30.SCHED
>      97587 =C2=B1  4%    +344.8%     434070        softirqs.CPU30.TIMER
>       7010 =C2=B1  4%    +616.4%      50222 =C2=B1  4%  softirqs.CPU31.RCU
>       6319 =C2=B1  3%   +3506.9%     227938        softirqs.CPU31.SCHED
>      96860 =C2=B1  3%    +347.3%     433255        softirqs.CPU31.TIMER
>       7005 =C2=B1  2%    +619.5%      50402 =C2=B1  3%  softirqs.CPU32.RCU
>       6377 =C2=B1  3%   +3470.0%     227690        softirqs.CPU32.SCHED
>      96190 =C2=B1  4%    +349.5%     432398        softirqs.CPU32.TIMER
>       7066 =C2=B1  6%    +616.9%      50658 =C2=B1  4%  softirqs.CPU33.RCU
>       6323 =C2=B1  2%   +3503.3%     227866        softirqs.CPU33.SCHED
>      96658 =C2=B1  4%    +347.6%     432643        softirqs.CPU33.TIMER
>       6934 =C2=B1  3%    +625.8%      50333 =C2=B1  4%  softirqs.CPU34.RCU
>       6316 =C2=B1  3%   +3507.4%     227871        softirqs.CPU34.SCHED
>      97157 =C2=B1  4%    +347.2%     434447        softirqs.CPU34.TIMER
>       7171 =C2=B1  9%    +604.6%      50523 =C2=B1  4%  softirqs.CPU35.RCU
>       6351 =C2=B1  2%   +3484.0%     227635        softirqs.CPU35.SCHED
>      97288 =C2=B1  4%    +347.3%     435180        softirqs.CPU35.TIMER
>       7021 =C2=B1  2%    +618.4%      50439 =C2=B1  4%  softirqs.CPU36.RCU
>       6441 =C2=B1  3%   +3433.2%     227600        softirqs.CPU36.SCHED
>      97848 =C2=B1  3%    +345.1%     435527        softirqs.CPU36.TIMER
>       6969 =C2=B1  3%    +616.3%      49918 =C2=B1  4%  softirqs.CPU37.RCU
>       6372 =C2=B1  3%   +3464.8%     227168        softirqs.CPU37.SCHED
>      96145 =C2=B1  4%    +349.0%     431702        softirqs.CPU37.TIMER
>       7021 =C2=B1  3%    +618.3%      50432 =C2=B1  4%  softirqs.CPU38.RCU
>       6403 =C2=B1  3%   +3451.2%     227405        softirqs.CPU38.SCHED
>      96764 =C2=B1  4%    +347.3%     432870        softirqs.CPU38.TIMER
>       6935 =C2=B1  4%    +627.5%      50450 =C2=B1  4%  softirqs.CPU39.RCU
>       6332 =C2=B1  2%   +3491.4%     227415        softirqs.CPU39.SCHED
>      96645 =C2=B1  4%    +348.1%     433048        softirqs.CPU39.TIMER
>       9239 =C2=B1 26%    +435.4%      49467 =C2=B1  4%  softirqs.CPU4.RCU
>       6073 =C2=B1 12%   +3608.0%     225199 =C2=B1  2%  softirqs.CPU4.SCH=
ED
>     101795 =C2=B1  4%    +317.5%     425038        softirqs.CPU4.TIMER
>       7067 =C2=B1  3%    +613.5%      50421 =C2=B1  4%  softirqs.CPU40.RCU
>       6484 =C2=B1  5%   +3399.9%     226964        softirqs.CPU40.SCHED
>      97475 =C2=B1  4%    +345.0%     433783        softirqs.CPU40.TIMER
>       6943 =C2=B1  3%    +630.3%      50703 =C2=B1  4%  softirqs.CPU41.RCU
>       6318 =C2=B1  3%   +3493.1%     227025        softirqs.CPU41.SCHED
>      97348 =C2=B1  4%    +346.7%     434903        softirqs.CPU41.TIMER
>       7012 =C2=B1  3%    +619.4%      50450 =C2=B1  4%  softirqs.CPU42.RCU
>       6471 =C2=B1  4%   +3408.7%     227050        softirqs.CPU42.SCHED
>      97799 =C2=B1  4%    +344.5%     434718        softirqs.CPU42.TIMER
>       7057 =C2=B1  3%    +621.1%      50893 =C2=B1  3%  softirqs.CPU43.RCU
>       6453 =C2=B1  4%   +3416.5%     226941        softirqs.CPU43.SCHED
>      96710 =C2=B1  4%    +348.9%     434145        softirqs.CPU43.TIMER
>       7108 =C2=B1  6%    +611.9%      50601 =C2=B1  4%  softirqs.CPU44.RCU
>       6340 =C2=B1  2%   +3479.8%     226985        softirqs.CPU44.SCHED
>      97384 =C2=B1  5%    +344.9%     433227        softirqs.CPU44.TIMER
>       7071 =C2=B1  3%    +614.1%      50501 =C2=B1  4%  softirqs.CPU45.RCU
>       6417 =C2=B1  3%   +3434.2%     226820        softirqs.CPU45.SCHED
>      97285 =C2=B1  4%    +345.3%     433255        softirqs.CPU45.TIMER
>       6928 =C2=B1  3%    +629.9%      50570 =C2=B1  4%  softirqs.CPU46.RCU
>       6436 =C2=B1  3%   +3426.5%     226971        softirqs.CPU46.SCHED
>      97727 =C2=B1  5%    +344.3%     434199        softirqs.CPU46.TIMER
>       6920 =C2=B1  3%    +626.8%      50293 =C2=B1  4%  softirqs.CPU47.RCU
>       6398 =C2=B1  3%   +3441.2%     226595        softirqs.CPU47.SCHED
>      97225 =C2=B1  4%    +346.7%     434299        softirqs.CPU47.TIMER
>       7631 =C2=B1  7%    +567.7%      50954 =C2=B1  4%  softirqs.CPU48.RCU
>       6172 =C2=B1  4%   +3593.2%     227964        softirqs.CPU48.SCHED
>      98008 =C2=B1  5%    +346.1%     437224        softirqs.CPU48.TIMER
>       7061 =C2=B1  7%    +617.0%      50632 =C2=B1  4%  softirqs.CPU49.RCU
>       6351 =C2=B1  3%   +3487.0%     227812        softirqs.CPU49.SCHED
>      97396 =C2=B1  4%    +345.5%     433916        softirqs.CPU49.TIMER
>       7095 =C2=B1  3%    +627.4%      51611 =C2=B1  6%  softirqs.CPU5.RCU
>       6516 =C2=B1  3%   +3370.0%     226133        softirqs.CPU5.SCHED
>     100991 =C2=B1  3%    +323.9%     428138        softirqs.CPU5.TIMER
>       7063 =C2=B1  3%    +614.9%      50491 =C2=B1  4%  softirqs.CPU50.RCU
>       6374 =C2=B1  5%   +3476.1%     227945        softirqs.CPU50.SCHED
>      96983 =C2=B1  4%    +347.8%     434289        softirqs.CPU50.TIMER
>       7410 =C2=B1  6%    +578.5%      50283 =C2=B1  4%  softirqs.CPU51.RCU
>       6595 =C2=B1  7%   +3357.5%     228022        softirqs.CPU51.SCHED
>      98244 =C2=B1  5%    +342.9%     435162        softirqs.CPU51.TIMER
>       7538 =C2=B1  9%    +565.3%      50148 =C2=B1  4%  softirqs.CPU52.RCU
>       6455         +3434.5%     228162        softirqs.CPU52.SCHED
>      98820 =C2=B1  4%    +341.3%     436055        softirqs.CPU52.TIMER
>       7028 =C2=B1  4%    +619.2%      50546 =C2=B1  4%  softirqs.CPU53.RCU
>       6530 =C2=B1  5%   +3392.8%     228078        softirqs.CPU53.SCHED
>      97856 =C2=B1  5%    +346.1%     436499        softirqs.CPU53.TIMER
>       6929 =C2=B1  3%    +629.6%      50560 =C2=B1  3%  softirqs.CPU54.RCU
>       6406         +3455.7%     227777        softirqs.CPU54.SCHED
>      97665 =C2=B1  4%    +346.7%     436228        softirqs.CPU54.TIMER
>       7104 =C2=B1  6%    +615.5%      50833 =C2=B1  4%  softirqs.CPU55.RCU
>       6379 =C2=B1  5%   +3464.6%     227383        softirqs.CPU55.SCHED
>      97278 =C2=B1  4%    +346.7%     434568        softirqs.CPU55.TIMER
>       6955 =C2=B1  3%    +627.2%      50585 =C2=B1  4%  softirqs.CPU56.RCU
>       6370 =C2=B1  3%   +3476.0%     227801        softirqs.CPU56.SCHED
>      96732 =C2=B1  4%    +349.4%     434687        softirqs.CPU56.TIMER
>       6963 =C2=B1  3%    +631.1%      50905 =C2=B1  3%  softirqs.CPU57.RCU
>       6373 =C2=B1  4%   +3473.0%     227721        softirqs.CPU57.SCHED
>      97705 =C2=B1  4%    +347.7%     437407        softirqs.CPU57.TIMER
>       7079 =C2=B1  3%    +617.2%      50774 =C2=B1  4%  softirqs.CPU58.RCU
>       6424 =C2=B1  5%   +3445.4%     227761        softirqs.CPU58.SCHED
>      97781 =C2=B1  4%    +346.3%     436359        softirqs.CPU58.TIMER
>       7382 =C2=B1  7%    +591.5%      51049 =C2=B1  3%  softirqs.CPU59.RCU
>       6544 =C2=B1  7%   +3376.5%     227507        softirqs.CPU59.SCHED
>      98262 =C2=B1  3%    +344.8%     437045        softirqs.CPU59.TIMER
>       7175 =C2=B1  5%    +584.1%      49086 =C2=B1  2%  softirqs.CPU6.RCU
>       6472 =C2=B1  3%   +3366.1%     224348 =C2=B1  2%  softirqs.CPU6.SCH=
ED
>     101051 =C2=B1  3%    +321.3%     425698        softirqs.CPU6.TIMER
>       7315 =C2=B1  7%    +592.3%      50647 =C2=B1  3%  softirqs.CPU60.RCU
>       6485 =C2=B1  7%   +3401.6%     227109        softirqs.CPU60.SCHED
>      97330 =C2=B1  4%    +346.0%     434047        softirqs.CPU60.TIMER
>       7465 =C2=B1 12%    +576.8%      50527 =C2=B1  3%  softirqs.CPU61.RCU
>       6578 =C2=B1  9%   +3361.6%     227709        softirqs.CPU61.SCHED
>      97428 =C2=B1  4%    +344.7%     433258        softirqs.CPU61.TIMER
>       6926 =C2=B1  4%    +630.8%      50620 =C2=B1  3%  softirqs.CPU62.RCU
>       6312 =C2=B1  4%   +3493.6%     226839        softirqs.CPU62.SCHED
>      96940 =C2=B1  4%    +348.1%     434343        softirqs.CPU62.TIMER
>       7161 =C2=B1 11%    +602.8%      50324 =C2=B1  3%  softirqs.CPU63.RCU
>       6332 =C2=B1  3%   +3485.5%     227047        softirqs.CPU63.SCHED
>      98226 =C2=B1  5%    +343.4%     435530        softirqs.CPU63.TIMER
>       6726 =C2=B1  5%    +652.4%      50607 =C2=B1  3%  softirqs.CPU64.RCU
>       6255 =C2=B1  3%   +3535.2%     227381        softirqs.CPU64.SCHED
>      97065 =C2=B1  4%    +349.5%     436345        softirqs.CPU64.TIMER
>       6865 =C2=B1  5%    +643.8%      51063 =C2=B1  3%  softirqs.CPU65.RCU
>       6325 =C2=B1  2%   +3494.9%     227409        softirqs.CPU65.SCHED
>      97492 =C2=B1  4%    +348.0%     436734        softirqs.CPU65.TIMER
>       6885 =C2=B1  6%    +628.1%      50132 =C2=B1  3%  softirqs.CPU66.RCU
>       6329 =C2=B1  3%   +3486.2%     226977        softirqs.CPU66.SCHED
>      97197 =C2=B1  3%    +347.6%     435061        softirqs.CPU66.TIMER
>       6912 =C2=B1  5%    +634.2%      50753 =C2=B1  3%  softirqs.CPU67.RCU
>       6346 =C2=B1  3%   +3477.9%     227054        softirqs.CPU67.SCHED
>      96784 =C2=B1  4%    +349.2%     434753        softirqs.CPU67.TIMER
>       6798 =C2=B1  3%    +640.3%      50328 =C2=B1  3%  softirqs.CPU68.RCU
>       6381 =C2=B1  3%   +3452.1%     226657        softirqs.CPU68.SCHED
>      97515 =C2=B1  4%    +345.9%     434843        softirqs.CPU68.TIMER
>       7079 =C2=B1 13%    +613.2%      50490 =C2=B1  3%  softirqs.CPU69.RCU
>       6556 =C2=B1  8%   +3363.1%     227045        softirqs.CPU69.SCHED
>      98310 =C2=B1  5%    +342.2%     434742        softirqs.CPU69.TIMER
>       7294 =C2=B1  6%    +548.8%      47325        softirqs.CPU7.RCU
>       6834 =C2=B1  5%   +3201.7%     225645        softirqs.CPU7.SCHED
>     101337 =C2=B1  3%    +310.5%     415989        softirqs.CPU7.TIMER
>       6805 =C2=B1  3%    +645.4%      50724 =C2=B1  3%  softirqs.CPU70.RCU
>       6320 =C2=B1  3%   +3489.4%     226863        softirqs.CPU70.SCHED
>      97228 =C2=B1  4%    +347.4%     435042        softirqs.CPU70.TIMER
>       6642 =C2=B1  4%    +663.6%      50721 =C2=B1  3%  softirqs.CPU71.RCU
>       6293 =C2=B1  4%   +3495.2%     226251        softirqs.CPU71.SCHED
>      96904 =C2=B1  4%    +349.2%     435261        softirqs.CPU71.TIMER
>       6460 =C2=B1  4%    +637.1%      47617 =C2=B1  4%  softirqs.CPU72.RCU
>       6351         +3381.0%     221097 =C2=B1  2%  softirqs.CPU72.SCHED
>     104889 =C2=B1  4%    +326.1%     446985        softirqs.CPU72.TIMER
>       6363 =C2=B1  3%    +643.6%      47323 =C2=B1  4%  softirqs.CPU73.RCU
>       6332 =C2=B1  2%   +3426.3%     223309        softirqs.CPU73.SCHED
>     104771 =C2=B1  4%    +323.9%     444113        softirqs.CPU73.TIMER
>       6428 =C2=B1  3%    +636.7%      47361 =C2=B1  4%  softirqs.CPU74.RCU
>       6336 =C2=B1  2%   +3417.4%     222890        softirqs.CPU74.SCHED
>     104563 =C2=B1  4%    +324.8%     444230        softirqs.CPU74.TIMER
>       6436 =C2=B1  4%    +642.9%      47817 =C2=B1  4%  softirqs.CPU75.RCU
>       6296 =C2=B1  3%   +3382.8%     219297 =C2=B1  2%  softirqs.CPU75.SC=
HED
>     104371 =C2=B1  4%    +325.7%     444327        softirqs.CPU75.TIMER
>       6386 =C2=B1  4%    +647.1%      47714 =C2=B1  4%  softirqs.CPU76.RCU
>       6392         +3372.9%     222003        softirqs.CPU76.SCHED
>     105471 =C2=B1  4%    +322.4%     445519        softirqs.CPU76.TIMER
>       6428 =C2=B1  5%    +644.6%      47865 =C2=B1  3%  softirqs.CPU77.RCU
>       6425 =C2=B1  3%   +3371.4%     223048        softirqs.CPU77.SCHED
>     114990 =C2=B1 14%    +287.5%     445598        softirqs.CPU77.TIMER
>       6440 =C2=B1  4%    +639.6%      47629 =C2=B1  4%  softirqs.CPU78.RCU
>       6322 =C2=B1  4%   +3396.2%     221042 =C2=B1  2%  softirqs.CPU78.SC=
HED
>     105452 =C2=B1  4%    +322.7%     445722        softirqs.CPU78.TIMER
>       6359 =C2=B1  4%    +646.0%      47440 =C2=B1  4%  softirqs.CPU79.RCU
>       6368 =C2=B1  5%   +3381.2%     221696 =C2=B1  2%  softirqs.CPU79.SC=
HED
>     104396 =C2=B1  4%    +324.5%     443166        softirqs.CPU79.TIMER
>       7293 =C2=B1  3%    +569.7%      48844 =C2=B1  3%  softirqs.CPU8.RCU
>       6686         +3275.1%     225685        softirqs.CPU8.SCHED
>     100384 =C2=B1  3%    +321.2%     422864        softirqs.CPU8.TIMER
>       6579 =C2=B1  4%    +630.3%      48054 =C2=B1  5%  softirqs.CPU80.RCU
>       6396 =C2=B1  3%   +3348.0%     220562 =C2=B1  2%  softirqs.CPU80.SC=
HED
>     104171 =C2=B1  4%    +325.9%     443637        softirqs.CPU80.TIMER
>       6662 =C2=B1  4%    +631.1%      48712 =C2=B1  4%  softirqs.CPU81.RCU
>       6352 =C2=B1  4%   +3387.5%     221531        softirqs.CPU81.SCHED
>     104312 =C2=B1  4%    +326.0%     444323        softirqs.CPU81.TIMER
>       6691 =C2=B1  4%    +635.3%      49203 =C2=B1  4%  softirqs.CPU82.RCU
>       6369 =C2=B1  2%   +3387.2%     222101        softirqs.CPU82.SCHED
>     105396 =C2=B1  4%    +323.0%     445831        softirqs.CPU82.TIMER
>       6753 =C2=B1  3%    +620.7%      48672 =C2=B1  4%  softirqs.CPU83.RCU
>       6489 =C2=B1  3%   +3337.1%     223055        softirqs.CPU83.SCHED
>     105729 =C2=B1  4%    +321.4%     445580        softirqs.CPU83.TIMER
>       7256 =C2=B1  9%    +575.1%      48989 =C2=B1  5%  softirqs.CPU84.RCU
>       6495 =C2=B1  4%   +3326.3%     222544        softirqs.CPU84.SCHED
>     105878 =C2=B1  3%    +321.4%     446213        softirqs.CPU84.TIMER
>       6793 =C2=B1  4%    +610.5%      48266 =C2=B1  4%  softirqs.CPU85.RCU
>       6540 =C2=B1  5%   +3259.7%     219748 =C2=B1  2%  softirqs.CPU85.SC=
HED
>     104868 =C2=B1  3%    +323.8%     444401        softirqs.CPU85.TIMER
>       6688 =C2=B1  2%    +620.2%      48171 =C2=B1  4%  softirqs.CPU86.RCU
>       6498 =C2=B1  3%   +3317.5%     222095        softirqs.CPU86.SCHED
>     104923 =C2=B1  4%    +324.1%     444990        softirqs.CPU86.TIMER
>       6659 =C2=B1  3%    +626.0%      48352 =C2=B1  4%  softirqs.CPU87.RCU
>       6446 =C2=B1  3%   +3303.3%     219391 =C2=B1  2%  softirqs.CPU87.SC=
HED
>     105520 =C2=B1  4%    +320.2%     443394        softirqs.CPU87.TIMER
>       6825 =C2=B1  4%    +615.1%      48807 =C2=B1  4%  softirqs.CPU88.RCU
>       6465 =C2=B1  3%   +3329.8%     221762 =C2=B1  2%  softirqs.CPU88.SC=
HED
>     105637 =C2=B1  4%    +323.3%     447206        softirqs.CPU88.TIMER
>       6859 =C2=B1  3%    +616.4%      49144 =C2=B1  4%  softirqs.CPU89.RCU
>       6487 =C2=B1  3%   +3307.8%     221080 =C2=B1  2%  softirqs.CPU89.SC=
HED
>     105862 =C2=B1  4%    +322.1%     446884        softirqs.CPU89.TIMER
>       7315 =C2=B1  3%    +564.8%      48630 =C2=B1  3%  softirqs.CPU9.RCU
>       6685 =C2=B1  3%   +3272.1%     225430        softirqs.CPU9.SCHED
>     100197 =C2=B1  3%    +322.2%     423026        softirqs.CPU9.TIMER
>       6876 =C2=B1  3%    +609.2%      48769 =C2=B1  5%  softirqs.CPU90.RCU
>       6688 =C2=B1  7%   +3210.0%     221385 =C2=B1  2%  softirqs.CPU90.SC=
HED
>     105933 =C2=B1  4%    +321.2%     446184        softirqs.CPU90.TIMER
>       6784 =C2=B1  3%    +605.6%      47873 =C2=B1  4%  softirqs.CPU91.RCU
>       6522 =C2=B1  3%   +3277.9%     220329        softirqs.CPU91.SCHED
>     105335 =C2=B1  4%    +320.9%     443395        softirqs.CPU91.TIMER
>       6664 =C2=B1  2%    +628.9%      48571 =C2=B1  4%  softirqs.CPU92.RCU
>       6491 =C2=B1  3%   +3313.0%     221537        softirqs.CPU92.SCHED
>     104859 =C2=B1  4%    +323.9%     444549        softirqs.CPU92.TIMER
>       6604 =C2=B1  4%    +636.0%      48611 =C2=B1  4%  softirqs.CPU93.RCU
>       6342 =C2=B1  2%   +3377.7%     220552 =C2=B1  2%  softirqs.CPU93.SC=
HED
>     104615 =C2=B1  4%    +325.4%     445058        softirqs.CPU93.TIMER
>       6848 =C2=B1  3%    +621.1%      49385 =C2=B1  6%  softirqs.CPU94.RCU
>       6498 =C2=B1  2%   +3285.4%     220008 =C2=B1  2%  softirqs.CPU94.SC=
HED
>     105514 =C2=B1  4%    +324.6%     448032        softirqs.CPU94.TIMER
>       6771 =C2=B1  3%    +623.7%      49004 =C2=B1  5%  softirqs.CPU95.RCU
>       6479 =C2=B1  3%   +3296.6%     220064 =C2=B1  3%  softirqs.CPU95.SC=
HED
>     105599 =C2=B1  4%    +322.4%     446056        softirqs.CPU95.TIMER
>       6504 =C2=B1  7%    +636.1%      47882 =C2=B1  2%  softirqs.CPU96.RCU
>       6474 =C2=B1  6%   +3302.3%     220281 =C2=B1  2%  softirqs.CPU96.SC=
HED
>     100614 =C2=B1  4%    +316.0%     418582        softirqs.CPU96.TIMER
>       6817 =C2=B1  7%    +603.7%      47976 =C2=B1  3%  softirqs.CPU97.RCU
>       6566 =C2=B1  4%   +3272.2%     221420 =C2=B1  3%  softirqs.CPU97.SC=
HED
>      99626 =C2=B1  3%    +422.2%     520279 =C2=B1 26%  softirqs.CPU97.TI=
MER
>       6749 =C2=B1  7%    +614.6%      48233 =C2=B1  3%  softirqs.CPU98.RCU
>       6537 =C2=B1  5%   +3313.4%     223164        softirqs.CPU98.SCHED
>      99274 =C2=B1  3%    +324.3%     421202        softirqs.CPU98.TIMER
>       6844 =C2=B1  5%    +609.4%      48552 =C2=B1  2%  softirqs.CPU99.RCU
>       6574 =C2=B1  4%   +3281.6%     222311        softirqs.CPU99.SCHED
>      99999 =C2=B1  3%    +322.3%     422260        softirqs.CPU99.TIMER
>    1295575 =C2=B1  3%    +629.9%    9456430 =C2=B1  4%  softirqs.RCU
>    1246793 =C2=B1  2%   +3348.4%   42994311        softirqs.SCHED
>   19212474 =C2=B1  3%    +334.8%   83543543        softirqs.TIMER
>      98.65           -95.6        3.01 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.btrfs_file_write_iter.new_sync_write.vfs_write.ksys_write.do_sys=
call_64
>      98.72           -95.6        3.08 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      98.70           -95.6        3.07 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.write
>      98.60           -95.6        2.97 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.btrfs_buffered_write.btrfs_file_write_iter.new_sync_write.vfs_wr=
ite.ksys_write
>      98.66           -95.6        3.02 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>      98.74           -95.6        3.12 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.write
>      98.73           -95.6        3.11 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      98.76           -95.6        3.16 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.write
>      35.16           -35.2        0.00        perf-profile.calltrace.cycl=
es-pp.btrfs_inode_rsv_release.btrfs_buffered_write.btrfs_file_write_iter.ne=
w_sync_write.vfs_write
>      35.15           -35.2        0.00        perf-profile.calltrace.cycl=
es-pp.__btrfs_block_rsv_release.btrfs_inode_rsv_release.btrfs_buffered_writ=
e.btrfs_file_write_iter.new_sync_write
>      35.13           -35.1        0.00        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock.__btrfs_block_rsv_release.btrfs_inode_rsv_release.btrf=
s_buffered_write.btrfs_file_write_iter
>      35.04           -35.0        0.00        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__btrfs_block_rsv_rel=
ease.btrfs_inode_rsv_release.btrfs_buffered_write
>      35.08           -34.1        1.00 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.btrfs_reserve_me=
tadata_bytes.btrfs_delalloc_reserve_metadata.btrfs_buffered_write
>      35.16           -34.1        1.09 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.btrfs_reserve_metadata_bytes.btrfs_delalloc_reser=
ve_metadata.btrfs_buffered_write.btrfs_file_write_iter
>      35.36           -34.0        1.37 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.btrfs_reserve_metadata_bytes.btrfs_delalloc_reserve_metadata.btr=
fs_buffered_write.btrfs_file_write_iter.new_sync_write
>      35.47           -34.0        1.49 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.btrfs_delalloc_reserve_metadata.btrfs_buffered_write.btrfs_file_=
write_iter.new_sync_write.vfs_write
>      27.40           -27.4        0.00        perf-profile.calltrace.cycl=
es-pp.btrfs_dirty_pages.btrfs_buffered_write.btrfs_file_write_iter.new_sync=
_write.vfs_write
>      26.71           -26.7        0.00        perf-profile.calltrace.cycl=
es-pp.__clear_extent_bit.clear_extent_bit.btrfs_dirty_pages.btrfs_buffered_=
write.btrfs_file_write_iter
>      26.71           -26.7        0.00        perf-profile.calltrace.cycl=
es-pp.clear_extent_bit.btrfs_dirty_pages.btrfs_buffered_write.btrfs_file_wr=
ite_iter.new_sync_write
>      26.69           -26.7        0.00        perf-profile.calltrace.cycl=
es-pp.clear_state_bit.__clear_extent_bit.clear_extent_bit.btrfs_dirty_pages=
.btrfs_buffered_write
>      26.67           -26.7        0.00        perf-profile.calltrace.cycl=
es-pp.btrfs_clear_delalloc_extent.clear_state_bit.__clear_extent_bit.clear_=
extent_bit.btrfs_dirty_pages
>      26.56           -26.6        0.00        perf-profile.calltrace.cycl=
es-pp.btrfs_inode_rsv_release.btrfs_clear_delalloc_extent.clear_state_bit._=
_clear_extent_bit.clear_extent_bit
>      26.56           -26.6        0.00        perf-profile.calltrace.cycl=
es-pp.__btrfs_block_rsv_release.btrfs_inode_rsv_release.btrfs_clear_delallo=
c_extent.clear_state_bit.__clear_extent_bit
>      26.54           -26.5        0.00        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock.__btrfs_block_rsv_release.btrfs_inode_rsv_release.btrf=
s_clear_delalloc_extent.clear_state_bit
>      26.48           -26.5        0.00        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.__btrfs_block_rsv_rel=
ease.btrfs_inode_rsv_release.btrfs_clear_delalloc_extent
>       0.00            +0.6        0.58 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.cow_file_range.btrfs_run_delalloc_range.writepage_delalloc.__ext=
ent_writepage.extent_write_cache_pages
>       0.00            +0.6        0.60 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.btrfs_run_delalloc_range.writepage_delalloc.__extent_writepage.e=
xtent_write_cache_pages.extent_writepages
>       0.00            +0.6        0.62 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.btree_csum_one_bio.btree_submit_bio_hook.submit_one_bio.submit_e=
xtent_page.write_one_eb
>       0.00            +0.7        0.65 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.ktime_get.tick_nohz_irq_exit.irq_exit.smp_apic_timer_interrupt.a=
pic_timer_interrupt
>       0.00            +0.7        0.66 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.tick_nohz_irq_exit.irq_exit.smp_apic_timer_interrupt.apic_timer_=
interrupt.cpuidle_enter_state
>       0.00            +0.7        0.68 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.arch_stack_walk.stack_trace_save_tsk.__account_scheduler_latency=
.enqueue_entity.enqueue_task_fair
>       0.00            +0.7        0.70 =C2=B1 21%  perf-profile.calltrace=
.cycles-pp.__btrfs_free_extent.__btrfs_run_delayed_refs.btrfs_run_delayed_r=
efs.flush_space.btrfs_async_reclaim_metadata_space
>       0.00            +0.7        0.70 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.writepage_delalloc.__extent_writepage.extent_write_cache_pages.e=
xtent_writepages.do_writepages
>       0.00            +0.7        0.70 =C2=B1 23%  perf-profile.calltrace=
.cycles-pp.timekeeping_max_deferment.tick_nohz_next_event.tick_nohz_get_sle=
ep_length.menu_select.do_idle
>       0.00            +0.7        0.71        perf-profile.calltrace.cycl=
es-pp.brd_make_request.generic_make_request.submit_bio.run_scheduled_bios.n=
ormal_work_helper
>       0.00            +0.7        0.71 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.stack_trace_save_tsk.__account_scheduler_latency.enqueue_entity.=
enqueue_task_fair.activate_task
>       0.00            +0.7        0.72 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.submit_one_bio.submit_extent_page.write_one_eb.btree_write_cache=
_pages.do_writepages
>       0.00            +0.7        0.72 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.btree_submit_bio_hook.submit_one_bio.submit_extent_page.write_on=
e_eb.btree_write_cache_pages
>       0.00            +0.7        0.73 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.submit_extent_page.write_one_eb.btree_write_cache_pages.do_write=
pages.__filemap_fdatawrite_range
>       0.00            +0.7        0.74 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_=
up_common_lock.btrfs_unlock_up_safe
>       0.00            +0.8        0.76 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.generic_make_request.submit_bio.run_scheduled_bios.normal_work_h=
elper.process_one_work
>       0.00            +0.8        0.76 =C2=B1 29%  perf-profile.calltrace=
.cycles-pp.btrfs_insert_empty_items.alloc_reserved_file_extent.__btrfs_run_=
delayed_refs.btrfs_run_delayed_refs.flush_space
>       0.00            +0.8        0.77 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.submit_bio.run_scheduled_bios.normal_work_helper.process_one_wor=
k.worker_thread
>       0.00            +0.8        0.77 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.=
btrfs_unlock_up_safe.setup_items_for_insert
>       0.00            +0.8        0.78 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__wake_u=
p_common_lock.btrfs_unlock_up_safe.setup_items_for_insert
>       0.00            +0.8        0.78 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.__wake_up_common_lock.btrfs_unlock_up_saf=
e.setup_items_for_insert.__btrfs_drop_extents
>       0.00            +0.8        0.79 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.write_one_eb.btree_write_cache_pages.do_writepages.__filemap_fda=
tawrite_range.btrfs_write_marked_extents
>       0.00            +0.8        0.79 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_tra=
nsaction.flush_space.btrfs_async_reclaim_metadata_space
>       0.00            +0.8        0.79 =C2=B1 23%  perf-profile.calltrace=
.cycles-pp.tick_irq_enter.irq_enter.smp_apic_timer_interrupt.apic_timer_int=
errupt.cpuidle_enter_state
>       0.00            +0.8        0.79 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.btrfs_run_delayed_refs.btrfs_commit_transaction.flush_space.btrf=
s_async_reclaim_metadata_space.process_one_work
>       0.00            +0.8        0.80 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.btrfs_csu=
m_file_blocks.add_pending_csums
>       0.00            +0.8        0.80 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_csum_file_blocks.ad=
d_pending_csums.btrfs_finish_ordered_io
>       0.00            +0.8        0.82 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.run_scheduled_bios.normal_work_helper.process_one_work.worker_th=
read.kthread
>       0.00            +0.8        0.82 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.get_next_timer_interrupt.tick_nohz_next_event.tick_nohz_get_slee=
p_length.menu_select.do_idle
>       0.00            +0.8        0.83 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.__wake_up_common.__wake_up_common_lock.btrfs_unlock_up_safe.setu=
p_items_for_insert.__btrfs_drop_extents
>       0.00            +0.8        0.84 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.alloc_reserved_file_extent.__btrfs_run_delayed_refs.btrfs_run_de=
layed_refs.flush_space.priority_reclaim_metadata_space
>       0.00            +0.9        0.86 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.__extent_writepage.extent_write_cache_pages.extent_writepages.do=
_writepages.__writeback_single_inode
>       0.00            +0.9        0.88 =C2=B1 22%  perf-profile.calltrace=
.cycles-pp.irq_enter.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_=
enter_state.cpuidle_enter
>       0.00            +0.9        0.90 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.__btrfs_run_delayed_items.flush_space.priority_reclaim_metadata_=
space.btrfs_reserve_metadata_bytes.btrfs_block_rsv_refill
>       0.00            +0.9        0.91 =C2=B1 34%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_insert_empty_items.btrfs_csum_file_block=
s.add_pending_csums.btrfs_finish_ordered_io
>       0.00            +0.9        0.94 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_insert_empty_items.insert_reserved_file_=
extent.btrfs_finish_ordered_io.normal_work_helper
>       0.00            +0.9        0.94 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.act=
ivate_task.ttwu_do_activate
>       0.00            +1.0        0.96 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.btrfs_insert_empty_items.insert_reserved_file_extent.btrfs_finis=
h_ordered_io.normal_work_helper.process_one_work
>       0.00            +1.0        0.98 =C2=B1 34%  perf-profile.calltrace=
.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search_slot=
.btrfs_lookup_csum.btrfs_csum_file_blocks
>       0.00            +1.0        0.99 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.extent_write_cache_pages.extent_writepages.do_writepages.__write=
back_single_inode.writeback_sb_inodes
>       0.00            +1.0        1.00 =C2=B1 33%  perf-profile.calltrace=
.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_csum.bt=
rfs_csum_file_blocks.add_pending_csums
>       0.00            +1.0        1.00 =C2=B1 30%  perf-profile.calltrace=
.cycles-pp.btrfs_insert_empty_items.btrfs_csum_file_blocks.add_pending_csum=
s.btrfs_finish_ordered_io.normal_work_helper
>       0.00            +1.0        1.03 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.btrfs_commit_transaction.flush_space.priority_reclaim_metadata_s=
pace.btrfs_reserve_metadata_bytes.btrfs_block_rsv_refill
>       0.00            +1.1        1.11 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.finish_wait.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs=
_search_slot.btrfs_lookup_inode
>       0.00            +1.2        1.16 =C2=B1 17%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.finish_w=
ait.btrfs_tree_lock.btrfs_lock_root_node
>       0.00            +1.2        1.16 =C2=B1 19%  perf-profile.calltrace=
.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtime=
r_run_queues.hrtimer_interrupt
>       0.00            +1.2        1.17 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.btrfs_run_delayed_refs.flush_space.btrfs_async_reclaim_metadata_=
space.process_one_work.worker_thread
>       0.00            +1.2        1.17 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.flush_space.btrf=
s_async_reclaim_metadata_space.process_one_work
>       0.00            +1.2        1.18 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.finish_wait.btrfs_tree_lock.btrfs_lock_ro=
ot_node.btrfs_search_slot
>       0.00            +1.2        1.20 =C2=B1 26%  perf-profile.calltrace=
.cycles-pp.btrfs_write_and_wait_transaction.btrfs_commit_transaction.flush_=
space.btrfs_async_reclaim_metadata_space.process_one_work
>       0.00            +1.2        1.20 =C2=B1 26%  perf-profile.calltrace=
.cycles-pp.btrfs_write_marked_extents.btrfs_write_and_wait_transaction.btrf=
s_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
>       0.00            +1.2        1.20 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.=
sched_ttwu_pending
>       0.00            +1.2        1.20 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.finish_wait.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_sl=
ot.btrfs_lookup_file_extent
>       0.00            +1.2        1.21 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.extent_writepages.do_writepages.__writeback_single_inode.writeba=
ck_sb_inodes.wb_writeback
>       0.00            +1.2        1.21 =C2=B1 19%  perf-profile.calltrace=
.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_=
interrupt.smp_apic_timer_interrupt
>       0.00            +1.2        1.21 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.do_writepages.__writeback_single_inode.writeback_sb_inodes.wb_wr=
iteback.wb_workfn
>       0.00            +1.2        1.22 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.__writeback_single_inode.writeback_sb_inodes.wb_writeback.wb_wor=
kfn.process_one_work
>       0.00            +1.2        1.25 =C2=B1 28%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_lookup_csum.btrfs_csum_file_blocks.add_p=
ending_csums.btrfs_finish_ordered_io
>       0.00            +1.3        1.25 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.btrfs_lookup_csum.btrfs_csum_file_blocks.add_pending_csums.btrfs=
_finish_ordered_io.normal_work_helper
>       0.00            +1.3        1.26 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.sched_ttwu_pend=
ing.do_idle
>       0.00            +1.3        1.26 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.writeback_sb_inodes.wb_writeback.wb_workfn.process_one_work.work=
er_thread
>       0.00            +1.3        1.27 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.ttwu_do_activate.sched_ttwu_pending.do_idle.cpu_startup_entry.st=
art_secondary
>       0.00            +1.3        1.27 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.activate_task.ttwu_do_activate.sched_ttwu_pending.do_idle.cpu_st=
artup_entry
>       0.00            +1.3        1.28 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.wb_writeback.wb_workfn.process_one_work.worker_thread.kthread
>       0.00            +1.3        1.29 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.wb_workfn.process_one_work.worker_thread.kthread.ret_from_fork
>       0.00            +1.3        1.33 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.smp_apic_t=
imer_interrupt.apic_timer_interrupt
>       0.00            +1.4        1.38 =C2=B1 41%  perf-profile.calltrace=
.cycles-pp.do_writepages.__filemap_fdatawrite_range.btrfs_write_marked_exte=
nts.btrfs_write_and_wait_transaction.btrfs_commit_transaction
>       0.00            +1.4        1.38 =C2=B1 41%  perf-profile.calltrace=
.cycles-pp.btree_write_cache_pages.do_writepages.__filemap_fdatawrite_range=
.btrfs_write_marked_extents.btrfs_write_and_wait_transaction
>       0.00            +1.4        1.38 =C2=B1 41%  perf-profile.calltrace=
.cycles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_writ=
e_and_wait_transaction.btrfs_commit_transaction.flush_space
>       0.00            +1.4        1.43 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.__softirqentry_text_start.irq_exit.smp_apic_timer_interrupt.apic=
_timer_interrupt.cpuidle_enter_state
>       0.00            +1.5        1.47 =C2=B1 39%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_del_csums.__btrfs_free_extent.__btrfs_ru=
n_delayed_refs.btrfs_run_delayed_refs
>       0.00            +1.5        1.48 =C2=B1 25%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_csum_file_blocks.add_pending_csums.btrfs=
_finish_ordered_io.normal_work_helper
>       0.00            +1.6        1.57 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.sched_ttwu_pending.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64
>       0.00            +1.6        1.62 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__wake_up_common_lock.btrfs_unlock_up_safe.setup_items_for_inser=
t.__btrfs_drop_extents.insert_reserved_file_extent
>       0.00            +1.7        1.65 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.btrfs_unlock_up_safe.setup_items_for_insert.__btrfs_drop_extents=
.insert_reserved_file_extent.btrfs_finish_ordered_io
>       0.00            +1.7        1.66 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.finish_wait.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs=
_search_slot.btrfs_lookup_file_extent
>       0.00            +1.7        1.68 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.smp_apic=
_timer_interrupt.apic_timer_interrupt
>       0.00            +1.8        1.78 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.prepare_to_wait_event.btrfs_tree_read_lock.btrfs_read_lock_root_=
node.btrfs_search_slot.btrfs_lookup_inode
>       0.00            +1.8        1.80 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.clockevents_program_event.hrtimer_interrupt.smp_apic_timer_inter=
rupt.apic_timer_interrupt.cpuidle_enter_state
>       0.00            +1.9        1.87 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.setup_items_for_insert.__btrfs_drop_extents.insert_reserved_file=
_extent.btrfs_finish_ordered_io.normal_work_helper
>       0.00            +1.9        1.89 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select.do_i=
dle.cpu_startup_entry
>       0.00            +1.9        1.95 =C2=B1 24%  perf-profile.calltrace=
.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_=
entry
>       0.00            +2.2        2.19 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_entry=
.start_secondary
>       0.00            +2.3        2.31 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_=
to_wait_event.btrfs_tree_lock.btrfs_lock_root_node
>       0.00            +2.3        2.32 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.irq_exit.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_e=
nter_state.cpuidle_enter
>       0.00            +2.3        2.32 =C2=B1 45%  perf-profile.calltrace=
.cycles-pp.btrfs_del_csums.__btrfs_free_extent.__btrfs_run_delayed_refs.btr=
fs_run_delayed_refs.flush_space
>       0.00            +2.4        2.36 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.btrfs_tree_lock.btr=
fs_lock_root_node.btrfs_search_slot
>       0.00            +2.4        2.37 =C2=B1 24%  perf-profile.calltrace=
.cycles-pp.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadat=
a_space.process_one_work.worker_thread
>       0.00            +2.5        2.47 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.prepare_to_wait_event.btrfs_tree_lock.btrfs_lock_root_node.btrfs=
_search_slot.btrfs_lookup_file_extent
>       0.00            +2.6        2.58 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.smp_apic_timer_interrupt.=
apic_timer_interrupt.cpuidle_enter_state
>       0.00            +2.7        2.69 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.finish_w=
ait.btrfs_tree_read_lock.btrfs_read_lock_root_node
>       0.00            +2.7        2.72 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.finish_wait.btrfs_tree_read_lock.btrfs_re=
ad_lock_root_node.btrfs_search_slot
>       0.00            +3.0        3.05 =C2=B1 33%  perf-profile.calltrace=
.cycles-pp.__btrfs_free_extent.__btrfs_run_delayed_refs.btrfs_run_delayed_r=
efs.flush_space.priority_reclaim_metadata_space
>       0.00            +3.2        3.23 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search_slot=
.btrfs_lookup_inode.__btrfs_update_delayed_inode
>       0.00            +3.3        3.26 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_inode._=
_btrfs_update_delayed_inode.btrfs_async_run_delayed_root
>       0.00            +3.5        3.47 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.menu_select.do_idle.cpu_startup_entry.start_secondary.secondary_=
startup_64
>       0.00            +3.5        3.47 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_lookup_inode.__btrfs_update_delayed_inod=
e.btrfs_async_run_delayed_root.normal_work_helper
>       0.00            +3.5        3.47 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.btrfs_lookup_inode.__btrfs_update_delayed_inode.btrfs_async_run_=
delayed_root.normal_work_helper.process_one_work
>       0.00            +3.5        3.52 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.prepare_to_wait_event.btrfs_tree_read_lock.btrfs_read_lock_root_=
node.btrfs_search_slot.btrfs_lookup_file_extent
>       0.00            +3.7        3.74 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.flush_space.btrfs_async_reclaim_metadata_space.process_one_work.=
worker_thread.kthread
>       0.00            +3.8        3.83 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.btrfs_async_reclaim_metadata_space.process_one_work.worker_threa=
d.kthread.ret_from_fork
>       0.00            +3.9        3.86 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.__btrfs_update_delayed_inode.btrfs_async_run_delayed_root.normal=
_work_helper.process_one_work.worker_thread
>       0.00            +4.2        4.21 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.btrfs_async_run_delayed_root.normal_work_helper.process_one_work=
.worker_thread.kthread
>       0.00            +4.2        4.21 =C2=B1 24%  perf-profile.calltrace=
.cycles-pp.btrfs_csum_file_blocks.add_pending_csums.btrfs_finish_ordered_io=
.normal_work_helper.process_one_work
>       0.00            +4.2        4.22 =C2=B1 24%  perf-profile.calltrace=
.cycles-pp.add_pending_csums.btrfs_finish_ordered_io.normal_work_helper.pro=
cess_one_work.worker_thread
>       0.00            +4.4        4.37 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.btrfs_loo=
kup_file_extent.__btrfs_drop_extents
>       0.00            +4.4        4.38 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_lookup_file_extent.=
__btrfs_drop_extents.insert_reserved_file_extent
>       0.00            +4.8        4.84 =C2=B1 28%  perf-profile.calltrace=
.cycles-pp.btrfs_run_delayed_refs.flush_space.priority_reclaim_metadata_spa=
ce.btrfs_reserve_metadata_bytes.btrfs_block_rsv_refill
>       0.00            +4.8        4.84 =C2=B1 28%  perf-profile.calltrace=
.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.flush_space.prio=
rity_reclaim_metadata_space.btrfs_reserve_metadata_bytes
>       0.00            +5.1        5.07 =C2=B1 15%  perf-profile.calltrace=
.cycles-pp.hrtimer_interrupt.smp_apic_timer_interrupt.apic_timer_interrupt.=
cpuidle_enter_state.cpuidle_enter
>       0.00            +5.2        5.22 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_=
to_wait_event.btrfs_tree_read_lock.btrfs_read_lock_root_node
>       0.00            +5.3        5.31 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.btrfs_tree_read_loc=
k.btrfs_read_lock_root_node.btrfs_search_slot
>       0.00            +5.8        5.77 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search_slot=
.btrfs_lookup_file_extent.__btrfs_drop_extents
>       0.00            +5.8        5.79 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_file_ex=
tent.__btrfs_drop_extents.insert_reserved_file_extent
>       0.00            +6.8        6.80 =C2=B1 17%  perf-profile.calltrace=
.cycles-pp.flush_space.priority_reclaim_metadata_space.btrfs_reserve_metada=
ta_bytes.btrfs_block_rsv_refill.evict_refill_and_join
>       0.00            +7.1        7.09 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.priority_reclaim_metadata_space.btrfs_reserve_metadata_bytes.btr=
fs_block_rsv_refill.evict_refill_and_join.btrfs_evict_inode
>       0.00            +7.2        7.18 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.btrfs_reserve_metadata_bytes.btrfs_block_rsv_refill.evict_refill=
_and_join.btrfs_evict_inode.evict
>       0.00            +7.2        7.18 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.btrfs_block_rsv_refill.evict_refill_and_join.btrfs_evict_inode.e=
vict.__dentry_kill
>       0.00            +7.2        7.19 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.evict_refill_and_join.btrfs_evict_inode.evict.__dentry_kill.dput
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.close
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.close
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.close
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.task_work_run.exit_to_usermode_loop.do_syscall_64.entry_SYSCALL_=
64_after_hwframe.close
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.__fput.task_work_run.exit_to_usermode_loop.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.dput.__fput.task_work_run.exit_to_usermode_loop.do_syscall_64
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.__dentry_kill.dput.__fput.task_work_run.exit_to_usermode_loop
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.evict.__dentry_kill.dput.__fput.task_work_run
>       0.00            +7.4        7.43 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.btrfs_evict_inode.evict.__dentry_kill.dput.__fput
>       0.00            +7.5        7.47 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.close
>       0.00            +8.4        8.40 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter_stat=
e.cpuidle_enter.do_idle
>       0.00            +9.8        9.78 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_idle.c=
pu_startup_entry
>       0.00           +10.9       10.92 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_lookup_file_extent.__btrfs_drop_extents.=
insert_reserved_file_extent.btrfs_finish_ordered_io
>       0.00           +10.9       10.92 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.btrfs_lookup_file_extent.__btrfs_drop_extents.insert_reserved_fi=
le_extent.btrfs_finish_ordered_io.normal_work_helper
>       0.00           +13.4       13.43 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.__btrfs_drop_extents.insert_reserved_file_extent.btrfs_finish_or=
dered_io.normal_work_helper.process_one_work
>       0.00           +14.6       14.65 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.insert_reserved_file_extent.btrfs_finish_ordered_io.normal_work_=
helper.process_one_work.worker_thread
>       0.00           +19.6       19.62 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.btrfs_finish_ordered_io.normal_work_helper.process_one_work.work=
er_thread.kthread
>       0.00           +25.0       24.98 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.normal_work_helper.process_one_work.worker_thread.kthread.ret_fr=
om_fork
>       0.00           +30.3       30.29 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
>       0.00           +30.6       30.56 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.worker_thread.kthread.ret_from_fork
>       0.00           +30.6       30.58 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.ret_from_fork
>       0.00           +30.6       30.58 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.kthread.ret_from_fork
>       0.00           +38.7       38.68 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup=
_entry
>       0.00           +50.1       50.13 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.star=
t_secondary
>       0.00           +50.8       50.83 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondar=
y_startup_64
>       0.00           +57.7       57.68 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>       0.00           +57.7       57.70 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>       0.00           +57.7       57.71 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64
>       0.00           +58.0       58.03 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.secondary_startup_64
>      98.65           -95.6        3.01 =C2=B1  2%  perf-profile.children.=
cycles-pp.btrfs_file_write_iter
>      98.67           -95.6        3.03 =C2=B1  2%  perf-profile.children.=
cycles-pp.new_sync_write
>      98.73           -95.6        3.09 =C2=B1  2%  perf-profile.children.=
cycles-pp.ksys_write
>      98.60           -95.6        2.97 =C2=B1  2%  perf-profile.children.=
cycles-pp.btrfs_buffered_write
>      98.71           -95.6        3.08 =C2=B1  2%  perf-profile.children.=
cycles-pp.vfs_write
>      98.77           -95.6        3.18 =C2=B1  2%  perf-profile.children.=
cycles-pp.write
>      97.56           -93.5        4.03 =C2=B1  5%  perf-profile.children.=
cycles-pp._raw_spin_lock
>      99.72           -89.0       10.71 =C2=B1 12%  perf-profile.children.=
cycles-pp.do_syscall_64
>      99.72           -89.0       10.71 =C2=B1 12%  perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
>      97.49           -76.2       21.31 =C2=B1 15%  perf-profile.children.=
cycles-pp.native_queued_spin_lock_slowpath
>      61.76           -61.6        0.18 =C2=B1 16%  perf-profile.children.=
cycles-pp.btrfs_inode_rsv_release
>      62.00           -60.7        1.29 =C2=B1  3%  perf-profile.children.=
cycles-pp.__btrfs_block_rsv_release
>      35.47           -34.0        1.50 =C2=B1  5%  perf-profile.children.=
cycles-pp.btrfs_delalloc_reserve_metadata
>      27.40           -26.9        0.46 =C2=B1  3%  perf-profile.children.=
cycles-pp.btrfs_dirty_pages
>      35.50           -26.9        8.64 =C2=B1 16%  perf-profile.children.=
cycles-pp.btrfs_reserve_metadata_bytes
>      26.72           -26.7        0.02 =C2=B1141%  perf-profile.children.=
cycles-pp.btrfs_clear_delalloc_extent
>      26.74           -26.7        0.09 =C2=B1  9%  perf-profile.children.=
cycles-pp.clear_extent_bit
>      26.75           -26.6        0.13 =C2=B1  3%  perf-profile.children.=
cycles-pp.clear_state_bit
>      26.80           -26.6        0.23 =C2=B1  4%  perf-profile.children.=
cycles-pp.__clear_extent_bit
>       0.58 =C2=B1 10%      -0.4        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_get_extent
>       0.14 =C2=B1  3%      -0.1        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.can_overcommit
>       0.14 =C2=B1 18%      -0.1        0.05        perf-profile.children.=
cycles-pp.update_cfs_group
>       0.14 =C2=B1  3%      -0.1        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__btrfs_end_transaction
>       0.10            -0.0        0.09 =C2=B1  5%  perf-profile.children.=
cycles-pp.extent_read_full_page
>       0.08            -0.0        0.07 =C2=B1  7%  perf-profile.children.=
cycles-pp.__do_readpage
>       0.05            +0.0        0.08 =C2=B1 10%  perf-profile.children.=
cycles-pp.lock_and_cleanup_extent_if_need
>       0.07 =C2=B1  7%      +0.0        0.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.alloc_extent_state
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.insert_state
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.mark_extent_buffer_accessed
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.tick_nohz_idle_enter
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_write_out_cache
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.__btrfs_write_out_cache
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.rcu_irq_exit
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.igrab
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.select_idle_sibling
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.available_idle_cpu
>       0.00            +0.1        0.06 =C2=B1 16%  perf-profile.children.=
cycles-pp.run_one_async_start
>       0.00            +0.1        0.06 =C2=B1 16%  perf-profile.children.=
cycles-pp.btrfs_submit_bio_start
>       0.00            +0.1        0.06 =C2=B1 16%  perf-profile.children.=
cycles-pp.btrfs_csum_one_bio
>       0.00            +0.1        0.06 =C2=B1 16%  perf-profile.children.=
cycles-pp.__btrfs_map_block
>       0.00            +0.1        0.06 =C2=B1 13%  perf-profile.children.=
cycles-pp.free_extent_map
>       0.00            +0.1        0.06 =C2=B1 13%  perf-profile.children.=
cycles-pp.find_delalloc_range
>       0.00            +0.1        0.06 =C2=B1 19%  perf-profile.children.=
cycles-pp.tick_nohz_tick_stopped
>       0.00            +0.1        0.06 =C2=B1 14%  perf-profile.children.=
cycles-pp.create_io_em
>       0.00            +0.1        0.06 =C2=B1 14%  perf-profile.children.=
cycles-pp.alloc_extent_buffer
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.account_page_dirtied
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.verify_parent_transid
>       0.00            +0.1        0.07 =C2=B1 18%  perf-profile.children.=
cycles-pp.__push_leaf_right
>       0.00            +0.1        0.07 =C2=B1  7%  perf-profile.children.=
cycles-pp.update_cfs_rq_h_load
>       0.00            +0.1        0.07 =C2=B1  7%  perf-profile.children.=
cycles-pp.btrfs_set_range_writeback
>       0.04 =C2=B1 50%      +0.1        0.11 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.btrfs_set_extent_delalloc
>       0.00            +0.1        0.07 =C2=B1 20%  perf-profile.children.=
cycles-pp.rcu_irq_enter
>       0.00            +0.1        0.07 =C2=B1 20%  perf-profile.children.=
cycles-pp.btrfs_next_delayed_node
>       0.00            +0.1        0.07 =C2=B1 11%  perf-profile.children.=
cycles-pp.trigger_load_balance
>       0.00            +0.1        0.07 =C2=B1 44%  perf-profile.children.=
cycles-pp.io_serial_in
>       0.00            +0.1        0.07 =C2=B1 35%  perf-profile.children.=
cycles-pp.btrfs_add_delayed_tree_ref
>       0.00            +0.1        0.07 =C2=B1 25%  perf-profile.children.=
cycles-pp.ksys_read
>       0.00            +0.1        0.07 =C2=B1 25%  perf-profile.children.=
cycles-pp.vfs_read
>       0.00            +0.1        0.07 =C2=B1 17%  perf-profile.children.=
cycles-pp.menu_reflect
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.children.=
cycles-pp.mutex_unlock
>       0.00            +0.1        0.08 =C2=B1 16%  perf-profile.children.=
cycles-pp.xas_load
>       0.00            +0.1        0.08 =C2=B1 24%  perf-profile.children.=
cycles-pp.switch_mm_irqs_off
>       0.00            +0.1        0.08 =C2=B1  6%  perf-profile.children.=
cycles-pp.copy_pages
>       0.00            +0.1        0.08 =C2=B1  6%  perf-profile.children.=
cycles-pp.__mark_inode_dirty
>       0.00            +0.1        0.08 =C2=B1  6%  perf-profile.children.=
cycles-pp.btrfs_buffer_uptodate
>       0.00            +0.1        0.08 =C2=B1 27%  perf-profile.children.=
cycles-pp.__x86_indirect_thunk_rax
>       0.00            +0.1        0.08 =C2=B1 17%  perf-profile.children.=
cycles-pp.call_cpuidle
>       0.00            +0.1        0.08 =C2=B1 17%  perf-profile.children.=
cycles-pp.btrfs_comp_cpu_keys
>       0.00            +0.1        0.08 =C2=B1 10%  perf-profile.children.=
cycles-pp.__test_set_page_writeback
>       0.00            +0.1        0.08        perf-profile.children.cycle=
s-pp.__update_load_avg_se
>       0.00            +0.1        0.08 =C2=B1 24%  perf-profile.children.=
cycles-pp.timerqueue_del
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children.=
cycles-pp.cpuacct_charge
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children.=
cycles-pp.find_get_entry
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children.=
cycles-pp.percpu_counter_add_batch
>       0.00            +0.1        0.08 =C2=B1 11%  perf-profile.children.=
cycles-pp.merge_state
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children.=
cycles-pp.stack_trace_consume_entry_nosched
>       0.00            +0.1        0.08 =C2=B1 14%  perf-profile.children.=
cycles-pp.btrfs_delayed_refs_rsv_refill
>       0.20            +0.1        0.29        perf-profile.children.cycle=
s-pp.prepare_pages
>       0.00            +0.1        0.09 =C2=B1 19%  perf-profile.children.=
cycles-pp.interrupt_entry
>       0.00            +0.1        0.09 =C2=B1 10%  perf-profile.children.=
cycles-pp.find_lock_delalloc_range
>       0.00            +0.1        0.09 =C2=B1 10%  perf-profile.children.=
cycles-pp.btrfs_add_ordered_extent
>       0.00            +0.1        0.09 =C2=B1 10%  perf-profile.children.=
cycles-pp.__btrfs_add_ordered_extent
>       0.00            +0.1        0.09 =C2=B1 24%  perf-profile.children.=
cycles-pp.rb_next
>       0.00            +0.1        0.09 =C2=B1 18%  perf-profile.children.=
cycles-pp.check_preempt_curr
>       0.00            +0.1        0.09 =C2=B1  9%  perf-profile.children.=
cycles-pp.extent_clear_unlock_delalloc
>       0.00            +0.1        0.09 =C2=B1  9%  perf-profile.children.=
cycles-pp.btrfs_leaf_free_space
>       0.00            +0.1        0.09 =C2=B1 43%  perf-profile.children.=
cycles-pp.irq_work_interrupt
>       0.00            +0.1        0.09 =C2=B1 43%  perf-profile.children.=
cycles-pp.smp_irq_work_interrupt
>       0.00            +0.1        0.09 =C2=B1 43%  perf-profile.children.=
cycles-pp.irq_work_run
>       0.00            +0.1        0.09 =C2=B1 43%  perf-profile.children.=
cycles-pp.printk
>       0.00            +0.1        0.09 =C2=B1 43%  perf-profile.children.=
cycles-pp.vprintk_emit
>       0.00            +0.1        0.09 =C2=B1 13%  perf-profile.children.=
cycles-pp.idle_cpu
>       0.00            +0.1        0.09 =C2=B1 13%  perf-profile.children.=
cycles-pp.get_extent_allocation_hint
>       0.00            +0.1        0.09 =C2=B1 10%  perf-profile.children.=
cycles-pp.leaf_space_used
>       0.00            +0.1        0.09 =C2=B1 13%  perf-profile.children.=
cycles-pp.btrfs_set_delalloc_extent
>       0.05 =C2=B1  7%      +0.1        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.lock_extent_bits
>       0.00            +0.1        0.10 =C2=B1  9%  perf-profile.children.=
cycles-pp.btrfs_tree_read_unlock
>       0.00            +0.1        0.10 =C2=B1 12%  perf-profile.children.=
cycles-pp.btrfs_tree_unlock
>       0.09 =C2=B1  5%      +0.1        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.pagecache_get_page
>       0.00            +0.1        0.10 =C2=B1 42%  perf-profile.children.=
cycles-pp.uart_console_write
>       0.00            +0.1        0.10 =C2=B1 42%  perf-profile.children.=
cycles-pp.wait_for_xmitr
>       0.00            +0.1        0.10 =C2=B1 42%  perf-profile.children.=
cycles-pp.serial8250_console_putchar
>       0.00            +0.1        0.10 =C2=B1 29%  perf-profile.children.=
cycles-pp.__remove_hrtimer
>       0.00            +0.1        0.10        perf-profile.children.cycle=
s-pp.block_group_cache_tree_search
>       0.00            +0.1        0.10 =C2=B1  8%  perf-profile.children.=
cycles-pp.unpin_extent_cache
>       0.00            +0.1        0.10 =C2=B1 16%  perf-profile.children.=
cycles-pp.newidle_balance
>       0.00            +0.1        0.10 =C2=B1 45%  perf-profile.children.=
cycles-pp.serial8250_console_write
>       0.00            +0.1        0.10 =C2=B1 19%  perf-profile.children.=
cycles-pp.rb_insert_color
>       0.00            +0.1        0.10 =C2=B1  4%  perf-profile.children.=
cycles-pp.rcu_eqs_enter
>       0.00            +0.1        0.11 =C2=B1 11%  perf-profile.children.=
cycles-pp.__slab_free
>       0.00            +0.1        0.11 =C2=B1 42%  perf-profile.children.=
cycles-pp.console_unlock
>       0.00            +0.1        0.11 =C2=B1 38%  perf-profile.children.=
cycles-pp.timerqueue_add
>       0.00            +0.1        0.11 =C2=B1  8%  perf-profile.children.=
cycles-pp.find_ref_head
>       0.00            +0.1        0.11 =C2=B1  7%  perf-profile.children.=
cycles-pp.set_extent_buffer_dirty
>       0.00            +0.1        0.11 =C2=B1  7%  perf-profile.children.=
cycles-pp.btrfs_drop_extent_cache
>       0.00            +0.1        0.11 =C2=B1 12%  perf-profile.children.=
cycles-pp.__radix_tree_lookup
>       0.00            +0.1        0.11 =C2=B1 14%  perf-profile.children.=
cycles-pp.push_leaf_right
>       0.00            +0.1        0.11 =C2=B1  8%  perf-profile.children.=
cycles-pp.truncate_one_csum
>       0.00            +0.1        0.11 =C2=B1 11%  perf-profile.children.=
cycles-pp.set_state_bits
>       0.00            +0.1        0.12 =C2=B1 17%  perf-profile.children.=
cycles-pp.ttwu_do_wakeup
>       0.00            +0.1        0.12 =C2=B1  4%  perf-profile.children.=
cycles-pp.__module_text_address
>       0.00            +0.1        0.12 =C2=B1 44%  perf-profile.children.=
cycles-pp.irq_work_run_list
>       0.00            +0.1        0.12 =C2=B1 24%  perf-profile.children.=
cycles-pp.tick_check_oneshot_broadcast_this_cpu
>       0.00            +0.1        0.12 =C2=B1  6%  perf-profile.children.=
cycles-pp.rb_erase
>       0.00            +0.1        0.12 =C2=B1  6%  perf-profile.children.=
cycles-pp.mutex_lock
>       0.00            +0.1        0.12 =C2=B1  6%  perf-profile.children.=
cycles-pp.rcu_dynticks_eqs_exit
>       0.00            +0.1        0.12 =C2=B1  6%  perf-profile.children.=
cycles-pp.btrfs_delete_ref_head
>       0.00            +0.1        0.12 =C2=B1 36%  perf-profile.children.=
cycles-pp.enqueue_hrtimer
>       0.00            +0.1        0.12 =C2=B1  3%  perf-profile.children.=
cycles-pp.btrfs_select_ref_head
>       0.00            +0.1        0.13 =C2=B1  9%  perf-profile.children.=
cycles-pp.rcu_eqs_exit
>       0.00            +0.1        0.13 =C2=B1  3%  perf-profile.children.=
cycles-pp.__extent_writepage_io
>       0.00            +0.1        0.13 =C2=B1  6%  perf-profile.children.=
cycles-pp.end_page_writeback
>       0.00            +0.1        0.13 =C2=B1  6%  perf-profile.children.=
cycles-pp.test_clear_page_writeback
>       0.00            +0.1        0.13        perf-profile.children.cycle=
s-pp.__unwind_start
>       0.00            +0.1        0.13 =C2=B1  6%  perf-profile.children.=
cycles-pp.is_module_text_address
>       0.00            +0.1        0.13 =C2=B1 18%  perf-profile.children.=
cycles-pp.btrfs_start_dirty_block_groups
>       0.00            +0.1        0.13 =C2=B1  3%  perf-profile.children.=
cycles-pp.__switch_to
>       0.00            +0.1        0.14 =C2=B1 12%  perf-profile.children.=
cycles-pp.hrtimer_get_next_event
>       0.00            +0.1        0.14 =C2=B1 17%  perf-profile.children.=
cycles-pp.note_gp_changes
>       0.00            +0.1        0.14 =C2=B1  5%  perf-profile.children.=
cycles-pp.btrfs_mark_buffer_dirty
>       0.06 =C2=B1  6%      +0.1        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       0.00            +0.1        0.14 =C2=B1  6%  perf-profile.children.=
cycles-pp.__switch_to_asm
>       0.00            +0.1        0.15 =C2=B1 25%  perf-profile.children.=
cycles-pp.calc_global_load_tick
>       0.00            +0.1        0.15 =C2=B1  3%  perf-profile.children.=
cycles-pp.set_next_entity
>       0.00            +0.1        0.15 =C2=B1  6%  perf-profile.children.=
cycles-pp.___might_sleep
>       0.00            +0.1        0.15 =C2=B1  3%  perf-profile.children.=
cycles-pp.__etree_search
>       0.00            +0.1        0.15 =C2=B1 14%  perf-profile.children.=
cycles-pp.__intel_pmu_enable_all
>       0.00            +0.1        0.15 =C2=B1 14%  perf-profile.children.=
cycles-pp.split_leaf
>       0.00            +0.2        0.15 =C2=B1  5%  perf-profile.children.=
cycles-pp.btrfs_delayed_update_inode
>       0.26 =C2=B1 12%      +0.2        0.41 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.00            +0.2        0.15 =C2=B1  3%  perf-profile.children.=
cycles-pp.__update_load_avg_cfs_rq
>       0.00            +0.2        0.16 =C2=B1 28%  perf-profile.children.=
cycles-pp.run_timer_softirq
>       0.00            +0.2        0.16 =C2=B1  7%  perf-profile.children.=
cycles-pp.cpuidle_governor_latency_req
>       0.00            +0.2        0.16 =C2=B1 20%  perf-profile.children.=
cycles-pp.read_extent_buffer
>       0.00            +0.2        0.16 =C2=B1  8%  perf-profile.children.=
cycles-pp.tsc_verify_tsc_adjust
>       0.00            +0.2        0.16 =C2=B1 10%  perf-profile.children.=
cycles-pp.arch_cpu_idle_enter
>       0.00            +0.2        0.16 =C2=B1 11%  perf-profile.children.=
cycles-pp.tick_nohz_idle_exit
>       0.00            +0.2        0.17 =C2=B1  9%  perf-profile.children.=
cycles-pp.update_curr
>       0.00            +0.2        0.17 =C2=B1  4%  perf-profile.children.=
cycles-pp.kmem_cache_free
>       0.00            +0.2        0.17 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_update_inode_fallback
>       0.00            +0.2        0.17 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_update_inode
>       0.00            +0.2        0.17 =C2=B1  7%  perf-profile.children.=
cycles-pp.find_next_zero_bit
>       0.00            +0.2        0.17 =C2=B1 10%  perf-profile.children.=
cycles-pp.btrfs_free_extent
>       0.00            +0.2        0.18 =C2=B1  2%  perf-profile.children.=
cycles-pp._raw_write_lock
>       0.00            +0.2        0.18 =C2=B1  7%  perf-profile.children.=
cycles-pp.run_one_async_done
>       0.00            +0.2        0.18 =C2=B1 19%  perf-profile.children.=
cycles-pp.btrfs_remove_ordered_extent
>       0.00            +0.2        0.18 =C2=B1  6%  perf-profile.children.=
cycles-pp.nr_iowait_cpu
>       0.00            +0.2        0.18 =C2=B1  5%  perf-profile.children.=
cycles-pp.btrfs_alloc_reserved_file_extent
>       0.00            +0.2        0.19 =C2=B1 11%  perf-profile.children.=
cycles-pp.update_ts_time_stats
>       0.00            +0.2        0.19 =C2=B1 24%  perf-profile.children.=
cycles-pp.btrfs_get_8
>       0.00            +0.2        0.19 =C2=B1  2%  perf-profile.children.=
cycles-pp.kernel_text_address
>       0.00            +0.2        0.19 =C2=B1 10%  perf-profile.children.=
cycles-pp.btrfs_root_node
>       0.00            +0.2        0.19 =C2=B1  4%  perf-profile.children.=
cycles-pp.__set_page_dirty_nobuffers
>       0.00            +0.2        0.19 =C2=B1 18%  perf-profile.children.=
cycles-pp.btrfs_truncate_inode_items
>       0.00            +0.2        0.19 =C2=B1  6%  perf-profile.children.=
cycles-pp.find_free_extent
>       0.00            +0.2        0.20 =C2=B1  2%  perf-profile.children.=
cycles-pp.__module_address
>       0.00            +0.2        0.20        perf-profile.children.cycle=
s-pp.__kernel_text_address
>       0.07            +0.2        0.28 =C2=B1  7%  perf-profile.children.=
cycles-pp.set_extent_bit
>       0.00            +0.2        0.21 =C2=B1  9%  perf-profile.children.=
cycles-pp.rcu_idle_exit
>       0.00            +0.2        0.21 =C2=B1 11%  perf-profile.children.=
cycles-pp.update_rq_clock
>       0.00            +0.2        0.21 =C2=B1  3%  perf-profile.children.=
cycles-pp.memcpy_extent_buffer
>       0.00            +0.2        0.21 =C2=B1  6%  perf-profile.children.=
cycles-pp.btrfs_reserve_extent
>       0.00            +0.2        0.21 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_wq_submit_bio
>       0.00            +0.2        0.22 =C2=B1  9%  perf-profile.children.=
cycles-pp.add_delayed_ref_head
>       0.00            +0.2        0.22 =C2=B1 13%  perf-profile.children.=
cycles-pp.update_sd_lb_stats
>       0.00            +0.2        0.22 =C2=B1  2%  perf-profile.children.=
cycles-pp.unwind_get_return_address
>       0.00            +0.2        0.22 =C2=B1 28%  perf-profile.children.=
cycles-pp.__hrtimer_next_event_base
>       0.00            +0.2        0.22 =C2=B1 21%  perf-profile.children.=
cycles-pp.alloc_tree_block_no_bg_flush
>       0.00            +0.2        0.22 =C2=B1 21%  perf-profile.children.=
cycles-pp.btrfs_alloc_tree_block
>       0.00            +0.2        0.22 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_submit_bio_hook
>       0.00            +0.2        0.22 =C2=B1 11%  perf-profile.children.=
cycles-pp.mutex_spin_on_owner
>       0.00            +0.2        0.23 =C2=B1 29%  perf-profile.children.=
cycles-pp.copy_extent_buffer_full
>       0.00            +0.2        0.23 =C2=B1 10%  perf-profile.children.=
cycles-pp.free_extent_buffer
>       0.00            +0.2        0.23 =C2=B1 27%  perf-profile.children.=
cycles-pp.copy_page
>       0.00            +0.2        0.23 =C2=B1 12%  perf-profile.children.=
cycles-pp.find_busiest_group
>       0.00            +0.2        0.24 =C2=B1 15%  perf-profile.children.=
cycles-pp._raw_read_lock
>       0.00            +0.2        0.25 =C2=B1 14%  perf-profile.children.=
cycles-pp._raw_spin_trylock
>       0.00            +0.3        0.25 =C2=B1 15%  perf-profile.children.=
cycles-pp.hrtimer_next_event_without
>       0.00            +0.3        0.25 =C2=B1  9%  perf-profile.children.=
cycles-pp.__list_add_valid
>       0.00            +0.3        0.26 =C2=B1  8%  perf-profile.children.=
cycles-pp._raw_spin_lock_irq
>       0.00            +0.3        0.26 =C2=B1 13%  perf-profile.children.=
cycles-pp.run_local_timers
>       0.00            +0.3        0.26 =C2=B1 12%  perf-profile.children.=
cycles-pp.steal_from_bitmap
>       0.00            +0.3        0.27 =C2=B1  4%  perf-profile.children.=
cycles-pp.end_extent_writepage
>       0.00            +0.3        0.27 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_writepage_endio_finish_ordered
>       0.00            +0.3        0.27 =C2=B1  7%  perf-profile.children.=
cycles-pp.btrfs_truncate_item
>       0.00            +0.3        0.27 =C2=B1 12%  perf-profile.children.=
cycles-pp.__btrfs_add_free_space
>       0.00            +0.3        0.28 =C2=B1  4%  perf-profile.children.=
cycles-pp.dequeue_entity
>       0.00            +0.3        0.28 =C2=B1  5%  perf-profile.children.=
cycles-pp.select_task_rq_fair
>       0.07 =C2=B1 10%      +0.3        0.35 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.ktime_get_update_offsets_now
>       0.00            +0.3        0.29 =C2=B1 13%  perf-profile.children.=
cycles-pp.unpin_extent_range
>       0.00            +0.3        0.29 =C2=B1 11%  perf-profile.children.=
cycles-pp.rcu_core
>       0.00            +0.3        0.29 =C2=B1 12%  perf-profile.children.=
cycles-pp.btrfs_extend_item
>       0.15            +0.3        0.45 =C2=B1  5%  perf-profile.children.=
cycles-pp.__set_extent_bit
>       0.00            +0.3        0.30 =C2=B1 10%  perf-profile.children.=
cycles-pp.update_blocked_averages
>       0.00            +0.3        0.30 =C2=B1  5%  perf-profile.children.=
cycles-pp.find_extent_buffer
>       0.00            +0.3        0.30 =C2=B1 14%  perf-profile.children.=
cycles-pp.native_sched_clock
>       0.00            +0.3        0.30 =C2=B1  8%  perf-profile.children.=
cycles-pp.__lookup_extent_mapping
>       0.00            +0.3        0.31 =C2=B1 12%  perf-profile.children.=
cycles-pp.btrfs_finish_extent_commit
>       0.00            +0.3        0.31 =C2=B1 13%  perf-profile.children.=
cycles-pp.sched_clock
>       0.00            +0.3        0.31 =C2=B1 13%  perf-profile.children.=
cycles-pp.load_balance
>       0.02 =C2=B1122%      +0.3        0.33 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.02 =C2=B1122%      +0.3        0.33 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.btrfs_delayed_inode_release_metadata
>       0.00            +0.3        0.31 =C2=B1  3%  perf-profile.children.=
cycles-pp.dequeue_task_fair
>       0.00            +0.3        0.32 =C2=B1  7%  perf-profile.children.=
cycles-pp.pick_next_task_fair
>       0.00            +0.3        0.32 =C2=B1 11%  perf-profile.children.=
cycles-pp.run_rebalance_domains
>       0.00            +0.3        0.32 =C2=B1 52%  perf-profile.children.=
cycles-pp.start_kernel
>       0.00            +0.3        0.33 =C2=B1  4%  perf-profile.children.=
cycles-pp.__list_del_entry_valid
>       0.00            +0.3        0.34 =C2=B1 22%  perf-profile.children.=
cycles-pp.btrfs_balance_delayed_items
>       0.00            +0.4        0.35 =C2=B1 26%  perf-profile.children.=
cycles-pp.rcu_sched_clock_irq
>       0.00            +0.4        0.35 =C2=B1  6%  perf-profile.children.=
cycles-pp.__btrfs_release_delayed_node
>       0.00            +0.4        0.35 =C2=B1 15%  perf-profile.children.=
cycles-pp.sched_clock_cpu
>       0.00            +0.4        0.35 =C2=B1  7%  perf-profile.children.=
cycles-pp.btrfs_add_delayed_data_ref
>       0.00            +0.4        0.36 =C2=B1 12%  perf-profile.children.=
cycles-pp.find_next_bit
>       0.00            +0.4        0.37 =C2=B1 12%  perf-profile.children.=
cycles-pp.read_tsc
>       0.00            +0.4        0.38 =C2=B1  6%  perf-profile.children.=
cycles-pp.__orc_find
>       0.00            +0.4        0.39 =C2=B1 16%  perf-profile.children.=
cycles-pp.btrfs_map_bio
>       0.00            +0.4        0.40 =C2=B1 19%  perf-profile.children.=
cycles-pp.unlock_up
>       0.00            +0.4        0.40 =C2=B1  4%  perf-profile.children.=
cycles-pp.memmove_extent_buffer
>       0.00            +0.4        0.41 =C2=B1  3%  perf-profile.children.=
cycles-pp.btrfs_set_token_32
>       0.00            +0.4        0.41 =C2=B1  5%  perf-profile.children.=
cycles-pp.btrfs_update_block_group
>       0.00            +0.4        0.42 =C2=B1  9%  perf-profile.children.=
cycles-pp.brd_do_bvec
>       0.00            +0.4        0.43 =C2=B1  4%  perf-profile.children.=
cycles-pp.end_bio_extent_writepage
>       0.00            +0.4        0.43 =C2=B1 12%  perf-profile.children.=
cycles-pp.btrfs_try_tree_write_lock
>       0.00            +0.4        0.44 =C2=B1  3%  perf-profile.children.=
cycles-pp.generic_bin_search
>       0.00            +0.4        0.44 =C2=B1  9%  perf-profile.children.=
cycles-pp.native_irq_return_iret
>       0.00            +0.4        0.45        perf-profile.children.cycle=
s-pp.btrfs_try_granting_tickets
>       0.00            +0.5        0.45        perf-profile.children.cycle=
s-pp._raw_spin_unlock_irqrestore
>       0.00            +0.5        0.45 =C2=B1 12%  perf-profile.children.=
cycles-pp.lapic_next_deadline
>       0.00            +0.5        0.47 =C2=B1  2%  perf-profile.children.=
cycles-pp.orc_find
>       0.00            +0.5        0.47 =C2=B1  6%  perf-profile.children.=
cycles-pp.__btrfs_btree_balance_dirty
>       0.00            +0.5        0.47 =C2=B1 29%  perf-profile.children.=
cycles-pp.btrfs_free_path
>       0.00            +0.5        0.48 =C2=B1  4%  perf-profile.children.=
cycles-pp.schedule_idle
>       0.00            +0.5        0.48 =C2=B1  4%  perf-profile.children.=
cycles-pp.read_block_for_search
>       0.00            +0.5        0.48 =C2=B1  5%  perf-profile.children.=
cycles-pp.__queue_work
>       0.00            +0.5        0.49 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_end_bio
>       0.00            +0.5        0.49 =C2=B1  5%  perf-profile.children.=
cycles-pp.queue_work_on
>       0.00            +0.5        0.51 =C2=B1  3%  perf-profile.children.=
cycles-pp.rebalance_domains
>       0.00            +0.5        0.51 =C2=B1  4%  perf-profile.children.=
cycles-pp.memmove
>       0.00            +0.5        0.52 =C2=B1 20%  perf-profile.children.=
cycles-pp.btrfs_get_64
>       0.01 =C2=B1200%      +0.5        0.53 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.perf_mux_hrtimer_handler
>       0.00            +0.5        0.54 =C2=B1 21%  perf-profile.children.=
cycles-pp.btrfs_get_32
>       0.00            +0.6        0.56 =C2=B1 15%  perf-profile.children.=
cycles-pp.__next_timer_interrupt
>       0.00            +0.6        0.56 =C2=B1 11%  perf-profile.children.=
cycles-pp.native_write_msr
>       0.00            +0.6        0.56 =C2=B1 27%  perf-profile.children.=
cycles-pp.btrfs_cow_block
>       0.00            +0.6        0.56 =C2=B1 27%  perf-profile.children.=
cycles-pp.__btrfs_cow_block
>       0.00            +0.6        0.58 =C2=B1  6%  perf-profile.children.=
cycles-pp.cow_file_range
>       0.00            +0.6        0.59 =C2=B1 12%  perf-profile.children.=
cycles-pp.__mutex_lock
>       0.00            +0.6        0.61 =C2=B1  6%  perf-profile.children.=
cycles-pp.btrfs_run_delalloc_range
>       0.00            +0.7        0.67 =C2=B1 13%  perf-profile.children.=
cycles-pp.tick_nohz_irq_exit
>       0.00            +0.7        0.70 =C2=B1  6%  perf-profile.children.=
cycles-pp.writepage_delalloc
>       0.00            +0.7        0.70 =C2=B1 23%  perf-profile.children.=
cycles-pp.timekeeping_max_deferment
>       0.00            +0.8        0.76 =C2=B1  2%  perf-profile.children.=
cycles-pp.btrfs_delayed_refs_rsv_release
>       0.00            +0.8        0.77 =C2=B1 18%  perf-profile.children.=
cycles-pp.map_private_extent_buffer
>       0.00            +0.8        0.79 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_get_token_32
>       0.00            +0.8        0.80 =C2=B1  3%  perf-profile.children.=
cycles-pp.btrfs_del_items
>       0.00            +0.8        0.80 =C2=B1 23%  perf-profile.children.=
cycles-pp.tick_irq_enter
>       0.00            +0.8        0.81 =C2=B1 24%  perf-profile.children.=
cycles-pp.lookup_inline_extent_backref
>       0.00            +0.8        0.81 =C2=B1  5%  perf-profile.children.=
cycles-pp.schedule
>       0.00            +0.8        0.82 =C2=B1  2%  perf-profile.children.=
cycles-pp.run_scheduled_bios
>       0.00            +0.8        0.82 =C2=B1 14%  perf-profile.children.=
cycles-pp.get_next_timer_interrupt
>       0.00            +0.9        0.86 =C2=B1  5%  perf-profile.children.=
cycles-pp.__extent_writepage
>       0.00            +0.9        0.89 =C2=B1 22%  perf-profile.children.=
cycles-pp.irq_enter
>       0.00            +0.9        0.92 =C2=B1  6%  perf-profile.children.=
cycles-pp.brd_make_request
>       0.30 =C2=B1 12%      +0.9        1.22 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.00            +0.9        0.93 =C2=B1 22%  perf-profile.children.=
cycles-pp.btrfs_release_path
>       0.30 =C2=B1 12%      +1.0        1.27 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.00            +1.0        0.98 =C2=B1 20%  perf-profile.children.=
cycles-pp.submit_extent_page
>       0.00            +1.0        0.98        perf-profile.children.cycle=
s-pp.unwind_next_frame
>       0.00            +1.0        0.99 =C2=B1  7%  perf-profile.children.=
cycles-pp.generic_make_request
>       0.00            +1.0        0.99 =C2=B1  6%  perf-profile.children.=
cycles-pp.submit_bio
>       0.00            +1.0        1.00 =C2=B1  5%  perf-profile.children.=
cycles-pp.extent_write_cache_pages
>       0.00            +1.0        1.01 =C2=B1 21%  perf-profile.children.=
cycles-pp.write_one_eb
>       0.00            +1.2        1.16 =C2=B1  8%  perf-profile.children.=
cycles-pp.__btrfs_run_delayed_items
>       0.00            +1.2        1.22 =C2=B1  6%  perf-profile.children.=
cycles-pp.__writeback_single_inode
>       0.00            +1.2        1.23 =C2=B1  6%  perf-profile.children.=
cycles-pp.extent_writepages
>       0.00            +1.2        1.23 =C2=B1  4%  perf-profile.children.=
cycles-pp.__schedule
>       0.00            +1.3        1.25 =C2=B1 27%  perf-profile.children.=
cycles-pp.btrfs_lookup_csum
>       0.00            +1.3        1.25 =C2=B1 26%  perf-profile.children.=
cycles-pp.check_leaf
>       0.00            +1.3        1.26 =C2=B1 26%  perf-profile.children.=
cycles-pp.btree_csum_one_bio
>       0.00            +1.3        1.26 =C2=B1  6%  perf-profile.children.=
cycles-pp.writeback_sb_inodes
>       0.00            +1.3        1.28 =C2=B1  6%  perf-profile.children.=
cycles-pp.wb_writeback
>       0.00            +1.3        1.29 =C2=B1  6%  perf-profile.children.=
cycles-pp.wb_workfn
>       0.00            +1.3        1.30 =C2=B1 13%  perf-profile.children.=
cycles-pp.alloc_reserved_file_extent
>       0.41 =C2=B1  4%      +1.3        1.75 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       0.00            +1.3        1.34 =C2=B1  2%  perf-profile.children.=
cycles-pp.arch_stack_walk
>       0.00            +1.4        1.38 =C2=B1  8%  perf-profile.children.=
cycles-pp.queued_read_lock_slowpath
>       0.00            +1.5        1.47 =C2=B1 27%  perf-profile.children.=
cycles-pp.btree_submit_bio_hook
>       0.00            +1.5        1.47 =C2=B1  2%  perf-profile.children.=
cycles-pp.stack_trace_save_tsk
>       0.00            +1.5        1.49 =C2=B1  6%  perf-profile.children.=
cycles-pp.__softirqentry_text_start
>       0.00            +1.6        1.58 =C2=B1 12%  perf-profile.children.=
cycles-pp.queued_write_lock_slowpath
>       0.00            +1.6        1.59 =C2=B1 26%  perf-profile.children.=
cycles-pp.btrfs_write_and_wait_transaction
>       0.00            +1.6        1.59 =C2=B1 26%  perf-profile.children.=
cycles-pp.btrfs_write_marked_extents
>       0.00            +1.6        1.59 =C2=B1 26%  perf-profile.children.=
cycles-pp.btree_write_cache_pages
>       0.00            +1.6        1.61 =C2=B1 26%  perf-profile.children.=
cycles-pp.__filemap_fdatawrite_range
>       0.00            +1.6        1.61 =C2=B1  6%  perf-profile.children.=
cycles-pp.sched_ttwu_pending
>       0.00            +1.7        1.66 =C2=B1 10%  perf-profile.children.=
cycles-pp.btrfs_unlock_up_safe
>       0.00            +1.7        1.69 =C2=B1 23%  perf-profile.children.=
cycles-pp.submit_one_bio
>       0.00            +1.7        1.72 =C2=B1  2%  perf-profile.children.=
cycles-pp.autoremove_wake_function
>       0.09 =C2=B1 15%      +1.8        1.86 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       0.00            +1.8        1.83        perf-profile.children.cycle=
s-pp.__wake_up_common
>       0.00            +1.9        1.86 =C2=B1  2%  perf-profile.children.=
cycles-pp.__account_scheduler_latency
>       0.00            +1.9        1.91 =C2=B1 11%  perf-profile.children.=
cycles-pp.tick_nohz_next_event
>       0.00            +2.0        1.96 =C2=B1 24%  perf-profile.children.=
cycles-pp.poll_idle
>       0.00            +2.1        2.09 =C2=B1  2%  perf-profile.children.=
cycles-pp.try_to_wake_up
>       0.00            +2.2        2.21 =C2=B1 10%  perf-profile.children.=
cycles-pp.tick_nohz_get_sleep_length
>       0.47 =C2=B1  5%      +2.2        2.69 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.00            +2.2        2.25 =C2=B1  2%  perf-profile.children.=
cycles-pp.enqueue_entity
>       0.00            +2.3        2.32 =C2=B1  7%  perf-profile.children.=
cycles-pp.setup_items_for_insert
>       0.00            +2.3        2.33 =C2=B1  2%  perf-profile.children.=
cycles-pp.enqueue_task_fair
>       0.00            +2.3        2.34 =C2=B1  2%  perf-profile.children.=
cycles-pp.activate_task
>       0.00            +2.3        2.35 =C2=B1  2%  perf-profile.children.=
cycles-pp.ttwu_do_activate
>       0.00            +2.4        2.40 =C2=B1  8%  perf-profile.children.=
cycles-pp.irq_exit
>       0.00            +2.8        2.82 =C2=B1 16%  perf-profile.children.=
cycles-pp.do_writepages
>       0.00            +2.8        2.83 =C2=B1 29%  perf-profile.children.=
cycles-pp.btrfs_del_csums
>       0.18 =C2=B1 24%      +2.8        3.03 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       0.00            +3.1        3.05 =C2=B1  9%  perf-profile.children.=
cycles-pp.__wake_up_common_lock
>       0.00            +3.3        3.33 =C2=B1 13%  perf-profile.children.=
cycles-pp.btrfs_insert_empty_items
>       0.00            +3.4        3.40 =C2=B1 24%  perf-profile.children.=
cycles-pp.btrfs_commit_transaction
>       0.00            +3.5        3.50 =C2=B1 10%  perf-profile.children.=
cycles-pp.menu_select
>       0.00            +3.8        3.75 =C2=B1 11%  perf-profile.children.=
cycles-pp.btrfs_lookup_inode
>       0.00            +3.8        3.83 =C2=B1  9%  perf-profile.children.=
cycles-pp.btrfs_async_reclaim_metadata_space
>       0.07 =C2=B1  6%      +4.1        4.21 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.btrfs_async_run_delayed_root
>       0.04 =C2=B1 50%      +4.2        4.21 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__btrfs_update_delayed_inode
>       0.00            +4.2        4.21 =C2=B1 24%  perf-profile.children.=
cycles-pp.btrfs_csum_file_blocks
>       0.00            +4.2        4.22 =C2=B1 24%  perf-profile.children.=
cycles-pp.add_pending_csums
>       0.00            +4.3        4.34 =C2=B1 23%  perf-profile.children.=
cycles-pp.__btrfs_free_extent
>       0.66 =C2=B1  6%      +4.6        5.27 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       0.19 =C2=B1 14%      +5.6        5.77 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.finish_wait
>       0.00            +7.1        7.09 =C2=B1 18%  perf-profile.children.=
cycles-pp.priority_reclaim_metadata_space
>       0.07            +7.1        7.18 =C2=B1 18%  perf-profile.children.=
cycles-pp.btrfs_block_rsv_refill
>       0.00            +7.1        7.11 =C2=B1 14%  perf-profile.children.=
cycles-pp.btrfs_lock_root_node
>       0.07            +7.1        7.19 =C2=B1 18%  perf-profile.children.=
cycles-pp.evict_refill_and_join
>       0.00            +7.1        7.14 =C2=B1 14%  perf-profile.children.=
cycles-pp.btrfs_tree_lock
>       0.27            +7.2        7.43 =C2=B1 18%  perf-profile.children.=
cycles-pp.exit_to_usermode_loop
>       0.27            +7.2        7.43 =C2=B1 18%  perf-profile.children.=
cycles-pp.task_work_run
>       0.27            +7.2        7.43 =C2=B1 18%  perf-profile.children.=
cycles-pp.__fput
>       0.27            +7.2        7.43 =C2=B1 18%  perf-profile.children.=
cycles-pp.dput
>       0.27 =C2=B1  2%      +7.2        7.43 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__dentry_kill
>       0.27 =C2=B1  2%      +7.2        7.43 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.evict
>       0.27 =C2=B1  2%      +7.2        7.43 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.btrfs_evict_inode
>       0.27            +7.2        7.47 =C2=B1 18%  perf-profile.children.=
cycles-pp.close
>       0.00            +7.4        7.35 =C2=B1 16%  perf-profile.children.=
cycles-pp.btrfs_run_delayed_refs
>       0.00            +7.4        7.35 =C2=B1 16%  perf-profile.children.=
cycles-pp.__btrfs_run_delayed_refs
>       0.69 =C2=B1  5%      +8.0        8.69 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.smp_apic_timer_interrupt
>       0.73 =C2=B1  5%      +8.7        9.44 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.apic_timer_interrupt
>       0.53 =C2=B1 10%     +10.4       10.96 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_file_extent
>       0.22 =C2=B1 12%     +10.5       10.70 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.prepare_to_wait_event
>       0.00           +10.5       10.53 =C2=B1  8%  perf-profile.children.=
cycles-pp.flush_space
>       0.44 =C2=B1 13%     +12.4       12.87 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_tree_read_lock
>       0.46 =C2=B1 12%     +12.6       13.03 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_read_lock_root_node
>       0.00           +13.5       13.47 =C2=B1  6%  perf-profile.children.=
cycles-pp.__btrfs_drop_extents
>       0.00           +14.7       14.65 =C2=B1  5%  perf-profile.children.=
cycles-pp.insert_reserved_file_extent
>       0.43 =C2=B1 12%     +17.6       18.03 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.00           +19.6       19.62 =C2=B1  7%  perf-profile.children.=
cycles-pp.btrfs_finish_ordered_io
>       0.54 =C2=B1 10%     +22.5       23.09 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.btrfs_search_slot
>       0.07 =C2=B1  6%     +24.9       24.98 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.normal_work_helper
>       0.08 =C2=B1  7%     +30.2       30.30 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.08 =C2=B1  7%     +30.5       30.56 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       0.08 =C2=B1  5%     +30.5       30.58 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.08 =C2=B1  5%     +30.5       30.58 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.14 =C2=B1 14%     +38.8       38.92 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.intel_idle
>       0.15 =C2=B1 14%     +51.0       51.10 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>       0.15 =C2=B1 14%     +51.0       51.13 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter
>       0.15 =C2=B1 15%     +57.6       57.71 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.start_secondary
>       0.15 =C2=B1 15%     +57.9       58.03 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64
>       0.15 =C2=B1 15%     +57.9       58.03 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>       0.15 =C2=B1 15%     +57.9       58.06 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.do_idle
>      96.78           -75.5       21.27 =C2=B1 15%  perf-profile.self.cycl=
es-pp.native_queued_spin_lock_slowpath
>       0.14 =C2=B1 18%      -0.1        0.05        perf-profile.self.cycl=
es-pp.update_cfs_group
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.rebalance_domains
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.orc_find
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.__btrfs_release_delayed_node
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.end_bio_extent_writepage
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.self.cycl=
es-pp.rcu_irq_exit
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.self.cycl=
es-pp.available_idle_cpu
>       0.00            +0.1        0.06 =C2=B1 13%  perf-profile.self.cycl=
es-pp.btrfs_del_items
>       0.00            +0.1        0.06 =C2=B1 13%  perf-profile.self.cycl=
es-pp.free_extent_map
>       0.00            +0.1        0.06        perf-profile.self.cycles-pp=
.__btrfs_run_delayed_refs
>       0.00            +0.1        0.06 =C2=B1 19%  perf-profile.self.cycl=
es-pp.check_preempt_curr
>       0.00            +0.1        0.06 =C2=B1 14%  perf-profile.self.cycl=
es-pp.xas_load
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.self.cycl=
es-pp.setup_items_for_insert
>       0.00            +0.1        0.06 =C2=B1 19%  perf-profile.self.cycl=
es-pp.trigger_load_balance
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.self.cycl=
es-pp.verify_parent_transid
>       0.00            +0.1        0.07 =C2=B1 25%  perf-profile.self.cycl=
es-pp.lapic_next_deadline
>       0.00            +0.1        0.07 =C2=B1  7%  perf-profile.self.cycl=
es-pp.update_cfs_rq_h_load
>       0.00            +0.1        0.07 =C2=B1 20%  perf-profile.self.cycl=
es-pp.get_next_timer_interrupt
>       0.00            +0.1        0.07        perf-profile.self.cycles-pp=
.__btrfs_block_rsv_release
>       0.00            +0.1        0.07 =C2=B1 44%  perf-profile.self.cycl=
es-pp.io_serial_in
>       0.00            +0.1        0.07 =C2=B1 17%  perf-profile.self.cycl=
es-pp.update_curr
>       0.00            +0.1        0.07 =C2=B1 25%  perf-profile.self.cycl=
es-pp.note_gp_changes
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.self.cycl=
es-pp.btrfs_try_granting_tickets
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.self.cycl=
es-pp.kmem_cache_free
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.self.cycl=
es-pp.set_extent_buffer_dirty
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.self.cycl=
es-pp.copy_pages
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.self.cycl=
es-pp.mutex_unlock
>       0.00            +0.1        0.07 =C2=B1 12%  perf-profile.self.cycl=
es-pp.btrfs_async_reclaim_metadata_space
>       0.00            +0.1        0.08 =C2=B1  6%  perf-profile.self.cycl=
es-pp.percpu_counter_add_batch
>       0.00            +0.1        0.08 =C2=B1  6%  perf-profile.self.cycl=
es-pp.__update_load_avg_se
>       0.00            +0.1        0.08 =C2=B1 27%  perf-profile.self.cycl=
es-pp.rb_next
>       0.00            +0.1        0.08 =C2=B1 17%  perf-profile.self.cycl=
es-pp.call_cpuidle
>       0.00            +0.1        0.08 =C2=B1 17%  perf-profile.self.cycl=
es-pp.btrfs_comp_cpu_keys
>       0.00            +0.1        0.08 =C2=B1 10%  perf-profile.self.cycl=
es-pp.enqueue_task_fair
>       0.00            +0.1        0.08 =C2=B1 14%  perf-profile.self.cycl=
es-pp.rcu_idle_exit
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.self.cycl=
es-pp.kmem_cache_alloc
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.self.cycl=
es-pp.cpuacct_charge
>       0.00            +0.1        0.09 =C2=B1 19%  perf-profile.self.cycl=
es-pp.interrupt_entry
>       0.00            +0.1        0.09 =C2=B1 15%  perf-profile.self.cycl=
es-pp.idle_cpu
>       0.00            +0.1        0.09 =C2=B1  9%  perf-profile.self.cycl=
es-pp.hrtimer_interrupt
>       0.00            +0.1        0.09 =C2=B1 22%  perf-profile.self.cycl=
es-pp.__hrtimer_run_queues
>       0.00            +0.1        0.10 =C2=B1 17%  perf-profile.self.cycl=
es-pp.steal_from_bitmap
>       0.00            +0.1        0.10 =C2=B1  9%  perf-profile.self.cycl=
es-pp.btrfs_tree_read_unlock
>       0.00            +0.1        0.10 =C2=B1 12%  perf-profile.self.cycl=
es-pp.btrfs_tree_unlock
>       0.00            +0.1        0.10 =C2=B1 17%  perf-profile.self.cycl=
es-pp.rb_insert_color
>       0.00            +0.1        0.10 =C2=B1  4%  perf-profile.self.cycl=
es-pp.rcu_eqs_enter
>       0.00            +0.1        0.10 =C2=B1 35%  perf-profile.self.cycl=
es-pp.run_timer_softirq
>       0.00            +0.1        0.10 =C2=B1 21%  perf-profile.self.cycl=
es-pp.btrfs_get_8
>       0.00            +0.1        0.10        perf-profile.self.cycles-pp=
.set_next_entity
>       0.00            +0.1        0.10 =C2=B1 12%  perf-profile.self.cycl=
es-pp.update_blocked_averages
>       0.00            +0.1        0.10 =C2=B1 12%  perf-profile.self.cycl=
es-pp.mutex_lock
>       0.00            +0.1        0.10 =C2=B1  9%  perf-profile.self.cycl=
es-pp.__wake_up_common
>       0.00            +0.1        0.11 =C2=B1 11%  perf-profile.self.cycl=
es-pp.__slab_free
>       0.00            +0.1        0.11 =C2=B1  8%  perf-profile.self.cycl=
es-pp.enqueue_entity
>       0.00            +0.1        0.11 =C2=B1  8%  perf-profile.self.cycl=
es-pp.find_ref_head
>       0.00            +0.1        0.11 =C2=B1  7%  perf-profile.self.cycl=
es-pp.stack_trace_save_tsk
>       0.00            +0.1        0.11 =C2=B1 12%  perf-profile.self.cycl=
es-pp.__radix_tree_lookup
>       0.00            +0.1        0.12 =C2=B1 10%  perf-profile.self.cycl=
es-pp.rb_erase
>       0.00            +0.1        0.12 =C2=B1 24%  perf-profile.self.cycl=
es-pp.tick_check_oneshot_broadcast_this_cpu
>       0.00            +0.1        0.12 =C2=B1  6%  perf-profile.self.cycl=
es-pp.rcu_dynticks_eqs_exit
>       0.00            +0.1        0.12 =C2=B1  3%  perf-profile.self.cycl=
es-pp.sched_ttwu_pending
>       0.00            +0.1        0.12 =C2=B1  3%  perf-profile.self.cycl=
es-pp.__switch_to
>       0.00            +0.1        0.13 =C2=B1 13%  perf-profile.self.cycl=
es-pp.update_rq_clock
>       0.00            +0.1        0.13 =C2=B1  7%  perf-profile.self.cycl=
es-pp.update_load_avg
>       0.00            +0.1        0.14 =C2=B1  6%  perf-profile.self.cycl=
es-pp.__etree_search
>       0.00            +0.1        0.14 =C2=B1 11%  perf-profile.self.cycl=
es-pp.tsc_verify_tsc_adjust
>       0.00            +0.1        0.14 =C2=B1  6%  perf-profile.self.cycl=
es-pp.__switch_to_asm
>       0.00            +0.1        0.14 =C2=B1  3%  perf-profile.self.cycl=
es-pp.___might_sleep
>       0.00            +0.1        0.15 =C2=B1 25%  perf-profile.self.cycl=
es-pp.calc_global_load_tick
>       0.00            +0.1        0.15 =C2=B1  3%  perf-profile.self.cycl=
es-pp.btrfs_search_slot
>       0.00            +0.1        0.15 =C2=B1  3%  perf-profile.self.cycl=
es-pp.__update_load_avg_cfs_rq
>       0.00            +0.1        0.15 =C2=B1 28%  perf-profile.self.cycl=
es-pp.check_leaf
>       0.00            +0.2        0.15 =C2=B1  9%  perf-profile.self.cycl=
es-pp.select_task_rq_fair
>       0.00            +0.2        0.15 =C2=B1 10%  perf-profile.self.cycl=
es-pp.update_sd_lb_stats
>       0.00            +0.2        0.15 =C2=B1  5%  perf-profile.self.cycl=
es-pp.__account_scheduler_latency
>       0.00            +0.2        0.16 =C2=B1 18%  perf-profile.self.cycl=
es-pp.read_extent_buffer
>       0.00            +0.2        0.16 =C2=B1  3%  perf-profile.self.cycl=
es-pp.find_extent_buffer
>       0.00            +0.2        0.16 =C2=B1 13%  perf-profile.self.cycl=
es-pp.btrfs_tree_lock
>       0.00            +0.2        0.16 =C2=B1 15%  perf-profile.self.cycl=
es-pp.priority_reclaim_metadata_space
>       0.00            +0.2        0.17 =C2=B1 14%  perf-profile.self.cycl=
es-pp.perf_mux_hrtimer_handler
>       0.00            +0.2        0.17 =C2=B1 12%  perf-profile.self.cycl=
es-pp._raw_spin_lock_irq
>       0.00            +0.2        0.17 =C2=B1  9%  perf-profile.self.cycl=
es-pp.find_next_zero_bit
>       0.00            +0.2        0.17 =C2=B1  9%  perf-profile.self.cycl=
es-pp.add_delayed_ref_head
>       0.00            +0.2        0.18 =C2=B1  2%  perf-profile.self.cycl=
es-pp._raw_write_lock
>       0.00            +0.2        0.18 =C2=B1 13%  perf-profile.self.cycl=
es-pp.free_extent_buffer
>       0.00            +0.2        0.18 =C2=B1  6%  perf-profile.self.cycl=
es-pp.nr_iowait_cpu
>       0.00            +0.2        0.18 =C2=B1  9%  perf-profile.self.cycl=
es-pp.btrfs_root_node
>       0.00            +0.2        0.19 =C2=B1 26%  perf-profile.self.cycl=
es-pp.__hrtimer_next_event_base
>       0.00            +0.2        0.19 =C2=B1 15%  perf-profile.self.cycl=
es-pp.tick_sched_timer
>       0.00            +0.2        0.19 =C2=B1  4%  perf-profile.self.cycl=
es-pp.__module_address
>       0.00            +0.2        0.20 =C2=B1 12%  perf-profile.self.cycl=
es-pp.btrfs_tree_read_lock
>       0.00            +0.2        0.20 =C2=B1 10%  perf-profile.self.cycl=
es-pp.__softirqentry_text_start
>       0.00            +0.2        0.22 =C2=B1 11%  perf-profile.self.cycl=
es-pp.mutex_spin_on_owner
>       0.00            +0.2        0.23 =C2=B1  5%  perf-profile.self.cycl=
es-pp.__schedule
>       0.00            +0.2        0.23 =C2=B1 14%  perf-profile.self.cycl=
es-pp._raw_read_lock
>       0.07 =C2=B1  9%      +0.2        0.30 =C2=B1 22%  perf-profile.self=
.cycles-pp.ktime_get_update_offsets_now
>       0.00            +0.2        0.23 =C2=B1 27%  perf-profile.self.cycl=
es-pp.copy_page
>       0.00            +0.2        0.24 =C2=B1 22%  perf-profile.self.cycl=
es-pp.btrfs_get_64
>       0.00            +0.2        0.25 =C2=B1 13%  perf-profile.self.cycl=
es-pp.run_local_timers
>       0.00            +0.2        0.25 =C2=B1  9%  perf-profile.self.cycl=
es-pp.__list_add_valid
>       0.00            +0.2        0.25 =C2=B1 14%  perf-profile.self.cycl=
es-pp._raw_spin_trylock
>       0.00            +0.3        0.27 =C2=B1 16%  perf-profile.self.cycl=
es-pp.btrfs_get_32
>       0.00            +0.3        0.27        perf-profile.self.cycles-pp=
.prepare_to_wait_event
>       0.00            +0.3        0.28 =C2=B1 15%  perf-profile.self.cycl=
es-pp.__next_timer_interrupt
>       0.00            +0.3        0.28 =C2=B1  7%  perf-profile.self.cycl=
es-pp.try_to_wake_up
>       0.00            +0.3        0.29 =C2=B1 12%  perf-profile.self.cycl=
es-pp.native_sched_clock
>       0.00            +0.3        0.30 =C2=B1  6%  perf-profile.self.cycl=
es-pp.__lookup_extent_mapping
>       0.00            +0.3        0.30 =C2=B1  4%  perf-profile.self.cycl=
es-pp.generic_bin_search
>       0.00            +0.3        0.30 =C2=B1 25%  perf-profile.self.cycl=
es-pp.rcu_sched_clock_irq
>       0.00            +0.3        0.30 =C2=B1 13%  perf-profile.self.cycl=
es-pp.find_next_bit
>       0.00            +0.3        0.31 =C2=B1 14%  perf-profile.self.cycl=
es-pp.tick_nohz_next_event
>       0.00            +0.3        0.32 =C2=B1  3%  perf-profile.self.cycl=
es-pp._raw_spin_unlock_irqrestore
>       0.00            +0.3        0.33 =C2=B1  5%  perf-profile.self.cycl=
es-pp.__list_del_entry_valid
>       0.00            +0.3        0.34 =C2=B1 13%  perf-profile.self.cycl=
es-pp.brd_do_bvec
>       0.00            +0.3        0.35 =C2=B1 15%  perf-profile.self.cycl=
es-pp.queued_read_lock_slowpath
>       0.00            +0.4        0.36 =C2=B1 11%  perf-profile.self.cycl=
es-pp.read_tsc
>       0.00            +0.4        0.38 =C2=B1  3%  perf-profile.self.cycl=
es-pp.btrfs_set_token_32
>       0.00            +0.4        0.38 =C2=B1  6%  perf-profile.self.cycl=
es-pp.__orc_find
>       0.00            +0.4        0.40 =C2=B1  6%  perf-profile.self.cycl=
es-pp.do_idle
>       0.00            +0.4        0.42        perf-profile.self.cycles-pp=
.unwind_next_frame
>       0.00            +0.4        0.44 =C2=B1  9%  perf-profile.self.cycl=
es-pp.native_irq_return_iret
>       0.00            +0.5        0.51 =C2=B1  4%  perf-profile.self.cycl=
es-pp.memmove
>       0.00            +0.6        0.56 =C2=B1 11%  perf-profile.self.cycl=
es-pp.native_write_msr
>       0.00            +0.7        0.67 =C2=B1  6%  perf-profile.self.cycl=
es-pp.queued_write_lock_slowpath
>       0.00            +0.7        0.70 =C2=B1 24%  perf-profile.self.cycl=
es-pp.timekeeping_max_deferment
>       0.00            +0.7        0.72 =C2=B1 19%  perf-profile.self.cycl=
es-pp.map_private_extent_buffer
>       0.00            +0.7        0.73 =C2=B1  4%  perf-profile.self.cycl=
es-pp.btrfs_get_token_32
>       0.00            +0.9        0.93 =C2=B1 12%  perf-profile.self.cycl=
es-pp.cpuidle_enter_state
>       0.49            +1.0        1.50 =C2=B1  3%  perf-profile.self.cycl=
es-pp._raw_spin_lock
>       0.00            +1.1        1.07 =C2=B1 19%  perf-profile.self.cycl=
es-pp.menu_select
>       0.00            +1.3        1.26        perf-profile.self.cycles-pp=
._raw_spin_lock_irqsave
>       0.00            +1.9        1.92 =C2=B1 24%  perf-profile.self.cycl=
es-pp.poll_idle
>       0.17 =C2=B1 26%      +2.5        2.70 =C2=B1 10%  perf-profile.self=
.cycles-pp.ktime_get
>       0.14 =C2=B1 14%     +38.7       38.87 =C2=B1  6%  perf-profile.self=
.cycles-pp.intel_idle
>       1326 =C2=B1 43%    +308.5%       5419 =C2=B1 31%  interrupts.31:PCI=
-MSI.524289-edge.eth0-TxRx-0
>     411.40 =C2=B1 50%   +1548.0%       6780 =C2=B1 52%  interrupts.32:PCI=
-MSI.524290-edge.eth0-TxRx-1
>     309.40 =C2=B1 18%    +384.8%       1500 =C2=B1 33%  interrupts.33:PCI=
-MSI.524291-edge.eth0-TxRx-2
>     461.40 =C2=B1 63%    +533.1%       2921 =C2=B1 67%  interrupts.34:PCI=
-MSI.524292-edge.eth0-TxRx-3
>     564.40          +401.1%       2828        interrupts.9:IO-APIC.9-fast=
eoi.acpi
>     866975 =C2=B1 14%    +207.9%    2669536 =C2=B1  4%  interrupts.CAL:Fu=
nction_call_interrupts
>       4345 =C2=B1 14%    +214.9%      13684        interrupts.CPU0.CAL:Fu=
nction_call_interrupts
>     556431          +406.9%    2820652        interrupts.CPU0.LOC:Local_t=
imer_interrupts
>       6998 =C2=B1 30%     -89.2%     756.00 =C2=B1 58%  interrupts.CPU0.N=
MI:Non-maskable_interrupts
>       6998 =C2=B1 30%     -89.2%     756.00 =C2=B1 58%  interrupts.CPU0.P=
MI:Performance_monitoring_interrupts
>      10063 =C2=B1  7%   +1807.2%     191922        interrupts.CPU0.RES:Re=
scheduling_interrupts
>     564.40          +401.1%       2828        interrupts.CPU1.9:IO-APIC.9=
-fasteoi.acpi
>       4479 =C2=B1 13%    +206.9%      13747 =C2=B1  4%  interrupts.CPU1.C=
AL:Function_call_interrupts
>     555195          +408.0%    2820211        interrupts.CPU1.LOC:Local_t=
imer_interrupts
>       7880 =C2=B1 22%     -89.8%     800.33 =C2=B1 38%  interrupts.CPU1.N=
MI:Non-maskable_interrupts
>       7880 =C2=B1 22%     -89.8%     800.33 =C2=B1 38%  interrupts.CPU1.P=
MI:Performance_monitoring_interrupts
>       9088 =C2=B1  8%   +1993.8%     190285        interrupts.CPU1.RES:Re=
scheduling_interrupts
>     411.40 =C2=B1 50%   +1548.0%       6780 =C2=B1 52%  interrupts.CPU10.=
32:PCI-MSI.524290-edge.eth0-TxRx-1
>       4454 =C2=B1 13%    +209.1%      13766 =C2=B1  4%  interrupts.CPU10.=
CAL:Function_call_interrupts
>     554990          +408.3%    2821064        interrupts.CPU10.LOC:Local_=
timer_interrupts
>       7858 =C2=B1 22%     -88.5%     903.67 =C2=B1 43%  interrupts.CPU10.=
NMI:Non-maskable_interrupts
>       7858 =C2=B1 22%     -88.5%     903.67 =C2=B1 43%  interrupts.CPU10.=
PMI:Performance_monitoring_interrupts
>       8045 =C2=B1  6%   +2246.7%     188799        interrupts.CPU10.RES:R=
escheduling_interrupts
>       1.20 =C2=B1 81%   +7788.9%      94.67 =C2=B1 27%  interrupts.CPU10.=
TLB:TLB_shootdowns
>       4510 =C2=B1 14%    +207.1%      13853 =C2=B1  4%  interrupts.CPU100=
.CAL:Function_call_interrupts
>     555074          +408.1%    2820157        interrupts.CPU100.LOC:Local=
_timer_interrupts
>       7887 =C2=B1 22%     -83.0%       1341 =C2=B1 36%  interrupts.CPU100=
.NMI:Non-maskable_interrupts
>       7887 =C2=B1 22%     -83.0%       1341 =C2=B1 36%  interrupts.CPU100=
.PMI:Performance_monitoring_interrupts
>       7986 =C2=B1  4%   +2266.0%     188958 =C2=B1  2%  interrupts.CPU100=
.RES:Rescheduling_interrupts
>       4509 =C2=B1 14%    +207.3%      13858 =C2=B1  4%  interrupts.CPU101=
.CAL:Function_call_interrupts
>     555025          +408.1%    2820107        interrupts.CPU101.LOC:Local=
_timer_interrupts
>       7870 =C2=B1 22%     -90.3%     765.33 =C2=B1 54%  interrupts.CPU101=
.NMI:Non-maskable_interrupts
>       7870 =C2=B1 22%     -90.3%     765.33 =C2=B1 54%  interrupts.CPU101=
.PMI:Performance_monitoring_interrupts
>       7910 =C2=B1  4%   +2285.4%     188686 =C2=B1  2%  interrupts.CPU101=
.RES:Rescheduling_interrupts
>       1.00 =C2=B1109%   +9766.7%      98.67 =C2=B1 26%  interrupts.CPU101=
.TLB:TLB_shootdowns
>       4507 =C2=B1 14%    +207.0%      13837 =C2=B1  4%  interrupts.CPU102=
.CAL:Function_call_interrupts
>     554939          +408.2%    2820153        interrupts.CPU102.LOC:Local=
_timer_interrupts
>       7871 =C2=B1 22%     -88.1%     933.67 =C2=B1 46%  interrupts.CPU102=
.NMI:Non-maskable_interrupts
>       7871 =C2=B1 22%     -88.1%     933.67 =C2=B1 46%  interrupts.CPU102=
.PMI:Performance_monitoring_interrupts
>       7902 =C2=B1  2%   +2282.8%     188291 =C2=B1  2%  interrupts.CPU102=
.RES:Rescheduling_interrupts
>       4500 =C2=B1 15%    +207.1%      13822 =C2=B1  4%  interrupts.CPU103=
.CAL:Function_call_interrupts
>     554993          +408.4%    2821446        interrupts.CPU103.LOC:Local=
_timer_interrupts
>       7871 =C2=B1 22%     -89.8%     800.33 =C2=B1 31%  interrupts.CPU103=
.NMI:Non-maskable_interrupts
>       7871 =C2=B1 22%     -89.8%     800.33 =C2=B1 31%  interrupts.CPU103=
.PMI:Performance_monitoring_interrupts
>       7872 =C2=B1  4%   +2308.4%     189605        interrupts.CPU103.RES:=
Rescheduling_interrupts
>       2.00 =C2=B1 54%   +4533.3%      92.67 =C2=B1 28%  interrupts.CPU103=
.TLB:TLB_shootdowns
>       4513 =C2=B1 14%    +208.1%      13906 =C2=B1  4%  interrupts.CPU104=
.CAL:Function_call_interrupts
>     555523          +407.7%    2820424        interrupts.CPU104.LOC:Local=
_timer_interrupts
>       7870 =C2=B1 22%     -88.6%     896.33 =C2=B1 22%  interrupts.CPU104=
.NMI:Non-maskable_interrupts
>       7870 =C2=B1 22%     -88.6%     896.33 =C2=B1 22%  interrupts.CPU104=
.PMI:Performance_monitoring_interrupts
>       7894 =C2=B1  3%   +2303.6%     189750        interrupts.CPU104.RES:=
Rescheduling_interrupts
>       1.60 =C2=B1 30%   +5545.8%      90.33 =C2=B1 10%  interrupts.CPU104=
.TLB:TLB_shootdowns
>       4512 =C2=B1 14%    +206.9%      13848 =C2=B1  4%  interrupts.CPU105=
.CAL:Function_call_interrupts
>     555065          +408.1%    2820283        interrupts.CPU105.LOC:Local=
_timer_interrupts
>       7862 =C2=B1 22%     -85.4%       1144 =C2=B1 22%  interrupts.CPU105=
.NMI:Non-maskable_interrupts
>       7862 =C2=B1 22%     -85.4%       1144 =C2=B1 22%  interrupts.CPU105=
.PMI:Performance_monitoring_interrupts
>       7933 =C2=B1  4%   +2274.1%     188348 =C2=B1  2%  interrupts.CPU105=
.RES:Rescheduling_interrupts
>       1.20 =C2=B1122%   +7455.6%      90.67 =C2=B1 19%  interrupts.CPU105=
.TLB:TLB_shootdowns
>       4259 =C2=B1 14%    +224.4%      13818 =C2=B1  4%  interrupts.CPU106=
.CAL:Function_call_interrupts
>     554923          +408.2%    2820152        interrupts.CPU106.LOC:Local=
_timer_interrupts
>       7858 =C2=B1 22%     -88.6%     894.00 =C2=B1 33%  interrupts.CPU106=
.NMI:Non-maskable_interrupts
>       7858 =C2=B1 22%     -88.6%     894.00 =C2=B1 33%  interrupts.CPU106=
.PMI:Performance_monitoring_interrupts
>       7920 =C2=B1  3%   +2290.7%     189340        interrupts.CPU106.RES:=
Rescheduling_interrupts
>       4511 =C2=B1 14%    +205.6%      13785 =C2=B1  4%  interrupts.CPU107=
.CAL:Function_call_interrupts
>     554916          +408.2%    2820137        interrupts.CPU107.LOC:Local=
_timer_interrupts
>       7864 =C2=B1 22%     -88.4%     912.33 =C2=B1 20%  interrupts.CPU107=
.NMI:Non-maskable_interrupts
>       7864 =C2=B1 22%     -88.4%     912.33 =C2=B1 20%  interrupts.CPU107=
.PMI:Performance_monitoring_interrupts
>       7936 =C2=B1  3%   +2281.7%     189022        interrupts.CPU107.RES:=
Rescheduling_interrupts
>       4520 =C2=B1 14%    +205.9%      13829 =C2=B1  4%  interrupts.CPU108=
.CAL:Function_call_interrupts
>     555116          +408.0%    2820151        interrupts.CPU108.LOC:Local=
_timer_interrupts
>       7875 =C2=B1 22%     -84.2%       1243 =C2=B1 20%  interrupts.CPU108=
.NMI:Non-maskable_interrupts
>       7875 =C2=B1 22%     -84.2%       1243 =C2=B1 20%  interrupts.CPU108=
.PMI:Performance_monitoring_interrupts
>       7900 =C2=B1  5%   +2303.0%     189843        interrupts.CPU108.RES:=
Rescheduling_interrupts
>       2.00 =C2=B1104%   +4266.7%      87.33 =C2=B1 22%  interrupts.CPU108=
.TLB:TLB_shootdowns
>       4520 =C2=B1 14%    +205.3%      13803 =C2=B1  4%  interrupts.CPU109=
.CAL:Function_call_interrupts
>     555175          +408.0%    2820169        interrupts.CPU109.LOC:Local=
_timer_interrupts
>       7855 =C2=B1 22%     -86.7%       1048 =C2=B1 12%  interrupts.CPU109=
.NMI:Non-maskable_interrupts
>       7855 =C2=B1 22%     -86.7%       1048 =C2=B1 12%  interrupts.CPU109=
.PMI:Performance_monitoring_interrupts
>       7944 =C2=B1  3%   +2296.5%     190383        interrupts.CPU109.RES:=
Rescheduling_interrupts
>     309.40 =C2=B1 18%    +384.8%       1500 =C2=B1 33%  interrupts.CPU11.=
33:PCI-MSI.524291-edge.eth0-TxRx-2
>       4469 =C2=B1 14%    +207.8%      13756 =C2=B1  4%  interrupts.CPU11.=
CAL:Function_call_interrupts
>     555914          +407.4%    2820442        interrupts.CPU11.LOC:Local_=
timer_interrupts
>       7878 =C2=B1 21%     -87.2%       1012 =C2=B1 24%  interrupts.CPU11.=
NMI:Non-maskable_interrupts
>       7878 =C2=B1 21%     -87.2%       1012 =C2=B1 24%  interrupts.CPU11.=
PMI:Performance_monitoring_interrupts
>       7901 =C2=B1  4%   +2294.1%     189164        interrupts.CPU11.RES:R=
escheduling_interrupts
>       4.00 =C2=B1100%   +2325.0%      97.00 =C2=B1 27%  interrupts.CPU11.=
TLB:TLB_shootdowns
>       4520 =C2=B1 14%    +204.8%      13778 =C2=B1  4%  interrupts.CPU110=
.CAL:Function_call_interrupts
>     555396          +407.8%    2820175        interrupts.CPU110.LOC:Local=
_timer_interrupts
>       7858 =C2=B1 22%     -87.5%     986.00 =C2=B1 30%  interrupts.CPU110=
.NMI:Non-maskable_interrupts
>       7858 =C2=B1 22%     -87.5%     986.00 =C2=B1 30%  interrupts.CPU110=
.PMI:Performance_monitoring_interrupts
>       8034 =C2=B1  3%   +2264.6%     189976        interrupts.CPU110.RES:=
Rescheduling_interrupts
>       4520 =C2=B1 14%    +206.4%      13852 =C2=B1  4%  interrupts.CPU111=
.CAL:Function_call_interrupts
>     555531          +407.7%    2820198        interrupts.CPU111.LOC:Local=
_timer_interrupts
>       7861 =C2=B1 22%     -91.1%     696.00 =C2=B1  9%  interrupts.CPU111=
.NMI:Non-maskable_interrupts
>       7861 =C2=B1 22%     -91.1%     696.00 =C2=B1  9%  interrupts.CPU111=
.PMI:Performance_monitoring_interrupts
>       7915 =C2=B1  3%   +2294.9%     189568        interrupts.CPU111.RES:=
Rescheduling_interrupts
>       4524 =C2=B1 14%    +205.3%      13810 =C2=B1  4%  interrupts.CPU112=
.CAL:Function_call_interrupts
>     555282          +407.9%    2820233        interrupts.CPU112.LOC:Local=
_timer_interrupts
>       7864 =C2=B1 22%     -86.2%       1089 =C2=B1 47%  interrupts.CPU112=
.NMI:Non-maskable_interrupts
>       7864 =C2=B1 22%     -86.2%       1089 =C2=B1 47%  interrupts.CPU112=
.PMI:Performance_monitoring_interrupts
>       7951 =C2=B1  3%   +2274.0%     188779        interrupts.CPU112.RES:=
Rescheduling_interrupts
>       4518 =C2=B1 14%    +204.9%      13774 =C2=B1  4%  interrupts.CPU113=
.CAL:Function_call_interrupts
>     555247          +408.0%    2820478        interrupts.CPU113.LOC:Local=
_timer_interrupts
>       7865 =C2=B1 22%     -90.0%     786.00 =C2=B1 42%  interrupts.CPU113=
.NMI:Non-maskable_interrupts
>       7865 =C2=B1 22%     -90.0%     786.00 =C2=B1 42%  interrupts.CPU113=
.PMI:Performance_monitoring_interrupts
>       7952 =C2=B1  5%   +2265.9%     188137 =C2=B1  2%  interrupts.CPU113=
.RES:Rescheduling_interrupts
>       0.80 =C2=B1 93%  +10733.3%      86.67 =C2=B1 12%  interrupts.CPU113=
.TLB:TLB_shootdowns
>       4519 =C2=B1 14%    +201.2%      13613 =C2=B1  5%  interrupts.CPU114=
.CAL:Function_call_interrupts
>     555281          +407.9%    2820344        interrupts.CPU114.LOC:Local=
_timer_interrupts
>       7854 =C2=B1 22%     -86.3%       1076 =C2=B1 13%  interrupts.CPU114=
.NMI:Non-maskable_interrupts
>       7854 =C2=B1 22%     -86.3%       1076 =C2=B1 13%  interrupts.CPU114=
.PMI:Performance_monitoring_interrupts
>       7815 =C2=B1  4%   +2328.8%     189824        interrupts.CPU114.RES:=
Rescheduling_interrupts
>       4518 =C2=B1 14%    +201.0%      13599 =C2=B1  5%  interrupts.CPU115=
.CAL:Function_call_interrupts
>     555273          +408.2%    2821623        interrupts.CPU115.LOC:Local=
_timer_interrupts
>       7879 =C2=B1 22%     -87.1%       1012 =C2=B1 47%  interrupts.CPU115=
.NMI:Non-maskable_interrupts
>       7879 =C2=B1 22%     -87.1%       1012 =C2=B1 47%  interrupts.CPU115=
.PMI:Performance_monitoring_interrupts
>       7892 =C2=B1  3%   +2301.6%     189536        interrupts.CPU115.RES:=
Rescheduling_interrupts
>       4516 =C2=B1 14%    +205.4%      13793 =C2=B1  4%  interrupts.CPU116=
.CAL:Function_call_interrupts
>     555582          +407.7%    2820421        interrupts.CPU116.LOC:Local=
_timer_interrupts
>       7876 =C2=B1 22%     -88.4%     915.67 =C2=B1 35%  interrupts.CPU116=
.NMI:Non-maskable_interrupts
>       7876 =C2=B1 22%     -88.4%     915.67 =C2=B1 35%  interrupts.CPU116=
.PMI:Performance_monitoring_interrupts
>       8089 =C2=B1  4%   +2234.2%     188825        interrupts.CPU116.RES:=
Rescheduling_interrupts
>       4305 =C2=B1 24%    +219.2%      13744 =C2=B1  4%  interrupts.CPU117=
.CAL:Function_call_interrupts
>     555576          +407.6%    2820258        interrupts.CPU117.LOC:Local=
_timer_interrupts
>       7865 =C2=B1 22%     -90.3%     762.67 =C2=B1 30%  interrupts.CPU117=
.NMI:Non-maskable_interrupts
>       7865 =C2=B1 22%     -90.3%     762.67 =C2=B1 30%  interrupts.CPU117=
.PMI:Performance_monitoring_interrupts
>       7840 =C2=B1  7%   +2313.8%     189243        interrupts.CPU117.RES:=
Rescheduling_interrupts
>       6.40 =C2=B1112%   +1176.0%      81.67 =C2=B1 18%  interrupts.CPU117=
.TLB:TLB_shootdowns
>       4515 =C2=B1 14%    +205.1%      13779 =C2=B1  4%  interrupts.CPU118=
.CAL:Function_call_interrupts
>     555362          +407.8%    2820248        interrupts.CPU118.LOC:Local=
_timer_interrupts
>       7879 =C2=B1 22%     -86.4%       1068 =C2=B1 23%  interrupts.CPU118=
.NMI:Non-maskable_interrupts
>       7879 =C2=B1 22%     -86.4%       1068 =C2=B1 23%  interrupts.CPU118=
.PMI:Performance_monitoring_interrupts
>       8087 =C2=B1  3%   +2230.2%     188465        interrupts.CPU118.RES:=
Rescheduling_interrupts
>       4.40 =C2=B1 84%   +2240.9%     103.00 =C2=B1 12%  interrupts.CPU118=
.TLB:TLB_shootdowns
>       4517 =C2=B1 14%    +204.5%      13755 =C2=B1  4%  interrupts.CPU119=
.CAL:Function_call_interrupts
>     555082          +408.1%    2820283        interrupts.CPU119.LOC:Local=
_timer_interrupts
>       7860 =C2=B1 22%     -90.8%     725.33        interrupts.CPU119.NMI:=
Non-maskable_interrupts
>       7860 =C2=B1 22%     -90.8%     725.33        interrupts.CPU119.PMI:=
Performance_monitoring_interrupts
>       8037 =C2=B1  3%   +2249.6%     188846        interrupts.CPU119.RES:=
Rescheduling_interrupts
>       7.40 =C2=B1 86%   +3877.5%     294.33 =C2=B1 51%  interrupts.CPU119=
.TLB:TLB_shootdowns
>     461.40 =C2=B1 63%    +533.1%       2921 =C2=B1 67%  interrupts.CPU12.=
34:PCI-MSI.524292-edge.eth0-TxRx-3
>       4515 =C2=B1 13%    +205.1%      13775 =C2=B1  4%  interrupts.CPU12.=
CAL:Function_call_interrupts
>     555665          +407.5%    2820270        interrupts.CPU12.LOC:Local_=
timer_interrupts
>       7865 =C2=B1 22%     -87.1%       1017 =C2=B1 37%  interrupts.CPU12.=
NMI:Non-maskable_interrupts
>       7865 =C2=B1 22%     -87.1%       1017 =C2=B1 37%  interrupts.CPU12.=
PMI:Performance_monitoring_interrupts
>       7981 =C2=B1  2%   +2289.6%     190722        interrupts.CPU12.RES:R=
escheduling_interrupts
>       4563 =C2=B1 14%    +203.6%      13854 =C2=B1  6%  interrupts.CPU120=
.CAL:Function_call_interrupts
>     554867          +408.2%    2819581        interrupts.CPU120.LOC:Local=
_timer_interrupts
>       7857 =C2=B1 22%     -93.2%     532.67 =C2=B1 14%  interrupts.CPU120=
.NMI:Non-maskable_interrupts
>       7857 =C2=B1 22%     -93.2%     532.67 =C2=B1 14%  interrupts.CPU120=
.PMI:Performance_monitoring_interrupts
>       8010 =C2=B1  4%   +2299.4%     192194        interrupts.CPU120.RES:=
Rescheduling_interrupts
>       2.60 =C2=B1 99%   +3425.6%      91.67 =C2=B1 34%  interrupts.CPU120=
.TLB:TLB_shootdowns
>       4546 =C2=B1 14%    +207.3%      13971 =C2=B1  4%  interrupts.CPU121=
.CAL:Function_call_interrupts
>     554308          +408.7%    2819603        interrupts.CPU121.LOC:Local=
_timer_interrupts
>       7873 =C2=B1 22%     -89.5%     829.33 =C2=B1 31%  interrupts.CPU121=
.NMI:Non-maskable_interrupts
>       7873 =C2=B1 22%     -89.5%     829.33 =C2=B1 31%  interrupts.CPU121=
.PMI:Performance_monitoring_interrupts
>       8064 =C2=B1  2%   +2285.8%     192387        interrupts.CPU121.RES:=
Rescheduling_interrupts
>       0.80 =C2=B1 93%  +11983.3%      96.67 =C2=B1 22%  interrupts.CPU121=
.TLB:TLB_shootdowns
>       4547 =C2=B1 14%    +207.5%      13984 =C2=B1  4%  interrupts.CPU122=
.CAL:Function_call_interrupts
>     554847          +408.2%    2819879        interrupts.CPU122.LOC:Local=
_timer_interrupts
>       7874 =C2=B1 22%     -91.8%     643.00 =C2=B1 39%  interrupts.CPU122=
.NMI:Non-maskable_interrupts
>       7874 =C2=B1 22%     -91.8%     643.00 =C2=B1 39%  interrupts.CPU122=
.PMI:Performance_monitoring_interrupts
>       8152 =C2=B1  5%   +2257.2%     192171        interrupts.CPU122.RES:=
Rescheduling_interrupts
>       1.40 =C2=B1 72%   +6638.1%      94.33 =C2=B1  9%  interrupts.CPU122=
.TLB:TLB_shootdowns
>       4557 =C2=B1 14%    +206.6%      13971 =C2=B1  4%  interrupts.CPU123=
.CAL:Function_call_interrupts
>     554596          +408.4%    2819512        interrupts.CPU123.LOC:Local=
_timer_interrupts
>       7859 =C2=B1 22%     -91.7%     649.67 =C2=B1 24%  interrupts.CPU123=
.NMI:Non-maskable_interrupts
>       7859 =C2=B1 22%     -91.7%     649.67 =C2=B1 24%  interrupts.CPU123=
.PMI:Performance_monitoring_interrupts
>       8041 =C2=B1  5%   +2285.0%     191779        interrupts.CPU123.RES:=
Rescheduling_interrupts
>       1.80 =C2=B1 88%   +4585.2%      84.33 =C2=B1 14%  interrupts.CPU123=
.TLB:TLB_shootdowns
>       4561 =C2=B1 14%    +206.2%      13967 =C2=B1  4%  interrupts.CPU124=
.CAL:Function_call_interrupts
>     554563          +408.4%    2819651        interrupts.CPU124.LOC:Local=
_timer_interrupts
>       7864 =C2=B1 22%     -93.3%     525.00 =C2=B1 18%  interrupts.CPU124=
.NMI:Non-maskable_interrupts
>       7864 =C2=B1 22%     -93.3%     525.00 =C2=B1 18%  interrupts.CPU124=
.PMI:Performance_monitoring_interrupts
>       8108 =C2=B1  2%   +2269.9%     192163        interrupts.CPU124.RES:=
Rescheduling_interrupts
>       1.20 =C2=B1 81%   +7538.9%      91.67 =C2=B1 24%  interrupts.CPU124=
.TLB:TLB_shootdowns
>       4560 =C2=B1 14%    +206.0%      13956 =C2=B1  4%  interrupts.CPU125=
.CAL:Function_call_interrupts
>     554767          +408.2%    2819571        interrupts.CPU125.LOC:Local=
_timer_interrupts
>       7869 =C2=B1 22%     -92.4%     595.33 =C2=B1 30%  interrupts.CPU125=
.NMI:Non-maskable_interrupts
>       7869 =C2=B1 22%     -92.4%     595.33 =C2=B1 30%  interrupts.CPU125=
.PMI:Performance_monitoring_interrupts
>       8042 =C2=B1  4%   +2286.9%     191964        interrupts.CPU125.RES:=
Rescheduling_interrupts
>       4552 =C2=B1 14%    +203.5%      13815 =C2=B1  4%  interrupts.CPU126=
.CAL:Function_call_interrupts
>     554530          +408.5%    2819550        interrupts.CPU126.LOC:Local=
_timer_interrupts
>       7863 =C2=B1 22%     -87.4%     991.00 =C2=B1 47%  interrupts.CPU126=
.NMI:Non-maskable_interrupts
>       7863 =C2=B1 22%     -87.4%     991.00 =C2=B1 47%  interrupts.CPU126=
.PMI:Performance_monitoring_interrupts
>       8192 =C2=B1  3%   +2245.2%     192117        interrupts.CPU126.RES:=
Rescheduling_interrupts
>       1.00 =C2=B1 63%   +9400.0%      95.00 =C2=B1  4%  interrupts.CPU126=
.TLB:TLB_shootdowns
>       4550 =C2=B1 14%    +204.2%      13842 =C2=B1  4%  interrupts.CPU127=
.CAL:Function_call_interrupts
>     554567          +408.4%    2819645        interrupts.CPU127.LOC:Local=
_timer_interrupts
>       7872 =C2=B1 22%     -88.6%     900.33 =C2=B1 33%  interrupts.CPU127=
.NMI:Non-maskable_interrupts
>       7872 =C2=B1 22%     -88.6%     900.33 =C2=B1 33%  interrupts.CPU127=
.PMI:Performance_monitoring_interrupts
>       8110 =C2=B1  3%   +2267.4%     192008        interrupts.CPU127.RES:=
Rescheduling_interrupts
>       4560 =C2=B1 13%    +203.8%      13852 =C2=B1  4%  interrupts.CPU128=
.CAL:Function_call_interrupts
>     554645          +408.4%    2819781        interrupts.CPU128.LOC:Local=
_timer_interrupts
>       7876 =C2=B1 22%     -93.5%     512.33 =C2=B1 21%  interrupts.CPU128=
.NMI:Non-maskable_interrupts
>       7876 =C2=B1 22%     -93.5%     512.33 =C2=B1 21%  interrupts.CPU128=
.PMI:Performance_monitoring_interrupts
>       7876         +2330.2%     191401        interrupts.CPU128.RES:Resch=
eduling_interrupts
>       4552 =C2=B1 14%    +204.1%      13844 =C2=B1  4%  interrupts.CPU129=
.CAL:Function_call_interrupts
>     554550          +408.5%    2819633        interrupts.CPU129.LOC:Local=
_timer_interrupts
>       6995 =C2=B1 30%     -86.5%     943.67 =C2=B1 54%  interrupts.CPU129=
.NMI:Non-maskable_interrupts
>       6995 =C2=B1 30%     -86.5%     943.67 =C2=B1 54%  interrupts.CPU129=
.PMI:Performance_monitoring_interrupts
>       7992 =C2=B1  2%   +2291.0%     191087        interrupts.CPU129.RES:=
Rescheduling_interrupts
>       4462 =C2=B1 16%    +207.9%      13740 =C2=B1  4%  interrupts.CPU13.=
CAL:Function_call_interrupts
>     555195          +408.0%    2820184        interrupts.CPU13.LOC:Local_=
timer_interrupts
>       8731           -89.2%     945.00 =C2=B1 21%  interrupts.CPU13.NMI:N=
on-maskable_interrupts
>       8731           -89.2%     945.00 =C2=B1 21%  interrupts.CPU13.PMI:P=
erformance_monitoring_interrupts
>       8176 =C2=B1  3%   +2238.6%     191208        interrupts.CPU13.RES:R=
escheduling_interrupts
>       4560 =C2=B1 14%    +204.9%      13906 =C2=B1  4%  interrupts.CPU130=
.CAL:Function_call_interrupts
>     554575          +408.4%    2819550        interrupts.CPU130.LOC:Local=
_timer_interrupts
>       7879 =C2=B1 22%     -93.2%     539.67 =C2=B1 21%  interrupts.CPU130=
.NMI:Non-maskable_interrupts
>       7879 =C2=B1 22%     -93.2%     539.67 =C2=B1 21%  interrupts.CPU130=
.PMI:Performance_monitoring_interrupts
>       7892 =C2=B1  5%   +2323.8%     191288        interrupts.CPU130.RES:=
Rescheduling_interrupts
>       4564 =C2=B1 14%    +204.3%      13887 =C2=B1  4%  interrupts.CPU131=
.CAL:Function_call_interrupts
>     554560          +408.4%    2819535        interrupts.CPU131.LOC:Local=
_timer_interrupts
>       7004 =C2=B1 30%     -91.5%     596.67 =C2=B1 13%  interrupts.CPU131=
.NMI:Non-maskable_interrupts
>       7004 =C2=B1 30%     -91.5%     596.67 =C2=B1 13%  interrupts.CPU131=
.PMI:Performance_monitoring_interrupts
>       7862         +2332.3%     191225        interrupts.CPU131.RES:Resch=
eduling_interrupts
>       4564 =C2=B1 14%    +204.5%      13898 =C2=B1  4%  interrupts.CPU132=
.CAL:Function_call_interrupts
>     554605          +408.4%    2819554        interrupts.CPU132.LOC:Local=
_timer_interrupts
>       7002 =C2=B1 30%     -90.6%     660.67 =C2=B1 13%  interrupts.CPU132=
.NMI:Non-maskable_interrupts
>       7002 =C2=B1 30%     -90.6%     660.67 =C2=B1 13%  interrupts.CPU132=
.PMI:Performance_monitoring_interrupts
>       8082 =C2=B1  4%   +2269.3%     191499        interrupts.CPU132.RES:=
Rescheduling_interrupts
>       1.40 =C2=B1 72%   +6281.0%      89.33 =C2=B1 20%  interrupts.CPU132=
.TLB:TLB_shootdowns
>       4565 =C2=B1 14%    +204.5%      13901 =C2=B1  4%  interrupts.CPU133=
.CAL:Function_call_interrupts
>     554617          +408.4%    2819573        interrupts.CPU133.LOC:Local=
_timer_interrupts
>       6996 =C2=B1 30%     -92.0%     562.33 =C2=B1 36%  interrupts.CPU133=
.NMI:Non-maskable_interrupts
>       6996 =C2=B1 30%     -92.0%     562.33 =C2=B1 36%  interrupts.CPU133=
.PMI:Performance_monitoring_interrupts
>       7999         +2295.0%     191578        interrupts.CPU133.RES:Resch=
eduling_interrupts
>       2.00 =C2=B1126%   +4083.3%      83.67 =C2=B1 15%  interrupts.CPU133=
.TLB:TLB_shootdowns
>       4417 =C2=B1 13%    +214.5%      13891 =C2=B1  4%  interrupts.CPU134=
.CAL:Function_call_interrupts
>     554641          +408.4%    2819648        interrupts.CPU134.LOC:Local=
_timer_interrupts
>       6988 =C2=B1 30%     -91.3%     605.33 =C2=B1 46%  interrupts.CPU134=
.NMI:Non-maskable_interrupts
>       6988 =C2=B1 30%     -91.3%     605.33 =C2=B1 46%  interrupts.CPU134=
.PMI:Performance_monitoring_interrupts
>       7844 =C2=B1  4%   +2336.5%     191121        interrupts.CPU134.RES:=
Rescheduling_interrupts
>       4.40 =C2=B1 42%   +1900.0%      88.00 =C2=B1 10%  interrupts.CPU134=
.TLB:TLB_shootdowns
>       4564 =C2=B1 14%    +204.3%      13889 =C2=B1  4%  interrupts.CPU135=
.CAL:Function_call_interrupts
>     554553          +408.4%    2819610        interrupts.CPU135.LOC:Local=
_timer_interrupts
>       6987 =C2=B1 30%     -93.6%     449.67 =C2=B1 35%  interrupts.CPU135=
.NMI:Non-maskable_interrupts
>       6987 =C2=B1 30%     -93.6%     449.67 =C2=B1 35%  interrupts.CPU135=
.PMI:Performance_monitoring_interrupts
>       8039 =C2=B1  2%   +2275.5%     190977        interrupts.CPU135.RES:=
Rescheduling_interrupts
>       1.80 =C2=B1118%   +4585.2%      84.33 =C2=B1 14%  interrupts.CPU135=
.TLB:TLB_shootdowns
>       4567 =C2=B1 14%    +204.6%      13913 =C2=B1  5%  interrupts.CPU136=
.CAL:Function_call_interrupts
>     554716          +408.3%    2819614        interrupts.CPU136.LOC:Local=
_timer_interrupts
>       7001 =C2=B1 30%     -87.8%     855.33 =C2=B1 47%  interrupts.CPU136=
.NMI:Non-maskable_interrupts
>       7001 =C2=B1 30%     -87.8%     855.33 =C2=B1 47%  interrupts.CPU136=
.PMI:Performance_monitoring_interrupts
>       8003 =C2=B1  2%   +2279.8%     190463        interrupts.CPU136.RES:=
Rescheduling_interrupts
>       2.00 =C2=B1 77%   +4600.0%      94.00 =C2=B1  7%  interrupts.CPU136=
.TLB:TLB_shootdowns
>       4566 =C2=B1 14%    +204.4%      13899 =C2=B1  5%  interrupts.CPU137=
.CAL:Function_call_interrupts
>     554572          +408.4%    2819530        interrupts.CPU137.LOC:Local=
_timer_interrupts
>       6995 =C2=B1 30%     -88.1%     834.67 =C2=B1 43%  interrupts.CPU137=
.NMI:Non-maskable_interrupts
>       6995 =C2=B1 30%     -88.1%     834.67 =C2=B1 43%  interrupts.CPU137=
.PMI:Performance_monitoring_interrupts
>       7684 =C2=B1  4%   +2382.1%     190728        interrupts.CPU137.RES:=
Rescheduling_interrupts
>       4.80 =C2=B1128%   +1816.7%      92.00 =C2=B1 21%  interrupts.CPU137=
.TLB:TLB_shootdowns
>       4566 =C2=B1 14%    +205.6%      13954 =C2=B1  4%  interrupts.CPU138=
.CAL:Function_call_interrupts
>     554716          +408.3%    2819569        interrupts.CPU138.LOC:Local=
_timer_interrupts
>       7890 =C2=B1 22%     -91.8%     647.67 =C2=B1 28%  interrupts.CPU138=
.NMI:Non-maskable_interrupts
>       7890 =C2=B1 22%     -91.8%     647.67 =C2=B1 28%  interrupts.CPU138=
.PMI:Performance_monitoring_interrupts
>       7995 =C2=B1  5%   +2281.0%     190383        interrupts.CPU138.RES:=
Rescheduling_interrupts
>       2.20 =C2=B1 78%   +5021.2%     112.67 =C2=B1 32%  interrupts.CPU138=
.TLB:TLB_shootdowns
>       4602 =C2=B1 14%    +202.8%      13936 =C2=B1  4%  interrupts.CPU139=
.CAL:Function_call_interrupts
>     554662          +408.3%    2819580        interrupts.CPU139.LOC:Local=
_timer_interrupts
>       7866 =C2=B1 22%     -93.9%     478.33 =C2=B1  9%  interrupts.CPU139=
.NMI:Non-maskable_interrupts
>       7866 =C2=B1 22%     -93.9%     478.33 =C2=B1  9%  interrupts.CPU139=
.PMI:Performance_monitoring_interrupts
>       7936 =C2=B1  3%   +2298.9%     190377        interrupts.CPU139.RES:=
Rescheduling_interrupts
>       5.60 =C2=B1110%   +1513.1%      90.33 =C2=B1  8%  interrupts.CPU139=
.TLB:TLB_shootdowns
>       4436 =C2=B1 13%    +210.0%      13753 =C2=B1  4%  interrupts.CPU14.=
CAL:Function_call_interrupts
>     555101          +408.0%    2820186        interrupts.CPU14.LOC:Local_=
timer_interrupts
>       8724           -87.4%       1102 =C2=B1 47%  interrupts.CPU14.NMI:N=
on-maskable_interrupts
>       8724           -87.4%       1102 =C2=B1 47%  interrupts.CPU14.PMI:P=
erformance_monitoring_interrupts
>       7779 =C2=B1  4%   +2355.6%     191038        interrupts.CPU14.RES:R=
escheduling_interrupts
>       4562 =C2=B1 14%    +208.5%      14077 =C2=B1  6%  interrupts.CPU140=
.CAL:Function_call_interrupts
>     554560          +408.5%    2819683        interrupts.CPU140.LOC:Local=
_timer_interrupts
>       7853 =C2=B1 22%     -90.4%     750.33 =C2=B1 26%  interrupts.CPU140=
.NMI:Non-maskable_interrupts
>       7853 =C2=B1 22%     -90.4%     750.33 =C2=B1 26%  interrupts.CPU140=
.PMI:Performance_monitoring_interrupts
>       8046 =C2=B1  5%   +2264.6%     190257        interrupts.CPU140.RES:=
Rescheduling_interrupts
>       4.20 =C2=B1140%   +2439.7%     106.67 =C2=B1 16%  interrupts.CPU140=
.TLB:TLB_shootdowns
>       4563 =C2=B1 14%    +208.2%      14065 =C2=B1  6%  interrupts.CPU141=
.CAL:Function_call_interrupts
>     554688          +408.3%    2819558        interrupts.CPU141.LOC:Local=
_timer_interrupts
>       7865 =C2=B1 22%     -90.9%     717.00 =C2=B1 37%  interrupts.CPU141=
.NMI:Non-maskable_interrupts
>       7865 =C2=B1 22%     -90.9%     717.00 =C2=B1 37%  interrupts.CPU141=
.PMI:Performance_monitoring_interrupts
>       8219 =C2=B1  3%   +2214.6%     190238        interrupts.CPU141.RES:=
Rescheduling_interrupts
>       6.60 =C2=B1132%   +1248.5%      89.00 =C2=B1 27%  interrupts.CPU141=
.TLB:TLB_shootdowns
>       4561 =C2=B1 14%    +208.1%      14054 =C2=B1  6%  interrupts.CPU142=
.CAL:Function_call_interrupts
>     554535          +408.5%    2819570        interrupts.CPU142.LOC:Local=
_timer_interrupts
>       7861 =C2=B1 22%     -92.0%     626.00 =C2=B1 52%  interrupts.CPU142=
.NMI:Non-maskable_interrupts
>       7861 =C2=B1 22%     -92.0%     626.00 =C2=B1 52%  interrupts.CPU142=
.PMI:Performance_monitoring_interrupts
>       8079 =C2=B1  2%   +2255.0%     190280        interrupts.CPU142.RES:=
Rescheduling_interrupts
>       1.40 =C2=B1 72%   +7042.9%     100.00 =C2=B1 21%  interrupts.CPU142=
.TLB:TLB_shootdowns
>       4571 =C2=B1 14%    +206.5%      14011 =C2=B1  6%  interrupts.CPU143=
.CAL:Function_call_interrupts
>     554921          +408.1%    2819563        interrupts.CPU143.LOC:Local=
_timer_interrupts
>       7870 =C2=B1 22%     -92.3%     609.33 =C2=B1 20%  interrupts.CPU143=
.NMI:Non-maskable_interrupts
>       7870 =C2=B1 22%     -92.3%     609.33 =C2=B1 20%  interrupts.CPU143=
.PMI:Performance_monitoring_interrupts
>       7927 =C2=B1  4%   +2300.2%     190275        interrupts.CPU143.RES:=
Rescheduling_interrupts
>       7.40 =C2=B1150%   +4368.5%     330.67 =C2=B1 15%  interrupts.CPU143=
.TLB:TLB_shootdowns
>       4533 =C2=B1 14%    +198.5%      13533 =C2=B1  6%  interrupts.CPU144=
.CAL:Function_call_interrupts
>     554661          +408.4%    2820083        interrupts.CPU144.LOC:Local=
_timer_interrupts
>       8740           -87.3%       1108 =C2=B1 18%  interrupts.CPU144.NMI:=
Non-maskable_interrupts
>       8740           -87.3%       1108 =C2=B1 18%  interrupts.CPU144.PMI:=
Performance_monitoring_interrupts
>       7795 =C2=B1  2%   +2379.5%     193293        interrupts.CPU144.RES:=
Rescheduling_interrupts
>       3.20 =C2=B1 50%   +2452.1%      81.67 =C2=B1 21%  interrupts.CPU144=
.TLB:TLB_shootdowns
>       4531 =C2=B1 14%    +200.4%      13610 =C2=B1  6%  interrupts.CPU145=
.CAL:Function_call_interrupts
>     554512          +408.5%    2819728        interrupts.CPU145.LOC:Local=
_timer_interrupts
>       8733           -91.6%     733.00 =C2=B1 24%  interrupts.CPU145.NMI:=
Non-maskable_interrupts
>       8733           -91.6%     733.00 =C2=B1 24%  interrupts.CPU145.PMI:=
Performance_monitoring_interrupts
>       8090 =C2=B1  2%   +2289.1%     193295        interrupts.CPU145.RES:=
Rescheduling_interrupts
>       0.60 =C2=B1133%  +15400.0%      93.00 =C2=B1 19%  interrupts.CPU145=
.TLB:TLB_shootdowns
>       4529 =C2=B1 14%    +204.5%      13790 =C2=B1  5%  interrupts.CPU146=
.CAL:Function_call_interrupts
>     554635          +408.4%    2819827        interrupts.CPU146.LOC:Local=
_timer_interrupts
>       8734           -92.0%     696.67 =C2=B1  9%  interrupts.CPU146.NMI:=
Non-maskable_interrupts
>       8734           -92.0%     696.67 =C2=B1  9%  interrupts.CPU146.PMI:=
Performance_monitoring_interrupts
>       8130 =C2=B1  3%   +2272.4%     192888        interrupts.CPU146.RES:=
Rescheduling_interrupts
>       1.40 =C2=B1 72%   +6685.7%      95.00 =C2=B1  6%  interrupts.CPU146=
.TLB:TLB_shootdowns
>       4530 =C2=B1 14%    +205.4%      13836 =C2=B1  5%  interrupts.CPU147=
.CAL:Function_call_interrupts
>     554645          +408.4%    2819827        interrupts.CPU147.LOC:Local=
_timer_interrupts
>       8754           -91.6%     735.00 =C2=B1 18%  interrupts.CPU147.NMI:=
Non-maskable_interrupts
>       8754           -91.6%     735.00 =C2=B1 18%  interrupts.CPU147.PMI:=
Performance_monitoring_interrupts
>       8002 =C2=B1  3%   +2305.7%     192503        interrupts.CPU147.RES:=
Rescheduling_interrupts
>       4529 =C2=B1 14%    +200.6%      13615 =C2=B1  4%  interrupts.CPU148=
.CAL:Function_call_interrupts
>     554586          +408.4%    2819758        interrupts.CPU148.LOC:Local=
_timer_interrupts
>       8743           -91.6%     737.00 =C2=B1  8%  interrupts.CPU148.NMI:=
Non-maskable_interrupts
>       8743           -91.6%     737.00 =C2=B1  8%  interrupts.CPU148.PMI:=
Performance_monitoring_interrupts
>       8225 =C2=B1  2%   +2236.5%     192196        interrupts.CPU148.RES:=
Rescheduling_interrupts
>       4568 =C2=B1 14%    +200.8%      13740 =C2=B1  6%  interrupts.CPU149=
.CAL:Function_call_interrupts
>     555131          +407.9%    2819760        interrupts.CPU149.LOC:Local=
_timer_interrupts
>       8723           -91.3%     757.67 =C2=B1 16%  interrupts.CPU149.NMI:=
Non-maskable_interrupts
>       8723           -91.3%     757.67 =C2=B1 16%  interrupts.CPU149.PMI:=
Performance_monitoring_interrupts
>       8051 =C2=B1  2%   +2281.3%     191734        interrupts.CPU149.RES:=
Rescheduling_interrupts
>       4513 =C2=B1 13%    +204.6%      13746 =C2=B1  4%  interrupts.CPU15.=
CAL:Function_call_interrupts
>     555347          +407.9%    2820476        interrupts.CPU15.LOC:Local_=
timer_interrupts
>       8727           -89.4%     921.67 =C2=B1 12%  interrupts.CPU15.NMI:N=
on-maskable_interrupts
>       8727           -89.4%     921.67 =C2=B1 12%  interrupts.CPU15.PMI:P=
erformance_monitoring_interrupts
>       8093 =C2=B1  3%   +2248.1%     190030        interrupts.CPU15.RES:R=
escheduling_interrupts
>       3.00 =C2=B1117%   +2988.9%      92.67 =C2=B1 12%  interrupts.CPU15.=
TLB:TLB_shootdowns
>       4519 =C2=B1 14%    +202.8%      13686 =C2=B1  4%  interrupts.CPU150=
.CAL:Function_call_interrupts
>     554705          +408.3%    2819767        interrupts.CPU150.LOC:Local=
_timer_interrupts
>       8738           -91.4%     753.00 =C2=B1 17%  interrupts.CPU150.NMI:=
Non-maskable_interrupts
>       8738           -91.4%     753.00 =C2=B1 17%  interrupts.CPU150.PMI:=
Performance_monitoring_interrupts
>       8140 =C2=B1  2%   +2264.8%     192506        interrupts.CPU150.RES:=
Rescheduling_interrupts
>       0.40 =C2=B1122%  +24233.3%      97.33 =C2=B1 15%  interrupts.CPU150=
.TLB:TLB_shootdowns
>       4515 =C2=B1 14%    +202.8%      13674 =C2=B1  5%  interrupts.CPU151=
.CAL:Function_call_interrupts
>     554757          +408.3%    2819717        interrupts.CPU151.LOC:Local=
_timer_interrupts
>       8740           -90.4%     842.00 =C2=B1 25%  interrupts.CPU151.NMI:=
Non-maskable_interrupts
>       8740           -90.4%     842.00 =C2=B1 25%  interrupts.CPU151.PMI:=
Performance_monitoring_interrupts
>       8197 =C2=B1  2%   +2246.9%     192394        interrupts.CPU151.RES:=
Rescheduling_interrupts
>       2.20 =C2=B1 88%   +4203.0%      94.67 =C2=B1 20%  interrupts.CPU151=
.TLB:TLB_shootdowns
>       4516 =C2=B1 14%    +207.4%      13883 =C2=B1  4%  interrupts.CPU152=
.CAL:Function_call_interrupts
>     554530          +408.5%    2819772        interrupts.CPU152.LOC:Local=
_timer_interrupts
>       8752           -90.7%     816.67 =C2=B1 31%  interrupts.CPU152.NMI:=
Non-maskable_interrupts
>       8752           -90.7%     816.67 =C2=B1 31%  interrupts.CPU152.PMI:=
Performance_monitoring_interrupts
>       8141 =C2=B1  2%   +2261.7%     192267        interrupts.CPU152.RES:=
Rescheduling_interrupts
>       4517 =C2=B1 14%    +206.7%      13853 =C2=B1  4%  interrupts.CPU153=
.CAL:Function_call_interrupts
>     554597          +408.4%    2819772        interrupts.CPU153.LOC:Local=
_timer_interrupts
>       8723           -91.5%     744.00 =C2=B1 31%  interrupts.CPU153.NMI:=
Non-maskable_interrupts
>       8723           -91.5%     744.00 =C2=B1 31%  interrupts.CPU153.PMI:=
Performance_monitoring_interrupts
>       8022 =C2=B1  4%   +2292.1%     191892        interrupts.CPU153.RES:=
Rescheduling_interrupts
>       1.80 =C2=B1146%   +4566.7%      84.00 =C2=B1 17%  interrupts.CPU153=
.TLB:TLB_shootdowns
>       4517 =C2=B1 14%    +203.0%      13689 =C2=B1  4%  interrupts.CPU154=
.CAL:Function_call_interrupts
>     554584          +408.4%    2819592        interrupts.CPU154.LOC:Local=
_timer_interrupts
>       8730           -92.5%     655.00 =C2=B1 37%  interrupts.CPU154.NMI:=
Non-maskable_interrupts
>       8730           -92.5%     655.00 =C2=B1 37%  interrupts.CPU154.PMI:=
Performance_monitoring_interrupts
>       8066 =C2=B1  2%   +2281.1%     192070        interrupts.CPU154.RES:=
Rescheduling_interrupts
>       4516 =C2=B1 14%    +207.6%      13893 =C2=B1  4%  interrupts.CPU155=
.CAL:Function_call_interrupts
>     554514          +408.5%    2819732        interrupts.CPU155.LOC:Local=
_timer_interrupts
>       8737           -88.2%       1031 =C2=B1 20%  interrupts.CPU155.NMI:=
Non-maskable_interrupts
>       8737           -88.2%       1031 =C2=B1 20%  interrupts.CPU155.PMI:=
Performance_monitoring_interrupts
>       8225 =C2=B1  2%   +2240.5%     192525        interrupts.CPU155.RES:=
Rescheduling_interrupts
>       1.00 =C2=B1 89%   +8200.0%      83.00 =C2=B1 14%  interrupts.CPU155=
.TLB:TLB_shootdowns
>       4520 =C2=B1 14%    +206.6%      13861 =C2=B1  5%  interrupts.CPU156=
.CAL:Function_call_interrupts
>     554640          +408.4%    2819785        interrupts.CPU156.LOC:Local=
_timer_interrupts
>       8739           -91.0%     787.33 =C2=B1 23%  interrupts.CPU156.NMI:=
Non-maskable_interrupts
>       8739           -91.0%     787.33 =C2=B1 23%  interrupts.CPU156.PMI:=
Performance_monitoring_interrupts
>       8043         +2291.8%     192373        interrupts.CPU156.RES:Resch=
eduling_interrupts
>       4.20 =C2=B1 83%   +2114.3%      93.00 =C2=B1 31%  interrupts.CPU156=
.TLB:TLB_shootdowns
>       4524 =C2=B1 14%    +205.3%      13812 =C2=B1  4%  interrupts.CPU157=
.CAL:Function_call_interrupts
>     554650          +408.4%    2819730        interrupts.CPU157.LOC:Local=
_timer_interrupts
>       8739           -90.5%     833.00 =C2=B1  7%  interrupts.CPU157.NMI:=
Non-maskable_interrupts
>       8739           -90.5%     833.00 =C2=B1  7%  interrupts.CPU157.PMI:=
Performance_monitoring_interrupts
>       7808 =C2=B1  2%   +2360.5%     192136        interrupts.CPU157.RES:=
Rescheduling_interrupts
>       1.00 =C2=B1 89%   +8933.3%      90.33 =C2=B1 10%  interrupts.CPU157=
.TLB:TLB_shootdowns
>       4523 =C2=B1 14%    +206.0%      13841 =C2=B1  4%  interrupts.CPU158=
.CAL:Function_call_interrupts
>     554587          +408.4%    2819719        interrupts.CPU158.LOC:Local=
_timer_interrupts
>       8736           -90.0%     872.00 =C2=B1  7%  interrupts.CPU158.NMI:=
Non-maskable_interrupts
>       8736           -90.0%     872.00 =C2=B1  7%  interrupts.CPU158.PMI:=
Performance_monitoring_interrupts
>       8141 =C2=B1  3%   +2258.8%     192045        interrupts.CPU158.RES:=
Rescheduling_interrupts
>       4519 =C2=B1 14%    +204.4%      13759 =C2=B1  4%  interrupts.CPU159=
.CAL:Function_call_interrupts
>     554815          +408.2%    2819699        interrupts.CPU159.LOC:Local=
_timer_interrupts
>       8743           -91.0%     790.00 =C2=B1 26%  interrupts.CPU159.NMI:=
Non-maskable_interrupts
>       8743           -91.0%     790.00 =C2=B1 26%  interrupts.CPU159.PMI:=
Performance_monitoring_interrupts
>       8163 =C2=B1  3%   +2244.3%     191375        interrupts.CPU159.RES:=
Rescheduling_interrupts
>       1.80 =C2=B1 64%   +5233.3%      96.00 =C2=B1  8%  interrupts.CPU159=
.TLB:TLB_shootdowns
>       4513 =C2=B1 13%    +204.9%      13764 =C2=B1  4%  interrupts.CPU16.=
CAL:Function_call_interrupts
>     554864          +408.3%    2820297        interrupts.CPU16.LOC:Local_=
timer_interrupts
>       8743           -87.4%       1097 =C2=B1 41%  interrupts.CPU16.NMI:N=
on-maskable_interrupts
>       8743           -87.4%       1097 =C2=B1 41%  interrupts.CPU16.PMI:P=
erformance_monitoring_interrupts
>       8131 =C2=B1  4%   +2237.6%     190067        interrupts.CPU16.RES:R=
escheduling_interrupts
>       1.80 =C2=B1 95%   +4400.0%      81.00 =C2=B1 18%  interrupts.CPU16.=
TLB:TLB_shootdowns
>       4524 =C2=B1 14%    +203.2%      13715 =C2=B1  4%  interrupts.CPU160=
.CAL:Function_call_interrupts
>     554578          +408.4%    2819718        interrupts.CPU160.LOC:Local=
_timer_interrupts
>       8731           -91.7%     722.00 =C2=B1 18%  interrupts.CPU160.NMI:=
Non-maskable_interrupts
>       8731           -91.7%     722.00 =C2=B1 18%  interrupts.CPU160.PMI:=
Performance_monitoring_interrupts
>       7932 =C2=B1  2%   +2312.6%     191367        interrupts.CPU160.RES:=
Rescheduling_interrupts
>       2.00 =C2=B1 70%   +5316.7%     108.33 =C2=B1 14%  interrupts.CPU160=
.TLB:TLB_shootdowns
>       4522 =C2=B1 14%    +205.2%      13802 =C2=B1  4%  interrupts.CPU161=
.CAL:Function_call_interrupts
>     554559          +408.5%    2819704        interrupts.CPU161.LOC:Local=
_timer_interrupts
>       8740           -92.0%     697.67 =C2=B1 21%  interrupts.CPU161.NMI:=
Non-maskable_interrupts
>       8740           -92.0%     697.67 =C2=B1 21%  interrupts.CPU161.PMI:=
Performance_monitoring_interrupts
>       8113 =C2=B1  2%   +2258.0%     191313        interrupts.CPU161.RES:=
Rescheduling_interrupts
>       4562 =C2=B1 14%    +205.8%      13950 =C2=B1  4%  interrupts.CPU162=
.CAL:Function_call_interrupts
>     554735          +408.3%    2819787        interrupts.CPU162.LOC:Local=
_timer_interrupts
>       8731           -88.6%     991.33 =C2=B1 28%  interrupts.CPU162.NMI:=
Non-maskable_interrupts
>       8731           -88.6%     991.33 =C2=B1 28%  interrupts.CPU162.PMI:=
Performance_monitoring_interrupts
>       7973 =C2=B1  3%   +2301.3%     191461        interrupts.CPU162.RES:=
Rescheduling_interrupts
>       4537 =C2=B1 14%    +203.8%      13785 =C2=B1  5%  interrupts.CPU163=
.CAL:Function_call_interrupts
>     554604          +408.4%    2819754        interrupts.CPU163.LOC:Local=
_timer_interrupts
>       8729           -91.3%     761.67 =C2=B1 12%  interrupts.CPU163.NMI:=
Non-maskable_interrupts
>       8729           -91.3%     761.67 =C2=B1 12%  interrupts.CPU163.PMI:=
Performance_monitoring_interrupts
>       8007 =C2=B1  5%   +2283.9%     190883        interrupts.CPU163.RES:=
Rescheduling_interrupts
>       5.20 =C2=B1152%   +1515.4%      84.00 =C2=B1 15%  interrupts.CPU163=
.TLB:TLB_shootdowns
>       4527 =C2=B1 14%    +203.4%      13736 =C2=B1  4%  interrupts.CPU164=
.CAL:Function_call_interrupts
>     554117          +408.9%    2819880        interrupts.CPU164.LOC:Local=
_timer_interrupts
>       8741           -92.0%     703.00 =C2=B1 23%  interrupts.CPU164.NMI:=
Non-maskable_interrupts
>       8741           -92.0%     703.00 =C2=B1 23%  interrupts.CPU164.PMI:=
Performance_monitoring_interrupts
>       8062 =C2=B1  3%   +2265.2%     190694        interrupts.CPU164.RES:=
Rescheduling_interrupts
>       6.00 =C2=B1167%   +1638.9%     104.33 =C2=B1 20%  interrupts.CPU164=
.TLB:TLB_shootdowns
>       4527 =C2=B1 14%    +203.3%      13731 =C2=B1  3%  interrupts.CPU165=
.CAL:Function_call_interrupts
>     554683          +408.4%    2819739        interrupts.CPU165.LOC:Local=
_timer_interrupts
>       8764           -90.0%     878.67 =C2=B1 18%  interrupts.CPU165.NMI:=
Non-maskable_interrupts
>       8764           -90.0%     878.67 =C2=B1 18%  interrupts.CPU165.PMI:=
Performance_monitoring_interrupts
>       8018 =C2=B1  2%   +2277.0%     190596        interrupts.CPU165.RES:=
Rescheduling_interrupts
>       7.60 =C2=B1 45%   +1145.6%      94.67 =C2=B1  6%  interrupts.CPU165=
.TLB:TLB_shootdowns
>       4542 =C2=B1 13%    +201.4%      13691 =C2=B1  3%  interrupts.CPU166=
.CAL:Function_call_interrupts
>     554637          +408.4%    2819722        interrupts.CPU166.LOC:Local=
_timer_interrupts
>       8745           -93.3%     585.67 =C2=B1  5%  interrupts.CPU166.NMI:=
Non-maskable_interrupts
>       8745           -93.3%     585.67 =C2=B1  5%  interrupts.CPU166.PMI:=
Performance_monitoring_interrupts
>       7925 =C2=B1  3%   +2298.9%     190116        interrupts.CPU166.RES:=
Rescheduling_interrupts
>       3.40 =C2=B1 54%   +3007.8%     105.67 =C2=B1  7%  interrupts.CPU166=
.TLB:TLB_shootdowns
>       4526 =C2=B1 14%    +203.3%      13728 =C2=B1  3%  interrupts.CPU167=
.CAL:Function_call_interrupts
>     554545          +408.5%    2819727        interrupts.CPU167.LOC:Local=
_timer_interrupts
>       8743           -90.2%     858.00 =C2=B1 46%  interrupts.CPU167.NMI:=
Non-maskable_interrupts
>       8743           -90.2%     858.00 =C2=B1 46%  interrupts.CPU167.PMI:=
Performance_monitoring_interrupts
>       8190 =C2=B1  4%   +2232.0%     191004        interrupts.CPU167.RES:=
Rescheduling_interrupts
>       7.00 =C2=B1 70%   +3609.5%     259.67 =C2=B1  2%  interrupts.CPU167=
.TLB:TLB_shootdowns
>       4566 =C2=B1 14%    +209.4%      14128 =C2=B1  3%  interrupts.CPU168=
.CAL:Function_call_interrupts
>     554848          +408.3%    2820323        interrupts.CPU168.LOC:Local=
_timer_interrupts
>       8738           -93.1%     602.33 =C2=B1 30%  interrupts.CPU168.NMI:=
Non-maskable_interrupts
>       8738           -93.1%     602.33 =C2=B1 30%  interrupts.CPU168.PMI:=
Performance_monitoring_interrupts
>       7804 =C2=B1  2%   +2333.5%     189920 =C2=B1  2%  interrupts.CPU168=
.RES:Rescheduling_interrupts
>       4563 =C2=B1 14%    +209.5%      14126 =C2=B1  3%  interrupts.CPU169=
.CAL:Function_call_interrupts
>     555373          +407.8%    2820235        interrupts.CPU169.LOC:Local=
_timer_interrupts
>       7867 =C2=B1 21%     -93.9%     482.33 =C2=B1 45%  interrupts.CPU169=
.NMI:Non-maskable_interrupts
>       7867 =C2=B1 21%     -93.9%     482.33 =C2=B1 45%  interrupts.CPU169=
.PMI:Performance_monitoring_interrupts
>       7907 =C2=B1  3%   +2312.5%     190755 =C2=B1  2%  interrupts.CPU169=
.RES:Rescheduling_interrupts
>       4516 =C2=B1 14%    +204.3%      13743 =C2=B1  4%  interrupts.CPU17.=
CAL:Function_call_interrupts
>     555270          +408.0%    2820560        interrupts.CPU17.LOC:Local_=
timer_interrupts
>       6976 =C2=B1 30%     -89.8%     713.67 =C2=B1 29%  interrupts.CPU17.=
NMI:Non-maskable_interrupts
>       6976 =C2=B1 30%     -89.8%     713.67 =C2=B1 29%  interrupts.CPU17.=
PMI:Performance_monitoring_interrupts
>       8129 =C2=B1  4%   +2242.0%     190399        interrupts.CPU17.RES:R=
escheduling_interrupts
>       4.20 =C2=B1 64%   +2154.0%      94.67 =C2=B1  6%  interrupts.CPU17.=
TLB:TLB_shootdowns
>       4563 =C2=B1 14%    +209.3%      14114 =C2=B1  3%  interrupts.CPU170=
.CAL:Function_call_interrupts
>     555220          +407.9%    2820054        interrupts.CPU170.LOC:Local=
_timer_interrupts
>       7857 =C2=B1 22%     -81.6%       1445 =C2=B1 93%  interrupts.CPU170=
.NMI:Non-maskable_interrupts
>       7857 =C2=B1 22%     -81.6%       1445 =C2=B1 93%  interrupts.CPU170=
.PMI:Performance_monitoring_interrupts
>       8151 =C2=B1  3%   +2223.8%     189422 =C2=B1  2%  interrupts.CPU170=
.RES:Rescheduling_interrupts
>       4550 =C2=B1 14%    +210.3%      14120 =C2=B1  3%  interrupts.CPU171=
.CAL:Function_call_interrupts
>     555144          +408.0%    2820092        interrupts.CPU171.LOC:Local=
_timer_interrupts
>       7872 =C2=B1 22%     -91.9%     636.33 =C2=B1 24%  interrupts.CPU171=
.NMI:Non-maskable_interrupts
>       7872 =C2=B1 22%     -91.9%     636.33 =C2=B1 24%  interrupts.CPU171=
.PMI:Performance_monitoring_interrupts
>       7994 =C2=B1  5%   +2256.7%     188410 =C2=B1  2%  interrupts.CPU171=
.RES:Rescheduling_interrupts
>       1.60 =C2=B1 63%   +4900.0%      80.00 =C2=B1 27%  interrupts.CPU171=
.TLB:TLB_shootdowns
>       4562 =C2=B1 14%    +209.4%      14117 =C2=B1  3%  interrupts.CPU172=
.CAL:Function_call_interrupts
>     555587          +407.6%    2820050        interrupts.CPU172.LOC:Local=
_timer_interrupts
>       7859 =C2=B1 22%     -93.0%     549.33 =C2=B1 17%  interrupts.CPU172=
.NMI:Non-maskable_interrupts
>       7859 =C2=B1 22%     -93.0%     549.33 =C2=B1 17%  interrupts.CPU172=
.PMI:Performance_monitoring_interrupts
>       8010 =C2=B1  3%   +2270.9%     189925 =C2=B1  2%  interrupts.CPU172=
.RES:Rescheduling_interrupts
>       4578 =C2=B1 13%    +208.0%      14102 =C2=B1  3%  interrupts.CPU173=
.CAL:Function_call_interrupts
>     554737          +408.4%    2820299        interrupts.CPU173.LOC:Local=
_timer_interrupts
>       7879 =C2=B1 22%     -94.4%     443.00 =C2=B1 26%  interrupts.CPU173=
.NMI:Non-maskable_interrupts
>       7879 =C2=B1 22%     -94.4%     443.00 =C2=B1 26%  interrupts.CPU173=
.PMI:Performance_monitoring_interrupts
>       8011         +2273.3%     190121 =C2=B1  2%  interrupts.CPU173.RES:=
Rescheduling_interrupts
>       3.00 =C2=B1 76%   +2477.8%      77.33 =C2=B1 24%  interrupts.CPU173=
.TLB:TLB_shootdowns
>       4609 =C2=B1 14%    +206.1%      14109 =C2=B1  3%  interrupts.CPU174=
.CAL:Function_call_interrupts
>     554936          +408.2%    2820412        interrupts.CPU174.LOC:Local=
_timer_interrupts
>       7867 =C2=B1 22%     -92.5%     588.33 =C2=B1 28%  interrupts.CPU174=
.NMI:Non-maskable_interrupts
>       7867 =C2=B1 22%     -92.5%     588.33 =C2=B1 28%  interrupts.CPU174=
.PMI:Performance_monitoring_interrupts
>       7901 =C2=B1  3%   +2288.3%     188709 =C2=B1  3%  interrupts.CPU174=
.RES:Rescheduling_interrupts
>       1.00 =C2=B1 63%   +8900.0%      90.00 =C2=B1 31%  interrupts.CPU174=
.TLB:TLB_shootdowns
>       4582 =C2=B1 13%    +207.7%      14101 =C2=B1  3%  interrupts.CPU175=
.CAL:Function_call_interrupts
>     554840          +408.3%    2820172        interrupts.CPU175.LOC:Local=
_timer_interrupts
>       6984 =C2=B1 30%     -93.0%     487.33 =C2=B1 15%  interrupts.CPU175=
.NMI:Non-maskable_interrupts
>       6984 =C2=B1 30%     -93.0%     487.33 =C2=B1 15%  interrupts.CPU175=
.PMI:Performance_monitoring_interrupts
>       7923 =C2=B1  2%   +2307.8%     190782 =C2=B1  2%  interrupts.CPU175=
.RES:Rescheduling_interrupts
>       4581 =C2=B1 13%    +207.2%      14076 =C2=B1  3%  interrupts.CPU176=
.CAL:Function_call_interrupts
>     554926          +408.2%    2820156        interrupts.CPU176.LOC:Local=
_timer_interrupts
>       7848 =C2=B1 22%     -95.4%     361.00 =C2=B1 13%  interrupts.CPU176=
.NMI:Non-maskable_interrupts
>       7848 =C2=B1 22%     -95.4%     361.00 =C2=B1 13%  interrupts.CPU176=
.PMI:Performance_monitoring_interrupts
>       7924 =C2=B1  2%   +2290.2%     189412 =C2=B1  2%  interrupts.CPU176=
.RES:Rescheduling_interrupts
>       0.60 =C2=B1133%  +13344.4%      80.67 =C2=B1 26%  interrupts.CPU176=
.TLB:TLB_shootdowns
>       4581 =C2=B1 13%    +209.1%      14162 =C2=B1  4%  interrupts.CPU177=
.CAL:Function_call_interrupts
>     554917          +408.2%    2820120        interrupts.CPU177.LOC:Local=
_timer_interrupts
>       7864 =C2=B1 22%     -93.3%     528.00 =C2=B1 25%  interrupts.CPU177=
.NMI:Non-maskable_interrupts
>       7864 =C2=B1 22%     -93.3%     528.00 =C2=B1 25%  interrupts.CPU177=
.PMI:Performance_monitoring_interrupts
>       7893 =C2=B1  3%   +2288.2%     188501 =C2=B1  2%  interrupts.CPU177=
.RES:Rescheduling_interrupts
>       4591 =C2=B1 13%    +208.6%      14167 =C2=B1  4%  interrupts.CPU178=
.CAL:Function_call_interrupts
>     555522          +407.6%    2820050        interrupts.CPU178.LOC:Local=
_timer_interrupts
>       7864 =C2=B1 22%     -95.6%     343.00 =C2=B1 14%  interrupts.CPU178=
.NMI:Non-maskable_interrupts
>       7864 =C2=B1 22%     -95.6%     343.00 =C2=B1 14%  interrupts.CPU178=
.PMI:Performance_monitoring_interrupts
>       7710 =C2=B1  3%   +2338.4%     188000 =C2=B1  2%  interrupts.CPU178=
.RES:Rescheduling_interrupts
>       4599 =C2=B1 13%    +209.2%      14221 =C2=B1  3%  interrupts.CPU179=
.CAL:Function_call_interrupts
>     554984          +408.2%    2820290        interrupts.CPU179.LOC:Local=
_timer_interrupts
>       7872 =C2=B1 22%     -92.6%     584.67 =C2=B1 67%  interrupts.CPU179=
.NMI:Non-maskable_interrupts
>       7872 =C2=B1 22%     -92.6%     584.67 =C2=B1 67%  interrupts.CPU179=
.PMI:Performance_monitoring_interrupts
>       7791 =C2=B1  2%   +2347.3%     190675        interrupts.CPU179.RES:=
Rescheduling_interrupts
>       4504 =C2=B1 14%    +207.5%      13851 =C2=B1  4%  interrupts.CPU18.=
CAL:Function_call_interrupts
>     555106          +408.1%    2820372        interrupts.CPU18.LOC:Local_=
timer_interrupts
>       6986 =C2=B1 30%     -79.8%       1411 =C2=B1 41%  interrupts.CPU18.=
NMI:Non-maskable_interrupts
>       6986 =C2=B1 30%     -79.8%       1411 =C2=B1 41%  interrupts.CPU18.=
PMI:Performance_monitoring_interrupts
>       7900 =C2=B1  3%   +2294.9%     189207 =C2=B1  2%  interrupts.CPU18.=
RES:Rescheduling_interrupts
>       3.40 =C2=B1128%   +2625.5%      92.67 =C2=B1 25%  interrupts.CPU18.=
TLB:TLB_shootdowns
>       4598 =C2=B1 13%    +209.0%      14211 =C2=B1  4%  interrupts.CPU180=
.CAL:Function_call_interrupts
>     554799          +408.4%    2820326        interrupts.CPU180.LOC:Local=
_timer_interrupts
>       7863 =C2=B1 22%     -91.8%     648.67 =C2=B1 43%  interrupts.CPU180=
.NMI:Non-maskable_interrupts
>       7863 =C2=B1 22%     -91.8%     648.67 =C2=B1 43%  interrupts.CPU180=
.PMI:Performance_monitoring_interrupts
>       7916 =C2=B1  4%   +2241.7%     185387 =C2=B1  4%  interrupts.CPU180=
.RES:Rescheduling_interrupts
>       2.40 =C2=B1 85%   +4413.9%     108.33 =C2=B1 41%  interrupts.CPU180=
.TLB:TLB_shootdowns
>       4598 =C2=B1 13%    +208.9%      14204 =C2=B1  4%  interrupts.CPU181=
.CAL:Function_call_interrupts
>     554943          +408.2%    2820174        interrupts.CPU181.LOC:Local=
_timer_interrupts
>       7864 =C2=B1 22%     -94.2%     454.00 =C2=B1 26%  interrupts.CPU181=
.NMI:Non-maskable_interrupts
>       7864 =C2=B1 22%     -94.2%     454.00 =C2=B1 26%  interrupts.CPU181=
.PMI:Performance_monitoring_interrupts
>       7969 =C2=B1  4%   +2268.6%     188764 =C2=B1  3%  interrupts.CPU181=
.RES:Rescheduling_interrupts
>       4610 =C2=B1 13%    +208.1%      14205 =C2=B1  4%  interrupts.CPU182=
.CAL:Function_call_interrupts
>     554934          +408.2%    2820304        interrupts.CPU182.LOC:Local=
_timer_interrupts
>       7859 =C2=B1 22%     -93.3%     526.00 =C2=B1 35%  interrupts.CPU182=
.NMI:Non-maskable_interrupts
>       7859 =C2=B1 22%     -93.3%     526.00 =C2=B1 35%  interrupts.CPU182=
.PMI:Performance_monitoring_interrupts
>       7853 =C2=B1  5%   +2290.5%     187729 =C2=B1  2%  interrupts.CPU182=
.RES:Rescheduling_interrupts
>       2.20 =C2=B1 72%   +3460.6%      78.33 =C2=B1 29%  interrupts.CPU182=
.TLB:TLB_shootdowns
>       4588 =C2=B1 13%    +209.1%      14183 =C2=B1  4%  interrupts.CPU183=
.CAL:Function_call_interrupts
>     555162          +408.0%    2820136        interrupts.CPU183.LOC:Local=
_timer_interrupts
>       7871 =C2=B1 22%     -92.4%     597.00 =C2=B1 61%  interrupts.CPU183=
.NMI:Non-maskable_interrupts
>       7871 =C2=B1 22%     -92.4%     597.00 =C2=B1 61%  interrupts.CPU183=
.PMI:Performance_monitoring_interrupts
>       8175 =C2=B1  4%   +2215.3%     189276        interrupts.CPU183.RES:=
Rescheduling_interrupts
>       4589 =C2=B1 13%    +209.2%      14193 =C2=B1  4%  interrupts.CPU184=
.CAL:Function_call_interrupts
>     555171          +407.9%    2819964        interrupts.CPU184.LOC:Local=
_timer_interrupts
>       7867 =C2=B1 22%     -92.7%     577.33 =C2=B1 47%  interrupts.CPU184=
.NMI:Non-maskable_interrupts
>       7867 =C2=B1 22%     -92.7%     577.33 =C2=B1 47%  interrupts.CPU184=
.PMI:Performance_monitoring_interrupts
>       8042 =C2=B1  2%   +2237.8%     188019 =C2=B1  2%  interrupts.CPU184=
.RES:Rescheduling_interrupts
>       4601 =C2=B1 13%    +208.3%      14183 =C2=B1  4%  interrupts.CPU185=
.CAL:Function_call_interrupts
>     554893          +408.2%    2820227        interrupts.CPU185.LOC:Local=
_timer_interrupts
>       7874 =C2=B1 22%     -92.2%     614.67 =C2=B1 62%  interrupts.CPU185=
.NMI:Non-maskable_interrupts
>       7874 =C2=B1 22%     -92.2%     614.67 =C2=B1 62%  interrupts.CPU185=
.PMI:Performance_monitoring_interrupts
>       7868 =C2=B1  4%   +2297.5%     188656 =C2=B1  2%  interrupts.CPU185=
.RES:Rescheduling_interrupts
>       4594 =C2=B1 13%    +208.5%      14174 =C2=B1  4%  interrupts.CPU186=
.CAL:Function_call_interrupts
>     555272          +407.9%    2819951        interrupts.CPU186.LOC:Local=
_timer_interrupts
>       7865 =C2=B1 22%     -91.2%     689.33 =C2=B1 33%  interrupts.CPU186=
.NMI:Non-maskable_interrupts
>       7865 =C2=B1 22%     -91.2%     689.33 =C2=B1 33%  interrupts.CPU186=
.PMI:Performance_monitoring_interrupts
>       7853 =C2=B1  3%   +2279.3%     186846 =C2=B1  2%  interrupts.CPU186=
.RES:Rescheduling_interrupts
>       1.20 =C2=B1 62%   +6483.3%      79.00 =C2=B1 27%  interrupts.CPU186=
.TLB:TLB_shootdowns
>       4594 =C2=B1 13%    +208.6%      14178 =C2=B1  4%  interrupts.CPU187=
.CAL:Function_call_interrupts
>     554810          +408.3%    2820028        interrupts.CPU187.LOC:Local=
_timer_interrupts
>       7874 =C2=B1 22%     -92.0%     627.67 =C2=B1 46%  interrupts.CPU187=
.NMI:Non-maskable_interrupts
>       7874 =C2=B1 22%     -92.0%     627.67 =C2=B1 46%  interrupts.CPU187=
.PMI:Performance_monitoring_interrupts
>       7985 =C2=B1  2%   +2247.5%     187458 =C2=B1  2%  interrupts.CPU187=
.RES:Rescheduling_interrupts
>       4593 =C2=B1 13%    +208.5%      14169 =C2=B1  4%  interrupts.CPU188=
.CAL:Function_call_interrupts
>     554651          +408.4%    2820050        interrupts.CPU188.LOC:Local=
_timer_interrupts
>       7886 =C2=B1 22%     -87.4%     991.67 =C2=B1 43%  interrupts.CPU188=
.NMI:Non-maskable_interrupts
>       7886 =C2=B1 22%     -87.4%     991.67 =C2=B1 43%  interrupts.CPU188=
.PMI:Performance_monitoring_interrupts
>       8019 =C2=B1  6%   +2252.3%     188647 =C2=B1  2%  interrupts.CPU188=
.RES:Rescheduling_interrupts
>       2.60 =C2=B1 86%   +3271.8%      87.67 =C2=B1 24%  interrupts.CPU188=
.TLB:TLB_shootdowns
>       4581 =C2=B1 13%    +209.4%      14176 =C2=B1  4%  interrupts.CPU189=
.CAL:Function_call_interrupts
>     554811          +408.3%    2820011        interrupts.CPU189.LOC:Local=
_timer_interrupts
>       7874 =C2=B1 22%     -90.2%     768.00 =C2=B1  6%  interrupts.CPU189=
.NMI:Non-maskable_interrupts
>       7874 =C2=B1 22%     -90.2%     768.00 =C2=B1  6%  interrupts.CPU189=
.PMI:Performance_monitoring_interrupts
>       8102 =C2=B1  5%   +2204.7%     186730 =C2=B1  3%  interrupts.CPU189=
.RES:Rescheduling_interrupts
>       4434 =C2=B1 14%    +212.9%      13874 =C2=B1  4%  interrupts.CPU19.=
CAL:Function_call_interrupts
>     555530          +407.7%    2820281        interrupts.CPU19.LOC:Local_=
timer_interrupts
>       7010 =C2=B1 30%     -76.6%       1644 =C2=B1 84%  interrupts.CPU19.=
NMI:Non-maskable_interrupts
>       7010 =C2=B1 30%     -76.6%       1644 =C2=B1 84%  interrupts.CPU19.=
PMI:Performance_monitoring_interrupts
>       7948 =C2=B1  3%   +2304.7%     191124        interrupts.CPU19.RES:R=
escheduling_interrupts
>       4581 =C2=B1 13%    +209.1%      14164 =C2=B1  4%  interrupts.CPU190=
.CAL:Function_call_interrupts
>     554755          +408.4%    2820252        interrupts.CPU190.LOC:Local=
_timer_interrupts
>       7870 =C2=B1 22%     -83.9%       1268 =C2=B1 60%  interrupts.CPU190=
.NMI:Non-maskable_interrupts
>       7870 =C2=B1 22%     -83.9%       1268 =C2=B1 60%  interrupts.CPU190=
.PMI:Performance_monitoring_interrupts
>       8022 =C2=B1  2%   +2235.8%     187383 =C2=B1  2%  interrupts.CPU190=
.RES:Rescheduling_interrupts
>       5.20 =C2=B1132%   +1669.2%      92.00 =C2=B1 32%  interrupts.CPU190=
.TLB:TLB_shootdowns
>       4576 =C2=B1 13%    +209.5%      14164 =C2=B1  4%  interrupts.CPU191=
.CAL:Function_call_interrupts
>     555236          +407.9%    2820217        interrupts.CPU191.LOC:Local=
_timer_interrupts
>       7860 =C2=B1 22%     -89.7%     806.00 =C2=B1 42%  interrupts.CPU191=
.NMI:Non-maskable_interrupts
>       7860 =C2=B1 22%     -89.7%     806.00 =C2=B1 42%  interrupts.CPU191=
.PMI:Performance_monitoring_interrupts
>       7947 =C2=B1  3%   +2263.2%     187824 =C2=B1  2%  interrupts.CPU191=
.RES:Rescheduling_interrupts
>       4.00 =C2=B1126%   +3850.0%     158.00 =C2=B1 47%  interrupts.CPU191=
.TLB:TLB_shootdowns
>       4476 =C2=B1 13%    +209.1%      13835 =C2=B1  3%  interrupts.CPU2.C=
AL:Function_call_interrupts
>     555506          +407.7%    2820378        interrupts.CPU2.LOC:Local_t=
imer_interrupts
>       7857 =C2=B1 22%     -89.6%     815.67 =C2=B1 10%  interrupts.CPU2.N=
MI:Non-maskable_interrupts
>       7857 =C2=B1 22%     -89.6%     815.67 =C2=B1 10%  interrupts.CPU2.P=
MI:Performance_monitoring_interrupts
>       8444 =C2=B1 10%   +2147.3%     189760        interrupts.CPU2.RES:Re=
scheduling_interrupts
>       2.20 =C2=B1136%   +4263.6%      96.00 =C2=B1 20%  interrupts.CPU2.T=
LB:TLB_shootdowns
>       4301 =C2=B1 15%    +224.6%      13959 =C2=B1  3%  interrupts.CPU20.=
CAL:Function_call_interrupts
>     554811          +408.3%    2820295        interrupts.CPU20.LOC:Local_=
timer_interrupts
>       6980 =C2=B1 30%     -87.4%     881.00 =C2=B1 42%  interrupts.CPU20.=
NMI:Non-maskable_interrupts
>       6980 =C2=B1 30%     -87.4%     881.00 =C2=B1 42%  interrupts.CPU20.=
PMI:Performance_monitoring_interrupts
>       8005 =C2=B1  3%   +2273.3%     189988        interrupts.CPU20.RES:R=
escheduling_interrupts
>       2.20 =C2=B1 60%   +3642.4%      82.33 =C2=B1 34%  interrupts.CPU20.=
TLB:TLB_shootdowns
>       4505 =C2=B1 14%    +209.7%      13951 =C2=B1  3%  interrupts.CPU21.=
CAL:Function_call_interrupts
>     555030          +408.1%    2820168        interrupts.CPU21.LOC:Local_=
timer_interrupts
>       6992 =C2=B1 30%     -88.2%     828.33 =C2=B1 43%  interrupts.CPU21.=
NMI:Non-maskable_interrupts
>       6992 =C2=B1 30%     -88.2%     828.33 =C2=B1 43%  interrupts.CPU21.=
PMI:Performance_monitoring_interrupts
>       7958 =C2=B1  4%   +2297.2%     190790        interrupts.CPU21.RES:R=
escheduling_interrupts
>       4505 =C2=B1 14%    +209.9%      13960 =C2=B1  3%  interrupts.CPU22.=
CAL:Function_call_interrupts
>     555320          +407.9%    2820275        interrupts.CPU22.LOC:Local_=
timer_interrupts
>       6999 =C2=B1 30%     -91.3%     611.00 =C2=B1 32%  interrupts.CPU22.=
NMI:Non-maskable_interrupts
>       6999 =C2=B1 30%     -91.3%     611.00 =C2=B1 32%  interrupts.CPU22.=
PMI:Performance_monitoring_interrupts
>       7748 =C2=B1  2%   +2349.7%     189802        interrupts.CPU22.RES:R=
escheduling_interrupts
>       2.40 =C2=B1 62%   +3927.8%      96.67 =C2=B1  6%  interrupts.CPU22.=
TLB:TLB_shootdowns
>       4480 =C2=B1 12%    +211.5%      13957 =C2=B1  3%  interrupts.CPU23.=
CAL:Function_call_interrupts
>     555128          +408.0%    2820283        interrupts.CPU23.LOC:Local_=
timer_interrupts
>       6995 =C2=B1 30%     -86.3%     959.33 =C2=B1 20%  interrupts.CPU23.=
NMI:Non-maskable_interrupts
>       6995 =C2=B1 30%     -86.3%     959.33 =C2=B1 20%  interrupts.CPU23.=
PMI:Performance_monitoring_interrupts
>       8064 =C2=B1  3%   +2257.3%     190096 =C2=B1  2%  interrupts.CPU23.=
RES:Rescheduling_interrupts
>       4522 =C2=B1 13%    +213.2%      14165 =C2=B1  3%  interrupts.CPU24.=
CAL:Function_call_interrupts
>     556066          +407.1%    2819692        interrupts.CPU24.LOC:Local_=
timer_interrupts
>       6984 =C2=B1 30%     -92.1%     548.33 =C2=B1 29%  interrupts.CPU24.=
NMI:Non-maskable_interrupts
>       6984 =C2=B1 30%     -92.1%     548.33 =C2=B1 29%  interrupts.CPU24.=
PMI:Performance_monitoring_interrupts
>       8412 =C2=B1  6%   +2174.6%     191350        interrupts.CPU24.RES:R=
escheduling_interrupts
>      11.80 =C2=B1 62%    +868.9%     114.33 =C2=B1 24%  interrupts.CPU24.=
TLB:TLB_shootdowns
>       4532 =C2=B1 14%    +208.7%      13991 =C2=B1  4%  interrupts.CPU25.=
CAL:Function_call_interrupts
>     554922          +408.3%    2820895        interrupts.CPU25.LOC:Local_=
timer_interrupts
>       6995 =C2=B1 30%     -89.0%     771.33 =C2=B1 27%  interrupts.CPU25.=
NMI:Non-maskable_interrupts
>       6995 =C2=B1 30%     -89.0%     771.33 =C2=B1 27%  interrupts.CPU25.=
PMI:Performance_monitoring_interrupts
>       8105 =C2=B1  5%   +2256.9%     191038        interrupts.CPU25.RES:R=
escheduling_interrupts
>       1.60 =C2=B1 63%   +6566.7%     106.67 =C2=B1 23%  interrupts.CPU25.=
TLB:TLB_shootdowns
>       4533 =C2=B1 14%    +212.3%      14155 =C2=B1  3%  interrupts.CPU26.=
CAL:Function_call_interrupts
>     554686          +408.4%    2819812        interrupts.CPU26.LOC:Local_=
timer_interrupts
>       7864 =C2=B1 22%     -90.7%     728.67 =C2=B1 42%  interrupts.CPU26.=
NMI:Non-maskable_interrupts
>       7864 =C2=B1 22%     -90.7%     728.67 =C2=B1 42%  interrupts.CPU26.=
PMI:Performance_monitoring_interrupts
>       8054 =C2=B1  2%   +2268.9%     190798        interrupts.CPU26.RES:R=
escheduling_interrupts
>       2.40 =C2=B1119%   +3997.2%      98.33 =C2=B1  9%  interrupts.CPU26.=
TLB:TLB_shootdowns
>       4542 =C2=B1 14%    +211.4%      14143 =C2=B1  3%  interrupts.CPU27.=
CAL:Function_call_interrupts
>     554563          +408.4%    2819627        interrupts.CPU27.LOC:Local_=
timer_interrupts
>       7864 =C2=B1 22%     -90.7%     732.00 =C2=B1 38%  interrupts.CPU27.=
NMI:Non-maskable_interrupts
>       7864 =C2=B1 22%     -90.7%     732.00 =C2=B1 38%  interrupts.CPU27.=
PMI:Performance_monitoring_interrupts
>       7987 =C2=B1  4%   +2289.0%     190831        interrupts.CPU27.RES:R=
escheduling_interrupts
>       3.00 =C2=B1117%   +3311.1%     102.33 =C2=B1 14%  interrupts.CPU27.=
TLB:TLB_shootdowns
>       4542 =C2=B1 14%    +211.9%      14169 =C2=B1  3%  interrupts.CPU28.=
CAL:Function_call_interrupts
>     554558          +408.5%    2819672        interrupts.CPU28.LOC:Local_=
timer_interrupts
>       7854 =C2=B1 22%     -92.5%     593.00 =C2=B1 24%  interrupts.CPU28.=
NMI:Non-maskable_interrupts
>       7854 =C2=B1 22%     -92.5%     593.00 =C2=B1 24%  interrupts.CPU28.=
PMI:Performance_monitoring_interrupts
>       7990 =C2=B1  4%   +2290.3%     190990        interrupts.CPU28.RES:R=
escheduling_interrupts
>       1.00 =C2=B1109%   +9566.7%      96.67 =C2=B1 18%  interrupts.CPU28.=
TLB:TLB_shootdowns
>       4536 =C2=B1 14%    +211.9%      14151 =C2=B1  3%  interrupts.CPU29.=
CAL:Function_call_interrupts
>     554587          +408.4%    2819587        interrupts.CPU29.LOC:Local_=
timer_interrupts
>       7861 =C2=B1 22%     -92.6%     580.33 =C2=B1 25%  interrupts.CPU29.=
NMI:Non-maskable_interrupts
>       7861 =C2=B1 22%     -92.6%     580.33 =C2=B1 25%  interrupts.CPU29.=
PMI:Performance_monitoring_interrupts
>       8167 =C2=B1  2%   +2242.8%     191344        interrupts.CPU29.RES:R=
escheduling_interrupts
>       4520 =C2=B1 13%    +206.7%      13865 =C2=B1  3%  interrupts.CPU3.C=
AL:Function_call_interrupts
>     555137          +408.0%    2820235        interrupts.CPU3.LOC:Local_t=
imer_interrupts
>       7869 =C2=B1 22%     -92.5%     591.67 =C2=B1 16%  interrupts.CPU3.N=
MI:Non-maskable_interrupts
>       7869 =C2=B1 22%     -92.5%     591.67 =C2=B1 16%  interrupts.CPU3.P=
MI:Performance_monitoring_interrupts
>       8133         +2230.3%     189538        interrupts.CPU3.RES:Resched=
uling_interrupts
>       4548 =C2=B1 13%    +211.2%      14156 =C2=B1  3%  interrupts.CPU30.=
CAL:Function_call_interrupts
>     554562          +408.4%    2819534        interrupts.CPU30.LOC:Local_=
timer_interrupts
>       7877 =C2=B1 22%     -87.9%     954.33 =C2=B1 59%  interrupts.CPU30.=
NMI:Non-maskable_interrupts
>       7877 =C2=B1 22%     -87.9%     954.33 =C2=B1 59%  interrupts.CPU30.=
PMI:Performance_monitoring_interrupts
>       7969 =C2=B1  2%   +2304.2%     191587        interrupts.CPU30.RES:R=
escheduling_interrupts
>       2.20 =C2=B1 60%   +4187.9%      94.33 =C2=B1 12%  interrupts.CPU30.=
TLB:TLB_shootdowns
>       4540 =C2=B1 13%    +211.9%      14161 =C2=B1  3%  interrupts.CPU31.=
CAL:Function_call_interrupts
>     554531          +408.5%    2819713        interrupts.CPU31.LOC:Local_=
timer_interrupts
>       7866 =C2=B1 22%     -88.5%     902.00 =C2=B1 37%  interrupts.CPU31.=
NMI:Non-maskable_interrupts
>       7866 =C2=B1 22%     -88.5%     902.00 =C2=B1 37%  interrupts.CPU31.=
PMI:Performance_monitoring_interrupts
>       7992 =C2=B1  2%   +2296.9%     191583        interrupts.CPU31.RES:R=
escheduling_interrupts
>       2.20 =C2=B1 60%   +3930.3%      88.67 =C2=B1 14%  interrupts.CPU31.=
TLB:TLB_shootdowns
>       4537 =C2=B1 13%    +211.2%      14119 =C2=B1  3%  interrupts.CPU32.=
CAL:Function_call_interrupts
>     554607          +408.4%    2819693        interrupts.CPU32.LOC:Local_=
timer_interrupts
>       7862 =C2=B1 22%     -92.9%     560.67 =C2=B1 12%  interrupts.CPU32.=
NMI:Non-maskable_interrupts
>       7862 =C2=B1 22%     -92.9%     560.67 =C2=B1 12%  interrupts.CPU32.=
PMI:Performance_monitoring_interrupts
>       7994 =C2=B1  2%   +2293.5%     191346        interrupts.CPU32.RES:R=
escheduling_interrupts
>       4537 =C2=B1 13%    +207.7%      13960 =C2=B1  2%  interrupts.CPU33.=
CAL:Function_call_interrupts
>     554566          +408.4%    2819512        interrupts.CPU33.LOC:Local_=
timer_interrupts
>       8746           -88.5%       1005 =C2=B1 55%  interrupts.CPU33.NMI:N=
on-maskable_interrupts
>       8746           -88.5%       1005 =C2=B1 55%  interrupts.CPU33.PMI:P=
erformance_monitoring_interrupts
>       7743 =C2=B1  4%   +2371.8%     191406        interrupts.CPU33.RES:R=
escheduling_interrupts
>       4.80 =C2=B1 90%   +1830.6%      92.67 =C2=B1 20%  interrupts.CPU33.=
TLB:TLB_shootdowns
>       4537 =C2=B1 13%    +209.0%      14018 =C2=B1  3%  interrupts.CPU34.=
CAL:Function_call_interrupts
>     554577          +408.4%    2819597        interrupts.CPU34.LOC:Local_=
timer_interrupts
>       8737           -93.8%     544.33 =C2=B1 35%  interrupts.CPU34.NMI:N=
on-maskable_interrupts
>       8737           -93.8%     544.33 =C2=B1 35%  interrupts.CPU34.PMI:P=
erformance_monitoring_interrupts
>       7975 =C2=B1  4%   +2294.1%     190936        interrupts.CPU34.RES:R=
escheduling_interrupts
>       4541 =C2=B1 13%    +206.1%      13902 =C2=B1  4%  interrupts.CPU35.=
CAL:Function_call_interrupts
>     554606          +408.4%    2819545        interrupts.CPU35.LOC:Local_=
timer_interrupts
>       8741           -91.9%     706.00 =C2=B1  8%  interrupts.CPU35.NMI:N=
on-maskable_interrupts
>       8741           -91.9%     706.00 =C2=B1  8%  interrupts.CPU35.PMI:P=
erformance_monitoring_interrupts
>       8000         +2299.4%     191953        interrupts.CPU35.RES:Resche=
duling_interrupts
>       8.40 =C2=B1 97%   +1324.6%     119.67 =C2=B1 11%  interrupts.CPU35.=
TLB:TLB_shootdowns
>       4545 =C2=B1 13%    +207.3%      13968 =C2=B1  2%  interrupts.CPU36.=
CAL:Function_call_interrupts
>     554648          +408.4%    2819586        interrupts.CPU36.LOC:Local_=
timer_interrupts
>       8736           -89.9%     884.67 =C2=B1 48%  interrupts.CPU36.NMI:N=
on-maskable_interrupts
>       8736           -89.9%     884.67 =C2=B1 48%  interrupts.CPU36.PMI:P=
erformance_monitoring_interrupts
>       8144 =C2=B1  4%   +2258.3%     192060        interrupts.CPU36.RES:R=
escheduling_interrupts
>       4526 =C2=B1 13%    +208.9%      13983 =C2=B1  2%  interrupts.CPU37.=
CAL:Function_call_interrupts
>     554672          +408.4%    2819684        interrupts.CPU37.LOC:Local_=
timer_interrupts
>       8742           -91.6%     738.00 =C2=B1 37%  interrupts.CPU37.NMI:N=
on-maskable_interrupts
>       8742           -91.6%     738.00 =C2=B1 37%  interrupts.CPU37.PMI:P=
erformance_monitoring_interrupts
>       7886 =C2=B1  4%   +2336.0%     192116        interrupts.CPU37.RES:R=
escheduling_interrupts
>       1.60 =C2=B1 84%   +6462.5%     105.00 =C2=B1 20%  interrupts.CPU37.=
TLB:TLB_shootdowns
>       4490 =C2=B1 13%    +211.0%      13964 =C2=B1  2%  interrupts.CPU38.=
CAL:Function_call_interrupts
>     554635          +408.4%    2819706        interrupts.CPU38.LOC:Local_=
timer_interrupts
>       8731           -88.9%     966.67 =C2=B1 33%  interrupts.CPU38.NMI:N=
on-maskable_interrupts
>       8731           -88.9%     966.67 =C2=B1 33%  interrupts.CPU38.PMI:P=
erformance_monitoring_interrupts
>       8072 =C2=B1  3%   +2283.6%     192419        interrupts.CPU38.RES:R=
escheduling_interrupts
>       4331 =C2=B1 14%    +222.0%      13947 =C2=B1  2%  interrupts.CPU39.=
CAL:Function_call_interrupts
>     554630          +408.4%    2819528        interrupts.CPU39.LOC:Local_=
timer_interrupts
>       8750           -94.3%     496.00 =C2=B1 28%  interrupts.CPU39.NMI:N=
on-maskable_interrupts
>       8750           -94.3%     496.00 =C2=B1 28%  interrupts.CPU39.PMI:P=
erformance_monitoring_interrupts
>       8017 =C2=B1  3%   +2290.7%     191678        interrupts.CPU39.RES:R=
escheduling_interrupts
>       3.20 =C2=B1138%   +2306.2%      77.00 =C2=B1 33%  interrupts.CPU39.=
TLB:TLB_shootdowns
>       4529 =C2=B1 13%    +204.1%      13772 =C2=B1  4%  interrupts.CPU4.C=
AL:Function_call_interrupts
>     555418          +407.8%    2820454        interrupts.CPU4.LOC:Local_t=
imer_interrupts
>       7883 =C2=B1 22%     -83.6%       1291 =C2=B1 25%  interrupts.CPU4.N=
MI:Non-maskable_interrupts
>       7883 =C2=B1 22%     -83.6%       1291 =C2=B1 25%  interrupts.CPU4.P=
MI:Performance_monitoring_interrupts
>       8030 =C2=B1  4%   +2253.4%     188987        interrupts.CPU4.RES:Re=
scheduling_interrupts
>       1.40 =C2=B1166%   +6876.2%      97.67 =C2=B1 24%  interrupts.CPU4.T=
LB:TLB_shootdowns
>       4558 =C2=B1 13%    +206.2%      13956 =C2=B1  2%  interrupts.CPU40.=
CAL:Function_call_interrupts
>     554788          +408.2%    2819637        interrupts.CPU40.LOC:Local_=
timer_interrupts
>       8746           -92.3%     674.67 =C2=B1 31%  interrupts.CPU40.NMI:N=
on-maskable_interrupts
>       8746           -92.3%     674.67 =C2=B1 31%  interrupts.CPU40.PMI:P=
erformance_monitoring_interrupts
>       7877 =C2=B1  5%   +2335.9%     191892        interrupts.CPU40.RES:R=
escheduling_interrupts
>       2.40 =C2=B1 81%   +3677.8%      90.67 =C2=B1 11%  interrupts.CPU40.=
TLB:TLB_shootdowns
>       4558 =C2=B1 13%    +206.0%      13950 =C2=B1  3%  interrupts.CPU41.=
CAL:Function_call_interrupts
>     554632          +408.4%    2819566        interrupts.CPU41.LOC:Local_=
timer_interrupts
>       8728           -92.6%     644.00 =C2=B1 28%  interrupts.CPU41.NMI:N=
on-maskable_interrupts
>       8728           -92.6%     644.00 =C2=B1 28%  interrupts.CPU41.PMI:P=
erformance_monitoring_interrupts
>       8127         +2265.9%     192286        interrupts.CPU41.RES:Resche=
duling_interrupts
>       3.80 =C2=B1112%   +2154.4%      85.67 =C2=B1 14%  interrupts.CPU41.=
TLB:TLB_shootdowns
>       4170 =C2=B1 21%    +234.6%      13953 =C2=B1  3%  interrupts.CPU42.=
CAL:Function_call_interrupts
>     555383          +407.7%    2819583        interrupts.CPU42.LOC:Local_=
timer_interrupts
>       8736           -92.1%     692.00 =C2=B1  6%  interrupts.CPU42.NMI:N=
on-maskable_interrupts
>       8736           -92.1%     692.00 =C2=B1  6%  interrupts.CPU42.PMI:P=
erformance_monitoring_interrupts
>       8021 =C2=B1  3%   +2299.0%     192442        interrupts.CPU42.RES:R=
escheduling_interrupts
>       2.60 =C2=B1 86%   +3284.6%      88.00 =C2=B1 13%  interrupts.CPU42.=
TLB:TLB_shootdowns
>       4555 =C2=B1 13%    +206.7%      13971 =C2=B1  3%  interrupts.CPU43.=
CAL:Function_call_interrupts
>     554712          +408.3%    2819808        interrupts.CPU43.LOC:Local_=
timer_interrupts
>       8743           -94.0%     522.67 =C2=B1 21%  interrupts.CPU43.NMI:N=
on-maskable_interrupts
>       8743           -94.0%     522.67 =C2=B1 21%  interrupts.CPU43.PMI:P=
erformance_monitoring_interrupts
>       7981 =C2=B1  5%   +2307.9%     192178        interrupts.CPU43.RES:R=
escheduling_interrupts
>       2.20 =C2=B1 66%   +4324.2%      97.33 =C2=B1  8%  interrupts.CPU43.=
TLB:TLB_shootdowns
>       4530 =C2=B1 13%    +208.2%      13962 =C2=B1  2%  interrupts.CPU44.=
CAL:Function_call_interrupts
>     554560          +408.5%    2819700        interrupts.CPU44.LOC:Local_=
timer_interrupts
>       8739           -92.1%     688.67 =C2=B1 20%  interrupts.CPU44.NMI:N=
on-maskable_interrupts
>       8739           -92.1%     688.67 =C2=B1 20%  interrupts.CPU44.PMI:P=
erformance_monitoring_interrupts
>       8162 =C2=B1  3%   +2253.0%     192066        interrupts.CPU44.RES:R=
escheduling_interrupts
>       1.40 =C2=B1 85%   +6257.1%      89.00 =C2=B1 18%  interrupts.CPU44.=
TLB:TLB_shootdowns
>       4558 =C2=B1 13%    +206.0%      13947 =C2=B1  3%  interrupts.CPU45.=
CAL:Function_call_interrupts
>     554602          +408.4%    2819602        interrupts.CPU45.LOC:Local_=
timer_interrupts
>       8719           -91.3%     759.67 =C2=B1 64%  interrupts.CPU45.NMI:N=
on-maskable_interrupts
>       8719           -91.3%     759.67 =C2=B1 64%  interrupts.CPU45.PMI:P=
erformance_monitoring_interrupts
>       7944 =C2=B1  2%   +2327.9%     192891        interrupts.CPU45.RES:R=
escheduling_interrupts
>       4.80 =C2=B1 99%   +1934.7%      97.67 =C2=B1 18%  interrupts.CPU45.=
TLB:TLB_shootdowns
>       4560 =C2=B1 13%    +209.6%      14117 =C2=B1  3%  interrupts.CPU46.=
CAL:Function_call_interrupts
>     554776          +408.2%    2819492        interrupts.CPU46.LOC:Local_=
timer_interrupts
>       8736           -92.1%     694.00 =C2=B1 50%  interrupts.CPU46.NMI:N=
on-maskable_interrupts
>       8736           -92.1%     694.00 =C2=B1 50%  interrupts.CPU46.PMI:P=
erformance_monitoring_interrupts
>       7923 =C2=B1  3%   +2329.4%     192492        interrupts.CPU46.RES:R=
escheduling_interrupts
>       1.60 =C2=B1115%   +6795.8%     110.33 =C2=B1  5%  interrupts.CPU46.=
TLB:TLB_shootdowns
>       4552 =C2=B1 13%    +210.1%      14116 =C2=B1  3%  interrupts.CPU47.=
CAL:Function_call_interrupts
>     554817          +408.2%    2819687        interrupts.CPU47.LOC:Local_=
timer_interrupts
>       8744           -92.5%     657.33 =C2=B1 30%  interrupts.CPU47.NMI:N=
on-maskable_interrupts
>       8744           -92.5%     657.33 =C2=B1 30%  interrupts.CPU47.PMI:P=
erformance_monitoring_interrupts
>       7939 =C2=B1  5%   +2330.5%     192965        interrupts.CPU47.RES:R=
escheduling_interrupts
>       5.80 =C2=B1140%   +1583.9%      97.67 =C2=B1 14%  interrupts.CPU47.=
TLB:TLB_shootdowns
>       4048 =C2=B1 22%    +237.4%      13660 =C2=B1  4%  interrupts.CPU48.=
CAL:Function_call_interrupts
>     555095          +408.0%    2819875        interrupts.CPU48.LOC:Local_=
timer_interrupts
>       8713           -88.4%       1015 =C2=B1 21%  interrupts.CPU48.NMI:N=
on-maskable_interrupts
>       8713           -88.4%       1015 =C2=B1 21%  interrupts.CPU48.PMI:P=
erformance_monitoring_interrupts
>       8203         +2241.5%     192072        interrupts.CPU48.RES:Resche=
duling_interrupts
>       3.00 =C2=B1101%   +2933.3%      91.00 =C2=B1 14%  interrupts.CPU48.=
TLB:TLB_shootdowns
>       4547 =C2=B1 14%    +202.7%      13763 =C2=B1  4%  interrupts.CPU49.=
CAL:Function_call_interrupts
>     554834          +408.2%    2819735        interrupts.CPU49.LOC:Local_=
timer_interrupts
>       7870 =C2=B1 22%     -91.3%     683.67 =C2=B1 21%  interrupts.CPU49.=
NMI:Non-maskable_interrupts
>       7870 =C2=B1 22%     -91.3%     683.67 =C2=B1 21%  interrupts.CPU49.=
PMI:Performance_monitoring_interrupts
>       8223 =C2=B1  3%   +2225.6%     191244        interrupts.CPU49.RES:R=
escheduling_interrupts
>       2.40 =C2=B1 81%   +3886.1%      95.67 =C2=B1  4%  interrupts.CPU49.=
TLB:TLB_shootdowns
>       4535 =C2=B1 13%    +201.3%      13666 =C2=B1  3%  interrupts.CPU5.C=
AL:Function_call_interrupts
>     554797          +408.3%    2820210        interrupts.CPU5.LOC:Local_t=
imer_interrupts
>       7868 =C2=B1 22%     -90.6%     737.67 =C2=B1  9%  interrupts.CPU5.N=
MI:Non-maskable_interrupts
>       7868 =C2=B1 22%     -90.6%     737.67 =C2=B1  9%  interrupts.CPU5.P=
MI:Performance_monitoring_interrupts
>       8055 =C2=B1  3%   +2246.0%     188977        interrupts.CPU5.RES:Re=
scheduling_interrupts
>       1.00 =C2=B1 63%   +8766.7%      88.67 =C2=B1 19%  interrupts.CPU5.T=
LB:TLB_shootdowns
>       4512 =C2=B1 13%    +202.0%      13625 =C2=B1  4%  interrupts.CPU50.=
CAL:Function_call_interrupts
>     554654          +408.4%    2819802        interrupts.CPU50.LOC:Local_=
timer_interrupts
>       7857 =C2=B1 22%     -90.6%     737.33 =C2=B1  5%  interrupts.CPU50.=
NMI:Non-maskable_interrupts
>       7857 =C2=B1 22%     -90.6%     737.33 =C2=B1  5%  interrupts.CPU50.=
PMI:Performance_monitoring_interrupts
>       8207 =C2=B1  2%   +2228.5%     191107        interrupts.CPU50.RES:R=
escheduling_interrupts
>       4.20 =C2=B1 80%   +2050.8%      90.33 =C2=B1 24%  interrupts.CPU50.=
TLB:TLB_shootdowns
>       4510 =C2=B1 13%    +204.8%      13747 =C2=B1  4%  interrupts.CPU51.=
CAL:Function_call_interrupts
>     554862          +408.2%    2820068        interrupts.CPU51.LOC:Local_=
timer_interrupts
>       7872 =C2=B1 22%     -90.1%     778.33 =C2=B1 11%  interrupts.CPU51.=
NMI:Non-maskable_interrupts
>       7872 =C2=B1 22%     -90.1%     778.33 =C2=B1 11%  interrupts.CPU51.=
PMI:Performance_monitoring_interrupts
>       8006         +2291.4%     191455        interrupts.CPU51.RES:Resche=
duling_interrupts
>       2.40 =C2=B1 20%   +3761.1%      92.67 =C2=B1 15%  interrupts.CPU51.=
TLB:TLB_shootdowns
>       4123 =C2=B1 19%    +234.1%      13774 =C2=B1  4%  interrupts.CPU52.=
CAL:Function_call_interrupts
>     555786          +407.4%    2820168        interrupts.CPU52.LOC:Local_=
timer_interrupts
>       7855 =C2=B1 22%     -88.0%     943.00 =C2=B1 11%  interrupts.CPU52.=
NMI:Non-maskable_interrupts
>       7855 =C2=B1 22%     -88.0%     943.00 =C2=B1 11%  interrupts.CPU52.=
PMI:Performance_monitoring_interrupts
>       8118         +2257.2%     191365        interrupts.CPU52.RES:Resche=
duling_interrupts
>       4507 =C2=B1 14%    +208.6%      13909 =C2=B1  4%  interrupts.CPU53.=
CAL:Function_call_interrupts
>     555503          +407.6%    2819788        interrupts.CPU53.LOC:Local_=
timer_interrupts
>       7866 =C2=B1 22%     -88.5%     904.00 =C2=B1 39%  interrupts.CPU53.=
NMI:Non-maskable_interrupts
>       7866 =C2=B1 22%     -88.5%     904.00 =C2=B1 39%  interrupts.CPU53.=
PMI:Performance_monitoring_interrupts
>       8189 =C2=B1  3%   +2238.6%     191524        interrupts.CPU53.RES:R=
escheduling_interrupts
>       3.00 =C2=B1 89%   +3511.1%     108.33 =C2=B1  7%  interrupts.CPU53.=
TLB:TLB_shootdowns
>       4417 =C2=B1 13%    +212.6%      13808 =C2=B1  3%  interrupts.CPU54.=
CAL:Function_call_interrupts
>     555144          +407.9%    2819808        interrupts.CPU54.LOC:Local_=
timer_interrupts
>       7861 =C2=B1 22%     -89.9%     793.00 =C2=B1 12%  interrupts.CPU54.=
NMI:Non-maskable_interrupts
>       7861 =C2=B1 22%     -89.9%     793.00 =C2=B1 12%  interrupts.CPU54.=
PMI:Performance_monitoring_interrupts
>       8315         +2208.1%     191931        interrupts.CPU54.RES:Resche=
duling_interrupts
>       1.60 =C2=B1 63%   +5962.5%      97.00 =C2=B1 13%  interrupts.CPU54.=
TLB:TLB_shootdowns
>       4497 =C2=B1 14%    +204.3%      13685 =C2=B1  3%  interrupts.CPU55.=
CAL:Function_call_interrupts
>     554801          +408.2%    2819734        interrupts.CPU55.LOC:Local_=
timer_interrupts
>       6988 =C2=B1 30%     -89.9%     704.00 =C2=B1 15%  interrupts.CPU55.=
NMI:Non-maskable_interrupts
>       6988 =C2=B1 30%     -89.9%     704.00 =C2=B1 15%  interrupts.CPU55.=
PMI:Performance_monitoring_interrupts
>       8110         +2262.4%     191608        interrupts.CPU55.RES:Resche=
duling_interrupts
>       2.20 =C2=B1 72%   +4142.4%      93.33 =C2=B1  9%  interrupts.CPU55.=
TLB:TLB_shootdowns
>       4495 =C2=B1 13%    +207.1%      13806 =C2=B1  4%  interrupts.CPU56.=
CAL:Function_call_interrupts
>     554522          +408.5%    2819753        interrupts.CPU56.LOC:Local_=
timer_interrupts
>       6978 =C2=B1 30%     -87.3%     884.67 =C2=B1 37%  interrupts.CPU56.=
NMI:Non-maskable_interrupts
>       6978 =C2=B1 30%     -87.3%     884.67 =C2=B1 37%  interrupts.CPU56.=
PMI:Performance_monitoring_interrupts
>       8086 =C2=B1  3%   +2273.8%     191953        interrupts.CPU56.RES:R=
escheduling_interrupts
>       3.60 =C2=B1119%   +2446.3%      91.67 =C2=B1 11%  interrupts.CPU56.=
TLB:TLB_shootdowns
>       4495 =C2=B1 13%    +205.7%      13741 =C2=B1  3%  interrupts.CPU57.=
CAL:Function_call_interrupts
>     554634          +408.4%    2819770        interrupts.CPU57.LOC:Local_=
timer_interrupts
>       6991 =C2=B1 30%     -89.6%     726.00 =C2=B1 40%  interrupts.CPU57.=
NMI:Non-maskable_interrupts
>       6991 =C2=B1 30%     -89.6%     726.00 =C2=B1 40%  interrupts.CPU57.=
PMI:Performance_monitoring_interrupts
>       8294         +2207.8%     191410        interrupts.CPU57.RES:Resche=
duling_interrupts
>       2.80 =C2=B1 69%   +3423.8%      98.67 =C2=B1 12%  interrupts.CPU57.=
TLB:TLB_shootdowns
>       4493 =C2=B1 13%    +206.9%      13790 =C2=B1  3%  interrupts.CPU58.=
CAL:Function_call_interrupts
>     554735          +408.3%    2819726        interrupts.CPU58.LOC:Local_=
timer_interrupts
>       7001 =C2=B1 30%     -89.7%     717.67 =C2=B1 31%  interrupts.CPU58.=
NMI:Non-maskable_interrupts
>       7001 =C2=B1 30%     -89.7%     717.67 =C2=B1 31%  interrupts.CPU58.=
PMI:Performance_monitoring_interrupts
>       8172 =C2=B1  3%   +2244.7%     191624        interrupts.CPU58.RES:R=
escheduling_interrupts
>       1.60 =C2=B1 30%   +6087.5%      99.00 =C2=B1 10%  interrupts.CPU58.=
TLB:TLB_shootdowns
>       4491 =C2=B1 13%    +206.0%      13743 =C2=B1  3%  interrupts.CPU59.=
CAL:Function_call_interrupts
>     554536          +408.5%    2819752        interrupts.CPU59.LOC:Local_=
timer_interrupts
>       7855 =C2=B1 22%     -89.5%     827.67 =C2=B1 24%  interrupts.CPU59.=
NMI:Non-maskable_interrupts
>       7855 =C2=B1 22%     -89.5%     827.67 =C2=B1 24%  interrupts.CPU59.=
PMI:Performance_monitoring_interrupts
>       8045 =C2=B1  2%   +2286.8%     192014        interrupts.CPU59.RES:R=
escheduling_interrupts
>       2.20 =C2=B1109%   +4400.0%      99.00 =C2=B1 13%  interrupts.CPU59.=
TLB:TLB_shootdowns
>       4531 =C2=B1 13%    +204.7%      13808 =C2=B1  4%  interrupts.CPU6.C=
AL:Function_call_interrupts
>     555052          +408.1%    2820147        interrupts.CPU6.LOC:Local_t=
imer_interrupts
>       7853 =C2=B1 22%     -84.0%       1258 =C2=B1 40%  interrupts.CPU6.N=
MI:Non-maskable_interrupts
>       7853 =C2=B1 22%     -84.0%       1258 =C2=B1 40%  interrupts.CPU6.P=
MI:Performance_monitoring_interrupts
>       8041 =C2=B1  4%   +2254.3%     189321        interrupts.CPU6.RES:Re=
scheduling_interrupts
>       0.80 =C2=B1 50%  +10108.3%      81.67 =C2=B1 24%  interrupts.CPU6.T=
LB:TLB_shootdowns
>       4487 =C2=B1 13%    +206.7%      13765 =C2=B1  4%  interrupts.CPU60.=
CAL:Function_call_interrupts
>     554688          +408.4%    2819770        interrupts.CPU60.LOC:Local_=
timer_interrupts
>       7865 =C2=B1 22%     -90.7%     731.67 =C2=B1  6%  interrupts.CPU60.=
NMI:Non-maskable_interrupts
>       7865 =C2=B1 22%     -90.7%     731.67 =C2=B1  6%  interrupts.CPU60.=
PMI:Performance_monitoring_interrupts
>       7952 =C2=B1  2%   +2315.9%     192114        interrupts.CPU60.RES:R=
escheduling_interrupts
>       2.60 =C2=B1145%   +3733.3%      99.67 =C2=B1 16%  interrupts.CPU60.=
TLB:TLB_shootdowns
>       4488 =C2=B1 13%    +205.3%      13705 =C2=B1  4%  interrupts.CPU61.=
CAL:Function_call_interrupts
>     554705          +408.3%    2819741        interrupts.CPU61.LOC:Local_=
timer_interrupts
>       7873 =C2=B1 22%     -91.6%     665.00 =C2=B1 35%  interrupts.CPU61.=
NMI:Non-maskable_interrupts
>       7873 =C2=B1 22%     -91.6%     665.00 =C2=B1 35%  interrupts.CPU61.=
PMI:Performance_monitoring_interrupts
>       7949 =C2=B1  2%   +2317.7%     192198        interrupts.CPU61.RES:R=
escheduling_interrupts
>       0.60 =C2=B1 81%  +14011.1%      84.67 =C2=B1 15%  interrupts.CPU61.=
TLB:TLB_shootdowns
>       4496 =C2=B1 13%    +205.4%      13731 =C2=B1  4%  interrupts.CPU62.=
CAL:Function_call_interrupts
>     554584          +408.4%    2819705        interrupts.CPU62.LOC:Local_=
timer_interrupts
>       7892 =C2=B1 22%     -92.9%     558.00 =C2=B1 21%  interrupts.CPU62.=
NMI:Non-maskable_interrupts
>       7892 =C2=B1 22%     -92.9%     558.00 =C2=B1 21%  interrupts.CPU62.=
PMI:Performance_monitoring_interrupts
>       8171 =C2=B1  3%   +2248.1%     191871        interrupts.CPU62.RES:R=
escheduling_interrupts
>       2.00 =C2=B1 63%   +4666.7%      95.33 =C2=B1  9%  interrupts.CPU62.=
TLB:TLB_shootdowns
>       4490 =C2=B1 14%    +206.8%      13777 =C2=B1  4%  interrupts.CPU63.=
CAL:Function_call_interrupts
>     554695          +408.4%    2819966        interrupts.CPU63.LOC:Local_=
timer_interrupts
>       6991 =C2=B1 30%     -87.7%     862.67 =C2=B1 56%  interrupts.CPU63.=
NMI:Non-maskable_interrupts
>       6991 =C2=B1 30%     -87.7%     862.67 =C2=B1 56%  interrupts.CPU63.=
PMI:Performance_monitoring_interrupts
>       8248 =C2=B1  2%   +2231.5%     192313        interrupts.CPU63.RES:R=
escheduling_interrupts
>       4487 =C2=B1 14%    +205.6%      13711 =C2=B1  4%  interrupts.CPU64.=
CAL:Function_call_interrupts
>     554582          +408.4%    2819713        interrupts.CPU64.LOC:Local_=
timer_interrupts
>       7854 =C2=B1 22%     -92.5%     591.33 =C2=B1 47%  interrupts.CPU64.=
NMI:Non-maskable_interrupts
>       7854 =C2=B1 22%     -92.5%     591.33 =C2=B1 47%  interrupts.CPU64.=
PMI:Performance_monitoring_interrupts
>       8121 =C2=B1  2%   +2266.2%     192177        interrupts.CPU64.RES:R=
escheduling_interrupts
>       4485 =C2=B1 14%    +206.6%      13750 =C2=B1  3%  interrupts.CPU65.=
CAL:Function_call_interrupts
>     554683          +408.3%    2819693        interrupts.CPU65.LOC:Local_=
timer_interrupts
>       7870 =C2=B1 22%     -92.6%     585.67 =C2=B1 11%  interrupts.CPU65.=
NMI:Non-maskable_interrupts
>       7870 =C2=B1 22%     -92.6%     585.67 =C2=B1 11%  interrupts.CPU65.=
PMI:Performance_monitoring_interrupts
>       8050 =C2=B1  3%   +2293.9%     192725        interrupts.CPU65.RES:R=
escheduling_interrupts
>       4525 =C2=B1 14%    +193.3%      13272 =C2=B1  3%  interrupts.CPU66.=
CAL:Function_call_interrupts
>     554758          +408.5%    2821050        interrupts.CPU66.LOC:Local_=
timer_interrupts
>       7858 =C2=B1 22%     -91.3%     683.00 =C2=B1 33%  interrupts.CPU66.=
NMI:Non-maskable_interrupts
>       7858 =C2=B1 22%     -91.3%     683.00 =C2=B1 33%  interrupts.CPU66.=
PMI:Performance_monitoring_interrupts
>       8104         +2274.1%     192413        interrupts.CPU66.RES:Resche=
duling_interrupts
>       1.60 =C2=B1 30%   +7087.5%     115.00 =C2=B1  8%  interrupts.CPU66.=
TLB:TLB_shootdowns
>       4487 =C2=B1 14%    +205.3%      13701 =C2=B1  3%  interrupts.CPU67.=
CAL:Function_call_interrupts
>     554659          +408.4%    2819835        interrupts.CPU67.LOC:Local_=
timer_interrupts
>       7867 =C2=B1 22%     -93.2%     532.00 =C2=B1 30%  interrupts.CPU67.=
NMI:Non-maskable_interrupts
>       7867 =C2=B1 22%     -93.2%     532.00 =C2=B1 30%  interrupts.CPU67.=
PMI:Performance_monitoring_interrupts
>       7944         +2322.3%     192434        interrupts.CPU67.RES:Resche=
duling_interrupts
>       2.20 =C2=B1 72%   +4339.4%      97.67 =C2=B1 11%  interrupts.CPU67.=
TLB:TLB_shootdowns
>       4485 =C2=B1 14%    +206.4%      13745 =C2=B1  3%  interrupts.CPU68.=
CAL:Function_call_interrupts
>     554454          +408.6%    2819879        interrupts.CPU68.LOC:Local_=
timer_interrupts
>       7872 =C2=B1 22%     -91.7%     653.00 =C2=B1 26%  interrupts.CPU68.=
NMI:Non-maskable_interrupts
>       7872 =C2=B1 22%     -91.7%     653.00 =C2=B1 26%  interrupts.CPU68.=
PMI:Performance_monitoring_interrupts
>       8437 =C2=B1  3%   +2196.9%     193794        interrupts.CPU68.RES:R=
escheduling_interrupts
>       4485 =C2=B1 14%    +203.8%      13626 =C2=B1  2%  interrupts.CPU69.=
CAL:Function_call_interrupts
>     554689          +408.3%    2819756        interrupts.CPU69.LOC:Local_=
timer_interrupts
>       7850 =C2=B1 22%     -90.7%     731.00 =C2=B1 37%  interrupts.CPU69.=
NMI:Non-maskable_interrupts
>       7850 =C2=B1 22%     -90.7%     731.00 =C2=B1 37%  interrupts.CPU69.=
PMI:Performance_monitoring_interrupts
>       8063 =C2=B1  2%   +2287.0%     192474        interrupts.CPU69.RES:R=
escheduling_interrupts
>       3.20 =C2=B1138%   +2691.7%      89.33 =C2=B1 12%  interrupts.CPU69.=
TLB:TLB_shootdowns
>       4070 =C2=B1 27%    +238.4%      13772 =C2=B1  4%  interrupts.CPU7.C=
AL:Function_call_interrupts
>     556568          +406.7%    2820167        interrupts.CPU7.LOC:Local_t=
imer_interrupts
>       7861 =C2=B1 22%     -88.9%     872.67 =C2=B1 21%  interrupts.CPU7.N=
MI:Non-maskable_interrupts
>       7861 =C2=B1 22%     -88.9%     872.67 =C2=B1 21%  interrupts.CPU7.P=
MI:Performance_monitoring_interrupts
>       8189 =C2=B1  2%   +2217.7%     189797        interrupts.CPU7.RES:Re=
scheduling_interrupts
>       1.80 =C2=B1 22%   +5381.5%      98.67 =C2=B1  9%  interrupts.CPU7.T=
LB:TLB_shootdowns
>       4483 =C2=B1 14%    +204.8%      13667 =C2=B1  2%  interrupts.CPU70.=
CAL:Function_call_interrupts
>     554594          +408.4%    2819733        interrupts.CPU70.LOC:Local_=
timer_interrupts
>       7877 =C2=B1 22%     -93.8%     486.67 =C2=B1 27%  interrupts.CPU70.=
NMI:Non-maskable_interrupts
>       7877 =C2=B1 22%     -93.8%     486.67 =C2=B1 27%  interrupts.CPU70.=
PMI:Performance_monitoring_interrupts
>       8222 =C2=B1  2%   +2247.0%     192982        interrupts.CPU70.RES:R=
escheduling_interrupts
>       1.20 =C2=B1 81%   +8288.9%     100.67 =C2=B1 10%  interrupts.CPU70.=
TLB:TLB_shootdowns
>       4483 =C2=B1 14%    +202.8%      13575 =C2=B1  3%  interrupts.CPU71.=
CAL:Function_call_interrupts
>     554636          +408.4%    2819792        interrupts.CPU71.LOC:Local_=
timer_interrupts
>       7848 =C2=B1 22%     -89.4%     833.00 =C2=B1 34%  interrupts.CPU71.=
NMI:Non-maskable_interrupts
>       7848 =C2=B1 22%     -89.4%     833.00 =C2=B1 34%  interrupts.CPU71.=
PMI:Performance_monitoring_interrupts
>       8099 =C2=B1  2%   +2289.9%     193576        interrupts.CPU71.RES:R=
escheduling_interrupts
>       4.40 =C2=B1108%   +2097.0%      96.67 =C2=B1  5%  interrupts.CPU71.=
TLB:TLB_shootdowns
>       4523 =C2=B1 14%    +210.0%      14023 =C2=B1  2%  interrupts.CPU72.=
CAL:Function_call_interrupts
>     555208          +408.0%    2820246        interrupts.CPU72.LOC:Local_=
timer_interrupts
>       7855 =C2=B1 22%     -90.9%     714.67 =C2=B1 62%  interrupts.CPU72.=
NMI:Non-maskable_interrupts
>       7855 =C2=B1 22%     -90.9%     714.67 =C2=B1 62%  interrupts.CPU72.=
PMI:Performance_monitoring_interrupts
>       8219 =C2=B1  2%   +2175.1%     187002 =C2=B1  2%  interrupts.CPU72.=
RES:Rescheduling_interrupts
>       4.20 =C2=B1 34%   +2431.7%     106.33 =C2=B1 37%  interrupts.CPU72.=
TLB:TLB_shootdowns
>       4538 =C2=B1 14%    +208.3%      13992 =C2=B1  3%  interrupts.CPU73.=
CAL:Function_call_interrupts
>     555157          +408.0%    2820275        interrupts.CPU73.LOC:Local_=
timer_interrupts
>       6991 =C2=B1 30%     -91.9%     568.00 =C2=B1 58%  interrupts.CPU73.=
NMI:Non-maskable_interrupts
>       6991 =C2=B1 30%     -91.9%     568.00 =C2=B1 58%  interrupts.CPU73.=
PMI:Performance_monitoring_interrupts
>       8055 =C2=B1  3%   +2253.2%     189570        interrupts.CPU73.RES:R=
escheduling_interrupts
>       4552 =C2=B1 14%    +207.4%      13995 =C2=B1  3%  interrupts.CPU74.=
CAL:Function_call_interrupts
>     555212          +407.9%    2820093        interrupts.CPU74.LOC:Local_=
timer_interrupts
>       7005 =C2=B1 30%     -79.5%       1433 =C2=B1 61%  interrupts.CPU74.=
NMI:Non-maskable_interrupts
>       7005 =C2=B1 30%     -79.5%       1433 =C2=B1 61%  interrupts.CPU74.=
PMI:Performance_monitoring_interrupts
>       8096 =C2=B1  3%   +2241.9%     189603        interrupts.CPU74.RES:R=
escheduling_interrupts
>       4547 =C2=B1 14%    +208.0%      14006 =C2=B1  2%  interrupts.CPU75.=
CAL:Function_call_interrupts
>     554757          +408.3%    2820011        interrupts.CPU75.LOC:Local_=
timer_interrupts
>       6990 =C2=B1 30%     -89.5%     735.67 =C2=B1 56%  interrupts.CPU75.=
NMI:Non-maskable_interrupts
>       6990 =C2=B1 30%     -89.5%     735.67 =C2=B1 56%  interrupts.CPU75.=
PMI:Performance_monitoring_interrupts
>       7926 =C2=B1  3%   +2240.0%     185470 =C2=B1  3%  interrupts.CPU75.=
RES:Rescheduling_interrupts
>       2.20 =C2=B1 53%   +4006.1%      90.33 =C2=B1 13%  interrupts.CPU75.=
TLB:TLB_shootdowns
>       4515 =C2=B1 14%    +209.4%      13970 =C2=B1  2%  interrupts.CPU76.=
CAL:Function_call_interrupts
>     555350          +407.8%    2820085        interrupts.CPU76.LOC:Local_=
timer_interrupts
>       7866 =C2=B1 22%     -92.2%     614.67 =C2=B1 32%  interrupts.CPU76.=
NMI:Non-maskable_interrupts
>       7866 =C2=B1 22%     -92.2%     614.67 =C2=B1 32%  interrupts.CPU76.=
PMI:Performance_monitoring_interrupts
>       8055 =C2=B1  4%   +2228.8%     187596 =C2=B1  3%  interrupts.CPU76.=
RES:Rescheduling_interrupts
>       4179 =C2=B1 22%    +233.9%      13955 =C2=B1  2%  interrupts.CPU77.=
CAL:Function_call_interrupts
>     555764          +407.4%    2820109        interrupts.CPU77.LOC:Local_=
timer_interrupts
>       6981 =C2=B1 30%     -92.6%     514.33 =C2=B1 13%  interrupts.CPU77.=
NMI:Non-maskable_interrupts
>       6981 =C2=B1 30%     -92.6%     514.33 =C2=B1 13%  interrupts.CPU77.=
PMI:Performance_monitoring_interrupts
>       7977 =C2=B1  2%   +2283.0%     190105        interrupts.CPU77.RES:R=
escheduling_interrupts
>       2.80 =C2=B1116%   +3364.3%      97.00 =C2=B1 11%  interrupts.CPU77.=
TLB:TLB_shootdowns
>       4575 =C2=B1 13%    +205.9%      13997 =C2=B1  3%  interrupts.CPU78.=
CAL:Function_call_interrupts
>     554901          +408.2%    2820274        interrupts.CPU78.LOC:Local_=
timer_interrupts
>       7862 =C2=B1 22%     -92.2%     611.00 =C2=B1 48%  interrupts.CPU78.=
NMI:Non-maskable_interrupts
>       7862 =C2=B1 22%     -92.2%     611.00 =C2=B1 48%  interrupts.CPU78.=
PMI:Performance_monitoring_interrupts
>       8040         +2229.2%     187269 =C2=B1  2%  interrupts.CPU78.RES:R=
escheduling_interrupts
>       4563 =C2=B1 13%    +206.9%      14006 =C2=B1  3%  interrupts.CPU79.=
CAL:Function_call_interrupts
>     555025          +408.1%    2820096        interrupts.CPU79.LOC:Local_=
timer_interrupts
>       7857 =C2=B1 22%     -89.1%     860.00 =C2=B1 55%  interrupts.CPU79.=
NMI:Non-maskable_interrupts
>       7857 =C2=B1 22%     -89.1%     860.00 =C2=B1 55%  interrupts.CPU79.=
PMI:Performance_monitoring_interrupts
>       8096 =C2=B1  2%   +2231.4%     188752 =C2=B1  2%  interrupts.CPU79.=
RES:Rescheduling_interrupts
>       4520 =C2=B1 13%    +204.6%      13770 =C2=B1  4%  interrupts.CPU8.C=
AL:Function_call_interrupts
>     555357          +407.8%    2820153        interrupts.CPU8.LOC:Local_t=
imer_interrupts
>       7868 =C2=B1 22%     -86.5%       1059 =C2=B1 27%  interrupts.CPU8.N=
MI:Non-maskable_interrupts
>       7868 =C2=B1 22%     -86.5%       1059 =C2=B1 27%  interrupts.CPU8.P=
MI:Performance_monitoring_interrupts
>       7891 =C2=B1  3%   +2307.1%     189959        interrupts.CPU8.RES:Re=
scheduling_interrupts
>       1.20 =C2=B1 97%   +7927.8%      96.33 =C2=B1  8%  interrupts.CPU8.T=
LB:TLB_shootdowns
>       4475 =C2=B1 14%    +212.1%      13969 =C2=B1  3%  interrupts.CPU80.=
CAL:Function_call_interrupts
>     555224          +407.9%    2820060        interrupts.CPU80.LOC:Local_=
timer_interrupts
>       7853 =C2=B1 22%     -91.2%     691.33 =C2=B1 37%  interrupts.CPU80.=
NMI:Non-maskable_interrupts
>       7853 =C2=B1 22%     -91.2%     691.33 =C2=B1 37%  interrupts.CPU80.=
PMI:Performance_monitoring_interrupts
>       8058 =C2=B1  4%   +2232.3%     187945 =C2=B1  2%  interrupts.CPU80.=
RES:Rescheduling_interrupts
>       4571 =C2=B1 13%    +208.5%      14099 =C2=B1  4%  interrupts.CPU81.=
CAL:Function_call_interrupts
>     554855          +408.3%    2820088        interrupts.CPU81.LOC:Local_=
timer_interrupts
>       7865 =C2=B1 22%     -83.9%       1269 =C2=B1 53%  interrupts.CPU81.=
NMI:Non-maskable_interrupts
>       7865 =C2=B1 22%     -83.9%       1269 =C2=B1 53%  interrupts.CPU81.=
PMI:Performance_monitoring_interrupts
>       8001 =C2=B1  2%   +2275.3%     190058        interrupts.CPU81.RES:R=
escheduling_interrupts
>       4461 =C2=B1 14%    +210.4%      13847 =C2=B1  5%  interrupts.CPU82.=
CAL:Function_call_interrupts
>     555299          +408.1%    2821283        interrupts.CPU82.LOC:Local_=
timer_interrupts
>       7884 =C2=B1 22%     -91.5%     670.67 =C2=B1 39%  interrupts.CPU82.=
NMI:Non-maskable_interrupts
>       7884 =C2=B1 22%     -91.5%     670.67 =C2=B1 39%  interrupts.CPU82.=
PMI:Performance_monitoring_interrupts
>       7933 =C2=B1  3%   +2287.1%     189379        interrupts.CPU82.RES:R=
escheduling_interrupts
>       4574 =C2=B1 13%    +208.0%      14086 =C2=B1  4%  interrupts.CPU83.=
CAL:Function_call_interrupts
>     555183          +408.0%    2820220        interrupts.CPU83.LOC:Local_=
timer_interrupts
>       7867 =C2=B1 22%     -73.4%       2091 =C2=B1105%  interrupts.CPU83.=
NMI:Non-maskable_interrupts
>       7867 =C2=B1 22%     -73.4%       2091 =C2=B1105%  interrupts.CPU83.=
PMI:Performance_monitoring_interrupts
>       7974 =C2=B1  3%   +2292.6%     190784 =C2=B1  2%  interrupts.CPU83.=
RES:Rescheduling_interrupts
>       4570 =C2=B1 13%    +208.1%      14080 =C2=B1  4%  interrupts.CPU84.=
CAL:Function_call_interrupts
>     555033          +408.1%    2820268        interrupts.CPU84.LOC:Local_=
timer_interrupts
>       7863 =C2=B1 22%     -90.2%     771.67 =C2=B1  5%  interrupts.CPU84.=
NMI:Non-maskable_interrupts
>       7863 =C2=B1 22%     -90.2%     771.67 =C2=B1  5%  interrupts.CPU84.=
PMI:Performance_monitoring_interrupts
>       7870 =C2=B1  4%   +2314.4%     190012 =C2=B1  2%  interrupts.CPU84.=
RES:Rescheduling_interrupts
>       6.40 =C2=B1139%   +1327.1%      91.33 =C2=B1 18%  interrupts.CPU84.=
TLB:TLB_shootdowns
>       4575 =C2=B1 13%    +208.2%      14099 =C2=B1  4%  interrupts.CPU85.=
CAL:Function_call_interrupts
>     555219          +408.0%    2820366        interrupts.CPU85.LOC:Local_=
timer_interrupts
>       7860 =C2=B1 22%     -91.6%     663.33 =C2=B1 29%  interrupts.CPU85.=
NMI:Non-maskable_interrupts
>       7860 =C2=B1 22%     -91.6%     663.33 =C2=B1 29%  interrupts.CPU85.=
PMI:Performance_monitoring_interrupts
>       7979 =C2=B1  3%   +2274.4%     189462 =C2=B1  2%  interrupts.CPU85.=
RES:Rescheduling_interrupts
>       2.20 =C2=B1 97%   +4672.7%     105.00 =C2=B1 24%  interrupts.CPU85.=
TLB:TLB_shootdowns
>       4573 =C2=B1 13%    +208.8%      14124 =C2=B1  4%  interrupts.CPU86.=
CAL:Function_call_interrupts
>     555293          +407.9%    2820241        interrupts.CPU86.LOC:Local_=
timer_interrupts
>       7875 =C2=B1 22%     -91.4%     680.67 =C2=B1 21%  interrupts.CPU86.=
NMI:Non-maskable_interrupts
>       7875 =C2=B1 22%     -91.4%     680.67 =C2=B1 21%  interrupts.CPU86.=
PMI:Performance_monitoring_interrupts
>       8166 =C2=B1  2%   +2210.4%     188664 =C2=B1  2%  interrupts.CPU86.=
RES:Rescheduling_interrupts
>       4.00 =C2=B1 90%   +1925.0%      81.00 =C2=B1 22%  interrupts.CPU86.=
TLB:TLB_shootdowns
>       4584 =C2=B1 13%    +207.3%      14088 =C2=B1  4%  interrupts.CPU87.=
CAL:Function_call_interrupts
>     555193          +408.0%    2820136        interrupts.CPU87.LOC:Local_=
timer_interrupts
>       7867 =C2=B1 22%     -89.3%     842.33 =C2=B1 46%  interrupts.CPU87.=
NMI:Non-maskable_interrupts
>       7867 =C2=B1 22%     -89.3%     842.33 =C2=B1 46%  interrupts.CPU87.=
PMI:Performance_monitoring_interrupts
>       7979 =C2=B1  3%   +2269.4%     189072 =C2=B1  2%  interrupts.CPU87.=
RES:Rescheduling_interrupts
>       4570 =C2=B1 13%    +208.2%      14088 =C2=B1  4%  interrupts.CPU88.=
CAL:Function_call_interrupts
>     555208          +408.0%    2820210        interrupts.CPU88.LOC:Local_=
timer_interrupts
>       8741           -92.9%     621.67 =C2=B1 25%  interrupts.CPU88.NMI:N=
on-maskable_interrupts
>       8741           -92.9%     621.67 =C2=B1 25%  interrupts.CPU88.PMI:P=
erformance_monitoring_interrupts
>       8182 =C2=B1  4%   +2226.3%     190335        interrupts.CPU88.RES:R=
escheduling_interrupts
>       2.00 =C2=B1 31%   +4283.3%      87.67 =C2=B1 16%  interrupts.CPU88.=
TLB:TLB_shootdowns
>       4560 =C2=B1 14%    +208.8%      14080 =C2=B1  4%  interrupts.CPU89.=
CAL:Function_call_interrupts
>     555183          +408.0%    2820197        interrupts.CPU89.LOC:Local_=
timer_interrupts
>       8728           -92.1%     689.67 =C2=B1 41%  interrupts.CPU89.NMI:N=
on-maskable_interrupts
>       8728           -92.1%     689.67 =C2=B1 41%  interrupts.CPU89.PMI:P=
erformance_monitoring_interrupts
>       8081 =C2=B1  4%   +2241.8%     189255 =C2=B1  2%  interrupts.CPU89.=
RES:Rescheduling_interrupts
>       3.80 =C2=B1101%   +2294.7%      91.00 =C2=B1  7%  interrupts.CPU89.=
TLB:TLB_shootdowns
>       1326 =C2=B1 43%    +308.5%       5419 =C2=B1 31%  interrupts.CPU9.3=
1:PCI-MSI.524289-edge.eth0-TxRx-0
>       4518 =C2=B1 13%    +204.9%      13778 =C2=B1  4%  interrupts.CPU9.C=
AL:Function_call_interrupts
>     555355          +407.8%    2820271        interrupts.CPU9.LOC:Local_t=
imer_interrupts
>       7880 =C2=B1 22%     -88.1%     937.00 =C2=B1 34%  interrupts.CPU9.N=
MI:Non-maskable_interrupts
>       7880 =C2=B1 22%     -88.1%     937.00 =C2=B1 34%  interrupts.CPU9.P=
MI:Performance_monitoring_interrupts
>       7973 =C2=B1  4%   +2285.3%     190192        interrupts.CPU9.RES:Re=
scheduling_interrupts
>       1.80 =C2=B1 64%   +5640.7%     103.33 =C2=B1 13%  interrupts.CPU9.T=
LB:TLB_shootdowns
>       4554 =C2=B1 14%    +209.0%      14075 =C2=B1  4%  interrupts.CPU90.=
CAL:Function_call_interrupts
>     555191          +407.9%    2820096        interrupts.CPU90.LOC:Local_=
timer_interrupts
>       8746           -92.0%     695.67 =C2=B1 24%  interrupts.CPU90.NMI:N=
on-maskable_interrupts
>       8746           -92.0%     695.67 =C2=B1 24%  interrupts.CPU90.PMI:P=
erformance_monitoring_interrupts
>       8000         +2255.8%     188481 =C2=B1  2%  interrupts.CPU90.RES:R=
escheduling_interrupts
>       2.80 =C2=B1 41%   +3233.3%      93.33 =C2=B1 15%  interrupts.CPU90.=
TLB:TLB_shootdowns
>       4555 =C2=B1 14%    +208.9%      14073 =C2=B1  4%  interrupts.CPU91.=
CAL:Function_call_interrupts
>     555496          +407.7%    2820014        interrupts.CPU91.LOC:Local_=
timer_interrupts
>       8734           -94.2%     504.00 =C2=B1 23%  interrupts.CPU91.NMI:N=
on-maskable_interrupts
>       8734           -94.2%     504.00 =C2=B1 23%  interrupts.CPU91.PMI:P=
erformance_monitoring_interrupts
>       7976 =C2=B1  4%   +2267.1%     188809 =C2=B1  2%  interrupts.CPU91.=
RES:Rescheduling_interrupts
>       4544 =C2=B1 14%    +209.3%      14053 =C2=B1  4%  interrupts.CPU92.=
CAL:Function_call_interrupts
>     554650          +408.4%    2820094        interrupts.CPU92.LOC:Local_=
timer_interrupts
>       7874 =C2=B1 22%     -87.3%     998.33 =C2=B1 26%  interrupts.CPU92.=
NMI:Non-maskable_interrupts
>       7874 =C2=B1 22%     -87.3%     998.33 =C2=B1 26%  interrupts.CPU92.=
PMI:Performance_monitoring_interrupts
>       7856         +2334.0%     191222 =C2=B1  2%  interrupts.CPU92.RES:R=
escheduling_interrupts
>       3.00 =C2=B1 59%   +3011.1%      93.33 =C2=B1 13%  interrupts.CPU92.=
TLB:TLB_shootdowns
>       4543 =C2=B1 14%    +210.1%      14088 =C2=B1  4%  interrupts.CPU93.=
CAL:Function_call_interrupts
>     554881          +408.3%    2820360        interrupts.CPU93.LOC:Local_=
timer_interrupts
>       7858 =C2=B1 22%     -86.5%       1064 =C2=B1 24%  interrupts.CPU93.=
NMI:Non-maskable_interrupts
>       7858 =C2=B1 22%     -86.5%       1064 =C2=B1 24%  interrupts.CPU93.=
PMI:Performance_monitoring_interrupts
>       7944 =C2=B1  5%   +2266.9%     188033 =C2=B1  3%  interrupts.CPU93.=
RES:Rescheduling_interrupts
>       4542 =C2=B1 14%    +210.1%      14085 =C2=B1  4%  interrupts.CPU94.=
CAL:Function_call_interrupts
>     554790          +408.4%    2820639        interrupts.CPU94.LOC:Local_=
timer_interrupts
>       7869 =C2=B1 22%     -79.5%       1609 =C2=B1 72%  interrupts.CPU94.=
NMI:Non-maskable_interrupts
>       7869 =C2=B1 22%     -79.5%       1609 =C2=B1 72%  interrupts.CPU94.=
PMI:Performance_monitoring_interrupts
>       8067 =C2=B1  4%   +2231.4%     188084 =C2=B1  3%  interrupts.CPU94.=
RES:Rescheduling_interrupts
>       2.40 =C2=B1 42%   +3344.4%      82.67 =C2=B1 24%  interrupts.CPU94.=
TLB:TLB_shootdowns
>       4504 =C2=B1 14%    +208.3%      13888 =C2=B1  4%  interrupts.CPU95.=
CAL:Function_call_interrupts
>     554772          +408.4%    2820519        interrupts.CPU95.LOC:Local_=
timer_interrupts
>       7856 =C2=B1 22%     -93.2%     537.33 =C2=B1 42%  interrupts.CPU95.=
NMI:Non-maskable_interrupts
>       7856 =C2=B1 22%     -93.2%     537.33 =C2=B1 42%  interrupts.CPU95.=
PMI:Performance_monitoring_interrupts
>      11248 =C2=B1  2%   +1587.7%     189840 =C2=B1  3%  interrupts.CPU95.=
RES:Rescheduling_interrupts
>       4335 =C2=B1 15%    +219.8%      13864 =C2=B1  4%  interrupts.CPU96.=
CAL:Function_call_interrupts
>     555005          +408.1%    2820175        interrupts.CPU96.LOC:Local_=
timer_interrupts
>       7868 =C2=B1 22%     -89.6%     818.33 =C2=B1 57%  interrupts.CPU96.=
NMI:Non-maskable_interrupts
>       7868 =C2=B1 22%     -89.6%     818.33 =C2=B1 57%  interrupts.CPU96.=
PMI:Performance_monitoring_interrupts
>       7805 =C2=B1  4%   +2346.8%     190974        interrupts.CPU96.RES:R=
escheduling_interrupts
>       4486 =C2=B1 15%    +207.0%      13776 =C2=B1  4%  interrupts.CPU97.=
CAL:Function_call_interrupts
>     555859          +407.6%    2821358        interrupts.CPU97.LOC:Local_=
timer_interrupts
>       7858 =C2=B1 22%     -88.9%     868.67 =C2=B1 55%  interrupts.CPU97.=
NMI:Non-maskable_interrupts
>       7858 =C2=B1 22%     -88.9%     868.67 =C2=B1 55%  interrupts.CPU97.=
PMI:Performance_monitoring_interrupts
>       7753 =C2=B1  3%   +2357.1%     190502 =C2=B1  2%  interrupts.CPU97.=
RES:Rescheduling_interrupts
>       4434 =C2=B1 14%    +210.9%      13784 =C2=B1  5%  interrupts.CPU98.=
CAL:Function_call_interrupts
>     555153          +408.0%    2820159        interrupts.CPU98.LOC:Local_=
timer_interrupts
>       7843 =C2=B1 22%     -90.8%     720.33 =C2=B1 26%  interrupts.CPU98.=
NMI:Non-maskable_interrupts
>       7843 =C2=B1 22%     -90.8%     720.33 =C2=B1 26%  interrupts.CPU98.=
PMI:Performance_monitoring_interrupts
>       7998 =C2=B1  4%   +2288.1%     191013        interrupts.CPU98.RES:R=
escheduling_interrupts
>       0.80 =C2=B1 93%  +10650.0%      86.00 =C2=B1 16%  interrupts.CPU98.=
TLB:TLB_shootdowns
>       4501 =C2=B1 14%    +207.4%      13837 =C2=B1  5%  interrupts.CPU99.=
CAL:Function_call_interrupts
>     554867          +408.3%    2820189        interrupts.CPU99.LOC:Local_=
timer_interrupts
>       7883 =C2=B1 22%     -93.9%     480.33 =C2=B1 24%  interrupts.CPU99.=
NMI:Non-maskable_interrupts
>       7883 =C2=B1 22%     -93.9%     480.33 =C2=B1 24%  interrupts.CPU99.=
PMI:Performance_monitoring_interrupts
>       8211 =C2=B1  4%   +2211.1%     189776        interrupts.CPU99.RES:R=
escheduling_interrupts
>       1.40 =C2=B1 34%   +6828.6%      97.00 =C2=B1  5%  interrupts.CPU99.=
TLB:TLB_shootdowns
>     365.00 =C2=B1 10%     -98.3%       6.33 =C2=B1  7%  interrupts.IWI:IR=
Q_work_interrupts
>  1.065e+08          +408.2%  5.414e+08        interrupts.LOC:Local_timer_=
interrupts
>       0.00       +7.7e+104%     768.00        interrupts.MCP:Machine_chec=
k_polls
>    1528607 =C2=B1  9%     -90.1%     151045 =C2=B1 13%  interrupts.NMI:No=
n-maskable_interrupts
>    1528607 =C2=B1  9%     -90.1%     151045 =C2=B1 13%  interrupts.PMI:Pe=
rformance_monitoring_interrupts
>    1546421         +2265.3%   36576995        interrupts.RES:Rescheduling=
_interrupts
>     504.40 =C2=B1 13%   +3396.9%      17638 =C2=B1  8%  interrupts.TLB:TL=
B_shootdowns
> =

> =

>                                                                          =
       =

>                                   aim7.jobs-per-min                      =
       =

>                                                                          =
       =

>   35000 +-+--------------------------------------------------------------=
---+   =

>         |..+..+..+.+..+..+..+..+..+.+..+.    +..+..+.+..+..+..+..+..+.+  =
   |   =

>   30000 +-+                                                              =
   |   =

>         |                                                                =
   |   =

>   25000 +-+                                                              =
   |   =

>         |                                                                =
   |   =

>   20000 +-+                                                              =
   |   =

>         |                                                                =
   |   =

>   15000 +-+                                                              =
   |   =

>         |                                                                =
   |   =

>   10000 +-+                                                              =
   |   =

>         |                              O  O  O     O    O     O  O  O    =
O  O   =

>    5000 O-+O  O       O  O     O  O O                                    =
   |   =

>         |                                                                =
   |   =

>       0 +-+------O-O--------O-------------------O----O-----O----------O--=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                 aim7.time.user_time                      =
       =

>                                                                          =
       =

>   100 +-+----------------------------------------------------------------=
---+   =

>    90 +-+                          O                                     =
   |   =

>       O  O  O        O  O       O                                        =
   |   =

>    80 +-+                    O                                           =
   |   =

>    70 +-+                                                                =
   |   =

>       |                               O  O  O     O     O    O  O  O     =
O  O   =

>    60 +-+                                                                =
   |   =

>    50 +-+                                                                =
   |   =

>    40 +-+                                                                =
   |   =

>       |                                                                  =
   |   =

>    30 +-+                                                                =
   |   =

>    20 +-+                                                                =
   |   =

>       |..+..+..+..+..+..+.+..+..+..+..+..+..+..+..+..+..+..+.+..+..+..+  =
   |   =

>    10 +-+                                                                =
   |   =

>     0 +-+------O--O-------O--------------------O-----O-----O----------O--=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                                 aim7.time.system_time                    =
       =

>                                                                          =
       =

>   250000 +-+-------------------------------------------------------------=
---+   =

>          |                                                               =
   |   =

>          O  O                     O                                      =
   |   =

>   200000 +-+   O       O  O    O     O  O  O O     O    O     O  O  O    =
O  O   =

>          |                                                               =
   |   =

>          |                                                               =
   |   =

>   150000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>   100000 +-+                                                             =
   |   =

>          |                                                               =
   |   =

>          |                                                               =
   |   =

>    50000 +-++..+.+..+..+..+..+.+..+..+..+..+.+..+..+..+.+..+..+..+..+.+  =
   |   =

>          |                                                               =
   |   =

>          |                                                               =
   |   =

>        0 +-+-----O--O--------O------------------O-----O----O----------O--=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                               aim7.time.elapsed_time                     =
       =

>                                                                          =
       =

>   1600 +-+---------------------------------------------------------------=
---+   =

>        O  O  O       O  O     O  O  O                                    =
   |   =

>   1400 +-+                             O  O O     O     O     O  O O     =
O  O   =

>   1200 +-+                                                               =
   |   =

>        |                                                                 =
   |   =

>   1000 +-+                                                               =
   |   =

>        |                                                                 =
   |   =

>    800 +-+                                                               =
   |   =

>        |                                                                 =
   |   =

>    600 +-+                                                               =
   |   =

>    400 +-+                                                               =
   |   =

>        | .+..                                 .+..           .+..        =
   |   =

>    200 +-+   +..+..+.+..+..+..+..+..+..+..+.+.    +..+..+..+.    +.+..+  =
   |   =

>        |                                                                 =
   |   =

>      0 +-+------O--O-------O-------------------O-----O-----O----------O--=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                             aim7.time.elapsed_time.max                   =
       =

>                                                                          =
       =

>   1600 +-+---------------------------------------------------------------=
---+   =

>        O  O  O       O  O     O  O  O                                    =
   |   =

>   1400 +-+                             O  O O     O     O     O  O O     =
O  O   =

>   1200 +-+                                                               =
   |   =

>        |                                                                 =
   |   =

>   1000 +-+                                                               =
   |   =

>        |                                                                 =
   |   =

>    800 +-+                                                               =
   |   =

>        |                                                                 =
   |   =

>    600 +-+                                                               =
   |   =

>    400 +-+                                                               =
   |   =

>        | .+..                                 .+..           .+..        =
   |   =

>    200 +-+   +..+..+.+..+..+..+..+..+..+..+.+.    +..+..+..+.    +.+..+  =
   |   =

>        |                                                                 =
   |   =

>      0 +-+------O--O-------O-------------------O-----O-----O----------O--=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                               aim7.time.minor_page_faults                =
       =

>                                                                          =
       =

>   1.4e+06 +-+------------------------------------------------------------=
---+   =

>           |                                                              =
   |   =

>   1.2e+06 O-+O  O          O    O             O                  O       =
   O   =

>           |             O          O  O            O          O          =
O  |   =

>     1e+06 +-+                           O  O             O          O    =
   |   =

>           |                                                              =
   |   =

>    800000 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>    600000 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>    400000 +-+                                                            =
   |   =

>           |..+..+.+..+..+..+.+..+..+..+.+..+..+..+.+..+..+..+.+..+..+..+ =
   |   =

>    200000 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>         0 +-+-----O--O-------O-------------------O----O-----O----------O-=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                          aim7.time.voluntary_context_switches            =
       =

>                                                                          =
       =

>   1.8e+08 +-+------------------------------------------------------------=
---+   =

>           |                                                              =
   |   =

>   1.6e+08 O-+O  O       O  O    O  O  O O  O  O    O     O    O  O  O    =
O  O   =

>   1.4e+08 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>   1.2e+08 +-+                                                            =
   |   =

>     1e+08 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>     8e+07 +-+                                                            =
   |   =

>     6e+07 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>     4e+07 +-+                                                            =
   |   =

>     2e+07 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>         0 +-+-----O--O-------O-------------------O----O-----O----------O-=
---+   =

>                                                                          =
       =

>                                                                          =
                                                                           =
            =

>                              aim7.time.file_system_outputs               =
       =

>                                                                          =
       =

>   3.5e+08 +-+------------------------------------------------------------=
---+   =

>           O  O  O       O  O    O  O  O O  O  O    O     O    O  O  O    =
O  O   =

>     3e+08 +-++..+.+..+..+..+.+..+..+..+.+..+..+..+.+..+..+..+.+..+..+..+ =
   |   =

>           |                                                              =
   |   =

>   2.5e+08 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>     2e+08 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>   1.5e+08 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>     1e+08 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>     5e+07 +-+                                                            =
   |   =

>           |                                                              =
   |   =

>         0 +-+-----O--O-------O-------------------O----O-----O----------O-=
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
> lkp-bdw-ex2: 160 threads Intel(R) Xeon(R) CPU E7-8890 v4 @ 2.20GHz with 2=
56G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runt=
ime/rw/tbox_group/test_size/testcase/ucode:
>   4k/gcc-7/performance/1SSD/btrfs/sync/x86_64-rhel-7.6/1/debian-x86_64-20=
19-09-23.cgz/300s/randwrite/lkp-bdw-ex2/128G/fio-basic/0xb000038
> =

> commit: =

>   v5.4
>   c6bbf24815 ("btrfs: space-info: Make over-commit threshold to 87.5% of =
a new chunk")
> =

>             v5.4 c6bbf24815f95a4928984ff16a9 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           2:5          -40%            :4     dmesg.WARNING:at#for_ip_swa=
pgs_restore_regs_and_return_to_usermode/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>       0.01            +0.1        0.13 =C2=B1 11%  fio.latency_100us%
>      57.88 =C2=B1 11%     +32.9       90.74        fio.latency_10us%
>       1.39 =C2=B1 13%      +2.5        3.91 =C2=B1 20%  fio.latency_20us%
>      39.60 =C2=B1 17%     -37.4        2.23 =C2=B1 31%  fio.latency_4us%
>       0.01            +0.0        0.01        fio.latency_500ms%
>       0.01            +0.0        0.01        fio.latency_50ms%
>       1.14 =C2=B1 24%      +1.8        2.96 =C2=B1 21%  fio.latency_50us%
>       0.01            -0.0        0.00        fio.latency_750ms%
>  2.433e+08           -79.2%   50652326        fio.time.file_system_outputs
>      72.40           -71.3%      20.75 =C2=B1  2%  fio.time.percent_of_cp=
u_this_job_got
>     178.42           -71.4%      51.00 =C2=B1  2%  fio.time.system_time
>      41.80 =C2=B1  2%     -67.7%      13.51 =C2=B1  7%  fio.time.user_time
>      94840 =C2=B1 28%    +180.2%     265709        fio.time.voluntary_con=
text_switches
>   30413261           -79.2%    6331029        fio.workload
>     395.96           -79.2%      82.40        fio.write_bw_MBps
>       5843 =C2=B1  3%     +52.2%       8896 =C2=B1  3%  fio.write_clat_90=
%_us
>       6457 =C2=B1  6%     +96.7%      12704 =C2=B1 15%  fio.write_clat_95=
%_us
>      20198 =C2=B1  5%     +29.9%      26240 =C2=B1  2%  fio.write_clat_99=
%_us
>       7570 =C2=B1  2%    +496.0%      45124        fio.write_clat_mean_us
>    1034942          +209.9%    3207497        fio.write_clat_stddev
>     101365           -79.2%      21095        fio.write_iops
>       0.52 =C2=B1 24%    +176.5%       1.43 =C2=B1  8%  iostat.cpu.system
>       0.25 =C2=B1  3%      -0.3        0.00 =C2=B1 20%  mpstat.cpu.all.io=
wait%
>       0.44 =C2=B1  4%      +0.9        1.33        mpstat.cpu.all.sys%
>       0.08 =C2=B1  2%      -0.0        0.03 =C2=B1  3%  mpstat.cpu.all.us=
r%
>   47776042 =C2=B1 51%   +1992.1%  9.995e+08 =C2=B1  2%  cpuidle.C1.time
>    1537623 =C2=B1 56%   +2396.4%   38385075 =C2=B1  2%  cpuidle.C1.usage
>    8517248 =C2=B1 18%    +383.9%   41215825 =C2=B1 12%  cpuidle.POLL.time
>     178308 =C2=B1 27%    +545.0%    1150130 =C2=B1 11%  cpuidle.POLL.usage
>     398989           -64.4%     142119        vmstat.io.bo
>    2555198           +22.3%    3125533        vmstat.memory.cache
>       0.80 =C2=B1 50%    +150.0%       2.00        vmstat.procs.r
>      12942 =C2=B1 41%   +1974.7%     268509        vmstat.system.cs
>      88.40 =C2=B1  7%     +28.7%     113.75 =C2=B1  4%  turbostat.Avg_MHz
>       1753 =C2=B1  3%     +13.2%       1984 =C2=B1  4%  turbostat.Bzy_MHz
>    1533974 =C2=B1 56%   +2402.2%   38383224 =C2=B1  2%  turbostat.C1
>       0.08 =C2=B1 50%      +1.6        1.72 =C2=B1  2%  turbostat.C1%
>       0.05 =C2=B1 27%     -94.8%       0.00 =C2=B1173%  turbostat.Pkg%pc3
>     114057 =C2=B1 55%    +207.2%     350333 =C2=B1 73%  numa-meminfo.node=
0.Active
>       3257 =C2=B1186%   +1555.0%      53912 =C2=B1 71%  numa-meminfo.node=
1.AnonHugePages
>       8319 =C2=B1196%   +2394.4%     207527 =C2=B1 98%  numa-meminfo.node=
2.Active(file)
>      57390 =C2=B1 31%     +58.0%      90689 =C2=B1 12%  numa-meminfo.node=
2.SUnreclaim
>      80982 =C2=B1 29%     +50.0%     121464 =C2=B1  4%  numa-meminfo.node=
2.Slab
>     112031 =C2=B1 46%    +427.4%     590854 =C2=B1 51%  numa-meminfo.node=
3.Active
>       5124 =C2=B1155%   +9495.4%     491668 =C2=B1 67%  numa-meminfo.node=
3.Active(file)
>     250016 =C2=B1 79%     -57.3%     106862 =C2=B1164%  numa-meminfo.node=
3.Mapped
>      20831 =C2=B1 82%   +6442.6%    1362889 =C2=B1 85%  numa-vmstat.node0=
.nr_dirtied
>       0.00       +6.8e+103%      67.75 =C2=B1 70%  numa-vmstat.node0.nr_w=
riteback
>      10194 =C2=B1177%  +13078.4%    1343488 =C2=B1 86%  numa-vmstat.node0=
.nr_written
>       2080 =C2=B1196%   +2396.1%      51923 =C2=B1 98%  numa-vmstat.node2=
.nr_active_file
>      14348 =C2=B1 31%     +58.1%      22688 =C2=B1 12%  numa-vmstat.node2=
.nr_slab_unreclaimable
>       2080 =C2=B1196%   +2396.1%      51923 =C2=B1 98%  numa-vmstat.node2=
.nr_zone_active_file
>       1280 =C2=B1155%   +9498.7%     122940 =C2=B1 66%  numa-vmstat.node3=
.nr_active_file
>       1280 =C2=B1155%   +9498.7%     122940 =C2=B1 66%  numa-vmstat.node3=
.nr_zone_active_file
>     332445          +277.6%    1255337        meminfo.Active
>      67620 =C2=B1  7%   +1365.2%     990798        meminfo.Active(file)
>    2454848           +23.3%    3025840        meminfo.Cached
>     342301           -93.1%      23673 =C2=B1  2%  meminfo.Dirty
>    1296413           -27.2%     943704        meminfo.Inactive
>     860541           -41.2%     506064        meminfo.Inactive(file)
>    4055543           +15.1%    4667224        meminfo.Memused
>     274597           +23.1%     337913        meminfo.SUnreclaim
>     380301           +18.0%     448877        meminfo.Slab
>     177641 =C2=B1  2%     -99.3%       1300 =C2=B1 12%  meminfo.Writeback
>      14528           +23.4%      17927        meminfo.max_used_kB
>      16884 =C2=B1  7%   +1366.9%     247677        proc-vmstat.nr_active_=
file
>   30454821           -64.1%   10918817        proc-vmstat.nr_dirtied
>      85141 =C2=B1  2%     -93.1%       5891 =C2=B1  2%  proc-vmstat.nr_di=
rty
>     613418           +23.3%     756437        proc-vmstat.nr_file_pages
>     214946           -41.1%     126703        proc-vmstat.nr_inactive_file
>      26425            +5.0%      27741        proc-vmstat.nr_slab_reclaim=
able
>      68649           +23.0%      84472        proc-vmstat.nr_slab_unrecla=
imable
>      44798 =C2=B1  3%     -99.3%     305.75 =C2=B1  7%  proc-vmstat.nr_wr=
iteback
>   30394933           -64.5%   10798666        proc-vmstat.nr_written
>      16884 =C2=B1  7%   +1366.9%     247677        proc-vmstat.nr_zone_ac=
tive_file
>     214946           -41.1%     126703        proc-vmstat.nr_zone_inactiv=
e_file
>     129947           -95.0%       6493 =C2=B1  2%  proc-vmstat.nr_zone_wr=
ite_pending
>   10412260 =C2=B1  3%     -20.2%    8313759        proc-vmstat.numa_hit
>   10318764 =C2=B1  3%     -20.3%    8220420        proc-vmstat.numa_local
>      10600 =C2=B1  7%   +2185.4%     242262        proc-vmstat.pgactivate
>   10808064 =C2=B1  3%     -18.8%    8772579        proc-vmstat.pgalloc_no=
rmal
>   10678751 =C2=B1  3%     -20.4%    8503532        proc-vmstat.pgfree
>  1.216e+08           -64.5%   43203372        proc-vmstat.pgpgout
>   22959094          -100.0%      95.75 =C2=B1 88%  proc-vmstat.pgrotated
>      72.84 =C2=B1 72%    +473.4%     417.68 =C2=B1 47%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>     637.59 =C2=B1 62%    +346.8%       2849 =C2=B1 49%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>       1783 =C2=B1 18%     +93.2%       3445 =C2=B1 20%  sched_debug.cfs_r=
q:/.exec_clock.avg
>      50716 =C2=B1 21%     -63.8%      18345 =C2=B1 23%  sched_debug.cfs_r=
q:/.exec_clock.max
>       7999 =C2=B1 23%     -49.2%       4061 =C2=B1 12%  sched_debug.cfs_r=
q:/.exec_clock.stddev
>      39377 =C2=B1 11%     +69.9%      66904 =C2=B1 22%  sched_debug.cfs_r=
q:/.load.avg
>     168189 =C2=B1  8%     +33.8%     224961 =C2=B1 14%  sched_debug.cfs_r=
q:/.load.stddev
>       2773 =C2=B1135%     -73.2%     742.96 =C2=B1  7%  sched_debug.cfs_r=
q:/.load_avg.max
>     322.53 =C2=B1 97%     -52.9%     151.89 =C2=B1  6%  sched_debug.cfs_r=
q:/.load_avg.stddev
>      72.84 =C2=B1 72%    +473.5%     417.71 =C2=B1 47%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>     637.59 =C2=B1 62%    +346.9%       2849 =C2=B1 49%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>       0.07 =C2=B1 11%     +29.9%       0.09 =C2=B1 12%  sched_debug.cfs_r=
q:/.nr_running.avg
>       0.26 =C2=B1  5%     +12.5%       0.29 =C2=B1  6%  sched_debug.cfs_r=
q:/.nr_running.stddev
>     799.87 =C2=B1  9%     -31.7%     546.00 =C2=B1 11%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>     133.61 =C2=B1 11%     -31.2%      91.96 =C2=B1 16%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>      39363 =C2=B1 11%     +71.7%      67603 =C2=B1 21%  sched_debug.cfs_r=
q:/.runnable_weight.avg
>     168159 =C2=B1  8%     +34.4%     226034 =C2=B1 14%  sched_debug.cfs_r=
q:/.runnable_weight.stddev
>      75.12 =C2=B1  9%     +28.6%      96.63        sched_debug.cfs_rq:/.u=
til_avg.avg
>     952.50 =C2=B1  6%     -21.2%     750.96 =C2=B1  8%  sched_debug.cfs_r=
q:/.util_avg.max
>       8.03 =C2=B1 27%    +177.8%      22.30 =C2=B1 25%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     283.40 =C2=B1 26%     +97.0%     558.17 =C2=B1 15%  sched_debug.cfs_r=
q:/.util_est_enqueued.max
>      41.81 =C2=B1 27%    +117.2%      90.82 =C2=B1 17%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>      79275 =C2=B1 94%     -85.8%      11273 =C2=B1 53%  sched_debug.cpu.a=
vg_idle.min
>     136153 =C2=B1 14%    +112.5%     289333 =C2=B1 14%  sched_debug.cpu.a=
vg_idle.stddev
>      91.84 =C2=B1  7%     +32.1%     121.32 =C2=B1  4%  sched_debug.cpu.c=
urr->pid.avg
>     723.08           +10.3%     797.44        sched_debug.cpu.curr->pid.s=
tddev
>       0.00 =C2=B1  8%     +74.7%       0.00 =C2=B1 63%  sched_debug.cpu.n=
ext_balance.stddev
>       0.02 =C2=B1 13%     +47.8%       0.03        sched_debug.cpu.nr_run=
ning.avg
>       0.14 =C2=B1  5%     +24.9%       0.18 =C2=B1  2%  sched_debug.cpu.n=
r_running.stddev
>      12377 =C2=B1 26%   +1641.0%     215492        sched_debug.cpu.nr_swi=
tches.avg
>     138711 =C2=B1 21%   +1158.5%    1745692 =C2=B1  2%  sched_debug.cpu.n=
r_switches.max
>      24327 =C2=B1 27%   +1279.0%     335462 =C2=B1  6%  sched_debug.cpu.n=
r_switches.stddev
>       0.00 =C2=B1 18%    +371.6%       0.02 =C2=B1 21%  sched_debug.cpu.n=
r_uninterruptible.avg
>      10202 =C2=B1 32%   +1991.1%     213351        sched_debug.cpu.sched_=
count.avg
>     135159 =C2=B1 21%   +1188.9%    1742064 =C2=B1  3%  sched_debug.cpu.s=
ched_count.max
>      23982 =C2=B1 28%   +1298.2%     335324 =C2=B1  6%  sched_debug.cpu.s=
ched_count.stddev
>       5075 =C2=B1 32%   +2001.3%     106642        sched_debug.cpu.sched_=
goidle.avg
>      66959 =C2=B1 22%   +1200.7%     870926 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.max
>      11927 =C2=B1 28%   +1305.5%     167638 =C2=B1  6%  sched_debug.cpu.s=
ched_goidle.stddev
>       5098 =C2=B1 32%   +1992.3%     106673        sched_debug.cpu.ttwu_c=
ount.avg
>      83668 =C2=B1 13%   +1131.3%    1030207 =C2=B1 24%  sched_debug.cpu.t=
twu_count.max
>      13198 =C2=B1 24%   +1235.9%     176317 =C2=B1 10%  sched_debug.cpu.t=
twu_count.stddev
>      45.43 =C2=B1 20%     -45.3%      24.84 =C2=B1 14%  perf-stat.i.MPKI
>  7.979e+08 =C2=B1  3%    +112.4%  1.694e+09 =C2=B1  2%  perf-stat.i.branc=
h-instructions
>       5.13 =C2=B1 18%      -2.4        2.78 =C2=B1 24%  perf-stat.i.cache=
-miss-rate%
>    8928732 =C2=B1  3%     -34.0%    5894104 =C2=B1 11%  perf-stat.i.cache=
-misses
>      12709 =C2=B1 39%   +2033.3%     271124        perf-stat.i.context-sw=
itches
>       4.64 =C2=B1 12%     -44.5%       2.58 =C2=B1  6%  perf-stat.i.cpi
>  1.783e+10 =C2=B1  9%     +27.2%  2.268e+10 =C2=B1  5%  perf-stat.i.cpu-c=
ycles
>       1.17 =C2=B1  6%    +117.5%       2.54 =C2=B1  8%  perf-stat.i.cpu-m=
igrations
>       7454 =C2=B1 13%     -43.6%       4202 =C2=B1 16%  perf-stat.i.cycle=
s-between-cache-misses
>       0.58 =C2=B1 17%      -0.3        0.30 =C2=B1 14%  perf-stat.i.dTLB-=
load-miss-rate%
>  1.186e+09 =C2=B1  4%     +96.6%  2.332e+09 =C2=B1  5%  perf-stat.i.dTLB-=
loads
>       0.17 =C2=B1 11%      -0.1        0.11 =C2=B1  7%  perf-stat.i.dTLB-=
store-miss-rate%
>  1.395e+09 =C2=B1  9%     +47.6%  2.059e+09 =C2=B1  6%  perf-stat.i.dTLB-=
stores
>      64.94 =C2=B1 18%     -29.2       35.76 =C2=B1 15%  perf-stat.i.iTLB-=
load-miss-rate%
>    1491476 =C2=B1 30%    +168.0%    3997670 =C2=B1  8%  perf-stat.i.iTLB-=
loads
>   3.95e+09 =C2=B1  3%    +123.4%  8.822e+09        perf-stat.i.instructio=
ns
>       1572 =C2=B1 26%    +164.6%       4160 =C2=B1 16%  perf-stat.i.instr=
uctions-per-iTLB-miss
>       0.22 =C2=B1 11%     +75.9%       0.39 =C2=B1  6%  perf-stat.i.ipc
>      38.76 =C2=B1 22%     +36.0       74.80 =C2=B1  6%  perf-stat.i.node-=
load-miss-rate%
>     705005 =C2=B1 38%    +142.1%    1706592 =C2=B1 16%  perf-stat.i.node-=
load-misses
>    1896166 =C2=B1 19%     -74.6%     482109 =C2=B1  9%  perf-stat.i.node-=
loads
>      32.55 =C2=B1 21%     +22.2       54.74 =C2=B1  2%  perf-stat.i.node-=
store-miss-rate%
>     151649 =C2=B1 25%    +250.3%     531162 =C2=B1 25%  perf-stat.i.node-=
store-misses
>     258717 =C2=B1 13%     +53.3%     396653 =C2=B1 27%  perf-stat.i.node-=
stores
>      44.38 =C2=B1 20%     -44.1%      24.83 =C2=B1 14%  perf-stat.overall=
.MPKI
>       5.29 =C2=B1 18%      -2.5        2.78 =C2=B1 24%  perf-stat.overall=
.cache-miss-rate%
>       4.53 =C2=B1 12%     -43.2%       2.57 =C2=B1  6%  perf-stat.overall=
.cpi
>       2000 =C2=B1 10%     +95.4%       3907 =C2=B1 13%  perf-stat.overall=
.cycles-between-cache-misses
>       0.56 =C2=B1 18%      -0.3        0.30 =C2=B1 14%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.17 =C2=B1 11%      -0.1        0.11 =C2=B1  7%  perf-stat.overall=
.dTLB-store-miss-rate%
>      64.56 =C2=B1 18%     -29.3       35.28 =C2=B1 15%  perf-stat.overall=
.iTLB-load-miss-rate%
>       1536 =C2=B1 27%    +170.4%       4156 =C2=B1 16%  perf-stat.overall=
.instructions-per-iTLB-miss
>       0.22 =C2=B1 11%     +74.3%       0.39 =C2=B1  6%  perf-stat.overall=
.ipc
>      27.54 =C2=B1 44%     +50.1       77.66 =C2=B1  4%  perf-stat.overall=
.node-load-miss-rate%
>      36.62 =C2=B1 18%     +20.7       57.35 =C2=B1  2%  perf-stat.overall=
.node-store-miss-rate%
>      39129 =C2=B1  3%    +970.2%     418778        perf-stat.overall.path=
-length
>  7.953e+08 =C2=B1  3%    +112.3%  1.689e+09 =C2=B1  2%  perf-stat.ps.bran=
ch-instructions
>    8901858 =C2=B1  3%     -34.0%    5874250 =C2=B1 11%  perf-stat.ps.cach=
e-misses
>      12653 =C2=B1 39%   +2035.1%     270171        perf-stat.ps.context-s=
witches
>  1.778e+10 =C2=B1  9%     +27.2%  2.261e+10 =C2=B1  5%  perf-stat.ps.cpu-=
cycles
>       1.20 =C2=B1  7%    +114.7%       2.58 =C2=B1  7%  perf-stat.ps.cpu-=
migrations
>  1.183e+09 =C2=B1  4%     +96.5%  2.324e+09 =C2=B1  5%  perf-stat.ps.dTLB=
-loads
>  1.391e+09 =C2=B1  9%     +47.5%  2.052e+09 =C2=B1  6%  perf-stat.ps.dTLB=
-stores
>    1486433 =C2=B1 30%    +168.0%    3984068 =C2=B1  8%  perf-stat.ps.iTLB=
-loads
>  3.937e+09 =C2=B1  3%    +123.3%  8.792e+09        perf-stat.ps.instructi=
ons
>     703018 =C2=B1 38%    +142.0%    1701003 =C2=B1 16%  perf-stat.ps.node=
-load-misses
>    1890303 =C2=B1 19%     -74.6%     480418 =C2=B1  9%  perf-stat.ps.node=
-loads
>     151193 =C2=B1 25%    +250.2%     529461 =C2=B1 25%  perf-stat.ps.node=
-store-misses
>     257877 =C2=B1 13%     +53.3%     395431 =C2=B1 27%  perf-stat.ps.node=
-stores
>   1.19e+12 =C2=B1  3%    +122.8%  2.651e+12        perf-stat.total.instru=
ctions
>      55959 =C2=B1  7%     +45.0%      81134 =C2=B1  4%  slabinfo.Acpi-Sta=
te.active_objs
>       1286 =C2=B1  6%     +40.0%       1800 =C2=B1  3%  slabinfo.Acpi-Sta=
te.active_slabs
>      65619 =C2=B1  6%     +39.9%      91828 =C2=B1  3%  slabinfo.Acpi-Sta=
te.num_objs
>       1286 =C2=B1  6%     +40.0%       1800 =C2=B1  3%  slabinfo.Acpi-Sta=
te.num_slabs
>       6871 =C2=B1  6%    +416.0%      35453 =C2=B1 13%  slabinfo.avc_xper=
ms_data.active_objs
>      54.40 =C2=B1  6%    +420.7%     283.25 =C2=B1 12%  slabinfo.avc_xper=
ms_data.active_slabs
>       7019 =C2=B1  6%    +417.9%      36354 =C2=B1 12%  slabinfo.avc_xper=
ms_data.num_objs
>      54.40 =C2=B1  6%    +420.7%     283.25 =C2=B1 12%  slabinfo.avc_xper=
ms_data.num_slabs
>     379.20 =C2=B1  8%     +64.1%     622.25 =C2=B1 11%  slabinfo.biovec-m=
ax.active_objs
>     449.20 =C2=B1  5%     +56.8%     704.50 =C2=B1 11%  slabinfo.biovec-m=
ax.num_objs
>       2562 =C2=B1  5%    +247.2%       8897 =C2=B1 15%  slabinfo.blkdev_i=
oc.active_objs
>      69.20 =C2=B1  5%    +241.8%     236.50 =C2=B1 15%  slabinfo.blkdev_i=
oc.active_slabs
>       2708 =C2=B1  5%    +240.9%       9233 =C2=B1 15%  slabinfo.blkdev_i=
oc.num_objs
>      69.20 =C2=B1  5%    +241.8%     236.50 =C2=B1 15%  slabinfo.blkdev_i=
oc.num_slabs
>      15743 =C2=B1 48%   +1506.2%     252868        slabinfo.btrfs_extent_=
map.active_objs
>     287.60 =C2=B1 48%   +1504.6%       4614        slabinfo.btrfs_extent_=
map.active_slabs
>      16141 =C2=B1 48%   +1501.2%     258447        slabinfo.btrfs_extent_=
map.num_objs
>     287.60 =C2=B1 48%   +1504.6%       4614        slabinfo.btrfs_extent_=
map.num_slabs
>       5954 =C2=B1 25%    +297.0%      23641 =C2=B1  9%  slabinfo.btrfs_or=
dered_extent.active_objs
>     156.20 =C2=B1 25%    +293.9%     615.25 =C2=B1 10%  slabinfo.btrfs_or=
dered_extent.active_slabs
>       6116 =C2=B1 25%    +292.6%      24014 =C2=B1 10%  slabinfo.btrfs_or=
dered_extent.num_objs
>     156.20 =C2=B1 25%    +293.9%     615.25 =C2=B1 10%  slabinfo.btrfs_or=
dered_extent.num_slabs
>       2570 =C2=B1  3%     +85.3%       4762 =C2=B1  6%  slabinfo.buffer_h=
ead.active_objs
>       2570 =C2=B1  3%     +85.3%       4762 =C2=B1  6%  slabinfo.buffer_h=
ead.num_objs
>       5473 =C2=B1 15%     +19.2%       6524 =C2=B1 11%  slabinfo.dmaengin=
e-unmap-16.active_objs
>       5590 =C2=B1 15%     +16.9%       6534 =C2=B1 11%  slabinfo.dmaengin=
e-unmap-16.num_objs
>       5195 =C2=B1 32%    +201.0%      15638 =C2=B1  5%  slabinfo.khugepag=
ed_mm_slot.active_objs
>     149.20 =C2=B1 31%    +201.6%     450.00 =C2=B1  5%  slabinfo.khugepag=
ed_mm_slot.active_slabs
>       5392 =C2=B1 31%    +200.7%      16213 =C2=B1  5%  slabinfo.khugepag=
ed_mm_slot.num_objs
>     149.20 =C2=B1 31%    +201.6%     450.00 =C2=B1  5%  slabinfo.khugepag=
ed_mm_slot.num_slabs
>      17363 =C2=B1  5%     -14.1%      14914        slabinfo.kmalloc-128.a=
ctive_objs
>      17694 =C2=B1  5%     -15.5%      14950        slabinfo.kmalloc-128.n=
um_objs
>      11515 =C2=B1  4%     +45.5%      16760 =C2=B1  5%  slabinfo.kmalloc-=
1k.active_objs
>     370.40 =C2=B1  3%     +44.0%     533.25 =C2=B1  5%  slabinfo.kmalloc-=
1k.active_slabs
>      11877 =C2=B1  3%     +43.8%      17084 =C2=B1  5%  slabinfo.kmalloc-=
1k.num_objs
>     370.40 =C2=B1  3%     +44.0%     533.25 =C2=B1  5%  slabinfo.kmalloc-=
1k.num_slabs
>      29870 =C2=B1  5%     +22.4%      36571 =C2=B1  5%  slabinfo.kmalloc-=
512.active_objs
>     474.80 =C2=B1  5%     +21.8%     578.25 =C2=B1  5%  slabinfo.kmalloc-=
512.active_slabs
>      30417 =C2=B1  5%     +21.8%      37045 =C2=B1  5%  slabinfo.kmalloc-=
512.num_objs
>     474.80 =C2=B1  5%     +21.8%     578.25 =C2=B1  5%  slabinfo.kmalloc-=
512.num_slabs
>     857.60 =C2=B1 12%     +23.1%       1056 =C2=B1  5%  slabinfo.kmalloc-=
rcl-128.active_objs
>     857.60 =C2=B1 12%     +23.1%       1056 =C2=B1  5%  slabinfo.kmalloc-=
rcl-128.num_objs
>       2773 =C2=B1 21%     +62.2%       4499 =C2=B1 11%  slabinfo.mnt_cach=
e.active_objs
>       3119 =C2=B1 18%     +44.4%       4504 =C2=B1 11%  slabinfo.mnt_cach=
e.num_objs
>       2829 =C2=B1  7%    +800.3%      25472 =C2=B1  7%  slabinfo.numa_pol=
icy.active_objs
>      48.40 =C2=B1  9%    +764.7%     418.50 =C2=B1  7%  slabinfo.numa_pol=
icy.active_slabs
>       3037 =C2=B1  8%    +755.0%      25972 =C2=B1  7%  slabinfo.numa_pol=
icy.num_objs
>      48.40 =C2=B1  9%    +764.7%     418.50 =C2=B1  7%  slabinfo.numa_pol=
icy.num_slabs
>      15315 =C2=B1  5%      +8.6%      16637 =C2=B1  4%  slabinfo.pde_open=
er.active_objs
>      15315 =C2=B1  5%      +8.6%      16637 =C2=B1  4%  slabinfo.pde_open=
er.num_objs
>      28822           +25.4%      36129        slabinfo.radix_tree_node.ac=
tive_objs
>     521.60           +24.4%     648.75        slabinfo.radix_tree_node.ac=
tive_slabs
>      29229           +24.4%      36364        slabinfo.radix_tree_node.nu=
m_objs
>     521.60           +24.4%     648.75        slabinfo.radix_tree_node.nu=
m_slabs
>      69749 =C2=B1  5%     -17.4%      57646 =C2=B1  9%  softirqs.CPU1.RCU
>      69613 =C2=B1  7%     -19.5%      56054 =C2=B1  8%  softirqs.CPU108.R=
CU
>      70414 =C2=B1  6%     -20.6%      55890 =C2=B1  9%  softirqs.CPU109.R=
CU
>      74714 =C2=B1  8%     -23.2%      57359 =C2=B1  7%  softirqs.CPU110.R=
CU
>      73840 =C2=B1  6%     -20.7%      58545 =C2=B1  8%  softirqs.CPU111.R=
CU
>      67786 =C2=B1  5%     -21.9%      52950 =C2=B1 10%  softirqs.CPU112.R=
CU
>      63870 =C2=B1  4%     -21.2%      50360 =C2=B1 13%  softirqs.CPU113.R=
CU
>      61631 =C2=B1  7%     -19.8%      49424 =C2=B1  9%  softirqs.CPU115.R=
CU
>      61761 =C2=B1  7%     -23.9%      47005 =C2=B1 14%  softirqs.CPU116.R=
CU
>      66061 =C2=B1  5%     -22.3%      51351 =C2=B1 10%  softirqs.CPU118.R=
CU
>      70757 =C2=B1  5%     -19.6%      56890 =C2=B1 10%  softirqs.CPU13.RCU
>      75075 =C2=B1 10%     -14.4%      64252 =C2=B1  7%  softirqs.CPU137.R=
CU
>      75350 =C2=B1  8%     -23.0%      57993 =C2=B1  7%  softirqs.CPU14.RCU
>      72368 =C2=B1  9%     -18.9%      58718 =C2=B1  8%  softirqs.CPU143.R=
CU
>      69446 =C2=B1  5%     -21.1%      54792 =C2=B1 10%  softirqs.CPU16.RCU
>     132884 =C2=B1  6%     -11.9%     117111 =C2=B1  5%  softirqs.CPU168.T=
IMER
>     131281 =C2=B1  6%     -11.3%     116401 =C2=B1  5%  softirqs.CPU169.T=
IMER
>      65042 =C2=B1  4%     -20.5%      51704 =C2=B1 13%  softirqs.CPU17.RCU
>     132299 =C2=B1  8%     -13.9%     113975 =C2=B1  6%  softirqs.CPU171.T=
IMER
>     130938 =C2=B1  6%     -13.2%     113639 =C2=B1  6%  softirqs.CPU172.T=
IMER
>     130353 =C2=B1  7%     -11.3%     115662 =C2=B1  7%  softirqs.CPU173.T=
IMER
>     131624 =C2=B1  6%     -13.7%     113598 =C2=B1  7%  softirqs.CPU174.T=
IMER
>     131779 =C2=B1  5%     -11.6%     116474 =C2=B1  6%  softirqs.CPU175.T=
IMER
>     131178 =C2=B1  6%     -12.3%     115035 =C2=B1  5%  softirqs.CPU176.T=
IMER
>     130883 =C2=B1  6%     -12.6%     114392 =C2=B1  6%  softirqs.CPU177.T=
IMER
>     130992 =C2=B1  6%     -12.1%     115082 =C2=B1  6%  softirqs.CPU178.T=
IMER
>     129359 =C2=B1  6%     -12.0%     113895 =C2=B1  6%  softirqs.CPU179.T=
IMER
>     131016 =C2=B1  6%     -13.6%     113237 =C2=B1  6%  softirqs.CPU180.T=
IMER
>     131581 =C2=B1  6%     -13.4%     113904 =C2=B1  5%  softirqs.CPU181.T=
IMER
>     133339 =C2=B1  4%     -14.0%     114665 =C2=B1  5%  softirqs.CPU182.T=
IMER
>     135055 =C2=B1  2%     -15.0%     114777 =C2=B1  4%  softirqs.CPU183.T=
IMER
>     134951 =C2=B1  2%     -14.9%     114900 =C2=B1  4%  softirqs.CPU184.T=
IMER
>     133328 =C2=B1  4%     -11.7%     117692 =C2=B1  5%  softirqs.CPU185.T=
IMER
>     137402 =C2=B1  4%     -15.3%     116338 =C2=B1  5%  softirqs.CPU187.T=
IMER
>     132062 =C2=B1  5%     -13.3%     114496 =C2=B1  6%  softirqs.CPU188.T=
IMER
>      70556 =C2=B1  9%     -33.0%      47256 =C2=B1 36%  softirqs.CPU189.R=
CU
>     134578 =C2=B1  2%     -14.7%     114761 =C2=B1  6%  softirqs.CPU189.T=
IMER
>      62949 =C2=B1  6%     -19.9%      50421 =C2=B1  9%  softirqs.CPU19.RCU
>     138820 =C2=B1  6%     -17.1%     115097 =C2=B1  5%  softirqs.CPU190.T=
IMER
>     134281 =C2=B1  4%     -15.0%     114201 =C2=B1  5%  softirqs.CPU191.T=
IMER
>      71300 =C2=B1  7%     -20.3%      56818 =C2=B1 10%  softirqs.CPU2.RCU
>      62736 =C2=B1  6%     -22.8%      48407 =C2=B1 13%  softirqs.CPU20.RCU
>      68849 =C2=B1  8%     -19.5%      55449 =C2=B1 12%  softirqs.CPU21.RCU
>      67408 =C2=B1  5%     -20.1%      53856 =C2=B1 11%  softirqs.CPU22.RCU
>      62986 =C2=B1  6%     -17.2%      52144 =C2=B1 11%  softirqs.CPU23.RCU
>      68774 =C2=B1  9%     -20.9%      54407 =C2=B1  9%  softirqs.CPU3.RCU
>      75690 =C2=B1 11%     -12.9%      65941 =C2=B1  7%  softirqs.CPU41.RCU
>     139020 =C2=B1  9%     -20.4%     110696 =C2=B1 11%  softirqs.CPU45.TI=
MER
>      67053 =C2=B1  4%     -16.4%      56048 =C2=B1 11%  softirqs.CPU5.RCU
>     133216 =C2=B1  6%     -11.6%     117708 =C2=B1  5%  softirqs.CPU72.TI=
MER
>     132145 =C2=B1  6%     -11.3%     117182 =C2=B1  5%  softirqs.CPU73.TI=
MER
>     132757 =C2=B1  7%     -13.4%     114960 =C2=B1  5%  softirqs.CPU75.TI=
MER
>     131495 =C2=B1  6%     -11.7%     116103 =C2=B1  7%  softirqs.CPU77.TI=
MER
>     131972 =C2=B1  6%     -13.8%     113707 =C2=B1  6%  softirqs.CPU78.TI=
MER
>     133041 =C2=B1  5%     -11.9%     117215 =C2=B1  5%  softirqs.CPU79.TI=
MER
>     132358 =C2=B1  6%     -12.2%     116195 =C2=B1  5%  softirqs.CPU80.TI=
MER
>     131900 =C2=B1  6%     -12.2%     115759 =C2=B1  5%  softirqs.CPU82.TI=
MER
>     129868 =C2=B1  6%     -12.0%     114333 =C2=B1  5%  softirqs.CPU83.TI=
MER
>     132383 =C2=B1  6%     -13.3%     114800 =C2=B1  5%  softirqs.CPU84.TI=
MER
>     132694 =C2=B1  6%     -13.2%     115187 =C2=B1  5%  softirqs.CPU85.TI=
MER
>     133890 =C2=B1  4%     -13.7%     115570 =C2=B1  5%  softirqs.CPU86.TI=
MER
>     136355 =C2=B1  2%     -15.3%     115550 =C2=B1  4%  softirqs.CPU87.TI=
MER
>     136051 =C2=B1  2%     -14.7%     116047 =C2=B1  4%  softirqs.CPU88.TI=
MER
>     135749 =C2=B1  4%     -13.2%     117857 =C2=B1  5%  softirqs.CPU89.TI=
MER
>     145904 =C2=B1  6%     -26.2%     107728 =C2=B1 13%  softirqs.CPU90.TI=
MER
>     138001 =C2=B1  3%     -14.8%     117572 =C2=B1  5%  softirqs.CPU91.TI=
MER
>     133596 =C2=B1  5%     -14.2%     114604 =C2=B1  5%  softirqs.CPU92.TI=
MER
>     135980 =C2=B1  2%     -14.4%     116448 =C2=B1  5%  softirqs.CPU93.TI=
MER
>     138826 =C2=B1  5%     -16.5%     115875 =C2=B1  5%  softirqs.CPU94.TI=
MER
>     135092 =C2=B1  4%     -14.9%     114902 =C2=B1  5%  softirqs.CPU95.TI=
MER
>      69464 =C2=B1  4%     -17.2%      57487 =C2=B1 12%  softirqs.CPU97.RCU
>      66667 =C2=B1  9%     -18.1%      54607 =C2=B1 10%  softirqs.CPU99.RCU
>       1181 =C2=B1 49%     -66.3%     397.50 =C2=B1 21%  interrupts.51:PCI=
-MSI.1572864-edge.eth0-TxRx-0
>     152.20 =C2=B1  4%    +180.4%     426.75 =C2=B1 38%  interrupts.63:PCI=
-MSI.1572876-edge.eth0-TxRx-12
>       1181 =C2=B1 49%     -66.3%     397.50 =C2=B1 21%  interrupts.CPU0.5=
1:PCI-MSI.1572864-edge.eth0-TxRx-0
>       1181 =C2=B1 47%    +136.5%       2793 =C2=B1 48%  interrupts.CPU0.R=
ES:Rescheduling_interrupts
>     553.80 =C2=B1115%    +726.9%       4579 =C2=B1 63%  interrupts.CPU1.R=
ES:Rescheduling_interrupts
>      99.00 =C2=B1196%   +2456.1%       2530 =C2=B1133%  interrupts.CPU106=
.RES:Rescheduling_interrupts
>      19.20 =C2=B1170%   +9433.9%       1830 =C2=B1106%  interrupts.CPU113=
.RES:Rescheduling_interrupts
>     442.20 =C2=B1 32%    +111.0%     933.25 =C2=B1 34%  interrupts.CPU115=
.NMI:Non-maskable_interrupts
>     442.20 =C2=B1 32%    +111.0%     933.25 =C2=B1 34%  interrupts.CPU115=
.PMI:Performance_monitoring_interrupts
>     464.00 =C2=B1 28%     +46.1%     678.00 =C2=B1 16%  interrupts.CPU117=
.NMI:Non-maskable_interrupts
>     464.00 =C2=B1 28%     +46.1%     678.00 =C2=B1 16%  interrupts.CPU117=
.PMI:Performance_monitoring_interrupts
>     152.20 =C2=B1  4%    +180.4%     426.75 =C2=B1 38%  interrupts.CPU12.=
63:PCI-MSI.1572876-edge.eth0-TxRx-12
>     105.00 =C2=B1 70%     +99.8%     209.75 =C2=B1 16%  interrupts.CPU124=
.TLB:TLB_shootdowns
>     129.40 =C2=B1 38%     +60.9%     208.25 =C2=B1 23%  interrupts.CPU125=
.TLB:TLB_shootdowns
>     115.60 =C2=B1 53%     +80.4%     208.50 =C2=B1 27%  interrupts.CPU126=
.TLB:TLB_shootdowns
>     107.20 =C2=B1 64%    +103.4%     218.00 =C2=B1 24%  interrupts.CPU127=
.TLB:TLB_shootdowns
>       0.20 =C2=B1200%  +2.5e+05%     492.25 =C2=B1172%  interrupts.CPU129=
.RES:Rescheduling_interrupts
>     119.00 =C2=B1 24%     +73.9%     207.00 =C2=B1 26%  interrupts.CPU129=
.TLB:TLB_shootdowns
>     111.00 =C2=B1 42%     +91.0%     212.00 =C2=B1 28%  interrupts.CPU130=
.TLB:TLB_shootdowns
>     109.80 =C2=B1 57%     +96.3%     215.50 =C2=B1 17%  interrupts.CPU131=
.TLB:TLB_shootdowns
>     125.80 =C2=B1 37%     +52.8%     192.25 =C2=B1 28%  interrupts.CPU132=
.TLB:TLB_shootdowns
>     124.60 =C2=B1 46%     +82.0%     226.75 =C2=B1 20%  interrupts.CPU133=
.TLB:TLB_shootdowns
>     104.00 =C2=B1 69%    +105.5%     213.75 =C2=B1 23%  interrupts.CPU136=
.TLB:TLB_shootdowns
>     127.60 =C2=B1 65%     +78.7%     228.00 =C2=B1 15%  interrupts.CPU137=
.TLB:TLB_shootdowns
>     141.20 =C2=B1 51%     +64.8%     232.75 =C2=B1 15%  interrupts.CPU143=
.TLB:TLB_shootdowns
>     255.80 =C2=B1197%   +1547.5%       4214 =C2=B1 52%  interrupts.CPU144=
.RES:Rescheduling_interrupts
>     474.40 =C2=B1 37%    +113.6%       1013 =C2=B1 43%  interrupts.CPU145=
.NMI:Non-maskable_interrupts
>     474.40 =C2=B1 37%    +113.6%       1013 =C2=B1 43%  interrupts.CPU145=
.PMI:Performance_monitoring_interrupts
>      75.60 =C2=B1188%   +5395.7%       4154 =C2=B1 64%  interrupts.CPU145=
.RES:Rescheduling_interrupts
>     441.80 =C2=B1 26%    +104.6%     903.75 =C2=B1 33%  interrupts.CPU146=
.NMI:Non-maskable_interrupts
>     441.80 =C2=B1 26%    +104.6%     903.75 =C2=B1 33%  interrupts.CPU146=
.PMI:Performance_monitoring_interrupts
>     162.80 =C2=B1193%   +2010.3%       3435 =C2=B1 38%  interrupts.CPU147=
.RES:Rescheduling_interrupts
>     216.00 =C2=B1199%    +915.3%       2193 =C2=B1 59%  interrupts.CPU148=
.RES:Rescheduling_interrupts
>      23.20 =C2=B1195%  +13183.4%       3081 =C2=B1 41%  interrupts.CPU149=
.RES:Rescheduling_interrupts
>     112.40 =C2=B1197%   +1786.6%       2120 =C2=B1106%  interrupts.CPU15.=
RES:Rescheduling_interrupts
>      53.00 =C2=B1199%   +1787.7%       1000 =C2=B1 90%  interrupts.CPU150=
.RES:Rescheduling_interrupts
>     514.00 =C2=B1 26%    +172.0%       1398 =C2=B1 65%  interrupts.CPU151=
.NMI:Non-maskable_interrupts
>     514.00 =C2=B1 26%    +172.0%       1398 =C2=B1 65%  interrupts.CPU151=
.PMI:Performance_monitoring_interrupts
>       0.80 =C2=B1 50%  +4.8e+05%       3804 =C2=B1 87%  interrupts.CPU151=
.RES:Rescheduling_interrupts
>      29.20 =C2=B1196%   +6702.2%       1986 =C2=B1 82%  interrupts.CPU152=
.RES:Rescheduling_interrupts
>      15.60 =C2=B1177%  +28733.3%       4498 =C2=B1 76%  interrupts.CPU153=
.RES:Rescheduling_interrupts
>      10.40 =C2=B1185%  +30938.5%       3228 =C2=B1 67%  interrupts.CPU154=
.RES:Rescheduling_interrupts
>     227.20 =C2=B1199%   +1495.8%       3625 =C2=B1 95%  interrupts.CPU155=
.RES:Rescheduling_interrupts
>       4.60 =C2=B1168%  +62894.6%       2897 =C2=B1 72%  interrupts.CPU156=
.RES:Rescheduling_interrupts
>       1.60 =C2=B1145%  +2.9e+05%       4564 =C2=B1141%  interrupts.CPU157=
.RES:Rescheduling_interrupts
>       0.40 =C2=B1122%  +4.8e+05%       1912 =C2=B1 70%  interrupts.CPU158=
.RES:Rescheduling_interrupts
>       4.40 =C2=B1125%  +1.1e+05%       4798 =C2=B1 95%  interrupts.CPU159=
.RES:Rescheduling_interrupts
>       1.60 =C2=B1122%  +29212.5%     469.00 =C2=B1 99%  interrupts.CPU16.=
RES:Rescheduling_interrupts
>     588.60 =C2=B1 10%     +95.0%       1147 =C2=B1 68%  interrupts.CPU160=
.NMI:Non-maskable_interrupts
>     588.60 =C2=B1 10%     +95.0%       1147 =C2=B1 68%  interrupts.CPU160=
.PMI:Performance_monitoring_interrupts
>       4.40 =C2=B1178%  +73394.3%       3233 =C2=B1105%  interrupts.CPU160=
.RES:Rescheduling_interrupts
>      18.20 =C2=B1200%  +30933.0%       5648 =C2=B1104%  interrupts.CPU161=
.RES:Rescheduling_interrupts
>       5.60 =C2=B1166%  +41708.0%       2341 =C2=B1122%  interrupts.CPU162=
.RES:Rescheduling_interrupts
>       2.80 =C2=B1182%  +1.1e+05%       3193 =C2=B1130%  interrupts.CPU165=
.RES:Rescheduling_interrupts
>       3.20 =C2=B1127%  +77173.4%       2472 =C2=B1108%  interrupts.CPU166=
.RES:Rescheduling_interrupts
>       7.40 =C2=B1122%  +35491.2%       2633 =C2=B1 95%  interrupts.CPU167=
.RES:Rescheduling_interrupts
>       2.60 =C2=B1162%  +24448.1%     638.25 =C2=B1 86%  interrupts.CPU168=
.RES:Rescheduling_interrupts
>       6.80 =C2=B1115%  +39719.9%       2707 =C2=B1 64%  interrupts.CPU169=
.RES:Rescheduling_interrupts
>       2.00 =C2=B1154%  +1.1e+05%       2215 =C2=B1146%  interrupts.CPU170=
.RES:Rescheduling_interrupts
>      95.60 =C2=B1147%   +6538.9%       6346 =C2=B1 99%  interrupts.CPU173=
.RES:Rescheduling_interrupts
>      42.20 =C2=B1162%   +6094.9%       2614 =C2=B1 92%  interrupts.CPU176=
.RES:Rescheduling_interrupts
>       6.20 =C2=B1123%  +32258.9%       2006 =C2=B1138%  interrupts.CPU177=
.RES:Rescheduling_interrupts
>      83.20 =C2=B1169%   +1625.7%       1435 =C2=B1 93%  interrupts.CPU178=
.RES:Rescheduling_interrupts
>       8.60 =C2=B1 78%  +16266.3%       1407 =C2=B1137%  interrupts.CPU179=
.RES:Rescheduling_interrupts
>       5.80 =C2=B1150%  +22417.2%       1306 =C2=B1116%  interrupts.CPU18.=
RES:Rescheduling_interrupts
>      18.00 =C2=B1116%   +8848.6%       1610 =C2=B1 99%  interrupts.CPU182=
.RES:Rescheduling_interrupts
>      12.80 =C2=B1116%   +9329.7%       1207 =C2=B1115%  interrupts.CPU183=
.RES:Rescheduling_interrupts
>      11.40 =C2=B1 87%   +9461.4%       1090 =C2=B1115%  interrupts.CPU184=
.RES:Rescheduling_interrupts
>       3.20 =C2=B1127%  +72095.3%       2310 =C2=B1 53%  interrupts.CPU185=
.RES:Rescheduling_interrupts
>      14.40 =C2=B1142%   +4773.3%     701.75 =C2=B1 87%  interrupts.CPU186=
.RES:Rescheduling_interrupts
>     181.80 =C2=B1165%   +1590.2%       3072 =C2=B1116%  interrupts.CPU19.=
RES:Rescheduling_interrupts
>      72.00 =C2=B1193%   +1860.4%       1411 =C2=B1144%  interrupts.CPU190=
.RES:Rescheduling_interrupts
>      97.80 =C2=B1199%   +2190.1%       2239 =C2=B1 77%  interrupts.CPU191=
.RES:Rescheduling_interrupts
>     424.80 =C2=B1 85%    +749.2%       3607 =C2=B1 56%  interrupts.CPU2.R=
ES:Rescheduling_interrupts
>     273.40 =C2=B1 38%    +756.3%       2341 =C2=B1 81%  interrupts.CPU3.R=
ES:Rescheduling_interrupts
>      70.80 =C2=B1 62%     +95.6%     138.50 =C2=B1 20%  interrupts.CPU35.=
TLB:TLB_shootdowns
>      78.80 =C2=B1 52%     +66.2%     131.00 =C2=B1 14%  interrupts.CPU37.=
TLB:TLB_shootdowns
>     431.40 =C2=B1178%    +519.9%       2674 =C2=B1 66%  interrupts.CPU4.R=
ES:Rescheduling_interrupts
>      75.60 =C2=B1 71%     +85.2%     140.00 =C2=B1 23%  interrupts.CPU41.=
TLB:TLB_shootdowns
>     455.20 =C2=B1 28%     +27.5%     580.25 =C2=B1  5%  interrupts.CPU43.=
NMI:Non-maskable_interrupts
>     455.20 =C2=B1 28%     +27.5%     580.25 =C2=B1  5%  interrupts.CPU43.=
PMI:Performance_monitoring_interrupts
>     547.60 =C2=B1 29%    +106.1%       1128 =C2=B1 53%  interrupts.CPU49.=
NMI:Non-maskable_interrupts
>     547.60 =C2=B1 29%    +106.1%       1128 =C2=B1 53%  interrupts.CPU49.=
PMI:Performance_monitoring_interrupts
>     144.20 =C2=B1194%   +2109.3%       3185 =C2=B1 64%  interrupts.CPU49.=
RES:Rescheduling_interrupts
>     525.60 =C2=B1 26%     +93.7%       1018 =C2=B1 39%  interrupts.CPU50.=
NMI:Non-maskable_interrupts
>     525.60 =C2=B1 26%     +93.7%       1018 =C2=B1 39%  interrupts.CPU50.=
PMI:Performance_monitoring_interrupts
>     105.60 =C2=B1196%   +2363.5%       2601 =C2=B1112%  interrupts.CPU50.=
RES:Rescheduling_interrupts
>     179.60 =C2=B1195%   +1592.4%       3039 =C2=B1 76%  interrupts.CPU51.=
RES:Rescheduling_interrupts
>     489.20 =C2=B1 41%    +111.9%       1036 =C2=B1 52%  interrupts.CPU52.=
NMI:Non-maskable_interrupts
>     489.20 =C2=B1 41%    +111.9%       1036 =C2=B1 52%  interrupts.CPU52.=
PMI:Performance_monitoring_interrupts
>      98.80 =C2=B1188%   +4864.1%       4904 =C2=B1 31%  interrupts.CPU52.=
RES:Rescheduling_interrupts
>     306.40 =C2=B1199%   +1010.6%       3402 =C2=B1 80%  interrupts.CPU53.=
RES:Rescheduling_interrupts
>     119.20 =C2=B1199%   +4899.0%       5958 =C2=B1 59%  interrupts.CPU54.=
RES:Rescheduling_interrupts
>     257.20 =C2=B1191%   +1057.5%       2977 =C2=B1 68%  interrupts.CPU55.=
RES:Rescheduling_interrupts
>     279.60 =C2=B1183%   +1034.1%       3171 =C2=B1 67%  interrupts.CPU56.=
RES:Rescheduling_interrupts
>     131.80 =C2=B1198%   +2156.1%       2973 =C2=B1 61%  interrupts.CPU57.=
RES:Rescheduling_interrupts
>      63.80 =C2=B1166%   +2512.9%       1667 =C2=B1 81%  interrupts.CPU58.=
RES:Rescheduling_interrupts
>       4.00 =C2=B1145%  +69537.5%       2785 =C2=B1 72%  interrupts.CPU59.=
RES:Rescheduling_interrupts
>      47.80 =C2=B1194%   +4304.3%       2105 =C2=B1 87%  interrupts.CPU60.=
RES:Rescheduling_interrupts
>      30.00 =C2=B1191%  +13649.2%       4124 =C2=B1 73%  interrupts.CPU61.=
RES:Rescheduling_interrupts
>       8.00 =C2=B1164%  +27143.8%       2179 =C2=B1133%  interrupts.CPU63.=
RES:Rescheduling_interrupts
>     599.40 =C2=B1 12%     +93.8%       1161 =C2=B1 70%  interrupts.CPU64.=
NMI:Non-maskable_interrupts
>     599.40 =C2=B1 12%     +93.8%       1161 =C2=B1 70%  interrupts.CPU64.=
PMI:Performance_monitoring_interrupts
>       2.00 =C2=B1176%  +1.7e+05%       3456 =C2=B1142%  interrupts.CPU64.=
RES:Rescheduling_interrupts
>      25.60 =C2=B1160%   +8039.6%       2083 =C2=B1 92%  interrupts.CPU65.=
RES:Rescheduling_interrupts
>       2.40 =C2=B1125%    +2e+05%       4832 =C2=B1 56%  interrupts.CPU66.=
RES:Rescheduling_interrupts
>       3.60 =C2=B1127%  +41365.3%       1492 =C2=B1 83%  interrupts.CPU67.=
RES:Rescheduling_interrupts
>       5.00 =C2=B1180%  +38530.0%       1931 =C2=B1 46%  interrupts.CPU68.=
RES:Rescheduling_interrupts
>       5.00 =C2=B1170%  +40085.0%       2009 =C2=B1 32%  interrupts.CPU69.=
RES:Rescheduling_interrupts
>       1.00 =C2=B1200%  +1.1e+05%       1083 =C2=B1 38%  interrupts.CPU70.=
RES:Rescheduling_interrupts
>      16.40 =C2=B1122%   +4921.3%     823.50 =C2=B1 96%  interrupts.CPU71.=
RES:Rescheduling_interrupts
>     557.40 =C2=B1 27%     +32.8%     740.50 =C2=B1 17%  interrupts.CPU72.=
NMI:Non-maskable_interrupts
>     557.40 =C2=B1 27%     +32.8%     740.50 =C2=B1 17%  interrupts.CPU72.=
PMI:Performance_monitoring_interrupts
>      74.80 =C2=B1141%   +4794.4%       3661 =C2=B1 56%  interrupts.CPU72.=
RES:Rescheduling_interrupts
>     186.40 =C2=B1131%   +1223.8%       2467 =C2=B1 56%  interrupts.CPU73.=
RES:Rescheduling_interrupts
>     300.80 =C2=B1 23%     -50.6%     148.50 =C2=B1 80%  interrupts.CPU73.=
TLB:TLB_shootdowns
>      57.20 =C2=B1102%   +3944.1%       2313 =C2=B1 65%  interrupts.CPU74.=
RES:Rescheduling_interrupts
>     176.60 =C2=B1119%   +4455.2%       8044 =C2=B1111%  interrupts.CPU75.=
RES:Rescheduling_interrupts
>      62.40 =C2=B1141%   +5322.7%       3383 =C2=B1 76%  interrupts.CPU76.=
RES:Rescheduling_interrupts
>     295.00 =C2=B1 23%     -50.3%     146.50 =C2=B1 75%  interrupts.CPU76.=
TLB:TLB_shootdowns
>     353.80 =C2=B1178%  +14103.6%      50252 =C2=B1163%  interrupts.CPU77.=
RES:Rescheduling_interrupts
>     102.40 =C2=B1109%   +2070.7%       2222 =C2=B1 89%  interrupts.CPU78.=
RES:Rescheduling_interrupts
>      20.60 =C2=B1 96%  +16923.1%       3506 =C2=B1101%  interrupts.CPU79.=
RES:Rescheduling_interrupts
>      27.20 =C2=B1 88%  +14801.7%       4053 =C2=B1 71%  interrupts.CPU80.=
RES:Rescheduling_interrupts
>     290.20 =C2=B1 19%     -48.6%     149.25 =C2=B1 73%  interrupts.CPU80.=
TLB:TLB_shootdowns
>      14.80 =C2=B1 98%  +21998.0%       3270 =C2=B1 73%  interrupts.CPU81.=
RES:Rescheduling_interrupts
>       2.60 =C2=B1145%  +1.7e+05%       4506 =C2=B1 52%  interrupts.CPU82.=
RES:Rescheduling_interrupts
>     310.60 =C2=B1198%    +928.2%       3193 =C2=B1 54%  interrupts.CPU83.=
RES:Rescheduling_interrupts
>      29.20 =C2=B1103%   +7471.9%       2211 =C2=B1 91%  interrupts.CPU87.=
RES:Rescheduling_interrupts
>     146.00 =C2=B1174%   +2033.9%       3115 =C2=B1 96%  interrupts.CPU90.=
RES:Rescheduling_interrupts
>     124.00 =C2=B1186%   +2279.8%       2951 =C2=B1 95%  interrupts.CPU93.=
RES:Rescheduling_interrupts
>     117885 =C2=B1  8%     +13.6%     133974 =C2=B1  4%  interrupts.NMI:No=
n-maskable_interrupts
>     117885 =C2=B1  8%     +13.6%     133974 =C2=B1  4%  interrupts.PMI:Pe=
rformance_monitoring_interrupts
>      70779 =C2=B1103%    +541.1%     453766 =C2=B1 15%  interrupts.RES:Re=
scheduling_interrupts
>      94.09            -8.1       86.02        perf-profile.calltrace.cycl=
es-pp.secondary_startup_64
>      93.64            -8.0       85.61        perf-profile.calltrace.cycl=
es-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>      93.64            -8.0       85.61        perf-profile.calltrace.cycl=
es-pp.start_secondary.secondary_startup_64
>      93.56            -8.0       85.53        perf-profile.calltrace.cycl=
es-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>      85.57            -7.8       77.77        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_sec=
ondary
>      86.02 =C2=B1  2%      -7.8       78.26        perf-profile.calltrace=
.cycles-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondar=
y_startup_64
>      70.53 =C2=B1  4%      -5.9       64.64        perf-profile.calltrace=
.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup=
_entry
>      13.96 =C2=B1  8%      -2.2       11.74 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter.do_i=
dle.cpu_startup_entry
>       2.87 =C2=B1 14%      -2.2        0.67 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.__GI___libc_write
>       2.73 =C2=B1 14%      -2.1        0.65 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__GI___libc_write
>       2.72 =C2=B1 14%      -2.1        0.65 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___libc_wr=
ite
>       2.53 =C2=B1 13%      -1.9        0.62 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__G=
I___libc_write
>       2.51 =C2=B1 13%      -1.9        0.62 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__GI___libc_write
>       2.46 =C2=B1 13%      -1.9        0.61 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       2.46 =C2=B1 13%      -1.8        0.61 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.btrfs_file_write_iter.new_sync_write.vfs_write.ksys_write.d=
o_syscall_64
>      11.76 =C2=B1  9%      -1.8        9.92 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.smp_apic_timer_interrupt.apic_timer_interrupt.cpuidle_enter=
_state.cpuidle_enter.do_idle
>       2.40 =C2=B1 13%      -1.8        0.60 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.btrfs_buffered_write.btrfs_file_write_iter.new_sync_write.v=
fs_write.ksys_write
>       3.12 =C2=B1  5%      -0.5        2.67 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.tick_nohz_get_sleep_length.menu_select.do_idle.cpu_startup_=
entry.start_secondary
>       0.00            +0.6        0.59 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__account_scheduler_latency.enqueue_entity.enqueue_task_fair.act=
ivate_task.ttwu_do_activate
>       0.00            +0.6        0.65 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search_slot=
.btrfs_lookup_file_extent.run_delalloc_nocow
>       0.00            +0.6        0.65 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.enqueue_entity.enqueue_task_fair.activate_task.ttwu_do_activate.=
try_to_wake_up
>       0.00            +0.7        0.65 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_file_ex=
tent.run_delalloc_nocow.btrfs_run_delalloc_range
>       0.00            +0.7        0.66 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.activate_task.ttwu_do_activate.try_to_wake_up.autoremove_wake_fu=
nction.__wake_up_common
>       0.00            +0.7        0.66 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.enqueue_task_fair.activate_task.ttwu_do_activate.try_to_wake_up.=
autoremove_wake_function
>       0.00            +0.7        0.67 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.setup_items_for_insert.__btrfs_drop_extents.insert_reserved_file=
_extent.btrfs_finish_ordered_io.normal_work_helper
>       0.00            +0.7        0.67 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_=
up_common.__wake_up_common_lock
>       0.00            +0.7        0.70 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.__btrfs_free_extent.__btrfs_run_delayed_refs.btrfs_run_delayed_r=
efs.btrfs_commit_transaction.flush_space
>       0.00            +0.8        0.80 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.check_leaf.btree_csum_one_bio.btree_submit_bio_hook.submit_one_b=
io.submit_extent_page
>       0.00            +0.8        0.80 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_lookup_file_extent.run_delalloc_nocow.bt=
rfs_run_delalloc_range.writepage_delalloc
>       0.00            +0.8        0.81 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btrfs_lookup_file_extent.run_delalloc_nocow.btrfs_run_delalloc_r=
ange.writepage_delalloc.__extent_writepage
>       0.00            +0.8        0.82 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btree_csum_one_bio.btree_submit_bio_hook.submit_one_bio.submit_e=
xtent_page.write_one_eb
>       0.00            +0.8        0.82 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.submit_one_bio.submit_extent_page.write_one_eb.btree_write_cache=
_pages.do_writepages
>       0.00            +0.8        0.82 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.btree_submit_bio_hook.submit_one_bio.submit_extent_page.write_on=
e_eb.btree_write_cache_pages
>       0.00            +0.8        0.83 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.submit_extent_page.write_one_eb.btree_write_cache_pages.do_write=
pages.__filemap_fdatawrite_range
>       0.00            +0.9        0.87 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_=
up_common_lock.unlock_up
>       0.00            +0.9        0.88 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.write_one_eb.btree_write_cache_pages.do_writepages.__filemap_fda=
tawrite_range.btrfs_write_marked_extents
>       0.00            +0.9        0.91 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.do_writepages.__filemap_fdatawrite_range.btrfs_write_marked_exte=
nts.btrfs_write_and_wait_transaction.btrfs_commit_transaction
>       0.00            +0.9        0.91 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.__filemap_fdatawrite_range.btrfs_write_marked_extents.btrfs_writ=
e_and_wait_transaction.btrfs_commit_transaction.flush_space
>       0.00            +0.9        0.91 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btrfs_write_and_wait_transaction.btrfs_commit_transaction.flush_=
space.btrfs_async_reclaim_metadata_space.process_one_work
>       0.00            +0.9        0.91 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btrfs_write_marked_extents.btrfs_write_and_wait_transaction.btrf=
s_commit_transaction.flush_space.btrfs_async_reclaim_metadata_space
>       0.00            +0.9        0.91 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btree_write_cache_pages.do_writepages.__filemap_fdatawrite_range=
.btrfs_write_marked_extents.btrfs_write_and_wait_transaction
>       0.00            +0.9        0.91 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.=
unlock_up.btrfs_search_slot
>       0.00            +0.9        0.91 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.__wake_up_common.__wake_up_common_lock.unlock_up.btrfs_search_sl=
ot.btrfs_lookup_file_extent
>       0.00            +0.9        0.91 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.__wake_up_common_lock.unlock_up.btrfs_search_slot.btrfs_lookup_f=
ile_extent.__btrfs_drop_extents
>       0.00            +0.9        0.94 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.unlock_up.btrfs_search_slot.btrfs_lookup_file_extent.__btrfs_dro=
p_extents.insert_reserved_file_extent
>       0.00            +1.1        1.07 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.btrfs_run_delayed_refs.btrfs_commit_transaction.flush_space.btrf=
s_async_reclaim_metadata_space.process_one_work
>       0.00            +1.1        1.07 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.__btrfs_run_delayed_refs.btrfs_run_delayed_refs.btrfs_commit_tra=
nsaction.flush_space.btrfs_async_reclaim_metadata_space
>       0.00            +1.3        1.31 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.btrfs_run_delalloc_range.writepage_delalloc.__extent_writepage.e=
xtent_write_cache_pages.extent_writepages
>       0.00            +1.3        1.31 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.run_delalloc_nocow.btrfs_run_delalloc_range.writepage_delalloc._=
_extent_writepage.extent_write_cache_pages
>       0.00            +1.4        1.35 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_=
to_wait_event.btrfs_tree_lock.btrfs_lock_root_node
>       0.00            +1.4        1.38 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.writepage_delalloc.__extent_writepage.extent_write_cache_pages.e=
xtent_writepages.do_writepages
>       0.00            +1.4        1.38 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.btrfs_tree_lock.btr=
fs_lock_root_node.btrfs_search_slot
>       0.00            +1.4        1.44 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.prepare_to_wait_event.btrfs_tree_lock.btrfs_lock_root_node.btrfs=
_search_slot.btrfs_lookup_file_extent
>       0.00            +1.5        1.47 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.__extent_writepage.extent_write_cache_pages.extent_writepages.do=
_writepages.__writeback_single_inode
>       0.00            +1.5        1.52 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.do_writepages.__writeback_single_inode.writeback_sb_inodes.wb_wr=
iteback.wb_workfn
>       0.00            +1.5        1.52 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.extent_writepages.do_writepages.__writeback_single_inode.writeba=
ck_sb_inodes.wb_writeback
>       0.00            +1.5        1.52 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.extent_write_cache_pages.extent_writepages.do_writepages.__write=
back_single_inode.writeback_sb_inodes
>       0.00            +1.5        1.52 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.wb_workfn.process_one_work.worker_thread.kthread.ret_from_fork
>       0.00            +1.5        1.52 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.wb_writeback.wb_workfn.process_one_work.worker_thread.kthread
>       0.00            +1.5        1.52 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.writeback_sb_inodes.wb_writeback.wb_workfn.process_one_work.work=
er_thread
>       0.00            +1.5        1.52 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.__writeback_single_inode.writeback_sb_inodes.wb_writeback.wb_wor=
kfn.process_one_work
>       0.00            +1.8        1.77 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.btrfs_loo=
kup_file_extent.__btrfs_drop_extents
>       0.00            +1.8        1.78 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_lookup_file_extent.=
__btrfs_drop_extents.insert_reserved_file_extent
>       0.00            +2.1        2.06 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btrfs_commit_transaction.flush_space.btrfs_async_reclaim_metadat=
a_space.process_one_work.worker_thread
>       0.00            +2.1        2.10 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btrfs_async_reclaim_metadata_space.process_one_work.worker_threa=
d.kthread.ret_from_fork
>       0.00            +2.1        2.10 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.flush_space.btrfs_async_reclaim_metadata_space.process_one_work.=
worker_thread.kthread
>       0.00            +2.3        2.32 =C2=B1 18%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.prepare_=
to_wait_event.btrfs_tree_read_lock.btrfs_read_lock_root_node
>       0.00            +2.3        2.32 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.btrfs_tree_read_lock.btrfs_read_lock_root_node.btrfs_search_slot=
.btrfs_lookup_file_extent.__btrfs_drop_extents
>       0.00            +2.3        2.34 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.btrfs_read_lock_root_node.btrfs_search_slot.btrfs_lookup_file_ex=
tent.__btrfs_drop_extents.insert_reserved_file_extent
>       0.00            +2.5        2.48 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.prepare_to_wait_event.btrfs_tree_read_loc=
k.btrfs_read_lock_root_node.btrfs_search_slot
>       0.00            +2.6        2.56 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.prepare_to_wait_event.btrfs_tree_read_lock.btrfs_read_lock_root_=
node.btrfs_search_slot.btrfs_lookup_file_extent
>       0.00            +6.0        5.98 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.btrfs_search_slot.btrfs_lookup_file_extent.__btrfs_drop_extents.=
insert_reserved_file_extent.btrfs_finish_ordered_io
>       0.00            +6.0        5.99 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.btrfs_lookup_file_extent.__btrfs_drop_extents.insert_reserved_fi=
le_extent.btrfs_finish_ordered_io.normal_work_helper
>       0.00            +7.0        7.04 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.__btrfs_drop_extents.insert_reserved_file_extent.btrfs_finish_or=
dered_io.normal_work_helper.process_one_work
>       0.00            +7.2        7.22 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.insert_reserved_file_extent.btrfs_finish_ordered_io.normal_work_=
helper.process_one_work.worker_thread
>       0.00            +8.1        8.09 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.btrfs_finish_ordered_io.normal_work_helper.process_one_work.work=
er_thread.kthread
>       0.00            +8.2        8.23 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.normal_work_helper.process_one_work.worker_thread.kthread.ret_fr=
om_fork
>       0.00           +12.0       12.01 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
>       0.00           +12.1       12.10 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.worker_thread.kthread.ret_from_fork
>       0.00           +12.1       12.12 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.ret_from_fork
>       0.00           +12.1       12.12 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.kthread.ret_from_fork
>      94.13            -8.1       86.05        perf-profile.children.cycle=
s-pp.do_idle
>      94.09            -8.1       86.02        perf-profile.children.cycle=
s-pp.secondary_startup_64
>      94.09            -8.1       86.02        perf-profile.children.cycle=
s-pp.cpu_startup_entry
>      93.64            -8.0       85.61        perf-profile.children.cycle=
s-pp.start_secondary
>      86.44            -7.8       78.64        perf-profile.children.cycle=
s-pp.cpuidle_enter
>      86.41            -7.8       78.61        perf-profile.children.cycle=
s-pp.cpuidle_enter_state
>      70.89 =C2=B1  4%      -5.9       64.96 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.intel_idle
>       4.07 =C2=B1 15%      -2.9        1.12 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>       4.05 =C2=B1 15%      -2.9        1.11 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       2.88 =C2=B1 14%      -2.1        0.78 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__GI___libc_write
>      13.05 =C2=B1  8%      -2.0       11.04 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.apic_timer_interrupt
>       2.55 =C2=B1 13%      -1.8        0.73 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.ksys_write
>      11.87 =C2=B1  9%      -1.8       10.07 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.smp_apic_timer_interrupt
>       2.53 =C2=B1 13%      -1.8        0.73 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       2.48 =C2=B1 13%      -1.8        0.72 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>       2.46 =C2=B1 13%      -1.7        0.71 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btrfs_file_write_iter
>       2.40 =C2=B1 13%      -1.7        0.70 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btrfs_buffered_write
>       0.83 =C2=B1 19%      -0.7        0.12 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.posix_fadvise
>       0.82 =C2=B1 20%      -0.7        0.12 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__x64_sys_fadvise64
>       0.82 =C2=B1 20%      -0.7        0.12 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.generic_fadvise
>       0.82 =C2=B1 20%      -0.7        0.12 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.ksys_fadvise64_64
>       3.15 =C2=B1  5%      -0.4        2.70 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       0.51 =C2=B1 10%      -0.4        0.10 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.btrfs_copy_from_user
>       0.48 =C2=B1 10%      -0.4        0.09 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.iov_iter_copy_from_user_atomic
>       0.47 =C2=B1 11%      -0.4        0.09 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.copy_user_enhanced_fast_string
>       0.47 =C2=B1 11%      -0.4        0.09 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.copyin
>       0.39 =C2=B1 14%      -0.3        0.05 =C2=B1 58%  perf-profile.chil=
dren.cycles-pp.llseek
>       0.42 =C2=B1 21%      -0.3        0.11 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.lock_and_cleanup_extent_if_need
>       0.49 =C2=B1 18%      -0.3        0.20 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.btrfs_dirty_pages
>       0.32 =C2=B1 19%      -0.3        0.07 =C2=B1 57%  perf-profile.chil=
dren.cycles-pp.invalidate_mapping_pages
>       0.49 =C2=B1  9%      -0.2        0.25 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.ret_from_intr
>       0.43 =C2=B1 10%      -0.2        0.19 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.handle_irq_event
>       0.43 =C2=B1 10%      -0.2        0.19 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.handle_irq_event_percpu
>       0.43 =C2=B1 10%      -0.2        0.19 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__handle_irq_event_percpu
>       0.43 =C2=B1 10%      -0.2        0.19 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.nvme_irq
>       0.30 =C2=B1 19%      -0.2        0.06 =C2=B1 59%  perf-profile.chil=
dren.cycles-pp.prepare_pages
>       0.43 =C2=B1  9%      -0.2        0.19 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.blk_mq_complete_request
>       0.44 =C2=B1  9%      -0.2        0.21 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.do_IRQ
>       0.43 =C2=B1 10%      -0.2        0.20 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.handle_edge_irq
>       0.38 =C2=B1  8%      -0.2        0.15 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.end_bio_extent_writepage
>       0.25 =C2=B1  9%      -0.2        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.end_page_writeback
>       0.32 =C2=B1 19%      -0.2        0.10 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.pagecache_get_page
>       0.39 =C2=B1  9%      -0.2        0.18 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.blk_mq_end_request
>       0.39 =C2=B1  9%      -0.2        0.18 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.blk_update_request
>       0.38 =C2=B1  9%      -0.2        0.17 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.btrfs_end_bio
>       0.38 =C2=B1 16%      -0.2        0.21 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__clear_extent_bit
>       0.18 =C2=B1 16%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.find_get_entry
>       0.17 =C2=B1 10%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.test_clear_page_writeback
>       0.23 =C2=B1 22%      -0.1        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__extent_writepage_io
>       0.43 =C2=B1 10%      -0.1        0.32 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.run_timer_softirq
>       0.21 =C2=B1 12%      -0.1        0.11 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.clear_extent_bit
>       0.64 =C2=B1 12%      -0.1        0.55 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       0.14 =C2=B1  9%      -0.1        0.05 =C2=B1 60%  perf-profile.chil=
dren.cycles-pp.xas_load
>       0.11 =C2=B1 20%      -0.1        0.05        perf-profile.children.=
cycles-pp.alloc_extent_state
>       0.14 =C2=B1 11%      -0.0        0.10 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.account_process_tick
>       0.09 =C2=B1 21%      -0.0        0.06 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__perf_event_read_value
>       0.05 =C2=B1 50%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__list_del_entry_valid
>       0.02 =C2=B1122%      +0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__slab_alloc
>       0.01 =C2=B1200%      +0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.___slab_alloc
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.btrfs_update_inode_fallback
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.btrfs_update_inode
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.leaf_space_used
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.btrfs_update_block_group
>       0.00            +0.1        0.05 =C2=B1  9%  perf-profile.children.=
cycles-pp.btrfs_mark_buffer_dirty
>       0.00            +0.1        0.05 =C2=B1  9%  perf-profile.children.=
cycles-pp.btrfs_remove_ordered_extent
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.queued_read_lock_slowpath
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.check_preempt_curr
>       0.00            +0.1        0.06 =C2=B1 11%  perf-profile.children.=
cycles-pp.__switch_to
>       0.00            +0.1        0.06 =C2=B1 16%  perf-profile.children.=
cycles-pp.tick_nohz_idle_exit
>       0.00            +0.1        0.06 =C2=B1  6%  perf-profile.children.=
cycles-pp.__radix_tree_lookup
>       0.10 =C2=B1 16%      +0.1        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       0.00            +0.1        0.07 =C2=B1 13%  perf-profile.children.=
cycles-pp.free_extent_buffer
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.children.=
cycles-pp.find_free_extent
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.children.=
cycles-pp.get_extent_allocation_hint
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.children.=
cycles-pp.__update_load_avg_cfs_rq
>       0.00            +0.1        0.07 =C2=B1 17%  perf-profile.children.=
cycles-pp.__module_text_address
>       0.00            +0.1        0.07 =C2=B1 10%  perf-profile.children.=
cycles-pp.ttwu_do_wakeup
>       0.00            +0.1        0.07 =C2=B1 20%  perf-profile.children.=
cycles-pp.extent_clear_unlock_delalloc
>       0.00            +0.1        0.07 =C2=B1  5%  perf-profile.children.=
cycles-pp.set_next_entity
>       0.00            +0.1        0.08 =C2=B1  6%  perf-profile.children.=
cycles-pp.btrfs_reserve_extent
>       0.00            +0.1        0.08 =C2=B1 10%  perf-profile.children.=
cycles-pp.btrfs_lookup_csum
>       0.05 =C2=B1 52%      +0.1        0.13 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.btrfs_get_extent
>       0.00            +0.1        0.08 =C2=B1 15%  perf-profile.children.=
cycles-pp.__unwind_start
>       0.00            +0.1        0.08 =C2=B1 15%  perf-profile.children.=
cycles-pp.is_module_text_address
>       0.02 =C2=B1122%      +0.1        0.11 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.end_extent_writepage
>       0.00            +0.1        0.09 =C2=B1  4%  perf-profile.children.=
cycles-pp.memcpy_extent_buffer
>       0.01 =C2=B1200%      +0.1        0.11 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.btrfs_writepage_endio_finish_ordered
>       0.00            +0.1        0.10 =C2=B1  7%  perf-profile.children.=
cycles-pp.read_extent_buffer
>       0.00            +0.1        0.10 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_alloc_reserved_file_extent
>       0.00            +0.1        0.11 =C2=B1 14%  perf-profile.children.=
cycles-pp.kernel_text_address
>       0.00            +0.1        0.11 =C2=B1  8%  perf-profile.children.=
cycles-pp.alloc_tree_block_no_bg_flush
>       0.00            +0.1        0.11 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_alloc_tree_block
>       0.00            +0.1        0.11 =C2=B1 16%  perf-profile.children.=
cycles-pp.__queue_work
>       0.00            +0.1        0.11 =C2=B1  7%  perf-profile.children.=
cycles-pp.__switch_to_asm
>       0.00            +0.1        0.11 =C2=B1 11%  perf-profile.children.=
cycles-pp.__kernel_text_address
>       0.00            +0.1        0.11 =C2=B1  7%  perf-profile.children.=
cycles-pp.select_task_rq_fair
>       0.00            +0.1        0.11 =C2=B1 14%  perf-profile.children.=
cycles-pp.queue_work_on
>       0.00            +0.1        0.12 =C2=B1  9%  perf-profile.children.=
cycles-pp.update_load_avg
>       0.00            +0.1        0.12 =C2=B1  7%  perf-profile.children.=
cycles-pp.add_delayed_ref_head
>       0.00            +0.1        0.12 =C2=B1 11%  perf-profile.children.=
cycles-pp.btrfs_free_extent
>       0.00            +0.1        0.12 =C2=B1  5%  perf-profile.children.=
cycles-pp.stack_trace_consume_entry_nosched
>       0.00            +0.1        0.12        perf-profile.children.cycle=
s-pp.btrfs_release_path
>       0.00            +0.1        0.12 =C2=B1 13%  perf-profile.children.=
cycles-pp.dequeue_entity
>       0.00            +0.1        0.12 =C2=B1 28%  perf-profile.children.=
cycles-pp.unpin_extent_cache
>       0.00            +0.1        0.13 =C2=B1 11%  perf-profile.children.=
cycles-pp.unwind_get_return_address
>       0.00            +0.1        0.13 =C2=B1  6%  perf-profile.children.=
cycles-pp.lookup_inline_extent_backref
>       0.00            +0.1        0.14 =C2=B1  3%  perf-profile.children.=
cycles-pp.find_extent_buffer
>       0.00            +0.1        0.15 =C2=B1 11%  perf-profile.children.=
cycles-pp.btrfs_extend_item
>       0.00            +0.1        0.15 =C2=B1 22%  perf-profile.children.=
cycles-pp.__module_address
>       0.00            +0.1        0.15 =C2=B1  8%  perf-profile.children.=
cycles-pp.copy_extent_buffer_full
>       0.00            +0.2        0.15 =C2=B1 10%  perf-profile.children.=
cycles-pp.copy_page
>       0.52 =C2=B1 14%      +0.2        0.67 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       0.00            +0.2        0.16 =C2=B1  6%  perf-profile.children.=
cycles-pp.btrfs_truncate_item
>       0.00            +0.2        0.16 =C2=B1  5%  perf-profile.children.=
cycles-pp.pick_next_task_fair
>       0.00            +0.2        0.16 =C2=B1  9%  perf-profile.children.=
cycles-pp.dequeue_task_fair
>       0.00            +0.2        0.16 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_get_8
>       0.00            +0.2        0.16 =C2=B1  5%  perf-profile.children.=
cycles-pp.truncate_one_csum
>       0.00            +0.2        0.17 =C2=B1 10%  perf-profile.children.=
cycles-pp.btrfs_drop_extent_cache
>       0.00            +0.2        0.20 =C2=B1  2%  perf-profile.children.=
cycles-pp.generic_bin_search
>       0.00            +0.2        0.20 =C2=B1  5%  perf-profile.children.=
cycles-pp.memmove_extent_buffer
>       0.00            +0.2        0.21 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_add_delayed_data_ref
>       0.00            +0.2        0.22 =C2=B1  3%  perf-profile.children.=
cycles-pp.read_block_for_search
>       0.00            +0.2        0.22 =C2=B1 18%  perf-profile.children.=
cycles-pp.finish_wait
>       0.00            +0.2        0.22 =C2=B1  5%  perf-profile.children.=
cycles-pp.alloc_reserved_file_extent
>       0.00            +0.2        0.24 =C2=B1  4%  perf-profile.children.=
cycles-pp.memmove
>       0.00            +0.3        0.27 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_insert_empty_items
>       0.00            +0.3        0.27 =C2=B1  9%  perf-profile.children.=
cycles-pp.__orc_find
>       0.00            +0.3        0.28 =C2=B1  7%  perf-profile.children.=
cycles-pp.schedule_idle
>       0.00            +0.3        0.30 =C2=B1  3%  perf-profile.children.=
cycles-pp.btrfs_set_token_32
>       0.00            +0.3        0.31 =C2=B1  7%  perf-profile.children.=
cycles-pp.btrfs_del_csums
>       0.00            +0.3        0.31 =C2=B1  3%  perf-profile.children.=
cycles-pp.__btrfs_cow_block
>       0.01 =C2=B1200%      +0.3        0.33 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.__lookup_extent_mapping
>       0.00            +0.3        0.32 =C2=B1  2%  perf-profile.children.=
cycles-pp.btrfs_cow_block
>       0.00            +0.3        0.32 =C2=B1  6%  perf-profile.children.=
cycles-pp.btrfs_get_32
>       0.00            +0.3        0.34 =C2=B1  3%  perf-profile.children.=
cycles-pp.btrfs_get_token_32
>       0.00            +0.4        0.35 =C2=B1  7%  perf-profile.children.=
cycles-pp.add_pending_csums
>       0.00            +0.4        0.35 =C2=B1  7%  perf-profile.children.=
cycles-pp.btrfs_csum_file_blocks
>       0.00            +0.4        0.35 =C2=B1 11%  perf-profile.children.=
cycles-pp.orc_find
>       0.00            +0.4        0.38 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_get_64
>       0.00            +0.4        0.39 =C2=B1 18%  perf-profile.children.=
cycles-pp.btrfs_try_tree_write_lock
>       0.01 =C2=B1200%      +0.4        0.40 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.schedule
>       0.00            +0.4        0.45 =C2=B1  2%  perf-profile.children.=
cycles-pp.map_private_extent_buffer
>       0.00            +0.5        0.46 =C2=B1 14%  perf-profile.children.=
cycles-pp.queued_write_lock_slowpath
>       0.50 =C2=B1 20%      +0.5        0.96 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__filemap_fdatawrite_range
>       0.00            +0.5        0.47 =C2=B1 11%  perf-profile.children.=
cycles-pp.cow_file_range
>       0.00            +0.5        0.49        perf-profile.children.cycle=
s-pp.btrfs_del_items
>       0.00            +0.5        0.50 =C2=B1 10%  perf-profile.children.=
cycles-pp.btrfs_unlock_up_safe
>       0.10 =C2=B1 22%      +0.6        0.67 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.poll_idle
>       0.04 =C2=B1 87%      +0.6        0.66 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__schedule
>       0.00            +0.6        0.62 =C2=B1  9%  perf-profile.children.=
cycles-pp.unwind_next_frame
>       0.00            +0.7        0.73 =C2=B1  3%  perf-profile.children.=
cycles-pp.__btrfs_free_extent
>       0.00            +0.8        0.82 =C2=B1  4%  perf-profile.children.=
cycles-pp.check_leaf
>       0.05 =C2=B1 50%      +0.8        0.88 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.submit_extent_page
>       0.00            +0.8        0.83 =C2=B1  6%  perf-profile.children.=
cycles-pp.setup_items_for_insert
>       0.00            +0.8        0.83 =C2=B1  4%  perf-profile.children.=
cycles-pp.btree_csum_one_bio
>       0.00            +0.8        0.84 =C2=B1  3%  perf-profile.children.=
cycles-pp.btree_submit_bio_hook
>       0.00            +0.9        0.86 =C2=B1  3%  perf-profile.children.=
cycles-pp.submit_one_bio
>       0.00            +0.9        0.88 =C2=B1  4%  perf-profile.children.=
cycles-pp.write_one_eb
>       0.00            +0.9        0.91 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_write_and_wait_transaction
>       0.00            +0.9        0.91 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_write_marked_extents
>       0.00            +0.9        0.91 =C2=B1  4%  perf-profile.children.=
cycles-pp.btree_write_cache_pages
>       0.00            +0.9        0.92 =C2=B1  9%  perf-profile.children.=
cycles-pp.arch_stack_walk
>       0.00            +1.0        0.96 =C2=B1  5%  perf-profile.children.=
cycles-pp.unlock_up
>       0.00            +1.0        0.99 =C2=B1  7%  perf-profile.children.=
cycles-pp.stack_trace_save_tsk
>       0.52 =C2=B1 21%      +1.1        1.57 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.extent_writepages
>       0.52 =C2=B1 21%      +1.1        1.57 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.extent_write_cache_pages
>       0.00            +1.1        1.11 =C2=B1  7%  perf-profile.children.=
cycles-pp.__account_scheduler_latency
>       0.41 =C2=B1 23%      +1.1        1.53 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__extent_writepage
>       0.00            +1.1        1.11 =C2=B1  3%  perf-profile.children.=
cycles-pp.btrfs_run_delayed_refs
>       0.00            +1.1        1.11 =C2=B1  3%  perf-profile.children.=
cycles-pp.__btrfs_run_delayed_refs
>       0.01 =C2=B1200%      +1.2        1.25 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       0.01 =C2=B1200%      +1.3        1.28 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       0.01 =C2=B1200%      +1.3        1.28 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.activate_task
>       0.01 =C2=B1200%      +1.3        1.28 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       0.12 =C2=B1 24%      +1.3        1.42 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.writepage_delalloc
>       0.00            +1.3        1.34 =C2=B1  4%  perf-profile.children.=
cycles-pp.run_delalloc_nocow
>       0.00            +1.4        1.35 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_run_delalloc_range
>       0.00            +1.4        1.43 =C2=B1  7%  perf-profile.children.=
cycles-pp.autoremove_wake_function
>       0.00            +1.5        1.45 =C2=B1  7%  perf-profile.children.=
cycles-pp.__wake_up_common
>       0.02 =C2=B1125%      +1.5        1.51 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       0.01 =C2=B1200%      +1.5        1.50 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>       0.01 =C2=B1200%      +1.5        1.52 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.wb_workfn
>       0.01 =C2=B1200%      +1.5        1.52 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.wb_writeback
>       0.01 =C2=B1200%      +1.5        1.52 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.writeback_sb_inodes
>       0.01 =C2=B1200%      +1.5        1.52 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__writeback_single_inode
>       0.00            +1.8        1.80 =C2=B1  7%  perf-profile.children.=
cycles-pp.btrfs_lock_root_node
>       0.00            +1.9        1.86 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_tree_lock
>       0.52 =C2=B1 21%      +2.0        2.47 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.do_writepages
>       0.00            +2.1        2.06 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_commit_transaction
>       0.00            +2.1        2.10 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_async_reclaim_metadata_space
>       0.00            +2.1        2.10 =C2=B1  4%  perf-profile.children.=
cycles-pp.flush_space
>       0.00            +3.0        3.01 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_tree_read_lock
>       0.00            +3.0        3.03 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_read_lock_root_node
>       0.55 =C2=B1  4%      +4.0        4.58 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.00            +4.0        4.04 =C2=B1  5%  perf-profile.children.=
cycles-pp.prepare_to_wait_event
>       0.13 =C2=B1 22%      +4.1        4.23 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       0.00            +6.8        6.82 =C2=B1  5%  perf-profile.children.=
cycles-pp.btrfs_lookup_file_extent
>       0.00            +7.0        7.04 =C2=B1  5%  perf-profile.children.=
cycles-pp.__btrfs_drop_extents
>       0.00            +7.2        7.22 =C2=B1  5%  perf-profile.children.=
cycles-pp.insert_reserved_file_extent
>       0.00            +7.2        7.23 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_search_slot
>       0.17 =C2=B1 15%      +8.1        8.23 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.normal_work_helper
>       0.00            +8.1        8.09 =C2=B1  4%  perf-profile.children.=
cycles-pp.btrfs_finish_ordered_io
>       0.28 =C2=B1 18%     +11.7       12.01 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.33 =C2=B1 15%     +11.8       12.12 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       0.33 =C2=B1 15%     +11.8       12.12 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.kthread
>       0.30 =C2=B1 19%     +11.8       12.10 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.worker_thread
>      70.79 =C2=B1  4%      -5.9       64.88 =C2=B1  2%  perf-profile.self=
.cycles-pp.intel_idle
>       0.46 =C2=B1  8%      -0.4        0.08 =C2=B1 21%  perf-profile.self=
.cycles-pp.copy_user_enhanced_fast_string
>       0.35 =C2=B1 20%      -0.3        0.05 =C2=B1 60%  perf-profile.self=
.cycles-pp.do_syscall_64
>       0.64 =C2=B1 12%      -0.1        0.55 =C2=B1  4%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.12 =C2=B1  6%      -0.1        0.03 =C2=B1100%  perf-profile.self=
.cycles-pp.xas_load
>       0.34 =C2=B1 10%      -0.1        0.26 =C2=B1  5%  perf-profile.self=
.cycles-pp.run_timer_softirq
>       0.19 =C2=B1  7%      -0.0        0.14 =C2=B1 15%  perf-profile.self=
.cycles-pp.__softirqentry_text_start
>       0.27 =C2=B1  8%      -0.0        0.23 =C2=B1  4%  perf-profile.self=
.cycles-pp.interrupt_entry
>       0.01 =C2=B1200%      +0.0        0.06 =C2=B1  9%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       0.00            +0.1        0.06 =C2=B1 15%  perf-profile.self.cycl=
es-pp.set_next_entity
>       0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cycl=
es-pp.btrfs_del_items
>       0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cycl=
es-pp.__radix_tree_lookup
>       0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cycl=
es-pp.__switch_to
>       0.00            +0.1        0.07 =C2=B1 13%  perf-profile.self.cycl=
es-pp.stack_trace_save_tsk
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.self.cycl=
es-pp.__update_load_avg_cfs_rq
>       0.00            +0.1        0.07 =C2=B1 10%  perf-profile.self.cycl=
es-pp.select_task_rq_fair
>       0.00            +0.1        0.07 =C2=B1  5%  perf-profile.self.cycl=
es-pp.btrfs_search_slot
>       0.00            +0.1        0.07 =C2=B1 20%  perf-profile.self.cycl=
es-pp.__account_scheduler_latency
>       0.00            +0.1        0.08 =C2=B1  6%  perf-profile.self.cycl=
es-pp.check_leaf
>       0.00            +0.1        0.08 =C2=B1 15%  perf-profile.self.cycl=
es-pp.try_to_wake_up
>       0.00            +0.1        0.08 =C2=B1  8%  perf-profile.self.cycl=
es-pp.stack_trace_consume_entry_nosched
>       0.00            +0.1        0.09 =C2=B1  7%  perf-profile.self.cycl=
es-pp.btrfs_get_8
>       0.00            +0.1        0.10 =C2=B1  9%  perf-profile.self.cycl=
es-pp.read_extent_buffer
>       0.00            +0.1        0.10 =C2=B1  7%  perf-profile.self.cycl=
es-pp.prepare_to_wait_event
>       0.00            +0.1        0.10 =C2=B1 10%  perf-profile.self.cycl=
es-pp.add_delayed_ref_head
>       0.00            +0.1        0.11 =C2=B1  7%  perf-profile.self.cycl=
es-pp.__switch_to_asm
>       0.49 =C2=B1 10%      +0.1        0.60 =C2=B1  7%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.00            +0.1        0.14 =C2=B1  3%  perf-profile.self.cycl=
es-pp.generic_bin_search
>       0.00            +0.1        0.15 =C2=B1 19%  perf-profile.self.cycl=
es-pp.__module_address
>       0.00            +0.2        0.15 =C2=B1 10%  perf-profile.self.cycl=
es-pp.copy_page
>       0.00            +0.2        0.15 =C2=B1 11%  perf-profile.self.cycl=
es-pp.__schedule
>       0.00            +0.2        0.17 =C2=B1  6%  perf-profile.self.cycl=
es-pp.btrfs_get_32
>       0.00            +0.2        0.20 =C2=B1  7%  perf-profile.self.cycl=
es-pp.btrfs_get_64
>       0.00            +0.2        0.21 =C2=B1  8%  perf-profile.self.cycl=
es-pp.unwind_next_frame
>       0.00            +0.2        0.24 =C2=B1  3%  perf-profile.self.cycl=
es-pp.memmove
>       0.00            +0.3        0.27 =C2=B1  9%  perf-profile.self.cycl=
es-pp.__orc_find
>       0.00            +0.3        0.28 =C2=B1  4%  perf-profile.self.cycl=
es-pp.btrfs_set_token_32
>       0.01 =C2=B1200%      +0.3        0.32 =C2=B1 20%  perf-profile.self=
.cycles-pp.__lookup_extent_mapping
>       0.00            +0.3        0.32 =C2=B1  4%  perf-profile.self.cycl=
es-pp.btrfs_get_token_32
>       0.00            +0.4        0.41 =C2=B1 16%  perf-profile.self.cycl=
es-pp.queued_write_lock_slowpath
>       0.00            +0.4        0.43 =C2=B1  3%  perf-profile.self.cycl=
es-pp.map_private_extent_buffer
>       0.09 =C2=B1 21%      +0.6        0.65 =C2=B1 33%  perf-profile.self=
.cycles-pp.poll_idle
>       0.12 =C2=B1 20%      +4.1        4.23 =C2=B1  6%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
> =

> =

> =

> *************************************************************************=
**************************
> lkp-bdw-de1: 16 threads Intel(R) Xeon(R) CPU D-1541 @ 2.10GHz with 48G me=
mory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/testcase/ucod=
e:
>   gcc-7/performance/1SSD/btrfs/x86_64-rhel-7.6/debian-x86_64-2019-11-14.c=
gz/lkp-bdw-de1/blogbench/0x7000019
> =

> commit: =

>   v5.4
>   c6bbf24815 ("btrfs: space-info: Make over-commit threshold to 87.5% of =
a new chunk")
> =

>             v5.4 c6bbf24815f95a4928984ff16a9 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           1:6          -17%            :4     dmesg.WARNING:at_ip__fsnoti=
fy_parent/0x
>          %stddev     %change         %stddev
>              \          |                \  =

>   52466434           -14.0%   45137174        blogbench.time.file_system_=
outputs
>    7348859            -6.3%    6887063        blogbench.time.involuntary_=
context_switches
>       3771            +1.1%       3813        blogbench.time.system_time
>     551.26            -1.6%     542.25        blogbench.time.user_time
>       5793           -19.9%       4641        blogbench.write_score
>     431018 =C2=B1  7%     -14.3%     369287 =C2=B1  4%  interrupts.CPU0.R=
ES:Rescheduling_interrupts
>     395096 =C2=B1  8%     -12.6%     345321 =C2=B1  5%  interrupts.CPU1.R=
ES:Rescheduling_interrupts
>      87918            -2.8%      85476        vmstat.io.bo
>   13075905 =C2=B1  2%     -14.3%   11201673        vmstat.memory.cache
>      70633            -7.7%      65184        vmstat.system.cs
>      56139            -2.9%      54512        vmstat.system.in
>      30.44 =C2=B1100%     -90.9%       2.77 =C2=B1173%  iostat.sda.avgqu-=
sz.max
>      87.40 =C2=B1100%     -95.0%       4.40 =C2=B1173%  iostat.sda.await.=
max
>       0.94 =C2=B1100%     -85.9%       0.13 =C2=B1173%  iostat.sda.svctm.=
max
>      87.40 =C2=B1100%     -95.0%       4.40 =C2=B1173%  iostat.sda.w_awai=
t.max
>      34.18 =C2=B1102%     -62.2%      12.91 =C2=B1 61%  iostat.sdb.avgqu-=
sz.max
>      95.65 =C2=B1103%     -82.3%      16.95 =C2=B1 72%  iostat.sdb.await.=
max
>      95.65 =C2=B1103%     -82.3%      16.95 =C2=B1 72%  iostat.sdb.w_awai=
t.max
>     101.24 =C2=B1 21%     -23.7%      77.23 =C2=B1 11%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>    1060738 =C2=B1  5%     -20.0%     848471 =C2=B1  3%  sched_debug.cpu.n=
r_switches.max
>     128950 =C2=B1  9%     -37.9%      80027 =C2=B1  9%  sched_debug.cpu.n=
r_switches.stddev
>     628.61 =C2=B1  7%     -25.6%     467.92 =C2=B1  9%  sched_debug.cpu.n=
r_uninterruptible.max
>     167.30 =C2=B1  6%     -23.8%     127.46 =C2=B1  8%  sched_debug.cpu.n=
r_uninterruptible.stddev
>    1055839 =C2=B1  5%     -20.0%     844794 =C2=B1  3%  sched_debug.cpu.s=
ched_count.max
>     128343 =C2=B1 10%     -38.3%      79251 =C2=B1  9%  sched_debug.cpu.s=
ched_count.stddev
>     908461 =C2=B1  3%     -10.5%     812723 =C2=B1  2%  sched_debug.cpu.t=
twu_count.max
>     136649 =C2=B1  5%     -17.9%     112237 =C2=B1  4%  sched_debug.cpu.t=
twu_count.stddev
>     195483 =C2=B1  3%     -22.0%     152478 =C2=B1  3%  sched_debug.cpu.t=
twu_local.max
>      48230 =C2=B1  4%     +23.8%      59704        sched_debug.cpu.ttwu_l=
ocal.min
>      33346 =C2=B1  5%     -37.9%      20704 =C2=B1  4%  sched_debug.cpu.t=
twu_local.stddev
>    8964644 =C2=B1  2%     -13.6%    7749001 =C2=B1  2%  meminfo.Active
>    8717213 =C2=B1  2%     -13.9%    7501624 =C2=B1  2%  meminfo.Active(fi=
le)
>   12106511 =C2=B1  2%     -14.0%   10414310        meminfo.Cached
>    1114050 =C2=B1  3%     -93.4%      73000 =C2=B1  2%  meminfo.Dirty
>    2302068 =C2=B1  2%     -20.7%    1825083        meminfo.Inactive
>    2286903 =C2=B1  2%     -20.9%    1809946        meminfo.Inactive(file)
>     924101 =C2=B1  2%     -19.8%     740793        meminfo.KReclaimable
>   13687196 =C2=B1  2%     -14.2%   11747472        meminfo.Memused
>     924101 =C2=B1  2%     -19.8%     740793        meminfo.SReclaimable
>     350605           -18.3%     286583        meminfo.SUnreclaim
>    1274707 =C2=B1  2%     -19.4%    1027376        meminfo.Slab
>       8857 =C2=B1 25%     -95.4%     411.50 =C2=B1 14%  meminfo.Writeback
>      93330           -17.2%      77231        meminfo.max_used_kB
>      58.87            +1.2%      59.57        perf-stat.i.MPKI
>      70768            -7.3%      65634        perf-stat.i.context-switches
>       3.59            +2.5%       3.68        perf-stat.i.cpi
>       1009           +12.9%       1139        perf-stat.i.cpu-migrations
>    3684212            -8.5%    3371879        perf-stat.i.dTLB-load-misses
>       0.28            -3.0%       0.27        perf-stat.i.ipc
>      58.68            +1.6%      59.61        perf-stat.overall.MPKI
>       3.56            +3.3%       3.68        perf-stat.overall.cpi
>      60.67            +1.7%      61.67        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.11            -0.0        0.10        perf-stat.overall.dTLB-load=
-miss-rate%
>       0.28            -3.2%       0.27        perf-stat.overall.ipc
>      70566            -7.3%      65420        perf-stat.ps.context-switch=
es
>       1006           +12.9%       1136        perf-stat.ps.cpu-migrations
>    3671930            -8.5%    3360679        perf-stat.ps.dTLB-load-miss=
es
>  3.286e+12            -2.6%    3.2e+12        perf-stat.total.instructions
>     522560 =C2=B1  4%     +18.6%     619585 =C2=B1  3%  softirqs.CPU0.RCU
>     539046 =C2=B1  3%     +18.4%     638438 =C2=B1  4%  softirqs.CPU1.RCU
>     534589 =C2=B1  3%     +17.6%     628622 =C2=B1  2%  softirqs.CPU10.RCU
>     532918 =C2=B1  6%     +18.2%     629753 =C2=B1  3%  softirqs.CPU12.RCU
>     519321 =C2=B1  4%     +22.7%     637092 =C2=B1  3%  softirqs.CPU13.RCU
>     541861 =C2=B1  6%     +15.3%     624859 =C2=B1  2%  softirqs.CPU14.RCU
>     530181 =C2=B1  4%     +14.5%     607146 =C2=B1  4%  softirqs.CPU2.RCU
>     543079 =C2=B1 12%     +15.9%     629660 =C2=B1  5%  softirqs.CPU3.RCU
>     519652 =C2=B1  4%     +22.6%     637086 =C2=B1  3%  softirqs.CPU4.RCU
>     530451 =C2=B1  5%     +17.2%     621577 =C2=B1  2%  softirqs.CPU5.RCU
>     509129 =C2=B1  3%     +17.1%     596022 =C2=B1  3%  softirqs.CPU6.RCU
>     545317 =C2=B1  7%     +17.2%     639180        softirqs.CPU7.RCU
>     526627 =C2=B1  4%     +18.5%     624056        softirqs.CPU8.RCU
>     538041 =C2=B1  4%     +20.4%     648040        softirqs.CPU9.RCU
>    8522946 =C2=B1  4%     +17.9%   10045477        softirqs.RCU
>    2182898 =C2=B1  2%     -13.9%    1878514 =C2=B1  2%  proc-vmstat.nr_ac=
tive_file
>    7097060            -7.5%    6567173        proc-vmstat.nr_dirtied
>     278481 =C2=B1  3%     -93.5%      17979 =C2=B1  2%  proc-vmstat.nr_di=
rty
>    3031209 =C2=B1  2%     -14.0%    2607428        proc-vmstat.nr_file_pa=
ges
>    8883924            +5.5%    9369721        proc-vmstat.nr_free_pages
>     572690 =C2=B1  2%     -20.9%     453218 =C2=B1  2%  proc-vmstat.nr_in=
active_file
>     231380 =C2=B1  2%     -19.8%     185500        proc-vmstat.nr_slab_re=
claimable
>      87822 =C2=B1  2%     -18.3%      71721        proc-vmstat.nr_slab_un=
reclaimable
>       2296 =C2=B1 22%     -95.9%      93.25 =C2=B1 12%  proc-vmstat.nr_wr=
iteback
>    6710614            -2.8%    6523592        proc-vmstat.nr_written
>    2182898 =C2=B1  2%     -13.9%    1878514 =C2=B1  2%  proc-vmstat.nr_zo=
ne_active_file
>     572690 =C2=B1  2%     -20.9%     453218 =C2=B1  2%  proc-vmstat.nr_zo=
ne_inactive_file
>     280961 =C2=B1  3%     -93.5%      18228 =C2=B1  2%  proc-vmstat.nr_zo=
ne_write_pending
>    8933464           -15.7%    7531853        proc-vmstat.numa_hit
>    8933464           -15.7%    7531853        proc-vmstat.numa_local
>    5051630           -20.1%    4036579        proc-vmstat.pgactivate
>   11442553           -13.4%    9912465        proc-vmstat.pgalloc_normal
>    5380851            -7.3%    4988976        proc-vmstat.pgfree
>   26811297            -2.8%   26059319        proc-vmstat.pgpgout
>     517812 =C2=B1  2%     -19.0%     419453        slabinfo.Acpi-Parse.ac=
tive_objs
>       7093 =C2=B1  2%     -19.0%       5745        slabinfo.Acpi-Parse.ac=
tive_slabs
>     517818 =C2=B1  2%     -19.0%     419455        slabinfo.Acpi-Parse.nu=
m_objs
>       7093 =C2=B1  2%     -19.0%       5745        slabinfo.Acpi-Parse.nu=
m_slabs
>     480526 =C2=B1  2%     -19.8%     385218 =C2=B1  2%  slabinfo.Acpi-Sta=
te.active_objs
>       9454 =C2=B1  2%     -19.3%       7631 =C2=B1  2%  slabinfo.Acpi-Sta=
te.active_slabs
>     482191 =C2=B1  2%     -19.3%     389199 =C2=B1  2%  slabinfo.Acpi-Sta=
te.num_objs
>       9454 =C2=B1  2%     -19.3%       7631 =C2=B1  2%  slabinfo.Acpi-Sta=
te.num_slabs
>      11004 =C2=B1  6%     -38.9%       6725 =C2=B1  6%  slabinfo.avc_xper=
ms_data.active_objs
>      11054 =C2=B1  6%     -39.2%       6725 =C2=B1  6%  slabinfo.avc_xper=
ms_data.num_objs
>     546.67 =C2=B1 16%     -68.7%     171.00        slabinfo.biovec-max.ac=
tive_objs
>     582.50 =C2=B1 15%     -63.6%     211.75        slabinfo.biovec-max.nu=
m_objs
>       5814 =C2=B1  2%     +10.7%       6435 =C2=B1  2%  slabinfo.blkdev_i=
oc.active_objs
>     466540 =C2=B1  2%     -21.3%     367368 =C2=B1  2%  slabinfo.btrfs_de=
layed_node.active_objs
>      17943 =C2=B1  2%     -21.3%      14129 =C2=B1  2%  slabinfo.btrfs_de=
layed_node.active_slabs
>     466540 =C2=B1  2%     -21.3%     367368 =C2=B1  2%  slabinfo.btrfs_de=
layed_node.num_objs
>      17943 =C2=B1  2%     -21.3%      14129 =C2=B1  2%  slabinfo.btrfs_de=
layed_node.num_slabs
>     441404 =C2=B1  2%     -18.5%     359603 =C2=B1  2%  slabinfo.btrfs_ex=
tent_map.active_objs
>      16412 =C2=B1  3%     -21.7%      12854 =C2=B1  2%  slabinfo.btrfs_ex=
tent_map.active_slabs
>     459562 =C2=B1  3%     -21.7%     359946 =C2=B1  2%  slabinfo.btrfs_ex=
tent_map.num_objs
>      16412 =C2=B1  3%     -21.7%      12854 =C2=B1  2%  slabinfo.btrfs_ex=
tent_map.num_slabs
>     466633 =C2=B1  2%     -21.1%     368147 =C2=B1  2%  slabinfo.btrfs_in=
ode.active_objs
>      16665 =C2=B1  2%     -21.1%      13148 =C2=B1  2%  slabinfo.btrfs_in=
ode.active_slabs
>     466644 =C2=B1  2%     -21.1%     368156 =C2=B1  2%  slabinfo.btrfs_in=
ode.num_objs
>      16665 =C2=B1  2%     -21.1%      13148 =C2=B1  2%  slabinfo.btrfs_in=
ode.num_slabs
>       6222 =C2=B1  3%     -32.2%       4221        slabinfo.btrfs_ordered=
_extent.active_objs
>       6363 =C2=B1  3%     -32.4%       4299        slabinfo.btrfs_ordered=
_extent.num_objs
>     571807 =C2=B1  2%     -19.0%     463336 =C2=B1  2%  slabinfo.dentry.a=
ctive_objs
>      13615 =C2=B1  2%     -19.0%      11032 =C2=B1  2%  slabinfo.dentry.a=
ctive_slabs
>     571849 =C2=B1  2%     -19.0%     463364 =C2=B1  2%  slabinfo.dentry.n=
um_objs
>      13615 =C2=B1  2%     -19.0%      11032 =C2=B1  2%  slabinfo.dentry.n=
um_slabs
>      23428 =C2=B1  6%     -74.3%       6009 =C2=B1  3%  slabinfo.khugepag=
ed_mm_slot.active_objs
>     659.67 =C2=B1  6%     -74.6%     167.25 =C2=B1  3%  slabinfo.khugepag=
ed_mm_slot.active_slabs
>      23758 =C2=B1  6%     -74.6%       6032 =C2=B1  3%  slabinfo.khugepag=
ed_mm_slot.num_objs
>     659.67 =C2=B1  6%     -74.6%     167.25 =C2=B1  3%  slabinfo.khugepag=
ed_mm_slot.num_slabs
>       4023 =C2=B1  4%     -48.3%       2081        slabinfo.kmalloc-128.a=
ctive_objs
>       4103 =C2=B1  4%     -46.7%       2186        slabinfo.kmalloc-128.n=
um_objs
>       2949 =C2=B1 10%     -16.4%       2465 =C2=B1  3%  slabinfo.kmalloc-=
512.active_objs
>       2970 =C2=B1  9%     -16.9%       2469 =C2=B1  3%  slabinfo.kmalloc-=
512.num_objs
>      20226           -20.0%      16173 =C2=B1  2%  slabinfo.kmalloc-64.ac=
tive_objs
>      20880           -22.2%      16235 =C2=B1  2%  slabinfo.kmalloc-64.nu=
m_objs
>       8733 =C2=B1  6%     -53.9%       4024 =C2=B1  5%  slabinfo.kmalloc-=
96.active_objs
>     209.33 =C2=B1  6%     -54.4%      95.50 =C2=B1  5%  slabinfo.kmalloc-=
96.active_slabs
>       8811 =C2=B1  6%     -54.3%       4024 =C2=B1  5%  slabinfo.kmalloc-=
96.num_objs
>     209.33 =C2=B1  6%     -54.4%      95.50 =C2=B1  5%  slabinfo.kmalloc-=
96.num_slabs
>       1084 =C2=B1  8%     -36.3%     690.25        slabinfo.mnt_cache.act=
ive_objs
>       1247 =C2=B1  8%     -36.1%     797.00 =C2=B1  2%  slabinfo.mnt_cach=
e.num_objs
>      22556 =C2=B1  2%     -13.7%      19456 =C2=B1  2%  slabinfo.numa_pol=
icy.active_objs
>      22742 =C2=B1  2%     -13.8%      19613 =C2=B1  2%  slabinfo.numa_pol=
icy.num_objs
>     440962 =C2=B1  2%     -19.7%     353973 =C2=B1  2%  slabinfo.radix_tr=
ee_node.active_objs
>      15748 =C2=B1  2%     -19.7%      12641 =C2=B1  2%  slabinfo.radix_tr=
ee_node.active_slabs
>     440967 =C2=B1  2%     -19.7%     353976 =C2=B1  2%  slabinfo.radix_tr=
ee_node.num_objs
>      15748 =C2=B1  2%     -19.7%      12641 =C2=B1  2%  slabinfo.radix_tr=
ee_node.num_slabs
>       8.64 =C2=B1 20%      -5.3        3.38 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.normal_work_helper.process_one_work.worker_thread.kthread.r=
et_from_fork
>      10.41 =C2=B1 18%      -4.8        5.60 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.worker_thread.kthread.ret_from_fork
>      10.24 =C2=B1 19%      -4.8        5.47 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.process_one_work.worker_thread.kthread.ret_from_fork
>      11.97 =C2=B1 16%      -4.7        7.24        perf-profile.calltrace=
.cycles-pp.ret_from_fork
>      11.97 =C2=B1 16%      -4.7        7.24        perf-profile.calltrace=
.cycles-pp.kthread.ret_from_fork
>       6.81 =C2=B1 22%      -4.2        2.56 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.btrfs_finish_ordered_io.normal_work_helper.process_one_work=
.worker_thread.kthread
>       6.15 =C2=B1 23%      -3.9        2.24 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.insert_reserved_file_extent.btrfs_finish_ordered_io.normal_=
work_helper.process_one_work.worker_thread
>       5.57 =C2=B1 23%      -3.5        2.03 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__btrfs_drop_extents.insert_reserved_file_extent.btrfs_fini=
sh_ordered_io.normal_work_helper.process_one_work
>       5.22 =C2=B1 24%      -3.3        1.88 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.btrfs_lookup_file_extent.__btrfs_drop_extents.insert_reserv=
ed_file_extent.btrfs_finish_ordered_io.normal_work_helper
>       5.21 =C2=B1 24%      -3.3        1.88 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.btrfs_search_slot.btrfs_lookup_file_extent.__btrfs_drop_ext=
ents.insert_reserved_file_extent.btrfs_finish_ordered_io
>       1.46 =C2=B1 18%      -1.2        0.27 =C2=B1100%  perf-profile.call=
trace.cycles-pp.btrfs_async_run_delayed_root.normal_work_helper.process_one=
_work.worker_thread.kthread
>       1.53 =C2=B1 24%      -1.1        0.40 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.__wake_up_common.__wake_up_common_lock.unlock_up.btrfs_sear=
ch_slot.btrfs_lookup_file_extent
>       1.53 =C2=B1 24%      -1.1        0.40 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_=
lock.unlock_up.btrfs_search_slot
>       1.51 =C2=B1 24%      -1.1        0.40 =C2=B1 57%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__=
wake_up_common_lock.unlock_up
>       1.61 =C2=B1 24%      -1.1        0.55 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.unlock_up.btrfs_search_slot.btrfs_lookup_file_extent.__btrf=
s_drop_extents.insert_reserved_file_extent
>       1.60 =C2=B1 24%      -1.0        0.55 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__wake_up_common_lock.unlock_up.btrfs_search_slot.btrfs_loo=
kup_file_extent.__btrfs_drop_extents
>       1.55 =C2=B1 25%      -0.9        0.65 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.btrfs_tree_lock.btrfs_lock_root_node.btrfs_search_slot.btrf=
s_lookup_file_extent.__btrfs_drop_extents
>       1.55 =C2=B1 25%      -0.9        0.65 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_lock_root_node.btrfs_search_slot.btrfs_lookup_file_ex=
tent.__btrfs_drop_extents.insert_reserved_file_extent
>       2.48 =C2=B1  6%      -0.4        2.04 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_rename.vfs_rename.do_renameat2.__x64_sys_rename.do_sy=
scall_64
>       2.55 =C2=B1  6%      -0.4        2.11 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.vfs_rename.do_renameat2.__x64_sys_rename.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>       1.39 =C2=B1 12%      -0.4        0.98 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__btrfs_unlink_inode.btrfs_rename.vfs_rename.do_renameat2._=
_x64_sys_rename
>       3.91 =C2=B1  4%      -0.4        3.52 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.rename
>       3.85 =C2=B1  4%      -0.4        3.46 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__x64_sys_rename.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.rename
>       3.85 =C2=B1  5%      -0.4        3.46 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.do_renameat2.__x64_sys_rename.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe.rename
>       3.87 =C2=B1  4%      -0.4        3.48 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.rename
>       3.86 =C2=B1  5%      -0.4        3.48 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.rename
>       0.56 =C2=B1  6%      +0.0        0.61 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.fsnotify.do_dentry_open.path_openat.do_filp_open.do_sys_open
>       0.77 =C2=B1  4%      +0.1        0.85 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__fdget_pos.ksys_read.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.__GI___libc_read
>       1.36 =C2=B1  4%      +0.1        1.48        perf-profile.calltrace=
.cycles-pp.dput.__fput.task_work_run.exit_to_usermode_loop.do_syscall_64
>       1.14 =C2=B1  5%      +0.1        1.26        perf-profile.calltrace=
.cycles-pp.btrfs_dentry_delete.dput.__fput.task_work_run.exit_to_usermode_l=
oop
>       1.18 =C2=B1  5%      +0.1        1.31 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.xas_start.xas_load.find_get_entry.pagecache_get_page.generi=
c_file_read_iter
>       1.02 =C2=B1  3%      +0.1        1.15 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.errseq_sample.do_dentry_open.path_openat.do_filp_open.do_sy=
s_open
>       1.41            +0.1        1.55 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.security_inode_permission.may_open.path_openat.do_filp_open.do_s=
ys_open
>       1.39 =C2=B1  2%      +0.1        1.53 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.selinux_inode_permission.security_inode_permission.may_open=
.path_openat.do_filp_open
>       1.68 =C2=B1  4%      +0.2        1.84        perf-profile.calltrace=
.cycles-pp.xas_load.find_get_entry.pagecache_get_page.generic_file_read_ite=
r.new_sync_read
>       2.44 =C2=B1  2%      +0.2        2.67        perf-profile.calltrace=
.cycles-pp.do_dentry_open.path_openat.do_filp_open.do_sys_open.do_syscall_64
>       0.36 =C2=B1 70%      +0.2        0.59 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.__fget_light.__fdget_pos.ksys_read.do_syscall_64.entry_SYSC=
ALL_64_after_hwframe
>       2.87 =C2=B1  3%      +0.2        3.11        perf-profile.calltrace=
.cycles-pp.may_open.path_openat.do_filp_open.do_sys_open.do_syscall_64
>       3.00 =C2=B1  3%      +0.3        3.29 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.lookup_fast.path_openat.do_filp_open.do_sys_open.do_syscall=
_64
>       6.79 =C2=B1  3%      +0.3        7.08        perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___libc_close
>       2.92 =C2=B1  3%      +0.3        3.21 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__d_lookup_rcu.lookup_fast.path_openat.do_filp_open.do_sys_=
open
>       6.84 =C2=B1  3%      +0.3        7.14        perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.__GI___libc_close
>       7.91 =C2=B1  3%      +0.3        8.23        perf-profile.calltrace=
.cycles-pp.__GI___libc_close
>       4.90 =C2=B1  3%      +0.5        5.39        perf-profile.calltrace=
.cycles-pp.pagecache_get_page.generic_file_read_iter.new_sync_read.vfs_read=
.ksys_read
>       4.71 =C2=B1  3%      +0.5        5.19        perf-profile.calltrace=
.cycles-pp.find_get_entry.pagecache_get_page.generic_file_read_iter.new_syn=
c_read.vfs_read
>       0.00            +0.6        0.55 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.touch_atime.generic_file_read_iter.new_sync_read.vfs_read.ksys_r=
ead
>       0.00            +0.6        0.61 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.__btrfs_run_delayed_items.flush_space.btrfs_async_reclaim_metada=
ta_space.process_one_work.worker_thread
>       0.40 =C2=B1 72%      +0.7        1.06 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.flush_space.btrfs_async_reclaim_metadata_space.process_one_=
work.worker_thread.kthread
>       0.41 =C2=B1 72%      +0.7        1.08 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.btrfs_async_reclaim_metadata_space.process_one_work.worker_=
thread.kthread.ret_from_fork
>      14.55 =C2=B1  2%      +0.7       15.28        perf-profile.calltrace=
.cycles-pp.path_openat.do_filp_open.do_sys_open.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
>      14.65 =C2=B1  2%      +0.7       15.39        perf-profile.calltrace=
.cycles-pp.do_filp_open.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.__GI___libc_open
>       0.00            +0.8        0.79 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.do_writepages.__writeback_single_inode.writeback_sb_inodes.wb_wr=
iteback.wb_workfn
>       0.00            +0.8        0.80 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__writeback_single_inode.writeback_sb_inodes.wb_writeback.wb_wor=
kfn.process_one_work
>       0.00            +0.8        0.81 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.writeback_sb_inodes.wb_writeback.wb_workfn.process_one_work.work=
er_thread
>      17.37 =C2=B1  2%      +0.8       18.22        perf-profile.calltrace=
.cycles-pp.do_sys_open.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___=
libc_open
>      19.41 =C2=B1  2%      +0.9       20.35        perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.__GI___libc_open
>      19.35 =C2=B1  2%      +0.9       20.29        perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___libc_open
>      20.78 =C2=B1  2%      +1.0       21.73        perf-profile.calltrace=
.cycles-pp.__GI___libc_open
>      33.00 =C2=B1  3%      +3.1       36.08        perf-profile.calltrace=
.cycles-pp.copyout.copy_page_to_iter.generic_file_read_iter.new_sync_read.v=
fs_read
>      34.13 =C2=B1  2%      +3.1       37.24        perf-profile.calltrace=
.cycles-pp.copy_page_to_iter.generic_file_read_iter.new_sync_read.vfs_read.=
ksys_read
>      32.61 =C2=B1  3%      +3.1       35.74        perf-profile.calltrace=
.cycles-pp.copy_user_enhanced_fast_string.copyout.copy_page_to_iter.generic=
_file_read_iter.new_sync_read
>      42.82 =C2=B1  2%      +3.7       46.57        perf-profile.calltrace=
.cycles-pp.generic_file_read_iter.new_sync_read.vfs_read.ksys_read.do_sysca=
ll_64
>      43.74 =C2=B1  2%      +3.8       47.51        perf-profile.calltrace=
.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
>      45.10 =C2=B1  2%      +3.8       48.93        perf-profile.calltrace=
.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.=
__GI___libc_read
>      46.16 =C2=B1  2%      +3.9       50.08        perf-profile.calltrace=
.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___li=
bc_read
>      51.59 =C2=B1  2%      +4.0       55.59        perf-profile.calltrace=
.cycles-pp.__GI___libc_read
>      49.42 =C2=B1  2%      +4.0       53.43        perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.__GI___libc_read
>      49.31 =C2=B1  2%      +4.0       53.32        perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__GI___libc_read
>       8.64 =C2=B1 20%      -5.3        3.38 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.normal_work_helper
>      10.43 =C2=B1 18%      -5.2        5.28 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_search_slot
>      10.41 =C2=B1 18%      -4.8        5.60 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.worker_thread
>      10.24 =C2=B1 19%      -4.8        5.48 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.process_one_work
>      11.97 =C2=B1 16%      -4.7        7.24        perf-profile.children.=
cycles-pp.ret_from_fork
>      11.97 =C2=B1 16%      -4.7        7.24        perf-profile.children.=
cycles-pp.kthread
>       6.81 =C2=B1 22%      -4.2        2.56 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.btrfs_finish_ordered_io
>       6.15 =C2=B1 23%      -3.9        2.24 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.insert_reserved_file_extent
>       5.71 =C2=B1 24%      -3.7        2.05 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__btrfs_drop_extents
>       5.35 =C2=B1 24%      -3.4        1.91 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_file_extent
>       5.67 =C2=B1 21%      -2.8        2.83 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       4.59 =C2=B1 26%      -2.8        1.76 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       4.22 =C2=B1 26%      -2.6        1.59 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.prepare_to_wait_event
>       2.57 =C2=B1 25%      -1.7        0.88 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_read_lock_root_node
>       2.56 =C2=B1 25%      -1.7        0.88 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_tree_read_lock
>       2.98 =C2=B1 23%      -1.7        1.33 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.btrfs_tree_lock
>       2.89 =C2=B1 23%      -1.6        1.28 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.btrfs_lock_root_node
>       2.49 =C2=B1 18%      -1.2        1.31 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>       2.14 =C2=B1 18%      -1.1        1.03        perf-profile.children.=
cycles-pp.unlock_up
>       2.27 =C2=B1 18%      -1.1        1.21 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>       2.59 =C2=B1 16%      -1.1        1.53 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       2.26 =C2=B1 18%      -1.1        1.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.autoremove_wake_function
>       1.46 =C2=B1 18%      -1.0        0.51 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.btrfs_async_run_delayed_root
>       1.80 =C2=B1 16%      -0.7        1.05 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.activate_task
>       1.79 =C2=B1 16%      -0.7        1.05 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       1.78 =C2=B1 16%      -0.7        1.04 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       1.69 =C2=B1 16%      -0.7        0.98 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       1.21 =C2=B1 20%      -0.7        0.50 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.queued_write_lock_slowpath
>       1.45 =C2=B1 16%      -0.6        0.82 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__account_scheduler_latency
>       1.07 =C2=B1 20%      -0.6        0.45 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.btrfs_try_tree_write_lock
>       1.24 =C2=B1 18%      -0.6        0.69 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.stack_trace_save_tsk
>       1.27 =C2=B1 16%      -0.6        0.71 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__btrfs_update_delayed_inode
>       1.13 =C2=B1 19%      -0.6        0.58 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_inode
>       1.19 =C2=B1 17%      -0.5        0.66 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.arch_stack_walk
>       1.60 =C2=B1 11%      -0.5        1.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__btrfs_unlink_inode
>       1.24 =C2=B1 11%      -0.5        0.79 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__schedule
>       2.48 =C2=B1  6%      -0.4        2.04 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_rename
>       2.55 =C2=B1  6%      -0.4        2.11 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.vfs_rename
>       3.92 =C2=B1  4%      -0.4        3.52 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.rename
>       3.85 =C2=B1  4%      -0.4        3.46 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__x64_sys_rename
>       3.85 =C2=B1  5%      -0.4        3.46 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.do_renameat2
>       0.90 =C2=B1 11%      -0.3        0.57 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.schedule
>       0.78 =C2=B1 18%      -0.3        0.46 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.unwind_next_frame
>       1.52 =C2=B1  3%      -0.3        1.21 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_insert_empty_items
>       1.12 =C2=B1 12%      -0.3        0.82 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.irq_exit
>       1.01 =C2=B1 11%      -0.3        0.73 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_dir_item
>       0.64 =C2=B1 17%      -0.3        0.36 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_del_inode_ref
>       0.56 =C2=B1 19%      -0.2        0.34 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.ret_from_intr
>       0.56 =C2=B1 20%      -0.2        0.33 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.do_IRQ
>       0.33 =C2=B1 34%      -0.2        0.11 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.finish_wait
>       0.50 =C2=B1 18%      -0.2        0.28 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.scsi_end_request
>       0.52 =C2=B1 18%      -0.2        0.30 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.blk_done_softirq
>       0.50 =C2=B1 18%      -0.2        0.29 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.scsi_io_completion
>       0.44 =C2=B1 18%      -0.2        0.25 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.blk_update_request
>       0.35 =C2=B1 22%      -0.2        0.16 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.btrfs_csum_file_blocks
>       0.35 =C2=B1 22%      -0.2        0.17 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.add_pending_csums
>       0.41 =C2=B1 18%      -0.2        0.23 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.orc_find
>       0.41 =C2=B1 17%      -0.2        0.23 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.btrfs_end_bio
>       0.61 =C2=B1  4%      -0.2        0.43 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.setup_items_for_insert
>       0.35 =C2=B1 19%      -0.2        0.18 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.end_bio_extent_writepage
>       0.39 =C2=B1 21%      -0.2        0.23 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.select_task_rq_fair
>       0.28 =C2=B1 29%      -0.2        0.11 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp._raw_spin_unlock_irqrestore
>       0.36 =C2=B1 15%      -0.2        0.20 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_truncate_inode_items
>       0.42 =C2=B1 12%      -0.2        0.26 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.pick_next_task_fair
>       0.82 =C2=B1  3%      -0.1        0.68        perf-profile.children.=
cycles-pp._cond_resched
>       0.38 =C2=B1 11%      -0.1        0.24 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.preempt_schedule_common
>       0.29 =C2=B1 22%      -0.1        0.15 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.select_idle_sibling
>       0.30 =C2=B1 16%      -0.1        0.18 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__orc_find
>       0.19 =C2=B1 19%      -0.1        0.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.unwind_get_return_address
>       0.17 =C2=B1 15%      -0.1        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_unlock_up_safe
>       0.19 =C2=B1 20%      -0.1        0.09 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__module_address
>       0.21 =C2=B1 16%      -0.1        0.11 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.queued_read_lock_slowpath
>       0.17 =C2=B1 18%      -0.1        0.08 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.kernel_text_address
>       0.23 =C2=B1 11%      -0.1        0.14 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.dequeue_task_fair
>       0.18 =C2=B1 19%      -0.1        0.09 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.__kernel_text_address
>       0.26 =C2=B1  6%      -0.1        0.17 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.30 =C2=B1 12%      -0.1        0.21 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.btrfs_commit_inode_delayed_inode
>       0.17 =C2=B1 24%      -0.1        0.09 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.btrfs_writepage_endio_finish_ordered
>       0.17 =C2=B1 24%      -0.1        0.09 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.end_extent_writepage
>       0.18 =C2=B1 18%      -0.1        0.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.reschedule_interrupt
>       0.15 =C2=B1 23%      -0.1        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.stack_trace_consume_entry_nosched
>       0.18 =C2=B1 13%      -0.1        0.10 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_del_orphan_item
>       0.10 =C2=B1  9%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.push_leaf_right
>       0.18 =C2=B1  7%      -0.1        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.split_leaf
>       0.14 =C2=B1  9%      -0.1        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_add_delayed_data_ref
>       0.11 =C2=B1 20%      -0.1        0.04 =C2=B1 58%  perf-profile.chil=
dren.cycles-pp.btrfs_alloc_reserved_file_extent
>       0.23 =C2=B1 10%      -0.1        0.17 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.12 =C2=B1 19%      -0.1        0.06 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.is_module_text_address
>       0.29 =C2=B1  4%      -0.1        0.23 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_dentry
>       0.16 =C2=B1  9%      -0.1        0.09 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       0.21 =C2=B1  9%      -0.1        0.15 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_unlink_inode
>       0.15 =C2=B1  8%      -0.1        0.09 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.29 =C2=B1  4%      -0.1        0.23 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup
>       0.12 =C2=B1 17%      -0.1        0.05 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__module_text_address
>       0.14 =C2=B1 14%      -0.1        0.08 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.put_prev_entity
>       0.12 =C2=B1 21%      -0.1        0.07 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.end_page_writeback
>       0.12 =C2=B1 20%      -0.1        0.07 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.test_clear_page_writeback
>       0.12 =C2=B1 12%      -0.1        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.io_serial_in
>       0.08 =C2=B1  6%      -0.1        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.prepare_exit_to_usermode
>       0.09 =C2=B1 15%      -0.0        0.05 =C2=B1 58%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.08 =C2=B1  8%      -0.0        0.04 =C2=B1 57%  perf-profile.chil=
dren.cycles-pp.swapgs_restore_regs_and_return_to_usermode
>       0.19 =C2=B1  9%      -0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__list_del_entry_valid
>       0.10 =C2=B1 19%      -0.0        0.05 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.add_delayed_ref_head
>       0.10 =C2=B1 14%      -0.0        0.06 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_se
>       0.15 =C2=B1 11%      -0.0        0.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.memcpy_extent_buffer
>       0.10 =C2=B1 16%      -0.0        0.06 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ttwu_do_wakeup
>       0.07 =C2=B1 12%      -0.0        0.04 =C2=B1 57%  perf-profile.chil=
dren.cycles-pp.check_preempt_wakeup
>       0.12 =C2=B1 16%      -0.0        0.09 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_xattr
>       0.09 =C2=B1 12%      -0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.check_preempt_curr
>       0.14 =C2=B1 14%      -0.0        0.11 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__vfs_getxattr
>       0.10 =C2=B1 10%      +0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__legitimize_mnt
>       0.07 =C2=B1 12%      +0.0        0.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__blk_mq_delay_run_hw_queue
>       0.39 =C2=B1  4%      +0.0        0.42        perf-profile.children.=
cycles-pp.__might_fault
>       0.07 =C2=B1 14%      +0.0        0.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.btrfs_dirty_inode
>       0.07 =C2=B1 20%      +0.0        0.11 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.__btrfs_end_transaction
>       0.06 =C2=B1 13%      +0.0        0.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.read_extent_buffer
>       0.07 =C2=B1 19%      +0.0        0.11 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.blk_flush_plug_list
>       0.07 =C2=B1 19%      +0.0        0.11 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.blk_mq_flush_plug_list
>       0.06 =C2=B1 47%      +0.0        0.10 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.blk_finish_plug
>       0.07 =C2=B1 16%      +0.0        0.11 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.blk_mq_sched_insert_requests
>       0.42 =C2=B1  3%      +0.0        0.46        perf-profile.children.=
cycles-pp.fput_many
>       1.89            +0.1        1.95        perf-profile.children.cycle=
s-pp.syscall_return_via_sysret
>       0.04 =C2=B1 73%      +0.1        0.10 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.btrfs_delalloc_reserve_metadata
>       0.12 =C2=B1 15%      +0.1        0.18 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.start_transaction
>       0.04 =C2=B1 71%      +0.1        0.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.set_extent_bit
>       0.01 =C2=B1223%      +0.1        0.07 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.btrfs_trans_release_metadata
>       0.02 =C2=B1142%      +0.1        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.copy_page
>       0.00            +0.1        0.07 =C2=B1 17%  perf-profile.children.=
cycles-pp.btrfs_update_block_group
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.copy_extent_buffer_full
>       0.91 =C2=B1  5%      +0.1        0.98 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.fsnotify
>       0.05 =C2=B1 50%      +0.1        0.12 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.btrfs_get_64
>       0.53 =C2=B1  6%      +0.1        0.60 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__fget_light
>       0.40 =C2=B1  5%      +0.1        0.47 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__fget
>       0.03 =C2=B1101%      +0.1        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.mutex_spin_on_owner
>       0.48 =C2=B1  5%      +0.1        0.56 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.touch_atime
>       0.79 =C2=B1  4%      +0.1        0.87 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__fdget_pos
>       0.17 =C2=B1  9%      +0.1        0.26 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__btrfs_cow_block
>       0.17 =C2=B1  9%      +0.1        0.26 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.btrfs_cow_block
>       0.01 =C2=B1223%      +0.1        0.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.btrfs_del_csums
>       0.04 =C2=B1102%      +0.1        0.14 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__mutex_lock
>       0.03 =C2=B1100%      +0.1        0.13 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.btrfs_block_rsv_add
>       0.04 =C2=B1105%      +0.1        0.14 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.btrfs_try_granting_tickets
>       0.12 =C2=B1 17%      +0.1        0.23 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.map_private_extent_buffer
>       1.22 =C2=B1  5%      +0.1        1.33 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.xas_start
>       1.03 =C2=B1  3%      +0.1        1.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.errseq_sample
>       0.09 =C2=B1 56%      +0.1        0.21 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__btrfs_block_rsv_release
>       0.00            +0.1        0.12 =C2=B1 14%  perf-profile.children.=
cycles-pp.lookup_inline_extent_backref
>       1.14 =C2=B1  5%      +0.1        1.27        perf-profile.children.=
cycles-pp.btrfs_dentry_delete
>       2.25 =C2=B1  2%      +0.1        2.39        perf-profile.children.=
cycles-pp.security_inode_permission
>       2.15 =C2=B1  2%      +0.1        2.29 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.selinux_inode_permission
>       1.76 =C2=B1  4%      +0.1        1.90        perf-profile.children.=
cycles-pp.xas_load
>       2.65 =C2=B1  2%      +0.2        2.82 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.dput
>       0.06 =C2=B1 65%      +0.2        0.24 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.btrfs_get_32
>       2.45 =C2=B1  2%      +0.2        2.67        perf-profile.children.=
cycles-pp.do_dentry_open
>       2.88 =C2=B1  2%      +0.2        3.12        perf-profile.children.=
cycles-pp.may_open
>       0.09 =C2=B1 71%      +0.3        0.36 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__btrfs_free_extent
>       3.32 =C2=B1  3%      +0.3        3.62 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.lookup_fast
>       3.16 =C2=B1  3%      +0.3        3.46 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__d_lookup_rcu
>       7.98 =C2=B1  3%      +0.3        8.30        perf-profile.children.=
cycles-pp.__GI___libc_close
>       0.03 =C2=B1223%      +0.4        0.39 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.check_leaf
>       0.15 =C2=B1 39%      +0.4        0.51 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.submit_one_bio
>       0.07 =C2=B1102%      +0.4        0.44 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.priority_reclaim_metadata_space
>       0.08 =C2=B1 84%      +0.4        0.46 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.evict_refill_and_join
>       0.03 =C2=B1223%      +0.4        0.41 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.btree_csum_one_bio
>       0.07 =C2=B1101%      +0.4        0.46 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.btrfs_block_rsv_refill
>       0.09 =C2=B1 80%      +0.4        0.47 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.submit_extent_page
>       0.03 =C2=B1223%      +0.4        0.43 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.btree_submit_bio_hook
>       0.25 =C2=B1 67%      +0.4        0.67 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_run_delayed_refs
>       0.25 =C2=B1 67%      +0.4        0.67 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__btrfs_run_delayed_refs
>       0.03 =C2=B1223%      +0.4        0.46 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.write_one_eb
>       0.03 =C2=B1223%      +0.5        0.49 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.btree_write_cache_pages
>       5.14 =C2=B1  3%      +0.5        5.62        perf-profile.children.=
cycles-pp.pagecache_get_page
>       0.17 =C2=B1 52%      +0.5        0.66 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.btrfs_reserve_metadata_bytes
>       4.76 =C2=B1  3%      +0.5        5.25        perf-profile.children.=
cycles-pp.find_get_entry
>       0.25 =C2=B1 74%      +0.6        0.82 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__btrfs_run_delayed_items
>       0.44 =C2=B1 59%      +0.6        1.08 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.btrfs_async_reclaim_metadata_space
>      14.58 =C2=B1  2%      +0.7       15.30        perf-profile.children.=
cycles-pp.path_openat
>      14.66 =C2=B1  2%      +0.7       15.40        perf-profile.children.=
cycles-pp.do_filp_open
>      17.39 =C2=B1  2%      +0.8       18.24        perf-profile.children.=
cycles-pp.do_sys_open
>      20.86 =C2=B1  2%      +1.0       21.81        perf-profile.children.=
cycles-pp.__GI___libc_open
>       0.52 =C2=B1 57%      +1.0        1.50 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.flush_space
>      33.03 =C2=B1  3%      +3.1       36.11        perf-profile.children.=
cycles-pp.copyout
>      32.99 =C2=B1  3%      +3.1       36.07        perf-profile.children.=
cycles-pp.copy_user_enhanced_fast_string
>      34.17 =C2=B1  2%      +3.1       37.28        perf-profile.children.=
cycles-pp.copy_page_to_iter
>      42.89 =C2=B1  2%      +3.7       46.63        perf-profile.children.=
cycles-pp.generic_file_read_iter
>      43.76 =C2=B1  2%      +3.8       47.52        perf-profile.children.=
cycles-pp.new_sync_read
>      45.14 =C2=B1  2%      +3.8       48.95        perf-profile.children.=
cycles-pp.vfs_read
>      46.20 =C2=B1  2%      +3.9       50.11        perf-profile.children.=
cycles-pp.ksys_read
>      51.73 =C2=B1  2%      +4.0       55.72        perf-profile.children.=
cycles-pp.__GI___libc_read
>      80.55 =C2=B1  2%      +4.9       85.46        perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
>      80.30 =C2=B1  2%      +4.9       85.22        perf-profile.children.=
cycles-pp.do_syscall_64
>       5.65 =C2=B1 21%      -2.8        2.81 =C2=B1  3%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>       1.12 =C2=B1 20%      -0.7        0.45 =C2=B1  6%  perf-profile.self=
.cycles-pp.queued_write_lock_slowpath
>       0.30 =C2=B1 16%      -0.1        0.18 =C2=B1  8%  perf-profile.self=
.cycles-pp.__orc_find
>       0.28 =C2=B1 17%      -0.1        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.unwind_next_frame
>       0.18 =C2=B1 19%      -0.1        0.09 =C2=B1  4%  perf-profile.self=
.cycles-pp.__module_address
>       0.22 =C2=B1 10%      -0.1        0.15 =C2=B1  7%  perf-profile.self=
.cycles-pp.__schedule
>       0.19 =C2=B1 11%      -0.1        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.__account_scheduler_latency
>       0.16 =C2=B1 15%      -0.1        0.09 =C2=B1  4%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.12 =C2=B1 16%      -0.0        0.07 =C2=B1 17%  perf-profile.self=
.cycles-pp.select_idle_sibling
>       0.19 =C2=B1  9%      -0.0        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.__list_del_entry_valid
>       0.15 =C2=B1 12%      -0.0        0.10 =C2=B1 12%  perf-profile.self=
.cycles-pp.update_curr
>       0.12 =C2=B1 15%      -0.0        0.08        perf-profile.self.cycl=
es-pp.try_to_wake_up
>       0.10 =C2=B1 17%      -0.0        0.06 =C2=B1 14%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.11 =C2=B1  6%      -0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.update_load_avg
>       0.11 =C2=B1 10%      -0.0        0.07 =C2=B1 17%  perf-profile.self=
.cycles-pp.queued_read_lock_slowpath
>       0.09 =C2=B1 14%      -0.0        0.07 =C2=B1 13%  perf-profile.self=
.cycles-pp.io_serial_in
>       0.06 =C2=B1 11%      +0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.find_extent_buffer
>       0.14 =C2=B1  9%      +0.0        0.18 =C2=B1  3%  perf-profile.self=
.cycles-pp.vfs_read
>       0.05 =C2=B1 46%      +0.0        0.09 =C2=B1 13%  perf-profile.self=
.cycles-pp.read_extent_buffer
>       0.29 =C2=B1  6%      +0.0        0.34 =C2=B1  4%  perf-profile.self=
.cycles-pp.do_dentry_open
>       1.89            +0.0        1.94        perf-profile.self.cycles-pp=
.syscall_return_via_sysret
>       0.02 =C2=B1142%      +0.1        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.copy_page
>       0.89 =C2=B1  5%      +0.1        0.95 =C2=B1  4%  perf-profile.self=
.cycles-pp.fsnotify
>       0.39 =C2=B1  6%      +0.1        0.46 =C2=B1  7%  perf-profile.self=
.cycles-pp.__fget
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.self.cycl=
es-pp.btrfs_get_64
>       0.03 =C2=B1101%      +0.1        0.10 =C2=B1  7%  perf-profile.self=
.cycles-pp.mutex_spin_on_owner
>       1.15 =C2=B1  5%      +0.1        1.24 =C2=B1  2%  perf-profile.self=
.cycles-pp.btrfs_release_file
>       1.10 =C2=B1  4%      +0.1        1.20        perf-profile.self.cycl=
es-pp.may_open
>       0.11 =C2=B1 19%      +0.1        0.21 =C2=B1  9%  perf-profile.self=
.cycles-pp.map_private_extent_buffer
>       0.01 =C2=B1223%      +0.1        0.14 =C2=B1 13%  perf-profile.self=
.cycles-pp.btrfs_get_32
>       1.18 =C2=B1  5%      +0.1        1.30        perf-profile.self.cycl=
es-pp.xas_start
>       1.12 =C2=B1  5%      +0.1        1.24        perf-profile.self.cycl=
es-pp.btrfs_dentry_delete
>       1.00 =C2=B1  3%      +0.1        1.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.errseq_sample
>       1.53 =C2=B1  2%      +0.1        1.68        perf-profile.self.cycl=
es-pp.selinux_inode_permission
>       6.04 =C2=B1  2%      +0.3        6.29        perf-profile.self.cycl=
es-pp.do_syscall_64
>       3.10 =C2=B1  3%      +0.3        3.40        perf-profile.self.cycl=
es-pp.__d_lookup_rcu
>       2.94 =C2=B1  3%      +0.4        3.30        perf-profile.self.cycl=
es-pp.find_get_entry
>      32.41 =C2=B1  3%      +3.1       35.55        perf-profile.self.cycl=
es-pp.copy_user_enhanced_fast_string
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp5: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with 19=
2G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> bs/compiler/cpufreq_governor/disk/fs/ioengine/kconfig/nr_task/rootfs/runt=
ime/rw/tbox_group/test_size/testcase/ucode:
>   4M/gcc-7/performance/1HDD/btrfs/sync/x86_64-rhel-7.6/100%/debian-x86_64=
-2019-11-14.cgz/300s/randwrite/lkp-csl-2sp5/128G/fio-basic/0x500002c
> =

> commit: =

>   v5.4
>   c6bbf24815 ("btrfs: space-info: Make over-commit threshold to 87.5% of =
a new chunk")
> =

>             v5.4 c6bbf24815f95a4928984ff16a9 =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      32.11 =C2=B1  2%     +19.2       51.27 =C2=B1  3%  fio.latency_10ms%
>       1.65 =C2=B1 10%      +0.6        2.29 =C2=B1 22%  fio.latency_20ms%
>       2.45 =C2=B1  4%      +1.5        3.95 =C2=B1 32%  fio.latency_250ms%
>       1.89 =C2=B1 13%      +1.1        2.97 =C2=B1 25%  fio.latency_2ms%
>       4.91 =C2=B1 10%      +3.3        8.25 =C2=B1  2%  fio.latency_4ms%
>       1.66 =C2=B1 12%      +1.0        2.65 =C2=B1 35%  fio.latency_500ms%
>       0.53 =C2=B1  5%      +0.9        1.40 =C2=B1 60%  fio.latency_750ms%
>      48.58           -28.9       19.64        fio.latency_>=3D2000ms%
>     569.45           -10.8%     507.75        fio.time.elapsed_time
>     569.45           -10.8%     507.75        fio.time.elapsed_time.max
>  1.396e+08           -11.0%  1.243e+08        fio.time.file_system_outputs
>       4795            +6.1%       5087        fio.time.involuntary_contex=
t_switches
>     168206            +1.7%     171005        fio.time.minor_page_faults
>      21.50 =C2=B1  4%     +14.7%      24.67        fio.time.percent_of_cp=
u_this_job_got
>      97.68 =C2=B1  3%      +5.3%     102.89 =C2=B1  2%  fio.time.system_t=
ime
>      27.29 =C2=B1  4%      -9.0%      24.83 =C2=B1  2%  fio.time.user_time
>     342822           -51.1%     167531 =C2=B1  2%  fio.time.voluntary_con=
text_switches
>      17044           -11.0%      15174        fio.workload
>     226.00           -19.8%     181.28        fio.write_bw_MBps
>  3.129e+09            -2.6%  3.048e+09        fio.write_clat_90%_us
>  3.314e+09          +163.0%  8.713e+09 =C2=B1 15%  fio.write_clat_95%_us
>  7.902e+09 =C2=B1  5%    +116.6%  1.711e+10        fio.write_clat_99%_us
>  1.695e+09           +23.2%  2.087e+09        fio.write_clat_mean_us
>  2.302e+09          +208.1%  7.092e+09        fio.write_clat_stddev
>      56.50           -19.8%      45.32        fio.write_iops
>   5.26e+10           -33.8%  3.481e+10 =C2=B1 50%  cpuidle.C1E.time
>  1.091e+08           -29.8%   76579744 =C2=B1 39%  cpuidle.C1E.usage
>      59.55 =C2=B1  3%     +37.0%      81.61        iostat.cpu.idle
>      40.17 =C2=B1  4%     -55.1%      18.03 =C2=B1  2%  iostat.cpu.iowait
>    9618445 =C2=B1  3%     -15.6%    8114128 =C2=B1  2%  numa-numastat.nod=
e1.local_node
>    9634177 =C2=B1  3%     -15.6%    8128974 =C2=B1  2%  numa-numastat.nod=
e1.numa_hit
>  1.091e+08           -29.8%   76579982 =C2=B1 39%  turbostat.C1E
>       0.29 =C2=B1  3%   +2177.2%       6.49 =C2=B1134%  turbostat.CPU%c6
>    1.1e+08           -11.6%   97228181        turbostat.IRQ
>      59.42 =C2=B1  3%     +22.1       81.54        mpstat.cpu.all.idle%
>      40.31 =C2=B1  4%     -22.2       18.10 =C2=B1  2%  mpstat.cpu.all.io=
wait%
>       0.21            +0.1        0.28        mpstat.cpu.all.sys%
>       0.05 =C2=B1  4%      +0.0        0.06        mpstat.cpu.all.usr%
>      59.00 =C2=B1  3%     +38.4%      81.67        vmstat.cpu.id
>      39.50 =C2=B1  4%     -56.1%      17.33 =C2=B1  2%  vmstat.cpu.wa
>   60690973           -11.0%   54027738        vmstat.memory.cache
>      51.00           -58.2%      21.33 =C2=B1  2%  vmstat.procs.b
>       3477           -23.0%       2676 =C2=B1  2%  vmstat.system.cs
>      32679           -10.6%      29215        softirqs.BLOCK
>      72905 =C2=B1  2%      -9.7%      65813        softirqs.CPU18.SCHED
>      70852            -8.3%      64993        softirqs.CPU2.SCHED
>      72448            -8.9%      66034        softirqs.CPU24.SCHED
>      72093 =C2=B1  2%      -9.5%      65275        softirqs.CPU3.SCHED
>      71386            -8.3%      65425        softirqs.CPU34.SCHED
>      72394 =C2=B1  3%      -9.3%      65673 =C2=B1  2%  softirqs.CPU4.SCH=
ED
>      71358            -8.4%      65358        softirqs.CPU47.SCHED
>      72828 =C2=B1  7%     -11.4%      64492        softirqs.CPU55.SCHED
>     179825 =C2=B1  2%      -4.9%     171024 =C2=B1  4%  softirqs.CPU55.TI=
MER
>      73285 =C2=B1  6%     -11.6%      64802        softirqs.CPU70.SCHED
>       6106 =C2=B1 59%     -58.1%       2559 =C2=B1 18%  softirqs.NET_RX
>    6980297           +21.4%    8477121        meminfo.Active
>    6881534           +21.9%    8391751        meminfo.Active(anon)
>      98763           -13.6%      85370        meminfo.Active(file)
>    6722134           +22.1%    8205451        meminfo.AnonHugePages
>    6874798           +22.0%    8385338        meminfo.AnonPages
>   60585719           -10.9%   53952323        meminfo.Cached
>    9189374           +21.6%   11174393        meminfo.Committed_AS
>    2601593 =C2=B1  3%     -29.1%    1843844 =C2=B1 11%  meminfo.Dirty
>   59396333           -11.1%   52779406        meminfo.Inactive
>     235578           +22.4%     288269        meminfo.Inactive(anon)
>   59160754           -11.3%   52491136        meminfo.Inactive(file)
>     242094           +21.9%     295027        meminfo.Mapped
>      22318           +19.0%      26565        meminfo.PageTables
>     242974           +21.5%     295322        meminfo.Shmem
>   21356479           -10.0%   19216736        meminfo.Writeback
>      24.23            -9.2       15.05 =C2=B1 21%  perf-stat.i.cache-miss=
-rate%
>       3438           -23.7%       2623 =C2=B1  2%  perf-stat.i.context-sw=
itches
>       4.84 =C2=B1 18%     -36.9%       3.05 =C2=B1 14%  perf-stat.i.cpu-m=
igrations
>      55.97 =C2=B1  2%     +15.8       71.82 =C2=B1  2%  perf-stat.i.node-=
load-miss-rate%
>     473818 =C2=B1  2%     -11.6%     418921 =C2=B1  3%  perf-stat.i.node-=
loads
>      57.36 =C2=B1 11%     +15.9       73.22 =C2=B1 11%  perf-stat.i.node-=
store-miss-rate%
>     113007 =C2=B1 36%     +53.3%     173295 =C2=B1  6%  perf-stat.i.node-=
store-misses
>       9.55          +107.3%      19.81 =C2=B1 71%  perf-stat.overall.MPKI
>      40.36           -11.2       29.13 =C2=B1 44%  perf-stat.overall.cach=
e-miss-rate%
>     697.03 =C2=B1  2%     +23.6%     861.87 =C2=B1 23%  perf-stat.overall=
.cycles-between-cache-misses
>       3431           -23.7%       2618 =C2=B1  2%  perf-stat.ps.context-s=
witches
>       4.83 =C2=B1 18%     -36.9%       3.05 =C2=B1 14%  perf-stat.ps.cpu-=
migrations
>     473042 =C2=B1  2%     -11.5%     418533 =C2=B1  3%  perf-stat.ps.node=
-loads
>     112832 =C2=B1 36%     +53.5%     173186 =C2=B1  6%  perf-stat.ps.node=
-store-misses
>  6.525e+11 =C2=B1  2%      -8.6%  5.964e+11 =C2=B1  6%  perf-stat.total.i=
nstructions
>       4351            -9.8%       3923 =C2=B1  2%  slabinfo.biovec-max.ac=
tive_objs
>       4422            -9.8%       3990 =C2=B1  2%  slabinfo.biovec-max.nu=
m_objs
>       3161 =C2=B1  2%     +20.4%       3807 =C2=B1  3%  slabinfo.buffer_h=
ead.active_objs
>       3161 =C2=B1  2%     +20.4%       3807 =C2=B1  3%  slabinfo.buffer_h=
ead.num_objs
>       3792 =C2=B1  2%     -16.7%       3157 =C2=B1 10%  slabinfo.eventpol=
l_pwq.active_objs
>       3792 =C2=B1  2%     -16.7%       3157 =C2=B1 10%  slabinfo.eventpol=
l_pwq.num_objs
>      10249 =C2=B1 11%     -13.0%       8918        slabinfo.kmalloc-128.a=
ctive_objs
>      10537 =C2=B1 10%     -13.0%       9166        slabinfo.kmalloc-128.n=
um_objs
>      12494 =C2=B1 14%      -7.2%      11599 =C2=B1 15%  slabinfo.kmalloc-=
96.active_objs
>       6957 =C2=B1 13%     -17.3%       5753 =C2=B1  5%  slabinfo.mnt_cach=
e.active_objs
>       7228 =C2=B1 12%     -16.5%       6038 =C2=B1  5%  slabinfo.mnt_cach=
e.num_objs
>       9650 =C2=B1  2%     -10.1%       8673 =C2=B1  6%  slabinfo.pde_open=
er.active_objs
>       9650 =C2=B1  2%     -10.1%       8673 =C2=B1  6%  slabinfo.pde_open=
er.num_objs
>     254579           -10.3%     228410        slabinfo.radix_tree_node.ac=
tive_objs
>       4550           -10.3%       4082        slabinfo.radix_tree_node.ac=
tive_slabs
>     254858           -10.3%     228613        slabinfo.radix_tree_node.nu=
m_objs
>       4550           -10.3%       4082        slabinfo.radix_tree_node.nu=
m_slabs
>     929.75 =C2=B1  2%     -17.3%     768.67 =C2=B1  6%  slabinfo.skbuff_f=
clone_cache.active_objs
>     929.75 =C2=B1  2%     -17.3%     768.67 =C2=B1  6%  slabinfo.skbuff_f=
clone_cache.num_objs
>    3358265 =C2=B1 17%     +62.2%    5447527 =C2=B1  3%  numa-meminfo.node=
0.Active
>    3287465 =C2=B1 18%     +63.2%    5363594 =C2=B1  3%  numa-meminfo.node=
0.Active(anon)
>    3218136 =C2=B1 18%     +62.4%    5225885 =C2=B1  3%  numa-meminfo.node=
0.AnonHugePages
>    3284964 =C2=B1 18%     +63.1%    5359183 =C2=B1  3%  numa-meminfo.node=
0.AnonPages
>    1275121           -27.7%     921832 =C2=B1 13%  numa-meminfo.node0.Dir=
ty
>   29880934 =C2=B1  2%     -12.2%   26227247        numa-meminfo.node0.Fil=
ePages
>   29259129 =C2=B1  2%     -12.5%   25596312        numa-meminfo.node0.Ina=
ctive
>   29138728 =C2=B1  2%     -12.8%   25400579        numa-meminfo.node0.Ina=
ctive(file)
>      11461 =C2=B1 32%     +67.9%      19243 =C2=B1  4%  numa-meminfo.node=
0.PageTables
>   10485663            -9.4%    9498679 =C2=B1  3%  numa-meminfo.node0.Wri=
teback
>    1331077 =C2=B1  4%     -30.4%     926791 =C2=B1  9%  numa-meminfo.node=
1.Dirty
>   30744049 =C2=B1  2%      -9.7%   27760604        numa-meminfo.node1.Fil=
ePages
>   30176474 =C2=B1  2%      -9.8%   27218135        numa-meminfo.node1.Ina=
ctive
>   30061010 =C2=B1  2%      -9.8%   27125509        numa-meminfo.node1.Ina=
ctive(file)
>     104876           -11.5%      92764 =C2=B1  2%  numa-meminfo.node1.KRe=
claimable
>   34790493           -10.3%   31205414        numa-meminfo.node1.MemUsed
>     950.25 =C2=B1 15%     -32.7%     639.33 =C2=B1 32%  numa-meminfo.node=
1.Mlocked
>      10867 =C2=B1 35%     -32.4%       7340 =C2=B1 12%  numa-meminfo.node=
1.PageTables
>     104876           -11.5%      92764 =C2=B1  2%  numa-meminfo.node1.SRe=
claimable
>   10882982           -10.6%    9729197 =C2=B1  2%  numa-meminfo.node1.Wri=
teback
>     821564 =C2=B1 18%     +63.0%    1339090 =C2=B1  3%  numa-vmstat.node0=
.nr_active_anon
>     820937 =C2=B1 18%     +63.0%    1337961 =C2=B1  3%  numa-vmstat.node0=
.nr_anon_pages
>       1570 =C2=B1 18%     +62.3%       2548 =C2=B1  3%  numa-vmstat.node0=
.nr_anon_transparent_hugepages
>    7357913 =C2=B1  2%     -12.5%    6436686        numa-vmstat.node0.nr_d=
irtied
>     318312           -27.8%     229843 =C2=B1 12%  numa-vmstat.node0.nr_d=
irty
>    7470736 =C2=B1  2%     -12.3%    6551235        numa-vmstat.node0.nr_f=
ile_pages
>    7285231 =C2=B1  2%     -12.9%    6344516        numa-vmstat.node0.nr_i=
nactive_file
>       2864 =C2=B1 32%     +67.8%       4805 =C2=B1  4%  numa-vmstat.node0=
.nr_page_table_pages
>    2621950            -9.5%    2372694 =C2=B1  3%  numa-vmstat.node0.nr_w=
riteback
>    4417272 =C2=B1  5%     -13.2%    3833953 =C2=B1  2%  numa-vmstat.node0=
.nr_written
>     821564 =C2=B1 18%     +63.0%    1339113 =C2=B1  3%  numa-vmstat.node0=
.nr_zone_active_anon
>    7285229 =C2=B1  2%     -12.9%    6344515        numa-vmstat.node0.nr_z=
one_inactive_file
>    2940629           -11.5%    2602714        numa-vmstat.node0.nr_zone_w=
rite_pending
>    7580229 =C2=B1  2%      -9.7%    6844750        numa-vmstat.node1.nr_d=
irtied
>     332415 =C2=B1  4%     -30.4%     231200 =C2=B1  8%  numa-vmstat.node1=
.nr_dirty
>    7686733 =C2=B1  2%      -9.8%    6933415        numa-vmstat.node1.nr_f=
ile_pages
>    7515981 =C2=B1  2%      -9.9%    6774631        numa-vmstat.node1.nr_i=
nactive_file
>     237.50 =C2=B1 15%     -32.8%     159.67 =C2=B1 33%  numa-vmstat.node1=
.nr_mlock
>       2715 =C2=B1 35%     -32.5%       1833 =C2=B1 12%  numa-vmstat.node1=
.nr_page_table_pages
>      26220           -11.6%      23179 =C2=B1  2%  numa-vmstat.node1.nr_s=
lab_reclaimable
>    2721165           -10.7%    2430270 =C2=B1  2%  numa-vmstat.node1.nr_w=
riteback
>    4526266 =C2=B1  5%      -7.6%    4183049 =C2=B1  2%  numa-vmstat.node1=
.nr_written
>    7515979 =C2=B1  2%      -9.9%    6774630        numa-vmstat.node1.nr_z=
one_inactive_file
>    3053946           -12.8%    2661697 =C2=B1  2%  numa-vmstat.node1.nr_z=
one_write_pending
>    8503740           -12.8%    7411961        numa-vmstat.node1.numa_hit
>    8317339           -13.1%    7226488        numa-vmstat.node1.numa_local
>    1722147           +21.9%    2098533        proc-vmstat.nr_active_anon
>      24721           -13.9%      21295        proc-vmstat.nr_active_file
>    1720474           +21.9%    2096933        proc-vmstat.nr_anon_pages
>       3284           +22.0%       4006        proc-vmstat.nr_anon_transpa=
rent_hugepages
>   17531015           -11.0%   15609677        proc-vmstat.nr_dirtied
>     651202 =C2=B1  3%     -29.1%     461586 =C2=B1 11%  proc-vmstat.nr_di=
rty
>   15157215           -11.0%   13493267        proc-vmstat.nr_file_pages
>   32019703            +4.0%   33309791        proc-vmstat.nr_free_pages
>      58989           +22.2%      72088        proc-vmstat.nr_inactive_anon
>   14800882           -11.3%   13127864        proc-vmstat.nr_inactive_file
>      16112            +2.0%      16433        proc-vmstat.nr_kernel_stack
>      60743           +21.7%      73904        proc-vmstat.nr_mapped
>     474.50           -20.5%     377.33 =C2=B1 32%  proc-vmstat.nr_mlock
>       5584           +18.9%       6640        proc-vmstat.nr_page_table_p=
ages
>      60837           +21.4%      73851        proc-vmstat.nr_shmem
>      53130            -7.4%      49197        proc-vmstat.nr_slab_reclaim=
able
>      66018 =C2=B1  2%      -2.6%      64316 =C2=B1  2%  proc-vmstat.nr_sl=
ab_unreclaimable
>    5342632           -10.0%    4805762        proc-vmstat.nr_writeback
>   17530929           -11.0%   15609605        proc-vmstat.nr_written
>    1722147           +21.9%    2098533        proc-vmstat.nr_zone_active_=
anon
>      24721           -13.9%      21295        proc-vmstat.nr_zone_active_=
file
>      58989           +22.2%      72088        proc-vmstat.nr_zone_inactiv=
e_anon
>   14800882           -11.3%   13127865        proc-vmstat.nr_zone_inactiv=
e_file
>    5994595           -12.1%    5267669        proc-vmstat.nr_zone_write_p=
ending
>      77.25 =C2=B1 34%   +2658.1%       2130 =C2=B1118%  proc-vmstat.numa_=
hint_faults_local
>   18920494           -10.7%   16900243        proc-vmstat.numa_hit
>      32.25 =C2=B1167%  +12215.2%       3971 =C2=B1 10%  proc-vmstat.numa_=
huge_pte_updates
>   18888968           -10.7%   16868702        proc-vmstat.numa_local
>       2333 =C2=B1 21%   +1071.8%      27337 =C2=B1 14%  proc-vmstat.numa_=
pages_migrated
>      17396 =C2=B1160%  +11700.1%    2052776 =C2=B1 10%  proc-vmstat.numa_=
pte_updates
>      32469           -13.3%      28161 =C2=B1  2%  proc-vmstat.pgactivate
>   22264192            -9.1%   20231175        proc-vmstat.pgalloc_normal
>    1624865            -8.8%    1482610        proc-vmstat.pgfault
>   21790575 =C2=B1  2%      -7.3%   20209315        proc-vmstat.pgfree
>       2333 =C2=B1 21%   +1071.8%      27337 =C2=B1 14%  proc-vmstat.pgmig=
rate_success
>   70397986           -11.0%   62684233        proc-vmstat.pgpgout
>      22749 =C2=B1 19%     -20.5%      18076 =C2=B1 16%  sched_debug.cfs_r=
q:/.load.avg
>       1.73 =C2=B1 21%     -35.6%       1.11 =C2=B1  8%  sched_debug.cfs_r=
q:/.nr_spread_over.max
>       0.40 =C2=B1 13%     -31.6%       0.27 =C2=B1 13%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>      76.80 =C2=B1 57%     +97.5%     151.70 =C2=B1 35%  sched_debug.cfs_r=
q:/.removed.load_avg.max
>      11.27 =C2=B1 76%    +174.8%      30.98 =C2=B1 39%  sched_debug.cfs_r=
q:/.removed.load_avg.stddev
>       3545 =C2=B1 57%     +98.3%       7029 =C2=B1 35%  sched_debug.cfs_r=
q:/.removed.runnable_sum.max
>     518.68 =C2=B1 76%    +176.2%       1432 =C2=B1 39%  sched_debug.cfs_r=
q:/.removed.runnable_sum.stddev
>       0.82 =C2=B1115%    +277.4%       3.11 =C2=B1 44%  sched_debug.cfs_r=
q:/.removed.util_avg.avg
>      33.52 =C2=B1 63%    +130.1%      77.15 =C2=B1 35%  sched_debug.cfs_r=
q:/.removed.util_avg.max
>       4.51 =C2=B1 78%    +218.0%      14.33 =C2=B1 38%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>      13.04 =C2=B1 17%     -19.8%      10.45 =C2=B1  7%  sched_debug.cfs_r=
q:/.runnable_load_avg.avg
>     514.15 =C2=B1 15%     -24.0%     390.56 =C2=B1  3%  sched_debug.cfs_r=
q:/.runnable_load_avg.max
>      74.55 =C2=B1 16%     -19.7%      59.88 =C2=B1  3%  sched_debug.cfs_r=
q:/.runnable_load_avg.stddev
>      22738 =C2=B1 19%     -20.5%      18069 =C2=B1 16%  sched_debug.cfs_r=
q:/.runnable_weight.avg
>      60.00 =C2=B1  4%     +13.7%      68.23 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_avg.avg
>     304212           -10.4%     272577        sched_debug.cpu.clock.avg
>     304216           -10.4%     272582        sched_debug.cpu.clock.max
>     304207           -10.4%     272571        sched_debug.cpu.clock.min
>     304212           -10.4%     272577        sched_debug.cpu.clock_task.=
avg
>     304216           -10.4%     272582        sched_debug.cpu.clock_task.=
max
>     304207           -10.4%     272571        sched_debug.cpu.clock_task.=
min
>       0.00 =C2=B1  5%      -7.3%       0.00        sched_debug.cpu.next_b=
alance.stddev
>      14177           -28.1%      10200        sched_debug.cpu.nr_switches=
.avg
>      89339 =C2=B1 18%     -22.1%      69625        sched_debug.cpu.nr_swi=
tches.max
>      13031 =C2=B1 13%     -17.6%      10735 =C2=B1  4%  sched_debug.cpu.n=
r_switches.stddev
>       0.52           +16.3%       0.60 =C2=B1  2%  sched_debug.cpu.nr_uni=
nterruptible.avg
>     -22.45           -36.6%     -14.22        sched_debug.cpu.nr_uninterr=
uptible.min
>      12756           -32.2%       8643 =C2=B1  2%  sched_debug.cpu.sched_=
count.avg
>      87145 =C2=B1 19%     -23.0%      67130        sched_debug.cpu.sched_=
count.max
>      12845 =C2=B1 13%     -18.8%      10429 =C2=B1  3%  sched_debug.cpu.s=
ched_count.stddev
>       6132           -32.0%       4167 =C2=B1  2%  sched_debug.cpu.sched_=
goidle.avg
>      42808 =C2=B1 20%     -26.0%      31699        sched_debug.cpu.sched_=
goidle.max
>       6348 =C2=B1 13%     -19.6%       5101 =C2=B1  3%  sched_debug.cpu.s=
ched_goidle.stddev
>       6212           -31.9%       4231 =C2=B1  2%  sched_debug.cpu.ttwu_c=
ount.avg
>       3718           -37.1%       2339        sched_debug.cpu.ttwu_local.=
avg
>     203.38 =C2=B1 19%     -45.5%     110.81 =C2=B1 12%  sched_debug.cpu.t=
twu_local.min
>     304207           -10.4%     272571        sched_debug.cpu_clk
>     301340           -10.5%     269700        sched_debug.ktime
>     304551           -10.4%     272919        sched_debug.sched_clk
>       0.75            -0.4        0.36 =C2=B1 70%  perf-profile.calltrace=
.cycles-pp.update_blocked_averages.run_rebalance_domains.__softirqentry_tex=
t_start.irq_exit.smp_apic_timer_interrupt
>       0.81 =C2=B1  2%      -0.2        0.63 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.run_rebalance_domains.__softirqentry_text_start.irq_exit.sm=
p_apic_timer_interrupt.apic_timer_interrupt
>       0.91 =C2=B1  2%      +0.1        0.99 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.load_balance.rebalance_domains.__softirqentry_text_start.ir=
q_exit.smp_apic_timer_interrupt
>      93.67            +2.3       95.95        perf-profile.calltrace.cycl=
es-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64
>      93.73            +2.3       96.01        perf-profile.calltrace.cycl=
es-pp.cpu_startup_entry.start_secondary.secondary_startup_64
>      93.73            +2.3       96.01        perf-profile.calltrace.cycl=
es-pp.start_secondary.secondary_startup_64
>      94.44            +2.7       97.12        perf-profile.calltrace.cycl=
es-pp.secondary_startup_64
>      81.60            +3.1       84.73        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter.do_idle.cpu_startup_entry.start_secondary.secondary_sta=
rtup_64
>      80.59            +3.1       83.73        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_startup_entry.start_sec=
ondary
>       4.14            -2.3        1.80 =C2=B1 35%  perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
>       4.13            -2.3        1.80 =C2=B1 35%  perf-profile.children.=
cycles-pp.do_syscall_64
>       0.47 =C2=B1 10%      -0.4        0.11 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       0.83 =C2=B1  9%      -0.3        0.55 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.run_timer_softirq
>       0.35 =C2=B1 10%      -0.3        0.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       0.35 =C2=B1 10%      -0.3        0.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.activate_task
>       0.35 =C2=B1 11%      -0.3        0.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       0.34 =C2=B1 11%      -0.3        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       0.76 =C2=B1  2%      -0.2        0.53 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_blocked_averages
>       0.26 =C2=B1  7%      -0.2        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.__account_scheduler_latency
>       0.82 =C2=B1  2%      -0.2        0.64 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.run_rebalance_domains
>       0.62 =C2=B1  8%      -0.2        0.44 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       0.23 =C2=B1  2%      -0.2        0.05 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.19 =C2=B1 11%      -0.2        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.stack_trace_save_tsk
>       0.18 =C2=B1 10%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.arch_stack_walk
>       0.20 =C2=B1 13%      -0.1        0.09 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.__schedule
>       0.26 =C2=B1 20%      -0.1        0.16 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.trigger_load_balance
>       0.15 =C2=B1 71%      -0.1        0.05 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.call_function_single_interrupt
>       0.11 =C2=B1 22%      -0.1        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.schedule
>       0.21 =C2=B1  7%      -0.1        0.15 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.get_cpu_device
>       0.06 =C2=B1 20%      +0.0        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.sched_clock_idle_wakeup_event
>       0.20 =C2=B1  7%      +0.0        0.25 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__hrtimer_get_next_event
>       0.09 =C2=B1 13%      +0.1        0.14 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.irq_work_needs_cpu
>       0.00            +0.1        0.06 =C2=B1 16%  perf-profile.children.=
cycles-pp.irq_work_tick
>       0.00            +0.1        0.06 =C2=B1 13%  perf-profile.children.=
cycles-pp.__intel_pmu_disable_all
>       0.10 =C2=B1 22%      +0.1        0.16 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.account_process_tick
>       0.94            +0.1        1.02 =C2=B1  5%  perf-profile.children.=
cycles-pp.load_balance
>       0.13 =C2=B1 10%      +0.1        0.21 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.nr_iowait_cpu
>       0.01 =C2=B1173%      +0.1        0.09 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.intel_pmu_disable_all
>       0.27 =C2=B1  4%      +0.1        0.36 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.enqueue_hrtimer
>      93.73            +2.3       96.01        perf-profile.children.cycle=
s-pp.start_secondary
>      94.57            +2.7       97.23        perf-profile.children.cycle=
s-pp.do_idle
>      94.44            +2.7       97.12        perf-profile.children.cycle=
s-pp.secondary_startup_64
>      94.44            +2.7       97.12        perf-profile.children.cycle=
s-pp.cpu_startup_entry
>      82.16            +3.5       85.66        perf-profile.children.cycle=
s-pp.cpuidle_enter_state
>      82.23            +3.5       85.74        perf-profile.children.cycle=
s-pp.cpuidle_enter
>       1.40 =C2=B1 21%      -0.6        0.75 =C2=B1 51%  perf-profile.self=
.cycles-pp.timekeeping_max_deferment
>       0.62 =C2=B1  8%      -0.2        0.44 =C2=B1 37%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>       0.20 =C2=B1 10%      -0.2        0.05 =C2=B1 70%  perf-profile.self=
.cycles-pp.__update_load_avg_cfs_rq
>       0.24 =C2=B1 22%      -0.1        0.14 =C2=B1 30%  perf-profile.self=
.cycles-pp.trigger_load_balance
>       0.16 =C2=B1 17%      -0.1        0.08 =C2=B1 48%  perf-profile.self=
.cycles-pp.update_blocked_averages
>       0.20 =C2=B1  7%      -0.1        0.14 =C2=B1 21%  perf-profile.self=
.cycles-pp.get_cpu_device
>       0.10 =C2=B1 10%      -0.0        0.07 =C2=B1 14%  perf-profile.self=
.cycles-pp.do_wait
>       0.01 =C2=B1173%      +0.0        0.06 =C2=B1 13%  perf-profile.self=
.cycles-pp.tick_nohz_irq_exit
>       0.08 =C2=B1 25%      +0.0        0.13 =C2=B1 21%  perf-profile.self=
.cycles-pp.rb_insert_color
>       0.08 =C2=B1 10%      +0.0        0.13 =C2=B1 14%  perf-profile.self=
.cycles-pp.irq_work_needs_cpu
>       0.00            +0.1        0.06 =C2=B1 16%  perf-profile.self.cycl=
es-pp.irq_work_tick
>       0.12 =C2=B1 15%      +0.1        0.18 =C2=B1 19%  perf-profile.self=
.cycles-pp.rebalance_domains
>       0.09 =C2=B1 23%      +0.1        0.16 =C2=B1 13%  perf-profile.self=
.cycles-pp.account_process_tick
>       0.12 =C2=B1 12%      +0.1        0.20 =C2=B1 18%  perf-profile.self=
.cycles-pp.nr_iowait_cpu
>       0.23 =C2=B1  8%      +0.1        0.33 =C2=B1 16%  perf-profile.self=
.cycles-pp.__hrtimer_run_queues
>       0.50 =C2=B1173%  +1.5e+05%     733.67 =C2=B1140%  interrupts.105:PC=
I-MSI.31981638-edge.i40e-eth0-TxRx-69
>       1.00 =C2=B1 70%  +73266.7%     733.67 =C2=B1140%  interrupts.107:PC=
I-MSI.31981640-edge.i40e-eth0-TxRx-71
>     498.25 =C2=B1  2%     -10.9%     444.00        interrupts.35:PCI-MSI.=
31981568-edge.i40e-0000:3d:00.0:misc
>       1673 =C2=B1169%     -99.1%      15.33 =C2=B1136%  interrupts.45:PCI=
-MSI.31981578-edge.i40e-eth0-TxRx-9
>     149.50 =C2=B1167%     -98.9%       1.67 =C2=B1101%  interrupts.55:PCI=
-MSI.31981588-edge.i40e-eth0-TxRx-19
>       0.50 =C2=B1173%  +17233.3%      86.67 =C2=B1 75%  interrupts.60:PCI=
-MSI.31981593-edge.i40e-eth0-TxRx-24
>       1143           -10.7%       1021        interrupts.9:IO-APIC.9-fast=
eoi.acpi
>     588135 =C2=B1  5%     -14.5%     502746 =C2=B1  5%  interrupts.CAL:Fu=
nction_call_interrupts
>       6024 =C2=B1  7%     -12.3%       5281 =C2=B1  4%  interrupts.CPU0.C=
AL:Function_call_interrupts
>    1138250           -10.6%    1017756        interrupts.CPU0.LOC:Local_t=
imer_interrupts
>       1143           -10.7%       1021        interrupts.CPU1.9:IO-APIC.9=
-fasteoi.acpi
>       6026 =C2=B1  7%     -12.0%       5303 =C2=B1  4%  interrupts.CPU1.C=
AL:Function_call_interrupts
>    1137668           -10.7%    1015519        interrupts.CPU1.LOC:Local_t=
imer_interrupts
>       6004 =C2=B1  7%     -13.4%       5199 =C2=B1  6%  interrupts.CPU10.=
CAL:Function_call_interrupts
>    1137962           -10.6%    1017379        interrupts.CPU10.LOC:Local_=
timer_interrupts
>      58.25 =C2=B1 68%   +2366.4%       1436 =C2=B1114%  interrupts.CPU10.=
RES:Rescheduling_interrupts
>       6001 =C2=B1  7%     -11.8%       5291 =C2=B1  4%  interrupts.CPU11.=
CAL:Function_call_interrupts
>    1137822           -10.7%    1015837        interrupts.CPU11.LOC:Local_=
timer_interrupts
>       6001 =C2=B1  7%     -12.0%       5280 =C2=B1  4%  interrupts.CPU12.=
CAL:Function_call_interrupts
>    1137767           -10.3%    1020035        interrupts.CPU12.LOC:Local_=
timer_interrupts
>       5950 =C2=B1  7%     -11.2%       5285 =C2=B1  4%  interrupts.CPU13.=
CAL:Function_call_interrupts
>    1138385           -10.7%    1016786        interrupts.CPU13.LOC:Local_=
timer_interrupts
>     217.75 =C2=B1 95%     -74.6%      55.33 =C2=B1 47%  interrupts.CPU13.=
RES:Rescheduling_interrupts
>       5996 =C2=B1  7%     -11.7%       5297 =C2=B1  4%  interrupts.CPU14.=
CAL:Function_call_interrupts
>    1140203           -10.3%    1023222        interrupts.CPU14.LOC:Local_=
timer_interrupts
>       5994 =C2=B1  7%     -11.9%       5280 =C2=B1  4%  interrupts.CPU15.=
CAL:Function_call_interrupts
>    1140803           -10.8%    1018011        interrupts.CPU15.LOC:Local_=
timer_interrupts
>       5994 =C2=B1  7%     -11.8%       5286 =C2=B1  4%  interrupts.CPU16.=
CAL:Function_call_interrupts
>    1137959           -10.7%    1015838        interrupts.CPU16.LOC:Local_=
timer_interrupts
>       5994 =C2=B1  7%     -14.0%       5155 =C2=B1  6%  interrupts.CPU17.=
CAL:Function_call_interrupts
>    1137757           -10.7%    1015602        interrupts.CPU17.LOC:Local_=
timer_interrupts
>      34.25 =C2=B1 90%    +454.7%     190.00 =C2=B1 86%  interrupts.CPU17.=
TLB:TLB_shootdowns
>    1137983           -10.5%    1018792        interrupts.CPU18.LOC:Local_=
timer_interrupts
>     149.00 =C2=B1168%     -98.9%       1.67 =C2=B1101%  interrupts.CPU19.=
55:PCI-MSI.31981588-edge.i40e-eth0-TxRx-19
>       5991 =C2=B1  7%     -11.9%       5278 =C2=B1  4%  interrupts.CPU19.=
CAL:Function_call_interrupts
>    1137454           -10.2%    1020953        interrupts.CPU19.LOC:Local_=
timer_interrupts
>     168.50 =C2=B1 88%     -68.2%      53.67 =C2=B1 27%  interrupts.CPU19.=
RES:Rescheduling_interrupts
>       6025 =C2=B1  7%     -11.9%       5307 =C2=B1  4%  interrupts.CPU2.C=
AL:Function_call_interrupts
>    1138563           -10.8%    1015929        interrupts.CPU2.LOC:Local_t=
imer_interrupts
>       5991 =C2=B1  7%     -12.0%       5274 =C2=B1  4%  interrupts.CPU20.=
CAL:Function_call_interrupts
>    1137663           -10.7%    1015674        interrupts.CPU20.LOC:Local_=
timer_interrupts
>       5994 =C2=B1  7%     -12.0%       5274 =C2=B1  4%  interrupts.CPU21.=
CAL:Function_call_interrupts
>    1137722           -10.7%    1015780        interrupts.CPU21.LOC:Local_=
timer_interrupts
>       5989 =C2=B1  7%     -12.0%       5271 =C2=B1  4%  interrupts.CPU22.=
CAL:Function_call_interrupts
>    1137580           -10.7%    1016040        interrupts.CPU22.LOC:Local_=
timer_interrupts
>    1137836           -10.5%    1017902        interrupts.CPU23.LOC:Local_=
timer_interrupts
>       0.25 =C2=B1173%  +34433.3%      86.33 =C2=B1 75%  interrupts.CPU24.=
60:PCI-MSI.31981593-edge.i40e-eth0-TxRx-24
>       6648 =C2=B1 12%     -33.8%       4404 =C2=B1 19%  interrupts.CPU24.=
CAL:Function_call_interrupts
>    1137947           -12.4%     997184 =C2=B1  2%  interrupts.CPU24.LOC:L=
ocal_timer_interrupts
>       6035 =C2=B1  7%     -24.9%       4530 =C2=B1 14%  interrupts.CPU25.=
CAL:Function_call_interrupts
>    1139850           -12.5%     996933 =C2=B1  2%  interrupts.CPU25.LOC:L=
ocal_timer_interrupts
>     311.50 =C2=B1136%    +757.0%       2669 =C2=B1 84%  interrupts.CPU25.=
RES:Rescheduling_interrupts
>       5992 =C2=B1  8%     -11.5%       5301 =C2=B1  5%  interrupts.CPU26.=
CAL:Function_call_interrupts
>    1139400           -12.5%     997191 =C2=B1  2%  interrupts.CPU26.LOC:L=
ocal_timer_interrupts
>       5941 =C2=B1  9%     -11.3%       5270 =C2=B1  4%  interrupts.CPU27.=
CAL:Function_call_interrupts
>    1139705           -12.9%     992856 =C2=B1  3%  interrupts.CPU27.LOC:L=
ocal_timer_interrupts
>       5930 =C2=B1  8%     -11.2%       5266 =C2=B1  4%  interrupts.CPU28.=
CAL:Function_call_interrupts
>    1141424           -12.9%     994051 =C2=B1  3%  interrupts.CPU28.LOC:L=
ocal_timer_interrupts
>      46.00 =C2=B1 53%    +297.1%     182.67 =C2=B1 70%  interrupts.CPU28.=
RES:Rescheduling_interrupts
>       5986 =C2=B1  7%     -11.9%       5274 =C2=B1  4%  interrupts.CPU29.=
CAL:Function_call_interrupts
>    1138137           -12.6%     994602 =C2=B1  3%  interrupts.CPU29.LOC:L=
ocal_timer_interrupts
>       6026 =C2=B1  7%     -11.9%       5307 =C2=B1  4%  interrupts.CPU3.C=
AL:Function_call_interrupts
>    1141306           -11.0%    1015838        interrupts.CPU3.LOC:Local_t=
imer_interrupts
>       3711 =C2=B1138%     -95.9%     153.67 =C2=B1 69%  interrupts.CPU3.R=
ES:Rescheduling_interrupts
>       8396 =C2=B1 45%     -36.8%       5302 =C2=B1  5%  interrupts.CPU30.=
CAL:Function_call_interrupts
>    1141904           -12.8%     995933 =C2=B1  2%  interrupts.CPU30.LOC:L=
ocal_timer_interrupts
>       6257 =C2=B1  5%     -15.2%       5304 =C2=B1  5%  interrupts.CPU31.=
CAL:Function_call_interrupts
>    1139795           -12.6%     995895 =C2=B1  2%  interrupts.CPU31.LOC:L=
ocal_timer_interrupts
>       6003 =C2=B1  8%     -11.7%       5299 =C2=B1  5%  interrupts.CPU32.=
CAL:Function_call_interrupts
>    1137916           -12.7%     993919 =C2=B1  3%  interrupts.CPU32.LOC:L=
ocal_timer_interrupts
>       5986 =C2=B1  8%     -11.5%       5300 =C2=B1  5%  interrupts.CPU33.=
CAL:Function_call_interrupts
>    1139914           -12.6%     996673 =C2=B1  2%  interrupts.CPU33.LOC:L=
ocal_timer_interrupts
>       6357 =C2=B1  6%     -16.7%       5297 =C2=B1  5%  interrupts.CPU34.=
CAL:Function_call_interrupts
>    1138490           -12.6%     994872 =C2=B1  2%  interrupts.CPU34.LOC:L=
ocal_timer_interrupts
>       5992 =C2=B1  8%     -16.0%       5034 =C2=B1  4%  interrupts.CPU35.=
CAL:Function_call_interrupts
>    1137884           -12.5%     995226 =C2=B1  2%  interrupts.CPU35.LOC:L=
ocal_timer_interrupts
>       7658 =C2=B1 33%     -30.9%       5293 =C2=B1  5%  interrupts.CPU36.=
CAL:Function_call_interrupts
>    1137619           -12.3%     997627 =C2=B1  2%  interrupts.CPU36.LOC:L=
ocal_timer_interrupts
>       5960 =C2=B1  6%     -11.2%       5291 =C2=B1  5%  interrupts.CPU37.=
CAL:Function_call_interrupts
>    1138379           -12.5%     995871 =C2=B1  2%  interrupts.CPU37.LOC:L=
ocal_timer_interrupts
>       7549 =C2=B1 34%     -29.9%       5290 =C2=B1  5%  interrupts.CPU38.=
CAL:Function_call_interrupts
>    1137796           -12.6%     994483 =C2=B1  3%  interrupts.CPU38.LOC:L=
ocal_timer_interrupts
>       5953 =C2=B1  7%     -11.2%       5289 =C2=B1  5%  interrupts.CPU39.=
CAL:Function_call_interrupts
>    1137829           -12.4%     997075 =C2=B1  2%  interrupts.CPU39.LOC:L=
ocal_timer_interrupts
>      63.00 =C2=B1 30%   +1197.9%     817.67 =C2=B1 77%  interrupts.CPU39.=
RES:Rescheduling_interrupts
>       6021 =C2=B1  7%     -12.1%       5295 =C2=B1  4%  interrupts.CPU4.C=
AL:Function_call_interrupts
>    1137810           -10.6%    1017478        interrupts.CPU4.LOC:Local_t=
imer_interrupts
>       7275 =C2=B1 26%     -27.4%       5285 =C2=B1  5%  interrupts.CPU40.=
CAL:Function_call_interrupts
>    1137756           -12.6%     994513 =C2=B1  3%  interrupts.CPU40.LOC:L=
ocal_timer_interrupts
>       5979 =C2=B1  8%     -10.0%       5380 =C2=B1  4%  interrupts.CPU41.=
CAL:Function_call_interrupts
>    1137888           -12.7%     993206 =C2=B1  3%  interrupts.CPU41.LOC:L=
ocal_timer_interrupts
>       5967 =C2=B1  7%     -11.4%       5286 =C2=B1  5%  interrupts.CPU42.=
CAL:Function_call_interrupts
>    1137767           -12.2%     998500 =C2=B1  2%  interrupts.CPU42.LOC:L=
ocal_timer_interrupts
>       5963 =C2=B1  8%     -11.2%       5292 =C2=B1  5%  interrupts.CPU43.=
CAL:Function_call_interrupts
>    1137641           -12.5%     995532 =C2=B1  2%  interrupts.CPU43.LOC:L=
ocal_timer_interrupts
>       5955 =C2=B1  8%     -11.3%       5285 =C2=B1  5%  interrupts.CPU44.=
CAL:Function_call_interrupts
>    1137594           -12.7%     993238 =C2=B1  3%  interrupts.CPU44.LOC:L=
ocal_timer_interrupts
>       7160 =C2=B1 24%     -27.2%       5214 =C2=B1  7%  interrupts.CPU45.=
CAL:Function_call_interrupts
>    1138234           -12.7%     994085 =C2=B1  3%  interrupts.CPU45.LOC:L=
ocal_timer_interrupts
>       5986 =C2=B1  6%     -11.8%       5280 =C2=B1  5%  interrupts.CPU46.=
CAL:Function_call_interrupts
>    1139746           -12.8%     993920 =C2=B1  3%  interrupts.CPU46.LOC:L=
ocal_timer_interrupts
>       7142 =C2=B1 28%     -28.5%       5107 =C2=B1  7%  interrupts.CPU47.=
CAL:Function_call_interrupts
>    1141307           -12.8%     994894 =C2=B1  2%  interrupts.CPU47.LOC:L=
ocal_timer_interrupts
>       6040 =C2=B1  7%     -38.7%       3703 =C2=B1 64%  interrupts.CPU48.=
CAL:Function_call_interrupts
>    1137670           -10.5%    1018124        interrupts.CPU48.LOC:Local_=
timer_interrupts
>       6037 =C2=B1  7%     -13.2%       5238 =C2=B1  5%  interrupts.CPU49.=
CAL:Function_call_interrupts
>    1137656           -10.7%    1015360        interrupts.CPU49.LOC:Local_=
timer_interrupts
>       6034 =C2=B1  7%     -12.2%       5295 =C2=B1  4%  interrupts.CPU5.C=
AL:Function_call_interrupts
>    1137625           -10.6%    1016994        interrupts.CPU5.LOC:Local_t=
imer_interrupts
>       6033 =C2=B1  7%     -12.9%       5257 =C2=B1  4%  interrupts.CPU50.=
CAL:Function_call_interrupts
>    1137857           -10.1%    1022699        interrupts.CPU50.LOC:Local_=
timer_interrupts
>       6036 =C2=B1  7%     -12.5%       5281 =C2=B1  5%  interrupts.CPU51.=
CAL:Function_call_interrupts
>    1137606           -10.5%    1017724        interrupts.CPU51.LOC:Local_=
timer_interrupts
>       6036 =C2=B1  7%     -12.7%       5272 =C2=B1  5%  interrupts.CPU52.=
CAL:Function_call_interrupts
>    1137591           -10.7%    1015660        interrupts.CPU52.LOC:Local_=
timer_interrupts
>       6034 =C2=B1  7%     -12.7%       5266 =C2=B1  5%  interrupts.CPU53.=
CAL:Function_call_interrupts
>    1137615           -10.7%    1015635        interrupts.CPU53.LOC:Local_=
timer_interrupts
>       1420 =C2=B1167%     -97.3%      37.67 =C2=B1 28%  interrupts.CPU53.=
RES:Rescheduling_interrupts
>       6032 =C2=B1  7%     -12.6%       5269 =C2=B1  5%  interrupts.CPU54.=
CAL:Function_call_interrupts
>    1137633           -10.7%    1015923        interrupts.CPU54.LOC:Local_=
timer_interrupts
>       6028 =C2=B1  7%     -12.7%       5264 =C2=B1  5%  interrupts.CPU55.=
CAL:Function_call_interrupts
>    1137542           -10.7%    1015527        interrupts.CPU55.LOC:Local_=
timer_interrupts
>       6028 =C2=B1  7%     -12.2%       5294 =C2=B1  6%  interrupts.CPU56.=
CAL:Function_call_interrupts
>    1137588           -10.7%    1015879        interrupts.CPU56.LOC:Local_=
timer_interrupts
>       6026 =C2=B1  7%     -10.6%       5386 =C2=B1  4%  interrupts.CPU57.=
CAL:Function_call_interrupts
>    1138610           -10.7%    1016655        interrupts.CPU57.LOC:Local_=
timer_interrupts
>     157.75 =C2=B1 95%     -74.9%      39.67 =C2=B1 48%  interrupts.CPU57.=
RES:Rescheduling_interrupts
>       6030 =C2=B1  7%     -11.0%       5366 =C2=B1  4%  interrupts.CPU58.=
CAL:Function_call_interrupts
>    1143109           -11.1%    1015690        interrupts.CPU58.LOC:Local_=
timer_interrupts
>       6023 =C2=B1  7%     -10.6%       5383 =C2=B1  4%  interrupts.CPU59.=
CAL:Function_call_interrupts
>    1138041           -10.7%    1015709        interrupts.CPU59.LOC:Local_=
timer_interrupts
>       6006 =C2=B1  7%     -13.9%       5168 =C2=B1  6%  interrupts.CPU6.C=
AL:Function_call_interrupts
>    1140328           -10.7%    1018510        interrupts.CPU6.LOC:Local_t=
imer_interrupts
>       6018 =C2=B1  7%     -10.8%       5369 =C2=B1  4%  interrupts.CPU60.=
CAL:Function_call_interrupts
>    1137539           -10.7%    1015845        interrupts.CPU60.LOC:Local_=
timer_interrupts
>       6017 =C2=B1  7%     -10.7%       5375 =C2=B1  4%  interrupts.CPU61.=
CAL:Function_call_interrupts
>    1137720           -10.7%    1015686        interrupts.CPU61.LOC:Local_=
timer_interrupts
>       6023 =C2=B1  7%     -10.7%       5376 =C2=B1  4%  interrupts.CPU62.=
CAL:Function_call_interrupts
>    1137739           -10.7%    1015682        interrupts.CPU62.LOC:Local_=
timer_interrupts
>       5946 =C2=B1  6%      -9.9%       5355 =C2=B1  4%  interrupts.CPU63.=
CAL:Function_call_interrupts
>    1137888           -10.7%    1015571        interrupts.CPU63.LOC:Local_=
timer_interrupts
>       6041 =C2=B1  7%     -27.6%       4372 =C2=B1 34%  interrupts.CPU64.=
CAL:Function_call_interrupts
>    1137594           -10.5%    1017629        interrupts.CPU64.LOC:Local_=
timer_interrupts
>       6020 =C2=B1  7%     -21.4%       4729 =C2=B1 20%  interrupts.CPU65.=
CAL:Function_call_interrupts
>    1137738           -10.7%    1015599        interrupts.CPU65.LOC:Local_=
timer_interrupts
>     184.50 =C2=B1 21%     +51.6%     279.67 =C2=B1 10%  interrupts.CPU65.=
NMI:Non-maskable_interrupts
>     184.50 =C2=B1 21%     +51.6%     279.67 =C2=B1 10%  interrupts.CPU65.=
PMI:Performance_monitoring_interrupts
>       6019 =C2=B1  7%     -11.3%       5341 =C2=B1  4%  interrupts.CPU66.=
CAL:Function_call_interrupts
>    1137636           -10.6%    1017229        interrupts.CPU66.LOC:Local_=
timer_interrupts
>       6017 =C2=B1  7%     -11.3%       5337 =C2=B1  4%  interrupts.CPU67.=
CAL:Function_call_interrupts
>    1137765           -10.5%    1017790        interrupts.CPU67.LOC:Local_=
timer_interrupts
>     168.50 =C2=B1 20%    +102.8%     341.67 =C2=B1 29%  interrupts.CPU67.=
NMI:Non-maskable_interrupts
>     168.50 =C2=B1 20%    +102.8%     341.67 =C2=B1 29%  interrupts.CPU67.=
PMI:Performance_monitoring_interrupts
>       6012 =C2=B1  7%     -11.2%       5337 =C2=B1  5%  interrupts.CPU68.=
CAL:Function_call_interrupts
>    1137641           -10.7%    1015676        interrupts.CPU68.LOC:Local_=
timer_interrupts
>       0.25 =C2=B1173%  +2.9e+05%     733.00 =C2=B1141%  interrupts.CPU69.=
105:PCI-MSI.31981638-edge.i40e-eth0-TxRx-69
>       6016 =C2=B1  7%     -11.3%       5334 =C2=B1  5%  interrupts.CPU69.=
CAL:Function_call_interrupts
>    1137611           -10.7%    1015774        interrupts.CPU69.LOC:Local_=
timer_interrupts
>     498.25 =C2=B1  2%     -10.9%     444.00        interrupts.CPU7.35:PCI=
-MSI.31981568-edge.i40e-0000:3d:00.0:misc
>    1138138           -10.7%    1015885        interrupts.CPU7.LOC:Local_t=
imer_interrupts
>       6010 =C2=B1  7%     -11.3%       5329 =C2=B1  4%  interrupts.CPU70.=
CAL:Function_call_interrupts
>    1137598           -10.5%    1018147        interrupts.CPU70.LOC:Local_=
timer_interrupts
>       0.25 =C2=B1173%  +2.9e+05%     733.33 =C2=B1140%  interrupts.CPU71.=
107:PCI-MSI.31981640-edge.i40e-eth0-TxRx-71
>       6004 =C2=B1  7%     -11.4%       5321 =C2=B1  4%  interrupts.CPU71.=
CAL:Function_call_interrupts
>    1137627           -10.7%    1016150        interrupts.CPU71.LOC:Local_=
timer_interrupts
>       6010 =C2=B1  8%     -12.6%       5254 =C2=B1  5%  interrupts.CPU72.=
CAL:Function_call_interrupts
>    1138107           -12.4%     996826 =C2=B1  2%  interrupts.CPU72.LOC:L=
ocal_timer_interrupts
>    1137801           -12.4%     997018 =C2=B1  2%  interrupts.CPU73.LOC:L=
ocal_timer_interrupts
>       7072 =C2=B1 22%     -24.4%       5346 =C2=B1  4%  interrupts.CPU74.=
CAL:Function_call_interrupts
>    1137764           -12.4%     996847 =C2=B1  2%  interrupts.CPU74.LOC:L=
ocal_timer_interrupts
>       7727 =C2=B1 34%     -31.2%       5318 =C2=B1  4%  interrupts.CPU75.=
CAL:Function_call_interrupts
>    1137593           -12.7%     993539 =C2=B1  3%  interrupts.CPU75.LOC:L=
ocal_timer_interrupts
>    1137894           -12.7%     993146 =C2=B1  3%  interrupts.CPU76.LOC:L=
ocal_timer_interrupts
>     276.50 =C2=B1 76%     -83.0%      47.00 =C2=B1 62%  interrupts.CPU76.=
RES:Rescheduling_interrupts
>       6051 =C2=B1  7%     -12.3%       5308 =C2=B1  4%  interrupts.CPU77.=
CAL:Function_call_interrupts
>    1138121           -12.6%     994804 =C2=B1  3%  interrupts.CPU77.LOC:L=
ocal_timer_interrupts
>      61.75 =C2=B1 58%     -75.7%      15.00 =C2=B1 87%  interrupts.CPU77.=
TLB:TLB_shootdowns
>       8453 =C2=B1 48%     -37.2%       5312 =C2=B1  4%  interrupts.CPU78.=
CAL:Function_call_interrupts
>    1137647           -12.5%     995101 =C2=B1  2%  interrupts.CPU78.LOC:L=
ocal_timer_interrupts
>       6018 =C2=B1  8%     -11.8%       5308 =C2=B1  4%  interrupts.CPU79.=
CAL:Function_call_interrupts
>    1137522           -12.5%     995773 =C2=B1  2%  interrupts.CPU79.LOC:L=
ocal_timer_interrupts
>       5955 =C2=B1  7%     -11.1%       5295 =C2=B1  4%  interrupts.CPU8.C=
AL:Function_call_interrupts
>    1137722           -10.7%    1016421        interrupts.CPU8.LOC:Local_t=
imer_interrupts
>       6007 =C2=B1  7%     -11.7%       5303 =C2=B1  4%  interrupts.CPU80.=
CAL:Function_call_interrupts
>    1138055           -12.7%     993628 =C2=B1  3%  interrupts.CPU80.LOC:L=
ocal_timer_interrupts
>       6092 =C2=B1  9%     -13.0%       5302 =C2=B1  4%  interrupts.CPU81.=
CAL:Function_call_interrupts
>    1137644           -12.4%     996710 =C2=B1  2%  interrupts.CPU81.LOC:L=
ocal_timer_interrupts
>       5946 =C2=B1  7%     -10.9%       5297 =C2=B1  4%  interrupts.CPU82.=
CAL:Function_call_interrupts
>    1137703           -12.6%     994872 =C2=B1  2%  interrupts.CPU82.LOC:L=
ocal_timer_interrupts
>       5982 =C2=B1  7%     -11.5%       5296 =C2=B1  4%  interrupts.CPU83.=
CAL:Function_call_interrupts
>    1138254           -12.6%     994421 =C2=B1  3%  interrupts.CPU83.LOC:L=
ocal_timer_interrupts
>      50.00 =C2=B1 31%   +1010.7%     555.33 =C2=B1 79%  interrupts.CPU83.=
RES:Rescheduling_interrupts
>       6002 =C2=B1  8%     -11.8%       5296 =C2=B1  4%  interrupts.CPU84.=
CAL:Function_call_interrupts
>    1137779           -12.3%     997432 =C2=B1  2%  interrupts.CPU84.LOC:L=
ocal_timer_interrupts
>       5926 =C2=B1  7%     -12.5%       5185 =C2=B1  6%  interrupts.CPU85.=
CAL:Function_call_interrupts
>    1137833           -12.4%     996457 =C2=B1  2%  interrupts.CPU85.LOC:L=
ocal_timer_interrupts
>       5985 =C2=B1  7%     -11.1%       5318 =C2=B1  4%  interrupts.CPU86.=
CAL:Function_call_interrupts
>    1137602           -12.6%     994471 =C2=B1  3%  interrupts.CPU86.LOC:L=
ocal_timer_interrupts
>       5982 =C2=B1  8%     -11.6%       5291 =C2=B1  4%  interrupts.CPU87.=
CAL:Function_call_interrupts
>    1137704           -12.4%     996936 =C2=B1  2%  interrupts.CPU87.LOC:L=
ocal_timer_interrupts
>       5974 =C2=B1  8%     -13.3%       5179 =C2=B1  6%  interrupts.CPU88.=
CAL:Function_call_interrupts
>    1138067           -12.6%     994733 =C2=B1  3%  interrupts.CPU88.LOC:L=
ocal_timer_interrupts
>       5992 =C2=B1  8%     -11.7%       5291 =C2=B1  4%  interrupts.CPU89.=
CAL:Function_call_interrupts
>    1137896           -12.7%     993477 =C2=B1  3%  interrupts.CPU89.LOC:L=
ocal_timer_interrupts
>       1672 =C2=B1169%     -99.1%      15.00 =C2=B1141%  interrupts.CPU9.4=
5:PCI-MSI.31981578-edge.i40e-eth0-TxRx-9
>    1137990           -10.6%    1017158        interrupts.CPU9.LOC:Local_t=
imer_interrupts
>       5969 =C2=B1  7%     -11.6%       5279 =C2=B1  4%  interrupts.CPU90.=
CAL:Function_call_interrupts
>    1137857           -12.3%     998427 =C2=B1  2%  interrupts.CPU90.LOC:L=
ocal_timer_interrupts
>       6820 =C2=B1 26%     -22.7%       5273 =C2=B1  5%  interrupts.CPU91.=
CAL:Function_call_interrupts
>    1141483           -12.8%     995534 =C2=B1  2%  interrupts.CPU91.LOC:L=
ocal_timer_interrupts
>       5964 =C2=B1  7%     -11.5%       5278 =C2=B1  4%  interrupts.CPU92.=
CAL:Function_call_interrupts
>    1140985           -12.9%     993543 =C2=B1  3%  interrupts.CPU92.LOC:L=
ocal_timer_interrupts
>       5967 =C2=B1  7%     -11.8%       5265 =C2=B1  5%  interrupts.CPU93.=
CAL:Function_call_interrupts
>    1138445           -12.7%     993978 =C2=B1  3%  interrupts.CPU93.LOC:L=
ocal_timer_interrupts
>       6026 =C2=B1  6%     -12.6%       5264 =C2=B1  5%  interrupts.CPU94.=
CAL:Function_call_interrupts
>    1137854           -12.7%     993895 =C2=B1  3%  interrupts.CPU94.LOC:L=
ocal_timer_interrupts
>       6014 =C2=B1  6%     -13.9%       5177 =C2=B1  5%  interrupts.CPU95.=
CAL:Function_call_interrupts
>    1137645           -12.5%     995297 =C2=B1  2%  interrupts.CPU95.LOC:L=
ocal_timer_interrupts
>  1.093e+08           -11.6%   96587878        interrupts.LOC:Local_timer_=
interrupts
>      49537 =C2=B1 12%     -38.3%      30559 =C2=B1 13%  interrupts.RES:Re=
scheduling_interrupts
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp5: 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz with 19=
2G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> bs/compiler/cpufreq_governor/direct/disk/fs/ioengine/kconfig/nr_task/root=
fs/runtime/rw/tbox_group/test_size/testcase/ucode:
>   4k/gcc-7/performance/direct/1HDD/btrfs/sync/x86_64-rhel-7.6/1/debian-x8=
6_64-2019-11-14.cgz/300s/write/lkp-csl-2sp5/128G/fio-basic/0x500002c
> =

> commit: =

>   v5.4
>   c6bbf24815 ("btrfs: space-info: Make over-commit threshold to 87.5% of =
a new chunk")
> =

>             v5.4 c6bbf24815f95a4928984ff16a9 =

> ---------------- --------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>           1:7          -14%            :4     dmesg.WARNING:at_ip__fsnoti=
fy_parent/0x
>           2:7          -29%            :4     dmesg.WARNING:stack_recursi=
on
>          %stddev     %change         %stddev
>              \          |                \  =

>       0.71            -0.1        0.65 =C2=B1  5%  fio.latency_250us%
>       0.01            +0.0        0.03        fio.latency_4ms%
>      25.87            +2.6%      26.54 =C2=B1  2%  boot-time.boot
>      52.22 =C2=B1234%     -97.0%       1.59 =C2=B1141%  iostat.sdb.r_awai=
t.max
>     613.14 =C2=B1 42%     -96.2%      23.33 =C2=B1  2%  meminfo.Buffers
>     126222 =C2=B1 14%     -27.2%      91885 =C2=B1 12%  numa-meminfo.node=
0.SUnreclaim
>     165285 =C2=B1 11%     -20.2%     131864 =C2=B1 12%  numa-meminfo.node=
0.Slab
>     702.71 =C2=B1105%    +286.7%       2717 =C2=B1  9%  numa-meminfo.node=
1.Inactive(file)
>      63.86 =C2=B1  3%      -7.6%      59.00 =C2=B1  3%  turbostat.Avg_MHz
>       3.61 =C2=B1  6%      -0.5        3.14 =C2=B1  4%  turbostat.Busy%
>       0.85 =C2=B1 13%      -0.1        0.75 =C2=B1  2%  turbostat.C1%
>      66077 =C2=B1  2%      -4.9%      62834 =C2=B1  2%  vmstat.io.bo
>     610.71 =C2=B1 42%     -96.2%      23.00        vmstat.memory.buff
>      65832 =C2=B1  2%      -5.0%      62534 =C2=B1  2%  vmstat.system.cs
>      31522 =C2=B1 14%     -27.1%      22969 =C2=B1 12%  numa-vmstat.node0=
.nr_slab_unreclaimable
>     175.43 =C2=B1105%    +287.6%     680.00 =C2=B1  9%  numa-vmstat.node1=
.nr_inactive_file
>      13780 =C2=B1115%    +205.8%      42142 =C2=B1  5%  numa-vmstat.node1=
.nr_written
>     175.43 =C2=B1105%    +287.6%     680.00 =C2=B1  9%  numa-vmstat.node1=
.nr_zone_inactive_file
>     105921            -1.9%     103959        proc-vmstat.nr_inactive_anon
>     107849            -1.8%     105906        proc-vmstat.nr_mapped
>     107294            -1.8%     105341        proc-vmstat.nr_shmem
>      55166            -3.3%      53371        proc-vmstat.nr_slab_unrecla=
imable
>     105921            -1.9%     103959        proc-vmstat.nr_zone_inactiv=
e_anon
>    1402438            -3.8%    1349735        proc-vmstat.numa_hit
>    1371233            -3.8%    1318441        proc-vmstat.numa_local
>    1630186            -5.0%    1548152        proc-vmstat.pgalloc_normal
>     892627            +1.6%     906510        proc-vmstat.pgfault
>      61277 =C2=B1 26%     -27.5%      44445        softirqs.CPU0.SCHED
>      40467 =C2=B1  5%     +63.9%      66317 =C2=B1 23%  softirqs.CPU1.SCH=
ED
>      39555 =C2=B1  5%      -7.4%      36631 =C2=B1  2%  softirqs.CPU17.SC=
HED
>       8013 =C2=B1100%    +326.6%      34184 =C2=B1 56%  softirqs.CPU33.BL=
OCK
>      39730 =C2=B1  3%     -12.5%      34771 =C2=B1  4%  softirqs.CPU63.SC=
HED
>     134029 =C2=B1 19%     -30.2%      93550 =C2=B1  3%  softirqs.CPU65.TI=
MER
>     133366 =C2=B1 19%     -30.5%      92690 =C2=B1  4%  softirqs.CPU69.TI=
MER
>       5725 =C2=B1196%   +1558.7%      94961 =C2=B1 73%  softirqs.CPU86.BL=
OCK
>     121838 =C2=B1 15%     +20.5%     146865        softirqs.CPU92.TIMER
>     116388 =C2=B1 17%     +25.8%     146433        softirqs.CPU93.TIMER
>     160639 =C2=B1 20%     +18.8%     190856 =C2=B1 10%  sched_debug.cfs_r=
q:/.load.stddev
>       4786 =C2=B1 13%     -20.7%       3796        sched_debug.cfs_rq:/.m=
in_vruntime.stddev
>       0.01 =C2=B1105%    +878.8%       0.09 =C2=B1 66%  sched_debug.cfs_r=
q:/.nr_spread_over.avg
>       0.05 =C2=B1100%    +300.1%       0.20 =C2=B1 54%  sched_debug.cfs_r=
q:/.nr_spread_over.stddev
>     160570 =C2=B1 20%     +18.8%     190812 =C2=B1 10%  sched_debug.cfs_r=
q:/.runnable_weight.stddev
>       4786 =C2=B1 13%     -20.6%       3799        sched_debug.cfs_rq:/.s=
pread0.stddev
>     181393            +9.8%     199237 =C2=B1  6%  sched_debug.cpu.clock.=
avg
>     181397            +9.8%     199240 =C2=B1  6%  sched_debug.cpu.clock.=
max
>     181389            +9.8%     199233 =C2=B1  6%  sched_debug.cpu.clock.=
min
>     181393            +9.8%     199237 =C2=B1  6%  sched_debug.cpu.clock_=
task.avg
>     181397            +9.8%     199240 =C2=B1  6%  sched_debug.cpu.clock_=
task.max
>     181389            +9.8%     199233 =C2=B1  6%  sched_debug.cpu.clock_=
task.min
>       0.00 =C2=B1 14%     -20.0%       0.00 =C2=B1 14%  sched_debug.cpu.n=
ext_balance.stddev
>     607253 =C2=B1 27%     -46.9%     322592 =C2=B1 17%  sched_debug.cpu.t=
twu_local.max
>      67736 =C2=B1 15%     -21.3%      53336 =C2=B1  4%  sched_debug.cpu.t=
twu_local.stddev
>     181390            +9.8%     199234 =C2=B1  6%  sched_debug.cpu_clk
>     178524           +10.0%     196362 =C2=B1  6%  sched_debug.ktime
>     181721            +9.8%     199581 =C2=B1  6%  sched_debug.sched_clk
>       5632            +9.9%       6191        slabinfo.Acpi-State.active_=
objs
>       5632            +9.9%       6191        slabinfo.Acpi-State.num_objs
>       5534 =C2=B1 16%     -27.6%       4009 =C2=B1  6%  slabinfo.avc_xper=
ms_data.active_objs
>       5534 =C2=B1 16%     -27.6%       4009 =C2=B1  6%  slabinfo.avc_xper=
ms_data.num_objs
>       5132 =C2=B1 24%     -72.7%       1402 =C2=B1  3%  slabinfo.blkdev_i=
oc.active_objs
>       5133 =C2=B1 24%     -72.7%       1402 =C2=B1  3%  slabinfo.blkdev_i=
oc.num_objs
>     294321           -10.3%     264046        slabinfo.btrfs_extent_map.a=
ctive_objs
>       5287           -10.8%       4717        slabinfo.btrfs_extent_map.a=
ctive_slabs
>     296114           -10.8%     264228        slabinfo.btrfs_extent_map.n=
um_objs
>       5287           -10.8%       4717        slabinfo.btrfs_extent_map.n=
um_slabs
>     791.00 =C2=B1 48%     +92.5%       1522 =C2=B1  7%  slabinfo.dio.acti=
ve_objs
>     791.00 =C2=B1 48%     +92.5%       1522 =C2=B1  7%  slabinfo.dio.num_=
objs
>      37938           -83.3%       6322 =C2=B1 12%  slabinfo.khugepaged_mm=
_slot.active_objs
>       1102           -83.6%     180.67 =C2=B1 11%  slabinfo.khugepaged_mm=
_slot.active_slabs
>      39703           -83.6%       6528 =C2=B1 11%  slabinfo.khugepaged_mm=
_slot.num_objs
>       1102           -83.6%     180.67 =C2=B1 11%  slabinfo.khugepaged_mm=
_slot.num_slabs
>       4110 =C2=B1  6%     +15.1%       4731 =C2=B1  6%  slabinfo.kmalloc-=
rcl-64.active_objs
>       4110 =C2=B1  6%     +15.1%       4731 =C2=B1  6%  slabinfo.kmalloc-=
rcl-64.num_objs
>       2179 =C2=B1 19%     +49.5%       3258 =C2=B1 18%  slabinfo.mnt_cach=
e.active_objs
>       2347 =C2=B1 17%     +41.2%       3314 =C2=B1 16%  slabinfo.mnt_cach=
e.num_objs
>      11.74 =C2=B1 41%     -42.3%       6.78 =C2=B1 18%  perf-stat.i.MPKI
>    7818641 =C2=B1 25%     -30.9%    5404611 =C2=B1  9%  perf-stat.i.branc=
h-misses
>   33116824 =C2=B1 36%     -43.9%   18563518 =C2=B1  5%  perf-stat.i.cache=
-references
>      66775 =C2=B1  2%      -5.0%      63430 =C2=B1  2%  perf-stat.i.conte=
xt-switches
>  5.239e+09 =C2=B1  4%      -7.2%  4.861e+09 =C2=B1  4%  perf-stat.i.cpu-c=
ycles
>       0.08 =C2=B1 45%      -0.1        0.01 =C2=B1111%  perf-stat.i.dTLB-=
load-miss-rate%
>     602366 =C2=B1 43%     -90.5%      57285 =C2=B1 84%  perf-stat.i.dTLB-=
load-misses
>       0.02 =C2=B1 43%      -0.0        0.00 =C2=B1 85%  perf-stat.i.dTLB-=
store-miss-rate%
>      92649 =C2=B1 41%     -85.9%      13098 =C2=B1 48%  perf-stat.i.dTLB-=
store-misses
>       0.59 =C2=B1  4%      +6.0%       0.63 =C2=B1  4%  perf-stat.i.ipc
>      48349 =C2=B1 14%     -33.4%      32207 =C2=B1  6%  perf-stat.i.node-=
loads
>      41360 =C2=B1 22%     -50.5%      20490 =C2=B1 12%  perf-stat.i.node-=
stores
>      10.73 =C2=B1 39%     -43.4%       6.08 =C2=B1  5%  perf-stat.overall=
.MPKI
>       0.07 =C2=B1 45%      -0.1        0.01 =C2=B1 85%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.02 =C2=B1 43%      -0.0        0.00 =C2=B1 50%  perf-stat.overall=
.dTLB-store-miss-rate%
>      81.49 =C2=B1 13%     +11.8       93.29        perf-stat.overall.node=
-load-miss-rate%
>    7792742 =C2=B1 25%     -30.9%    5386905 =C2=B1  9%  perf-stat.ps.bran=
ch-misses
>   33006764 =C2=B1 36%     -43.9%   18503075 =C2=B1  5%  perf-stat.ps.cach=
e-references
>      66549 =C2=B1  2%      -5.0%      63217 =C2=B1  2%  perf-stat.ps.cont=
ext-switches
>  5.222e+09 =C2=B1  4%      -7.2%  4.845e+09 =C2=B1  4%  perf-stat.ps.cpu-=
cycles
>     600392 =C2=B1 43%     -90.5%      57131 =C2=B1 84%  perf-stat.ps.dTLB=
-load-misses
>      92345 =C2=B1 41%     -85.9%      13061 =C2=B1 48%  perf-stat.ps.dTLB=
-store-misses
>      48187 =C2=B1 14%     -33.4%      32102 =C2=B1  6%  perf-stat.ps.node=
-loads
>      41222 =C2=B1 22%     -50.5%      20424 =C2=B1 12%  perf-stat.ps.node=
-stores
>      49.32 =C2=B1  3%      -3.8       45.52 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_st=
artup_entry
>       1.11 =C2=B1  6%      -0.2        0.95 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_inter=
rupt.smp_apic_timer_interrupt.apic_timer_interrupt
>       0.73 =C2=B1 15%      +0.2        0.95 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.btrfs_create_dio_extent.btrfs_get_blocks_direct.do_blockdev=
_direct_IO.btrfs_direct_IO.generic_file_direct_write
>       0.17 =C2=B1158%      +0.4        0.61 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__blk_mq_delay_run_hw_queue.blk_mq_run_hw_queue.blk_mq_sche=
d_insert_requests.blk_mq_flush_plug_list.blk_flush_plug_list
>       0.18 =C2=B1158%      +0.5        0.65 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.blk_mq_run_hw_queue.blk_mq_sched_insert_requests.blk_mq_flu=
sh_plug_list.blk_flush_plug_list.blk_finish_plug
>       3.54 =C2=B1 17%      +2.2        5.72 =C2=B1 34%  perf-profile.call=
trace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.do_idle.cpu_sta=
rtup_entry
>      49.56 =C2=B1  3%      -3.8       45.71 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.intel_idle
>       1.14 =C2=B1  7%      -0.1        0.99 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.perf_mux_hrtimer_handler
>       0.33 =C2=B1  4%      -0.1        0.27 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__intel_pmu_enable_all
>       0.24 =C2=B1 22%      -0.0        0.19 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.interrupt_entry
>       0.19 =C2=B1 11%      -0.0        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.nr_iowait_cpu
>       0.08 =C2=B1 23%      +0.0        0.10 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.04 =C2=B1 64%      +0.0        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.alloc_extent_map
>       0.08 =C2=B1 17%      +0.0        0.12        perf-profile.children.=
cycles-pp.btrfs_tree_lock
>       0.12 =C2=B1 14%      +0.0        0.16 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.btrfs_lock_root_node
>       0.06 =C2=B1 19%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.start_transaction
>       0.19 =C2=B1 25%      +0.0        0.23 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.generic_make_request
>       0.01 =C2=B1244%      +0.0        0.06 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.join_transaction
>       0.14 =C2=B1 13%      +0.0        0.19 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.leaf_space_used
>       0.01 =C2=B1244%      +0.1        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.fill_stack_inode_item
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.btrfs_dec_block_group_reservations
>       0.02 =C2=B1118%      +0.1        0.10 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.blk_mq_get_tag
>       0.41 =C2=B1 13%      +0.1        0.53 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.btrfs_lookup_file_extent
>       0.45 =C2=B1 22%      +0.2        0.61 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__blk_mq_delay_run_hw_queue
>       0.45 =C2=B1 22%      +0.2        0.61 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.blk_mq_sched_dispatch_requests
>       0.45 =C2=B1 22%      +0.2        0.61 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__blk_mq_run_hw_queue
>       0.43 =C2=B1 20%      +0.2        0.60 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.blk_mq_do_dispatch_sched
>       0.50 =C2=B1 21%      +0.2        0.69 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.blk_mq_run_hw_queue
>       0.73 =C2=B1 15%      +0.2        0.95 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.btrfs_create_dio_extent
>       3.56 =C2=B1 17%      +2.2        5.78 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.poll_idle
>      49.50 =C2=B1  3%      -3.8       45.70 =C2=B1  2%  perf-profile.self=
.cycles-pp.intel_idle
>       0.23 =C2=B1 19%      -0.0        0.19 =C2=B1  2%  perf-profile.self=
.cycles-pp.interrupt_entry
>       0.18 =C2=B1 12%      -0.0        0.15 =C2=B1  6%  perf-profile.self=
.cycles-pp.nr_iowait_cpu
>       0.05 =C2=B1 44%      +0.0        0.08 =C2=B1 16%  perf-profile.self=
.cycles-pp.unlock_up
>       0.03 =C2=B1 87%      +0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.__account_scheduler_latency
>       0.03 =C2=B1 87%      +0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.free_extent_state
>       3.20 =C2=B1 19%      +2.1        5.33 =C2=B1 35%  perf-profile.self=
.cycles-pp.poll_idle
>       4.29 =C2=B1209%   +2785.6%     123.67 =C2=B1113%  interrupts.70:PCI=
-MSI.31981603-edge.i40e-eth0-TxRx-34
>     173.71 =C2=B1158%    +256.1%     618.67        interrupts.9:IO-APIC.9=
-fasteoi.acpi
>     173.71 =C2=B1158%    +256.1%     618.67        interrupts.CPU1.9:IO-A=
PIC.9-fasteoi.acpi
>       1485 =C2=B1119%   +3809.6%      58057 =C2=B1 54%  interrupts.CPU1.R=
ES:Rescheduling_interrupts
>      99.57 =C2=B1236%  +15984.3%      16015 =C2=B1122%  interrupts.CPU13.=
RES:Rescheduling_interrupts
>     166.86 =C2=B1 12%     +70.0%     283.67 =C2=B1 37%  interrupts.CPU23.=
NMI:Non-maskable_interrupts
>     166.86 =C2=B1 12%     +70.0%     283.67 =C2=B1 37%  interrupts.CPU23.=
PMI:Performance_monitoring_interrupts
>     484.29 =C2=B1 92%     -68.1%     154.33 =C2=B1 43%  interrupts.CPU25.=
NMI:Non-maskable_interrupts
>     484.29 =C2=B1 92%     -68.1%     154.33 =C2=B1 43%  interrupts.CPU25.=
PMI:Performance_monitoring_interrupts
>      19154 =C2=B1 83%    +275.2%      71861 =C2=B1 53%  interrupts.CPU33.=
CAL:Function_call_interrupts
>       4.14 =C2=B1216%   +2869.0%     123.00 =C2=B1114%  interrupts.CPU34.=
70:PCI-MSI.31981603-edge.i40e-eth0-TxRx-34
>      42.71 =C2=B1203%    +877.0%     417.33 =C2=B1 66%  interrupts.CPU35.=
RES:Rescheduling_interrupts
>     221.71 =C2=B1 23%     -42.9%     126.67 =C2=B1 11%  interrupts.CPU39.=
NMI:Non-maskable_interrupts
>     221.71 =C2=B1 23%     -42.9%     126.67 =C2=B1 11%  interrupts.CPU39.=
PMI:Performance_monitoring_interrupts
>     339.43 =C2=B1 75%     -66.8%     112.67 =C2=B1  5%  interrupts.CPU41.=
NMI:Non-maskable_interrupts
>     339.43 =C2=B1 75%     -66.8%     112.67 =C2=B1  5%  interrupts.CPU41.=
PMI:Performance_monitoring_interrupts
>     458.86 =C2=B1133%     -73.6%     121.33 =C2=B1  8%  interrupts.CPU42.=
NMI:Non-maskable_interrupts
>     458.86 =C2=B1133%     -73.6%     121.33 =C2=B1  8%  interrupts.CPU42.=
PMI:Performance_monitoring_interrupts
>     302.43 =C2=B1 66%     -59.5%     122.33 =C2=B1  7%  interrupts.CPU43.=
NMI:Non-maskable_interrupts
>     302.43 =C2=B1 66%     -59.5%     122.33 =C2=B1  7%  interrupts.CPU43.=
PMI:Performance_monitoring_interrupts
>     237.57 =C2=B1 29%     -49.9%     119.00 =C2=B1 12%  interrupts.CPU44.=
NMI:Non-maskable_interrupts
>     237.57 =C2=B1 29%     -49.9%     119.00 =C2=B1 12%  interrupts.CPU44.=
PMI:Performance_monitoring_interrupts
>     216.29 =C2=B1 22%     -50.5%     107.00 =C2=B1  4%  interrupts.CPU45.=
NMI:Non-maskable_interrupts
>     216.29 =C2=B1 22%     -50.5%     107.00 =C2=B1  4%  interrupts.CPU45.=
PMI:Performance_monitoring_interrupts
>     218.29 =C2=B1 27%     -44.0%     122.33 =C2=B1 11%  interrupts.CPU46.=
NMI:Non-maskable_interrupts
>     218.29 =C2=B1 27%     -44.0%     122.33 =C2=B1 11%  interrupts.CPU46.=
PMI:Performance_monitoring_interrupts
>     223.14 =C2=B1 21%     -51.2%     109.00 =C2=B1  7%  interrupts.CPU47.=
NMI:Non-maskable_interrupts
>     223.14 =C2=B1 21%     -51.2%     109.00 =C2=B1  7%  interrupts.CPU47.=
PMI:Performance_monitoring_interrupts
>     348.71 =C2=B1153%     -94.2%      20.33 =C2=B1 61%  interrupts.CPU47.=
RES:Rescheduling_interrupts
>       1172 =C2=B1122%     -88.8%     131.00 =C2=B1140%  interrupts.CPU48.=
RES:Rescheduling_interrupts
>     324.71 =C2=B1102%     -57.6%     137.67 =C2=B1 25%  interrupts.CPU53.=
NMI:Non-maskable_interrupts
>     324.71 =C2=B1102%     -57.6%     137.67 =C2=B1 25%  interrupts.CPU53.=
PMI:Performance_monitoring_interrupts
>     705.14 =C2=B1241%    -100.0%       0.33 =C2=B1141%  interrupts.CPU64.=
RES:Rescheduling_interrupts
>      68.29 =C2=B1 46%     -57.5%      29.00 =C2=B1 30%  interrupts.CPU65.=
TLB:TLB_shootdowns
>     160.86 =C2=B1 25%     +91.1%     307.33 =C2=B1 28%  interrupts.CPU71.=
NMI:Non-maskable_interrupts
>     160.86 =C2=B1 25%     +91.1%     307.33 =C2=B1 28%  interrupts.CPU71.=
PMI:Performance_monitoring_interrupts
>       6.29 =C2=B1101%   +1411.4%      95.00 =C2=B1104%  interrupts.CPU71.=
RES:Rescheduling_interrupts
>       8200 =C2=B1 91%   +1836.1%     158759 =C2=B1 71%  interrupts.CPU85.=
CAL:Function_call_interrupts
>      14581 =C2=B1154%   +1226.5%     193422 =C2=B1 72%  interrupts.CPU86.=
CAL:Function_call_interrupts
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
>=20

--===============2121479835343299410==--

