Content-Type: multipart/mixed; boundary="===============1673480558491868935=="
MIME-Version: 1.0
From: kernel test robot <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: [mm/gup] 57efa1fe59: will-it-scale.per_thread_ops -9.2% regression
Date: Tue, 25 May 2021 11:16:36 +0800
Message-ID: <20210525031636.GB7744@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1673480558491868935==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



Greeting,

FYI, we noticed a -9.2% regression of will-it-scale.per_thread_ops due to c=
ommit:


commit: 57efa1fe5957694fa541c9062de0a127f0b9acb0 ("mm/gup: prevent gup_fast=
 from racing with COW during fork")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


in testcase: will-it-scale
on test machine: 96 threads 2 sockets Ice Lake with 256G memory
with following parameters:

	nr_task: 50%
	mode: thread
	test: mmap1
	cpufreq_governor: performance
	ucode: 0xb000280

test-description: Will It Scale takes a testcase and runs it from 1 through=
 to n parallel copies to see if the testcase will scale. It builds both a p=
rocess and threads based test in order to see any differences between the t=
wo.
test-url: https://github.com/antonblanchard/will-it-scale

In addition to that, the commit also has significant impact on the followin=
g tests:

+------------------+-------------------------------------------------------=
--------------------------+
| testcase: change | will-it-scale: will-it-scale.per_thread_ops 3.7% impro=
vement                    |
| test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @=
 2.10GHz with 128G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                            |
|                  | mode=3Dthread                                         =
                            |
|                  | nr_task=3D50%                                         =
                            |
|                  | test=3Dmmap1                                          =
                            |
|                  | ucode=3D0x5003006                                     =
                            |
+------------------+-------------------------------------------------------=
--------------------------+


If you fix the issue, kindly add following tag
Reported-by: kernel test robot <oliver.sang@intel.com>


Details are as below:
---------------------------------------------------------------------------=
----------------------->


To reproduce:

        git clone https://github.com/intel/lkp-tests.git
        cd lkp-tests
        bin/lkp install                job.yaml  # job file is attached in =
this email
        bin/lkp split-job --compatible job.yaml  # generate the yaml file f=
or lkp run
        bin/lkp run                    generated-yaml-file

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/50%/debian-10.4-x86_64-20200603.=
cgz/lkp-icl-2sp1/mmap1/will-it-scale/0xb000280

commit: =

  c28b1fc703 ("mm/gup: reorganize internal_get_user_pages_fast()")
  57efa1fe59 ("mm/gup: prevent gup_fast from racing with COW during fork")

c28b1fc70390df32 57efa1fe5957694fa541c9062de =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    342141            -9.2%     310805 =C2=B1  2%  will-it-scale.48.threads
      7127            -9.2%       6474 =C2=B1  2%  will-it-scale.per_thread=
_ops
    342141            -9.2%     310805 =C2=B1  2%  will-it-scale.workload
   2555927 =C2=B1  3%     +45.8%    3727702        meminfo.Committed_AS
     12108 =C2=B1 13%     -36.7%       7665 =C2=B1  7%  vmstat.system.cs
   1142492 =C2=B1 30%     -47.3%     602364 =C2=B1 11%  cpuidle.C1.usage
    282373 =C2=B1 13%     -45.6%     153684 =C2=B1  7%  cpuidle.POLL.usage
     48437 =C2=B1  3%      -5.9%      45563        proc-vmstat.nr_active_an=
on
     54617 =C2=B1  3%      -5.5%      51602        proc-vmstat.nr_shmem
     48437 =C2=B1  3%      -5.9%      45563        proc-vmstat.nr_zone_acti=
ve_anon
     70511 =C2=B1  3%      -5.1%      66942 =C2=B1  2%  proc-vmstat.pgactiv=
ate
    278653 =C2=B1  8%     +23.4%     343904 =C2=B1  4%  sched_debug.cpu.avg=
_idle.stddev
     22572 =C2=B1 16%     -36.3%      14378 =C2=B1  4%  sched_debug.cpu.nr_=
switches.avg
     66177 =C2=B1 16%     -36.8%      41800 =C2=B1 21%  sched_debug.cpu.nr_=
switches.max
     11613 =C2=B1 15%     -41.4%       6810 =C2=B1 23%  sched_debug.cpu.nr_=
switches.stddev
     22.96 =C2=B1 15%     +55.6%      35.73 =C2=B1 12%  perf-sched.total_wa=
it_and_delay.average.ms
     69713 =C2=B1 19%     -38.0%      43235 =C2=B1 12%  perf-sched.total_wa=
it_and_delay.count.ms
     22.95 =C2=B1 15%     +55.6%      35.72 =C2=B1 12%  perf-sched.total_wa=
it_time.average.ms
     29397 =C2=B1 23%     -35.3%      19030 =C2=B1 17%  perf-sched.wait_and=
_delay.count.rwsem_down_write_slowpath.down_write_killable.__vm_munmap.__x6=
4_sys_munmap
     31964 =C2=B1 20%     -50.8%      15738 =C2=B1 14%  perf-sched.wait_and=
_delay.count.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ks=
ys_mmap_pgoff
      4.59 =C2=B1  6%     +12.2%       5.15 =C2=B1  4%  perf-stat.i.MPKI
 3.105e+09            -2.1%   3.04e+09        perf-stat.i.branch-instructio=
ns
     12033 =C2=B1 12%     -36.8%       7600 =C2=B1  7%  perf-stat.i.context=
-switches
     10.06            +1.9%      10.25        perf-stat.i.cpi
 4.067e+09            -1.3%  4.016e+09        perf-stat.i.dTLB-loads
 4.521e+08            -5.1%  4.291e+08 =C2=B1  2%  perf-stat.i.dTLB-stores
 1.522e+10            -1.6%  1.497e+10        perf-stat.i.instructions
      0.10            -1.9%       0.10        perf-stat.i.ipc
      0.19 =C2=B1  8%     -22.8%       0.15 =C2=B1  5%  perf-stat.i.metric.=
K/sec
     80.30            -1.7%      78.93        perf-stat.i.metric.M/sec
    167270 =C2=B1  6%     -14.9%     142312 =C2=B1 11%  perf-stat.i.node-lo=
ads
     49.76            -1.6       48.11        perf-stat.i.node-store-miss-r=
ate%
   3945152            +6.2%    4189006        perf-stat.i.node-stores
      4.59 =C2=B1  6%     +12.1%       5.15 =C2=B1  4%  perf-stat.overall.M=
PKI
     10.04            +1.8%      10.23        perf-stat.overall.cpi
      0.10            -1.8%       0.10        perf-stat.overall.ipc
     49.76            -1.6       48.12        perf-stat.overall.node-store-=
miss-rate%
  13400506            +8.2%   14504566        perf-stat.overall.path-length
 3.094e+09            -2.1%   3.03e+09        perf-stat.ps.branch-instructi=
ons
     12087 =C2=B1 13%     -36.9%       7622 =C2=B1  7%  perf-stat.ps.contex=
t-switches
 4.054e+09            -1.3%  4.002e+09        perf-stat.ps.dTLB-loads
 4.508e+08            -5.1%  4.278e+08 =C2=B1  2%  perf-stat.ps.dTLB-stores
 1.516e+10            -1.6%  1.492e+10        perf-stat.ps.instructions
   3932404            +6.2%    4175831        perf-stat.ps.node-stores
 4.584e+12            -1.7%  4.506e+12        perf-stat.total.instructions
    364038 =C2=B1  6%     -40.3%     217265 =C2=B1  9%  interrupts.CAL:Func=
tion_call_interrupts
      5382 =C2=B1 33%     -63.4%       1970 =C2=B1 35%  interrupts.CPU44.CA=
L:Function_call_interrupts
      6325 =C2=B1 19%     -58.1%       2650 =C2=B1 37%  interrupts.CPU47.CA=
L:Function_call_interrupts
     11699 =C2=B1 19%     -60.6%       4610 =C2=B1 23%  interrupts.CPU48.CA=
L:Function_call_interrupts
     94.20 =C2=B1 22%     -45.8%      51.09 =C2=B1 46%  interrupts.CPU48.TL=
B:TLB_shootdowns
      9223 =C2=B1 24%     -52.5%       4383 =C2=B1 28%  interrupts.CPU49.CA=
L:Function_call_interrupts
      9507 =C2=B1 24%     -57.5%       4040 =C2=B1 27%  interrupts.CPU50.CA=
L:Function_call_interrupts
      4530 =C2=B1 18%     -33.9%       2993 =C2=B1 28%  interrupts.CPU62.CA=
L:Function_call_interrupts
     82.00 =C2=B1 21%     -41.9%      47.64 =C2=B1 38%  interrupts.CPU63.TL=
B:TLB_shootdowns
      4167 =C2=B1 16%     -45.4%       2276 =C2=B1 22%  interrupts.CPU64.CA=
L:Function_call_interrupts
    135.20 =C2=B1 31%     -58.4%      56.27 =C2=B1 51%  interrupts.CPU64.TL=
B:TLB_shootdowns
      4155 =C2=B1 17%     -42.5%       2387 =C2=B1 27%  interrupts.CPU65.CA=
L:Function_call_interrupts
     95.00 =C2=B1 48%     -53.8%      43.91 =C2=B1 42%  interrupts.CPU65.TL=
B:TLB_shootdowns
      4122 =C2=B1 20%     -39.4%       2497 =C2=B1 29%  interrupts.CPU66.CA=
L:Function_call_interrupts
      3954 =C2=B1 14%     -41.4%       2318 =C2=B1 28%  interrupts.CPU67.CA=
L:Function_call_interrupts
      3802 =C2=B1 17%     -41.9%       2209 =C2=B1 17%  interrupts.CPU70.CA=
L:Function_call_interrupts
      3787 =C2=B1 11%     -48.2%       1961 =C2=B1 29%  interrupts.CPU71.CA=
L:Function_call_interrupts
      3580 =C2=B1 14%     -45.1%       1964 =C2=B1 19%  interrupts.CPU72.CA=
L:Function_call_interrupts
      3711 =C2=B1 20%     -51.3%       1806 =C2=B1 25%  interrupts.CPU73.CA=
L:Function_call_interrupts
      3494 =C2=B1 21%     -40.6%       2076 =C2=B1 21%  interrupts.CPU76.CA=
L:Function_call_interrupts
      3416 =C2=B1 21%     -45.2%       1873 =C2=B1 26%  interrupts.CPU77.CA=
L:Function_call_interrupts
      3047 =C2=B1 24%     -38.0%       1890 =C2=B1 18%  interrupts.CPU78.CA=
L:Function_call_interrupts
      3102 =C2=B1 28%     -41.8%       1805 =C2=B1 16%  interrupts.CPU80.CA=
L:Function_call_interrupts
      2811 =C2=B1 23%     -36.5%       1785 =C2=B1 22%  interrupts.CPU83.CA=
L:Function_call_interrupts
      2617 =C2=B1 17%     -30.7%       1814 =C2=B1 30%  interrupts.CPU84.CA=
L:Function_call_interrupts
      3322 =C2=B1 25%     -38.1%       2055 =C2=B1 29%  interrupts.CPU87.CA=
L:Function_call_interrupts
      2941 =C2=B1 12%     -39.2%       1787 =C2=B1 27%  interrupts.CPU93.CA=
L:Function_call_interrupts
     72.56           -19.7       52.82        perf-profile.calltrace.cycles=
-pp.__mmap
     72.52           -19.7       52.78        perf-profile.calltrace.cycles=
-pp.entry_SYSCALL_64_after_hwframe.__mmap
     72.48           -19.7       52.74        perf-profile.calltrace.cycles=
-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     72.49           -19.7       52.76        perf-profile.calltrace.cycles=
-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mmap
     72.47           -19.7       52.74        perf-profile.calltrace.cycles=
-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.__mmap
     71.74           -19.7       52.04        perf-profile.calltrace.cycles=
-pp.down_write_killable.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
     71.63           -19.7       51.95        perf-profile.calltrace.cycles=
-pp.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_mmap_p=
goff.do_syscall_64
     71.52           -19.6       51.88        perf-profile.calltrace.cycles=
-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killable.vm_=
mmap_pgoff.ksys_mmap_pgoff
     70.12           -19.2       50.92        perf-profile.calltrace.cycles=
-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_kil=
lable.vm_mmap_pgoff
      0.91 =C2=B1  2%      -0.2        0.70        perf-profile.calltrace.c=
ycles-pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpat=
h.down_write_killable.vm_mmap_pgoff
      0.87 =C2=B1  2%      +0.1        0.95 =C2=B1  2%  perf-profile.calltr=
ace.cycles-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
      0.00            +0.6        0.63 =C2=B1  2%  perf-profile.calltrace.c=
ycles-pp.rwsem_spin_on_owner.rwsem_optimistic_spin.rwsem_down_write_slowpat=
h.down_write_killable.__vm_munmap
     24.24 =C2=B1  3%     +19.4       43.62        perf-profile.calltrace.c=
ycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_writ=
e_killable.__vm_munmap
     24.72 =C2=B1  3%     +19.8       44.47        perf-profile.calltrace.c=
ycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.down_write_killabl=
e.__vm_munmap.__x64_sys_munmap
     24.87 =C2=B1  3%     +19.8       44.62        perf-profile.calltrace.c=
ycles-pp.down_write_killable.__vm_munmap.__x64_sys_munmap.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
     24.78 =C2=B1  3%     +19.8       44.54        perf-profile.calltrace.c=
ycles-pp.rwsem_down_write_slowpath.down_write_killable.__vm_munmap.__x64_sy=
s_munmap.do_syscall_64
     25.94 =C2=B1  3%     +19.8       45.73        perf-profile.calltrace.c=
ycles-pp.entry_SYSCALL_64_after_hwframe.__munmap
     25.97 =C2=B1  3%     +19.8       45.77        perf-profile.calltrace.c=
ycles-pp.__munmap
     25.90 =C2=B1  3%     +19.8       45.70        perf-profile.calltrace.c=
ycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
     25.88 =C2=B1  3%     +19.8       45.68        perf-profile.calltrace.c=
ycles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mu=
nmap
     25.87 =C2=B1  3%     +19.8       45.67        perf-profile.calltrace.c=
ycles-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.__munmap
     72.57           -19.7       52.83        perf-profile.children.cycles-=
pp.__mmap
     72.48           -19.7       52.74        perf-profile.children.cycles-=
pp.ksys_mmap_pgoff
     72.48           -19.7       52.74        perf-profile.children.cycles-=
pp.vm_mmap_pgoff
      0.22 =C2=B1  5%      -0.1        0.14 =C2=B1  6%  perf-profile.childr=
en.cycles-pp.unmap_region
      0.08 =C2=B1 23%      -0.0        0.04 =C2=B1 61%  perf-profile.childr=
en.cycles-pp.__schedule
      0.06 =C2=B1  7%      -0.0        0.03 =C2=B1 75%  perf-profile.childr=
en.cycles-pp.perf_event_mmap
      0.12 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.childr=
en.cycles-pp.up_write
      0.09 =C2=B1  7%      -0.0        0.06 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.unmap_vmas
      0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.up_read
      0.18 =C2=B1  2%      +0.0        0.20 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.vm_area_dup
      0.18 =C2=B1  5%      +0.0        0.21 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.vma_merge
      0.12 =C2=B1  4%      +0.0        0.14 =C2=B1  4%  perf-profile.childr=
en.cycles-pp.kmem_cache_free
      0.19 =C2=B1  6%      +0.0        0.23 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.get_unmapped_area
      0.16 =C2=B1  6%      +0.0        0.20 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.vm_unmapped_area
      0.17 =C2=B1  6%      +0.0        0.21 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.arch_get_unmapped_area_topdown
      0.07 =C2=B1 10%      +0.1        0.14 =C2=B1 16%  perf-profile.childr=
en.cycles-pp.find_vma
      0.27 =C2=B1  4%      +0.1        0.35 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__vma_adjust
      0.35 =C2=B1  2%      +0.1        0.43 =C2=B1  3%  perf-profile.childr=
en.cycles-pp.__split_vma
      0.87 =C2=B1  2%      +0.1        0.95 =C2=B1  2%  perf-profile.childr=
en.cycles-pp.__do_munmap
      1.23            +0.1        1.33        perf-profile.children.cycles-=
pp.rwsem_spin_on_owner
     25.98 =C2=B1  3%     +19.8       45.78        perf-profile.children.cy=
cles-pp.__munmap
     25.87 =C2=B1  3%     +19.8       45.68        perf-profile.children.cy=
cles-pp.__vm_munmap
     25.88 =C2=B1  3%     +19.8       45.68        perf-profile.children.cy=
cles-pp.__x64_sys_munmap
      0.53 =C2=B1  2%      -0.2        0.35 =C2=B1  3%  perf-profile.self.c=
ycles-pp.rwsem_optimistic_spin
      0.08 =C2=B1  5%      -0.1        0.03 =C2=B1 75%  perf-profile.self.c=
ycles-pp.do_mmap
      0.11 =C2=B1  6%      -0.0        0.09 =C2=B1  5%  perf-profile.self.c=
ycles-pp.up_write
      0.19 =C2=B1  4%      -0.0        0.16 =C2=B1  5%  perf-profile.self.c=
ycles-pp.down_write_killable
      0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  8%  perf-profile.self.c=
ycles-pp.downgrade_write
      0.11 =C2=B1  4%      +0.0        0.14 =C2=B1  4%  perf-profile.self.c=
ycles-pp.__vma_adjust
      0.16 =C2=B1  6%      +0.0        0.20 =C2=B1  3%  perf-profile.self.c=
ycles-pp.vm_unmapped_area
      0.05 =C2=B1  9%      +0.0        0.10 =C2=B1 13%  perf-profile.self.c=
ycles-pp.find_vma
      1.21            +0.1        1.31        perf-profile.self.cycles-pp.r=
wsem_spin_on_owner


                                                                           =
     =

                           will-it-scale.per_thread_ops                    =
     =

                                                                           =
     =

  7400 +-------------------------------------------------------------------=
-+   =

       |                                                      +            =
 |   =

  7200 |.++.                  .+. +.+        .++.            : :.+ .+  +.  =
 |   =

       |    ++.+.++         ++   +   +.+.++.+    ++.+.++.++. : +  +  : : + =
 |   =

  7000 |-+         + +     :                                +        ::    =
 |   =

       |            + + .+ :                                          +    =
 |   =

  6800 |-+             +  +                                                =
 |   =

       |                                                          O        =
 |   =

  6600 |-+        O    O            O  O    O O  OO      OO    O           =
 |   =

       | OO  O   O  O    OO O        O   O     O    O  O    O O          O =
 |   =

  6400 |-+     O     O       O O  O                   O               OO  O=
 |   =

       |                                  O                      O  O      =
 |   =

  6200 |-+                       O                                         =
 |   =

       |    O                                                              =
 |   =

  6000 +-------------------------------------------------------------------=
-+   =

                                                                           =
     =

                                                                           =
     =

[*] bisect-good sample
[O] bisect-bad  sample

***************************************************************************=
************************
lkp-csl-2sp9: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10GH=
z with 128G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/testc=
ase/ucode:
  gcc-9/performance/x86_64-rhel-8.3/thread/50%/debian-10.4-x86_64-20200603.=
cgz/lkp-csl-2sp9/mmap1/will-it-scale/0x5003006

commit: =

  c28b1fc703 ("mm/gup: reorganize internal_get_user_pages_fast()")
  57efa1fe59 ("mm/gup: prevent gup_fast from racing with COW during fork")

c28b1fc70390df32 57efa1fe5957694fa541c9062de =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

    247840            +3.7%     257132 =C2=B1  2%  will-it-scale.44.threads
      5632            +3.7%       5843 =C2=B1  2%  will-it-scale.per_thread=
_ops
    247840            +3.7%     257132 =C2=B1  2%  will-it-scale.workload
      0.10 =C2=B1  5%      +0.0        0.13 =C2=B1  8%  perf-profile.childr=
en.cycles-pp.find_vma
     14925 =C2=B1 19%     -48.2%       7724 =C2=B1  8%  softirqs.CPU87.SCHED
      9950 =C2=B1  3%     -36.1%       6355 =C2=B1  2%  vmstat.system.cs
   3312916 =C2=B1  4%     +13.9%    3774536 =C2=B1  9%  cpuidle.C1.time
   1675504 =C2=B1  5%     -36.6%    1061625        cpuidle.POLL.time
    987055 =C2=B1  5%     -41.8%     574757 =C2=B1  2%  cpuidle.POLL.usage
    165545 =C2=B1  3%     -12.2%     145358 =C2=B1  4%  meminfo.Active
    165235 =C2=B1  3%     -12.1%     145188 =C2=B1  4%  meminfo.Active(anon)
    180757 =C2=B1  3%     -11.7%     159538 =C2=B1  3%  meminfo.Shmem
   2877001 =C2=B1 11%     +16.2%    3342948 =C2=B1 10%  sched_debug.cfs_rq:=
/.min_vruntime.avg
   5545708 =C2=B1 11%      +9.8%    6086941 =C2=B1  8%  sched_debug.cfs_rq:=
/.min_vruntime.max
   2773178 =C2=B1 11%     +15.4%    3199941 =C2=B1  9%  sched_debug.cfs_rq:=
/.spread0.avg
    733740 =C2=B1  3%     -12.0%     646033 =C2=B1  5%  sched_debug.cpu.avg=
_idle.avg
     17167 =C2=B1 10%     -28.2%      12332 =C2=B1  7%  sched_debug.cpu.nr_=
switches.avg
     49180 =C2=B1 14%     -33.5%      32687 =C2=B1 22%  sched_debug.cpu.nr_=
switches.max
      9311 =C2=B1 18%     -36.2%       5943 =C2=B1 22%  sched_debug.cpu.nr_=
switches.stddev
     41257 =C2=B1  3%     -12.1%      36252 =C2=B1  4%  proc-vmstat.nr_acti=
ve_anon
    339681            -1.6%     334294        proc-vmstat.nr_file_pages
     10395            -3.5%      10036        proc-vmstat.nr_mapped
     45130 =C2=B1  3%     -11.7%      39848 =C2=B1  3%  proc-vmstat.nr_shmem
     41257 =C2=B1  3%     -12.1%      36252 =C2=B1  4%  proc-vmstat.nr_zone=
_active_anon
    841530            -1.7%     826917        proc-vmstat.numa_local
     21515 =C2=B1 11%     -68.9%       6684 =C2=B1 70%  proc-vmstat.numa_pa=
ges_migrated
     60224 =C2=B1  3%     -11.1%      53513 =C2=B1  3%  proc-vmstat.pgactiv=
ate
    981265            -2.5%     956415        proc-vmstat.pgalloc_normal
    895893            -1.9%     878978        proc-vmstat.pgfree
     21515 =C2=B1 11%     -68.9%       6684 =C2=B1 70%  proc-vmstat.pgmigra=
te_success
      0.07 =C2=B1135%     -74.1%       0.02 =C2=B1  5%  perf-sched.sch_dela=
y.max.ms.preempt_schedule_common._cond_resched.stop_one_cpu.__set_cpus_allo=
wed_ptr.sched_setaffinity
     21.44 =C2=B1  5%     +80.9%      38.79 =C2=B1  3%  perf-sched.total_wa=
it_and_delay.average.ms
     67273 =C2=B1  6%     -44.9%      37095 =C2=B1  5%  perf-sched.total_wa=
it_and_delay.count.ms
     21.44 =C2=B1  5%     +80.9%      38.79 =C2=B1  3%  perf-sched.total_wa=
it_time.average.ms
      0.08 =C2=B1 14%     +60.1%       0.13 =C2=B1  9%  perf-sched.wait_and=
_delay.avg.ms.rwsem_down_write_slowpath.down_write_killable.__vm_munmap.__x=
64_sys_munmap
      0.09 =C2=B1 12%     +58.0%       0.15 =C2=B1 15%  perf-sched.wait_and=
_delay.avg.ms.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.k=
sys_mmap_pgoff
    255.38 =C2=B1 14%     +22.1%     311.71 =C2=B1 17%  perf-sched.wait_and=
_delay.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constpro=
p.0.do_sys_poll
     31877 =C2=B1 10%     -54.2%      14606 =C2=B1 13%  perf-sched.wait_and=
_delay.count.rwsem_down_write_slowpath.down_write_killable.__vm_munmap.__x6=
4_sys_munmap
     27110 =C2=B1  7%     -47.3%      14280 =C2=B1  4%  perf-sched.wait_and=
_delay.count.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ks=
ys_mmap_pgoff
    138.60 =C2=B1 13%     -21.4%     109.00 =C2=B1 15%  perf-sched.wait_and=
_delay.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop=
.0.do_sys_poll
      1.00 =C2=B1199%     -99.9%       0.00 =C2=B1200%  perf-sched.wait_tim=
e.avg.ms.preempt_schedule_common._cond_resched.remove_vma.__do_munmap.__vm_=
munmap
      0.08 =C2=B1 14%     +60.9%       0.13 =C2=B1  9%  perf-sched.wait_tim=
e.avg.ms.rwsem_down_write_slowpath.down_write_killable.__vm_munmap.__x64_sy=
s_munmap
      0.09 =C2=B1 12%     +58.2%       0.15 =C2=B1 15%  perf-sched.wait_tim=
e.avg.ms.rwsem_down_write_slowpath.down_write_killable.vm_mmap_pgoff.ksys_m=
map_pgoff
    255.38 =C2=B1 14%     +22.1%     311.71 =C2=B1 17%  perf-sched.wait_tim=
e.avg.ms.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.d=
o_sys_poll
      1.00 =C2=B1199%     -99.9%       0.00 =C2=B1200%  perf-sched.wait_tim=
e.max.ms.preempt_schedule_common._cond_resched.remove_vma.__do_munmap.__vm_=
munmap
      4.99           -36.1%       3.19 =C2=B1 36%  perf-sched.wait_time.max=
.ms.rcu_gp_kthread.kthread.ret_from_fork
      9869 =C2=B1  3%     -36.2%       6295 =C2=B1  2%  perf-stat.i.context=
-switches
      0.00 =C2=B1  7%      +0.0        0.00 =C2=B1 29%  perf-stat.i.dTLB-lo=
ad-miss-rate%
     76953 =C2=B1  7%    +327.4%     328871 =C2=B1 29%  perf-stat.i.dTLB-lo=
ad-misses
   4152320            -3.0%    4026365        perf-stat.i.iTLB-load-misses
   1665297            -2.2%    1628746        perf-stat.i.iTLB-loads
      8627            +3.5%       8933        perf-stat.i.instructions-per-=
iTLB-miss
      0.33 =C2=B1  3%     -11.0%       0.29 =C2=B1  6%  perf-stat.i.metric.=
K/sec
     87.42            +1.7       89.11        perf-stat.i.node-load-miss-ra=
te%
   7507752            -9.2%    6814138        perf-stat.i.node-load-misses
   1078418 =C2=B1  2%     -22.9%     831563 =C2=B1  3%  perf-stat.i.node-lo=
ads
   3091445            -8.2%    2838247        perf-stat.i.node-store-misses
      0.00 =C2=B1  7%      +0.0        0.00 =C2=B1 29%  perf-stat.overall.d=
TLB-load-miss-rate%
      8599            +3.6%       8907        perf-stat.overall.instruction=
s-per-iTLB-miss
     87.44            +1.7       89.13        perf-stat.overall.node-load-m=
iss-rate%
  43415811            -3.3%   41994695 =C2=B1  2%  perf-stat.overall.path-l=
ength
      9895 =C2=B1  3%     -36.4%       6291 =C2=B1  2%  perf-stat.ps.contex=
t-switches
     76756 =C2=B1  7%    +327.0%     327716 =C2=B1 29%  perf-stat.ps.dTLB-l=
oad-misses
   4138410            -3.0%    4012712        perf-stat.ps.iTLB-load-misses
   1659653            -2.2%    1623167        perf-stat.ps.iTLB-loads
   7483002            -9.2%    6791226        perf-stat.ps.node-load-misses
   1074856 =C2=B1  2%     -22.9%     828780 =C2=B1  3%  perf-stat.ps.node-l=
oads
   3081222            -8.2%    2828732        perf-stat.ps.node-store-misses
    335021 =C2=B1  2%     -27.9%     241715 =C2=B1 12%  interrupts.CAL:Func=
tion_call_interrupts
      3662 =C2=B1 31%     -61.3%       1417 =C2=B1 16%  interrupts.CPU10.CA=
L:Function_call_interrupts
      4671 =C2=B1 32%     -65.6%       1607 =C2=B1 30%  interrupts.CPU12.CA=
L:Function_call_interrupts
      4999 =C2=B1 34%     -68.1%       1592 =C2=B1 43%  interrupts.CPU14.CA=
L:Function_call_interrupts
    129.00 =C2=B1 30%     -46.8%      68.60 =C2=B1 34%  interrupts.CPU14.RE=
S:Rescheduling_interrupts
      4531 =C2=B1 49%     -58.5%       1881 =C2=B1 39%  interrupts.CPU15.CA=
L:Function_call_interrupts
      4639 =C2=B1 28%     -37.6%       2893 =C2=B1  2%  interrupts.CPU18.NM=
I:Non-maskable_interrupts
      4639 =C2=B1 28%     -37.6%       2893 =C2=B1  2%  interrupts.CPU18.PM=
I:Performance_monitoring_interrupts
      6310 =C2=B1 49%     -68.5%       1988 =C2=B1 57%  interrupts.CPU21.CA=
L:Function_call_interrupts
    149.40 =C2=B1 49%     -49.3%      75.80 =C2=B1 42%  interrupts.CPU21.RE=
S:Rescheduling_interrupts
      3592 =C2=B1 38%     -63.0%       1330 =C2=B1 14%  interrupts.CPU24.CA=
L:Function_call_interrupts
      5350 =C2=B1 21%     -30.5%       3720 =C2=B1 44%  interrupts.CPU24.NM=
I:Non-maskable_interrupts
      5350 =C2=B1 21%     -30.5%       3720 =C2=B1 44%  interrupts.CPU24.PM=
I:Performance_monitoring_interrupts
    139.00 =C2=B1 27%     -33.4%      92.60 =C2=B1 26%  interrupts.CPU24.RE=
S:Rescheduling_interrupts
      3858 =C2=B1 42%     -53.7%       1785 =C2=B1 38%  interrupts.CPU26.CA=
L:Function_call_interrupts
      5964 =C2=B1 28%     -42.4%       3432 =C2=B1 55%  interrupts.CPU27.NM=
I:Non-maskable_interrupts
      5964 =C2=B1 28%     -42.4%       3432 =C2=B1 55%  interrupts.CPU27.PM=
I:Performance_monitoring_interrupts
      3429 =C2=B1 37%     -57.1%       1470 =C2=B1 44%  interrupts.CPU28.CA=
L:Function_call_interrupts
      3008 =C2=B1 35%     -37.6%       1877 =C2=B1 38%  interrupts.CPU29.CA=
L:Function_call_interrupts
      4684 =C2=B1 73%     -60.0%       1872 =C2=B1 34%  interrupts.CPU30.CA=
L:Function_call_interrupts
      4300 =C2=B1 46%     -54.7%       1949 =C2=B1 13%  interrupts.CPU43.CA=
L:Function_call_interrupts
     10255 =C2=B1 26%     -50.0%       5127 =C2=B1 29%  interrupts.CPU44.CA=
L:Function_call_interrupts
      5800 =C2=B1 20%     -28.3%       4158 =C2=B1 27%  interrupts.CPU52.CA=
L:Function_call_interrupts
      4802 =C2=B1 19%     -31.7%       3279 =C2=B1 18%  interrupts.CPU58.CA=
L:Function_call_interrupts
      4042 =C2=B1 32%     -65.6%       1391 =C2=B1 41%  interrupts.CPU6.CAL=
:Function_call_interrupts
    128.60 =C2=B1 31%     -52.9%      60.60 =C2=B1 38%  interrupts.CPU6.RES=
:Rescheduling_interrupts
      4065 =C2=B1 20%     -37.8%       2530 =C2=B1  6%  interrupts.CPU63.CA=
L:Function_call_interrupts
      4340 =C2=B1 24%     -36.2%       2771 =C2=B1 11%  interrupts.CPU64.CA=
L:Function_call_interrupts
      3983 =C2=B1 11%     -27.1%       2904 =C2=B1 19%  interrupts.CPU65.CA=
L:Function_call_interrupts
      3392 =C2=B1 25%     -55.2%       1518 =C2=B1 53%  interrupts.CPU7.CAL=
:Function_call_interrupts
    171.80 =C2=B1 67%     -62.5%      64.40 =C2=B1 32%  interrupts.CPU7.RES=
:Rescheduling_interrupts
      2942 =C2=B1 33%     -50.5%       1455 =C2=B1 25%  interrupts.CPU8.CAL=
:Function_call_interrupts
      7818           -27.3%       5681 =C2=B1 31%  interrupts.CPU85.NMI:Non=
-maskable_interrupts
      7818           -27.3%       5681 =C2=B1 31%  interrupts.CPU85.PMI:Per=
formance_monitoring_interrupts
    320.80 =C2=B1 54%     -44.6%     177.80 =C2=B1 58%  interrupts.CPU87.TL=
B:TLB_shootdowns
      3212 =C2=B1 31%     -64.8%       1130 =C2=B1 36%  interrupts.CPU9.CAL=
:Function_call_interrupts





Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


---
0DAY/LKP+ Test Infrastructure                   Open Source Technology Cent=
er
https://lists.01.org/hyperkitty/list/lkp(a)lists.01.org       Intel Corpora=
tion

Thanks,
Oliver Sang


--===============1673480558491868935==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job-script.ksh"

IyEvYmluL3NoCgpleHBvcnRfdG9wX2VudigpCnsKCWV4cG9ydCBzdWl0ZT0nd2lsbC1pdC1zY2Fs
ZScKCWV4cG9ydCB0ZXN0Y2FzZT0nd2lsbC1pdC1zY2FsZScKCWV4cG9ydCBjYXRlZ29yeT0nYmVu
Y2htYXJrJwoJZXhwb3J0IG5yX3Rhc2s9NDgKCWV4cG9ydCBqb2Jfb3JpZ2luPSd3aWxsLWl0LXNj
YWxlLXBhcnQyLnlhbWwnCglleHBvcnQgcXVldWVfY21kbGluZV9rZXlzPQoJZXhwb3J0IHF1ZXVl
PSd2aXAnCglleHBvcnQgdGVzdGJveD0nbGtwLWljbC0yc3AxJwoJZXhwb3J0IHRib3hfZ3JvdXA9
J2xrcC1pY2wtMnNwMScKCWV4cG9ydCBrY29uZmlnPSd4ODZfNjQtcmhlbC04LjMnCglleHBvcnQg
c3VibWl0X2lkPSc2MDgyNzFlYjBiOWE5MzY2Y2Y3NWFhOGInCglleHBvcnQgam9iX2ZpbGU9Jy9s
a3Avam9icy9zY2hlZHVsZWQvbGtwLWljbC0yc3AxL3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2Ut
dGhyZWFkLTUwJS1tbWFwMS11Y29kZT0weGIwMDAyODAtbW9uaXRvcj03MGQ2ZDcxOC1kZWJpYW4t
MTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6LTU3ZWZhMWZlNTk1NzY5NGZhNTQxLTIwMjEwNDIzLTI2
MzE5LTFmdXBremgtMy55YW1sJwoJZXhwb3J0IGlkPScyZDMzMzA3OTYxMWI3MzE5OTU4NzM5MmQ4
MTlmZDM2ZGM4NzA1ODFhJwoJZXhwb3J0IHF1ZXVlcl92ZXJzaW9uPScvbGtwL3hzYW5nLy5zcmMt
MjAyMTA0MjMtMTAzMjM2JwoJZXhwb3J0IG1vZGVsPSdJY2UgTGFrZScKCWV4cG9ydCBucl9ub2Rl
PTIKCWV4cG9ydCBucl9jcHU9OTYKCWV4cG9ydCBtZW1vcnk9JzI1NkcnCglleHBvcnQgbnJfaGRk
X3BhcnRpdGlvbnM9MQoJZXhwb3J0IGhkZF9wYXJ0aXRpb25zPScvZGV2L2Rpc2svYnktaWQvYXRh
LVNUOTUwMDUzME5TXzlTUDFLTEFSLXBhcnQxJwoJZXhwb3J0IHNzZF9wYXJ0aXRpb25zPScvZGV2
L252bWUwbjFwMScKCWV4cG9ydCBzd2FwX3BhcnRpdGlvbnM9CglleHBvcnQga2VybmVsX2NtZGxp
bmVfaHc9J2FjcGlfcnNkcD0weDY2NWZkMDE0JwoJZXhwb3J0IHJvb3Rmc19wYXJ0aXRpb249Jy9k
ZXYvZGlzay9ieS1pZC9hdGEtSU5URUxfU1NEU0MyQkI4MDBHNF9QSFdMNDIwNDAwNUs4MDBSR04t
cGFydDMnCglleHBvcnQgY29tbWl0PSc1N2VmYTFmZTU5NTc2OTRmYTU0MWM5MDYyZGUwYTEyN2Yw
YjlhY2IwJwoJZXhwb3J0IHVjb2RlPScweGIwMDAyODAnCglleHBvcnQgbmVlZF9rY29uZmlnX2h3
PSdDT05GSUdfSUdCPXkKQ09ORklHX0lYR0JFPXkKQ09ORklHX1NBVEFfQUhDSScKCWV4cG9ydCBl
bnF1ZXVlX3RpbWU9JzIwMjEtMDQtMjMgMTU6MDY6MTkgKzA4MDAnCglleHBvcnQgX2lkPSc2MDgy
NzFlZjBiOWE5MzY2Y2Y3NWFhOGUnCglleHBvcnQgX3J0PScvcmVzdWx0L3dpbGwtaXQtc2NhbGUv
cGVyZm9ybWFuY2UtdGhyZWFkLTUwJS1tbWFwMS11Y29kZT0weGIwMDAyODAtbW9uaXRvcj03MGQ2
ZDcxOC9sa3AtaWNsLTJzcDEvZGViaWFuLTEwLjQteDg2XzY0LTIwMjAwNjAzLmNnei94ODZfNjQt
cmhlbC04LjMvZ2NjLTkvNTdlZmExZmU1OTU3Njk0ZmE1NDFjOTA2MmRlMGExMjdmMGI5YWNiMCcK
CWV4cG9ydCB1c2VyPSdsa3AnCglleHBvcnQgY29tcGlsZXI9J2djYy05JwoJZXhwb3J0IExLUF9T
RVJWRVI9J2ludGVybmFsLWxrcC1zZXJ2ZXInCglleHBvcnQgaGVhZF9jb21taXQ9JzU5ZDQ5MmZm
ODMyZTU3NDU2YTgzZDU2NTIwMDk0MzRhNDQ4NzRhM2UnCglleHBvcnQgYmFzZV9jb21taXQ9J2Y0
MGRkY2U4ODU5MzQ4MjkxOTc2MWY3NDkxMGY0MmY0Yjg0YzAwNGInCglleHBvcnQgYnJhbmNoPSds
aW51cy9tYXN0ZXInCglleHBvcnQgcm9vdGZzPSdkZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMu
Y2d6JwoJZXhwb3J0IG1vbml0b3Jfc2hhPSc3MGQ2ZDcxOCcKCWV4cG9ydCByZXN1bHRfcm9vdD0n
L3Jlc3VsdC93aWxsLWl0LXNjYWxlL3BlcmZvcm1hbmNlLXRocmVhZC01MCUtbW1hcDEtdWNvZGU9
MHhiMDAwMjgwLW1vbml0b3I9NzBkNmQ3MTgvbGtwLWljbC0yc3AxL2RlYmlhbi0xMC40LXg4Nl82
NC0yMDIwMDYwMy5jZ3oveDg2XzY0LXJoZWwtOC4zL2djYy05LzU3ZWZhMWZlNTk1NzY5NGZhNTQx
YzkwNjJkZTBhMTI3ZjBiOWFjYjAvOCcKCWV4cG9ydCBzY2hlZHVsZXJfdmVyc2lvbj0nL2xrcC9s
a3AvLnNyYy0yMDIxMDQyMi0xNTM3MjcnCglleHBvcnQgYXJjaD0neDg2XzY0JwoJZXhwb3J0IG1h
eF91cHRpbWU9MjEwMAoJZXhwb3J0IGluaXRyZD0nL29zaW1hZ2UvZGViaWFuL2RlYmlhbi0xMC40
LXg4Nl82NC0yMDIwMDYwMy5jZ3onCglleHBvcnQgYm9vdGxvYWRlcl9hcHBlbmQ9J3Jvb3Q9L2Rl
di9yYW0wCnVzZXI9bGtwCmpvYj0vbGtwL2pvYnMvc2NoZWR1bGVkL2xrcC1pY2wtMnNwMS93aWxs
LWl0LXNjYWxlLXBlcmZvcm1hbmNlLXRocmVhZC01MCUtbW1hcDEtdWNvZGU9MHhiMDAwMjgwLW1v
bml0b3I9NzBkNmQ3MTgtZGViaWFuLTEwLjQteDg2XzY0LTIwMjAwNjAzLmNnei01N2VmYTFmZTU5
NTc2OTRmYTU0MS0yMDIxMDQyMy0yNjMxOS0xZnVwa3poLTMueWFtbApBUkNIPXg4Nl82NAprY29u
ZmlnPXg4Nl82NC1yaGVsLTguMwpicmFuY2g9bGludXMvbWFzdGVyCmNvbW1pdD01N2VmYTFmZTU5
NTc2OTRmYTU0MWM5MDYyZGUwYTEyN2YwYjlhY2IwCkJPT1RfSU1BR0U9L3BrZy9saW51eC94ODZf
NjQtcmhlbC04LjMvZ2NjLTkvNTdlZmExZmU1OTU3Njk0ZmE1NDFjOTA2MmRlMGExMjdmMGI5YWNi
MC92bWxpbnV6LTUuMTAuMC0wMDA0NC1nNTdlZmExZmU1OTU3CmFjcGlfcnNkcD0weDY2NWZkMDE0
Cm1heF91cHRpbWU9MjEwMApSRVNVTFRfUk9PVD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9y
bWFuY2UtdGhyZWFkLTUwJS1tbWFwMS11Y29kZT0weGIwMDAyODAtbW9uaXRvcj03MGQ2ZDcxOC9s
a3AtaWNsLTJzcDEvZGViaWFuLTEwLjQteDg2XzY0LTIwMjAwNjAzLmNnei94ODZfNjQtcmhlbC04
LjMvZ2NjLTkvNTdlZmExZmU1OTU3Njk0ZmE1NDFjOTA2MmRlMGExMjdmMGI5YWNiMC84CkxLUF9T
RVJWRVI9aW50ZXJuYWwtbGtwLXNlcnZlcgpub2thc2xyCnNlbGludXg9MApkZWJ1ZwphcGljPWRl
YnVnCnN5c3JxX2Fsd2F5c19lbmFibGVkCnJjdXBkYXRlLnJjdV9jcHVfc3RhbGxfdGltZW91dD0x
MDAKbmV0LmlmbmFtZXM9MApwcmludGsuZGV2a21zZz1vbgpwYW5pYz0tMQpzb2Z0bG9ja3VwX3Bh
bmljPTEKbm1pX3dhdGNoZG9nPXBhbmljCm9vcHM9cGFuaWMKbG9hZF9yYW1kaXNrPTIKcHJvbXB0
X3JhbWRpc2s9MApkcmJkLm1pbm9yX2NvdW50PTgKc3lzdGVtZC5sb2dfbGV2ZWw9ZXJyCmlnbm9y
ZV9sb2dsZXZlbApjb25zb2xlPXR0eTAKZWFybHlwcmludGs9dHR5UzAsMTE1MjAwCmNvbnNvbGU9
dHR5UzAsMTE1MjAwCnZnYT1ub3JtYWwKcncnCglleHBvcnQgbW9kdWxlc19pbml0cmQ9Jy9wa2cv
bGludXgveDg2XzY0LXJoZWwtOC4zL2djYy05LzU3ZWZhMWZlNTk1NzY5NGZhNTQxYzkwNjJkZTBh
MTI3ZjBiOWFjYjAvbW9kdWxlcy5jZ3onCglleHBvcnQgYm1faW5pdHJkPScvb3NpbWFnZS9kZXBz
L2RlYmlhbi0xMC40LXg4Nl82NC0yMDIwMDYwMy5jZ3ovcnVuLWlwY29uZmlnXzIwMjAwNjA4LmNn
eiwvb3NpbWFnZS9kZXBzL2RlYmlhbi0xMC40LXg4Nl82NC0yMDIwMDYwMy5jZ3ovbGtwXzIwMjAx
MjExLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi0xMC40LXg4Nl82NC0yMDIwMDYwMy5jZ3ovcnN5
bmMtcm9vdGZzXzIwMjAwNjA4LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi0xMC40LXg4Nl82NC0y
MDIwMDYwMy5jZ3ovd2lsbC1pdC1zY2FsZV8yMDIxMDQwMS5jZ3osL29zaW1hZ2UvcGtnL2RlYmlh
bi0xMC40LXg4Nl82NC0yMDIwMDYwMy5jZ3ovd2lsbC1pdC1zY2FsZS14ODZfNjQtYTM0YTg1Yy0x
XzIwMjEwNDAxLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi0xMC40LXg4Nl82NC0yMDIwMDYwMy5j
Z3ovbXBzdGF0XzIwMjAwNzE0LmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi0xMC40LXg4Nl82NC0y
MDIwMDYwMy5jZ3ovcGVyZl8yMDIwMTEyNi5jZ3osL29zaW1hZ2UvcGtnL2RlYmlhbi0xMC40LXg4
Nl82NC0yMDIwMDYwMy5jZ3ovcGVyZi14ODZfNjQtZDE5Y2M0YmZiZmYxLTFfMjAyMTA0MDEuY2d6
LC9vc2ltYWdlL3BrZy9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6L3Nhci14ODZfNjQt
MzRjOTJhZS0xXzIwMjAwNzAyLmNneiwvb3NpbWFnZS9kZXBzL2RlYmlhbi0xMC40LXg4Nl82NC0y
MDIwMDYwMy5jZ3ovaHdfMjAyMDA3MTUuY2d6JwoJZXhwb3J0IHVjb2RlX2luaXRyZD0nL29zaW1h
Z2UvdWNvZGUvaW50ZWwtdWNvZGUtMjAyMDExMTcuY2d6JwoJZXhwb3J0IGxrcF9pbml0cmQ9Jy9v
c2ltYWdlL3VzZXIvbGtwL2xrcC14ODZfNjQuY2d6JwoJZXhwb3J0IHNpdGU9J2lubicKCWV4cG9y
dCBMS1BfQ0dJX1BPUlQ9ODAKCWV4cG9ydCBMS1BfQ0lGU19QT1JUPTEzOQoJZXhwb3J0IGxhc3Rf
a2VybmVsPSc1LjEwLjAtMDAwNDQtZzU3ZWZhMWZlNTk1NycKCWV4cG9ydCBnb29kX3NhbXBsZXM9
JzcwODQKNjg3Mwo2OTcxJwoJZXhwb3J0IHF1ZXVlX2F0X2xlYXN0X29uY2U9MQoJZXhwb3J0IGtl
cm5lbD0nL3BrZy9saW51eC94ODZfNjQtcmhlbC04LjMvZ2NjLTkvNTdlZmExZmU1OTU3Njk0ZmE1
NDFjOTA2MmRlMGExMjdmMGI5YWNiMC92bWxpbnV6LTUuMTAuMC0wMDA0NC1nNTdlZmExZmU1OTU3
JwoJZXhwb3J0IGRlcXVldWVfdGltZT0nMjAyMS0wNC0yMyAxNjo1ODoxNyArMDgwMCcKCWV4cG9y
dCBqb2JfaW5pdHJkPScvbGtwL2pvYnMvc2NoZWR1bGVkL2xrcC1pY2wtMnNwMS93aWxsLWl0LXNj
YWxlLXBlcmZvcm1hbmNlLXRocmVhZC01MCUtbW1hcDEtdWNvZGU9MHhiMDAwMjgwLW1vbml0b3I9
NzBkNmQ3MTgtZGViaWFuLTEwLjQteDg2XzY0LTIwMjAwNjAzLmNnei01N2VmYTFmZTU5NTc2OTRm
YTU0MS0yMDIxMDQyMy0yNjMxOS0xZnVwa3poLTMuY2d6JwoKCVsgLW4gIiRMS1BfU1JDIiBdIHx8
CglleHBvcnQgTEtQX1NSQz0vbGtwLyR7dXNlcjotbGtwfS9zcmMKfQoKcnVuX2pvYigpCnsKCWVj
aG8gJCQgPiAkVE1QL3J1bi1qb2IucGlkCgoJLiAkTEtQX1NSQy9saWIvaHR0cC5zaAoJLiAkTEtQ
X1NSQy9saWIvam9iLnNoCgkuICRMS1BfU1JDL2xpYi9lbnYuc2gKCglleHBvcnRfdG9wX2VudgoK
CXJ1bl9zZXR1cCAkTEtQX1NSQy9zZXR1cC9jcHVmcmVxX2dvdmVybm9yICdwZXJmb3JtYW5jZScK
CglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIGttc2cKCXJ1bl9tb25pdG9y
ICRMS1BfU1JDL21vbml0b3JzL25vLXN0ZG91dC93cmFwcGVyIGJvb3QtdGltZQoJcnVuX21vbml0
b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciB1cHRpbWUKCXJ1bl9tb25pdG9yICRMS1BfU1JD
L21vbml0b3JzL3dyYXBwZXIgaW9zdGF0CglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93
cmFwcGVyIGhlYXJ0YmVhdAoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciB2
bXN0YXQKCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgbnVtYS1udW1hc3Rh
dAoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBudW1hLXZtc3RhdAoJcnVu
X21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBudW1hLW1lbWluZm8KCXJ1bl9tb25p
dG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgcHJvYy12bXN0YXQKCXJ1bl9tb25pdG9yICRM
S1BfU1JDL21vbml0b3JzL3dyYXBwZXIgcHJvYy1zdGF0CglydW5fbW9uaXRvciAkTEtQX1NSQy9t
b25pdG9ycy93cmFwcGVyIG1lbWluZm8KCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dy
YXBwZXIgc2xhYmluZm8KCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgaW50
ZXJydXB0cwoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBsb2NrX3N0YXQK
CXJ1bl9tb25pdG9yIGxpdGVfbW9kZT0xICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgcGVyZi1z
Y2hlZAoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBzb2Z0aXJxcwoJcnVu
X21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvb25lLXNob3Qvd3JhcHBlciBiZGlfZGV2X21hcHBp
bmcKCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL3dyYXBwZXIgZGlza3N0YXRzCglydW5f
bW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIG5mc3N0YXQKCXJ1bl9tb25pdG9yICRM
S1BfU1JDL21vbml0b3JzL3dyYXBwZXIgY3B1aWRsZQoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9u
aXRvcnMvd3JhcHBlciBjcHVmcmVxLXN0YXRzCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9y
cy93cmFwcGVyIHNjaGVkX2RlYnVnCglydW5fbW9uaXRvciAkTEtQX1NSQy9tb25pdG9ycy93cmFw
cGVyIHBlcmYtc3RhdAoJcnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBtcHN0
YXQKCXJ1bl9tb25pdG9yICRMS1BfU1JDL21vbml0b3JzL25vLXN0ZG91dC93cmFwcGVyIHBlcmYt
cHJvZmlsZQoJcnVuX21vbml0b3IgcG1ldGVyX3NlcnZlcj0nbGtwLW5obS1kcDInIHBtZXRlcl9k
ZXZpY2U9J3lva29nYXdhLXd0MzEwJyAkTEtQX1NSQy9tb25pdG9ycy93cmFwcGVyIHBtZXRlcgoJ
cnVuX21vbml0b3IgJExLUF9TUkMvbW9uaXRvcnMvd3JhcHBlciBvb20ta2lsbGVyCglydW5fbW9u
aXRvciAkTEtQX1NSQy9tb25pdG9ycy9wbGFpbi93YXRjaGRvZwoKCXJ1bl90ZXN0IG1vZGU9J3Ro
cmVhZCcgdGVzdD0nbW1hcDEnICRMS1BfU1JDL3Rlc3RzL3dyYXBwZXIgd2lsbC1pdC1zY2FsZQp9
CgpleHRyYWN0X3N0YXRzKCkKewoJZXhwb3J0IHN0YXRzX3BhcnRfYmVnaW49CglleHBvcnQgc3Rh
dHNfcGFydF9lbmQ9CgoJZW52IG1vZGU9J3RocmVhZCcgdGVzdD0nbW1hcDEnICRMS1BfU1JDL3N0
YXRzL3dyYXBwZXIgd2lsbC1pdC1zY2FsZQoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBrbXNnCgkk
TEtQX1NSQy9zdGF0cy93cmFwcGVyIGJvb3QtdGltZQoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciB1
cHRpbWUKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgaW9zdGF0CgkkTEtQX1NSQy9zdGF0cy93cmFw
cGVyIHZtc3RhdAoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBudW1hLW51bWFzdGF0CgkkTEtQX1NS
Qy9zdGF0cy93cmFwcGVyIG51bWEtdm1zdGF0CgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIG51bWEt
bWVtaW5mbwoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBwcm9jLXZtc3RhdAoJJExLUF9TUkMvc3Rh
dHMvd3JhcHBlciBtZW1pbmZvCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHNsYWJpbmZvCgkkTEtQ
X1NSQy9zdGF0cy93cmFwcGVyIGludGVycnVwdHMKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgbG9j
a19zdGF0CgllbnYgbGl0ZV9tb2RlPTEgJExLUF9TUkMvc3RhdHMvd3JhcHBlciBwZXJmLXNjaGVk
CgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHNvZnRpcnFzCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVy
IGRpc2tzdGF0cwoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBuZnNzdGF0CgkkTEtQX1NSQy9zdGF0
cy93cmFwcGVyIGNwdWlkbGUKCSRMS1BfU1JDL3N0YXRzL3dyYXBwZXIgc2NoZWRfZGVidWcKCSRM
S1BfU1JDL3N0YXRzL3dyYXBwZXIgcGVyZi1zdGF0CgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIG1w
c3RhdAoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBwZXJmLXByb2ZpbGUKCWVudiBwbWV0ZXJfc2Vy
dmVyPSdsa3AtbmhtLWRwMicgcG1ldGVyX2RldmljZT0neW9rb2dhd2Etd3QzMTAnICRMS1BfU1JD
L3N0YXRzL3dyYXBwZXIgcG1ldGVyCgoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciB0aW1lIHdpbGwt
aXQtc2NhbGUudGltZQoJJExLUF9TUkMvc3RhdHMvd3JhcHBlciBkbWVzZwoJJExLUF9TUkMvc3Rh
dHMvd3JhcHBlciBrbXNnCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIGxhc3Rfc3RhdGUKCSRMS1Bf
U1JDL3N0YXRzL3dyYXBwZXIgc3RkZXJyCgkkTEtQX1NSQy9zdGF0cy93cmFwcGVyIHRpbWUKfQoK
IiRAIgo=

--===============1673480558491868935==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="job.yaml"

LS0tCnN1aXRlOiB3aWxsLWl0LXNjYWxlCnRlc3RjYXNlOiB3aWxsLWl0LXNjYWxlCmNhdGVnb3J5
OiBiZW5jaG1hcmsKbnJfdGFzazogNTAlCndpbGwtaXQtc2NhbGU6CiAgbW9kZTogdGhyZWFkCiAg
dGVzdDogbW1hcDEKam9iX29yaWdpbjogd2lsbC1pdC1zY2FsZS1wYXJ0Mi55YW1sCnF1ZXVlX2Nt
ZGxpbmVfa2V5czoKLSBicmFuY2gKLSBjb21taXQKLSBxdWV1ZV9hdF9sZWFzdF9vbmNlCnF1ZXVl
OiBiaXNlY3QKdGVzdGJveDogbGtwLWljbC0yc3AxCnRib3hfZ3JvdXA6IGxrcC1pY2wtMnNwMQpr
Y29uZmlnOiB4ODZfNjQtcmhlbC04LjMKc3VibWl0X2lkOiA2MDM5MDE4NjYzZjI4YTlmNTU0OWJi
NmUKam9iX2ZpbGU6ICIvbGtwL2pvYnMvc2NoZWR1bGVkL2xrcC1pY2wtMnNwMS93aWxsLWl0LXNj
YWxlLXBlcmZvcm1hbmNlLXRocmVhZC01MCUtbW1hcDEtdWNvZGU9MHhiMDAwMjgwLW1vbml0b3I9
NzBkNmQ3MTgtZGViaWFuLTEwLjQteDg2XzY0LTIwMjAwNjAzLmNnei01N2VmYTFmZTU5NTc2OTRm
YTU0MS0yMDIxMDIyNi00MDc4OS0xYnc1OHJ4LTIueWFtbCIKaWQ6IDU2ODAzNDEwNTgxMWRkMmFh
OGFmNjE1YzNkMWNiZDUwOTE5MWYzMDEKcXVldWVyX3ZlcnNpb246ICIvbGtwLXNyYyIKbW9kZWw6
IEljZSBMYWtlCm5yX25vZGU6IDIKbnJfY3B1OiA5NgptZW1vcnk6IDI1NkcKbnJfaGRkX3BhcnRp
dGlvbnM6IDEKaGRkX3BhcnRpdGlvbnM6ICIvZGV2L2Rpc2svYnktaWQvYXRhLVNUOTUwMDUzME5T
XzlTUDFLTEFSLXBhcnQxIgpzc2RfcGFydGl0aW9uczogIi9kZXYvbnZtZTBuMXAxIgpzd2FwX3Bh
cnRpdGlvbnM6IAprZXJuZWxfY21kbGluZV9odzogYWNwaV9yc2RwPTB4NjY1ZmQwMTQKcm9vdGZz
X3BhcnRpdGlvbjogIi9kZXYvZGlzay9ieS1pZC9hdGEtSU5URUxfU1NEU0MyQkI4MDBHNF9QSFdM
NDIwNDAwNUs4MDBSR04tcGFydDMiCmttc2c6IApib290LXRpbWU6IAp1cHRpbWU6IAppb3N0YXQ6
IApoZWFydGJlYXQ6IAp2bXN0YXQ6IApudW1hLW51bWFzdGF0OiAKbnVtYS12bXN0YXQ6IApudW1h
LW1lbWluZm86IApwcm9jLXZtc3RhdDogCnByb2Mtc3RhdDogCm1lbWluZm86IApzbGFiaW5mbzog
CmludGVycnVwdHM6IApsb2NrX3N0YXQ6IApwZXJmLXNjaGVkOgogIGxpdGVfbW9kZTogMQpzb2Z0
aXJxczogCmJkaV9kZXZfbWFwcGluZzogCmRpc2tzdGF0czogCm5mc3N0YXQ6IApjcHVpZGxlOiAK
Y3B1ZnJlcS1zdGF0czogCnNjaGVkX2RlYnVnOiAKcGVyZi1zdGF0OiAKbXBzdGF0OiAKcGVyZi1w
cm9maWxlOiAKY3B1ZnJlcV9nb3Zlcm5vcjogcGVyZm9ybWFuY2UKY29tbWl0OiA1N2VmYTFmZTU5
NTc2OTRmYTU0MWM5MDYyZGUwYTEyN2YwYjlhY2IwCnVjb2RlOiAnMHhiMDAwMjgwJwpuZWVkX2tj
b25maWdfaHc6Ci0gQ09ORklHX0lHQj15Ci0gQ09ORklHX0lYR0JFPXkKLSBDT05GSUdfU0FUQV9B
SENJCnBtZXRlcjoKICBwbWV0ZXJfc2VydmVyOiBsa3AtbmhtLWRwMgogIHBtZXRlcl9kZXZpY2U6
IHlva29nYXdhLXd0MzEwCmVucXVldWVfdGltZTogMjAyMS0wMi0yNiAyMjoxMToxOC4zNTUzNjQz
ODggKzA4OjAwCl9pZDogNjAzOTA2YjM2M2YyOGE5ZjU1NDliYjcwCl9ydDogIi9yZXN1bHQvd2ls
bC1pdC1zY2FsZS9wZXJmb3JtYW5jZS10aHJlYWQtNTAlLW1tYXAxLXVjb2RlPTB4YjAwMDI4MC1t
b25pdG9yPTcwZDZkNzE4L2xrcC1pY2wtMnNwMS9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMu
Y2d6L3g4Nl82NC1yaGVsLTguMy9nY2MtOS81N2VmYTFmZTU5NTc2OTRmYTU0MWM5MDYyZGUwYTEy
N2YwYjlhY2IwIgp1c2VyOiBsa3AKY29tcGlsZXI6IGdjYy05CkxLUF9TRVJWRVI6IGludGVybmFs
LWxrcC1zZXJ2ZXIKaGVhZF9jb21taXQ6IDU5ZDQ5MmZmODMyZTU3NDU2YTgzZDU2NTIwMDk0MzRh
NDQ4NzRhM2UKYmFzZV9jb21taXQ6IGY0MGRkY2U4ODU5MzQ4MjkxOTc2MWY3NDkxMGY0MmY0Yjg0
YzAwNGIKYnJhbmNoOiBsaW51cy9tYXN0ZXIKcm9vdGZzOiBkZWJpYW4tMTAuNC14ODZfNjQtMjAy
MDA2MDMuY2d6Cm1vbml0b3Jfc2hhOiA3MGQ2ZDcxOApyZXN1bHRfcm9vdDogIi9yZXN1bHQvd2ls
bC1pdC1zY2FsZS9wZXJmb3JtYW5jZS10aHJlYWQtNTAlLW1tYXAxLXVjb2RlPTB4YjAwMDI4MC1t
b25pdG9yPTcwZDZkNzE4L2xrcC1pY2wtMnNwMS9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMu
Y2d6L3g4Nl82NC1yaGVsLTguMy9nY2MtOS81N2VmYTFmZTU5NTc2OTRmYTU0MWM5MDYyZGUwYTEy
N2YwYjlhY2IwLzAiCnNjaGVkdWxlcl92ZXJzaW9uOiAiL2xrcC9sa3AvLnNyYy0yMDIxMDIyNi0x
NzAyMDciCmFyY2g6IHg4Nl82NAptYXhfdXB0aW1lOiAyMTAwCmluaXRyZDogIi9vc2ltYWdlL2Rl
Ymlhbi9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6Igpib290bG9hZGVyX2FwcGVuZDoK
LSByb290PS9kZXYvcmFtMAotIHVzZXI9bGtwCi0gam9iPS9sa3Avam9icy9zY2hlZHVsZWQvbGtw
LWljbC0yc3AxL3dpbGwtaXQtc2NhbGUtcGVyZm9ybWFuY2UtdGhyZWFkLTUwJS1tbWFwMS11Y29k
ZT0weGIwMDAyODAtbW9uaXRvcj03MGQ2ZDcxOC1kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMu
Y2d6LTU3ZWZhMWZlNTk1NzY5NGZhNTQxLTIwMjEwMjI2LTQwNzg5LTFidzU4cngtMi55YW1sCi0g
QVJDSD14ODZfNjQKLSBrY29uZmlnPXg4Nl82NC1yaGVsLTguMwotIGJyYW5jaD1saW51cy9tYXN0
ZXIKLSBjb21taXQ9NTdlZmExZmU1OTU3Njk0ZmE1NDFjOTA2MmRlMGExMjdmMGI5YWNiMAotIEJP
T1RfSU1BR0U9L3BrZy9saW51eC94ODZfNjQtcmhlbC04LjMvZ2NjLTkvNTdlZmExZmU1OTU3Njk0
ZmE1NDFjOTA2MmRlMGExMjdmMGI5YWNiMC92bWxpbnV6LTUuMTAuMC0wMDA0NC1nNTdlZmExZmU1
OTU3Ci0gYWNwaV9yc2RwPTB4NjY1ZmQwMTQKLSBtYXhfdXB0aW1lPTIxMDAKLSBSRVNVTFRfUk9P
VD0vcmVzdWx0L3dpbGwtaXQtc2NhbGUvcGVyZm9ybWFuY2UtdGhyZWFkLTUwJS1tbWFwMS11Y29k
ZT0weGIwMDAyODAtbW9uaXRvcj03MGQ2ZDcxOC9sa3AtaWNsLTJzcDEvZGViaWFuLTEwLjQteDg2
XzY0LTIwMjAwNjAzLmNnei94ODZfNjQtcmhlbC04LjMvZ2NjLTkvNTdlZmExZmU1OTU3Njk0ZmE1
NDFjOTA2MmRlMGExMjdmMGI5YWNiMC8wCi0gTEtQX1NFUlZFUj1pbnRlcm5hbC1sa3Atc2VydmVy
Ci0gbm9rYXNscgotIHNlbGludXg9MAotIGRlYnVnCi0gYXBpYz1kZWJ1ZwotIHN5c3JxX2Fsd2F5
c19lbmFibGVkCi0gcmN1cGRhdGUucmN1X2NwdV9zdGFsbF90aW1lb3V0PTEwMAotIG5ldC5pZm5h
bWVzPTAKLSBwcmludGsuZGV2a21zZz1vbgotIHBhbmljPS0xCi0gc29mdGxvY2t1cF9wYW5pYz0x
Ci0gbm1pX3dhdGNoZG9nPXBhbmljCi0gb29wcz1wYW5pYwotIGxvYWRfcmFtZGlzaz0yCi0gcHJv
bXB0X3JhbWRpc2s9MAotIGRyYmQubWlub3JfY291bnQ9OAotIHN5c3RlbWQubG9nX2xldmVsPWVy
cgotIGlnbm9yZV9sb2dsZXZlbAotIGNvbnNvbGU9dHR5MAotIGVhcmx5cHJpbnRrPXR0eVMwLDEx
NTIwMAotIGNvbnNvbGU9dHR5UzAsMTE1MjAwCi0gdmdhPW5vcm1hbAotIHJ3Cm1vZHVsZXNfaW5p
dHJkOiAiL3BrZy9saW51eC94ODZfNjQtcmhlbC04LjMvZ2NjLTkvNTdlZmExZmU1OTU3Njk0ZmE1
NDFjOTA2MmRlMGExMjdmMGI5YWNiMC9tb2R1bGVzLmNneiIKYm1faW5pdHJkOiAiL29zaW1hZ2Uv
ZGVwcy9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6L3J1bi1pcGNvbmZpZ18yMDIwMDYw
OC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6L2xrcF8y
MDIwMTIxMS5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6
L3JzeW5jLXJvb3Rmc18yMDIwMDYwOC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4tMTAuNC14ODZf
NjQtMjAyMDA2MDMuY2d6L3dpbGwtaXQtc2NhbGVfMjAyMTAxMDguY2d6LC9vc2ltYWdlL3BrZy9k
ZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2MDMuY2d6L3dpbGwtaXQtc2NhbGUteDg2XzY0LTZiNmYx
ZjYtMV8yMDIxMDEwOC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4tMTAuNC14ODZfNjQtMjAyMDA2
MDMuY2d6L21wc3RhdF8yMDIwMDcxNC5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4tMTAuNC14ODZf
NjQtMjAyMDA2MDMuY2d6L3BlcmZfMjAyMDExMjYuY2d6LC9vc2ltYWdlL3BrZy9kZWJpYW4tMTAu
NC14ODZfNjQtMjAyMDA2MDMuY2d6L3BlcmYteDg2XzY0LWU3MWJhOTQ1MmYwYi0xXzIwMjEwMTA2
LmNneiwvb3NpbWFnZS9wa2cvZGViaWFuLTEwLjQteDg2XzY0LTIwMjAwNjAzLmNnei9zYXIteDg2
XzY0LTM0YzkyYWUtMV8yMDIwMDcwMi5jZ3osL29zaW1hZ2UvZGVwcy9kZWJpYW4tMTAuNC14ODZf
NjQtMjAyMDA2MDMuY2d6L2h3XzIwMjAwNzE1LmNneiIKdWNvZGVfaW5pdHJkOiAiL29zaW1hZ2Uv
dWNvZGUvaW50ZWwtdWNvZGUtMjAyMDExMTcuY2d6Igpsa3BfaW5pdHJkOiAiL29zaW1hZ2UvdXNl
ci9sa3AvbGtwLXg4Nl82NC5jZ3oiCnNpdGU6IGlubgpMS1BfQ0dJX1BPUlQ6IDgwCkxLUF9DSUZT
X1BPUlQ6IDEzOQpvb20ta2lsbGVyOiAKd2F0Y2hkb2c6IApsYXN0X2tlcm5lbDogNS4xMS4wLTA3
Mjg3LWc5MzNhNzM3ODBhN2EKcmVwZWF0X3RvOiAzCmdvb2Rfc2FtcGxlczoKLSA3MDg0Ci0gNjg3
MwotIDY5NzEKCiMhIHF1ZXVlIG9wdGlvbnMKCiMhIHVzZXIgb3ZlcnJpZGVzCnF1ZXVlX2F0X2xl
YXN0X29uY2U6IDAKCiMhIHNjaGVkdWxlIG9wdGlvbnMKa2VybmVsOiAiL3BrZy9saW51eC94ODZf
NjQtcmhlbC04LjMvZ2NjLTkvNTdlZmExZmU1OTU3Njk0ZmE1NDFjOTA2MmRlMGExMjdmMGI5YWNi
MC92bWxpbnV6LTUuMTAuMC0wMDA0NC1nNTdlZmExZmU1OTU3IgpkZXF1ZXVlX3RpbWU6IDIwMjEt
MDItMjYgMjI6MzY6MDUuNjY4NzIyMjYwICswODowMAoKIyEgL2xrcC9sa3AvLnNyYy0yMDIxMDIy
Ni0xNzAyMDcvaW5jbHVkZS9zaXRlL2lubgoKIyEgcnVudGltZSBzdGF0dXMKam9iX3N0YXRlOiBm
aW5pc2hlZApsb2FkYXZnOiA0MC40NSAyOS42NiAxMy4yNyAxLzcxNiAxMDE4NApzdGFydF90aW1l
OiAnMTYxNDM1MDIzMycKZW5kX3RpbWU6ICcxNjE0MzUwNTM1Jwp2ZXJzaW9uOiAiL2xrcC9sa3Av
LnNyYy0yMDIxMDIyNi0xNzAyMzk6ZjZkMmIxNDM6MDMyNTVmZWI4Igo=

--===============1673480558491868935==
Content-Type: text/plain
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduce.ksh"

CmZvciBjcHVfZGlyIGluIC9zeXMvZGV2aWNlcy9zeXN0ZW0vY3B1L2NwdVswLTldKgpkbwoJb25s
aW5lX2ZpbGU9IiRjcHVfZGlyIi9vbmxpbmUKCVsgLWYgIiRvbmxpbmVfZmlsZSIgXSAmJiBbICIk
KGNhdCAiJG9ubGluZV9maWxlIikiIC1lcSAwIF0gJiYgY29udGludWUKCglmaWxlPSIkY3B1X2Rp
ciIvY3B1ZnJlcS9zY2FsaW5nX2dvdmVybm9yCglbIC1mICIkZmlsZSIgXSAmJiBlY2hvICJwZXJm
b3JtYW5jZSIgPiAiJGZpbGUiCmRvbmUKCiAiL2xrcC9iZW5jaG1hcmtzL3B5dGhvbjMvYmluL3B5
dGhvbjMiICIuL3J1bnRlc3QucHkiICJtbWFwMSIgIjI5NSIgInRocmVhZCIgIjQ4Igo=

--===============1673480558491868935==--

