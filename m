Content-Type: multipart/mixed; boundary="===============8883074801367594711=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 81a779a1a4: will-it-scale.per_thread_ops -4.2% regression
Date: Thu, 25 Mar 2021 14:47:20 +0800
Message-ID: <20210325064720.GB13061@xsang-OptiPlex-9020>
In-Reply-To: <YFcniHqC0Lmet8/3@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8883074801367594711==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Sun, Mar 21, 2021 at 01:01:28PM +0200, Mike Rapoport wrote:
> Hi Oliver,
> =

> On Fri, Mar 19, 2021 at 08:51:38PM +0800, Oliver Sang wrote:
> > Hi Hike,
> > =

> > On Fri, Mar 12, 2021 at 06:56:01AM +0200, Mike Rapoport wrote:
> > > Hello,
> > > =

> > > On Wed, Mar 10, 2021 at 09:54:26AM +0800, kernel test robot wrote:
> > > > =

> > > > Greeting,
> > > > =

> > > > FYI, we noticed a -4.2% regression of will-it-scale.per_thread_ops =
due to commit:
> > > > =

> > > > =

> > > > commit: 81a779a1a49c8644fd8dc994815a9aa379d10825 ("mm: introduce me=
mfd_secret system call to create "secret" memory areas")
> > > > https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git memfd-s=
ecret/v18
> > > > =

> > > > =

> > > > in testcase: will-it-scale
> > > > on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2=
.30GHz with 192G memory
> > > > with following parameters:
> > > > =

> > > > 	nr_task: 100%
> > > > 	mode: thread
> > > > 	test: futex1
> > > > 	cpufreq_governor: performance
> > > > 	ucode: 0x5003006
> > > > =

> > > > test-description: Will It Scale takes a testcase and runs it from 1=
 through to n parallel copies to see if the testcase will scale. It builds =
both a process and threads based test in order to see any differences betwe=
en the two.
> > > > test-url: https://github.com/antonblanchard/will-it-scale
> > > > =

> > > > =

> > > > =

> > > > If you fix the issue, kindly add following tag
> > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > =

> > > Can you please test the following patch on top of commit: 81a779a1a49c
> > > ("mm: introduce memfd_secret system call to create "secret" memory ar=
eas")
> > > to see if it performs better:
> > =

> > it performs a little better but still has -3.7% regression:
> > =

> > * e9be99d574c74 (linux-devel/fixup-81a779a1a49c) fix-81a779a1a49c-perf
> > * 81a779a1a49c8 mm: introduce memfd_secret system call to create "secre=
t" memory areas
> > * 043463bfe80b8 set_memory: allow querying whether set_direct_map_*() i=
s actually enabled
> =

> Can you please retest with the below patch instead of the previous one:

by below patch, the regression reduced to around -1.7%
(please be noted, according to our experience, will-it-scale is normally se=
nsitive
to code change as well as test environment, so, at least currently, we don'=
t report
will-it-scale performance changes if it's less than 3%)


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/100%/debian-10.4-x86_64-20200603=
.cgz/lkp-csl-2ap2/futex1/will-it-scale/0x5003006

commit: =

  043463bfe8 ("set_memory: allow querying whether set_direct_map_*() is act=
ually enabled")
  81a779a1a4 ("mm: introduce memfd_secret system call to create "secret" me=
mory areas")
  ba37d58239 ("[v2] fix 81a779a1a49c from Mike")

043463bfe80b838b 81a779a1a49c8644fd8dc994815 ba37d58239a8d10c3f0b8df1cf8 =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

 6.646e+08            -4.2%  6.367e+08            -1.7%  6.536e+08        w=
ill-it-scale.192.threads
      0.09            +1.9%       0.09 =C2=B1  4%      +3.7%       0.09 =C2=
=B1  5%  will-it-scale.192.threads_idle
   3461642            -4.2%    3316208            -1.7%    3404075        w=
ill-it-scale.per_thread_ops
    301.42            -0.0%     301.38            +0.0%     301.43        w=
ill-it-scale.time.elapsed_time
    301.42            -0.0%     301.38            +0.0%     301.43        w=
ill-it-scale.time.elapsed_time.max
      2.50 =C2=B1 20%     -26.7%       1.83 =C2=B1 37%     -40.0%       1.5=
0 =C2=B1 63%  will-it-scale.time.involuntary_context_switches
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    +200.0%       1.0=
0 =C2=B1115%  will-it-scale.time.major_page_faults
      9731            -0.4%       9695            -0.0%       9730        w=
ill-it-scale.time.maximum_resident_set_size
      6505            -0.2%       6493            -0.0%       6502        w=
ill-it-scale.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        w=
ill-it-scale.time.page_size
      0.03 =C2=B1 19%      +0.0%       0.03 =C2=B1 19%     -13.3%       0.0=
2 =C2=B1 17%  will-it-scale.time.system_time
      0.04 =C2=B1 14%     -14.3%       0.03            +0.0%       0.04 =C2=
=B1 14%  will-it-scale.time.user_time
     83.50            +2.4%      85.50            +3.2%      86.17 =C2=B1  =
2%  will-it-scale.time.voluntary_context_switches
 6.646e+08            -4.2%  6.367e+08            -1.7%  6.536e+08        w=
ill-it-scale.workload
    341.57            -0.1%     341.27            +0.4%     342.77        u=
ptime.boot
      6452 =C2=B1  3%      -2.3%       6304 =C2=B1  7%      +7.6%       694=
4 =C2=B1  6%  uptime.idle
     37.75 =C2=B1  4%      -0.5%      37.56 =C2=B1  6%      +3.4%      39.0=
1 =C2=B1  3%  boot-time.boot
     25.37 =C2=B1  7%      -0.5%      25.25 =C2=B1  7%      +3.4%      26.2=
4        boot-time.dhcp
      5724 =C2=B1  5%      -1.6%       5634 =C2=B1  6%      +8.9%       623=
4 =C2=B1  8%  boot-time.idle
      1.72            +0.0%       1.72            -0.0%       1.72        b=
oot-time.smp_boot
      7.08 =C2=B1  2%      +0.0        7.09 =C2=B1  2%      +0.2        7.3=
2 =C2=B1  2%  mpstat.cpu.all.idle%
      0.00 =C2=B1223%      +0.0        0.00 =C2=B1181%      +0.0        0.0=
0 =C2=B1136%  mpstat.cpu.all.iowait%
      1.07 =C2=B1  4%      -0.0        1.05 =C2=B1  6%      -0.0        1.0=
6        mpstat.cpu.all.irq%
      0.01 =C2=B1  2%      -0.0        0.01 =C2=B1  2%      -0.0        0.0=
1 =C2=B1  7%  mpstat.cpu.all.soft%
     75.10            +0.6       75.74            +0.1       75.17        m=
pstat.cpu.all.sys%
     16.73            -0.6       16.11            -0.3       16.44        m=
pstat.cpu.all.usr%
   2638413 =C2=B1 38%     -24.3%    1998116 =C2=B1 19%     +38.8%    366174=
8 =C2=B1 60%  cpuidle.C1.time
     14334 =C2=B1  6%      -2.2%      14020 =C2=B1 18%    +241.7%      4897=
3 =C2=B1103%  cpuidle.C1.usage
 1.989e+08 =C2=B1 67%     -13.3%  1.724e+08 =C2=B1 69%     -12.1%  1.748e+0=
8 =C2=B1 58%  cpuidle.C1E.time
    459733 =C2=B1 55%      +6.2%     488139 =C2=B1 29%     -14.6%     39277=
3 =C2=B1 57%  cpuidle.C1E.usage
 1.683e+08 =C2=B1 85%      +6.4%   1.79e+08 =C2=B1 66%      +1.3%  1.705e+0=
8 =C2=B1 58%  cpuidle.C6.time
    306368 =C2=B1 49%      +3.1%     315917 =C2=B1 45%      +5.1%     32187=
2 =C2=B1 40%  cpuidle.C6.usage
     48603 =C2=B1131%     -63.6%      17706 =C2=B1  9%     -34.0%      3209=
2 =C2=B1 58%  cpuidle.POLL.time
      7131 =C2=B1 92%     -40.4%       4249 =C2=B1 13%     -30.2%       497=
8 =C2=B1 17%  cpuidle.POLL.usage
    301.42            -0.0%     301.38            +0.0%     301.43        t=
ime.elapsed_time
    301.42            -0.0%     301.38            +0.0%     301.43        t=
ime.elapsed_time.max
      2.50 =C2=B1 20%     -26.7%       1.83 =C2=B1 37%     -40.0%       1.5=
0 =C2=B1 63%  time.involuntary_context_switches
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    +200.0%       1.0=
0 =C2=B1115%  time.major_page_faults
      9731            -0.4%       9695            -0.0%       9730        t=
ime.maximum_resident_set_size
      6505            -0.2%       6493            -0.0%       6502        t=
ime.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        t=
ime.page_size
      0.03 =C2=B1 19%      +0.0%       0.03 =C2=B1 19%     -13.3%       0.0=
2 =C2=B1 17%  time.system_time
      0.04 =C2=B1 14%     -14.3%       0.03            +0.0%       0.04 =C2=
=B1 14%  time.user_time
     83.50            +2.4%      85.50            +3.2%      86.17 =C2=B1  =
2%  time.voluntary_context_switches
      0.17 =C2=B1223%    -100.0%       0.00          +100.0%       0.33 =C2=
=B1141%  vmstat.cpu.id
     80.83            +1.2%      81.83            +0.0%      80.83        v=
mstat.cpu.sy
     17.00            -4.9%      16.17 =C2=B1  2%      +0.0%      17.00    =
    vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.cpu.wa
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.io.bi
   1803056            +0.2%    1806427            +0.5%    1811202        v=
mstat.memory.cache
 1.938e+08            +0.0%  1.939e+08            -0.0%  1.938e+08        v=
mstat.memory.free
    190.00            +0.0%     190.00            +0.1%     190.17        v=
mstat.procs.r
      2128            -0.1%       2126            -0.2%       2123 =C2=B1  =
2%  vmstat.system.cs
    368851 =C2=B1 15%      +7.2%     395313            +6.8%     394025    =
    vmstat.system.in
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node0.interleave_hit
    222158 =C2=B1 20%      -4.0%     213280 =C2=B1  4%      +2.1%     22684=
5 =C2=B1 17%  numa-numastat.node0.local_node
    302433 =C2=B1 12%      -3.9%     290488 =C2=B1  2%      -4.2%     28966=
3 =C2=B1  4%  numa-numastat.node0.numa_hit
     80276 =C2=B1 10%      -3.8%      77208 =C2=B1 11%     -21.7%      6282=
6 =C2=B1 44%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node1.interleave_hit
    250553 =C2=B1 20%      -5.4%     237115 =C2=B1 20%      -4.7%     23879=
0 =C2=B1 16%  numa-numastat.node1.local_node
    300047 =C2=B1  7%      -0.7%     297991 =C2=B1  7%      -0.4%     29874=
3 =C2=B1  4%  numa-numastat.node1.numa_hit
     49503 =C2=B1 63%     +23.0%      60882 =C2=B1 50%     +21.1%      5996=
6 =C2=B1 49%  numa-numastat.node1.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node2.interleave_hit
    232597 =C2=B1 19%      -8.2%     213623 =C2=B1 15%      -3.8%     22372=
6 =C2=B1 15%  numa-numastat.node2.local_node
    293458 =C2=B1  4%      -2.6%     285768 =C2=B1  3%      -0.9%     29075=
4 =C2=B1  3%  numa-numastat.node2.numa_hit
     60874 =C2=B1 50%     +18.5%      72155 =C2=B1 34%     +10.1%      6703=
8 =C2=B1 36%  numa-numastat.node2.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node3.interleave_hit
    394406 =C2=B1 16%     +10.1%     434203 =C2=B1 12%      +7.2%     42262=
6 =C2=B1  4%  numa-numastat.node3.local_node
    463448 =C2=B1 10%      +4.4%     483694 =C2=B1  4%      +6.1%     49170=
3        numa-numastat.node3.numa_hit
     69045 =C2=B1 34%     -28.3%      49505 =C2=B1 75%      +0.1%      6908=
1 =C2=B1 27%  numa-numastat.node3.other_node
    425622            +0.6%     428239            +1.7%     432891        m=
eminfo.Active
    425622            +0.6%     428239            +1.7%     432891        m=
eminfo.Active(anon)
    278244            -1.0%     275505            -1.2%     274912        m=
eminfo.AnonHugePages
    430291            -0.3%     429140            +0.3%     431793        m=
eminfo.AnonPages
   1669221            +0.2%    1672709            +0.5%    1677014        m=
eminfo.Cached
    189912            +0.0%     189912            +0.0%     189912        m=
eminfo.CmaFree
    204800            +0.0%     204800            +0.0%     204800        m=
eminfo.CmaTotal
  98857496            -0.0%   98857492            -0.0%   98857492        m=
eminfo.CommitLimit
   2497691            +0.1%    2499688            +0.4%    2507664        m=
eminfo.Committed_AS
  1.88e+08            +0.3%  1.886e+08            -0.3%  1.875e+08        m=
eminfo.DirectMap1G
  13603157 =C2=B1  5%      -4.0%   13065557 =C2=B1  5%      +4.6%   1422404=
2 =C2=B1  5%  meminfo.DirectMap2M
   1460309 =C2=B1  4%      +0.9%    1473621 =C2=B1  4%      -6.6%    136371=
2 =C2=B1  5%  meminfo.DirectMap4k
      2048            +0.0%       2048            +0.0%       2048        m=
eminfo.Hugepagesize
    491903            -0.0%     491716            +0.4%     493824        m=
eminfo.Inactive
    491903            -0.0%     491716            +0.4%     493824        m=
eminfo.Inactive(anon)
    133300            +0.2%     133585            +0.5%     133934        m=
eminfo.KReclaimable
     32439            +0.2%      32502            -0.6%      32252        m=
eminfo.KernelStack
    106397 =C2=B1  6%      +1.0%     107443 =C2=B1  3%      +0.2%     10664=
5 =C2=B1  3%  meminfo.Mapped
 1.931e+08            +0.0%  1.932e+08            -0.0%  1.931e+08        m=
eminfo.MemAvailable
 1.938e+08            +0.0%  1.939e+08            -0.0%  1.938e+08        m=
eminfo.MemFree
 1.977e+08            -0.0%  1.977e+08            -0.0%  1.977e+08        m=
eminfo.MemTotal
   3908658            -1.2%    3860836            +0.4%    3923075        m=
eminfo.Memused
      1153 =C2=B1 70%     -49.9%     577.50 =C2=B1141%     +50.1%       173=
1        meminfo.Mlocked
      6289 =C2=B1  2%      -0.6%       6250 =C2=B1  2%      +1.3%       637=
4 =C2=B1  2%  meminfo.PageTables
    103001            +0.2%     103161            +0.7%     103673        m=
eminfo.Percpu
    133300            +0.2%     133585            +0.5%     133934        m=
eminfo.SReclaimable
    294723            +0.2%     295285 =C2=B1  2%      +0.3%     295616    =
    meminfo.SUnreclaim
    487695 =C2=B1  2%      +0.7%     491184            +1.6%     495435    =
    meminfo.Shmem
    428024            +0.2%     428871            +0.4%     429551        m=
eminfo.Slab
   1181692            -0.0%    1181608            +0.0%    1181829        m=
eminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        m=
eminfo.VmallocTotal
    315332            -0.1%     314993            +0.0%     315408        m=
eminfo.VmallocUsed
   4779774            -0.8%    4739187 =C2=B1  2%      +0.7%    4815603    =
    meminfo.max_used_kB
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.compact_isolated
    106385            +0.7%     107144            +1.6%     108103        p=
roc-vmstat.nr_active_anon
    107676            -0.3%     107367            +0.4%     108088        p=
roc-vmstat.nr_anon_pages
    135.50            -1.0%     134.17            -1.0%     134.17        p=
roc-vmstat.nr_anon_transparent_hugepages
   4819784            +0.0%    4820986            -0.0%    4819416        p=
roc-vmstat.nr_dirty_background_threshold
   9651353            +0.0%    9653760            -0.0%    9650617        p=
roc-vmstat.nr_dirty_threshold
    417279            +0.2%     418090            +0.4%     419094        p=
roc-vmstat.nr_file_pages
     47478            +0.0%      47478            +0.0%      47478        p=
roc-vmstat.nr_free_cma
  48451330            +0.0%   48463367            -0.0%   48447645        p=
roc-vmstat.nr_free_pages
    123072            -0.2%     122836            +0.4%     123554        p=
roc-vmstat.nr_inactive_anon
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +200.0%       0.5=
0 =C2=B1223%  proc-vmstat.nr_isolated_anon
     32446            +0.2%      32503            -0.6%      32262        p=
roc-vmstat.nr_kernel_stack
     26576 =C2=B1  5%      +0.8%      26775 =C2=B1  3%      +0.5%      2671=
1 =C2=B1  3%  proc-vmstat.nr_mapped
    288.17 =C2=B1 70%     -50.0%     144.00 =C2=B1141%     +50.0%     432.1=
7        proc-vmstat.nr_mlock
      1572 =C2=B1  2%      -0.7%       1561 =C2=B1  2%      +1.4%       159=
3 =C2=B1  2%  proc-vmstat.nr_page_table_pages
    121898 =C2=B1  2%      +0.7%     122709            +1.5%     123699    =
    proc-vmstat.nr_shmem
     33325            +0.2%      33396            +0.5%      33482        p=
roc-vmstat.nr_slab_reclaimable
     73681            +0.2%      73822 =C2=B1  2%      +0.3%      73906    =
    proc-vmstat.nr_slab_unreclaimable
    295423            -0.0%     295401            +0.0%     295457        p=
roc-vmstat.nr_unevictable
    106385            +0.7%     107144            +1.6%     108103        p=
roc-vmstat.nr_zone_active_anon
    123072            -0.2%     122836            +0.4%     123554        p=
roc-vmstat.nr_zone_inactive_anon
    295423            -0.0%     295401            +0.0%     295457        p=
roc-vmstat.nr_zone_unevictable
     31372 =C2=B1 11%     +11.2%      34899 =C2=B1  7%     +11.4%      3496=
4 =C2=B1  7%  proc-vmstat.numa_hint_faults
     29707 =C2=B1 10%     +10.9%      32937 =C2=B1  8%      +1.8%      3024=
1 =C2=B1 14%  proc-vmstat.numa_hint_faults_local
   1395571            +0.2%    1398636            +1.0%    1408901        p=
roc-vmstat.numa_hit
    408.50 =C2=B1  8%      +6.4%     434.50 =C2=B1  5%      -0.3%     407.1=
7 =C2=B1  7%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.numa_interleave
   1135859            +0.3%    1138874            +1.2%    1149975        p=
roc-vmstat.numa_local
    259712            +0.0%     259762            -0.3%     258926        p=
roc-vmstat.numa_other
     15734 =C2=B1 80%      -5.3%      14907 =C2=B1111%      +8.5%      1706=
8 =C2=B1 84%  proc-vmstat.numa_pages_migrated
    419338 =C2=B1  4%      +2.7%     430486 =C2=B1  3%      +1.1%     42376=
6 =C2=B1  4%  proc-vmstat.numa_pte_updates
    171894 =C2=B1  2%      +0.6%     172952            +2.2%     175648    =
    proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma32
   1525449            -0.1%    1524042            +0.6%    1533927        p=
roc-vmstat.pgalloc_normal
   1359120            +0.2%    1362055            +0.8%    1369703        p=
roc-vmstat.pgfault
   1388637 =C2=B1  5%      -1.8%    1364025 =C2=B1  6%      +1.9%    141470=
1 =C2=B1  4%  proc-vmstat.pgfree
     15734 =C2=B1 80%      -5.3%      14907 =C2=B1111%      +8.5%      1706=
8 =C2=B1 84%  proc-vmstat.pgmigrate_success
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgpgin
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgpgout
     64986            -0.8%      64485            -0.4%      64709        p=
roc-vmstat.pgreuse
    149.83            +0.7%     150.83 =C2=B1  2%      +0.0%     149.83    =
    proc-vmstat.thp_collapse_alloc
      9.00 =C2=B1141%      +0.0%       9.00 =C2=B1141%     -50.0%       4.5=
0 =C2=B1223%  proc-vmstat.thp_deferred_split_page
     57.00            +0.6%      57.33            +0.0%      57.00        p=
roc-vmstat.thp_fault_alloc
      9.00 =C2=B1141%      +0.0%       9.00 =C2=B1141%     -50.0%       4.5=
0 =C2=B1223%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.thp_zero_page_alloc
     82.00 =C2=B1 49%     -35.2%      53.17 =C2=B1 76%     +92.9%     158.1=
7 =C2=B1 67%  proc-vmstat.unevictable_pgs_culled
    390.67 =C2=B1 70%     -50.0%     195.33 =C2=B1141%     +50.0%     586.0=
0        proc-vmstat.unevictable_pgs_mlocked
      0.03 =C2=B1 23%     +20.0%       0.04 =C2=B1 25%     +15.1%       0.0=
4 =C2=B1 28%  perf-stat.i.MPKI
 9.582e+10            +0.9%  9.666e+10            -0.4%  9.543e+10        p=
erf-stat.i.branch-instructions
      0.20            -0.0        0.19            -0.0        0.20        p=
erf-stat.i.branch-miss-rate%
 1.852e+08            -5.3%  1.754e+08            -0.9%  1.836e+08        p=
erf-stat.i.branch-misses
     15.60 =C2=B1  3%      -0.6       15.04            -0.3       15.33 =C2=
=B1  3%  perf-stat.i.cache-miss-rate%
   1235422 =C2=B1  5%      -1.2%    1220958 =C2=B1  4%      -0.7%    122651=
4 =C2=B1  4%  perf-stat.i.cache-misses
   7939113 =C2=B1  3%      +2.5%    8136349 =C2=B1  6%      +1.7%    807115=
6 =C2=B1  5%  perf-stat.i.cache-references
      2078            -0.2%       2073            -0.2%       2073 =C2=B1  =
2%  perf-stat.i.context-switches
      0.90            +0.4%       0.90            +0.8%       0.90        p=
erf-stat.i.cpi
    191995            +0.0%     191996            -0.0%     191994        p=
erf-stat.i.cpu-clock
 5.552e+11            -0.1%  5.544e+11            -0.2%  5.541e+11        p=
erf-stat.i.cpu-cycles
    259.22            -0.7%     257.42            -0.7%     257.31        p=
erf-stat.i.cpu-migrations
    607765 =C2=B1  6%      +1.3%     615930 =C2=B1  7%      +1.0%     61410=
6 =C2=B1  6%  perf-stat.i.cycles-between-cache-misses
      0.00 =C2=B1 26%      +0.0        0.00 =C2=B1 27%      +0.0        0.0=
0 =C2=B1 25%  perf-stat.i.dTLB-load-miss-rate%
    569436 =C2=B1  6%     +11.2%     633136 =C2=B1  4%     +68.7%     96091=
8 =C2=B1 31%  perf-stat.i.dTLB-load-misses
 1.485e+11            -0.6%  1.477e+11            -0.9%  1.471e+11        p=
erf-stat.i.dTLB-loads
      0.00 =C2=B1  9%      +0.0        0.00 =C2=B1 15%      +0.0        0.0=
0 =C2=B1 16%  perf-stat.i.dTLB-store-miss-rate%
    153239 =C2=B1 13%      +4.9%     160805            +6.6%     163305    =
    perf-stat.i.dTLB-store-misses
 1.033e+11            -3.2%      1e+11            -1.7%  1.016e+11        p=
erf-stat.i.dTLB-stores
     99.01            +0.2       99.17            +0.4       99.43        p=
erf-stat.i.iTLB-load-miss-rate%
 2.455e+08 =C2=B1 17%     -24.0%  1.867e+08 =C2=B1  3%     -31.9%  1.673e+0=
8 =C2=B1  2%  perf-stat.i.iTLB-load-misses
   1719010 =C2=B1 11%     -29.0%    1221344 =C2=B1 11%     -60.3%     68237=
7 =C2=B1  8%  perf-stat.i.iTLB-loads
 6.203e+11            -0.4%  6.175e+11            -0.9%  6.145e+11        p=
erf-stat.i.instructions
      2975 =C2=B1  9%     +11.5%       3318 =C2=B1  3%     +24.2%       369=
6 =C2=B1  2%  perf-stat.i.instructions-per-iTLB-miss
      1.12            -0.3%       1.11            -0.7%       1.11        p=
erf-stat.i.ipc
      2.13 =C2=B1 18%      -6.2%       2.00 =C2=B1  4%      +5.8%       2.2=
6 =C2=B1 20%  perf-stat.i.major-faults
      2.89            -0.1%       2.89            -0.2%       2.89        p=
erf-stat.i.metric.GHz
      1.41 =C2=B1  7%      +3.9%       1.46 =C2=B1  2%      +7.0%       1.5=
1        perf-stat.i.metric.K/sec
      1810            -0.9%       1793            -1.0%       1792        p=
erf-stat.i.metric.M/sec
      4354            +0.3%       4368            +0.9%       4396        p=
erf-stat.i.minor-faults
     90.38            -0.1       90.26            -0.0       90.37        p=
erf-stat.i.node-load-miss-rate%
    270733 =C2=B1  3%      -0.8%     268656            +1.4%     274393 =C2=
=B1  4%  perf-stat.i.node-load-misses
    186483 =C2=B1 10%      -1.5%     183640 =C2=B1  4%      -2.0%     18281=
9 =C2=B1 16%  perf-stat.i.node-loads
     94.16            +0.1       94.31            +0.4       94.56        p=
erf-stat.i.node-store-miss-rate%
     98285 =C2=B1  3%      -1.1%      97165 =C2=B1  3%      +1.9%     10017=
4 =C2=B1  2%  perf-stat.i.node-store-misses
     15077 =C2=B1 19%      -4.3%      14429 =C2=B1 18%      -9.4%      1366=
4 =C2=B1 15%  perf-stat.i.node-stores
      4356            +0.3%       4370            +1.0%       4398        p=
erf-stat.i.page-faults
    191995            +0.0%     191996            -0.0%     191994        p=
erf-stat.i.task-clock
      0.01 =C2=B1  3%      +2.8%       0.01 =C2=B1  6%      +2.3%       0.0=
1 =C2=B1  4%  perf-stat.overall.MPKI
      0.19            -0.0        0.18            -0.0        0.19        p=
erf-stat.overall.branch-miss-rate%
     15.62 =C2=B1  2%      -0.5       15.17 =C2=B1  2%      -0.3       15.3=
1 =C2=B1  3%  perf-stat.overall.cache-miss-rate%
      0.90            +0.3%       0.90            +0.7%       0.90        p=
erf-stat.overall.cpi
    441721 =C2=B1  5%      +0.5%     444092 =C2=B1  4%      +0.5%     44395=
8 =C2=B1  4%  perf-stat.overall.cycles-between-cache-misses
      0.00 =C2=B1  7%      +0.0        0.00 =C2=B1  4%      +0.0        0.0=
0 =C2=B1 31%  perf-stat.overall.dTLB-load-miss-rate%
      0.00 =C2=B1 13%      +0.0        0.00            +0.0        0.00    =
    perf-stat.overall.dTLB-store-miss-rate%
     99.28            +0.1       99.35            +0.3       99.59        p=
erf-stat.overall.iTLB-load-miss-rate%
      2622 =C2=B1 20%     +26.3%       3312 =C2=B1  3%     +40.1%       367=
4 =C2=B1  2%  perf-stat.overall.instructions-per-iTLB-miss
      1.12            -0.3%       1.11            -0.7%       1.11        p=
erf-stat.overall.ipc
     56.57 =C2=B1  2%      -0.5       56.09 =C2=B1  2%      +1.0       57.5=
8 =C2=B1  6%  perf-stat.overall.node-load-miss-rate%
     86.57 =C2=B1  2%      +0.4       86.95 =C2=B1  2%      +1.3       87.9=
0 =C2=B1  2%  perf-stat.overall.node-store-miss-rate%
    281289            +3.9%     292341            +0.6%     283094        p=
erf-stat.overall.path-length
  9.55e+10            +0.9%  9.633e+10            -0.4%  9.511e+10        p=
erf-stat.ps.branch-instructions
 1.846e+08            -5.3%  1.748e+08            -0.9%  1.829e+08        p=
erf-stat.ps.branch-misses
   1255953 =C2=B1  5%      -0.7%    1246710 =C2=B1  4%      -0.8%    124601=
8 =C2=B1  4%  perf-stat.ps.cache-misses
   8035643 =C2=B1  3%      +2.4%    8226303 =C2=B1  6%      +1.4%    814454=
1 =C2=B1  4%  perf-stat.ps.cache-references
      2068            -0.2%       2064            -0.1%       2065 =C2=B1  =
2%  perf-stat.ps.context-switches
    191354            +0.0%     191356            -0.0%     191353        p=
erf-stat.ps.cpu-clock
 5.533e+11            -0.1%  5.525e+11            -0.2%  5.522e+11        p=
erf-stat.ps.cpu-cycles
    258.09            -0.6%     256.53            -0.7%     256.34        p=
erf-stat.ps.cpu-migrations
    570402 =C2=B1  7%     +11.5%     635806 =C2=B1  4%     +68.5%     96139=
7 =C2=B1 31%  perf-stat.ps.dTLB-load-misses
  1.48e+11            -0.6%  1.472e+11            -0.9%  1.466e+11        p=
erf-stat.ps.dTLB-loads
    153008 =C2=B1 13%      +4.9%     160538            +6.5%     163004    =
    perf-stat.ps.dTLB-store-misses
 1.029e+11            -3.2%  9.966e+10            -1.7%  1.012e+11        p=
erf-stat.ps.dTLB-stores
 2.445e+08 =C2=B1 17%     -23.9%   1.86e+08 =C2=B1  3%     -31.8%  1.668e+0=
8 =C2=B1  2%  perf-stat.ps.iTLB-load-misses
   1714242 =C2=B1 11%     -29.0%    1216775 =C2=B1 11%     -60.3%     68118=
0 =C2=B1  8%  perf-stat.ps.iTLB-loads
 6.182e+11            -0.4%  6.154e+11            -0.9%  6.124e+11        p=
erf-stat.ps.instructions
      2.12 =C2=B1 18%      -6.2%       1.99 =C2=B1  4%      +6.0%       2.2=
5 =C2=B1 21%  perf-stat.ps.major-faults
      4355            +0.3%       4367            +0.9%       4396        p=
erf-stat.ps.minor-faults
    270103 =C2=B1  3%      -0.8%     268012            +1.5%     274087 =C2=
=B1  4%  perf-stat.ps.node-load-misses
    207587 =C2=B1  5%      +1.2%     210176 =C2=B1  6%      -2.3%     20278=
4 =C2=B1 11%  perf-stat.ps.node-loads
     98059 =C2=B1  3%      -1.2%      96927 =C2=B1  3%      +1.9%      9995=
7 =C2=B1  2%  perf-stat.ps.node-store-misses
     15229 =C2=B1 19%      -4.3%      14575 =C2=B1 18%      -9.6%      1376=
4 =C2=B1 15%  perf-stat.ps.node-stores
      4357            +0.3%       4369            +0.9%       4398        p=
erf-stat.ps.page-faults
    191354            +0.0%     191356            -0.0%     191353        p=
erf-stat.ps.task-clock
  1.87e+14            -0.4%  1.861e+14            -1.0%   1.85e+14        p=
erf-stat.total.instructions
     40037 =C2=B1193%     -80.8%       7697 =C2=B1 58%     -91.0%       361=
0 =C2=B1 91%  numa-meminfo.node0.Active
     40037 =C2=B1193%     -80.8%       7697 =C2=B1 58%     -91.0%       361=
0 =C2=B1 91%  numa-meminfo.node0.Active(anon)
     77851 =C2=B1 72%     -20.0%      62301 =C2=B1 68%     -13.4%      6738=
8 =C2=B1 28%  numa-meminfo.node0.AnonHugePages
    112119 =C2=B1 61%     -14.9%      95441 =C2=B1 59%      -7.0%     10432=
5 =C2=B1 24%  numa-meminfo.node0.AnonPages
    180432 =C2=B1 44%      -0.6%     179398 =C2=B1 77%     +19.8%     21614=
9 =C2=B1 47%  numa-meminfo.node0.AnonPages.max
    342321 =C2=B1 24%     -13.5%     296200            -9.7%     309078 =C2=
=B1  5%  numa-meminfo.node0.FilePages
    122837 =C2=B1 52%     -19.4%      98955 =C2=B1 59%     -11.6%     10864=
3 =C2=B1 24%  numa-meminfo.node0.Inactive
    122837 =C2=B1 52%     -19.4%      98955 =C2=B1 59%     -11.6%     10864=
3 =C2=B1 24%  numa-meminfo.node0.Inactive(anon)
     30053 =C2=B1 17%      -9.9%      27074 =C2=B1 12%     +31.1%      3940=
8 =C2=B1 15%  numa-meminfo.node0.KReclaimable
      9328 =C2=B1  4%     -10.2%       8378 =C2=B1  5%      -2.9%       905=
9 =C2=B1  6%  numa-meminfo.node0.KernelStack
     23813 =C2=B1 34%     -18.7%      19362 =C2=B1  9%     -13.8%      2053=
6 =C2=B1 12%  numa-meminfo.node0.Mapped
  48212518            +0.2%   48303244            +0.1%   48241888        n=
uma-meminfo.node0.MemFree
  49156876            +0.0%   49156876            +0.0%   49156876        n=
uma-meminfo.node0.MemTotal
    944356 =C2=B1  8%      -9.6%     853630 =C2=B1  8%      -3.1%     91498=
6 =C2=B1  7%  numa-meminfo.node0.MemUsed
    244.67 =C2=B1 70%     -49.7%     123.00 =C2=B1141%     +87.7%     459.1=
7 =C2=B1 25%  numa-meminfo.node0.Mlocked
      1209 =C2=B1 21%     -11.2%       1074 =C2=B1 31%     +22.3%       147=
9 =C2=B1 59%  numa-meminfo.node0.PageTables
     30053 =C2=B1 17%      -9.9%      27074 =C2=B1 12%     +31.1%      3940=
8 =C2=B1 15%  numa-meminfo.node0.SReclaimable
     86869 =C2=B1 14%      -9.4%      78720 =C2=B1 14%      +3.3%      8970=
9 =C2=B1  8%  numa-meminfo.node0.SUnreclaim
     50827 =C2=B1171%     -77.8%      11290 =C2=B1 40%     -84.1%       809=
5 =C2=B1 58%  numa-meminfo.node0.Shmem
    116923 =C2=B1 13%      -9.5%     105795 =C2=B1 11%     +10.4%     12911=
8 =C2=B1  9%  numa-meminfo.node0.Slab
    291494 =C2=B1  3%      -2.3%     284909            +3.3%     301073 =C2=
=B1  5%  numa-meminfo.node0.Unevictable
     20248 =C2=B1163%      +5.3%      21319 =C2=B1160%     -71.6%       574=
2 =C2=B1 52%  numa-meminfo.node1.Active
     20248 =C2=B1163%      +5.3%      21319 =C2=B1160%     -71.6%       574=
2 =C2=B1 52%  numa-meminfo.node1.Active(anon)
     55706 =C2=B1 75%     +79.1%      99793 =C2=B1 58%     -14.6%      4756=
4 =C2=B1 46%  numa-meminfo.node1.AnonHugePages
     94298 =C2=B1 53%     +50.5%     141885 =C2=B1 51%     -13.7%      8141=
5 =C2=B1 30%  numa-meminfo.node1.AnonPages
    186072 =C2=B1 68%     +17.4%     218444 =C2=B1 50%     +33.2%     24776=
0 =C2=B1 42%  numa-meminfo.node1.AnonPages.max
    322944 =C2=B1 14%      +0.0%     323081 =C2=B1 15%      -7.1%     30017=
4 =C2=B1  3%  numa-meminfo.node1.FilePages
     97848 =C2=B1 53%     +50.5%     147262 =C2=B1 48%     -11.5%      8663=
5 =C2=B1 27%  numa-meminfo.node1.Inactive
     97848 =C2=B1 53%     +50.5%     147262 =C2=B1 48%     -11.5%      8663=
5 =C2=B1 27%  numa-meminfo.node1.Inactive(anon)
     36663 =C2=B1 34%     -14.1%      31485 =C2=B1 36%      -4.3%      3509=
2 =C2=B1 30%  numa-meminfo.node1.KReclaimable
      7925 =C2=B1  7%      +7.8%       8543 =C2=B1 10%      +4.0%       824=
5 =C2=B1  7%  numa-meminfo.node1.KernelStack
     19429 =C2=B1 11%      +2.2%      19855 =C2=B1  7%      +5.3%      2046=
8 =C2=B1 13%  numa-meminfo.node1.Mapped
  48666212            -0.1%   48623218            +0.0%   48688591        n=
uma-meminfo.node1.MemFree
  49534456            +0.0%   49534456            +0.0%   49534456        n=
uma-meminfo.node1.MemTotal
    868242 =C2=B1 13%      +5.0%     911236 =C2=B1  6%      -2.6%     84586=
3 =C2=B1  3%  numa-meminfo.node1.MemUsed
    246.00 =C2=B1 70%     -49.8%     123.50 =C2=B1141%     +66.3%     409.0=
0 =C2=B1 21%  numa-meminfo.node1.Mlocked
      1950 =C2=B1 51%     -10.4%       1747 =C2=B1 52%      -1.3%       192=
3 =C2=B1 40%  numa-meminfo.node1.PageTables
     36663 =C2=B1 34%     -14.1%      31485 =C2=B1 36%      -4.3%      3509=
2 =C2=B1 30%  numa-meminfo.node1.SReclaimable
     71197 =C2=B1 20%      +4.9%      74705 =C2=B1 10%      +7.7%      7666=
6 =C2=B1  9%  numa-meminfo.node1.SUnreclaim
     23869 =C2=B1155%     +12.0%      26735 =C2=B1134%     -53.6%      1107=
6 =C2=B1 50%  numa-meminfo.node1.Shmem
    107861 =C2=B1 25%      -1.5%     106191 =C2=B1 14%      +3.6%     11175=
9 =C2=B1 11%  numa-meminfo.node1.Slab
    299074 =C2=B1  5%      -0.9%     296346 =C2=B1  5%      -3.3%     28913=
7        numa-meminfo.node1.Unevictable
      8982 =C2=B1100%     -41.3%       5271 =C2=B1 80%     -41.9%       522=
1 =C2=B1 85%  numa-meminfo.node2.Active
      8982 =C2=B1100%     -41.3%       5271 =C2=B1 80%     -41.9%       522=
1 =C2=B1 85%  numa-meminfo.node2.Active(anon)
    103304 =C2=B1 58%     -50.0%      51662 =C2=B1 75%      -9.0%      9396=
0 =C2=B1 48%  numa-meminfo.node2.AnonHugePages
    147906 =C2=B1 47%     -43.4%      83659 =C2=B1 59%      -7.8%     13640=
1 =C2=B1 46%  numa-meminfo.node2.AnonPages
    296653 =C2=B1 52%     -42.6%     170244 =C2=B1 77%     -36.4%     18863=
0 =C2=B1 38%  numa-meminfo.node2.AnonPages.max
    316927 =C2=B1  5%      -2.8%     308110 =C2=B1  4%      -4.4%     30312=
4 =C2=B1  5%  numa-meminfo.node2.FilePages
    154525 =C2=B1 44%     -40.2%      92366 =C2=B1 53%      -9.6%     13961=
9 =C2=B1 43%  numa-meminfo.node2.Inactive
    154525 =C2=B1 44%     -40.2%      92366 =C2=B1 53%      -9.6%     13961=
9 =C2=B1 43%  numa-meminfo.node2.Inactive(anon)
     37460 =C2=B1 22%     -14.5%      32039 =C2=B1 32%     -25.0%      2807=
7 =C2=B1 33%  numa-meminfo.node2.KReclaimable
      7866 =C2=B1 13%      -6.4%       7362 =C2=B1  6%      -6.2%       737=
9 =C2=B1  8%  numa-meminfo.node2.KernelStack
     21518 =C2=B1 17%      +7.3%      23094 =C2=B1  4%      -8.2%      1975=
0 =C2=B1 14%  numa-meminfo.node2.Mapped
  48610105            +0.2%   48721446            +0.1%   48681556        n=
uma-meminfo.node2.MemFree
  49534460            +0.0%   49534460            +0.0%   49534460        n=
uma-meminfo.node2.MemTotal
    924353 =C2=B1  8%     -12.0%     813012 =C2=B1  9%      -7.7%     85290=
2 =C2=B1  8%  numa-meminfo.node2.MemUsed
    330.83 =C2=B1 77%     -38.1%     204.67 =C2=B1141%     +23.2%     407.6=
7 =C2=B1 20%  numa-meminfo.node2.Mlocked
      1817 =C2=B1 57%     -31.9%       1238 =C2=B1 61%     -26.4%       133=
8 =C2=B1 66%  numa-meminfo.node2.PageTables
     37460 =C2=B1 22%     -14.5%      32039 =C2=B1 32%     -25.0%      2807=
7 =C2=B1 33%  numa-meminfo.node2.SReclaimable
     73467 =C2=B1 24%     -10.2%      65958 =C2=B1 14%     -18.1%      6019=
1 =C2=B1 15%  numa-meminfo.node2.SUnreclaim
     15755 =C2=B1 58%     -10.2%      14141 =C2=B1 29%     -46.0%       851=
1 =C2=B1 74%  numa-meminfo.node2.Shmem
    110927 =C2=B1 23%     -11.7%      97998 =C2=B1 19%     -20.4%      8826=
9 =C2=B1 19%  numa-meminfo.node2.Slab
    301255 =C2=B1  5%      -2.4%     294050 =C2=B1  5%      -2.2%     29465=
1 =C2=B1  4%  numa-meminfo.node2.Unevictable
    356390 =C2=B1 29%     +10.8%     394733 =C2=B1  8%     +17.4%     41847=
1 =C2=B1  2%  numa-meminfo.node3.Active
    356390 =C2=B1 29%     +10.8%     394733 =C2=B1  8%     +17.4%     41847=
1 =C2=B1  2%  numa-meminfo.node3.Active(anon)
     41357 =C2=B1 39%     +49.0%      61603 =C2=B1 85%     +60.0%      6617=
8 =C2=B1 57%  numa-meminfo.node3.AnonHugePages
     76088 =C2=B1 29%     +42.1%     108092 =C2=B1 60%     +44.7%     11007=
5 =C2=B1 48%  numa-meminfo.node3.AnonPages
    171664 =C2=B1 11%     +20.9%     207550 =C2=B1 32%     +51.6%     26019=
2 =C2=B1 42%  numa-meminfo.node3.AnonPages.max
    686790 =C2=B1 16%      +8.5%     744949 =C2=B1  6%     +11.2%     76402=
6        numa-meminfo.node3.FilePages
    116554 =C2=B1 14%     +30.3%     151914 =C2=B1 41%     +36.1%     15858=
5 =C2=B1 32%  numa-meminfo.node3.Inactive
    116554 =C2=B1 14%     +30.3%     151914 =C2=B1 41%     +36.1%     15858=
5 =C2=B1 32%  numa-meminfo.node3.Inactive(anon)
     29122 =C2=B1 32%     +47.6%      42988 =C2=B1 28%      +7.6%      3134=
9 =C2=B1 24%  numa-meminfo.node3.KReclaimable
      7319 =C2=B1  5%     +12.3%       8218 =C2=B1  8%      +3.4%       756=
8 =C2=B1  8%  numa-meminfo.node3.KernelStack
     40789 =C2=B1 21%      +5.7%      43098 =C2=B1  8%     +10.2%      4496=
9 =C2=B1  6%  numa-meminfo.node3.Mapped
  48318561            -0.2%   48208048            -0.3%   48180401        n=
uma-meminfo.node3.MemFree
  49489200            -0.0%   49489196            -0.0%   49489196        n=
uma-meminfo.node3.MemTotal
   1170637 =C2=B1  9%      +9.4%    1281146 =C2=B1  2%     +11.8%    130879=
3 =C2=B1  5%  numa-meminfo.node3.MemUsed
    331.17 =C2=B1 77%     -62.1%     125.50 =C2=B1141%     +36.6%     452.5=
0 =C2=B1 24%  numa-meminfo.node3.Mlocked
      1316 =C2=B1 56%     +66.4%       2191 =C2=B1 43%     +24.0%       163=
3 =C2=B1 45%  numa-meminfo.node3.PageTables
     29122 =C2=B1 32%     +47.6%      42988 =C2=B1 28%      +7.6%      3134=
9 =C2=B1 24%  numa-meminfo.node3.SReclaimable
     63184 =C2=B1 14%     +20.1%      75893 =C2=B1 13%      +9.3%      6904=
5 =C2=B1  8%  numa-meminfo.node3.SUnreclaim
    397006 =C2=B1 29%     +10.5%     438649 =C2=B1  8%     +17.7%     46714=
3 =C2=B1  2%  numa-meminfo.node3.Shmem
     92306 =C2=B1 20%     +28.8%     118882 =C2=B1 18%      +8.8%     10039=
5 =C2=B1 11%  numa-meminfo.node3.Slab
    289867 =C2=B1  2%      +5.7%     306302 =C2=B1  5%      +2.4%     29696=
5 =C2=B1  3%  numa-meminfo.node3.Unevictable
      9963 =C2=B1193%     -80.7%       1922 =C2=B1 58%     -91.0%     901.5=
0 =C2=B1 91%  numa-vmstat.node0.nr_active_anon
     28034 =C2=B1 61%     -14.8%      23874 =C2=B1 59%      -6.9%      2610=
2 =C2=B1 24%  numa-vmstat.node0.nr_anon_pages
     37.50 =C2=B1 74%     -20.0%      30.00 =C2=B1 69%     -13.3%      32.5=
0 =C2=B1 28%  numa-vmstat.node0.nr_anon_transparent_hugepages
     85575 =C2=B1 24%     -13.5%      74048            -9.7%      77268 =C2=
=B1  5%  numa-vmstat.node0.nr_file_pages
     47478            +0.0%      47478            +0.0%      47478        n=
uma-vmstat.node0.nr_free_cma
  12053119            +0.2%   12075759            +0.1%   12060497        n=
uma-vmstat.node0.nr_free_pages
     30755 =C2=B1 52%     -19.5%      24753 =C2=B1 59%     -11.6%      2718=
3 =C2=B1 24%  numa-vmstat.node0.nr_inactive_anon
      9328 =C2=B1  4%     -10.2%       8377 =C2=B1  5%      -2.9%       905=
7 =C2=B1  6%  numa-vmstat.node0.nr_kernel_stack
      6036 =C2=B1 35%     -19.4%       4866 =C2=B1 10%     -13.7%       520=
9 =C2=B1 12%  numa-vmstat.node0.nr_mapped
     60.83 =C2=B1 70%     -49.6%      30.67 =C2=B1141%     +88.5%     114.6=
7 =C2=B1 24%  numa-vmstat.node0.nr_mlock
    301.67 =C2=B1 22%     -11.4%     267.17 =C2=B1 31%     +22.4%     369.3=
3 =C2=B1 59%  numa-vmstat.node0.nr_page_table_pages
     12702 =C2=B1171%     -77.8%       2820 =C2=B1 40%     -84.1%       202=
2 =C2=B1 58%  numa-vmstat.node0.nr_shmem
      7512 =C2=B1 17%      -9.9%       6768 =C2=B1 12%     +31.1%       985=
1 =C2=B1 15%  numa-vmstat.node0.nr_slab_reclaimable
     21716 =C2=B1 14%      -9.4%      19679 =C2=B1 14%      +3.3%      2242=
7 =C2=B1  8%  numa-vmstat.node0.nr_slab_unreclaimable
     72873 =C2=B1  3%      -2.3%      71227            +3.3%      75268 =C2=
=B1  5%  numa-vmstat.node0.nr_unevictable
      9962 =C2=B1193%     -80.7%       1922 =C2=B1 58%     -91.0%     901.5=
0 =C2=B1 91%  numa-vmstat.node0.nr_zone_active_anon
     30755 =C2=B1 52%     -19.5%      24753 =C2=B1 59%     -11.6%      2718=
3 =C2=B1 24%  numa-vmstat.node0.nr_zone_inactive_anon
     72873 =C2=B1  3%      -2.3%      71227            +3.3%      75268 =C2=
=B1  5%  numa-vmstat.node0.nr_zone_unevictable
    663066 =C2=B1 10%      -7.0%     616376 =C2=B1  9%      +4.8%     69464=
1 =C2=B1 11%  numa-vmstat.node0.numa_hit
     88175            +0.1%      88283            -0.2%      88029        n=
uma-vmstat.node0.numa_interleave
    579829 =C2=B1 12%     -14.1%     498057 =C2=B1 17%      +0.3%     58165=
5 =C2=B1 14%  numa-vmstat.node0.numa_local
     83236 =C2=B1 11%     +42.1%     118318 =C2=B1 33%     +35.7%     11298=
5 =C2=B1 25%  numa-vmstat.node0.numa_other
      5040 =C2=B1163%      +5.3%       5308 =C2=B1160%     -71.5%       143=
4 =C2=B1 52%  numa-vmstat.node1.nr_active_anon
     23584 =C2=B1 53%     +50.5%      35484 =C2=B1 51%     -13.8%      2032=
7 =C2=B1 30%  numa-vmstat.node1.nr_anon_pages
     26.83 =C2=B1 77%     +80.1%      48.33 =C2=B1 58%     -14.9%      22.8=
3 =C2=B1 47%  numa-vmstat.node1.nr_anon_transparent_hugepages
     80736 =C2=B1 14%      +0.0%      80773 =C2=B1 15%      -7.1%      7504=
2 =C2=B1  3%  numa-vmstat.node1.nr_file_pages
  12166529            -0.1%   12155748            +0.0%   12172222        n=
uma-vmstat.node1.nr_free_pages
     24493 =C2=B1 53%     +50.5%      36851 =C2=B1 48%     -11.7%      2163=
2 =C2=B1 27%  numa-vmstat.node1.nr_inactive_anon
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node1.nr_isolated_anon
      7926 =C2=B1  7%      +7.8%       8541 =C2=B1 10%      +4.0%       824=
4 =C2=B1  7%  numa-vmstat.node1.nr_kernel_stack
      4939 =C2=B1 13%      +2.6%       5065 =C2=B1  6%      +4.5%       515=
9 =C2=B1 14%  numa-vmstat.node1.nr_mapped
     61.17 =C2=B1 70%     -49.6%      30.83 =C2=B1141%     +66.8%     102.0=
0 =C2=B1 21%  numa-vmstat.node1.nr_mlock
    487.33 =C2=B1 51%     -10.6%     435.83 =C2=B1 52%      -1.3%     481.0=
0 =C2=B1 40%  numa-vmstat.node1.nr_page_table_pages
      5967 =C2=B1155%     +12.0%       6686 =C2=B1134%     -53.6%       276=
8 =C2=B1 50%  numa-vmstat.node1.nr_shmem
      9165 =C2=B1 34%     -14.1%       7871 =C2=B1 36%      -4.3%       877=
2 =C2=B1 30%  numa-vmstat.node1.nr_slab_reclaimable
     17798 =C2=B1 20%      +4.9%      18676 =C2=B1 10%      +7.7%      1916=
5 =C2=B1  9%  numa-vmstat.node1.nr_slab_unreclaimable
     74768 =C2=B1  5%      -0.9%      74086 =C2=B1  5%      -3.3%      7228=
3        numa-vmstat.node1.nr_unevictable
      5040 =C2=B1163%      +5.3%       5308 =C2=B1160%     -71.5%       143=
4 =C2=B1 52%  numa-vmstat.node1.nr_zone_active_anon
     24493 =C2=B1 53%     +50.5%      36851 =C2=B1 48%     -11.7%      2163=
2 =C2=B1 27%  numa-vmstat.node1.nr_zone_inactive_anon
     74768 =C2=B1  5%      -0.9%      74086 =C2=B1  5%      -3.3%      7228=
3        numa-vmstat.node1.nr_zone_unevictable
    717068 =C2=B1 16%      +3.5%     742115 =C2=B1  9%      -5.7%     67597=
2 =C2=B1  5%  numa-vmstat.node1.numa_hit
     88289            -0.1%      88177            +0.1%      88413        n=
uma-vmstat.node1.numa_interleave
    570109 =C2=B1 25%      +2.5%     584147 =C2=B1 14%      -4.7%     54333=
6 =C2=B1  9%  numa-vmstat.node1.numa_local
    146958 =C2=B1 21%      +7.5%     157966 =C2=B1 19%      -9.7%     13263=
5 =C2=B1 40%  numa-vmstat.node1.numa_other
      2245 =C2=B1100%     -41.4%       1316 =C2=B1 80%     -42.0%       130=
3 =C2=B1 85%  numa-vmstat.node2.nr_active_anon
     36978 =C2=B1 47%     -43.4%      20921 =C2=B1 59%      -7.9%      3406=
3 =C2=B1 46%  numa-vmstat.node2.nr_anon_pages
     50.17 =C2=B1 59%     -50.5%      24.83 =C2=B1 77%      -9.3%      45.5=
0 =C2=B1 48%  numa-vmstat.node2.nr_anon_transparent_hugepages
     79232 =C2=B1  5%      -2.8%      77026 =C2=B1  4%      -4.4%      7578=
1 =C2=B1  5%  numa-vmstat.node2.nr_file_pages
  12152515            +0.2%   12180308            +0.1%   12170483        n=
uma-vmstat.node2.nr_free_pages
     38633 =C2=B1 44%     -40.2%      23098 =C2=B1 53%      -9.7%      3486=
8 =C2=B1 44%  numa-vmstat.node2.nr_inactive_anon
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node2.nr_isolated_anon
      7865 =C2=B1 13%      -6.4%       7363 =C2=B1  6%      -6.2%       737=
9 =C2=B1  8%  numa-vmstat.node2.nr_kernel_stack
      5422 =C2=B1 17%      +7.9%       5848 =C2=B1  5%      -8.8%       494=
6 =C2=B1 14%  numa-vmstat.node2.nr_mapped
     82.33 =C2=B1 77%     -37.9%      51.17 =C2=B1141%     +23.3%     101.5=
0 =C2=B1 20%  numa-vmstat.node2.nr_mlock
    453.33 =C2=B1 58%     -31.8%     309.17 =C2=B1 60%     -26.2%     334.5=
0 =C2=B1 66%  numa-vmstat.node2.nr_page_table_pages
      3939 =C2=B1 58%     -10.3%       3534 =C2=B1 29%     -46.0%       212=
7 =C2=B1 74%  numa-vmstat.node2.nr_shmem
      9364 =C2=B1 22%     -14.5%       8009 =C2=B1 32%     -25.0%       701=
8 =C2=B1 33%  numa-vmstat.node2.nr_slab_reclaimable
     18365 =C2=B1 24%     -10.2%      16489 =C2=B1 14%     -18.1%      1504=
7 =C2=B1 15%  numa-vmstat.node2.nr_slab_unreclaimable
     75313 =C2=B1  5%      -2.4%      73512 =C2=B1  5%      -2.2%      7366=
2 =C2=B1  4%  numa-vmstat.node2.nr_unevictable
      2245 =C2=B1100%     -41.4%       1316 =C2=B1 80%     -42.0%       130=
3 =C2=B1 85%  numa-vmstat.node2.nr_zone_active_anon
     38633 =C2=B1 44%     -40.2%      23098 =C2=B1 53%      -9.7%      3486=
8 =C2=B1 44%  numa-vmstat.node2.nr_zone_inactive_anon
     75313 =C2=B1  5%      -2.4%      73512 =C2=B1  5%      -2.2%      7366=
2 =C2=B1  4%  numa-vmstat.node2.nr_zone_unevictable
    723084 =C2=B1 14%     -12.0%     636321 =C2=B1 13%      -9.3%     65606=
8 =C2=B1 11%  numa-vmstat.node2.numa_hit
     88159            +0.1%      88266            -0.1%      88044        n=
uma-vmstat.node2.numa_interleave
    565999 =C2=B1 23%     -15.4%     479036 =C2=B1 16%     -13.1%     49168=
0 =C2=B1 19%  numa-vmstat.node2.numa_local
    157085 =C2=B1 20%      +0.1%     157285 =C2=B1 20%      +4.6%     16438=
7 =C2=B1 14%  numa-vmstat.node2.numa_other
     89005 =C2=B1 29%     +10.7%      98558 =C2=B1  8%     +17.4%     10448=
8 =C2=B1  2%  numa-vmstat.node3.nr_active_anon
     19031 =C2=B1 29%     +42.1%      27048 =C2=B1 60%     +44.4%      2748=
5 =C2=B1 48%  numa-vmstat.node3.nr_anon_pages
     19.67 =C2=B1 40%     +50.0%      29.50 =C2=B1 86%     +61.0%      31.6=
7 =C2=B1 58%  numa-vmstat.node3.nr_anon_transparent_hugepages
    171780 =C2=B1 16%      +8.4%     186266 =C2=B1  6%     +11.3%     19118=
7        numa-vmstat.node3.nr_file_pages
  12079544            -0.2%   12051913            -0.3%   12045002        n=
uma-vmstat.node3.nr_free_pages
     29320 =C2=B1 14%     +30.1%      38159 =C2=B1 41%     +36.2%      3992=
2 =C2=B1 32%  numa-vmstat.node3.nr_inactive_anon
      7320 =C2=B1  5%     +12.3%       8219 =C2=B1  8%      +3.4%       756=
9 =C2=B1  8%  numa-vmstat.node3.nr_kernel_stack
     10371 =C2=B1 20%      +5.3%      10921 =C2=B1  8%     +11.1%      1152=
0 =C2=B1  8%  numa-vmstat.node3.nr_mapped
     82.33 =C2=B1 77%     -61.9%      31.33 =C2=B1141%     +37.2%     113.0=
0 =C2=B1 24%  numa-vmstat.node3.nr_mlock
    328.67 =C2=B1 57%     +66.7%     548.00 =C2=B1 43%     +24.4%     408.8=
3 =C2=B1 45%  numa-vmstat.node3.nr_page_table_pages
     99334 =C2=B1 29%     +10.4%     109691 =C2=B1  8%     +17.7%     11696=
6 =C2=B1  2%  numa-vmstat.node3.nr_shmem
      7279 =C2=B1 32%     +47.6%      10746 =C2=B1 28%      +7.7%       783=
8 =C2=B1 24%  numa-vmstat.node3.nr_slab_reclaimable
     15795 =C2=B1 14%     +20.1%      18973 =C2=B1 13%      +9.3%      1726=
0 =C2=B1  8%  numa-vmstat.node3.nr_slab_unreclaimable
     72466 =C2=B1  2%      +5.7%      76575 =C2=B1  5%      +2.4%      7424=
1 =C2=B1  3%  numa-vmstat.node3.nr_unevictable
     89005 =C2=B1 29%     +10.7%      98558 =C2=B1  8%     +17.4%     10448=
8 =C2=B1  2%  numa-vmstat.node3.nr_zone_active_anon
     29320 =C2=B1 14%     +30.1%      38159 =C2=B1 41%     +36.2%      3992=
1 =C2=B1 32%  numa-vmstat.node3.nr_zone_inactive_anon
     72466 =C2=B1  2%      +5.7%      76575 =C2=B1  5%      +2.4%      7424=
1 =C2=B1  3%  numa-vmstat.node3.nr_zone_unevictable
    701454 =C2=B1  5%     +13.4%     795761 =C2=B1  8%     +13.4%     79560=
7 =C2=B1  8%  numa-vmstat.node3.numa_hit
     88273            -0.1%      88190            +0.2%      88422        n=
uma-vmstat.node3.numa_interleave
    535998 =C2=B1 11%     +26.2%     676624 =C2=B1 12%     +21.9%     65351=
8 =C2=B1  7%  numa-vmstat.node3.numa_local
    165455 =C2=B1 15%     -28.0%     119136 =C2=B1 44%     -14.1%     14208=
9 =C2=B1 23%  numa-vmstat.node3.numa_other
      0.00        +1.7e+11%       1671 =C2=B1222%  +2.3e+09%      23.18 =C2=
=B1141%  sched_debug.cfs_rq:/.MIN_vruntime.avg
      0.00        +3.2e+13%     320524 =C2=B1222%    +2e+11%       2013 =C2=
=B1148%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        s=
ched_debug.cfs_rq:/.MIN_vruntime.min
      0.00       +2.3e+106%      23084 =C2=B1222% +2.1e+104%     210.85 =C2=
=B1143%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      4812 =C2=B1  2%      +8.8%       5234 =C2=B1 10%     +11.7%       537=
4 =C2=B1 14%  sched_debug.cfs_rq:/.load.avg
     16329 =C2=B1  6%    +353.6%      74071 =C2=B1110%    +346.1%      7283=
9 =C2=B1111%  sched_debug.cfs_rq:/.load.max
      4480            -0.0%       4479            +0.3%       4493        s=
ched_debug.cfs_rq:/.load.min
      1554 =C2=B1 11%    +302.9%       6263 =C2=B1105%    +327.4%       664=
5 =C2=B1110%  sched_debug.cfs_rq:/.load.stddev
      7.77 =C2=B1 21%      -6.0%       7.30 =C2=B1 10%      -9.3%       7.0=
5 =C2=B1 11%  sched_debug.cfs_rq:/.load_avg.avg
    161.78 =C2=B1 33%     -21.1%     127.72 =C2=B1 11%     -12.8%     141.1=
4 =C2=B1 18%  sched_debug.cfs_rq:/.load_avg.max
      4.08 =C2=B1  4%      +0.7%       4.11 =C2=B1  3%      +1.4%       4.1=
4        sched_debug.cfs_rq:/.load_avg.min
     18.62 =C2=B1 33%     -19.9%      14.92 =C2=B1 16%     -19.7%      14.9=
6 =C2=B1 22%  sched_debug.cfs_rq:/.load_avg.stddev
      0.00        +1.7e+11%       1671 =C2=B1222%  +2.3e+09%      23.18 =C2=
=B1141%  sched_debug.cfs_rq:/.max_vruntime.avg
      0.00        +3.2e+13%     320524 =C2=B1222%    +2e+11%       2013 =C2=
=B1148%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        s=
ched_debug.cfs_rq:/.max_vruntime.min
      0.00       +2.3e+106%      23084 =C2=B1222% +2.1e+104%     210.85 =C2=
=B1143%  sched_debug.cfs_rq:/.max_vruntime.stddev
  30151526            +0.0%   30159826            -0.0%   30148824        s=
ched_debug.cfs_rq:/.min_vruntime.avg
  30272248            +0.0%   30280357            -0.0%   30267759        s=
ched_debug.cfs_rq:/.min_vruntime.max
  28657489            +0.3%   28730456            +0.2%   28724815        s=
ched_debug.cfs_rq:/.min_vruntime.min
    269246 =C2=B1  3%      -1.7%     264700 =C2=B1  3%      -1.9%     26423=
6 =C2=B1  4%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.84            +0.2%       0.84            +0.3%       0.85        s=
ched_debug.cfs_rq:/.nr_running.avg
      1.00            +5.6%       1.06 =C2=B1  7%      +5.6%       1.06 =C2=
=B1  7%  sched_debug.cfs_rq:/.nr_running.max
      0.83            +0.0%       0.83            +0.0%       0.83        s=
ched_debug.cfs_rq:/.nr_running.min
      0.04 =C2=B1 22%     +14.4%       0.04 =C2=B1 21%     +16.9%       0.0=
4 =C2=B1 22%  sched_debug.cfs_rq:/.nr_running.stddev
      0.87 =C2=B1102%    -100.0%       0.00           -74.9%       0.22 =C2=
=B1223%  sched_debug.cfs_rq:/.removed.load_avg.avg
     81.22 =C2=B1100%    -100.0%       0.00           -67.1%      26.72 =C2=
=B1223%  sched_debug.cfs_rq:/.removed.load_avg.max
      8.34 =C2=B1100%    -100.0%       0.00           -71.1%       2.41 =C2=
=B1223%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      0.34 =C2=B1106%    -100.0%       0.00           -72.0%       0.10 =C2=
=B1223%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     34.58 =C2=B1107%    -100.0%       0.00           -66.0%      11.75 =C2=
=B1222%  sched_debug.cfs_rq:/.removed.runnable_avg.max
      3.33 =C2=B1105%    -100.0%       0.00           -68.2%       1.06 =C2=
=B1223%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      0.34 =C2=B1106%    -100.0%       0.00           -72.0%       0.10 =C2=
=B1223%  sched_debug.cfs_rq:/.removed.util_avg.avg
     34.53 =C2=B1107%    -100.0%       0.00           -66.0%      11.75 =C2=
=B1222%  sched_debug.cfs_rq:/.removed.util_avg.max
      3.33 =C2=B1105%    -100.0%       0.00           -68.2%       1.06 =C2=
=B1223%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    886.17            +0.5%     890.20            +0.1%     887.15        s=
ched_debug.cfs_rq:/.runnable_avg.avg
      1630 =C2=B1  4%      -6.0%       1532 =C2=B1  3%      -3.7%       157=
0 =C2=B1  4%  sched_debug.cfs_rq:/.runnable_avg.max
    837.22            +0.2%     839.19            -0.2%     835.61        s=
ched_debug.cfs_rq:/.runnable_avg.min
     89.79 =C2=B1  6%      -4.1%      86.14 =C2=B1  7%      -3.4%      86.7=
7 =C2=B1  6%  sched_debug.cfs_rq:/.runnable_avg.stddev
    849594 =C2=B1 20%      -0.5%     845568 =C2=B1 20%      -9.6%     76789=
9 =C2=B1 11%  sched_debug.cfs_rq:/.spread0.avg
    967367 =C2=B1 18%      -0.5%     962669 =C2=B1 17%      -8.4%     88567=
1 =C2=B1 10%  sched_debug.cfs_rq:/.spread0.max
   -647913            -9.3%    -587649            +1.8%    -659456        s=
ched_debug.cfs_rq:/.spread0.min
    269267 =C2=B1  3%      -1.7%     264713 =C2=B1  3%      -1.9%     26424=
3 =C2=B1  4%  sched_debug.cfs_rq:/.spread0.stddev
    881.32            +0.5%     885.57            +0.1%     882.64        s=
ched_debug.cfs_rq:/.util_avg.avg
      1118            -3.6%       1077 =C2=B1  2%      -1.8%       1098 =C2=
=B1  4%  sched_debug.cfs_rq:/.util_avg.max
    738.89 =C2=B1  2%      -2.9%     717.39 =C2=B1  4%      +0.5%     742.2=
8 =C2=B1  8%  sched_debug.cfs_rq:/.util_avg.min
     56.14 =C2=B1  6%      +4.1%      58.42 =C2=B1  4%      -0.4%      55.9=
0 =C2=B1 13%  sched_debug.cfs_rq:/.util_avg.stddev
    737.85 =C2=B1 10%      -1.7%     725.63 =C2=B1 10%      +1.0%     745.2=
3 =C2=B1 11%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1105 =C2=B1  7%      +0.3%       1108 =C2=B1  6%      +4.3%       115=
2 =C2=B1 10%  sched_debug.cfs_rq:/.util_est_enqueued.max
    160.11 =C2=B1 89%     +33.6%     213.94 =C2=B1 67%    +100.3%     320.7=
8 =C2=B1 32%  sched_debug.cfs_rq:/.util_est_enqueued.min
    196.71 =C2=B1 13%      -3.0%     190.78 =C2=B1 24%     -10.5%     176.0=
2 =C2=B1 24%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    926930 =C2=B1  2%      +0.3%     929573            +0.7%     933416 =C2=
=B1  3%  sched_debug.cpu.avg_idle.avg
   1737117 =C2=B1 14%      -7.8%    1602392 =C2=B1  4%      +0.8%    175064=
6 =C2=B1 26%  sched_debug.cpu.avg_idle.max
    563193 =C2=B1 14%      -3.1%     545471 =C2=B1 35%     +12.0%     63054=
5 =C2=B1  7%  sched_debug.cpu.avg_idle.min
    151329 =C2=B1 22%     -16.0%     127076 =C2=B1 11%      -9.6%     13687=
6 =C2=B1 25%  sched_debug.cpu.avg_idle.stddev
    189670            -0.1%     189486            +0.7%     190954        s=
ched_debug.cpu.clock.avg
    189707            -0.1%     189524            +0.7%     190990        s=
ched_debug.cpu.clock.max
    189633            -0.1%     189447            +0.7%     190919        s=
ched_debug.cpu.clock.min
     23.22 =C2=B1  4%      +2.1%      23.70 =C2=B1  4%      -3.7%      22.3=
7 =C2=B1  4%  sched_debug.cpu.clock.stddev
    187861            -0.1%     187701            +0.7%     189119        s=
ched_debug.cpu.clock_task.avg
    188071            -0.1%     187919            +0.7%     189344        s=
ched_debug.cpu.clock_task.max
    181097            -0.4%     180426            -0.0%     181045        s=
ched_debug.cpu.clock_task.min
    608.55 =C2=B1 29%      +3.7%     630.96 =C2=B1 29%     +16.1%     706.3=
8 =C2=B1  3%  sched_debug.cpu.clock_task.stddev
      3158            -0.1%       3154            -0.5%       3143        s=
ched_debug.cpu.curr->pid.avg
      8095           -15.4%       6849 =C2=B1 11%      -6.7%       7553 =C2=
=B1  9%  sched_debug.cpu.curr->pid.max
      2993            -0.2%       2988            -0.7%       2971        s=
ched_debug.cpu.curr->pid.min
    448.73 =C2=B1  6%     -22.6%     347.12 =C2=B1 14%      -9.2%     407.2=
8 =C2=B1 11%  sched_debug.cpu.curr->pid.stddev
    502808            -0.2%     501743            -0.2%     501992        s=
ched_debug.cpu.max_idle_balance_cost.avg
    582448 =C2=B1  5%      -4.0%     559118            +1.4%     590806 =C2=
=B1  9%  sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000        s=
ched_debug.cpu.max_idle_balance_cost.min
     11566 =C2=B1 36%     -26.5%       8501 =C2=B1 21%      -5.5%      1093=
0 =C2=B1 52%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.avg
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.max
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.min
      0.00 =C2=B1  4%      +0.9%       0.00 =C2=B1  4%      -0.2%       0.0=
0 =C2=B1  4%  sched_debug.cpu.next_balance.stddev
      0.85            -0.0%       0.85            +0.2%       0.85        s=
ched_debug.cpu.nr_running.avg
      1.75 =C2=B1  4%      +3.2%       1.81 =C2=B1  6%      +3.2%       1.8=
1 =C2=B1  6%  sched_debug.cpu.nr_running.max
      0.83            +0.0%       0.83            +0.0%       0.83        s=
ched_debug.cpu.nr_running.min
      0.10 =C2=B1  7%      +0.4%       0.10 =C2=B1 10%      +3.5%       0.1=
1 =C2=B1  9%  sched_debug.cpu.nr_running.stddev
      3248            +0.1%       3250            -0.1%       3245        s=
ched_debug.cpu.nr_switches.avg
     25543 =C2=B1  8%      +5.0%      26830 =C2=B1  8%     +11.7%      2854=
3 =C2=B1 13%  sched_debug.cpu.nr_switches.max
      1406 =C2=B1 12%      -7.5%       1300 =C2=B1 11%     -10.7%       125=
6 =C2=B1 13%  sched_debug.cpu.nr_switches.min
      3131 =C2=B1  2%      +2.0%       3194 =C2=B1  4%      +4.1%       325=
9 =C2=B1  6%  sched_debug.cpu.nr_switches.stddev
      0.00 =C2=B1 20%      +0.0%       0.00 =C2=B1 20%     -36.4%       0.0=
0 =C2=B1 76%  sched_debug.cpu.nr_uninterruptible.avg
    186.75 =C2=B1  2%      -2.3%     182.47 =C2=B1  2%      -2.1%     182.8=
1        sched_debug.cpu.nr_uninterruptible.max
    -28.69            -5.3%     -27.17           -32.3%     -19.42        s=
ched_debug.cpu.nr_uninterruptible.min
     14.79 =C2=B1  2%      -1.7%      14.53 =C2=B1  3%      -3.3%      14.3=
1        sched_debug.cpu.nr_uninterruptible.stddev
    189633            -0.1%     189447            +0.7%     190918        s=
ched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            -0.0%  4.295e+09            +0.0%  4.295e+09        s=
ched_debug.jiffies
    188761            -0.1%     188575            +0.7%     190047        s=
ched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.min
      0.00 =C2=B1223%    -100.0%       0.00        +37164.0%       0.17 =C2=
=B1 99%  sched_debug.rt_rq:/.rt_time.avg
      0.00 =C2=B1223%    -100.0%       0.00        +7.2e+05%      32.90 =C2=
=B1101%  sched_debug.rt_rq:/.rt_time.max
      0.00          -100.0%       0.00        +1.3e+99%       0.00 =C2=B122=
3%  sched_debug.rt_rq:/.rt_time.min
      0.00 =C2=B1223%    -100.0%       0.00        +2.7e+05%       2.37 =C2=
=B1101%  sched_debug.rt_rq:/.rt_time.stddev
    190985            -0.1%     190710            +0.2%     191303        s=
ched_debug.sched_clk
      1.00            +0.0%       1.00            +0.0%       1.00        s=
ched_debug.sched_clock_stable()
   4140603            +0.0%    4140603            +0.0%    4140603        s=
ched_debug.sysctl_sched.sysctl_sched_features
     24.00            +0.0%      24.00            +0.0%      24.00        s=
ched_debug.sysctl_sched.sysctl_sched_latency
      3.00            +0.0%       3.00            +0.0%       3.00        s=
ched_debug.sysctl_sched.sysctl_sched_min_granularity
      1.00            +0.0%       1.00            +0.0%       1.00        s=
ched_debug.sysctl_sched.sysctl_sched_tunable_scaling
      4.00            +0.0%       4.00            +0.0%       4.00        s=
ched_debug.sysctl_sched.sysctl_sched_wakeup_granularity
     17.05            -0.6       16.41            -0.1       16.92        p=
erf-profile.calltrace.cycles-pp.__entry_text_start.syscall
      4.78            -0.6        4.15            -0.8        3.98        p=
erf-profile.calltrace.cycles-pp.try_grab_compound_head.gup_pgd_range.intern=
al_get_user_pages_fast.get_futex_key.futex_wake
      3.58            -0.2        3.40            -0.2        3.40        p=
erf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.entry_SYSCALL_64_after_hwframe.syscall
      5.50            -0.1        5.37            -0.2        5.27        p=
erf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_=
after_hwframe.syscall
      3.39            -0.1        3.29            +0.2        3.54        p=
erf-profile.calltrace.cycles-pp.hash_futex.futex_wake.do_futex.__x64_sys_fu=
tex.do_syscall_64
      3.26            -0.1        3.17            -0.0        3.25        p=
erf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      1.19            -0.1        1.13            -0.0        1.17        p=
erf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
     98.66            -0.0       98.62            +0.0       98.70        p=
erf-profile.calltrace.cycles-pp.syscall
      2.03            -0.0        2.00            +0.0        2.05        p=
erf-profile.calltrace.cycles-pp.get_user_pages_fast.get_futex_key.futex_wak=
e.do_futex.__x64_sys_futex
      0.91            -0.0        0.88            -0.0        0.89        p=
erf-profile.calltrace.cycles-pp.rcu_nocb_flush_deferred_wakeup.exit_to_user=
_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.sysc=
all
      1.10            -0.0        1.08            -0.0        1.10        p=
erf-profile.calltrace.cycles-pp.syscall_enter_from_user_mode.do_syscall_64.=
entry_SYSCALL_64_after_hwframe.syscall
      1.21 =C2=B1  5%      +0.0        1.21 =C2=B1  7%      +0.0        1.2=
2 =C2=B1  3%  perf-profile.calltrace.cycles-pp.testcase
      1.36            +0.1        1.46            +0.0        1.36 =C2=B1  =
2%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode_prepare.sysc=
all_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.syscall
     74.52            +0.8       75.37            +0.2       74.69        p=
erf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     65.51            +1.0       66.56            +0.3       65.85        p=
erf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.syscall
     63.23            +1.1       64.36            +0.4       63.59        p=
erf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.syscall
     59.57            +1.3       60.82            +0.3       59.90        p=
erf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe.syscall
     55.95            +1.5       57.40            +0.4       56.40        p=
erf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
     46.68            +1.8       48.51            +0.4       47.05        p=
erf-profile.calltrace.cycles-pp.get_futex_key.futex_wake.do_futex.__x64_sys=
_futex.do_syscall_64
     27.39            +2.2       29.63            +0.2       27.56        p=
erf-profile.calltrace.cycles-pp.gup_pgd_range.internal_get_user_pages_fast.=
get_futex_key.futex_wake.do_futex
     35.75            +2.2       37.99            +0.2       35.93        p=
erf-profile.calltrace.cycles-pp.internal_get_user_pages_fast.get_futex_key.=
futex_wake.do_futex.__x64_sys_futex
      0.00            +3.2        3.16 =C2=B1  2%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.page_is_secretmem.gup_pgd_range.intern=
al_get_user_pages_fast.get_futex_key.futex_wake
      0.00            +3.2        3.19 =C2=B1  2%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.page_mapping.page_is_secretmem.gup_pgd=
_range.internal_get_user_pages_fast.get_futex_key
      4.82            -0.6        4.19            -0.8        4.01        p=
erf-profile.children.cycles-pp.try_grab_compound_head
     11.04            -0.4       10.62            -0.1       10.96        p=
erf-profile.children.cycles-pp.__entry_text_start
      9.38            -0.3        9.06            -0.1        9.31        p=
erf-profile.children.cycles-pp.syscall_return_via_sysret
      3.71            -0.2        3.51            -0.2        3.51        p=
erf-profile.children.cycles-pp.exit_to_user_mode_prepare
      5.90            -0.1        5.76            -0.2        5.66        p=
erf-profile.children.cycles-pp.syscall_exit_to_user_mode
      3.44            -0.1        3.35            +0.2        3.60        p=
erf-profile.children.cycles-pp.hash_futex
      1.27            -0.1        1.21            -0.0        1.23        p=
erf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.93            -0.0        0.90            -0.0        0.91        p=
erf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      1.11            -0.0        1.09            +0.0        1.11        p=
erf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.39 =C2=B1  2%      -0.0        0.38 =C2=B1  5%      -0.0        0.3=
8 =C2=B1  8%  perf-profile.children.cycles-pp.tick_sched_handle
      0.39 =C2=B1  3%      -0.0        0.38 =C2=B1  4%      -0.0        0.3=
8 =C2=B1  8%  perf-profile.children.cycles-pp.update_process_times
      0.21 =C2=B1  4%      -0.0        0.20 =C2=B1  4%      -0.0        0.2=
0 =C2=B1  6%  perf-profile.children.cycles-pp.perf_tp_event
      0.21 =C2=B1  4%      -0.0        0.20 =C2=B1  4%      -0.0        0.2=
0 =C2=B1  7%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.22 =C2=B1  3%      -0.0        0.21 =C2=B1  5%      -0.0        0.2=
1 =C2=B1  7%  perf-profile.children.cycles-pp.update_curr
      2.19            -0.0        2.18            +0.0        2.21        p=
erf-profile.children.cycles-pp.get_user_pages_fast
      0.33 =C2=B1  2%      -0.0        0.32 =C2=B1  3%      -0.0        0.3=
2 =C2=B1  7%  perf-profile.children.cycles-pp.scheduler_tick
      0.20 =C2=B1  3%      -0.0        0.19 =C2=B1  3%      -0.0        0.1=
9 =C2=B1  7%  perf-profile.children.cycles-pp.perf_event_output_forward
      0.20 =C2=B1  3%      -0.0        0.20 =C2=B1  4%      -0.0        0.1=
9 =C2=B1  8%  perf-profile.children.cycles-pp.perf_swevent_overflow
      0.20 =C2=B1  3%      -0.0        0.20 =C2=B1  4%      -0.0        0.1=
9 =C2=B1  8%  perf-profile.children.cycles-pp.__perf_event_overflow
      0.16 =C2=B1  4%      -0.0        0.16 =C2=B1  3%      -0.0        0.1=
6 =C2=B1  8%  perf-profile.children.cycles-pp.perf_callchain
      0.30 =C2=B1  3%      -0.0        0.30 =C2=B1  3%      -0.0        0.2=
9 =C2=B1  6%  perf-profile.children.cycles-pp.task_tick_fair
      0.45 =C2=B1  2%      -0.0        0.44 =C2=B1  3%      -0.0        0.4=
5 =C2=B1  5%  perf-profile.children.cycles-pp.tick_sched_timer
     98.83            -0.0       98.82            -0.0       98.81        p=
erf-profile.children.cycles-pp.syscall
      0.16 =C2=B1  2%      -0.0        0.16 =C2=B1  3%      -0.0        0.1=
5 =C2=B1  7%  perf-profile.children.cycles-pp.get_perf_callchain
      0.17 =C2=B1  4%      -0.0        0.17 =C2=B1  4%      -0.0        0.1=
7 =C2=B1  7%  perf-profile.children.cycles-pp.perf_prepare_sample
      0.15 =C2=B1  2%      -0.0        0.15 =C2=B1  3%      -0.0        0.1=
4 =C2=B1  7%  perf-profile.children.cycles-pp.perf_callchain_kernel
      0.11 =C2=B1  6%      -0.0        0.11 =C2=B1  3%      -0.0        0.1=
1 =C2=B1  9%  perf-profile.children.cycles-pp.unwind_next_frame
      0.06 =C2=B1  8%      -0.0        0.06 =C2=B1  9%      -0.0        0.0=
5 =C2=B1 45%  perf-profile.children.cycles-pp.__unwind_start
      0.16 =C2=B1  3%      +0.0        0.16 =C2=B1  3%      +0.0        0.1=
6 =C2=B1  4%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.00            +0.0        0.00            +0.0        0.01 =C2=B122=
3%  perf-profile.children.cycles-pp.hrtimer_active
      0.00            +0.0        0.00            +0.0        0.01 =C2=B122=
3%  perf-profile.children.cycles-pp.irqtime_account_irq
      1.32 =C2=B1  5%      +0.0        1.32 =C2=B1  6%      +0.0        1.3=
3 =C2=B1  3%  perf-profile.children.cycles-pp.testcase
      0.08 =C2=B1 17%      +0.0        0.08 =C2=B1 11%      +0.0        0.0=
9 =C2=B1  8%  perf-profile.children.cycles-pp.clockevents_program_event
      0.11 =C2=B1 16%      +0.0        0.11 =C2=B1  9%      +0.0        0.1=
1 =C2=B1 15%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.12 =C2=B1 26%      +0.0        0.12 =C2=B1 13%      +0.0        0.1=
3 =C2=B1 29%  perf-profile.children.cycles-pp.ktime_get
      0.32 =C2=B1  4%      +0.0        0.33 =C2=B1  3%      -0.0        0.3=
0 =C2=B1  4%  perf-profile.children.cycles-pp.pud_huge
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.02 =C2=
=B1141%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.50 =C2=B1  3%      +0.0        0.51 =C2=B1  3%      +0.0        0.5=
1 =C2=B1  4%  perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.71 =C2=B1  6%      +0.0        0.72 =C2=B1  3%      +0.0        0.7=
3 =C2=B1  4%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.71 =C2=B1  6%      +0.0        0.72 =C2=B1  3%      +0.0        0.7=
3 =C2=B1  4%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.77 =C2=B1  5%      +0.0        0.78 =C2=B1  3%      +0.0        0.8=
0 =C2=B1  4%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.81 =C2=B1  6%      +0.0        0.83 =C2=B1  3%      +0.0        0.8=
4 =C2=B1  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interru=
pt
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1102%      +0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.queue_event
      0.02 =C2=B1142%      +0.0        0.04 =C2=B1 72%      +0.0        0.0=
4 =C2=B1 70%  perf-profile.children.cycles-pp.__libc_start_main
      0.02 =C2=B1142%      +0.0        0.04 =C2=B1 72%      +0.0        0.0=
4 =C2=B1 70%  perf-profile.children.cycles-pp.main
      0.02 =C2=B1142%      +0.0        0.04 =C2=B1 72%      +0.0        0.0=
4 =C2=B1 70%  perf-profile.children.cycles-pp.run_builtin
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1101%      +0.0        0.0=
4 =C2=B1 45%  perf-profile.children.cycles-pp.ordered_events__queue
      0.44 =C2=B1  8%      +0.0        0.47 =C2=B1  2%      +0.0        0.4=
5 =C2=B1  3%  perf-profile.children.cycles-pp.pmd_huge
      0.32 =C2=B1  6%      +0.0        0.34 =C2=B1 21%      +0.0        0.3=
6 =C2=B1 32%  perf-profile.children.cycles-pp.syscall(a)plt
      0.01 =C2=B1223%      +0.0        0.04 =C2=B1 71%      +0.0        0.0=
4 =C2=B1 70%  perf-profile.children.cycles-pp.cmd_sched
      0.02 =C2=B1144%      +0.0        0.05 =C2=B1 48%      +0.0        0.0=
7 =C2=B1 11%  perf-profile.children.cycles-pp.cmd_record
      0.01 =C2=B1223%      +0.0        0.05 =C2=B1 48%      +0.0        0.0=
6 =C2=B1 11%  perf-profile.children.cycles-pp.process_simple
      0.01 =C2=B1223%      +0.0        0.05 =C2=B1 48%      +0.1        0.0=
6 =C2=B1 14%  perf-profile.children.cycles-pp.record__finish_output
      0.01 =C2=B1223%      +0.0        0.05 =C2=B1 48%      +0.1        0.0=
6 =C2=B1 14%  perf-profile.children.cycles-pp.perf_session__process_events
      0.45            +0.1        0.51            +0.0        0.45        p=
erf-profile.children.cycles-pp.is_valid_gup_flags
      1.37            +0.1        1.47            +0.0        1.37 =C2=B1  =
2%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
     74.78            +0.8       75.63            +0.2       74.94        p=
erf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     65.64            +1.1       66.70            +0.3       65.98        p=
erf-profile.children.cycles-pp.do_syscall_64
     63.63            +1.1       64.75            +0.4       64.00        p=
erf-profile.children.cycles-pp.__x64_sys_futex
     59.95            +1.3       61.20            +0.3       60.29        p=
erf-profile.children.cycles-pp.do_futex
     56.16            +1.4       57.61            +0.4       56.61        p=
erf-profile.children.cycles-pp.futex_wake
     47.04            +1.8       48.84            +0.4       47.45        p=
erf-profile.children.cycles-pp.get_futex_key
     35.99            +2.2       38.22            +0.2       36.18        p=
erf-profile.children.cycles-pp.internal_get_user_pages_fast
     27.76            +2.5       30.23            +0.2       27.98        p=
erf-profile.children.cycles-pp.gup_pgd_range
      0.00            +3.2        3.19 =C2=B1  2%      +0.0        0.00    =
    perf-profile.children.cycles-pp.page_mapping
      0.00            +3.7        3.66 =C2=B1  2%      +0.0        0.00    =
    perf-profile.children.cycles-pp.page_is_secretmem
      4.66            -0.6        4.06            -0.8        3.86        p=
erf-profile.self.cycles-pp.try_grab_compound_head
      8.97            -0.4        8.54            +0.2        9.22        p=
erf-profile.self.cycles-pp.get_futex_key
     22.44            -0.4       22.05            +1.0       23.45        p=
erf-profile.self.cycles-pp.gup_pgd_range
      9.31            -0.3        8.99            -0.1        9.23        p=
erf-profile.self.cycles-pp.syscall_return_via_sysret
      8.27            -0.3        7.96            -0.1        8.16        p=
erf-profile.self.cycles-pp.syscall
      5.54            -0.3        5.25            -0.1        5.41        p=
erf-profile.self.cycles-pp.futex_wake
      7.97            -0.3        7.71            -0.1        7.92        p=
erf-profile.self.cycles-pp.internal_get_user_pages_fast
      5.01            -0.2        4.82            -0.0        4.99        p=
erf-profile.self.cycles-pp.__entry_text_start
      3.82            -0.2        3.64            -0.1        3.71        p=
erf-profile.self.cycles-pp.do_futex
      2.73            -0.2        2.56            -0.2        2.55        p=
erf-profile.self.cycles-pp.exit_to_user_mode_prepare
      3.76            -0.2        3.61            +0.0        3.78        p=
erf-profile.self.cycles-pp.__x64_sys_futex
      3.41            -0.1        3.32            +0.1        3.56        p=
erf-profile.self.cycles-pp.hash_futex
      3.30            -0.1        3.23            +0.1        3.36        p=
erf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.25            -0.1        1.19            -0.0        1.22        p=
erf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.74 =C2=B1  4%      -0.0        0.69 =C2=B1  2%      -0.0        0.7=
1        perf-profile.self.cycles-pp.do_syscall_64
      0.84            -0.0        0.81            -0.0        0.82        p=
erf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      1.07            -0.0        1.04            -0.0        1.03        p=
erf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.95            -0.0        0.94            +0.0        0.96        p=
erf-profile.self.cycles-pp.syscall_enter_from_user_mode
      1.51            -0.0        1.49            -0.0        1.48        p=
erf-profile.self.cycles-pp.get_user_pages_fast
      1.04 =C2=B1  3%      -0.0        1.03 =C2=B1  3%      -0.0        1.0=
4        perf-profile.self.cycles-pp.testcase
      0.05 =C2=B1  7%      -0.0        0.04 =C2=B1 44%      -0.0        0.0=
4 =C2=B1 44%  perf-profile.self.cycles-pp.unwind_next_frame
      0.10 =C2=B1 14%      -0.0        0.10 =C2=B1 10%      +0.0        0.1=
1 =C2=B1 16%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.00            +0.0        0.00            +0.0        0.01 =C2=B122=
3%  perf-profile.self.cycles-pp.hrtimer_active
      0.13            +0.0        0.13 =C2=B1  2%      +0.0        0.14 =C2=
=B1  2%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.11 =C2=B1 27%      +0.0        0.11 =C2=B1 14%      +0.0        0.1=
2 =C2=B1 32%  perf-profile.self.cycles-pp.ktime_get
      0.38 =C2=B1  7%      +0.0        0.40            +0.0        0.39 =C2=
=B1  2%  perf-profile.self.cycles-pp.pmd_huge
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1102%      +0.0        0.0=
4 =C2=B1 71%  perf-profile.self.cycles-pp.queue_event
      0.24            +0.0        0.26 =C2=B1  3%      +0.0        0.24 =C2=
=B1  3%  perf-profile.self.cycles-pp.pud_huge
      0.31            +0.0        0.34            +0.0        0.31        p=
erf-profile.self.cycles-pp.is_valid_gup_flags
      0.20 =C2=B1  6%      +0.0        0.23 =C2=B1 33%      +0.0        0.2=
5 =C2=B1 47%  perf-profile.self.cycles-pp.syscall(a)plt
      1.23            +0.1        1.32            +0.0        1.24 =C2=B1  =
2%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.00            +0.6        0.62            +0.0        0.00        p=
erf-profile.self.cycles-pp.page_is_secretmem
      0.00            +2.8        2.81 =C2=B1  3%      +0.0        0.00    =
    perf-profile.self.cycles-pp.page_mapping
      0.01 =C2=B1  4%      +1.6%       0.01 =C2=B1  8%      +6.2%       0.0=
1 =C2=B1  8%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.[unknown]
      1.22 =C2=B1220%     -98.5%       0.02 =C2=B1  6%     +37.1%       1.6=
7 =C2=B1221%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      0.01 =C2=B1  6%      +1.6%       0.01 =C2=B1  4%      +1.6%       0.0=
1 =C2=B1  4%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      5.55 =C2=B1148%     -47.2%       2.93 =C2=B1 53%     -50.6%       2.7=
4 =C2=B1 98%  perf-sched.sch_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      0.01 =C2=B1143%    +264.0%       0.03 =C2=B1201%    +290.0%       0.0=
3 =C2=B1134%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      0.01 =C2=B1  2%   +3901.2%       0.57 =C2=B1214%      +0.0%       0.0=
1 =C2=B1  2%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
      0.00       +1.5e+102%       1.47 =C2=B1223% +2.9e+102%       2.92 =C2=
=B1223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      0.00 =C2=B1141%     -13.3%       0.00 =C2=B1142%      +0.0%       0.0=
0 =C2=B1141%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.58 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00 =C2=B1159%     -42.9%       0.00 =C2=B1165%     +14.3%       0.0=
0 =C2=B1103%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00       +1.5e+102%       1.46 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.ret_from_fork.[unknown]
      0.02 =C2=B1 18%      +0.0%       0.02 =C2=B1 16%      +4.4%       0.0=
2 =C2=B1 16%  perf-sched.sch_delay.avg.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00 =C2=B1223%     +55.6%       0.00 =C2=B1141%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.kthreadd.ret_from_fork
      0.03 =C2=B1 80%     -29.2%       0.02 =C2=B1 24%     -36.4%       0.0=
2 =C2=B1 19%  perf-sched.sch_delay.avg.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      0.00          +2e+99%       0.00 =C2=B1223%  +7.3e+99%       0.01 =C2=
=B1108%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__get_free_pages.pgd_alloc
      0.00        +1.8e+99%       0.00 =C2=B1223%    +2e+99%       0.00 =C2=
=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__pmd_alloc.copy_page_range
      1.81 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.alloc_pages_vma.wp_page_copy
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
1%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.collapse_huge_page.khugepaged_scan_pmd
      0.00 =C2=B1141%     -42.9%       0.00 =C2=B1223%     -17.9%       0.0=
0 =C2=B1141%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -50.1%       0.1=
7 =C2=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.__flush_work.lru_add_drain_all.khugepaged
      0.00 =C2=B1141%    -100.0%       0.00           +42.9%       0.01 =C2=
=B1141%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.__kmalloc.security_task_alloc.copy_process
      0.00 =C2=B1223%      +0.0%       0.00 =C2=B1223%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.__kmalloc_node.__vmalloc_node_range.dup_task_struct
      0.00        +2.5e+99%       0.00 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.cgro=
up_can_fork.copy_process.kernel_clone
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      0.01 =C2=B1 45%     -61.2%       0.00 =C2=B1142%     -59.7%       0.0=
0 =C2=B1142%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.copy_pte_range.copy_page_range.dup_mmap
      1.15 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.copy=
_strings.isra.0
      0.00 =C2=B1223%    +375.0%       0.00 =C2=B1148%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00 =C2=B1223%    -100.0%       0.00          +108.3%       0.00 =C2=
=B1142%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00        +1.8e+99%       0.00 =C2=B1223%    +2e+99%       0.00 =C2=
=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_fork.dup_mmap
      0.01 =C2=B1 46%     -81.8%       0.00 =C2=B1223%     -80.0%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.down_write.dup_mmap.dup_mm
      0.67 =C2=B1111%     -23.7%       0.51 =C2=B1 96%     -49.9%       0.3=
3 =C2=B1140%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.khugepaged.kthread.ret_from_fork
      0.00 =C2=B1142%    -100.0%       0.00            +3.7%       0.00 =C2=
=B1141%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.anon_vma_fork.dup_mmap
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_fs_struct.copy_process
      0.00          -100.0%       0.00        +4.7e+99%       0.00 =C2=B114=
1%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.dup_fd.copy_process
      0.00          -100.0%       0.00        +2.7e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.dup_mm.copy_process
      0.00        +3.8e+99%       0.00 =C2=B1141%    +4e+99%       0.00 =C2=
=B1141%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.prepare_creds.copy_creds
      0.00 =C2=B1141%    -100.0%       0.00            +3.4%       0.01 =C2=
=B1145%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_dup.dup_mmap
      0.00          -100.0%       0.00        +2.2e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_node.alloc_vmap_area.__get_vm_area_node
      0.00          -100.0%       0.00       +1.2e+102%       1.16 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.pipe_write.new_sync_write
      0.00 =C2=B1223%   +1300.0%       0.00 =C2=B1205%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
      9.30            -0.1%       9.29            +0.1%       9.31        p=
erf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.stop_one_=
cpu.sched_exec.bprm_execve
      0.00 =C2=B1223%     +16.7%       0.00 =C2=B1223%      +0.0%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.uprobe_start_dup_mmap.dup_mmap.dup_mm
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.wp_p=
age_copy.__handle_mm_fault.handle_mm_fault
      0.29 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.ww_m=
utex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      0.01 =C2=B1  3%      +1.4%       0.01 =C2=B1  3%     -15.1%       0.0=
1 =C2=B1 44%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.03 =C2=B1 35%    +168.4%       0.09 =C2=B1145%     +36.4%       0.0=
5 =C2=B1 10%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.02 =C2=B1 40%     +15.4%       0.02 =C2=B1 38%     +20.5%       0.0=
2 =C2=B1 39%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_select
      0.00 =C2=B1 55%     -12.5%       0.00 =C2=B1 31%     -25.0%       0.0=
0        perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.poll_sc=
hedule_timeout.constprop.0.do_sys_poll
      0.13 =C2=B1223%    +108.0%       0.27 =C2=B1141%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.kthread.ret_=
from_fork
      0.01 =C2=B1  4%      +0.0%       0.01 =C2=B1  4%      -1.8%       0.0=
1        perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret=
_from_fork
      0.01 =C2=B1 19%      -3.6%       0.01 =C2=B1  4%      -1.8%       0.0=
1        perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_kthread.kthrea=
d.ret_from_fork
      0.17 =C2=B1223%      -0.1%       0.17 =C2=B1223%      +1.7%       0.1=
7 =C2=B1218%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_for_complet=
ion.__flush_work.lru_add_drain_all
      0.00 =C2=B1223%     +75.0%       0.00 =C2=B1141%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.schedule_timeout.wait_for_completion_k=
illable.__kthread_create_on_node.kthread_create_on_node
      0.01            +0.0%       0.01            +0.0%       0.01        p=
erf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.02 =C2=B1223%    +151.2%       0.05 =C2=B1223%    +542.6%       0.1=
4 =C2=B1108%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
      0.47 =C2=B1203%     -92.5%       0.03 =C2=B1 98%     -89.2%       0.0=
5 =C2=B1 67%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fo=
rk
      0.01 =C2=B1 18%     -11.2%       0.01 =C2=B1 10%      +3.4%       0.0=
2 =C2=B1 28%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.[unknown]
      1.43 =C2=B1220%     -98.4%       0.02 =C2=B1 21%     +34.2%       1.9=
1 =C2=B1221%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      0.02 =C2=B1 35%      +5.9%       0.02 =C2=B1 24%      +7.9%       0.0=
2 =C2=B1 24%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
     16.63 =C2=B1149%     -49.4%       8.41 =C2=B1 51%     -53.5%       7.7=
2 =C2=B1104%  perf-sched.sch_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      1.50 =C2=B1220%     +44.9%       2.17 =C2=B1221%    +176.1%       4.1=
3 =C2=B1145%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      0.06 =C2=B1 57%  +2.8e+05%     170.34 =C2=B1219%     +11.4%       0.0=
7 =C2=B1 66%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
      0.00       +1.5e+102%       1.47 =C2=B1223% +2.9e+102%       2.92 =C2=
=B1223%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      2.32 =C2=B1141%      -7.1%       2.15 =C2=B1141%      +0.0%       2.3=
2 =C2=B1141%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.16 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_reschedule_ipi.[unknown]
      3.11 =C2=B1140%      +4.5%       3.25 =C2=B1140%     +92.1%       5.9=
8 =C2=B1 72%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00       +1.5e+102%       1.46 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.ret_from_fork.[unknown]
      0.02 =C2=B1 15%      +2.1%       0.02 =C2=B1 17%      -1.4%       0.0=
2 =C2=B1 15%  perf-sched.sch_delay.max.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00 =C2=B1223%     +55.6%       0.00 =C2=B1141%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.kthreadd.ret_from_fork
     16.52 =C2=B1 57%     -52.0%       7.93 =C2=B1 70%     -40.0%       9.9=
2 =C2=B1 44%  perf-sched.sch_delay.max.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      0.00          +2e+99%       0.00 =C2=B1223%  +7.3e+99%       0.01 =C2=
=B1108%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__get_free_pages.pgd_alloc
      0.00        +1.8e+99%       0.00 =C2=B1223%    +2e+99%       0.00 =C2=
=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__pmd_alloc.copy_page_range
      1.81 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.alloc_pages_vma.wp_page_copy
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
1%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.collapse_huge_page.khugepaged_scan_pmd
      0.00 =C2=B1141%     -42.9%       0.00 =C2=B1223%     -17.9%       0.0=
0 =C2=B1141%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -50.1%       0.1=
7 =C2=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.__flush_work.lru_add_drain_all.khugepaged
      0.00 =C2=B1141%    -100.0%       0.00           +42.9%       0.01 =C2=
=B1141%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.__kmalloc.security_task_alloc.copy_process
      0.00 =C2=B1223%      +0.0%       0.00 =C2=B1223%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.__kmalloc_node.__vmalloc_node_range.dup_task_struct
      0.00        +2.5e+99%       0.00 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.cgro=
up_can_fork.copy_process.kernel_clone
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      0.01 =C2=B1 45%     -59.4%       0.00 =C2=B1143%     -60.9%       0.0=
0 =C2=B1142%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.copy_pte_range.copy_page_range.dup_mmap
      1.15 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.copy=
_strings.isra.0
      0.00 =C2=B1223%    +100.0%       0.00 =C2=B1142%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00 =C2=B1223%    -100.0%       0.00          +116.7%       0.00 =C2=
=B1143%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00        +1.8e+99%       0.00 =C2=B1223%    +2e+99%       0.00 =C2=
=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_fork.dup_mmap
      0.01 =C2=B1 46%     -82.1%       0.00 =C2=B1223%     -80.4%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.down_write.dup_mmap.dup_mm
      0.67 =C2=B1111%     -23.7%       0.51 =C2=B1 96%     -49.9%       0.3=
3 =C2=B1140%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.khugepaged.kthread.ret_from_fork
      0.00 =C2=B1142%    -100.0%       0.00            +3.7%       0.00 =C2=
=B1141%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.anon_vma_fork.dup_mmap
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_fs_struct.copy_process
      0.00          -100.0%       0.00        +4.7e+99%       0.00 =C2=B114=
1%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.dup_fd.copy_process
      0.00          -100.0%       0.00        +2.7e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.dup_mm.copy_process
      0.00        +3.8e+99%       0.00 =C2=B1141%  +4.2e+99%       0.00 =C2=
=B1141%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.prepare_creds.copy_creds
      0.00 =C2=B1141%    -100.0%       0.00            +3.4%       0.01 =C2=
=B1145%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_dup.dup_mmap
      0.00          -100.0%       0.00        +2.2e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_node.alloc_vmap_area.__get_vm_area_node
      0.00          -100.0%       0.00       +1.2e+102%       1.16 =C2=B122=
3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.pipe_write.new_sync_write
      0.33 =C2=B1179%   +1481.4%       5.27 =C2=B1210%     -85.1%       0.0=
5 =C2=B1  3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
     20.25 =C2=B1  3%      +2.3%      20.71 =C2=B1  7%      -2.4%      19.7=
6 =C2=B1  4%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.sched_exec.bprm_execve
      0.00 =C2=B1223%     +16.7%       0.00 =C2=B1223%      +0.0%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.uprobe_start_dup_mmap.dup_mmap.dup_mm
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.wp_p=
age_copy.__handle_mm_fault.handle_mm_fault
      0.29 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.ww_m=
utex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      0.02 =C2=B1 27%      -9.3%       0.02 =C2=B1 30%     -16.3%       0.0=
2 =C2=B1 58%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.18 =C2=B1 28%   +1158.7%       2.23 =C2=B1203%     +11.1%       0.2=
0 =C2=B1 10%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.03 =C2=B1 63%     +21.3%       0.04 =C2=B1 55%     +24.7%       0.0=
4 =C2=B1 53%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_select
      0.04 =C2=B1140%      +3.1%       0.04 =C2=B1160%     -61.7%       0.0=
2 =C2=B1 23%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      0.13 =C2=B1223%    +108.0%       0.27 =C2=B1141%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.schedule_preempt_disabled.kthread.ret_=
from_fork
      0.02 =C2=B1 30%     -13.8%       0.02 =C2=B1 28%     -13.0%       0.0=
2 =C2=B1 25%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthrea=
d.ret_from_fork
      1.54 =C2=B1214%     -98.0%       0.03 =C2=B1 14%     -96.6%       0.0=
5 =C2=B1 79%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.17 =C2=B1223%      -0.1%       0.17 =C2=B1223%      +1.7%       0.1=
7 =C2=B1218%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_complet=
ion.__flush_work.lru_add_drain_all
      0.00 =C2=B1223%     +75.0%       0.00 =C2=B1141%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_completion_k=
illable.__kthread_create_on_node.kthread_create_on_node
      0.10 =C2=B1 53%     -18.2%       0.08 =C2=B1 66%     -19.2%       0.0=
8 =C2=B1 70%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
      1.37 =C2=B1223%     +56.6%       2.15 =C2=B1223%    +355.5%       6.2=
5 =C2=B1105%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
    281.88 =C2=B1209%     -95.1%      13.89 =C2=B1149%     -92.4%      21.4=
3 =C2=B1 89%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fo=
rk
      0.16 =C2=B1 18%      -0.2%       0.16 =C2=B1 15%      -7.5%       0.1=
5 =C2=B1  4%  perf-sched.total_sch_delay.average.ms
    299.16 =C2=B1194%     -37.7%     186.38 =C2=B1197%     -90.1%      29.6=
7 =C2=B1 44%  perf-sched.total_sch_delay.max.ms
    138.15 =C2=B1  4%      +2.7%     141.87 =C2=B1  4%      +2.0%     140.8=
6 =C2=B1  5%  perf-sched.total_wait_and_delay.average.ms
     18395 =C2=B1  5%      -2.3%      17967 =C2=B1  6%      -0.2%      1835=
4 =C2=B1  8%  perf-sched.total_wait_and_delay.count.ms
      8283 =C2=B1  5%      +4.6%       8662 =C2=B1  8%      +7.7%       892=
2 =C2=B1  8%  perf-sched.total_wait_and_delay.max.ms
    137.98 =C2=B1  4%      +2.7%     141.71 =C2=B1  4%      +2.0%     140.7=
1 =C2=B1  5%  perf-sched.total_wait_time.average.ms
      8283 =C2=B1  5%      +4.6%       8662 =C2=B1  8%      +7.7%       892=
2 =C2=B1  8%  perf-sched.total_wait_time.max.ms
    900.94            -0.2%     899.41            +0.2%     902.42        p=
erf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.[unknown]
      2175 =C2=B1 15%     -10.3%       1951 =C2=B1 11%      +4.5%       227=
3 =C2=B1 22%  perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_r=
ead.do_syscall_64
    786.59 =C2=B1  5%      +3.0%     809.84 =C2=B1  5%      -0.5%     782.3=
7        perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      2122 =C2=B1  6%      -7.8%       1956 =C2=B1 11%      +7.4%       227=
9 =C2=B1 22%  perf-sched.wait_and_delay.avg.ms.do_syslog.part.0.kmsg_read.v=
fs_read
    211.03 =C2=B1  4%      -2.5%     205.76            -2.0%     206.74    =
    perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x=
64_sys_exit_group.do_syscall_64
     86.32 =C2=B1  8%      +8.1%      93.30 =C2=B1  6%     +15.4%      99.6=
3 =C2=B1  9%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sy=
s_wait4.do_syscall_64
      0.27 =C2=B1 50%     -32.5%       0.18 =C2=B1 17%     -28.9%       0.1=
9 =C2=B1 12%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.ir=
qentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.13 =C2=B1 57%    +123.4%       0.29 =C2=B1 79%     -19.7%       0.1=
1 =C2=B1 20%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.ir=
qentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.17 =C2=B1  6%      +3.5%       0.18 =C2=B1  8%      +2.7%       0.1=
7 =C2=B1  5%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.sy=
scall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    119.82 =C2=B1156%     +63.9%     196.38 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_and_delay.avg.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00        +7.8e+99%       0.01 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.avg.ms.io_schedule.__lock_page_killable.filem=
ap_fault.__do_fault
     90.11 =C2=B1 37%     +22.5%     110.41 =C2=B1 31%      -3.9%      86.6=
1 =C2=B1 29%  perf-sched.wait_and_delay.avg.ms.pipe_read.new_sync_read.vfs_=
read.ksys_read
    357.66 =C2=B1223%     -75.7%      86.82 =C2=B1223%      -2.4%     349.1=
0 =C2=B1223%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__co=
nd_resched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
    459.91 =C2=B1223%    -100.0%       0.00          +131.1%       1062 =C2=
=B1223%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.__do_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +1.1e+105%       1123 =C2=B119=
3%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.1e+105%       1077 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.generic_file_write_iter.new_sync_write
    567.81 =C2=B1 73%     +62.2%     921.21 =C2=B1 68%     -48.3%     293.4=
1 =C2=B1129%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__co=
nd_resched.generic_perform_write.__generic_file_write_iter.generic_file_wri=
te_iter
      4.95 =C2=B1  9%      -1.9%       4.85 =C2=B1  7%      -5.4%       4.6=
8 =C2=B1 11%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__co=
nd_resched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
      9.30            -0.1%       9.29            +0.1%       9.31        p=
erf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched.stop=
_one_cpu.sched_exec.bprm_execve
    359.76 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
    619.14 =C2=B1 13%      -6.1%     581.61 =C2=B1 15%     +20.7%     747.1=
6 =C2=B1  4%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clo=
ck.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    120.65 =C2=B1  7%      +0.2%     120.88 =C2=B1  4%      -2.0%     118.2=
2 =C2=B1  8%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clo=
ck.poll_schedule_timeout.constprop.0.do_sys_poll
    478.84            -0.0%     478.64            -0.0%     478.73        p=
erf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from=
_fork
      5.48 =C2=B1  7%      -5.0%       5.21 =C2=B1  6%      +5.8%       5.8=
0 =C2=B1 11%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_kthr=
ead.kthread.ret_from_fork
    619.04 =C2=B1  2%      +0.5%     622.28            +0.4%     621.29 =C2=
=B1  2%  perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
    541.74 =C2=B1  4%      -0.9%     536.80 =C2=B1  4%      +2.4%     554.9=
3 =C2=B1  3%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_fr=
om_fork
     10.17 =C2=B1  3%      -1.6%      10.00            +1.6%      10.33 =C2=
=B1  4%  perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe.[unknown]
      3.00 =C2=B1 19%     +11.1%       3.33 =C2=B1 14%      +0.0%       3.0=
0 =C2=B1 19%  perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_re=
ad.do_syscall_64
     23.00 =C2=B1  5%      -2.2%      22.50 =C2=B1  4%      +2.2%      23.5=
0 =C2=B1  2%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanoslee=
p.__x64_sys_nanosleep.do_syscall_64
      3.00           +11.1%       3.33 =C2=B1 14%      +0.0%       3.00 =C2=
=B1 19%  perf-sched.wait_and_delay.count.do_syslog.part.0.kmsg_read.vfs_read
    282.50 =C2=B1  3%      +1.0%     285.33 =C2=B1  2%      +0.8%     284.8=
3 =C2=B1  3%  perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group=
_exit.__x64_sys_exit_group.do_syscall_64
    313.00 =C2=B1  2%      +0.5%     314.50            +1.9%     319.00 =C2=
=B1  2%  perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait=
4.do_syscall_64
    882.17 =C2=B1  7%      +0.8%     889.33 =C2=B1  7%      -1.9%     865.0=
0 =C2=B1 10%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.irq=
entry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    282.67 =C2=B1 27%     -13.9%     243.33 =C2=B1 32%      +5.0%     296.8=
3 =C2=B1 22%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.irq=
entry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      6715 =C2=B1  5%      -2.7%       6534 =C2=B1  6%      -0.6%       667=
3 =C2=B1  9%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.sys=
call_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      1.00 =C2=B1152%     -33.3%       0.67 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_and_delay.count.futex_wait_queue_me.futex_wait.do_=
futex.__x64_sys_futex
      0.00         +2e+103%      20.33 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.count.io_schedule.__lock_page_killable.filema=
p_fault.__do_fault
      1577 =C2=B1 27%     -19.1%       1276 =C2=B1 33%      -0.4%       157=
1 =C2=B1 27%  perf-sched.wait_and_delay.count.pipe_read.new_sync_read.vfs_r=
ead.ksys_read
      0.50 =C2=B1223%     +66.7%       0.83 =C2=B1223%      +0.0%       0.5=
0 =C2=B1223%  perf-sched.wait_and_delay.count.preempt_schedule_common.__con=
d_resched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
      0.33 =C2=B1223%    -100.0%       0.00           -50.0%       0.17 =C2=
=B1223%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_res=
ched.__do_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +1.5e+102%       1.50 =C2=B119=
5%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
down_write.generic_file_write_iter.new_sync_write
     10.17 =C2=B1106%     -37.7%       6.33 =C2=B1 83%     -37.7%       6.3=
3 =C2=B1129%  perf-sched.wait_and_delay.count.preempt_schedule_common.__con=
d_resched.generic_perform_write.__generic_file_write_iter.generic_file_writ=
e_iter
      2164 =C2=B1  3%      -1.0%       2141 =C2=B1  2%      +1.6%       219=
8 =C2=B1  3%  perf-sched.wait_and_delay.count.preempt_schedule_common.__con=
d_resched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
    281.33 =C2=B1  3%      +0.8%     283.50            +0.5%     282.67 =C2=
=B1  2%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_res=
ched.stop_one_cpu.sched_exec.bprm_execve
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
     17.67 =C2=B1 54%     +36.8%      24.17 =C2=B1 40%     -48.1%       9.1=
7 =C2=B1  4%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_cloc=
k.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    196.50 =C2=B1  7%      -0.3%     195.83 =C2=B1  4%      +0.9%     198.3=
3 =C2=B1  7%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_cloc=
k.poll_schedule_timeout.constprop.0.do_sys_poll
     80.17 =C2=B1  2%      -0.8%      79.50 =C2=B1  2%      -0.4%      79.8=
3 =C2=B1  2%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kt=
hread.ret_from_fork
      1815 =C2=B1  6%      +5.5%       1916 =C2=B1  7%      -3.4%       175=
3 =C2=B1 15%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_kthre=
ad.kthread.ret_from_fork
      2998 =C2=B1  2%      -0.7%       2978 =C2=B1  2%      +1.2%       303=
5 =C2=B1  3%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret=
_from_fork
    591.67 =C2=B1  5%      +2.6%     607.00 =C2=B1  2%      +0.8%     596.3=
3 =C2=B1  6%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_fro=
m_fork
    999.40            -0.0%     999.39            -0.0%     999.37        p=
erf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.[unknown]
      6262 =C2=B1  4%      +1.4%       6348 =C2=B1  2%      +4.0%       651=
3 =C2=B1  2%  perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_r=
ead.do_syscall_64
      1000            +0.0%       1000            +0.0%       1000        p=
erf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_na=
nosleep.do_syscall_64
      6288 =C2=B1  5%      +1.2%       6362 =C2=B1  2%      +3.7%       652=
0 =C2=B1  2%  perf-sched.wait_and_delay.max.ms.do_syslog.part.0.kmsg_read.v=
fs_read
      1729 =C2=B1 94%     -42.2%       1000           -42.2%       1000    =
    perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x=
64_sys_exit_group.do_syscall_64
      1018            +0.3%       1022            +0.5%       1023        p=
erf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
     53.78 =C2=B1152%     -67.7%      17.37 =C2=B1 24%     -71.6%      15.2=
9 =C2=B1 21%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.ir=
qentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      7.22 =C2=B1 50%    +363.1%      33.41 =C2=B1116%     -13.8%       6.2=
2 =C2=B1 62%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.ir=
qentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
     55.57 =C2=B1 46%     +29.7%      72.06 =C2=B1 41%     +27.6%      70.8=
9 =C2=B1 38%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.sy=
scall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    405.17 =C2=B1179%     +93.7%     784.98 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_and_delay.max.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00       +3.7e+100%       0.04 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.max.ms.io_schedule.__lock_page_killable.filem=
ap_fault.__do_fault
      6264 =C2=B1  4%      +1.4%       6351 =C2=B1  2%      +4.0%       651=
5 =C2=B1  2%  perf-sched.wait_and_delay.max.ms.pipe_read.new_sync_read.vfs_=
read.ksys_read
      1068 =C2=B1223%     -60.1%     426.41 =C2=B1223%      -2.4%       104=
2 =C2=B1223%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__co=
nd_resched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
    917.65 =C2=B1223%    -100.0%       0.00           +15.8%       1062 =C2=
=B1223%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_re=
sched.__do_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +2.1e+105%       2063 =C2=B114=
1%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.1e+105%       1077 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.down_write.generic_file_write_iter.new_sync_write
      4186 =C2=B1 66%     +22.1%       5110 =C2=B1 44%     -39.1%       254=
9 =C2=B1111%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__co=
nd_resched.generic_perform_write.__generic_file_write_iter.generic_file_wri=
te_iter
      2308 =C2=B1 25%      +1.1%       2333 =C2=B1 24%     -11.3%       204=
7 =C2=B1 36%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__co=
nd_resched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
     20.25 =C2=B1  3%      +2.3%      20.71 =C2=B1  7%      -2.4%      19.7=
6 =C2=B1  4%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__co=
nd_resched.stop_one_cpu.sched_exec.bprm_execve
    359.76 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      5932 =C2=B1  5%      -3.7%       5714 =C2=B1 11%      +3.4%       613=
7 =C2=B1  2%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clo=
ck.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      4684            -0.9%       4640            +0.1%       4690        p=
erf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedul=
e_timeout.constprop.0.do_sys_poll
    505.02            -0.0%     505.01            -0.0%     505.01        p=
erf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from=
_fork
    276.17 =C2=B1 32%     -11.1%     245.51 =C2=B1 17%      -6.3%     258.8=
4 =C2=B1 52%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_kthr=
ead.kthread.ret_from_fork
      7293 =C2=B1 18%     -12.8%       6359 =C2=B1 28%     -26.1%       538=
6 =C2=B1 15%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.re=
t_from_fork
      7627 =C2=B1  9%     +13.6%       8662 =C2=B1  8%     +17.0%       892=
2 =C2=B1  8%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_fr=
om_fork
    900.93            -0.2%     899.40            +0.2%     902.41        p=
erf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.[unknown]
      2174 =C2=B1 15%     -10.3%       1951 =C2=B1 11%      +4.5%       227=
1 =C2=B1 22%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
    786.58 =C2=B1  5%      +3.0%     809.83 =C2=B1  5%      -0.5%     782.3=
6        perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_s=
ys_nanosleep.do_syscall_64
      2116 =C2=B1  6%      -7.7%       1953 =C2=B1 11%      +7.6%       227=
6 =C2=B1 22%  perf-sched.wait_time.avg.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
    211.02 =C2=B1  4%      -2.5%     205.73            -2.0%     206.71    =
    perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sy=
s_exit_group.do_syscall_64
     86.31 =C2=B1  8%      +7.4%      92.73 =C2=B1  6%     +15.4%      99.6=
1 =C2=B1  9%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
      0.01 =C2=B1223%   +1871.1%       0.15 =C2=B1200%   +2244.4%       0.1=
8 =C2=B1223%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.27 =C2=B1 51%     -32.7%       0.18 =C2=B1 18%     -29.1%       0.1=
9 =C2=B1 11%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.13 =C2=B1 57%    +123.4%       0.29 =C2=B1 79%     -19.7%       0.1=
1 =C2=B1 20%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.12 =C2=B1110%    +171.4%       0.31 =C2=B1191%     -65.0%       0.0=
4 =C2=B1100%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_irq_work.[unknown]
      1.11 =C2=B1217%     -35.4%       0.72 =C2=B1206%     -99.3%       0.0=
1 =C2=B1125%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.17 =C2=B1  6%      +3.9%       0.17 =C2=B1  8%      +2.6%       0.1=
7 =C2=B1  5%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    119.81 =C2=B1156%     +84.0%     220.40 =C2=B1194%     -89.0%      13.2=
0 =C2=B1223%  perf-sched.wait_time.avg.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00        +7.8e+99%       0.01 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.io_schedule.__lock_page_killable.filemap_fa=
ult.__do_fault
     90.09 =C2=B1 37%     +22.5%     110.39 =C2=B1 31%      -3.9%      86.6=
0 =C2=B1 29%  perf-sched.wait_time.avg.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      1.28 =C2=B1 87%     -11.1%       1.14 =C2=B1104%      -9.3%       1.1=
6 =C2=B1105%  perf-sched.wait_time.avg.ms.pipe_write.new_sync_write.vfs_wri=
te.ksys_write
      0.00       +1.3e+100%       0.01 =C2=B1223% +1.8e+102%       1.84 =C2=
=B1219%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__get_free_pages.pgd_alloc
      0.00       +1.4e+100%       0.01 =C2=B1223% +1.4e+100%       0.01 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__pmd_alloc.copy_page_range
    379.68 =C2=B1208%     -74.7%      95.92 =C2=B1198%      -5.6%     358.5=
9 =C2=B1216%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
      0.00          -100.0%       0.00        +3.8e+99%       0.00 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.collapse_huge_page.khugepaged_scan_pmd
      0.03 =C2=B1141%   +5972.1%       1.81 =C2=B1223%     -10.1%       0.0=
3 =C2=B1141%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc
    468.38 =C2=B1218%     -98.2%       8.60 =C2=B1 90%    +128.8%       107=
1 =C2=B1221%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.__do_fault.do_fault.__handle_mm_fault
      0.00        +2.5e+99%       0.00 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.__km=
alloc.inotify_handle_inode_event.fsnotify
      0.03 =C2=B1141%    -100.0%       0.00        +14711.4%       4.10 =C2=
=B1142%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.__kmalloc.security_task_alloc.copy_process
      0.01 =C2=B1223%  +16979.0%       2.31 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.__kmalloc_node.__vmalloc_node_range.dup_task_struct
      0.00       +2.3e+102%       2.28 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.cgro=
up_can_fork.copy_process.kernel_clone
      0.00          -100.0%       0.00       +2.3e+102%       2.28 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.chan=
ge_p4d_range.change_protection.change_prot_numa
      1.30 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.chan=
ge_p4d_range.change_protection.mprotect_fixup
      2.13 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      4.91 =C2=B1105%     -76.4%       1.16 =C2=B1220%     -63.3%       1.8=
0 =C2=B1221%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.copy_pte_range.copy_page_range.dup_mmap
      8.56 =C2=B1 61%      +9.7%       9.40 =C2=B1 51%  +13115.7%       113=
1 =C2=B1191%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +8.6e+100%       0.09 =C2=B1223% +1.3e+101%       0.13 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.down_read.walk_component.link_path_walk
      0.47 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_clone.__split_vma
      0.01 =C2=B1223%    -100.0%       0.00         +9039.0%       1.17 =C2=
=B1220%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00       +1.4e+100%       0.01 =C2=B1223% +1.3e+100%       0.01 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_fork.dup_mmap
      0.07 =C2=B1 44%     -79.4%       0.01 =C2=B1223%     -81.1%       0.0=
1 =C2=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.down_write.dup_mmap.dup_mm
      0.00       +1.1e+105%       1077 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.generic_file_write_iter.new_sync_write
      2.13 =C2=B1223%     -54.8%       0.96 =C2=B1223%      -7.7%       1.9=
6 =C2=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.down_write.unlink_file_vma.free_pgtables
      9.96 =C2=B1 15%     -37.9%       6.19 =C2=B1 52%      +9.5%      10.9=
1 =C2=B1 14%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.dput.__fput.task_work_run
      0.00         +8e+101%       0.80 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.dput=
.terminate_walk.path_lookupat
    569.95 =C2=B1 73%     +61.8%     922.28 =C2=B1 68%     -47.6%     298.4=
3 =C2=B1125%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er
      0.01 =C2=B1104%      -8.1%       0.01 =C2=B1141%     -24.3%       0.0=
0 =C2=B1146%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.khugepaged.kthread.ret_from_fork
      0.00       +5.4e+100%       0.05 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.__alloc_file.alloc_empty_file
      3.46 =C2=B1152%    -100.0%       0.00           +18.7%       4.10 =C2=
=B1143%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.anon_vma_fork.dup_mmap
      1.81 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_fs_struct.copy_process
      0.00          -100.0%       0.00       +2.3e+102%       2.31 =C2=B122=
2%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.dup_fd.copy_process
      0.00          -100.0%       0.00       +2.3e+102%       2.29 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.dup_mm.copy_process
      0.00         +3e+100%       0.03 =C2=B1141% +2.3e+102%       2.32 =C2=
=B1221%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.prepare_creds.copy_creds
      0.00          -100.0%       0.00       +8.3e+101%       0.83 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.security_file_alloc.__alloc_file
      0.09 =C2=B1223%    -100.0%       0.00         +1403.3%       1.31 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_alloc.mmap_region
      0.07 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.vm_area_dup.__split_vma
      4.42 =C2=B1142%    -100.0%       0.00           -58.8%       1.82 =C2=
=B1221%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_dup.dup_mmap
      0.00          -100.0%       0.00       +2.3e+102%       2.30 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_node.alloc_vmap_area.__get_vm_area_node
      0.00       +3.2e+101%       0.32 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_trace.perf_event_mmap.mmap_region
      0.00          -100.0%       0.00        +5.5e+99%       0.01 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.futex_exit_release.exit_mm_release
      0.00       +6.6e+101%       0.66 =C2=B1222%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.perf_event_ctx_lock_nested.isra
      0.84 =C2=B1160%     +32.2%       1.11 =C2=B1128%    +662.3%       6.3=
8 =C2=B1125%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.perf_poll.do_sys_poll
      0.00          -100.0%       0.00       +2.2e+102%       2.16 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.pipe_write.new_sync_write
      0.00       +3.1e+101%       0.31 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.remo=
ve_vma.exit_mmap.mmput
      4.95 =C2=B1  9%      -2.0%       4.85 =C2=B1  8%      -5.4%       4.6=
8 =C2=B1 11%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
      0.00        +1.7e+98%       0.00 =C2=B1223%  +3.7e+99%       0.00 =C2=
=B1179%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.stop_one_cpu.sched_exec.bprm_execve
      0.01 =C2=B1223%  +15879.1%       2.29 =C2=B1223%      +0.0%       0.0=
1 =C2=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.uprobe_start_dup_mmap.dup_mmap.dup_mm
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.wp_p=
age_copy.__handle_mm_fault.handle_mm_fault
    359.47 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.ww_m=
utex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      0.14 =C2=B1223%    +832.9%       1.30 =C2=B1223%    +715.7%       1.1=
4 =C2=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.zap_pte_range.unmap_page_range.unmap_vmas
      2.72 =C2=B1  6%      +3.3%       2.81 =C2=B1  4%     -12.0%       2.4=
0 =C2=B1 47%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
    619.11 =C2=B1 13%      -6.1%     581.52 =C2=B1 15%     +20.7%     747.1=
2 =C2=B1  4%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
    120.65 =C2=B1  7%      +0.2%     120.88 =C2=B1  4%      -2.0%     118.2=
2 =C2=B1  8%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
    478.83            -0.0%     478.63            -0.0%     478.72        p=
erf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      3.34 =C2=B1 21%      -0.7%       3.31 =C2=B1  8%     +15.1%       3.8=
4 =C2=B1  4%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
      5.47 =C2=B1  7%      -5.0%       5.20 =C2=B1  6%      +5.9%       5.7=
9 =C2=B1 11%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.01 =C2=B1 52%      -0.0%       0.01 =C2=B1 56%     -20.0%       0.0=
1 =C2=B1 44%  perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_complet=
ion.stop_one_cpu.affine_move_task
    619.04 =C2=B1  2%      +0.5%     622.27            +0.4%     621.28 =C2=
=B1  2%  perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      1.96 =C2=B1 14%      -4.6%       1.87 =C2=B1 12%      +9.0%       2.1=
4 =C2=B1 16%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
    541.27 =C2=B1  4%      -0.8%     536.77 =C2=B1  4%      +2.5%     554.8=
8 =C2=B1  3%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fo=
rk
    999.39            -0.0%     999.38            -0.0%     999.36        p=
erf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.[unknown]
      6261 =C2=B1  4%      +1.4%       6348 =C2=B1  2%      +4.0%       651=
2 =C2=B1  2%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      1000            +0.0%       1000            +0.0%       1000        p=
erf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosle=
ep.do_syscall_64
      6273 =C2=B1  5%      +1.3%       6355 =C2=B1  2%      +3.9%       651=
6 =C2=B1  2%  perf-sched.wait_time.max.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      1729 =C2=B1 94%     -42.2%       1000           -42.2%       1000    =
    perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sy=
s_exit_group.do_syscall_64
      1018            +0.3%       1022            +0.5%       1023        p=
erf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 =C2=B1223%   +1922.2%       0.15 =C2=B1194%   +4977.8%       0.3=
8 =C2=B1223%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_exc_page_fault.[unknown]
     52.64 =C2=B1157%     -69.6%      16.01 =C2=B1 26%     -75.3%      13.0=
0        perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      7.22 =C2=B1 50%    +363.1%      33.41 =C2=B1116%     -13.8%       6.2=
2 =C2=B1 62%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.20 =C2=B1116%    +209.0%       0.62 =C2=B1190%     -72.5%       0.0=
6 =C2=B1121%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_irq_work.[unknown]
      2.19 =C2=B1220%     -66.2%       0.74 =C2=B1199%     -99.5%       0.0=
1 =C2=B1138%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     55.56 =C2=B1 46%     +28.0%      71.14 =C2=B1 43%     +27.0%      70.5=
8 =C2=B1 39%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    405.17 =C2=B1179%    +105.6%     833.04 =C2=B1208%     -93.5%      26.3=
9 =C2=B1223%  perf-sched.wait_time.max.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00       +3.7e+100%       0.04 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.io_schedule.__lock_page_killable.filemap_fa=
ult.__do_fault
      6264 =C2=B1  4%      +1.4%       6351 =C2=B1  2%      +4.0%       651=
5 =C2=B1  2%  perf-sched.wait_time.max.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      1.28 =C2=B1 87%     -11.1%       1.14 =C2=B1104%      -9.3%       1.1=
6 =C2=B1105%  perf-sched.wait_time.max.ms.pipe_write.new_sync_write.vfs_wri=
te.ksys_write
      0.00       +1.3e+100%       0.01 =C2=B1223% +1.8e+102%       1.84 =C2=
=B1219%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__get_free_pages.pgd_alloc
      0.00       +1.4e+100%       0.01 =C2=B1223% +1.4e+100%       0.01 =C2=
=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__pmd_alloc.copy_page_range
      1125 =C2=B1210%     -61.1%     437.24 =C2=B1216%      -6.3%       105=
4 =C2=B1220%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
      0.00          -100.0%       0.00        +3.8e+99%       0.00 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.collapse_huge_page.khugepaged_scan_pmd
      0.03 =C2=B1141%   +5972.1%       1.81 =C2=B1223%     -10.1%       0.0=
3 =C2=B1141%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc
    931.70 =C2=B1219%     -98.6%      12.73 =C2=B1 99%     +15.2%       107=
3 =C2=B1220%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.__do_fault.do_fault.__handle_mm_fault
      0.00          +5e+99%       0.01 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.__km=
alloc.inotify_handle_inode_event.fsnotify
      0.03 =C2=B1141%    -100.0%       0.00        +14711.4%       4.10 =C2=
=B1142%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__kmalloc.security_task_alloc.copy_process
      0.01 =C2=B1223%  +16979.0%       2.31 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__kmalloc_node.__vmalloc_node_range.dup_task_struct
      0.00       +2.3e+102%       2.28 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.cgro=
up_can_fork.copy_process.kernel_clone
      0.00          -100.0%       0.00       +2.3e+102%       2.28 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.chan=
ge_p4d_range.change_protection.change_prot_numa
      1.30 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.chan=
ge_p4d_range.change_protection.mprotect_fixup
      2.13 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      6.22 =C2=B1100%     -63.1%       2.29 =C2=B1222%     -71.0%       1.8=
0 =C2=B1221%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.copy_pte_range.copy_page_range.dup_mmap
     11.82 =C2=B1 48%      -8.4%      10.82 =C2=B1 44%  +17558.3%       208=
6 =C2=B1139%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +8.6e+100%       0.09 =C2=B1223% +1.3e+101%       0.13 =C2=
=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.down_read.walk_component.link_path_walk
      0.47 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_clone.__split_vma
      0.01 =C2=B1223%    -100.0%       0.00        +15878.2%       2.32 =C2=
=B1221%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00       +1.4e+100%       0.01 =C2=B1223% +1.3e+100%       0.01 =C2=
=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_fork.dup_mmap
      0.07 =C2=B1 44%     -79.4%       0.01 =C2=B1223%     -81.1%       0.0=
1 =C2=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.down_write.dup_mmap.dup_mm
      0.00       +1.1e+105%       1077 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_write.generic_file_write_iter.new_sync_write
      2.13 =C2=B1223%     -54.8%       0.96 =C2=B1223%      -7.7%       1.9=
6 =C2=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.down_write.unlink_file_vma.free_pgtables
     13.16           -16.7%      10.97 =C2=B1 44%      +0.0%      13.16    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.dput=
.__fput.task_work_run
      0.00         +8e+101%       0.80 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.dput=
.terminate_walk.path_lookupat
      4189 =C2=B1 66%     +22.1%       5113 =C2=B1 44%     -38.7%       256=
6 =C2=B1110%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er
      0.01 =C2=B1104%      -8.1%       0.01 =C2=B1141%     -24.3%       0.0=
0 =C2=B1146%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.khugepaged.kthread.ret_from_fork
      0.00       +5.4e+100%       0.05 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.__alloc_file.alloc_empty_file
      4.60 =C2=B1141%    -100.0%       0.00           -10.8%       4.10 =C2=
=B1143%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.anon_vma_fork.dup_mmap
      1.81 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_fs_struct.copy_process
      0.00          -100.0%       0.00       +2.3e+102%       2.31 =C2=B122=
2%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.dup_fd.copy_process
      0.00          -100.0%       0.00       +2.3e+102%       2.29 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.dup_mm.copy_process
      0.00         +3e+100%       0.03 =C2=B1141% +2.3e+102%       2.32 =C2=
=B1221%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.prepare_creds.copy_creds
      0.00          -100.0%       0.00       +1.6e+102%       1.64 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.security_file_alloc.__alloc_file
      0.09 =C2=B1223%    -100.0%       0.00         +1403.3%       1.31 =C2=
=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_alloc.mmap_region
      0.13 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.vm_area_dup.__split_vma
      4.60 =C2=B1141%    -100.0%       0.00           -60.4%       1.82 =C2=
=B1221%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_dup.dup_mmap
      0.00          -100.0%       0.00       +2.3e+102%       2.30 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_node.alloc_vmap_area.__get_vm_area_node
      0.00       +6.4e+101%       0.64 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_trace.perf_event_mmap.mmap_region
      0.00          -100.0%       0.00        +5.5e+99%       0.01 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.futex_exit_release.exit_mm_release
      0.00       +6.6e+101%       0.66 =C2=B1222%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.perf_event_ctx_lock_nested.isra
      1.53 =C2=B1186%     -23.7%       1.17 =C2=B1121%    +543.7%       9.8=
3 =C2=B1152%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.perf_poll.do_sys_poll
      0.00          -100.0%       0.00       +2.2e+102%       2.16 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.pipe_write.new_sync_write
      0.00       +3.1e+101%       0.31 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.remo=
ve_vma.exit_mmap.mmput
      2308 =C2=B1 25%      +0.9%       2328 =C2=B1 24%     -11.3%       204=
7 =C2=B1 36%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
      0.02 =C2=B1142%     +40.5%       0.03 =C2=B1205%   +5256.2%       1.0=
8 =C2=B1172%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.sched_exec.bprm_execve
      0.01 =C2=B1223%  +15879.1%       2.29 =C2=B1223%      +0.0%       0.0=
1 =C2=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.uprobe_start_dup_mmap.dup_mmap.dup_mm
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.wp_p=
age_copy.__handle_mm_fault.handle_mm_fault
    359.47 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.ww_m=
utex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      0.14 =C2=B1223%    +832.9%       1.30 =C2=B1223%    +715.7%       1.1=
4 =C2=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.zap_pte_range.unmap_page_range.unmap_vmas
      5.00            -0.1%       4.99           +73.3%       8.66 =C2=B112=
2%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      5932 =C2=B1  5%      -3.7%       5714 =C2=B1 11%      +3.4%       613=
7 =C2=B1  2%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      4684            -0.9%       4640            +0.1%       4690        p=
erf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.poll_schedule_tim=
eout.constprop.0.do_sys_poll
    505.00            -0.0%     505.00            -0.0%     505.00        p=
erf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      3.34 =C2=B1 21%      -0.7%       3.31 =C2=B1  8%     +15.1%       3.8=
4 =C2=B1  4%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
    276.16 =C2=B1 32%     -11.1%     245.49 =C2=B1 17%      -6.3%     258.8=
3 =C2=B1 52%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.01 =C2=B1 52%      +4.2%       0.01 =C2=B1 54%     -19.4%       0.0=
1 =C2=B1 45%  perf-sched.wait_time.max.ms.schedule_timeout.wait_for_complet=
ion.stop_one_cpu.affine_move_task
      7293 =C2=B1 18%     -12.8%       6359 =C2=B1 28%     -26.1%       538=
6 =C2=B1 15%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
     11.63 =C2=B1  7%      +7.5%      12.50 =C2=B1  3%      +6.0%      12.3=
2 =C2=B1  6%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
      7627 =C2=B1  9%     +13.6%       8662 =C2=B1  8%     +17.0%       892=
2 =C2=B1  8%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fo=
rk
    382430            -0.0%     382412            -0.0%     382402        s=
labinfo.Acpi-Operand.active_objs
      6830            -0.0%       6828            -0.0%       6829        s=
labinfo.Acpi-Operand.active_slabs
    382510            -0.0%     382422            -0.0%     382448        s=
labinfo.Acpi-Operand.num_objs
      6830            -0.0%       6828            -0.0%       6829        s=
labinfo.Acpi-Operand.num_slabs
      1338 =C2=B1  9%     +11.8%       1496 =C2=B1  8%      -6.4%       125=
3 =C2=B1  6%  slabinfo.Acpi-Parse.active_objs
     18.33 =C2=B1  9%     +11.8%      20.50 =C2=B1  8%      -6.4%      17.1=
7 =C2=B1  6%  slabinfo.Acpi-Parse.active_slabs
      1338 =C2=B1  9%     +11.8%       1496 =C2=B1  8%      -6.4%       125=
3 =C2=B1  6%  slabinfo.Acpi-Parse.num_objs
     18.33 =C2=B1  9%     +11.8%      20.50 =C2=B1  8%      -6.4%      17.1=
7 =C2=B1  6%  slabinfo.Acpi-Parse.num_slabs
      8034 =C2=B1  6%      +4.1%       8360 =C2=B1  9%      -3.0%       779=
5 =C2=B1  9%  slabinfo.Acpi-State.active_objs
    157.17 =C2=B1  6%      +4.0%     163.50 =C2=B1  9%      -3.0%     152.5=
0 =C2=B1  9%  slabinfo.Acpi-State.active_slabs
      8034 =C2=B1  6%      +4.1%       8360 =C2=B1  9%      -3.0%       779=
5 =C2=B1  9%  slabinfo.Acpi-State.num_objs
    157.17 =C2=B1  6%      +4.0%     163.50 =C2=B1  9%      -3.0%     152.5=
0 =C2=B1  9%  slabinfo.Acpi-State.num_slabs
      2911 =C2=B1  3%      -2.7%       2833 =C2=B1  8%      -1.7%       286=
0 =C2=B1  9%  slabinfo.PING.active_objs
     90.33 =C2=B1  3%      -2.6%      88.00 =C2=B1  7%      -1.3%      89.1=
7 =C2=B1  9%  slabinfo.PING.active_slabs
      2911 =C2=B1  3%      -2.7%       2833 =C2=B1  8%      -1.7%       286=
0 =C2=B1  9%  slabinfo.PING.num_objs
     90.33 =C2=B1  3%      -2.6%      88.00 =C2=B1  7%      -1.3%      89.1=
7 =C2=B1  9%  slabinfo.PING.num_slabs
    384.00            +0.0%     384.00            +0.0%     384.00        s=
labinfo.RAW.active_objs
     12.00            +0.0%      12.00            +0.0%      12.00        s=
labinfo.RAW.active_slabs
    384.00            +0.0%     384.00            +0.0%     384.00        s=
labinfo.RAW.num_objs
     12.00            +0.0%      12.00            +0.0%      12.00        s=
labinfo.RAW.num_slabs
    221.00 =C2=B1  5%      -2.0%     216.67 =C2=B1  5%      -3.9%     212.3=
3 =C2=B1  4%  slabinfo.RAWv6.active_objs
      8.50 =C2=B1  5%      -2.0%       8.33 =C2=B1  5%      -3.9%       8.1=
7 =C2=B1  4%  slabinfo.RAWv6.active_slabs
    221.00 =C2=B1  5%      -2.0%     216.67 =C2=B1  5%      -3.9%     212.3=
3 =C2=B1  4%  slabinfo.RAWv6.num_objs
      8.50 =C2=B1  5%      -2.0%       8.33 =C2=B1  5%      -3.9%       8.1=
7 =C2=B1  4%  slabinfo.RAWv6.num_slabs
     49.00 =C2=B1 14%      +9.5%      53.67 =C2=B1  9%     +14.3%      56.0=
0        slabinfo.TCP.active_objs
      3.50 =C2=B1 14%      +9.5%       3.83 =C2=B1  9%     +14.3%       4.0=
0        slabinfo.TCP.active_slabs
     49.00 =C2=B1 14%      +9.5%      53.67 =C2=B1  9%     +14.3%      56.0=
0        slabinfo.TCP.num_objs
      3.50 =C2=B1 14%      +9.5%       3.83 =C2=B1  9%     +14.3%       4.0=
0        slabinfo.TCP.num_slabs
     39.00            +0.0%      39.00            +0.0%      39.00        s=
labinfo.TCPv6.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.TCPv6.active_slabs
     39.00            +0.0%      39.00            +0.0%      39.00        s=
labinfo.TCPv6.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.TCPv6.num_slabs
    151.00 =C2=B1 10%      +5.0%     158.50 =C2=B1  5%      -3.3%     146.0=
0 =C2=B1  7%  slabinfo.UDPv6.active_objs
      5.67 =C2=B1  8%      +2.9%       5.83 =C2=B1  6%      -5.9%       5.3=
3 =C2=B1  8%  slabinfo.UDPv6.active_slabs
    151.00 =C2=B1 10%      +5.0%     158.50 =C2=B1  5%      -3.3%     146.0=
0 =C2=B1  7%  slabinfo.UDPv6.num_objs
      5.67 =C2=B1  8%      +2.9%       5.83 =C2=B1  6%      -5.9%       5.3=
3 =C2=B1  8%  slabinfo.UDPv6.num_slabs
     37124 =C2=B1  2%      -1.2%      36674 =C2=B1  3%      +0.9%      3745=
1 =C2=B1  3%  slabinfo.anon_vma.active_objs
    806.50 =C2=B1  2%      -1.2%     796.50 =C2=B1  3%      +0.9%     813.5=
0 =C2=B1  3%  slabinfo.anon_vma.active_slabs
     37124 =C2=B1  2%      -1.2%      36674 =C2=B1  3%      +0.9%      3745=
1 =C2=B1  3%  slabinfo.anon_vma.num_objs
    806.50 =C2=B1  2%      -1.2%     796.50 =C2=B1  3%      +0.9%     813.5=
0 =C2=B1  3%  slabinfo.anon_vma.num_slabs
     80309            -1.4%      79189 =C2=B1  2%      +0.8%      80951 =C2=
=B1  2%  slabinfo.anon_vma_chain.active_objs
      1254            -1.4%       1236 =C2=B1  2%      +0.8%       1264 =C2=
=B1  2%  slabinfo.anon_vma_chain.active_slabs
     80309            -1.4%      79189 =C2=B1  2%      +0.8%      80951 =C2=
=B1  2%  slabinfo.anon_vma_chain.num_objs
      1254            -1.4%       1236 =C2=B1  2%      +0.8%       1264 =C2=
=B1  2%  slabinfo.anon_vma_chain.num_slabs
     43.33 =C2=B1 17%      -7.7%      40.00            +0.0%      43.33 =C2=
=B1 17%  slabinfo.bdev_cache.active_objs
      2.17 =C2=B1 17%      -7.7%       2.00            +0.0%       2.17 =C2=
=B1 17%  slabinfo.bdev_cache.active_slabs
     43.33 =C2=B1 17%      -7.7%      40.00            +0.0%      43.33 =C2=
=B1 17%  slabinfo.bdev_cache.num_objs
      2.17 =C2=B1 17%      -7.7%       2.00            +0.0%       2.17 =C2=
=B1 17%  slabinfo.bdev_cache.num_slabs
     24.00 =C2=B1 33%     +33.3%      32.00            +0.0%      24.00 =C2=
=B1 33%  slabinfo.biovec-128.active_objs
      1.50 =C2=B1 33%     +33.3%       2.00            +0.0%       1.50 =C2=
=B1 33%  slabinfo.biovec-128.active_slabs
     24.00 =C2=B1 33%     +33.3%      32.00            +0.0%      24.00 =C2=
=B1 33%  slabinfo.biovec-128.num_objs
      1.50 =C2=B1 33%     +33.3%       2.00            +0.0%       1.50 =C2=
=B1 33%  slabinfo.biovec-128.num_slabs
    277.33 =C2=B1 25%      -1.9%     272.00 =C2=B1 26%     -13.5%     240.0=
0 =C2=B1 16%  slabinfo.biovec-64.active_objs
      8.67 =C2=B1 25%      -1.9%       8.50 =C2=B1 26%     -13.5%       7.5=
0 =C2=B1 16%  slabinfo.biovec-64.active_slabs
    277.33 =C2=B1 25%      -1.9%     272.00 =C2=B1 26%     -13.5%     240.0=
0 =C2=B1 16%  slabinfo.biovec-64.num_objs
      8.67 =C2=B1 25%      -1.9%       8.50 =C2=B1 26%     -13.5%       7.5=
0 =C2=B1 16%  slabinfo.biovec-64.num_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        s=
labinfo.biovec-max.active_objs
      8.00            +0.0%       8.00            +0.0%       8.00        s=
labinfo.biovec-max.active_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        s=
labinfo.biovec-max.num_objs
      8.00            +0.0%       8.00            +0.0%       8.00        s=
labinfo.biovec-max.num_slabs
     78.00            +0.0%      78.00            +8.3%      84.50 =C2=B1 1=
7%  slabinfo.buffer_head.active_objs
      2.00            +0.0%       2.00            +8.3%       2.17 =C2=B1 1=
7%  slabinfo.buffer_head.active_slabs
     78.00            +0.0%      78.00            +8.3%      84.50 =C2=B1 1=
7%  slabinfo.buffer_head.num_objs
      2.00            +0.0%       2.00            +8.3%       2.17 =C2=B1 1=
7%  slabinfo.buffer_head.num_slabs
     10150            -1.4%      10009 =C2=B1  2%      +0.2%      10173 =C2=
=B1  2%  slabinfo.cred_jar.active_objs
    241.00            -1.3%     237.83 =C2=B1  2%      +0.2%     241.50 =C2=
=B1  2%  slabinfo.cred_jar.active_slabs
     10150            -1.4%      10009 =C2=B1  2%      +0.2%      10173 =C2=
=B1  2%  slabinfo.cred_jar.num_objs
    241.00            -1.3%     237.83 =C2=B1  2%      +0.2%     241.50 =C2=
=B1  2%  slabinfo.cred_jar.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.num_slabs
    169835            +1.3%     172012 =C2=B1  3%      +1.5%     172325    =
    slabinfo.dentry.active_objs
      4077            +1.2%       4125 =C2=B1  3%      +1.5%       4139    =
    slabinfo.dentry.active_slabs
    171255            +1.2%     173272 =C2=B1  3%      +1.5%     173866    =
    slabinfo.dentry.num_objs
      4077            +1.2%       4125 =C2=B1  3%      +1.5%       4139    =
    slabinfo.dentry.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.num_slabs
      1366 =C2=B1 18%      -3.6%       1316 =C2=B1 11%     -10.6%       122=
2 =C2=B1  9%  slabinfo.dmaengine-unmap-16.active_objs
     32.00 =C2=B1 17%      -3.6%      30.83 =C2=B1 11%     -10.9%      28.5=
0 =C2=B1  9%  slabinfo.dmaengine-unmap-16.active_slabs
      1366 =C2=B1 18%      -3.6%       1316 =C2=B1 11%     -10.6%       122=
2 =C2=B1  9%  slabinfo.dmaengine-unmap-16.num_objs
     32.00 =C2=B1 17%      -3.6%      30.83 =C2=B1 11%     -10.9%      28.5=
0 =C2=B1  9%  slabinfo.dmaengine-unmap-16.num_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.active_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.num_slabs
     32407 =C2=B1  9%      -4.4%      30987 =C2=B1 15%      +6.7%      3458=
3 =C2=B1 16%  slabinfo.ep_head.active_objs
    126.33 =C2=B1  9%      -4.5%     120.67 =C2=B1 16%      +6.7%     134.8=
3 =C2=B1 16%  slabinfo.ep_head.active_slabs
     32407 =C2=B1  9%      -4.4%      30987 =C2=B1 15%      +6.7%      3458=
3 =C2=B1 16%  slabinfo.ep_head.num_objs
    126.33 =C2=B1  9%      -4.5%     120.67 =C2=B1 16%      +6.7%     134.8=
3 =C2=B1 16%  slabinfo.ep_head.num_slabs
      1166 =C2=B1 12%      +1.0%       1177 =C2=B1 14%      -1.9%       114=
4 =C2=B1 10%  slabinfo.file_lock_cache.active_objs
     31.33 =C2=B1 12%      +1.1%      31.67 =C2=B1 13%      -2.7%      30.5=
0 =C2=B1 10%  slabinfo.file_lock_cache.active_slabs
      1166 =C2=B1 12%      +1.0%       1177 =C2=B1 14%      -1.9%       114=
4 =C2=B1 10%  slabinfo.file_lock_cache.num_objs
     31.33 =C2=B1 12%      +1.1%      31.67 =C2=B1 13%      -2.7%      30.5=
0 =C2=B1 10%  slabinfo.file_lock_cache.num_slabs
      6601 =C2=B1  4%      -0.4%       6578 =C2=B1 11%      +2.6%       677=
4 =C2=B1  8%  slabinfo.files_cache.active_objs
    143.17 =C2=B1  4%      -0.5%     142.50 =C2=B1 11%      +2.7%     147.0=
0 =C2=B1  8%  slabinfo.files_cache.active_slabs
      6601 =C2=B1  4%      -0.4%       6578 =C2=B1 11%      +2.6%       677=
4 =C2=B1  8%  slabinfo.files_cache.num_objs
    143.17 =C2=B1  4%      -0.5%     142.50 =C2=B1 11%      +2.7%     147.0=
0 =C2=B1  8%  slabinfo.files_cache.num_slabs
     75065 =C2=B1  3%      +3.5%      77711 =C2=B1  9%      +2.7%      7708=
2 =C2=B1  5%  slabinfo.filp.active_objs
      1178 =C2=B1  3%      +3.5%       1219 =C2=B1 10%      +2.9%       121=
1 =C2=B1  5%  slabinfo.filp.active_slabs
     75430 =C2=B1  3%      +3.5%      78047 =C2=B1 10%      +2.9%      7759=
4 =C2=B1  5%  slabinfo.filp.num_objs
      1178 =C2=B1  3%      +3.5%       1219 =C2=B1 10%      +2.9%       121=
1 =C2=B1  5%  slabinfo.filp.num_slabs
      2575 =C2=B1 10%      +2.7%       2645 =C2=B1 10%     +10.6%       284=
7 =C2=B1 13%  slabinfo.fsnotify_mark_connector.active_objs
     20.00 =C2=B1 10%      +3.3%      20.67 =C2=B1 10%     +10.0%      22.0=
0 =C2=B1 13%  slabinfo.fsnotify_mark_connector.active_slabs
      2575 =C2=B1 10%      +2.7%       2645 =C2=B1 10%     +10.6%       284=
7 =C2=B1 13%  slabinfo.fsnotify_mark_connector.num_objs
     20.00 =C2=B1 10%      +3.3%      20.67 =C2=B1 10%     +10.0%      22.0=
0 =C2=B1 13%  slabinfo.fsnotify_mark_connector.num_slabs
     50405            +0.1%      50433            -0.1%      50362        s=
labinfo.ftrace_event_field.active_objs
    593.00            +0.1%     593.33            -0.1%     592.50        s=
labinfo.ftrace_event_field.active_slabs
     50405            +0.1%      50433            -0.1%      50362        s=
labinfo.ftrace_event_field.num_objs
    593.00            +0.1%     593.33            -0.1%     592.50        s=
labinfo.ftrace_event_field.num_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.hugetlbfs_inode_cache.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.active_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.hugetlbfs_inode_cache.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.num_slabs
     96529            -0.6%      95978            -0.5%      96025        s=
labinfo.inode_cache.active_objs
      1790            -0.6%       1780            -0.5%       1781        s=
labinfo.inode_cache.active_slabs
     96720            -0.6%      96163            -0.5%      96221        s=
labinfo.inode_cache.num_objs
      1790            -0.6%       1780            -0.5%       1781        s=
labinfo.inode_cache.num_slabs
     44.00            +0.0%      44.00            +0.0%      44.00        s=
labinfo.ip6-frags.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.ip6-frags.active_slabs
     44.00            +0.0%      44.00            +0.0%      44.00        s=
labinfo.ip6-frags.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.ip6-frags.num_slabs
    130233            -0.2%     130010            +0.2%     130556        s=
labinfo.kernfs_node_cache.active_objs
      2034            -0.2%       2031            +0.2%       2039        s=
labinfo.kernfs_node_cache.active_slabs
    130233            -0.2%     130010            +0.2%     130556        s=
labinfo.kernfs_node_cache.num_objs
      2034            -0.2%       2031            +0.2%       2039        s=
labinfo.kernfs_node_cache.num_slabs
      1847 =C2=B1  8%      -7.2%       1714 =C2=B1  7%      -0.6%       183=
5 =C2=B1  8%  slabinfo.khugepaged_mm_slot.active_objs
     50.33 =C2=B1  9%      -7.3%      46.67 =C2=B1  7%      -0.7%      50.0=
0 =C2=B1  8%  slabinfo.khugepaged_mm_slot.active_slabs
      1847 =C2=B1  8%      -7.2%       1714 =C2=B1  7%      -0.6%       183=
5 =C2=B1  8%  slabinfo.khugepaged_mm_slot.num_objs
     50.33 =C2=B1  9%      -7.3%      46.67 =C2=B1  7%      -0.7%      50.0=
0 =C2=B1  8%  slabinfo.khugepaged_mm_slot.num_slabs
     15107            -0.4%      15048            -0.2%      15075        s=
labinfo.kmalloc-128.active_objs
    238.33            -0.7%     236.67            -0.3%     237.67        s=
labinfo.kmalloc-128.active_slabs
     15284            -0.7%      15181            -0.3%      15243        s=
labinfo.kmalloc-128.num_objs
    238.33            -0.7%     236.67            -0.3%     237.67        s=
labinfo.kmalloc-128.num_slabs
     61993            -0.3%      61820            -0.2%      61881        s=
labinfo.kmalloc-16.active_objs
    242.67            -0.1%     242.33            -0.1%     242.50        s=
labinfo.kmalloc-16.active_slabs
     62122            -0.1%      62037            -0.1%      62080        s=
labinfo.kmalloc-16.num_objs
    242.67            -0.1%     242.33            -0.1%     242.50        s=
labinfo.kmalloc-16.num_slabs
     10584            -1.0%      10477            -1.1%      10466        s=
labinfo.kmalloc-192.active_objs
    258.00            -1.0%     255.50            -1.2%     255.00        s=
labinfo.kmalloc-192.active_slabs
     10842            -1.0%      10731            -1.2%      10710        s=
labinfo.kmalloc-192.num_objs
    258.00            -1.0%     255.50            -1.2%     255.00        s=
labinfo.kmalloc-192.num_slabs
      9964 =C2=B1  2%      +0.8%      10039 =C2=B1  2%      +0.9%      1005=
1 =C2=B1  2%  slabinfo.kmalloc-1k.active_objs
    317.67 =C2=B1  2%      +0.6%     319.67 =C2=B1  2%      +0.7%     320.0=
0 =C2=B1  2%  slabinfo.kmalloc-1k.active_slabs
     10176 =C2=B1  2%      +0.7%      10246 =C2=B1  2%      +0.7%      1025=
2 =C2=B1  2%  slabinfo.kmalloc-1k.num_objs
    317.67 =C2=B1  2%      +0.6%     319.67 =C2=B1  2%      +0.7%     320.0=
0 =C2=B1  2%  slabinfo.kmalloc-1k.num_slabs
     16719            -0.1%      16701            -0.1%      16707        s=
labinfo.kmalloc-256.active_objs
    265.50            +0.1%     265.67            +0.5%     266.83        s=
labinfo.kmalloc-256.active_slabs
     17020            +0.2%      17052            +0.4%      17095        s=
labinfo.kmalloc-256.num_objs
    265.50            +0.1%     265.67            +0.5%     266.83        s=
labinfo.kmalloc-256.num_slabs
     12125            -0.6%      12058            +1.0%      12240 =C2=B1  =
2%  slabinfo.kmalloc-2k.active_objs
    770.67            -0.5%     766.67            +0.8%     777.17 =C2=B1  =
2%  slabinfo.kmalloc-2k.active_slabs
     12334            -0.5%      12273            +0.9%      12441        s=
labinfo.kmalloc-2k.num_objs
    770.67            -0.5%     766.67            +0.8%     777.17 =C2=B1  =
2%  slabinfo.kmalloc-2k.num_slabs
    137577            +0.7%     138500            -0.9%     136311        s=
labinfo.kmalloc-32.active_objs
      1078            +0.8%       1086            -0.9%       1068        s=
labinfo.kmalloc-32.active_slabs
    138071            +0.7%     139060            -0.9%     136772        s=
labinfo.kmalloc-32.num_objs
      1078            +0.8%       1086            -0.9%       1068        s=
labinfo.kmalloc-32.num_slabs
      3140            -0.2%       3132            -0.6%       3120        s=
labinfo.kmalloc-4k.active_objs
    396.83            +0.2%     397.67            -0.5%     394.83        s=
labinfo.kmalloc-4k.active_slabs
      3179            +0.1%       3183            -0.6%       3161        s=
labinfo.kmalloc-4k.num_objs
    396.83            +0.2%     397.67            -0.5%     394.83        s=
labinfo.kmalloc-4k.num_slabs
     28067 =C2=B1  2%      +1.2%      28411 =C2=B1  3%      +0.3%      2813=
9 =C2=B1  3%  slabinfo.kmalloc-512.active_objs
    444.17 =C2=B1  2%      +1.3%     450.00 =C2=B1  4%      -0.1%     443.6=
7 =C2=B1  3%  slabinfo.kmalloc-512.active_slabs
     28466 =C2=B1  2%      +1.3%      28850 =C2=B1  3%      -0.1%      2842=
6 =C2=B1  3%  slabinfo.kmalloc-512.num_objs
    444.17 =C2=B1  2%      +1.3%     450.00 =C2=B1  4%      -0.1%     443.6=
7 =C2=B1  3%  slabinfo.kmalloc-512.num_slabs
     88949            -0.1%      88878            +0.1%      89023        s=
labinfo.kmalloc-64.active_objs
      1394            +0.0%       1394            +0.2%       1396        s=
labinfo.kmalloc-64.active_slabs
     89251            +0.0%      89252            +0.2%      89396        s=
labinfo.kmalloc-64.num_objs
      1394            +0.0%       1394            +0.2%       1396        s=
labinfo.kmalloc-64.num_slabs
    105170            +0.1%     105276            -0.2%     105007        s=
labinfo.kmalloc-8.active_objs
    211.33            +0.4%     212.17            +0.2%     211.67        s=
labinfo.kmalloc-8.active_slabs
    108237            +0.7%     108949            +0.3%     108542        s=
labinfo.kmalloc-8.num_objs
    211.33            +0.4%     212.17            +0.2%     211.67        s=
labinfo.kmalloc-8.num_slabs
      1481            -0.0%       1481            -0.1%       1480        s=
labinfo.kmalloc-8k.active_objs
    383.50            -0.1%     383.17            -0.2%     382.83        s=
labinfo.kmalloc-8k.active_slabs
      1535            -0.1%       1535            -0.1%       1534        s=
labinfo.kmalloc-8k.num_objs
    383.50            -0.1%     383.17            -0.2%     382.83        s=
labinfo.kmalloc-8k.num_slabs
     15674 =C2=B1  3%      -0.2%      15642 =C2=B1  2%      +1.7%      1593=
5        slabinfo.kmalloc-96.active_objs
    375.83 =C2=B1  3%      -0.2%     375.17            +1.6%     382.00    =
    slabinfo.kmalloc-96.active_slabs
     15804 =C2=B1  3%      -0.2%      15767 =C2=B1  2%      +1.7%      1607=
1        slabinfo.kmalloc-96.num_objs
    375.83 =C2=B1  3%      -0.2%     375.17            +1.6%     382.00    =
    slabinfo.kmalloc-96.num_slabs
    576.00 =C2=B1  6%      +9.3%     629.33 =C2=B1  9%     +13.0%     651.0=
0 =C2=B1  6%  slabinfo.kmalloc-rcl-128.active_objs
      9.00 =C2=B1  6%      +9.3%       9.83 =C2=B1  9%     +13.0%      10.1=
7 =C2=B1  6%  slabinfo.kmalloc-rcl-128.active_slabs
    576.00 =C2=B1  6%      +9.3%     629.33 =C2=B1  9%     +13.0%     651.0=
0 =C2=B1  6%  slabinfo.kmalloc-rcl-128.num_objs
      9.00 =C2=B1  6%      +9.3%       9.83 =C2=B1  9%     +13.0%      10.1=
7 =C2=B1  6%  slabinfo.kmalloc-rcl-128.num_slabs
     91.00 =C2=B1 17%      -7.7%      84.00            +0.0%      91.00 =C2=
=B1 17%  slabinfo.kmalloc-rcl-192.active_objs
      2.17 =C2=B1 17%      -7.7%       2.00            +0.0%       2.17 =C2=
=B1 17%  slabinfo.kmalloc-rcl-192.active_slabs
     91.00 =C2=B1 17%      -7.7%      84.00            +0.0%      91.00 =C2=
=B1 17%  slabinfo.kmalloc-rcl-192.num_objs
      2.17 =C2=B1 17%      -7.7%       2.00            +0.0%       2.17 =C2=
=B1 17%  slabinfo.kmalloc-rcl-192.num_slabs
    192.00            +0.0%     192.00            -5.6%     181.33 =C2=B1 1=
3%  slabinfo.kmalloc-rcl-256.active_objs
      3.00            +0.0%       3.00            -5.6%       2.83 =C2=B1 1=
3%  slabinfo.kmalloc-rcl-256.active_slabs
    192.00            +0.0%     192.00            -5.6%     181.33 =C2=B1 1=
3%  slabinfo.kmalloc-rcl-256.num_objs
      3.00            +0.0%       3.00            -5.6%       2.83 =C2=B1 1=
3%  slabinfo.kmalloc-rcl-256.num_slabs
     14228            -0.5%      14155            -0.2%      14204        s=
labinfo.kmalloc-rcl-512.active_objs
    222.17            -0.5%     221.00            -0.2%     221.67        s=
labinfo.kmalloc-rcl-512.active_slabs
     14240            -0.6%      14155            -0.2%      14208        s=
labinfo.kmalloc-rcl-512.num_objs
    222.17            -0.5%     221.00            -0.2%     221.67        s=
labinfo.kmalloc-rcl-512.num_slabs
      6907 =C2=B1  2%      +0.1%       6914            +0.6%       6949 =C2=
=B1  6%  slabinfo.kmalloc-rcl-64.active_objs
    107.50 =C2=B1  2%      -0.2%     107.33            +0.5%     108.00 =C2=
=B1  6%  slabinfo.kmalloc-rcl-64.active_slabs
      6907 =C2=B1  2%      +0.1%       6914            +0.6%       6949 =C2=
=B1  6%  slabinfo.kmalloc-rcl-64.num_objs
    107.50 =C2=B1  2%      -0.2%     107.33            +0.5%     108.00 =C2=
=B1  6%  slabinfo.kmalloc-rcl-64.num_slabs
      2059 =C2=B1  6%      -2.3%       2012 =C2=B1  5%      -0.4%       205=
0 =C2=B1  4%  slabinfo.kmalloc-rcl-96.active_objs
     48.67 =C2=B1  6%      -2.1%      47.67 =C2=B1  5%      -0.7%      48.3=
3 =C2=B1  4%  slabinfo.kmalloc-rcl-96.active_slabs
      2059 =C2=B1  6%      -2.3%       2012 =C2=B1  5%      -0.4%       205=
0 =C2=B1  4%  slabinfo.kmalloc-rcl-96.num_objs
     48.67 =C2=B1  6%      -2.1%      47.67 =C2=B1  5%      -0.7%      48.3=
3 =C2=B1  4%  slabinfo.kmalloc-rcl-96.num_slabs
    746.67 =C2=B1 10%      -1.4%     736.00 =C2=B1  8%     -11.4%     661.3=
3 =C2=B1  4%  slabinfo.kmem_cache.active_objs
     11.67 =C2=B1 10%      -1.4%      11.50 =C2=B1  8%     -11.4%      10.3=
3 =C2=B1  4%  slabinfo.kmem_cache.active_slabs
    746.67 =C2=B1 10%      -1.4%     736.00 =C2=B1  8%     -11.4%     661.3=
3 =C2=B1  4%  slabinfo.kmem_cache.num_objs
     11.67 =C2=B1 10%      -1.4%      11.50 =C2=B1  8%     -11.4%      10.3=
3 =C2=B1  4%  slabinfo.kmem_cache.num_slabs
      1217 =C2=B1  6%      -0.9%       1207 =C2=B1  5%      -7.0%       113=
2 =C2=B1  2%  slabinfo.kmem_cache_node.active_objs
     20.67 =C2=B1  6%      -0.8%      20.50 =C2=B1  4%      -6.5%      19.3=
3 =C2=B1  2%  slabinfo.kmem_cache_node.active_slabs
      1322 =C2=B1  6%      -0.8%       1312 =C2=B1  4%      -6.5%       123=
7 =C2=B1  2%  slabinfo.kmem_cache_node.num_objs
     20.67 =C2=B1  6%      -0.8%      20.50 =C2=B1  4%      -6.5%      19.3=
3 =C2=B1  2%  slabinfo.kmem_cache_node.num_slabs
     36193            -0.2%      36109            -0.2%      36111        s=
labinfo.lsm_file_cache.active_objs
    212.00            -0.2%     211.50            -0.2%     211.50        s=
labinfo.lsm_file_cache.active_slabs
     36193            -0.2%      36109            -0.2%      36111        s=
labinfo.lsm_file_cache.num_objs
    212.00            -0.2%     211.50            -0.2%     211.50        s=
labinfo.lsm_file_cache.num_slabs
      5327 =C2=B1  3%      +1.7%       5416 =C2=B1  7%      +0.1%       533=
3 =C2=B1  7%  slabinfo.mm_struct.active_objs
    176.83 =C2=B1  3%      +1.9%     180.17 =C2=B1  7%      +0.2%     177.1=
7 =C2=B1  7%  slabinfo.mm_struct.active_slabs
      5327 =C2=B1  3%      +1.7%       5416 =C2=B1  7%      +0.1%       533=
3 =C2=B1  7%  slabinfo.mm_struct.num_objs
    176.83 =C2=B1  3%      +1.9%     180.17 =C2=B1  7%      +0.2%     177.1=
7 =C2=B1  7%  slabinfo.mm_struct.num_slabs
    900.00 =C2=B1  7%      +7.6%     968.00 =C2=B1  8%      +1.0%     908.6=
7 =C2=B1  5%  slabinfo.mnt_cache.active_objs
     16.67 =C2=B1  7%      +8.0%      18.00 =C2=B1  8%      +2.0%      17.0=
0 =C2=B1  4%  slabinfo.mnt_cache.active_slabs
    900.00 =C2=B1  7%      +7.6%     968.00 =C2=B1  8%      +1.0%     908.6=
7 =C2=B1  5%  slabinfo.mnt_cache.num_objs
     16.67 =C2=B1  7%      +8.0%      18.00 =C2=B1  8%      +2.0%      17.0=
0 =C2=B1  4%  slabinfo.mnt_cache.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.num_slabs
      1536            +0.0%       1536            +0.3%       1541        s=
labinfo.names_cache.active_objs
    192.00            +0.0%     192.00            +0.3%     192.67        s=
labinfo.names_cache.active_slabs
      1536            +0.0%       1536            +0.3%       1541        s=
labinfo.names_cache.num_objs
    192.00            +0.0%     192.00            +0.3%     192.67        s=
labinfo.names_cache.num_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        s=
labinfo.nfs_read_data.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.nfs_read_data.active_slabs
     36.00            +0.0%      36.00            +0.0%      36.00        s=
labinfo.nfs_read_data.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.nfs_read_data.num_slabs
    310.00            -6.7%     289.33 =C2=B1 10%      -3.3%     299.67 =C2=
=B1  7%  slabinfo.numa_policy.active_objs
      5.00            -6.7%       4.67 =C2=B1 10%      -3.3%       4.83 =C2=
=B1  7%  slabinfo.numa_policy.active_slabs
    310.00            -6.7%     289.33 =C2=B1 10%      -3.3%     299.67 =C2=
=B1  7%  slabinfo.numa_policy.num_objs
      5.00            -6.7%       4.67 =C2=B1 10%      -3.3%       4.83 =C2=
=B1  7%  slabinfo.numa_policy.num_slabs
     13716 =C2=B1  5%      +3.6%      14207 =C2=B1 10%      -2.3%      1339=
6 =C2=B1  8%  slabinfo.pde_opener.active_objs
    134.17 =C2=B1  5%      +3.4%     138.67 =C2=B1 10%      -2.5%     130.8=
3 =C2=B1  8%  slabinfo.pde_opener.active_slabs
     13716 =C2=B1  5%      +3.6%      14207 =C2=B1 10%      -2.3%      1339=
6 =C2=B1  8%  slabinfo.pde_opener.num_objs
    134.17 =C2=B1  5%      +3.4%     138.67 =C2=B1 10%      -2.5%     130.8=
3 =C2=B1  8%  slabinfo.pde_opener.num_slabs
     13947 =C2=B1  2%      +0.7%      14042            +0.3%      13985    =
    slabinfo.pid.active_objs
    217.17 =C2=B1  2%      +0.7%     218.67            +0.2%     217.67    =
    slabinfo.pid.active_slabs
     13947 =C2=B1  2%      +0.7%      14042            +0.3%      13985    =
    slabinfo.pid.num_objs
    217.17 =C2=B1  2%      +0.7%     218.67            +0.2%     217.67    =
    slabinfo.pid.num_slabs
      3230 =C2=B1  8%      +5.1%       3393 =C2=B1  8%      +2.1%       329=
7 =C2=B1  4%  slabinfo.pool_workqueue.active_objs
     53.00 =C2=B1  8%      +4.1%      55.17 =C2=B1  8%      +0.9%      53.5=
0 =C2=B1  3%  slabinfo.pool_workqueue.active_slabs
      3399 =C2=B1  8%      +4.4%       3549 =C2=B1  8%      +1.3%       344=
3 =C2=B1  4%  slabinfo.pool_workqueue.num_objs
     53.00 =C2=B1  8%      +4.1%      55.17 =C2=B1  8%      +0.9%      53.5=
0 =C2=B1  3%  slabinfo.pool_workqueue.num_slabs
      2772 =C2=B1  3%      +2.5%       2842 =C2=B1  2%      +1.8%       282=
1 =C2=B1  2%  slabinfo.proc_dir_entry.active_objs
     66.00 =C2=B1  3%      +2.5%      67.67 =C2=B1  2%      +1.8%      67.1=
7 =C2=B1  2%  slabinfo.proc_dir_entry.active_slabs
      2772 =C2=B1  3%      +2.5%       2842 =C2=B1  2%      +1.8%       282=
1 =C2=B1  2%  slabinfo.proc_dir_entry.num_objs
     66.00 =C2=B1  3%      +2.5%      67.67 =C2=B1  2%      +1.8%      67.1=
7 =C2=B1  2%  slabinfo.proc_dir_entry.num_slabs
     21723 =C2=B1  2%      +1.9%      22136 =C2=B1  2%      +2.4%      2223=
6 =C2=B1  3%  slabinfo.proc_inode_cache.active_objs
    460.00 =C2=B1  2%      +1.6%     467.17 =C2=B1  3%      +2.7%     472.3=
3 =C2=B1  4%  slabinfo.proc_inode_cache.active_slabs
     22090 =C2=B1  2%      +1.6%      22440 =C2=B1  3%      +2.8%      2270=
6 =C2=B1  4%  slabinfo.proc_inode_cache.num_objs
    460.00 =C2=B1  2%      +1.6%     467.17 =C2=B1  3%      +2.7%     472.3=
3 =C2=B1  4%  slabinfo.proc_inode_cache.num_slabs
     28677            +0.1%      28720            +0.3%      28752        s=
labinfo.radix_tree_node.active_objs
    511.50            +0.2%     512.33            +0.3%     513.17        s=
labinfo.radix_tree_node.active_slabs
     28677            +0.1%      28720            +0.3%      28752        s=
labinfo.radix_tree_node.num_objs
    511.50            +0.2%     512.33            +0.3%     513.17        s=
labinfo.radix_tree_node.num_slabs
     24.00 =C2=B1 33%     -11.1%      21.33 =C2=B1 35%     +33.3%      32.0=
0        slabinfo.request_queue.active_objs
      1.50 =C2=B1 33%     -11.1%       1.33 =C2=B1 35%     +33.3%       2.0=
0        slabinfo.request_queue.active_slabs
     24.00 =C2=B1 33%     -11.1%      21.33 =C2=B1 35%     +33.3%      32.0=
0        slabinfo.request_queue.num_objs
      1.50 =C2=B1 33%     -11.1%       1.33 =C2=B1 35%     +33.3%       2.0=
0        slabinfo.request_queue.num_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        s=
labinfo.rpc_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.rpc_inode_cache.active_slabs
     51.00            +0.0%      51.00            +0.0%      51.00        s=
labinfo.rpc_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.rpc_inode_cache.num_slabs
    320.00            +0.0%     320.00            +0.0%     320.00        s=
labinfo.scsi_sense_cache.active_objs
      5.00            +0.0%       5.00            +0.0%       5.00        s=
labinfo.scsi_sense_cache.active_slabs
    320.00            +0.0%     320.00            +0.0%     320.00        s=
labinfo.scsi_sense_cache.num_objs
      5.00            +0.0%       5.00            +0.0%       5.00        s=
labinfo.scsi_sense_cache.num_slabs
     13056            +0.0%      13056            +0.0%      13056        s=
labinfo.seq_file.active_objs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.seq_file.active_slabs
     13056            +0.0%      13056            +0.0%      13056        s=
labinfo.seq_file.num_objs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.seq_file.num_slabs
      8140 =C2=B1  6%      +5.6%       8592 =C2=B1  6%      +4.2%       848=
1 =C2=B1  5%  slabinfo.shmem_inode_cache.active_objs
    176.50 =C2=B1  6%      +5.5%     186.17 =C2=B1  6%      +4.3%     184.1=
7 =C2=B1  5%  slabinfo.shmem_inode_cache.active_slabs
      8140 =C2=B1  6%      +5.6%       8592 =C2=B1  6%      +4.2%       848=
1 =C2=B1  5%  slabinfo.shmem_inode_cache.num_objs
    176.50 =C2=B1  6%      +5.5%     186.17 =C2=B1  6%      +4.3%     184.1=
7 =C2=B1  5%  slabinfo.shmem_inode_cache.num_slabs
      3784 =C2=B1  2%      +0.4%       3801 =C2=B1  6%      +1.4%       383=
8 =C2=B1  4%  slabinfo.sighand_cache.active_objs
    254.67            -0.3%     254.00 =C2=B1  6%      +1.4%     258.17 =C2=
=B1  3%  slabinfo.sighand_cache.active_slabs
      3825            -0.3%       3813 =C2=B1  6%      +1.5%       3881 =C2=
=B1  3%  slabinfo.sighand_cache.num_objs
    254.67            -0.3%     254.00 =C2=B1  6%      +1.4%     258.17 =C2=
=B1  3%  slabinfo.sighand_cache.num_slabs
      5880 =C2=B1  4%      -0.8%       5833 =C2=B1  7%      -0.6%       584=
4 =C2=B1  5%  slabinfo.signal_cache.active_objs
    212.33 =C2=B1  3%      -2.0%     208.00 =C2=B1  7%      -1.2%     209.8=
3 =C2=B1  5%  slabinfo.signal_cache.active_slabs
      5955 =C2=B1  3%      -1.8%       5845 =C2=B1  7%      -1.1%       589=
1 =C2=B1  5%  slabinfo.signal_cache.num_objs
    212.33 =C2=B1  3%      -2.0%     208.00 =C2=B1  7%      -1.2%     209.8=
3 =C2=B1  5%  slabinfo.signal_cache.num_slabs
    128.00            +0.0%     128.00            +0.0%     128.00        s=
labinfo.skbuff_fclone_cache.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.skbuff_fclone_cache.active_slabs
    128.00            +0.0%     128.00            +0.0%     128.00        s=
labinfo.skbuff_fclone_cache.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.skbuff_fclone_cache.num_slabs
     13365 =C2=B1  2%      -1.4%      13184 =C2=B1  2%      -0.7%      1326=
9        slabinfo.skbuff_head_cache.active_objs
    208.83 =C2=B1  2%      -1.2%     206.33 =C2=B1  2%      -0.6%     207.5=
0        slabinfo.skbuff_head_cache.active_slabs
     13365 =C2=B1  2%      -1.2%      13205 =C2=B1  2%      -0.6%      1328=
0        slabinfo.skbuff_head_cache.num_objs
    208.83 =C2=B1  2%      -1.2%     206.33 =C2=B1  2%      -0.6%     207.5=
0        slabinfo.skbuff_head_cache.num_slabs
      4947 =C2=B1  3%      +0.7%       4980 =C2=B1  5%      -0.1%       494=
2 =C2=B1  7%  slabinfo.sock_inode_cache.active_objs
    126.33 =C2=B1  3%      +0.7%     127.17 =C2=B1  5%      +0.0%     126.3=
3 =C2=B1  7%  slabinfo.sock_inode_cache.active_slabs
      4947 =C2=B1  3%      +0.7%       4980 =C2=B1  5%      -0.1%       494=
2 =C2=B1  7%  slabinfo.sock_inode_cache.num_objs
    126.33 =C2=B1  3%      +0.7%     127.17 =C2=B1  5%      +0.0%     126.3=
3 =C2=B1  7%  slabinfo.sock_inode_cache.num_slabs
     11698 =C2=B1  2%      +1.3%      11854            +0.9%      11800 =C2=
=B1  2%  slabinfo.task_delay_info.active_objs
    228.83 =C2=B1  2%      +1.4%     232.00            +0.9%     230.83 =C2=
=B1  2%  slabinfo.task_delay_info.active_slabs
     11698 =C2=B1  2%      +1.3%      11854            +0.9%      11800 =C2=
=B1  2%  slabinfo.task_delay_info.num_objs
    228.83 =C2=B1  2%      +1.4%     232.00            +0.9%     230.83 =C2=
=B1  2%  slabinfo.task_delay_info.num_slabs
      1450 =C2=B1  9%      -2.0%       1421 =C2=B1  6%      +2.6%       148=
7 =C2=B1  2%  slabinfo.task_group.active_objs
     31.00 =C2=B1  8%      -1.1%      30.67 =C2=B1  5%      +2.2%      31.6=
7 =C2=B1  2%  slabinfo.task_group.active_slabs
      1450 =C2=B1  9%      -2.0%       1421 =C2=B1  6%      +2.6%       148=
7 =C2=B1  2%  slabinfo.task_group.num_objs
     31.00 =C2=B1  8%      -1.1%      30.67 =C2=B1  5%      +2.2%      31.6=
7 =C2=B1  2%  slabinfo.task_group.num_slabs
      2322            -0.3%       2315            -0.3%       2314 =C2=B1  =
2%  slabinfo.task_struct.active_objs
      2337            -0.3%       2330            -0.3%       2330 =C2=B1  =
2%  slabinfo.task_struct.active_slabs
      2337            -0.3%       2330            -0.3%       2330 =C2=B1  =
2%  slabinfo.task_struct.num_objs
      2337            -0.3%       2330            -0.3%       2330 =C2=B1  =
2%  slabinfo.task_struct.num_slabs
    145.33            +0.1%     145.50            +0.0%     145.33        s=
labinfo.taskstats.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.taskstats.active_slabs
    145.33            +0.1%     145.50            +0.0%     145.33        s=
labinfo.taskstats.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.taskstats.num_slabs
      3798 =C2=B1  2%      +2.0%       3875 =C2=B1  3%      +0.3%       381=
0 =C2=B1  2%  slabinfo.trace_event_file.active_objs
     82.33 =C2=B1  2%      +2.0%      84.00 =C2=B1  3%      +0.2%      82.5=
0 =C2=B1  2%  slabinfo.trace_event_file.active_slabs
      3798 =C2=B1  2%      +2.0%       3875 =C2=B1  3%      +0.5%       381=
7 =C2=B1  2%  slabinfo.trace_event_file.num_objs
     82.33 =C2=B1  2%      +2.0%      84.00 =C2=B1  3%      +0.2%      82.5=
0 =C2=B1  2%  slabinfo.trace_event_file.num_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        s=
labinfo.tw_sock_TCP.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.active_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        s=
labinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.num_slabs
     88773            -1.2%      87704 =C2=B1  4%      -0.8%      88066 =C2=
=B1  3%  slabinfo.vm_area_struct.active_objs
      2226            -1.1%       2202 =C2=B1  4%      -0.8%       2209 =C2=
=B1  3%  slabinfo.vm_area_struct.active_slabs
     89080            -1.1%      88120 =C2=B1  4%      -0.8%      88405 =C2=
=B1  3%  slabinfo.vm_area_struct.num_objs
      2226            -1.1%       2202 =C2=B1  4%      -0.8%       2209 =C2=
=B1  3%  slabinfo.vm_area_struct.num_slabs
     22474            -0.8%      22304            -0.7%      22313        s=
labinfo.vmap_area.active_objs
    350.83            -0.7%     348.50            -0.7%     348.33        s=
labinfo.vmap_area.active_slabs
     22487            -0.7%      22328            -0.7%      22334        s=
labinfo.vmap_area.num_objs
    350.83            -0.7%     348.50            -0.7%     348.33        s=
labinfo.vmap_area.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.num_slabs
     60.00 =C2=B1 28%     +10.0%      66.00 =C2=B1 20%     +10.0%      66.0=
0 =C2=B1 20%  slabinfo.xfs_btree_cur.active_objs
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +10.0%       1.8=
3 =C2=B1 20%  slabinfo.xfs_btree_cur.active_slabs
     60.00 =C2=B1 28%     +10.0%      66.00 =C2=B1 20%     +10.0%      66.0=
0 =C2=B1 20%  slabinfo.xfs_btree_cur.num_objs
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +10.0%       1.8=
3 =C2=B1 20%  slabinfo.xfs_btree_cur.num_slabs
    196.00 =C2=B1 10%      +0.0%     196.00 =C2=B1 10%      -3.6%     189.0=
0 =C2=B1 21%  slabinfo.xfs_buf.active_objs
      4.67 =C2=B1 10%      +0.0%       4.67 =C2=B1 10%      -3.6%       4.5=
0 =C2=B1 21%  slabinfo.xfs_buf.active_slabs
    196.00 =C2=B1 10%      +0.0%     196.00 =C2=B1 10%      -3.6%     189.0=
0 =C2=B1 21%  slabinfo.xfs_buf.num_objs
      4.67 =C2=B1 10%      +0.0%       4.67 =C2=B1 10%      -3.6%       4.5=
0 =C2=B1 21%  slabinfo.xfs_buf.num_slabs
     38.00            +0.0%      38.00            +0.0%      38.00        s=
labinfo.xfs_efi_item.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfs_efi_item.active_slabs
     38.00            +0.0%      38.00            +0.0%      38.00        s=
labinfo.xfs_efi_item.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfs_efi_item.num_slabs
     96.00            +0.0%      96.00            -5.6%      90.67 =C2=B1 1=
3%  slabinfo.xfs_inode.active_objs
      3.00            +0.0%       3.00            -5.6%       2.83 =C2=B1 1=
3%  slabinfo.xfs_inode.active_slabs
     96.00            +0.0%      96.00            -5.6%      90.67 =C2=B1 1=
3%  slabinfo.xfs_inode.num_objs
      3.00            +0.0%       3.00            -5.6%       2.83 =C2=B1 1=
3%  slabinfo.xfs_inode.num_slabs
    261.00            +0.0%     261.00            +0.0%     261.00        s=
oftirqs.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU0.HI
     18671 =C2=B1 14%      -2.7%      18175 =C2=B1 15%     -15.2%      1582=
4 =C2=B1 12%  softirqs.CPU0.RCU
      7475 =C2=B1 12%      +2.8%       7685 =C2=B1 12%     +10.6%       826=
6 =C2=B1 11%  softirqs.CPU0.SCHED
    105.50            -0.3%     105.17            -0.5%     105.00        s=
oftirqs.CPU0.TASKLET
      2639 =C2=B1 20%      +3.0%       2719 =C2=B1  5%     +23.5%       326=
0 =C2=B1 44%  softirqs.CPU0.TIMER
     16884 =C2=B1  5%      -2.5%      16458 =C2=B1  5%      -1.4%      1664=
2 =C2=B1 10%  softirqs.CPU1.RCU
      5689 =C2=B1 13%      +1.1%       5750 =C2=B1 16%      +2.0%       580=
3 =C2=B1 12%  softirqs.CPU1.SCHED
    867.83 =C2=B1 75%      -5.1%     824.00 =C2=B1 61%      -5.7%     818.1=
7 =C2=B1 70%  softirqs.CPU1.TIMER
      5488 =C2=B1 78%     -66.9%       1817 =C2=B1139%     -88.1%     655.8=
3 =C2=B1 25%  softirqs.CPU10.NET_RX
      2.50 =C2=B1 55%      +0.0%       2.50 =C2=B1 38%      -6.7%       2.3=
3 =C2=B1 40%  softirqs.CPU10.NET_TX
     18039 =C2=B1 18%     -15.4%      15258 =C2=B1  3%     -16.4%      1507=
2 =C2=B1  8%  softirqs.CPU10.RCU
      5363 =C2=B1 14%      -8.7%       4896 =C2=B1 10%      -3.3%       518=
4 =C2=B1  3%  softirqs.CPU10.SCHED
      1304 =C2=B1 66%     -65.3%     452.50 =C2=B1 56%     -60.5%     515.0=
0 =C2=B1 39%  softirqs.CPU10.TIMER
     15447 =C2=B1  3%      -2.5%      15068 =C2=B1  3%      -4.1%      1481=
1 =C2=B1  8%  softirqs.CPU100.RCU
      4896 =C2=B1  9%      -0.1%       4890 =C2=B1 11%      +0.1%       490=
2 =C2=B1  7%  softirqs.CPU100.SCHED
      0.00          -100.0%       0.00       +3.2e+102%       3.17 =C2=B122=
3%  softirqs.CPU100.TASKLET
    272.33 =C2=B1 44%     -13.5%     235.67 =C2=B1 72%     -32.9%     182.6=
7 =C2=B1 21%  softirqs.CPU100.TIMER
     15269 =C2=B1  4%      -2.3%      14922 =C2=B1  2%      +3.4%      1578=
5 =C2=B1 15%  softirqs.CPU101.RCU
      4864 =C2=B1 12%      -0.4%       4843 =C2=B1 10%      +4.5%       508=
2 =C2=B1  2%  softirqs.CPU101.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU101.TASKLET
    116.83 =C2=B1 25%     +21.3%     141.67 =C2=B1 10%    +290.2%     455.8=
3 =C2=B1107%  softirqs.CPU101.TIMER
     15197 =C2=B1  4%      -0.5%      15125 =C2=B1  4%      -2.5%      1481=
9 =C2=B1  8%  softirqs.CPU102.RCU
      4855 =C2=B1 10%      +0.4%       4875 =C2=B1 10%      +9.1%       529=
6 =C2=B1  8%  softirqs.CPU102.SCHED
    158.83 =C2=B1 12%     +57.1%     249.50 =C2=B1 91%    +118.2%     346.5=
0 =C2=B1136%  softirqs.CPU102.TIMER
     15404 =C2=B1  3%      -2.2%      15072 =C2=B1  2%      -3.6%      1485=
6 =C2=B1  8%  softirqs.CPU103.RCU
      4835 =C2=B1 11%      +0.8%       4873 =C2=B1 10%      +4.7%       506=
0        softirqs.CPU103.SCHED
    170.00 =C2=B1  8%     -28.0%     122.33 =C2=B1 15%      +9.5%     186.1=
7 =C2=B1 47%  softirqs.CPU103.TIMER
     15396 =C2=B1  3%      -1.9%      15102 =C2=B1  2%      -2.6%      1499=
6 =C2=B1  7%  softirqs.CPU104.RCU
      4911 =C2=B1 12%      -0.9%       4867 =C2=B1 10%      +3.4%       508=
0        softirqs.CPU104.SCHED
    153.67 =C2=B1 18%      -5.2%     145.67 =C2=B1 24%     +24.8%     191.8=
3 =C2=B1 38%  softirqs.CPU104.TIMER
     15223 =C2=B1  4%      -2.3%      14874 =C2=B1  2%      -3.0%      1476=
4 =C2=B1  8%  softirqs.CPU105.RCU
      4790 =C2=B1 11%      +1.6%       4866 =C2=B1 11%      +5.3%       504=
5 =C2=B1  2%  softirqs.CPU105.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU105.TASKLET
    151.17 =C2=B1 15%      +6.7%     161.33 =C2=B1 44%      +7.4%     162.3=
3 =C2=B1 28%  softirqs.CPU105.TIMER
     15217 =C2=B1  3%      -2.1%      14894 =C2=B1  2%      -3.7%      1465=
7 =C2=B1  8%  softirqs.CPU106.RCU
      4811 =C2=B1 11%      +1.3%       4874 =C2=B1 10%      +5.0%       505=
4        softirqs.CPU106.SCHED
    136.17 =C2=B1 18%     +19.7%     163.00 =C2=B1 12%     +16.2%     158.1=
7 =C2=B1 17%  softirqs.CPU106.TIMER
     15091 =C2=B1  3%      -2.5%      14707 =C2=B1  2%      -4.3%      1444=
2 =C2=B1  8%  softirqs.CPU107.RCU
      4849 =C2=B1 11%      +0.8%       4890 =C2=B1 10%      +3.8%       503=
5        softirqs.CPU107.SCHED
    164.50 =C2=B1 13%      -2.3%     160.67 =C2=B1 33%     -17.2%     136.1=
7 =C2=B1 29%  softirqs.CPU107.TIMER
     14981 =C2=B1  6%      -0.6%      14889 =C2=B1  2%      -0.5%      1490=
4 =C2=B1  9%  softirqs.CPU108.RCU
      4824 =C2=B1 11%      +0.6%       4854 =C2=B1 10%      +5.5%       508=
9        softirqs.CPU108.SCHED
    199.67 =C2=B1 73%     -24.7%     150.33 =C2=B1 19%     -22.0%     155.6=
7 =C2=B1 30%  softirqs.CPU108.TIMER
     15271 =C2=B1  6%      +0.4%      15336 =C2=B1  4%      -2.9%      1482=
1 =C2=B1  8%  softirqs.CPU109.RCU
      4601 =C2=B1 14%      +5.5%       4855 =C2=B1 10%      +5.4%       484=
9 =C2=B1 11%  softirqs.CPU109.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU109.TASKLET
    168.67 =C2=B1 19%     -25.9%     125.00 =C2=B1 14%     -14.8%     143.6=
7 =C2=B1 23%  softirqs.CPU109.TIMER
      2116 =C2=B1115%     +99.2%       4215 =C2=B1103%     -75.1%     526.0=
0 =C2=B1 72%  softirqs.CPU11.NET_RX
      2.00 =C2=B1 28%     -33.3%       1.33 =C2=B1 35%      +0.0%       2.0=
0 =C2=B1 40%  softirqs.CPU11.NET_TX
     15687 =C2=B1  4%      -0.5%      15615 =C2=B1  3%      -3.5%      1513=
4 =C2=B1  8%  softirqs.CPU11.RCU
      4939 =C2=B1 12%      +3.6%       5118            -3.7%       4756 =C2=
=B1 14%  softirqs.CPU11.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU11.TASKLET
    461.50 =C2=B1 58%     +38.0%     636.83 =C2=B1 54%     -42.5%     265.1=
7 =C2=B1 21%  softirqs.CPU11.TIMER
     15129 =C2=B1  6%      -1.1%      14965 =C2=B1  2%      -2.1%      1481=
2 =C2=B1  8%  softirqs.CPU110.RCU
      4851 =C2=B1 11%      +0.8%       4889 =C2=B1 10%      +3.9%       504=
1        softirqs.CPU110.SCHED
    153.17 =C2=B1 25%     -33.2%     102.33 =C2=B1 22%     -17.7%     126.0=
0 =C2=B1 26%  softirqs.CPU110.TIMER
     15016 =C2=B1  6%      +0.9%      15152 =C2=B1  4%      -0.8%      1490=
3 =C2=B1  8%  softirqs.CPU111.RCU
      4849 =C2=B1 11%      +1.1%       4902 =C2=B1 10%      +3.7%       502=
8        softirqs.CPU111.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU111.TASKLET
     95.17 =C2=B1 17%     +84.6%     175.67 =C2=B1 26%     +75.7%     167.1=
7 =C2=B1 20%  softirqs.CPU111.TIMER
     15435 =C2=B1  5%      -2.4%      15068 =C2=B1  4%      -2.1%      1510=
4 =C2=B1  9%  softirqs.CPU112.RCU
      4845 =C2=B1 11%      +2.2%       4950 =C2=B1  8%      +4.9%       508=
1        softirqs.CPU112.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU112.TASKLET
    253.67 =C2=B1 60%     -10.2%     227.67 =C2=B1111%     -31.3%     174.3=
3 =C2=B1 35%  softirqs.CPU112.TIMER
     15195 =C2=B1  4%      -1.9%      14910 =C2=B1  3%      -3.7%      1463=
9 =C2=B1  8%  softirqs.CPU113.RCU
      4842 =C2=B1 11%      +3.2%       4995 =C2=B1 10%      +4.5%       505=
8        softirqs.CPU113.SCHED
    136.00 =C2=B1 27%     +26.3%     171.83 =C2=B1 19%      -3.9%     130.6=
7 =C2=B1 13%  softirqs.CPU113.TIMER
     15314 =C2=B1 10%      -3.8%      14731 =C2=B1  3%      -2.7%      1489=
3 =C2=B1  9%  softirqs.CPU114.RCU
      4941 =C2=B1 13%      -0.3%       4924 =C2=B1  9%      +3.1%       509=
6        softirqs.CPU114.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU114.TASKLET
    286.67 =C2=B1 67%     -38.8%     175.33 =C2=B1 32%     -51.0%     140.5=
0 =C2=B1 17%  softirqs.CPU114.TIMER
     15301 =C2=B1  4%      -3.4%      14778 =C2=B1  3%      -3.2%      1481=
1 =C2=B1  8%  softirqs.CPU115.RCU
      4832 =C2=B1 11%      +0.4%       4850 =C2=B1 10%      +4.2%       503=
3        softirqs.CPU115.SCHED
    207.50 =C2=B1 50%      -1.1%     205.17 =C2=B1 54%      -9.2%     188.3=
3 =C2=B1 66%  softirqs.CPU115.TIMER
     15534 =C2=B1  7%      -5.2%      14719 =C2=B1  3%      -5.7%      1465=
5 =C2=B1  8%  softirqs.CPU116.RCU
      4846 =C2=B1 12%      -0.2%       4838 =C2=B1 10%      +4.1%       504=
7        softirqs.CPU116.SCHED
    172.17 =C2=B1 17%      -7.7%     158.83 =C2=B1 14%     -14.6%     147.0=
0 =C2=B1 19%  softirqs.CPU116.TIMER
     15157 =C2=B1  4%      -2.5%      14773 =C2=B1  4%      -3.5%      1462=
9 =C2=B1  9%  softirqs.CPU117.RCU
      4829 =C2=B1 11%      +0.0%       4829 =C2=B1  9%      -0.7%       479=
6 =C2=B1 10%  softirqs.CPU117.SCHED
    177.33 =C2=B1 39%      -6.9%     165.17 =C2=B1 67%     +14.3%     202.6=
7 =C2=B1 54%  softirqs.CPU117.TIMER
     15156 =C2=B1  3%      -3.1%      14684 =C2=B1  3%      -3.9%      1456=
5 =C2=B1  8%  softirqs.CPU118.RCU
      4937 =C2=B1 13%      -1.4%       4869 =C2=B1 10%      -2.9%       479=
3 =C2=B1 10%  softirqs.CPU118.SCHED
      6.67 =C2=B1141%     -97.5%       0.17 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU118.TASKLET
    380.00 =C2=B1136%     -61.9%     144.67 =C2=B1 19%     -63.4%     139.1=
7 =C2=B1 22%  softirqs.CPU118.TIMER
     15270 =C2=B1  4%      -4.2%      14635 =C2=B1  4%      -4.0%      1465=
6 =C2=B1  8%  softirqs.CPU119.RCU
      5211 =C2=B1  5%     -11.9%       4592 =C2=B1 15%      -9.3%       472=
7 =C2=B1 12%  softirqs.CPU119.SCHED
      0.00       +6.7e+101%       0.67 =C2=B1165% +1.7e+101%       0.17 =C2=
=B1223%  softirqs.CPU119.TASKLET
    837.33 =C2=B1104%     -78.7%     178.00 =C2=B1 17%     -80.5%     163.6=
7 =C2=B1 36%  softirqs.CPU119.TIMER
      1639 =C2=B1118%    +263.5%       5958 =C2=B1189%     -70.2%     488.0=
0 =C2=B1 41%  softirqs.CPU12.NET_RX
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 37%     -36.4%       1.1=
7 =C2=B1 31%  softirqs.CPU12.NET_TX
     15652 =C2=B1  5%      +1.4%      15864 =C2=B1  8%      -2.9%      1519=
7 =C2=B1  8%  softirqs.CPU12.RCU
      4819 =C2=B1 11%      +2.5%       4940 =C2=B1 11%      +8.2%       521=
6        softirqs.CPU12.SCHED
    416.83 =C2=B1 42%     +15.9%     483.00 =C2=B1 42%     +21.3%     505.6=
7 =C2=B1 62%  softirqs.CPU12.TIMER
     22824 =C2=B1 10%      -3.5%      22036 =C2=B1  7%      +0.4%      2291=
2 =C2=B1  5%  softirqs.CPU120.RCU
      4926 =C2=B1 11%      +0.7%       4962 =C2=B1 11%      +2.6%       505=
4        softirqs.CPU120.SCHED
    562.83 =C2=B1 12%     +20.5%     678.17 =C2=B1 30%      +9.1%     614.0=
0 =C2=B1 29%  softirqs.CPU120.TIMER
     17846 =C2=B1  4%      +1.1%      18034 =C2=B1  6%      +0.1%      1785=
6 =C2=B1  6%  softirqs.CPU121.RCU
      4887 =C2=B1 11%      +0.7%       4919 =C2=B1 12%      +4.3%       509=
6        softirqs.CPU121.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU121.TASKLET
    440.00 =C2=B1  6%      -8.6%     402.33 =C2=B1 13%     -10.8%     392.3=
3 =C2=B1 14%  softirqs.CPU121.TIMER
     15925 =C2=B1  4%      -1.2%      15734 =C2=B1  4%      -0.2%      1589=
2 =C2=B1  7%  softirqs.CPU122.RCU
      4886 =C2=B1 11%      +0.6%       4914 =C2=B1 10%      +4.1%       508=
5        softirqs.CPU122.SCHED
    213.00 =C2=B1  7%      -3.4%     205.83 =C2=B1 13%      +2.0%     217.1=
7 =C2=B1 14%  softirqs.CPU122.TIMER
     15523 =C2=B1  4%      -2.2%      15175 =C2=B1  3%      -1.1%      1534=
5 =C2=B1  7%  softirqs.CPU123.RCU
      4865 =C2=B1 11%      +0.3%       4881 =C2=B1 10%      +5.0%       510=
9        softirqs.CPU123.SCHED
    112.83 =C2=B1 18%     +40.3%     158.33 =C2=B1 18%      +7.1%     120.8=
3 =C2=B1 25%  softirqs.CPU123.TIMER
     15605 =C2=B1  4%      -3.2%      15111 =C2=B1  2%      -2.3%      1523=
8 =C2=B1  8%  softirqs.CPU124.RCU
      4759 =C2=B1 16%      +3.8%       4938 =C2=B1 11%      +6.0%       504=
6        softirqs.CPU124.SCHED
    156.83 =C2=B1 16%     -13.9%     135.00 =C2=B1 29%      +4.4%     163.6=
7 =C2=B1 22%  softirqs.CPU124.TIMER
     15337 =C2=B1  4%      -2.6%      14944 =C2=B1  2%      -1.8%      1505=
6 =C2=B1  7%  softirqs.CPU125.RCU
      4876 =C2=B1 11%      +0.6%       4907 =C2=B1 11%      +3.9%       506=
5        softirqs.CPU125.SCHED
    178.50 =C2=B1 24%     -11.3%     158.33 =C2=B1 12%     +28.3%     229.0=
0 =C2=B1 51%  softirqs.CPU125.TIMER
     15390 =C2=B1  4%      -2.5%      15001 =C2=B1  3%      +4.0%      1601=
1 =C2=B1 12%  softirqs.CPU126.RCU
      4949 =C2=B1 11%      -1.3%       4884 =C2=B1 10%      +3.4%       511=
7        softirqs.CPU126.SCHED
      0.00       +3.2e+102%       3.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU126.TASKLET
    224.50 =C2=B1 57%     -51.4%     109.00 =C2=B1 30%     +68.0%     377.1=
7 =C2=B1136%  softirqs.CPU126.TIMER
     15512 =C2=B1  4%      -7.4%      14361 =C2=B1 11%      -2.1%      1518=
8 =C2=B1  8%  softirqs.CPU127.RCU
      4650 =C2=B1 14%      +5.9%       4925 =C2=B1 10%      +8.4%       504=
1        softirqs.CPU127.SCHED
    121.00 =C2=B1 12%     +23.3%     149.17 =C2=B1 22%     +74.0%     210.5=
0 =C2=B1 63%  softirqs.CPU127.TIMER
     14902 =C2=B1  3%      -2.5%      14534 =C2=B1  2%      -0.9%      1476=
0 =C2=B1  6%  softirqs.CPU128.RCU
      4857 =C2=B1 11%      -3.8%       4670 =C2=B1 14%      +6.5%       517=
1 =C2=B1  3%  softirqs.CPU128.SCHED
    161.83 =C2=B1 19%      -3.0%     157.00 =C2=B1 20%     +45.2%     235.0=
0 =C2=B1 79%  softirqs.CPU128.TIMER
     14833 =C2=B1  3%      -1.3%      14637 =C2=B1  3%      -0.7%      1473=
0 =C2=B1  8%  softirqs.CPU129.RCU
      4882 =C2=B1 11%      -0.3%       4865 =C2=B1 10%      +5.1%       513=
1        softirqs.CPU129.SCHED
    130.67 =C2=B1  4%     +47.6%     192.83 =C2=B1 28%     +24.4%     162.5=
0 =C2=B1 19%  softirqs.CPU129.TIMER
    842.17 =C2=B1 87%    +324.7%       3576 =C2=B1130%    +369.2%       395=
1 =C2=B1186%  softirqs.CPU13.NET_RX
      1.50 =C2=B1 63%     +22.2%       1.83 =C2=B1 20%     +22.2%       1.8=
3 =C2=B1 48%  softirqs.CPU13.NET_TX
     15350 =C2=B1  4%      -0.4%      15292 =C2=B1  6%      -2.4%      1498=
3 =C2=B1 11%  softirqs.CPU13.RCU
      4947 =C2=B1  7%      -1.1%       4891 =C2=B1 12%      +8.4%       536=
5 =C2=B1 11%  softirqs.CPU13.SCHED
    323.67 =C2=B1 26%    +129.5%     742.67 =C2=B1 59%      +7.5%     347.8=
3 =C2=B1 38%  softirqs.CPU13.TIMER
     14816 =C2=B1  3%      -2.1%      14509 =C2=B1  3%      -0.2%      1478=
7 =C2=B1 10%  softirqs.CPU130.RCU
      4885 =C2=B1 11%      +0.5%       4910 =C2=B1 10%      +3.9%       507=
7        softirqs.CPU130.SCHED
      0.00       +3.2e+102%       3.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU130.TASKLET
    165.50 =C2=B1 12%      +0.7%     166.67 =C2=B1 19%     -11.5%     146.5=
0 =C2=B1 31%  softirqs.CPU130.TIMER
     14742 =C2=B1  3%      -2.3%      14410 =C2=B1  3%      -2.0%      1444=
4 =C2=B1  8%  softirqs.CPU131.RCU
      4876 =C2=B1 11%      +3.1%       5026 =C2=B1 13%      +4.2%       507=
8        softirqs.CPU131.SCHED
    149.17 =C2=B1 11%    +133.2%     347.83 =C2=B1107%     +10.5%     164.8=
3 =C2=B1 26%  softirqs.CPU131.TIMER
     14906 =C2=B1  3%      -2.8%      14493 =C2=B1  3%      -2.9%      1447=
8 =C2=B1  8%  softirqs.CPU132.RCU
      4885 =C2=B1 11%      +0.4%       4907 =C2=B1 10%      +4.1%       508=
5        softirqs.CPU132.SCHED
    163.17 =C2=B1 18%      -8.5%     149.33 =C2=B1 11%     +20.3%     196.3=
3 =C2=B1 54%  softirqs.CPU132.TIMER
     14876 =C2=B1  3%      -2.5%      14507 =C2=B1  2%      -1.4%      1467=
1 =C2=B1  8%  softirqs.CPU133.RCU
      4880 =C2=B1 11%      +0.1%       4887 =C2=B1 11%      +3.7%       505=
8        softirqs.CPU133.SCHED
    236.50 =C2=B1 45%     -16.3%     197.83 =C2=B1 43%     -19.0%     191.6=
7 =C2=B1 59%  softirqs.CPU133.TIMER
     15020 =C2=B1  3%      -3.3%      14524 =C2=B1  3%      -1.2%      1483=
4 =C2=B1  8%  softirqs.CPU134.RCU
      4896 =C2=B1  9%      -0.1%       4889 =C2=B1 10%      +3.2%       505=
5        softirqs.CPU134.SCHED
    189.17 =C2=B1 64%      -8.7%     172.67 =C2=B1 11%     -22.3%     147.0=
0 =C2=B1 22%  softirqs.CPU134.TIMER
     14843 =C2=B1  3%      -2.6%      14458 =C2=B1  3%      -2.1%      1453=
8 =C2=B1  7%  softirqs.CPU135.RCU
      4916 =C2=B1  8%      -0.5%       4889 =C2=B1 10%      +3.1%       506=
6        softirqs.CPU135.SCHED
    223.67 =C2=B1 58%     -11.5%     198.00 =C2=B1 74%     -26.6%     164.1=
7 =C2=B1 20%  softirqs.CPU135.TIMER
     15051 =C2=B1  3%      -3.6%      14504 =C2=B1  2%      -2.8%      1462=
3 =C2=B1  7%  softirqs.CPU136.RCU
      4897 =C2=B1 11%      -0.2%       4889 =C2=B1 10%      +0.7%       493=
0 =C2=B1  8%  softirqs.CPU136.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU136.TASKLET
    157.50 =C2=B1 30%     +59.5%     251.17 =C2=B1 69%      +2.5%     161.5=
0 =C2=B1 19%  softirqs.CPU136.TIMER
     14218 =C2=B1 10%      +2.6%      14594 =C2=B1  3%      +9.6%      1558=
7 =C2=B1 15%  softirqs.CPU137.RCU
      4863 =C2=B1 11%      +0.8%       4901 =C2=B1 11%      +5.7%       514=
1        softirqs.CPU137.SCHED
    134.33 =C2=B1 22%      +7.9%     145.00 =C2=B1 18%    +162.5%     352.6=
7 =C2=B1138%  softirqs.CPU137.TIMER
     14677 =C2=B1  3%      -2.3%      14335 =C2=B1  2%      -1.8%      1441=
2 =C2=B1  7%  softirqs.CPU138.RCU
      4863 =C2=B1 11%      +0.8%       4900 =C2=B1 10%      +4.3%       507=
4        softirqs.CPU138.SCHED
      0.00          -100.0%       0.00       +3.3e+102%       3.33 =C2=B122=
3%  softirqs.CPU138.TASKLET
    192.00 =C2=B1 56%     -23.7%     146.50 =C2=B1 15%     -14.2%     164.6=
7 =C2=B1 16%  softirqs.CPU138.TIMER
     14952 =C2=B1  2%      -2.1%      14637 =C2=B1  2%      -1.9%      1466=
8 =C2=B1  7%  softirqs.CPU139.RCU
      4911 =C2=B1 10%      -2.1%       4810 =C2=B1 11%      +3.8%       509=
5        softirqs.CPU139.SCHED
      0.33 =C2=B1223%      +0.0%       0.33 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU139.TASKLET
    209.67 =C2=B1 44%     -30.1%     146.50 =C2=B1 28%     -40.0%     125.8=
3 =C2=B1 24%  softirqs.CPU139.TIMER
     15748 =C2=B1  2%      -3.4%      15218 =C2=B1  3%      -2.3%      1539=
1 =C2=B1  9%  softirqs.CPU14.RCU
      4851 =C2=B1 11%      +0.7%       4884 =C2=B1 10%      +7.1%       519=
6 =C2=B1  3%  softirqs.CPU14.SCHED
    213.17 =C2=B1 28%     -37.1%     134.00 =C2=B1 13%     +59.2%     339.3=
3 =C2=B1 93%  softirqs.CPU14.TIMER
     14985 =C2=B1  2%      -2.3%      14638 =C2=B1  2%      -2.7%      1458=
5 =C2=B1  8%  softirqs.CPU140.RCU
      4928 =C2=B1 11%      -0.7%       4894 =C2=B1 10%      +3.1%       508=
0        softirqs.CPU140.SCHED
    156.00 =C2=B1 26%     -21.5%     122.50 =C2=B1 29%     -10.0%     140.3=
3 =C2=B1 40%  softirqs.CPU140.TIMER
     14835 =C2=B1  3%      -1.8%      14564 =C2=B1  3%      -2.1%      1451=
6 =C2=B1  7%  softirqs.CPU141.RCU
      4854 =C2=B1 11%      +0.9%       4900 =C2=B1 11%      +4.3%       506=
4        softirqs.CPU141.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU141.TASKLET
    175.00 =C2=B1 10%      -9.0%     159.33 =C2=B1 23%     +15.2%     201.6=
7 =C2=B1 74%  softirqs.CPU141.TIMER
     14802 =C2=B1  9%      +1.0%      14948 =C2=B1  9%      -3.4%      1429=
2 =C2=B1  7%  softirqs.CPU142.RCU
      5060 =C2=B1 14%      -3.8%       4869 =C2=B1 11%      -0.2%       504=
8        softirqs.CPU142.SCHED
    381.50 =C2=B1131%     -57.6%     161.67 =C2=B1 47%     -62.8%     141.8=
3 =C2=B1 21%  softirqs.CPU142.TIMER
     14789 =C2=B1  9%      -2.8%      14368 =C2=B1  2%      -2.4%      1443=
3 =C2=B1  7%  softirqs.CPU143.RCU
      4908 =C2=B1 11%      +0.5%       4934 =C2=B1 10%      +3.5%       508=
1        softirqs.CPU143.SCHED
      3.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU143.TASKLET
    215.17 =C2=B1 43%     -20.4%     171.33 =C2=B1 26%     -27.8%     155.3=
3 =C2=B1 18%  softirqs.CPU143.TIMER
     21903 =C2=B1  6%      +1.9%      22314            -1.4%      21591 =C2=
=B1  4%  softirqs.CPU144.RCU
      4830 =C2=B1 12%      +1.9%       4920 =C2=B1  9%      +4.5%       504=
9        softirqs.CPU144.SCHED
    646.33 =C2=B1  9%      +7.2%     692.83 =C2=B1 26%      +1.0%     653.0=
0 =C2=B1 32%  softirqs.CPU144.TIMER
     18094 =C2=B1  4%      -2.4%      17655 =C2=B1  4%      -3.2%      1751=
0 =C2=B1  7%  softirqs.CPU145.RCU
      4867 =C2=B1 10%      +1.1%       4920 =C2=B1  9%      +4.7%       509=
6        softirqs.CPU145.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          +900.0%       1.67 =C2=
=B1223%  softirqs.CPU145.TASKLET
    394.17 =C2=B1 13%      -6.1%     370.00 =C2=B1  8%      +8.2%     426.5=
0 =C2=B1 24%  softirqs.CPU145.TIMER
     15881 =C2=B1  3%      -2.8%      15442 =C2=B1  4%      -5.9%      1493=
9 =C2=B1  6%  softirqs.CPU146.RCU
      4875 =C2=B1 10%      +0.9%       4918 =C2=B1 10%      +3.9%       506=
7        softirqs.CPU146.SCHED
    256.83 =C2=B1 19%      -9.6%     232.17 =C2=B1 13%      -4.1%     246.3=
3 =C2=B1 32%  softirqs.CPU146.TIMER
     15165 =C2=B1  4%      -2.5%      14778 =C2=B1  5%      -1.6%      1492=
2 =C2=B1  7%  softirqs.CPU147.RCU
      4817 =C2=B1 10%      +2.0%       4912 =C2=B1 10%      +5.5%       508=
0 =C2=B1  2%  softirqs.CPU147.SCHED
    213.50 =C2=B1 37%     -16.2%     178.83 =C2=B1 10%      -4.3%     204.3=
3 =C2=B1 49%  softirqs.CPU147.TIMER
     15338 =C2=B1  4%      -2.3%      14983 =C2=B1  5%      -5.4%      1451=
2 =C2=B1  6%  softirqs.CPU148.RCU
      4862 =C2=B1 11%      +1.1%       4916 =C2=B1 10%      +3.8%       504=
8        softirqs.CPU148.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU148.TASKLET
    173.83 =C2=B1 38%      -1.1%     172.00 =C2=B1 16%     -14.0%     149.5=
0 =C2=B1 11%  softirqs.CPU148.TIMER
     15336 =C2=B1  4%      -1.2%      15148 =C2=B1  6%      -5.7%      1446=
1 =C2=B1  6%  softirqs.CPU149.RCU
      4859 =C2=B1 11%      +0.3%       4873 =C2=B1 10%      +3.5%       503=
1        softirqs.CPU149.SCHED
    148.83 =C2=B1 35%     +21.9%     181.50 =C2=B1 33%      +1.6%     151.1=
7 =C2=B1 41%  softirqs.CPU149.TIMER
     15423 =C2=B1  4%      +1.2%      15609 =C2=B1  5%      -0.7%      1530=
9 =C2=B1  8%  softirqs.CPU15.RCU
      4834 =C2=B1 11%      -4.1%       4637 =C2=B1 16%      +3.5%       500=
2 =C2=B1  2%  softirqs.CPU15.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU15.TASKLET
    182.00 =C2=B1 69%     +12.8%     205.33 =C2=B1 50%     -24.2%     138.0=
0 =C2=B1 20%  softirqs.CPU15.TIMER
     15310 =C2=B1  5%      -2.8%      14882 =C2=B1  5%      -5.1%      1452=
4 =C2=B1  6%  softirqs.CPU150.RCU
      4837 =C2=B1 10%      +1.0%       4887 =C2=B1 10%      +3.7%       501=
7        softirqs.CPU150.SCHED
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU150.TASKLET
    170.67 =C2=B1 23%     -16.3%     142.83 =C2=B1 18%      -8.6%     156.0=
0 =C2=B1 22%  softirqs.CPU150.TIMER
     15511 =C2=B1  6%      -4.6%      14801 =C2=B1  4%      -6.6%      1448=
6 =C2=B1  7%  softirqs.CPU151.RCU
      4857 =C2=B1 10%      +1.4%       4923 =C2=B1 10%      +3.2%       501=
5        softirqs.CPU151.SCHED
    176.00 =C2=B1 22%     -12.4%     154.17 =C2=B1 26%      -5.5%     166.3=
3 =C2=B1 29%  softirqs.CPU151.TIMER
     15119 =C2=B1  4%      -3.2%      14640 =C2=B1  5%      -4.4%      1445=
4 =C2=B1  6%  softirqs.CPU152.RCU
      4851 =C2=B1 10%      +1.0%       4898 =C2=B1 10%      +4.1%       504=
9        softirqs.CPU152.SCHED
    156.67 =C2=B1 15%      +0.1%     156.83 =C2=B1 32%      +1.7%     159.3=
3 =C2=B1 15%  softirqs.CPU152.TIMER
     15679 =C2=B1  8%      -5.5%      14810 =C2=B1  5%      -7.6%      1448=
8 =C2=B1  6%  softirqs.CPU153.RCU
      5070 =C2=B1 16%      -3.5%       4894 =C2=B1 10%      -0.9%       502=
6 =C2=B1  2%  softirqs.CPU153.SCHED
    376.67 =C2=B1130%     -59.3%     153.33 =C2=B1 17%     -60.8%     147.5=
0 =C2=B1 37%  softirqs.CPU153.TIMER
     15657 =C2=B1  7%      -4.8%      14909 =C2=B1  5%      -7.2%      1452=
7 =C2=B1  6%  softirqs.CPU154.RCU
      4908 =C2=B1 11%      -0.7%       4875 =C2=B1 10%      +2.7%       504=
3        softirqs.CPU154.SCHED
    187.33 =C2=B1 30%     -35.1%     121.67 =C2=B1 40%     -26.8%     137.1=
7 =C2=B1 25%  softirqs.CPU154.TIMER
     15611 =C2=B1  6%      -3.9%      15005 =C2=B1  4%      -4.6%      1489=
5 =C2=B1  4%  softirqs.CPU155.RCU
      4881 =C2=B1 11%      +0.6%       4911 =C2=B1 10%      +2.1%       498=
3        softirqs.CPU155.SCHED
    207.00 =C2=B1 71%     -30.0%     145.00 =C2=B1 24%     -37.1%     130.1=
7 =C2=B1 40%  softirqs.CPU155.TIMER
     15127 =C2=B1  5%      -1.8%      14860 =C2=B1  4%      -4.4%      1446=
1 =C2=B1  6%  softirqs.CPU156.RCU
      4838 =C2=B1 11%      +1.5%       4909 =C2=B1 10%      +3.2%       499=
4        softirqs.CPU156.SCHED
    141.67 =C2=B1 11%      +0.0%     141.67 =C2=B1 32%      -9.4%     128.3=
3 =C2=B1 30%  softirqs.CPU156.TIMER
     15109 =C2=B1  5%      -2.3%      14769 =C2=B1  5%      -3.8%      1453=
9 =C2=B1  7%  softirqs.CPU157.RCU
      4848 =C2=B1 10%      +2.2%       4952 =C2=B1 10%      +4.5%       506=
4        softirqs.CPU157.SCHED
    190.83 =C2=B1 63%     +19.0%     227.00 =C2=B1 69%     -25.3%     142.5=
0 =C2=B1 38%  softirqs.CPU157.TIMER
     15079 =C2=B1  6%      -1.1%      14917 =C2=B1  8%      -4.0%      1448=
2 =C2=B1  6%  softirqs.CPU158.RCU
      4862 =C2=B1 11%      +0.2%       4874 =C2=B1 10%      +6.6%       518=
4 =C2=B1  5%  softirqs.CPU158.SCHED
    152.33 =C2=B1 12%     -15.2%     129.17 =C2=B1 15%     +51.6%     231.0=
0 =C2=B1105%  softirqs.CPU158.TIMER
     15149 =C2=B1  6%      -0.8%      15029 =C2=B1  6%      -4.6%      1444=
6 =C2=B1  6%  softirqs.CPU159.RCU
      4849 =C2=B1 10%      +1.9%       4941 =C2=B1 11%      +3.1%       499=
9 =C2=B1  2%  softirqs.CPU159.SCHED
    134.83 =C2=B1 14%     +28.1%     172.67 =C2=B1 61%     +15.3%     155.5=
0 =C2=B1 46%  softirqs.CPU159.TIMER
     15793 =C2=B1  6%      -6.9%      14698 =C2=B1 11%      -2.6%      1538=
4 =C2=B1  8%  softirqs.CPU16.RCU
      4884 =C2=B1 12%      -1.2%       4824 =C2=B1 10%      +2.8%       501=
9 =C2=B1  2%  softirqs.CPU16.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU16.TASKLET
    220.17 =C2=B1 55%     -42.8%     126.00 =C2=B1 21%     -21.6%     172.6=
7 =C2=B1  9%  softirqs.CPU16.TIMER
     15270 =C2=B1  5%      -2.4%      14909 =C2=B1  5%      -2.6%      1488=
0 =C2=B1  7%  softirqs.CPU160.RCU
      4866 =C2=B1  9%      -3.4%       4699 =C2=B1 12%      +3.9%       505=
5 =C2=B1  2%  softirqs.CPU160.SCHED
    144.17 =C2=B1 10%      +7.9%     155.50 =C2=B1 17%     +20.3%     173.5=
0 =C2=B1 42%  softirqs.CPU160.TIMER
     15245 =C2=B1  5%      -2.0%      14947 =C2=B1  5%      -2.5%      1486=
2 =C2=B1  8%  softirqs.CPU161.RCU
      4872 =C2=B1  9%      +0.8%       4914 =C2=B1 10%      +3.5%       504=
1        softirqs.CPU161.SCHED
    129.50 =C2=B1 19%     +38.1%     178.83 =C2=B1 33%     +13.4%     146.8=
3 =C2=B1 20%  softirqs.CPU161.TIMER
     15119 =C2=B1  5%      -2.0%      14824 =C2=B1  6%      -1.4%      1490=
6 =C2=B1  6%  softirqs.CPU162.RCU
      4875 =C2=B1 10%      -0.4%       4856 =C2=B1 10%      +3.2%       503=
2        softirqs.CPU162.SCHED
    160.17 =C2=B1 26%      -4.2%     153.50 =C2=B1 15%     +12.4%     180.0=
0 =C2=B1 25%  softirqs.CPU162.TIMER
     15017 =C2=B1  5%      -1.9%      14730 =C2=B1  5%      -1.7%      1476=
7 =C2=B1  9%  softirqs.CPU163.RCU
      4848 =C2=B1  9%      +0.2%       4860 =C2=B1 10%      +6.0%       513=
7 =C2=B1  3%  softirqs.CPU163.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU163.TASKLET
    152.00 =C2=B1 15%     +21.1%     184.00 =C2=B1 33%     +51.8%     230.6=
7 =C2=B1 79%  softirqs.CPU163.TIMER
     15152 =C2=B1  5%      -3.2%      14667 =C2=B1  5%      -3.5%      1461=
8 =C2=B1  7%  softirqs.CPU164.RCU
      4964 =C2=B1 12%      -1.4%       4896 =C2=B1 10%      +1.7%       504=
9        softirqs.CPU164.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU164.TASKLET
    261.83 =C2=B1101%     -38.3%     161.67 =C2=B1 26%     -32.7%     176.3=
3 =C2=B1 25%  softirqs.CPU164.TIMER
     15145 =C2=B1  5%      -2.0%      14841 =C2=B1  5%      -1.4%      1492=
6 =C2=B1  8%  softirqs.CPU165.RCU
      4846 =C2=B1 10%      +0.5%       4870 =C2=B1 10%      +3.5%       501=
5        softirqs.CPU165.SCHED
    139.83 =C2=B1 17%     +81.9%     254.33 =C2=B1 58%      +8.1%     151.1=
7 =C2=B1 17%  softirqs.CPU165.TIMER
     15212 =C2=B1  5%      -1.3%      15018 =C2=B1  4%      -2.4%      1485=
4 =C2=B1  7%  softirqs.CPU166.RCU
      4868 =C2=B1 10%      +0.5%       4892 =C2=B1 10%      +3.7%       504=
9 =C2=B1  2%  softirqs.CPU166.SCHED
    148.17 =C2=B1 22%     +27.4%     188.83 =C2=B1 51%     +18.4%     175.5=
0 =C2=B1 65%  softirqs.CPU166.TIMER
     15284 =C2=B1 10%      +6.4%      16262 =C2=B1 12%      -1.4%      1506=
8 =C2=B1  7%  softirqs.CPU167.RCU
      4879 =C2=B1 11%      +1.5%       4951 =C2=B1 11%      +4.6%       510=
4 =C2=B1  2%  softirqs.CPU167.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU167.TASKLET
    160.17 =C2=B1 16%    +127.1%     363.67 =C2=B1136%     +31.0%     209.8=
3 =C2=B1 65%  softirqs.CPU167.TIMER
     21139 =C2=B1  5%      -1.6%      20806 =C2=B1  5%      +0.5%      2124=
7 =C2=B1  6%  softirqs.CPU168.RCU
      4861 =C2=B1 10%      +1.4%       4930 =C2=B1 10%      +4.2%       506=
2 =C2=B1  2%  softirqs.CPU168.SCHED
    604.83 =C2=B1  7%     -10.7%     540.33 =C2=B1 11%     -14.8%     515.5=
0 =C2=B1 22%  softirqs.CPU168.TIMER
     16441 =C2=B1  2%      -3.0%      15945 =C2=B1  2%      +4.5%      1718=
4 =C2=B1 19%  softirqs.CPU169.RCU
      4926 =C2=B1 11%      -0.7%       4894 =C2=B1 10%      +3.2%       508=
4 =C2=B1  3%  softirqs.CPU169.SCHED
    376.17 =C2=B1 12%      -2.0%     368.50 =C2=B1 14%     +63.7%     615.6=
7 =C2=B1 77%  softirqs.CPU169.TIMER
     15538 =C2=B1  7%      -0.8%      15415 =C2=B1  3%      -1.0%      1538=
9 =C2=B1  8%  softirqs.CPU17.RCU
      4811 =C2=B1 11%      +1.0%       4859 =C2=B1 10%      +4.6%       503=
1        softirqs.CPU17.SCHED
      1.67 =C2=B1 44%     +20.0%       2.00           +20.0%       2.00    =
    softirqs.CPU17.TASKLET
    172.67 =C2=B1 53%     +19.0%     205.50 =C2=B1 56%     +17.6%     203.0=
0 =C2=B1 45%  softirqs.CPU17.TIMER
     14480 =C2=B1  3%      -2.3%      14146 =C2=B1  4%      -3.5%      1397=
3 =C2=B1  7%  softirqs.CPU170.RCU
      4925 =C2=B1 11%      -0.2%       4915 =C2=B1 10%      +2.3%       503=
8        softirqs.CPU170.SCHED
    218.67 =C2=B1 16%     +33.1%     291.00 =C2=B1 49%      -8.0%     201.1=
7 =C2=B1 20%  softirqs.CPU170.TIMER
     14111 =C2=B1  3%      -2.1%      13818 =C2=B1  3%      -0.1%      1410=
0 =C2=B1  9%  softirqs.CPU171.RCU
      4883 =C2=B1 10%      -0.6%       4854 =C2=B1 10%      +3.5%       505=
6        softirqs.CPU171.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU171.TASKLET
    135.00 =C2=B1 42%      +7.8%     145.50 =C2=B1 16%      -2.0%     132.3=
3 =C2=B1 22%  softirqs.CPU171.TIMER
     14149 =C2=B1  3%      -1.2%      13983 =C2=B1  6%      -2.9%      1374=
2 =C2=B1  7%  softirqs.CPU172.RCU
      4867 =C2=B1 10%      -4.0%       4670 =C2=B1 13%      +4.5%       508=
8        softirqs.CPU172.SCHED
    155.67 =C2=B1 18%      -6.6%     145.33 =C2=B1 10%     +30.4%     203.0=
0 =C2=B1 65%  softirqs.CPU172.TIMER
     14135 =C2=B1  3%      -3.2%      13686 =C2=B1  3%      -2.9%      1373=
1 =C2=B1  7%  softirqs.CPU173.RCU
      4865 =C2=B1 10%      +0.7%       4901 =C2=B1 10%      +4.0%       506=
0        softirqs.CPU173.SCHED
      0.00          -100.0%       0.00         +2e+102%       2.00 =C2=B122=
3%  softirqs.CPU173.TASKLET
    154.50 =C2=B1 15%      -5.2%     146.50 =C2=B1 53%      -8.0%     142.1=
7 =C2=B1 38%  softirqs.CPU173.TIMER
     14293 =C2=B1  4%      -2.9%      13873 =C2=B1  4%      -5.9%      1344=
3 =C2=B1 10%  softirqs.CPU174.RCU
      4894 =C2=B1 11%      -0.2%       4882 =C2=B1 10%      +3.1%       504=
8        softirqs.CPU174.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU174.TASKLET
    159.50 =C2=B1 15%     +16.9%     186.50 =C2=B1 53%     +10.3%     176.0=
0 =C2=B1 86%  softirqs.CPU174.TIMER
     14009 =C2=B1  3%      -2.4%      13674 =C2=B1  3%      -3.4%      1353=
8 =C2=B1  7%  softirqs.CPU175.RCU
      4827 =C2=B1 10%      +1.2%       4887 =C2=B1 10%      +4.4%       503=
8        softirqs.CPU175.SCHED
    159.00 =C2=B1 18%      +0.9%     160.50 =C2=B1 13%      -3.1%     154.0=
0 =C2=B1 27%  softirqs.CPU175.TIMER
     13834 =C2=B1  2%      -3.6%      13342 =C2=B1  3%      -3.8%      1331=
1 =C2=B1  7%  softirqs.CPU176.RCU
      4844 =C2=B1 11%      +0.3%       4858 =C2=B1 10%      +4.4%       505=
6        softirqs.CPU176.SCHED
      1.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU176.TASKLET
    149.67 =C2=B1 31%      +5.0%     157.17 =C2=B1 24%     +41.3%     211.5=
0 =C2=B1 71%  softirqs.CPU176.TIMER
     13769 =C2=B1  2%      -4.5%      13142 =C2=B1  3%      -3.8%      1323=
9 =C2=B1  9%  softirqs.CPU177.RCU
      4858 =C2=B1 10%      +0.0%       4859 =C2=B1 11%      +5.0%       510=
0        softirqs.CPU177.SCHED
      1.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU177.TASKLET
    135.50 =C2=B1 15%     +56.2%     211.67 =C2=B1 60%     +15.0%     155.8=
3 =C2=B1 25%  softirqs.CPU177.TIMER
     13868 =C2=B1  2%      -2.4%      13535 =C2=B1  4%      +3.6%      1436=
4 =C2=B1 15%  softirqs.CPU178.RCU
      4820 =C2=B1 11%      +3.0%       4964 =C2=B1 12%      +5.6%       509=
0 =C2=B1  2%  softirqs.CPU178.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU178.TASKLET
    144.83 =C2=B1 27%    +163.1%     381.00 =C2=B1132%    +155.9%     370.6=
7 =C2=B1138%  softirqs.CPU178.TIMER
     14098 =C2=B1  2%      -0.7%      14003 =C2=B1  4%      -5.5%      1332=
9 =C2=B1  7%  softirqs.CPU179.RCU
      4995 =C2=B1 13%      +2.0%       5096 =C2=B1  2%      +1.4%       506=
6        softirqs.CPU179.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU179.TASKLET
    316.83 =C2=B1121%     +33.9%     424.17 =C2=B1115%     -43.1%     180.3=
3 =C2=B1 16%  softirqs.CPU179.TIMER
      0.00       +4.3e+103%      43.50 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU18.BLOCK
     15988 =C2=B1  6%      -3.3%      15461 =C2=B1  3%      -3.7%      1540=
1 =C2=B1  9%  softirqs.CPU18.RCU
      4832 =C2=B1 11%      +0.6%       4858 =C2=B1 10%      +4.6%       505=
2        softirqs.CPU18.SCHED
      4.67 =C2=B1109%     -67.9%       1.50 =C2=B1 50%     -64.3%       1.6=
7 =C2=B1 44%  softirqs.CPU18.TASKLET
    196.33 =C2=B1 33%     -19.0%     159.00 =C2=B1 24%     +29.8%     254.8=
3 =C2=B1 57%  softirqs.CPU18.TIMER
     14039 =C2=B1  2%      -2.8%      13650 =C2=B1  3%      -3.8%      1350=
4 =C2=B1  7%  softirqs.CPU180.RCU
      4833 =C2=B1 11%      +1.2%       4892 =C2=B1 10%      +5.5%       509=
9        softirqs.CPU180.SCHED
      0.00       +2.8e+102%       2.83 =C2=B1223% +2.8e+102%       2.83 =C2=
=B1223%  softirqs.CPU180.TASKLET
    149.50 =C2=B1 22%      +3.1%     154.17 =C2=B1 25%      +0.8%     150.6=
7 =C2=B1 21%  softirqs.CPU180.TIMER
     13802 =C2=B1  2%      -3.1%      13368 =C2=B1  3%      -3.6%      1330=
1 =C2=B1  8%  softirqs.CPU181.RCU
      4851 =C2=B1 11%      +1.5%       4924 =C2=B1  9%      +4.2%       505=
7        softirqs.CPU181.SCHED
    137.17 =C2=B1 20%     +36.2%     186.83 =C2=B1 19%      -4.4%     131.1=
7 =C2=B1 14%  softirqs.CPU181.TIMER
     13866 =C2=B1  2%      -2.7%      13491 =C2=B1  4%      -3.7%      1335=
3 =C2=B1  8%  softirqs.CPU182.RCU
      4824 =C2=B1 10%      +1.9%       4918 =C2=B1  9%      +6.0%       511=
1        softirqs.CPU182.SCHED
    124.83 =C2=B1 13%     +10.1%     137.50 =C2=B1 30%     +29.1%     161.1=
7 =C2=B1 19%  softirqs.CPU182.TIMER
     13796 =C2=B1  2%      -0.5%      13727 =C2=B1  4%      -4.1%      1323=
3 =C2=B1  7%  softirqs.CPU183.RCU
      4818 =C2=B1 11%      +1.3%       4880 =C2=B1 10%      +5.1%       506=
1        softirqs.CPU183.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223% +3.3e+101%       0.33 =C2=
=B1223%  softirqs.CPU183.TASKLET
    169.00 =C2=B1 15%      -5.3%     160.00 =C2=B1 17%     +44.0%     243.3=
3 =C2=B1 56%  softirqs.CPU183.TIMER
     13921 =C2=B1  2%      -3.2%      13475 =C2=B1  4%      -4.1%      1334=
4 =C2=B1  7%  softirqs.CPU184.RCU
      4874 =C2=B1 11%      +1.6%       4953 =C2=B1 10%      +3.5%       504=
3        softirqs.CPU184.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU184.TASKLET
    146.50 =C2=B1 24%     +91.8%     281.00 =C2=B1 67%      -1.6%     144.1=
7 =C2=B1 11%  softirqs.CPU184.TIMER
     14047 =C2=B1  2%     +11.5%      15658 =C2=B1 17%      -3.8%      1350=
9 =C2=B1  7%  softirqs.CPU185.RCU
      4842 =C2=B1 11%      +4.4%       5055 =C2=B1 11%      +5.6%       511=
4        softirqs.CPU185.SCHED
    203.67 =C2=B1 27%    +251.3%     715.50 =C2=B1 85%     -23.1%     156.6=
7 =C2=B1 26%  softirqs.CPU185.TIMER
     13908 =C2=B1  2%      -3.1%      13479 =C2=B1  4%      -4.0%      1334=
6 =C2=B1  7%  softirqs.CPU186.RCU
      4811 =C2=B1 11%      +4.2%       5012 =C2=B1 12%      +0.6%       484=
0 =C2=B1  9%  softirqs.CPU186.SCHED
    146.83 =C2=B1 19%    +115.0%     315.67 =C2=B1102%     -11.2%     130.3=
3 =C2=B1 31%  softirqs.CPU186.TIMER
     13811 =C2=B1  2%      -3.4%      13347 =C2=B1  3%      -3.4%      1334=
4 =C2=B1  7%  softirqs.CPU187.RCU
      4812 =C2=B1 11%      -2.9%       4673 =C2=B1 22%      +5.3%       506=
5        softirqs.CPU187.SCHED
      0.00          -100.0%       0.00         +1e+102%       1.00 =C2=B122=
3%  softirqs.CPU187.TASKLET
    113.33 =C2=B1 15%     +76.0%     199.50 =C2=B1126%     +10.1%     124.8=
3 =C2=B1 23%  softirqs.CPU187.TIMER
     13634 =C2=B1  3%      -2.9%      13238 =C2=B1  4%      -3.8%      1311=
6 =C2=B1  7%  softirqs.CPU188.RCU
      4839 =C2=B1 11%      +0.5%       4864 =C2=B1  9%      +4.7%       506=
5        softirqs.CPU188.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU188.TASKLET
    134.17 =C2=B1 22%      +4.3%     140.00 =C2=B1 13%     +13.7%     152.5=
0 =C2=B1 24%  softirqs.CPU188.TIMER
     13851 =C2=B1  2%      -3.9%      13306 =C2=B1  3%      -4.5%      1322=
6 =C2=B1  7%  softirqs.CPU189.RCU
      4971 =C2=B1 12%      -1.8%       4880 =C2=B1 10%      +1.1%       502=
5        softirqs.CPU189.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU189.TASKLET
    375.33 =C2=B1129%     -44.5%     208.33 =C2=B1 47%     -64.0%     135.0=
0 =C2=B1 28%  softirqs.CPU189.TIMER
     15761 =C2=B1  5%      -2.4%      15389 =C2=B1  3%      -1.9%      1546=
5 =C2=B1  9%  softirqs.CPU19.RCU
      4806 =C2=B1 11%      +0.9%       4851 =C2=B1 10%      +5.3%       506=
2        softirqs.CPU19.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU19.TASKLET
    266.17 =C2=B1 75%     -37.8%     165.50 =C2=B1 12%     -41.1%     156.6=
7 =C2=B1 15%  softirqs.CPU19.TIMER
     13932 =C2=B1  3%      -1.4%      13735 =C2=B1  5%      -3.3%      1347=
9 =C2=B1  8%  softirqs.CPU190.RCU
      4613 =C2=B1 13%      +8.6%       5011 =C2=B1 12%      +9.7%       506=
0        softirqs.CPU190.SCHED
      0.00          -100.0%       0.00         +1e+102%       1.00 =C2=B122=
3%  softirqs.CPU190.TASKLET
    156.50 =C2=B1  8%    +132.8%     364.33 =C2=B1140%     +14.2%     178.6=
7 =C2=B1 47%  softirqs.CPU190.TIMER
     14153 =C2=B1  7%      -0.9%      14033 =C2=B1  4%      -1.9%      1389=
1 =C2=B1  7%  softirqs.CPU191.RCU
      4863 =C2=B1 10%      +1.2%       4920 =C2=B1 10%      +4.9%       510=
1        softirqs.CPU191.SCHED
    178.17 =C2=B1 15%      +2.8%     183.17 =C2=B1 16%      +0.5%     179.0=
0 =C2=B1 13%  softirqs.CPU191.TIMER
     15995 =C2=B1  5%      -1.0%      15832 =C2=B1  2%      -2.3%      1562=
0 =C2=B1  7%  softirqs.CPU2.RCU
      4972 =C2=B1 11%      +1.2%       5032 =C2=B1  8%      +4.8%       520=
9        softirqs.CPU2.SCHED
    255.67 =C2=B1 22%     +64.1%     419.50 =C2=B1 35%      -7.1%     237.5=
0 =C2=B1 18%  softirqs.CPU2.TIMER
     15659 =C2=B1  5%      -1.9%      15362 =C2=B1  3%      -3.1%      1518=
1 =C2=B1  8%  softirqs.CPU20.RCU
      4811 =C2=B1 11%      +0.6%       4841 =C2=B1 10%      +3.9%       500=
0 =C2=B1  2%  softirqs.CPU20.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU20.TASKLET
    139.17 =C2=B1 14%     +41.7%     197.17 =C2=B1 28%     +15.4%     160.6=
7 =C2=B1 33%  softirqs.CPU20.TIMER
     43.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU21.BLOCK
     15650 =C2=B1  5%      -1.9%      15354 =C2=B1  3%      -3.0%      1518=
0 =C2=B1  9%  softirqs.CPU21.RCU
      4839 =C2=B1 12%      -0.8%       4802 =C2=B1 10%      +3.5%       500=
6        softirqs.CPU21.SCHED
      2.00 =C2=B1 57%      +0.0%       2.00           -16.7%       1.67 =C2=
=B1 44%  softirqs.CPU21.TASKLET
    146.83 =C2=B1 25%     +21.6%     178.50 =C2=B1 38%     +16.0%     170.3=
3 =C2=B1 13%  softirqs.CPU21.TIMER
     43.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU22.BLOCK
     15977 =C2=B1  6%      -3.6%      15396 =C2=B1  3%      -3.3%      1545=
4 =C2=B1  8%  softirqs.CPU22.RCU
      4834 =C2=B1 11%      -0.2%       4826 =C2=B1 10%      +4.2%       503=
8 =C2=B1  2%  softirqs.CPU22.SCHED
      1.83 =C2=B1 48%    +181.8%       5.17 =C2=B1137%      -9.1%       1.6=
7 =C2=B1 44%  softirqs.CPU22.TASKLET
    172.50 =C2=B1  4%      +2.1%     176.17 =C2=B1 18%     +20.0%     207.0=
0 =C2=B1 49%  softirqs.CPU22.TIMER
      0.00       +4.3e+103%      43.50 =C2=B1223% +8.7e+103%      87.00 =C2=
=B1141%  softirqs.CPU23.BLOCK
     16728 =C2=B1 16%      -7.3%      15501 =C2=B1  3%      -7.2%      1551=
7 =C2=B1  7%  softirqs.CPU23.RCU
      4839 =C2=B1 11%      +1.0%       4885 =C2=B1 12%      +6.2%       513=
9 =C2=B1  4%  softirqs.CPU23.SCHED
      0.83 =C2=B1107%    -100.0%       0.00           -20.0%       0.67 =C2=
=B1141%  softirqs.CPU23.TASKLET
    386.33 =C2=B1131%     -46.0%     208.67 =C2=B1 95%      +1.7%     393.0=
0 =C2=B1131%  softirqs.CPU23.TIMER
     15805 =C2=B1  6%      -2.6%      15396 =C2=B1  2%      -0.4%      1574=
6 =C2=B1  7%  softirqs.CPU24.RCU
      4864 =C2=B1 11%      -0.5%       4839 =C2=B1 10%      +4.9%       510=
1        softirqs.CPU24.SCHED
      2.00            +8.3%       2.17 =C2=B1 17%      +0.0%       2.00    =
    softirqs.CPU24.TASKLET
    408.83 =C2=B1 27%     -22.8%     315.67 =C2=B1 14%     -21.6%     320.3=
3 =C2=B1 13%  softirqs.CPU24.TIMER
     16494 =C2=B1  6%      +0.6%      16599 =C2=B1  5%      -0.1%      1647=
0 =C2=B1  7%  softirqs.CPU25.RCU
      4923 =C2=B1 12%      -0.7%       4888 =C2=B1 11%      +2.8%       506=
2        softirqs.CPU25.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU25.TASKLET
    492.33 =C2=B1 45%     -38.0%     305.17 =C2=B1 15%     -29.9%     345.3=
3 =C2=B1 30%  softirqs.CPU25.TIMER
     15799 =C2=B1  6%      -2.4%      15416 =C2=B1  3%      +0.0%      1580=
1 =C2=B1  7%  softirqs.CPU26.RCU
      4840 =C2=B1 10%      +0.8%       4881 =C2=B1 10%      +4.7%       506=
8        softirqs.CPU26.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU26.TASKLET
    200.17 =C2=B1 20%     +76.4%     353.17 =C2=B1 44%     +24.7%     249.6=
7 =C2=B1 30%  softirqs.CPU26.TIMER
     15697 =C2=B1  5%      +0.5%      15772 =C2=B1  5%      +1.2%      1587=
9 =C2=B1  7%  softirqs.CPU27.RCU
      4864 =C2=B1 12%      +0.9%       4908 =C2=B1 10%      +3.5%       503=
6        softirqs.CPU27.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU27.TASKLET
    145.33 =C2=B1 28%      -7.7%     134.17 =C2=B1 20%     +29.6%     188.3=
3 =C2=B1 53%  softirqs.CPU27.TIMER
     15725 =C2=B1  5%      -2.9%      15270 =C2=B1  3%      +0.5%      1581=
1 =C2=B1  7%  softirqs.CPU28.RCU
      4858 =C2=B1 11%      +0.5%       4883 =C2=B1 11%      +3.8%       504=
4        softirqs.CPU28.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU28.TASKLET
    161.00 =C2=B1 26%      +7.5%     173.00 =C2=B1 81%     -17.4%     133.0=
0 =C2=B1 12%  softirqs.CPU28.TIMER
     15818 =C2=B1  6%      -3.3%      15295 =C2=B1  3%      -0.4%      1575=
1 =C2=B1  7%  softirqs.CPU29.RCU
      4871 =C2=B1 11%      -0.4%       4852 =C2=B1 10%      +4.2%       507=
5        softirqs.CPU29.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU29.TASKLET
    156.00 =C2=B1 24%     -10.5%     139.67 =C2=B1 17%     +13.8%     177.5=
0 =C2=B1 56%  softirqs.CPU29.TIMER
     15636 =C2=B1  4%      -1.0%      15480 =C2=B1  2%      -0.8%      1550=
9 =C2=B1 10%  softirqs.CPU3.RCU
      4919 =C2=B1 11%      -1.0%       4872 =C2=B1 10%      +8.8%       535=
3 =C2=B1  8%  softirqs.CPU3.SCHED
      0.00          -100.0%       0.00       +3.3e+101%       0.33 =C2=B114=
1%  softirqs.CPU3.TASKLET
    211.50 =C2=B1 26%     -19.6%     170.00 =C2=B1 17%    +178.7%     589.5=
0 =C2=B1152%  softirqs.CPU3.TIMER
     15717 =C2=B1  5%      -1.7%      15451 =C2=B1  3%      +0.1%      1572=
7 =C2=B1  7%  softirqs.CPU30.RCU
      4639 =C2=B1 14%      +4.9%       4865 =C2=B1 11%     +10.0%       510=
4 =C2=B1  2%  softirqs.CPU30.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU30.TASKLET
    156.83 =C2=B1 13%      -9.5%     142.00 =C2=B1 24%     +18.9%     186.5=
0 =C2=B1 59%  softirqs.CPU30.TIMER
     15720 =C2=B1  5%      -2.4%      15341 =C2=B1  3%      -0.1%      1571=
1 =C2=B1  7%  softirqs.CPU31.RCU
      4885 =C2=B1 11%      +0.2%       4896 =C2=B1 10%      +4.2%       509=
1        softirqs.CPU31.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU31.TASKLET
    119.83 =C2=B1 21%     +71.6%     205.67 =C2=B1 54%     +65.2%     198.0=
0 =C2=B1 17%  softirqs.CPU31.TIMER
     15996 =C2=B1  5%      -2.1%      15660 =C2=B1  2%      -1.4%      1577=
7 =C2=B1  7%  softirqs.CPU32.RCU
      4910 =C2=B1 11%      -1.8%       4821 =C2=B1 11%      +3.2%       506=
8        softirqs.CPU32.SCHED
    138.83 =C2=B1  5%     +31.9%     183.17 =C2=B1 22%     +22.7%     170.3=
3 =C2=B1 22%  softirqs.CPU32.TIMER
     16040 =C2=B1  5%      -0.9%      15898 =C2=B1  4%      -0.3%      1599=
6 =C2=B1  7%  softirqs.CPU33.RCU
      4874 =C2=B1 11%      -0.2%       4865 =C2=B1 10%      +5.5%       514=
4 =C2=B1  2%  softirqs.CPU33.SCHED
    156.33 =C2=B1 28%      -1.0%     154.83 =C2=B1 14%     +77.9%     278.1=
7 =C2=B1 56%  softirqs.CPU33.TIMER
     16102 =C2=B1  5%      -1.5%      15858 =C2=B1  3%      -0.3%      1605=
1 =C2=B1  7%  softirqs.CPU34.RCU
      4853 =C2=B1 11%      -0.4%       4833 =C2=B1 11%      +3.7%       503=
2        softirqs.CPU34.SCHED
    185.33 =C2=B1  6%      -9.4%     168.00 =C2=B1 14%      -6.9%     172.5=
0 =C2=B1 15%  softirqs.CPU34.TIMER
     16372 =C2=B1  3%      -2.8%      15910 =C2=B1  3%      -1.6%      1611=
2 =C2=B1  7%  softirqs.CPU35.RCU
      4858 =C2=B1 11%      +0.2%       4868 =C2=B1 10%      +4.2%       506=
1        softirqs.CPU35.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223% +1.7e+101%       0.17 =C2=
=B1223%  softirqs.CPU35.TASKLET
    165.83 =C2=B1 21%      -1.7%     163.00 =C2=B1 26%     +17.6%     195.0=
0 =C2=B1 43%  softirqs.CPU35.TIMER
     16247 =C2=B1  5%      -1.0%      16081 =C2=B1  3%      -1.3%      1603=
2 =C2=B1  7%  softirqs.CPU36.RCU
      4857 =C2=B1 11%      -0.4%       4839 =C2=B1 11%      +4.1%       505=
7        softirqs.CPU36.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU36.TASKLET
    170.00 =C2=B1 11%     +11.4%     189.33 =C2=B1 33%      +9.0%     185.3=
3 =C2=B1  5%  softirqs.CPU36.TIMER
     15849 =C2=B1  4%      -1.8%      15557 =C2=B1  2%      -0.5%      1576=
6 =C2=B1  7%  softirqs.CPU37.RCU
      4886 =C2=B1 11%      +0.3%       4903 =C2=B1 11%      +3.0%       503=
5        softirqs.CPU37.SCHED
    190.33 =C2=B1 70%     -38.8%     116.50 =C2=B1 25%     -11.5%     168.5=
0 =C2=B1 26%  softirqs.CPU37.TIMER
     16023 =C2=B1  4%      -2.0%      15698 =C2=B1  2%      -0.3%      1598=
2 =C2=B1  8%  softirqs.CPU38.RCU
      4842 =C2=B1 11%      +1.3%       4903 =C2=B1 10%      +3.1%       499=
1        softirqs.CPU38.SCHED
    179.50 =C2=B1 18%     -10.7%     160.33 =C2=B1  8%     -10.2%     161.1=
7 =C2=B1 21%  softirqs.CPU38.TIMER
     16413 =C2=B1  6%      -3.9%      15766 =C2=B1  2%      -2.9%      1593=
0 =C2=B1  7%  softirqs.CPU39.RCU
      4917 =C2=B1  9%      -1.0%       4867 =C2=B1 10%      +3.1%       507=
1        softirqs.CPU39.SCHED
      0.17 =C2=B1223%    -100.0%       0.00            +0.0%       0.17 =C2=
=B1223%  softirqs.CPU39.TASKLET
    250.17 =C2=B1 37%     -43.2%     142.17 =C2=B1 17%     -29.2%     177.1=
7 =C2=B1 40%  softirqs.CPU39.TIMER
     15631 =C2=B1  5%      -1.8%      15353 =C2=B1  2%      -6.7%      1458=
0 =C2=B1 14%  softirqs.CPU4.RCU
      4634 =C2=B1 15%      +4.7%       4854 =C2=B1 10%      +2.5%       475=
2 =C2=B1 12%  softirqs.CPU4.SCHED
    153.17 =C2=B1 23%     +10.6%     169.33 =C2=B1 22%     +17.8%     180.5=
0 =C2=B1 40%  softirqs.CPU4.TIMER
     16214 =C2=B1  5%      +0.1%      16233 =C2=B1  6%      -1.0%      1605=
2 =C2=B1  7%  softirqs.CPU40.RCU
      4945 =C2=B1  8%      -1.6%       4865 =C2=B1 10%      -0.4%       492=
8 =C2=B1  4%  softirqs.CPU40.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU40.TASKLET
    215.00 =C2=B1 72%     -31.8%     146.67 =C2=B1 21%      -2.6%     209.5=
0 =C2=B1 53%  softirqs.CPU40.TIMER
     16169 =C2=B1  5%      -0.9%      16022 =C2=B1  3%      -0.5%      1608=
2 =C2=B1  7%  softirqs.CPU41.RCU
      4876 =C2=B1 11%      +0.8%       4914 =C2=B1 11%      +3.2%       503=
0        softirqs.CPU41.SCHED
    162.33 =C2=B1 19%      +7.7%     174.83 =C2=B1 19%     +11.2%     180.5=
0 =C2=B1 27%  softirqs.CPU41.TIMER
     16195 =C2=B1  5%      -1.7%      15914 =C2=B1  2%      -0.2%      1616=
7 =C2=B1  7%  softirqs.CPU42.RCU
      4858 =C2=B1 11%      -4.0%       4663 =C2=B1 13%      +4.3%       506=
6        softirqs.CPU42.SCHED
    212.83 =C2=B1 57%     -38.6%     130.67 =C2=B1 22%     -24.1%     161.5=
0 =C2=B1 44%  softirqs.CPU42.TIMER
     16015 =C2=B1  5%      -1.2%      15826 =C2=B1  2%      -0.3%      1596=
6 =C2=B1  7%  softirqs.CPU43.RCU
      4855 =C2=B1 11%      -1.8%       4766 =C2=B1 11%      +3.2%       501=
2        softirqs.CPU43.SCHED
    134.33 =C2=B1 21%      +9.6%     147.17 =C2=B1 31%      +5.2%     141.3=
3 =C2=B1 26%  softirqs.CPU43.TIMER
     16000 =C2=B1  4%      -1.0%      15846 =C2=B1  2%      -0.2%      1596=
4 =C2=B1  7%  softirqs.CPU44.RCU
      4867 =C2=B1 11%      +0.5%       4890 =C2=B1 11%      +3.4%       503=
3        softirqs.CPU44.SCHED
    150.67 =C2=B1 19%     +19.5%     180.00 =C2=B1 28%      -3.3%     145.6=
7 =C2=B1 19%  softirqs.CPU44.TIMER
     16221 =C2=B1  6%      -2.2%      15871 =C2=B1  3%      -0.7%      1610=
4 =C2=B1  7%  softirqs.CPU45.RCU
      4893 =C2=B1 11%      -0.1%       4890 =C2=B1 11%      +3.9%       508=
2        softirqs.CPU45.SCHED
    162.17 =C2=B1 21%      +5.3%     170.83 =C2=B1 14%      +8.6%     176.1=
7 =C2=B1 17%  softirqs.CPU45.TIMER
     16047 =C2=B1  5%      +1.0%      16204 =C2=B1  4%      +2.3%      1641=
8 =C2=B1  6%  softirqs.CPU46.RCU
      4849 =C2=B1 11%      +0.5%       4876 =C2=B1 12%      +4.0%       504=
5        softirqs.CPU46.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU46.TASKLET
    185.17 =C2=B1 22%      +3.6%     191.83 =C2=B1 43%      +0.1%     185.3=
3 =C2=B1 32%  softirqs.CPU46.TIMER
     16321 =C2=B1  5%      -2.6%      15893 =C2=B1  2%      +0.2%      1634=
6 =C2=B1  7%  softirqs.CPU47.RCU
      4977 =C2=B1 13%      -1.5%       4904 =C2=B1 11%      +2.0%       507=
7 =C2=B1  2%  softirqs.CPU47.SCHED
    343.33 =C2=B1 78%     -48.5%     176.83 =C2=B1 12%     -38.3%     212.0=
0 =C2=B1 42%  softirqs.CPU47.TIMER
     15277 =C2=B1  4%      -3.9%      14680 =C2=B1  4%      -3.4%      1475=
8 =C2=B1  6%  softirqs.CPU48.RCU
      4886 =C2=B1 10%      -0.8%       4845 =C2=B1 10%      +3.6%       506=
3        softirqs.CPU48.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU48.TASKLET
    495.17 =C2=B1 34%     -19.4%     399.33 =C2=B1 36%      -6.1%     464.8=
3 =C2=B1 38%  softirqs.CPU48.TIMER
     15664 =C2=B1  5%      +0.3%      15711 =C2=B1  5%      -2.9%      1521=
1 =C2=B1  5%  softirqs.CPU49.RCU
      4831 =C2=B1 10%      -0.0%       4830 =C2=B1 10%      +3.9%       502=
0        softirqs.CPU49.SCHED
      2.00            +0.0%       2.00            +8.3%       2.17 =C2=B1 1=
7%  softirqs.CPU49.TASKLET
    415.67 =C2=B1 36%     -28.1%     298.67 =C2=B1 14%     -27.7%     300.6=
7 =C2=B1  7%  softirqs.CPU49.TIMER
     15666 =C2=B1  5%      -2.0%      15346 =C2=B1  2%      -2.6%      1526=
5 =C2=B1  8%  softirqs.CPU5.RCU
      4848 =C2=B1 11%      -0.4%       4829 =C2=B1 10%      -1.4%       478=
2 =C2=B1 12%  softirqs.CPU5.SCHED
    110.17 =C2=B1 13%     +16.9%     128.83 =C2=B1 14%     +13.2%     124.6=
7 =C2=B1 17%  softirqs.CPU5.TIMER
     15433 =C2=B1  3%      -2.4%      15062 =C2=B1  5%      -5.5%      1457=
9 =C2=B1  6%  softirqs.CPU50.RCU
      4833 =C2=B1 10%      -0.2%       4824 =C2=B1 10%      +3.7%       501=
1        softirqs.CPU50.SCHED
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    softirqs.CPU50.TASKLET
    213.00 =C2=B1 21%      +8.6%     231.33 =C2=B1 16%      +7.4%     228.8=
3 =C2=B1 12%  softirqs.CPU50.TIMER
     14780 =C2=B1  5%      -1.5%      14561 =C2=B1  4%      -2.8%      1436=
5 =C2=B1  6%  softirqs.CPU51.RCU
      4828 =C2=B1 10%      -0.5%       4801 =C2=B1 10%      +4.0%       501=
9        softirqs.CPU51.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU51.TASKLET
    181.17 =C2=B1 34%     -29.3%     128.17 =C2=B1 27%      +0.0%     181.1=
7 =C2=B1 30%  softirqs.CPU51.TIMER
     15197 =C2=B1  6%      -4.1%      14579 =C2=B1  4%      -5.6%      1434=
0 =C2=B1  6%  softirqs.CPU52.RCU
      4837 =C2=B1 10%      -0.6%       4809 =C2=B1 10%      +3.9%       502=
8        softirqs.CPU52.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU52.TASKLET
    144.17 =C2=B1 12%     +10.8%     159.67 =C2=B1 13%     +12.6%     162.3=
3 =C2=B1 18%  softirqs.CPU52.TIMER
     14956 =C2=B1  5%      -1.1%      14790 =C2=B1  5%      -3.9%      1436=
6 =C2=B1  7%  softirqs.CPU53.RCU
      4833 =C2=B1 10%      -0.3%       4820 =C2=B1 10%      +3.4%       499=
6        softirqs.CPU53.SCHED
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    softirqs.CPU53.TASKLET
    143.00 =C2=B1 12%     +26.6%     181.00 =C2=B1 18%      -2.9%     138.8=
3 =C2=B1 32%  softirqs.CPU53.TIMER
     15036 =C2=B1  4%      -2.8%      14612 =C2=B1  4%      -3.5%      1451=
5 =C2=B1  6%  softirqs.CPU54.RCU
      4831 =C2=B1 10%      -0.5%       4804 =C2=B1 10%      +3.0%       497=
6        softirqs.CPU54.SCHED
      2.17 =C2=B1 17%      -7.7%       2.00            -7.7%       2.00    =
    softirqs.CPU54.TASKLET
    153.00 =C2=B1 15%     -13.6%     132.17 =C2=B1 10%      -9.5%     138.5=
0 =C2=B1 17%  softirqs.CPU54.TIMER
     15105 =C2=B1  6%      -3.4%      14598 =C2=B1  3%      -3.6%      1456=
1 =C2=B1  9%  softirqs.CPU55.RCU
      4827 =C2=B1 10%      +0.2%       4835 =C2=B1 10%      +2.8%       496=
0        softirqs.CPU55.SCHED
      2.00            +0.0%       2.00           +66.7%       3.33 =C2=B1 8=
9%  softirqs.CPU55.TASKLET
    178.33 =C2=B1 25%      -3.2%     172.67 =C2=B1 17%     -21.7%     139.6=
7 =C2=B1 37%  softirqs.CPU55.TIMER
     14745 =C2=B1  5%      -2.1%      14440 =C2=B1  3%      -7.6%      1362=
3 =C2=B1 13%  softirqs.CPU56.RCU
      4605 =C2=B1 22%      +5.0%       4837 =C2=B1 10%      +7.9%       497=
1 =C2=B1  2%  softirqs.CPU56.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU56.TASKLET
    147.33 =C2=B1 19%      -7.2%     136.67 =C2=B1 37%      +2.8%     151.5=
0 =C2=B1 45%  softirqs.CPU56.TIMER
     14711 =C2=B1  5%      -2.6%      14335 =C2=B1  4%      -8.2%      1350=
4 =C2=B1  5%  softirqs.CPU57.RCU
      4981 =C2=B1  4%      -2.9%       4836 =C2=B1 10%      +0.2%       498=
9 =C2=B1  2%  softirqs.CPU57.SCHED
    158.50 =C2=B1 12%      +6.9%     169.50 =C2=B1 25%      -6.9%     147.5=
0 =C2=B1 22%  softirqs.CPU57.TIMER
     14859 =C2=B1  4%      -2.5%      14483 =C2=B1  4%      -4.1%      1424=
7 =C2=B1  7%  softirqs.CPU58.RCU
      4898 =C2=B1  6%      -1.1%       4845 =C2=B1 10%      +2.3%       500=
9        softirqs.CPU58.SCHED
    219.00 =C2=B1 74%     -39.1%     133.33 =C2=B1 14%     -36.3%     139.5=
0 =C2=B1 31%  softirqs.CPU58.TIMER
     15281            -3.9%      14678 =C2=B1  4%      -4.3%      14623 =C2=
=B1 10%  softirqs.CPU59.RCU
      4797 =C2=B1 10%      +1.3%       4859 =C2=B1 10%      +3.6%       497=
0        softirqs.CPU59.SCHED
    140.67 =C2=B1  8%      +5.3%     148.17 =C2=B1 33%     +30.7%     183.8=
3 =C2=B1 83%  softirqs.CPU59.TIMER
      1.00            +0.0%       1.00           +16.7%       1.17 =C2=B1 3=
1%  softirqs.CPU6.HI
     15611 =C2=B1  5%      -1.4%      15397 =C2=B1  2%      -2.6%      1520=
9 =C2=B1  8%  softirqs.CPU6.RCU
      4825 =C2=B1 11%      -1.3%       4763 =C2=B1 10%      +6.2%       512=
2 =C2=B1  2%  softirqs.CPU6.SCHED
     36.00            +0.0%      36.00            +0.5%      36.17        s=
oftirqs.CPU6.TASKLET
    164.50 =C2=B1 19%      -3.7%     158.33 =C2=B1 20%     +51.1%     248.5=
0 =C2=B1 61%  softirqs.CPU6.TIMER
     14897 =C2=B1  5%      -2.0%      14592 =C2=B1  4%      -3.7%      1435=
1 =C2=B1  7%  softirqs.CPU60.RCU
      4983 =C2=B1 12%      -2.3%       4870 =C2=B1 10%      +0.7%       501=
8        softirqs.CPU60.SCHED
    315.50 =C2=B1107%     -37.0%     198.83 =C2=B1 70%     -57.3%     134.6=
7 =C2=B1 16%  softirqs.CPU60.TIMER
     14828 =C2=B1  5%      -2.1%      14520 =C2=B1  3%      -2.5%      1445=
9 =C2=B1  9%  softirqs.CPU61.RCU
      4813 =C2=B1 10%      +0.6%       4840 =C2=B1 10%      +8.7%       523=
4 =C2=B1 11%  softirqs.CPU61.SCHED
    164.00 =C2=B1 11%      -3.0%     159.00 =C2=B1 19%    +145.2%     402.1=
7 =C2=B1159%  softirqs.CPU61.TIMER
     14605 =C2=B1  7%      -4.7%      13918 =C2=B1 11%      -3.3%      1412=
7 =C2=B1  7%  softirqs.CPU62.RCU
      4968 =C2=B1 13%      -0.6%       4940 =C2=B1 12%      +0.2%       497=
9        softirqs.CPU62.SCHED
    364.33 =C2=B1130%     -57.6%     154.33 =C2=B1 55%     -70.7%     106.6=
7 =C2=B1 24%  softirqs.CPU62.TIMER
     14535 =C2=B1  7%      -1.0%      14396 =C2=B1  4%      -2.7%      1413=
9 =C2=B1  6%  softirqs.CPU63.RCU
      4827 =C2=B1 11%      +0.6%       4856 =C2=B1  9%      +4.5%       504=
3        softirqs.CPU63.SCHED
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    +100.0%       0.3=
3 =C2=B1223%  softirqs.CPU63.TASKLET
    146.00 =C2=B1 17%      -0.3%     145.50 =C2=B1 20%      -1.4%     144.0=
0 =C2=B1 20%  softirqs.CPU63.TIMER
     15716 =C2=B1  6%      -2.3%      15353 =C2=B1  4%      -1.3%      1551=
2 =C2=B1  7%  softirqs.CPU64.RCU
      4833 =C2=B1 11%      +1.6%       4910 =C2=B1 12%      +4.0%       502=
7        softirqs.CPU64.SCHED
    150.83 =C2=B1 20%     +18.2%     178.33 =C2=B1 15%     +52.5%     230.0=
0 =C2=B1 70%  softirqs.CPU64.TIMER
     15679 =C2=B1  6%      -2.3%      15319 =C2=B1  4%      -2.1%      1535=
3 =C2=B1  7%  softirqs.CPU65.RCU
      4856 =C2=B1 10%      +1.0%       4906 =C2=B1 11%      +7.4%       521=
5 =C2=B1  7%  softirqs.CPU65.SCHED
    130.33 =C2=B1 22%     +69.1%     220.33 =C2=B1 56%    +211.3%     405.6=
7 =C2=B1126%  softirqs.CPU65.TIMER
     15748 =C2=B1  7%      -3.9%      15127 =C2=B1  4%      -3.9%      1514=
1 =C2=B1  7%  softirqs.CPU66.RCU
      4861 =C2=B1 10%      +0.2%       4872 =C2=B1 11%      +3.9%       505=
1        softirqs.CPU66.SCHED
    222.83 =C2=B1 39%     -33.7%     147.67 =C2=B1 19%     -19.4%     179.6=
7 =C2=B1 34%  softirqs.CPU66.TIMER
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU67.NET_TX
     15436 =C2=B1  5%      -1.8%      15166 =C2=B1  5%      -2.1%      1511=
9 =C2=B1  7%  softirqs.CPU67.RCU
      4833 =C2=B1 11%      +0.3%       4847 =C2=B1 11%      +4.0%       502=
7        softirqs.CPU67.SCHED
      0.00         +3e+102%       3.00 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU67.TASKLET
    167.67 =C2=B1 12%      -1.0%     166.00 =C2=B1 13%      -4.6%     160.0=
0 =C2=B1 27%  softirqs.CPU67.TIMER
     15466 =C2=B1  6%      -2.3%      15118 =C2=B1  4%      -1.8%      1518=
4 =C2=B1  8%  softirqs.CPU68.RCU
      4812 =C2=B1 10%      +0.1%       4817 =C2=B1 10%      +4.5%       503=
1 =C2=B1  2%  softirqs.CPU68.SCHED
    240.83 =C2=B1 80%     -44.2%     134.33 =C2=B1 14%     -27.4%     174.8=
3 =C2=B1 28%  softirqs.CPU68.TIMER
     15506 =C2=B1  6%      -2.2%      15165 =C2=B1  4%      -2.5%      1511=
5 =C2=B1  7%  softirqs.CPU69.RCU
      4848 =C2=B1 10%      +0.7%       4884 =C2=B1 11%      +4.3%       505=
9 =C2=B1  2%  softirqs.CPU69.SCHED
    145.00 =C2=B1  7%     +59.4%     231.17 =C2=B1 51%      -4.1%     139.0=
0 =C2=B1 21%  softirqs.CPU69.TIMER
     15302 =C2=B1  4%      -1.6%      15061 =C2=B1  2%      -3.1%      1482=
0 =C2=B1  8%  softirqs.CPU7.RCU
      4889 =C2=B1 11%      -3.4%       4722 =C2=B1 18%      +3.2%       504=
4 =C2=B1  2%  softirqs.CPU7.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1141%    -100.0%       0.00    =
    softirqs.CPU7.TASKLET
    198.67 =C2=B1 44%     +81.5%     360.67 =C2=B1 99%     -18.6%     161.6=
7 =C2=B1 19%  softirqs.CPU7.TIMER
     15445 =C2=B1  5%      -1.3%      15238 =C2=B1  5%      -1.7%      1517=
6 =C2=B1  7%  softirqs.CPU70.RCU
      4810 =C2=B1 10%      +0.8%       4847 =C2=B1 10%      +4.5%       502=
7 =C2=B1  2%  softirqs.CPU70.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU70.TASKLET
    204.33 =C2=B1 53%     -27.5%     148.17 =C2=B1 72%     -35.5%     131.8=
3 =C2=B1 16%  softirqs.CPU70.TIMER
     15352 =C2=B1 10%      -0.6%      15261 =C2=B1  4%      -1.3%      1515=
4 =C2=B1  7%  softirqs.CPU71.RCU
      4832 =C2=B1 10%      -3.4%       4665 =C2=B1 11%      +3.7%       501=
0        softirqs.CPU71.SCHED
    202.67 =C2=B1 53%     -36.8%     128.17 =C2=B1 20%     -17.4%     167.3=
3 =C2=B1 20%  softirqs.CPU71.TIMER
     14481 =C2=B1  5%      -2.1%      14171 =C2=B1  2%      -2.1%      1417=
9 =C2=B1  7%  softirqs.CPU72.RCU
      4832 =C2=B1 10%      +0.5%       4856 =C2=B1 10%      +5.6%       510=
1        softirqs.CPU72.SCHED
      2.00            +0.0%       2.00            +8.3%       2.17 =C2=B1 1=
7%  softirqs.CPU72.TASKLET
    371.67 =C2=B1 31%     -22.5%     288.17 =C2=B1  7%     +10.1%     409.3=
3 =C2=B1 35%  softirqs.CPU72.TIMER
     15465 =C2=B1  2%      -3.5%      14919 =C2=B1  4%      -2.8%      1503=
9 =C2=B1  7%  softirqs.CPU73.RCU
      4803 =C2=B1 11%      +0.1%       4808 =C2=B1 10%      +4.1%       500=
1        softirqs.CPU73.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU73.TASKLET
    332.50 =C2=B1 29%      +1.6%     337.67 =C2=B1 37%     -17.0%     276.0=
0 =C2=B1  5%  softirqs.CPU73.TIMER
     14716 =C2=B1  4%      -2.7%      14325 =C2=B1  4%      -0.0%      1471=
1 =C2=B1  7%  softirqs.CPU74.RCU
      4927 =C2=B1 13%      -0.7%       4892 =C2=B1  4%      +0.1%       493=
4 =C2=B1  2%  softirqs.CPU74.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU74.TASKLET
    347.83 =C2=B1 89%     +35.3%     470.50 =C2=B1104%     -47.2%     183.6=
7 =C2=B1 13%  softirqs.CPU74.TIMER
     14419 =C2=B1  3%      -2.1%      14119 =C2=B1  4%      -1.7%      1416=
9 =C2=B1  7%  softirqs.CPU75.RCU
      4831 =C2=B1 12%      -0.3%       4815 =C2=B1 10%      +4.5%       504=
7        softirqs.CPU75.SCHED
      2.00            +0.0%       2.00           +75.0%       3.50 =C2=B1 9=
5%  softirqs.CPU75.TASKLET
    138.33 =C2=B1 74%     +30.2%     180.17 =C2=B1 64%     +23.1%     170.3=
3 =C2=B1 62%  softirqs.CPU75.TIMER
     14519 =C2=B1  4%      -2.3%      14180 =C2=B1  4%      -2.7%      1412=
7 =C2=B1  8%  softirqs.CPU76.RCU
      4869 =C2=B1 12%      -1.7%       4784 =C2=B1  9%      +3.1%       501=
8        softirqs.CPU76.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU76.TASKLET
    275.33 =C2=B1 66%     -46.4%     147.50 =C2=B1 28%     -45.1%     151.1=
7 =C2=B1 35%  softirqs.CPU76.TIMER
     14545 =C2=B1  4%      -1.8%      14288 =C2=B1  4%      -2.5%      1418=
3 =C2=B1  8%  softirqs.CPU77.RCU
      4833 =C2=B1 11%      +3.8%       5017 =C2=B1 15%      +3.8%       501=
6        softirqs.CPU77.SCHED
      2.83 =C2=B1 65%     -29.4%       2.00           -29.4%       2.00    =
    softirqs.CPU77.TASKLET
    153.50 =C2=B1 16%    +231.3%     508.50 =C2=B1158%     +12.4%     172.5=
0 =C2=B1 38%  softirqs.CPU77.TIMER
     14495 =C2=B1  4%      -1.2%      14314 =C2=B1  3%      -1.8%      1422=
7 =C2=B1  7%  softirqs.CPU78.RCU
      4864 =C2=B1 12%      -0.3%       4850 =C2=B1 10%      +2.7%       499=
6        softirqs.CPU78.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU78.TASKLET
    197.33 =C2=B1 53%     -36.9%     124.50 =C2=B1 29%      -9.1%     179.3=
3 =C2=B1 63%  softirqs.CPU78.TIMER
     14257 =C2=B1  3%      -1.4%      14051 =C2=B1  4%      -0.5%      1417=
9 =C2=B1  7%  softirqs.CPU79.RCU
      4794 =C2=B1 11%      +0.7%       4826 =C2=B1 10%      +5.6%       506=
3 =C2=B1  2%  softirqs.CPU79.SCHED
      2.83 =C2=B1 65%     -29.4%       2.00           -29.4%       2.00    =
    softirqs.CPU79.TASKLET
    212.50 =C2=B1 47%     -40.2%     127.00 =C2=B1 18%     -12.1%     186.8=
3 =C2=B1 41%  softirqs.CPU79.TIMER
     15585 =C2=B1  6%      -3.2%      15093 =C2=B1  3%      -4.2%      1492=
5 =C2=B1  8%  softirqs.CPU8.RCU
      4882 =C2=B1 12%      -0.8%       4844 =C2=B1 10%      +4.7%       511=
0 =C2=B1  5%  softirqs.CPU8.SCHED
    197.00 =C2=B1 42%     -16.4%     164.67 =C2=B1 17%     +41.1%     278.0=
0 =C2=B1 90%  softirqs.CPU8.TIMER
     14465 =C2=B1  6%      -1.6%      14230 =C2=B1  3%      +0.5%      1453=
8 =C2=B1  8%  softirqs.CPU80.RCU
      4801 =C2=B1 11%      +0.5%       4826 =C2=B1 10%      +4.4%       501=
4        softirqs.CPU80.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU80.TASKLET
    178.50 =C2=B1 27%      -4.3%     170.83 =C2=B1 21%      -5.9%     168.0=
0 =C2=B1 37%  softirqs.CPU80.TIMER
     14449 =C2=B1  6%      -1.4%      14250 =C2=B1  3%      -0.8%      1434=
0 =C2=B1  7%  softirqs.CPU81.RCU
      4794 =C2=B1 11%      +1.1%       4848 =C2=B1 10%      +5.0%       503=
1        softirqs.CPU81.SCHED
    109.50 =C2=B1 21%     +92.7%     211.00 =C2=B1 29%     +63.2%     178.6=
7 =C2=B1 54%  softirqs.CPU81.TIMER
     14427 =C2=B1  6%      -0.8%      14317 =C2=B1  2%      -0.3%      1438=
9 =C2=B1  9%  softirqs.CPU82.RCU
      4804 =C2=B1 11%      +0.7%       4836 =C2=B1 10%      +5.5%       507=
0        softirqs.CPU82.SCHED
    160.50 =C2=B1 20%      +3.4%     166.00 =C2=B1 47%     -17.2%     132.8=
3 =C2=B1 35%  softirqs.CPU82.TIMER
     14499 =C2=B1  3%      -5.6%      13687 =C2=B1  5%      -1.3%      1431=
0 =C2=B1  7%  softirqs.CPU83.RCU
      4776 =C2=B1 11%      +1.0%       4823 =C2=B1 10%      +5.1%       501=
7 =C2=B1  2%  softirqs.CPU83.SCHED
    125.17 =C2=B1 20%     +32.5%     165.83 =C2=B1 46%      +6.8%     133.6=
7 =C2=B1 22%  softirqs.CPU83.TIMER
     14776 =C2=B1  5%      -2.4%      14425 =C2=B1  4%      -3.7%      1423=
3 =C2=B1  8%  softirqs.CPU84.RCU
      4817 =C2=B1 11%      -0.0%       4817 =C2=B1 10%      +4.6%       503=
8        softirqs.CPU84.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU84.TASKLET
    213.33 =C2=B1 56%     -48.3%     110.33 =C2=B1 18%     -22.3%     165.8=
3 =C2=B1 37%  softirqs.CPU84.TIMER
     14559 =C2=B1  3%      -1.1%      14392 =C2=B1  3%      -1.9%      1428=
9 =C2=B1  7%  softirqs.CPU85.RCU
      4788 =C2=B1 11%      +5.6%       5055 =C2=B1 15%      +7.3%       513=
8 =C2=B1  6%  softirqs.CPU85.SCHED
    186.50 =C2=B1 58%    +191.2%     543.17 =C2=B1167%     +71.8%     320.3=
3 =C2=B1123%  softirqs.CPU85.TIMER
     14647 =C2=B1  3%      -2.1%      14336 =C2=B1  3%      -2.7%      1425=
9 =C2=B1  8%  softirqs.CPU86.RCU
      4832 =C2=B1 11%      -0.3%       4819 =C2=B1  9%      +3.5%       500=
1        softirqs.CPU86.SCHED
    145.50 =C2=B1 12%      +1.6%     147.83 =C2=B1  7%      +3.4%     150.5=
0 =C2=B1 36%  softirqs.CPU86.TIMER
     14539 =C2=B1  3%      -2.3%      14207 =C2=B1  4%      -3.3%      1406=
1 =C2=B1  8%  softirqs.CPU87.RCU
      4783 =C2=B1 11%      +0.8%       4820 =C2=B1 10%      +3.9%       497=
0 =C2=B1  2%  softirqs.CPU87.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU87.TASKLET
    152.67 =C2=B1 13%     -12.7%     133.33 =C2=B1 21%      +1.4%     154.8=
3 =C2=B1 17%  softirqs.CPU87.TIMER
     14615 =C2=B1  3%      -0.8%      14497 =C2=B1  6%      -2.7%      1422=
5 =C2=B1  9%  softirqs.CPU88.RCU
      4833 =C2=B1 10%      +0.1%       4837 =C2=B1  9%      +3.8%       501=
4        softirqs.CPU88.SCHED
    117.67 =C2=B1 14%     +46.3%     172.17 =C2=B1 12%     +12.0%     131.8=
3 =C2=B1 30%  softirqs.CPU88.TIMER
     14491 =C2=B1  4%      -2.2%      14177 =C2=B1  3%      -2.3%      1415=
3 =C2=B1  7%  softirqs.CPU89.RCU
      4843 =C2=B1 11%      +2.2%       4949 =C2=B1 11%      +5.0%       508=
3 =C2=B1  2%  softirqs.CPU89.SCHED
    131.50 =C2=B1 16%    +193.0%     385.33 =C2=B1134%     +18.1%     155.3=
3 =C2=B1 29%  softirqs.CPU89.TIMER
     29.00            +0.6%      29.17            +0.0%      29.00        s=
oftirqs.CPU9.NET_TX
     15724 =C2=B1  5%      -1.6%      15465 =C2=B1  4%      -3.5%      1516=
8 =C2=B1  9%  softirqs.CPU9.RCU
      4351 =C2=B1 17%     +13.9%       4954 =C2=B1 11%     +16.9%       508=
5        softirqs.CPU9.SCHED
      0.83 =C2=B1128%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU9.TASKLET
    274.67 =C2=B1 16%     +35.0%     370.83 =C2=B1 43%      -2.2%     268.6=
7 =C2=B1 17%  softirqs.CPU9.TIMER
     14478 =C2=B1  3%      -2.3%      14143 =C2=B1  3%      -2.4%      1412=
9 =C2=B1  7%  softirqs.CPU90.RCU
      4752 =C2=B1 10%      +1.5%       4822 =C2=B1 10%      +6.8%       507=
6        softirqs.CPU90.SCHED
    140.00 =C2=B1 21%      +5.8%     148.17 =C2=B1 25%     +34.9%     188.8=
3 =C2=B1 61%  softirqs.CPU90.TIMER
     14733 =C2=B1  3%      -2.2%      14405 =C2=B1  3%      -2.4%      1438=
2 =C2=B1  7%  softirqs.CPU91.RCU
      4817 =C2=B1 11%      +1.1%       4872 =C2=B1 10%      +6.0%       510=
4        softirqs.CPU91.SCHED
    196.17 =C2=B1 58%     -44.9%     108.00 =C2=B1 21%     -35.7%     126.1=
7 =C2=B1 60%  softirqs.CPU91.TIMER
     14404 =C2=B1  5%      -0.5%      14332 =C2=B1  3%      -1.7%      1416=
3 =C2=B1  8%  softirqs.CPU92.RCU
      4807 =C2=B1 11%      +0.5%       4832 =C2=B1 10%      +4.4%       502=
0        softirqs.CPU92.SCHED
    122.50 =C2=B1 18%      +9.5%     134.17 =C2=B1 37%      +5.6%     129.3=
3 =C2=B1 26%  softirqs.CPU92.TIMER
     14540 =C2=B1  5%      -0.5%      14470 =C2=B1  3%      -3.1%      1409=
3 =C2=B1  8%  softirqs.CPU93.RCU
      5032 =C2=B1 17%      -3.6%       4849 =C2=B1 11%      -0.9%       498=
5        softirqs.CPU93.SCHED
    574.33 =C2=B1168%     -78.4%     124.00 =C2=B1 49%     -75.2%     142.3=
3 =C2=B1 27%  softirqs.CPU93.TIMER
     14328 =C2=B1  5%      -1.9%      14061 =C2=B1  3%      -0.6%      1423=
8 =C2=B1  7%  softirqs.CPU94.RCU
      4497 =C2=B1 19%      +7.7%       4842 =C2=B1 11%     +11.3%       500=
5        softirqs.CPU94.SCHED
    140.17 =C2=B1 18%      -9.0%     127.50 =C2=B1 12%      -9.4%     127.0=
0 =C2=B1 36%  softirqs.CPU94.TIMER
     14595 =C2=B1  5%      -2.1%      14286 =C2=B1  3%      -2.5%      1423=
2 =C2=B1  8%  softirqs.CPU95.RCU
      4844 =C2=B1 11%      +0.9%       4886 =C2=B1 11%      +1.6%       492=
3 =C2=B1 12%  softirqs.CPU95.SCHED
    165.50 =C2=B1 43%      -4.7%     157.67 =C2=B1 25%    +129.2%     379.3=
3 =C2=B1128%  softirqs.CPU95.TIMER
    130.50 =C2=B1100%     +33.3%     174.00 =C2=B1 70%      +0.0%     130.5=
0 =C2=B1100%  softirqs.CPU96.BLOCK
     21664 =C2=B1  4%      -1.1%      21422 =C2=B1  3%      -3.6%      2089=
1 =C2=B1  7%  softirqs.CPU96.RCU
      4429 =C2=B1 16%     +14.7%       5080 =C2=B1  6%     +16.3%       514=
9 =C2=B1  5%  softirqs.CPU96.SCHED
      0.33 =C2=B1223%      +0.0%       0.33 =C2=B1223%      +0.0%       0.3=
3 =C2=B1223%  softirqs.CPU96.TASKLET
    645.83 =C2=B1 13%     +52.4%     984.50 =C2=B1 57%     +30.2%     841.0=
0 =C2=B1 24%  softirqs.CPU96.TIMER
     43.50 =C2=B1223%    -100.0%       0.00            +0.0%      43.50 =C2=
=B1223%  softirqs.CPU97.BLOCK
     17906 =C2=B1 11%      +3.3%      18505 =C2=B1  3%      -2.1%      1753=
8 =C2=B1 15%  softirqs.CPU97.RCU
      4735 =C2=B1 11%      +3.4%       4898 =C2=B1  9%      +8.7%       514=
6 =C2=B1  4%  softirqs.CPU97.SCHED
      0.50 =C2=B1152%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU97.TASKLET
    482.83 =C2=B1  8%      +3.4%     499.33 =C2=B1 24%     +41.6%     683.8=
3 =C2=B1 59%  softirqs.CPU97.TIMER
     15934 =C2=B1  3%      -1.5%      15699 =C2=B1  2%      -0.7%      1582=
5 =C2=B1  6%  softirqs.CPU98.RCU
      4816 =C2=B1 12%      -1.2%       4756 =C2=B1 10%      +5.9%       510=
1        softirqs.CPU98.SCHED
    264.50 =C2=B1  9%      -3.7%     254.83 =C2=B1 31%      -7.2%     245.5=
0 =C2=B1  9%  softirqs.CPU98.TIMER
     15937 =C2=B1  6%      -4.9%      15153 =C2=B1  2%      -6.0%      1497=
6 =C2=B1  8%  softirqs.CPU99.RCU
      4869 =C2=B1 10%      +0.1%       4871 =C2=B1 10%      +6.5%       518=
6 =C2=B1  4%  softirqs.CPU99.SCHED
      0.00       +2.7e+102%       2.67 =C2=B1223% +1.7e+101%       0.17 =C2=
=B1223%  softirqs.CPU99.TASKLET
    163.50 =C2=B1 16%     +21.7%     199.00 =C2=B1 18%     +70.8%     279.3=
3 =C2=B1 77%  softirqs.CPU99.TIMER
      2.00            +0.0%       2.00            +8.3%       2.17 =C2=B1 1=
7%  softirqs.HI
     10086 =C2=B1 34%     +54.3%      15568 =C2=B1108%     -44.3%       562=
1 =C2=B1132%  softirqs.NET_RX
     37.50 =C2=B1  4%      +0.0%      37.50 =C2=B1  4%      -0.9%      37.1=
7 =C2=B1  2%  softirqs.NET_TX
   2951776 =C2=B1  4%      -2.1%    2890116 =C2=B1  3%      -2.5%    287733=
0 =C2=B1  7%  softirqs.RCU
    935383 =C2=B1 10%      +0.4%     939555 =C2=B1 10%      +4.1%     97371=
2        softirqs.SCHED
    226.67            +0.1%     226.83            +0.2%     227.17        s=
oftirqs.TASKLET
     45262            -0.9%      44858 =C2=B1  3%      -1.2%      44727 =C2=
=B1  7%  softirqs.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.0:IO-APIC.2-edge.timer
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.100:PCI-MSI.23592996-edge.nvme0q36
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.101:PCI-MSI.23592997-edge.nvme0q37
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.101:PCI-MSI.23593004-edge.nvme0q44
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.102:PCI-MSI.23592989-edge.nvme0q29
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.102:PCI-MSI.23592999-edge.nvme0q39
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.102:PCI-MSI.23593017-edge.nvme0q57
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.103:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.103:PCI-MSI.23593018-edge.nvme0q58
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.104:PCI-MSI.23592997-edge.nvme0q37
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.104:PCI-MSI.23593000-edge.nvme0q40
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.107:PCI-MSI.23593017-edge.nvme0q57
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.107:PCI-MSI.23593019-edge.nvme0q59
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.108:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.111:PCI-MSI.23592998-edge.nvme0q38
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.112:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.112:PCI-MSI.23593022-edge.nvme0q62
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.113:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.114:PCI-MSI.23593026-edge.nvme0q66
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.114:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.114:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.115:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.118:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.118:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.120:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.121:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.121:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.121:PCI-MSI.23593037-edge.nvme0q77
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.122:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.122:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.123:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.124:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.124:PCI-MSI.23593035-edge.nvme0q75
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.125:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.125:PCI-MSI.23593033-edge.nvme0q73
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.125:PCI-MSI.23593035-edge.nvme0q75
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.126:PCI-MSI.23593032-edge.nvme0q72
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.126:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.127:PCI-MSI.23593024-edge.nvme0q64
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.127:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.127:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.128:PCI-MSI.23593026-edge.nvme0q66
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.128:PCI-MSI.23593034-edge.nvme0q74
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.128:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.129:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.129:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.131:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.132:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.133:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.133:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.134:PCI-MSI.23593042-edge.nvme0q82
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.134:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.135:PCI-MSI.23593043-edge.nvme0q83
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.136:PCI-MSI.23593042-edge.nvme0q82
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.136:PCI-MSI.23593044-edge.nvme0q84
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.137:PCI-MSI.23593035-edge.nvme0q75
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.137:PCI-MSI.23593047-edge.nvme0q87
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.138:PCI-MSI.23593036-edge.nvme0q76
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.139:PCI-MSI.23593037-edge.nvme0q77
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.139:PCI-MSI.23593047-edge.nvme0q87
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.139:PCI-MSI.23593055-edge.nvme0q95
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.140:PCI-MSI.23593036-edge.nvme0q76
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.141:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.141:PCI-MSI.23593051-edge.nvme0q91
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.142:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.142:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.143:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.143:PCI-MSI.23593049-edge.nvme0q89
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.144:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.144:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.144:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.145:PCI-MSI.23593051-edge.nvme0q91
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.145:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.145:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.146:PCI-MSI.23593044-edge.nvme0q84
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.146:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.147:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.147:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.147:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.147:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.148:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.149:PCI-MSI.23593046-edge.nvme0q86
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.149:PCI-MSI.23593065-edge.nvme0q105
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.150:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.151:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.151:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.152:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.154:PCI-MSI.23593067-edge.nvme0q107
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.155:PCI-MSI.23593071-edge.nvme0q111
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.156:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.156:PCI-MSI.23593071-edge.nvme0q111
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.156:PCI-MSI.23593072-edge.nvme0q112
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.157:PCI-MSI.23593054-edge.nvme0q94
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.157:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.157:PCI-MSI.23593072-edge.nvme0q112
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.158:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.158:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.159:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.159:PCI-MSI.23593067-edge.nvme0q107
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.160:PCI-MSI.23593076-edge.nvme0q116
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.161:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.161:PCI-MSI.23593072-edge.nvme0q112
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.161:PCI-MSI.23593073-edge.nvme0q113
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.163:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.165:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.165:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.165:PCI-MSI.23593075-edge.nvme0q115
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.166:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.166:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.167:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.167:PCI-MSI.23593067-edge.nvme0q107
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.167:PCI-MSI.23593077-edge.nvme0q117
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.168:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.168:PCI-MSI.23593079-edge.nvme0q119
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.169:PCI-MSI.23593065-edge.nvme0q105
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.169:PCI-MSI.23593079-edge.nvme0q119
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.170:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.170:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.170:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.170:PCI-MSI.23593078-edge.nvme0q118
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.171:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.171:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.172:PCI-MSI.23593069-edge.nvme0q109
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.173:PCI-MSI.23593088-edge.nvme0q128
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.173:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.174:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.174:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.174:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.175:PCI-MSI.23593075-edge.nvme0q115
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.175:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.176:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.176:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.177:PCI-MSI.23593070-edge.nvme0q110
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.177:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.178:PCI-MSI.23593065-edge.nvme0q105
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.178:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.179:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.179:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.180:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.180:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.181:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.181:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.181:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.181:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.182:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.182:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.182:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.183:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.183:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.183:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.184:PCI-MSI.23593082-edge.nvme0q122
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.184:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.184:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.185:PCI-MSI.23593082-edge.nvme0q122
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.185:PCI-MSI.23593088-edge.nvme0q128
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.185:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.185:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.186:PCI-MSI.23593084-edge.nvme0q124
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.186:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.186:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.187:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.188:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.189:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.190:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.191:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.191:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.192:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.192:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.193:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.193:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.194:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.194:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.195:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.195:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.196:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.196:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.197:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.198:PCI-MSI.100728832-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.199:PCI-MSI.100728832-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.200:PCI-MSI.100730880-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.201:PCI-MSI.100730880-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.201:PCI-MSI.100732928-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.202:PCI-MSI.100732928-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.202:PCI-MSI.100734976-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.203:PCI-MSI.100734976-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.203:PCI-MSI.100737024-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.204:PCI-MSI.100737024-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.204:PCI-MSI.100739072-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.205:PCI-MSI.100739072-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.205:PCI-MSI.100741120-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.206:PCI-MSI.100741120-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.207:PCI-MSI.100743168-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.27:PCI-MSI.17825792-edge.PCIe.PME,pciehp
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.29:PCI-MSI.23068672-edge.PCIe.PME,pciehp
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.30:PCI-MSI.524288-edge.eth0
      9875 =C2=B1 84%     -64.2%       3532 =C2=B1144%     -88.5%       113=
2 =C2=B1 26%  interrupts.31:PCI-MSI.524289-edge.eth0-TxRx-0
      4028 =C2=B1122%     +82.8%       7365 =C2=B1 97%     -76.7%     938.1=
7 =C2=B1 84%  interrupts.32:PCI-MSI.524290-edge.eth0-TxRx-1
      3204 =C2=B1120%    +267.6%      11781 =C2=B1189%     -75.2%     794.6=
7 =C2=B1 53%  interrupts.33:PCI-MSI.524291-edge.eth0-TxRx-2
      1467 =C2=B1 96%    +374.0%       6955 =C2=B1131%    +406.2%       742=
6 =C2=B1187%  interrupts.34:PCI-MSI.524292-edge.eth0-TxRx-3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.35:PCI-MSI.327680-edge.xhci_hcd
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.37:PCI-MSI.65536-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.39:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.40:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.40:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.41:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.41:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.41:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.42:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.42:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.42:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.43:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.43:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.43:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.43:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.44:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.44:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.44:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.45:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.45:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.45:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.45:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.45:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.46:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.46:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.46:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.46:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.46:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.48:PCI-MSI.23592961-edge.nvme0q1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.48:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.48:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.49:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.49:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.49:PCI-MSI.33622016-edge.ioat-msix
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    interrupts.4:IO-APIC.4-edge.ttyS0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.50:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.50:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.50:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.50:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.51:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.51:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.51:PCI-MSI.23592967-edge.nvme0q7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.51:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.51:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.52:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.52:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.52:PCI-MSI.23592968-edge.nvme0q8
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.52:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.52:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.52:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.23592964-edge.nvme0q4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.23592969-edge.nvme0q9
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.23592965-edge.nvme0q5
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.23592967-edge.nvme0q7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.23592970-edge.nvme0q10
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.55:PCI-MSI.23592968-edge.nvme0q8
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.55:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.57:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.57:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.57:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.58:PCI-MSI.23592961-edge.nvme0q1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.58:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.58:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.59:PCI-MSI.23592972-edge.nvme0q12
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.59:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.61:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.61:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.61:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.63:PCI-MSI.23592963-edge.nvme0q3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.63:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.63:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.64:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.64:PCI-MSI.23592972-edge.nvme0q12
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.64:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.23592961-edge.nvme0q1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.23592965-edge.nvme0q5
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.23592972-edge.nvme0q12
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.23592964-edge.nvme0q4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.23592976-edge.nvme0q16
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.23592967-edge.nvme0q7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.23592977-edge.nvme0q17
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.23592980-edge.nvme0q20
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.68:PCI-MSI.23592984-edge.nvme0q24
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.69:PCI-MSI.100728832-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.69:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.23592963-edge.nvme0q3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.23592968-edge.nvme0q8
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.23592970-edge.nvme0q10
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.23592983-edge.nvme0q23
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.71:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.71:PCI-MSI.23592964-edge.nvme0q4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.73:PCI-MSI.100730880-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.73:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.73:PCI-MSI.23592971-edge.nvme0q11
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.75:PCI-MSI.23592975-edge.nvme0q15
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.75:PCI-MSI.23592985-edge.nvme0q25
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.76:PCI-MSI.23592972-edge.nvme0q12
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.76:PCI-MSI.23592976-edge.nvme0q16
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.76:PCI-MSI.23592986-edge.nvme0q26
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.76:PCI-MSI.23592989-edge.nvme0q29
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.77:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.78:PCI-MSI.23592971-edge.nvme0q11
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.78:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.78:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.78:PCI-MSI.23592991-edge.nvme0q31
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.79:PCI-MSI.23592975-edge.nvme0q15
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.79:PCI-MSI.23592982-edge.nvme0q22
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.80:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.80:PCI-MSI.23592980-edge.nvme0q20
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.80:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.84:PCI-MSI.23592992-edge.nvme0q32
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.85:PCI-MSI.23592985-edge.nvme0q25
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.85:PCI-MSI.23592992-edge.nvme0q32
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.85:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.87:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.87:PCI-MSI.23593002-edge.nvme0q42
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.88:PCI-MSI.23592991-edge.nvme0q31
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.88:PCI-MSI.23592998-edge.nvme0q38
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.88:PCI-MSI.23593003-edge.nvme0q43
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.89:PCI-MSI.23592989-edge.nvme0q29
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.89:PCI-MSI.23593001-edge.nvme0q41
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.8:IO-APIC.8-edge.rtc0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.90:PCI-MSI.23592988-edge.nvme0q28
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.91:PCI-MSI.23593001-edge.nvme0q41
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.92:PCI-MSI.23592979-edge.nvme0q19
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.93:PCI-MSI.23593003-edge.nvme0q43
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.93:PCI-MSI.23593005-edge.nvme0q45
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.93:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.94:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.94:PCI-MSI.23592994-edge.nvme0q34
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.94:PCI-MSI.23593006-edge.nvme0q46
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.95:PCI-MSI.23592991-edge.nvme0q31
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.95:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.95:PCI-MSI.23593005-edge.nvme0q45
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.95:PCI-MSI.23593010-edge.nvme0q50
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.96:PCI-MSI.23592996-edge.nvme0q36
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.98:PCI-MSI.23592985-edge.nvme0q25
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.98:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.98:PCI-MSI.23592998-edge.nvme0q38
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.99:PCI-MSI.23593002-edge.nvme0q42
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.99:PCI-MSI.23593009-edge.nvme0q49
    606.00            -0.1%     605.67            +0.1%     606.33        i=
nterrupts.9:IO-APIC.9-fasteoi.acpi
    802828            -0.0%     802532            +0.0%     802921        i=
nterrupts.CAL:Function_call_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.0:IO-APIC.2-edge.timer
      3936 =C2=B1  9%      -6.0%       3698 =C2=B1 12%      +2.3%       402=
5 =C2=B1  8%  interrupts.CPU0.CAL:Function_call_interrupts
      2.33 =C2=B1 31%     -21.4%       1.83 =C2=B1 20%     -14.3%       2.0=
0        interrupts.CPU0.IWI:IRQ_work_interrupts
    555796 =C2=B1 20%      +9.0%     605593            +8.7%     603929    =
    interrupts.CPU0.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU0.MCP:Machine_check_polls
      8195            -8.4%       7504 =C2=B1 20%      -0.0%       8195    =
    interrupts.CPU0.NMI:Non-maskable_interrupts
      8195            -8.4%       7504 =C2=B1 20%      -0.0%       8195    =
    interrupts.CPU0.PMI:Performance_monitoring_interrupts
    916.50            +0.3%     919.33            +0.8%     924.00        i=
nterrupts.CPU0.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.RTR:APIC_ICR_read_retries
      2833 =C2=B1  5%      -1.1%       2803 =C2=B1  3%      -1.0%       280=
5 =C2=B1  3%  interrupts.CPU0.TLB:TLB_shootdowns
    606.00            -0.1%     605.67            +0.1%     606.33        i=
nterrupts.CPU1.9:IO-APIC.9-fasteoi.acpi
      5825 =C2=B1 27%      -4.7%       5551 =C2=B1 31%     -11.2%       517=
2 =C2=B1 16%  interrupts.CPU1.CAL:Function_call_interrupts
      2.00           +25.0%       2.50 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU1.IWI:IRQ_work_interrupts
    563605 =C2=B1 16%      +7.5%     605663            +7.2%     603929    =
    interrupts.CPU1.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU1.MCP:Machine_check_polls
      8193            -8.4%       7504 =C2=B1 20%      +0.0%       8195    =
    interrupts.CPU1.NMI:Non-maskable_interrupts
      8193            -8.4%       7504 =C2=B1 20%      +0.0%       8195    =
    interrupts.CPU1.PMI:Performance_monitoring_interrupts
    401.67 =C2=B1 13%      -3.2%     389.00 =C2=B1  9%      -1.0%     397.5=
0 =C2=B1 12%  interrupts.CPU1.RES:Rescheduling_interrupts
      2968 =C2=B1  3%      +1.4%       3010            +0.7%       2990 =C2=
=B1  2%  interrupts.CPU1.TLB:TLB_shootdowns
      9875 =C2=B1 84%     -64.2%       3532 =C2=B1144%     -88.5%       113=
2 =C2=B1 26%  interrupts.CPU10.31:PCI-MSI.524289-edge.eth0-TxRx-0
      3683            +0.0%       3684            -0.9%       3650 =C2=B1  =
3%  interrupts.CPU10.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU10.IWI:IRQ_work_interrupts
    564064 =C2=B1 16%      +7.4%     605585            +7.1%     603907    =
    interrupts.CPU10.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU10.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.1%       819=
4        interrupts.CPU10.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.1%       819=
4        interrupts.CPU10.PMI:Performance_monitoring_interrupts
    322.00 =C2=B1  5%      +5.0%     338.17 =C2=B1  7%      +3.2%     332.3=
3 =C2=B1  6%  interrupts.CPU10.RES:Rescheduling_interrupts
      2812 =C2=B1  4%      +0.2%       2819 =C2=B1  3%      +3.1%       290=
0 =C2=B1  3%  interrupts.CPU10.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU100.145:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU100.158:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU100.174:PCI-MSI.23593061-edge.nvme0q101
      3681 =C2=B1  5%      +2.0%       3756            +4.5%       3847 =C2=
=B1  9%  interrupts.CPU100.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     -10.0%       1.50 =C2=B1 33%      +0.0%       1.6=
7 =C2=B1 28%  interrupts.CPU100.IWI:IRQ_work_interrupts
    564084 =C2=B1 16%      +7.3%     605484            +7.1%     603864    =
    interrupts.CPU100.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU100.MCP:Machine_check_polls
      6827 =C2=B1 28%     -10.1%       6138 =C2=B1 33%      +0.0%       682=
8 =C2=B1 28%  interrupts.CPU100.NMI:Non-maskable_interrupts
      6827 =C2=B1 28%     -10.1%       6138 =C2=B1 33%      +0.0%       682=
8 =C2=B1 28%  interrupts.CPU100.PMI:Performance_monitoring_interrupts
    312.67            +2.2%     319.67 =C2=B1  4%     +49.3%     466.67 =C2=
=B1 49%  interrupts.CPU100.RES:Rescheduling_interrupts
      2890 =C2=B1  6%      +2.9%       2975 =C2=B1  3%      +1.0%       292=
0 =C2=B1  4%  interrupts.CPU100.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU101.147:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU101.165:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU101.166:PCI-MSI.23593062-edge.nvme0q102
      3744 =C2=B1  5%      -0.8%       3713            -1.3%       3696    =
    interrupts.CPU101.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +25.0%       1.67 =C2=B1 28%     +25.0%       1.6=
7 =C2=B1 28%  interrupts.CPU101.IWI:IRQ_work_interrupts
    563919 =C2=B1 16%      +7.4%     605470            +7.1%     603864    =
    interrupts.CPU101.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU101.MCP:Machine_check_polls
      5461 =C2=B1 35%     +24.9%       6821 =C2=B1 28%     +25.0%       682=
9 =C2=B1 28%  interrupts.CPU101.NMI:Non-maskable_interrupts
      5461 =C2=B1 35%     +24.9%       6821 =C2=B1 28%     +25.0%       682=
9 =C2=B1 28%  interrupts.CPU101.PMI:Performance_monitoring_interrupts
    342.67 =C2=B1 18%      -4.1%     328.67 =C2=B1  7%      -8.3%     314.1=
7 =C2=B1  2%  interrupts.CPU101.RES:Rescheduling_interrupts
      2798 =C2=B1  3%      +1.5%       2840 =C2=B1  4%      +1.6%       284=
2 =C2=B1  3%  interrupts.CPU101.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.147:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.165:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.167:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.170:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.176:PCI-MSI.23593063-edge.nvme0q103
      3736            -0.3%       3725            -1.6%       3676 =C2=B1  =
3%  interrupts.CPU102.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +37.5%       1.83 =C2=B1 20%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU102.IWI:IRQ_work_interrupts
    563025 =C2=B1 16%      +7.6%     605584            +7.2%     603763    =
    interrupts.CPU102.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU102.MCP:Machine_check_polls
      5461 =C2=B1 35%     +37.4%       7505 =C2=B1 20%     +37.5%       751=
1 =C2=B1 20%  interrupts.CPU102.NMI:Non-maskable_interrupts
      5461 =C2=B1 35%     +37.4%       7505 =C2=B1 20%     +37.5%       751=
1 =C2=B1 20%  interrupts.CPU102.PMI:Performance_monitoring_interrupts
    311.83            -0.4%     310.67            +2.2%     318.67 =C2=B1  =
3%  interrupts.CPU102.RES:Rescheduling_interrupts
      2981 =C2=B1  3%      +0.0%       2982 =C2=B1  3%      -4.3%       285=
2 =C2=B1  6%  interrupts.CPU102.TLB:TLB_shootdowns
      3670            -0.7%       3644            +0.5%       3689        i=
nterrupts.CPU103.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +37.5%       1.83 =C2=B1 20%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU103.IWI:IRQ_work_interrupts
    564309 =C2=B1 16%      +7.3%     605464            +7.0%     603818    =
    interrupts.CPU103.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU103.MCP:Machine_check_polls
      5462 =C2=B1 35%     +37.4%       7506 =C2=B1 20%     +37.5%       751=
1 =C2=B1 20%  interrupts.CPU103.NMI:Non-maskable_interrupts
      5462 =C2=B1 35%     +37.4%       7506 =C2=B1 20%     +37.5%       751=
1 =C2=B1 20%  interrupts.CPU103.PMI:Performance_monitoring_interrupts
    308.17            +0.5%     309.67            +4.1%     320.83 =C2=B1  =
6%  interrupts.CPU103.RES:Rescheduling_interrupts
      2813 =C2=B1  3%      -1.5%       2771            +0.7%       2834 =C2=
=B1  3%  interrupts.CPU103.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU104.149:PCI-MSI.23593065-edge.nvme0q105
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU104.169:PCI-MSI.23593065-edge.nvme0q105
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU104.178:PCI-MSI.23593065-edge.nvme0q105
      3779 =C2=B1  2%      -1.3%       3731            -1.2%       3735 =C2=
=B1  2%  interrupts.CPU104.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +37.5%       1.83 =C2=B1 20%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU104.IWI:IRQ_work_interrupts
    564217 =C2=B1 16%      +7.3%     605472            +7.0%     603840    =
    interrupts.CPU104.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU104.MCP:Machine_check_polls
      5462 =C2=B1 35%     +37.4%       7505 =C2=B1 20%     +37.6%       751=
3 =C2=B1 20%  interrupts.CPU104.NMI:Non-maskable_interrupts
      5462 =C2=B1 35%     +37.4%       7505 =C2=B1 20%     +37.6%       751=
3 =C2=B1 20%  interrupts.CPU104.PMI:Performance_monitoring_interrupts
    318.17 =C2=B1  5%      -2.7%     309.50            -1.9%     312.17    =
    interrupts.CPU104.RES:Rescheduling_interrupts
      2985 =C2=B1  3%      +0.1%       2987 =C2=B1  3%      -1.6%       293=
7 =C2=B1  5%  interrupts.CPU104.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU105.151:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU105.166:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU105.170:PCI-MSI.23593066-edge.nvme0q106
      3671            +0.0%       3673            +0.3%       3682        i=
nterrupts.CPU105.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +37.5%       1.83 =C2=B1 20%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU105.IWI:IRQ_work_interrupts
    564285 =C2=B1 16%      +7.3%     605469            +7.0%     603855    =
    interrupts.CPU105.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU105.MCP:Machine_check_polls
      5461 =C2=B1 35%     +37.4%       7504 =C2=B1 20%     +37.6%       751=
3 =C2=B1 20%  interrupts.CPU105.NMI:Non-maskable_interrupts
      5461 =C2=B1 35%     +37.4%       7504 =C2=B1 20%     +37.6%       751=
3 =C2=B1 20%  interrupts.CPU105.PMI:Performance_monitoring_interrupts
    313.33 =C2=B1  2%      -1.1%     310.00            -0.5%     311.83    =
    interrupts.CPU105.RES:Rescheduling_interrupts
      2817 =C2=B1  3%      -0.0%       2816 =C2=B1  3%      +1.0%       284=
5 =C2=B1  3%  interrupts.CPU105.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU106.154:PCI-MSI.23593067-edge.nvme0q107
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU106.159:PCI-MSI.23593067-edge.nvme0q107
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU106.167:PCI-MSI.23593067-edge.nvme0q107
      3743            -0.5%       3724            -0.9%       3708 =C2=B1  =
2%  interrupts.CPU106.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU106.IWI:IRQ_work_interrupts
    564141 =C2=B1 16%      +7.3%     605580            +7.0%     603825    =
    interrupts.CPU106.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU106.MCP:Machine_check_polls
      6146 =C2=B1 33%     +22.1%       7504 =C2=B1 20%     +22.2%       751=
3 =C2=B1 20%  interrupts.CPU106.NMI:Non-maskable_interrupts
      6146 =C2=B1 33%     +22.1%       7504 =C2=B1 20%     +22.2%       751=
3 =C2=B1 20%  interrupts.CPU106.PMI:Performance_monitoring_interrupts
    310.33            -0.3%     309.33            +0.5%     312.00        i=
nterrupts.CPU106.RES:Rescheduling_interrupts
      2985 =C2=B1  3%      +0.3%       2993 =C2=B1  3%      -3.1%       289=
2 =C2=B1  5%  interrupts.CPU106.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.152:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.168:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.171:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.181:PCI-MSI.23593068-edge.nvme0q108
      3692            -0.4%       3676            +0.1%       3695        i=
nterrupts.CPU107.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +11.1%       1.6=
7 =C2=B1 28%  interrupts.CPU107.IWI:IRQ_work_interrupts
    563857 =C2=B1 16%      +7.4%     605485            +7.1%     603812    =
    interrupts.CPU107.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU107.MCP:Machine_check_polls
      6146 =C2=B1 33%     +22.1%       7505 =C2=B1 20%     +11.1%       683=
0 =C2=B1 28%  interrupts.CPU107.NMI:Non-maskable_interrupts
      6146 =C2=B1 33%     +22.1%       7505 =C2=B1 20%     +11.1%       683=
0 =C2=B1 28%  interrupts.CPU107.PMI:Performance_monitoring_interrupts
    313.33            -1.2%     309.67            +0.2%     314.00        i=
nterrupts.CPU107.RES:Rescheduling_interrupts
      2823 =C2=B1  3%      -0.0%       2822 =C2=B1  3%      +1.1%       285=
4 =C2=B1  3%  interrupts.CPU107.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU108.172:PCI-MSI.23593069-edge.nvme0q109
      3807 =C2=B1  4%      -2.0%       3730            -2.2%       3723    =
    interrupts.CPU108.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%      +0.0%       1.6=
7 =C2=B1 28%  interrupts.CPU108.IWI:IRQ_work_interrupts
    563831 =C2=B1 16%      +7.4%     605497            +7.1%     603824    =
    interrupts.CPU108.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU108.MCP:Machine_check_polls
      6828 =C2=B1 28%      +9.9%       7505 =C2=B1 20%      +0.0%       682=
9 =C2=B1 28%  interrupts.CPU108.NMI:Non-maskable_interrupts
      6828 =C2=B1 28%      +9.9%       7505 =C2=B1 20%      +0.0%       682=
9 =C2=B1 28%  interrupts.CPU108.PMI:Performance_monitoring_interrupts
    343.17 =C2=B1 18%      -9.5%     310.50            -8.9%     312.50    =
    interrupts.CPU108.RES:Rescheduling_interrupts
      2957 =C2=B1  3%      +1.4%       2999 =C2=B1  3%      -1.6%       290=
8 =C2=B1  4%  interrupts.CPU108.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU109.177:PCI-MSI.23593070-edge.nvme0q110
      3698            -0.5%       3679            +0.0%       3699        i=
nterrupts.CPU109.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%      +0.0%       1.6=
7 =C2=B1 28%  interrupts.CPU109.IWI:IRQ_work_interrupts
    564314 =C2=B1 16%      +7.3%     605484            +7.0%     603849    =
    interrupts.CPU109.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU109.MCP:Machine_check_polls
      6828 =C2=B1 28%      +9.9%       7504 =C2=B1 20%      +0.0%       682=
9 =C2=B1 28%  interrupts.CPU109.NMI:Non-maskable_interrupts
      6828 =C2=B1 28%      +9.9%       7504 =C2=B1 20%      +0.0%       682=
9 =C2=B1 28%  interrupts.CPU109.PMI:Performance_monitoring_interrupts
    309.17            -0.2%     308.67            +0.5%     310.83        i=
nterrupts.CPU109.RES:Rescheduling_interrupts
      2831 =C2=B1  3%      -0.1%       2828 =C2=B1  3%      +1.0%       285=
9 =C2=B1  3%  interrupts.CPU109.TLB:TLB_shootdowns
      4028 =C2=B1122%     +82.8%       7365 =C2=B1 97%     -76.7%     938.1=
7 =C2=B1 84%  interrupts.CPU11.32:PCI-MSI.524290-edge.eth0-TxRx-1
      3757            -0.3%       3746            -0.7%       3730        i=
nterrupts.CPU11.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU11.IWI:IRQ_work_interrupts
    563990 =C2=B1 16%      +7.4%     605553            +7.1%     603870    =
    interrupts.CPU11.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU11.MCP:Machine_check_polls
      8191            -8.4%       7505 =C2=B1 20%      +0.0%       8195    =
    interrupts.CPU11.NMI:Non-maskable_interrupts
      8191            -8.4%       7505 =C2=B1 20%      +0.0%       8195    =
    interrupts.CPU11.PMI:Performance_monitoring_interrupts
    321.50 =C2=B1  4%      -2.0%     315.17 =C2=B1  2%      -2.3%     314.0=
0        interrupts.CPU11.RES:Rescheduling_interrupts
      2995 =C2=B1  3%      +0.1%       2997 =C2=B1  3%      -1.6%       294=
6 =C2=B1  5%  interrupts.CPU11.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU110.155:PCI-MSI.23593071-edge.nvme0q111
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU110.156:PCI-MSI.23593071-edge.nvme0q111
      3751            -0.0%       3751            -1.2%       3705 =C2=B1  =
2%  interrupts.CPU110.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU110.IWI:IRQ_work_interrupts
    563338 =C2=B1 16%      +7.5%     605500            +7.2%     603736    =
    interrupts.CPU110.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU110.MCP:Machine_check_polls
      6829 =C2=B1 28%      +9.9%       7505 =C2=B1 20%     +10.0%       751=
0 =C2=B1 20%  interrupts.CPU110.NMI:Non-maskable_interrupts
      6829 =C2=B1 28%      +9.9%       7505 =C2=B1 20%     +10.0%       751=
0 =C2=B1 20%  interrupts.CPU110.PMI:Performance_monitoring_interrupts
    310.83            -0.9%     308.00            +1.0%     314.00 =C2=B1  =
2%  interrupts.CPU110.RES:Rescheduling_interrupts
      3003 =C2=B1  3%      -0.0%       3003 =C2=B1  3%      -3.6%       289=
6 =C2=B1  5%  interrupts.CPU110.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU111.156:PCI-MSI.23593072-edge.nvme0q112
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU111.157:PCI-MSI.23593072-edge.nvme0q112
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU111.161:PCI-MSI.23593072-edge.nvme0q112
      3677            -0.4%       3663            +1.0%       3713        i=
nterrupts.CPU111.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU111.IWI:IRQ_work_interrupts
    564153 =C2=B1 16%      +7.3%     605515            +7.0%     603839    =
    interrupts.CPU111.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU111.MCP:Machine_check_polls
      6828 =C2=B1 28%      +9.9%       7504 =C2=B1 20%     +10.0%       751=
2 =C2=B1 20%  interrupts.CPU111.NMI:Non-maskable_interrupts
      6828 =C2=B1 28%      +9.9%       7504 =C2=B1 20%     +10.0%       751=
2 =C2=B1 20%  interrupts.CPU111.PMI:Performance_monitoring_interrupts
    309.17            +0.1%     309.33            +0.8%     311.50        i=
nterrupts.CPU111.RES:Rescheduling_interrupts
      2835 =C2=B1  3%      -0.4%       2825 =C2=B1  3%      +1.3%       287=
1 =C2=B1  3%  interrupts.CPU111.TLB:TLB_shootdowns
      3757            -1.3%       3709            -1.4%       3704 =C2=B1  =
2%  interrupts.CPU112.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +10.0%       1.83 =C2=
=B1 20%  interrupts.CPU112.IWI:IRQ_work_interrupts
    563930 =C2=B1 16%      +7.4%     605613            +7.1%     603811    =
    interrupts.CPU112.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU112.MCP:Machine_check_polls
      6829 =C2=B1 28%     +19.9%       8189           +10.0%       7514 =C2=
=B1 20%  interrupts.CPU112.NMI:Non-maskable_interrupts
      6829 =C2=B1 28%     +19.9%       8189           +10.0%       7514 =C2=
=B1 20%  interrupts.CPU112.PMI:Performance_monitoring_interrupts
    309.17            +0.1%     309.33            +0.7%     311.33        i=
nterrupts.CPU112.RES:Rescheduling_interrupts
      3006 =C2=B1  3%      -2.7%       2925 =C2=B1  3%      -3.1%       291=
3 =C2=B1  5%  interrupts.CPU112.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU113.184:PCI-MSI.23593082-edge.nvme0q122
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU113.185:PCI-MSI.23593082-edge.nvme0q122
      3690            -1.3%       3644 =C2=B1  2%      +0.5%       3710    =
    interrupts.CPU113.CAL:Function_call_interrupts
      1.83 =C2=B1 20%     +18.2%       2.17 =C2=B1 17%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU113.IWI:IRQ_work_interrupts
    563681 =C2=B1 16%      +7.4%     605417            +7.1%     603784    =
    interrupts.CPU113.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU113.MCP:Machine_check_polls
      7510 =C2=B1 20%      +9.0%       8187            +0.0%       7513 =C2=
=B1 20%  interrupts.CPU113.NMI:Non-maskable_interrupts
      7510 =C2=B1 20%      +9.0%       8187            +0.0%       7513 =C2=
=B1 20%  interrupts.CPU113.PMI:Performance_monitoring_interrupts
    309.67            +1.9%     315.50 =C2=B1  3%      +0.1%     310.00    =
    interrupts.CPU113.RES:Rescheduling_interrupts
      2841 =C2=B1  3%      -1.7%       2793 =C2=B1  4%      +2.6%       291=
4 =C2=B1  3%  interrupts.CPU113.TLB:TLB_shootdowns
      3762           +30.3%       4901 =C2=B1 51%      -0.3%       3751    =
    interrupts.CPU114.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU114.IWI:IRQ_work_interrupts
    563909 =C2=B1 16%      +7.4%     605481            +7.1%     603803    =
    interrupts.CPU114.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU114.MCP:Machine_check_polls
      7510 =C2=B1 20%      +9.1%       8190            +0.0%       7513 =C2=
=B1 20%  interrupts.CPU114.NMI:Non-maskable_interrupts
      7510 =C2=B1 20%      +9.1%       8190            +0.0%       7513 =C2=
=B1 20%  interrupts.CPU114.PMI:Performance_monitoring_interrupts
    310.33           +57.7%     489.50 =C2=B1 82%      +0.1%     310.67    =
    interrupts.CPU114.RES:Rescheduling_interrupts
      3013 =C2=B1  3%      -0.2%       3007 =C2=B1  3%      -0.4%       300=
3 =C2=B1  4%  interrupts.CPU114.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU115.186:PCI-MSI.23593084-edge.nvme0q124
      3702            +0.3%       3712            -0.0%       3702        i=
nterrupts.CPU115.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU115.IWI:IRQ_work_interrupts
    563982 =C2=B1 16%      +7.4%     605484            +7.1%     603818    =
    interrupts.CPU115.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU115.MCP:Machine_check_polls
      7510 =C2=B1 20%      +9.0%       8189            +0.0%       7513 =C2=
=B1 20%  interrupts.CPU115.NMI:Non-maskable_interrupts
      7510 =C2=B1 20%      +9.0%       8189            +0.0%       7513 =C2=
=B1 20%  interrupts.CPU115.PMI:Performance_monitoring_interrupts
    309.83            -0.2%     309.33            +0.3%     310.67        i=
nterrupts.CPU115.RES:Rescheduling_interrupts
      2846 =C2=B1  3%      +1.5%       2888 =C2=B1  4%      +1.0%       287=
4 =C2=B1  2%  interrupts.CPU115.TLB:TLB_shootdowns
      3754            +0.1%       3758            -1.0%       3716 =C2=B1  =
2%  interrupts.CPU116.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            -9.1%       1.67 =C2=
=B1 28%  interrupts.CPU116.IWI:IRQ_work_interrupts
    563938 =C2=B1 16%      +7.4%     605479            +7.1%     603810    =
    interrupts.CPU116.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU116.MCP:Machine_check_polls
      7509 =C2=B1 20%      +9.0%       8188            -9.1%       6828 =C2=
=B1 28%  interrupts.CPU116.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      +9.0%       8188            -9.1%       6828 =C2=
=B1 28%  interrupts.CPU116.PMI:Performance_monitoring_interrupts
    309.00            -0.1%     308.67            +0.3%     309.83        i=
nterrupts.CPU116.RES:Rescheduling_interrupts
      3018 =C2=B1  3%      -0.0%       3018 =C2=B1  3%      -0.4%       300=
7 =C2=B1  4%  interrupts.CPU116.TLB:TLB_shootdowns
      3711            -1.0%       3672            -0.6%       3688        i=
nterrupts.CPU117.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU117.IWI:IRQ_work_interrupts
    564015 =C2=B1 16%      +7.3%     605467            +7.1%     603789    =
    interrupts.CPU117.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU117.MCP:Machine_check_polls
      7510 =C2=B1 20%      +9.0%       8189            +0.0%       7513 =C2=
=B1 20%  interrupts.CPU117.NMI:Non-maskable_interrupts
      7510 =C2=B1 20%      +9.0%       8189            +0.0%       7513 =C2=
=B1 20%  interrupts.CPU117.PMI:Performance_monitoring_interrupts
    308.67            +0.0%     308.67            +0.9%     311.33        i=
nterrupts.CPU117.RES:Rescheduling_interrupts
      2848 =C2=B1  3%      -1.3%       2812            -0.1%       2845 =C2=
=B1  2%  interrupts.CPU117.TLB:TLB_shootdowns
      3769            -0.2%       3761            -0.0%       3767 =C2=B1  =
3%  interrupts.CPU118.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU118.IWI:IRQ_work_interrupts
    563925 =C2=B1 16%      +7.4%     605482            +7.1%     603818    =
    interrupts.CPU118.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU118.MCP:Machine_check_polls
      7509 =C2=B1 20%      +9.1%       8189            +0.1%       7513 =C2=
=B1 20%  interrupts.CPU118.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      +9.1%       8189            +0.1%       7513 =C2=
=B1 20%  interrupts.CPU118.PMI:Performance_monitoring_interrupts
    330.00 =C2=B1 13%      -6.5%     308.67            -3.6%     318.17 =C2=
=B1  6%  interrupts.CPU118.RES:Rescheduling_interrupts
      3024 =C2=B1  3%      -0.1%       3022 =C2=B1  3%      -1.9%       296=
7 =C2=B1  5%  interrupts.CPU118.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU119.173:PCI-MSI.23593088-edge.nvme0q128
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU119.185:PCI-MSI.23593088-edge.nvme0q128
      3721 =C2=B1  2%      -0.7%       3694            -0.3%       3709    =
    interrupts.CPU119.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +33.3%       2.00           +33.3%       2.00    =
    interrupts.CPU119.IWI:IRQ_work_interrupts
    563686 =C2=B1 16%      +7.4%     605467            +7.1%     603816    =
    interrupts.CPU119.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU119.MCP:Machine_check_polls
      6142 =C2=B1 33%     +33.3%       8189           +33.4%       8196    =
    interrupts.CPU119.NMI:Non-maskable_interrupts
      6142 =C2=B1 33%     +33.3%       8189           +33.4%       8196    =
    interrupts.CPU119.PMI:Performance_monitoring_interrupts
    309.83            -0.2%     309.17            -0.2%     309.33        i=
nterrupts.CPU119.RES:Rescheduling_interrupts
      2900 =C2=B1  4%      -1.7%       2850 =C2=B1  3%      -0.4%       288=
9 =C2=B1  3%  interrupts.CPU119.TLB:TLB_shootdowns
      3204 =C2=B1120%    +267.6%      11781 =C2=B1189%     -75.2%     794.6=
7 =C2=B1 53%  interrupts.CPU12.33:PCI-MSI.524291-edge.eth0-TxRx-2
      3711            -0.4%       3697            +0.2%       3717        i=
nterrupts.CPU12.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU12.IWI:IRQ_work_interrupts
    563815 =C2=B1 16%      +7.4%     605538            +7.1%     603869    =
    interrupts.CPU12.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU12.MCP:Machine_check_polls
      8191            -8.4%       7504 =C2=B1 20%      +0.0%       8194    =
    interrupts.CPU12.NMI:Non-maskable_interrupts
      8191            -8.4%       7504 =C2=B1 20%      +0.0%       8194    =
    interrupts.CPU12.PMI:Performance_monitoring_interrupts
    325.83 =C2=B1  5%      +3.6%     337.67 =C2=B1  9%      -0.2%     325.1=
7 =C2=B1  5%  interrupts.CPU12.RES:Rescheduling_interrupts
      2868 =C2=B1  4%      -1.7%       2818 =C2=B1  3%      +1.3%       290=
6 =C2=B1  4%  interrupts.CPU12.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU120.48:PCI-MSI.23592961-edge.nvme0q1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU120.58:PCI-MSI.23592961-edge.nvme0q1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU120.65:PCI-MSI.23592961-edge.nvme0q1
     16168 =C2=B1 17%     -26.0%      11962 =C2=B1 19%     -12.4%      1415=
5 =C2=B1 19%  interrupts.CPU120.CAL:Function_call_interrupts
      3.00 =C2=B1 27%      +0.0%       3.00           +11.1%       3.33 =C2=
=B1 14%  interrupts.CPU120.IWI:IRQ_work_interrupts
    565221 =C2=B1 16%      +7.2%     605705            +6.8%     603826    =
    interrupts.CPU120.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU120.MCP:Machine_check_polls
      6805 =C2=B1 28%     +20.0%       8169           +20.2%       8176    =
    interrupts.CPU120.NMI:Non-maskable_interrupts
      6805 =C2=B1 28%     +20.0%       8169           +20.2%       8176    =
    interrupts.CPU120.PMI:Performance_monitoring_interrupts
    353.50 =C2=B1  4%     +21.1%     428.17 =C2=B1 39%      -6.3%     331.1=
7 =C2=B1  2%  interrupts.CPU120.RES:Rescheduling_interrupts
      3054            -5.9%       2874 =C2=B1  3%      -4.2%       2925 =C2=
=B1  5%  interrupts.CPU120.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU121.49:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU121.51:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU121.52:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU121.69:PCI-MSI.23592962-edge.nvme0q2
      5515 =C2=B1 13%     +30.1%       7175 =C2=B1 28%      -2.0%       540=
4 =C2=B1 16%  interrupts.CPU121.CAL:Function_call_interrupts
      2.00           +25.0%       2.50 =C2=B1 20%     +25.0%       2.50 =C2=
=B1 20%  interrupts.CPU121.IWI:IRQ_work_interrupts
    565541 =C2=B1 15%      +7.1%     605605            +6.8%     603800    =
    interrupts.CPU121.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU121.MCP:Machine_check_polls
      6810 =C2=B1 28%     -10.1%       6123 =C2=B1 33%     +20.1%       817=
7        interrupts.CPU121.NMI:Non-maskable_interrupts
      6810 =C2=B1 28%     -10.1%       6123 =C2=B1 33%     +20.1%       817=
7        interrupts.CPU121.PMI:Performance_monitoring_interrupts
    432.33 =C2=B1  5%      -1.2%     427.17 =C2=B1 23%     -10.1%     388.5=
0 =C2=B1 12%  interrupts.CPU121.RES:Rescheduling_interrupts
      2893 =C2=B1  4%      -1.3%       2855 =C2=B1  3%      +1.4%       293=
2 =C2=B1  3%  interrupts.CPU121.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU122.63:PCI-MSI.23592963-edge.nvme0q3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU122.70:PCI-MSI.23592963-edge.nvme0q3
      5263 =C2=B1 17%     -23.2%       4043 =C2=B1  5%      -6.6%       491=
3 =C2=B1 22%  interrupts.CPU122.CAL:Function_call_interrupts
      1.67 =C2=B1 28%      +0.0%       1.67 =C2=B1 28%     +20.0%       2.0=
0        interrupts.CPU122.IWI:IRQ_work_interrupts
    565642 =C2=B1 15%      +7.0%     605516            +6.7%     603700    =
    interrupts.CPU122.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU122.MCP:Machine_check_polls
      6810 =C2=B1 28%      -0.1%       6806 =C2=B1 28%     +20.1%       817=
7        interrupts.CPU122.NMI:Non-maskable_interrupts
      6810 =C2=B1 28%      -0.1%       6806 =C2=B1 28%     +20.1%       817=
7        interrupts.CPU122.PMI:Performance_monitoring_interrupts
    461.50 =C2=B1 19%     -10.2%     414.33 =C2=B1 23%     +58.5%     731.5=
0 =C2=B1111%  interrupts.CPU122.RES:Rescheduling_interrupts
      2992 =C2=B1  3%      -0.4%       2980 =C2=B1  4%      -1.8%       293=
7 =C2=B1  5%  interrupts.CPU122.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU123.53:PCI-MSI.23592964-edge.nvme0q4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU123.66:PCI-MSI.23592964-edge.nvme0q4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU123.71:PCI-MSI.23592964-edge.nvme0q4
      3767 =C2=B1  2%      +5.2%       3962 =C2=B1 10%     +23.6%       465=
8 =C2=B1 28%  interrupts.CPU123.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU123.IWI:IRQ_work_interrupts
    565079 =C2=B1 16%      +7.1%     605413            +6.8%     603663    =
    interrupts.CPU123.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU123.MCP:Machine_check_polls
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.5%       817=
8        interrupts.CPU123.NMI:Non-maskable_interrupts
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.5%       817=
8        interrupts.CPU123.PMI:Performance_monitoring_interrupts
    321.33 =C2=B1  8%    +192.0%     938.17 =C2=B1140%     +39.2%     447.1=
7 =C2=B1 45%  interrupts.CPU123.RES:Rescheduling_interrupts
      2903 =C2=B1  4%      -0.5%       2888 =C2=B1  3%      +1.1%       293=
6 =C2=B1  3%  interrupts.CPU123.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU124.54:PCI-MSI.23592965-edge.nvme0q5
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU124.65:PCI-MSI.23592965-edge.nvme0q5
      3780            -0.3%       3769            +8.5%       4103 =C2=B1 1=
2%  interrupts.CPU124.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU124.IWI:IRQ_work_interrupts
    565392 =C2=B1 15%      +7.1%     605483            +6.8%     603673    =
    interrupts.CPU124.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU124.MCP:Machine_check_polls
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.5%       817=
8        interrupts.CPU124.NMI:Non-maskable_interrupts
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.5%       817=
8        interrupts.CPU124.PMI:Performance_monitoring_interrupts
    323.17 =C2=B1  9%      -4.8%     307.67           +41.7%     457.83 =C2=
=B1 47%  interrupts.CPU124.RES:Rescheduling_interrupts
      2994 =C2=B1  3%      +1.3%       3034 =C2=B1  3%      -1.7%       294=
3 =C2=B1  5%  interrupts.CPU124.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU125.66:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU125.70:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU125.73:PCI-MSI.23592966-edge.nvme0q6
      3739            -0.4%       3725            +0.5%       3758 =C2=B1  =
2%  interrupts.CPU125.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU125.IWI:IRQ_work_interrupts
    565599 =C2=B1 15%      +7.1%     605482            +6.7%     603664    =
    interrupts.CPU125.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU125.MCP:Machine_check_polls
      6127 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.4%       817=
7        interrupts.CPU125.NMI:Non-maskable_interrupts
      6127 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.4%       817=
7        interrupts.CPU125.PMI:Performance_monitoring_interrupts
    357.33 =C2=B1 31%     -13.0%     311.00 =C2=B1  3%     -13.4%     309.3=
3        interrupts.CPU125.RES:Rescheduling_interrupts
      2918 =C2=B1  4%      -0.4%       2907 =C2=B1  3%      +0.6%       293=
5 =C2=B1  4%  interrupts.CPU125.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU126.51:PCI-MSI.23592967-edge.nvme0q7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU126.54:PCI-MSI.23592967-edge.nvme0q7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU126.67:PCI-MSI.23592967-edge.nvme0q7
      3841 =C2=B1  4%      -1.7%       3776           +26.5%       4859 =C2=
=B1 51%  interrupts.CPU126.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU126.IWI:IRQ_work_interrupts
    565421 =C2=B1 15%      +7.1%     605482            +6.8%     603670    =
    interrupts.CPU126.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU126.MCP:Machine_check_polls
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.5%       817=
9        interrupts.CPU126.NMI:Non-maskable_interrupts
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.5%       817=
9        interrupts.CPU126.PMI:Performance_monitoring_interrupts
    334.00 =C2=B1 16%      -7.9%     307.67           +52.9%     510.67 =C2=
=B1 86%  interrupts.CPU126.RES:Rescheduling_interrupts
      2995 =C2=B1  3%      +1.7%       3044 =C2=B1  3%      -3.3%       289=
7 =C2=B1  4%  interrupts.CPU126.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU127.52:PCI-MSI.23592968-edge.nvme0q8
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU127.55:PCI-MSI.23592968-edge.nvme0q8
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU127.70:PCI-MSI.23592968-edge.nvme0q8
      3779            -2.5%       3684            -1.2%       3733        i=
nterrupts.CPU127.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU127.IWI:IRQ_work_interrupts
    565887 =C2=B1 15%      +7.0%     605443            +6.7%     603727    =
    interrupts.CPU127.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU127.MCP:Machine_check_polls
      6129 =C2=B1 33%     +22.2%       7488 =C2=B1 20%     +33.4%       817=
9        interrupts.CPU127.NMI:Non-maskable_interrupts
      6129 =C2=B1 33%     +22.2%       7488 =C2=B1 20%     +33.4%       817=
9        interrupts.CPU127.PMI:Performance_monitoring_interrupts
    328.17 =C2=B1 10%      -6.3%     307.50            -6.2%     307.67    =
    interrupts.CPU127.RES:Rescheduling_interrupts
      2923 =C2=B1  4%      -2.1%       2861 =C2=B1  3%      +0.9%       294=
8 =C2=B1  3%  interrupts.CPU127.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU128.53:PCI-MSI.23592969-edge.nvme0q9
      3733           +32.3%       4939 =C2=B1 51%      -0.3%       3723    =
    interrupts.CPU128.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU128.IWI:IRQ_work_interrupts
    565919 =C2=B1 15%      +7.0%     605476            +6.7%     603700    =
    interrupts.CPU128.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU128.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7490 =C2=B1 20%      +9.2%       817=
9        interrupts.CPU128.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7490 =C2=B1 20%      +9.2%       817=
9        interrupts.CPU128.PMI:Performance_monitoring_interrupts
    308.83           +59.5%     492.67 =C2=B1 83%      -0.3%     308.00    =
    interrupts.CPU128.RES:Rescheduling_interrupts
      2959 =C2=B1  3%      +2.9%       3046 =C2=B1  3%      -1.5%       291=
4 =C2=B1  4%  interrupts.CPU128.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU129.54:PCI-MSI.23592970-edge.nvme0q10
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU129.70:PCI-MSI.23592970-edge.nvme0q10
      3737            +5.3%       3936 =C2=B1 13%      +0.0%       3738    =
    interrupts.CPU129.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU129.IWI:IRQ_work_interrupts
    566075 =C2=B1 15%      +7.0%     605471            +6.6%     603684    =
    interrupts.CPU129.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU129.MCP:Machine_check_polls
      7486 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +9.2%       817=
8        interrupts.CPU129.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +9.2%       817=
8        interrupts.CPU129.PMI:Performance_monitoring_interrupts
    307.67           +23.7%     380.50 =C2=B1 43%      +0.1%     308.00    =
    interrupts.CPU129.RES:Rescheduling_interrupts
      2921 =C2=B1  4%      -0.0%       2920 =C2=B1  3%      +1.1%       295=
3 =C2=B1  3%  interrupts.CPU129.TLB:TLB_shootdowns
      1467 =C2=B1 96%    +374.0%       6955 =C2=B1131%    +406.2%       742=
6 =C2=B1187%  interrupts.CPU13.34:PCI-MSI.524292-edge.eth0-TxRx-3
      3751            +0.5%       3770            -0.6%       3727        i=
nterrupts.CPU13.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU13.IWI:IRQ_work_interrupts
    564009 =C2=B1 16%      +7.4%     605581            +7.1%     603913    =
    interrupts.CPU13.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU13.MCP:Machine_check_polls
      7507 =C2=B1 20%      -0.0%       7504 =C2=B1 20%      +9.2%       819=
4        interrupts.CPU13.NMI:Non-maskable_interrupts
      7507 =C2=B1 20%      -0.0%       7504 =C2=B1 20%      +9.2%       819=
4        interrupts.CPU13.PMI:Performance_monitoring_interrupts
    339.00 =C2=B1  9%      -3.8%     326.00 =C2=B1  4%      -4.3%     324.5=
0 =C2=B1  5%  interrupts.CPU13.RES:Rescheduling_interrupts
      2999 =C2=B1  3%      +0.1%       3002 =C2=B1  3%      -1.8%       294=
6 =C2=B1  4%  interrupts.CPU13.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU130.73:PCI-MSI.23592971-edge.nvme0q11
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU130.78:PCI-MSI.23592971-edge.nvme0q11
      3767            -0.0%       3766            -0.3%       3756        i=
nterrupts.CPU130.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU130.IWI:IRQ_work_interrupts
    565655 =C2=B1 15%      +7.0%     605453            +6.7%     603679    =
    interrupts.CPU130.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU130.MCP:Machine_check_polls
      7486 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +9.2%       817=
9        interrupts.CPU130.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +9.2%       817=
9        interrupts.CPU130.PMI:Performance_monitoring_interrupts
    310.00            -0.9%     307.33            +1.0%     313.17 =C2=B1  =
3%  interrupts.CPU130.RES:Rescheduling_interrupts
      3010 =C2=B1  3%      +2.3%       3081            -2.0%       2951 =C2=
=B1  4%  interrupts.CPU130.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU131.59:PCI-MSI.23592972-edge.nvme0q12
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU131.64:PCI-MSI.23592972-edge.nvme0q12
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU131.65:PCI-MSI.23592972-edge.nvme0q12
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU131.76:PCI-MSI.23592972-edge.nvme0q12
      3732 =C2=B1  2%      -1.0%       3695            -0.7%       3704 =C2=
=B1  2%  interrupts.CPU131.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU131.IWI:IRQ_work_interrupts
    565142 =C2=B1 16%      +7.1%     605528            +6.8%     603680    =
    interrupts.CPU131.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU131.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +9.2%       818=
0        interrupts.CPU131.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +9.2%       818=
0        interrupts.CPU131.PMI:Performance_monitoring_interrupts
    306.83            +0.2%     307.33            +0.6%     308.67        i=
nterrupts.CPU131.RES:Rescheduling_interrupts
      2930 =C2=B1  4%      -1.2%       2896 =C2=B1  3%      +1.1%       296=
2 =C2=B1  3%  interrupts.CPU131.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU132.60:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU132.62:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU132.77:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU132.80:PCI-MSI.23592973-edge.nvme0q13
      3767            +0.6%       3788            -0.2%       3758 =C2=B1  =
2%  interrupts.CPU132.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU132.IWI:IRQ_work_interrupts
    565521 =C2=B1 15%      +7.1%     605474            +6.7%     603677    =
    interrupts.CPU132.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU132.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +0.1%       749=
6 =C2=B1 20%  interrupts.CPU132.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +0.1%       749=
6 =C2=B1 20%  interrupts.CPU132.PMI:Performance_monitoring_interrupts
    308.00           +48.6%     457.83 =C2=B1 73%      +2.4%     315.50 =C2=
=B1  4%  interrupts.CPU132.RES:Rescheduling_interrupts
      3014 =C2=B1  3%      +1.3%       3054 =C2=B1  3%      -1.7%       296=
2 =C2=B1  4%  interrupts.CPU132.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU133.61:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU133.62:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU133.78:PCI-MSI.23592974-edge.nvme0q14
      3726 =C2=B1  2%      -1.1%       3685            +0.2%       3733    =
    interrupts.CPU133.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU133.IWI:IRQ_work_interrupts
    565963 =C2=B1 15%      +7.0%     605524            +6.7%     603748    =
    interrupts.CPU133.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU133.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +0.1%       749=
7 =C2=B1 20%  interrupts.CPU133.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +0.1%       749=
7 =C2=B1 20%  interrupts.CPU133.PMI:Performance_monitoring_interrupts
    308.50            -0.5%     307.00            +0.3%     309.50        i=
nterrupts.CPU133.RES:Rescheduling_interrupts
      2933 =C2=B1  4%      -1.2%       2897 =C2=B1  3%      +1.0%       296=
2 =C2=B1  3%  interrupts.CPU133.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU134.75:PCI-MSI.23592975-edge.nvme0q15
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU134.79:PCI-MSI.23592975-edge.nvme0q15
      3763            +0.2%       3770            -2.3%       3676 =C2=B1  =
4%  interrupts.CPU134.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00 =C2=B1 28%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU134.IWI:IRQ_work_interrupts
    565957 =C2=B1 15%      +7.0%     605477            +6.7%     603712    =
    interrupts.CPU134.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU134.MCP:Machine_check_polls
      6806 =C2=B1 28%     +10.0%       7489 =C2=B1 20%     +10.2%       749=
8 =C2=B1 20%  interrupts.CPU134.NMI:Non-maskable_interrupts
      6806 =C2=B1 28%     +10.0%       7489 =C2=B1 20%     +10.2%       749=
8 =C2=B1 20%  interrupts.CPU134.PMI:Performance_monitoring_interrupts
    307.33            -0.1%     307.17            +0.7%     309.33        i=
nterrupts.CPU134.RES:Rescheduling_interrupts
      3021 =C2=B1  3%      +2.7%       3101            -1.9%       2964 =C2=
=B1  5%  interrupts.CPU134.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU135.66:PCI-MSI.23592976-edge.nvme0q16
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU135.76:PCI-MSI.23592976-edge.nvme0q16
      4166 =C2=B1 18%     -10.9%       3710           -10.2%       3742    =
    interrupts.CPU135.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU135.IWI:IRQ_work_interrupts
    565770 =C2=B1 15%      +7.0%     605478            +6.7%     603657    =
    interrupts.CPU135.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU135.MCP:Machine_check_polls
      6805 =C2=B1 28%     +10.0%       7489 =C2=B1 20%     +10.2%       749=
6 =C2=B1 20%  interrupts.CPU135.NMI:Non-maskable_interrupts
      6805 =C2=B1 28%     +10.0%       7489 =C2=B1 20%     +10.2%       749=
6 =C2=B1 20%  interrupts.CPU135.PMI:Performance_monitoring_interrupts
    383.83 =C2=B1 31%     -19.7%     308.33           -19.9%     307.33    =
    interrupts.CPU135.RES:Rescheduling_interrupts
      2947 =C2=B1  4%      -1.5%       2904 =C2=B1  3%      +0.8%       297=
0 =C2=B1  3%  interrupts.CPU135.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU136.75:PCI-MSI.23592985-edge.nvme0q25
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU136.85:PCI-MSI.23592985-edge.nvme0q25
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU136.98:PCI-MSI.23592985-edge.nvme0q25
      3767            +0.2%       3773            -1.0%       3730        i=
nterrupts.CPU136.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU136.IWI:IRQ_work_interrupts
    564999 =C2=B1 16%      +7.2%     605484            +6.8%     603664    =
    interrupts.CPU136.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU136.MCP:Machine_check_polls
      7488 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +0.1%       749=
7 =C2=B1 20%  interrupts.CPU136.NMI:Non-maskable_interrupts
      7488 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +0.1%       749=
7 =C2=B1 20%  interrupts.CPU136.PMI:Performance_monitoring_interrupts
    307.50            -0.1%     307.17            -0.1%     307.33        i=
nterrupts.CPU136.RES:Rescheduling_interrupts
      2988 =C2=B1  3%      +2.3%       3056 =C2=B1  3%      +0.5%       300=
3 =C2=B1  4%  interrupts.CPU136.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU137.76:PCI-MSI.23592986-edge.nvme0q26
      3729 =C2=B1  2%      -0.6%       3706            +2.3%       3815 =C2=
=B1  4%  interrupts.CPU137.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU137.IWI:IRQ_work_interrupts
    565639 =C2=B1 15%      +7.0%     605500            +6.7%     603663    =
    interrupts.CPU137.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU137.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +0.1%       749=
7 =C2=B1 20%  interrupts.CPU137.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +0.1%       749=
7 =C2=B1 20%  interrupts.CPU137.PMI:Performance_monitoring_interrupts
    307.00            +0.0%     307.00            +8.1%     331.83 =C2=B1 1=
6%  interrupts.CPU137.RES:Rescheduling_interrupts
      2945 =C2=B1  4%      -1.2%       2911 =C2=B1  3%      +1.0%       297=
4 =C2=B1  3%  interrupts.CPU137.TLB:TLB_shootdowns
      3764            +2.9%       3874 =C2=B1  5%      -0.2%       3756    =
    interrupts.CPU138.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU138.IWI:IRQ_work_interrupts
    565627 =C2=B1 15%      +7.0%     605456            +6.7%     603658    =
    interrupts.CPU138.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU138.MCP:Machine_check_polls
      7487 =C2=B1 20%      +9.1%       8171            +0.1%       7496 =C2=
=B1 20%  interrupts.CPU138.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +9.1%       8171            +0.1%       7496 =C2=
=B1 20%  interrupts.CPU138.PMI:Performance_monitoring_interrupts
    306.33           +12.0%     343.00 =C2=B1 17%      +0.7%     308.50    =
    interrupts.CPU138.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      -0.2%       3023 =C2=B1  4%      -0.5%       301=
6 =C2=B1  4%  interrupts.CPU138.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU139.90:PCI-MSI.23592988-edge.nvme0q28
      5533 =C2=B1 48%     -33.0%       3708           -32.3%       3744    =
    interrupts.CPU139.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU139.IWI:IRQ_work_interrupts
    565724 =C2=B1 15%      +7.0%     605492            +6.7%     603661    =
    interrupts.CPU139.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU139.MCP:Machine_check_polls
      7486 =C2=B1 20%      +0.0%       7490 =C2=B1 20%      +9.2%       817=
8        interrupts.CPU139.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +0.0%       7490 =C2=B1 20%      +9.2%       817=
8        interrupts.CPU139.PMI:Performance_monitoring_interrupts
    566.67 =C2=B1 72%     -45.7%     307.83           -45.1%     311.00 =C2=
=B1  2%  interrupts.CPU139.RES:Rescheduling_interrupts
      2956 =C2=B1  4%      -1.3%       2918 =C2=B1  3%      +0.8%       297=
9 =C2=B1  3%  interrupts.CPU139.TLB:TLB_shootdowns
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU14.4:IO-APIC.4-edge.ttyS0
      3690            -0.2%       3682            -0.1%       3685        i=
nterrupts.CPU14.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU14.IWI:IRQ_work_interrupts
    564000 =C2=B1 16%      +7.4%     605504            +7.1%     603853    =
    interrupts.CPU14.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU14.MCP:Machine_check_polls
      7507 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.2%       819=
5        interrupts.CPU14.NMI:Non-maskable_interrupts
      7507 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.2%       819=
5        interrupts.CPU14.PMI:Performance_monitoring_interrupts
    310.33            -0.3%     309.50            +5.4%     327.17 =C2=B1 1=
0%  interrupts.CPU14.RES:Rescheduling_interrupts
      2836 =C2=B1  3%      -0.3%       2828 =C2=B1  3%      +2.5%       290=
8 =C2=B1  3%  interrupts.CPU14.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU140.102:PCI-MSI.23592989-edge.nvme0q29
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU140.76:PCI-MSI.23592989-edge.nvme0q29
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU140.89:PCI-MSI.23592989-edge.nvme0q29
      3783            -0.4%       3769 =C2=B1  2%      +0.1%       3788    =
    interrupts.CPU140.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU140.IWI:IRQ_work_interrupts
    565962 =C2=B1 15%      +7.0%     605477            +6.7%     603665    =
    interrupts.CPU140.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU140.MCP:Machine_check_polls
      7485 =C2=B1 20%      +0.1%       7490 =C2=B1 20%      +9.3%       817=
9        interrupts.CPU140.NMI:Non-maskable_interrupts
      7485 =C2=B1 20%      +0.1%       7490 =C2=B1 20%      +9.3%       817=
9        interrupts.CPU140.PMI:Performance_monitoring_interrupts
    320.50 =C2=B1  9%      -4.0%     307.83            -3.8%     308.17    =
    interrupts.CPU140.RES:Rescheduling_interrupts
      3072 =C2=B1  2%      +0.2%       3077 =C2=B1  3%      -2.9%       298=
2 =C2=B1  4%  interrupts.CPU140.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU141.103:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU141.78:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU141.87:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU141.94:PCI-MSI.23592990-edge.nvme0q30
      3772 =C2=B1  2%      -1.6%       3713            -0.3%       3761    =
    interrupts.CPU141.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU141.IWI:IRQ_work_interrupts
    565607 =C2=B1 15%      +7.1%     605485            +6.7%     603676    =
    interrupts.CPU141.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU141.MCP:Machine_check_polls
      7486 =C2=B1 20%      +9.1%       8170            +9.3%       8179    =
    interrupts.CPU141.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +9.1%       8170            +9.3%       8179    =
    interrupts.CPU141.PMI:Performance_monitoring_interrupts
    312.67 =C2=B1  3%      -2.0%     306.50           +47.2%     460.17 =C2=
=B1 73%  interrupts.CPU141.RES:Rescheduling_interrupts
      2956 =C2=B1  4%      -1.5%       2911 =C2=B1  2%      +1.0%       298=
6 =C2=B1  3%  interrupts.CPU141.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU142.78:PCI-MSI.23592991-edge.nvme0q31
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU142.88:PCI-MSI.23592991-edge.nvme0q31
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU142.95:PCI-MSI.23592991-edge.nvme0q31
      3775            -0.1%       3770 =C2=B1  2%      -0.6%       3753 =C2=
=B1  2%  interrupts.CPU142.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU142.IWI:IRQ_work_interrupts
    565806 =C2=B1 15%      +7.0%     605479            +6.7%     603656    =
    interrupts.CPU142.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU142.MCP:Machine_check_polls
      8168            -8.3%       7489 =C2=B1 20%      +0.1%       8179    =
    interrupts.CPU142.NMI:Non-maskable_interrupts
      8168            -8.3%       7489 =C2=B1 20%      +0.1%       8179    =
    interrupts.CPU142.PMI:Performance_monitoring_interrupts
    307.83            -0.2%     307.33            +0.4%     309.17        i=
nterrupts.CPU142.RES:Rescheduling_interrupts
      3032 =C2=B1  3%      +1.5%       3079 =C2=B1  3%      -1.5%       298=
7 =C2=B1  4%  interrupts.CPU142.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU143.84:PCI-MSI.23592992-edge.nvme0q32
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU143.85:PCI-MSI.23592992-edge.nvme0q32
      3755 =C2=B1  2%      +3.9%       3900 =C2=B1 10%      -0.0%       375=
4        interrupts.CPU143.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU143.IWI:IRQ_work_interrupts
    565474 =C2=B1 15%      +7.1%     605472            +6.8%     603657    =
    interrupts.CPU143.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU143.MCP:Machine_check_polls
      8168            -8.3%       7488 =C2=B1 20%      +0.1%       8178    =
    interrupts.CPU143.NMI:Non-maskable_interrupts
      8168            -8.3%       7488 =C2=B1 20%      +0.1%       8178    =
    interrupts.CPU143.PMI:Performance_monitoring_interrupts
    308.50           +19.2%     367.67 =C2=B1 37%      -0.2%     308.00    =
    interrupts.CPU143.RES:Rescheduling_interrupts
      2926 =C2=B1  3%      +1.1%       2957 =C2=B1  3%      +2.2%       299=
0 =C2=B1  3%  interrupts.CPU143.TLB:TLB_shootdowns
     16188 =C2=B1 19%      +2.0%      16511 =C2=B1 26%      +2.1%      1652=
3 =C2=B1 36%  interrupts.CPU144.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU144.IWI:IRQ_work_interrupts
    565758 =C2=B1 15%      +7.1%     605820            +6.7%     603583    =
    interrupts.CPU144.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU144.MCP:Machine_check_polls
      8534            -8.4%       7818 =C2=B1 20%      +0.0%       8535    =
    interrupts.CPU144.NMI:Non-maskable_interrupts
      8534            -8.4%       7818 =C2=B1 20%      +0.0%       8535    =
    interrupts.CPU144.PMI:Performance_monitoring_interrupts
    395.83 =C2=B1 33%     -17.4%     327.00 =C2=B1  3%      +0.5%     398.0=
0 =C2=B1 34%  interrupts.CPU144.RES:Rescheduling_interrupts
      3034 =C2=B1  4%      -0.3%       3024 =C2=B1  4%      -3.1%       293=
9 =C2=B1  4%  interrupts.CPU144.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU145.94:PCI-MSI.23592994-edge.nvme0q34
      6130 =C2=B1 18%      -3.4%       5923 =C2=B1 16%      +2.2%       626=
7 =C2=B1 22%  interrupts.CPU145.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU145.IWI:IRQ_work_interrupts
    565679 =C2=B1 15%      +7.1%     605680            +6.7%     603472    =
    interrupts.CPU145.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU145.MCP:Machine_check_polls
      8536            -8.4%       7820 =C2=B1 20%      +0.0%       8539    =
    interrupts.CPU145.NMI:Non-maskable_interrupts
      8536            -8.4%       7820 =C2=B1 20%      +0.0%       8539    =
    interrupts.CPU145.PMI:Performance_monitoring_interrupts
    408.00 =C2=B1  9%      -0.9%     404.50 =C2=B1 11%      +1.0%     412.1=
7 =C2=B1 11%  interrupts.CPU145.RES:Rescheduling_interrupts
      3071 =C2=B1  3%      -4.5%       2932 =C2=B1  3%      -1.6%       302=
1 =C2=B1  3%  interrupts.CPU145.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU146.80:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU146.85:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU146.95:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU146.98:PCI-MSI.23592995-edge.nvme0q35
      4955 =C2=B1 21%      -4.5%       4731 =C2=B1 21%     +34.6%       666=
8 =C2=B1 28%  interrupts.CPU146.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +0.0%       2.83 =C2=B1 13%      +5.9%       3.0=
0        interrupts.CPU146.IWI:IRQ_work_interrupts
    566071 =C2=B1 15%      +7.0%     605570            +6.6%     603349    =
    interrupts.CPU146.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU146.MCP:Machine_check_polls
      7829 =C2=B1 20%      -0.1%       7821 =C2=B1 20%      +9.1%       853=
8        interrupts.CPU146.NMI:Non-maskable_interrupts
      7829 =C2=B1 20%      -0.1%       7821 =C2=B1 20%      +9.1%       853=
8        interrupts.CPU146.PMI:Performance_monitoring_interrupts
    451.33 =C2=B1 30%      -9.3%     409.17 =C2=B1 21%     +22.0%     550.6=
7 =C2=B1 55%  interrupts.CPU146.RES:Rescheduling_interrupts
      3004 =C2=B1  3%      +2.7%       3086 =C2=B1  3%      -1.5%       295=
8 =C2=B1  4%  interrupts.CPU146.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU147.100:PCI-MSI.23592996-edge.nvme0q36
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU147.96:PCI-MSI.23592996-edge.nvme0q36
      4357 =C2=B1 21%     -10.4%       3906 =C2=B1  9%      -4.0%       418=
4 =C2=B1 22%  interrupts.CPU147.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +0.0%       2.83 =C2=
=B1 13%  interrupts.CPU147.IWI:IRQ_work_interrupts
    565655 =C2=B1 15%      +7.1%     605566            +6.7%     603348    =
    interrupts.CPU147.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU147.MCP:Machine_check_polls
      7828 =C2=B1 20%      +9.0%       8535            -0.0%       7824 =C2=
=B1 20%  interrupts.CPU147.NMI:Non-maskable_interrupts
      7828 =C2=B1 20%      +9.0%       8535            -0.0%       7824 =C2=
=B1 20%  interrupts.CPU147.PMI:Performance_monitoring_interrupts
    742.83 =C2=B1107%     -58.6%     307.83           +23.7%     918.83 =C2=
=B1148%  interrupts.CPU147.RES:Rescheduling_interrupts
      3010 =C2=B1  3%      -2.4%       2937 =C2=B1  3%      -0.4%       299=
6 =C2=B1  3%  interrupts.CPU147.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU148.101:PCI-MSI.23592997-edge.nvme0q37
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU148.104:PCI-MSI.23592997-edge.nvme0q37
      3805 =C2=B1  5%      +4.8%       3987 =C2=B1 11%      -1.7%       374=
0        interrupts.CPU148.CAL:Function_call_interrupts
      2.67 =C2=B1 17%     +12.5%       3.00           +12.5%       3.00    =
    interrupts.CPU148.IWI:IRQ_work_interrupts
    565623 =C2=B1 15%      +7.1%     605567            +6.7%     603331    =
    interrupts.CPU148.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU148.MCP:Machine_check_polls
      7116 =C2=B1 28%     +20.0%       8536           +20.0%       8537    =
    interrupts.CPU148.NMI:Non-maskable_interrupts
      7116 =C2=B1 28%     +20.0%       8536           +20.0%       8537    =
    interrupts.CPU148.PMI:Performance_monitoring_interrupts
    319.50 =C2=B1  3%      +0.1%     319.67 =C2=B1  8%      -4.0%     306.6=
7        interrupts.CPU148.RES:Rescheduling_interrupts
      2998 =C2=B1  5%      +2.9%       3084 =C2=B1  3%      +1.4%       304=
1 =C2=B1  3%  interrupts.CPU148.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU149.111:PCI-MSI.23592998-edge.nvme0q38
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU149.88:PCI-MSI.23592998-edge.nvme0q38
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU149.98:PCI-MSI.23592998-edge.nvme0q38
      3787            -2.1%       3709            -0.9%       3753 =C2=B1  =
2%  interrupts.CPU149.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU149.IWI:IRQ_work_interrupts
    565570 =C2=B1 15%      +7.1%     605554            +6.7%     603296    =
    interrupts.CPU149.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU149.MCP:Machine_check_polls
      7824 =C2=B1 20%      +9.1%       8536            +9.1%       8537    =
    interrupts.CPU149.NMI:Non-maskable_interrupts
      7824 =C2=B1 20%      +9.1%       8536            +9.1%       8537    =
    interrupts.CPU149.PMI:Performance_monitoring_interrupts
    307.83            -0.5%     306.33            +0.9%     310.67 =C2=B1  =
2%  interrupts.CPU149.RES:Rescheduling_interrupts
      3058 =C2=B1  3%      -3.7%       2944 =C2=B1  3%      -2.6%       297=
9 =C2=B1  3%  interrupts.CPU149.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.37:PCI-MSI.65536-edge.ioat-msix
      3746            +0.1%       3750            -0.6%       3722 =C2=B1  =
2%  interrupts.CPU15.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU15.IWI:IRQ_work_interrupts
    563873 =C2=B1 16%      +7.4%     605515            +7.1%     603871    =
    interrupts.CPU15.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU15.MCP:Machine_check_polls
      7507 =C2=B1 20%      -0.0%       7504 =C2=B1 20%      +9.2%       819=
5        interrupts.CPU15.NMI:Non-maskable_interrupts
      7507 =C2=B1 20%      -0.0%       7504 =C2=B1 20%      +9.2%       819=
5        interrupts.CPU15.PMI:Performance_monitoring_interrupts
    310.83            +3.1%     320.50 =C2=B1  7%      +0.3%     311.83    =
    interrupts.CPU15.RES:Rescheduling_interrupts
      3003 =C2=B1  3%      +0.1%       3005 =C2=B1  3%      -1.4%       296=
2 =C2=B1  5%  interrupts.CPU15.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU150.102:PCI-MSI.23592999-edge.nvme0q39
      3754 =C2=B1  2%      +0.9%       3788 =C2=B1  2%     +22.5%       459=
8 =C2=B1 39%  interrupts.CPU150.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU150.IWI:IRQ_work_interrupts
    565693 =C2=B1 15%      +7.0%     605550            +6.6%     603308    =
    interrupts.CPU150.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU150.MCP:Machine_check_polls
      7824 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU150.NMI:Non-maskable_interrupts
      7824 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU150.PMI:Performance_monitoring_interrupts
    307.00            +2.0%     313.00 =C2=B1  4%     +32.3%     406.17 =C2=
=B1 54%  interrupts.CPU150.RES:Rescheduling_interrupts
      3015 =C2=B1  4%      +2.7%       3097 =C2=B1  3%      -0.3%       300=
7 =C2=B1  4%  interrupts.CPU150.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU151.104:PCI-MSI.23593000-edge.nvme0q40
      3768 =C2=B1  2%      -1.0%       3731            -0.7%       3743 =C2=
=B1  3%  interrupts.CPU151.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU151.IWI:IRQ_work_interrupts
    566018 =C2=B1 15%      +7.0%     605557            +6.6%     603323    =
    interrupts.CPU151.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU151.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8535            +9.1%       8536    =
    interrupts.CPU151.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8535            +9.1%       8536    =
    interrupts.CPU151.PMI:Performance_monitoring_interrupts
    310.00 =C2=B1  2%      -0.9%     307.17            +1.0%     313.17 =C2=
=B1  4%  interrupts.CPU151.RES:Rescheduling_interrupts
      3063 =C2=B1  3%      -4.0%       2940 =C2=B1  2%      -1.6%       301=
2 =C2=B1  3%  interrupts.CPU151.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU152.89:PCI-MSI.23593001-edge.nvme0q41
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU152.91:PCI-MSI.23593001-edge.nvme0q41
      3775            -0.1%       3770 =C2=B1  2%      -0.1%       3773 =C2=
=B1  2%  interrupts.CPU152.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU152.IWI:IRQ_work_interrupts
    565611 =C2=B1 15%      +7.1%     605552            +6.7%     603349    =
    interrupts.CPU152.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU152.MCP:Machine_check_polls
      7824 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU152.NMI:Non-maskable_interrupts
      7824 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU152.PMI:Performance_monitoring_interrupts
    308.00            -0.5%     306.50            -0.6%     306.17        i=
nterrupts.CPU152.RES:Rescheduling_interrupts
      3028 =C2=B1  3%      +0.9%       3056 =C2=B1  4%      -0.3%       302=
1 =C2=B1  4%  interrupts.CPU152.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU153.87:PCI-MSI.23593002-edge.nvme0q42
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU153.99:PCI-MSI.23593002-edge.nvme0q42
      3718 =C2=B1  2%      -0.1%       3716            +0.5%       3737 =C2=
=B1  2%  interrupts.CPU153.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU153.IWI:IRQ_work_interrupts
    565477 =C2=B1 15%      +7.1%     605544            +6.7%     603328    =
    interrupts.CPU153.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU153.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU153.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU153.PMI:Performance_monitoring_interrupts
    307.33            -0.1%     307.17            +0.2%     308.00        i=
nterrupts.CPU153.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      -2.5%       2954 =C2=B1  2%      -1.7%       297=
7 =C2=B1  2%  interrupts.CPU153.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU154.88:PCI-MSI.23593003-edge.nvme0q43
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU154.93:PCI-MSI.23593003-edge.nvme0q43
      3766            +0.8%       3795            +0.1%       3771 =C2=B1  =
2%  interrupts.CPU154.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU154.IWI:IRQ_work_interrupts
    565413 =C2=B1 15%      +7.1%     605555            +6.7%     603321    =
    interrupts.CPU154.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU154.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8536            +9.1%       8537    =
    interrupts.CPU154.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8536            +9.1%       8537    =
    interrupts.CPU154.PMI:Performance_monitoring_interrupts
    313.17 =C2=B1  3%      -2.3%     306.00            -2.2%     306.17    =
    interrupts.CPU154.RES:Rescheduling_interrupts
      3024 =C2=B1  3%      +2.8%       3108 =C2=B1  3%      -0.3%       301=
5 =C2=B1  4%  interrupts.CPU154.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU155.101:PCI-MSI.23593004-edge.nvme0q44
      3735 =C2=B1  3%      +1.2%       3778 =C2=B1  4%      +0.9%       377=
0        interrupts.CPU155.CAL:Function_call_interrupts
      2.67 =C2=B1 17%     +12.5%       3.00           +12.5%       3.00    =
    interrupts.CPU155.IWI:IRQ_work_interrupts
    565178 =C2=B1 15%      +7.1%     605547            +6.7%     603297    =
    interrupts.CPU155.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU155.MCP:Machine_check_polls
      7112 =C2=B1 28%     +20.0%       8534           +20.0%       8537    =
    interrupts.CPU155.NMI:Non-maskable_interrupts
      7112 =C2=B1 28%     +20.0%       8534           +20.0%       8537    =
    interrupts.CPU155.PMI:Performance_monitoring_interrupts
    308.33            +3.7%     319.83 =C2=B1  9%      -0.6%     306.50    =
    interrupts.CPU155.RES:Rescheduling_interrupts
      2996 =C2=B1  4%      -1.4%       2953 =C2=B1  2%      +0.8%       302=
0 =C2=B1  2%  interrupts.CPU155.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU156.93:PCI-MSI.23593005-edge.nvme0q45
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU156.95:PCI-MSI.23593005-edge.nvme0q45
      3833 =C2=B1  4%      -1.2%       3787            -1.5%       3773    =
    interrupts.CPU156.CAL:Function_call_interrupts
      2.67 =C2=B1 17%     +12.5%       3.00           +12.5%       3.00    =
    interrupts.CPU156.IWI:IRQ_work_interrupts
    566084 =C2=B1 15%      +7.0%     605552            +6.6%     603324    =
    interrupts.CPU156.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU156.MCP:Machine_check_polls
      7112 =C2=B1 28%     +20.0%       8534           +20.0%       8537    =
    interrupts.CPU156.NMI:Non-maskable_interrupts
      7112 =C2=B1 28%     +20.0%       8534           +20.0%       8537    =
    interrupts.CPU156.PMI:Performance_monitoring_interrupts
    323.67 =C2=B1 11%      -5.4%     306.33            -5.3%     306.50    =
    interrupts.CPU156.RES:Rescheduling_interrupts
      3028 =C2=B1  4%      +2.4%       3102 =C2=B1  3%      +1.0%       305=
9 =C2=B1  3%  interrupts.CPU156.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU157.94:PCI-MSI.23593006-edge.nvme0q46
      3892 =C2=B1  6%      -4.6%       3711 =C2=B1  2%      -3.3%       376=
3        interrupts.CPU157.CAL:Function_call_interrupts
      2.67 =C2=B1 17%     +12.5%       3.00            +6.3%       2.83 =C2=
=B1 13%  interrupts.CPU157.IWI:IRQ_work_interrupts
    566071 =C2=B1 15%      +7.0%     605601            +6.6%     603328    =
    interrupts.CPU157.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU157.MCP:Machine_check_polls
      7113 =C2=B1 28%     +20.0%       8535           +10.0%       7827 =C2=
=B1 20%  interrupts.CPU157.NMI:Non-maskable_interrupts
      7113 =C2=B1 28%     +20.0%       8535           +10.0%       7827 =C2=
=B1 20%  interrupts.CPU157.PMI:Performance_monitoring_interrupts
    336.33 =C2=B1 19%      -8.6%     307.33            -8.6%     307.50    =
    interrupts.CPU157.RES:Rescheduling_interrupts
      3076 =C2=B1  3%      -3.8%       2958 =C2=B1  2%      -0.7%       305=
5 =C2=B1  2%  interrupts.CPU157.TLB:TLB_shootdowns
      3772            -1.0%       3734 =C2=B1  2%      -0.7%       3746 =C2=
=B1  2%  interrupts.CPU158.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU158.IWI:IRQ_work_interrupts
    565698 =C2=B1 15%      +7.1%     605590            +6.7%     603319    =
    interrupts.CPU158.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU158.MCP:Machine_check_polls
      8536            -0.0%       8535            +0.0%       8536        i=
nterrupts.CPU158.NMI:Non-maskable_interrupts
      8536            -0.0%       8535            +0.0%       8536        i=
nterrupts.CPU158.PMI:Performance_monitoring_interrupts
    307.33            +0.9%     310.00 =C2=B1  2%      +4.6%     321.33 =C2=
=B1 10%  interrupts.CPU158.RES:Rescheduling_interrupts
      3042 =C2=B1  3%      +0.9%       3071 =C2=B1  4%      -0.3%       303=
3 =C2=B1  4%  interrupts.CPU158.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU159.108:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU159.112:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU159.93:PCI-MSI.23593008-edge.nvme0q48
      3785 =C2=B1  2%      -1.0%       3747            -0.3%       3773 =C2=
=B1  2%  interrupts.CPU159.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU159.IWI:IRQ_work_interrupts
    565419 =C2=B1 15%      +7.1%     605549            +6.7%     603336    =
    interrupts.CPU159.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU159.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU159.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU159.PMI:Performance_monitoring_interrupts
    307.33            -0.1%     307.17            -0.1%     307.00        i=
nterrupts.CPU159.RES:Rescheduling_interrupts
      3041 =C2=B1  3%      -1.3%       3002 =C2=B1  2%      -0.2%       303=
4 =C2=B1  3%  interrupts.CPU159.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.161:PCI-MSI.23593073-edge.nvme0q113
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.39:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.41:PCI-MSI.67584-edge.ioat-msix
      3688            +0.3%       3698 =C2=B1  2%      +1.0%       3725    =
    interrupts.CPU16.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU16.IWI:IRQ_work_interrupts
    564142 =C2=B1 16%      +7.3%     605492            +7.0%     603864    =
    interrupts.CPU16.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU16.MCP:Machine_check_polls
      7509 =C2=B1 20%      +9.0%       8187            +9.1%       8195    =
    interrupts.CPU16.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      +9.0%       8187            +9.1%       8195    =
    interrupts.CPU16.PMI:Performance_monitoring_interrupts
    309.83            +0.2%     310.50            +0.9%     312.50        i=
nterrupts.CPU16.RES:Rescheduling_interrupts
      2838 =C2=B1  3%      +2.8%       2917 =C2=B1  5%      +2.9%       291=
9 =C2=B1  4%  interrupts.CPU16.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU160.102:PCI-MSI.23593017-edge.nvme0q57
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU160.107:PCI-MSI.23593017-edge.nvme0q57
      3751            +1.6%       3810            +1.0%       3788        i=
nterrupts.CPU160.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU160.IWI:IRQ_work_interrupts
    565784 =C2=B1 15%      +7.0%     605549            +6.6%     603297    =
    interrupts.CPU160.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU160.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU160.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8535            +9.1%       8537    =
    interrupts.CPU160.PMI:Performance_monitoring_interrupts
    307.50            -0.1%     307.17            -0.1%     307.17        i=
nterrupts.CPU160.RES:Rescheduling_interrupts
      3044 =C2=B1  3%      +2.2%       3110 =C2=B1  3%      +1.8%       309=
8 =C2=B1  2%  interrupts.CPU160.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU161.103:PCI-MSI.23593018-edge.nvme0q58
      3745 =C2=B1  3%      -0.3%       3733 =C2=B1  3%      +0.5%       376=
2        interrupts.CPU161.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU161.IWI:IRQ_work_interrupts
    565750 =C2=B1 15%      +7.0%     605462            +6.6%     603325    =
    interrupts.CPU161.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU161.MCP:Machine_check_polls
      7824 =C2=B1 20%      +9.1%       8536            +9.1%       8535    =
    interrupts.CPU161.NMI:Non-maskable_interrupts
      7824 =C2=B1 20%      +9.1%       8536            +9.1%       8535    =
    interrupts.CPU161.PMI:Performance_monitoring_interrupts
    309.00            +0.1%     309.33 =C2=B1  2%      +3.6%     320.17 =C2=
=B1  9%  interrupts.CPU161.RES:Rescheduling_interrupts
      3054 =C2=B1  3%      -3.0%       2962 =C2=B1  2%      -0.6%       303=
6 =C2=B1  3%  interrupts.CPU161.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU162.107:PCI-MSI.23593019-edge.nvme0q59
      4182 =C2=B1 20%      -9.4%       3787 =C2=B1  2%      -2.9%       406=
0 =C2=B1 19%  interrupts.CPU162.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU162.IWI:IRQ_work_interrupts
    566322 =C2=B1 15%      +6.9%     605545            +6.5%     603356    =
    interrupts.CPU162.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU162.MCP:Machine_check_polls
      8537            -0.0%       8535            -0.0%       8536        i=
nterrupts.CPU162.NMI:Non-maskable_interrupts
      8537            -0.0%       8535            -0.0%       8536        i=
nterrupts.CPU162.PMI:Performance_monitoring_interrupts
    364.83 =C2=B1 35%     -12.6%     318.83 =C2=B1  8%     -15.5%     308.3=
3        interrupts.CPU162.RES:Rescheduling_interrupts
      3085 =C2=B1  2%      +1.0%       3114 =C2=B1  3%      -1.8%       303=
0 =C2=B1  4%  interrupts.CPU162.TLB:TLB_shootdowns
      3779 =C2=B1  2%      +0.7%       3805 =C2=B1  5%      -0.5%       376=
2        interrupts.CPU163.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU163.IWI:IRQ_work_interrupts
    566269 =C2=B1 15%      +6.9%     605547            +6.5%     603329    =
    interrupts.CPU163.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU163.MCP:Machine_check_polls
      8537            -8.4%       7821 =C2=B1 20%      -0.0%       8536    =
    interrupts.CPU163.NMI:Non-maskable_interrupts
      8537            -8.4%       7821 =C2=B1 20%      -0.0%       8536    =
    interrupts.CPU163.PMI:Performance_monitoring_interrupts
    307.83            +7.6%     331.17 =C2=B1 16%      -0.4%     306.50    =
    interrupts.CPU163.RES:Rescheduling_interrupts
      3048 =C2=B1  3%      -2.4%       2975 =C2=B1  2%      -0.5%       303=
4 =C2=B1  3%  interrupts.CPU163.TLB:TLB_shootdowns
      3723 =C2=B1  3%      +1.7%       3786 =C2=B1  2%      +1.4%       377=
4 =C2=B1  2%  interrupts.CPU164.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU164.IWI:IRQ_work_interrupts
    566382 =C2=B1 15%      +6.9%     605549            +6.5%     603314    =
    interrupts.CPU164.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU164.MCP:Machine_check_polls
      8537            -0.0%       8534            -0.0%       8534        i=
nterrupts.CPU164.NMI:Non-maskable_interrupts
      8537            -0.0%       8534            -0.0%       8534        i=
nterrupts.CPU164.PMI:Performance_monitoring_interrupts
    307.83            +1.4%     312.00 =C2=B1  3%      -0.2%     307.33    =
    interrupts.CPU164.RES:Rescheduling_interrupts
      3054 =C2=B1  3%      +2.1%       3119 =C2=B1  3%      -0.4%       304=
3 =C2=B1  4%  interrupts.CPU164.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU165.112:PCI-MSI.23593022-edge.nvme0q62
      3778            -1.5%       3722            -0.9%       3743        i=
nterrupts.CPU165.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU165.IWI:IRQ_work_interrupts
    565828 =C2=B1 15%      +7.0%     605546            +6.6%     603246    =
    interrupts.CPU165.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU165.MCP:Machine_check_polls
      8536            -8.3%       7826 =C2=B1 20%      -0.0%       8535    =
    interrupts.CPU165.NMI:Non-maskable_interrupts
      8536            -8.3%       7826 =C2=B1 20%      -0.0%       8535    =
    interrupts.CPU165.PMI:Performance_monitoring_interrupts
    305.83            +0.1%     306.00            +0.6%     307.67        i=
nterrupts.CPU165.RES:Rescheduling_interrupts
      3060 =C2=B1  3%      -2.7%       2976 =C2=B1  2%      -1.8%       300=
6 =C2=B1  4%  interrupts.CPU165.TLB:TLB_shootdowns
      3745            +0.6%       3766            +0.8%       3775 =C2=B1  =
2%  interrupts.CPU166.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      +0.0%       3.00    =
    interrupts.CPU166.IWI:IRQ_work_interrupts
    565858 =C2=B1 15%      +7.0%     605596            +6.6%     603298    =
    interrupts.CPU166.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU166.MCP:Machine_check_polls
      8536           -16.7%       7113 =C2=B1 28%      -0.0%       8535    =
    interrupts.CPU166.NMI:Non-maskable_interrupts
      8536           -16.7%       7113 =C2=B1 28%      -0.0%       8535    =
    interrupts.CPU166.PMI:Performance_monitoring_interrupts
    306.50            +0.0%     306.50            +1.6%     311.50 =C2=B1  =
3%  interrupts.CPU166.RES:Rescheduling_interrupts
      3070 =C2=B1  3%      +2.1%       3134 =C2=B1  2%      +0.5%       308=
7 =C2=B1  4%  interrupts.CPU166.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU167.127:PCI-MSI.23593024-edge.nvme0q64
      3791 =C2=B1  2%      -0.6%       3767            -1.2%       3746 =C2=
=B1  2%  interrupts.CPU167.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      +0.0%       3.00    =
    interrupts.CPU167.IWI:IRQ_work_interrupts
    565955 =C2=B1 15%      +7.0%     605541            +6.6%     603253    =
    interrupts.CPU167.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU167.MCP:Machine_check_polls
      8536           -16.7%       7113 =C2=B1 28%      -0.0%       8535    =
    interrupts.CPU167.NMI:Non-maskable_interrupts
      8536           -16.7%       7113 =C2=B1 28%      -0.0%       8535    =
    interrupts.CPU167.PMI:Performance_monitoring_interrupts
    307.17            -0.1%     306.83            +0.2%     307.67        i=
nterrupts.CPU167.RES:Rescheduling_interrupts
      3124 =C2=B1  3%      -2.3%       3052 =C2=B1  2%      -1.3%       308=
2 =C2=B1  3%  interrupts.CPU167.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU168.115:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU168.127:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU168.129:PCI-MSI.23593025-edge.nvme0q65
     13959 =C2=B1 18%     +43.1%      19973 =C2=B1 21%      -0.3%      1391=
2 =C2=B1 32%  interrupts.CPU168.CAL:Function_call_interrupts
      2.00            +8.3%       2.17 =C2=B1 17%      +0.0%       2.00    =
    interrupts.CPU168.IWI:IRQ_work_interrupts
    562950 =C2=B1 16%      +7.6%     605755            +7.2%     603259    =
    interrupts.CPU168.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU168.MCP:Machine_check_polls
      7335 =C2=B1 20%      -9.1%       6665 =C2=B1 28%      +8.8%       798=
3        interrupts.CPU168.NMI:Non-maskable_interrupts
      7335 =C2=B1 20%      -9.1%       6665 =C2=B1 28%      +8.8%       798=
3        interrupts.CPU168.PMI:Performance_monitoring_interrupts
    332.17 =C2=B1  3%      +6.6%     354.17 =C2=B1  7%     +10.7%     367.6=
7 =C2=B1 13%  interrupts.CPU168.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      +0.5%       3045 =C2=B1  2%      +0.7%       305=
3 =C2=B1  4%  interrupts.CPU168.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU169.114:PCI-MSI.23593026-edge.nvme0q66
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU169.128:PCI-MSI.23593026-edge.nvme0q66
      6983 =C2=B1 13%     -30.9%       4822 =C2=B1 10%     -14.1%       599=
6 =C2=B1 12%  interrupts.CPU169.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU169.IWI:IRQ_work_interrupts
    561475 =C2=B1 17%      +7.9%     605696            +7.4%     603215    =
    interrupts.CPU169.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU169.MCP:Machine_check_polls
      8005           -16.7%       6666 =C2=B1 28%      -0.2%       7985    =
    interrupts.CPU169.NMI:Non-maskable_interrupts
      8005           -16.7%       6666 =C2=B1 28%      -0.2%       7985    =
    interrupts.CPU169.PMI:Performance_monitoring_interrupts
    436.83 =C2=B1 12%      -9.4%     395.83 =C2=B1 10%      -0.9%     433.0=
0 =C2=B1 16%  interrupts.CPU169.RES:Rescheduling_interrupts
      3084 =C2=B1  3%      -1.5%       3039 =C2=B1  2%      -1.2%       304=
5 =C2=B1  3%  interrupts.CPU169.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.40:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.42:PCI-MSI.69632-edge.ioat-msix
      3767            -1.2%       3721            -2.6%       3670 =C2=B1  =
4%  interrupts.CPU17.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU17.IWI:IRQ_work_interrupts
    563433 =C2=B1 16%      +7.4%     605407            +7.2%     603875    =
    interrupts.CPU17.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU17.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.1%       819=
5        interrupts.CPU17.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.1%       819=
5        interrupts.CPU17.PMI:Performance_monitoring_interrupts
    316.67 =C2=B1  4%      -0.9%     313.83 =C2=B1  2%      -0.3%     315.6=
7        interrupts.CPU17.RES:Rescheduling_interrupts
      3009 =C2=B1  3%      -1.1%       2977 =C2=B1  3%      -4.7%       286=
7 =C2=B1  8%  interrupts.CPU17.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU170.121:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU170.124:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU170.129:PCI-MSI.23593027-edge.nvme0q67
      4468 =C2=B1 16%      +1.2%       4522 =C2=B1 28%     +13.8%       508=
7 =C2=B1 30%  interrupts.CPU170.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU170.IWI:IRQ_work_interrupts
    561724 =C2=B1 17%      +7.8%     605630            +7.4%     603073    =
    interrupts.CPU170.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU170.MCP:Machine_check_polls
      8005           -16.7%       6666 =C2=B1 28%      -0.2%       7985    =
    interrupts.CPU170.NMI:Non-maskable_interrupts
      8005           -16.7%       6666 =C2=B1 28%      -0.2%       7985    =
    interrupts.CPU170.PMI:Performance_monitoring_interrupts
    379.00 =C2=B1 20%     -12.4%     332.17 =C2=B1 11%     +21.5%     460.6=
7 =C2=B1 44%  interrupts.CPU170.RES:Rescheduling_interrupts
      3049 =C2=B1  3%      +3.0%       3140 =C2=B1  2%      +1.1%       308=
4 =C2=B1  3%  interrupts.CPU170.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU171.118:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU171.132:PCI-MSI.23593028-edge.nvme0q68
      5173 =C2=B1 50%     -13.2%       4487 =C2=B1 19%     -16.6%       431=
3 =C2=B1 15%  interrupts.CPU171.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU171.IWI:IRQ_work_interrupts
    561588 =C2=B1 17%      +7.8%     605552            +7.4%     603035    =
    interrupts.CPU171.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU171.MCP:Machine_check_polls
      7338 =C2=B1 20%      +9.0%       8000            +8.8%       7985    =
    interrupts.CPU171.NMI:Non-maskable_interrupts
      7338 =C2=B1 20%      +9.0%       8000            +8.8%       7985    =
    interrupts.CPU171.PMI:Performance_monitoring_interrupts
    537.17 =C2=B1 70%     -13.9%     462.33 =C2=B1 43%     -34.1%     354.1=
7 =C2=B1 15%  interrupts.CPU171.RES:Rescheduling_interrupts
      3092 =C2=B1  3%      -1.1%       3057 =C2=B1  2%      -0.7%       306=
9 =C2=B1  2%  interrupts.CPU171.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU172.113:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU172.114:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU172.131:PCI-MSI.23593029-edge.nvme0q69
      3786 =C2=B1  2%      +1.3%       3835            +0.6%       3809    =
    interrupts.CPU172.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU172.IWI:IRQ_work_interrupts
    561068 =C2=B1 17%      +7.9%     605563            +7.5%     603030    =
    interrupts.CPU172.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU172.MCP:Machine_check_polls
      7338 =C2=B1 20%      +9.0%       8000            +8.8%       7985    =
    interrupts.CPU172.NMI:Non-maskable_interrupts
      7338 =C2=B1 20%      +9.0%       8000            +8.8%       7985    =
    interrupts.CPU172.PMI:Performance_monitoring_interrupts
    308.33           +49.6%     461.17 =C2=B1 74%      +0.2%     308.83    =
    interrupts.CPU172.RES:Rescheduling_interrupts
      3095 =C2=B1  3%      +1.7%       3146 =C2=B1  3%      +0.4%       310=
5 =C2=B1  2%  interrupts.CPU172.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU173.114:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU173.120:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU173.122:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU173.133:PCI-MSI.23593030-edge.nvme0q70
      3769           +32.2%       4981 =C2=B1 54%      +0.4%       3785    =
    interrupts.CPU173.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU173.IWI:IRQ_work_interrupts
    561411 =C2=B1 17%      +7.9%     605584            +7.4%     603042    =
    interrupts.CPU173.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU173.MCP:Machine_check_polls
      7337 =C2=B1 20%      +9.0%       8000            +8.8%       7985    =
    interrupts.CPU173.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      +9.0%       8000            +8.8%       7985    =
    interrupts.CPU173.PMI:Performance_monitoring_interrupts
    307.00           +62.4%     498.67 =C2=B1 84%      +0.3%     307.83    =
    interrupts.CPU173.RES:Rescheduling_interrupts
      3073 =C2=B1  2%      -1.3%       3034 =C2=B1  2%      -0.4%       306=
1 =C2=B1  2%  interrupts.CPU173.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU174.121:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU174.123:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU174.125:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU174.133:PCI-MSI.23593031-edge.nvme0q71
      3844 =C2=B1  3%     +31.3%       5046 =C2=B1 59%      -2.5%       374=
7 =C2=B1  2%  interrupts.CPU174.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU174.IWI:IRQ_work_interrupts
    560941 =C2=B1 17%      +8.0%     605624            +7.5%     602958    =
    interrupts.CPU174.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU174.MCP:Machine_check_polls
      7336 =C2=B1 20%      +9.0%       7998            +8.8%       7984    =
    interrupts.CPU174.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      +9.0%       7998            +8.8%       7984    =
    interrupts.CPU174.PMI:Performance_monitoring_interrupts
    317.83 =C2=B1  5%     +57.2%     499.67 =C2=B1 82%      -3.1%     308.0=
0        interrupts.CPU174.RES:Rescheduling_interrupts
      3100 =C2=B1  3%      -0.4%       3089 =C2=B1  4%      -2.8%       301=
4 =C2=B1  4%  interrupts.CPU174.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU175.126:PCI-MSI.23593032-edge.nvme0q72
      3827            -2.1%       3745            -0.8%       3797        i=
nterrupts.CPU175.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU175.IWI:IRQ_work_interrupts
    561479 =C2=B1 17%      +7.9%     605558            +7.4%     603064    =
    interrupts.CPU175.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU175.MCP:Machine_check_polls
      7337 =C2=B1 20%      +9.0%       8000            +8.8%       7985    =
    interrupts.CPU175.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      +9.0%       8000            +8.8%       7985    =
    interrupts.CPU175.PMI:Performance_monitoring_interrupts
    461.50 =C2=B1 74%     -18.7%     375.17 =C2=B1 40%     -33.4%     307.3=
3        interrupts.CPU175.RES:Rescheduling_interrupts
      3133 =C2=B1  2%      -4.7%       2986            -1.7%       3078 =C2=
=B1  2%  interrupts.CPU175.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU176.125:PCI-MSI.23593033-edge.nvme0q73
      3794            +0.6%       3815 =C2=B1  2%      -0.2%       3788 =C2=
=B1  2%  interrupts.CPU176.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU176.IWI:IRQ_work_interrupts
    561812 =C2=B1 17%      +7.8%     605530            +7.3%     603096    =
    interrupts.CPU176.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU176.MCP:Machine_check_polls
      7337 =C2=B1 20%      +9.0%       7998            +8.9%       7986    =
    interrupts.CPU176.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      +9.0%       7998            +8.9%       7986    =
    interrupts.CPU176.PMI:Performance_monitoring_interrupts
    307.00            +4.2%     319.83 =C2=B1  7%      +0.5%     308.67    =
    interrupts.CPU176.RES:Rescheduling_interrupts
      3071 =C2=B1  3%      +1.7%       3123 =C2=B1  3%      -0.1%       306=
8 =C2=B1  4%  interrupts.CPU176.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU177.128:PCI-MSI.23593034-edge.nvme0q74
      3801            -0.6%       3777 =C2=B1  2%      -0.4%       3788    =
    interrupts.CPU177.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU177.IWI:IRQ_work_interrupts
    561898 =C2=B1 17%      +7.8%     605626            +7.3%     603073    =
    interrupts.CPU177.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU177.MCP:Machine_check_polls
      7336 =C2=B1 20%      +9.0%       7999            +8.8%       7985    =
    interrupts.CPU177.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      +9.0%       7999            +8.8%       7985    =
    interrupts.CPU177.PMI:Performance_monitoring_interrupts
    306.33            +1.0%     309.50            +0.1%     306.50        i=
nterrupts.CPU177.RES:Rescheduling_interrupts
      3098 =C2=B1  3%      -1.3%       3058 =C2=B1  3%      -0.1%       309=
6 =C2=B1  3%  interrupts.CPU177.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU178.124:PCI-MSI.23593035-edge.nvme0q75
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU178.125:PCI-MSI.23593035-edge.nvme0q75
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU178.137:PCI-MSI.23593035-edge.nvme0q75
      3809            +0.4%       3825            -0.8%       3778        i=
nterrupts.CPU178.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU178.IWI:IRQ_work_interrupts
    561588 =C2=B1 17%      +7.8%     605543            +7.4%     603057    =
    interrupts.CPU178.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU178.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +8.8%       798=
5        interrupts.CPU178.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +8.8%       798=
5        interrupts.CPU178.PMI:Performance_monitoring_interrupts
    306.83           +50.5%     461.83 =C2=B1 74%      -0.1%     306.67    =
    interrupts.CPU178.RES:Rescheduling_interrupts
      3098 =C2=B1  3%      +2.2%       3166 =C2=B1  2%      -0.5%       308=
2 =C2=B1  3%  interrupts.CPU178.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU179.138:PCI-MSI.23593036-edge.nvme0q76
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU179.140:PCI-MSI.23593036-edge.nvme0q76
      3806            -3.2%       3683 =C2=B1  4%      -0.6%       3784    =
    interrupts.CPU179.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU179.IWI:IRQ_work_interrupts
    561122 =C2=B1 17%      +7.9%     605539            +7.5%     603042    =
    interrupts.CPU179.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU179.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +8.8%       798=
5        interrupts.CPU179.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +8.8%       798=
5        interrupts.CPU179.PMI:Performance_monitoring_interrupts
    307.50            +0.4%     308.67            -0.2%     306.83        i=
nterrupts.CPU179.RES:Rescheduling_interrupts
      3105 =C2=B1  3%      -2.0%       3043 =C2=B1  2%      -1.0%       307=
2 =C2=B1  3%  interrupts.CPU179.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.165:PCI-MSI.23593075-edge.nvme0q115
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.175:PCI-MSI.23593075-edge.nvme0q115
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.40:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.41:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.41:PCI-MSI.71680-edge.ioat-msix
      3702            -0.3%       3693            -0.1%       3698        i=
nterrupts.CPU18.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU18.IWI:IRQ_work_interrupts
    563980 =C2=B1 16%      +7.4%     605493            +7.1%     603910    =
    interrupts.CPU18.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU18.MCP:Machine_check_polls
      8192            -0.1%       8187            +0.0%       8194        i=
nterrupts.CPU18.NMI:Non-maskable_interrupts
      8192            -0.1%       8187            +0.0%       8194        i=
nterrupts.CPU18.PMI:Performance_monitoring_interrupts
    312.33            +4.1%     325.00 =C2=B1 10%      +0.3%     313.17    =
    interrupts.CPU18.RES:Rescheduling_interrupts
      2845 =C2=B1  3%      -0.3%       2836 =C2=B1  2%      -0.2%       283=
8 =C2=B1  3%  interrupts.CPU18.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU180.121:PCI-MSI.23593037-edge.nvme0q77
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU180.139:PCI-MSI.23593037-edge.nvme0q77
      3891 =C2=B1  4%      -1.3%       3841 =C2=B1  2%      +5.5%       410=
6 =C2=B1 16%  interrupts.CPU180.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU180.IWI:IRQ_work_interrupts
    561265 =C2=B1 17%      +7.9%     605545            +7.4%     603045    =
    interrupts.CPU180.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU180.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +8.8%       798=
4        interrupts.CPU180.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +8.8%       798=
4        interrupts.CPU180.PMI:Performance_monitoring_interrupts
    351.17 =C2=B1 24%      -6.6%     328.00 =C2=B1 13%     -12.6%     307.0=
0        interrupts.CPU180.RES:Rescheduling_interrupts
      3099 =C2=B1  3%      +2.0%       3160 =C2=B1  3%      -0.2%       309=
4 =C2=B1  3%  interrupts.CPU180.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU181.122:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU181.126:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU181.141:PCI-MSI.23593038-edge.nvme0q78
      3799            -1.1%       3757            -0.4%       3784        i=
nterrupts.CPU181.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU181.IWI:IRQ_work_interrupts
    561869 =C2=B1 17%      +7.8%     605557            +7.3%     603063    =
    interrupts.CPU181.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU181.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +8.8%       798=
5        interrupts.CPU181.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +8.8%       798=
5        interrupts.CPU181.PMI:Performance_monitoring_interrupts
    306.67            +0.3%     307.67            +0.1%     306.83        i=
nterrupts.CPU181.RES:Rescheduling_interrupts
      3103 =C2=B1  3%      -2.8%       3017 =C2=B1  2%      -0.8%       307=
7 =C2=B1  3%  interrupts.CPU181.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU182.127:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU182.142:PCI-MSI.23593039-edge.nvme0q79
      3809            +8.7%       4142 =C2=B1 18%      +0.1%       3811    =
    interrupts.CPU182.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU182.IWI:IRQ_work_interrupts
    561867 =C2=B1 17%      +7.8%     605571            +7.3%     603070    =
    interrupts.CPU182.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU182.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.0%       7333 =C2=B1 20%      +8.8%       798=
5        interrupts.CPU182.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.0%       7333 =C2=B1 20%      +8.8%       798=
5        interrupts.CPU182.PMI:Performance_monitoring_interrupts
    306.33           +17.5%     360.00 =C2=B1 31%      +0.1%     306.50    =
    interrupts.CPU182.RES:Rescheduling_interrupts
      3131 =C2=B1  3%      -0.1%       3129 =C2=B1  4%      -0.2%       312=
4 =C2=B1  3%  interrupts.CPU182.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU183.128:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU183.143:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU183.144:PCI-MSI.23593040-edge.nvme0q80
      3838            -1.3%       3788           +29.8%       4983 =C2=B1 5=
3%  interrupts.CPU183.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU183.IWI:IRQ_work_interrupts
    561649 =C2=B1 17%      +7.8%     605527            +7.4%     603040    =
    interrupts.CPU183.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU183.MCP:Machine_check_polls
      7335 =C2=B1 20%      -0.0%       7332 =C2=B1 20%      +8.8%       798=
4        interrupts.CPU183.NMI:Non-maskable_interrupts
      7335 =C2=B1 20%      -0.0%       7332 =C2=B1 20%      +8.8%       798=
4        interrupts.CPU183.PMI:Performance_monitoring_interrupts
    306.83            +0.3%     307.83           +61.8%     496.33 =C2=B1 8=
5%  interrupts.CPU183.RES:Rescheduling_interrupts
      3160 =C2=B1  2%      -3.0%       3065 =C2=B1  2%      -2.5%       308=
2 =C2=B1  2%  interrupts.CPU183.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU184.143:PCI-MSI.23593049-edge.nvme0q89
      3803            +2.5%       3898 =C2=B1  5%      +0.3%       3813    =
    interrupts.CPU184.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU184.IWI:IRQ_work_interrupts
    561256 =C2=B1 17%      +7.9%     605533            +7.4%     603041    =
    interrupts.CPU184.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU184.MCP:Machine_check_polls
      7336 =C2=B1 20%      +9.1%       8000            +8.8%       7985    =
    interrupts.CPU184.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      +9.1%       8000            +8.8%       7985    =
    interrupts.CPU184.PMI:Performance_monitoring_interrupts
    307.33            +9.8%     337.50 =C2=B1 20%      -0.1%     307.00    =
    interrupts.CPU184.RES:Rescheduling_interrupts
      3102 =C2=B1  3%      +2.0%       3163 =C2=B1  3%      +0.5%       311=
8 =C2=B1  3%  interrupts.CPU184.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU185.134:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU185.142:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU185.144:PCI-MSI.23593050-edge.nvme0q90
      4778 =C2=B1 44%     -21.4%       3758           -20.0%       3823    =
    interrupts.CPU185.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU185.IWI:IRQ_work_interrupts
    561400 =C2=B1 17%      +7.9%     605525            +7.4%     603016    =
    interrupts.CPU185.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU185.MCP:Machine_check_polls
      7335 =C2=B1 20%      -0.1%       7331 =C2=B1 20%      +8.9%       798=
4        interrupts.CPU185.NMI:Non-maskable_interrupts
      7335 =C2=B1 20%      -0.1%       7331 =C2=B1 20%      +8.9%       798=
4        interrupts.CPU185.PMI:Performance_monitoring_interrupts
    454.33 =C2=B1 73%     -19.6%     365.17 =C2=B1 30%     -32.2%     308.0=
0        interrupts.CPU185.RES:Rescheduling_interrupts
      3106 =C2=B1  3%      -3.1%       3010 =C2=B1  2%      +0.5%       312=
3 =C2=B1  3%  interrupts.CPU185.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU186.141:PCI-MSI.23593051-edge.nvme0q91
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU186.145:PCI-MSI.23593051-edge.nvme0q91
      3813            +1.4%       3866 =C2=B1  4%      +0.3%       3823 =C2=
=B1  2%  interrupts.CPU186.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU186.IWI:IRQ_work_interrupts
    561455 =C2=B1 17%      +7.8%     605502            +7.4%     603028    =
    interrupts.CPU186.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU186.MCP:Machine_check_polls
      7334 =C2=B1 20%      -0.1%       7331 =C2=B1 20%      +8.9%       798=
5        interrupts.CPU186.NMI:Non-maskable_interrupts
      7334 =C2=B1 20%      -0.1%       7331 =C2=B1 20%      +8.9%       798=
5        interrupts.CPU186.PMI:Performance_monitoring_interrupts
    306.33            +4.5%     320.00 =C2=B1  5%      +0.7%     308.33    =
    interrupts.CPU186.RES:Rescheduling_interrupts
      3100 =C2=B1  3%      +0.8%       3123 =C2=B1  3%      -0.4%       308=
7 =C2=B1  3%  interrupts.CPU186.TLB:TLB_shootdowns
      3811            +0.0%       3811 =C2=B1  5%      -0.0%       3809    =
    interrupts.CPU187.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU187.IWI:IRQ_work_interrupts
    561631 =C2=B1 17%      +7.8%     605537            +7.4%     603039    =
    interrupts.CPU187.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU187.MCP:Machine_check_polls
      7334 =C2=B1 20%      -0.0%       7332 =C2=B1 20%      +8.9%       798=
4        interrupts.CPU187.NMI:Non-maskable_interrupts
      7334 =C2=B1 20%      -0.0%       7332 =C2=B1 20%      +8.9%       798=
4        interrupts.CPU187.PMI:Performance_monitoring_interrupts
    306.17           +11.2%     340.50 =C2=B1 20%      +0.3%     307.00    =
    interrupts.CPU187.RES:Rescheduling_interrupts
      3121 =C2=B1  2%      -2.5%       3042 =C2=B1  2%      -0.6%       310=
3 =C2=B1  2%  interrupts.CPU187.TLB:TLB_shootdowns
      3808            +0.4%       3822 =C2=B1  2%      +0.1%       3813 =C2=
=B1  2%  interrupts.CPU188.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU188.IWI:IRQ_work_interrupts
    561439 =C2=B1 17%      +7.9%     605565            +7.4%     603023    =
    interrupts.CPU188.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU188.MCP:Machine_check_polls
      8002            -8.4%       7332 =C2=B1 20%      -0.2%       7984    =
    interrupts.CPU188.NMI:Non-maskable_interrupts
      8002            -8.4%       7332 =C2=B1 20%      -0.2%       7984    =
    interrupts.CPU188.PMI:Performance_monitoring_interrupts
    306.83            +0.7%     308.83            +0.1%     307.17        i=
nterrupts.CPU188.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      +2.1%       3160 =C2=B1  3%      +0.1%       310=
1 =C2=B1  3%  interrupts.CPU188.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU189.157:PCI-MSI.23593054-edge.nvme0q94
      3831            +3.0%       3945 =C2=B1  8%      -1.0%       3791    =
    interrupts.CPU189.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU189.IWI:IRQ_work_interrupts
    561551 =C2=B1 17%      +7.8%     605555            +7.4%     603048    =
    interrupts.CPU189.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU189.MCP:Machine_check_polls
      8002            -0.0%       8000            -0.2%       7984        i=
nterrupts.CPU189.NMI:Non-maskable_interrupts
      8002            -0.0%       8000            -0.2%       7984        i=
nterrupts.CPU189.PMI:Performance_monitoring_interrupts
    308.83           +18.3%     365.50 =C2=B1 22%      -0.4%     307.50    =
    interrupts.CPU189.RES:Rescheduling_interrupts
      3140 =C2=B1  3%      -1.3%       3100 =C2=B1  2%      -1.7%       308=
6 =C2=B1  3%  interrupts.CPU189.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.160:PCI-MSI.23593076-edge.nvme0q116
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.42:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.42:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.43:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.44:PCI-MSI.71680-edge.ioat-msix
      3762            -0.5%       3741            -0.6%       3740 =C2=B1  =
2%  interrupts.CPU19.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU19.IWI:IRQ_work_interrupts
    564098 =C2=B1 16%      +7.3%     605492            +7.1%     603875    =
    interrupts.CPU19.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU19.MCP:Machine_check_polls
      8193            -0.1%       8188            +0.0%       8194        i=
nterrupts.CPU19.NMI:Non-maskable_interrupts
      8193            -0.1%       8188            +0.0%       8194        i=
nterrupts.CPU19.PMI:Performance_monitoring_interrupts
    312.83            -0.6%     310.83            +0.1%     313.00        i=
nterrupts.CPU19.RES:Rescheduling_interrupts
      3016 =C2=B1  3%      -1.4%       2974 =C2=B1  4%      -1.5%       296=
9 =C2=B1  5%  interrupts.CPU19.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU190.139:PCI-MSI.23593055-edge.nvme0q95
      3806            +0.8%       3836            +5.5%       4017 =C2=B1 1=
1%  interrupts.CPU190.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU190.IWI:IRQ_work_interrupts
    561315 =C2=B1 17%      +7.9%     605525            +7.4%     603046    =
    interrupts.CPU190.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU190.MCP:Machine_check_polls
      8001           -16.7%       6666 =C2=B1 28%      -0.2%       7984    =
    interrupts.CPU190.NMI:Non-maskable_interrupts
      8001           -16.7%       6666 =C2=B1 28%      -0.2%       7984    =
    interrupts.CPU190.PMI:Performance_monitoring_interrupts
    307.00            +0.4%     308.17           +26.8%     389.17 =C2=B1 4=
6%  interrupts.CPU190.RES:Rescheduling_interrupts
      3103 =C2=B1  3%      +1.9%       3162 =C2=B1  3%      -0.1%       310=
1 =C2=B1  3%  interrupts.CPU190.TLB:TLB_shootdowns
      3805 =C2=B1  5%     +10.1%       4187 =C2=B1 22%      +2.6%       390=
4        interrupts.CPU191.CAL:Function_call_interrupts
      3.17 =C2=B1 11%     -15.8%       2.67 =C2=B1 35%     +10.5%       3.5=
0 =C2=B1 21%  interrupts.CPU191.IWI:IRQ_work_interrupts
    561118 =C2=B1 17%      +7.9%     605637            +7.5%     603073    =
    interrupts.CPU191.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU191.MCP:Machine_check_polls
      8015           -16.8%       6671 =C2=B1 28%      -0.2%       7997    =
    interrupts.CPU191.NMI:Non-maskable_interrupts
      8015           -16.8%       6671 =C2=B1 28%      -0.2%       7997    =
    interrupts.CPU191.PMI:Performance_monitoring_interrupts
    339.50           +17.1%     397.67 =C2=B1 26%      +2.1%     346.50    =
    interrupts.CPU191.RES:Rescheduling_interrupts
      3094 =C2=B1  3%      -2.9%       3004 =C2=B1  3%      +1.3%       313=
5        interrupts.CPU191.TLB:TLB_shootdowns
      4355 =C2=B1  7%     -12.5%       3810            +2.7%       4471 =C2=
=B1 15%  interrupts.CPU2.CAL:Function_call_interrupts
      2.00            +0.0%       2.00 =C2=B1 28%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU2.IWI:IRQ_work_interrupts
    564424 =C2=B1 16%      +7.3%     605568            +7.0%     603915    =
    interrupts.CPU2.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU2.MCP:Machine_check_polls
      8193            -8.4%       7504 =C2=B1 20%      -8.3%       7512 =C2=
=B1 20%  interrupts.CPU2.NMI:Non-maskable_interrupts
      8193            -8.4%       7504 =C2=B1 20%      -8.3%       7512 =C2=
=B1 20%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
    459.33 =C2=B1 15%     -11.4%     406.83 =C2=B1 20%      +9.9%     504.8=
3 =C2=B1 15%  interrupts.CPU2.RES:Rescheduling_interrupts
      2891 =C2=B1  4%      -2.0%       2832 =C2=B1  3%      -1.7%       284=
1 =C2=B1  3%  interrupts.CPU2.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.167:PCI-MSI.23593077-edge.nvme0q117
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.43:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.43:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.44:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.45:PCI-MSI.73728-edge.ioat-msix
      3669            +0.5%       3688            +6.5%       3909 =C2=B1 1=
2%  interrupts.CPU20.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU20.IWI:IRQ_work_interrupts
    563975 =C2=B1 16%      +7.4%     605492            +7.1%     603862    =
    interrupts.CPU20.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU20.MCP:Machine_check_polls
      7511 =C2=B1 20%      +9.0%       8188            +9.1%       8193    =
    interrupts.CPU20.NMI:Non-maskable_interrupts
      7511 =C2=B1 20%      +9.0%       8188            +9.1%       8193    =
    interrupts.CPU20.PMI:Performance_monitoring_interrupts
    310.83            +1.1%     314.17 =C2=B1  3%      +9.8%     341.33 =C2=
=B1 19%  interrupts.CPU20.RES:Rescheduling_interrupts
      2852 =C2=B1  3%      -0.6%       2834 =C2=B1  2%      -0.3%       284=
3 =C2=B1  3%  interrupts.CPU20.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.170:PCI-MSI.23593078-edge.nvme0q118
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.173:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.43:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.44:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.46:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.46:PCI-MSI.77824-edge.ioat-msix
      3746            +0.6%       3767           +43.0%       5357 =C2=B1 7=
0%  interrupts.CPU21.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU21.IWI:IRQ_work_interrupts
    563817 =C2=B1 16%      +7.4%     605491            +7.1%     603818    =
    interrupts.CPU21.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU21.MCP:Machine_check_polls
      7511 =C2=B1 20%      +9.0%       8189            -0.0%       7510 =C2=
=B1 20%  interrupts.CPU21.NMI:Non-maskable_interrupts
      7511 =C2=B1 20%      +9.0%       8189            -0.0%       7510 =C2=
=B1 20%  interrupts.CPU21.PMI:Performance_monitoring_interrupts
    310.50            -0.2%     309.83           +86.7%     579.67 =C2=B110=
3%  interrupts.CPU21.RES:Rescheduling_interrupts
      3014 =C2=B1  3%      +1.6%       3063            -1.4%       2971 =C2=
=B1  5%  interrupts.CPU21.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.168:PCI-MSI.23593079-edge.nvme0q119
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.169:PCI-MSI.23593079-edge.nvme0q119
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.174:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.174:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.45:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.45:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.47:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.47:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU22.50:PCI-MSI.23592960-edge.nvme0q0
      3701            -0.4%       3685            +0.8%       3731        i=
nterrupts.CPU22.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU22.IWI:IRQ_work_interrupts
    563733 =C2=B1 16%      +7.4%     605522            +7.1%     603906    =
    interrupts.CPU22.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU22.MCP:Machine_check_polls
      7511 =C2=B1 20%      +9.0%       8189            +0.0%       7512 =C2=
=B1 20%  interrupts.CPU22.NMI:Non-maskable_interrupts
      7511 =C2=B1 20%      +9.0%       8189            +0.0%       7512 =C2=
=B1 20%  interrupts.CPU22.PMI:Performance_monitoring_interrupts
    311.00            -0.3%     310.00            +1.6%     315.83 =C2=B1  =
2%  interrupts.CPU22.RES:Rescheduling_interrupts
      2856 =C2=B1  3%      -0.1%       2854 =C2=B1  3%      +1.2%       289=
0 =C2=B1  3%  interrupts.CPU22.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.175:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.45:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.46:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.48:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.49:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.56:PCI-MSI.23592960-edge.nvme0q0
      3739            +0.1%       3742 =C2=B1  2%      +0.3%       3750 =C2=
=B1  2%  interrupts.CPU23.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU23.IWI:IRQ_work_interrupts
    563735 =C2=B1 16%      +7.4%     605498            +7.1%     603871    =
    interrupts.CPU23.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU23.MCP:Machine_check_polls
      7512 =C2=B1 20%      +9.0%       8189            -0.0%       7511 =C2=
=B1 20%  interrupts.CPU23.NMI:Non-maskable_interrupts
      7512 =C2=B1 20%      +9.0%       8189            -0.0%       7511 =C2=
=B1 20%  interrupts.CPU23.PMI:Performance_monitoring_interrupts
    310.00            -0.2%     309.33            +0.2%     310.67        i=
nterrupts.CPU23.RES:Rescheduling_interrupts
      2979 =C2=B1  3%      +1.4%       3022 =C2=B1  4%      +0.2%       298=
4 =C2=B1  5%  interrupts.CPU23.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.178:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.179:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.45:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.46:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.47:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.48:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.50:PCI-MSI.33619968-edge.ioat-msix
      3837 =C2=B1  8%      +8.8%       4176 =C2=B1 13%      -0.8%       380=
8 =C2=B1  2%  interrupts.CPU24.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +10.0%       1.83 =C2=
=B1 20%  interrupts.CPU24.IWI:IRQ_work_interrupts
    564526 =C2=B1 16%      +7.3%     605473            +6.9%     603701    =
    interrupts.CPU24.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU24.MCP:Machine_check_polls
      6804 =C2=B1 28%     +20.0%       8167           +10.1%       7495 =C2=
=B1 20%  interrupts.CPU24.NMI:Non-maskable_interrupts
      6804 =C2=B1 28%     +20.0%       8167           +10.1%       7495 =C2=
=B1 20%  interrupts.CPU24.PMI:Performance_monitoring_interrupts
    367.67 =C2=B1 15%      -4.7%     350.50 =C2=B1 14%      -6.5%     343.8=
3 =C2=B1 13%  interrupts.CPU24.RES:Rescheduling_interrupts
      2770 =C2=B1  3%      +6.3%       2945 =C2=B1  7%      +2.9%       285=
1 =C2=B1  4%  interrupts.CPU24.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.179:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.180:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.181:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.47:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.49:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.50:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.52:PCI-MSI.33622016-edge.ioat-msix
      5639 =C2=B1 24%     -10.5%       5049 =C2=B1 24%     -18.8%       457=
9 =C2=B1 22%  interrupts.CPU25.CAL:Function_call_interrupts
      1.83 =C2=B1 20%     +27.3%       2.33 =C2=B1 20%      -9.1%       1.6=
7 =C2=B1 28%  interrupts.CPU25.IWI:IRQ_work_interrupts
    565618 =C2=B1 15%      +7.1%     605555            +6.7%     603738    =
    interrupts.CPU25.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU25.MCP:Machine_check_polls
      7486 =C2=B1 20%      +9.1%       8169            -9.0%       6814 =C2=
=B1 28%  interrupts.CPU25.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +9.1%       8169            -9.0%       6814 =C2=
=B1 28%  interrupts.CPU25.PMI:Performance_monitoring_interrupts
    495.83 =C2=B1 18%     -29.5%     349.50 =C2=B1  6%      -8.5%     453.8=
3 =C2=B1 34%  interrupts.CPU25.RES:Rescheduling_interrupts
      2983 =C2=B1  3%      +1.3%       3022 =C2=B1  3%      -1.4%       294=
3 =C2=B1  4%  interrupts.CPU25.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.180:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.181:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.182:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.50:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.51:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.53:PCI-MSI.33624064-edge.ioat-msix
      4631 =C2=B1 21%     +16.1%       5375 =C2=B1 19%      -6.1%       435=
0 =C2=B1 16%  interrupts.CPU26.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            -9.1%       1.67 =C2=
=B1 28%  interrupts.CPU26.IWI:IRQ_work_interrupts
    566110 =C2=B1 15%      +7.0%     605580            +6.6%     603718    =
    interrupts.CPU26.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU26.MCP:Machine_check_polls
      7487 =C2=B1 20%      +9.1%       8169            -9.0%       6815 =C2=
=B1 28%  interrupts.CPU26.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +9.1%       8169            -9.0%       6815 =C2=
=B1 28%  interrupts.CPU26.PMI:Performance_monitoring_interrupts
    378.33 =C2=B1 24%     +24.7%     471.67 =C2=B1 25%      -8.6%     345.8=
3 =C2=B1 19%  interrupts.CPU26.RES:Rescheduling_interrupts
      2910 =C2=B1  4%      -0.1%       2908 =C2=B1  3%      +1.2%       294=
3 =C2=B1  4%  interrupts.CPU26.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.118:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.181:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.182:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.183:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.51:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.52:PCI-MSI.33626112-edge.ioat-msix
      4062 =C2=B1 17%     +22.8%       4990 =C2=B1 50%      -4.1%       389=
6 =C2=B1  7%  interrupts.CPU27.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00            +0.0%       1.67 =C2=
=B1 28%  interrupts.CPU27.IWI:IRQ_work_interrupts
    565827 =C2=B1 15%      +7.0%     605396            +6.7%     603722    =
    interrupts.CPU27.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU27.MCP:Machine_check_polls
      6808 =C2=B1 28%     +20.0%       8169            +0.1%       6814 =C2=
=B1 28%  interrupts.CPU27.NMI:Non-maskable_interrupts
      6808 =C2=B1 28%     +20.0%       8169            +0.1%       6814 =C2=
=B1 28%  interrupts.CPU27.PMI:Performance_monitoring_interrupts
    360.33 =C2=B1 32%     +44.5%     520.67 =C2=B1 57%      -4.9%     342.5=
0 =C2=B1 21%  interrupts.CPU27.RES:Rescheduling_interrupts
      2984 =C2=B1  3%      -0.2%       2977 =C2=B1  4%      -1.3%       294=
6 =C2=B1  4%  interrupts.CPU27.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.182:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.183:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.184:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.52:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.53:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU28.54:PCI-MSI.33628160-edge.ioat-msix
      3724 =C2=B1  2%      +3.7%       3862 =C2=B1  8%      +0.3%       373=
7        interrupts.CPU28.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           -10.0%       1.50 =C2=
=B1 33%  interrupts.CPU28.IWI:IRQ_work_interrupts
    565401 =C2=B1 15%      +7.1%     605510            +6.8%     603717    =
    interrupts.CPU28.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU28.MCP:Machine_check_polls
      6808 =C2=B1 28%     +20.0%       8170            -9.9%       6132 =C2=
=B1 33%  interrupts.CPU28.NMI:Non-maskable_interrupts
      6808 =C2=B1 28%     +20.0%       8170            -9.9%       6132 =C2=
=B1 33%  interrupts.CPU28.PMI:Performance_monitoring_interrupts
    308.50            +9.6%     338.17 =C2=B1 19%      +0.7%     310.67    =
    interrupts.CPU28.RES:Rescheduling_interrupts
      2911 =C2=B1  4%      -1.2%       2875 =C2=B1  3%      +1.3%       294=
9 =C2=B1  3%  interrupts.CPU28.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.183:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.184:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.185:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.53:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.54:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.56:PCI-MSI.33630208-edge.ioat-msix
      3992 =C2=B1 13%      -6.8%       3721            -6.2%       3743    =
    interrupts.CPU29.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00           -18.2%       1.50 =C2=
=B1 33%  interrupts.CPU29.IWI:IRQ_work_interrupts
    565630 =C2=B1 15%      +7.0%     605501            +6.7%     603701    =
    interrupts.CPU29.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU29.MCP:Machine_check_polls
      7492 =C2=B1 20%      +9.0%       8169           -18.1%       6132 =C2=
=B1 33%  interrupts.CPU29.NMI:Non-maskable_interrupts
      7492 =C2=B1 20%      +9.0%       8169           -18.1%       6132 =C2=
=B1 33%  interrupts.CPU29.PMI:Performance_monitoring_interrupts
    395.00 =C2=B1 48%     -21.9%     308.33           -21.1%     311.50 =C2=
=B1  2%  interrupts.CPU29.RES:Rescheduling_interrupts
      3002 =C2=B1  3%      -0.1%       2998 =C2=B1  4%      -1.7%       295=
0 =C2=B1  4%  interrupts.CPU29.TLB:TLB_shootdowns
      4164 =C2=B1 16%      -2.8%       4047 =C2=B1 19%     -10.1%       374=
5        interrupts.CPU3.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00 =C2=B1 28%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU3.IWI:IRQ_work_interrupts
    563688 =C2=B1 16%      +7.4%     605511            +7.1%     603867    =
    interrupts.CPU3.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU3.MCP:Machine_check_polls
      7509 =C2=B1 20%      -0.1%       7505 =C2=B1 20%      +0.0%       751=
2 =C2=B1 20%  interrupts.CPU3.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      -0.1%       7505 =C2=B1 20%      +0.0%       751=
2 =C2=B1 20%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
    389.00 =C2=B1 26%      -2.1%     380.67 =C2=B1 34%     -15.5%     328.8=
3 =C2=B1  2%  interrupts.CPU3.RES:Rescheduling_interrupts
      2920 =C2=B1  4%      -1.4%       2878 =C2=B1  4%      +0.1%       292=
4 =C2=B1  5%  interrupts.CPU3.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.185:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.186:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.54:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.55:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.57:PCI-MSI.33632256-edge.ioat-msix
      3714 =C2=B1  2%      +0.7%       3740 =C2=B1  2%      +1.4%       376=
4        interrupts.CPU30.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            -9.1%       1.67 =C2=
=B1 28%  interrupts.CPU30.IWI:IRQ_work_interrupts
    565440 =C2=B1 15%      +7.1%     605499            +6.8%     603710    =
    interrupts.CPU30.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU30.MCP:Machine_check_polls
      7491 =C2=B1 20%      +9.1%       8170            -9.0%       6814 =C2=
=B1 28%  interrupts.CPU30.NMI:Non-maskable_interrupts
      7491 =C2=B1 20%      +9.1%       8170            -9.0%       6814 =C2=
=B1 28%  interrupts.CPU30.PMI:Performance_monitoring_interrupts
    310.17            -0.8%     307.83            -0.3%     309.33        i=
nterrupts.CPU30.RES:Rescheduling_interrupts
      2923 =C2=B1  4%      -1.6%       2877 =C2=B1  3%      +2.6%       299=
9 =C2=B1  4%  interrupts.CPU30.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.186:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.187:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.56:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.57:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU31.58:PCI-MSI.33634304-edge.ioat-msix
      3786 =C2=B1  2%      +0.5%       3805            -1.3%       3739    =
    interrupts.CPU31.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU31.IWI:IRQ_work_interrupts
    565927 =C2=B1 15%      +7.0%     605431            +6.7%     603738    =
    interrupts.CPU31.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU31.MCP:Machine_check_polls
      7492 =C2=B1 20%      -0.1%       7487 =C2=B1 20%      +0.0%       749=
5 =C2=B1 20%  interrupts.CPU31.NMI:Non-maskable_interrupts
      7492 =C2=B1 20%      -0.1%       7487 =C2=B1 20%      +0.0%       749=
5 =C2=B1 20%  interrupts.CPU31.PMI:Performance_monitoring_interrupts
    313.67 =C2=B1  3%      -0.6%     311.67            -1.3%     309.50    =
    interrupts.CPU31.RES:Rescheduling_interrupts
      3002 =C2=B1  3%      +1.4%       3045            -1.5%       2956 =C2=
=B1  4%  interrupts.CPU31.TLB:TLB_shootdowns
      3735 =C2=B1  3%      -0.6%       3715            +9.2%       4079 =C2=
=B1 13%  interrupts.CPU32.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU32.IWI:IRQ_work_interrupts
    565930 =C2=B1 15%      +7.0%     605511            +6.7%     603717    =
    interrupts.CPU32.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU32.MCP:Machine_check_polls
      7491 =C2=B1 20%      -0.0%       7488 =C2=B1 20%      +0.1%       749=
5 =C2=B1 20%  interrupts.CPU32.NMI:Non-maskable_interrupts
      7491 =C2=B1 20%      -0.0%       7488 =C2=B1 20%      +0.1%       749=
5 =C2=B1 20%  interrupts.CPU32.PMI:Performance_monitoring_interrupts
    308.83            +0.0%     308.83           +89.6%     585.50 =C2=B1 6=
0%  interrupts.CPU32.RES:Rescheduling_interrupts
      2960 =C2=B1  5%      -2.6%       2884 =C2=B1  3%      +1.4%       300=
1 =C2=B1  4%  interrupts.CPU32.TLB:TLB_shootdowns
      3763            -0.1%       3758            +2.1%       3843 =C2=B1 1=
2%  interrupts.CPU33.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU33.IWI:IRQ_work_interrupts
    566093 =C2=B1 15%      +7.0%     605502            +6.6%     603723    =
    interrupts.CPU33.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU33.MCP:Machine_check_polls
      8169            -8.3%       7487 =C2=B1 20%      -8.2%       7495 =C2=
=B1 20%  interrupts.CPU33.NMI:Non-maskable_interrupts
      8169            -8.3%       7487 =C2=B1 20%      -8.2%       7495 =C2=
=B1 20%  interrupts.CPU33.PMI:Performance_monitoring_interrupts
    312.50 =C2=B1  3%      -1.2%     308.83           +21.4%     379.33 =C2=
=B1 36%  interrupts.CPU33.RES:Rescheduling_interrupts
      3000 =C2=B1  3%      +0.2%       3008 =C2=B1  4%      -1.3%       296=
1 =C2=B1  4%  interrupts.CPU33.TLB:TLB_shootdowns
      3711 =C2=B1  2%      -0.0%       3710            +1.0%       3748    =
    interrupts.CPU34.CAL:Function_call_interrupts
      1.67 =C2=B1 28%      +0.0%       1.67 =C2=B1 28%      +0.0%       1.6=
7 =C2=B1 28%  interrupts.CPU34.IWI:IRQ_work_interrupts
    565606 =C2=B1 15%      +7.1%     605485            +6.7%     603698    =
    interrupts.CPU34.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU34.MCP:Machine_check_polls
      6809 =C2=B1 28%      -0.1%       6804 =C2=B1 28%      +0.1%       681=
4 =C2=B1 28%  interrupts.CPU34.NMI:Non-maskable_interrupts
      6809 =C2=B1 28%      -0.1%       6804 =C2=B1 28%      +0.1%       681=
4 =C2=B1 28%  interrupts.CPU34.PMI:Performance_monitoring_interrupts
    308.17            +1.7%     313.33 =C2=B1  2%      +0.2%     308.67    =
    interrupts.CPU34.RES:Rescheduling_interrupts
      2932 =C2=B1  4%      -2.9%       2847            +1.1%       2963 =C2=
=B1  3%  interrupts.CPU34.TLB:TLB_shootdowns
      3748            +1.0%       3788            +6.7%       4001 =C2=B1  =
8%  interrupts.CPU35.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU35.IWI:IRQ_work_interrupts
    565179 =C2=B1 15%      +7.1%     605488            +6.8%     603706    =
    interrupts.CPU35.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU35.MCP:Machine_check_polls
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      +0.1%       749=
4 =C2=B1 20%  interrupts.CPU35.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      +0.1%       749=
4 =C2=B1 20%  interrupts.CPU35.PMI:Performance_monitoring_interrupts
    308.17            +0.6%     310.00           +31.9%     406.33 =C2=B1 3=
9%  interrupts.CPU35.RES:Rescheduling_interrupts
      3007 =C2=B1  3%      +1.5%       3053 =C2=B1  3%      -1.3%       296=
8 =C2=B1  4%  interrupts.CPU35.TLB:TLB_shootdowns
      3831 =C2=B1  4%      -3.3%       3705            -1.9%       3757    =
    interrupts.CPU36.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%     -18.2%       1.5=
0 =C2=B1 33%  interrupts.CPU36.IWI:IRQ_work_interrupts
    565420 =C2=B1 15%      +7.1%     605501            +6.8%     603700    =
    interrupts.CPU36.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU36.MCP:Machine_check_polls
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%     -18.1%       613=
3 =C2=B1 33%  interrupts.CPU36.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%     -18.1%       613=
3 =C2=B1 33%  interrupts.CPU36.PMI:Performance_monitoring_interrupts
    332.50 =C2=B1 17%      -7.7%     307.00            -7.0%     309.33    =
    interrupts.CPU36.RES:Rescheduling_interrupts
      2938 =C2=B1  4%      -1.5%       2894 =C2=B1  3%      +1.0%       296=
8 =C2=B1  3%  interrupts.CPU36.TLB:TLB_shootdowns
      3778 =C2=B1  2%      +1.4%       3832 =C2=B1  4%      -1.8%       371=
1 =C2=B1  2%  interrupts.CPU37.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      -9.1%       1.6=
7 =C2=B1 28%  interrupts.CPU37.IWI:IRQ_work_interrupts
    566017 =C2=B1 15%      +7.0%     605499            +6.7%     603720    =
    interrupts.CPU37.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU37.MCP:Machine_check_polls
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      -9.0%       681=
4 =C2=B1 28%  interrupts.CPU37.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      -9.0%       681=
4 =C2=B1 28%  interrupts.CPU37.PMI:Performance_monitoring_interrupts
    309.67            +6.7%     330.33 =C2=B1 15%     +16.1%     359.67 =C2=
=B1 31%  interrupts.CPU37.RES:Rescheduling_interrupts
      3012 =C2=B1  3%      +1.4%       3053 =C2=B1  3%      -1.4%       297=
0 =C2=B1  4%  interrupts.CPU37.TLB:TLB_shootdowns
      3726            -0.9%       3692            -0.0%       3725 =C2=B1  =
2%  interrupts.CPU38.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU38.IWI:IRQ_work_interrupts
    566056 =C2=B1 15%      +7.0%     605521            +6.7%     603720    =
    interrupts.CPU38.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU38.MCP:Machine_check_polls
      8170            -8.4%       7487 =C2=B1 20%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU38.NMI:Non-maskable_interrupts
      8170            -8.4%       7487 =C2=B1 20%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU38.PMI:Performance_monitoring_interrupts
    310.67 =C2=B1  2%      -0.8%     308.17            -0.4%     309.33    =
    interrupts.CPU38.RES:Rescheduling_interrupts
      2942 =C2=B1  4%      -3.1%       2852            +1.0%       2973 =C2=
=B1  3%  interrupts.CPU38.TLB:TLB_shootdowns
      4027 =C2=B1 13%      -6.3%       3771            -7.6%       3719 =C2=
=B1  2%  interrupts.CPU39.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU39.IWI:IRQ_work_interrupts
    565984 =C2=B1 15%      +7.0%     605505            +6.7%     603771    =
    interrupts.CPU39.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU39.MCP:Machine_check_polls
      8170            -8.4%       7486 =C2=B1 20%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU39.NMI:Non-maskable_interrupts
      8170            -8.4%       7486 =C2=B1 20%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU39.PMI:Performance_monitoring_interrupts
    414.00 =C2=B1 35%     -25.4%     308.67           -25.4%     309.00    =
    interrupts.CPU39.RES:Rescheduling_interrupts
      3023 =C2=B1  3%      +0.8%       3048 =C2=B1  3%      -1.5%       297=
8 =C2=B1  4%  interrupts.CPU39.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.27:PCI-MSI.17825792-edge.PCIe.PME,pciehp
      3672 =C2=B1  2%      +0.5%       3689            +0.1%       3677    =
    interrupts.CPU4.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU4.IWI:IRQ_work_interrupts
    563563 =C2=B1 16%      +7.4%     605502            +7.2%     603925    =
    interrupts.CPU4.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU4.MCP:Machine_check_polls
      7509 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +0.0%       751=
2 =C2=B1 20%  interrupts.CPU4.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +0.0%       751=
2 =C2=B1 20%  interrupts.CPU4.PMI:Performance_monitoring_interrupts
    313.83            +0.0%     313.83            +0.9%     316.67        i=
nterrupts.CPU4.RES:Rescheduling_interrupts
      2828 =C2=B1  4%      -0.9%       2801 =C2=B1  3%      +0.4%       283=
9 =C2=B1  4%  interrupts.CPU4.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU40.67:PCI-MSI.23592977-edge.nvme0q17
      3775            -1.6%       3715            -0.1%       3771 =C2=B1  =
2%  interrupts.CPU40.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU40.IWI:IRQ_work_interrupts
    564604 =C2=B1 16%      +7.2%     605499            +6.9%     603746    =
    interrupts.CPU40.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU40.MCP:Machine_check_polls
      8170            -8.4%       7486 =C2=B1 20%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU40.NMI:Non-maskable_interrupts
      8170            -8.4%       7486 =C2=B1 20%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU40.PMI:Performance_monitoring_interrupts
    466.50 =C2=B1 75%     -34.1%     307.33           -30.0%     326.67 =C2=
=B1  8%  interrupts.CPU40.RES:Rescheduling_interrupts
      2987 =C2=B1  4%      -3.0%       2898 =C2=B1  2%      -1.6%       293=
9 =C2=B1  4%  interrupts.CPU40.TLB:TLB_shootdowns
      3772            +0.8%       3801            -0.5%       3754        i=
nterrupts.CPU41.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU41.IWI:IRQ_work_interrupts
    565516 =C2=B1 15%      +7.1%     605495            +6.8%     603695    =
    interrupts.CPU41.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU41.MCP:Machine_check_polls
      8170            -8.4%       7486 =C2=B1 20%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU41.NMI:Non-maskable_interrupts
      8170            -8.4%       7486 =C2=B1 20%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU41.PMI:Performance_monitoring_interrupts
    309.33            +0.3%     310.33            -0.4%     308.17        i=
nterrupts.CPU41.RES:Rescheduling_interrupts
      3021 =C2=B1  3%      +1.3%       3059 =C2=B1  3%      -1.3%       298=
2 =C2=B1  4%  interrupts.CPU41.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU42.92:PCI-MSI.23592979-edge.nvme0q19
      3655 =C2=B1  4%      +3.9%       3796 =C2=B1  4%      +9.3%       399=
3 =C2=B1 12%  interrupts.CPU42.CAL:Function_call_interrupts
      2.00           -25.0%       1.50 =C2=B1 33%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU42.IWI:IRQ_work_interrupts
    565572 =C2=B1 15%      +7.1%     605500            +6.7%     603699    =
    interrupts.CPU42.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU42.MCP:Machine_check_polls
      8170           -25.1%       6122 =C2=B1 33%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU42.NMI:Non-maskable_interrupts
      8170           -25.1%       6122 =C2=B1 33%      -8.2%       7498 =C2=
=B1 20%  interrupts.CPU42.PMI:Performance_monitoring_interrupts
    310.00            +7.1%     332.00 =C2=B1 16%     +29.5%     401.33 =C2=
=B1 43%  interrupts.CPU42.RES:Rescheduling_interrupts
      2957 =C2=B1  4%      -0.4%       2946 =C2=B1  3%      -0.6%       293=
9 =C2=B1  3%  interrupts.CPU42.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU43.67:PCI-MSI.23592980-edge.nvme0q20
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU43.80:PCI-MSI.23592980-edge.nvme0q20
      3939 =C2=B1  9%      -3.9%       3784            -3.8%       3788 =C2=
=B1  2%  interrupts.CPU43.CAL:Function_call_interrupts
      2.00           -25.0%       1.50 =C2=B1 33%      +0.0%       2.00    =
    interrupts.CPU43.IWI:IRQ_work_interrupts
    565500 =C2=B1 15%      +7.1%     605500            +6.8%     603689    =
    interrupts.CPU43.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU43.MCP:Machine_check_polls
      8170           -25.0%       6127 =C2=B1 33%      +0.1%       8179    =
    interrupts.CPU43.NMI:Non-maskable_interrupts
      8170           -25.0%       6127 =C2=B1 33%      +0.1%       8179    =
    interrupts.CPU43.PMI:Performance_monitoring_interrupts
    340.83 =C2=B1 21%      -9.4%     308.67            -6.0%     320.33 =C2=
=B1  8%  interrupts.CPU43.RES:Rescheduling_interrupts
      3023 =C2=B1  3%      +1.3%       3063 =C2=B1  3%      -1.4%       298=
2 =C2=B1  4%  interrupts.CPU43.TLB:TLB_shootdowns
      3733            -0.4%       3720            +0.4%       3747        i=
nterrupts.CPU44.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU44.IWI:IRQ_work_interrupts
    565898 =C2=B1 15%      +7.0%     605559            +6.7%     603710    =
    interrupts.CPU44.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU44.MCP:Machine_check_polls
      8169           -16.6%       6810 =C2=B1 28%      +0.1%       8178    =
    interrupts.CPU44.NMI:Non-maskable_interrupts
      8169           -16.6%       6810 =C2=B1 28%      +0.1%       8178    =
    interrupts.CPU44.PMI:Performance_monitoring_interrupts
    459.33 =C2=B1 73%     -33.1%     307.17           -31.1%     316.50 =C2=
=B1  5%  interrupts.CPU44.RES:Rescheduling_interrupts
      2918 =C2=B1  3%      -0.3%       2909 =C2=B1  2%      +2.5%       299=
1 =C2=B1  3%  interrupts.CPU44.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU45.79:PCI-MSI.23592982-edge.nvme0q22
      4095 =C2=B1 17%      -8.0%       3768            -9.0%       3726 =C2=
=B1  3%  interrupts.CPU45.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU45.IWI:IRQ_work_interrupts
    565459 =C2=B1 15%      +7.1%     605499            +6.8%     603708    =
    interrupts.CPU45.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU45.MCP:Machine_check_polls
      8169           -16.6%       6810 =C2=B1 28%      -8.2%       7497 =C2=
=B1 20%  interrupts.CPU45.NMI:Non-maskable_interrupts
      8169           -16.6%       6810 =C2=B1 28%      -8.2%       7497 =C2=
=B1 20%  interrupts.CPU45.PMI:Performance_monitoring_interrupts
    524.00 =C2=B1 64%     -41.1%     308.67           -40.9%     309.83    =
    interrupts.CPU45.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      +1.3%       3069 =C2=B1  3%      -1.1%       299=
6 =C2=B1  4%  interrupts.CPU45.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU46.70:PCI-MSI.23592983-edge.nvme0q23
      3743 =C2=B1  2%      -0.7%       3715            -0.5%       3723 =C2=
=B1  2%  interrupts.CPU46.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU46.IWI:IRQ_work_interrupts
    565770 =C2=B1 15%      +7.0%     605518            +6.7%     603707    =
    interrupts.CPU46.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU46.MCP:Machine_check_polls
      8169           -16.6%       6809 =C2=B1 28%      +0.1%       8179    =
    interrupts.CPU46.NMI:Non-maskable_interrupts
      8169           -16.6%       6809 =C2=B1 28%      +0.1%       8179    =
    interrupts.CPU46.PMI:Performance_monitoring_interrupts
    308.83            +0.0%     308.83            +5.9%     327.17 =C2=B1 1=
2%  interrupts.CPU46.RES:Rescheduling_interrupts
      2967 =C2=B1  4%      -1.7%       2915 =C2=B1  2%      +0.9%       299=
3 =C2=B1  3%  interrupts.CPU46.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU47.68:PCI-MSI.23592984-edge.nvme0q24
      3804            -0.3%       3792            -1.5%       3748        i=
nterrupts.CPU47.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +9.1%       2.0=
0        interrupts.CPU47.IWI:IRQ_work_interrupts
    565451 =C2=B1 15%      +7.1%     605509            +6.8%     603713    =
    interrupts.CPU47.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU47.MCP:Machine_check_polls
      7491 =C2=B1 20%      -9.1%       6809 =C2=B1 28%      +9.2%       817=
8        interrupts.CPU47.NMI:Non-maskable_interrupts
      7491 =C2=B1 20%      -9.1%       6809 =C2=B1 28%      +9.2%       817=
8        interrupts.CPU47.PMI:Performance_monitoring_interrupts
    326.17 =C2=B1  8%      -1.1%     322.50 =C2=B1 10%      -5.5%     308.3=
3        interrupts.CPU47.RES:Rescheduling_interrupts
      3084 =C2=B1  2%      -1.9%       3027 =C2=B1  4%      -2.7%       300=
2 =C2=B1  4%  interrupts.CPU47.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.188:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.189:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.57:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.58:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.59:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU48.60:PCI-MSI.67174400-edge.ioat-msix
      4024 =C2=B1  9%      +0.5%       4043 =C2=B1  8%      -3.1%       390=
1        interrupts.CPU48.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      -5.9%       2.67 =C2=B1 17%      +5.9%       3.0=
0        interrupts.CPU48.IWI:IRQ_work_interrupts
    565900 =C2=B1 15%      +7.0%     605598            +6.6%     603373    =
    interrupts.CPU48.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU48.MCP:Machine_check_polls
      7821 =C2=B1 20%      -9.1%       7112 =C2=B1 28%      +9.1%       853=
5        interrupts.CPU48.NMI:Non-maskable_interrupts
      7821 =C2=B1 20%      -9.1%       7112 =C2=B1 28%      +9.1%       853=
5        interrupts.CPU48.PMI:Performance_monitoring_interrupts
    370.17 =C2=B1 23%      -3.4%     357.50 =C2=B1 15%     -14.1%     317.8=
3 =C2=B1  3%  interrupts.CPU48.RES:Rescheduling_interrupts
      2969 =C2=B1  2%      -0.3%       2960 =C2=B1  2%      +2.1%       303=
1 =C2=B1  4%  interrupts.CPU48.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.190:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.191:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.60:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.61:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU49.62:PCI-MSI.67176448-edge.ioat-msix
      5387 =C2=B1 19%      -2.2%       5271 =C2=B1 20%     -22.4%       418=
2 =C2=B1  7%  interrupts.CPU49.CAL:Function_call_interrupts
      2.83 =C2=B1 13%     -11.8%       2.50 =C2=B1 20%      +5.9%       3.0=
0        interrupts.CPU49.IWI:IRQ_work_interrupts
    566308 =C2=B1 15%      +6.9%     605629            +6.6%     603423    =
    interrupts.CPU49.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU49.MCP:Machine_check_polls
      7823 =C2=B1 20%     -18.2%       6401 =C2=B1 33%      +9.1%       853=
6        interrupts.CPU49.NMI:Non-maskable_interrupts
      7823 =C2=B1 20%     -18.2%       6401 =C2=B1 33%      +9.1%       853=
6        interrupts.CPU49.PMI:Performance_monitoring_interrupts
    413.17 =C2=B1 17%      -9.5%     373.83 =C2=B1 14%      -8.5%     378.1=
7 =C2=B1 14%  interrupts.CPU49.RES:Rescheduling_interrupts
      2922 =C2=B1  3%      +5.1%       3072 =C2=B1  3%      +1.3%       295=
9 =C2=B1  3%  interrupts.CPU49.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.29:PCI-MSI.23068672-edge.PCIe.PME,pciehp
      3686            +0.5%       3705 =C2=B1  2%      +0.6%       3708 =C2=
=B1  2%  interrupts.CPU5.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU5.IWI:IRQ_work_interrupts
    563989 =C2=B1 16%      +7.4%     605524            +7.1%     603903    =
    interrupts.CPU5.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU5.MCP:Machine_check_polls
      7508 =C2=B1 20%      +9.1%       8188            +9.2%       8195    =
    interrupts.CPU5.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      +9.1%       8188            +9.2%       8195    =
    interrupts.CPU5.PMI:Performance_monitoring_interrupts
    312.00            +0.0%     312.00            +0.6%     314.00        i=
nterrupts.CPU5.RES:Rescheduling_interrupts
      2978 =C2=B1  3%      -1.7%       2927 =C2=B1  4%      -1.7%       292=
7 =C2=B1  5%  interrupts.CPU5.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.191:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.192:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.61:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.62:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.63:PCI-MSI.67178496-edge.ioat-msix
      5001 =C2=B1 32%      -8.8%       4561 =C2=B1 20%     -16.3%       418=
8 =C2=B1  8%  interrupts.CPU50.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      -5.9%       2.67 =C2=B1 17%      +5.9%       3.0=
0        interrupts.CPU50.IWI:IRQ_work_interrupts
    566216 =C2=B1 15%      +7.0%     605619            +6.6%     603375    =
    interrupts.CPU50.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU50.MCP:Machine_check_polls
      7823 =C2=B1 20%      -9.1%       7110 =C2=B1 28%      +9.1%       853=
7        interrupts.CPU50.NMI:Non-maskable_interrupts
      7823 =C2=B1 20%      -9.1%       7110 =C2=B1 28%      +9.1%       853=
7        interrupts.CPU50.PMI:Performance_monitoring_interrupts
    638.17 =C2=B1 90%     -26.4%     469.67 =C2=B1 29%     -43.1%     363.1=
7 =C2=B1 13%  interrupts.CPU50.RES:Rescheduling_interrupts
      3006 =C2=B1  3%      -2.7%       2925 =C2=B1  2%      +1.0%       303=
7 =C2=B1  3%  interrupts.CPU50.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.192:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.193:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.62:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.63:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.65:PCI-MSI.67180544-edge.ioat-msix
      4028 =C2=B1 13%      -5.6%       3802 =C2=B1  2%      +1.9%       410=
2 =C2=B1 18%  interrupts.CPU51.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +0.0%       2.83 =C2=B1 13%      +5.9%       3.0=
0        interrupts.CPU51.IWI:IRQ_work_interrupts
    565755 =C2=B1 15%      +7.0%     605587            +6.6%     603342    =
    interrupts.CPU51.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU51.MCP:Machine_check_polls
      7822 =C2=B1 20%      -0.0%       7822 =C2=B1 20%      +9.1%       853=
5        interrupts.CPU51.NMI:Non-maskable_interrupts
      7822 =C2=B1 20%      -0.0%       7822 =C2=B1 20%      +9.1%       853=
5        interrupts.CPU51.PMI:Performance_monitoring_interrupts
    354.17 =C2=B1 27%     -10.6%     316.67 =C2=B1  4%     -12.9%     308.3=
3        interrupts.CPU51.RES:Rescheduling_interrupts
      3007 =C2=B1  4%      +2.6%       3086 =C2=B1  3%      -0.1%       300=
4 =C2=B1  4%  interrupts.CPU51.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.193:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.194:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.64:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.66:PCI-MSI.67182592-edge.ioat-msix
      3938 =C2=B1  9%      -5.6%       3716 =C2=B1  2%      -4.8%       374=
9        interrupts.CPU52.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      -5.9%       2.67 =C2=B1 17%      +5.9%       3.0=
0        interrupts.CPU52.IWI:IRQ_work_interrupts
    565559 =C2=B1 15%      +7.1%     605583            +6.7%     603359    =
    interrupts.CPU52.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU52.MCP:Machine_check_polls
      7826 =C2=B1 20%      -9.1%       7114 =C2=B1 28%      +9.1%       853=
6        interrupts.CPU52.NMI:Non-maskable_interrupts
      7826 =C2=B1 20%      -9.1%       7114 =C2=B1 28%      +9.1%       853=
6        interrupts.CPU52.PMI:Performance_monitoring_interrupts
    406.00 =C2=B1 28%     -11.5%     359.50 =C2=B1 31%     -24.0%     308.5=
0        interrupts.CPU52.RES:Rescheduling_interrupts
      3012 =C2=B1  3%      -2.6%       2933 =C2=B1  2%      -1.2%       297=
4 =C2=B1  3%  interrupts.CPU52.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.194:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.195:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.65:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.67:PCI-MSI.67184640-edge.ioat-msix
      3742            +1.0%       3780            +0.7%       3766        i=
nterrupts.CPU53.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      +0.0%       3.00    =
    interrupts.CPU53.IWI:IRQ_work_interrupts
    565855 =C2=B1 15%      +7.0%     605588            +6.6%     603337    =
    interrupts.CPU53.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU53.MCP:Machine_check_polls
      8536           -16.7%       7114 =C2=B1 28%      -0.0%       8535    =
    interrupts.CPU53.NMI:Non-maskable_interrupts
      8536           -16.7%       7114 =C2=B1 28%      -0.0%       8535    =
    interrupts.CPU53.PMI:Performance_monitoring_interrupts
    308.17           +49.8%     461.67 =C2=B1 72%      -0.3%     307.33    =
    interrupts.CPU53.RES:Rescheduling_interrupts
      2984 =C2=B1  3%      +3.2%       3079 =C2=B1  3%      +2.1%       304=
6 =C2=B1  3%  interrupts.CPU53.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.195:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.196:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.66:PCI-MSI.67186688-edge.ioat-msix
      3685 =C2=B1  4%      +0.5%       3703            +1.3%       3732    =
    interrupts.CPU54.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      -5.9%       2.67 =C2=B1 17%      +5.9%       3.0=
0        interrupts.CPU54.IWI:IRQ_work_interrupts
    566016 =C2=B1 15%      +7.0%     605583            +6.6%     603328    =
    interrupts.CPU54.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU54.MCP:Machine_check_polls
      7829 =C2=B1 20%      -9.1%       7114 =C2=B1 28%      +9.0%       853=
5        interrupts.CPU54.NMI:Non-maskable_interrupts
      7829 =C2=B1 20%      -9.1%       7114 =C2=B1 28%      +9.0%       853=
5        interrupts.CPU54.PMI:Performance_monitoring_interrupts
    311.33            -1.3%     307.33            -1.2%     307.67        i=
nterrupts.CPU54.RES:Rescheduling_interrupts
      3015 =C2=B1  3%      -2.6%       2938 =C2=B1  2%      +0.1%       301=
9 =C2=B1  3%  interrupts.CPU54.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.196:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.197:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.67:PCI-MSI.67188736-edge.ioat-msix
      3962 =C2=B1 13%      -3.8%       3811 =C2=B1  3%      -5.3%       375=
0        interrupts.CPU55.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      +0.0%       3.00    =
    interrupts.CPU55.IWI:IRQ_work_interrupts
    566315 =C2=B1 15%      +6.9%     605584            +6.5%     603336    =
    interrupts.CPU55.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU55.MCP:Machine_check_polls
      8536           -16.7%       7113 =C2=B1 28%      -0.0%       8534    =
    interrupts.CPU55.NMI:Non-maskable_interrupts
      8536           -16.7%       7113 =C2=B1 28%      -0.0%       8534    =
    interrupts.CPU55.PMI:Performance_monitoring_interrupts
    374.50 =C2=B1 39%     -13.4%     324.50 =C2=B1  8%     -17.8%     308.0=
0        interrupts.CPU55.RES:Rescheduling_interrupts
      2989 =C2=B1  3%      +3.4%       3091 =C2=B1  3%      +1.0%       301=
9 =C2=B1  4%  interrupts.CPU55.TLB:TLB_shootdowns
      3755 =C2=B1  2%      -1.1%       3714            -1.3%       3705 =C2=
=B1  2%  interrupts.CPU56.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      +0.0%       3.00    =
    interrupts.CPU56.IWI:IRQ_work_interrupts
    565929 =C2=B1 15%      +7.0%     605584            +6.6%     603349    =
    interrupts.CPU56.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU56.MCP:Machine_check_polls
      8537           -16.7%       7114 =C2=B1 28%      -0.0%       8534    =
    interrupts.CPU56.NMI:Non-maskable_interrupts
      8537           -16.7%       7114 =C2=B1 28%      -0.0%       8534    =
    interrupts.CPU56.PMI:Performance_monitoring_interrupts
    307.83            -0.2%     307.33            -0.1%     307.67        i=
nterrupts.CPU56.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      -1.5%       2985 =C2=B1  2%      -0.2%       302=
4 =C2=B1  3%  interrupts.CPU56.TLB:TLB_shootdowns
      3719 =C2=B1  2%      +1.7%       3781            +0.2%       3726 =C2=
=B1  2%  interrupts.CPU57.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      -5.6%       2.83 =C2=
=B1 13%  interrupts.CPU57.IWI:IRQ_work_interrupts
    565660 =C2=B1 15%      +7.1%     605575            +6.7%     603374    =
    interrupts.CPU57.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU57.MCP:Machine_check_polls
      8537           -16.7%       7113 =C2=B1 28%      -8.3%       7825 =C2=
=B1 20%  interrupts.CPU57.NMI:Non-maskable_interrupts
      8537           -16.7%       7113 =C2=B1 28%      -8.3%       7825 =C2=
=B1 20%  interrupts.CPU57.PMI:Performance_monitoring_interrupts
    307.33            +0.5%     309.00            +0.2%     308.00        i=
nterrupts.CPU57.RES:Rescheduling_interrupts
      3020 =C2=B1  4%      +2.4%       3094 =C2=B1  3%      +1.4%       306=
3 =C2=B1  4%  interrupts.CPU57.TLB:TLB_shootdowns
      3817 =C2=B1  5%      -2.7%       3715            -2.2%       3733    =
    interrupts.CPU58.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +0.0%       2.83 =C2=B1 13%      +0.0%       2.8=
3 =C2=B1 13%  interrupts.CPU58.IWI:IRQ_work_interrupts
    565759 =C2=B1 15%      +7.0%     605568            +6.6%     603344    =
    interrupts.CPU58.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU58.MCP:Machine_check_polls
      7828 =C2=B1 20%      -0.1%       7822 =C2=B1 20%      -0.0%       782=
5 =C2=B1 20%  interrupts.CPU58.NMI:Non-maskable_interrupts
      7828 =C2=B1 20%      -0.1%       7822 =C2=B1 20%      -0.0%       782=
5 =C2=B1 20%  interrupts.CPU58.PMI:Performance_monitoring_interrupts
    330.00 =C2=B1 15%      -6.9%     307.17            -6.8%     307.67    =
    interrupts.CPU58.RES:Rescheduling_interrupts
      3025 =C2=B1  4%      -2.5%       2949 =C2=B1  2%      -0.1%       302=
2 =C2=B1  3%  interrupts.CPU58.TLB:TLB_shootdowns
      3746 =C2=B1  3%      +5.7%       3958 =C2=B1 10%      +0.1%       374=
9 =C2=B1  2%  interrupts.CPU59.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            -5.6%       2.83 =C2=B1 1=
3%  interrupts.CPU59.IWI:IRQ_work_interrupts
    565492 =C2=B1 15%      +7.1%     605568            +6.7%     603313    =
    interrupts.CPU59.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU59.MCP:Machine_check_polls
      8537            -0.0%       8534            -8.4%       7824 =C2=B1 2=
0%  interrupts.CPU59.NMI:Non-maskable_interrupts
      8537            -0.0%       8534            -8.4%       7824 =C2=B1 2=
0%  interrupts.CPU59.PMI:Performance_monitoring_interrupts
    309.50           +14.9%     355.67 =C2=B1 30%      -0.6%     307.50    =
    interrupts.CPU59.RES:Rescheduling_interrupts
      3004 =C2=B1  5%      +3.1%       3098 =C2=B1  3%      +0.6%       302=
4 =C2=B1  4%  interrupts.CPU59.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.35:PCI-MSI.327680-edge.xhci_hcd
      3695            -0.4%       3681            -0.2%       3686        i=
nterrupts.CPU6.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU6.IWI:IRQ_work_interrupts
    563915 =C2=B1 16%      +7.4%     605509            +7.1%     603804    =
    interrupts.CPU6.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU6.MCP:Machine_check_polls
      7509 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +9.1%       819=
5        interrupts.CPU6.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +9.1%       819=
5        interrupts.CPU6.PMI:Performance_monitoring_interrupts
    314.17            -1.2%     310.50            -0.1%     313.83        i=
nterrupts.CPU6.RES:Rescheduling_interrupts
      2808 =C2=B1  3%      -0.1%       2806 =C2=B1  3%      +2.0%       286=
4 =C2=B1  3%  interrupts.CPU6.TLB:TLB_shootdowns
      3758            -1.1%       3717            -0.7%       3733 =C2=B1  =
2%  interrupts.CPU60.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +0.0%       2.83 =C2=B1 13%      +0.0%       2.8=
3 =C2=B1 13%  interrupts.CPU60.IWI:IRQ_work_interrupts
    566327 =C2=B1 15%      +6.9%     605568            +6.5%     603344    =
    interrupts.CPU60.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU60.MCP:Machine_check_polls
      7822 =C2=B1 20%      +0.0%       7826 =C2=B1 20%      +0.0%       782=
4 =C2=B1 20%  interrupts.CPU60.NMI:Non-maskable_interrupts
      7822 =C2=B1 20%      +0.0%       7826 =C2=B1 20%      +0.0%       782=
4 =C2=B1 20%  interrupts.CPU60.PMI:Performance_monitoring_interrupts
    458.67 =C2=B1 73%     -31.8%     312.67 =C2=B1  3%     -30.7%     317.8=
3 =C2=B1  7%  interrupts.CPU60.RES:Rescheduling_interrupts
      3040 =C2=B1  3%      -2.8%       2955 =C2=B1  2%      -2.1%       297=
6 =C2=B1  3%  interrupts.CPU60.TLB:TLB_shootdowns
      3740            +0.5%       3759            -0.6%       3717 =C2=B1  =
2%  interrupts.CPU61.CAL:Function_call_interrupts
      2.67 =C2=B1 17%      +6.3%       2.83 =C2=B1 13%      +6.3%       2.8=
3 =C2=B1 13%  interrupts.CPU61.IWI:IRQ_work_interrupts
    566160 =C2=B1 15%      +7.0%     605568            +6.6%     603276    =
    interrupts.CPU61.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU61.MCP:Machine_check_polls
      7112 =C2=B1 28%     +10.1%       7827 =C2=B1 20%     +10.0%       782=
4 =C2=B1 20%  interrupts.CPU61.NMI:Non-maskable_interrupts
      7112 =C2=B1 28%     +10.1%       7827 =C2=B1 20%     +10.0%       782=
4 =C2=B1 20%  interrupts.CPU61.PMI:Performance_monitoring_interrupts
    358.50 =C2=B1 31%     -14.3%     307.33           -14.3%     307.17    =
    interrupts.CPU61.RES:Rescheduling_interrupts
      3004 =C2=B1  3%      +3.3%       3103 =C2=B1  3%      -0.6%       298=
7 =C2=B1  4%  interrupts.CPU61.TLB:TLB_shootdowns
      3761            -1.4%       3708            -0.8%       3732 =C2=B1  =
2%  interrupts.CPU62.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +0.0%       2.83 =C2=
=B1 13%  interrupts.CPU62.IWI:IRQ_work_interrupts
    565979 =C2=B1 15%      +7.0%     605506            +6.6%     603327    =
    interrupts.CPU62.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU62.MCP:Machine_check_polls
      7827 =C2=B1 20%      +9.0%       8534            -0.0%       7824 =C2=
=B1 20%  interrupts.CPU62.NMI:Non-maskable_interrupts
      7827 =C2=B1 20%      +9.0%       8534            -0.0%       7824 =C2=
=B1 20%  interrupts.CPU62.PMI:Performance_monitoring_interrupts
    308.17            +0.1%     308.33            +0.1%     308.33        i=
nterrupts.CPU62.RES:Rescheduling_interrupts
      3042 =C2=B1  3%      -3.1%       2948 =C2=B1  3%      -0.2%       303=
6 =C2=B1  3%  interrupts.CPU62.TLB:TLB_shootdowns
      3773 =C2=B1  2%      -0.0%       3772 =C2=B1  2%      -0.3%       376=
3 =C2=B1  2%  interrupts.CPU63.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      -5.6%       2.83 =C2=
=B1 13%  interrupts.CPU63.IWI:IRQ_work_interrupts
    565748 =C2=B1 15%      +7.0%     605574            +6.6%     603339    =
    interrupts.CPU63.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU63.MCP:Machine_check_polls
      8540            -8.4%       7826 =C2=B1 20%      -8.4%       7824 =C2=
=B1 20%  interrupts.CPU63.NMI:Non-maskable_interrupts
      8540            -8.4%       7826 =C2=B1 20%      -8.4%       7824 =C2=
=B1 20%  interrupts.CPU63.PMI:Performance_monitoring_interrupts
    308.33            +0.5%     310.00 =C2=B1  2%      -0.2%     307.67    =
    interrupts.CPU63.RES:Rescheduling_interrupts
      3046 =C2=B1  3%      +0.8%       3071 =C2=B1  4%      -0.4%       303=
5 =C2=B1  4%  interrupts.CPU63.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU64.99:PCI-MSI.23593009-edge.nvme0q49
      3785            -1.6%       3725           +30.6%       4944 =C2=B1 5=
6%  interrupts.CPU64.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU64.IWI:IRQ_work_interrupts
    565753 =C2=B1 15%      +7.0%     605571            +6.6%     603326    =
    interrupts.CPU64.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU64.MCP:Machine_check_polls
      8539            -8.3%       7826 =C2=B1 20%      -0.0%       8536    =
    interrupts.CPU64.NMI:Non-maskable_interrupts
      8539            -8.3%       7826 =C2=B1 20%      -0.0%       8536    =
    interrupts.CPU64.PMI:Performance_monitoring_interrupts
    307.67            -0.1%     307.50           +56.4%     481.17 =C2=B1 8=
0%  interrupts.CPU64.RES:Rescheduling_interrupts
      3048 =C2=B1  3%      -2.7%       2966 =C2=B1  2%      -2.6%       296=
8 =C2=B1  3%  interrupts.CPU64.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU65.95:PCI-MSI.23593010-edge.nvme0q50
      3729 =C2=B1  5%      +0.7%       3757 =C2=B1  3%      +1.0%       376=
7        interrupts.CPU65.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU65.IWI:IRQ_work_interrupts
    565859 =C2=B1 15%      +7.0%     605579            +6.6%     603327    =
    interrupts.CPU65.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU65.MCP:Machine_check_polls
      8539            -8.4%       7821 =C2=B1 20%      -0.0%       8535    =
    interrupts.CPU65.NMI:Non-maskable_interrupts
      8539            -8.4%       7821 =C2=B1 20%      -0.0%       8535    =
    interrupts.CPU65.PMI:Performance_monitoring_interrupts
    316.17 =C2=B1  4%      -2.7%     307.67            -2.7%     307.67    =
    interrupts.CPU65.RES:Rescheduling_interrupts
      3050 =C2=B1  3%      +1.8%       3105 =C2=B1  3%      -0.0%       304=
8 =C2=B1  4%  interrupts.CPU65.TLB:TLB_shootdowns
      3759 =C2=B1  2%      -1.6%       3699            -2.6%       3661 =C2=
=B1  2%  interrupts.CPU66.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU66.IWI:IRQ_work_interrupts
    566329 =C2=B1 15%      +6.9%     605566            +6.5%     603379    =
    interrupts.CPU66.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU66.MCP:Machine_check_polls
      8539            -0.0%       8535            -0.0%       8537        i=
nterrupts.CPU66.NMI:Non-maskable_interrupts
      8539            -0.0%       8535            -0.0%       8537        i=
nterrupts.CPU66.PMI:Performance_monitoring_interrupts
    310.17            -1.0%     307.00            -0.7%     308.00        i=
nterrupts.CPU66.RES:Rescheduling_interrupts
      3010 =C2=B1  4%      -1.0%       2980 =C2=B1  2%      +0.9%       303=
7 =C2=B1  3%  interrupts.CPU66.TLB:TLB_shootdowns
      3788            +1.0%       3827 =C2=B1  2%      -0.7%       3760 =C2=
=B1  3%  interrupts.CPU67.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU67.IWI:IRQ_work_interrupts
    566289 =C2=B1 15%      +6.9%     605577            +6.5%     603363    =
    interrupts.CPU67.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU67.MCP:Machine_check_polls
      8539            -0.1%       8534            -0.0%       8537        i=
nterrupts.CPU67.NMI:Non-maskable_interrupts
      8539            -0.1%       8534            -0.0%       8537        i=
nterrupts.CPU67.PMI:Performance_monitoring_interrupts
    308.67            -0.4%     307.50            +4.3%     321.83 =C2=B1  =
8%  interrupts.CPU67.RES:Rescheduling_interrupts
      3054 =C2=B1  3%      +2.3%       3124 =C2=B1  2%      -0.4%       304=
3 =C2=B1  4%  interrupts.CPU67.TLB:TLB_shootdowns
      3781            -2.0%       3704 =C2=B1  2%      +5.4%       3985 =C2=
=B1 11%  interrupts.CPU68.CAL:Function_call_interrupts
      3.00            +0.0%       3.00           -11.1%       2.67 =C2=B1 1=
7%  interrupts.CPU68.IWI:IRQ_work_interrupts
    566557 =C2=B1 15%      +6.9%     605572            +6.5%     603332    =
    interrupts.CPU68.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU68.MCP:Machine_check_polls
      8538            -0.1%       8533           -16.7%       7111 =C2=B1 2=
8%  interrupts.CPU68.NMI:Non-maskable_interrupts
      8538            -0.1%       8533           -16.7%       7111 =C2=B1 2=
8%  interrupts.CPU68.PMI:Performance_monitoring_interrupts
    308.83            -0.2%     308.17           +23.1%     380.17 =C2=B1 4=
1%  interrupts.CPU68.RES:Rescheduling_interrupts
      3050 =C2=B1  3%      -2.1%       2985 =C2=B1  2%      -0.0%       304=
9 =C2=B1  3%  interrupts.CPU68.TLB:TLB_shootdowns
      3881 =C2=B1  5%      -2.1%       3801            -2.2%       3794    =
    interrupts.CPU69.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      -5.6%       2.83 =C2=
=B1 13%  interrupts.CPU69.IWI:IRQ_work_interrupts
    565909 =C2=B1 15%      +7.0%     605571            +6.6%     603316    =
    interrupts.CPU69.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU69.MCP:Machine_check_polls
      8538            -8.4%       7825 =C2=B1 20%      -8.4%       7824 =C2=
=B1 20%  interrupts.CPU69.NMI:Non-maskable_interrupts
      8538            -8.4%       7825 =C2=B1 20%      -8.4%       7824 =C2=
=B1 20%  interrupts.CPU69.PMI:Performance_monitoring_interrupts
    344.50 =C2=B1 23%     -10.6%     307.83            -8.9%     313.83 =C2=
=B1  4%  interrupts.CPU69.RES:Rescheduling_interrupts
      3059 =C2=B1  3%      +2.2%       3128 =C2=B1  2%      +1.0%       309=
1 =C2=B1  3%  interrupts.CPU69.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.8:IO-APIC.8-edge.rtc0
      3722            +0.1%       3726            +0.0%       3724        i=
nterrupts.CPU7.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU7.IWI:IRQ_work_interrupts
    564018 =C2=B1 16%      +7.4%     605522            +7.1%     603885    =
    interrupts.CPU7.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU7.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +9.1%       819=
4        interrupts.CPU7.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +9.1%       819=
4        interrupts.CPU7.PMI:Performance_monitoring_interrupts
    311.17            +0.1%     311.50           +49.9%     466.50 =C2=B1 7=
4%  interrupts.CPU7.RES:Rescheduling_interrupts
      2983 =C2=B1  3%      +1.3%       3021            -1.9%       2927 =C2=
=B1  5%  interrupts.CPU7.TLB:TLB_shootdowns
      3794 =C2=B1  2%      -1.9%       3720            -1.6%       3733    =
    interrupts.CPU70.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%     -11.1%       2.67 =C2=
=B1 17%  interrupts.CPU70.IWI:IRQ_work_interrupts
    566139 =C2=B1 15%      +7.0%     605566            +6.6%     603267    =
    interrupts.CPU70.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU70.MCP:Machine_check_polls
      8538            -8.3%       7825 =C2=B1 20%     -16.7%       7112 =C2=
=B1 28%  interrupts.CPU70.NMI:Non-maskable_interrupts
      8538            -8.3%       7825 =C2=B1 20%     -16.7%       7112 =C2=
=B1 28%  interrupts.CPU70.PMI:Performance_monitoring_interrupts
    311.50 =C2=B1  2%      -1.2%     307.83            -1.1%     308.17    =
    interrupts.CPU70.RES:Rescheduling_interrupts
      3071 =C2=B1  3%      -2.0%       3011 =C2=B1  2%      -2.0%       301=
1 =C2=B1  2%  interrupts.CPU70.TLB:TLB_shootdowns
      3712 =C2=B1  2%     +14.2%       4237 =C2=B1 26%      +1.0%       374=
9 =C2=B1  2%  interrupts.CPU71.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%     -11.1%       2.67 =C2=
=B1 17%  interrupts.CPU71.IWI:IRQ_work_interrupts
    566065 =C2=B1 15%      +7.0%     605602            +6.6%     603311    =
    interrupts.CPU71.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU71.MCP:Machine_check_polls
      8537           -16.7%       7111 =C2=B1 28%     -16.7%       7112 =C2=
=B1 28%  interrupts.CPU71.NMI:Non-maskable_interrupts
      8537           -16.7%       7111 =C2=B1 28%     -16.7%       7112 =C2=
=B1 28%  interrupts.CPU71.PMI:Performance_monitoring_interrupts
    309.33           +26.8%     392.33 =C2=B1 48%      +0.5%     311.00 =C2=
=B1  2%  interrupts.CPU71.RES:Rescheduling_interrupts
      3054 =C2=B1  3%      +1.8%       3109 =C2=B1  3%      -0.5%       303=
9 =C2=B1  3%  interrupts.CPU71.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU72.198:PCI-MSI.100728832-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU72.199:PCI-MSI.100728832-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU72.69:PCI-MSI.100728832-edge.ioat-msix
      3925 =C2=B1  2%      +1.0%       3962 =C2=B1  4%      +0.6%       395=
0 =C2=B1  3%  interrupts.CPU72.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%     -16.7%       1.67 =C2=
=B1 28%  interrupts.CPU72.IWI:IRQ_work_interrupts
    555199 =C2=B1 20%      +9.1%     605609            +8.6%     603162    =
    interrupts.CPU72.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU72.MCP:Machine_check_polls
      8004            -8.4%       7332 =C2=B1 20%     -16.9%       6653 =C2=
=B1 28%  interrupts.CPU72.NMI:Non-maskable_interrupts
      8004            -8.4%       7332 =C2=B1 20%     -16.9%       6653 =C2=
=B1 28%  interrupts.CPU72.PMI:Performance_monitoring_interrupts
    352.17 =C2=B1  5%      +6.9%     376.50 =C2=B1 11%      +1.9%     359.0=
0 =C2=B1  9%  interrupts.CPU72.RES:Rescheduling_interrupts
      3071 =C2=B1  3%      +0.6%       3088 =C2=B1  3%      +0.5%       308=
5 =C2=B1  3%  interrupts.CPU72.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU73.200:PCI-MSI.100730880-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU73.201:PCI-MSI.100730880-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU73.73:PCI-MSI.100730880-edge.ioat-msix
      4853 =C2=B1 28%     +13.5%       5509 =C2=B1 30%      -1.2%       479=
6 =C2=B1 19%  interrupts.CPU73.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU73.IWI:IRQ_work_interrupts
    561625 =C2=B1 17%      +7.8%     605636            +7.4%     603158    =
    interrupts.CPU73.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU73.MCP:Machine_check_polls
      8005            -8.4%       7334 =C2=B1 20%      -8.5%       7322 =C2=
=B1 20%  interrupts.CPU73.NMI:Non-maskable_interrupts
      8005            -8.4%       7334 =C2=B1 20%      -8.5%       7322 =C2=
=B1 20%  interrupts.CPU73.PMI:Performance_monitoring_interrupts
    440.50 =C2=B1 20%      -6.7%     411.17 =C2=B1  8%      -2.9%     427.8=
3 =C2=B1 30%  interrupts.CPU73.RES:Rescheduling_interrupts
      3089 =C2=B1  2%      +2.2%       3158 =C2=B1  2%      -1.1%       305=
4 =C2=B1  3%  interrupts.CPU73.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU74.201:PCI-MSI.100732928-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU74.202:PCI-MSI.100732928-edge.ioat-msix
      4348 =C2=B1  7%      +8.6%       4723 =C2=B1 21%      -0.7%       431=
8 =C2=B1 15%  interrupts.CPU74.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU74.IWI:IRQ_work_interrupts
    561818 =C2=B1 17%      +7.8%     605581            +7.3%     603111    =
    interrupts.CPU74.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU74.MCP:Machine_check_polls
      8005            -8.4%       7335 =C2=B1 20%      -0.2%       7987    =
    interrupts.CPU74.NMI:Non-maskable_interrupts
      8005            -8.4%       7335 =C2=B1 20%      -0.2%       7987    =
    interrupts.CPU74.PMI:Performance_monitoring_interrupts
    389.83 =C2=B1 18%     +10.4%     430.33 =C2=B1 25%      +8.3%     422.1=
7 =C2=B1 23%  interrupts.CPU74.RES:Rescheduling_interrupts
      3117 =C2=B1  2%      -2.7%       3034            -2.9%       3027 =C2=
=B1  2%  interrupts.CPU74.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU75.202:PCI-MSI.100734976-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU75.203:PCI-MSI.100734976-edge.ioat-msix
      3879 =C2=B1  4%     +28.6%       4987 =C2=B1 48%      -2.0%       380=
0        interrupts.CPU75.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU75.IWI:IRQ_work_interrupts
    561688 =C2=B1 17%      +7.8%     605562            +7.4%     603074    =
    interrupts.CPU75.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU75.MCP:Machine_check_polls
      8004            -8.4%       7336 =C2=B1 20%      -0.2%       7987    =
    interrupts.CPU75.NMI:Non-maskable_interrupts
      8004            -8.4%       7336 =C2=B1 20%      -0.2%       7987    =
    interrupts.CPU75.PMI:Performance_monitoring_interrupts
    339.00 =C2=B1 14%     +53.5%     520.50 =C2=B1 71%      -3.9%     325.8=
3 =C2=B1  9%  interrupts.CPU75.RES:Rescheduling_interrupts
      3102 =C2=B1  3%      +0.3%       3110 =C2=B1  3%      -1.3%       306=
2 =C2=B1  3%  interrupts.CPU75.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU76.203:PCI-MSI.100737024-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU76.204:PCI-MSI.100737024-edge.ioat-msix
      3810            -1.6%       3750            -2.1%       3732 =C2=B1  =
2%  interrupts.CPU76.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU76.IWI:IRQ_work_interrupts
    561206 =C2=B1 17%      +7.9%     605587            +7.5%     603034    =
    interrupts.CPU76.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU76.MCP:Machine_check_polls
      8004            -0.0%       8003            -0.2%       7990        i=
nterrupts.CPU76.NMI:Non-maskable_interrupts
      8004            -0.0%       8003            -0.2%       7990        i=
nterrupts.CPU76.PMI:Performance_monitoring_interrupts
    307.83            +0.4%     309.17            +0.6%     309.83        i=
nterrupts.CPU76.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      -2.3%       3025 =C2=B1  2%      -1.6%       304=
8 =C2=B1  3%  interrupts.CPU76.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU77.204:PCI-MSI.100739072-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU77.205:PCI-MSI.100739072-edge.ioat-msix
      3834            -0.4%       3819            -0.6%       3809        i=
nterrupts.CPU77.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU77.IWI:IRQ_work_interrupts
    561388 =C2=B1 17%      +7.9%     605565            +7.4%     603101    =
    interrupts.CPU77.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU77.MCP:Machine_check_polls
      8004            -0.0%       8003            -0.2%       7987        i=
nterrupts.CPU77.NMI:Non-maskable_interrupts
      8004            -0.0%       8003            -0.2%       7987        i=
nterrupts.CPU77.PMI:Performance_monitoring_interrupts
    308.00            +0.7%     310.17            +0.2%     308.50        i=
nterrupts.CPU77.RES:Rescheduling_interrupts
      3159            -0.3%       3151 =C2=B1  2%      -1.3%       3117 =C2=
=B1  3%  interrupts.CPU77.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU78.205:PCI-MSI.100741120-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU78.206:PCI-MSI.100741120-edge.ioat-msix
      3808            -0.6%       3785            -1.2%       3763 =C2=B1  =
2%  interrupts.CPU78.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU78.IWI:IRQ_work_interrupts
    561075 =C2=B1 17%      +7.9%     605572            +7.5%     603055    =
    interrupts.CPU78.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU78.MCP:Machine_check_polls
      8004            -0.0%       8001            -0.2%       7988        i=
nterrupts.CPU78.NMI:Non-maskable_interrupts
      8004            -0.0%       8001            -0.2%       7988        i=
nterrupts.CPU78.PMI:Performance_monitoring_interrupts
    313.50 =C2=B1  3%      -0.6%     311.50           +48.0%     464.00 =C2=
=B1 73%  interrupts.CPU78.RES:Rescheduling_interrupts
      3094 =C2=B1  3%      -0.4%       3082 =C2=B1  2%      -0.3%       308=
3 =C2=B1  3%  interrupts.CPU78.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU79.207:PCI-MSI.100743168-edge.ioat-msix
      3724 =C2=B1  5%      +4.0%       3874 =C2=B1  6%      +1.7%       378=
7 =C2=B1  2%  interrupts.CPU79.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU79.IWI:IRQ_work_interrupts
    561662 =C2=B1 17%      +7.8%     605587            +7.4%     603084    =
    interrupts.CPU79.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU79.MCP:Machine_check_polls
      8005            -0.0%       8003            -0.2%       7988        i=
nterrupts.CPU79.NMI:Non-maskable_interrupts
      8005            -0.0%       8003            -0.2%       7988        i=
nterrupts.CPU79.PMI:Performance_monitoring_interrupts
    309.17           +69.8%     524.83 =C2=B1 57%      -0.4%     307.83    =
    interrupts.CPU79.RES:Rescheduling_interrupts
      3088 =C2=B1  3%      +3.7%       3203            -0.5%       3073 =C2=
=B1  4%  interrupts.CPU79.TLB:TLB_shootdowns
      3792 =C2=B1  6%      -3.3%       3666            -1.8%       3722    =
    interrupts.CPU8.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU8.IWI:IRQ_work_interrupts
    564233 =C2=B1 16%      +7.3%     605522            +7.0%     603872    =
    interrupts.CPU8.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU8.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.2%       819=
5        interrupts.CPU8.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.2%       819=
5        interrupts.CPU8.PMI:Performance_monitoring_interrupts
    357.17 =C2=B1 28%     -13.2%     310.17           -12.3%     313.33    =
    interrupts.CPU8.RES:Rescheduling_interrupts
      2805 =C2=B1  4%      -0.0%       2805 =C2=B1  3%      +1.6%       285=
0 =C2=B1  3%  interrupts.CPU8.TLB:TLB_shootdowns
      3859 =C2=B1  2%      -2.2%       3773            -2.2%       3773    =
    interrupts.CPU80.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            -8.3%       1.83 =C2=B1 2=
0%  interrupts.CPU80.IWI:IRQ_work_interrupts
    561853 =C2=B1 17%      +7.8%     605548            +7.3%     603049    =
    interrupts.CPU80.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU80.MCP:Machine_check_polls
      8004            -0.0%       8002            -8.5%       7321 =C2=B1 2=
0%  interrupts.CPU80.NMI:Non-maskable_interrupts
      8004            -0.0%       8002            -8.5%       7321 =C2=B1 2=
0%  interrupts.CPU80.PMI:Performance_monitoring_interrupts
    314.67 =C2=B1  3%      +0.3%     315.50 =C2=B1  4%      -2.1%     308.0=
0        interrupts.CPU80.RES:Rescheduling_interrupts
      3130 =C2=B1  3%      -2.7%       3046 =C2=B1  2%      -2.1%       306=
4 =C2=B1  2%  interrupts.CPU80.TLB:TLB_shootdowns
      3791 =C2=B1  2%      +0.9%       3827            -2.1%       3713 =C2=
=B1  3%  interrupts.CPU81.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU81.IWI:IRQ_work_interrupts
    562021 =C2=B1 17%      +7.8%     605639            +7.3%     603089    =
    interrupts.CPU81.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU81.MCP:Machine_check_polls
      7337 =C2=B1 20%      -0.0%       7335 =C2=B1 20%      -0.2%       732=
2 =C2=B1 20%  interrupts.CPU81.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      -0.0%       7335 =C2=B1 20%      -0.2%       732=
2 =C2=B1 20%  interrupts.CPU81.PMI:Performance_monitoring_interrupts
    307.83            +2.1%     314.33 =C2=B1  4%      +1.0%     311.00 =C2=
=B1  2%  interrupts.CPU81.RES:Rescheduling_interrupts
      3098 =C2=B1  3%      +2.1%       3163 =C2=B1  3%      -2.1%       303=
2 =C2=B1  3%  interrupts.CPU81.TLB:TLB_shootdowns
      3805            -1.2%       3759            -0.4%       3789        i=
nterrupts.CPU82.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU82.IWI:IRQ_work_interrupts
    561664 =C2=B1 17%      +7.8%     605614            +7.4%     603081    =
    interrupts.CPU82.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU82.MCP:Machine_check_polls
      7337 =C2=B1 20%      -0.0%       7334 =C2=B1 20%      -0.2%       732=
2 =C2=B1 20%  interrupts.CPU82.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      -0.0%       7334 =C2=B1 20%      -0.2%       732=
2 =C2=B1 20%  interrupts.CPU82.PMI:Performance_monitoring_interrupts
    308.17            +0.3%     309.17            -0.2%     307.67        i=
nterrupts.CPU82.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      -2.1%       3031 =C2=B1  2%      -0.4%       308=
4 =C2=B1  2%  interrupts.CPU82.TLB:TLB_shootdowns
      3807            +0.8%       3837 =C2=B1  7%      -0.6%       3784    =
    interrupts.CPU83.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU83.IWI:IRQ_work_interrupts
    561194 =C2=B1 17%      +7.9%     605591            +7.5%     603075    =
    interrupts.CPU83.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU83.MCP:Machine_check_polls
      6669 =C2=B1 28%     +10.0%       7333 =C2=B1 20%      +9.8%       732=
2 =C2=B1 20%  interrupts.CPU83.NMI:Non-maskable_interrupts
      6669 =C2=B1 28%     +10.0%       7333 =C2=B1 20%      +9.8%       732=
2 =C2=B1 20%  interrupts.CPU83.PMI:Performance_monitoring_interrupts
    308.67           +10.6%     341.33 =C2=B1 19%      -0.1%     308.50    =
    interrupts.CPU83.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      -1.1%       3064 =C2=B1  4%      -0.2%       308=
9 =C2=B1  4%  interrupts.CPU83.TLB:TLB_shootdowns
      3796            -0.9%       3761            +0.1%       3801        i=
nterrupts.CPU84.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +20.0%       2.0=
0        interrupts.CPU84.IWI:IRQ_work_interrupts
    561271 =C2=B1 17%      +7.9%     605618            +7.4%     603067    =
    interrupts.CPU84.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU84.MCP:Machine_check_polls
      6668 =C2=B1 28%     +10.0%       7333 =C2=B1 20%     +19.8%       798=
8        interrupts.CPU84.NMI:Non-maskable_interrupts
      6668 =C2=B1 28%     +10.0%       7333 =C2=B1 20%     +19.8%       798=
8        interrupts.CPU84.PMI:Performance_monitoring_interrupts
    309.33            -0.3%     308.50            -0.6%     307.50        i=
nterrupts.CPU84.RES:Rescheduling_interrupts
      3098 =C2=B1  2%      -0.5%       3082 =C2=B1  3%      -0.1%       309=
4 =C2=B1  2%  interrupts.CPU84.TLB:TLB_shootdowns
      3806            +1.1%       3848 =C2=B1  2%      +1.4%       3861 =C2=
=B1  5%  interrupts.CPU85.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +20.0%       2.0=
0        interrupts.CPU85.IWI:IRQ_work_interrupts
    561682 =C2=B1 17%      +7.8%     605569            +7.4%     603092    =
    interrupts.CPU85.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU85.MCP:Machine_check_polls
      6669 =C2=B1 28%      +9.9%       7333 =C2=B1 20%     +19.8%       798=
9        interrupts.CPU85.NMI:Non-maskable_interrupts
      6669 =C2=B1 28%      +9.9%       7333 =C2=B1 20%     +19.8%       798=
9        interrupts.CPU85.PMI:Performance_monitoring_interrupts
    307.83            +0.6%     309.67            +8.5%     334.00 =C2=B1 1=
7%  interrupts.CPU85.RES:Rescheduling_interrupts
      3103 =C2=B1  3%      +1.9%       3161 =C2=B1  3%      -0.6%       308=
3 =C2=B1  4%  interrupts.CPU85.TLB:TLB_shootdowns
      3767 =C2=B1  2%      +6.1%       3996 =C2=B1 11%      +6.0%       399=
4 =C2=B1 12%  interrupts.CPU86.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU86.IWI:IRQ_work_interrupts
    561952 =C2=B1 17%      +7.8%     605562            +7.3%     603116    =
    interrupts.CPU86.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU86.MCP:Machine_check_polls
      7337 =C2=B1 20%      -9.1%       6668 =C2=B1 28%      -0.2%       732=
2 =C2=B1 20%  interrupts.CPU86.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      -9.1%       6668 =C2=B1 28%      -0.2%       732=
2 =C2=B1 20%  interrupts.CPU86.PMI:Performance_monitoring_interrupts
    308.67           +11.4%     344.00 =C2=B1 22%     +24.3%     383.67 =C2=
=B1 43%  interrupts.CPU86.RES:Rescheduling_interrupts
      3063 =C2=B1  3%      -0.1%       3061 =C2=B1  2%      -0.7%       304=
2 =C2=B1  3%  interrupts.CPU86.TLB:TLB_shootdowns
      3794            +1.2%       3839           +46.7%       5564 =C2=B1 7=
2%  interrupts.CPU87.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +9.1%       2.0=
0        interrupts.CPU87.IWI:IRQ_work_interrupts
    561875 =C2=B1 17%      +7.8%     605590            +7.3%     603063    =
    interrupts.CPU87.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU87.MCP:Machine_check_polls
      7338 =C2=B1 20%      -9.1%       6668 =C2=B1 28%      +8.9%       798=
8        interrupts.CPU87.NMI:Non-maskable_interrupts
      7338 =C2=B1 20%      -9.1%       6668 =C2=B1 28%      +8.9%       798=
8        interrupts.CPU87.PMI:Performance_monitoring_interrupts
    313.67 =C2=B1  4%      -1.4%     309.17           +84.9%     580.00 =C2=
=B1104%  interrupts.CPU87.RES:Rescheduling_interrupts
      3067 =C2=B1  3%      +3.2%       3167 =C2=B1  2%      +0.7%       308=
9 =C2=B1  4%  interrupts.CPU87.TLB:TLB_shootdowns
      3791            -0.8%       3761            -0.7%       3766        i=
nterrupts.CPU88.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +11.1%       1.67 =C2=B1 28%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU88.IWI:IRQ_work_interrupts
    561367 =C2=B1 17%      +7.9%     605589            +7.4%     603099    =
    interrupts.CPU88.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU88.MCP:Machine_check_polls
      6005 =C2=B1 33%     +11.1%       6669 =C2=B1 28%     +21.9%       732=
2 =C2=B1 20%  interrupts.CPU88.NMI:Non-maskable_interrupts
      6005 =C2=B1 33%     +11.1%       6669 =C2=B1 28%     +21.9%       732=
2 =C2=B1 20%  interrupts.CPU88.PMI:Performance_monitoring_interrupts
    308.50            -0.1%     308.17           +49.4%     460.83 =C2=B1 7=
4%  interrupts.CPU88.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      -2.2%       3029 =C2=B1  2%      -2.0%       303=
7 =C2=B1  3%  interrupts.CPU88.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU89.134:PCI-MSI.23593042-edge.nvme0q82
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU89.136:PCI-MSI.23593042-edge.nvme0q82
      3810            +1.1%       3853            -1.3%       3761        i=
nterrupts.CPU89.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +11.1%       1.67 =C2=B1 28%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU89.IWI:IRQ_work_interrupts
    561448 =C2=B1 17%      +7.9%     605543            +7.4%     603047    =
    interrupts.CPU89.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU89.MCP:Machine_check_polls
      6005 =C2=B1 33%     +11.0%       6668 =C2=B1 28%     +21.9%       732=
2 =C2=B1 20%  interrupts.CPU89.NMI:Non-maskable_interrupts
      6005 =C2=B1 33%     +11.0%       6668 =C2=B1 28%     +21.9%       732=
2 =C2=B1 20%  interrupts.CPU89.PMI:Performance_monitoring_interrupts
    326.67 =C2=B1 13%      -0.6%     324.83 =C2=B1 11%     +10.1%     359.5=
0 =C2=B1 31%  interrupts.CPU89.RES:Rescheduling_interrupts
      3103 =C2=B1  3%      +2.1%       3168 =C2=B1  2%      -2.0%       304=
1 =C2=B1  3%  interrupts.CPU89.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.30:PCI-MSI.524288-edge.eth0
      3745            -2.0%       3671 =C2=B1  3%      -0.2%       3736    =
    interrupts.CPU9.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU9.IWI:IRQ_work_interrupts
    564307 =C2=B1 16%      +7.3%     605522            +7.0%     603876    =
    interrupts.CPU9.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU9.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.0%       7506 =C2=B1 20%      +9.1%       819=
4        interrupts.CPU9.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.0%       7506 =C2=B1 20%      +9.1%       819=
4        interrupts.CPU9.PMI:Performance_monitoring_interrupts
    310.00            +0.2%     310.67            +0.5%     311.50        i=
nterrupts.CPU9.RES:Rescheduling_interrupts
      2999 =C2=B1  3%      -0.4%       2986 =C2=B1  3%      -1.7%       294=
9 =C2=B1  5%  interrupts.CPU9.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU90.135:PCI-MSI.23593043-edge.nvme0q83
      3809            -1.3%       3761 =C2=B1  2%      -0.2%       3800    =
    interrupts.CPU90.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU90.IWI:IRQ_work_interrupts
    561407 =C2=B1 17%      +7.9%     605503            +7.4%     603048    =
    interrupts.CPU90.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU90.MCP:Machine_check_polls
      6004 =C2=B1 33%     +22.2%       7335 =C2=B1 20%     +21.9%       732=
2 =C2=B1 20%  interrupts.CPU90.NMI:Non-maskable_interrupts
      6004 =C2=B1 33%     +22.2%       7335 =C2=B1 20%     +21.9%       732=
2 =C2=B1 20%  interrupts.CPU90.PMI:Performance_monitoring_interrupts
    307.33            +1.0%     310.33            +0.2%     307.83        i=
nterrupts.CPU90.RES:Rescheduling_interrupts
      3105 =C2=B1  3%      -3.0%       3011 =C2=B1  2%      -0.6%       308=
6 =C2=B1  2%  interrupts.CPU90.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU91.136:PCI-MSI.23593044-edge.nvme0q84
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU91.146:PCI-MSI.23593044-edge.nvme0q84
      3810            +1.1%       3851            -0.6%       3788 =C2=B1  =
2%  interrupts.CPU91.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +33.3%       2.00           +22.2%       1.83 =C2=
=B1 20%  interrupts.CPU91.IWI:IRQ_work_interrupts
    561799 =C2=B1 17%      +7.8%     605574            +7.3%     603049    =
    interrupts.CPU91.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU91.MCP:Machine_check_polls
      6004 =C2=B1 33%     +33.3%       8001           +21.9%       7321 =C2=
=B1 20%  interrupts.CPU91.NMI:Non-maskable_interrupts
      6004 =C2=B1 33%     +33.3%       8001           +21.9%       7321 =C2=
=B1 20%  interrupts.CPU91.PMI:Performance_monitoring_interrupts
    307.33            +0.4%     308.67            +0.2%     308.00        i=
nterrupts.CPU91.RES:Rescheduling_interrupts
      3112 =C2=B1  3%      +2.0%       3174 =C2=B1  2%      -0.7%       308=
9 =C2=B1  3%  interrupts.CPU91.TLB:TLB_shootdowns
      3800            -1.0%       3761            -0.4%       3784        i=
nterrupts.CPU92.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +20.0%       2.00    =
    interrupts.CPU92.IWI:IRQ_work_interrupts
    561558 =C2=B1 17%      +7.8%     605560            +7.4%     603060    =
    interrupts.CPU92.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU92.MCP:Machine_check_polls
      6672 =C2=B1 28%     +19.9%       8002           +19.7%       7987    =
    interrupts.CPU92.NMI:Non-maskable_interrupts
      6672 =C2=B1 28%     +19.9%       8002           +19.7%       7987    =
    interrupts.CPU92.PMI:Performance_monitoring_interrupts
    307.33            +0.1%     307.50            +0.2%     308.00        i=
nterrupts.CPU92.RES:Rescheduling_interrupts
      3108 =C2=B1  3%      -2.4%       3033 =C2=B1  2%      -0.8%       308=
3 =C2=B1  2%  interrupts.CPU92.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU93.149:PCI-MSI.23593046-edge.nvme0q86
      3792            +0.4%       3807            +7.8%       4089 =C2=B1 1=
7%  interrupts.CPU93.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +20.0%       2.00    =
    interrupts.CPU93.IWI:IRQ_work_interrupts
    561604 =C2=B1 17%      +7.8%     605591            +7.4%     603071    =
    interrupts.CPU93.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU93.MCP:Machine_check_polls
      6673 =C2=B1 28%     +19.9%       8003           +19.7%       7987    =
    interrupts.CPU93.NMI:Non-maskable_interrupts
      6673 =C2=B1 28%     +19.9%       8003           +19.7%       7987    =
    interrupts.CPU93.PMI:Performance_monitoring_interrupts
    307.33            +0.4%     308.50           +29.9%     399.17 =C2=B1 5=
0%  interrupts.CPU93.RES:Rescheduling_interrupts
      3076 =C2=B1  3%      +2.0%       3138 =C2=B1  3%      +0.8%       310=
0 =C2=B1  3%  interrupts.CPU93.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU94.137:PCI-MSI.23593047-edge.nvme0q87
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU94.139:PCI-MSI.23593047-edge.nvme0q87
      3792            -0.4%       3777            -0.2%       3786        i=
nterrupts.CPU94.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            -9.1%       1.67 =C2=
=B1 28%  interrupts.CPU94.IWI:IRQ_work_interrupts
    561397 =C2=B1 17%      +7.9%     605543            +7.4%     603088    =
    interrupts.CPU94.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU94.MCP:Machine_check_polls
      7340 =C2=B1 20%      +9.0%       8002            -9.3%       6655 =C2=
=B1 28%  interrupts.CPU94.NMI:Non-maskable_interrupts
      7340 =C2=B1 20%      +9.0%       8002            -9.3%       6655 =C2=
=B1 28%  interrupts.CPU94.PMI:Performance_monitoring_interrupts
    308.67            +1.3%     312.67 =C2=B1  4%      +0.0%     308.67    =
    interrupts.CPU94.RES:Rescheduling_interrupts
      3110 =C2=B1  3%      -2.4%       3036 =C2=B1  2%      -0.8%       308=
5 =C2=B1  2%  interrupts.CPU94.TLB:TLB_shootdowns
      4303 =C2=B1 29%     -12.4%       3770           -10.6%       3849 =C2=
=B1  6%  interrupts.CPU95.CAL:Function_call_interrupts
      1.83 =C2=B1 37%    +100.0%       3.67 =C2=B1 30%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU95.IWI:IRQ_work_interrupts
    561234 =C2=B1 17%      +7.9%     605581            +7.5%     603335    =
    interrupts.CPU95.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU95.MCP:Machine_check_polls
      6003 =C2=B1 33%     +33.5%       8017           +10.8%       6652 =C2=
=B1 28%  interrupts.CPU95.NMI:Non-maskable_interrupts
      6003 =C2=B1 33%     +33.5%       8017           +10.8%       6652 =C2=
=B1 28%  interrupts.CPU95.PMI:Performance_monitoring_interrupts
    416.67 =C2=B1 55%     -24.4%     315.17 =C2=B1  2%     -15.9%     350.5=
0 =C2=B1 24%  interrupts.CPU95.RES:Rescheduling_interrupts
      3062 =C2=B1  5%      +1.6%       3111 =C2=B1  3%      +2.5%       313=
8        interrupts.CPU95.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.145:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.146:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.147:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.151:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.157:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.159:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.170:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.176:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.46:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.47:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.48:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.51:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.52:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.53:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.56:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.60:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.64:PCI-MSI.23592960-edge.nvme0q0
     13443 =C2=B1 20%      +0.5%      13511 =C2=B1 10%     +30.8%      1758=
3 =C2=B1 19%  interrupts.CPU96.CAL:Function_call_interrupts
      2.67 =C2=B1 17%      +0.0%       2.67 =C2=B1 17%      +6.3%       2.8=
3 =C2=B1 13%  interrupts.CPU96.IWI:IRQ_work_interrupts
    565798 =C2=B1 15%      +7.0%     605647            +6.7%     603974    =
    interrupts.CPU96.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU96.MCP:Machine_check_polls
      6828 =C2=B1 28%      -0.1%       6819 =C2=B1 28%     +10.0%       750=
9 =C2=B1 20%  interrupts.CPU96.NMI:Non-maskable_interrupts
      6828 =C2=B1 28%      -0.1%       6819 =C2=B1 28%     +10.0%       750=
9 =C2=B1 20%  interrupts.CPU96.PMI:Performance_monitoring_interrupts
    377.83 =C2=B1 15%     +28.3%     484.83 =C2=B1 58%      -8.4%     346.1=
7 =C2=B1  6%  interrupts.CPU96.RES:Rescheduling_interrupts
      2838 =C2=B1  6%      +0.8%       2859 =C2=B1  7%      +2.7%       291=
5 =C2=B1  4%  interrupts.CPU96.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.147:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.158:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.161:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.171:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.177:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.64:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.71:PCI-MSI.23592960-edge.nvme0q0
      7825 =C2=B1 23%     -11.8%       6899 =C2=B1 19%     -18.8%       635=
3 =C2=B1 22%  interrupts.CPU97.CAL:Function_call_interrupts
      2.33 =C2=B1 20%     +14.3%       2.67 =C2=B1 17%      +0.0%       2.3=
3 =C2=B1 20%  interrupts.CPU97.IWI:IRQ_work_interrupts
    564131 =C2=B1 16%      +7.4%     605632            +7.0%     603893    =
    interrupts.CPU97.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU97.MCP:Machine_check_polls
      6145 =C2=B1 33%     +11.0%       6819 =C2=B1 28%     +11.1%       682=
7 =C2=B1 28%  interrupts.CPU97.NMI:Non-maskable_interrupts
      6145 =C2=B1 33%     +11.0%       6819 =C2=B1 28%     +11.1%       682=
7 =C2=B1 28%  interrupts.CPU97.PMI:Performance_monitoring_interrupts
    398.33 =C2=B1  7%      +1.3%     403.50 =C2=B1  8%      -5.3%     377.1=
7 =C2=B1  7%  interrupts.CPU97.RES:Rescheduling_interrupts
      2788 =C2=B1  3%      -1.7%       2740            -3.6%       2686 =C2=
=B1  4%  interrupts.CPU97.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU98.148:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU98.156:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU98.163:PCI-MSI.23593059-edge.nvme0q99
      5321 =C2=B1 23%     -14.6%       4542 =C2=B1 22%     -11.7%       470=
0 =C2=B1 12%  interrupts.CPU98.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +11.1%       1.67 =C2=B1 28%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU98.IWI:IRQ_work_interrupts
    564374 =C2=B1 16%      +7.3%     605519            +7.0%     603873    =
    interrupts.CPU98.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU98.MCP:Machine_check_polls
      6145 =C2=B1 33%     +11.0%       6822 =C2=B1 28%     +22.2%       751=
1 =C2=B1 20%  interrupts.CPU98.NMI:Non-maskable_interrupts
      6145 =C2=B1 33%     +11.0%       6822 =C2=B1 28%     +22.2%       751=
1 =C2=B1 20%  interrupts.CPU98.PMI:Performance_monitoring_interrupts
    491.17 =C2=B1 24%     -19.7%     394.33 =C2=B1 19%     -10.0%     442.0=
0 =C2=B1 13%  interrupts.CPU98.RES:Rescheduling_interrupts
      2892 =C2=B1  5%      +1.2%       2928 =C2=B1  5%      +0.9%       291=
9 =C2=B1  5%  interrupts.CPU98.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU99.144:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU99.150:PCI-MSI.23593060-edge.nvme0q100
      3703           +12.5%       4165 =C2=B1 16%      +5.9%       3922 =C2=
=B1 10%  interrupts.CPU99.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +25.0%       1.67 =C2=B1 28%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU99.IWI:IRQ_work_interrupts
    563589 =C2=B1 16%      +7.4%     605502            +7.1%     603864    =
    interrupts.CPU99.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU99.MCP:Machine_check_polls
      5461 =C2=B1 35%     +24.9%       6821 =C2=B1 28%     +37.5%       751=
0 =C2=B1 20%  interrupts.CPU99.NMI:Non-maskable_interrupts
      5461 =C2=B1 35%     +24.9%       6821 =C2=B1 28%     +37.5%       751=
0 =C2=B1 20%  interrupts.CPU99.PMI:Performance_monitoring_interrupts
    863.17 =C2=B1138%     -54.9%     389.50 =C2=B1 26%     -57.1%     370.1=
7 =C2=B1 19%  interrupts.CPU99.RES:Rescheduling_interrupts
      2835 =C2=B1  4%      +1.7%       2883 =C2=B1  4%      -0.6%       281=
7 =C2=B1  2%  interrupts.CPU99.TLB:TLB_shootdowns
    402.67 =C2=B1  5%      +2.5%     412.67 =C2=B1  2%      +4.1%     419.3=
3        interrupts.IWI:IRQ_work_interrupts
 1.083e+08 =C2=B1 16%      +7.3%  1.163e+08            +7.0%  1.159e+08    =
    interrupts.LOC:Local_timer_interrupts
    192.00            +0.0%     192.00            +0.0%     192.00        i=
nterrupts.MCP:Machine_check_polls
   1436687 =C2=B1  6%      +1.8%    1463114 =C2=B1  2%      +4.8%    150583=
5        interrupts.NMI:Non-maskable_interrupts
   1436687 =C2=B1  6%      +1.8%    1463114 =C2=B1  2%      +4.8%    150583=
5        interrupts.PMI:Performance_monitoring_interrupts
     66401            -0.5%      66077            +0.6%      66799        i=
nterrupts.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.RTR:APIC_ICR_read_retries
    576474            -0.1%     575678            -0.4%     574225        i=
nterrupts.TLB:TLB_shootdowns

> =

> diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> index 907a6734059c..6debaadb245d 100644
> --- a/include/linux/secretmem.h
> +++ b/include/linux/secretmem.h
> @@ -4,8 +4,26 @@
>  =

>  #ifdef CONFIG_SECRETMEM
>  =

> +extern const struct address_space_operations secretmem_aops;
> +
> +static inline bool page_is_secretmem(struct page *page)
> +{
> +	page =3D compound_head(page);
> +
> +	/*
> +	 * partially open code page_mapping() to avoid calling it on fast
> +	 * path in get_user_pages_fast()
> +	 */
> +	if (PageMappingFlags(page) || PageSlab(page) || PageSwapCache(page))
> +		return false;
> +
> +	if (!page->mapping)
> +		return false;
> +
> +	return page->mapping->a_ops =3D=3D &secretmem_aops;
> +}
> +
>  bool vma_is_secretmem(struct vm_area_struct *vma);
> -bool page_is_secretmem(struct page *page);
>  bool secretmem_active(void);
>  =

>  #else
> diff --git a/mm/secretmem.c b/mm/secretmem.c
> index f2ae3f32a193..cfdb6d9a213d 100644
> --- a/mm/secretmem.c
> +++ b/mm/secretmem.c
> @@ -151,22 +151,12 @@ static void secretmem_freepage(struct page *page)
>  	clear_highpage(page);
>  }
>  =

> -static const struct address_space_operations secretmem_aops =3D {
> +const struct address_space_operations secretmem_aops =3D {
>  	.freepage	=3D secretmem_freepage,
>  	.migratepage	=3D secretmem_migratepage,
>  	.isolate_page	=3D secretmem_isolate_page,
>  };
>  =

> -bool page_is_secretmem(struct page *page)
> -{
> -	struct address_space *mapping =3D page_mapping(page);
> -
> -	if (!mapping)
> -		return false;
> -
> -	return mapping->a_ops =3D=3D &secretmem_aops;
> -}
> -
>  static struct vfsmount *secretmem_mnt;
>  =

>  static struct file *secretmem_file_create(unsigned long flags)
>  =

> -- =

> Sincerely yours,
> Mike.
--===============8883074801367594711==--

