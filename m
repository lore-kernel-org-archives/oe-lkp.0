Content-Type: multipart/mixed; boundary="===============4545438421358985281=="
MIME-Version: 1.0
From: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
To: lkp@lists.01.org
Subject: Re: [zsmalloc] 44f43e99fe: will-it-scale.scalability +15.0% improvement
Date: Fri, 13 May 2016 21:31:00 +0900
Message-ID: <20160513123100.GB567@swordfish>
In-Reply-To: <20160513014010.GB24890@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============4545438421358985281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On (05/13/16 09:40), kernel test robot wrote:
> FYI, we noticed will-it-scale.scalability +15.0% improvement due to commi=
t:

which is a good thing, isn't it?  :)

thanks!

	-ss

> commit 44f43e99fe70833058482d183e99fdfd11220996 ("zsmalloc: fix zs_can_co=
mpact() integer overflow")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase - will-it-scale
> on test machine - xps: 8 threads Nehalem with 4G memory
> =

> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/xps/write1=
/will-it-scale
> =

> commit: =

>   1e92a61c4c7ed85c1bec037c046e92d6dc762f32
>   44f43e99fe70833058482d183e99fdfd11220996
> =

> 1e92a61c4c7ed85c 44f43e99fe70833058482d183e =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>          %stddev     %change         %stddev
>              \          |                \  =

>    1269910 =C2=B1  0%      -7.7%    1172297 =C2=B1  0%  will-it-scale.per=
_process_ops
>    1219902 =C2=B1  0%      -7.7%    1125807 =C2=B1  0%  will-it-scale.per=
_thread_ops
>       0.22 =C2=B1  2%     +15.0%       0.25 =C2=B1  0%  will-it-scale.sca=
lability
>     962.50 =C2=B1  2%      -4.4%     920.00 =C2=B1  2%  vmstat.system.cs
>      56.78 =C2=B1  7%     +99.5%     113.28 =C2=B1 53%  sched_debug.cpu.l=
oad.stddev
>       0.41 =C2=B1  5%     +13.7%       0.47 =C2=B1  5%  sched_debug.cpu.n=
r_running.stddev
>       5576 =C2=B1  3%     +19.1%       6642 =C2=B1  4%  slabinfo.anon_vma=
_chain.active_objs
>       5681 =C2=B1  3%     +17.9%       6696 =C2=B1  4%  slabinfo.anon_vma=
_chain.num_objs
>       1610 =C2=B1 15%     +22.5%       1973 =C2=B1  4%  slabinfo.cred_jar=
.active_objs
> =

> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase:
>   gcc-4.9/performance/x86_64-rhel/debian-x86_64-2015-02-07.cgz/xps/writes=
eek2/will-it-scale
> =

> commit: =

>   1e92a61c4c7ed85c1bec037c046e92d6dc762f32
>   44f43e99fe70833058482d183e99fdfd11220996
> =

> 1e92a61c4c7ed85c 44f43e99fe70833058482d183e =

> ---------------- -------------------------- =

>        fail:runs  %reproduction    fail:runs
>            |             |             |    =

>            :4           25%           1:4     kmsg.do_IRQ:#No_irq_handler=
_for_vector
>          %stddev     %change         %stddev
>              \          |                \  =

>     768011 =C2=B1  0%      -8.7%     701413 =C2=B1  0%  will-it-scale.per=
_process_ops
>     660490 =C2=B1  0%      -7.9%     608530 =C2=B1  0%  will-it-scale.per=
_thread_ops
>       0.06 =C2=B1  2%     +13.8%       0.07 =C2=B1  0%  will-it-scale.sca=
lability
>     702840 =C2=B1 11%     +56.7%    1101645 =C2=B1 11%  cpuidle.C1E-NHM.t=
ime
>      23738 =C2=B1  4%      -7.5%      21947 =C2=B1  1%  softirqs.RCU
>     173.21 =C2=B1  8%     +13.9%     197.33 =C2=B1  3%  sched_debug.cfs_r=
q:/.load.max
>      56.64 =C2=B1  8%     +24.1%      70.31 =C2=B1  3%  sched_debug.cfs_r=
q:/.load.stddev
>      36.58 =C2=B1  5%     -12.2%      32.12 =C2=B1  4%  sched_debug.cpu.c=
pu_load[3].min
>     173.21 =C2=B1  8%     +13.9%     197.33 =C2=B1  3%  sched_debug.cpu.l=
oad.max
>      56.65 =C2=B1  8%     +24.1%      70.32 =C2=B1  3%  sched_debug.cpu.l=
oad.stddev
> =

> =

> =

>                              will-it-scale.scalability
> =

>   0.27 ++----------------------------------------------------------------=
---+
>        |                O                                                =
   |
>   0.26 ++     O  O                                                       =
   |
>        O  O          O      O  O   O      O  O  O      O                 =
   |
>   0.25 ++                             O             O                    =
   |
>        |                                                                 =
   |
>   0.24 ++                                                                =
   |
>        |                                                                 =
   |
>   0.23 ++                                                                =
   |
>        |                                                             *...=
*..|
>   0.22 ++.*...  .*..    *...*..  ..*..  ..*..     ..*..  ..*..      +    =
   *
>        *.     *.    . ..       *.     *.       .*.     *.          +     =
   |
>   0.21 ++            *                       *.               *...*      =
   |
>        |                                                                 =
   |
>    0.2 ++----------------------------------------------------------------=
---+
> =

> =

>                              will-it-scale.per_process_ops
> =

>    1.3e+06 ++------------------------------------------------------------=
---+
>            |                                                             =
   |
>   1.28e+06 ++                ..*..                                       =
  .*
>   1.26e+06 *+.*...*..*..*..*.     *..*..*...*..*..*..*...*..*..*..*...*..=
*. |
>            |                                                             =
   |
>   1.24e+06 ++                                                            =
   |
>            |                                                             =
   |
>   1.22e+06 ++                                                            =
   |
>            |                                                             =
   |
>    1.2e+06 ++                                                            =
   |
>   1.18e+06 ++                                                            =
   |
>            |                      O  O  O      O  O  O                   =
   |
>   1.16e+06 ++           O      O            O            O               =
   |
>            O      O  O     O                                             =
   |
>   1.14e+06 ++-O----------------------------------------------------------=
---+
> =

> =

>                              will-it-scale.per_thread_ops
> =

>   1.24e+06 ++------------------------------------------------------------=
---+
>            |                                                             =
  .*
>   1.22e+06 ++       .*..*..  ..*..        ..*..*..         .*..*..*...*..=
*. |
>            *..*...*.       *.     *..*..*.        *..*...*.              =
   |
>    1.2e+06 ++                                                            =
   |
>            |                                                             =
   |
>   1.18e+06 ++                                                            =
   |
>            |                                                             =
   |
>   1.16e+06 ++                                                            =
   |
>            |                                                             =
   |
>   1.14e+06 ++                                                            =
   |
>            |                      O     O      O     O                   =
   |
>   1.12e+06 ++ O      O     O         O      O     O      O               =
   |
>            O      O     O      O                                         =
   |
>    1.1e+06 ++------------------------------------------------------------=
---+
> =

> =

> 	[*] bisect-good sample
> 	[O] bisect-bad  sample
> =

> To reproduce:
> =

>         git clone git://git.kernel.org/pub/scm/linux/kernel/git/wfg/lkp-t=
ests.git
>         cd lkp-tests
>         bin/lkp install job.yaml  # job file is attached in this email
>         bin/lkp run     job.yaml
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
> Xiaolong

> ---
> LKP_SERVER: inn
> LKP_CGI_PORT: 80
> LKP_CIFS_PORT: 139
> testcase: will-it-scale
> default-monitors:
>   wait: activate-monitor
>   kmsg: =

>   uptime: =

>   iostat: =

>   heartbeat: =

>   vmstat: =

>   numa-numastat: =

>   numa-vmstat: =

>   numa-meminfo: =

>   proc-vmstat: =

>   proc-stat:
>     interval: 10
>   meminfo: =

>   slabinfo: =

>   interrupts: =

>   lock_stat: =

>   latency_stats: =

>   softirqs: =

>   bdi_dev_mapping: =

>   diskstats: =

>   nfsstat: =

>   cpuidle: =

>   cpufreq-stats: =

>   turbostat: =

>   pmeter: =

>   sched_debug:
>     interval: 60
> cpufreq_governor: performance
> NFS_HANG_DF_TIMEOUT: 200
> NFS_HANG_CHECK_INTERVAL: 900
> default-watchdogs:
>   oom-killer: =

>   watchdog: =

>   nfs-hang: =

> commit: 44f43e99fe70833058482d183e99fdfd11220996
> model: Nehalem
> nr_cpu: 8
> memory: 4G
> hdd_partitions: =

> swap_partitions: "/dev/disk/by-id/ata-HDT722516DLA380_VDK91GTE0WMZBR-part=
2"
> rootfs_partition: "/dev/disk/by-id/ata-HDT722516DLA380_VDK91GTE0WMZBR-par=
t1"
> netconsole_port: 6666
> category: benchmark
> perf-profile:
>   freq: 800
> will-it-scale:
>   test: write1
> queue: bisect
> testbox: xps
> tbox_group: xps
> kconfig: x86_64-rhel
> enqueue_time: 2016-05-13 00:36:18.600897786 +08:00
> compiler: gcc-4.9
> rootfs: debian-x86_64-2015-02-07.cgz
> id: 1ac9e260f98b0f5fa5cc2ddba9adbebc94694b67
> user: lkp
> head_commit: 2d0bd9534c8ddaebee64e1b4b7d621915f65e994
> base_commit: 1b46bac6275506db73592aa8b9bd1d67c79b95dc
> branch: linus/master
> result_root: "/result/will-it-scale/performance-write1/xps/debian-x86_64-=
2015-02-07.cgz/x86_64-rhel/gcc-4.9/44f43e99fe70833058482d183e99fdfd11220996=
/0"
> job_file: "/lkp/scheduled/xps/bisect_will-it-scale-performance-write1-deb=
ian-x86_64-2015-02-07.cgz-x86_64-rhel-44f43e99fe70833058482d183e99fdfd11220=
996-20160513-19998-10wxcv0-0.yaml"
> max_uptime: 1500
> initrd: "/osimage/debian/debian-x86_64-2015-02-07.cgz"
> bootloader_append:
> - root=3D/dev/ram0
> - user=3Dlkp
> - job=3D/lkp/scheduled/xps/bisect_will-it-scale-performance-write1-debian=
-x86_64-2015-02-07.cgz-x86_64-rhel-44f43e99fe70833058482d183e99fdfd11220996=
-20160513-19998-10wxcv0-0.yaml
> - ARCH=3Dx86_64
> - kconfig=3Dx86_64-rhel
> - branch=3Dlinus/master
> - commit=3D44f43e99fe70833058482d183e99fdfd11220996
> - BOOT_IMAGE=3D/pkg/linux/x86_64-rhel/gcc-4.9/44f43e99fe70833058482d183e9=
9fdfd11220996/vmlinuz-4.6.0-rc7-00002-g44f43e9
> - max_uptime=3D1500
> - RESULT_ROOT=3D/result/will-it-scale/performance-write1/xps/debian-x86_6=
4-2015-02-07.cgz/x86_64-rhel/gcc-4.9/44f43e99fe70833058482d183e99fdfd112209=
96/0
> - LKP_SERVER=3Dinn
> - |2-
> =

> =

>   earlyprintk=3DttyS0,115200 systemd.log_level=3Derr
>   debug apic=3Ddebug sysrq_always_enabled rcupdate.rcu_cpu_stall_timeout=
=3D100
>   panic=3D-1 softlockup_panic=3D1 nmi_watchdog=3Dpanic oops=3Dpanic load_=
ramdisk=3D2 prompt_ramdisk=3D0
>   console=3DttyS0,115200 console=3Dtty0 vga=3Dnormal
> =

>   rw
> lkp_initrd: "/lkp/lkp/lkp-x86_64.cgz"
> modules_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/44f43e99fe70833058482d183=
e99fdfd11220996/modules.cgz"
> bm_initrd: "/osimage/deps/debian-x86_64-2015-02-07.cgz/lkp.cgz,/osimage/d=
eps/debian-x86_64-2015-02-07.cgz/run-ipconfig.cgz,/osimage/deps/debian-x86_=
64-2015-02-07.cgz/turbostat.cgz,/lkp/benchmarks/turbostat.cgz,/lkp/benchmar=
ks/perf-profile-x86_64.cgz,/osimage/deps/debian-x86_64-2015-02-07.cgz/will-=
it-scale.cgz,/lkp/benchmarks/will-it-scale.cgz,/lkp/benchmarks/will-it-scal=
e-x86_64.cgz"
> linux_headers_initrd: "/pkg/linux/x86_64-rhel/gcc-4.9/44f43e99fe708330584=
82d183e99fdfd11220996/linux-headers.cgz"
> repeat_to: 2
> kernel: "/pkg/linux/x86_64-rhel/gcc-4.9/44f43e99fe70833058482d183e99fdfd1=
1220996/vmlinuz-4.6.0-rc7-00002-g44f43e9"
> dequeue_time: 2016-05-13 00:45:48.766806189 +08:00
> job_state: finished
> loadavg: 7.24 3.46 1.38 1/166 4778
> start_time: '1463071573'
> end_time: '1463071878'
> version: "/lkp/lkp/.src-20160513-001235"

> 2016-05-13 00:46:12 echo performance > /sys/devices/system/cpu/cpu0/cpufr=
eq/scaling_governor
> 2016-05-13 00:46:12 echo performance > /sys/devices/system/cpu/cpu1/cpufr=
eq/scaling_governor
> 2016-05-13 00:46:12 echo performance > /sys/devices/system/cpu/cpu2/cpufr=
eq/scaling_governor
> 2016-05-13 00:46:12 echo performance > /sys/devices/system/cpu/cpu3/cpufr=
eq/scaling_governor
> 2016-05-13 00:46:12 echo performance > /sys/devices/system/cpu/cpu4/cpufr=
eq/scaling_governor
> 2016-05-13 00:46:12 echo performance > /sys/devices/system/cpu/cpu5/cpufr=
eq/scaling_governor
> 2016-05-13 00:46:12 echo performance > /sys/devices/system/cpu/cpu6/cpufr=
eq/scaling_governor
> 2016-05-13 00:46:12 echo performance > /sys/devices/system/cpu/cpu7/cpufr=
eq/scaling_governor
> 2016-05-13 00:46:13 ./runtest.py write1 32 both 1 4 6 8


--===============4545438421358985281==--

