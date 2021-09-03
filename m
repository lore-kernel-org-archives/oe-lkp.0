Content-Type: multipart/mixed; boundary="===============5099379762542007634=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] 2bf1ec0ff0: stress-ng.mknod.ops_per_sec -45.4% regression
Date: Fri, 03 Sep 2021 15:43:36 +0800
Message-ID: <a149d14e-48e0-bad9-4283-e560f03a941f@linux.intel.com>
In-Reply-To: <20210804143800.GA21457@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============5099379762542007634==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

    Do you have time to look at this? Thanks.

On 8/4/2021 10:38 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -45.4% regression of stress-ng.mknod.ops_per_sec due to=
 commit:
> =

> =

> commit: 2bf1ec0ff067ff8f692d261b29c713f3583f7e2a ("xfs: log forces imply =
data device cache flushes")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: stress-ng
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.=
10GHz with 512G memory
> with following parameters:
> =

> 	nr_threads: 10%
> 	disk: 1HDD
> 	testtime: 60s
> 	fs: xfs
> 	class: filesystem
> 	test: mknod
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> =

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

>          git clone https://github.com/intel/lkp-tests.git
>          cd lkp-tests
>          bin/lkp install                job.yaml  # job file is attached =
in this email
>          bin/lkp split-job --compatible job.yaml  # generate the yaml fil=
e for lkp run
>          bin/lkp run                    generated-yaml-file
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/disk/fs/kconfig/nr_threads/rootfs/tbox_gr=
oup/test/testcase/testtime/ucode:
>    filesystem/gcc-9/performance/1HDD/xfs/x86_64-rhel-8.3/10%/debian-10.4-=
x86_64-20200603.cgz/lkp-csl-2sp7/mknod/stress-ng/60s/0x5003006
> =

> commit:
>    45eddb4140 ("xfs: factor out forced iclog flushes")
>    2bf1ec0ff0 ("xfs: log forces imply data device cache flushes")
> =

> 45eddb414047c366 2bf1ec0ff067ff8f692d261b29c
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>       87135           -45.4%      47612        stress-ng.mknod.ops
>        1451           -45.4%     793.24        stress-ng.mknod.ops_per_sec
>       23.00 =C2=B1  7%     -51.4%      11.17 =C2=B1 12%  stress-ng.time.p=
ercent_of_cpu_this_job_got
>       13.80 =C2=B1  7%     -50.7%       6.80 =C2=B1  8%  stress-ng.time.s=
ystem_time
>      211458 =C2=B1  2%     -62.4%      79605 =C2=B1 14%  stress-ng.time.v=
oluntary_context_switches
>        0.30 =C2=B1  2%      -0.1        0.18        mpstat.cpu.all.sys%
>       13993 =C2=B1  2%     -38.1%       8659        softirqs.BLOCK
>       27747            -2.3%      27103        proc-vmstat.nr_slab_reclai=
mable
>       76223 =C2=B1  3%     -57.3%      32548 =C2=B1  5%  proc-vmstat.pgpg=
out
>        1170 =C2=B1  3%     -57.3%     500.17 =C2=B1  5%  vmstat.io.bo
>       10752           -47.7%       5624 =C2=B1  6%  vmstat.system.cs
>       32820           -34.5%      21499        slabinfo.kmalloc-rcl-64.ac=
tive_objs
>      512.67           -34.6%     335.50        slabinfo.kmalloc-rcl-64.ac=
tive_slabs
>       32836           -34.5%      21508        slabinfo.kmalloc-rcl-64.nu=
m_objs
>      512.67           -34.6%     335.50        slabinfo.kmalloc-rcl-64.nu=
m_slabs
>       24913 =C2=B1  2%     -42.8%      14251        interrupts.315:PCI-MS=
I.376832-edge.ahci[0000:00:17.0]
>       71844 =C2=B1  6%     -19.9%      57564 =C2=B1  3%  interrupts.CAL:F=
unction_call_interrupts
>      206.50 =C2=B1 37%     -42.9%     118.00 =C2=B1 41%  interrupts.CPU1.=
NMI:Non-maskable_interrupts
>      206.50 =C2=B1 37%     -42.9%     118.00 =C2=B1 41%  interrupts.CPU1.=
PMI:Performance_monitoring_interrupts
>      173.17 =C2=B1 26%     -31.7%     118.33 =C2=B1 38%  interrupts.CPU2.=
NMI:Non-maskable_interrupts
>      173.17 =C2=B1 26%     -31.7%     118.33 =C2=B1 38%  interrupts.CPU2.=
PMI:Performance_monitoring_interrupts
>      189.83 =C2=B1 34%     -40.6%     112.83 =C2=B1 25%  interrupts.CPU49=
.NMI:Non-maskable_interrupts
>      189.83 =C2=B1 34%     -40.6%     112.83 =C2=B1 25%  interrupts.CPU49=
.PMI:Performance_monitoring_interrupts
>      181.67 =C2=B1 25%     -38.3%     112.17 =C2=B1 24%  interrupts.CPU50=
.NMI:Non-maskable_interrupts
>      181.67 =C2=B1 25%     -38.3%     112.17 =C2=B1 24%  interrupts.CPU50=
.PMI:Performance_monitoring_interrupts
>        1895 =C2=B1 16%     -32.8%       1274 =C2=B1 20%  interrupts.RES:R=
escheduling_interrupts
>   3.127e+08 =C2=B1  5%     -12.2%  2.746e+08 =C2=B1  3%  perf-stat.i.bran=
ch-instructions
>       10683           -49.8%       5364 =C2=B1  6%  perf-stat.i.context-s=
witches
>   3.866e+08 =C2=B1  4%     -14.2%  3.318e+08 =C2=B1  3%  perf-stat.i.dTLB=
-loads
>   1.949e+08 =C2=B1  3%     -14.7%  1.662e+08 =C2=B1  3%  perf-stat.i.dTLB=
-stores
>   1.538e+09 =C2=B1  5%     -12.4%  1.348e+09 =C2=B1  3%  perf-stat.i.inst=
ructions
>        9.31 =C2=B1  4%     -13.6%       8.04 =C2=B1  3%  perf-stat.i.metr=
ic.M/sec
>      127426 =C2=B1 14%     -32.6%      85864 =C2=B1  9%  perf-stat.i.node=
-load-misses
>   3.078e+08 =C2=B1  5%     -12.2%  2.702e+08 =C2=B1  3%  perf-stat.ps.bra=
nch-instructions
>       10512           -49.8%       5279 =C2=B1  6%  perf-stat.ps.context-=
switches
>   3.805e+08 =C2=B1  4%     -14.2%  3.265e+08 =C2=B1  3%  perf-stat.ps.dTL=
B-loads
>   1.918e+08 =C2=B1  3%     -14.7%  1.635e+08 =C2=B1  3%  perf-stat.ps.dTL=
B-stores
>   1.514e+09 =C2=B1  5%     -12.4%  1.327e+09 =C2=B1  3%  perf-stat.ps.ins=
tructions
>      125399 =C2=B1 14%     -32.6%      84480 =C2=B1  9%  perf-stat.ps.nod=
e-load-misses
>   9.563e+10 =C2=B1  6%     -12.3%  8.383e+10 =C2=B1  3%  perf-stat.total.=
instructions
>        8.31 =C2=B1 20%      -3.9        4.45 =C2=B1 25%  perf-profile.cal=
ltrace.cycles-pp.entry_SYSCALL_64_after_hwframe
>        8.30 =C2=B1 20%      -3.9        4.45 =C2=B1 25%  perf-profile.cal=
ltrace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        2.35 =C2=B1 19%      -1.6        0.75 =C2=B1 25%  perf-profile.cal=
ltrace.cycles-pp.__x64_sys_sync.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        2.35 =C2=B1 19%      -1.6        0.75 =C2=B1 25%  perf-profile.cal=
ltrace.cycles-pp.ksys_sync.__x64_sys_sync.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>        2.08 =C2=B1 19%      -1.6        0.50 =C2=B1 72%  perf-profile.cal=
ltrace.cycles-pp.iterate_supers.ksys_sync.__x64_sys_sync.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>        1.85 =C2=B1 25%      -0.7        1.14 =C2=B1 31%  perf-profile.cal=
ltrace.cycles-pp.do_mknodat.do_syscall_64.entry_SYSCALL_64_after_hwframe
>        1.04 =C2=B1 27%      -0.7        0.36 =C2=B1106%  perf-profile.cal=
ltrace.cycles-pp.xfs_inactive_ifree.xfs_inactive.xfs_fs_destroy_inode.destr=
oy_inode.do_unlinkat
>        1.08 =C2=B1 27%      -0.6        0.46 =C2=B1 77%  perf-profile.cal=
ltrace.cycles-pp.destroy_inode.do_unlinkat.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
>        1.05 =C2=B1 27%      -0.6        0.45 =C2=B1 77%  perf-profile.cal=
ltrace.cycles-pp.xfs_fs_destroy_inode.destroy_inode.do_unlinkat.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
>        1.04 =C2=B1 27%      -0.6        0.44 =C2=B1 78%  perf-profile.cal=
ltrace.cycles-pp.xfs_inactive.xfs_fs_destroy_inode.destroy_inode.do_unlinka=
t.do_syscall_64
>        0.89 =C2=B1 17%      -0.3        0.58 =C2=B1  9%  perf-profile.cal=
ltrace.cycles-pp.worker_thread.kthread.ret_from_fork
>        1.21 =C2=B1  8%      +0.2        1.45 =C2=B1  7%  perf-profile.cal=
ltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_inte=
rrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>        8.13 =C2=B1  9%      +2.0       10.16 =C2=B1  6%  perf-profile.cal=
ltrace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer=
_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>        2.35 =C2=B1 19%      -1.6        0.75 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.__x64_sys_sync
>        2.35 =C2=B1 19%      -1.6        0.75 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.ksys_sync
>        2.09 =C2=B1 19%      -1.4        0.65 =C2=B1 25%  perf-profile.chi=
ldren.cycles-pp.iterate_supers
>        2.25 =C2=B1 18%      -1.1        1.14 =C2=B1 26%  perf-profile.chi=
ldren.cycles-pp._raw_spin_lock
>        1.40 =C2=B1 25%      -1.1        0.31 =C2=B1 54%  perf-profile.chi=
ldren.cycles-pp.native_queued_spin_lock_slowpath
>        1.85 =C2=B1 25%      -0.7        1.14 =C2=B1 31%  perf-profile.chi=
ldren.cycles-pp.do_mknodat
>        1.08 =C2=B1 27%      -0.5        0.55 =C2=B1 43%  perf-profile.chi=
ldren.cycles-pp.destroy_inode
>        1.05 =C2=B1 27%      -0.5        0.54 =C2=B1 42%  perf-profile.chi=
ldren.cycles-pp.xfs_fs_destroy_inode
>        1.04 =C2=B1 27%      -0.5        0.54 =C2=B1 43%  perf-profile.chi=
ldren.cycles-pp.xfs_inactive
>        1.04 =C2=B1 27%      -0.5        0.53 =C2=B1 44%  perf-profile.chi=
ldren.cycles-pp.xfs_inactive_ifree
>        0.93 =C2=B1 21%      -0.5        0.44 =C2=B1 24%  perf-profile.chi=
ldren.cycles-pp.__schedule
>        0.49 =C2=B1 25%      -0.4        0.11 =C2=B1 76%  perf-profile.chi=
ldren.cycles-pp.pick_next_task_fair
>        1.05 =C2=B1 20%      -0.4        0.69 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.find_busiest_group
>        0.66 =C2=B1 19%      -0.3        0.32 =C2=B1 30%  perf-profile.chi=
ldren.cycles-pp.schedule
>        1.00 =C2=B1 20%      -0.3        0.65 =C2=B1 13%  perf-profile.chi=
ldren.cycles-pp.update_sd_lb_stats
>        0.60 =C2=B1 20%      -0.3        0.29 =C2=B1 31%  perf-profile.chi=
ldren.cycles-pp.xfs_ifree
>        0.89 =C2=B1 17%      -0.3        0.58 =C2=B1  9%  perf-profile.chi=
ldren.cycles-pp.worker_thread
>        0.44 =C2=B1 26%      -0.3        0.16 =C2=B1 45%  perf-profile.chi=
ldren.cycles-pp.newidle_balance
>        0.49 =C2=B1 39%      -0.3        0.22 =C2=B1 35%  perf-profile.chi=
ldren.cycles-pp.xfs_fs_sync_fs
>        0.40 =C2=B1 49%      -0.2        0.17 =C2=B1 29%  perf-profile.chi=
ldren.cycles-pp.xfs_log_force
>        0.31 =C2=B1 29%      -0.2        0.11 =C2=B1 56%  perf-profile.chi=
ldren.cycles-pp.schedule_timeout
>        0.24 =C2=B1 60%      -0.2        0.06 =C2=B1 50%  perf-profile.chi=
ldren.cycles-pp.xfs_inobt_get_rec
>        0.38 =C2=B1 19%      -0.2        0.21 =C2=B1 30%  perf-profile.chi=
ldren.cycles-pp.xfs_btree_lookup
>        0.42 =C2=B1 14%      -0.2        0.26 =C2=B1 35%  perf-profile.chi=
ldren.cycles-pp.xfs_check_agi_freecount
>        0.30 =C2=B1 27%      -0.2        0.14 =C2=B1 37%  perf-profile.chi=
ldren.cycles-pp.xfs_btree_lookup_get_block
>        0.25 =C2=B1 30%      -0.1        0.10 =C2=B1 39%  perf-profile.chi=
ldren.cycles-pp.iterate_bdevs
>        0.33 =C2=B1 28%      -0.1        0.19 =C2=B1 20%  perf-profile.chi=
ldren.cycles-pp.try_to_wake_up
>        0.26 =C2=B1 31%      -0.1        0.13 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.schedule_idle
>        0.16 =C2=B1 36%      -0.1        0.03 =C2=B1102%  perf-profile.chi=
ldren.cycles-pp.__down
>        0.16 =C2=B1 35%      -0.1        0.04 =C2=B1 73%  perf-profile.chi=
ldren.cycles-pp.xfs_buf_lock
>        0.16 =C2=B1 36%      -0.1        0.04 =C2=B1 73%  perf-profile.chi=
ldren.cycles-pp.down
>        0.21 =C2=B1 39%      -0.1        0.09 =C2=B1 52%  perf-profile.chi=
ldren.cycles-pp.xfs_iunlink_remove
>        0.19 =C2=B1 28%      -0.1        0.08 =C2=B1 43%  perf-profile.chi=
ldren.cycles-pp.xfs_buf_item_release
>        0.21 =C2=B1 33%      -0.1        0.10 =C2=B1 35%  perf-profile.chi=
ldren.cycles-pp.xfs_difree_inobt
>        0.14 =C2=B1 16%      -0.1        0.04 =C2=B1104%  perf-profile.chi=
ldren.cycles-pp._xfs_trans_bjoin
>        0.18 =C2=B1 30%      -0.1        0.08 =C2=B1 80%  perf-profile.chi=
ldren.cycles-pp.wait_for_completion
>        0.15 =C2=B1 27%      -0.1        0.06 =C2=B1 53%  perf-profile.chi=
ldren.cycles-pp.up
>        0.15 =C2=B1 33%      -0.1        0.06 =C2=B1 81%  perf-profile.chi=
ldren.cycles-pp.xfs_difree_finobt
>        0.15 =C2=B1 27%      -0.1        0.08 =C2=B1 19%  perf-profile.chi=
ldren.cycles-pp.xfs_trans_alloc
>        0.10 =C2=B1 29%      -0.1        0.04 =C2=B1 72%  perf-profile.chi=
ldren.cycles-pp.xfs_log_reserve
>        0.04 =C2=B1 77%      +0.1        0.10 =C2=B1 34%  perf-profile.chi=
ldren.cycles-pp.balance_fair
>        0.05 =C2=B1 79%      +0.1        0.15 =C2=B1 31%  perf-profile.chi=
ldren.cycles-pp.smpboot_thread_fn
>        0.58 =C2=B1 16%      +0.1        0.72 =C2=B1 11%  perf-profile.chi=
ldren.cycles-pp.update_rq_clock
>        1.24 =C2=B1  8%      +0.3        1.52 =C2=B1  4%  perf-profile.chi=
ldren.cycles-pp.perf_mux_hrtimer_handler
>        8.31 =C2=B1  9%      +2.1       10.40 =C2=B1  5%  perf-profile.chi=
ldren.cycles-pp.__hrtimer_run_queues
>        1.30 =C2=B1 18%      -1.0        0.30 =C2=B1 54%  perf-profile.sel=
f.cycles-pp.native_queued_spin_lock_slowpath
>        0.75 =C2=B1 21%      -0.3        0.44 =C2=B1 20%  perf-profile.sel=
f.cycles-pp.__percpu_counter_sum
>        0.43 =C2=B1 25%      -0.3        0.16 =C2=B1 45%  perf-profile.sel=
f.cycles-pp.down_read
>        0.72 =C2=B1 13%      -0.2        0.47 =C2=B1 12%  perf-profile.sel=
f.cycles-pp.update_sd_lb_stats
>        0.35 =C2=B1 15%      +0.1        0.43 =C2=B1 13%  perf-profile.sel=
f.cycles-pp.irqtime_account_irq
>        0.08 =C2=B1 60%      +0.1        0.16 =C2=B1 18%  perf-profile.sel=
f.cycles-pp.timerqueue_del
> =

> =

>                                                                          =
        =

>                             stress-ng.time.system_time
>                                                                          =
        =

>    20 +------------------------------------------------------------------=
----+
>       |            +                                                     =
    |
>    18 |-+     +   ::                                       .+            =
    |
>       |      : :  ::                   +..               .+  :           =
    |
>    16 |-+    : : :  :                 :       +.    +   +    :     +     =
    |
>       |:    +   ::  :                 :   +  :  +  : : :      :  .. +    =
    |
>    14 |:+  +    +   :         .+.   .+     + :   + : : :      +.+    +.  =
 .+.|
>       | +.+         :  +.+.+.+   +.+        +     +   +                +.=
+   |
>    12 |-+           :  :                                                 =
    |
>       |              ::                                                  =
    |
>    10 |-+            ::                                                  =
    |
>       |              +                                                   =
    |
>     8 |-+                    O   O   O      O   O       O O              =
    |
>       | O O     O    O     O   O       O      O   O O       O            =
    |
>     6 +------------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                     stress-ng.time.percent_of_cpu_this_job_got
>                                                                          =
        =

>    35 +------------------------------------------------------------------=
----+
>       |                                                                  =
    |
>       |       +    +                                        +            =
    |
>    30 |-+     ::  ::                                       +:            =
    |
>       |      : :  ::                   +..    +     +   +.+  :     +     =
    |
>       |:     :  ::  :                 :      : +   : : :     :   .. :    =
    |
>    25 |:+  .+   +   :                 :   +. :  +. : : :      :.+   :    =
    |
>       | +.+         :  +.+.+.+.+.+.+.+      +     +   +       +      +.+.=
+.+.|
>    20 |-+           :  :                                                 =
    |
>       |             : :                                                  =
    |
>       |              ::                                                  =
    |
>    15 |-+            :                                                   =
    |
>       |              +       O   O   O      O   O       O O              =
    |
>       | O O O O O  O O O O O   O   O   O  O   O   O O       O            =
    |
>    10 +------------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                        stress-ng.time.voluntary_context_switches
>                                                                          =
        =

>    260000 +--------------------------------------------------------------=
----+
>    240000 |-+     +                                                      =
    |
>           |      + :  +.                  +                 .+. .+.      =
    |
>    220000 |++.+.+  : +  +.   .+.         + + +.+. .+.+   +.+   +   +. .+.=
 .+.|
>    200000 |-+       +     +.+   +. .+. .+   +    +    + +            +   =
+   |
>           |                       +   +                +                 =
    |
>    180000 |-+                                                            =
    |
>    160000 |-+                                                            =
    |
>    140000 |-+                                                            =
    |
>           |                                                              =
    |
>    120000 |-+           O                                                =
    |
>    100000 |-O   O         O O                          O                 =
    |
>           |       O   O                   O    O   O       O   O         =
    |
>     80000 |-+ O               O O O   O O   OO   O   O   O   O           =
    |
>     60000 +--------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                                   stress-ng.mknod.ops
>                                                                          =
        =

>    95000 +---------------------------------------------------------------=
----+
>    90000 |-+    .+. .+.                                     .+. .+.      =
    |
>          |.+.+.+   +   +.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+.+   +   +. .+.=
+.+.|
>    85000 |-+                                                         +   =
    |
>    80000 |-+                                                             =
    |
>          |                                                               =
    |
>    75000 |-+                                                             =
    |
>    70000 |-+                                                             =
    |
>    65000 |-+                                                             =
    |
>          |                                                               =
    |
>    60000 |-+                                                             =
    |
>    55000 |-+                                                             =
    |
>          |                                                               =
    |
>    50000 |-O O O O O O O O O O O O O O O O O O O O O O O O O   O O       =
    |
>    45000 +---------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
                                                                           =
             =

>                              stress-ng.mknod.ops_per_sec
>                                                                          =
        =

>    1600 +----------------------------------------------------------------=
----+
>         |      .+.                                          .+. .+       =
    |
>    1500 |.+.+.+   +.+.+.+.+.+. .+.+.+.+.+..+.+.+.+.+.+.+.+.+   +  +   .+.=
+.+.|
>    1400 |-+                   +                                    +.+   =
    |
>         |                                                                =
    |
>    1300 |-+                                                              =
    |
>    1200 |-+                                                              =
    |
>         |                                                                =
    |
>    1100 |-+                                                              =
    |
>    1000 |-+                                                              =
    |
>         |                                                                =
    |
>     900 |-+                                                              =
    |
>     800 |-+   O O   O O O     O O       O      O O     O O O     O       =
    |
>         | O O     O       O O     O O O    O O     O O       O O         =
    |
>     700 +----------------------------------------------------------------=
----+
>                                                                          =
        =

>                                                                          =
        =

> [*] bisect-good sample
> [O] bisect-bad  sample
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


-- =

Zhengjun Xing
--===============5099379762542007634==--

