Content-Type: multipart/mixed; boundary="===============1009195750289773571=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: lkp@lists.01.org
Subject: Re: [bpf] fd978bf7fd: will-it-scale.per_process_ops -4.0% regression
Date: Fri, 09 Nov 2018 08:19:54 +0800
Message-ID: <9de53d57-b1be-2186-c90b-dbeda21ed717@intel.com>
In-Reply-To: <a66d304e-43ec-5558-67dc-5edfd856b607@iogearbox.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============1009195750289773571==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 11/02/2018 04:36 PM, Daniel Borkmann wrote:
> Hi Rong,
>
> On 11/02/2018 03:14 AM, kernel test robot wrote:
>> Greeting,
>>
>> FYI, we noticed a -4.0% regression of will-it-scale.per_process_ops due =
to commit:
>>
>>
>> commit: fd978bf7fd312581a7ca454a991f0ffb34c4204b ("bpf: Add reference tr=
acking to verifier")
>> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
>>
>> in testcase: will-it-scale
>> on test machine: 80 threads Skylake with 64G memory
>> with following parameters:
>>
>> 	nr_task: 100%
>> 	mode: process
>> 	test: mmap1
>> 	cpufreq_governor: performance
> Hmm, so the test cases you are running are these ones:
>
>    https://github.com/antonblanchard/will-it-scale/blob/master/tests/mmap=
1.c
>    https://github.com/antonblanchard/will-it-scale/blob/master/tests/mmap=
2.c
>
> The commit from Joe referenced above only adds a feature to the (eBPF) ve=
rifier. Looking
> through will-it-scale test suite, looks like there's neither cBPF nor eBP=
F in use and if
> it would have been the former (e.g. via seccomp BPF), then also this has =
no effect on it
> since this doesn't load through bpf(2); meaning if so then something must=
 use eBPF here,
> but then it's also unclear right now how this would even remotely affect =
mmap() test
> performance by -4%. Hm, are you certain it's not a false bisection? If so=
, what else is
> loading eBPF on your machine in parallel when you run the tests?

Please accept my apologies for taking your time, It's a false bisection.
Something strange happened, we're trying to figure out the root cause.

Best Regards,
Rong Chen

>
> Thanks,
> Daniel
>
>> test-description: Will It Scale takes a testcase and runs it from 1 thro=
ugh to n parallel copies to see if the testcase will scale. It builds both =
a process and threads based test in order to see any differences between th=
e two.
>> test-url: https://github.com/antonblanchard/will-it-scale
>>
>> In addition to that, the commit also has significant impact on the follo=
wing tests:
>>
>> +------------------+----------------------------------------------------=
-----------+
>> | testcase: change | will-it-scale: will-it-scale.per_process_ops -3.8% =
regression |
>> | test machine     | 80 threads Skylake with 64G memory                 =
           |
>> | test parameters  | cpufreq_governor=3Dperformance                     =
             |
>> |                  | mode=3Dprocess                                     =
             |
>> |                  | nr_task=3D100%                                     =
             |
>> |                  | test=3Dmmap2                                       =
             |
>> +------------------+----------------------------------------------------=
-----------+
>>
>>
>> Details are as below:
>> ------------------------------------------------------------------------=
-------------------------->
>>
>>
>> To reproduce:
>>
>>          git clone https://github.com/intel/lkp-tests.git
>>          cd lkp-tests
>>          bin/lkp install job.yaml  # job file is attached in this email
>>          bin/lkp run     job.yaml
>>
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/te=
stcase:
>>    gcc-7/performance/x86_64-rhel-7.2/process/100%/debian-x86_64-2018-04-=
03.cgz/lkp-skl-2sp2/mmap1/will-it-scale
>>
>> commit:
>>    84dbf35073 ("bpf: Macrofy stack state copy")
>>    fd978bf7fd ("bpf: Add reference tracking to verifier")
>>
>> 84dbf3507349696b fd978bf7fd312581a7ca454a99
>> ---------------- --------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>       16811            -4.0%      16140        will-it-scale.per_process=
_ops
>>     1344946            -4.0%    1291230        will-it-scale.workload
>>      107.75 =C2=B1 38%    +252.4%     379.75 =C2=B1 93%  cpuidle.POLL.us=
age
>>      121.70 =C2=B1 18%     +18.9%     144.70 =C2=B1  4%  sched_debug.cfs=
_rq:/.exec_clock.stddev
>>        4933            +2.0%       5031        proc-vmstat.nr_inactive_a=
non
>>        4933            +2.0%       5031        proc-vmstat.nr_zone_inact=
ive_anon
>>        9874            +9.0%      10765 =C2=B1  7%  slabinfo.proc_inode_=
cache.active_objs
>>        9874            +9.0%      10765 =C2=B1  7%  slabinfo.proc_inode_=
cache.num_objs
>>       12248 =C2=B1 50%     +52.2%      18640 =C2=B1  2%  numa-meminfo.no=
de0.Inactive
>>       33943 =C2=B1  8%     +16.2%      39453 =C2=B1  6%  numa-meminfo.no=
de0.SReclaimable
>>       91549 =C2=B1  9%      -9.9%      82530 =C2=B1  7%  numa-meminfo.no=
de1.Slab
>>       18091 =C2=B1 15%     +29.2%      23382 =C2=B1 17%  numa-vmstat.nod=
e0
>>        3027 =C2=B1 52%     +52.6%       4620 =C2=B1  3%  numa-vmstat.nod=
e0.nr_inactive_anon
>>        8485 =C2=B1  8%     +16.2%       9862 =C2=B1  6%  numa-vmstat.nod=
e0.nr_slab_reclaimable
>>        3027 =C2=B1 52%     +52.6%       4620 =C2=B1  3%  numa-vmstat.nod=
e0.nr_zone_inactive_anon
>>     1.4e+12            -2.5%  1.364e+12        perf-stat.branch-instruct=
ions
>>       41.42            +0.7       42.15        perf-stat.cache-miss-rate%
>>   2.166e+10            -2.1%   2.12e+10        perf-stat.cache-references
>>       12.16            +2.7%      12.49        perf-stat.cpi
>>   1.741e+12            -2.8%  1.692e+12        perf-stat.dTLB-loads
>>        0.00 =C2=B1  3%      +0.0        0.00 =C2=B1  9%  perf-stat.dTLB-=
store-miss-rate%
>>   5.713e+11            -3.9%   5.49e+11        perf-stat.dTLB-stores
>>   6.103e+12            -2.6%  5.943e+12        perf-stat.instructions
>>        0.08            -2.6%       0.08        perf-stat.ipc
>>   1.954e+09            -1.8%  1.919e+09        perf-stat.node-load-misses
>>     4538060            +1.4%    4602862        perf-stat.path-length
>>       49.62            -0.5       49.14        perf-profile.calltrace.cy=
cles-pp.do_munmap.vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>>       47.64            -0.5       47.17        perf-profile.calltrace.cy=
cles-pp._raw_spin_lock_irqsave.percpu_counter_add_batch.do_munmap.vm_munmap=
.__x64_sys_munmap
>>       47.49            -0.5       47.02        perf-profile.calltrace.cy=
cles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.percpu_coun=
ter_add_batch.do_munmap.vm_munmap
>>       49.99            -0.5       49.53        perf-profile.calltrace.cy=
cles-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>       49.96            -0.5       49.51        perf-profile.calltrace.cy=
cles-pp.vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
>>       48.02            -0.4       47.58        perf-profile.calltrace.cy=
cles-pp.percpu_counter_add_batch.do_munmap.vm_munmap.__x64_sys_munmap.do_sy=
scall_64
>>        1.41            -0.0        1.37        perf-profile.calltrace.cy=
cles-pp.unmap_region.do_munmap.vm_munmap.__x64_sys_munmap.do_syscall_64
>>       47.73            +0.4       48.11        perf-profile.calltrace.cy=
cles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.percpu_coun=
ter_add_batch.__vm_enough_memory.mmap_region
>>       47.85            +0.4       48.25        perf-profile.calltrace.cy=
cles-pp._raw_spin_lock_irqsave.percpu_counter_add_batch.__vm_enough_memory.=
mmap_region.do_mmap
>>       48.28            +0.4       48.68        perf-profile.calltrace.cy=
cles-pp.__vm_enough_memory.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff
>>       48.23            +0.4       48.63        perf-profile.calltrace.cy=
cles-pp.percpu_counter_add_batch.__vm_enough_memory.mmap_region.do_mmap.vm_=
mmap_pgoff
>>       48.96            +0.4       49.41        perf-profile.calltrace.cy=
cles-pp.mmap_region.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64
>>       49.11            +0.5       49.56        perf-profile.calltrace.cy=
cles-pp.do_mmap.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_6=
4_after_hwframe
>>       49.24            +0.5       49.70        perf-profile.calltrace.cy=
cles-pp.vm_mmap_pgoff.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_=
hwframe
>>       49.25            +0.5       49.72        perf-profile.calltrace.cy=
cles-pp.ksys_mmap_pgoff.do_syscall_64.entry_SYSCALL_64_after_hwframe
>>       49.62            -0.5       49.15        perf-profile.children.cyc=
les-pp.do_munmap
>>       49.99            -0.5       49.53        perf-profile.children.cyc=
les-pp.__x64_sys_munmap
>>       49.97            -0.5       49.51        perf-profile.children.cyc=
les-pp.vm_munmap
>>        0.51 =C2=B1  2%      -0.0        0.46        perf-profile.childre=
n.cycles-pp.___might_sleep
>>        1.16            -0.0        1.11        perf-profile.children.cyc=
les-pp.unmap_vmas
>>        1.15            -0.0        1.10        perf-profile.children.cyc=
les-pp.unmap_page_range
>>        1.41            -0.0        1.37        perf-profile.children.cyc=
les-pp.unmap_region
>>        0.32 =C2=B1  2%      +0.0        0.34 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.up_write
>>        0.32 =C2=B1  2%      +0.0        0.34        perf-profile.childre=
n.cycles-pp.vm_area_alloc
>>        0.29            +0.0        0.32        perf-profile.children.cyc=
les-pp.kmem_cache_alloc
>>       48.28            +0.4       48.68        perf-profile.children.cyc=
les-pp.__vm_enough_memory
>>       48.96            +0.4       49.41        perf-profile.children.cyc=
les-pp.mmap_region
>>       49.11            +0.5       49.56        perf-profile.children.cyc=
les-pp.do_mmap
>>       49.25            +0.5       49.71        perf-profile.children.cyc=
les-pp.vm_mmap_pgoff
>>       49.25            +0.5       49.72        perf-profile.children.cyc=
les-pp.ksys_mmap_pgoff
>>        0.47 =C2=B1  3%      -0.0        0.43        perf-profile.self.cy=
cles-pp.___might_sleep
>>        0.32 =C2=B1  3%      +0.0        0.34 =C2=B1  2%  perf-profile.se=
lf.cycles-pp.up_write
>>        0.27            +0.0        0.30        perf-profile.self.cycles-=
pp.kmem_cache_alloc
>>        0.49            +0.0        0.53        perf-profile.self.cycles-=
pp.percpu_counter_add_batch
>>
>>
>>                                                                         =
         =

>>                              will-it-scale.per_process_ops
>>                                                                         =
         =

>>    18000 +-+------------------------------------------------------------=
-----+
>>          |                                                              =
     |
>>    17500 +-+   +.+                                                      =
     |
>>          |+.+++  :            +.++++.+++           ++++.++++.++         =
     |
>>          |        :++. +      :        :          :            :        =
     |
>>    17000 +-+      +   + ++.++:          :  ++.+++ :            ++.+ ++. =
  +. |
>>          |                   +          +.+      +                 +   +=
++  +|
>>    16500 +-+                                                            =
     |
>>          |              O  OOOO OOOO O O                                =
     |
>>    16000 +-+           O O            O O O                             =
     |
>>          |                                                              =
     |
>>          O     O  OOO O                                                 =
     |
>>    15500 +O+OOO  O                                                      =
     |
>>          |                                                              =
     |
>>    15000 +-+------------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
                                                                           =
              =

>>                                  will-it-scale.workload
>>                                                                         =
         =

>>    1.42e+06 +-+---------------------------------------------------------=
-----+
>>     1.4e+06 +-+   ++                                                    =
     |
>>             |++.++ :                 ++.                   +++.+        =
     |
>>    1.38e+06 +-+     :           +.+++   ++          ++++.++    :        =
     |
>>    1.36e+06 +-+     +.+++++.    :         :         :           :+      =
     |
>>             |               ++++          ++.+++++.+            + ++.+++=
++.++|
>>    1.34e+06 +-+                                                         =
     |
>>    1.32e+06 +-+                                                         =
     |
>>     1.3e+06 +-+               O                                         =
     |
>>             |            OO OO OO OOOOO  OOO                            =
     |
>>    1.28e+06 +-+                         O                               =
     |
>>    1.26e+06 +-+       O                                                 =
     |
>>             O     O O  OO                                               =
     |
>>    1.24e+06 +OO OO O                                                    =
     |
>>    1.22e+06 +-+---------------------------------------------------------=
-----+
>>                                                                         =
         =

>>                                                                         =
         =

>> [*] bisect-good sample
>> [O] bisect-bad  sample
>>
>> ************************************************************************=
***************************
>> lkp-skl-2sp2: 80 threads Skylake with 64G memory
>> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/te=
stcase:
>>    gcc-7/performance/x86_64-rhel-7.2/process/100%/debian-x86_64-2018-04-=
03.cgz/lkp-skl-2sp2/mmap2/will-it-scale
>>
>> commit:
>>    84dbf35073 ("bpf: Macrofy stack state copy")
>>    fd978bf7fd ("bpf: Add reference tracking to verifier")
>>
>> 84dbf3507349696b fd978bf7fd312581a7ca454a99
>> ---------------- --------------------------
>>           %stddev     %change         %stddev
>>               \          |                \
>>       16832            -3.8%      16186        will-it-scale.per_process=
_ops
>>     1346634            -3.8%    1294984        will-it-scale.workload
>>      390809 =C2=B1 21%     +51.6%     592424 =C2=B1 27%  cpuidle.C1.time
>>        6897            +2.7%       7085        proc-vmstat.nr_mapped
>>      936.00 =C2=B1  7%     +15.6%       1082 =C2=B1  5%  slabinfo.Acpi-P=
arseExt.active_objs
>>      936.00 =C2=B1  7%     +15.6%       1082 =C2=B1  5%  slabinfo.Acpi-P=
arseExt.num_objs
>>      968.00 =C2=B1  9%     +27.5%       1233 =C2=B1 16%  slabinfo.pool_w=
orkqueue.active_objs
>>      968.00 =C2=B1  9%     +29.7%       1255 =C2=B1 16%  slabinfo.pool_w=
orkqueue.num_objs
>>        8430           -14.1%       7244 =C2=B1  2%  numa-meminfo.node0.K=
ernelStack
>>        4283 =C2=B1 14%     -22.4%       3325 =C2=B1 10%  numa-meminfo.no=
de0.PageTables
>>       73929 =C2=B1  3%     -10.6%      66061 =C2=B1  6%  numa-meminfo.no=
de0.SUnreclaim
>>        5569 =C2=B1  2%     +21.0%       6738 =C2=B1  3%  numa-meminfo.no=
de1.KernelStack
>>       55085 =C2=B1  5%     +17.5%      64739 =C2=B1  5%  numa-meminfo.no=
de1.SUnreclaim
>>       81155 =C2=B1  6%     +16.2%      94292 =C2=B1  7%  numa-meminfo.no=
de1.Slab
>>      230.00          -100.0%       0.00        numa-vmstat.node0.nr_acti=
ve_file
>>      100.25 =C2=B1  3%     -88.8%      11.25 =C2=B1173%  numa-vmstat.nod=
e0.nr_inactive_file
>>        8431           -14.1%       7245 =C2=B1  2%  numa-vmstat.node0.nr=
_kernel_stack
>>        1071 =C2=B1 14%     -22.4%     831.25 =C2=B1 10%  numa-vmstat.nod=
e0.nr_page_table_pages
>>       18482 =C2=B1  3%     -10.6%      16515 =C2=B1  6%  numa-vmstat.nod=
e0.nr_slab_unreclaimable
>>      230.00          -100.0%       0.00        numa-vmstat.node0.nr_zone=
_active_file
>>      100.25 =C2=B1  3%     -88.8%      11.25 =C2=B1173%  numa-vmstat.nod=
e0.nr_zone_inactive_file
>>        5569 =C2=B1  2%     +21.0%       6738 =C2=B1  3%  numa-vmstat.nod=
e1.nr_kernel_stack
>>        2778 =C2=B1  3%     +28.4%       3567 =C2=B1 16%  numa-vmstat.nod=
e1.nr_mapped
>>       13771 =C2=B1  5%     +17.5%      16184 =C2=B1  5%  numa-vmstat.nod=
e1.nr_slab_unreclaimable
>>   1.506e+12            -2.5%  1.468e+12        perf-stat.branch-instruct=
ions
>>       41.41            +0.8       42.20        perf-stat.cache-miss-rate%
>>   2.165e+10            -1.7%  2.129e+10        perf-stat.cache-references
>>       11.25            +2.8%      11.57        perf-stat.cpi
>>   1.891e+12            -2.8%  1.838e+12        perf-stat.dTLB-loads
>>   6.543e+11            -3.7%    6.3e+11        perf-stat.dTLB-stores
>>   6.591e+12            -2.6%  6.419e+12        perf-stat.instructions
>>        0.09            -2.7%       0.09        perf-stat.ipc
>>   1.967e+09            -1.3%  1.941e+09        perf-stat.node-load-misses
>>     4894750            +1.3%    4956596        perf-stat.path-length
>>       40.37 =C2=B1 12%     -16.2%      33.81 =C2=B1  7%  sched_debug.cfs=
_rq:/.load_avg.stddev
>>        0.05 =C2=B1  2%     +18.7%       0.06 =C2=B1  3%  sched_debug.cfs=
_rq:/.nr_running.stddev
>>        6.37 =C2=B1 40%     -50.2%       3.17 =C2=B1 32%  sched_debug.cfs=
_rq:/.removed.load_avg.avg
>>       31.64 =C2=B1 18%     -28.5%      22.63 =C2=B1 16%  sched_debug.cfs=
_rq:/.removed.load_avg.stddev
>>      293.89 =C2=B1 40%     -50.1%     146.61 =C2=B1 32%  sched_debug.cfs=
_rq:/.removed.runnable_sum.avg
>>        1459 =C2=B1 18%     -28.3%       1045 =C2=B1 16%  sched_debug.cfs=
_rq:/.removed.runnable_sum.stddev
>>        2.46 =C2=B1 43%     -60.9%       0.96 =C2=B1 66%  sched_debug.cfs=
_rq:/.removed.util_avg.avg
>>       12.42 =C2=B1 26%     -46.5%       6.64 =C2=B1 59%  sched_debug.cfs=
_rq:/.removed.util_avg.stddev
>>      385.92 =C2=B1  6%     +12.8%     435.46 =C2=B1  2%  sched_debug.cpu=
.nr_switches.min
>>      -14.21           -31.4%      -9.75        sched_debug.cpu.nr_uninte=
rruptible.min
>>       47.54            -0.2       47.31        perf-profile.calltrace.cy=
cles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.percpu_coun=
ter_add_batch.do_munmap.vm_munmap
>>       47.67            -0.2       47.45        perf-profile.calltrace.cy=
cles-pp._raw_spin_lock_irqsave.percpu_counter_add_batch.do_munmap.vm_munmap=
.__x64_sys_munmap
>>       48.04            -0.2       47.86        perf-profile.calltrace.cy=
cles-pp.percpu_counter_add_batch.do_munmap.vm_munmap.__x64_sys_munmap.do_sy=
scall_64
>>       99.36            -0.0       99.34        perf-profile.calltrace.cy=
cles-pp.entry_SYSCALL_64_after_hwframe
>>        1.47            +0.0        1.51        perf-profile.calltrace.cy=
cles-pp.unmap_region.do_munmap.vm_munmap.__x64_sys_munmap.do_syscall_64
>>       94.77            -0.3       94.52        perf-profile.children.cyc=
les-pp.native_queued_spin_lock_slowpath
>>       95.04            -0.2       94.81        perf-profile.children.cyc=
les-pp._raw_spin_lock_irqsave
>>       95.77            -0.2       95.60        perf-profile.children.cyc=
les-pp.percpu_counter_add_batch
>>       49.72            -0.1       49.58        perf-profile.children.cyc=
les-pp.do_munmap
>>        0.53 =C2=B1  2%      -0.1        0.47        perf-profile.childre=
n.cycles-pp.___might_sleep
>>        0.30 =C2=B1  2%      +0.0        0.33        perf-profile.childre=
n.cycles-pp.perf_event_mmap
>>        0.30 =C2=B1  3%      +0.0        0.33 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.vm_area_alloc
>>        0.33 =C2=B1  2%      +0.0        0.36 =C2=B1  2%  perf-profile.ch=
ildren.cycles-pp.up_write
>>        1.48            +0.0        1.51        perf-profile.children.cyc=
les-pp.unmap_region
>>       94.77            -0.3       94.52        perf-profile.self.cycles-=
pp.native_queued_spin_lock_slowpath
>>        0.48 =C2=B1  2%      -0.0        0.44        perf-profile.self.cy=
cles-pp.___might_sleep
>>        0.33 =C2=B1  2%      +0.0        0.36 =C2=B1  2%  perf-profile.se=
lf.cycles-pp.up_write
>>        0.53            +0.0        0.57        perf-profile.self.cycles-=
pp.unmap_page_range
>>        0.47            +0.0        0.52 =C2=B1  2%  perf-profile.self.cy=
cles-pp.percpu_counter_add_batch
>>
>>
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
>>
>> Thanks,
>> Rong Chen
>>


--===============1009195750289773571==--

