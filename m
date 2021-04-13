Content-Type: multipart/mixed; boundary="===============0510296886432524937=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [mm] 81a779a1a4: will-it-scale.per_thread_ops -4.2% regression
Date: Tue, 13 Apr 2021 09:40:36 +0800
Message-ID: <20210413014036.GA32456@xsang-OptiPlex-9020>
In-Reply-To: <YGSrYs9bNtwlegE7@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0510296886432524937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Mike,

On Wed, Mar 31, 2021 at 08:03:30PM +0300, Mike Rapoport wrote:
> Hi Oliver,
> =

> =

> On Thu, Mar 25, 2021 at 02:47:20PM +0800, Oliver Sang wrote:
> > Hi Mike,
> > =

> > On Sun, Mar 21, 2021 at 01:01:28PM +0200, Mike Rapoport wrote:
> > > Hi Oliver,
> > > =

> > > On Fri, Mar 19, 2021 at 08:51:38PM +0800, Oliver Sang wrote:
> > > > Hi Hike,
> > > > =

> > > > On Fri, Mar 12, 2021 at 06:56:01AM +0200, Mike Rapoport wrote:
> > > > > Hello,
> > > > > =

> > > > > On Wed, Mar 10, 2021 at 09:54:26AM +0800, kernel test robot wrote:
> > > > > > =

> > > > > > Greeting,
> > > > > > =

> > > > > > FYI, we noticed a -4.2% regression of will-it-scale.per_thread_=
ops due to commit:
> > > > > > =

> > > > > > =

> > > > > > commit: 81a779a1a49c8644fd8dc994815a9aa379d10825 ("mm: introduc=
e memfd_secret system call to create "secret" memory areas")
> > > > > > https://git.kernel.org/cgit/linux/kernel/git/rppt/linux.git mem=
fd-secret/v18
> > > > > > =

> > > > > > =

> > > > > > in testcase: will-it-scale
> > > > > > on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU=
 @ 2.30GHz with 192G memory
> > > > > > with following parameters:
> > > > > > =

> > > > > > 	nr_task: 100%
> > > > > > 	mode: thread
> > > > > > 	test: futex1
> > > > > > 	cpufreq_governor: performance
> > > > > > 	ucode: 0x5003006
> > > > > > =

> > > > > > test-description: Will It Scale takes a testcase and runs it fr=
om 1 through to n parallel copies to see if the testcase will scale. It bui=
lds both a process and threads based test in order to see any differences b=
etween the two.
> > > > > > test-url: https://github.com/antonblanchard/will-it-scale
> > > > > > =

> > > > > > =

> > > > > > =

> > > > > > If you fix the issue, kindly add following tag
> > > > > > Reported-by: kernel test robot <oliver.sang@intel.com>
> > > > > =

> > > > > Can you please test the following patch on top of commit: 81a779a=
1a49c
> > > > > ("mm: introduce memfd_secret system call to create "secret" memor=
y areas")
> > > > > to see if it performs better:
> > > > =

> > > > it performs a little better but still has -3.7% regression:
> > > > =

> > > > * e9be99d574c74 (linux-devel/fixup-81a779a1a49c) fix-81a779a1a49c-p=
erf
> > > > * 81a779a1a49c8 mm: introduce memfd_secret system call to create "s=
ecret" memory areas
> > > > * 043463bfe80b8 set_memory: allow querying whether set_direct_map_*=
() is actually enabled
> > > =

> > > Can you please retest with the below patch instead of the previous on=
e:
> > =

> > by below patch, the regression reduced to around -1.7%
> > (please be noted, according to our experience, will-it-scale is normall=
y sensitive
> > to code change as well as test environment, so, at least currently, we =
don't report
> > will-it-scale performance changes if it's less than 3%)
> =

> I've pushed yet another fix to my tree at kernel.org:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git  memfd-sec=
ret/v18.5
> =

> This is based on the current mmotm (v5.12-rc5-mmots-2021-03-30-23-07), the
> patch is below for if you prefer to apply it to the older version.
> =

> I'd really appreciate if you could test it as well.

sorry for late. since we fetched that memfd-secret/v18.5 branch, I firstly =
want
to test directly on that branch, but ran into build issue maybe due to our =
env
problem.

so I still applied below patch to 81a779a1a4. From test, the regression dis=
appeared.


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
  779214d883 ("secretmem: optimize page_is_secretmem()")

043463bfe80b838b 81a779a1a49c8644fd8dc994815 779214d883cea95cf9e86cc70bf =

---------------- --------------------------- --------------------------- =

         %stddev     %change         %stddev     %change         %stddev
             \          |                \          |                \  =

 6.646e+08            -4.2%  6.367e+08            -0.3%  6.629e+08        w=
ill-it-scale.192.threads
      0.09            +1.9%       0.09 =C2=B1  4%      +0.0%       0.09    =
    will-it-scale.192.threads_idle
   3461642            -4.2%    3316208            -0.3%    3452764        w=
ill-it-scale.per_thread_ops
    301.42            -0.0%     301.38            -0.0%     301.39        w=
ill-it-scale.time.elapsed_time
    301.42            -0.0%     301.38            -0.0%     301.39        w=
ill-it-scale.time.elapsed_time.max
      2.50 =C2=B1 20%     -26.7%       1.83 =C2=B1 37%     -46.7%       1.3=
3 =C2=B1 35%  will-it-scale.time.involuntary_context_switches
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    +100.0%       0.6=
7 =C2=B1111%  will-it-scale.time.major_page_faults
      9731            -0.4%       9695            -0.5%       9682        w=
ill-it-scale.time.maximum_resident_set_size
      6505            -0.2%       6493            -0.1%       6498        w=
ill-it-scale.time.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        w=
ill-it-scale.time.page_size
      0.03 =C2=B1 19%      +0.0%       0.03 =C2=B1 19%     +13.3%       0.0=
3 =C2=B1 13%  will-it-scale.time.system_time
      0.04 =C2=B1 14%     -14.3%       0.03           -14.3%       0.03    =
    will-it-scale.time.user_time
     83.50            +2.4%      85.50            +1.0%      84.33        w=
ill-it-scale.time.voluntary_context_switches
 6.646e+08            -4.2%  6.367e+08            -0.3%  6.629e+08        w=
ill-it-scale.workload
    341.57            -0.1%     341.27            +0.6%     343.59        u=
ptime.boot
      6452 =C2=B1  3%      -2.3%       6304 =C2=B1  7%      +8.8%       701=
8 =C2=B1  2%  uptime.idle
     37.75 =C2=B1  4%      -0.5%      37.56 =C2=B1  6%      +4.5%      39.4=
6 =C2=B1  3%  boot-time.boot
     25.37 =C2=B1  7%      -0.5%      25.25 =C2=B1  7%      +3.8%      26.3=
3        boot-time.dhcp
      5724 =C2=B1  5%      -1.6%       5634 =C2=B1  6%      +8.3%       619=
7 =C2=B1  3%  boot-time.idle
      1.72            +0.0%       1.72            +0.1%       1.73        b=
oot-time.smp_boot
      7.08 =C2=B1  2%      +0.0        7.09 =C2=B1  2%      +0.3        7.3=
7 =C2=B1  3%  mpstat.cpu.all.idle%
      0.00 =C2=B1223%      +0.0        0.00 =C2=B1181%      +0.0        0.0=
0 =C2=B1140%  mpstat.cpu.all.iowait%
      1.07 =C2=B1  4%      -0.0        1.05 =C2=B1  6%      +0.0        1.1=
2 =C2=B1  3%  mpstat.cpu.all.irq%
      0.01 =C2=B1  2%      -0.0        0.01 =C2=B1  2%      -0.0        0.0=
1 =C2=B1  2%  mpstat.cpu.all.soft%
     75.10            +0.6       75.74            -0.1       74.97        m=
pstat.cpu.all.sys%
     16.73            -0.6       16.11            -0.2       16.53        m=
pstat.cpu.all.usr%
   2638413 =C2=B1 38%     -24.3%    1998116 =C2=B1 19%      -3.6%    254353=
2 =C2=B1 17%  cpuidle.C1.time
     14334 =C2=B1  6%      -2.2%      14020 =C2=B1 18%     +56.4%      2242=
5 =C2=B1 51%  cpuidle.C1.usage
 1.989e+08 =C2=B1 67%     -13.3%  1.724e+08 =C2=B1 69%     -23.9%  1.513e+0=
8 =C2=B1 85%  cpuidle.C1E.time
    459733 =C2=B1 55%      +6.2%     488139 =C2=B1 29%      -5.2%     43591=
2 =C2=B1 46%  cpuidle.C1E.usage
 1.683e+08 =C2=B1 85%      +6.4%   1.79e+08 =C2=B1 66%     +25.0%  2.103e+0=
8 =C2=B1 65%  cpuidle.C6.time
    306368 =C2=B1 49%      +3.1%     315917 =C2=B1 45%     +19.6%     36627=
2 =C2=B1 42%  cpuidle.C6.usage
     48603 =C2=B1131%     -63.6%      17706 =C2=B1  9%     -62.7%      1813=
9 =C2=B1 14%  cpuidle.POLL.time
      7131 =C2=B1 92%     -40.4%       4249 =C2=B1 13%     -41.9%       414=
2 =C2=B1 12%  cpuidle.POLL.usage
    301.42            -0.0%     301.38            -0.0%     301.39        t=
ime.elapsed_time
    301.42            -0.0%     301.38            -0.0%     301.39        t=
ime.elapsed_time.max
      2.50 =C2=B1 20%     -26.7%       1.83 =C2=B1 37%     -46.7%       1.3=
3 =C2=B1 35%  time.involuntary_context_switches
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%    +100.0%       0.6=
7 =C2=B1111%  time.major_page_faults
      9731            -0.4%       9695            -0.5%       9682        t=
ime.maximum_resident_set_size
      6505            -0.2%       6493            -0.1%       6498        t=
ime.minor_page_faults
      4096            +0.0%       4096            +0.0%       4096        t=
ime.page_size
      0.03 =C2=B1 19%      +0.0%       0.03 =C2=B1 19%     +13.3%       0.0=
3 =C2=B1 13%  time.system_time
      0.04 =C2=B1 14%     -14.3%       0.03           -14.3%       0.03    =
    time.user_time
     83.50            +2.4%      85.50            +1.0%      84.33        t=
ime.voluntary_context_switches
      0.17 =C2=B1223%    -100.0%       0.00          +200.0%       0.50 =C2=
=B1100%  vmstat.cpu.id
     80.83            +1.2%      81.83            +0.0%      80.83        v=
mstat.cpu.sy
     17.00            -4.9%      16.17 =C2=B1  2%      +0.0%      17.00    =
    vmstat.cpu.us
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.cpu.wa
      0.00          -100.0%       0.00          -100.0%       0.00        v=
mstat.io.bi
   1803056            +0.2%    1806427            -0.1%    1801938        v=
mstat.memory.cache
 1.938e+08            +0.0%  1.939e+08            -0.0%  1.938e+08        v=
mstat.memory.free
    190.00            +0.0%     190.00            +0.1%     190.17        v=
mstat.procs.r
      2128            -0.1%       2126            -0.6%       2115        v=
mstat.system.cs
    368851 =C2=B1 15%      +7.2%     395313            +7.2%     395270    =
    vmstat.system.in
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node0.interleave_hit
    222158 =C2=B1 20%      -4.0%     213280 =C2=B1  4%     +13.9%     25294=
3 =C2=B1 12%  numa-numastat.node0.local_node
    302433 =C2=B1 12%      -3.9%     290488 =C2=B1  2%      -2.1%     29619=
6 =C2=B1  2%  numa-numastat.node0.numa_hit
     80276 =C2=B1 10%      -3.8%      77208 =C2=B1 11%     -46.1%      4326=
9 =C2=B1 62%  numa-numastat.node0.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node1.interleave_hit
    250553 =C2=B1 20%      -5.4%     237115 =C2=B1 20%     -11.3%     22215=
2 =C2=B1 15%  numa-numastat.node1.local_node
    300047 =C2=B1  7%      -0.7%     297991 =C2=B1  7%      +0.5%     30150=
8 =C2=B1 11%  numa-numastat.node1.numa_hit
     49503 =C2=B1 63%     +23.0%      60882 =C2=B1 50%     +60.3%      7935=
5 =C2=B1 10%  numa-numastat.node1.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node2.interleave_hit
    232597 =C2=B1 19%      -8.2%     213623 =C2=B1 15%      -4.5%     22222=
2 =C2=B1 13%  numa-numastat.node2.local_node
    293458 =C2=B1  4%      -2.6%     285768 =C2=B1  3%      -1.8%     28824=
0 =C2=B1  2%  numa-numastat.node2.numa_hit
     60874 =C2=B1 50%     +18.5%      72155 =C2=B1 34%      +8.5%      6602=
5 =C2=B1 34%  numa-numastat.node2.other_node
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-numastat.node3.interleave_hit
    394406 =C2=B1 16%     +10.1%     434203 =C2=B1 12%      +2.7%     40520=
1 =C2=B1 10%  numa-numastat.node3.local_node
    463448 =C2=B1 10%      +4.4%     483694 =C2=B1  4%      +2.8%     47629=
8 =C2=B1  8%  numa-numastat.node3.numa_hit
     69045 =C2=B1 34%     -28.3%      49505 =C2=B1 75%      +3.0%      7110=
0 =C2=B1 26%  numa-numastat.node3.other_node
    425622            +0.6%     428239            +0.6%     428158        m=
eminfo.Active
    425622            +0.6%     428239            +0.6%     428158        m=
eminfo.Active(anon)
    278244            -1.0%     275505            -0.9%     275865        m=
eminfo.AnonHugePages
    430291            -0.3%     429140            +0.0%     430377        m=
eminfo.AnonPages
   1669221            +0.2%    1672709            -0.0%    1668980        m=
eminfo.Cached
    189912            +0.0%     189912            +0.0%     189912        m=
eminfo.CmaFree
    204800            +0.0%     204800            +0.0%     204800        m=
eminfo.CmaTotal
  98857496            -0.0%   98857492            -0.0%   98857492        m=
eminfo.CommitLimit
   2497691            +0.1%    2499688            +0.3%    2504506        m=
eminfo.Committed_AS
  1.88e+08            +0.3%  1.886e+08            -0.3%  1.875e+08        m=
eminfo.DirectMap1G
  13603157 =C2=B1  5%      -4.0%   13065557 =C2=B1  5%      +4.3%   1418137=
6 =C2=B1  5%  meminfo.DirectMap2M
   1460309 =C2=B1  4%      +0.9%    1473621 =C2=B1  4%      -3.7%    140637=
8 =C2=B1  5%  meminfo.DirectMap4k
      2048            +0.0%       2048            +0.0%       2048        m=
eminfo.Hugepagesize
    491903            -0.0%     491716            +0.4%     494064        m=
eminfo.Inactive
    491903            -0.0%     491716            +0.4%     494064        m=
eminfo.Inactive(anon)
    133300            +0.2%     133585            -0.6%     132493        m=
eminfo.KReclaimable
     32439            +0.2%      32502            +0.1%      32481        m=
eminfo.KernelStack
    106397 =C2=B1  6%      +1.0%     107443 =C2=B1  3%      +2.9%     10946=
2 =C2=B1  3%  meminfo.Mapped
 1.931e+08            +0.0%  1.932e+08            -0.0%  1.931e+08        m=
eminfo.MemAvailable
 1.938e+08            +0.0%  1.939e+08            -0.0%  1.938e+08        m=
eminfo.MemFree
 1.977e+08            -0.0%  1.977e+08            -0.0%  1.977e+08        m=
eminfo.MemTotal
   3908658            -1.2%    3860836            +0.1%    3911880        m=
eminfo.Memused
      1153 =C2=B1 70%     -49.9%     577.50 =C2=B1141%     -49.9%     577.8=
3 =C2=B1141%  meminfo.Mlocked
      6289 =C2=B1  2%      -0.6%       6250 =C2=B1  2%      +1.3%       637=
2        meminfo.PageTables
    103001            +0.2%     103161            +0.1%     103063        m=
eminfo.Percpu
    133300            +0.2%     133585            -0.6%     132493        m=
eminfo.SReclaimable
    294723            +0.2%     295285 =C2=B1  2%      -0.2%     294260    =
    meminfo.SUnreclaim
    487695 =C2=B1  2%      +0.7%     491184            +0.9%     492219    =
    meminfo.Shmem
    428024            +0.2%     428871            -0.3%     426754        m=
eminfo.Slab
   1181692            -0.0%    1181608            -0.4%    1176844        m=
eminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10            +0.0%  3.436e+10        m=
eminfo.VmallocTotal
    315332            -0.1%     314993            +0.1%     315582        m=
eminfo.VmallocUsed
   4779774            -0.8%    4739187 =C2=B1  2%      -0.2%    4768708    =
    meminfo.max_used_kB
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.compact_isolated
    106385            +0.7%     107144            +0.6%     107014        p=
roc-vmstat.nr_active_anon
    107676            -0.3%     107367            -0.0%     107674        p=
roc-vmstat.nr_anon_pages
    135.50            -1.0%     134.17            -0.7%     134.50        p=
roc-vmstat.nr_anon_transparent_hugepages
   4819784            +0.0%    4820986            -0.0%    4819721        p=
roc-vmstat.nr_dirty_background_threshold
   9651353            +0.0%    9653760            -0.0%    9651228        p=
roc-vmstat.nr_dirty_threshold
    417279            +0.2%     418090            -0.0%     417198        p=
roc-vmstat.nr_file_pages
     47478            +0.0%      47478            +0.0%      47478        p=
roc-vmstat.nr_free_cma
  48451330            +0.0%   48463367            -0.0%   48450702        p=
roc-vmstat.nr_free_pages
    123072            -0.2%     122836            +0.4%     123575        p=
roc-vmstat.nr_inactive_anon
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        proc-vmstat.nr_isolated_anon
     32446            +0.2%      32503            +0.1%      32483        p=
roc-vmstat.nr_kernel_stack
     26576 =C2=B1  5%      +0.8%      26775 =C2=B1  3%      +3.0%      2736=
8 =C2=B1  2%  proc-vmstat.nr_mapped
    288.17 =C2=B1 70%     -50.0%     144.00 =C2=B1141%     -50.0%     144.1=
7 =C2=B1141%  proc-vmstat.nr_mlock
      1572 =C2=B1  2%      -0.7%       1561 =C2=B1  2%      +1.2%       159=
1        proc-vmstat.nr_page_table_pages
    121898 =C2=B1  2%      +0.7%     122709            +0.9%     123008    =
    proc-vmstat.nr_shmem
     33325            +0.2%      33396            -0.6%      33124        p=
roc-vmstat.nr_slab_reclaimable
     73681            +0.2%      73822 =C2=B1  2%      -0.2%      73565    =
    proc-vmstat.nr_slab_unreclaimable
    295423            -0.0%     295401            -0.4%     294210        p=
roc-vmstat.nr_unevictable
    106385            +0.7%     107144            +0.6%     107014        p=
roc-vmstat.nr_zone_active_anon
    123072            -0.2%     122836            +0.4%     123575        p=
roc-vmstat.nr_zone_inactive_anon
    295423            -0.0%     295401            -0.4%     294210        p=
roc-vmstat.nr_zone_unevictable
     31372 =C2=B1 11%     +11.2%      34899 =C2=B1  7%      +6.9%      3354=
0 =C2=B1  2%  proc-vmstat.numa_hint_faults
     29707 =C2=B1 10%     +10.9%      32937 =C2=B1  8%      +8.0%      3207=
6 =C2=B1  2%  proc-vmstat.numa_hint_faults_local
   1395571            +0.2%    1398636            +0.3%    1399322        p=
roc-vmstat.numa_hit
    408.50 =C2=B1  8%      +6.4%     434.50 =C2=B1  5%      +4.5%     427.0=
0 =C2=B1  4%  proc-vmstat.numa_huge_pte_updates
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.numa_interleave
   1135859            +0.3%    1138874            +0.3%    1139561        p=
roc-vmstat.numa_local
    259712            +0.0%     259762            +0.0%     259761        p=
roc-vmstat.numa_other
     15734 =C2=B1 80%      -5.3%      14907 =C2=B1111%     -19.1%      1272=
4 =C2=B1115%  proc-vmstat.numa_pages_migrated
    419338 =C2=B1  4%      +2.7%     430486 =C2=B1  3%      +1.5%     42568=
5 =C2=B1  2%  proc-vmstat.numa_pte_updates
    171894 =C2=B1  2%      +0.6%     172952            +1.3%     174097    =
    proc-vmstat.pgactivate
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgalloc_dma32
   1525449            -0.1%    1524042            +0.0%    1525513        p=
roc-vmstat.pgalloc_normal
   1359120            +0.2%    1362055            +0.4%    1364610        p=
roc-vmstat.pgfault
   1388637 =C2=B1  5%      -1.8%    1364025 =C2=B1  6%      +3.3%    143402=
7 =C2=B1  2%  proc-vmstat.pgfree
     15734 =C2=B1 80%      -5.3%      14907 =C2=B1111%     -19.1%      1272=
4 =C2=B1115%  proc-vmstat.pgmigrate_success
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgpgin
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.pgpgout
     64986            -0.8%      64485            +1.0%      65649        p=
roc-vmstat.pgreuse
    149.83            +0.7%     150.83 =C2=B1  2%      +0.7%     150.83 =C2=
=B1  2%  proc-vmstat.thp_collapse_alloc
      9.00 =C2=B1141%      +0.0%       9.00 =C2=B1141%      +0.0%       9.0=
0 =C2=B1141%  proc-vmstat.thp_deferred_split_page
     57.00            +0.6%      57.33            +0.6%      57.33        p=
roc-vmstat.thp_fault_alloc
      9.00 =C2=B1141%      +0.0%       9.00 =C2=B1141%      +0.0%       9.0=
0 =C2=B1141%  proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00          -100.0%       0.00        p=
roc-vmstat.thp_zero_page_alloc
     82.00 =C2=B1 49%     -35.2%      53.17 =C2=B1 76%     -35.2%      53.1=
7 =C2=B1 76%  proc-vmstat.unevictable_pgs_culled
    390.67 =C2=B1 70%     -50.0%     195.33 =C2=B1141%     -50.0%     195.3=
3 =C2=B1141%  proc-vmstat.unevictable_pgs_mlocked
      0.03 =C2=B1 23%     +20.0%       0.04 =C2=B1 25%     +16.8%       0.0=
4 =C2=B1 30%  perf-stat.i.MPKI
 9.582e+10            +0.9%  9.666e+10            +2.8%  9.849e+10        p=
erf-stat.i.branch-instructions
      0.20            -0.0        0.19            -0.0        0.19        p=
erf-stat.i.branch-miss-rate%
 1.852e+08            -5.3%  1.754e+08            -4.3%  1.773e+08        p=
erf-stat.i.branch-misses
     15.60 =C2=B1  3%      -0.6       15.04            -0.1       15.49 =C2=
=B1  4%  perf-stat.i.cache-miss-rate%
   1235422 =C2=B1  5%      -1.2%    1220958 =C2=B1  4%      +4.1%    128668=
7 =C2=B1  5%  perf-stat.i.cache-misses
   7939113 =C2=B1  3%      +2.5%    8136349 =C2=B1  6%      +5.0%    833875=
8 =C2=B1  5%  perf-stat.i.cache-references
      2078            -0.2%       2073            -0.6%       2065        p=
erf-stat.i.context-switches
      0.90            +0.4%       0.90            -1.4%       0.88        p=
erf-stat.i.cpi
    191995            +0.0%     191996            -0.0%     191993        p=
erf-stat.i.cpu-clock
 5.552e+11            -0.1%  5.544e+11            -0.3%  5.537e+11        p=
erf-stat.i.cpu-cycles
    259.22            -0.7%     257.42            -0.6%     257.60        p=
erf-stat.i.cpu-migrations
    607765 =C2=B1  6%      +1.3%     615930 =C2=B1  7%      -4.9%     57774=
2 =C2=B1  8%  perf-stat.i.cycles-between-cache-misses
      0.00 =C2=B1 26%      +0.0        0.00 =C2=B1 27%      +0.0        0.0=
0 =C2=B1 26%  perf-stat.i.dTLB-load-miss-rate%
    569436 =C2=B1  6%     +11.2%     633136 =C2=B1  4%     +17.0%     66622=
8 =C2=B1  3%  perf-stat.i.dTLB-load-misses
 1.485e+11            -0.6%  1.477e+11            +1.7%  1.509e+11        p=
erf-stat.i.dTLB-loads
      0.00 =C2=B1  9%      +0.0        0.00 =C2=B1 15%      +0.0        0.0=
0 =C2=B1 17%  perf-stat.i.dTLB-store-miss-rate%
    153239 =C2=B1 13%      +4.9%     160805            +7.8%     165160    =
    perf-stat.i.dTLB-store-misses
 1.033e+11            -3.2%      1e+11            -0.3%   1.03e+11        p=
erf-stat.i.dTLB-stores
     99.01            +0.2       99.17            +0.4       99.44        p=
erf-stat.i.iTLB-load-miss-rate%
 2.455e+08 =C2=B1 17%     -24.0%  1.867e+08 =C2=B1  3%     -21.5%  1.927e+0=
8 =C2=B1  2%  perf-stat.i.iTLB-load-misses
   1719010 =C2=B1 11%     -29.0%    1221344 =C2=B1 11%     -55.4%     76742=
3 =C2=B1 17%  perf-stat.i.iTLB-loads
 6.203e+11            -0.4%  6.175e+11            +1.3%  6.284e+11        p=
erf-stat.i.instructions
      2975 =C2=B1  9%     +11.5%       3318 =C2=B1  3%     +10.0%       327=
1 =C2=B1  2%  perf-stat.i.instructions-per-iTLB-miss
      1.12            -0.3%       1.11            +1.5%       1.13        p=
erf-stat.i.ipc
      2.13 =C2=B1 18%      -6.2%       2.00 =C2=B1  4%     +10.2%       2.3=
5 =C2=B1 21%  perf-stat.i.major-faults
      2.89            -0.1%       2.89            -0.3%       2.88        p=
erf-stat.i.metric.GHz
      1.41 =C2=B1  7%      +3.9%       1.46 =C2=B1  2%      +9.2%       1.5=
4        perf-stat.i.metric.K/sec
      1810            -0.9%       1793            +1.4%       1835        p=
erf-stat.i.metric.M/sec
      4354            +0.3%       4368            +0.2%       4364        p=
erf-stat.i.minor-faults
     90.38            -0.1       90.26            -0.1       90.27        p=
erf-stat.i.node-load-miss-rate%
    270733 =C2=B1  3%      -0.8%     268656            +3.1%     279009    =
    perf-stat.i.node-load-misses
    186483 =C2=B1 10%      -1.5%     183640 =C2=B1  4%      +0.8%     18801=
3 =C2=B1  9%  perf-stat.i.node-loads
     94.16            +0.1       94.31            +0.2       94.41        p=
erf-stat.i.node-store-miss-rate%
     98285 =C2=B1  3%      -1.1%      97165 =C2=B1  3%      +1.1%      9940=
6 =C2=B1  3%  perf-stat.i.node-store-misses
     15077 =C2=B1 19%      -4.3%      14429 =C2=B1 18%      -5.6%      1424=
0 =C2=B1  8%  perf-stat.i.node-stores
      4356            +0.3%       4370            +0.2%       4366        p=
erf-stat.i.page-faults
    191995            +0.0%     191996            -0.0%     191993        p=
erf-stat.i.task-clock
      0.01 =C2=B1  3%      +2.8%       0.01 =C2=B1  6%      +3.7%       0.0=
1 =C2=B1  5%  perf-stat.overall.MPKI
      0.19            -0.0        0.18            -0.0        0.18        p=
erf-stat.overall.branch-miss-rate%
     15.62 =C2=B1  2%      -0.5       15.17 =C2=B1  2%      -0.1       15.5=
4 =C2=B1  3%  perf-stat.overall.cache-miss-rate%
      0.90            +0.3%       0.90            -1.6%       0.88        p=
erf-stat.overall.cpi
    441721 =C2=B1  5%      +0.5%     444092 =C2=B1  4%      -4.4%     42218=
0 =C2=B1  5%  perf-stat.overall.cycles-between-cache-misses
      0.00 =C2=B1  7%      +0.0        0.00 =C2=B1  4%      +0.0        0.0=
0 =C2=B1  3%  perf-stat.overall.dTLB-load-miss-rate%
      0.00 =C2=B1 13%      +0.0        0.00            +0.0        0.00    =
    perf-stat.overall.dTLB-store-miss-rate%
     99.28            +0.1       99.35            +0.3       99.60        p=
erf-stat.overall.iTLB-load-miss-rate%
      2622 =C2=B1 20%     +26.3%       3312 =C2=B1  3%     +24.5%       326=
3 =C2=B1  2%  perf-stat.overall.instructions-per-iTLB-miss
      1.12            -0.3%       1.11            +1.6%       1.13        p=
erf-stat.overall.ipc
     56.57 =C2=B1  2%      -0.5       56.09 =C2=B1  2%      +0.3       56.8=
6 =C2=B1  5%  perf-stat.overall.node-load-miss-rate%
     86.57 =C2=B1  2%      +0.4       86.95 =C2=B1  2%      +0.8       87.3=
5        perf-stat.overall.node-store-miss-rate%
    281289            +3.9%     292341            +1.5%     285501        p=
erf-stat.overall.path-length
  9.55e+10            +0.9%  9.633e+10            +2.8%  9.816e+10        p=
erf-stat.ps.branch-instructions
 1.846e+08            -5.3%  1.748e+08            -4.3%  1.767e+08        p=
erf-stat.ps.branch-misses
   1255953 =C2=B1  5%      -0.7%    1246710 =C2=B1  4%      +4.4%    131105=
9 =C2=B1  5%  perf-stat.ps.cache-misses
   8035643 =C2=B1  3%      +2.4%    8226303 =C2=B1  6%      +5.1%    844471=
1 =C2=B1  5%  perf-stat.ps.cache-references
      2068            -0.2%       2064            -0.6%       2056        p=
erf-stat.ps.context-switches
    191354            +0.0%     191356            -0.0%     191352        p=
erf-stat.ps.cpu-clock
 5.533e+11            -0.1%  5.525e+11            -0.3%  5.519e+11        p=
erf-stat.ps.cpu-cycles
    258.09            -0.6%     256.53            -0.6%     256.50        p=
erf-stat.ps.cpu-migrations
    570402 =C2=B1  7%     +11.5%     635806 =C2=B1  4%     +18.1%     67385=
8 =C2=B1  3%  perf-stat.ps.dTLB-load-misses
  1.48e+11            -0.6%  1.472e+11            +1.7%  1.504e+11        p=
erf-stat.ps.dTLB-loads
    153008 =C2=B1 13%      +4.9%     160538            +7.8%     164958    =
    perf-stat.ps.dTLB-store-misses
 1.029e+11            -3.2%  9.966e+10            -0.3%  1.026e+11        p=
erf-stat.ps.dTLB-stores
 2.445e+08 =C2=B1 17%     -23.9%   1.86e+08 =C2=B1  3%     -21.5%   1.92e+0=
8 =C2=B1  2%  perf-stat.ps.iTLB-load-misses
   1714242 =C2=B1 11%     -29.0%    1216775 =C2=B1 11%     -55.4%     76465=
3 =C2=B1 17%  perf-stat.ps.iTLB-loads
 6.182e+11            -0.4%  6.154e+11            +1.3%  6.263e+11        p=
erf-stat.ps.instructions
      2.12 =C2=B1 18%      -6.2%       1.99 =C2=B1  4%     +10.1%       2.3=
3 =C2=B1 21%  perf-stat.ps.major-faults
      4355            +0.3%       4367            +0.4%       4373        p=
erf-stat.ps.minor-faults
    270103 =C2=B1  3%      -0.8%     268012            +3.1%     278583    =
    perf-stat.ps.node-load-misses
    207587 =C2=B1  5%      +1.2%     210176 =C2=B1  6%      +2.4%     21246=
7 =C2=B1 11%  perf-stat.ps.node-loads
     98059 =C2=B1  3%      -1.2%      96927 =C2=B1  3%      +1.2%      9924=
5 =C2=B1  3%  perf-stat.ps.node-store-misses
     15229 =C2=B1 19%      -4.3%      14575 =C2=B1 18%      -5.7%      1436=
0 =C2=B1  8%  perf-stat.ps.node-stores
      4357            +0.3%       4369            +0.4%       4376        p=
erf-stat.ps.page-faults
    191354            +0.0%     191356            -0.0%     191352        p=
erf-stat.ps.task-clock
  1.87e+14            -0.4%  1.861e+14            +1.2%  1.893e+14        p=
erf-stat.total.instructions
     40037 =C2=B1193%     -80.8%       7697 =C2=B1 58%     -76.3%       947=
8 =C2=B1 63%  numa-meminfo.node0.Active
     40037 =C2=B1193%     -80.8%       7697 =C2=B1 58%     -76.3%       947=
8 =C2=B1 63%  numa-meminfo.node0.Active(anon)
     77851 =C2=B1 72%     -20.0%      62301 =C2=B1 68%     -10.3%      6981=
5 =C2=B1 76%  numa-meminfo.node0.AnonHugePages
    112119 =C2=B1 61%     -14.9%      95441 =C2=B1 59%      -2.6%     10920=
3 =C2=B1 60%  numa-meminfo.node0.AnonPages
    180432 =C2=B1 44%      -0.6%     179398 =C2=B1 77%     +60.7%     28996=
8 =C2=B1 55%  numa-meminfo.node0.AnonPages.max
    342321 =C2=B1 24%     -13.5%     296200            -8.4%     313541 =C2=
=B1  6%  numa-meminfo.node0.FilePages
    122837 =C2=B1 52%     -19.4%      98955 =C2=B1 59%      -9.2%     11156=
0 =C2=B1 59%  numa-meminfo.node0.Inactive
    122837 =C2=B1 52%     -19.4%      98955 =C2=B1 59%      -9.2%     11156=
0 =C2=B1 59%  numa-meminfo.node0.Inactive(anon)
     30053 =C2=B1 17%      -9.9%      27074 =C2=B1 12%     +31.9%      3964=
2 =C2=B1 26%  numa-meminfo.node0.KReclaimable
      9328 =C2=B1  4%     -10.2%       8378 =C2=B1  5%      -3.8%       897=
1 =C2=B1 14%  numa-meminfo.node0.KernelStack
     23813 =C2=B1 34%     -18.7%      19362 =C2=B1  9%     -17.9%      1955=
0 =C2=B1  9%  numa-meminfo.node0.Mapped
  48212518            +0.2%   48303244            -0.0%   48211411        n=
uma-meminfo.node0.MemFree
  49156876            +0.0%   49156876            +0.0%   49156876        n=
uma-meminfo.node0.MemTotal
    944356 =C2=B1  8%      -9.6%     853630 =C2=B1  8%      +0.1%     94546=
3 =C2=B1 12%  numa-meminfo.node0.MemUsed
    244.67 =C2=B1 70%     -49.7%     123.00 =C2=B1141%     -49.9%     122.6=
7 =C2=B1141%  numa-meminfo.node0.Mlocked
      1209 =C2=B1 21%     -11.2%       1074 =C2=B1 31%     +55.2%       187=
8 =C2=B1 57%  numa-meminfo.node0.PageTables
     30053 =C2=B1 17%      -9.9%      27074 =C2=B1 12%     +31.9%      3964=
2 =C2=B1 26%  numa-meminfo.node0.SReclaimable
     86869 =C2=B1 14%      -9.4%      78720 =C2=B1 14%      +7.4%      9329=
6 =C2=B1 17%  numa-meminfo.node0.SUnreclaim
     50827 =C2=B1171%     -77.8%      11290 =C2=B1 40%     -76.6%      1190=
5 =C2=B1 68%  numa-meminfo.node0.Shmem
    116923 =C2=B1 13%      -9.5%     105795 =C2=B1 11%     +13.7%     13293=
9 =C2=B1 19%  numa-meminfo.node0.Slab
    291494 =C2=B1  3%      -2.3%     284909            +3.5%     301635 =C2=
=B1  6%  numa-meminfo.node0.Unevictable
     20248 =C2=B1163%      +5.3%      21319 =C2=B1160%    +102.1%      4091=
6 =C2=B1200%  numa-meminfo.node1.Active
     20248 =C2=B1163%      +5.3%      21319 =C2=B1160%    +102.1%      4091=
6 =C2=B1200%  numa-meminfo.node1.Active(anon)
     55706 =C2=B1 75%     +79.1%      99793 =C2=B1 58%     +50.2%      8364=
3 =C2=B1 79%  numa-meminfo.node1.AnonHugePages
     94298 =C2=B1 53%     +50.5%     141885 =C2=B1 51%     +29.7%     12231=
9 =C2=B1 70%  numa-meminfo.node1.AnonPages
    186072 =C2=B1 68%     +17.4%     218444 =C2=B1 50%     -15.5%     15716=
6 =C2=B1 47%  numa-meminfo.node1.AnonPages.max
    322944 =C2=B1 14%      +0.0%     323081 =C2=B1 15%      +4.6%     33796=
1 =C2=B1 28%  numa-meminfo.node1.FilePages
     97848 =C2=B1 53%     +50.5%     147262 =C2=B1 48%     +35.4%     13253=
4 =C2=B1 59%  numa-meminfo.node1.Inactive
     97848 =C2=B1 53%     +50.5%     147262 =C2=B1 48%     +35.4%     13253=
4 =C2=B1 59%  numa-meminfo.node1.Inactive(anon)
     36663 =C2=B1 34%     -14.1%      31485 =C2=B1 36%     -34.3%      2409=
0 =C2=B1 12%  numa-meminfo.node1.KReclaimable
      7925 =C2=B1  7%      +7.8%       8543 =C2=B1 10%      -2.4%       773=
2 =C2=B1  5%  numa-meminfo.node1.KernelStack
     19429 =C2=B1 11%      +2.2%      19855 =C2=B1  7%     +29.3%      2512=
8 =C2=B1 38%  numa-meminfo.node1.Mapped
  48666212            -0.1%   48623218            +0.0%   48671439        n=
uma-meminfo.node1.MemFree
  49534456            +0.0%   49534456            +0.0%   49534456        n=
uma-meminfo.node1.MemTotal
    868242 =C2=B1 13%      +5.0%     911236 =C2=B1  6%      -0.6%     86301=
6 =C2=B1 10%  numa-meminfo.node1.MemUsed
    246.00 =C2=B1 70%     -49.8%     123.50 =C2=B1141%     -49.8%     123.5=
0 =C2=B1141%  numa-meminfo.node1.Mlocked
      1950 =C2=B1 51%     -10.4%       1747 =C2=B1 52%     -45.6%       106=
1 =C2=B1 22%  numa-meminfo.node1.PageTables
     36663 =C2=B1 34%     -14.1%      31485 =C2=B1 36%     -34.3%      2409=
0 =C2=B1 12%  numa-meminfo.node1.SReclaimable
     71197 =C2=B1 20%      +4.9%      74705 =C2=B1 10%     -14.4%      6093=
7 =C2=B1 10%  numa-meminfo.node1.SUnreclaim
     23869 =C2=B1155%     +12.0%      26735 =C2=B1134%    +114.5%      5119=
8 =C2=B1189%  numa-meminfo.node1.Shmem
    107861 =C2=B1 25%      -1.5%     106191 =C2=B1 14%     -21.2%      8502=
8 =C2=B1  6%  numa-meminfo.node1.Slab
    299074 =C2=B1  5%      -0.9%     296346 =C2=B1  5%      -4.1%     28676=
3        numa-meminfo.node1.Unevictable
      8982 =C2=B1100%     -41.3%       5271 =C2=B1 80%     -63.1%       331=
4 =C2=B1 52%  numa-meminfo.node2.Active
      8982 =C2=B1100%     -41.3%       5271 =C2=B1 80%     -63.1%       331=
4 =C2=B1 52%  numa-meminfo.node2.Active(anon)
    103304 =C2=B1 58%     -50.0%      51662 =C2=B1 75%      -7.2%      9591=
1 =C2=B1 62%  numa-meminfo.node2.AnonHugePages
    147906 =C2=B1 47%     -43.4%      83659 =C2=B1 59%      -5.8%     13929=
0 =C2=B1 49%  numa-meminfo.node2.AnonPages
    296653 =C2=B1 52%     -42.6%     170244 =C2=B1 77%     -18.3%     24235=
4 =C2=B1 58%  numa-meminfo.node2.AnonPages.max
    316927 =C2=B1  5%      -2.8%     308110 =C2=B1  4%      -2.6%     30867=
9 =C2=B1  6%  numa-meminfo.node2.FilePages
    154525 =C2=B1 44%     -40.2%      92366 =C2=B1 53%      -5.9%     14538=
0 =C2=B1 45%  numa-meminfo.node2.Inactive
    154525 =C2=B1 44%     -40.2%      92366 =C2=B1 53%      -5.9%     14538=
0 =C2=B1 45%  numa-meminfo.node2.Inactive(anon)
     37460 =C2=B1 22%     -14.5%      32039 =C2=B1 32%     -23.8%      2856=
0 =C2=B1 27%  numa-meminfo.node2.KReclaimable
      7866 =C2=B1 13%      -6.4%       7362 =C2=B1  6%      +1.7%       799=
8 =C2=B1 10%  numa-meminfo.node2.KernelStack
     21518 =C2=B1 17%      +7.3%      23094 =C2=B1  4%      +0.9%      2171=
9 =C2=B1 15%  numa-meminfo.node2.Mapped
  48610105            +0.2%   48721446            +0.1%   48660711        n=
uma-meminfo.node2.MemFree
  49534460            +0.0%   49534460            +0.0%   49534460        n=
uma-meminfo.node2.MemTotal
    924353 =C2=B1  8%     -12.0%     813012 =C2=B1  9%      -5.5%     87374=
7 =C2=B1  7%  numa-meminfo.node2.MemUsed
    330.83 =C2=B1 77%     -38.1%     204.67 =C2=B1141%     -50.3%     164.5=
0 =C2=B1148%  numa-meminfo.node2.Mlocked
      1817 =C2=B1 57%     -31.9%       1238 =C2=B1 61%      -8.6%       166=
1 =C2=B1 47%  numa-meminfo.node2.PageTables
     37460 =C2=B1 22%     -14.5%      32039 =C2=B1 32%     -23.8%      2856=
0 =C2=B1 27%  numa-meminfo.node2.SReclaimable
     73467 =C2=B1 24%     -10.2%      65958 =C2=B1 14%     -11.3%      6515=
2 =C2=B1 19%  numa-meminfo.node2.SUnreclaim
     15755 =C2=B1 58%     -10.2%      14141 =C2=B1 29%     -39.6%       951=
7 =C2=B1 61%  numa-meminfo.node2.Shmem
    110927 =C2=B1 23%     -11.7%      97998 =C2=B1 19%     -15.5%      9371=
3 =C2=B1 21%  numa-meminfo.node2.Slab
    301255 =C2=B1  5%      -2.4%     294050 =C2=B1  5%      -0.7%     29920=
3 =C2=B1  6%  numa-meminfo.node2.Unevictable
    356390 =C2=B1 29%     +10.8%     394733 =C2=B1  8%      +5.2%     37485=
5 =C2=B1 21%  numa-meminfo.node3.Active
    356390 =C2=B1 29%     +10.8%     394733 =C2=B1  8%      +5.2%     37485=
5 =C2=B1 21%  numa-meminfo.node3.Active(anon)
     41357 =C2=B1 39%     +49.0%      61603 =C2=B1 85%     -35.8%      2655=
2 =C2=B1 11%  numa-meminfo.node3.AnonHugePages
     76088 =C2=B1 29%     +42.1%     108092 =C2=B1 60%     -21.4%      5982=
4 =C2=B1 16%  numa-meminfo.node3.AnonPages
    171664 =C2=B1 11%     +20.9%     207550 =C2=B1 32%     +41.4%     24267=
8 =C2=B1 54%  numa-meminfo.node3.AnonPages.max
    686790 =C2=B1 16%      +8.5%     744949 =C2=B1  6%      +3.1%     70833=
7 =C2=B1 13%  numa-meminfo.node3.FilePages
    116554 =C2=B1 14%     +30.3%     151914 =C2=B1 41%     -10.8%     10398=
0 =C2=B1 18%  numa-meminfo.node3.Inactive
    116554 =C2=B1 14%     +30.3%     151914 =C2=B1 41%     -10.8%     10398=
0 =C2=B1 18%  numa-meminfo.node3.Inactive(anon)
     29122 =C2=B1 32%     +47.6%      42988 =C2=B1 28%     +38.0%      4019=
7 =C2=B1 18%  numa-meminfo.node3.KReclaimable
      7319 =C2=B1  5%     +12.3%       8218 =C2=B1  8%      +6.2%       777=
1 =C2=B1 12%  numa-meminfo.node3.KernelStack
     40789 =C2=B1 21%      +5.7%      43098 =C2=B1  8%      +2.7%      4190=
5 =C2=B1 22%  numa-meminfo.node3.Mapped
  48318561            -0.2%   48208048            -0.1%   48260287        n=
uma-meminfo.node3.MemFree
  49489200            -0.0%   49489196            -0.0%   49489196        n=
uma-meminfo.node3.MemTotal
   1170637 =C2=B1  9%      +9.4%    1281146 =C2=B1  2%      +5.0%    122890=
7 =C2=B1 11%  numa-meminfo.node3.MemUsed
    331.17 =C2=B1 77%     -62.1%     125.50 =C2=B1141%     -50.1%     165.1=
7 =C2=B1147%  numa-meminfo.node3.Mlocked
      1316 =C2=B1 56%     +66.4%       2191 =C2=B1 43%     +34.4%       177=
0 =C2=B1 49%  numa-meminfo.node3.PageTables
     29122 =C2=B1 32%     +47.6%      42988 =C2=B1 28%     +38.0%      4019=
7 =C2=B1 18%  numa-meminfo.node3.SReclaimable
     63184 =C2=B1 14%     +20.1%      75893 =C2=B1 13%     +18.5%      7486=
9 =C2=B1 19%  numa-meminfo.node3.SUnreclaim
    397006 =C2=B1 29%     +10.5%     438649 =C2=B1  8%      +5.6%     41913=
6 =C2=B1 22%  numa-meminfo.node3.Shmem
     92306 =C2=B1 20%     +28.8%     118882 =C2=B1 18%     +24.7%     11506=
7 =C2=B1 18%  numa-meminfo.node3.Slab
    289867 =C2=B1  2%      +5.7%     306302 =C2=B1  5%      -0.2%     28924=
2 =C2=B1  4%  numa-meminfo.node3.Unevictable
      9963 =C2=B1193%     -80.7%       1922 =C2=B1 58%     -76.3%       236=
4 =C2=B1 63%  numa-vmstat.node0.nr_active_anon
     28034 =C2=B1 61%     -14.8%      23874 =C2=B1 59%      -2.6%      2730=
5 =C2=B1 60%  numa-vmstat.node0.nr_anon_pages
     37.50 =C2=B1 74%     -20.0%      30.00 =C2=B1 69%     -10.7%      33.5=
0 =C2=B1 78%  numa-vmstat.node0.nr_anon_transparent_hugepages
     85575 =C2=B1 24%     -13.5%      74048            -8.4%      78383 =C2=
=B1  6%  numa-vmstat.node0.nr_file_pages
     47478            +0.0%      47478            +0.0%      47478        n=
uma-vmstat.node0.nr_free_cma
  12053119            +0.2%   12075759            -0.0%   12052857        n=
uma-vmstat.node0.nr_free_pages
     30755 =C2=B1 52%     -19.5%      24753 =C2=B1 59%      -9.3%      2789=
8 =C2=B1 59%  numa-vmstat.node0.nr_inactive_anon
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  numa-vmstat.node0.nr_isolated_anon
      9328 =C2=B1  4%     -10.2%       8377 =C2=B1  5%      -3.8%       897=
3 =C2=B1 14%  numa-vmstat.node0.nr_kernel_stack
      6036 =C2=B1 35%     -19.4%       4866 =C2=B1 10%     -18.3%       493=
1 =C2=B1  9%  numa-vmstat.node0.nr_mapped
     60.83 =C2=B1 70%     -49.6%      30.67 =C2=B1141%     -49.6%      30.6=
7 =C2=B1141%  numa-vmstat.node0.nr_mlock
    301.67 =C2=B1 22%     -11.4%     267.17 =C2=B1 31%     +55.6%     469.3=
3 =C2=B1 57%  numa-vmstat.node0.nr_page_table_pages
     12702 =C2=B1171%     -77.8%       2820 =C2=B1 40%     -76.6%       297=
5 =C2=B1 68%  numa-vmstat.node0.nr_shmem
      7512 =C2=B1 17%      -9.9%       6768 =C2=B1 12%     +31.9%       991=
0 =C2=B1 26%  numa-vmstat.node0.nr_slab_reclaimable
     21716 =C2=B1 14%      -9.4%      19679 =C2=B1 14%      +7.4%      2332=
3 =C2=B1 17%  numa-vmstat.node0.nr_slab_unreclaimable
     72873 =C2=B1  3%      -2.3%      71227            +3.5%      75408 =C2=
=B1  6%  numa-vmstat.node0.nr_unevictable
      9962 =C2=B1193%     -80.7%       1922 =C2=B1 58%     -76.3%       236=
4 =C2=B1 63%  numa-vmstat.node0.nr_zone_active_anon
     30755 =C2=B1 52%     -19.5%      24753 =C2=B1 59%      -9.3%      2789=
8 =C2=B1 59%  numa-vmstat.node0.nr_zone_inactive_anon
     72873 =C2=B1  3%      -2.3%      71227            +3.5%      75408 =C2=
=B1  6%  numa-vmstat.node0.nr_zone_unevictable
    663066 =C2=B1 10%      -7.0%     616376 =C2=B1  9%     +10.0%     72927=
9 =C2=B1 17%  numa-vmstat.node0.numa_hit
     88175            +0.1%      88283            -0.4%      87850        n=
uma-vmstat.node0.numa_interleave
    579829 =C2=B1 12%     -14.1%     498057 =C2=B1 17%     +13.5%     65836=
2 =C2=B1 24%  numa-vmstat.node0.numa_local
     83236 =C2=B1 11%     +42.1%     118318 =C2=B1 33%     -14.8%      7091=
7 =C2=B1 73%  numa-vmstat.node0.numa_other
      5040 =C2=B1163%      +5.3%       5308 =C2=B1160%    +102.4%      1020=
3 =C2=B1200%  numa-vmstat.node1.nr_active_anon
     23584 =C2=B1 53%     +50.5%      35484 =C2=B1 51%     +29.7%      3057=
8 =C2=B1 70%  numa-vmstat.node1.nr_anon_pages
     26.83 =C2=B1 77%     +80.1%      48.33 =C2=B1 58%     +50.9%      40.5=
0 =C2=B1 79%  numa-vmstat.node1.nr_anon_transparent_hugepages
     80736 =C2=B1 14%      +0.0%      80773 =C2=B1 15%      +4.7%      8452=
3 =C2=B1 28%  numa-vmstat.node1.nr_file_pages
  12166529            -0.1%   12155748            +0.0%   12167836        n=
uma-vmstat.node1.nr_free_pages
     24493 =C2=B1 53%     +50.5%      36851 =C2=B1 48%     +35.5%      3319=
2 =C2=B1 59%  numa-vmstat.node1.nr_inactive_anon
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node1.nr_isolated_anon
      7926 =C2=B1  7%      +7.8%       8541 =C2=B1 10%      -2.4%       773=
4 =C2=B1  5%  numa-vmstat.node1.nr_kernel_stack
      4939 =C2=B1 13%      +2.6%       5065 =C2=B1  6%     +29.3%       638=
8 =C2=B1 39%  numa-vmstat.node1.nr_mapped
     61.17 =C2=B1 70%     -49.6%      30.83 =C2=B1141%     -49.9%      30.6=
7 =C2=B1141%  numa-vmstat.node1.nr_mlock
    487.33 =C2=B1 51%     -10.6%     435.83 =C2=B1 52%     -45.6%     265.3=
3 =C2=B1 22%  numa-vmstat.node1.nr_page_table_pages
      5967 =C2=B1155%     +12.0%       6686 =C2=B1134%    +115.0%      1283=
2 =C2=B1190%  numa-vmstat.node1.nr_shmem
      9165 =C2=B1 34%     -14.1%       7871 =C2=B1 36%     -34.3%       602=
2 =C2=B1 12%  numa-vmstat.node1.nr_slab_reclaimable
     17798 =C2=B1 20%      +4.9%      18676 =C2=B1 10%     -14.4%      1523=
4 =C2=B1 10%  numa-vmstat.node1.nr_slab_unreclaimable
     74768 =C2=B1  5%      -0.9%      74086 =C2=B1  5%      -4.1%      7169=
0        numa-vmstat.node1.nr_unevictable
      5040 =C2=B1163%      +5.3%       5308 =C2=B1160%    +102.4%      1020=
3 =C2=B1200%  numa-vmstat.node1.nr_zone_active_anon
     24493 =C2=B1 53%     +50.5%      36851 =C2=B1 48%     +35.5%      3319=
1 =C2=B1 59%  numa-vmstat.node1.nr_zone_inactive_anon
     74768 =C2=B1  5%      -0.9%      74086 =C2=B1  5%      -4.1%      7169=
0        numa-vmstat.node1.nr_zone_unevictable
    717068 =C2=B1 16%      +3.5%     742115 =C2=B1  9%     -13.7%     61862=
2 =C2=B1  4%  numa-vmstat.node1.numa_hit
     88289            -0.1%      88177            -0.3%      88007        n=
uma-vmstat.node1.numa_interleave
    570109 =C2=B1 25%      +2.5%     584147 =C2=B1 14%     -20.3%     45464=
8 =C2=B1  9%  numa-vmstat.node1.numa_local
    146958 =C2=B1 21%      +7.5%     157966 =C2=B1 19%     +11.6%     16397=
2 =C2=B1 16%  numa-vmstat.node1.numa_other
      2245 =C2=B1100%     -41.4%       1316 =C2=B1 80%     -63.1%     828.1=
7 =C2=B1 52%  numa-vmstat.node2.nr_active_anon
     36978 =C2=B1 47%     -43.4%      20921 =C2=B1 59%      -5.8%      3484=
2 =C2=B1 49%  numa-vmstat.node2.nr_anon_pages
     50.17 =C2=B1 59%     -50.5%      24.83 =C2=B1 77%      -7.6%      46.3=
3 =C2=B1 62%  numa-vmstat.node2.nr_anon_transparent_hugepages
     79232 =C2=B1  5%      -2.8%      77026 =C2=B1  4%      -2.6%      7716=
9 =C2=B1  6%  numa-vmstat.node2.nr_file_pages
  12152515            +0.2%   12180308            +0.1%   12165165        n=
uma-vmstat.node2.nr_free_pages
     38633 =C2=B1 44%     -40.2%      23098 =C2=B1 53%      -5.9%      3636=
5 =C2=B1 45%  numa-vmstat.node2.nr_inactive_anon
      0.00          -100.0%       0.00          -100.0%       0.00        n=
uma-vmstat.node2.nr_isolated_anon
      7865 =C2=B1 13%      -6.4%       7363 =C2=B1  6%      +1.7%       799=
9 =C2=B1 10%  numa-vmstat.node2.nr_kernel_stack
      5422 =C2=B1 17%      +7.9%       5848 =C2=B1  5%      +1.5%       550=
5 =C2=B1 14%  numa-vmstat.node2.nr_mapped
     82.33 =C2=B1 77%     -37.9%      51.17 =C2=B1141%     -50.0%      41.1=
7 =C2=B1148%  numa-vmstat.node2.nr_mlock
    453.33 =C2=B1 58%     -31.8%     309.17 =C2=B1 60%      -8.6%     414.5=
0 =C2=B1 47%  numa-vmstat.node2.nr_page_table_pages
      3939 =C2=B1 58%     -10.3%       3534 =C2=B1 29%     -39.6%       237=
9 =C2=B1 61%  numa-vmstat.node2.nr_shmem
      9364 =C2=B1 22%     -14.5%       8009 =C2=B1 32%     -23.8%       714=
0 =C2=B1 27%  numa-vmstat.node2.nr_slab_reclaimable
     18365 =C2=B1 24%     -10.2%      16489 =C2=B1 14%     -11.3%      1628=
7 =C2=B1 19%  numa-vmstat.node2.nr_slab_unreclaimable
     75313 =C2=B1  5%      -2.4%      73512 =C2=B1  5%      -0.7%      7480=
0 =C2=B1  6%  numa-vmstat.node2.nr_unevictable
      2245 =C2=B1100%     -41.4%       1316 =C2=B1 80%     -63.1%     828.1=
7 =C2=B1 52%  numa-vmstat.node2.nr_zone_active_anon
     38633 =C2=B1 44%     -40.2%      23098 =C2=B1 53%      -5.9%      3636=
5 =C2=B1 45%  numa-vmstat.node2.nr_zone_inactive_anon
     75313 =C2=B1  5%      -2.4%      73512 =C2=B1  5%      -0.7%      7480=
0 =C2=B1  6%  numa-vmstat.node2.nr_zone_unevictable
    723084 =C2=B1 14%     -12.0%     636321 =C2=B1 13%      -4.5%     69084=
8 =C2=B1 13%  numa-vmstat.node2.numa_hit
     88159            +0.1%      88266            -0.4%      87824        n=
uma-vmstat.node2.numa_interleave
    565999 =C2=B1 23%     -15.4%     479036 =C2=B1 16%      -4.7%     53961=
5 =C2=B1 22%  numa-vmstat.node2.numa_local
    157085 =C2=B1 20%      +0.1%     157285 =C2=B1 20%      -3.7%     15123=
2 =C2=B1 22%  numa-vmstat.node2.numa_other
     89005 =C2=B1 29%     +10.7%      98558 =C2=B1  8%      +5.2%      9363=
3 =C2=B1 21%  numa-vmstat.node3.nr_active_anon
     19031 =C2=B1 29%     +42.1%      27048 =C2=B1 60%     -21.3%      1496=
9 =C2=B1 16%  numa-vmstat.node3.nr_anon_pages
     19.67 =C2=B1 40%     +50.0%      29.50 =C2=B1 86%     -37.3%      12.3=
3 =C2=B1 11%  numa-vmstat.node3.nr_anon_transparent_hugepages
    171780 =C2=B1 16%      +8.4%     186266 =C2=B1  6%      +3.1%     17714=
6 =C2=B1 13%  numa-vmstat.node3.nr_file_pages
  12079544            -0.2%   12051913            -0.1%   12065003        n=
uma-vmstat.node3.nr_free_pages
     29320 =C2=B1 14%     +30.1%      38159 =C2=B1 41%     -10.8%      2615=
2 =C2=B1 18%  numa-vmstat.node3.nr_inactive_anon
      7320 =C2=B1  5%     +12.3%       8219 =C2=B1  8%      +6.2%       777=
3 =C2=B1 12%  numa-vmstat.node3.nr_kernel_stack
     10371 =C2=B1 20%      +5.3%      10921 =C2=B1  8%      +2.2%      1059=
7 =C2=B1 22%  numa-vmstat.node3.nr_mapped
     82.33 =C2=B1 77%     -61.9%      31.33 =C2=B1141%     -49.8%      41.3=
3 =C2=B1147%  numa-vmstat.node3.nr_mlock
    328.67 =C2=B1 57%     +66.7%     548.00 =C2=B1 43%     +34.7%     442.6=
7 =C2=B1 49%  numa-vmstat.node3.nr_page_table_pages
     99334 =C2=B1 29%     +10.4%     109691 =C2=B1  8%      +5.5%     10484=
6 =C2=B1 22%  numa-vmstat.node3.nr_shmem
      7279 =C2=B1 32%     +47.6%      10746 =C2=B1 28%     +38.1%      1004=
9 =C2=B1 18%  numa-vmstat.node3.nr_slab_reclaimable
     15795 =C2=B1 14%     +20.1%      18973 =C2=B1 13%     +18.5%      1871=
7 =C2=B1 19%  numa-vmstat.node3.nr_slab_unreclaimable
     72466 =C2=B1  2%      +5.7%      76575 =C2=B1  5%      -0.2%      7231=
0 =C2=B1  4%  numa-vmstat.node3.nr_unevictable
     89005 =C2=B1 29%     +10.7%      98558 =C2=B1  8%      +5.2%      9363=
3 =C2=B1 21%  numa-vmstat.node3.nr_zone_active_anon
     29320 =C2=B1 14%     +30.1%      38159 =C2=B1 41%     -10.8%      2615=
2 =C2=B1 18%  numa-vmstat.node3.nr_zone_inactive_anon
     72466 =C2=B1  2%      +5.7%      76575 =C2=B1  5%      -0.2%      7231=
0 =C2=B1  4%  numa-vmstat.node3.nr_zone_unevictable
    701454 =C2=B1  5%     +13.4%     795761 =C2=B1  8%     +12.5%     78942=
9 =C2=B1 18%  numa-vmstat.node3.numa_hit
     88273            -0.1%      88190            -0.3%      88024        n=
uma-vmstat.node3.numa_interleave
    535998 =C2=B1 11%     +26.2%     676624 =C2=B1 12%     +16.4%     62374=
0 =C2=B1 23%  numa-vmstat.node3.numa_local
    165455 =C2=B1 15%     -28.0%     119136 =C2=B1 44%      +0.1%     16568=
8 =C2=B1 11%  numa-vmstat.node3.numa_other
      0.00        +1.7e+11%       1671 =C2=B1222%  +1.2e+09%      11.83 =C2=
=B1142%  sched_debug.cfs_rq:/.MIN_vruntime.avg
      0.00        +3.2e+13%     320524 =C2=B1222%    +2e+11%       1996 =C2=
=B1142%  sched_debug.cfs_rq:/.MIN_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        s=
ched_debug.cfs_rq:/.MIN_vruntime.min
      0.00       +2.3e+106%      23084 =C2=B1222% +1.5e+104%     153.24 =C2=
=B1142%  sched_debug.cfs_rq:/.MIN_vruntime.stddev
      4812 =C2=B1  2%      +8.8%       5234 =C2=B1 10%      -0.7%       477=
9        sched_debug.cfs_rq:/.load.avg
     16329 =C2=B1  6%    +353.6%      74071 =C2=B1110%      -2.0%      1600=
8 =C2=B1 12%  sched_debug.cfs_rq:/.load.max
      4480            -0.0%       4479            +0.2%       4488        s=
ched_debug.cfs_rq:/.load.min
      1554 =C2=B1 11%    +302.9%       6263 =C2=B1105%      -5.7%       146=
6 =C2=B1 10%  sched_debug.cfs_rq:/.load.stddev
      7.77 =C2=B1 21%      -6.0%       7.30 =C2=B1 10%      +4.4%       8.1=
1 =C2=B1 23%  sched_debug.cfs_rq:/.load_avg.avg
    161.78 =C2=B1 33%     -21.1%     127.72 =C2=B1 11%     +34.0%     216.8=
3 =C2=B1 27%  sched_debug.cfs_rq:/.load_avg.max
      4.08 =C2=B1  4%      +0.7%       4.11 =C2=B1  3%      +2.0%       4.1=
7        sched_debug.cfs_rq:/.load_avg.min
     18.62 =C2=B1 33%     -19.9%      14.92 =C2=B1 16%     +21.0%      22.5=
4 =C2=B1 37%  sched_debug.cfs_rq:/.load_avg.stddev
      0.00        +1.7e+11%       1671 =C2=B1222%  +1.2e+09%      11.83 =C2=
=B1142%  sched_debug.cfs_rq:/.max_vruntime.avg
      0.00        +3.2e+13%     320524 =C2=B1222%    +2e+11%       1996 =C2=
=B1142%  sched_debug.cfs_rq:/.max_vruntime.max
      0.00            +0.0%       0.00            +0.0%       0.00        s=
ched_debug.cfs_rq:/.max_vruntime.min
      0.00       +2.3e+106%      23084 =C2=B1222% +1.5e+104%     153.24 =C2=
=B1142%  sched_debug.cfs_rq:/.max_vruntime.stddev
  30151526            +0.0%   30159826            -0.1%   30135842        s=
ched_debug.cfs_rq:/.min_vruntime.avg
  30272248            +0.0%   30280357            -0.0%   30261709        s=
ched_debug.cfs_rq:/.min_vruntime.max
  28657489            +0.3%   28730456            -0.1%   28641058        s=
ched_debug.cfs_rq:/.min_vruntime.min
    269246 =C2=B1  3%      -1.7%     264700 =C2=B1  3%      -0.3%     26848=
9 =C2=B1  3%  sched_debug.cfs_rq:/.min_vruntime.stddev
      0.84            +0.2%       0.84            -0.1%       0.84        s=
ched_debug.cfs_rq:/.nr_running.avg
      1.00            +5.6%       1.06 =C2=B1  7%      +0.0%       1.00    =
    sched_debug.cfs_rq:/.nr_running.max
      0.83            +0.0%       0.83            +0.0%       0.83        s=
ched_debug.cfs_rq:/.nr_running.min
      0.04 =C2=B1 22%     +14.4%       0.04 =C2=B1 21%      -2.9%       0.0=
4 =C2=B1  8%  sched_debug.cfs_rq:/.nr_running.stddev
      0.87 =C2=B1102%    -100.0%       0.00           +80.4%       1.58 =C2=
=B1107%  sched_debug.cfs_rq:/.removed.load_avg.avg
     81.22 =C2=B1100%    -100.0%       0.00            +5.1%      85.33 =C2=
=B1100%  sched_debug.cfs_rq:/.removed.load_avg.max
      8.34 =C2=B1100%    -100.0%       0.00           +34.7%      11.23 =C2=
=B1101%  sched_debug.cfs_rq:/.removed.load_avg.stddev
      0.34 =C2=B1106%    -100.0%       0.00          +131.3%       0.80 =C2=
=B1108%  sched_debug.cfs_rq:/.removed.runnable_avg.avg
     34.58 =C2=B1107%    -100.0%       0.00           +30.6%      45.17 =C2=
=B1100%  sched_debug.cfs_rq:/.removed.runnable_avg.max
      3.33 =C2=B1105%    -100.0%       0.00           +70.0%       5.66 =C2=
=B1102%  sched_debug.cfs_rq:/.removed.runnable_avg.stddev
      0.34 =C2=B1106%    -100.0%       0.00          +131.7%       0.80 =C2=
=B1108%  sched_debug.cfs_rq:/.removed.util_avg.avg
     34.53 =C2=B1107%    -100.0%       0.00           +30.8%      45.17 =C2=
=B1100%  sched_debug.cfs_rq:/.removed.util_avg.max
      3.33 =C2=B1105%    -100.0%       0.00           +70.3%       5.66 =C2=
=B1102%  sched_debug.cfs_rq:/.removed.util_avg.stddev
    886.17            +0.5%     890.20            -0.4%     882.68        s=
ched_debug.cfs_rq:/.runnable_avg.avg
      1630 =C2=B1  4%      -6.0%       1532 =C2=B1  3%      +2.9%       167=
7 =C2=B1  6%  sched_debug.cfs_rq:/.runnable_avg.max
    837.22            +0.2%     839.19            +0.8%     844.22        s=
ched_debug.cfs_rq:/.runnable_avg.min
     89.79 =C2=B1  6%      -4.1%      86.14 =C2=B1  7%      -1.0%      88.8=
8 =C2=B1  9%  sched_debug.cfs_rq:/.runnable_avg.stddev
    849594 =C2=B1 20%      -0.5%     845568 =C2=B1 20%      +5.0%     89202=
4 =C2=B1 25%  sched_debug.cfs_rq:/.spread0.avg
    967367 =C2=B1 18%      -0.5%     962669 =C2=B1 17%      +5.0%    101562=
1 =C2=B1 22%  sched_debug.cfs_rq:/.spread0.max
   -647913            -9.3%    -587649            -6.6%    -605277        s=
ched_debug.cfs_rq:/.spread0.min
    269267 =C2=B1  3%      -1.7%     264713 =C2=B1  3%      -0.3%     26850=
0 =C2=B1  3%  sched_debug.cfs_rq:/.spread0.stddev
    881.32            +0.5%     885.57            -0.4%     877.93        s=
ched_debug.cfs_rq:/.util_avg.avg
      1118            -3.6%       1077 =C2=B1  2%      -1.1%       1106 =C2=
=B1  4%  sched_debug.cfs_rq:/.util_avg.max
    738.89 =C2=B1  2%      -2.9%     717.39 =C2=B1  4%      +2.5%     757.2=
2 =C2=B1  5%  sched_debug.cfs_rq:/.util_avg.min
     56.14 =C2=B1  6%      +4.1%      58.42 =C2=B1  4%      -8.4%      51.4=
3 =C2=B1  9%  sched_debug.cfs_rq:/.util_avg.stddev
    737.85 =C2=B1 10%      -1.7%     725.63 =C2=B1 10%      -3.2%     714.3=
9 =C2=B1 21%  sched_debug.cfs_rq:/.util_est_enqueued.avg
      1105 =C2=B1  7%      +0.3%       1108 =C2=B1  6%      +5.0%       116=
0 =C2=B1  8%  sched_debug.cfs_rq:/.util_est_enqueued.max
    160.11 =C2=B1 89%     +33.6%     213.94 =C2=B1 67%     +40.1%     224.3=
9 =C2=B1 71%  sched_debug.cfs_rq:/.util_est_enqueued.min
    196.71 =C2=B1 13%      -3.0%     190.78 =C2=B1 24%     -41.7%     114.6=
9 =C2=B1 49%  sched_debug.cfs_rq:/.util_est_enqueued.stddev
    926930 =C2=B1  2%      +0.3%     929573            +0.3%     929418 =C2=
=B1  3%  sched_debug.cpu.avg_idle.avg
   1737117 =C2=B1 14%      -7.8%    1602392 =C2=B1  4%     -19.1%    140582=
5 =C2=B1 14%  sched_debug.cpu.avg_idle.max
    563193 =C2=B1 14%      -3.1%     545471 =C2=B1 35%     +11.9%     63031=
2 =C2=B1 13%  sched_debug.cpu.avg_idle.min
    151329 =C2=B1 22%     -16.0%     127076 =C2=B1 11%     -26.5%     11126=
8 =C2=B1  5%  sched_debug.cpu.avg_idle.stddev
    189670            -0.1%     189486            +1.1%     191742        s=
ched_debug.cpu.clock.avg
    189707            -0.1%     189524            +1.1%     191782        s=
ched_debug.cpu.clock.max
    189633            -0.1%     189447            +1.1%     191705        s=
ched_debug.cpu.clock.min
     23.22 =C2=B1  4%      +2.1%      23.70 =C2=B1  4%      +1.5%      23.5=
7 =C2=B1  6%  sched_debug.cpu.clock.stddev
    187861            -0.1%     187701            +1.0%     189825        s=
ched_debug.cpu.clock_task.avg
    188071            -0.1%     187919            +1.1%     190057        s=
ched_debug.cpu.clock_task.max
    181097            -0.4%     180426            +0.3%     181642        s=
ched_debug.cpu.clock_task.min
    608.55 =C2=B1 29%      +3.7%     630.96 =C2=B1 29%     +18.1%     718.5=
5 =C2=B1  2%  sched_debug.cpu.clock_task.stddev
      3158            -0.1%       3154            +0.0%       3159        s=
ched_debug.cpu.curr->pid.avg
      8095           -15.4%       6849 =C2=B1 11%      -7.7%       7469 =C2=
=B1 10%  sched_debug.cpu.curr->pid.max
      2993            -0.2%       2988            -0.2%       2988        s=
ched_debug.cpu.curr->pid.min
    448.73 =C2=B1  6%     -22.6%     347.12 =C2=B1 14%      -9.9%     404.3=
9 =C2=B1 15%  sched_debug.cpu.curr->pid.stddev
    502808            -0.2%     501743            -0.3%     501406        s=
ched_debug.cpu.max_idle_balance_cost.avg
    582448 =C2=B1  5%      -4.0%     559118            -4.3%     557243    =
    sched_debug.cpu.max_idle_balance_cost.max
    500000            +0.0%     500000            +0.0%     500000        s=
ched_debug.cpu.max_idle_balance_cost.min
     11566 =C2=B1 36%     -26.5%       8501 =C2=B1 21%     -37.5%       722=
8 =C2=B1 10%  sched_debug.cpu.max_idle_balance_cost.stddev
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.avg
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.max
      4294            -0.0%       4294            +0.0%       4294        s=
ched_debug.cpu.next_balance.min
      0.00 =C2=B1  4%      +0.9%       0.00 =C2=B1  4%      -0.1%       0.0=
0 =C2=B1  5%  sched_debug.cpu.next_balance.stddev
      0.85            -0.0%       0.85            +0.1%       0.85        s=
ched_debug.cpu.nr_running.avg
      1.75 =C2=B1  4%      +3.2%       1.81 =C2=B1  6%      +4.8%       1.8=
3        sched_debug.cpu.nr_running.max
      0.83            +0.0%       0.83            +0.0%       0.83        s=
ched_debug.cpu.nr_running.min
      0.10 =C2=B1  7%      +0.4%       0.10 =C2=B1 10%      +3.9%       0.1=
1 =C2=B1 10%  sched_debug.cpu.nr_running.stddev
      3248            +0.1%       3250            -0.4%       3234        s=
ched_debug.cpu.nr_switches.avg
     25543 =C2=B1  8%      +5.0%      26830 =C2=B1  8%      +9.9%      2806=
0 =C2=B1 12%  sched_debug.cpu.nr_switches.max
      1406 =C2=B1 12%      -7.5%       1300 =C2=B1 11%      -6.4%       131=
6 =C2=B1 13%  sched_debug.cpu.nr_switches.min
      3131 =C2=B1  2%      +2.0%       3194 =C2=B1  4%      +4.7%       327=
8 =C2=B1  5%  sched_debug.cpu.nr_switches.stddev
      0.00 =C2=B1 20%      +0.0%       0.00 =C2=B1 20%     -27.3%       0.0=
0 =C2=B1 55%  sched_debug.cpu.nr_uninterruptible.avg
    186.75 =C2=B1  2%      -2.3%     182.47 =C2=B1  2%      -1.5%     184.0=
3 =C2=B1  3%  sched_debug.cpu.nr_uninterruptible.max
    -28.69            -5.3%     -27.17           -21.6%     -22.50        s=
ched_debug.cpu.nr_uninterruptible.min
     14.79 =C2=B1  2%      -1.7%      14.53 =C2=B1  3%      -2.0%      14.5=
0 =C2=B1  4%  sched_debug.cpu.nr_uninterruptible.stddev
    189633            -0.1%     189447            +1.1%     191705        s=
ched_debug.cpu_clk
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.avg
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.max
    996147            +0.0%     996147            +0.0%     996147        s=
ched_debug.dl_rq:.dl_bw->bw.min
 4.295e+09            -0.0%  4.295e+09            +0.0%  4.295e+09        s=
ched_debug.jiffies
    188761            -0.1%     188575            +1.1%     190834        s=
ched_debug.ktime
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.avg
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.max
    950.00            +0.0%     950.00            +0.0%     950.00        s=
ched_debug.rt_rq:/.rt_runtime.min
      0.00 =C2=B1223%    -100.0%       0.00         +9524.7%       0.05 =C2=
=B1137%  sched_debug.rt_rq:/.rt_time.avg
      0.00 =C2=B1223%    -100.0%       0.00        +1.8e+05%       8.14 =C2=
=B1142%  sched_debug.rt_rq:/.rt_time.max
      0.00          -100.0%       0.00        +1.4e+99%       0.00 =C2=B122=
3%  sched_debug.rt_rq:/.rt_time.min
      0.00 =C2=B1223%    -100.0%       0.00        +67864.4%       0.59 =C2=
=B1142%  sched_debug.rt_rq:/.rt_time.stddev
    190985            -0.1%     190710            +0.6%     192084        s=
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
     17.05            -0.6       16.41            +0.1       17.18        p=
erf-profile.calltrace.cycles-pp.__entry_text_start.syscall
      4.78            -0.6        4.15            -0.5        4.26        p=
erf-profile.calltrace.cycles-pp.try_grab_compound_head.gup_pgd_range.intern=
al_get_user_pages_fast.get_futex_key.futex_wake
      3.58            -0.2        3.40            -0.1        3.45        p=
erf-profile.calltrace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.entry_SYSCALL_64_after_hwframe.syscall
      5.50            -0.1        5.37            -0.2        5.31        p=
erf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_=
after_hwframe.syscall
      3.39            -0.1        3.29            +0.1        3.45        p=
erf-profile.calltrace.cycles-pp.hash_futex.futex_wake.do_futex.__x64_sys_fu=
tex.do_syscall_64
      3.26            -0.1        3.17            +0.0        3.29        p=
erf-profile.calltrace.cycles-pp.syscall_return_via_sysret.syscall
      1.19            -0.1        1.13            -0.0        1.17        p=
erf-profile.calltrace.cycles-pp.entry_SYSCALL_64_safe_stack.syscall
     98.66            -0.0       98.62            -0.1       98.59        p=
erf-profile.calltrace.cycles-pp.syscall
      2.03            -0.0        2.00            -0.1        1.94        p=
erf-profile.calltrace.cycles-pp.get_user_pages_fast.get_futex_key.futex_wak=
e.do_futex.__x64_sys_futex
      0.91            -0.0        0.88            -0.0        0.89        p=
erf-profile.calltrace.cycles-pp.rcu_nocb_flush_deferred_wakeup.exit_to_user=
_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.sysc=
all
      1.10            -0.0        1.08            +0.0        1.12        p=
erf-profile.calltrace.cycles-pp.syscall_enter_from_user_mode.do_syscall_64.=
entry_SYSCALL_64_after_hwframe.syscall
      1.21 =C2=B1  5%      +0.0        1.21 =C2=B1  7%      +0.0        1.2=
2 =C2=B1  4%  perf-profile.calltrace.cycles-pp.testcase
      1.36            +0.1        1.46            -0.0        1.33 =C2=B1  =
3%  perf-profile.calltrace.cycles-pp.syscall_exit_to_user_mode_prepare.sysc=
all_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.syscall
     74.52            +0.8       75.37            -0.1       74.41        p=
erf-profile.calltrace.cycles-pp.entry_SYSCALL_64_after_hwframe.syscall
     65.51            +1.0       66.56            +0.0       65.56        p=
erf-profile.calltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.syscall
     63.23            +1.1       64.36            +0.1       63.31        p=
erf-profile.calltrace.cycles-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.syscall
     59.57            +1.3       60.82            +0.2       59.81        p=
erf-profile.calltrace.cycles-pp.do_futex.__x64_sys_futex.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe.syscall
     55.95            +1.5       57.40            +0.5       56.41        p=
erf-profile.calltrace.cycles-pp.futex_wake.do_futex.__x64_sys_futex.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe
     46.68            +1.8       48.51            +0.6       47.24        p=
erf-profile.calltrace.cycles-pp.get_futex_key.futex_wake.do_futex.__x64_sys=
_futex.do_syscall_64
     27.39            +2.2       29.63            +0.8       28.18        p=
erf-profile.calltrace.cycles-pp.gup_pgd_range.internal_get_user_pages_fast.=
get_futex_key.futex_wake.do_futex
     35.75            +2.2       37.99            +0.7       36.45        p=
erf-profile.calltrace.cycles-pp.internal_get_user_pages_fast.get_futex_key.=
futex_wake.do_futex.__x64_sys_futex
      0.00            +3.2        3.16 =C2=B1  2%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.page_is_secretmem.gup_pgd_range.intern=
al_get_user_pages_fast.get_futex_key.futex_wake
      0.00            +3.2        3.19 =C2=B1  2%      +0.0        0.00    =
    perf-profile.calltrace.cycles-pp.page_mapping.page_is_secretmem.gup_pgd=
_range.internal_get_user_pages_fast.get_futex_key
      4.82            -0.6        4.19            -0.5        4.30        p=
erf-profile.children.cycles-pp.try_grab_compound_head
     11.04            -0.4       10.62            +0.1       11.12        p=
erf-profile.children.cycles-pp.__entry_text_start
      9.38            -0.3        9.06            +0.0        9.43        p=
erf-profile.children.cycles-pp.syscall_return_via_sysret
      3.71            -0.2        3.51            -0.2        3.56        p=
erf-profile.children.cycles-pp.exit_to_user_mode_prepare
      5.90            -0.1        5.76            -0.2        5.70        p=
erf-profile.children.cycles-pp.syscall_exit_to_user_mode
      3.44            -0.1        3.35            +0.1        3.51        p=
erf-profile.children.cycles-pp.hash_futex
      1.27            -0.1        1.21            -0.0        1.25        p=
erf-profile.children.cycles-pp.entry_SYSCALL_64_safe_stack
      0.93            -0.0        0.90            -0.0        0.91        p=
erf-profile.children.cycles-pp.rcu_nocb_flush_deferred_wakeup
      1.11            -0.0        1.09            +0.0        1.14        p=
erf-profile.children.cycles-pp.syscall_enter_from_user_mode
      0.39 =C2=B1  2%      -0.0        0.38 =C2=B1  5%      -0.0        0.3=
8 =C2=B1  2%  perf-profile.children.cycles-pp.tick_sched_handle
      0.39 =C2=B1  3%      -0.0        0.38 =C2=B1  4%      -0.0        0.3=
8        perf-profile.children.cycles-pp.update_process_times
      0.21 =C2=B1  4%      -0.0        0.20 =C2=B1  4%      -0.0        0.2=
1 =C2=B1  3%  perf-profile.children.cycles-pp.perf_trace_sched_stat_runtime
      0.21 =C2=B1  4%      -0.0        0.20 =C2=B1  4%      -0.0        0.2=
1 =C2=B1  3%  perf-profile.children.cycles-pp.perf_tp_event
      0.22 =C2=B1  3%      -0.0        0.21 =C2=B1  5%      -0.0        0.2=
2 =C2=B1  3%  perf-profile.children.cycles-pp.update_curr
      2.19            -0.0        2.18            -0.1        2.09        p=
erf-profile.children.cycles-pp.get_user_pages_fast
      0.20 =C2=B1  3%      -0.0        0.19 =C2=B1  3%      -0.0        0.2=
0 =C2=B1  3%  perf-profile.children.cycles-pp.perf_event_output_forward
      0.33 =C2=B1  2%      -0.0        0.32 =C2=B1  3%      -0.0        0.3=
3 =C2=B1  2%  perf-profile.children.cycles-pp.scheduler_tick
      0.20 =C2=B1  3%      -0.0        0.20 =C2=B1  4%      -0.0        0.2=
0 =C2=B1  2%  perf-profile.children.cycles-pp.__perf_event_overflow
      0.16 =C2=B1  4%      -0.0        0.16 =C2=B1  3%      -0.0        0.1=
6 =C2=B1  3%  perf-profile.children.cycles-pp.perf_callchain
      0.20 =C2=B1  3%      -0.0        0.20 =C2=B1  4%      -0.0        0.2=
0 =C2=B1  3%  perf-profile.children.cycles-pp.perf_swevent_overflow
      0.30 =C2=B1  3%      -0.0        0.30 =C2=B1  3%      -0.0        0.3=
0 =C2=B1  2%  perf-profile.children.cycles-pp.task_tick_fair
      0.45 =C2=B1  2%      -0.0        0.44 =C2=B1  3%      +0.0        0.4=
7 =C2=B1  2%  perf-profile.children.cycles-pp.tick_sched_timer
     98.83            -0.0       98.82            -0.0       98.81        p=
erf-profile.children.cycles-pp.syscall
      0.17 =C2=B1  4%      -0.0        0.17 =C2=B1  4%      -0.0        0.1=
7 =C2=B1  4%  perf-profile.children.cycles-pp.perf_prepare_sample
      0.16 =C2=B1  2%      -0.0        0.16 =C2=B1  3%      -0.0        0.1=
6 =C2=B1  3%  perf-profile.children.cycles-pp.get_perf_callchain
      0.15 =C2=B1  2%      -0.0        0.15 =C2=B1  3%      -0.0        0.1=
5 =C2=B1  3%  perf-profile.children.cycles-pp.perf_callchain_kernel
      0.11 =C2=B1  6%      -0.0        0.11 =C2=B1  3%      +0.0        0.1=
1 =C2=B1  4%  perf-profile.children.cycles-pp.unwind_next_frame
      0.06 =C2=B1  8%      -0.0        0.06 =C2=B1  9%      -0.0        0.0=
5 =C2=B1  9%  perf-profile.children.cycles-pp.__unwind_start
      0.16 =C2=B1  3%      +0.0        0.16 =C2=B1  3%      +0.0        0.1=
6 =C2=B1  2%  perf-profile.children.cycles-pp.__x86_indirect_thunk_rax
      0.00            +0.0        0.00            +0.0        0.01 =C2=B122=
3%  perf-profile.children.cycles-pp.irqtime_account_irq
      1.32 =C2=B1  5%      +0.0        1.32 =C2=B1  6%      +0.0        1.3=
3 =C2=B1  4%  perf-profile.children.cycles-pp.testcase
      0.08 =C2=B1 17%      +0.0        0.08 =C2=B1 11%      +0.0        0.1=
0 =C2=B1 19%  perf-profile.children.cycles-pp.clockevents_program_event
      0.11 =C2=B1 16%      +0.0        0.11 =C2=B1  9%      +0.0        0.1=
3 =C2=B1 14%  perf-profile.children.cycles-pp.ktime_get_update_offsets_now
      0.12 =C2=B1 26%      +0.0        0.12 =C2=B1 13%      +0.0        0.1=
6 =C2=B1 17%  perf-profile.children.cycles-pp.ktime_get
      0.32 =C2=B1  4%      +0.0        0.33 =C2=B1  3%      -0.0        0.3=
1 =C2=B1  3%  perf-profile.children.cycles-pp.pud_huge
      0.00            +0.0        0.01 =C2=B1223%      +0.0        0.03 =C2=
=B1 70%  perf-profile.children.cycles-pp.perf_mux_hrtimer_handler
      0.50 =C2=B1  3%      +0.0        0.51 =C2=B1  3%      +0.0        0.5=
4        perf-profile.children.cycles-pp.__hrtimer_run_queues
      0.71 =C2=B1  6%      +0.0        0.72 =C2=B1  3%      +0.1        0.7=
9 =C2=B1  5%  perf-profile.children.cycles-pp.hrtimer_interrupt
      0.71 =C2=B1  6%      +0.0        0.72 =C2=B1  3%      +0.1        0.8=
0 =C2=B1  5%  perf-profile.children.cycles-pp.__sysvec_apic_timer_interrupt
      0.77 =C2=B1  5%      +0.0        0.78 =C2=B1  3%      +0.1        0.8=
5 =C2=B1  5%  perf-profile.children.cycles-pp.sysvec_apic_timer_interrupt
      0.81 =C2=B1  6%      +0.0        0.83 =C2=B1  3%      +0.1        0.9=
0 =C2=B1  4%  perf-profile.children.cycles-pp.asm_sysvec_apic_timer_interru=
pt
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1102%      +0.0        0.0=
3 =C2=B1 99%  perf-profile.children.cycles-pp.queue_event
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1101%      +0.0        0.0=
3 =C2=B1 99%  perf-profile.children.cycles-pp.ordered_events__queue
      0.02 =C2=B1142%      +0.0        0.04 =C2=B1 72%      +0.0        0.0=
5 =C2=B1 45%  perf-profile.children.cycles-pp.__libc_start_main
      0.02 =C2=B1142%      +0.0        0.04 =C2=B1 72%      +0.0        0.0=
5 =C2=B1 45%  perf-profile.children.cycles-pp.main
      0.02 =C2=B1142%      +0.0        0.04 =C2=B1 72%      +0.0        0.0=
5 =C2=B1 45%  perf-profile.children.cycles-pp.run_builtin
      0.44 =C2=B1  8%      +0.0        0.47 =C2=B1  2%      -0.0        0.4=
2 =C2=B1  7%  perf-profile.children.cycles-pp.pmd_huge
      0.32 =C2=B1  6%      +0.0        0.34 =C2=B1 21%      -0.0        0.3=
1 =C2=B1  4%  perf-profile.children.cycles-pp.syscall(a)plt
      0.01 =C2=B1223%      +0.0        0.04 =C2=B1 71%      +0.0        0.0=
3 =C2=B1100%  perf-profile.children.cycles-pp.cmd_sched
      0.02 =C2=B1144%      +0.0        0.05 =C2=B1 48%      +0.0        0.0=
5 =C2=B1 46%  perf-profile.children.cycles-pp.cmd_record
      0.01 =C2=B1223%      +0.0        0.05 =C2=B1 48%      +0.0        0.0=
4 =C2=B1 71%  perf-profile.children.cycles-pp.process_simple
      0.01 =C2=B1223%      +0.0        0.05 =C2=B1 48%      +0.0        0.0=
5 =C2=B1 45%  perf-profile.children.cycles-pp.record__finish_output
      0.01 =C2=B1223%      +0.0        0.05 =C2=B1 48%      +0.0        0.0=
5 =C2=B1 45%  perf-profile.children.cycles-pp.perf_session__process_events
      0.45            +0.1        0.51            -0.0        0.45        p=
erf-profile.children.cycles-pp.is_valid_gup_flags
      1.37            +0.1        1.47            -0.0        1.35 =C2=B1  =
3%  perf-profile.children.cycles-pp.syscall_exit_to_user_mode_prepare
     74.78            +0.8       75.63            -0.1       74.67        p=
erf-profile.children.cycles-pp.entry_SYSCALL_64_after_hwframe
     65.64            +1.1       66.70            +0.0       65.69        p=
erf-profile.children.cycles-pp.do_syscall_64
     63.63            +1.1       64.75            +0.1       63.69        p=
erf-profile.children.cycles-pp.__x64_sys_futex
     59.95            +1.3       61.20            +0.2       60.17        p=
erf-profile.children.cycles-pp.do_futex
     56.16            +1.4       57.61            +0.5       56.61        p=
erf-profile.children.cycles-pp.futex_wake
     47.04            +1.8       48.84            +0.5       47.56        p=
erf-profile.children.cycles-pp.get_futex_key
     35.99            +2.2       38.22            +0.7       36.69        p=
erf-profile.children.cycles-pp.internal_get_user_pages_fast
     27.76            +2.5       30.23            +0.7       28.49        p=
erf-profile.children.cycles-pp.gup_pgd_range
      0.00            +3.2        3.19 =C2=B1  2%      +0.0        0.00    =
    perf-profile.children.cycles-pp.page_mapping
      0.00            +3.7        3.66 =C2=B1  2%      +0.0        0.00    =
    perf-profile.children.cycles-pp.page_is_secretmem
      4.66            -0.6        4.06            -0.4        4.22        p=
erf-profile.self.cycles-pp.try_grab_compound_head
      8.97            -0.4        8.54            -0.1        8.85        p=
erf-profile.self.cycles-pp.get_futex_key
     22.44            -0.4       22.05            +1.2       23.64        p=
erf-profile.self.cycles-pp.gup_pgd_range
      9.31            -0.3        8.99            +0.0        9.35        p=
erf-profile.self.cycles-pp.syscall_return_via_sysret
      8.27            -0.3        7.96            +0.0        8.29        p=
erf-profile.self.cycles-pp.syscall
      5.54            -0.3        5.25            -0.1        5.40        p=
erf-profile.self.cycles-pp.futex_wake
      7.97            -0.3        7.71            -0.1        7.88        p=
erf-profile.self.cycles-pp.internal_get_user_pages_fast
      5.01            -0.2        4.82            +0.0        5.05        p=
erf-profile.self.cycles-pp.__entry_text_start
      3.82            -0.2        3.64            -0.2        3.60        p=
erf-profile.self.cycles-pp.do_futex
      2.73            -0.2        2.56            -0.1        2.60        p=
erf-profile.self.cycles-pp.exit_to_user_mode_prepare
      3.76            -0.2        3.61            -0.2        3.58        p=
erf-profile.self.cycles-pp.__x64_sys_futex
      3.41            -0.1        3.32            +0.1        3.47        p=
erf-profile.self.cycles-pp.hash_futex
      3.30            -0.1        3.23            +0.0        3.34        p=
erf-profile.self.cycles-pp.entry_SYSCALL_64_after_hwframe
      1.25            -0.1        1.19            -0.0        1.24        p=
erf-profile.self.cycles-pp.entry_SYSCALL_64_safe_stack
      0.74 =C2=B1  4%      -0.0        0.69 =C2=B1  2%      -0.0        0.7=
0        perf-profile.self.cycles-pp.do_syscall_64
      0.84            -0.0        0.81            -0.0        0.82        p=
erf-profile.self.cycles-pp.rcu_nocb_flush_deferred_wakeup
      1.07            -0.0        1.04            -0.0        1.03        p=
erf-profile.self.cycles-pp.syscall_exit_to_user_mode
      0.95            -0.0        0.94            +0.0        0.97        p=
erf-profile.self.cycles-pp.syscall_enter_from_user_mode
      1.51            -0.0        1.49            -0.0        1.46        p=
erf-profile.self.cycles-pp.get_user_pages_fast
      1.04 =C2=B1  3%      -0.0        1.03 =C2=B1  3%      +0.0        1.0=
4 =C2=B1  2%  perf-profile.self.cycles-pp.testcase
      0.05 =C2=B1  7%      -0.0        0.04 =C2=B1 44%      -0.0        0.0=
5        perf-profile.self.cycles-pp.unwind_next_frame
      0.10 =C2=B1 14%      -0.0        0.10 =C2=B1 10%      +0.0        0.1=
3 =C2=B1 16%  perf-profile.self.cycles-pp.ktime_get_update_offsets_now
      0.13            +0.0        0.13 =C2=B1  2%      +0.0        0.13 =C2=
=B1  2%  perf-profile.self.cycles-pp.__x86_indirect_thunk_rax
      0.11 =C2=B1 27%      +0.0        0.11 =C2=B1 14%      +0.0        0.1=
5 =C2=B1 18%  perf-profile.self.cycles-pp.ktime_get
      0.38 =C2=B1  7%      +0.0        0.40            -0.0        0.36 =C2=
=B1  6%  perf-profile.self.cycles-pp.pmd_huge
      0.01 =C2=B1223%      +0.0        0.03 =C2=B1102%      +0.0        0.0=
3 =C2=B1 99%  perf-profile.self.cycles-pp.queue_event
      0.24            +0.0        0.26 =C2=B1  3%      +0.0        0.24 =C2=
=B1  3%  perf-profile.self.cycles-pp.pud_huge
      0.31            +0.0        0.34            -0.0        0.30 =C2=B1  =
2%  perf-profile.self.cycles-pp.is_valid_gup_flags
      0.20 =C2=B1  6%      +0.0        0.23 =C2=B1 33%      -0.0        0.2=
0 =C2=B1  4%  perf-profile.self.cycles-pp.syscall(a)plt
      1.23            +0.1        1.32            -0.0        1.22 =C2=B1  =
4%  perf-profile.self.cycles-pp.syscall_exit_to_user_mode_prepare
      0.00            +0.6        0.62            +0.0        0.00        p=
erf-profile.self.cycles-pp.page_is_secretmem
      0.00            +2.8        2.81 =C2=B1  3%      +0.0        0.00    =
    perf-profile.self.cycles-pp.page_mapping
    382430            -0.0%     382412            -0.0%     382391        s=
labinfo.Acpi-Operand.active_objs
      6830            -0.0%       6828            -0.0%       6829        s=
labinfo.Acpi-Operand.active_slabs
    382510            -0.0%     382422            -0.0%     382435        s=
labinfo.Acpi-Operand.num_objs
      6830            -0.0%       6828            -0.0%       6829        s=
labinfo.Acpi-Operand.num_slabs
      1338 =C2=B1  9%     +11.8%       1496 =C2=B1  8%      +4.5%       139=
9 =C2=B1 13%  slabinfo.Acpi-Parse.active_objs
     18.33 =C2=B1  9%     +11.8%      20.50 =C2=B1  8%      +4.5%      19.1=
7 =C2=B1 13%  slabinfo.Acpi-Parse.active_slabs
      1338 =C2=B1  9%     +11.8%       1496 =C2=B1  8%      +4.5%       139=
9 =C2=B1 13%  slabinfo.Acpi-Parse.num_objs
     18.33 =C2=B1  9%     +11.8%      20.50 =C2=B1  8%      +4.5%      19.1=
7 =C2=B1 13%  slabinfo.Acpi-Parse.num_slabs
      8034 =C2=B1  6%      +4.1%       8360 =C2=B1  9%      -5.0%       763=
3 =C2=B1  4%  slabinfo.Acpi-State.active_objs
    157.17 =C2=B1  6%      +4.0%     163.50 =C2=B1  9%      -5.0%     149.3=
3 =C2=B1  4%  slabinfo.Acpi-State.active_slabs
      8034 =C2=B1  6%      +4.1%       8360 =C2=B1  9%      -5.0%       763=
3 =C2=B1  4%  slabinfo.Acpi-State.num_objs
    157.17 =C2=B1  6%      +4.0%     163.50 =C2=B1  9%      -5.0%     149.3=
3 =C2=B1  4%  slabinfo.Acpi-State.num_slabs
      2911 =C2=B1  3%      -2.7%       2833 =C2=B1  8%      -1.3%       287=
2 =C2=B1  5%  slabinfo.PING.active_objs
     90.33 =C2=B1  3%      -2.6%      88.00 =C2=B1  7%      -1.5%      89.0=
0 =C2=B1  5%  slabinfo.PING.active_slabs
      2911 =C2=B1  3%      -2.7%       2833 =C2=B1  8%      -1.3%       287=
2 =C2=B1  5%  slabinfo.PING.num_objs
     90.33 =C2=B1  3%      -2.6%      88.00 =C2=B1  7%      -1.5%      89.0=
0 =C2=B1  5%  slabinfo.PING.num_slabs
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
     49.00 =C2=B1 14%      +9.5%      53.67 =C2=B1  9%      +9.5%      53.6=
7 =C2=B1  9%  slabinfo.TCP.active_objs
      3.50 =C2=B1 14%      +9.5%       3.83 =C2=B1  9%      +9.5%       3.8=
3 =C2=B1  9%  slabinfo.TCP.active_slabs
     49.00 =C2=B1 14%      +9.5%      53.67 =C2=B1  9%      +9.5%      53.6=
7 =C2=B1  9%  slabinfo.TCP.num_objs
      3.50 =C2=B1 14%      +9.5%       3.83 =C2=B1  9%      +9.5%       3.8=
3 =C2=B1  9%  slabinfo.TCP.num_slabs
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
     37124 =C2=B1  2%      -1.2%      36674 =C2=B1  3%      +1.2%      3756=
8 =C2=B1  3%  slabinfo.anon_vma.active_objs
    806.50 =C2=B1  2%      -1.2%     796.50 =C2=B1  3%      +1.2%     816.0=
0 =C2=B1  3%  slabinfo.anon_vma.active_slabs
     37124 =C2=B1  2%      -1.2%      36674 =C2=B1  3%      +1.2%      3756=
8 =C2=B1  3%  slabinfo.anon_vma.num_objs
    806.50 =C2=B1  2%      -1.2%     796.50 =C2=B1  3%      +1.2%     816.0=
0 =C2=B1  3%  slabinfo.anon_vma.num_slabs
     80309            -1.4%      79189 =C2=B1  2%      +1.8%      81742 =C2=
=B1  3%  slabinfo.anon_vma_chain.active_objs
      1254            -1.4%       1236 =C2=B1  2%      +1.8%       1276 =C2=
=B1  3%  slabinfo.anon_vma_chain.active_slabs
     80309            -1.4%      79189 =C2=B1  2%      +1.8%      81742 =C2=
=B1  3%  slabinfo.anon_vma_chain.num_objs
      1254            -1.4%       1236 =C2=B1  2%      +1.8%       1276 =C2=
=B1  3%  slabinfo.anon_vma_chain.num_slabs
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
    277.33 =C2=B1 25%      -1.9%     272.00 =C2=B1 26%      -7.7%     256.0=
0 =C2=B1 14%  slabinfo.biovec-64.active_objs
      8.67 =C2=B1 25%      -1.9%       8.50 =C2=B1 26%      -7.7%       8.0=
0 =C2=B1 14%  slabinfo.biovec-64.active_slabs
    277.33 =C2=B1 25%      -1.9%     272.00 =C2=B1 26%      -7.7%     256.0=
0 =C2=B1 14%  slabinfo.biovec-64.num_objs
      8.67 =C2=B1 25%      -1.9%       8.50 =C2=B1 26%      -7.7%       8.0=
0 =C2=B1 14%  slabinfo.biovec-64.num_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        s=
labinfo.biovec-max.active_objs
      8.00            +0.0%       8.00            +0.0%       8.00        s=
labinfo.biovec-max.active_slabs
     64.00            +0.0%      64.00            +0.0%      64.00        s=
labinfo.biovec-max.num_objs
      8.00            +0.0%       8.00            +0.0%       8.00        s=
labinfo.biovec-max.num_slabs
     78.00            +0.0%      78.00            +0.0%      78.00        s=
labinfo.buffer_head.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.buffer_head.active_slabs
     78.00            +0.0%      78.00            +0.0%      78.00        s=
labinfo.buffer_head.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.buffer_head.num_slabs
     10150            -1.4%      10009 =C2=B1  2%      -0.0%      10148    =
    slabinfo.cred_jar.active_objs
    241.00            -1.3%     237.83 =C2=B1  2%      +0.1%     241.17    =
    slabinfo.cred_jar.active_slabs
     10150            -1.4%      10009 =C2=B1  2%      -0.0%      10148    =
    slabinfo.cred_jar.num_objs
    241.00            -1.3%     237.83 =C2=B1  2%      +0.1%     241.17    =
    slabinfo.cred_jar.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.dax_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dax_cache.num_slabs
    169835            +1.3%     172012 =C2=B1  3%      -0.8%     168419 =C2=
=B1  2%  slabinfo.dentry.active_objs
      4077            +1.2%       4125 =C2=B1  3%      -0.7%       4049 =C2=
=B1  2%  slabinfo.dentry.active_slabs
    171255            +1.2%     173272 =C2=B1  3%      -0.7%     170097 =C2=
=B1  2%  slabinfo.dentry.num_objs
      4077            +1.2%       4125 =C2=B1  3%      -0.7%       4049 =C2=
=B1  2%  slabinfo.dentry.num_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.active_slabs
     30.00            +0.0%      30.00            +0.0%      30.00        s=
labinfo.dmaengine-unmap-128.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-128.num_slabs
      1366 =C2=B1 18%      -3.6%       1316 =C2=B1 11%      +0.3%       137=
0 =C2=B1 10%  slabinfo.dmaengine-unmap-16.active_objs
     32.00 =C2=B1 17%      -3.6%      30.83 =C2=B1 11%      +0.5%      32.1=
7 =C2=B1 10%  slabinfo.dmaengine-unmap-16.active_slabs
      1366 =C2=B1 18%      -3.6%       1316 =C2=B1 11%      +0.3%       137=
0 =C2=B1 10%  slabinfo.dmaengine-unmap-16.num_objs
     32.00 =C2=B1 17%      -3.6%      30.83 =C2=B1 11%      +0.5%      32.1=
7 =C2=B1 10%  slabinfo.dmaengine-unmap-16.num_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.active_slabs
     15.00            +0.0%      15.00            +0.0%      15.00        s=
labinfo.dmaengine-unmap-256.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.dmaengine-unmap-256.num_slabs
     32407 =C2=B1  9%      -4.4%      30987 =C2=B1 15%      +1.2%      3278=
8 =C2=B1 12%  slabinfo.ep_head.active_objs
    126.33 =C2=B1  9%      -4.5%     120.67 =C2=B1 16%      +1.2%     127.8=
3 =C2=B1 12%  slabinfo.ep_head.active_slabs
     32407 =C2=B1  9%      -4.4%      30987 =C2=B1 15%      +1.2%      3278=
8 =C2=B1 12%  slabinfo.ep_head.num_objs
    126.33 =C2=B1  9%      -4.5%     120.67 =C2=B1 16%      +1.2%     127.8=
3 =C2=B1 12%  slabinfo.ep_head.num_slabs
      1166 =C2=B1 12%      +1.0%       1177 =C2=B1 14%      -6.0%       109=
5 =C2=B1 11%  slabinfo.file_lock_cache.active_objs
     31.33 =C2=B1 12%      +1.1%      31.67 =C2=B1 13%      -6.4%      29.3=
3 =C2=B1 11%  slabinfo.file_lock_cache.active_slabs
      1166 =C2=B1 12%      +1.0%       1177 =C2=B1 14%      -6.0%       109=
5 =C2=B1 11%  slabinfo.file_lock_cache.num_objs
     31.33 =C2=B1 12%      +1.1%      31.67 =C2=B1 13%      -6.4%      29.3=
3 =C2=B1 11%  slabinfo.file_lock_cache.num_slabs
      6601 =C2=B1  4%      -0.4%       6578 =C2=B1 11%      -3.2%       638=
6 =C2=B1  5%  slabinfo.files_cache.active_objs
    143.17 =C2=B1  4%      -0.5%     142.50 =C2=B1 11%      -3.3%     138.5=
0 =C2=B1  5%  slabinfo.files_cache.active_slabs
      6601 =C2=B1  4%      -0.4%       6578 =C2=B1 11%      -3.2%       638=
6 =C2=B1  5%  slabinfo.files_cache.num_objs
    143.17 =C2=B1  4%      -0.5%     142.50 =C2=B1 11%      -3.3%     138.5=
0 =C2=B1  5%  slabinfo.files_cache.num_slabs
     75065 =C2=B1  3%      +3.5%      77711 =C2=B1  9%      -1.8%      7373=
4 =C2=B1  4%  slabinfo.filp.active_objs
      1178 =C2=B1  3%      +3.5%       1219 =C2=B1 10%      -1.8%       115=
7 =C2=B1  4%  slabinfo.filp.active_slabs
     75430 =C2=B1  3%      +3.5%      78047 =C2=B1 10%      -1.8%      7410=
9 =C2=B1  4%  slabinfo.filp.num_objs
      1178 =C2=B1  3%      +3.5%       1219 =C2=B1 10%      -1.8%       115=
7 =C2=B1  4%  slabinfo.filp.num_slabs
      2575 =C2=B1 10%      +2.7%       2645 =C2=B1 10%      +6.0%       273=
0 =C2=B1 10%  slabinfo.fsnotify_mark_connector.active_objs
     20.00 =C2=B1 10%      +3.3%      20.67 =C2=B1 10%      +6.7%      21.3=
3 =C2=B1 10%  slabinfo.fsnotify_mark_connector.active_slabs
      2575 =C2=B1 10%      +2.7%       2645 =C2=B1 10%      +6.0%       273=
0 =C2=B1 10%  slabinfo.fsnotify_mark_connector.num_objs
     20.00 =C2=B1 10%      +3.3%      20.67 =C2=B1 10%      +6.7%      21.3=
3 =C2=B1 10%  slabinfo.fsnotify_mark_connector.num_slabs
     50405            +0.1%      50433            +0.0%      50405        s=
labinfo.ftrace_event_field.active_objs
    593.00            +0.1%     593.33            +0.0%     593.00        s=
labinfo.ftrace_event_field.active_slabs
     50405            +0.1%      50433            +0.0%      50405        s=
labinfo.ftrace_event_field.num_objs
    593.00            +0.1%     593.33            +0.0%     593.00        s=
labinfo.ftrace_event_field.num_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.hugetlbfs_inode_cache.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.active_slabs
    104.00            +0.0%     104.00            +0.0%     104.00        s=
labinfo.hugetlbfs_inode_cache.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.hugetlbfs_inode_cache.num_slabs
     96529            -0.6%      95978            -0.5%      96047        s=
labinfo.inode_cache.active_objs
      1790            -0.6%       1780            -0.5%       1781        s=
labinfo.inode_cache.active_slabs
     96720            -0.6%      96163            -0.5%      96218        s=
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
    130233            -0.2%     130010            +0.0%     130260        s=
labinfo.kernfs_node_cache.active_objs
      2034            -0.2%       2031            +0.0%       2035        s=
labinfo.kernfs_node_cache.active_slabs
    130233            -0.2%     130010            +0.0%     130260        s=
labinfo.kernfs_node_cache.num_objs
      2034            -0.2%       2031            +0.0%       2035        s=
labinfo.kernfs_node_cache.num_slabs
      1847 =C2=B1  8%      -7.2%       1714 =C2=B1  7%      -6.5%       172=
6 =C2=B1  9%  slabinfo.khugepaged_mm_slot.active_objs
     50.33 =C2=B1  9%      -7.3%      46.67 =C2=B1  7%      -6.6%      47.0=
0 =C2=B1  9%  slabinfo.khugepaged_mm_slot.active_slabs
      1847 =C2=B1  8%      -7.2%       1714 =C2=B1  7%      -6.5%       172=
6 =C2=B1  9%  slabinfo.khugepaged_mm_slot.num_objs
     50.33 =C2=B1  9%      -7.3%      46.67 =C2=B1  7%      -6.6%      47.0=
0 =C2=B1  9%  slabinfo.khugepaged_mm_slot.num_slabs
     15107            -0.4%      15048            -0.3%      15063        s=
labinfo.kmalloc-128.active_objs
    238.33            -0.7%     236.67            -0.3%     237.50        s=
labinfo.kmalloc-128.active_slabs
     15284            -0.7%      15181            -0.3%      15241        s=
labinfo.kmalloc-128.num_objs
    238.33            -0.7%     236.67            -0.3%     237.50        s=
labinfo.kmalloc-128.num_slabs
     61993            -0.3%      61820            +0.0%      62011        s=
labinfo.kmalloc-16.active_objs
    242.67            -0.1%     242.33            +0.1%     243.00        s=
labinfo.kmalloc-16.active_slabs
     62122            -0.1%      62037            +0.1%      62208        s=
labinfo.kmalloc-16.num_objs
    242.67            -0.1%     242.33            +0.1%     243.00        s=
labinfo.kmalloc-16.num_slabs
     10584            -1.0%      10477            -0.8%      10495        s=
labinfo.kmalloc-192.active_objs
    258.00            -1.0%     255.50            -0.7%     256.17        s=
labinfo.kmalloc-192.active_slabs
     10842            -1.0%      10731            -0.6%      10772        s=
labinfo.kmalloc-192.num_objs
    258.00            -1.0%     255.50            -0.7%     256.17        s=
labinfo.kmalloc-192.num_slabs
      9964 =C2=B1  2%      +0.8%      10039 =C2=B1  2%      +0.2%       998=
7        slabinfo.kmalloc-1k.active_objs
    317.67 =C2=B1  2%      +0.6%     319.67 =C2=B1  2%      +0.0%     317.6=
7        slabinfo.kmalloc-1k.active_slabs
     10176 =C2=B1  2%      +0.7%      10246 =C2=B1  2%      -0.0%      1017=
2        slabinfo.kmalloc-1k.num_objs
    317.67 =C2=B1  2%      +0.6%     319.67 =C2=B1  2%      +0.0%     317.6=
7        slabinfo.kmalloc-1k.num_slabs
     16719            -0.1%      16701            +0.1%      16744        s=
labinfo.kmalloc-256.active_objs
    265.50            +0.1%     265.67            +0.3%     266.33        s=
labinfo.kmalloc-256.active_slabs
     17020            +0.2%      17052            +0.2%      17057        s=
labinfo.kmalloc-256.num_objs
    265.50            +0.1%     265.67            +0.3%     266.33        s=
labinfo.kmalloc-256.num_slabs
     12125            -0.6%      12058            +1.1%      12260        s=
labinfo.kmalloc-2k.active_objs
    770.67            -0.5%     766.67            +1.1%     779.17        s=
labinfo.kmalloc-2k.active_slabs
     12334            -0.5%      12273            +1.2%      12479        s=
labinfo.kmalloc-2k.num_objs
    770.67            -0.5%     766.67            +1.1%     779.17        s=
labinfo.kmalloc-2k.num_slabs
    137577            +0.7%     138500            -0.2%     137303        s=
labinfo.kmalloc-32.active_objs
      1078            +0.8%       1086            -0.2%       1075        s=
labinfo.kmalloc-32.active_slabs
    138071            +0.7%     139060            -0.2%     137758        s=
labinfo.kmalloc-32.num_objs
      1078            +0.8%       1086            -0.2%       1075        s=
labinfo.kmalloc-32.num_slabs
      3140            -0.2%       3132            -0.4%       3127        s=
labinfo.kmalloc-4k.active_objs
    396.83            +0.2%     397.67            -0.2%     396.17        s=
labinfo.kmalloc-4k.active_slabs
      3179            +0.1%       3183            -0.2%       3172        s=
labinfo.kmalloc-4k.num_objs
    396.83            +0.2%     397.67            -0.2%     396.17        s=
labinfo.kmalloc-4k.num_slabs
     28067 =C2=B1  2%      +1.2%      28411 =C2=B1  3%      -2.2%      2746=
0 =C2=B1  3%  slabinfo.kmalloc-512.active_objs
    444.17 =C2=B1  2%      +1.3%     450.00 =C2=B1  4%      -1.9%     435.8=
3 =C2=B1  2%  slabinfo.kmalloc-512.active_slabs
     28466 =C2=B1  2%      +1.3%      28850 =C2=B1  3%      -1.9%      2792=
4 =C2=B1  2%  slabinfo.kmalloc-512.num_objs
    444.17 =C2=B1  2%      +1.3%     450.00 =C2=B1  4%      -1.9%     435.8=
3 =C2=B1  2%  slabinfo.kmalloc-512.num_slabs
     88949            -0.1%      88878            -0.2%      88738        s=
labinfo.kmalloc-64.active_objs
      1394            +0.0%       1394            -0.2%       1391        s=
labinfo.kmalloc-64.active_slabs
     89251            +0.0%      89252            -0.2%      89075        s=
labinfo.kmalloc-64.num_objs
      1394            +0.0%       1394            -0.2%       1391        s=
labinfo.kmalloc-64.num_slabs
    105170            +0.1%     105276            +0.1%     105286        s=
labinfo.kmalloc-8.active_objs
    211.33            +0.4%     212.17            +0.4%     212.17        s=
labinfo.kmalloc-8.active_slabs
    108237            +0.7%     108949            +0.7%     108959        s=
labinfo.kmalloc-8.num_objs
    211.33            +0.4%     212.17            +0.4%     212.17        s=
labinfo.kmalloc-8.num_slabs
      1481            -0.0%       1481            +0.1%       1482        s=
labinfo.kmalloc-8k.active_objs
    383.50            -0.1%     383.17            +0.0%     383.67        s=
labinfo.kmalloc-8k.active_slabs
      1535            -0.1%       1535            +0.0%       1536        s=
labinfo.kmalloc-8k.num_objs
    383.50            -0.1%     383.17            +0.0%     383.67        s=
labinfo.kmalloc-8k.num_slabs
     15674 =C2=B1  3%      -0.2%      15642 =C2=B1  2%      -1.5%      1543=
8        slabinfo.kmalloc-96.active_objs
    375.83 =C2=B1  3%      -0.2%     375.17            -1.4%     370.67    =
    slabinfo.kmalloc-96.active_slabs
     15804 =C2=B1  3%      -0.2%      15767 =C2=B1  2%      -1.4%      1557=
9        slabinfo.kmalloc-96.num_objs
    375.83 =C2=B1  3%      -0.2%     375.17            -1.4%     370.67    =
    slabinfo.kmalloc-96.num_slabs
    576.00 =C2=B1  6%      +9.3%     629.33 =C2=B1  9%      +0.0%     576.0=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-128.active_objs
      9.00 =C2=B1  6%      +9.3%       9.83 =C2=B1  9%      +0.0%       9.0=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-128.active_slabs
    576.00 =C2=B1  6%      +9.3%     629.33 =C2=B1  9%      +0.0%     576.0=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-128.num_objs
      9.00 =C2=B1  6%      +9.3%       9.83 =C2=B1  9%      +0.0%       9.0=
0 =C2=B1 11%  slabinfo.kmalloc-rcl-128.num_slabs
     91.00 =C2=B1 17%      -7.7%      84.00            +0.0%      91.00 =C2=
=B1 17%  slabinfo.kmalloc-rcl-192.active_objs
      2.17 =C2=B1 17%      -7.7%       2.00            +0.0%       2.17 =C2=
=B1 17%  slabinfo.kmalloc-rcl-192.active_slabs
     91.00 =C2=B1 17%      -7.7%      84.00            +0.0%      91.00 =C2=
=B1 17%  slabinfo.kmalloc-rcl-192.num_objs
      2.17 =C2=B1 17%      -7.7%       2.00            +0.0%       2.17 =C2=
=B1 17%  slabinfo.kmalloc-rcl-192.num_slabs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.kmalloc-rcl-256.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.kmalloc-rcl-256.active_slabs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.kmalloc-rcl-256.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.kmalloc-rcl-256.num_slabs
     14228            -0.5%      14155            -1.0%      14086        s=
labinfo.kmalloc-rcl-512.active_objs
    222.17            -0.5%     221.00            -1.0%     220.00        s=
labinfo.kmalloc-rcl-512.active_slabs
     14240            -0.6%      14155            -0.9%      14111        s=
labinfo.kmalloc-rcl-512.num_objs
    222.17            -0.5%     221.00            -1.0%     220.00        s=
labinfo.kmalloc-rcl-512.num_slabs
      6907 =C2=B1  2%      +0.1%       6914            -0.9%       6844 =C2=
=B1  4%  slabinfo.kmalloc-rcl-64.active_objs
    107.50 =C2=B1  2%      -0.2%     107.33            -1.1%     106.33 =C2=
=B1  4%  slabinfo.kmalloc-rcl-64.active_slabs
      6907 =C2=B1  2%      +0.1%       6914            -0.9%       6844 =C2=
=B1  4%  slabinfo.kmalloc-rcl-64.num_objs
    107.50 =C2=B1  2%      -0.2%     107.33            -1.1%     106.33 =C2=
=B1  4%  slabinfo.kmalloc-rcl-64.num_slabs
      2059 =C2=B1  6%      -2.3%       2012 =C2=B1  5%      -3.9%       197=
9 =C2=B1  6%  slabinfo.kmalloc-rcl-96.active_objs
     48.67 =C2=B1  6%      -2.1%      47.67 =C2=B1  5%      -3.4%      47.0=
0 =C2=B1  6%  slabinfo.kmalloc-rcl-96.active_slabs
      2059 =C2=B1  6%      -2.3%       2012 =C2=B1  5%      -3.9%       197=
9 =C2=B1  6%  slabinfo.kmalloc-rcl-96.num_objs
     48.67 =C2=B1  6%      -2.1%      47.67 =C2=B1  5%      -3.4%      47.0=
0 =C2=B1  6%  slabinfo.kmalloc-rcl-96.num_slabs
    746.67 =C2=B1 10%      -1.4%     736.00 =C2=B1  8%     -11.4%     661.3=
3 =C2=B1 10%  slabinfo.kmem_cache.active_objs
     11.67 =C2=B1 10%      -1.4%      11.50 =C2=B1  8%     -11.4%      10.3=
3 =C2=B1 10%  slabinfo.kmem_cache.active_slabs
    746.67 =C2=B1 10%      -1.4%     736.00 =C2=B1  8%     -11.4%     661.3=
3 =C2=B1 10%  slabinfo.kmem_cache.num_objs
     11.67 =C2=B1 10%      -1.4%      11.50 =C2=B1  8%     -11.4%      10.3=
3 =C2=B1 10%  slabinfo.kmem_cache.num_slabs
      1217 =C2=B1  6%      -0.9%       1207 =C2=B1  5%      -7.0%       113=
2 =C2=B1  6%  slabinfo.kmem_cache_node.active_objs
     20.67 =C2=B1  6%      -0.8%      20.50 =C2=B1  4%      -6.5%      19.3=
3 =C2=B1  5%  slabinfo.kmem_cache_node.active_slabs
      1322 =C2=B1  6%      -0.8%       1312 =C2=B1  4%      -6.5%       123=
7 =C2=B1  5%  slabinfo.kmem_cache_node.num_objs
     20.67 =C2=B1  6%      -0.8%      20.50 =C2=B1  4%      -6.5%      19.3=
3 =C2=B1  5%  slabinfo.kmem_cache_node.num_slabs
     36193            -0.2%      36109            +0.0%      36195        s=
labinfo.lsm_file_cache.active_objs
    212.00            -0.2%     211.50            +0.0%     212.00        s=
labinfo.lsm_file_cache.active_slabs
     36193            -0.2%      36109            +0.0%      36195        s=
labinfo.lsm_file_cache.num_objs
    212.00            -0.2%     211.50            +0.0%     212.00        s=
labinfo.lsm_file_cache.num_slabs
      5327 =C2=B1  3%      +1.7%       5416 =C2=B1  7%      +1.5%       540=
5 =C2=B1  2%  slabinfo.mm_struct.active_objs
    176.83 =C2=B1  3%      +1.9%     180.17 =C2=B1  7%      +1.5%     179.5=
0 =C2=B1  2%  slabinfo.mm_struct.active_slabs
      5327 =C2=B1  3%      +1.7%       5416 =C2=B1  7%      +1.5%       540=
5 =C2=B1  2%  slabinfo.mm_struct.num_objs
    176.83 =C2=B1  3%      +1.9%     180.17 =C2=B1  7%      +1.5%     179.5=
0 =C2=B1  2%  slabinfo.mm_struct.num_slabs
    900.00 =C2=B1  7%      +7.6%     968.00 =C2=B1  8%      +2.8%     925.5=
0 =C2=B1  7%  slabinfo.mnt_cache.active_objs
     16.67 =C2=B1  7%      +8.0%      18.00 =C2=B1  8%      +3.0%      17.1=
7 =C2=B1  7%  slabinfo.mnt_cache.active_slabs
    900.00 =C2=B1  7%      +7.6%     968.00 =C2=B1  8%      +2.8%     925.5=
0 =C2=B1  7%  slabinfo.mnt_cache.num_objs
     16.67 =C2=B1  7%      +8.0%      18.00 =C2=B1  8%      +3.0%      17.1=
7 =C2=B1  7%  slabinfo.mnt_cache.num_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.active_slabs
     34.00            +0.0%      34.00            +0.0%      34.00        s=
labinfo.mqueue_inode_cache.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.mqueue_inode_cache.num_slabs
      1536            +0.0%       1536            +0.0%       1536        s=
labinfo.names_cache.active_objs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
labinfo.names_cache.active_slabs
      1536            +0.0%       1536            +0.0%       1536        s=
labinfo.names_cache.num_objs
    192.00            +0.0%     192.00            +0.0%     192.00        s=
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
5 =C2=B1  5%  slabinfo.pde_opener.active_objs
    134.17 =C2=B1  5%      +3.4%     138.67 =C2=B1 10%      -2.4%     131.0=
0 =C2=B1  5%  slabinfo.pde_opener.active_slabs
     13716 =C2=B1  5%      +3.6%      14207 =C2=B1 10%      -2.3%      1339=
5 =C2=B1  5%  slabinfo.pde_opener.num_objs
    134.17 =C2=B1  5%      +3.4%     138.67 =C2=B1 10%      -2.4%     131.0=
0 =C2=B1  5%  slabinfo.pde_opener.num_slabs
     13947 =C2=B1  2%      +0.7%      14042            +0.4%      13996    =
    slabinfo.pid.active_objs
    217.17 =C2=B1  2%      +0.7%     218.67            +0.4%     218.00    =
    slabinfo.pid.active_slabs
     13947 =C2=B1  2%      +0.7%      14042            +0.4%      13996    =
    slabinfo.pid.num_objs
    217.17 =C2=B1  2%      +0.7%     218.67            +0.4%     218.00    =
    slabinfo.pid.num_slabs
      3230 =C2=B1  8%      +5.1%       3393 =C2=B1  8%      +4.3%       336=
8 =C2=B1  4%  slabinfo.pool_workqueue.active_objs
     53.00 =C2=B1  8%      +4.1%      55.17 =C2=B1  8%      +3.8%      55.0=
0 =C2=B1  4%  slabinfo.pool_workqueue.active_slabs
      3399 =C2=B1  8%      +4.4%       3549 =C2=B1  8%      +4.4%       354=
9 =C2=B1  4%  slabinfo.pool_workqueue.num_objs
     53.00 =C2=B1  8%      +4.1%      55.17 =C2=B1  8%      +3.8%      55.0=
0 =C2=B1  4%  slabinfo.pool_workqueue.num_slabs
      2772 =C2=B1  3%      +2.5%       2842 =C2=B1  2%      +0.3%       277=
9        slabinfo.proc_dir_entry.active_objs
     66.00 =C2=B1  3%      +2.5%      67.67 =C2=B1  2%      +0.3%      66.1=
7        slabinfo.proc_dir_entry.active_slabs
      2772 =C2=B1  3%      +2.5%       2842 =C2=B1  2%      +0.3%       277=
9        slabinfo.proc_dir_entry.num_objs
     66.00 =C2=B1  3%      +2.5%      67.67 =C2=B1  2%      +0.3%      66.1=
7        slabinfo.proc_dir_entry.num_slabs
     21723 =C2=B1  2%      +1.9%      22136 =C2=B1  2%      -2.2%      2124=
2 =C2=B1  2%  slabinfo.proc_inode_cache.active_objs
    460.00 =C2=B1  2%      +1.6%     467.17 =C2=B1  3%      -1.6%     452.8=
3        slabinfo.proc_inode_cache.active_slabs
     22090 =C2=B1  2%      +1.6%      22440 =C2=B1  3%      -1.5%      2175=
3        slabinfo.proc_inode_cache.num_objs
    460.00 =C2=B1  2%      +1.6%     467.17 =C2=B1  3%      -1.6%     452.8=
3        slabinfo.proc_inode_cache.num_slabs
     28677            +0.1%      28720            +0.3%      28759        s=
labinfo.radix_tree_node.active_objs
    511.50            +0.2%     512.33            +0.3%     513.17        s=
labinfo.radix_tree_node.active_slabs
     28677            +0.1%      28720            +0.3%      28759        s=
labinfo.radix_tree_node.num_objs
    511.50            +0.2%     512.33            +0.3%     513.17        s=
labinfo.radix_tree_node.num_slabs
     24.00 =C2=B1 33%     -11.1%      21.33 =C2=B1 35%     +22.2%      29.3=
3 =C2=B1 20%  slabinfo.request_queue.active_objs
      1.50 =C2=B1 33%     -11.1%       1.33 =C2=B1 35%     +22.2%       1.8=
3 =C2=B1 20%  slabinfo.request_queue.active_slabs
     24.00 =C2=B1 33%     -11.1%      21.33 =C2=B1 35%     +22.2%      29.3=
3 =C2=B1 20%  slabinfo.request_queue.num_objs
      1.50 =C2=B1 33%     -11.1%       1.33 =C2=B1 35%     +22.2%       1.8=
3 =C2=B1 20%  slabinfo.request_queue.num_slabs
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
      8140 =C2=B1  6%      +5.6%       8592 =C2=B1  6%      +2.5%       834=
2 =C2=B1  8%  slabinfo.shmem_inode_cache.active_objs
    176.50 =C2=B1  6%      +5.5%     186.17 =C2=B1  6%      +2.5%     180.8=
3 =C2=B1  8%  slabinfo.shmem_inode_cache.active_slabs
      8140 =C2=B1  6%      +5.6%       8592 =C2=B1  6%      +2.5%       834=
2 =C2=B1  8%  slabinfo.shmem_inode_cache.num_objs
    176.50 =C2=B1  6%      +5.5%     186.17 =C2=B1  6%      +2.5%     180.8=
3 =C2=B1  8%  slabinfo.shmem_inode_cache.num_slabs
      3784 =C2=B1  2%      +0.4%       3801 =C2=B1  6%      -2.3%       369=
6 =C2=B1  2%  slabinfo.sighand_cache.active_objs
    254.67            -0.3%     254.00 =C2=B1  6%      -1.8%     250.00 =C2=
=B1  2%  slabinfo.sighand_cache.active_slabs
      3825            -0.3%       3813 =C2=B1  6%      -1.8%       3755 =C2=
=B1  2%  slabinfo.sighand_cache.num_objs
    254.67            -0.3%     254.00 =C2=B1  6%      -1.8%     250.00 =C2=
=B1  2%  slabinfo.sighand_cache.num_slabs
      5880 =C2=B1  4%      -0.8%       5833 =C2=B1  7%      -4.0%       564=
5 =C2=B1  4%  slabinfo.signal_cache.active_objs
    212.33 =C2=B1  3%      -2.0%     208.00 =C2=B1  7%      -3.9%     204.0=
0 =C2=B1  3%  slabinfo.signal_cache.active_slabs
      5955 =C2=B1  3%      -1.8%       5845 =C2=B1  7%      -3.9%       572=
5 =C2=B1  3%  slabinfo.signal_cache.num_objs
    212.33 =C2=B1  3%      -2.0%     208.00 =C2=B1  7%      -3.9%     204.0=
0 =C2=B1  3%  slabinfo.signal_cache.num_slabs
    128.00            +0.0%     128.00            +0.0%     128.00        s=
labinfo.skbuff_fclone_cache.active_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.skbuff_fclone_cache.active_slabs
    128.00            +0.0%     128.00            +0.0%     128.00        s=
labinfo.skbuff_fclone_cache.num_objs
      2.00            +0.0%       2.00            +0.0%       2.00        s=
labinfo.skbuff_fclone_cache.num_slabs
     13365 =C2=B1  2%      -1.4%      13184 =C2=B1  2%      -1.8%      1313=
0 =C2=B1  3%  slabinfo.skbuff_head_cache.active_objs
    208.83 =C2=B1  2%      -1.2%     206.33 =C2=B1  2%      -1.6%     205.5=
0 =C2=B1  3%  slabinfo.skbuff_head_cache.active_slabs
     13365 =C2=B1  2%      -1.2%      13205 =C2=B1  2%      -1.6%      1315=
2 =C2=B1  3%  slabinfo.skbuff_head_cache.num_objs
    208.83 =C2=B1  2%      -1.2%     206.33 =C2=B1  2%      -1.6%     205.5=
0 =C2=B1  3%  slabinfo.skbuff_head_cache.num_slabs
      4947 =C2=B1  3%      +0.7%       4980 =C2=B1  5%      -0.5%       492=
3 =C2=B1  3%  slabinfo.sock_inode_cache.active_objs
    126.33 =C2=B1  3%      +0.7%     127.17 =C2=B1  5%      -0.7%     125.5=
0 =C2=B1  3%  slabinfo.sock_inode_cache.active_slabs
      4947 =C2=B1  3%      +0.7%       4980 =C2=B1  5%      -0.5%       492=
3 =C2=B1  3%  slabinfo.sock_inode_cache.num_objs
    126.33 =C2=B1  3%      +0.7%     127.17 =C2=B1  5%      -0.7%     125.5=
0 =C2=B1  3%  slabinfo.sock_inode_cache.num_slabs
     11698 =C2=B1  2%      +1.3%      11854            -1.1%      11574 =C2=
=B1  4%  slabinfo.task_delay_info.active_objs
    228.83 =C2=B1  2%      +1.4%     232.00            -1.0%     226.50 =C2=
=B1  4%  slabinfo.task_delay_info.active_slabs
     11698 =C2=B1  2%      +1.3%      11854            -1.1%      11574 =C2=
=B1  4%  slabinfo.task_delay_info.num_objs
    228.83 =C2=B1  2%      +1.4%     232.00            -1.0%     226.50 =C2=
=B1  4%  slabinfo.task_delay_info.num_slabs
      1450 =C2=B1  9%      -2.0%       1421 =C2=B1  6%      -4.6%       138=
4 =C2=B1  2%  slabinfo.task_group.active_objs
     31.00 =C2=B1  8%      -1.1%      30.67 =C2=B1  5%      -4.3%      29.6=
7 =C2=B1  3%  slabinfo.task_group.active_slabs
      1450 =C2=B1  9%      -2.0%       1421 =C2=B1  6%      -4.6%       138=
4 =C2=B1  2%  slabinfo.task_group.num_objs
     31.00 =C2=B1  8%      -1.1%      30.67 =C2=B1  5%      -4.3%      29.6=
7 =C2=B1  3%  slabinfo.task_group.num_slabs
      2322            -0.3%       2315            -0.3%       2314        s=
labinfo.task_struct.active_objs
      2337            -0.3%       2330            -0.3%       2330        s=
labinfo.task_struct.active_slabs
      2337            -0.3%       2330            -0.3%       2330        s=
labinfo.task_struct.num_objs
      2337            -0.3%       2330            -0.3%       2330        s=
labinfo.task_struct.num_slabs
    145.33            +0.1%     145.50            -0.1%     145.17        s=
labinfo.taskstats.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.taskstats.active_slabs
    145.33            +0.1%     145.50            -0.1%     145.17        s=
labinfo.taskstats.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.taskstats.num_slabs
      3798 =C2=B1  2%      +2.0%       3875 =C2=B1  3%      +1.1%       384=
1 =C2=B1  3%  slabinfo.trace_event_file.active_objs
     82.33 =C2=B1  2%      +2.0%      84.00 =C2=B1  3%      +1.4%      83.5=
0 =C2=B1  3%  slabinfo.trace_event_file.active_slabs
      3798 =C2=B1  2%      +2.0%       3875 =C2=B1  3%      +1.1%       384=
1 =C2=B1  3%  slabinfo.trace_event_file.num_objs
     82.33 =C2=B1  2%      +2.0%      84.00 =C2=B1  3%      +1.4%      83.5=
0 =C2=B1  3%  slabinfo.trace_event_file.num_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        s=
labinfo.tw_sock_TCP.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.active_slabs
     66.00            +0.0%      66.00            +0.0%      66.00        s=
labinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.tw_sock_TCP.num_slabs
     88773            -1.2%      87704 =C2=B1  4%      +2.4%      90925 =C2=
=B1  4%  slabinfo.vm_area_struct.active_objs
      2226            -1.1%       2202 =C2=B1  4%      +2.4%       2280 =C2=
=B1  4%  slabinfo.vm_area_struct.active_slabs
     89080            -1.1%      88120 =C2=B1  4%      +2.4%      91254 =C2=
=B1  4%  slabinfo.vm_area_struct.num_objs
      2226            -1.1%       2202 =C2=B1  4%      +2.4%       2280 =C2=
=B1  4%  slabinfo.vm_area_struct.num_slabs
     22474            -0.8%      22304            -0.2%      22438        s=
labinfo.vmap_area.active_objs
    350.83            -0.7%     348.50            -0.1%     350.33        s=
labinfo.vmap_area.active_slabs
     22487            -0.7%      22328            -0.1%      22455        s=
labinfo.vmap_area.num_objs
    350.83            -0.7%     348.50            -0.1%     350.33        s=
labinfo.vmap_area.num_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.active_slabs
     42.00            +0.0%      42.00            +0.0%      42.00        s=
labinfo.xfrm_state.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfrm_state.num_slabs
     60.00 =C2=B1 28%     +10.0%      66.00 =C2=B1 20%      +0.0%      60.0=
0 =C2=B1 28%  slabinfo.xfs_btree_cur.active_objs
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%      +0.0%       1.6=
7 =C2=B1 28%  slabinfo.xfs_btree_cur.active_slabs
     60.00 =C2=B1 28%     +10.0%      66.00 =C2=B1 20%      +0.0%      60.0=
0 =C2=B1 28%  slabinfo.xfs_btree_cur.num_objs
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%      +0.0%       1.6=
7 =C2=B1 28%  slabinfo.xfs_btree_cur.num_slabs
    196.00 =C2=B1 10%      +0.0%     196.00 =C2=B1 10%      -7.1%     182.0=
0 =C2=B1 10%  slabinfo.xfs_buf.active_objs
      4.67 =C2=B1 10%      +0.0%       4.67 =C2=B1 10%      -7.1%       4.3=
3 =C2=B1 10%  slabinfo.xfs_buf.active_slabs
    196.00 =C2=B1 10%      +0.0%     196.00 =C2=B1 10%      -7.1%     182.0=
0 =C2=B1 10%  slabinfo.xfs_buf.num_objs
      4.67 =C2=B1 10%      +0.0%       4.67 =C2=B1 10%      -7.1%       4.3=
3 =C2=B1 10%  slabinfo.xfs_buf.num_slabs
     38.00            +0.0%      38.00            +0.0%      38.00        s=
labinfo.xfs_efi_item.active_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfs_efi_item.active_slabs
     38.00            +0.0%      38.00            +0.0%      38.00        s=
labinfo.xfs_efi_item.num_objs
      1.00            +0.0%       1.00            +0.0%       1.00        s=
labinfo.xfs_efi_item.num_slabs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.xfs_inode.active_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.xfs_inode.active_slabs
     96.00            +0.0%      96.00            +0.0%      96.00        s=
labinfo.xfs_inode.num_objs
      3.00            +0.0%       3.00            +0.0%       3.00        s=
labinfo.xfs_inode.num_slabs
      0.01 =C2=B1  4%      +1.6%       0.01 =C2=B1  8%      -1.6%       0.0=
1 =C2=B1  7%  perf-sched.sch_delay.avg.ms.__x64_sys_pause.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.[unknown]
      1.22 =C2=B1220%     -98.5%       0.02 =C2=B1  6%     -98.5%       0.0=
2 =C2=B1 10%  perf-sched.sch_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      0.01 =C2=B1  6%      +1.6%       0.01 =C2=B1  4%   +3519.7%       0.3=
7 =C2=B1217%  perf-sched.sch_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      5.55 =C2=B1148%     -47.2%       2.93 =C2=B1 53%     -23.8%       4.2=
3 =C2=B1102%  perf-sched.sch_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      0.01 =C2=B1143%    +264.0%       0.03 =C2=B1201%    +208.0%       0.0=
3 =C2=B1151%  perf-sched.sch_delay.avg.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      0.01 =C2=B1  2%   +3901.2%       0.57 =C2=B1214%      +1.2%       0.0=
1 =C2=B1  3%  perf-sched.sch_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
      0.00       +1.5e+102%       1.47 =C2=B1223% +3.1e+102%       3.15 =C2=
=B1223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      0.00 =C2=B1141%     -13.3%       0.00 =C2=B1142%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.58 =C2=B1223%    -100.0%       0.00            +0.1%       0.58 =C2=
=B1223%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.00 =C2=B1159%     -42.9%       0.00 =C2=B1165%     +14.3%       0.0=
0 =C2=B1 82%  perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00       +1.5e+102%       1.46 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.ret_from_fork.[unknown]
      0.02 =C2=B1 18%      +0.0%       0.02 =C2=B1 16%      -3.7%       0.0=
2 =C2=B1 18%  perf-sched.sch_delay.avg.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00          -100.0%       0.00        +2.3e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.io_schedule.__lock_page_killable.filemap_fa=
ult.__do_fault
      0.00 =C2=B1223%     +55.6%       0.00 =C2=B1141%     -55.6%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.avg.ms.kthreadd.ret_from_fork
      0.03 =C2=B1 80%     -29.2%       0.02 =C2=B1 24%    +496.1%       0.1=
5 =C2=B1200%  perf-sched.sch_delay.avg.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      0.00          +2e+99%       0.00 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.__get_free_pages.pgd_alloc
      0.00        +1.8e+99%       0.00 =C2=B1223%  +4.2e+99%       0.00 =C2=
=B1145%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__pmd_alloc.copy_page_range
      1.81 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.alloc_pages_vma.wp_page_copy
      0.00 =C2=B1141%     -42.9%       0.00 =C2=B1223%      -7.1%       0.0=
0 =C2=B1143%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -49.9%       0.1=
7 =C2=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.__flush_work.lru_add_drain_all.khugepaged
      0.00          -100.0%       0.00          +2e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.__km=
alloc.security_prepare_creds.prepare_creds
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
      0.01 =C2=B1 45%     -61.2%       0.00 =C2=B1142%     -29.9%       0.0=
1 =C2=B1 71%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.copy_pte_range.copy_page_range.dup_mmap
      1.15 =C2=B1223%    -100.0%       0.00           -41.6%       0.67 =C2=
=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.copy_strings.isra.0
      0.00 =C2=B1223%    +375.0%       0.00 =C2=B1148%    +275.0%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00 =C2=B1223%    -100.0%       0.00          +133.3%       0.00 =C2=
=B1146%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00        +1.8e+99%       0.00 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_fork.dup_mmap
      0.01 =C2=B1 46%     -81.8%       0.00 =C2=B1223%     -30.9%       0.0=
1 =C2=B1100%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.down_write.dup_mmap.dup_mm
      0.00          -100.0%       0.00        +1.5e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.forc=
e_qs_rnp.rcu_gp_kthread.kthread
      0.67 =C2=B1111%     -23.7%       0.51 =C2=B1 96%     -49.5%       0.3=
4 =C2=B1139%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.khugepaged.kthread.ret_from_fork
      0.00 =C2=B1142%    -100.0%       0.00           -48.1%       0.00 =C2=
=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.anon_vma_fork.dup_mmap
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_fs_struct.copy_process
      0.00          -100.0%       0.00          +2e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_process.kernel_clone
      0.00        +3.8e+99%       0.00 =C2=B1141%  +4.2e+99%       0.00 =C2=
=B1141%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.prepare_creds.copy_creds
      0.00 =C2=B1141%    -100.0%       0.00           +34.5%       0.01 =C2=
=B1101%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_dup.dup_mmap
      0.00          -100.0%       0.00        +1.8e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_node_trace.__get_vm_area_node.__vmalloc_node_range
      0.00          -100.0%       0.00       +1.2e+102%       1.15 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.pipe_write.new_sync_write
      0.00 =C2=B1223%   +1300.0%       0.00 =C2=B1205%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
      9.30            -0.1%       9.29            +0.8%       9.38        p=
erf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.stop_one_=
cpu.sched_exec.bprm_execve
      0.00 =C2=B1223%     +16.7%       0.00 =C2=B1223%    -100.0%       0.0=
0        perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.uprobe_start_dup_mmap.dup_mmap.dup_mm
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched.wp_p=
age_copy.__handle_mm_fault.handle_mm_fault
      0.29 =C2=B1223%    -100.0%       0.00         +1494.5%       4.67 =C2=
=B1223%  perf-sched.sch_delay.avg.ms.preempt_schedule_common.__cond_resched=
.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      0.01 =C2=B1  3%      +1.4%       0.01 =C2=B1  3%      +0.0%       0.0=
1 =C2=B1  3%  perf-sched.sch_delay.avg.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.03 =C2=B1 35%    +168.4%       0.09 =C2=B1145%      -1.0%       0.0=
3 =C2=B1 45%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.02 =C2=B1 40%     +15.4%       0.02 =C2=B1 38%      +9.4%       0.0=
2 =C2=B1 46%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_select
      0.00 =C2=B1 55%     -12.5%       0.00 =C2=B1 31%    +125.0%       0.0=
0 =C2=B1149%  perf-sched.sch_delay.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      0.13 =C2=B1223%    +108.0%       0.27 =C2=B1141%     -99.6%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.avg.ms.schedule_preempt_disabled.kthread=
.ret_from_fork
      0.00          -100.0%       0.00        +2.5e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.avg.ms.schedule_timeout.__skb_wait_for_more_packet=
s.unix_dgram_recvmsg.__sys_recvfrom
      0.01 =C2=B1  4%      +0.0%       0.01 =C2=B1  4%      +0.0%       0.0=
1 =C2=B1  4%  perf-sched.sch_delay.avg.ms.schedule_timeout.kcompactd.kthrea=
d.ret_from_fork
      0.01 =C2=B1 19%      -3.6%       0.01 =C2=B1  4%    +114.5%       0.0=
2 =C2=B1 79%  perf-sched.sch_delay.avg.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.17 =C2=B1223%      -0.1%       0.17 =C2=B1223%    +199.7%       0.5=
0 =C2=B1100%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_for_complet=
ion.__flush_work.lru_add_drain_all
      0.00 =C2=B1223%     +75.0%       0.00 =C2=B1141%      -8.3%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.avg.ms.schedule_timeout.wait_for_complet=
ion_killable.__kthread_create_on_node.kthread_create_on_node
      0.01            +0.0%       0.01            +0.0%       0.01        p=
erf-sched.sch_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      0.02 =C2=B1223%    +151.2%       0.05 =C2=B1223%    +152.7%       0.0=
5 =C2=B1144%  perf-sched.sch_delay.avg.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
      0.47 =C2=B1203%     -92.5%       0.03 =C2=B1 98%     -93.1%       0.0=
3 =C2=B1 82%  perf-sched.sch_delay.avg.ms.worker_thread.kthread.ret_from_fo=
rk
      0.01 =C2=B1 18%     -11.2%       0.01 =C2=B1 10%     -11.2%       0.0=
1 =C2=B1 16%  perf-sched.sch_delay.max.ms.__x64_sys_pause.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe.[unknown]
      1.43 =C2=B1220%     -98.4%       0.02 =C2=B1 21%     -98.6%       0.0=
2 =C2=B1 11%  perf-sched.sch_delay.max.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      0.02 =C2=B1 35%      +5.9%       0.02 =C2=B1 24%  +44610.9%       7.5=
3 =C2=B1223%  perf-sched.sch_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
     16.63 =C2=B1149%     -49.4%       8.41 =C2=B1 51%     -37.5%      10.3=
9 =C2=B1111%  perf-sched.sch_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      1.50 =C2=B1220%     +44.9%       2.17 =C2=B1221%    +227.8%       4.9=
0 =C2=B1158%  perf-sched.sch_delay.max.ms.do_task_dead.do_exit.do_group_exi=
t.__x64_sys_exit_group.do_syscall_64
      0.06 =C2=B1 57%  +2.8e+05%     170.34 =C2=B1219%     +17.9%       0.0=
7 =C2=B1 96%  perf-sched.sch_delay.max.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
      0.00       +1.5e+102%       1.47 =C2=B1223% +3.1e+102%       3.15 =C2=
=B1223%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_exc_page_fault.[unknown]
      2.32 =C2=B1141%      -7.1%       2.15 =C2=B1141%     -99.8%       0.0=
0 =C2=B1154%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      1.16 =C2=B1223%    -100.0%       0.00            +0.1%       1.16 =C2=
=B1223%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.irqentry_exi=
t_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      3.11 =C2=B1140%      +4.5%       3.25 =C2=B1140%    +114.5%       6.6=
8 =C2=B1 73%  perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      0.00       +1.5e+102%       1.46 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_u=
ser_mode.ret_from_fork.[unknown]
      0.02 =C2=B1 15%      +2.1%       0.02 =C2=B1 17%      -6.9%       0.0=
2 =C2=B1 18%  perf-sched.sch_delay.max.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
1%  perf-sched.sch_delay.max.ms.io_schedule.__lock_page_killable.filemap_fa=
ult.__do_fault
      0.00 =C2=B1223%     +55.6%       0.00 =C2=B1141%     -55.6%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.max.ms.kthreadd.ret_from_fork
     16.52 =C2=B1 57%     -52.0%       7.93 =C2=B1 70%   +1012.1%     183.7=
1 =C2=B1208%  perf-sched.sch_delay.max.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      0.00          +2e+99%       0.00 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.__get_free_pages.pgd_alloc
      0.00        +1.8e+99%       0.00 =C2=B1223%  +4.2e+99%       0.00 =C2=
=B1145%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__pmd_alloc.copy_page_range
      1.81 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.alloc_pages_vma.wp_page_copy
      0.00 =C2=B1141%     -42.9%       0.00 =C2=B1223%      -7.1%       0.0=
0 =C2=B1143%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc
      0.33 =C2=B1141%     -50.0%       0.17 =C2=B1223%     -49.9%       0.1=
7 =C2=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.__flush_work.lru_add_drain_all.khugepaged
      0.00          -100.0%       0.00          +2e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.__km=
alloc.security_prepare_creds.prepare_creds
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
      0.01 =C2=B1 45%     -59.4%       0.00 =C2=B1143%     -30.4%       0.0=
1 =C2=B1 71%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.copy_pte_range.copy_page_range.dup_mmap
      1.15 =C2=B1223%    -100.0%       0.00           -41.6%       0.67 =C2=
=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.copy_strings.isra.0
      0.00 =C2=B1223%    +100.0%       0.00 =C2=B1142%     +15.4%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00 =C2=B1223%    -100.0%       0.00          +133.3%       0.00 =C2=
=B1146%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00        +1.8e+99%       0.00 =C2=B1223%    -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_fork.dup_mmap
      0.01 =C2=B1 46%     -82.1%       0.00 =C2=B1223%     -32.1%       0.0=
1 =C2=B1100%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.down_write.dup_mmap.dup_mm
      0.00          -100.0%       0.00        +1.5e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.forc=
e_qs_rnp.rcu_gp_kthread.kthread
      0.67 =C2=B1111%     -23.7%       0.51 =C2=B1 96%     -49.5%       0.3=
4 =C2=B1139%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.khugepaged.kthread.ret_from_fork
      0.00 =C2=B1142%    -100.0%       0.00           -48.1%       0.00 =C2=
=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.anon_vma_fork.dup_mmap
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_fs_struct.copy_process
      0.00          -100.0%       0.00          +2e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_process.kernel_clone
      0.00        +3.8e+99%       0.00 =C2=B1141%  +4.3e+99%       0.00 =C2=
=B1141%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.prepare_creds.copy_creds
      0.00 =C2=B1141%    -100.0%       0.00           +34.5%       0.01 =C2=
=B1101%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_dup.dup_mmap
      0.00          -100.0%       0.00        +1.8e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_node_trace.__get_vm_area_node.__vmalloc_node_range
      0.00          -100.0%       0.00       +1.2e+102%       1.15 =C2=B122=
3%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.pipe_write.new_sync_write
      0.33 =C2=B1179%   +1481.4%       5.27 =C2=B1210%     -74.5%       0.0=
9 =C2=B1 65%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
     20.25 =C2=B1  3%      +2.3%      20.71 =C2=B1  7%      +0.3%      20.3=
0 =C2=B1  2%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.sched_exec.bprm_execve
      0.00 =C2=B1223%     +16.7%       0.00 =C2=B1223%    -100.0%       0.0=
0        perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.uprobe_start_dup_mmap.dup_mmap.dup_mm
      0.00 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched.wp_p=
age_copy.__handle_mm_fault.handle_mm_fault
      0.29 =C2=B1223%    -100.0%       0.00         +1494.5%       4.67 =C2=
=B1223%  perf-sched.sch_delay.max.ms.preempt_schedule_common.__cond_resched=
.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      0.02 =C2=B1 27%      -9.3%       0.02 =C2=B1 30%      -7.0%       0.0=
2 =C2=B1 23%  perf-sched.sch_delay.max.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
      0.18 =C2=B1 28%   +1158.7%       2.23 =C2=B1203%     +83.9%       0.3=
3 =C2=B1108%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      0.03 =C2=B1 63%     +21.3%       0.04 =C2=B1 55%      +9.6%       0.0=
3 =C2=B1 58%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_select
      0.04 =C2=B1140%      +3.1%       0.04 =C2=B1160%    +708.6%       0.3=
4 =C2=B1215%  perf-sched.sch_delay.max.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      0.13 =C2=B1223%    +108.0%       0.27 =C2=B1141%     -99.6%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.max.ms.schedule_preempt_disabled.kthread=
.ret_from_fork
      0.00          -100.0%       0.00        +2.5e+99%       0.00 =C2=B122=
3%  perf-sched.sch_delay.max.ms.schedule_timeout.__skb_wait_for_more_packet=
s.unix_dgram_recvmsg.__sys_recvfrom
      0.02 =C2=B1 30%     -13.8%       0.02 =C2=B1 28%     -18.7%       0.0=
2 =C2=B1 34%  perf-sched.sch_delay.max.ms.schedule_timeout.kcompactd.kthrea=
d.ret_from_fork
      1.54 =C2=B1214%     -98.0%       0.03 =C2=B1 14%   +1162.8%      19.4=
4 =C2=B1139%  perf-sched.sch_delay.max.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.17 =C2=B1223%      -0.1%       0.17 =C2=B1223%    +199.7%       0.5=
0 =C2=B1100%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_complet=
ion.__flush_work.lru_add_drain_all
      0.00 =C2=B1223%     +75.0%       0.00 =C2=B1141%      -8.3%       0.0=
0 =C2=B1223%  perf-sched.sch_delay.max.ms.schedule_timeout.wait_for_complet=
ion_killable.__kthread_create_on_node.kthread_create_on_node
      0.10 =C2=B1 53%     -18.2%       0.08 =C2=B1 66%     -23.1%       0.0=
8 =C2=B1 70%  perf-sched.sch_delay.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
      1.37 =C2=B1223%     +56.6%       2.15 =C2=B1223%    +162.9%       3.6=
1 =C2=B1145%  perf-sched.sch_delay.max.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
    281.88 =C2=B1209%     -95.1%      13.89 =C2=B1149%     -95.7%      12.2=
3 =C2=B1120%  perf-sched.sch_delay.max.ms.worker_thread.kthread.ret_from_fo=
rk
      0.16 =C2=B1 18%      -0.2%       0.16 =C2=B1 15%      -3.1%       0.1=
6 =C2=B1 16%  perf-sched.total_sch_delay.average.ms
    299.16 =C2=B1194%     -37.7%     186.38 =C2=B1197%     -31.2%     205.8=
5 =C2=B1181%  perf-sched.total_sch_delay.max.ms
    138.15 =C2=B1  4%      +2.7%     141.87 =C2=B1  4%      -1.1%     136.6=
1 =C2=B1  2%  perf-sched.total_wait_and_delay.average.ms
     18395 =C2=B1  5%      -2.3%      17967 =C2=B1  6%      +1.2%      1861=
4 =C2=B1  3%  perf-sched.total_wait_and_delay.count.ms
      8283 =C2=B1  5%      +4.6%       8662 =C2=B1  8%      -4.4%       791=
6 =C2=B1  5%  perf-sched.total_wait_and_delay.max.ms
    137.98 =C2=B1  4%      +2.7%     141.71 =C2=B1  4%      -1.1%     136.4=
6 =C2=B1  2%  perf-sched.total_wait_time.average.ms
      8283 =C2=B1  5%      +4.6%       8662 =C2=B1  8%      -4.4%       791=
5 =C2=B1  5%  perf-sched.total_wait_time.max.ms
    900.94            -0.2%     899.41            -2.0%     882.75 =C2=B1  =
4%  perf-sched.wait_and_delay.avg.ms.__x64_sys_pause.do_syscall_64.entry_SY=
SCALL_64_after_hwframe.[unknown]
      2175 =C2=B1 15%     -10.3%       1951 =C2=B1 11%      -9.0%       198=
0 =C2=B1 10%  perf-sched.wait_and_delay.avg.ms.devkmsg_read.vfs_read.ksys_r=
ead.do_syscall_64
    786.59 =C2=B1  5%      +3.0%     809.84 =C2=B1  5%      +6.0%     833.7=
9 =C2=B1  4%  perf-sched.wait_and_delay.avg.ms.do_nanosleep.hrtimer_nanosle=
ep.__x64_sys_nanosleep.do_syscall_64
      2122 =C2=B1  6%      -7.8%       1956 =C2=B1 11%      +1.5%       215=
3 =C2=B1 20%  perf-sched.wait_and_delay.avg.ms.do_syslog.part.0.kmsg_read.v=
fs_read
    211.03 =C2=B1  4%      -2.5%     205.76            -2.8%     205.20    =
    perf-sched.wait_and_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x=
64_sys_exit_group.do_syscall_64
     86.32 =C2=B1  8%      +8.1%      93.30 =C2=B1  6%      +8.7%      93.8=
7 =C2=B1 10%  perf-sched.wait_and_delay.avg.ms.do_wait.kernel_wait4.__do_sy=
s_wait4.do_syscall_64
      0.27 =C2=B1 50%     -32.5%       0.18 =C2=B1 17%     -18.0%       0.2=
2 =C2=B1 21%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.ir=
qentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.13 =C2=B1 57%    +123.4%       0.29 =C2=B1 79%     -34.4%       0.0=
9 =C2=B1 22%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.ir=
qentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.17 =C2=B1  6%      +3.5%       0.18 =C2=B1  8%     +15.7%       0.2=
0 =C2=B1 34%  perf-sched.wait_and_delay.avg.ms.exit_to_user_mode_prepare.sy=
scall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    119.82 =C2=B1156%     +63.9%     196.38 =C2=B1223%     -68.9%      37.2=
7 =C2=B1223%  perf-sched.wait_and_delay.avg.ms.futex_wait_queue_me.futex_wa=
it.do_futex.__x64_sys_futex
      0.00        +7.8e+99%       0.01 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.avg.ms.io_schedule.__lock_page_killable.filem=
ap_fault.__do_fault
     90.11 =C2=B1 37%     +22.5%     110.41 =C2=B1 31%     -17.1%      74.7=
4 =C2=B1 19%  perf-sched.wait_and_delay.avg.ms.pipe_read.new_sync_read.vfs_=
read.ksys_read
    357.66 =C2=B1223%     -75.7%      86.82 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
    459.91 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.__do_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +3.6e+104%     357.49 =C2=B122=
3%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.1e+105%       1077 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.generic_file_write_iter.new_sync_write
    567.81 =C2=B1 73%     +62.2%     921.21 =C2=B1 68%     +46.6%     832.2=
6 =C2=B1 72%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__co=
nd_resched.generic_perform_write.__generic_file_write_iter.generic_file_wri=
te_iter
      4.95 =C2=B1  9%      -1.9%       4.85 =C2=B1  7%      -2.2%       4.8=
4 =C2=B1  8%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__co=
nd_resched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
      9.30            -0.1%       9.29            +0.9%       9.39        p=
erf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_resched.stop=
_one_cpu.sched_exec.bprm_execve
    359.76 =C2=B1223%    -100.0%       0.00            -6.9%     334.81 =C2=
=B1223%  perf-sched.wait_and_delay.avg.ms.preempt_schedule_common.__cond_re=
sched.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
    619.14 =C2=B1 13%      -6.1%     581.61 =C2=B1 15%      -4.2%     593.3=
0 =C2=B1 23%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clo=
ck.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    120.65 =C2=B1  7%      +0.2%     120.88 =C2=B1  4%      -2.8%     117.2=
8 =C2=B1  8%  perf-sched.wait_and_delay.avg.ms.schedule_hrtimeout_range_clo=
ck.poll_schedule_timeout.constprop.0.do_sys_poll
    478.84            -0.0%     478.64            -0.1%     478.58        p=
erf-sched.wait_and_delay.avg.ms.schedule_timeout.kcompactd.kthread.ret_from=
_fork
      5.48 =C2=B1  7%      -5.0%       5.21 =C2=B1  6%      +4.7%       5.7=
4 =C2=B1 14%  perf-sched.wait_and_delay.avg.ms.schedule_timeout.rcu_gp_kthr=
ead.kthread.ret_from_fork
    619.04 =C2=B1  2%      +0.5%     622.28            +0.9%     624.69    =
    perf-sched.wait_and_delay.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
    541.74 =C2=B1  4%      -0.9%     536.80 =C2=B1  4%      -1.2%     535.3=
3 =C2=B1  4%  perf-sched.wait_and_delay.avg.ms.worker_thread.kthread.ret_fr=
om_fork
     10.17 =C2=B1  3%      -1.6%      10.00            -1.6%      10.00    =
    perf-sched.wait_and_delay.count.__x64_sys_pause.do_syscall_64.entry_SYS=
CALL_64_after_hwframe.[unknown]
      3.00 =C2=B1 19%     +11.1%       3.33 =C2=B1 14%     +11.1%       3.3=
3 =C2=B1 14%  perf-sched.wait_and_delay.count.devkmsg_read.vfs_read.ksys_re=
ad.do_syscall_64
     23.00 =C2=B1  5%      -2.2%      22.50 =C2=B1  4%      -5.8%      21.6=
7 =C2=B1  4%  perf-sched.wait_and_delay.count.do_nanosleep.hrtimer_nanoslee=
p.__x64_sys_nanosleep.do_syscall_64
      3.00           +11.1%       3.33 =C2=B1 14%      +5.6%       3.17 =C2=
=B1 21%  perf-sched.wait_and_delay.count.do_syslog.part.0.kmsg_read.vfs_read
    282.50 =C2=B1  3%      +1.0%     285.33 =C2=B1  2%      -0.8%     280.3=
3        perf-sched.wait_and_delay.count.do_task_dead.do_exit.do_group_exit=
.__x64_sys_exit_group.do_syscall_64
    313.00 =C2=B1  2%      +0.5%     314.50            -0.3%     312.17    =
    perf-sched.wait_and_delay.count.do_wait.kernel_wait4.__do_sys_wait4.do_=
syscall_64
    882.17 =C2=B1  7%      +0.8%     889.33 =C2=B1  7%      -2.4%     861.0=
0 =C2=B1 10%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.irq=
entry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
    282.67 =C2=B1 27%     -13.9%     243.33 =C2=B1 32%     +23.2%     348.1=
7 =C2=B1 28%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.irq=
entry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      6715 =C2=B1  5%      -2.7%       6534 =C2=B1  6%      +0.9%       677=
4 =C2=B1  3%  perf-sched.wait_and_delay.count.exit_to_user_mode_prepare.sys=
call_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
      1.00 =C2=B1152%     -33.3%       0.67 =C2=B1223%     -66.7%       0.3=
3 =C2=B1223%  perf-sched.wait_and_delay.count.futex_wait_queue_me.futex_wai=
t.do_futex.__x64_sys_futex
      0.00         +2e+103%      20.33 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.count.io_schedule.__lock_page_killable.filema=
p_fault.__do_fault
      1577 =C2=B1 27%     -19.1%       1276 =C2=B1 33%     +10.3%       173=
9 =C2=B1 20%  perf-sched.wait_and_delay.count.pipe_read.new_sync_read.vfs_r=
ead.ksys_read
      0.50 =C2=B1223%     +66.7%       0.83 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_res=
ched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
__do_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00         +5e+101%       0.50 =C2=B122=
3%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
down_write.generic_file_write_iter.new_sync_write
     10.17 =C2=B1106%     -37.7%       6.33 =C2=B1 83%     -26.2%       7.5=
0 =C2=B1 78%  perf-sched.wait_and_delay.count.preempt_schedule_common.__con=
d_resched.generic_perform_write.__generic_file_write_iter.generic_file_writ=
e_iter
      2164 =C2=B1  3%      -1.0%       2141 =C2=B1  2%      -0.9%       214=
4 =C2=B1  3%  perf-sched.wait_and_delay.count.preempt_schedule_common.__con=
d_resched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
    281.33 =C2=B1  3%      +0.8%     283.50            -0.9%     278.67    =
    perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_resched.=
stop_one_cpu.sched_exec.bprm_execve
      0.17 =C2=B1223%    -100.0%       0.00            +0.0%       0.17 =C2=
=B1223%  perf-sched.wait_and_delay.count.preempt_schedule_common.__cond_res=
ched.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
     17.67 =C2=B1 54%     +36.8%      24.17 =C2=B1 40%     +44.3%      25.5=
0 =C2=B1 54%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_cloc=
k.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
    196.50 =C2=B1  7%      -0.3%     195.83 =C2=B1  4%      +2.9%     202.1=
7 =C2=B1  8%  perf-sched.wait_and_delay.count.schedule_hrtimeout_range_cloc=
k.poll_schedule_timeout.constprop.0.do_sys_poll
     80.17 =C2=B1  2%      -0.8%      79.50 =C2=B1  2%      -1.0%      79.3=
3 =C2=B1  2%  perf-sched.wait_and_delay.count.schedule_timeout.kcompactd.kt=
hread.ret_from_fork
      1815 =C2=B1  6%      +5.5%       1916 =C2=B1  7%      -2.5%       177=
0 =C2=B1 15%  perf-sched.wait_and_delay.count.schedule_timeout.rcu_gp_kthre=
ad.kthread.ret_from_fork
      2998 =C2=B1  2%      -0.7%       2978 =C2=B1  2%      -0.8%       297=
5 =C2=B1  2%  perf-sched.wait_and_delay.count.smpboot_thread_fn.kthread.ret=
_from_fork
    591.67 =C2=B1  5%      +2.6%     607.00 =C2=B1  2%      +2.1%     604.0=
0 =C2=B1  3%  perf-sched.wait_and_delay.count.worker_thread.kthread.ret_fro=
m_fork
    999.40            -0.0%     999.39            -0.0%     999.39        p=
erf-sched.wait_and_delay.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.[unknown]
      6262 =C2=B1  4%      +1.4%       6348 =C2=B1  2%      +2.1%       639=
2 =C2=B1  3%  perf-sched.wait_and_delay.max.ms.devkmsg_read.vfs_read.ksys_r=
ead.do_syscall_64
      1000            +0.0%       1000            +1.5%       1015 =C2=B1  =
3%  perf-sched.wait_and_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_s=
ys_nanosleep.do_syscall_64
      6288 =C2=B1  5%      +1.2%       6362 =C2=B1  2%      +1.8%       639=
9 =C2=B1  3%  perf-sched.wait_and_delay.max.ms.do_syslog.part.0.kmsg_read.v=
fs_read
      1729 =C2=B1 94%     -42.2%       1000           -42.2%       1000    =
    perf-sched.wait_and_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x=
64_sys_exit_group.do_syscall_64
      1018            +0.3%       1022            +0.2%       1021        p=
erf-sched.wait_and_delay.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_sysc=
all_64
     53.78 =C2=B1152%     -67.7%      17.37 =C2=B1 24%     -53.4%      25.0=
9 =C2=B1 93%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.ir=
qentry_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      7.22 =C2=B1 50%    +363.1%      33.41 =C2=B1116%     -33.4%       4.8=
0 =C2=B1 32%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.ir=
qentry_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
     55.57 =C2=B1 46%     +29.7%      72.06 =C2=B1 41%    +261.9%     201.1=
1 =C2=B1177%  perf-sched.wait_and_delay.max.ms.exit_to_user_mode_prepare.sy=
scall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    405.17 =C2=B1179%     +93.7%     784.98 =C2=B1223%     -81.6%      74.5=
4 =C2=B1223%  perf-sched.wait_and_delay.max.ms.futex_wait_queue_me.futex_wa=
it.do_futex.__x64_sys_futex
      0.00       +3.7e+100%       0.04 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.max.ms.io_schedule.__lock_page_killable.filem=
ap_fault.__do_fault
      6264 =C2=B1  4%      +1.4%       6351 =C2=B1  2%      +2.1%       639=
5 =C2=B1  3%  perf-sched.wait_and_delay.max.ms.pipe_read.new_sync_read.vfs_=
read.ksys_read
      1068 =C2=B1223%     -60.1%     426.41 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
    917.65 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.__do_fault.do_fault.__handle_mm_fault
      0.00          -100.0%       0.00       +1.1e+105%       1066 =C2=B122=
3%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +1.1e+105%       1077 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_resched=
.down_write.generic_file_write_iter.new_sync_write
      4186 =C2=B1 66%     +22.1%       5110 =C2=B1 44%     +23.3%       516=
2 =C2=B1 45%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__co=
nd_resched.generic_perform_write.__generic_file_write_iter.generic_file_wri=
te_iter
      2308 =C2=B1 25%      +1.1%       2333 =C2=B1 24%      +0.1%       230=
9 =C2=B1 25%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__co=
nd_resched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
     20.25 =C2=B1  3%      +2.3%      20.71 =C2=B1  7%      +0.3%      20.3=
0 =C2=B1  2%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__co=
nd_resched.stop_one_cpu.sched_exec.bprm_execve
    359.76 =C2=B1223%    -100.0%       0.00            -6.9%     334.81 =C2=
=B1223%  perf-sched.wait_and_delay.max.ms.preempt_schedule_common.__cond_re=
sched.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      5932 =C2=B1  5%      -3.7%       5714 =C2=B1 11%      +3.0%       610=
8 =C2=B1  4%  perf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clo=
ck.ep_poll.do_epoll_wait.__x64_sys_epoll_wait
      4684            -0.9%       4640            +0.1%       4688        p=
erf-sched.wait_and_delay.max.ms.schedule_hrtimeout_range_clock.poll_schedul=
e_timeout.constprop.0.do_sys_poll
    505.02            -0.0%     505.01            -0.0%     505.01        p=
erf-sched.wait_and_delay.max.ms.schedule_timeout.kcompactd.kthread.ret_from=
_fork
    276.17 =C2=B1 32%     -11.1%     245.51 =C2=B1 17%      +3.0%     284.5=
1 =C2=B1 44%  perf-sched.wait_and_delay.max.ms.schedule_timeout.rcu_gp_kthr=
ead.kthread.ret_from_fork
      7293 =C2=B1 18%     -12.8%       6359 =C2=B1 28%     -23.3%       559=
8 =C2=B1 18%  perf-sched.wait_and_delay.max.ms.smpboot_thread_fn.kthread.re=
t_from_fork
      7627 =C2=B1  9%     +13.6%       8662 =C2=B1  8%      +3.8%       791=
6 =C2=B1  5%  perf-sched.wait_and_delay.max.ms.worker_thread.kthread.ret_fr=
om_fork
    900.93            -0.2%     899.40            -2.0%     882.74 =C2=B1  =
4%  perf-sched.wait_time.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL=
_64_after_hwframe.[unknown]
      2174 =C2=B1 15%     -10.3%       1951 =C2=B1 11%      -8.9%       198=
0 =C2=B1 10%  perf-sched.wait_time.avg.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
    786.58 =C2=B1  5%      +3.0%     809.83 =C2=B1  5%      +6.0%     833.4=
3 =C2=B1  4%  perf-sched.wait_time.avg.ms.do_nanosleep.hrtimer_nanosleep.__=
x64_sys_nanosleep.do_syscall_64
      2116 =C2=B1  6%      -7.7%       1953 =C2=B1 11%      +1.6%       214=
9 =C2=B1 20%  perf-sched.wait_time.avg.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
    211.02 =C2=B1  4%      -2.5%     205.73            -2.8%     205.17    =
    perf-sched.wait_time.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sy=
s_exit_group.do_syscall_64
     86.31 =C2=B1  8%      +7.4%      92.73 =C2=B1  6%      +8.7%      93.8=
6 =C2=B1 10%  perf-sched.wait_time.avg.ms.do_wait.kernel_wait4.__do_sys_wai=
t4.do_syscall_64
      0.01 =C2=B1223%   +1871.1%       0.15 =C2=B1200%      +0.0%       0.0=
1 =C2=B1223%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_exc_page_fault.[unknown]
      0.27 =C2=B1 51%     -32.7%       0.18 =C2=B1 18%     -17.2%       0.2=
2 =C2=B1 21%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.00          -100.0%       0.00        +2.3e+99%       0.00 =C2=B122=
3%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_call_function.[unknown]
      0.13 =C2=B1 57%    +123.4%       0.29 =C2=B1 79%     -34.4%       0.0=
9 =C2=B1 22%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.12 =C2=B1110%    +171.4%       0.31 =C2=B1191%    +548.9%       0.7=
5 =C2=B1215%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_irq_work.[unknown]
      1.11 =C2=B1217%     -35.4%       0.72 =C2=B1206%    +108.8%       2.3=
2 =C2=B1106%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.17 =C2=B1  6%      +3.9%       0.17 =C2=B1  8%     +15.7%       0.1=
9 =C2=B1 35%  perf-sched.wait_time.avg.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    119.81 =C2=B1156%     +84.0%     220.40 =C2=B1194%     -51.8%      57.7=
8 =C2=B1150%  perf-sched.wait_time.avg.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00        +7.8e+99%       0.01 =C2=B1223% +3.2e+101%       0.32 =C2=
=B1208%  perf-sched.wait_time.avg.ms.io_schedule.__lock_page_killable.filem=
ap_fault.__do_fault
      0.00          -100.0%       0.00       +1.6e+100%       0.02 =C2=B114=
1%  perf-sched.wait_time.avg.ms.io_schedule.put_and_wait_on_page_locked.do_=
swap_page.__handle_mm_fault
     90.09 =C2=B1 37%     +22.5%     110.39 =C2=B1 31%     -17.2%      74.5=
9 =C2=B1 18%  perf-sched.wait_time.avg.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      1.28 =C2=B1 87%     -11.1%       1.14 =C2=B1104%     -50.8%       0.6=
3 =C2=B1 44%  perf-sched.wait_time.avg.ms.pipe_write.new_sync_write.vfs_wri=
te.ksys_write
      0.00       +1.3e+100%       0.01 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.__get_free_pages.pgd_alloc
      0.00       +1.4e+100%       0.01 =C2=B1223% +1.8e+102%       1.83 =C2=
=B1221%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__pmd_alloc.copy_page_range
    379.68 =C2=B1208%     -74.7%      95.92 =C2=B1198%     -97.3%      10.0=
8 =C2=B1 28%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
      0.03 =C2=B1141%   +5972.1%       1.81 =C2=B1223%   +7651.4%       2.3=
1 =C2=B1222%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc
    468.38 =C2=B1218%     -98.2%       8.60 =C2=B1 90%     -99.0%       4.7=
4 =C2=B1110%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.__do_fault.do_fault.__handle_mm_fault
      0.00        +2.5e+99%       0.00 =C2=B1223%  +2.3e+99%       0.00 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.__kmalloc.inotify_handle_inode_event.fsnotify
      0.00          -100.0%       0.00       +1.5e+100%       0.01 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.__km=
alloc.security_prepare_creds.prepare_creds
      0.03 =C2=B1141%    -100.0%       0.00        +14815.7%       4.13 =C2=
=B1142%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.__kmalloc.security_task_alloc.copy_process
      0.01 =C2=B1223%  +16979.0%       2.31 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.__kmalloc_node.__vmalloc_node_range.dup_task_struct
      0.00       +2.3e+102%       2.28 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.cgro=
up_can_fork.copy_process.kernel_clone
      1.30 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.chan=
ge_p4d_range.change_protection.mprotect_fixup
      2.13 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      4.91 =C2=B1105%     -76.4%       1.16 =C2=B1220%     -86.7%       0.6=
5 =C2=B1207%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.copy_pte_range.copy_page_range.dup_mmap
      8.56 =C2=B1 61%      +9.7%       9.40 =C2=B1 51%   +4145.2%     363.5=
9 =C2=B1219%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +8.6e+100%       0.09 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_read.walk_component.link_path_walk
      0.47 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_clone.__split_vma
      0.01 =C2=B1223%    -100.0%       0.00        +17919.5%       2.31 =C2=
=B1222%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00       +1.4e+100%       0.01 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_fork.dup_mmap
      0.07 =C2=B1 44%     -79.4%       0.01 =C2=B1223%     -40.5%       0.0=
4 =C2=B1100%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.down_write.dup_mmap.dup_mm
      0.00       +1.1e+105%       1077 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.generic_file_write_iter.new_sync_write
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.unlink_anon_vmas.free_pgtables
      2.13 =C2=B1223%     -54.8%       0.96 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.down_write.unlink_file_vma.free_pgtables
      0.00          -100.0%       0.00       +3.4e+101%       0.34 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.down=
_write.vma_link.mmap_region
      9.96 =C2=B1 15%     -37.9%       6.19 =C2=B1 52%      +0.4%      10.0=
0 =C2=B1 19%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.dput.__fput.task_work_run
      0.00         +8e+101%       0.80 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.dput=
.terminate_walk.path_lookupat
      0.00          -100.0%       0.00       +1.2e+101%       0.12 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.exit=
_mmap.mmput.begin_new_exec
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.exit=
_mmap.mmput.do_exit
      0.00          -100.0%       0.00       +6.4e+101%       0.64 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.forc=
e_qs_rnp.rcu_gp_kthread.kthread
    569.95 =C2=B1 73%     +61.8%     922.28 =C2=B1 68%     +46.1%     832.8=
9 =C2=B1 72%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er
      0.01 =C2=B1104%      -8.1%       0.01 =C2=B1141%     +45.9%       0.0=
1 =C2=B1110%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.khugepaged.kthread.ret_from_fork
      0.00       +5.4e+100%       0.05 =C2=B1223% +1.6e+101%       0.16 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.__alloc_file.alloc_empty_file
      3.46 =C2=B1152%    -100.0%       0.00           -99.6%       0.01 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.anon_vma_fork.dup_mmap
      1.81 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_fs_struct.copy_process
      0.00          -100.0%       0.00       +1.4e+100%       0.01 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_process.kernel_clone
      0.00         +3e+100%       0.03 =C2=B1141% +2.7e+100%       0.03 =C2=
=B1141%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.prepare_creds.copy_creds
      0.09 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.vm_area_alloc.mmap_region
      0.07 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.vm_area_dup.__split_vma
      4.42 =C2=B1142%    -100.0%       0.00           -47.4%       2.33 =C2=
=B1220%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_dup.dup_mmap
      0.00          -100.0%       0.00       +1.4e+100%       0.01 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_node_trace.__get_vm_area_node.__vmalloc_node_range
      0.00       +3.2e+101%       0.32 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_trace.perf_event_mmap.mmap_region
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_trace.perf_event_mmap.mprotect_fixup
      0.00          -100.0%       0.00       +2.3e+100%       0.02 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.__fdget_pos.ksys_write
      0.00          -100.0%       0.00       +1.3e+101%       0.13 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.kernfs_dop_revalidate.lookup_fast
      0.00       +6.6e+101%       0.66 =C2=B1222%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.perf_event_ctx_lock_nested.isra
      0.84 =C2=B1160%     +32.2%       1.11 =C2=B1128%    +125.7%       1.8=
9 =C2=B1173%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.perf_poll.do_sys_poll
      0.00          -100.0%       0.00       +2.1e+102%       2.13 =C2=B122=
3%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.pipe_write.new_sync_write
      0.00       +3.1e+101%       0.31 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.remo=
ve_vma.exit_mmap.mmput
      4.95 =C2=B1  9%      -2.0%       4.85 =C2=B1  8%      -2.2%       4.8=
4 =C2=B1  8%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
      0.00        +1.7e+98%       0.00 =C2=B1223%  +2.5e+99%       0.00 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.stop_one_cpu.sched_exec.bprm_execve
      0.01 =C2=B1223%  +15879.1%       2.29 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.uprobe_start_dup_mmap.dup_mmap.dup_mm
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched.wp_p=
age_copy.__handle_mm_fault.handle_mm_fault
    359.47 =C2=B1223%    -100.0%       0.00            -8.2%     330.14 =C2=
=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_resched=
.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      0.14 =C2=B1223%    +832.9%       1.30 =C2=B1223%     -98.2%       0.0=
0 =C2=B1223%  perf-sched.wait_time.avg.ms.preempt_schedule_common.__cond_re=
sched.zap_pte_range.unmap_page_range.unmap_vmas
      2.72 =C2=B1  6%      +3.3%       2.81 =C2=B1  4%      -0.9%       2.7=
0 =C2=B1  5%  perf-sched.wait_time.avg.ms.rcu_gp_kthread.kthread.ret_from_f=
ork
    619.11 =C2=B1 13%      -6.1%     581.52 =C2=B1 15%      -4.2%     593.2=
7 =C2=B1 23%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
    120.65 =C2=B1  7%      +0.2%     120.88 =C2=B1  4%      -2.8%     117.2=
8 =C2=B1  8%  perf-sched.wait_time.avg.ms.schedule_hrtimeout_range_clock.po=
ll_schedule_timeout.constprop.0.do_sys_poll
      0.00          -100.0%       0.00       +7.9e+100%       0.08 =C2=B122=
3%  perf-sched.wait_time.avg.ms.schedule_timeout.__skb_wait_for_more_packet=
s.unix_dgram_recvmsg.__sys_recvfrom
    478.83            -0.0%     478.63            -0.1%     478.58        p=
erf-sched.wait_time.avg.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      3.34 =C2=B1 21%      -0.7%       3.31 =C2=B1  8%      +5.8%       3.5=
3 =C2=B1 13%  perf-sched.wait_time.avg.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
      5.47 =C2=B1  7%      -5.0%       5.20 =C2=B1  6%      +4.5%       5.7=
2 =C2=B1 15%  perf-sched.wait_time.avg.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.01 =C2=B1 52%      -0.0%       0.01 =C2=B1 56%      -2.9%       0.0=
1 =C2=B1  8%  perf-sched.wait_time.avg.ms.schedule_timeout.wait_for_complet=
ion.stop_one_cpu.affine_move_task
    619.04 =C2=B1  2%      +0.5%     622.27            +0.9%     624.68    =
    perf-sched.wait_time.avg.ms.smpboot_thread_fn.kthread.ret_from_fork
      1.96 =C2=B1 14%      -4.6%       1.87 =C2=B1 12%      +3.8%       2.0=
4 =C2=B1  8%  perf-sched.wait_time.avg.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
    541.27 =C2=B1  4%      -0.8%     536.77 =C2=B1  4%      -1.1%     535.3=
0 =C2=B1  4%  perf-sched.wait_time.avg.ms.worker_thread.kthread.ret_from_fo=
rk
    999.39            -0.0%     999.38            -0.0%     999.38        p=
erf-sched.wait_time.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.[unknown]
      6261 =C2=B1  4%      +1.4%       6348 =C2=B1  2%      +2.1%       639=
2 =C2=B1  3%  perf-sched.wait_time.max.ms.devkmsg_read.vfs_read.ksys_read.d=
o_syscall_64
      1000            +0.0%       1000            +0.8%       1007        p=
erf-sched.wait_time.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosle=
ep.do_syscall_64
      6273 =C2=B1  5%      +1.3%       6355 =C2=B1  2%      +1.9%       639=
5 =C2=B1  3%  perf-sched.wait_time.max.ms.do_syslog.part.0.kmsg_read.vfs_re=
ad
      1729 =C2=B1 94%     -42.2%       1000           -42.2%       1000    =
    perf-sched.wait_time.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sy=
s_exit_group.do_syscall_64
      1018            +0.3%       1022            +0.2%       1021        p=
erf-sched.wait_time.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.01 =C2=B1223%   +1922.2%       0.15 =C2=B1194%      +0.0%       0.0=
1 =C2=B1223%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_exc_page_fault.[unknown]
     52.64 =C2=B1157%     -69.6%      16.01 =C2=B1 26%     -52.3%      25.0=
9 =C2=B1 93%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_apic_timer_interrupt.[unknown]
      0.00          -100.0%       0.00        +2.3e+99%       0.00 =C2=B122=
3%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_=
user_mode.asm_sysvec_call_function.[unknown]
      7.22 =C2=B1 50%    +363.1%      33.41 =C2=B1116%     -33.4%       4.8=
0 =C2=B1 32%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_call_function_single.[unknown]
      0.20 =C2=B1116%    +209.0%       0.62 =C2=B1190%   +1000.0%       2.2=
2 =C2=B1217%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_irq_work.[unknown]
      2.19 =C2=B1220%     -66.2%       0.74 =C2=B1199%    +190.6%       6.3=
6 =C2=B1 98%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.irqentr=
y_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     55.56 =C2=B1 46%     +28.0%      71.14 =C2=B1 43%    +262.0%     201.1=
1 =C2=B1177%  perf-sched.wait_time.max.ms.exit_to_user_mode_prepare.syscall=
_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.[unknown]
    405.17 =C2=B1179%    +105.6%     833.04 =C2=B1208%     -71.5%     115.5=
6 =C2=B1150%  perf-sched.wait_time.max.ms.futex_wait_queue_me.futex_wait.do=
_futex.__x64_sys_futex
      0.00       +3.7e+100%       0.04 =C2=B1223% +5.4e+101%       0.54 =C2=
=B1136%  perf-sched.wait_time.max.ms.io_schedule.__lock_page_killable.filem=
ap_fault.__do_fault
      0.00          -100.0%       0.00       +1.7e+100%       0.02 =C2=B114=
1%  perf-sched.wait_time.max.ms.io_schedule.put_and_wait_on_page_locked.do_=
swap_page.__handle_mm_fault
      6264 =C2=B1  4%      +1.4%       6351 =C2=B1  2%      +2.1%       639=
5 =C2=B1  3%  perf-sched.wait_time.max.ms.pipe_read.new_sync_read.vfs_read.=
ksys_read
      1.28 =C2=B1 87%     -11.1%       1.14 =C2=B1104%     -50.8%       0.6=
3 =C2=B1 44%  perf-sched.wait_time.max.ms.pipe_write.new_sync_write.vfs_wri=
te.ksys_write
      0.00       +1.3e+100%       0.01 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.__al=
loc_pages_nodemask.__get_free_pages.pgd_alloc
      0.00       +1.4e+100%       0.01 =C2=B1223% +1.8e+102%       1.83 =C2=
=B1221%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.__pmd_alloc.copy_page_range
      1125 =C2=B1210%     -61.1%     437.24 =C2=B1216%     -98.8%      13.0=
6        perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__alloc_pages_nodemask.alloc_pages_vma.shmem_alloc_page
      0.03 =C2=B1141%   +5972.1%       1.81 =C2=B1223%   +7659.8%       2.3=
1 =C2=B1222%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.__alloc_pages_nodemask.pte_alloc_one.__pte_alloc
    931.70 =C2=B1219%     -98.6%      12.73 =C2=B1 99%     -99.5%       5.1=
1 =C2=B1112%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.__do_fault.do_fault.__handle_mm_fault
      0.00          +5e+99%       0.01 =C2=B1223%  +4.7e+99%       0.00 =C2=
=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__kmalloc.inotify_handle_inode_event.fsnotify
      0.00          -100.0%       0.00       +1.5e+100%       0.01 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.__km=
alloc.security_prepare_creds.prepare_creds
      0.03 =C2=B1141%    -100.0%       0.00        +14815.7%       4.13 =C2=
=B1142%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__kmalloc.security_task_alloc.copy_process
      0.01 =C2=B1223%  +16979.0%       2.31 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.__kmalloc_node.__vmalloc_node_range.dup_task_struct
      0.00       +2.3e+102%       2.28 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.cgro=
up_can_fork.copy_process.kernel_clone
      1.30 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.chan=
ge_p4d_range.change_protection.mprotect_fixup
      2.13 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.copy=
_page_range.dup_mmap.dup_mm
      6.22 =C2=B1100%     -63.1%       2.29 =C2=B1222%     -70.3%       1.8=
5 =C2=B1217%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.copy_pte_range.copy_page_range.dup_mmap
     11.82 =C2=B1 48%      -8.4%      10.82 =C2=B1 44%   +8986.2%       107=
3 =C2=B1221%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.do_user_addr_fault.exc_page_fault.asm_exc_page_fault
      0.00       +8.6e+100%       0.09 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_read.walk_component.link_path_walk
      0.47 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_clone.__split_vma
      0.01 =C2=B1223%    -100.0%       0.00        +15848.3%       2.31 =C2=
=B1222%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.down_write.anon_vma_clone.anon_vma_fork
      0.00       +1.4e+100%       0.01 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_write.anon_vma_fork.dup_mmap
      0.07 =C2=B1 44%     -79.4%       0.01 =C2=B1223%     -40.7%       0.0=
4 =C2=B1100%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.down_write.dup_mmap.dup_mm
      0.00       +1.1e+105%       1077 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_write.generic_file_write_iter.new_sync_write
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_write.unlink_anon_vmas.free_pgtables
      2.13 =C2=B1223%     -54.8%       0.96 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.down_write.unlink_file_vma.free_pgtables
      0.00          -100.0%       0.00       +3.4e+101%       0.34 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.down=
_write.vma_link.mmap_region
     13.16           -16.7%      10.97 =C2=B1 44%      +0.1%      13.17    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.dput=
.__fput.task_work_run
      0.00         +8e+101%       0.80 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.dput=
.terminate_walk.path_lookupat
      0.00          -100.0%       0.00       +1.2e+101%       0.12 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.exit=
_mmap.mmput.begin_new_exec
      0.00          -100.0%       0.00       +1.3e+102%       1.30 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.exit=
_mmap.mmput.do_exit
      0.00          -100.0%       0.00       +6.7e+101%       0.67 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.forc=
e_qs_rnp.rcu_gp_kthread.kthread
      4189 =C2=B1 66%     +22.1%       5113 =C2=B1 44%     +23.3%       516=
4 =C2=B1 44%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.generic_perform_write.__generic_file_write_iter.generic_file_write_it=
er
      0.01 =C2=B1104%      -8.1%       0.01 =C2=B1141%     +45.9%       0.0=
1 =C2=B1110%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.khugepaged.kthread.ret_from_fork
      0.00       +5.4e+100%       0.05 =C2=B1223% +3.1e+101%       0.31 =C2=
=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.__alloc_file.alloc_empty_file
      4.60 =C2=B1141%    -100.0%       0.00           -99.7%       0.01 =C2=
=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.anon_vma_fork.dup_mmap
      1.81 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_fs_struct.copy_process
      0.00          -100.0%       0.00       +1.4e+100%       0.01 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.copy_process.kernel_clone
      0.00         +3e+100%       0.03 =C2=B1141% +2.8e+100%       0.03 =C2=
=B1141%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.prepare_creds.copy_creds
      0.09 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.vm_area_alloc.mmap_region
      0.13 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc.vm_area_dup.__split_vma
      4.60 =C2=B1141%    -100.0%       0.00           -49.4%       2.33 =C2=
=B1220%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.kmem_cache_alloc.vm_area_dup.dup_mmap
      0.00          -100.0%       0.00       +1.4e+100%       0.01 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_node_trace.__get_vm_area_node.__vmalloc_node_range
      0.00       +6.4e+101%       0.64 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_trace.perf_event_mmap.mmap_region
      0.00          -100.0%       0.00       +1.4e+101%       0.14 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.kmem=
_cache_alloc_trace.perf_event_mmap.mprotect_fixup
      0.00          -100.0%       0.00       +2.3e+100%       0.02 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.__fdget_pos.ksys_write
      0.00          -100.0%       0.00       +1.3e+101%       0.13 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.kernfs_dop_revalidate.lookup_fast
      0.00       +6.6e+101%       0.66 =C2=B1222%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.perf_event_ctx_lock_nested.isra
      1.53 =C2=B1186%     -23.7%       1.17 =C2=B1121%    +122.8%       3.4=
0 =C2=B1195%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.mutex_lock.perf_poll.do_sys_poll
      0.00          -100.0%       0.00       +2.1e+102%       2.13 =C2=B122=
3%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.mute=
x_lock.pipe_write.new_sync_write
      0.00       +3.1e+101%       0.31 =C2=B1223%    -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.remo=
ve_vma.exit_mmap.mmput
      2308 =C2=B1 25%      +0.9%       2328 =C2=B1 24%      +0.1%       230=
9 =C2=B1 25%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.affine_move_task.__set_cpus_allowed_ptr
      0.02 =C2=B1142%     +40.5%       0.03 =C2=B1205%   +3448.8%       0.7=
2 =C2=B1211%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.stop_one_cpu.sched_exec.bprm_execve
      0.01 =C2=B1223%  +15879.1%       2.29 =C2=B1223%    -100.0%       0.0=
0        perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.uprobe_start_dup_mmap.dup_mmap.dup_mm
      0.01 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched.wp_p=
age_copy.__handle_mm_fault.handle_mm_fault
    359.47 =C2=B1223%    -100.0%       0.00            -8.2%     330.14 =C2=
=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_resched=
.ww_mutex_lock.drm_gem_vram_vunmap.drm_gem_vunmap
      0.14 =C2=B1223%    +832.9%       1.30 =C2=B1223%     -98.2%       0.0=
0 =C2=B1223%  perf-sched.wait_time.max.ms.preempt_schedule_common.__cond_re=
sched.zap_pte_range.unmap_page_range.unmap_vmas
      5.00            -0.1%       4.99            -3.4%       4.83 =C2=B1  =
7%  perf-sched.wait_time.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      5932 =C2=B1  5%      -3.7%       5714 =C2=B1 11%      +3.0%       610=
8 =C2=B1  4%  perf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.ep=
_poll.do_epoll_wait.__x64_sys_epoll_wait
      4684            -0.9%       4640            +0.1%       4688        p=
erf-sched.wait_time.max.ms.schedule_hrtimeout_range_clock.poll_schedule_tim=
eout.constprop.0.do_sys_poll
      0.00          -100.0%       0.00       +7.9e+100%       0.08 =C2=B122=
3%  perf-sched.wait_time.max.ms.schedule_timeout.__skb_wait_for_more_packet=
s.unix_dgram_recvmsg.__sys_recvfrom
    505.00            -0.0%     505.00            -0.0%     505.00        p=
erf-sched.wait_time.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      3.34 =C2=B1 21%      -0.7%       3.31 =C2=B1  8%      +5.8%       3.5=
3 =C2=B1 13%  perf-sched.wait_time.max.ms.schedule_timeout.khugepaged.kthre=
ad.ret_from_fork
    276.16 =C2=B1 32%     -11.1%     245.49 =C2=B1 17%      +1.5%     280.1=
6 =C2=B1 48%  perf-sched.wait_time.max.ms.schedule_timeout.rcu_gp_kthread.k=
thread.ret_from_fork
      0.01 =C2=B1 52%      +4.2%       0.01 =C2=B1 54%      -2.8%       0.0=
1 =C2=B1  8%  perf-sched.wait_time.max.ms.schedule_timeout.wait_for_complet=
ion.stop_one_cpu.affine_move_task
      7293 =C2=B1 18%     -12.8%       6359 =C2=B1 28%     -23.3%       559=
7 =C2=B1 18%  perf-sched.wait_time.max.ms.smpboot_thread_fn.kthread.ret_fro=
m_fork
     11.63 =C2=B1  7%      +7.5%      12.50 =C2=B1  3%      +1.7%      11.8=
3 =C2=B1  6%  perf-sched.wait_time.max.ms.wait_for_partner.fifo_open.do_den=
try_open.do_open.isra
      7627 =C2=B1  9%     +13.6%       8662 =C2=B1  8%      +3.8%       791=
5 =C2=B1  5%  perf-sched.wait_time.max.ms.worker_thread.kthread.ret_from_fo=
rk
    261.00            +0.0%     261.00            +0.0%     261.00        s=
oftirqs.BLOCK
      1.00            +0.0%       1.00            +0.0%       1.00        s=
oftirqs.CPU0.HI
     18671 =C2=B1 14%      -2.7%      18175 =C2=B1 15%      -7.8%      1721=
4 =C2=B1 15%  softirqs.CPU0.RCU
      7475 =C2=B1 12%      +2.8%       7685 =C2=B1 12%      +8.9%       813=
7 =C2=B1  6%  softirqs.CPU0.SCHED
    105.50            -0.3%     105.17            -0.3%     105.17        s=
oftirqs.CPU0.TASKLET
      2639 =C2=B1 20%      +3.0%       2719 =C2=B1  5%      +9.1%       288=
1 =C2=B1 48%  softirqs.CPU0.TIMER
     16884 =C2=B1  5%      -2.5%      16458 =C2=B1  5%      -5.2%      1600=
8 =C2=B1  3%  softirqs.CPU1.RCU
      5689 =C2=B1 13%      +1.1%       5750 =C2=B1 16%      +8.4%       616=
7 =C2=B1  9%  softirqs.CPU1.SCHED
    867.83 =C2=B1 75%      -5.1%     824.00 =C2=B1 61%      -1.4%     855.6=
7 =C2=B1 61%  softirqs.CPU1.TIMER
      5488 =C2=B1 78%     -66.9%       1817 =C2=B1139%     -53.0%       257=
9 =C2=B1136%  softirqs.CPU10.NET_RX
      2.50 =C2=B1 55%      +0.0%       2.50 =C2=B1 38%     -13.3%       2.1=
7 =C2=B1 17%  softirqs.CPU10.NET_TX
     18039 =C2=B1 18%     -15.4%      15258 =C2=B1  3%     -18.2%      1475=
1 =C2=B1  6%  softirqs.CPU10.RCU
      5363 =C2=B1 14%      -8.7%       4896 =C2=B1 10%      -8.9%       488=
4 =C2=B1 14%  softirqs.CPU10.SCHED
      0.00          -100.0%       0.00       +1.5e+102%       1.50 =C2=B119=
5%  softirqs.CPU10.TASKLET
      1304 =C2=B1 66%     -65.3%     452.50 =C2=B1 56%     -58.8%     538.0=
0 =C2=B1 73%  softirqs.CPU10.TIMER
     15447 =C2=B1  3%      -2.5%      15068 =C2=B1  3%      -5.6%      1458=
5 =C2=B1  5%  softirqs.CPU100.RCU
      4896 =C2=B1  9%      -0.1%       4890 =C2=B1 11%      +3.7%       507=
7 =C2=B1  2%  softirqs.CPU100.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU100.TASKLET
    272.33 =C2=B1 44%     -13.5%     235.67 =C2=B1 72%     -46.8%     145.0=
0 =C2=B1 32%  softirqs.CPU100.TIMER
     15269 =C2=B1  4%      -2.3%      14922 =C2=B1  2%      -5.9%      1436=
5 =C2=B1  6%  softirqs.CPU101.RCU
      4864 =C2=B1 12%      -0.4%       4843 =C2=B1 10%      +4.4%       507=
6        softirqs.CPU101.SCHED
    116.83 =C2=B1 25%     +21.3%     141.67 =C2=B1 10%     +11.6%     130.3=
3 =C2=B1 26%  softirqs.CPU101.TIMER
     15197 =C2=B1  4%      -0.5%      15125 =C2=B1  4%      -8.8%      1385=
3 =C2=B1 12%  softirqs.CPU102.RCU
      4855 =C2=B1 10%      +0.4%       4875 =C2=B1 10%      +5.5%       512=
2        softirqs.CPU102.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU102.TASKLET
    158.83 =C2=B1 12%     +57.1%     249.50 =C2=B1 91%     +35.9%     215.8=
3 =C2=B1 52%  softirqs.CPU102.TIMER
     15404 =C2=B1  3%      -2.2%      15072 =C2=B1  2%      -5.8%      1451=
3 =C2=B1  5%  softirqs.CPU103.RCU
      4835 =C2=B1 11%      +0.8%       4873 =C2=B1 10%      +4.6%       505=
7        softirqs.CPU103.SCHED
    170.00 =C2=B1  8%     -28.0%     122.33 =C2=B1 15%      +8.1%     183.8=
3 =C2=B1 63%  softirqs.CPU103.TIMER
     15396 =C2=B1  3%      -1.9%      15102 =C2=B1  2%      -5.3%      1457=
7 =C2=B1  6%  softirqs.CPU104.RCU
      4911 =C2=B1 12%      -0.9%       4867 =C2=B1 10%      +2.4%       503=
1        softirqs.CPU104.SCHED
    153.67 =C2=B1 18%      -5.2%     145.67 =C2=B1 24%      -5.6%     145.0=
0 =C2=B1 23%  softirqs.CPU104.TIMER
     15223 =C2=B1  4%      -2.3%      14874 =C2=B1  2%      -4.6%      1452=
2 =C2=B1  6%  softirqs.CPU105.RCU
      4790 =C2=B1 11%      +1.6%       4866 =C2=B1 11%      +6.1%       508=
4        softirqs.CPU105.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU105.TASKLET
    151.17 =C2=B1 15%      +6.7%     161.33 =C2=B1 44%      -1.3%     149.1=
7 =C2=B1 37%  softirqs.CPU105.TIMER
     15217 =C2=B1  3%      -2.1%      14894 =C2=B1  2%      -8.5%      1392=
4 =C2=B1  5%  softirqs.CPU106.RCU
      4811 =C2=B1 11%      +1.3%       4874 =C2=B1 10%      +5.9%       509=
3        softirqs.CPU106.SCHED
    136.17 =C2=B1 18%     +19.7%     163.00 =C2=B1 12%      +3.8%     141.3=
3 =C2=B1 21%  softirqs.CPU106.TIMER
     15091 =C2=B1  3%      -2.5%      14707 =C2=B1  2%      -5.5%      1426=
7 =C2=B1  5%  softirqs.CPU107.RCU
      4849 =C2=B1 11%      +0.8%       4890 =C2=B1 10%      +6.5%       516=
2 =C2=B1  3%  softirqs.CPU107.SCHED
    164.50 =C2=B1 13%      -2.3%     160.67 =C2=B1 33%     +71.9%     282.8=
3 =C2=B1 64%  softirqs.CPU107.TIMER
     14981 =C2=B1  6%      -0.6%      14889 =C2=B1  2%      -3.4%      1447=
3 =C2=B1  6%  softirqs.CPU108.RCU
      4824 =C2=B1 11%      +0.6%       4854 =C2=B1 10%      +5.1%       507=
1        softirqs.CPU108.SCHED
    199.67 =C2=B1 73%     -24.7%     150.33 =C2=B1 19%     -35.1%     129.5=
0 =C2=B1 29%  softirqs.CPU108.TIMER
     15271 =C2=B1  6%      +0.4%      15336 =C2=B1  4%      -4.6%      1456=
5 =C2=B1  5%  softirqs.CPU109.RCU
      4601 =C2=B1 14%      +5.5%       4855 =C2=B1 10%     +11.2%       511=
4 =C2=B1  2%  softirqs.CPU109.SCHED
      0.17 =C2=B1223%    -100.0%       0.00            +0.0%       0.17 =C2=
=B1223%  softirqs.CPU109.TASKLET
    168.67 =C2=B1 19%     -25.9%     125.00 =C2=B1 14%     +24.8%     210.5=
0 =C2=B1 55%  softirqs.CPU109.TIMER
      2116 =C2=B1115%     +99.2%       4215 =C2=B1103%     -19.0%       171=
4 =C2=B1 63%  softirqs.CPU11.NET_RX
      2.00 =C2=B1 28%     -33.3%       1.33 =C2=B1 35%      +8.3%       2.1=
7 =C2=B1 41%  softirqs.CPU11.NET_TX
     15687 =C2=B1  4%      -0.5%      15615 =C2=B1  3%      -3.9%      1506=
9 =C2=B1  6%  softirqs.CPU11.RCU
      4939 =C2=B1 12%      +3.6%       5118           +10.2%       5444 =C2=
=B1 12%  softirqs.CPU11.SCHED
    461.50 =C2=B1 58%     +38.0%     636.83 =C2=B1 54%     +17.8%     543.5=
0 =C2=B1 26%  softirqs.CPU11.TIMER
     15129 =C2=B1  6%      -1.1%      14965 =C2=B1  2%      +0.3%      1517=
7 =C2=B1  5%  softirqs.CPU110.RCU
      4851 =C2=B1 11%      +0.8%       4889 =C2=B1 10%      +2.1%       495=
4 =C2=B1 11%  softirqs.CPU110.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU110.TASKLET
    153.17 =C2=B1 25%     -33.2%     102.33 =C2=B1 22%     +69.4%     259.5=
0 =C2=B1 94%  softirqs.CPU110.TIMER
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU111.NET_TX
     15016 =C2=B1  6%      +0.9%      15152 =C2=B1  4%      +3.2%      1549=
6 =C2=B1 19%  softirqs.CPU111.RCU
      4849 =C2=B1 11%      +1.1%       4902 =C2=B1 10%      +2.8%       498=
3 =C2=B1  5%  softirqs.CPU111.SCHED
     95.17 =C2=B1 17%     +84.6%     175.67 =C2=B1 26%    +294.6%     375.5=
0 =C2=B1136%  softirqs.CPU111.TIMER
     15435 =C2=B1  5%      -2.4%      15068 =C2=B1  4%      -4.8%      1469=
7 =C2=B1  7%  softirqs.CPU112.RCU
      4845 =C2=B1 11%      +2.2%       4950 =C2=B1  8%      +5.6%       511=
5        softirqs.CPU112.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU112.TASKLET
    253.67 =C2=B1 60%     -10.2%     227.67 =C2=B1111%     -55.7%     112.3=
3 =C2=B1 27%  softirqs.CPU112.TIMER
     15195 =C2=B1  4%      -1.9%      14910 =C2=B1  3%      -3.8%      1461=
2 =C2=B1  5%  softirqs.CPU113.RCU
      4842 =C2=B1 11%      +3.2%       4995 =C2=B1 10%      +5.4%       510=
3        softirqs.CPU113.SCHED
    136.00 =C2=B1 27%     +26.3%     171.83 =C2=B1 19%     +49.6%     203.5=
0 =C2=B1 58%  softirqs.CPU113.TIMER
     15314 =C2=B1 10%      -3.8%      14731 =C2=B1  3%      -5.6%      1445=
0 =C2=B1  5%  softirqs.CPU114.RCU
      4941 =C2=B1 13%      -0.3%       4924 =C2=B1  9%      +4.1%       514=
2 =C2=B1  4%  softirqs.CPU114.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU114.TASKLET
    286.67 =C2=B1 67%     -38.8%     175.33 =C2=B1 32%      -8.5%     262.1=
7 =C2=B1 88%  softirqs.CPU114.TIMER
     15301 =C2=B1  4%      -3.4%      14778 =C2=B1  3%      -5.0%      1453=
2 =C2=B1  6%  softirqs.CPU115.RCU
      4832 =C2=B1 11%      +0.4%       4850 =C2=B1 10%      +4.6%       505=
6        softirqs.CPU115.SCHED
      0.00          -100.0%       0.00         +5e+101%       0.50 =C2=B122=
3%  softirqs.CPU115.TASKLET
    207.50 =C2=B1 50%      -1.1%     205.17 =C2=B1 54%     -29.3%     146.6=
7 =C2=B1 24%  softirqs.CPU115.TIMER
     15534 =C2=B1  7%      -5.2%      14719 =C2=B1  3%      -7.0%      1444=
7 =C2=B1  6%  softirqs.CPU116.RCU
      4846 =C2=B1 12%      -0.2%       4838 =C2=B1 10%      +6.7%       516=
9 =C2=B1  4%  softirqs.CPU116.SCHED
    172.17 =C2=B1 17%      -7.7%     158.83 =C2=B1 14%      -1.8%     169.0=
0 =C2=B1 51%  softirqs.CPU116.TIMER
     15157 =C2=B1  4%      -2.5%      14773 =C2=B1  4%      -4.7%      1444=
8 =C2=B1  6%  softirqs.CPU117.RCU
      4829 =C2=B1 11%      +0.0%       4829 =C2=B1  9%      +5.3%       508=
5        softirqs.CPU117.SCHED
    177.33 =C2=B1 39%      -6.9%     165.17 =C2=B1 67%     -19.0%     143.6=
7 =C2=B1 38%  softirqs.CPU117.TIMER
     15156 =C2=B1  3%      -3.1%      14684 =C2=B1  3%      -4.4%      1449=
6 =C2=B1  7%  softirqs.CPU118.RCU
      4937 =C2=B1 13%      -1.4%       4869 =C2=B1 10%      -1.5%       486=
1 =C2=B1 10%  softirqs.CPU118.SCHED
      6.67 =C2=B1141%     -97.5%       0.17 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU118.TASKLET
    380.00 =C2=B1136%     -61.9%     144.67 =C2=B1 19%     -60.4%     150.5=
0 =C2=B1 56%  softirqs.CPU118.TIMER
     15270 =C2=B1  4%      -4.2%      14635 =C2=B1  4%      -5.3%      1446=
5 =C2=B1  7%  softirqs.CPU119.RCU
      5211 =C2=B1  5%     -11.9%       4592 =C2=B1 15%      -1.5%       513=
1        softirqs.CPU119.SCHED
      0.00       +6.7e+101%       0.67 =C2=B1165%    -100.0%       0.00    =
    softirqs.CPU119.TASKLET
    837.33 =C2=B1104%     -78.7%     178.00 =C2=B1 17%     -79.9%     168.3=
3 =C2=B1 25%  softirqs.CPU119.TIMER
      1639 =C2=B1118%    +263.5%       5958 =C2=B1189%     +74.3%       285=
7 =C2=B1112%  softirqs.CPU12.NET_RX
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 37%     -18.2%       1.5=
0 =C2=B1 50%  softirqs.CPU12.NET_TX
     15652 =C2=B1  5%      +1.4%      15864 =C2=B1  8%      -4.0%      1502=
8 =C2=B1  6%  softirqs.CPU12.RCU
      4819 =C2=B1 11%      +2.5%       4940 =C2=B1 11%      +5.9%       510=
5        softirqs.CPU12.SCHED
    416.83 =C2=B1 42%     +15.9%     483.00 =C2=B1 42%      +3.9%     433.1=
7 =C2=B1 51%  softirqs.CPU12.TIMER
     22824 =C2=B1 10%      -3.5%      22036 =C2=B1  7%      -7.7%      2105=
9 =C2=B1 12%  softirqs.CPU120.RCU
      4926 =C2=B1 11%      +0.7%       4962 =C2=B1 11%      +4.0%       512=
6        softirqs.CPU120.SCHED
    562.83 =C2=B1 12%     +20.5%     678.17 =C2=B1 30%     +18.1%     664.6=
7 =C2=B1 34%  softirqs.CPU120.TIMER
     17846 =C2=B1  4%      +1.1%      18034 =C2=B1  6%      -2.4%      1742=
0 =C2=B1  8%  softirqs.CPU121.RCU
      4887 =C2=B1 11%      +0.7%       4919 =C2=B1 12%      +4.9%       512=
8        softirqs.CPU121.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU121.TASKLET
    440.00 =C2=B1  6%      -8.6%     402.33 =C2=B1 13%     -11.8%     388.1=
7 =C2=B1 14%  softirqs.CPU121.TIMER
     15925 =C2=B1  4%      -1.2%      15734 =C2=B1  4%      -4.0%      1528=
7 =C2=B1  8%  softirqs.CPU122.RCU
      4886 =C2=B1 11%      +0.6%       4914 =C2=B1 10%      +3.0%       503=
4        softirqs.CPU122.SCHED
    213.00 =C2=B1  7%      -3.4%     205.83 =C2=B1 13%      -0.8%     211.3=
3 =C2=B1 20%  softirqs.CPU122.TIMER
     15523 =C2=B1  4%      -2.2%      15175 =C2=B1  3%      -5.3%      1470=
2 =C2=B1  9%  softirqs.CPU123.RCU
      4865 =C2=B1 11%      +0.3%       4881 =C2=B1 10%      +4.3%       507=
4        softirqs.CPU123.SCHED
    112.83 =C2=B1 18%     +40.3%     158.33 =C2=B1 18%     +21.6%     137.1=
7 =C2=B1 21%  softirqs.CPU123.TIMER
     15605 =C2=B1  4%      -3.2%      15111 =C2=B1  2%      -5.0%      1482=
2 =C2=B1  9%  softirqs.CPU124.RCU
      4759 =C2=B1 16%      +3.8%       4938 =C2=B1 11%      +7.3%       510=
6        softirqs.CPU124.SCHED
      0.00          -100.0%       0.00       +3.3e+101%       0.33 =C2=B122=
3%  softirqs.CPU124.TASKLET
    156.83 =C2=B1 16%     -13.9%     135.00 =C2=B1 29%      +1.7%     159.5=
0 =C2=B1 42%  softirqs.CPU124.TIMER
     15337 =C2=B1  4%      -2.6%      14944 =C2=B1  2%      -5.1%      1455=
3 =C2=B1  9%  softirqs.CPU125.RCU
      4876 =C2=B1 11%      +0.6%       4907 =C2=B1 11%      +4.9%       511=
3        softirqs.CPU125.SCHED
    178.50 =C2=B1 24%     -11.3%     158.33 =C2=B1 12%     +15.7%     206.5=
0 =C2=B1 68%  softirqs.CPU125.TIMER
     15390 =C2=B1  4%      -2.5%      15001 =C2=B1  3%      -6.6%      1437=
3 =C2=B1  8%  softirqs.CPU126.RCU
      4949 =C2=B1 11%      -1.3%       4884 =C2=B1 10%      +2.2%       505=
7        softirqs.CPU126.SCHED
      0.00       +3.2e+102%       3.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU126.TASKLET
    224.50 =C2=B1 57%     -51.4%     109.00 =C2=B1 30%     -42.3%     129.5=
0 =C2=B1 18%  softirqs.CPU126.TIMER
     15512 =C2=B1  4%      -7.4%      14361 =C2=B1 11%      +0.7%      1562=
3 =C2=B1 18%  softirqs.CPU127.RCU
      4650 =C2=B1 14%      +5.9%       4925 =C2=B1 10%      +9.9%       511=
1 =C2=B1  2%  softirqs.CPU127.SCHED
    121.00 =C2=B1 12%     +23.3%     149.17 =C2=B1 22%    +221.6%     389.1=
7 =C2=B1125%  softirqs.CPU127.TIMER
     14902 =C2=B1  3%      -2.5%      14534 =C2=B1  2%      -6.4%      1395=
5 =C2=B1  8%  softirqs.CPU128.RCU
      4857 =C2=B1 11%      -3.8%       4670 =C2=B1 14%      +4.8%       509=
0        softirqs.CPU128.SCHED
    161.83 =C2=B1 19%      -3.0%     157.00 =C2=B1 20%      +6.0%     171.5=
0 =C2=B1 18%  softirqs.CPU128.TIMER
     14833 =C2=B1  3%      -1.3%      14637 =C2=B1  3%      -7.1%      1377=
9 =C2=B1  7%  softirqs.CPU129.RCU
      4882 =C2=B1 11%      -0.3%       4865 =C2=B1 10%      +5.0%       512=
6        softirqs.CPU129.SCHED
    130.67 =C2=B1  4%     +47.6%     192.83 =C2=B1 28%     +23.7%     161.6=
7 =C2=B1  7%  softirqs.CPU129.TIMER
    842.17 =C2=B1 87%    +324.7%       3576 =C2=B1130%     -25.4%     628.5=
0 =C2=B1 63%  softirqs.CPU13.NET_RX
      1.50 =C2=B1 63%     +22.2%       1.83 =C2=B1 20%      +0.0%       1.5=
0 =C2=B1 33%  softirqs.CPU13.NET_TX
     15350 =C2=B1  4%      -0.4%      15292 =C2=B1  6%      -5.9%      1444=
3 =C2=B1  5%  softirqs.CPU13.RCU
      4947 =C2=B1  7%      -1.1%       4891 =C2=B1 12%      +2.4%       506=
4        softirqs.CPU13.SCHED
    323.67 =C2=B1 26%    +129.5%     742.67 =C2=B1 59%     -10.2%     290.6=
7 =C2=B1 34%  softirqs.CPU13.TIMER
     14816 =C2=B1  3%      -2.1%      14509 =C2=B1  3%      -6.2%      1390=
0 =C2=B1  8%  softirqs.CPU130.RCU
      4885 =C2=B1 11%      +0.5%       4910 =C2=B1 10%      +4.8%       511=
8 =C2=B1  2%  softirqs.CPU130.SCHED
      0.00       +3.2e+102%       3.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU130.TASKLET
    165.50 =C2=B1 12%      +0.7%     166.67 =C2=B1 19%      +6.7%     176.6=
7 =C2=B1 52%  softirqs.CPU130.TIMER
     14742 =C2=B1  3%      -2.3%      14410 =C2=B1  3%      -6.3%      1381=
3 =C2=B1  8%  softirqs.CPU131.RCU
      4876 =C2=B1 11%      +3.1%       5026 =C2=B1 13%      +2.7%       500=
7        softirqs.CPU131.SCHED
    149.17 =C2=B1 11%    +133.2%     347.83 =C2=B1107%      -7.8%     137.5=
0 =C2=B1 12%  softirqs.CPU131.TIMER
     14906 =C2=B1  3%      -2.8%      14493 =C2=B1  3%      -6.2%      1398=
2 =C2=B1  9%  softirqs.CPU132.RCU
      4885 =C2=B1 11%      +0.4%       4907 =C2=B1 10%      +3.7%       506=
8        softirqs.CPU132.SCHED
    163.17 =C2=B1 18%      -8.5%     149.33 =C2=B1 11%     -15.3%     138.1=
7 =C2=B1 22%  softirqs.CPU132.TIMER
     14876 =C2=B1  3%      -2.5%      14507 =C2=B1  2%      -6.6%      1388=
8 =C2=B1  8%  softirqs.CPU133.RCU
      4880 =C2=B1 11%      +0.1%       4887 =C2=B1 11%      +3.4%       504=
6        softirqs.CPU133.SCHED
    236.50 =C2=B1 45%     -16.3%     197.83 =C2=B1 43%     -46.7%     126.1=
7 =C2=B1 28%  softirqs.CPU133.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU134.NET_TX
     15020 =C2=B1  3%      -3.3%      14524 =C2=B1  3%      -7.4%      1391=
2 =C2=B1  8%  softirqs.CPU134.RCU
      4896 =C2=B1  9%      -0.1%       4889 =C2=B1 10%      +4.4%       510=
9        softirqs.CPU134.SCHED
    189.17 =C2=B1 64%      -8.7%     172.67 =C2=B1 11%      -3.9%     181.8=
3 =C2=B1 54%  softirqs.CPU134.TIMER
     14843 =C2=B1  3%      -2.6%      14458 =C2=B1  3%      -7.0%      1380=
6 =C2=B1  8%  softirqs.CPU135.RCU
      4916 =C2=B1  8%      -0.5%       4889 =C2=B1 10%      +2.3%       503=
0        softirqs.CPU135.SCHED
    223.67 =C2=B1 58%     -11.5%     198.00 =C2=B1 74%     -31.3%     153.6=
7 =C2=B1 29%  softirqs.CPU135.TIMER
     15051 =C2=B1  3%      -3.6%      14504 =C2=B1  2%      -7.6%      1390=
6 =C2=B1  8%  softirqs.CPU136.RCU
      4897 =C2=B1 11%      -0.2%       4889 =C2=B1 10%      +2.7%       502=
7        softirqs.CPU136.SCHED
    157.50 =C2=B1 30%     +59.5%     251.17 =C2=B1 69%     -12.3%     138.1=
7 =C2=B1 20%  softirqs.CPU136.TIMER
     14218 =C2=B1 10%      +2.6%      14594 =C2=B1  3%      -2.9%      1380=
8 =C2=B1  8%  softirqs.CPU137.RCU
      4863 =C2=B1 11%      +0.8%       4901 =C2=B1 11%      +4.1%       506=
1        softirqs.CPU137.SCHED
    134.33 =C2=B1 22%      +7.9%     145.00 =C2=B1 18%      +7.1%     143.8=
3 =C2=B1 18%  softirqs.CPU137.TIMER
     14677 =C2=B1  3%      -2.3%      14335 =C2=B1  2%      -6.4%      1373=
8 =C2=B1  8%  softirqs.CPU138.RCU
      4863 =C2=B1 11%      +0.8%       4900 =C2=B1 10%      +3.5%       503=
3        softirqs.CPU138.SCHED
    192.00 =C2=B1 56%     -23.7%     146.50 =C2=B1 15%     -29.8%     134.8=
3 =C2=B1 21%  softirqs.CPU138.TIMER
     14952 =C2=B1  2%      -2.1%      14637 =C2=B1  2%      -6.7%      1394=
3 =C2=B1  8%  softirqs.CPU139.RCU
      4911 =C2=B1 10%      -2.1%       4810 =C2=B1 11%      +2.7%       504=
2        softirqs.CPU139.SCHED
      0.33 =C2=B1223%      +0.0%       0.33 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU139.TASKLET
    209.67 =C2=B1 44%     -30.1%     146.50 =C2=B1 28%     -34.9%     136.5=
0 =C2=B1 33%  softirqs.CPU139.TIMER
     15748 =C2=B1  2%      -3.4%      15218 =C2=B1  3%      -4.4%      1506=
1 =C2=B1  6%  softirqs.CPU14.RCU
      4851 =C2=B1 11%      +0.7%       4884 =C2=B1 10%      +3.7%       503=
1 =C2=B1  2%  softirqs.CPU14.SCHED
    213.17 =C2=B1 28%     -37.1%     134.00 =C2=B1 13%     +35.2%     288.1=
7 =C2=B1113%  softirqs.CPU14.TIMER
     14985 =C2=B1  2%      -2.3%      14638 =C2=B1  2%      -7.8%      1381=
2 =C2=B1  8%  softirqs.CPU140.RCU
      4928 =C2=B1 11%      -0.7%       4894 =C2=B1 10%      +2.8%       506=
9        softirqs.CPU140.SCHED
    156.00 =C2=B1 26%     -21.5%     122.50 =C2=B1 29%     -24.4%     118.0=
0 =C2=B1 28%  softirqs.CPU140.TIMER
     14835 =C2=B1  3%      -1.8%      14564 =C2=B1  3%      -7.2%      1376=
9 =C2=B1  8%  softirqs.CPU141.RCU
      4854 =C2=B1 11%      +0.9%       4900 =C2=B1 11%      +4.5%       507=
4        softirqs.CPU141.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU141.TASKLET
    175.00 =C2=B1 10%      -9.0%     159.33 =C2=B1 23%      -6.0%     164.5=
0 =C2=B1 17%  softirqs.CPU141.TIMER
     14802 =C2=B1  9%      +1.0%      14948 =C2=B1  9%      -7.7%      1366=
4 =C2=B1  8%  softirqs.CPU142.RCU
      5060 =C2=B1 14%      -3.8%       4869 =C2=B1 11%      +0.4%       508=
2        softirqs.CPU142.SCHED
    381.50 =C2=B1131%     -57.6%     161.67 =C2=B1 47%     -65.8%     130.5=
0 =C2=B1 35%  softirqs.CPU142.TIMER
     14789 =C2=B1  9%      -2.8%      14368 =C2=B1  2%      -6.7%      1379=
1 =C2=B1  8%  softirqs.CPU143.RCU
      4908 =C2=B1 11%      +0.5%       4934 =C2=B1 10%      +3.2%       506=
3        softirqs.CPU143.SCHED
      3.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU143.TASKLET
    215.17 =C2=B1 43%     -20.4%     171.33 =C2=B1 26%     -36.4%     136.8=
3 =C2=B1 17%  softirqs.CPU143.TIMER
     21903 =C2=B1  6%      +1.9%      22314            +0.2%      21950 =C2=
=B1  4%  softirqs.CPU144.RCU
      4830 =C2=B1 12%      +1.9%       4920 =C2=B1  9%      +6.4%       514=
0 =C2=B1  2%  softirqs.CPU144.SCHED
    646.33 =C2=B1  9%      +7.2%     692.83 =C2=B1 26%      -0.2%     645.3=
3 =C2=B1 25%  softirqs.CPU144.TIMER
     18094 =C2=B1  4%      -2.4%      17655 =C2=B1  4%      -4.6%      1725=
5 =C2=B1  6%  softirqs.CPU145.RCU
      4867 =C2=B1 10%      +1.1%       4920 =C2=B1  9%      +4.1%       506=
8        softirqs.CPU145.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU145.TASKLET
    394.17 =C2=B1 13%      -6.1%     370.00 =C2=B1  8%      +1.7%     401.0=
0 =C2=B1 21%  softirqs.CPU145.TIMER
     15881 =C2=B1  3%      -2.8%      15442 =C2=B1  4%      -5.7%      1497=
9 =C2=B1  6%  softirqs.CPU146.RCU
      4875 =C2=B1 10%      +0.9%       4918 =C2=B1 10%      +4.8%       510=
7        softirqs.CPU146.SCHED
    256.83 =C2=B1 19%      -9.6%     232.17 =C2=B1 13%     -16.4%     214.6=
7 =C2=B1  9%  softirqs.CPU146.TIMER
     15165 =C2=B1  4%      -2.5%      14778 =C2=B1  5%      -4.7%      1445=
7 =C2=B1  6%  softirqs.CPU147.RCU
      4817 =C2=B1 10%      +2.0%       4912 =C2=B1 10%      +7.0%       515=
2 =C2=B1  2%  softirqs.CPU147.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU147.TASKLET
    213.50 =C2=B1 37%     -16.2%     178.83 =C2=B1 10%     +30.8%     279.1=
7 =C2=B1100%  softirqs.CPU147.TIMER
     15338 =C2=B1  4%      -2.3%      14983 =C2=B1  5%      -5.2%      1454=
7 =C2=B1  7%  softirqs.CPU148.RCU
      4862 =C2=B1 11%      +1.1%       4916 =C2=B1 10%      +4.9%       510=
1        softirqs.CPU148.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU148.TASKLET
    173.83 =C2=B1 38%      -1.1%     172.00 =C2=B1 16%      -0.2%     173.5=
0 =C2=B1 16%  softirqs.CPU148.TIMER
     15336 =C2=B1  4%      -1.2%      15148 =C2=B1  6%      -5.4%      1450=
4 =C2=B1  6%  softirqs.CPU149.RCU
      4859 =C2=B1 11%      +0.3%       4873 =C2=B1 10%      +5.1%       510=
7        softirqs.CPU149.SCHED
    148.83 =C2=B1 35%     +21.9%     181.50 =C2=B1 33%      +2.1%     152.0=
0 =C2=B1 25%  softirqs.CPU149.TIMER
     15423 =C2=B1  4%      +1.2%      15609 =C2=B1  5%      -5.2%      1462=
6 =C2=B1  5%  softirqs.CPU15.RCU
      4834 =C2=B1 11%      -4.1%       4637 =C2=B1 16%      +6.0%       512=
3 =C2=B1  2%  softirqs.CPU15.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU15.TASKLET
    182.00 =C2=B1 69%     +12.8%     205.33 =C2=B1 50%     +19.0%     216.5=
0 =C2=B1 75%  softirqs.CPU15.TIMER
     15310 =C2=B1  5%      -2.8%      14882 =C2=B1  5%      -2.4%      1493=
8 =C2=B1  6%  softirqs.CPU150.RCU
      4837 =C2=B1 10%      +1.0%       4887 =C2=B1 10%      +7.7%       520=
8 =C2=B1  5%  softirqs.CPU150.SCHED
      0.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU150.TASKLET
    170.67 =C2=B1 23%     -16.3%     142.83 =C2=B1 18%     +60.4%     273.8=
3 =C2=B1 94%  softirqs.CPU150.TIMER
     15511 =C2=B1  6%      -4.6%      14801 =C2=B1  4%      -6.9%      1444=
4 =C2=B1  7%  softirqs.CPU151.RCU
      4857 =C2=B1 10%      +1.4%       4923 =C2=B1 10%      +6.4%       516=
8 =C2=B1  4%  softirqs.CPU151.SCHED
    176.00 =C2=B1 22%     -12.4%     154.17 =C2=B1 26%     +44.8%     254.8=
3 =C2=B1101%  softirqs.CPU151.TIMER
     15119 =C2=B1  4%      -3.2%      14640 =C2=B1  5%      -2.3%      1477=
7 =C2=B1  9%  softirqs.CPU152.RCU
      4851 =C2=B1 10%      +1.0%       4898 =C2=B1 10%      +3.6%       502=
5        softirqs.CPU152.SCHED
    156.67 =C2=B1 15%      +0.1%     156.83 =C2=B1 32%     +28.5%     201.3=
3 =C2=B1 73%  softirqs.CPU152.TIMER
     15679 =C2=B1  8%      -5.5%      14810 =C2=B1  5%      -6.1%      1471=
9 =C2=B1  7%  softirqs.CPU153.RCU
      5070 =C2=B1 16%      -3.5%       4894 =C2=B1 10%      +0.4%       508=
8        softirqs.CPU153.SCHED
    376.67 =C2=B1130%     -59.3%     153.33 =C2=B1 17%     -58.5%     156.3=
3 =C2=B1 23%  softirqs.CPU153.TIMER
     15657 =C2=B1  7%      -4.8%      14909 =C2=B1  5%      -7.5%      1449=
0 =C2=B1  6%  softirqs.CPU154.RCU
      4908 =C2=B1 11%      -0.7%       4875 =C2=B1 10%      +4.1%       510=
9        softirqs.CPU154.SCHED
    187.33 =C2=B1 30%     -35.1%     121.67 =C2=B1 40%     -12.8%     163.3=
3 =C2=B1 24%  softirqs.CPU154.TIMER
     15611 =C2=B1  6%      -3.9%      15005 =C2=B1  4%      -6.3%      1463=
2 =C2=B1  6%  softirqs.CPU155.RCU
      4881 =C2=B1 11%      +0.6%       4911 =C2=B1 10%      +4.5%       510=
1        softirqs.CPU155.SCHED
      0.00          -100.0%       0.00         +3e+102%       3.00 =C2=B122=
3%  softirqs.CPU155.TASKLET
    207.00 =C2=B1 71%     -30.0%     145.00 =C2=B1 24%     -31.1%     142.6=
7 =C2=B1 19%  softirqs.CPU155.TIMER
     15127 =C2=B1  5%      -1.8%      14860 =C2=B1  4%      -4.5%      1445=
2 =C2=B1  7%  softirqs.CPU156.RCU
      4838 =C2=B1 11%      +1.5%       4909 =C2=B1 10%      +5.1%       508=
4        softirqs.CPU156.SCHED
    141.67 =C2=B1 11%      +0.0%     141.67 =C2=B1 32%      -3.3%     137.0=
0 =C2=B1 24%  softirqs.CPU156.TIMER
     15109 =C2=B1  5%      -2.3%      14769 =C2=B1  5%      -4.6%      1441=
4 =C2=B1  6%  softirqs.CPU157.RCU
      4848 =C2=B1 10%      +2.2%       4952 =C2=B1 10%      +4.8%       508=
2        softirqs.CPU157.SCHED
    190.83 =C2=B1 63%     +19.0%     227.00 =C2=B1 69%     -18.0%     156.5=
0 =C2=B1 33%  softirqs.CPU157.TIMER
     15079 =C2=B1  6%      -1.1%      14917 =C2=B1  8%      -8.7%      1376=
5 =C2=B1 14%  softirqs.CPU158.RCU
      4862 =C2=B1 11%      +0.2%       4874 =C2=B1 10%      +4.5%       508=
3        softirqs.CPU158.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU158.TASKLET
    152.33 =C2=B1 12%     -15.2%     129.17 =C2=B1 15%     -24.4%     115.1=
7 =C2=B1 34%  softirqs.CPU158.TIMER
     15149 =C2=B1  6%      -0.8%      15029 =C2=B1  6%      -4.1%      1453=
1 =C2=B1  6%  softirqs.CPU159.RCU
      4849 =C2=B1 10%      +1.9%       4941 =C2=B1 11%      +6.9%       518=
5 =C2=B1  3%  softirqs.CPU159.SCHED
    134.83 =C2=B1 14%     +28.1%     172.67 =C2=B1 61%      -0.6%     134.0=
0 =C2=B1 13%  softirqs.CPU159.TIMER
     15793 =C2=B1  6%      -6.9%      14698 =C2=B1 11%      -5.9%      1486=
3 =C2=B1  5%  softirqs.CPU16.RCU
      4884 =C2=B1 12%      -1.2%       4824 =C2=B1 10%      +3.8%       506=
8        softirqs.CPU16.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU16.TASKLET
    220.17 =C2=B1 55%     -42.8%     126.00 =C2=B1 21%      -3.2%     213.1=
7 =C2=B1 66%  softirqs.CPU16.TIMER
     15270 =C2=B1  5%      -2.4%      14909 =C2=B1  5%      -3.6%      1471=
6 =C2=B1  6%  softirqs.CPU160.RCU
      4866 =C2=B1  9%      -3.4%       4699 =C2=B1 12%      +4.3%       507=
3        softirqs.CPU160.SCHED
    144.17 =C2=B1 10%      +7.9%     155.50 =C2=B1 17%     +20.7%     174.0=
0 =C2=B1 17%  softirqs.CPU160.TIMER
     15245 =C2=B1  5%      -2.0%      14947 =C2=B1  5%      -3.6%      1469=
6 =C2=B1  5%  softirqs.CPU161.RCU
      4872 =C2=B1  9%      +0.8%       4914 =C2=B1 10%      +5.1%       512=
3        softirqs.CPU161.SCHED
    129.50 =C2=B1 19%     +38.1%     178.83 =C2=B1 33%     +12.6%     145.8=
3 =C2=B1 30%  softirqs.CPU161.TIMER
     15119 =C2=B1  5%      -2.0%      14824 =C2=B1  6%      +5.9%      1601=
7 =C2=B1 11%  softirqs.CPU162.RCU
      4875 =C2=B1 10%      -0.4%       4856 =C2=B1 10%      +5.7%       515=
1 =C2=B1  2%  softirqs.CPU162.SCHED
    160.17 =C2=B1 26%      -4.2%     153.50 =C2=B1 15%    +131.5%     370.8=
3 =C2=B1134%  softirqs.CPU162.TIMER
     15017 =C2=B1  5%      -1.9%      14730 =C2=B1  5%      -3.6%      1448=
0 =C2=B1  6%  softirqs.CPU163.RCU
      4848 =C2=B1  9%      +0.2%       4860 =C2=B1 10%      +4.5%       506=
8        softirqs.CPU163.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU163.TASKLET
    152.00 =C2=B1 15%     +21.1%     184.00 =C2=B1 33%      +2.2%     155.3=
3 =C2=B1 14%  softirqs.CPU163.TIMER
     15152 =C2=B1  5%      -3.2%      14667 =C2=B1  5%      -4.4%      1448=
8 =C2=B1  6%  softirqs.CPU164.RCU
      4964 =C2=B1 12%      -1.4%       4896 =C2=B1 10%      +3.1%       511=
9        softirqs.CPU164.SCHED
    261.83 =C2=B1101%     -38.3%     161.67 =C2=B1 26%     -42.5%     150.6=
7 =C2=B1 24%  softirqs.CPU164.TIMER
     15145 =C2=B1  5%      -2.0%      14841 =C2=B1  5%      -3.5%      1460=
8 =C2=B1  6%  softirqs.CPU165.RCU
      4846 =C2=B1 10%      +0.5%       4870 =C2=B1 10%      +5.2%       510=
1        softirqs.CPU165.SCHED
    139.83 =C2=B1 17%     +81.9%     254.33 =C2=B1 58%     +19.2%     166.6=
7 =C2=B1 24%  softirqs.CPU165.TIMER
     15212 =C2=B1  5%      -1.3%      15018 =C2=B1  4%      -3.6%      1466=
9 =C2=B1  7%  softirqs.CPU166.RCU
      4868 =C2=B1 10%      +0.5%       4892 =C2=B1 10%      +4.6%       509=
2        softirqs.CPU166.SCHED
    148.17 =C2=B1 22%     +27.4%     188.83 =C2=B1 51%      -6.7%     138.1=
7 =C2=B1 14%  softirqs.CPU166.TIMER
     15284 =C2=B1 10%      +6.4%      16262 =C2=B1 12%      -0.2%      1525=
3 =C2=B1 14%  softirqs.CPU167.RCU
      4879 =C2=B1 11%      +1.5%       4951 =C2=B1 11%      +3.6%       505=
6        softirqs.CPU167.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU167.TASKLET
    160.17 =C2=B1 16%    +127.1%     363.67 =C2=B1136%      +0.2%     160.5=
0 =C2=B1 39%  softirqs.CPU167.TIMER
     21139 =C2=B1  5%      -1.6%      20806 =C2=B1  5%      +0.5%      2123=
6 =C2=B1  4%  softirqs.CPU168.RCU
      4861 =C2=B1 10%      +1.4%       4930 =C2=B1 10%      +9.9%       534=
3 =C2=B1 10%  softirqs.CPU168.SCHED
    604.83 =C2=B1  7%     -10.7%     540.33 =C2=B1 11%     +72.3%       104=
2 =C2=B1110%  softirqs.CPU168.TIMER
     16441 =C2=B1  2%      -3.0%      15945 =C2=B1  2%      -2.8%      1597=
4 =C2=B1  5%  softirqs.CPU169.RCU
      4926 =C2=B1 11%      -0.7%       4894 =C2=B1 10%      +4.7%       515=
9        softirqs.CPU169.SCHED
    376.17 =C2=B1 12%      -2.0%     368.50 =C2=B1 14%      +7.0%     402.3=
3 =C2=B1 15%  softirqs.CPU169.TIMER
     15538 =C2=B1  7%      -0.8%      15415 =C2=B1  3%      -3.6%      1498=
0 =C2=B1  5%  softirqs.CPU17.RCU
      4811 =C2=B1 11%      +1.0%       4859 =C2=B1 10%      +5.3%       506=
7        softirqs.CPU17.SCHED
      1.67 =C2=B1 44%     +20.0%       2.00           +20.0%       2.00    =
    softirqs.CPU17.TASKLET
    172.67 =C2=B1 53%     +19.0%     205.50 =C2=B1 56%      +1.2%     174.6=
7 =C2=B1 20%  softirqs.CPU17.TIMER
     14480 =C2=B1  3%      -2.3%      14146 =C2=B1  4%      -3.9%      1390=
9 =C2=B1  6%  softirqs.CPU170.RCU
      4925 =C2=B1 11%      -0.2%       4915 =C2=B1 10%      +4.0%       512=
2        softirqs.CPU170.SCHED
    218.67 =C2=B1 16%     +33.1%     291.00 =C2=B1 49%      -4.6%     208.5=
0 =C2=B1 13%  softirqs.CPU170.TIMER
     14111 =C2=B1  3%      -2.1%      13818 =C2=B1  3%      -4.7%      1345=
0 =C2=B1  6%  softirqs.CPU171.RCU
      4883 =C2=B1 10%      -0.6%       4854 =C2=B1 10%      +4.0%       508=
0        softirqs.CPU171.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU171.TASKLET
    135.00 =C2=B1 42%      +7.8%     145.50 =C2=B1 16%      +0.4%     135.5=
0 =C2=B1 29%  softirqs.CPU171.TIMER
     14149 =C2=B1  3%      -1.2%      13983 =C2=B1  6%      -5.2%      1341=
9 =C2=B1  6%  softirqs.CPU172.RCU
      4867 =C2=B1 10%      -4.0%       4670 =C2=B1 13%      +4.8%       510=
3        softirqs.CPU172.SCHED
    155.67 =C2=B1 18%      -6.6%     145.33 =C2=B1 10%     +49.7%     233.0=
0 =C2=B1 47%  softirqs.CPU172.TIMER
     14135 =C2=B1  3%      -3.2%      13686 =C2=B1  3%      -4.5%      1349=
9 =C2=B1  6%  softirqs.CPU173.RCU
      4865 =C2=B1 10%      +0.7%       4901 =C2=B1 10%      +4.6%       508=
9        softirqs.CPU173.SCHED
    154.50 =C2=B1 15%      -5.2%     146.50 =C2=B1 53%      -5.3%     146.3=
3 =C2=B1 18%  softirqs.CPU173.TIMER
     14293 =C2=B1  4%      -2.9%      13873 =C2=B1  4%      -5.4%      1352=
0 =C2=B1  6%  softirqs.CPU174.RCU
      4894 =C2=B1 11%      -0.2%       4882 =C2=B1 10%      +3.7%       507=
6        softirqs.CPU174.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU174.TASKLET
    159.50 =C2=B1 15%     +16.9%     186.50 =C2=B1 53%     -18.4%     130.1=
7 =C2=B1 11%  softirqs.CPU174.TIMER
     14009 =C2=B1  3%      -2.4%      13674 =C2=B1  3%      -4.9%      1332=
6 =C2=B1  6%  softirqs.CPU175.RCU
      4827 =C2=B1 10%      +1.2%       4887 =C2=B1 10%      +6.2%       512=
7        softirqs.CPU175.SCHED
    159.00 =C2=B1 18%      +0.9%     160.50 =C2=B1 13%     +42.8%     227.0=
0 =C2=B1 51%  softirqs.CPU175.TIMER
     13834 =C2=B1  2%      -3.6%      13342 =C2=B1  3%      -5.7%      1303=
9 =C2=B1  7%  softirqs.CPU176.RCU
      4844 =C2=B1 11%      +0.3%       4858 =C2=B1 10%      +4.8%       507=
4        softirqs.CPU176.SCHED
      1.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU176.TASKLET
    149.67 =C2=B1 31%      +5.0%     157.17 =C2=B1 24%      +9.1%     163.3=
3 =C2=B1 15%  softirqs.CPU176.TIMER
     13769 =C2=B1  2%      -4.5%      13142 =C2=B1  3%      -6.1%      1293=
5 =C2=B1  6%  softirqs.CPU177.RCU
      4858 =C2=B1 10%      +0.0%       4859 =C2=B1 11%      +4.8%       509=
3        softirqs.CPU177.SCHED
      1.33 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU177.TASKLET
    135.50 =C2=B1 15%     +56.2%     211.67 =C2=B1 60%      -4.7%     129.1=
7 =C2=B1 17%  softirqs.CPU177.TIMER
     13868 =C2=B1  2%      -2.4%      13535 =C2=B1  4%      -5.9%      1304=
7 =C2=B1  6%  softirqs.CPU178.RCU
      4820 =C2=B1 11%      +3.0%       4964 =C2=B1 12%      +5.2%       507=
2        softirqs.CPU178.SCHED
    144.83 =C2=B1 27%    +163.1%     381.00 =C2=B1132%      +1.3%     146.6=
7 =C2=B1 19%  softirqs.CPU178.TIMER
     14098 =C2=B1  2%      -0.7%      14003 =C2=B1  4%      -7.1%      1310=
3 =C2=B1  6%  softirqs.CPU179.RCU
      4995 =C2=B1 13%      +2.0%       5096 =C2=B1  2%      +2.3%       510=
9        softirqs.CPU179.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU179.TASKLET
    316.83 =C2=B1121%     +33.9%     424.17 =C2=B1115%     -54.9%     142.8=
3 =C2=B1 20%  softirqs.CPU179.TIMER
      0.00       +4.3e+103%      43.50 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU18.BLOCK
     15988 =C2=B1  6%      -3.3%      15461 =C2=B1  3%      -5.7%      1507=
9 =C2=B1  6%  softirqs.CPU18.RCU
      4832 =C2=B1 11%      +0.6%       4858 =C2=B1 10%      +5.2%       508=
1        softirqs.CPU18.SCHED
      4.67 =C2=B1109%     -67.9%       1.50 =C2=B1 50%     -57.1%       2.0=
0        softirqs.CPU18.TASKLET
    196.33 =C2=B1 33%     -19.0%     159.00 =C2=B1 24%     -10.8%     175.1=
7 =C2=B1 20%  softirqs.CPU18.TIMER
     14039 =C2=B1  2%      -2.8%      13650 =C2=B1  3%      -5.8%      1323=
1 =C2=B1  6%  softirqs.CPU180.RCU
      4833 =C2=B1 11%      +1.2%       4892 =C2=B1 10%      +7.4%       519=
3 =C2=B1  2%  softirqs.CPU180.SCHED
      0.00       +2.8e+102%       2.83 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU180.TASKLET
    149.50 =C2=B1 22%      +3.1%     154.17 =C2=B1 25%     +58.2%     236.5=
0 =C2=B1 50%  softirqs.CPU180.TIMER
     13802 =C2=B1  2%      -3.1%      13368 =C2=B1  3%      -5.4%      1306=
3 =C2=B1  7%  softirqs.CPU181.RCU
      4851 =C2=B1 11%      +1.5%       4924 =C2=B1  9%      +6.1%       514=
8        softirqs.CPU181.SCHED
    137.17 =C2=B1 20%     +36.2%     186.83 =C2=B1 19%     +36.8%     187.6=
7 =C2=B1 15%  softirqs.CPU181.TIMER
     13866 =C2=B1  2%      -2.7%      13491 =C2=B1  4%      -4.6%      1323=
2 =C2=B1  8%  softirqs.CPU182.RCU
      4824 =C2=B1 10%      +1.9%       4918 =C2=B1  9%      +6.5%       513=
9        softirqs.CPU182.SCHED
      0.00          -100.0%       0.00       +1.3e+102%       1.33 =C2=B122=
3%  softirqs.CPU182.TASKLET
    124.83 =C2=B1 13%     +10.1%     137.50 =C2=B1 30%     +33.5%     166.6=
7 =C2=B1 47%  softirqs.CPU182.TIMER
     13796 =C2=B1  2%      -0.5%      13727 =C2=B1  4%      -6.4%      1291=
5 =C2=B1  7%  softirqs.CPU183.RCU
      4818 =C2=B1 11%      +1.3%       4880 =C2=B1 10%      +6.0%       510=
7        softirqs.CPU183.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU183.TASKLET
    169.00 =C2=B1 15%      -5.3%     160.00 =C2=B1 17%     +10.1%     186.0=
0 =C2=B1 23%  softirqs.CPU183.TIMER
     13921 =C2=B1  2%      -3.2%      13475 =C2=B1  4%      -5.0%      1322=
8 =C2=B1  6%  softirqs.CPU184.RCU
      4874 =C2=B1 11%      +1.6%       4953 =C2=B1 10%      +8.2%       527=
3 =C2=B1  4%  softirqs.CPU184.SCHED
    146.50 =C2=B1 24%     +91.8%     281.00 =C2=B1 67%     +83.8%     269.3=
3 =C2=B1 97%  softirqs.CPU184.TIMER
     14047 =C2=B1  2%     +11.5%      15658 =C2=B1 17%      -5.0%      1334=
9 =C2=B1  6%  softirqs.CPU185.RCU
      4842 =C2=B1 11%      +4.4%       5055 =C2=B1 11%     +11.5%       540=
0 =C2=B1  7%  softirqs.CPU185.SCHED
    203.67 =C2=B1 27%    +251.3%     715.50 =C2=B1 85%    +195.3%     601.5=
0 =C2=B1142%  softirqs.CPU185.TIMER
     13908 =C2=B1  2%      -3.1%      13479 =C2=B1  4%      -6.5%      1299=
7 =C2=B1  7%  softirqs.CPU186.RCU
      4811 =C2=B1 11%      +4.2%       5012 =C2=B1 12%      +6.5%       512=
5        softirqs.CPU186.SCHED
    146.83 =C2=B1 19%    +115.0%     315.67 =C2=B1102%      +0.5%     147.5=
0 =C2=B1 21%  softirqs.CPU186.TIMER
     13811 =C2=B1  2%      -3.4%      13347 =C2=B1  3%      -5.5%      1305=
5 =C2=B1  7%  softirqs.CPU187.RCU
      4812 =C2=B1 11%      -2.9%       4673 =C2=B1 22%      +6.6%       513=
0 =C2=B1  2%  softirqs.CPU187.SCHED
    113.33 =C2=B1 15%     +76.0%     199.50 =C2=B1126%      +3.4%     117.1=
7 =C2=B1 30%  softirqs.CPU187.TIMER
     13634 =C2=B1  3%      -2.9%      13238 =C2=B1  4%      -6.4%      1276=
4 =C2=B1  7%  softirqs.CPU188.RCU
      4839 =C2=B1 11%      +0.5%       4864 =C2=B1  9%      +5.5%       510=
6        softirqs.CPU188.SCHED
    134.17 =C2=B1 22%      +4.3%     140.00 =C2=B1 13%     +11.1%     149.0=
0 =C2=B1 19%  softirqs.CPU188.TIMER
     13851 =C2=B1  2%      -3.9%      13306 =C2=B1  3%      -6.0%      1302=
0 =C2=B1  7%  softirqs.CPU189.RCU
      4971 =C2=B1 12%      -1.8%       4880 =C2=B1 10%      +2.1%       507=
8        softirqs.CPU189.SCHED
    375.33 =C2=B1129%     -44.5%     208.33 =C2=B1 47%     -60.5%     148.1=
7 =C2=B1 14%  softirqs.CPU189.TIMER
     15761 =C2=B1  5%      -2.4%      15389 =C2=B1  3%      -4.5%      1505=
8 =C2=B1  6%  softirqs.CPU19.RCU
      4806 =C2=B1 11%      +0.9%       4851 =C2=B1 10%      +5.5%       506=
9        softirqs.CPU19.SCHED
      2.00            +0.0%       2.00            +8.3%       2.17 =C2=B1 1=
7%  softirqs.CPU19.TASKLET
    266.17 =C2=B1 75%     -37.8%     165.50 =C2=B1 12%     -39.7%     160.5=
0 =C2=B1 33%  softirqs.CPU19.TIMER
     13932 =C2=B1  3%      -1.4%      13735 =C2=B1  5%      -6.4%      1304=
2 =C2=B1  6%  softirqs.CPU190.RCU
      4613 =C2=B1 13%      +8.6%       5011 =C2=B1 12%     +10.2%       508=
3        softirqs.CPU190.SCHED
    156.50 =C2=B1  8%    +132.8%     364.33 =C2=B1140%     -14.1%     134.5=
0 =C2=B1 21%  softirqs.CPU190.TIMER
     14153 =C2=B1  7%      -0.9%      14033 =C2=B1  4%      -3.4%      1367=
0 =C2=B1  7%  softirqs.CPU191.RCU
      4863 =C2=B1 10%      +1.2%       4920 =C2=B1 10%      +5.8%       514=
7        softirqs.CPU191.SCHED
      0.00          -100.0%       0.00         +5e+102%       5.00 =C2=B115=
2%  softirqs.CPU191.TASKLET
    178.17 =C2=B1 15%      +2.8%     183.17 =C2=B1 16%     +40.2%     249.8=
3 =C2=B1 25%  softirqs.CPU191.TIMER
     15995 =C2=B1  5%      -1.0%      15832 =C2=B1  2%      -5.7%      1507=
7 =C2=B1  4%  softirqs.CPU2.RCU
      4972 =C2=B1 11%      +1.2%       5032 =C2=B1  8%      +6.8%       531=
1 =C2=B1  5%  softirqs.CPU2.SCHED
    255.67 =C2=B1 22%     +64.1%     419.50 =C2=B1 35%     +67.8%     429.0=
0 =C2=B1 61%  softirqs.CPU2.TIMER
     15659 =C2=B1  5%      -1.9%      15362 =C2=B1  3%      +2.8%      1610=
2 =C2=B1 14%  softirqs.CPU20.RCU
      4811 =C2=B1 11%      +0.6%       4841 =C2=B1 10%      +9.9%       528=
9 =C2=B1  8%  softirqs.CPU20.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU20.TASKLET
    139.17 =C2=B1 14%     +41.7%     197.17 =C2=B1 28%    +332.9%     602.5=
0 =C2=B1103%  softirqs.CPU20.TIMER
     43.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU21.BLOCK
     15650 =C2=B1  5%      -1.9%      15354 =C2=B1  3%      -4.4%      1495=
9 =C2=B1  6%  softirqs.CPU21.RCU
      4839 =C2=B1 12%      -0.8%       4802 =C2=B1 10%      +5.4%       509=
9        softirqs.CPU21.SCHED
      2.00 =C2=B1 57%      +0.0%       2.00           -33.3%       1.33 =C2=
=B1 70%  softirqs.CPU21.TASKLET
    146.83 =C2=B1 25%     +21.6%     178.50 =C2=B1 38%     +14.6%     168.3=
3 =C2=B1 37%  softirqs.CPU21.TIMER
     43.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU22.BLOCK
     15977 =C2=B1  6%      -3.6%      15396 =C2=B1  3%      -5.2%      1513=
9 =C2=B1  6%  softirqs.CPU22.RCU
      4834 =C2=B1 11%      -0.2%       4826 =C2=B1 10%      +4.3%       504=
4 =C2=B1  3%  softirqs.CPU22.SCHED
      1.83 =C2=B1 48%    +181.8%       5.17 =C2=B1137%      +9.1%       2.0=
0        softirqs.CPU22.TASKLET
    172.50 =C2=B1  4%      +2.1%     176.17 =C2=B1 18%      -4.3%     165.0=
0 =C2=B1 28%  softirqs.CPU22.TIMER
      0.00       +4.3e+103%      43.50 =C2=B1223% +8.7e+103%      87.00 =C2=
=B1141%  softirqs.CPU23.BLOCK
     16728 =C2=B1 16%      -7.3%      15501 =C2=B1  3%      -9.8%      1509=
3 =C2=B1  6%  softirqs.CPU23.RCU
      4839 =C2=B1 11%      +1.0%       4885 =C2=B1 12%      +5.0%       508=
3        softirqs.CPU23.SCHED
      0.83 =C2=B1107%    -100.0%       0.00           -40.0%       0.50 =C2=
=B1152%  softirqs.CPU23.TASKLET
    386.33 =C2=B1131%     -46.0%     208.67 =C2=B1 95%     -62.6%     144.6=
7 =C2=B1  8%  softirqs.CPU23.TIMER
     15805 =C2=B1  6%      -2.6%      15396 =C2=B1  2%      -8.4%      1447=
1 =C2=B1 13%  softirqs.CPU24.RCU
      4864 =C2=B1 11%      -0.5%       4839 =C2=B1 10%      +5.0%       510=
8 =C2=B1  3%  softirqs.CPU24.SCHED
      2.00            +8.3%       2.17 =C2=B1 17%      +0.0%       2.00    =
    softirqs.CPU24.TASKLET
    408.83 =C2=B1 27%     -22.8%     315.67 =C2=B1 14%      -0.2%     407.8=
3 =C2=B1 49%  softirqs.CPU24.TIMER
     16494 =C2=B1  6%      +0.6%      16599 =C2=B1  5%      -3.9%      1585=
4 =C2=B1  8%  softirqs.CPU25.RCU
      4923 =C2=B1 12%      -0.7%       4888 =C2=B1 11%      +1.2%       498=
1 =C2=B1  2%  softirqs.CPU25.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU25.TASKLET
    492.33 =C2=B1 45%     -38.0%     305.17 =C2=B1 15%     -15.5%     416.0=
0 =C2=B1 35%  softirqs.CPU25.TIMER
     15799 =C2=B1  6%      -2.4%      15416 =C2=B1  3%      -1.6%      1555=
0 =C2=B1  7%  softirqs.CPU26.RCU
      4840 =C2=B1 10%      +0.8%       4881 =C2=B1 10%      +2.0%       493=
7 =C2=B1  2%  softirqs.CPU26.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU26.TASKLET
    200.17 =C2=B1 20%     +76.4%     353.17 =C2=B1 44%     +12.3%     224.8=
3 =C2=B1 18%  softirqs.CPU26.TIMER
     15697 =C2=B1  5%      +0.5%      15772 =C2=B1  5%      -4.9%      1492=
2 =C2=B1 10%  softirqs.CPU27.RCU
      4864 =C2=B1 12%      +0.9%       4908 =C2=B1 10%      +3.9%       505=
2        softirqs.CPU27.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU27.TASKLET
    145.33 =C2=B1 28%      -7.7%     134.17 =C2=B1 20%     -11.8%     128.1=
7 =C2=B1 14%  softirqs.CPU27.TIMER
     15725 =C2=B1  5%      -2.9%      15270 =C2=B1  3%      -5.1%      1492=
8 =C2=B1  8%  softirqs.CPU28.RCU
      4858 =C2=B1 11%      +0.5%       4883 =C2=B1 11%      +1.7%       494=
3 =C2=B1 13%  softirqs.CPU28.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU28.TASKLET
    161.00 =C2=B1 26%      +7.5%     173.00 =C2=B1 81%     +74.6%     281.1=
7 =C2=B1112%  softirqs.CPU28.TIMER
     15818 =C2=B1  6%      -3.3%      15295 =C2=B1  3%      -6.4%      1480=
3 =C2=B1  9%  softirqs.CPU29.RCU
      4871 =C2=B1 11%      -0.4%       4852 =C2=B1 10%      +3.4%       503=
7        softirqs.CPU29.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU29.TASKLET
    156.00 =C2=B1 24%     -10.5%     139.67 =C2=B1 17%     +10.5%     172.3=
3 =C2=B1 21%  softirqs.CPU29.TIMER
     15636 =C2=B1  4%      -1.0%      15480 =C2=B1  2%      -5.3%      1481=
1 =C2=B1  5%  softirqs.CPU3.RCU
      4919 =C2=B1 11%      -1.0%       4872 =C2=B1 10%      +3.9%       510=
9        softirqs.CPU3.SCHED
      0.00          -100.0%       0.00       +3.3e+101%       0.33 =C2=B122=
3%  softirqs.CPU3.TASKLET
    211.50 =C2=B1 26%     -19.6%     170.00 =C2=B1 17%     -17.0%     175.5=
0 =C2=B1 16%  softirqs.CPU3.TIMER
     15717 =C2=B1  5%      -1.7%      15451 =C2=B1  3%      -5.6%      1483=
3 =C2=B1  9%  softirqs.CPU30.RCU
      4639 =C2=B1 14%      +4.9%       4865 =C2=B1 11%      +3.5%       480=
1 =C2=B1 10%  softirqs.CPU30.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU30.TASKLET
    156.83 =C2=B1 13%      -9.5%     142.00 =C2=B1 24%     +31.6%     206.3=
3 =C2=B1 73%  softirqs.CPU30.TIMER
     15720 =C2=B1  5%      -2.4%      15341 =C2=B1  3%      -3.4%      1518=
5 =C2=B1  9%  softirqs.CPU31.RCU
      4885 =C2=B1 11%      +0.2%       4896 =C2=B1 10%      +4.5%       510=
4        softirqs.CPU31.SCHED
      2.00            +0.0%       2.00            +8.3%       2.17 =C2=B1 1=
7%  softirqs.CPU31.TASKLET
    119.83 =C2=B1 21%     +71.6%     205.67 =C2=B1 54%     +70.4%     204.1=
7 =C2=B1 60%  softirqs.CPU31.TIMER
     15996 =C2=B1  5%      -2.1%      15660 =C2=B1  2%      -5.7%      1508=
4 =C2=B1  8%  softirqs.CPU32.RCU
      4910 =C2=B1 11%      -1.8%       4821 =C2=B1 11%      +2.7%       504=
4        softirqs.CPU32.SCHED
    138.83 =C2=B1  5%     +31.9%     183.17 =C2=B1 22%      +2.9%     142.8=
3 =C2=B1 22%  softirqs.CPU32.TIMER
     16040 =C2=B1  5%      -0.9%      15898 =C2=B1  4%      -5.4%      1517=
5 =C2=B1  8%  softirqs.CPU33.RCU
      4874 =C2=B1 11%      -0.2%       4865 =C2=B1 10%      +4.0%       507=
0        softirqs.CPU33.SCHED
    156.33 =C2=B1 28%      -1.0%     154.83 =C2=B1 14%     +13.4%     177.3=
3 =C2=B1 16%  softirqs.CPU33.TIMER
     16102 =C2=B1  5%      -1.5%      15858 =C2=B1  3%      -5.1%      1527=
5 =C2=B1  8%  softirqs.CPU34.RCU
      4853 =C2=B1 11%      -0.4%       4833 =C2=B1 11%      +4.1%       505=
2        softirqs.CPU34.SCHED
    185.33 =C2=B1  6%      -9.4%     168.00 =C2=B1 14%     -14.3%     158.8=
3 =C2=B1 18%  softirqs.CPU34.TIMER
     16372 =C2=B1  3%      -2.8%      15910 =C2=B1  3%      -6.4%      1531=
8 =C2=B1  8%  softirqs.CPU35.RCU
      4858 =C2=B1 11%      +0.2%       4868 =C2=B1 10%      +4.0%       505=
3        softirqs.CPU35.SCHED
      0.00       +1.7e+101%       0.17 =C2=B1223% +3.3e+101%       0.33 =C2=
=B1223%  softirqs.CPU35.TASKLET
    165.83 =C2=B1 21%      -1.7%     163.00 =C2=B1 26%      -9.4%     150.1=
7 =C2=B1 14%  softirqs.CPU35.TIMER
     16247 =C2=B1  5%      -1.0%      16081 =C2=B1  3%      -4.3%      1554=
4 =C2=B1  7%  softirqs.CPU36.RCU
      4857 =C2=B1 11%      -0.4%       4839 =C2=B1 11%      +3.6%       503=
1        softirqs.CPU36.SCHED
      0.00          -100.0%       0.00       +3.3e+101%       0.33 =C2=B122=
3%  softirqs.CPU36.TASKLET
    170.00 =C2=B1 11%     +11.4%     189.33 =C2=B1 33%     -16.0%     142.8=
3 =C2=B1 33%  softirqs.CPU36.TIMER
     15849 =C2=B1  4%      -1.8%      15557 =C2=B1  2%      -5.4%      1499=
5 =C2=B1  8%  softirqs.CPU37.RCU
      4886 =C2=B1 11%      +0.3%       4903 =C2=B1 11%      +3.6%       506=
0        softirqs.CPU37.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU37.TASKLET
    190.33 =C2=B1 70%     -38.8%     116.50 =C2=B1 25%     -25.7%     141.5=
0 =C2=B1 13%  softirqs.CPU37.TIMER
     16023 =C2=B1  4%      -2.0%      15698 =C2=B1  2%      -6.0%      1505=
9 =C2=B1  8%  softirqs.CPU38.RCU
      4842 =C2=B1 11%      +1.3%       4903 =C2=B1 10%      +2.8%       497=
9        softirqs.CPU38.SCHED
    179.50 =C2=B1 18%     -10.7%     160.33 =C2=B1  8%     -13.5%     155.3=
3 =C2=B1 48%  softirqs.CPU38.TIMER
     16413 =C2=B1  6%      -3.9%      15766 =C2=B1  2%      -5.3%      1555=
0 =C2=B1  8%  softirqs.CPU39.RCU
      4917 =C2=B1  9%      -1.0%       4867 =C2=B1 10%      +2.8%       505=
3        softirqs.CPU39.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU39.TASKLET
    250.17 =C2=B1 37%     -43.2%     142.17 =C2=B1 17%     -35.2%     162.1=
7 =C2=B1 17%  softirqs.CPU39.TIMER
     15631 =C2=B1  5%      -1.8%      15353 =C2=B1  2%      -4.8%      1487=
7 =C2=B1  5%  softirqs.CPU4.RCU
      4634 =C2=B1 15%      +4.7%       4854 =C2=B1 10%      -1.6%       455=
9 =C2=B1 17%  softirqs.CPU4.SCHED
    153.17 =C2=B1 23%     +10.6%     169.33 =C2=B1 22%     -19.3%     123.6=
7 =C2=B1 31%  softirqs.CPU4.TIMER
     16214 =C2=B1  5%      +0.1%      16233 =C2=B1  6%      -5.9%      1526=
0 =C2=B1  8%  softirqs.CPU40.RCU
      4945 =C2=B1  8%      -1.6%       4865 =C2=B1 10%      +5.0%       519=
1 =C2=B1  6%  softirqs.CPU40.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU40.TASKLET
    215.00 =C2=B1 72%     -31.8%     146.67 =C2=B1 21%     +36.0%     292.3=
3 =C2=B1120%  softirqs.CPU40.TIMER
     16169 =C2=B1  5%      -0.9%      16022 =C2=B1  3%      -5.6%      1526=
1 =C2=B1  8%  softirqs.CPU41.RCU
      4876 =C2=B1 11%      +0.8%       4914 =C2=B1 11%      +3.7%       505=
5        softirqs.CPU41.SCHED
    162.33 =C2=B1 19%      +7.7%     174.83 =C2=B1 19%      +9.9%     178.3=
3 =C2=B1 17%  softirqs.CPU41.TIMER
     16195 =C2=B1  5%      -1.7%      15914 =C2=B1  2%      -5.5%      1530=
7 =C2=B1  8%  softirqs.CPU42.RCU
      4858 =C2=B1 11%      -4.0%       4663 =C2=B1 13%      +4.8%       509=
3        softirqs.CPU42.SCHED
    212.83 =C2=B1 57%     -38.6%     130.67 =C2=B1 22%     -24.5%     160.6=
7 =C2=B1 53%  softirqs.CPU42.TIMER
     16015 =C2=B1  5%      -1.2%      15826 =C2=B1  2%      -4.5%      1529=
0 =C2=B1  8%  softirqs.CPU43.RCU
      4855 =C2=B1 11%      -1.8%       4766 =C2=B1 11%      +5.2%       510=
8        softirqs.CPU43.SCHED
      0.00          -100.0%       0.00       +2.7e+102%       2.67 =C2=B122=
3%  softirqs.CPU43.TASKLET
    134.33 =C2=B1 21%      +9.6%     147.17 =C2=B1 31%     +35.4%     181.8=
3 =C2=B1 68%  softirqs.CPU43.TIMER
     16000 =C2=B1  4%      -1.0%      15846 =C2=B1  2%      -5.1%      1518=
4 =C2=B1  8%  softirqs.CPU44.RCU
      4867 =C2=B1 11%      +0.5%       4890 =C2=B1 11%      +4.4%       508=
1        softirqs.CPU44.SCHED
      0.00          -100.0%       0.00       +6.7e+101%       0.67 =C2=B122=
3%  softirqs.CPU44.TASKLET
    150.67 =C2=B1 19%     +19.5%     180.00 =C2=B1 28%      +6.1%     159.8=
3 =C2=B1 37%  softirqs.CPU44.TIMER
     16221 =C2=B1  6%      -2.2%      15871 =C2=B1  3%      -5.0%      1540=
2 =C2=B1  8%  softirqs.CPU45.RCU
      4893 =C2=B1 11%      -0.1%       4890 =C2=B1 11%      +3.5%       506=
5        softirqs.CPU45.SCHED
    162.17 =C2=B1 21%      +5.3%     170.83 =C2=B1 14%      +6.9%     173.3=
3 =C2=B1 29%  softirqs.CPU45.TIMER
     16047 =C2=B1  5%      +1.0%      16204 =C2=B1  4%      -4.0%      1540=
3 =C2=B1  8%  softirqs.CPU46.RCU
      4849 =C2=B1 11%      +0.5%       4876 =C2=B1 12%      +4.1%       504=
6        softirqs.CPU46.SCHED
      0.00          -100.0%       0.00          -100.0%       0.00        s=
oftirqs.CPU46.TASKLET
    185.17 =C2=B1 22%      +3.6%     191.83 =C2=B1 43%      +5.2%     194.8=
3 =C2=B1 64%  softirqs.CPU46.TIMER
     16321 =C2=B1  5%      -2.6%      15893 =C2=B1  2%      -5.6%      1541=
2 =C2=B1  8%  softirqs.CPU47.RCU
      4977 =C2=B1 13%      -1.5%       4904 =C2=B1 11%      +1.7%       506=
3        softirqs.CPU47.SCHED
    343.33 =C2=B1 78%     -48.5%     176.83 =C2=B1 12%     -48.4%     177.0=
0 =C2=B1 36%  softirqs.CPU47.TIMER
     15277 =C2=B1  4%      -3.9%      14680 =C2=B1  4%      -3.6%      1473=
1 =C2=B1  5%  softirqs.CPU48.RCU
      4886 =C2=B1 10%      -0.8%       4845 =C2=B1 10%      +4.0%       508=
1        softirqs.CPU48.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU48.TASKLET
    495.17 =C2=B1 34%     -19.4%     399.33 =C2=B1 36%      -5.7%     466.8=
3 =C2=B1 31%  softirqs.CPU48.TIMER
     15664 =C2=B1  5%      +0.3%      15711 =C2=B1  5%      -3.6%      1510=
7 =C2=B1  5%  softirqs.CPU49.RCU
      4831 =C2=B1 10%      -0.0%       4830 =C2=B1 10%      +4.6%       505=
0        softirqs.CPU49.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU49.TASKLET
    415.67 =C2=B1 36%     -28.1%     298.67 =C2=B1 14%      -6.2%     390.0=
0 =C2=B1 38%  softirqs.CPU49.TIMER
     15666 =C2=B1  5%      -2.0%      15346 =C2=B1  2%      -5.0%      1487=
8 =C2=B1  5%  softirqs.CPU5.RCU
      4848 =C2=B1 11%      -0.4%       4829 =C2=B1 10%      +0.2%       485=
8 =C2=B1 10%  softirqs.CPU5.SCHED
    110.17 =C2=B1 13%     +16.9%     128.83 =C2=B1 14%     +67.0%     184.0=
0 =C2=B1 73%  softirqs.CPU5.TIMER
     15433 =C2=B1  3%      -2.4%      15062 =C2=B1  5%      -6.8%      1439=
0 =C2=B1  6%  softirqs.CPU50.RCU
      4833 =C2=B1 10%      -0.2%       4824 =C2=B1 10%      +4.6%       505=
7        softirqs.CPU50.SCHED
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    softirqs.CPU50.TASKLET
    213.00 =C2=B1 21%      +8.6%     231.33 =C2=B1 16%      +0.3%     213.6=
7 =C2=B1 11%  softirqs.CPU50.TIMER
     14780 =C2=B1  5%      -1.5%      14561 =C2=B1  4%      -4.6%      1410=
1 =C2=B1  6%  softirqs.CPU51.RCU
      4828 =C2=B1 10%      -0.5%       4801 =C2=B1 10%      +4.7%       505=
6        softirqs.CPU51.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU51.TASKLET
    181.17 =C2=B1 34%     -29.3%     128.17 =C2=B1 27%     -17.8%     149.0=
0 =C2=B1 27%  softirqs.CPU51.TIMER
     15197 =C2=B1  6%      -4.1%      14579 =C2=B1  4%      -6.3%      1423=
4 =C2=B1  6%  softirqs.CPU52.RCU
      4837 =C2=B1 10%      -0.6%       4809 =C2=B1 10%      +3.9%       502=
6        softirqs.CPU52.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU52.TASKLET
    144.17 =C2=B1 12%     +10.8%     159.67 =C2=B1 13%      -1.2%     142.5=
0 =C2=B1 20%  softirqs.CPU52.TIMER
     14956 =C2=B1  5%      -1.1%      14790 =C2=B1  5%      -4.8%      1424=
3 =C2=B1  6%  softirqs.CPU53.RCU
      4833 =C2=B1 10%      -0.3%       4820 =C2=B1 10%      +3.6%       500=
8        softirqs.CPU53.SCHED
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    softirqs.CPU53.TASKLET
    143.00 =C2=B1 12%     +26.6%     181.00 =C2=B1 18%     +35.4%     193.6=
7 =C2=B1 79%  softirqs.CPU53.TIMER
     15036 =C2=B1  4%      -2.8%      14612 =C2=B1  4%      -5.9%      1414=
5 =C2=B1  6%  softirqs.CPU54.RCU
      4831 =C2=B1 10%      -0.5%       4804 =C2=B1 10%      +3.9%       502=
0        softirqs.CPU54.SCHED
      2.17 =C2=B1 17%      -7.7%       2.00            -7.7%       2.00    =
    softirqs.CPU54.TASKLET
    153.00 =C2=B1 15%     -13.6%     132.17 =C2=B1 10%      -3.5%     147.6=
7 =C2=B1  6%  softirqs.CPU54.TIMER
     15105 =C2=B1  6%      -3.4%      14598 =C2=B1  3%      -6.2%      1416=
2 =C2=B1  6%  softirqs.CPU55.RCU
      4827 =C2=B1 10%      +0.2%       4835 =C2=B1 10%      +5.0%       506=
9        softirqs.CPU55.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU55.TASKLET
    178.33 =C2=B1 25%      -3.2%     172.67 =C2=B1 17%      -0.8%     176.8=
3 =C2=B1 63%  softirqs.CPU55.TIMER
     14745 =C2=B1  5%      -2.1%      14440 =C2=B1  3%      -2.2%      1441=
5 =C2=B1 11%  softirqs.CPU56.RCU
      4605 =C2=B1 22%      +5.0%       4837 =C2=B1 10%      +9.1%       502=
2 =C2=B1  2%  softirqs.CPU56.SCHED
    147.33 =C2=B1 19%      -7.2%     136.67 =C2=B1 37%     -11.8%     130.0=
0 =C2=B1 19%  softirqs.CPU56.TIMER
     14711 =C2=B1  5%      -2.6%      14335 =C2=B1  4%      -4.6%      1403=
0 =C2=B1  7%  softirqs.CPU57.RCU
      4981 =C2=B1  4%      -2.9%       4836 =C2=B1 10%      +1.4%       505=
2        softirqs.CPU57.SCHED
    158.50 =C2=B1 12%      +6.9%     169.50 =C2=B1 25%     -13.4%     137.3=
3 =C2=B1 26%  softirqs.CPU57.TIMER
     14859 =C2=B1  4%      -2.5%      14483 =C2=B1  4%      -5.3%      1406=
5 =C2=B1  6%  softirqs.CPU58.RCU
      4898 =C2=B1  6%      -1.1%       4845 =C2=B1 10%      +3.1%       504=
8        softirqs.CPU58.SCHED
    219.00 =C2=B1 74%     -39.1%     133.33 =C2=B1 14%     -30.5%     152.1=
7 =C2=B1 53%  softirqs.CPU58.TIMER
     15281            -3.9%      14678 =C2=B1  4%      -7.1%      14194 =C2=
=B1  6%  softirqs.CPU59.RCU
      4797 =C2=B1 10%      +1.3%       4859 =C2=B1 10%      +5.7%       507=
0        softirqs.CPU59.SCHED
    140.67 =C2=B1  8%      +5.3%     148.17 =C2=B1 33%      -5.2%     133.3=
3 =C2=B1 29%  softirqs.CPU59.TIMER
      1.00            +0.0%       1.00           +33.3%       1.33 =C2=B1 3=
5%  softirqs.CPU6.HI
     15611 =C2=B1  5%      -1.4%      15397 =C2=B1  2%      -5.2%      1480=
6 =C2=B1  5%  softirqs.CPU6.RCU
      4825 =C2=B1 11%      -1.3%       4763 =C2=B1 10%      +5.2%       507=
4        softirqs.CPU6.SCHED
     36.00            +0.0%      36.00            +0.9%      36.33        s=
oftirqs.CPU6.TASKLET
    164.50 =C2=B1 19%      -3.7%     158.33 =C2=B1 20%      +8.4%     178.3=
3 =C2=B1 44%  softirqs.CPU6.TIMER
     14897 =C2=B1  5%      -2.0%      14592 =C2=B1  4%      -5.4%      1408=
9 =C2=B1  6%  softirqs.CPU60.RCU
      4983 =C2=B1 12%      -2.3%       4870 =C2=B1 10%      +0.9%       502=
9        softirqs.CPU60.SCHED
    315.50 =C2=B1107%     -37.0%     198.83 =C2=B1 70%     -44.3%     175.8=
3 =C2=B1 41%  softirqs.CPU60.TIMER
     14828 =C2=B1  5%      -2.1%      14520 =C2=B1  3%      -4.9%      1410=
7 =C2=B1  6%  softirqs.CPU61.RCU
      4813 =C2=B1 10%      +0.6%       4840 =C2=B1 10%      +4.3%       501=
7        softirqs.CPU61.SCHED
    164.00 =C2=B1 11%      -3.0%     159.00 =C2=B1 19%      +0.4%     164.6=
7 =C2=B1 25%  softirqs.CPU61.TIMER
     14605 =C2=B1  7%      -4.7%      13918 =C2=B1 11%      -4.3%      1397=
9 =C2=B1  7%  softirqs.CPU62.RCU
      4968 =C2=B1 13%      -0.6%       4940 =C2=B1 12%      +1.5%       504=
1        softirqs.CPU62.SCHED
      0.00          -100.0%       0.00       +1.7e+101%       0.17 =C2=B122=
3%  softirqs.CPU62.TASKLET
    364.33 =C2=B1130%     -57.6%     154.33 =C2=B1 55%     -69.0%     112.8=
3 =C2=B1 24%  softirqs.CPU62.TIMER
     14535 =C2=B1  7%      -1.0%      14396 =C2=B1  4%      -3.5%      1402=
0 =C2=B1  6%  softirqs.CPU63.RCU
      4827 =C2=B1 11%      +0.6%       4856 =C2=B1  9%      +4.8%       505=
9        softirqs.CPU63.SCHED
      0.17 =C2=B1223%      +0.0%       0.17 =C2=B1223%    -100.0%       0.0=
0        softirqs.CPU63.TASKLET
    146.00 =C2=B1 17%      -0.3%     145.50 =C2=B1 20%      -6.5%     136.5=
0 =C2=B1 24%  softirqs.CPU63.TIMER
     15716 =C2=B1  6%      -2.3%      15353 =C2=B1  4%      -4.1%      1507=
2 =C2=B1  6%  softirqs.CPU64.RCU
      4833 =C2=B1 11%      +1.6%       4910 =C2=B1 12%      +4.8%       506=
5        softirqs.CPU64.SCHED
    150.83 =C2=B1 20%     +18.2%     178.33 =C2=B1 15%      +4.4%     157.5=
0 =C2=B1 16%  softirqs.CPU64.TIMER
     15679 =C2=B1  6%      -2.3%      15319 =C2=B1  4%      -4.0%      1504=
7 =C2=B1  6%  softirqs.CPU65.RCU
      4856 =C2=B1 10%      +1.0%       4906 =C2=B1 11%      +6.1%       515=
2 =C2=B1  4%  softirqs.CPU65.SCHED
    130.33 =C2=B1 22%     +69.1%     220.33 =C2=B1 56%     +81.8%     237.0=
0 =C2=B1106%  softirqs.CPU65.TIMER
     15748 =C2=B1  7%      -3.9%      15127 =C2=B1  4%      -5.8%      1483=
1 =C2=B1  6%  softirqs.CPU66.RCU
      4861 =C2=B1 10%      +0.2%       4872 =C2=B1 11%      +4.8%       509=
5 =C2=B1  2%  softirqs.CPU66.SCHED
    222.83 =C2=B1 39%     -33.7%     147.67 =C2=B1 19%     -12.4%     195.1=
7 =C2=B1 64%  softirqs.CPU66.TIMER
     15436 =C2=B1  5%      -1.8%      15166 =C2=B1  5%      -3.9%      1484=
1 =C2=B1  6%  softirqs.CPU67.RCU
      4833 =C2=B1 11%      +0.3%       4847 =C2=B1 11%      +4.5%       505=
1        softirqs.CPU67.SCHED
      0.00         +3e+102%       3.00 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU67.TASKLET
    167.67 =C2=B1 12%      -1.0%     166.00 =C2=B1 13%      -6.5%     156.8=
3 =C2=B1 20%  softirqs.CPU67.TIMER
     15466 =C2=B1  6%      -2.3%      15118 =C2=B1  4%      -4.0%      1485=
0 =C2=B1  7%  softirqs.CPU68.RCU
      4812 =C2=B1 10%      +0.1%       4817 =C2=B1 10%      +5.4%       507=
3 =C2=B1  2%  softirqs.CPU68.SCHED
    240.83 =C2=B1 80%     -44.2%     134.33 =C2=B1 14%     -13.4%     208.6=
7 =C2=B1 67%  softirqs.CPU68.TIMER
     15506 =C2=B1  6%      -2.2%      15165 =C2=B1  4%      -3.9%      1490=
4 =C2=B1  7%  softirqs.CPU69.RCU
      4848 =C2=B1 10%      +0.7%       4884 =C2=B1 11%      +4.3%       505=
9        softirqs.CPU69.SCHED
    145.00 =C2=B1  7%     +59.4%     231.17 =C2=B1 51%      -7.2%     134.5=
0 =C2=B1 26%  softirqs.CPU69.TIMER
     15302 =C2=B1  4%      -1.6%      15061 =C2=B1  2%      -5.3%      1449=
7 =C2=B1  6%  softirqs.CPU7.RCU
      4889 =C2=B1 11%      -3.4%       4722 =C2=B1 18%      +4.8%       512=
3 =C2=B1  4%  softirqs.CPU7.SCHED
      0.00       +3.3e+101%       0.33 =C2=B1141%   +5e+101%       0.50 =C2=
=B1223%  softirqs.CPU7.TASKLET
    198.67 =C2=B1 44%     +81.5%     360.67 =C2=B1 99%     +53.0%     304.0=
0 =C2=B1117%  softirqs.CPU7.TIMER
     15445 =C2=B1  5%      -1.3%      15238 =C2=B1  5%      -3.1%      1496=
9 =C2=B1  6%  softirqs.CPU70.RCU
      4810 =C2=B1 10%      +0.8%       4847 =C2=B1 10%      +5.7%       508=
7        softirqs.CPU70.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU70.TASKLET
    204.33 =C2=B1 53%     -27.5%     148.17 =C2=B1 72%     -11.1%     181.6=
7 =C2=B1 30%  softirqs.CPU70.TIMER
     15352 =C2=B1 10%      -0.6%      15261 =C2=B1  4%      +0.2%      1538=
5 =C2=B1 10%  softirqs.CPU71.RCU
      4832 =C2=B1 10%      -3.4%       4665 =C2=B1 11%      +5.4%       509=
2        softirqs.CPU71.SCHED
    202.67 =C2=B1 53%     -36.8%     128.17 =C2=B1 20%     +19.4%     242.0=
0 =C2=B1 61%  softirqs.CPU71.TIMER
     14481 =C2=B1  5%      -2.1%      14171 =C2=B1  2%      -4.5%      1383=
0 =C2=B1  6%  softirqs.CPU72.RCU
      4832 =C2=B1 10%      +0.5%       4856 =C2=B1 10%      +7.2%       518=
1 =C2=B1  4%  softirqs.CPU72.SCHED
      2.00            +0.0%       2.00           +41.7%       2.83 =C2=B1 6=
5%  softirqs.CPU72.TASKLET
    371.67 =C2=B1 31%     -22.5%     288.17 =C2=B1  7%     +90.5%     708.1=
7 =C2=B1 63%  softirqs.CPU72.TIMER
     15465 =C2=B1  2%      -3.5%      14919 =C2=B1  4%      -4.9%      1470=
4 =C2=B1  6%  softirqs.CPU73.RCU
      4803 =C2=B1 11%      +0.1%       4808 =C2=B1 10%      +5.0%       504=
1        softirqs.CPU73.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU73.TASKLET
    332.50 =C2=B1 29%      +1.6%     337.67 =C2=B1 37%     -13.9%     286.1=
7 =C2=B1  9%  softirqs.CPU73.TIMER
     14716 =C2=B1  4%      -2.7%      14325 =C2=B1  4%      -4.3%      1408=
9 =C2=B1  6%  softirqs.CPU74.RCU
      4927 =C2=B1 13%      -0.7%       4892 =C2=B1  4%      +2.6%       505=
6        softirqs.CPU74.SCHED
      2.00            +0.0%       2.00            +8.3%       2.17 =C2=B1 1=
7%  softirqs.CPU74.TASKLET
    347.83 =C2=B1 89%     +35.3%     470.50 =C2=B1104%     -37.2%     218.5=
0 =C2=B1 14%  softirqs.CPU74.TIMER
     14419 =C2=B1  3%      -2.1%      14119 =C2=B1  4%      -4.3%      1380=
2 =C2=B1  6%  softirqs.CPU75.RCU
      4831 =C2=B1 12%      -0.3%       4815 =C2=B1 10%      +4.8%       506=
2        softirqs.CPU75.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU75.TASKLET
    138.33 =C2=B1 74%     +30.2%     180.17 =C2=B1 64%     +11.0%     153.5=
0 =C2=B1 26%  softirqs.CPU75.TIMER
     14519 =C2=B1  4%      -2.3%      14180 =C2=B1  4%      -5.0%      1378=
8 =C2=B1  6%  softirqs.CPU76.RCU
      4869 =C2=B1 12%      -1.7%       4784 =C2=B1  9%      +3.4%       503=
3        softirqs.CPU76.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU76.TASKLET
    275.33 =C2=B1 66%     -46.4%     147.50 =C2=B1 28%     -33.4%     183.5=
0 =C2=B1 86%  softirqs.CPU76.TIMER
     14545 =C2=B1  4%      -1.8%      14288 =C2=B1  4%      -2.5%      1418=
1 =C2=B1  8%  softirqs.CPU77.RCU
      4833 =C2=B1 11%      +3.8%       5017 =C2=B1 15%      +4.9%       507=
1        softirqs.CPU77.SCHED
      2.83 =C2=B1 65%     -29.4%       2.00           -29.4%       2.00    =
    softirqs.CPU77.TASKLET
    153.50 =C2=B1 16%    +231.3%     508.50 =C2=B1158%     +11.4%     171.0=
0 =C2=B1 29%  softirqs.CPU77.TIMER
     14495 =C2=B1  4%      -1.2%      14314 =C2=B1  3%      -3.5%      1398=
7 =C2=B1  8%  softirqs.CPU78.RCU
      4864 =C2=B1 12%      -0.3%       4850 =C2=B1 10%      +6.7%       519=
0 =C2=B1  6%  softirqs.CPU78.SCHED
      2.00            +0.0%       2.00            +0.0%       2.00        s=
oftirqs.CPU78.TASKLET
    197.33 =C2=B1 53%     -36.9%     124.50 =C2=B1 29%     +34.2%     264.8=
3 =C2=B1135%  softirqs.CPU78.TIMER
     14257 =C2=B1  3%      -1.4%      14051 =C2=B1  4%      -2.9%      1383=
8 =C2=B1  6%  softirqs.CPU79.RCU
      4794 =C2=B1 11%      +0.7%       4826 =C2=B1 10%      +5.4%       505=
4        softirqs.CPU79.SCHED
      2.83 =C2=B1 65%     -29.4%       2.00           +29.4%       3.67 =C2=
=B1101%  softirqs.CPU79.TASKLET
    212.50 =C2=B1 47%     -40.2%     127.00 =C2=B1 18%     -31.1%     146.5=
0 =C2=B1 20%  softirqs.CPU79.TIMER
     15585 =C2=B1  6%      -3.2%      15093 =C2=B1  3%      -5.8%      1468=
8 =C2=B1  6%  softirqs.CPU8.RCU
      4882 =C2=B1 12%      -0.8%       4844 =C2=B1 10%      +3.7%       506=
4        softirqs.CPU8.SCHED
    197.00 =C2=B1 42%     -16.4%     164.67 =C2=B1 17%     -29.2%     139.5=
0 =C2=B1 22%  softirqs.CPU8.TIMER
     14465 =C2=B1  6%      -1.6%      14230 =C2=B1  3%      -4.7%      1379=
2 =C2=B1  6%  softirqs.CPU80.RCU
      4801 =C2=B1 11%      +0.5%       4826 =C2=B1 10%      +5.5%       506=
7        softirqs.CPU80.SCHED
      0.00          -100.0%       0.00       +8.3e+101%       0.83 =C2=B122=
3%  softirqs.CPU80.TASKLET
    178.50 =C2=B1 27%      -4.3%     170.83 =C2=B1 21%     -17.4%     147.5=
0 =C2=B1 16%  softirqs.CPU80.TIMER
     14449 =C2=B1  6%      -1.4%      14250 =C2=B1  3%      -5.0%      1372=
1 =C2=B1  6%  softirqs.CPU81.RCU
      4794 =C2=B1 11%      +1.1%       4848 =C2=B1 10%      +5.4%       505=
5        softirqs.CPU81.SCHED
    109.50 =C2=B1 21%     +92.7%     211.00 =C2=B1 29%     +35.9%     148.8=
3 =C2=B1 15%  softirqs.CPU81.TIMER
     14427 =C2=B1  6%      -0.8%      14317 =C2=B1  2%      -4.1%      1383=
4 =C2=B1  6%  softirqs.CPU82.RCU
      4804 =C2=B1 11%      +0.7%       4836 =C2=B1 10%      +5.1%       504=
9        softirqs.CPU82.SCHED
    160.50 =C2=B1 20%      +3.4%     166.00 =C2=B1 47%      +2.7%     164.8=
3 =C2=B1 23%  softirqs.CPU82.TIMER
     14499 =C2=B1  3%      -5.6%      13687 =C2=B1  5%      -5.8%      1365=
4 =C2=B1  6%  softirqs.CPU83.RCU
      4776 =C2=B1 11%      +1.0%       4823 =C2=B1 10%      +5.6%       504=
2        softirqs.CPU83.SCHED
    125.17 =C2=B1 20%     +32.5%     165.83 =C2=B1 46%      -8.5%     114.5=
0 =C2=B1 35%  softirqs.CPU83.TIMER
     14776 =C2=B1  5%      -2.4%      14425 =C2=B1  4%      -7.3%      1369=
7 =C2=B1  7%  softirqs.CPU84.RCU
      4817 =C2=B1 11%      -0.0%       4817 =C2=B1 10%      +4.2%       501=
8        softirqs.CPU84.SCHED
      0.17 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU84.TASKLET
    213.33 =C2=B1 56%     -48.3%     110.33 =C2=B1 18%     -43.0%     121.6=
7 =C2=B1 22%  softirqs.CPU84.TIMER
     14559 =C2=B1  3%      -1.1%      14392 =C2=B1  3%      -3.2%      1409=
1 =C2=B1  6%  softirqs.CPU85.RCU
      4788 =C2=B1 11%      +5.6%       5055 =C2=B1 15%      +6.0%       507=
6        softirqs.CPU85.SCHED
    186.50 =C2=B1 58%    +191.2%     543.17 =C2=B1167%      -6.7%     174.0=
0 =C2=B1 72%  softirqs.CPU85.TIMER
     14647 =C2=B1  3%      -2.1%      14336 =C2=B1  3%      -5.5%      1384=
0 =C2=B1  6%  softirqs.CPU86.RCU
      4832 =C2=B1 11%      -0.3%       4819 =C2=B1  9%      +4.6%       505=
7        softirqs.CPU86.SCHED
    145.50 =C2=B1 12%      +1.6%     147.83 =C2=B1  7%     -15.3%     123.1=
7 =C2=B1  9%  softirqs.CPU86.TIMER
     14539 =C2=B1  3%      -2.3%      14207 =C2=B1  4%      -5.6%      1372=
2 =C2=B1  6%  softirqs.CPU87.RCU
      4783 =C2=B1 11%      +0.8%       4820 =C2=B1 10%      +5.8%       506=
2        softirqs.CPU87.SCHED
    152.67 =C2=B1 13%     -12.7%     133.33 =C2=B1 21%      +1.4%     154.8=
3 =C2=B1 32%  softirqs.CPU87.TIMER
     14615 =C2=B1  3%      -0.8%      14497 =C2=B1  6%      -5.1%      1387=
1 =C2=B1  7%  softirqs.CPU88.RCU
      4833 =C2=B1 10%      +0.1%       4837 =C2=B1  9%      +4.5%       504=
9        softirqs.CPU88.SCHED
    117.67 =C2=B1 14%     +46.3%     172.17 =C2=B1 12%     +18.7%     139.6=
7 =C2=B1 14%  softirqs.CPU88.TIMER
     14491 =C2=B1  4%      -2.2%      14177 =C2=B1  3%      -5.1%      1375=
2 =C2=B1  7%  softirqs.CPU89.RCU
      4843 =C2=B1 11%      +2.2%       4949 =C2=B1 11%      +5.1%       509=
0        softirqs.CPU89.SCHED
    131.50 =C2=B1 16%    +193.0%     385.33 =C2=B1134%     +26.1%     165.8=
3 =C2=B1 13%  softirqs.CPU89.TIMER
     29.00            +0.6%      29.17            +1.1%      29.33        s=
oftirqs.CPU9.NET_TX
     15724 =C2=B1  5%      -1.6%      15465 =C2=B1  4%      -7.5%      1454=
5 =C2=B1  5%  softirqs.CPU9.RCU
      4351 =C2=B1 17%     +13.9%       4954 =C2=B1 11%     +17.6%       511=
6        softirqs.CPU9.SCHED
      0.83 =C2=B1128%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU9.TASKLET
    274.67 =C2=B1 16%     +35.0%     370.83 =C2=B1 43%      -2.3%     268.3=
3 =C2=B1 11%  softirqs.CPU9.TIMER
     14478 =C2=B1  3%      -2.3%      14143 =C2=B1  3%      -4.1%      1387=
8 =C2=B1  7%  softirqs.CPU90.RCU
      4752 =C2=B1 10%      +1.5%       4822 =C2=B1 10%      +6.6%       506=
6        softirqs.CPU90.SCHED
    140.00 =C2=B1 21%      +5.8%     148.17 =C2=B1 25%      +9.3%     153.0=
0 =C2=B1 33%  softirqs.CPU90.TIMER
     14733 =C2=B1  3%      -2.2%      14405 =C2=B1  3%      -6.0%      1384=
4 =C2=B1  6%  softirqs.CPU91.RCU
      4817 =C2=B1 11%      +1.1%       4872 =C2=B1 10%      +4.8%       504=
7        softirqs.CPU91.SCHED
    196.17 =C2=B1 58%     -44.9%     108.00 =C2=B1 21%     -54.8%      88.6=
7 =C2=B1 29%  softirqs.CPU91.TIMER
     14404 =C2=B1  5%      -0.5%      14332 =C2=B1  3%      -4.3%      1377=
8 =C2=B1  6%  softirqs.CPU92.RCU
      4807 =C2=B1 11%      +0.5%       4832 =C2=B1 10%      +5.9%       509=
2        softirqs.CPU92.SCHED
    122.50 =C2=B1 18%      +9.5%     134.17 =C2=B1 37%    +111.3%     258.8=
3 =C2=B1104%  softirqs.CPU92.TIMER
     14540 =C2=B1  5%      -0.5%      14470 =C2=B1  3%      -5.4%      1374=
9 =C2=B1  7%  softirqs.CPU93.RCU
      5032 =C2=B1 17%      -3.6%       4849 =C2=B1 11%      +0.7%       507=
0        softirqs.CPU93.SCHED
    574.33 =C2=B1168%     -78.4%     124.00 =C2=B1 49%     -68.1%     183.1=
7 =C2=B1 15%  softirqs.CPU93.TIMER
     14328 =C2=B1  5%      -1.9%      14061 =C2=B1  3%      -4.5%      1368=
0 =C2=B1  6%  softirqs.CPU94.RCU
      4497 =C2=B1 19%      +7.7%       4842 =C2=B1 11%     +13.3%       509=
7        softirqs.CPU94.SCHED
    140.17 =C2=B1 18%      -9.0%     127.50 =C2=B1 12%      -5.0%     133.1=
7 =C2=B1 18%  softirqs.CPU94.TIMER
     14595 =C2=B1  5%      -2.1%      14286 =C2=B1  3%      -3.3%      1411=
8 =C2=B1  6%  softirqs.CPU95.RCU
      4844 =C2=B1 11%      +0.9%       4886 =C2=B1 11%     +10.2%       534=
0 =C2=B1  9%  softirqs.CPU95.SCHED
    165.50 =C2=B1 43%      -4.7%     157.67 =C2=B1 25%    +244.9%     570.8=
3 =C2=B1152%  softirqs.CPU95.TIMER
    130.50 =C2=B1100%     +33.3%     174.00 =C2=B1 70%     +33.3%     174.0=
0 =C2=B1 70%  softirqs.CPU96.BLOCK
     21664 =C2=B1  4%      -1.1%      21422 =C2=B1  3%      -2.7%      2107=
6 =C2=B1  3%  softirqs.CPU96.RCU
      4429 =C2=B1 16%     +14.7%       5080 =C2=B1  6%     +16.0%       513=
6 =C2=B1  4%  softirqs.CPU96.SCHED
      0.33 =C2=B1223%      +0.0%       0.33 =C2=B1223%      +0.0%       0.3=
3 =C2=B1223%  softirqs.CPU96.TASKLET
    645.83 =C2=B1 13%     +52.4%     984.50 =C2=B1 57%     +35.3%     873.8=
3 =C2=B1 30%  softirqs.CPU96.TIMER
     43.50 =C2=B1223%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU97.BLOCK
     17906 =C2=B1 11%      +3.3%      18505 =C2=B1  3%      -1.3%      1768=
1 =C2=B1  4%  softirqs.CPU97.RCU
      4735 =C2=B1 11%      +3.4%       4898 =C2=B1  9%      +7.3%       508=
3        softirqs.CPU97.SCHED
      0.50 =C2=B1152%    -100.0%       0.00          -100.0%       0.00    =
    softirqs.CPU97.TASKLET
    482.83 =C2=B1  8%      +3.4%     499.33 =C2=B1 24%      -9.2%     438.5=
0 =C2=B1 10%  softirqs.CPU97.TIMER
     15934 =C2=B1  3%      -1.5%      15699 =C2=B1  2%      -5.3%      1508=
7 =C2=B1  5%  softirqs.CPU98.RCU
      4816 =C2=B1 12%      -1.2%       4756 =C2=B1 10%      +5.3%       507=
0        softirqs.CPU98.SCHED
    264.50 =C2=B1  9%      -3.7%     254.83 =C2=B1 31%     -10.6%     236.5=
0 =C2=B1 17%  softirqs.CPU98.TIMER
     15937 =C2=B1  6%      -4.9%      15153 =C2=B1  2%      -7.4%      1475=
5 =C2=B1  5%  softirqs.CPU99.RCU
      4869 =C2=B1 10%      +0.1%       4871 =C2=B1 10%      +4.6%       509=
2        softirqs.CPU99.SCHED
      0.00       +2.7e+102%       2.67 =C2=B1223%    -100.0%       0.00    =
    softirqs.CPU99.TASKLET
    163.50 =C2=B1 16%     +21.7%     199.00 =C2=B1 18%      -3.0%     158.6=
7 =C2=B1 22%  softirqs.CPU99.TIMER
      2.00            +0.0%       2.00           +16.7%       2.33 =C2=B1 2=
0%  softirqs.HI
     10086 =C2=B1 34%     +54.3%      15568 =C2=B1108%     -22.9%       778=
0 =C2=B1 78%  softirqs.NET_RX
     37.50 =C2=B1  4%      +0.0%      37.50 =C2=B1  4%      +0.4%      37.6=
7 =C2=B1  3%  softirqs.NET_TX
   2951776 =C2=B1  4%      -2.1%    2890116 =C2=B1  3%      -4.9%    280616=
8 =C2=B1  6%  softirqs.RCU
    935383 =C2=B1 10%      +0.4%     939555 =C2=B1 10%      +4.8%     98007=
7        softirqs.SCHED
    226.67            +0.1%     226.83            +0.3%     227.33        s=
oftirqs.TASKLET
     45262            -0.9%      44858 =C2=B1  3%      -1.0%      44832 =C2=
=B1  5%  softirqs.TIMER
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.0:IO-APIC.2-edge.timer
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.100:PCI-MSI.23592996-edge.nvme0q36
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.100:PCI-MSI.23593003-edge.nvme0q43
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.101:PCI-MSI.23592997-edge.nvme0q37
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.101:PCI-MSI.23593004-edge.nvme0q44
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.102:PCI-MSI.23592999-edge.nvme0q39
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.102:PCI-MSI.23593017-edge.nvme0q57
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.103:PCI-MSI.23593006-edge.nvme0q46
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
nterrupts.109:PCI-MSI.23593016-edge.nvme0q56
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.110:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.111:PCI-MSI.23593019-edge.nvme0q59
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
nterrupts.118:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.118:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.119:PCI-MSI.23593022-edge.nvme0q62
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.119:PCI-MSI.23593026-edge.nvme0q66
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.120:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.120:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.121:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.121:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.121:PCI-MSI.23593037-edge.nvme0q77
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.122:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.122:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.124:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.125:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.125:PCI-MSI.23593035-edge.nvme0q75
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
nterrupts.128:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.129:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.129:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.130:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.131:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.131:PCI-MSI.23593034-edge.nvme0q74
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.132:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.132:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.133:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.133:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.133:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.134:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.136:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.137:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.137:PCI-MSI.23593047-edge.nvme0q87
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.138:PCI-MSI.23593036-edge.nvme0q76
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.139:PCI-MSI.23593055-edge.nvme0q95
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.140:PCI-MSI.23593036-edge.nvme0q76
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.140:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.140:PCI-MSI.23593047-edge.nvme0q87
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.141:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.141:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.141:PCI-MSI.23593051-edge.nvme0q91
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.142:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.143:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.143:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.144:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.144:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.145:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.145:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.146:PCI-MSI.23593049-edge.nvme0q89
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.147:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.147:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.147:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.147:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.148:PCI-MSI.23593055-edge.nvme0q95
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.148:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.149:PCI-MSI.23593046-edge.nvme0q86
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.149:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.149:PCI-MSI.23593065-edge.nvme0q105
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.150:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.150:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.151:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.151:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.152:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.152:PCI-MSI.23593064-edge.nvme0q104
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.152:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.153:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.154:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.155:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.155:PCI-MSI.23593071-edge.nvme0q111
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.156:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.156:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.156:PCI-MSI.23593071-edge.nvme0q111
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.156:PCI-MSI.23593072-edge.nvme0q112
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.157:PCI-MSI.23593054-edge.nvme0q94
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.157:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.157:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.157:PCI-MSI.23593069-edge.nvme0q109
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.157:PCI-MSI.23593072-edge.nvme0q112
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.158:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.158:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.158:PCI-MSI.23593070-edge.nvme0q110
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.159:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.159:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.160:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.160:PCI-MSI.23593076-edge.nvme0q116
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.161:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.161:PCI-MSI.23593073-edge.nvme0q113
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.162:PCI-MSI.23593069-edge.nvme0q109
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.163:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.163:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.163:PCI-MSI.23593075-edge.nvme0q115
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.164:PCI-MSI.23593067-edge.nvme0q107
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.164:PCI-MSI.23593071-edge.nvme0q111
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.164:PCI-MSI.23593076-edge.nvme0q116
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.165:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.165:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.165:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.165:PCI-MSI.23593075-edge.nvme0q115
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.166:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.166:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.166:PCI-MSI.23593069-edge.nvme0q109
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.166:PCI-MSI.23593074-edge.nvme0q114
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.166:PCI-MSI.23593078-edge.nvme0q118
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.167:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.167:PCI-MSI.23593067-edge.nvme0q107
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.167:PCI-MSI.23593077-edge.nvme0q117
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.168:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.169:PCI-MSI.23593065-edge.nvme0q105
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.169:PCI-MSI.23593077-edge.nvme0q117
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.169:PCI-MSI.23593079-edge.nvme0q119
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.170:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.170:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.171:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.171:PCI-MSI.23593074-edge.nvme0q114
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.171:PCI-MSI.23593083-edge.nvme0q123
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.172:PCI-MSI.23593069-edge.nvme0q109
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.173:PCI-MSI.23593085-edge.nvme0q125
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.173:PCI-MSI.23593088-edge.nvme0q128
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.173:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.174:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.174:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.175:PCI-MSI.23593075-edge.nvme0q115
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.175:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.176:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.177:PCI-MSI.23593070-edge.nvme0q110
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.177:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.178:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.179:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.180:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.181:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.181:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.182:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.182:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.183:PCI-MSI.23593086-edge.nvme0q126
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.183:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.183:PCI-MSI.33628160-edge.ioat-msix
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
      9875 =C2=B1 84%     -64.2%       3532 =C2=B1144%     -58.8%       406=
9 =C2=B1120%  interrupts.31:PCI-MSI.524289-edge.eth0-TxRx-0
      4028 =C2=B1122%     +82.8%       7365 =C2=B1 97%     -23.9%       306=
6 =C2=B1 70%  interrupts.32:PCI-MSI.524290-edge.eth0-TxRx-1
      3204 =C2=B1120%    +267.6%      11781 =C2=B1189%     +76.6%       565=
9 =C2=B1113%  interrupts.33:PCI-MSI.524291-edge.eth0-TxRx-2
      1467 =C2=B1 96%    +374.0%       6955 =C2=B1131%     -19.5%       118=
1 =C2=B1 67%  interrupts.34:PCI-MSI.524292-edge.eth0-TxRx-3
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
nterrupts.42:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.43:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.43:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.43:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.44:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.44:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.44:PCI-MSI.77824-edge.ioat-msix
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
nterrupts.46:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.46:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.47:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.48:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.49:PCI-MSI.33619968-edge.ioat-msix
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
nterrupts.51:PCI-MSI.23592967-edge.nvme0q7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.51:PCI-MSI.33622016-edge.ioat-msix
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
nterrupts.52:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.52:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.52:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.23592969-edge.nvme0q9
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.53:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.23592970-edge.nvme0q10
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.33628160-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.54:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.55:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.55:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.56:PCI-MSI.33634304-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.57:PCI-MSI.23592965-edge.nvme0q5
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
nterrupts.59:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.67174400-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.60:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.61:PCI-MSI.67176448-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.62:PCI-MSI.23592970-edge.nvme0q10
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
nterrupts.64:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.23592961-edge.nvme0q1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.23592965-edge.nvme0q5
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.65:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.23592964-edge.nvme0q4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.23592976-edge.nvme0q16
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.66:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.23592967-edge.nvme0q7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.23592977-edge.nvme0q17
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.67:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.68:PCI-MSI.23592984-edge.nvme0q24
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.69:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.23592963-edge.nvme0q3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.70:PCI-MSI.23592970-edge.nvme0q10
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.71:PCI-MSI.23592964-edge.nvme0q4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.71:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.73:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.75:PCI-MSI.23592975-edge.nvme0q15
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.75:PCI-MSI.23592985-edge.nvme0q25
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.76:PCI-MSI.23592972-edge.nvme0q12
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.76:PCI-MSI.23592976-edge.nvme0q16
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.76:PCI-MSI.23592979-edge.nvme0q19
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.76:PCI-MSI.23592986-edge.nvme0q26
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.77:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.77:PCI-MSI.23592980-edge.nvme0q20
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.78:PCI-MSI.23592971-edge.nvme0q11
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.78:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.78:PCI-MSI.23592990-edge.nvme0q30
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
nterrupts.85:PCI-MSI.23592985-edge.nvme0q25
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.85:PCI-MSI.23592988-edge.nvme0q28
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.85:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.86:PCI-MSI.23592989-edge.nvme0q29
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.86:PCI-MSI.23592993-edge.nvme0q33
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.87:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.87:PCI-MSI.23593002-edge.nvme0q42
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.88:PCI-MSI.23592991-edge.nvme0q31
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.88:PCI-MSI.23592998-edge.nvme0q38
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.88:PCI-MSI.23593000-edge.nvme0q40
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
nterrupts.93:PCI-MSI.23593001-edge.nvme0q41
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
nterrupts.97:PCI-MSI.23593005-edge.nvme0q45
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.98:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.98:PCI-MSI.23592998-edge.nvme0q38
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.99:PCI-MSI.23593002-edge.nvme0q42
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.99:PCI-MSI.23593009-edge.nvme0q49
    606.00            -0.1%     605.67            +0.1%     606.67        i=
nterrupts.9:IO-APIC.9-fasteoi.acpi
    802828            -0.0%     802532            +0.2%     804500        i=
nterrupts.CAL:Function_call_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.0:IO-APIC.2-edge.timer
      3936 =C2=B1  9%      -6.0%       3698 =C2=B1 12%      +0.4%       395=
1 =C2=B1  8%  interrupts.CPU0.CAL:Function_call_interrupts
      2.33 =C2=B1 31%     -21.4%       1.83 =C2=B1 20%     -21.4%       1.8=
3 =C2=B1 20%  interrupts.CPU0.IWI:IRQ_work_interrupts
    555796 =C2=B1 20%      +9.0%     605593            +9.0%     605650    =
    interrupts.CPU0.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU0.MCP:Machine_check_polls
      8195            -8.4%       7504 =C2=B1 20%      -8.4%       7505 =C2=
=B1 20%  interrupts.CPU0.NMI:Non-maskable_interrupts
      8195            -8.4%       7504 =C2=B1 20%      -8.4%       7505 =C2=
=B1 20%  interrupts.CPU0.PMI:Performance_monitoring_interrupts
    916.50            +0.3%     919.33            +0.7%     923.33        i=
nterrupts.CPU0.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU0.RTR:APIC_ICR_read_retries
      2833 =C2=B1  5%      -1.1%       2803 =C2=B1  3%      -2.9%       275=
0 =C2=B1  7%  interrupts.CPU0.TLB:TLB_shootdowns
    606.00            -0.1%     605.67            +0.1%     606.67        i=
nterrupts.CPU1.9:IO-APIC.9-fasteoi.acpi
      5825 =C2=B1 27%      -4.7%       5551 =C2=B1 31%      -9.2%       528=
8 =C2=B1 29%  interrupts.CPU1.CAL:Function_call_interrupts
      2.00           +25.0%       2.50 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU1.IWI:IRQ_work_interrupts
    563605 =C2=B1 16%      +7.5%     605663            +7.5%     605758    =
    interrupts.CPU1.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU1.MCP:Machine_check_polls
      8193            -8.4%       7504 =C2=B1 20%      -8.4%       7502 =C2=
=B1 20%  interrupts.CPU1.NMI:Non-maskable_interrupts
      8193            -8.4%       7504 =C2=B1 20%      -8.4%       7502 =C2=
=B1 20%  interrupts.CPU1.PMI:Performance_monitoring_interrupts
    401.67 =C2=B1 13%      -3.2%     389.00 =C2=B1  9%     +99.6%     801.6=
7 =C2=B1107%  interrupts.CPU1.RES:Rescheduling_interrupts
      2968 =C2=B1  3%      +1.4%       3010            -1.3%       2928 =C2=
=B1  4%  interrupts.CPU1.TLB:TLB_shootdowns
      9875 =C2=B1 84%     -64.2%       3532 =C2=B1144%     -58.8%       406=
9 =C2=B1120%  interrupts.CPU10.31:PCI-MSI.524289-edge.eth0-TxRx-0
      3683            +0.0%       3684            +4.4%       3845 =C2=B1  =
9%  interrupts.CPU10.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU10.IWI:IRQ_work_interrupts
    564064 =C2=B1 16%      +7.4%     605585            +7.4%     605720    =
    interrupts.CPU10.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU10.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.0%       818=
5        interrupts.CPU10.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      +9.0%       818=
5        interrupts.CPU10.PMI:Performance_monitoring_interrupts
    322.00 =C2=B1  5%      +5.0%     338.17 =C2=B1  7%     +17.9%     379.6=
7 =C2=B1 32%  interrupts.CPU10.RES:Rescheduling_interrupts
      2812 =C2=B1  4%      +0.2%       2819 =C2=B1  3%      +0.4%       282=
5 =C2=B1  3%  interrupts.CPU10.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU100.145:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU100.153:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU100.158:PCI-MSI.23593061-edge.nvme0q101
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU100.163:PCI-MSI.23593061-edge.nvme0q101
      3681 =C2=B1  5%      +2.0%       3756            +3.5%       3808 =C2=
=B1  4%  interrupts.CPU100.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     -10.0%       1.50 =C2=B1 33%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU100.IWI:IRQ_work_interrupts
    564084 =C2=B1 16%      +7.3%     605484            +7.4%     605645    =
    interrupts.CPU100.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU100.MCP:Machine_check_polls
      6827 =C2=B1 28%     -10.1%       6138 =C2=B1 33%      +9.9%       750=
1 =C2=B1 20%  interrupts.CPU100.NMI:Non-maskable_interrupts
      6827 =C2=B1 28%     -10.1%       6138 =C2=B1 33%      +9.9%       750=
1 =C2=B1 20%  interrupts.CPU100.PMI:Performance_monitoring_interrupts
    312.67            +2.2%     319.67 =C2=B1  4%      +7.8%     337.17 =C2=
=B1 16%  interrupts.CPU100.RES:Rescheduling_interrupts
      2890 =C2=B1  6%      +2.9%       2975 =C2=B1  3%      +1.6%       293=
5 =C2=B1  3%  interrupts.CPU100.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU101.147:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU101.159:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU101.165:PCI-MSI.23593062-edge.nvme0q102
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU101.166:PCI-MSI.23593062-edge.nvme0q102
      3744 =C2=B1  5%      -0.8%       3713            -1.0%       3707    =
    interrupts.CPU101.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +25.0%       1.67 =C2=B1 28%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU101.IWI:IRQ_work_interrupts
    563919 =C2=B1 16%      +7.4%     605470            +7.4%     605647    =
    interrupts.CPU101.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU101.MCP:Machine_check_polls
      5461 =C2=B1 35%     +24.9%       6821 =C2=B1 28%     +37.4%       750=
3 =C2=B1 20%  interrupts.CPU101.NMI:Non-maskable_interrupts
      5461 =C2=B1 35%     +24.9%       6821 =C2=B1 28%     +37.4%       750=
3 =C2=B1 20%  interrupts.CPU101.PMI:Performance_monitoring_interrupts
    342.67 =C2=B1 18%      -4.1%     328.67 =C2=B1  7%     +36.7%     468.5=
0 =C2=B1 75%  interrupts.CPU101.RES:Rescheduling_interrupts
      2798 =C2=B1  3%      +1.5%       2840 =C2=B1  4%      +0.4%       281=
0 =C2=B1  3%  interrupts.CPU101.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.147:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.160:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.165:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.167:PCI-MSI.23593063-edge.nvme0q103
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU102.170:PCI-MSI.23593063-edge.nvme0q103
      3736            -0.3%       3725            -1.1%       3696 =C2=B1  =
3%  interrupts.CPU102.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +37.5%       1.83 =C2=B1 20%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU102.IWI:IRQ_work_interrupts
    563025 =C2=B1 16%      +7.6%     605584            +7.6%     605616    =
    interrupts.CPU102.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU102.MCP:Machine_check_polls
      5461 =C2=B1 35%     +37.4%       7505 =C2=B1 20%     +37.4%       750=
3 =C2=B1 20%  interrupts.CPU102.NMI:Non-maskable_interrupts
      5461 =C2=B1 35%     +37.4%       7505 =C2=B1 20%     +37.4%       750=
3 =C2=B1 20%  interrupts.CPU102.PMI:Performance_monitoring_interrupts
    311.83            -0.4%     310.67            +2.2%     318.67 =C2=B1  =
3%  interrupts.CPU102.RES:Rescheduling_interrupts
      2981 =C2=B1  3%      +0.0%       2982 =C2=B1  3%      -2.1%       291=
9 =C2=B1  5%  interrupts.CPU102.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU103.152:PCI-MSI.23593064-edge.nvme0q104
      3670            -0.7%       3644            +7.6%       3949 =C2=B1 1=
6%  interrupts.CPU103.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +37.5%       1.83 =C2=B1 20%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU103.IWI:IRQ_work_interrupts
    564309 =C2=B1 16%      +7.3%     605464            +7.3%     605683    =
    interrupts.CPU103.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU103.MCP:Machine_check_polls
      5462 =C2=B1 35%     +37.4%       7506 =C2=B1 20%     +37.4%       750=
3 =C2=B1 20%  interrupts.CPU103.NMI:Non-maskable_interrupts
      5462 =C2=B1 35%     +37.4%       7506 =C2=B1 20%     +37.4%       750=
3 =C2=B1 20%  interrupts.CPU103.PMI:Performance_monitoring_interrupts
    308.17            +0.5%     309.67           +37.0%     422.17 =C2=B1 5=
9%  interrupts.CPU103.RES:Rescheduling_interrupts
      2813 =C2=B1  3%      -1.5%       2771            -0.1%       2812 =C2=
=B1  3%  interrupts.CPU103.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU104.149:PCI-MSI.23593065-edge.nvme0q105
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU104.169:PCI-MSI.23593065-edge.nvme0q105
      3779 =C2=B1  2%      -1.3%       3731            -2.0%       3705    =
    interrupts.CPU104.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +37.5%       1.83 =C2=B1 20%     +25.0%       1.6=
7 =C2=B1 28%  interrupts.CPU104.IWI:IRQ_work_interrupts
    564217 =C2=B1 16%      +7.3%     605472            +7.3%     605598    =
    interrupts.CPU104.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU104.MCP:Machine_check_polls
      5462 =C2=B1 35%     +37.4%       7505 =C2=B1 20%     +24.9%       682=
2 =C2=B1 28%  interrupts.CPU104.NMI:Non-maskable_interrupts
      5462 =C2=B1 35%     +37.4%       7505 =C2=B1 20%     +24.9%       682=
2 =C2=B1 28%  interrupts.CPU104.PMI:Performance_monitoring_interrupts
    318.17 =C2=B1  5%      -2.7%     309.50            -2.3%     310.83    =
    interrupts.CPU104.RES:Rescheduling_interrupts
      2985 =C2=B1  3%      +0.1%       2987 =C2=B1  3%      -2.9%       289=
8 =C2=B1  4%  interrupts.CPU104.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU105.151:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU105.166:PCI-MSI.23593066-edge.nvme0q106
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU105.170:PCI-MSI.23593066-edge.nvme0q106
      3671            +0.0%       3673            -1.1%       3629 =C2=B1  =
4%  interrupts.CPU105.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +37.5%       1.83 =C2=B1 20%     +25.0%       1.6=
7 =C2=B1 28%  interrupts.CPU105.IWI:IRQ_work_interrupts
    564285 =C2=B1 16%      +7.3%     605469            +7.3%     605644    =
    interrupts.CPU105.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU105.MCP:Machine_check_polls
      5461 =C2=B1 35%     +37.4%       7504 =C2=B1 20%     +24.9%       682=
1 =C2=B1 28%  interrupts.CPU105.NMI:Non-maskable_interrupts
      5461 =C2=B1 35%     +37.4%       7504 =C2=B1 20%     +24.9%       682=
1 =C2=B1 28%  interrupts.CPU105.PMI:Performance_monitoring_interrupts
    313.33 =C2=B1  2%      -1.1%     310.00            +1.1%     316.67    =
    interrupts.CPU105.RES:Rescheduling_interrupts
      2817 =C2=B1  3%      -0.0%       2816 =C2=B1  3%      +1.6%       286=
2 =C2=B1  4%  interrupts.CPU105.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU106.164:PCI-MSI.23593067-edge.nvme0q107
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU106.167:PCI-MSI.23593067-edge.nvme0q107
      3743            -0.5%       3724           +29.9%       4862 =C2=B1 5=
1%  interrupts.CPU106.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU106.IWI:IRQ_work_interrupts
    564141 =C2=B1 16%      +7.3%     605580            +7.4%     605649    =
    interrupts.CPU106.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU106.MCP:Machine_check_polls
      6146 =C2=B1 33%     +22.1%       7504 =C2=B1 20%     +22.1%       750=
4 =C2=B1 20%  interrupts.CPU106.NMI:Non-maskable_interrupts
      6146 =C2=B1 33%     +22.1%       7504 =C2=B1 20%     +22.1%       750=
4 =C2=B1 20%  interrupts.CPU106.PMI:Performance_monitoring_interrupts
    310.33            -0.3%     309.33           +97.8%     613.83 =C2=B111=
0%  interrupts.CPU106.RES:Rescheduling_interrupts
      2985 =C2=B1  3%      +0.3%       2993 =C2=B1  3%      +0.2%       299=
1 =C2=B1  3%  interrupts.CPU106.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.152:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.156:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.165:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.168:PCI-MSI.23593068-edge.nvme0q108
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU107.171:PCI-MSI.23593068-edge.nvme0q108
      3692            -0.4%       3676            +0.6%       3713        i=
nterrupts.CPU107.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU107.IWI:IRQ_work_interrupts
    563857 =C2=B1 16%      +7.4%     605485            +7.4%     605624    =
    interrupts.CPU107.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU107.MCP:Machine_check_polls
      6146 =C2=B1 33%     +22.1%       7505 =C2=B1 20%     +22.1%       750=
3 =C2=B1 20%  interrupts.CPU107.NMI:Non-maskable_interrupts
      6146 =C2=B1 33%     +22.1%       7505 =C2=B1 20%     +22.1%       750=
3 =C2=B1 20%  interrupts.CPU107.PMI:Performance_monitoring_interrupts
    313.33            -1.2%     309.67            +1.1%     316.67 =C2=B1  =
5%  interrupts.CPU107.RES:Rescheduling_interrupts
      2823 =C2=B1  3%      -0.0%       2822 =C2=B1  3%      +0.4%       283=
4 =C2=B1  3%  interrupts.CPU107.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU108.157:PCI-MSI.23593069-edge.nvme0q109
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU108.162:PCI-MSI.23593069-edge.nvme0q109
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU108.166:PCI-MSI.23593069-edge.nvme0q109
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU108.172:PCI-MSI.23593069-edge.nvme0q109
      3807 =C2=B1  4%      -2.0%       3730            -1.8%       3737 =C2=
=B1  2%  interrupts.CPU108.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +20.0%       2.0=
0        interrupts.CPU108.IWI:IRQ_work_interrupts
    563831 =C2=B1 16%      +7.4%     605497            +7.4%     605638    =
    interrupts.CPU108.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU108.MCP:Machine_check_polls
      6828 =C2=B1 28%      +9.9%       7505 =C2=B1 20%     +19.8%       818=
2        interrupts.CPU108.NMI:Non-maskable_interrupts
      6828 =C2=B1 28%      +9.9%       7505 =C2=B1 20%     +19.8%       818=
2        interrupts.CPU108.PMI:Performance_monitoring_interrupts
    343.17 =C2=B1 18%      -9.5%     310.50            -8.6%     313.67    =
    interrupts.CPU108.RES:Rescheduling_interrupts
      2957 =C2=B1  3%      +1.4%       2999 =C2=B1  3%      -1.0%       292=
8 =C2=B1  5%  interrupts.CPU108.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU109.158:PCI-MSI.23593070-edge.nvme0q110
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU109.177:PCI-MSI.23593070-edge.nvme0q110
      3698            -0.5%       3679            +0.2%       3704        i=
nterrupts.CPU109.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +20.0%       2.0=
0        interrupts.CPU109.IWI:IRQ_work_interrupts
    564314 =C2=B1 16%      +7.3%     605484            +7.3%     605643    =
    interrupts.CPU109.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU109.MCP:Machine_check_polls
      6828 =C2=B1 28%      +9.9%       7504 =C2=B1 20%     +19.8%       818=
2        interrupts.CPU109.NMI:Non-maskable_interrupts
      6828 =C2=B1 28%      +9.9%       7504 =C2=B1 20%     +19.8%       818=
2        interrupts.CPU109.PMI:Performance_monitoring_interrupts
    309.17            -0.2%     308.67            +0.5%     310.67        i=
nterrupts.CPU109.RES:Rescheduling_interrupts
      2831 =C2=B1  3%      -0.1%       2828 =C2=B1  3%      +0.0%       283=
2 =C2=B1  3%  interrupts.CPU109.TLB:TLB_shootdowns
      4028 =C2=B1122%     +82.8%       7365 =C2=B1 97%     -23.9%       306=
6 =C2=B1 70%  interrupts.CPU11.32:PCI-MSI.524290-edge.eth0-TxRx-1
      3757            -0.3%       3746            +1.5%       3813 =C2=B1  =
2%  interrupts.CPU11.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU11.IWI:IRQ_work_interrupts
    563990 =C2=B1 16%      +7.4%     605553            +7.4%     605716    =
    interrupts.CPU11.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU11.MCP:Machine_check_polls
      8191            -8.4%       7505 =C2=B1 20%      -8.4%       7503 =C2=
=B1 20%  interrupts.CPU11.NMI:Non-maskable_interrupts
      8191            -8.4%       7505 =C2=B1 20%      -8.4%       7503 =C2=
=B1 20%  interrupts.CPU11.PMI:Performance_monitoring_interrupts
    321.50 =C2=B1  4%      -2.0%     315.17 =C2=B1  2%      +8.3%     348.1=
7 =C2=B1 19%  interrupts.CPU11.RES:Rescheduling_interrupts
      2995 =C2=B1  3%      +0.1%       2997 =C2=B1  3%      +0.2%       300=
1 =C2=B1  3%  interrupts.CPU11.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU110.155:PCI-MSI.23593071-edge.nvme0q111
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU110.156:PCI-MSI.23593071-edge.nvme0q111
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU110.164:PCI-MSI.23593071-edge.nvme0q111
      3751            -0.0%       3751           +31.2%       4923 =C2=B1 5=
2%  interrupts.CPU110.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +20.0%       2.0=
0        interrupts.CPU110.IWI:IRQ_work_interrupts
    563338 =C2=B1 16%      +7.5%     605500            +7.5%     605673    =
    interrupts.CPU110.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU110.MCP:Machine_check_polls
      6829 =C2=B1 28%      +9.9%       7505 =C2=B1 20%     +19.8%       818=
1        interrupts.CPU110.NMI:Non-maskable_interrupts
      6829 =C2=B1 28%      +9.9%       7505 =C2=B1 20%     +19.8%       818=
1        interrupts.CPU110.PMI:Performance_monitoring_interrupts
    310.83            -0.9%     308.00           +60.1%     497.50 =C2=B1 8=
3%  interrupts.CPU110.RES:Rescheduling_interrupts
      3003 =C2=B1  3%      -0.0%       3003 =C2=B1  3%      +0.3%       301=
1 =C2=B1  3%  interrupts.CPU110.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU111.156:PCI-MSI.23593072-edge.nvme0q112
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU111.157:PCI-MSI.23593072-edge.nvme0q112
      3677            -0.4%       3663            +0.6%       3699        i=
nterrupts.CPU111.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +20.0%       2.0=
0        interrupts.CPU111.IWI:IRQ_work_interrupts
    564153 =C2=B1 16%      +7.3%     605515            +7.4%     605635    =
    interrupts.CPU111.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU111.MCP:Machine_check_polls
      6828 =C2=B1 28%      +9.9%       7504 =C2=B1 20%     +19.8%       818=
1        interrupts.CPU111.NMI:Non-maskable_interrupts
      6828 =C2=B1 28%      +9.9%       7504 =C2=B1 20%     +19.8%       818=
1        interrupts.CPU111.PMI:Performance_monitoring_interrupts
    309.17            +0.1%     309.33            +0.8%     311.50        i=
nterrupts.CPU111.RES:Rescheduling_interrupts
      2835 =C2=B1  3%      -0.4%       2825 =C2=B1  3%      +1.4%       287=
4 =C2=B1  4%  interrupts.CPU111.TLB:TLB_shootdowns
      3757            -1.3%       3709            -0.2%       3749        i=
nterrupts.CPU112.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +20.0%       2.00    =
    interrupts.CPU112.IWI:IRQ_work_interrupts
    563930 =C2=B1 16%      +7.4%     605613            +7.4%     605636    =
    interrupts.CPU112.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU112.MCP:Machine_check_polls
      6829 =C2=B1 28%     +19.9%       8189           +19.8%       8182    =
    interrupts.CPU112.NMI:Non-maskable_interrupts
      6829 =C2=B1 28%     +19.9%       8189           +19.8%       8182    =
    interrupts.CPU112.PMI:Performance_monitoring_interrupts
    309.17            +0.1%     309.33            +0.9%     312.00 =C2=B1  =
2%  interrupts.CPU112.RES:Rescheduling_interrupts
      3006 =C2=B1  3%      -2.7%       2925 =C2=B1  3%      +0.1%       301=
1 =C2=B1  3%  interrupts.CPU112.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU113.185:PCI-MSI.23593082-edge.nvme0q122
      3690            -1.3%       3644 =C2=B1  2%      +9.3%       4035 =C2=
=B1 15%  interrupts.CPU113.CAL:Function_call_interrupts
      1.83 =C2=B1 20%     +18.2%       2.17 =C2=B1 17%      +9.1%       2.0=
0        interrupts.CPU113.IWI:IRQ_work_interrupts
    563681 =C2=B1 16%      +7.4%     605417            +7.4%     605637    =
    interrupts.CPU113.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU113.MCP:Machine_check_polls
      7510 =C2=B1 20%      +9.0%       8187            +8.9%       8181    =
    interrupts.CPU113.NMI:Non-maskable_interrupts
      7510 =C2=B1 20%      +9.0%       8187            +8.9%       8181    =
    interrupts.CPU113.PMI:Performance_monitoring_interrupts
    309.67            +1.9%     315.50 =C2=B1  3%     +21.2%     375.17 =C2=
=B1 24%  interrupts.CPU113.RES:Rescheduling_interrupts
      2841 =C2=B1  3%      -1.7%       2793 =C2=B1  4%      -0.2%       283=
5 =C2=B1  3%  interrupts.CPU113.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU114.171:PCI-MSI.23593083-edge.nvme0q123
      3762           +30.3%       4901 =C2=B1 51%      +0.0%       3764    =
    interrupts.CPU114.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU114.IWI:IRQ_work_interrupts
    563909 =C2=B1 16%      +7.4%     605481            +7.4%     605635    =
    interrupts.CPU114.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU114.MCP:Machine_check_polls
      7510 =C2=B1 20%      +9.1%       8190            +8.9%       8181    =
    interrupts.CPU114.NMI:Non-maskable_interrupts
      7510 =C2=B1 20%      +9.1%       8190            +8.9%       8181    =
    interrupts.CPU114.PMI:Performance_monitoring_interrupts
    310.33           +57.7%     489.50 =C2=B1 82%      -0.4%     309.17    =
    interrupts.CPU114.RES:Rescheduling_interrupts
      3013 =C2=B1  3%      -0.2%       3007 =C2=B1  3%      +0.0%       301=
4 =C2=B1  3%  interrupts.CPU114.TLB:TLB_shootdowns
      3702            +0.3%       3712           +45.5%       5386 =C2=B1 6=
8%  interrupts.CPU115.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU115.IWI:IRQ_work_interrupts
    563982 =C2=B1 16%      +7.4%     605484            +7.4%     605630    =
    interrupts.CPU115.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU115.MCP:Machine_check_polls
      7510 =C2=B1 20%      +9.0%       8189            +8.9%       8180    =
    interrupts.CPU115.NMI:Non-maskable_interrupts
      7510 =C2=B1 20%      +9.0%       8189            +8.9%       8180    =
    interrupts.CPU115.PMI:Performance_monitoring_interrupts
    309.83            -0.2%     309.33           +84.0%     570.17 =C2=B110=
1%  interrupts.CPU115.RES:Rescheduling_interrupts
      2846 =C2=B1  3%      +1.5%       2888 =C2=B1  4%      +1.3%       288=
4 =C2=B1  4%  interrupts.CPU115.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU116.173:PCI-MSI.23593085-edge.nvme0q125
      3754            +0.1%       3758            +3.1%       3872 =C2=B1  =
7%  interrupts.CPU116.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU116.IWI:IRQ_work_interrupts
    563938 =C2=B1 16%      +7.4%     605479            +7.4%     605667    =
    interrupts.CPU116.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU116.MCP:Machine_check_polls
      7509 =C2=B1 20%      +9.0%       8188            +9.0%       8182    =
    interrupts.CPU116.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      +9.0%       8188            +9.0%       8182    =
    interrupts.CPU116.PMI:Performance_monitoring_interrupts
    309.00            -0.1%     308.67           +15.2%     356.00 =C2=B1 2=
9%  interrupts.CPU116.RES:Rescheduling_interrupts
      3018 =C2=B1  3%      -0.0%       3018 =C2=B1  3%      +0.2%       302=
5 =C2=B1  3%  interrupts.CPU116.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU117.183:PCI-MSI.23593086-edge.nvme0q126
      3711            -1.0%       3672            +0.1%       3715        i=
nterrupts.CPU117.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU117.IWI:IRQ_work_interrupts
    564015 =C2=B1 16%      +7.3%     605467            +7.4%     605634    =
    interrupts.CPU117.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU117.MCP:Machine_check_polls
      7510 =C2=B1 20%      +9.0%       8189            +9.0%       8183    =
    interrupts.CPU117.NMI:Non-maskable_interrupts
      7510 =C2=B1 20%      +9.0%       8189            +9.0%       8183    =
    interrupts.CPU117.PMI:Performance_monitoring_interrupts
    308.67            +0.0%     308.67            -0.1%     308.33        i=
nterrupts.CPU117.RES:Rescheduling_interrupts
      2848 =C2=B1  3%      -1.3%       2812            +0.5%       2863 =C2=
=B1  3%  interrupts.CPU117.TLB:TLB_shootdowns
      3769            -0.2%       3761            +0.4%       3784        i=
nterrupts.CPU118.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU118.IWI:IRQ_work_interrupts
    563925 =C2=B1 16%      +7.4%     605482            +7.4%     605669    =
    interrupts.CPU118.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU118.MCP:Machine_check_polls
      7509 =C2=B1 20%      +9.1%       8189            -0.1%       7500 =C2=
=B1 20%  interrupts.CPU118.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      +9.1%       8189            -0.1%       7500 =C2=
=B1 20%  interrupts.CPU118.PMI:Performance_monitoring_interrupts
    330.00 =C2=B1 13%      -6.5%     308.67            -2.9%     320.33 =C2=
=B1  5%  interrupts.CPU118.RES:Rescheduling_interrupts
      3024 =C2=B1  3%      -0.1%       3022 =C2=B1  3%      -0.0%       302=
3 =C2=B1  3%  interrupts.CPU118.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU119.173:PCI-MSI.23593088-edge.nvme0q128
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU119.185:PCI-MSI.23593088-edge.nvme0q128
      3721 =C2=B1  2%      -0.7%       3694            -0.2%       3713    =
    interrupts.CPU119.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +33.3%       2.00           +22.2%       1.83 =C2=
=B1 20%  interrupts.CPU119.IWI:IRQ_work_interrupts
    563686 =C2=B1 16%      +7.4%     605467            +7.4%     605636    =
    interrupts.CPU119.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU119.MCP:Machine_check_polls
      6142 =C2=B1 33%     +33.3%       8189           +22.1%       7499 =C2=
=B1 20%  interrupts.CPU119.NMI:Non-maskable_interrupts
      6142 =C2=B1 33%     +33.3%       8189           +22.1%       7499 =C2=
=B1 20%  interrupts.CPU119.PMI:Performance_monitoring_interrupts
    309.83            -0.2%     309.17            +0.3%     310.67        i=
nterrupts.CPU119.RES:Rescheduling_interrupts
      2900 =C2=B1  4%      -1.7%       2850 =C2=B1  3%      -1.4%       286=
0 =C2=B1  3%  interrupts.CPU119.TLB:TLB_shootdowns
      3204 =C2=B1120%    +267.6%      11781 =C2=B1189%     +76.6%       565=
9 =C2=B1113%  interrupts.CPU12.33:PCI-MSI.524291-edge.eth0-TxRx-2
      3711            -0.4%       3697            +0.8%       3740        i=
nterrupts.CPU12.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%     -16.7%       1.67 =C2=
=B1 28%  interrupts.CPU12.IWI:IRQ_work_interrupts
    563815 =C2=B1 16%      +7.4%     605538            +7.4%     605780    =
    interrupts.CPU12.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU12.MCP:Machine_check_polls
      8191            -8.4%       7504 =C2=B1 20%     -16.7%       6825 =C2=
=B1 28%  interrupts.CPU12.NMI:Non-maskable_interrupts
      8191            -8.4%       7504 =C2=B1 20%     -16.7%       6825 =C2=
=B1 28%  interrupts.CPU12.PMI:Performance_monitoring_interrupts
    325.83 =C2=B1  5%      +3.6%     337.67 =C2=B1  9%      +4.7%     341.0=
0 =C2=B1 10%  interrupts.CPU12.RES:Rescheduling_interrupts
      2868 =C2=B1  4%      -1.7%       2818 =C2=B1  3%      +2.0%       292=
4 =C2=B1  3%  interrupts.CPU12.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU120.58:PCI-MSI.23592961-edge.nvme0q1
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU120.65:PCI-MSI.23592961-edge.nvme0q1
     16168 =C2=B1 17%     -26.0%      11962 =C2=B1 19%     +20.9%      1954=
8 =C2=B1 21%  interrupts.CPU120.CAL:Function_call_interrupts
      3.00 =C2=B1 27%      +0.0%       3.00            +0.0%       3.00 =C2=
=B1 19%  interrupts.CPU120.IWI:IRQ_work_interrupts
    565221 =C2=B1 16%      +7.2%     605705            +7.1%     605605    =
    interrupts.CPU120.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU120.MCP:Machine_check_polls
      6805 =C2=B1 28%     +20.0%       8169            +9.9%       7478 =C2=
=B1 20%  interrupts.CPU120.NMI:Non-maskable_interrupts
      6805 =C2=B1 28%     +20.0%       8169            +9.9%       7478 =C2=
=B1 20%  interrupts.CPU120.PMI:Performance_monitoring_interrupts
    353.50 =C2=B1  4%     +21.1%     428.17 =C2=B1 39%      -3.6%     340.8=
3 =C2=B1  4%  interrupts.CPU120.RES:Rescheduling_interrupts
      3054            -5.9%       2874 =C2=B1  3%      -9.1%       2775 =C2=
=B1  2%  interrupts.CPU120.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU121.52:PCI-MSI.23592962-edge.nvme0q2
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU121.69:PCI-MSI.23592962-edge.nvme0q2
      5515 =C2=B1 13%     +30.1%       7175 =C2=B1 28%      -8.7%       503=
4 =C2=B1  8%  interrupts.CPU121.CAL:Function_call_interrupts
      2.00           +25.0%       2.50 =C2=B1 20%      +8.3%       2.17 =C2=
=B1 17%  interrupts.CPU121.IWI:IRQ_work_interrupts
    565541 =C2=B1 15%      +7.1%     605605            +7.1%     605564    =
    interrupts.CPU121.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU121.MCP:Machine_check_polls
      6810 =C2=B1 28%     -10.1%       6123 =C2=B1 33%      +9.7%       747=
3 =C2=B1 20%  interrupts.CPU121.NMI:Non-maskable_interrupts
      6810 =C2=B1 28%     -10.1%       6123 =C2=B1 33%      +9.7%       747=
3 =C2=B1 20%  interrupts.CPU121.PMI:Performance_monitoring_interrupts
    432.33 =C2=B1  5%      -1.2%     427.17 =C2=B1 23%      -4.6%     412.5=
0 =C2=B1 12%  interrupts.CPU121.RES:Rescheduling_interrupts
      2893 =C2=B1  4%      -1.3%       2855 =C2=B1  3%      +3.5%       299=
4 =C2=B1  4%  interrupts.CPU121.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU122.63:PCI-MSI.23592963-edge.nvme0q3
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU122.70:PCI-MSI.23592963-edge.nvme0q3
      5263 =C2=B1 17%     -23.2%       4043 =C2=B1  5%      -5.5%       497=
5 =C2=B1 31%  interrupts.CPU122.CAL:Function_call_interrupts
      1.67 =C2=B1 28%      +0.0%       1.67 =C2=B1 28%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU122.IWI:IRQ_work_interrupts
    565642 =C2=B1 15%      +7.0%     605516            +7.0%     605458    =
    interrupts.CPU122.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU122.MCP:Machine_check_polls
      6810 =C2=B1 28%      -0.1%       6806 =C2=B1 28%      +9.7%       747=
4 =C2=B1 20%  interrupts.CPU122.NMI:Non-maskable_interrupts
      6810 =C2=B1 28%      -0.1%       6806 =C2=B1 28%      +9.7%       747=
4 =C2=B1 20%  interrupts.CPU122.PMI:Performance_monitoring_interrupts
    461.50 =C2=B1 19%     -10.2%     414.33 =C2=B1 23%     -10.2%     414.3=
3 =C2=B1 24%  interrupts.CPU122.RES:Rescheduling_interrupts
      2992 =C2=B1  3%      -0.4%       2980 =C2=B1  4%      -2.9%       290=
4 =C2=B1  5%  interrupts.CPU122.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU123.66:PCI-MSI.23592964-edge.nvme0q4
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU123.71:PCI-MSI.23592964-edge.nvme0q4
      3767 =C2=B1  2%      +5.2%       3962 =C2=B1 10%      +1.2%       381=
2 =C2=B1  5%  interrupts.CPU123.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU123.IWI:IRQ_work_interrupts
    565079 =C2=B1 16%      +7.1%     605413            +7.1%     605426    =
    interrupts.CPU123.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU123.MCP:Machine_check_polls
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.1%       815=
5        interrupts.CPU123.NMI:Non-maskable_interrupts
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.1%       815=
5        interrupts.CPU123.PMI:Performance_monitoring_interrupts
    321.33 =C2=B1  8%    +192.0%     938.17 =C2=B1140%      +3.1%     331.1=
7 =C2=B1 16%  interrupts.CPU123.RES:Rescheduling_interrupts
      2903 =C2=B1  4%      -0.5%       2888 =C2=B1  3%      +1.8%       295=
5 =C2=B1  4%  interrupts.CPU123.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU124.57:PCI-MSI.23592965-edge.nvme0q5
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU124.65:PCI-MSI.23592965-edge.nvme0q5
      3780            -0.3%       3769            -0.6%       3756        i=
nterrupts.CPU124.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU124.IWI:IRQ_work_interrupts
    565392 =C2=B1 15%      +7.1%     605483            +7.1%     605434    =
    interrupts.CPU124.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU124.MCP:Machine_check_polls
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.1%       815=
5        interrupts.CPU124.NMI:Non-maskable_interrupts
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.1%       815=
5        interrupts.CPU124.PMI:Performance_monitoring_interrupts
    323.17 =C2=B1  9%      -4.8%     307.67            -5.0%     307.00    =
    interrupts.CPU124.RES:Rescheduling_interrupts
      2994 =C2=B1  3%      +1.3%       3034 =C2=B1  3%      -1.1%       296=
0 =C2=B1  4%  interrupts.CPU124.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU125.66:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU125.70:PCI-MSI.23592966-edge.nvme0q6
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU125.73:PCI-MSI.23592966-edge.nvme0q6
      3739            -0.4%       3725            +0.6%       3760        i=
nterrupts.CPU125.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU125.IWI:IRQ_work_interrupts
    565599 =C2=B1 15%      +7.1%     605482            +7.0%     605432    =
    interrupts.CPU125.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU125.MCP:Machine_check_polls
      6127 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.1%       815=
5        interrupts.CPU125.NMI:Non-maskable_interrupts
      6127 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.1%       815=
5        interrupts.CPU125.PMI:Performance_monitoring_interrupts
    357.33 =C2=B1 31%     -13.0%     311.00 =C2=B1  3%     -13.7%     308.5=
0        interrupts.CPU125.RES:Rescheduling_interrupts
      2918 =C2=B1  4%      -0.4%       2907 =C2=B1  3%      +1.7%       296=
6 =C2=B1  3%  interrupts.CPU125.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU126.51:PCI-MSI.23592967-edge.nvme0q7
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU126.67:PCI-MSI.23592967-edge.nvme0q7
      3841 =C2=B1  4%      -1.7%       3776            -1.5%       3782 =C2=
=B1  2%  interrupts.CPU126.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU126.IWI:IRQ_work_interrupts
    565421 =C2=B1 15%      +7.1%     605482            +7.1%     605435    =
    interrupts.CPU126.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU126.MCP:Machine_check_polls
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.1%       815=
5        interrupts.CPU126.NMI:Non-maskable_interrupts
      6128 =C2=B1 33%     +22.2%       7490 =C2=B1 20%     +33.1%       815=
5        interrupts.CPU126.PMI:Performance_monitoring_interrupts
    334.00 =C2=B1 16%      -7.9%     307.67            -7.4%     309.17    =
    interrupts.CPU126.RES:Rescheduling_interrupts
      2995 =C2=B1  3%      +1.7%       3044 =C2=B1  3%      -1.2%       296=
0 =C2=B1  5%  interrupts.CPU126.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU127.52:PCI-MSI.23592968-edge.nvme0q8
      3779            -2.5%       3684            -0.4%       3764        i=
nterrupts.CPU127.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +33.3%       2.0=
0        interrupts.CPU127.IWI:IRQ_work_interrupts
    565887 =C2=B1 15%      +7.0%     605443            +7.0%     605412    =
    interrupts.CPU127.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU127.MCP:Machine_check_polls
      6129 =C2=B1 33%     +22.2%       7488 =C2=B1 20%     +33.0%       815=
4        interrupts.CPU127.NMI:Non-maskable_interrupts
      6129 =C2=B1 33%     +22.2%       7488 =C2=B1 20%     +33.0%       815=
4        interrupts.CPU127.PMI:Performance_monitoring_interrupts
    328.17 =C2=B1 10%      -6.3%     307.50            -6.5%     306.83    =
    interrupts.CPU127.RES:Rescheduling_interrupts
      2923 =C2=B1  4%      -2.1%       2861 =C2=B1  3%      +3.1%       301=
2 =C2=B1  3%  interrupts.CPU127.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU128.53:PCI-MSI.23592969-edge.nvme0q9
      3733           +32.3%       4939 =C2=B1 51%      +0.6%       3756    =
    interrupts.CPU128.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU128.IWI:IRQ_work_interrupts
    565919 =C2=B1 15%      +7.0%     605476            +7.0%     605441    =
    interrupts.CPU128.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU128.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7490 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU128.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7490 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU128.PMI:Performance_monitoring_interrupts
    308.83           +59.5%     492.67 =C2=B1 83%      +2.2%     315.67 =C2=
=B1  6%  interrupts.CPU128.RES:Rescheduling_interrupts
      2959 =C2=B1  3%      +2.9%       3046 =C2=B1  3%      +0.3%       296=
7 =C2=B1  4%  interrupts.CPU128.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU129.54:PCI-MSI.23592970-edge.nvme0q10
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU129.62:PCI-MSI.23592970-edge.nvme0q10
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU129.70:PCI-MSI.23592970-edge.nvme0q10
      3737            +5.3%       3936 =C2=B1 13%      +0.7%       3764    =
    interrupts.CPU129.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU129.IWI:IRQ_work_interrupts
    566075 =C2=B1 15%      +7.0%     605471            +7.0%     605431    =
    interrupts.CPU129.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU129.MCP:Machine_check_polls
      7486 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +8.9%       815=
4        interrupts.CPU129.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +8.9%       815=
4        interrupts.CPU129.PMI:Performance_monitoring_interrupts
    307.67           +23.7%     380.50 =C2=B1 43%      +0.0%     307.67    =
    interrupts.CPU129.RES:Rescheduling_interrupts
      2921 =C2=B1  4%      -0.0%       2920 =C2=B1  3%      +3.1%       301=
2 =C2=B1  3%  interrupts.CPU129.TLB:TLB_shootdowns
      1467 =C2=B1 96%    +374.0%       6955 =C2=B1131%     -19.5%       118=
1 =C2=B1 67%  interrupts.CPU13.34:PCI-MSI.524292-edge.eth0-TxRx-3
      3751            +0.5%       3770            +2.2%       3833 =C2=B1  =
4%  interrupts.CPU13.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      -9.1%       1.6=
7 =C2=B1 28%  interrupts.CPU13.IWI:IRQ_work_interrupts
    564009 =C2=B1 16%      +7.4%     605581            +7.4%     605680    =
    interrupts.CPU13.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU13.MCP:Machine_check_polls
      7507 =C2=B1 20%      -0.0%       7504 =C2=B1 20%      -9.1%       682=
5 =C2=B1 28%  interrupts.CPU13.NMI:Non-maskable_interrupts
      7507 =C2=B1 20%      -0.0%       7504 =C2=B1 20%      -9.1%       682=
5 =C2=B1 28%  interrupts.CPU13.PMI:Performance_monitoring_interrupts
    339.00 =C2=B1  9%      -3.8%     326.00 =C2=B1  4%      +6.6%     361.5=
0 =C2=B1 23%  interrupts.CPU13.RES:Rescheduling_interrupts
      2999 =C2=B1  3%      +0.1%       3002 =C2=B1  3%      +0.3%       300=
9 =C2=B1  3%  interrupts.CPU13.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU130.78:PCI-MSI.23592971-edge.nvme0q11
      3767            -0.0%       3766            -0.3%       3756        i=
nterrupts.CPU130.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU130.IWI:IRQ_work_interrupts
    565655 =C2=B1 15%      +7.0%     605453            +7.0%     605442    =
    interrupts.CPU130.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU130.MCP:Machine_check_polls
      7486 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +8.9%       815=
6        interrupts.CPU130.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +8.9%       815=
6        interrupts.CPU130.PMI:Performance_monitoring_interrupts
    310.00            -0.9%     307.33            -0.6%     308.17        i=
nterrupts.CPU130.RES:Rescheduling_interrupts
      3010 =C2=B1  3%      +2.3%       3081            -1.2%       2975 =C2=
=B1  4%  interrupts.CPU130.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU131.76:PCI-MSI.23592972-edge.nvme0q12
      3732 =C2=B1  2%      -1.0%       3695            +0.2%       3738    =
    interrupts.CPU131.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU131.IWI:IRQ_work_interrupts
    565142 =C2=B1 16%      +7.1%     605528            +7.1%     605437    =
    interrupts.CPU131.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU131.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +8.9%       815=
6        interrupts.CPU131.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +8.9%       815=
6        interrupts.CPU131.PMI:Performance_monitoring_interrupts
    306.83            +0.2%     307.33            -0.2%     306.17        i=
nterrupts.CPU131.RES:Rescheduling_interrupts
      2930 =C2=B1  4%      -1.2%       2896 =C2=B1  3%      +1.6%       297=
7 =C2=B1  3%  interrupts.CPU131.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU132.77:PCI-MSI.23592973-edge.nvme0q13
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU132.80:PCI-MSI.23592973-edge.nvme0q13
      3767            +0.6%       3788            -0.2%       3761        i=
nterrupts.CPU132.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU132.IWI:IRQ_work_interrupts
    565521 =C2=B1 15%      +7.1%     605474            +7.1%     605446    =
    interrupts.CPU132.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU132.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +8.9%       815=
6        interrupts.CPU132.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +8.9%       815=
6        interrupts.CPU132.PMI:Performance_monitoring_interrupts
    308.00           +48.6%     457.83 =C2=B1 73%      +0.3%     309.00    =
    interrupts.CPU132.RES:Rescheduling_interrupts
      3014 =C2=B1  3%      +1.3%       3054 =C2=B1  3%      -1.4%       297=
4 =C2=B1  4%  interrupts.CPU132.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU133.62:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU133.71:PCI-MSI.23592974-edge.nvme0q14
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU133.78:PCI-MSI.23592974-edge.nvme0q14
      3726 =C2=B1  2%      -1.1%       3685            +0.6%       3749    =
    interrupts.CPU133.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU133.IWI:IRQ_work_interrupts
    565963 =C2=B1 15%      +7.0%     605524            +7.0%     605436    =
    interrupts.CPU133.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU133.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU133.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7488 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU133.PMI:Performance_monitoring_interrupts
    308.50            -0.5%     307.00            -0.7%     306.33        i=
nterrupts.CPU133.RES:Rescheduling_interrupts
      2933 =C2=B1  4%      -1.2%       2897 =C2=B1  3%      +1.8%       298=
5 =C2=B1  3%  interrupts.CPU133.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU134.75:PCI-MSI.23592975-edge.nvme0q15
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU134.79:PCI-MSI.23592975-edge.nvme0q15
      3763            +0.2%       3770            -0.6%       3741        i=
nterrupts.CPU134.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00 =C2=B1 28%     +20.0%       2.0=
0        interrupts.CPU134.IWI:IRQ_work_interrupts
    565957 =C2=B1 15%      +7.0%     605477            +7.0%     605430    =
    interrupts.CPU134.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU134.MCP:Machine_check_polls
      6806 =C2=B1 28%     +10.0%       7489 =C2=B1 20%     +19.8%       815=
5        interrupts.CPU134.NMI:Non-maskable_interrupts
      6806 =C2=B1 28%     +10.0%       7489 =C2=B1 20%     +19.8%       815=
5        interrupts.CPU134.PMI:Performance_monitoring_interrupts
    307.33            -0.1%     307.17            +0.2%     308.00        i=
nterrupts.CPU134.RES:Rescheduling_interrupts
      3021 =C2=B1  3%      +2.7%       3101            -2.6%       2942 =C2=
=B1  4%  interrupts.CPU134.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU135.66:PCI-MSI.23592976-edge.nvme0q16
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU135.76:PCI-MSI.23592976-edge.nvme0q16
      4166 =C2=B1 18%     -10.9%       3710            -9.4%       3773    =
    interrupts.CPU135.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +20.0%       2.0=
0        interrupts.CPU135.IWI:IRQ_work_interrupts
    565770 =C2=B1 15%      +7.0%     605478            +7.0%     605430    =
    interrupts.CPU135.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU135.MCP:Machine_check_polls
      6805 =C2=B1 28%     +10.0%       7489 =C2=B1 20%     +19.8%       815=
4        interrupts.CPU135.NMI:Non-maskable_interrupts
      6805 =C2=B1 28%     +10.0%       7489 =C2=B1 20%     +19.8%       815=
4        interrupts.CPU135.PMI:Performance_monitoring_interrupts
    383.83 =C2=B1 31%     -19.7%     308.33           -19.9%     307.33    =
    interrupts.CPU135.RES:Rescheduling_interrupts
      2947 =C2=B1  4%      -1.5%       2904 =C2=B1  3%      +2.7%       302=
7 =C2=B1  2%  interrupts.CPU135.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU136.75:PCI-MSI.23592985-edge.nvme0q25
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU136.85:PCI-MSI.23592985-edge.nvme0q25
      3767            +0.2%       3773            -0.7%       3739        i=
nterrupts.CPU136.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU136.IWI:IRQ_work_interrupts
    564999 =C2=B1 16%      +7.2%     605484            +7.2%     605431    =
    interrupts.CPU136.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU136.MCP:Machine_check_polls
      7488 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU136.NMI:Non-maskable_interrupts
      7488 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU136.PMI:Performance_monitoring_interrupts
    307.50            -0.1%     307.17            -0.4%     306.17        i=
nterrupts.CPU136.RES:Rescheduling_interrupts
      2988 =C2=B1  3%      +2.3%       3056 =C2=B1  3%      -1.6%       294=
1 =C2=B1  4%  interrupts.CPU136.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU137.76:PCI-MSI.23592986-edge.nvme0q26
      3729 =C2=B1  2%      -0.6%       3706            +0.5%       3748    =
    interrupts.CPU137.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU137.IWI:IRQ_work_interrupts
    565639 =C2=B1 15%      +7.0%     605500            +7.0%     605431    =
    interrupts.CPU137.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU137.MCP:Machine_check_polls
      7487 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU137.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +0.0%       7489 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU137.PMI:Performance_monitoring_interrupts
    307.00            +0.0%     307.00            +0.1%     307.17        i=
nterrupts.CPU137.RES:Rescheduling_interrupts
      2945 =C2=B1  4%      -1.2%       2911 =C2=B1  3%      +0.2%       295=
2 =C2=B1  3%  interrupts.CPU137.TLB:TLB_shootdowns
      3764            +2.9%       3874 =C2=B1  5%      -0.1%       3762    =
    interrupts.CPU138.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU138.IWI:IRQ_work_interrupts
    565627 =C2=B1 15%      +7.0%     605456            +7.0%     605431    =
    interrupts.CPU138.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU138.MCP:Machine_check_polls
      7487 =C2=B1 20%      +9.1%       8171            +8.9%       8156    =
    interrupts.CPU138.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +9.1%       8171            +8.9%       8156    =
    interrupts.CPU138.PMI:Performance_monitoring_interrupts
    306.33           +12.0%     343.00 =C2=B1 17%      -0.1%     306.17    =
    interrupts.CPU138.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      -0.2%       3023 =C2=B1  4%      -1.3%       299=
1 =C2=B1  4%  interrupts.CPU138.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU139.85:PCI-MSI.23592988-edge.nvme0q28
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU139.90:PCI-MSI.23592988-edge.nvme0q28
      5533 =C2=B1 48%     -33.0%       3708           -32.1%       3755    =
    interrupts.CPU139.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU139.IWI:IRQ_work_interrupts
    565724 =C2=B1 15%      +7.0%     605492            +7.0%     605431    =
    interrupts.CPU139.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU139.MCP:Machine_check_polls
      7486 =C2=B1 20%      +0.0%       7490 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU139.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +0.0%       7490 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU139.PMI:Performance_monitoring_interrupts
    566.67 =C2=B1 72%     -45.7%     307.83           -45.8%     307.00    =
    interrupts.CPU139.RES:Rescheduling_interrupts
      2956 =C2=B1  4%      -1.3%       2918 =C2=B1  3%      +1.4%       299=
6 =C2=B1  3%  interrupts.CPU139.TLB:TLB_shootdowns
      0.00       +1.7e+101%       0.17 =C2=B1223%    -100.0%       0.00    =
    interrupts.CPU14.4:IO-APIC.4-edge.ttyS0
      3690            -0.2%       3682            +0.3%       3703        i=
nterrupts.CPU14.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      -9.1%       1.6=
7 =C2=B1 28%  interrupts.CPU14.IWI:IRQ_work_interrupts
    564000 =C2=B1 16%      +7.4%     605504            +7.4%     605785    =
    interrupts.CPU14.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU14.MCP:Machine_check_polls
      7507 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      -9.1%       682=
5 =C2=B1 28%  interrupts.CPU14.NMI:Non-maskable_interrupts
      7507 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      -9.1%       682=
5 =C2=B1 28%  interrupts.CPU14.PMI:Performance_monitoring_interrupts
    310.33            -0.3%     309.50            +0.1%     310.67        i=
nterrupts.CPU14.RES:Rescheduling_interrupts
      2836 =C2=B1  3%      -0.3%       2828 =C2=B1  3%      +0.0%       283=
6 =C2=B1  3%  interrupts.CPU14.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU140.86:PCI-MSI.23592989-edge.nvme0q29
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU140.89:PCI-MSI.23592989-edge.nvme0q29
      3783            -0.4%       3769 =C2=B1  2%      -0.6%       3761    =
    interrupts.CPU140.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU140.IWI:IRQ_work_interrupts
    565962 =C2=B1 15%      +7.0%     605477            +7.0%     605427    =
    interrupts.CPU140.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU140.MCP:Machine_check_polls
      7485 =C2=B1 20%      +0.1%       7490 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU140.NMI:Non-maskable_interrupts
      7485 =C2=B1 20%      +0.1%       7490 =C2=B1 20%      +8.9%       815=
5        interrupts.CPU140.PMI:Performance_monitoring_interrupts
    320.50 =C2=B1  9%      -4.0%     307.83            -4.4%     306.33    =
    interrupts.CPU140.RES:Rescheduling_interrupts
      3072 =C2=B1  2%      +0.2%       3077 =C2=B1  3%      -2.3%       300=
1 =C2=B1  4%  interrupts.CPU140.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU141.78:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU141.87:PCI-MSI.23592990-edge.nvme0q30
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU141.94:PCI-MSI.23592990-edge.nvme0q30
      3772 =C2=B1  2%      -1.6%       3713            -0.5%       3754    =
    interrupts.CPU141.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU141.IWI:IRQ_work_interrupts
    565607 =C2=B1 15%      +7.1%     605485            +7.0%     605396    =
    interrupts.CPU141.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU141.MCP:Machine_check_polls
      7486 =C2=B1 20%      +9.1%       8170            +8.9%       8154    =
    interrupts.CPU141.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +9.1%       8170            +8.9%       8154    =
    interrupts.CPU141.PMI:Performance_monitoring_interrupts
    312.67 =C2=B1  3%      -2.0%     306.50            +0.5%     314.33 =C2=
=B1  4%  interrupts.CPU141.RES:Rescheduling_interrupts
      2956 =C2=B1  4%      -1.5%       2911 =C2=B1  2%      +1.3%       299=
5 =C2=B1  3%  interrupts.CPU141.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU142.88:PCI-MSI.23592991-edge.nvme0q31
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU142.95:PCI-MSI.23592991-edge.nvme0q31
      3775            -0.1%       3770 =C2=B1  2%      +0.5%       3794    =
    interrupts.CPU142.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU142.IWI:IRQ_work_interrupts
    565806 =C2=B1 15%      +7.0%     605479            +7.0%     605431    =
    interrupts.CPU142.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU142.MCP:Machine_check_polls
      8168            -8.3%       7489 =C2=B1 20%      -8.5%       7474 =C2=
=B1 20%  interrupts.CPU142.NMI:Non-maskable_interrupts
      8168            -8.3%       7489 =C2=B1 20%      -8.5%       7474 =C2=
=B1 20%  interrupts.CPU142.PMI:Performance_monitoring_interrupts
    307.83            -0.2%     307.33            -0.4%     306.67        i=
nterrupts.CPU142.RES:Rescheduling_interrupts
      3032 =C2=B1  3%      +1.5%       3079 =C2=B1  3%      +0.5%       304=
8 =C2=B1  4%  interrupts.CPU142.TLB:TLB_shootdowns
      3755 =C2=B1  2%      +3.9%       3900 =C2=B1 10%      -0.1%       375=
1 =C2=B1  2%  interrupts.CPU143.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU143.IWI:IRQ_work_interrupts
    565474 =C2=B1 15%      +7.1%     605472            +7.1%     605418    =
    interrupts.CPU143.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU143.MCP:Machine_check_polls
      8168            -8.3%       7488 =C2=B1 20%      -8.5%       7472 =C2=
=B1 20%  interrupts.CPU143.NMI:Non-maskable_interrupts
      8168            -8.3%       7488 =C2=B1 20%      -8.5%       7472 =C2=
=B1 20%  interrupts.CPU143.PMI:Performance_monitoring_interrupts
    308.50           +19.2%     367.67 =C2=B1 37%      +6.9%     329.83 =C2=
=B1 13%  interrupts.CPU143.RES:Rescheduling_interrupts
      2926 =C2=B1  3%      +1.1%       2957 =C2=B1  3%      +4.1%       304=
7 =C2=B1  2%  interrupts.CPU143.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU144.86:PCI-MSI.23592993-edge.nvme0q33
     16188 =C2=B1 19%      +2.0%      16511 =C2=B1 26%     -11.8%      1428=
0 =C2=B1 25%  interrupts.CPU144.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +5.6%       3.17 =C2=
=B1 11%  interrupts.CPU144.IWI:IRQ_work_interrupts
    565758 =C2=B1 15%      +7.1%     605820            +7.1%     605763    =
    interrupts.CPU144.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU144.MCP:Machine_check_polls
      8534            -8.4%       7818 =C2=B1 20%      -0.1%       8523    =
    interrupts.CPU144.NMI:Non-maskable_interrupts
      8534            -8.4%       7818 =C2=B1 20%      -0.1%       8523    =
    interrupts.CPU144.PMI:Performance_monitoring_interrupts
    395.83 =C2=B1 33%     -17.4%     327.00 =C2=B1  3%      -9.9%     356.6=
7 =C2=B1 16%  interrupts.CPU144.RES:Rescheduling_interrupts
      3034 =C2=B1  4%      -0.3%       3024 =C2=B1  4%      -1.1%       300=
1 =C2=B1  4%  interrupts.CPU144.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU145.94:PCI-MSI.23592994-edge.nvme0q34
      6130 =C2=B1 18%      -3.4%       5923 =C2=B1 16%      +2.8%       630=
3 =C2=B1 22%  interrupts.CPU145.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU145.IWI:IRQ_work_interrupts
    565679 =C2=B1 15%      +7.1%     605680            +7.1%     605619    =
    interrupts.CPU145.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU145.MCP:Machine_check_polls
      8536            -8.4%       7820 =C2=B1 20%      -0.1%       8526    =
    interrupts.CPU145.NMI:Non-maskable_interrupts
      8536            -8.4%       7820 =C2=B1 20%      -0.1%       8526    =
    interrupts.CPU145.PMI:Performance_monitoring_interrupts
    408.00 =C2=B1  9%      -0.9%     404.50 =C2=B1 11%     +19.5%     487.5=
0 =C2=B1 27%  interrupts.CPU145.RES:Rescheduling_interrupts
      3071 =C2=B1  3%      -4.5%       2932 =C2=B1  3%      +0.2%       307=
8 =C2=B1  3%  interrupts.CPU145.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU146.80:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU146.85:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU146.95:PCI-MSI.23592995-edge.nvme0q35
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU146.98:PCI-MSI.23592995-edge.nvme0q35
      4955 =C2=B1 21%      -4.5%       4731 =C2=B1 21%     +32.2%       655=
1 =C2=B1 38%  interrupts.CPU146.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +0.0%       2.83 =C2=B1 13%      +5.9%       3.0=
0        interrupts.CPU146.IWI:IRQ_work_interrupts
    566071 =C2=B1 15%      +7.0%     605570            +7.0%     605431    =
    interrupts.CPU146.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU146.MCP:Machine_check_polls
      7829 =C2=B1 20%      -0.1%       7821 =C2=B1 20%      +8.9%       852=
6        interrupts.CPU146.NMI:Non-maskable_interrupts
      7829 =C2=B1 20%      -0.1%       7821 =C2=B1 20%      +8.9%       852=
6        interrupts.CPU146.PMI:Performance_monitoring_interrupts
    451.33 =C2=B1 30%      -9.3%     409.17 =C2=B1 21%      -2.5%     439.8=
3 =C2=B1 28%  interrupts.CPU146.RES:Rescheduling_interrupts
      3004 =C2=B1  3%      +2.7%       3086 =C2=B1  3%      +0.4%       301=
5 =C2=B1  4%  interrupts.CPU146.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU147.100:PCI-MSI.23592996-edge.nvme0q36
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU147.96:PCI-MSI.23592996-edge.nvme0q36
      4357 =C2=B1 21%     -10.4%       3906 =C2=B1  9%     -13.8%       375=
6 =C2=B1  3%  interrupts.CPU147.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU147.IWI:IRQ_work_interrupts
    565655 =C2=B1 15%      +7.1%     605566            +7.0%     605446    =
    interrupts.CPU147.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU147.MCP:Machine_check_polls
      7828 =C2=B1 20%      +9.0%       8535            +9.0%       8529    =
    interrupts.CPU147.NMI:Non-maskable_interrupts
      7828 =C2=B1 20%      +9.0%       8535            +9.0%       8529    =
    interrupts.CPU147.PMI:Performance_monitoring_interrupts
    742.83 =C2=B1107%     -58.6%     307.83           -58.2%     310.17    =
    interrupts.CPU147.RES:Rescheduling_interrupts
      3010 =C2=B1  3%      -2.4%       2937 =C2=B1  3%      +0.6%       302=
9 =C2=B1  3%  interrupts.CPU147.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU148.101:PCI-MSI.23592997-edge.nvme0q37
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU148.104:PCI-MSI.23592997-edge.nvme0q37
      3805 =C2=B1  5%      +4.8%       3987 =C2=B1 11%      -1.9%       373=
4 =C2=B1  3%  interrupts.CPU148.CAL:Function_call_interrupts
      2.67 =C2=B1 17%     +12.5%       3.00           +12.5%       3.00    =
    interrupts.CPU148.IWI:IRQ_work_interrupts
    565623 =C2=B1 15%      +7.1%     605567            +7.0%     605455    =
    interrupts.CPU148.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU148.MCP:Machine_check_polls
      7116 =C2=B1 28%     +20.0%       8536           +19.8%       8527    =
    interrupts.CPU148.NMI:Non-maskable_interrupts
      7116 =C2=B1 28%     +20.0%       8536           +19.8%       8527    =
    interrupts.CPU148.PMI:Performance_monitoring_interrupts
    319.50 =C2=B1  3%      +0.1%     319.67 =C2=B1  8%      -2.3%     312.1=
7 =C2=B1  2%  interrupts.CPU148.RES:Rescheduling_interrupts
      2998 =C2=B1  5%      +2.9%       3084 =C2=B1  3%      +0.9%       302=
4 =C2=B1  4%  interrupts.CPU148.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU149.88:PCI-MSI.23592998-edge.nvme0q38
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU149.98:PCI-MSI.23592998-edge.nvme0q38
      3787            -2.1%       3709            -0.2%       3780        i=
nterrupts.CPU149.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU149.IWI:IRQ_work_interrupts
    565570 =C2=B1 15%      +7.1%     605554            +7.1%     605458    =
    interrupts.CPU149.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU149.MCP:Machine_check_polls
      7824 =C2=B1 20%      +9.1%       8536            +9.0%       8527    =
    interrupts.CPU149.NMI:Non-maskable_interrupts
      7824 =C2=B1 20%      +9.1%       8536            +9.0%       8527    =
    interrupts.CPU149.PMI:Performance_monitoring_interrupts
    307.83            -0.5%     306.33            +2.7%     316.00 =C2=B1  =
6%  interrupts.CPU149.RES:Rescheduling_interrupts
      3058 =C2=B1  3%      -3.7%       2944 =C2=B1  3%      -1.0%       302=
7 =C2=B1  3%  interrupts.CPU149.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU15.37:PCI-MSI.65536-edge.ioat-msix
      3746            +0.1%       3750            +0.3%       3758        i=
nterrupts.CPU15.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      -9.1%       1.6=
7 =C2=B1 28%  interrupts.CPU15.IWI:IRQ_work_interrupts
    563873 =C2=B1 16%      +7.4%     605515            +7.4%     605679    =
    interrupts.CPU15.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU15.MCP:Machine_check_polls
      7507 =C2=B1 20%      -0.0%       7504 =C2=B1 20%      -9.1%       682=
4 =C2=B1 28%  interrupts.CPU15.NMI:Non-maskable_interrupts
      7507 =C2=B1 20%      -0.0%       7504 =C2=B1 20%      -9.1%       682=
4 =C2=B1 28%  interrupts.CPU15.PMI:Performance_monitoring_interrupts
    310.83            +3.1%     320.50 =C2=B1  7%      +2.0%     317.17 =C2=
=B1  4%  interrupts.CPU15.RES:Rescheduling_interrupts
      3003 =C2=B1  3%      +0.1%       3005 =C2=B1  3%      -0.9%       297=
8 =C2=B1  4%  interrupts.CPU15.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU150.102:PCI-MSI.23592999-edge.nvme0q39
      3754 =C2=B1  2%      +0.9%       3788 =C2=B1  2%      +0.4%       376=
8 =C2=B1  2%  interrupts.CPU150.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU150.IWI:IRQ_work_interrupts
    565693 =C2=B1 15%      +7.0%     605550            +7.0%     605446    =
    interrupts.CPU150.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU150.MCP:Machine_check_polls
      7824 =C2=B1 20%      +9.1%       8535            +9.0%       8525    =
    interrupts.CPU150.NMI:Non-maskable_interrupts
      7824 =C2=B1 20%      +9.1%       8535            +9.0%       8525    =
    interrupts.CPU150.PMI:Performance_monitoring_interrupts
    307.00            +2.0%     313.00 =C2=B1  4%      +0.2%     307.50    =
    interrupts.CPU150.RES:Rescheduling_interrupts
      3015 =C2=B1  4%      +2.7%       3097 =C2=B1  3%      +0.4%       302=
6 =C2=B1  4%  interrupts.CPU150.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU151.104:PCI-MSI.23593000-edge.nvme0q40
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU151.88:PCI-MSI.23593000-edge.nvme0q40
      3768 =C2=B1  2%      -1.0%       3731            -0.4%       3751    =
    interrupts.CPU151.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU151.IWI:IRQ_work_interrupts
    566018 =C2=B1 15%      +7.0%     605557            +7.0%     605459    =
    interrupts.CPU151.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU151.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8535            +9.0%       8525    =
    interrupts.CPU151.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8535            +9.0%       8525    =
    interrupts.CPU151.PMI:Performance_monitoring_interrupts
    310.00 =C2=B1  2%      -0.9%     307.17           +48.0%     458.67 =C2=
=B1 74%  interrupts.CPU151.RES:Rescheduling_interrupts
      3063 =C2=B1  3%      -4.0%       2940 =C2=B1  2%      -1.0%       303=
3 =C2=B1  3%  interrupts.CPU151.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU152.89:PCI-MSI.23593001-edge.nvme0q41
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU152.91:PCI-MSI.23593001-edge.nvme0q41
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU152.93:PCI-MSI.23593001-edge.nvme0q41
      3775            -0.1%       3770 =C2=B1  2%      +1.6%       3836 =C2=
=B1  3%  interrupts.CPU152.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU152.IWI:IRQ_work_interrupts
    565611 =C2=B1 15%      +7.1%     605552            +7.0%     605471    =
    interrupts.CPU152.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU152.MCP:Machine_check_polls
      7824 =C2=B1 20%      +9.1%       8535            +9.0%       8525    =
    interrupts.CPU152.NMI:Non-maskable_interrupts
      7824 =C2=B1 20%      +9.1%       8535            +9.0%       8525    =
    interrupts.CPU152.PMI:Performance_monitoring_interrupts
    308.00            -0.5%     306.50           +23.4%     380.00 =C2=B1 2=
9%  interrupts.CPU152.RES:Rescheduling_interrupts
      3028 =C2=B1  3%      +0.9%       3056 =C2=B1  4%      -0.4%       301=
5 =C2=B1  4%  interrupts.CPU152.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU153.87:PCI-MSI.23593002-edge.nvme0q42
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU153.99:PCI-MSI.23593002-edge.nvme0q42
      3718 =C2=B1  2%      -0.1%       3716           +34.1%       4985 =C2=
=B1 54%  interrupts.CPU153.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU153.IWI:IRQ_work_interrupts
    565477 =C2=B1 15%      +7.1%     605544            +7.1%     605478    =
    interrupts.CPU153.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU153.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8535            +9.0%       8526    =
    interrupts.CPU153.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8535            +9.0%       8526    =
    interrupts.CPU153.PMI:Performance_monitoring_interrupts
    307.33            -0.1%     307.17           +54.8%     475.83 =C2=B1 7=
9%  interrupts.CPU153.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      -2.5%       2954 =C2=B1  2%      +0.5%       304=
4 =C2=B1  3%  interrupts.CPU153.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU154.100:PCI-MSI.23593003-edge.nvme0q43
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU154.88:PCI-MSI.23593003-edge.nvme0q43
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU154.93:PCI-MSI.23593003-edge.nvme0q43
      3766            +0.8%       3795            +0.1%       3771 =C2=B1  =
2%  interrupts.CPU154.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU154.IWI:IRQ_work_interrupts
    565413 =C2=B1 15%      +7.1%     605555            +7.1%     605449    =
    interrupts.CPU154.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU154.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8536            +9.0%       8526    =
    interrupts.CPU154.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8536            +9.0%       8526    =
    interrupts.CPU154.PMI:Performance_monitoring_interrupts
    313.17 =C2=B1  3%      -2.3%     306.00            -1.8%     307.50    =
    interrupts.CPU154.RES:Rescheduling_interrupts
      3024 =C2=B1  3%      +2.8%       3108 =C2=B1  3%      +0.5%       303=
8 =C2=B1  4%  interrupts.CPU154.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU155.101:PCI-MSI.23593004-edge.nvme0q44
      3735 =C2=B1  3%      +1.2%       3778 =C2=B1  4%      +1.6%       379=
4 =C2=B1  2%  interrupts.CPU155.CAL:Function_call_interrupts
      2.67 =C2=B1 17%     +12.5%       3.00           +12.5%       3.00    =
    interrupts.CPU155.IWI:IRQ_work_interrupts
    565178 =C2=B1 15%      +7.1%     605547            +7.1%     605481    =
    interrupts.CPU155.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU155.MCP:Machine_check_polls
      7112 =C2=B1 28%     +20.0%       8534           +19.9%       8526    =
    interrupts.CPU155.NMI:Non-maskable_interrupts
      7112 =C2=B1 28%     +20.0%       8534           +19.9%       8526    =
    interrupts.CPU155.PMI:Performance_monitoring_interrupts
    308.33            +3.7%     319.83 =C2=B1  9%      +2.2%     315.17 =C2=
=B1  6%  interrupts.CPU155.RES:Rescheduling_interrupts
      2996 =C2=B1  4%      -1.4%       2953 =C2=B1  2%      +1.5%       304=
1 =C2=B1  3%  interrupts.CPU155.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU156.93:PCI-MSI.23593005-edge.nvme0q45
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU156.95:PCI-MSI.23593005-edge.nvme0q45
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU156.97:PCI-MSI.23593005-edge.nvme0q45
      3833 =C2=B1  4%      -1.2%       3787            -1.4%       3781 =C2=
=B1  2%  interrupts.CPU156.CAL:Function_call_interrupts
      2.67 =C2=B1 17%     +12.5%       3.00           +12.5%       3.00    =
    interrupts.CPU156.IWI:IRQ_work_interrupts
    566084 =C2=B1 15%      +7.0%     605552            +7.0%     605456    =
    interrupts.CPU156.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU156.MCP:Machine_check_polls
      7112 =C2=B1 28%     +20.0%       8534           +19.9%       8526    =
    interrupts.CPU156.NMI:Non-maskable_interrupts
      7112 =C2=B1 28%     +20.0%       8534           +19.9%       8526    =
    interrupts.CPU156.PMI:Performance_monitoring_interrupts
    323.67 =C2=B1 11%      -5.4%     306.33            -4.7%     308.50    =
    interrupts.CPU156.RES:Rescheduling_interrupts
      3028 =C2=B1  4%      +2.4%       3102 =C2=B1  3%      +0.8%       305=
3 =C2=B1  4%  interrupts.CPU156.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU157.103:PCI-MSI.23593006-edge.nvme0q46
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU157.94:PCI-MSI.23593006-edge.nvme0q46
      3892 =C2=B1  6%      -4.6%       3711 =C2=B1  2%      -3.1%       377=
2        interrupts.CPU157.CAL:Function_call_interrupts
      2.67 =C2=B1 17%     +12.5%       3.00           +12.5%       3.00    =
    interrupts.CPU157.IWI:IRQ_work_interrupts
    566071 =C2=B1 15%      +7.0%     605601            +7.0%     605474    =
    interrupts.CPU157.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU157.MCP:Machine_check_polls
      7113 =C2=B1 28%     +20.0%       8535           +19.9%       8527    =
    interrupts.CPU157.NMI:Non-maskable_interrupts
      7113 =C2=B1 28%     +20.0%       8535           +19.9%       8527    =
    interrupts.CPU157.PMI:Performance_monitoring_interrupts
    336.33 =C2=B1 19%      -8.6%     307.33            -7.4%     311.50 =C2=
=B1  2%  interrupts.CPU157.RES:Rescheduling_interrupts
      3076 =C2=B1  3%      -3.8%       2958 =C2=B1  2%      -0.8%       305=
0 =C2=B1  3%  interrupts.CPU157.TLB:TLB_shootdowns
      3772            -1.0%       3734 =C2=B1  2%      -0.4%       3757    =
    interrupts.CPU158.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU158.IWI:IRQ_work_interrupts
    565698 =C2=B1 15%      +7.1%     605590            +7.0%     605464    =
    interrupts.CPU158.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU158.MCP:Machine_check_polls
      8536            -0.0%       8535            -0.1%       8524        i=
nterrupts.CPU158.NMI:Non-maskable_interrupts
      8536            -0.0%       8535            -0.1%       8524        i=
nterrupts.CPU158.PMI:Performance_monitoring_interrupts
    307.33            +0.9%     310.00 =C2=B1  2%      -0.3%     306.50    =
    interrupts.CPU158.RES:Rescheduling_interrupts
      3042 =C2=B1  3%      +0.9%       3071 =C2=B1  4%      -0.8%       301=
8 =C2=B1  3%  interrupts.CPU158.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU159.108:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU159.110:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU159.112:PCI-MSI.23593008-edge.nvme0q48
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU159.93:PCI-MSI.23593008-edge.nvme0q48
      3785 =C2=B1  2%      -1.0%       3747            -0.1%       3781    =
    interrupts.CPU159.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU159.IWI:IRQ_work_interrupts
    565419 =C2=B1 15%      +7.1%     605549            +7.1%     605443    =
    interrupts.CPU159.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU159.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8535            +8.9%       8525    =
    interrupts.CPU159.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8535            +8.9%       8525    =
    interrupts.CPU159.PMI:Performance_monitoring_interrupts
    307.33            -0.1%     307.17            +1.5%     311.83 =C2=B1  =
3%  interrupts.CPU159.RES:Rescheduling_interrupts
      3041 =C2=B1  3%      -1.3%       3002 =C2=B1  2%      +0.5%       305=
5 =C2=B1  3%  interrupts.CPU159.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.161:PCI-MSI.23593073-edge.nvme0q113
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.39:PCI-MSI.67584-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU16.41:PCI-MSI.67584-edge.ioat-msix
      3688            +0.3%       3698 =C2=B1  2%      +0.4%       3701    =
    interrupts.CPU16.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU16.IWI:IRQ_work_interrupts
    564142 =C2=B1 16%      +7.3%     605492            +7.4%     605728    =
    interrupts.CPU16.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU16.MCP:Machine_check_polls
      7509 =C2=B1 20%      +9.0%       8187            -0.1%       7503 =C2=
=B1 20%  interrupts.CPU16.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      +9.0%       8187            -0.1%       7503 =C2=
=B1 20%  interrupts.CPU16.PMI:Performance_monitoring_interrupts
    309.83            +0.2%     310.50            +1.3%     313.83        i=
nterrupts.CPU16.RES:Rescheduling_interrupts
      2838 =C2=B1  3%      +2.8%       2917 =C2=B1  5%      -0.1%       283=
6 =C2=B1  3%  interrupts.CPU16.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU160.102:PCI-MSI.23593017-edge.nvme0q57
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU160.107:PCI-MSI.23593017-edge.nvme0q57
      3751            +1.6%       3810            +0.3%       3764 =C2=B1  =
2%  interrupts.CPU160.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU160.IWI:IRQ_work_interrupts
    565784 =C2=B1 15%      +7.0%     605549            +7.0%     605464    =
    interrupts.CPU160.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU160.MCP:Machine_check_polls
      7825 =C2=B1 20%      +9.1%       8535            +9.0%       8525    =
    interrupts.CPU160.NMI:Non-maskable_interrupts
      7825 =C2=B1 20%      +9.1%       8535            +9.0%       8525    =
    interrupts.CPU160.PMI:Performance_monitoring_interrupts
    307.50            -0.1%     307.17            -0.3%     306.50        i=
nterrupts.CPU160.RES:Rescheduling_interrupts
      3044 =C2=B1  3%      +2.2%       3110 =C2=B1  3%      +0.0%       304=
6 =C2=B1  4%  interrupts.CPU160.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU161.103:PCI-MSI.23593018-edge.nvme0q58
      3745 =C2=B1  3%      -0.3%       3733 =C2=B1  3%      +3.0%       385=
6 =C2=B1  4%  interrupts.CPU161.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00            +5.9%       3.00    =
    interrupts.CPU161.IWI:IRQ_work_interrupts
    565750 =C2=B1 15%      +7.0%     605462            +7.0%     605455    =
    interrupts.CPU161.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU161.MCP:Machine_check_polls
      7824 =C2=B1 20%      +9.1%       8536            +9.0%       8526    =
    interrupts.CPU161.NMI:Non-maskable_interrupts
      7824 =C2=B1 20%      +9.1%       8536            +9.0%       8526    =
    interrupts.CPU161.PMI:Performance_monitoring_interrupts
    309.00            +0.1%     309.33 =C2=B1  2%     +12.0%     346.00 =C2=
=B1 17%  interrupts.CPU161.RES:Rescheduling_interrupts
      3054 =C2=B1  3%      -3.0%       2962 =C2=B1  2%      +0.2%       306=
1 =C2=B1  3%  interrupts.CPU161.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU162.107:PCI-MSI.23593019-edge.nvme0q59
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU162.111:PCI-MSI.23593019-edge.nvme0q59
      4182 =C2=B1 20%      -9.4%       3787 =C2=B1  2%      -8.4%       383=
1 =C2=B1  5%  interrupts.CPU162.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU162.IWI:IRQ_work_interrupts
    566322 =C2=B1 15%      +6.9%     605545            +6.9%     605377    =
    interrupts.CPU162.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU162.MCP:Machine_check_polls
      8537            -0.0%       8535            -0.1%       8526        i=
nterrupts.CPU162.NMI:Non-maskable_interrupts
      8537            -0.0%       8535            -0.1%       8526        i=
nterrupts.CPU162.PMI:Performance_monitoring_interrupts
    364.83 =C2=B1 35%     -12.6%     318.83 =C2=B1  8%      -6.8%     340.1=
7 =C2=B1 17%  interrupts.CPU162.RES:Rescheduling_interrupts
      3085 =C2=B1  2%      +1.0%       3114 =C2=B1  3%      -1.5%       303=
8 =C2=B1  4%  interrupts.CPU162.TLB:TLB_shootdowns
      3779 =C2=B1  2%      +0.7%       3805 =C2=B1  5%      +0.4%       379=
5        interrupts.CPU163.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU163.IWI:IRQ_work_interrupts
    566269 =C2=B1 15%      +6.9%     605547            +6.9%     605452    =
    interrupts.CPU163.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU163.MCP:Machine_check_polls
      8537            -8.4%       7821 =C2=B1 20%      -0.1%       8526    =
    interrupts.CPU163.NMI:Non-maskable_interrupts
      8537            -8.4%       7821 =C2=B1 20%      -0.1%       8526    =
    interrupts.CPU163.PMI:Performance_monitoring_interrupts
    307.83            +7.6%     331.17 =C2=B1 16%     +50.0%     461.83 =C2=
=B1 72%  interrupts.CPU163.RES:Rescheduling_interrupts
      3048 =C2=B1  3%      -2.4%       2975 =C2=B1  2%      +1.7%       309=
9 =C2=B1  2%  interrupts.CPU163.TLB:TLB_shootdowns
      3723 =C2=B1  3%      +1.7%       3786 =C2=B1  2%      +1.8%       379=
1 =C2=B1  2%  interrupts.CPU164.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU164.IWI:IRQ_work_interrupts
    566382 =C2=B1 15%      +6.9%     605549            +6.9%     605425    =
    interrupts.CPU164.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU164.MCP:Machine_check_polls
      8537            -0.0%       8534            -0.1%       8525        i=
nterrupts.CPU164.NMI:Non-maskable_interrupts
      8537            -0.0%       8534            -0.1%       8525        i=
nterrupts.CPU164.PMI:Performance_monitoring_interrupts
    307.83            +1.4%     312.00 =C2=B1  3%      -0.6%     305.83    =
    interrupts.CPU164.RES:Rescheduling_interrupts
      3054 =C2=B1  3%      +2.1%       3119 =C2=B1  3%      +1.2%       309=
2 =C2=B1  3%  interrupts.CPU164.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU165.112:PCI-MSI.23593022-edge.nvme0q62
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU165.119:PCI-MSI.23593022-edge.nvme0q62
      3778            -1.5%       3722            -0.3%       3765 =C2=B1  =
2%  interrupts.CPU165.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU165.IWI:IRQ_work_interrupts
    565828 =C2=B1 15%      +7.0%     605546            +7.0%     605437    =
    interrupts.CPU165.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU165.MCP:Machine_check_polls
      8536            -8.3%       7826 =C2=B1 20%      -0.1%       8525    =
    interrupts.CPU165.NMI:Non-maskable_interrupts
      8536            -8.3%       7826 =C2=B1 20%      -0.1%       8525    =
    interrupts.CPU165.PMI:Performance_monitoring_interrupts
    305.83            +0.1%     306.00            +0.3%     306.83        i=
nterrupts.CPU165.RES:Rescheduling_interrupts
      3060 =C2=B1  3%      -2.7%       2976 =C2=B1  2%      +1.4%       310=
3 =C2=B1  2%  interrupts.CPU165.TLB:TLB_shootdowns
      3745            +0.6%       3766            +0.4%       3759 =C2=B1  =
2%  interrupts.CPU166.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      +0.0%       3.00    =
    interrupts.CPU166.IWI:IRQ_work_interrupts
    565858 =C2=B1 15%      +7.0%     605596            +7.0%     605454    =
    interrupts.CPU166.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU166.MCP:Machine_check_polls
      8536           -16.7%       7113 =C2=B1 28%      -0.1%       8525    =
    interrupts.CPU166.NMI:Non-maskable_interrupts
      8536           -16.7%       7113 =C2=B1 28%      -0.1%       8525    =
    interrupts.CPU166.PMI:Performance_monitoring_interrupts
    306.50            +0.0%     306.50            -0.1%     306.17        i=
nterrupts.CPU166.RES:Rescheduling_interrupts
      3070 =C2=B1  3%      +2.1%       3134 =C2=B1  2%      -0.8%       304=
6 =C2=B1  3%  interrupts.CPU166.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU167.127:PCI-MSI.23593024-edge.nvme0q64
      3791 =C2=B1  2%      -0.6%       3767            +0.2%       3800    =
    interrupts.CPU167.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      +0.0%       3.00    =
    interrupts.CPU167.IWI:IRQ_work_interrupts
    565955 =C2=B1 15%      +7.0%     605541            +7.0%     605456    =
    interrupts.CPU167.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU167.MCP:Machine_check_polls
      8536           -16.7%       7113 =C2=B1 28%      -0.1%       8525    =
    interrupts.CPU167.NMI:Non-maskable_interrupts
      8536           -16.7%       7113 =C2=B1 28%      -0.1%       8525    =
    interrupts.CPU167.PMI:Performance_monitoring_interrupts
    307.17            -0.1%     306.83            -0.2%     306.50        i=
nterrupts.CPU167.RES:Rescheduling_interrupts
      3124 =C2=B1  3%      -2.3%       3052 =C2=B1  2%      -0.9%       309=
5 =C2=B1  3%  interrupts.CPU167.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU168.115:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU168.118:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU168.127:PCI-MSI.23593025-edge.nvme0q65
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU168.129:PCI-MSI.23593025-edge.nvme0q65
     13959 =C2=B1 18%     +43.1%      19973 =C2=B1 21%     +12.7%      1573=
3 =C2=B1 20%  interrupts.CPU168.CAL:Function_call_interrupts
      2.00            +8.3%       2.17 =C2=B1 17%      +8.3%       2.17 =C2=
=B1 17%  interrupts.CPU168.IWI:IRQ_work_interrupts
    562950 =C2=B1 16%      +7.6%     605755            +7.6%     605739    =
    interrupts.CPU168.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU168.MCP:Machine_check_polls
      7335 =C2=B1 20%      -9.1%       6665 =C2=B1 28%      +9.0%       799=
5        interrupts.CPU168.NMI:Non-maskable_interrupts
      7335 =C2=B1 20%      -9.1%       6665 =C2=B1 28%      +9.0%       799=
5        interrupts.CPU168.PMI:Performance_monitoring_interrupts
    332.17 =C2=B1  3%      +6.6%     354.17 =C2=B1  7%    +128.9%     760.1=
7 =C2=B1 80%  interrupts.CPU168.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      +0.5%       3045 =C2=B1  2%      +3.0%       312=
0        interrupts.CPU168.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU169.114:PCI-MSI.23593026-edge.nvme0q66
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU169.119:PCI-MSI.23593026-edge.nvme0q66
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU169.128:PCI-MSI.23593026-edge.nvme0q66
      6983 =C2=B1 13%     -30.9%       4822 =C2=B1 10%     -30.5%       485=
2 =C2=B1  6%  interrupts.CPU169.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU169.IWI:IRQ_work_interrupts
    561475 =C2=B1 17%      +7.9%     605696            +7.9%     605607    =
    interrupts.CPU169.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU169.MCP:Machine_check_polls
      8005           -16.7%       6666 =C2=B1 28%      -0.1%       7997    =
    interrupts.CPU169.NMI:Non-maskable_interrupts
      8005           -16.7%       6666 =C2=B1 28%      -0.1%       7997    =
    interrupts.CPU169.PMI:Performance_monitoring_interrupts
    436.83 =C2=B1 12%      -9.4%     395.83 =C2=B1 10%     -11.9%     384.8=
3 =C2=B1 17%  interrupts.CPU169.RES:Rescheduling_interrupts
      3084 =C2=B1  3%      -1.5%       3039 =C2=B1  2%      +0.8%       311=
0 =C2=B1  2%  interrupts.CPU169.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.166:PCI-MSI.23593074-edge.nvme0q114
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.171:PCI-MSI.23593074-edge.nvme0q114
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.40:PCI-MSI.69632-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU17.42:PCI-MSI.69632-edge.ioat-msix
      3767            -1.2%       3721            +0.8%       3796        i=
nterrupts.CPU17.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU17.IWI:IRQ_work_interrupts
    563433 =C2=B1 16%      +7.4%     605407            +7.5%     605676    =
    interrupts.CPU17.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU17.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      -0.1%       750=
3 =C2=B1 20%  interrupts.CPU17.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      -0.1%       750=
3 =C2=B1 20%  interrupts.CPU17.PMI:Performance_monitoring_interrupts
    316.67 =C2=B1  4%      -0.9%     313.83 =C2=B1  2%      +2.8%     325.6=
7 =C2=B1  6%  interrupts.CPU17.RES:Rescheduling_interrupts
      3009 =C2=B1  3%      -1.1%       2977 =C2=B1  3%      +0.1%       301=
3 =C2=B1  3%  interrupts.CPU17.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU170.120:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU170.124:PCI-MSI.23593027-edge.nvme0q67
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU170.129:PCI-MSI.23593027-edge.nvme0q67
      4468 =C2=B1 16%      +1.2%       4522 =C2=B1 28%     +10.0%       491=
4 =C2=B1 23%  interrupts.CPU170.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU170.IWI:IRQ_work_interrupts
    561724 =C2=B1 17%      +7.8%     605630            +7.8%     605488    =
    interrupts.CPU170.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU170.MCP:Machine_check_polls
      8005           -16.7%       6666 =C2=B1 28%      -0.1%       7995    =
    interrupts.CPU170.NMI:Non-maskable_interrupts
      8005           -16.7%       6666 =C2=B1 28%      -0.1%       7995    =
    interrupts.CPU170.PMI:Performance_monitoring_interrupts
    379.00 =C2=B1 20%     -12.4%     332.17 =C2=B1 11%      -2.9%     368.1=
7 =C2=B1 17%  interrupts.CPU170.RES:Rescheduling_interrupts
      3049 =C2=B1  3%      +3.0%       3140 =C2=B1  2%      +1.7%       309=
9 =C2=B1  4%  interrupts.CPU170.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU171.118:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU171.121:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU171.125:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU171.130:PCI-MSI.23593028-edge.nvme0q68
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU171.132:PCI-MSI.23593028-edge.nvme0q68
      5173 =C2=B1 50%     -13.2%       4487 =C2=B1 19%     -24.5%       390=
4 =C2=B1  6%  interrupts.CPU171.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU171.IWI:IRQ_work_interrupts
    561588 =C2=B1 17%      +7.8%     605552            +7.8%     605468    =
    interrupts.CPU171.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU171.MCP:Machine_check_polls
      7338 =C2=B1 20%      +9.0%       8000            +9.0%       7998    =
    interrupts.CPU171.NMI:Non-maskable_interrupts
      7338 =C2=B1 20%      +9.0%       8000            +9.0%       7998    =
    interrupts.CPU171.PMI:Performance_monitoring_interrupts
    537.17 =C2=B1 70%     -13.9%     462.33 =C2=B1 43%     -35.6%     346.0=
0 =C2=B1 24%  interrupts.CPU171.RES:Rescheduling_interrupts
      3092 =C2=B1  3%      -1.1%       3057 =C2=B1  2%      -0.2%       308=
5 =C2=B1  3%  interrupts.CPU171.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU172.113:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU172.114:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU172.122:PCI-MSI.23593029-edge.nvme0q69
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU172.131:PCI-MSI.23593029-edge.nvme0q69
      3786 =C2=B1  2%      +1.3%       3835           +14.2%       4324 =C2=
=B1 24%  interrupts.CPU172.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU172.IWI:IRQ_work_interrupts
    561068 =C2=B1 17%      +7.9%     605563            +7.9%     605556    =
    interrupts.CPU172.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU172.MCP:Machine_check_polls
      7338 =C2=B1 20%      +9.0%       8000            +9.0%       7997    =
    interrupts.CPU172.NMI:Non-maskable_interrupts
      7338 =C2=B1 20%      +9.0%       8000            +9.0%       7997    =
    interrupts.CPU172.PMI:Performance_monitoring_interrupts
    308.33           +49.6%     461.17 =C2=B1 74%     +27.7%     393.83 =C2=
=B1 48%  interrupts.CPU172.RES:Rescheduling_interrupts
      3095 =C2=B1  3%      +1.7%       3146 =C2=B1  3%      +0.1%       309=
7 =C2=B1  3%  interrupts.CPU172.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU173.114:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU173.120:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU173.132:PCI-MSI.23593030-edge.nvme0q70
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU173.133:PCI-MSI.23593030-edge.nvme0q70
      3769           +32.2%       4981 =C2=B1 54%      +1.3%       3819    =
    interrupts.CPU173.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU173.IWI:IRQ_work_interrupts
    561411 =C2=B1 17%      +7.9%     605584            +7.8%     605458    =
    interrupts.CPU173.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU173.MCP:Machine_check_polls
      7337 =C2=B1 20%      +9.0%       8000            -0.0%       7334 =C2=
=B1 20%  interrupts.CPU173.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      +9.0%       8000            -0.0%       7334 =C2=
=B1 20%  interrupts.CPU173.PMI:Performance_monitoring_interrupts
    307.00           +62.4%     498.67 =C2=B1 84%     +16.1%     356.50 =C2=
=B1 31%  interrupts.CPU173.RES:Rescheduling_interrupts
      3073 =C2=B1  2%      -1.3%       3034 =C2=B1  2%      +1.1%       310=
5 =C2=B1  2%  interrupts.CPU173.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU174.121:PCI-MSI.23593031-edge.nvme0q71
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU174.133:PCI-MSI.23593031-edge.nvme0q71
      3844 =C2=B1  3%     +31.3%       5046 =C2=B1 59%      -0.8%       381=
5        interrupts.CPU174.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU174.IWI:IRQ_work_interrupts
    560941 =C2=B1 17%      +8.0%     605624            +7.9%     605449    =
    interrupts.CPU174.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU174.MCP:Machine_check_polls
      7336 =C2=B1 20%      +9.0%       7998            -0.0%       7335 =C2=
=B1 20%  interrupts.CPU174.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      +9.0%       7998            -0.0%       7335 =C2=
=B1 20%  interrupts.CPU174.PMI:Performance_monitoring_interrupts
    317.83 =C2=B1  5%     +57.2%     499.67 =C2=B1 82%      -3.0%     308.1=
7        interrupts.CPU174.RES:Rescheduling_interrupts
      3100 =C2=B1  3%      -0.4%       3089 =C2=B1  4%      +0.2%       310=
7 =C2=B1  3%  interrupts.CPU174.TLB:TLB_shootdowns
      3827            -2.1%       3745            -1.2%       3780        i=
nterrupts.CPU175.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU175.IWI:IRQ_work_interrupts
    561479 =C2=B1 17%      +7.9%     605558            +7.8%     605492    =
    interrupts.CPU175.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU175.MCP:Machine_check_polls
      7337 =C2=B1 20%      +9.0%       8000            -0.0%       7335 =C2=
=B1 20%  interrupts.CPU175.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      +9.0%       8000            -0.0%       7335 =C2=
=B1 20%  interrupts.CPU175.PMI:Performance_monitoring_interrupts
    461.50 =C2=B1 74%     -18.7%     375.17 =C2=B1 40%     -33.2%     308.1=
7        interrupts.CPU175.RES:Rescheduling_interrupts
      3133 =C2=B1  2%      -4.7%       2986            -1.0%       3102 =C2=
=B1  2%  interrupts.CPU175.TLB:TLB_shootdowns
      3794            +0.6%       3815 =C2=B1  2%      +0.4%       3808    =
    interrupts.CPU176.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU176.IWI:IRQ_work_interrupts
    561812 =C2=B1 17%      +7.8%     605530            +7.8%     605455    =
    interrupts.CPU176.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU176.MCP:Machine_check_polls
      7337 =C2=B1 20%      +9.0%       7998            +9.0%       7998    =
    interrupts.CPU176.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      +9.0%       7998            +9.0%       7998    =
    interrupts.CPU176.PMI:Performance_monitoring_interrupts
    307.00            +4.2%     319.83 =C2=B1  7%      +0.3%     307.83    =
    interrupts.CPU176.RES:Rescheduling_interrupts
      3071 =C2=B1  3%      +1.7%       3123 =C2=B1  3%      +0.8%       309=
4 =C2=B1  3%  interrupts.CPU176.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU177.131:PCI-MSI.23593034-edge.nvme0q74
      3801            -0.6%       3777 =C2=B1  2%      +1.0%       3839 =C2=
=B1  4%  interrupts.CPU177.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU177.IWI:IRQ_work_interrupts
    561898 =C2=B1 17%      +7.8%     605626            +7.8%     605476    =
    interrupts.CPU177.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU177.MCP:Machine_check_polls
      7336 =C2=B1 20%      +9.0%       7999            +9.0%       7998    =
    interrupts.CPU177.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      +9.0%       7999            +9.0%       7998    =
    interrupts.CPU177.PMI:Performance_monitoring_interrupts
    306.33            +1.0%     309.50            +0.1%     306.67        i=
nterrupts.CPU177.RES:Rescheduling_interrupts
      3098 =C2=B1  3%      -1.3%       3058 =C2=B1  3%      -1.0%       306=
5 =C2=B1  2%  interrupts.CPU177.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU178.125:PCI-MSI.23593035-edge.nvme0q75
      3809            +0.4%       3825            +2.0%       3886 =C2=B1  =
6%  interrupts.CPU178.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU178.IWI:IRQ_work_interrupts
    561588 =C2=B1 17%      +7.8%     605543            +7.8%     605466    =
    interrupts.CPU178.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU178.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +9.0%       799=
8        interrupts.CPU178.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +9.0%       799=
8        interrupts.CPU178.PMI:Performance_monitoring_interrupts
    306.83           +50.5%     461.83 =C2=B1 74%     +15.2%     353.33 =C2=
=B1 26%  interrupts.CPU178.RES:Rescheduling_interrupts
      3098 =C2=B1  3%      +2.2%       3166 =C2=B1  2%      -1.3%       305=
8 =C2=B1  3%  interrupts.CPU178.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU179.138:PCI-MSI.23593036-edge.nvme0q76
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU179.140:PCI-MSI.23593036-edge.nvme0q76
      3806            -3.2%       3683 =C2=B1  4%      -0.4%       3790 =C2=
=B1  3%  interrupts.CPU179.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU179.IWI:IRQ_work_interrupts
    561122 =C2=B1 17%      +7.9%     605539            +7.9%     605475    =
    interrupts.CPU179.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU179.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +9.0%       799=
8        interrupts.CPU179.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +9.0%       799=
8        interrupts.CPU179.PMI:Performance_monitoring_interrupts
    307.50            +0.4%     308.67            +0.5%     309.17        i=
nterrupts.CPU179.RES:Rescheduling_interrupts
      3105 =C2=B1  3%      -2.0%       3043 =C2=B1  2%      +2.1%       317=
0        interrupts.CPU179.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU18.163:PCI-MSI.23593075-edge.nvme0q115
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
      3702            -0.3%       3693            +0.2%       3710        i=
nterrupts.CPU18.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            -8.3%       1.83 =C2=B1 2=
0%  interrupts.CPU18.IWI:IRQ_work_interrupts
    563980 =C2=B1 16%      +7.4%     605493            +7.4%     605673    =
    interrupts.CPU18.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU18.MCP:Machine_check_polls
      8192            -0.1%       8187            -8.4%       7503 =C2=B1 2=
0%  interrupts.CPU18.NMI:Non-maskable_interrupts
      8192            -0.1%       8187            -8.4%       7503 =C2=B1 2=
0%  interrupts.CPU18.PMI:Performance_monitoring_interrupts
    312.33            +4.1%     325.00 =C2=B1 10%      +0.0%     312.33    =
    interrupts.CPU18.RES:Rescheduling_interrupts
      2845 =C2=B1  3%      -0.3%       2836 =C2=B1  2%      +0.2%       285=
0 =C2=B1  3%  interrupts.CPU18.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU180.121:PCI-MSI.23593037-edge.nvme0q77
      3891 =C2=B1  4%      -1.3%       3841 =C2=B1  2%     +11.3%       432=
9 =C2=B1 15%  interrupts.CPU180.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU180.IWI:IRQ_work_interrupts
    561265 =C2=B1 17%      +7.9%     605545            +7.9%     605455    =
    interrupts.CPU180.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU180.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +9.0%       799=
6        interrupts.CPU180.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +9.0%       799=
6        interrupts.CPU180.PMI:Performance_monitoring_interrupts
    351.17 =C2=B1 24%      -6.6%     328.00 =C2=B1 13%     +42.8%     501.3=
3 =C2=B1 57%  interrupts.CPU180.RES:Rescheduling_interrupts
      3099 =C2=B1  3%      +2.0%       3160 =C2=B1  3%      +0.3%       310=
9 =C2=B1  3%  interrupts.CPU180.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU181.122:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU181.126:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU181.140:PCI-MSI.23593038-edge.nvme0q78
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU181.141:PCI-MSI.23593038-edge.nvme0q78
      3799            -1.1%       3757            -0.1%       3794        i=
nterrupts.CPU181.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU181.IWI:IRQ_work_interrupts
    561869 =C2=B1 17%      +7.8%     605557            +7.8%     605456    =
    interrupts.CPU181.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU181.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU181.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.1%       7332 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU181.PMI:Performance_monitoring_interrupts
    306.67            +0.3%     307.67            +0.4%     308.00        i=
nterrupts.CPU181.RES:Rescheduling_interrupts
      3103 =C2=B1  3%      -2.8%       3017 =C2=B1  2%      -1.8%       304=
7 =C2=B1  4%  interrupts.CPU181.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU182.127:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU182.136:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU182.141:PCI-MSI.23593039-edge.nvme0q79
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU182.142:PCI-MSI.23593039-edge.nvme0q79
      3809            +8.7%       4142 =C2=B1 18%      +0.1%       3814    =
    interrupts.CPU182.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU182.IWI:IRQ_work_interrupts
    561867 =C2=B1 17%      +7.8%     605571            +7.8%     605456    =
    interrupts.CPU182.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU182.MCP:Machine_check_polls
      7336 =C2=B1 20%      -0.0%       7333 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU182.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      -0.0%       7333 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU182.PMI:Performance_monitoring_interrupts
    306.33           +17.5%     360.00 =C2=B1 31%      +0.4%     307.50    =
    interrupts.CPU182.RES:Rescheduling_interrupts
      3131 =C2=B1  3%      -0.1%       3129 =C2=B1  4%      -0.8%       310=
6 =C2=B1  3%  interrupts.CPU182.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU183.128:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU183.133:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU183.137:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU183.143:PCI-MSI.23593040-edge.nvme0q80
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU183.144:PCI-MSI.23593040-edge.nvme0q80
      3838            -1.3%       3788            -0.7%       3812        i=
nterrupts.CPU183.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU183.IWI:IRQ_work_interrupts
    561649 =C2=B1 17%      +7.8%     605527            +7.8%     605452    =
    interrupts.CPU183.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU183.MCP:Machine_check_polls
      7335 =C2=B1 20%      -0.0%       7332 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU183.NMI:Non-maskable_interrupts
      7335 =C2=B1 20%      -0.0%       7332 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU183.PMI:Performance_monitoring_interrupts
    306.83            +0.3%     307.83            -0.3%     306.00        i=
nterrupts.CPU183.RES:Rescheduling_interrupts
      3160 =C2=B1  2%      -3.0%       3065 =C2=B1  2%      -2.0%       309=
7 =C2=B1  3%  interrupts.CPU183.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU184.146:PCI-MSI.23593049-edge.nvme0q89
      3803            +2.5%       3898 =C2=B1  5%      +0.2%       3810    =
    interrupts.CPU184.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU184.IWI:IRQ_work_interrupts
    561256 =C2=B1 17%      +7.9%     605533            +7.9%     605453    =
    interrupts.CPU184.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU184.MCP:Machine_check_polls
      7336 =C2=B1 20%      +9.1%       8000            +9.0%       7997    =
    interrupts.CPU184.NMI:Non-maskable_interrupts
      7336 =C2=B1 20%      +9.1%       8000            +9.0%       7997    =
    interrupts.CPU184.PMI:Performance_monitoring_interrupts
    307.33            +9.8%     337.50 =C2=B1 20%      +0.1%     307.50    =
    interrupts.CPU184.RES:Rescheduling_interrupts
      3102 =C2=B1  3%      +2.0%       3163 =C2=B1  3%      -0.2%       309=
5 =C2=B1  3%  interrupts.CPU184.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU185.134:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU185.143:PCI-MSI.23593050-edge.nvme0q90
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU185.147:PCI-MSI.23593050-edge.nvme0q90
      4778 =C2=B1 44%     -21.4%       3758           -19.8%       3831    =
    interrupts.CPU185.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU185.IWI:IRQ_work_interrupts
    561400 =C2=B1 17%      +7.9%     605525            +7.9%     605481    =
    interrupts.CPU185.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU185.MCP:Machine_check_polls
      7335 =C2=B1 20%      -0.1%       7331 =C2=B1 20%      +9.0%       799=
8        interrupts.CPU185.NMI:Non-maskable_interrupts
      7335 =C2=B1 20%      -0.1%       7331 =C2=B1 20%      +9.0%       799=
8        interrupts.CPU185.PMI:Performance_monitoring_interrupts
    454.33 =C2=B1 73%     -19.6%     365.17 =C2=B1 30%      +1.7%     462.1=
7 =C2=B1 74%  interrupts.CPU185.RES:Rescheduling_interrupts
      3106 =C2=B1  3%      -3.1%       3010 =C2=B1  2%      -0.1%       310=
3 =C2=B1  3%  interrupts.CPU185.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU186.141:PCI-MSI.23593051-edge.nvme0q91
      3813            +1.4%       3866 =C2=B1  4%      +0.8%       3845    =
    interrupts.CPU186.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU186.IWI:IRQ_work_interrupts
    561455 =C2=B1 17%      +7.8%     605502            +7.8%     605452    =
    interrupts.CPU186.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU186.MCP:Machine_check_polls
      7334 =C2=B1 20%      -0.1%       7331 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU186.NMI:Non-maskable_interrupts
      7334 =C2=B1 20%      -0.1%       7331 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU186.PMI:Performance_monitoring_interrupts
    306.33            +4.5%     320.00 =C2=B1  5%      +1.0%     309.50    =
    interrupts.CPU186.RES:Rescheduling_interrupts
      3100 =C2=B1  3%      +0.8%       3123 =C2=B1  3%      +1.1%       313=
5 =C2=B1  3%  interrupts.CPU186.TLB:TLB_shootdowns
      3811            +0.0%       3811 =C2=B1  5%      +1.5%       3870 =C2=
=B1  3%  interrupts.CPU187.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU187.IWI:IRQ_work_interrupts
    561631 =C2=B1 17%      +7.8%     605537            +7.8%     605453    =
    interrupts.CPU187.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU187.MCP:Machine_check_polls
      7334 =C2=B1 20%      -0.0%       7332 =C2=B1 20%      -0.0%       733=
3 =C2=B1 20%  interrupts.CPU187.NMI:Non-maskable_interrupts
      7334 =C2=B1 20%      -0.0%       7332 =C2=B1 20%      -0.0%       733=
3 =C2=B1 20%  interrupts.CPU187.PMI:Performance_monitoring_interrupts
    306.17           +11.2%     340.50 =C2=B1 20%      +5.6%     323.33 =C2=
=B1 11%  interrupts.CPU187.RES:Rescheduling_interrupts
      3121 =C2=B1  2%      -2.5%       3042 =C2=B1  2%      -0.2%       311=
4 =C2=B1  2%  interrupts.CPU187.TLB:TLB_shootdowns
      3808            +0.4%       3822 =C2=B1  2%      +0.3%       3819    =
    interrupts.CPU188.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU188.IWI:IRQ_work_interrupts
    561439 =C2=B1 17%      +7.9%     605565            +7.8%     605457    =
    interrupts.CPU188.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU188.MCP:Machine_check_polls
      8002            -8.4%       7332 =C2=B1 20%      -8.4%       7333 =C2=
=B1 20%  interrupts.CPU188.NMI:Non-maskable_interrupts
      8002            -8.4%       7332 =C2=B1 20%      -8.4%       7333 =C2=
=B1 20%  interrupts.CPU188.PMI:Performance_monitoring_interrupts
    306.83            +0.7%     308.83            +1.8%     312.33 =C2=B1  =
4%  interrupts.CPU188.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      +2.1%       3160 =C2=B1  3%      +0.2%       310=
4 =C2=B1  3%  interrupts.CPU188.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU189.157:PCI-MSI.23593054-edge.nvme0q94
      3831            +3.0%       3945 =C2=B1  8%      -0.2%       3824 =C2=
=B1  2%  interrupts.CPU189.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            -8.3%       1.83 =C2=B1 2=
0%  interrupts.CPU189.IWI:IRQ_work_interrupts
    561551 =C2=B1 17%      +7.8%     605555            +7.8%     605448    =
    interrupts.CPU189.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU189.MCP:Machine_check_polls
      8002            -0.0%       8000            -8.4%       7333 =C2=B1 2=
0%  interrupts.CPU189.NMI:Non-maskable_interrupts
      8002            -0.0%       8000            -8.4%       7333 =C2=B1 2=
0%  interrupts.CPU189.PMI:Performance_monitoring_interrupts
    308.83           +18.3%     365.50 =C2=B1 22%      -0.4%     307.67    =
    interrupts.CPU189.RES:Rescheduling_interrupts
      3140 =C2=B1  3%      -1.3%       3100 =C2=B1  2%      -1.2%       310=
2 =C2=B1  2%  interrupts.CPU189.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.160:PCI-MSI.23593076-edge.nvme0q116
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.164:PCI-MSI.23593076-edge.nvme0q116
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.42:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.43:PCI-MSI.71680-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU19.44:PCI-MSI.71680-edge.ioat-msix
      3762            -0.5%       3741            -0.3%       3749        i=
nterrupts.CPU19.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            -8.3%       1.83 =C2=B1 2=
0%  interrupts.CPU19.IWI:IRQ_work_interrupts
    564098 =C2=B1 16%      +7.3%     605492            +7.4%     605670    =
    interrupts.CPU19.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU19.MCP:Machine_check_polls
      8193            -0.1%       8188            -8.4%       7502 =C2=B1 2=
0%  interrupts.CPU19.NMI:Non-maskable_interrupts
      8193            -0.1%       8188            -8.4%       7502 =C2=B1 2=
0%  interrupts.CPU19.PMI:Performance_monitoring_interrupts
    312.83            -0.6%     310.83            -0.5%     311.17        i=
nterrupts.CPU19.RES:Rescheduling_interrupts
      3016 =C2=B1  3%      -1.4%       2974 =C2=B1  4%      -1.4%       297=
3 =C2=B1  3%  interrupts.CPU19.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU190.139:PCI-MSI.23593055-edge.nvme0q95
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU190.148:PCI-MSI.23593055-edge.nvme0q95
      3806            +0.8%       3836            +0.1%       3809        i=
nterrupts.CPU190.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU190.IWI:IRQ_work_interrupts
    561315 =C2=B1 17%      +7.9%     605525            +7.9%     605466    =
    interrupts.CPU190.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU190.MCP:Machine_check_polls
      8001           -16.7%       6666 =C2=B1 28%      -8.4%       7333 =C2=
=B1 20%  interrupts.CPU190.NMI:Non-maskable_interrupts
      8001           -16.7%       6666 =C2=B1 28%      -8.4%       7333 =C2=
=B1 20%  interrupts.CPU190.PMI:Performance_monitoring_interrupts
    307.00            +0.4%     308.17            -0.2%     306.50        i=
nterrupts.CPU190.RES:Rescheduling_interrupts
      3103 =C2=B1  3%      +1.9%       3162 =C2=B1  3%      -0.0%       310=
2 =C2=B1  3%  interrupts.CPU190.TLB:TLB_shootdowns
      3805 =C2=B1  5%     +10.1%       4187 =C2=B1 22%      +2.1%       388=
4        interrupts.CPU191.CAL:Function_call_interrupts
      3.17 =C2=B1 11%     -15.8%       2.67 =C2=B1 35%      +5.3%       3.3=
3 =C2=B1 37%  interrupts.CPU191.IWI:IRQ_work_interrupts
    561118 =C2=B1 17%      +7.9%     605637            +7.9%     605508    =
    interrupts.CPU191.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU191.MCP:Machine_check_polls
      8015           -16.8%       6671 =C2=B1 28%      -8.4%       7343 =C2=
=B1 20%  interrupts.CPU191.NMI:Non-maskable_interrupts
      8015           -16.8%       6671 =C2=B1 28%      -8.4%       7343 =C2=
=B1 20%  interrupts.CPU191.PMI:Performance_monitoring_interrupts
    339.50           +17.1%     397.67 =C2=B1 26%      +2.5%     348.00 =C2=
=B1  2%  interrupts.CPU191.RES:Rescheduling_interrupts
      3094 =C2=B1  3%      -2.9%       3004 =C2=B1  3%      +0.1%       309=
6 =C2=B1  2%  interrupts.CPU191.TLB:TLB_shootdowns
      4355 =C2=B1  7%     -12.5%       3810            -3.9%       4188 =C2=
=B1  9%  interrupts.CPU2.CAL:Function_call_interrupts
      2.00            +0.0%       2.00 =C2=B1 28%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU2.IWI:IRQ_work_interrupts
    564424 =C2=B1 16%      +7.3%     605568            +7.3%     605763    =
    interrupts.CPU2.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU2.MCP:Machine_check_polls
      8193            -8.4%       7504 =C2=B1 20%      -8.4%       7502 =C2=
=B1 20%  interrupts.CPU2.NMI:Non-maskable_interrupts
      8193            -8.4%       7504 =C2=B1 20%      -8.4%       7502 =C2=
=B1 20%  interrupts.CPU2.PMI:Performance_monitoring_interrupts
    459.33 =C2=B1 15%     -11.4%     406.83 =C2=B1 20%      -3.2%     444.8=
3 =C2=B1 18%  interrupts.CPU2.RES:Rescheduling_interrupts
      2891 =C2=B1  4%      -2.0%       2832 =C2=B1  3%      -2.7%       281=
2 =C2=B1  3%  interrupts.CPU2.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.167:PCI-MSI.23593077-edge.nvme0q117
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.169:PCI-MSI.23593077-edge.nvme0q117
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.43:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.44:PCI-MSI.73728-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU20.45:PCI-MSI.73728-edge.ioat-msix
      3669            +0.5%       3688            +0.9%       3704        i=
nterrupts.CPU20.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU20.IWI:IRQ_work_interrupts
    563975 =C2=B1 16%      +7.4%     605492            +7.4%     605680    =
    interrupts.CPU20.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU20.MCP:Machine_check_polls
      7511 =C2=B1 20%      +9.0%       8188            +9.0%       8184    =
    interrupts.CPU20.NMI:Non-maskable_interrupts
      7511 =C2=B1 20%      +9.0%       8188            +9.0%       8184    =
    interrupts.CPU20.PMI:Performance_monitoring_interrupts
    310.83            +1.1%     314.17 =C2=B1  3%      +0.2%     311.50    =
    interrupts.CPU20.RES:Rescheduling_interrupts
      2852 =C2=B1  3%      -0.6%       2834 =C2=B1  2%      +0.4%       286=
3 =C2=B1  3%  interrupts.CPU20.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.166:PCI-MSI.23593078-edge.nvme0q118
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.173:PCI-MSI.75776-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.43:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.44:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU21.46:PCI-MSI.77824-edge.ioat-msix
      3746            +0.6%       3767            +1.4%       3797        i=
nterrupts.CPU21.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU21.IWI:IRQ_work_interrupts
    563817 =C2=B1 16%      +7.4%     605491            +7.4%     605665    =
    interrupts.CPU21.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU21.MCP:Machine_check_polls
      7511 =C2=B1 20%      +9.0%       8189            +9.0%       8184    =
    interrupts.CPU21.NMI:Non-maskable_interrupts
      7511 =C2=B1 20%      +9.0%       8189            +9.0%       8184    =
    interrupts.CPU21.PMI:Performance_monitoring_interrupts
    310.50            -0.2%     309.83            +0.5%     312.00        i=
nterrupts.CPU21.RES:Rescheduling_interrupts
      3014 =C2=B1  3%      +1.6%       3063            +0.8%       3039 =C2=
=B1  3%  interrupts.CPU21.TLB:TLB_shootdowns
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
      3701            -0.4%       3685            +3.5%       3832 =C2=B1  =
5%  interrupts.CPU22.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU22.IWI:IRQ_work_interrupts
    563733 =C2=B1 16%      +7.4%     605522            +7.4%     605682    =
    interrupts.CPU22.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU22.MCP:Machine_check_polls
      7511 =C2=B1 20%      +9.0%       8189            -0.1%       7505 =C2=
=B1 20%  interrupts.CPU22.NMI:Non-maskable_interrupts
      7511 =C2=B1 20%      +9.0%       8189            -0.1%       7505 =C2=
=B1 20%  interrupts.CPU22.PMI:Performance_monitoring_interrupts
    311.00            -0.3%     310.00           +13.9%     354.17 =C2=B1 2=
6%  interrupts.CPU22.RES:Rescheduling_interrupts
      2856 =C2=B1  3%      -0.1%       2854 =C2=B1  3%      -0.2%       285=
2 =C2=B1  3%  interrupts.CPU22.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.175:PCI-MSI.77824-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.46:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.46:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.48:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.50:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU23.56:PCI-MSI.23592960-edge.nvme0q0
      3739            +0.1%       3742 =C2=B1  2%      +1.0%       3775    =
    interrupts.CPU23.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU23.IWI:IRQ_work_interrupts
    563735 =C2=B1 16%      +7.4%     605498            +7.4%     605663    =
    interrupts.CPU23.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU23.MCP:Machine_check_polls
      7512 =C2=B1 20%      +9.0%       8189            -0.1%       7505 =C2=
=B1 20%  interrupts.CPU23.NMI:Non-maskable_interrupts
      7512 =C2=B1 20%      +9.0%       8189            -0.1%       7505 =C2=
=B1 20%  interrupts.CPU23.PMI:Performance_monitoring_interrupts
    310.00            -0.2%     309.33            +0.3%     311.00        i=
nterrupts.CPU23.RES:Rescheduling_interrupts
      2979 =C2=B1  3%      +1.4%       3022 =C2=B1  4%      +1.9%       303=
6 =C2=B1  3%  interrupts.CPU23.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.178:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.179:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.45:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.47:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.49:PCI-MSI.33619968-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU24.50:PCI-MSI.33619968-edge.ioat-msix
      3837 =C2=B1  8%      +8.8%       4176 =C2=B1 13%      -0.9%       380=
1 =C2=B1  2%  interrupts.CPU24.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +10.0%       1.83 =C2=
=B1 20%  interrupts.CPU24.IWI:IRQ_work_interrupts
    564526 =C2=B1 16%      +7.3%     605473            +7.2%     605436    =
    interrupts.CPU24.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU24.MCP:Machine_check_polls
      6804 =C2=B1 28%     +20.0%       8167            +9.9%       7476 =C2=
=B1 20%  interrupts.CPU24.NMI:Non-maskable_interrupts
      6804 =C2=B1 28%     +20.0%       8167            +9.9%       7476 =C2=
=B1 20%  interrupts.CPU24.PMI:Performance_monitoring_interrupts
    367.67 =C2=B1 15%      -4.7%     350.50 =C2=B1 14%     -12.8%     320.6=
7 =C2=B1  3%  interrupts.CPU24.RES:Rescheduling_interrupts
      2770 =C2=B1  3%      +6.3%       2945 =C2=B1  7%      +7.7%       298=
4 =C2=B1  4%  interrupts.CPU24.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.180:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.181:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.49:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.50:PCI-MSI.33622016-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU25.51:PCI-MSI.33622016-edge.ioat-msix
      5639 =C2=B1 24%     -10.5%       5049 =C2=B1 24%     -14.8%       480=
5 =C2=B1 18%  interrupts.CPU25.CAL:Function_call_interrupts
      1.83 =C2=B1 20%     +27.3%       2.33 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU25.IWI:IRQ_work_interrupts
    565618 =C2=B1 15%      +7.1%     605555            +7.0%     605475    =
    interrupts.CPU25.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU25.MCP:Machine_check_polls
      7486 =C2=B1 20%      +9.1%       8169            +8.9%       8154    =
    interrupts.CPU25.NMI:Non-maskable_interrupts
      7486 =C2=B1 20%      +9.1%       8169            +8.9%       8154    =
    interrupts.CPU25.PMI:Performance_monitoring_interrupts
    495.83 =C2=B1 18%     -29.5%     349.50 =C2=B1  6%     -28.4%     354.8=
3 =C2=B1  6%  interrupts.CPU25.RES:Rescheduling_interrupts
      2983 =C2=B1  3%      +1.3%       3022 =C2=B1  3%      -4.6%       284=
6 =C2=B1  2%  interrupts.CPU25.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.181:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.182:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.50:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.51:PCI-MSI.33624064-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU26.52:PCI-MSI.33624064-edge.ioat-msix
      4631 =C2=B1 21%     +16.1%       5375 =C2=B1 19%     +34.0%       620=
7 =C2=B1 28%  interrupts.CPU26.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU26.IWI:IRQ_work_interrupts
    566110 =C2=B1 15%      +7.0%     605580            +7.0%     605507    =
    interrupts.CPU26.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU26.MCP:Machine_check_polls
      7487 =C2=B1 20%      +9.1%       8169            +8.9%       8157    =
    interrupts.CPU26.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      +9.1%       8169            +8.9%       8157    =
    interrupts.CPU26.PMI:Performance_monitoring_interrupts
    378.33 =C2=B1 24%     +24.7%     471.67 =C2=B1 25%     +42.2%     538.0=
0 =C2=B1 51%  interrupts.CPU26.RES:Rescheduling_interrupts
      2910 =C2=B1  4%      -0.1%       2908 =C2=B1  3%      +3.1%       299=
9 =C2=B1  3%  interrupts.CPU26.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.182:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.183:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.51:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.52:PCI-MSI.33626112-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU27.53:PCI-MSI.33626112-edge.ioat-msix
      4062 =C2=B1 17%     +22.8%       4990 =C2=B1 50%      -6.6%       379=
5        interrupts.CPU27.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +20.0%       2.00    =
    interrupts.CPU27.IWI:IRQ_work_interrupts
    565827 =C2=B1 15%      +7.0%     605396            +7.0%     605498    =
    interrupts.CPU27.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU27.MCP:Machine_check_polls
      6808 =C2=B1 28%     +20.0%       8169           +19.8%       8155    =
    interrupts.CPU27.NMI:Non-maskable_interrupts
      6808 =C2=B1 28%     +20.0%       8169           +19.8%       8155    =
    interrupts.CPU27.PMI:Performance_monitoring_interrupts
    360.33 =C2=B1 32%     +44.5%     520.67 =C2=B1 57%      -9.7%     325.5=
0 =C2=B1  8%  interrupts.CPU27.RES:Rescheduling_interrupts
      2984 =C2=B1  3%      -0.2%       2977 =C2=B1  4%      -0.6%       296=
5 =C2=B1  5%  interrupts.CPU27.TLB:TLB_shootdowns
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
      3724 =C2=B1  2%      +3.7%       3862 =C2=B1  8%      +0.7%       375=
0        interrupts.CPU28.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +20.0%       2.00    =
    interrupts.CPU28.IWI:IRQ_work_interrupts
    565401 =C2=B1 15%      +7.1%     605510            +7.1%     605492    =
    interrupts.CPU28.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU28.MCP:Machine_check_polls
      6808 =C2=B1 28%     +20.0%       8170           +19.8%       8155    =
    interrupts.CPU28.NMI:Non-maskable_interrupts
      6808 =C2=B1 28%     +20.0%       8170           +19.8%       8155    =
    interrupts.CPU28.PMI:Performance_monitoring_interrupts
    308.50            +9.6%     338.17 =C2=B1 19%      +0.1%     308.83    =
    interrupts.CPU28.RES:Rescheduling_interrupts
      2911 =C2=B1  4%      -1.2%       2875 =C2=B1  3%      +2.0%       297=
0 =C2=B1  3%  interrupts.CPU28.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.184:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.185:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.53:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.54:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.55:PCI-MSI.33630208-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU29.56:PCI-MSI.33630208-edge.ioat-msix
      3992 =C2=B1 13%      -6.8%       3721            -5.6%       3768 =C2=
=B1  2%  interrupts.CPU29.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU29.IWI:IRQ_work_interrupts
    565630 =C2=B1 15%      +7.0%     605501            +7.0%     605467    =
    interrupts.CPU29.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU29.MCP:Machine_check_polls
      7492 =C2=B1 20%      +9.0%       8169            +8.9%       8156    =
    interrupts.CPU29.NMI:Non-maskable_interrupts
      7492 =C2=B1 20%      +9.0%       8169            +8.9%       8156    =
    interrupts.CPU29.PMI:Performance_monitoring_interrupts
    395.00 =C2=B1 48%     -21.9%     308.33           -22.0%     308.17    =
    interrupts.CPU29.RES:Rescheduling_interrupts
      3002 =C2=B1  3%      -0.1%       2998 =C2=B1  4%      -0.9%       297=
4 =C2=B1  5%  interrupts.CPU29.TLB:TLB_shootdowns
      4164 =C2=B1 16%      -2.8%       4047 =C2=B1 19%     -10.2%       373=
9 =C2=B1  2%  interrupts.CPU3.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00 =C2=B1 28%      -9.1%       1.6=
7 =C2=B1 28%  interrupts.CPU3.IWI:IRQ_work_interrupts
    563688 =C2=B1 16%      +7.4%     605511            +7.5%     605728    =
    interrupts.CPU3.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU3.MCP:Machine_check_polls
      7509 =C2=B1 20%      -0.1%       7505 =C2=B1 20%      -9.2%       682=
1 =C2=B1 28%  interrupts.CPU3.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      -0.1%       7505 =C2=B1 20%      -9.2%       682=
1 =C2=B1 28%  interrupts.CPU3.PMI:Performance_monitoring_interrupts
    389.00 =C2=B1 26%      -2.1%     380.67 =C2=B1 34%     -15.4%     329.0=
0        interrupts.CPU3.RES:Rescheduling_interrupts
      2920 =C2=B1  4%      -1.4%       2878 =C2=B1  4%      +0.6%       293=
8 =C2=B1  4%  interrupts.CPU3.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.185:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.186:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.54:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.55:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.56:PCI-MSI.33632256-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU30.57:PCI-MSI.33632256-edge.ioat-msix
      3714 =C2=B1  2%      +0.7%       3740 =C2=B1  2%      +1.4%       376=
4        interrupts.CPU30.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU30.IWI:IRQ_work_interrupts
    565440 =C2=B1 15%      +7.1%     605499            +7.1%     605465    =
    interrupts.CPU30.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU30.MCP:Machine_check_polls
      7491 =C2=B1 20%      +9.1%       8170            +8.9%       8155    =
    interrupts.CPU30.NMI:Non-maskable_interrupts
      7491 =C2=B1 20%      +9.1%       8170            +8.9%       8155    =
    interrupts.CPU30.PMI:Performance_monitoring_interrupts
    310.17            -0.8%     307.83            -0.5%     308.67        i=
nterrupts.CPU30.RES:Rescheduling_interrupts
      2923 =C2=B1  4%      -1.6%       2877 =C2=B1  3%      +1.7%       297=
3 =C2=B1  3%  interrupts.CPU30.TLB:TLB_shootdowns
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
      3786 =C2=B1  2%      +0.5%       3805            -3.5%       3654 =C2=
=B1  5%  interrupts.CPU31.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU31.IWI:IRQ_work_interrupts
    565927 =C2=B1 15%      +7.0%     605431            +7.0%     605429    =
    interrupts.CPU31.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU31.MCP:Machine_check_polls
      7492 =C2=B1 20%      -0.1%       7487 =C2=B1 20%      +8.8%       815=
4        interrupts.CPU31.NMI:Non-maskable_interrupts
      7492 =C2=B1 20%      -0.1%       7487 =C2=B1 20%      +8.8%       815=
4        interrupts.CPU31.PMI:Performance_monitoring_interrupts
    313.67 =C2=B1  3%      -0.6%     311.67            -0.6%     311.67    =
    interrupts.CPU31.RES:Rescheduling_interrupts
      3002 =C2=B1  3%      +1.4%       3045            -3.1%       2909 =C2=
=B1  5%  interrupts.CPU31.TLB:TLB_shootdowns
      3735 =C2=B1  3%      -0.6%       3715            +0.2%       3744    =
    interrupts.CPU32.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU32.IWI:IRQ_work_interrupts
    565930 =C2=B1 15%      +7.0%     605511            +7.0%     605468    =
    interrupts.CPU32.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU32.MCP:Machine_check_polls
      7491 =C2=B1 20%      -0.0%       7488 =C2=B1 20%      +8.9%       815=
6        interrupts.CPU32.NMI:Non-maskable_interrupts
      7491 =C2=B1 20%      -0.0%       7488 =C2=B1 20%      +8.9%       815=
6        interrupts.CPU32.PMI:Performance_monitoring_interrupts
    308.83            +0.0%     308.83            +0.1%     309.17        i=
nterrupts.CPU32.RES:Rescheduling_interrupts
      2960 =C2=B1  5%      -2.6%       2884 =C2=B1  3%      +0.4%       297=
2 =C2=B1  3%  interrupts.CPU32.TLB:TLB_shootdowns
      3763            -0.1%       3758            -0.2%       3754 =C2=B1  =
2%  interrupts.CPU33.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU33.IWI:IRQ_work_interrupts
    566093 =C2=B1 15%      +7.0%     605502            +7.0%     605465    =
    interrupts.CPU33.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU33.MCP:Machine_check_polls
      8169            -8.3%       7487 =C2=B1 20%      -0.2%       8155    =
    interrupts.CPU33.NMI:Non-maskable_interrupts
      8169            -8.3%       7487 =C2=B1 20%      -0.2%       8155    =
    interrupts.CPU33.PMI:Performance_monitoring_interrupts
    312.50 =C2=B1  3%      -1.2%     308.83            -1.2%     308.83    =
    interrupts.CPU33.RES:Rescheduling_interrupts
      3000 =C2=B1  3%      +0.2%       3008 =C2=B1  4%      -2.2%       293=
5 =C2=B1  5%  interrupts.CPU33.TLB:TLB_shootdowns
      3711 =C2=B1  2%      -0.0%       3710            +1.4%       3765    =
    interrupts.CPU34.CAL:Function_call_interrupts
      1.67 =C2=B1 28%      +0.0%       1.67 =C2=B1 28%     +20.0%       2.0=
0        interrupts.CPU34.IWI:IRQ_work_interrupts
    565606 =C2=B1 15%      +7.1%     605485            +7.0%     605481    =
    interrupts.CPU34.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU34.MCP:Machine_check_polls
      6809 =C2=B1 28%      -0.1%       6804 =C2=B1 28%     +19.8%       815=
5        interrupts.CPU34.NMI:Non-maskable_interrupts
      6809 =C2=B1 28%      -0.1%       6804 =C2=B1 28%     +19.8%       815=
5        interrupts.CPU34.PMI:Performance_monitoring_interrupts
    308.17            +1.7%     313.33 =C2=B1  2%      +0.0%     308.17    =
    interrupts.CPU34.RES:Rescheduling_interrupts
      2932 =C2=B1  4%      -2.9%       2847            +1.7%       2982 =C2=
=B1  3%  interrupts.CPU34.TLB:TLB_shootdowns
      3748            +1.0%       3788            +0.4%       3763        i=
nterrupts.CPU35.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +9.1%       2.0=
0        interrupts.CPU35.IWI:IRQ_work_interrupts
    565179 =C2=B1 15%      +7.1%     605488            +7.1%     605486    =
    interrupts.CPU35.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU35.MCP:Machine_check_polls
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      +8.9%       815=
6        interrupts.CPU35.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      +8.9%       815=
6        interrupts.CPU35.PMI:Performance_monitoring_interrupts
    308.17            +0.6%     310.00            +0.2%     308.83        i=
nterrupts.CPU35.RES:Rescheduling_interrupts
      3007 =C2=B1  3%      +1.5%       3053 =C2=B1  3%      -0.9%       298=
0 =C2=B1  4%  interrupts.CPU35.TLB:TLB_shootdowns
      3831 =C2=B1  4%      -3.3%       3705            -1.7%       3765    =
    interrupts.CPU36.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +9.1%       2.0=
0        interrupts.CPU36.IWI:IRQ_work_interrupts
    565420 =C2=B1 15%      +7.1%     605501            +7.1%     605475    =
    interrupts.CPU36.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU36.MCP:Machine_check_polls
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      +8.9%       815=
5        interrupts.CPU36.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      +8.9%       815=
5        interrupts.CPU36.PMI:Performance_monitoring_interrupts
    332.50 =C2=B1 17%      -7.7%     307.00            -7.3%     308.33    =
    interrupts.CPU36.RES:Rescheduling_interrupts
      2938 =C2=B1  4%      -1.5%       2894 =C2=B1  3%      +1.5%       298=
2 =C2=B1  3%  interrupts.CPU36.TLB:TLB_shootdowns
      3778 =C2=B1  2%      +1.4%       3832 =C2=B1  4%      -2.8%       367=
3 =C2=B1  3%  interrupts.CPU37.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +9.1%       2.0=
0        interrupts.CPU37.IWI:IRQ_work_interrupts
    566017 =C2=B1 15%      +7.0%     605499            +7.0%     605486    =
    interrupts.CPU37.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU37.MCP:Machine_check_polls
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      +8.9%       815=
5        interrupts.CPU37.NMI:Non-maskable_interrupts
      7487 =C2=B1 20%      -9.1%       6805 =C2=B1 28%      +8.9%       815=
5        interrupts.CPU37.PMI:Performance_monitoring_interrupts
    309.67            +6.7%     330.33 =C2=B1 15%      +0.1%     309.83    =
    interrupts.CPU37.RES:Rescheduling_interrupts
      3012 =C2=B1  3%      +1.4%       3053 =C2=B1  3%      -1.0%       298=
1 =C2=B1  4%  interrupts.CPU37.TLB:TLB_shootdowns
      3726            -0.9%       3692            +1.5%       3783        i=
nterrupts.CPU38.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU38.IWI:IRQ_work_interrupts
    566056 =C2=B1 15%      +7.0%     605521            +7.0%     605484    =
    interrupts.CPU38.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU38.MCP:Machine_check_polls
      8170            -8.4%       7487 =C2=B1 20%      -0.2%       8155    =
    interrupts.CPU38.NMI:Non-maskable_interrupts
      8170            -8.4%       7487 =C2=B1 20%      -0.2%       8155    =
    interrupts.CPU38.PMI:Performance_monitoring_interrupts
    310.67 =C2=B1  2%      -0.8%     308.17            -0.6%     308.83    =
    interrupts.CPU38.RES:Rescheduling_interrupts
      2942 =C2=B1  4%      -3.1%       2852            +2.7%       3022 =C2=
=B1  2%  interrupts.CPU38.TLB:TLB_shootdowns
      4027 =C2=B1 13%      -6.3%       3771            -7.2%       3738 =C2=
=B1  2%  interrupts.CPU39.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU39.IWI:IRQ_work_interrupts
    565984 =C2=B1 15%      +7.0%     605505            +7.0%     605469    =
    interrupts.CPU39.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU39.MCP:Machine_check_polls
      8170            -8.4%       7486 =C2=B1 20%      -0.2%       8154    =
    interrupts.CPU39.NMI:Non-maskable_interrupts
      8170            -8.4%       7486 =C2=B1 20%      -0.2%       8154    =
    interrupts.CPU39.PMI:Performance_monitoring_interrupts
    414.00 =C2=B1 35%     -25.4%     308.67           -25.6%     308.00    =
    interrupts.CPU39.RES:Rescheduling_interrupts
      3023 =C2=B1  3%      +0.8%       3048 =C2=B1  3%      -2.4%       295=
1 =C2=B1  5%  interrupts.CPU39.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU4.27:PCI-MSI.17825792-edge.PCIe.PME,pciehp
      3672 =C2=B1  2%      +0.5%       3689            +1.5%       3728 =C2=
=B1  3%  interrupts.CPU4.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU4.IWI:IRQ_work_interrupts
    563563 =C2=B1 16%      +7.4%     605502            +7.5%     605709    =
    interrupts.CPU4.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU4.MCP:Machine_check_polls
      7509 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +9.0%       818=
6        interrupts.CPU4.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +9.0%       818=
6        interrupts.CPU4.PMI:Performance_monitoring_interrupts
    313.83            +0.0%     313.83            +1.7%     319.17 =C2=B1  =
2%  interrupts.CPU4.RES:Rescheduling_interrupts
      2828 =C2=B1  4%      -0.9%       2801 =C2=B1  3%      +0.9%       285=
4 =C2=B1  5%  interrupts.CPU4.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU40.67:PCI-MSI.23592977-edge.nvme0q17
      3775            -1.6%       3715            +0.9%       3807        i=
nterrupts.CPU40.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU40.IWI:IRQ_work_interrupts
    564604 =C2=B1 16%      +7.2%     605499            +7.2%     605475    =
    interrupts.CPU40.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU40.MCP:Machine_check_polls
      8170            -8.4%       7486 =C2=B1 20%      -0.2%       8154    =
    interrupts.CPU40.NMI:Non-maskable_interrupts
      8170            -8.4%       7486 =C2=B1 20%      -0.2%       8154    =
    interrupts.CPU40.PMI:Performance_monitoring_interrupts
    466.50 =C2=B1 75%     -34.1%     307.33           -33.8%     308.67    =
    interrupts.CPU40.RES:Rescheduling_interrupts
      2987 =C2=B1  4%      -3.0%       2898 =C2=B1  2%      +1.5%       303=
1 =C2=B1  2%  interrupts.CPU40.TLB:TLB_shootdowns
      3772            +0.8%       3801            +0.7%       3799 =C2=B1  =
2%  interrupts.CPU41.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU41.IWI:IRQ_work_interrupts
    565516 =C2=B1 15%      +7.1%     605495            +7.1%     605482    =
    interrupts.CPU41.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU41.MCP:Machine_check_polls
      8170            -8.4%       7486 =C2=B1 20%      -0.2%       8154    =
    interrupts.CPU41.NMI:Non-maskable_interrupts
      8170            -8.4%       7486 =C2=B1 20%      -0.2%       8154    =
    interrupts.CPU41.PMI:Performance_monitoring_interrupts
    309.33            +0.3%     310.33            -0.4%     308.00        i=
nterrupts.CPU41.RES:Rescheduling_interrupts
      3021 =C2=B1  3%      +1.3%       3059 =C2=B1  3%      +0.2%       302=
6 =C2=B1  3%  interrupts.CPU41.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU42.76:PCI-MSI.23592979-edge.nvme0q19
      3655 =C2=B1  4%      +3.9%       3796 =C2=B1  4%      +3.2%       377=
1        interrupts.CPU42.CAL:Function_call_interrupts
      2.00           -25.0%       1.50 =C2=B1 33%      +0.0%       2.00    =
    interrupts.CPU42.IWI:IRQ_work_interrupts
    565572 =C2=B1 15%      +7.1%     605500            +7.1%     605482    =
    interrupts.CPU42.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU42.MCP:Machine_check_polls
      8170           -25.1%       6122 =C2=B1 33%      -0.2%       8154    =
    interrupts.CPU42.NMI:Non-maskable_interrupts
      8170           -25.1%       6122 =C2=B1 33%      -0.2%       8154    =
    interrupts.CPU42.PMI:Performance_monitoring_interrupts
    310.00            +7.1%     332.00 =C2=B1 16%      -0.8%     307.67    =
    interrupts.CPU42.RES:Rescheduling_interrupts
      2957 =C2=B1  4%      -0.4%       2946 =C2=B1  3%      +1.3%       299=
7 =C2=B1  3%  interrupts.CPU42.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU43.77:PCI-MSI.23592980-edge.nvme0q20
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU43.80:PCI-MSI.23592980-edge.nvme0q20
      3939 =C2=B1  9%      -3.9%       3784            -4.4%       3764 =C2=
=B1  2%  interrupts.CPU43.CAL:Function_call_interrupts
      2.00           -25.0%       1.50 =C2=B1 33%      +0.0%       2.00    =
    interrupts.CPU43.IWI:IRQ_work_interrupts
    565500 =C2=B1 15%      +7.1%     605500            +7.1%     605517    =
    interrupts.CPU43.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU43.MCP:Machine_check_polls
      8170           -25.0%       6127 =C2=B1 33%      -0.2%       8153    =
    interrupts.CPU43.NMI:Non-maskable_interrupts
      8170           -25.0%       6127 =C2=B1 33%      -0.2%       8153    =
    interrupts.CPU43.PMI:Performance_monitoring_interrupts
    340.83 =C2=B1 21%      -9.4%     308.67            -9.7%     307.83    =
    interrupts.CPU43.RES:Rescheduling_interrupts
      3023 =C2=B1  3%      +1.3%       3063 =C2=B1  3%      -1.1%       299=
0 =C2=B1  4%  interrupts.CPU43.TLB:TLB_shootdowns
      3733            -0.4%       3720            +1.2%       3777        i=
nterrupts.CPU44.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU44.IWI:IRQ_work_interrupts
    565898 =C2=B1 15%      +7.0%     605559            +7.0%     605489    =
    interrupts.CPU44.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU44.MCP:Machine_check_polls
      8169           -16.6%       6810 =C2=B1 28%      -0.2%       8152    =
    interrupts.CPU44.NMI:Non-maskable_interrupts
      8169           -16.6%       6810 =C2=B1 28%      -0.2%       8152    =
    interrupts.CPU44.PMI:Performance_monitoring_interrupts
    459.33 =C2=B1 73%     -33.1%     307.17           -32.9%     308.17    =
    interrupts.CPU44.RES:Rescheduling_interrupts
      2918 =C2=B1  3%      -0.3%       2909 =C2=B1  2%      +3.1%       300=
8 =C2=B1  3%  interrupts.CPU44.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU45.79:PCI-MSI.23592982-edge.nvme0q22
      4095 =C2=B1 17%      -8.0%       3768            -8.1%       3762    =
    interrupts.CPU45.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU45.IWI:IRQ_work_interrupts
    565459 =C2=B1 15%      +7.1%     605499            +7.1%     605374    =
    interrupts.CPU45.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU45.MCP:Machine_check_polls
      8169           -16.6%       6810 =C2=B1 28%      -0.2%       8154    =
    interrupts.CPU45.NMI:Non-maskable_interrupts
      8169           -16.6%       6810 =C2=B1 28%      -0.2%       8154    =
    interrupts.CPU45.PMI:Performance_monitoring_interrupts
    524.00 =C2=B1 64%     -41.1%     308.67           -41.1%     308.83    =
    interrupts.CPU45.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      +1.3%       3069 =C2=B1  3%      -1.1%       299=
8 =C2=B1  4%  interrupts.CPU45.TLB:TLB_shootdowns
      3743 =C2=B1  2%      -0.7%       3715            +0.4%       3756    =
    interrupts.CPU46.CAL:Function_call_interrupts
      2.00           -16.7%       1.67 =C2=B1 28%      +0.0%       2.00    =
    interrupts.CPU46.IWI:IRQ_work_interrupts
    565770 =C2=B1 15%      +7.0%     605518            +7.0%     605456    =
    interrupts.CPU46.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU46.MCP:Machine_check_polls
      8169           -16.6%       6809 =C2=B1 28%      -0.2%       8154    =
    interrupts.CPU46.NMI:Non-maskable_interrupts
      8169           -16.6%       6809 =C2=B1 28%      -0.2%       8154    =
    interrupts.CPU46.PMI:Performance_monitoring_interrupts
    308.83            +0.0%     308.83            -0.2%     308.33        i=
nterrupts.CPU46.RES:Rescheduling_interrupts
      2967 =C2=B1  4%      -1.7%       2915 =C2=B1  2%      +0.0%       296=
8 =C2=B1  3%  interrupts.CPU46.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU47.68:PCI-MSI.23592984-edge.nvme0q24
      3804            -0.3%       3792            -1.2%       3758 =C2=B1  =
2%  interrupts.CPU47.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU47.IWI:IRQ_work_interrupts
    565451 =C2=B1 15%      +7.1%     605509            +7.1%     605462    =
    interrupts.CPU47.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU47.MCP:Machine_check_polls
      7491 =C2=B1 20%      -9.1%       6809 =C2=B1 28%      -0.2%       747=
7 =C2=B1 20%  interrupts.CPU47.NMI:Non-maskable_interrupts
      7491 =C2=B1 20%      -9.1%       6809 =C2=B1 28%      -0.2%       747=
7 =C2=B1 20%  interrupts.CPU47.PMI:Performance_monitoring_interrupts
    326.17 =C2=B1  8%      -1.1%     322.50 =C2=B1 10%      -5.3%     308.8=
3        interrupts.CPU47.RES:Rescheduling_interrupts
      3084 =C2=B1  2%      -1.9%       3027 =C2=B1  4%      -3.8%       296=
6 =C2=B1  5%  interrupts.CPU47.TLB:TLB_shootdowns
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
      4024 =C2=B1  9%      +0.5%       4043 =C2=B1  8%      -3.6%       388=
0        interrupts.CPU48.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      -5.9%       2.67 =C2=B1 17%      +0.0%       2.8=
3 =C2=B1 13%  interrupts.CPU48.IWI:IRQ_work_interrupts
    565900 =C2=B1 15%      +7.0%     605598            +7.0%     605526    =
    interrupts.CPU48.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU48.MCP:Machine_check_polls
      7821 =C2=B1 20%      -9.1%       7112 =C2=B1 28%      -0.1%       781=
4 =C2=B1 20%  interrupts.CPU48.NMI:Non-maskable_interrupts
      7821 =C2=B1 20%      -9.1%       7112 =C2=B1 28%      -0.1%       781=
4 =C2=B1 20%  interrupts.CPU48.PMI:Performance_monitoring_interrupts
    370.17 =C2=B1 23%      -3.4%     357.50 =C2=B1 15%      -8.1%     340.1=
7 =C2=B1  8%  interrupts.CPU48.RES:Rescheduling_interrupts
      2969 =C2=B1  2%      -0.3%       2960 =C2=B1  2%      +1.7%       301=
9 =C2=B1  2%  interrupts.CPU48.TLB:TLB_shootdowns
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
      5387 =C2=B1 19%      -2.2%       5271 =C2=B1 20%     -10.0%       484=
9 =C2=B1 18%  interrupts.CPU49.CAL:Function_call_interrupts
      2.83 =C2=B1 13%     -11.8%       2.50 =C2=B1 20%      -5.9%       2.6=
7 =C2=B1 17%  interrupts.CPU49.IWI:IRQ_work_interrupts
    566308 =C2=B1 15%      +6.9%     605629            +6.9%     605535    =
    interrupts.CPU49.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU49.MCP:Machine_check_polls
      7823 =C2=B1 20%     -18.2%       6401 =C2=B1 33%      -9.1%       710=
8 =C2=B1 28%  interrupts.CPU49.NMI:Non-maskable_interrupts
      7823 =C2=B1 20%     -18.2%       6401 =C2=B1 33%      -9.1%       710=
8 =C2=B1 28%  interrupts.CPU49.PMI:Performance_monitoring_interrupts
    413.17 =C2=B1 17%      -9.5%     373.83 =C2=B1 14%     -13.7%     356.6=
7 =C2=B1 11%  interrupts.CPU49.RES:Rescheduling_interrupts
      2922 =C2=B1  3%      +5.1%       3072 =C2=B1  3%      +0.2%       292=
8 =C2=B1  3%  interrupts.CPU49.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU5.29:PCI-MSI.23068672-edge.PCIe.PME,pciehp
      3686            +0.5%       3705 =C2=B1  2%      +1.8%       3754    =
    interrupts.CPU5.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +9.1%       2.00    =
    interrupts.CPU5.IWI:IRQ_work_interrupts
    563989 =C2=B1 16%      +7.4%     605524            +7.4%     605724    =
    interrupts.CPU5.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU5.MCP:Machine_check_polls
      7508 =C2=B1 20%      +9.1%       8188            +9.0%       8185    =
    interrupts.CPU5.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      +9.1%       8188            +9.0%       8185    =
    interrupts.CPU5.PMI:Performance_monitoring_interrupts
    312.00            +0.0%     312.00            +0.2%     312.67        i=
nterrupts.CPU5.RES:Rescheduling_interrupts
      2978 =C2=B1  3%      -1.7%       2927 =C2=B1  4%      +0.1%       298=
0 =C2=B1  3%  interrupts.CPU5.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.191:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.192:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.62:PCI-MSI.67178496-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU50.63:PCI-MSI.67178496-edge.ioat-msix
      5001 =C2=B1 32%      -8.8%       4561 =C2=B1 20%      -0.9%       495=
8 =C2=B1 36%  interrupts.CPU50.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      -5.9%       2.67 =C2=B1 17%      -5.9%       2.6=
7 =C2=B1 17%  interrupts.CPU50.IWI:IRQ_work_interrupts
    566216 =C2=B1 15%      +7.0%     605619            +6.9%     605494    =
    interrupts.CPU50.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU50.MCP:Machine_check_polls
      7823 =C2=B1 20%      -9.1%       7110 =C2=B1 28%      -9.2%       710=
7 =C2=B1 28%  interrupts.CPU50.NMI:Non-maskable_interrupts
      7823 =C2=B1 20%      -9.1%       7110 =C2=B1 28%      -9.2%       710=
7 =C2=B1 28%  interrupts.CPU50.PMI:Performance_monitoring_interrupts
    638.17 =C2=B1 90%     -26.4%     469.67 =C2=B1 29%     -27.8%     460.6=
7 =C2=B1 53%  interrupts.CPU50.RES:Rescheduling_interrupts
      3006 =C2=B1  3%      -2.7%       2925 =C2=B1  2%      +0.3%       301=
6 =C2=B1  3%  interrupts.CPU50.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.192:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.193:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.62:PCI-MSI.67180544-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU51.65:PCI-MSI.67180544-edge.ioat-msix
      4028 =C2=B1 13%      -5.6%       3802 =C2=B1  2%      -5.1%       382=
1 =C2=B1  2%  interrupts.CPU51.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +0.0%       2.83 =C2=B1 13%     -11.8%       2.5=
0 =C2=B1 20%  interrupts.CPU51.IWI:IRQ_work_interrupts
    565755 =C2=B1 15%      +7.0%     605587            +7.0%     605479    =
    interrupts.CPU51.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU51.MCP:Machine_check_polls
      7822 =C2=B1 20%      -0.0%       7822 =C2=B1 20%     -18.3%       639=
1 =C2=B1 33%  interrupts.CPU51.NMI:Non-maskable_interrupts
      7822 =C2=B1 20%      -0.0%       7822 =C2=B1 20%     -18.3%       639=
1 =C2=B1 33%  interrupts.CPU51.PMI:Performance_monitoring_interrupts
    354.17 =C2=B1 27%     -10.6%     316.67 =C2=B1  4%     -10.5%     316.8=
3 =C2=B1  6%  interrupts.CPU51.RES:Rescheduling_interrupts
      3007 =C2=B1  4%      +2.6%       3086 =C2=B1  3%      +0.4%       301=
9 =C2=B1  4%  interrupts.CPU51.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.193:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.194:PCI-MSI.67182592-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU52.66:PCI-MSI.67182592-edge.ioat-msix
      3938 =C2=B1  9%      -5.6%       3716 =C2=B1  2%      -4.3%       377=
0        interrupts.CPU52.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      -5.9%       2.67 =C2=B1 17%     -11.8%       2.5=
0 =C2=B1 20%  interrupts.CPU52.IWI:IRQ_work_interrupts
    565559 =C2=B1 15%      +7.1%     605583            +7.1%     605484    =
    interrupts.CPU52.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU52.MCP:Machine_check_polls
      7826 =C2=B1 20%      -9.1%       7114 =C2=B1 28%     -18.3%       639=
1 =C2=B1 33%  interrupts.CPU52.NMI:Non-maskable_interrupts
      7826 =C2=B1 20%      -9.1%       7114 =C2=B1 28%     -18.3%       639=
1 =C2=B1 33%  interrupts.CPU52.PMI:Performance_monitoring_interrupts
    406.00 =C2=B1 28%     -11.5%     359.50 =C2=B1 31%     -23.3%     311.3=
3        interrupts.CPU52.RES:Rescheduling_interrupts
      3012 =C2=B1  3%      -2.6%       2933 =C2=B1  2%      +0.3%       302=
2 =C2=B1  3%  interrupts.CPU52.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.194:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.195:PCI-MSI.67184640-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU53.67:PCI-MSI.67184640-edge.ioat-msix
      3742            +1.0%       3780            +0.1%       3745        i=
nterrupts.CPU53.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%     -11.1%       2.67 =C2=
=B1 17%  interrupts.CPU53.IWI:IRQ_work_interrupts
    565855 =C2=B1 15%      +7.0%     605588            +7.0%     605538    =
    interrupts.CPU53.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU53.MCP:Machine_check_polls
      8536           -16.7%       7114 =C2=B1 28%     -16.8%       7101 =C2=
=B1 28%  interrupts.CPU53.NMI:Non-maskable_interrupts
      8536           -16.7%       7114 =C2=B1 28%     -16.8%       7101 =C2=
=B1 28%  interrupts.CPU53.PMI:Performance_monitoring_interrupts
    308.17           +49.8%     461.67 =C2=B1 72%      +0.4%     309.33    =
    interrupts.CPU53.RES:Rescheduling_interrupts
      2984 =C2=B1  3%      +3.2%       3079 =C2=B1  3%      +1.4%       302=
5 =C2=B1  4%  interrupts.CPU53.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.195:PCI-MSI.67186688-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU54.196:PCI-MSI.67186688-edge.ioat-msix
      3685 =C2=B1  4%      +0.5%       3703            +0.2%       3693 =C2=
=B1  4%  interrupts.CPU54.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      -5.9%       2.67 =C2=B1 17%      -5.9%       2.6=
7 =C2=B1 17%  interrupts.CPU54.IWI:IRQ_work_interrupts
    566016 =C2=B1 15%      +7.0%     605583            +7.0%     605499    =
    interrupts.CPU54.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU54.MCP:Machine_check_polls
      7829 =C2=B1 20%      -9.1%       7114 =C2=B1 28%      -9.3%       710=
2 =C2=B1 28%  interrupts.CPU54.NMI:Non-maskable_interrupts
      7829 =C2=B1 20%      -9.1%       7114 =C2=B1 28%      -9.3%       710=
2 =C2=B1 28%  interrupts.CPU54.PMI:Performance_monitoring_interrupts
    311.33            -1.3%     307.33            -0.7%     309.17        i=
nterrupts.CPU54.RES:Rescheduling_interrupts
      3015 =C2=B1  3%      -2.6%       2938 =C2=B1  2%      +0.4%       302=
8 =C2=B1  3%  interrupts.CPU54.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.196:PCI-MSI.67188736-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU55.197:PCI-MSI.67188736-edge.ioat-msix
      3962 =C2=B1 13%      -3.8%       3811 =C2=B1  3%      -4.7%       377=
6 =C2=B1  2%  interrupts.CPU55.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%     -11.1%       2.67 =C2=
=B1 17%  interrupts.CPU55.IWI:IRQ_work_interrupts
    566315 =C2=B1 15%      +6.9%     605584            +6.9%     605530    =
    interrupts.CPU55.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU55.MCP:Machine_check_polls
      8536           -16.7%       7113 =C2=B1 28%     -16.8%       7101 =C2=
=B1 28%  interrupts.CPU55.NMI:Non-maskable_interrupts
      8536           -16.7%       7113 =C2=B1 28%     -16.8%       7101 =C2=
=B1 28%  interrupts.CPU55.PMI:Performance_monitoring_interrupts
    374.50 =C2=B1 39%     -13.4%     324.50 =C2=B1  8%     -17.8%     307.8=
3        interrupts.CPU55.RES:Rescheduling_interrupts
      2989 =C2=B1  3%      +3.4%       3091 =C2=B1  3%      +1.4%       303=
0 =C2=B1  4%  interrupts.CPU55.TLB:TLB_shootdowns
      3755 =C2=B1  2%      -1.1%       3714            +2.1%       3833 =C2=
=B1  2%  interrupts.CPU56.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%     -11.1%       2.67 =C2=
=B1 17%  interrupts.CPU56.IWI:IRQ_work_interrupts
    565929 =C2=B1 15%      +7.0%     605584            +7.0%     605453    =
    interrupts.CPU56.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU56.MCP:Machine_check_polls
      8537           -16.7%       7114 =C2=B1 28%     -16.8%       7101 =C2=
=B1 28%  interrupts.CPU56.NMI:Non-maskable_interrupts
      8537           -16.7%       7114 =C2=B1 28%     -16.8%       7101 =C2=
=B1 28%  interrupts.CPU56.PMI:Performance_monitoring_interrupts
    307.83            -0.2%     307.33            +8.1%     332.67 =C2=B1 1=
1%  interrupts.CPU56.RES:Rescheduling_interrupts
      3030 =C2=B1  3%      -1.5%       2985 =C2=B1  2%      +0.1%       303=
3 =C2=B1  3%  interrupts.CPU56.TLB:TLB_shootdowns
      3719 =C2=B1  2%      +1.7%       3781            +0.9%       3754    =
    interrupts.CPU57.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%     -16.7%       2.50 =C2=
=B1 20%  interrupts.CPU57.IWI:IRQ_work_interrupts
    565660 =C2=B1 15%      +7.1%     605575            +7.0%     605475    =
    interrupts.CPU57.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU57.MCP:Machine_check_polls
      8537           -16.7%       7113 =C2=B1 28%     -25.1%       6391 =C2=
=B1 33%  interrupts.CPU57.NMI:Non-maskable_interrupts
      8537           -16.7%       7113 =C2=B1 28%     -25.1%       6391 =C2=
=B1 33%  interrupts.CPU57.PMI:Performance_monitoring_interrupts
    307.33            +0.5%     309.00            +0.1%     307.67        i=
nterrupts.CPU57.RES:Rescheduling_interrupts
      3020 =C2=B1  4%      +2.4%       3094 =C2=B1  3%      +0.4%       303=
2 =C2=B1  4%  interrupts.CPU57.TLB:TLB_shootdowns
      3817 =C2=B1  5%      -2.7%       3715            -1.6%       3755    =
    interrupts.CPU58.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +0.0%       2.83 =C2=B1 13%     -11.8%       2.5=
0 =C2=B1 20%  interrupts.CPU58.IWI:IRQ_work_interrupts
    565759 =C2=B1 15%      +7.0%     605568            +7.0%     605476    =
    interrupts.CPU58.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU58.MCP:Machine_check_polls
      7828 =C2=B1 20%      -0.1%       7822 =C2=B1 20%     -18.4%       639=
2 =C2=B1 33%  interrupts.CPU58.NMI:Non-maskable_interrupts
      7828 =C2=B1 20%      -0.1%       7822 =C2=B1 20%     -18.4%       639=
2 =C2=B1 33%  interrupts.CPU58.PMI:Performance_monitoring_interrupts
    330.00 =C2=B1 15%      -6.9%     307.17            -7.0%     307.00    =
    interrupts.CPU58.RES:Rescheduling_interrupts
      3025 =C2=B1  4%      -2.5%       2949 =C2=B1  2%      +0.5%       304=
0 =C2=B1  3%  interrupts.CPU58.TLB:TLB_shootdowns
      3746 =C2=B1  3%      +5.7%       3958 =C2=B1 10%      +0.9%       377=
9        interrupts.CPU59.CAL:Function_call_interrupts
      3.00            +0.0%       3.00           -22.2%       2.33 =C2=B1 2=
0%  interrupts.CPU59.IWI:IRQ_work_interrupts
    565492 =C2=B1 15%      +7.1%     605568            +7.1%     605475    =
    interrupts.CPU59.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU59.MCP:Machine_check_polls
      8537            -0.0%       8534           -33.5%       5681 =C2=B1 3=
5%  interrupts.CPU59.NMI:Non-maskable_interrupts
      8537            -0.0%       8534           -33.5%       5681 =C2=B1 3=
5%  interrupts.CPU59.PMI:Performance_monitoring_interrupts
    309.50           +14.9%     355.67 =C2=B1 30%      -0.8%     307.17    =
    interrupts.CPU59.RES:Rescheduling_interrupts
      3004 =C2=B1  5%      +3.1%       3098 =C2=B1  3%      +1.0%       303=
5 =C2=B1  4%  interrupts.CPU59.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU6.35:PCI-MSI.327680-edge.xhci_hcd
      3695            -0.4%       3681            +4.2%       3850 =C2=B1 1=
1%  interrupts.CPU6.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU6.IWI:IRQ_work_interrupts
    563915 =C2=B1 16%      +7.4%     605509            +7.4%     605685    =
    interrupts.CPU6.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU6.MCP:Machine_check_polls
      7509 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +9.0%       818=
4        interrupts.CPU6.NMI:Non-maskable_interrupts
      7509 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      +9.0%       818=
4        interrupts.CPU6.PMI:Performance_monitoring_interrupts
    314.17            -1.2%     310.50           +24.0%     389.50 =C2=B1 4=
4%  interrupts.CPU6.RES:Rescheduling_interrupts
      2808 =C2=B1  3%      -0.1%       2806 =C2=B1  3%      +0.9%       283=
4 =C2=B1  4%  interrupts.CPU6.TLB:TLB_shootdowns
      3758            -1.1%       3717            +1.1%       3798        i=
nterrupts.CPU60.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +0.0%       2.83 =C2=B1 13%     -17.6%       2.3=
3 =C2=B1 20%  interrupts.CPU60.IWI:IRQ_work_interrupts
    566327 =C2=B1 15%      +6.9%     605568            +6.9%     605517    =
    interrupts.CPU60.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU60.MCP:Machine_check_polls
      7822 =C2=B1 20%      +0.0%       7826 =C2=B1 20%     -27.4%       568=
1 =C2=B1 35%  interrupts.CPU60.NMI:Non-maskable_interrupts
      7822 =C2=B1 20%      +0.0%       7826 =C2=B1 20%     -27.4%       568=
1 =C2=B1 35%  interrupts.CPU60.PMI:Performance_monitoring_interrupts
    458.67 =C2=B1 73%     -31.8%     312.67 =C2=B1  3%     -32.8%     308.0=
0        interrupts.CPU60.RES:Rescheduling_interrupts
      3040 =C2=B1  3%      -2.8%       2955 =C2=B1  2%      +0.2%       304=
6 =C2=B1  3%  interrupts.CPU60.TLB:TLB_shootdowns
      3740            +0.5%       3759            +1.1%       3782 =C2=B1  =
2%  interrupts.CPU61.CAL:Function_call_interrupts
      2.67 =C2=B1 17%      +6.3%       2.83 =C2=B1 13%      -6.2%       2.5=
0 =C2=B1 20%  interrupts.CPU61.IWI:IRQ_work_interrupts
    566160 =C2=B1 15%      +7.0%     605568            +6.9%     605466    =
    interrupts.CPU61.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU61.MCP:Machine_check_polls
      7112 =C2=B1 28%     +10.1%       7827 =C2=B1 20%     -10.1%       639=
2 =C2=B1 33%  interrupts.CPU61.NMI:Non-maskable_interrupts
      7112 =C2=B1 28%     +10.1%       7827 =C2=B1 20%     -10.1%       639=
2 =C2=B1 33%  interrupts.CPU61.PMI:Performance_monitoring_interrupts
    358.50 =C2=B1 31%     -14.3%     307.33           -13.9%     308.83    =
    interrupts.CPU61.RES:Rescheduling_interrupts
      3004 =C2=B1  3%      +3.3%       3103 =C2=B1  3%      +1.2%       304=
0 =C2=B1  4%  interrupts.CPU61.TLB:TLB_shootdowns
      3761            -1.4%       3708            +1.5%       3817 =C2=B1  =
2%  interrupts.CPU62.CAL:Function_call_interrupts
      2.83 =C2=B1 13%      +5.9%       3.00           -11.8%       2.50 =C2=
=B1 20%  interrupts.CPU62.IWI:IRQ_work_interrupts
    565979 =C2=B1 15%      +7.0%     605506            +7.0%     605504    =
    interrupts.CPU62.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU62.MCP:Machine_check_polls
      7827 =C2=B1 20%      +9.0%       8534           -18.3%       6391 =C2=
=B1 33%  interrupts.CPU62.NMI:Non-maskable_interrupts
      7827 =C2=B1 20%      +9.0%       8534           -18.3%       6391 =C2=
=B1 33%  interrupts.CPU62.PMI:Performance_monitoring_interrupts
    308.17            +0.1%     308.33            +0.4%     309.33        i=
nterrupts.CPU62.RES:Rescheduling_interrupts
      3042 =C2=B1  3%      -3.1%       2948 =C2=B1  3%      +1.5%       308=
7 =C2=B1  2%  interrupts.CPU62.TLB:TLB_shootdowns
      3773 =C2=B1  2%      -0.0%       3772 =C2=B1  2%      +0.2%       377=
9 =C2=B1  2%  interrupts.CPU63.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%     -16.7%       2.50 =C2=
=B1 20%  interrupts.CPU63.IWI:IRQ_work_interrupts
    565748 =C2=B1 15%      +7.0%     605574            +7.0%     605484    =
    interrupts.CPU63.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU63.MCP:Machine_check_polls
      8540            -8.4%       7826 =C2=B1 20%     -25.2%       6391 =C2=
=B1 33%  interrupts.CPU63.NMI:Non-maskable_interrupts
      8540            -8.4%       7826 =C2=B1 20%     -25.2%       6391 =C2=
=B1 33%  interrupts.CPU63.PMI:Performance_monitoring_interrupts
    308.33            +0.5%     310.00 =C2=B1  2%      -0.1%     308.17    =
    interrupts.CPU63.RES:Rescheduling_interrupts
      3046 =C2=B1  3%      +0.8%       3071 =C2=B1  4%      +0.2%       305=
3 =C2=B1  4%  interrupts.CPU63.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU64.99:PCI-MSI.23593009-edge.nvme0q49
      3785            -1.6%       3725            -0.4%       3768        i=
nterrupts.CPU64.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%     -16.7%       2.50 =C2=
=B1 20%  interrupts.CPU64.IWI:IRQ_work_interrupts
    565753 =C2=B1 15%      +7.0%     605571            +7.0%     605477    =
    interrupts.CPU64.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU64.MCP:Machine_check_polls
      8539            -8.3%       7826 =C2=B1 20%     -25.2%       6391 =C2=
=B1 33%  interrupts.CPU64.NMI:Non-maskable_interrupts
      8539            -8.3%       7826 =C2=B1 20%     -25.2%       6391 =C2=
=B1 33%  interrupts.CPU64.PMI:Performance_monitoring_interrupts
    307.67            -0.1%     307.50            -0.1%     307.50        i=
nterrupts.CPU64.RES:Rescheduling_interrupts
      3048 =C2=B1  3%      -2.7%       2966 =C2=B1  2%      +0.1%       305=
2 =C2=B1  3%  interrupts.CPU64.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU65.95:PCI-MSI.23593010-edge.nvme0q50
      3729 =C2=B1  5%      +0.7%       3757 =C2=B1  3%      +1.8%       379=
8 =C2=B1  2%  interrupts.CPU65.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%     -16.7%       2.50 =C2=
=B1 20%  interrupts.CPU65.IWI:IRQ_work_interrupts
    565859 =C2=B1 15%      +7.0%     605579            +7.0%     605476    =
    interrupts.CPU65.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU65.MCP:Machine_check_polls
      8539            -8.4%       7821 =C2=B1 20%     -25.2%       6391 =C2=
=B1 33%  interrupts.CPU65.NMI:Non-maskable_interrupts
      8539            -8.4%       7821 =C2=B1 20%     -25.2%       6391 =C2=
=B1 33%  interrupts.CPU65.PMI:Performance_monitoring_interrupts
    316.17 =C2=B1  4%      -2.7%     307.67            +0.9%     319.00 =C2=
=B1  8%  interrupts.CPU65.RES:Rescheduling_interrupts
      3050 =C2=B1  3%      +1.8%       3105 =C2=B1  3%      +0.2%       305=
5 =C2=B1  4%  interrupts.CPU65.TLB:TLB_shootdowns
      3759 =C2=B1  2%      -1.6%       3699            -0.5%       3741    =
    interrupts.CPU66.CAL:Function_call_interrupts
      3.00            +0.0%       3.00           -11.1%       2.67 =C2=B1 1=
7%  interrupts.CPU66.IWI:IRQ_work_interrupts
    566329 =C2=B1 15%      +6.9%     605566            +6.9%     605430    =
    interrupts.CPU66.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU66.MCP:Machine_check_polls
      8539            -0.0%       8535           -16.7%       7112 =C2=B1 2=
8%  interrupts.CPU66.NMI:Non-maskable_interrupts
      8539            -0.0%       8535           -16.7%       7112 =C2=B1 2=
8%  interrupts.CPU66.PMI:Performance_monitoring_interrupts
    310.17            -1.0%     307.00            +0.1%     310.50        i=
nterrupts.CPU66.RES:Rescheduling_interrupts
      3010 =C2=B1  4%      -1.0%       2980 =C2=B1  2%      +1.8%       306=
5 =C2=B1  2%  interrupts.CPU66.TLB:TLB_shootdowns
      3788            +1.0%       3827 =C2=B1  2%      -1.0%       3752 =C2=
=B1  2%  interrupts.CPU67.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            -5.6%       2.83 =C2=B1 1=
3%  interrupts.CPU67.IWI:IRQ_work_interrupts
    566289 =C2=B1 15%      +6.9%     605577            +6.9%     605476    =
    interrupts.CPU67.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU67.MCP:Machine_check_polls
      8539            -0.1%       8534            -8.4%       7820 =C2=B1 2=
0%  interrupts.CPU67.NMI:Non-maskable_interrupts
      8539            -0.1%       8534            -8.4%       7820 =C2=B1 2=
0%  interrupts.CPU67.PMI:Performance_monitoring_interrupts
    308.67            -0.4%     307.50            -0.4%     307.33        i=
nterrupts.CPU67.RES:Rescheduling_interrupts
      3054 =C2=B1  3%      +2.3%       3124 =C2=B1  2%      -1.0%       302=
4 =C2=B1  4%  interrupts.CPU67.TLB:TLB_shootdowns
      3781            -2.0%       3704 =C2=B1  2%      -0.8%       3752    =
    interrupts.CPU68.CAL:Function_call_interrupts
      3.00            +0.0%       3.00            +0.0%       3.00        i=
nterrupts.CPU68.IWI:IRQ_work_interrupts
    566557 =C2=B1 15%      +6.9%     605572            +6.9%     605460    =
    interrupts.CPU68.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU68.MCP:Machine_check_polls
      8538            -0.1%       8533            -0.1%       8530        i=
nterrupts.CPU68.NMI:Non-maskable_interrupts
      8538            -0.1%       8533            -0.1%       8530        i=
nterrupts.CPU68.PMI:Performance_monitoring_interrupts
    308.83            -0.2%     308.17            +2.5%     316.50 =C2=B1  =
6%  interrupts.CPU68.RES:Rescheduling_interrupts
      3050 =C2=B1  3%      -2.1%       2985 =C2=B1  2%      -0.6%       303=
1 =C2=B1  2%  interrupts.CPU68.TLB:TLB_shootdowns
      3881 =C2=B1  5%      -2.1%       3801            -2.9%       3769 =C2=
=B1  2%  interrupts.CPU69.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU69.IWI:IRQ_work_interrupts
    565909 =C2=B1 15%      +7.0%     605571            +7.0%     605484    =
    interrupts.CPU69.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU69.MCP:Machine_check_polls
      8538            -8.4%       7825 =C2=B1 20%      -0.1%       8530    =
    interrupts.CPU69.NMI:Non-maskable_interrupts
      8538            -8.4%       7825 =C2=B1 20%      -0.1%       8530    =
    interrupts.CPU69.PMI:Performance_monitoring_interrupts
    344.50 =C2=B1 23%     -10.6%     307.83           -10.6%     308.00    =
    interrupts.CPU69.RES:Rescheduling_interrupts
      3059 =C2=B1  3%      +2.2%       3128 =C2=B1  2%      -1.0%       303=
0 =C2=B1  4%  interrupts.CPU69.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU7.8:IO-APIC.8-edge.rtc0
      3722            +0.1%       3726            +0.3%       3732        i=
nterrupts.CPU7.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      -9.1%       1.6=
7 =C2=B1 28%  interrupts.CPU7.IWI:IRQ_work_interrupts
    564018 =C2=B1 16%      +7.4%     605522            +7.4%     605745    =
    interrupts.CPU7.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU7.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      -9.2%       682=
1 =C2=B1 28%  interrupts.CPU7.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.1%       7504 =C2=B1 20%      -9.2%       682=
1 =C2=B1 28%  interrupts.CPU7.PMI:Performance_monitoring_interrupts
    311.17            +0.1%     311.50            -0.3%     310.33        i=
nterrupts.CPU7.RES:Rescheduling_interrupts
      2983 =C2=B1  3%      +1.3%       3021            +0.5%       2997 =C2=
=B1  3%  interrupts.CPU7.TLB:TLB_shootdowns
      3794 =C2=B1  2%      -1.9%       3720            +2.5%       3889 =C2=
=B1  8%  interrupts.CPU70.CAL:Function_call_interrupts
      3.00            -5.6%       2.83 =C2=B1 13%      +0.0%       3.00    =
    interrupts.CPU70.IWI:IRQ_work_interrupts
    566139 =C2=B1 15%      +7.0%     605566            +6.9%     605473    =
    interrupts.CPU70.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU70.MCP:Machine_check_polls
      8538            -8.3%       7825 =C2=B1 20%      -0.1%       8529    =
    interrupts.CPU70.NMI:Non-maskable_interrupts
      8538            -8.3%       7825 =C2=B1 20%      -0.1%       8529    =
    interrupts.CPU70.PMI:Performance_monitoring_interrupts
    311.50 =C2=B1  2%      -1.2%     307.83           +12.4%     350.00 =C2=
=B1 26%  interrupts.CPU70.RES:Rescheduling_interrupts
      3071 =C2=B1  3%      -2.0%       3011 =C2=B1  2%      +1.4%       311=
5 =C2=B1  2%  interrupts.CPU70.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU71.109:PCI-MSI.23593016-edge.nvme0q56
      3712 =C2=B1  2%     +14.2%       4237 =C2=B1 26%     +34.6%       499=
8 =C2=B1 55%  interrupts.CPU71.CAL:Function_call_interrupts
      3.00           -11.1%       2.67 =C2=B1 17%      -5.6%       2.83 =C2=
=B1 13%  interrupts.CPU71.IWI:IRQ_work_interrupts
    566065 =C2=B1 15%      +7.0%     605602            +7.0%     605498    =
    interrupts.CPU71.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU71.MCP:Machine_check_polls
      8537           -16.7%       7111 =C2=B1 28%      -8.4%       7819 =C2=
=B1 20%  interrupts.CPU71.NMI:Non-maskable_interrupts
      8537           -16.7%       7111 =C2=B1 28%      -8.4%       7819 =C2=
=B1 20%  interrupts.CPU71.PMI:Performance_monitoring_interrupts
    309.33           +26.8%     392.33 =C2=B1 48%     +56.1%     482.83 =C2=
=B1 81%  interrupts.CPU71.RES:Rescheduling_interrupts
      3054 =C2=B1  3%      +1.8%       3109 =C2=B1  3%      +1.1%       308=
7 =C2=B1  4%  interrupts.CPU71.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU72.198:PCI-MSI.100728832-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU72.199:PCI-MSI.100728832-edge.ioat-msix
      3925 =C2=B1  2%      +1.0%       3962 =C2=B1  4%      -2.1%       384=
1 =C2=B1  2%  interrupts.CPU72.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU72.IWI:IRQ_work_interrupts
    555199 =C2=B1 20%      +9.1%     605609            +9.1%     605511    =
    interrupts.CPU72.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU72.MCP:Machine_check_polls
      8004            -8.4%       7332 =C2=B1 20%      -0.1%       7998    =
    interrupts.CPU72.NMI:Non-maskable_interrupts
      8004            -8.4%       7332 =C2=B1 20%      -0.1%       7998    =
    interrupts.CPU72.PMI:Performance_monitoring_interrupts
    352.17 =C2=B1  5%      +6.9%     376.50 =C2=B1 11%      -1.5%     347.0=
0 =C2=B1 10%  interrupts.CPU72.RES:Rescheduling_interrupts
      3071 =C2=B1  3%      +0.6%       3088 =C2=B1  3%      -0.6%       305=
3 =C2=B1  3%  interrupts.CPU72.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU73.200:PCI-MSI.100730880-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU73.201:PCI-MSI.100730880-edge.ioat-msix
      4853 =C2=B1 28%     +13.5%       5509 =C2=B1 30%      -9.9%       437=
1 =C2=B1  8%  interrupts.CPU73.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      -8.3%       1.83 =C2=
=B1 20%  interrupts.CPU73.IWI:IRQ_work_interrupts
    561625 =C2=B1 17%      +7.8%     605636            +7.8%     605520    =
    interrupts.CPU73.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU73.MCP:Machine_check_polls
      8005            -8.4%       7334 =C2=B1 20%      -8.4%       7333 =C2=
=B1 20%  interrupts.CPU73.NMI:Non-maskable_interrupts
      8005            -8.4%       7334 =C2=B1 20%      -8.4%       7333 =C2=
=B1 20%  interrupts.CPU73.PMI:Performance_monitoring_interrupts
    440.50 =C2=B1 20%      -6.7%     411.17 =C2=B1  8%      -2.3%     430.1=
7 =C2=B1 26%  interrupts.CPU73.RES:Rescheduling_interrupts
      3089 =C2=B1  2%      +2.2%       3158 =C2=B1  2%      -1.1%       305=
4 =C2=B1  3%  interrupts.CPU73.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU74.201:PCI-MSI.100732928-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU74.202:PCI-MSI.100732928-edge.ioat-msix
      4348 =C2=B1  7%      +8.6%       4723 =C2=B1 21%      +0.6%       437=
5 =C2=B1  9%  interrupts.CPU74.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU74.IWI:IRQ_work_interrupts
    561818 =C2=B1 17%      +7.8%     605581            +7.8%     605504    =
    interrupts.CPU74.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU74.MCP:Machine_check_polls
      8005            -8.4%       7335 =C2=B1 20%      -0.1%       7999    =
    interrupts.CPU74.NMI:Non-maskable_interrupts
      8005            -8.4%       7335 =C2=B1 20%      -0.1%       7999    =
    interrupts.CPU74.PMI:Performance_monitoring_interrupts
    389.83 =C2=B1 18%     +10.4%     430.33 =C2=B1 25%      +7.2%     418.0=
0 =C2=B1 20%  interrupts.CPU74.RES:Rescheduling_interrupts
      3117 =C2=B1  2%      -2.7%       3034            -0.7%       3094 =C2=
=B1  2%  interrupts.CPU74.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU75.202:PCI-MSI.100734976-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU75.203:PCI-MSI.100734976-edge.ioat-msix
      3879 =C2=B1  4%     +28.6%       4987 =C2=B1 48%      -1.8%       381=
0        interrupts.CPU75.CAL:Function_call_interrupts
      2.00            -8.3%       1.83 =C2=B1 20%      +0.0%       2.00    =
    interrupts.CPU75.IWI:IRQ_work_interrupts
    561688 =C2=B1 17%      +7.8%     605562            +7.8%     605491    =
    interrupts.CPU75.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU75.MCP:Machine_check_polls
      8004            -8.4%       7336 =C2=B1 20%      -0.1%       7998    =
    interrupts.CPU75.NMI:Non-maskable_interrupts
      8004            -8.4%       7336 =C2=B1 20%      -0.1%       7998    =
    interrupts.CPU75.PMI:Performance_monitoring_interrupts
    339.00 =C2=B1 14%     +53.5%     520.50 =C2=B1 71%      -6.7%     316.1=
7 =C2=B1  4%  interrupts.CPU75.RES:Rescheduling_interrupts
      3102 =C2=B1  3%      +0.3%       3110 =C2=B1  3%      -0.1%       310=
0 =C2=B1  3%  interrupts.CPU75.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU76.203:PCI-MSI.100737024-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU76.204:PCI-MSI.100737024-edge.ioat-msix
      3810            -1.6%       3750           +17.8%       4490 =C2=B1 3=
4%  interrupts.CPU76.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU76.IWI:IRQ_work_interrupts
    561206 =C2=B1 17%      +7.9%     605587            +7.9%     605474    =
    interrupts.CPU76.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU76.MCP:Machine_check_polls
      8004            -0.0%       8003            -0.1%       7998        i=
nterrupts.CPU76.NMI:Non-maskable_interrupts
      8004            -0.0%       8003            -0.1%       7998        i=
nterrupts.CPU76.PMI:Performance_monitoring_interrupts
    307.83            +0.4%     309.17           +42.0%     437.17 =C2=B1 6=
4%  interrupts.CPU76.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      -2.3%       3025 =C2=B1  2%      +0.1%       310=
0 =C2=B1  2%  interrupts.CPU76.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU77.204:PCI-MSI.100739072-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU77.205:PCI-MSI.100739072-edge.ioat-msix
      3834            -0.4%       3819            -0.5%       3814        i=
nterrupts.CPU77.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU77.IWI:IRQ_work_interrupts
    561388 =C2=B1 17%      +7.9%     605565            +7.9%     605486    =
    interrupts.CPU77.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU77.MCP:Machine_check_polls
      8004            -0.0%       8003            -0.1%       7998        i=
nterrupts.CPU77.NMI:Non-maskable_interrupts
      8004            -0.0%       8003            -0.1%       7998        i=
nterrupts.CPU77.PMI:Performance_monitoring_interrupts
    308.00            +0.7%     310.17            -0.1%     307.83        i=
nterrupts.CPU77.RES:Rescheduling_interrupts
      3159            -0.3%       3151 =C2=B1  2%      -1.7%       3107 =C2=
=B1  3%  interrupts.CPU77.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU78.205:PCI-MSI.100741120-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU78.206:PCI-MSI.100741120-edge.ioat-msix
      3808            -0.6%       3785            +0.2%       3816        i=
nterrupts.CPU78.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU78.IWI:IRQ_work_interrupts
    561075 =C2=B1 17%      +7.9%     605572            +7.9%     605483    =
    interrupts.CPU78.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU78.MCP:Machine_check_polls
      8004            -0.0%       8001            -0.1%       7998        i=
nterrupts.CPU78.NMI:Non-maskable_interrupts
      8004            -0.0%       8001            -0.1%       7998        i=
nterrupts.CPU78.PMI:Performance_monitoring_interrupts
    313.50 =C2=B1  3%      -0.6%     311.50            -2.0%     307.33    =
    interrupts.CPU78.RES:Rescheduling_interrupts
      3094 =C2=B1  3%      -0.4%       3082 =C2=B1  2%      +0.2%       309=
9 =C2=B1  2%  interrupts.CPU78.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU79.207:PCI-MSI.100743168-edge.ioat-msix
      3724 =C2=B1  5%      +4.0%       3874 =C2=B1  6%      +7.2%       399=
3 =C2=B1  9%  interrupts.CPU79.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU79.IWI:IRQ_work_interrupts
    561662 =C2=B1 17%      +7.8%     605587            +7.8%     605487    =
    interrupts.CPU79.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU79.MCP:Machine_check_polls
      8005            -0.0%       8003            -0.1%       7998        i=
nterrupts.CPU79.NMI:Non-maskable_interrupts
      8005            -0.0%       8003            -0.1%       7998        i=
nterrupts.CPU79.PMI:Performance_monitoring_interrupts
    309.17           +69.8%     524.83 =C2=B1 57%     +18.3%     365.67 =C2=
=B1 35%  interrupts.CPU79.RES:Rescheduling_interrupts
      3088 =C2=B1  3%      +3.7%       3203            +0.1%       3092 =C2=
=B1  3%  interrupts.CPU79.TLB:TLB_shootdowns
      3792 =C2=B1  6%      -3.3%       3666            -1.9%       3721    =
    interrupts.CPU8.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU8.IWI:IRQ_work_interrupts
    564233 =C2=B1 16%      +7.3%     605522            +7.3%     605657    =
    interrupts.CPU8.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU8.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      -0.1%       750=
3 =C2=B1 20%  interrupts.CPU8.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.0%       7505 =C2=B1 20%      -0.1%       750=
3 =C2=B1 20%  interrupts.CPU8.PMI:Performance_monitoring_interrupts
    357.17 =C2=B1 28%     -13.2%     310.17           -10.2%     320.83 =C2=
=B1  5%  interrupts.CPU8.RES:Rescheduling_interrupts
      2805 =C2=B1  4%      -0.0%       2805 =C2=B1  3%      +3.3%       289=
8 =C2=B1  4%  interrupts.CPU8.TLB:TLB_shootdowns
      3859 =C2=B1  2%      -2.2%       3773            -1.1%       3815    =
    interrupts.CPU80.CAL:Function_call_interrupts
      2.00            +0.0%       2.00            +0.0%       2.00        i=
nterrupts.CPU80.IWI:IRQ_work_interrupts
    561853 =C2=B1 17%      +7.8%     605548            +7.8%     605479    =
    interrupts.CPU80.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU80.MCP:Machine_check_polls
      8004            -0.0%       8002            -0.1%       7998        i=
nterrupts.CPU80.NMI:Non-maskable_interrupts
      8004            -0.0%       8002            -0.1%       7998        i=
nterrupts.CPU80.PMI:Performance_monitoring_interrupts
    314.67 =C2=B1  3%      +0.3%     315.50 =C2=B1  4%      -1.6%     309.5=
0        interrupts.CPU80.RES:Rescheduling_interrupts
      3130 =C2=B1  3%      -2.7%       3046 =C2=B1  2%      -0.7%       310=
8 =C2=B1  2%  interrupts.CPU80.TLB:TLB_shootdowns
      3791 =C2=B1  2%      +0.9%       3827            +0.8%       3823    =
    interrupts.CPU81.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU81.IWI:IRQ_work_interrupts
    562021 =C2=B1 17%      +7.8%     605639            +7.7%     605479    =
    interrupts.CPU81.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU81.MCP:Machine_check_polls
      7337 =C2=B1 20%      -0.0%       7335 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU81.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      -0.0%       7335 =C2=B1 20%      +9.0%       799=
7        interrupts.CPU81.PMI:Performance_monitoring_interrupts
    307.83            +2.1%     314.33 =C2=B1  4%      +6.0%     326.17 =C2=
=B1 13%  interrupts.CPU81.RES:Rescheduling_interrupts
      3098 =C2=B1  3%      +2.1%       3163 =C2=B1  3%      +1.0%       313=
0 =C2=B1  3%  interrupts.CPU81.TLB:TLB_shootdowns
      3805            -1.2%       3759            +0.7%       3833        i=
nterrupts.CPU82.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +9.1%       2.0=
0        interrupts.CPU82.IWI:IRQ_work_interrupts
    561664 =C2=B1 17%      +7.8%     605614            +7.8%     605473    =
    interrupts.CPU82.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU82.MCP:Machine_check_polls
      7337 =C2=B1 20%      -0.0%       7334 =C2=B1 20%      +9.0%       799=
8        interrupts.CPU82.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      -0.0%       7334 =C2=B1 20%      +9.0%       799=
8        interrupts.CPU82.PMI:Performance_monitoring_interrupts
    308.17            +0.3%     309.17            -0.3%     307.17        i=
nterrupts.CPU82.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      -2.1%       3031 =C2=B1  2%      +1.3%       313=
7 =C2=B1  2%  interrupts.CPU82.TLB:TLB_shootdowns
      3807            +0.8%       3837 =C2=B1  7%      -0.7%       3779    =
    interrupts.CPU83.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +20.0%       2.0=
0        interrupts.CPU83.IWI:IRQ_work_interrupts
    561194 =C2=B1 17%      +7.9%     605591            +7.9%     605500    =
    interrupts.CPU83.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU83.MCP:Machine_check_polls
      6669 =C2=B1 28%     +10.0%       7333 =C2=B1 20%     +19.9%       799=
7        interrupts.CPU83.NMI:Non-maskable_interrupts
      6669 =C2=B1 28%     +10.0%       7333 =C2=B1 20%     +19.9%       799=
7        interrupts.CPU83.PMI:Performance_monitoring_interrupts
    308.67           +10.6%     341.33 =C2=B1 19%     +48.6%     458.67 =C2=
=B1 74%  interrupts.CPU83.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      -1.1%       3064 =C2=B1  4%      -0.7%       307=
5 =C2=B1  4%  interrupts.CPU83.TLB:TLB_shootdowns
      3796            -0.9%       3761            +8.3%       4110 =C2=B1 1=
6%  interrupts.CPU84.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU84.IWI:IRQ_work_interrupts
    561271 =C2=B1 17%      +7.9%     605618            +7.9%     605468    =
    interrupts.CPU84.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU84.MCP:Machine_check_polls
      6668 =C2=B1 28%     +10.0%       7333 =C2=B1 20%     +10.0%       733=
4 =C2=B1 20%  interrupts.CPU84.NMI:Non-maskable_interrupts
      6668 =C2=B1 28%     +10.0%       7333 =C2=B1 20%     +10.0%       733=
4 =C2=B1 20%  interrupts.CPU84.PMI:Performance_monitoring_interrupts
    309.33            -0.3%     308.50           +17.7%     364.00 =C2=B1 3=
4%  interrupts.CPU84.RES:Rescheduling_interrupts
      3098 =C2=B1  2%      -0.5%       3082 =C2=B1  3%      +0.3%       310=
8 =C2=B1  2%  interrupts.CPU84.TLB:TLB_shootdowns
      3806            +1.1%       3848 =C2=B1  2%      +0.5%       3827    =
    interrupts.CPU85.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +10.0%       1.83 =C2=B1 20%     +10.0%       1.8=
3 =C2=B1 20%  interrupts.CPU85.IWI:IRQ_work_interrupts
    561682 =C2=B1 17%      +7.8%     605569            +7.8%     605465    =
    interrupts.CPU85.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU85.MCP:Machine_check_polls
      6669 =C2=B1 28%      +9.9%       7333 =C2=B1 20%     +10.0%       733=
4 =C2=B1 20%  interrupts.CPU85.NMI:Non-maskable_interrupts
      6669 =C2=B1 28%      +9.9%       7333 =C2=B1 20%     +10.0%       733=
4 =C2=B1 20%  interrupts.CPU85.PMI:Performance_monitoring_interrupts
    307.83            +0.6%     309.67            -0.1%     307.67        i=
nterrupts.CPU85.RES:Rescheduling_interrupts
      3103 =C2=B1  3%      +1.9%       3161 =C2=B1  3%      +1.1%       313=
8 =C2=B1  2%  interrupts.CPU85.TLB:TLB_shootdowns
      3767 =C2=B1  2%      +6.1%       3996 =C2=B1 11%      +1.0%       380=
4        interrupts.CPU86.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU86.IWI:IRQ_work_interrupts
    561952 =C2=B1 17%      +7.8%     605562            +7.7%     605476    =
    interrupts.CPU86.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU86.MCP:Machine_check_polls
      7337 =C2=B1 20%      -9.1%       6668 =C2=B1 28%      -0.0%       733=
5 =C2=B1 20%  interrupts.CPU86.NMI:Non-maskable_interrupts
      7337 =C2=B1 20%      -9.1%       6668 =C2=B1 28%      -0.0%       733=
5 =C2=B1 20%  interrupts.CPU86.PMI:Performance_monitoring_interrupts
    308.67           +11.4%     344.00 =C2=B1 22%      -0.5%     307.17    =
    interrupts.CPU86.RES:Rescheduling_interrupts
      3063 =C2=B1  3%      -0.1%       3061 =C2=B1  2%      +1.2%       309=
9 =C2=B1  3%  interrupts.CPU86.TLB:TLB_shootdowns
      3794            +1.2%       3839            +0.7%       3819 =C2=B1  =
2%  interrupts.CPU87.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      -9.1%       1.67 =C2=B1 28%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU87.IWI:IRQ_work_interrupts
    561875 =C2=B1 17%      +7.8%     605590            +7.8%     605463    =
    interrupts.CPU87.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU87.MCP:Machine_check_polls
      7338 =C2=B1 20%      -9.1%       6668 =C2=B1 28%      -0.1%       733=
3 =C2=B1 20%  interrupts.CPU87.NMI:Non-maskable_interrupts
      7338 =C2=B1 20%      -9.1%       6668 =C2=B1 28%      -0.1%       733=
3 =C2=B1 20%  interrupts.CPU87.PMI:Performance_monitoring_interrupts
    313.67 =C2=B1  4%      -1.4%     309.17            -1.9%     307.67    =
    interrupts.CPU87.RES:Rescheduling_interrupts
      3067 =C2=B1  3%      +3.2%       3167 =C2=B1  2%      +1.4%       310=
9 =C2=B1  4%  interrupts.CPU87.TLB:TLB_shootdowns
      3791            -0.8%       3761            +0.7%       3817        i=
nterrupts.CPU88.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +11.1%       1.67 =C2=B1 28%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU88.IWI:IRQ_work_interrupts
    561367 =C2=B1 17%      +7.9%     605589            +7.9%     605494    =
    interrupts.CPU88.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU88.MCP:Machine_check_polls
      6005 =C2=B1 33%     +11.1%       6669 =C2=B1 28%     +22.1%       733=
3 =C2=B1 20%  interrupts.CPU88.NMI:Non-maskable_interrupts
      6005 =C2=B1 33%     +11.1%       6669 =C2=B1 28%     +22.1%       733=
3 =C2=B1 20%  interrupts.CPU88.PMI:Performance_monitoring_interrupts
    308.50            -0.1%     308.17            +0.2%     309.00        i=
nterrupts.CPU88.RES:Rescheduling_interrupts
      3097 =C2=B1  3%      -2.2%       3029 =C2=B1  2%      +0.3%       310=
7 =C2=B1  2%  interrupts.CPU88.TLB:TLB_shootdowns
      3810            +1.1%       3853            -1.6%       3747 =C2=B1  =
3%  interrupts.CPU89.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +11.1%       1.67 =C2=B1 28%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU89.IWI:IRQ_work_interrupts
    561448 =C2=B1 17%      +7.9%     605543            +7.8%     605487    =
    interrupts.CPU89.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU89.MCP:Machine_check_polls
      6005 =C2=B1 33%     +11.0%       6668 =C2=B1 28%     +22.1%       733=
3 =C2=B1 20%  interrupts.CPU89.NMI:Non-maskable_interrupts
      6005 =C2=B1 33%     +11.0%       6668 =C2=B1 28%     +22.1%       733=
3 =C2=B1 20%  interrupts.CPU89.PMI:Performance_monitoring_interrupts
    326.67 =C2=B1 13%      -0.6%     324.83 =C2=B1 11%      -5.5%     308.8=
3        interrupts.CPU89.RES:Rescheduling_interrupts
      3103 =C2=B1  3%      +2.1%       3168 =C2=B1  2%      +0.2%       310=
8 =C2=B1  3%  interrupts.CPU89.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU9.30:PCI-MSI.524288-edge.eth0
      3745            -2.0%       3671 =C2=B1  3%      +1.7%       3809 =C2=
=B1  3%  interrupts.CPU9.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +0.0%       1.83 =C2=B1 20%      +0.0%       1.8=
3 =C2=B1 20%  interrupts.CPU9.IWI:IRQ_work_interrupts
    564307 =C2=B1 16%      +7.3%     605522            +7.3%     605681    =
    interrupts.CPU9.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU9.MCP:Machine_check_polls
      7508 =C2=B1 20%      -0.0%       7506 =C2=B1 20%      -0.1%       750=
3 =C2=B1 20%  interrupts.CPU9.NMI:Non-maskable_interrupts
      7508 =C2=B1 20%      -0.0%       7506 =C2=B1 20%      -0.1%       750=
3 =C2=B1 20%  interrupts.CPU9.PMI:Performance_monitoring_interrupts
    310.00            +0.2%     310.67           +25.1%     387.67 =C2=B1 3=
1%  interrupts.CPU9.RES:Rescheduling_interrupts
      2999 =C2=B1  3%      -0.4%       2986 =C2=B1  3%      -1.5%       295=
6 =C2=B1  3%  interrupts.CPU9.TLB:TLB_shootdowns
      3809            -1.3%       3761 =C2=B1  2%      -0.9%       3774 =C2=
=B1  2%  interrupts.CPU90.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +22.2%       1.83 =C2=B1 20%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU90.IWI:IRQ_work_interrupts
    561407 =C2=B1 17%      +7.9%     605503            +7.9%     605515    =
    interrupts.CPU90.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU90.MCP:Machine_check_polls
      6004 =C2=B1 33%     +22.2%       7335 =C2=B1 20%     +22.1%       733=
2 =C2=B1 20%  interrupts.CPU90.NMI:Non-maskable_interrupts
      6004 =C2=B1 33%     +22.2%       7335 =C2=B1 20%     +22.1%       733=
2 =C2=B1 20%  interrupts.CPU90.PMI:Performance_monitoring_interrupts
    307.33            +1.0%     310.33            +0.3%     308.17        i=
nterrupts.CPU90.RES:Rescheduling_interrupts
      3105 =C2=B1  3%      -3.0%       3011 =C2=B1  2%      -1.0%       307=
5 =C2=B1  3%  interrupts.CPU90.TLB:TLB_shootdowns
      3810            +1.1%       3851            +0.2%       3819        i=
nterrupts.CPU91.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +33.3%       2.00           +33.3%       2.00    =
    interrupts.CPU91.IWI:IRQ_work_interrupts
    561799 =C2=B1 17%      +7.8%     605574            +7.8%     605485    =
    interrupts.CPU91.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU91.MCP:Machine_check_polls
      6004 =C2=B1 33%     +33.3%       8001           +33.2%       7995    =
    interrupts.CPU91.NMI:Non-maskable_interrupts
      6004 =C2=B1 33%     +33.3%       8001           +33.2%       7995    =
    interrupts.CPU91.PMI:Performance_monitoring_interrupts
    307.33            +0.4%     308.67            +6.1%     326.17 =C2=B1 1=
2%  interrupts.CPU91.RES:Rescheduling_interrupts
      3112 =C2=B1  3%      +2.0%       3174 =C2=B1  2%      +0.2%       311=
7 =C2=B1  3%  interrupts.CPU91.TLB:TLB_shootdowns
      3800            -1.0%       3761            +0.3%       3811        i=
nterrupts.CPU92.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +20.0%       2.00    =
    interrupts.CPU92.IWI:IRQ_work_interrupts
    561558 =C2=B1 17%      +7.8%     605560            +7.8%     605581    =
    interrupts.CPU92.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU92.MCP:Machine_check_polls
      6672 =C2=B1 28%     +19.9%       8002           +19.8%       7995    =
    interrupts.CPU92.NMI:Non-maskable_interrupts
      6672 =C2=B1 28%     +19.9%       8002           +19.8%       7995    =
    interrupts.CPU92.PMI:Performance_monitoring_interrupts
    307.33            +0.1%     307.50            +0.0%     307.33        i=
nterrupts.CPU92.RES:Rescheduling_interrupts
      3108 =C2=B1  3%      -2.4%       3033 =C2=B1  2%      -0.1%       310=
4 =C2=B1  2%  interrupts.CPU92.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU93.149:PCI-MSI.23593046-edge.nvme0q86
      3792            +0.4%       3807            +0.7%       3818        i=
nterrupts.CPU93.CAL:Function_call_interrupts
      1.67 =C2=B1 28%     +20.0%       2.00           +20.0%       2.00    =
    interrupts.CPU93.IWI:IRQ_work_interrupts
    561604 =C2=B1 17%      +7.8%     605591            +7.8%     605469    =
    interrupts.CPU93.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU93.MCP:Machine_check_polls
      6673 =C2=B1 28%     +19.9%       8003           +19.8%       7995    =
    interrupts.CPU93.NMI:Non-maskable_interrupts
      6673 =C2=B1 28%     +19.9%       8003           +19.8%       7995    =
    interrupts.CPU93.PMI:Performance_monitoring_interrupts
    307.33            +0.4%     308.50           +17.0%     359.67 =C2=B1 3=
2%  interrupts.CPU93.RES:Rescheduling_interrupts
      3076 =C2=B1  3%      +2.0%       3138 =C2=B1  3%      +1.1%       311=
1 =C2=B1  3%  interrupts.CPU93.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU94.137:PCI-MSI.23593047-edge.nvme0q87
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU94.140:PCI-MSI.23593047-edge.nvme0q87
      3792            -0.4%       3777            +0.5%       3809        i=
nterrupts.CPU94.CAL:Function_call_interrupts
      1.83 =C2=B1 20%      +9.1%       2.00            +0.0%       1.83 =C2=
=B1 20%  interrupts.CPU94.IWI:IRQ_work_interrupts
    561397 =C2=B1 17%      +7.9%     605543            +7.8%     605465    =
    interrupts.CPU94.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU94.MCP:Machine_check_polls
      7340 =C2=B1 20%      +9.0%       8002            -0.1%       7333 =C2=
=B1 20%  interrupts.CPU94.NMI:Non-maskable_interrupts
      7340 =C2=B1 20%      +9.0%       8002            -0.1%       7333 =C2=
=B1 20%  interrupts.CPU94.PMI:Performance_monitoring_interrupts
    308.67            +1.3%     312.67 =C2=B1  4%      -0.2%     308.17    =
    interrupts.CPU94.RES:Rescheduling_interrupts
      3110 =C2=B1  3%      -2.4%       3036 =C2=B1  2%      +0.2%       311=
6 =C2=B1  2%  interrupts.CPU94.TLB:TLB_shootdowns
      4303 =C2=B1 29%     -12.4%       3770            -3.4%       4155 =C2=
=B1 17%  interrupts.CPU95.CAL:Function_call_interrupts
      1.83 =C2=B1 37%    +100.0%       3.67 =C2=B1 30%     +36.4%       2.5=
0 =C2=B1 38%  interrupts.CPU95.IWI:IRQ_work_interrupts
    561234 =C2=B1 17%      +7.9%     605581            +7.9%     605658    =
    interrupts.CPU95.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU95.MCP:Machine_check_polls
      6003 =C2=B1 33%     +33.5%       8017           +22.2%       7338 =C2=
=B1 20%  interrupts.CPU95.NMI:Non-maskable_interrupts
      6003 =C2=B1 33%     +33.5%       8017           +22.2%       7338 =C2=
=B1 20%  interrupts.CPU95.PMI:Performance_monitoring_interrupts
    416.67 =C2=B1 55%     -24.4%     315.17 =C2=B1  2%      -6.6%     389.0=
0 =C2=B1 35%  interrupts.CPU95.RES:Rescheduling_interrupts
      3062 =C2=B1  5%      +1.6%       3111 =C2=B1  3%      +3.8%       317=
9        interrupts.CPU95.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.145:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.147:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.149:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.150:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.154:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.157:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.159:PCI-MSI.23593057-edge.nvme0q97
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.176:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.46:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.47:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.48:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.52:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.53:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.54:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.56:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.60:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.62:PCI-MSI.23592960-edge.nvme0q0
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU96.64:PCI-MSI.23592960-edge.nvme0q0
     13443 =C2=B1 20%      +0.5%      13511 =C2=B1 10%     -17.5%      1109=
0 =C2=B1 29%  interrupts.CPU96.CAL:Function_call_interrupts
      2.67 =C2=B1 17%      +0.0%       2.67 =C2=B1 17%     +12.5%       3.0=
0        interrupts.CPU96.IWI:IRQ_work_interrupts
    565798 =C2=B1 15%      +7.0%     605647            +7.1%     605816    =
    interrupts.CPU96.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU96.MCP:Machine_check_polls
      6828 =C2=B1 28%      -0.1%       6819 =C2=B1 28%     +19.8%       818=
0        interrupts.CPU96.NMI:Non-maskable_interrupts
      6828 =C2=B1 28%      -0.1%       6819 =C2=B1 28%     +19.8%       818=
0        interrupts.CPU96.PMI:Performance_monitoring_interrupts
    377.83 =C2=B1 15%     +28.3%     484.83 =C2=B1 58%     -10.7%     337.5=
0 =C2=B1  3%  interrupts.CPU96.RES:Rescheduling_interrupts
      2838 =C2=B1  6%      +0.8%       2859 =C2=B1  7%      +1.3%       287=
4 =C2=B1  4%  interrupts.CPU96.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.155:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.158:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.161:PCI-MSI.23593058-edge.nvme0q98
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.177:PCI-MSI.79872-edge.ioat-msix
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU97.64:PCI-MSI.23592960-edge.nvme0q0
      7825 =C2=B1 23%     -11.8%       6899 =C2=B1 19%      -1.4%       771=
9 =C2=B1 28%  interrupts.CPU97.CAL:Function_call_interrupts
      2.33 =C2=B1 20%     +14.3%       2.67 =C2=B1 17%     +14.3%       2.6=
7 =C2=B1 17%  interrupts.CPU97.IWI:IRQ_work_interrupts
    564131 =C2=B1 16%      +7.4%     605632            +7.4%     605802    =
    interrupts.CPU97.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU97.MCP:Machine_check_polls
      6145 =C2=B1 33%     +11.0%       6819 =C2=B1 28%     +22.1%       750=
3 =C2=B1 20%  interrupts.CPU97.NMI:Non-maskable_interrupts
      6145 =C2=B1 33%     +11.0%       6819 =C2=B1 28%     +22.1%       750=
3 =C2=B1 20%  interrupts.CPU97.PMI:Performance_monitoring_interrupts
    398.33 =C2=B1  7%      +1.3%     403.50 =C2=B1  8%      +2.1%     406.6=
7 =C2=B1 17%  interrupts.CPU97.RES:Rescheduling_interrupts
      2788 =C2=B1  3%      -1.7%       2740            +1.9%       2840 =C2=
=B1  4%  interrupts.CPU97.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU98.151:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU98.156:PCI-MSI.23593059-edge.nvme0q99
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU98.163:PCI-MSI.23593059-edge.nvme0q99
      5321 =C2=B1 23%     -14.6%       4542 =C2=B1 22%      -6.9%       495=
4 =C2=B1 16%  interrupts.CPU98.CAL:Function_call_interrupts
      1.50 =C2=B1 33%     +11.1%       1.67 =C2=B1 28%     +22.2%       1.8=
3 =C2=B1 20%  interrupts.CPU98.IWI:IRQ_work_interrupts
    564374 =C2=B1 16%      +7.3%     605519            +7.3%     605678    =
    interrupts.CPU98.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU98.MCP:Machine_check_polls
      6145 =C2=B1 33%     +11.0%       6822 =C2=B1 28%     +22.1%       750=
3 =C2=B1 20%  interrupts.CPU98.NMI:Non-maskable_interrupts
      6145 =C2=B1 33%     +11.0%       6822 =C2=B1 28%     +22.1%       750=
3 =C2=B1 20%  interrupts.CPU98.PMI:Performance_monitoring_interrupts
    491.17 =C2=B1 24%     -19.7%     394.33 =C2=B1 19%      +1.3%     497.5=
0 =C2=B1 26%  interrupts.CPU98.RES:Rescheduling_interrupts
      2892 =C2=B1  5%      +1.2%       2928 =C2=B1  5%      +3.0%       297=
8 =C2=B1  3%  interrupts.CPU98.TLB:TLB_shootdowns
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU99.144:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU99.148:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU99.150:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU99.152:PCI-MSI.23593060-edge.nvme0q100
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.CPU99.157:PCI-MSI.23593060-edge.nvme0q100
      3703           +12.5%       4165 =C2=B1 16%      +1.1%       3743 =C2=
=B1  2%  interrupts.CPU99.CAL:Function_call_interrupts
      1.33 =C2=B1 35%     +25.0%       1.67 =C2=B1 28%     +37.5%       1.8=
3 =C2=B1 20%  interrupts.CPU99.IWI:IRQ_work_interrupts
    563589 =C2=B1 16%      +7.4%     605502            +7.5%     605650    =
    interrupts.CPU99.LOC:Local_timer_interrupts
      1.00            +0.0%       1.00            +0.0%       1.00        i=
nterrupts.CPU99.MCP:Machine_check_polls
      5461 =C2=B1 35%     +24.9%       6821 =C2=B1 28%     +37.4%       750=
3 =C2=B1 20%  interrupts.CPU99.NMI:Non-maskable_interrupts
      5461 =C2=B1 35%     +24.9%       6821 =C2=B1 28%     +37.4%       750=
3 =C2=B1 20%  interrupts.CPU99.PMI:Performance_monitoring_interrupts
    863.17 =C2=B1138%     -54.9%     389.50 =C2=B1 26%     -62.6%     323.1=
7 =C2=B1  3%  interrupts.CPU99.RES:Rescheduling_interrupts
      2835 =C2=B1  4%      +1.7%       2883 =C2=B1  4%      +0.2%       283=
9 =C2=B1  4%  interrupts.CPU99.TLB:TLB_shootdowns
    402.67 =C2=B1  5%      +2.5%     412.67 =C2=B1  2%      +3.9%     418.5=
0        interrupts.IWI:IRQ_work_interrupts
 1.083e+08 =C2=B1 16%      +7.3%  1.163e+08            +7.3%  1.163e+08    =
    interrupts.LOC:Local_timer_interrupts
    192.00            +0.0%     192.00            +0.0%     192.00        i=
nterrupts.MCP:Machine_check_polls
   1436687 =C2=B1  6%      +1.8%    1463114 =C2=B1  2%      +4.2%    149720=
7        interrupts.NMI:Non-maskable_interrupts
   1436687 =C2=B1  6%      +1.8%    1463114 =C2=B1  2%      +4.2%    149720=
7        interrupts.PMI:Performance_monitoring_interrupts
     66401            -0.5%      66077            +0.3%      66632        i=
nterrupts.RES:Rescheduling_interrupts
      0.00          -100.0%       0.00          -100.0%       0.00        i=
nterrupts.RTR:APIC_ICR_read_retries
    576474            -0.1%     575678            +0.2%     577562        i=
nterrupts.TLB:TLB_shootdowns



> =

> diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
> index 907a6734059c..0fd19452a57e 100644
> --- a/include/linux/secretmem.h
> +++ b/include/linux/secretmem.h
> @@ -4,8 +4,32 @@
>  =

>  #ifdef CONFIG_SECRETMEM
>  =

> +extern const struct address_space_operations secretmem_aops;
> +
> +static inline bool page_is_secretmem(struct page *page)
> +{
> +	struct address_space *mapping;
> +
> +	/*
> +	 * Using page_mapping() is quite slow because of the actual call
> +	 * isntruction and repeated compound_head(page) inside the
> +	 * page_mapping() function.
> +	 * We know that secretmem pages are not compound and LRU so we can
> +	 * save a couple of cycles here.
> +	 */
> +	if (PageCompound(page) || !PageLRU(page))
> +		return false;
> +
> +	mapping =3D (struct address_space *)
> +		((unsigned long)page->mapping & ~PAGE_MAPPING_FLAGS);
> +
> +	if (mapping !=3D page->mapping)
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
> index 3b1ba3991964..0bcd15e1b549 100644
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
> =

> =

> -- =

> Sincerely yours,
> Mike.
--===============0510296886432524937==--

