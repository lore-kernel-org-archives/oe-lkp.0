Content-Type: multipart/mixed; boundary="===============9148304181483884551=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [entry] 47b8ff194c: will-it-scale.per_process_ops -3.0% regression
Date: Wed, 26 May 2021 14:20:56 +0800
Message-ID: <20210526062056.GA23957@xsang-OptiPlex-9020>
In-Reply-To: <20210523132639.GB173496@lothringen>
List-Id: <oe-lkp.lists.linux.dev>

--===============9148304181483884551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Frederic,

On Sun, May 23, 2021 at 03:26:39PM +0200, Frederic Weisbecker wrote:
> On Wed, May 19, 2021 at 01:27:00PM +0800, Oliver Sang wrote:
> > hi, Peter Zijlstra,
> > =

> > On Fri, May 14, 2021 at 12:13:22PM +0200, Peter Zijlstra wrote:
> > > On Fri, May 14, 2021 at 01:11:27AM +0200, Frederic Weisbecker wrote:
> > > =

> > > > That sounds good, but two things:
> > > > =

> > > > 1) Even if context tracking is not running, we still need to handle
> > > >    deferred wakeups on idle. But all user/guest/idle currently use =
the
> > > >    same function.
> > > > =

> > > > 2) Context tracking may be running even when full nohz is not. But =
here only
> > > >    full nohz is concerned.
> > > > =

> > > > So the change should rather be as follows (completely untested!).
> > > > I rather put the static key check in tick.h in order not to involve
> > > > deep dependencies inside rcupdate.h (especially rcupdate.h -> tick.=
h -> sched.h)
> > > =

> > > Compiles and boots for me, 0day folks, could you please test this mak=
es
> > > the reported regression go away?
> > =

> > sorry for late.
> > =

> > on which base should we apply below patch?
> > we tried to apply upon 4ae7dc97f726e ("entry/kvm: Explicitly flush pend=
ing rcuog
> > wakeup before last rescheduling point") and v5.12, but both build faile=
d like below:
> > =

> > ERROR: modpost: "tick_nohz_full_mask" [arch/x86/kvm/kvm.ko] undefined!
> > =

> > or is there any particular kconfig need to enable?
> > (the kconfig which we used to build 47b8ff194c is in original report
> > which maybe you could help have a look what we may miss)
> =

> Ah indeed I need to export tick_nohz_full_mask. Too bad but that's the fa=
te
> of many cpu masks anyway. Can you try the following patch instead? It boo=
ts
> and seem to behave:

we applied below patch upon v5.12, and got 1.8% improvement.
however, though the data is stable in multi runs for either v5.12 or the pa=
tched
kernel, please be noted that according to our experience the will-it-scale =
is
sensitive test suite that the data is easy to fructuate among different com=
mits,
so we normally won't report a will-it-scale performance change if it's <3%.

e.g. we also tried to apply the patch to 4ae7dc97f726e ("entry/kvm: Explici=
tly flush
pending rcuog wakeup before last rescheduling point") (child of 47b8ff194c)=
, then
we got -1.9 regression.

below is the detail comparison between v5.12 and patched kernel.

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/process/100%/debian-10.4-x86_64-2020060=
3.cgz/lkp-csl-2ap2/futex3/will-it-scale/0x5003006

commit: =

  v5.12
  7fbca1fc8281 (v5.12 + below patch)

           v5.12 7fbca1fc82818c12e55f6406110 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

 1.201e+09            +1.8%  1.223e+09        will-it-scale.192.processes
      0.15 =C2=B1  3%      +0.8%       0.15 =C2=B1  3%  will-it-scale.192.p=
rocesses_idle
   6256931            +1.8%    6369346        will-it-scale.per_process_ops
    301.59            +0.0%     301.61        will-it-scale.time.elapsed_ti=
me
    301.59            +0.0%     301.61        will-it-scale.time.elapsed_ti=
me.max
      1.54 =C2=B1 48%     +30.0%       2.00 =C2=B1 44%  will-it-scale.time.=
involuntary_context_switches
      0.46 =C2=B1161%     -13.3%       0.40 =C2=B1165%  will-it-scale.time.=
major_page_faults
      9680            +0.1%       9694        will-it-scale.time.maximum_re=
sident_set_size
      6510            -0.2%       6495        will-it-scale.time.minor_page=
_faults
      4096            +0.0%       4096        will-it-scale.time.page_size
      0.03 =C2=B1 20%      -6.1%       0.03 =C2=B1 18%  will-it-scale.time.=
system_time
      0.03 =C2=B1 15%      -2.5%       0.03        will-it-scale.time.user_=
time
     85.54            +0.2%      85.70        will-it-scale.time.voluntary_=
context_switches
 1.201e+09            +1.8%  1.223e+09        will-it-scale.workload
    344.79            -0.7%     342.28        uptime.boot
      7101 =C2=B1  8%      -7.7%       6557 =C2=B1  6%  uptime.idle
     39.12 =C2=B1  3%      -3.2%      37.85 =C2=B1  5%  boot-time.boot
     26.45            -2.6%      25.77 =C2=B1  6%  boot-time.dhcp
      6014 =C2=B1  5%      -4.5%       5742 =C2=B1  6%  boot-time.idle
      1.72            +0.2%       1.73        boot-time.smp_boot
      6.89 =C2=B1  3%      +0.0        6.92 =C2=B1  5%  mpstat.cpu.all.idle%
      1.13 =C2=B1  6%      -0.1        1.06 =C2=B1  9%  mpstat.cpu.all.irq%
      0.01 =C2=B1  3%      +0.0        0.01 =C2=B1  6%  mpstat.cpu.all.soft%
     61.77            +1.8       63.59        mpstat.cpu.all.sys%
     30.21            -1.8       28.42        mpstat.cpu.all.usr%
   2537878 =C2=B1 80%     -20.0%    2030688 =C2=B1 39%  cpuidle.C1.time
     58450 =C2=B1159%     -21.9%      45633 =C2=B1 48%  cpuidle.C1.usage
 2.984e+08 =C2=B1 28%      +5.3%  3.141e+08 =C2=B1 69%  cpuidle.C1E.time
    627221 =C2=B1 28%     +20.1%     753509 =C2=B1 56%  cpuidle.C1E.usage
 1.099e+08 =C2=B1 77%     +31.9%  1.449e+08 =C2=B1 90%  cpuidle.C6.time
    243896 =C2=B1 58%     +28.4%     313191 =C2=B1 55%  cpuidle.C6.usage
     68908 =C2=B1171%     -72.0%      19272 =C2=B1 13%  cpuidle.POLL.time
      6363 =C2=B1 66%     -31.6%       4355 =C2=B1 15%  cpuidle.POLL.usage
      1.00            +0.0%       1.00        vmstat.cpu.id
     66.00            +2.9%      67.90        vmstat.cpu.sy
     31.15            -4.3%      29.80        vmstat.cpu.us
      0.00          -100.0%       0.00        vmstat.io.bi
   1764017            +0.3%    1768725        vmstat.memory.cache
 1.939e+08            -0.0%  1.938e+08        vmstat.memory.free
    190.00            -0.1%     189.80        vmstat.procs.r
      2082            +1.2%       2108        vmstat.system.cs
    392472            +0.2%     393138        vmstat.system.in
    301.59            +0.0%     301.61        time.elapsed_time
    301.59            +0.0%     301.61        time.elapsed_time.max
      1.54 =C2=B1 48%     +30.0%       2.00 =C2=B1 44%  time.involuntary_co=
ntext_switches
      0.46 =C2=B1161%     -13.3%       0.40 =C2=B1165%  time.major_page_fau=
lts
      9680            +0.1%       9694        time.maximum_resident_set_size
      6510            -0.2%       6495        time.minor_page_faults
      4096            +0.0%       4096        time.page_size
      0.03 =C2=B1 20%      -6.1%       0.03 =C2=B1 18%  time.system_time
      0.03 =C2=B1 15%      -2.5%       0.03        time.user_time
     85.54            +0.2%      85.70        time.voluntary_context_switch=
es
      0.00          -100.0%       0.00        numa-numastat.node0.interleav=
e_hit
    221542 =C2=B1 12%     +10.1%     244013 =C2=B1 15%  numa-numastat.node0=
.local_node
    291480 =C2=B1  2%      +2.2%     297889 =C2=B1  3%  numa-numastat.node0=
.numa_hit
     69941 =C2=B1 30%     -22.9%      53895 =C2=B1 52%  numa-numastat.node0=
.other_node
      0.00          -100.0%       0.00        numa-numastat.node1.interleav=
e_hit
    244854 =C2=B1 18%      -5.9%     230514 =C2=B1 14%  numa-numastat.node1=
.local_node
    300092 =C2=B1  3%      -0.7%     297989 =C2=B1  3%  numa-numastat.node1=
.numa_hit
     55245 =C2=B1 61%     +22.1%      67479 =C2=B1 38%  numa-numastat.node1=
.other_node
      0.00          -100.0%       0.00        numa-numastat.node2.interleav=
e_hit
    227179 =C2=B1 15%      +2.6%     232992 =C2=B1 14%  numa-numastat.node2=
.local_node
    290033 =C2=B1  3%      +1.0%     293075 =C2=B1  2%  numa-numastat.node2=
.numa_hit
     62857 =C2=B1 42%      -4.4%      60090 =C2=B1 43%  numa-numastat.node2=
.other_node
      0.00          -100.0%       0.00        numa-numastat.node3.interleav=
e_hit
    405272 =C2=B1  8%      -1.7%     398305 =C2=B1  6%  numa-numastat.node3=
.local_node
    477171            -0.1%     476916        numa-numastat.node3.numa_hit
     71904 =C2=B1 37%      +9.3%      78614 =C2=B1 25%  numa-numastat.node3=
.other_node
    390492            +1.2%     395330        meminfo.Active
    390492            +1.2%     395330        meminfo.Active(anon)
    174793 =C2=B1  2%      +0.3%     175341        meminfo.AnonHugePages
    391553            +0.3%     392840        meminfo.AnonPages
   1629171            +0.4%    1635090        meminfo.Cached
    189912            +0.0%     189912        meminfo.CmaFree
    204800            +0.0%     204800        meminfo.CmaTotal
  98857488            -0.0%   98857484        meminfo.CommitLimit
  11744472            -0.1%   11738185        meminfo.Committed_AS
 1.881e+08            -0.0%   1.88e+08        meminfo.DirectMap1G
  13601398 =C2=B1  5%      +0.6%   13688627 =C2=B1  7%  meminfo.DirectMap2M
   1408295 =C2=B1  3%      +0.1%    1409792 =C2=B1  3%  meminfo.DirectMap4k
      2048            +0.0%       2048        meminfo.Hugepagesize
    451969            +0.2%     452884        meminfo.Inactive
    451969            +0.2%     452884        meminfo.Inactive(anon)
      0.00          -100.0%       0.00        meminfo.Inactive(file)
    133644            -0.7%     132741        meminfo.KReclaimable
     32470            +0.8%      32738        meminfo.KernelStack
    104517            -0.4%     104144 =C2=B1  2%  meminfo.Mapped
 1.932e+08            -0.0%  1.932e+08        meminfo.MemAvailable
 1.939e+08            -0.0%  1.938e+08        meminfo.MemFree
 1.977e+08            -0.0%  1.977e+08        meminfo.MemTotal
   3856511            +0.4%    3870202        meminfo.Memused
    533.92 =C2=B1150%     +62.3%     866.80 =C2=B1100%  meminfo.Mlocked
     30463            +0.0%      30470        meminfo.PageTables
    107096            +0.5%     107664        meminfo.Percpu
    133644            -0.7%     132741        meminfo.SReclaimable
    302192            -0.3%     301269        meminfo.SUnreclaim
    451244            +1.0%     455780        meminfo.Shmem
    435836            -0.4%     434011        meminfo.Slab
   1178004            +0.1%    1179435        meminfo.Unevictable
 3.436e+10            +0.0%  3.436e+10        meminfo.VmallocTotal
    315329            +0.3%     316149        meminfo.VmallocUsed
   4737681 =C2=B1  2%      +0.6%    4764300        meminfo.max_used_kB
      0.00          -100.0%       0.00        proc-vmstat.compact_isolated
     97650            +1.2%      98788        proc-vmstat.nr_active_anon
     97845            +0.4%      98203        proc-vmstat.nr_anon_pages
     84.85            +0.4%      85.20        proc-vmstat.nr_anon_transpare=
nt_hugepages
   4821126            -0.0%    4820765        proc-vmstat.nr_dirty_backgrou=
nd_threshold
   9654041            -0.0%    9653318        proc-vmstat.nr_dirty_threshold
    407385            +0.4%     408818        proc-vmstat.nr_file_pages
     47478            +0.0%      47478        proc-vmstat.nr_free_cma
  48464773            -0.0%   48461156        proc-vmstat.nr_free_pages
    113008            +0.3%     113305        proc-vmstat.nr_inactive_anon
      0.00          -100.0%       0.00        proc-vmstat.nr_inactive_file
     32461            +0.8%      32735        proc-vmstat.nr_kernel_stack
     26121            +0.2%      26171 =C2=B1  2%  proc-vmstat.nr_mapped
    133.46 =C2=B1150%     +62.4%     216.70 =C2=B1100%  proc-vmstat.nr_mlock
      7606            +0.1%       7613        proc-vmstat.nr_page_table_pag=
es
    112903            +1.0%     113991        proc-vmstat.nr_shmem
     33412            -0.7%      33186        proc-vmstat.nr_slab_reclaimab=
le
     75545            -0.3%      75316        proc-vmstat.nr_slab_unreclaim=
able
    294500            +0.1%     294858        proc-vmstat.nr_unevictable
     97650            +1.2%      98788        proc-vmstat.nr_zone_active_an=
on
    113008            +0.3%     113305        proc-vmstat.nr_zone_inactive_=
anon
      0.00          -100.0%       0.00        proc-vmstat.nr_zone_inactive_=
file
    294500            +0.1%     294858        proc-vmstat.nr_zone_unevictab=
le
     30310 =C2=B1 10%      +2.9%      31178 =C2=B1 10%  proc-vmstat.numa_hi=
nt_faults
     29058 =C2=B1 11%      -1.5%      28634 =C2=B1  5%  proc-vmstat.numa_hi=
nt_faults_local
   1398365            +0.2%    1401605        proc-vmstat.numa_hit
     91.23 =C2=B1 38%      -6.1%      85.70 =C2=B1 32%  proc-vmstat.numa_hu=
ge_pte_updates
      0.00          -100.0%       0.00        proc-vmstat.numa_interleave
   1138401            +0.3%    1141513        proc-vmstat.numa_local
    259963            +0.0%     260092        proc-vmstat.numa_other
     11904 =C2=B1 65%     +50.8%      17953 =C2=B1 62%  proc-vmstat.numa_pa=
ges_migrated
    217937 =C2=B1  8%      +1.7%     221590 =C2=B1 10%  proc-vmstat.numa_pt=
e_updates
    159869            +0.4%     160579        proc-vmstat.pgactivate
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma
      0.00          -100.0%       0.00        proc-vmstat.pgalloc_dma32
   1485861            +0.9%    1499684        proc-vmstat.pgalloc_normal
   1379355            +0.3%    1383517        proc-vmstat.pgfault
   1394116 =C2=B1  4%      +1.8%    1419254 =C2=B1  4%  proc-vmstat.pgfree
     11904 =C2=B1 65%     +50.8%      17953 =C2=B1 62%  proc-vmstat.pgmigra=
te_success
      0.00          -100.0%       0.00        proc-vmstat.pgpgin
      0.00          -100.0%       0.00        proc-vmstat.pgpgout
     93249            +0.1%      93319        proc-vmstat.pgreuse
     98.69 =C2=B1  3%      -1.3%      97.40 =C2=B1  2%  proc-vmstat.thp_col=
lapse_alloc
      0.00          -100.0%       0.00        proc-vmstat.thp_deferred_spli=
t_page
     30.23            -0.4%      30.10        proc-vmstat.thp_fault_alloc
      0.00          -100.0%       0.00        proc-vmstat.thp_split_pmd
      0.00          -100.0%       0.00        proc-vmstat.thp_zero_page_all=
oc
     52.62 =C2=B1 75%     +31.0%      68.90 =C2=B1 62%  proc-vmstat.unevict=
able_pgs_culled
    180.31 =C2=B1149%     +62.5%     293.00 =C2=B1100%  proc-vmstat.unevict=
able_pgs_mlocked
      0.04 =C2=B1 28%     +12.4%       0.04 =C2=B1 63%  perf-stat.i.MPKI
 8.655e+10            -2.5%  8.437e+10        perf-stat.i.branch-instructio=
ns
      0.36            +0.0        0.37        perf-stat.i.branch-miss-rate%
 3.025e+08            +2.0%  3.086e+08        perf-stat.i.branch-misses
      9.61 =C2=B1  4%      +0.1        9.70 =C2=B1  4%  perf-stat.i.cache-m=
iss-rate%
   1359065 =C2=B1  3%      +1.5%    1379432 =C2=B1  4%  perf-stat.i.cache-m=
isses
  13120805 =C2=B1  2%      +0.3%   13161288        perf-stat.i.cache-refere=
nces
      2037            +1.3%       2063 =C2=B1  2%  perf-stat.i.context-swit=
ches
      0.99            -0.3%       0.99        perf-stat.i.cpi
    192006            +0.0%     192010        perf-stat.i.cpu-clock
 5.558e+11            -0.2%  5.549e+11        perf-stat.i.cpu-cycles
    270.60            -0.0%     270.59        perf-stat.i.cpu-migrations
    552041 =C2=B1  3%      -0.6%     548577 =C2=B1  5%  perf-stat.i.cycles-=
between-cache-misses
      0.00 =C2=B1 36%      -0.0        0.00 =C2=B1 27%  perf-stat.i.dTLB-lo=
ad-miss-rate%
    361879 =C2=B1 10%      -0.7%     359314 =C2=B1 11%  perf-stat.i.dTLB-lo=
ad-misses
 1.464e+11            +0.0%  1.464e+11        perf-stat.i.dTLB-loads
      0.00 =C2=B1 19%      -0.0        0.00 =C2=B1 17%  perf-stat.i.dTLB-st=
ore-miss-rate%
    275417            -6.7%     256881        perf-stat.i.dTLB-store-misses
 1.103e+11            +0.6%   1.11e+11        perf-stat.i.dTLB-stores
     99.02            +0.8       99.84        perf-stat.i.iTLB-load-miss-ra=
te%
 3.407e+08 =C2=B1  8%     +96.1%   6.68e+08 =C2=B1 29%  perf-stat.i.iTLB-lo=
ad-misses
   2804754 =C2=B1  6%     -90.0%     279419 =C2=B1  9%  perf-stat.i.iTLB-lo=
ads
 5.621e+11            +0.4%  5.644e+11        perf-stat.i.instructions
      1696 =C2=B1  6%     -43.5%     958.17 =C2=B1 36%  perf-stat.i.instruc=
tions-per-iTLB-miss
      1.01            +0.5%       1.02        perf-stat.i.ipc
      1.36            -0.7%       1.35        perf-stat.i.major-faults
      2.89            -0.2%       2.89        perf-stat.i.metric.GHz
     66.81 =C2=B1 54%      +9.6%      73.23        perf-stat.i.metric.K/sec
      1787            -0.4%       1779        perf-stat.i.metric.M/sec
      4332            +0.5%       4354        perf-stat.i.minor-faults
     88.81            -0.0       88.81        perf-stat.i.node-load-miss-ra=
te%
    260186            -0.4%     259219 =C2=B1  3%  perf-stat.i.node-load-mi=
sses
    218173 =C2=B1  6%      -1.1%     215853 =C2=B1  6%  perf-stat.i.node-lo=
ads
     93.30            -0.1       93.16        perf-stat.i.node-store-miss-r=
ate%
     94315 =C2=B1  2%      -1.1%      93310 =C2=B1  3%  perf-stat.i.node-st=
ore-misses
     15315 =C2=B1 10%      -0.2%      15280 =C2=B1  8%  perf-stat.i.node-st=
ores
      4333            +0.5%       4355        perf-stat.i.page-faults
    192006            +0.0%     192010        perf-stat.i.task-clock
      0.02 =C2=B1  2%      -0.2%       0.02        perf-stat.overall.MPKI
      0.35            +0.0        0.37        perf-stat.overall.branch-miss=
-rate%
     10.44 =C2=B1  3%      +0.1       10.55 =C2=B1  4%  perf-stat.overall.c=
ache-miss-rate%
      0.99            -0.6%       0.98        perf-stat.overall.cpi
    401962 =C2=B1  3%      -1.3%     396708 =C2=B1  5%  perf-stat.overall.c=
ycles-between-cache-misses
      0.00 =C2=B1 10%      -0.0        0.00 =C2=B1 11%  perf-stat.overall.d=
TLB-load-miss-rate%
      0.00            -0.0        0.00        perf-stat.overall.dTLB-store-=
miss-rate%
     99.17            +0.8       99.95        perf-stat.overall.iTLB-load-m=
iss-rate%
      1663 =C2=B1  8%     -43.3%     943.36 =C2=B1 36%  perf-stat.overall.i=
nstructions-per-iTLB-miss
      1.01            +0.6%       1.02        perf-stat.overall.ipc
     51.94 =C2=B1  3%      +0.3       52.23 =C2=B1  2%  perf-stat.overall.n=
ode-load-miss-rate%
     85.93            -0.1       85.85        perf-stat.overall.node-store-=
miss-rate%
    141098            -1.3%     139251        perf-stat.overall.path-length
 8.626e+10            -2.5%  8.409e+10        perf-stat.ps.branch-instructi=
ons
 3.015e+08            +2.0%  3.076e+08        perf-stat.ps.branch-misses
   1379833 =C2=B1  3%      +1.3%    1397764 =C2=B1  4%  perf-stat.ps.cache-=
misses
  13219836 =C2=B1  2%      +0.2%   13251963        perf-stat.ps.cache-refer=
ences
      2027            +1.3%       2053 =C2=B1  2%  perf-stat.ps.context-swi=
tches
    191365            +0.0%     191368        perf-stat.ps.cpu-clock
  5.54e+11            -0.2%  5.531e+11        perf-stat.ps.cpu-cycles
    269.29            -0.0%     269.26        perf-stat.ps.cpu-migrations
    393176 =C2=B1 10%      -0.5%     391132 =C2=B1 11%  perf-stat.ps.dTLB-l=
oad-misses
 1.459e+11            +0.0%  1.459e+11        perf-stat.ps.dTLB-loads
    274888            -6.8%     256273        perf-stat.ps.dTLB-store-misses
 1.099e+11            +0.6%  1.106e+11        perf-stat.ps.dTLB-stores
 3.393e+08 =C2=B1  8%     +96.3%  6.661e+08 =C2=B1 29%  perf-stat.ps.iTLB-l=
oad-misses
   2804478 =C2=B1  6%     -90.0%     280958 =C2=B1  9%  perf-stat.ps.iTLB-l=
oads
 5.602e+11            +0.4%  5.625e+11        perf-stat.ps.instructions
      1.35            -0.7%       1.34        perf-stat.ps.major-faults
      4325            +0.4%       4344        perf-stat.ps.minor-faults
    259334            -0.4%     258269 =C2=B1  3%  perf-stat.ps.node-load-m=
isses
    240460 =C2=B1  6%      -1.7%     236472 =C2=B1  5%  perf-stat.ps.node-l=
oads
     93985 =C2=B1  2%      -1.1%      92946 =C2=B1  3%  perf-stat.ps.node-s=
tore-misses
     15388 =C2=B1 10%      -0.5%      15308 =C2=B1  8%  perf-stat.ps.node-s=
tores
      4327            +0.4%       4346        perf-stat.ps.page-faults
    191365            +0.0%     191368        perf-stat.ps.task-clock
 1.695e+14            +0.5%  1.703e+14        perf-stat.total.instructions
      5722 =C2=B1 50%      +7.0%       6125 =C2=B1 47%  numa-meminfo.node0.=
Active
      5722 =C2=B1 50%      +7.0%       6125 =C2=B1 47%  numa-meminfo.node0.=
Active(anon)
     32877 =C2=B1 79%    +131.4%      76066 =C2=B1 71%  numa-meminfo.node0.=
AnonHugePages
     81551 =C2=B1 40%     +76.3%     143803 =C2=B1 49%  numa-meminfo.node0.=
AnonPages
    134758 =C2=B1 48%     +63.2%     219903 =C2=B1 60%  numa-meminfo.node0.=
AnonPages.max
    306949 =C2=B1  5%      +0.8%     309551 =C2=B1  7%  numa-meminfo.node0.=
FilePages
     87693 =C2=B1 40%     +68.3%     147552 =C2=B1 50%  numa-meminfo.node0.=
Inactive
     87693 =C2=B1 40%     +68.3%     147552 =C2=B1 50%  numa-meminfo.node0.=
Inactive(anon)
      0.00          -100.0%       0.00        numa-meminfo.node0.Inactive(f=
ile)
     32382 =C2=B1 21%     +23.4%      39949 =C2=B1 29%  numa-meminfo.node0.=
KReclaimable
      8680 =C2=B1  5%      +9.1%       9468 =C2=B1  6%  numa-meminfo.node0.=
KernelStack
     21282 =C2=B1 20%      -8.0%      19569 =C2=B1 16%  numa-meminfo.node0.=
Mapped
  48298222            -0.2%   48212545        numa-meminfo.node0.MemFree
  49156876            +0.0%   49156876        numa-meminfo.node0.MemTotal
    858652 =C2=B1  5%     +10.0%     944329 =C2=B1 11%  numa-meminfo.node0.=
MemUsed
    132.69 =C2=B1155%    +115.2%     285.50 =C2=B1102%  numa-meminfo.node0.=
Mlocked
      5341 =C2=B1  9%     +14.5%       6113 =C2=B1 18%  numa-meminfo.node0.=
PageTables
     32382 =C2=B1 21%     +23.4%      39949 =C2=B1 29%  numa-meminfo.node0.=
SReclaimable
     80364 =C2=B1 10%      +9.0%      87620 =C2=B1 10%  numa-meminfo.node0.=
SUnreclaim
     11952 =C2=B1 66%     -15.9%      10049 =C2=B1 74%  numa-meminfo.node0.=
Shmem
    112747 =C2=B1 11%     +13.1%     127570 =C2=B1 14%  numa-meminfo.node0.=
Slab
    295015 =C2=B1  5%      +1.6%     299601 =C2=B1  5%  numa-meminfo.node0.=
Unevictable
      6755 =C2=B1 57%      -4.5%       6448 =C2=B1 40%  numa-meminfo.node1.=
Active
      6755 =C2=B1 57%      -4.5%       6448 =C2=B1 40%  numa-meminfo.node1.=
Active(anon)
     38156 =C2=B1119%     -49.3%      19362 =C2=B1 81%  numa-meminfo.node1.=
AnonHugePages
     94536 =C2=B1 64%     -29.3%      66795 =C2=B1 37%  numa-meminfo.node1.=
AnonPages
    249062 =C2=B1 72%      -6.4%     233168 =C2=B1 73%  numa-meminfo.node1.=
AnonPages.max
    310195 =C2=B1  4%      -2.4%     302630 =C2=B1  4%  numa-meminfo.node1.=
FilePages
    100960 =C2=B1 60%     -27.8%      72892 =C2=B1 35%  numa-meminfo.node1.=
Inactive
    100960 =C2=B1 60%     -27.8%      72892 =C2=B1 35%  numa-meminfo.node1.=
Inactive(anon)
     34113 =C2=B1 26%     -17.2%      28243 =C2=B1 33%  numa-meminfo.node1.=
KReclaimable
      8588 =C2=B1 10%     -10.4%       7691 =C2=B1  8%  numa-meminfo.node1.=
KernelStack
     20305 =C2=B1 12%      +2.0%      20720 =C2=B1 11%  numa-meminfo.node1.=
Mapped
  48657079            +0.1%   48702771        numa-meminfo.node1.MemFree
  49534456            +0.0%   49534456        numa-meminfo.node1.MemTotal
    877375 =C2=B1 12%      -5.2%     831683 =C2=B1 10%  numa-meminfo.node1.=
MemUsed
    116.77 =C2=B1150%     +57.9%     184.40 =C2=B1100%  numa-meminfo.node1.=
Mlocked
      7277 =C2=B1 13%      -7.1%       6761 =C2=B1 12%  numa-meminfo.node1.=
PageTables
     34113 =C2=B1 26%     -17.2%      28243 =C2=B1 33%  numa-meminfo.node1.=
SReclaimable
     76116 =C2=B1 15%      -4.3%      72859 =C2=B1 19%  numa-meminfo.node1.=
SUnreclaim
     13231 =C2=B1 44%      -4.7%      12613 =C2=B1 36%  numa-meminfo.node1.=
Shmem
    110229 =C2=B1 17%      -8.3%     101103 =C2=B1 21%  numa-meminfo.node1.=
Slab
    296967 =C2=B1  4%      -2.3%     290016 =C2=B1  3%  numa-meminfo.node1.=
Unevictable
      5358 =C2=B1 50%     +15.1%       6169 =C2=B1 37%  numa-meminfo.node2.=
Active
      5358 =C2=B1 50%     +15.1%       6169 =C2=B1 37%  numa-meminfo.node2.=
Active(anon)
     51614 =C2=B1 99%     -30.5%      35865 =C2=B1 92%  numa-meminfo.node2.=
AnonHugePages
    103401 =C2=B1 58%     -18.8%      83916 =C2=B1 47%  numa-meminfo.node2.=
AnonPages
    163478 =C2=B1 64%      -9.9%     147235 =C2=B1 69%  numa-meminfo.node2.=
AnonPages.max
    310281 =C2=B1  5%      -2.5%     302468 =C2=B1  4%  numa-meminfo.node2.=
FilePages
    109098 =C2=B1 55%     -18.7%      88694 =C2=B1 43%  numa-meminfo.node2.=
Inactive
    109098 =C2=B1 55%     -18.7%      88694 =C2=B1 43%  numa-meminfo.node2.=
Inactive(anon)
     30670 =C2=B1 23%      -2.5%      29898 =C2=B1 40%  numa-meminfo.node2.=
KReclaimable
      7600 =C2=B1  9%      +2.4%       7784 =C2=B1  6%  numa-meminfo.node2.=
KernelStack
     21039 =C2=B1 11%      -5.0%      19994 =C2=B1 11%  numa-meminfo.node2.=
Mapped
  48684003            +0.1%   48721923        numa-meminfo.node2.MemFree
  49534460            +0.0%   49534460        numa-meminfo.node2.MemTotal
    850455 =C2=B1 10%      -4.5%     812535 =C2=B1  8%  numa-meminfo.node2.=
MemUsed
    151.08 =C2=B1156%     +37.5%     207.80 =C2=B1104%  numa-meminfo.node2.=
Mlocked
      8179 =C2=B1  8%      +0.1%       8190 =C2=B1 10%  numa-meminfo.node2.=
PageTables
     30670 =C2=B1 23%      -2.5%      29898 =C2=B1 40%  numa-meminfo.node2.=
SReclaimable
     70756 =C2=B1 16%      -5.4%      66922 =C2=B1 12%  numa-meminfo.node2.=
SUnreclaim
     11162 =C2=B1 42%      -1.1%      11041 =C2=B1 42%  numa-meminfo.node2.=
Shmem
    101427 =C2=B1 16%      -4.5%      96821 =C2=B1 19%  numa-meminfo.node2.=
Slab
    299155 =C2=B1  5%      -2.6%     291450 =C2=B1  4%  numa-meminfo.node2.=
Unevictable
    372215            +1.0%     375850        numa-meminfo.node3.Active
    372215            +1.0%     375850        numa-meminfo.node3.Active(ano=
n)
     52125 =C2=B1 97%     -15.7%      43950 =C2=B1 96%  numa-meminfo.node3.=
AnonHugePages
    111722 =C2=B1 59%     -12.3%      98021 =C2=B1 51%  numa-meminfo.node3.=
AnonPages
    247515 =C2=B1 50%      +2.8%     254358 =C2=B1 59%  numa-meminfo.node3.=
AnonPages.max
    701625            +2.6%     719875        numa-meminfo.node3.FilePages
    154210 =C2=B1 43%      -6.9%     143611 =C2=B1 35%  numa-meminfo.node3.=
Inactive
    154210 =C2=B1 43%      -6.9%     143611 =C2=B1 35%  numa-meminfo.node3.=
Inactive(anon)
     36471 =C2=B1 21%      -5.0%      34647 =C2=B1 28%  numa-meminfo.node3.=
KReclaimable
      7589 =C2=B1  8%      +2.7%       7793 =C2=B1  8%  numa-meminfo.node3.=
KernelStack
     41527 =C2=B1  3%      +3.1%      42821 =C2=B1  8%  numa-meminfo.node3.=
Mapped
  48221530            -0.0%   48210036        numa-meminfo.node3.MemFree
  49489188            -0.0%   49489180        numa-meminfo.node3.MemTotal
   1267656 =C2=B1  8%      +0.9%    1279142 =C2=B1  6%  numa-meminfo.node3.=
MemUsed
    131.15 =C2=B1155%     +42.7%     187.10 =C2=B1100%  numa-meminfo.node3.=
Mlocked
      9636 =C2=B1  6%      -2.5%       9392 =C2=B1  6%  numa-meminfo.node3.=
PageTables
     36471 =C2=B1 21%      -5.0%      34647 =C2=B1 28%  numa-meminfo.node3.=
SReclaimable
     74934 =C2=B1  9%      -1.4%      73852 =C2=B1 14%  numa-meminfo.node3.=
SUnreclaim
    414777            +1.6%     421511 =C2=B1  2%  numa-meminfo.node3.Shmem
    111407 =C2=B1 10%      -2.6%     108500 =C2=B1 17%  numa-meminfo.node3.=
Slab
    286865 =C2=B1  2%      +4.0%     298365 =C2=B1  5%  numa-meminfo.node3.=
Unevictable
      1429 =C2=B1 50%      +7.1%       1530 =C2=B1 47%  numa-vmstat.node0.n=
r_active_anon
     20381 =C2=B1 40%     +76.4%      35961 =C2=B1 49%  numa-vmstat.node0.n=
r_anon_pages
     15.46 =C2=B1 83%    +137.4%      36.70 =C2=B1 72%  numa-vmstat.node0.n=
r_anon_transparent_hugepages
     76734 =C2=B1  5%      +0.8%      77385 =C2=B1  7%  numa-vmstat.node0.n=
r_file_pages
     47478            +0.0%      47478        numa-vmstat.node0.nr_free_cma
  12074419            -0.2%   12053010        numa-vmstat.node0.nr_free_pag=
es
     21915 =C2=B1 40%     +68.4%      36898 =C2=B1 50%  numa-vmstat.node0.n=
r_inactive_anon
      0.00          -100.0%       0.00        numa-vmstat.node0.nr_inactive=
_file
      8684 =C2=B1  5%      +9.0%       9469 =C2=B1  6%  numa-vmstat.node0.n=
r_kernel_stack
      5430 =C2=B1 20%      -7.7%       5013 =C2=B1 16%  numa-vmstat.node0.n=
r_mapped
     33.08 =C2=B1155%    +115.6%      71.30 =C2=B1102%  numa-vmstat.node0.n=
r_mlock
      1337 =C2=B1  9%     +14.3%       1528 =C2=B1 18%  numa-vmstat.node0.n=
r_page_table_pages
      2985 =C2=B1 66%     -15.9%       2510 =C2=B1 74%  numa-vmstat.node0.n=
r_shmem
      8095 =C2=B1 21%     +23.4%       9987 =C2=B1 29%  numa-vmstat.node0.n=
r_slab_reclaimable
     20091 =C2=B1 10%      +9.0%      21905 =C2=B1 10%  numa-vmstat.node0.n=
r_slab_unreclaimable
     73753 =C2=B1  5%      +1.6%      74899 =C2=B1  5%  numa-vmstat.node0.n=
r_unevictable
      1429 =C2=B1 50%      +7.1%       1530 =C2=B1 47%  numa-vmstat.node0.n=
r_zone_active_anon
     21915 =C2=B1 40%     +68.4%      36898 =C2=B1 50%  numa-vmstat.node0.n=
r_zone_inactive_anon
      0.00          -100.0%       0.00        numa-vmstat.node0.nr_zone_ina=
ctive_file
     73753 =C2=B1  5%      +1.6%      74899 =C2=B1  5%  numa-vmstat.node0.n=
r_zone_unevictable
    634084 =C2=B1 10%     +11.5%     707033 =C2=B1 13%  numa-vmstat.node0.n=
uma_hit
     88030            +0.2%      88172        numa-vmstat.node0.numa_interl=
eave
    543602 =C2=B1 14%     +12.6%     612215 =C2=B1 20%  numa-vmstat.node0.n=
uma_local
     90481 =C2=B1 33%      +4.8%      94817 =C2=B1 47%  numa-vmstat.node0.n=
uma_other
      1687 =C2=B1 57%      -4.4%       1612 =C2=B1 40%  numa-vmstat.node1.n=
r_active_anon
     23640 =C2=B1 64%     -29.5%      16673 =C2=B1 36%  numa-vmstat.node1.n=
r_anon_pages
     18.15 =C2=B1121%     -49.9%       9.10 =C2=B1 85%  numa-vmstat.node1.n=
r_anon_transparent_hugepages
     77545 =C2=B1  4%      -2.4%      75656 =C2=B1  4%  numa-vmstat.node1.n=
r_file_pages
  12164118            +0.1%   12175593        numa-vmstat.node1.nr_free_pag=
es
     25242 =C2=B1 60%     -27.9%      18196 =C2=B1 35%  numa-vmstat.node1.n=
r_inactive_anon
      8591 =C2=B1 10%     -10.5%       7692 =C2=B1  8%  numa-vmstat.node1.n=
r_kernel_stack
      5163 =C2=B1 12%      +2.7%       5302 =C2=B1 11%  numa-vmstat.node1.n=
r_mapped
     29.15 =C2=B1150%     +57.8%      46.00 =C2=B1100%  numa-vmstat.node1.n=
r_mlock
      1821 =C2=B1 13%      -7.1%       1691 =C2=B1 12%  numa-vmstat.node1.n=
r_page_table_pages
      3304 =C2=B1 44%      -4.6%       3151 =C2=B1 36%  numa-vmstat.node1.n=
r_shmem
      8527 =C2=B1 26%     -17.2%       7060 =C2=B1 33%  numa-vmstat.node1.n=
r_slab_reclaimable
     19029 =C2=B1 15%      -4.3%      18214 =C2=B1 19%  numa-vmstat.node1.n=
r_slab_unreclaimable
     74241 =C2=B1  4%      -2.3%      72503 =C2=B1  3%  numa-vmstat.node1.n=
r_unevictable
      1687 =C2=B1 57%      -4.4%       1612 =C2=B1 40%  numa-vmstat.node1.n=
r_zone_active_anon
     25242 =C2=B1 60%     -27.9%      18196 =C2=B1 35%  numa-vmstat.node1.n=
r_zone_inactive_anon
     74241 =C2=B1  4%      -2.3%      72503 =C2=B1  3%  numa-vmstat.node1.n=
r_zone_unevictable
    721222 =C2=B1 12%      -6.8%     671922 =C2=B1 14%  numa-vmstat.node1.n=
uma_hit
     87980            +0.0%      88022        numa-vmstat.node1.numa_interl=
eave
    569026 =C2=B1 18%      -9.6%     514448 =C2=B1 19%  numa-vmstat.node1.n=
uma_local
    152195 =C2=B1 22%      +3.5%     157472 =C2=B1 18%  numa-vmstat.node1.n=
uma_other
      1338 =C2=B1 50%     +15.2%       1542 =C2=B1 37%  numa-vmstat.node2.n=
r_active_anon
     25865 =C2=B1 58%     -18.8%      20995 =C2=B1 47%  numa-vmstat.node2.n=
r_anon_pages
     24.69 =C2=B1100%     -31.6%      16.90 =C2=B1 96%  numa-vmstat.node2.n=
r_anon_transparent_hugepages
     77568 =C2=B1  5%      -2.5%      75615 =C2=B1  4%  numa-vmstat.node2.n=
r_file_pages
  12170848            +0.1%   12180348        numa-vmstat.node2.nr_free_pag=
es
     27289 =C2=B1 55%     -18.7%      22188 =C2=B1 43%  numa-vmstat.node2.n=
r_inactive_anon
      7603 =C2=B1  9%      +2.4%       7786 =C2=B1  6%  numa-vmstat.node2.n=
r_kernel_stack
      5355 =C2=B1 11%      -4.0%       5142 =C2=B1 11%  numa-vmstat.node2.n=
r_mapped
     37.69 =C2=B1156%     +37.7%      51.90 =C2=B1104%  numa-vmstat.node2.n=
r_mlock
      2046 =C2=B1  8%      +0.1%       2049 =C2=B1 10%  numa-vmstat.node2.n=
r_page_table_pages
      2788 =C2=B1 42%      -1.1%       2758 =C2=B1 42%  numa-vmstat.node2.n=
r_shmem
      7667 =C2=B1 23%      -2.5%       7474 =C2=B1 40%  numa-vmstat.node2.n=
r_slab_reclaimable
     17689 =C2=B1 16%      -5.4%      16730 =C2=B1 12%  numa-vmstat.node2.n=
r_slab_unreclaimable
     74788 =C2=B1  5%      -2.6%      72862 =C2=B1  4%  numa-vmstat.node2.n=
r_unevictable
      1338 =C2=B1 50%     +15.2%       1542 =C2=B1 37%  numa-vmstat.node2.n=
r_zone_active_anon
     27289 =C2=B1 55%     -18.7%      22188 =C2=B1 43%  numa-vmstat.node2.n=
r_zone_inactive_anon
     74788 =C2=B1  5%      -2.6%      72862 =C2=B1  4%  numa-vmstat.node2.n=
r_zone_unevictable
    688164 =C2=B1 16%      -6.7%     641941 =C2=B1 12%  numa-vmstat.node2.n=
uma_hit
     88030            +0.1%      88159        numa-vmstat.node2.numa_interl=
eave
    533664 =C2=B1 24%      -9.1%     485057 =C2=B1 21%  numa-vmstat.node2.n=
uma_local
    154499 =C2=B1 20%      +1.5%     156883 =C2=B1 16%  numa-vmstat.node2.n=
uma_other
     93120            +1.0%      94094        numa-vmstat.node3.nr_active_a=
non
     27937 =C2=B1 59%     -12.3%      24502 =C2=B1 51%  numa-vmstat.node3.n=
r_anon_pages
     25.00 =C2=B1 99%     -15.6%      21.10 =C2=B1 98%  numa-vmstat.node3.n=
r_anon_transparent_hugepages
    175407            +2.6%     180049        numa-vmstat.node3.nr_file_pag=
es
  12055232            -0.0%   12052311        numa-vmstat.node3.nr_free_pag=
es
     38493 =C2=B1 44%      -6.9%      35848 =C2=B1 35%  numa-vmstat.node3.n=
r_inactive_anon
      0.00          -100.0%       0.00        numa-vmstat.node3.nr_isolated=
_anon
      7592 =C2=B1  8%      +2.7%       7795 =C2=B1  8%  numa-vmstat.node3.n=
r_kernel_stack
     10264 =C2=B1  4%      +3.9%      10662 =C2=B1  7%  numa-vmstat.node3.n=
r_mapped
     32.77 =C2=B1155%     +42.8%      46.80 =C2=B1100%  numa-vmstat.node3.n=
r_mlock
      2411 =C2=B1  6%      -2.6%       2349 =C2=B1  6%  numa-vmstat.node3.n=
r_page_table_pages
    103695            +1.7%     105458 =C2=B1  2%  numa-vmstat.node3.nr_shm=
em
      9119 =C2=B1 21%      -5.0%       8663 =C2=B1 28%  numa-vmstat.node3.n=
r_slab_reclaimable
     18733 =C2=B1  9%      -1.4%      18462 =C2=B1 14%  numa-vmstat.node3.n=
r_slab_unreclaimable
     71716 =C2=B1  2%      +4.0%      74590 =C2=B1  5%  numa-vmstat.node3.n=
r_unevictable
     93120            +1.0%      94094        numa-vmstat.node3.nr_zone_act=
ive_anon
     38493 =C2=B1 44%      -6.9%      35848 =C2=B1 35%  numa-vmstat.node3.n=
r_zone_inactive_anon
     71716 =C2=B1  2%      +4.0%      74590 =C2=B1  5%  numa-vmstat.node3.n=
r_zone_unevictable
    760122 =C2=B1 10%      +6.8%     811965 =C2=B1 14%  numa-vmstat.node3.n=
uma_hit
     87977            +0.0%      88007        numa-vmstat.node3.numa_interl=
eave
    604518 =C2=B1 13%     +10.5%     667796 =C2=B1 18%  numa-vmstat.node3.n=
uma_local
    155603 =C2=B1 20%      -7.3%     144168 =C2=B1 24%  numa-vmstat.node3.n=
uma_other
      1.48            -1.5        0.00        perf-profile.calltrace.cycles=
-pp.rcu_nocb_flush_deferred_wakeup.exit_to_user_mode_prepare.syscall_exit_t=
o_user_mode.entry_SYSCALL_64_after_hwframe.syscall
      8.79            -1.4        7.35        perf-profile.calltrace.cycles=
-pp.syscall_exit_to_user_mode.entry_SYSCALL_64_after_hwframe.syscall
      5.74            -1.3        4.47        perf-profile.calltrace.cycles=
-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_64_af=
ter_hwframe.syscall
      2.08            -0.1        1.96        perf-profile.calltrace.cycles=
-pp.testcase
     53.90            -0.0       53.85        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.syscall
      5.88            +0.0        5.89        perf-profile.calltrace.cycles=
-pp.syscall_return_via_sysret.syscall
      2.16            +0.0        2.20        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_safe_stack.syscall
      2.06            +0.0        2.10        perf-profile.calltrace.cycles=
-pp.syscall_enter_from_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.syscall
      1.88            +0.1        1.98        perf-profile.calltrace.cycles=
-pp.syscall_exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCA=
LL_64_after_hwframe.syscall
     97.75            +0.2       97.93        perf-profile.calltrace.cycles=
-pp.syscall
      8.97            +0.2        9.20        perf-profile.calltrace.cycles=
-pp.hash_futex.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
     30.96            +0.4       31.32        perf-profile.calltrace.cycles=
-pp.__entry_text_start.syscall
      5.09            +0.7        5.80        perf-profile.calltrace.cycles=
-pp.get_futex_key.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
     23.42            +0.8       24.20        perf-profile.calltrace.cycles=
-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
     28.94            +1.0       29.98        perf-profile.calltrace.cycles=
-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.s=
yscall
     34.20            +1.4       35.56        perf-profile.calltrace.cycles=
-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
     38.11            +1.5       39.57        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.syscall
      1.55            -1.5        0.00        perf-profile.children.cycles-=
pp.rcu_nocb_flush_deferred_wakeup
      6.02            -1.5        4.52        perf-profile.children.cycles-=
pp.exit_to_user_mode_prepare
      9.43            -1.4        8.00        perf-profile.children.cycles-=
pp.syscall_exit_to_user_mode
      2.25            -0.2        2.10        perf-profile.children.cycles-=
pp.testcase
      0.51 =C2=B1  2%      -0.1        0.45 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.syscall(a)plt
      0.86 =C2=B1  4%      -0.0        0.81 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.asm_sysvec_apic_timer_interrupt
      0.80 =C2=B1  4%      -0.0        0.76 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.sysvec_apic_timer_interrupt
     54.33            -0.0       54.28        perf-profile.children.cycles-=
pp.entry_SYSCALL_64_after_hwframe
      0.74 =C2=B1  4%      -0.0        0.70 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.hrtimer_interrupt
      0.74 =C2=B1  4%      -0.0        0.70 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.__sysvec_apic_timer_interrupt
      0.12 =C2=B1 14%      -0.0        0.10 =C2=B1 11%  perf-profile.childr=
en.cycles-pp.ktime_get_update_offsets_now
      0.12 =C2=B1 26%      -0.0        0.10 =C2=B1 24%  perf-profile.childr=
en.cycles-pp.ktime_get
      0.04 =C2=B1 55%      -0.0        0.03 =C2=B1100%  perf-profile.childr=
en.cycles-pp.process_simple
      0.04 =C2=B1 55%      -0.0        0.03 =C2=B1101%  perf-profile.childr=
en.cycles-pp.cmd_sched
      0.05 =C2=B1 55%      -0.0        0.03 =C2=B1 83%  perf-profile.childr=
en.cycles-pp.__libc_start_main
      0.05 =C2=B1 55%      -0.0        0.03 =C2=B1 83%  perf-profile.childr=
en.cycles-pp.main
      0.05 =C2=B1 55%      -0.0        0.03 =C2=B1 83%  perf-profile.childr=
en.cycles-pp.run_builtin
      0.05 =C2=B1 56%      -0.0        0.04 =C2=B1 82%  perf-profile.childr=
en.cycles-pp.cmd_record
      0.03 =C2=B1 79%      -0.0        0.02 =C2=B1123%  perf-profile.childr=
en.cycles-pp.ordered_events__queue
      0.03 =C2=B1 79%      -0.0        0.02 =C2=B1123%  perf-profile.childr=
en.cycles-pp.queue_event
      0.05 =C2=B1 55%      -0.0        0.04 =C2=B1 82%  perf-profile.childr=
en.cycles-pp.record__finish_output
      0.05 =C2=B1 55%      -0.0        0.04 =C2=B1 82%  perf-profile.childr=
en.cycles-pp.perf_session__process_events
      0.51 =C2=B1  3%      -0.0        0.50 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__hrtimer_run_queues
      0.43 =C2=B1  3%      -0.0        0.43 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.tick_sched_timer
      0.09 =C2=B1  8%      -0.0        0.08 =C2=B1 10%  perf-profile.childr=
en.cycles-pp.clockevents_program_event
      0.06 =C2=B1  9%      -0.0        0.05 =C2=B1 34%  perf-profile.childr=
en.cycles-pp.perf_mux_hrtimer_handler
      0.16 =C2=B1  4%      -0.0        0.16        perf-profile.children.cy=
cles-pp.perf_prepare_sample
      0.15 =C2=B1  4%      -0.0        0.15        perf-profile.children.cy=
cles-pp.get_perf_callchain
      0.29 =C2=B1  3%      +0.0        0.29 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.task_tick_fair
      0.31 =C2=B1  3%      +0.0        0.31        perf-profile.children.cy=
cles-pp.scheduler_tick
      0.19 =C2=B1  4%      +0.0        0.19        perf-profile.children.cy=
cles-pp.perf_swevent_overflow
      0.14 =C2=B1  4%      +0.0        0.14 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.perf_callchain_kernel
      0.15 =C2=B1  4%      +0.0        0.15        perf-profile.children.cy=
cles-pp.perf_callchain
      0.19 =C2=B1  4%      +0.0        0.19        perf-profile.children.cy=
cles-pp.__perf_event_overflow
      0.37 =C2=B1  5%      +0.0        0.38        perf-profile.children.cy=
cles-pp.update_process_times
      0.21 =C2=B1  2%      +0.0        0.21        perf-profile.children.cy=
cles-pp.update_curr
      0.20 =C2=B1  3%      +0.0        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.perf_trace_sched_stat_runtime
      0.20 =C2=B1  3%      +0.0        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.perf_tp_event
      0.19 =C2=B1  4%      +0.0        0.19        perf-profile.children.cy=
cles-pp.perf_event_output_forward
      0.38 =C2=B1  5%      +0.0        0.38        perf-profile.children.cy=
cles-pp.tick_sched_handle
      0.05 =C2=B1  8%      +0.0        0.05 =C2=B1  9%  perf-profile.childr=
en.cycles-pp.__unwind_start
      0.11 =C2=B1  5%      +0.0        0.11 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.unwind_next_frame
      0.00            +0.0        0.01 =C2=B1299%  perf-profile.children.cy=
cles-pp.hrtimer_active
      0.27 =C2=B1  2%      +0.0        0.28        perf-profile.children.cy=
cles-pp.__x86_indirect_thunk_rax
      2.08            +0.0        2.12        perf-profile.children.cycles-=
pp.syscall_enter_from_user_mode
      2.29            +0.0        2.33        perf-profile.children.cycles-=
pp.entry_SYSCALL_64_safe_stack
      1.92            +0.1        2.01        perf-profile.children.cycles-=
pp.syscall_exit_to_user_mode_prepare
     98.04            +0.1       98.19        perf-profile.children.cycles-=
pp.syscall
     20.06            +0.2       20.24        perf-profile.children.cycles-=
pp.__entry_text_start
     16.93            +0.2       17.15        perf-profile.children.cycles-=
pp.syscall_return_via_sysret
      9.05            +0.2        9.28        perf-profile.children.cycles-=
pp.hash_futex
      5.23            +0.8        6.02        perf-profile.children.cycles-=
pp.get_futex_key
     24.09            +0.9       24.98        perf-profile.children.cycles-=
pp.futex_wake
     29.37            +1.1       30.45        perf-profile.children.cycles-=
pp.do_futex
     34.64            +1.4       36.04        perf-profile.children.cycles-=
pp.__x64_sys_futex
     38.28            +1.5       39.75        perf-profile.children.cycles-=
pp.do_syscall_64
      1.33            -1.3        0.00        perf-profile.self.cycles-pp.r=
cu_nocb_flush_deferred_wakeup
      4.39            -0.2        4.23        perf-profile.self.cycles-pp.e=
xit_to_user_mode_prepare
      1.82            -0.1        1.68        perf-profile.self.cycles-pp.t=
estcase
      6.74            -0.1        6.64        perf-profile.self.cycles-pp.e=
ntry_SYSCALL_64_after_hwframe
     10.01            -0.0        9.97        perf-profile.self.cycles-pp.f=
utex_wake
      0.34 =C2=B1  4%      -0.0        0.31 =C2=B1  4%  perf-profile.self.c=
ycles-pp.syscall@plt
      0.12 =C2=B1 14%      -0.0        0.09 =C2=B1 10%  perf-profile.self.c=
ycles-pp.ktime_get_update_offsets_now
      0.11 =C2=B1 28%      -0.0        0.09 =C2=B1 25%  perf-profile.self.c=
ycles-pp.ktime_get
      9.15            -0.0        9.14        perf-profile.self.cycles-pp._=
_entry_text_start
      0.03 =C2=B1 79%      -0.0        0.02 =C2=B1122%  perf-profile.self.c=
ycles-pp.queue_event
      1.84            -0.0        1.84        perf-profile.self.cycles-pp.s=
yscall_exit_to_user_mode
      0.05 =C2=B1 28%      +0.0        0.05        perf-profile.self.cycles=
-pp.unwind_next_frame
     15.06            +0.0       15.07        perf-profile.self.cycles-pp.s=
yscall
      0.00            +0.0        0.01 =C2=B1299%  perf-profile.self.cycles=
-pp.hrtimer_active
      0.23 =C2=B1  2%      +0.0        0.24 =C2=B1  2%  perf-profile.self.c=
ycles-pp.__x86_indirect_thunk_rax
      1.33            +0.0        1.37        perf-profile.self.cycles-pp.d=
o_syscall_64
      1.77            +0.0        1.81        perf-profile.self.cycles-pp.s=
yscall_enter_from_user_mode
      2.28            +0.0        2.33        perf-profile.self.cycles-pp.e=
ntry_SYSCALL_64_safe_stack
      1.80            +0.1        1.88        perf-profile.self.cycles-pp.s=
yscall_exit_to_user_mode_prepare
      8.62            +0.2        8.78        perf-profile.self.cycles-pp.h=
ash_futex
      5.36            +0.2        5.53        perf-profile.self.cycles-pp.d=
o_futex
     16.79            +0.2       17.00        perf-profile.self.cycles-pp.s=
yscall_return_via_sysret
      5.24            +0.3        5.57        perf-profile.self.cycles-pp._=
_x64_sys_futex
      4.89            +0.8        5.68        perf-profile.self.cycles-pp.g=
et_futex_key
      8.59 =C2=B1204%     -53.9%       3.96 =C2=B1299%  sched_debug.cfs_rq:=
/.MIN_vruntime.avg
    937.90 =C2=B1196%     -26.9%     685.34 =C2=B1299%  sched_debug.cfs_rq:=
/.MIN_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.MIN_vrun=
time.min
     88.81 =C2=B1198%     -41.5%      51.95 =C2=B1299%  sched_debug.cfs_rq:=
/.MIN_vruntime.stddev
      4932 =C2=B1  6%      +0.3%       4949 =C2=B1  5%  sched_debug.cfs_rq:=
/.load.avg
     28586 =C2=B1156%     +17.1%      33473 =C2=B1149%  sched_debug.cfs_rq:=
/.load.max
      4485            -0.4%       4470        sched_debug.cfs_rq:/.load.min
      2603 =C2=B1139%     +12.3%       2923 =C2=B1123%  sched_debug.cfs_rq:=
/.load.stddev
      7.52 =C2=B1 16%      +5.7%       7.94 =C2=B1 19%  sched_debug.cfs_rq:=
/.load_avg.avg
    141.04 =C2=B1 19%     +24.3%     175.27 =C2=B1 31%  sched_debug.cfs_rq:=
/.load_avg.max
      4.15            +0.3%       4.17        sched_debug.cfs_rq:/.load_avg=
.min
     16.61 =C2=B1 30%     +19.3%      19.81 =C2=B1 32%  sched_debug.cfs_rq:=
/.load_avg.stddev
      8.59 =C2=B1204%     -53.9%       3.96 =C2=B1299%  sched_debug.cfs_rq:=
/.max_vruntime.avg
    937.90 =C2=B1196%     -26.9%     685.34 =C2=B1299%  sched_debug.cfs_rq:=
/.max_vruntime.max
      0.00            +0.0%       0.00        sched_debug.cfs_rq:/.max_vrun=
time.min
     88.81 =C2=B1198%     -41.5%      51.95 =C2=B1299%  sched_debug.cfs_rq:=
/.max_vruntime.stddev
  30128742            +0.1%   30152961        sched_debug.cfs_rq:/.min_vrun=
time.avg
  30251085            +0.1%   30272410        sched_debug.cfs_rq:/.min_vrun=
time.max
  28685289            -0.0%   28672656        sched_debug.cfs_rq:/.min_vrun=
time.min
    267234 =C2=B1  3%      +1.1%     270194 =C2=B1  3%  sched_debug.cfs_rq:=
/.min_vruntime.stddev
      0.84            -0.1%       0.84        sched_debug.cfs_rq:/.nr_runni=
ng.avg
      1.00            +0.0%       1.00        sched_debug.cfs_rq:/.nr_runni=
ng.max
      0.83            -0.0%       0.83        sched_debug.cfs_rq:/.nr_runni=
ng.min
      0.04 =C2=B1 16%      -2.7%       0.04 =C2=B1 14%  sched_debug.cfs_rq:=
/.nr_running.stddev
      0.58 =C2=B1168%     +68.9%       0.98 =C2=B1136%  sched_debug.cfs_rq:=
/.removed.load_avg.avg
     51.36 =C2=B1150%     +60.3%      82.32 =C2=B1100%  sched_debug.cfs_rq:=
/.removed.load_avg.max
      5.27 =C2=B1155%     +61.5%       8.50 =C2=B1108%  sched_debug.cfs_rq:=
/.removed.load_avg.stddev
      0.25 =C2=B1195%     +38.8%       0.35 =C2=B1115%  sched_debug.cfs_rq:=
/.removed.runnable_avg.avg
     19.37 =C2=B1167%     +79.2%      34.72 =C2=B1103%  sched_debug.cfs_rq:=
/.removed.runnable_avg.max
      2.12 =C2=B1180%     +55.7%       3.30 =C2=B1106%  sched_debug.cfs_rq:=
/.removed.runnable_avg.stddev
      0.25 =C2=B1195%     +38.8%       0.35 =C2=B1115%  sched_debug.cfs_rq:=
/.removed.util_avg.avg
     19.37 =C2=B1167%     +79.1%      34.70 =C2=B1103%  sched_debug.cfs_rq:=
/.removed.util_avg.max
      2.12 =C2=B1180%     +55.6%       3.30 =C2=B1106%  sched_debug.cfs_rq:=
/.removed.util_avg.stddev
    886.24            -0.1%     885.72        sched_debug.cfs_rq:/.runnable=
_avg.avg
      1491 =C2=B1  6%      +2.3%       1524 =C2=B1  7%  sched_debug.cfs_rq:=
/.runnable_avg.max
    835.54            +0.8%     842.23        sched_debug.cfs_rq:/.runnable=
_avg.min
     78.71 =C2=B1 11%      +4.2%      82.03 =C2=B1 11%  sched_debug.cfs_rq:=
/.runnable_avg.stddev
    812632 =C2=B1 20%      -7.5%     751480 =C2=B1  5%  sched_debug.cfs_rq:=
/.spread0.avg
    931866 =C2=B1 18%      -6.9%     867643 =C2=B1  4%  sched_debug.cfs_rq:=
/.spread0.max
   -634707           +15.4%    -732744        sched_debug.cfs_rq:/.spread0.=
min
    267215 =C2=B1  3%      +1.1%     270208 =C2=B1  3%  sched_debug.cfs_rq:=
/.spread0.stddev
    881.97            -0.1%     881.10        sched_debug.cfs_rq:/.util_avg=
.avg
      1077 =C2=B1  2%      +0.9%       1086 =C2=B1  4%  sched_debug.cfs_rq:=
/.util_avg.max
    703.65 =C2=B1 11%      +3.4%     727.57 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_avg.min
     54.59 =C2=B1 11%      +1.2%      55.24 =C2=B1  9%  sched_debug.cfs_rq:=
/.util_avg.stddev
    393.82            +0.1%     394.34        sched_debug.cfs_rq:/.util_est=
_enqueued.avg
    651.95 =C2=B1  6%      +2.8%     670.10 =C2=B1  4%  sched_debug.cfs_rq:=
/.util_est_enqueued.max
     86.79 =C2=B1 97%     +65.2%     143.40 =C2=B1 78%  sched_debug.cfs_rq:=
/.util_est_enqueued.min
     68.77 =C2=B1  6%      -2.6%      66.96 =C2=B1  5%  sched_debug.cfs_rq:=
/.util_est_enqueued.stddev
    954731 =C2=B1  3%      +0.2%     956314 =C2=B1  2%  sched_debug.cpu.avg=
_idle.avg
   1831238 =C2=B1 21%     +11.6%    2043593 =C2=B1 35%  sched_debug.cpu.avg=
_idle.max
    606802 =C2=B1  5%      +1.0%     613105 =C2=B1  5%  sched_debug.cpu.avg=
_idle.min
    166314 =C2=B1 39%      +7.9%     179452 =C2=B1 36%  sched_debug.cpu.avg=
_idle.stddev
    192690            -1.5%     189889        sched_debug.cpu.clock.avg
    192727            -1.5%     189928        sched_debug.cpu.clock.max
    192652            -1.5%     189851        sched_debug.cpu.clock.min
     23.07 =C2=B1  4%      +3.7%      23.92 =C2=B1  4%  sched_debug.cpu.clo=
ck.stddev
    190808            -1.4%     188143        sched_debug.cpu.clock_task.avg
    191049            -1.4%     188357        sched_debug.cpu.clock_task.max
    182899            -1.2%     180755        sched_debug.cpu.clock_task.min
    710.35 =C2=B1  4%      -9.0%     646.39 =C2=B1 22%  sched_debug.cpu.clo=
ck_task.stddev
      3157            +0.4%       3171        sched_debug.cpu.curr->pid.avg
      7227 =C2=B1  7%      -4.1%       6930 =C2=B1 13%  sched_debug.cpu.cur=
r->pid.max
      2963            +1.3%       3001        sched_debug.cpu.curr->pid.min
    376.60 =C2=B1 11%      -4.4%     360.07 =C2=B1 18%  sched_debug.cpu.cur=
r->pid.stddev
    502858            +0.0%     502902        sched_debug.cpu.max_idle_bala=
nce_cost.avg
    587693 =C2=B1  9%      +3.9%     610743 =C2=B1 14%  sched_debug.cpu.max=
_idle_balance_cost.max
    500000            +0.0%     500000        sched_debug.cpu.max_idle_bala=
nce_cost.min
     11413 =C2=B1 68%     +16.8%      13327 =C2=B1 65%  sched_debug.cpu.max=
_idle_balance_cost.stddev
      4294            -0.0%       4294        sched_debug.cpu.next_balance.=
avg
      4294            -0.0%       4294        sched_debug.cpu.next_balance.=
max
      4294            -0.0%       4294        sched_debug.cpu.next_balance.=
min
      0.00 =C2=B1  5%      +3.2%       0.00 =C2=B1  3%  sched_debug.cpu.nex=
t_balance.stddev
      0.85            +0.2%       0.85        sched_debug.cpu.nr_running.avg
      1.73 =C2=B1  7%      +1.1%       1.75 =C2=B1  4%  sched_debug.cpu.nr_=
running.max
      0.83            -0.0%       0.83        sched_debug.cpu.nr_running.min
      0.10 =C2=B1 11%      +6.6%       0.11 =C2=B1 10%  sched_debug.cpu.nr_=
running.stddev
      3215            +0.7%       3239        sched_debug.cpu.nr_switches.a=
vg
     26347 =C2=B1  9%      -1.6%      25915 =C2=B1  7%  sched_debug.cpu.nr_=
switches.max
      1278 =C2=B1 13%     +17.1%       1496 =C2=B1  8%  sched_debug.cpu.nr_=
switches.min
      3218 =C2=B1  3%      +0.7%       3239 =C2=B1  3%  sched_debug.cpu.nr_=
switches.stddev
      0.00 =C2=B1 45%     +22.8%       0.00 =C2=B1 26%  sched_debug.cpu.nr_=
uninterruptible.avg
    187.65 =C2=B1  2%      -2.3%     183.28        sched_debug.cpu.nr_unint=
erruptible.max
    -18.81            -2.5%     -18.33        sched_debug.cpu.nr_uninterrup=
tible.min
     14.69 =C2=B1  3%      -2.8%      14.28        sched_debug.cpu.nr_unint=
erruptible.stddev
    192651            -1.5%     189850        sched_debug.cpu_clk
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
avg
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
max
    996147            +0.0%     996147        sched_debug.dl_rq:.dl_bw->bw.=
min
 4.295e+09            -0.0%  4.295e+09        sched_debug.jiffies
    191780            -1.5%     188977        sched_debug.ktime
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.avg
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.max
    950.00            +0.0%     950.00        sched_debug.rt_rq:/.rt_runtim=
e.min
      0.02 =C2=B1346%     -68.6%       0.01 =C2=B1300%  sched_debug.rt_rq:/=
.rt_time.avg
      4.42 =C2=B1346%     -67.6%       1.43 =C2=B1300%  sched_debug.rt_rq:/=
.rt_time.max
      0.00 =C2=B1346%    -100.0%       0.00        sched_debug.rt_rq:/.rt_t=
ime.min
      0.32 =C2=B1346%     -67.6%       0.10 =C2=B1300%  sched_debug.rt_rq:/=
.rt_time.stddev
    193039            -1.2%     190759        sched_debug.sched_clk
      1.00            +0.0%       1.00        sched_debug.sched_clock_stabl=
e()
   4140603            +0.0%    4140603        sched_debug.sysctl_sched.sysc=
tl_sched_features
     24.00            +0.0%      24.00        sched_debug.sysctl_sched.sysc=
tl_sched_latency
      3.00            +0.0%       3.00        sched_debug.sysctl_sched.sysc=
tl_sched_min_granularity
      1.00            +0.0%       1.00        sched_debug.sysctl_sched.sysc=
tl_sched_tunable_scaling
      4.00            +0.0%       4.00        sched_debug.sysctl_sched.sysc=
tl_sched_wakeup_granularity
    382410            -0.0%     382401        slabinfo.Acpi-Operand.active_=
objs
      6830            -0.0%       6829        slabinfo.Acpi-Operand.active_=
slabs
    382524            -0.0%     382480        slabinfo.Acpi-Operand.num_objs
      6830            -0.0%       6829        slabinfo.Acpi-Operand.num_sla=
bs
      1420 =C2=B1  5%      +0.7%       1430 =C2=B1 10%  slabinfo.Acpi-Parse=
.active_objs
     19.46 =C2=B1  5%      +0.7%      19.60 =C2=B1 10%  slabinfo.Acpi-Parse=
.active_slabs
      1420 =C2=B1  5%      +0.7%       1430 =C2=B1 10%  slabinfo.Acpi-Parse=
.num_objs
     19.46 =C2=B1  5%      +0.7%      19.60 =C2=B1 10%  slabinfo.Acpi-Parse=
.num_slabs
      9919            +0.4%       9955        slabinfo.Acpi-State.active_ob=
js
    194.00            +0.4%     194.80        slabinfo.Acpi-State.active_sl=
abs
      9919            +0.4%       9955        slabinfo.Acpi-State.num_objs
    194.00            +0.4%     194.80        slabinfo.Acpi-State.num_slabs
      2793 =C2=B1  5%      -0.1%       2791 =C2=B1  5%  slabinfo.PING.activ=
e_objs
     86.69 =C2=B1  6%      +0.2%      86.90 =C2=B1  5%  slabinfo.PING.activ=
e_slabs
      2793 =C2=B1  5%      -0.1%       2791 =C2=B1  5%  slabinfo.PING.num_o=
bjs
     86.69 =C2=B1  6%      +0.2%      86.90 =C2=B1  5%  slabinfo.PING.num_s=
labs
    384.00            +0.0%     384.00        slabinfo.RAW.active_objs
     12.00            +0.0%      12.00        slabinfo.RAW.active_slabs
    384.00            +0.0%     384.00        slabinfo.RAW.num_objs
     12.00            +0.0%      12.00        slabinfo.RAW.num_slabs
    214.00 =C2=B1  5%      -1.6%     210.60 =C2=B1  3%  slabinfo.RAWv6.acti=
ve_objs
      8.23 =C2=B1  5%      -1.6%       8.10 =C2=B1  3%  slabinfo.RAWv6.acti=
ve_slabs
    214.00 =C2=B1  5%      -1.6%     210.60 =C2=B1  3%  slabinfo.RAWv6.num_=
objs
      8.23 =C2=B1  5%      -1.6%       8.10 =C2=B1  3%  slabinfo.RAWv6.num_=
slabs
     54.92 =C2=B1  6%      +2.0%      56.00        slabinfo.TCP.active_objs
      3.92 =C2=B1  6%      +2.0%       4.00        slabinfo.TCP.active_slabs
     54.92 =C2=B1  6%      +2.0%      56.00        slabinfo.TCP.num_objs
      3.92 =C2=B1  6%      +2.0%       4.00        slabinfo.TCP.num_slabs
     39.00            -3.3%      37.70 =C2=B1 10%  slabinfo.TCPv6.active_ob=
js
      3.00            -3.3%       2.90 =C2=B1 10%  slabinfo.TCPv6.active_sl=
abs
     39.00            -3.3%      37.70 =C2=B1 10%  slabinfo.TCPv6.num_objs
      3.00            -3.3%       2.90 =C2=B1 10%  slabinfo.TCPv6.num_slabs
    149.15 =C2=B1  8%      +3.8%     154.80 =C2=B1  7%  slabinfo.UDPv6.acti=
ve_objs
      5.46 =C2=B1  9%      +4.4%       5.70 =C2=B1  8%  slabinfo.UDPv6.acti=
ve_slabs
    149.15 =C2=B1  8%      +3.8%     154.80 =C2=B1  7%  slabinfo.UDPv6.num_=
objs
      5.46 =C2=B1  9%      +4.4%       5.70 =C2=B1  8%  slabinfo.UDPv6.num_=
slabs
     37213 =C2=B1  3%      +0.4%      37349 =C2=B1  4%  slabinfo.anon_vma.a=
ctive_objs
    808.54 =C2=B1  3%      +0.3%     811.30 =C2=B1  4%  slabinfo.anon_vma.a=
ctive_slabs
     37213 =C2=B1  3%      +0.4%      37349 =C2=B1  4%  slabinfo.anon_vma.n=
um_objs
    808.54 =C2=B1  3%      +0.3%     811.30 =C2=B1  4%  slabinfo.anon_vma.n=
um_slabs
     80875 =C2=B1  2%      +0.2%      81051 =C2=B1  2%  slabinfo.anon_vma_c=
hain.active_objs
      1263 =C2=B1  2%      +0.2%       1265 =C2=B1  2%  slabinfo.anon_vma_c=
hain.active_slabs
     80899 =C2=B1  2%      +0.2%      81051 =C2=B1  2%  slabinfo.anon_vma_c=
hain.num_objs
      1263 =C2=B1  2%      +0.2%       1265 =C2=B1  2%  slabinfo.anon_vma_c=
hain.num_slabs
     41.54 =C2=B1 12%      +5.9%      44.00 =C2=B1 18%  slabinfo.bdev_cache=
.active_objs
      2.08 =C2=B1 12%      +5.9%       2.20 =C2=B1 18%  slabinfo.bdev_cache=
.active_slabs
     41.54 =C2=B1 12%      +5.9%      44.00 =C2=B1 18%  slabinfo.bdev_cache=
.num_objs
      2.08 =C2=B1 12%      +5.9%       2.20 =C2=B1 18%  slabinfo.bdev_cache=
.num_slabs
     25.85 =C2=B1 30%      -7.1%      24.00 =C2=B1 33%  slabinfo.biovec-128=
.active_objs
      1.62 =C2=B1 30%      -7.1%       1.50 =C2=B1 33%  slabinfo.biovec-128=
.active_slabs
     25.85 =C2=B1 30%      -7.1%      24.00 =C2=B1 33%  slabinfo.biovec-128=
.num_objs
      1.62 =C2=B1 30%      -7.1%       1.50 =C2=B1 33%  slabinfo.biovec-128=
.num_slabs
    258.46 =C2=B1 27%     +16.4%     300.80 =C2=B1 31%  slabinfo.biovec-64.=
active_objs
      8.08 =C2=B1 27%     +16.4%       9.40 =C2=B1 31%  slabinfo.biovec-64.=
active_slabs
    258.46 =C2=B1 27%     +16.4%     300.80 =C2=B1 31%  slabinfo.biovec-64.=
num_objs
      8.08 =C2=B1 27%     +16.4%       9.40 =C2=B1 31%  slabinfo.biovec-64.=
num_slabs
     64.00            +1.2%      64.80 =C2=B1  3%  slabinfo.biovec-max.acti=
ve_objs
      8.00            +1.2%       8.10 =C2=B1  3%  slabinfo.biovec-max.acti=
ve_slabs
     64.00            +1.2%      64.80 =C2=B1  3%  slabinfo.biovec-max.num_=
objs
      8.00            +1.2%       8.10 =C2=B1  3%  slabinfo.biovec-max.num_=
slabs
     81.00 =C2=B1 12%     +10.7%      89.70 =C2=B1 39%  slabinfo.buffer_hea=
d.active_objs
      2.08 =C2=B1 12%     +10.7%       2.30 =C2=B1 39%  slabinfo.buffer_hea=
d.active_slabs
     81.00 =C2=B1 12%     +10.7%      89.70 =C2=B1 39%  slabinfo.buffer_hea=
d.num_objs
      2.08 =C2=B1 12%     +10.7%       2.30 =C2=B1 39%  slabinfo.buffer_hea=
d.num_slabs
     10320            -0.0%      10315        slabinfo.cred_jar.active_objs
    244.92            -0.1%     244.80        slabinfo.cred_jar.active_slabs
     10320            -0.0%      10315        slabinfo.cred_jar.num_objs
    244.92            -0.1%     244.80        slabinfo.cred_jar.num_slabs
     42.00            +0.0%      42.00        slabinfo.dax_cache.active_objs
      1.00            +0.0%       1.00        slabinfo.dax_cache.active_sla=
bs
     42.00            +0.0%      42.00        slabinfo.dax_cache.num_objs
      1.00            +0.0%       1.00        slabinfo.dax_cache.num_slabs
    171791            -2.8%     166977 =C2=B1  2%  slabinfo.dentry.active_o=
bjs
      4109            -2.7%       3997 =C2=B1  2%  slabinfo.dentry.active_s=
labs
    172610            -2.7%     167924 =C2=B1  2%  slabinfo.dentry.num_objs
      4109            -2.7%       3997 =C2=B1  2%  slabinfo.dentry.num_slabs
     30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.=
active_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.=
active_slabs
     30.00            +0.0%      30.00        slabinfo.dmaengine-unmap-128.=
num_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-128.=
num_slabs
      1302 =C2=B1 24%      +8.7%       1415 =C2=B1 18%  slabinfo.dmaengine-=
unmap-16.active_objs
     30.46 =C2=B1 24%      +9.0%      33.20 =C2=B1 18%  slabinfo.dmaengine-=
unmap-16.active_slabs
      1302 =C2=B1 24%      +8.7%       1415 =C2=B1 18%  slabinfo.dmaengine-=
unmap-16.num_objs
     30.46 =C2=B1 24%      +9.0%      33.20 =C2=B1 18%  slabinfo.dmaengine-=
unmap-16.num_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.=
active_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.=
active_slabs
     15.00            +0.0%      15.00        slabinfo.dmaengine-unmap-256.=
num_objs
      1.00            +0.0%       1.00        slabinfo.dmaengine-unmap-256.=
num_slabs
     32956 =C2=B1 17%      +3.7%      34176 =C2=B1 17%  slabinfo.ep_head.ac=
tive_objs
    128.23 =C2=B1 17%      +3.8%     133.10 =C2=B1 17%  slabinfo.ep_head.ac=
tive_slabs
     32956 =C2=B1 17%      +3.7%      34176 =C2=B1 17%  slabinfo.ep_head.nu=
m_objs
    128.23 =C2=B1 17%      +3.8%     133.10 =C2=B1 17%  slabinfo.ep_head.nu=
m_slabs
      1140 =C2=B1 12%      -0.6%       1134 =C2=B1  5%  slabinfo.file_lock_=
cache.active_objs
     30.54 =C2=B1 12%      -0.1%      30.50 =C2=B1  5%  slabinfo.file_lock_=
cache.active_slabs
      1140 =C2=B1 12%      -0.6%       1134 =C2=B1  5%  slabinfo.file_lock_=
cache.num_objs
     30.54 =C2=B1 12%      -0.1%      30.50 =C2=B1  5%  slabinfo.file_lock_=
cache.num_slabs
      9029 =C2=B1  6%      +2.5%       9256 =C2=B1  2%  slabinfo.files_cach=
e.active_objs
    195.69 =C2=B1  6%      +2.6%     200.80 =C2=B1  2%  slabinfo.files_cach=
e.active_slabs
      9029 =C2=B1  6%      +2.5%       9256 =C2=B1  2%  slabinfo.files_cach=
e.num_objs
    195.69 =C2=B1  6%      +2.6%     200.80 =C2=B1  2%  slabinfo.files_cach=
e.num_slabs
     77087 =C2=B1  4%      -5.0%      73237 =C2=B1  5%  slabinfo.filp.activ=
e_objs
      1209 =C2=B1  4%      -5.0%       1149 =C2=B1  5%  slabinfo.filp.activ=
e_slabs
     77448 =C2=B1  4%      -5.0%      73589 =C2=B1  5%  slabinfo.filp.num_o=
bjs
      1209 =C2=B1  4%      -5.0%       1149 =C2=B1  5%  slabinfo.filp.num_s=
labs
      2776 =C2=B1  6%      +3.7%       2880 =C2=B1 10%  slabinfo.fsnotify_m=
ark_connector.active_objs
     21.69 =C2=B1  6%      +3.7%      22.50 =C2=B1 10%  slabinfo.fsnotify_m=
ark_connector.active_slabs
      2776 =C2=B1  6%      +3.7%       2880 =C2=B1 10%  slabinfo.fsnotify_m=
ark_connector.num_objs
     21.69 =C2=B1  6%      +3.7%      22.50 =C2=B1 10%  slabinfo.fsnotify_m=
ark_connector.num_slabs
     50418            +0.1%      50464        slabinfo.ftrace_event_field.a=
ctive_objs
    593.15            +0.1%     593.70        slabinfo.ftrace_event_field.a=
ctive_slabs
     50418            +0.1%      50464        slabinfo.ftrace_event_field.n=
um_objs
    593.15            +0.1%     593.70        slabinfo.ftrace_event_field.n=
um_slabs
    104.00            +0.0%     104.00        slabinfo.hugetlbfs_inode_cach=
e.active_objs
      2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_cach=
e.active_slabs
    104.00            +0.0%     104.00        slabinfo.hugetlbfs_inode_cach=
e.num_objs
      2.00            +0.0%       2.00        slabinfo.hugetlbfs_inode_cach=
e.num_slabs
     96298            -0.2%      96098        slabinfo.inode_cache.active_o=
bjs
      1786            -0.2%       1783        slabinfo.inode_cache.active_s=
labs
     96492            -0.2%      96298        slabinfo.inode_cache.num_objs
      1786            -0.2%       1783        slabinfo.inode_cache.num_slabs
     44.00            +0.0%      44.00        slabinfo.ip6-frags.active_objs
      1.00            +0.0%       1.00        slabinfo.ip6-frags.active_sla=
bs
     44.00            +0.0%      44.00        slabinfo.ip6-frags.num_objs
      1.00            +0.0%       1.00        slabinfo.ip6-frags.num_slabs
    131770            +0.1%     131916        slabinfo.kernfs_node_cache.ac=
tive_objs
      2058            +0.1%       2060        slabinfo.kernfs_node_cache.ac=
tive_slabs
    131770            +0.1%     131916        slabinfo.kernfs_node_cache.nu=
m_objs
      2058            +0.1%       2060        slabinfo.kernfs_node_cache.nu=
m_slabs
      6328 =C2=B1 14%      +7.0%       6772 =C2=B1  3%  slabinfo.khugepaged=
_mm_slot.active_objs
    175.54 =C2=B1 15%      +6.9%     187.70 =C2=B1  3%  slabinfo.khugepaged=
_mm_slot.active_slabs
      6328 =C2=B1 14%      +7.0%       6772 =C2=B1  3%  slabinfo.khugepaged=
_mm_slot.num_objs
    175.54 =C2=B1 15%      +6.9%     187.70 =C2=B1  3%  slabinfo.khugepaged=
_mm_slot.num_slabs
     15047            -0.2%      15012        slabinfo.kmalloc-128.active_o=
bjs
    237.38            -0.4%     236.50        slabinfo.kmalloc-128.active_s=
labs
     15228            -0.3%      15183        slabinfo.kmalloc-128.num_objs
    237.38            -0.4%     236.50        slabinfo.kmalloc-128.num_slabs
     61966            -0.1%      61887        slabinfo.kmalloc-16.active_ob=
js
    242.54            -0.2%     242.10        slabinfo.kmalloc-16.active_sl=
abs
     62089            -0.2%      61977        slabinfo.kmalloc-16.num_objs
    242.54            -0.2%     242.10        slabinfo.kmalloc-16.num_slabs
     10489            -0.1%      10483        slabinfo.kmalloc-192.active_o=
bjs
    255.77            -0.1%     255.60        slabinfo.kmalloc-192.active_s=
labs
     10751            -0.2%      10735        slabinfo.kmalloc-192.num_objs
    255.77            -0.1%     255.60        slabinfo.kmalloc-192.num_slabs
     10077 =C2=B1  2%      -2.0%       9875        slabinfo.kmalloc-1k.acti=
ve_objs
    319.23 =C2=B1  2%      -1.6%     314.20        slabinfo.kmalloc-1k.acti=
ve_slabs
     10230 =C2=B1  2%      -1.6%      10066        slabinfo.kmalloc-1k.num_=
objs
    319.23 =C2=B1  2%      -1.6%     314.20        slabinfo.kmalloc-1k.num_=
slabs
     16739            -0.1%      16722        slabinfo.kmalloc-256.active_o=
bjs
    267.08            +0.0%     267.20        slabinfo.kmalloc-256.active_s=
labs
     17126            +0.0%      17134        slabinfo.kmalloc-256.num_objs
    267.08            +0.0%     267.20        slabinfo.kmalloc-256.num_slabs
     12133 =C2=B1  2%      +0.3%      12171 =C2=B1  2%  slabinfo.kmalloc-2k=
.active_objs
    770.31 =C2=B1  2%      +0.2%     771.60 =C2=B1  2%  slabinfo.kmalloc-2k=
.active_slabs
     12330 =C2=B1  2%      +0.2%      12355 =C2=B1  2%  slabinfo.kmalloc-2k=
.num_objs
    770.31 =C2=B1  2%      +0.2%     771.60 =C2=B1  2%  slabinfo.kmalloc-2k=
.num_slabs
    137223            +0.8%     138284        slabinfo.kmalloc-32.active_ob=
js
      1076            +0.7%       1084        slabinfo.kmalloc-32.active_sl=
abs
    137835            +0.7%     138816        slabinfo.kmalloc-32.num_objs
      1076            +0.7%       1084        slabinfo.kmalloc-32.num_slabs
      3117            +0.2%       3122        slabinfo.kmalloc-4k.active_ob=
js
    395.23            -0.0%     395.20        slabinfo.kmalloc-4k.active_sl=
abs
      3165            -0.0%       3165        slabinfo.kmalloc-4k.num_objs
    395.23            -0.0%     395.20        slabinfo.kmalloc-4k.num_slabs
     27807 =C2=B1  2%      -1.7%      27326 =C2=B1  4%  slabinfo.kmalloc-51=
2.active_objs
    440.23 =C2=B1  3%      -1.6%     433.30 =C2=B1  4%  slabinfo.kmalloc-51=
2.active_slabs
     28206 =C2=B1  3%      -1.6%      27768 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_objs
    440.23 =C2=B1  3%      -1.6%     433.30 =C2=B1  4%  slabinfo.kmalloc-51=
2.num_slabs
     88862            +0.2%      89014        slabinfo.kmalloc-64.active_ob=
js
      1394            +0.1%       1396        slabinfo.kmalloc-64.active_sl=
abs
     89268            +0.2%      89412        slabinfo.kmalloc-64.num_objs
      1394            +0.1%       1396        slabinfo.kmalloc-64.num_slabs
    105184            -0.1%     105062        slabinfo.kmalloc-8.active_objs
    212.31            -0.2%     211.90        slabinfo.kmalloc-8.active_sla=
bs
    108972            -0.1%     108844        slabinfo.kmalloc-8.num_objs
    212.31            -0.2%     211.90        slabinfo.kmalloc-8.num_slabs
      1481            +0.1%       1483        slabinfo.kmalloc-8k.active_ob=
js
    383.31            +0.1%     383.60        slabinfo.kmalloc-8k.active_sl=
abs
      1535            +0.1%       1537        slabinfo.kmalloc-8k.num_objs
    383.31            +0.1%     383.60        slabinfo.kmalloc-8k.num_slabs
     15720 =C2=B1  2%      -0.6%      15625 =C2=B1  2%  slabinfo.kmalloc-96=
.active_objs
    377.15 =C2=B1  2%      -0.6%     374.80 =C2=B1  2%  slabinfo.kmalloc-96=
.active_slabs
     15856 =C2=B1  2%      -0.6%      15762 =C2=B1  2%  slabinfo.kmalloc-96=
.num_objs
    377.15 =C2=B1  2%      -0.6%     374.80 =C2=B1  2%  slabinfo.kmalloc-96=
.num_slabs
    625.23 =C2=B1  4%      -0.7%     620.80 =C2=B1 13%  slabinfo.kmalloc-rc=
l-128.active_objs
      9.77 =C2=B1  4%      -0.7%       9.70 =C2=B1 13%  slabinfo.kmalloc-rc=
l-128.active_slabs
    625.23 =C2=B1  4%      -0.7%     620.80 =C2=B1 13%  slabinfo.kmalloc-rc=
l-128.num_objs
      9.77 =C2=B1  4%      -0.7%       9.70 =C2=B1 13%  slabinfo.kmalloc-rc=
l-128.num_slabs
     87.23 =C2=B1 12%      +5.9%      92.40 =C2=B1 18%  slabinfo.kmalloc-rc=
l-192.active_objs
      2.08 =C2=B1 12%      +5.9%       2.20 =C2=B1 18%  slabinfo.kmalloc-rc=
l-192.active_slabs
     87.23 =C2=B1 12%      +5.9%      92.40 =C2=B1 18%  slabinfo.kmalloc-rc=
l-192.num_objs
      2.08 =C2=B1 12%      +5.9%       2.20 =C2=B1 18%  slabinfo.kmalloc-rc=
l-192.num_slabs
    192.00            +0.0%     192.00        slabinfo.kmalloc-rcl-256.acti=
ve_objs
      3.00            +0.0%       3.00        slabinfo.kmalloc-rcl-256.acti=
ve_slabs
    192.00            +0.0%     192.00        slabinfo.kmalloc-rcl-256.num_=
objs
      3.00            +0.0%       3.00        slabinfo.kmalloc-rcl-256.num_=
slabs
     14145            -0.1%      14135        slabinfo.kmalloc-rcl-512.acti=
ve_objs
    220.62            -0.1%     220.30        slabinfo.kmalloc-rcl-512.acti=
ve_slabs
     14150            -0.1%      14139        slabinfo.kmalloc-rcl-512.num_=
objs
    220.62            -0.1%     220.30        slabinfo.kmalloc-rcl-512.num_=
slabs
      7000 =C2=B1  4%      -0.9%       6937 =C2=B1  5%  slabinfo.kmalloc-rc=
l-64.active_objs
    108.54 =C2=B1  4%      -0.7%     107.80 =C2=B1  5%  slabinfo.kmalloc-rc=
l-64.active_slabs
      7000 =C2=B1  4%      -0.9%       6937 =C2=B1  5%  slabinfo.kmalloc-rc=
l-64.num_objs
    108.54 =C2=B1  4%      -0.7%     107.80 =C2=B1  5%  slabinfo.kmalloc-rc=
l-64.num_slabs
      2036 =C2=B1  6%      +1.5%       2067 =C2=B1  6%  slabinfo.kmalloc-rc=
l-96.active_objs
     48.31 =C2=B1  6%      +1.4%      49.00 =C2=B1  7%  slabinfo.kmalloc-rc=
l-96.active_slabs
      2036 =C2=B1  6%      +1.5%       2067 =C2=B1  6%  slabinfo.kmalloc-rc=
l-96.num_objs
     48.31 =C2=B1  6%      +1.4%      49.00 =C2=B1  7%  slabinfo.kmalloc-rc=
l-96.num_slabs
    713.85 =C2=B1 11%      -0.5%     710.40 =C2=B1 17%  slabinfo.kmem_cache=
.active_objs
     11.15 =C2=B1 11%      -0.5%      11.10 =C2=B1 17%  slabinfo.kmem_cache=
.active_slabs
    713.85 =C2=B1 11%      -0.5%     710.40 =C2=B1 17%  slabinfo.kmem_cache=
.num_objs
     11.15 =C2=B1 11%      -0.5%      11.10 =C2=B1 17%  slabinfo.kmem_cache=
.num_slabs
      1184 =C2=B1  6%      -0.3%       1181 =C2=B1 10%  slabinfo.kmem_cache=
_node.active_objs
     20.15 =C2=B1  6%      -0.3%      20.10 =C2=B1  9%  slabinfo.kmem_cache=
_node.active_slabs
      1289 =C2=B1  6%      -0.3%       1286 =C2=B1  9%  slabinfo.kmem_cache=
_node.num_objs
     20.15 =C2=B1  6%      -0.3%      20.10 =C2=B1  9%  slabinfo.kmem_cache=
_node.num_slabs
     36090            +0.1%      36144        slabinfo.lsm_file_cache.activ=
e_objs
    211.38            +0.1%     211.70        slabinfo.lsm_file_cache.activ=
e_slabs
     36090            +0.1%      36144        slabinfo.lsm_file_cache.num_o=
bjs
    211.38            +0.1%     211.70        slabinfo.lsm_file_cache.num_s=
labs
      6059 =C2=B1  2%      +0.8%       6111        slabinfo.mm_struct.activ=
e_objs
    201.23 =C2=B1  2%      +0.9%     203.00        slabinfo.mm_struct.activ=
e_slabs
      6059 =C2=B1  2%      +0.8%       6111        slabinfo.mm_struct.num_o=
bjs
    201.23 =C2=B1  2%      +0.9%     203.00        slabinfo.mm_struct.num_s=
labs
    897.38 =C2=B1  8%      +5.0%     942.60 =C2=B1  9%  slabinfo.mnt_cache.=
active_objs
     16.62 =C2=B1  9%      +5.9%      17.60 =C2=B1  9%  slabinfo.mnt_cache.=
active_slabs
    897.38 =C2=B1  8%      +5.0%     942.60 =C2=B1  9%  slabinfo.mnt_cache.=
num_objs
     16.62 =C2=B1  9%      +5.9%      17.60 =C2=B1  9%  slabinfo.mnt_cache.=
num_slabs
     34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.a=
ctive_objs
      1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.a=
ctive_slabs
     34.00            +0.0%      34.00        slabinfo.mqueue_inode_cache.n=
um_objs
      1.00            +0.0%       1.00        slabinfo.mqueue_inode_cache.n=
um_slabs
      1536            -0.0%       1536        slabinfo.names_cache.active_o=
bjs
    192.08            -0.0%     192.00        slabinfo.names_cache.active_s=
labs
      1536            -0.0%       1536        slabinfo.names_cache.num_objs
    192.08            -0.0%     192.00        slabinfo.names_cache.num_slabs
     36.00            +0.0%      36.00        slabinfo.nfs_read_data.active=
_objs
      1.00            +0.0%       1.00        slabinfo.nfs_read_data.active=
_slabs
     36.00            +0.0%      36.00        slabinfo.nfs_read_data.num_ob=
js
      1.00            +0.0%       1.00        slabinfo.nfs_read_data.num_sl=
abs
    310.00            +0.0%     310.00        slabinfo.numa_policy.active_o=
bjs
      5.00            +0.0%       5.00        slabinfo.numa_policy.active_s=
labs
    310.00            +0.0%     310.00        slabinfo.numa_policy.num_objs
      5.00            +0.0%       5.00        slabinfo.numa_policy.num_slabs
     14359 =C2=B1  6%      -8.5%      13135 =C2=B1  9%  slabinfo.pde_opener=
.active_objs
    140.31 =C2=B1  6%      -8.6%     128.20 =C2=B1  9%  slabinfo.pde_opener=
.active_slabs
     14359 =C2=B1  6%      -8.5%      13135 =C2=B1  9%  slabinfo.pde_opener=
.num_objs
    140.31 =C2=B1  6%      -8.6%     128.20 =C2=B1  9%  slabinfo.pde_opener=
.num_slabs
     13900 =C2=B1  2%      +0.9%      14028        slabinfo.pid.active_objs
    216.46 =C2=B1  2%      +0.9%     218.40        slabinfo.pid.active_slabs
     13900 =C2=B1  2%      +0.9%      14028        slabinfo.pid.num_objs
    216.46 =C2=B1  2%      +0.9%     218.40        slabinfo.pid.num_slabs
      3409 =C2=B1  6%      +0.3%       3419 =C2=B1  7%  slabinfo.pool_workq=
ueue.active_objs
     56.15 =C2=B1  7%      +0.6%      56.50 =C2=B1  7%  slabinfo.pool_workq=
ueue.active_slabs
      3606 =C2=B1  6%      +0.4%       3620 =C2=B1  7%  slabinfo.pool_workq=
ueue.num_objs
     56.15 =C2=B1  7%      +0.6%      56.50 =C2=B1  7%  slabinfo.pool_workq=
ueue.num_slabs
      2778 =C2=B1  2%      +0.4%       2788        slabinfo.proc_dir_entry.=
active_objs
     66.15 =C2=B1  2%      +0.4%      66.40        slabinfo.proc_dir_entry.=
active_slabs
      2778 =C2=B1  2%      +0.4%       2788        slabinfo.proc_dir_entry.=
num_objs
     66.15 =C2=B1  2%      +0.4%      66.40        slabinfo.proc_dir_entry.=
num_slabs
     22466            +0.1%      22480 =C2=B1  2%  slabinfo.proc_inode_cach=
e.active_objs
    474.54 =C2=B1  2%      +0.3%     476.00 =C2=B1  2%  slabinfo.proc_inode=
_cache.active_slabs
     22801 =C2=B1  2%      +0.3%      22874 =C2=B1  2%  slabinfo.proc_inode=
_cache.num_objs
    474.54 =C2=B1  2%      +0.3%     476.00 =C2=B1  2%  slabinfo.proc_inode=
_cache.num_slabs
     28519            +0.1%      28539        slabinfo.radix_tree_node.acti=
ve_objs
    508.77            +0.1%     509.20        slabinfo.radix_tree_node.acti=
ve_slabs
     28519            +0.1%      28539        slabinfo.radix_tree_node.num_=
objs
    508.77            +0.1%     509.20        slabinfo.radix_tree_node.num_=
slabs
     22.15 =C2=B1 35%     +22.8%      27.20 =C2=B1 26%  slabinfo.request_qu=
eue.active_objs
      1.38 =C2=B1 35%     +22.8%       1.70 =C2=B1 26%  slabinfo.request_qu=
eue.active_slabs
     22.15 =C2=B1 35%     +22.8%      27.20 =C2=B1 26%  slabinfo.request_qu=
eue.num_objs
      1.38 =C2=B1 35%     +22.8%       1.70 =C2=B1 26%  slabinfo.request_qu=
eue.num_slabs
     51.00            +0.0%      51.00        slabinfo.rpc_inode_cache.acti=
ve_objs
      1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.acti=
ve_slabs
     51.00            +0.0%      51.00        slabinfo.rpc_inode_cache.num_=
objs
      1.00            +0.0%       1.00        slabinfo.rpc_inode_cache.num_=
slabs
    320.00            +0.0%     320.00        slabinfo.scsi_sense_cache.act=
ive_objs
      5.00            +0.0%       5.00        slabinfo.scsi_sense_cache.act=
ive_slabs
    320.00            +0.0%     320.00        slabinfo.scsi_sense_cache.num=
_objs
      5.00            +0.0%       5.00        slabinfo.scsi_sense_cache.num=
_slabs
     13056            +0.0%      13056        slabinfo.seq_file.active_objs
    192.00            +0.0%     192.00        slabinfo.seq_file.active_slabs
     13056            +0.0%      13056        slabinfo.seq_file.num_objs
    192.00            +0.0%     192.00        slabinfo.seq_file.num_slabs
      8521 =C2=B1  6%      -0.3%       8492 =C2=B1  4%  slabinfo.shmem_inod=
e_cache.active_objs
    184.62 =C2=B1  6%      -0.2%     184.30 =C2=B1  4%  slabinfo.shmem_inod=
e_cache.active_slabs
      8521 =C2=B1  6%      -0.3%       8492 =C2=B1  4%  slabinfo.shmem_inod=
e_cache.num_objs
    184.62 =C2=B1  6%      -0.2%     184.30 =C2=B1  4%  slabinfo.shmem_inod=
e_cache.num_slabs
      4505 =C2=B1  4%      +1.8%       4586        slabinfo.sighand_cache.a=
ctive_objs
    302.69 =C2=B1  4%      +2.1%     309.00        slabinfo.sighand_cache.a=
ctive_slabs
      4551 =C2=B1  4%      +2.0%       4643        slabinfo.sighand_cache.n=
um_objs
    302.69 =C2=B1  4%      +2.1%     309.00        slabinfo.sighand_cache.n=
um_slabs
      7059 =C2=B1  4%      +1.0%       7127 =C2=B1  2%  slabinfo.signal_cac=
he.active_objs
    254.23 =C2=B1  4%      +1.3%     257.50 =C2=B1  2%  slabinfo.signal_cac=
he.active_slabs
      7133 =C2=B1  4%      +1.3%       7224 =C2=B1  2%  slabinfo.signal_cac=
he.num_objs
    254.23 =C2=B1  4%      +1.3%     257.50 =C2=B1  2%  slabinfo.signal_cac=
he.num_slabs
    128.00            +0.0%     128.00        slabinfo.skbuff_fclone_cache.=
active_objs
      2.00            +0.0%       2.00        slabinfo.skbuff_fclone_cache.=
active_slabs
    128.00            +0.0%     128.00        slabinfo.skbuff_fclone_cache.=
num_objs
      2.00            +0.0%       2.00        slabinfo.skbuff_fclone_cache.=
num_slabs
     13233 =C2=B1  2%      -0.4%      13177 =C2=B1  2%  slabinfo.skbuff_hea=
d_cache.active_objs
    207.15 =C2=B1  2%      -0.6%     205.90 =C2=B1  2%  slabinfo.skbuff_hea=
d_cache.active_slabs
     13257 =C2=B1  2%      -0.6%      13177 =C2=B1  2%  slabinfo.skbuff_hea=
d_cache.num_objs
    207.15 =C2=B1  2%      -0.6%     205.90 =C2=B1  2%  slabinfo.skbuff_hea=
d_cache.num_slabs
      4799 =C2=B1  4%      +1.1%       4853 =C2=B1  5%  slabinfo.sock_inode=
_cache.active_objs
    122.46 =C2=B1  4%      +1.4%     124.20 =C2=B1  5%  slabinfo.sock_inode=
_cache.active_slabs
      4799 =C2=B1  4%      +1.1%       4853 =C2=B1  5%  slabinfo.sock_inode=
_cache.num_objs
    122.46 =C2=B1  4%      +1.4%     124.20 =C2=B1  5%  slabinfo.sock_inode=
_cache.num_slabs
     11580 =C2=B1  5%      +2.1%      11820 =C2=B1  2%  slabinfo.task_delay=
_info.active_objs
    226.54 =C2=B1  5%      +2.1%     231.30 =C2=B1  2%  slabinfo.task_delay=
_info.active_slabs
     11580 =C2=B1  5%      +2.1%      11820 =C2=B1  2%  slabinfo.task_delay=
_info.num_objs
    226.54 =C2=B1  5%      +2.1%     231.30 =C2=B1  2%  slabinfo.task_delay=
_info.num_slabs
      1456 =C2=B1  5%      -3.8%       1401 =C2=B1  4%  slabinfo.task_group=
.active_objs
     31.38 =C2=B1  5%      -4.1%      30.10 =C2=B1  4%  slabinfo.task_group=
.active_slabs
      1456 =C2=B1  5%      -3.8%       1401 =C2=B1  4%  slabinfo.task_group=
.num_objs
     31.38 =C2=B1  5%      -4.1%      30.10 =C2=B1  4%  slabinfo.task_group=
.num_slabs
      2319            -0.3%       2312        slabinfo.task_struct.active_o=
bjs
      2333            -0.3%       2326        slabinfo.task_struct.active_s=
labs
      2333            -0.3%       2326        slabinfo.task_struct.num_objs
      2333            -0.3%       2326        slabinfo.task_struct.num_slabs
    145.00            +0.0%     145.00        slabinfo.taskstats.active_objs
      3.00            +0.0%       3.00        slabinfo.taskstats.active_sla=
bs
    145.00            +0.0%     145.00        slabinfo.taskstats.num_objs
      3.00            +0.0%       3.00        slabinfo.taskstats.num_slabs
      3858            -0.1%       3853 =C2=B1  2%  slabinfo.trace_event_fil=
e.active_objs
     83.77            +0.0%      83.80 =C2=B1  2%  slabinfo.trace_event_fil=
e.active_slabs
      3858            +0.1%       3861 =C2=B1  2%  slabinfo.trace_event_fil=
e.num_objs
     83.77            +0.0%      83.80 =C2=B1  2%  slabinfo.trace_event_fil=
e.num_slabs
     66.00            +0.0%      66.00        slabinfo.tw_sock_TCP.active_o=
bjs
      1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.active_s=
labs
     66.00            +0.0%      66.00        slabinfo.tw_sock_TCP.num_objs
      1.00            +0.0%       1.00        slabinfo.tw_sock_TCP.num_slabs
     92347 =C2=B1  3%      -0.9%      91497 =C2=B1  4%  slabinfo.vm_area_st=
ruct.active_objs
      2315 =C2=B1  3%      -0.9%       2294 =C2=B1  4%  slabinfo.vm_area_st=
ruct.active_slabs
     92640 =C2=B1  3%      -0.9%      91784 =C2=B1  4%  slabinfo.vm_area_st=
ruct.num_objs
      2315 =C2=B1  3%      -0.9%       2294 =C2=B1  4%  slabinfo.vm_area_st=
ruct.num_slabs
     22380            +0.2%      22428        slabinfo.vmap_area.active_objs
    349.46            +0.2%     350.20        slabinfo.vmap_area.active_sla=
bs
     22392            +0.2%      22445        slabinfo.vmap_area.num_objs
    349.46            +0.2%     350.20        slabinfo.vmap_area.num_slabs
     42.00            +0.0%      42.00        slabinfo.xfrm_state.active_ob=
js
      1.00            +0.0%       1.00        slabinfo.xfrm_state.active_sl=
abs
     42.00            +0.0%      42.00        slabinfo.xfrm_state.num_objs
      1.00            +0.0%       1.00        slabinfo.xfrm_state.num_slabs
     63.69 =C2=B1 23%      -3.9%      61.20 =C2=B1 37%  slabinfo.xfs_btree_=
cur.active_objs
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 37%  slabinfo.xfs_btree_=
cur.active_slabs
     63.69 =C2=B1 23%      -3.9%      61.20 =C2=B1 37%  slabinfo.xfs_btree_=
cur.num_objs
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 37%  slabinfo.xfs_btree_=
cur.num_slabs
    193.85 =C2=B1 13%      -2.5%     189.00 =C2=B1 17%  slabinfo.xfs_buf.ac=
tive_objs
      4.62 =C2=B1 13%      -2.5%       4.50 =C2=B1 17%  slabinfo.xfs_buf.ac=
tive_slabs
    193.85 =C2=B1 13%      -2.5%     189.00 =C2=B1 17%  slabinfo.xfs_buf.nu=
m_objs
      4.62 =C2=B1 13%      -2.5%       4.50 =C2=B1 17%  slabinfo.xfs_buf.nu=
m_slabs
     38.00            +0.0%      38.00        slabinfo.xfs_efi_item.active_=
objs
      1.00            +0.0%       1.00        slabinfo.xfs_efi_item.active_=
slabs
     38.00            +0.0%      38.00        slabinfo.xfs_efi_item.num_objs
      1.00            +0.0%       1.00        slabinfo.xfs_efi_item.num_sla=
bs
     96.00            +0.0%      96.00        slabinfo.xfs_inode.active_objs
      3.00            +0.0%       3.00        slabinfo.xfs_inode.active_sla=
bs
     96.00            +0.0%      96.00        slabinfo.xfs_inode.num_objs
      3.00            +0.0%       3.00        slabinfo.xfs_inode.num_slabs
      0.01 =C2=B1  6%      -2.5%       0.01 =C2=B1  6%  perf-sched.sch_dela=
y.avg.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unkn=
own]
      0.24 =C2=B1320%    +883.0%       2.32 =C2=B1171%  perf-sched.sch_dela=
y.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.21 =C2=B1249%    +204.4%       0.65 =C2=B1142%  perf-sched.sch_dela=
y.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      2.61 =C2=B1 28%      +7.0%       2.80 =C2=B1 97%  perf-sched.sch_dela=
y.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
      0.02 =C2=B1 97%     +10.9%       0.02 =C2=B1172%  perf-sched.sch_dela=
y.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
      0.02 =C2=B1 48%      +1.5%       0.02 =C2=B1 52%  perf-sched.sch_dela=
y.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.65 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault=
.[unknown]
      0.00 =C2=B1234%     +30.0%       0.00 =C2=B1200%  perf-sched.sch_dela=
y.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ap=
ic_timer_interrupt.[unknown]
      0.00 =C2=B1143%      +8.3%       0.00 =C2=B1 89%  perf-sched.sch_dela=
y.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_=
64_after_hwframe.[unknown]
      0.02 =C2=B1 19%     +12.4%       0.03 =C2=B1 26%  perf-sched.sch_dela=
y.avg.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
      0.29 =C2=B1258%     -49.5%       0.14 =C2=B1180%  perf-sched.sch_dela=
y.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00 =C2=B1234%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__get_fre=
e_pages.__pud_alloc
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__get_fre=
e_pages.pgd_alloc
      0.00 =C2=B1182%     +22.6%       0.00 =C2=B1154%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__pm=
d_alloc.copy_page_range
      0.65 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.alloc_pag=
es_vma.wp_page_copy
      0.00 =C2=B1150%     -54.7%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.pte_=
alloc_one.__pte_alloc
      0.46 =C2=B1108%     -34.9%       0.30 =C2=B1152%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.__flush_work.lru_add_drain_=
all.khugepaged
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.__fput.task_work_run.exit_to_use=
r_mode_prepare
      0.00 =C2=B1234%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.__kmalloc.security_prepare_creds=
.prepare_creds
      0.00 =C2=B1234%    +130.5%       0.00 =C2=B1152%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.__kmalloc.security_task_all=
oc.copy_process
      0.00 =C2=B1182%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.__kmalloc_node.__vmalloc_node_ra=
nge.dup_task_struct
      0.00       +5.9e+101%       0.59 =C2=B1300%  perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.__mutex_lock.isra.0
      0.00        +1.2e+99%       0.00 =C2=B1300%  perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.__vmalloc_node_range.dup_task_st=
ruct.copy_process
      0.00        +1.4e+99%       0.00 =C2=B1300%  perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.cgroup_can_fork.copy_process.ker=
nel_clone
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.copy_page_from_iter.pipe_write.n=
ew_sync_write
      0.00 =C2=B1161%     +12.4%       0.01 =C2=B1124%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.copy_page_range.dup_mmap.du=
p_mm
      0.00          +1e+99%       0.00 =C2=B1300%  perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.copy_page_to_iter.pipe_read.new_=
sync_read
      0.00 =C2=B1152%     +32.5%       0.01 =C2=B1122%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.copy_pte_range.copy_page_ra=
nge.dup_mmap
      0.00 =C2=B1204%  +22609.4%       0.28 =C2=B1298%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc_page=
_fault.asm_exc_page_fault
      0.01 =C2=B1108%      -5.6%       0.01 =C2=B1123%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_clone.a=
non_vma_fork
      0.00 =C2=B1234%    +104.3%       0.00 =C2=B1152%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_fork.du=
p_mmap
      0.00 =C2=B1150%    +105.1%       0.01 =C2=B1 83%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.down_write.dup_mmap.dup_mm
      0.16 =C2=B1230%    +348.3%       0.70 =C2=B1 65%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.khugepaged.kthread.ret_from=
_fork
      0.00 =C2=B1346%     +43.0%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.alloc_pid.=
copy_process
      0.00 =C2=B1234%     -26.5%       0.00 =C2=B1299%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.anon_vma_f=
ork.dup_mmap
      0.00 =C2=B1234%     -32.2%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.copy_fs_st=
ruct.copy_process
      0.00 =C2=B1346%     +30.0%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.copy_proce=
ss.kernel_clone
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.dup_mm.copy_pro=
cess
      0.00 =C2=B1150%      -7.5%       0.00 =C2=B1152%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.prepare_cr=
eds.copy_creds
      0.00 =C2=B1151%     -60.2%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.vm_area_du=
p.dup_mmap
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc_node_trace.__ge=
t_vm_area_node.__vmalloc_node_range
      9.36            -0.2%       9.34        perf-sched.sch_delay.avg.ms.p=
reempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bprm_execve
      0.00        +1.3e+99%       0.00 =C2=B1299%  perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.uprobe_start_dup_mmap.dup_mmap.d=
up_mm
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_move_=
task.__set_cpus_allowed_ptr
      0.01           +96.7%       0.02 =C2=B1148%  perf-sched.sch_delay.avg=
.ms.rcu_gp_kthread.kthread.ret_from_fork
      0.05 =C2=B1 53%     -23.2%       0.03 =C2=B1 35%  perf-sched.sch_dela=
y.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epo=
ll_wait
      0.02 =C2=B1 36%      -3.0%       0.02 =C2=B1 41%  perf-sched.sch_dela=
y.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.d=
o_select
      0.00 =C2=B1148%     -59.1%       0.00 =C2=B1 27%  perf-sched.sch_dela=
y.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.d=
o_sys_poll
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.schedule_preempt_disabled.__mutex_lock.isra.0.pipe_read
      0.17 =C2=B1340%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.schedule_timeout.__skb_wait_for_more_packets.unix_dgram_recvmsg.__sys_r=
ecvfrom
      0.01 =C2=B1  3%      -1.7%       0.01        perf-sched.sch_delay.avg=
.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.01            +6.7%       0.01 =C2=B1 18%  perf-sched.sch_delay.avg=
.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      0.38 =C2=B1126%    -100.0%       0.00        perf-sched.sch_delay.avg=
.ms.schedule_timeout.wait_for_completion.__flush_work.lru_add_drain_all
      0.01            -0.0%       0.01        perf-sched.sch_delay.avg.ms.s=
mpboot_thread_fn.kthread.ret_from_fork
      0.05 =C2=B1153%    +118.0%       0.11 =C2=B1154%  perf-sched.sch_dela=
y.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open.isra
      0.98 =C2=B1193%     -26.2%       0.73 =C2=B1292%  perf-sched.sch_dela=
y.avg.ms.worker_thread.kthread.ret_from_fork
      0.01 =C2=B1 21%      -7.8%       0.01 =C2=B1 22%  perf-sched.sch_dela=
y.max.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unkn=
own]
      0.67 =C2=B1336%    +377.0%       3.20 =C2=B1154%  perf-sched.sch_dela=
y.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      4.56 =C2=B1265%    +211.9%      14.23 =C2=B1144%  perf-sched.sch_dela=
y.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      7.80 =C2=B1 28%     -20.3%       6.21 =C2=B1 68%  perf-sched.sch_dela=
y.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      4.60 =C2=B1112%     -13.5%       3.98 =C2=B1165%  perf-sched.sch_dela=
y.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
      0.73 =C2=B1329%     +28.3%       0.93 =C2=B1285%  perf-sched.sch_dela=
y.max.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.65 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fault=
.[unknown]
      1.07 =C2=B1234%     +30.0%       1.39 =C2=B1199%  perf-sched.sch_dela=
y.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ap=
ic_timer_interrupt.[unknown]
      4.32 =C2=B1 94%     +21.9%       5.26 =C2=B1 86%  perf-sched.sch_dela=
y.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_=
64_after_hwframe.[unknown]
      0.02 =C2=B1 19%     +16.3%       0.03 =C2=B1 22%  perf-sched.sch_dela=
y.max.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
    167.93 =C2=B1223%     +29.6%     217.64 =C2=B1191%  perf-sched.sch_dela=
y.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.00 =C2=B1234%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__get_fre=
e_pages.__pud_alloc
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__get_fre=
e_pages.pgd_alloc
      0.00 =C2=B1182%     +22.6%       0.00 =C2=B1154%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__pm=
d_alloc.copy_page_range
      0.65 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.alloc_pag=
es_vma.wp_page_copy
      0.00 =C2=B1150%     -54.7%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.pte_=
alloc_one.__pte_alloc
      0.46 =C2=B1108%     -34.9%       0.30 =C2=B1152%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.__flush_work.lru_add_drain_=
all.khugepaged
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.__fput.task_work_run.exit_to_use=
r_mode_prepare
      0.00 =C2=B1234%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.__kmalloc.security_prepare_creds=
.prepare_creds
      0.00 =C2=B1234%    +130.5%       0.00 =C2=B1152%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.__kmalloc.security_task_all=
oc.copy_process
      0.00 =C2=B1182%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.__kmalloc_node.__vmalloc_node_ra=
nge.dup_task_struct
      0.00       +5.9e+101%       0.59 =C2=B1300%  perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.__mutex_lock.isra.0
      0.00        +1.2e+99%       0.00 =C2=B1300%  perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.__vmalloc_node_range.dup_task_st=
ruct.copy_process
      0.00        +1.4e+99%       0.00 =C2=B1300%  perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.cgroup_can_fork.copy_process.ker=
nel_clone
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.copy_page_from_iter.pipe_write.n=
ew_sync_write
      0.00 =C2=B1161%     +12.4%       0.01 =C2=B1124%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.copy_page_range.dup_mmap.du=
p_mm
      0.00          +1e+99%       0.00 =C2=B1300%  perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.copy_page_to_iter.pipe_read.new_=
sync_read
      0.00 =C2=B1158%     +27.8%       0.01 =C2=B1122%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.copy_pte_range.copy_page_ra=
nge.dup_mmap
      0.00 =C2=B1184%  +29339.7%       0.84 =C2=B1298%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc_page=
_fault.asm_exc_page_fault
      0.01 =C2=B1108%      +1.5%       0.01 =C2=B1122%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_clone.a=
non_vma_fork
      0.00 =C2=B1234%    +104.3%       0.00 =C2=B1152%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_fork.du=
p_mmap
      0.00 =C2=B1150%    +113.8%       0.01 =C2=B1 85%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.down_write.dup_mmap.dup_mm
      0.16 =C2=B1230%    +348.3%       0.70 =C2=B1 65%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.khugepaged.kthread.ret_from=
_fork
      0.00 =C2=B1346%     +43.0%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.alloc_pid.=
copy_process
      0.00 =C2=B1234%     -26.5%       0.00 =C2=B1299%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.anon_vma_f=
ork.dup_mmap
      0.00 =C2=B1234%     -32.2%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.copy_fs_st=
ruct.copy_process
      0.00 =C2=B1346%     +18.2%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.copy_proce=
ss.kernel_clone
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.dup_mm.copy_pro=
cess
      0.00 =C2=B1150%      -2.5%       0.00 =C2=B1153%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.prepare_cr=
eds.copy_creds
      0.00 =C2=B1152%     -62.5%       0.00 =C2=B1300%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.vm_area_du=
p.dup_mmap
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc_node_trace.__ge=
t_vm_area_node.__vmalloc_node_range
     20.59            -2.6%      20.05 =C2=B1  5%  perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bprm_exe=
cve
      0.00        +1.4e+99%       0.00 =C2=B1300%  perf-sched.sch_delay.max=
.ms.preempt_schedule_common.__cond_resched.uprobe_start_dup_mmap.dup_mmap.d=
up_mm
      0.58 =C2=B1315%     -88.7%       0.07 =C2=B1 58%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_=
move_task.__set_cpus_allowed_ptr
      0.02 =C2=B1 22%   +3906.8%       0.80 =C2=B1292%  perf-sched.sch_dela=
y.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      0.40 =C2=B1 98%     -50.1%       0.20 =C2=B1 11%  perf-sched.sch_dela=
y.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epo=
ll_wait
      0.03 =C2=B1 60%      -0.6%       0.03 =C2=B1 64%  perf-sched.sch_dela=
y.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.d=
o_select
      0.35 =C2=B1223%     -90.0%       0.03 =C2=B1148%  perf-sched.sch_dela=
y.max.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.d=
o_sys_poll
      0.00 =C2=B1346%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.schedule_preempt_disabled.__mutex_lock.isra.0.pipe_read
      0.17 =C2=B1340%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.schedule_timeout.__skb_wait_for_more_packets.unix_dgram_recvmsg.__sys_r=
ecvfrom
      0.02 =C2=B1 38%      +9.2%       0.02 =C2=B1 24%  perf-sched.sch_dela=
y.max.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      0.03 =C2=B1 21%   +2452.0%       0.88 =C2=B1288%  perf-sched.sch_dela=
y.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      0.38 =C2=B1126%    -100.0%       0.00        perf-sched.sch_delay.max=
.ms.schedule_timeout.wait_for_completion.__flush_work.lru_add_drain_all
      0.13 =C2=B1 71%     -31.6%       0.09 =C2=B1 59%  perf-sched.sch_dela=
y.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      3.20 =C2=B1152%     +70.5%       5.45 =C2=B1130%  perf-sched.sch_dela=
y.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open.isra
    372.55 =C2=B1181%     -57.5%     158.39 =C2=B1290%  perf-sched.sch_dela=
y.max.ms.worker_thread.kthread.ret_from_fork
      0.20 =C2=B1 49%     -12.8%       0.18 =C2=B1 35%  perf-sched.total_sc=
h_delay.average.ms
    467.93 =C2=B1145%     -18.1%     383.29 =C2=B1145%  perf-sched.total_sc=
h_delay.max.ms
    144.60 =C2=B1  7%      -6.8%     134.74 =C2=B1  5%  perf-sched.total_wa=
it_and_delay.average.ms
     17805 =C2=B1  7%      +8.0%      19227 =C2=B1  6%  perf-sched.total_wa=
it_and_delay.count.ms
      7834 =C2=B1 10%      -1.6%       7705 =C2=B1  9%  perf-sched.total_wa=
it_and_delay.max.ms
    144.40 =C2=B1  7%      -6.8%     134.57 =C2=B1  5%  perf-sched.total_wa=
it_time.average.ms
      7832 =C2=B1 10%      -1.6%       7704 =C2=B1  9%  perf-sched.total_wa=
it_time.max.ms
    899.41            +0.1%     900.33        perf-sched.wait_and_delay.avg=
.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      2345 =C2=B1  3%      +8.1%       2535 =C2=B1 20%  perf-sched.wait_and=
_delay.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    815.32 =C2=B1  4%      -0.9%     808.24 =C2=B1  5%  perf-sched.wait_and=
_delay.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall=
_64
      2350 =C2=B1  3%      +7.4%       2524 =C2=B1 16%  perf-sched.wait_and=
_delay.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
    214.36 =C2=B1  4%      -1.2%     211.71 =C2=B1  4%  perf-sched.wait_and=
_delay.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sy=
scall_64
     87.04 =C2=B1  9%      +2.8%      89.47 =C2=B1 13%  perf-sched.wait_and=
_delay.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.20 =C2=B1 17%      +0.2%       0.20 =C2=B1 18%  perf-sched.wait_and=
_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysv=
ec_apic_timer_interrupt.[unknown]
      0.17 =C2=B1 43%      -4.1%       0.16 =C2=B1 51%  perf-sched.wait_and=
_delay.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysv=
ec_call_function_single.[unknown]
      0.16 =C2=B1  7%      -5.5%       0.15 =C2=B1  2%  perf-sched.wait_and=
_delay.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYS=
CALL_64_after_hwframe.[unknown]
      0.00       +4.1e+103%      40.82 =C2=B1300%  perf-sched.wait_and_dela=
y.avg.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
    114.40 =C2=B1 32%     -33.0%      76.66 =C2=B1 27%  perf-sched.wait_and=
_delay.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
    833.95 =C2=B1214%    -100.0%       0.00        perf-sched.wait_and_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.allo=
c_pages_vma.shmem_alloc_page
      1046 =C2=B1234%    -100.0%       0.00        perf-sched.wait_and_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.__do_fault.do_fault.__handl=
e_mm_fault
    509.48 =C2=B1346%     -59.4%     206.97 =C2=B1300%  perf-sched.wait_and=
_delay.avg.ms.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc=
_page_fault.asm_exc_page_fault
    357.89 =C2=B1114%    +117.1%     777.12 =C2=B1 52%  perf-sched.wait_and=
_delay.avg.ms.preempt_schedule_common.__cond_resched.generic_perform_write.=
__generic_file_write_iter.generic_file_write_iter
     10.77 =C2=B1346%    +376.6%      51.34 =C2=B1200%  perf-sched.wait_and=
_delay.avg.ms.preempt_schedule_common.__cond_resched.mutex_lock.perf_poll.d=
o_sys_poll
      9.36            -0.2%       9.35        perf-sched.wait_and_delay.avg=
.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bprm_exe=
cve
      4.87            -1.5%       4.80 =C2=B1  4%  perf-sched.wait_and_dela=
y.avg.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_=
move_task.__set_cpus_allowed_ptr
      0.43 =C2=B1234%    -100.0%       0.00        perf-sched.wait_and_dela=
y.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
    645.53 =C2=B1 20%      +3.2%     666.29 =C2=B1 18%  perf-sched.wait_and=
_delay.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sy=
s_epoll_wait
    121.62 =C2=B1  8%      -2.8%     118.20 =C2=B1  8%  perf-sched.wait_and=
_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constpro=
p.0.do_sys_poll
     78.71 =C2=B1346%    -100.0%       0.00        perf-sched.wait_and_dela=
y.avg.ms.schedule_preempt_disabled.__mutex_lock.isra.0.pipe_read
    478.55            +0.0%     478.60        perf-sched.wait_and_delay.avg=
.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
      6.47 =C2=B1 15%      -7.3%       5.99 =C2=B1 15%  perf-sched.wait_and=
_delay.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
    592.44            +0.3%     594.17        perf-sched.wait_and_delay.avg=
.ms.smpboot_thread_fn.kthread.ret_from_fork
    529.47 =C2=B1  4%      -1.2%     523.24 =C2=B1  2%  perf-sched.wait_and=
_delay.avg.ms.worker_thread.kthread.ret_from_fork
     10.00            +1.0%      10.10 =C2=B1  2%  perf-sched.wait_and_dela=
y.count.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unkno=
wn]
      3.00            -6.7%       2.80 =C2=B1 14%  perf-sched.wait_and_dela=
y.count.devkmsg_read.vfs_read.ksys_read.do_syscall_64
     22.15 =C2=B1  4%      +1.1%      22.40 =C2=B1  5%  perf-sched.wait_and=
_delay.count.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_=
64
      3.00            -6.7%       2.80 =C2=B1 14%  perf-sched.wait_and_dela=
y.count.do_syslog.part.0.kmsg_read.vfs_read
    280.77            +0.8%     282.90        perf-sched.wait_and_delay.cou=
nt.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall_64
    309.23            +1.5%     313.90 =C2=B1  2%  perf-sched.wait_and_dela=
y.count.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      1405 =C2=B1 10%      +1.0%       1419 =C2=B1 10%  perf-sched.wait_and=
_delay.count.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysve=
c_apic_timer_interrupt.[unknown]
    460.62 =C2=B1 32%     +22.8%     565.70 =C2=B1 25%  perf-sched.wait_and=
_delay.count.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysve=
c_call_function_single.[unknown]
      5652 =C2=B1  7%     +10.3%       6233 =C2=B1  6%  perf-sched.wait_and=
_delay.count.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSC=
ALL_64_after_hwframe.[unknown]
      0.00         +4e+101%       0.40 =C2=B1300%  perf-sched.wait_and_dela=
y.count.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
      1263 =C2=B1 34%     +42.0%       1794 =C2=B1 23%  perf-sched.wait_and=
_delay.count.pipe_read.new_sync_read.vfs_read.ksys_read
      1.38 =C2=B1184%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.alloc=
_pages_vma.shmem_alloc_page
      0.15 =C2=B1234%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.preempt_schedule_common.__cond_resched.__do_fault.do_fault.__handle=
_mm_fault
      0.08 =C2=B1346%    +290.0%       0.30 =C2=B1300%  perf-sched.wait_and=
_delay.count.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc_=
page_fault.asm_exc_page_fault
      4.38 =C2=B1117%     +87.0%       8.20 =C2=B1 49%  perf-sched.wait_and=
_delay.count.preempt_schedule_common.__cond_resched.generic_perform_write._=
_generic_file_write_iter.generic_file_write_iter
      0.08 =C2=B1346%    +160.0%       0.20 =C2=B1200%  perf-sched.wait_and=
_delay.count.preempt_schedule_common.__cond_resched.mutex_lock.perf_poll.do=
_sys_poll
    280.15            +1.2%     283.40        perf-sched.wait_and_delay.cou=
nt.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bprm_exec=
ve
      2302            +0.7%       2319        perf-sched.wait_and_delay.cou=
nt.preempt_schedule_common.__cond_resched.wait_for_completion.affine_move_t=
ask.__set_cpus_allowed_ptr
     20.31 =C2=B1239%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.rcu_gp_kthread.kthread.ret_from_fork
     23.77 =C2=B1 42%     -15.0%      20.20 =C2=B1 50%  perf-sched.wait_and=
_delay.count.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys=
_epoll_wait
    202.08 =C2=B1  7%      +3.4%     209.00 =C2=B1  8%  perf-sched.wait_and=
_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop=
.0.do_sys_poll
      0.08 =C2=B1346%    -100.0%       0.00        perf-sched.wait_and_dela=
y.count.schedule_preempt_disabled.__mutex_lock.isra.0.pipe_read
     79.23            +0.2%      79.40        perf-sched.wait_and_delay.cou=
nt.schedule_timeout.kcompactd.kthread.ret_from_fork
      1547 =C2=B1 16%      +9.2%       1690 =C2=B1 18%  perf-sched.wait_and=
_delay.count.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      3160            +0.6%       3180        perf-sched.wait_and_delay.cou=
nt.smpboot_thread_fn.kthread.ret_from_fork
    611.08 =C2=B1  3%      +2.4%     625.60 =C2=B1  3%  perf-sched.wait_and=
_delay.count.worker_thread.kthread.ret_from_fork
    999.38            +0.0%     999.39        perf-sched.wait_and_delay.max=
.ms.__x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      7034 =C2=B1  3%      -2.0%       6891 =C2=B1  3%  perf-sched.wait_and=
_delay.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1009 =C2=B1  2%      +1.9%       1028 =C2=B1  3%  perf-sched.wait_and=
_delay.max.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall=
_64
      7048 =C2=B1  3%      -2.1%       6897 =C2=B1  3%  perf-sched.wait_and=
_delay.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      2707 =C2=B1 84%     -21.7%       2121 =C2=B1 81%  perf-sched.wait_and=
_delay.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_sy=
scall_64
      1021            +0.1%       1022        perf-sched.wait_and_delay.max=
.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
     19.55 =C2=B1 82%     -25.4%      14.59 =C2=B1 21%  perf-sched.wait_and=
_delay.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysv=
ec_apic_timer_interrupt.[unknown]
     19.85 =C2=B1138%     +70.9%      33.93 =C2=B1 91%  perf-sched.wait_and=
_delay.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysv=
ec_call_function_single.[unknown]
     56.44 =C2=B1 43%      -3.5%      54.45 =C2=B1 53%  perf-sched.wait_and=
_delay.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYS=
CALL_64_after_hwframe.[unknown]
      0.00       +1.6e+104%     162.95 =C2=B1300%  perf-sched.wait_and_dela=
y.max.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
      7037 =C2=B1  3%      -2.1%       6891 =C2=B1  3%  perf-sched.wait_and=
_delay.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      2063 =C2=B1150%    -100.0%       0.00        perf-sched.wait_and_dela=
y.max.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.allo=
c_pages_vma.shmem_alloc_page
      1046 =C2=B1234%    -100.0%       0.00        perf-sched.wait_and_dela=
y.max.ms.preempt_schedule_common.__cond_resched.__do_fault.do_fault.__handl=
e_mm_fault
    509.48 =C2=B1346%     +21.5%     618.91 =C2=B1300%  perf-sched.wait_and=
_delay.max.ms.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc=
_page_fault.asm_exc_page_fault
      3078 =C2=B1108%     +92.7%       5931 =C2=B1 33%  perf-sched.wait_and=
_delay.max.ms.preempt_schedule_common.__cond_resched.generic_perform_write.=
__generic_file_write_iter.generic_file_write_iter
     10.77 =C2=B1346%    +376.6%      51.34 =C2=B1200%  perf-sched.wait_and=
_delay.max.ms.preempt_schedule_common.__cond_resched.mutex_lock.perf_poll.d=
o_sys_poll
     20.59            -2.6%      20.05 =C2=B1  5%  perf-sched.wait_and_dela=
y.max.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bpr=
m_execve
      2177            -4.5%       2080 =C2=B1 17%  perf-sched.wait_and_dela=
y.max.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_=
move_task.__set_cpus_allowed_ptr
      0.77 =C2=B1234%    -100.0%       0.00        perf-sched.wait_and_dela=
y.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      6690 =C2=B1  4%      -2.9%       6495 =C2=B1  4%  perf-sched.wait_and=
_delay.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sy=
s_epoll_wait
      5513            +0.3%       5532        perf-sched.wait_and_delay.max=
.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_sys=
_poll
     78.71 =C2=B1346%    -100.0%       0.00        perf-sched.wait_and_dela=
y.max.ms.schedule_preempt_disabled.__mutex_lock.isra.0.pipe_read
    505.01            -0.0%     505.01        perf-sched.wait_and_delay.max=
.ms.schedule_timeout.kcompactd.kthread.ret_from_fork
    294.70 =C2=B1 36%      +1.2%     298.21 =C2=B1 48%  perf-sched.wait_and=
_delay.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      5881 =C2=B1 26%     +19.1%       7003 =C2=B1 16%  perf-sched.wait_and=
_delay.max.ms.smpboot_thread_fn.kthread.ret_from_fork
      7414 =C2=B1 14%      -1.9%       7275 =C2=B1  9%  perf-sched.wait_and=
_delay.max.ms.worker_thread.kthread.ret_from_fork
    899.40            +0.1%     900.32        perf-sched.wait_time.avg.ms._=
_x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.d_alloc_parallel.__lookup_slow.walk_component.link_path_walk.part
      2345 =C2=B1  3%      +8.0%       2532 =C2=B1 20%  perf-sched.wait_tim=
e.avg.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
    815.11 =C2=B1  4%      -0.9%     807.60 =C2=B1  5%  perf-sched.wait_tim=
e.avg.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      2348 =C2=B1  3%      +7.4%       2522 =C2=B1 16%  perf-sched.wait_tim=
e.avg.ms.do_syslog.part.0.kmsg_read.vfs_read
    214.34 =C2=B1  4%      -1.2%     211.68 =C2=B1  4%  perf-sched.wait_tim=
e.avg.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
     87.02 =C2=B1  9%      +2.8%      89.46 =C2=B1 13%  perf-sched.wait_tim=
e.avg.ms.do_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.23 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_common_interru=
pt.[unknown]
      1.00 =C2=B1206%     -10.7%       0.90 =C2=B1202%  perf-sched.wait_tim=
e.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_=
fault.[unknown]
      0.20 =C2=B1 17%      +0.1%       0.20 =C2=B1 18%  perf-sched.wait_tim=
e.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ap=
ic_timer_interrupt.[unknown]
      0.17 =C2=B1 43%      -4.1%       0.16 =C2=B1 51%  perf-sched.wait_tim=
e.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ca=
ll_function_single.[unknown]
      0.10 =C2=B1274%     -71.7%       0.03 =C2=B1 97%  perf-sched.wait_tim=
e.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ir=
q_work.[unknown]
      0.09 =C2=B1127%      -0.9%       0.09 =C2=B1141%  perf-sched.wait_tim=
e.avg.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_re=
schedule_ipi.[unknown]
      0.16 =C2=B1  7%      -5.4%       0.15 =C2=B1  3%  perf-sched.wait_tim=
e.avg.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_=
64_after_hwframe.[unknown]
      0.00       +4.1e+103%      40.81 =C2=B1300%  perf-sched.wait_time.avg=
.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
      0.12 =C2=B1234%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.io_schedule.__lock_page_killable.filemap_fault.__do_fault
    114.11 =C2=B1 32%     -33.0%      76.51 =C2=B1 27%  perf-sched.wait_tim=
e.avg.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.92 =C2=B1100%     +42.6%       1.31 =C2=B1 96%  perf-sched.wait_tim=
e.avg.ms.pipe_write.new_sync_write.vfs_write.ksys_write
      0.01 =C2=B1234%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__get_fre=
e_pages.__pud_alloc
      0.01 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__get_fre=
e_pages.pgd_alloc
      0.02 =C2=B1182%   +3627.7%       0.71 =C2=B1292%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__pm=
d_alloc.copy_page_range
    840.95 =C2=B1212%     -99.2%       6.84 =C2=B1 78%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.allo=
c_pages_vma.shmem_alloc_page
      0.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.alloc_pag=
es_vma.wp_page_copy
      0.02 =C2=B1150%   +5506.7%       1.38 =C2=B1299%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.pte_=
alloc_one.__pte_alloc
      1049 =C2=B1233%     -99.4%       6.60 =C2=B1 88%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.__do_fault.do_fault.__handl=
e_mm_fault
      0.00       +1.5e+100%       0.02 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__fput.task_work_run.do_exit
      0.80 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__fput.task_work_run.exit_to_use=
r_mode_prepare
      0.01 =C2=B1234%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__kmalloc.security_prepare_creds=
.prepare_creds
      0.01 =C2=B1234%    +120.2%       0.03 =C2=B1152%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.__kmalloc.security_task_all=
oc.copy_process
      1.08 =C2=B1342%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__kmalloc_node.__vmalloc_node_ra=
nge.dup_task_struct
      0.00       +1.2e+102%       1.23 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__mutex_lock.isra.0
      0.00        +3.9e+99%       0.00 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__put_anon_vma.unlink_anon_vmas.=
free_pgtables
      0.00       +6.9e+101%       0.69 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.__vmalloc_node_range.dup_task_st=
ruct.copy_process
      0.00        +9.1e+99%       0.01 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.cgroup_can_fork.copy_process.ker=
nel_clone
      0.52 =C2=B1326%     -95.1%       0.03 =C2=B1230%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.change_p4d_range.change_pro=
tection.change_prot_numa
      0.01 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.copy_page_from_iter.pipe_write.n=
ew_sync_write
      1.83 =C2=B1233%     +35.6%       2.48 =C2=B1200%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.copy_page_range.dup_mmap.du=
p_mm
      0.00        +1.2e+99%       0.00 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.copy_page_to_iter.pipe_read.new_=
sync_read
      1.93 =C2=B1234%    +144.5%       4.72 =C2=B1151%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.copy_pte_range.copy_page_ra=
nge.dup_mmap
    516.65 =C2=B1341%     -58.8%     212.90 =C2=B1290%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc_page=
_fault.asm_exc_page_fault
      0.00       +7.8e+101%       0.78 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_clone.__spli=
t_vma
      1.09 =C2=B1336%    +134.4%       2.55 =C2=B1173%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_clone.a=
non_vma_fork
      0.01 =C2=B1234%    +101.2%       0.02 =C2=B1152%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_fork.du=
p_mmap
      0.02 =C2=B1150%   +5714.0%       1.42 =C2=B1290%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.down_write.dup_mmap.dup_mm
      0.83 =C2=B1346%     -88.9%       0.09 =C2=B1300%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.down_write.unlink_file_vma.=
free_pgtables
      8.70 =C2=B1 46%      -7.4%       8.05 =C2=B1 59%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
    363.89 =C2=B1111%    +113.9%     778.42 =C2=B1 52%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter
      0.25 =C2=B1232%     -98.7%       0.00 =C2=B1158%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.khugepaged.kthread.ret_from=
_fork
      0.01 =C2=B1346%     +46.0%       0.01 =C2=B1300%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.alloc_pid.=
copy_process
      0.54 =C2=B1342%     -98.3%       0.01 =C2=B1299%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.anon_vma_f=
ork.dup_mmap
      0.01 =C2=B1234%     -33.0%       0.01 =C2=B1299%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.copy_fs_st=
ruct.copy_process
      0.01 =C2=B1346%     +18.6%       0.01 =C2=B1300%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.copy_proce=
ss.kernel_clone
      0.01 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.dup_mm.copy_pro=
cess
      0.00       +8.1e+100%       0.08 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.getname_flags.d=
o_sys_openat2
      0.03 =C2=B1150%   +4053.5%       1.09 =C2=B1294%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.prepare_cr=
eds.copy_creds
      0.00       +7.1e+100%       0.07 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.security_file_a=
lloc.__alloc_file
      0.03 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.vm_area_dup.__s=
plit_vma
      1.08 =C2=B1339%     +28.2%       1.38 =C2=B1299%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.vm_area_du=
p.dup_mmap
      1.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc_node_trace.__ge=
t_vm_area_node.__vmalloc_node_range
      0.00         +8e+100%       0.08 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc_trace.perf_even=
t_mmap.mprotect_fixup
      0.00       +1.4e+101%       0.14 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.mnt_want_write.filename_create.d=
o_mkdirat
      0.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.mutex_lock.futex_exec_release.ex=
ec_mm_release
      0.00 =C2=B1234%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.mutex_lock.perf_event_ctx_lock_n=
ested.isra
     12.59 =C2=B1294%    +318.8%      52.72 =C2=B1193%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.mutex_lock.perf_poll.do_sys=
_poll
      1.00 =C2=B1346%    +150.0%       2.50 =C2=B1300%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.mutex_lock.pipe_write.new_s=
ync_write
      0.46 =C2=B1346%    +146.9%       1.13 =C2=B1200%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.pagecache_get_page.shmem_ge=
tpage_gfp.shmem_write_begin
      1.23 =C2=B1224%     -36.3%       0.78 =C2=B1300%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.remove_vma.exit_mmap.mmput
      0.00 =C2=B1155%     +30.0%       0.01 =C2=B1250%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bpr=
m_execve
      0.00       +2.8e+101%       0.28 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.task_work_run.exit_to_user_mode_=
prepare.syscall_exit_to_user_mode
      0.22 =C2=B1346%     +30.4%       0.28 =C2=B1300%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common.__cond_resched.unmap_page_range.unmap_vmas=
.exit_mmap
      0.00       +5.5e+101%       0.55 =C2=B1300%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.uprobe_start_dup_mmap.dup_mmap.d=
up_mm
      4.87            -1.5%       4.80 =C2=B1  4%  perf-sched.wait_time.avg=
.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_move_=
task.__set_cpus_allowed_ptr
      2.81 =C2=B1  5%      +2.3%       2.88 =C2=B1  8%  perf-sched.wait_tim=
e.avg.ms.rcu_gp_kthread.kthread.ret_from_fork
    645.49 =C2=B1 20%      +3.2%     666.25 =C2=B1 18%  perf-sched.wait_tim=
e.avg.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epo=
ll_wait
    121.61 =C2=B1  8%      -2.8%     118.20 =C2=B1  8%  perf-sched.wait_tim=
e.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.d=
o_sys_poll
     78.70 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.schedule_preempt_disabled.__mutex_lock.isra.0.pipe_read
      0.28 =C2=B1240%    -100.0%       0.00        perf-sched.wait_time.avg=
.ms.schedule_timeout.__skb_wait_for_more_packets.unix_dgram_recvmsg.__sys_r=
ecvfrom
    478.54            +0.0%     478.59        perf-sched.wait_time.avg.ms.s=
chedule_timeout.kcompactd.kthread.ret_from_fork
      3.57 =C2=B1  8%      -1.1%       3.53 =C2=B1  6%  perf-sched.wait_tim=
e.avg.ms.schedule_timeout.khugepaged.kthread.ret_from_fork
      6.46 =C2=B1 15%      -7.4%       5.98 =C2=B1 15%  perf-sched.wait_tim=
e.avg.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      0.01 =C2=B1 37%     -23.3%       0.01 =C2=B1 50%  perf-sched.wait_tim=
e.avg.ms.schedule_timeout.wait_for_completion.affine_move_task.__set_cpus_a=
llowed_ptr
    592.43            +0.3%     594.17        perf-sched.wait_time.avg.ms.s=
mpboot_thread_fn.kthread.ret_from_fork
      2.37 =C2=B1 10%      -5.9%       2.23 =C2=B1 12%  perf-sched.wait_tim=
e.avg.ms.wait_for_partner.fifo_open.do_dentry_open.do_open.isra
    528.48 =C2=B1  4%      -1.1%     522.51 =C2=B1  2%  perf-sched.wait_tim=
e.avg.ms.worker_thread.kthread.ret_from_fork
    999.37            +0.0%     999.38        perf-sched.wait_time.max.ms._=
_x64_sys_pause.do_syscall_64.entry_SYSCALL_64_after_hwframe.[unknown]
      0.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.d_alloc_parallel.__lookup_slow.walk_component.link_path_walk.part
      7033 =C2=B1  3%      -2.1%       6888 =C2=B1  3%  perf-sched.wait_tim=
e.max.ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      1004            +1.0%       1014 =C2=B1  2%  perf-sched.wait_time.max=
.ms.do_nanosleep.hrtimer_nanosleep.__x64_sys_nanosleep.do_syscall_64
      7040 =C2=B1  3%      -2.1%       6892 =C2=B1  3%  perf-sched.wait_tim=
e.max.ms.do_syslog.part.0.kmsg_read.vfs_read
      2707 =C2=B1 84%     -21.7%       2121 =C2=B1 81%  perf-sched.wait_tim=
e.max.ms.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.do_syscall=
_64
      1021            +0.1%       1022        perf-sched.wait_time.max.ms.d=
o_wait.kernel_wait4.__do_sys_wait4.do_syscall_64
      0.23 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_common_interru=
pt.[unknown]
      1.64 =C2=B1225%     -23.0%       1.26 =C2=B1218%  perf-sched.wait_tim=
e.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_=
fault.[unknown]
     18.51 =C2=B1 88%     -24.9%      13.90 =C2=B1 19%  perf-sched.wait_tim=
e.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ap=
ic_timer_interrupt.[unknown]
     19.85 =C2=B1138%     +70.9%      33.93 =C2=B1 91%  perf-sched.wait_tim=
e.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ca=
ll_function_single.[unknown]
      0.54 =C2=B1290%     -83.2%       0.09 =C2=B1143%  perf-sched.wait_tim=
e.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_ir=
q_work.[unknown]
      0.21 =C2=B1111%     -15.5%       0.18 =C2=B1144%  perf-sched.wait_tim=
e.max.ms.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_sysvec_re=
schedule_ipi.[unknown]
     56.26 =C2=B1 43%      -6.1%      52.81 =C2=B1 58%  perf-sched.wait_tim=
e.max.ms.exit_to_user_mode_prepare.syscall_exit_to_user_mode.entry_SYSCALL_=
64_after_hwframe.[unknown]
      0.00       +1.6e+104%     162.95 =C2=B1300%  perf-sched.wait_time.max=
.ms.futex_wait_queue_me.futex_wait.do_futex.__x64_sys_futex
      0.12 =C2=B1234%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.io_schedule.__lock_page_killable.filemap_fault.__do_fault
      7037 =C2=B1  3%      -2.1%       6891 =C2=B1  3%  perf-sched.wait_tim=
e.max.ms.pipe_read.new_sync_read.vfs_read.ksys_read
      0.92 =C2=B1100%     +42.6%       1.31 =C2=B1 96%  perf-sched.wait_tim=
e.max.ms.pipe_write.new_sync_write.vfs_write.ksys_write
      0.01 =C2=B1234%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__get_fre=
e_pages.__pud_alloc
      0.01 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__get_fre=
e_pages.pgd_alloc
      0.02 =C2=B1182%   +7195.8%       1.39 =C2=B1296%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.__pm=
d_alloc.copy_page_range
      2071 =C2=B1149%     -99.6%       9.20 =C2=B1 77%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.allo=
c_pages_vma.shmem_alloc_page
      0.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.alloc_pag=
es_vma.wp_page_copy
      0.02 =C2=B1150%   +5506.7%       1.38 =C2=B1299%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.__alloc_pages_nodemask.pte_=
alloc_one.__pte_alloc
      1050 =C2=B1233%     -99.3%       7.80 =C2=B1 81%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.__do_fault.do_fault.__handl=
e_mm_fault
      0.00       +1.5e+100%       0.02 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__fput.task_work_run.do_exit
      0.80 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__fput.task_work_run.exit_to_use=
r_mode_prepare
      0.01 =C2=B1234%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__kmalloc.security_prepare_creds=
.prepare_creds
      0.01 =C2=B1234%    +124.3%       0.03 =C2=B1152%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.__kmalloc.security_task_all=
oc.copy_process
      1.08 =C2=B1342%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__kmalloc_node.__vmalloc_node_ra=
nge.dup_task_struct
      0.00       +1.2e+102%       1.23 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__mutex_lock.isra.0
      0.00        +3.9e+99%       0.00 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__put_anon_vma.unlink_anon_vmas.=
free_pgtables
      0.00       +1.4e+102%       1.38 =C2=B1299%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.__vmalloc_node_range.dup_task_st=
ruct.copy_process
      0.00        +9.1e+99%       0.01 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.cgroup_can_fork.copy_process.ker=
nel_clone
      0.53 =C2=B1321%     -95.2%       0.03 =C2=B1230%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.change_p4d_range.change_pro=
tection.change_prot_numa
      0.01 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.copy_page_from_iter.pipe_write.n=
ew_sync_write
      1.83 =C2=B1233%     +35.6%       2.48 =C2=B1200%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.copy_page_range.dup_mmap.du=
p_mm
      0.00        +1.2e+99%       0.00 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.copy_page_to_iter.pipe_read.new_=
sync_read
      2.59 =C2=B1237%    +161.9%       6.78 =C2=B1132%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.copy_pte_range.copy_page_ra=
nge.dup_mmap
    518.77 =C2=B1339%     +20.8%     626.68 =C2=B1295%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.do_user_addr_fault.exc_page=
_fault.asm_exc_page_fault
      0.00       +7.8e+101%       0.78 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_clone.__spli=
t_vma
      1.09 =C2=B1335%    +279.1%       4.13 =C2=B1152%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_clone.a=
non_vma_fork
      0.01 =C2=B1234%    +101.2%       0.02 =C2=B1152%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.down_write.anon_vma_fork.du=
p_mmap
      0.02 =C2=B1150%   +5626.4%       1.42 =C2=B1290%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.down_write.dup_mmap.dup_mm
      0.83 =C2=B1346%     -88.9%       0.09 =C2=B1300%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.down_write.unlink_file_vma.=
free_pgtables
     11.97 =C2=B1 28%     -12.8%      10.44 =C2=B1 49%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.dput.__fput.task_work_run
      3087 =C2=B1107%     +92.2%       5932 =C2=B1 33%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.generic_perform_write.__gen=
eric_file_write_iter.generic_file_write_iter
      0.59 =C2=B1231%     -99.4%       0.00 =C2=B1158%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.khugepaged.kthread.ret_from=
_fork
      0.01 =C2=B1346%     +46.0%       0.01 =C2=B1300%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.alloc_pid.=
copy_process
      1.07 =C2=B1344%     -99.1%       0.01 =C2=B1299%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.anon_vma_f=
ork.dup_mmap
      0.01 =C2=B1234%     -29.0%       0.01 =C2=B1300%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.copy_fs_st=
ruct.copy_process
      0.01 =C2=B1346%     +17.2%       0.01 =C2=B1300%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.copy_proce=
ss.kernel_clone
      0.01 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.dup_mm.copy_pro=
cess
      0.00       +8.1e+100%       0.08 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.getname_flags.d=
o_sys_openat2
      0.03 =C2=B1150%   +3995.6%       1.09 =C2=B1294%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.prepare_cr=
eds.copy_creds
      0.00       +7.1e+100%       0.07 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.security_file_a=
lloc.__alloc_file
      0.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.vm_area_dup.__s=
plit_vma
      1.08 =C2=B1339%     +28.2%       1.38 =C2=B1299%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc.vm_area_du=
p.dup_mmap
      1.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc_node_trace.__ge=
t_vm_area_node.__vmalloc_node_range
      0.00         +8e+100%       0.08 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.kmem_cache_alloc_trace.perf_even=
t_mmap.mprotect_fixup
      0.00       +2.8e+101%       0.28 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.mnt_want_write.filename_create.d=
o_mkdirat
      0.06 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.mutex_lock.futex_exec_release.ex=
ec_mm_release
      0.00 =C2=B1234%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.mutex_lock.perf_event_ctx_lock_n=
ested.isra
     12.76 =C2=B1289%    +320.7%      53.67 =C2=B1189%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.mutex_lock.perf_poll.do_sys=
_poll
      1.00 =C2=B1346%    +150.0%       2.50 =C2=B1300%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.mutex_lock.pipe_write.new_s=
ync_write
      0.46 =C2=B1346%    +146.9%       1.13 =C2=B1200%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.pagecache_get_page.shmem_ge=
tpage_gfp.shmem_write_begin
      1.66 =C2=B1226%     -52.6%       0.78 =C2=B1300%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.remove_vma.exit_mmap.mmput
      1.29 =C2=B1162%     +21.6%       1.57 =C2=B1248%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.stop_one_cpu.sched_exec.bpr=
m_execve
      0.00       +2.8e+101%       0.28 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.task_work_run.exit_to_user_mode_=
prepare.syscall_exit_to_user_mode
      0.22 =C2=B1346%     +75.8%       0.38 =C2=B1300%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common.__cond_resched.unmap_page_range.unmap_vmas=
.exit_mmap
      0.00       +1.1e+102%       1.09 =C2=B1300%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.uprobe_start_dup_mmap.dup_mmap.d=
up_mm
      2177            -4.5%       2080 =C2=B1 17%  perf-sched.wait_time.max=
.ms.preempt_schedule_common.__cond_resched.wait_for_completion.affine_move_=
task.__set_cpus_allowed_ptr
      7.54 =C2=B1116%     +35.0%      10.17 =C2=B1134%  perf-sched.wait_tim=
e.max.ms.rcu_gp_kthread.kthread.ret_from_fork
      6690 =C2=B1  4%      -2.9%       6495 =C2=B1  4%  perf-sched.wait_tim=
e.max.ms.schedule_hrtimeout_range_clock.ep_poll.do_epoll_wait.__x64_sys_epo=
ll_wait
      5513            +0.3%       5532        perf-sched.wait_time.max.ms.s=
chedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_sys_poll
     78.70 =C2=B1346%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.schedule_preempt_disabled.__mutex_lock.isra.0.pipe_read
      0.28 =C2=B1240%    -100.0%       0.00        perf-sched.wait_time.max=
.ms.schedule_timeout.__skb_wait_for_more_packets.unix_dgram_recvmsg.__sys_r=
ecvfrom
    505.00            -0.0%     505.00        perf-sched.wait_time.max.ms.s=
chedule_timeout.kcompactd.kthread.ret_from_fork
      3.57 =C2=B1  8%      -1.1%       3.53 =C2=B1  6%  perf-sched.wait_tim=
e.max.ms.schedule_timeout.khugepaged.kthread.ret_from_fork
    294.68 =C2=B1 36%      +1.2%     298.19 =C2=B1 48%  perf-sched.wait_tim=
e.max.ms.schedule_timeout.rcu_gp_kthread.kthread.ret_from_fork
      0.01 =C2=B1 50%     -20.5%       0.01 =C2=B1 53%  perf-sched.wait_tim=
e.max.ms.schedule_timeout.wait_for_completion.affine_move_task.__set_cpus_a=
llowed_ptr
      5881 =C2=B1 26%     +19.1%       7003 =C2=B1 16%  perf-sched.wait_tim=
e.max.ms.smpboot_thread_fn.kthread.ret_from_fork
     12.45 =C2=B1  5%      -0.4%      12.40 =C2=B1  6%  perf-sched.wait_tim=
e.max.ms.wait_for_partner.fifo_open.do_dentry_open.do_open.isra
      7414 =C2=B1 14%      -1.9%       7275 =C2=B1  9%  perf-sched.wait_tim=
e.max.ms.worker_thread.kthread.ret_from_fork
    261.00            +0.0%     261.00        softirqs.BLOCK
      1.00            +0.0%       1.00        softirqs.CPU0.HI
     24558 =C2=B1 11%      -2.7%      23894 =C2=B1 17%  softirqs.CPU0.RCU
      8170 =C2=B1  5%      +0.6%       8219 =C2=B1  8%  softirqs.CPU0.SCHED
    105.00            +0.2%     105.20        softirqs.CPU0.TASKLET
      2737 =C2=B1 19%      +1.0%       2765 =C2=B1 22%  softirqs.CPU0.TIMER
      0.00          -100.0%       0.00        softirqs.CPU1.NET_TX
     24492 =C2=B1  8%      +1.0%      24739 =C2=B1 12%  softirqs.CPU1.RCU
      5792 =C2=B1 13%      +1.9%       5901 =C2=B1 15%  softirqs.CPU1.SCHED
    722.00 =C2=B1 63%      -8.3%     662.40 =C2=B1 76%  softirqs.CPU1.TIMER
      3499 =C2=B1129%      +4.1%       3644 =C2=B1172%  softirqs.CPU10.NET_=
RX
      1.92 =C2=B1 51%      +9.2%       2.10 =C2=B1 25%  softirqs.CPU10.NET_=
TX
     23422 =C2=B1  7%      -0.4%      23331 =C2=B1 11%  softirqs.CPU10.RCU
      5280 =C2=B1  8%      -1.5%       5202 =C2=B1 11%  softirqs.CPU10.SCHED
      1.23 =C2=B1302%    -100.0%       0.00        softirqs.CPU10.TASKLET
    670.23 =C2=B1 70%     +15.7%     775.20 =C2=B1144%  softirqs.CPU10.TIMER
     23400 =C2=B1  8%      +1.1%      23654 =C2=B1 11%  softirqs.CPU100.RCU
      5078            -0.5%       5052 =C2=B1  9%  softirqs.CPU100.SCHED
      0.00         +7e+101%       0.70 =C2=B1300%  softirqs.CPU100.TASKLET
    113.54 =C2=B1 11%     +76.1%     199.90 =C2=B1 95%  softirqs.CPU100.TIM=
ER
     23000 =C2=B1  8%      +0.9%      23200 =C2=B1 11%  softirqs.CPU101.RCU
      5075            -2.2%       4965 =C2=B1  8%  softirqs.CPU101.SCHED
    124.92 =C2=B1 18%     +53.1%     191.20 =C2=B1 48%  softirqs.CPU101.TIM=
ER
     23029 =C2=B1  8%      +1.4%      23358 =C2=B1 11%  softirqs.CPU102.RCU
      5050            -0.4%       5031 =C2=B1  8%  softirqs.CPU102.SCHED
    129.23 =C2=B1 19%     +43.6%     185.60 =C2=B1 46%  softirqs.CPU102.TIM=
ER
     23634 =C2=B1  8%      +0.2%      23674 =C2=B1 11%  softirqs.CPU103.RCU
      5100            -1.8%       5007 =C2=B1  8%  softirqs.CPU103.SCHED
    134.77 =C2=B1 17%     +26.7%     170.70 =C2=B1 40%  softirqs.CPU103.TIM=
ER
     23665 =C2=B1  8%      -0.3%      23588 =C2=B1 11%  softirqs.CPU104.RCU
      5089 =C2=B1  2%      -2.3%       4974 =C2=B1  8%  softirqs.CPU104.SCH=
ED
      0.54 =C2=B1296%    -100.0%       0.00        softirqs.CPU104.TASKLET
    180.85 =C2=B1 73%      -3.9%     173.80 =C2=B1 51%  softirqs.CPU104.TIM=
ER
     23351 =C2=B1  8%      +0.6%      23481 =C2=B1 11%  softirqs.CPU105.RCU
      4992 =C2=B1  5%      -2.6%       4860 =C2=B1 10%  softirqs.CPU105.SCH=
ED
      0.62 =C2=B1346%    -100.0%       0.00        softirqs.CPU105.TASKLET
    135.92 =C2=B1 17%      +7.8%     146.50 =C2=B1 15%  softirqs.CPU105.TIM=
ER
     23390 =C2=B1  8%      +1.4%      23728 =C2=B1 12%  softirqs.CPU106.RCU
      4854 =C2=B1  9%      +3.1%       5005 =C2=B1  9%  softirqs.CPU106.SCH=
ED
      0.08 =C2=B1346%    +160.0%       0.20 =C2=B1300%  softirqs.CPU106.TAS=
KLET
    135.69 =C2=B1 40%     +55.9%     211.50 =C2=B1 60%  softirqs.CPU106.TIM=
ER
     23720 =C2=B1 10%      -2.0%      23240 =C2=B1 10%  softirqs.CPU107.RCU
      5041 =C2=B1  7%      -4.0%       4837 =C2=B1 11%  softirqs.CPU107.SCH=
ED
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU107.TASKLET
    316.77 =C2=B1118%     -35.9%     203.20 =C2=B1 90%  softirqs.CPU107.TIM=
ER
      0.00          -100.0%       0.00        softirqs.CPU108.NET_TX
     23224 =C2=B1  7%      +1.3%      23516 =C2=B1 10%  softirqs.CPU108.RCU
      5098 =C2=B1  3%      -3.0%       4946 =C2=B1  8%  softirqs.CPU108.SCH=
ED
    130.62 =C2=B1 20%     +30.8%     170.90 =C2=B1 40%  softirqs.CPU108.TIM=
ER
     23678 =C2=B1  9%      -0.7%      23502 =C2=B1 11%  softirqs.CPU109.RCU
      5010 =C2=B1  6%      -0.8%       4969 =C2=B1  8%  softirqs.CPU109.SCH=
ED
      0.08 =C2=B1346%    +810.0%       0.70 =C2=B1300%  softirqs.CPU109.TAS=
KLET
    132.38 =C2=B1 17%     +14.8%     152.00 =C2=B1 24%  softirqs.CPU109.TIM=
ER
      4202 =C2=B1123%     -79.8%     847.60 =C2=B1 96%  softirqs.CPU11.NET_=
RX
      1.54 =C2=B1 48%     +17.0%       1.80 =C2=B1 33%  softirqs.CPU11.NET_=
TX
     23555 =C2=B1  7%      +0.8%      23736 =C2=B1 12%  softirqs.CPU11.RCU
      5150 =C2=B1 12%      -2.3%       5033 =C2=B1 10%  softirqs.CPU11.SCHED
      1.62 =C2=B1328%     -93.8%       0.10 =C2=B1300%  softirqs.CPU11.TASK=
LET
      1023 =C2=B1131%     -60.4%     405.10 =C2=B1 60%  softirqs.CPU11.TIMER
     23669 =C2=B1  8%      -0.6%      23531 =C2=B1 11%  softirqs.CPU110.RCU
      4945 =C2=B1  9%      -5.6%       4667 =C2=B1 19%  softirqs.CPU110.SCH=
ED
      0.15 =C2=B1234%    -100.0%       0.00        softirqs.CPU110.TASKLET
    146.38 =C2=B1 44%     -17.5%     120.70 =C2=B1 14%  softirqs.CPU110.TIM=
ER
     24380 =C2=B1 14%      -3.4%      23559 =C2=B1 13%  softirqs.CPU111.RCU
      5094 =C2=B1  2%      +0.0%       5096 =C2=B1  3%  softirqs.CPU111.SCH=
ED
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU111.TASKLET
    360.15 =C2=B1134%     -28.4%     257.90 =C2=B1143%  softirqs.CPU111.TIM=
ER
     23851 =C2=B1  8%      -0.9%      23636 =C2=B1 11%  softirqs.CPU112.RCU
      5184 =C2=B1  5%      -3.7%       4992 =C2=B1  8%  softirqs.CPU112.SCH=
ED
    260.77 =C2=B1145%     -48.2%     135.00 =C2=B1 23%  softirqs.CPU112.TIM=
ER
     23677 =C2=B1  8%      -0.9%      23466 =C2=B1 11%  softirqs.CPU113.RCU
      5084 =C2=B1  2%      -1.5%       5008 =C2=B1  8%  softirqs.CPU113.SCH=
ED
      0.00         +4e+101%       0.40 =C2=B1300%  softirqs.CPU113.TASKLET
    202.23 =C2=B1 94%     -27.8%     146.10 =C2=B1 32%  softirqs.CPU113.TIM=
ER
     23613 =C2=B1  8%      -0.2%      23566 =C2=B1 11%  softirqs.CPU114.RCU
      5040            -2.9%       4892 =C2=B1 18%  softirqs.CPU114.SCHED
    139.85 =C2=B1 28%     +42.2%     198.90 =C2=B1 65%  softirqs.CPU114.TIM=
ER
     23874 =C2=B1  8%      -0.7%      23696 =C2=B1 11%  softirqs.CPU115.RCU
      5062            -1.9%       4967 =C2=B1  9%  softirqs.CPU115.SCHED
      0.00         +2e+102%       2.00 =C2=B1300%  softirqs.CPU115.TASKLET
    132.69 =C2=B1 20%     +16.9%     155.10 =C2=B1 23%  softirqs.CPU115.TIM=
ER
     23145 =C2=B1 12%      +1.4%      23474 =C2=B1 11%  softirqs.CPU116.RCU
      5092            -2.9%       4944 =C2=B1  9%  softirqs.CPU116.SCHED
    151.23 =C2=B1 69%     +12.7%     170.50 =C2=B1 57%  softirqs.CPU116.TIM=
ER
     23560 =C2=B1  8%      +2.0%      24020 =C2=B1 13%  softirqs.CPU117.RCU
      5063            -1.8%       4971 =C2=B1 10%  softirqs.CPU117.SCHED
      0.00         +2e+101%       0.20 =C2=B1300%  softirqs.CPU117.TASKLET
    126.69 =C2=B1 13%    +129.6%     290.90 =C2=B1136%  softirqs.CPU117.TIM=
ER
     23604 =C2=B1  8%      -0.6%      23452 =C2=B1 12%  softirqs.CPU118.RCU
      5083            -2.6%       4952 =C2=B1  8%  softirqs.CPU118.SCHED
    149.54 =C2=B1 36%     -12.7%     130.50 =C2=B1 13%  softirqs.CPU118.TIM=
ER
     22410 =C2=B1 14%      +1.1%      22658 =C2=B1 10%  softirqs.CPU119.RCU
      5081 =C2=B1  2%      -2.5%       4955 =C2=B1  9%  softirqs.CPU119.SCH=
ED
    172.15 =C2=B1 59%     -27.7%     124.50 =C2=B1 15%  softirqs.CPU119.TIM=
ER
      2041 =C2=B1167%     +50.2%       3065 =C2=B1181%  softirqs.CPU12.NET_=
RX
      1.38 =C2=B1 45%     +15.6%       1.60 =C2=B1 41%  softirqs.CPU12.NET_=
TX
     23423 =C2=B1  8%      +0.4%      23527 =C2=B1 12%  softirqs.CPU12.RCU
      5240 =C2=B1  8%      +0.9%       5285 =C2=B1 18%  softirqs.CPU12.SCHED
    502.08 =C2=B1 65%     +77.7%     892.00 =C2=B1152%  softirqs.CPU12.TIMER
     30453 =C2=B1  8%      -0.1%      30419 =C2=B1 11%  softirqs.CPU120.RCU
      5143            -3.3%       4973 =C2=B1  9%  softirqs.CPU120.SCHED
    590.00 =C2=B1 15%      -6.8%     549.90 =C2=B1 21%  softirqs.CPU120.TIM=
ER
     26712 =C2=B1  6%      +0.8%      26928 =C2=B1  9%  softirqs.CPU121.RCU
      5174            -2.8%       5030 =C2=B1  9%  softirqs.CPU121.SCHED
      0.23 =C2=B1346%    -100.0%       0.00        softirqs.CPU121.TASKLET
    454.85 =C2=B1 31%     +11.0%     505.10 =C2=B1 33%  softirqs.CPU121.TIM=
ER
     24483 =C2=B1  7%      -0.4%      24391 =C2=B1 11%  softirqs.CPU122.RCU
      5119            -0.5%       5093 =C2=B1 11%  softirqs.CPU122.SCHED
    229.69 =C2=B1 37%     +34.5%     309.00 =C2=B1 45%  softirqs.CPU122.TIM=
ER
     24060 =C2=B1  7%      -0.4%      23971 =C2=B1 11%  softirqs.CPU123.RCU
      5150            -2.8%       5006 =C2=B1 10%  softirqs.CPU123.SCHED
    199.00 =C2=B1 43%     -11.5%     176.10 =C2=B1 45%  softirqs.CPU123.TIM=
ER
     23794 =C2=B1  7%      -0.2%      23744 =C2=B1 11%  softirqs.CPU124.RCU
      5207 =C2=B1  4%      -4.1%       4995 =C2=B1  9%  softirqs.CPU124.SCH=
ED
    243.23 =C2=B1107%     -39.0%     148.40 =C2=B1 12%  softirqs.CPU124.TIM=
ER
     23634 =C2=B1  7%      +0.3%      23697 =C2=B1 11%  softirqs.CPU125.RCU
      5148            -2.5%       5021 =C2=B1  9%  softirqs.CPU125.SCHED
    158.00 =C2=B1 38%      +2.9%     162.60 =C2=B1 28%  softirqs.CPU125.TIM=
ER
     23373 =C2=B1  7%      +4.2%      24349 =C2=B1 11%  softirqs.CPU126.RCU
      5142            -2.3%       5023 =C2=B1 10%  softirqs.CPU126.SCHED
    209.62 =C2=B1 69%     +28.7%     269.70 =C2=B1150%  softirqs.CPU126.TIM=
ER
     24026 =C2=B1  7%      -1.1%      23757 =C2=B1 11%  softirqs.CPU127.RCU
      5132            -3.2%       4969 =C2=B1  9%  softirqs.CPU127.SCHED
    208.85 =C2=B1 59%     -23.5%     159.80 =C2=B1 17%  softirqs.CPU127.TIM=
ER
     23285 =C2=B1  7%      +2.4%      23853 =C2=B1 10%  softirqs.CPU128.RCU
      5165 =C2=B1  2%      -2.7%       5028 =C2=B1 10%  softirqs.CPU128.SCH=
ED
    153.31 =C2=B1 80%      -6.5%     143.30 =C2=B1 20%  softirqs.CPU128.TIM=
ER
     23057 =C2=B1  7%      +1.4%      23379 =C2=B1 11%  softirqs.CPU129.RCU
      5164 =C2=B1  3%      -4.2%       4949 =C2=B1  9%  softirqs.CPU129.SCH=
ED
    176.15 =C2=B1107%     -24.1%     133.70 =C2=B1 16%  softirqs.CPU129.TIM=
ER
      2311 =C2=B1122%    +112.2%       4904 =C2=B1111%  softirqs.CPU13.NET_=
RX
      2.15 =C2=B1 30%     -39.6%       1.30 =C2=B1 49%  softirqs.CPU13.NET_=
TX
     23290 =C2=B1  8%      +0.1%      23307 =C2=B1 12%  softirqs.CPU13.RCU
      5301 =C2=B1  6%      -4.0%       5090 =C2=B1 12%  softirqs.CPU13.SCHED
      0.08 =C2=B1346%     +30.0%       0.10 =C2=B1300%  softirqs.CPU13.TASK=
LET
    511.69 =C2=B1 57%      -5.1%     485.80 =C2=B1 77%  softirqs.CPU13.TIMER
     22980 =C2=B1  6%      +0.7%      23138 =C2=B1 11%  softirqs.CPU130.RCU
      5179 =C2=B1  3%      -3.1%       5020 =C2=B1  9%  softirqs.CPU130.SCH=
ED
      0.54 =C2=B1346%    -100.0%       0.00        softirqs.CPU130.TASKLET
    138.00 =C2=B1 33%     +38.5%     191.10 =C2=B1 85%  softirqs.CPU130.TIM=
ER
     22907 =C2=B1  7%      +1.1%      23154 =C2=B1 11%  softirqs.CPU131.RCU
      5124            -2.6%       4989 =C2=B1  9%  softirqs.CPU131.SCHED
    135.69 =C2=B1 24%     +39.7%     189.50 =C2=B1 66%  softirqs.CPU131.TIM=
ER
     22264 =C2=B1 10%      +5.4%      23465 =C2=B1 11%  softirqs.CPU132.RCU
      5146 =C2=B1  2%      -0.6%       5117 =C2=B1 11%  softirqs.CPU132.SCH=
ED
      1.15 =C2=B1346%    -100.0%       0.00        softirqs.CPU132.TASKLET
    178.23 =C2=B1 66%     +63.8%     292.00 =C2=B1108%  softirqs.CPU132.TIM=
ER
     23376 =C2=B1  7%      +1.2%      23649 =C2=B1 11%  softirqs.CPU133.RCU
      5143            -2.8%       4997 =C2=B1  9%  softirqs.CPU133.SCHED
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU133.TASKLET
    185.00 =C2=B1 58%      -2.9%     179.60 =C2=B1 40%  softirqs.CPU133.TIM=
ER
     23140 =C2=B1  8%      +1.7%      23526 =C2=B1 11%  softirqs.CPU134.RCU
      5016 =C2=B1  6%      +0.0%       5018 =C2=B1  9%  softirqs.CPU134.SCH=
ED
    135.92 =C2=B1 15%     +17.9%     160.30 =C2=B1 29%  softirqs.CPU134.TIM=
ER
     22549 =C2=B1  7%      -0.2%      22502 =C2=B1 10%  softirqs.CPU135.RCU
      5103            -2.5%       4973 =C2=B1  9%  softirqs.CPU135.SCHED
    131.31 =C2=B1 19%     +29.2%     169.70 =C2=B1 69%  softirqs.CPU135.TIM=
ER
     23024 =C2=B1  6%      +1.8%      23435 =C2=B1 11%  softirqs.CPU136.RCU
      5189 =C2=B1  3%      -3.7%       4994 =C2=B1  9%  softirqs.CPU136.SCH=
ED
      0.38 =C2=B1346%    -100.0%       0.00        softirqs.CPU136.TASKLET
    244.69 =C2=B1100%     -30.0%     171.40 =C2=B1 62%  softirqs.CPU136.TIM=
ER
     22928 =C2=B1  6%      +0.7%      23088 =C2=B1 11%  softirqs.CPU137.RCU
      5127            -2.4%       5004 =C2=B1  9%  softirqs.CPU137.SCHED
    145.62 =C2=B1 40%      -5.0%     138.30 =C2=B1 29%  softirqs.CPU137.TIM=
ER
     22949 =C2=B1  7%      +1.4%      23263 =C2=B1 11%  softirqs.CPU138.RCU
      5116            -3.3%       4948 =C2=B1  9%  softirqs.CPU138.SCHED
      1.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU138.TASKLET
    129.00 =C2=B1 33%     +20.3%     155.20 =C2=B1 55%  softirqs.CPU138.TIM=
ER
     23199 =C2=B1  6%      +1.6%      23569 =C2=B1 11%  softirqs.CPU139.RCU
      5109            -2.6%       4978 =C2=B1  9%  softirqs.CPU139.SCHED
      0.15 =C2=B1234%    -100.0%       0.00        softirqs.CPU139.TASKLET
    131.08 =C2=B1 24%      -5.8%     123.50 =C2=B1 25%  softirqs.CPU139.TIM=
ER
     23978 =C2=B1 12%      -1.1%      23707 =C2=B1 11%  softirqs.CPU14.RCU
      5019 =C2=B1  8%      -6.3%       4700 =C2=B1 15%  softirqs.CPU14.SCHED
      0.00         +2e+101%       0.20 =C2=B1200%  softirqs.CPU14.TASKLET
    258.15 =C2=B1137%      -8.2%     236.90 =C2=B1 68%  softirqs.CPU14.TIMER
     23233 =C2=B1  7%      +0.7%      23399 =C2=B1 11%  softirqs.CPU140.RCU
      5042 =C2=B1  7%      -3.8%       4849 =C2=B1 12%  softirqs.CPU140.SCH=
ED
    167.00 =C2=B1 84%     -18.1%     136.80 =C2=B1 21%  softirqs.CPU140.TIM=
ER
     22956 =C2=B1  6%      +0.8%      23133 =C2=B1 11%  softirqs.CPU141.RCU
      5181 =C2=B1  4%      -4.2%       4963 =C2=B1  9%  softirqs.CPU141.SCH=
ED
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU141.TASKLET
    192.38 =C2=B1114%     -28.4%     137.70 =C2=B1 17%  softirqs.CPU141.TIM=
ER
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU142.NET_TX
     22820 =C2=B1  6%      +2.9%      23477 =C2=B1 11%  softirqs.CPU142.RCU
      5161 =C2=B1  3%      -3.3%       4990 =C2=B1  9%  softirqs.CPU142.SCH=
ED
    170.92 =C2=B1105%     -33.9%     113.00 =C2=B1 22%  softirqs.CPU142.TIM=
ER
     22785 =C2=B1  7%      +2.3%      23313 =C2=B1 11%  softirqs.CPU143.RCU
      5064 =C2=B1  7%      -0.6%       5032 =C2=B1  9%  softirqs.CPU143.SCH=
ED
    159.62 =C2=B1 73%      -0.3%     159.10 =C2=B1 41%  softirqs.CPU143.TIM=
ER
     30215 =C2=B1  6%      +1.1%      30536 =C2=B1  9%  softirqs.CPU144.RCU
      5094            -0.9%       5048 =C2=B1 10%  softirqs.CPU144.SCHED
    651.69 =C2=B1 10%      +6.8%     696.30 =C2=B1 39%  softirqs.CPU144.TIM=
ER
     26799 =C2=B1  6%      +0.7%      26976 =C2=B1 10%  softirqs.CPU145.RCU
      5164 =C2=B1  2%      -2.6%       5031 =C2=B1  9%  softirqs.CPU145.SCH=
ED
    496.31 =C2=B1 30%      +0.3%     497.60 =C2=B1 26%  softirqs.CPU145.TIM=
ER
     24536 =C2=B1  7%      +1.0%      24779 =C2=B1 10%  softirqs.CPU146.RCU
      5061 =C2=B1  3%      -2.0%       4961 =C2=B1  9%  softirqs.CPU146.SCH=
ED
    269.92 =C2=B1 58%     -22.2%     210.00 =C2=B1 10%  softirqs.CPU146.TIM=
ER
     24003 =C2=B1  7%      +1.1%      24275 =C2=B1 10%  softirqs.CPU147.RCU
      5101            -2.1%       4994 =C2=B1 10%  softirqs.CPU147.SCHED
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU147.TASKLET
    138.23 =C2=B1 14%     +27.5%     176.20 =C2=B1 37%  softirqs.CPU147.TIM=
ER
     23801 =C2=B1  8%      +2.4%      24368 =C2=B1 11%  softirqs.CPU148.RCU
      5083            -2.0%       4982 =C2=B1  9%  softirqs.CPU148.SCHED
      0.00         +2e+101%       0.20 =C2=B1300%  softirqs.CPU148.TASKLET
    148.85 =C2=B1 32%      -1.8%     146.20 =C2=B1 19%  softirqs.CPU148.TIM=
ER
     23408 =C2=B1 11%      +3.5%      24218 =C2=B1 11%  softirqs.CPU149.RCU
      5084            -2.2%       4970 =C2=B1  9%  softirqs.CPU149.SCHED
    141.85 =C2=B1 36%      -3.6%     136.80 =C2=B1 25%  softirqs.CPU149.TIM=
ER
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU15.NET_TX
     23380 =C2=B1  8%      +2.5%      23976 =C2=B1 11%  softirqs.CPU15.RCU
      5048            -1.3%       4982 =C2=B1 10%  softirqs.CPU15.SCHED
      2.00            +5.0%       2.10 =C2=B1 14%  softirqs.CPU15.TASKLET
    123.08 =C2=B1 10%    +151.5%     309.50 =C2=B1129%  softirqs.CPU15.TIMER
     23843 =C2=B1  7%      +2.2%      24356 =C2=B1 10%  softirqs.CPU150.RCU
      5100            -8.1%       4688 =C2=B1 14%  softirqs.CPU150.SCHED
    156.38 =C2=B1 62%      -1.4%     154.20 =C2=B1 31%  softirqs.CPU150.TIM=
ER
     23737 =C2=B1  7%      +1.5%      24094 =C2=B1 11%  softirqs.CPU151.RCU
      5065            -0.4%       5045 =C2=B1 10%  softirqs.CPU151.SCHED
      0.00       +1.6e+102%       1.60 =C2=B1300%  softirqs.CPU151.TASKLET
    147.77 =C2=B1 32%      -0.4%     147.20 =C2=B1  9%  softirqs.CPU151.TIM=
ER
     23685 =C2=B1  7%      +1.1%      23954 =C2=B1 11%  softirqs.CPU152.RCU
      5098            -2.4%       4973 =C2=B1  9%  softirqs.CPU152.SCHED
      0.08 =C2=B1346%    +160.0%       0.20 =C2=B1300%  softirqs.CPU152.TAS=
KLET
    132.85 =C2=B1 12%     +18.0%     156.80 =C2=B1 26%  softirqs.CPU152.TIM=
ER
     24238 =C2=B1  8%      -0.8%      24049 =C2=B1 10%  softirqs.CPU153.RCU
      5133 =C2=B1  2%      -2.9%       4985 =C2=B1  9%  softirqs.CPU153.SCH=
ED
    235.77 =C2=B1157%     -33.3%     157.30 =C2=B1 40%  softirqs.CPU153.TIM=
ER
     23903 =C2=B1  7%      +1.4%      24244 =C2=B1 11%  softirqs.CPU154.RCU
      5109            -1.8%       5016 =C2=B1  9%  softirqs.CPU154.SCHED
      0.08 =C2=B1346%   +2240.0%       1.80 =C2=B1300%  softirqs.CPU154.TAS=
KLET
    156.54 =C2=B1 49%      -1.5%     154.20 =C2=B1 26%  softirqs.CPU154.TIM=
ER
     23731 =C2=B1  7%      +2.7%      24379 =C2=B1 11%  softirqs.CPU155.RCU
      5096            -2.1%       4991 =C2=B1  9%  softirqs.CPU155.SCHED
      0.00         +3e+101%       0.30 =C2=B1300%  softirqs.CPU155.TASKLET
    131.77 =C2=B1 15%      +8.7%     143.20 =C2=B1 24%  softirqs.CPU155.TIM=
ER
     23616 =C2=B1  7%      +1.7%      24009 =C2=B1 11%  softirqs.CPU156.RCU
      5120            -4.2%       4908 =C2=B1 12%  softirqs.CPU156.SCHED
    143.77 =C2=B1 49%    +131.2%     332.40 =C2=B1 79%  softirqs.CPU156.TIM=
ER
     23674 =C2=B1  7%      +1.5%      24020 =C2=B1 11%  softirqs.CPU157.RCU
      5094            -2.4%       4972 =C2=B1  9%  softirqs.CPU157.SCHED
    135.38 =C2=B1 30%      +7.1%     145.00 =C2=B1 15%  softirqs.CPU157.TIM=
ER
     23662 =C2=B1  7%      +1.8%      24086 =C2=B1 10%  softirqs.CPU158.RCU
      5137 =C2=B1  2%      -2.8%       4995 =C2=B1  9%  softirqs.CPU158.SCH=
ED
    153.85 =C2=B1 59%      -3.9%     147.90 =C2=B1 38%  softirqs.CPU158.TIM=
ER
     23730 =C2=B1  7%      +1.2%      24025 =C2=B1 11%  softirqs.CPU159.RCU
      5130 =C2=B1  4%      -3.3%       4960 =C2=B1  9%  softirqs.CPU159.SCH=
ED
      0.08 =C2=B1346%    +420.0%       0.40 =C2=B1300%  softirqs.CPU159.TAS=
KLET
    195.69 =C2=B1112%     -26.2%     144.40 =C2=B1 19%  softirqs.CPU159.TIM=
ER
     24038 =C2=B1  9%      +1.4%      24382 =C2=B1 12%  softirqs.CPU16.RCU
      5060            -1.5%       4984 =C2=B1  9%  softirqs.CPU16.SCHED
      2.00            +0.0%       2.00        softirqs.CPU16.TASKLET
    146.31 =C2=B1 23%     +84.8%     270.40 =C2=B1145%  softirqs.CPU16.TIMER
     23888 =C2=B1  7%      +0.6%      24035 =C2=B1 11%  softirqs.CPU160.RCU
      5064            -2.0%       4961 =C2=B1 10%  softirqs.CPU160.SCHED
    123.15 =C2=B1 15%     +39.8%     172.20 =C2=B1 52%  softirqs.CPU160.TIM=
ER
     23919 =C2=B1  8%      +1.0%      24164 =C2=B1 12%  softirqs.CPU161.RCU
      5107            -2.2%       4994 =C2=B1  6%  softirqs.CPU161.SCHED
    128.15 =C2=B1 10%     +69.1%     216.70 =C2=B1121%  softirqs.CPU161.TIM=
ER
     23612 =C2=B1  7%      +0.3%      23689 =C2=B1 12%  softirqs.CPU162.RCU
      5096            -2.9%       4946 =C2=B1  9%  softirqs.CPU162.SCHED
    133.92 =C2=B1 30%      -8.0%     123.20 =C2=B1 22%  softirqs.CPU162.TIM=
ER
     24283 =C2=B1  8%      -0.7%      24109 =C2=B1 13%  softirqs.CPU163.RCU
      5119 =C2=B1  3%      -2.6%       4988 =C2=B1  9%  softirqs.CPU163.SCH=
ED
      1.54 =C2=B1346%     -93.5%       0.10 =C2=B1300%  softirqs.CPU163.TAS=
KLET
    127.38 =C2=B1 13%     +33.5%     170.00 =C2=B1 63%  softirqs.CPU163.TIM=
ER
     23654 =C2=B1  8%      +0.6%      23787 =C2=B1 12%  softirqs.CPU164.RCU
      5081            -2.2%       4970 =C2=B1  9%  softirqs.CPU164.SCHED
    150.23 =C2=B1 51%      -6.2%     140.90 =C2=B1 16%  softirqs.CPU164.TIM=
ER
     23963 =C2=B1  8%      -0.9%      23750 =C2=B1 12%  softirqs.CPU165.RCU
      5097            -5.3%       4824 =C2=B1 18%  softirqs.CPU165.SCHED
    137.00 =C2=B1 20%      +1.4%     138.90 =C2=B1 24%  softirqs.CPU165.TIM=
ER
     23955 =C2=B1  8%      +0.3%      24024 =C2=B1 11%  softirqs.CPU166.RCU
      5115            -2.0%       5014 =C2=B1  9%  softirqs.CPU166.SCHED
      1.15 =C2=B1346%     -65.3%       0.40 =C2=B1300%  softirqs.CPU166.TAS=
KLET
    132.31 =C2=B1 22%     +22.4%     161.90 =C2=B1 60%  softirqs.CPU166.TIM=
ER
     23770 =C2=B1  7%      +1.7%      24171 =C2=B1 11%  softirqs.CPU167.RCU
      5173 =C2=B1  4%      -4.5%       4941 =C2=B1  9%  softirqs.CPU167.SCH=
ED
      0.08 =C2=B1346%     +30.0%       0.10 =C2=B1300%  softirqs.CPU167.TAS=
KLET
    206.62 =C2=B1125%     -34.6%     135.10 =C2=B1 21%  softirqs.CPU167.TIM=
ER
     28920 =C2=B1  6%      -1.3%      28537 =C2=B1 10%  softirqs.CPU168.RCU
      5142 =C2=B1  3%      +0.4%       5164 =C2=B1 12%  softirqs.CPU168.SCH=
ED
    647.38 =C2=B1 58%     +49.6%     968.80 =C2=B1 89%  softirqs.CPU168.TIM=
ER
     24689 =C2=B1  5%      -1.0%      24439 =C2=B1 10%  softirqs.CPU169.RCU
      5107            +0.2%       5117 =C2=B1 11%  softirqs.CPU169.SCHED
      1.54 =C2=B1346%     -67.5%       0.50 =C2=B1300%  softirqs.CPU169.TAS=
KLET
    394.08 =C2=B1 27%     +28.4%     506.00 =C2=B1 74%  softirqs.CPU169.TIM=
ER
     23671 =C2=B1  9%      -0.2%      23634 =C2=B1 11%  softirqs.CPU17.RCU
      4952 =C2=B1  7%      -0.3%       4937 =C2=B1  8%  softirqs.CPU17.SCHED
      2.00           -10.0%       1.80 =C2=B1 33%  softirqs.CPU17.TASKLET
    178.46 =C2=B1 54%     -22.7%     137.90 =C2=B1 15%  softirqs.CPU17.TIMER
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU170.NET_TX
     22473 =C2=B1  7%      -1.1%      22218 =C2=B1 11%  softirqs.CPU170.RCU
      5087            -0.0%       5086 =C2=B1 11%  softirqs.CPU170.SCHED
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU170.TASKLET
    201.54 =C2=B1 46%     +62.8%     328.20 =C2=B1113%  softirqs.CPU170.TIM=
ER
     21968 =C2=B1  7%      +0.7%      22115 =C2=B1 12%  softirqs.CPU171.RCU
      5167 =C2=B1  3%      -3.7%       4976 =C2=B1  9%  softirqs.CPU171.SCH=
ED
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU171.TASKLET
    225.08 =C2=B1164%     -41.5%     131.60 =C2=B1 22%  softirqs.CPU171.TIM=
ER
     21864 =C2=B1  7%      -0.3%      21800 =C2=B1 11%  softirqs.CPU172.RCU
      5092            +0.7%       5128 =C2=B1 10%  softirqs.CPU172.SCHED
    143.38 =C2=B1 50%     +78.9%     256.50 =C2=B1149%  softirqs.CPU172.TIM=
ER
     22411 =C2=B1 11%      -1.6%      22055 =C2=B1 11%  softirqs.CPU173.RCU
      5147 =C2=B1  2%      -0.8%       5104 =C2=B1  9%  softirqs.CPU173.SCH=
ED
      0.00         +2e+102%       2.00 =C2=B1300%  softirqs.CPU173.TASKLET
    232.23 =C2=B1156%     -36.8%     146.80 =C2=B1 63%  softirqs.CPU173.TIM=
ER
     21786 =C2=B1  7%      +3.3%      22507 =C2=B1 11%  softirqs.CPU174.RCU
      5136            -0.1%       5132 =C2=B1 10%  softirqs.CPU174.SCHED
    111.54 =C2=B1 70%    +259.4%     400.90 =C2=B1134%  softirqs.CPU174.TIM=
ER
     21853 =C2=B1  7%      -1.7%      21488 =C2=B1 12%  softirqs.CPU175.RCU
      5117 =C2=B1  2%      -2.3%       4997 =C2=B1  9%  softirqs.CPU175.SCH=
ED
    158.15 =C2=B1 78%     -10.2%     142.10 =C2=B1 27%  softirqs.CPU175.TIM=
ER
     22017 =C2=B1  7%      +2.3%      22515 =C2=B1 18%  softirqs.CPU176.RCU
      5099            -1.5%       5022 =C2=B1  9%  softirqs.CPU176.SCHED
    108.15 =C2=B1  8%    +145.6%     265.60 =C2=B1148%  softirqs.CPU176.TIM=
ER
     21719 =C2=B1  7%      +0.2%      21757 =C2=B1 11%  softirqs.CPU177.RCU
      5102            -1.7%       5016 =C2=B1  9%  softirqs.CPU177.SCHED
    114.15 =C2=B1 19%     +31.8%     150.50 =C2=B1 42%  softirqs.CPU177.TIM=
ER
     21806 =C2=B1  8%      -0.4%      21724 =C2=B1 11%  softirqs.CPU178.RCU
      5099            -2.2%       4986 =C2=B1  9%  softirqs.CPU178.SCHED
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU178.TASKLET
    118.85 =C2=B1 23%      +9.5%     130.10 =C2=B1 27%  softirqs.CPU178.TIM=
ER
     21944 =C2=B1  7%      -0.1%      21926 =C2=B1 11%  softirqs.CPU179.RCU
      5125            -2.9%       4977 =C2=B1  9%  softirqs.CPU179.SCHED
      0.00       +1.1e+102%       1.10 =C2=B1300%  softirqs.CPU179.TASKLET
    154.54 =C2=B1 99%      -8.6%     141.20 =C2=B1 19%  softirqs.CPU179.TIM=
ER
      0.00       +2.6e+103%      26.10 =C2=B1300%  softirqs.CPU18.BLOCK
     23845 =C2=B1  9%      +0.7%      24012 =C2=B1 12%  softirqs.CPU18.RCU
      4983 =C2=B1  9%      -2.8%       4842 =C2=B1 17%  softirqs.CPU18.SCHED
      2.00           -10.0%       1.80 =C2=B1 33%  softirqs.CPU18.TASKLET
    133.00 =C2=B1 13%     +33.3%     177.30 =C2=B1 62%  softirqs.CPU18.TIMER
     21796 =C2=B1  7%      +1.1%      22025 =C2=B1 11%  softirqs.CPU180.RCU
      5113            -1.9%       5014 =C2=B1  9%  softirqs.CPU180.SCHED
    121.00 =C2=B1 30%      +3.7%     125.50 =C2=B1 27%  softirqs.CPU180.TIM=
ER
     21701 =C2=B1  7%      +0.6%      21830 =C2=B1 11%  softirqs.CPU181.RCU
      5100            -1.7%       5014 =C2=B1  9%  softirqs.CPU181.SCHED
    124.92 =C2=B1 28%      +4.3%     130.30 =C2=B1 19%  softirqs.CPU181.TIM=
ER
     21790 =C2=B1  7%      +0.3%      21862 =C2=B1 11%  softirqs.CPU182.RCU
      5111            -2.0%       5007 =C2=B1  9%  softirqs.CPU182.SCHED
    115.69 =C2=B1 20%     +65.3%     191.20 =C2=B1 59%  softirqs.CPU182.TIM=
ER
     21490 =C2=B1  7%      -0.5%      21388 =C2=B1 12%  softirqs.CPU183.RCU
      5093            -1.8%       5000 =C2=B1  9%  softirqs.CPU183.SCHED
    126.23 =C2=B1 37%     -15.3%     106.90 =C2=B1 16%  softirqs.CPU183.TIM=
ER
     21764 =C2=B1  7%      -0.3%      21699 =C2=B1 11%  softirqs.CPU184.RCU
      5098            -2.4%       4975 =C2=B1  9%  softirqs.CPU184.SCHED
    118.62 =C2=B1 17%      +2.1%     121.10 =C2=B1 23%  softirqs.CPU184.TIM=
ER
     21870 =C2=B1  7%      +2.6%      22434 =C2=B1 12%  softirqs.CPU185.RCU
      5093            -1.3%       5028 =C2=B1  9%  softirqs.CPU185.SCHED
      0.31 =C2=B1346%    -100.0%       0.00        softirqs.CPU185.TASKLET
    108.15 =C2=B1 17%    +163.3%     284.80 =C2=B1140%  softirqs.CPU185.TIM=
ER
     21940 =C2=B1  7%      -0.0%      21931 =C2=B1 11%  softirqs.CPU186.RCU
      5116            -2.9%       4969 =C2=B1  9%  softirqs.CPU186.SCHED
      1.23 =C2=B1346%    -100.0%       0.00        softirqs.CPU186.TASKLET
    122.69 =C2=B1 15%      -8.5%     112.30 =C2=B1 15%  softirqs.CPU186.TIM=
ER
     22209 =C2=B1  6%      -1.0%      21977 =C2=B1 11%  softirqs.CPU187.RCU
      5139 =C2=B1  4%      -3.2%       4973 =C2=B1  9%  softirqs.CPU187.SCH=
ED
    149.46 =C2=B1129%     -38.3%      92.20 =C2=B1 23%  softirqs.CPU187.TIM=
ER
     21688 =C2=B1  7%      -0.2%      21646 =C2=B1 11%  softirqs.CPU188.RCU
      5123            -2.4%       5002 =C2=B1  9%  softirqs.CPU188.SCHED
    178.85 =C2=B1 97%     -33.3%     119.30 =C2=B1 18%  softirqs.CPU188.TIM=
ER
     21817 =C2=B1  7%      -0.3%      21742 =C2=B1 11%  softirqs.CPU189.RCU
      5249 =C2=B1  7%      -5.2%       4974 =C2=B1  9%  softirqs.CPU189.SCH=
ED
    309.62 =C2=B1211%     -51.2%     151.20 =C2=B1 67%  softirqs.CPU189.TIM=
ER
      0.00         +3e+101%       0.30 =C2=B1300%  softirqs.CPU19.BLOCK
     24200 =C2=B1  8%      -0.6%      24061 =C2=B1 11%  softirqs.CPU19.RCU
      5093 =C2=B1  2%      -2.8%       4949 =C2=B1  9%  softirqs.CPU19.SCHED
      2.69 =C2=B1 89%     -25.7%       2.00        softirqs.CPU19.TASKLET
    213.54 =C2=B1 73%      -0.0%     213.50 =C2=B1 72%  softirqs.CPU19.TIMER
     21866 =C2=B1  7%      +0.4%      21961 =C2=B1 11%  softirqs.CPU190.RCU
      5218 =C2=B1  6%      -4.5%       4984 =C2=B1  9%  softirqs.CPU190.SCH=
ED
    317.15 =C2=B1193%     -61.9%     120.80 =C2=B1 30%  softirqs.CPU190.TIM=
ER
     22530 =C2=B1  6%      +1.3%      22822 =C2=B1 11%  softirqs.CPU191.RCU
      5096 =C2=B1  3%      -1.6%       5014 =C2=B1  8%  softirqs.CPU191.SCH=
ED
    163.85 =C2=B1 14%      +5.3%     172.50 =C2=B1 12%  softirqs.CPU191.TIM=
ER
     23855 =C2=B1  8%      +1.0%      24084 =C2=B1 13%  softirqs.CPU2.RCU
      5199            +0.4%       5218 =C2=B1 11%  softirqs.CPU2.SCHED
    220.69 =C2=B1 19%     +94.9%     430.10 =C2=B1 93%  softirqs.CPU2.TIMER
      0.00       +2.6e+103%      25.80 =C2=B1299%  softirqs.CPU20.BLOCK
     23994 =C2=B1  8%      +0.4%      24097 =C2=B1 10%  softirqs.CPU20.RCU
      5101            -5.8%       4807 =C2=B1 12%  softirqs.CPU20.SCHED
      1.92 =C2=B1 32%      -6.4%       1.80 =C2=B1 33%  softirqs.CPU20.TASK=
LET
    170.69 =C2=B1 77%      -2.3%     166.80 =C2=B1 38%  softirqs.CPU20.TIMER
     23880 =C2=B1  9%      +0.6%      24017 =C2=B1 11%  softirqs.CPU21.RCU
      4936 =C2=B1  8%      +1.4%       5003 =C2=B1  8%  softirqs.CPU21.SCHED
      2.00           -40.0%       1.20 =C2=B1 81%  softirqs.CPU21.TASKLET
    134.69 =C2=B1 21%    +109.4%     282.10 =C2=B1 66%  softirqs.CPU21.TIMER
      0.00       +2.6e+103%      26.10 =C2=B1300%  softirqs.CPU22.BLOCK
     23792 =C2=B1  9%      -0.7%      23625 =C2=B1 11%  softirqs.CPU22.RCU
      5044            -6.3%       4727 =C2=B1 18%  softirqs.CPU22.SCHED
      1.85 =C2=B1 28%     -13.3%       1.60 =C2=B1 50%  softirqs.CPU22.TASK=
LET
    129.31 =C2=B1 13%     +34.6%     174.10 =C2=B1 50%  softirqs.CPU22.TIMER
     40.15 =C2=B1234%     +95.0%      78.30 =C2=B1152%  softirqs.CPU23.BLOCK
     23804 =C2=B1  8%      +0.8%      23989 =C2=B1 11%  softirqs.CPU23.RCU
      4959 =C2=B1  8%      -1.7%       4872 =C2=B1  9%  softirqs.CPU23.SCHED
      0.38 =C2=B1191%    +108.0%       0.80 =C2=B1122%  softirqs.CPU23.TASK=
LET
    177.00 =C2=B1 41%     -13.2%     153.70 =C2=B1 19%  softirqs.CPU23.TIMER
     24053 =C2=B1 11%      +1.1%      24318 =C2=B1 11%  softirqs.CPU24.RCU
      5081            -2.3%       4963 =C2=B1  9%  softirqs.CPU24.SCHED
      2.00            +0.0%       2.00        softirqs.CPU24.TASKLET
    316.31 =C2=B1 11%      +1.9%     322.20 =C2=B1  6%  softirqs.CPU24.TIMER
     25382 =C2=B1  6%      +0.1%      25410 =C2=B1 11%  softirqs.CPU25.RCU
      5091 =C2=B1  2%      -2.3%       4973 =C2=B1  9%  softirqs.CPU25.SCHED
      2.08 =C2=B1 12%      -3.7%       2.00        softirqs.CPU25.TASKLET
    326.54 =C2=B1 20%      +8.7%     354.90 =C2=B1 29%  softirqs.CPU25.TIMER
     24641 =C2=B1  6%      -0.3%      24572 =C2=B1 11%  softirqs.CPU26.RCU
      5102            -3.2%       4937 =C2=B1  9%  softirqs.CPU26.SCHED
      2.00            +5.0%       2.10 =C2=B1 14%  softirqs.CPU26.TASKLET
    208.69 =C2=B1  6%     +19.3%     248.90 =C2=B1 41%  softirqs.CPU26.TIMER
     24538 =C2=B1  6%      -0.1%      24508 =C2=B1 11%  softirqs.CPU27.RCU
      5233 =C2=B1  5%      -5.1%       4964 =C2=B1  9%  softirqs.CPU27.SCHED
      2.08 =C2=B1 12%      -3.7%       2.00        softirqs.CPU27.TASKLET
    326.08 =C2=B1127%     -50.0%     163.00 =C2=B1 42%  softirqs.CPU27.TIMER
     24274 =C2=B1  6%      -0.1%      24251 =C2=B1 11%  softirqs.CPU28.RCU
      5099            -2.2%       4986 =C2=B1 10%  softirqs.CPU28.SCHED
      2.00            +0.0%       2.00        softirqs.CPU28.TASKLET
    149.23 =C2=B1 26%      -4.1%     143.10 =C2=B1 25%  softirqs.CPU28.TIMER
     24250 =C2=B1  6%      -0.4%      24155 =C2=B1 12%  softirqs.CPU29.RCU
      5058            -1.9%       4959 =C2=B1 10%  softirqs.CPU29.SCHED
      2.00            +0.0%       2.00        softirqs.CPU29.TASKLET
    149.00 =C2=B1 26%      -7.2%     138.30 =C2=B1 17%  softirqs.CPU29.TIMER
     24064 =C2=B1  9%      -1.7%      23665 =C2=B1 12%  softirqs.CPU3.RCU
      5028 =C2=B1  7%      -0.3%       5011 =C2=B1  8%  softirqs.CPU3.SCHED
    290.31 =C2=B1121%     -49.5%     146.60 =C2=B1 18%  softirqs.CPU3.TIMER
     23913 =C2=B1  6%      +0.5%      24025 =C2=B1 11%  softirqs.CPU30.RCU
      5040            -1.5%       4964 =C2=B1  9%  softirqs.CPU30.SCHED
      2.92 =C2=B1109%     -31.6%       2.00        softirqs.CPU30.TASKLET
    140.00 =C2=B1 20%      -9.3%     127.00 =C2=B1 21%  softirqs.CPU30.TIMER
     24411 =C2=B1  6%      -0.8%      24214 =C2=B1 11%  softirqs.CPU31.RCU
      5053            -1.5%       4976 =C2=B1  9%  softirqs.CPU31.SCHED
      2.00            -5.0%       1.90 =C2=B1 15%  softirqs.CPU31.TASKLET
    179.69 =C2=B1 49%     -18.2%     147.00 =C2=B1 15%  softirqs.CPU31.TIMER
     24604 =C2=B1  6%      +0.3%      24683 =C2=B1 10%  softirqs.CPU32.RCU
      5119 =C2=B1  4%      -2.5%       4989 =C2=B1  9%  softirqs.CPU32.SCHED
    151.62 =C2=B1 25%     +13.2%     171.70 =C2=B1 44%  softirqs.CPU32.TIMER
     24280 =C2=B1  6%      +1.0%      24522 =C2=B1 10%  softirqs.CPU33.RCU
      5063            -2.0%       4964 =C2=B1  9%  softirqs.CPU33.SCHED
    152.15 =C2=B1 37%      +3.4%     157.30 =C2=B1 29%  softirqs.CPU33.TIMER
     24192 =C2=B1  5%      -1.7%      23780 =C2=B1 15%  softirqs.CPU34.RCU
      5070            -2.1%       4962 =C2=B1  9%  softirqs.CPU34.SCHED
      0.15 =C2=B1346%    -100.0%       0.00        softirqs.CPU34.TASKLET
    138.69 =C2=B1 17%      -4.2%     132.80 =C2=B1 35%  softirqs.CPU34.TIMER
     24203 =C2=B1  6%      +0.8%      24386 =C2=B1 10%  softirqs.CPU35.RCU
      5094            -2.5%       4966 =C2=B1  9%  softirqs.CPU35.SCHED
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU35.TASKLET
    146.69 =C2=B1 42%      -2.0%     143.80 =C2=B1 12%  softirqs.CPU35.TIMER
     24098 =C2=B1  6%      +1.4%      24440 =C2=B1 10%  softirqs.CPU36.RCU
      5073            -2.0%       4970 =C2=B1  9%  softirqs.CPU36.SCHED
      0.31 =C2=B1346%    -100.0%       0.00        softirqs.CPU36.TASKLET
    156.00 =C2=B1 48%      +0.8%     157.30 =C2=B1 30%  softirqs.CPU36.TIMER
     24786 =C2=B1  8%      -1.0%      24533 =C2=B1 10%  softirqs.CPU37.RCU
      4983 =C2=B1  7%      -0.6%       4955 =C2=B1  9%  softirqs.CPU37.SCHED
    147.23 =C2=B1 12%      +9.0%     160.50 =C2=B1 20%  softirqs.CPU37.TIMER
     24052 =C2=B1 11%      +2.2%      24590 =C2=B1 10%  softirqs.CPU38.RCU
      5098            -5.5%       4817 =C2=B1 12%  softirqs.CPU38.SCHED
      0.46 =C2=B1346%    -100.0%       0.00        softirqs.CPU38.TASKLET
    145.23 =C2=B1 19%     +26.5%     183.70 =C2=B1 55%  softirqs.CPU38.TIMER
     24594 =C2=B1  6%      -0.5%      24480 =C2=B1 10%  softirqs.CPU39.RCU
      5215 =C2=B1  9%      -4.6%       4976 =C2=B1  9%  softirqs.CPU39.SCHED
    326.31 =C2=B1158%     -53.0%     153.40 =C2=B1 26%  softirqs.CPU39.TIMER
     23012 =C2=B1 11%      +3.0%      23701 =C2=B1 12%  softirqs.CPU4.RCU
      4989 =C2=B1  9%      -4.7%       4754 =C2=B1 19%  softirqs.CPU4.SCHED
      0.08 =C2=B1346%     +30.0%       0.10 =C2=B1300%  softirqs.CPU4.TASKL=
ET
    151.54 =C2=B1 48%     +45.6%     220.60 =C2=B1 65%  softirqs.CPU4.TIMER
     24398 =C2=B1  6%      +0.5%      24517 =C2=B1 10%  softirqs.CPU40.RCU
      5085            -2.0%       4983 =C2=B1  9%  softirqs.CPU40.SCHED
    133.46 =C2=B1 20%      +8.1%     144.30 =C2=B1 21%  softirqs.CPU40.TIMER
     24289 =C2=B1  5%      +0.3%      24370 =C2=B1 10%  softirqs.CPU41.RCU
      4958 =C2=B1  6%      +0.3%       4973 =C2=B1  9%  softirqs.CPU41.SCHED
    166.08 =C2=B1 34%     -14.0%     142.80 =C2=B1 25%  softirqs.CPU41.TIMER
     24442 =C2=B1  6%      +0.2%      24491 =C2=B1 10%  softirqs.CPU42.RCU
      4973 =C2=B1  7%      -0.4%       4953 =C2=B1  9%  softirqs.CPU42.SCHED
    154.08 =C2=B1 28%      -8.5%     141.00 =C2=B1 24%  softirqs.CPU42.TIMER
     24742 =C2=B1  7%      +0.4%      24833 =C2=B1 10%  softirqs.CPU43.RCU
      5097            -2.8%       4953 =C2=B1 10%  softirqs.CPU43.SCHED
      0.15 =C2=B1234%    -100.0%       0.00        softirqs.CPU43.TASKLET
    136.31 =C2=B1 27%      +5.6%     143.90 =C2=B1 20%  softirqs.CPU43.TIMER
     24492 =C2=B1  6%      +0.4%      24596 =C2=B1 10%  softirqs.CPU44.RCU
      5102            -2.6%       4969 =C2=B1  9%  softirqs.CPU44.SCHED
    184.85 =C2=B1 58%     -22.3%     143.70 =C2=B1 24%  softirqs.CPU44.TIMER
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU45.NET_TX
     24324 =C2=B1  6%      +0.4%      24419 =C2=B1 10%  softirqs.CPU45.RCU
      5159 =C2=B1  2%      -3.9%       4956 =C2=B1  9%  softirqs.CPU45.SCHED
    221.69 =C2=B1 49%     -29.1%     157.10 =C2=B1 26%  softirqs.CPU45.TIMER
     24197 =C2=B1  5%      +0.9%      24406 =C2=B1 10%  softirqs.CPU46.RCU
      5178 =C2=B1  2%      -4.8%       4931 =C2=B1  9%  softirqs.CPU46.SCHED
      0.23 =C2=B1346%    -100.0%       0.00        softirqs.CPU46.TASKLET
    241.46 =C2=B1 73%     -49.8%     121.10 =C2=B1 20%  softirqs.CPU46.TIMER
     24169 =C2=B1  6%      +0.6%      24303 =C2=B1 10%  softirqs.CPU47.RCU
      5181 =C2=B1  5%      -3.7%       4987 =C2=B1  9%  softirqs.CPU47.SCHED
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU47.TASKLET
    257.31 =C2=B1119%     -15.9%     216.40 =C2=B1 74%  softirqs.CPU47.TIMER
     22815 =C2=B1  7%      +0.6%      22942 =C2=B1 10%  softirqs.CPU48.RCU
      5040            -1.6%       4958 =C2=B1  9%  softirqs.CPU48.SCHED
      2.08 =C2=B1 12%      -3.7%       2.00        softirqs.CPU48.TASKLET
    352.23 =C2=B1  7%      -1.9%     345.40 =C2=B1 10%  softirqs.CPU48.TIMER
     23776 =C2=B1  7%      -0.3%      23703 =C2=B1 10%  softirqs.CPU49.RCU
      5128            -2.9%       4982 =C2=B1 10%  softirqs.CPU49.SCHED
      2.00            +0.0%       2.00        softirqs.CPU49.TASKLET
    317.85 =C2=B1 12%      -2.1%     311.20 =C2=B1 10%  softirqs.CPU49.TIMER
     23571 =C2=B1  8%      +1.2%      23844 =C2=B1 11%  softirqs.CPU5.RCU
      5105 =C2=B1  2%      -1.6%       5021 =C2=B1  9%  softirqs.CPU5.SCHED
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU5.TASKLET
    162.69 =C2=B1 90%     +11.9%     182.10 =C2=B1 58%  softirqs.CPU5.TIMER
     23045 =C2=B1  7%      -0.2%      23006 =C2=B1 10%  softirqs.CPU50.RCU
      5095 =C2=B1  2%      -2.8%       4952 =C2=B1  9%  softirqs.CPU50.SCHED
      2.15 =C2=B1 24%      -7.1%       2.00        softirqs.CPU50.TASKLET
    211.69 =C2=B1 38%      -8.4%     193.90 =C2=B1  8%  softirqs.CPU50.TIMER
     23186 =C2=B1  7%      -1.1%      22938 =C2=B1 11%  softirqs.CPU51.RCU
      5069            -2.5%       4942 =C2=B1  9%  softirqs.CPU51.SCHED
      1.92 =C2=B1 13%      +4.0%       2.00        softirqs.CPU51.TASKLET
    121.38 =C2=B1 12%      +7.3%     130.20 =C2=B1 21%  softirqs.CPU51.TIMER
     22193 =C2=B1 11%      +3.4%      22954 =C2=B1 10%  softirqs.CPU52.RCU
      5067            -2.5%       4940 =C2=B1  9%  softirqs.CPU52.SCHED
      2.00           +10.0%       2.20 =C2=B1 18%  softirqs.CPU52.TASKLET
    127.92 =C2=B1 36%     +10.4%     141.20 =C2=B1 36%  softirqs.CPU52.TIMER
     22555 =C2=B1  7%      +0.9%      22755 =C2=B1 11%  softirqs.CPU53.RCU
      5082            -2.3%       4968 =C2=B1  9%  softirqs.CPU53.SCHED
      2.00            +5.0%       2.10 =C2=B1 14%  softirqs.CPU53.TASKLET
    199.46 =C2=B1 56%     -39.9%     119.90 =C2=B1 21%  softirqs.CPU53.TIMER
     22530 =C2=B1  7%      +1.7%      22909 =C2=B1 11%  softirqs.CPU54.RCU
      5078            -1.7%       4994 =C2=B1  9%  softirqs.CPU54.SCHED
      2.00           +55.0%       3.10 =C2=B1106%  softirqs.CPU54.TASKLET
    117.23 =C2=B1 29%      -2.1%     114.80 =C2=B1 13%  softirqs.CPU54.TIMER
     22903 =C2=B1  7%      -0.4%      22812 =C2=B1 11%  softirqs.CPU55.RCU
      5038            -1.7%       4954 =C2=B1  9%  softirqs.CPU55.SCHED
      2.00            +0.0%       2.00        softirqs.CPU55.TASKLET
    109.23 =C2=B1 10%     +34.3%     146.70 =C2=B1 40%  softirqs.CPU55.TIMER
     22784 =C2=B1  8%      -0.2%      22730 =C2=B1 11%  softirqs.CPU56.RCU
      5028            -1.7%       4945 =C2=B1  9%  softirqs.CPU56.SCHED
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU56.TASKLET
    115.85 =C2=B1 27%     +37.8%     159.60 =C2=B1 54%  softirqs.CPU56.TIMER
     22395 =C2=B1  7%      +1.5%      22730 =C2=B1 10%  softirqs.CPU57.RCU
      5068            +0.1%       5072 =C2=B1 11%  softirqs.CPU57.SCHED
      0.15 =C2=B1346%    -100.0%       0.00        softirqs.CPU57.TASKLET
    116.85 =C2=B1 15%     +92.5%     224.90 =C2=B1121%  softirqs.CPU57.TIMER
     22529 =C2=B1  7%      +0.8%      22717 =C2=B1 10%  softirqs.CPU58.RCU
      5060            -1.5%       4985 =C2=B1 10%  softirqs.CPU58.SCHED
    109.54 =C2=B1 19%     +22.7%     134.40 =C2=B1 29%  softirqs.CPU58.TIMER
     22334 =C2=B1  7%      +2.0%      22780 =C2=B1 10%  softirqs.CPU59.RCU
      5054            -1.6%       4972 =C2=B1  9%  softirqs.CPU59.SCHED
    117.62 =C2=B1 16%     +29.9%     152.80 =C2=B1 62%  softirqs.CPU59.TIMER
      1.00           +20.0%       1.20 =C2=B1 33%  softirqs.CPU6.HI
     23446 =C2=B1  7%      +1.4%      23777 =C2=B1 12%  softirqs.CPU6.RCU
      4971 =C2=B1  7%      -0.1%       4967 =C2=B1  8%  softirqs.CPU6.SCHED
     36.08            +0.3%      36.20        softirqs.CPU6.TASKLET
    171.31 =C2=B1 74%      +0.6%     172.30 =C2=B1 65%  softirqs.CPU6.TIMER
     22760 =C2=B1  7%      +0.7%      22914 =C2=B1 11%  softirqs.CPU60.RCU
      5051            -2.0%       4949 =C2=B1  9%  softirqs.CPU60.SCHED
      0.00       +1.6e+102%       1.60 =C2=B1300%  softirqs.CPU60.TASKLET
    135.08 =C2=B1 58%      -3.3%     130.60 =C2=B1 17%  softirqs.CPU60.TIMER
     22756 =C2=B1  7%      +1.3%      23046 =C2=B1 11%  softirqs.CPU61.RCU
      5059            -2.9%       4912 =C2=B1 18%  softirqs.CPU61.SCHED
      1.38 =C2=B1346%    -100.0%       0.00        softirqs.CPU61.TASKLET
    123.15 =C2=B1 41%     +42.3%     175.20 =C2=B1 93%  softirqs.CPU61.TIMER
     22421 =C2=B1  7%      +1.4%      22729 =C2=B1 11%  softirqs.CPU62.RCU
      5045            -1.5%       4970 =C2=B1 10%  softirqs.CPU62.SCHED
      0.15 =C2=B1346%     -35.0%       0.10 =C2=B1300%  softirqs.CPU62.TASK=
LET
    130.85 =C2=B1 67%     +13.1%     148.00 =C2=B1 60%  softirqs.CPU62.TIMER
     22251 =C2=B1  7%      +0.8%      22421 =C2=B1 11%  softirqs.CPU63.RCU
      4945 =C2=B1  7%      +0.2%       4955 =C2=B1  9%  softirqs.CPU63.SCHED
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU63.TASKLET
     98.62 =C2=B1 19%     +29.5%     127.70 =C2=B1 17%  softirqs.CPU63.TIMER
     24017 =C2=B1  8%      -0.1%      23998 =C2=B1 11%  softirqs.CPU64.RCU
      5085 =C2=B1  2%      -2.4%       4965 =C2=B1  9%  softirqs.CPU64.SCHED
    168.46 =C2=B1 53%     -20.8%     133.40 =C2=B1 17%  softirqs.CPU64.TIMER
     23942 =C2=B1  8%      +0.5%      24056 =C2=B1 12%  softirqs.CPU65.RCU
      5162 =C2=B1  6%      -4.3%       4940 =C2=B1  9%  softirqs.CPU65.SCHED
    234.15 =C2=B1144%     -45.2%     128.20 =C2=B1 14%  softirqs.CPU65.TIMER
     23725 =C2=B1  8%      +0.5%      23852 =C2=B1 11%  softirqs.CPU66.RCU
      5154 =C2=B1  6%      -1.8%       5060 =C2=B1 11%  softirqs.CPU66.SCHED
    216.23 =C2=B1140%     -35.1%     140.40 =C2=B1 25%  softirqs.CPU66.TIMER
     23870 =C2=B1  7%      -0.4%      23783 =C2=B1 12%  softirqs.CPU67.RCU
      5058            -2.1%       4951 =C2=B1  9%  softirqs.CPU67.SCHED
    140.31 =C2=B1 47%      +3.2%     144.80 =C2=B1 44%  softirqs.CPU67.TIMER
     23763 =C2=B1  8%      +0.2%      23809 =C2=B1 12%  softirqs.CPU68.RCU
      5101            -3.0%       4950 =C2=B1  9%  softirqs.CPU68.SCHED
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU68.TASKLET
    135.46 =C2=B1 28%      -4.0%     130.10 =C2=B1 21%  softirqs.CPU68.TIMER
     23832 =C2=B1  8%      -0.0%      23828 =C2=B1 11%  softirqs.CPU69.RCU
      5048            -1.6%       4966 =C2=B1  9%  softirqs.CPU69.SCHED
    227.31 =C2=B1 75%     -34.3%     149.30 =C2=B1 43%  softirqs.CPU69.TIMER
     23287 =C2=B1  8%      -0.6%      23155 =C2=B1 11%  softirqs.CPU7.RCU
      5064            -4.3%       4848 =C2=B1 17%  softirqs.CPU7.SCHED
      0.00         +3e+101%       0.30 =C2=B1300%  softirqs.CPU7.TASKLET
    119.23 =C2=B1 13%     +16.5%     138.90 =C2=B1 26%  softirqs.CPU7.TIMER
     23880 =C2=B1  7%      +1.2%      24162 =C2=B1 11%  softirqs.CPU70.RCU
      5070            -2.2%       4957 =C2=B1  9%  softirqs.CPU70.SCHED
    133.92 =C2=B1 28%     +10.3%     147.70 =C2=B1 31%  softirqs.CPU70.TIMER
     23784 =C2=B1  7%      +0.6%      23928 =C2=B1 12%  softirqs.CPU71.RCU
      5071 =C2=B1  2%      -1.9%       4972 =C2=B1 10%  softirqs.CPU71.SCHED
    125.77 =C2=B1 18%    +259.3%     451.90 =C2=B1176%  softirqs.CPU71.TIMER
     22336 =C2=B1 10%      -2.7%      21744 =C2=B1 11%  softirqs.CPU72.RCU
      5120            -3.4%       4948 =C2=B1  9%  softirqs.CPU72.SCHED
      2.08 =C2=B1 12%      -3.7%       2.00        softirqs.CPU72.TASKLET
    382.69 =C2=B1 93%     -27.6%     277.00 =C2=B1  8%  softirqs.CPU72.TIMER
     22813 =C2=B1  7%      -0.6%      22680 =C2=B1 11%  softirqs.CPU73.RCU
      5068 =C2=B1  2%      -1.9%       4974 =C2=B1  8%  softirqs.CPU73.SCHED
      2.00            +0.0%       2.00        softirqs.CPU73.TASKLET
    400.00 =C2=B1 40%     -14.3%     342.90 =C2=B1 41%  softirqs.CPU73.TIMER
     22239 =C2=B1  6%      -0.3%      22183 =C2=B1 11%  softirqs.CPU74.RCU
      5077            -5.5%       4795 =C2=B1 11%  softirqs.CPU74.SCHED
      2.00            +0.0%       2.00        softirqs.CPU74.TASKLET
    279.85 =C2=B1 50%      -4.4%     267.50 =C2=B1 47%  softirqs.CPU74.TIMER
     21988 =C2=B1  7%      -0.4%      21907 =C2=B1 12%  softirqs.CPU75.RCU
      5038            -2.2%       4926 =C2=B1  9%  softirqs.CPU75.SCHED
      2.00            +5.0%       2.10 =C2=B1 14%  softirqs.CPU75.TASKLET
    138.00 =C2=B1 54%      -8.7%     126.00 =C2=B1 26%  softirqs.CPU75.TIMER
     22046 =C2=B1  7%      +2.0%      22481 =C2=B1 13%  softirqs.CPU76.RCU
      5070            -2.9%       4924 =C2=B1  9%  softirqs.CPU76.SCHED
      2.00            +0.0%       2.00        softirqs.CPU76.TASKLET
    157.00 =C2=B1 56%     +70.9%     268.30 =C2=B1150%  softirqs.CPU76.TIMER
     22022 =C2=B1  7%      -0.5%      21919 =C2=B1 11%  softirqs.CPU77.RCU
      5157 =C2=B1  6%      -4.8%       4908 =C2=B1  9%  softirqs.CPU77.SCHED
      1.92 =C2=B1 13%      +4.0%       2.00        softirqs.CPU77.TASKLET
    297.92 =C2=B1221%     -60.7%     117.10 =C2=B1 24%  softirqs.CPU77.TIMER
     22033 =C2=B1  8%      -0.0%      22026 =C2=B1 11%  softirqs.CPU78.RCU
      5007 =C2=B1  7%      -1.2%       4948 =C2=B1  9%  softirqs.CPU78.SCHED
      2.00            +0.0%       2.00        softirqs.CPU78.TASKLET
    121.69 =C2=B1125%     +20.1%     146.10 =C2=B1 88%  softirqs.CPU78.TIMER
     21808 =C2=B1  7%      -1.0%      21591 =C2=B1 13%  softirqs.CPU79.RCU
      5045            -1.5%       4967 =C2=B1 11%  softirqs.CPU79.SCHED
      1.92 =C2=B1 13%      +4.0%       2.00        softirqs.CPU79.TASKLET
    179.38 =C2=B1 62%     +19.2%     213.80 =C2=B1114%  softirqs.CPU79.TIMER
     23335 =C2=B1  8%      +0.1%      23349 =C2=B1 12%  softirqs.CPU8.RCU
      5169 =C2=B1  7%      -7.2%       4800 =C2=B1 13%  softirqs.CPU8.SCHED
      1.23 =C2=B1323%     -91.9%       0.10 =C2=B1300%  softirqs.CPU8.TASKL=
ET
    342.46 =C2=B1196%     -59.2%     139.70 =C2=B1 12%  softirqs.CPU8.TIMER
     22207 =C2=B1  8%      +0.2%      22253 =C2=B1 11%  softirqs.CPU80.RCU
      5043            -2.4%       4925 =C2=B1 10%  softirqs.CPU80.SCHED
    146.15 =C2=B1 64%     +13.0%     165.10 =C2=B1 67%  softirqs.CPU80.TIMER
     22287 =C2=B1  7%      +0.3%      22354 =C2=B1 11%  softirqs.CPU81.RCU
      5101 =C2=B1  4%      -1.1%       5045 =C2=B1 12%  softirqs.CPU81.SCHED
    221.62 =C2=B1159%     +10.2%     244.20 =C2=B1117%  softirqs.CPU81.TIMER
      0.08 =C2=B1346%    -100.0%       0.00        softirqs.CPU82.NET_TX
     22282 =C2=B1  7%      +0.2%      22328 =C2=B1 11%  softirqs.CPU82.RCU
      5062            -2.9%       4917 =C2=B1  9%  softirqs.CPU82.SCHED
    160.38 =C2=B1 68%     -17.8%     131.90 =C2=B1 35%  softirqs.CPU82.TIMER
     22522 =C2=B1  7%      +0.3%      22594 =C2=B1 11%  softirqs.CPU83.RCU
      5060            -3.8%       4868 =C2=B1 17%  softirqs.CPU83.SCHED
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU83.TASKLET
    125.77 =C2=B1 29%    +157.7%     324.10 =C2=B1 89%  softirqs.CPU83.TIMER
     22317 =C2=B1  7%      +1.0%      22541 =C2=B1 11%  softirqs.CPU84.RCU
      5040            -1.7%       4954 =C2=B1  9%  softirqs.CPU84.SCHED
    114.77 =C2=B1 14%     +14.8%     131.80 =C2=B1 35%  softirqs.CPU84.TIMER
     22096 =C2=B1  7%      -0.2%      22059 =C2=B1 11%  softirqs.CPU85.RCU
      5066 =C2=B1  3%      -3.3%       4901 =C2=B1  9%  softirqs.CPU85.SCHED
      0.00         +5e+101%       0.50 =C2=B1300%  softirqs.CPU85.TASKLET
    158.38 =C2=B1108%     -17.7%     130.30 =C2=B1 29%  softirqs.CPU85.TIMER
     21981 =C2=B1  7%      +1.5%      22320 =C2=B1 11%  softirqs.CPU86.RCU
      5037            -1.8%       4944 =C2=B1  9%  softirqs.CPU86.SCHED
    127.23 =C2=B1 22%     +16.2%     147.80 =C2=B1 44%  softirqs.CPU86.TIMER
     22117 =C2=B1  7%      +1.3%      22398 =C2=B1 11%  softirqs.CPU87.RCU
      5010            -1.4%       4939 =C2=B1  9%  softirqs.CPU87.SCHED
      0.00         +7e+101%       0.70 =C2=B1300%  softirqs.CPU87.TASKLET
    111.38 =C2=B1 12%     +24.4%     138.60 =C2=B1 38%  softirqs.CPU87.TIMER
     22402 =C2=B1  7%      -0.5%      22295 =C2=B1 11%  softirqs.CPU88.RCU
      5044            -2.1%       4937 =C2=B1  9%  softirqs.CPU88.SCHED
    114.54 =C2=B1 11%     +30.5%     149.50 =C2=B1 44%  softirqs.CPU88.TIMER
     22417 =C2=B1  7%      +0.5%      22529 =C2=B1 11%  softirqs.CPU89.RCU
      5044 =C2=B1  2%      -2.5%       4917 =C2=B1  9%  softirqs.CPU89.SCHED
      0.00         +1e+102%       1.00 =C2=B1300%  softirqs.CPU89.TASKLET
    160.62 =C2=B1 72%     -16.8%     133.60 =C2=B1 18%  softirqs.CPU89.TIMER
     29.46 =C2=B1  2%      -0.2%      29.40        softirqs.CPU9.NET_TX
     23930 =C2=B1 10%      -0.9%      23714 =C2=B1 11%  softirqs.CPU9.RCU
      4953 =C2=B1  7%      +0.6%       4985 =C2=B1  9%  softirqs.CPU9.SCHED
      0.46 =C2=B1289%     -78.3%       0.10 =C2=B1300%  softirqs.CPU9.TASKL=
ET
    349.23 =C2=B1101%      -0.7%     346.80 =C2=B1 52%  softirqs.CPU9.TIMER
     22510 =C2=B1  7%      +0.7%      22664 =C2=B1 11%  softirqs.CPU90.RCU
      5042            -2.2%       4931 =C2=B1  9%  softirqs.CPU90.SCHED
    122.08 =C2=B1 16%      -0.7%     121.20 =C2=B1 23%  softirqs.CPU90.TIMER
     22486 =C2=B1  7%      -0.7%      22331 =C2=B1 11%  softirqs.CPU91.RCU
      5015            -2.2%       4905 =C2=B1  9%  softirqs.CPU91.SCHED
      0.08 =C2=B1346%     +30.0%       0.10 =C2=B1300%  softirqs.CPU91.TASK=
LET
     95.38 =C2=B1 15%      -3.9%      91.70 =C2=B1 19%  softirqs.CPU91.TIMER
     22030 =C2=B1 10%      +1.3%      22314 =C2=B1 11%  softirqs.CPU92.RCU
      5160 =C2=B1  7%      -4.3%       4940 =C2=B1  9%  softirqs.CPU92.SCHED
    306.46 =C2=B1227%     -57.4%     130.60 =C2=B1 22%  softirqs.CPU92.TIMER
     22235 =C2=B1  7%      +0.4%      22323 =C2=B1 11%  softirqs.CPU93.RCU
      5053            -2.8%       4910 =C2=B1  9%  softirqs.CPU93.SCHED
      0.00         +1e+101%       0.10 =C2=B1300%  softirqs.CPU93.TASKLET
    112.38 =C2=B1 10%     +18.4%     133.10 =C2=B1 20%  softirqs.CPU93.TIMER
     22510 =C2=B1  7%      +0.1%      22525 =C2=B1 11%  softirqs.CPU94.RCU
      5053            -1.5%       4975 =C2=B1 10%  softirqs.CPU94.SCHED
    115.15 =C2=B1 29%     +88.9%     217.50 =C2=B1137%  softirqs.CPU94.TIMER
     22596 =C2=B1  9%      +2.3%      23107 =C2=B1 12%  softirqs.CPU95.RCU
      5083            -2.2%       4972 =C2=B1 12%  softirqs.CPU95.SCHED
    150.92 =C2=B1 23%    +152.6%     381.20 =C2=B1115%  softirqs.CPU95.TIMER
    160.62 =C2=B1 79%     -67.5%      52.20 =C2=B1200%  softirqs.CPU96.BLOCK
     29625 =C2=B1  7%      -2.1%      28994 =C2=B1  9%  softirqs.CPU96.RCU
      5075 =C2=B1  7%      -4.5%       4847 =C2=B1  9%  softirqs.CPU96.SCHED
      0.23 =C2=B1249%    +246.7%       0.80 =C2=B1122%  softirqs.CPU96.TASK=
LET
      1026 =C2=B1 72%     -29.2%     727.30 =C2=B1 28%  softirqs.CPU96.TIMER
     60.23 =C2=B1182%     -13.3%      52.20 =C2=B1200%  softirqs.CPU97.BLOCK
     26462 =C2=B1 10%      +2.3%      27071 =C2=B1 11%  softirqs.CPU97.RCU
      5062 =C2=B1  6%      -0.4%       5041 =C2=B1  8%  softirqs.CPU97.SCHED
      0.00       +1.6e+102%       1.60 =C2=B1261%  softirqs.CPU97.TASKLET
    527.15 =C2=B1 32%      -9.1%     479.40 =C2=B1 23%  softirqs.CPU97.TIMER
     24507 =C2=B1  8%      -4.2%      23472 =C2=B1 20%  softirqs.CPU98.RCU
      5094            -1.9%       5000 =C2=B1  9%  softirqs.CPU98.SCHED
    276.54 =C2=B1 34%      -5.9%     260.30 =C2=B1 36%  softirqs.CPU98.TIMER
     23691 =C2=B1  8%      +0.1%      23708 =C2=B1 11%  softirqs.CPU99.RCU
      5113            -2.5%       4987 =C2=B1  8%  softirqs.CPU99.SCHED
    171.08 =C2=B1 27%      -7.9%     157.50 =C2=B1 15%  softirqs.CPU99.TIMER
      2.00           +10.0%       2.20 =C2=B1 18%  softirqs.HI
     12055 =C2=B1 31%      +3.4%      12463 =C2=B1 71%  softirqs.NET_RX
     37.46 =C2=B1  3%      -1.2%      37.00        softirqs.NET_TX
   4503286 =C2=B1  7%      +0.5%    4523562 =C2=B1 11%  softirqs.RCU
    981291            -2.3%     958616 =C2=B1  9%  softirqs.SCHED
    226.85            +0.2%     227.20        softirqs.TASKLET
     41913 =C2=B1  4%      +2.3%      42895 =C2=B1  8%  softirqs.TIMER
      0.00          -100.0%       0.00        interrupts.0:IO-APIC.2-edge.t=
imer
      0.00          -100.0%       0.00        interrupts.100:PCI-MSI.235929=
94-edge.nvme0q34
      0.00          -100.0%       0.00        interrupts.100:PCI-MSI.235929=
98-edge.nvme0q38
      0.00          -100.0%       0.00        interrupts.100:PCI-MSI.235930=
07-edge.nvme0q47
      0.00          -100.0%       0.00        interrupts.100:PCI-MSI.235930=
08-edge.nvme0q48
      0.00          -100.0%       0.00        interrupts.101:PCI-MSI.235930=
14-edge.nvme0q54
      0.00          -100.0%       0.00        interrupts.102:PCI-MSI.235929=
96-edge.nvme0q36
      0.00          -100.0%       0.00        interrupts.105:PCI-MSI.235929=
99-edge.nvme0q39
      0.00          -100.0%       0.00        interrupts.105:PCI-MSI.235930=
05-edge.nvme0q45
      0.00          -100.0%       0.00        interrupts.105:PCI-MSI.235930=
19-edge.nvme0q59
      0.00          -100.0%       0.00        interrupts.106:PCI-MSI.235930=
11-edge.nvme0q51
      0.00          -100.0%       0.00        interrupts.106:PCI-MSI.235930=
20-edge.nvme0q60
      0.00          -100.0%       0.00        interrupts.107:PCI-MSI.235929=
88-edge.nvme0q28
      0.00          -100.0%       0.00        interrupts.107:PCI-MSI.235930=
05-edge.nvme0q45
      0.00          -100.0%       0.00        interrupts.107:PCI-MSI.235930=
07-edge.nvme0q47
      0.00          -100.0%       0.00        interrupts.107:PCI-MSI.235930=
21-edge.nvme0q61
      0.00          -100.0%       0.00        interrupts.108:PCI-MSI.235929=
89-edge.nvme0q29
      0.00          -100.0%       0.00        interrupts.109:PCI-MSI.235929=
90-edge.nvme0q30
      0.00          -100.0%       0.00        interrupts.109:PCI-MSI.235930=
22-edge.nvme0q62
      0.00          -100.0%       0.00        interrupts.109:PCI-MSI.235930=
23-edge.nvme0q63
      0.00          -100.0%       0.00        interrupts.110:PCI-MSI.235929=
91-edge.nvme0q31
      0.00          -100.0%       0.00        interrupts.111:PCI-MSI.235930=
05-edge.nvme0q45
      0.00          -100.0%       0.00        interrupts.112:PCI-MSI.235930=
29-edge.nvme0q69
      0.00          -100.0%       0.00        interrupts.113:PCI-MSI.235930=
13-edge.nvme0q53
      0.00          -100.0%       0.00        interrupts.113:PCI-MSI.235930=
26-edge.nvme0q66
      0.00          -100.0%       0.00        interrupts.114:PCI-MSI.235930=
08-edge.nvme0q48
      0.00          -100.0%       0.00        interrupts.115:PCI-MSI.235930=
00-edge.nvme0q40
      0.00          -100.0%       0.00        interrupts.116:PCI-MSI.235929=
97-edge.nvme0q37
      0.00          -100.0%       0.00        interrupts.116:PCI-MSI.235930=
21-edge.nvme0q61
      0.00          -100.0%       0.00        interrupts.116:PCI-MSI.235930=
23-edge.nvme0q63
      0.00          -100.0%       0.00        interrupts.117:PCI-MSI.235930=
24-edge.nvme0q64
      0.00          -100.0%       0.00        interrupts.118:PCI-MSI.235930=
25-edge.nvme0q65
      0.00          -100.0%       0.00        interrupts.118:PCI-MSI.235930=
31-edge.nvme0q71
      0.00          -100.0%       0.00        interrupts.119:PCI-MSI.235930=
00-edge.nvme0q40
      0.00          -100.0%       0.00        interrupts.119:PCI-MSI.235930=
26-edge.nvme0q66
      0.00          -100.0%       0.00        interrupts.120:PCI-MSI.235930=
01-edge.nvme0q41
      0.00          -100.0%       0.00        interrupts.120:PCI-MSI.235930=
27-edge.nvme0q67
      0.00          -100.0%       0.00        interrupts.121:PCI-MSI.235930=
02-edge.nvme0q42
      0.00          -100.0%       0.00        interrupts.121:PCI-MSI.235930=
25-edge.nvme0q65
      0.00          -100.0%       0.00        interrupts.122:PCI-MSI.235930=
03-edge.nvme0q43
      0.00          -100.0%       0.00        interrupts.122:PCI-MSI.235930=
16-edge.nvme0q56
      0.00          -100.0%       0.00        interrupts.122:PCI-MSI.235930=
26-edge.nvme0q66
      0.00          -100.0%       0.00        interrupts.122:PCI-MSI.235930=
29-edge.nvme0q69
      0.00          -100.0%       0.00        interrupts.122:PCI-MSI.235930=
30-edge.nvme0q70
      0.00          -100.0%       0.00        interrupts.122:PCI-MSI.235930=
35-edge.nvme0q75
      0.00          -100.0%       0.00        interrupts.123:PCI-MSI.235930=
31-edge.nvme0q71
      0.00          -100.0%       0.00        interrupts.124:PCI-MSI.235930=
28-edge.nvme0q68
      0.00          -100.0%       0.00        interrupts.124:PCI-MSI.235930=
29-edge.nvme0q69
      0.00          -100.0%       0.00        interrupts.124:PCI-MSI.235930=
31-edge.nvme0q71
      0.00          -100.0%       0.00        interrupts.124:PCI-MSI.235930=
37-edge.nvme0q77
      0.00          -100.0%       0.00        interrupts.125:PCI-MSI.235930=
33-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.126:PCI-MSI.235930=
20-edge.nvme0q60
      0.00          -100.0%       0.00        interrupts.126:PCI-MSI.235930=
33-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.127:PCI-MSI.235930=
08-edge.nvme0q48
      0.00          -100.0%       0.00        interrupts.127:PCI-MSI.235930=
34-edge.nvme0q74
      0.00          -100.0%       0.00        interrupts.127:PCI-MSI.235930=
35-edge.nvme0q75
      0.00          -100.0%       0.00        interrupts.130:PCI-MSI.235930=
15-edge.nvme0q55
      0.00          -100.0%       0.00        interrupts.130:PCI-MSI.235930=
34-edge.nvme0q74
      0.00          -100.0%       0.00        interrupts.131:PCI-MSI.235930=
38-edge.nvme0q78
      0.00          -100.0%       0.00        interrupts.132:PCI-MSI.235930=
17-edge.nvme0q57
      0.00          -100.0%       0.00        interrupts.132:PCI-MSI.235930=
36-edge.nvme0q76
      0.00          -100.0%       0.00        interrupts.133:PCI-MSI.235930=
14-edge.nvme0q54
      0.00          -100.0%       0.00        interrupts.133:PCI-MSI.235930=
33-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.135:PCI-MSI.235930=
33-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.136:PCI-MSI.235930=
40-edge.nvme0q80
      0.00          -100.0%       0.00        interrupts.137:PCI-MSI.235930=
50-edge.nvme0q90
      0.00          -100.0%       0.00        interrupts.138:PCI-MSI.235930=
19-edge.nvme0q59
      0.00          -100.0%       0.00        interrupts.138:PCI-MSI.235930=
36-edge.nvme0q76
      0.00          -100.0%       0.00        interrupts.138:PCI-MSI.235930=
46-edge.nvme0q86
      0.00          -100.0%       0.00        interrupts.139:PCI-MSI.235930=
47-edge.nvme0q87
      0.00          -100.0%       0.00        interrupts.140:PCI-MSI.235930=
57-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.141:PCI-MSI.235930=
26-edge.nvme0q66
      0.00          -100.0%       0.00        interrupts.141:PCI-MSI.235930=
35-edge.nvme0q75
      0.00          -100.0%       0.00        interrupts.141:PCI-MSI.235930=
48-edge.nvme0q88
      0.00          -100.0%       0.00        interrupts.141:PCI-MSI.235930=
58-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.142:PCI-MSI.235930=
27-edge.nvme0q67
      0.00          -100.0%       0.00        interrupts.142:PCI-MSI.235930=
36-edge.nvme0q76
      0.00          -100.0%       0.00        interrupts.142:PCI-MSI.235930=
40-edge.nvme0q80
      0.00          -100.0%       0.00        interrupts.142:PCI-MSI.235930=
49-edge.nvme0q89
      0.00          -100.0%       0.00        interrupts.142:PCI-MSI.235930=
55-edge.nvme0q95
      0.00          -100.0%       0.00        interrupts.143:PCI-MSI.235930=
51-edge.nvme0q91
      0.00          -100.0%       0.00        interrupts.143:PCI-MSI.235930=
56-edge.nvme0q96
      0.00          -100.0%       0.00        interrupts.143:PCI-MSI.235930=
60-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.144:PCI-MSI.235930=
29-edge.nvme0q69
      0.00          -100.0%       0.00        interrupts.144:PCI-MSI.235930=
52-edge.nvme0q92
      0.00          -100.0%       0.00        interrupts.144:PCI-MSI.235930=
61-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.145:PCI-MSI.235930=
30-edge.nvme0q70
      0.00          -100.0%       0.00        interrupts.145:PCI-MSI.235930=
49-edge.nvme0q89
      0.00          -100.0%       0.00        interrupts.145:PCI-MSI.235930=
58-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.146:PCI-MSI.235930=
31-edge.nvme0q71
      0.00          -100.0%       0.00        interrupts.146:PCI-MSI.235930=
53-edge.nvme0q93
      0.00          -100.0%       0.00        interrupts.146:PCI-MSI.235930=
54-edge.nvme0q94
      0.00          -100.0%       0.00        interrupts.146:PCI-MSI.235930=
57-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.146:PCI-MSI.235930=
59-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.146:PCI-MSI.235930=
63-edge.nvme0q103
      0.00          -100.0%       0.00        interrupts.147:PCI-MSI.235930=
28-edge.nvme0q68
      0.00          -100.0%       0.00        interrupts.147:PCI-MSI.235930=
45-edge.nvme0q85
      0.00          -100.0%       0.00        interrupts.147:PCI-MSI.235930=
55-edge.nvme0q95
      0.00          -100.0%       0.00        interrupts.147:PCI-MSI.235930=
60-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.147:PCI-MSI.235930=
61-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.148:PCI-MSI.235930=
33-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.148:PCI-MSI.235930=
42-edge.nvme0q82
      0.00          -100.0%       0.00        interrupts.148:PCI-MSI.235930=
46-edge.nvme0q86
      0.00          -100.0%       0.00        interrupts.148:PCI-MSI.235930=
56-edge.nvme0q96
      0.00          -100.0%       0.00        interrupts.148:PCI-MSI.235930=
61-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.149:PCI-MSI.235930=
34-edge.nvme0q74
      0.00          -100.0%       0.00        interrupts.149:PCI-MSI.235930=
56-edge.nvme0q96
      0.00          -100.0%       0.00        interrupts.149:PCI-MSI.235930=
57-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.150:PCI-MSI.235930=
57-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.150:PCI-MSI.235930=
58-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.151:PCI-MSI.235930=
62-edge.nvme0q102
      0.00          -100.0%       0.00        interrupts.152:PCI-MSI.235930=
59-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.152:PCI-MSI.235930=
60-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.152:PCI-MSI.235930=
63-edge.nvme0q103
      0.00          -100.0%       0.00        interrupts.153:PCI-MSI.235930=
38-edge.nvme0q78
      0.00          -100.0%       0.00        interrupts.153:PCI-MSI.235930=
58-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.153:PCI-MSI.235930=
60-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.153:PCI-MSI.235930=
61-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.153:PCI-MSI.235930=
64-edge.nvme0q104
      0.00          -100.0%       0.00        interrupts.153:PCI-MSI.235930=
66-edge.nvme0q106
      0.00          -100.0%       0.00        interrupts.154:PCI-MSI.235930=
39-edge.nvme0q79
      0.00          -100.0%       0.00        interrupts.154:PCI-MSI.235930=
48-edge.nvme0q88
      0.00          -100.0%       0.00        interrupts.154:PCI-MSI.235930=
62-edge.nvme0q102
      0.00          -100.0%       0.00        interrupts.154:PCI-MSI.235930=
68-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.155:PCI-MSI.235930=
40-edge.nvme0q80
      0.00          -100.0%       0.00        interrupts.155:PCI-MSI.235930=
60-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.156:PCI-MSI.235930=
58-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.156:PCI-MSI.235930=
61-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.156:PCI-MSI.235930=
64-edge.nvme0q104
      0.00          -100.0%       0.00        interrupts.156:PCI-MSI.235930=
67-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.157:PCI-MSI.235930=
59-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.157:PCI-MSI.235930=
62-edge.nvme0q102
      0.00          -100.0%       0.00        interrupts.157:PCI-MSI.235930=
70-edge.nvme0q110
      0.00          -100.0%       0.00        interrupts.158:PCI-MSI.235930=
63-edge.nvme0q103
      0.00          -100.0%       0.00        interrupts.158:PCI-MSI.235930=
71-edge.nvme0q111
      0.00          -100.0%       0.00        interrupts.159:PCI-MSI.235930=
57-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.159:PCI-MSI.235930=
59-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.159:PCI-MSI.235930=
64-edge.nvme0q104
      0.00          -100.0%       0.00        interrupts.159:PCI-MSI.235930=
72-edge.nvme0q112
      0.00          -100.0%       0.00        interrupts.160:PCI-MSI.235930=
65-edge.nvme0q105
      0.00          -100.0%       0.00        interrupts.160:PCI-MSI.235930=
67-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.160:PCI-MSI.235930=
68-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.160:PCI-MSI.235930=
71-edge.nvme0q111
      0.00          -100.0%       0.00        interrupts.160:PCI-MSI.235930=
77-edge.nvme0q117
      0.00          -100.0%       0.00        interrupts.161:PCI-MSI.235930=
55-edge.nvme0q95
      0.00          -100.0%       0.00        interrupts.161:PCI-MSI.235930=
59-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.161:PCI-MSI.235930=
68-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.161:PCI-MSI.235930=
72-edge.nvme0q112
      0.00          -100.0%       0.00        interrupts.161:PCI-MSI.235930=
74-edge.nvme0q114
      0.00          -100.0%       0.00        interrupts.162:PCI-MSI.235930=
70-edge.nvme0q110
      0.00          -100.0%       0.00        interrupts.162:PCI-MSI.235930=
75-edge.nvme0q115
      0.00          -100.0%       0.00        interrupts.163:PCI-MSI.235930=
57-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.163:PCI-MSI.235930=
70-edge.nvme0q110
      0.00          -100.0%       0.00        interrupts.163:PCI-MSI.235930=
76-edge.nvme0q116
      0.00          -100.0%       0.00        interrupts.164:PCI-MSI.235930=
58-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.164:PCI-MSI.235930=
68-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.164:PCI-MSI.235930=
69-edge.nvme0q109
      0.00          -100.0%       0.00        interrupts.164:PCI-MSI.235930=
71-edge.nvme0q111
      0.00          -100.0%       0.00        interrupts.164:PCI-MSI.235930=
75-edge.nvme0q115
      0.00          -100.0%       0.00        interrupts.164:PCI-MSI.235930=
78-edge.nvme0q118
      0.00          -100.0%       0.00        interrupts.165:PCI-MSI.235930=
50-edge.nvme0q90
      0.00          -100.0%       0.00        interrupts.165:PCI-MSI.235930=
59-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.165:PCI-MSI.235930=
73-edge.nvme0q113
      0.00          -100.0%       0.00        interrupts.165:PCI-MSI.235930=
82-edge.nvme0q122
      0.00          -100.0%       0.00        interrupts.166:PCI-MSI.235930=
60-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.166:PCI-MSI.235930=
77-edge.nvme0q117
      0.00          -100.0%       0.00        interrupts.166:PCI-MSI.235930=
83-edge.nvme0q123
      0.00          -100.0%       0.00        interrupts.167:PCI-MSI.235930=
61-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.167:PCI-MSI.235930=
69-edge.nvme0q109
      0.00          -100.0%       0.00        interrupts.167:PCI-MSI.235930=
80-edge.nvme0q120
      0.00          -100.0%       0.00        interrupts.168:PCI-MSI.235930=
79-edge.nvme0q119
      0.00          -100.0%       0.00        interrupts.168:PCI-MSI.235930=
85-edge.nvme0q125
      0.00          -100.0%       0.00        interrupts.169:PCI-MSI.235930=
67-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.169:PCI-MSI.235930=
76-edge.nvme0q116
      0.00          -100.0%       0.00        interrupts.169:PCI-MSI.235930=
83-edge.nvme0q123
      0.00          -100.0%       0.00        interrupts.169:PCI-MSI.235930=
86-edge.nvme0q126
      0.00          -100.0%       0.00        interrupts.170:PCI-MSI.235930=
81-edge.nvme0q121
      0.00          -100.0%       0.00        interrupts.171:PCI-MSI.235930=
65-edge.nvme0q105
      0.00          -100.0%       0.00        interrupts.171:PCI-MSI.235930=
79-edge.nvme0q119
      0.00          -100.0%       0.00        interrupts.171:PCI-MSI.235930=
84-edge.nvme0q124
      0.00          -100.0%       0.00        interrupts.172:PCI-MSI.235930=
57-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.172:PCI-MSI.235930=
66-edge.nvme0q106
      0.00          -100.0%       0.00        interrupts.172:PCI-MSI.235930=
83-edge.nvme0q123
      0.00          -100.0%       0.00        interrupts.172:PCI-MSI.71680-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.172:PCI-MSI.73728-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.173:PCI-MSI.235930=
58-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.173:PCI-MSI.235930=
67-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.173:PCI-MSI.235930=
84-edge.nvme0q124
      0.00          -100.0%       0.00        interrupts.173:PCI-MSI.73728-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.174:PCI-MSI.235930=
59-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.174:PCI-MSI.235930=
87-edge.nvme0q127
      0.00          -100.0%       0.00        interrupts.174:PCI-MSI.75776-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.175:PCI-MSI.235930=
60-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.175:PCI-MSI.235930=
73-edge.nvme0q113
      0.00          -100.0%       0.00        interrupts.175:PCI-MSI.235930=
80-edge.nvme0q120
      0.00          -100.0%       0.00        interrupts.175:PCI-MSI.235930=
83-edge.nvme0q123
      0.00          -100.0%       0.00        interrupts.175:PCI-MSI.235930=
86-edge.nvme0q126
      0.00          -100.0%       0.00        interrupts.175:PCI-MSI.75776-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.175:PCI-MSI.77824-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.176:PCI-MSI.235930=
61-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.176:PCI-MSI.77824-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.176:PCI-MSI.79872-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.177:PCI-MSI.235930=
88-edge.nvme0q128
      0.00          -100.0%       0.00        interrupts.177:PCI-MSI.79872-=
edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.178:PCI-MSI.336199=
68-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.179:PCI-MSI.235930=
77-edge.nvme0q117
      0.00          -100.0%       0.00        interrupts.179:PCI-MSI.235930=
84-edge.nvme0q124
      0.00          -100.0%       0.00        interrupts.179:PCI-MSI.336199=
68-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.180:PCI-MSI.235930=
65-edge.nvme0q105
      0.00          -100.0%       0.00        interrupts.180:PCI-MSI.235930=
87-edge.nvme0q127
      0.00          -100.0%       0.00        interrupts.180:PCI-MSI.336220=
16-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.181:PCI-MSI.235930=
88-edge.nvme0q128
      0.00          -100.0%       0.00        interrupts.181:PCI-MSI.336220=
16-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.181:PCI-MSI.336240=
64-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.182:PCI-MSI.235930=
67-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.182:PCI-MSI.336240=
64-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.182:PCI-MSI.336261=
12-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.182:PCI-MSI.336281=
60-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.183:PCI-MSI.235930=
81-edge.nvme0q121
      0.00          -100.0%       0.00        interrupts.183:PCI-MSI.336261=
12-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.183:PCI-MSI.336281=
60-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.184:PCI-MSI.336281=
60-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.184:PCI-MSI.336302=
08-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.184:PCI-MSI.336322=
56-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.185:PCI-MSI.336302=
08-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.185:PCI-MSI.336322=
56-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.185:PCI-MSI.336343=
04-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.186:PCI-MSI.235930=
80-edge.nvme0q120
      0.00          -100.0%       0.00        interrupts.186:PCI-MSI.336322=
56-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.186:PCI-MSI.336343=
04-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.187:PCI-MSI.235930=
68-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.187:PCI-MSI.336343=
04-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.188:PCI-MSI.235930=
82-edge.nvme0q122
      0.00          -100.0%       0.00        interrupts.188:PCI-MSI.671744=
00-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.189:PCI-MSI.671744=
00-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.190:PCI-MSI.671764=
48-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.191:PCI-MSI.671764=
48-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.191:PCI-MSI.671784=
96-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.192:PCI-MSI.671784=
96-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.192:PCI-MSI.671805=
44-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.193:PCI-MSI.671805=
44-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.193:PCI-MSI.671825=
92-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.193:PCI-MSI.671846=
40-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.194:PCI-MSI.671825=
92-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.194:PCI-MSI.671846=
40-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.195:PCI-MSI.671846=
40-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.195:PCI-MSI.671866=
88-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.196:PCI-MSI.671866=
88-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.196:PCI-MSI.671887=
36-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.197:PCI-MSI.671887=
36-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.198:PCI-MSI.100728=
832-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.198:PCI-MSI.100737=
024-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.199:PCI-MSI.100728=
832-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.200:PCI-MSI.100730=
880-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.201:PCI-MSI.100730=
880-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.201:PCI-MSI.100732=
928-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.202:PCI-MSI.100732=
928-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.202:PCI-MSI.100734=
976-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.203:PCI-MSI.100734=
976-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.203:PCI-MSI.100737=
024-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.203:PCI-MSI.235930=
87-edge.nvme0q127
      0.00          -100.0%       0.00        interrupts.204:PCI-MSI.100737=
024-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.205:PCI-MSI.100739=
072-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.206:PCI-MSI.100741=
120-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.207:PCI-MSI.100743=
168-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.27:PCI-MSI.1782579=
2-edge.PCIe.PME,pciehp
      0.00          -100.0%       0.00        interrupts.29:PCI-MSI.2306867=
2-edge.PCIe.PME,pciehp
      0.00          -100.0%       0.00        interrupts.30:PCI-MSI.524288-=
edge.eth0
      6814 =C2=B1131%      -7.4%       6309 =C2=B1166%  interrupts.31:PCI-M=
SI.524289-edge.eth0-TxRx-0
      8223 =C2=B1123%     -80.6%       1592 =C2=B1 97%  interrupts.32:PCI-M=
SI.524290-edge.eth0-TxRx-1
      3382 =C2=B1164%     +72.1%       5822 =C2=B1181%  interrupts.33:PCI-M=
SI.524291-edge.eth0-TxRx-2
      3492 =C2=B1125%    +166.1%       9295 =C2=B1116%  interrupts.34:PCI-M=
SI.524292-edge.eth0-TxRx-3
      0.00          -100.0%       0.00        interrupts.35:PCI-MSI.327680-=
edge.xhci_hcd
      0.00          -100.0%       0.00        interrupts.37:PCI-MSI.65536-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.39:PCI-MSI.67584-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.40:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.40:PCI-MSI.69632-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.41:PCI-MSI.67584-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.41:PCI-MSI.71680-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.42:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.42:PCI-MSI.69632-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.42:PCI-MSI.73728-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.43:PCI-MSI.69632-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.43:PCI-MSI.71680-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.43:PCI-MSI.73728-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.43:PCI-MSI.75776-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.44:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.44:PCI-MSI.75776-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.44:PCI-MSI.77824-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.45:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.45:PCI-MSI.75776-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.45:PCI-MSI.77824-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.45:PCI-MSI.79872-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.46:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.46:PCI-MSI.2359296=
3-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.46:PCI-MSI.75776-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.46:PCI-MSI.79872-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.47:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.47:PCI-MSI.3361996=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.47:PCI-MSI.77824-e=
dge.ioat-msix
      0.00          -100.0%       0.00        interrupts.48:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.48:PCI-MSI.3361996=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.49:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.49:PCI-MSI.3361996=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.49:PCI-MSI.3362201=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.4:IO-APIC.4-edge.t=
tyS0
      0.00          -100.0%       0.00        interrupts.50:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.50:PCI-MSI.3362201=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.50:PCI-MSI.3362406=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.51:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.51:PCI-MSI.2359296=
4-edge.nvme0q4
      0.00          -100.0%       0.00        interrupts.51:PCI-MSI.2359296=
8-edge.nvme0q8
      0.00          -100.0%       0.00        interrupts.51:PCI-MSI.3361996=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.51:PCI-MSI.3362201=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.51:PCI-MSI.3362406=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.51:PCI-MSI.3362611=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.52:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.52:PCI-MSI.2359296=
3-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.52:PCI-MSI.2359296=
9-edge.nvme0q9
      0.00          -100.0%       0.00        interrupts.52:PCI-MSI.3362201=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.52:PCI-MSI.3362406=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.52:PCI-MSI.3362611=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.52:PCI-MSI.3362816=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.53:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.53:PCI-MSI.2359296=
4-edge.nvme0q4
      0.00          -100.0%       0.00        interrupts.53:PCI-MSI.2359297=
0-edge.nvme0q10
      0.00          -100.0%       0.00        interrupts.53:PCI-MSI.3362406=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.53:PCI-MSI.3362611=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.53:PCI-MSI.3362816=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.53:PCI-MSI.3363020=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.54:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.54:PCI-MSI.2359296=
1-edge.nvme0q1
      0.00          -100.0%       0.00        interrupts.54:PCI-MSI.2359296=
5-edge.nvme0q5
      0.00          -100.0%       0.00        interrupts.54:PCI-MSI.2359297=
1-edge.nvme0q11
      0.00          -100.0%       0.00        interrupts.54:PCI-MSI.3362816=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.54:PCI-MSI.3363020=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.54:PCI-MSI.3363225=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.55:PCI-MSI.2359296=
2-edge.nvme0q2
      0.00          -100.0%       0.00        interrupts.55:PCI-MSI.2359296=
6-edge.nvme0q6
      0.00          -100.0%       0.00        interrupts.55:PCI-MSI.2359297=
2-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.55:PCI-MSI.3362816=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.55:PCI-MSI.3363020=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.55:PCI-MSI.3363225=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.55:PCI-MSI.3363430=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.56:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.56:PCI-MSI.2359297=
3-edge.nvme0q13
      0.00          -100.0%       0.00        interrupts.56:PCI-MSI.3363020=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.56:PCI-MSI.3363225=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.56:PCI-MSI.3363430=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.57:PCI-MSI.2359296=
1-edge.nvme0q1
      0.00          -100.0%       0.00        interrupts.57:PCI-MSI.2359296=
4-edge.nvme0q4
      0.00          -100.0%       0.00        interrupts.57:PCI-MSI.2359297=
4-edge.nvme0q14
      0.00          -100.0%       0.00        interrupts.57:PCI-MSI.3362611=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.57:PCI-MSI.3363225=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.57:PCI-MSI.3363430=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.58:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.58:PCI-MSI.3363430=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.58:PCI-MSI.6717440=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.59:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.59:PCI-MSI.2359296=
3-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.59:PCI-MSI.2359296=
6-edge.nvme0q6
      0.00          -100.0%       0.00        interrupts.59:PCI-MSI.2359297=
2-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.59:PCI-MSI.2359297=
6-edge.nvme0q16
      0.00          -100.0%       0.00        interrupts.59:PCI-MSI.6717440=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.60:PCI-MSI.2359296=
4-edge.nvme0q4
      0.00          -100.0%       0.00        interrupts.60:PCI-MSI.2359296=
7-edge.nvme0q7
      0.00          -100.0%       0.00        interrupts.60:PCI-MSI.2359296=
8-edge.nvme0q8
      0.00          -100.0%       0.00        interrupts.60:PCI-MSI.2359297=
3-edge.nvme0q13
      0.00          -100.0%       0.00        interrupts.60:PCI-MSI.6717440=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.60:PCI-MSI.6717644=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.61:PCI-MSI.2359296=
5-edge.nvme0q5
      0.00          -100.0%       0.00        interrupts.61:PCI-MSI.2359296=
9-edge.nvme0q9
      0.00          -100.0%       0.00        interrupts.61:PCI-MSI.2359297=
2-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.61:PCI-MSI.6717644=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.61:PCI-MSI.6717849=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.62:PCI-MSI.2359297=
0-edge.nvme0q10
      0.00          -100.0%       0.00        interrupts.62:PCI-MSI.6717644=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.62:PCI-MSI.6717849=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.62:PCI-MSI.6718054=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.63:PCI-MSI.2359296=
1-edge.nvme0q1
      0.00          -100.0%       0.00        interrupts.63:PCI-MSI.6718054=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.63:PCI-MSI.6718259=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.64:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.64:PCI-MSI.2359297=
1-edge.nvme0q11
      0.00          -100.0%       0.00        interrupts.64:PCI-MSI.2359298=
1-edge.nvme0q21
      0.00          -100.0%       0.00        interrupts.64:PCI-MSI.6717440=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.64:PCI-MSI.6718259=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.64:PCI-MSI.6718464=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.65:PCI-MSI.2359296=
3-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.65:PCI-MSI.2359297=
2-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.65:PCI-MSI.6718054=
4-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.65:PCI-MSI.6718464=
0-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.65:PCI-MSI.6718668=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.66:PCI-MSI.2359297=
4-edge.nvme0q14
      0.00          -100.0%       0.00        interrupts.66:PCI-MSI.6718259=
2-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.66:PCI-MSI.6718668=
8-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.67:PCI-MSI.6718873=
6-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.68:PCI-MSI.2359297=
0-edge.nvme0q10
      0.00          -100.0%       0.00        interrupts.68:PCI-MSI.2359297=
6-edge.nvme0q16
      0.00          -100.0%       0.00        interrupts.69:PCI-MSI.1007288=
32-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.69:PCI-MSI.2359296=
3-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.69:PCI-MSI.2359298=
0-edge.nvme0q20
      0.00          -100.0%       0.00        interrupts.70:PCI-MSI.2359296=
8-edge.nvme0q8
      0.00          -100.0%       0.00        interrupts.70:PCI-MSI.2359297=
7-edge.nvme0q17
      0.00          -100.0%       0.00        interrupts.70:PCI-MSI.2359298=
7-edge.nvme0q27
      0.00          -100.0%       0.00        interrupts.71:PCI-MSI.1007308=
80-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.71:PCI-MSI.2359298=
2-edge.nvme0q22
      0.00          -100.0%       0.00        interrupts.71:PCI-MSI.2359298=
4-edge.nvme0q24
      0.00          -100.0%       0.00        interrupts.72:PCI-MSI.1007308=
80-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.72:PCI-MSI.1007329=
28-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.72:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.72:PCI-MSI.2359297=
0-edge.nvme0q10
      0.00          -100.0%       0.00        interrupts.73:PCI-MSI.1007308=
80-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.73:PCI-MSI.1007349=
76-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.73:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.73:PCI-MSI.2359297=
1-edge.nvme0q11
      0.00          -100.0%       0.00        interrupts.73:PCI-MSI.2359297=
5-edge.nvme0q15
      0.00          -100.0%       0.00        interrupts.74:PCI-MSI.1007329=
28-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.74:PCI-MSI.1007370=
24-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.74:PCI-MSI.2359297=
6-edge.nvme0q16
      0.00          -100.0%       0.00        interrupts.74:PCI-MSI.2359299=
1-edge.nvme0q31
      0.00          -100.0%       0.00        interrupts.75:PCI-MSI.1007349=
76-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.75:PCI-MSI.1007390=
72-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.75:PCI-MSI.2359297=
7-edge.nvme0q17
      0.00          -100.0%       0.00        interrupts.77:PCI-MSI.2359296=
0-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.77:PCI-MSI.2359297=
5-edge.nvme0q15
      0.00          -100.0%       0.00        interrupts.78:PCI-MSI.1007411=
20-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.79:PCI-MSI.1007431=
68-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.79:PCI-MSI.2359298=
1-edge.nvme0q21
      0.00          -100.0%       0.00        interrupts.79:PCI-MSI.2359298=
6-edge.nvme0q26
      0.00          -100.0%       0.00        interrupts.80:PCI-MSI.2359298=
2-edge.nvme0q22
      0.00          -100.0%       0.00        interrupts.80:PCI-MSI.2359298=
4-edge.nvme0q24
      0.00          -100.0%       0.00        interrupts.80:PCI-MSI.2359298=
7-edge.nvme0q27
      0.00          -100.0%       0.00        interrupts.81:PCI-MSI.2359296=
2-edge.nvme0q2
      0.00          -100.0%       0.00        interrupts.81:PCI-MSI.2359298=
8-edge.nvme0q28
      0.00          -100.0%       0.00        interrupts.84:PCI-MSI.2359299=
1-edge.nvme0q31
      0.00          -100.0%       0.00        interrupts.85:PCI-MSI.2359296=
6-edge.nvme0q6
      0.00          -100.0%       0.00        interrupts.85:PCI-MSI.2359299=
2-edge.nvme0q32
      0.00          -100.0%       0.00        interrupts.85:PCI-MSI.2359299=
8-edge.nvme0q38
      0.00          -100.0%       0.00        interrupts.86:PCI-MSI.2359300=
0-edge.nvme0q40
      0.00          -100.0%       0.00        interrupts.87:PCI-MSI.2359298=
5-edge.nvme0q25
      0.00          -100.0%       0.00        interrupts.88:PCI-MSI.2359299=
5-edge.nvme0q35
      0.00          -100.0%       0.00        interrupts.89:PCI-MSI.2359299=
1-edge.nvme0q31
      0.00          -100.0%       0.00        interrupts.89:PCI-MSI.2359299=
6-edge.nvme0q36
      0.00          -100.0%       0.00        interrupts.89:PCI-MSI.2359300=
6-edge.nvme0q46
      0.00          -100.0%       0.00        interrupts.8:IO-APIC.8-edge.r=
tc0
      0.00          -100.0%       0.00        interrupts.90:PCI-MSI.2359299=
7-edge.nvme0q37
      0.00          -100.0%       0.00        interrupts.90:PCI-MSI.2359300=
7-edge.nvme0q47
      0.00          -100.0%       0.00        interrupts.91:PCI-MSI.2359297=
2-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.91:PCI-MSI.2359298=
5-edge.nvme0q25
      0.00          -100.0%       0.00        interrupts.91:PCI-MSI.2359299=
8-edge.nvme0q38
      0.00          -100.0%       0.00        interrupts.92:PCI-MSI.2359297=
3-edge.nvme0q13
      0.00          -100.0%       0.00        interrupts.92:PCI-MSI.2359299=
9-edge.nvme0q39
      0.00          -100.0%       0.00        interrupts.93:PCI-MSI.2359297=
4-edge.nvme0q14
      0.00          -100.0%       0.00        interrupts.94:PCI-MSI.2359299=
4-edge.nvme0q34
      0.00          -100.0%       0.00        interrupts.95:PCI-MSI.2359298=
9-edge.nvme0q29
      0.00          -100.0%       0.00        interrupts.95:PCI-MSI.2359300=
2-edge.nvme0q42
      0.00          -100.0%       0.00        interrupts.96:PCI-MSI.2359299=
6-edge.nvme0q36
      0.00          -100.0%       0.00        interrupts.97:PCI-MSI.2359297=
8-edge.nvme0q18
      0.00          -100.0%       0.00        interrupts.97:PCI-MSI.2359298=
2-edge.nvme0q22
      0.00          -100.0%       0.00        interrupts.97:PCI-MSI.2359299=
7-edge.nvme0q37
      0.00          -100.0%       0.00        interrupts.99:PCI-MSI.2359299=
3-edge.nvme0q33
      0.00          -100.0%       0.00        interrupts.99:PCI-MSI.2359299=
7-edge.nvme0q37
    606.62            +0.1%     607.20        interrupts.9:IO-APIC.9-fasteo=
i.acpi
    296713 =C2=B1 20%     +32.9%     394340 =C2=B1 19%  interrupts.CAL:Func=
tion_call_interrupts
      0.00          -100.0%       0.00        interrupts.CPU0.0:IO-APIC.2-e=
dge.timer
      1384 =C2=B1 29%     +63.3%       2260 =C2=B1 19%  interrupts.CPU0.CAL=
:Function_call_interrupts
      1.69 =C2=B1 27%     +12.3%       1.90 =C2=B1 15%  interrupts.CPU0.IWI=
:IRQ_work_interrupts
    606181            +0.1%     606881        interrupts.CPU0.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU0.MCP:Machine_c=
heck_polls
      6947 =C2=B1 27%     +12.2%       7793 =C2=B1 15%  interrupts.CPU0.NMI=
:Non-maskable_interrupts
      6947 =C2=B1 27%     +12.2%       7793 =C2=B1 15%  interrupts.CPU0.PMI=
:Performance_monitoring_interrupts
    919.46            +0.8%     927.10        interrupts.CPU0.RES:Reschedul=
ing_interrupts
      0.00          -100.0%       0.00        interrupts.CPU0.RTR:APIC_ICR_=
read_retries
      5.08 =C2=B1 50%     -27.1%       3.70 =C2=B1 12%  interrupts.CPU0.TLB=
:TLB_shootdowns
    606.62            +0.1%     607.20        interrupts.CPU1.9:IO-APIC.9-f=
asteoi.acpi
      2968 =C2=B1 45%     +25.6%       3727 =C2=B1 39%  interrupts.CPU1.CAL=
:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU1.IWI=
:IRQ_work_interrupts
    606170            +0.1%     606807        interrupts.CPU1.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU1.MCP:Machine_c=
heck_polls
      7580 =C2=B1 19%      +2.8%       7793 =C2=B1 15%  interrupts.CPU1.NMI=
:Non-maskable_interrupts
      7580 =C2=B1 19%      +2.8%       7793 =C2=B1 15%  interrupts.CPU1.PMI=
:Performance_monitoring_interrupts
    399.69 =C2=B1 16%      +9.8%     438.90 =C2=B1 21%  interrupts.CPU1.RES=
:Rescheduling_interrupts
      4.46 =C2=B1172%     -35.0%       2.90 =C2=B1107%  interrupts.CPU1.TLB=
:TLB_shootdowns
      6814 =C2=B1131%      -7.4%       6309 =C2=B1166%  interrupts.CPU10.31=
:PCI-MSI.524289-edge.eth0-TxRx-0
      1158 =C2=B1 41%     +43.0%       1656 =C2=B1 25%  interrupts.CPU10.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU10.IWI:IRQ=
_work_interrupts
    606113            +0.1%     606842        interrupts.CPU10.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU10.MCP:Machine_=
check_polls
      7580 =C2=B1 19%      +8.2%       8204        interrupts.CPU10.NMI:Non=
-maskable_interrupts
      7580 =C2=B1 19%      +8.2%       8204        interrupts.CPU10.PMI:Per=
formance_monitoring_interrupts
    338.23 =C2=B1  8%      +0.8%     340.90 =C2=B1  9%  interrupts.CPU10.RE=
S:Rescheduling_interrupts
      2.54 =C2=B1 29%     -29.1%       1.80 =C2=B1 54%  interrupts.CPU10.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU100.144:PCI-MSI=
.23593061-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.CPU100.147:PCI-MSI=
.23593061-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.CPU100.148:PCI-MSI=
.23593061-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.CPU100.153:PCI-MSI=
.23593061-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.CPU100.156:PCI-MSI=
.23593061-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.CPU100.167:PCI-MSI=
.23593061-edge.nvme0q101
      0.00          -100.0%       0.00        interrupts.CPU100.176:PCI-MSI=
.23593061-edge.nvme0q101
      1097 =C2=B1 29%    +112.1%       2328 =C2=B1 78%  interrupts.CPU100.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      +4.0%       2.00        interrupts.CPU100.IWI:IR=
Q_work_interrupts
    606051            +0.1%     606726        interrupts.CPU100.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU100.MCP:Machine=
_check_polls
      7896 =C2=B1 13%      +3.9%       8203        interrupts.CPU100.NMI:No=
n-maskable_interrupts
      7896 =C2=B1 13%      +3.9%       8203        interrupts.CPU100.PMI:Pe=
rformance_monitoring_interrupts
    310.92           +31.8%     409.80 =C2=B1 71%  interrupts.CPU100.RES:Re=
scheduling_interrupts
      2.38 =C2=B1 35%     -28.7%       1.70 =C2=B1 64%  interrupts.CPU100.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU101.151:PCI-MSI=
.23593062-edge.nvme0q102
      0.00          -100.0%       0.00        interrupts.CPU101.154:PCI-MSI=
.23593062-edge.nvme0q102
      0.00          -100.0%       0.00        interrupts.CPU101.157:PCI-MSI=
.23593062-edge.nvme0q102
      1260 =C2=B1 56%     +41.2%       1779 =C2=B1 35%  interrupts.CPU101.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      +4.0%       2.00        interrupts.CPU101.IWI:IR=
Q_work_interrupts
    606021            +0.1%     606704        interrupts.CPU101.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU101.MCP:Machine=
_check_polls
      7897 =C2=B1 13%      +3.9%       8202        interrupts.CPU101.NMI:No=
n-maskable_interrupts
      7897 =C2=B1 13%      +3.9%       8202        interrupts.CPU101.PMI:Pe=
rformance_monitoring_interrupts
    333.38 =C2=B1 22%      +8.6%     362.10 =C2=B1 33%  interrupts.CPU101.R=
ES:Rescheduling_interrupts
      2.31 =C2=B1 46%     -17.7%       1.90 =C2=B1 54%  interrupts.CPU101.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU102.146:PCI-MSI=
.23593063-edge.nvme0q103
      0.00          -100.0%       0.00        interrupts.CPU102.152:PCI-MSI=
.23593063-edge.nvme0q103
      0.00          -100.0%       0.00        interrupts.CPU102.158:PCI-MSI=
.23593063-edge.nvme0q103
      1095 =C2=B1 29%     +65.6%       1815 =C2=B1 46%  interrupts.CPU102.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU102.IWI:IR=
Q_work_interrupts
    606024            +0.1%     606726        interrupts.CPU102.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU102.MCP:Machine=
_check_polls
      7581 =C2=B1 19%      +8.2%       8203        interrupts.CPU102.NMI:No=
n-maskable_interrupts
      7581 =C2=B1 19%      +8.2%       8203        interrupts.CPU102.PMI:Pe=
rformance_monitoring_interrupts
    311.69 =C2=B1  2%     +27.3%     396.80 =C2=B1 44%  interrupts.CPU102.R=
ES:Rescheduling_interrupts
      2.46 =C2=B1 40%     -22.8%       1.90 =C2=B1 54%  interrupts.CPU102.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU103.153:PCI-MSI=
.23593064-edge.nvme0q104
      0.00          -100.0%       0.00        interrupts.CPU103.156:PCI-MSI=
.23593064-edge.nvme0q104
      0.00          -100.0%       0.00        interrupts.CPU103.159:PCI-MSI=
.23593064-edge.nvme0q104
      1106 =C2=B1 30%     +38.7%       1534 =C2=B1 29%  interrupts.CPU103.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU103.I=
WI:IRQ_work_interrupts
    606003            +0.1%     606785        interrupts.CPU103.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU103.MCP:Machine=
_check_polls
      7265 =C2=B1 23%      +7.3%       7794 =C2=B1 15%  interrupts.CPU103.N=
MI:Non-maskable_interrupts
      7265 =C2=B1 23%      +7.3%       7794 =C2=B1 15%  interrupts.CPU103.P=
MI:Performance_monitoring_interrupts
    318.15 =C2=B1  9%      -2.0%     311.80        interrupts.CPU103.RES:Re=
scheduling_interrupts
      2.38 =C2=B1 42%     -20.3%       1.90 =C2=B1 68%  interrupts.CPU103.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU104.160:PCI-MSI=
.23593065-edge.nvme0q105
      0.00          -100.0%       0.00        interrupts.CPU104.171:PCI-MSI=
.23593065-edge.nvme0q105
      0.00          -100.0%       0.00        interrupts.CPU104.180:PCI-MSI=
.23593065-edge.nvme0q105
      1625 =C2=B1124%      +2.2%       1660 =C2=B1 25%  interrupts.CPU104.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU104.I=
WI:IRQ_work_interrupts
    606031            +0.1%     606744        interrupts.CPU104.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU104.MCP:Machine=
_check_polls
      7582 =C2=B1 19%      +2.8%       7793 =C2=B1 15%  interrupts.CPU104.N=
MI:Non-maskable_interrupts
      7582 =C2=B1 19%      +2.8%       7793 =C2=B1 15%  interrupts.CPU104.P=
MI:Performance_monitoring_interrupts
    401.31 =C2=B1 77%     -15.4%     339.40 =C2=B1 13%  interrupts.CPU104.R=
ES:Rescheduling_interrupts
      2.38 =C2=B1 45%     -20.3%       1.90 =C2=B1 54%  interrupts.CPU104.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU105.153:PCI-MSI=
.23593066-edge.nvme0q106
      0.00          -100.0%       0.00        interrupts.CPU105.172:PCI-MSI=
.23593066-edge.nvme0q106
      1096 =C2=B1 29%     +46.8%       1609 =C2=B1 25%  interrupts.CPU105.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU105.I=
WI:IRQ_work_interrupts
    606001            +0.1%     606703        interrupts.CPU105.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU105.MCP:Machine=
_check_polls
      7581 =C2=B1 19%      +2.8%       7793 =C2=B1 15%  interrupts.CPU105.N=
MI:Non-maskable_interrupts
      7581 =C2=B1 19%      +2.8%       7793 =C2=B1 15%  interrupts.CPU105.P=
MI:Performance_monitoring_interrupts
    310.23            -0.2%     309.50        interrupts.CPU105.RES:Resched=
uling_interrupts
      2.54 =C2=B1 39%     -25.2%       1.90 =C2=B1 49%  interrupts.CPU105.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU106.156:PCI-MSI=
.23593067-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.CPU106.160:PCI-MSI=
.23593067-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.CPU106.169:PCI-MSI=
.23593067-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.CPU106.173:PCI-MSI=
.23593067-edge.nvme0q107
      0.00          -100.0%       0.00        interrupts.CPU106.182:PCI-MSI=
.23593067-edge.nvme0q107
      1764 =C2=B1141%     -10.0%       1587 =C2=B1 36%  interrupts.CPU106.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU106.I=
WI:IRQ_work_interrupts
    606026            +0.1%     606767        interrupts.CPU106.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU106.MCP:Machine=
_check_polls
      7582 =C2=B1 19%      -2.6%       7382 =C2=B1 22%  interrupts.CPU106.N=
MI:Non-maskable_interrupts
      7582 =C2=B1 19%      -2.6%       7382 =C2=B1 22%  interrupts.CPU106.P=
MI:Performance_monitoring_interrupts
    404.46 =C2=B1 82%      -7.3%     374.90 =C2=B1 39%  interrupts.CPU106.R=
ES:Rescheduling_interrupts
      2.46 =C2=B1 43%     -22.8%       1.90 =C2=B1 54%  interrupts.CPU106.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU107.154:PCI-MSI=
.23593068-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.CPU107.160:PCI-MSI=
.23593068-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.CPU107.161:PCI-MSI=
.23593068-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.CPU107.164:PCI-MSI=
.23593068-edge.nvme0q108
      0.00          -100.0%       0.00        interrupts.CPU107.187:PCI-MSI=
.23593068-edge.nvme0q108
      1958 =C2=B1147%     -13.0%       1704 =C2=B1 30%  interrupts.CPU107.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU107.I=
WI:IRQ_work_interrupts
    606051            +0.1%     606789        interrupts.CPU107.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU107.MCP:Machine=
_check_polls
      7581 =C2=B1 19%      +2.8%       7793 =C2=B1 15%  interrupts.CPU107.N=
MI:Non-maskable_interrupts
      7581 =C2=B1 19%      +2.8%       7793 =C2=B1 15%  interrupts.CPU107.P=
MI:Performance_monitoring_interrupts
    444.08 =C2=B1 94%     -25.8%     329.70 =C2=B1 15%  interrupts.CPU107.R=
ES:Rescheduling_interrupts
      2.62 =C2=B1 38%     -27.4%       1.90 =C2=B1 64%  interrupts.CPU107.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU108.164:PCI-MSI=
.23593069-edge.nvme0q109
      0.00          -100.0%       0.00        interrupts.CPU108.167:PCI-MSI=
.23593069-edge.nvme0q109
      1104 =C2=B1 28%     +49.8%       1654 =C2=B1 26%  interrupts.CPU108.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU108.I=
WI:IRQ_work_interrupts
    606042            +0.1%     606734        interrupts.CPU108.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU108.MCP:Machine=
_check_polls
      7581 =C2=B1 19%      +2.8%       7792 =C2=B1 15%  interrupts.CPU108.N=
MI:Non-maskable_interrupts
      7581 =C2=B1 19%      +2.8%       7792 =C2=B1 15%  interrupts.CPU108.P=
MI:Performance_monitoring_interrupts
    308.46            +7.0%     329.90 =C2=B1 14%  interrupts.CPU108.RES:Re=
scheduling_interrupts
      2.69 =C2=B1 36%     -22.0%       2.10 =C2=B1 44%  interrupts.CPU108.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU109.157:PCI-MSI=
.23593070-edge.nvme0q110
      0.00          -100.0%       0.00        interrupts.CPU109.162:PCI-MSI=
.23593070-edge.nvme0q110
      0.00          -100.0%       0.00        interrupts.CPU109.163:PCI-MSI=
.23593070-edge.nvme0q110
      1095 =C2=B1 29%     +47.1%       1611 =C2=B1 25%  interrupts.CPU109.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      +9.2%       2.10 =C2=B1 14%  interrupts.CPU109.I=
WI:IRQ_work_interrupts
    606046            +0.1%     606745        interrupts.CPU109.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU109.MCP:Machine=
_check_polls
      7898 =C2=B1 13%      +3.9%       8203        interrupts.CPU109.NMI:No=
n-maskable_interrupts
      7898 =C2=B1 13%      +3.9%       8203        interrupts.CPU109.PMI:Pe=
rformance_monitoring_interrupts
    308.54            +0.7%     310.70        interrupts.CPU109.RES:Resched=
uling_interrupts
      2.46 =C2=B1 34%     -22.8%       1.90 =C2=B1 54%  interrupts.CPU109.T=
LB:TLB_shootdowns
      8223 =C2=B1123%     -80.6%       1592 =C2=B1 97%  interrupts.CPU11.32=
:PCI-MSI.524290-edge.eth0-TxRx-1
      1556 =C2=B1110%     +15.8%       1802 =C2=B1 37%  interrupts.CPU11.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU11.IWI:IRQ=
_work_interrupts
    606082            +0.1%     606775        interrupts.CPU11.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU11.MCP:Machine_=
check_polls
      7264 =C2=B1 23%     +12.9%       8204        interrupts.CPU11.NMI:Non=
-maskable_interrupts
      7264 =C2=B1 23%     +12.9%       8204        interrupts.CPU11.PMI:Per=
formance_monitoring_interrupts
    398.54 =C2=B1 67%      -1.9%     391.10 =C2=B1 48%  interrupts.CPU11.RE=
S:Rescheduling_interrupts
      2.38 =C2=B1 35%     -24.5%       1.80 =C2=B1 41%  interrupts.CPU11.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU110.158:PCI-MSI=
.23593071-edge.nvme0q111
      0.00          -100.0%       0.00        interrupts.CPU110.160:PCI-MSI=
.23593071-edge.nvme0q111
      0.00          -100.0%       0.00        interrupts.CPU110.164:PCI-MSI=
.23593071-edge.nvme0q111
      1095 =C2=B1 29%     +47.8%       1618 =C2=B1 26%  interrupts.CPU110.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      -1.2%       1.90 =C2=B1 15%  interrupts.CPU110.I=
WI:IRQ_work_interrupts
    606074            +0.1%     606709        interrupts.CPU110.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU110.MCP:Machine=
_check_polls
      7898 =C2=B1 13%      -1.3%       7793 =C2=B1 15%  interrupts.CPU110.N=
MI:Non-maskable_interrupts
      7898 =C2=B1 13%      -1.3%       7793 =C2=B1 15%  interrupts.CPU110.P=
MI:Performance_monitoring_interrupts
    308.46            +2.9%     317.50 =C2=B1  8%  interrupts.CPU110.RES:Re=
scheduling_interrupts
      2.62 =C2=B1 31%     -27.4%       1.90 =C2=B1 68%  interrupts.CPU110.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU111.159:PCI-MSI=
.23593072-edge.nvme0q112
      0.00          -100.0%       0.00        interrupts.CPU111.161:PCI-MSI=
.23593072-edge.nvme0q112
      1095 =C2=B1 29%     +54.0%       1685 =C2=B1 34%  interrupts.CPU111.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU111.IWI:IR=
Q_work_interrupts
    606053            +0.1%     606717        interrupts.CPU111.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU111.MCP:Machine=
_check_polls
      7265 =C2=B1 23%     +12.9%       8202        interrupts.CPU111.NMI:No=
n-maskable_interrupts
      7265 =C2=B1 23%     +12.9%       8202        interrupts.CPU111.PMI:Pe=
rformance_monitoring_interrupts
    311.46 =C2=B1  2%      +8.4%     337.50 =C2=B1 20%  interrupts.CPU111.R=
ES:Rescheduling_interrupts
      2.54 =C2=B1 33%     -25.2%       1.90 =C2=B1 54%  interrupts.CPU111.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU112.170:PCI-MSI=
.23593081-edge.nvme0q121
      0.00          -100.0%       0.00        interrupts.CPU112.183:PCI-MSI=
.23593081-edge.nvme0q121
      1095 =C2=B1 29%     +47.0%       1609 =C2=B1 25%  interrupts.CPU112.C=
AL:Function_call_interrupts
      1.62 =C2=B1 30%     +23.8%       2.00        interrupts.CPU112.IWI:IR=
Q_work_interrupts
    606052            +0.1%     606656        interrupts.CPU112.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU112.MCP:Machine=
_check_polls
      6633 =C2=B1 30%     +23.7%       8204        interrupts.CPU112.NMI:No=
n-maskable_interrupts
      6633 =C2=B1 30%     +23.7%       8204        interrupts.CPU112.PMI:Pe=
rformance_monitoring_interrupts
    309.00            +0.6%     311.00        interrupts.CPU112.RES:Resched=
uling_interrupts
      2.62 =C2=B1 31%     -27.4%       1.90 =C2=B1 54%  interrupts.CPU112.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU113.165:PCI-MSI=
.23593082-edge.nvme0q122
      0.00          -100.0%       0.00        interrupts.CPU113.188:PCI-MSI=
.23593082-edge.nvme0q122
      1037 =C2=B1 26%     +56.2%       1620 =C2=B1 25%  interrupts.CPU113.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%     +18.2%       2.00        interrupts.CPU113.IWI:IR=
Q_work_interrupts
    606040            +0.1%     606711        interrupts.CPU113.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU113.MCP:Machine=
_check_polls
      6949 =C2=B1 27%     +18.1%       8204        interrupts.CPU113.NMI:No=
n-maskable_interrupts
      6949 =C2=B1 27%     +18.1%       8204        interrupts.CPU113.PMI:Pe=
rformance_monitoring_interrupts
    310.62            -0.1%     310.20        interrupts.CPU113.RES:Resched=
uling_interrupts
      2.62 =C2=B1 28%     -27.4%       1.90 =C2=B1 43%  interrupts.CPU113.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU114.166:PCI-MSI=
.23593083-edge.nvme0q123
      0.00          -100.0%       0.00        interrupts.CPU114.169:PCI-MSI=
.23593083-edge.nvme0q123
      0.00          -100.0%       0.00        interrupts.CPU114.172:PCI-MSI=
.23593083-edge.nvme0q123
      0.00          -100.0%       0.00        interrupts.CPU114.175:PCI-MSI=
.23593083-edge.nvme0q123
      1204 =C2=B1 50%     +34.2%       1616 =C2=B1 25%  interrupts.CPU114.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%     +18.2%       2.00        interrupts.CPU114.IWI:IR=
Q_work_interrupts
    606026            +0.1%     606702        interrupts.CPU114.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU114.MCP:Machine=
_check_polls
      6949 =C2=B1 27%     +18.1%       8204        interrupts.CPU114.NMI:No=
n-maskable_interrupts
      6949 =C2=B1 27%     +18.1%       8204        interrupts.CPU114.PMI:Pe=
rformance_monitoring_interrupts
    341.77 =C2=B1 31%      -7.0%     318.00 =C2=B1  7%  interrupts.CPU114.R=
ES:Rescheduling_interrupts
      2.54 =C2=B1 29%     -29.1%       1.80 =C2=B1 64%  interrupts.CPU114.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU115.171:PCI-MSI=
.23593084-edge.nvme0q124
      0.00          -100.0%       0.00        interrupts.CPU115.173:PCI-MSI=
.23593084-edge.nvme0q124
      0.00          -100.0%       0.00        interrupts.CPU115.179:PCI-MSI=
.23593084-edge.nvme0q124
      1094 =C2=B1 29%     +47.2%       1611 =C2=B1 25%  interrupts.CPU115.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%     +18.2%       2.00        interrupts.CPU115.IWI:IR=
Q_work_interrupts
    606026            +0.1%     606723        interrupts.CPU115.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU115.MCP:Machine=
_check_polls
      6949 =C2=B1 27%     +18.0%       8204        interrupts.CPU115.NMI:No=
n-maskable_interrupts
      6949 =C2=B1 27%     +18.0%       8204        interrupts.CPU115.PMI:Pe=
rformance_monitoring_interrupts
    308.23           +31.1%     404.00 =C2=B1 69%  interrupts.CPU115.RES:Re=
scheduling_interrupts
      2.62 =C2=B1 31%     -31.2%       1.80 =C2=B1 64%  interrupts.CPU115.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU116.168:PCI-MSI=
.23593085-edge.nvme0q125
      1067 =C2=B1 26%     +95.3%       2084 =C2=B1 71%  interrupts.CPU116.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU116.I=
WI:IRQ_work_interrupts
    606012            +0.1%     606725        interrupts.CPU116.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU116.MCP:Machine=
_check_polls
      7265 =C2=B1 23%      +7.3%       7794 =C2=B1 15%  interrupts.CPU116.N=
MI:Non-maskable_interrupts
      7265 =C2=B1 23%      +7.3%       7794 =C2=B1 15%  interrupts.CPU116.P=
MI:Performance_monitoring_interrupts
    310.54           +19.4%     370.80 =C2=B1 48%  interrupts.CPU116.RES:Re=
scheduling_interrupts
      2.54 =C2=B1 33%     -29.1%       1.80 =C2=B1 64%  interrupts.CPU116.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU117.169:PCI-MSI=
.23593086-edge.nvme0q126
      0.00          -100.0%       0.00        interrupts.CPU117.175:PCI-MSI=
.23593086-edge.nvme0q126
      1166 =C2=B1 42%     +41.8%       1654 =C2=B1 26%  interrupts.CPU117.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU117.I=
WI:IRQ_work_interrupts
    606060            +0.1%     606705        interrupts.CPU117.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU117.MCP:Machine=
_check_polls
      7265 =C2=B1 23%      +7.3%       7794 =C2=B1 15%  interrupts.CPU117.N=
MI:Non-maskable_interrupts
      7265 =C2=B1 23%      +7.3%       7794 =C2=B1 15%  interrupts.CPU117.P=
MI:Performance_monitoring_interrupts
    336.00 =C2=B1 28%      -2.9%     326.20 =C2=B1 15%  interrupts.CPU117.R=
ES:Rescheduling_interrupts
      2.62 =C2=B1 31%     -27.4%       1.90 =C2=B1 54%  interrupts.CPU117.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU118.174:PCI-MSI=
.23593087-edge.nvme0q127
      0.00          -100.0%       0.00        interrupts.CPU118.180:PCI-MSI=
.23593087-edge.nvme0q127
      0.00          -100.0%       0.00        interrupts.CPU118.203:PCI-MSI=
.23593087-edge.nvme0q127
      1099 =C2=B1 29%     +47.0%       1615 =C2=B1 25%  interrupts.CPU118.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU118.I=
WI:IRQ_work_interrupts
    606070            +0.1%     606697        interrupts.CPU118.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU118.MCP:Machine=
_check_polls
      7265 =C2=B1 23%      +1.6%       7384 =C2=B1 22%  interrupts.CPU118.N=
MI:Non-maskable_interrupts
      7265 =C2=B1 23%      +1.6%       7384 =C2=B1 22%  interrupts.CPU118.P=
MI:Performance_monitoring_interrupts
    312.08 =C2=B1  3%      -0.7%     310.00        interrupts.CPU118.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 34%     -18.8%       2.00 =C2=B1 50%  interrupts.CPU118.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU119.177:PCI-MSI=
.23593088-edge.nvme0q128
      0.00          -100.0%       0.00        interrupts.CPU119.181:PCI-MSI=
.23593088-edge.nvme0q128
      1112 =C2=B1 28%     +44.2%       1603 =C2=B1 25%  interrupts.CPU119.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU119.I=
WI:IRQ_work_interrupts
    606012            +0.1%     606753        interrupts.CPU119.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU119.MCP:Machine=
_check_polls
      7265 =C2=B1 23%      +7.3%       7793 =C2=B1 15%  interrupts.CPU119.N=
MI:Non-maskable_interrupts
      7265 =C2=B1 23%      +7.3%       7793 =C2=B1 15%  interrupts.CPU119.P=
MI:Performance_monitoring_interrupts
    317.31 =C2=B1  5%      -2.5%     309.50        interrupts.CPU119.RES:Re=
scheduling_interrupts
      2.54 =C2=B1 33%    +108.8%       5.30 =C2=B1200%  interrupts.CPU119.T=
LB:TLB_shootdowns
      3382 =C2=B1164%     +72.1%       5822 =C2=B1181%  interrupts.CPU12.33=
:PCI-MSI.524291-edge.eth0-TxRx-2
      1098 =C2=B1 29%     +46.6%       1611 =C2=B1 25%  interrupts.CPU12.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%     +18.2%       2.00        interrupts.CPU12.IWI:IRQ=
_work_interrupts
    606084            +0.1%     606788        interrupts.CPU12.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU12.MCP:Machine_=
check_polls
      6949 =C2=B1 27%     +18.0%       8203        interrupts.CPU12.NMI:Non=
-maskable_interrupts
      6949 =C2=B1 27%     +18.0%       8203        interrupts.CPU12.PMI:Per=
formance_monitoring_interrupts
    320.15 =C2=B1  3%      +1.1%     323.70 =C2=B1  3%  interrupts.CPU12.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 31%     -17.7%       1.90 =C2=B1 49%  interrupts.CPU12.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU120.54:PCI-MSI.=
23592961-edge.nvme0q1
      0.00          -100.0%       0.00        interrupts.CPU120.57:PCI-MSI.=
23592961-edge.nvme0q1
      0.00          -100.0%       0.00        interrupts.CPU120.63:PCI-MSI.=
23592961-edge.nvme0q1
     13271 =C2=B1 30%      -4.3%      12696 =C2=B1 38%  interrupts.CPU120.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU120.I=
WI:IRQ_work_interrupts
    606355            +0.1%     606998        interrupts.CPU120.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU120.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      +2.8%       7768 =C2=B1 15%  interrupts.CPU120.N=
MI:Non-maskable_interrupts
      7560 =C2=B1 19%      +2.8%       7768 =C2=B1 15%  interrupts.CPU120.P=
MI:Performance_monitoring_interrupts
    343.08 =C2=B1  8%      -3.8%     330.10 =C2=B1  4%  interrupts.CPU120.R=
ES:Rescheduling_interrupts
     13.46 =C2=B1241%     -89.6%       1.40 =C2=B1 57%  interrupts.CPU120.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU121.55:PCI-MSI.=
23592962-edge.nvme0q2
      0.00          -100.0%       0.00        interrupts.CPU121.81:PCI-MSI.=
23592962-edge.nvme0q2
      3669 =C2=B1 46%      -2.3%       3584 =C2=B1 29%  interrupts.CPU121.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU121.I=
WI:IRQ_work_interrupts
    606172            +0.1%     606892        interrupts.CPU121.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU121.MCP:Machine=
_check_polls
      7561 =C2=B1 19%      +2.7%       7768 =C2=B1 15%  interrupts.CPU121.N=
MI:Non-maskable_interrupts
      7561 =C2=B1 19%      +2.7%       7768 =C2=B1 15%  interrupts.CPU121.P=
MI:Performance_monitoring_interrupts
    364.15 =C2=B1 11%      +8.6%     395.60 =C2=B1 10%  interrupts.CPU121.R=
ES:Rescheduling_interrupts
      2.15 =C2=B1 40%     -30.4%       1.50 =C2=B1 44%  interrupts.CPU121.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU122.46:PCI-MSI.=
23592963-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.CPU122.52:PCI-MSI.=
23592963-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.CPU122.59:PCI-MSI.=
23592963-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.CPU122.65:PCI-MSI.=
23592963-edge.nvme0q3
      0.00          -100.0%       0.00        interrupts.CPU122.69:PCI-MSI.=
23592963-edge.nvme0q3
      2116 =C2=B1 65%     +56.5%       3311 =C2=B1 47%  interrupts.CPU122.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU122.I=
WI:IRQ_work_interrupts
    606112            +0.1%     606710        interrupts.CPU122.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU122.MCP:Machine=
_check_polls
      7561 =C2=B1 19%      -2.6%       7361 =C2=B1 22%  interrupts.CPU122.N=
MI:Non-maskable_interrupts
      7561 =C2=B1 19%      -2.6%       7361 =C2=B1 22%  interrupts.CPU122.P=
MI:Performance_monitoring_interrupts
    426.62 =C2=B1 43%     +10.1%     469.60 =C2=B1 34%  interrupts.CPU122.R=
ES:Rescheduling_interrupts
      4.92 =C2=B1172%     -71.6%       1.40 =C2=B1 57%  interrupts.CPU122.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU123.51:PCI-MSI.=
23592964-edge.nvme0q4
      0.00          -100.0%       0.00        interrupts.CPU123.53:PCI-MSI.=
23592964-edge.nvme0q4
      0.00          -100.0%       0.00        interrupts.CPU123.57:PCI-MSI.=
23592964-edge.nvme0q4
      0.00          -100.0%       0.00        interrupts.CPU123.60:PCI-MSI.=
23592964-edge.nvme0q4
      1473 =C2=B1 77%     +21.1%       1783 =C2=B1 28%  interrupts.CPU123.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU123.I=
WI:IRQ_work_interrupts
    606058            +0.1%     606791        interrupts.CPU123.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU123.MCP:Machine=
_check_polls
      7561 =C2=B1 19%      -2.7%       7360 =C2=B1 22%  interrupts.CPU123.N=
MI:Non-maskable_interrupts
      7561 =C2=B1 19%      -2.7%       7360 =C2=B1 22%  interrupts.CPU123.P=
MI:Performance_monitoring_interrupts
    364.85 =C2=B1 45%      -0.0%     364.80 =C2=B1 27%  interrupts.CPU123.R=
ES:Rescheduling_interrupts
      2.77 =C2=B1 55%     -45.8%       1.50 =C2=B1 61%  interrupts.CPU123.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU124.54:PCI-MSI.=
23592965-edge.nvme0q5
      0.00          -100.0%       0.00        interrupts.CPU124.61:PCI-MSI.=
23592965-edge.nvme0q5
      2062 =C2=B1144%     -19.1%       1668 =C2=B1 26%  interrupts.CPU124.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU124.I=
WI:IRQ_work_interrupts
    606071            +0.1%     606749        interrupts.CPU124.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU124.MCP:Machine=
_check_polls
      7561 =C2=B1 19%      -2.7%       7360 =C2=B1 22%  interrupts.CPU124.N=
MI:Non-maskable_interrupts
      7561 =C2=B1 19%      -2.7%       7360 =C2=B1 22%  interrupts.CPU124.P=
MI:Performance_monitoring_interrupts
    507.69 =C2=B1115%     -17.6%     418.10 =C2=B1 64%  interrupts.CPU124.R=
ES:Rescheduling_interrupts
      2.08 =C2=B1 29%     -23.0%       1.60 =C2=B1 50%  interrupts.CPU124.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU125.55:PCI-MSI.=
23592966-edge.nvme0q6
      0.00          -100.0%       0.00        interrupts.CPU125.59:PCI-MSI.=
23592966-edge.nvme0q6
      0.00          -100.0%       0.00        interrupts.CPU125.85:PCI-MSI.=
23592966-edge.nvme0q6
      1104 =C2=B1 28%     +58.4%       1750 =C2=B1 42%  interrupts.CPU125.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU125.I=
WI:IRQ_work_interrupts
    606025            +0.1%     606751        interrupts.CPU125.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU125.MCP:Machine=
_check_polls
      7561 =C2=B1 19%      -2.7%       7360 =C2=B1 22%  interrupts.CPU125.N=
MI:Non-maskable_interrupts
      7561 =C2=B1 19%      -2.7%       7360 =C2=B1 22%  interrupts.CPU125.P=
MI:Performance_monitoring_interrupts
    317.15 =C2=B1  7%     +10.3%     349.80 =C2=B1 35%  interrupts.CPU125.R=
ES:Rescheduling_interrupts
      2.46 =C2=B1 37%     -35.0%       1.60 =C2=B1 63%  interrupts.CPU125.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU126.60:PCI-MSI.=
23592967-edge.nvme0q7
      1254 =C2=B1 34%     +21.1%       1519 =C2=B1 21%  interrupts.CPU126.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU126.I=
WI:IRQ_work_interrupts
    606058            +0.1%     606765        interrupts.CPU126.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU126.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU126.N=
MI:Non-maskable_interrupts
      7560 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU126.P=
MI:Performance_monitoring_interrupts
    391.54 =C2=B1 39%     -21.0%     309.50 =C2=B1  2%  interrupts.CPU126.R=
ES:Rescheduling_interrupts
      2.15 =C2=B1 30%     +11.4%       2.40 =C2=B1102%  interrupts.CPU126.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU127.51:PCI-MSI.=
23592968-edge.nvme0q8
      0.00          -100.0%       0.00        interrupts.CPU127.60:PCI-MSI.=
23592968-edge.nvme0q8
      0.00          -100.0%       0.00        interrupts.CPU127.70:PCI-MSI.=
23592968-edge.nvme0q8
      1173 =C2=B1 30%     +38.4%       1623 =C2=B1 25%  interrupts.CPU127.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU127.I=
WI:IRQ_work_interrupts
    606082            +0.1%     606746        interrupts.CPU127.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU127.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU127.N=
MI:Non-maskable_interrupts
      7560 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU127.P=
MI:Performance_monitoring_interrupts
    352.00 =C2=B1 28%     -12.6%     307.60        interrupts.CPU127.RES:Re=
scheduling_interrupts
      2.31 =C2=B1 31%      -4.7%       2.20 =C2=B1 72%  interrupts.CPU127.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU128.52:PCI-MSI.=
23592969-edge.nvme0q9
      0.00          -100.0%       0.00        interrupts.CPU128.61:PCI-MSI.=
23592969-edge.nvme0q9
      1144 =C2=B1 27%     +41.8%       1622 =C2=B1 25%  interrupts.CPU128.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU128.IWI:IR=
Q_work_interrupts
    605991            +0.1%     606731        interrupts.CPU128.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU128.MCP:Machine=
_check_polls
      7559 =C2=B1 19%      +8.2%       8178        interrupts.CPU128.NMI:No=
n-maskable_interrupts
      7559 =C2=B1 19%      +8.2%       8178        interrupts.CPU128.PMI:Pe=
rformance_monitoring_interrupts
    326.23 =C2=B1 14%      -4.8%     310.70 =C2=B1  3%  interrupts.CPU128.R=
ES:Rescheduling_interrupts
      2.46 =C2=B1 34%     -18.8%       2.00 =C2=B1 54%  interrupts.CPU128.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU129.53:PCI-MSI.=
23592970-edge.nvme0q10
      0.00          -100.0%       0.00        interrupts.CPU129.62:PCI-MSI.=
23592970-edge.nvme0q10
      0.00          -100.0%       0.00        interrupts.CPU129.68:PCI-MSI.=
23592970-edge.nvme0q10
      0.00          -100.0%       0.00        interrupts.CPU129.72:PCI-MSI.=
23592970-edge.nvme0q10
      1106 =C2=B1 28%     +45.2%       1607 =C2=B1 24%  interrupts.CPU129.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU129.IWI:IR=
Q_work_interrupts
    606085            +0.1%     606738        interrupts.CPU129.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU129.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      +8.2%       8178        interrupts.CPU129.NMI:No=
n-maskable_interrupts
      7560 =C2=B1 19%      +8.2%       8178        interrupts.CPU129.PMI:Pe=
rformance_monitoring_interrupts
    312.38 =C2=B1  5%      -0.2%     311.80 =C2=B1  3%  interrupts.CPU129.R=
ES:Rescheduling_interrupts
      2.62 =C2=B1 41%     -27.4%       1.90 =C2=B1 64%  interrupts.CPU129.T=
LB:TLB_shootdowns
      3492 =C2=B1125%    +166.1%       9295 =C2=B1116%  interrupts.CPU13.34=
:PCI-MSI.524292-edge.eth0-TxRx-3
      1095 =C2=B1 29%     +47.9%       1620 =C2=B1 25%  interrupts.CPU13.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU13.IWI:IRQ=
_work_interrupts
    606061            +0.1%     606811        interrupts.CPU13.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU13.MCP:Machine_=
check_polls
      7265 =C2=B1 23%     +12.9%       8204        interrupts.CPU13.NMI:Non=
-maskable_interrupts
      7265 =C2=B1 23%     +12.9%       8204        interrupts.CPU13.PMI:Per=
formance_monitoring_interrupts
    319.23 =C2=B1  3%     +34.4%     429.00 =C2=B1 65%  interrupts.CPU13.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 35%     -13.3%       2.00 =C2=B1 54%  interrupts.CPU13.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU130.54:PCI-MSI.=
23592971-edge.nvme0q11
      0.00          -100.0%       0.00        interrupts.CPU130.64:PCI-MSI.=
23592971-edge.nvme0q11
      0.00          -100.0%       0.00        interrupts.CPU130.73:PCI-MSI.=
23592971-edge.nvme0q11
      1108 =C2=B1 28%     +45.5%       1613 =C2=B1 25%  interrupts.CPU130.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      +4.0%       2.00        interrupts.CPU130.IWI:IR=
Q_work_interrupts
    606102            +0.1%     606738        interrupts.CPU130.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU130.MCP:Machine=
_check_polls
      7875 =C2=B1 13%      +3.8%       8178        interrupts.CPU130.NMI:No=
n-maskable_interrupts
      7875 =C2=B1 13%      +3.8%       8178        interrupts.CPU130.PMI:Pe=
rformance_monitoring_interrupts
    307.69            +0.3%     308.70        interrupts.CPU130.RES:Resched=
uling_interrupts
      2.31 =C2=B1 39%     -17.7%       1.90 =C2=B1 64%  interrupts.CPU130.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU131.55:PCI-MSI.=
23592972-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.CPU131.59:PCI-MSI.=
23592972-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.CPU131.61:PCI-MSI.=
23592972-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.CPU131.65:PCI-MSI.=
23592972-edge.nvme0q12
      0.00          -100.0%       0.00        interrupts.CPU131.91:PCI-MSI.=
23592972-edge.nvme0q12
      1206 =C2=B1 35%     +45.7%       1757 =C2=B1 34%  interrupts.CPU131.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      +4.0%       2.00        interrupts.CPU131.IWI:IR=
Q_work_interrupts
    606017            +0.1%     606737        interrupts.CPU131.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU131.MCP:Machine=
_check_polls
      7876 =C2=B1 13%      +3.8%       8178        interrupts.CPU131.NMI:No=
n-maskable_interrupts
      7876 =C2=B1 13%      +3.8%       8178        interrupts.CPU131.PMI:Pe=
rformance_monitoring_interrupts
    348.77 =C2=B1 35%      +1.2%     353.10 =C2=B1 35%  interrupts.CPU131.R=
ES:Rescheduling_interrupts
      2.46 =C2=B1 34%     -26.9%       1.80 =C2=B1 59%  interrupts.CPU131.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU132.56:PCI-MSI.=
23592973-edge.nvme0q13
      0.00          -100.0%       0.00        interrupts.CPU132.60:PCI-MSI.=
23592973-edge.nvme0q13
      0.00          -100.0%       0.00        interrupts.CPU132.92:PCI-MSI.=
23592973-edge.nvme0q13
      1112 =C2=B1 29%     +44.9%       1612 =C2=B1 25%  interrupts.CPU132.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU132.IWI:IR=
Q_work_interrupts
    606027            +0.1%     606731        interrupts.CPU132.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU132.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      +8.2%       8178        interrupts.CPU132.NMI:No=
n-maskable_interrupts
      7560 =C2=B1 19%      +8.2%       8178        interrupts.CPU132.PMI:Pe=
rformance_monitoring_interrupts
    377.00 =C2=B1 63%     -18.5%     307.20        interrupts.CPU132.RES:Re=
scheduling_interrupts
      6.85 =C2=B1154%     -72.2%       1.90 =C2=B1 59%  interrupts.CPU132.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU133.57:PCI-MSI.=
23592974-edge.nvme0q14
      0.00          -100.0%       0.00        interrupts.CPU133.66:PCI-MSI.=
23592974-edge.nvme0q14
      0.00          -100.0%       0.00        interrupts.CPU133.93:PCI-MSI.=
23592974-edge.nvme0q14
      1099 =C2=B1 29%     +46.6%       1611 =C2=B1 25%  interrupts.CPU133.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU133.IWI:IR=
Q_work_interrupts
    606085            +0.1%     606733        interrupts.CPU133.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU133.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      +8.2%       8178        interrupts.CPU133.NMI:No=
n-maskable_interrupts
      7560 =C2=B1 19%      +8.2%       8178        interrupts.CPU133.PMI:Pe=
rformance_monitoring_interrupts
    307.92            -0.6%     306.10        interrupts.CPU133.RES:Resched=
uling_interrupts
      2.69 =C2=B1 36%     -29.4%       1.90 =C2=B1 54%  interrupts.CPU133.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU134.73:PCI-MSI.=
23592975-edge.nvme0q15
      0.00          -100.0%       0.00        interrupts.CPU134.77:PCI-MSI.=
23592975-edge.nvme0q15
      1094 =C2=B1 29%     +46.7%       1606 =C2=B1 25%  interrupts.CPU134.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU134.IWI:IR=
Q_work_interrupts
    606068            +0.1%     606740        interrupts.CPU134.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU134.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      +8.2%       8178        interrupts.CPU134.NMI:No=
n-maskable_interrupts
      7560 =C2=B1 19%      +8.2%       8178        interrupts.CPU134.PMI:Pe=
rformance_monitoring_interrupts
    307.77            -0.4%     306.50        interrupts.CPU134.RES:Resched=
uling_interrupts
      4.92 =C2=B1177%     -57.3%       2.10 =C2=B1 58%  interrupts.CPU134.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU135.59:PCI-MSI.=
23592976-edge.nvme0q16
      0.00          -100.0%       0.00        interrupts.CPU135.68:PCI-MSI.=
23592976-edge.nvme0q16
      0.00          -100.0%       0.00        interrupts.CPU135.74:PCI-MSI.=
23592976-edge.nvme0q16
      1121 =C2=B1 28%     +44.8%       1624 =C2=B1 24%  interrupts.CPU135.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU135.I=
WI:IRQ_work_interrupts
    606038            +0.1%     606782        interrupts.CPU135.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU135.MCP:Machine=
_check_polls
      7246 =C2=B1 23%      +7.2%       7769 =C2=B1 15%  interrupts.CPU135.N=
MI:Non-maskable_interrupts
      7246 =C2=B1 23%      +7.2%       7769 =C2=B1 15%  interrupts.CPU135.P=
MI:Performance_monitoring_interrupts
    383.08 =C2=B1 68%     -19.9%     307.00        interrupts.CPU135.RES:Re=
scheduling_interrupts
      2.38 =C2=B1 38%     -24.5%       1.80 =C2=B1 64%  interrupts.CPU135.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU136.87:PCI-MSI.=
23592985-edge.nvme0q25
      0.00          -100.0%       0.00        interrupts.CPU136.91:PCI-MSI.=
23592985-edge.nvme0q25
      1069 =C2=B1 32%     +51.0%       1615 =C2=B1 25%  interrupts.CPU136.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU136.I=
WI:IRQ_work_interrupts
    606109            +0.1%     606724        interrupts.CPU136.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU136.MCP:Machine=
_check_polls
      7561 =C2=B1 19%      +2.7%       7768 =C2=B1 15%  interrupts.CPU136.N=
MI:Non-maskable_interrupts
      7561 =C2=B1 19%      +2.7%       7768 =C2=B1 15%  interrupts.CPU136.P=
MI:Performance_monitoring_interrupts
    310.38 =C2=B1  2%      -1.3%     306.50        interrupts.CPU136.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 40%     -22.8%       1.90 =C2=B1 76%  interrupts.CPU136.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU137.79:PCI-MSI.=
23592986-edge.nvme0q26
      1608 =C2=B1108%      +0.5%       1615 =C2=B1 26%  interrupts.CPU137.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU137.I=
WI:IRQ_work_interrupts
    606052            +0.1%     606736        interrupts.CPU137.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU137.MCP:Machine=
_check_polls
      7561 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU137.N=
MI:Non-maskable_interrupts
      7561 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU137.P=
MI:Performance_monitoring_interrupts
    413.46 =C2=B1 70%      -3.8%     397.60 =C2=B1 68%  interrupts.CPU137.R=
ES:Rescheduling_interrupts
      2.38 =C2=B1 38%     -16.1%       2.00 =C2=B1 59%  interrupts.CPU137.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU138.70:PCI-MSI.=
23592987-edge.nvme0q27
      0.00          -100.0%       0.00        interrupts.CPU138.80:PCI-MSI.=
23592987-edge.nvme0q27
      1076 =C2=B1 34%     +46.3%       1574 =C2=B1 21%  interrupts.CPU138.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU138.I=
WI:IRQ_work_interrupts
    606089            +0.1%     606769        interrupts.CPU138.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU138.MCP:Machine=
_check_polls
      7876 =C2=B1 13%      -6.5%       7361 =C2=B1 22%  interrupts.CPU138.N=
MI:Non-maskable_interrupts
      7876 =C2=B1 13%      -6.5%       7361 =C2=B1 22%  interrupts.CPU138.P=
MI:Performance_monitoring_interrupts
    308.31            -0.0%     308.20        interrupts.CPU138.RES:Resched=
uling_interrupts
      2.38 =C2=B1 35%     -20.3%       1.90 =C2=B1 43%  interrupts.CPU138.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU139.107:PCI-MSI=
.23592988-edge.nvme0q28
      0.00          -100.0%       0.00        interrupts.CPU139.81:PCI-MSI.=
23592988-edge.nvme0q28
      1097 =C2=B1 29%     +47.2%       1615 =C2=B1 26%  interrupts.CPU139.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU139.I=
WI:IRQ_work_interrupts
    606058            +0.1%     606732        interrupts.CPU139.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU139.MCP:Machine=
_check_polls
      7875 =C2=B1 13%      -6.5%       7360 =C2=B1 22%  interrupts.CPU139.N=
MI:Non-maskable_interrupts
      7875 =C2=B1 13%      -6.5%       7360 =C2=B1 22%  interrupts.CPU139.P=
MI:Performance_monitoring_interrupts
    309.77 =C2=B1  2%      -0.8%     307.40        interrupts.CPU139.RES:Re=
scheduling_interrupts
      2.54 =C2=B1 33%     -33.0%       1.70 =C2=B1 64%  interrupts.CPU139.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU14.4:IO-APIC.4-=
edge.ttyS0
      1095 =C2=B1 29%     +47.0%       1610 =C2=B1 25%  interrupts.CPU14.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU14.IW=
I:IRQ_work_interrupts
    606076            +0.1%     606764        interrupts.CPU14.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU14.MCP:Machine_=
check_polls
      7266 =C2=B1 23%      +7.2%       7793 =C2=B1 15%  interrupts.CPU14.NM=
I:Non-maskable_interrupts
      7266 =C2=B1 23%      +7.2%       7793 =C2=B1 15%  interrupts.CPU14.PM=
I:Performance_monitoring_interrupts
    310.31           +12.8%     350.00 =C2=B1 27%  interrupts.CPU14.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 30%     -18.8%       2.00 =C2=B1 44%  interrupts.CPU14.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU140.108:PCI-MSI=
.23592989-edge.nvme0q29
      0.00          -100.0%       0.00        interrupts.CPU140.95:PCI-MSI.=
23592989-edge.nvme0q29
      1098 =C2=B1 29%     +49.5%       1641 =C2=B1 28%  interrupts.CPU140.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU140.I=
WI:IRQ_work_interrupts
    606059            +0.1%     606730        interrupts.CPU140.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU140.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      -2.6%       7361 =C2=B1 22%  interrupts.CPU140.N=
MI:Non-maskable_interrupts
      7560 =C2=B1 19%      -2.6%       7361 =C2=B1 22%  interrupts.CPU140.P=
MI:Performance_monitoring_interrupts
    307.77            +0.2%     308.50        interrupts.CPU140.RES:Resched=
uling_interrupts
      2.54 =C2=B1 33%     -29.1%       1.80 =C2=B1 64%  interrupts.CPU140.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU141.109:PCI-MSI=
.23592990-edge.nvme0q30
      1401 =C2=B1 65%     +33.5%       1870 =C2=B1 57%  interrupts.CPU141.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU141.I=
WI:IRQ_work_interrupts
    606105            +0.1%     606715        interrupts.CPU141.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU141.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU141.N=
MI:Non-maskable_interrupts
      7560 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU141.P=
MI:Performance_monitoring_interrupts
    363.31 =C2=B1 43%      -1.8%     356.80 =C2=B1 38%  interrupts.CPU141.R=
ES:Rescheduling_interrupts
      3.00 =C2=B1 73%     -40.0%       1.80 =C2=B1 54%  interrupts.CPU141.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU142.110:PCI-MSI=
.23592991-edge.nvme0q31
      0.00          -100.0%       0.00        interrupts.CPU142.74:PCI-MSI.=
23592991-edge.nvme0q31
      0.00          -100.0%       0.00        interrupts.CPU142.84:PCI-MSI.=
23592991-edge.nvme0q31
      0.00          -100.0%       0.00        interrupts.CPU142.89:PCI-MSI.=
23592991-edge.nvme0q31
      1101 =C2=B1 29%     +46.3%       1611 =C2=B1 25%  interrupts.CPU142.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU142.I=
WI:IRQ_work_interrupts
    606044            +0.1%     606759        interrupts.CPU142.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU142.MCP:Machine=
_check_polls
      7560 =C2=B1 19%      -2.6%       7361 =C2=B1 22%  interrupts.CPU142.N=
MI:Non-maskable_interrupts
      7560 =C2=B1 19%      -2.6%       7361 =C2=B1 22%  interrupts.CPU142.P=
MI:Performance_monitoring_interrupts
    307.62            +0.1%     307.80        interrupts.CPU142.RES:Resched=
uling_interrupts
      2.77 =C2=B1 35%     -31.4%       1.90 =C2=B1 43%  interrupts.CPU142.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU143.85:PCI-MSI.=
23592992-edge.nvme0q32
      2123 =C2=B1113%     -23.8%       1618 =C2=B1 25%  interrupts.CPU143.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU143.I=
WI:IRQ_work_interrupts
    606067            +0.1%     606732        interrupts.CPU143.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU143.MCP:Machine=
_check_polls
      7875 =C2=B1 13%      -6.5%       7361 =C2=B1 22%  interrupts.CPU143.N=
MI:Non-maskable_interrupts
      7875 =C2=B1 13%      -6.5%       7361 =C2=B1 22%  interrupts.CPU143.P=
MI:Performance_monitoring_interrupts
    529.38 =C2=B1 95%     -42.0%     306.90        interrupts.CPU143.RES:Re=
scheduling_interrupts
      2.23 =C2=B1 39%     -10.3%       2.00 =C2=B1 74%  interrupts.CPU143.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU144.99:PCI-MSI.=
23592993-edge.nvme0q33
     11973 =C2=B1 25%     +15.2%      13798 =C2=B1 21%  interrupts.CPU144.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU144.I=
WI:IRQ_work_interrupts
    606208            +0.1%     606990        interrupts.CPU144.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU144.MCP:Machine=
_check_polls
      8207 =C2=B1 13%      -6.5%       7670 =C2=B1 22%  interrupts.CPU144.N=
MI:Non-maskable_interrupts
      8207 =C2=B1 13%      -6.5%       7670 =C2=B1 22%  interrupts.CPU144.P=
MI:Performance_monitoring_interrupts
    333.85 =C2=B1  6%      +0.0%     334.00 =C2=B1  6%  interrupts.CPU144.R=
ES:Rescheduling_interrupts
      4.15 =C2=B1188%     -66.3%       1.40 =C2=B1 57%  interrupts.CPU144.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU145.100:PCI-MSI=
.23592994-edge.nvme0q34
      0.00          -100.0%       0.00        interrupts.CPU145.94:PCI-MSI.=
23592994-edge.nvme0q34
      3985 =C2=B1 43%     +20.1%       4785 =C2=B1 34%  interrupts.CPU145.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU145.I=
WI:IRQ_work_interrupts
    606032            +0.1%     606825        interrupts.CPU145.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU145.MCP:Machine=
_check_polls
      8208 =C2=B1 13%      -6.5%       7672 =C2=B1 22%  interrupts.CPU145.N=
MI:Non-maskable_interrupts
      8208 =C2=B1 13%      -6.5%       7672 =C2=B1 22%  interrupts.CPU145.P=
MI:Performance_monitoring_interrupts
    374.62 =C2=B1  9%      +6.1%     397.50 =C2=B1  8%  interrupts.CPU145.R=
ES:Rescheduling_interrupts
      2.08 =C2=B1 29%     -18.1%       1.70 =C2=B1 52%  interrupts.CPU145.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU146.88:PCI-MSI.=
23592995-edge.nvme0q35
      2371 =C2=B1 57%     +29.2%       3063 =C2=B1 44%  interrupts.CPU146.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU146.I=
WI:IRQ_work_interrupts
    605926            +0.1%     606672        interrupts.CPU146.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU146.MCP:Machine=
_check_polls
      7880 =C2=B1 19%      -8.0%       7246 =C2=B1 26%  interrupts.CPU146.N=
MI:Non-maskable_interrupts
      7880 =C2=B1 19%      -8.0%       7246 =C2=B1 26%  interrupts.CPU146.P=
MI:Performance_monitoring_interrupts
    441.08 =C2=B1 28%     -10.8%     393.60 =C2=B1 22%  interrupts.CPU146.R=
ES:Rescheduling_interrupts
      2.00 =C2=B1 39%     -30.0%       1.40 =C2=B1 57%  interrupts.CPU146.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU147.102:PCI-MSI=
.23592996-edge.nvme0q36
      0.00          -100.0%       0.00        interrupts.CPU147.89:PCI-MSI.=
23592996-edge.nvme0q36
      0.00          -100.0%       0.00        interrupts.CPU147.96:PCI-MSI.=
23592996-edge.nvme0q36
      1675 =C2=B1117%      -3.4%       1619 =C2=B1 25%  interrupts.CPU147.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU147.I=
WI:IRQ_work_interrupts
    605933            +0.1%     606685        interrupts.CPU147.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU147.MCP:Machine=
_check_polls
      7552 =C2=B1 23%      +1.6%       7672 =C2=B1 22%  interrupts.CPU147.N=
MI:Non-maskable_interrupts
      7552 =C2=B1 23%      +1.6%       7672 =C2=B1 22%  interrupts.CPU147.P=
MI:Performance_monitoring_interrupts
    394.08 =C2=B1 57%     -21.4%     309.80        interrupts.CPU147.RES:Re=
scheduling_interrupts
      2.15 =C2=B1 40%     -21.1%       1.70 =C2=B1 64%  interrupts.CPU147.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU148.116:PCI-MSI=
.23592997-edge.nvme0q37
      0.00          -100.0%       0.00        interrupts.CPU148.90:PCI-MSI.=
23592997-edge.nvme0q37
      0.00          -100.0%       0.00        interrupts.CPU148.97:PCI-MSI.=
23592997-edge.nvme0q37
      0.00          -100.0%       0.00        interrupts.CPU148.99:PCI-MSI.=
23592997-edge.nvme0q37
      1207 =C2=B1 36%     +30.4%       1575 =C2=B1 26%  interrupts.CPU148.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 26%  interrupts.CPU148.I=
WI:IRQ_work_interrupts
    605933            +0.1%     606652        interrupts.CPU148.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU148.MCP:Machine=
_check_polls
      7552 =C2=B1 23%      -4.1%       7246 =C2=B1 26%  interrupts.CPU148.N=
MI:Non-maskable_interrupts
      7552 =C2=B1 23%      -4.1%       7246 =C2=B1 26%  interrupts.CPU148.P=
MI:Performance_monitoring_interrupts
    338.46 =C2=B1 22%      -8.9%     308.50        interrupts.CPU148.RES:Re=
scheduling_interrupts
      2.62 =C2=B1 64%     -31.2%       1.80 =C2=B1 64%  interrupts.CPU148.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU149.100:PCI-MSI=
.23592998-edge.nvme0q38
      0.00          -100.0%       0.00        interrupts.CPU149.85:PCI-MSI.=
23592998-edge.nvme0q38
      0.00          -100.0%       0.00        interrupts.CPU149.91:PCI-MSI.=
23592998-edge.nvme0q38
      1121 =C2=B1 32%     +44.0%       1614 =C2=B1 25%  interrupts.CPU149.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -7.9%       1.70 =C2=B1 26%  interrupts.CPU149.I=
WI:IRQ_work_interrupts
    605951            +0.1%     606652        interrupts.CPU149.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU149.MCP:Machine=
_check_polls
      7880 =C2=B1 19%      -8.1%       7245 =C2=B1 26%  interrupts.CPU149.N=
MI:Non-maskable_interrupts
      7880 =C2=B1 19%      -8.1%       7245 =C2=B1 26%  interrupts.CPU149.P=
MI:Performance_monitoring_interrupts
    311.54 =C2=B1  2%      -1.2%     307.80        interrupts.CPU149.RES:Re=
scheduling_interrupts
      2.23 =C2=B1 39%     -19.3%       1.80 =C2=B1 64%  interrupts.CPU149.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU15.37:PCI-MSI.6=
5536-edge.ioat-msix
      1102 =C2=B1 29%     +48.6%       1638 =C2=B1 25%  interrupts.CPU15.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU15.IWI:IRQ=
_work_interrupts
    606083            +0.1%     606752        interrupts.CPU15.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU15.MCP:Machine_=
check_polls
      7265 =C2=B1 23%     +12.9%       8204        interrupts.CPU15.NMI:Non=
-maskable_interrupts
      7265 =C2=B1 23%     +12.9%       8204        interrupts.CPU15.PMI:Per=
formance_monitoring_interrupts
    316.69 =C2=B1  4%      +0.9%     319.40 =C2=B1  6%  interrupts.CPU15.RE=
S:Rescheduling_interrupts
      2.62 =C2=B1 28%     -23.5%       2.00 =C2=B1 54%  interrupts.CPU15.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU150.105:PCI-MSI=
.23592999-edge.nvme0q39
      0.00          -100.0%       0.00        interrupts.CPU150.92:PCI-MSI.=
23592999-edge.nvme0q39
      1545 =C2=B1100%      +7.5%       1660 =C2=B1 26%  interrupts.CPU150.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 26%  interrupts.CPU150.I=
WI:IRQ_work_interrupts
    605948            +0.1%     606647        interrupts.CPU150.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU150.MCP:Machine=
_check_polls
      7551 =C2=B1 23%      -4.1%       7245 =C2=B1 26%  interrupts.CPU150.N=
MI:Non-maskable_interrupts
      7551 =C2=B1 23%      -4.1%       7245 =C2=B1 26%  interrupts.CPU150.P=
MI:Performance_monitoring_interrupts
    378.92 =C2=B1 64%     -18.6%     308.50        interrupts.CPU150.RES:Re=
scheduling_interrupts
      4.85 =C2=B1164%     -62.9%       1.80 =C2=B1 64%  interrupts.CPU150.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU151.115:PCI-MSI=
.23593000-edge.nvme0q40
      0.00          -100.0%       0.00        interrupts.CPU151.119:PCI-MSI=
.23593000-edge.nvme0q40
      0.00          -100.0%       0.00        interrupts.CPU151.86:PCI-MSI.=
23593000-edge.nvme0q40
      1207 =C2=B1 36%     +48.9%       1798 =C2=B1 39%  interrupts.CPU151.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 26%  interrupts.CPU151.I=
WI:IRQ_work_interrupts
    605944            +0.1%     606667        interrupts.CPU151.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU151.MCP:Machine=
_check_polls
      7552 =C2=B1 23%      -4.1%       7245 =C2=B1 26%  interrupts.CPU151.N=
MI:Non-maskable_interrupts
      7552 =C2=B1 23%      -4.1%       7245 =C2=B1 26%  interrupts.CPU151.P=
MI:Performance_monitoring_interrupts
    346.00 =C2=B1 34%      +6.9%     369.90 =C2=B1 48%  interrupts.CPU151.R=
ES:Rescheduling_interrupts
      2.31 =C2=B1 35%    +441.7%      12.50 =C2=B1257%  interrupts.CPU151.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU152.120:PCI-MSI=
.23593001-edge.nvme0q41
      1100 =C2=B1 29%     +46.8%       1614 =C2=B1 25%  interrupts.CPU152.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU152.I=
WI:IRQ_work_interrupts
    605906            +0.1%     606661        interrupts.CPU152.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU152.MCP:Machine=
_check_polls
      7552 =C2=B1 23%      +1.6%       7672 =C2=B1 22%  interrupts.CPU152.N=
MI:Non-maskable_interrupts
      7552 =C2=B1 23%      +1.6%       7672 =C2=B1 22%  interrupts.CPU152.P=
MI:Performance_monitoring_interrupts
    377.77 =C2=B1 64%     -18.7%     307.10        interrupts.CPU152.RES:Re=
scheduling_interrupts
      2.54 =C2=B1 39%     -21.2%       2.00 =C2=B1 54%  interrupts.CPU152.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU153.121:PCI-MSI=
.23593002-edge.nvme0q42
      0.00          -100.0%       0.00        interrupts.CPU153.95:PCI-MSI.=
23593002-edge.nvme0q42
      1145 =C2=B1 48%     +40.8%       1612 =C2=B1 25%  interrupts.CPU153.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 26%  interrupts.CPU153.I=
WI:IRQ_work_interrupts
    605875            +0.1%     606631        interrupts.CPU153.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU153.MCP:Machine=
_check_polls
      7552 =C2=B1 23%      -4.1%       7245 =C2=B1 26%  interrupts.CPU153.N=
MI:Non-maskable_interrupts
      7552 =C2=B1 23%      -4.1%       7245 =C2=B1 26%  interrupts.CPU153.P=
MI:Performance_monitoring_interrupts
    334.77 =C2=B1 27%      -7.3%     310.20 =C2=B1  2%  interrupts.CPU153.R=
ES:Rescheduling_interrupts
      4.85 =C2=B1162%     -56.7%       2.10 =C2=B1 49%  interrupts.CPU153.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU154.122:PCI-MSI=
.23593003-edge.nvme0q43
      1096 =C2=B1 29%     +51.8%       1664 =C2=B1 21%  interrupts.CPU154.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -7.9%       1.70 =C2=B1 26%  interrupts.CPU154.I=
WI:IRQ_work_interrupts
    605961            +0.1%     606643        interrupts.CPU154.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU154.MCP:Machine=
_check_polls
      7880 =C2=B1 19%      -8.1%       7245 =C2=B1 26%  interrupts.CPU154.N=
MI:Non-maskable_interrupts
      7880 =C2=B1 19%      -8.1%       7245 =C2=B1 26%  interrupts.CPU154.P=
MI:Performance_monitoring_interrupts
    306.92            +4.7%     321.20 =C2=B1 13%  interrupts.CPU154.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 40%     -22.8%       1.90 =C2=B1 64%  interrupts.CPU154.T=
LB:TLB_shootdowns
      1104 =C2=B1 28%     +46.0%       1611 =C2=B1 25%  interrupts.CPU155.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU155.I=
WI:IRQ_work_interrupts
    605900            +0.1%     606633        interrupts.CPU155.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU155.MCP:Machine=
_check_polls
      7879 =C2=B1 19%      -2.7%       7671 =C2=B1 22%  interrupts.CPU155.N=
MI:Non-maskable_interrupts
      7879 =C2=B1 19%      -2.7%       7671 =C2=B1 22%  interrupts.CPU155.P=
MI:Performance_monitoring_interrupts
    306.85            +0.6%     308.60        interrupts.CPU155.RES:Resched=
uling_interrupts
      2.62 =C2=B1 31%     -27.4%       1.90 =C2=B1 59%  interrupts.CPU155.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU156.105:PCI-MSI=
.23593005-edge.nvme0q45
      0.00          -100.0%       0.00        interrupts.CPU156.107:PCI-MSI=
.23593005-edge.nvme0q45
      0.00          -100.0%       0.00        interrupts.CPU156.111:PCI-MSI=
.23593005-edge.nvme0q45
      1096 =C2=B1 29%     +46.9%       1611 =C2=B1 25%  interrupts.CPU156.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -7.9%       1.70 =C2=B1 26%  interrupts.CPU156.I=
WI:IRQ_work_interrupts
    605934            +0.1%     606705        interrupts.CPU156.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU156.MCP:Machine=
_check_polls
      7880 =C2=B1 19%      -8.1%       7244 =C2=B1 26%  interrupts.CPU156.N=
MI:Non-maskable_interrupts
      7880 =C2=B1 19%      -8.1%       7244 =C2=B1 26%  interrupts.CPU156.P=
MI:Performance_monitoring_interrupts
    307.00            +0.6%     308.70        interrupts.CPU156.RES:Resched=
uling_interrupts
      2.62 =C2=B1 35%    +117.9%       5.70 =C2=B1207%  interrupts.CPU156.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU157.89:PCI-MSI.=
23593006-edge.nvme0q46
      1096 =C2=B1 29%    +124.0%       2455 =C2=B1104%  interrupts.CPU157.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -7.9%       1.70 =C2=B1 26%  interrupts.CPU157.I=
WI:IRQ_work_interrupts
    605931            +0.1%     606643        interrupts.CPU157.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU157.MCP:Machine=
_check_polls
      7879 =C2=B1 19%      -8.1%       7245 =C2=B1 26%  interrupts.CPU157.N=
MI:Non-maskable_interrupts
      7879 =C2=B1 19%      -8.1%       7245 =C2=B1 26%  interrupts.CPU157.P=
MI:Performance_monitoring_interrupts
    307.38           +39.2%     428.00 =C2=B1 84%  interrupts.CPU157.RES:Re=
scheduling_interrupts
      2.38 =C2=B1 35%     -11.9%       2.10 =C2=B1 58%  interrupts.CPU157.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU158.100:PCI-MSI=
.23593007-edge.nvme0q47
      0.00          -100.0%       0.00        interrupts.CPU158.107:PCI-MSI=
.23593007-edge.nvme0q47
      0.00          -100.0%       0.00        interrupts.CPU158.90:PCI-MSI.=
23593007-edge.nvme0q47
      1091 =C2=B1 29%     +60.5%       1751 =C2=B1 35%  interrupts.CPU158.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 26%  interrupts.CPU158.I=
WI:IRQ_work_interrupts
    605916            +0.1%     606677        interrupts.CPU158.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU158.MCP:Machine=
_check_polls
      7551 =C2=B1 23%      -9.7%       6818 =C2=B1 30%  interrupts.CPU158.N=
MI:Non-maskable_interrupts
      7551 =C2=B1 23%      -9.7%       6818 =C2=B1 30%  interrupts.CPU158.P=
MI:Performance_monitoring_interrupts
    306.62           +13.7%     348.70 =C2=B1 34%  interrupts.CPU158.RES:Re=
scheduling_interrupts
      4.62 =C2=B1166%     -45.8%       2.50 =C2=B1 62%  interrupts.CPU158.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU159.100:PCI-MSI=
.23593008-edge.nvme0q48
      0.00          -100.0%       0.00        interrupts.CPU159.114:PCI-MSI=
.23593008-edge.nvme0q48
      0.00          -100.0%       0.00        interrupts.CPU159.127:PCI-MSI=
.23593008-edge.nvme0q48
      1096 =C2=B1 29%     +48.4%       1627 =C2=B1 25%  interrupts.CPU159.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -7.9%       1.70 =C2=B1 26%  interrupts.CPU159.I=
WI:IRQ_work_interrupts
    605915            +0.1%     606672        interrupts.CPU159.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU159.MCP:Machine=
_check_polls
      7879 =C2=B1 19%      -8.1%       7245 =C2=B1 26%  interrupts.CPU159.N=
MI:Non-maskable_interrupts
      7879 =C2=B1 19%      -8.1%       7245 =C2=B1 26%  interrupts.CPU159.P=
MI:Performance_monitoring_interrupts
    306.85           +29.8%     398.20 =C2=B1 68%  interrupts.CPU159.RES:Re=
scheduling_interrupts
      2.77 =C2=B1 49%     -31.4%       1.90 =C2=B1 59%  interrupts.CPU159.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU16.165:PCI-MSI.=
23593073-edge.nvme0q113
      0.00          -100.0%       0.00        interrupts.CPU16.175:PCI-MSI.=
23593073-edge.nvme0q113
      0.00          -100.0%       0.00        interrupts.CPU16.39:PCI-MSI.6=
7584-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU16.41:PCI-MSI.6=
7584-edge.ioat-msix
      1146 =C2=B1 36%     +40.6%       1612 =C2=B1 25%  interrupts.CPU16.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%     +12.3%       1.90 =C2=B1 15%  interrupts.CPU16.IW=
I:IRQ_work_interrupts
    606066            +0.1%     606735        interrupts.CPU16.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU16.MCP:Machine_=
check_polls
      6949 =C2=B1 27%     +12.1%       7793 =C2=B1 15%  interrupts.CPU16.NM=
I:Non-maskable_interrupts
      6949 =C2=B1 27%     +12.1%       7793 =C2=B1 15%  interrupts.CPU16.PM=
I:Performance_monitoring_interrupts
    323.38 =C2=B1 13%     +27.1%     411.00 =C2=B1 68%  interrupts.CPU16.RE=
S:Rescheduling_interrupts
      2.54 =C2=B1 29%     -25.2%       1.90 =C2=B1 43%  interrupts.CPU16.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU160.132:PCI-MSI=
.23593017-edge.nvme0q57
      1176 =C2=B1 28%     +34.1%       1577 =C2=B1 26%  interrupts.CPU160.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -7.9%       1.70 =C2=B1 26%  interrupts.CPU160.I=
WI:IRQ_work_interrupts
    605897            +0.1%     606661        interrupts.CPU160.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU160.MCP:Machine=
_check_polls
      7879 =C2=B1 19%      -8.0%       7245 =C2=B1 26%  interrupts.CPU160.N=
MI:Non-maskable_interrupts
      7879 =C2=B1 19%      -8.0%       7245 =C2=B1 26%  interrupts.CPU160.P=
MI:Performance_monitoring_interrupts
    327.31 =C2=B1 13%      -4.7%     311.90 =C2=B1  3%  interrupts.CPU160.R=
ES:Rescheduling_interrupts
      2.54 =C2=B1 36%     -25.2%       1.90 =C2=B1 59%  interrupts.CPU160.T=
LB:TLB_shootdowns
      1101 =C2=B1 29%     +46.3%       1611 =C2=B1 25%  interrupts.CPU161.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%     -11.6%       1.70 =C2=B1 26%  interrupts.CPU161.I=
WI:IRQ_work_interrupts
    605876            +0.1%     606649        interrupts.CPU161.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU161.MCP:Machine=
_check_polls
      8207 =C2=B1 13%     -11.7%       7244 =C2=B1 26%  interrupts.CPU161.N=
MI:Non-maskable_interrupts
      8207 =C2=B1 13%     -11.7%       7244 =C2=B1 26%  interrupts.CPU161.P=
MI:Performance_monitoring_interrupts
    307.54            +0.1%     307.80        interrupts.CPU161.RES:Resched=
uling_interrupts
      2.46 =C2=B1 34%     -22.8%       1.90 =C2=B1 54%  interrupts.CPU161.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU162.105:PCI-MSI=
.23593019-edge.nvme0q59
      0.00          -100.0%       0.00        interrupts.CPU162.138:PCI-MSI=
.23593019-edge.nvme0q59
      1202 =C2=B1 36%     +27.8%       1537 =C2=B1 29%  interrupts.CPU162.C=
AL:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU162.IWI:IR=
Q_work_interrupts
    605891            +0.1%     606674        interrupts.CPU162.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU162.MCP:Machine=
_check_polls
      8537           -10.1%       7671 =C2=B1 22%  interrupts.CPU162.NMI:No=
n-maskable_interrupts
      8537           -10.1%       7671 =C2=B1 22%  interrupts.CPU162.PMI:Pe=
rformance_monitoring_interrupts
    339.46 =C2=B1 30%      -9.1%     308.50        interrupts.CPU162.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 30%     -14.7%       2.10 =C2=B1 44%  interrupts.CPU162.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU163.106:PCI-MSI=
.23593020-edge.nvme0q60
      0.00          -100.0%       0.00        interrupts.CPU163.126:PCI-MSI=
.23593020-edge.nvme0q60
      1085 =C2=B1 31%     +48.7%       1614 =C2=B1 25%  interrupts.CPU163.C=
AL:Function_call_interrupts
      2.00            -5.0%       1.90 =C2=B1 15%  interrupts.CPU163.IWI:IR=
Q_work_interrupts
    605809            +0.1%     606644        interrupts.CPU163.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU163.MCP:Machine=
_check_polls
      8535            -5.1%       8096 =C2=B1 15%  interrupts.CPU163.NMI:No=
n-maskable_interrupts
      8535            -5.1%       8096 =C2=B1 15%  interrupts.CPU163.PMI:Pe=
rformance_monitoring_interrupts
    308.15            -0.0%     308.10        interrupts.CPU163.RES:Resched=
uling_interrupts
      2.46 =C2=B1 43%     -14.7%       2.10 =C2=B1 68%  interrupts.CPU163.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU164.107:PCI-MSI=
.23593021-edge.nvme0q61
      0.00          -100.0%       0.00        interrupts.CPU164.116:PCI-MSI=
.23593021-edge.nvme0q61
      1150 =C2=B1 27%     +40.4%       1614 =C2=B1 25%  interrupts.CPU164.C=
AL:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU164.IWI:IR=
Q_work_interrupts
    605918            +0.1%     606641        interrupts.CPU164.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU164.MCP:Machine=
_check_polls
      8536           -10.1%       7671 =C2=B1 22%  interrupts.CPU164.NMI:No=
n-maskable_interrupts
      8536           -10.1%       7671 =C2=B1 22%  interrupts.CPU164.PMI:Pe=
rformance_monitoring_interrupts
    319.46 =C2=B1 12%      -3.9%     307.00        interrupts.CPU164.RES:Re=
scheduling_interrupts
      2.38 =C2=B1 45%     -20.3%       1.90 =C2=B1 64%  interrupts.CPU164.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU165.109:PCI-MSI=
.23593022-edge.nvme0q62
      1099 =C2=B1 29%     +46.7%       1612 =C2=B1 25%  interrupts.CPU165.C=
AL:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU165.IWI:IR=
Q_work_interrupts
    605884            +0.1%     606650        interrupts.CPU165.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU165.MCP:Machine=
_check_polls
      8536           -10.1%       7670 =C2=B1 22%  interrupts.CPU165.NMI:No=
n-maskable_interrupts
      8536           -10.1%       7670 =C2=B1 22%  interrupts.CPU165.PMI:Pe=
rformance_monitoring_interrupts
    306.77           +10.0%     337.40 =C2=B1 26%  interrupts.CPU165.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 40%     -26.9%       1.80 =C2=B1 64%  interrupts.CPU165.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU166.109:PCI-MSI=
.23593023-edge.nvme0q63
      0.00          -100.0%       0.00        interrupts.CPU166.116:PCI-MSI=
.23593023-edge.nvme0q63
      1196 =C2=B1 28%     +35.0%       1615 =C2=B1 25%  interrupts.CPU166.C=
AL:Function_call_interrupts
      2.00           -15.0%       1.70 =C2=B1 26%  interrupts.CPU166.IWI:IR=
Q_work_interrupts
    605842            +0.1%     606680        interrupts.CPU166.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU166.MCP:Machine=
_check_polls
      8535           -15.1%       7244 =C2=B1 26%  interrupts.CPU166.NMI:No=
n-maskable_interrupts
      8535           -15.1%       7244 =C2=B1 26%  interrupts.CPU166.PMI:Pe=
rformance_monitoring_interrupts
    325.23 =C2=B1 18%      -5.0%     309.00        interrupts.CPU166.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 37%     -18.8%       2.00 =C2=B1 50%  interrupts.CPU166.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU167.117:PCI-MSI=
.23593024-edge.nvme0q64
      1098 =C2=B1 29%     +54.0%       1691 =C2=B1 26%  interrupts.CPU167.C=
AL:Function_call_interrupts
      2.00           -20.0%       1.60 =C2=B1 30%  interrupts.CPU167.IWI:IR=
Q_work_interrupts
    605835            +0.1%     606642        interrupts.CPU167.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU167.MCP:Machine=
_check_polls
      8536           -20.1%       6818 =C2=B1 30%  interrupts.CPU167.NMI:No=
n-maskable_interrupts
      8536           -20.1%       6818 =C2=B1 30%  interrupts.CPU167.PMI:Pe=
rformance_monitoring_interrupts
    307.15           +38.5%     425.40 =C2=B1 70%  interrupts.CPU167.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 40%     -22.8%       1.90 =C2=B1 59%  interrupts.CPU167.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU168.118:PCI-MSI=
.23593025-edge.nvme0q65
      0.00          -100.0%       0.00        interrupts.CPU168.121:PCI-MSI=
.23593025-edge.nvme0q65
     12795 =C2=B1 26%      -0.5%      12731 =C2=B1 26%  interrupts.CPU168.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 33%  interrupts.CPU168.I=
WI:IRQ_work_interrupts
    606063            +0.1%     606933        interrupts.CPU168.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU168.MCP:Machine=
_check_polls
      7134 =C2=B1 23%      -4.1%       6838 =C2=B1 26%  interrupts.CPU168.N=
MI:Non-maskable_interrupts
      7134 =C2=B1 23%      -4.1%       6838 =C2=B1 26%  interrupts.CPU168.P=
MI:Performance_monitoring_interrupts
    371.00 =C2=B1 34%      -5.7%     349.70 =C2=B1  8%  interrupts.CPU168.R=
ES:Rescheduling_interrupts
      1.77 =C2=B1 39%     +47.0%       2.60 =C2=B1124%  interrupts.CPU168.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU169.113:PCI-MSI=
.23593026-edge.nvme0q66
      0.00          -100.0%       0.00        interrupts.CPU169.119:PCI-MSI=
.23593026-edge.nvme0q66
      0.00          -100.0%       0.00        interrupts.CPU169.122:PCI-MSI=
.23593026-edge.nvme0q66
      0.00          -100.0%       0.00        interrupts.CPU169.141:PCI-MSI=
.23593026-edge.nvme0q66
      3468 =C2=B1 49%     +22.3%       4241 =C2=B1 44%  interrupts.CPU169.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 26%  interrupts.CPU169.I=
WI:IRQ_work_interrupts
    605994            +0.1%     606869        interrupts.CPU169.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU169.MCP:Machine=
_check_polls
      7135 =C2=B1 23%      -4.1%       6840 =C2=B1 26%  interrupts.CPU169.N=
MI:Non-maskable_interrupts
      7135 =C2=B1 23%      -4.1%       6840 =C2=B1 26%  interrupts.CPU169.P=
MI:Performance_monitoring_interrupts
    374.77 =C2=B1 10%      +9.6%     410.60 =C2=B1 19%  interrupts.CPU169.R=
ES:Rescheduling_interrupts
      2.15 =C2=B1 40%     -35.0%       1.40 =C2=B1 57%  interrupts.CPU169.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU17.161:PCI-MSI.=
23593074-edge.nvme0q114
      0.00          -100.0%       0.00        interrupts.CPU17.40:PCI-MSI.6=
9632-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU17.42:PCI-MSI.6=
9632-edge.ioat-msix
      1095 =C2=B1 29%     +47.4%       1614 =C2=B1 25%  interrupts.CPU17.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%     +18.2%       2.00        interrupts.CPU17.IWI:IRQ=
_work_interrupts
    606041            +0.1%     606750        interrupts.CPU17.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU17.MCP:Machine_=
check_polls
      6949 =C2=B1 27%     +18.1%       8204        interrupts.CPU17.NMI:Non=
-maskable_interrupts
      6949 =C2=B1 27%     +18.1%       8204        interrupts.CPU17.PMI:Per=
formance_monitoring_interrupts
    310.08            +0.6%     311.80        interrupts.CPU17.RES:Reschedu=
ling_interrupts
      2.46 =C2=B1 30%     -14.7%       2.10 =C2=B1 44%  interrupts.CPU17.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU170.120:PCI-MSI=
.23593027-edge.nvme0q67
      0.00          -100.0%       0.00        interrupts.CPU170.142:PCI-MSI=
.23593027-edge.nvme0q67
      1869 =C2=B1 73%     +23.3%       2304 =C2=B1 27%  interrupts.CPU170.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%      +0.5%       1.70 =C2=B1 26%  interrupts.CPU170.I=
WI:IRQ_work_interrupts
    605868            +0.1%     606728        interrupts.CPU170.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU170.MCP:Machine=
_check_polls
      6824 =C2=B1 27%      +0.2%       6840 =C2=B1 26%  interrupts.CPU170.N=
MI:Non-maskable_interrupts
      6824 =C2=B1 27%      +0.2%       6840 =C2=B1 26%  interrupts.CPU170.P=
MI:Performance_monitoring_interrupts
    374.31 =C2=B1 11%     +67.8%     628.00 =C2=B1 89%  interrupts.CPU170.R=
ES:Rescheduling_interrupts
      2.31 =C2=B1 39%     -30.7%       1.60 =C2=B1 57%  interrupts.CPU170.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU171.124:PCI-MSI=
.23593028-edge.nvme0q68
      0.00          -100.0%       0.00        interrupts.CPU171.147:PCI-MSI=
.23593028-edge.nvme0q68
      1144 =C2=B1 29%     +41.4%       1618 =C2=B1 25%  interrupts.CPU171.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%      +0.5%       1.70 =C2=B1 26%  interrupts.CPU171.I=
WI:IRQ_work_interrupts
    605824            +0.1%     606701        interrupts.CPU171.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU171.MCP:Machine=
_check_polls
      6824 =C2=B1 27%      +0.2%       6840 =C2=B1 26%  interrupts.CPU171.N=
MI:Non-maskable_interrupts
      6824 =C2=B1 27%      +0.2%       6840 =C2=B1 26%  interrupts.CPU171.P=
MI:Performance_monitoring_interrupts
    398.54 =C2=B1 60%     -22.6%     308.40        interrupts.CPU171.RES:Re=
scheduling_interrupts
      2.15 =C2=B1 30%     -25.7%       1.60 =C2=B1 57%  interrupts.CPU171.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU172.112:PCI-MSI=
.23593029-edge.nvme0q69
      0.00          -100.0%       0.00        interrupts.CPU172.122:PCI-MSI=
.23593029-edge.nvme0q69
      0.00          -100.0%       0.00        interrupts.CPU172.124:PCI-MSI=
.23593029-edge.nvme0q69
      0.00          -100.0%       0.00        interrupts.CPU172.144:PCI-MSI=
.23593029-edge.nvme0q69
      1318 =C2=B1 54%     +20.2%       1585 =C2=B1 26%  interrupts.CPU172.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%      +0.5%       1.70 =C2=B1 26%  interrupts.CPU172.I=
WI:IRQ_work_interrupts
    605844            +0.1%     606708        interrupts.CPU172.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU172.MCP:Machine=
_check_polls
      6825 =C2=B1 27%      +0.2%       6839 =C2=B1 26%  interrupts.CPU172.N=
MI:Non-maskable_interrupts
      6825 =C2=B1 27%      +0.2%       6839 =C2=B1 26%  interrupts.CPU172.P=
MI:Performance_monitoring_interrupts
    334.62 =C2=B1 27%      -5.5%     316.10 =C2=B1  3%  interrupts.CPU172.R=
ES:Rescheduling_interrupts
      2.46 =C2=B1 30%     -30.9%       1.70 =C2=B1 59%  interrupts.CPU172.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU173.122:PCI-MSI=
.23593030-edge.nvme0q70
      0.00          -100.0%       0.00        interrupts.CPU173.145:PCI-MSI=
.23593030-edge.nvme0q70
      1104 =C2=B1 28%     +46.0%       1612 =C2=B1 25%  interrupts.CPU173.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%      +6.4%       1.80 =C2=B1 22%  interrupts.CPU173.I=
WI:IRQ_work_interrupts
    605832            +0.1%     606713        interrupts.CPU173.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU173.MCP:Machine=
_check_polls
      6824 =C2=B1 27%      +0.2%       6840 =C2=B1 26%  interrupts.CPU173.N=
MI:Non-maskable_interrupts
      6824 =C2=B1 27%      +0.2%       6840 =C2=B1 26%  interrupts.CPU173.P=
MI:Performance_monitoring_interrupts
    314.23 =C2=B1  6%      -1.9%     308.20        interrupts.CPU173.RES:Re=
scheduling_interrupts
      2.23 =C2=B1 31%     -23.8%       1.70 =C2=B1 59%  interrupts.CPU173.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU174.118:PCI-MSI=
.23593031-edge.nvme0q71
      0.00          -100.0%       0.00        interrupts.CPU174.123:PCI-MSI=
.23593031-edge.nvme0q71
      0.00          -100.0%       0.00        interrupts.CPU174.124:PCI-MSI=
.23593031-edge.nvme0q71
      0.00          -100.0%       0.00        interrupts.CPU174.146:PCI-MSI=
.23593031-edge.nvme0q71
      1098 =C2=B1 29%     +48.1%       1626 =C2=B1 26%  interrupts.CPU174.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%     -11.4%       1.50 =C2=B1 33%  interrupts.CPU174.I=
WI:IRQ_work_interrupts
    605827            +0.1%     606641        interrupts.CPU174.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU174.MCP:Machine=
_check_polls
      6824 =C2=B1 27%     -11.6%       6034 =C2=B1 33%  interrupts.CPU174.N=
MI:Non-maskable_interrupts
      6824 =C2=B1 27%     -11.6%       6034 =C2=B1 33%  interrupts.CPU174.P=
MI:Performance_monitoring_interrupts
    307.62            +2.6%     315.70 =C2=B1  4%  interrupts.CPU174.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 34%     -22.8%       1.90 =C2=B1 59%  interrupts.CPU174.T=
LB:TLB_shootdowns
      1133 =C2=B1 28%     +42.5%       1615 =C2=B1 25%  interrupts.CPU175.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 26%  interrupts.CPU175.I=
WI:IRQ_work_interrupts
    605853            +0.1%     606756        interrupts.CPU175.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU175.MCP:Machine=
_check_polls
      7134 =C2=B1 23%      -4.1%       6840 =C2=B1 26%  interrupts.CPU175.N=
MI:Non-maskable_interrupts
      7134 =C2=B1 23%      -4.1%       6840 =C2=B1 26%  interrupts.CPU175.P=
MI:Performance_monitoring_interrupts
    318.69 =C2=B1 12%      +3.9%     331.20 =C2=B1 20%  interrupts.CPU175.R=
ES:Rescheduling_interrupts
      2.46 =C2=B1 37%     -18.8%       2.00 =C2=B1 59%  interrupts.CPU175.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU176.125:PCI-MSI=
.23593033-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.CPU176.126:PCI-MSI=
.23593033-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.CPU176.133:PCI-MSI=
.23593033-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.CPU176.135:PCI-MSI=
.23593033-edge.nvme0q73
      0.00          -100.0%       0.00        interrupts.CPU176.148:PCI-MSI=
.23593033-edge.nvme0q73
      1096 =C2=B1 29%     +47.0%       1612 =C2=B1 25%  interrupts.CPU176.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 33%  interrupts.CPU176.I=
WI:IRQ_work_interrupts
    605843            +0.1%     606714        interrupts.CPU176.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU176.MCP:Machine=
_check_polls
      7755 =C2=B1 13%     -11.8%       6839 =C2=B1 26%  interrupts.CPU176.N=
MI:Non-maskable_interrupts
      7755 =C2=B1 13%     -11.8%       6839 =C2=B1 26%  interrupts.CPU176.P=
MI:Performance_monitoring_interrupts
    306.46            +0.5%     308.10        interrupts.CPU176.RES:Resched=
uling_interrupts
      2.62 =C2=B1 35%     -23.5%       2.00 =C2=B1 59%  interrupts.CPU176.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU177.127:PCI-MSI=
.23593034-edge.nvme0q74
      0.00          -100.0%       0.00        interrupts.CPU177.130:PCI-MSI=
.23593034-edge.nvme0q74
      0.00          -100.0%       0.00        interrupts.CPU177.149:PCI-MSI=
.23593034-edge.nvme0q74
      1090 =C2=B1 30%     +60.0%       1744 =C2=B1 33%  interrupts.CPU177.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%     -11.6%       1.70 =C2=B1 26%  interrupts.CPU177.I=
WI:IRQ_work_interrupts
    605845            +0.1%     606713        interrupts.CPU177.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU177.MCP:Machine=
_check_polls
      7755 =C2=B1 13%     -11.8%       6839 =C2=B1 26%  interrupts.CPU177.N=
MI:Non-maskable_interrupts
      7755 =C2=B1 13%     -11.8%       6839 =C2=B1 26%  interrupts.CPU177.P=
MI:Performance_monitoring_interrupts
    307.54           +14.1%     351.00 =C2=B1 37%  interrupts.CPU177.RES:Re=
scheduling_interrupts
      4.77 =C2=B1153%     -58.1%       2.00 =C2=B1 59%  interrupts.CPU177.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU178.122:PCI-MSI=
.23593035-edge.nvme0q75
      0.00          -100.0%       0.00        interrupts.CPU178.127:PCI-MSI=
.23593035-edge.nvme0q75
      0.00          -100.0%       0.00        interrupts.CPU178.141:PCI-MSI=
.23593035-edge.nvme0q75
      1097 =C2=B1 29%     +47.2%       1614 =C2=B1 25%  interrupts.CPU178.C=
AL:Function_call_interrupts
      1.92 =C2=B1 13%     -16.8%       1.60 =C2=B1 30%  interrupts.CPU178.I=
WI:IRQ_work_interrupts
    605778            +0.2%     606694        interrupts.CPU178.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU178.MCP:Machine=
_check_polls
      7755 =C2=B1 13%     -17.0%       6436 =C2=B1 30%  interrupts.CPU178.N=
MI:Non-maskable_interrupts
      7755 =C2=B1 13%     -17.0%       6436 =C2=B1 30%  interrupts.CPU178.P=
MI:Performance_monitoring_interrupts
    306.85            +0.9%     309.70        interrupts.CPU178.RES:Resched=
uling_interrupts
      2.77 =C2=B1 25%     -27.8%       2.00 =C2=B1 59%  interrupts.CPU178.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU179.132:PCI-MSI=
.23593036-edge.nvme0q76
      0.00          -100.0%       0.00        interrupts.CPU179.138:PCI-MSI=
.23593036-edge.nvme0q76
      0.00          -100.0%       0.00        interrupts.CPU179.142:PCI-MSI=
.23593036-edge.nvme0q76
      1100 =C2=B1 29%     +53.3%       1686 =C2=B1 28%  interrupts.CPU179.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -9.6%       1.60 =C2=B1 30%  interrupts.CPU179.I=
WI:IRQ_work_interrupts
    605857            +0.1%     606690        interrupts.CPU179.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU179.MCP:Machine=
_check_polls
      7133 =C2=B1 23%      -9.8%       6435 =C2=B1 30%  interrupts.CPU179.N=
MI:Non-maskable_interrupts
      7133 =C2=B1 23%      -9.8%       6435 =C2=B1 30%  interrupts.CPU179.P=
MI:Performance_monitoring_interrupts
    309.46 =C2=B1  2%      +6.9%     330.70 =C2=B1 20%  interrupts.CPU179.R=
ES:Rescheduling_interrupts
      2.46 =C2=B1 34%     -18.8%       2.00 =C2=B1 59%  interrupts.CPU179.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU18.162:PCI-MSI.=
23593075-edge.nvme0q115
      0.00          -100.0%       0.00        interrupts.CPU18.164:PCI-MSI.=
23593075-edge.nvme0q115
      0.00          -100.0%       0.00        interrupts.CPU18.40:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU18.41:PCI-MSI.7=
1680-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU18.43:PCI-MSI.6=
9632-edge.ioat-msix
      1098 =C2=B1 29%     +46.6%       1610 =C2=B1 25%  interrupts.CPU18.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU18.IWI:IRQ=
_work_interrupts
    606066            +0.1%     606732        interrupts.CPU18.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU18.MCP:Machine_=
check_polls
      7265 =C2=B1 23%     +12.9%       8204        interrupts.CPU18.NMI:Non=
-maskable_interrupts
      7265 =C2=B1 23%     +12.9%       8204        interrupts.CPU18.PMI:Per=
formance_monitoring_interrupts
    317.54 =C2=B1  8%      -1.2%     313.70        interrupts.CPU18.RES:Res=
cheduling_interrupts
      2.54 =C2=B1 29%     -21.2%       2.00 =C2=B1 44%  interrupts.CPU18.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU180.124:PCI-MSI=
.23593037-edge.nvme0q77
      1098 =C2=B1 29%     +46.8%       1612 =C2=B1 25%  interrupts.CPU180.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU180.I=
WI:IRQ_work_interrupts
    605816            +0.1%     606709        interrupts.CPU180.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU180.MCP:Machine=
_check_polls
      7133 =C2=B1 23%      +1.5%       7241 =C2=B1 22%  interrupts.CPU180.N=
MI:Non-maskable_interrupts
      7133 =C2=B1 23%      +1.5%       7241 =C2=B1 22%  interrupts.CPU180.P=
MI:Performance_monitoring_interrupts
    307.15            +0.3%     308.00        interrupts.CPU180.RES:Resched=
uling_interrupts
      2.54 =C2=B1 33%     -21.2%       2.00 =C2=B1 59%  interrupts.CPU180.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU181.131:PCI-MSI=
.23593038-edge.nvme0q78
      0.00          -100.0%       0.00        interrupts.CPU181.153:PCI-MSI=
.23593038-edge.nvme0q78
      1096 =C2=B1 29%     +46.9%       1610 =C2=B1 25%  interrupts.CPU181.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU181.I=
WI:IRQ_work_interrupts
    605786            +0.1%     606684        interrupts.CPU181.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU181.MCP:Machine=
_check_polls
      7133 =C2=B1 23%      +1.5%       7243 =C2=B1 22%  interrupts.CPU181.N=
MI:Non-maskable_interrupts
      7133 =C2=B1 23%      +1.5%       7243 =C2=B1 22%  interrupts.CPU181.P=
MI:Performance_monitoring_interrupts
    309.31 =C2=B1  2%      -0.5%     307.80        interrupts.CPU181.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 37%     -22.8%       1.90 =C2=B1 59%  interrupts.CPU181.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU182.154:PCI-MSI=
.23593039-edge.nvme0q79
      1096 =C2=B1 29%     +47.8%       1619 =C2=B1 25%  interrupts.CPU182.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%     +12.3%       1.90 =C2=B1 15%  interrupts.CPU182.I=
WI:IRQ_work_interrupts
    605844            +0.1%     606679        interrupts.CPU182.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU182.MCP:Machine=
_check_polls
      6823 =C2=B1 27%     +12.0%       7644 =C2=B1 15%  interrupts.CPU182.N=
MI:Non-maskable_interrupts
      6823 =C2=B1 27%     +12.0%       7644 =C2=B1 15%  interrupts.CPU182.P=
MI:Performance_monitoring_interrupts
    307.54            +2.2%     314.40 =C2=B1  4%  interrupts.CPU182.RES:Re=
scheduling_interrupts
      2.46 =C2=B1 40%     +13.7%       2.80 =C2=B1103%  interrupts.CPU182.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU183.136:PCI-MSI=
.23593040-edge.nvme0q80
      0.00          -100.0%       0.00        interrupts.CPU183.142:PCI-MSI=
.23593040-edge.nvme0q80
      0.00          -100.0%       0.00        interrupts.CPU183.155:PCI-MSI=
.23593040-edge.nvme0q80
      1278 =C2=B1 37%     +26.0%       1611 =C2=B1 25%  interrupts.CPU183.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -3.9%       1.70 =C2=B1 26%  interrupts.CPU183.I=
WI:IRQ_work_interrupts
    605805            +0.1%     606695        interrupts.CPU183.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU183.MCP:Machine=
_check_polls
      7133 =C2=B1 23%      -4.1%       6840 =C2=B1 26%  interrupts.CPU183.N=
MI:Non-maskable_interrupts
      7133 =C2=B1 23%      -4.1%       6840 =C2=B1 26%  interrupts.CPU183.P=
MI:Performance_monitoring_interrupts
    358.69 =C2=B1 36%     -14.4%     307.10        interrupts.CPU183.RES:Re=
scheduling_interrupts
      2.31 =C2=B1 42%     -13.3%       2.00 =C2=B1 59%  interrupts.CPU183.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU184.142:PCI-MSI=
.23593049-edge.nvme0q89
      0.00          -100.0%       0.00        interrupts.CPU184.145:PCI-MSI=
.23593049-edge.nvme0q89
      1103 =C2=B1 29%     +46.2%       1613 =C2=B1 25%  interrupts.CPU184.C=
AL:Function_call_interrupts
      1.85 =C2=B1 19%      -7.9%       1.70 =C2=B1 26%  interrupts.CPU184.I=
WI:IRQ_work_interrupts
    605803            +0.1%     606678        interrupts.CPU184.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU184.MCP:Machine=
_check_polls
      7444 =C2=B1 19%      -8.1%       6840 =C2=B1 26%  interrupts.CPU184.N=
MI:Non-maskable_interrupts
      7444 =C2=B1 19%      -8.1%       6840 =C2=B1 26%  interrupts.CPU184.P=
MI:Performance_monitoring_interrupts
    308.69 =C2=B1  2%      +0.5%     310.20 =C2=B1  2%  interrupts.CPU184.R=
ES:Rescheduling_interrupts
      2.38 =C2=B1 38%     -16.1%       2.00 =C2=B1 54%  interrupts.CPU184.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU185.137:PCI-MSI=
.23593050-edge.nvme0q90
      0.00          -100.0%       0.00        interrupts.CPU185.165:PCI-MSI=
.23593050-edge.nvme0q90
      1097 =C2=B1 29%     +46.8%       1611 =C2=B1 25%  interrupts.CPU185.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -9.6%       1.60 =C2=B1 30%  interrupts.CPU185.I=
WI:IRQ_work_interrupts
    605804            +0.1%     606695        interrupts.CPU185.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU185.MCP:Machine=
_check_polls
      7132 =C2=B1 23%      -9.8%       6436 =C2=B1 30%  interrupts.CPU185.N=
MI:Non-maskable_interrupts
      7132 =C2=B1 23%      -9.8%       6436 =C2=B1 30%  interrupts.CPU185.P=
MI:Performance_monitoring_interrupts
    307.69            -0.2%     307.10        interrupts.CPU185.RES:Resched=
uling_interrupts
      2.38 =C2=B1 38%     -20.3%       1.90 =C2=B1 64%  interrupts.CPU185.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU186.143:PCI-MSI=
.23593051-edge.nvme0q91
      1099 =C2=B1 29%     +46.9%       1614 =C2=B1 25%  interrupts.CPU186.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      -9.6%       1.60 =C2=B1 30%  interrupts.CPU186.I=
WI:IRQ_work_interrupts
    605794            +0.1%     606695        interrupts.CPU186.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU186.MCP:Machine=
_check_polls
      7132 =C2=B1 23%      -9.8%       6436 =C2=B1 30%  interrupts.CPU186.N=
MI:Non-maskable_interrupts
      7132 =C2=B1 23%      -9.8%       6436 =C2=B1 30%  interrupts.CPU186.P=
MI:Performance_monitoring_interrupts
    307.54            +0.1%     307.70        interrupts.CPU186.RES:Resched=
uling_interrupts
      2.54 =C2=B1 36%     -25.2%       1.90 =C2=B1 64%  interrupts.CPU186.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU187.144:PCI-MSI=
.23593052-edge.nvme0q92
      1098 =C2=B1 29%     +46.7%       1611 =C2=B1 25%  interrupts.CPU187.C=
AL:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU187.I=
WI:IRQ_work_interrupts
    605780            +0.2%     606694        interrupts.CPU187.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU187.MCP:Machine=
_check_polls
      7132 =C2=B1 23%      +1.5%       7241 =C2=B1 22%  interrupts.CPU187.N=
MI:Non-maskable_interrupts
      7132 =C2=B1 23%      +1.5%       7241 =C2=B1 22%  interrupts.CPU187.P=
MI:Performance_monitoring_interrupts
    307.92            +0.3%     308.70        interrupts.CPU187.RES:Resched=
uling_interrupts
      2.46 =C2=B1 34%     -22.8%       1.90 =C2=B1 64%  interrupts.CPU187.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU188.146:PCI-MSI=
.23593053-edge.nvme0q93
      1114 =C2=B1 30%     +44.4%       1610 =C2=B1 25%  interrupts.CPU188.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%      -5.5%       1.60 =C2=B1 30%  interrupts.CPU188.I=
WI:IRQ_work_interrupts
    605853            +0.1%     606701        interrupts.CPU188.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU188.MCP:Machine=
_check_polls
      6822 =C2=B1 27%      -5.7%       6436 =C2=B1 30%  interrupts.CPU188.N=
MI:Non-maskable_interrupts
      6822 =C2=B1 27%      -5.7%       6436 =C2=B1 30%  interrupts.CPU188.P=
MI:Performance_monitoring_interrupts
    378.77 =C2=B1 64%     -18.8%     307.60        interrupts.CPU188.RES:Re=
scheduling_interrupts
      3.08 =C2=B1 79%     -35.0%       2.00 =C2=B1 54%  interrupts.CPU188.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU189.146:PCI-MSI=
.23593054-edge.nvme0q94
      1144 =C2=B1 28%     +40.9%       1612 =C2=B1 25%  interrupts.CPU189.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%      -5.5%       1.60 =C2=B1 30%  interrupts.CPU189.I=
WI:IRQ_work_interrupts
    605784            +0.2%     606696        interrupts.CPU189.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU189.MCP:Machine=
_check_polls
      6822 =C2=B1 27%      -5.7%       6436 =C2=B1 30%  interrupts.CPU189.N=
MI:Non-maskable_interrupts
      6822 =C2=B1 27%      -5.7%       6436 =C2=B1 30%  interrupts.CPU189.P=
MI:Performance_monitoring_interrupts
    318.69 =C2=B1 11%      -1.1%     315.20 =C2=B1  6%  interrupts.CPU189.R=
ES:Rescheduling_interrupts
      2.31 =C2=B1 35%     -17.7%       1.90 =C2=B1 64%  interrupts.CPU189.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU19.163:PCI-MSI.=
23593076-edge.nvme0q116
      0.00          -100.0%       0.00        interrupts.CPU19.169:PCI-MSI.=
23593076-edge.nvme0q116
      0.00          -100.0%       0.00        interrupts.CPU19.172:PCI-MSI.=
71680-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU19.42:PCI-MSI.7=
3728-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU19.43:PCI-MSI.7=
1680-edge.ioat-msix
      1095 =C2=B1 29%     +47.6%       1617 =C2=B1 24%  interrupts.CPU19.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU19.IWI:IRQ=
_work_interrupts
    606075            +0.1%     606806        interrupts.CPU19.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU19.MCP:Machine_=
check_polls
      7264 =C2=B1 23%     +12.9%       8203        interrupts.CPU19.NMI:Non=
-maskable_interrupts
      7264 =C2=B1 23%     +12.9%       8203        interrupts.CPU19.PMI:Per=
formance_monitoring_interrupts
    310.54            +2.7%     318.90 =C2=B1  4%  interrupts.CPU19.RES:Res=
cheduling_interrupts
      2.54 =C2=B1 29%     -21.2%       2.00 =C2=B1 50%  interrupts.CPU19.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU190.142:PCI-MSI=
.23593055-edge.nvme0q95
      0.00          -100.0%       0.00        interrupts.CPU190.147:PCI-MSI=
.23593055-edge.nvme0q95
      0.00          -100.0%       0.00        interrupts.CPU190.161:PCI-MSI=
.23593055-edge.nvme0q95
      1108 =C2=B1 28%     +45.4%       1610 =C2=B1 25%  interrupts.CPU190.C=
AL:Function_call_interrupts
      1.69 =C2=B1 27%      -5.5%       1.60 =C2=B1 30%  interrupts.CPU190.I=
WI:IRQ_work_interrupts
    605764            +0.2%     606689        interrupts.CPU190.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU190.MCP:Machine=
_check_polls
      6823 =C2=B1 27%      -5.7%       6436 =C2=B1 30%  interrupts.CPU190.N=
MI:Non-maskable_interrupts
      6823 =C2=B1 27%      -5.7%       6436 =C2=B1 30%  interrupts.CPU190.P=
MI:Performance_monitoring_interrupts
    309.85            -0.6%     308.10        interrupts.CPU190.RES:Resched=
uling_interrupts
      2.46 =C2=B1 37%     -22.8%       1.90 =C2=B1 64%  interrupts.CPU190.T=
LB:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU191.143:PCI-MSI=
.23593056-edge.nvme0q96
      0.00          -100.0%       0.00        interrupts.CPU191.148:PCI-MSI=
.23593056-edge.nvme0q96
      0.00          -100.0%       0.00        interrupts.CPU191.149:PCI-MSI=
.23593056-edge.nvme0q96
      1172 =C2=B1 27%     +44.1%       1690 =C2=B1 24%  interrupts.CPU191.C=
AL:Function_call_interrupts
      2.08 =C2=B1 39%      +1.1%       2.10 =C2=B1 33%  interrupts.CPU191.I=
WI:IRQ_work_interrupts
    605885            +0.2%     606797        interrupts.CPU191.LOC:Local_t=
imer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU191.MCP:Machine=
_check_polls
      6515 =C2=B1 30%      -1.1%       6440 =C2=B1 30%  interrupts.CPU191.N=
MI:Non-maskable_interrupts
      6515 =C2=B1 30%      -1.1%       6440 =C2=B1 30%  interrupts.CPU191.P=
MI:Performance_monitoring_interrupts
    344.23 =C2=B1  2%      +3.5%     356.20 =C2=B1  6%  interrupts.CPU191.R=
ES:Rescheduling_interrupts
      4.69 =C2=B1 66%      +2.3%       4.80 =C2=B1 67%  interrupts.CPU191.T=
LB:TLB_shootdowns
      2331 =C2=B1 61%     +11.9%       2608 =C2=B1 39%  interrupts.CPU2.CAL=
:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU2.IWI:IRQ_=
work_interrupts
    606041            +0.1%     606838        interrupts.CPU2.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU2.MCP:Machine_c=
heck_polls
      7263 =C2=B1 23%     +13.0%       8204        interrupts.CPU2.NMI:Non-=
maskable_interrupts
      7263 =C2=B1 23%     +13.0%       8204        interrupts.CPU2.PMI:Perf=
ormance_monitoring_interrupts
    468.46 =C2=B1 25%      +4.1%     487.60 =C2=B1 31%  interrupts.CPU2.RES=
:Rescheduling_interrupts
      2.23 =C2=B1 31%     -41.7%       1.30 =C2=B1 60%  interrupts.CPU2.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU20.160:PCI-MSI.=
23593077-edge.nvme0q117
      0.00          -100.0%       0.00        interrupts.CPU20.166:PCI-MSI.=
23593077-edge.nvme0q117
      0.00          -100.0%       0.00        interrupts.CPU20.172:PCI-MSI.=
73728-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU20.179:PCI-MSI.=
23593077-edge.nvme0q117
      0.00          -100.0%       0.00        interrupts.CPU20.42:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU20.43:PCI-MSI.7=
3728-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU20.43:PCI-MSI.7=
5776-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU20.45:PCI-MSI.7=
5776-edge.ioat-msix
      1103 =C2=B1 28%     +46.3%       1615 =C2=B1 24%  interrupts.CPU20.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%     +18.2%       2.00        interrupts.CPU20.IWI:IRQ=
_work_interrupts
    606053            +0.1%     606769        interrupts.CPU20.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU20.MCP:Machine_=
check_polls
      6949 =C2=B1 27%     +18.1%       8203        interrupts.CPU20.NMI:Non=
-maskable_interrupts
      6949 =C2=B1 27%     +18.1%       8203        interrupts.CPU20.PMI:Per=
formance_monitoring_interrupts
    315.23 =C2=B1  4%      +3.7%     326.80 =C2=B1 12%  interrupts.CPU20.RE=
S:Rescheduling_interrupts
      2.46 =C2=B1 30%     -22.8%       1.90 =C2=B1 43%  interrupts.CPU20.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU21.164:PCI-MSI.=
23593078-edge.nvme0q118
      0.00          -100.0%       0.00        interrupts.CPU21.173:PCI-MSI.=
73728-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU21.44:PCI-MSI.7=
5776-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU21.44:PCI-MSI.7=
7824-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU21.46:PCI-MSI.7=
5776-edge.ioat-msix
      1096 =C2=B1 29%     +47.9%       1621 =C2=B1 25%  interrupts.CPU21.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU21.IWI:IRQ=
_work_interrupts
    606096            +0.1%     606855        interrupts.CPU21.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU21.MCP:Machine_=
check_polls
      7581 =C2=B1 19%      +8.2%       8203        interrupts.CPU21.NMI:Non=
-maskable_interrupts
      7581 =C2=B1 19%      +8.2%       8203        interrupts.CPU21.PMI:Per=
formance_monitoring_interrupts
    309.85            +2.0%     316.00 =C2=B1  3%  interrupts.CPU21.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 30%     -22.8%       1.90 =C2=B1 43%  interrupts.CPU21.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU22.168:PCI-MSI.=
23593079-edge.nvme0q119
      0.00          -100.0%       0.00        interrupts.CPU22.171:PCI-MSI.=
23593079-edge.nvme0q119
      0.00          -100.0%       0.00        interrupts.CPU22.174:PCI-MSI.=
75776-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU22.44:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU22.45:PCI-MSI.7=
7824-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU22.45:PCI-MSI.7=
9872-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU22.47:PCI-MSI.7=
7824-edge.ioat-msix
      1098 =C2=B1 29%     +43.7%       1579 =C2=B1 26%  interrupts.CPU22.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      +4.0%       2.00        interrupts.CPU22.IWI:IRQ=
_work_interrupts
    606136            +0.1%     606787        interrupts.CPU22.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU22.MCP:Machine_=
check_polls
      7897 =C2=B1 13%      +3.9%       8203        interrupts.CPU22.NMI:Non=
-maskable_interrupts
      7897 =C2=B1 13%      +3.9%       8203        interrupts.CPU22.PMI:Per=
formance_monitoring_interrupts
    383.15 =C2=B1 65%     -14.2%     328.70 =C2=B1 15%  interrupts.CPU22.RE=
S:Rescheduling_interrupts
      2.54 =C2=B1 29%      -5.5%       2.40 =C2=B1 42%  interrupts.CPU22.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU23.167:PCI-MSI.=
23593080-edge.nvme0q120
      0.00          -100.0%       0.00        interrupts.CPU23.175:PCI-MSI.=
23593080-edge.nvme0q120
      0.00          -100.0%       0.00        interrupts.CPU23.175:PCI-MSI.=
75776-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU23.175:PCI-MSI.=
77824-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU23.186:PCI-MSI.=
23593080-edge.nvme0q120
      0.00          -100.0%       0.00        interrupts.CPU23.45:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU23.46:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU23.46:PCI-MSI.7=
9872-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU23.47:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU23.50:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU23.52:PCI-MSI.2=
3592960-edge.nvme0q0
      1067 =C2=B1 26%     +42.7%       1523 =C2=B1 28%  interrupts.CPU23.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU23.IWI:IRQ=
_work_interrupts
    606071            +0.1%     606786        interrupts.CPU23.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU23.MCP:Machine_=
check_polls
      7580 =C2=B1 19%      +8.2%       8202        interrupts.CPU23.NMI:Non=
-maskable_interrupts
      7580 =C2=B1 19%      +8.2%       8202        interrupts.CPU23.PMI:Per=
formance_monitoring_interrupts
    311.92            +0.1%     312.10        interrupts.CPU23.RES:Reschedu=
ling_interrupts
      2.38 =C2=B1 35%      -7.7%       2.20 =C2=B1 48%  interrupts.CPU23.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU24.178:PCI-MSI.=
33619968-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU24.179:PCI-MSI.=
33619968-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU24.47:PCI-MSI.3=
3619968-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU24.48:PCI-MSI.3=
3619968-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU24.49:PCI-MSI.3=
3619968-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU24.51:PCI-MSI.3=
3619968-edge.ioat-msix
      1254 =C2=B1 23%     +43.1%       1795 =C2=B1 26%  interrupts.CPU24.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU24.IWI:IRQ=
_work_interrupts
    606091            +0.1%     606783        interrupts.CPU24.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU24.MCP:Machine_=
check_polls
      7557 =C2=B1 19%      +8.2%       8176        interrupts.CPU24.NMI:Non=
-maskable_interrupts
      7557 =C2=B1 19%      +8.2%       8176        interrupts.CPU24.PMI:Per=
formance_monitoring_interrupts
    349.08 =C2=B1  9%      -1.9%     342.60 =C2=B1  8%  interrupts.CPU24.RE=
S:Rescheduling_interrupts
     35.08 =C2=B1324%     -94.9%       1.80 =C2=B1 54%  interrupts.CPU24.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU25.180:PCI-MSI.=
33622016-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU25.181:PCI-MSI.=
33622016-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU25.49:PCI-MSI.3=
3622016-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU25.50:PCI-MSI.3=
3622016-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU25.51:PCI-MSI.3=
3622016-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU25.52:PCI-MSI.3=
3622016-edge.ioat-msix
      2200 =C2=B1 39%     +43.2%       3150 =C2=B1 41%  interrupts.CPU25.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU25.IWI:IRQ=
_work_interrupts
    606121            +0.1%     606826        interrupts.CPU25.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU25.MCP:Machine_=
check_polls
      7558 =C2=B1 19%      +8.2%       8177        interrupts.CPU25.NMI:Non=
-maskable_interrupts
      7558 =C2=B1 19%      +8.2%       8177        interrupts.CPU25.PMI:Per=
formance_monitoring_interrupts
    386.54 =C2=B1 13%      +3.1%     398.50 =C2=B1 18%  interrupts.CPU25.RE=
S:Rescheduling_interrupts
      1.77 =C2=B1 59%     -15.2%       1.50 =C2=B1 44%  interrupts.CPU25.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU26.181:PCI-MSI.=
33624064-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU26.182:PCI-MSI.=
33624064-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU26.50:PCI-MSI.3=
3624064-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU26.51:PCI-MSI.3=
3624064-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU26.52:PCI-MSI.3=
3624064-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU26.53:PCI-MSI.3=
3624064-edge.ioat-msix
      2124 =C2=B1 50%     +29.0%       2741 =C2=B1 31%  interrupts.CPU26.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      +4.0%       2.00        interrupts.CPU26.IWI:IRQ=
_work_interrupts
    606101            +0.1%     606763        interrupts.CPU26.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU26.MCP:Machine_=
check_polls
      7873 =C2=B1 13%      +3.9%       8178        interrupts.CPU26.NMI:Non=
-maskable_interrupts
      7873 =C2=B1 13%      +3.9%       8178        interrupts.CPU26.PMI:Per=
formance_monitoring_interrupts
    405.08 =C2=B1 28%     +15.7%     468.60 =C2=B1 24%  interrupts.CPU26.RE=
S:Rescheduling_interrupts
      1.85 =C2=B1 41%      +2.9%       1.90 =C2=B1 54%  interrupts.CPU26.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU27.182:PCI-MSI.=
33626112-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU27.182:PCI-MSI.=
33628160-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU27.183:PCI-MSI.=
33626112-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU27.51:PCI-MSI.3=
3626112-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU27.52:PCI-MSI.3=
3626112-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU27.53:PCI-MSI.3=
3626112-edge.ioat-msix
      1135 =C2=B1 28%     +49.2%       1694 =C2=B1 27%  interrupts.CPU27.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -1.2%       1.90 =C2=B1 15%  interrupts.CPU27.IW=
I:IRQ_work_interrupts
    606096            +0.1%     606742        interrupts.CPU27.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU27.MCP:Machine_=
check_polls
      7874 =C2=B1 13%      -1.3%       7769 =C2=B1 15%  interrupts.CPU27.NM=
I:Non-maskable_interrupts
      7874 =C2=B1 13%      -1.3%       7769 =C2=B1 15%  interrupts.CPU27.PM=
I:Performance_monitoring_interrupts
    336.54 =C2=B1 23%      -4.1%     322.80 =C2=B1 11%  interrupts.CPU27.RE=
S:Rescheduling_interrupts
      2.00 =C2=B1 43%      -5.0%       1.90 =C2=B1 54%  interrupts.CPU27.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU28.183:PCI-MSI.=
33628160-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU28.184:PCI-MSI.=
33628160-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU28.52:PCI-MSI.3=
3628160-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU28.53:PCI-MSI.3=
3628160-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU28.54:PCI-MSI.3=
3628160-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU28.55:PCI-MSI.3=
3628160-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU28.57:PCI-MSI.3=
3626112-edge.ioat-msix
      1246 =C2=B1 40%     +60.0%       1994 =C2=B1 70%  interrupts.CPU28.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU28.IW=
I:IRQ_work_interrupts
    606119            +0.1%     606768        interrupts.CPU28.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU28.MCP:Machine_=
check_polls
      7559 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU28.NM=
I:Non-maskable_interrupts
      7559 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU28.PM=
I:Performance_monitoring_interrupts
    361.62 =C2=B1 42%      +3.0%     372.60 =C2=B1 50%  interrupts.CPU28.RE=
S:Rescheduling_interrupts
      2.15 =C2=B1 40%      -7.1%       2.00 =C2=B1 54%  interrupts.CPU28.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU29.184:PCI-MSI.=
33630208-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU29.185:PCI-MSI.=
33630208-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU29.53:PCI-MSI.3=
3630208-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU29.54:PCI-MSI.3=
3630208-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU29.55:PCI-MSI.3=
3630208-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU29.56:PCI-MSI.3=
3630208-edge.ioat-msix
      1094 =C2=B1 33%    +131.0%       2528 =C2=B1 82%  interrupts.CPU29.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU29.IW=
I:IRQ_work_interrupts
    606077            +0.1%     606789        interrupts.CPU29.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU29.MCP:Machine_=
check_polls
      7558 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU29.NM=
I:Non-maskable_interrupts
      7558 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU29.PM=
I:Performance_monitoring_interrupts
    312.85 =C2=B1  2%     +53.5%     480.30 =C2=B1 75%  interrupts.CPU29.RE=
S:Rescheduling_interrupts
      2.15 =C2=B1 35%      -7.1%       2.00 =C2=B1 54%  interrupts.CPU29.TL=
B:TLB_shootdowns
      1195 =C2=B1 43%     +56.6%       1872 =C2=B1 34%  interrupts.CPU3.CAL=
:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU3.IWI=
:IRQ_work_interrupts
    606016            +0.1%     606725        interrupts.CPU3.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU3.MCP:Machine_c=
heck_polls
      7265 =C2=B1 23%      +7.3%       7796 =C2=B1 15%  interrupts.CPU3.NMI=
:Non-maskable_interrupts
      7265 =C2=B1 23%      +7.3%       7796 =C2=B1 15%  interrupts.CPU3.PMI=
:Performance_monitoring_interrupts
    347.54 =C2=B1 11%     +17.8%     409.40 =C2=B1 39%  interrupts.CPU3.RES=
:Rescheduling_interrupts
      2.31 =C2=B1 31%     -22.0%       1.80 =C2=B1 54%  interrupts.CPU3.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU30.184:PCI-MSI.=
33632256-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU30.185:PCI-MSI.=
33632256-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU30.186:PCI-MSI.=
33632256-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU30.54:PCI-MSI.3=
3632256-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU30.55:PCI-MSI.3=
3632256-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU30.56:PCI-MSI.3=
3632256-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU30.57:PCI-MSI.3=
3632256-edge.ioat-msix
      1203 =C2=B1 29%     +34.0%       1612 =C2=B1 25%  interrupts.CPU30.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU30.IW=
I:IRQ_work_interrupts
    606064            +0.1%     606770        interrupts.CPU30.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU30.MCP:Machine_=
check_polls
      7558 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU30.NM=
I:Non-maskable_interrupts
      7558 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU30.PM=
I:Performance_monitoring_interrupts
    346.00 =C2=B1 25%     -10.7%     309.00        interrupts.CPU30.RES:Res=
cheduling_interrupts
      2.23 =C2=B1 35%     -14.8%       1.90 =C2=B1 43%  interrupts.CPU30.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU31.185:PCI-MSI.=
33634304-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU31.186:PCI-MSI.=
33634304-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU31.187:PCI-MSI.=
33634304-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU31.55:PCI-MSI.3=
3634304-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU31.56:PCI-MSI.3=
3634304-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU31.57:PCI-MSI.3=
3634304-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU31.58:PCI-MSI.3=
3634304-edge.ioat-msix
      1204 =C2=B1 37%     +36.9%       1649 =C2=B1 26%  interrupts.CPU31.CA=
L:Function_call_interrupts
      1.85 =C2=B1 28%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU31.IW=
I:IRQ_work_interrupts
    606091            +0.1%     606766        interrupts.CPU31.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU31.MCP:Machine_=
check_polls
      7242 =C2=B1 23%      +1.6%       7360 =C2=B1 22%  interrupts.CPU31.NM=
I:Non-maskable_interrupts
      7242 =C2=B1 23%      +1.6%       7360 =C2=B1 22%  interrupts.CPU31.PM=
I:Performance_monitoring_interrupts
    410.38 =C2=B1 62%     -15.1%     348.50 =C2=B1 26%  interrupts.CPU31.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 35%     -17.7%       1.90 =C2=B1 54%  interrupts.CPU31.TL=
B:TLB_shootdowns
      1124 =C2=B1 29%     +43.4%       1612 =C2=B1 25%  interrupts.CPU32.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU32.IW=
I:IRQ_work_interrupts
    606111            +0.1%     606773        interrupts.CPU32.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU32.MCP:Machine_=
check_polls
      7243 =C2=B1 23%      +1.6%       7360 =C2=B1 22%  interrupts.CPU32.NM=
I:Non-maskable_interrupts
      7243 =C2=B1 23%      +1.6%       7360 =C2=B1 22%  interrupts.CPU32.PM=
I:Performance_monitoring_interrupts
    310.46            -0.5%     308.90        interrupts.CPU32.RES:Reschedu=
ling_interrupts
      3.23 =C2=B1 67%     -31.9%       2.20 =C2=B1 48%  interrupts.CPU32.TL=
B:TLB_shootdowns
      1102 =C2=B1 29%     +63.2%       1798 =C2=B1 49%  interrupts.CPU33.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU33.IW=
I:IRQ_work_interrupts
    606136            +0.1%     606802        interrupts.CPU33.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU33.MCP:Machine_=
check_polls
      7242 =C2=B1 23%      +1.6%       7360 =C2=B1 22%  interrupts.CPU33.NM=
I:Non-maskable_interrupts
      7242 =C2=B1 23%      +1.6%       7360 =C2=B1 22%  interrupts.CPU33.PM=
I:Performance_monitoring_interrupts
    310.46 =C2=B1  2%     +14.0%     353.90 =C2=B1 38%  interrupts.CPU33.RE=
S:Rescheduling_interrupts
      2.08 =C2=B1 35%    +169.6%       5.60 =C2=B1199%  interrupts.CPU33.TL=
B:TLB_shootdowns
      1116 =C2=B1 28%     +45.8%       1627 =C2=B1 25%  interrupts.CPU34.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU34.IW=
I:IRQ_work_interrupts
    606086            +0.1%     606757        interrupts.CPU34.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU34.MCP:Machine_=
check_polls
      7558 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU34.NM=
I:Non-maskable_interrupts
      7558 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU34.PM=
I:Performance_monitoring_interrupts
    319.15 =C2=B1  7%      -2.6%     310.70        interrupts.CPU34.RES:Res=
cheduling_interrupts
      2.31 =C2=B1 39%     -13.3%       2.00 =C2=B1 44%  interrupts.CPU34.TL=
B:TLB_shootdowns
      1116 =C2=B1 28%     +44.2%       1610 =C2=B1 25%  interrupts.CPU35.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%     +12.3%       1.90 =C2=B1 15%  interrupts.CPU35.IW=
I:IRQ_work_interrupts
    606054            +0.1%     606766        interrupts.CPU35.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU35.MCP:Machine_=
check_polls
      6927 =C2=B1 27%     +12.1%       7768 =C2=B1 15%  interrupts.CPU35.NM=
I:Non-maskable_interrupts
      6927 =C2=B1 27%     +12.1%       7768 =C2=B1 15%  interrupts.CPU35.PM=
I:Performance_monitoring_interrupts
    310.15            +0.8%     312.50 =C2=B1  3%  interrupts.CPU35.RES:Res=
cheduling_interrupts
      2.15 =C2=B1 35%      -7.1%       2.00 =C2=B1 44%  interrupts.CPU35.TL=
B:TLB_shootdowns
      1134 =C2=B1 27%     +42.2%       1613 =C2=B1 25%  interrupts.CPU36.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU36.IW=
I:IRQ_work_interrupts
    606129            +0.1%     606758        interrupts.CPU36.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU36.MCP:Machine_=
check_polls
      7873 =C2=B1 13%      -6.5%       7359 =C2=B1 22%  interrupts.CPU36.NM=
I:Non-maskable_interrupts
      7873 =C2=B1 13%      -6.5%       7359 =C2=B1 22%  interrupts.CPU36.PM=
I:Performance_monitoring_interrupts
    388.23 =C2=B1 62%     -20.5%     308.50        interrupts.CPU36.RES:Res=
cheduling_interrupts
      2.62 =C2=B1 66%     -23.5%       2.00 =C2=B1 54%  interrupts.CPU36.TL=
B:TLB_shootdowns
      1097 =C2=B1 29%     +47.0%       1612 =C2=B1 25%  interrupts.CPU37.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU37.IW=
I:IRQ_work_interrupts
    606063            +0.1%     606759        interrupts.CPU37.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU37.MCP:Machine_=
check_polls
      7559 =C2=B1 19%      -2.6%       7359 =C2=B1 22%  interrupts.CPU37.NM=
I:Non-maskable_interrupts
      7559 =C2=B1 19%      -2.6%       7359 =C2=B1 22%  interrupts.CPU37.PM=
I:Performance_monitoring_interrupts
    312.38 =C2=B1  2%      -0.9%     309.50        interrupts.CPU37.RES:Res=
cheduling_interrupts
      2.23 =C2=B1 35%     -14.8%       1.90 =C2=B1 54%  interrupts.CPU37.TL=
B:TLB_shootdowns
      1139 =C2=B1 28%     +39.3%       1587 =C2=B1 28%  interrupts.CPU38.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU38.IW=
I:IRQ_work_interrupts
    606115            +0.1%     606798        interrupts.CPU38.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU38.MCP:Machine_=
check_polls
      7558 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU38.NM=
I:Non-maskable_interrupts
      7558 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU38.PM=
I:Performance_monitoring_interrupts
    322.85 =C2=B1 13%      -1.8%     317.10 =C2=B1  6%  interrupts.CPU38.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 35%     -17.7%       1.90 =C2=B1 43%  interrupts.CPU38.TL=
B:TLB_shootdowns
      1089 =C2=B1 31%     +41.0%       1535 =C2=B1 29%  interrupts.CPU39.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU39.IW=
I:IRQ_work_interrupts
    606117            +0.1%     606771        interrupts.CPU39.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU39.MCP:Machine_=
check_polls
      7558 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU39.NM=
I:Non-maskable_interrupts
      7558 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU39.PM=
I:Performance_monitoring_interrupts
    309.46            -0.2%     308.80        interrupts.CPU39.RES:Reschedu=
ling_interrupts
      2.62 =C2=B1 57%      -8.2%       2.40 =C2=B1 87%  interrupts.CPU39.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU4.27:PCI-MSI.17=
825792-edge.PCIe.PME,pciehp
      1220 =C2=B1 34%     +34.4%       1640 =C2=B1 23%  interrupts.CPU4.CAL=
:Function_call_interrupts
      1.69 =C2=B1 27%     +18.2%       2.00        interrupts.CPU4.IWI:IRQ_=
work_interrupts
    606081            +0.1%     606760        interrupts.CPU4.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU4.MCP:Machine_c=
heck_polls
      6949 =C2=B1 27%     +18.1%       8205        interrupts.CPU4.NMI:Non-=
maskable_interrupts
      6949 =C2=B1 27%     +18.1%       8205        interrupts.CPU4.PMI:Perf=
ormance_monitoring_interrupts
    348.54 =C2=B1 36%     -10.4%     312.40        interrupts.CPU4.RES:Resc=
heduling_interrupts
      3.00 =C2=B1 62%     -33.3%       2.00 =C2=B1 44%  interrupts.CPU4.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU40.70:PCI-MSI.2=
3592977-edge.nvme0q17
      0.00          -100.0%       0.00        interrupts.CPU40.75:PCI-MSI.2=
3592977-edge.nvme0q17
      1476 =C2=B1 85%     +18.9%       1755 =C2=B1 35%  interrupts.CPU40.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU40.IW=
I:IRQ_work_interrupts
    606084            +0.1%     606758        interrupts.CPU40.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU40.MCP:Machine_=
check_polls
      7559 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU40.NM=
I:Non-maskable_interrupts
      7559 =C2=B1 19%      -2.6%       7360 =C2=B1 22%  interrupts.CPU40.PM=
I:Performance_monitoring_interrupts
    380.15 =C2=B1 58%     -14.4%     325.30 =C2=B1 15%  interrupts.CPU40.RE=
S:Rescheduling_interrupts
      2.23 =C2=B1 39%     -14.8%       1.90 =C2=B1 43%  interrupts.CPU40.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU41.97:PCI-MSI.2=
3592978-edge.nvme0q18
      1106 =C2=B1 28%     +45.8%       1612 =C2=B1 25%  interrupts.CPU41.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU41.IW=
I:IRQ_work_interrupts
    606108            +0.1%     606749        interrupts.CPU41.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU41.MCP:Machine_=
check_polls
      7873 =C2=B1 13%      -6.5%       7360 =C2=B1 22%  interrupts.CPU41.NM=
I:Non-maskable_interrupts
      7873 =C2=B1 13%      -6.5%       7360 =C2=B1 22%  interrupts.CPU41.PM=
I:Performance_monitoring_interrupts
    309.00            +0.3%     309.90        interrupts.CPU41.RES:Reschedu=
ling_interrupts
      2.38 =C2=B1 38%     -20.3%       1.90 =C2=B1 54%  interrupts.CPU41.TL=
B:TLB_shootdowns
      1106 =C2=B1 28%     +45.6%       1611 =C2=B1 25%  interrupts.CPU42.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%     -11.6%       1.70 =C2=B1 26%  interrupts.CPU42.IW=
I:IRQ_work_interrupts
    606098            +0.1%     606747        interrupts.CPU42.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU42.MCP:Machine_=
check_polls
      7873 =C2=B1 13%     -11.7%       6950 =C2=B1 26%  interrupts.CPU42.NM=
I:Non-maskable_interrupts
      7873 =C2=B1 13%     -11.7%       6950 =C2=B1 26%  interrupts.CPU42.PM=
I:Performance_monitoring_interrupts
    313.46 =C2=B1  3%      -1.6%     308.50        interrupts.CPU42.RES:Res=
cheduling_interrupts
      2.38 =C2=B1 35%     -20.3%       1.90 =C2=B1 54%  interrupts.CPU42.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU43.69:PCI-MSI.2=
3592980-edge.nvme0q20
      1097 =C2=B1 29%     +50.5%       1652 =C2=B1 30%  interrupts.CPU43.CA=
L:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU43.IWI:IRQ=
_work_interrupts
    606099            +0.1%     606745        interrupts.CPU43.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU43.MCP:Machine_=
check_polls
      8188           -10.1%       7359 =C2=B1 22%  interrupts.CPU43.NMI:Non=
-maskable_interrupts
      8188           -10.1%       7359 =C2=B1 22%  interrupts.CPU43.PMI:Per=
formance_monitoring_interrupts
    308.85            +4.7%     323.50 =C2=B1 13%  interrupts.CPU43.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 34%     -22.8%       1.90 =C2=B1 54%  interrupts.CPU43.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU44.64:PCI-MSI.2=
3592981-edge.nvme0q21
      0.00          -100.0%       0.00        interrupts.CPU44.79:PCI-MSI.2=
3592981-edge.nvme0q21
      1107 =C2=B1 28%     +45.4%       1611 =C2=B1 25%  interrupts.CPU44.CA=
L:Function_call_interrupts
      2.00            -5.0%       1.90 =C2=B1 15%  interrupts.CPU44.IWI:IRQ=
_work_interrupts
    606165            +0.1%     606779        interrupts.CPU44.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU44.MCP:Machine_=
check_polls
      8188            -5.1%       7768 =C2=B1 15%  interrupts.CPU44.NMI:Non=
-maskable_interrupts
      8188            -5.1%       7768 =C2=B1 15%  interrupts.CPU44.PMI:Per=
formance_monitoring_interrupts
    308.54            -0.0%     308.50        interrupts.CPU44.RES:Reschedu=
ling_interrupts
      2.23 =C2=B1 35%      -5.9%       2.10 =C2=B1 44%  interrupts.CPU44.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU45.71:PCI-MSI.2=
3592982-edge.nvme0q22
      0.00          -100.0%       0.00        interrupts.CPU45.80:PCI-MSI.2=
3592982-edge.nvme0q22
      0.00          -100.0%       0.00        interrupts.CPU45.97:PCI-MSI.2=
3592982-edge.nvme0q22
      1100 =C2=B1 29%     +84.5%       2029 =C2=B1 76%  interrupts.CPU45.CA=
L:Function_call_interrupts
      2.00            -5.0%       1.90 =C2=B1 15%  interrupts.CPU45.IWI:IRQ=
_work_interrupts
    606128            +0.1%     606730        interrupts.CPU45.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU45.MCP:Machine_=
check_polls
      8188            -5.1%       7769 =C2=B1 15%  interrupts.CPU45.NMI:Non=
-maskable_interrupts
      8188            -5.1%       7769 =C2=B1 15%  interrupts.CPU45.PMI:Per=
formance_monitoring_interrupts
    315.62 =C2=B1  7%     +18.8%     375.10 =C2=B1 51%  interrupts.CPU45.RE=
S:Rescheduling_interrupts
      2.23 =C2=B1 39%     +25.5%       2.80 =C2=B1102%  interrupts.CPU45.TL=
B:TLB_shootdowns
      1148 =C2=B1 28%     +40.5%       1613 =C2=B1 25%  interrupts.CPU46.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU46.IW=
I:IRQ_work_interrupts
    606125            +0.1%     606757        interrupts.CPU46.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU46.MCP:Machine_=
check_polls
      7558 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU46.NM=
I:Non-maskable_interrupts
      7558 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU46.PM=
I:Performance_monitoring_interrupts
    459.92 =C2=B1 77%     -32.9%     308.70        interrupts.CPU46.RES:Res=
cheduling_interrupts
      2.23 =C2=B1 35%     -10.3%       2.00 =C2=B1 44%  interrupts.CPU46.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU47.71:PCI-MSI.2=
3592984-edge.nvme0q24
      0.00          -100.0%       0.00        interrupts.CPU47.80:PCI-MSI.2=
3592984-edge.nvme0q24
      1078 =C2=B1 32%     +64.7%       1775 =C2=B1 21%  interrupts.CPU47.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU47.IW=
I:IRQ_work_interrupts
    606073            +0.1%     606823        interrupts.CPU47.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU47.MCP:Machine_=
check_polls
      7558 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU47.NM=
I:Non-maskable_interrupts
      7558 =C2=B1 19%      +2.8%       7769 =C2=B1 15%  interrupts.CPU47.PM=
I:Performance_monitoring_interrupts
    309.00           +17.9%     364.30 =C2=B1 34%  interrupts.CPU47.RES:Res=
cheduling_interrupts
      2.62 =C2=B1 60%     -27.4%       1.90 =C2=B1 54%  interrupts.CPU47.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU48.188:PCI-MSI.=
67174400-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU48.189:PCI-MSI.=
67174400-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU48.58:PCI-MSI.6=
7174400-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU48.59:PCI-MSI.6=
7174400-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU48.60:PCI-MSI.6=
7174400-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU48.64:PCI-MSI.6=
7174400-edge.ioat-msix
      1241 =C2=B1 28%     +69.8%       2108 =C2=B1 33%  interrupts.CPU48.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU48.IWI:IRQ=
_work_interrupts
    605901            +0.1%     606677        interrupts.CPU48.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU48.MCP:Machine_=
check_polls
      7877 =C2=B1 19%      +8.2%       8525        interrupts.CPU48.NMI:Non=
-maskable_interrupts
      7877 =C2=B1 19%      +8.2%       8525        interrupts.CPU48.PMI:Per=
formance_monitoring_interrupts
    328.46 =C2=B1  6%      +6.3%     349.00 =C2=B1 14%  interrupts.CPU48.RE=
S:Rescheduling_interrupts
      2.00 =C2=B1 58%      -5.0%       1.90 =C2=B1 64%  interrupts.CPU48.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU49.190:PCI-MSI.=
67176448-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU49.191:PCI-MSI.=
67176448-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU49.60:PCI-MSI.6=
7176448-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU49.61:PCI-MSI.6=
7176448-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU49.62:PCI-MSI.6=
7176448-edge.ioat-msix
      2398 =C2=B1 49%      +0.2%       2403 =C2=B1 34%  interrupts.CPU49.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU49.IWI:IRQ=
_work_interrupts
    605984            +0.1%     606714        interrupts.CPU49.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU49.MCP:Machine_=
check_polls
      7878 =C2=B1 19%      +8.2%       8526        interrupts.CPU49.NMI:Non=
-maskable_interrupts
      7878 =C2=B1 19%      +8.2%       8526        interrupts.CPU49.PMI:Per=
formance_monitoring_interrupts
    366.15 =C2=B1 17%      +2.3%     374.40 =C2=B1 15%  interrupts.CPU49.RE=
S:Rescheduling_interrupts
      2.00 =C2=B1 43%     -15.0%       1.70 =C2=B1 52%  interrupts.CPU49.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU5.29:PCI-MSI.23=
068672-edge.PCIe.PME,pciehp
      1289 =C2=B1 48%     +25.9%       1623 =C2=B1 25%  interrupts.CPU5.CAL=
:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU5.IWI=
:IRQ_work_interrupts
    606098            +0.1%     606772        interrupts.CPU5.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU5.MCP:Machine_c=
heck_polls
      7264 =C2=B1 23%      +7.3%       7794 =C2=B1 15%  interrupts.CPU5.NMI=
:Non-maskable_interrupts
      7264 =C2=B1 23%      +7.3%       7794 =C2=B1 15%  interrupts.CPU5.PMI=
:Performance_monitoring_interrupts
    348.31 =C2=B1 30%      -9.5%     315.30        interrupts.CPU5.RES:Resc=
heduling_interrupts
      4.77 =C2=B1171%     -58.1%       2.00 =C2=B1 44%  interrupts.CPU5.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU50.191:PCI-MSI.=
67178496-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU50.192:PCI-MSI.=
67178496-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU50.61:PCI-MSI.6=
7178496-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU50.62:PCI-MSI.6=
7178496-edge.ioat-msix
      1913 =C2=B1 81%     +20.8%       2311 =C2=B1 28%  interrupts.CPU50.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU50.IW=
I:IRQ_work_interrupts
    605935            +0.1%     606669        interrupts.CPU50.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU50.MCP:Machine_=
check_polls
      7878 =C2=B1 19%      +2.8%       8100 =C2=B1 15%  interrupts.CPU50.NM=
I:Non-maskable_interrupts
      7878 =C2=B1 19%      +2.8%       8100 =C2=B1 15%  interrupts.CPU50.PM=
I:Performance_monitoring_interrupts
    367.77 =C2=B1 20%     +15.5%     424.60 =C2=B1 24%  interrupts.CPU50.RE=
S:Rescheduling_interrupts
      2.15 =C2=B1 47%      -2.5%       2.10 =C2=B1 44%  interrupts.CPU50.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU51.192:PCI-MSI.=
67180544-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU51.193:PCI-MSI.=
67180544-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU51.62:PCI-MSI.6=
7180544-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU51.63:PCI-MSI.6=
7180544-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU51.65:PCI-MSI.6=
7180544-edge.ioat-msix
      1116 =C2=B1 29%     +46.6%       1637 =C2=B1 24%  interrupts.CPU51.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU51.IW=
I:IRQ_work_interrupts
    605918            +0.1%     606666        interrupts.CPU51.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU51.MCP:Machine_=
check_polls
      7878 =C2=B1 19%      +2.8%       8100 =C2=B1 15%  interrupts.CPU51.NM=
I:Non-maskable_interrupts
      7878 =C2=B1 19%      +2.8%       8100 =C2=B1 15%  interrupts.CPU51.PM=
I:Performance_monitoring_interrupts
    311.85            +0.3%     312.90 =C2=B1  2%  interrupts.CPU51.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 56%     -18.8%       2.00 =C2=B1 44%  interrupts.CPU51.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU52.193:PCI-MSI.=
67182592-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU52.194:PCI-MSI.=
67182592-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU52.63:PCI-MSI.6=
7182592-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU52.64:PCI-MSI.6=
7182592-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU52.66:PCI-MSI.6=
7182592-edge.ioat-msix
      1690 =C2=B1109%      -4.3%       1618 =C2=B1 25%  interrupts.CPU52.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU52.IW=
I:IRQ_work_interrupts
    605937            +0.1%     606679        interrupts.CPU52.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU52.MCP:Machine_=
check_polls
      7552 =C2=B1 23%      +7.3%       8100 =C2=B1 15%  interrupts.CPU52.NM=
I:Non-maskable_interrupts
      7552 =C2=B1 23%      +7.3%       8100 =C2=B1 15%  interrupts.CPU52.PM=
I:Performance_monitoring_interrupts
    409.77 =C2=B1 64%     -23.8%     312.10 =C2=B1  2%  interrupts.CPU52.RE=
S:Rescheduling_interrupts
      2.08 =C2=B1 48%      -3.7%       2.00 =C2=B1 44%  interrupts.CPU52.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU53.193:PCI-MSI.=
67184640-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU53.194:PCI-MSI.=
67184640-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU53.195:PCI-MSI.=
67184640-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU53.64:PCI-MSI.6=
7184640-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU53.65:PCI-MSI.6=
7184640-edge.ioat-msix
      1196 =C2=B1 28%     +35.5%       1620 =C2=B1 25%  interrupts.CPU53.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU53.IW=
I:IRQ_work_interrupts
    605968            +0.1%     606675        interrupts.CPU53.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU53.MCP:Machine_=
check_polls
      7551 =C2=B1 23%      +1.6%       7673 =C2=B1 22%  interrupts.CPU53.NM=
I:Non-maskable_interrupts
      7551 =C2=B1 23%      +1.6%       7673 =C2=B1 22%  interrupts.CPU53.PM=
I:Performance_monitoring_interrupts
    328.85 =C2=B1 19%      -5.7%     310.20        interrupts.CPU53.RES:Res=
cheduling_interrupts
      3.23 =C2=B1109%     -38.1%       2.00 =C2=B1 44%  interrupts.CPU53.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU54.195:PCI-MSI.=
67186688-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU54.196:PCI-MSI.=
67186688-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU54.65:PCI-MSI.6=
7186688-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU54.66:PCI-MSI.6=
7186688-edge.ioat-msix
      1178 =C2=B1 32%     +37.8%       1623 =C2=B1 24%  interrupts.CPU54.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU54.IW=
I:IRQ_work_interrupts
    605991            +0.1%     606674        interrupts.CPU54.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU54.MCP:Machine_=
check_polls
      7879 =C2=B1 19%      -2.6%       7672 =C2=B1 22%  interrupts.CPU54.NM=
I:Non-maskable_interrupts
      7879 =C2=B1 19%      -2.6%       7672 =C2=B1 22%  interrupts.CPU54.PM=
I:Performance_monitoring_interrupts
    317.31 =C2=B1 10%      -0.7%     315.20 =C2=B1  6%  interrupts.CPU54.RE=
S:Rescheduling_interrupts
      2.38 =C2=B1 45%     -11.9%       2.10 =C2=B1 44%  interrupts.CPU54.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU55.196:PCI-MSI.=
67188736-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU55.197:PCI-MSI.=
67188736-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU55.67:PCI-MSI.6=
7188736-edge.ioat-msix
      1096 =C2=B1 29%     +52.2%       1669 =C2=B1 26%  interrupts.CPU55.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU55.IW=
I:IRQ_work_interrupts
    605969            +0.1%     606634        interrupts.CPU55.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU55.MCP:Machine_=
check_polls
      8208 =C2=B1 13%      -6.5%       7673 =C2=B1 22%  interrupts.CPU55.NM=
I:Non-maskable_interrupts
      8208 =C2=B1 13%      -6.5%       7673 =C2=B1 22%  interrupts.CPU55.PM=
I:Performance_monitoring_interrupts
    307.92            +5.9%     326.20 =C2=B1 15%  interrupts.CPU55.RES:Res=
cheduling_interrupts
      2.23 =C2=B1 47%     +16.6%       2.60 =C2=B1 88%  interrupts.CPU55.TL=
B:TLB_shootdowns
      1096 =C2=B1 29%     +47.9%       1621 =C2=B1 24%  interrupts.CPU56.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU56.IW=
I:IRQ_work_interrupts
    605951            +0.1%     606682        interrupts.CPU56.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU56.MCP:Machine_=
check_polls
      8208 =C2=B1 13%      -6.5%       7673 =C2=B1 22%  interrupts.CPU56.NM=
I:Non-maskable_interrupts
      8208 =C2=B1 13%      -6.5%       7673 =C2=B1 22%  interrupts.CPU56.PM=
I:Performance_monitoring_interrupts
    307.77            +1.8%     313.40 =C2=B1  4%  interrupts.CPU56.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 40%     -18.8%       2.00 =C2=B1 44%  interrupts.CPU56.TL=
B:TLB_shootdowns
      1193 =C2=B1 35%     +36.0%       1624 =C2=B1 25%  interrupts.CPU57.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU57.IW=
I:IRQ_work_interrupts
    605901            +0.1%     606649        interrupts.CPU57.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU57.MCP:Machine_=
check_polls
      8208 =C2=B1 13%      -6.5%       7673 =C2=B1 22%  interrupts.CPU57.NM=
I:Non-maskable_interrupts
      8208 =C2=B1 13%      -6.5%       7673 =C2=B1 22%  interrupts.CPU57.PM=
I:Performance_monitoring_interrupts
    343.15 =C2=B1 34%     -10.0%     308.80        interrupts.CPU57.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 34%     -22.8%       1.90 =C2=B1 54%  interrupts.CPU57.TL=
B:TLB_shootdowns
      1101 =C2=B1 29%     +46.3%       1612 =C2=B1 25%  interrupts.CPU58.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU58.IW=
I:IRQ_work_interrupts
    605987            +0.1%     606668        interrupts.CPU58.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU58.MCP:Machine_=
check_polls
      8208 =C2=B1 13%      -6.5%       7672 =C2=B1 22%  interrupts.CPU58.NM=
I:Non-maskable_interrupts
      8208 =C2=B1 13%      -6.5%       7672 =C2=B1 22%  interrupts.CPU58.PM=
I:Performance_monitoring_interrupts
    308.31            +0.9%     311.10        interrupts.CPU58.RES:Reschedu=
ling_interrupts
      2.31 =C2=B1 39%     -13.3%       2.00 =C2=B1 44%  interrupts.CPU58.TL=
B:TLB_shootdowns
      1097 =C2=B1 29%     +47.7%       1621 =C2=B1 24%  interrupts.CPU59.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -1.2%       1.90 =C2=B1 15%  interrupts.CPU59.IW=
I:IRQ_work_interrupts
    605923            +0.1%     606658        interrupts.CPU59.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU59.MCP:Machine_=
check_polls
      8208 =C2=B1 13%      -1.3%       8099 =C2=B1 15%  interrupts.CPU59.NM=
I:Non-maskable_interrupts
      8208 =C2=B1 13%      -1.3%       8099 =C2=B1 15%  interrupts.CPU59.PM=
I:Performance_monitoring_interrupts
    330.85 =C2=B1 24%      -6.6%     309.00        interrupts.CPU59.RES:Res=
cheduling_interrupts
      2.23 =C2=B1 43%      -5.9%       2.10 =C2=B1 44%  interrupts.CPU59.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU6.35:PCI-MSI.32=
7680-edge.xhci_hcd
      1482 =C2=B1 81%      +3.6%       1535 =C2=B1 27%  interrupts.CPU6.CAL=
:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU6.IWI=
:IRQ_work_interrupts
    606033            +0.1%     606763        interrupts.CPU6.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU6.MCP:Machine_c=
heck_polls
      7580 =C2=B1 19%      +2.8%       7794 =C2=B1 15%  interrupts.CPU6.NMI=
:Non-maskable_interrupts
      7580 =C2=B1 19%      +2.8%       7794 =C2=B1 15%  interrupts.CPU6.PMI=
:Performance_monitoring_interrupts
    369.38 =C2=B1 53%     -12.8%     322.10 =C2=B1  7%  interrupts.CPU6.RES=
:Rescheduling_interrupts
      2.46 =C2=B1 30%     -22.8%       1.90 =C2=B1 43%  interrupts.CPU6.TLB=
:TLB_shootdowns
      1098 =C2=B1 29%     +45.9%       1602 =C2=B1 30%  interrupts.CPU60.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      +4.0%       2.00        interrupts.CPU60.IWI:IRQ=
_work_interrupts
    605951            +0.1%     606694        interrupts.CPU60.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU60.MCP:Machine_=
check_polls
      8208 =C2=B1 13%      +3.9%       8526        interrupts.CPU60.NMI:Non=
-maskable_interrupts
      8208 =C2=B1 13%      +3.9%       8526        interrupts.CPU60.PMI:Per=
formance_monitoring_interrupts
    308.62            +3.6%     319.80 =C2=B1  7%  interrupts.CPU60.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 37%      +1.6%       2.50 =C2=B1 44%  interrupts.CPU60.TL=
B:TLB_shootdowns
      1066 =C2=B1 33%     +76.3%       1881 =C2=B1 48%  interrupts.CPU61.CA=
L:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU61.IWI:IRQ=
_work_interrupts
    605954            +0.1%     606661        interrupts.CPU61.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU61.MCP:Machine_=
check_polls
      8536           -10.1%       7674 =C2=B1 22%  interrupts.CPU61.NMI:Non=
-maskable_interrupts
      8536           -10.1%       7674 =C2=B1 22%  interrupts.CPU61.PMI:Per=
formance_monitoring_interrupts
    308.31           +15.7%     356.60 =C2=B1 40%  interrupts.CPU61.RES:Res=
cheduling_interrupts
      3.23 =C2=B1103%     -38.1%       2.00 =C2=B1 44%  interrupts.CPU61.TL=
B:TLB_shootdowns
      1102 =C2=B1 28%     +50.5%       1659 =C2=B1 21%  interrupts.CPU62.CA=
L:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU62.IWI:IRQ=
_work_interrupts
    605953            +0.1%     606656        interrupts.CPU62.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU62.MCP:Machine_=
check_polls
      8536           -10.1%       7673 =C2=B1 22%  interrupts.CPU62.NMI:Non=
-maskable_interrupts
      8536           -10.1%       7673 =C2=B1 22%  interrupts.CPU62.PMI:Per=
formance_monitoring_interrupts
    307.38            +5.0%     322.90 =C2=B1 13%  interrupts.CPU62.RES:Res=
cheduling_interrupts
      2.38 =C2=B1 38%      -7.7%       2.20 =C2=B1 48%  interrupts.CPU62.TL=
B:TLB_shootdowns
      1105 =C2=B1 28%     +46.1%       1615 =C2=B1 25%  interrupts.CPU63.CA=
L:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU63.IWI:IRQ=
_work_interrupts
    605930            +0.1%     606653        interrupts.CPU63.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU63.MCP:Machine_=
check_polls
      8536           -10.1%       7673 =C2=B1 22%  interrupts.CPU63.NMI:Non=
-maskable_interrupts
      8536           -10.1%       7673 =C2=B1 22%  interrupts.CPU63.PMI:Per=
formance_monitoring_interrupts
    311.38 =C2=B1  4%     +28.3%     399.40 =C2=B1 68%  interrupts.CPU63.RE=
S:Rescheduling_interrupts
      2.46 =C2=B1 46%     -10.6%       2.20 =C2=B1 34%  interrupts.CPU63.TL=
B:TLB_shootdowns
      1097 =C2=B1 29%     +54.3%       1692 =C2=B1 29%  interrupts.CPU64.CA=
L:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU64.IWI:IRQ=
_work_interrupts
    605956            +0.1%     606657        interrupts.CPU64.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU64.MCP:Machine_=
check_polls
      8536           -10.1%       7673 =C2=B1 22%  interrupts.CPU64.NMI:Non=
-maskable_interrupts
      8536           -10.1%       7673 =C2=B1 22%  interrupts.CPU64.PMI:Per=
formance_monitoring_interrupts
    307.92            +6.7%     328.40 =C2=B1 18%  interrupts.CPU64.RES:Res=
cheduling_interrupts
      2.38 =C2=B1 42%     -11.9%       2.10 =C2=B1 39%  interrupts.CPU64.TL=
B:TLB_shootdowns
      1130 =C2=B1 28%    +141.9%       2735 =C2=B1119%  interrupts.CPU65.CA=
L:Function_call_interrupts
      2.00           -15.0%       1.70 =C2=B1 26%  interrupts.CPU65.IWI:IRQ=
_work_interrupts
    605895            +0.1%     606657        interrupts.CPU65.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU65.MCP:Machine_=
check_polls
      8535           -15.1%       7245 =C2=B1 26%  interrupts.CPU65.NMI:Non=
-maskable_interrupts
      8535           -15.1%       7245 =C2=B1 26%  interrupts.CPU65.PMI:Per=
formance_monitoring_interrupts
    317.31 =C2=B1 10%     +52.7%     484.40 =C2=B1100%  interrupts.CPU65.RE=
S:Rescheduling_interrupts
      2.38 =C2=B1 48%      -7.7%       2.20 =C2=B1 39%  interrupts.CPU65.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU66.106:PCI-MSI.=
23593011-edge.nvme0q51
      1095 =C2=B1 29%     +48.6%       1627 =C2=B1 25%  interrupts.CPU66.CA=
L:Function_call_interrupts
      2.00           -15.0%       1.70 =C2=B1 26%  interrupts.CPU66.IWI:IRQ=
_work_interrupts
    605935            +0.1%     606665        interrupts.CPU66.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU66.MCP:Machine_=
check_polls
      8537           -15.1%       7245 =C2=B1 26%  interrupts.CPU66.NMI:Non=
-maskable_interrupts
      8537           -15.1%       7245 =C2=B1 26%  interrupts.CPU66.PMI:Per=
formance_monitoring_interrupts
    308.23            +9.9%     338.80 =C2=B1 26%  interrupts.CPU66.RES:Res=
cheduling_interrupts
      2.31 =C2=B1 35%      +8.3%       2.50 =C2=B1 80%  interrupts.CPU66.TL=
B:TLB_shootdowns
      1099 =C2=B1 29%     +46.7%       1612 =C2=B1 25%  interrupts.CPU67.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%     -13.3%       1.60 =C2=B1 30%  interrupts.CPU67.IW=
I:IRQ_work_interrupts
    605870            +0.1%     606691        interrupts.CPU67.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU67.MCP:Machine_=
check_polls
      7879 =C2=B1 19%     -13.5%       6818 =C2=B1 30%  interrupts.CPU67.NM=
I:Non-maskable_interrupts
      7879 =C2=B1 19%     -13.5%       6818 =C2=B1 30%  interrupts.CPU67.PM=
I:Performance_monitoring_interrupts
    313.38 =C2=B1  5%      -1.3%     309.40        interrupts.CPU67.RES:Res=
cheduling_interrupts
      2.38 =C2=B1 42%     -16.1%       2.00 =C2=B1 44%  interrupts.CPU67.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU68.113:PCI-MSI.=
23593013-edge.nvme0q53
      1103 =C2=B1 29%     +46.0%       1612 =C2=B1 25%  interrupts.CPU68.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      -2.5%       1.80 =C2=B1 22%  interrupts.CPU68.IW=
I:IRQ_work_interrupts
    605906            +0.1%     606664        interrupts.CPU68.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU68.MCP:Machine_=
check_polls
      7880 =C2=B1 19%      -2.6%       7672 =C2=B1 22%  interrupts.CPU68.NM=
I:Non-maskable_interrupts
      7880 =C2=B1 19%      -2.6%       7672 =C2=B1 22%  interrupts.CPU68.PM=
I:Performance_monitoring_interrupts
    331.85 =C2=B1 24%      -6.3%     311.10 =C2=B1  3%  interrupts.CPU68.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 39%     -13.3%       2.00 =C2=B1 44%  interrupts.CPU68.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU69.101:PCI-MSI.=
23593014-edge.nvme0q54
      0.00          -100.0%       0.00        interrupts.CPU69.133:PCI-MSI.=
23593014-edge.nvme0q54
      1100 =C2=B1 29%     +46.5%       1611 =C2=B1 25%  interrupts.CPU69.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU69.IW=
I:IRQ_work_interrupts
    605955            +0.1%     606654        interrupts.CPU69.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU69.MCP:Machine_=
check_polls
      7552 =C2=B1 23%      +7.2%       8099 =C2=B1 15%  interrupts.CPU69.NM=
I:Non-maskable_interrupts
      7552 =C2=B1 23%      +7.2%       8099 =C2=B1 15%  interrupts.CPU69.PM=
I:Performance_monitoring_interrupts
    377.69 =C2=B1 64%     -18.1%     309.30        interrupts.CPU69.RES:Res=
cheduling_interrupts
      2.38 =C2=B1 38%     -11.9%       2.10 =C2=B1 44%  interrupts.CPU69.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU7.8:IO-APIC.8-e=
dge.rtc0
      1107 =C2=B1 29%     +45.9%       1616 =C2=B1 25%  interrupts.CPU7.CAL=
:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU7.IWI=
:IRQ_work_interrupts
    606043            +0.1%     606756        interrupts.CPU7.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU7.MCP:Machine_c=
heck_polls
      7265 =C2=B1 23%      +7.3%       7796 =C2=B1 15%  interrupts.CPU7.NMI=
:Non-maskable_interrupts
      7265 =C2=B1 23%      +7.3%       7796 =C2=B1 15%  interrupts.CPU7.PMI=
:Performance_monitoring_interrupts
    310.23           +31.7%     408.50 =C2=B1 68%  interrupts.CPU7.RES:Resc=
heduling_interrupts
      2.46 =C2=B1 30%     -18.8%       2.00 =C2=B1 44%  interrupts.CPU7.TLB=
:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU70.130:PCI-MSI.=
23593015-edge.nvme0q55
      1144 =C2=B1 29%     +52.4%       1744 =C2=B1 21%  interrupts.CPU70.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU70.IW=
I:IRQ_work_interrupts
    605860            +0.1%     606665        interrupts.CPU70.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU70.MCP:Machine_=
check_polls
      7880 =C2=B1 19%      +2.8%       8099 =C2=B1 15%  interrupts.CPU70.NM=
I:Non-maskable_interrupts
      7880 =C2=B1 19%      +2.8%       8099 =C2=B1 15%  interrupts.CPU70.PM=
I:Performance_monitoring_interrupts
    327.08 =C2=B1 17%      +6.7%     349.10 =C2=B1 34%  interrupts.CPU70.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 49%     -13.3%       2.00 =C2=B1 44%  interrupts.CPU70.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU71.122:PCI-MSI.=
23593016-edge.nvme0q56
      1106 =C2=B1 28%     +60.1%       1770 =C2=B1 23%  interrupts.CPU71.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU71.IW=
I:IRQ_work_interrupts
    605905            +0.1%     606694        interrupts.CPU71.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU71.MCP:Machine_=
check_polls
      7880 =C2=B1 19%      +2.8%       8100 =C2=B1 15%  interrupts.CPU71.NM=
I:Non-maskable_interrupts
      7880 =C2=B1 19%      +2.8%       8100 =C2=B1 15%  interrupts.CPU71.PM=
I:Performance_monitoring_interrupts
    379.54 =C2=B1 63%     -12.7%     331.30 =C2=B1 19%  interrupts.CPU71.RE=
S:Rescheduling_interrupts
      3.08 =C2=B1115%     -41.5%       1.80 =C2=B1 59%  interrupts.CPU71.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU72.198:PCI-MSI.=
100728832-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU72.199:PCI-MSI.=
100728832-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU72.69:PCI-MSI.1=
00728832-edge.ioat-msix
      1338 =C2=B1 25%     +27.4%       1705 =C2=B1 29%  interrupts.CPU72.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU72.IW=
I:IRQ_work_interrupts
    605877            +0.1%     606761        interrupts.CPU72.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU72.MCP:Machine_=
check_polls
      7133 =C2=B1 23%      +7.2%       7646 =C2=B1 15%  interrupts.CPU72.NM=
I:Non-maskable_interrupts
      7133 =C2=B1 23%      +7.2%       7646 =C2=B1 15%  interrupts.CPU72.PM=
I:Performance_monitoring_interrupts
    373.54 =C2=B1 15%      -5.3%     353.80 =C2=B1  6%  interrupts.CPU72.RE=
S:Rescheduling_interrupts
      2.08 =C2=B1 48%      +1.1%       2.10 =C2=B1115%  interrupts.CPU72.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU73.200:PCI-MSI.=
100730880-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU73.201:PCI-MSI.=
100730880-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU73.71:PCI-MSI.1=
00730880-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU73.72:PCI-MSI.1=
00730880-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU73.73:PCI-MSI.1=
00730880-edge.ioat-msix
      2277 =C2=B1 53%     +16.3%       2648 =C2=B1 34%  interrupts.CPU73.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU73.IW=
I:IRQ_work_interrupts
    605907            +0.1%     606748        interrupts.CPU73.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU73.MCP:Machine_=
check_polls
      7444 =C2=B1 19%      +2.7%       7647 =C2=B1 15%  interrupts.CPU73.NM=
I:Non-maskable_interrupts
      7444 =C2=B1 19%      +2.7%       7647 =C2=B1 15%  interrupts.CPU73.PM=
I:Performance_monitoring_interrupts
    382.23 =C2=B1 22%      +3.4%     395.10 =C2=B1 25%  interrupts.CPU73.RE=
S:Rescheduling_interrupts
      2.08 =C2=B1 44%     -18.1%       1.70 =C2=B1 37%  interrupts.CPU73.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU74.201:PCI-MSI.=
100732928-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU74.202:PCI-MSI.=
100732928-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU74.72:PCI-MSI.1=
00732928-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU74.74:PCI-MSI.1=
00732928-edge.ioat-msix
      1843 =C2=B1 46%     +29.6%       2389 =C2=B1 42%  interrupts.CPU74.CA=
L:Function_call_interrupts
      2.00            -5.0%       1.90 =C2=B1 15%  interrupts.CPU74.IWI:IRQ=
_work_interrupts
    605917            +0.1%     606769        interrupts.CPU74.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU74.MCP:Machine_=
check_polls
      7755 =C2=B1 13%      -1.4%       7647 =C2=B1 15%  interrupts.CPU74.NM=
I:Non-maskable_interrupts
      7755 =C2=B1 13%      -1.4%       7647 =C2=B1 15%  interrupts.CPU74.PM=
I:Performance_monitoring_interrupts
    397.77 =C2=B1 25%     +15.3%     458.80 =C2=B1 47%  interrupts.CPU74.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 35%     -30.7%       1.60 =C2=B1 63%  interrupts.CPU74.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU75.202:PCI-MSI.=
100734976-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU75.203:PCI-MSI.=
100734976-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU75.73:PCI-MSI.1=
00734976-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU75.75:PCI-MSI.1=
00734976-edge.ioat-msix
      1313 =C2=B1 54%     +40.3%       1843 =C2=B1 31%  interrupts.CPU75.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      -6.4%       1.80 =C2=B1 22%  interrupts.CPU75.IW=
I:IRQ_work_interrupts
    605891            +0.1%     606710        interrupts.CPU75.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU75.MCP:Machine_=
check_polls
      7755 =C2=B1 13%      -6.6%       7244 =C2=B1 22%  interrupts.CPU75.NM=
I:Non-maskable_interrupts
      7755 =C2=B1 13%      -6.6%       7244 =C2=B1 22%  interrupts.CPU75.PM=
I:Performance_monitoring_interrupts
    344.46 =C2=B1 29%     +12.1%     386.30 =C2=B1 35%  interrupts.CPU75.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 39%     -30.7%       1.60 =C2=B1 75%  interrupts.CPU75.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU76.198:PCI-MSI.=
100737024-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU76.203:PCI-MSI.=
100737024-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU76.204:PCI-MSI.=
100737024-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU76.74:PCI-MSI.1=
00737024-edge.ioat-msix
      1105 =C2=B1 28%     +46.0%       1613 =C2=B1 25%  interrupts.CPU76.CA=
L:Function_call_interrupts
      2.00           -10.0%       1.80 =C2=B1 22%  interrupts.CPU76.IWI:IRQ=
_work_interrupts
    605935            +0.1%     606714        interrupts.CPU76.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU76.MCP:Machine_=
check_polls
      8065           -10.2%       7244 =C2=B1 22%  interrupts.CPU76.NMI:Non=
-maskable_interrupts
      8065           -10.2%       7244 =C2=B1 22%  interrupts.CPU76.PMI:Per=
formance_monitoring_interrupts
    308.85            +0.4%     310.20        interrupts.CPU76.RES:Reschedu=
ling_interrupts
      2.31 =C2=B1 35%     -22.0%       1.80 =C2=B1 64%  interrupts.CPU76.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU77.205:PCI-MSI.=
100739072-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU77.75:PCI-MSI.1=
00739072-edge.ioat-msix
      1098 =C2=B1 29%     +46.6%       1610 =C2=B1 25%  interrupts.CPU77.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%     +12.3%       1.90 =C2=B1 15%  interrupts.CPU77.IW=
I:IRQ_work_interrupts
    605879            +0.1%     606719        interrupts.CPU77.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU77.MCP:Machine_=
check_polls
      6824 =C2=B1 27%     +12.0%       7646 =C2=B1 15%  interrupts.CPU77.NM=
I:Non-maskable_interrupts
      6824 =C2=B1 27%     +12.0%       7646 =C2=B1 15%  interrupts.CPU77.PM=
I:Performance_monitoring_interrupts
    332.77 =C2=B1 24%      -7.3%     308.60        interrupts.CPU77.RES:Res=
cheduling_interrupts
      2.38 =C2=B1 38%     -16.1%       2.00 =C2=B1 54%  interrupts.CPU77.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU78.206:PCI-MSI.=
100741120-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU78.78:PCI-MSI.1=
00741120-edge.ioat-msix
      1107 =C2=B1 31%     +46.4%       1621 =C2=B1 25%  interrupts.CPU78.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%      +0.5%       1.70 =C2=B1 26%  interrupts.CPU78.IW=
I:IRQ_work_interrupts
    605877            +0.1%     606663        interrupts.CPU78.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU78.MCP:Machine_=
check_polls
      6824 =C2=B1 27%      +0.2%       6841 =C2=B1 26%  interrupts.CPU78.NM=
I:Non-maskable_interrupts
      6824 =C2=B1 27%      +0.2%       6841 =C2=B1 26%  interrupts.CPU78.PM=
I:Performance_monitoring_interrupts
    308.08            +5.1%     323.90 =C2=B1 10%  interrupts.CPU78.RES:Res=
cheduling_interrupts
      2.54 =C2=B1 39%     -21.2%       2.00 =C2=B1 67%  interrupts.CPU78.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU79.207:PCI-MSI.=
100743168-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU79.79:PCI-MSI.1=
00743168-edge.ioat-msix
      1102 =C2=B1 29%     +46.4%       1613 =C2=B1 25%  interrupts.CPU79.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%      +6.4%       1.80 =C2=B1 22%  interrupts.CPU79.IW=
I:IRQ_work_interrupts
    605882            +0.1%     606740        interrupts.CPU79.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU79.MCP:Machine_=
check_polls
      6824 =C2=B1 27%      +6.1%       7242 =C2=B1 22%  interrupts.CPU79.NM=
I:Non-maskable_interrupts
      6824 =C2=B1 27%      +6.1%       7242 =C2=B1 22%  interrupts.CPU79.PM=
I:Performance_monitoring_interrupts
    309.92            +0.5%     311.60 =C2=B1  3%  interrupts.CPU79.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 30%     -26.9%       1.80 =C2=B1 73%  interrupts.CPU79.TL=
B:TLB_shootdowns
      1095 =C2=B1 29%     +45.0%       1588 =C2=B1 32%  interrupts.CPU8.CAL=
:Function_call_interrupts
      1.85 =C2=B1 19%      +2.9%       1.90 =C2=B1 15%  interrupts.CPU8.IWI=
:IRQ_work_interrupts
    606049            +0.1%     606758        interrupts.CPU8.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU8.MCP:Machine_c=
heck_polls
      7581 =C2=B1 19%      +2.8%       7795 =C2=B1 15%  interrupts.CPU8.NMI=
:Non-maskable_interrupts
      7581 =C2=B1 19%      +2.8%       7795 =C2=B1 15%  interrupts.CPU8.PMI=
:Performance_monitoring_interrupts
    312.54 =C2=B1  2%      -0.1%     312.10        interrupts.CPU8.RES:Resc=
heduling_interrupts
      2.62 =C2=B1 28%     -19.7%       2.10 =C2=B1 39%  interrupts.CPU8.TLB=
:TLB_shootdowns
      1099 =C2=B1 29%     +46.5%       1611 =C2=B1 25%  interrupts.CPU80.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%     +12.3%       1.90 =C2=B1 15%  interrupts.CPU80.IW=
I:IRQ_work_interrupts
    605905            +0.1%     606711        interrupts.CPU80.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU80.MCP:Machine_=
check_polls
      6824 =C2=B1 27%     +12.0%       7645 =C2=B1 15%  interrupts.CPU80.NM=
I:Non-maskable_interrupts
      6824 =C2=B1 27%     +12.0%       7645 =C2=B1 15%  interrupts.CPU80.PM=
I:Performance_monitoring_interrupts
    333.38 =C2=B1 24%      -7.3%     309.00        interrupts.CPU80.RES:Res=
cheduling_interrupts
      2.23 =C2=B1 35%     -19.3%       1.80 =C2=B1 73%  interrupts.CPU80.TL=
B:TLB_shootdowns
      1071 =C2=B1 33%     +50.3%       1611 =C2=B1 25%  interrupts.CPU81.CA=
L:Function_call_interrupts
      1.62 =C2=B1 30%     +17.6%       1.90 =C2=B1 15%  interrupts.CPU81.IW=
I:IRQ_work_interrupts
    605903            +0.1%     606710        interrupts.CPU81.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU81.MCP:Machine_=
check_polls
      6514 =C2=B1 30%     +17.4%       7645 =C2=B1 15%  interrupts.CPU81.NM=
I:Non-maskable_interrupts
      6514 =C2=B1 30%     +17.4%       7645 =C2=B1 15%  interrupts.CPU81.PM=
I:Performance_monitoring_interrupts
    313.92 =C2=B1  5%      -1.5%     309.30        interrupts.CPU81.RES:Res=
cheduling_interrupts
      2.54 =C2=B1 39%     -29.1%       1.80 =C2=B1 73%  interrupts.CPU81.TL=
B:TLB_shootdowns
      1098 =C2=B1 29%     +42.4%       1563 =C2=B1 27%  interrupts.CPU82.CA=
L:Function_call_interrupts
      1.62 =C2=B1 30%     +17.6%       1.90 =C2=B1 15%  interrupts.CPU82.IW=
I:IRQ_work_interrupts
    605855            +0.1%     606742        interrupts.CPU82.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU82.MCP:Machine_=
check_polls
      6515 =C2=B1 30%     +17.4%       7645 =C2=B1 15%  interrupts.CPU82.NM=
I:Non-maskable_interrupts
      6515 =C2=B1 30%     +17.4%       7645 =C2=B1 15%  interrupts.CPU82.PM=
I:Performance_monitoring_interrupts
    309.00            -0.1%     308.60        interrupts.CPU82.RES:Reschedu=
ling_interrupts
      2.46 =C2=B1 43%     -10.6%       2.20 =C2=B1 48%  interrupts.CPU82.TL=
B:TLB_shootdowns
      1102 =C2=B1 29%     +46.8%       1617 =C2=B1 25%  interrupts.CPU83.CA=
L:Function_call_interrupts
      1.46 =C2=B1 34%     +30.0%       1.90 =C2=B1 15%  interrupts.CPU83.IW=
I:IRQ_work_interrupts
    605861            +0.1%     606709        interrupts.CPU83.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU83.MCP:Machine_=
check_polls
      5893 =C2=B1 34%     +29.7%       7645 =C2=B1 15%  interrupts.CPU83.NM=
I:Non-maskable_interrupts
      5893 =C2=B1 34%     +29.7%       7645 =C2=B1 15%  interrupts.CPU83.PM=
I:Performance_monitoring_interrupts
    308.77            +1.0%     312.00 =C2=B1  3%  interrupts.CPU83.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 46%     -22.8%       1.90 =C2=B1 64%  interrupts.CPU83.TL=
B:TLB_shootdowns
      1091 =C2=B1 28%     +40.6%       1534 =C2=B1 30%  interrupts.CPU84.CA=
L:Function_call_interrupts
      1.54 =C2=B1 32%     +23.5%       1.90 =C2=B1 15%  interrupts.CPU84.IW=
I:IRQ_work_interrupts
    605885            +0.1%     606725        interrupts.CPU84.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU84.MCP:Machine_=
check_polls
      6203 =C2=B1 32%     +23.2%       7644 =C2=B1 15%  interrupts.CPU84.NM=
I:Non-maskable_interrupts
      6203 =C2=B1 32%     +23.2%       7644 =C2=B1 15%  interrupts.CPU84.PM=
I:Performance_monitoring_interrupts
    308.31            +0.3%     309.20        interrupts.CPU84.RES:Reschedu=
ling_interrupts
      4.69 =C2=B1176%     -53.1%       2.20 =C2=B1 48%  interrupts.CPU84.TL=
B:TLB_shootdowns
      1098 =C2=B1 29%     +46.7%       1610 =C2=B1 25%  interrupts.CPU85.CA=
L:Function_call_interrupts
      1.54 =C2=B1 32%     +30.0%       2.00        interrupts.CPU85.IWI:IRQ=
_work_interrupts
    605837            +0.1%     606684        interrupts.CPU85.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU85.MCP:Machine_=
check_polls
      6204 =C2=B1 32%     +29.7%       8049        interrupts.CPU85.NMI:Non=
-maskable_interrupts
      6204 =C2=B1 32%     +29.7%       8049        interrupts.CPU85.PMI:Per=
formance_monitoring_interrupts
    311.00 =C2=B1  2%      -0.6%     309.00        interrupts.CPU85.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 43%     -26.9%       1.80 =C2=B1 64%  interrupts.CPU85.TL=
B:TLB_shootdowns
      1111 =C2=B1 31%     +44.9%       1610 =C2=B1 25%  interrupts.CPU86.CA=
L:Function_call_interrupts
      1.54 =C2=B1 32%     +30.0%       2.00        interrupts.CPU86.IWI:IRQ=
_work_interrupts
    605873            +0.1%     606699        interrupts.CPU86.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU86.MCP:Machine_=
check_polls
      6203 =C2=B1 32%     +29.8%       8049        interrupts.CPU86.NMI:Non=
-maskable_interrupts
      6203 =C2=B1 32%     +29.8%       8049        interrupts.CPU86.PMI:Per=
formance_monitoring_interrupts
    314.77 =C2=B1  7%      -1.7%     309.30        interrupts.CPU86.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 37%     -22.8%       1.90 =C2=B1 64%  interrupts.CPU86.TL=
B:TLB_shootdowns
      1297 =C2=B1 55%     +24.2%       1611 =C2=B1 25%  interrupts.CPU87.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU87.IWI:IRQ=
_work_interrupts
    605817            +0.2%     606743        interrupts.CPU87.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU87.MCP:Machine_=
check_polls
      7136 =C2=B1 23%     +12.8%       8048        interrupts.CPU87.NMI:Non=
-maskable_interrupts
      7136 =C2=B1 23%     +12.8%       8048        interrupts.CPU87.PMI:Per=
formance_monitoring_interrupts
    339.38 =C2=B1 31%      -9.0%     308.70        interrupts.CPU87.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 43%     -30.9%       1.70 =C2=B1 74%  interrupts.CPU87.TL=
B:TLB_shootdowns
      1098 =C2=B1 29%     +47.2%       1617 =C2=B1 25%  interrupts.CPU88.CA=
L:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU88.IWI:IRQ=
_work_interrupts
    605860            +0.1%     606718        interrupts.CPU88.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU88.MCP:Machine_=
check_polls
      7446 =C2=B1 19%      +8.1%       8048        interrupts.CPU88.NMI:Non=
-maskable_interrupts
      7446 =C2=B1 19%      +8.1%       8048        interrupts.CPU88.PMI:Per=
formance_monitoring_interrupts
    308.69            +0.8%     311.30 =C2=B1  2%  interrupts.CPU88.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 43%     -26.9%       1.80 =C2=B1 64%  interrupts.CPU88.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU89.148:PCI-MSI.=
23593042-edge.nvme0q82
      1230 =C2=B1 55%     +31.2%       1614 =C2=B1 25%  interrupts.CPU89.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU89.IWI:IRQ=
_work_interrupts
    605848            +0.1%     606702        interrupts.CPU89.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU89.MCP:Machine_=
check_polls
      7135 =C2=B1 23%     +12.8%       8049        interrupts.CPU89.NMI:Non=
-maskable_interrupts
      7135 =C2=B1 23%     +12.8%       8049        interrupts.CPU89.PMI:Per=
formance_monitoring_interrupts
    351.08 =C2=B1 42%      -3.3%     339.60 =C2=B1 27%  interrupts.CPU89.RE=
S:Rescheduling_interrupts
      2.54 =C2=B1 36%     -21.2%       2.00 =C2=B1 54%  interrupts.CPU89.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU9.30:PCI-MSI.52=
4288-edge.eth0
      1114 =C2=B1 31%     +45.9%       1626 =C2=B1 25%  interrupts.CPU9.CAL=
:Function_call_interrupts
      1.85 =C2=B1 19%      +8.3%       2.00        interrupts.CPU9.IWI:IRQ_=
work_interrupts
    606005            +0.1%     606787        interrupts.CPU9.LOC:Local_tim=
er_interrupts
      1.00            +0.0%       1.00        interrupts.CPU9.MCP:Machine_c=
heck_polls
      7580 =C2=B1 19%      +8.2%       8204        interrupts.CPU9.NMI:Non-=
maskable_interrupts
      7580 =C2=B1 19%      +8.2%       8204        interrupts.CPU9.PMI:Perf=
ormance_monitoring_interrupts
    314.38 =C2=B1  4%      -0.9%     311.60        interrupts.CPU9.RES:Resc=
heduling_interrupts
      2.62 =C2=B1 28%     -15.9%       2.20 =C2=B1 48%  interrupts.CPU9.TLB=
:TLB_shootdowns
      1104 =C2=B1 28%     +46.6%       1619 =C2=B1 25%  interrupts.CPU90.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%      +6.4%       1.80 =C2=B1 22%  interrupts.CPU90.IW=
I:IRQ_work_interrupts
    605816            +0.1%     606718        interrupts.CPU90.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU90.MCP:Machine_=
check_polls
      6824 =C2=B1 27%      +6.2%       7245 =C2=B1 22%  interrupts.CPU90.NM=
I:Non-maskable_interrupts
      6824 =C2=B1 27%      +6.2%       7245 =C2=B1 22%  interrupts.CPU90.PM=
I:Performance_monitoring_interrupts
    331.54 =C2=B1 24%      -6.9%     308.70        interrupts.CPU90.RES:Res=
cheduling_interrupts
      2.38 =C2=B1 38%     -16.1%       2.00 =C2=B1 54%  interrupts.CPU90.TL=
B:TLB_shootdowns
      1479 =C2=B1102%      +9.0%       1612 =C2=B1 25%  interrupts.CPU91.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%      +6.4%       1.80 =C2=B1 22%  interrupts.CPU91.IW=
I:IRQ_work_interrupts
    605813            +0.1%     606701        interrupts.CPU91.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU91.MCP:Machine_=
check_polls
      6825 =C2=B1 27%      +6.1%       7245 =C2=B1 22%  interrupts.CPU91.NM=
I:Non-maskable_interrupts
      6825 =C2=B1 27%      +6.1%       7245 =C2=B1 22%  interrupts.CPU91.PM=
I:Performance_monitoring_interrupts
    378.46 =C2=B1 64%     -18.5%     308.60        interrupts.CPU91.RES:Res=
cheduling_interrupts
      2.31 =C2=B1 46%     -13.3%       2.00 =C2=B1 54%  interrupts.CPU91.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU92.147:PCI-MSI.=
23593045-edge.nvme0q85
      1184 =C2=B1 33%     +36.1%       1612 =C2=B1 25%  interrupts.CPU92.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +1.7%       1.80 =C2=B1 22%  interrupts.CPU92.IW=
I:IRQ_work_interrupts
    605812            +0.1%     606720        interrupts.CPU92.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU92.MCP:Machine_=
check_polls
      7135 =C2=B1 23%      +1.6%       7246 =C2=B1 22%  interrupts.CPU92.NM=
I:Non-maskable_interrupts
      7135 =C2=B1 23%      +1.6%       7246 =C2=B1 22%  interrupts.CPU92.PM=
I:Performance_monitoring_interrupts
    336.15 =C2=B1 28%      -8.1%     309.00        interrupts.CPU92.RES:Res=
cheduling_interrupts
      2.38 =C2=B1 38%     -16.1%       2.00 =C2=B1 54%  interrupts.CPU92.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU93.138:PCI-MSI.=
23593046-edge.nvme0q86
      0.00          -100.0%       0.00        interrupts.CPU93.148:PCI-MSI.=
23593046-edge.nvme0q86
      1229 =C2=B1 41%     +31.5%       1616 =C2=B1 25%  interrupts.CPU93.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU93.IW=
I:IRQ_work_interrupts
    605818            +0.1%     606656        interrupts.CPU93.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU93.MCP:Machine_=
check_polls
      7135 =C2=B1 23%      +7.2%       7648 =C2=B1 15%  interrupts.CPU93.NM=
I:Non-maskable_interrupts
      7135 =C2=B1 23%      +7.2%       7648 =C2=B1 15%  interrupts.CPU93.PM=
I:Performance_monitoring_interrupts
    356.15 =C2=B1 42%     -13.2%     309.30        interrupts.CPU93.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 46%     -22.8%       1.90 =C2=B1 64%  interrupts.CPU93.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU94.139:PCI-MSI.=
23593047-edge.nvme0q87
      1098 =C2=B1 29%     +46.7%       1612 =C2=B1 25%  interrupts.CPU94.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%      +7.4%       1.90 =C2=B1 15%  interrupts.CPU94.IW=
I:IRQ_work_interrupts
    605811            +0.1%     606710        interrupts.CPU94.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU94.MCP:Machine_=
check_polls
      7136 =C2=B1 23%      +7.2%       7648 =C2=B1 15%  interrupts.CPU94.NM=
I:Non-maskable_interrupts
      7136 =C2=B1 23%      +7.2%       7648 =C2=B1 15%  interrupts.CPU94.PM=
I:Performance_monitoring_interrupts
    312.15 =C2=B1  3%      -0.5%     310.70        interrupts.CPU94.RES:Res=
cheduling_interrupts
      2.46 =C2=B1 46%     -26.9%       1.80 =C2=B1 73%  interrupts.CPU94.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU95.141:PCI-MSI.=
23593048-edge.nvme0q88
      0.00          -100.0%       0.00        interrupts.CPU95.154:PCI-MSI.=
23593048-edge.nvme0q88
      1117 =C2=B1 28%     +53.3%       1713 =C2=B1 20%  interrupts.CPU95.CA=
L:Function_call_interrupts
      2.31 =C2=B1 26%      +8.3%       2.50 =C2=B1 20%  interrupts.CPU95.IW=
I:IRQ_work_interrupts
    605988            +0.1%     606859        interrupts.CPU95.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU95.MCP:Machine_=
check_polls
      7142 =C2=B1 23%     +12.8%       8053        interrupts.CPU95.NMI:Non=
-maskable_interrupts
      7142 =C2=B1 23%     +12.8%       8053        interrupts.CPU95.PMI:Per=
formance_monitoring_interrupts
    317.54            +8.3%     343.80 =C2=B1 16%  interrupts.CPU95.RES:Res=
cheduling_interrupts
      3.23 =C2=B1 74%      +2.1%       3.30 =C2=B1 86%  interrupts.CPU95.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU96.140:PCI-MSI.=
23593057-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.CPU96.146:PCI-MSI.=
23593057-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.CPU96.149:PCI-MSI.=
23593057-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.CPU96.150:PCI-MSI.=
23593057-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.CPU96.159:PCI-MSI.=
23593057-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.CPU96.163:PCI-MSI.=
23593057-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.CPU96.172:PCI-MSI.=
23593057-edge.nvme0q97
      0.00          -100.0%       0.00        interrupts.CPU96.176:PCI-MSI.=
77824-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU96.176:PCI-MSI.=
79872-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU96.48:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU96.49:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU96.51:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU96.52:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU96.54:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU96.56:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU96.58:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU96.59:PCI-MSI.2=
3592960-edge.nvme0q0
     12760 =C2=B1 31%     +18.2%      15078 =C2=B1 10%  interrupts.CPU96.CA=
L:Function_call_interrupts
      1.69 =C2=B1 27%     +18.2%       2.00        interrupts.CPU96.IWI:IRQ=
_work_interrupts
    606147            +0.1%     606939        interrupts.CPU96.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU96.MCP:Machine_=
check_polls
      6947 =C2=B1 27%     +18.1%       8201        interrupts.CPU96.NMI:Non=
-maskable_interrupts
      6947 =C2=B1 27%     +18.1%       8201        interrupts.CPU96.PMI:Per=
formance_monitoring_interrupts
    344.46 =C2=B1 10%      +0.9%     347.60 =C2=B1  6%  interrupts.CPU96.RE=
S:Rescheduling_interrupts
      2.38 =C2=B1 79%     -45.5%       1.30 =C2=B1 69%  interrupts.CPU96.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU97.141:PCI-MSI.=
23593058-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.CPU97.145:PCI-MSI.=
23593058-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.CPU97.150:PCI-MSI.=
23593058-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.CPU97.153:PCI-MSI.=
23593058-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.CPU97.156:PCI-MSI.=
23593058-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.CPU97.164:PCI-MSI.=
23593058-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.CPU97.173:PCI-MSI.=
23593058-edge.nvme0q98
      0.00          -100.0%       0.00        interrupts.CPU97.177:PCI-MSI.=
79872-edge.ioat-msix
      0.00          -100.0%       0.00        interrupts.CPU97.53:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU97.64:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU97.72:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU97.73:PCI-MSI.2=
3592960-edge.nvme0q0
      0.00          -100.0%       0.00        interrupts.CPU97.77:PCI-MSI.2=
3592960-edge.nvme0q0
      4563 =C2=B1 50%     +42.8%       6516 =C2=B1 28%  interrupts.CPU97.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00 =C2=B1 22%  interrupts.CPU97.IW=
I:IRQ_work_interrupts
    606125            +0.1%     606850        interrupts.CPU97.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU97.MCP:Machine_=
check_polls
      7265 =C2=B1 23%      +7.3%       7792 =C2=B1 15%  interrupts.CPU97.NM=
I:Non-maskable_interrupts
      7265 =C2=B1 23%      +7.3%       7792 =C2=B1 15%  interrupts.CPU97.PM=
I:Performance_monitoring_interrupts
    379.92 =C2=B1 12%      +3.2%     392.20 =C2=B1 10%  interrupts.CPU97.RE=
S:Rescheduling_interrupts
      2.54 =C2=B1 81%     -48.8%       1.30 =C2=B1 69%  interrupts.CPU97.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU98.146:PCI-MSI.=
23593059-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.CPU98.152:PCI-MSI.=
23593059-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.CPU98.157:PCI-MSI.=
23593059-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.CPU98.159:PCI-MSI.=
23593059-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.CPU98.161:PCI-MSI.=
23593059-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.CPU98.165:PCI-MSI.=
23593059-edge.nvme0q99
      0.00          -100.0%       0.00        interrupts.CPU98.174:PCI-MSI.=
23593059-edge.nvme0q99
      2709 =C2=B1 44%      -9.6%       2449 =C2=B1 33%  interrupts.CPU98.CA=
L:Function_call_interrupts
      1.77 =C2=B1 23%     +13.0%       2.00        interrupts.CPU98.IWI:IRQ=
_work_interrupts
    606043            +0.1%     606837        interrupts.CPU98.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU98.MCP:Machine_=
check_polls
      7264 =C2=B1 23%     +12.9%       8202        interrupts.CPU98.NMI:Non=
-maskable_interrupts
      7264 =C2=B1 23%     +12.9%       8202        interrupts.CPU98.PMI:Per=
formance_monitoring_interrupts
    465.92 =C2=B1 35%      -0.2%     465.20 =C2=B1 21%  interrupts.CPU98.RE=
S:Rescheduling_interrupts
      2.31 =C2=B1 35%    +134.0%       5.40 =C2=B1203%  interrupts.CPU98.TL=
B:TLB_shootdowns
      0.00          -100.0%       0.00        interrupts.CPU99.143:PCI-MSI.=
23593060-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.CPU99.147:PCI-MSI.=
23593060-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.CPU99.152:PCI-MSI.=
23593060-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.CPU99.153:PCI-MSI.=
23593060-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.CPU99.155:PCI-MSI.=
23593060-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.CPU99.166:PCI-MSI.=
23593060-edge.nvme0q100
      0.00          -100.0%       0.00        interrupts.CPU99.175:PCI-MSI.=
23593060-edge.nvme0q100
      1879 =C2=B1 97%      -1.7%       1847 =C2=B1 30%  interrupts.CPU99.CA=
L:Function_call_interrupts
      1.92 =C2=B1 13%      +4.0%       2.00        interrupts.CPU99.IWI:IRQ=
_work_interrupts
    606008            +0.1%     606716        interrupts.CPU99.LOC:Local_ti=
mer_interrupts
      1.00            +0.0%       1.00        interrupts.CPU99.MCP:Machine_=
check_polls
      7897 =C2=B1 13%      +3.9%       8203        interrupts.CPU99.NMI:Non=
-maskable_interrupts
      7897 =C2=B1 13%      +3.9%       8203        interrupts.CPU99.PMI:Per=
formance_monitoring_interrupts
    505.38 =C2=B1 70%     +21.9%     616.10 =C2=B1126%  interrupts.CPU99.RE=
S:Rescheduling_interrupts
      2.15 =C2=B1 40%     -30.4%       1.50 =C2=B1 61%  interrupts.CPU99.TL=
B:TLB_shootdowns
    350.38 =C2=B1  4%      +1.7%     356.50 =C2=B1  4%  interrupts.IWI:IRQ_=
work_interrupts
 1.163e+08            +0.1%  1.165e+08        interrupts.LOC:Local_timer_in=
terrupts
    192.00            +0.0%     192.00        interrupts.MCP:Machine_check_=
polls
   1441522 =C2=B1  4%      +1.4%    1461294 =C2=B1  4%  interrupts.NMI:Non-=
maskable_interrupts
   1441522 =C2=B1  4%      +1.4%    1461294 =C2=B1  4%  interrupts.PMI:Perf=
ormance_monitoring_interrupts
     65638            +0.5%      65993        interrupts.RES:Rescheduling_i=
nterrupts
      0.00          -100.0%       0.00        interrupts.RTR:APIC_ICR_read_=
retries
    541.62 =C2=B1 23%     -25.8%     401.70 =C2=B1 52%  interrupts.TLB:TLB_=
shootdowns


> =

> ---
> From: Frederic Weisbecker <frederic@kernel.org>
> Date: Sun, 23 May 2021 14:23:30 +0200
> Subject: [PATCH] tick/nohz: Only check for RCU deferred wakeup on user/gu=
est
>  entry when needed
> =

> Checking for and processing RCU-nocb deferred wakeup upon user/guest
> entry is only relevant when nohz_full runs on the local CPU, otherwise
> the periodic tick should take care of it.
> =

> Make sure we don't needlessly pollute these fast-paths.
> =

> Reported-by: kernel test robot <oliver.sang@intel.com>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>  include/linux/entry-kvm.h | 3 ++-
>  include/linux/tick.h      | 7 +++++++
>  kernel/entry/common.c     | 5 +++--
>  kernel/time/tick-sched.c  | 1 +
>  4 files changed, 13 insertions(+), 3 deletions(-)
> =

> diff --git a/include/linux/entry-kvm.h b/include/linux/entry-kvm.h
> index 8b2b1d68b954..136b8d97d8c0 100644
> --- a/include/linux/entry-kvm.h
> +++ b/include/linux/entry-kvm.h
> @@ -3,6 +3,7 @@
>  #define __LINUX_ENTRYKVM_H
>  =

>  #include <linux/entry-common.h>
> +#include <linux/tick.h>
>  =

>  /* Transfer to guest mode work */
>  #ifdef CONFIG_KVM_XFER_TO_GUEST_WORK
> @@ -57,7 +58,7 @@ int xfer_to_guest_mode_handle_work(struct kvm_vcpu *vcp=
u);
>  static inline void xfer_to_guest_mode_prepare(void)
>  {
>  	lockdep_assert_irqs_disabled();
> -	rcu_nocb_flush_deferred_wakeup();
> +	tick_nohz_user_enter_prepare();
>  }
>  =

>  /**
> diff --git a/include/linux/tick.h b/include/linux/tick.h
> index 7340613c7eff..1a0ff88fa107 100644
> --- a/include/linux/tick.h
> +++ b/include/linux/tick.h
> @@ -11,6 +11,7 @@
>  #include <linux/context_tracking_state.h>
>  #include <linux/cpumask.h>
>  #include <linux/sched.h>
> +#include <linux/rcupdate.h>
>  =

>  #ifdef CONFIG_GENERIC_CLOCKEVENTS
>  extern void __init tick_init(void);
> @@ -300,4 +301,10 @@ static inline void tick_nohz_task_switch(void)
>  		__tick_nohz_task_switch();
>  }
>  =

> +static inline void tick_nohz_user_enter_prepare(void)
> +{
> +	if (tick_nohz_full_cpu(smp_processor_id()))
> +		rcu_nocb_flush_deferred_wakeup();
> +}
> +
>  #endif
> diff --git a/kernel/entry/common.c b/kernel/entry/common.c
> index a0b3b04fb596..bf16395b9e13 100644
> --- a/kernel/entry/common.c
> +++ b/kernel/entry/common.c
> @@ -5,6 +5,7 @@
>  #include <linux/highmem.h>
>  #include <linux/livepatch.h>
>  #include <linux/audit.h>
> +#include <linux/tick.h>
>  =

>  #include "common.h"
>  =

> @@ -186,7 +187,7 @@ static unsigned long exit_to_user_mode_loop(struct pt=
_regs *regs,
>  		local_irq_disable_exit_to_user();
>  =

>  		/* Check if any of the above work has queued a deferred wakeup */
> -		rcu_nocb_flush_deferred_wakeup();
> +		tick_nohz_user_enter_prepare();
>  =

>  		ti_work =3D READ_ONCE(current_thread_info()->flags);
>  	}
> @@ -202,7 +203,7 @@ static void exit_to_user_mode_prepare(struct pt_regs =
*regs)
>  	lockdep_assert_irqs_disabled();
>  =

>  	/* Flush pending rcuog wakeup before the last need_resched() check */
> -	rcu_nocb_flush_deferred_wakeup();
> +	tick_nohz_user_enter_prepare();
>  =

>  	if (unlikely(ti_work & EXIT_TO_USER_MODE_WORK))
>  		ti_work =3D exit_to_user_mode_loop(regs, ti_work);
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 828b091501ca..6784f27a3099 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -230,6 +230,7 @@ static void tick_sched_handle(struct tick_sched *ts, =
struct pt_regs *regs)
>  =

>  #ifdef CONFIG_NO_HZ_FULL
>  cpumask_var_t tick_nohz_full_mask;
> +EXPORT_SYMBOL_GPL(tick_nohz_full_mask);
>  bool tick_nohz_full_running;
>  EXPORT_SYMBOL_GPL(tick_nohz_full_running);
>  static atomic_t tick_dep_mask;
> -- =

> 2.25.1
>=20
--===============9148304181483884551==--

