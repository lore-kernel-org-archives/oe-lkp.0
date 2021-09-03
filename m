Content-Type: multipart/mixed; boundary="===============4545930586569551567=="
MIME-Version: 1.0
From: Xing Zhengjun <zhengjun.xing@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [xfs] bad77c375e: stress-ng.fallocate.ops_per_sec -10.0% regression
Date: Fri, 03 Sep 2021 15:40:39 +0800
Message-ID: <36dc5f38-f8ec-591a-8efa-b3bd607ac06e@linux.intel.com>
In-Reply-To: <20210902072704.GC8267@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4545930586569551567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dave,

    Do you have time to look at this? Thanks.

On 9/2/2021 3:27 PM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -10.0% regression of stress-ng.fallocate.ops_per_sec du=
e to commit:
> =

> =

> commit: bad77c375e8de6c776c848e443f7dc2d0d909be5 ("xfs: CIL checkpoint fl=
ushes caches unconditionally")
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
> 	test: fallocate
> 	cpufreq_governor: performance
> 	ucode: 0x5003006
> =

> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
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
x86_64-20200603.cgz/lkp-csl-2sp7/fallocate/stress-ng/60s/0x5003006
> =

> commit:
>    0431d926b3 ("xfs: async blkdev cache flush")
>    bad77c375e ("xfs: CIL checkpoint flushes caches unconditionally")
> =

> 0431d926b399d74f bad77c375e8de6c776c848e443f
> ---------------- ---------------------------
>           %stddev     %change         %stddev
>               \          |                \
>      618.67           -10.0%     556.67 =C2=B1  2%  stress-ng.fallocate.o=
ps
>       10.31           -10.0%       9.28 =C2=B1  2%  stress-ng.fallocate.o=
ps_per_sec
>      111618            -5.7%     105270        stress-ng.time.voluntary_c=
ontext_switches
>      502.67 =C2=B1  2%     +52.0%     763.83 =C2=B1 47%  interrupts.CPU44=
.CAL:Function_call_interrupts
>        2.10 =C2=B1  2%     -25.1%       1.57        iostat.cpu.iowait
>        2.16 =C2=B1  2%      -0.5        1.62        mpstat.cpu.all.iowait%
>        0.09 =C2=B1 11%     +45.0%       0.14 =C2=B1 34%  perf-sched.sch_d=
elay.avg.ms.worker_thread.kthread.ret_from_fork
>      151.00 =C2=B1 19%     +20.2%     181.50 =C2=B1  7%  perf-sched.wait_=
and_delay.count.smpboot_thread_fn.kthread.ret_from_fork
>        6749            +6.4%       7178        perf-stat.i.context-switch=
es
>        6640            +6.4%       7063        perf-stat.ps.context-switc=
hes
>      353877            -1.4%     348924        proc-vmstat.pgfree
>       39122           -15.1%      33221        proc-vmstat.pgpgout
>        1225 =C2=B1 14%      -9.0%       1115        turbostat.Bzy_MHz
>       86.82 =C2=B1 17%     -10.4%      77.83        turbostat.PkgWatt
>      602.83           -15.1%     511.83        vmstat.io.bo
>        6953            +6.1%       7376        vmstat.system.cs
>        1.33 =C2=B1  6%      +0.4        1.70 =C2=B1 13%  perf-profile.cal=
ltrace.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_inte=
rrupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>        0.08 =C2=B1 22%      +0.1        0.17 =C2=B1 23%  perf-profile.chi=
ldren.cycles-pp.wait_for_completion
>        0.07 =C2=B1 17%      +0.1        0.19 =C2=B1 64%  perf-profile.chi=
ldren.cycles-pp.submit_bio
>        0.07 =C2=B1 17%      +0.1        0.19 =C2=B1 64%  perf-profile.chi=
ldren.cycles-pp.submit_bio_noacct
>        1.40 =C2=B1  8%      +0.3        1.74 =C2=B1 12%  perf-profile.chi=
ldren.cycles-pp.perf_mux_hrtimer_handler
> =

> =

>                                                                          =
        =

>                           stress-ng.fallocate.ops_per_sec
>                                                                          =
        =

>    12 +------------------------------------------------------------------=
----+
>       |                                                                  =
    |
>    10 |.+.++.+.+.+  +.+.+.++.+.+.++.+.+.+.++.+.+.++.+.+.++.+.+.+.++.+.+.+=
+.+.|
>       | O        :  :                             O O   OO O O O OO      =
    |
>       |   OO O   :O :            O             O O    O                  =
    |
>     8 |-+      O :  : O O OO O O  O O O O OO O                           =
    |
>       |          : :                                                     =
    |
>     6 |-+        : :                                                     =
    |
>       |           ::                                                     =
    |
>     4 |-+         ::                                                     =
    |
>       |           ::                                                     =
    |
>       |           ::                                                     =
    |
>     2 |-+         :                                                      =
    |
>       |           :                                                      =
    |
>     0 +------------------------------------------------------------------=
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
--===============4545930586569551567==--

