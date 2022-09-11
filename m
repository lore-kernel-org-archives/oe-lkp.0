Content-Type: multipart/mixed; boundary="===============2336182661252183214=="
MIME-Version: 1.0
From: Thorsten Leemhuis <regressions@leemhuis.info>
To: lkp@lists.01.org
Subject: Re: [sched] f3dd3f6745: fxmark.ssd_ext4_no_jnl_DWSL_72_directio.works/sec -30.5% regression #forregzbot
Date: Sun, 11 Sep 2022 18:12:22 +0200
Message-ID: <76dad4d1-24f9-1df0-6b12-9f4876c00e8d@leemhuis.info>
In-Reply-To: <Yw9xPOWgpPc5a0Pu@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============2336182661252183214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

TWIMC: this mail is primarily send for documentation purposes and for
regzbot, my Linux kernel regression tracking bot. These mails usually
contain '#forregzbot' in the subject, to make them easy to spot and filter.

Hi, this is your Linux kernel regression tracker. Top-posting for once,
to make this easily accessible to everyone.

As per recent general discussions with the 0-day folks, I'm dropping
below regression report from the list of tracked issues, as this report
didn't gain any traction. That for example can happen if the developers
considered the regression of no practical relevance, as they assume it
only materializes in micro-benchmarks, is due to a broken test case, or
some fluke =E2=80=93 and then they often not even reply.

Not sure if that or something else is the reason why this particular
report didn't gain any traction, but I lack the bandwidth to follow-up
on each and every performace regression 0-day bot found and reported. At
the same time I don't want to keep these reports in the list of tracked
issues forever, as that creates noise and makes it harder to spot the
important issues in regzbot's reports and lists. That's why I hereby
remove it:

#regzbot invalid: 0-day report that didn't get traction; likely of no
relevance, not sure

Ciao, Thorsten

On 31.08.22 16:33, kernel test robot wrote:
> =

> (please be noted we reported
> "[sched]  f3dd3f6745: fxmark.ssd_ext4_no_jnl_DWSL_72_directio.works/sec -=
33.0% regression"
> when this commit is on
> https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git sched/core
> at
> https://lore.kernel.org/all/YsL4FPFyYnxgIP4D(a)xsang-OptiPlex-9020/
> now we noticed this commit has already been merged to mainline, and we st=
ill
> see the similar regression.
> =

> at the same time, we also noticed there are improvments in numbers of oth=
er
> test cases. details are as below. FYI)
> =

> =

> Greeting,
> =

> FYI, we noticed a -30.5% regression of fxmark.ssd_ext4_no_jnl_DWSL_72_dir=
ectio.works/sec due to commit:
> =

> =

> commit: f3dd3f674555bd9455c5ae7fafce0696bd9931b3 ("sched: Remove the limi=
tation of WF_ON_CPU on wakelist if wakee cpu is idle")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: fxmark
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU=
 @ 2.60GHz (Ice Lake) with 128G memory
> with following parameters:
> =

> 	disk: 1SSD
> 	media: ssd
> 	test: DWSL
> 	fstype: ext4_no_jnl
> 	directio: directio
> 	cpufreq_governor: performance
> 	ucode: 0xd000363
> =

> test-description: FxMark is a filesystem benchmark that test multicore sc=
alability.
> test-url: https://github.com/sslab-gatech/fxmark
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | dbench: dbench.throughput-MB/sec 26.4% improvement  =
                                                                    |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz (Cascade Lake) with 512G memory                           |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | disk=3D1HDD                                         =
                                                                      |
> |                  | fs2=3Dcifs                                          =
                                                                      |
> |                  | fs=3Dbtrfs                                          =
                                                                      |
> |                  | nr_threads=3D100%                                   =
                                                                      |
> |                  | ucode=3D0x5003302                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | dbench: dbench.throughput-MB/sec 26.9% improvement  =
                                                                    |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz (Cascade Lake) with 512G memory                           |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | disk=3D1HDD                                         =
                                                                      |
> |                  | fs2=3Dcifs                                          =
                                                                      |
> |                  | fs=3Dxfs                                            =
                                                                      |
> |                  | nr_threads=3D100%                                   =
                                                                      |
> |                  | ucode=3D0x5003302                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | netperf: netperf.Throughput_tps 37.2% improvement   =
                                                                    |
> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242=
 CPU @ 2.30GHz (Cascade Lake) with 192G memory                      |
> | test parameters  | cluster=3Dcs-localhost                              =
                                                                      |
> |                  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | ip=3Dipv4                                           =
                                                                      |
> |                  | nr_threads=3D200%                                   =
                                                                      |
> |                  | runtime=3D300s                                      =
                                                                      |
> |                  | test=3DUDP_RR                                       =
                                                                      |
> |                  | ucode=3D0x5003302                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | aim7: aim7.jobs-per-min 6.5% improvement            =
                                                                    |
> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU=
 @ 2.10GHz (Cascade Lake) with 128G memory                          |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | disk=3D4BRD_12G                                     =
                                                                      |
> |                  | fs=3Df2fs                                           =
                                                                      |
> |                  | load=3D100                                          =
                                                                      |
> |                  | md=3DRAID0                                          =
                                                                      |
> |                  | test=3Dsync_disk_rw                                 =
                                                                      |
> |                  | ucode=3D0x5003302                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | netperf: netperf.Throughput_tps 54.1% improvement   =
                                                                    |
> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242=
 CPU @ 2.30GHz (Cascade Lake) with 192G memory                      |
> | test parameters  | cluster=3Dcs-localhost                              =
                                                                      |
> |                  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | ip=3Dipv4                                           =
                                                                      |
> |                  | nr_threads=3D200%                                   =
                                                                      |
> |                  | runtime=3D300s                                      =
                                                                      |
> |                  | test=3DSCTP_RR                                      =
                                                                      |
> |                  | ucode=3D0x5003302                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops 10.6% i=
mprovement                                                          |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU=
 @ 2.00GHz (Ice Lake) with 256G memory                              |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | mode=3Dprocess                                      =
                                                                      |
> |                  | nr_task=3D100%                                      =
                                                                      |
> |                  | test=3Dlock2                                        =
                                                                      |
> |                  | ucode=3D0xd000363                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | stress-ng: stress-ng.vm-segv.ops_per_sec 6.2% improv=
ement                                                               |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz (Ice Lake) with 128G memory                          |
> | test parameters  | class=3Dmemory                                      =
                                                                      |
> |                  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | nr_threads=3D100%                                   =
                                                                      |
> |                  | test=3Dvm-segv                                      =
                                                                      |
> |                  | testtime=3D60s                                      =
                                                                      |
> |                  | ucode=3D0xd000363                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | phoronix-test-suite: phoronix-test-suite.fio.RandomR=
ead.POSIXAIO.No.Yes.4KB.DefaultTestDirectory.mb_s 9.7% improvement  |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz (Cascade Lake) with 512G memory                           |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | option_a=3DRandom Read                              =
                                                                      |
> |                  | option_b=3DPOSIX AIO                                =
                                                                      |
> |                  | option_c=3DNo                                       =
                                                                      |
> |                  | option_d=3DYes                                      =
                                                                      |
> |                  | option_e=3D4KB                                      =
                                                                      |
> |                  | option_f=3DDefault Test Directory                   =
                                                                      |
> |                  | test=3Dfio-1.14.1                                   =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | phoronix-test-suite: phoronix-test-suite.fio.RandomR=
ead.Sync.No.No.4KB.DefaultTestDirectory.mb_s 6.6% improvement       |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz (Cascade Lake) with 512G memory                           |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | option_a=3DRandom Read                              =
                                                                      |
> |                  | option_b=3DSync                                     =
                                                                      |
> |                  | option_c=3DNo                                       =
                                                                      |
> |                  | option_d=3DNo                                       =
                                                                      |
> |                  | option_e=3D4KB                                      =
                                                                      |
> |                  | option_f=3DDefault Test Directory                   =
                                                                      |
> |                  | test=3Dfio-1.14.1                                   =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | phoronix-test-suite: phoronix-test-suite.rocksdb.Seq=
uentialFill.op_s 15.8% improvement                                  |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz (Cascade Lake) with 512G memory                           |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | option_a=3DSequential Fill                          =
                                                                      |
> |                  | test=3Drocksdb-1.0.2                                =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | phoronix-test-suite: phoronix-test-suite.network-loo=
pback.0.seconds -4.0% improvement                                   |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz (Cascade Lake) with 512G memory                           |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | test=3Dnetwork-loopback-1.0.3                       =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | phoronix-test-suite: phoronix-test-suite.fio.RandomR=
ead.IO_uring.Yes.No.4KB.DefaultTestDirectory.mb_s 17.1% improvement |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz (Cascade Lake) with 512G memory                           |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | option_a=3DRandom Read                              =
                                                                      |
> |                  | option_b=3DIO_uring                                 =
                                                                      |
> |                  | option_c=3DYes                                      =
                                                                      |
> |                  | option_d=3DNo                                       =
                                                                      |
> |                  | option_e=3D4KB                                      =
                                                                      |
> |                  | option_f=3DDefault Test Directory                   =
                                                                      |
> |                  | test=3Dfio-1.14.1                                   =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | phoronix-test-suite: phoronix-test-suite.perf-bench.=
SchedPipe.ops_sec 12.2% improvement                                 |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz (Cascade Lake) with 512G memory                           |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | option_a=3DSched Pipe                               =
                                                                      |
> |                  | test=3Dperf-bench-1.0.3                             =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | stress-ng: stress-ng.vm-segv.ops_per_sec 5.8% improv=
ement                                                               |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz (Ice Lake) with 128G memory                          |
> | test parameters  | class=3Dmemory                                      =
                                                                      |
> |                  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | nr_threads=3D100%                                   =
                                                                      |
> |                  | test=3Dvm-segv                                      =
                                                                      |
> |                  | testtime=3D60s                                      =
                                                                      |
> |                  | ucode=3D0xd000331                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | hackbench: hackbench.throughput 7.2% improvement    =
                                                                    |
> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU=
 @ 2.10GHz (Cascade Lake) with 128G memory                          |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | ipc=3Dpipe                                          =
                                                                      |
> |                  | iterations=3D8                                      =
                                                                      |
> |                  | mode=3Dprocess                                      =
                                                                      |
> |                  | nr_threads=3D50%                                    =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | netperf: netperf.Throughput_tps 1.3% improvement    =
                                                                    |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU=
 @ 2.00GHz (Ice Lake) with 256G memory                              |
> | test parameters  | cluster=3Dcs-localhost                              =
                                                                      |
> |                  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | ip=3Dipv4                                           =
                                                                      |
> |                  | nr_threads=3D25%                                    =
                                                                      |
> |                  | runtime=3D300s                                      =
                                                                      |
> |                  | test=3DUDP_RR                                       =
                                                                      |
> |                  | ucode=3D0xd000331                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | aim7: aim7.jobs-per-min 246.4% improvement          =
                                                                    |
> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU=
 @ 2.10GHz (Cascade Lake) with 128G memory                          |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | disk=3D4BRD_12G                                     =
                                                                      |
> |                  | fs=3Df2fs                                           =
                                                                      |
> |                  | load=3D100                                          =
                                                                      |
> |                  | md=3DRAID1                                          =
                                                                      |
> |                  | test=3Dsync_disk_rw                                 =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | aim7: aim7.jobs-per-min 3.9% improvement            =
                                                                    |
> | test machine     | 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU=
 @ 2.10GHz (Cascade Lake) with 128G memory                          |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | disk=3D4BRD_12G                                     =
                                                                      |
> |                  | fs=3Dxfs                                            =
                                                                      |
> |                  | load=3D300                                          =
                                                                      |
> |                  | md=3DRAID1                                          =
                                                                      |
> |                  | test=3Dsync_disk_rw                                 =
                                                                      |
> |                  | ucode=3D0x500320a                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | vm-scalability: vm-scalability.throughput 2.0% impro=
vement                                                              |
> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242=
 CPU @ 2.30GHz (Cascade Lake) with 192G memory                      |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | runtime=3D300s                                      =
                                                                      |
> |                  | size=3D2T                                           =
                                                                      |
> |                  | test=3Dshm-xread-seq-mt                             =
                                                                      |
> |                  | ucode=3D0x5003302                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | fxmark: fxmark.ssd_ext4_no_jnl_DWSL_54_bufferedio.wo=
rks/sec -17.8% regression                                           |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz (Ice Lake) with 128G memory                          |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | directio=3Dbufferedio                               =
                                                                      |
> |                  | disk=3D1SSD                                         =
                                                                      |
> |                  | fstype=3Dext4_no_jnl                                =
                                                                      |
> |                  | media=3Dssd                                         =
                                                                      |
> |                  | test=3DDWSL                                         =
                                                                      |
> |                  | ucode=3D0xd000331                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
> | testcase: change | fxmark: fxmark.ssd_ext4_no_jnl_DWSL_72_directio.work=
s/sec -33.0% regression                                             |
> | test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358=
 CPU @ 2.60GHz (Ice Lake) with 128G memory                          |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                                                      |
> |                  | directio=3Ddirectio                                 =
                                                                      |
> |                  | disk=3D1SSD                                         =
                                                                      |
> |                  | fstype=3Dext4_no_jnl                                =
                                                                      |
> |                  | media=3Dssd                                         =
                                                                      |
> |                  | test=3DDWSL                                         =
                                                                      |
> |                  | ucode=3D0xd000331                                   =
                                                                      |
> +------------------+-----------------------------------------------------=
--------------------------------------------------------------------+
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
> compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_=
group/test/testcase/ucode:
>   gcc-11/performance/directio/1SSD/ext4_no_jnl/x86_64-rhel-8.3/ssd/debian=
-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/DWSL/fxmark/0xd000363
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     554.71 =C2=B1  9%     -99.9%       0.47        fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.idle_sec
>      61.91 =C2=B1  9%     -99.9%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.idle_util
>     311.90 =C2=B1 16%    +177.2%     864.70        fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.iowait_sec
>      34.81 =C2=B1 16%    +177.4%      96.57        fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.iowait_util
>       3.75 =C2=B1  2%     -25.9%       2.78 =C2=B1  3%  fxmark.ssd_ext4_n=
o_jnl_DWSL_18_directio.softirq_sec
>       0.42 =C2=B1  2%     -25.9%       0.31 =C2=B1  3%  fxmark.ssd_ext4_n=
o_jnl_DWSL_18_directio.softirq_util
>      14.37 =C2=B1  3%     +13.3%      16.28 =C2=B1  3%  fxmark.ssd_ext4_n=
o_jnl_DWSL_18_directio.sys_sec
>       1.60 =C2=B1  3%     +13.3%       1.82 =C2=B1  3%  fxmark.ssd_ext4_n=
o_jnl_DWSL_18_directio.sys_util
>      38.48 =C2=B1  3%     -99.9%       0.03        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.idle_sec
>      38.91 =C2=B1  3%     -99.9%       0.03        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.idle_util
>      52.62 =C2=B1  3%     +72.8%      90.95        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.iowait_sec
>      53.20 =C2=B1  3%     +73.1%      92.10        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.iowait_util
>       0.99 =C2=B1  5%     -11.2%       0.88        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.softirq_sec
>       1.00 =C2=B1  5%     -11.1%       0.89        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.softirq_util
>     905.52 =C2=B1  9%     -99.9%       0.97        fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.idle_sec
>      51.01 =C2=B1  9%     -99.9%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.idle_util
>     813.98 =C2=B1 10%    +110.4%       1712        fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.iowait_sec
>      45.85 =C2=B1 10%    +110.4%      96.49        fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.iowait_util
>       8.51           -45.7%       4.62 =C2=B1  4%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.softirq_sec
>       0.48           -45.7%       0.26 =C2=B1  4%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.softirq_util
>      28.76 =C2=B1  3%     +31.4%      37.78 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_36_directio.sys_sec
>       1.62 =C2=B1  3%     +31.4%       2.13 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_36_directio.sys_util
>       0.69 =C2=B1  3%      -8.5%       0.63 =C2=B1  2%  fxmark.ssd_ext4_n=
o_jnl_DWSL_36_directio.user_sec
>       0.04 =C2=B1  3%      -8.5%       0.04 =C2=B1  2%  fxmark.ssd_ext4_n=
o_jnl_DWSL_36_directio.user_util
>     976495           -21.8%     763592 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.works
>      19529           -21.8%      15271 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.works/sec
>     113.38 =C2=B1  2%     -99.9%       0.08        fxmark.ssd_ext4_no_jnl=
_DWSL_4_directio.idle_sec
>      57.19 =C2=B1  2%     -99.9%       0.04        fxmark.ssd_ext4_no_jnl=
_DWSL_4_directio.idle_util
>      74.95 =C2=B1  4%    +151.5%     188.51        fxmark.ssd_ext4_no_jnl=
_DWSL_4_directio.iowait_sec
>      37.81 =C2=B1  4%    +151.9%      95.25        fxmark.ssd_ext4_no_jnl=
_DWSL_4_directio.iowait_util
>       1.36 =C2=B1  2%     -20.8%       1.08 =C2=B1  2%  fxmark.ssd_ext4_n=
o_jnl_DWSL_4_directio.softirq_sec
>       0.69 =C2=B1  2%     -20.7%       0.54 =C2=B1  2%  fxmark.ssd_ext4_n=
o_jnl_DWSL_4_directio.softirq_util
>     534.20 =C2=B1 15%     -99.7%       1.45        fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.idle_sec
>      20.04 =C2=B1 15%     -99.7%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.idle_util
>       2050 =C2=B1  3%     +26.7%       2597        fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.iowait_sec
>      76.91 =C2=B1  4%     +26.0%      96.91        fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.iowait_util
>      24.84 =C2=B1  4%     +11.1%      27.60 =C2=B1  5%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_directio.irq_sec
>       0.93 =C2=B1  4%     +10.5%       1.03 =C2=B1  5%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_directio.irq_util
>       9.07 =C2=B1  8%     -28.6%       6.48 =C2=B1 12%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_directio.softirq_sec
>       0.34 =C2=B1  8%     -28.9%       0.24 =C2=B1 12%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_directio.softirq_util
>     809001 =C2=B1  2%     -31.1%     557801 =C2=B1  3%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_directio.works
>      16179 =C2=B1  2%     -31.1%      11155 =C2=B1  3%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_directio.works/sec
>     534.97 =C2=B1 16%     -99.6%       1.91 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_72_directio.idle_sec
>      14.99 =C2=B1 16%     -99.6%       0.05 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_72_directio.idle_util
>       2944 =C2=B1  2%     +18.4%       3486        fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.iowait_sec
>      82.54 =C2=B1  2%     +18.1%      97.47        fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.iowait_util
>       9.68 =C2=B1  3%     -27.3%       7.03 =C2=B1  6%  fxmark.ssd_ext4_n=
o_jnl_DWSL_72_directio.softirq_sec
>       0.27 =C2=B1  3%     -27.5%       0.20 =C2=B1  6%  fxmark.ssd_ext4_n=
o_jnl_DWSL_72_directio.softirq_util
>     815881           -30.5%     566879 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.works
>      16315           -30.5%      11336 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.works/sec
>       2442 =C2=B1 10%     +19.4%       2916 =C2=B1  4%  numa-meminfo.node=
0.PageTables
>     610.17 =C2=B1 10%     +19.4%     728.50 =C2=B1  4%  numa-vmstat.node0=
.nr_page_table_pages
>   53255038           -10.0%   47912382        proc-vmstat.pgpgout
>       1000 =C2=B1  6%     -20.1%     799.33 =C2=B1  7%  uptime.idle
>      46.74 =C2=B1  4%     -47.0%      24.79 =C2=B1  3%  iostat.cpu.idle
>      47.75 =C2=B1  4%     +45.7%      69.59        iostat.cpu.iowait
>     102703           -17.4%      84800        perf-stat.i.context-switches
>     102477           -17.4%      84607        perf-stat.ps.context-switch=
es
>      98808            -9.5%      89397        vmstat.io.bo
>     102730           -17.4%      84839        vmstat.system.cs
>      48.46 =C2=B1  4%     -22.5       25.94 =C2=B1  3%  mpstat.cpu.all.id=
le%
>      47.22 =C2=B1  4%     +22.4       69.66        mpstat.cpu.all.iowait%
>       0.40 =C2=B1  5%      -0.1        0.33 =C2=B1  3%  mpstat.cpu.all.so=
ft%
>       3.72 =C2=B1 20%      +0.8        4.56 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       3.72 =C2=B1 20%      +0.8        4.56 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       0.05 =C2=B1141%      +0.1        0.16 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.evlist__parse_sample
>       3.72 =C2=B1 20%      +0.8        4.56 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.kthread
>       3.73 =C2=B1 20%      +0.8        4.56 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       1888 =C2=B1 22%     -34.5%       1238 =C2=B1 20%  sched_debug.cfs_r=
q:/.load_avg.max
>       0.23 =C2=B1 14%     +32.0%       0.30 =C2=B1 18%  sched_debug.cfs_r=
q:/.nr_running.stddev
>       2994 =C2=B1  3%     -33.1%       2002 =C2=B1  4%  sched_debug.cpu.c=
lock_task.stddev
>       0.24 =C2=B1 18%     +55.7%       0.38 =C2=B1 17%  sched_debug.cpu.n=
r_running.stddev
>    3953878 =C2=B1  7%     -29.5%    2787443 =C2=B1  2%  sched_debug.cpu.n=
r_switches.max
>     582888 =C2=B1  4%     -29.8%     408937 =C2=B1  5%  sched_debug.cpu.n=
r_switches.stddev
> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10G=
Hz (Cascade Lake) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs2/fs/kconfig/nr_threads/rootfs/tbox_grou=
p/testcase/ucode:
>   gcc-11/performance/1HDD/cifs/btrfs/x86_64-rhel-8.3/100%/debian-11.1-x86=
_64-20220510.cgz/lkp-csl-2sp7/dbench/0x5003302
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      62.83 =C2=B1  6%     -18.4%      51.29 =C2=B1 13%  dbench.max_latency
>     111.44           +26.4%     140.89        dbench.throughput-MB/sec
>      75417            +3.3%      77917        dbench.time.minor_page_faul=
ts
>     123.67           +22.4%     151.33        dbench.time.percent_of_cpu_=
this_job_got
>      43.39           +20.5%      52.27        dbench.time.system_time
>      49.15           +24.1%      61.02        dbench.time.user_time
>    2385212           +25.7%    2998488        dbench.time.voluntary_conte=
xt_switches
>     586521 =C2=B1  2%      +6.9%     626798 =C2=B1  4%  meminfo.DirectMap=
4k
>     130481 =C2=B1  7%      +9.7%     143102 =C2=B1  4%  numa-numastat.nod=
e1.local_node
>      32.11            -1.5%      31.63        boot-time.boot
>       2596            -1.8%       2549        boot-time.idle
>       8.04            -2.4%       7.85        iostat.cpu.system
>       1.97           +23.0%       2.43        iostat.cpu.user
>       0.43            +0.0        0.48        mpstat.cpu.all.soft%
>       2.00            +0.5        2.47        mpstat.cpu.all.usr%
>      17.00         +3035.3%     533.00 =C2=B1 39%  vmstat.memory.buff
>     719723           +10.8%     797535        vmstat.system.cs
>     189780            +0.9%     191473        vmstat.system.in
>       1377            +9.3%       1506 =C2=B1  3%  proc-vmstat.nr_inactiv=
e_file
>       1377            +9.3%       1506 =C2=B1  3%  proc-vmstat.nr_zone_in=
active_file
>      94820 =C2=B1  5%      -8.8%      86519 =C2=B1  4%  proc-vmstat.numa_=
pte_updates
>      13569            +3.8%      14082 =C2=B1  4%  proc-vmstat.pgreuse
>    2826621 =C2=B1  2%    +116.4%    6117054 =C2=B1 48%  turbostat.C1
>       3.48 =C2=B1  6%      +3.6        7.11 =C2=B1 38%  turbostat.C1%
>     116454           +29.2%     150467 =C2=B1 17%  turbostat.POLL
>       0.03            +0.0        0.05 =C2=B1 20%  turbostat.POLL%
>     174.73            +1.5%     177.35        turbostat.PkgWatt
>      46783 =C2=B1 22%     +37.4%      64284 =C2=B1 14%  numa-vmstat.node0=
.nr_anon_pages
>      47030 =C2=B1 22%     +37.1%      64490 =C2=B1 14%  numa-vmstat.node0=
.nr_inactive_anon
>       5561 =C2=B1 22%     -50.2%       2771 =C2=B1 47%  numa-vmstat.node0=
.nr_page_table_pages
>      42047 =C2=B1  7%     -23.7%      32086 =C2=B1 20%  numa-vmstat.node0=
.nr_slab_unreclaimable
>      47030 =C2=B1 22%     +37.1%      64490 =C2=B1 14%  numa-vmstat.node0=
.nr_zone_inactive_anon
>      51858 =C2=B1 20%     -33.9%      34272 =C2=B1 26%  numa-vmstat.node1=
.nr_anon_pages
>      15234 =C2=B1 68%    +202.8%      46137 =C2=B1 30%  numa-vmstat.node1=
.nr_file_pages
>      52048 =C2=B1 20%     -33.7%      34527 =C2=B1 25%  numa-vmstat.node1=
.nr_inactive_anon
>      24745 =C2=B1 14%     +38.7%      34326 =C2=B1 19%  numa-vmstat.node1=
.nr_slab_unreclaimable
>      12919 =C2=B1 82%    +236.9%      43523 =C2=B1 34%  numa-vmstat.node1=
.nr_unevictable
>      52047 =C2=B1 20%     -33.7%      34527 =C2=B1 25%  numa-vmstat.node1=
.nr_zone_inactive_anon
>      12919 =C2=B1 82%    +236.9%      43523 =C2=B1 34%  numa-vmstat.node1=
.nr_zone_unevictable
>     130660 =C2=B1  6%      +9.6%     143248 =C2=B1  4%  numa-vmstat.node1=
.numa_local
>     420.46 =C2=B1 27%    -100.0%       0.00        sched_debug.cfs_rq:/.M=
IN_vruntime.avg
>      29114 =C2=B1 17%    -100.0%       0.00        sched_debug.cfs_rq:/.M=
IN_vruntime.max
>       3399 =C2=B1 18%    -100.0%       0.00        sched_debug.cfs_rq:/.M=
IN_vruntime.stddev
>     148.77 =C2=B1119%    +188.9%     429.85 =C2=B1  7%  sched_debug.cfs_r=
q:/.load_avg.avg
>      12755 =C2=B1133%    +206.9%      39149 =C2=B1  7%  sched_debug.cfs_r=
q:/.load_avg.max
>       1312 =C2=B1131%    +203.2%       3980 =C2=B1  7%  sched_debug.cfs_r=
q:/.load_avg.stddev
>     420.46 =C2=B1 27%    -100.0%       0.00        sched_debug.cfs_rq:/.m=
ax_vruntime.avg
>      29114 =C2=B1 17%    -100.0%       0.00        sched_debug.cfs_rq:/.m=
ax_vruntime.max
>       3399 =C2=B1 18%    -100.0%       0.00        sched_debug.cfs_rq:/.m=
ax_vruntime.stddev
>       9.17 =C2=B1  6%     +41.8%      13.00 =C2=B1  3%  sched_debug.cfs_r=
q:/.runnable_avg.min
>       9.17 =C2=B1  6%     +41.8%      13.00 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_avg.min
>     247091 =C2=B1  2%     -11.7%     218071 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.avg
>      98.03 =C2=B1  7%     -26.4%      72.14 =C2=B1 10%  sched_debug.cpu.c=
lock_task.stddev
>     295909           +10.4%     326563        sched_debug.cpu.nr_switches=
.avg
>     270860           +11.7%     302548        sched_debug.cpu.nr_switches=
.min
>      26583 =C2=B1 30%    +186.4%      76146 =C2=B1 34%  numa-meminfo.node=
0.AnonHugePages
>     187136 =C2=B1 22%     +37.4%     257152 =C2=B1 14%  numa-meminfo.node=
0.AnonPages
>     205372 =C2=B1 14%     +30.8%     268528 =C2=B1 14%  numa-meminfo.node=
0.AnonPages.max
>     189843 =C2=B1 22%     +37.2%     260541 =C2=B1 14%  numa-meminfo.node=
0.Inactive
>     188124 =C2=B1 22%     +37.1%     257975 =C2=B1 14%  numa-meminfo.node=
0.Inactive(anon)
>      22246 =C2=B1 22%     -50.2%      11086 =C2=B1 47%  numa-meminfo.node=
0.PageTables
>     168190 =C2=B1  7%     -23.7%     128348 =C2=B1 20%  numa-meminfo.node=
0.SUnreclaim
>     258045 =C2=B1  4%     -15.4%     218420 =C2=B1 12%  numa-meminfo.node=
0.Slab
>      86186 =C2=B1 11%     -66.6%      28822 =C2=B1 95%  numa-meminfo.node=
1.AnonHugePages
>     207443 =C2=B1 20%     -33.9%     137104 =C2=B1 26%  numa-meminfo.node=
1.AnonPages
>      60941 =C2=B1 68%    +202.8%     184551 =C2=B1 30%  numa-meminfo.node=
1.FilePages
>     211994 =C2=B1 20%     -33.2%     141591 =C2=B1 25%  numa-meminfo.node=
1.Inactive
>     208201 =C2=B1 20%     -33.7%     138130 =C2=B1 25%  numa-meminfo.node=
1.Inactive(anon)
>    1074326           +16.4%    1250224 =C2=B1 11%  numa-meminfo.node1.Mem=
Used
>      98981 =C2=B1 14%     +38.7%     137324 =C2=B1 19%  numa-meminfo.node=
1.SUnreclaim
>     126928 =C2=B1  8%     +30.0%     164963 =C2=B1 17%  numa-meminfo.node=
1.Slab
>      51677 =C2=B1 82%    +236.9%     174093 =C2=B1 34%  numa-meminfo.node=
1.Unevictable
>      13.52 =C2=B1 86%     -13.5        0.00        perf-profile.calltrace=
.cycles-pp.asm_exc_page_fault.fault_in_readable.fault_in_iov_iter_readable.=
generic_perform_write.__generic_file_write_iter
>       9.02 =C2=B1 86%      -7.4        1.59 =C2=B1141%  perf-profile.call=
trace.cycles-pp.fault_in_iov_iter_readable.generic_perform_write.__generic_=
file_write_iter.generic_file_write_iter.new_sync_write
>      19.09 =C2=B1 13%      -4.0       15.10 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.cmd_record.run_builtin.main.__libc_start_main
>      19.09 =C2=B1 13%      -4.0       15.10 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__cmd_record.cmd_record.run_builtin.main.__libc_start_main
>      19.09 =C2=B1 13%      -4.0       15.10 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.record__mmap_read_evlist.__cmd_record.cmd_record.run_builti=
n.main
>      19.09 =C2=B1 13%      -4.0       15.10 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.perf_mmap__push.record__mmap_read_evlist.__cmd_record.cmd_r=
ecord.run_builtin
>       2.92 =C2=B1 71%      +3.0        5.92 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.link_path_walk.path_openat.do_filp_open.do_sys_openat2.__x6=
4_sys_openat
>       1.33 =C2=B1141%      +3.3        4.59 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.walk_component.link_path_walk.path_openat.do_filp_open.do_s=
ys_openat2
>       1.33 =C2=B1141%      +4.6        5.92 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
>       1.33 =C2=B1141%      +4.6        5.92 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL=
_64_after_hwframe
>       1.33 =C2=B1141%      +4.8        6.17 =C2=B1 38%  perf-profile.call=
trace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_=
user_mode_loop.exit_to_user_mode_prepare
>       1.33 =C2=B1141%      +4.8        6.17 =C2=B1 38%  perf-profile.call=
trace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.=
exit_to_user_mode_loop
>       1.33 =C2=B1141%      +4.8        6.17 =C2=B1 38%  perf-profile.call=
trace.cycles-pp.exit_mm.do_exit.do_group_exit.get_signal.arch_do_signal_or_=
restart
>       1.33 =C2=B1141%      +4.8        6.17 =C2=B1 38%  perf-profile.call=
trace.cycles-pp.mmput.exit_mm.do_exit.do_group_exit.get_signal
>       7.44 =C2=B1 43%      +6.3       13.76 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>       7.44 =C2=B1 43%      +6.3       13.76 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       9.02 =C2=B1 86%      -7.4        1.59 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.fault_in_iov_iter_readable
>       9.02 =C2=B1 86%      -7.4        1.59 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.fault_in_readable
>      19.09 =C2=B1 13%      -4.0       15.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.record__mmap_read_evlist
>      19.09 =C2=B1 13%      -4.0       15.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.perf_mmap__push
>       0.00            +4.6        4.59 =C2=B1  9%  perf-profile.children.=
cycles-pp.native_irq_return_iret
>       1.33 =C2=B1141%      +4.8        6.17 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       1.33 =C2=B1141%      +4.8        6.17 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_loop
>       1.33 =C2=B1141%      +4.8        6.17 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.arch_do_signal_or_restart
>       1.33 =C2=B1141%      +4.8        6.17 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.get_signal
>       4.25 =C2=B1 77%      +4.9        9.17 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.do_group_exit
>       4.25 =C2=B1 77%      +4.9        9.17 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.do_exit
>       0.00            +4.6        4.59 =C2=B1  9%  perf-profile.self.cycl=
es-pp.native_irq_return_iret
>      31.65            -3.1%      30.68        perf-stat.i.MPKI
>  2.403e+09           +16.3%  2.794e+09        perf-stat.i.branch-instruct=
ions
>       2.35            +0.1        2.40        perf-stat.i.branch-miss-rat=
e%
>   56919078           +18.7%   67574960        perf-stat.i.branch-misses
>   27305909           +12.3%   30674053        perf-stat.i.cache-misses
>   3.48e+08           +13.2%  3.941e+08        perf-stat.i.cache-references
>     756056           +10.8%     837765        perf-stat.i.context-switches
>       2.80           -10.3%       2.51        perf-stat.i.cpi
>  3.081e+10            +4.8%  3.227e+10        perf-stat.i.cpu-cycles
>      18146           +18.3%      21472        perf-stat.i.cpu-migrations
>       1130            -6.8%       1054        perf-stat.i.cycles-between-=
cache-misses
>    7127116 =C2=B1  4%     +22.4%    8726172 =C2=B1  2%  perf-stat.i.dTLB-=
load-misses
>  3.163e+09           +17.7%  3.722e+09        perf-stat.i.dTLB-loads
>     604134 =C2=B1  3%     +26.3%     763104 =C2=B1  4%  perf-stat.i.dTLB-=
store-misses
>  1.714e+09           +19.8%  2.053e+09        perf-stat.i.dTLB-stores
>   11022411           +22.8%   13533329 =C2=B1  2%  perf-stat.i.iTLB-load-=
misses
>   18687513           +21.7%   22751146        perf-stat.i.iTLB-loads
>  1.109e+10           +16.6%  1.293e+10        perf-stat.i.instructions
>       1005            -5.0%     955.08 =C2=B1  2%  perf-stat.i.instructio=
ns-per-iTLB-miss
>       0.36           +11.3%       0.40        perf-stat.i.ipc
>       0.32            +4.8%       0.34        perf-stat.i.metric.GHz
>     411.24           +16.9%     480.60        perf-stat.i.metric.K/sec
>      79.44           +17.5%      93.36        perf-stat.i.metric.M/sec
>   12788719           +11.4%   14245100        perf-stat.i.node-load-misses
>     736538            +9.3%     804896        perf-stat.i.node-loads
>    5717164           +14.0%    6518161        perf-stat.i.node-store-miss=
es
>     195177 =C2=B1  3%     +15.4%     225246        perf-stat.i.node-stores
>      31.40            -2.9%      30.49        perf-stat.overall.MPKI
>       2.37            +0.0        2.42        perf-stat.overall.branch-mi=
ss-rate%
>       2.78           -10.1%       2.50        perf-stat.overall.cpi
>       1128            -6.8%       1052        perf-stat.overall.cycles-be=
tween-cache-misses
>       1006            -5.0%     955.66 =C2=B1  2%  perf-stat.overall.inst=
ructions-per-iTLB-miss
>       0.36           +11.3%       0.40        perf-stat.overall.ipc
>  2.366e+09           +16.3%  2.751e+09        perf-stat.ps.branch-instruc=
tions
>   56052271           +18.7%   66533441        perf-stat.ps.branch-misses
>   26890611           +12.3%   30201835        perf-stat.ps.cache-misses
>  3.428e+08           +13.2%   3.88e+08        perf-stat.ps.cache-referenc=
es
>     744569           +10.8%     824885        perf-stat.ps.context-switch=
es
>  3.034e+10            +4.7%  3.178e+10        perf-stat.ps.cpu-cycles
>      17870           +18.3%      21141        perf-stat.ps.cpu-migrations
>    7018799 =C2=B1  4%     +22.4%    8591939 =C2=B1  2%  perf-stat.ps.dTLB=
-load-misses
>  3.115e+09           +17.7%  3.665e+09        perf-stat.ps.dTLB-loads
>     594948 =C2=B1  3%     +26.3%     751357 =C2=B1  4%  perf-stat.ps.dTLB=
-store-misses
>  1.688e+09           +19.8%  2.022e+09        perf-stat.ps.dTLB-stores
>   10854890           +22.8%   13325157 =C2=B1  2%  perf-stat.ps.iTLB-load=
-misses
>   18403565           +21.7%   22401442        perf-stat.ps.iTLB-loads
>  1.092e+10           +16.6%  1.273e+10        perf-stat.ps.instructions
>   12594362           +11.4%   14025995        perf-stat.ps.node-load-miss=
es
>     725306            +9.3%     792469        perf-stat.ps.node-loads
>    5630275           +14.0%    6417913        perf-stat.ps.node-store-mis=
ses
>     192188 =C2=B1  3%     +15.4%     221744        perf-stat.ps.node-stor=
es
>  7.234e+11           +16.6%  8.435e+11        perf-stat.total.instructions
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10G=
Hz (Cascade Lake) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs2/fs/kconfig/nr_threads/rootfs/tbox_grou=
p/testcase/ucode:
>   gcc-11/performance/1HDD/cifs/xfs/x86_64-rhel-8.3/100%/debian-11.1-x86_6=
4-20220510.cgz/lkp-csl-2sp7/dbench/0x5003302
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      63.10 =C2=B1 15%     -23.9%      48.01 =C2=B1 13%  dbench.max_latency
>     111.06 =C2=B1  2%     +26.9%     140.94        dbench.throughput-MB/s=
ec
>      75837            +3.4%      78437        dbench.time.minor_page_faul=
ts
>     122.33 =C2=B1  2%     +23.4%     151.00        dbench.time.percent_of=
_cpu_this_job_got
>      43.15 =C2=B1  2%     +21.1%      52.26        dbench.time.system_time
>      48.48 =C2=B1  2%     +25.4%      60.78        dbench.time.user_time
>    2375168 =C2=B1  2%     +26.2%    2997148        dbench.time.voluntary_=
context_switches
>     715154           +11.2%     795044        vmstat.system.cs
>       8.00            -2.9%       7.76        iostat.cpu.system
>       1.93           +24.6%       2.41        iostat.cpu.user
>     124837           -16.3%     104535 =C2=B1  3%  meminfo.AnonHugePages
>     667758           -14.7%     569454 =C2=B1  9%  meminfo.DirectMap4k
>       0.43            +0.0        0.47        mpstat.cpu.all.soft%
>       1.97            +0.5        2.45        mpstat.cpu.all.usr%
>      49817 =C2=B1 26%     -27.6%      36045 =C2=B1  9%  numa-vmstat.node0=
.nr_anon_pages
>      50026 =C2=B1 26%     -27.5%      36284 =C2=B1  9%  numa-vmstat.node0=
.nr_inactive_anon
>      50026 =C2=B1 26%     -27.5%      36284 =C2=B1  9%  numa-vmstat.node0=
.nr_zone_inactive_anon
>      48365 =C2=B1 27%     +28.8%      62275 =C2=B1  5%  numa-vmstat.node1=
.nr_anon_pages
>      48577 =C2=B1 26%     +29.6%      62979 =C2=B1  5%  numa-vmstat.node1=
.nr_inactive_anon
>      48577 =C2=B1 26%     +29.6%      62979 =C2=B1  5%  numa-vmstat.node1=
.nr_zone_inactive_anon
>       3183            -1.2%       3147        proc-vmstat.nr_active_anon
>       3061            -3.8%       2944 =C2=B1  2%  proc-vmstat.nr_inactiv=
e_file
>       3183            -1.2%       3147        proc-vmstat.nr_zone_active_=
anon
>       3061            -3.8%       2944 =C2=B1  2%  proc-vmstat.nr_zone_in=
active_file
>      42597 =C2=B1  5%     -12.8%      37158 =C2=B1  5%  proc-vmstat.numa_=
hint_faults_local
>     376545            -1.8%     369636        proc-vmstat.pgfault
>      29890 =C2=B1  2%     -16.6%      24936 =C2=B1  4%  sched_debug.cfs_r=
q:/.min_vruntime.min
>      20.24 =C2=B1 75%     +94.0%      39.26 =C2=B1 27%  sched_debug.cfs_r=
q:/.removed.runnable_avg.stddev
>      20.24 =C2=B1 75%     +94.0%      39.26 =C2=B1 27%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>     246896 =C2=B1  2%     -10.1%     222044 =C2=B1  2%  sched_debug.cpu.a=
vg_idle.avg
>     296549           +10.7%     328167        sched_debug.cpu.nr_switches=
.avg
>     271532           +12.8%     306227        sched_debug.cpu.nr_switches=
.min
>    2787312 =C2=B1  4%     +46.5%    4082961        turbostat.C1
>       3.31 =C2=B1  4%      +1.9        5.22        turbostat.C1%
>     113.08 =C2=B1 56%     -80.8%      21.75 =C2=B1140%  turbostat.IPC
>     113986           +12.0%     127694        turbostat.POLL
>       0.03            +0.0        0.04        turbostat.POLL%
>     172.57            +1.9%     175.87        turbostat.PkgWatt
>      69733 =C2=B1 55%     -76.9%      16110 =C2=B1 66%  numa-meminfo.node=
0.AnonHugePages
>     199271 =C2=B1 26%     -27.6%     144199 =C2=B1  9%  numa-meminfo.node=
0.AnonPages
>     207388 =C2=B1 26%     -28.2%     148801 =C2=B1  9%  numa-meminfo.node=
0.Inactive
>     200110 =C2=B1 26%     -27.5%     145150 =C2=B1  9%  numa-meminfo.node=
0.Inactive(anon)
>     193450 =C2=B1 27%     +28.8%     249121 =C2=B1  5%  numa-meminfo.node=
1.AnonPages
>     199267 =C2=B1 27%     +30.5%     260065 =C2=B1  5%  numa-meminfo.node=
1.Inactive
>     194300 =C2=B1 26%     +29.7%     251936 =C2=B1  5%  numa-meminfo.node=
1.Inactive(anon)
>      26.40 =C2=B1 51%     -16.1       10.34 =C2=B1 43%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>      26.40 =C2=B1 51%     -16.1       10.34 =C2=B1 43%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       4.80 =C2=B1 75%      -1.1        3.70 =C2=B1141%  perf-profile.call=
trace.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_=
user_mode_loop.exit_to_user_mode_prepare
>       4.80 =C2=B1 75%      -1.1        3.70 =C2=B1141%  perf-profile.call=
trace.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.=
exit_to_user_mode_loop
>       4.80 =C2=B1 75%      -1.1        3.70 =C2=B1141%  perf-profile.call=
trace.cycles-pp.exit_mm.do_exit.do_group_exit.get_signal.arch_do_signal_or_=
restart
>       4.80 =C2=B1 75%      -1.1        3.70 =C2=B1141%  perf-profile.call=
trace.cycles-pp.mmput.exit_mm.do_exit.do_group_exit.get_signal
>       4.80 =C2=B1 75%      -1.1        3.70 =C2=B1141%  perf-profile.call=
trace.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_us=
er_mode_prepare.syscall_exit_to_user_mode.do_syscall_64
>       4.80 =C2=B1 75%      -1.1        3.70 =C2=B1141%  perf-profile.call=
trace.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop=
.exit_to_user_mode_prepare.syscall_exit_to_user_mode
>       4.80 =C2=B1 75%      -1.1        3.70 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.arch_do_signal_or_restart
>       4.80 =C2=B1 75%      -1.1        3.70 =C2=B1141%  perf-profile.chil=
dren.cycles-pp.get_signal
>      32.38 =C2=B1  3%      -6.9%      30.16        perf-stat.i.MPKI
>  2.354e+09           +16.9%  2.752e+09        perf-stat.i.branch-instruct=
ions
>   55981537           +18.4%   66277894        perf-stat.i.branch-misses
>   26548132           +13.8%   30208183        perf-stat.i.cache-misses
>  3.397e+08 =C2=B1  2%     +13.0%   3.84e+08        perf-stat.i.cache-refe=
rences
>     747251           +11.7%     834512        perf-stat.i.context-switches
>       2.89 =C2=B1  3%     -12.4%       2.53        perf-stat.i.cpi
>  3.041e+10            +4.9%  3.191e+10        perf-stat.i.cpu-cycles
>      17835           +19.2%      21257        perf-stat.i.cpu-migrations
>    7381868 =C2=B1  2%     +17.9%    8706116        perf-stat.i.dTLB-load-=
misses
>  3.104e+09           +17.9%   3.66e+09        perf-stat.i.dTLB-loads
>     594238 =C2=B1  3%     +29.4%     768723 =C2=B1  2%  perf-stat.i.dTLB-=
store-misses
>  1.677e+09           +20.4%  2.019e+09        perf-stat.i.dTLB-stores
>   10899738 =C2=B1  2%     +21.8%   13279799 =C2=B1  2%  perf-stat.i.iTLB-=
load-misses
>   18436834           +23.1%   22689136        perf-stat.i.iTLB-loads
>  1.086e+10           +17.1%  1.272e+10        perf-stat.i.instructions
>       0.35           +12.3%       0.40        perf-stat.i.ipc
>       0.32            +4.9%       0.33        perf-stat.i.metric.GHz
>     415.46 =C2=B1  2%     +14.9%     477.41        perf-stat.i.metric.K/s=
ec
>      77.83           +17.9%      91.80        perf-stat.i.metric.M/sec
>   12520989           +12.3%   14065063        perf-stat.i.node-load-misses
>     707760            +9.8%     777020        perf-stat.i.node-loads
>    5586375           +15.2%    6434399        perf-stat.i.node-store-miss=
es
>     183563 =C2=B1  2%     +18.8%     218064        perf-stat.i.node-stores
>      31.28            -3.5%      30.19        perf-stat.overall.MPKI
>       2.38            +0.0        2.41        perf-stat.overall.branch-mi=
ss-rate%
>       2.80           -10.4%       2.51        perf-stat.overall.cpi
>       1145            -7.8%       1056        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.04 =C2=B1  5%      +0.0        0.04        perf-stat.overall.dTLB=
-store-miss-rate%
>       0.36           +11.6%       0.40        perf-stat.overall.ipc
>  2.318e+09           +16.9%   2.71e+09        perf-stat.ps.branch-instruc=
tions
>   55127572           +18.4%   65275600        perf-stat.ps.branch-misses
>   26143074           +13.8%   29751789        perf-stat.ps.cache-misses
>  3.346e+08 =C2=B1  2%     +13.1%  3.782e+08        perf-stat.ps.cache-ref=
erences
>     735845           +11.7%     821917        perf-stat.ps.context-switch=
es
>  2.995e+10            +4.9%  3.143e+10        perf-stat.ps.cpu-cycles
>      17563           +19.2%      20936        perf-stat.ps.cpu-migrations
>    7269522 =C2=B1  2%     +18.0%    8574683        perf-stat.ps.dTLB-load=
-misses
>  3.056e+09           +17.9%  3.604e+09        perf-stat.ps.dTLB-loads
>     585211 =C2=B1  3%     +29.4%     757112 =C2=B1  2%  perf-stat.ps.dTLB=
-store-misses
>  1.651e+09           +20.4%  1.988e+09        perf-stat.ps.dTLB-stores
>   10733494 =C2=B1  2%     +21.9%   13079328 =C2=B1  2%  perf-stat.ps.iTLB=
-load-misses
>   18155479           +23.1%   22346769        perf-stat.ps.iTLB-loads
>   1.07e+10           +17.2%  1.253e+10        perf-stat.ps.instructions
>   12329841           +12.4%   13852691        perf-stat.ps.node-load-miss=
es
>     696933            +9.8%     765242        perf-stat.ps.node-loads
>    5501083           +15.2%    6337250        perf-stat.ps.node-store-mis=
ses
>     180740 =C2=B1  2%     +18.8%     214739        perf-stat.ps.node-stor=
es
>  7.196e+11           +16.6%  8.388e+11        perf-stat.total.instructions
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2ap4: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU @ =
2.30GHz (Cascade Lake) with 192G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-11/performance/ipv4/x86_64-rhel-8.3/200%/debian-11.1-x=
86_64-20220510.cgz/300s/lkp-csl-2ap4/UDP_RR/netperf/0x5003302
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    7021385 =C2=B1 18%     +37.2%    9634933 =C2=B1  4%  netperf.Throughpu=
t_total_tps
>      18284 =C2=B1 18%     +37.2%      25090 =C2=B1  4%  netperf.Throughpu=
t_tps
>  9.882e+08 =C2=B1 37%     +71.4%  1.694e+09 =C2=B1 13%  netperf.time.invo=
luntary_context_switches
>     112479 =C2=B1  2%      -4.6%     107288        netperf.time.minor_pag=
e_faults
>       5071 =C2=B1 14%     +57.5%       7987 =C2=B1  3%  netperf.time.perc=
ent_of_cpu_this_job_got
>      14683 =C2=B1 14%     +59.1%      23364 =C2=B1  3%  netperf.time.syst=
em_time
>     807.37 =C2=B1 17%     +27.5%       1029 =C2=B1  3%  netperf.time.user=
_time
>  2.106e+09 =C2=B1 18%     +37.2%  2.891e+09 =C2=B1  4%  netperf.workload
>      13003 =C2=B1  6%     -40.0%       7798 =C2=B1  4%  uptime.idle
>  7.022e+09 =C2=B1 11%     -72.5%  1.931e+09 =C2=B1  5%  cpuidle..time
>  4.609e+08 =C2=B1  9%     -82.8%   79092189 =C2=B1 21%  cpuidle..usage
>      76481 =C2=B1 19%     -48.7%      39247 =C2=B1 66%  numa-numastat.nod=
e0.other_node
>      39254 =C2=B1 53%    +121.2%      86825        numa-numastat.node2.ot=
her_node
>    5682376           -68.9%    1765663 =C2=B1  8%  numa-numastat.node3.lo=
cal_node
>    5758946 =C2=B1  2%     -68.2%    1829720 =C2=B1  9%  numa-numastat.nod=
e3.numa_hit
>      12.33 =C2=B1 10%     -73.0%       3.33 =C2=B1 14%  vmstat.cpu.id
>   11319933 =C2=B1  2%     -51.2%    5521164 =C2=B1  5%  vmstat.memory.cac=
he
>   14987055 =C2=B1 16%     +26.5%   18953834 =C2=B1  4%  vmstat.system.cs
>     429645           +16.6%     501122 =C2=B1  5%  vmstat.system.in
>      12.06 =C2=B1 11%      -8.8        3.28 =C2=B1  5%  mpstat.cpu.all.id=
le%
>       1.05 =C2=B1  7%      +0.1        1.20 =C2=B1  5%  mpstat.cpu.all.ir=
q%
>      31.98 =C2=B1 11%     -17.7       14.26 =C2=B1  5%  mpstat.cpu.all.so=
ft%
>      52.00 =C2=B1  8%     +25.8       77.78        mpstat.cpu.all.sys%
>       2.90 =C2=B1 14%      +0.6        3.49 =C2=B1  4%  mpstat.cpu.all.us=
r%
>   4.53e+08 =C2=B1  8%     -85.2%   67095739 =C2=B1 22%  turbostat.C1
>       9.38 =C2=B1 14%      -8.6        0.80 =C2=B1 21%  turbostat.C1%
>    3753651 =C2=B1 21%     -32.0%    2553339 =C2=B1  6%  turbostat.C1E
>      10.86 =C2=B1 10%     -72.7%       2.96 =C2=B1  4%  turbostat.CPU%c1
>  1.329e+08           +16.7%   1.55e+08 =C2=B1  5%  turbostat.IRQ
>    3710265 =C2=B1 31%    +147.2%    9170114 =C2=B1 23%  turbostat.POLL
>     302.33 =C2=B1  5%      +6.2%     320.97        turbostat.PkgWatt
>     176232 =C2=B1  3%     -12.8%     153622 =C2=B1  3%  meminfo.Active
>     176232 =C2=B1  3%     -12.8%     153622 =C2=B1  3%  meminfo.Active(an=
on)
>   11124197 =C2=B1  2%     -51.9%    5345362 =C2=B1  5%  meminfo.Cached
>    9388853 =C2=B1  2%     -61.9%    3581036 =C2=B1  8%  meminfo.Committed=
_AS
>   14279338 =C2=B1  6%     -14.1%   12271616 =C2=B1 13%  meminfo.DirectMap=
2M
>    8798116 =C2=B1  2%     -65.8%    3011162 =C2=B1  9%  meminfo.Inactive
>    8798116 =C2=B1  2%     -65.8%    3011162 =C2=B1  9%  meminfo.Inactive(=
anon)
>    2403636 =C2=B1  3%     -65.4%     832046 =C2=B1 19%  meminfo.Mapped
>   14064689           -41.3%    8258247 =C2=B1  3%  meminfo.Memused
>      36964            -9.9%      33304 =C2=B1  4%  meminfo.PageTables
>    8470378 =C2=B1  3%     -68.2%    2691348 =C2=B1 11%  meminfo.Shmem
>   14198461           -41.0%    8376668 =C2=B1  3%  meminfo.max_used_kB
>      44041 =C2=B1  3%     -15.4%      37239 =C2=B1  2%  proc-vmstat.nr_ac=
tive_anon
>     126064            -6.0%     118473        proc-vmstat.nr_anon_pages
>    4566555            +3.2%    4711343        proc-vmstat.nr_dirty_backgr=
ound_threshold
>    9144277            +3.2%    9434207        proc-vmstat.nr_dirty_thresh=
old
>    2778790 =C2=B1  2%     -51.9%    1335656 =C2=B1  5%  proc-vmstat.nr_fi=
le_pages
>   45914898            +3.2%   47364901        proc-vmstat.nr_free_pages
>    2197273 =C2=B1  2%     -65.7%     753320 =C2=B1  9%  proc-vmstat.nr_in=
active_anon
>     599165 =C2=B1  3%     -65.2%     208671 =C2=B1 19%  proc-vmstat.nr_ma=
pped
>       9240            -9.9%       8326 =C2=B1  4%  proc-vmstat.nr_page_ta=
ble_pages
>    2115336 =C2=B1  3%     -68.2%     672153 =C2=B1 11%  proc-vmstat.nr_sh=
mem
>      40612            -8.1%      37329        proc-vmstat.nr_slab_reclaim=
able
>      44041 =C2=B1  3%     -15.4%      37239 =C2=B1  2%  proc-vmstat.nr_zo=
ne_active_anon
>    2197273 =C2=B1  2%     -65.7%     753320 =C2=B1  9%  proc-vmstat.nr_zo=
ne_inactive_anon
>     809212 =C2=B1  2%     -54.9%     364891 =C2=B1  5%  proc-vmstat.numa_=
hint_faults
>     593651 =C2=B1  3%     -63.8%     214797 =C2=B1 11%  proc-vmstat.numa_=
hint_faults_local
>    6569431 =C2=B1  2%     -55.7%    2908028 =C2=B1  6%  proc-vmstat.numa_=
hit
>    6315152 =C2=B1  2%     -58.1%    2647584 =C2=B1  7%  proc-vmstat.numa_=
local
>      35145 =C2=B1  5%     +52.3%      53533 =C2=B1 21%  proc-vmstat.numa_=
pages_migrated
>    1165313 =C2=B1  2%     -41.7%     679376 =C2=B1  4%  proc-vmstat.numa_=
pte_updates
>      61947 =C2=B1 13%     -12.1%      54435 =C2=B1  4%  proc-vmstat.pgact=
ivate
>    6569496 =C2=B1  2%     -55.5%    2924831 =C2=B1  6%  proc-vmstat.pgall=
oc_normal
>    2472333           -24.0%    1879829        proc-vmstat.pgfault
>      35145 =C2=B1  5%     +52.3%      53533 =C2=B1 21%  proc-vmstat.pgmig=
rate_success
>      52722            -3.4%      50905        proc-vmstat.pgreuse
>     340.67 =C2=B1 18%     +79.4%     611.00 =C2=B1 17%  numa-vmstat.node0=
.nr_active_anon
>      54694 =C2=B1 30%     -62.8%      20351 =C2=B1 15%  numa-vmstat.node0=
.nr_anon_pages
>      54881 =C2=B1 30%     -62.8%      20435 =C2=B1 15%  numa-vmstat.node0=
.nr_inactive_anon
>       2654 =C2=B1 31%     -29.9%       1860 =C2=B1  9%  numa-vmstat.node0=
.nr_page_table_pages
>     340.67 =C2=B1 18%     +79.4%     611.00 =C2=B1 17%  numa-vmstat.node0=
.nr_zone_active_anon
>      54881 =C2=B1 30%     -62.8%      20435 =C2=B1 15%  numa-vmstat.node0=
.nr_zone_inactive_anon
>      76481 =C2=B1 19%     -48.7%      39247 =C2=B1 66%  numa-vmstat.node0=
.numa_other
>      17403 =C2=B1 13%     +95.6%      34035 =C2=B1 27%  numa-vmstat.node1=
.nr_anon_pages
>     216282 =C2=B1132%    +131.8%     501296 =C2=B1 34%  numa-vmstat.node1=
.nr_file_pages
>      17399 =C2=B1 12%    +587.8%     119676 =C2=B1104%  numa-vmstat.node1=
.nr_inactive_anon
>       7358 =C2=B1 74%     +74.7%      12856 =C2=B1 42%  numa-vmstat.node1=
.nr_slab_reclaimable
>      17399 =C2=B1 12%    +587.8%     119676 =C2=B1104%  numa-vmstat.node1=
.nr_zone_inactive_anon
>      11503 =C2=B1  3%     -14.1%       9877 =C2=B1 11%  numa-vmstat.node2=
.nr_kernel_stack
>       3101 =C2=B1  9%     -37.4%       1941 =C2=B1 30%  numa-vmstat.node2=
.nr_page_table_pages
>       9276 =C2=B1 57%     -60.3%       3684 =C2=B1 30%  numa-vmstat.node2=
.nr_slab_reclaimable
>      25491 =C2=B1  5%     -14.1%      21898 =C2=B1  3%  numa-vmstat.node2=
.nr_slab_unreclaimable
>      39253 =C2=B1 53%    +121.2%      86825        numa-vmstat.node2.numa=
_other
>      43020 =C2=B1  2%     -15.2%      36478 =C2=B1  4%  numa-vmstat.node3=
.nr_active_anon
>    2119899 =C2=B1  2%     -61.1%     824948 =C2=B1 26%  numa-vmstat.node3=
.nr_file_pages
>   10078981           +12.7%   11361269        numa-vmstat.node3.nr_free_p=
ages
>    2104561 =C2=B1  2%     -72.6%     575640 =C2=B1 19%  numa-vmstat.node3=
.nr_inactive_anon
>     532076 =C2=B1  3%     -73.6%     140331 =C2=B1 27%  numa-vmstat.node3=
.nr_mapped
>    2119835 =C2=B1  2%     -72.7%     578344 =C2=B1 19%  numa-vmstat.node3=
.nr_shmem
>      20659 =C2=B1  4%     +10.8%      22883 =C2=B1  3%  numa-vmstat.node3=
.nr_slab_unreclaimable
>      63.33 =C2=B1 31%  +3.9e+05%     246603 =C2=B1119%  numa-vmstat.node3=
.nr_unevictable
>      43020 =C2=B1  2%     -15.2%      36479 =C2=B1  4%  numa-vmstat.node3=
.nr_zone_active_anon
>    2104558 =C2=B1  2%     -72.6%     575639 =C2=B1 19%  numa-vmstat.node3=
.nr_zone_inactive_anon
>      63.33 =C2=B1 31%  +3.9e+05%     246603 =C2=B1119%  numa-vmstat.node3=
.nr_zone_unevictable
>    5758693 =C2=B1  2%     -68.2%    1829759 =C2=B1  9%  numa-vmstat.node3=
.numa_hit
>    5682124           -68.9%    1765702 =C2=B1  8%  numa-vmstat.node3.numa=
_local
>       1365 =C2=B1 17%     +79.0%       2443 =C2=B1 17%  numa-meminfo.node=
0.Active
>       1365 =C2=B1 17%     +79.0%       2443 =C2=B1 17%  numa-meminfo.node=
0.Active(anon)
>     218716 =C2=B1 30%     -62.8%      81438 =C2=B1 16%  numa-meminfo.node=
0.AnonPages
>     367250 =C2=B1 20%     -53.9%     169137 =C2=B1 37%  numa-meminfo.node=
0.AnonPages.max
>     219465 =C2=B1 30%     -62.7%      81772 =C2=B1 15%  numa-meminfo.node=
0.Inactive
>     219465 =C2=B1 30%     -62.7%      81772 =C2=B1 15%  numa-meminfo.node=
0.Inactive(anon)
>    1765352 =C2=B1 65%     -59.0%     724611 =C2=B1  3%  numa-meminfo.node=
0.MemUsed
>      10618 =C2=B1 31%     -29.9%       7446 =C2=B1  9%  numa-meminfo.node=
0.PageTables
>     171471 =C2=B1 12%     -15.9%     144211 =C2=B1  7%  numa-meminfo.node=
0.Slab
>      21854 =C2=B1 49%    +158.3%      56459 =C2=B1 26%  numa-meminfo.node=
1.AnonHugePages
>      69616 =C2=B1 13%     +95.7%     136273 =C2=B1 27%  numa-meminfo.node=
1.AnonPages
>     865131 =C2=B1132%    +132.0%    2007071 =C2=B1 34%  numa-meminfo.node=
1.FilePages
>      69601 =C2=B1 12%    +590.7%     480719 =C2=B1104%  numa-meminfo.node=
1.Inactive
>      69601 =C2=B1 12%    +590.7%     480719 =C2=B1104%  numa-meminfo.node=
1.Inactive(anon)
>      29436 =C2=B1 74%     +74.7%      51432 =C2=B1 42%  numa-meminfo.node=
1.KReclaimable
>      29436 =C2=B1 74%     +74.7%      51432 =C2=B1 42%  numa-meminfo.node=
1.SReclaimable
>      31599 =C2=B1 45%    +116.9%      68545 =C2=B1 38%  numa-meminfo.node=
2.AnonHugePages
>      37105 =C2=B1 57%     -60.3%      14741 =C2=B1 30%  numa-meminfo.node=
2.KReclaimable
>      11505 =C2=B1  3%     -14.2%       9877 =C2=B1 11%  numa-meminfo.node=
2.KernelStack
>    1626260 =C2=B1 71%     -57.0%     699121 =C2=B1  5%  numa-meminfo.node=
2.MemUsed
>      12410 =C2=B1  9%     -37.4%       7771 =C2=B1 30%  numa-meminfo.node=
2.PageTables
>      37105 =C2=B1 57%     -60.3%      14741 =C2=B1 30%  numa-meminfo.node=
2.SReclaimable
>     101971 =C2=B1  5%     -14.1%      87608 =C2=B1  3%  numa-meminfo.node=
2.SUnreclaim
>     139077 =C2=B1 14%     -26.4%     102349 =C2=B1  6%  numa-meminfo.node=
2.Slab
>     172173 =C2=B1  2%     -17.8%     141446        numa-meminfo.node3.Act=
ive
>     172173 =C2=B1  2%     -17.8%     141446        numa-meminfo.node3.Act=
ive(anon)
>    8474713 =C2=B1  2%     -61.0%    3304901 =C2=B1 26%  numa-meminfo.node=
3.FilePages
>    8413241 =C2=B1  2%     -72.5%    2312248 =C2=B1 19%  numa-meminfo.node=
3.Inactive
>    8413241 =C2=B1  2%     -72.5%    2312248 =C2=B1 19%  numa-meminfo.node=
3.Inactive(anon)
>    2124206 =C2=B1  4%     -73.3%     567258 =C2=B1 27%  numa-meminfo.node=
3.Mapped
>   40320874           +12.7%   45440007        numa-meminfo.node3.MemFree
>    9168416 =C2=B1  2%     -55.8%    4049283 =C2=B1 21%  numa-meminfo.node=
3.MemUsed
>      82641 =C2=B1  4%     +10.8%      91541 =C2=B1  3%  numa-meminfo.node=
3.SUnreclaim
>    8474458 =C2=B1  2%     -72.6%    2318487 =C2=B1 19%  numa-meminfo.node=
3.Shmem
>     253.67 =C2=B1 31%  +3.9e+05%     986414 =C2=B1119%  numa-meminfo.node=
3.Unevictable
>     517222 =C2=B1 18%     -91.1%      46192 =C2=B1 80%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>   17945994 =C2=B1 11%     -79.5%    3675647 =C2=B1110%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>    2731560 =C2=B1 13%     -85.9%     384230 =C2=B1 96%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>       7.33           -52.3%       3.50        sched_debug.cfs_rq:/.h_nr_r=
unning.max
>       1.25 =C2=B1  8%     -52.1%       0.60 =C2=B1  6%  sched_debug.cfs_r=
q:/.h_nr_running.stddev
>     194918 =C2=B1 72%     -63.0%      72167 =C2=B1114%  sched_debug.cfs_r=
q:/.load.max
>     517222 =C2=B1 18%     -91.1%      46192 =C2=B1 80%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>   17945994 =C2=B1 11%     -79.5%    3675647 =C2=B1110%  sched_debug.cfs_r=
q:/.max_vruntime.max
>    2731560 =C2=B1 13%     -85.9%     384230 =C2=B1 96%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>   14808543 =C2=B1 11%     +62.5%   24064323        sched_debug.cfs_rq:/.m=
in_vruntime.avg
>   23605716 =C2=B1  6%     +33.8%   31584000 =C2=B1  3%  sched_debug.cfs_r=
q:/.min_vruntime.max
>   11463279 =C2=B1 14%     +68.2%   19285170 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vruntime.min
>       0.27 =C2=B1 10%     -78.9%       0.06 =C2=B1 33%  sched_debug.cfs_r=
q:/.nr_running.stddev
>       1804           +11.2%       2006        sched_debug.cfs_rq:/.runnab=
le_avg.avg
>     629.28 =C2=B1  7%     +66.9%       1050        sched_debug.cfs_rq:/.r=
unnable_avg.min
>     769.43 =C2=B1  6%     -46.1%     414.65 =C2=B1  7%  sched_debug.cfs_r=
q:/.runnable_avg.stddev
>     643.97 =C2=B1  7%     +35.3%     871.60        sched_debug.cfs_rq:/.u=
til_avg.avg
>     361.22 =C2=B1  7%     +70.3%     615.33 =C2=B1  5%  sched_debug.cfs_r=
q:/.util_avg.min
>     245.15 =C2=B1  3%     -63.1%      90.51 =C2=B1 22%  sched_debug.cfs_r=
q:/.util_avg.stddev
>     248.95 =C2=B1 22%    +145.8%     611.95 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     974.56 =C2=B1  2%     +45.4%       1417 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_est_enqueued.max
>     290.80 =C2=B1  2%     -27.3%     211.29 =C2=B1  8%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>      37.22 =C2=B1 77%    +108.6%      77.62 =C2=B1  4%  sched_debug.cpu.c=
lock.stddev
>     134981 =C2=B1  5%     +20.3%     162365        sched_debug.cpu.clock_=
task.avg
>     119780 =C2=B1  4%     +31.8%     157916        sched_debug.cpu.clock_=
task.min
>      12237 =C2=B1  6%     -77.9%       2703 =C2=B1 43%  sched_debug.cpu.c=
lock_task.stddev
>       5654 =C2=B1  2%     +15.7%       6540        sched_debug.cpu.curr->=
pid.avg
>       2490 =C2=B1  6%     -70.7%     729.38 =C2=B1 17%  sched_debug.cpu.c=
urr->pid.stddev
>       6.89 =C2=B1  4%     -48.4%       3.56 =C2=B1  2%  sched_debug.cpu.n=
r_running.max
>       1.22 =C2=B1  8%     -51.6%       0.59 =C2=B1  7%  sched_debug.cpu.n=
r_running.stddev
>   11976855 =C2=B1 16%     +25.5%   15035687 =C2=B1  4%  sched_debug.cpu.n=
r_switches.avg
>   20709492 =C2=B1  4%     -15.6%   17479133 =C2=B1  5%  sched_debug.cpu.n=
r_switches.max
>    5427179 =C2=B1 15%    +108.8%   11332889 =C2=B1  2%  sched_debug.cpu.n=
r_switches.min
>    6328061 =C2=B1  8%     -69.1%    1954110 =C2=B1 22%  sched_debug.cpu.n=
r_switches.stddev
>  2.284e+09 =C2=B1  3%     -11.8%  2.016e+09 =C2=B1  2%  sched_debug.cpu.n=
r_uninterruptible.avg
>       8.77 =C2=B1 19%     -65.5%       3.02 =C2=B1  6%  perf-stat.i.MPKI
>   3.88e+10 =C2=B1 14%     +24.1%  4.814e+10 =C2=B1  4%  perf-stat.i.branc=
h-instructions
>       1.45            -0.1        1.38        perf-stat.i.branch-miss-rat=
e%
>   5.48e+08 =C2=B1 14%     +17.9%  6.461e+08 =C2=B1  4%  perf-stat.i.branc=
h-misses
>       1.96 =C2=B1 13%      +2.2        4.13 =C2=B1  8%  perf-stat.i.cache=
-miss-rate%
>  1.647e+09 =C2=B1  3%     -57.1%   7.06e+08 =C2=B1  9%  perf-stat.i.cache=
-references
>   15143297 =C2=B1 16%     +26.5%   19148726 =C2=B1  4%  perf-stat.i.conte=
xt-switches
>  5.331e+11            +8.2%  5.766e+11        perf-stat.i.cpu-cycles
>    2134083 =C2=B1 13%     -82.6%     371157 =C2=B1 26%  perf-stat.i.cpu-m=
igrations
>       0.13 =C2=B1 20%      -0.1        0.02 =C2=B1 10%  perf-stat.i.dTLB-=
load-miss-rate%
>   67887180 =C2=B1  9%     -80.6%   13160431 =C2=B1 17%  perf-stat.i.dTLB-=
load-misses
>  5.603e+10 =C2=B1 15%     +25.8%   7.05e+10 =C2=B1  4%  perf-stat.i.dTLB-=
loads
>       0.04 =C2=B1 23%      -0.0        0.01 =C2=B1 10%  perf-stat.i.dTLB-=
store-miss-rate%
>   12610107 =C2=B1  8%     -80.5%    2452777 =C2=B1 16%  perf-stat.i.dTLB-=
store-misses
>  3.294e+10 =C2=B1 16%     +28.7%  4.238e+10 =C2=B1  4%  perf-stat.i.dTLB-=
stores
>      52.45            -2.0       50.44        perf-stat.i.iTLB-load-miss-=
rate%
>  1.976e+11 =C2=B1 14%     +24.9%  2.468e+11 =C2=B1  4%  perf-stat.i.instr=
uctions
>       1035 =C2=B1  3%     +13.4%       1173        perf-stat.i.instructio=
ns-per-iTLB-miss
>       0.38 =C2=B1 13%     +15.5%       0.43 =C2=B1  4%  perf-stat.i.ipc
>       2.78            +8.2%       3.00        perf-stat.i.metric.GHz
>     533.45 =C2=B1 63%     -60.7%     209.79 =C2=B1  5%  perf-stat.i.metri=
c.K/sec
>     674.73 =C2=B1 15%     +25.0%     843.44 =C2=B1  4%  perf-stat.i.metri=
c.M/sec
>       7612           -26.0%       5633        perf-stat.i.minor-faults
>      85.44            -4.1       81.36 =C2=B1  2%  perf-stat.i.node-load-=
miss-rate%
>    6650850 =C2=B1 10%     -49.1%    3388099 =C2=B1 16%  perf-stat.i.node-=
load-misses
>    1652913 =C2=B1  4%     -45.0%     909753 =C2=B1  6%  perf-stat.i.node-=
loads
>      92.67            +5.2       97.83        perf-stat.i.node-store-miss=
-rate%
>    6658844 =C2=B1  3%     -28.9%    4732575 =C2=B1  2%  perf-stat.i.node-=
store-misses
>     721082 =C2=B1  9%     -85.6%     104129 =C2=B1 28%  perf-stat.i.node-=
stores
>       7616           -26.0%       5636        perf-stat.i.page-faults
>       8.57 =C2=B1 18%     -66.7%       2.85 =C2=B1  6%  perf-stat.overall=
.MPKI
>       1.41            -0.1        1.34        perf-stat.overall.branch-mi=
ss-rate%
>       1.78 =C2=B1 15%      +2.0        3.80 =C2=B1  9%  perf-stat.overall=
.cache-miss-rate%
>      18548 =C2=B1 13%     +17.9%      21863 =C2=B1 11%  perf-stat.overall=
.cycles-between-cache-misses
>       0.12 =C2=B1 22%      -0.1        0.02 =C2=B1 15%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.04 =C2=B1 23%      -0.0        0.01 =C2=B1 14%  perf-stat.overall=
.dTLB-store-miss-rate%
>      52.59            -2.0       50.54        perf-stat.overall.iTLB-load=
-miss-rate%
>     941.52 =C2=B1  2%     +14.0%       1073        perf-stat.overall.inst=
ructions-per-iTLB-miss
>      90.24            +7.6       97.86        perf-stat.overall.node-stor=
e-miss-rate%
>      28987 =C2=B1  4%      -9.7%      26171        perf-stat.overall.path=
-length
>  3.867e+10 =C2=B1 14%     +24.0%  4.797e+10 =C2=B1  4%  perf-stat.ps.bran=
ch-instructions
>  5.462e+08 =C2=B1 14%     +17.9%  6.439e+08 =C2=B1  4%  perf-stat.ps.bran=
ch-misses
>  1.642e+09 =C2=B1  3%     -57.2%  7.031e+08 =C2=B1  9%  perf-stat.ps.cach=
e-references
>   15095094 =C2=B1 16%     +26.4%   19085650 =C2=B1  4%  perf-stat.ps.cont=
ext-switches
>  5.314e+11            +8.1%  5.746e+11        perf-stat.ps.cpu-cycles
>    2127306 =C2=B1 13%     -82.7%     367671 =C2=B1 25%  perf-stat.ps.cpu-=
migrations
>   67658651 =C2=B1  9%     -80.7%   13085853 =C2=B1 17%  perf-stat.ps.dTLB=
-load-misses
>  5.585e+10 =C2=B1 15%     +25.8%  7.026e+10 =C2=B1  4%  perf-stat.ps.dTLB=
-loads
>   12569793 =C2=B1  8%     -80.6%    2437104 =C2=B1 16%  perf-stat.ps.dTLB=
-store-misses
>  3.283e+10 =C2=B1 16%     +28.6%  4.224e+10 =C2=B1  4%  perf-stat.ps.dTLB=
-stores
>   1.97e+11 =C2=B1 14%     +24.9%   2.46e+11 =C2=B1  4%  perf-stat.ps.inst=
ructions
>       7561           -25.9%       5603        perf-stat.ps.minor-faults
>    6627223 =C2=B1 10%     -49.1%    3372863 =C2=B1 16%  perf-stat.ps.node=
-load-misses
>    1641280 =C2=B1  4%     -45.0%     903399 =C2=B1  6%  perf-stat.ps.node=
-loads
>    6637288 =C2=B1  3%     -29.0%    4715114 =C2=B1  2%  perf-stat.ps.node=
-store-misses
>     717507 =C2=B1  9%     -85.6%     103574 =C2=B1 27%  perf-stat.ps.node=
-stores
>       7564           -25.9%       5607        perf-stat.ps.page-faults
>  6.055e+13 =C2=B1 14%     +24.9%  7.564e+13 =C2=B1  4%  perf-stat.total.i=
nstructions
>      27.64 =C2=B1 17%     -21.6        6.06 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__wake_up_common_lock.sock_def_readable.__udp_enqueue_sched=
ule_skb.udp_queue_rcv_one_skb.udp_unicast_rcv_skb
>      27.88 =C2=B1 17%     -21.6        6.29 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.sock_def_readable.__udp_enqueue_schedule_skb.udp_queue_rcv_=
one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv
>      28.36 =C2=B1 17%     -21.6        6.80 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb.udp_unicas=
t_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu
>      29.04 =C2=B1 16%     -21.4        7.63 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv.ip=
_protocol_deliver_rcu.ip_local_deliver_finish
>      29.20 =C2=B1 16%     -21.4        7.80 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu.=
ip_local_deliver_finish.__netif_receive_skb_one_core
>      27.22 =C2=B1 18%     -21.3        5.90 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.__=
udp_enqueue_schedule_skb.udp_queue_rcv_one_skb
>      27.11 =C2=B1 18%     -21.3        5.82 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_=
lock.sock_def_readable.__udp_enqueue_schedule_skb
>      27.03 =C2=B1 18%     -21.3        5.74 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__=
wake_up_common_lock.sock_def_readable
>      30.54 =C2=B1 14%     -21.2        9.30 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_rec=
eive_skb_one_core.process_backlog.__napi_poll
>      30.61 =C2=B1 14%     -21.2        9.39 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.proces=
s_backlog.__napi_poll.net_rx_action
>      30.15 =C2=B1 15%     -21.1        9.03 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_fin=
ish.__netif_receive_skb_one_core.process_backlog
>      31.88 =C2=B1 13%     -21.0       10.90 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.ne=
t_rx_action.__softirqentry_text_start
>      32.52 =C2=B1 13%     -20.9       11.61 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.process_backlog.__napi_poll.net_rx_action.__softirqentry_te=
xt_start.do_softirq
>      32.60 =C2=B1 13%     -20.9       11.71 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__napi_poll.net_rx_action.__softirqentry_text_start.do_soft=
irq.__local_bh_enable_ip
>      32.97 =C2=B1 12%     -20.8       12.16 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.net_rx_action.__softirqentry_text_start.do_softirq.__local_=
bh_enable_ip.ip_finish_output2
>      33.64 =C2=B1 12%     -20.6       13.02 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.i=
p_finish_output2.ip_send_skb
>      33.85 =C2=B1 12%     -20.6       13.29 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_send_s=
kb.udp_send_skb
>      33.99 =C2=B1 11%     -20.5       13.48 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__local_bh_enable_ip.ip_finish_output2.ip_send_skb.udp_send=
_skb.udp_sendmsg
>      18.16 =C2=B1 70%     -18.2        0.00        perf-profile.calltrace=
.cycles-pp.accept_connections
>      18.16 =C2=B1 70%     -18.2        0.00        perf-profile.calltrace=
.cycles-pp.accept_connection.accept_connections
>      18.16 =C2=B1 70%     -18.2        0.00        perf-profile.calltrace=
.cycles-pp.spawn_child.accept_connection.accept_connections
>      18.16 =C2=B1 70%     -18.2        0.00        perf-profile.calltrace=
.cycles-pp.process_requests.spawn_child.accept_connection.accept_connections
>      37.22 =C2=B1  9%     -16.2       21.02        perf-profile.calltrace=
.cycles-pp.ip_finish_output2.ip_send_skb.udp_send_skb.udp_sendmsg.sock_send=
msg
>      38.07 =C2=B1  8%     -15.9       22.15        perf-profile.calltrace=
.cycles-pp.ip_send_skb.udp_send_skb.udp_sendmsg.sock_sendmsg.__sys_sendto
>      38.37 =C2=B1  8%     -15.8       22.56        perf-profile.calltrace=
.cycles-pp.udp_send_skb.udp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sen=
dto
>      13.97 =C2=B1 16%     -14.0        0.00        perf-profile.calltrace=
.cycles-pp.secondary_startup_64_no_verify
>      13.84 =C2=B1 16%     -13.8        0.00        perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64_no_verify
>      13.84 =C2=B1 16%     -13.8        0.00        perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      13.83 =C2=B1 16%     -13.8        0.00        perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_n=
o_verify
>      11.23 =C2=B1 11%      -9.3        1.95 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremov=
e_wake_function.__wake_up_common
>      11.27 =C2=B1 11%      -9.3        2.01 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__=
wake_up_common.__wake_up_common_lock
>       9.13 =C2=B1 14%      -9.1        0.00        perf-profile.calltrace=
.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.seco=
ndary_startup_64_no_verify
>      10.52 =C2=B1  9%      -8.8        1.71 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.__sk=
b_wait_for_more_packets
>      15.97 =C2=B1  5%      -8.7        7.25 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__skb_recv_udp.udp_recvmsg.inet_recvmsg.__sys_recvfrom.__x6=
4_sys_recvfrom
>      14.56 =C2=B1  6%      -8.7        5.84 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg.inet=
_recvmsg.__sys_recvfrom
>       8.66 =C2=B1 14%      -8.7        0.00        perf-profile.calltrace=
.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_=
secondary
>       8.65 =C2=B1 14%      -8.6        0.00        perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_=
startup_entry
>      18.90 =C2=B1  3%      -8.5       10.40 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.udp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.=
do_syscall_64
>      13.84 =C2=B1  7%      -8.5        5.38 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp=
.udp_recvmsg.inet_recvmsg
>      13.63 =C2=B1  7%      -8.5        5.18 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.schedule_timeout.__skb_wait_for_more_pa=
ckets.__skb_recv_udp
>       8.45 =C2=B1 14%      -8.4        0.00        perf-profile.calltrace=
.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_ca=
ll.do_idle
>      19.02 =C2=B1  3%      -8.4       10.58 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
>      13.72 =C2=B1  7%      -8.4        5.29 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.schedule.schedule_timeout.__skb_wait_for_more_packets.__skb=
_recv_udp.udp_recvmsg
>       8.24 =C2=B1 13%      -8.2        0.00        perf-profile.calltrace=
.cycles-pp.mwait_idle_with_hints.intel_idle_irq.cpuidle_enter_state.cpuidle=
_enter.cpuidle_idle_call
>      20.83 =C2=B1  2%      -8.1       12.72 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe.recvfrom
>       7.33 =C2=B1 33%      -7.3        0.00        perf-profile.calltrace=
.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up=
_common.__wake_up_common_lock
>       6.90 =C2=B1 37%      -6.9        0.00        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.a=
utoremove_wake_function.__wake_up_common
>       5.86 =C2=B1 17%      -5.1        0.78 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wa=
ke_up.autoremove_wake_function
>       5.10 =C2=B1 15%      -4.7        0.35 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedu=
le_timeout
>      12.20 =C2=B1  3%      -4.6        7.60 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.recvfrom.recv_omni.process_requests.spawn_child.accept_conn=
ection
>      11.81 =C2=B1  3%      -4.6        7.24 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.recv_=
omni.process_requests
>      11.39 =C2=B1  3%      -4.6        6.83 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.recvfrom.recv_omni
>      11.91 =C2=B1  3%      -4.5        7.37 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni.process_r=
equests.spawn_child
>      10.31 =C2=B1  7%      -4.3        6.05 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.recvfrom.send_omni_inner.send_udp_rr.main.__libc_start_main
>       9.94 =C2=B1  7%      -4.2        5.72 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.send_=
omni_inner.send_udp_rr
>      10.02 =C2=B1  7%      -4.2        5.83 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.recvfrom.send_omni_inner.sen=
d_udp_rr.main
>       9.57 =C2=B1  7%      -4.2        5.42 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.recvfrom.send_omni_inner
>       1.46 =C2=B1 12%      -0.6        0.85 =C2=B1 71%  perf-profile.call=
trace.cycles-pp.send_omni_inner.send_udp_rr
>       1.46 =C2=B1 12%      -0.6        0.86 =C2=B1 71%  perf-profile.call=
trace.cycles-pp.send_udp_rr
>       1.72 =C2=B1  2%      +0.1        1.80 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.select_idle_sibling.select_task_rq_fair.select_task_rq.try_=
to_wake_up.autoremove_wake_function
>       1.15 =C2=B1 12%      +0.3        1.43 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.recvfrom
>       0.00            +0.5        0.53 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.switch_mm_irqs_off.__schedule.schedule.schedule_timeout.__skb_wa=
it_for_more_packets
>       0.00            +0.5        0.54 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.switch_mm_irqs_off.__schedule.schedule.exit_to_user_mode_loop.ex=
it_to_user_mode_prepare
>       0.35 =C2=B1 70%      +0.6        0.91 =C2=B1 23%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair.__schedule.schedule.exit_to_user_mode_l=
oop.exit_to_user_mode_prepare
>       0.00            +0.6        0.62 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.recvfrom
>       0.00            +0.6        0.62 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom
>       0.00            +0.6        0.62 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.=
recvfrom
>       1.42 =C2=B1  4%      +0.6        2.06 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__alloc_skb.alloc_skb_with_frags.sock_alloc_send_pskb.__ip_=
append_data.ip_make_skb
>       0.82 =C2=B1 26%      +0.6        1.46 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.sendto
>       0.00            +0.6        0.64 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.sendto
>       0.00            +0.6        0.64 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto
>       0.00            +0.6        0.64 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.sendto
>       1.54 =C2=B1  3%      +0.7        2.23 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.alloc_skb_with_frags.sock_alloc_send_pskb.__ip_append_data.=
ip_make_skb.udp_sendmsg
>       1.02 =C2=B1 22%      +0.8        1.84 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.ip_route_output_key_hash.ip_route_output_flow.udp_sendmsg.s=
ock_sendmsg.__sys_sendto
>       2.28 =C2=B1 11%      +0.8        3.11 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.sock_alloc_send_pskb.__ip_append_data.ip_make_skb.udp_sendm=
sg.sock_sendmsg
>       1.04 =C2=B1 22%      +0.8        1.87 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.ip_route_output_flow.udp_sendmsg.sock_sendmsg.__sys_sendto.=
__x64_sys_sendto
>       0.00            +0.9        0.92 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.enqueue_to_backlog.netif_rx_internal.__netif_rx.loopback_xmit.de=
v_hard_start_xmit
>       0.00            +1.0        0.99 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.netif_rx_internal.__netif_rx.loopback_xmit.dev_hard_start_xmit._=
_dev_queue_xmit
>       1.17 =C2=B1 35%      +1.0        2.17 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.sendto.send_omni_inner
>       0.17 =C2=B1141%      +1.1        1.24 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.ip_generic_getfrag.__ip_append_data.ip_make_skb.udp_sendmsg=
.sock_sendmsg
>       0.39 =C2=B1 72%      +1.1        1.47 =C2=B1 21%  perf-profile.call=
trace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.sendto.recv_omni
>       0.00            +1.1        1.11 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.ip_route_output_key_hash_rcu.ip_route_output_key_hash.ip_route_o=
utput_flow.udp_sendmsg.sock_sendmsg
>       0.00            +1.2        1.17 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.__netif_rx.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip=
_finish_output2
>       3.82 =C2=B1 13%      +1.3        5.08 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__ip_append_data.ip_make_skb.udp_sendmsg.sock_sendmsg.__sys=
_sendto
>       0.95 =C2=B1 32%      +2.6        3.52 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_ex=
it_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.72 =C2=B1 70%      +2.6        3.29 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mod=
e_prepare.syscall_exit_to_user_mode
>       0.75 =C2=B1 70%      +2.7        3.40 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.s=
yscall_exit_to_user_mode.do_syscall_64
>       1.31 =C2=B1  8%      +2.8        4.10 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_sysc=
all_64.entry_SYSCALL_64_after_hwframe.sendto
>       0.21 =C2=B1141%      +3.8        4.02 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.sock_wfree.loopback_xmit.dev_hard_start_xmit.__dev_queue_xm=
it.ip_finish_output2
>       1.77 =C2=B1 31%      +4.1        5.87 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.dev_hard_start_xmit.__dev_queue_xmit.ip_finish_output2.ip_s=
end_skb.udp_send_skb
>       2.75 =C2=B1 22%      +4.2        7.00 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.__dev_queue_xmit.ip_finish_output2.ip_send_skb.udp_send_skb=
.udp_sendmsg
>       1.34 =C2=B1 33%      +4.3        5.68 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip_finis=
h_output2.ip_send_skb
>      41.35 =C2=B1  2%      +6.3       47.66        perf-profile.calltrace=
.cycles-pp.recv_omni.process_requests.spawn_child.accept_connection.accept_=
connections
>      39.87 =C2=B1  2%      +7.5       47.41        perf-profile.calltrace=
.cycles-pp.send_omni_inner.send_udp_rr.main.__libc_start_main
>      40.07 =C2=B1  2%      +7.6       47.64        perf-profile.calltrace=
.cycles-pp.send_udp_rr.main.__libc_start_main
>      27.24 =C2=B1  2%     +10.2       37.43        perf-profile.calltrace=
.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.se=
ndto.recv_omni
>      28.08 =C2=B1  4%     +10.5       38.62 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me.sendto.send_omni_inner
>      28.09           +10.9       39.02 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.recv_omni.pr=
ocess_requests
>      28.20           +11.0       39.18 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.sendto.recv_omni.process_requests=
.spawn_child
>      28.42 =C2=B1  2%     +11.0       39.41 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sendto.recv_omni.process_requests.spawn_child.accept_connec=
tion
>      29.38 =C2=B1  5%     +11.6       40.98 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.send_om=
ni_inner.send_udp_rr
>      28.67 =C2=B1  5%     +12.0       40.62 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sendto.send_omni_inner.send_udp_rr.main.__libc_start_main
>      28.46 =C2=B1  5%     +12.0       40.41 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner.send_=
udp_rr.main
>      53.61 =C2=B1  2%     +20.4       74.00        perf-profile.calltrace=
.cycles-pp.udp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscal=
l_64
>      54.27 =C2=B1  2%     +20.5       74.74        perf-profile.calltrace=
.cycles-pp.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_S=
YSCALL_64_after_hwframe
>      55.17 =C2=B1  2%     +20.7       75.85        perf-profile.calltrace=
.cycles-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe.sendto
>      23.34 =C2=B1 51%     +24.5       47.88        perf-profile.calltrace=
.cycles-pp.accept_connections.main.__libc_start_main
>      23.34 =C2=B1 51%     +24.5       47.88        perf-profile.calltrace=
.cycles-pp.accept_connection.accept_connections.main.__libc_start_main
>      23.34 =C2=B1 51%     +24.5       47.88        perf-profile.calltrace=
.cycles-pp.spawn_child.accept_connection.accept_connections.main.__libc_sta=
rt_main
>      23.34 =C2=B1 51%     +24.5       47.88        perf-profile.calltrace=
.cycles-pp.process_requests.spawn_child.accept_connection.accept_connection=
s.main
>      63.44 =C2=B1 17%     +32.1       95.54        perf-profile.calltrace=
.cycles-pp.__libc_start_main
>      63.41 =C2=B1 17%     +32.1       95.52        perf-profile.calltrace=
.cycles-pp.main.__libc_start_main
>       7.85 =C2=B1 43%     +32.8       40.68 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__ip_select_ident.__ip_make_skb.ip_make_skb.udp_sendmsg.soc=
k_sendmsg
>       8.34 =C2=B1 42%     +33.3       41.64 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__ip_make_skb.ip_make_skb.udp_sendmsg.sock_sendmsg.__sys_se=
ndto
>      12.57 =C2=B1 32%     +35.4       48.01 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.ip_make_skb.udp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys=
_sendto
>      28.26 =C2=B1 16%     -21.9        6.40 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sock_def_readable
>      28.02 =C2=B1 17%     -21.9        6.16 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>      28.75 =C2=B1 16%     -21.8        6.92 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__udp_enqueue_schedule_skb
>      29.45 =C2=B1 15%     -21.7        7.78 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.udp_queue_rcv_one_skb
>      29.59 =C2=B1 15%     -21.7        7.93 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.udp_unicast_rcv_skb
>      27.59 =C2=B1 17%     -21.6        6.01 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>      27.49 =C2=B1 17%     -21.6        5.92 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.autoremove_wake_function
>      27.41 =C2=B1 17%     -21.6        5.85 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>      30.56 =C2=B1 14%     -21.4        9.19 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__udp4_lib_rcv
>      30.78 =C2=B1 14%     -21.3        9.46 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ip_protocol_deliver_rcu
>      30.85 =C2=B1 14%     -21.3        9.54 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ip_local_deliver_finish
>      32.15 =C2=B1 13%     -21.1       11.08 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__netif_receive_skb_one_core
>      32.78 =C2=B1 12%     -21.0       11.80 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.process_backlog
>      32.85 =C2=B1 12%     -21.0       11.89 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__napi_poll
>      33.23 =C2=B1 12%     -20.9       12.36 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.net_rx_action
>      34.08 =C2=B1 11%     -20.8       13.23 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>      34.12 =C2=B1 11%     -20.6       13.50 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.do_softirq
>      34.36 =C2=B1 11%     -20.5       13.84 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__local_bh_enable_ip
>      37.51 =C2=B1  8%     -16.2       21.34        perf-profile.children.=
cycles-pp.ip_finish_output2
>      38.36 =C2=B1  8%     -15.9       22.46        perf-profile.children.=
cycles-pp.ip_send_skb
>      38.65 =C2=B1  8%     -15.8       22.88        perf-profile.children.=
cycles-pp.udp_send_skb
>      13.97 =C2=B1 16%     -14.0        0.00        perf-profile.children.=
cycles-pp.secondary_startup_64_no_verify
>      13.97 =C2=B1 16%     -14.0        0.00        perf-profile.children.=
cycles-pp.cpu_startup_entry
>      13.97 =C2=B1 16%     -14.0        0.00        perf-profile.children.=
cycles-pp.do_idle
>      13.84 =C2=B1 16%     -13.8        0.00        perf-profile.children.=
cycles-pp.start_secondary
>      13.43 =C2=B1 10%     -13.1        0.30 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_cfs_group
>      20.66 =C2=B1  7%     -12.1        8.60 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__schedule
>      12.25 =C2=B1 29%     -11.2        1.05        perf-profile.children.=
cycles-pp._raw_spin_lock
>      10.97 =C2=B1 32%     -11.0        0.00        perf-profile.children.=
cycles-pp.native_queued_spin_lock_slowpath
>      11.64 =C2=B1 11%      -9.6        2.00 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>      11.65 =C2=B1 10%      -9.6        2.05 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>      16.83 =C2=B1  5%      -9.5        7.33 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__skb_recv_udp
>      15.36 =C2=B1  6%      -9.5        5.88 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__skb_wait_for_more_packets
>      19.80 =C2=B1  3%      -9.3       10.50 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.udp_recvmsg
>      19.92 =C2=B1  3%      -9.3       10.67 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.inet_recvmsg
>      14.65 =C2=B1  6%      -9.2        5.41 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.schedule_timeout
>       9.22 =C2=B1 14%      -9.2        0.00        perf-profile.children.=
cycles-pp.cpuidle_idle_call
>      21.77 =C2=B1  2%      -8.9       12.85 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__sys_recvfrom
>      10.81 =C2=B1  9%      -8.9        1.90 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.dequeue_task_fair
>      21.90            -8.9       13.01 =C2=B1  3%  perf-profile.children.=
cycles-pp.__x64_sys_recvfrom
>      24.65            -8.9       15.77 =C2=B1  3%  perf-profile.children.=
cycles-pp.recvfrom
>       8.74 =C2=B1 14%      -8.7        0.00        perf-profile.children.=
cycles-pp.cpuidle_enter
>       8.74 =C2=B1 14%      -8.7        0.00        perf-profile.children.=
cycles-pp.cpuidle_enter_state
>       8.55 =C2=B1 14%      -8.6        0.00        perf-profile.children.=
cycles-pp.mwait_idle_with_hints
>       8.53 =C2=B1 14%      -8.5        0.00        perf-profile.children.=
cycles-pp.intel_idle_irq
>      16.32 =C2=B1  3%      -7.5        8.78 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.schedule
>       7.47 =C2=B1 16%      -6.0        1.50 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       6.14 =C2=B1 17%      -5.1        1.06 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       5.28 =C2=B1 15%      -4.4        0.84 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       0.82 =C2=B1 13%      -0.4        0.39 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sysvec_apic_timer_interrupt
>       1.08 =C2=B1 15%      -0.4        0.65 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_apic_timer_interrupt
>       1.15            -0.4        0.79 =C2=B1  3%  perf-profile.children.=
cycles-pp.set_next_entity
>       2.46 =C2=B1  4%      -0.3        2.13        perf-profile.children.=
cycles-pp.select_task_rq
>       2.37 =C2=B1  4%      -0.3        2.05 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.select_task_rq_fair
>       0.48 =C2=B1 14%      -0.3        0.19 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.38 =C2=B1 18%      -0.3        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.41 =C2=B1 17%      -0.3        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.41 =C2=B1 17%      -0.3        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.43 =C2=B1 16%      -0.3        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       0.42 =C2=B1 11%      -0.3        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.62 =C2=B1 10%      -0.3        0.35        perf-profile.children.=
cycles-pp.__sysvec_apic_timer_interrupt
>       0.61 =C2=B1 10%      -0.3        0.35 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       0.28 =C2=B1 15%      -0.2        0.06        perf-profile.children.=
cycles-pp.task_tick_fair
>       0.39 =C2=B1  3%      -0.2        0.22 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.prepare_to_wait_exclusive
>       1.59 =C2=B1  5%      -0.2        1.42 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.select_idle_cpu
>       0.86 =C2=B1  4%      -0.2        0.69        perf-profile.children.=
cycles-pp.available_idle_cpu
>       0.46 =C2=B1  4%      -0.2        0.30 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.recv_data
>       0.31 =C2=B1 16%      -0.2        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._raw_spin_unlock_irqrestore
>       0.29 =C2=B1  3%      -0.1        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__get_user_4
>       0.48 =C2=B1  7%      -0.1        0.40 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.56 =C2=B1  6%      -0.1        0.49 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       0.33 =C2=B1  5%      -0.1        0.27        perf-profile.children.=
cycles-pp.copyout
>       0.31 =C2=B1  5%      -0.1        0.26        perf-profile.children.=
cycles-pp.udp_rmem_release
>       0.20 =C2=B1  4%      -0.0        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.resched_curr
>       0.08 =C2=B1  6%      -0.0        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.sendto(a)plt
>       0.56 =C2=B1  3%      -0.0        0.52 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.kfree
>       0.15 =C2=B1  6%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.cpumask_next
>       0.07 =C2=B1  7%      -0.0        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.tracing_gen_ctx_irq_test
>       0.37 =C2=B1  3%      -0.0        0.34 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ip_rcv_finish_core
>       0.17 =C2=B1  2%      -0.0        0.16 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.xfrm_lookup_with_ifid
>       0.23            -0.0        0.21 =C2=B1  2%  perf-profile.children.=
cycles-pp.xfrm_lookup_route
>       0.09            -0.0        0.08        perf-profile.children.cycle=
s-pp.__list_add_valid
>       0.06 =C2=B1  8%      +0.0        0.07        perf-profile.children.=
cycles-pp.apparmor_socket_sendmsg
>       0.06 =C2=B1  8%      +0.0        0.07        perf-profile.children.=
cycles-pp.apparmor_ip_postroute
>       0.08 =C2=B1 10%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.is_vmalloc_addr
>       0.06 =C2=B1 14%      +0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.place_entity
>       0.07 =C2=B1 12%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__rdgsbase_inactive
>       0.06 =C2=B1  8%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__cgroup_account_cputime
>       0.10 =C2=B1 12%      +0.0        0.12        perf-profile.children.=
cycles-pp.ip_send_check
>       0.08 =C2=B1 17%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode_prepare
>       0.08 =C2=B1 10%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.validate_xmit_vlan
>       0.06 =C2=B1 13%      +0.0        0.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_stat_runtime
>       0.06 =C2=B1 13%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__bitmap_and
>       0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.neigh_hh_output
>       0.04 =C2=B1 70%      +0.0        0.07        perf-profile.children.=
cycles-pp.__build_skb_around
>       0.07 =C2=B1 18%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       0.06 =C2=B1 13%      +0.0        0.09        perf-profile.children.=
cycles-pp.apparmor_socket_sock_rcv_skb
>       0.04 =C2=B1 70%      +0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.save_fpregs_to_fpstate
>       0.05 =C2=B1 70%      +0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.skb_pull_rcsum
>       0.08 =C2=B1 20%      +0.0        0.12        perf-profile.children.=
cycles-pp.clear_buddies
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.validate_xmit_xfrm
>       0.15 =C2=B1 12%      +0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__ip_local_out
>       0.12 =C2=B1 16%      +0.0        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__wrgsbase_inactive
>       0.06 =C2=B1 14%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.rcu_note_context_switch
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.skb_clone_tx_timestamp
>       0.10 =C2=B1 14%      +0.0        0.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__put_user_nocheck_4
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_safe_stack
>       0.21 =C2=B1 15%      +0.0        0.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ipv4_pktinfo_prepare
>       0.13 =C2=B1 14%      +0.0        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.nf_hook_slow
>       0.08 =C2=B1 17%      +0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.check_stack_object
>       0.04 =C2=B1 71%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_switch
>       0.03 =C2=B1 70%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.udp4_hwcsum
>       0.08 =C2=B1 20%      +0.0        0.13 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.skb_network_protocol
>       0.43 =C2=B1  9%      +0.0        0.47        perf-profile.children.=
cycles-pp.security_socket_sendmsg
>       0.18 =C2=B1 15%      +0.0        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.dst_release
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.switch_ldt
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.perf_swevent_get_recursion_context
>       0.12 =C2=B1 18%      +0.1        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.udp4_csum_init
>       0.22 =C2=B1 12%      +0.1        0.27 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ip_setup_cork
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.se_is_idle
>       0.54 =C2=B1  8%      +0.1        0.60 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.aa_sk_perm
>       0.10 =C2=B1 19%      +0.1        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.perf_trace_buf_alloc
>       0.15 =C2=B1  9%      +0.1        0.21 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.copyin
>       0.13 =C2=B1 14%      +0.1        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__cond_resched
>       0.12 =C2=B1 20%      +0.1        0.18 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.set_next_buddy
>       0.19 =C2=B1 17%      +0.1        0.25        perf-profile.children.=
cycles-pp.pick_next_entity
>       0.19 =C2=B1 14%      +0.1        0.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.syscall_return_via_sysret
>       0.14 =C2=B1 13%      +0.1        0.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.memcg_slab_post_alloc_hook
>       0.11 =C2=B1 14%      +0.1        0.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.import_single_range
>       0.42 =C2=B1 12%      +0.1        0.49        perf-profile.children.=
cycles-pp.check_preempt_curr
>       0.12 =C2=B1 22%      +0.1        0.18 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.security_sock_rcv_skb
>       0.17 =C2=B1 17%      +0.1        0.24 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.siphash_3u32
>       0.30 =C2=B1 15%      +0.1        0.37 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.___perf_sw_event
>       0.44 =C2=B1 12%      +0.1        0.52        perf-profile.children.=
cycles-pp.ttwu_do_wakeup
>       0.23 =C2=B1 15%      +0.1        0.31 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.memcg_slab_free_hook
>       0.12 =C2=B1 30%      +0.1        0.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ip_skb_dst_mtu
>       0.20 =C2=B1 17%      +0.1        0.28 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ip_rcv_core
>       0.38 =C2=B1 13%      +0.1        0.47 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_se
>       0.13 =C2=B1 22%      +0.1        0.21 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ipv4_mtu
>       0.73 =C2=B1  9%      +0.1        0.81 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ip_rcv
>       0.46 =C2=B1 10%      +0.1        0.55        perf-profile.children.=
cycles-pp.__mkroute_output
>       0.16 =C2=B1 26%      +0.1        0.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__ip_finish_output
>       0.17 =C2=B1 22%      +0.1        0.26 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.netif_skb_features
>       0.47 =C2=B1 12%      +0.1        0.56 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.restore_fpregs_from_fpstate
>       0.29 =C2=B1 12%      +0.1        0.38 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__might_sleep
>       0.21 =C2=B1 18%      +0.1        0.31        perf-profile.children.=
cycles-pp.copy_user_enhanced_fast_string
>       0.25 =C2=B1 17%      +0.1        0.35 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.17 =C2=B1 16%      +0.1        0.27 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__calc_delta
>       0.29 =C2=B1 23%      +0.1        0.39 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__virt_addr_valid
>       0.22 =C2=B1 19%      +0.1        0.32 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sk_filter_trim_cap
>       0.30 =C2=B1 15%      +0.1        0.41 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__check_heap_object
>       0.23 =C2=B1 17%      +0.1        0.34 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._copy_to_user
>       0.38 =C2=B1 15%      +0.1        0.49 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.native_sched_clock
>       0.30 =C2=B1 15%      +0.1        0.41 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.ip_output
>       0.27 =C2=B1 17%      +0.1        0.38 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp._copy_from_user
>       0.18 =C2=B1 22%      +0.1        0.30 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.fib_lookup_good_nhc
>       0.58 =C2=B1 13%      +0.1        0.70 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.check_heap_object
>       0.40 =C2=B1 11%      +0.1        0.52 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__netif_receive_skb_core
>       0.31 =C2=B1 18%      +0.1        0.43 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.os_xsave
>       0.44 =C2=B1 14%      +0.1        0.57 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       0.35 =C2=B1 16%      +0.1        0.48 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.irqtime_account_irq
>       0.83 =C2=B1  9%      +0.1        0.96 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.switch_fpu_return
>       0.88 =C2=B1 10%      +0.1        1.01 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.move_addr_to_user
>       0.35 =C2=B1 13%      +0.1        0.48 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._copy_from_iter
>       0.65 =C2=B1 13%      +0.1        0.79 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.prepare_task_switch
>       0.44 =C2=B1 14%      +0.1        0.58 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__might_resched
>       0.62 =C2=B1 11%      +0.1        0.76 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__udp4_lib_lookup
>       0.41 =C2=B1 15%      +0.1        0.56 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.validate_xmit_skb
>       0.59 =C2=B1 11%      +0.1        0.73 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.35 =C2=B1 17%      +0.2        0.50 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.move_addr_to_kernel
>       0.64 =C2=B1 12%      +0.2        0.80 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc_node
>       0.53 =C2=B1 15%      +0.2        0.70 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__kmalloc_node_track_caller
>       0.29 =C2=B1 21%      +0.2        0.46 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.put_prev_entity
>       0.61 =C2=B1 15%      +0.2        0.79 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.kmalloc_reserve
>       0.43 =C2=B1 16%      +0.2        0.62 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__entry_text_start
>       0.25 =C2=B1 23%      +0.2        0.45 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.check_preempt_wakeup
>       1.10 =C2=B1 11%      +0.2        1.30 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.53 =C2=B1 15%      +0.2        0.75 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__might_fault
>       0.67 =C2=B1 21%      +0.3        0.97 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.fib_table_lookup
>       0.42 =C2=B1 16%      +0.3        0.73 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.skb_set_owner_w
>       0.93 =C2=B1 15%      +0.3        1.26 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ip_generic_getfrag
>       0.80 =C2=B1 19%      +0.3        1.13 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.ip_route_output_key_hash_rcu
>       1.18 =C2=B1 14%      +0.4        1.55 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__check_object_size
>       1.71 =C2=B1 13%      +0.4        2.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__alloc_skb
>       1.83 =C2=B1 13%      +0.4        2.27 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.alloc_skb_with_frags
>       0.66 =C2=B1 18%      +0.4        1.11 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.enqueue_to_backlog
>       1.40 =C2=B1 15%      +0.5        1.87 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ip_route_output_key_hash
>       0.70 =C2=B1 17%      +0.5        1.17 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.netif_rx_internal
>       1.42 =C2=B1 15%      +0.5        1.90 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ip_route_output_flow
>       0.71 =C2=B1 17%      +0.5        1.19 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__netif_rx
>       1.21 =C2=B1 15%      +0.6        1.84 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.switch_mm_irqs_off
>       2.48 =C2=B1 12%      +0.7        3.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sock_alloc_send_pskb
>       3.91 =C2=B1 13%      +1.3        5.17 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__ip_append_data
>       1.89 =C2=B1 26%      +1.7        3.58 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_loop
>       2.85 =C2=B1 21%      +1.9        4.74 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       3.02 =C2=B1 20%      +1.9        4.96 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode
>       0.78 =C2=B1 48%      +3.3        4.10 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.sock_wfree
>       1.84 =C2=B1 27%      +3.9        5.77 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.loopback_xmit
>       1.95 =C2=B1 26%      +4.0        5.94 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.dev_hard_start_xmit
>       2.82 =C2=B1 22%      +4.3        7.11 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__dev_queue_xmit
>      41.49 =C2=B1  2%      +6.4       47.85        perf-profile.children.=
cycles-pp.recv_omni
>      41.50 =C2=B1  2%      +6.4       47.88        perf-profile.children.=
cycles-pp.accept_connections
>      41.50 =C2=B1  2%      +6.4       47.88        perf-profile.children.=
cycles-pp.accept_connection
>      41.50 =C2=B1  2%      +6.4       47.88        perf-profile.children.=
cycles-pp.spawn_child
>      41.50 =C2=B1  2%      +6.4       47.88        perf-profile.children.=
cycles-pp.process_requests
>      42.01 =C2=B1  2%      +6.7       48.75        perf-profile.children.=
cycles-pp.send_omni_inner
>      41.83 =C2=B1  2%      +6.8       48.66        perf-profile.children.=
cycles-pp.send_udp_rr
>      80.96 =C2=B1  2%     +13.7       94.70        perf-profile.children.=
cycles-pp.do_syscall_64
>      81.39 =C2=B1  2%     +13.9       95.29        perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
>      53.99 =C2=B1  2%     +20.3       74.27        perf-profile.children.=
cycles-pp.udp_sendmsg
>      54.64 =C2=B1  2%     +20.4       75.00        perf-profile.children.=
cycles-pp.sock_sendmsg
>      55.55 =C2=B1  3%     +20.6       76.10        perf-profile.children.=
cycles-pp.__sys_sendto
>      55.71 =C2=B1  3%     +20.6       76.32        perf-profile.children.=
cycles-pp.__x64_sys_sendto
>      59.79 =C2=B1  4%     +23.3       83.08        perf-profile.children.=
cycles-pp.sendto
>      63.73 =C2=B1 17%     +31.9       95.65        perf-profile.children.=
cycles-pp.main
>      63.44 =C2=B1 17%     +32.1       95.54        perf-profile.children.=
cycles-pp.__libc_start_main
>       7.99 =C2=B1 43%     +33.2       41.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__ip_select_ident
>       8.50 =C2=B1 42%     +33.5       41.96 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__ip_make_skb
>      12.81 =C2=B1 32%     +35.4       48.19 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ip_make_skb
>      13.42 =C2=B1 10%     -13.1        0.29 =C2=B1  4%  perf-profile.self=
.cycles-pp.update_cfs_group
>      10.96 =C2=B1 32%     -11.0        0.00        perf-profile.self.cycl=
es-pp.native_queued_spin_lock_slowpath
>       8.41 =C2=B1 14%      -8.4        0.00        perf-profile.self.cycl=
es-pp.mwait_idle_with_hints
>       6.36 =C2=B1 20%      -5.7        0.63 =C2=B1  8%  perf-profile.self=
.cycles-pp.update_load_avg
>       0.79 =C2=B1 22%      -0.7        0.12 =C2=B1  3%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       1.30 =C2=B1  3%      -0.3        1.04        perf-profile.self.cycl=
es-pp._raw_spin_lock
>       0.95 =C2=B1  3%      -0.2        0.71 =C2=B1  2%  perf-profile.self=
.cycles-pp.__schedule
>       0.85 =C2=B1  3%      -0.2        0.67        perf-profile.self.cycl=
es-pp.available_idle_cpu
>       0.39 =C2=B1  6%      -0.1        0.28 =C2=B1  5%  perf-profile.self=
.cycles-pp.recv_data
>       0.36 =C2=B1  4%      -0.1        0.25        perf-profile.self.cycl=
es-pp.recvfrom
>       0.29 =C2=B1  4%      -0.1        0.19 =C2=B1  4%  perf-profile.self=
.cycles-pp.update_rq_clock
>       0.28 =C2=B1  4%      -0.1        0.19 =C2=B1  2%  perf-profile.self=
.cycles-pp.__get_user_4
>       0.30 =C2=B1  4%      -0.1        0.22 =C2=B1  7%  perf-profile.self=
.cycles-pp.__skb_wait_for_more_packets
>       0.23            -0.1        0.16 =C2=B1  6%  perf-profile.self.cycl=
es-pp.sock_alloc_send_pskb
>       0.12 =C2=B1  6%      -0.1        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.perf_trace_sched_wakeup_template
>       0.47 =C2=B1  6%      -0.1        0.41 =C2=B1  3%  perf-profile.self=
.cycles-pp.send_omni_inner
>       0.15 =C2=B1  3%      -0.1        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.schedule_timeout
>       0.17 =C2=B1  4%      -0.1        0.12 =C2=B1  4%  perf-profile.self=
.cycles-pp.finish_task_switch
>       0.30 =C2=B1  5%      -0.1        0.25        perf-profile.self.cycl=
es-pp.udp_rmem_release
>       0.45 =C2=B1  6%      -0.1        0.39 =C2=B1  6%  perf-profile.self=
.cycles-pp.enqueue_entity
>       0.27 =C2=B1  7%      -0.1        0.22 =C2=B1  4%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.20 =C2=B1  6%      -0.0        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.set_next_entity
>       0.36 =C2=B1  3%      -0.0        0.32 =C2=B1  2%  perf-profile.self=
.cycles-pp.ip_rcv_finish_core
>       0.19 =C2=B1  6%      -0.0        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.resched_curr
>       0.08 =C2=B1  6%      -0.0        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.sendto(a)plt
>       0.19 =C2=B1  7%      -0.0        0.16 =C2=B1  3%  perf-profile.self=
.cycles-pp.__ksize
>       0.07 =C2=B1  7%      -0.0        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.tracing_gen_ctx_irq_test
>       0.17            -0.0        0.15 =C2=B1  3%  perf-profile.self.cycl=
es-pp.xfrm_lookup_with_ifid
>       0.07 =C2=B1  7%      +0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.__napi_poll
>       0.06 =C2=B1 14%      +0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.ip_local_deliver_finish
>       0.07 =C2=B1 12%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.syscall_exit_to_user_mode_prepare
>       0.06 =C2=B1 13%      +0.0        0.08        perf-profile.self.cycl=
es-pp.apparmor_socket_sock_rcv_skb
>       0.06 =C2=B1  8%      +0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.ktime_get
>       0.10 =C2=B1 12%      +0.0        0.12        perf-profile.self.cycl=
es-pp.ip_send_check
>       0.06 =C2=B1 13%      +0.0        0.08 =C2=B1 11%  perf-profile.self=
.cycles-pp.perf_trace_sched_stat_runtime
>       0.06 =C2=B1 13%      +0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.__bitmap_and
>       0.12 =C2=B1  7%      +0.0        0.15 =C2=B1  5%  perf-profile.self=
.cycles-pp.alloc_skb_with_frags
>       0.03 =C2=B1 70%      +0.0        0.06        perf-profile.self.cycl=
es-pp.raw_local_deliver
>       0.08 =C2=B1 17%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.syscall_exit_to_user_mode
>       0.12 =C2=B1 13%      +0.0        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.__x64_sys_recvfrom
>       0.13 =C2=B1 10%      +0.0        0.16        perf-profile.self.cycl=
es-pp.ip_route_output_key_hash_rcu
>       0.08 =C2=B1 11%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.__cond_resched
>       0.07 =C2=B1 12%      +0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.nf_hook_slow
>       0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.netdev_core_pick_tx
>       0.04 =C2=B1 70%      +0.0        0.07        perf-profile.self.cycl=
es-pp._copy_from_user
>       0.04 =C2=B1 70%      +0.0        0.07        perf-profile.self.cycl=
es-pp.apparmor_ip_postroute
>       0.03 =C2=B1 70%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.__ip_local_out
>       0.03 =C2=B1 70%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.place_entity
>       0.31 =C2=B1  5%      +0.0        0.34 =C2=B1  2%  perf-profile.self=
.cycles-pp.switch_fpu_return
>       0.11 =C2=B1 12%      +0.0        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.ip_send_skb
>       0.09 =C2=B1  5%      +0.0        0.12        perf-profile.self.cycl=
es-pp._raw_spin_unlock_irqrestore
>       0.03 =C2=B1 70%      +0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.udp4_hwcsum
>       0.16 =C2=B1 10%      +0.0        0.20 =C2=B1  4%  perf-profile.self=
.cycles-pp.validate_xmit_skb
>       0.11 =C2=B1 20%      +0.0        0.15 =C2=B1  5%  perf-profile.self=
.cycles-pp.put_prev_entity
>       0.08 =C2=B1 17%      +0.0        0.12 =C2=B1  4%  perf-profile.self=
.cycles-pp.clear_buddies
>       0.12 =C2=B1 13%      +0.0        0.16 =C2=B1  5%  perf-profile.self=
.cycles-pp.__netif_receive_skb_one_core
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.validate_xmit_xfrm
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.skb_pull_rcsum
>       0.03 =C2=B1 70%      +0.0        0.07        perf-profile.self.cycl=
es-pp.save_fpregs_to_fpstate
>       0.12 =C2=B1 16%      +0.0        0.15 =C2=B1  8%  perf-profile.self=
.cycles-pp.__wrgsbase_inactive
>       0.10 =C2=B1 21%      +0.0        0.14 =C2=B1  6%  perf-profile.self=
.cycles-pp.sk_filter_trim_cap
>       0.16 =C2=B1 13%      +0.0        0.20 =C2=B1  4%  perf-profile.self=
.cycles-pp.ip_rcv
>       0.11 =C2=B1 19%      +0.0        0.15        perf-profile.self.cycl=
es-pp.ip_generic_getfrag
>       0.11 =C2=B1 17%      +0.0        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp._copy_from_iter
>       0.12 =C2=B1 16%      +0.0        0.16 =C2=B1  6%  perf-profile.self=
.cycles-pp.irqtime_account_irq
>       0.07 =C2=B1 20%      +0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.perf_trace_buf_alloc
>       0.07 =C2=B1 20%      +0.0        0.11        perf-profile.self.cycl=
es-pp.check_stack_object
>       0.07 =C2=B1 23%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.skb_network_protocol
>       0.16 =C2=B1 14%      +0.0        0.20 =C2=B1  2%  perf-profile.self=
.cycles-pp.dst_release
>       0.14 =C2=B1 13%      +0.0        0.18 =C2=B1  2%  perf-profile.self=
.cycles-pp.sock_sendmsg
>       0.28 =C2=B1 10%      +0.0        0.32 =C2=B1  4%  perf-profile.self=
.cycles-pp.kmem_cache_free
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1 14%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_safe_stack
>       0.17 =C2=B1 11%      +0.0        0.21 =C2=B1  3%  perf-profile.self=
.cycles-pp.__x64_sys_sendto
>       0.10 =C2=B1 19%      +0.0        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.__put_user_nocheck_4
>       0.04 =C2=B1 71%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.perf_trace_sched_switch
>       0.02 =C2=B1141%      +0.0        0.06        perf-profile.self.cycl=
es-pp.__cgroup_account_cputime
>       0.05 =C2=B1 70%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.rcu_note_context_switch
>       0.09 =C2=B1 27%      +0.0        0.14 =C2=B1 12%  perf-profile.self=
.cycles-pp.netif_skb_features
>       0.14 =C2=B1 17%      +0.0        0.19 =C2=B1  4%  perf-profile.self=
.cycles-pp.ip_protocol_deliver_rcu
>       0.14 =C2=B1 16%      +0.0        0.19 =C2=B1  4%  perf-profile.self=
.cycles-pp.ip_route_output_key_hash
>       0.12 =C2=B1 16%      +0.1        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.inet_recvmsg
>       0.04 =C2=B1 71%      +0.1        0.09 =C2=B1 13%  perf-profile.self=
.cycles-pp.security_sock_rcv_skb
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.switch_ldt
>       0.12 =C2=B1 18%      +0.1        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.udp4_csum_init
>       0.11 =C2=B1 17%      +0.1        0.16 =C2=B1  5%  perf-profile.self=
.cycles-pp._copy_to_iter
>       0.10 =C2=B1 21%      +0.1        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.check_preempt_wakeup
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.rcu_all_qs
>       0.12 =C2=B1 18%      +0.1        0.17 =C2=B1  5%  perf-profile.self=
.cycles-pp.schedule
>       0.40 =C2=B1 10%      +0.1        0.45 =C2=B1  4%  perf-profile.self=
.cycles-pp.aa_sk_perm
>       0.19 =C2=B1 14%      +0.1        0.24 =C2=B1  3%  perf-profile.self=
.cycles-pp.syscall_return_via_sysret
>       0.17 =C2=B1 16%      +0.1        0.23 =C2=B1  2%  perf-profile.self=
.cycles-pp.pick_next_entity
>       0.12 =C2=B1 17%      +0.1        0.17 =C2=B1  9%  perf-profile.self=
.cycles-pp.set_next_buddy
>       0.11 =C2=B1 14%      +0.1        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.dev_hard_start_xmit
>       0.22 =C2=B1 15%      +0.1        0.27 =C2=B1  4%  perf-profile.self=
.cycles-pp.__sys_recvfrom
>       0.16 =C2=B1 10%      +0.1        0.22 =C2=B1  5%  perf-profile.self=
.cycles-pp.enqueue_to_backlog
>       0.11 =C2=B1 17%      +0.1        0.17 =C2=B1  5%  perf-profile.self=
.cycles-pp.import_single_range
>       0.13 =C2=B1 16%      +0.1        0.19        perf-profile.self.cycl=
es-pp.memcg_slab_post_alloc_hook
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.self.cycl=
es-pp.netif_rx_internal
>       0.05 =C2=B1 71%      +0.1        0.12 =C2=B1  4%  perf-profile.self=
.cycles-pp.exit_to_user_mode_loop
>       0.31 =C2=B1  7%      +0.1        0.38 =C2=B1  2%  perf-profile.self=
.cycles-pp.kfree
>       0.17 =C2=B1 15%      +0.1        0.24 =C2=B1  5%  perf-profile.self=
.cycles-pp.siphash_3u32
>       0.22 =C2=B1 13%      +0.1        0.29 =C2=B1  4%  perf-profile.self=
.cycles-pp.__sys_sendto
>       0.26 =C2=B1 16%      +0.1        0.33        perf-profile.self.cycl=
es-pp.___perf_sw_event
>       0.16 =C2=B1 17%      +0.1        0.23 =C2=B1  5%  perf-profile.self=
.cycles-pp.ip_output
>       0.21 =C2=B1 14%      +0.1        0.29 =C2=B1  3%  perf-profile.self=
.cycles-pp.do_softirq
>       0.13 =C2=B1 21%      +0.1        0.20 =C2=B1  6%  perf-profile.self=
.cycles-pp.__might_fault
>       0.21 =C2=B1 15%      +0.1        0.28 =C2=B1  5%  perf-profile.self=
.cycles-pp.process_backlog
>       0.20 =C2=B1 17%      +0.1        0.27 =C2=B1  3%  perf-profile.self=
.cycles-pp.ip_rcv_core
>       0.23 =C2=B1 14%      +0.1        0.30 =C2=B1  3%  perf-profile.self=
.cycles-pp.memcg_slab_free_hook
>       0.12 =C2=B1 22%      +0.1        0.19 =C2=B1  6%  perf-profile.self=
.cycles-pp.ipv4_mtu
>       0.32 =C2=B1 15%      +0.1        0.39 =C2=B1  4%  perf-profile.self=
.cycles-pp.__softirqentry_text_start
>       0.21 =C2=B1 15%      +0.1        0.28 =C2=B1  4%  perf-profile.self=
.cycles-pp.__alloc_skb
>       0.38 =C2=B1 13%      +0.1        0.46 =C2=B1  3%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.20 =C2=B1 11%      +0.1        0.28 =C2=B1  4%  perf-profile.self=
.cycles-pp.__entry_text_start
>       0.33 =C2=B1 13%      +0.1        0.41 =C2=B1  4%  perf-profile.self=
.cycles-pp.net_rx_action
>       0.31 =C2=B1 14%      +0.1        0.40 =C2=B1  5%  perf-profile.self=
.cycles-pp.pick_next_task_fair
>       0.25 =C2=B1 13%      +0.1        0.33 =C2=B1  6%  perf-profile.self=
.cycles-pp.__might_sleep
>       0.22 =C2=B1 16%      +0.1        0.31 =C2=B1  4%  perf-profile.self=
.cycles-pp.__udp4_lib_lookup
>       0.17 =C2=B1 16%      +0.1        0.26 =C2=B1  3%  perf-profile.self=
.cycles-pp.exit_to_user_mode_prepare
>       0.12 =C2=B1 34%      +0.1        0.20 =C2=B1  2%  perf-profile.self=
.cycles-pp.ip_skb_dst_mtu
>       0.20 =C2=B1 17%      +0.1        0.29 =C2=B1  3%  perf-profile.self=
.cycles-pp.copy_user_enhanced_fast_string
>       0.47 =C2=B1 12%      +0.1        0.56 =C2=B1  3%  perf-profile.self=
.cycles-pp.restore_fpregs_from_fpstate
>       0.42 =C2=B1 10%      +0.1        0.51        perf-profile.self.cycl=
es-pp.__mkroute_output
>       0.28 =C2=B1 17%      +0.1        0.37 =C2=B1  5%  perf-profile.self=
.cycles-pp.__dev_queue_xmit
>       0.26 =C2=B1 13%      +0.1        0.35 =C2=B1  4%  perf-profile.self=
.cycles-pp.do_syscall_64
>       0.23 =C2=B1 19%      +0.1        0.33 =C2=B1  5%  perf-profile.self=
.cycles-pp.__local_bh_enable_ip
>       0.27 =C2=B1 22%      +0.1        0.36 =C2=B1  6%  perf-profile.self=
.cycles-pp.__virt_addr_valid
>       0.26 =C2=B1 16%      +0.1        0.36 =C2=B1  2%  perf-profile.self=
.cycles-pp.__kmalloc_node_track_caller
>       0.25 =C2=B1 19%      +0.1        0.35 =C2=B1  3%  perf-profile.self=
.cycles-pp.udp_send_skb
>       0.17 =C2=B1 15%      +0.1        0.26 =C2=B1  4%  perf-profile.self=
.cycles-pp.__calc_delta
>       0.23 =C2=B1 19%      +0.1        0.33 =C2=B1  3%  perf-profile.self=
.cycles-pp.__udp4_lib_rcv
>       0.22 =C2=B1 15%      +0.1        0.32 =C2=B1  5%  perf-profile.self=
.cycles-pp.__check_object_size
>       0.24 =C2=B1 18%      +0.1        0.34 =C2=B1  3%  perf-profile.self=
.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.40 =C2=B1 11%      +0.1        0.51 =C2=B1  3%  perf-profile.self=
.cycles-pp.ip_finish_output2
>       0.37 =C2=B1 14%      +0.1        0.47 =C2=B1  2%  perf-profile.self=
.cycles-pp.native_sched_clock
>       0.30 =C2=B1 15%      +0.1        0.41 =C2=B1  5%  perf-profile.self=
.cycles-pp.__check_heap_object
>       0.28 =C2=B1 15%      +0.1        0.40 =C2=B1  5%  perf-profile.self=
.cycles-pp.loopback_xmit
>       0.18 =C2=B1 22%      +0.1        0.30 =C2=B1  7%  perf-profile.self=
.cycles-pp.fib_lookup_good_nhc
>       0.39 =C2=B1 12%      +0.1        0.51 =C2=B1  4%  perf-profile.self=
.cycles-pp.__netif_receive_skb_core
>       0.31 =C2=B1 19%      +0.1        0.43 =C2=B1  2%  perf-profile.self=
.cycles-pp.os_xsave
>       0.43 =C2=B1 13%      +0.1        0.56 =C2=B1  4%  perf-profile.self=
.cycles-pp.__might_resched
>       0.34 =C2=B1 11%      +0.1        0.47 =C2=B1  5%  perf-profile.self=
.cycles-pp.select_idle_cpu
>       0.42 =C2=B1 15%      +0.2        0.59 =C2=B1  2%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.48 =C2=B1 20%      +0.2        0.67 =C2=B1 11%  perf-profile.self=
.cycles-pp.fib_table_lookup
>       0.82 =C2=B1 12%      +0.2        1.03 =C2=B1  2%  perf-profile.self=
.cycles-pp.udp_sendmsg
>       0.42 =C2=B1 18%      +0.2        0.65 =C2=B1  2%  perf-profile.self=
.cycles-pp.__ip_make_skb
>       0.49 =C2=B1 15%      +0.2        0.73 =C2=B1  2%  perf-profile.self=
.cycles-pp.__ip_append_data
>       0.41 =C2=B1 16%      +0.3        0.72 =C2=B1  5%  perf-profile.self=
.cycles-pp.skb_set_owner_w
>       0.18 =C2=B1 21%      +0.6        0.79 =C2=B1 12%  perf-profile.self=
.cycles-pp.ip_make_skb
>       1.20 =C2=B1 16%      +0.6        1.82 =C2=B1  2%  perf-profile.self=
.cycles-pp.switch_mm_irqs_off
>       0.77 =C2=B1 48%      +3.3        4.08 =C2=B1 17%  perf-profile.self=
.cycles-pp.sock_wfree
>       7.78 =C2=B1 44%     +33.0       40.76 =C2=B1  2%  perf-profile.self=
.cycles-pp.__ip_select_ident
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp9: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10=
GHz (Cascade Lake) with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
testcase/ucode:
>   gcc-11/performance/4BRD_12G/f2fs/x86_64-rhel-8.3/100/RAID0/debian-11.1-=
x86_64-20220510.cgz/lkp-csl-2sp9/sync_disk_rw/aim7/0x5003302
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>       9749            +6.5%      10387        aim7.jobs-per-min
>   86759760            -1.6%   85364176        aim7.time.file_system_outpu=
ts
>    1269506           -10.8%    1132964        aim7.time.involuntary_conte=
xt_switches
>       2921            +2.3%       2988        aim7.time.maximum_resident_=
set_size
>      10387           +14.2%      11863 =C2=B1  3%  aim7.time.minor_page_f=
aults
>     712.50           +39.1%     990.88 =C2=B1  2%  aim7.time.system_time
>   31987555            -1.9%   31366282        aim7.time.voluntary_context=
_switches
>  4.673e+09           -14.7%  3.987e+09        cpuidle..time
>      28.32            -1.0%      28.03        boot-time.boot
>      12.93            -2.0%      12.67        boot-time.dhcp
>      85.71            -7.6%      79.20        iostat.cpu.idle
>      13.90 =C2=B1  2%     +46.8%      20.40 =C2=B1  2%  iostat.cpu.system
>       0.08 =C2=B1  6%      +0.0        0.09 =C2=B1  6%  mpstat.cpu.all.so=
ft%
>      13.10 =C2=B1  2%      +6.6       19.75 =C2=B1  2%  mpstat.cpu.all.sy=
s%
>      28104 =C2=B1  6%     +23.3%      34665 =C2=B1  4%  meminfo.Active
>      22164 =C2=B1  8%     +33.9%      29672 =C2=B1  5%  meminfo.Active(an=
on)
>       5939           -15.9%       4993        meminfo.Active(file)
>      72519 =C2=B1  8%     +12.7%      81763        meminfo.AnonHugePages
>      24749 =C2=B1  7%     +35.3%      33496 =C2=B1  6%  meminfo.Shmem
>      85.33            -7.8%      78.67        vmstat.cpu.id
>     654639            +4.7%     685689        vmstat.io.bo
>      10.33 =C2=B1  4%     +45.2%      15.00 =C2=B1  5%  vmstat.procs.r
>    1092852            +3.0%    1125334        vmstat.system.cs
>     220699 =C2=B1  2%      +5.2%     232078 =C2=B1  2%  vmstat.system.in
>     506.00           +41.4%     715.33        turbostat.Avg_MHz
>      18.47            +7.6       26.07        turbostat.Busy%
>       4.45 =C2=B1  7%      +0.6        5.03 =C2=B1  4%  turbostat.C1%
>   34129387 =C2=B1  3%      -9.3%   30953483 =C2=B1  2%  turbostat.C1E
>      71.51 =C2=B1 12%     -12.8       58.69 =C2=B1 13%  turbostat.C1E%
>      79.60 =C2=B1  3%     -10.4%      71.36 =C2=B1  3%  turbostat.CPU%c1
>     160.22            +5.1%     168.46        turbostat.PkgWatt
>       5540 =C2=B1  8%     +33.9%       7418 =C2=B1  5%  proc-vmstat.nr_ac=
tive_anon
>       1485           -16.0%       1248        proc-vmstat.nr_active_file
>   10844787            -1.6%   10670427        proc-vmstat.nr_dirtied
>       7655            +5.5%       8076 =C2=B1  2%  proc-vmstat.nr_mapped
>       6186 =C2=B1  7%     +35.4%       8373 =C2=B1  6%  proc-vmstat.nr_sh=
mem
>   10801572            -1.6%   10628212        proc-vmstat.nr_written
>       5540 =C2=B1  8%     +33.9%       7418 =C2=B1  5%  proc-vmstat.nr_zo=
ne_active_anon
>       1485           -16.0%       1248        proc-vmstat.nr_zone_active_=
file
>       8604 =C2=B1  6%      +8.3%       9315        proc-vmstat.nr_zone_wr=
ite_pending
>       1661 =C2=B1  3%     +37.8%       2289 =C2=B1  5%  proc-vmstat.numa_=
hint_faults_local
>    8667658            +2.2%    8855812        proc-vmstat.numa_hit
>    8588048            +2.2%    8775931        proc-vmstat.numa_local
>      16101 =C2=B1  4%     +15.2%      18550 =C2=B1  2%  proc-vmstat.pgact=
ivate
>    8667724            +2.2%    8855572        proc-vmstat.pgalloc_normal
>       9865            -2.5%       9619        proc-vmstat.pgdeactivate
>   43206185            -1.6%   42512746        proc-vmstat.pgpgout
>      19722            -2.7%      19198        proc-vmstat.pgrotated
>     337.67 =C2=B1 16%     -26.3%     249.00 =C2=B1 22%  numa-vmstat.node0=
.nr_active_anon
>     820.33 =C2=B1 27%     -36.0%     524.67 =C2=B1 39%  numa-vmstat.node0=
.nr_active_file
>      36913 =C2=B1 10%     -31.5%      25290 =C2=B1 11%  numa-vmstat.node0=
.nr_anon_pages
>      37037 =C2=B1 10%     -31.3%      25447 =C2=B1 11%  numa-vmstat.node0=
.nr_inactive_anon
>       9681 =C2=B1  4%     -17.6%       7976 =C2=B1  4%  numa-vmstat.node0=
.nr_kernel_stack
>       1460 =C2=B1  8%     -65.6%     501.67 =C2=B1 16%  numa-vmstat.node0=
.nr_page_table_pages
>      26937 =C2=B1  2%      -8.8%      24574 =C2=B1  5%  numa-vmstat.node0=
.nr_slab_unreclaimable
>     337.67 =C2=B1 16%     -26.3%     249.00 =C2=B1 22%  numa-vmstat.node0=
.nr_zone_active_anon
>     820.33 =C2=B1 27%     -36.0%     524.67 =C2=B1 39%  numa-vmstat.node0=
.nr_zone_active_file
>      37037 =C2=B1 10%     -31.3%      25446 =C2=B1 11%  numa-vmstat.node0=
.nr_zone_inactive_anon
>       4394 =C2=B1  3%     +10.2%       4840 =C2=B1  2%  numa-vmstat.node0=
.nr_zone_write_pending
>       5203 =C2=B1  8%     +37.8%       7168 =C2=B1  5%  numa-vmstat.node1=
.nr_active_anon
>      29461 =C2=B1 14%     +39.6%      41126 =C2=B1  7%  numa-vmstat.node1=
.nr_anon_pages
>      30115 =C2=B1 13%     +39.1%      41894 =C2=B1  7%  numa-vmstat.node1=
.nr_inactive_anon
>       7527 =C2=B1  7%     +24.2%       9347 =C2=B1  2%  numa-vmstat.node1=
.nr_kernel_stack
>     461.00 =C2=B1 18%    +221.8%       1483 =C2=B1  9%  numa-vmstat.node1=
.nr_page_table_pages
>       5705 =C2=B1  8%     +39.4%       7956 =C2=B1  7%  numa-vmstat.node1=
.nr_shmem
>      19247 =C2=B1  2%     +11.4%      21449 =C2=B1  5%  numa-vmstat.node1=
.nr_slab_unreclaimable
>       5203 =C2=B1  8%     +37.8%       7168 =C2=B1  5%  numa-vmstat.node1=
.nr_zone_active_anon
>      30115 =C2=B1 13%     +39.1%      41894 =C2=B1  7%  numa-vmstat.node1=
.nr_zone_inactive_anon
>       4636 =C2=B1 23%     -33.2%       3095 =C2=B1 32%  numa-meminfo.node=
0.Active
>       1353 =C2=B1 16%     -26.3%     997.33 =C2=B1 22%  numa-meminfo.node=
0.Active(anon)
>       3283 =C2=B1 27%     -36.1%       2098 =C2=B1 39%  numa-meminfo.node=
0.Active(file)
>      45769 =C2=B1 12%     -33.6%      30406 =C2=B1 22%  numa-meminfo.node=
0.AnonHugePages
>     147656 =C2=B1 10%     -31.5%     101146 =C2=B1 11%  numa-meminfo.node=
0.AnonPages
>     160586 =C2=B1 13%     -28.0%     115562 =C2=B1  8%  numa-meminfo.node=
0.AnonPages.max
>     189933 =C2=B1  7%     -24.3%     143744 =C2=B1  8%  numa-meminfo.node=
0.Inactive
>     148153 =C2=B1 10%     -31.3%     101778 =C2=B1 11%  numa-meminfo.node=
0.Inactive(anon)
>       9684 =C2=B1  4%     -17.6%       7975 =C2=B1  4%  numa-meminfo.node=
0.KernelStack
>       5845 =C2=B1  8%     -65.7%       2007 =C2=B1 16%  numa-meminfo.node=
0.PageTables
>     107752 =C2=B1  2%      -8.8%      98301 =C2=B1  5%  numa-meminfo.node=
0.SUnreclaim
>      23478 =C2=B1  3%     +34.5%      31572 =C2=B1  7%  numa-meminfo.node=
1.Active
>      20814 =C2=B1  8%     +37.8%      28677 =C2=B1  5%  numa-meminfo.node=
1.Active(anon)
>      26844 =C2=B1 37%     +91.6%      51445 =C2=B1 13%  numa-meminfo.node=
1.AnonHugePages
>     117833 =C2=B1 14%     +39.6%     164494 =C2=B1  7%  numa-meminfo.node=
1.AnonPages
>     142736 =C2=B1 15%     +35.5%     193393 =C2=B1  4%  numa-meminfo.node=
1.AnonPages.max
>     162456 =C2=B1  9%     +28.5%     208708 =C2=B1  5%  numa-meminfo.node=
1.Inactive
>     120448 =C2=B1 13%     +39.1%     167564 =C2=B1  7%  numa-meminfo.node=
1.Inactive(anon)
>       7527 =C2=B1  7%     +24.2%       9347 =C2=B1  2%  numa-meminfo.node=
1.KernelStack
>       1844 =C2=B1 18%    +221.8%       5936 =C2=B1  9%  numa-meminfo.node=
1.PageTables
>      76992 =C2=B1  2%     +11.4%      85800 =C2=B1  5%  numa-meminfo.node=
1.SUnreclaim
>      22823 =C2=B1  8%     +39.4%      31822 =C2=B1  7%  numa-meminfo.node=
1.Shmem
>  3.493e+09           +25.3%  4.375e+09        perf-stat.i.branch-instruct=
ions
>   50285720 =C2=B1  3%     +26.9%   63807278        perf-stat.i.branch-mis=
ses
>   80825387           +12.3%   90754564        perf-stat.i.cache-misses
>  4.069e+08 =C2=B1  3%      +8.5%  4.414e+08        perf-stat.i.cache-refe=
rences
>    1151681            +3.7%    1193897        perf-stat.i.context-switches
>       2.77 =C2=B1  8%     +16.8%       3.23 =C2=B1  8%  perf-stat.i.cpi
>  4.524e+10           +42.5%  6.448e+10        perf-stat.i.cpu-cycles
>      31834           +78.7%      56883        perf-stat.i.cpu-migrations
>  4.876e+09           +25.0%  6.095e+09        perf-stat.i.dTLB-loads
>  2.039e+09            +9.3%  2.229e+09        perf-stat.i.dTLB-stores
>    3350086            +4.3%    3492997 =C2=B1  2%  perf-stat.i.iTLB-load-=
misses
>   15723942            +7.6%   16925655        perf-stat.i.iTLB-loads
>  1.738e+10           +25.2%  2.177e+10        perf-stat.i.instructions
>       5242           +15.4%       6048 =C2=B1  3%  perf-stat.i.instructio=
ns-per-iTLB-miss
>       0.41 =C2=B1  2%     -11.2%       0.36 =C2=B1  3%  perf-stat.i.ipc
>       2.23 =C2=B1  4%      +6.4%       2.37 =C2=B1  2%  perf-stat.i.major=
-faults
>       0.51           +42.5%       0.73        perf-stat.i.metric.GHz
>     856.86 =C2=B1  8%     +13.7%     974.61 =C2=B1  5%  perf-stat.i.metri=
c.K/sec
>     122.82           +21.5%     149.22        perf-stat.i.metric.M/sec
>       3023            +5.9%       3201 =C2=B1  2%  perf-stat.i.minor-faul=
ts
>   34736217           +12.2%   38977766        perf-stat.i.node-load-misses
>    3210085           +10.0%    3530511        perf-stat.i.node-loads
>   13449629           +15.8%   15572518        perf-stat.i.node-store-miss=
es
>    1094666            +4.2%    1141164        perf-stat.i.node-stores
>       3026            +5.9%       3204 =C2=B1  2%  perf-stat.i.page-faults
>      23.40 =C2=B1  2%     -13.4%      20.28        perf-stat.overall.MPKI
>      19.87            +0.7       20.56        perf-stat.overall.cache-mis=
s-rate%
>       2.60           +13.8%       2.96        perf-stat.overall.cpi
>     559.85           +26.9%     710.46        perf-stat.overall.cycles-be=
tween-cache-misses
>       5189           +20.2%       6237 =C2=B1  3%  perf-stat.overall.inst=
ructions-per-iTLB-miss
>       0.38           -12.1%       0.34        perf-stat.overall.ipc
>  3.437e+09           +25.1%    4.3e+09        perf-stat.ps.branch-instruc=
tions
>   49481438 =C2=B1  3%     +26.7%   62713154        perf-stat.ps.branch-mi=
sses
>   79527314           +12.2%   89199316        perf-stat.ps.cache-misses
>  4.004e+08 =C2=B1  3%      +8.3%  4.338e+08        perf-stat.ps.cache-ref=
erences
>    1133183            +3.6%    1173437        perf-stat.ps.context-switch=
es
>  4.452e+10           +42.4%  6.338e+10        perf-stat.ps.cpu-cycles
>      31323           +78.5%      55909        perf-stat.ps.cpu-migrations
>  4.798e+09           +24.8%   5.99e+09        perf-stat.ps.dTLB-loads
>  2.006e+09            +9.2%  2.191e+09        perf-stat.ps.dTLB-stores
>    3296414            +4.2%    3433242 =C2=B1  2%  perf-stat.ps.iTLB-load=
-misses
>   15471556            +7.5%   16635675        perf-stat.ps.iTLB-loads
>  1.711e+10           +25.1%  2.139e+10        perf-stat.ps.instructions
>       2.19 =C2=B1  4%      +6.3%       2.33 =C2=B1  2%  perf-stat.ps.majo=
r-faults
>       2973            +5.8%       3145 =C2=B1  2%  perf-stat.ps.minor-fau=
lts
>   34178254           +12.1%   38309762        perf-stat.ps.node-load-miss=
es
>    3158517            +9.9%    3469999        perf-stat.ps.node-loads
>   13233594           +15.7%   15305639        perf-stat.ps.node-store-mis=
ses
>    1077068            +4.1%    1121595        perf-stat.ps.node-stores
>       2975            +5.8%       3147 =C2=B1  2%  perf-stat.ps.page-faul=
ts
>  1.088e+12           +16.5%  1.268e+12        perf-stat.total.instructions
>      15177 =C2=B1 28%     -80.9%       2898 =C2=B1 10%  sched_debug.cfs_r=
q:/.load.avg
>     386856 =C2=B1 59%     -91.4%      33109 =C2=B1 24%  sched_debug.cfs_r=
q:/.load.max
>      54566 =C2=B1 47%     -86.3%       7471 =C2=B1 12%  sched_debug.cfs_r=
q:/.load.stddev
>     606.17 =C2=B1  6%     +69.3%       1026        sched_debug.cfs_rq:/.l=
oad_avg.max
>       1.33 =C2=B1 17%    -100.0%       0.00        sched_debug.cfs_rq:/.l=
oad_avg.min
>     138.88 =C2=B1  9%     +55.9%     216.47 =C2=B1 16%  sched_debug.cfs_r=
q:/.load_avg.stddev
>      65375 =C2=B1  7%     -82.5%      11450 =C2=B1 14%  sched_debug.cfs_r=
q:/.min_vruntime.avg
>      97202 =C2=B1  5%     -61.7%      37186 =C2=B1 24%  sched_debug.cfs_r=
q:/.min_vruntime.max
>      56610 =C2=B1  4%     -91.2%       4979 =C2=B1 41%  sched_debug.cfs_r=
q:/.min_vruntime.min
>       5401 =C2=B1  7%     -16.6%       4506 =C2=B1 16%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>     512.00          +100.0%       1024        sched_debug.cfs_rq:/.remove=
d.load_avg.max
>     264.67           +95.3%     517.00        sched_debug.cfs_rq:/.remove=
d.runnable_avg.max
>      43.97 =C2=B1 22%     +75.6%      77.20 =C2=B1 28%  sched_debug.cfs_r=
q:/.removed.runnable_avg.stddev
>     264.50           +95.5%     517.00        sched_debug.cfs_rq:/.remove=
d.util_avg.max
>      43.96 =C2=B1 22%     +75.6%      77.20 =C2=B1 28%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>     241.69 =C2=B1  4%     +40.6%     339.93 =C2=B1  2%  sched_debug.cfs_r=
q:/.runnable_avg.avg
>       1047 =C2=B1 15%     +33.8%       1402 =C2=B1 15%  sched_debug.cfs_r=
q:/.runnable_avg.max
>       3.83 =C2=B1 60%    -100.0%       0.00        sched_debug.cfs_rq:/.r=
unnable_avg.min
>     212.17 =C2=B1  5%     +54.9%     328.62        sched_debug.cfs_rq:/.r=
unnable_avg.stddev
>      16.78 =C2=B114658%  -34975.8%      -5852        sched_debug.cfs_rq:/=
.spread0.avg
>      31826 =C2=B1 14%     -37.7%      19820 =C2=B1 32%  sched_debug.cfs_r=
q:/.spread0.max
>      -8726           +40.7%     -12278        sched_debug.cfs_rq:/.spread=
0.min
>       5399 =C2=B1  7%     -16.6%       4502 =C2=B1 16%  sched_debug.cfs_r=
q:/.spread0.stddev
>     240.18 =C2=B1  5%     +41.4%     339.71 =C2=B1  2%  sched_debug.cfs_r=
q:/.util_avg.avg
>       1047 =C2=B1 15%     +33.9%       1402 =C2=B1 15%  sched_debug.cfs_r=
q:/.util_avg.max
>       4.00 =C2=B1 54%    -100.0%       0.00        sched_debug.cfs_rq:/.u=
til_avg.min
>     211.17 =C2=B1  5%     +55.6%     328.60        sched_debug.cfs_rq:/.u=
til_avg.stddev
>     525.33           +48.2%     778.33        sched_debug.cfs_rq:/.util_e=
st_enqueued.max
>      90.71 =C2=B1  8%     +39.5%     126.50 =C2=B1  7%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>     443281 =C2=B1  3%     +73.9%     770976 =C2=B1  2%  sched_debug.cpu.a=
vg_idle.avg
>      17942 =C2=B1 34%     -83.1%       3032 =C2=B1 17%  sched_debug.cpu.a=
vg_idle.min
>     179123 =C2=B1  5%     +51.9%     272125 =C2=B1  8%  sched_debug.cpu.a=
vg_idle.stddev
>      62794           -47.5%      32941        sched_debug.cpu.clock.avg
>      62798           -47.5%      32944        sched_debug.cpu.clock.max
>      62790           -47.5%      32936        sched_debug.cpu.clock.min
>      62429           -47.3%      32912        sched_debug.cpu.clock_task.=
avg
>      62471           -47.3%      32932        sched_debug.cpu.clock_task.=
max
>      62020           -47.6%      32515        sched_debug.cpu.clock_task.=
min
>     782.34 =C2=B1 13%     -32.3%     529.60 =C2=B1 14%  sched_debug.cpu.c=
urr->pid.avg
>       5465           -24.5%       4129        sched_debug.cpu.curr->pid.m=
ax
>       1703 =C2=B1  4%     -21.4%       1339 =C2=B1  6%  sched_debug.cpu.c=
urr->pid.stddev
>     665986 =C2=B1  2%     +55.4%    1034659 =C2=B1 38%  sched_debug.cpu.m=
ax_idle_balance_cost.max
>      17784 =C2=B1 10%    +221.8%      57233 =C2=B1 72%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>       0.00 =C2=B1 13%     +28.3%       0.00 =C2=B1  6%  sched_debug.cpu.n=
ext_balance.stddev
>     391989           -99.3%       2569        sched_debug.cpu.nr_switches=
.avg
>     436488 =C2=B1  2%     -90.8%      40211 =C2=B1 15%  sched_debug.cpu.n=
r_switches.max
>     375106 =C2=B1  2%     -99.9%     411.67 =C2=B1  5%  sched_debug.cpu.n=
r_switches.min
>      11615 =C2=B1 16%     -59.8%       4672 =C2=B1 10%  sched_debug.cpu.n=
r_switches.stddev
>      23.50 =C2=B1128%    -100.0%       0.00        sched_debug.cpu.nr_uni=
nterruptible.min
>      62790           -47.5%      32938        sched_debug.cpu_clk
>      62217           -48.0%      32366        sched_debug.ktime
>      63720           -46.7%      33988        sched_debug.sched_clk
>      49.79            -6.9       42.89        perf-profile.calltrace.cycl=
es-pp.secondary_startup_64_no_verify
>      45.59            -6.7       38.86        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_start=
up_entry
>      41.10            -6.7       34.40        perf-profile.calltrace.cycl=
es-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>      46.24            -6.7       39.55        perf-profile.calltrace.cycl=
es-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary=
_startup_64_no_verify
>      41.08            -6.7       34.39        perf-profile.calltrace.cycl=
es-pp.mwait_idle_with_hints.intel_idle.cpuidle_enter_state.cpuidle_enter.cp=
uidle_idle_call
>      49.13            -6.7       42.45        perf-profile.calltrace.cycl=
es-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      49.13            -6.7       42.45        perf-profile.calltrace.cycl=
es-pp.start_secondary.secondary_startup_64_no_verify
>      49.10            -6.7       42.43        perf-profile.calltrace.cycl=
es-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_ver=
ify
>      45.22            -6.5       38.71        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secon=
dary
>       1.73            -0.6        1.08 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.rwsem_wake.__write_node_page.f2fs_fsync_node_pages.f2fs_do_sync_=
file.f2fs_file_write_iter
>       1.25            -0.5        0.71        perf-profile.calltrace.cycl=
es-pp.wake_up_q.rwsem_wake.__write_node_page.f2fs_fsync_node_pages.f2fs_do_=
sync_file
>       1.22            -0.5        0.68 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.try_to_wake_up.wake_up_q.rwsem_wake.__write_node_page.f2fs_fsync=
_node_pages
>       1.29            -0.4        0.89        perf-profile.calltrace.cycl=
es-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_sta=
rtup_64_no_verify
>       1.26            -0.4        0.87 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_seconda=
ry
>       2.02            -0.4        1.66 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.pagevec_lookup_range_tag.f2fs_fsync_node_pages.f2fs_do_sync_file=
.f2fs_file_write_iter.new_sync_write
>       2.02            -0.4        1.66 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.find_get_pages_range_tag.pagevec_lookup_range_tag.f2fs_fsync_nod=
e_pages.f2fs_do_sync_file.f2fs_file_write_iter
>       1.35            -0.3        1.02        perf-profile.calltrace.cycl=
es-pp.ret_from_fork
>       1.35            -0.3        1.02        perf-profile.calltrace.cycl=
es-pp.kthread.ret_from_fork
>       0.97            -0.3        0.64 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_ente=
r.cpuidle_idle_call.do_idle
>       0.89            -0.3        0.59 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpui=
dle_enter_state.cpuidle_enter.cpuidle_idle_call
>       0.80            -0.2        0.57        perf-profile.calltrace.cycl=
es-pp.issue_flush_thread.kthread.ret_from_fork
>       2.71            -0.2        2.49        perf-profile.calltrace.cycl=
es-pp.f2fs_need_inode_block_update.f2fs_do_sync_file.f2fs_file_write_iter.n=
ew_sync_write.vfs_write
>       0.93            -0.2        0.77 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.__submit_merged_bio.__submit_merged_write_cond.f2fs_write_cache_=
pages.__f2fs_write_data_pages.do_writepages
>       2.36 =C2=B1  3%      -0.2        2.19 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.f2fs_issue_flush.f2fs_do_sync_file.f2fs_file_write_iter.new=
_sync_write.vfs_write
>       0.90            -0.2        0.74 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__submit_bio_noacct.__submit_merged_bio.__submit_merged_write_co=
nd.f2fs_write_cache_pages.__f2fs_write_data_pages
>       0.89            -0.2        0.73 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__submit_bio.__submit_bio_noacct.__submit_merged_bio.__submit_me=
rged_write_cond.f2fs_write_cache_pages
>       0.85 =C2=B1  3%      -0.2        0.70 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.sta=
rt_secondary
>       2.43            -0.2        2.27        perf-profile.calltrace.cycl=
es-pp.rwsem_down_read_slowpath.f2fs_need_inode_block_update.f2fs_do_sync_fi=
le.f2fs_file_write_iter.new_sync_write
>       1.43            -0.1        1.29 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.f2fs_buffered_write_iter.f2fs_file_write_iter.new_sync_write.vfs=
_write.ksys_write
>       1.41            -0.1        1.27 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.generic_perform_write.f2fs_buffered_write_iter.f2fs_file_write_i=
ter.new_sync_write.vfs_write
>       1.39 =C2=B1  3%      -0.1        1.25 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.schedule.rwsem_down_write_slowpath.set_node_addr.__write_no=
de_page.f2fs_fsync_node_pages
>       1.38 =C2=B1  3%      -0.1        1.25 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.rwsem_down_write_slowpath.set_node_addr=
.__write_node_page
>       0.75            -0.1        0.64 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__submit_merged_bio.__submit_merged_write_cond.f2fs_fsync_node_p=
ages.f2fs_do_sync_file.f2fs_file_write_iter
>       0.74            -0.1        0.63        perf-profile.calltrace.cycl=
es-pp.__submit_bio.__submit_bio_noacct.__submit_merged_bio.__submit_merged_=
write_cond.f2fs_fsync_node_pages
>       0.75            -0.1        0.64 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__submit_bio_noacct.__submit_merged_bio.__submit_merged_write_co=
nd.f2fs_fsync_node_pages.f2fs_do_sync_file
>       2.75            -0.1        2.65        perf-profile.calltrace.cycl=
es-pp.__submit_merged_write_cond.f2fs_write_cache_pages.__f2fs_write_data_p=
ages.do_writepages.filemap_fdatawrite_wbc
>       0.64 =C2=B1  2%      -0.1        0.55 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__pagevec_release.f2fs_fsync_node_pages.f2fs_do_sync_file.f=
2fs_file_write_iter.new_sync_write
>       0.63 =C2=B1  2%      -0.1        0.54 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.release_pages.__pagevec_release.f2fs_fsync_node_pages.f2fs_=
do_sync_file.f2fs_file_write_iter
>       1.99 =C2=B1  3%      -0.1        1.91 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__wait_for_common.f2fs_issue_flush.f2fs_do_sync_file.f2fs_f=
ile_write_iter.new_sync_write
>       1.06 =C2=B1  2%      -0.1        0.98 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.schedule.rwsem_down_read_slowpath.f2fs_need_inode_block_upd=
ate.f2fs_do_sync_file.f2fs_file_write_iter
>       1.04 =C2=B1  2%      -0.1        0.96 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.rwsem_down_read_slowpath.f2fs_need_inod=
e_block_update.f2fs_do_sync_file
>       1.04 =C2=B1  5%      -0.1        0.96 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.rws=
em_down_write_slowpath
>       1.04 =C2=B1  5%      -0.1        0.97 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair.__schedule.schedule.rwsem_down_write_sl=
owpath.set_node_addr
>       0.91            -0.1        0.85 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.__submit_merged_=
write_cond.f2fs_write_cache_pages.__f2fs_write_data_pages
>       0.63            -0.1        0.56 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.f2fs_write_begin.generic_perform_write.f2fs_buffered_write_iter.=
f2fs_file_write_iter.new_sync_write
>       0.87 =C2=B1  3%      -0.1        0.82 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair.__schedule.schedule.rwsem_down_read_slo=
wpath.f2fs_need_inode_block_update
>       0.94 =C2=B1  2%      -0.0        0.89 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.rwsem_down_write_slowpath.__submit_merged_write_cond.f2fs_w=
rite_cache_pages.__f2fs_write_data_pages.do_writepages
>       0.68 =C2=B1  2%      -0.0        0.63 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.__=
submit_merged_write_cond.f2fs_write_cache_pages
>       1.66 =C2=B1  3%      +0.1        1.72        perf-profile.calltrace=
.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.set_node_addr.__=
write_node_page.f2fs_fsync_node_pages
>       1.22 =C2=B1  3%      +0.1        1.31 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.se=
t_node_addr.__write_node_page
>       1.77            +0.2        1.93        perf-profile.calltrace.cycl=
es-pp.f2fs_get_node_info.f2fs_do_write_data_page.f2fs_write_single_data_pag=
e.f2fs_write_cache_pages.__f2fs_write_data_pages
>       0.91 =C2=B1  6%      +0.2        1.07        perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.f2fs_is_checkpointed=
_node.f2fs_do_sync_file.f2fs_file_write_iter
>       0.87 =C2=B1  7%      +0.2        1.04        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_r=
ead_slowpath.f2fs_is_checkpointed_node.f2fs_do_sync_file
>       2.54            +0.2        2.73        perf-profile.calltrace.cycl=
es-pp.f2fs_is_checkpointed_node.f2fs_do_sync_file.f2fs_file_write_iter.new_=
sync_write.vfs_write
>       1.56            +0.2        1.76        perf-profile.calltrace.cycl=
es-pp.rwsem_down_read_slowpath.f2fs_get_node_info.f2fs_do_write_data_page.f=
2fs_write_single_data_page.f2fs_write_cache_pages
>       1.04 =C2=B1  2%      +0.2        1.25 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.rwsem_down_read_slowpath.f2fs_get_node_=
info.__write_node_page
>       1.05 =C2=B1  2%      +0.2        1.26 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.schedule.rwsem_down_read_slowpath.f2fs_get_node_info.__writ=
e_node_page.f2fs_fsync_node_pages
>       0.62 =C2=B1  2%      +0.2        0.83        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_r=
ead_slowpath.f2fs_get_node_info.f2fs_do_write_data_page
>       0.64 =C2=B1  2%      +0.2        0.86        perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.f2fs_get_node_info.f=
2fs_do_write_data_page.f2fs_write_single_data_page
>       1.65 =C2=B1  3%      +0.2        1.87 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.mwait_idle_with_hints.intel=
_idle_irq.cpuidle_enter_state.cpuidle_enter
>       4.72 =C2=B1  2%      +0.2        4.96        perf-profile.calltrace=
.cycles-pp.set_node_addr.__write_node_page.f2fs_fsync_node_pages.f2fs_do_sy=
nc_file.f2fs_file_write_iter
>       1.42 =C2=B1  3%      +0.2        1.67 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair.__schedule.schedule.rwsem_down_read_slo=
wpath.f2fs_get_node_info
>       4.46 =C2=B1  2%      +0.3        4.75        perf-profile.calltrace=
.cycles-pp.rwsem_down_write_slowpath.set_node_addr.__write_node_page.f2fs_f=
sync_node_pages.f2fs_do_sync_file
>       0.36 =C2=B1 70%      +0.3        0.67 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.rwsem_down_read_slowpath.__submit_merged_write_cond.f2fs_wr=
ite_cache_pages.__f2fs_write_data_pages.do_writepages
>       3.13 =C2=B1  5%      +0.4        3.50 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_id=
le_call.do_idle
>       1.19 =C2=B1  7%      +0.4        1.60        perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.rwsem_down_write_slowpath.set_node_addr.__wri=
te_node_page.f2fs_fsync_node_pages
>       1.13 =C2=B1  7%      +0.4        1.54        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_w=
rite_slowpath.set_node_addr.__write_node_page
>       0.71 =C2=B1  7%      +0.4        1.15        perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.f2fs_get_node_info._=
_write_node_page.f2fs_fsync_node_pages
>       0.67 =C2=B1  8%      +0.4        1.11        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_r=
ead_slowpath.f2fs_get_node_info.__write_node_page
>       4.03 =C2=B1  5%      +0.5        4.52 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.f2fs_submit=
_page_write.do_write_page.f2fs_outplace_write_data
>       0.74            +0.5        1.23        perf-profile.calltrace.cycl=
es-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_startup_=
entry.start_secondary
>       2.04 =C2=B1  3%      +0.5        2.54        perf-profile.calltrace=
.cycles-pp.rwsem_down_read_slowpath.f2fs_fsync_node_pages.f2fs_do_sync_file=
.f2fs_file_write_iter.new_sync_write
>       0.74 =C2=B1  7%      +0.5        1.25        perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.f2fs_fsync_node_page=
s.f2fs_do_sync_file.f2fs_file_write_iter
>       0.69 =C2=B1  7%      +0.5        1.21        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_r=
ead_slowpath.f2fs_fsync_node_pages.f2fs_do_sync_file
>       0.00            +0.5        0.53        perf-profile.calltrace.cycl=
es-pp.mutex_spin_on_owner.__mutex_lock.f2fs_allocate_data_block.do_write_pa=
ge.f2fs_do_write_node_page
>       4.43 =C2=B1  4%      +0.5        4.97 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.f2fs_submit_page_write.do_write_page.f2fs_outplace_write_da=
ta.f2fs_do_write_data_page.f2fs_write_single_data_page
>       0.00            +0.5        0.54 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.rwsem_down_write_slowpath.__submit_merged_write_cond.f2fs_fsync_=
node_pages.f2fs_do_sync_file.f2fs_file_write_iter
>       1.13 =C2=B1  2%      +0.5        1.68 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.sta=
rt_secondary.secondary_startup_64_no_verify
>       4.15 =C2=B1  5%      +0.6        4.72 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.rwsem_down_write_slowpath.f2fs_submit_page_write.do_write_p=
age.f2fs_outplace_write_data.f2fs_do_write_data_page
>       2.21 =C2=B1  3%      +0.6        2.81 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.f2fs_get_node_info.__write_node_page.f2fs_fsync_node_pages.=
f2fs_do_sync_file.f2fs_file_write_iter
>       1.98 =C2=B1  3%      +0.6        2.60 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.rwsem_down_read_slowpath.f2fs_get_node_info.__write_node_pa=
ge.f2fs_fsync_node_pages.f2fs_do_sync_file
>       0.00            +0.7        0.68        perf-profile.calltrace.cycl=
es-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.=
flush_smp_call_function_queue
>       0.00            +0.8        0.84        perf-profile.calltrace.cycl=
es-pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_=
function_queue.do_idle
>       0.00            +0.9        0.87        perf-profile.calltrace.cycl=
es-pp.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_function_queue.do_=
idle.cpu_startup_entry
>       1.62 =C2=B1  6%      +1.0        2.66 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.f2fs_space_for_roll_forward.f2fs_do_sync_file.f2fs_file_wri=
te_iter.new_sync_write.vfs_write
>       1.57 =C2=B1  6%      +1.0        2.62 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__percpu_counter_sum.f2fs_space_for_roll_forward.f2fs_do_sy=
nc_file.f2fs_file_write_iter.new_sync_write
>       0.94 =C2=B1  9%      +1.1        2.04 =C2=B1  4%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.__percpu_counter_sum.f2fs_space_for_=
roll_forward.f2fs_do_sync_file.f2fs_file_write_iter
>       0.90 =C2=B1  9%      +1.1        2.00 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.__p=
ercpu_counter_sum.f2fs_space_for_roll_forward.f2fs_do_sync_file
>       0.70            +1.5        2.20 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.osq_lock.__mutex_lock.f2fs_allocate_data_block.do_write_page.f2f=
s_outplace_write_data
>       1.01            +1.6        2.66 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.__mutex_lock.f2fs_allocate_data_block.do_write_page.f2fs_outplac=
e_write_data.f2fs_do_write_data_page
>       1.78 =C2=B1  2%      +1.7        3.50 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.f2fs_allocate_data_block.do_write_page.f2fs_outplace_write_=
data.f2fs_do_write_data_page.f2fs_write_single_data_page
>       1.67 =C2=B1  2%      +2.0        3.71 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.osq_lock.__mutex_lock.f2fs_allocate_data_block.do_write_pag=
e.f2fs_do_write_node_page
>       3.02 =C2=B1  2%      +2.2        5.17 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.f2fs_allocate_data_block.do_write_page.f2fs_do_write_node_p=
age.__write_node_page.f2fs_fsync_node_pages
>       2.17 =C2=B1  2%      +2.2        4.33 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__mutex_lock.f2fs_allocate_data_block.do_write_page.f2fs_do=
_write_node_page.__write_node_page
>       2.48 =C2=B1  5%      +2.2        4.65 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.f2fs_submit=
_page_write.do_write_page.f2fs_do_write_node_page
>      12.96            +2.2       15.15 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.file_write_and_wait_range.f2fs_do_sync_file.f2fs_file_write_iter=
.new_sync_write.vfs_write
>      12.90            +2.2       15.10 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.f2fs_do_syn=
c_file.f2fs_file_write_iter.new_sync_write
>      12.89            +2.2       15.09 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_write_and=
_wait_range.f2fs_do_sync_file.f2fs_file_write_iter
>      12.86            +2.2       15.06 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.=
file_write_and_wait_range.f2fs_do_sync_file
>      12.85            +2.2       15.05 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__f2fs_write_data_pages.do_writepages.filemap_fdatawrite_wbc.__f=
ilemap_fdatawrite_range.file_write_and_wait_range
>      12.72            +2.2       14.93 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.f2fs_write_cache_pages.__f2fs_write_data_pages.do_writepages.fil=
emap_fdatawrite_wbc.__filemap_fdatawrite_range
>       2.97 =C2=B1  4%      +2.2        5.22 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.f2fs_submit_page_write.do_write_page.f2fs_do_write_node_pag=
e.__write_node_page.f2fs_fsync_node_pages
>       6.76 =C2=B1  3%      +2.3        9.01 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.f2fs_outplace_write_data.f2fs_do_write_data_page.f2fs_write=
_single_data_page.f2fs_write_cache_pages.__f2fs_write_data_pages
>       6.41 =C2=B1  2%      +2.3        8.68 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.do_write_page.f2fs_outplace_write_data.f2fs_do_write_data_p=
age.f2fs_write_single_data_page.f2fs_write_cache_pages
>       2.68 =C2=B1  5%      +2.3        4.96 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.rwsem_down_write_slowpath.f2fs_submit_page_write.do_write_p=
age.f2fs_do_write_node_page.__write_node_page
>       9.43            +2.4       11.78 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.f2fs_write_single_data_page.f2fs_write_cache_pages.__f2fs_write_=
data_pages.do_writepages.filemap_fdatawrite_wbc
>       9.21            +2.4       11.59 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.f2fs_do_write_data_page.f2fs_write_single_data_page.f2fs_write_c=
ache_pages.__f2fs_write_data_pages.do_writepages
>       5.34 =C2=B1  5%      +2.8        8.10 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.f2=
fs_submit_page_write.do_write_page
>       6.26            +4.4       10.65 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.f2fs_do_write_node_page.__write_node_page.f2fs_fsync_node_pages.=
f2fs_do_sync_file.f2fs_file_write_iter
>       6.25            +4.4       10.64 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.do_write_page.f2fs_do_write_node_page.__write_node_page.f2fs_fsy=
nc_node_pages.f2fs_do_sync_file
>      23.20            +4.6       27.76        perf-profile.calltrace.cycl=
es-pp.f2fs_fsync_node_pages.f2fs_do_sync_file.f2fs_file_write_iter.new_sync=
_write.vfs_write
>      15.68            +4.6       20.32        perf-profile.calltrace.cycl=
es-pp.__write_node_page.f2fs_fsync_node_pages.f2fs_do_sync_file.f2fs_file_w=
rite_iter.new_sync_write
>      48.19            +7.3       55.49        perf-profile.calltrace.cycl=
es-pp.write
>      47.93            +7.3       55.24        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      47.94            +7.3       55.26        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.write
>      47.84            +7.3       55.17        perf-profile.calltrace.cycl=
es-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      47.83            +7.3       55.16        perf-profile.calltrace.cycl=
es-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wri=
te
>      47.72            +7.3       55.07        perf-profile.calltrace.cycl=
es-pp.f2fs_file_write_iter.new_sync_write.vfs_write.ksys_write.do_syscall_64
>      47.74            +7.3       55.09        perf-profile.calltrace.cycl=
es-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>      46.03            +7.5       53.58        perf-profile.calltrace.cycl=
es-pp.f2fs_do_sync_file.f2fs_file_write_iter.new_sync_write.vfs_write.ksys_=
write
>      46.87            -6.9       39.97        perf-profile.children.cycle=
s-pp.cpuidle_idle_call
>      49.79            -6.9       42.89        perf-profile.children.cycle=
s-pp.secondary_startup_64_no_verify
>      49.79            -6.9       42.89        perf-profile.children.cycle=
s-pp.cpu_startup_entry
>      49.77            -6.9       42.88        perf-profile.children.cycle=
s-pp.do_idle
>      45.84            -6.7       39.12        perf-profile.children.cycle=
s-pp.cpuidle_enter
>      45.82            -6.7       39.11        perf-profile.children.cycle=
s-pp.cpuidle_enter_state
>      49.13            -6.7       42.45        perf-profile.children.cycle=
s-pp.start_secondary
>      41.26            -6.7       34.58        perf-profile.children.cycle=
s-pp.intel_idle
>      44.39            -6.3       38.11        perf-profile.children.cycle=
s-pp.mwait_idle_with_hints
>       2.50            -0.9        1.56        perf-profile.children.cycle=
s-pp.try_to_wake_up
>       2.62            -0.9        1.74        perf-profile.children.cycle=
s-pp.rwsem_wake
>       2.15 =C2=B1  2%      -0.9        1.28        perf-profile.children.=
cycles-pp.wake_up_q
>       1.30            -0.4        0.90 =C2=B1  2%  perf-profile.children.=
cycles-pp.schedule_idle
>       2.21            -0.4        1.84 =C2=B1  2%  perf-profile.children.=
cycles-pp.__submit_bio_noacct
>       2.21            -0.4        1.84 =C2=B1  2%  perf-profile.children.=
cycles-pp.__submit_bio
>       2.08            -0.4        1.71 =C2=B1  2%  perf-profile.children.=
cycles-pp.pagevec_lookup_range_tag
>       2.07            -0.4        1.71 =C2=B1  2%  perf-profile.children.=
cycles-pp.find_get_pages_range_tag
>      10.95 =C2=B1  2%      -0.4       10.60 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__schedule
>       1.35            -0.3        1.02        perf-profile.children.cycle=
s-pp.ret_from_fork
>       1.35            -0.3        1.02        perf-profile.children.cycle=
s-pp.kthread
>       1.39            -0.3        1.09 =C2=B1  4%  perf-profile.children.=
cycles-pp.sysvec_apic_timer_interrupt
>       1.69            -0.3        1.42 =C2=B1  2%  perf-profile.children.=
cycles-pp.__submit_merged_bio
>       1.00            -0.2        0.77 =C2=B1  6%  perf-profile.children.=
cycles-pp.__sysvec_apic_timer_interrupt
>       0.99 =C2=B1  2%      -0.2        0.75 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       0.80            -0.2        0.57        perf-profile.children.cycle=
s-pp.issue_flush_thread
>       0.66 =C2=B1 14%      -0.2        0.44 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.start_kernel
>       0.66 =C2=B1 14%      -0.2        0.44 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.arch_call_rest_init
>       0.66 =C2=B1 14%      -0.2        0.44 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.rest_init
>       2.71            -0.2        2.49        perf-profile.children.cycle=
s-pp.f2fs_need_inode_block_update
>       2.23            -0.2        2.02 =C2=B1  4%  perf-profile.children.=
cycles-pp.asm_sysvec_apic_timer_interrupt
>       1.05            -0.2        0.86        perf-profile.children.cycle=
s-pp.brd_submit_bio
>       1.04            -0.2        0.85        perf-profile.children.cycle=
s-pp.brd_do_bvec
>       2.36 =C2=B1  3%      -0.2        2.19 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.f2fs_issue_flush
>       0.87 =C2=B1  3%      -0.2        0.71 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.menu_select
>       1.43            -0.1        1.29 =C2=B1  3%  perf-profile.children.=
cycles-pp.f2fs_buffered_write_iter
>       0.30 =C2=B1  3%      -0.1        0.16        perf-profile.children.=
cycles-pp.set_next_entity
>       1.42            -0.1        1.28 =C2=B1  3%  perf-profile.children.=
cycles-pp.generic_perform_write
>       0.44 =C2=B1  5%      -0.1        0.30        perf-profile.children.=
cycles-pp.update_rq_clock
>       1.15 =C2=B1  2%      -0.1        1.02 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       0.53 =C2=B1  2%      -0.1        0.41 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       1.12 =C2=B1  2%      -0.1        1.00 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       0.44 =C2=B1  4%      -0.1        0.33 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       0.56            -0.1        0.45 =C2=B1  2%  perf-profile.children.=
cycles-pp.brd_insert_page
>       2.11 =C2=B1  3%      -0.1        2.00 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__wait_for_common
>       0.54            -0.1        0.44 =C2=B1  4%  perf-profile.children.=
cycles-pp.__hrtimer_run_queues
>       0.41 =C2=B1  3%      -0.1        0.31 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__submit_flush_wait
>       0.40 =C2=B1  2%      -0.1        0.30 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.blkdev_issue_flush
>       0.35 =C2=B1  7%      -0.1        0.25 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       0.39 =C2=B1  2%      -0.1        0.29 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.submit_bio_wait
>       0.68 =C2=B1  2%      -0.1        0.58 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__pagevec_release
>       0.41 =C2=B1  2%      -0.1        0.32 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.md_submit_bio
>       0.66 =C2=B1  2%      -0.1        0.57 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.release_pages
>       0.53            -0.1        0.44        perf-profile.children.cycle=
s-pp.rwsem_mark_wake
>       0.35 =C2=B1  2%      -0.1        0.27 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.md_handle_request
>       0.66            -0.1        0.59 =C2=B1  2%  perf-profile.children.=
cycles-pp.f2fs_write_end_io
>       0.39            -0.1        0.32 =C2=B1  3%  perf-profile.children.=
cycles-pp.tick_sched_timer
>       0.11 =C2=B1  4%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.ttwu_do_wakeup
>       4.84            -0.1        4.76        perf-profile.children.cycle=
s-pp.__submit_merged_write_cond
>       0.31 =C2=B1  3%      -0.1        0.24 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.raid0_make_request
>       0.10            -0.1        0.03 =C2=B1 70%  perf-profile.children.=
cycles-pp.check_preempt_curr
>       0.26            -0.1        0.20        perf-profile.children.cycle=
s-pp.__switch_to
>       0.24 =C2=B1  6%      -0.1        0.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.submit_flushes
>       0.63            -0.1        0.56 =C2=B1  2%  perf-profile.children.=
cycles-pp.f2fs_write_begin
>       0.38 =C2=B1  4%      -0.1        0.32 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__get_node_page
>       0.15 =C2=B1  3%      -0.1        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.switch_mm_irqs_off
>       0.73 =C2=B1  3%      -0.1        0.68 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.down_read
>       0.35 =C2=B1  8%      -0.1        0.29 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.pagecache_get_page
>       0.30 =C2=B1  4%      -0.1        0.24 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       0.31 =C2=B1  2%      -0.1        0.26 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.27            -0.1        0.22 =C2=B1  2%  perf-profile.children.=
cycles-pp.f2fs_write_inode
>       0.33 =C2=B1  3%      -0.1        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.31 =C2=B1  3%      -0.1        0.26 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.31 =C2=B1  3%      -0.1        0.26        perf-profile.children.=
cycles-pp.complete
>       0.42 =C2=B1  3%      -0.1        0.37 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.prepare_write_begin
>       0.36            -0.1        0.31 =C2=B1  5%  perf-profile.children.=
cycles-pp.copy_to_brd
>       0.34 =C2=B1  8%      -0.0        0.29 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__filemap_get_folio
>       0.28 =C2=B1  3%      -0.0        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__radix_tree_lookup
>       0.20 =C2=B1  4%      -0.0        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.md_flush_request
>       0.24            -0.0        0.19 =C2=B1  2%  perf-profile.children.=
cycles-pp.f2fs_update_inode_page
>       1.04            -0.0        0.99 =C2=B1  2%  perf-profile.children.=
cycles-pp.dequeue_task_fair
>       0.81            -0.0        0.76        perf-profile.children.cycle=
s-pp.update_load_avg
>       0.11            -0.0        0.06 =C2=B1 19%  perf-profile.children.=
cycles-pp.tick_nohz_idle_exit
>       0.39 =C2=B1  3%      -0.0        0.35 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.folio_end_writeback
>       0.30            -0.0        0.25 =C2=B1  3%  perf-profile.children.=
cycles-pp.perf_trace_sched_wakeup_template
>       0.33 =C2=B1  5%      -0.0        0.29 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.f2fs_is_valid_blkaddr
>       0.21 =C2=B1  2%      -0.0        0.17 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.13 =C2=B1  6%      -0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__cond_resched
>       0.15 =C2=B1  3%      -0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.queue_work_on
>       0.16 =C2=B1  6%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.wake_q_add
>       0.31            -0.0        0.27        perf-profile.children.cycle=
s-pp.__list_del_entry_valid
>       0.07 =C2=B1  6%      -0.0        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>       0.27 =C2=B1  4%      -0.0        0.23 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__irq_exit_rcu
>       0.21 =C2=B1  2%      -0.0        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__alloc_pages
>       0.36 =C2=B1  2%      -0.0        0.32 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__folio_end_writeback
>       0.30 =C2=B1  6%      -0.0        0.26 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.down_write
>       0.87            -0.0        0.84 =C2=B1  2%  perf-profile.children.=
cycles-pp.dequeue_entity
>       0.19 =C2=B1  2%      -0.0        0.16 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.get_page_from_freelist
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__queue_work
>       0.24            -0.0        0.20 =C2=B1  2%  perf-profile.children.=
cycles-pp.__list_add_valid
>       0.16 =C2=B1  7%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.percpu_counter_add_batch
>       0.07 =C2=B1 11%      -0.0        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.f2fs_inode_chksum_verify
>       0.21 =C2=B1  7%      -0.0        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>       0.17 =C2=B1  4%      -0.0        0.14 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__mod_lruvec_page_state
>       0.38 =C2=B1  4%      -0.0        0.35 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.20 =C2=B1  2%      -0.0        0.17 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_se
>       0.15 =C2=B1  3%      -0.0        0.12 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.bio_alloc_bioset
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.f2fs_update_inode
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.folio_clear_dirty_for_io
>       0.06 =C2=B1  7%      -0.0        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.lapic_next_deadline
>       0.10 =C2=B1  4%      -0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>       0.24            -0.0        0.21 =C2=B1  2%  perf-profile.children.=
cycles-pp.prepare_task_switch
>       0.17 =C2=B1  7%      -0.0        0.15        perf-profile.children.=
cycles-pp.locate_dirty_segment
>       0.09 =C2=B1  9%      -0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__set_nat_cache_dirty
>       0.15 =C2=B1  3%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       0.09 =C2=B1 10%      -0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.llseek
>       0.22            -0.0        0.20 =C2=B1  2%  perf-profile.children.=
cycles-pp.sched_clock_cpu
>       0.14 =C2=B1  5%      -0.0        0.12 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__has_merged_page
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.perf_mux_hrtimer_handler
>       0.07 =C2=B1  6%      -0.0        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.update_min_vruntime
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.09            -0.0        0.07        perf-profile.children.cycle=
s-pp.mempool_alloc
>       0.07            -0.0        0.05        perf-profile.children.cycle=
s-pp.rmqueue
>       0.11            -0.0        0.09        perf-profile.children.cycle=
s-pp.__might_resched
>       0.10 =C2=B1  8%      -0.0        0.08        perf-profile.children.=
cycles-pp.rebalance_domains
>       0.14 =C2=B1  5%      -0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_segment_mtime
>       0.13 =C2=B1  3%      -0.0        0.11        perf-profile.children.=
cycles-pp.copy_page_from_iter_atomic
>       0.13 =C2=B1  6%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.poll_idle
>       0.08 =C2=B1  6%      -0.0        0.06        perf-profile.children.=
cycles-pp.xas_set_mark
>       0.08 =C2=B1  6%      -0.0        0.06        perf-profile.children.=
cycles-pp.native_irq_return_iret
>       0.07 =C2=B1 11%      -0.0        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.cgroup_rstat_updated
>       0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.wake_q_add_safe
>       0.11            -0.0        0.09 =C2=B1  5%  perf-profile.children.=
cycles-pp.clear_page_erms
>       0.11 =C2=B1  4%      -0.0        0.09 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.cpumask_next
>       0.09 =C2=B1  9%      -0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.perf_tp_event
>       0.09 =C2=B1  9%      -0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       0.20 =C2=B1  4%      -0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.native_sched_clock
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.submit_bio_noacct
>       0.06 =C2=B1  7%      -0.0        0.05        perf-profile.children.=
cycles-pp.rcu_idle_exit
>       0.06 =C2=B1  7%      -0.0        0.05        perf-profile.children.=
cycles-pp.tick_nohz_idle_enter
>       0.07 =C2=B1  7%      -0.0        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.folio_unlock
>       0.10 =C2=B1  4%      -0.0        0.09        perf-profile.children.=
cycles-pp.copy_user_enhanced_fast_string
>       0.10            -0.0        0.09        perf-profile.children.cycle=
s-pp.f2fs_del_fsync_node_entry
>       0.08            -0.0        0.07        perf-profile.children.cycle=
s-pp.__bio_alloc
>       0.06            -0.0        0.05        perf-profile.children.cycle=
s-pp.__might_sleep
>       0.32 =C2=B1  3%      +0.0        0.35 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.find_busiest_queue
>       0.38 =C2=B1  2%      +0.0        0.41 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.up_read
>       0.26 =C2=B1  7%      +0.0        0.30 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.select_task_rq_fair
>       0.27 =C2=B1  3%      +0.0        0.30 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__flush_smp_call_function_queue
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.task_h_load
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.set_task_cpu
>       0.20 =C2=B1  2%      +0.1        0.25 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.llist_add_batch
>       0.19 =C2=B1  2%      +0.1        0.25 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__smp_call_single_queue
>       0.00            +0.1        0.06        perf-profile.children.cycle=
s-pp.select_idle_core
>       0.04 =C2=B1 71%      +0.1        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.select_idle_sibling
>       1.51            +0.1        1.58 =C2=B1  2%  perf-profile.children.=
cycles-pp._raw_spin_lock
>       0.00            +0.1        0.07        perf-profile.children.cycle=
s-pp.select_idle_cpu
>       0.39 =C2=B1  2%      +0.1        0.47 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ttwu_queue_wakelist
>       0.88 =C2=B1  4%      +0.1        1.00 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.idle_cpu
>       0.41 =C2=B1  3%      +0.1        0.53        perf-profile.children.=
cycles-pp.__lookup_nat_cache
>       2.54            +0.2        2.73        perf-profile.children.cycle=
s-pp.f2fs_is_checkpointed_node
>       0.69 =C2=B1  3%      +0.2        0.93        perf-profile.children.=
cycles-pp.mutex_spin_on_owner
>       4.73 =C2=B1  2%      +0.2        4.97        perf-profile.children.=
cycles-pp.set_node_addr
>       3.16 =C2=B1  5%      +0.4        3.55        perf-profile.children.=
cycles-pp.intel_idle_irq
>       0.86            +0.5        1.36 =C2=B1  2%  perf-profile.children.=
cycles-pp.sched_ttwu_pending
>       1.15 =C2=B1  2%      +0.6        1.70 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.flush_smp_call_function_queue
>       4.00 =C2=B1  2%      +0.8        4.75        perf-profile.children.=
cycles-pp.f2fs_get_node_info
>       2.24 =C2=B1  5%      +1.0        3.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       1.58 =C2=B1  6%      +1.0        2.62 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__percpu_counter_sum
>       1.62 =C2=B1  6%      +1.0        2.66 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.f2fs_space_for_roll_forward
>      11.21            +1.4       12.60        perf-profile.children.cycle=
s-pp.rwsem_down_read_slowpath
>       5.56 =C2=B1  5%      +1.8        7.36        perf-profile.children.=
cycles-pp._raw_spin_lock_irq
>      12.96            +2.2       15.15 =C2=B1  2%  perf-profile.children.=
cycles-pp.file_write_and_wait_range
>      12.90            +2.2       15.10 =C2=B1  2%  perf-profile.children.=
cycles-pp.__filemap_fdatawrite_range
>      12.85            +2.2       15.05 =C2=B1  2%  perf-profile.children.=
cycles-pp.__f2fs_write_data_pages
>      12.89            +2.2       15.09 =C2=B1  2%  perf-profile.children.=
cycles-pp.filemap_fdatawrite_wbc
>      12.86            +2.2       15.06 =C2=B1  2%  perf-profile.children.=
cycles-pp.do_writepages
>      12.73            +2.2       14.93 =C2=B1  2%  perf-profile.children.=
cycles-pp.f2fs_write_cache_pages
>       6.76 =C2=B1  3%      +2.3        9.01 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.f2fs_outplace_write_data
>       9.43            +2.4       11.78 =C2=B1  2%  perf-profile.children.=
cycles-pp.f2fs_write_single_data_page
>       9.22 =C2=B1  2%      +2.4       11.59 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.f2fs_do_write_data_page
>       7.40 =C2=B1  4%      +2.8       10.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.f2fs_submit_page_write
>       9.83 =C2=B1  3%      +3.0       12.87 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.rwsem_optimistic_spin
>       6.82 =C2=B1  3%      +3.2        9.97        perf-profile.children.=
cycles-pp.native_queued_spin_lock_slowpath
>      12.97 =C2=B1  2%      +3.5       16.45 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.rwsem_down_write_slowpath
>       3.19            +3.8        6.99 =C2=B1  3%  perf-profile.children.=
cycles-pp.__mutex_lock
>       4.80 =C2=B1  2%      +3.9        8.68 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.f2fs_allocate_data_block
>       6.26            +4.4       10.65 =C2=B1  3%  perf-profile.children.=
cycles-pp.f2fs_do_write_node_page
>      23.20            +4.6       27.77        perf-profile.children.cycle=
s-pp.f2fs_fsync_node_pages
>      15.69            +4.6       20.32        perf-profile.children.cycle=
s-pp.__write_node_page
>       9.93 =C2=B1  3%      +6.6       16.57 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.osq_lock
>      12.67            +6.7       19.33 =C2=B1  3%  perf-profile.children.=
cycles-pp.do_write_page
>      48.22            +7.3       55.51        perf-profile.children.cycle=
s-pp.write
>      48.21            +7.3       55.51        perf-profile.children.cycle=
s-pp.do_syscall_64
>      48.22            +7.3       55.53        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      47.85            +7.3       55.18        perf-profile.children.cycle=
s-pp.ksys_write
>      47.83            +7.3       55.17        perf-profile.children.cycle=
s-pp.vfs_write
>      47.74            +7.4       55.10        perf-profile.children.cycle=
s-pp.new_sync_write
>      47.72            +7.4       55.07        perf-profile.children.cycle=
s-pp.f2fs_file_write_iter
>      46.04            +7.5       53.58        perf-profile.children.cycle=
s-pp.f2fs_do_sync_file
>      44.16            -6.2       37.91        perf-profile.self.cycles-pp=
.mwait_idle_with_hints
>       1.66            -0.3        1.35        perf-profile.self.cycles-pp=
.find_get_pages_range_tag
>       0.56 =C2=B1  2%      -0.2        0.38        perf-profile.self.cycl=
es-pp.__schedule
>       0.34 =C2=B1  5%      -0.1        0.21 =C2=B1  2%  perf-profile.self=
.cycles-pp.update_rq_clock
>       1.30            -0.1        1.17 =C2=B1  2%  perf-profile.self.cycl=
es-pp._raw_spin_lock
>       0.77 =C2=B1  2%      -0.1        0.66 =C2=B1  2%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.37 =C2=B1  5%      -0.1        0.26 =C2=B1 12%  perf-profile.self=
.cycles-pp.ktime_get
>       0.63 =C2=B1  2%      -0.1        0.54 =C2=B1  3%  perf-profile.self=
.cycles-pp.release_pages
>       0.51 =C2=B1  4%      -0.1        0.42 =C2=B1  4%  perf-profile.self=
.cycles-pp.menu_select
>       0.27            -0.1        0.19 =C2=B1  2%  perf-profile.self.cycl=
es-pp.enqueue_task_fair
>       0.15 =C2=B1  5%      -0.1        0.09 =C2=B1  9%  perf-profile.self=
.cycles-pp.switch_mm_irqs_off
>       0.25            -0.1        0.20 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__switch_to
>       0.72 =C2=B1  2%      -0.1        0.67 =C2=B1  3%  perf-profile.self=
.cycles-pp.rwsem_down_read_slowpath
>       0.13 =C2=B1  3%      -0.1        0.07 =C2=B1 12%  perf-profile.self=
.cycles-pp.do_idle
>       0.35            -0.1        0.30 =C2=B1  5%  perf-profile.self.cycl=
es-pp.copy_to_brd
>       0.68 =C2=B1  2%      -0.0        0.63 =C2=B1  3%  perf-profile.self=
.cycles-pp.down_read
>       0.34            -0.0        0.30 =C2=B1  3%  perf-profile.self.cycl=
es-pp.f2fs_fsync_node_pages
>       0.27 =C2=B1  5%      -0.0        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.__radix_tree_lookup
>       0.48            -0.0        0.43 =C2=B1  3%  perf-profile.self.cycl=
es-pp.rwsem_optimistic_spin
>       0.33 =C2=B1  5%      -0.0        0.29 =C2=B1  5%  perf-profile.self=
.cycles-pp.f2fs_is_valid_blkaddr
>       0.29 =C2=B1  4%      -0.0        0.25 =C2=B1  3%  perf-profile.self=
.cycles-pp.rwsem_mark_wake
>       0.16 =C2=B1  6%      -0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.wake_q_add
>       0.31            -0.0        0.27        perf-profile.self.cycles-pp=
.__list_del_entry_valid
>       0.24            -0.0        0.20 =C2=B1  4%  perf-profile.self.cycl=
es-pp.__list_add_valid
>       0.13 =C2=B1  3%      -0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>       0.53            -0.0        0.49 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__percpu_counter_sum
>       0.27 =C2=B1  7%      -0.0        0.24 =C2=B1  3%  perf-profile.self=
.cycles-pp.down_write
>       0.19 =C2=B1  2%      -0.0        0.16 =C2=B1  3%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.30 =C2=B1  3%      -0.0        0.26        perf-profile.self.cycl=
es-pp.newidle_balance
>       0.11 =C2=B1 11%      -0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.submit_flushes
>       0.19 =C2=B1  2%      -0.0        0.15 =C2=B1  8%  perf-profile.self=
.cycles-pp.perf_trace_sched_wakeup_template
>       0.14 =C2=B1  6%      -0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       0.14 =C2=B1  6%      -0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.percpu_counter_add_batch
>       0.06 =C2=B1  7%      -0.0        0.03 =C2=B1 70%  perf-profile.self=
.cycles-pp.f2fs_inode_chksum_verify
>       0.06 =C2=B1  7%      -0.0        0.03 =C2=B1 70%  perf-profile.self=
.cycles-pp.lapic_next_deadline
>       0.15            -0.0        0.12 =C2=B1  6%  perf-profile.self.cycl=
es-pp.prepare_task_switch
>       0.07 =C2=B1  7%      -0.0        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.folio_clear_dirty_for_io
>       0.42 =C2=B1  4%      -0.0        0.39        perf-profile.self.cycl=
es-pp._raw_spin_lock_irq
>       0.21 =C2=B1  3%      -0.0        0.18 =C2=B1  4%  perf-profile.self=
.cycles-pp.rwsem_down_write_slowpath
>       0.13 =C2=B1  6%      -0.0        0.10 =C2=B1 12%  perf-profile.self=
.cycles-pp.__lookup_nat_cache
>       0.09 =C2=B1  9%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.wake_up_q
>       0.18 =C2=B1  2%      -0.0        0.16 =C2=B1  5%  perf-profile.self=
.cycles-pp.__filemap_get_folio
>       0.08 =C2=B1  5%      -0.0        0.06        perf-profile.self.cycl=
es-pp.f2fs_file_write_iter
>       0.31            -0.0        0.29 =C2=B1  3%  perf-profile.self.cycl=
es-pp.__update_load_avg_cfs_rq
>       0.16 =C2=B1  2%      -0.0        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.finish_task_switch
>       0.12 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.poll_idle
>       0.33 =C2=B1  2%      -0.0        0.31 =C2=B1  2%  perf-profile.self=
.cycles-pp.enqueue_entity
>       0.14 =C2=B1  5%      -0.0        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.__has_merged_page
>       0.11 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.__might_resched
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.reweight_entity
>       0.19 =C2=B1  2%      -0.0        0.18 =C2=B1  2%  perf-profile.self=
.cycles-pp.native_sched_clock
>       0.17            -0.0        0.15 =C2=B1  3%  perf-profile.self.cycl=
es-pp.f2fs_do_sync_file
>       0.08 =C2=B1  6%      -0.0        0.06        perf-profile.self.cycl=
es-pp.xas_set_mark
>       0.08 =C2=B1  6%      -0.0        0.06        perf-profile.self.cycl=
es-pp.native_irq_return_iret
>       0.07 =C2=B1 11%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.cpuidle_idle_call
>       0.10 =C2=B1  4%      -0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.wake_q_add_safe
>       0.11            -0.0        0.09 =C2=B1  5%  perf-profile.self.cycl=
es-pp.clear_page_erms
>       0.09 =C2=B1  9%      -0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.f2fs_write_end_io
>       0.08 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.kmem_cache_free
>       0.08 =C2=B1 10%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.__submit_merged_write_cond
>       0.14 =C2=B1  3%      -0.0        0.12 =C2=B1  3%  perf-profile.self=
.cycles-pp.update_segment_mtime
>       0.15 =C2=B1  3%      -0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.dequeue_task_fair
>       0.07 =C2=B1  7%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.folio_unlock
>       0.10 =C2=B1  4%      -0.0        0.09        perf-profile.self.cycl=
es-pp.copy_user_enhanced_fast_string
>       0.11 =C2=B1  4%      -0.0        0.10        perf-profile.self.cycl=
es-pp.__mark_inode_dirty
>       0.10            -0.0        0.09        perf-profile.self.cycles-pp=
.dequeue_entity
>       0.10 =C2=B1  4%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.__mutex_lock
>       0.12 =C2=B1  6%      +0.0        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.__flush_smp_call_function_queue
>       0.28 =C2=B1  5%      +0.0        0.30 =C2=B1  3%  perf-profile.self=
.cycles-pp.find_busiest_queue
>       0.37 =C2=B1  2%      +0.0        0.40 =C2=B1  3%  perf-profile.self=
.cycles-pp.up_read
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 14%  perf-profile.self=
.cycles-pp.task_h_load
>       0.19 =C2=B1  2%      +0.1        0.25 =C2=B1  4%  perf-profile.self=
.cycles-pp.llist_add_batch
>       0.84 =C2=B1  4%      +0.1        0.97 =C2=B1  2%  perf-profile.self=
.cycles-pp.idle_cpu
>       0.69 =C2=B1  2%      +0.2        0.92 =C2=B1  2%  perf-profile.self=
.cycles-pp.mutex_spin_on_owner
>       6.81 =C2=B1  3%      +3.2        9.96        perf-profile.self.cycl=
es-pp.native_queued_spin_lock_slowpath
>       9.87 =C2=B1  3%      +6.6       16.47 =C2=B1  4%  perf-profile.self=
.cycles-pp.osq_lock
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2ap4: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU @ =
2.30GHz (Cascade Lake) with 192G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-11/performance/ipv4/x86_64-rhel-8.3/200%/debian-11.1-x=
86_64-20220510.cgz/300s/lkp-csl-2ap4/SCTP_RR/netperf/0x5003302
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    5111880 =C2=B1 26%     +54.1%    7876319 =C2=B1  3%  netperf.Throughpu=
t_total_tps
>      13312 =C2=B1 26%     +54.1%      20511 =C2=B1  3%  netperf.Throughpu=
t_tps
>  5.504e+08 =C2=B1 52%     +93.4%  1.065e+09 =C2=B1  4%  netperf.time.invo=
luntary_context_switches
>     109745 =C2=B1  2%      -4.0%     105309        netperf.time.minor_pag=
e_faults
>       4663 =C2=B1 13%     +22.3%       5703        netperf.time.percent_o=
f_cpu_this_job_got
>      13802 =C2=B1 12%     +21.6%      16783        netperf.time.system_ti=
me
>     481.24 =C2=B1 21%     +39.9%     673.14        netperf.time.user_time
>  9.835e+08 =C2=B1 12%     +32.1%  1.299e+09 =C2=B1  3%  netperf.time.volu=
ntary_context_switches
>  1.534e+09 =C2=B1 26%     +54.1%  2.363e+09 =C2=B1  3%  netperf.workload
>      11326 =C2=B1 13%     -29.9%       7937 =C2=B1  4%  uptime.idle
>  5.109e+09 =C2=B1 28%     -61.5%  1.965e+09 =C2=B1  9%  cpuidle..time
>  3.182e+08 =C2=B1 20%     -75.8%   77089036 =C2=B1 35%  cpuidle..usage
>      51714 =C2=B1 29%     +44.0%      74492 =C2=B1 11%  numa-numastat.nod=
e0.other_node
>    1449810 =C2=B1101%     -90.1%     142963 =C2=B1 52%  numa-numastat.nod=
e1.local_node
>    1526393 =C2=B1 97%     -86.4%     207115 =C2=B1 39%  numa-numastat.nod=
e1.numa_hit
>       9.00 =C2=B1 27%     -63.0%       3.33 =C2=B1 14%  vmstat.cpu.id
>   10892287 =C2=B1 22%     +42.3%   15497270 =C2=B1  2%  vmstat.system.cs
>     411161           +24.1%     510170 =C2=B1  8%  vmstat.system.in
>       8.70 =C2=B1 27%      -5.4        3.31 =C2=B1 12%  mpstat.cpu.all.id=
le%
>       1.13 =C2=B1  7%      +0.2        1.34 =C2=B1  8%  mpstat.cpu.all.ir=
q%
>      50.18 =C2=B1  7%      +7.9       58.10        mpstat.cpu.all.sys%
>       1.78 =C2=B1 19%      +0.6        2.39        mpstat.cpu.all.usr%
>      48864 =C2=B1  8%      -9.9%      44019 =C2=B1  3%  proc-vmstat.nr_ac=
tive_anon
>     156886 =C2=B1  2%     +16.2%     182351 =C2=B1 13%  proc-vmstat.nr_ma=
pped
>      98629            -1.0%      97670        proc-vmstat.nr_slab_unrecla=
imable
>      48864 =C2=B1  8%      -9.9%      44019 =C2=B1  3%  proc-vmstat.nr_zo=
ne_active_anon
>     157416 =C2=B1  9%     +31.8%     207476 =C2=B1 13%  proc-vmstat.numa_=
hint_faults_local
>    1063574 =C2=B1  5%     -11.6%     940584        proc-vmstat.pgfree
>       3024            -1.7%       2973        turbostat.Bzy_MHz
>   3.12e+08 =C2=B1 20%     -79.2%   64875404 =C2=B1 37%  turbostat.C1
>       5.96 =C2=B1 39%      -5.3        0.69 =C2=B1 37%  turbostat.C1%
>    1340810           -60.1%     534348 =C2=B1104%  turbostat.C6
>       7.87 =C2=B1 30%     -59.9%       3.15 =C2=B1 15%  turbostat.CPU%c1
>       0.14 =C2=B1 23%     +40.5%       0.20 =C2=B1  2%  turbostat.IPC
>  1.276e+08           +24.0%  1.582e+08 =C2=B1  8%  turbostat.IRQ
>    2343277 =C2=B1 43%    +302.8%    9438678 =C2=B1 36%  turbostat.POLL
>      51714 =C2=B1 29%     +44.0%      74492 =C2=B1 11%  numa-vmstat.node0=
.numa_other
>       1180 =C2=B1 79%     -73.7%     310.00 =C2=B1 11%  numa-vmstat.node1=
.nr_active_anon
>     476818 =C2=B1131%     -95.3%      22603 =C2=B1 23%  numa-vmstat.node1=
.nr_inactive_anon
>       1570 =C2=B1  7%     +25.1%       1964 =C2=B1 10%  numa-vmstat.node1=
.nr_page_table_pages
>     450392 =C2=B1141%     -99.9%     321.67 =C2=B1 23%  numa-vmstat.node1=
.nr_shmem
>       9978 =C2=B1 61%     -61.1%       3882 =C2=B1 13%  numa-vmstat.node1=
.nr_slab_reclaimable
>       1180 =C2=B1 79%     -73.7%     310.00 =C2=B1 11%  numa-vmstat.node1=
.nr_zone_active_anon
>     476818 =C2=B1131%     -95.3%      22603 =C2=B1 23%  numa-vmstat.node1=
.nr_zone_inactive_anon
>    1526555 =C2=B1 97%     -86.4%     207071 =C2=B1 39%  numa-vmstat.node1=
.numa_hit
>    1449972 =C2=B1101%     -90.1%     142919 =C2=B1 52%  numa-vmstat.node1=
.numa_local
>       5965 =C2=B1 14%    +113.1%      12714 =C2=B1 59%  numa-vmstat.node3=
.nr_slab_reclaimable
>       4721 =C2=B1 79%     -73.7%       1240 =C2=B1 11%  numa-meminfo.node=
1.Active
>       4721 =C2=B1 79%     -73.7%       1240 =C2=B1 11%  numa-meminfo.node=
1.Active(anon)
>    1906005 =C2=B1131%     -95.3%      90393 =C2=B1 23%  numa-meminfo.node=
1.Inactive
>    1906005 =C2=B1131%     -95.3%      90393 =C2=B1 23%  numa-meminfo.node=
1.Inactive(anon)
>      39910 =C2=B1 61%     -61.1%      15528 =C2=B1 13%  numa-meminfo.node=
1.KReclaimable
>       6291 =C2=B1  7%     +24.8%       7850 =C2=B1 10%  numa-meminfo.node=
1.PageTables
>      39910 =C2=B1 61%     -61.1%      15528 =C2=B1 13%  numa-meminfo.node=
1.SReclaimable
>    1800183 =C2=B1141%     -99.9%       1290 =C2=B1 23%  numa-meminfo.node=
1.Shmem
>     254112 =C2=B1 23%     +35.6%     344588 =C2=B1 14%  numa-meminfo.node=
3.AnonPages.max
>      23822 =C2=B1 14%    +113.8%      50942 =C2=B1 59%  numa-meminfo.node=
3.KReclaimable
>     347179 =C2=B1  4%     +32.5%     460177 =C2=B1 18%  numa-meminfo.node=
3.Mapped
>      23822 =C2=B1 14%    +113.8%      50942 =C2=B1 59%  numa-meminfo.node=
3.SReclaimable
>     115160 =C2=B1  7%     +30.3%     150080 =C2=B1 23%  numa-meminfo.node=
3.Slab
>   13694065 =C2=B1  6%     -63.8%    4957183 =C2=B1102%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>       6.94 =C2=B1 17%     -41.6%       4.06 =C2=B1  8%  sched_debug.cfs_r=
q:/.h_nr_running.max
>       1.17 =C2=B1 22%     -43.7%       0.66 =C2=B1  7%  sched_debug.cfs_r=
q:/.h_nr_running.stddev
>   13694065 =C2=B1  6%     -63.8%    4957183 =C2=B1102%  sched_debug.cfs_r=
q:/.max_vruntime.max
>   14711026 =C2=B1 13%     +22.7%   18051609 =C2=B1  2%  sched_debug.cfs_r=
q:/.min_vruntime.avg
>   18205610 =C2=B1 10%     +35.6%   24690578 =C2=B1  5%  sched_debug.cfs_r=
q:/.min_vruntime.max
>    1303868 =C2=B1 21%     +72.7%    2251954 =C2=B1 12%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.24 =C2=B1  9%     -58.0%       0.10 =C2=B1 45%  sched_debug.cfs_r=
q:/.nr_running.stddev
>     684.78           +31.0%     897.11 =C2=B1  8%  sched_debug.cfs_rq:/.r=
unnable_avg.min
>     590.26 =C2=B1 10%     -23.8%     449.76 =C2=B1  7%  sched_debug.cfs_r=
q:/.runnable_avg.stddev
>   -3883762           +71.6%   -6663023        sched_debug.cfs_rq:/.spread=
0.min
>    1304645 =C2=B1 21%     +72.6%    2251434 =C2=B1 12%  sched_debug.cfs_r=
q:/.spread0.stddev
>     678.19 =C2=B1  8%     +22.8%     832.68 =C2=B1  5%  sched_debug.cfs_r=
q:/.util_avg.avg
>     402.22           +30.9%     526.33 =C2=B1 11%  sched_debug.cfs_rq:/.u=
til_avg.min
>     212.06 =C2=B1  3%     -43.6%     119.63 =C2=B1 26%  sched_debug.cfs_r=
q:/.util_avg.stddev
>     278.92 =C2=B1 34%     +94.4%     542.14 =C2=B1 12%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     286.22 =C2=B1  5%     -29.3%     202.35 =C2=B1 10%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>       4095 =C2=B1 46%     -83.7%     665.80 =C2=B1 33%  sched_debug.cpu.c=
lock_task.stddev
>       5882 =C2=B1  3%      +8.8%       6397 =C2=B1  3%  sched_debug.cpu.c=
urr->pid.avg
>       2255 =C2=B1 12%     -50.4%       1119 =C2=B1 27%  sched_debug.cpu.c=
urr->pid.stddev
>       6.72 =C2=B1 14%     -40.5%       4.00 =C2=B1 12%  sched_debug.cpu.n=
r_running.max
>       1.13 =C2=B1 19%     -41.1%       0.67 =C2=B1  9%  sched_debug.cpu.n=
r_running.stddev
>    8768672 =C2=B1 22%     +38.6%   12152157 =C2=B1  3%  sched_debug.cpu.n=
r_switches.avg
>    5473426 =C2=B1 20%     +82.5%    9987193 =C2=B1  9%  sched_debug.cpu.n=
r_switches.min
>    2896943 =C2=B1 17%     -63.6%    1053589 =C2=B1 26%  sched_debug.cpu.n=
r_switches.stddev
>       8.86 =C2=B1 29%     -57.9%       3.72 =C2=B1 11%  perf-stat.i.MPKI
>  5.303e+10 =C2=B1 22%     +44.1%  7.643e+10 =C2=B1  2%  perf-stat.i.branc=
h-instructions
>       1.48            -0.1        1.41        perf-stat.i.branch-miss-rat=
e%
>  7.615e+08 =C2=B1 20%     +38.9%  1.057e+09 =C2=B1  3%  perf-stat.i.branc=
h-misses
>       3.86 =C2=B1 39%      +8.5       12.35 =C2=B1  7%  perf-stat.i.cache=
-miss-rate%
>   74684042 =C2=B1 33%     +85.6%  1.387e+08 =C2=B1  5%  perf-stat.i.cache=
-misses
>  2.111e+09 =C2=B1  8%     -40.5%  1.257e+09 =C2=B1  8%  perf-stat.i.cache=
-references
>   11003644 =C2=B1 22%     +42.3%   15658016 =C2=B1  2%  perf-stat.i.conte=
xt-switches
>       2.14 =C2=B1 22%     -31.2%       1.47 =C2=B1  3%  perf-stat.i.cpi
>  5.343e+11            +3.1%  5.509e+11        perf-stat.i.cpu-cycles
>    1863059 =C2=B1 23%     -75.6%     455171 =C2=B1 36%  perf-stat.i.cpu-m=
igrations
>       8147 =C2=B1 29%     -45.8%       4414 =C2=B1  5%  perf-stat.i.cycle=
s-between-cache-misses
>       0.11 =C2=B1 40%      -0.1        0.03 =C2=B1 42%  perf-stat.i.dTLB-=
load-miss-rate%
>   71976013 =C2=B1 20%     -66.0%   24439324 =C2=B1 21%  perf-stat.i.dTLB-=
load-misses
>  7.666e+10 =C2=B1 23%     +45.8%  1.118e+11 =C2=B1  2%  perf-stat.i.dTLB-=
loads
>       0.03 =C2=B1 40%      -0.0        0.01 =C2=B1 22%  perf-stat.i.dTLB-=
store-miss-rate%
>   12295808 =C2=B1 19%     -63.1%    4534713 =C2=B1 20%  perf-stat.i.dTLB-=
store-misses
>  4.514e+10 =C2=B1 24%     +47.5%   6.66e+10 =C2=B1  2%  perf-stat.i.dTLB-=
stores
>  3.267e+08 =C2=B1 23%     +47.5%  4.819e+08 =C2=B1  3%  perf-stat.i.iTLB-=
load-misses
>  6.802e+08 =C2=B1 26%     +47.7%  1.004e+09 =C2=B1  2%  perf-stat.i.iTLB-=
loads
>   2.66e+11 =C2=B1 22%     +44.6%  3.847e+11 =C2=B1  2%  perf-stat.i.instr=
uctions
>     892.90            -1.8%     876.41        perf-stat.i.instructions-pe=
r-iTLB-miss
>       0.50 =C2=B1 20%     +39.8%       0.70 =C2=B1  2%  perf-stat.i.ipc
>       2.78            +3.1%       2.87        perf-stat.i.metric.GHz
>     925.12 =C2=B1 22%     +44.7%       1339 =C2=B1  2%  perf-stat.i.metri=
c.M/sec
>      91.36            -2.5       88.86        perf-stat.i.node-load-miss-=
rate%
>   24174882 =C2=B1 26%     +42.7%   34504038 =C2=B1  4%  perf-stat.i.node-=
load-misses
>    2240603 =C2=B1 32%     +83.2%    4105737        perf-stat.i.node-loads
>       8.54 =C2=B1 31%     -61.7%       3.28 =C2=B1 11%  perf-stat.overall=
.MPKI
>       1.44 =C2=B1  2%      -0.1        1.38        perf-stat.overall.bran=
ch-miss-rate%
>       3.67 =C2=B1 42%      +7.4       11.12 =C2=B1  9%  perf-stat.overall=
.cache-miss-rate%
>       2.11 =C2=B1 22%     -32.2%       1.43 =C2=B1  2%  perf-stat.overall=
.cpi
>       7914 =C2=B1 29%     -49.6%       3986 =C2=B1  5%  perf-stat.overall=
.cycles-between-cache-misses
>       0.10 =C2=B1 42%      -0.1        0.02 =C2=B1 24%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.03 =C2=B1 42%      -0.0        0.01 =C2=B1 23%  perf-stat.overall=
.dTLB-store-miss-rate%
>       0.50 =C2=B1 21%     +40.7%       0.70 =C2=B1  2%  perf-stat.overall=
.ipc
>      91.64            -2.3       89.35        perf-stat.overall.node-load=
-miss-rate%
>      53983 =C2=B1  4%      -7.3%      50022        perf-stat.overall.path=
-length
>  5.286e+10 =C2=B1 22%     +44.1%   7.62e+10 =C2=B1  2%  perf-stat.ps.bran=
ch-instructions
>   7.59e+08 =C2=B1 20%     +38.9%  1.054e+09 =C2=B1  3%  perf-stat.ps.bran=
ch-misses
>   74435971 =C2=B1 33%     +85.7%  1.382e+08 =C2=B1  5%  perf-stat.ps.cach=
e-misses
>  2.104e+09 =C2=B1  8%     -40.5%  1.252e+09 =C2=B1  8%  perf-stat.ps.cach=
e-references
>   10967139 =C2=B1 22%     +42.3%   15605637 =C2=B1  2%  perf-stat.ps.cont=
ext-switches
>  5.326e+11            +3.1%  5.491e+11        perf-stat.ps.cpu-cycles
>    1857181 =C2=B1 23%     -75.6%     452659 =C2=B1 36%  perf-stat.ps.cpu-=
migrations
>   71754994 =C2=B1 20%     -66.1%   24349619 =C2=B1 21%  perf-stat.ps.dTLB=
-load-misses
>  7.641e+10 =C2=B1 23%     +45.9%  1.115e+11 =C2=B1  2%  perf-stat.ps.dTLB=
-loads
>   12257042 =C2=B1 19%     -63.2%    4516340 =C2=B1 20%  perf-stat.ps.dTLB=
-store-misses
>    4.5e+10 =C2=B1 24%     +47.5%  6.639e+10 =C2=B1  2%  perf-stat.ps.dTLB=
-stores
>  3.256e+08 =C2=B1 23%     +47.5%  4.803e+08 =C2=B1  3%  perf-stat.ps.iTLB=
-load-misses
>  6.779e+08 =C2=B1 26%     +47.7%  1.001e+09 =C2=B1  2%  perf-stat.ps.iTLB=
-loads
>  2.652e+11 =C2=B1 22%     +44.6%  3.835e+11 =C2=B1  2%  perf-stat.ps.inst=
ructions
>   24093716 =C2=B1 26%     +42.7%   34389658 =C2=B1  5%  perf-stat.ps.node=
-load-misses
>    2231106 =C2=B1 32%     +83.4%    4090747        perf-stat.ps.node-loads
>  8.179e+13 =C2=B1 22%     +44.5%  1.182e+14 =C2=B1  2%  perf-stat.total.i=
nstructions
>      19.97 =C2=B1 32%     -14.0        6.00 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__wake_up_common_lock.__sctp_write_space.sctp_wfree.skb_rel=
ease_head_state.consume_skb
>      20.11 =C2=B1 31%     -13.9        6.17 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__sctp_write_space.sctp_wfree.skb_release_head_state.consum=
e_skb.sctp_chunk_put
>      20.75 =C2=B1 30%     -13.9        6.84 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.skb_release_head_state.consume_skb.sctp_chunk_put.sctp_outq=
_sack.sctp_cmd_interpreter
>      20.54 =C2=B1 31%     -13.9        6.66 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sctp_wfree.skb_release_head_state.consume_skb.sctp_chunk_pu=
t.sctp_outq_sack
>      21.15 =C2=B1 29%     -13.9        7.28 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.consume_skb.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpre=
ter.sctp_do_sm
>      19.67 =C2=B1 32%     -13.8        5.83 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__wake_up_common.__wake_up_common_lock.__sctp_write_space.s=
ctp_wfree.skb_release_head_state
>      19.49 =C2=B1 32%     -13.8        5.66 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__=
wake_up_common_lock.__sctp_write_space
>      19.56 =C2=B1 32%     -13.8        5.77 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_=
lock.__sctp_write_space.sctp_wfree
>      21.55 =C2=B1 29%     -13.8        7.77 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sctp_chunk_put.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_=
sm.sctp_assoc_bh_rcv
>      24.89 =C2=B1 23%     -12.8       12.05        perf-profile.calltrace=
.cycles-pp.sctp_outq_sack.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv=
.sctp_rcv
>      30.06 =C2=B1 15%     -10.1       19.94        perf-profile.calltrace=
.cycles-pp.sctp_do_sm.sctp_assoc_bh_rcv.sctp_rcv.ip_protocol_deliver_rcu.ip=
_local_deliver_finish
>      29.87 =C2=B1 15%     -10.1       19.79        perf-profile.calltrace=
.cycles-pp.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sctp_rcv.ip_pr=
otocol_deliver_rcu
>       9.59 =C2=B1 39%      -9.6        0.00        perf-profile.calltrace=
.cycles-pp.secondary_startup_64_no_verify
>       9.59 =C2=B1 39%      -9.6        0.00        perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64_no_verify
>       9.59 =C2=B1 39%      -9.6        0.00        perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>       9.58 =C2=B1 39%      -9.6        0.00        perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_n=
o_verify
>      34.06 =C2=B1 11%      -7.8       26.31        perf-profile.calltrace=
.cycles-pp.sctp_assoc_bh_rcv.sctp_rcv.ip_protocol_deliver_rcu.ip_local_deli=
ver_finish.__netif_receive_skb_one_core
>       6.21 =C2=B1 36%      -6.2        0.00        perf-profile.calltrace=
.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.seco=
ndary_startup_64_no_verify
>      37.41 =C2=B1  7%      -5.9       31.54 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sctp_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__=
netif_receive_skb_one_core.process_backlog
>       7.73 =C2=B1 27%      -5.8        1.88 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__=
wake_up_common.__wake_up_common_lock
>       7.70 =C2=B1 27%      -5.8        1.85 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremov=
e_wake_function.__wake_up_common
>       5.83 =C2=B1 37%      -5.8        0.00        perf-profile.calltrace=
.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_=
secondary
>       5.82 =C2=B1 37%      -5.8        0.00        perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_=
startup_entry
>       5.73 =C2=B1 53%      -5.7        0.00        perf-profile.calltrace=
.cycles-pp._raw_spin_lock.try_to_wake_up.autoremove_wake_function.__wake_up=
_common.__wake_up_common_lock
>      37.73 =C2=B1  7%      -5.7       32.02 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_rec=
eive_skb_one_core.process_backlog.__napi_poll
>       5.67 =C2=B1 37%      -5.7        0.00        perf-profile.calltrace=
.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_ca=
ll.do_idle
>      37.82 =C2=B1  7%      -5.7       32.16 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.proces=
s_backlog.__napi_poll.net_rx_action
>       5.53 =C2=B1 37%      -5.5        0.00        perf-profile.calltrace=
.cycles-pp.mwait_idle_with_hints.intel_idle_irq.cpuidle_enter_state.cpuidle=
_enter.cpuidle_idle_call
>       5.51 =C2=B1 55%      -5.5        0.00        perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.try_to_wake_up.a=
utoremove_wake_function.__wake_up_common
>       7.28 =C2=B1 24%      -5.2        2.13 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.sctp=
_skb_recv_datagram
>      11.45 =C2=B1 13%      -4.9        6.51        perf-profile.calltrace=
.cycles-pp.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvmsg.____sys_recvmsg=
.___sys_recvmsg
>      38.92 =C2=B1  6%      -4.9       34.03 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.ne=
t_rx_action.__softirqentry_text_start
>      10.03 =C2=B1 16%      -4.9        5.15        perf-profile.calltrace=
.cycles-pp.__schedule.schedule.schedule_timeout.sctp_skb_recv_datagram.sctp=
_recvmsg
>      10.11 =C2=B1 15%      -4.8        5.29        perf-profile.calltrace=
.cycles-pp.schedule.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.in=
et_recvmsg
>      10.22 =C2=B1 15%      -4.8        5.42        perf-profile.calltrace=
.cycles-pp.schedule_timeout.sctp_skb_recv_datagram.sctp_recvmsg.inet_recvms=
g.____sys_recvmsg
>      39.28 =C2=B1  6%      -4.7       34.59 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.process_backlog.__napi_poll.net_rx_action.__softirqentry_te=
xt_start.do_softirq
>      39.35 =C2=B1  6%      -4.7       34.70 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__napi_poll.net_rx_action.__softirqentry_text_start.do_soft=
irq.__local_bh_enable_ip
>      39.71 =C2=B1  6%      -4.5       35.22 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.net_rx_action.__softirqentry_text_start.do_softirq.__local_=
bh_enable_ip.ip_finish_output2
>      40.39 =C2=B1  5%      -4.1       36.26 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.i=
p_finish_output2.__ip_queue_xmit
>      40.61 =C2=B1  5%      -4.0       36.62        perf-profile.calltrace=
.cycles-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmi=
t.sctp_packet_transmit
>      40.74 =C2=B1  5%      -3.9       36.84 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__local_bh_enable_ip.ip_finish_output2.__ip_queue_xmit.sctp=
_packet_transmit.sctp_outq_flush
>       4.08 =C2=B1 38%      -3.2        0.91 =C2=B1 31%  perf-profile.call=
trace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wa=
ke_up.autoremove_wake_function
>      16.65 =C2=B1  5%      -3.0       13.65        perf-profile.calltrace=
.cycles-pp.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_r=
ecvmsg
>      16.77 =C2=B1  4%      -2.9       13.86        perf-profile.calltrace=
.cycles-pp.inet_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_sys=
call_64
>      43.11 =C2=B1  4%      -2.7       40.40        perf-profile.calltrace=
.cycles-pp.ip_finish_output2.__ip_queue_xmit.sctp_packet_transmit.sctp_outq=
_flush.sctp_cmd_interpreter
>      17.55 =C2=B1  3%      -2.6       14.94        perf-profile.calltrace=
.cycles-pp.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>       3.59 =C2=B1 35%      -2.6        1.04 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedu=
le_timeout
>      44.11 =C2=B1  3%      -2.1       42.00        perf-profile.calltrace=
.cycles-pp.__ip_queue_xmit.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_in=
terpreter.sctp_do_sm
>      18.46 =C2=B1  2%      -2.1       16.41        perf-profile.calltrace=
.cycles-pp.___sys_recvmsg.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.recvmsg
>      18.80            -1.8       16.96        perf-profile.calltrace.cycl=
es-pp.__sys_recvmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvmsg
>      19.48            -1.8       17.71        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvmsg
>      19.61            -1.7       17.93        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.recvmsg
>      20.79            -1.4       19.42        perf-profile.calltrace.cycl=
es-pp.recvmsg
>       0.61 =C2=B1  5%      +0.1        0.72 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.sc=
tp_skb_recv_datagram
>       0.85 =C2=B1 12%      +0.3        1.18 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.consume_skb.sctp_chunk_put.sctp_ulpevent_free.sctp_recvmsg.=
inet_recvmsg
>       0.39 =C2=B1 70%      +0.3        0.73 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__check_object_size.simple_copy_to_iter.__skb_datagram_iter=
.skb_copy_datagram_iter.sctp_recvmsg
>       0.62 =C2=B1 18%      +0.4        0.99 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.skb_release_head_state.consume_skb.sctp_chunk_put.sctp_ulpe=
vent_free.sctp_recvmsg
>       1.39 =C2=B1 10%      +0.4        1.76 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sctp_chunk_put.sctp_ulpevent_free.sctp_recvmsg.inet_recvmsg=
.____sys_recvmsg
>       0.42 =C2=B1 71%      +0.4        0.82 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.simple_copy_to_iter.__skb_datagram_iter.skb_copy_datagram_i=
ter.sctp_recvmsg.inet_recvmsg
>       0.18 =C2=B1141%      +0.4        0.60 =C2=B1  3%  perf-profile.call=
trace.cycles-pp._copy_to_iter.__skb_datagram_iter.skb_copy_datagram_iter.sc=
tp_recvmsg.inet_recvmsg
>       0.45 =C2=B1 72%      +0.4        0.87        perf-profile.calltrace=
.cycles-pp.kfree_skb_reason.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___sy=
s_recvmsg
>       1.10 =C2=B1 17%      +0.5        1.55 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.sctp_recvmsg.ine=
t_recvmsg.____sys_recvmsg
>       0.18 =C2=B1141%      +0.5        0.65 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.switch_mm_irqs_off.__schedule.schedule.schedule_timeout.sct=
p_skb_recv_datagram
>       1.13 =C2=B1 17%      +0.5        1.60 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.skb_copy_datagram_iter.sctp_recvmsg.inet_recvmsg.____sys_re=
cvmsg.___sys_recvmsg
>       0.18 =C2=B1141%      +0.5        0.69 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__import_iovec.import_iovec.___sys_recvmsg.__sys_recvmsg.do=
_syscall_64
>       0.44 =C2=B1 73%      +0.5        0.96 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.dst_release.skb_release_head_state.consume_skb.sctp_chunk_p=
ut.sctp_ulpevent_free
>       0.00            +0.5        0.53 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.sock_recvmsg.____sys_recvmsg.___sys_recvmsg.__sys_recvmsg.do_sys=
call_64
>       0.19 =C2=B1141%      +0.5        0.72 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.import_iovec.___sys_recvmsg.__sys_recvmsg.do_syscall_64.ent=
ry_SYSCALL_64_after_hwframe
>       0.00            +0.5        0.54 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.iovec_from_user.__import_iovec.import_iovec.___sys_recvmsg.__sys=
_recvmsg
>       0.00            +0.6        0.56        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.sendmsg
>       2.17 =C2=B1  9%      +0.6        2.76        perf-profile.calltrace=
.cycles-pp.sctp_ulpevent_free.sctp_recvmsg.inet_recvmsg.____sys_recvmsg.___=
sys_recvmsg
>       0.00            +0.6        0.60 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendmsg
>       1.51 =C2=B1 24%      +0.6        2.13 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.sctp_addrs_lookup_transport.__sctp_rcv_lookup.sctp_rcv.ip_p=
rotocol_deliver_rcu.ip_local_deliver_finish
>       0.00            +0.6        0.63 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.sendmsg
>       1.57 =C2=B1 24%      +0.7        2.22 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.__sctp_rcv_lookup.sctp_rcv.ip_protocol_deliver_rcu.ip_local=
_deliver_finish.__netif_receive_skb_one_core
>       0.34 =C2=B1141%      +0.7        1.01 =C2=B1 26%  perf-profile.call=
trace.cycles-pp.sctp_eat_data.sctp_sf_eat_data_6_2.sctp_do_sm.sctp_assoc_bh=
_rcv.sctp_rcv
>       0.35 =C2=B1141%      +0.7        1.07 =C2=B1 30%  perf-profile.call=
trace.cycles-pp.sctp_packet_config.sctp_outq_select_transport.sctp_outq_flu=
sh_data.sctp_outq_flush.sctp_cmd_interpreter
>       0.90 =C2=B1 72%      +0.7        1.62 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__rhashtable_lookup.sctp_addrs_lookup_transport.__sctp_rcv_=
lookup.sctp_rcv.ip_protocol_deliver_rcu
>       0.59 =C2=B1 88%      +0.7        1.34 =C2=B1 28%  perf-profile.call=
trace.cycles-pp.sctp_queue_purge_ulpevents.sctp_ulpq_tail_event.do_ulpq_tai=
l_event.sctp_cmd_interpreter.sctp_do_sm
>       0.37 =C2=B1141%      +0.8        1.13 =C2=B1 27%  perf-profile.call=
trace.cycles-pp.__alloc_skb.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_i=
nterpreter.sctp_do_sm
>       0.88 =C2=B1 72%      +0.8        1.65 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.sctp_ulpevent_make_sender_dry_event.sctp_sf_do_no_pending_t=
sn.sctp_do_sm.sctp_cmd_interpreter.sctp_do_sm
>       0.38 =C2=B1141%      +0.8        1.17 =C2=B1 27%  perf-profile.call=
trace.cycles-pp.loopback_xmit.dev_hard_start_xmit.__dev_queue_xmit.ip_finis=
h_output2.__ip_queue_xmit
>       0.35 =C2=B1141%      +0.8        1.16 =C2=B1 31%  perf-profile.call=
trace.cycles-pp.__skb_clone.sctp_ulpevent_make_rcvmsg.sctp_ulpq_tail_data.s=
ctp_cmd_interpreter.sctp_do_sm
>       0.92 =C2=B1 72%      +0.8        1.74 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.sctp_sf_do_no_pending_tsn.sctp_do_sm.sctp_cmd_interpreter.s=
ctp_do_sm.sctp_assoc_bh_rcv
>       0.52 =C2=B1 74%      +0.9        1.39 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.sendmsg
>       0.00            +0.9        0.89 =C2=B1 26%  perf-profile.calltrace=
.cycles-pp.sctp_user_addto_chunk.sctp_datamsg_from_user.sctp_sendmsg_to_aso=
c.sctp_sendmsg.sock_sendmsg
>       0.00            +0.9        0.89 =C2=B1 27%  perf-profile.calltrace=
.cycles-pp.__alloc_skb.sctp_ulpevent_make_sender_dry_event.sctp_sf_do_no_pe=
nding_tsn.sctp_do_sm.sctp_cmd_interpreter
>       0.92 =C2=B1 72%      +0.9        1.82 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.sctp_ulpq_tail_event.do_ulpq_tail_event.sctp_cmd_interprete=
r.sctp_do_sm.sctp_cmd_interpreter
>       1.94 =C2=B1 19%      +0.9        2.85        perf-profile.calltrace=
.cycles-pp.sctp_make_sack.sctp_packet_append_chunk.sctp_packet_transmit_chu=
nk.sctp_outq_flush_data.sctp_outq_flush
>       0.00            +0.9        0.93 =C2=B1 29%  perf-profile.calltrace=
.cycles-pp.pick_next_task_fair.__schedule.schedule.exit_to_user_mode_loop.e=
xit_to_user_mode_prepare
>       1.95 =C2=B1 15%      +0.9        2.88 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__dev_queue_xmit.ip_finish_output2.__ip_queue_xmit.sctp_pac=
ket_transmit.sctp_outq_flush
>       0.00            +1.0        0.95 =C2=B1 31%  perf-profile.calltrace=
.cycles-pp.__copy_skb_header.__skb_clone.sctp_ulpevent_make_rcvmsg.sctp_ulp=
q_tail_data.sctp_cmd_interpreter
>       0.66 =C2=B1 73%      +1.0        1.62        perf-profile.calltrace=
.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.sendmsg.main
>       0.00            +1.0        0.97 =C2=B1 29%  perf-profile.calltrace=
.cycles-pp.sctp_chunk_put.sctp_packet_pack.sctp_packet_transmit.sctp_outq_f=
lush.sctp_cmd_interpreter
>       1.58 =C2=B1 22%      +1.0        2.56 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sctp_ulpevent_make_rcvmsg.sctp_ulpq_tail_data.sctp_cmd_inte=
rpreter.sctp_do_sm.sctp_assoc_bh_rcv
>       1.66 =C2=B1 22%      +1.0        2.64 =C2=B1  2%  perf-profile.call=
trace.cycles-pp._sctp_make_chunk.sctp_make_datafrag_empty.sctp_datamsg_from=
_user.sctp_sendmsg_to_asoc.sctp_sendmsg
>       0.64 =C2=B1 74%      +1.0        1.64 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe.sendmsg.process_requests
>       0.00            +1.0        1.03 =C2=B1 26%  perf-profile.calltrace=
.cycles-pp.sendmsg_copy_msghdr.___sys_sendmsg.__sys_sendmsg.do_syscall_64.e=
ntry_SYSCALL_64_after_hwframe
>       1.04 =C2=B1 72%      +1.0        2.09 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.do_ulpq_tail_event.sctp_cmd_interpreter.sctp_do_sm.sctp_cmd=
_interpreter.sctp_do_sm
>       1.60 =C2=B1 25%      +1.1        2.68        perf-profile.calltrace=
.cycles-pp.sctp_packet_pack.sctp_packet_transmit.sctp_outq_flush.sctp_cmd_i=
nterpreter.sctp_do_sm
>       2.22 =C2=B1 22%      +1.3        3.47 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sctp_make_datafrag_empty.sctp_datamsg_from_user.sctp_sendms=
g_to_asoc.sctp_sendmsg.sock_sendmsg
>       2.25 =C2=B1 20%      +1.3        3.54 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.sctp_ulpq_tail_data.sctp_cmd_interpreter.sctp_do_sm.sctp_as=
soc_bh_rcv.sctp_rcv
>       1.15 =C2=B1 72%      +1.3        2.45        perf-profile.calltrace=
.cycles-pp.sctp_cmd_interpreter.sctp_do_sm.sctp_cmd_interpreter.sctp_do_sm.=
sctp_assoc_bh_rcv
>       3.13 =C2=B1 18%      +1.4        4.55 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sctp_packet_append_chunk.sctp_packet_transmit_chunk.sctp_ou=
tq_flush_data.sctp_outq_flush.sctp_cmd_interpreter
>       3.17 =C2=B1 18%      +1.4        4.62        perf-profile.calltrace=
.cycles-pp.sctp_packet_transmit_chunk.sctp_outq_flush_data.sctp_outq_flush.=
sctp_cmd_interpreter.sctp_do_sm
>       2.81 =C2=B1 25%      +1.8        4.58        perf-profile.calltrace=
.cycles-pp.sctp_do_sm.sctp_cmd_interpreter.sctp_do_sm.sctp_assoc_bh_rcv.sct=
p_rcv
>       3.65 =C2=B1 21%      +2.0        5.61        perf-profile.calltrace=
.cycles-pp.sctp_datamsg_from_user.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_se=
ndmsg.____sys_sendmsg
>       0.94 =C2=B1 74%      +2.0        2.92        perf-profile.calltrace=
.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mode_pre=
pare.syscall_exit_to_user_mode
>       0.97 =C2=B1 74%      +2.0        3.02        perf-profile.calltrace=
.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscal=
l_exit_to_user_mode.do_syscall_64
>       1.02 =C2=B1 73%      +2.1        3.14        perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to=
_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       5.85 =C2=B1 16%      +2.4        8.23 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.sctp_outq_flush_data.sctp_outq_flush.sctp_cmd_interpreter.s=
ctp_do_sm.sctp_primitive_SEND
>       1.22 =C2=B1 74%      +2.4        3.65        perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe.sendmsg
>      53.69            +2.5       56.15        perf-profile.calltrace.cycl=
es-pp.sctp_outq_flush.sctp_cmd_interpreter.sctp_do_sm.sctp_primitive_SEND.s=
ctp_sendmsg_to_asoc
>      55.48            +3.4       58.86        perf-profile.calltrace.cycl=
es-pp.sctp_primitive_SEND.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg.__=
__sys_sendmsg
>      32.72 =C2=B1  3%      +3.8       36.51        perf-profile.calltrace=
.cycles-pp.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendm=
sg.process_requests
>      32.26 =C2=B1  4%      +4.2       36.43        perf-profile.calltrace=
.cycles-pp.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendm=
sg.main
>      33.60 =C2=B1  4%      +4.7       38.30        perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendmsg.process_req=
uests.spawn_child
>      33.68 =C2=B1  4%      +4.8       38.44        perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.sendmsg.process_requests.spawn_ch=
ild.accept_connection
>      33.91 =C2=B1  4%      +4.9       38.80        perf-profile.calltrace=
.cycles-pp.sendmsg.process_requests.spawn_child.accept_connection.accept_co=
nnections
>      33.10 =C2=B1  5%      +5.1       38.20        perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendmsg.main.__libc=
_start_main
>      33.18 =C2=B1  5%      +5.2       38.34        perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe.sendmsg.main.__libc_start_main
>      33.42 =C2=B1  5%      +5.3       38.70        perf-profile.calltrace=
.cycles-pp.sendmsg.main.__libc_start_main
>      60.21 =C2=B1  2%      +5.6       65.80        perf-profile.calltrace=
.cycles-pp.sctp_sendmsg_to_asoc.sctp_sendmsg.sock_sendmsg.____sys_sendmsg._=
__sys_sendmsg
>      61.53 =C2=B1  2%      +6.2       67.77        perf-profile.calltrace=
.cycles-pp.sctp_sendmsg.sock_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_s=
endmsg
>      62.15 =C2=B1  2%      +6.5       68.70        perf-profile.calltrace=
.cycles-pp.sock_sendmsg.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_sys=
call_64
>      63.71 =C2=B1  3%      +7.3       71.00        perf-profile.calltrace=
.cycles-pp.____sys_sendmsg.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry=
_SYSCALL_64_after_hwframe
>      64.59 =C2=B1  3%      +7.9       72.47        perf-profile.calltrace=
.cycles-pp.___sys_sendmsg.__sys_sendmsg.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.sendmsg
>      22.44 =C2=B1 20%     +11.6       34.07        perf-profile.calltrace=
.cycles-pp.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg_to_asoc.sctp_sendmsg=
.sock_sendmsg
>      23.46 =C2=B1 20%     +12.0       35.48        perf-profile.calltrace=
.cycles-pp.sctp_cmd_interpreter.sctp_do_sm.sctp_primitive_SEND.sctp_sendmsg=
_to_asoc.sctp_sendmsg
>      20.04 =C2=B1 31%     -14.0        6.02 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>      20.17 =C2=B1 31%     -14.0        6.18 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__sctp_write_space
>      20.61 =C2=B1 30%     -13.9        6.66 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_wfree
>      19.73 =C2=B1 32%     -13.9        5.84 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>      19.56 =C2=B1 32%     -13.9        5.68 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>      19.63 =C2=B1 32%     -13.8        5.78 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.autoremove_wake_function
>      22.46 =C2=B1 27%     -13.4        9.10 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.consume_skb
>      21.86 =C2=B1 28%     -13.3        8.56 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.skb_release_head_state
>      23.89 =C2=B1 24%     -12.9       10.95        perf-profile.children.=
cycles-pp.sctp_chunk_put
>      24.98 =C2=B1 23%     -12.9       12.10        perf-profile.children.=
cycles-pp.sctp_outq_sack
>       9.59 =C2=B1 39%      -9.6        0.00        perf-profile.children.=
cycles-pp.secondary_startup_64_no_verify
>       9.59 =C2=B1 39%      -9.6        0.00        perf-profile.children.=
cycles-pp.start_secondary
>       9.59 =C2=B1 39%      -9.6        0.00        perf-profile.children.=
cycles-pp.cpu_startup_entry
>       9.58 =C2=B1 39%      -9.6        0.00        perf-profile.children.=
cycles-pp.do_idle
>       8.32 =C2=B1 53%      -8.3        0.00        perf-profile.children.=
cycles-pp.native_queued_spin_lock_slowpath
>       9.11 =C2=B1 48%      -8.3        0.85 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       8.34 =C2=B1 29%      -8.0        0.30 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.update_cfs_group
>      34.18 =C2=B1 10%      -7.8       26.37        perf-profile.children.=
cycles-pp.sctp_assoc_bh_rcv
>      14.60 =C2=B1 16%      -6.5        8.11        perf-profile.children.=
cycles-pp.__schedule
>       6.21 =C2=B1 36%      -6.2        0.00        perf-profile.children.=
cycles-pp.cpuidle_idle_call
>      37.55 =C2=B1  7%      -5.9       31.64 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_rcv
>       5.83 =C2=B1 37%      -5.8        0.00        perf-profile.children.=
cycles-pp.cpuidle_enter
>       5.82 =C2=B1 37%      -5.8        0.00        perf-profile.children.=
cycles-pp.cpuidle_enter_state
>      37.86 =C2=B1  7%      -5.8       32.10 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ip_protocol_deliver_rcu
>       7.75 =C2=B1 27%      -5.8        2.00 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       7.76 =C2=B1 27%      -5.7        2.04 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>      37.92 =C2=B1  7%      -5.7       32.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ip_local_deliver_finish
>       5.68 =C2=B1 37%      -5.7        0.00        perf-profile.children.=
cycles-pp.mwait_idle_with_hints
>       5.67 =C2=B1 37%      -5.7        0.00        perf-profile.children.=
cycles-pp.intel_idle_irq
>       7.31 =C2=B1 24%      -5.2        2.15        perf-profile.children.=
cycles-pp.dequeue_task_fair
>      39.05 =C2=B1  6%      -4.9       34.11 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__netif_receive_skb_one_core
>      11.47 =C2=B1 13%      -4.9        6.54        perf-profile.children.=
cycles-pp.sctp_skb_recv_datagram
>      10.22 =C2=B1 15%      -4.8        5.43        perf-profile.children.=
cycles-pp.schedule_timeout
>      39.40 =C2=B1  6%      -4.8       34.65 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.process_backlog
>      39.47 =C2=B1  6%      -4.7       34.75        perf-profile.children.=
cycles-pp.__napi_poll
>      39.83 =C2=B1  5%      -4.5       35.28 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.net_rx_action
>      40.64 =C2=B1  5%      -4.3       36.34        perf-profile.children.=
cycles-pp.__softirqentry_text_start
>      40.73 =C2=B1  5%      -4.0       36.68        perf-profile.children.=
cycles-pp.do_softirq
>      40.99 =C2=B1  4%      -3.9       37.11        perf-profile.children.=
cycles-pp.__local_bh_enable_ip
>       5.37 =C2=B1 36%      -3.7        1.63 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>      11.53 =C2=B1  8%      -3.2        8.33        perf-profile.children.=
cycles-pp.schedule
>      17.05 =C2=B1  4%      -3.0       14.02        perf-profile.children.=
cycles-pp.sctp_recvmsg
>       4.13 =C2=B1 38%      -3.0        1.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>      16.78 =C2=B1  4%      -2.9       13.86        perf-profile.children.=
cycles-pp.inet_recvmsg
>      43.24 =C2=B1  3%      -2.8       40.49        perf-profile.children.=
cycles-pp.ip_finish_output2
>      17.55 =C2=B1  3%      -2.6       14.96        perf-profile.children.=
cycles-pp.____sys_recvmsg
>       3.60 =C2=B1 35%      -2.5        1.05 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>      44.23 =C2=B1  3%      -2.2       42.06        perf-profile.children.=
cycles-pp.__ip_queue_xmit
>      18.47 =C2=B1  2%      -2.0       16.43        perf-profile.children.=
cycles-pp.___sys_recvmsg
>      18.81            -1.8       16.97        perf-profile.children.cycle=
s-pp.__sys_recvmsg
>      20.96            -1.3       19.63        perf-profile.children.cycle=
s-pp.recvmsg
>       1.03 =C2=B1 24%      -0.4        0.67        perf-profile.children.=
cycles-pp.asm_sysvec_apic_timer_interrupt
>       1.43            -0.2        1.18        perf-profile.children.cycle=
s-pp._raw_spin_lock_irqsave
>       0.39 =C2=B1 29%      -0.2        0.16        perf-profile.children.=
cycles-pp.scheduler_tick
>       0.84 =C2=B1 20%      -0.2        0.62        perf-profile.children.=
cycles-pp.sysvec_apic_timer_interrupt
>       0.30 =C2=B1 28%      -0.2        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.task_tick_fair
>       0.52 =C2=B1 22%      -0.2        0.31        perf-profile.children.=
cycles-pp.__hrtimer_run_queues
>       0.44 =C2=B1 25%      -0.2        0.24        perf-profile.children.=
cycles-pp.update_process_times
>       0.46 =C2=B1 24%      -0.2        0.27        perf-profile.children.=
cycles-pp.tick_sched_timer
>       0.44 =C2=B1 26%      -0.2        0.25        perf-profile.children.=
cycles-pp.tick_sched_handle
>       0.81 =C2=B1  8%      -0.2        0.64        perf-profile.children.=
cycles-pp._raw_spin_lock_bh
>       0.68 =C2=B1  2%      -0.1        0.54        perf-profile.children.=
cycles-pp.available_idle_cpu
>       0.32 =C2=B1 17%      -0.1        0.20        perf-profile.children.=
cycles-pp.finish_task_switch
>       0.24 =C2=B1  5%      -0.0        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sctp_chunk_hold
>       0.27            -0.0        0.23 =C2=B1  2%  perf-profile.children.=
cycles-pp.prepare_to_wait_exclusive
>       0.12 =C2=B1  4%      -0.0        0.10        perf-profile.children.=
cycles-pp.resched_curr
>       0.07            -0.0        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.sctp_transport_burst_limited
>       0.06 =C2=B1  8%      +0.0        0.07        perf-profile.children.=
cycles-pp.sctp_sched_fcfs_dequeue_done
>       0.06 =C2=B1 13%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.sctp_tsnmap_mark
>       0.08 =C2=B1 16%      +0.0        0.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.perf_trace_buf_update
>       0.14 =C2=B1 11%      +0.0        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.cpumask_next_wrap
>       0.33            +0.0        0.35 =C2=B1  2%  perf-profile.children.=
cycles-pp.sctp_transport_put
>       0.07 =C2=B1 20%      +0.0        0.10 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.sctp_transport_burst_reset
>       0.08 =C2=B1 20%      +0.0        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__x64_sys_recvmsg
>       0.11 =C2=B1 18%      +0.0        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.sctp_auth_send_cid
>       0.11 =C2=B1 15%      +0.0        0.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sctp_transport_raise_cwnd
>       0.06 =C2=B1 14%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sctp_v4_is_ce
>       0.04 =C2=B1 71%      +0.0        0.07        perf-profile.children.=
cycles-pp.__cgroup_account_cputime
>       0.09 =C2=B1 13%      +0.0        0.13 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.rb_erase
>       0.07 =C2=B1 23%      +0.0        0.11        perf-profile.children.=
cycles-pp.ip_send_check
>       0.03 =C2=B1 70%      +0.0        0.07        perf-profile.children.=
cycles-pp.entry_SYSCALL_64_safe_stack
>       0.15 =C2=B1 13%      +0.0        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_min_vruntime
>       0.06 =C2=B1 14%      +0.0        0.10 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.sctp_sched_dequeue_done
>       0.04 =C2=B1 71%      +0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__rdgsbase_inactive
>       0.04 =C2=B1 73%      +0.0        0.08        perf-profile.children.=
cycles-pp.__x64_sys_sendmsg
>       0.04 =C2=B1 73%      +0.0        0.08        perf-profile.children.=
cycles-pp.sctp_init_addrs
>       0.04 =C2=B1 73%      +0.0        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__raise_softirq_irqoff
>       0.13 =C2=B1 12%      +0.0        0.17 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.nf_hook_slow
>       0.04 =C2=B1 71%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.place_entity
>       0.04 =C2=B1 71%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.apparmor_socket_sendmsg
>       0.07 =C2=B1 11%      +0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.validate_xmit_vlan
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.sctp_v4_cmp_addr
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.raw_local_deliver
>       0.09 =C2=B1 14%      +0.0        0.13 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode_prepare
>       0.09 =C2=B1 23%      +0.0        0.13        perf-profile.children.=
cycles-pp.__wrgsbase_inactive
>       0.04 =C2=B1 71%      +0.0        0.08        perf-profile.children.=
cycles-pp.perf_trace_buf_alloc
>       0.02 =C2=B1141%      +0.0        0.06        perf-profile.children.=
cycles-pp.apparmor_socket_recvmsg
>       0.12 =C2=B1 10%      +0.0        0.16 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.skb_network_protocol
>       0.02 =C2=B1141%      +0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.syscall_enter_from_user_mode
>       0.04 =C2=B1 70%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.kfree_skbmem
>       0.04 =C2=B1 73%      +0.0        0.09 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.eth_type_trans
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.schedule_debug
>       0.11 =C2=B1 19%      +0.0        0.16 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_transport_update_rto
>       0.28 =C2=B1 13%      +0.0        0.33        perf-profile.children.=
cycles-pp.sctp_sf_eat_sack_6_2
>       0.15 =C2=B1 16%      +0.0        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.perf_tp_event
>       0.07 =C2=B1 28%      +0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__put_user_nocheck_8
>       0.12 =C2=B1 10%      +0.1        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.pick_next_entity
>       0.04 =C2=B1 71%      +0.1        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sctp_control_release_owner
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.switch_ldt
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.apparmor_socket_sock_rcv_skb
>       0.04 =C2=B1 73%      +0.1        0.09        perf-profile.children.=
cycles-pp.sctp_ulpevent_get_notification_type
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.sock_wake_async
>       0.38 =C2=B1  4%      +0.1        0.43        perf-profile.children.=
cycles-pp.sctp_association_hold
>       0.31 =C2=B1 13%      +0.1        0.36 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_wakeup_template
>       0.14 =C2=B1 15%      +0.1        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sctp_chunk_abandoned
>       0.05 =C2=B1 72%      +0.1        0.11 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.sctp4_rcv
>       0.04 =C2=B1 73%      +0.1        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.calc_wheel_index
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.memset
>       0.04 =C2=B1 76%      +0.1        0.10 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.sctp_ulpq_retrieve_ordered
>       0.05 =C2=B1 72%      +0.1        0.10        perf-profile.children.=
cycles-pp.skb_pull
>       0.31 =C2=B1 13%      +0.1        0.37 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.10 =C2=B1 27%      +0.1        0.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.ip_finish_output
>       0.04 =C2=B1 71%      +0.1        0.10 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.sctp_inet_msgname
>       0.04 =C2=B1 76%      +0.1        0.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.skb_free_head
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.is_vmalloc_addr
>       0.04 =C2=B1 73%      +0.1        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_switch
>       0.10 =C2=B1 14%      +0.1        0.16 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.detach_if_pending
>       0.08 =C2=B1 27%      +0.1        0.14 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.rcu_note_context_switch
>       0.16 =C2=B1 13%      +0.1        0.21 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sctp_id2assoc
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.ip_local_deliver
>       0.08 =C2=B1 32%      +0.1        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.inet_sendmsg
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.neigh_hh_output
>       0.04 =C2=B1 73%      +0.1        0.10        perf-profile.children.=
cycles-pp.save_fpregs_to_fpstate
>       0.25 =C2=B1 10%      +0.1        0.31 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.skb_set_owner_w
>       0.10 =C2=B1 19%      +0.1        0.17 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_outq_flush_ctrl
>       0.09 =C2=B1 23%      +0.1        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sctp_tsnmap_num_gabs
>       0.05 =C2=B1 78%      +0.1        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.sctp_v4_from_skb
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sctp_association_get_next_tsn
>       0.10 =C2=B1 14%      +0.1        0.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.cpuacct_charge
>       0.12 =C2=B1 20%      +0.1        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.rcu_all_qs
>       0.25 =C2=B1 16%      +0.1        0.32 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sctp_validate_data
>       0.05 =C2=B1 77%      +0.1        0.12 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.ipv4_mtu
>       0.30 =C2=B1 13%      +0.1        0.37 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.send_sctp_rr
>       0.14 =C2=B1 20%      +0.1        0.21 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.copyin
>       0.05 =C2=B1 72%      +0.1        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.clear_buddies
>       0.12 =C2=B1 26%      +0.1        0.19 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_sf_do_prm_send
>       0.48 =C2=B1 11%      +0.1        0.55 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__list_del_entry_valid
>       0.40 =C2=B1 10%      +0.1        0.47        perf-profile.children.=
cycles-pp.update_rq_clock
>       0.03 =C2=B1141%      +0.1        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.sctp_inet_cmp_addr
>       0.10 =C2=B1 31%      +0.1        0.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.check_stack_object
>       0.05 =C2=B1 74%      +0.1        0.12 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.sctp_chunk_assign_tsn
>       0.40 =C2=B1 13%      +0.1        0.48        perf-profile.children.=
cycles-pp.__switch_to
>       0.12 =C2=B1 33%      +0.1        0.21 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__ip_local_out
>       0.15 =C2=B1 21%      +0.1        0.24 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_datamsg_destroy
>       0.32 =C2=B1 11%      +0.1        0.41        perf-profile.children.=
cycles-pp.sock_kfree_s
>       0.18 =C2=B1 20%      +0.1        0.26        perf-profile.children.=
cycles-pp._raw_spin_lock_irq
>       0.10 =C2=B1 40%      +0.1        0.19 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.sctp_get_af_specific
>       0.58 =C2=B1  5%      +0.1        0.67 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_association_put
>       0.28 =C2=B1 15%      +0.1        0.37 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_inet_skb_msgname
>       0.25 =C2=B1 11%      +0.1        0.34        perf-profile.children.=
cycles-pp.sctp_datamsg_put
>       0.14 =C2=B1 23%      +0.1        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.syscall_return_via_sysret
>       0.12 =C2=B1 42%      +0.1        0.21 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.sctp_generate_fwdtsn
>       0.12 =C2=B1 23%      +0.1        0.21 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.sctp_sendmsg_check_sflags
>       0.15 =C2=B1 28%      +0.1        0.24 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__genradix_ptr
>       0.35 =C2=B1  7%      +0.1        0.44        perf-profile.children.=
cycles-pp.release_sock
>       0.09 =C2=B1 39%      +0.1        0.19 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_ulpevent_is_notification
>       0.22 =C2=B1 12%      +0.1        0.31 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.netif_skb_features
>       0.25 =C2=B1 21%      +0.1        0.34        perf-profile.children.=
cycles-pp.___perf_sw_event
>       0.15 =C2=B1 21%      +0.1        0.25 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sctp_sched_dequeue_common
>       0.13 =C2=B1 26%      +0.1        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_chunk_assign_ssn
>       0.20 =C2=B1 17%      +0.1        0.30 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.sock_wfree
>       0.20 =C2=B1 22%      +0.1        0.30 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_sock_rfree
>       0.11 =C2=B1 46%      +0.1        0.21 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.security_sock_rcv_skb
>       0.16 =C2=B1 27%      +0.1        0.27        perf-profile.children.=
cycles-pp.ip_rcv_core
>       0.15 =C2=B1 22%      +0.1        0.25 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.should_failslab
>       0.15 =C2=B1 23%      +0.1        0.25 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.ip_skb_dst_mtu
>       0.17 =C2=B1 29%      +0.1        0.27 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_sm_lookup_event
>       0.20 =C2=B1 21%      +0.1        0.31 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.read_tsc
>       0.16 =C2=B1 33%      +0.1        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.ip_local_out
>       0.15 =C2=B1 27%      +0.1        0.26 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.sctp_bind_addr_match
>       0.12 =C2=B1 42%      +0.1        0.23 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.set_next_buddy
>       0.24 =C2=B1 22%      +0.1        0.35 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ip_output
>       0.09 =C2=B1 35%      +0.1        0.21        perf-profile.children.=
cycles-pp.clockevents_program_event
>       0.13 =C2=B1 33%      +0.1        0.25 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.kmalloc_slab
>       0.51 =C2=B1 15%      +0.1        0.62        perf-profile.children.=
cycles-pp.__switch_to_asm
>       0.39 =C2=B1 11%      +0.1        0.51 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_outq_tail
>       0.40 =C2=B1 19%      +0.1        0.52 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.restore_fpregs_from_fpstate
>       0.26 =C2=B1 20%      +0.1        0.38 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sctp_cmp_addr_exact
>       0.13 =C2=B1 22%      +0.1        0.25 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__calc_delta
>       0.17 =C2=B1 27%      +0.1        0.29 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sctp_ulpq_order
>       0.19 =C2=B1 21%      +0.1        0.32        perf-profile.children.=
cycles-pp.skb_clone
>       0.38 =C2=B1 16%      +0.1        0.50        perf-profile.children.=
cycles-pp.security_socket_sendmsg
>       0.16 =C2=B1 27%      +0.1        0.29        perf-profile.children.=
cycles-pp.enqueue_timer
>       0.19 =C2=B1 30%      +0.1        0.32        perf-profile.children.=
cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.25 =C2=B1 24%      +0.1        0.38 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.skb_put
>       0.42 =C2=B1 16%      +0.1        0.55        perf-profile.children.=
cycles-pp.__fdget
>       0.17 =C2=B1 34%      +0.1        0.30 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.sctp_ulpevent_init
>       0.33 =C2=B1 11%      +0.1        0.47        perf-profile.children.=
cycles-pp.sctp_transport_hold
>       0.22 =C2=B1 22%      +0.1        0.36 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_ulpevent_receive_data
>       0.15 =C2=B1 34%      +0.1        0.29 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.sctp_v4_addr_valid
>       0.45 =C2=B1 16%      +0.1        0.59 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__ksize
>       0.30 =C2=B1 16%      +0.1        0.44        perf-profile.children.=
cycles-pp.__update_load_avg_se
>       0.50 =C2=B1 16%      +0.1        0.65        perf-profile.children.=
cycles-pp.sockfd_lookup_light
>       0.47 =C2=B1 15%      +0.1        0.61 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._copy_to_iter
>       0.17 =C2=B1 40%      +0.2        0.32 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ipv4_dst_check
>       0.21 =C2=B1 23%      +0.2        0.36 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__ip_finish_output
>       0.27 =C2=B1 27%      +0.2        0.42        perf-profile.children.=
cycles-pp._copy_from_iter
>       0.29 =C2=B1 19%      +0.2        0.45 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc_trace
>       0.25 =C2=B1 29%      +0.2        0.41 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.os_xsave
>       0.59 =C2=B1 17%      +0.2        0.75 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.switch_fpu_return
>       0.23 =C2=B1 28%      +0.2        0.39        perf-profile.children.=
cycles-pp.skb_dequeue
>       0.46 =C2=B1 16%      +0.2        0.62        perf-profile.children.=
cycles-pp.aa_sk_perm
>       0.20 =C2=B1 21%      +0.2        0.36 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.get_nohz_timer_target
>       0.43 =C2=B1 14%      +0.2        0.60 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.enqueue_to_backlog
>       0.33 =C2=B1 21%      +0.2        0.50        perf-profile.children.=
cycles-pp.check_preempt_curr
>       0.30 =C2=B1 24%      +0.2        0.47        perf-profile.children.=
cycles-pp.security_socket_recvmsg
>       0.32 =C2=B1 25%      +0.2        0.49        perf-profile.children.=
cycles-pp.native_sched_clock
>       0.60 =C2=B1 12%      +0.2        0.78 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_chunk_free
>       0.29 =C2=B1 22%      +0.2        0.47        perf-profile.children.=
cycles-pp.__cond_resched
>       0.27 =C2=B1 25%      +0.2        0.46 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.sctp_sendmsg_parse
>       0.35 =C2=B1 22%      +0.2        0.54        perf-profile.children.=
cycles-pp.ttwu_do_wakeup
>       0.38 =C2=B1 24%      +0.2        0.57        perf-profile.children.=
cycles-pp.sched_clock_cpu
>       0.33 =C2=B1 22%      +0.2        0.52 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.irqtime_account_irq
>       0.34 =C2=B1 18%      +0.2        0.53 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.sctp_sched_fcfs_dequeue
>       0.27 =C2=B1 29%      +0.2        0.47        perf-profile.children.=
cycles-pp.copy_user_enhanced_fast_string
>       0.34 =C2=B1 22%      +0.2        0.53        perf-profile.children.=
cycles-pp.sock_recvmsg
>       0.82 =C2=B1  8%      +0.2        1.02 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.sctp_transport_reset_t3_rtx
>       0.20 =C2=B1 40%      +0.2        0.40 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.put_prev_entity
>       0.31 =C2=B1 27%      +0.2        0.51        perf-profile.children.=
cycles-pp.__check_heap_object
>       0.77 =C2=B1 13%      +0.2        0.97 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.del_timer
>       0.19 =C2=B1 46%      +0.2        0.40 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.sk_filter_trim_cap
>       0.50 =C2=B1 13%      +0.2        0.71 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.netif_rx_internal
>       0.30 =C2=B1 20%      +0.2        0.51 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__kmalloc
>       0.31 =C2=B1 26%      +0.2        0.52        perf-profile.children.=
cycles-pp.__entry_text_start
>       0.43 =C2=B1 14%      +0.2        0.64 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.validate_xmit_skb
>       0.29 =C2=B1 30%      +0.2        0.51 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.memcpy_erms
>       0.52 =C2=B1 13%      +0.2        0.74        perf-profile.children.=
cycles-pp.__netif_rx
>       0.45 =C2=B1 14%      +0.2        0.67 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sock_kmalloc
>       0.21 =C2=B1 41%      +0.2        0.43 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.check_preempt_wakeup
>       0.30 =C2=B1 24%      +0.2        0.53 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ip_rcv_finish_core
>       0.47 =C2=B1 18%      +0.2        0.71        perf-profile.children.=
cycles-pp.prepare_task_switch
>       0.31 =C2=B1 22%      +0.2        0.55 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__virt_addr_valid
>       0.38 =C2=B1 24%      +0.2        0.62        perf-profile.children.=
cycles-pp.sctp_inq_pop
>       0.57 =C2=B1 17%      +0.2        0.82 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.simple_copy_to_iter
>       0.37 =C2=B1 25%      +0.3        0.63        perf-profile.children.=
cycles-pp.__netif_receive_skb_core
>       0.44 =C2=B1 21%      +0.3        0.70 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.76 =C2=B1 15%      +0.3        1.02 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sctp_hash_cmp
>       0.34 =C2=B1 26%      +0.3        0.60 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.memcg_slab_post_alloc_hook
>       0.63 =C2=B1 20%      +0.3        0.89        perf-profile.children.=
cycles-pp.copy_user_short_string
>       0.62 =C2=B1 17%      +0.3        0.93 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.check_heap_object
>       0.40 =C2=B1 27%      +0.3        0.71 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       1.23 =C2=B1  9%      +0.3        1.54 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__mod_timer
>       0.48 =C2=B1 26%      +0.3        0.81 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__sctp_packet_append_chunk
>       0.50 =C2=B1 25%      +0.3        0.84 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__might_sleep
>       0.72 =C2=B1 23%      +0.4        1.09        perf-profile.children.=
cycles-pp.sctp_addto_chunk
>       0.87 =C2=B1 16%      +0.4        1.24 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sctp_eat_data
>       0.48 =C2=B1 27%      +0.4        0.86 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_v4_xmit
>       0.53 =C2=B1 30%      +0.4        0.91 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__might_fault
>       0.59 =C2=B1 29%      +0.4        0.98        perf-profile.children.=
cycles-pp.__copy_msghdr_from_user
>       1.51 =C2=B1 12%      +0.4        1.90 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.pick_next_task_fair
>       0.68 =C2=B1 24%      +0.4        1.09 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_user_addto_chunk
>       0.69 =C2=B1 26%      +0.4        1.10 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__might_resched
>       0.59 =C2=B1 27%      +0.4        1.00        perf-profile.children.=
cycles-pp.memset_erms
>       0.58 =C2=B1 26%      +0.4        0.99 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ip_rcv
>       0.66 =C2=B1 24%      +0.4        1.08 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.iovec_from_user
>       0.84 =C2=B1 19%      +0.4        1.29        perf-profile.children.=
cycles-pp.switch_mm_irqs_off
>       0.92 =C2=B1 23%      +0.5        1.37 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_curr
>       1.10 =C2=B1 17%      +0.5        1.56 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__skb_datagram_iter
>       0.96 =C2=B1 16%      +0.5        1.42        perf-profile.children.=
cycles-pp.loopback_xmit
>       1.37 =C2=B1 16%      +0.5        1.83        perf-profile.children.=
cycles-pp.skb_release_data
>       1.04 =C2=B1 20%      +0.5        1.50 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_outq_select_transport
>       0.73 =C2=B1 24%      +0.5        1.20        perf-profile.children.=
cycles-pp.memcg_slab_free_hook
>       1.48 =C2=B1 16%      +0.5        1.95        perf-profile.children.=
cycles-pp.kfree
>       0.81 =C2=B1 25%      +0.5        1.28 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_packet_config
>       1.13 =C2=B1 17%      +0.5        1.61 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.skb_copy_datagram_iter
>       1.01 =C2=B1 19%      +0.5        1.49 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_sf_eat_data_6_2
>       1.70 =C2=B1 14%      +0.5        2.18        perf-profile.children.=
cycles-pp.sctp_check_transmitted
>       0.92 =C2=B1 22%      +0.5        1.41        perf-profile.children.=
cycles-pp.kfree_skb_reason
>       0.70 =C2=B1 22%      +0.5        1.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.dst_release
>       0.63 =C2=B1 29%      +0.5        1.13 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__copy_skb_header
>       0.94 =C2=B1 19%      +0.5        1.44 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc_node
>       0.74 =C2=B1 26%      +0.5        1.25        perf-profile.children.=
cycles-pp.sendmsg_copy_msghdr
>       1.06 =C2=B1 16%      +0.5        1.57        perf-profile.children.=
cycles-pp.dev_hard_start_xmit
>       0.81 =C2=B1 25%      +0.5        1.34 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__import_iovec
>       1.20 =C2=B1 21%      +0.5        1.74 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__rhashtable_lookup
>       2.06 =C2=B1 13%      +0.5        2.60        perf-profile.children.=
cycles-pp.kmem_cache_free
>       0.88 =C2=B1 25%      +0.6        1.45 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.import_iovec
>       1.15 =C2=B1 21%      +0.6        1.74        perf-profile.children.=
cycles-pp.sctp_make_control
>       0.78 =C2=B1 28%      +0.6        1.38 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__skb_clone
>       1.17 =C2=B1 22%      +0.6        1.80        perf-profile.children.=
cycles-pp.sctp_ulpevent_make_sender_dry_event
>       1.00 =C2=B1 26%      +0.6        1.64        perf-profile.children.=
cycles-pp.sctp_queue_purge_ulpevents
>       1.22 =C2=B1 22%      +0.7        1.88        perf-profile.children.=
cycles-pp.sctp_sf_do_no_pending_tsn
>       1.10 =C2=B1 23%      +0.7        1.77        perf-profile.children.=
cycles-pp.kmem_cache_alloc
>       1.06 =C2=B1 25%      +0.7        1.75 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__kmalloc_node_track_caller
>       2.34 =C2=B1 10%      +0.7        3.04        perf-profile.children.=
cycles-pp.sctp_ulpevent_free
>       1.12 =C2=B1 24%      +0.7        1.83 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_chunkify
>       1.38 =C2=B1 19%      +0.7        2.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__check_object_size
>       1.07 =C2=B1 29%      +0.8        1.84        perf-profile.children.=
cycles-pp._copy_from_user
>       1.53 =C2=B1 24%      +0.8        2.29 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sctp_addrs_lookup_transport
>       1.20 =C2=B1 25%      +0.8        1.98 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.kmalloc_reserve
>       1.58 =C2=B1 25%      +0.8        2.38 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__sctp_rcv_lookup
>       1.58 =C2=B1 23%      +0.9        2.49        perf-profile.children.=
cycles-pp.sctp_ulpq_tail_event
>       1.96 =C2=B1 19%      +0.9        2.88        perf-profile.children.=
cycles-pp.sctp_make_sack
>       1.33 =C2=B1 28%      +0.9        2.26        perf-profile.children.=
cycles-pp.do_ulpq_tail_event
>       1.98 =C2=B1 15%      +0.9        2.92 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__dev_queue_xmit
>       1.59 =C2=B1 22%      +1.0        2.58 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_ulpevent_make_rcvmsg
>       1.63 =C2=B1 26%      +1.1        2.73        perf-profile.children.=
cycles-pp.sctp_packet_pack
>       2.23 =C2=B1 22%      +1.3        3.49 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_make_datafrag_empty
>       2.27 =C2=B1 21%      +1.3        3.56 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_ulpq_tail_data
>       3.15 =C2=B1 18%      +1.4        4.57 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_packet_append_chunk
>       3.18 =C2=B1 18%      +1.4        4.63 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sctp_packet_transmit_chunk
>       2.80 =C2=B1 22%      +1.5        4.34 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp._sctp_make_chunk
>       1.46 =C2=B1 43%      +1.7        3.14        perf-profile.children.=
cycles-pp.exit_to_user_mode_loop
>       3.31 =C2=B1 22%      +1.9        5.16        perf-profile.children.=
cycles-pp.__alloc_skb
>       2.17 =C2=B1 35%      +1.9        4.12        perf-profile.children.=
cycles-pp.exit_to_user_mode_prepare
>       3.67 =C2=B1 21%      +2.0        5.63        perf-profile.children.=
cycles-pp.sctp_datamsg_from_user
>       2.33 =C2=B1 34%      +2.0        4.36        perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode
>       6.00 =C2=B1 16%      +2.4        8.44 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sctp_outq_flush_data
>      54.08            +2.5       56.60        perf-profile.children.cycle=
s-pp.sctp_outq_flush
>      54.98            +2.9       57.85        perf-profile.children.cycle=
s-pp.sctp_cmd_interpreter
>      55.50            +3.2       58.72        perf-profile.children.cycle=
s-pp.sctp_do_sm
>      55.64            +3.3       58.95        perf-profile.children.cycle=
s-pp.sctp_primitive_SEND
>      34.39 =C2=B1  4%      +5.0       39.39        perf-profile.children.=
cycles-pp.accept_connections
>      34.39 =C2=B1  4%      +5.0       39.39        perf-profile.children.=
cycles-pp.accept_connection
>      34.39 =C2=B1  4%      +5.0       39.39        perf-profile.children.=
cycles-pp.spawn_child
>      34.39 =C2=B1  4%      +5.0       39.39        perf-profile.children.=
cycles-pp.process_requests
>      60.39 =C2=B1  2%      +5.5       65.93        perf-profile.children.=
cycles-pp.sctp_sendmsg_to_asoc
>      62.06 =C2=B1  3%      +6.4       68.43        perf-profile.children.=
cycles-pp.sctp_sendmsg
>      62.33 =C2=B1  3%      +6.5       68.80        perf-profile.children.=
cycles-pp.sock_sendmsg
>      63.91 =C2=B1  3%      +7.2       71.11        perf-profile.children.=
cycles-pp.____sys_sendmsg
>      64.77 =C2=B1  3%      +7.8       72.58        perf-profile.children.=
cycles-pp.___sys_sendmsg
>      65.16 =C2=B1  3%      +7.9       73.04        perf-profile.children.=
cycles-pp.__sys_sendmsg
>      86.67 =C2=B1  3%      +8.3       94.95        perf-profile.children.=
cycles-pp.do_syscall_64
>      86.98 =C2=B1  3%      +8.5       95.47        perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
>      68.26 =C2=B1  5%     +10.9       79.16        perf-profile.children.=
cycles-pp.sendmsg
>       8.31 =C2=B1 53%      -8.3        0.00        perf-profile.self.cycl=
es-pp.native_queued_spin_lock_slowpath
>       8.33 =C2=B1 29%      -8.0        0.29 =C2=B1  8%  perf-profile.self=
.cycles-pp.update_cfs_group
>       5.58 =C2=B1 37%      -5.6        0.00        perf-profile.self.cycl=
es-pp.mwait_idle_with_hints
>       4.53 =C2=B1 43%      -3.7        0.82 =C2=B1  5%  perf-profile.self=
.cycles-pp.update_load_avg
>       1.39            -0.2        1.15        perf-profile.self.cycles-pp=
._raw_spin_lock_irqsave
>       0.76 =C2=B1  7%      -0.2        0.55 =C2=B1  2%  perf-profile.self=
.cycles-pp.__schedule
>       0.37 =C2=B1 22%      -0.2        0.17 =C2=B1 26%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       1.04 =C2=B1  3%      -0.2        0.84 =C2=B1  4%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.66            -0.1        0.52        perf-profile.self.cycles-pp=
.available_idle_cpu
>       0.24 =C2=B1  5%      -0.0        0.19 =C2=B1  5%  perf-profile.self=
.cycles-pp.sctp_chunk_hold
>       0.11 =C2=B1  4%      -0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.__wake_up_common
>       0.10 =C2=B1  4%      -0.0        0.06 =C2=B1 16%  perf-profile.self=
.cycles-pp.perf_trace_sched_wakeup_template
>       0.12 =C2=B1  7%      -0.0        0.10        perf-profile.self.cycl=
es-pp.consume_skb
>       0.07            -0.0        0.06 =C2=B1  8%  perf-profile.self.cycl=
es-pp.sctp_transport_burst_limited
>       0.11 =C2=B1  4%      -0.0        0.10        perf-profile.self.cycl=
es-pp.resched_curr
>       0.09 =C2=B1  9%      +0.0        0.11        perf-profile.self.cycl=
es-pp.prepare_to_wait_exclusive
>       0.05            +0.0        0.07        perf-profile.self.cycles-pp=
.sctp_sched_fcfs_dequeue_done
>       0.07 =C2=B1 11%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.sockfd_lookup_light
>       0.13 =C2=B1  6%      +0.0        0.16 =C2=B1 10%  perf-profile.self=
.cycles-pp.skb_release_head_state
>       0.07 =C2=B1 17%      +0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.perf_tp_event
>       0.03 =C2=B1 70%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.autoremove_wake_function
>       0.08 =C2=B1 16%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.__x64_sys_recvmsg
>       0.06 =C2=B1 13%      +0.0        0.09        perf-profile.self.cycl=
es-pp.validate_xmit_vlan
>       0.32            +0.0        0.35        perf-profile.self.cycles-pp=
.sctp_transport_put
>       0.18 =C2=B1 11%      +0.0        0.21        perf-profile.self.cycl=
es-pp.switch_fpu_return
>       0.09 =C2=B1 14%      +0.0        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.syscall_exit_to_user_mode_prepare
>       0.06 =C2=B1 14%      +0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_v4_is_ce
>       0.04 =C2=B1 71%      +0.0        0.07        perf-profile.self.cycl=
es-pp.sctp_make_control
>       0.15 =C2=B1  8%      +0.0        0.18        perf-profile.self.cycl=
es-pp.select_task_rq_fair
>       0.06 =C2=B1 14%      +0.0        0.10 =C2=B1 14%  perf-profile.self=
.cycles-pp.netif_rx_internal
>       0.08 =C2=B1 14%      +0.0        0.12 =C2=B1 13%  perf-profile.self=
.cycles-pp.rb_erase
>       0.07 =C2=B1 18%      +0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.ip_local_deliver_finish
>       0.07 =C2=B1 30%      +0.0        0.11 =C2=B1 11%  perf-profile.self=
.cycles-pp.security_socket_sendmsg
>       0.04 =C2=B1 71%      +0.0        0.08        perf-profile.self.cycl=
es-pp.__rdgsbase_inactive
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1 12%  perf-profile.self=
.cycles-pp.sctp_transport_burst_reset
>       0.15 =C2=B1 14%      +0.0        0.19 =C2=B1  2%  perf-profile.self=
.cycles-pp.update_min_vruntime
>       0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.sendmsg_copy_msghdr
>       0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.raw_local_deliver
>       0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.__x64_sys_sendmsg
>       0.04 =C2=B1 71%      +0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_init_addrs
>       0.10 =C2=B1  8%      +0.0        0.14 =C2=B1  6%  perf-profile.self=
.cycles-pp.skb_network_protocol
>       0.08 =C2=B1 20%      +0.0        0.12        perf-profile.self.cycl=
es-pp.sock_kfree_s
>       0.09 =C2=B1 22%      +0.0        0.13 =C2=B1  7%  perf-profile.self=
.cycles-pp.sctp_transport_raise_cwnd
>       0.07 =C2=B1 20%      +0.0        0.11        perf-profile.self.cycl=
es-pp.ip_send_check
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.sock_recvmsg
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.syscall_enter_from_user_mode
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.sctp_v4_cmp_addr
>       0.04 =C2=B1 73%      +0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.eth_type_trans
>       0.16 =C2=B1  7%      +0.0        0.20 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_ulpevent_make_rcvmsg
>       0.09 =C2=B1 14%      +0.0        0.13 =C2=B1 18%  perf-profile.self=
.cycles-pp.sctp_user_addto_chunk
>       0.10 =C2=B1 12%      +0.0        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.lock_sock_nested
>       0.04 =C2=B1 71%      +0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.skb_clone
>       0.06 =C2=B1  8%      +0.0        0.10 =C2=B1 24%  perf-profile.self=
.cycles-pp.sctp_sched_dequeue_done
>       0.07 =C2=B1 28%      +0.0        0.12 =C2=B1  4%  perf-profile.self=
.cycles-pp.__skb_datagram_iter
>       0.07 =C2=B1 28%      +0.0        0.12 =C2=B1  4%  perf-profile.self=
.cycles-pp.__put_user_nocheck_8
>       0.11 =C2=B1 19%      +0.0        0.15        perf-profile.self.cycl=
es-pp.sctp_transport_update_rto
>       0.08 =C2=B1 26%      +0.0        0.12        perf-profile.self.cycl=
es-pp._copy_from_iter
>       0.05 =C2=B1 71%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.__napi_poll
>       0.04 =C2=B1 73%      +0.0        0.08 =C2=B1  5%  perf-profile.self=
.cycles-pp.calc_wheel_index
>       0.09 =C2=B1 23%      +0.0        0.13        perf-profile.self.cycl=
es-pp.__wrgsbase_inactive
>       0.04 =C2=B1 71%      +0.0        0.08        perf-profile.self.cycl=
es-pp.sctp4_rcv
>       0.02 =C2=B1141%      +0.0        0.06        perf-profile.self.cycl=
es-pp.sctp_ulpevent_get_notification_type
>       0.02 =C2=B1141%      +0.0        0.06        perf-profile.self.cycl=
es-pp.apparmor_socket_recvmsg
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 13%  perf-profile.self=
.cycles-pp.ip_local_out
>       0.14 =C2=B1 13%      +0.0        0.18 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_chunk_abandoned
>       0.04 =C2=B1 73%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.sctp_sf_do_no_pending_tsn
>       0.12 =C2=B1 10%      +0.0        0.16 =C2=B1  7%  perf-profile.self=
.cycles-pp.pick_next_entity
>       0.09 =C2=B1 18%      +0.0        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.rcu_all_qs
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.place_entity
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.schedule_debug
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.switch_ldt
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 14%  perf-profile.self=
.cycles-pp.__wake_up_common_lock
>       0.57 =C2=B1  2%      +0.0        0.62        perf-profile.self.cycl=
es-pp._raw_spin_lock_bh
>       0.26 =C2=B1 12%      +0.0        0.31        perf-profile.self.cycl=
es-pp.sctp_sf_eat_sack_6_2
>       0.05 =C2=B1 71%      +0.0        0.10 =C2=B1  8%  perf-profile.self=
.cycles-pp.nf_hook_slow
>       0.13 =C2=B1 16%      +0.0        0.18 =C2=B1 13%  perf-profile.self=
.cycles-pp.irqtime_account_irq
>       0.10 =C2=B1 12%      +0.0        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.dev_hard_start_xmit
>       0.05 =C2=B1 72%      +0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.security_socket_recvmsg
>       0.09 =C2=B1 18%      +0.1        0.14 =C2=B1 18%  perf-profile.self=
.cycles-pp.detach_if_pending
>       0.04 =C2=B1 76%      +0.1        0.09 =C2=B1 10%  perf-profile.self=
.cycles-pp.__ip_local_out
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_safe_stack
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1 11%  perf-profile.self=
.cycles-pp.apparmor_socket_sock_rcv_skb
>       0.05 =C2=B1 72%      +0.1        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_datamsg_destroy
>       0.13 =C2=B1 12%      +0.1        0.18 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_transport_reset_t3_rtx
>       0.10 =C2=B1 16%      +0.1        0.15 =C2=B1  8%  perf-profile.self=
.cycles-pp.__sys_recvmsg
>       0.37 =C2=B1  2%      +0.1        0.42        perf-profile.self.cycl=
es-pp.sctp_association_hold
>       0.15 =C2=B1  6%      +0.1        0.20 =C2=B1  8%  perf-profile.self=
.cycles-pp.dequeue_entity
>       0.09 =C2=B1 18%      +0.1        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_sched_dequeue_common
>       0.08 =C2=B1 32%      +0.1        0.13 =C2=B1 12%  perf-profile.self=
.cycles-pp.put_prev_entity
>       0.08 =C2=B1 32%      +0.1        0.13 =C2=B1 10%  perf-profile.self=
.cycles-pp.sctp_auth_send_cid
>       0.12 =C2=B1 18%      +0.1        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.___sys_recvmsg
>       0.07 =C2=B1 23%      +0.1        0.13 =C2=B1  7%  perf-profile.self=
.cycles-pp.rcu_note_context_switch
>       0.04 =C2=B1 76%      +0.1        0.10 =C2=B1 12%  perf-profile.self=
.cycles-pp.sctp_ulpq_retrieve_ordered
>       0.02 =C2=B1141%      +0.1        0.07        perf-profile.self.cycl=
es-pp.apparmor_socket_sendmsg
>       0.05 =C2=B1 72%      +0.1        0.10        perf-profile.self.cycl=
es-pp.import_iovec
>       0.05 =C2=B1 72%      +0.1        0.10        perf-profile.self.cycl=
es-pp.skb_pull
>       0.08 =C2=B1 24%      +0.1        0.14 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_tsnmap_num_gabs
>       0.10 =C2=B1 14%      +0.1        0.15 =C2=B1 11%  perf-profile.self=
.cycles-pp.cpuacct_charge
>       0.22 =C2=B1 11%      +0.1        0.27 =C2=B1  3%  perf-profile.self=
.cycles-pp.select_idle_sibling
>       0.10 =C2=B1 16%      +0.1        0.16 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_outq_flush_ctrl
>       0.09 =C2=B1 27%      +0.1        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.iovec_from_user
>       0.10 =C2=B1 24%      +0.1        0.16 =C2=B1  7%  perf-profile.self=
.cycles-pp.ip_finish_output
>       0.04 =C2=B1 71%      +0.1        0.10 =C2=B1 14%  perf-profile.self=
.cycles-pp.sctp_inet_msgname
>       0.04 =C2=B1 76%      +0.1        0.10 =C2=B1  8%  perf-profile.self=
.cycles-pp.sctp_v4_from_skb
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 16%  perf-profile.self=
.cycles-pp.skb_free_head
>       0.05 =C2=B1 72%      +0.1        0.10 =C2=B1 25%  perf-profile.self=
.cycles-pp.__ip_finish_output
>       0.07 =C2=B1 23%      +0.1        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_ulpq_order
>       0.04 =C2=B1 71%      +0.1        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.sctp_control_release_owner
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_association_get_next_tsn
>       0.05 =C2=B1 74%      +0.1        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.skb_dequeue
>       0.04 =C2=B1 73%      +0.1        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.perf_trace_sched_switch
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.kfree_skbmem
>       0.23 =C2=B1 16%      +0.1        0.28        perf-profile.self.cycl=
es-pp.sctp_addto_chunk
>       0.30 =C2=B1 13%      +0.1        0.36 =C2=B1  2%  perf-profile.self=
.cycles-pp.__update_load_avg_cfs_rq
>       0.05 =C2=B1 77%      +0.1        0.11 =C2=B1 14%  perf-profile.self=
.cycles-pp.ipv4_mtu
>       0.24 =C2=B1  9%      +0.1        0.30 =C2=B1  2%  perf-profile.self=
.cycles-pp.skb_set_owner_w
>       0.15 =C2=B1 11%      +0.1        0.21 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_id2assoc
>       0.10 =C2=B1 19%      +0.1        0.16 =C2=B1  5%  perf-profile.self=
.cycles-pp.sctp_bind_addr_match
>       0.04 =C2=B1 71%      +0.1        0.10 =C2=B1 12%  perf-profile.self=
.cycles-pp.syscall_exit_to_user_mode
>       0.00            +0.1        0.06        perf-profile.self.cycles-pp=
.__cgroup_account_cputime
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 20%  perf-profile.self=
.cycles-pp.ip_local_deliver
>       0.05 =C2=B1 74%      +0.1        0.11        perf-profile.self.cycl=
es-pp.inet_sendmsg
>       0.05 =C2=B1 72%      +0.1        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_chunk_free
>       0.04 =C2=B1 73%      +0.1        0.10        perf-profile.self.cycl=
es-pp.save_fpregs_to_fpstate
>       0.09 =C2=B1 26%      +0.1        0.16 =C2=B1  6%  perf-profile.self=
.cycles-pp.check_stack_object
>       0.23 =C2=B1 19%      +0.1        0.29 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_validate_data
>       0.05 =C2=B1 71%      +0.1        0.12 =C2=B1  8%  perf-profile.self=
.cycles-pp.sctp_queue_purge_ulpevents
>       0.11 =C2=B1 17%      +0.1        0.17 =C2=B1  9%  perf-profile.self=
.cycles-pp.netif_skb_features
>       0.04 =C2=B1 76%      +0.1        0.11        perf-profile.self.cycl=
es-pp.exit_to_user_mode_loop
>       0.12 =C2=B1 24%      +0.1        0.19 =C2=B1  2%  perf-profile.self=
.cycles-pp.sctp_sf_do_prm_send
>       0.10 =C2=B1 34%      +0.1        0.17 =C2=B1  7%  perf-profile.self=
.cycles-pp.sctp_get_af_specific
>       0.09 =C2=B1 24%      +0.1        0.16 =C2=B1  5%  perf-profile.self=
.cycles-pp.should_failslab
>       0.30 =C2=B1 12%      +0.1        0.37 =C2=B1  2%  perf-profile.self=
.cycles-pp.send_sctp_rr
>       0.13 =C2=B1 18%      +0.1        0.20 =C2=B1  2%  perf-profile.self=
.cycles-pp.validate_xmit_skb
>       0.05 =C2=B1 74%      +0.1        0.12        perf-profile.self.cycl=
es-pp.clear_buddies
>       0.03 =C2=B1141%      +0.1        0.10 =C2=B1 19%  perf-profile.self=
.cycles-pp.sctp_inet_cmp_addr
>       0.10 =C2=B1 37%      +0.1        0.17 =C2=B1  8%  perf-profile.self=
.cycles-pp.ip_output
>       0.17 =C2=B1 17%      +0.1        0.24 =C2=B1 14%  perf-profile.self=
.cycles-pp.kmem_cache_alloc_trace
>       0.06 =C2=B1 75%      +0.1        0.13 =C2=B1  7%  perf-profile.self=
.cycles-pp.security_sock_rcv_skb
>       0.11 =C2=B1 26%      +0.1        0.18 =C2=B1  4%  perf-profile.self=
.cycles-pp.__copy_msghdr_from_user
>       0.23 =C2=B1 12%      +0.1        0.31        perf-profile.self.cycl=
es-pp.sctp_datamsg_put
>       0.39 =C2=B1 11%      +0.1        0.46        perf-profile.self.cycl=
es-pp.__switch_to
>       0.33 =C2=B1  8%      +0.1        0.41 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_outq_tail
>       0.10 =C2=B1 21%      +0.1        0.17 =C2=B1  7%  perf-profile.self=
.cycles-pp.sctp_chunk_assign_ssn
>       0.10 =C2=B1 38%      +0.1        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.___sys_sendmsg
>       0.11 =C2=B1 22%      +0.1        0.19 =C2=B1  5%  perf-profile.self=
.cycles-pp.inet_recvmsg
>       0.11 =C2=B1 29%      +0.1        0.19 =C2=B1  2%  perf-profile.self=
.cycles-pp.del_timer
>       0.23 =C2=B1 14%      +0.1        0.31        perf-profile.self.cycl=
es-pp._sctp_make_chunk
>       0.19 =C2=B1 15%      +0.1        0.27        perf-profile.self.cycl=
es-pp.enqueue_to_backlog
>       0.13 =C2=B1 25%      +0.1        0.21 =C2=B1  6%  perf-profile.self=
.cycles-pp.__genradix_ptr
>       0.10 =C2=B1 27%      +0.1        0.18 =C2=B1  2%  perf-profile.self=
.cycles-pp._copy_to_iter
>       0.12 =C2=B1 51%      +0.1        0.20 =C2=B1 21%  perf-profile.self=
.cycles-pp.sctp_addrs_lookup_transport
>       0.13 =C2=B1 31%      +0.1        0.21 =C2=B1 14%  perf-profile.self=
.cycles-pp.__netif_receive_skb_one_core
>       0.41 =C2=B1 12%      +0.1        0.50 =C2=B1  7%  perf-profile.self=
.cycles-pp.sctp_datamsg_from_user
>       0.14 =C2=B1 25%      +0.1        0.23 =C2=B1  5%  perf-profile.self=
.cycles-pp.kmalloc_reserve
>       0.14 =C2=B1 28%      +0.1        0.23 =C2=B1  8%  perf-profile.self=
.cycles-pp.sock_sendmsg
>       0.12 =C2=B1 26%      +0.1        0.21 =C2=B1  2%  perf-profile.self=
.cycles-pp.sctp_ulpevent_receive_data
>       0.15 =C2=B1 16%      +0.1        0.24 =C2=B1  3%  perf-profile.self=
.cycles-pp._raw_spin_unlock_irqrestore
>       0.14 =C2=B1 23%      +0.1        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.sctp_primitive_SEND
>       0.13 =C2=B1 24%      +0.1        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.__sys_sendmsg
>       0.06 =C2=B1 75%      +0.1        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_ulpevent_is_notification
>       0.30 =C2=B1 15%      +0.1        0.38 =C2=B1  2%  perf-profile.self=
.cycles-pp.____sys_sendmsg
>       0.17 =C2=B1 19%      +0.1        0.26        perf-profile.self.cycl=
es-pp._raw_spin_lock_irq
>       0.12 =C2=B1 35%      +0.1        0.20 =C2=B1 12%  perf-profile.self=
.cycles-pp.schedule
>       0.18 =C2=B1 20%      +0.1        0.27        perf-profile.self.cycl=
es-pp.____sys_recvmsg
>       0.14 =C2=B1 23%      +0.1        0.23        perf-profile.self.cycl=
es-pp.__entry_text_start
>       0.13 =C2=B1 27%      +0.1        0.22 =C2=B1  3%  perf-profile.self=
.cycles-pp.ip_rcv
>       0.57 =C2=B1  6%      +0.1        0.66 =C2=B1  2%  perf-profile.self=
.cycles-pp.sctp_association_put
>       0.14 =C2=B1 23%      +0.1        0.23        perf-profile.self.cycl=
es-pp.syscall_return_via_sysret
>       0.09 =C2=B1 28%      +0.1        0.18 =C2=B1 13%  perf-profile.self=
.cycles-pp.check_preempt_wakeup
>       0.12 =C2=B1 20%      +0.1        0.21 =C2=B1 10%  perf-profile.self=
.cycles-pp.sctp_sendmsg_check_sflags
>       0.12 =C2=B1 42%      +0.1        0.21 =C2=B1 17%  perf-profile.self=
.cycles-pp.sctp_generate_fwdtsn
>       0.20 =C2=B1 17%      +0.1        0.29 =C2=B1  8%  perf-profile.self=
.cycles-pp.sock_wfree
>       0.18 =C2=B1 20%      +0.1        0.27 =C2=B1  9%  perf-profile.self=
.cycles-pp.process_backlog
>       0.22 =C2=B1 23%      +0.1        0.31        perf-profile.self.cycl=
es-pp.___perf_sw_event
>       0.16 =C2=B1 22%      +0.1        0.26 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_ulpq_tail_data
>       0.13 =C2=B1 27%      +0.1        0.23 =C2=B1  2%  perf-profile.self=
.cycles-pp.__might_fault
>       0.11 =C2=B1 41%      +0.1        0.21 =C2=B1 10%  perf-profile.self=
.cycles-pp.do_ulpq_tail_event
>       0.21 =C2=B1 17%      +0.1        0.31 =C2=B1  5%  perf-profile.self=
.cycles-pp.ip_protocol_deliver_rcu
>       0.15 =C2=B1 24%      +0.1        0.25 =C2=B1  3%  perf-profile.self=
.cycles-pp.__skb_clone
>       0.16 =C2=B1 27%      +0.1        0.26 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_sm_lookup_event
>       0.39 =C2=B1 10%      +0.1        0.49 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_make_sack
>       0.14 =C2=B1 23%      +0.1        0.25 =C2=B1  5%  perf-profile.self=
.cycles-pp.ip_skb_dst_mtu
>       0.09 =C2=B1 41%      +0.1        0.19 =C2=B1 12%  perf-profile.self=
.cycles-pp.sk_filter_trim_cap
>       0.19 =C2=B1 15%      +0.1        0.30 =C2=B1 15%  perf-profile.self=
.cycles-pp.sctp_sched_fcfs_dequeue
>       0.16 =C2=B1 23%      +0.1        0.26 =C2=B1  3%  perf-profile.self=
.cycles-pp.__kmalloc
>       0.16 =C2=B1 25%      +0.1        0.26        perf-profile.self.cycl=
es-pp.ip_rcv_core
>       0.19 =C2=B1 21%      +0.1        0.30 =C2=B1  2%  perf-profile.self=
.cycles-pp.sctp_sock_rfree
>       0.11 =C2=B1 37%      +0.1        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.set_next_buddy
>       0.29 =C2=B1 18%      +0.1        0.40        perf-profile.self.cycl=
es-pp.sctp_ulpevent_make_sender_dry_event
>       0.22 =C2=B1 23%      +0.1        0.33 =C2=B1  2%  perf-profile.self=
.cycles-pp.skb_put
>       0.40 =C2=B1 13%      +0.1        0.51 =C2=B1  2%  perf-profile.self=
.cycles-pp.skb_release_data
>       0.35 =C2=B1 13%      +0.1        0.46 =C2=B1  9%  perf-profile.self=
.cycles-pp.sctp_skb_recv_datagram
>       0.19 =C2=B1 22%      +0.1        0.30 =C2=B1  3%  perf-profile.self=
.cycles-pp.read_tsc
>       0.16 =C2=B1 31%      +0.1        0.27 =C2=B1  4%  perf-profile.self=
.cycles-pp.__import_iovec
>       0.19 =C2=B1 23%      +0.1        0.30        perf-profile.self.cycl=
es-pp.sendmsg
>       0.50 =C2=B1 14%      +0.1        0.61        perf-profile.self.cycl=
es-pp.__switch_to_asm
>       0.12 =C2=B1 36%      +0.1        0.24 =C2=B1 13%  perf-profile.self=
.cycles-pp.kmalloc_slab
>       0.16 =C2=B1 23%      +0.1        0.27 =C2=B1  3%  perf-profile.self=
.cycles-pp._copy_from_user
>       0.16 =C2=B1 26%      +0.1        0.27        perf-profile.self.cycl=
es-pp.enqueue_timer
>       0.16 =C2=B1 25%      +0.1        0.27 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_make_datafrag_empty
>       0.14 =C2=B1 38%      +0.1        0.25 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_sf_eat_data_6_2
>       0.25 =C2=B1 14%      +0.1        0.37        perf-profile.self.cycl=
es-pp.prepare_task_switch
>       0.25 =C2=B1 19%      +0.1        0.37 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_cmp_addr_exact
>       0.14 =C2=B1 30%      +0.1        0.25 =C2=B1  3%  perf-profile.self=
.cycles-pp.exit_to_user_mode_prepare
>       0.40 =C2=B1 19%      +0.1        0.52 =C2=B1  3%  perf-profile.self=
.cycles-pp.restore_fpregs_from_fpstate
>       0.20 =C2=B1 22%      +0.1        0.32 =C2=B1  5%  perf-profile.self=
.cycles-pp.sctp_packet_append_chunk
>       0.13 =C2=B1 22%      +0.1        0.25 =C2=B1  7%  perf-profile.self=
.cycles-pp.__calc_delta
>       0.42 =C2=B1 15%      +0.1        0.54        perf-profile.self.cycl=
es-pp.__fdget
>       0.43 =C2=B1 16%      +0.1        0.55 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_assoc_bh_rcv
>       0.18 =C2=B1 28%      +0.1        0.31        perf-profile.self.cycl=
es-pp.entry_SYSRETQ_unsafe_stack
>       0.19 =C2=B1 22%      +0.1        0.31 =C2=B1  2%  perf-profile.self=
.cycles-pp.do_syscall_64
>       0.38 =C2=B1 15%      +0.1        0.50        perf-profile.self.cycl=
es-pp.aa_sk_perm
>       0.17 =C2=B1 26%      +0.1        0.30        perf-profile.self.cycl=
es-pp.__cond_resched
>       0.33 =C2=B1 10%      +0.1        0.45        perf-profile.self.cycl=
es-pp.sctp_transport_hold
>       0.30 =C2=B1 18%      +0.1        0.43 =C2=B1  8%  perf-profile.self=
.cycles-pp.__dev_queue_xmit
>       0.16 =C2=B1 36%      +0.1        0.29 =C2=B1  7%  perf-profile.self=
.cycles-pp.sctp_ulpevent_init
>       0.23 =C2=B1 22%      +0.1        0.36 =C2=B1  3%  perf-profile.self=
.cycles-pp.do_softirq
>       0.35 =C2=B1 14%      +0.1        0.49 =C2=B1 10%  perf-profile.self=
.cycles-pp.__check_object_size
>       0.30 =C2=B1 16%      +0.1        0.43        perf-profile.self.cycl=
es-pp.__update_load_avg_se
>       0.15 =C2=B1 33%      +0.1        0.28 =C2=B1  8%  perf-profile.self=
.cycles-pp.sctp_v4_addr_valid
>       0.31 =C2=B1 15%      +0.1        0.45        perf-profile.self.cycl=
es-pp.net_rx_action
>       0.44 =C2=B1 17%      +0.1        0.58 =C2=B1  2%  perf-profile.self=
.cycles-pp.__ksize
>       0.17 =C2=B1 31%      +0.1        0.31 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_chunkify
>       0.25 =C2=B1 20%      +0.1        0.40 =C2=B1 13%  perf-profile.self=
.cycles-pp.sctp_outq_flush_data
>       0.23 =C2=B1 23%      +0.1        0.37        perf-profile.self.cycl=
es-pp.loopback_xmit
>       0.27 =C2=B1 13%      +0.1        0.42 =C2=B1 16%  perf-profile.self=
.cycles-pp.__mod_timer
>       0.28 =C2=B1 18%      +0.1        0.43        perf-profile.self.cycl=
es-pp.__ip_queue_xmit
>       0.16 =C2=B1 25%      +0.1        0.31 =C2=B1  2%  perf-profile.self=
.cycles-pp.get_nohz_timer_target
>       0.33 =C2=B1 15%      +0.2        0.48 =C2=B1  5%  perf-profile.self=
.cycles-pp.sctp_packet_transmit
>       0.17 =C2=B1 40%      +0.2        0.32 =C2=B1  5%  perf-profile.self=
.cycles-pp.ipv4_dst_check
>       0.27 =C2=B1 24%      +0.2        0.42 =C2=B1  5%  perf-profile.self=
.cycles-pp.__sctp_packet_append_chunk
>       0.26 =C2=B1 25%      +0.2        0.41 =C2=B1  2%  perf-profile.self=
.cycles-pp.pick_next_task_fair
>       0.23 =C2=B1 27%      +0.2        0.38 =C2=B1  2%  perf-profile.self=
.cycles-pp.sctp_inq_pop
>       0.25 =C2=B1 29%      +0.2        0.41 =C2=B1  3%  perf-profile.self=
.cycles-pp.os_xsave
>       0.24 =C2=B1 33%      +0.2        0.40 =C2=B1  6%  perf-profile.self=
.cycles-pp.__local_bh_enable_ip
>       0.31 =C2=B1 18%      +0.2        0.46        perf-profile.self.cycl=
es-pp.sctp_outq_flush
>       0.30 =C2=B1 25%      +0.2        0.46        perf-profile.self.cycl=
es-pp.native_sched_clock
>       0.29 =C2=B1 23%      +0.2        0.46        perf-profile.self.cycl=
es-pp.lock_timer_base
>       0.27 =C2=B1 24%      +0.2        0.44 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_ulpevent_free
>       0.57 =C2=B1 15%      +0.2        0.75        perf-profile.self.cycl=
es-pp.sctp_chunk_put
>       0.25 =C2=B1 29%      +0.2        0.43        perf-profile.self.cycl=
es-pp.copy_user_enhanced_fast_string
>       0.27 =C2=B1 24%      +0.2        0.45 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_sendmsg_parse
>       0.68 =C2=B1 13%      +0.2        0.87 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_recvmsg
>       0.45 =C2=B1 28%      +0.2        0.64 =C2=B1  3%  perf-profile.self=
.cycles-pp.update_curr
>       0.59 =C2=B1 13%      +0.2        0.78 =C2=B1  5%  perf-profile.self=
.cycles-pp.sctp_sendmsg_to_asoc
>       0.28 =C2=B1 28%      +0.2        0.48        perf-profile.self.cycl=
es-pp.memcpy_erms
>       0.33 =C2=B1 23%      +0.2        0.53        perf-profile.self.cycl=
es-pp.__softirqentry_text_start
>       0.32 =C2=B1 25%      +0.2        0.52 =C2=B1  8%  perf-profile.self=
.cycles-pp.sctp_ulpq_tail_event
>       0.30 =C2=B1 26%      +0.2        0.51 =C2=B1  2%  perf-profile.self=
.cycles-pp.__check_heap_object
>       0.21 =C2=B1 31%      +0.2        0.42 =C2=B1  2%  perf-profile.self=
.cycles-pp.ktime_get
>       0.70 =C2=B1 16%      +0.2        0.91 =C2=B1  2%  perf-profile.self=
.cycles-pp.sctp_outq_sack
>       0.29 =C2=B1 25%      +0.2        0.50 =C2=B1  5%  perf-profile.self=
.cycles-pp.memcg_slab_post_alloc_hook
>       0.31 =C2=B1 25%      +0.2        0.52        perf-profile.self.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>       0.28 =C2=B1 23%      +0.2        0.49 =C2=B1  4%  perf-profile.self=
.cycles-pp.ip_rcv_finish_core
>       0.29 =C2=B1 21%      +0.2        0.51 =C2=B1  2%  perf-profile.self=
.cycles-pp.__virt_addr_valid
>       0.41 =C2=B1 17%      +0.2        0.64 =C2=B1  5%  perf-profile.self=
.cycles-pp.sctp_eat_data
>       0.37 =C2=B1 34%      +0.2        0.61        perf-profile.self.cycl=
es-pp.__rhashtable_lookup
>       0.61 =C2=B1 20%      +0.2        0.86        perf-profile.self.cycl=
es-pp.copy_user_short_string
>       0.38 =C2=B1 19%      +0.2        0.63 =C2=B1  5%  perf-profile.self=
.cycles-pp.ip_finish_output2
>       0.37 =C2=B1 26%      +0.3        0.62        perf-profile.self.cycl=
es-pp.__netif_receive_skb_core
>       0.56 =C2=B1 17%      +0.3        0.82        perf-profile.self.cycl=
es-pp.sctp_packet_config
>       0.43 =C2=B1 26%      +0.3        0.72 =C2=B1  3%  perf-profile.self=
.cycles-pp.__might_sleep
>       0.55 =C2=B1 27%      +0.3        0.86 =C2=B1  8%  perf-profile.self=
.cycles-pp.sctp_rcv
>       0.67 =C2=B1 20%      +0.3        0.99        perf-profile.self.cycl=
es-pp.sctp_check_transmitted
>       0.61 =C2=B1 20%      +0.3        0.93        perf-profile.self.cycl=
es-pp.kmem_cache_alloc
>       0.54 =C2=B1 25%      +0.3        0.87        perf-profile.self.cycl=
es-pp.sctp_sendmsg
>       0.33 =C2=B1 35%      +0.3        0.66 =C2=B1  4%  perf-profile.self=
.cycles-pp.sctp_packet_pack
>       0.58 =C2=B1 23%      +0.4        0.93 =C2=B1  3%  perf-profile.self=
.cycles-pp.kmem_cache_alloc_node
>       0.48 =C2=B1 28%      +0.4        0.85 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_v4_xmit
>       0.56 =C2=B1 28%      +0.4        0.96        perf-profile.self.cycl=
es-pp.memset_erms
>       0.67 =C2=B1 27%      +0.4        1.08 =C2=B1  3%  perf-profile.self=
.cycles-pp.__might_resched
>       0.64 =C2=B1 23%      +0.4        1.05 =C2=B1  6%  perf-profile.self=
.cycles-pp.__kmalloc_node_track_caller
>       0.56 =C2=B1 30%      +0.4        0.97        perf-profile.self.cycl=
es-pp.__alloc_skb
>       0.83 =C2=B1 19%      +0.4        1.27        perf-profile.self.cycl=
es-pp.switch_mm_irqs_off
>       0.73 =C2=B1 24%      +0.5        1.18        perf-profile.self.cycl=
es-pp.memcg_slab_free_hook
>       0.69 =C2=B1 23%      +0.5        1.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.dst_release
>       0.62 =C2=B1 29%      +0.5        1.12 =C2=B1  5%  perf-profile.self=
.cycles-pp.__copy_skb_header
>       0.64 =C2=B1 28%      +0.5        1.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.sctp_do_sm
>       1.10 =C2=B1 23%      +0.6        1.67        perf-profile.self.cycl=
es-pp.kmem_cache_free
>       1.02 =C2=B1 25%      +0.6        1.62        perf-profile.self.cycl=
es-pp.kfree
>       0.99 =C2=B1 27%      +0.6        1.60 =C2=B1  6%  perf-profile.self=
.cycles-pp.sctp_cmd_interpreter
> =

> =

> =

> *************************************************************************=
**************************
> lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00=
GHz (Ice Lake) with 256G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/mode/nr_task/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-11/performance/x86_64-rhel-8.3/process/100%/debian-11.1-x86_64-2022=
0510.cgz/lkp-icl-2sp2/lock2/will-it-scale/0xd000363
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     352216           +10.6%     389588        will-it-scale.128.processes
>       2751           +10.6%       3043        will-it-scale.per_process_o=
ps
>     352216           +10.6%     389588        will-it-scale.workload
>     468561            +9.1%     511047        vmstat.system.cs
>     489488            +4.1%     509544        vmstat.system.in
>      28187 =C2=B1  2%     +12.3%      31650 =C2=B1  5%  meminfo.Active
>      28059 =C2=B1  3%     +12.3%      31522 =C2=B1  5%  meminfo.Active(an=
on)
>     156145 =C2=B1  2%      +8.4%     169199 =C2=B1  2%  meminfo.Shmem
>     351702 =C2=B1  7%     +26.8%     445963 =C2=B1 14%  numa-numastat.nod=
e0.local_node
>     401292           +29.0%     517641 =C2=B1  8%  numa-numastat.node0.nu=
ma_hit
>     789435           -12.8%     688630 =C2=B1  6%  numa-numastat.node1.nu=
ma_hit
>       2781 =C2=B1 12%    +207.0%       8540 =C2=B1 28%  numa-meminfo.node=
0.Active
>       2696 =C2=B1 11%    +216.7%       8540 =C2=B1 28%  numa-meminfo.node=
0.Active(anon)
>       3765 =C2=B1  3%    +991.6%      41102 =C2=B1 50%  numa-meminfo.node=
0.Shmem
>     155822 =C2=B1 16%     -36.1%      99505 =C2=B1 42%  numa-meminfo.node=
1.AnonHugePages
>     673.67 =C2=B1 11%    +217.4%       2138 =C2=B1 28%  numa-vmstat.node0=
.nr_active_anon
>     941.33 =C2=B1  3%    +993.5%      10293 =C2=B1 49%  numa-vmstat.node0=
.nr_shmem
>     673.67 =C2=B1 11%    +217.4%       2138 =C2=B1 28%  numa-vmstat.node0=
.nr_zone_active_anon
>     401480           +29.0%     517923 =C2=B1  8%  numa-vmstat.node0.numa=
_hit
>     351890 =C2=B1  7%     +26.8%     446245 =C2=B1 14%  numa-vmstat.node0=
.numa_local
>     789848           -12.8%     688653 =C2=B1  6%  numa-vmstat.node1.numa=
_hit
>      -5573          -117.2%     956.46 =C2=B1210%  sched_debug.cfs_rq:/.s=
pread0.avg
>     -13712           -38.3%      -8464        sched_debug.cfs_rq:/.spread=
0.min
>       6.23 =C2=B1  2%     -11.5%       5.52 =C2=B1  4%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     189562 =C2=B1  3%     -14.6%     161898 =C2=B1  5%  sched_debug.cpu.a=
vg_idle.min
>     146.35 =C2=B1  3%     -12.3%     128.40 =C2=B1  8%  sched_debug.cpu.c=
lock_task.stddev
>     280.66 =C2=B1  4%     -12.1%     246.59        sched_debug.cpu.curr->=
pid.avg
>       1607 =C2=B1 63%     -58.1%     674.32 =C2=B1 34%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>       0.06 =C2=B1  5%     -13.2%       0.05 =C2=B1  3%  sched_debug.cpu.n=
r_running.avg
>       7019 =C2=B1  3%     +12.3%       7883 =C2=B1  5%  proc-vmstat.nr_ac=
tive_anon
>     110798            +2.0%     113027        proc-vmstat.nr_inactive_anon
>      38233 =C2=B1  2%      +5.9%      40494 =C2=B1  2%  proc-vmstat.nr_ma=
pped
>      39067 =C2=B1  2%      +8.4%      42343 =C2=B1  2%  proc-vmstat.nr_sh=
mem
>       7019 =C2=B1  3%     +12.3%       7883 =C2=B1  5%  proc-vmstat.nr_zo=
ne_active_anon
>     110798            +2.0%     113027        proc-vmstat.nr_zone_inactiv=
e_anon
>      91731 =C2=B1  5%     +20.9%     110869 =C2=B1 10%  proc-vmstat.numa_=
hint_faults
>    1192955            +1.5%    1211180        proc-vmstat.numa_hit
>    1077170            +1.5%    1092852        proc-vmstat.numa_local
>     346296            +2.9%     356393        proc-vmstat.pgactivate
>    1192965            +1.3%    1208677        proc-vmstat.pgalloc_normal
>    1021607            +2.1%    1043253        proc-vmstat.pgfault
>      13.74           -15.7%      11.59        perf-stat.i.MPKI
>  1.068e+09            +7.0%  1.142e+09        perf-stat.i.branch-instruct=
ions
>   10732730            +6.7%   11455487        perf-stat.i.branch-misses
>      22.88            +3.6       26.46        perf-stat.i.cache-miss-rate%
>   14849003            +4.6%   15525784        perf-stat.i.cache-misses
>   66155649            -9.2%   60076965        perf-stat.i.cache-references
>     472906            +9.1%     515760        perf-stat.i.context-switches
>       3.11            -6.8%       2.89        perf-stat.i.cpi
>       1005            -4.1%     964.19        perf-stat.i.cycles-between-=
cache-misses
>  1.377e+09            +7.6%  1.481e+09        perf-stat.i.dTLB-loads
>       0.01 =C2=B1  3%      -0.0        0.00 =C2=B1  3%  perf-stat.i.dTLB-=
store-miss-rate%
>      41979 =C2=B1  3%     -21.2%      33084 =C2=B1  2%  perf-stat.i.dTLB-=
store-misses
>  7.245e+08            +8.6%  7.865e+08        perf-stat.i.dTLB-stores
>  4.952e+09            +7.4%  5.317e+09        perf-stat.i.instructions
>       0.33            +7.0%       0.35        perf-stat.i.ipc
>     593.98            -7.7%     548.08        perf-stat.i.metric.K/sec
>      24.76            +7.6%      26.64        perf-stat.i.metric.M/sec
>       3027            +2.7%       3109        perf-stat.i.minor-faults
>    5791196            +1.6%    5881738        perf-stat.i.node-load-misses
>      58.31            +2.1       60.36        perf-stat.i.node-store-miss=
-rate%
>    2433411            +4.2%    2536069        perf-stat.i.node-store-miss=
es
>    1742276            -4.3%    1666577        perf-stat.i.node-stores
>       3028            +2.7%       3110        perf-stat.i.page-faults
>      13.36           -15.4%      11.30        perf-stat.overall.MPKI
>      22.44            +3.4       25.84        perf-stat.overall.cache-mis=
s-rate%
>       3.01            -6.6%       2.81        perf-stat.overall.cpi
>       1003            -4.1%     962.86        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.10            -0.0        0.10 =C2=B1  3%  perf-stat.overall.dTLB=
-load-miss-rate%
>       0.01 =C2=B1  3%      -0.0        0.00 =C2=B1  3%  perf-stat.overall=
.dTLB-store-miss-rate%
>       0.33            +7.1%       0.36        perf-stat.overall.ipc
>      58.27            +2.1       60.34        perf-stat.overall.node-stor=
e-miss-rate%
>    4248707            -2.9%    4125384        perf-stat.overall.path-leng=
th
>  1.064e+09            +7.0%  1.139e+09        perf-stat.ps.branch-instruc=
tions
>   10697460            +6.7%   11418447        perf-stat.ps.branch-misses
>   14804913            +4.6%   15479064        perf-stat.ps.cache-misses
>   65966766            -9.2%   59909841        perf-stat.ps.cache-referenc=
es
>     471340            +9.1%     514049        perf-stat.ps.context-switch=
es
>  1.373e+09            +7.6%  1.477e+09        perf-stat.ps.dTLB-loads
>      41880 =C2=B1  3%     -21.2%      32994 =C2=B1  2%  perf-stat.ps.dTLB=
-store-misses
>  7.222e+08            +8.6%  7.841e+08        perf-stat.ps.dTLB-stores
>  4.936e+09            +7.4%  5.301e+09        perf-stat.ps.instructions
>       3026            +2.5%       3102        perf-stat.ps.minor-faults
>    5773111            +1.6%    5863037        perf-stat.ps.node-load-miss=
es
>    2425414            +4.2%    2527697        perf-stat.ps.node-store-mis=
ses
>    1736711            -4.3%    1661165        perf-stat.ps.node-stores
>       3027            +2.5%       3103        perf-stat.ps.page-faults
>  1.496e+12            +7.4%  1.607e+12        perf-stat.total.instructions
>       8.82 =C2=B1  7%      -8.8        0.00        perf-profile.calltrace=
.cycles-pp.asm_sysvec_reschedule_ipi.acpi_idle_do_entry.acpi_idle_enter.cpu=
idle_enter_state.cpuidle_enter
>      37.13 =C2=B1  5%      -2.7       34.44        perf-profile.calltrace=
.cycles-pp.asm_sysvec_apic_timer_interrupt.acpi_idle_do_entry.acpi_idle_ent=
er.cpuidle_enter_state.cpuidle_enter
>       6.26 =C2=B1  4%      -0.6        5.63 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>       2.77 =C2=B1  5%      -0.6        2.18 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__libc_start_main
>       2.77 =C2=B1  5%      -0.6        2.18 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.main.__libc_start_main
>       2.77 =C2=B1  5%      -0.6        2.18 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.run_builtin.main.__libc_start_main
>       2.72 =C2=B1  6%      -0.6        2.13 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__cmd_record.cmd_record.cmd_sched.run_builtin.main
>       2.72 =C2=B1  6%      -0.6        2.13 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.cmd_sched.run_builtin.main.__libc_start_main
>       2.72 =C2=B1  6%      -0.6        2.13 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.cmd_record.cmd_sched.run_builtin.main.__libc_start_main
>       3.54 =C2=B1  3%      -0.4        3.09 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic=
_timer_interrupt.asm_sysvec_apic_timer_interrupt.acpi_idle_do_entry
>       3.83 =C2=B1  2%      -0.4        3.39 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt.acpi_idle_do_entry.acpi_idle_enter
>       6.00            -0.4        5.58        perf-profile.calltrace.cycl=
es-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_up_co=
mmon_lock.__locks_wake_up_blocks
>       4.57            -0.4        4.16 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.=
__locks_wake_up_blocks.locks_unlink_lock_ctx
>       4.70            -0.4        4.29 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__wake_up_common.__wake_up_common_lock.__locks_wake_up_blocks.lo=
cks_unlink_lock_ctx.locks_delete_lock_ctx
>       5.04            -0.4        4.64 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__wake_up_common_lock.__locks_wake_up_blocks.locks_unlink_lock_c=
tx.locks_delete_lock_ctx.posix_lock_inode
>       5.19            -0.4        4.81        perf-profile.calltrace.cycl=
es-pp.__locks_wake_up_blocks.locks_unlink_lock_ctx.locks_delete_lock_ctx.po=
six_lock_inode.do_lock_file_wait
>       0.79 =C2=B1  7%      -0.4        0.41 =C2=B1 71%  perf-profile.call=
trace.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>       5.62            -0.4        5.25 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.locks_delete_lock_ctx.posix_lock_inode.do_lock_file_wait.fcntl_s=
etlk.do_fcntl
>       5.59            -0.4        5.22 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.locks_unlink_lock_ctx.locks_delete_lock_ctx.posix_lock_inode.do_=
lock_file_wait.fcntl_setlk
>       1.20 =C2=B1  7%      -0.3        0.92 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_t=
imer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       3.57            -0.1        3.45        perf-profile.calltrace.cycl=
es-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_sta=
rtup_64_no_verify
>       3.50            -0.1        3.38        perf-profile.calltrace.cycl=
es-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       1.12            +0.0        1.16        perf-profile.calltrace.cycl=
es-pp.__get_user_nocheck_8.perf_callchain_user.get_perf_callchain.perf_call=
chain.perf_prepare_sample
>       0.99            +0.1        1.05 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.prepare_to_wait_event.do_lock_file_wait.fcntl_setlk.do_fcntl.__x=
64_sys_fcntl
>       3.58 =C2=B1  2%      +0.1        3.67        perf-profile.calltrace=
.cycles-pp.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.dequeue_=
entity.dequeue_task_fair
>       2.35            +0.1        2.45        perf-profile.calltrace.cycl=
es-pp.perf_trace_sched_switch.__schedule.schedule_idle.do_idle.cpu_startup_=
entry
>       1.98            +0.1        2.09        perf-profile.calltrace.cycl=
es-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch.__schedul=
e.schedule_idle
>       3.47            +0.1        3.58        perf-profile.calltrace.cycl=
es-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_runtime.upd=
ate_curr.dequeue_entity
>       3.45            +0.1        3.56        perf-profile.calltrace.cycl=
es-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_tr=
ace_sched_stat_runtime.update_curr
>       3.47            +0.1        3.60        perf-profile.calltrace.cycl=
es-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow.p=
erf_tp_event.perf_trace_sched_wakeup_template
>       3.87 =C2=B1  2%      +0.1        4.01        perf-profile.calltrace=
.cycles-pp.posix_locks_conflict.__locks_insert_block.posix_lock_inode.do_lo=
ck_file_wait.fcntl_setlk
>       2.14            +0.1        2.29        perf-profile.calltrace.cycl=
es-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule_idle.do_idle
>       3.13            +0.2        3.28        perf-profile.calltrace.cycl=
es-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch.__schedul=
e.schedule
>       4.30 =C2=B1  2%      +0.2        4.45        perf-profile.calltrace=
.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.do_lock_fil=
e_wait
>       3.22            +0.2        3.38        perf-profile.calltrace.cycl=
es-pp.perf_callchain_user.get_perf_callchain.perf_callchain.perf_prepare_sa=
mple.perf_event_output_forward
>       3.81            +0.2        3.97        perf-profile.calltrace.cycl=
es-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_template.=
try_to_wake_up.autoremove_wake_function
>       4.11            +0.2        4.28        perf-profile.calltrace.cycl=
es-pp.perf_trace_sched_wakeup_template.try_to_wake_up.autoremove_wake_funct=
ion.__wake_up_common.__wake_up_common_lock
>       4.03            +0.2        4.20        perf-profile.calltrace.cycl=
es-pp.perf_tp_event.perf_trace_sched_wakeup_template.try_to_wake_up.autorem=
ove_wake_function.__wake_up_common
>       3.79            +0.2        3.96        perf-profile.calltrace.cycl=
es-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_tr=
ace_sched_wakeup_template.try_to_wake_up
>       4.40 =C2=B1  2%      +0.2        4.57        perf-profile.calltrace=
.cycles-pp.dequeue_task_fair.__schedule.schedule.do_lock_file_wait.fcntl_se=
tlk
>       3.25            +0.2        3.42        perf-profile.calltrace.cycl=
es-pp.perf_trace_sched_switch.__schedule.schedule.do_lock_file_wait.fcntl_s=
etlk
>       3.19            +0.2        3.36        perf-profile.calltrace.cycl=
es-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.do_lock_fil=
e_wait
>       4.35            +0.2        4.56        perf-profile.calltrace.cycl=
es-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow.p=
erf_tp_event.perf_trace_sched_switch
>       4.59            +0.2        4.81        perf-profile.calltrace.cycl=
es-pp.__locks_insert_block.posix_lock_inode.do_lock_file_wait.fcntl_setlk.d=
o_fcntl
>       8.59            +0.2        8.82        perf-profile.calltrace.cycl=
es-pp.__schedule.schedule.do_lock_file_wait.fcntl_setlk.do_fcntl
>       1.69 =C2=B1 14%      +0.2        1.91        perf-profile.calltrace=
.cycles-pp.unwind_next_frame.perf_callchain_kernel.get_perf_callchain.perf_=
callchain.perf_prepare_sample
>       5.07            +0.2        5.32        perf-profile.calltrace.cycl=
es-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_tr=
ace_sched_switch.__schedule
>       8.86            +0.3        9.15        perf-profile.calltrace.cycl=
es-pp.schedule.do_lock_file_wait.fcntl_setlk.do_fcntl.__x64_sys_fcntl
>       6.45 =C2=B1  4%      +0.3        6.78        perf-profile.calltrace=
.cycles-pp.perf_callchain_kernel.get_perf_callchain.perf_callchain.perf_pre=
pare_sample.perf_event_output_forward
>      10.50            +0.4       10.91        perf-profile.calltrace.cycl=
es-pp.perf_callchain.perf_prepare_sample.perf_event_output_forward.__perf_e=
vent_overflow.perf_tp_event
>      10.45            +0.4       10.88        perf-profile.calltrace.cycl=
es-pp.get_perf_callchain.perf_callchain.perf_prepare_sample.perf_event_outp=
ut_forward.__perf_event_overflow
>       2.71 =C2=B1  9%      +0.5        3.17        perf-profile.calltrace=
.cycles-pp.asm_exc_page_fault.__get_user_nocheck_8.perf_callchain_user.get_=
perf_callchain.perf_callchain
>      10.86 =C2=B1  2%      +0.5       11.35 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpui=
dle_enter.cpuidle_idle_call
>       0.00            +0.7        0.69 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pen=
ding.__sysvec_call_function_single
>       0.00            +0.7        0.71 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sy=
svec_call_function_single.asm_sysvec_call_function_single.acpi_idle_do_entry
>       1.19 =C2=B1  3%      +0.7        1.93        perf-profile.calltrace=
.cycles-pp.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_fun=
ction_single.asm_sysvec_call_function_single.acpi_idle_do_entry
>       0.00            +0.8        0.78 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.__sysvec_c=
all_function_single.sysvec_call_function_single
>       0.00            +0.8        0.82 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_function_singl=
e.sysvec_call_function_single.asm_sysvec_call_function_single
>       0.50 =C2=B1 71%      +0.9        1.38 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.perf_session__process_events.record__finish_output.__cmd_re=
cord
>       0.50 =C2=B1 71%      +0.9        1.39 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__cmd_record
>       0.50 =C2=B1 71%      +0.9        1.39 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.record__finish_output.__cmd_record
>       0.50 =C2=B1 71%      +0.9        1.38 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.reader__read_event.perf_session__process_events.record__fin=
ish_output.__cmd_record
>       1.73            +1.1        2.85 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sy=
svec_call_function_single.acpi_idle_do_entry.acpi_idle_enter
>       2.13 =C2=B1  2%      +1.4        3.54        perf-profile.calltrace=
.cycles-pp.sysvec_call_function_single.asm_sysvec_call_function_single.acpi=
_idle_do_entry.acpi_idle_enter.cpuidle_enter_state
>      10.75 =C2=B1  8%     +10.6       21.38 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.asm_sysvec_call_function_single.acpi_idle_do_entry.acpi_idl=
e_enter.cpuidle_enter_state.cpuidle_enter
>      22.37 =C2=B1  5%      -1.6       20.78        perf-profile.children.=
cycles-pp.asm_sysvec_apic_timer_interrupt
>       6.61 =C2=B1  4%      -0.6        6.01 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sysvec_apic_timer_interrupt
>       2.77 =C2=B1  5%      -0.6        2.18 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       2.77 =C2=B1  5%      -0.6        2.18 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.main
>       2.77 =C2=B1  5%      -0.6        2.18 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.run_builtin
>       2.72 =C2=B1  6%      -0.6        2.13 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.cmd_record
>       2.72 =C2=B1  6%      -0.6        2.13 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.cmd_sched
>       1.90 =C2=B1 14%      -0.6        1.32 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       3.85 =C2=B1  2%      -0.5        3.39 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       4.14 =C2=B1  2%      -0.4        3.69 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       6.27            -0.4        5.85        perf-profile.children.cycle=
s-pp.autoremove_wake_function
>       6.05            -0.4        5.63        perf-profile.children.cycle=
s-pp.try_to_wake_up
>       6.45            -0.4        6.04        perf-profile.children.cycle=
s-pp.__wake_up_common
>       6.95            -0.4        6.57        perf-profile.children.cycle=
s-pp.__wake_up_common_lock
>       5.60            -0.4        5.22 =C2=B1  2%  perf-profile.children.=
cycles-pp.locks_unlink_lock_ctx
>       5.63            -0.4        5.26 =C2=B1  2%  perf-profile.children.=
cycles-pp.locks_delete_lock_ctx
>       7.13            -0.3        6.79        perf-profile.children.cycle=
s-pp.__locks_wake_up_blocks
>       1.26 =C2=B1  6%      -0.3        0.98 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       0.29 =C2=B1 26%      -0.1        0.15 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ktime_get_update_offsets_now
>       0.67 =C2=B1  6%      -0.1        0.55        perf-profile.children.=
cycles-pp.pick_next_task_fair
>       0.16            -0.1        0.05        perf-profile.children.cycle=
s-pp.nr_iowait_cpu
>       3.60            -0.1        3.49        perf-profile.children.cycle=
s-pp.schedule_idle
>       0.41 =C2=B1  3%      -0.1        0.30 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.93 =C2=B1  2%      -0.1        0.84 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       0.16 =C2=B1 13%      -0.1        0.06 =C2=B1 77%  perf-profile.chil=
dren.cycles-pp.build_id__mark_dso_hit
>       0.16 =C2=B1 13%      -0.1        0.06 =C2=B1 77%  perf-profile.chil=
dren.cycles-pp.thread__find_map
>       0.16 =C2=B1 13%      -0.1        0.06 =C2=B1 77%  perf-profile.chil=
dren.cycles-pp.map__load
>       0.22 =C2=B1  9%      -0.1        0.13 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.perf_session__deliver_event
>       0.20 =C2=B1 10%      -0.1        0.12 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.__ordered_events__flush
>       0.20 =C2=B1 10%      -0.1        0.12 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.perf_session__process_user_event
>       0.89            -0.1        0.81 =C2=B1  5%  perf-profile.children.=
cycles-pp.enqueue_task_fair
>       0.16 =C2=B1 13%      -0.1        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.dso__load
>       0.16 =C2=B1 13%      -0.1        0.09 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__dso__load_kallsyms
>       0.78 =C2=B1  2%      -0.1        0.73 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       0.10 =C2=B1  8%      -0.0        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.cpuacct_charge
>       0.42 =C2=B1  2%      -0.0        0.39 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.check_preempt_curr
>       0.07 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.x2apic_send_IPI
>       0.06 =C2=B1  7%      +0.0        0.08 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.rb_erase
>       0.12 =C2=B1  6%      +0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.handle_mm_fault
>       0.11 =C2=B1  8%      +0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__handle_mm_fault
>       0.24 =C2=B1  3%      +0.0        0.26 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.bsearch
>       0.12 =C2=B1  8%      +0.0        0.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.core_kernel_text
>       0.27 =C2=B1  6%      +0.0        0.30        perf-profile.children.=
cycles-pp.select_task_rq
>       0.18 =C2=B1  7%      +0.0        0.21 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.memset_erms
>       0.22 =C2=B1  6%      +0.0        0.25        perf-profile.children.=
cycles-pp.select_task_rq_fair
>       0.16 =C2=B1  7%      +0.0        0.19 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.select_idle_sibling
>       0.15 =C2=B1 10%      +0.0        0.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.available_idle_cpu
>       0.19 =C2=B1  5%      +0.0        0.22 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.do_user_addr_fault
>       0.25 =C2=B1  4%      +0.0        0.29 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.irqtime_account_irq
>       0.12 =C2=B1  6%      +0.0        0.16 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__smp_call_single_queue
>       0.11 =C2=B1  4%      +0.0        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.llist_add_batch
>       1.61 =C2=B1  2%      +0.0        1.65        perf-profile.children.=
cycles-pp.native_irq_return_iret
>       0.34 =C2=B1  2%      +0.0        0.38        perf-profile.children.=
cycles-pp.fixup_exception
>       0.37 =C2=B1  3%      +0.0        0.42 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.kernelmode_fixup_or_oops
>       0.15 =C2=B1  6%      +0.0        0.20 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.___perf_sw_event
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.02 =C2=B1141%      +0.0        0.06        perf-profile.children.=
cycles-pp.tick_check_oneshot_broadcast_this_cpu
>       0.18 =C2=B1  9%      +0.0        0.23 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.perf_trace_buf_update
>       0.68 =C2=B1  2%      +0.0        0.73 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.poll_idle
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.locks_delete_block
>       0.18 =C2=B1  4%      +0.1        0.23 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_se
>       0.82 =C2=B1  2%      +0.1        0.88 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       1.02            +0.1        1.07 =C2=B1  3%  perf-profile.children.=
cycles-pp.prepare_to_wait_event
>       0.18 =C2=B1 11%      +0.1        0.23 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.update_cfs_group
>       0.08 =C2=B1 10%      +0.1        0.14 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.rcu_sched_clock_irq
>       0.54            +0.1        0.61 =C2=B1  2%  perf-profile.children.=
cycles-pp.native_sched_clock
>       0.67 =C2=B1  2%      +0.1        0.75 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       0.27 =C2=B1  3%      +0.1        0.35 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.resched_curr
>       0.65            +0.1        0.74 =C2=B1  3%  perf-profile.children.=
cycles-pp.exc_page_fault
>       1.76 =C2=B1  2%      +0.1        1.87 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       3.94 =C2=B1  2%      +0.1        4.07        perf-profile.children.=
cycles-pp.posix_locks_conflict
>       2.45 =C2=B1  2%      +0.2        2.61 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.asm_exc_page_fault
>       0.22 =C2=B1  5%      +0.2        0.38 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.llist_reverse_order
>       4.34 =C2=B1  2%      +0.2        4.50        perf-profile.children.=
cycles-pp.dequeue_entity
>       3.49            +0.2        3.66        perf-profile.children.cycle=
s-pp.__get_user_nocheck_8
>       4.42 =C2=B1  2%      +0.2        4.60        perf-profile.children.=
cycles-pp.dequeue_task_fair
>       5.44            +0.2        5.62        perf-profile.children.cycle=
s-pp.unwind_next_frame
>       4.13            +0.2        4.32        perf-profile.children.cycle=
s-pp.perf_trace_sched_wakeup_template
>       6.80            +0.2        7.01        perf-profile.children.cycle=
s-pp.perf_callchain_kernel
>       3.62            +0.2        3.82        perf-profile.children.cycle=
s-pp.perf_callchain_user
>       0.40 =C2=B1  2%      +0.2        0.62 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.ttwu_queue_wakelist
>       4.65            +0.2        4.87        perf-profile.children.cycle=
s-pp.__locks_insert_block
>       0.45 =C2=B1  7%      +0.3        0.72 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__flush_smp_call_function_queue
>       5.63            +0.3        5.92        perf-profile.children.cycle=
s-pp.perf_trace_sched_switch
>       8.92            +0.3        9.23        perf-profile.children.cycle=
s-pp.schedule
>      10.66            +0.4       11.10        perf-profile.children.cycle=
s-pp.perf_callchain
>      10.63            +0.4       11.07        perf-profile.children.cycle=
s-pp.get_perf_callchain
>      11.11            +0.5       11.58        perf-profile.children.cycle=
s-pp.perf_prepare_sample
>      12.52            +0.6       13.07        perf-profile.children.cycle=
s-pp.perf_event_output_forward
>      12.59            +0.6       13.14        perf-profile.children.cycle=
s-pp.__perf_event_overflow
>      13.16            +0.6       13.76        perf-profile.children.cycle=
s-pp.perf_tp_event
>       1.21 =C2=B1  3%      +0.8        1.96        perf-profile.children.=
cycles-pp.sched_ttwu_pending
>       1.75            +1.1        2.90 =C2=B1  2%  perf-profile.children.=
cycles-pp.__sysvec_call_function_single
>       2.16 =C2=B1  2%      +1.4        3.59        perf-profile.children.=
cycles-pp.sysvec_call_function_single
>       6.53 =C2=B1  7%      +6.1       12.68 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_call_function_single
>       1.55 =C2=B1 18%      -0.6        0.98 =C2=B1 19%  perf-profile.self=
.cycles-pp.ktime_get
>       0.22 =C2=B1  3%      -0.1        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.set_next_entity
>       0.21 =C2=B1 34%      -0.1        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.ktime_get_update_offsets_now
>       0.30 =C2=B1  4%      -0.1        0.19        perf-profile.self.cycl=
es-pp.enqueue_entity
>       0.39 =C2=B1  3%      -0.1        0.31 =C2=B1  6%  perf-profile.self=
.cycles-pp.__schedule
>       0.45 =C2=B1  2%      -0.1        0.38 =C2=B1  8%  perf-profile.self=
.cycles-pp.update_rq_clock
>       0.15 =C2=B1  6%      -0.0        0.10 =C2=B1 14%  perf-profile.self=
.cycles-pp.perf_trace_sched_switch
>       0.15 =C2=B1  6%      -0.0        0.10 =C2=B1 12%  perf-profile.self=
.cycles-pp.prepare_task_switch
>       0.09 =C2=B1 13%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.cpuacct_charge
>       0.16 =C2=B1 10%      -0.0        0.12 =C2=B1 15%  perf-profile.self=
.cycles-pp.acpi_idle_enter
>       0.07 =C2=B1  7%      -0.0        0.03 =C2=B1 70%  perf-profile.self=
.cycles-pp.tick_nohz_get_sleep_length
>       0.38 =C2=B1  5%      -0.0        0.34 =C2=B1  3%  perf-profile.self=
.cycles-pp.irqentry_enter
>       0.16 =C2=B1  5%      -0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.x2apic_send_IPI
>       0.09 =C2=B1  5%      +0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.perf_trace_buf_alloc
>       0.08 =C2=B1  5%      +0.0        0.10 =C2=B1  8%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.06 =C2=B1  7%      +0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.locks_move_blocks
>       0.10            +0.0        0.12 =C2=B1 11%  perf-profile.self.cycl=
es-pp.perf_callchain_user
>       0.09 =C2=B1 13%      +0.0        0.11 =C2=B1  8%  perf-profile.self=
.cycles-pp.perf_prepare_sample
>       0.07 =C2=B1  7%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.rcu_nmi_enter
>       0.17            +0.0        0.19 =C2=B1  4%  perf-profile.self.cycl=
es-pp.__locks_wake_up_blocks
>       0.25 =C2=B1  4%      +0.0        0.28        perf-profile.self.cycl=
es-pp.perf_output_sample
>       0.17 =C2=B1  8%      +0.0        0.19 =C2=B1  4%  perf-profile.self=
.cycles-pp.memset_erms
>       0.16            +0.0        0.18 =C2=B1  2%  perf-profile.self.cycl=
es-pp.get_perf_callchain
>       0.34 =C2=B1  3%      +0.0        0.37        perf-profile.self.cycl=
es-pp.kmem_cache_alloc
>       0.13 =C2=B1  7%      +0.0        0.16 =C2=B1  3%  perf-profile.self=
.cycles-pp.perf_trace_buf_update
>       0.11 =C2=B1 14%      +0.0        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.ttwu_queue_wakelist
>       0.15 =C2=B1 10%      +0.0        0.18 =C2=B1  4%  perf-profile.self=
.cycles-pp.available_idle_cpu
>       0.11 =C2=B1  4%      +0.0        0.15 =C2=B1  6%  perf-profile.self=
.cycles-pp.llist_add_batch
>       0.26 =C2=B1  3%      +0.0        0.29 =C2=B1  7%  perf-profile.self=
.cycles-pp.perf_output_copy
>       0.03 =C2=B1 70%      +0.0        0.07 =C2=B1 11%  perf-profile.self=
.cycles-pp.perf_event_output_forward
>       0.13 =C2=B1  9%      +0.0        0.17 =C2=B1  9%  perf-profile.self=
.cycles-pp.___perf_sw_event
>       0.06 =C2=B1 13%      +0.0        0.10 =C2=B1 31%  perf-profile.self=
.cycles-pp.rcu_sched_clock_irq
>       0.37 =C2=B1  2%      +0.0        0.41 =C2=B1  4%  perf-profile.self=
.cycles-pp.kmem_cache_free
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.tick_check_oneshot_broadcast_this_cpu
>       0.15 =C2=B1  3%      +0.0        0.19 =C2=B1  6%  perf-profile.self=
.cycles-pp.kernel_text_address
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.sched_ttwu_pending
>       0.16 =C2=B1  2%      +0.1        0.22 =C2=B1  7%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.17 =C2=B1 12%      +0.1        0.23 =C2=B1  7%  perf-profile.self=
.cycles-pp.update_cfs_group
>       0.52 =C2=B1  2%      +0.1        0.58        perf-profile.self.cycl=
es-pp.native_sched_clock
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.self.cycl=
es-pp.sysvec_call_function_single
>       0.80 =C2=B1  4%      +0.1        0.87 =C2=B1  3%  perf-profile.self=
.cycles-pp.stack_access_ok
>       0.26 =C2=B1  4%      +0.1        0.32 =C2=B1  4%  perf-profile.self=
.cycles-pp.schedule
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 14%  perf-profile.self=
.cycles-pp.asm_sysvec_call_function_single
>       1.50            +0.1        1.57        perf-profile.self.cycles-pp=
.posix_lock_inode
>       0.27 =C2=B1  3%      +0.1        0.35 =C2=B1  3%  perf-profile.self=
.cycles-pp.resched_curr
>       2.01            +0.1        2.09        perf-profile.self.cycles-pp=
.__get_user_nocheck_8
>       0.76            +0.1        0.84 =C2=B1  3%  perf-profile.self.cycl=
es-pp.__locks_insert_block
>       2.36            +0.1        2.45 =C2=B1  2%  perf-profile.self.cycl=
es-pp.unwind_next_frame
>       1.70 =C2=B1  3%      +0.1        1.80 =C2=B1  2%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       2.60 =C2=B1  4%      +0.1        2.71        perf-profile.self.cycl=
es-pp._raw_spin_lock
>       0.23 =C2=B1 10%      +0.1        0.35 =C2=B1  2%  perf-profile.self=
.cycles-pp.__flush_smp_call_function_queue
>       3.86 =C2=B1  2%      +0.1        3.99        perf-profile.self.cycl=
es-pp.posix_locks_conflict
>       0.22 =C2=B1  5%      +0.2        0.37 =C2=B1  6%  perf-profile.self=
.cycles-pp.llist_reverse_order
> =

> =

> =

> *************************************************************************=
**************************
> lkp-icl-2sp6: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ =
2.60GHz (Ice Lake) with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test=
/testcase/testtime/ucode:
>   memory/gcc-11/performance/x86_64-rhel-8.3/100%/debian-11.1-x86_64-20220=
510.cgz/lkp-icl-2sp6/vm-segv/stress-ng/60s/0xd000363
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     995507 =C2=B1  2%     +86.1%    1852517 =C2=B1  3%  stress-ng.time.in=
voluntary_context_switches
>   68476038 =C2=B1  2%      +4.1%   71315857 =C2=B1  2%  stress-ng.time.mi=
nor_page_faults
>      11409            -1.5%      11243        stress-ng.time.percent_of_c=
pu_this_job_got
>       6549            -2.3%       6397        stress-ng.time.system_time
>     530.77            +9.3%     580.08        stress-ng.time.user_time
>   73553757            +9.1%   80216920        stress-ng.time.voluntary_co=
ntext_switches
>    2067128            +6.2%    2195177        stress-ng.vm-segv.ops
>      34451            +6.2%      36586        stress-ng.vm-segv.ops_per_s=
ec
>       0.97 =C2=B1  3%      +0.1        1.10 =C2=B1  3%  mpstat.cpu.all.ir=
q%
>    1875136           +11.3%    2087805        vmstat.system.cs
>     327829           +36.5%     447446        vmstat.system.in
>      47263 =C2=B1  5%     -40.5%      28104        meminfo.Active
>      47263 =C2=B1  5%     -40.5%      28104        meminfo.Active(anon)
>    9075370 =C2=B1 11%     +19.5%   10842794 =C2=B1  7%  meminfo.DirectMap=
2M
>       4277 =C2=B1  7%     -22.0%       3334 =C2=B1 10%  numa-vmstat.node0=
.nr_page_table_pages
>      36686 =C2=B1  5%      +9.2%      40055 =C2=B1  2%  numa-vmstat.node0=
.nr_slab_unreclaimable
>      11555 =C2=B1  5%     -41.5%       6760        numa-vmstat.node1.nr_a=
ctive_anon
>      36018 =C2=B1  5%     -10.3%      32304        numa-vmstat.node1.nr_s=
lab_unreclaimable
>      11555 =C2=B1  5%     -41.5%       6760        numa-vmstat.node1.nr_z=
one_active_anon
>   15213959 =C2=B1  2%     +35.3%   20581049 =C2=B1  2%  turbostat.C1
>       1.65 =C2=B1  2%      +0.4        2.06 =C2=B1  2%  turbostat.C1%
>   21602776           +36.5%   29498360        turbostat.IRQ
>     106109           +47.2%     156142 =C2=B1  2%  turbostat.POLL
>      66.00            -3.5%      63.67        turbostat.PkgTmp
>      17139 =C2=B1  8%     -22.5%      13289 =C2=B1 10%  numa-meminfo.node=
0.PageTables
>     146764 =C2=B1  5%      +9.2%     160266 =C2=B1  2%  numa-meminfo.node=
0.SUnreclaim
>     206639 =C2=B1 14%     +15.8%     239354 =C2=B1  9%  numa-meminfo.node=
0.Slab
>      46186 =C2=B1  5%     -41.5%      27027        numa-meminfo.node1.Act=
ive
>      46186 =C2=B1  5%     -41.5%      27027        numa-meminfo.node1.Act=
ive(anon)
>     144012 =C2=B1  5%     -10.3%     129213        numa-meminfo.node1.SUn=
reclaim
>      11819 =C2=B1  5%     -40.5%       7027        proc-vmstat.nr_active_=
anon
>     194934            -4.4%     186338        proc-vmstat.nr_anon_pages
>      35981            +2.1%      36745        proc-vmstat.nr_slab_reclaim=
able
>      11819 =C2=B1  5%     -40.5%       7027        proc-vmstat.nr_zone_ac=
tive_anon
>       0.33 =C2=B1141%  +4.6e+05%       1518 =C2=B1141%  proc-vmstat.numa_=
hint_faults_local
>      20732           +12.4%      23298 =C2=B1 10%  proc-vmstat.numa_pte_u=
pdates
>       2017 =C2=B1  3%     -35.7%       1296        proc-vmstat.pgactivate
>   69826527 =C2=B1  2%      +4.1%   72683140 =C2=B1  2%  proc-vmstat.pgfau=
lt
>    3378693            +6.5%    3596865        proc-vmstat.pgreuse
>     100.41 =C2=B1  9%     -31.9%      68.34 =C2=B1 21%  sched_debug.cfs_r=
q:/.load_avg.avg
>     238.14 =C2=B1  2%      -7.1%     221.19 =C2=B1  5%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>       2589 =C2=B1  8%     +47.4%       3816 =C2=B1  5%  sched_debug.cpu.a=
vg_idle.min
>     460943           +11.3%     513170        sched_debug.cpu.nr_switches=
.avg
>     492174           +12.2%     552218        sched_debug.cpu.nr_switches=
.max
>     306597 =C2=B1  2%     +12.1%     343834        sched_debug.cpu.nr_swi=
tches.min
>      17571 =C2=B1  4%     +19.7%      21036 =C2=B1  2%  sched_debug.cpu.n=
r_switches.stddev
>       1.65 =C2=B1  7%     +36.8%       2.25 =C2=B1  2%  sched_debug.rt_rq=
:/.rt_time.avg
>     210.95 =C2=B1  7%     +36.8%     288.61 =C2=B1  2%  sched_debug.rt_rq=
:/.rt_time.max
>      18.57 =C2=B1  7%     +36.8%      25.41 =C2=B1  2%  sched_debug.rt_rq=
:/.rt_time.stddev
>      15.48            -5.4%      14.64        perf-stat.i.MPKI
>  1.422e+10            +2.8%  1.463e+10        perf-stat.i.branch-instruct=
ions
>       0.71 =C2=B1  2%      +0.0        0.73        perf-stat.i.branch-mis=
s-rate%
>   88926137            +6.1%   94340996        perf-stat.i.branch-misses
>      15.63 =C2=B1  2%      +1.0       16.67        perf-stat.i.cache-miss=
-rate%
>  1.596e+08 =C2=B1  2%      +4.1%  1.662e+08        perf-stat.i.cache-miss=
es
>   9.98e+08            -2.4%  9.745e+08        perf-stat.i.cache-references
>    1962702           +11.1%    2180969        perf-stat.i.context-switches
>       5.87            -3.3%       5.67        perf-stat.i.cpi
>     856287           +12.6%     963823        perf-stat.i.cpu-migrations
>       2444            -4.3%       2339        perf-stat.i.cycles-between-=
cache-misses
>  1.692e+10            +3.5%  1.752e+10        perf-stat.i.dTLB-loads
>    7579452            +5.4%    7990056 =C2=B1  2%  perf-stat.i.dTLB-store=
-misses
>  6.203e+09            +6.7%  6.616e+09        perf-stat.i.dTLB-stores
>  6.347e+10            +3.3%  6.559e+10        perf-stat.i.instructions
>       0.20 =C2=B1  2%      +3.5%       0.21        perf-stat.i.ipc
>     805.54            +5.5%     850.23        perf-stat.i.metric.K/sec
>     299.41            +3.6%     310.28        perf-stat.i.metric.M/sec
>    1101785 =C2=B1  2%      +3.8%    1143341 =C2=B1  2%  perf-stat.i.minor=
-faults
>   40167896            +6.1%   42598263        perf-stat.i.node-load-misses
>   17737553            +5.2%   18667552        perf-stat.i.node-store-miss=
es
>   27580447            +5.0%   28948503 =C2=B1  2%  perf-stat.i.node-stores
>    1168197 =C2=B1  2%      +3.9%    1213763 =C2=B1  2%  perf-stat.i.page-=
faults
>      15.73            -5.4%      14.88        perf-stat.overall.MPKI
>       0.62            +0.0        0.64        perf-stat.overall.branch-mi=
ss-rate%
>      16.01            +1.1       17.07        perf-stat.overall.cache-mis=
s-rate%
>       6.02            -3.3%       5.82        perf-stat.overall.cpi
>       2390 =C2=B1  2%      -4.1%       2292        perf-stat.overall.cycl=
es-between-cache-misses
>       0.17            +3.5%       0.17        perf-stat.overall.ipc
>  1.392e+10            +3.8%  1.446e+10        perf-stat.ps.branch-instruc=
tions
>   86738054            +7.2%   92973270        perf-stat.ps.branch-misses
>  1.566e+08 =C2=B1  2%      +5.2%  1.647e+08        perf-stat.ps.cache-mis=
ses
>    1919393           +12.1%    2151783        perf-stat.ps.context-switch=
es
>     124707            +1.0%     125993        perf-stat.ps.cpu-clock
>   3.74e+11            +0.9%  3.774e+11        perf-stat.ps.cpu-cycles
>     837529           +13.6%     951652        perf-stat.ps.cpu-migrations
>  1.657e+10            +4.6%  1.733e+10        perf-stat.ps.dTLB-loads
>    7426106            +6.6%    7913275 =C2=B1  2%  perf-stat.ps.dTLB-stor=
e-misses
>  6.081e+09            +7.8%  6.553e+09        perf-stat.ps.dTLB-stores
>  6.214e+10            +4.4%  6.486e+10        perf-stat.ps.instructions
>    1079593 =C2=B1  3%      +4.8%    1131212 =C2=B1  2%  perf-stat.ps.mino=
r-faults
>   39313785            +7.1%   42105991        perf-stat.ps.node-load-miss=
es
>   17343754            +6.3%   18439289        perf-stat.ps.node-store-mis=
ses
>   27142573            +6.2%   28838120        perf-stat.ps.node-stores
>    1144593 =C2=B1  3%      +4.9%    1200760 =C2=B1  2%  perf-stat.ps.page=
-faults
>     124707            +1.0%     125993        perf-stat.ps.task-clock
>  3.952e+12            +4.7%  4.138e+12        perf-stat.total.instructions
>      35.87            -2.1       33.79        perf-profile.calltrace.cycl=
es-pp.queued_read_lock_slowpath.do_wait.kernel_wait4.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>      35.52            -2.1       33.44        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.do_wait.ke=
rnel_wait4.do_syscall_64
>      39.94            -1.8       38.10        perf-profile.calltrace.cycl=
es-pp.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe.wai=
t4
>      40.07            -1.8       38.26        perf-profile.calltrace.cycl=
es-pp.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe.wait4
>      40.17            -1.8       38.37        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.wait4
>      40.19            -1.8       38.39        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.wait4
>      40.32            -1.8       38.52        perf-profile.calltrace.cycl=
es-pp.wait4
>       1.22            -0.4        0.86        perf-profile.calltrace.cycl=
es-pp.ptrace_request.arch_ptrace.__x64_sys_ptrace.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
>       1.17            -0.4        0.81        perf-profile.calltrace.cycl=
es-pp.try_to_wake_up.ptrace_request.arch_ptrace.__x64_sys_ptrace.do_syscall=
_64
>       1.23            -0.4        0.87        perf-profile.calltrace.cycl=
es-pp.arch_ptrace.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.ptrace
>      20.10            -0.4       19.75        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.ptrace_sto=
p.ptrace_do_notify.ptrace_notify
>      10.12            -0.2        9.91        perf-profile.calltrace.cycl=
es-pp.queued_read_lock_slowpath.ptrace_stop.ptrace_do_notify.ptrace_notify.=
syscall_trace_enter
>       1.48            -0.2        1.29        perf-profile.calltrace.cycl=
es-pp.wait_task_inactive.ptrace_check_attach.__x64_sys_ptrace.do_syscall_64=
.entry_SYSCALL_64_after_hwframe
>      12.17            -0.2       12.00        perf-profile.calltrace.cycl=
es-pp.ptrace_do_notify.ptrace_notify.syscall_trace_enter.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>      12.14            -0.2       11.97        perf-profile.calltrace.cycl=
es-pp.ptrace_stop.ptrace_do_notify.ptrace_notify.syscall_trace_enter.do_sys=
call_64
>      10.17            -0.1       10.03        perf-profile.calltrace.cycl=
es-pp.queued_read_lock_slowpath.ptrace_stop.ptrace_do_notify.ptrace_notify.=
syscall_exit_work
>      10.84            -0.1       10.71        perf-profile.calltrace.cycl=
es-pp.ptrace_notify.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.__munmap
>      10.86            -0.1       10.73        perf-profile.calltrace.cycl=
es-pp.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mu=
nmap
>      12.19            -0.1       12.11        perf-profile.calltrace.cycl=
es-pp.ptrace_stop.ptrace_do_notify.ptrace_notify.syscall_exit_work.syscall_=
exit_to_user_mode
>      12.23            -0.1       12.15        perf-profile.calltrace.cycl=
es-pp.ptrace_notify.syscall_exit_work.syscall_exit_to_user_mode.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
>      12.22            -0.1       12.14        perf-profile.calltrace.cycl=
es-pp.ptrace_do_notify.ptrace_notify.syscall_exit_work.syscall_exit_to_user=
_mode.do_syscall_64
>      10.88            -0.1       10.81        perf-profile.calltrace.cycl=
es-pp.syscall_exit_work.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe.__munmap
>      10.92            -0.1       10.85        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.__munmap
>       2.70            -0.0        2.65        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.sigprocmask
>       2.69            -0.0        2.65        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigprocmask
>       1.33            -0.0        1.29        perf-profile.calltrace.cycl=
es-pp.ptrace_notify.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.sigprocmask
>       1.33            -0.0        1.29        perf-profile.calltrace.cycl=
es-pp.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigp=
rocmask
>       2.55            -0.0        2.53        perf-profile.calltrace.cycl=
es-pp.ptrace_stop.ptrace_signal.get_signal.arch_do_signal_or_restart.exit_t=
o_user_mode_loop
>       2.55            -0.0        2.53        perf-profile.calltrace.cycl=
es-pp.ptrace_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_=
loop.exit_to_user_mode_prepare
>       2.07            -0.0        2.04        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.ptrace_sto=
p.ptrace_signal.get_signal
>       1.40            -0.0        1.38        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fau=
lt.__munmap
>       1.43            -0.0        1.41        perf-profile.calltrace.cycl=
es-pp.asm_exc_page_fault.__munmap
>       1.40            -0.0        1.38        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_use=
r_mode.asm_exc_page_fault.__munmap
>       1.40            -0.0        1.38        perf-profile.calltrace.cycl=
es-pp.irqentry_exit_to_user_mode.asm_exc_page_fault.__munmap
>       0.57            +0.0        0.61        perf-profile.calltrace.cycl=
es-pp.copy_p4d_range.copy_page_range.dup_mmap.dup_mm.copy_process
>       0.60 =C2=B1  2%      +0.0        0.64        perf-profile.calltrace=
.cycles-pp.copy_page_range.dup_mmap.dup_mm.copy_process.kernel_clone
>       0.67            +0.0        0.72        perf-profile.calltrace.cycl=
es-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mmap.d=
up_mm
>       1.38            +0.0        1.43 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.unmap_vmas.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap
>       3.91            +0.1        3.96        perf-profile.calltrace.cycl=
es-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_pr=
epare.irqentry_exit_to_user_mode.asm_exc_page_fault
>       3.91            +0.1        3.96        perf-profile.calltrace.cycl=
es-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_u=
ser_mode_prepare.irqentry_exit_to_user_mode
>       2.28            +0.1        2.33        perf-profile.calltrace.cycl=
es-pp.exit_notify.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
>       2.18            +0.1        2.23        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.release_task.wait_task_zombie.do_wait.kern=
el_wait4
>       2.11            +0.1        2.16        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.release_t=
ask.wait_task_zombie.do_wait
>       2.20            +0.1        2.26        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.exit_notify.do_exit.do_group_exit.get_sign=
al
>       2.14            +0.1        2.20        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.copy_proc=
ess.kernel_clone.__do_sys_clone
>       2.20            +0.1        2.27        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.copy_process.kernel_clone.__do_sys_clone.d=
o_syscall_64
>       2.12            +0.1        2.18        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.exit_noti=
fy.do_exit.do_group_exit
>      27.46            +0.1       27.52        perf-profile.calltrace.cycl=
es-pp.__munmap
>       2.52            +0.1        2.58        perf-profile.calltrace.cycl=
es-pp.irqentry_exit_to_user_mode.asm_exc_page_fault
>       2.51            +0.1        2.58        perf-profile.calltrace.cycl=
es-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_=
loop.exit_to_user_mode_prepare
>       2.51            +0.1        2.58        perf-profile.calltrace.cycl=
es-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_us=
er_mode_loop
>       2.39            +0.1        2.46        perf-profile.calltrace.cycl=
es-pp.release_task.wait_task_zombie.do_wait.kernel_wait4.do_syscall_64
>       2.51            +0.1        2.58        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fau=
lt
>       2.51            +0.1        2.58        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_use=
r_mode.asm_exc_page_fault
>       2.40            +0.1        2.47        perf-profile.calltrace.cycl=
es-pp.wait_task_zombie.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
>       2.20            +0.1        2.27        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.ptrace_traceme.__x64_sys_ptrace.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
>       0.90            +0.1        0.97 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.schedule.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
>       2.23            +0.1        2.30        perf-profile.calltrace.cycl=
es-pp.ptrace_traceme.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.ptrace
>       0.89            +0.1        0.97 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__schedule.schedule.do_wait.kernel_wait4.do_syscall_64
>       2.12            +0.1        2.20        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.ptrace_tr=
aceme.__x64_sys_ptrace.do_syscall_64
>      25.89            +0.1       25.97        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
>       3.30            +0.1        3.38        perf-profile.calltrace.cycl=
es-pp.asm_exc_page_fault
>      25.90            +0.1       25.98        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__munmap
>       1.38            +0.1        1.50        perf-profile.calltrace.cycl=
es-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
>       1.21            +0.1        1.34        perf-profile.calltrace.cycl=
es-pp.unlink_anon_vmas.free_pgtables.unmap_region.__do_munmap.__vm_munmap
>       1.67            +0.1        1.80 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_=
startup_entry
>       1.67            +0.1        1.81 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_=
secondary
>       1.80            +0.1        1.95 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.seco=
ndary_startup_64_no_verify
>       1.65            +0.2        1.81        perf-profile.calltrace.cycl=
es-pp.free_pgtables.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap
>       0.53 =C2=B1  3%      +0.2        0.69 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_id=
le_call.do_idle
>       1.94            +0.2        2.14        perf-profile.calltrace.cycl=
es-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
>       3.65            +0.2        3.89        perf-profile.calltrace.cycl=
es-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
>      13.41            +0.2       13.66        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ptrace
>      13.41            +0.2       13.66        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.ptrace
>      13.39            +0.2       13.64        perf-profile.calltrace.cycl=
es-pp.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_after_hwframe.ptrace
>      13.47            +0.3       13.73        perf-profile.calltrace.cycl=
es-pp.ptrace
>       4.11            +0.3        4.39        perf-profile.calltrace.cycl=
es-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
>       4.11            +0.3        4.39        perf-profile.calltrace.cycl=
es-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.__munmap
>       4.09            +0.3        4.37        perf-profile.calltrace.cycl=
es-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>       3.42            +0.3        3.72        perf-profile.calltrace.cycl=
es-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
>       0.35 =C2=B1 70%      +0.3        0.66 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.mwait_idle_with_hints.intel_idle_irq.cpuidle_enter_state.cp=
uidle_enter.cpuidle_idle_call
>       3.48            +0.3        3.79        perf-profile.calltrace.cycl=
es-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
>       6.17            +0.4        6.60        perf-profile.calltrace.cycl=
es-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>       6.49            +0.5        6.94        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__libc_fork
>       6.49            +0.5        6.94        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fork
>       6.48            +0.5        6.94        perf-profile.calltrace.cycl=
es-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.__libc_fork
>       6.48            +0.5        6.94        perf-profile.calltrace.cycl=
es-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fo=
rk
>       6.87            +0.5        7.35        perf-profile.calltrace.cycl=
es-pp.__libc_fork
>       9.85            +0.5       10.39        perf-profile.calltrace.cycl=
es-pp.ptrace_check_attach.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.ptrace
>       0.00            +0.6        0.58        perf-profile.calltrace.cycl=
es-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_startup_=
entry.start_secondary
>       7.99            +0.7        8.68        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.ptrace_che=
ck_attach.__x64_sys_ptrace.do_syscall_64
>       8.08            +0.7        8.78        perf-profile.calltrace.cycl=
es-pp.queued_read_lock_slowpath.ptrace_check_attach.__x64_sys_ptrace.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
>       0.00            +0.8        0.75        perf-profile.calltrace.cycl=
es-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_seconda=
ry.secondary_startup_64_no_verify
>       2.50            +0.8        3.26 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_n=
o_verify
>       2.51            +0.8        3.27 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64_no_verify
>       2.51            +0.8        3.27 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>       2.53            +0.8        3.30        perf-profile.calltrace.cycl=
es-pp.secondary_startup_64_no_verify
>      39.94            -1.8       38.10        perf-profile.children.cycle=
s-pp.do_wait
>      40.08            -1.8       38.26        perf-profile.children.cycle=
s-pp.kernel_wait4
>      40.35            -1.8       38.55        perf-profile.children.cycle=
s-pp.wait4
>      66.33            -1.7       64.61        perf-profile.children.cycle=
s-pp.queued_read_lock_slowpath
>      76.29            -1.5       74.75        perf-profile.children.cycle=
s-pp.native_queued_spin_lock_slowpath
>      90.41            -1.0       89.40        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      90.37            -1.0       89.37        perf-profile.children.cycle=
s-pp.do_syscall_64
>       2.24            -0.6        1.60        perf-profile.children.cycle=
s-pp.try_to_wake_up
>       1.22            -0.4        0.86        perf-profile.children.cycle=
s-pp.ptrace_request
>       1.23            -0.4        0.87        perf-profile.children.cycle=
s-pp.arch_ptrace
>       0.88            -0.3        0.62        perf-profile.children.cycle=
s-pp._raw_spin_lock
>       1.04            -0.3        0.78        perf-profile.children.cycle=
s-pp.__wake_up_common
>       1.06            -0.3        0.80        perf-profile.children.cycle=
s-pp.__wake_up_common_lock
>       1.12            -0.2        0.88        perf-profile.children.cycle=
s-pp.do_notify_parent_cldstop
>      26.89            -0.2       26.65        perf-profile.children.cycle=
s-pp.ptrace_stop
>      24.40            -0.2       24.19        perf-profile.children.cycle=
s-pp.ptrace_notify
>      24.39            -0.2       24.18        perf-profile.children.cycle=
s-pp.ptrace_do_notify
>       1.48            -0.2        1.29        perf-profile.children.cycle=
s-pp.wait_task_inactive
>      12.19            -0.1       12.04        perf-profile.children.cycle=
s-pp.syscall_trace_enter
>       0.59 =C2=B1  2%      -0.1        0.45 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       0.98            -0.1        0.88 =C2=B1  5%  perf-profile.children.=
cycles-pp.pick_next_task_fair
>       0.17 =C2=B1  2%      -0.1        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>      12.23            -0.1       12.17        perf-profile.children.cycle=
s-pp.syscall_exit_work
>      13.62            -0.0       13.58        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>       0.06            -0.0        0.03 =C2=B1 70%  perf-profile.children.=
cycles-pp.do_notify_parent
>       0.18            -0.0        0.16        perf-profile.children.cycle=
s-pp.update_rq_clock
>       0.11            -0.0        0.09 =C2=B1  5%  perf-profile.children.=
cycles-pp.kill_something_info
>       0.12            -0.0        0.11 =C2=B1  4%  perf-profile.children.=
cycles-pp.__list_del_entry_valid
>       0.10            -0.0        0.09        perf-profile.children.cycle=
s-pp.kill_pid_info
>       0.12            -0.0        0.11        perf-profile.children.cycle=
s-pp.__send_signal_locked
>       0.08            -0.0        0.07        perf-profile.children.cycle=
s-pp.do_send_sig_info
>       0.06            -0.0        0.05        perf-profile.children.cycle=
s-pp.complete_signal
>       0.11            -0.0        0.10        perf-profile.children.cycle=
s-pp.__x64_sys_kill
>       0.10            +0.0        0.11        perf-profile.children.cycle=
s-pp.migrate_task_rq_fair
>       0.10            +0.0        0.11        perf-profile.children.cycle=
s-pp.__pte_alloc
>       0.05            +0.0        0.06        perf-profile.children.cycle=
s-pp.cgroup_rstat_updated
>       0.05            +0.0        0.06        perf-profile.children.cycle=
s-pp.osq_unlock
>       0.11            +0.0        0.12        perf-profile.children.cycle=
s-pp.cpumask_next_wrap
>       0.07            +0.0        0.08        perf-profile.children.cycle=
s-pp.cpumask_next
>       0.07            +0.0        0.08        perf-profile.children.cycle=
s-pp.native_sched_clock
>       0.13            +0.0        0.14        perf-profile.children.cycle=
s-pp.__switch_to
>       0.13            +0.0        0.14        perf-profile.children.cycle=
s-pp.switch_fpu_return
>       0.09            +0.0        0.10        perf-profile.children.cycle=
s-pp.__update_load_avg_se
>       0.09            +0.0        0.10        perf-profile.children.cycle=
s-pp.restore_fpregs_from_fpstate
>       0.06            +0.0        0.07        perf-profile.children.cycle=
s-pp.vm_unmap_child
>       0.09            +0.0        0.10 =C2=B1  4%  perf-profile.children.=
cycles-pp.__memcg_kmem_charge_page
>       0.20 =C2=B1  2%      +0.0        0.22 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__anon_vma_interval_tree_remove
>       0.18 =C2=B1  2%      +0.0        0.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.stress_set_oom_adjustment
>       0.15 =C2=B1  3%      +0.0        0.16        perf-profile.children.=
cycles-pp.__slab_free
>       0.13 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._find_next_bit
>       0.08            +0.0        0.09 =C2=B1  5%  perf-profile.children.=
cycles-pp.__task_pid_nr_ns
>       0.08 =C2=B1  6%      +0.0        0.09        perf-profile.children.=
cycles-pp.perf_trace_sched_wakeup_template
>       0.08 =C2=B1  6%      +0.0        0.09        perf-profile.children.=
cycles-pp.menu_select
>       0.28            +0.0        0.29        perf-profile.children.cycle=
s-pp.__softirqentry_text_start
>       0.27            +0.0        0.29        perf-profile.children.cycle=
s-pp.remove_vma
>       0.31            +0.0        0.32        perf-profile.children.cycle=
s-pp.vm_area_dup
>       0.27            +0.0        0.29        perf-profile.children.cycle=
s-pp.__irq_exit_rcu
>       0.16            +0.0        0.18 =C2=B1  2%  perf-profile.children.=
cycles-pp.stress_vm_segv
>       0.15            +0.0        0.17 =C2=B1  2%  perf-profile.children.=
cycles-pp.___perf_sw_event
>       0.14 =C2=B1  3%      +0.0        0.16        perf-profile.children.=
cycles-pp.ret_from_fork
>       0.09 =C2=B1  5%      +0.0        0.11        perf-profile.children.=
cycles-pp.wake_affine
>       0.08 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__vmalloc_node_range
>       0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__mod_memcg_lruvec_state
>       0.11            +0.0        0.13 =C2=B1  7%  perf-profile.children.=
cycles-pp.alloc_thread_stack_node
>       0.16 =C2=B1  2%      +0.0        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.rcu_core
>       0.16 =C2=B1  2%      +0.0        0.18        perf-profile.children.=
cycles-pp.__switch_to_asm
>       0.26            +0.0        0.27        perf-profile.children.cycle=
s-pp.__x64_sys_openat
>       0.28            +0.0        0.30        perf-profile.children.cycle=
s-pp.memcg_slab_post_alloc_hook
>       0.28 =C2=B1  3%      +0.0        0.30        perf-profile.children.=
cycles-pp.copy_present_pte
>       0.23            +0.0        0.25        perf-profile.children.cycle=
s-pp.do_filp_open
>       0.23            +0.0        0.25        perf-profile.children.cycle=
s-pp.path_openat
>       0.19 =C2=B1  2%      +0.0        0.21 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.wait_task_stopped
>       0.13 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.06            +0.0        0.08        perf-profile.children.cycle=
s-pp.raw_spin_rq_lock_nested
>       0.25            +0.0        0.27        perf-profile.children.cycle=
s-pp.find_idlest_group
>       0.25            +0.0        0.27        perf-profile.children.cycle=
s-pp.do_sys_openat2
>       0.08            +0.0        0.10        perf-profile.children.cycle=
s-pp.sched_clock_cpu
>       0.24            +0.0        0.26        perf-profile.children.cycle=
s-pp.update_sg_wakeup_stats
>       0.34 =C2=B1  2%      +0.0        0.36        perf-profile.children.=
cycles-pp.unlink_file_vma
>       0.33            +0.0        0.35        perf-profile.children.cycle=
s-pp.open64
>       0.08 =C2=B1  5%      +0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_blocked_averages
>       0.26            +0.0        0.28        perf-profile.children.cycle=
s-pp.find_idlest_cpu
>       0.24            +0.0        0.26 =C2=B1  4%  perf-profile.children.=
cycles-pp.__alloc_pages
>       0.33 =C2=B1  2%      +0.0        0.35 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.mod_objcg_state
>       0.20 =C2=B1  2%      +0.0        0.22 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.wait_consider_task
>       0.16 =C2=B1  3%      +0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.dup_task_struct
>       0.37 =C2=B1  2%      +0.0        0.40 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.down_write
>       0.30            +0.0        0.33        perf-profile.children.cycle=
s-pp.wake_up_new_task
>       0.14            +0.0        0.17        perf-profile.children.cycle=
s-pp.prepare_task_switch
>       0.51 =C2=B1  2%      +0.0        0.54        perf-profile.children.=
cycles-pp.enqueue_entity
>       0.56            +0.0        0.59        perf-profile.children.cycle=
s-pp.kmem_cache_alloc
>       0.20 =C2=B1  2%      +0.0        0.24        perf-profile.children.=
cycles-pp.set_task_cpu
>       0.41 =C2=B1  3%      +0.0        0.45 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.memcg_slab_free_hook
>       0.57            +0.0        0.61        perf-profile.children.cycle=
s-pp.copy_p4d_range
>       0.46 =C2=B1  2%      +0.0        0.49        perf-profile.children.=
cycles-pp.copy_pte_range
>       0.16            +0.0        0.20 =C2=B1  4%  perf-profile.children.=
cycles-pp.select_idle_core
>       0.68            +0.0        0.72        perf-profile.children.cycle=
s-pp.anon_vma_interval_tree_insert
>       0.60 =C2=B1  2%      +0.0        0.65        perf-profile.children.=
cycles-pp.copy_page_range
>       0.65            +0.0        0.69        perf-profile.children.cycle=
s-pp.kmem_cache_free
>       3.92            +0.0        3.97        perf-profile.children.cycle=
s-pp.irqentry_exit_to_user_mode
>       5.12            +0.0        5.17        perf-profile.children.cycle=
s-pp.arch_do_signal_or_restart
>       5.12            +0.0        5.17        perf-profile.children.cycle=
s-pp.get_signal
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.__cgroup_account_cputime
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.remove_wait_queue
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp._raw_write_lock_irq
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.mm_init
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.__pagevec_lru_add
>       0.15            +0.1        0.20        perf-profile.children.cycle=
s-pp.finish_task_switch
>       5.16            +0.1        5.21        perf-profile.children.cycle=
s-pp.exit_to_user_mode_loop
>       2.28            +0.1        2.33        perf-profile.children.cycle=
s-pp.exit_notify
>       0.56            +0.1        0.63        perf-profile.children.cycle=
s-pp.dequeue_entity
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.llist_reverse_order
>       0.32            +0.1        0.39        perf-profile.children.cycle=
s-pp.available_idle_cpu
>       0.72            +0.1        0.79        perf-profile.children.cycle=
s-pp.dequeue_task_fair
>       0.46            +0.1        0.53 =C2=B1  2%  perf-profile.children.=
cycles-pp.rwsem_spin_on_owner
>       5.30            +0.1        5.37        perf-profile.children.cycle=
s-pp.exit_to_user_mode_prepare
>       2.56            +0.1        2.63        perf-profile.children.cycle=
s-pp.do_group_exit
>       2.56            +0.1        2.63        perf-profile.children.cycle=
s-pp.do_exit
>       2.39            +0.1        2.46        perf-profile.children.cycle=
s-pp.release_task
>       2.40            +0.1        2.47        perf-profile.children.cycle=
s-pp.wait_task_zombie
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.children.=
cycles-pp.llist_add_batch
>      27.48            +0.1       27.55        perf-profile.children.cycle=
s-pp.__munmap
>       2.23            +0.1        2.31        perf-profile.children.cycle=
s-pp.ptrace_traceme
>       0.00            +0.1        0.08        perf-profile.children.cycle=
s-pp.__smp_call_single_queue
>       0.40 =C2=B1  2%      +0.1        0.48        perf-profile.children.=
cycles-pp.update_cfs_group
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.children.=
cycles-pp.__flush_smp_call_function_queue
>       0.66            +0.1        0.75        perf-profile.children.cycle=
s-pp._raw_read_lock
>       0.36 =C2=B1  2%      +0.1        0.45        perf-profile.children.=
cycles-pp.osq_lock
>       0.59            +0.1        0.68        perf-profile.children.cycle=
s-pp.select_idle_cpu
>       0.85 =C2=B1  3%      +0.1        0.95 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.cgroup_enter_frozen
>       0.68            +0.1        0.78        perf-profile.children.cycle=
s-pp.select_idle_sibling
>       1.57            +0.1        1.68 =C2=B1  2%  perf-profile.children.=
cycles-pp.mwait_idle_with_hints
>       0.00            +0.1        0.12 =C2=B1  4%  perf-profile.children.=
cycles-pp.__sysvec_call_function_single
>       1.38            +0.1        1.51        perf-profile.children.cycle=
s-pp.anon_vma_clone
>       0.81            +0.1        0.93        perf-profile.children.cycle=
s-pp.select_task_rq
>       1.22            +0.1        1.34        perf-profile.children.cycle=
s-pp.unlink_anon_vmas
>       0.00            +0.1        0.13 =C2=B1  3%  perf-profile.children.=
cycles-pp.sysvec_call_function_single
>       0.92 =C2=B1  2%      +0.1        1.05        perf-profile.children.=
cycles-pp.cgroup_leave_frozen
>       6.00            +0.1        6.14        perf-profile.children.cycle=
s-pp.asm_exc_page_fault
>       1.68            +0.1        1.82 =C2=B1  2%  perf-profile.children.=
cycles-pp.cpuidle_enter
>       1.68            +0.1        1.82 =C2=B1  2%  perf-profile.children.=
cycles-pp.cpuidle_enter_state
>       2.04            +0.1        2.19 =C2=B1  2%  perf-profile.children.=
cycles-pp.schedule
>       1.06            +0.1        1.20        perf-profile.children.cycle=
s-pp.select_task_rq_fair
>       1.82            +0.2        1.97 =C2=B1  2%  perf-profile.children.=
cycles-pp.cpuidle_idle_call
>       0.54 =C2=B1  3%      +0.2        0.69 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.intel_idle_irq
>       0.00            +0.2        0.15 =C2=B1  3%  perf-profile.children.=
cycles-pp.ttwu_queue_wakelist
>       0.00            +0.2        0.16 =C2=B1  3%  perf-profile.children.=
cycles-pp.asm_sysvec_call_function_single
>       1.66            +0.2        1.82        perf-profile.children.cycle=
s-pp.free_pgtables
>       0.90            +0.2        1.08        perf-profile.children.cycle=
s-pp.rwsem_optimistic_spin
>       0.93            +0.2        1.12        perf-profile.children.cycle=
s-pp.rwsem_down_write_slowpath
>       1.94            +0.2        2.14        perf-profile.children.cycle=
s-pp.anon_vma_fork
>       8.78            +0.2        9.03        perf-profile.children.cycle=
s-pp.queued_write_lock_slowpath
>       3.65            +0.3        3.90        perf-profile.children.cycle=
s-pp.unmap_region
>       1.94 =C2=B1  2%      +0.3        2.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irq
>      13.40            +0.3       13.65        perf-profile.children.cycle=
s-pp.__x64_sys_ptrace
>      13.48            +0.3       13.74        perf-profile.children.cycle=
s-pp.ptrace
>       4.11            +0.3        4.39        perf-profile.children.cycle=
s-pp.__x64_sys_munmap
>       4.11            +0.3        4.39        perf-profile.children.cycle=
s-pp.__vm_munmap
>       4.09            +0.3        4.37        perf-profile.children.cycle=
s-pp.__do_munmap
>       3.42            +0.3        3.73        perf-profile.children.cycle=
s-pp.dup_mmap
>       3.48            +0.3        3.79        perf-profile.children.cycle=
s-pp.dup_mm
>       6.18            +0.4        6.60        perf-profile.children.cycle=
s-pp.copy_process
>       6.48            +0.5        6.94        perf-profile.children.cycle=
s-pp.kernel_clone
>       6.48            +0.5        6.94        perf-profile.children.cycle=
s-pp.__do_sys_clone
>       6.90            +0.5        7.38        perf-profile.children.cycle=
s-pp.__libc_fork
>       9.85            +0.5       10.39        perf-profile.children.cycle=
s-pp.ptrace_check_attach
>       0.00            +0.7        0.69        perf-profile.children.cycle=
s-pp.sched_ttwu_pending
>       2.51            +0.8        3.27 =C2=B1  2%  perf-profile.children.=
cycles-pp.start_secondary
>       2.53            +0.8        3.29 =C2=B1  2%  perf-profile.children.=
cycles-pp.do_idle
>       2.53            +0.8        3.30        perf-profile.children.cycle=
s-pp.secondary_startup_64_no_verify
>       2.53            +0.8        3.30        perf-profile.children.cycle=
s-pp.cpu_startup_entry
>       0.00            +0.8        0.77        perf-profile.children.cycle=
s-pp.flush_smp_call_function_queue
>      75.79            -1.5       74.26        perf-profile.self.cycles-pp=
.native_queued_spin_lock_slowpath
>       1.37            -0.2        1.19        perf-profile.self.cycles-pp=
.wait_task_inactive
>       0.10            -0.0        0.07        perf-profile.self.cycles-pp=
.enqueue_entity
>       0.14 =C2=B1  3%      -0.0        0.11        perf-profile.self.cycl=
es-pp.update_rq_clock
>       0.12 =C2=B1  4%      -0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.30            -0.0        0.28        perf-profile.self.cycles-pp=
.queued_write_lock_slowpath
>       0.12            -0.0        0.10 =C2=B1  4%  perf-profile.self.cycl=
es-pp.__list_del_entry_valid
>       0.23            -0.0        0.22 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__schedule
>       0.20            +0.0        0.21        perf-profile.self.cycles-pp=
.dup_mmap
>       0.10            +0.0        0.11        perf-profile.self.cycles-pp=
.__rb_erase_color
>       0.05            +0.0        0.06        perf-profile.self.cycles-pp=
.finish_task_switch
>       0.05            +0.0        0.06        perf-profile.self.cycles-pp=
.vm_unmap_child
>       0.05            +0.0        0.06        perf-profile.self.cycles-pp=
.osq_unlock
>       0.16            +0.0        0.17        perf-profile.self.cycles-pp=
.memcg_slab_post_alloc_hook
>       0.09            +0.0        0.10        perf-profile.self.cycles-pp=
.restore_fpregs_from_fpstate
>       0.08            +0.0        0.09        perf-profile.self.cycles-pp=
.__task_pid_nr_ns
>       0.06            +0.0        0.07        perf-profile.self.cycles-pp=
.stress_vm_segv
>       0.15 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.select_idle_cpu
>       0.13 =C2=B1  3%      +0.0        0.15        perf-profile.self.cycl=
es-pp.ptrace_check_attach
>       0.13 =C2=B1  3%      +0.0        0.15        perf-profile.self.cycl=
es-pp.___perf_sw_event
>       0.06 =C2=B1  7%      +0.0        0.08        perf-profile.self.cycl=
es-pp.native_sched_clock
>       0.12 =C2=B1  3%      +0.0        0.14        perf-profile.self.cycl=
es-pp.__update_load_avg_cfs_rq
>       0.16 =C2=B1  2%      +0.0        0.18        perf-profile.self.cycl=
es-pp.__switch_to_asm
>       0.10            +0.0        0.12 =C2=B1  6%  perf-profile.self.cycl=
es-pp.set_task_cpu
>       0.22 =C2=B1  3%      +0.0        0.24 =C2=B1  3%  perf-profile.self=
.cycles-pp.up_write
>       0.20 =C2=B1  2%      +0.0        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.__anon_vma_interval_tree_remove
>       0.15 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.wait_task_stopped
>       0.05            +0.0        0.07        perf-profile.self.cycles-pp=
.prepare_task_switch
>       0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.newidle_balance
>       0.62            +0.0        0.64        perf-profile.self.cycles-pp=
.queued_read_lock_slowpath
>       0.26 =C2=B1  3%      +0.0        0.28 =C2=B1  2%  perf-profile.self=
.cycles-pp.copy_present_pte
>       0.12            +0.0        0.14        perf-profile.self.cycles-pp=
.__switch_to
>       0.31 =C2=B1  2%      +0.0        0.33 =C2=B1  3%  perf-profile.self=
.cycles-pp.down_write
>       0.21 =C2=B1  2%      +0.0        0.24        perf-profile.self.cycl=
es-pp.update_sg_wakeup_stats
>       0.17 =C2=B1  2%      +0.0        0.20 =C2=B1  2%  perf-profile.self=
.cycles-pp.do_wait
>       0.44            +0.0        0.46        perf-profile.self.cycles-pp=
._raw_spin_lock
>       0.30            +0.0        0.32        perf-profile.self.cycles-pp=
._raw_spin_lock_irq
>       0.67 =C2=B1  2%      +0.0        0.72        perf-profile.self.cycl=
es-pp.anon_vma_interval_tree_insert
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.cgroup_rstat_updated
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
._raw_write_lock_irq
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.self.cycl=
es-pp.llist_reverse_order
>       0.31            +0.1        0.38        perf-profile.self.cycles-pp=
.available_idle_cpu
>       0.46            +0.1        0.52        perf-profile.self.cycles-pp=
.rwsem_spin_on_owner
>       0.00            +0.1        0.07 =C2=B1  6%  perf-profile.self.cycl=
es-pp.llist_add_batch
>       0.66            +0.1        0.74        perf-profile.self.cycles-pp=
._raw_read_lock
>       0.39 =C2=B1  3%      +0.1        0.48        perf-profile.self.cycl=
es-pp.update_cfs_group
>       0.35            +0.1        0.45        perf-profile.self.cycles-pp=
.osq_lock
>       1.53            +0.1        1.64 =C2=B1  2%  perf-profile.self.cycl=
es-pp.mwait_idle_with_hints
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10G=
Hz (Cascade Lake) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/option_d/opt=
ion_e/option_f/rootfs/tbox_group/test/testcase/ucode:
>   gcc-11/performance/x86_64-rhel-8.3/Random Read/POSIX AIO/No/Yes/4KB/Def=
ault Test Directory/debian-x86_64-phoronix/lkp-csl-2sp7/fio-1.14.1/phoronix=
-test-suite/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     131571            +9.6%     144262        phoronix-test-suite.fio.Ran=
domRead.POSIXAIO.No.Yes.4KB.DefaultTestDirectory.iops
>     514.33            +9.7%     564.00        phoronix-test-suite.fio.Ran=
domRead.POSIXAIO.No.Yes.4KB.DefaultTestDirectory.mb_s
>      72.67           -11.0%      64.67        phoronix-test-suite.time.pe=
rcent_of_cpu_this_job_got
>     187.90 =C2=B1 13%     -23.0%     144.73 =C2=B1  3%  phoronix-test-sui=
te.time.system_time
>       0.01 =C2=B1  7%      +0.3        0.31        mpstat.cpu.all.iowait%
>      21778            +1.1%      22013        proc-vmstat.nr_mapped
>   24375530 =C2=B1 67%     -63.4%    8921340 =C2=B1  4%  turbostat.C1
>      45675 =C2=B1 41%     -49.7%      22963 =C2=B1 83%  numa-numastat.nod=
e0.other_node
>      22805 =C2=B1 84%     +99.8%      45569 =C2=B1 42%  numa-numastat.nod=
e1.other_node
>     368395            +9.6%     403909        vmstat.io.bi
>     579394            +9.3%     633340        vmstat.system.cs
>       0.08 =C2=B1  6%     -12.5%       0.07 =C2=B1  4%  sched_debug.cfs_r=
q:/.h_nr_running.avg
>      13.65 =C2=B1 13%     -19.1%      11.05 =C2=B1  9%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     384.20 =C2=B1  7%     -25.3%     287.03 =C2=B1  8%  sched_debug.cfs_r=
q:/.util_est_enqueued.max
>      63.51 =C2=B1  7%     -24.7%      47.83 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>      26649 =C2=B1 25%    +108.9%      55664 =C2=B1 33%  sched_debug.cpu.a=
vg_idle.min
>     329.93 =C2=B1 19%    +154.1%     838.34 =C2=B1 62%  sched_debug.cpu.c=
lock_task.stddev
>      31285 =C2=B1 87%     -81.9%       5651 =C2=B1103%  sched_debug.cpu.n=
r_switches.min
>    1613084 =C2=B1 13%     +25.5%    2023897 =C2=B1  7%  sched_debug.cpu.n=
r_switches.stddev
>     587680 =C2=B1 65%     +89.4%    1112939        numa-meminfo.node0.Act=
ive
>     525926 =C2=B1 77%     +92.7%    1013319        numa-meminfo.node0.Act=
ive(anon)
>      61752 =C2=B1 48%     +61.3%      99618 =C2=B1  7%  numa-meminfo.node=
0.Active(file)
>    1774131 =C2=B1 27%     +52.8%    2710222 =C2=B1  6%  numa-meminfo.node=
0.FilePages
>      69709 =C2=B1 23%     +28.5%      89566 =C2=B1  2%  numa-meminfo.node=
0.KReclaimable
>    2765632 =C2=B1 15%     +34.3%    3713148 =C2=B1  5%  numa-meminfo.node=
0.MemUsed
>      69709 =C2=B1 23%     +28.5%      89566 =C2=B1  2%  numa-meminfo.node=
0.SReclaimable
>     958315 =C2=B1 40%     +58.5%    1518683 =C2=B1 10%  numa-meminfo.node=
0.Shmem
>     548292 =C2=B1 69%     -94.7%      29087 =C2=B1 24%  numa-meminfo.node=
1.Active
>     492881 =C2=B1 81%     -97.8%      10915 =C2=B1 13%  numa-meminfo.node=
1.Active(anon)
>      55410 =C2=B1 54%     -67.2%      18170 =C2=B1 36%  numa-meminfo.node=
1.Active(file)
>     673.33 =C2=B1 83%    -100.0%       0.00        numa-meminfo.node1.Dir=
ty
>    1258824 =C2=B1 38%     -73.9%     328918 =C2=B1 52%  numa-meminfo.node=
1.FilePages
>     360755 =C2=B1113%     -92.9%      25616 =C2=B1 11%  numa-meminfo.node=
1.Inactive(file)
>      40603 =C2=B1 39%     -48.5%      20899 =C2=B1 10%  numa-meminfo.node=
1.KReclaimable
>    1980586 =C2=B1 22%     -46.3%    1063982 =C2=B1 17%  numa-meminfo.node=
1.MemUsed
>      40603 =C2=B1 39%     -48.5%      20899 =C2=B1 10%  numa-meminfo.node=
1.SReclaimable
>     100314 =C2=B1  6%     -10.1%      90188 =C2=B1  5%  numa-meminfo.node=
1.SUnreclaim
>     842223 =C2=B1 45%     -66.2%     284709 =C2=B1 56%  numa-meminfo.node=
1.Shmem
>     140918 =C2=B1 15%     -21.2%     111088 =C2=B1  6%  numa-meminfo.node=
1.Slab
>  9.643e+08            +9.1%  1.052e+09        perf-stat.i.branch-instruct=
ions
>     583888            +9.4%     638573        perf-stat.i.context-switches
>      73.55 =C2=B1  9%     -18.9%      59.68 =C2=B1 11%  perf-stat.i.cpu-m=
igrations
>  1.254e+09            +9.5%  1.373e+09 =C2=B1  2%  perf-stat.i.dTLB-loads
>  6.828e+08            +9.5%   7.48e+08        perf-stat.i.dTLB-stores
>  4.424e+09            +9.3%  4.834e+09 =C2=B1  2%  perf-stat.i.instructio=
ns
>   31037950            +9.0%   33837974        perf-stat.i.metric.M/sec
>      64.39 =C2=B1 25%     -29.5       34.92 =C2=B1 19%  perf-stat.i.node-=
load-miss-rate%
>    2766544 =C2=B1 38%     -68.0%     884479 =C2=B1 54%  perf-stat.i.node-=
load-misses
>    1798898 =C2=B1 50%    +100.5%    3607447 =C2=B1 10%  perf-stat.i.node-=
loads
>     955.81 =C2=B1  4%      -4.8%     910.10        perf-stat.overall.cycl=
es-between-cache-misses
>       1414 =C2=B1  4%      +6.6%       1507        perf-stat.overall.inst=
ructions-per-iTLB-miss
>      59.87 =C2=B1 35%     -40.4       19.42 =C2=B1 52%  perf-stat.overall=
.node-load-miss-rate%
>  9.621e+08            +9.1%   1.05e+09        perf-stat.ps.branch-instruc=
tions
>     582438            +9.3%     636776        perf-stat.ps.context-switch=
es
>      73.38 =C2=B1  9%     -18.9%      59.53 =C2=B1 11%  perf-stat.ps.cpu-=
migrations
>  1.251e+09            +9.4%  1.369e+09 =C2=B1  2%  perf-stat.ps.dTLB-loads
>  6.813e+08            +9.5%   7.46e+08        perf-stat.ps.dTLB-stores
>  4.414e+09            +9.2%  4.821e+09 =C2=B1  2%  perf-stat.ps.instructi=
ons
>    2759682 =C2=B1 38%     -68.0%     882145 =C2=B1 54%  perf-stat.ps.node=
-load-misses
>    1794547 =C2=B1 50%    +100.5%    3597318 =C2=B1 10%  perf-stat.ps.node=
-loads
>     131470 =C2=B1 77%     +92.7%     253331        numa-vmstat.node0.nr_a=
ctive_anon
>      15437 =C2=B1 48%     +61.3%      24904 =C2=B1  7%  numa-vmstat.node0=
.nr_active_file
>      87390 =C2=B1141%    +200.2%     262317        numa-vmstat.node0.nr_d=
irtied
>     443531 =C2=B1 27%     +52.8%     677567 =C2=B1  6%  numa-vmstat.node0=
.nr_file_pages
>     239577 =C2=B1 40%     +58.5%     379675 =C2=B1 10%  numa-vmstat.node0=
.nr_shmem
>      17427 =C2=B1 23%     +28.5%      22391 =C2=B1  2%  numa-vmstat.node0=
.nr_slab_reclaimable
>      87390 =C2=B1141%    +200.2%     262317        numa-vmstat.node0.nr_w=
ritten
>     131470 =C2=B1 77%     +92.7%     253331        numa-vmstat.node0.nr_z=
one_active_anon
>      15437 =C2=B1 48%     +61.3%      24904 =C2=B1  7%  numa-vmstat.node0=
.nr_zone_active_file
>      45675 =C2=B1 41%     -49.7%      22963 =C2=B1 83%  numa-vmstat.node0=
.numa_other
>     123215 =C2=B1 81%     -97.8%       2731 =C2=B1 13%  numa-vmstat.node1=
.nr_active_anon
>      13851 =C2=B1 54%     -67.2%       4542 =C2=B1 36%  numa-vmstat.node1=
.nr_active_file
>     174779 =C2=B1 70%    -100.0%       2.33 =C2=B1 40%  numa-vmstat.node1=
.nr_dirtied
>     314708 =C2=B1 38%     -73.9%      82233 =C2=B1 52%  numa-vmstat.node1=
.nr_file_pages
>      90188 =C2=B1113%     -92.9%       6404 =C2=B1 11%  numa-vmstat.node1=
.nr_inactive_file
>     210558 =C2=B1 45%     -66.2%      71181 =C2=B1 56%  numa-vmstat.node1=
.nr_shmem
>      10150 =C2=B1 39%     -48.5%       5224 =C2=B1 10%  numa-vmstat.node1=
.nr_slab_reclaimable
>      25078 =C2=B1  6%     -10.1%      22546 =C2=B1  5%  numa-vmstat.node1=
.nr_slab_unreclaimable
>     174779 =C2=B1 70%    -100.0%       2.33 =C2=B1 40%  numa-vmstat.node1=
.nr_written
>     123215 =C2=B1 81%     -97.8%       2731 =C2=B1 13%  numa-vmstat.node1=
.nr_zone_active_anon
>      13851 =C2=B1 54%     -67.2%       4542 =C2=B1 36%  numa-vmstat.node1=
.nr_zone_active_file
>      90188 =C2=B1113%     -92.9%       6404 =C2=B1 11%  numa-vmstat.node1=
.nr_zone_inactive_file
>      22805 =C2=B1 84%     +99.8%      45569 =C2=B1 42%  numa-vmstat.node1=
.numa_other
>       7.00 =C2=B1  6%      -3.5        3.52 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       6.95 =C2=B1  6%      -3.5        3.48 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_se=
condary
>       3.41 =C2=B1  4%      -3.0        0.41 =C2=B1 71%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.__queue_work.queue_work_on.loop_queue_work.l=
oop_queue_rq
>       3.77 =C2=B1  4%      -2.8        0.96 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.loop_queue_work.loop_queue_rq.__blk_mq_try_issue_directly.b=
lk_mq_plug_issue_direct.blk_mq_flush_plug_list
>       3.66 =C2=B1  4%      -2.8        0.86 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.queue_work_on.loop_queue_work.loop_queue_rq.__blk_mq_try_is=
sue_directly.blk_mq_plug_issue_direct
>       3.59 =C2=B1  4%      -2.8        0.78 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__queue_work.queue_work_on.loop_queue_work.loop_queue_rq.__=
blk_mq_try_issue_directly
>       4.03 =C2=B1  3%      -2.8        1.22 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__blk_flush_plug.blk_finish_plug.__iomap_dio_rw.iomap_dio_r=
w.ext4_file_read_iter
>       4.04 =C2=B1  3%      -2.8        1.24 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.blk_finish_plug.__iomap_dio_rw.iomap_dio_rw.ext4_file_read_=
iter.new_sync_read
>       4.01 =C2=B1  3%      -2.8        1.22 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.blk_mq_flush_plug_list.__blk_flush_plug.blk_finish_plug.__i=
omap_dio_rw.iomap_dio_rw
>       3.99 =C2=B1  3%      -2.8        1.20 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.blk_mq_plug_issue_direct.blk_mq_flush_plug_list.__blk_flush=
_plug.blk_finish_plug.__iomap_dio_rw
>       3.97 =C2=B1  3%      -2.8        1.20 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__blk_mq_try_issue_directly.blk_mq_plug_issue_direct.blk_mq=
_flush_plug_list.__blk_flush_plug.blk_finish_plug
>       3.95 =C2=B1  3%      -2.8        1.18 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.loop_queue_rq.__blk_mq_try_issue_directly.blk_mq_plug_issue=
_direct.blk_mq_flush_plug_list.__blk_flush_plug
>       3.86 =C2=B1  5%      -2.6        1.31 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup=
_template.ttwu_do_wakeup.try_to_wake_up
>      12.95 =C2=B1  5%      -1.8       11.15 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>      12.92 =C2=B1  5%      -1.8       11.12 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      10.59 =C2=B1  2%      -1.8        8.81 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__iomap_dio_rw.iomap_dio_rw.ext4_file_read_iter.new_sync_re=
ad.vfs_read
>      10.59 =C2=B1  2%      -1.8        8.81 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.iomap_dio_rw.ext4_file_read_iter.new_sync_read.vfs_read.__x=
64_sys_pread64
>      10.76 =C2=B1  2%      -1.7        9.04 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.new_sync_read.vfs_read.__x64_sys_pread64.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>      10.74 =C2=B1  2%      -1.7        9.02 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.ext4_file_read_iter.new_sync_read.vfs_read.__x64_sys_pread6=
4.do_syscall_64
>      10.90 =C2=B1  2%      -1.7        9.19 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__x64_sys_pread64.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame
>      10.81 =C2=B1  2%      -1.7        9.10 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.vfs_read.__x64_sys_pread64.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe
>       2.85 =C2=B1  6%      -1.7        1.19 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.blk_complete_reqs.__softirqentry_text_start.run_ksoftirqd.s=
mpboot_thread_fn.kthread
>       2.60 =C2=B1  6%      -1.7        0.94 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.blk_mq_end_request.blk_complete_reqs.__softirqentry_text_st=
art.run_ksoftirqd.smpboot_thread_fn
>       2.96 =C2=B1  6%      -1.7        1.30 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
>       2.59 =C2=B1  6%      -1.7        0.94 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.blk_update_request.blk_mq_end_request.blk_complete_reqs.__s=
oftirqentry_text_start.run_ksoftirqd
>       2.93 =C2=B1  6%      -1.7        1.27 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.run_ksoftirqd.smpboot_thread_fn.k=
thread.ret_from_fork
>       2.23 =C2=B1  6%      -1.7        0.57 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.iomap_dio_bio_end_io.blk_update_request.blk_=
mq_end_request.blk_complete_reqs
>       2.32 =C2=B1  6%      -1.6        0.68 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.iomap_dio_bio_end_io.blk_update_request.blk_mq_end_request.=
blk_complete_reqs.__softirqentry_text_start
>       5.51 =C2=B1  8%      -1.2        4.26 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
>       1.37 =C2=B1 20%      -0.5        0.85 =C2=B1 31%  perf-profile.call=
trace.cycles-pp.ktime_get.clockevents_program_event.hrtimer_interrupt.__sys=
vec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>       1.75 =C2=B1 12%      -0.5        1.28 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_t=
imer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       0.92 =C2=B1  2%      +0.2        1.08 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.iomap_dio_bio_iter.__iomap_dio_rw.iomap_dio_rw.ext4_file_re=
ad_iter.new_sync_read
>       0.45 =C2=B1 70%      +0.4        0.82 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.copy_user_enhanced_fast_string.copyin.copy_page_from_iter_a=
tomic.generic_perform_write.__generic_file_write_iter
>       0.46 =C2=B1 70%      +0.4        0.88 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.copyin.copy_page_from_iter_atomic.generic_perform_write.__g=
eneric_file_write_iter.generic_file_write_iter
>       0.49 =C2=B1 70%      +0.5        0.95 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.copy_page_from_iter_atomic.generic_perform_write.__generic_=
file_write_iter.generic_file_write_iter.new_sync_write
>       0.19 =C2=B1141%      +0.6        0.77 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.shmem_getpage_gfp.shmem_write_begin.generic_perform_write._=
_generic_file_write_iter.generic_file_write_iter
>       0.20 =C2=B1141%      +0.6        0.82 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.shmem_write_begin.generic_perform_write.__generic_file_writ=
e_iter.generic_file_write_iter.new_sync_write
>       2.13 =C2=B1 11%      +0.7        2.83 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.new_sync_write.vfs_write
>       2.17 =C2=B1 12%      +0.7        2.91 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.new_sync_=
write.vfs_write.ksys_write
>       2.27 =C2=B1 12%      +0.8        3.08 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.generic_file_write_iter.new_sync_write.vfs_write.ksys_write=
.do_syscall_64
>       2.30 =C2=B1 13%      +0.8        3.13 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       0.67 =C2=B1 11%      +0.9        1.60 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.unwind_next_frame.__unwind_start.perf_callchain_kernel.get_=
perf_callchain.perf_callchain
>       2.40 =C2=B1 13%      +0.9        3.35 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__libc_write
>       0.75 =C2=B1 10%      +1.4        2.16 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.__unwind_start.perf_callchain_kernel.get_perf_callchain.per=
f_callchain.perf_prepare_sample
>       1.94 =C2=B1 28%      +1.5        3.45 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__l=
ibc_write.__libc_start_main
>       1.96 =C2=B1 28%      +1.5        3.50 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write._=
_libc_start_main
>       1.98 =C2=B1 28%      +1.6        3.54 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.__libc_start_ma=
in
>       2.07 =C2=B1 29%      +1.7        3.77 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__libc_write.__libc_start_main
>       2.67 =C2=B1 29%      +2.0        4.64 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__libc_start_main
>       0.00            +2.5        2.55 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_temp=
late.ttwu_do_wakeup.sched_ttwu_pending
>       0.00            +2.6        2.65 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.perf_tp_event.perf_trace_sched_wakeup_template.ttwu_do_wakeup.sc=
hed_ttwu_pending.flush_smp_call_function_queue
>       0.00            +2.7        2.73 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.perf_trace_sched_wakeup_template.ttwu_do_wakeup.sched_ttwu_pendi=
ng.flush_smp_call_function_queue.do_idle
>       0.00            +2.8        2.81 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.ttwu_do_wakeup.sched_ttwu_pending.flush_smp_call_function_queue.=
do_idle.cpu_startup_entry
>       0.00            +3.7        3.67 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_sta=
rtup_entry.start_secondary
>       0.00            +4.2        4.18 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_se=
condary.secondary_startup_64_no_verify
>       9.11 =C2=B1  5%      -4.4        4.66 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       7.13 =C2=B1  5%      -3.6        3.55 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       3.78 =C2=B1  3%      -2.8        0.96 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.loop_queue_work
>       3.67 =C2=B1  4%      -2.8        0.86 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.queue_work_on
>       4.05 =C2=B1  3%      -2.8        1.24 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.blk_finish_plug
>       4.03 =C2=B1  3%      -2.8        1.23 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__blk_flush_plug
>       3.59 =C2=B1  4%      -2.8        0.80 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__queue_work
>       4.01 =C2=B1  3%      -2.8        1.22 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.blk_mq_flush_plug_list
>       3.99 =C2=B1  3%      -2.8        1.20 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.blk_mq_plug_issue_direct
>       3.97 =C2=B1  3%      -2.8        1.20 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__blk_mq_try_issue_directly
>       3.95 =C2=B1  3%      -2.8        1.18 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.loop_queue_rq
>       3.42 =C2=B1  8%      -2.5        0.92 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>      10.59 =C2=B1  2%      -1.8        8.81 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__iomap_dio_rw
>      10.59 =C2=B1  2%      -1.8        8.82 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.iomap_dio_rw
>       4.01 =C2=B1  4%      -1.8        2.24 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>      10.75 =C2=B1  2%      -1.7        9.03 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.ext4_file_read_iter
>      11.08 =C2=B1  3%      -1.7        9.37 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.vfs_read
>      10.90 =C2=B1  2%      -1.7        9.19 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__x64_sys_pread64
>      10.80 =C2=B1  2%      -1.7        9.09 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.new_sync_read
>       2.60 =C2=B1  6%      -1.7        0.94 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.blk_mq_end_request
>       2.96 =C2=B1  6%      -1.7        1.30 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.run_ksoftirqd
>       2.85 =C2=B1  6%      -1.7        1.19 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.blk_complete_reqs
>       2.59 =C2=B1  6%      -1.7        0.94 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.blk_update_request
>       2.32 =C2=B1  6%      -1.6        0.68 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.iomap_dio_bio_end_io
>       5.51 =C2=B1  8%      -1.2        4.26 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.smpboot_thread_fn
>       7.95 =C2=B1 13%      -1.0        6.96 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sysvec_apic_timer_interrupt
>       5.30 =C2=B1 15%      -0.8        4.53 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       5.35 =C2=B1 15%      -0.8        4.59 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       2.79 =C2=B1  9%      -0.8        2.04 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       1.06 =C2=B1  5%      -0.7        0.39 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       1.92 =C2=B1 18%      -0.6        1.35 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       0.81 =C2=B1  4%      -0.4        0.38 =C2=B1 55%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_call_function_single
>       0.70 =C2=B1  3%      -0.4        0.33 =C2=B1 54%  perf-profile.chil=
dren.cycles-pp.sysvec_call_function_single
>       0.66            -0.3        0.33 =C2=B1 53%  perf-profile.children.=
cycles-pp.__sysvec_call_function_single
>       0.66 =C2=B1 11%      -0.3        0.36 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.tick_nohz_irq_exit
>       0.67 =C2=B1  4%      -0.3        0.40 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.34 =C2=B1 13%      -0.2        0.10 =C2=B1 53%  perf-profile.chil=
dren.cycles-pp.wake_up_q
>       0.58 =C2=B1 16%      -0.2        0.35 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.timekeeping_max_deferment
>       0.39 =C2=B1 11%      -0.2        0.17 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.futex_wake
>       0.84            -0.2        0.69 =C2=B1 16%  perf-profile.children.=
cycles-pp.native_irq_return_iret
>       0.42 =C2=B1  8%      -0.2        0.27 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.27 =C2=B1 12%      -0.1        0.12 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.check_preempt_curr
>       0.24 =C2=B1 18%      -0.1        0.13 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__module_address
>       0.26 =C2=B1 30%      -0.1        0.15 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.calc_global_load_tick
>       0.20 =C2=B1 19%      -0.1        0.10 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.mod_find
>       0.22 =C2=B1 21%      -0.1        0.12 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.is_module_text_address
>       0.19 =C2=B1 15%      -0.1        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.nr_iowait_cpu
>       0.13 =C2=B1  3%      -0.1        0.04 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.bio_check_pages_dirty
>       0.19 =C2=B1  8%      -0.1        0.11 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.tick_nohz_idle_exit
>       0.09 =C2=B1 14%      -0.0        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.raw_spin_rq_lock_nested
>       0.08 =C2=B1 10%      -0.0        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.__bio_release_pages
>       0.09 =C2=B1  5%      -0.0        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.31 =C2=B1  5%      -0.0        0.29 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.irqtime_account_irq
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__x64_sys_execve
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.do_execveat_common
>       0.06            -0.0        0.05        perf-profile.children.cycle=
s-pp.__fdget
>       0.06 =C2=B1  7%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.blk_mq_start_request
>       0.05            +0.0        0.07 =C2=B1 11%  perf-profile.children.=
cycles-pp.folio_unlock
>       0.06 =C2=B1  7%      +0.0        0.09 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.security_file_permission
>       0.12 =C2=B1 10%      +0.0        0.15 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.handle_mm_fault
>       0.10 =C2=B1  9%      +0.0        0.13 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__next_timer_interrupt
>       0.06 =C2=B1 19%      +0.0        0.10 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.put_prev_entity
>       0.03 =C2=B1 70%      +0.0        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.down_write
>       0.04 =C2=B1 71%      +0.0        0.08 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.apparmor_file_permission
>       0.26 =C2=B1  9%      +0.0        0.30 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.blk_mq_get_new_requests
>       0.36 =C2=B1  6%      +0.0        0.41 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.submit_bio_noacct_nocheck
>       0.07 =C2=B1 25%      +0.0        0.11 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.30            +0.0        0.34 =C2=B1  8%  perf-profile.children.=
cycles-pp.bio_iov_iter_get_pages
>       0.25 =C2=B1  3%      +0.0        0.30 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.lockless_pages_from_mm
>       0.27 =C2=B1  3%      +0.0        0.32 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.iov_iter_get_pages
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.rb_erase
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.get_cpu_device
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.up_write
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.nohz_run_idle_balance
>       0.10 =C2=B1  8%      +0.1        0.15 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.bio_alloc_bioset
>       0.33 =C2=B1  9%      +0.1        0.39 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.blk_mq_submit_bio
>       0.04 =C2=B1 76%      +0.1        0.10 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.folio_mark_accessed
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.__might_sleep
>       0.17 =C2=B1 20%      +0.1        0.24 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp._find_next_bit
>       0.24 =C2=B1 18%      +0.1        0.31 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.xas_load
>       0.08 =C2=B1 17%      +0.1        0.15 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.__entry_text_start
>       0.41 =C2=B1 15%      +0.1        0.49 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.rebalance_domains
>       0.31            +0.1        0.39        perf-profile.children.cycle=
s-pp.get_next_timer_interrupt
>       0.18 =C2=B1 19%      +0.1        0.27 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__might_resched
>       0.44 =C2=B1  6%      +0.1        0.55 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__perf_event_header__init_id
>       0.70 =C2=B1  5%      +0.1        0.83 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.copy_user_enhanced_fast_string
>       0.00            +0.1        0.13 =C2=B1 18%  perf-profile.children.=
cycles-pp.send_call_function_single_ipi
>       0.92 =C2=B1  2%      +0.2        1.08 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.iomap_dio_bio_iter
>       0.71 =C2=B1  5%      +0.2        0.88 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.copyin
>       0.00            +0.2        0.18 =C2=B1  7%  perf-profile.children.=
cycles-pp.llist_reverse_order
>       0.77 =C2=B1  7%      +0.2        0.95 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.copy_page_from_iter_atomic
>       0.61 =C2=B1 17%      +0.2        0.82 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.shmem_write_begin
>       1.56 =C2=B1  6%      +0.3        1.87 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.memcpy_erms
>       0.00            +0.3        0.33 =C2=B1  8%  perf-profile.children.=
cycles-pp.__smp_call_single_queue
>       0.04 =C2=B1 71%      +0.4        0.39 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.llist_add_batch
>       0.03 =C2=B1 70%      +0.4        0.39 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__flush_smp_call_function_queue
>       0.16 =C2=B1  7%      +0.4        0.60 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.ttwu_queue_wakelist
>       2.14 =C2=B1 12%      +0.7        2.83 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       2.18 =C2=B1 11%      +0.7        2.91 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       2.33 =C2=B1 13%      +0.8        3.14 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>       2.27 =C2=B1 12%      +0.8        3.09 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.generic_file_write_iter
>       2.43 =C2=B1 13%      +0.9        3.37 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       2.50 =C2=B1 13%      +1.0        3.47 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.ksys_write
>       2.70 =C2=B1 14%      +1.2        3.86 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.__libc_write
>       2.67 =C2=B1 29%      +2.0        4.64 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       0.63            +3.3        3.98 =C2=B1 10%  perf-profile.children.=
cycles-pp.sched_ttwu_pending
>       0.00            +4.2        4.20 =C2=B1  7%  perf-profile.children.=
cycles-pp.flush_smp_call_function_queue
>       1.27            -1.0        0.25 =C2=B1 31%  perf-profile.self.cycl=
es-pp.try_to_wake_up
>       2.44 =C2=B1 10%      -0.8        1.69 =C2=B1 34%  perf-profile.self=
.cycles-pp.ktime_get
>       0.41 =C2=B1 12%      -0.3        0.14 =C2=B1 19%  perf-profile.self=
.cycles-pp.update_rq_clock
>       0.67 =C2=B1  4%      -0.3        0.40 =C2=B1  9%  perf-profile.self=
.cycles-pp.__schedule
>       0.58 =C2=B1 16%      -0.2        0.34 =C2=B1 19%  perf-profile.self=
.cycles-pp.timekeeping_max_deferment
>       0.22 =C2=B1 12%      -0.2        0.05 =C2=B1 71%  perf-profile.self=
.cycles-pp.set_next_entity
>       0.84            -0.2        0.69 =C2=B1 16%  perf-profile.self.cycl=
es-pp.native_irq_return_iret
>       0.25 =C2=B1 29%      -0.1        0.15 =C2=B1 16%  perf-profile.self=
.cycles-pp.calc_global_load_tick
>       0.29 =C2=B1  7%      -0.1        0.19 =C2=B1 14%  perf-profile.self=
.cycles-pp.prepare_task_switch
>       0.18 =C2=B1 15%      -0.1        0.09 =C2=B1 15%  perf-profile.self=
.cycles-pp.nr_iowait_cpu
>       0.19 =C2=B1 21%      -0.1        0.10 =C2=B1 24%  perf-profile.self=
.cycles-pp.mod_find
>       0.21 =C2=B1 13%      -0.1        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.13 =C2=B1  3%      -0.1        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.perf_trace_sched_stat_runtime
>       0.22 =C2=B1 14%      -0.1        0.16 =C2=B1 15%  perf-profile.self=
.cycles-pp.finish_task_switch
>       0.24 =C2=B1 11%      -0.1        0.18        perf-profile.self.cycl=
es-pp.enqueue_entity
>       0.08 =C2=B1 10%      -0.0        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.__bio_release_pages
>       0.23            -0.0        0.19 =C2=B1 14%  perf-profile.self.cycl=
es-pp.do_idle
>       0.11 =C2=B1  7%      -0.0        0.07 =C2=B1 20%  perf-profile.self=
.cycles-pp.dequeue_entity
>       0.09 =C2=B1  5%      -0.0        0.06 =C2=B1 13%  perf-profile.self=
.cycles-pp.reweight_entity
>       0.06            -0.0        0.03 =C2=B1 70%  perf-profile.self.cycl=
es-pp.find_busiest_group
>       0.07 =C2=B1 17%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.select_task_rq
>       0.05            +0.0        0.07 =C2=B1 11%  perf-profile.self.cycl=
es-pp.folio_unlock
>       0.08 =C2=B1 10%      +0.0        0.10 =C2=B1 12%  perf-profile.self=
.cycles-pp.sched_clock_cpu
>       0.05 =C2=B1  8%      +0.0        0.08 =C2=B1 22%  perf-profile.self=
.cycles-pp.__perf_event_overflow
>       0.05            +0.0        0.08 =C2=B1  6%  perf-profile.self.cycl=
es-pp.rebalance_domains
>       0.10 =C2=B1  4%      +0.0        0.13 =C2=B1  7%  perf-profile.self=
.cycles-pp.loop_queue_rq
>       0.03 =C2=B1 70%      +0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.shmem_getpage_gfp
>       0.10 =C2=B1 12%      +0.0        0.14 =C2=B1 12%  perf-profile.self=
.cycles-pp.dequeue_task_fair
>       0.09 =C2=B1 19%      +0.0        0.12 =C2=B1 10%  perf-profile.self=
.cycles-pp.load_balance
>       0.06            +0.0        0.10 =C2=B1 25%  perf-profile.self.cycl=
es-pp.pick_next_task_fair
>       0.04 =C2=B1 70%      +0.0        0.08 =C2=B1 17%  perf-profile.self=
.cycles-pp.perf_trace_buf_alloc
>       0.18 =C2=B1  7%      +0.0        0.22 =C2=B1  3%  perf-profile.self=
.cycles-pp.process_one_work
>       0.06 =C2=B1 19%      +0.0        0.11 =C2=B1 11%  perf-profile.self=
.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.02 =C2=B1141%      +0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.__next_timer_interrupt
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 19%  perf-profile.self=
.cycles-pp.rb_erase
>       0.13 =C2=B1  3%      +0.0        0.18 =C2=B1  5%  perf-profile.self=
.cycles-pp.perf_prepare_sample
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1 18%  perf-profile.self=
.cycles-pp.generic_perform_write
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.get_cpu_device
>       0.21 =C2=B1  9%      +0.1        0.27 =C2=B1  9%  perf-profile.self=
.cycles-pp.ftrace_graph_ret_addr
>       0.10 =C2=B1 17%      +0.1        0.15 =C2=B1 19%  perf-profile.self=
.cycles-pp.perf_trace_sched_switch
>       0.16 =C2=B1 15%      +0.1        0.21 =C2=B1 15%  perf-profile.self=
.cycles-pp._find_next_bit
>       0.02 =C2=B1141%      +0.1        0.09 =C2=B1 32%  perf-profile.self=
.cycles-pp.vfs_write
>       0.08 =C2=B1 16%      +0.1        0.15 =C2=B1 11%  perf-profile.self=
.cycles-pp.perf_event_output_forward
>       0.06 =C2=B1 73%      +0.1        0.13 =C2=B1 39%  perf-profile.self=
.cycles-pp.__libc_write
>       0.17 =C2=B1 16%      +0.1        0.25 =C2=B1  9%  perf-profile.self=
.cycles-pp.__might_resched
>       0.25 =C2=B1 14%      +0.1        0.34 =C2=B1 11%  perf-profile.self=
.cycles-pp.fault_in_readable
>       0.82 =C2=B1 11%      +0.1        0.92 =C2=B1  4%  perf-profile.self=
.cycles-pp.perf_callchain_kernel
>       0.53 =C2=B1  6%      +0.1        0.64 =C2=B1 11%  perf-profile.self=
.cycles-pp.perf_output_copy
>       0.00            +0.1        0.13 =C2=B1 18%  perf-profile.self.cycl=
es-pp.send_call_function_single_ipi
>       0.69 =C2=B1  5%      +0.1        0.82 =C2=B1  8%  perf-profile.self=
.cycles-pp.copy_user_enhanced_fast_string
>       0.00            +0.2        0.15 =C2=B1 14%  perf-profile.self.cycl=
es-pp.flush_smp_call_function_queue
>       0.00            +0.2        0.16 =C2=B1 13%  perf-profile.self.cycl=
es-pp.sched_ttwu_pending
>       0.00            +0.2        0.18 =C2=B1  5%  perf-profile.self.cycl=
es-pp.llist_reverse_order
>       0.00            +0.2        0.20 =C2=B1 17%  perf-profile.self.cycl=
es-pp.__flush_smp_call_function_queue
>       0.66 =C2=B1  8%      +0.2        0.87 =C2=B1  6%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.04 =C2=B1 71%      +0.4        0.39 =C2=B1 10%  perf-profile.self=
.cycles-pp.llist_add_batch
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10G=
Hz (Cascade Lake) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/option_d/opt=
ion_e/option_f/rootfs/tbox_group/test/testcase/ucode:
>   gcc-11/performance/x86_64-rhel-8.3/Random Read/Sync/No/No/4KB/Default T=
est Directory/debian-x86_64-phoronix/lkp-csl-2sp7/fio-1.14.1/phoronix-test-=
suite/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     132780            +6.5%     141416        phoronix-test-suite.fio.Ran=
domRead.Sync.No.No.4KB.DefaultTestDirectory.iops
>     518.67            +6.6%     552.67        phoronix-test-suite.fio.Ran=
domRead.Sync.No.No.4KB.DefaultTestDirectory.mb_s
>  3.195e+08            +6.5%  3.403e+08        phoronix-test-suite.time.fi=
le_system_inputs
>      60.67           -12.6%      53.00        phoronix-test-suite.time.pe=
rcent_of_cpu_this_job_got
>     157.09           -20.3%     125.19        phoronix-test-suite.time.sy=
stem_time
>   39949546            +6.5%   42550398        phoronix-test-suite.time.vo=
luntary_context_switches
>       0.09 =C2=B1 18%      -0.0        0.06 =C2=B1 19%  turbostat.C1%
>       0.01 =C2=B1  7%      +0.3        0.29        mpstat.cpu.all.iowait%
>       0.25 =C2=B1  9%      -0.1        0.19        mpstat.cpu.all.soft%
>     368919            +6.6%     393239        vmstat.io.bi
>     554542            +6.6%     591132        vmstat.system.cs
>     252039            +1.1%     254737        proc-vmstat.nr_active_anon
>     301805            -0.8%     299484        proc-vmstat.nr_inactive_anon
>      53124            +0.7%      53473        proc-vmstat.nr_slab_unrecla=
imable
>     252039            +1.1%     254737        proc-vmstat.nr_zone_active_=
anon
>     301805            -0.8%     299484        proc-vmstat.nr_zone_inactiv=
e_anon
>      17193 =C2=B1 17%     +16.8%      20087 =C2=B1 13%  proc-vmstat.numa_=
hint_faults
>     607241 =C2=B1  3%     -18.2%     496594 =C2=B1  7%  proc-vmstat.pgact=
ivate
>  1.597e+08            +6.5%  1.701e+08        proc-vmstat.pgpgin
>      45459 =C2=B1 20%     +52.0%      69118 =C2=B1  4%  numa-vmstat.node0=
.nr_anon_pages
>      53.67 =C2=B1 26%     +78.9%      96.00 =C2=B1  7%  numa-vmstat.node0=
.nr_anon_transparent_hugepages
>     203847 =C2=B1 44%     -39.1%     124093 =C2=B1 73%  numa-vmstat.node0=
.nr_inactive_file
>     203847 =C2=B1 44%     -39.1%     124093 =C2=B1 73%  numa-vmstat.node0=
.nr_zone_inactive_file
>       2337 =C2=B1 22%     +64.3%       3840 =C2=B1 24%  numa-vmstat.node1=
.nr_active_anon
>      58330 =C2=B1 16%     -41.1%      34341 =C2=B1  7%  numa-vmstat.node1=
.nr_anon_pages
>      74670 =C2=B1120%    +106.9%     154513 =C2=B1 59%  numa-vmstat.node1=
.nr_inactive_file
>       2337 =C2=B1 22%     +64.3%       3840 =C2=B1 24%  numa-vmstat.node1=
.nr_zone_active_anon
>      74670 =C2=B1120%    +106.9%     154513 =C2=B1 59%  numa-vmstat.node1=
.nr_zone_inactive_file
>     110747 =C2=B1 26%     +78.5%     197639 =C2=B1  8%  numa-meminfo.node=
0.AnonHugePages
>     181805 =C2=B1 20%     +52.1%     276477 =C2=B1  4%  numa-meminfo.node=
0.AnonPages
>     210956 =C2=B1 25%     +45.7%     307404 =C2=B1  7%  numa-meminfo.node=
0.AnonPages.max
>     815390 =C2=B1 44%     -39.1%     496355 =C2=B1 73%  numa-meminfo.node=
0.Inactive(file)
>     198383 =C2=B1  3%     -11.9%     174693 =C2=B1  9%  numa-meminfo.node=
0.Slab
>      46256 =C2=B1 33%     +48.7%      68804 =C2=B1 29%  numa-meminfo.node=
1.Active
>       9349 =C2=B1 22%     +64.2%      15355 =C2=B1 24%  numa-meminfo.node=
1.Active(anon)
>     171341 =C2=B1 17%     -46.9%      91030 =C2=B1 17%  numa-meminfo.node=
1.AnonHugePages
>     233361 =C2=B1 16%     -41.1%     137380 =C2=B1  7%  numa-meminfo.node=
1.AnonPages
>     256766 =C2=B1  8%     -40.5%     152898 =C2=B1  2%  numa-meminfo.node=
1.AnonPages.max
>     298682 =C2=B1120%    +106.9%     618053 =C2=B1 59%  numa-meminfo.node=
1.Inactive(file)
>     124616 =C2=B1  4%     +20.2%     149762 =C2=B1 10%  numa-meminfo.node=
1.Slab
>      82.67 =C2=B1 16%     -32.5%      55.81 =C2=B1 13%  sched_debug.cfs_r=
q:/.load_avg.avg
>       2710 =C2=B1 22%     -52.4%       1290 =C2=B1 63%  sched_debug.cfs_r=
q:/.load_avg.max
>     381.46 =C2=B1 21%     -45.2%     208.97 =C2=B1 36%  sched_debug.cfs_r=
q:/.load_avg.stddev
>       2.72 =C2=B1 40%    +123.4%       6.08 =C2=B1 26%  sched_debug.cfs_r=
q:/.removed.load_avg.avg
>      17.75 =C2=B1 21%     +97.8%      35.11 =C2=B1 26%  sched_debug.cfs_r=
q:/.removed.load_avg.stddev
>       1.37 =C2=B1 40%    +111.2%       2.89 =C2=B1 29%  sched_debug.cfs_r=
q:/.removed.runnable_avg.avg
>       8.95 =C2=B1 22%     +88.9%      16.91 =C2=B1 29%  sched_debug.cfs_r=
q:/.removed.runnable_avg.stddev
>       1.37 =C2=B1 40%    +111.2%       2.89 =C2=B1 29%  sched_debug.cfs_r=
q:/.removed.util_avg.avg
>       8.95 =C2=B1 22%     +88.9%      16.91 =C2=B1 29%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>     667.67 =C2=B1  2%     -10.0%     601.00 =C2=B1  2%  sched_debug.cfs_r=
q:/.runnable_avg.max
>      16.60 =C2=B1  9%     -37.5%      10.37 =C2=B1 19%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     444.54 =C2=B1  2%     -32.7%     299.38 =C2=B1 15%  sched_debug.cfs_r=
q:/.util_est_enqueued.max
>      73.47 =C2=B1  3%     -35.3%      47.54 =C2=B1 16%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>       1304 =C2=B1 26%    -100.0%       0.00        sched_debug.cpu.max_id=
le_balance_cost.stddev
>       0.04 =C2=B1  5%     -30.6%       0.03 =C2=B1 11%  sched_debug.cpu.n=
r_running.avg
>       1.38 =C2=B1  7%     -18.2%       1.12 =C2=B1  9%  sched_debug.cpu.n=
r_running.max
>       0.21 =C2=B1  3%     -20.3%       0.17 =C2=B1  9%  sched_debug.cpu.n=
r_running.stddev
>    7842878 =C2=B1  6%     +22.4%    9601106 =C2=B1  8%  sched_debug.cpu.n=
r_switches.max
>      13.09           -29.4%       9.25 =C2=B1  2%  perf-stat.i.MPKI
>  8.424e+08            +6.2%  8.949e+08        perf-stat.i.branch-instruct=
ions
>       1.15            -0.0        1.11        perf-stat.i.branch-miss-rat=
e%
>    9009672            +2.1%    9200549        perf-stat.i.branch-misses
>      12.85            +4.4       17.28        perf-stat.i.cache-miss-rate%
>    7676100            +4.7%    8034633        perf-stat.i.cache-misses
>   57169897           -26.7%   41896901        perf-stat.i.cache-references
>     560237            +6.6%     597244        perf-stat.i.context-switches
>       2.38            -4.6%       2.27        perf-stat.i.cpi
>      91.70 =C2=B1  3%     -43.0%      52.25 =C2=B1  2%  perf-stat.i.cpu-m=
igrations
>       0.00 =C2=B1 13%      -0.0        0.00 =C2=B1  3%  perf-stat.i.dTLB-=
store-miss-rate%
>  6.064e+08            +9.6%  6.647e+08        perf-stat.i.dTLB-stores
>      62.02            +0.8       62.86        perf-stat.i.iTLB-load-miss-=
rate%
>    3287376            +2.7%    3376621        perf-stat.i.iTLB-load-misses
>  3.938e+09            +6.7%  4.201e+09        perf-stat.i.instructions
>       0.54            +7.9%       0.58        perf-stat.i.ipc
>   27430997            +5.4%   28901696        perf-stat.i.metric.M/sec
>      14.52           -31.3%       9.97 =C2=B1  2%  perf-stat.overall.MPKI
>       1.07            -0.0        1.03        perf-stat.overall.branch-mi=
ss-rate%
>      13.43            +5.8       19.18        perf-stat.overall.cache-mis=
s-rate%
>       1.79            -8.0%       1.65        perf-stat.overall.cpi
>     919.87            -6.2%     862.48        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.00 =C2=B1  6%      -0.0        0.00 =C2=B1  4%  perf-stat.overall=
.dTLB-store-miss-rate%
>      66.39            +1.0       67.42        perf-stat.overall.iTLB-load=
-miss-rate%
>       1198            +3.9%       1244        perf-stat.overall.instructi=
ons-per-iTLB-miss
>       0.56            +8.7%       0.61        perf-stat.overall.ipc
>  8.402e+08            +6.2%  8.925e+08        perf-stat.ps.branch-instruc=
tions
>    8987714            +2.1%    9179007        perf-stat.ps.branch-misses
>    7655116            +4.7%    8012018        perf-stat.ps.cache-misses
>   57011926           -26.7%   41779398        perf-stat.ps.cache-referenc=
es
>     558657            +6.6%     595516        perf-stat.ps.context-switch=
es
>      91.45 =C2=B1  3%     -43.0%      52.11 =C2=B1  2%  perf-stat.ps.cpu-=
migrations
>  6.048e+08            +9.6%  6.629e+08        perf-stat.ps.dTLB-stores
>    3278655            +2.7%    3367447        perf-stat.ps.iTLB-load-miss=
es
>  3.928e+09            +6.7%   4.19e+09        perf-stat.ps.instructions
>  1.688e+12            +6.6%  1.799e+12        perf-stat.total.instructions
>       7.67 =C2=B1  6%      -4.5        3.15 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_se=
condary
>       7.71 =C2=B1  6%      -4.5        3.20 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>      17.71 =C2=B1  8%      -3.7       14.00 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>      17.71 =C2=B1  8%      -3.7       14.00 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       7.03 =C2=B1  8%      -3.2        3.87 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
>       3.76 =C2=B1  7%      -2.6        1.19 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
>       3.72 =C2=B1  7%      -2.5        1.18 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.run_ksoftirqd.smpboot_thread_fn.k=
thread.ret_from_fork
>       2.92 =C2=B1  7%      -2.5        0.39 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.iomap_dio_bio_end_io.blk_update_request.blk_=
mq_end_request.blk_complete_reqs
>       3.63 =C2=B1  7%      -2.5        1.10 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.blk_complete_reqs.__softirqentry_text_start.run_ksoftirqd.s=
mpboot_thread_fn.kthread
>       3.35 =C2=B1  7%      -2.5        0.87 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.blk_mq_end_request.blk_complete_reqs.__softirqentry_text_st=
art.run_ksoftirqd.smpboot_thread_fn
>       3.34 =C2=B1  7%      -2.5        0.87 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.blk_update_request.blk_mq_end_request.blk_complete_reqs.__s=
oftirqentry_text_start.run_ksoftirqd
>       3.73 =C2=B1  8%      -2.4        1.33 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup=
_template.ttwu_do_wakeup.try_to_wake_up
>       3.04 =C2=B1  7%      -2.4        0.65 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.iomap_dio_bio_end_io.blk_update_request.blk_mq_end_request.=
blk_complete_reqs.__softirqentry_text_start
>       9.61 =C2=B1  8%      -2.0        7.62 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle=
_enter.cpuidle_idle_call.do_idle
>       8.00 =C2=B1  8%      -1.8        6.16 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>       5.21 =C2=B1 10%      -1.2        4.02 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
>       5.16 =C2=B1 10%      -1.2        3.98 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic=
_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>       1.63 =C2=B1 13%      -1.0        0.62 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.__queue_work.queue_work_on.loop_queue_work.l=
oop_queue_rq
>       1.88 =C2=B1 13%      -1.0        0.91 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.__queue_work.queue_work_on.loop_queue_work.loop_queue_rq.__=
blk_mq_try_issue_directly
>       4.76 =C2=B1  8%      -1.0        3.79 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_eve=
nt.perf_trace_sched_wakeup_template.ttwu_do_wakeup
>       1.94 =C2=B1 12%      -0.9        0.99 =C2=B1 23%  perf-profile.call=
trace.cycles-pp.queue_work_on.loop_queue_work.loop_queue_rq.__blk_mq_try_is=
sue_directly.blk_mq_plug_issue_direct
>       2.03 =C2=B1 12%      -0.9        1.09 =C2=B1 25%  perf-profile.call=
trace.cycles-pp.loop_queue_work.loop_queue_rq.__blk_mq_try_issue_directly.b=
lk_mq_plug_issue_direct.blk_mq_flush_plug_list
>       3.95 =C2=B1  8%      -0.9        3.01 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_=
overflow.perf_tp_event.perf_trace_sched_wakeup_template
>       2.28 =C2=B1 11%      -0.9        1.40 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.__blk_flush_plug.blk_finish_plug.__iomap_dio_rw.iomap_dio_r=
w.ext4_file_read_iter
>       2.29 =C2=B1 11%      -0.9        1.41 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.blk_finish_plug.__iomap_dio_rw.iomap_dio_rw.ext4_file_read_=
iter.new_sync_read
>       2.26 =C2=B1 11%      -0.9        1.40 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.blk_mq_flush_plug_list.__blk_flush_plug.blk_finish_plug.__i=
omap_dio_rw.iomap_dio_rw
>       2.22 =C2=B1 11%      -0.9        1.36 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.__blk_mq_try_issue_directly.blk_mq_plug_issue_direct.blk_mq=
_flush_plug_list.__blk_flush_plug.blk_finish_plug
>       2.23 =C2=B1 11%      -0.9        1.37 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.blk_mq_plug_issue_direct.blk_mq_flush_plug_list.__blk_flush=
_plug.blk_finish_plug.__iomap_dio_rw
>       2.20 =C2=B1 11%      -0.9        1.34 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.loop_queue_rq.__blk_mq_try_issue_directly.blk_mq_plug_issue=
_direct.blk_mq_flush_plug_list.__blk_flush_plug
>       3.13 =C2=B1 10%      -0.6        2.56 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.smpboot_thread_fn.kthread.ret_from_fork
>       3.16 =C2=B1  9%      -0.6        2.60 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.schedule.smpboot_thread_fn.kthread.ret_from_fork
>       2.46 =C2=B1  5%      -0.5        1.95 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_=
interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       1.77 =C2=B1  8%      -0.4        1.35 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__s=
ysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>       3.19 =C2=B1  8%      -0.4        2.77        perf-profile.calltrace=
.cycles-pp.schedule.worker_thread.kthread.ret_from_fork
>       3.16 =C2=B1  8%      -0.4        2.75        perf-profile.calltrace=
.cycles-pp.__schedule.schedule.worker_thread.kthread.ret_from_fork
>       3.84 =C2=B1  6%      -0.4        3.47 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.blk_mq_complete_request.loop_process_work.process_one_work.=
worker_thread.kthread
>       3.69 =C2=B1  6%      -0.4        3.32 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.raise_softirq.blk_mq_complete_request_remote.blk_mq_complet=
e_request.loop_process_work.process_one_work
>       3.82 =C2=B1  6%      -0.4        3.46 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.blk_mq_complete_request_remote.blk_mq_complete_request.loop=
_process_work.process_one_work.worker_thread
>       3.64 =C2=B1  6%      -0.4        3.28 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.raise_softirq.blk_mq_complete_request_remote=
.blk_mq_complete_request.loop_process_work
>       1.25            -0.2        1.01 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrtimer_=
interrupt.__sysvec_apic_timer_interrupt
>       1.21            -0.2        0.98 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__hrtime=
r_run_queues.hrtimer_interrupt
>       1.45 =C2=B1  9%      -0.2        1.24 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.dequeue_task_fair.__schedule.schedule.smpboot_thread_fn.kth=
read
>       1.40 =C2=B1  9%      -0.2        1.20 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.smpboo=
t_thread_fn
>       1.85 =C2=B1  4%      -0.2        1.65 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.ttwu_do_activate.try_to_wake_up.raise_softirq.blk_mq_comple=
te_request_remote.blk_mq_complete_request
>       1.82 =C2=B1  4%      -0.2        1.64 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.raise_sof=
tirq.blk_mq_complete_request_remote
>       1.18 =C2=B1  2%      -0.2        1.00 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_=
timer_interrupt.cpuidle_enter_state.cpuidle_enter
>       0.82            -0.2        0.65 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_sched=
_timer.__hrtimer_run_queues
>       1.36 =C2=B1  7%      -0.2        1.19        perf-profile.calltrace=
.cycles-pp.dequeue_task_fair.__schedule.schedule.worker_thread.kthread
>       1.18 =C2=B1 12%      -0.2        1.01 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_switch.__schedule.schedule.smpboot_thread_=
fn.kthread
>       1.79 =C2=B1  3%      -0.2        1.62 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wa=
ke_up.raise_softirq
>       1.14 =C2=B1 12%      -0.2        0.98 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.s=
mpboot_thread_fn
>       1.71 =C2=B1  4%      -0.2        1.56 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.update_curr.enqueue_entity.enqueue_task_fair.ttwu_do_activa=
te.try_to_wake_up
>       1.31 =C2=B1  7%      -0.2        1.16        perf-profile.calltrace=
.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.worker_thre=
ad
>       1.63 =C2=B1  4%      -0.1        1.49 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.enq=
ueue_entity.enqueue_task_fair
>       1.59 =C2=B1  3%      -0.1        1.46 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_r=
untime.update_curr.enqueue_entity
>       1.14 =C2=B1  8%      -0.1        1.01 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_switch.__schedule.schedule.worker_thread.k=
thread
>       1.11 =C2=B1  7%      -0.1        0.99 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.w=
orker_thread
>       0.42 =C2=B1 74%      +0.5        0.91 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.shmem_write_begin.generic_perform_write.__generic_file_writ=
e_iter.generic_file_write_iter.new_sync_write
>       0.24 =C2=B1141%      +0.6        0.86 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.shmem_getpage_gfp.shmem_write_begin.generic_perform_write._=
_generic_file_write_iter.generic_file_write_iter
>       0.78 =C2=B1  6%      +0.9        1.69 =C2=B1 27%  perf-profile.call=
trace.cycles-pp.unwind_next_frame.__unwind_start.perf_callchain_kernel.get_=
perf_callchain.perf_callchain
>       2.03 =C2=B1 14%      +1.1        3.10 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.new_sync_write.vfs_write
>       2.09 =C2=B1 15%      +1.1        3.23 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.new_sync_=
write.vfs_write.ksys_write
>       2.16 =C2=B1 15%      +1.3        3.47 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.generic_file_write_iter.new_sync_write.vfs_write.ksys_write=
.do_syscall_64
>       2.18 =C2=B1 16%      +1.3        3.52 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       1.05 =C2=B1 10%      +1.4        2.48 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup=
_template.ttwu_do_wakeup.sched_ttwu_pending
>       2.26 =C2=B1 17%      +1.5        3.76 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__libc_write
>       2.31 =C2=B1 17%      +1.6        3.89 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.__l=
ibc_write.__libc_start_main
>       2.33 =C2=B1 17%      +1.6        3.94 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write._=
_libc_start_main
>       2.34 =C2=B1 17%      +1.7        3.99 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.__libc_write.__libc_start_ma=
in
>       2.43 =C2=B1 18%      +1.8        4.26 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.__libc_write.__libc_start_main
>       3.34 =C2=B1 17%      +2.0        5.30 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.__libc_start_main
>       0.00            +2.6        2.57 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.perf_tp_event.perf_trace_sched_wakeup_template.ttwu_do_wakeup.sc=
hed_ttwu_pending.flush_smp_call_function_queue
>       0.00            +2.7        2.69 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.perf_trace_sched_wakeup_template.ttwu_do_wakeup.sched_ttwu_pendi=
ng.flush_smp_call_function_queue.do_idle
>       0.00            +2.8        2.79 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.ttwu_do_wakeup.sched_ttwu_pending.flush_smp_call_function_queue.=
do_idle.cpu_startup_entry
>       0.00            +3.6        3.61 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_sta=
rtup_entry.start_secondary
>       0.00            +4.1        4.12 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_se=
condary.secondary_startup_64_no_verify
>      21.69 =C2=B1  7%      -5.0       16.64 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__schedule
>       7.82 =C2=B1  6%      -4.6        3.21 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       8.26 =C2=B1  8%      -3.8        4.51 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>      17.71 =C2=B1  8%      -3.7       14.00 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>      17.71 =C2=B1  8%      -3.7       14.00 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.kthread
>       7.03 =C2=B1  8%      -3.2        3.87 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.smpboot_thread_fn
>       4.71 =C2=B1  5%      -2.7        2.05 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>       3.76 =C2=B1  7%      -2.6        1.20 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.run_ksoftirqd
>       3.63 =C2=B1  7%      -2.5        1.10 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.blk_complete_reqs
>       3.35 =C2=B1  7%      -2.5        0.87 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.blk_mq_end_request
>       3.35 =C2=B1  7%      -2.5        0.87 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.blk_update_request
>       3.04 =C2=B1  7%      -2.4        0.65 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.iomap_dio_bio_end_io
>       9.61 =C2=B1  8%      -2.2        7.45 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_apic_timer_interrupt
>       2.74 =C2=B1  9%      -2.0        0.72 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       8.46 =C2=B1  8%      -1.9        6.54 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.sysvec_apic_timer_interrupt
>       2.04 =C2=B1  7%      -1.8        0.28 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       1.73 =C2=B1  7%      -1.7        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_call_function_single
>       1.47 =C2=B1 10%      -1.4        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.sysvec_call_function_single
>       1.42 =C2=B1 10%      -1.4        0.06 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__sysvec_call_function_single
>       5.56 =C2=B1 10%      -1.3        4.30 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       5.52 =C2=B1 10%      -1.3        4.26 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>      12.89 =C2=B1  7%      -1.2       11.71 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.perf_callchain_kernel
>       5.51 =C2=B1  9%      -1.1        4.41 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.ttwu_do_wakeup
>       1.89 =C2=B1 13%      -1.0        0.92 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.__queue_work
>       5.19 =C2=B1  9%      -1.0        4.23 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_wakeup_template
>       1.94 =C2=B1 12%      -1.0        0.99 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.queue_work_on
>       2.03 =C2=B1 12%      -0.9        1.10 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.loop_queue_work
>       3.15 =C2=B1 15%      -0.9        2.24 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       2.29 =C2=B1 11%      -0.9        1.41 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.blk_finish_plug
>       2.28 =C2=B1 11%      -0.9        1.40 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.__blk_flush_plug
>       2.26 =C2=B1 11%      -0.9        1.40 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.blk_mq_flush_plug_list
>       2.22 =C2=B1 11%      -0.9        1.36 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.__blk_mq_try_issue_directly
>       2.23 =C2=B1 11%      -0.9        1.37 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.blk_mq_plug_issue_direct
>       2.20 =C2=B1 11%      -0.9        1.34 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.loop_queue_rq
>       2.71 =C2=B1  6%      -0.5        2.16 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       2.60 =C2=B1  5%      -0.5        2.08 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       1.98 =C2=B1  8%      -0.5        1.52 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       2.46 =C2=B1  6%      -0.4        2.03 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       3.84 =C2=B1  6%      -0.4        3.47 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.blk_mq_complete_request
>       3.71 =C2=B1  6%      -0.4        3.34 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.raise_softirq
>       3.83 =C2=B1  6%      -0.4        3.46 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.blk_mq_complete_request_remote
>       0.62 =C2=B1 43%      -0.3        0.29 =C2=B1 68%  perf-profile.chil=
dren.cycles-pp.start_kernel
>       0.62 =C2=B1 43%      -0.3        0.29 =C2=B1 68%  perf-profile.chil=
dren.cycles-pp.arch_call_rest_init
>       0.62 =C2=B1 43%      -0.3        0.29 =C2=B1 68%  perf-profile.chil=
dren.cycles-pp.rest_init
>       2.25 =C2=B1  3%      -0.3        1.95 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       1.64 =C2=B1  6%      -0.3        1.35 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.orc_find
>       0.69 =C2=B1 12%      -0.3        0.41 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.66 =C2=B1 24%      -0.3        0.39 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.tick_nohz_irq_exit
>       1.43            -0.3        1.16 =C2=B1 11%  perf-profile.children.=
cycles-pp.tick_sched_handle
>       0.86 =C2=B1  6%      -0.3        0.60 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       1.39            -0.3        1.13 =C2=B1 11%  perf-profile.children.=
cycles-pp.update_process_times
>       0.97 =C2=B1  2%      -0.2        0.77 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.50 =C2=B1 22%      -0.2        0.31 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.timekeeping_max_deferment
>       1.26            -0.2        1.07 =C2=B1 10%  perf-profile.children.=
cycles-pp.__irq_exit_rcu
>       1.28 =C2=B1  8%      -0.2        1.10 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.unwind_get_return_address
>       0.32 =C2=B1 27%      -0.2        0.15 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.intel_idle_irq
>       0.45 =C2=B1  8%      -0.2        0.28 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.24 =C2=B1 14%      -0.1        0.11 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.check_preempt_curr
>       0.16 =C2=B1 13%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.nr_iowait_cpu
>       0.71 =C2=B1  6%      -0.1        0.59 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.update_sg_lb_stats
>       0.39 =C2=B1  7%      -0.1        0.28 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.irqtime_account_irq
>       0.14 =C2=B1  3%      -0.1        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.bio_check_pages_dirty
>       0.53 =C2=B1  4%      -0.1        0.43 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.52 =C2=B1 16%      -0.1        0.42 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.prepare_task_switch
>       0.33 =C2=B1 10%      -0.1        0.24 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.arch_scale_freq_tick
>       0.11 =C2=B1 14%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.15            -0.1        0.08 =C2=B1 17%  perf-profile.children.=
cycles-pp.tick_nohz_idle_exit
>       0.20 =C2=B1 20%      -0.1        0.14 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__module_address
>       0.20 =C2=B1 10%      -0.1        0.15 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_se
>       0.09 =C2=B1  9%      -0.0        0.05 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.perf_output_end
>       0.19 =C2=B1  6%      -0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.is_module_text_address
>       0.16 =C2=B1  7%      -0.0        0.12 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.idle_cpu
>       0.14 =C2=B1  6%      -0.0        0.10 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.update_irq_load_avg
>       0.12 =C2=B1 17%      -0.0        0.08 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.cpuacct_charge
>       0.16 =C2=B1  7%      -0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.rcu_eqs_exit
>       0.22 =C2=B1  8%      -0.0        0.18 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.rcu_idle_exit
>       0.12 =C2=B1  6%      -0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.memcpy
>       0.08 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.push_and_clear_regs
>       0.09            +0.0        0.11 =C2=B1  7%  perf-profile.children.=
cycles-pp.call_cpuidle
>       0.08 =C2=B1 14%      +0.0        0.11        perf-profile.children.=
cycles-pp.ksys_lseek
>       0.14 =C2=B1 18%      +0.0        0.17 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.add_wait_queue
>       0.06 =C2=B1 13%      +0.0        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode
>       0.06 =C2=B1 13%      +0.0        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.blk_mq_start_request
>       0.16 =C2=B1 22%      +0.0        0.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.available_idle_cpu
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.rcu_eqs_enter
>       0.08 =C2=B1  5%      +0.0        0.13 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.__update_blocked_fair
>       0.18 =C2=B1  7%      +0.0        0.23 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.hrtimer_next_event_without
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.bpf_ksym_find
>       0.00            +0.1        0.06 =C2=B1 16%  perf-profile.children.=
cycles-pp.up_write
>       0.11 =C2=B1 15%      +0.1        0.17 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__next_timer_interrupt
>       0.10 =C2=B1 24%      +0.1        0.16 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__entry_text_start
>       0.17 =C2=B1 11%      +0.1        0.24        perf-profile.children.=
cycles-pp._find_next_bit
>       0.24 =C2=B1 16%      +0.1        0.31 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.xas_load
>       0.03 =C2=B1141%      +0.1        0.09 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.syscall_return_via_sysret
>       0.21 =C2=B1 20%      +0.1        0.28 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.select_task_rq_fair
>       0.03 =C2=B1141%      +0.1        0.11 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.folio_mark_accessed
>       0.24 =C2=B1 21%      +0.1        0.33 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.select_task_rq
>       0.11 =C2=B1 49%      +0.1        0.20 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.blk_mq_get_tag
>       0.00            +0.1        0.09 =C2=B1 24%  perf-profile.children.=
cycles-pp.send_call_function_single_ipi
>       0.08 =C2=B1 22%      +0.1        0.17        perf-profile.children.=
cycles-pp.__fdget_pos
>       0.13 =C2=B1 45%      +0.1        0.23 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__blk_mq_alloc_requests
>       0.30 =C2=B1 16%      +0.1        0.42 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.blk_mq_get_new_requests
>       0.00            +0.1        0.12 =C2=B1 36%  perf-profile.children.=
cycles-pp.down_write
>       0.38 =C2=B1 11%      +0.1        0.52 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.blk_mq_submit_bio
>       0.40 =C2=B1  9%      +0.1        0.54 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.submit_bio_noacct_nocheck
>       0.27 =C2=B1 24%      +0.2        0.43 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.fault_in_readable
>       0.28 =C2=B1 23%      +0.2        0.45 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.fault_in_iov_iter_readable
>       0.00            +0.2        0.19 =C2=B1 13%  perf-profile.children.=
cycles-pp.llist_reverse_order
>       0.52 =C2=B1 13%      +0.2        0.73 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__filemap_get_folio
>       0.34 =C2=B1 18%      +0.2        0.57 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.shmem_write_end
>       0.08 =C2=B1 22%      +0.2        0.32 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__smp_call_single_queue
>       0.10 =C2=B1  9%      +0.2        0.35 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__flush_smp_call_function_queue
>       0.10 =C2=B1 25%      +0.3        0.40 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.llist_add_batch
>       0.23 =C2=B1 10%      +0.3        0.57 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.ttwu_queue_wakelist
>       0.57 =C2=B1 22%      +0.3        0.91 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.shmem_write_begin
>       0.95 =C2=B1 16%      +0.3        1.29 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.shmem_getpage_gfp
>       2.05 =C2=B1 15%      +1.1        3.13 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       2.09 =C2=B1 15%      +1.2        3.24 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       2.16 =C2=B1 15%      +1.3        3.48 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.generic_file_write_iter
>       2.20 =C2=B1 15%      +1.3        3.54 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>       2.29 =C2=B1 16%      +1.5        3.78 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       2.33 =C2=B1 16%      +1.6        3.91 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.ksys_write
>       2.48 =C2=B1 19%      +1.9        4.34 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__libc_write
>       3.34 =C2=B1 17%      +2.0        5.30 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       1.32 =C2=B1 10%      +2.4        3.69 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.sched_ttwu_pending
>       0.02 =C2=B1141%      +4.1        4.14 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.flush_smp_call_function_queue
>       2.77 =C2=B1 17%      -0.9        1.88 =C2=B1 36%  perf-profile.self=
.cycles-pp.ktime_get
>       0.69 =C2=B1 11%      -0.3        0.37 =C2=B1 23%  perf-profile.self=
.cycles-pp.__schedule
>       0.85 =C2=B1  7%      -0.3        0.59 =C2=B1  6%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.38 =C2=B1 14%      -0.2        0.14 =C2=B1 18%  perf-profile.self=
.cycles-pp.update_rq_clock
>       1.43 =C2=B1  6%      -0.2        1.21 =C2=B1  5%  perf-profile.self=
.cycles-pp.orc_find
>       0.33 =C2=B1  3%      -0.2        0.12 =C2=B1 20%  perf-profile.self=
.cycles-pp.finish_task_switch
>       0.50 =C2=B1 22%      -0.2        0.31 =C2=B1 29%  perf-profile.self=
.cycles-pp.timekeeping_max_deferment
>       0.27 =C2=B1 14%      -0.2        0.08 =C2=B1 27%  perf-profile.self=
.cycles-pp.set_next_entity
>       0.45 =C2=B1  5%      -0.2        0.27 =C2=B1 50%  perf-profile.self=
.cycles-pp.ktime_get_update_offsets_now
>       0.36 =C2=B1  8%      -0.2        0.19 =C2=B1 30%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       0.21 =C2=B1 28%      -0.1        0.08 =C2=B1 27%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.32 =C2=B1 17%      -0.1        0.19 =C2=B1  7%  perf-profile.self=
.cycles-pp.prepare_task_switch
>       0.97 =C2=B1  4%      -0.1        0.85 =C2=B1  2%  perf-profile.self=
.cycles-pp.perf_callchain_kernel
>       0.33 =C2=B1 10%      -0.1        0.24 =C2=B1 18%  perf-profile.self=
.cycles-pp.arch_scale_freq_tick
>       0.54 =C2=B1  7%      -0.1        0.45 =C2=B1 11%  perf-profile.self=
.cycles-pp.update_sg_lb_stats
>       0.11 =C2=B1 14%      -0.1        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.reweight_entity
>       0.22 =C2=B1 16%      -0.1        0.16 =C2=B1 18%  perf-profile.self=
.cycles-pp.__kernel_text_address
>       0.23 =C2=B1 10%      -0.1        0.17 =C2=B1  7%  perf-profile.self=
.cycles-pp.get_perf_callchain
>       0.19 =C2=B1 10%      -0.1        0.14 =C2=B1 15%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.17 =C2=B1 20%      -0.1        0.12 =C2=B1  8%  perf-profile.self=
.cycles-pp.mod_find
>       0.09 =C2=B1 13%      -0.0        0.05 =C2=B1 70%  perf-profile.self=
.cycles-pp.perf_trace_sched_stat_runtime
>       0.15 =C2=B1  6%      -0.0        0.11 =C2=B1 29%  perf-profile.self=
.cycles-pp.idle_cpu
>       0.08 =C2=B1 14%      -0.0        0.04 =C2=B1 73%  perf-profile.self=
.cycles-pp.perf_mux_hrtimer_handler
>       0.15 =C2=B1 13%      -0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.irqtime_account_irq
>       0.08 =C2=B1 10%      -0.0        0.04 =C2=B1 70%  perf-profile.self=
.cycles-pp.perf_output_end
>       0.11 =C2=B1 14%      -0.0        0.07 =C2=B1 11%  perf-profile.self=
.cycles-pp.cpuacct_charge
>       0.14 =C2=B1  5%      -0.0        0.10 =C2=B1  9%  perf-profile.self=
.cycles-pp.update_irq_load_avg
>       0.07 =C2=B1  6%      -0.0        0.06        perf-profile.self.cycl=
es-pp.push_and_clear_regs
>       0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  8%  perf-profile.self=
.cycles-pp.call_cpuidle
>       0.08 =C2=B1 16%      +0.0        0.10        perf-profile.self.cycl=
es-pp.blk_mq_free_request
>       0.07 =C2=B1  7%      +0.0        0.10 =C2=B1 14%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.10 =C2=B1 12%      +0.0        0.14 =C2=B1 17%  perf-profile.self=
.cycles-pp.dequeue_task_fair
>       0.10 =C2=B1 14%      +0.0        0.14 =C2=B1 24%  perf-profile.self=
.cycles-pp.ttwu_queue_wakelist
>       0.16 =C2=B1 25%      +0.0        0.20 =C2=B1  4%  perf-profile.self=
.cycles-pp.available_idle_cpu
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.bpf_ksym_find
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 26%  perf-profile.self=
.cycles-pp.sbitmap_get
>       0.22 =C2=B1 14%      +0.1        0.28 =C2=B1 10%  perf-profile.self=
.cycles-pp.xas_load
>       0.16 =C2=B1 12%      +0.1        0.22        perf-profile.self.cycl=
es-pp._find_next_bit
>       0.04 =C2=B1 71%      +0.1        0.09 =C2=B1 18%  perf-profile.self=
.cycles-pp.perf_trace_sched_wakeup_template
>       0.09 =C2=B1 10%      +0.1        0.16 =C2=B1 13%  perf-profile.self=
.cycles-pp.__flush_smp_call_function_queue
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 28%  perf-profile.self=
.cycles-pp.generic_perform_write
>       0.00            +0.1        0.06 =C2=B1 19%  perf-profile.self.cycl=
es-pp.folio_mark_accessed
>       0.03 =C2=B1141%      +0.1        0.09 =C2=B1 13%  perf-profile.self=
.cycles-pp.syscall_return_via_sysret
>       0.02 =C2=B1141%      +0.1        0.09 =C2=B1 27%  perf-profile.self=
.cycles-pp.vfs_write
>       0.02 =C2=B1141%      +0.1        0.09 =C2=B1 39%  perf-profile.self=
.cycles-pp.kmem_cache_alloc
>       0.06 =C2=B1 73%      +0.1        0.14 =C2=B1 24%  perf-profile.self=
.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.02 =C2=B1141%      +0.1        0.10 =C2=B1 27%  perf-profile.self=
.cycles-pp.copy_page_from_iter_atomic
>       0.07 =C2=B1 17%      +0.1        0.16 =C2=B1  2%  perf-profile.self=
.cycles-pp.__fdget_pos
>       0.00            +0.1        0.09 =C2=B1 24%  perf-profile.self.cycl=
es-pp.send_call_function_single_ipi
>       0.03 =C2=B1141%      +0.1        0.12 =C2=B1 31%  perf-profile.self=
.cycles-pp.__libc_write
>       0.25 =C2=B1  7%      +0.1        0.35 =C2=B1  3%  perf-profile.self=
.cycles-pp.__filemap_get_folio
>       0.00            +0.1        0.15 =C2=B1 32%  perf-profile.self.cycl=
es-pp.flush_smp_call_function_queue
>       0.22 =C2=B1 25%      +0.2        0.39 =C2=B1 24%  perf-profile.self=
.cycles-pp.fault_in_readable
>       0.00            +0.2        0.18 =C2=B1  4%  perf-profile.self.cycl=
es-pp.sched_ttwu_pending
>       0.28 =C2=B1 15%      +0.2        0.47 =C2=B1 21%  perf-profile.self=
.cycles-pp.shmem_write_end
>       0.00            +0.2        0.19 =C2=B1 13%  perf-profile.self.cycl=
es-pp.llist_reverse_order
>       0.10 =C2=B1 25%      +0.3        0.40 =C2=B1  3%  perf-profile.self=
.cycles-pp.llist_add_batch
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10G=
Hz (Cascade Lake) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcas=
e/ucode:
>   gcc-11/performance/x86_64-rhel-8.3/Sequential Fill/debian-x86_64-phoron=
ix/lkp-csl-2sp7/rocksdb-1.0.2/phoronix-test-suite/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     477455           +15.8%     552820        phoronix-test-suite.rocksdb=
.SequentialFill.op_s
>     628.06           -13.2%     545.19        phoronix-test-suite.time.el=
apsed_time
>     628.06           -13.2%     545.19        phoronix-test-suite.time.el=
apsed_time.max
>     599685 =C2=B1 15%     +91.9%    1150650 =C2=B1  2%  phoronix-test-sui=
te.time.involuntary_context_switches
>       2936            +1.9%       2992        phoronix-test-suite.time.pe=
rcent_of_cpu_this_job_got
>       9571           -17.2%       7925        phoronix-test-suite.time.sy=
stem_time
>       8870            -5.4%       8392        phoronix-test-suite.time.us=
er_time
>  4.108e+10           -14.7%  3.503e+10        cpuidle..time
>       0.01 =C2=B1  2%      +0.0        0.01 =C2=B1  5%  mpstat.cpu.all.io=
wait%
>      32.84            -0.9%      32.55        boot-time.boot
>       2589            -1.8%       2543        boot-time.idle
>     665.45           -12.5%     582.44        uptime.boot
>      44005           -13.7%      37978        uptime.idle
>    2395011           +15.8%    2773946        vmstat.memory.cache
>     930259           +13.5%    1055925        vmstat.system.cs
>      66.07            -2.9       63.20 =C2=B1  4%  turbostat.C1E%
>       0.32 =C2=B1 39%      +2.0        2.28 =C2=B1113%  turbostat.C6%
>       0.09 =C2=B1  9%    +411.1%       0.46 =C2=B1109%  turbostat.CPU%c6
>  1.235e+08           -12.7%  1.078e+08        turbostat.IRQ
>       0.04            +0.0        0.05        turbostat.POLL%
>     304791          +117.0%     661250 =C2=B1  3%  meminfo.Active
>     185808          +191.8%     542226 =C2=B1  3%  meminfo.Active(anon)
>    2284079           +16.5%    2661345        meminfo.Cached
>    3219822           +11.9%    3603000        meminfo.Committed_AS
>     137674          +126.1%     311316 =C2=B1  2%  meminfo.Mapped
>       1159           -15.7%     978.00        meminfo.Mlocked
>    1050557           +36.0%    1428441 =C2=B1  2%  meminfo.Shmem
>       1227           -14.8%       1046        meminfo.Unevictable
>   10481082           +23.7%   12968524        meminfo.max_used_kB
>      80472 =C2=B1  7%     +51.7%     122107 =C2=B1 20%  numa-meminfo.node=
0.Mapped
>       1035 =C2=B1  8%     -17.1%     858.33 =C2=B1  9%  numa-meminfo.node=
0.Mlocked
>       1103 =C2=B1  7%     -16.0%     926.33 =C2=B1  8%  numa-meminfo.node=
0.Unevictable
>     175321 =C2=B1  4%    +192.7%     513162 =C2=B1  9%  numa-meminfo.node=
1.Active
>     140959 =C2=B1  3%    +225.3%     458484 =C2=B1  5%  numa-meminfo.node=
1.Active(anon)
>     558494 =C2=B1 39%    +128.1%    1274010 =C2=B1 36%  numa-meminfo.node=
1.FilePages
>      58245 =C2=B1 13%    +227.5%     190770 =C2=B1  8%  numa-meminfo.node=
1.Mapped
>    1821722 =C2=B1 13%     +42.5%    2595468 =C2=B1 15%  numa-meminfo.node=
1.MemUsed
>     254731 =C2=B1  8%    +131.0%     588533 =C2=B1  7%  numa-meminfo.node=
1.Shmem
>      20126 =C2=B1  7%     +51.9%      30563 =C2=B1 20%  numa-vmstat.node0=
.nr_mapped
>     258.33 =C2=B1  8%     -17.2%     214.00 =C2=B1  9%  numa-vmstat.node0=
.nr_mlock
>     275.33 =C2=B1  7%     -16.1%     231.00 =C2=B1  8%  numa-vmstat.node0=
.nr_unevictable
>     275.33 =C2=B1  7%     -16.1%     231.00 =C2=B1  8%  numa-vmstat.node0=
.nr_zone_unevictable
>      35240 =C2=B1  3%    +225.6%     114746 =C2=B1  5%  numa-vmstat.node1=
.nr_active_anon
>     139625 =C2=B1 39%    +128.2%     318628 =C2=B1 36%  numa-vmstat.node1=
.nr_file_pages
>      14592 =C2=B1 13%    +227.6%      47811 =C2=B1  8%  numa-vmstat.node1=
.nr_mapped
>      63684 =C2=B1  8%    +131.2%     147259 =C2=B1  7%  numa-vmstat.node1=
.nr_shmem
>      35239 =C2=B1  3%    +225.6%     114746 =C2=B1  5%  numa-vmstat.node1=
.nr_zone_active_anon
>       0.30 =C2=B1  4%      +7.3%       0.32 =C2=B1  2%  sched_debug.cfs_r=
q:/.h_nr_running.avg
>      55.78 =C2=B1 54%     -80.2%      11.02 =C2=B1 15%  sched_debug.cfs_r=
q:/.load_avg.avg
>       2446 =C2=B1 53%     -94.1%     144.97 =C2=B1  5%  sched_debug.cfs_r=
q:/.load_avg.max
>       0.03 =C2=B1141%    +670.0%       0.23 =C2=B1 53%  sched_debug.cfs_r=
q:/.load_avg.min
>     286.77 =C2=B1 49%     -91.7%      23.78 =C2=B1 22%  sched_debug.cfs_r=
q:/.load_avg.stddev
>     103087 =C2=B1  4%     -37.6%      64318 =C2=B1 16%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.30 =C2=B1  4%      +7.5%       0.32 =C2=B1  2%  sched_debug.cfs_r=
q:/.nr_running.avg
>     103080 =C2=B1  4%     -37.6%      64321 =C2=B1 16%  sched_debug.cfs_r=
q:/.spread0.stddev
>      33386 =C2=B1  5%     +28.4%      42858 =C2=B1  6%  sched_debug.cpu.n=
r_switches.stddev
>      46457          +191.9%     135596 =C2=B1  3%  proc-vmstat.nr_active_=
anon
>     571418           +16.5%     665789        proc-vmstat.nr_file_pages
>      34427          +126.1%      77840 =C2=B1  2%  proc-vmstat.nr_mapped
>       2301            +4.2%       2399        proc-vmstat.nr_page_table_p=
ages
>     262626           +36.0%     357152 =C2=B1  2%  proc-vmstat.nr_shmem
>      46457          +191.9%     135596 =C2=B1  3%  proc-vmstat.nr_zone_ac=
tive_anon
>    1971545 =C2=B1  7%      +8.2%    2134017        proc-vmstat.numa_hint_=
faults
>    1100527 =C2=B1  8%      +9.6%    1205778 =C2=B1  2%  proc-vmstat.numa_=
hint_faults_local
>   17107174            +3.4%   17688780        proc-vmstat.numa_hit
>   17032195            +3.5%   17625596        proc-vmstat.numa_local
>     750365 =C2=B1  5%      +6.9%     802179        proc-vmstat.numa_pages=
_migrated
>    8136843            +1.2%    8231625        proc-vmstat.pgactivate
>   17105133            +3.4%   17691965        proc-vmstat.pgalloc_normal
>   17072082            +3.4%   17658807        proc-vmstat.pgfree
>     750365 =C2=B1  5%      +6.9%     802179        proc-vmstat.pgmigrate_=
success
>      93425            -1.6%      91964        proc-vmstat.pgpgin
>     430449           -12.9%     374901        proc-vmstat.pgreuse
>     917.67 =C2=B1  5%      +6.9%     980.67        proc-vmstat.thp_migrat=
ion_success
>      25.58            +8.5       34.12        perf-stat.i.cache-miss-rate%
>   34333638           +19.0%   40867886        perf-stat.i.cache-misses
>  1.318e+08           -11.1%  1.172e+08 =C2=B1  2%  perf-stat.i.cache-refe=
rences
>     935606           +13.7%    1063501        perf-stat.i.context-switches
>       1.10            +6.6%       1.18 =C2=B1  5%  perf-stat.i.cpi
>  8.824e+10            +3.8%  9.162e+10        perf-stat.i.cpu-cycles
>       2500 =C2=B1  3%      +6.0%       2650        perf-stat.i.cpu-migrat=
ions
>       2659           -11.9%       2342 =C2=B1  2%  perf-stat.i.cycles-bet=
ween-cache-misses
>       0.01            +0.0        0.02 =C2=B1 63%  perf-stat.i.dTLB-load-=
miss-rate%
>    2263087           +11.0%    2511882 =C2=B1  2%  perf-stat.i.dTLB-load-=
misses
>   47951519           +12.0%   53713370        perf-stat.i.iTLB-loads
>       0.93            -3.5%       0.90        perf-stat.i.ipc
>       3.07 =C2=B1  4%     +15.5%       3.55 =C2=B1  3%  perf-stat.i.major=
-faults
>     919024            +3.8%     954104        perf-stat.i.metric.GHz
>       8034 =C2=B1  3%     +13.5%       9120        perf-stat.i.minor-faul=
ts
>   15853620           +14.9%   18209231        perf-stat.i.node-load-misses
>    1051163           +20.4%    1265906 =C2=B1  2%  perf-stat.i.node-loads
>    6167494           +16.9%    7211994        perf-stat.i.node-store-miss=
es
>     283794 =C2=B1  2%     +14.4%     324545        perf-stat.i.node-stores
>       8038 =C2=B1  3%     +13.5%       9124        perf-stat.i.page-faults
>       1.57           -11.5%       1.39 =C2=B1  2%  perf-stat.overall.MPKI
>      26.05            +8.8       34.89        perf-stat.overall.cache-mis=
s-rate%
>       1.05            +3.4%       1.09        perf-stat.overall.cpi
>       2570           -12.8%       2242        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.01            +0.0        0.01 =C2=B1  2%  perf-stat.overall.dTLB=
-load-miss-rate%
>       0.95            -3.3%       0.92        perf-stat.overall.ipc
>   34275742           +19.0%   40787855        perf-stat.ps.cache-misses
>  1.316e+08           -11.1%  1.169e+08 =C2=B1  2%  perf-stat.ps.cache-ref=
erences
>     934022           +13.6%    1061406        perf-stat.ps.context-switch=
es
>   8.81e+10            +3.8%  9.144e+10        perf-stat.ps.cpu-cycles
>       2496 =C2=B1  3%      +6.0%       2645        perf-stat.ps.cpu-migra=
tions
>    2259271           +11.0%    2507009 =C2=B1  2%  perf-stat.ps.dTLB-load=
-misses
>   47870473           +12.0%   53607656        perf-stat.ps.iTLB-loads
>       3.08 =C2=B1  4%     +15.8%       3.57 =C2=B1  3%  perf-stat.ps.majo=
r-faults
>       8022 =C2=B1  3%     +13.5%       9104        perf-stat.ps.minor-fau=
lts
>   15826812           +14.8%   18173409        perf-stat.ps.node-load-miss=
es
>    1049403           +20.4%    1263440 =C2=B1  2%  perf-stat.ps.node-loads
>    6157068           +16.9%    7197814        perf-stat.ps.node-store-mis=
ses
>     283328 =C2=B1  2%     +14.3%     323926        perf-stat.ps.node-stor=
es
>       8025 =C2=B1  3%     +13.5%       9108        perf-stat.ps.page-faul=
ts
>  5.279e+13           -12.8%  4.602e+13        perf-stat.total.instructions
>      57.66            -3.8       53.86        perf-profile.calltrace.cycl=
es-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>      57.60            -3.8       53.82        perf-profile.calltrace.cycl=
es-pp.mwait_idle_with_hints.intel_idle.cpuidle_enter_state.cpuidle_enter.cp=
uidle_idle_call
>       4.44            -2.7        1.69        perf-profile.calltrace.cycl=
es-pp.wake_up_q.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
>       4.32            -2.7        1.65        perf-profile.calltrace.cycl=
es-pp.try_to_wake_up.wake_up_q.futex_wake.do_futex.__x64_sys_futex
>       5.99            -2.6        3.40        perf-profile.calltrace.cycl=
es-pp.futex_wake.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>      62.68            -2.6       60.13        perf-profile.calltrace.cycl=
es-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary=
_startup_64_no_verify
>      61.03            -2.5       58.51        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secon=
dary
>      61.32            -2.5       58.83        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_start=
up_entry
>       5.89            -1.6        4.33        perf-profile.calltrace.cycl=
es-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       5.94            -1.6        4.38        perf-profile.calltrace.cycl=
es-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_sta=
rtup_64_no_verify
>       3.20 =C2=B1 10%      -1.1        2.09 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       3.17 =C2=B1 10%      -1.1        2.07 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.generic_file_write_iter.new_sync_write.vfs_write.ksys_write=
.do_syscall_64
>       2.82 =C2=B1 12%      -0.6        2.17 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__libc_write
>       2.52 =C2=B1 12%      -0.5        2.01 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.new_sync_=
write.vfs_write.ksys_write
>       2.44 =C2=B1 12%      -0.5        1.96 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.new_sync_write.vfs_write
>       1.37            -0.1        1.30 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_se=
condary
>       0.60            +0.1        0.67        perf-profile.calltrace.cycl=
es-pp.futex_wait_setup.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
>       2.60 =C2=B1  2%      +0.1        2.74 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch=
.__schedule.schedule_idle
>       0.58 =C2=B1  3%      +0.2        0.73 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.finish_task_switch.__schedule.schedule.futex_wait_queue.fut=
ex_wait
>       3.55            +0.2        3.74        perf-profile.calltrace.cycl=
es-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_tr=
ace_sched_wakeup_template.ttwu_do_wakeup
>       2.68 =C2=B1  2%      +0.2        2.88 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule_i=
dle.do_idle
>       0.35 =C2=B1 70%      +0.2        0.57        perf-profile.calltrace=
.cycles-pp.futex_wake_mark.futex_wake.do_futex.__x64_sys_futex.do_syscall_64
>       2.75 =C2=B1  2%      +0.2        2.98 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_switch.__schedule.schedule_idle.do_idle.cp=
u_startup_entry
>       0.52 =C2=B1  2%      +0.3        0.79 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.wake_up_q.futex_wake.do_=
futex
>       1.60 =C2=B1  2%      +0.4        1.97        perf-profile.calltrace=
.cycles-pp.__get_user_nocheck_8.perf_callchain_user.get_perf_callchain.perf=
_callchain.perf_prepare_sample
>       0.00            +0.5        0.53        perf-profile.calltrace.cycl=
es-pp.futex_q_lock.futex_wait_setup.futex_wait.do_futex.__x64_sys_futex
>       0.00            +0.5        0.53 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.perf_output_sample.perf_event_output_forward.__perf_event_overfl=
ow.perf_tp_event.perf_trace_sched_wakeup_template
>       0.00            +0.5        0.54 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.perf_output_sample.perf_event_output_forward.__perf_event_overfl=
ow.perf_tp_event.perf_trace_sched_stat_runtime
>       0.00            +0.6        0.56 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.__flush_smp_call_function_queue.flush_smp_call_function_queue.do=
_idle.cpu_startup_entry.start_secondary
>       3.12 =C2=B1  3%      +0.6        3.69 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.asm_exc_page_fault.__get_user_nocheck_8.perf_callchain_user=
.get_perf_callchain.perf_callchain
>       0.00            +0.6        0.57 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.update_sg_lb_stats.update_sd_lb_stats.find_busiest_group.load_ba=
lance.newidle_balance
>      19.55            +0.6       20.13        perf-profile.calltrace.cycl=
es-pp.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      19.63            +0.6       20.22        perf-profile.calltrace.cycl=
es-pp.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.00            +0.6        0.61 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_balan=
ce.pick_next_task_fair
>       0.00            +0.6        0.62 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_task_f=
air.__schedule
>       0.00            +0.7        0.69 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.sche=
dule
>       0.00            +0.8        0.77 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pen=
ding.flush_smp_call_function_queue
>       0.17 =C2=B1141%      +0.8        0.94 =C2=B1 29%  perf-profile.call=
trace.cycles-pp.perf_output_sample.perf_event_output_forward.__perf_event_o=
verflow.perf_tp_event.perf_trace_sched_switch
>       5.17 =C2=B1  5%      +0.8        6.01 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_eve=
nt.perf_trace_sched_stat_runtime.update_curr
>       4.05 =C2=B1  2%      +0.9        4.92        perf-profile.calltrace=
.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch.__sc=
hedule.schedule
>       0.00            +0.9        0.87 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.futex_wa=
it_queue
>      21.83            +0.9       22.71        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       4.11 =C2=B1  2%      +0.9        5.01        perf-profile.calltrace=
.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.futex_=
wait_queue
>       0.00            +0.9        0.90 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.pick_next_task_fair.__schedule.schedule.futex_wait_queue.futex_w=
ait
>       4.19 =C2=B1  2%      +0.9        5.10        perf-profile.calltrace=
.cycles-pp.perf_trace_sched_switch.__schedule.schedule.futex_wait_queue.fut=
ex_wait
>      22.02            +0.9       22.94        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe
>       0.00            +0.9        0.93        perf-profile.calltrace.cycl=
es-pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_=
function_queue.do_idle
>       4.36 =C2=B1  2%      +0.9        5.29 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_=
overflow.perf_tp_event.perf_trace_sched_stat_runtime
>       5.34            +0.9        6.27        perf-profile.calltrace.cycl=
es-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_overflow.p=
erf_tp_event.perf_trace_sched_switch
>       0.00            +1.0        0.95        perf-profile.calltrace.cycl=
es-pp.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_function_queue.do_=
idle.cpu_startup_entry
>       6.61            +1.0        7.61        perf-profile.calltrace.cycl=
es-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_event.perf_tr=
ace_sched_switch.__schedule
>       5.02 =C2=B1  2%      +1.0        6.04 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_r=
untime.update_curr.dequeue_entity
>       5.12 =C2=B1  2%      +1.0        6.15 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.deq=
ueue_entity.dequeue_task_fair
>       5.23 =C2=B1  2%      +1.0        6.26 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_stat_runtime.update_curr.dequeue_entity.de=
queue_task_fair.__schedule
>       5.53 =C2=B1  2%      +1.1        6.58        perf-profile.calltrace=
.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
>       6.12            +1.1        7.18        perf-profile.calltrace.cycl=
es-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.futex_wait_queue
>       6.24            +1.1        7.37        perf-profile.calltrace.cycl=
es-pp.dequeue_task_fair.__schedule.schedule.futex_wait_queue.futex_wait
>       3.28            +1.3        4.58        perf-profile.calltrace.cycl=
es-pp.__unwind_start.perf_callchain_kernel.get_perf_callchain.perf_callchai=
n.perf_prepare_sample
>       1.58 =C2=B1  3%      +1.5        3.03 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.unwind_next_frame.perf_callchain_kernel.get_perf_callchain.=
perf_callchain.perf_prepare_sample
>       2.41            +1.6        4.01        perf-profile.calltrace.cycl=
es-pp.unwind_next_frame.__unwind_start.perf_callchain_kernel.get_perf_callc=
hain.perf_callchain
>       7.79            +1.7        9.46        perf-profile.calltrace.cycl=
es-pp.perf_callchain_kernel.get_perf_callchain.perf_callchain.perf_prepare_=
sample.perf_event_output_forward
>       1.12 =C2=B1 52%      +1.7        2.84 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.mwait_idle_with_hints.intel_idle_irq.cpuidle_enter_state.cp=
uidle_enter.cpuidle_idle_call
>      11.80            +1.7       13.53        perf-profile.calltrace.cycl=
es-pp.get_perf_callchain.perf_callchain.perf_prepare_sample.perf_event_outp=
ut_forward.__perf_event_overflow
>      11.84            +1.8       13.60        perf-profile.calltrace.cycl=
es-pp.perf_callchain.perf_prepare_sample.perf_event_output_forward.__perf_e=
vent_overflow.perf_tp_event
>       1.60            +2.2        3.76        perf-profile.calltrace.cycl=
es-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_template.=
ttwu_do_wakeup.sched_ttwu_pending
>       1.67            +2.3        3.95        perf-profile.calltrace.cycl=
es-pp.perf_tp_event.perf_trace_sched_wakeup_template.ttwu_do_wakeup.sched_t=
twu_pending.flush_smp_call_function_queue
>       1.77 =C2=B1  2%      +2.3        4.12        perf-profile.calltrace=
.cycles-pp.perf_trace_sched_wakeup_template.ttwu_do_wakeup.sched_ttwu_pendi=
ng.flush_smp_call_function_queue.do_idle
>       1.83 =C2=B1  2%      +2.4        4.24        perf-profile.calltrace=
.cycles-pp.ttwu_do_wakeup.sched_ttwu_pending.flush_smp_call_function_queue.=
do_idle.cpu_startup_entry
>      12.38            +3.0       15.36        perf-profile.calltrace.cycl=
es-pp.__schedule.schedule.futex_wait_queue.futex_wait.do_futex
>      12.41            +3.0       15.41        perf-profile.calltrace.cycl=
es-pp.schedule.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex
>      12.54            +3.0       15.57        perf-profile.calltrace.cycl=
es-pp.futex_wait_queue.futex_wait.do_futex.__x64_sys_futex.do_syscall_64
>      13.52            +3.2       16.67        perf-profile.calltrace.cycl=
es-pp.futex_wait.do_futex.__x64_sys_futex.do_syscall_64.entry_SYSCALL_64_af=
ter_hwframe
>       2.63            +3.3        5.90        perf-profile.calltrace.cycl=
es-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_startup_=
entry.start_secondary
>       3.22            +3.7        6.88        perf-profile.calltrace.cycl=
es-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_seconda=
ry.secondary_startup_64_no_verify
>      57.76            -3.8       53.97        perf-profile.children.cycle=
s-pp.intel_idle
>       4.44            -2.7        1.69        perf-profile.children.cycle=
s-pp.wake_up_q
>       4.33            -2.7        1.66        perf-profile.children.cycle=
s-pp.try_to_wake_up
>       6.00            -2.6        3.41        perf-profile.children.cycle=
s-pp.futex_wake
>      63.21            -2.5       60.68        perf-profile.children.cycle=
s-pp.cpuidle_idle_call
>      61.53            -2.5       59.02        perf-profile.children.cycle=
s-pp.cpuidle_enter_state
>      61.55            -2.5       59.04        perf-profile.children.cycle=
s-pp.cpuidle_enter
>      59.70            -2.3       57.40        perf-profile.children.cycle=
s-pp.mwait_idle_with_hints
>       6.00            -1.6        4.43        perf-profile.children.cycle=
s-pp.schedule_idle
>       2.05 =C2=B1  2%      -1.2        0.87 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       1.50 =C2=B1 50%      -0.9        0.60 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       3.73 =C2=B1  5%      -0.9        2.84 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.ksys_write
>       2.98 =C2=B1 22%      -0.8        2.17        perf-profile.children.=
cycles-pp.asm_sysvec_apic_timer_interrupt
>       3.55 =C2=B1  5%      -0.8        2.76 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.vfs_write
>       3.27 =C2=B1  6%      -0.7        2.58 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__libc_write
>       3.33 =C2=B1  5%      -0.7        2.65 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>       3.29 =C2=B1  5%      -0.7        2.63 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.generic_file_write_iter
>       3.10 =C2=B1  5%      -0.6        2.53 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       3.00 =C2=B1  5%      -0.5        2.47 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       1.96 =C2=B1  4%      -0.5        1.46 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sysvec_apic_timer_interrupt
>       1.39 =C2=B1  3%      -0.3        1.07 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       1.37 =C2=B1  3%      -0.3        1.06 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       0.90 =C2=B1  3%      -0.2        0.72 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.shmem_write_begin
>       0.90 =C2=B1  3%      -0.2        0.73        perf-profile.children.=
cycles-pp.shmem_getpage_gfp
>       0.49 =C2=B1  8%      -0.1        0.35 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.fault_in_iov_iter_readable
>       0.48 =C2=B1  7%      -0.1        0.33 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.fault_in_readable
>       0.77 =C2=B1  2%      -0.1        0.62 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.65 =C2=B1  5%      -0.1        0.51        perf-profile.children.=
cycles-pp.ktime_get
>       0.31 =C2=B1  3%      -0.1        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__filemap_get_folio
>       0.45 =C2=B1  4%      -0.1        0.33 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       0.61 =C2=B1  2%      -0.1        0.49 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       0.77 =C2=B1  8%      -0.1        0.66 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.copy_page_from_iter_atomic
>       0.50 =C2=B1  2%      -0.1        0.40 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.49 =C2=B1  2%      -0.1        0.40 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.32 =C2=B1  7%      -0.1        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__irq_exit_rcu
>       0.28 =C2=B1  8%      -0.1        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>       0.12            -0.1        0.04 =C2=B1 71%  perf-profile.children.=
cycles-pp.check_preempt_curr
>       0.14 =C2=B1  3%      -0.1        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__fdget_pos
>       0.70 =C2=B1  8%      -0.1        0.62 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.copyin
>       2.62 =C2=B1  3%      -0.1        2.54 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.asm_exc_page_fault
>       0.69 =C2=B1  8%      -0.1        0.61 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.copy_user_enhanced_fast_string
>       0.39 =C2=B1  4%      -0.1        0.31        perf-profile.children.=
cycles-pp.set_next_entity
>       0.20 =C2=B1  7%      -0.1        0.13 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_call_function_single
>       0.60            -0.1        0.53 =C2=B1  2%  perf-profile.children.=
cycles-pp.perf_output_begin_forward
>       1.39            -0.1        1.32 =C2=B1  4%  perf-profile.children.=
cycles-pp.menu_select
>       0.36 =C2=B1  5%      -0.1        0.30 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.18 =C2=B1  7%      -0.1        0.12 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sysvec_call_function_single
>       0.17 =C2=B1  5%      -0.1        0.11 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__sysvec_call_function_single
>       0.12 =C2=B1  4%      -0.1        0.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.down_write
>       0.23 =C2=B1  6%      -0.1        0.17 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.folio_mark_accessed
>       0.14 =C2=B1  9%      -0.1        0.09 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.tick_nohz_irq_exit
>       0.10 =C2=B1  9%      -0.0        0.05        perf-profile.children.=
cycles-pp.folio_unlock
>       0.13 =C2=B1  3%      -0.0        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.switch_mm_irqs_off
>       0.16 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.tick_nohz_idle_exit
>       0.12 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.xas_load
>       1.01            -0.0        0.98        perf-profile.children.cycle=
s-pp.ttwu_do_activate
>       0.10 =C2=B1  4%      -0.0        0.07        perf-profile.children.=
cycles-pp.arch_scale_freq_tick
>       0.07 =C2=B1  7%      -0.0        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.perf_mux_hrtimer_handler
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.lapic_next_deadline
>       0.12 =C2=B1  6%      -0.0        0.09 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.workingset_activation
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.workingset_age_nonresident
>       0.13            -0.0        0.11 =C2=B1  4%  perf-profile.children.=
cycles-pp.rebalance_domains
>       0.13 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__might_resched
>       0.24            -0.0        0.22 =C2=B1  2%  perf-profile.children.=
cycles-pp.__update_load_avg_se
>       0.16 =C2=B1  7%      -0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.07 =C2=B1  6%      -0.0        0.06 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.push_and_clear_regs
>       0.07 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.memcpy
>       0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__futex_unqueue
>       0.07 =C2=B1  7%      +0.0        0.08        perf-profile.children.=
cycles-pp.tracing_gen_ctx_irq_test
>       0.06            +0.0        0.07 =C2=B1  6%  perf-profile.children.=
cycles-pp.__get_user_nocheck_4
>       0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.futex_hash
>       0.10            +0.0        0.12 =C2=B1 10%  perf-profile.children.=
cycles-pp.tick_nohz_idle_enter
>       0.10 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.perf_trace_buf_update
>       0.18 =C2=B1  2%      +0.0        0.21 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.15 =C2=B1  5%      +0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.get_stack_info
>       0.10 =C2=B1  4%      +0.0        0.13 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.get_callchain_entry
>       0.26 =C2=B1  4%      +0.0        0.28        perf-profile.children.=
cycles-pp.__switch_to
>       0.07 =C2=B1 11%      +0.0        0.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.send_call_function_single_ipi
>       0.14 =C2=B1 10%      +0.0        0.17 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.get_next_timer_interrupt
>       0.25            +0.0        0.28 =C2=B1  2%  perf-profile.children.=
cycles-pp.available_idle_cpu
>       0.19 =C2=B1  2%      +0.0        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.ftrace_graph_ret_addr
>       0.27            +0.0        0.30 =C2=B1  2%  perf-profile.children.=
cycles-pp.wake_affine
>       0.10 =C2=B1  4%      +0.0        0.13 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.get_futex_key
>       0.04 =C2=B1 71%      +0.0        0.07        perf-profile.children.=
cycles-pp.ex_handler_uaccess
>       0.24 =C2=B1  3%      +0.0        0.27 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__switch_to_asm
>       0.09            +0.0        0.13 =C2=B1  3%  perf-profile.children.=
cycles-pp.perf_output_end
>       0.10 =C2=B1  9%      +0.0        0.14        perf-profile.children.=
cycles-pp.perf_trace_buf_alloc
>       0.03 =C2=B1 70%      +0.0        0.07 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.perf_swevent_get_recursion_context
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.syscall_enter_from_user_mode
>       0.22 =C2=B1  6%      +0.0        0.26 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.core_kernel_text
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__cgroup_account_cputime
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.schedule_debug
>       0.34 =C2=B1  2%      +0.0        0.39        perf-profile.children.=
cycles-pp.select_task_rq_fair
>       0.52 =C2=B1  4%      +0.0        0.57        perf-profile.children.=
cycles-pp.futex_wake_mark
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.rb_erase
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.wake_q_add_safe
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.place_entity
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.perf_trace_sched_migrate_task
>       0.36 =C2=B1  2%      +0.1        0.41        perf-profile.children.=
cycles-pp.select_task_rq
>       0.30 =C2=B1  3%      +0.1        0.35 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.futex_unqueue
>       0.28 =C2=B1  6%      +0.1        0.33        perf-profile.children.=
cycles-pp.___perf_sw_event
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.cpumask_next_and
>       0.48            +0.1        0.54 =C2=B1  2%  perf-profile.children.=
cycles-pp.futex_q_lock
>       0.00            +0.1        0.06 =C2=B1 13%  perf-profile.children.=
cycles-pp.set_task_cpu
>       0.75            +0.1        0.81 =C2=B1  2%  perf-profile.children.=
cycles-pp.enqueue_entity
>       0.61            +0.1        0.67        perf-profile.children.cycle=
s-pp.futex_wait_setup
>       0.87            +0.1        0.94 =C2=B1  2%  perf-profile.children.=
cycles-pp.finish_task_switch
>       0.18 =C2=B1  7%      +0.1        0.25 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_cfs_group
>       0.72 =C2=B1  3%      +0.1        0.80 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.kernel_text_address
>       0.40 =C2=B1 12%      +0.1        0.51 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.native_sched_clock
>       0.86 =C2=B1  2%      +0.1        0.98 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__kernel_text_address
>       0.00            +0.1        0.11 =C2=B1  4%  perf-profile.children.=
cycles-pp.idle_cpu
>       0.23 =C2=B1  5%      +0.1        0.35 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.llist_reverse_order
>       0.47 =C2=B1 10%      +0.1        0.59 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       0.23 =C2=B1  2%      +0.1        0.37 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__smp_call_single_queue
>       0.23            +0.1        0.37 =C2=B1  2%  perf-profile.children.=
cycles-pp.llist_add_batch
>       1.00 =C2=B1  2%      +0.1        1.14 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.unwind_get_return_address
>       1.00            +0.2        1.15        perf-profile.children.cycle=
s-pp.orc_find
>       0.82 =C2=B1  2%      +0.2        0.99 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.stack_access_ok
>       1.18 =C2=B1  3%      +0.2        1.37 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.memcpy_erms
>       4.16 =C2=B1  2%      +0.2        4.36        perf-profile.children.=
cycles-pp.ttwu_do_wakeup
>       0.34 =C2=B1  4%      +0.2        0.57 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__flush_smp_call_function_queue
>       1.25 =C2=B1  2%      +0.2        1.49 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.perf_output_copy
>       4.00 =C2=B1  2%      +0.2        4.25        perf-profile.children.=
cycles-pp.perf_trace_sched_wakeup_template
>       0.52 =C2=B1  2%      +0.3        0.79 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ttwu_queue_wakelist
>       1.94 =C2=B1  3%      +0.3        2.27 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.perf_output_sample
>       1.91 =C2=B1  2%      +0.4        2.31 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__orc_find
>       0.14 =C2=B1  6%      +0.5        0.62 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_sg_lb_stats
>       0.16 =C2=B1  6%      +0.5        0.65 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_sd_lb_stats
>       0.17 =C2=B1  5%      +0.5        0.67 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.find_busiest_group
>       0.20 =C2=B1  7%      +0.5        0.75 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.load_balance
>      19.57            +0.6       20.14        perf-profile.children.cycle=
s-pp.do_futex
>      19.64            +0.6       20.23        perf-profile.children.cycle=
s-pp.__x64_sys_futex
>       0.26 =C2=B1  3%      +0.6        0.88 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.newidle_balance
>       1.61 =C2=B1 17%      +0.7        2.36 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.pick_next_task_fair
>       3.93            +0.8        4.77        perf-profile.children.cycle=
s-pp.__unwind_start
>       5.93            +1.0        6.90        perf-profile.children.cycle=
s-pp.perf_trace_sched_stat_runtime
>       6.13            +1.1        7.19        perf-profile.children.cycle=
s-pp.dequeue_entity
>       6.25            +1.1        7.37        perf-profile.children.cycle=
s-pp.dequeue_task_fair
>       6.98            +1.1        8.11        perf-profile.children.cycle=
s-pp.perf_trace_sched_switch
>       6.43            +1.2        7.59        perf-profile.children.cycle=
s-pp.update_curr
>       6.33 =C2=B1  2%      +1.3        7.63        perf-profile.children.=
cycles-pp.unwind_next_frame
>       8.27            +1.6        9.90        perf-profile.children.cycle=
s-pp.perf_callchain_kernel
>      12.49            +1.7       14.17        perf-profile.children.cycle=
s-pp.get_perf_callchain
>      12.54            +1.7       14.24        perf-profile.children.cycle=
s-pp.perf_callchain
>      13.28            +1.8       15.08        perf-profile.children.cycle=
s-pp.perf_prepare_sample
>      19.40            +1.8       21.22        perf-profile.children.cycle=
s-pp.__schedule
>      16.01            +2.1       18.14        perf-profile.children.cycle=
s-pp.perf_event_output_forward
>      16.07            +2.1       18.21        perf-profile.children.cycle=
s-pp.__perf_event_overflow
>      16.49            +2.3       18.76        perf-profile.children.cycle=
s-pp.perf_tp_event
>      12.55            +3.0       15.57        perf-profile.children.cycle=
s-pp.futex_wait_queue
>      13.53            +3.2       16.68        perf-profile.children.cycle=
s-pp.futex_wait
>       2.81            +3.3        6.06        perf-profile.children.cycle=
s-pp.sched_ttwu_pending
>      13.47 =C2=B1  2%      +3.4       16.90        perf-profile.children.=
cycles-pp.schedule
>       3.26            +3.7        6.96        perf-profile.children.cycle=
s-pp.flush_smp_call_function_queue
>      59.09            -2.0       57.10        perf-profile.self.cycles-pp=
.mwait_idle_with_hints
>       0.42 =C2=B1  8%      -0.1        0.28 =C2=B1  7%  perf-profile.self=
.cycles-pp.fault_in_readable
>       0.52 =C2=B1  7%      -0.1        0.38 =C2=B1  2%  perf-profile.self=
.cycles-pp.ktime_get
>       1.97 =C2=B1  2%      -0.1        1.88 =C2=B1  2%  perf-profile.self=
.cycles-pp.__get_user_nocheck_8
>       0.17 =C2=B1  9%      -0.1        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.set_next_entity
>       0.43 =C2=B1  4%      -0.1        0.35        perf-profile.self.cycl=
es-pp.try_to_wake_up
>       0.22 =C2=B1  2%      -0.1        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.68 =C2=B1  8%      -0.1        0.61 =C2=B1  3%  perf-profile.self=
.cycles-pp.copy_user_enhanced_fast_string
>       0.70            -0.1        0.63 =C2=B1  3%  perf-profile.self.cycl=
es-pp.menu_select
>       0.59            -0.1        0.52        perf-profile.self.cycles-pp=
.perf_output_begin_forward
>       0.16 =C2=B1  2%      -0.1        0.10        perf-profile.self.cycl=
es-pp.__filemap_get_folio
>       0.09 =C2=B1  5%      -0.0        0.05        perf-profile.self.cycl=
es-pp.folio_unlock
>       0.12 =C2=B1  3%      -0.0        0.08 =C2=B1 14%  perf-profile.self=
.cycles-pp.switch_mm_irqs_off
>       0.10 =C2=B1  4%      -0.0        0.07        perf-profile.self.cycl=
es-pp.arch_scale_freq_tick
>       0.10 =C2=B1  4%      -0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.xas_load
>       0.09 =C2=B1  5%      -0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.lapic_next_deadline
>       0.15 =C2=B1  5%      -0.0        0.12 =C2=B1 10%  perf-profile.self=
.cycles-pp.dequeue_entity
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.workingset_age_nonresident
>       0.19 =C2=B1  6%      -0.0        0.17        perf-profile.self.cycl=
es-pp.prepare_task_switch
>       0.16 =C2=B1  7%      -0.0        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.reweight_entity
>       0.23 =C2=B1  4%      -0.0        0.21 =C2=B1  2%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.12 =C2=B1  6%      -0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.__might_resched
>       0.06 =C2=B1  7%      -0.0        0.05        perf-profile.self.cycl=
es-pp.folio_mark_accessed
>       0.05 =C2=B1  8%      +0.0        0.07 =C2=B1  7%  perf-profile.self=
.cycles-pp.get_stack_info_noinstr
>       0.09 =C2=B1  5%      +0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.cpuidle_idle_call
>       0.08 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.futex_wait_queue
>       0.06 =C2=B1  7%      +0.0        0.08        perf-profile.self.cycl=
es-pp.tracing_gen_ctx_irq_test
>       0.11 =C2=B1  7%      +0.0        0.13 =C2=B1  6%  perf-profile.self=
.cycles-pp.kvm_guest_state
>       0.12 =C2=B1  4%      +0.0        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.__kernel_text_address
>       0.09 =C2=B1 10%      +0.0        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.perf_trace_sched_wakeup_template
>       0.15 =C2=B1  5%      +0.0        0.18 =C2=B1  9%  perf-profile.self=
.cycles-pp.core_kernel_text
>       0.10 =C2=B1  9%      +0.0        0.13 =C2=B1  6%  perf-profile.self=
.cycles-pp.perf_trace_sched_switch
>       0.20 =C2=B1  4%      +0.0        0.23 =C2=B1  2%  perf-profile.self=
.cycles-pp.get_perf_callchain
>       0.09            +0.0        0.12 =C2=B1 11%  perf-profile.self.cycl=
es-pp.get_futex_key
>       0.07 =C2=B1 11%      +0.0        0.10 =C2=B1  8%  perf-profile.self=
.cycles-pp.send_call_function_single_ipi
>       0.25            +0.0        0.28        perf-profile.self.cycles-pp=
.available_idle_cpu
>       0.10 =C2=B1  4%      +0.0        0.13 =C2=B1  9%  perf-profile.self=
.cycles-pp.get_callchain_entry
>       0.25 =C2=B1  5%      +0.0        0.28        perf-profile.self.cycl=
es-pp.__switch_to
>       0.24 =C2=B1  3%      +0.0        0.27 =C2=B1  3%  perf-profile.self=
.cycles-pp.__switch_to_asm
>       0.16 =C2=B1  2%      +0.0        0.19 =C2=B1  2%  perf-profile.self=
.cycles-pp.ftrace_graph_ret_addr
>       0.08            +0.0        0.11 =C2=B1  4%  perf-profile.self.cycl=
es-pp.perf_output_end
>       0.12 =C2=B1  4%      +0.0        0.15 =C2=B1  5%  perf-profile.self=
.cycles-pp.perf_event_output_forward
>       0.16 =C2=B1 13%      +0.0        0.19 =C2=B1  8%  perf-profile.self=
.cycles-pp.perf_prepare_sample
>       0.22 =C2=B1  4%      +0.0        0.26 =C2=B1  3%  perf-profile.self=
.cycles-pp.kernel_text_address
>       0.14 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.unwind_get_return_address
>       0.11 =C2=B1  7%      +0.0        0.15 =C2=B1  3%  perf-profile.self=
.cycles-pp.newidle_balance
>       0.03 =C2=B1 70%      +0.0        0.07 =C2=B1 11%  perf-profile.self=
.cycles-pp.perf_swevent_get_recursion_context
>       0.42 =C2=B1  4%      +0.0        0.46        perf-profile.self.cycl=
es-pp.futex_wake_mark
>       0.02 =C2=B1141%      +0.0        0.06        perf-profile.self.cycl=
es-pp.perf_callchain
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.schedule_debug
>       0.40 =C2=B1  2%      +0.0        0.45        perf-profile.self.cycl=
es-pp.futex_q_lock
>       0.35 =C2=B1  4%      +0.0        0.40        perf-profile.self.cycl=
es-pp.perf_output_sample
>       0.26 =C2=B1  6%      +0.0        0.31 =C2=B1  3%  perf-profile.self=
.cycles-pp.___perf_sw_event
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.schedule_idle
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.memcpy
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.rb_erase
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.wake_q_add_safe
>       0.29            +0.1        0.35        perf-profile.self.cycles-pp=
.futex_unqueue
>       0.35            +0.1        0.40        perf-profile.self.cycles-pp=
.__unwind_start
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1 12%  perf-profile.self=
.cycles-pp.ttwu_do_wakeup
>       0.11            +0.1        0.17 =C2=B1  2%  perf-profile.self.cycl=
es-pp.dequeue_task_fair
>       0.33 =C2=B1 10%      +0.1        0.41 =C2=B1  7%  perf-profile.self=
.cycles-pp.update_rq_clock
>       0.17 =C2=B1  7%      +0.1        0.25 =C2=B1  3%  perf-profile.self=
.cycles-pp.update_cfs_group
>       0.11 =C2=B1 42%      +0.1        0.19 =C2=B1 12%  perf-profile.self=
.cycles-pp.pick_next_task_fair
>       0.42            +0.1        0.50 =C2=B1  4%  perf-profile.self.cycl=
es-pp.perf_output_copy
>       0.21 =C2=B1  6%      +0.1        0.30 =C2=B1  2%  perf-profile.self=
.cycles-pp.ttwu_queue_wakelist
>       0.30 =C2=B1  5%      +0.1        0.40 =C2=B1  3%  perf-profile.self=
.cycles-pp.perf_tp_event
>       0.39 =C2=B1 12%      +0.1        0.49 =C2=B1  5%  perf-profile.self=
.cycles-pp.native_sched_clock
>       0.12 =C2=B1  4%      +0.1        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.__flush_smp_call_function_queue
>       0.53            +0.1        0.64        perf-profile.self.cycles-pp=
.perf_callchain_kernel
>       0.00            +0.1        0.11        perf-profile.self.cycles-pp=
.idle_cpu
>       0.23 =C2=B1  5%      +0.1        0.35 =C2=B1  5%  perf-profile.self=
.cycles-pp.llist_reverse_order
>       0.23            +0.1        0.36        perf-profile.self.cycles-pp=
.llist_add_batch
>       0.26 =C2=B1  3%      +0.1        0.39        perf-profile.self.cycl=
es-pp.flush_smp_call_function_queue
>       0.97            +0.2        1.13        perf-profile.self.cycles-pp=
.orc_find
>       0.77            +0.2        0.93 =C2=B1  3%  perf-profile.self.cycl=
es-pp.stack_access_ok
>       0.58            +0.2        0.75 =C2=B1  4%  perf-profile.self.cycl=
es-pp.finish_task_switch
>       1.14 =C2=B1  3%      +0.2        1.32 =C2=B1  3%  perf-profile.self=
.cycles-pp.memcpy_erms
>       0.59 =C2=B1 14%      +0.2        0.83 =C2=B1  3%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.10 =C2=B1 12%      +0.4        0.46 =C2=B1  3%  perf-profile.self=
.cycles-pp.update_sg_lb_stats
>       1.90            +0.4        2.29 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__orc_find
>       2.45 =C2=B1  2%      +0.6        3.02        perf-profile.self.cycl=
es-pp.unwind_next_frame
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10G=
Hz (Cascade Lake) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/tbox_group/test/testcase/ucode:
>   gcc-11/performance/x86_64-rhel-8.3/debian-x86_64-phoronix/lkp-csl-2sp7/=
network-loopback-1.0.3/phoronix-test-suite/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>      16.62            -4.0%      15.96        phoronix-test-suite.network=
-loopback.0.seconds
>     257.50           -44.6%     142.66 =C2=B1 12%  phoronix-test-suite.ti=
me.elapsed_time
>     257.50           -44.6%     142.66 =C2=B1 12%  phoronix-test-suite.ti=
me.elapsed_time.max
>  2.416e+10           -44.5%  1.341e+10 =C2=B1 11%  cpuidle..time
>   69072197 =C2=B1  6%     -45.1%   37927610 =C2=B1 10%  cpuidle..usage
>      12859 =C2=B1  3%     -27.6%       9306 =C2=B1  4%  meminfo.Active(an=
on)
>     240506 =C2=B1  2%     -23.3%     184578 =C2=B1  6%  meminfo.AnonHugeP=
ages
>       0.02 =C2=B1 10%      +0.0        0.03 =C2=B1 11%  mpstat.cpu.all.io=
wait%
>       0.08            +0.0        0.13 =C2=B1  9%  mpstat.cpu.all.usr%
>     294.78           -39.0%     179.83 =C2=B1  9%  uptime.boot
>      27082           -40.0%      16248 =C2=B1  9%  uptime.idle
>     315.67 =C2=B1  3%     +81.4%     572.67 =C2=B1 11%  vmstat.io.bi
>     126660            -4.6%     120820 =C2=B1  2%  vmstat.system.cs
>   19471364 =C2=B1  7%     -77.5%    4385945 =C2=B1127%  numa-numastat.nod=
e0.local_node
>   19500618 =C2=B1  7%     -77.5%    4380454 =C2=B1126%  numa-numastat.nod=
e0.numa_hit
>    1747890 =C2=B1 84%    +337.6%    7648321 =C2=B1 51%  numa-numastat.nod=
e1.local_node
>    1787232 =C2=B1 82%    +332.5%    7728969 =C2=B1 51%  numa-numastat.nod=
e1.numa_hit
>     131233 =C2=B1 31%     -55.9%      57933 =C2=B1 23%  numa-meminfo.node=
0.AnonHugePages
>     231606 =C2=B1 17%     -34.6%     151585 =C2=B1 19%  numa-meminfo.node=
0.AnonPages
>     271028 =C2=B1 19%     -32.2%     183720 =C2=B1 28%  numa-meminfo.node=
0.AnonPages.max
>     161713 =C2=B1 23%     +42.7%     230778 =C2=B1 12%  numa-meminfo.node=
1.AnonPages
>     178985 =C2=B1 25%     +40.1%     250792 =C2=B1  7%  numa-meminfo.node=
1.AnonPages.max
>      57916 =C2=B1 17%     -34.6%      37900 =C2=B1 19%  numa-vmstat.node0=
.nr_anon_pages
>   19500583 =C2=B1  7%     -77.5%    4380593 =C2=B1126%  numa-vmstat.node0=
.numa_hit
>   19471328 =C2=B1  7%     -77.5%    4386083 =C2=B1127%  numa-vmstat.node0=
.numa_local
>      40428 =C2=B1 23%     +42.7%      57694 =C2=B1 12%  numa-vmstat.node1=
.nr_anon_pages
>    1787356 =C2=B1 82%    +332.4%    7729083 =C2=B1 51%  numa-vmstat.node1=
.numa_hit
>    1748013 =C2=B1 84%    +337.6%    7648436 =C2=B1 51%  numa-vmstat.node1=
.numa_local
>       1584 =C2=B1  2%      -5.7%       1493 =C2=B1  6%  turbostat.Bzy_MHz
>    2554121           -71.9%     718844 =C2=B1 18%  turbostat.C1
>       0.17 =C2=B1  2%      -0.0        0.13 =C2=B1  3%  turbostat.C1%
>   45206188 =C2=B1 14%     -55.3%   20218059 =C2=B1 17%  turbostat.C1E
>      83.37 =C2=B1 20%     -27.5       55.86 =C2=B1 57%  turbostat.C1E%
>      13.18 =C2=B1131%     +27.1       40.25 =C2=B1 78%  turbostat.C6%
>       0.23 =C2=B1  4%   +2995.6%       7.02 =C2=B1132%  turbostat.CPU%c6
>   50124215           -44.2%   27993278 =C2=B1 12%  turbostat.IRQ
>   13279782           -42.3%    7668314 =C2=B1 15%  turbostat.POLL
>       0.10            -0.0        0.09        turbostat.POLL%
>       3215 =C2=B1  3%     -27.6%       2326 =C2=B1  4%  proc-vmstat.nr_ac=
tive_anon
>      28604            -1.2%      28267        proc-vmstat.nr_active_file
>      98325            -2.8%      95547        proc-vmstat.nr_anon_pages
>     286080            -1.7%     281098        proc-vmstat.nr_inactive_anon
>      19789            -2.7%      19258        proc-vmstat.nr_mapped
>     189812            -1.7%     186656        proc-vmstat.nr_shmem
>      26685            -1.3%      26337        proc-vmstat.nr_slab_reclaim=
able
>       3215 =C2=B1  3%     -27.6%       2326 =C2=B1  4%  proc-vmstat.nr_zo=
ne_active_anon
>      28604            -1.2%      28267        proc-vmstat.nr_zone_active_=
file
>     286080            -1.7%     281098        proc-vmstat.nr_zone_inactiv=
e_anon
>   21294231           -43.1%   12120438 =C2=B1 12%  proc-vmstat.numa_hit
>   21225633           -43.3%   12045280 =C2=B1 13%  proc-vmstat.numa_local
>     220406 =C2=B1 11%     -68.9%      68568 =C2=B1 20%  proc-vmstat.pgact=
ivate
>   21298959           -43.2%   12090303 =C2=B1 12%  proc-vmstat.pgalloc_no=
rmal
>    1299835           -33.1%     870119 =C2=B1  7%  proc-vmstat.pgfault
>   21317767           -43.2%   12105226 =C2=B1 12%  proc-vmstat.pgfree
>      83610            -1.6%      82280        proc-vmstat.pgpgin
>     199554           -36.4%     126882 =C2=B1  9%  proc-vmstat.pgreuse
>  6.202e+08 =C2=B1  2%      +3.5%  6.421e+08 =C2=B1  2%  perf-stat.i.branc=
h-instructions
>       1.44            +2.0        3.42 =C2=B1 72%  perf-stat.i.branch-mis=
s-rate%
>    8062402 =C2=B1  2%     +72.2%   13884816 =C2=B1 35%  perf-stat.i.branc=
h-misses
>    1120545 =C2=B1 52%     +53.3%    1717713 =C2=B1 40%  perf-stat.i.cache=
-misses
>     128576            -3.6%     123896 =C2=B1  2%  perf-stat.i.context-sw=
itches
>       8377 =C2=B1 37%     -32.2%       5681 =C2=B1 51%  perf-stat.i.cycle=
s-between-cache-misses
>    1617993 =C2=B1  4%     -14.2%    1387738 =C2=B1 18%  perf-stat.i.iTLB-=
loads
>  2.943e+09 =C2=B1  2%      +3.8%  3.057e+09 =C2=B1  2%  perf-stat.i.instr=
uctions
>     991.55 =C2=B1  4%     +11.5%       1105 =C2=B1  4%  perf-stat.i.instr=
uctions-per-iTLB-miss
>       6.46           +81.9%      11.75 =C2=B1 11%  perf-stat.i.major-faul=
ts
>   19711101            +2.9%   20273506        perf-stat.i.metric.M/sec
>       4158            +9.7%       4561 =C2=B1  3%  perf-stat.i.minor-faul=
ts
>      85.06            -3.3       81.75 =C2=B1  3%  perf-stat.i.node-load-=
miss-rate%
>      76.16 =C2=B1  6%     -13.1       63.06 =C2=B1 14%  perf-stat.i.node-=
store-miss-rate%
>      20757 =C2=B1 13%     +55.6%      32292 =C2=B1  9%  perf-stat.i.node-=
stores
>       4165            +9.8%       4573 =C2=B1  3%  perf-stat.i.page-faults
>       1.30            +0.9        2.18 =C2=B1 37%  perf-stat.overall.bran=
ch-miss-rate%
>     940.63 =C2=B1  2%      +7.2%       1008        perf-stat.overall.inst=
ructions-per-iTLB-miss
>      67.42 =C2=B1  7%     -11.3       56.09 =C2=B1 10%  perf-stat.overall=
.node-store-miss-rate%
>  6.174e+08 =C2=B1  2%      +3.2%  6.372e+08 =C2=B1  2%  perf-stat.ps.bran=
ch-instructions
>    8028848 =C2=B1  2%     +71.7%   13789394 =C2=B1 35%  perf-stat.ps.bran=
ch-misses
>    1116342 =C2=B1 52%     +52.9%    1706363 =C2=B1 40%  perf-stat.ps.cach=
e-misses
>     127937            -4.0%     122881 =C2=B1  2%  perf-stat.ps.context-s=
witches
>    1611540 =C2=B1  4%     -14.5%    1377511 =C2=B1 18%  perf-stat.ps.iTLB=
-loads
>   2.93e+09 =C2=B1  2%      +3.5%  3.033e+09 =C2=B1  2%  perf-stat.ps.inst=
ructions
>       6.46           +81.3%      11.71 =C2=B1 11%  perf-stat.ps.major-fau=
lts
>       4143            +9.3%       4530 =C2=B1  2%  perf-stat.ps.minor-fau=
lts
>      20689 =C2=B1 13%     +55.1%      32093 =C2=B1  9%  perf-stat.ps.node=
-stores
>       4149            +9.5%       4542 =C2=B1  2%  perf-stat.ps.page-faul=
ts
>  7.576e+11 =C2=B1  2%     -42.6%  4.349e+11 =C2=B1 10%  perf-stat.total.i=
nstructions
>       0.07 =C2=B1 16%     +43.9%       0.10 =C2=B1 21%  sched_debug.cfs_r=
q:/.h_nr_running.avg
>       0.25 =C2=B1  7%     +19.8%       0.30 =C2=B1 10%  sched_debug.cfs_r=
q:/.h_nr_running.stddev
>      26120 =C2=B1 13%     +69.5%      44283 =C2=B1 32%  sched_debug.cfs_r=
q:/.load.avg
>      94829 =C2=B1  2%     +33.1%     126191 =C2=B1 22%  sched_debug.cfs_r=
q:/.load.stddev
>       0.07 =C2=B1 16%     +36.4%       0.10 =C2=B1 14%  sched_debug.cfs_r=
q:/.nr_running.avg
>       0.25 =C2=B1  7%     +15.8%       0.29 =C2=B1  6%  sched_debug.cfs_r=
q:/.nr_running.stddev
>      58.88 =C2=B1  4%     +59.3%      93.83 =C2=B1  5%  sched_debug.cfs_r=
q:/.runnable_avg.avg
>     705.20           +28.3%     904.78 =C2=B1  6%  sched_debug.cfs_rq:/.r=
unnable_avg.max
>     141.70 =C2=B1  5%     +36.5%     193.46 =C2=B1  5%  sched_debug.cfs_r=
q:/.runnable_avg.stddev
>     -26228           +57.1%     -41218        sched_debug.cfs_rq:/.spread=
0.min
>      58.63 =C2=B1  4%     +59.3%      93.41 =C2=B1  5%  sched_debug.cfs_r=
q:/.util_avg.avg
>     705.20           +28.3%     904.78 =C2=B1  6%  sched_debug.cfs_rq:/.u=
til_avg.max
>     141.31 =C2=B1  4%     +36.7%     193.16 =C2=B1  5%  sched_debug.cfs_r=
q:/.util_avg.stddev
>      12.70 =C2=B1 20%    +128.9%      29.08 =C2=B1 21%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     409.07           +88.9%     772.56 =C2=B1 14%  sched_debug.cfs_rq:/.u=
til_est_enqueued.max
>      59.68 =C2=B1  6%    +104.5%     122.06 =C2=B1 15%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>     138313 =C2=B1  2%     +29.7%     179349 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.stddev
>     155388           -38.7%      95265        sched_debug.cpu.clock.avg
>     155393           -38.7%      95270        sched_debug.cpu.clock.max
>     155378           -38.7%      95255        sched_debug.cpu.clock.min
>     153326           -38.7%      94016        sched_debug.cpu.clock_task.=
avg
>     153748           -38.7%      94249        sched_debug.cpu.clock_task.=
max
>     151982           -38.6%      93253        sched_debug.cpu.clock_task.=
min
>     311.48 =C2=B1 13%     -37.2%     195.68 =C2=B1 14%  sched_debug.cpu.c=
lock_task.stddev
>     143.26 =C2=B1 13%     +24.6%     178.58 =C2=B1 12%  sched_debug.cpu.c=
urr->pid.avg
>       6633           -25.7%       4928        sched_debug.cpu.curr->pid.m=
ax
>       0.04 =C2=B1 12%     +37.3%       0.05 =C2=B1 15%  sched_debug.cpu.n=
r_running.avg
>       0.18 =C2=B1  4%     +17.5%       0.21 =C2=B1 10%  sched_debug.cpu.n=
r_running.stddev
>     152682           -50.6%      75420 =C2=B1  2%  sched_debug.cpu.nr_swi=
tches.avg
>    3344698 =C2=B1 30%     -39.0%    2041758 =C2=B1 14%  sched_debug.cpu.n=
r_switches.max
>     504254 =C2=B1 19%     -42.5%     289838 =C2=B1  5%  sched_debug.cpu.n=
r_switches.stddev
>     155378           -38.7%      95255        sched_debug.cpu_clk
>     154806           -38.8%      94683        sched_debug.ktime
>     156324           -38.5%      96106        sched_debug.sched_clk
>      35.78 =C2=B1  8%     -20.7       15.05 =C2=B1 45%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>      35.62 =C2=B1  8%     -20.7       14.96 =C2=B1 45%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      16.01 =C2=B1 11%      -9.7        6.29 =C2=B1 46%  perf-profile.call=
trace.cycles-pp.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      16.10 =C2=B1  2%      -9.7        6.40 =C2=B1 45%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>      15.92 =C2=B1 11%      -9.7        6.26 =C2=B1 46%  perf-profile.call=
trace.cycles-pp.vfs_read.ksys_read.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
>      15.59 =C2=B1  3%      -9.1        6.52 =C2=B1 45%  perf-profile.call=
trace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      14.67 =C2=B1 12%      -9.1        5.61 =C2=B1 46%  perf-profile.call=
trace.cycles-pp.new_sync_read.vfs_read.ksys_read.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>      15.44 =C2=B1  3%      -9.0        6.48 =C2=B1 45%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>      11.80 =C2=B1 10%      -8.1        3.67 =C2=B1 49%  perf-profile.call=
trace.cycles-pp.pipe_read.new_sync_read.vfs_read.ksys_read.do_syscall_64
>       9.01 =C2=B1  8%      -7.4        1.60 =C2=B1 82%  perf-profile.call=
trace.cycles-pp.perf_callchain.perf_prepare_sample.perf_event_output_forwar=
d.__perf_event_overflow.perf_tp_event
>       8.97 =C2=B1  8%      -7.4        1.60 =C2=B1 82%  perf-profile.call=
trace.cycles-pp.get_perf_callchain.perf_callchain.perf_prepare_sample.perf_=
event_output_forward.__perf_event_overflow
>      10.65            -6.4        4.28 =C2=B1 45%  perf-profile.calltrace=
.cycles-pp.pipe_write.new_sync_write.vfs_write.ksys_write.do_syscall_64
>       7.69 =C2=B1 10%      -6.2        1.48 =C2=B1 50%  perf-profile.call=
trace.cycles-pp.__wake_up_common_lock.pipe_read.new_sync_read.vfs_read.ksys=
_read
>       7.61 =C2=B1 10%      -6.2        1.45 =C2=B1 49%  perf-profile.call=
trace.cycles-pp.__wake_up_common.__wake_up_common_lock.pipe_read.new_sync_r=
ead.vfs_read
>       7.52 =C2=B1 10%      -6.1        1.43 =C2=B1 49%  perf-profile.call=
trace.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_=
lock.pipe_read.new_sync_read
>       7.41 =C2=B1 10%      -6.0        1.42 =C2=B1 48%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__=
wake_up_common_lock.pipe_read
>       7.04 =C2=B1  5%      -5.7        1.30 =C2=B1 51%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       7.02 =C2=B1  5%      -5.7        1.29 =C2=B1 51%  perf-profile.call=
trace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_se=
condary
>       5.47 =C2=B1  2%      -4.7        0.76 =C2=B1141%  perf-profile.call=
trace.cycles-pp.perf_callchain_kernel.get_perf_callchain.perf_callchain.per=
f_prepare_sample.perf_event_output_forward
>       6.97            -4.6        2.38 =C2=B1 48%  perf-profile.calltrace=
.cycles-pp.schedule.pipe_write.new_sync_write.vfs_write.ksys_write
>       6.95            -4.6        2.37 =C2=B1 48%  perf-profile.calltrace=
.cycles-pp.__schedule.schedule.pipe_write.new_sync_write.vfs_write
>       4.80 =C2=B1  5%      -3.4        1.38 =C2=B1 76%  perf-profile.call=
trace.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_eve=
nt.perf_trace_sched_switch.__schedule
>       4.04 =C2=B1  5%      -3.1        0.96 =C2=B1 88%  perf-profile.call=
trace.cycles-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_=
overflow.perf_tp_event.perf_trace_sched_switch
>       4.05 =C2=B1  2%      -2.8        1.28 =C2=B1 60%  perf-profile.call=
trace.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.sch=
edule
>       3.81 =C2=B1  2%      -2.8        1.06 =C2=B1 85%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_stat_runtime.update_curr.dequeue_entity.de=
queue_task_fair.__schedule
>       3.71 =C2=B1  2%      -2.7        1.04 =C2=B1 85%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.deq=
ueue_entity.dequeue_task_fair
>       3.62 =C2=B1  2%      -2.6        1.01 =C2=B1 86%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_r=
untime.update_curr.dequeue_entity
>       3.61 =C2=B1  2%      -2.6        1.01 =C2=B1 85%  perf-profile.call=
trace.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_eve=
nt.perf_trace_sched_stat_runtime.update_curr
>       4.62 =C2=B1 11%      -2.5        2.10 =C2=B1 43%  perf-profile.call=
trace.cycles-pp.sock_write_iter.new_sync_write.vfs_write.ksys_write.do_sysc=
all_64
>       4.57 =C2=B1 12%      -2.5        2.07 =C2=B1 43%  perf-profile.call=
trace.cycles-pp.sock_sendmsg.sock_write_iter.new_sync_write.vfs_write.ksys_=
write
>       4.48 =C2=B1 12%      -2.4        2.03 =C2=B1 43%  perf-profile.call=
trace.cycles-pp.tcp_sendmsg.sock_sendmsg.sock_write_iter.new_sync_write.vfs=
_write
>       3.60            -2.4        1.20 =C2=B1 48%  perf-profile.calltrace=
.cycles-pp.dequeue_task_fair.__schedule.schedule.pipe_write.new_sync_write
>       3.87 =C2=B1 11%      -2.3        1.55 =C2=B1 45%  perf-profile.call=
trace.cycles-pp.tcp_sendmsg_locked.tcp_sendmsg.sock_sendmsg.sock_write_iter=
.new_sync_write
>       3.49            -2.3        1.18 =C2=B1 48%  perf-profile.calltrace=
.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.pipe_write
>       3.01 =C2=B1 10%      -2.3        0.73 =C2=B1 78%  perf-profile.call=
trace.cycles-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_=
overflow.perf_tp_event.perf_trace_sched_stat_runtime
>       3.00 =C2=B1  7%      -2.2        0.81 =C2=B1 76%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch=
.__schedule.schedule
>       2.59 =C2=B1 14%      -2.0        0.62 =C2=B1 73%  perf-profile.call=
trace.cycles-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.__ip_queu=
e_xmit.__tcp_transmit_skb
>       2.58 =C2=B1 13%      -2.0        0.62 =C2=B1 72%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.i=
p_finish_output2.__ip_queue_xmit
>       2.52 =C2=B1 14%      -1.9        0.59 =C2=B1 72%  perf-profile.call=
trace.cycles-pp.net_rx_action.__softirqentry_text_start.do_softirq.__local_=
bh_enable_ip.ip_finish_output2
>       3.69 =C2=B1 16%      -1.9        1.84 =C2=B1 48%  perf-profile.call=
trace.cycles-pp.__x64_sys_select.do_syscall_64.entry_SYSCALL_64_after_hwfra=
me
>       3.67 =C2=B1 16%      -1.9        1.82 =C2=B1 48%  perf-profile.call=
trace.cycles-pp.kern_select.__x64_sys_select.do_syscall_64.entry_SYSCALL_64=
_after_hwframe
>       2.63 =C2=B1  4%      -1.8        0.84 =C2=B1 76%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_switch.__schedule.schedule.pipe_write.new_=
sync_write
>       2.58 =C2=B1  4%      -1.8        0.83 =C2=B1 76%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.p=
ipe_write
>       2.35 =C2=B1  2%      -1.7        0.61 =C2=B1 79%  perf-profile.call=
trace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_ca=
ll.do_idle
>       3.37 =C2=B1 16%      -1.7        1.68 =C2=B1 48%  perf-profile.call=
trace.cycles-pp.core_sys_select.kern_select.__x64_sys_select.do_syscall_64.=
entry_SYSCALL_64_after_hwframe
>       2.23 =C2=B1 14%      -1.7        0.58 =C2=B1 72%  perf-profile.call=
trace.cycles-pp.__napi_poll.net_rx_action.__softirqentry_text_start.do_soft=
irq.__local_bh_enable_ip
>       2.22 =C2=B1 14%      -1.7        0.57 =C2=B1 73%  perf-profile.call=
trace.cycles-pp.process_backlog.__napi_poll.net_rx_action.__softirqentry_te=
xt_start.do_softirq
>       2.17 =C2=B1 14%      -1.6        0.55 =C2=B1 73%  perf-profile.call=
trace.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.ne=
t_rx_action.__softirqentry_text_start
>       2.10 =C2=B1 14%      -1.6        0.51 =C2=B1 73%  perf-profile.call=
trace.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.proces=
s_backlog.__napi_poll.net_rx_action
>       2.04 =C2=B1 14%      -1.6        0.48 =C2=B1 74%  perf-profile.call=
trace.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_rec=
eive_skb_one_core.process_backlog.__napi_poll
>       2.03 =C2=B1 13%      -1.6        0.48 =C2=B1 74%  perf-profile.call=
trace.cycles-pp.tcp_v4_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.=
__netif_receive_skb_one_core.process_backlog
>       2.85 =C2=B1 17%      -1.5        1.33 =C2=B1 48%  perf-profile.call=
trace.cycles-pp.do_select.core_sys_select.kern_select.__x64_sys_select.do_s=
yscall_64
>       1.96 =C2=B1  4%      -1.3        0.64 =C2=B1 75%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_switch.__schedule.schedule_idle.do_idle.cp=
u_startup_entry
>       1.90 =C2=B1  4%      -1.3        0.62 =C2=B1 75%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule_i=
dle.do_idle
>       1.84 =C2=B1  5%      -1.3        0.58 =C2=B1 76%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch=
.__schedule.schedule_idle
>       1.73 =C2=B1 20%      -1.1        0.61 =C2=B1 79%  perf-profile.call=
trace.cycles-pp.schedule.schedule_hrtimeout_range_clock.do_select.core_sys_=
select.kern_select
>       1.73 =C2=B1 20%      -1.1        0.62 =C2=B1 78%  perf-profile.call=
trace.cycles-pp.schedule_hrtimeout_range_clock.do_select.core_sys_select.ke=
rn_select.__x64_sys_select
>       1.72 =C2=B1 20%      -1.1        0.61 =C2=B1 79%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.schedule_hrtimeout_range_clock.do_selec=
t.core_sys_select
>       1.54 =C2=B1  7%      -1.0        0.53 =C2=B1 84%  perf-profile.call=
trace.cycles-pp.__mutex_lock.pipe_read.new_sync_read.vfs_read.ksys_read
>       2.80 =C2=B1 20%      -0.9        1.91 =C2=B1 41%  perf-profile.call=
trace.cycles-pp.sock_read_iter.new_sync_read.vfs_read.ksys_read.do_syscall_=
64
>       2.68 =C2=B1 20%      -0.9        1.82 =C2=B1 41%  perf-profile.call=
trace.cycles-pp.tcp_recvmsg.inet_recvmsg.sock_read_iter.new_sync_read.vfs_r=
ead
>       2.70 =C2=B1 20%      -0.9        1.83 =C2=B1 41%  perf-profile.call=
trace.cycles-pp.inet_recvmsg.sock_read_iter.new_sync_read.vfs_read.ksys_read
>       2.48 =C2=B1 20%      -0.8        1.66 =C2=B1 42%  perf-profile.call=
trace.cycles-pp.tcp_recvmsg_locked.tcp_recvmsg.inet_recvmsg.sock_read_iter.=
new_sync_read
>       1.59 =C2=B1  2%      -0.8        0.78 =C2=B1 74%  perf-profile.call=
trace.cycles-pp.copy_page_from_iter.pipe_write.new_sync_write.vfs_write.ksy=
s_write
>       1.49 =C2=B1  3%      -0.8        0.72 =C2=B1 73%  perf-profile.call=
trace.cycles-pp.copyin.copy_page_from_iter.pipe_write.new_sync_write.vfs_wr=
ite
>       1.46 =C2=B1  3%      -0.8        0.70 =C2=B1 73%  perf-profile.call=
trace.cycles-pp.copy_user_enhanced_fast_string.copyin.copy_page_from_iter.p=
ipe_write.new_sync_write
>       1.22 =C2=B1 15%      -0.7        0.52 =C2=B1 71%  perf-profile.call=
trace.cycles-pp.__libc_start_main
>       1.34 =C2=B1 11%      -0.7        0.68 =C2=B1 72%  perf-profile.call=
trace.cycles-pp.skb_do_copy_data_nocache.tcp_sendmsg_locked.tcp_sendmsg.soc=
k_sendmsg.sock_write_iter
>       1.27 =C2=B1 11%      -0.6        0.65 =C2=B1 72%  perf-profile.call=
trace.cycles-pp._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg_locked=
.tcp_sendmsg.sock_sendmsg
>       1.22 =C2=B1 11%      -0.6        0.62 =C2=B1 71%  perf-profile.call=
trace.cycles-pp.copyin._copy_from_iter.skb_do_copy_data_nocache.tcp_sendmsg=
_locked.tcp_sendmsg
>       1.19 =C2=B1 11%      -0.6        0.62 =C2=B1 71%  perf-profile.call=
trace.cycles-pp.copy_user_enhanced_fast_string.copyin._copy_from_iter.skb_d=
o_copy_data_nocache.tcp_sendmsg_locked
>       0.98 =C2=B1 22%      -0.5        0.50 =C2=B1 77%  perf-profile.call=
trace.cycles-pp.skb_copy_datagram_iter.tcp_recvmsg_locked.tcp_recvmsg.inet_=
recvmsg.sock_read_iter
>       0.98 =C2=B1 22%      -0.5        0.50 =C2=B1 77%  perf-profile.call=
trace.cycles-pp.__skb_datagram_iter.skb_copy_datagram_iter.tcp_recvmsg_lock=
ed.tcp_recvmsg.inet_recvmsg
>       0.34 =C2=B1 70%      +0.6        0.92 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.lapic_next_deadline.clockevents_program_event.hrtimer_inter=
rupt.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>       0.00            +0.7        0.73 =C2=B1 19%  perf-profile.calltrace=
.cycles-pp.ktime_get_update_offsets_now.hrtimer_interrupt.__sysvec_apic_tim=
er_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       0.00            +0.8        0.80 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.arch_scale_freq_tick.scheduler_tick.update_process_times.tick_sc=
hed_handle.tick_sched_timer
>       0.00            +0.8        0.85 =C2=B1 17%  perf-profile.calltrace=
.cycles-pp.perf_mux_hrtimer_handler.__hrtimer_run_queues.hrtimer_interrupt.=
__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>       0.00            +1.0        1.01 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.rebalance_domains.__softirqentry_text_start.__irq_exit_rcu.sysve=
c_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       0.73 =C2=B1  7%      +1.1        1.84 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.__softirqentry_text_start.__irq_exit_rcu.sysvec_apic_timer_=
interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>       0.92 =C2=B1  7%      +1.3        2.25 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.__irq_exit_rcu.sysvec_apic_timer_interrupt.asm_sysvec_apic_=
timer_interrupt.cpuidle_enter_state.cpuidle_enter
>       0.75 =C2=B1  3%      +1.3        2.10 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.scheduler_tick.update_process_times.tick_sched_handle.tick_=
sched_timer.__hrtimer_run_queues
>       1.11 =C2=B1 15%      +1.4        2.52 =C2=B1 37%  perf-profile.call=
trace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select=
.cpuidle_idle_call.do_idle
>       1.50 =C2=B1 10%      +1.5        3.00 =C2=B1 32%  perf-profile.call=
trace.cycles-pp.clockevents_program_event.hrtimer_interrupt.__sysvec_apic_t=
imer_interrupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       1.45 =C2=B1 11%      +1.6        3.08 =C2=B1 29%  perf-profile.call=
trace.cycles-pp.tick_nohz_get_sleep_length.menu_select.cpuidle_idle_call.do=
_idle.cpu_startup_entry
>       1.07 =C2=B1  2%      +2.1        3.15 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.update_process_times.tick_sched_handle.tick_sched_timer.__h=
rtimer_run_queues.hrtimer_interrupt
>       1.11 =C2=B1  2%      +2.3        3.39 =C2=B1 21%  perf-profile.call=
trace.cycles-pp.tick_sched_handle.tick_sched_timer.__hrtimer_run_queues.hrt=
imer_interrupt.__sysvec_apic_timer_interrupt
>       1.40 =C2=B1  4%      +2.8        4.15 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.tick_sched_timer.__hrtimer_run_queues.hrtimer_interrupt.__s=
ysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt
>       2.64 =C2=B1 15%      +3.3        5.89 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.sta=
rt_secondary
>       2.04            +3.9        5.96 =C2=B1 19%  perf-profile.calltrace=
.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_inter=
rupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       4.18 =C2=B1  6%      +6.3       10.48 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic=
_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>       4.25 =C2=B1  6%      +6.5       10.73 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.a=
sm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
>       6.16 =C2=B1  7%      +9.3       15.42 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>      38.77 =C2=B1 10%     +11.0       49.76 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.mwait_idle_with_hints.intel_idle.cpuidle_enter_state.cpuidl=
e_enter.cpuidle_idle_call
>      38.83 =C2=B1 10%     +11.1       49.97 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_c=
all.do_idle
>       8.00 =C2=B1  5%     +11.4       19.37 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle=
_enter.cpuidle_idle_call.do_idle
>      60.88 =C2=B1  5%     +20.1       81.02 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64_no_verify
>      60.92 =C2=B1  4%     +20.2       81.09 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>      60.92 =C2=B1  5%     +20.2       81.09 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_v=
erify
>      61.14 =C2=B1  4%     +20.8       81.91 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.secondary_startup_64_no_verify
>      49.99 =C2=B1  7%     +21.5       71.45 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.s=
tart_secondary
>      49.09 =C2=B1  7%     +21.9       70.99 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle=
.cpu_startup_entry
>      53.10 =C2=B1  6%     +25.1       78.20 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary=
.secondary_startup_64_no_verify
>      37.42 =C2=B1  7%     -20.8       16.63 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>      37.27 =C2=B1  7%     -20.7       16.54 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>      15.77 =C2=B1  3%     -11.3        4.48 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.__schedule
>      16.43 =C2=B1  3%      -9.6        6.80 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.ksys_write
>      16.28 =C2=B1  3%      -9.5        6.76 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.vfs_write
>      16.32 =C2=B1 11%      -9.5        6.85 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.ksys_read
>      16.12 =C2=B1  2%      -9.4        6.68 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>      16.24 =C2=B1 11%      -9.4        6.82 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.vfs_read
>      14.72 =C2=B1 12%      -9.0        5.72 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.new_sync_read
>      12.87 =C2=B1  4%      -8.5        4.36 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.perf_tp_event
>      12.55 =C2=B1  4%      -8.3        4.22 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.__perf_event_overflow
>      12.49 =C2=B1  4%      -8.3        4.20 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.perf_event_output_forward
>      11.83 =C2=B1 10%      -8.1        3.73 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.pipe_read
>      10.81 =C2=B1  4%      -7.3        3.53 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.perf_prepare_sample
>       8.90 =C2=B1 10%      -7.3        1.63 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>       8.77 =C2=B1 10%      -7.2        1.60 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>      10.36 =C2=B1  4%      -7.0        3.34 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.perf_callchain
>      10.33 =C2=B1  4%      -7.0        3.33 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.get_perf_callchain
>       8.56 =C2=B1 10%      -6.9        1.62 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>      10.68            -6.4        4.29 =C2=B1 45%  perf-profile.children.=
cycles-pp.pipe_write
>       7.54 =C2=B1 10%      -6.1        1.45 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.autoremove_wake_function
>       7.05 =C2=B1  5%      -5.8        1.30 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       8.77 =C2=B1  2%      -5.6        3.20 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.schedule
>       7.10 =C2=B1  4%      -4.5        2.55 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.perf_callchain_kernel
>       5.54 =C2=B1  4%      -3.5        2.03 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.unwind_next_frame
>       3.46 =C2=B1  4%      -3.3        0.17 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       5.26            -3.3        1.99 =C2=B1 49%  perf-profile.children.=
cycles-pp.perf_trace_sched_switch
>       3.76 =C2=B1  4%      -3.2        0.58 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       4.15 =C2=B1 10%      -3.1        1.02 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.ttwu_do_wakeup
>       3.91 =C2=B1 10%      -2.9        0.98 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_wakeup_template
>       4.56 =C2=B1  3%      -2.9        1.64 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.dequeue_task_fair
>       4.42 =C2=B1  3%      -2.8        1.60 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       4.25 =C2=B1  3%      -2.7        1.56 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.update_curr
>       4.62 =C2=B1 11%      -2.5        2.10 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.sock_write_iter
>       4.57 =C2=B1 12%      -2.5        2.07 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.sock_sendmsg
>       3.97 =C2=B1  3%      -2.5        1.49 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_stat_runtime
>       4.48 =C2=B1 12%      -2.4        2.03 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.tcp_sendmsg
>       3.87 =C2=B1 11%      -2.3        1.55 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.tcp_sendmsg_locked
>       3.04 =C2=B1  5%      -2.3        0.73 =C2=B1 53%  perf-profile.chil=
dren.cycles-pp.perf_callchain_user
>       2.91 =C2=B1  4%      -2.2        0.70 =C2=B1 52%  perf-profile.chil=
dren.cycles-pp.__get_user_nocheck_8
>       4.76 =C2=B1  7%      -2.0        2.76 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.copy_user_enhanced_fast_string
>       3.34 =C2=B1 14%      -1.9        1.42 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.__tcp_transmit_skb
>       3.23 =C2=B1 14%      -1.9        1.36 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.__ip_queue_xmit
>       2.99 =C2=B1  6%      -1.9        1.12 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.__unwind_start
>       3.69 =C2=B1 16%      -1.8        1.84 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.__x64_sys_select
>       3.67 =C2=B1 16%      -1.8        1.82 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.kern_select
>       3.10 =C2=B1 15%      -1.8        1.29 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.ip_finish_output2
>       2.61 =C2=B1 13%      -1.8        0.85 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.tcp_write_xmit
>       2.91 =C2=B1 14%      -1.7        1.19 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.__local_bh_enable_ip
>       2.88 =C2=B1 14%      -1.7        1.16 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.do_softirq
>       3.39 =C2=B1 16%      -1.7        1.69 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.core_sys_select
>       2.80 =C2=B1 15%      -1.6        1.17 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.net_rx_action
>       2.35 =C2=B1  2%      -1.6        0.76 =C2=B1 50%  perf-profile.chil=
dren.cycles-pp.poll_idle
>       2.85 =C2=B1 17%      -1.5        1.34 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.do_select
>       2.41 =C2=B1 15%      -1.5        0.91 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.process_backlog
>       2.34 =C2=B1 15%      -1.5        0.86 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.__netif_receive_skb_one_core
>       2.42 =C2=B1 15%      -1.5        0.96 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.__napi_poll
>       2.27 =C2=B1 15%      -1.5        0.82 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.ip_local_deliver_finish
>       2.28 =C2=B1  6%      -1.4        0.85 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.asm_exc_page_fault
>       2.21 =C2=B1 15%      -1.4        0.77 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.ip_protocol_deliver_rcu
>       2.20 =C2=B1 14%      -1.4        0.77 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.tcp_v4_rcv
>       2.25 =C2=B1 14%      -1.4        0.82 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.tcp_v4_do_rcv
>       2.23 =C2=B1 14%      -1.4        0.82 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.tcp_rcv_established
>       3.02 =C2=B1  3%      -1.4        1.65 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.copyin
>       1.84 =C2=B1 15%      -1.3        0.56 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.__tcp_push_pending_frames
>       1.77 =C2=B1  4%      -1.0        0.72 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.__orc_find
>       1.74 =C2=B1 20%      -1.0        0.73 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.schedule_hrtimeout_range_clock
>       1.15 =C2=B1 13%      -1.0        0.14 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.sock_def_readable
>       1.12 =C2=B1 13%      -1.0        0.12 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.pollwake
>       1.61 =C2=B1  8%      -0.9        0.69 =C2=B1 57%  perf-profile.chil=
dren.cycles-pp.__mutex_lock
>       2.80 =C2=B1 20%      -0.9        1.91 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.sock_read_iter
>       2.70 =C2=B1 20%      -0.9        1.83 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.inet_recvmsg
>       2.68 =C2=B1 20%      -0.9        1.82 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.tcp_recvmsg
>       1.39 =C2=B1  5%      -0.9        0.54 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.perf_output_sample
>       2.48 =C2=B1 20%      -0.8        1.66 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.tcp_recvmsg_locked
>       1.27 =C2=B1  9%      -0.7        0.54 =C2=B1 54%  perf-profile.chil=
dren.cycles-pp.mutex_spin_on_owner
>       1.59 =C2=B1  2%      -0.7        0.91 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.copy_page_from_iter
>       1.72 =C2=B1 16%      -0.6        1.09 =C2=B1 47%  perf-profile.chil=
dren.cycles-pp.copyout
>       0.87            -0.6        0.27 =C2=B1 44%  perf-profile.children.=
cycles-pp.orc_find
>       0.74 =C2=B1 15%      -0.6        0.14 =C2=B1 53%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       0.72 =C2=B1 15%      -0.6        0.13 =C2=B1 50%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       0.94            -0.6        0.36 =C2=B1 48%  perf-profile.children.=
cycles-pp.perf_output_copy
>       3.66 =C2=B1 11%      -0.6        3.10 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>       1.22 =C2=B1 15%      -0.6        0.66 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       1.34 =C2=B1 11%      -0.6        0.78 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.skb_do_copy_data_nocache
>       0.82 =C2=B1 16%      -0.6        0.27 =C2=B1 57%  perf-profile.chil=
dren.cycles-pp.__libc_write
>       0.82 =C2=B1  6%      -0.5        0.27 =C2=B1 64%  perf-profile.chil=
dren.cycles-pp.unwind_get_return_address
>       0.80 =C2=B1 16%      -0.5        0.26 =C2=B1 57%  perf-profile.chil=
dren.cycles-pp.generic_file_write_iter
>       0.80 =C2=B1 16%      -0.5        0.26 =C2=B1 57%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       0.80 =C2=B1 16%      -0.5        0.26 =C2=B1 57%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       1.27 =C2=B1 11%      -0.5        0.75 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp._copy_from_iter
>       0.88 =C2=B1  2%      -0.5        0.37 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.memcpy_erms
>       1.06 =C2=B1  5%      -0.5        0.57 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.read_zero
>       0.71 =C2=B1  4%      -0.5        0.23 =C2=B1 66%  perf-profile.chil=
dren.cycles-pp.__kernel_text_address
>       0.71 =C2=B1  7%      -0.5        0.22 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.stack_access_ok
>       0.56 =C2=B1 10%      -0.5        0.08 =C2=B1 95%  perf-profile.chil=
dren.cycles-pp.pick_next_task_fair
>       1.02 =C2=B1  5%      -0.5        0.55 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.__clear_user
>       0.52 =C2=B1 10%      -0.4        0.10 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       0.57 =C2=B1  6%      -0.4        0.18 =C2=B1 54%  perf-profile.chil=
dren.cycles-pp.kernel_text_address
>       0.98 =C2=B1 22%      -0.4        0.61 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.skb_copy_datagram_iter
>       0.98 =C2=B1 22%      -0.4        0.61 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.__skb_datagram_iter
>       0.44 =C2=B1 17%      -0.3        0.11 =C2=B1 85%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.81 =C2=B1 21%      -0.3        0.48 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp._copy_to_iter
>       0.70 =C2=B1  8%      -0.3        0.38 =C2=B1 50%  perf-profile.chil=
dren.cycles-pp.__put_page
>       0.68 =C2=B1  9%      -0.3        0.37 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.__mem_cgroup_uncharge
>       0.64 =C2=B1  8%      -0.3        0.36 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.uncharge_batch
>       0.56 =C2=B1 11%      -0.3        0.27 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.page_counter_uncharge
>       0.36 =C2=B1  4%      -0.3        0.08 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.kernelmode_fixup_or_oops
>       0.41 =C2=B1 17%      -0.3        0.16 =C2=B1 50%  perf-profile.chil=
dren.cycles-pp.prepare_to_wait_event
>       0.64 =C2=B1  8%      -0.2        0.40 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.exc_page_fault
>       0.31 =C2=B1  4%      -0.2        0.06 =C2=B1 77%  perf-profile.chil=
dren.cycles-pp.fixup_exception
>       0.32 =C2=B1 19%      -0.2        0.09 =C2=B1 76%  perf-profile.chil=
dren.cycles-pp.copy_page_from_iter_atomic
>       0.58 =C2=B1 17%      -0.2        0.37 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.release_sock
>       1.04 =C2=B1  9%      -0.2        0.84 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.26 =C2=B1 14%      -0.2        0.06 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.select_task_rq
>       0.24 =C2=B1  6%      -0.2        0.05 =C2=B1 74%  perf-profile.chil=
dren.cycles-pp.search_exception_tables
>       0.52 =C2=B1 18%      -0.2        0.33 =C2=B1 40%  perf-profile.chil=
dren.cycles-pp.__release_sock
>       0.24 =C2=B1  8%      -0.2        0.05 =C2=B1 74%  perf-profile.chil=
dren.cycles-pp.search_extable
>       0.27 =C2=B1 18%      -0.2        0.09 =C2=B1 76%  perf-profile.chil=
dren.cycles-pp.shmem_write_begin
>       0.27 =C2=B1 20%      -0.2        0.09 =C2=B1 76%  perf-profile.chil=
dren.cycles-pp.shmem_getpage_gfp
>       0.23 =C2=B1  8%      -0.2        0.05 =C2=B1 74%  perf-profile.chil=
dren.cycles-pp.bsearch
>       0.23 =C2=B1 16%      -0.2        0.06 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.prepare_task_switch
>       0.36 =C2=B1 14%      -0.2        0.19 =C2=B1 41%  perf-profile.chil=
dren.cycles-pp.skb_release_data
>       0.46 =C2=B1  7%      -0.2        0.29 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.__memcg_kmem_charge_page
>       0.35 =C2=B1  9%      -0.2        0.18 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.__might_resched
>       0.28 =C2=B1  3%      -0.2        0.12 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.mutex_lock
>       0.23 =C2=B1  7%      -0.2        0.07 =C2=B1 74%  perf-profile.chil=
dren.cycles-pp.__x64_sys_poll
>       0.23 =C2=B1  7%      -0.2        0.07 =C2=B1 74%  perf-profile.chil=
dren.cycles-pp.do_sys_poll
>       0.23 =C2=B1  7%      -0.2        0.07 =C2=B1 76%  perf-profile.chil=
dren.cycles-pp.__poll
>       0.29 =C2=B1  4%      -0.2        0.13 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.__perf_event_header__init_id
>       0.26 =C2=B1  3%      -0.2        0.11 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.mutex_unlock
>       0.25 =C2=B1  8%      -0.1        0.11 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.propagate_protected_usage
>       0.17 =C2=B1 10%      -0.1        0.04 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.select_task_rq_fair
>       0.23 =C2=B1  7%      -0.1        0.10 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.poll_freewait
>       0.18 =C2=B1  4%      -0.1        0.06 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.do_poll
>       0.18 =C2=B1  5%      -0.1        0.06 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.__switch_to_asm
>       0.30 =C2=B1 22%      -0.1        0.18 =C2=B1 52%  perf-profile.chil=
dren.cycles-pp.sock_poll
>       0.25 =C2=B1 15%      -0.1        0.14 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.napi_consume_skb
>       0.17 =C2=B1 19%      -0.1        0.06 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.__fdget_pos
>       0.31 =C2=B1 14%      -0.1        0.20 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.tcp_ack
>       0.22 =C2=B1 23%      -0.1        0.11 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.pipe_poll
>       0.16 =C2=B1  6%      -0.1        0.05 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.perf_poll
>       0.23 =C2=B1 16%      -0.1        0.14 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.tcp_clean_rtx_queue
>       0.17 =C2=B1  8%      -0.1        0.08 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.perf_output_begin_forward
>       0.13 =C2=B1 27%      -0.1        0.04 =C2=B1 76%  perf-profile.chil=
dren.cycles-pp.is_bpf_text_address
>       0.19 =C2=B1  2%      -0.1        0.11 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__might_fault
>       0.22 =C2=B1 21%      -0.1        0.14 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.__dev_queue_xmit
>       0.13 =C2=B1 16%      -0.1        0.06 =C2=B1 73%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.12 =C2=B1 11%      -0.1        0.05 =C2=B1 78%  perf-profile.chil=
dren.cycles-pp.syscall_return_via_sysret
>       0.15 =C2=B1 14%      -0.1        0.08 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.task_tick_fair
>       0.13 =C2=B1  6%      -0.1        0.06 =C2=B1 72%  perf-profile.chil=
dren.cycles-pp.__might_sleep
>       0.14 =C2=B1 20%      -0.1        0.08 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.add_wait_queue
>       0.10 =C2=B1  8%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.sk_page_frag_refill
>       0.10 =C2=B1  8%      -0.1        0.04 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.skb_page_frag_refill
>       0.07 =C2=B1 11%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.push_and_clear_regs
>       0.04 =C2=B1 73%      +0.0        0.08 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.idle_cpu
>       0.03 =C2=B1 70%      +0.0        0.07 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.walk_component
>       0.09 =C2=B1 19%      +0.0        0.13 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.seq_printf
>       0.07 =C2=B1 25%      +0.1        0.13 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.s_show
>       0.08 =C2=B1 24%      +0.1        0.14 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.vsnprintf
>       0.00            +0.1        0.06 =C2=B1 19%  perf-profile.children.=
cycles-pp.dup_mm
>       0.00            +0.1        0.06 =C2=B1 19%  perf-profile.children.=
cycles-pp.nohz_balancer_kick
>       0.00            +0.1        0.06 =C2=B1 19%  perf-profile.children.=
cycles-pp.dup_mmap
>       0.14 =C2=B1  5%      +0.1        0.21 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.rcu_dynticks_inc
>       0.05 =C2=B1  8%      +0.1        0.12 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.begin_new_exec
>       0.06 =C2=B1  8%      +0.1        0.13 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__libc_fork
>       0.02 =C2=B1141%      +0.1        0.09 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp._find_next_bit
>       0.04 =C2=B1 70%      +0.1        0.11 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.trigger_load_balance
>       0.11 =C2=B1 26%      +0.1        0.18 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.hrtimer_get_next_event
>       0.02 =C2=B1141%      +0.1        0.09 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.cpumask_next_and
>       0.03 =C2=B1 70%      +0.1        0.11 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__flush_smp_call_function_queue
>       0.04 =C2=B1 71%      +0.1        0.12 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.exec_mmap
>       0.00            +0.1        0.08 =C2=B1 35%  perf-profile.children.=
cycles-pp.irqtime_account_process_tick
>       0.02 =C2=B1141%      +0.1        0.10 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.copy_process
>       0.06 =C2=B1 81%      +0.1        0.14 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.smp_call_function_single
>       0.05 =C2=B1 84%      +0.1        0.14 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.perf_event_read
>       0.02 =C2=B1141%      +0.1        0.11 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.tick_check_broadcast_expired
>       0.05 =C2=B1 72%      +0.1        0.14 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.rb_next
>       0.02 =C2=B1141%      +0.1        0.12 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.unmap_page_range
>       0.02 =C2=B1141%      +0.1        0.11 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.__do_sys_clone
>       0.02 =C2=B1141%      +0.1        0.11 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.kernel_clone
>       0.07 =C2=B1  6%      +0.1        0.17 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.load_elf_binary
>       0.00            +0.1        0.10 =C2=B1 57%  perf-profile.children.=
cycles-pp.__smp_call_single_queue
>       0.00            +0.1        0.10 =C2=B1 43%  perf-profile.children.=
cycles-pp.rb_insert_color
>       0.08 =C2=B1 34%      +0.1        0.18 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.perf_read
>       0.00            +0.1        0.10 =C2=B1 70%  perf-profile.children.=
cycles-pp.pm_qos_read_value
>       0.02 =C2=B1141%      +0.1        0.12 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.unmap_vmas
>       0.08 =C2=B1 17%      +0.1        0.19 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.mmput
>       0.08 =C2=B1 17%      +0.1        0.19 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.exit_mmap
>       0.07 =C2=B1  6%      +0.1        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.exec_binprm
>       0.07 =C2=B1  6%      +0.1        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.search_binary_handler
>       0.06 =C2=B1  7%      +0.1        0.17 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.00            +0.1        0.11 =C2=B1 51%  perf-profile.children.=
cycles-pp.llist_add_batch
>       0.03 =C2=B1 70%      +0.1        0.14 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.note_gp_changes
>       0.11 =C2=B1 26%      +0.1        0.22 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__libc_read
>       0.02 =C2=B1141%      +0.1        0.13 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.rcu_eqs_enter
>       0.00            +0.1        0.11 =C2=B1 72%  perf-profile.children.=
cycles-pp.rb_erase
>       0.03 =C2=B1 70%      +0.1        0.15 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.memcpy_toio
>       0.03 =C2=B1 70%      +0.1        0.15 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.drm_fb_helper_damage_blit_real
>       0.02 =C2=B1141%      +0.1        0.13 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       0.02 =C2=B1141%      +0.1        0.13 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.path_openat
>       0.03 =C2=B1 70%      +0.1        0.15 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.drm_fb_helper_damage_work
>       0.07 =C2=B1 12%      +0.1        0.19 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       0.08 =C2=B1  5%      +0.1        0.20        perf-profile.children.=
cycles-pp.bprm_execve
>       0.00            +0.1        0.12 =C2=B1 64%  perf-profile.children.=
cycles-pp.tick_nohz_tick_stopped
>       0.14 =C2=B1 14%      +0.1        0.26 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.__handle_mm_fault
>       0.02 =C2=B1141%      +0.1        0.14 =C2=B1 63%  perf-profile.chil=
dren.cycles-pp.irqentry_exit
>       0.15 =C2=B1 13%      +0.1        0.27 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.handle_mm_fault
>       0.10 =C2=B1  4%      +0.1        0.22 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.execve
>       0.10 =C2=B1  4%      +0.1        0.22 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__x64_sys_execve
>       0.10 =C2=B1  4%      +0.1        0.22 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.do_execveat_common
>       0.19 =C2=B1  6%      +0.1        0.31 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.update_blocked_averages
>       0.00            +0.1        0.14 =C2=B1 15%  perf-profile.children.=
cycles-pp.__x64_sys_openat
>       0.00            +0.1        0.14 =C2=B1 15%  perf-profile.children.=
cycles-pp.do_sys_openat2
>       0.15 =C2=B1 16%      +0.1        0.30 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__intel_pmu_enable_all
>       0.07 =C2=B1 35%      +0.1        0.22 =C2=B1 54%  perf-profile.chil=
dren.cycles-pp.timerqueue_add
>       0.00            +0.1        0.15 =C2=B1 83%  perf-profile.children.=
cycles-pp.tick_check_oneshot_broadcast_this_cpu
>       0.14 =C2=B1 10%      +0.2        0.29 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.rcu_eqs_exit
>       0.17 =C2=B1  9%      +0.2        0.33 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.run_rebalance_domains
>       0.02 =C2=B1141%      +0.2        0.18 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.check_cpu_stall
>       0.07 =C2=B1 17%      +0.2        0.24 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.rcu_core
>       0.08 =C2=B1 40%      +0.2        0.25 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.enqueue_hrtimer
>       0.11 =C2=B1 26%      +0.2        0.28 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.update_sg_lb_stats
>       0.12 =C2=B1  6%      +0.2        0.30 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.hrtimer_update_next_event
>       0.52 =C2=B1  4%      +0.2        0.71 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.read_tsc
>       0.13 =C2=B1 19%      +0.2        0.32 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.update_irq_load_avg
>       0.26 =C2=B1  6%      +0.2        0.45 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.hrtimer_next_event_without
>       0.04 =C2=B1 71%      +0.2        0.23 =C2=B1 71%  perf-profile.chil=
dren.cycles-pp.timerqueue_del
>       0.61 =C2=B1  5%      +0.2        0.82 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.native_sched_clock
>       0.13 =C2=B1  3%      +0.2        0.34 =C2=B1 55%  perf-profile.chil=
dren.cycles-pp.cpuidle_governor_latency_req
>       0.24 =C2=B1 10%      +0.2        0.45 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.get_next_timer_interrupt
>       0.21 =C2=B1  3%      +0.2        0.43 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__hrtimer_next_event_base
>       0.33 =C2=B1 10%      +0.2        0.55 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.irqtime_account_irq
>       0.15 =C2=B1 19%      +0.2        0.39 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.tsc_verify_tsc_adjust
>       0.70 =C2=B1  5%      +0.2        0.94 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       0.16 =C2=B1 16%      +0.2        0.40 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.update_sd_lb_stats
>       0.15 =C2=B1 14%      +0.2        0.40 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp._raw_spin_trylock
>       0.16 =C2=B1 18%      +0.2        0.40 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.arch_cpu_idle_enter
>       0.20 =C2=B1  4%      +0.2        0.44 =C2=B1 42%  perf-profile.chil=
dren.cycles-pp.rcu_idle_exit
>       0.17 =C2=B1 15%      +0.3        0.44 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.find_busiest_group
>       0.14 =C2=B1 13%      +0.3        0.45 =C2=B1 36%  perf-profile.chil=
dren.cycles-pp.rcu_sched_clock_irq
>       0.16 =C2=B1 13%      +0.3        0.50 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.calc_global_load_tick
>       0.23 =C2=B1 14%      +0.3        0.58 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.load_balance
>       0.17 =C2=B1 14%      +0.4        0.56 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.tick_sched_do_timer
>       0.32 =C2=B1 39%      +0.4        0.75 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.ktime_get_update_offsets_now
>       0.54 =C2=B1  4%      +0.4        0.99 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.lapic_next_deadline
>       0.29 =C2=B1 52%      +0.4        0.73 =C2=B1 49%  perf-profile.chil=
dren.cycles-pp.tick_irq_enter
>       0.31 =C2=B1 46%      +0.5        0.77 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.irq_enter_rcu
>       0.33 =C2=B1  7%      +0.5        0.81 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.arch_scale_freq_tick
>       0.35 =C2=B1 11%      +0.5        0.89 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.perf_mux_hrtimer_handler
>       0.22 =C2=B1 24%      +0.6        0.83 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.start_kernel
>       0.22 =C2=B1 24%      +0.6        0.83 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.arch_call_rest_init
>       0.22 =C2=B1 24%      +0.6        0.83 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.rest_init
>       0.42 =C2=B1  9%      +0.6        1.04 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.rebalance_domains
>       0.03 =C2=B1 70%      +0.6        0.66 =C2=B1 44%  perf-profile.chil=
dren.cycles-pp.flush_smp_call_function_queue
>       0.45 =C2=B1 33%      +0.6        1.09 =C2=B1 43%  perf-profile.chil=
dren.cycles-pp.tick_nohz_irq_exit
>       0.37 =C2=B1 16%      +0.8        1.20 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.sched_ttwu_pending
>       0.95 =C2=B1  2%      +1.3        2.22 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       1.00 =C2=B1  5%      +1.4        2.39 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__irq_exit_rcu
>       1.14 =C2=B1 15%      +1.4        2.57 =C2=B1 35%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       1.56 =C2=B1  8%      +1.5        3.10 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       1.47 =C2=B1 11%      +1.7        3.14 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       2.00 =C2=B1 23%      +1.8        3.83 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       1.31            +2.0        3.32 =C2=B1 13%  perf-profile.children.=
cycles-pp.update_process_times
>       1.35            +2.2        3.53 =C2=B1 19%  perf-profile.children.=
cycles-pp.tick_sched_handle
>       1.66 =C2=B1  4%      +2.7        4.32 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       2.68 =C2=B1 15%      +3.3        6.00 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.menu_select
>       2.33            +3.9        6.20 =C2=B1 17%  perf-profile.children.=
cycles-pp.__hrtimer_run_queues
>       4.57 =C2=B1  5%      +6.3       10.82 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       4.62 =C2=B1  5%      +6.4       11.05 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       6.61 =C2=B1  7%      +9.3       15.87 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sysvec_apic_timer_interrupt
>       7.67 =C2=B1  5%     +10.5       18.13 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_apic_timer_interrupt
>      39.12 =C2=B1  9%     +11.0       50.17 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.mwait_idle_with_hints
>      38.92 =C2=B1 10%     +11.3       50.17 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.intel_idle
>      60.92 =C2=B1  4%     +20.2       81.09 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.start_secondary
>      61.14 =C2=B1  4%     +20.8       81.91 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>      61.14 =C2=B1  4%     +20.8       81.91 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>      61.12 =C2=B1  4%     +20.8       81.90 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.do_idle
>      50.14 =C2=B1  7%     +21.9       72.09 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>      50.18 =C2=B1  7%     +22.0       72.19 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter
>      53.33 =C2=B1  6%     +25.7       79.07 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.cpuidle_idle_call
>       3.46 =C2=B1  4%      -3.3        0.17 =C2=B1 41%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>       3.30 =C2=B1 11%      -2.1        1.21 =C2=B1 50%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       2.28 =C2=B1  2%      -2.0        0.29 =C2=B1 48%  perf-profile.self=
.cycles-pp.poll_idle
>       4.72 =C2=B1  7%      -2.0        2.73 =C2=B1 44%  perf-profile.self=
.cycles-pp.copy_user_enhanced_fast_string
>       2.09 =C2=B1  4%      -1.3        0.79 =C2=B1 42%  perf-profile.self=
.cycles-pp.unwind_next_frame
>       1.65 =C2=B1  5%      -1.2        0.42 =C2=B1 52%  perf-profile.self=
.cycles-pp.__get_user_nocheck_8
>       1.75 =C2=B1  4%      -1.0        0.71 =C2=B1 43%  perf-profile.self=
.cycles-pp.__orc_find
>       1.26 =C2=B1 10%      -0.7        0.53 =C2=B1 54%  perf-profile.self=
.cycles-pp.mutex_spin_on_owner
>       0.86            -0.6        0.25 =C2=B1 48%  perf-profile.self.cycl=
es-pp.orc_find
>       0.62 =C2=B1 10%      -0.5        0.11 =C2=B1 77%  perf-profile.self=
.cycles-pp.__schedule
>       0.85            -0.5        0.35 =C2=B1 41%  perf-profile.self.cycl=
es-pp.memcpy_erms
>       0.98 =C2=B1  6%      -0.5        0.52 =C2=B1 47%  perf-profile.self=
.cycles-pp.__clear_user
>       0.66 =C2=B1  9%      -0.4        0.22 =C2=B1 34%  perf-profile.self=
.cycles-pp.stack_access_ok
>       0.44 =C2=B1  7%      -0.3        0.15 =C2=B1 62%  perf-profile.self=
.cycles-pp.perf_callchain_kernel
>       0.34 =C2=B1 12%      -0.2        0.12 =C2=B1 31%  perf-profile.self=
.cycles-pp.update_rq_clock
>       1.01 =C2=B1  9%      -0.2        0.81 =C2=B1 13%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.29 =C2=B1  7%      -0.2        0.10 =C2=B1 77%  perf-profile.self=
.cycles-pp.perf_output_copy
>       0.27 =C2=B1 10%      -0.2        0.09 =C2=B1 24%  perf-profile.self=
.cycles-pp.__unwind_start
>       0.24 =C2=B1  8%      -0.2        0.08 =C2=B1 77%  perf-profile.self=
.cycles-pp.propagate_protected_usage
>       0.34 =C2=B1  7%      -0.2        0.18 =C2=B1 29%  perf-profile.self=
.cycles-pp.__might_resched
>       0.24 =C2=B1 22%      -0.2        0.09 =C2=B1 73%  perf-profile.self=
.cycles-pp.perf_output_sample
>       0.26 =C2=B1  3%      -0.1        0.11 =C2=B1 29%  perf-profile.self=
.cycles-pp.mutex_unlock
>       0.22 =C2=B1  4%      -0.1        0.07 =C2=B1 72%  perf-profile.self=
.cycles-pp.pipe_write
>       0.33 =C2=B1 12%      -0.1        0.18 =C2=B1 49%  perf-profile.self=
.cycles-pp.page_counter_uncharge
>       0.20 =C2=B1 20%      -0.1        0.06 =C2=B1 83%  perf-profile.self=
.cycles-pp.pipe_read
>       0.27            -0.1        0.13 =C2=B1 59%  perf-profile.self.cycl=
es-pp.__mutex_lock
>       0.24 =C2=B1 15%      -0.1        0.11 =C2=B1 24%  perf-profile.self=
.cycles-pp.perf_tp_event
>       0.18 =C2=B1  5%      -0.1        0.06 =C2=B1 72%  perf-profile.self=
.cycles-pp.__switch_to_asm
>       0.26 =C2=B1 15%      -0.1        0.14 =C2=B1 43%  perf-profile.self=
.cycles-pp.page_counter_charge
>       0.23 =C2=B1 16%      -0.1        0.12 =C2=B1 73%  perf-profile.self=
.cycles-pp.do_select
>       0.17 =C2=B1 18%      -0.1        0.06 =C2=B1 73%  perf-profile.self=
.cycles-pp.__fdget_pos
>       0.17 =C2=B1 23%      -0.1        0.06 =C2=B1 72%  perf-profile.self=
.cycles-pp.skb_release_data
>       0.19 =C2=B1 22%      -0.1        0.09 =C2=B1 36%  perf-profile.self=
.cycles-pp.prepare_to_wait_event
>       0.19 =C2=B1  2%      -0.1        0.09 =C2=B1 22%  perf-profile.self=
.cycles-pp.mutex_lock
>       0.17 =C2=B1 11%      -0.1        0.08 =C2=B1 70%  perf-profile.self=
.cycles-pp.perf_output_begin_forward
>       0.16 =C2=B1 21%      -0.1        0.07 =C2=B1 81%  perf-profile.self=
.cycles-pp.copy_user_short_string
>       0.21 =C2=B1 21%      -0.1        0.13 =C2=B1 25%  perf-profile.self=
.cycles-pp.__list_del_entry_valid
>       0.13 =C2=B1 25%      -0.1        0.05 =C2=B1 74%  perf-profile.self=
.cycles-pp.__pollwait
>       0.13 =C2=B1 16%      -0.1        0.06 =C2=B1 73%  perf-profile.self=
.cycles-pp.__update_load_avg_cfs_rq
>       0.13 =C2=B1 17%      -0.1        0.06 =C2=B1 73%  perf-profile.self=
.cycles-pp._raw_spin_lock_bh
>       0.12 =C2=B1 10%      -0.1        0.05 =C2=B1 78%  perf-profile.self=
.cycles-pp.syscall_return_via_sysret
>       0.14 =C2=B1 21%      -0.1        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>       0.11 =C2=B1  8%      -0.1        0.06 =C2=B1 71%  perf-profile.self=
.cycles-pp.__might_sleep
>       0.10 =C2=B1 21%      -0.1        0.05 =C2=B1 72%  perf-profile.self=
.cycles-pp.core_sys_select
>       0.09 =C2=B1 18%      -0.0        0.06 =C2=B1 23%  perf-profile.self=
.cycles-pp.ttwu_queue_wakelist
>       0.07 =C2=B1  6%      +0.0        0.10 =C2=B1 14%  perf-profile.self=
.cycles-pp.sched_clock_cpu
>       0.06 =C2=B1 14%      +0.0        0.09 =C2=B1  9%  perf-profile.self=
.cycles-pp.push_and_clear_regs
>       0.06 =C2=B1 29%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.rcu_idle_exit
>       0.04 =C2=B1 71%      +0.1        0.09 =C2=B1 14%  perf-profile.self=
.cycles-pp.clockevents_program_event
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.self.cycl=
es-pp.note_gp_changes
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1  6%  perf-profile.self=
.cycles-pp.update_sd_lb_stats
>       0.10 =C2=B1 21%      +0.1        0.16 =C2=B1 15%  perf-profile.self=
.cycles-pp._raw_spin_unlock_irqrestore
>       0.03 =C2=B1 70%      +0.1        0.10 =C2=B1 19%  perf-profile.self=
.cycles-pp.trigger_load_balance
>       0.02 =C2=B1141%      +0.1        0.09 =C2=B1 19%  perf-profile.self=
.cycles-pp._find_next_bit
>       0.13 =C2=B1  6%      +0.1        0.21 =C2=B1 12%  perf-profile.self=
.cycles-pp.rcu_dynticks_inc
>       0.00            +0.1        0.08 =C2=B1 35%  perf-profile.self.cycl=
es-pp.tick_nohz_tick_stopped
>       0.00            +0.1        0.08 =C2=B1 35%  perf-profile.self.cycl=
es-pp.irqtime_account_process_tick
>       0.00            +0.1        0.08 =C2=B1 56%  perf-profile.self.cycl=
es-pp.rb_insert_color
>       0.02 =C2=B1141%      +0.1        0.10 =C2=B1 24%  perf-profile.self=
.cycles-pp.cpuidle_enter
>       0.04 =C2=B1 70%      +0.1        0.13 =C2=B1 24%  perf-profile.self=
.cycles-pp.rebalance_domains
>       0.07 =C2=B1 11%      +0.1        0.16 =C2=B1 56%  perf-profile.self=
.cycles-pp.rcu_eqs_exit
>       0.05 =C2=B1 72%      +0.1        0.14 =C2=B1 39%  perf-profile.self=
.cycles-pp.rb_next
>       0.02 =C2=B1141%      +0.1        0.11 =C2=B1 28%  perf-profile.self=
.cycles-pp.tick_check_broadcast_expired
>       0.00            +0.1        0.10 =C2=B1 46%  perf-profile.self.cycl=
es-pp.load_balance
>       0.02 =C2=B1141%      +0.1        0.12 =C2=B1 38%  perf-profile.self=
.cycles-pp.rcu_eqs_enter
>       0.08 =C2=B1 22%      +0.1        0.18 =C2=B1 33%  perf-profile.self=
.cycles-pp.__softirqentry_text_start
>       0.00            +0.1        0.10 =C2=B1 70%  perf-profile.self.cycl=
es-pp.pm_qos_read_value
>       0.00            +0.1        0.10 =C2=B1 32%  perf-profile.self.cycl=
es-pp.hrtimer_update_next_event
>       0.03 =C2=B1141%      +0.1        0.13 =C2=B1 52%  perf-profile.self=
.cycles-pp.timerqueue_add
>       0.12 =C2=B1 10%      +0.1        0.22 =C2=B1  4%  perf-profile.self=
.cycles-pp.irqtime_account_irq
>       0.00            +0.1        0.11 =C2=B1 51%  perf-profile.self.cycl=
es-pp.llist_add_batch
>       0.09 =C2=B1 13%      +0.1        0.20 =C2=B1 12%  perf-profile.self=
.cycles-pp.asm_sysvec_apic_timer_interrupt
>       0.00            +0.1        0.11 =C2=B1 37%  perf-profile.self.cycl=
es-pp.__sysvec_apic_timer_interrupt
>       0.03 =C2=B1 70%      +0.1        0.15 =C2=B1 22%  perf-profile.self=
.cycles-pp.memcpy_toio
>       0.10 =C2=B1 14%      +0.1        0.22 =C2=B1 24%  perf-profile.self=
.cycles-pp.hrtimer_interrupt
>       0.09 =C2=B1 10%      +0.1        0.21 =C2=B1 39%  perf-profile.self=
.cycles-pp.rcu_sched_clock_irq
>       0.00            +0.1        0.13 =C2=B1 42%  perf-profile.self.cycl=
es-pp.__irq_exit_rcu
>       0.02 =C2=B1141%      +0.1        0.15 =C2=B1 40%  perf-profile.self=
.cycles-pp.get_next_timer_interrupt
>       0.02 =C2=B1141%      +0.1        0.15 =C2=B1 65%  perf-profile.self=
.cycles-pp.scheduler_tick
>       0.08 =C2=B1 30%      +0.1        0.21 =C2=B1 24%  perf-profile.self=
.cycles-pp.update_sg_lb_stats
>       0.15 =C2=B1 16%      +0.1        0.30 =C2=B1  2%  perf-profile.self=
.cycles-pp.__intel_pmu_enable_all
>       0.00            +0.1        0.15 =C2=B1 83%  perf-profile.self.cycl=
es-pp.tick_check_oneshot_broadcast_this_cpu
>       0.04 =C2=B1 71%      +0.2        0.20 =C2=B1 40%  perf-profile.self=
.cycles-pp.intel_idle
>       0.02 =C2=B1141%      +0.2        0.18 =C2=B1 34%  perf-profile.self=
.cycles-pp.check_cpu_stall
>       0.09 =C2=B1 10%      +0.2        0.26 =C2=B1 39%  perf-profile.self=
.cycles-pp.__hrtimer_run_queues
>       0.04 =C2=B1 71%      +0.2        0.21 =C2=B1 21%  perf-profile.self=
.cycles-pp.sysvec_apic_timer_interrupt
>       0.51 =C2=B1  4%      +0.2        0.69 =C2=B1 17%  perf-profile.self=
.cycles-pp.read_tsc
>       0.17 =C2=B1  2%      +0.2        0.36 =C2=B1 28%  perf-profile.self=
.cycles-pp.__hrtimer_next_event_base
>       0.37 =C2=B1 10%      +0.2        0.55 =C2=B1 21%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.12 =C2=B1 18%      +0.2        0.31 =C2=B1 23%  perf-profile.self=
.cycles-pp.update_irq_load_avg
>       0.07 =C2=B1 11%      +0.2        0.27 =C2=B1 28%  perf-profile.self=
.cycles-pp.update_process_times
>       0.14 =C2=B1 20%      +0.2        0.35 =C2=B1 35%  perf-profile.self=
.cycles-pp.tsc_verify_tsc_adjust
>       0.59 =C2=B1  7%      +0.2        0.80 =C2=B1  3%  perf-profile.self=
.cycles-pp.native_sched_clock
>       0.06 =C2=B1  7%      +0.2        0.28 =C2=B1 39%  perf-profile.self=
.cycles-pp.perf_mux_hrtimer_handler
>       0.15 =C2=B1 14%      +0.2        0.40 =C2=B1 19%  perf-profile.self=
.cycles-pp._raw_spin_trylock
>       0.27 =C2=B1  5%      +0.3        0.56 =C2=B1 31%  perf-profile.self=
.cycles-pp.tick_nohz_next_event
>       0.16 =C2=B1 10%      +0.3        0.49 =C2=B1 17%  perf-profile.self=
.cycles-pp.calc_global_load_tick
>       0.14 =C2=B1 13%      +0.3        0.47 =C2=B1 46%  perf-profile.self=
.cycles-pp.tick_sched_do_timer
>       0.25 =C2=B1 47%      +0.4        0.65 =C2=B1 22%  perf-profile.self=
.cycles-pp.ktime_get_update_offsets_now
>       0.54 =C2=B1  4%      +0.4        0.98 =C2=B1 20%  perf-profile.self=
.cycles-pp.lapic_next_deadline
>       0.33 =C2=B1  7%      +0.5        0.81 =C2=B1 15%  perf-profile.self=
.cycles-pp.arch_scale_freq_tick
>       1.01 =C2=B1 28%      +1.4        2.42 =C2=B1 22%  perf-profile.self=
.cycles-pp.menu_select
>       1.21 =C2=B1  4%      +1.6        2.80 =C2=B1 12%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>       1.64 =C2=B1 29%      +1.6        3.27 =C2=B1 36%  perf-profile.self=
.cycles-pp.ktime_get
>      39.10 =C2=B1  9%     +11.0       50.09 =C2=B1 12%  perf-profile.self=
.cycles-pp.mwait_idle_with_hints
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10G=
Hz (Cascade Lake) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/option_b/option_c/option_d/opt=
ion_e/option_f/rootfs/tbox_group/test/testcase/ucode:
>   gcc-11/performance/x86_64-rhel-8.3/Random Read/IO_uring/Yes/No/4KB/Defa=
ult Test Directory/debian-x86_64-phoronix/lkp-csl-2sp7/fio-1.14.1/phoronix-=
test-suite/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     214795           +17.1%     251444        phoronix-test-suite.fio.Ran=
domRead.IO_uring.Yes.No.4KB.DefaultTestDirectory.iops
>     838.67           +17.1%     982.00        phoronix-test-suite.fio.Ran=
domRead.IO_uring.Yes.No.4KB.DefaultTestDirectory.mb_s
>     454.31 =C2=B1  3%      -5.5%     429.29        phoronix-test-suite.ti=
me.elapsed_time
>     454.31 =C2=B1  3%      -5.5%     429.29        phoronix-test-suite.ti=
me.elapsed_time.max
>  5.496e+08 =C2=B1  3%     +10.8%  6.087e+08        phoronix-test-suite.ti=
me.file_system_inputs
>      90293 =C2=B1  3%    +265.2%     329759        phoronix-test-suite.ti=
me.involuntary_context_switches
>     249.33           -12.2%     219.00        phoronix-test-suite.time.pe=
rcent_of_cpu_this_job_got
>       1012 =C2=B1  4%     -18.7%     823.59        phoronix-test-suite.ti=
me.system_time
>  1.575e+08 =C2=B1  3%     +15.3%  1.817e+08        phoronix-test-suite.ti=
me.voluntary_context_switches
>      62165 =C2=B1 13%     -39.9%      37387 =C2=B1 47%  numa-numastat.nod=
e1.other_node
>      32.93            -1.0%      32.60        boot-time.boot
>       2590            -1.5%       2552        boot-time.idle
>       8.34            +1.9       10.20        mpstat.cpu.all.iowait%
>       0.42            -0.1        0.36 =C2=B1  6%  mpstat.cpu.all.soft%
>       3.19            -0.4        2.76        mpstat.cpu.all.sys%
>     599531           +17.1%     701823        vmstat.io.bi
>       2290 =C2=B1  3%      +5.6%       2418        vmstat.io.bo
>     191.67 =C2=B1 23%     -80.9%      36.67 =C2=B1 91%  vmstat.procs.r
>     988816           +19.3%    1179414        vmstat.system.cs
>     221273            +4.4%     230918        vmstat.system.in
>     788578           +10.2%     869113 =C2=B1  3%  meminfo.DirectMap4k
>       1525 =C2=B1 15%     -58.4%     635.00 =C2=B1 21%  meminfo.Dirty
>     545128           -38.4%     335710 =C2=B1  2%  meminfo.KernelStack
>     120091           +11.6%     134078 =C2=B1  3%  meminfo.Mapped
>     774241           -28.5%     553348        meminfo.SUnreclaim
>     889674           -24.7%     669489        meminfo.Slab
>     803090           -26.2%     592451        meminfo.VmallocUsed
>   42422019 =C2=B1  4%     +17.0%   49645901 =C2=B1  4%  turbostat.C1
>   92324554 =C2=B1  3%     -24.5%   69733570 =C2=B1 20%  turbostat.C1E
>      84.16           -34.7       49.46 =C2=B1 57%  turbostat.C1E%
>     948227 =C2=B1 35%   +2223.8%   22035221 =C2=B1 65%  turbostat.C6
>       1.60 =C2=B1 38%     +33.8       35.38 =C2=B1 77%  turbostat.C6%
>       0.13 =C2=B1 32%   +4884.2%       6.31 =C2=B1136%  turbostat.CPU%c6
>  1.409e+08 =C2=B1  3%     +12.8%   1.59e+08        turbostat.POLL
>       3.62            +0.6        4.24        turbostat.POLL%
>     278944            +5.2%     293522        proc-vmstat.nr_active_anon
>     382.00 =C2=B1 15%     -57.2%     163.33 =C2=B1 20%  proc-vmstat.nr_di=
rty
>     898447            +0.9%     906297        proc-vmstat.nr_file_pages
>     366206            -1.7%     360116        proc-vmstat.nr_inactive_file
>     545409           -38.4%     335955 =C2=B1  2%  proc-vmstat.nr_kernel_=
stack
>      29785 =C2=B1  2%     +12.7%      33557 =C2=B1  3%  proc-vmstat.nr_ma=
pped
>     471376            +3.2%     486519        proc-vmstat.nr_shmem
>     193581           -28.5%     138445        proc-vmstat.nr_slab_unrecla=
imable
>     278944            +5.2%     293522        proc-vmstat.nr_zone_active_=
anon
>     366206            -1.7%     360116        proc-vmstat.nr_zone_inactiv=
e_file
>     386.00 =C2=B1 16%     -53.9%     178.00 =C2=B1 13%  proc-vmstat.nr_zo=
ne_write_pending
>     240464           +19.4%     287162 =C2=B1 12%  proc-vmstat.numa_hint_=
faults
>     425932           +12.8%     480561 =C2=B1  5%  proc-vmstat.numa_pte_u=
pdates
>   25392508 =C2=B1  3%     +11.1%   28212966        proc-vmstat.pgactivate
>  2.748e+08 =C2=B1  3%     +10.8%  3.044e+08        proc-vmstat.pgpgin
>     329841 =C2=B1  3%      -4.2%     316049        proc-vmstat.pgreuse
>       1516 =C2=B1  9%     -53.6%     703.00 =C2=B1 29%  numa-meminfo.node=
0.Dirty
>    2457238 =C2=B1 21%     +28.0%    3144759 =C2=B1  4%  numa-meminfo.node=
0.FilePages
>    1493451 =C2=B1 29%     +41.8%    2118440 =C2=B1  7%  numa-meminfo.node=
0.Inactive
>     540748 =C2=B1 14%     +55.3%     839950 =C2=B1 21%  numa-meminfo.node=
0.Inactive(anon)
>     330260 =C2=B1  3%     -32.6%     222689 =C2=B1 16%  numa-meminfo.node=
0.KernelStack
>     450575 =C2=B1  4%     -23.6%     344450 =C2=B1  9%  numa-meminfo.node=
0.SUnreclaim
>    1365651 =C2=B1  8%     +24.1%    1694556 =C2=B1  9%  numa-meminfo.node=
0.Shmem
>     525312           -18.5%     428093 =C2=B1  6%  numa-meminfo.node0.Slab
>      43889 =C2=B1 30%    +110.0%      92156 =C2=B1 21%  numa-meminfo.node=
1.Active(anon)
>     101442 =C2=B1 20%     -40.7%      60167 =C2=B1 29%  numa-meminfo.node=
1.Active(file)
>    1137634 =C2=B1 45%     -58.6%     470869 =C2=B1 29%  numa-meminfo.node=
1.FilePages
>    1162004 =C2=B1 37%     -56.4%     506061 =C2=B1 31%  numa-meminfo.node=
1.Inactive
>     649704 =C2=B1 12%     -46.3%     349171 =C2=B1 51%  numa-meminfo.node=
1.Inactive(anon)
>     512300 =C2=B1 72%     -69.4%     156890 =C2=B1 29%  numa-meminfo.node=
1.Inactive(file)
>     215335 =C2=B1  4%     -47.5%     113001 =C2=B1 38%  numa-meminfo.node=
1.KernelStack
>    2292591 =C2=B1 18%     -37.6%    1430660 =C2=B1 19%  numa-meminfo.node=
1.MemUsed
>       2222 =C2=B1  2%     +17.9%       2619 =C2=B1  7%  numa-meminfo.node=
1.PageTables
>     324250 =C2=B1  5%     -35.4%     209465 =C2=B1 20%  numa-meminfo.node=
1.SUnreclaim
>     364954 =C2=B1  3%     -33.7%     242013 =C2=B1 15%  numa-meminfo.node=
1.Slab
>     375.33 =C2=B1  9%     -52.8%     177.33 =C2=B1 28%  numa-vmstat.node0=
.nr_dirty
>     614314 =C2=B1 21%     +28.3%     787979 =C2=B1  4%  numa-vmstat.node0=
.nr_file_pages
>     135188 =C2=B1 14%     +55.3%     209991 =C2=B1 21%  numa-vmstat.node0=
.nr_inactive_anon
>     329728 =C2=B1  3%     -32.4%     222849 =C2=B1 16%  numa-vmstat.node0=
.nr_kernel_stack
>       8.00 =C2=B1141%   +1000.0%      88.00 =C2=B1 65%  numa-vmstat.node0=
.nr_mlock
>     341417 =C2=B1  8%     +24.1%     423535 =C2=B1  9%  numa-vmstat.node0=
.nr_shmem
>     112492 =C2=B1  4%     -23.4%      86190 =C2=B1 10%  numa-vmstat.node0=
.nr_slab_unreclaimable
>      25.00 =C2=B1 45%    +297.3%      99.33 =C2=B1 53%  numa-vmstat.node0=
.nr_unevictable
>     135187 =C2=B1 14%     +55.3%     209990 =C2=B1 21%  numa-vmstat.node0=
.nr_zone_inactive_anon
>      25.00 =C2=B1 45%    +297.3%      99.33 =C2=B1 53%  numa-vmstat.node0=
.nr_zone_unevictable
>     381.67 =C2=B1  9%     -50.7%     188.33 =C2=B1 19%  numa-vmstat.node0=
.nr_zone_write_pending
>      10970 =C2=B1 30%    +110.3%      23068 =C2=B1 21%  numa-vmstat.node1=
.nr_active_anon
>      25636 =C2=B1 19%     -40.9%      15146 =C2=B1 30%  numa-vmstat.node1=
.nr_active_file
>     285031 =C2=B1 44%     -58.6%     118129 =C2=B1 29%  numa-vmstat.node1=
.nr_file_pages
>     162427 =C2=B1 12%     -46.3%      87276 =C2=B1 51%  numa-vmstat.node1=
.nr_inactive_anon
>     128410 =C2=B1 72%     -69.2%      39535 =C2=B1 30%  numa-vmstat.node1=
.nr_inactive_file
>     215408 =C2=B1  4%     -47.5%     113122 =C2=B1 38%  numa-vmstat.node1=
.nr_kernel_stack
>     167.00 =C2=B1  7%     -61.7%      64.00 =C2=B1 88%  numa-vmstat.node1=
.nr_mlock
>     554.00 =C2=B1  2%     +18.3%     655.33 =C2=B1  7%  numa-vmstat.node1=
.nr_page_table_pages
>      81131 =C2=B1  5%     -35.4%      52397 =C2=B1 21%  numa-vmstat.node1=
.nr_slab_unreclaimable
>     167.00 =C2=B1  7%     -58.3%      69.67 =C2=B1 75%  numa-vmstat.node1=
.nr_unevictable
>      10971 =C2=B1 30%    +110.3%      23069 =C2=B1 21%  numa-vmstat.node1=
.nr_zone_active_anon
>      25636 =C2=B1 19%     -40.9%      15146 =C2=B1 30%  numa-vmstat.node1=
.nr_zone_active_file
>     162426 =C2=B1 12%     -46.3%      87276 =C2=B1 51%  numa-vmstat.node1=
.nr_zone_inactive_anon
>     128410 =C2=B1 72%     -69.2%      39536 =C2=B1 30%  numa-vmstat.node1=
.nr_zone_inactive_file
>     167.00 =C2=B1  7%     -58.3%      69.67 =C2=B1 75%  numa-vmstat.node1=
.nr_zone_unevictable
>      62165 =C2=B1 13%     -39.9%      37387 =C2=B1 47%  numa-vmstat.node1=
.numa_other
>  2.123e+09           +13.2%  2.405e+09        perf-stat.i.branch-instruct=
ions
>   19588804           +24.7%   24433163 =C2=B1 15%  perf-stat.i.branch-mis=
ses
>   19007222           +11.6%   21208437 =C2=B1  2%  perf-stat.i.cache-miss=
es
>     997360           +19.5%    1191735        perf-stat.i.context-switches
>  2.495e+10            +6.8%  2.665e+10 =C2=B1  2%  perf-stat.i.cpu-cycles
>      21481            -8.6%      19632 =C2=B1  2%  perf-stat.i.cpu-migrat=
ions
>       2713 =C2=B1  3%     -26.9%       1984 =C2=B1 24%  perf-stat.i.cycle=
s-between-cache-misses
>  2.543e+09           +15.3%  2.931e+09 =C2=B1  2%  perf-stat.i.dTLB-loads
>  1.297e+09           +13.4%  1.471e+09        perf-stat.i.dTLB-stores
>      62.37            +3.1       65.45 =C2=B1  3%  perf-stat.i.iTLB-load-=
miss-rate%
>    5300228 =C2=B1  2%     +11.2%    5893415        perf-stat.i.iTLB-load-=
misses
>  9.455e+09           +13.0%  1.069e+10        perf-stat.i.instructions
>     259852            +6.8%     277400 =C2=B1  2%  perf-stat.i.metric.GHz
>   63889486           +13.4%   72439368        perf-stat.i.metric.M/sec
>       5007            +4.8%       5247        perf-stat.i.minor-faults
>      27.54            -2.3       25.25 =C2=B1  6%  perf-stat.i.node-store=
-miss-rate%
>    3580501            +6.0%    3794825        perf-stat.i.node-stores
>       5032            +4.8%       5272        perf-stat.i.page-faults
>      16.89           -23.7%      12.88 =C2=B1 13%  perf-stat.overall.MPKI
>      11.90            +3.7       15.64 =C2=B1 11%  perf-stat.overall.cach=
e-miss-rate%
>       2.64            -5.5%       2.49 =C2=B1  2%  perf-stat.overall.cpi
>       1313            -4.3%       1256        perf-stat.overall.cycles-be=
tween-cache-misses
>      68.28            +2.2       70.47 =C2=B1  2%  perf-stat.overall.iTLB=
-load-miss-rate%
>       0.38            +5.9%       0.40 =C2=B1  2%  perf-stat.overall.ipc
>  2.118e+09           +13.2%  2.398e+09        perf-stat.ps.branch-instruc=
tions
>   19545455           +24.7%   24371121 =C2=B1 15%  perf-stat.ps.branch-mi=
sses
>   18959296           +11.6%   21150062 =C2=B1  2%  perf-stat.ps.cache-mis=
ses
>     994741           +19.5%    1188355        perf-stat.ps.context-switch=
es
>   2.49e+10            +6.7%  2.658e+10 =C2=B1  2%  perf-stat.ps.cpu-cycles
>      21426            -8.6%      19577 =C2=B1  2%  perf-stat.ps.cpu-migra=
tions
>  2.536e+09           +15.2%  2.923e+09 =C2=B1  2%  perf-stat.ps.dTLB-loads
>  1.294e+09           +13.4%  1.467e+09        perf-stat.ps.dTLB-stores
>    5286527 =C2=B1  2%     +11.2%    5877369        perf-stat.ps.iTLB-load=
-misses
>  9.432e+09           +13.0%  1.066e+10        perf-stat.ps.instructions
>       4997            +4.8%       5237        perf-stat.ps.minor-faults
>    3571395            +6.0%    3784169        perf-stat.ps.node-stores
>       5022            +4.8%       5262        perf-stat.ps.page-faults
>  4.297e+12 =C2=B1  3%      +6.8%  4.587e+12        perf-stat.total.instru=
ctions
>       5127 =C2=B1 14%     -55.9%       2262 =C2=B1 35%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>     226276 =C2=B1 16%     -44.3%     126022 =C2=B1 20%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>      31977 =C2=B1 15%     -49.7%      16096 =C2=B1 27%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>       0.27 =C2=B1 26%     -66.5%       0.09 =C2=B1 21%  sched_debug.cfs_r=
q:/.h_nr_running.avg
>      17.29 =C2=B1 31%     -81.0%       3.29 =C2=B1 38%  sched_debug.cfs_r=
q:/.h_nr_running.max
>       1.96 =C2=B1 30%     -76.7%       0.46 =C2=B1 30%  sched_debug.cfs_r=
q:/.h_nr_running.stddev
>      34263 =C2=B1  5%     -20.1%      27369 =C2=B1 16%  sched_debug.cfs_r=
q:/.load.avg
>       5127 =C2=B1 14%     -55.9%       2262 =C2=B1 35%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>     226276 =C2=B1 16%     -44.3%     126022 =C2=B1 20%  sched_debug.cfs_r=
q:/.max_vruntime.max
>      31977 =C2=B1 15%     -49.7%      16096 =C2=B1 27%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>     333979 =C2=B1  2%     -19.3%     269618        sched_debug.cfs_rq:/.m=
in_vruntime.avg
>     472182 =C2=B1  5%     -12.6%     412771 =C2=B1  8%  sched_debug.cfs_r=
q:/.min_vruntime.max
>     258061           -34.3%     169542 =C2=B1  7%  sched_debug.cfs_rq:/.m=
in_vruntime.min
>      39472 =C2=B1 12%     +63.6%      64587 =C2=B1 24%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.08 =C2=B1  7%     -12.5%       0.07 =C2=B1  6%  sched_debug.cfs_r=
q:/.nr_running.avg
>       0.28 =C2=B1  2%      -7.7%       0.26 =C2=B1  3%  sched_debug.cfs_r=
q:/.nr_running.stddev
>       4.62 =C2=B1 64%     +95.3%       9.02 =C2=B1 29%  sched_debug.cfs_r=
q:/.removed.load_avg.avg
>       2.04 =C2=B1 56%    +116.5%       4.41 =C2=B1 30%  sched_debug.cfs_r=
q:/.removed.runnable_avg.avg
>      13.25 =C2=B1 50%     +71.1%      22.67 =C2=B1 34%  sched_debug.cfs_r=
q:/.removed.runnable_avg.stddev
>       2.04 =C2=B1 56%    +116.5%       4.41 =C2=B1 30%  sched_debug.cfs_r=
q:/.removed.util_avg.avg
>      13.25 =C2=B1 50%     +71.1%      22.67 =C2=B1 34%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>     280.88 =C2=B1  8%     -11.6%     248.27 =C2=B1  3%  sched_debug.cfs_r=
q:/.runnable_avg.avg
>       2032 =C2=B1 25%     -38.1%       1259 =C2=B1  4%  sched_debug.cfs_r=
q:/.runnable_avg.max
>      39581 =C2=B1 12%     +63.3%      64645 =C2=B1 24%  sched_debug.cfs_r=
q:/.spread0.stddev
>      27.73 =C2=B1 17%     -29.2%      19.65 =C2=B1 16%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>       1346 =C2=B1 12%     -44.1%     753.58 =C2=B1 17%  sched_debug.cfs_r=
q:/.util_est_enqueued.max
>     166.36 =C2=B1 16%     -37.2%     104.51 =C2=B1 15%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>     134.43 =C2=B1  7%     -24.3%     101.70 =C2=B1  7%  sched_debug.cpu.c=
lock.stddev
>     216.87 =C2=B1  8%    +117.9%     472.48 =C2=B1 59%  sched_debug.cpu.c=
lock_task.stddev
>      53016 =C2=B1  7%     -50.6%      26185 =C2=B1 35%  sched_debug.cpu.c=
urr->pid.avg
>    1447332           -39.0%     883105 =C2=B1  2%  sched_debug.cpu.curr->=
pid.max
>     257945 =C2=B1  4%     -45.9%     139495 =C2=B1 16%  sched_debug.cpu.c=
urr->pid.stddev
>     132196 =C2=B1 22%     +36.0%     179809 =C2=B1 17%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>       0.00 =C2=B1  7%     -24.4%       0.00 =C2=B1  7%  sched_debug.cpu.n=
ext_balance.stddev
>       0.25 =C2=B1 25%     -69.9%       0.07 =C2=B1 20%  sched_debug.cpu.n=
r_running.avg
>      17.38 =C2=B1 31%     -80.3%       3.42 =C2=B1 38%  sched_debug.cpu.n=
r_running.max
>       1.88 =C2=B1 30%     -77.4%       0.43 =C2=B1 30%  sched_debug.cpu.n=
r_running.stddev
>    2046736           +20.4%    2464897        sched_debug.cpu.nr_switches=
.avg
>    3286836 =C2=B1  7%     +38.0%    4534899 =C2=B1 14%  sched_debug.cpu.n=
r_switches.max
>       2.05            -1.5        0.58 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_temp=
late.ttwu_do_wakeup.try_to_wake_up
>       3.51 =C2=B1  4%      -1.4        2.13 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_se=
condary
>       3.52 =C2=B1  4%      -1.4        2.15 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       2.09 =C2=B1  3%      -1.1        0.99        perf-profile.calltrace=
.cycles-pp.__softirqentry_text_start.run_ksoftirqd.smpboot_thread_fn.kthrea=
d.ret_from_fork
>       2.09 =C2=B1  2%      -1.1        1.01 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.run_ksoftirqd.smpboot_thread_fn.kthread.ret_from_fork
>       3.35 =C2=B1  2%      -1.0        2.35 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.smpboot_thread_fn.kthread.ret_from_fork
>       6.16 =C2=B1  8%      -1.0        5.17 =C2=B1 12%  perf-profile.call=
trace.cycles-pp.do_exit.io_wqe_worker.ret_from_fork
>       1.49            -0.9        0.58 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__read_end_io.blk_update_request.blk_mq_end_request.blk_complete=
_reqs.__softirqentry_text_start
>       1.55            -0.9        0.65 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.blk_update_request.blk_mq_end_request.blk_complete_reqs.__softir=
qentry_text_start.run_ksoftirqd
>       1.55            -0.9        0.66        perf-profile.calltrace.cycl=
es-pp.blk_mq_end_request.blk_complete_reqs.__softirqentry_text_start.run_ks=
oftirqd.smpboot_thread_fn
>       1.64            -0.9        0.74 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.blk_complete_reqs.__softirqentry_text_start.run_ksoftirqd.smpboo=
t_thread_fn.kthread
>       3.08 =C2=B1 28%      -0.8        2.23 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle=
_enter.cpuidle_idle_call.do_idle
>       2.87 =C2=B1 30%      -0.8        2.03 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt=
.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call
>       8.05            -0.8        7.23        perf-profile.calltrace.cycl=
es-pp.kthread.ret_from_fork
>       2.73            -0.8        1.93 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.io_wqe_activate_free_worker.io_wqe_enqueue.io_queue_iowq.io_subm=
it_sqe.io_submit_sqes
>       2.62            -0.8        1.84 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.try_to_wake_up.io_wqe_activate_free_worker.io_wqe_enqueue.io_que=
ue_iowq.io_submit_sqe
>       2.80            -0.8        2.03 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.io_wqe_enqueue.io_queue_iowq.io_submit_sqe.io_submit_sqes.__do_s=
ys_io_uring_enter
>       2.83            -0.8        2.07 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.io_queue_iowq.io_submit_sqe.io_submit_sqes.__do_sys_io_uring_ent=
er.do_syscall_64
>       2.92            -0.8        2.15 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.io_submit_sqe.io_submit_sqes.__do_sys_io_uring_enter.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
>       2.95            -0.8        2.19 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.io_submit_sqes.__do_sys_io_uring_enter.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe
>       1.86 =C2=B1  2%      -0.7        1.16 =C2=B1  5%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.io_worker_handle_work.io_wqe_worker.ret_from=
_fork
>       1.71 =C2=B1  2%      -0.7        1.01 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.io_worker_h=
andle_work.io_wqe_worker.ret_from_fork
>       4.64            -0.6        4.02 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.__do_sys_io_uring_enter.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame
>       5.77            -0.5        5.23 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.entry_SYSCALL_64_after_hwframe
>       5.76            -0.5        5.22 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       3.25 =C2=B1  5%      -0.5        2.71 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__libc_write
>       3.09 =C2=B1  5%      -0.5        2.59 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>       3.05 =C2=B1  5%      -0.5        2.56 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.generic_file_write_iter.new_sync_write.vfs_write.ksys_write=
.do_syscall_64
>       2.90 =C2=B1  5%      -0.5        2.44 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.__generic_file_write_iter.generic_file_write_iter.new_sync_=
write.vfs_write.ksys_write
>       2.82 =C2=B1  5%      -0.4        2.38 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.generic_perform_write.__generic_file_write_iter.generic_fil=
e_write_iter.new_sync_write.vfs_write
>       1.37 =C2=B1  6%      -0.4        0.95        perf-profile.calltrace=
.cycles-pp.__wake_up_common_lock.kiocb_done.io_read.io_issue_sqe.io_wq_subm=
it_work
>       1.50 =C2=B1  5%      -0.4        1.09 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.kiocb_done.io_read.io_issue_sqe.io_wq_submit_work.io_worker=
_handle_work
>       1.14 =C2=B1  6%      -0.4        0.77 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__wake_up_common.__wake_up_common_lock.kiocb_done.io_read.i=
o_issue_sqe
>       1.12 =C2=B1  6%      -0.4        0.75        perf-profile.calltrace=
.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.=
kiocb_done.io_read
>       1.11 =C2=B1  6%      -0.4        0.75        perf-profile.calltrace=
.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_=
up_common_lock.kiocb_done
>       1.43 =C2=B1  3%      -0.3        1.13 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.schedule.schedule_hrtimeout_range_clock.io_cqring_wait.__do=
_sys_io_uring_enter.do_syscall_64
>       1.44 =C2=B1  3%      -0.3        1.14 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.schedule_hrtimeout_range_clock.io_cqring_wait.__do_sys_io_u=
ring_enter.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       1.42 =C2=B1  3%      -0.3        1.13 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.schedule_hrtimeout_range_clock.io_cqrin=
g_wait.__do_sys_io_uring_enter
>       0.62 =C2=B1  3%      -0.3        0.36 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.s=
chedule_hrtimeout_range_clock
>       0.62 =C2=B1  3%      -0.3        0.36 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_switch.__schedule.schedule.schedule_hrtime=
out_range_clock.io_cqring_wait
>       1.29 =C2=B1 22%      -0.3        1.03 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.sta=
rt_secondary
>       2.04            -0.2        1.80 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_event.pe=
rf_trace_sched_wakeup_template.ttwu_do_wakeup
>       0.69 =C2=B1  4%      -0.2        0.54 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedu=
le_hrtimeout_range_clock
>       0.69 =C2=B1  4%      -0.1        0.55 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_hrtimeout_ra=
nge_clock.io_cqring_wait
>       0.57 =C2=B1  4%      +0.1        0.62 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.smpboo=
t_thread_fn
>       0.68 =C2=B1  3%      +0.1        0.73 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__schedule.__cond_resched.loop_process_work.process_one_wor=
k.worker_thread
>       0.59 =C2=B1  3%      +0.1        0.64 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.dequeue_task_fair.__schedule.schedule.smpboot_thread_fn.kth=
read
>       0.69 =C2=B1  3%      +0.1        0.75 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__cond_resched.loop_process_work.process_one_work.worker_th=
read.kthread
>       0.59 =C2=B1  2%      +0.1        0.65 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.ttwu_do_wakeup.try_to_wake_up.raise_softirq.blk_mq_complete=
_request_remote.blk_mq_complete_request
>       0.56 =C2=B1  2%      +0.1        0.62 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_wakeup_template.ttwu_do_wakeup.try_to_wake=
_up.raise_softirq.blk_mq_complete_request_remote
>       0.59 =C2=B1  7%      +0.1        0.70        perf-profile.calltrace=
.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_runtim=
e.update_curr.enqueue_entity
>       0.61 =C2=B1  7%      +0.1        0.73        perf-profile.calltrace=
.cycles-pp.perf_trace_sched_stat_runtime.update_curr.enqueue_entity.enqueue=
_task_fair.ttwu_do_activate
>       0.60 =C2=B1  7%      +0.1        0.72        perf-profile.calltrace=
.cycles-pp.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.enqueue_=
entity.enqueue_task_fair
>       0.72 =C2=B1  4%      +0.1        0.84 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.read_pages.page_cache_ra_unbounded.force_page_cache_ra.file=
map_get_pages.filemap_read
>       0.62 =C2=B1  6%      +0.1        0.75        perf-profile.calltrace=
.cycles-pp.update_curr.enqueue_entity.enqueue_task_fair.ttwu_do_activate.tr=
y_to_wake_up
>       0.71 =C2=B1  6%      +0.1        0.84        perf-profile.calltrace=
.cycles-pp.ttwu_do_activate.try_to_wake_up.raise_softirq.blk_mq_complete_re=
quest_remote.blk_mq_complete_request
>       0.68 =C2=B1  7%      +0.1        0.81        perf-profile.calltrace=
.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.try_to_wake_up=
.raise_softirq
>       0.70 =C2=B1  7%      +0.1        0.83        perf-profile.calltrace=
.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.raise_softirq.=
blk_mq_complete_request_remote
>       1.40            +0.2        1.58 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.raise_softirq.blk_mq_complete_request_remote.blk_mq_complete_req=
uest.loop_process_work.process_one_work
>       1.45            +0.2        1.64 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.blk_mq_complete_request.loop_process_work.process_one_work.worke=
r_thread.kthread
>       1.44            +0.2        1.64 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.blk_mq_complete_request_remote.blk_mq_complete_request.loop_proc=
ess_work.process_one_work.worker_thread
>       1.35 =C2=B1  3%      +0.2        1.55 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.raise_softirq.blk_mq_complete_request_remote=
.blk_mq_complete_request.loop_process_work
>       1.13 =C2=B1  5%      +0.2        1.33 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.page_cache_ra_unbounded.force_page_cache_ra.filemap_get_pag=
es.filemap_read.io_read
>       1.14 =C2=B1  5%      +0.2        1.35 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.force_page_cache_ra.filemap_get_pages.filemap_read.io_read.=
io_issue_sqe
>       1.65 =C2=B1  7%      +0.2        1.89 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.io=
_wqe_worker
>       0.92 =C2=B1  3%      +0.3        1.19 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.update_curr.pick_next_task_fair.__schedule.schedule.schedul=
e_timeout
>       0.85 =C2=B1  2%      +0.3        1.12 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.pic=
k_next_task_fair.__schedule
>       0.87 =C2=B1  2%      +0.3        1.14 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_stat_runtime.update_curr.pick_next_task_fa=
ir.__schedule.schedule
>       0.84 =C2=B1  2%      +0.3        1.11 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_r=
untime.update_curr.pick_next_task_fair
>       3.25            +0.3        3.56 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.loop_process_work.process_one_work.worker_thread.kthread.ret_fro=
m_fork
>       2.35 =C2=B1  8%      +0.3        2.70 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_id=
le_call.do_idle
>       1.51 =C2=B1 10%      +0.3        1.85 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.mwait_idle_with_hints.intel=
_idle_irq.cpuidle_enter_state.cpuidle_enter
>       1.09 =C2=B1  2%      +0.5        1.58 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_switch.__schedule.schedule.io_schedule.fol=
io_wait_bit_common
>       1.42            +0.5        1.91 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.io_schedule
>       1.07 =C2=B1  2%      +0.5        1.57 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.i=
o_schedule
>       1.44            +0.5        1.95 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.dequeue_task_fair.__schedule.schedule.io_schedule.folio_wait_bit=
_common
>       1.13            +0.6        1.77 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_ti=
meout
>      13.05 =C2=B1  4%      +0.6       13.69        perf-profile.calltrace=
.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do=
_idle
>       0.88 =C2=B1  3%      +0.6        1.53        perf-profile.calltrace=
.cycles-pp.perf_trace_sched_switch.__schedule.schedule.schedule_timeout.io_=
wqe_worker
>       0.87 =C2=B1  4%      +0.6        1.51        perf-profile.calltrace=
.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.schedu=
le_timeout
>       1.16            +0.6        1.80 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.io_wqe_wo=
rker
>       2.96            +0.7        3.68 =C2=B1  8%  perf-profile.calltrace=
.cycles-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_overf=
low.perf_tp_event.perf_trace_sched_switch
>       3.15 =C2=B1  6%      +0.8        4.00 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_stat_runtime.update_curr.dequeue_entity.de=
queue_task_fair.__schedule
>       3.45            +0.9        4.30 =C2=B1  7%  perf-profile.calltrace=
.cycles-pp.update_curr.dequeue_entity.dequeue_task_fair.__schedule.schedule
>       2.52            +0.9        3.39 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_switch.__sc=
hedule.schedule
>       3.07 =C2=B1  6%      +0.9        3.95 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_stat_runtime.update_curr.deq=
ueue_entity.dequeue_task_fair
>       3.51 =C2=B1  3%      +1.0        4.47 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.io_schedule.folio_wait_bit_common.filem=
ap_update_page
>       7.43            +1.0        8.42 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.io_wq_submit_work.io_worker_handle_work.io_wqe_worker.ret_from_f=
ork
>       7.35            +1.0        8.35 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.io_read.io_issue_sqe.io_wq_submit_work.io_worker_handle_work.io_=
wqe_worker
>       7.35            +1.0        8.36 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.io_issue_sqe.io_wq_submit_work.io_worker_handle_work.io_wqe_work=
er.ret_from_fork
>       3.60 =C2=B1  3%      +1.1        4.71 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.schedule.io_schedule.folio_wait_bit_common.filemap_update_p=
age.filemap_get_pages
>       3.62 =C2=B1  3%      +1.1        4.75 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.io_schedule.folio_wait_bit_common.filemap_update_page.filem=
ap_get_pages.filemap_read
>       3.72 =C2=B1  2%      +1.1        4.86 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.folio_wait_bit_common.filemap_update_page.filemap_get_pages=
.filemap_read.io_read
>       3.78 =C2=B1  2%      +1.2        4.93 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.filemap_update_page.filemap_get_pages.filemap_read.io_read.=
io_issue_sqe
>       3.69            +1.2        4.86 =C2=B1 11%  perf-profile.calltrace=
.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_event.pe=
rf_trace_sched_switch.__schedule
>       2.69 =C2=B1  2%      +1.2        3.88 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_stat_r=
untime.update_curr.dequeue_entity
>       0.00            +1.2        1.23 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_wakeup_temp=
late.ttwu_do_wakeup.sched_ttwu_pending
>       0.00            +1.3        1.29 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.perf_tp_event.perf_trace_sched_wakeup_template.ttwu_do_wakeup.sc=
hed_ttwu_pending.flush_smp_call_function_queue
>       3.03 =C2=B1  2%      +1.3        4.33 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_=
overflow.perf_tp_event.perf_trace_sched_stat_runtime
>       0.00            +1.3        1.34 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.perf_trace_sched_wakeup_template.ttwu_do_wakeup.sched_ttwu_pendi=
ng.flush_smp_call_function_queue.do_idle
>       0.00            +1.4        1.37 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.ttwu_do_wakeup.sched_ttwu_pending.flush_smp_call_function_queue.=
do_idle.cpu_startup_entry
>       5.22            +1.4        6.60 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.filemap_get_pages.filemap_read.io_read.io_issue_sqe.io_wq_submit=
_work
>       5.76 =C2=B1  2%      +1.4        7.17 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.filemap_read.io_read.io_issue_sqe.io_wq_submit_work.io_work=
er_handle_work
>       4.12 =C2=B1  3%      +1.5        5.63 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.schedule_timeout.io_wqe_worker.ret_from=
_fork
>       4.16 =C2=B1  3%      +1.5        5.67 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.schedule.schedule_timeout.io_wqe_worker.ret_from_fork
>       4.33 =C2=B1  3%      +1.5        5.87 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.schedule_timeout.io_wqe_worker.ret_from_fork
>       4.09            +1.6        5.68 =C2=B1  6%  perf-profile.calltrace=
.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_event.pe=
rf_trace_sched_stat_runtime.update_curr
>       1.20            +1.8        3.02 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.perf_callchain_kernel.get_perf_callchain.perf_callchain.perf_pre=
pare_sample.perf_event_output_forward
>       0.00            +1.9        1.86 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_sta=
rtup_entry.start_secondary
>       0.00            +1.9        1.89 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.__get_user_nocheck_8.perf_callchain_user.get_perf_callchain.perf=
_callchain.perf_prepare_sample
>       6.42            +2.1        8.50 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.get_perf_callchain.perf_callchain.perf_prepare_sample.perf_event=
_output_forward.__perf_event_overflow
>       6.43            +2.1        8.53 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.perf_callchain.perf_prepare_sample.perf_event_output_forward.__p=
erf_event_overflow.perf_tp_event
>       0.00            +2.1        2.10 =C2=B1  4%  perf-profile.calltrace=
.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_se=
condary.secondary_startup_64_no_verify
>       0.68 =C2=B1 70%      +3.3        3.94        perf-profile.calltrace=
.cycles-pp.perf_callchain_user.get_perf_callchain.perf_callchain.perf_prepa=
re_sample.perf_event_output_forward
>      11.59 =C2=B1  2%      -2.9        8.67 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       7.09 =C2=B1  2%      -2.1        4.95 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       3.01 =C2=B1 14%      -1.9        1.12 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.__libc_start_main
>       6.79 =C2=B1  2%      -1.7        5.04 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       3.13 =C2=B1  8%      -1.5        1.68        perf-profile.children.=
cycles-pp.__softirqentry_text_start
>       3.54 =C2=B1  4%      -1.4        2.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       2.46 =C2=B1  4%      -1.3        1.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>       2.09 =C2=B1  2%      -1.1        1.01 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.run_ksoftirqd
>       3.87 =C2=B1 27%      -1.1        2.81 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.sysvec_apic_timer_interrupt
>       3.35 =C2=B1  2%      -1.0        2.35 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.smpboot_thread_fn
>       6.18 =C2=B1  8%      -1.0        5.19 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.do_exit
>       1.42            -0.9        0.50 =C2=B1  3%  perf-profile.children.=
cycles-pp.folio_wake_bit
>       9.61            -0.9        8.70 =C2=B1  4%  perf-profile.children.=
cycles-pp.entry_SYSCALL_64_after_hwframe
>       1.49            -0.9        0.58 =C2=B1  2%  perf-profile.children.=
cycles-pp.__read_end_io
>       9.56            -0.9        8.66 =C2=B1  4%  perf-profile.children.=
cycles-pp.do_syscall_64
>       1.55            -0.9        0.65 =C2=B1  2%  perf-profile.children.=
cycles-pp.blk_update_request
>       1.29 =C2=B1  3%      -0.9        0.39        perf-profile.children.=
cycles-pp.wake_page_function
>       1.55            -0.9        0.66        perf-profile.children.cycle=
s-pp.blk_mq_end_request
>       1.64            -0.9        0.75 =C2=B1  3%  perf-profile.children.=
cycles-pp.blk_complete_reqs
>       8.05            -0.8        7.23        perf-profile.children.cycle=
s-pp.kthread
>       2.73            -0.8        1.93 =C2=B1  4%  perf-profile.children.=
cycles-pp.io_wqe_activate_free_worker
>       2.80            -0.8        2.03 =C2=B1  4%  perf-profile.children.=
cycles-pp.io_wqe_enqueue
>       2.83            -0.8        2.07 =C2=B1  4%  perf-profile.children.=
cycles-pp.io_queue_iowq
>       2.92            -0.8        2.15 =C2=B1  3%  perf-profile.children.=
cycles-pp.io_submit_sqe
>       2.95            -0.8        2.19 =C2=B1  3%  perf-profile.children.=
cycles-pp.io_submit_sqes
>       4.64            -0.6        4.02 =C2=B1  4%  perf-profile.children.=
cycles-pp.__do_sys_io_uring_enter
>       0.91 =C2=B1 44%      -0.4        0.48 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       1.38 =C2=B1  6%      -0.4        0.96        perf-profile.children.=
cycles-pp.__wake_up_common_lock
>       1.50 =C2=B1  5%      -0.4        1.09 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.kiocb_done
>       1.15 =C2=B1 23%      -0.4        0.78        perf-profile.children.=
cycles-pp.__irq_exit_rcu
>       1.13 =C2=B1  7%      -0.4        0.76        perf-profile.children.=
cycles-pp.autoremove_wake_function
>       1.45 =C2=B1  3%      -0.3        1.14 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.schedule_hrtimeout_range_clock
>       0.59 =C2=B1 19%      -0.3        0.31 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.rcu_core
>       1.31 =C2=B1 23%      -0.3        1.04 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.menu_select
>       0.39 =C2=B1 30%      -0.3        0.14 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.free_unref_page
>       0.50 =C2=B1 21%      -0.3        0.25 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.rcu_do_batch
>       0.38 =C2=B1 32%      -0.3        0.13 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.__unfreeze_partials
>       0.42 =C2=B1 27%      -0.2        0.18 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.free_pcppages_bulk
>       0.47 =C2=B1 24%      -0.2        0.23 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       2.74 =C2=B1  2%      -0.2        2.51 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ttwu_do_wakeup
>       0.63 =C2=B1 36%      -0.2        0.42 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       0.51 =C2=B1 42%      -0.2        0.31 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       1.20 =C2=B1  3%      -0.2        1.01 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.asm_exc_page_fault
>       0.37 =C2=B1  4%      -0.2        0.21 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.33 =C2=B1  6%      -0.1        0.18 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.47 =C2=B1  2%      -0.1        0.39 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       0.36 =C2=B1 12%      -0.1        0.29 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.run_timer_softirq
>       0.23 =C2=B1 21%      -0.1        0.16 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.update_blocked_averages
>       0.11 =C2=B1  4%      -0.1        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.tick_nohz_idle_exit
>       0.36 =C2=B1 11%      -0.1        0.29 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__run_timers
>       0.12            -0.1        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.check_preempt_curr
>       0.38 =C2=B1  5%      -0.1        0.32 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.exc_page_fault
>       0.13 =C2=B1 43%      -0.1        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.run_rebalance_domains
>       0.10 =C2=B1 16%      -0.0        0.06 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.switch_mm_irqs_off
>       0.19 =C2=B1  4%      -0.0        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.kernelmode_fixup_or_oops
>       0.14 =C2=B1  5%      -0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.search_extable
>       0.13 =C2=B1  3%      -0.0        0.09 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.bsearch
>       0.14 =C2=B1  3%      -0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.search_exception_tables
>       0.15 =C2=B1 17%      -0.0        0.12        perf-profile.children.=
cycles-pp.lapic_next_deadline
>       0.14 =C2=B1  6%      -0.0        0.10 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.vfs_read
>       0.07 =C2=B1  7%      -0.0        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.cmp_ex_search
>       0.17 =C2=B1  4%      -0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.fixup_exception
>       0.12 =C2=B1 21%      -0.0        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__update_blocked_fair
>       0.12 =C2=B1  8%      -0.0        0.08 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.read
>       0.18 =C2=B1  9%      -0.0        0.15 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.sched_move_task
>       0.14 =C2=B1  6%      -0.0        0.11 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.ksys_read
>       0.10 =C2=B1 12%      -0.0        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.seq_read_iter
>       0.21 =C2=B1  7%      -0.0        0.19 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__list_del_entry_valid
>       0.10 =C2=B1  9%      -0.0        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.seq_read
>       0.09 =C2=B1 14%      -0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.12 =C2=B1  8%      -0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.get_next_timer_interrupt
>       0.08 =C2=B1 10%      -0.0        0.06 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.10            +0.0        0.11 =C2=B1  4%  perf-profile.children.=
cycles-pp.blk_mq_get_tag
>       0.09            +0.0        0.10 =C2=B1  4%  perf-profile.children.=
cycles-pp.sbitmap_get
>       0.05            +0.0        0.06 =C2=B1  7%  perf-profile.children.=
cycles-pp.__slab_free
>       0.06 =C2=B1  7%      +0.0        0.08 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__mod_timer
>       0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__blk_mq_alloc_requests
>       0.08 =C2=B1 10%      +0.0        0.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.rcu_idle_exit
>       0.12 =C2=B1  6%      +0.0        0.14 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.core_kernel_text
>       0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.io_wq_free_work.cold
>       0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.io_free_req
>       0.06 =C2=B1 14%      +0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.wake_affine
>       0.07 =C2=B1  6%      +0.0        0.10 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.__pagevec_lru_add_fn
>       0.11 =C2=B1  8%      +0.0        0.13 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.workingset_age_nonresident
>       0.34            +0.0        0.37 =C2=B1  3%  perf-profile.children.=
cycles-pp.__perf_event_header__init_id
>       0.07 =C2=B1  7%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.alloc_vmap_area
>       0.20 =C2=B1  6%      +0.0        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__switch_to
>       0.20 =C2=B1  4%      +0.0        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.blk_mq_submit_bio
>       0.08 =C2=B1  6%      +0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.arch_dup_task_struct
>       0.10 =C2=B1  8%      +0.0        0.13 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__pagevec_lru_add
>       0.08 =C2=B1 10%      +0.0        0.11 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__get_vm_area_node
>       0.04 =C2=B1 71%      +0.0        0.07 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.down_read
>       0.11            +0.0        0.15 =C2=B1  3%  perf-profile.children.=
cycles-pp.folio_add_lru
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc_node
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.put_prev_entity
>       0.18 =C2=B1 13%      +0.0        0.23 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__filemap_add_folio
>       0.14 =C2=B1  3%      +0.0        0.18 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.loop_queue_work
>       0.43 =C2=B1  8%      +0.0        0.48        perf-profile.children.=
cycles-pp.sched_clock_cpu
>       0.02 =C2=B1141%      +0.1        0.07 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.xas_start
>       0.08            +0.1        0.13 =C2=B1  3%  perf-profile.children.=
cycles-pp.clear_page_erms
>       0.15 =C2=B1  5%      +0.1        0.21 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.update_sg_wakeup_stats
>       0.23 =C2=B1  3%      +0.1        0.29 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.blk_mq_plug_issue_direct
>       0.21 =C2=B1  2%      +0.1        0.27 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.loop_queue_rq
>       0.76            +0.1        0.82 =C2=B1  4%  perf-profile.children.=
cycles-pp.orc_find
>       0.25 =C2=B1  6%      +0.1        0.31 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.filemap_add_folio
>       0.24 =C2=B1  3%      +0.1        0.30 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__blk_flush_plug
>       0.24 =C2=B1  3%      +0.1        0.30 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.blk_mq_flush_plug_list
>       0.24            +0.1        0.31 =C2=B1  5%  perf-profile.children.=
cycles-pp.blk_finish_plug
>       0.15 =C2=B1  3%      +0.1        0.22 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.find_idlest_group
>       0.13 =C2=B1  3%      +0.1        0.19        perf-profile.children.=
cycles-pp.__alloc_pages_bulk
>       0.22 =C2=B1  3%      +0.1        0.28 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__blk_mq_try_issue_directly
>       0.13 =C2=B1  3%      +0.1        0.19 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.vm_area_alloc_pages
>       0.16 =C2=B1  5%      +0.1        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.find_idlest_cpu
>       0.15 =C2=B1  5%      +0.1        0.22 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__vmalloc_area_node
>       0.36 =C2=B1  9%      +0.1        0.44 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.select_task_rq_fair
>       0.00            +0.1        0.08 =C2=B1 10%  perf-profile.children.=
cycles-pp.llist_reverse_order
>       0.19 =C2=B1  4%      +0.1        0.27 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.___perf_sw_event
>       0.63            +0.1        0.71        perf-profile.children.cycle=
s-pp.stack_access_ok
>       0.86 =C2=B1  2%      +0.1        0.94 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       0.84 =C2=B1  2%      +0.1        0.93 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_loop
>       0.83 =C2=B1  2%      +0.1        0.92 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.arch_do_signal_or_restart
>       0.83 =C2=B1  2%      +0.1        0.92 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.get_signal
>       0.23 =C2=B1  6%      +0.1        0.33 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__vmalloc_node_range
>       0.10 =C2=B1  4%      +0.1        0.21 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.task_fork_fair
>       0.11 =C2=B1  8%      +0.1        0.21 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sched_cgroup_fork
>       0.15 =C2=B1  3%      +0.1        0.27 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_migrate_task
>       0.72 =C2=B1  4%      +0.1        0.84 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.read_pages
>       0.26 =C2=B1  4%      +0.1        0.38        perf-profile.children.=
cycles-pp.alloc_thread_stack_node
>       0.18 =C2=B1  4%      +0.1        0.30 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.set_task_cpu
>       0.00            +0.1        0.12 =C2=B1  3%  perf-profile.children.=
cycles-pp.__smp_call_single_queue
>       0.00            +0.2        0.15        perf-profile.children.cycle=
s-pp.llist_add_batch
>       0.04 =C2=B1 71%      +0.2        0.19 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.io_queue_worker_create
>       0.46 =C2=B1 11%      +0.2        0.62 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       1.13 =C2=B1  5%      +0.2        1.28 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.memcpy_erms
>       1.54 =C2=B1  3%      +0.2        1.70 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__orc_find
>       0.38 =C2=B1  3%      +0.2        0.55        perf-profile.children.=
cycles-pp.dup_task_struct
>       0.02 =C2=B1141%      +0.2        0.19 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.task_work_add
>       0.00            +0.2        0.17 =C2=B1  4%  perf-profile.children.=
cycles-pp.__flush_smp_call_function_queue
>       1.40            +0.2        1.58 =C2=B1  3%  perf-profile.children.=
cycles-pp.raise_softirq
>       1.60 =C2=B1  3%      +0.2        1.78 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.perf_output_sample
>       0.28 =C2=B1  4%      +0.2        0.47 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.wake_up_new_task
>       1.45            +0.2        1.64 =C2=B1  3%  perf-profile.children.=
cycles-pp.blk_mq_complete_request
>       1.44            +0.2        1.64 =C2=B1  3%  perf-profile.children.=
cycles-pp.blk_mq_complete_request_remote
>       1.13 =C2=B1  5%      +0.2        1.33 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.page_cache_ra_unbounded
>       1.14 =C2=B1  5%      +0.2        1.35 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.force_page_cache_ra
>       0.00            +0.3        0.26 =C2=B1  4%  perf-profile.children.=
cycles-pp.ttwu_queue_wakelist
>       0.09 =C2=B1  5%      +0.3        0.37 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__sysvec_call_function_single
>       0.10 =C2=B1  4%      +0.3        0.38 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.sysvec_call_function_single
>       3.25            +0.3        3.56 =C2=B1  2%  perf-profile.children.=
cycles-pp.loop_process_work
>       0.11            +0.3        0.43 =C2=B1  5%  perf-profile.children.=
cycles-pp.asm_sysvec_call_function_single
>       2.72            +0.3        3.05 =C2=B1  2%  perf-profile.children.=
cycles-pp.__unwind_start
>       0.64            +0.3        0.98 =C2=B1  5%  perf-profile.children.=
cycles-pp.copy_process
>       0.62 =C2=B1  2%      +0.3        0.97 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.create_io_thread
>       2.37 =C2=B1  8%      +0.4        2.74 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.intel_idle_irq
>       4.80            +0.5        5.32 =C2=B1  3%  perf-profile.children.=
cycles-pp.unwind_next_frame
>       0.93 =C2=B1  2%      +0.5        1.46 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.create_io_worker
>       0.95            +0.5        1.49 =C2=B1  4%  perf-profile.children.=
cycles-pp.task_work_run
>       0.93 =C2=B1  2%      +0.5        1.48 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.create_worker_cb
>       6.06            +0.6        6.64 =C2=B1  3%  perf-profile.children.=
cycles-pp.perf_callchain_kernel
>      13.10 =C2=B1  4%      +0.8       13.88        perf-profile.children.=
cycles-pp.poll_idle
>      15.03            +0.9       15.93 =C2=B1  3%  perf-profile.children.=
cycles-pp.__schedule
>       7.43            +1.0        8.42 =C2=B1  3%  perf-profile.children.=
cycles-pp.io_wq_submit_work
>       7.36            +1.0        8.36 =C2=B1  3%  perf-profile.children.=
cycles-pp.io_issue_sqe
>       7.35            +1.0        8.35 =C2=B1  3%  perf-profile.children.=
cycles-pp.io_read
>       4.07            +1.0        5.08 =C2=B1  3%  perf-profile.children.=
cycles-pp.dequeue_entity
>       4.17            +1.0        5.20 =C2=B1  3%  perf-profile.children.=
cycles-pp.dequeue_task_fair
>       4.88 =C2=B1  2%      +1.1        5.95 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_switch
>       3.62 =C2=B1  3%      +1.1        4.75 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.io_schedule
>       3.72 =C2=B1  2%      +1.1        4.86 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.folio_wait_bit_common
>       3.78 =C2=B1  2%      +1.2        4.93 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.filemap_update_page
>       5.22            +1.4        6.60 =C2=B1  4%  perf-profile.children.=
cycles-pp.filemap_get_pages
>       3.00 =C2=B1  2%      +1.4        4.39        perf-profile.children.=
cycles-pp.__get_user_nocheck_8
>       5.60 =C2=B1  2%      +1.4        7.02 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_curr
>       5.76 =C2=B1  2%      +1.4        7.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.filemap_read
>       5.34 =C2=B1  2%      +1.4        6.77 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_stat_runtime
>       4.35 =C2=B1  3%      +1.5        5.90 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.schedule_timeout
>       3.35 =C2=B1  2%      +1.7        5.05 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.perf_callchain_user
>       0.00            +2.1        2.13 =C2=B1  4%  perf-profile.children.=
cycles-pp.flush_smp_call_function_queue
>       0.09 =C2=B1  5%      +2.1        2.22 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.sched_ttwu_pending
>       9.58            +2.3       11.88 =C2=B1  2%  perf-profile.children.=
cycles-pp.get_perf_callchain
>       9.61            +2.3       11.91 =C2=B1  2%  perf-profile.children.=
cycles-pp.perf_callchain
>      10.08            +2.3       12.42 =C2=B1  2%  perf-profile.children.=
cycles-pp.perf_prepare_sample
>      10.55 =C2=B1  2%      +2.4       12.99 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.schedule
>      12.40            +2.5       14.91 =C2=B1  3%  perf-profile.children.=
cycles-pp.perf_event_output_forward
>      12.45            +2.5       14.97 =C2=B1  3%  perf-profile.children.=
cycles-pp.__perf_event_overflow
>      12.79            +2.5       15.31 =C2=B1  3%  perf-profile.children.=
cycles-pp.perf_tp_event
>      11.50 =C2=B1  3%      -2.9        8.63 =C2=B1  9%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
>       0.53 =C2=B1  4%      -0.1        0.38 =C2=B1  5%  perf-profile.self=
.cycles-pp.__schedule
>       0.23 =C2=B1  6%      -0.1        0.09 =C2=B1  9%  perf-profile.self=
.cycles-pp.update_rq_clock
>       0.16 =C2=B1  7%      -0.1        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.set_next_entity
>       0.47 =C2=B1  2%      -0.1        0.39 =C2=B1  2%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.15 =C2=B1 14%      -0.1        0.07 =C2=B1 11%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.18 =C2=B1 11%      -0.1        0.12 =C2=B1  6%  perf-profile.self=
.cycles-pp.enqueue_entity
>       0.09 =C2=B1 32%      -0.1        0.04 =C2=B1 73%  perf-profile.self=
.cycles-pp.load_balance
>       0.10 =C2=B1 16%      -0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.switch_mm_irqs_off
>       0.23 =C2=B1  3%      -0.0        0.18 =C2=B1  6%  perf-profile.self=
.cycles-pp.update_load_avg
>       0.14 =C2=B1 18%      -0.0        0.10 =C2=B1 16%  perf-profile.self=
.cycles-pp.queued_write_lock_slowpath
>       0.15 =C2=B1  8%      -0.0        0.10 =C2=B1 12%  perf-profile.self=
.cycles-pp.prepare_task_switch
>       0.07 =C2=B1  6%      -0.0        0.03 =C2=B1 70%  perf-profile.self=
.cycles-pp.bsearch
>       0.07 =C2=B1  6%      -0.0        0.04 =C2=B1 71%  perf-profile.self=
.cycles-pp.vfs_write
>       0.15 =C2=B1 17%      -0.0        0.12        perf-profile.self.cycl=
es-pp.lapic_next_deadline
>       0.09 =C2=B1 14%      -0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.reweight_entity
>       0.08 =C2=B1  6%      -0.0        0.06 =C2=B1 16%  perf-profile.self=
.cycles-pp.entry_SYSRETQ_unsafe_stack
>       0.10 =C2=B1  8%      -0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.do_idle
>       0.05            +0.0        0.06        perf-profile.self.cycles-pp=
.sched_clock_cpu
>       0.05            +0.0        0.06        perf-profile.self.cycles-pp=
.__slab_free
>       0.09 =C2=B1  9%      +0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.core_kernel_text
>       0.07 =C2=B1 11%      +0.0        0.09 =C2=B1  5%  perf-profile.self=
.cycles-pp.dequeue_task_fair
>       0.06 =C2=B1  7%      +0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.__read_end_io
>       0.08 =C2=B1  5%      +0.0        0.10 =C2=B1  4%  perf-profile.self=
.cycles-pp.io_wq_worker_running
>       0.20 =C2=B1  6%      +0.0        0.22 =C2=B1  4%  perf-profile.self=
.cycles-pp.__switch_to
>       0.22 =C2=B1  2%      +0.0        0.25        perf-profile.self.cycl=
es-pp._raw_spin_lock_irq
>       0.08 =C2=B1 11%      +0.0        0.11 =C2=B1  7%  perf-profile.self=
.cycles-pp.io_wqe_worker
>       0.10 =C2=B1 12%      +0.0        0.13 =C2=B1  9%  perf-profile.self=
.cycles-pp.workingset_age_nonresident
>       0.46 =C2=B1  2%      +0.0        0.50        perf-profile.self.cycl=
es-pp.perf_callchain_kernel
>       0.26            +0.0        0.29 =C2=B1  2%  perf-profile.self.cycl=
es-pp.perf_output_sample
>       0.02 =C2=B1141%      +0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.xas_start
>       0.13 =C2=B1  3%      +0.0        0.18 =C2=B1  2%  perf-profile.self=
.cycles-pp.update_sg_wakeup_stats
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.rmqueue_bulk
>       0.69            +0.1        0.74 =C2=B1  3%  perf-profile.self.cycl=
es-pp.orc_find
>       0.20            +0.1        0.25 =C2=B1  4%  perf-profile.self.cycl=
es-pp.finish_task_switch
>       0.08            +0.1        0.13 =C2=B1  3%  perf-profile.self.cycl=
es-pp.clear_page_erms
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.__pagevec_lru_add_fn
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.perf_trace_sched_wakeup_template
>       0.18 =C2=B1  5%      +0.1        0.25 =C2=B1 11%  perf-profile.self=
.cycles-pp.___perf_sw_event
>       0.00            +0.1        0.07        perf-profile.self.cycles-pp=
.sched_ttwu_pending
>       0.00            +0.1        0.07 =C2=B1 11%  perf-profile.self.cycl=
es-pp.ttwu_queue_wakelist
>       0.00            +0.1        0.08 =C2=B1  6%  perf-profile.self.cycl=
es-pp.flush_smp_call_function_queue
>       0.00            +0.1        0.08 =C2=B1 10%  perf-profile.self.cycl=
es-pp.llist_reverse_order
>       0.59            +0.1        0.67        perf-profile.self.cycles-pp=
.stack_access_ok
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.self.cycl=
es-pp.__flush_smp_call_function_queue
>       0.71 =C2=B1  2%      +0.1        0.83 =C2=B1  4%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.00            +0.2        0.15        perf-profile.self.cycles-pp=
.llist_add_batch
>       1.10 =C2=B1  6%      +0.2        1.25 =C2=B1  5%  perf-profile.self=
.cycles-pp.memcpy_erms
>       1.52 =C2=B1  3%      +0.2        1.68 =C2=B1  4%  perf-profile.self=
.cycles-pp.__orc_find
>       1.95            +0.2        2.17 =C2=B1  3%  perf-profile.self.cycl=
es-pp.try_to_wake_up
>       1.81            +0.2        2.03 =C2=B1  4%  perf-profile.self.cycl=
es-pp.unwind_next_frame
>       0.35 =C2=B1  4%      +0.3        0.67 =C2=B1  5%  perf-profile.self=
.cycles-pp.perf_callchain_user
>      12.92 =C2=B1  4%      +0.7       13.62        perf-profile.self.cycl=
es-pp.poll_idle
>       2.36 =C2=B1  3%      +1.5        3.87 =C2=B1  2%  perf-profile.self=
.cycles-pp.__get_user_nocheck_8
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp7: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10G=
Hz (Cascade Lake) with 512G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/option_a/rootfs/tbox_group/test/testcas=
e/ucode:
>   gcc-11/performance/x86_64-rhel-8.3/Sched Pipe/debian-x86_64-phoronix/lk=
p-csl-2sp7/perf-bench-1.0.3/phoronix-test-suite/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     193353           +12.2%     216910        phoronix-test-suite.perf-be=
nch.SchedPipe.ops_sec
>     201.43 =C2=B1 70%     -53.7%      93.29        phoronix-test-suite.ti=
me.elapsed_time
>     201.43 =C2=B1 70%     -53.7%      93.29        phoronix-test-suite.ti=
me.elapsed_time.max
>     105.00 =C2=B1  2%     -33.0%      70.33        phoronix-test-suite.ti=
me.percent_of_cpu_this_job_got
>     205.52 =C2=B1 72%     -70.4%      60.85        phoronix-test-suite.ti=
me.system_time
>      15532 =C2=B1 56%     -49.5%       7851        meminfo.Active(anon)
>       0.85            -0.2        0.66        mpstat.cpu.all.sys%
>     634.00 =C2=B1 45%     +47.7%     936.67 =C2=B1  3%  vmstat.io.bi
>   26805243 =C2=B1 38%     -54.3%   12260480 =C2=B1 44%  turbostat.C1E
>   39415362 =C2=B1 69%     -57.4%   16774953 =C2=B1 13%  turbostat.IRQ
>      32.42            +1.6%      32.92        boot-time.boot
>       6.50            +3.2%       6.71        boot-time.dhcp
>       2530            +2.3%       2587        boot-time.idle
>      53962 =C2=B1 10%     -80.5%      10514 =C2=B1 73%  numa-numastat.nod=
e0.other_node
>     365083 =C2=B1 36%     -41.6%     213279 =C2=B1 10%  numa-numastat.nod=
e1.local_node
>      14531 =C2=B1 40%    +298.3%      57880 =C2=B1 13%  numa-numastat.nod=
e1.other_node
>       3893 =C2=B1 56%     -49.6%       1962        proc-vmstat.nr_active_=
anon
>      97870 =C2=B1  2%      -2.5%      95382        proc-vmstat.nr_anon_pa=
ges
>       3893 =C2=B1 56%     -49.6%       1962        proc-vmstat.nr_zone_ac=
tive_anon
>     968157 =C2=B1 46%     -35.9%     620544        proc-vmstat.numa_hit
>     899882 =C2=B1 50%     -38.6%     552109        proc-vmstat.numa_local
>      43678 =C2=B1 92%     -66.7%      14545 =C2=B1  4%  proc-vmstat.pgact=
ivate
>     974870 =C2=B1 46%     -35.9%     625326        proc-vmstat.pgalloc_no=
rmal
>    1111405 =C2=B1 47%     -36.4%     706721        proc-vmstat.pgfault
>     889898 =C2=B1 59%     -43.6%     501718        proc-vmstat.pgfree
>     163642 =C2=B1 53%     -40.7%      97036        proc-vmstat.pgreuse
>      66570 =C2=B1  7%     +24.9%      83139 =C2=B1 11%  numa-meminfo.node=
0.Active
>       6926 =C2=B1 32%     -31.5%       4743 =C2=B1  7%  numa-meminfo.node=
0.Active(anon)
>      59644 =C2=B1  9%     +31.4%      78396 =C2=B1 12%  numa-meminfo.node=
0.Active(file)
>     852786 =C2=B1 20%     +56.8%    1336746 =C2=B1 18%  numa-meminfo.node=
0.FilePages
>     995038 =C2=B1 20%     +46.3%    1455939 =C2=B1 10%  numa-meminfo.node=
0.Inactive
>     233434 =C2=B1  8%    +239.0%     791384 =C2=B1 48%  numa-meminfo.node=
0.Inactive(file)
>      67525           +12.8%      76169 =C2=B1  5%  numa-meminfo.node0.KRe=
claimable
>    2050688 =C2=B1 13%     +25.4%    2572177 =C2=B1  6%  numa-meminfo.node=
0.MemUsed
>      67525           +12.8%      76169 =C2=B1  5%  numa-meminfo.node0.SRe=
claimable
>      64889 =C2=B1 20%     -41.4%      38047 =C2=B1 23%  numa-meminfo.node=
1.Active
>      56103 =C2=B1 14%     -37.7%      34942 =C2=B1 26%  numa-meminfo.node=
1.Active(file)
>    1118753 =C2=B1 16%     -44.4%     622318 =C2=B1 39%  numa-meminfo.node=
1.FilePages
>    1240670 =C2=B1 17%     -38.1%     768140 =C2=B1 20%  numa-meminfo.node=
1.Inactive
>     881236 =C2=B1  2%     -63.4%     322687 =C2=B1118%  numa-meminfo.node=
1.Inactive(file)
>      38604 =C2=B1  2%     -23.1%      29678 =C2=B1 15%  numa-meminfo.node=
1.KReclaimable
>    1994605 =C2=B1  5%     -22.1%    1553581 =C2=B1 10%  numa-meminfo.node=
1.MemUsed
>      38604 =C2=B1  2%     -23.1%      29678 =C2=B1 15%  numa-meminfo.node=
1.SReclaimable
>       1731 =C2=B1 32%     -31.5%       1185 =C2=B1  7%  numa-vmstat.node0=
.nr_active_anon
>      14911 =C2=B1  9%     +31.4%      19598 =C2=B1 12%  numa-vmstat.node0=
.nr_active_file
>     213196 =C2=B1 20%     +56.8%     334186 =C2=B1 18%  numa-vmstat.node0=
.nr_file_pages
>      58358 =C2=B1  8%    +239.0%     197845 =C2=B1 48%  numa-vmstat.node0=
.nr_inactive_file
>      16881           +12.8%      19042 =C2=B1  5%  numa-vmstat.node0.nr_s=
lab_reclaimable
>       1731 =C2=B1 32%     -31.5%       1185 =C2=B1  7%  numa-vmstat.node0=
.nr_zone_active_anon
>      14911 =C2=B1  9%     +31.4%      19598 =C2=B1 12%  numa-vmstat.node0=
.nr_zone_active_file
>      58358 =C2=B1  8%    +239.0%     197845 =C2=B1 48%  numa-vmstat.node0=
.nr_zone_inactive_file
>      53962 =C2=B1 10%     -80.5%      10514 =C2=B1 73%  numa-vmstat.node0=
.numa_other
>      14025 =C2=B1 14%     -37.7%       8735 =C2=B1 26%  numa-vmstat.node1=
.nr_active_file
>     279695 =C2=B1 16%     -44.4%     155579 =C2=B1 39%  numa-vmstat.node1=
.nr_file_pages
>     220308 =C2=B1  2%     -63.4%      80671 =C2=B1118%  numa-vmstat.node1=
.nr_inactive_file
>       9650 =C2=B1  2%     -23.1%       7419 =C2=B1 15%  numa-vmstat.node1=
.nr_slab_reclaimable
>      14025 =C2=B1 14%     -37.7%       8735 =C2=B1 26%  numa-vmstat.node1=
.nr_zone_active_file
>     220308 =C2=B1  2%     -63.4%      80671 =C2=B1118%  numa-vmstat.node1=
.nr_zone_inactive_file
>     365062 =C2=B1 36%     -41.5%     213405 =C2=B1 10%  numa-vmstat.node1=
.numa_local
>      14531 =C2=B1 40%    +298.3%      57880 =C2=B1 13%  numa-vmstat.node1=
.numa_other
>  8.864e+08            +5.7%  9.369e+08        perf-stat.i.branch-instruct=
ions
>  6.974e+08            +8.4%  7.557e+08 =C2=B1  5%  perf-stat.i.dTLB-stores
>    4517678 =C2=B1  2%     +13.6%    5130997        perf-stat.i.iTLB-load-=
misses
>  4.225e+09            +6.1%  4.483e+09        perf-stat.i.instructions
>      11.27 =C2=B1 44%     +39.5%      15.71        perf-stat.i.major-faul=
ts
>   29568500            +4.4%   30854983        perf-stat.i.metric.M/sec
>       4719 =C2=B1 10%      +9.6%       5174        perf-stat.i.minor-faul=
ts
>      22542 =C2=B1 13%     +27.9%      28834 =C2=B1 15%  perf-stat.i.node-=
stores
>       4730 =C2=B1 10%      +9.7%       5190        perf-stat.i.page-faults
>       1.03 =C2=B1 26%      +1.3        2.29 =C2=B1 30%  perf-stat.overall=
.cache-miss-rate%
>     936.03 =C2=B1  2%      -6.6%     874.05        perf-stat.overall.inst=
ructions-per-iTLB-miss
>  8.798e+08            +5.3%  9.268e+08        perf-stat.ps.branch-instruc=
tions
>  6.921e+08            +8.0%  7.474e+08 =C2=B1  5%  perf-stat.ps.dTLB-stor=
es
>    4483259 =C2=B1  2%     +13.2%    5074281        perf-stat.ps.iTLB-load=
-misses
>  4.194e+09            +5.7%  4.435e+09        perf-stat.ps.instructions
>      11.24 =C2=B1 44%     +39.0%      15.63        perf-stat.ps.major-fau=
lts
>       4689 =C2=B1  9%      +9.3%       5125        perf-stat.ps.minor-fau=
lts
>      22458 =C2=B1 14%     +27.4%      28613 =C2=B1 15%  perf-stat.ps.node=
-stores
>       4700 =C2=B1 10%      +9.4%       5142        perf-stat.ps.page-faul=
ts
>  8.512e+11 =C2=B1 70%     -50.8%  4.187e+11        perf-stat.total.instru=
ctions
>       0.10 =C2=B1  8%     -22.5%       0.08 =C2=B1  6%  sched_debug.cfs_r=
q:/.h_nr_running.avg
>       0.32 =C2=B1  8%     -13.0%       0.28 =C2=B1  8%  sched_debug.cfs_r=
q:/.h_nr_running.stddev
>      17492 =C2=B1 16%     -79.9%       3518 =C2=B1 11%  sched_debug.cfs_r=
q:/.load.avg
>     827234 =C2=B1 43%     -91.6%      69802 =C2=B1 11%  sched_debug.cfs_r=
q:/.load.max
>      98151 =C2=B1 17%     -86.8%      12968 =C2=B1 10%  sched_debug.cfs_r=
q:/.load.stddev
>      82.26 =C2=B1 89%    +859.0%     788.90 =C2=B1 71%  sched_debug.cfs_r=
q:/.load_avg.avg
>       4978 =C2=B1120%    +888.1%      49192 =C2=B1 69%  sched_debug.cfs_r=
q:/.load_avg.max
>     528.68 =C2=B1112%    +918.1%       5382 =C2=B1 69%  sched_debug.cfs_r=
q:/.load_avg.stddev
>      57507 =C2=B1  8%     -22.0%      44860 =C2=B1  3%  sched_debug.cfs_r=
q:/.min_vruntime.avg
>     104117 =C2=B1 24%     -27.0%      76052 =C2=B1 13%  sched_debug.cfs_r=
q:/.min_vruntime.max
>      12710 =C2=B1 41%     -40.6%       7548 =C2=B1 14%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.10 =C2=B1  5%     -24.5%       0.07        sched_debug.cfs_rq:/.n=
r_running.avg
>       0.31 =C2=B1  7%     -14.8%       0.26        sched_debug.cfs_rq:/.n=
r_running.stddev
>      35.93 =C2=B1 39%    +117.2%      78.04 =C2=B1 26%  sched_debug.cfs_r=
q:/.removed.runnable_avg.stddev
>      35.93 =C2=B1 39%    +117.2%      78.04 =C2=B1 26%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>     -51515           -50.7%     -25408        sched_debug.cfs_rq:/.spread=
0.min
>      12711 =C2=B1 41%     -40.6%       7547 =C2=B1 14%  sched_debug.cfs_r=
q:/.spread0.stddev
>     200.69 =C2=B1 13%     +16.6%     234.05 =C2=B1  9%  sched_debug.cfs_r=
q:/.util_avg.stddev
>      19.61 =C2=B1  5%     +37.6%      26.97 =C2=B1 11%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>      96.36 =C2=B1 10%     +34.1%     129.22        sched_debug.cfs_rq:/.u=
til_est_enqueued.stddev
>     193.56 =C2=B1 11%     -18.2%     158.33 =C2=B1  2%  sched_debug.cpu.c=
urr->pid.avg
>     798.61 =C2=B1 31%     -28.9%     567.95 =C2=B1  2%  sched_debug.cpu.c=
urr->pid.stddev
>     523974 =C2=B1  6%     +19.0%     623631 =C2=B1  5%  sched_debug.cpu.m=
ax_idle_balance_cost.max
>       3338 =C2=B1141%    +291.7%      13079 =C2=B1 30%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>       0.00 =C2=B1 34%     +77.5%       0.00 =C2=B1  3%  sched_debug.cpu.n=
ext_balance.stddev
>      85.72 =C2=B1  9%     -32.4       53.37 =C2=B1 33%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_v=
erify
>      85.72 =C2=B1  9%     -32.4       53.37 =C2=B1 33%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>      85.69 =C2=B1  9%     -32.3       53.37 =C2=B1 33%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64_no_verify
>      86.29 =C2=B1 10%     -30.8       55.45 =C2=B1 27%  perf-profile.call=
trace.cycles-pp.secondary_startup_64_no_verify
>      82.03 =C2=B1 15%     -30.8       51.28 =C2=B1 39%  perf-profile.call=
trace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary=
.secondary_startup_64_no_verify
>      76.09 =C2=B1 14%     -24.8       51.28 =C2=B1 39%  perf-profile.call=
trace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.s=
tart_secondary
>      75.11 =C2=B1 14%     -21.7       53.37 =C2=B1 33%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle=
.cpu_startup_entry
>      21.22 =C2=B1 32%     -21.2        0.00        perf-profile.calltrace=
.cycles-pp.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_ente=
r.cpuidle_idle_call.do_idle
>      17.08 =C2=B1 32%     -17.1        0.00        perf-profile.calltrace=
.cycles-pp.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt.cpui=
dle_enter_state.cpuidle_enter.cpuidle_idle_call
>      11.61 =C2=B1 31%     -11.6        0.00        perf-profile.calltrace=
.cycles-pp.__sysvec_apic_timer_interrupt.sysvec_apic_timer_interrupt.asm_sy=
svec_apic_timer_interrupt.cpuidle_enter_state.cpuidle_enter
>      11.40 =C2=B1 32%     -11.4        0.00        perf-profile.calltrace=
.cycles-pp.hrtimer_interrupt.__sysvec_apic_timer_interrupt.sysvec_apic_time=
r_interrupt.asm_sysvec_apic_timer_interrupt.cpuidle_enter_state
>       5.72 =C2=B1 17%      -5.7        0.00        perf-profile.calltrace=
.cycles-pp.__hrtimer_run_queues.hrtimer_interrupt.__sysvec_apic_timer_inter=
rupt.sysvec_apic_timer_interrupt.asm_sysvec_apic_timer_interrupt
>       5.10 =C2=B1 21%      -5.1        0.00        perf-profile.calltrace=
.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_se=
condary
>       0.00            +6.7        6.73 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.__x64_sys_execve.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.00            +6.7        6.73 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.do_execveat_common.__x64_sys_execve.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>       0.00           +10.9       10.90 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_h=
wframe
>       0.00           +10.9       10.90 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe
>       0.00           +10.9       10.90 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_exit_to=
_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.00           +10.9       10.90 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mo=
de_prepare.syscall_exit_to_user_mode.do_syscall_64
>       0.00           +10.9       10.90 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_=
mode_loop.exit_to_user_mode_prepare
>       0.00           +10.9       10.90 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_=
to_user_mode_loop
>       0.00           +10.9       10.90 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit=
_to_user_mode_prepare.syscall_exit_to_user_mode
>       3.35 =C2=B1 96%     +18.9       22.28 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe
>       3.30 =C2=B1 97%     +19.0       22.28 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe
>      85.72 =C2=B1  9%     -32.4       53.37 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.start_secondary
>      86.29 =C2=B1 10%     -30.8       55.45 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>      86.29 =C2=B1 10%     -30.8       55.45 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>      86.28 =C2=B1 10%     -30.8       55.45 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.do_idle
>      82.61 =C2=B1 15%     -29.2       53.37 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.cpuidle_idle_call
>      76.58 =C2=B1 14%     -23.2       53.37 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter
>      76.50 =C2=B1 14%     -23.1       53.37 =C2=B1 33%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>      19.87 =C2=B1 32%     -19.9        0.00        perf-profile.children.=
cycles-pp.asm_sysvec_apic_timer_interrupt
>      17.53 =C2=B1 32%     -17.5        0.00        perf-profile.children.=
cycles-pp.sysvec_apic_timer_interrupt
>      11.99 =C2=B1 31%     -12.0        0.00        perf-profile.children.=
cycles-pp.__sysvec_apic_timer_interrupt
>      11.82 =C2=B1 32%     -11.8        0.00        perf-profile.children.=
cycles-pp.hrtimer_interrupt
>       5.98 =C2=B1 17%      -6.0        0.00        perf-profile.children.=
cycles-pp.__hrtimer_run_queues
>       5.21 =C2=B1 51%      -5.2        0.00        perf-profile.children.=
cycles-pp.ktime_get
>       5.20 =C2=B1 21%      -5.2        0.00        perf-profile.children.=
cycles-pp.menu_select
>       0.39 =C2=B1 52%      +6.3        6.73 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__x64_sys_execve
>       0.39 =C2=B1 52%      +6.3        6.73 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.do_execveat_common
>       0.04 =C2=B1 73%      +6.7        6.73 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.free_pgtables
>       0.33 =C2=B1 49%     +10.6       10.90 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.mmput
>       0.33 =C2=B1 49%     +10.6       10.90 =C2=B1 51%  perf-profile.chil=
dren.cycles-pp.exit_mmap
>       0.24 =C2=B1 71%     +10.7       10.90 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode
>       0.21 =C2=B1 85%     +10.7       10.90 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       0.18 =C2=B1115%     +10.7       10.90 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_loop
>       0.02 =C2=B1141%     +10.9       10.90 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.arch_do_signal_or_restart
>       0.00           +10.9       10.90 =C2=B1 20%  perf-profile.children.=
cycles-pp.get_signal
>       0.21 =C2=B1 57%     +12.8       12.98 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.do_group_exit
>       0.21 =C2=B1 57%     +12.8       12.98 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.do_exit
>      10.35 =C2=B1 88%     +32.1       42.47 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>      10.28 =C2=B1 87%     +32.2       42.47 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>       4.57 =C2=B1 55%      -4.6        0.00        perf-profile.self.cycl=
es-pp.ktime_get
> =

> =

> =

> *************************************************************************=
**************************
> lkp-icl-2sp6: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ =
2.60GHz (Ice Lake) with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> class/compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test=
/testcase/testtime/ucode:
>   memory/gcc-11/performance/x86_64-rhel-8.3/100%/debian-11.1-x86_64-20220=
510.cgz/lkp-icl-2sp6/vm-segv/stress-ng/60s/0xd000331
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    1264956 =C2=B1 10%     +66.0%    2099349 =C2=B1  3%  stress-ng.time.in=
voluntary_context_switches
>       6592            +2.4%       6750        stress-ng.time.maximum_resi=
dent_set_size
>   62562877            +7.1%   66985234 =C2=B1  2%  stress-ng.time.minor_p=
age_faults
>       6636            -1.5%       6537        stress-ng.time.system_time
>     504.62            +8.1%     545.36        stress-ng.time.user_time
>   68130659            +8.6%   73981459        stress-ng.time.voluntary_co=
ntext_switches
>    1949688            +5.8%    2063220        stress-ng.vm-segv.ops
>      32494            +5.8%      34386        stress-ng.vm-segv.ops_per_s=
ec
>    1708931           +10.1%    1880720        vmstat.system.cs
>     328946           +32.0%     434157        vmstat.system.in
>   13600744 =C2=B1  5%     +39.8%   19007203        turbostat.C1
>       1.47 =C2=B1  3%      +0.3        1.79        turbostat.C1%
>       6.04 =C2=B1 31%      -2.4        3.63 =C2=B1 24%  turbostat.C1E%
>       7.29 =C2=B1 28%     -30.4%       5.08 =C2=B1 17%  turbostat.CPU%c1
>       0.05           +20.0%       0.06        turbostat.IPC
>   21628285           +32.3%   28615391        turbostat.IRQ
>      92735 =C2=B1  3%     +49.8%     138939        turbostat.POLL
>      63.00            +3.2%      65.00        turbostat.PkgTmp
>     199416            -3.6%     192209        proc-vmstat.nr_anon_pages
>     236747            -2.7%     230339        proc-vmstat.nr_inactive_anon
>      34463            +3.8%      35757        proc-vmstat.nr_slab_reclaim=
able
>     236747            -2.7%     230339        proc-vmstat.nr_zone_inactiv=
e_anon
>   55974758            +4.4%   58457115 =C2=B1  2%  proc-vmstat.numa_hit
>   55862875            +4.4%   58344692 =C2=B1  2%  proc-vmstat.numa_local
>   55974279            +4.4%   58446237 =C2=B1  2%  proc-vmstat.pgalloc_no=
rmal
>   63848813            +7.0%   68292521 =C2=B1  2%  proc-vmstat.pgfault
>   54819147            +4.5%   57275667 =C2=B1  2%  proc-vmstat.pgfree
>    3461083            +5.7%    3657004        proc-vmstat.pgreuse
>      60904 =C2=B1 23%     +79.2%     109143        sched_debug.cfs_rq:/.M=
IN_vruntime.avg
>     451714 =C2=B1 12%     +36.1%     614820        sched_debug.cfs_rq:/.M=
IN_vruntime.stddev
>      60904 =C2=B1 23%     +79.2%     109143        sched_debug.cfs_rq:/.m=
ax_vruntime.avg
>     451714 =C2=B1 12%     +36.1%     614820        sched_debug.cfs_rq:/.m=
ax_vruntime.stddev
>      25.19 =C2=B1 14%     +42.2%      35.82 =C2=B1 15%  sched_debug.cfs_r=
q:/.removed.load_avg.avg
>     150.47 =C2=B1  8%     +20.7%     181.66 =C2=B1  6%  sched_debug.cfs_r=
q:/.removed.load_avg.stddev
>       2618 =C2=B1  8%     +53.7%       4025 =C2=B1  2%  sched_debug.cpu.a=
vg_idle.min
>     123912 =C2=B1  5%     -14.3%     106167 =C2=B1  4%  sched_debug.cpu.a=
vg_idle.stddev
>     331093 =C2=B1  5%      +9.6%     363002 =C2=B1  4%  sched_debug.cpu.c=
urr->pid.avg
>     420291           +10.1%     462576        sched_debug.cpu.nr_switches=
.avg
>     449522           +10.9%     498465        sched_debug.cpu.nr_switches=
.max
>      16629 =C2=B1  4%     +13.4%      18865 =C2=B1  7%  sched_debug.cpu.n=
r_switches.stddev
>       0.75 =C2=B1 15%    +122.9%       1.67 =C2=B1  7%  sched_debug.rt_rq=
:/.rt_time.avg
>      96.00 =C2=B1 15%    +122.9%     213.98 =C2=B1  7%  sched_debug.rt_rq=
:/.rt_time.max
>       8.45 =C2=B1 15%    +122.9%      18.84 =C2=B1  7%  sched_debug.rt_rq=
:/.rt_time.stddev
>      14.87            -4.3%      14.24        perf-stat.i.MPKI
>  1.377e+10            +3.8%   1.43e+10        perf-stat.i.branch-instruct=
ions
>       0.77            +0.0        0.79        perf-stat.i.branch-miss-rat=
e%
>   94437590            +5.6%   99709871        perf-stat.i.branch-misses
>      15.50            +0.9       16.44        perf-stat.i.cache-miss-rate%
>  1.466e+08            +5.6%  1.547e+08        perf-stat.i.cache-misses
>    1787265           +10.2%    1968673        perf-stat.i.context-switches
>       6.11            -3.6%       5.89        perf-stat.i.cpi
>     781756           +12.0%     875464        perf-stat.i.cpu-migrations
>       2643            -4.1%       2534        perf-stat.i.cycles-between-=
cache-misses
>   19912707            +5.0%   20901010 =C2=B1  2%  perf-stat.i.dTLB-load-=
misses
>  1.625e+10            +4.3%  1.695e+10        perf-stat.i.dTLB-loads
>    7064321            +6.5%    7523863 =C2=B1  2%  perf-stat.i.dTLB-store=
-misses
>  5.762e+09            +7.3%  6.186e+09        perf-stat.i.dTLB-stores
>   6.12e+10            +4.2%  6.376e+10        perf-stat.i.instructions
>     742.41            +4.8%     778.22        perf-stat.i.metric.K/sec
>     286.66            +4.5%     299.46        perf-stat.i.metric.M/sec
>    1007287            +6.9%    1076591 =C2=B1  2%  perf-stat.i.minor-faul=
ts
>   36966935            +5.5%   38990946 =C2=B1  2%  perf-stat.i.node-load-=
misses
>    4062924            +3.0%    4183225        perf-stat.i.node-loads
>   16139840            +5.6%   17048186 =C2=B1  2%  perf-stat.i.node-store=
-misses
>   25410442            +5.7%   26857646        perf-stat.i.node-stores
>    1069580            +6.8%    1142546 =C2=B1  2%  perf-stat.i.page-faults
>      15.11            -4.8%      14.38        perf-stat.overall.MPKI
>      15.91            +1.0       16.91        perf-stat.overall.cache-mis=
s-rate%
>       6.28            -3.7%       6.05        perf-stat.overall.cpi
>       2611            -4.7%       2488        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.16            +3.8%       0.17        perf-stat.overall.ipc
>  1.361e+10            +2.8%  1.399e+10        perf-stat.ps.branch-instruc=
tions
>   92980579            +4.5%   97181040        perf-stat.ps.branch-misses
>  1.454e+08            +4.4%  1.517e+08        perf-stat.ps.cache-misses
>  9.136e+08            -1.8%  8.972e+08        perf-stat.ps.cache-referenc=
es
>    1765528            +8.9%    1923155        perf-stat.ps.context-switch=
es
>     125943            -1.0%     124655        perf-stat.ps.cpu-clock
>     772006           +10.8%     855187        perf-stat.ps.cpu-migrations
>   19752538            +3.9%   20528367        perf-stat.ps.dTLB-load-miss=
es
>  1.607e+10            +3.3%   1.66e+10        perf-stat.ps.dTLB-loads
>    6988045            +5.5%    7372765 =C2=B1  2%  perf-stat.ps.dTLB-stor=
e-misses
>    5.7e+09            +6.4%  6.063e+09        perf-stat.ps.dTLB-stores
>  6.047e+10            +3.2%  6.241e+10        perf-stat.ps.instructions
>     996387            +5.9%    1054763 =C2=B1  3%  perf-stat.ps.minor-fau=
lts
>   36562256            +4.3%   38142884        perf-stat.ps.node-load-miss=
es
>   15940590            +4.6%   16675367 =C2=B1  2%  perf-stat.ps.node-stor=
e-misses
>   25318715            +4.4%   26434769        perf-stat.ps.node-stores
>    1057977            +5.8%    1119275 =C2=B1  2%  perf-stat.ps.page-faul=
ts
>     125943            -1.0%     124655        perf-stat.ps.task-clock
>  3.782e+12            +3.3%  3.908e+12        perf-stat.total.instructions
>      35.78            -1.8       33.95        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.do_wait.ke=
rnel_wait4.do_syscall_64
>      36.11            -1.8       34.29        perf-profile.calltrace.cycl=
es-pp.queued_read_lock_slowpath.do_wait.kernel_wait4.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>      39.82            -1.6       38.19        perf-profile.calltrace.cycl=
es-pp.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe.wai=
t4
>      39.94            -1.6       38.32        perf-profile.calltrace.cycl=
es-pp.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe.wait4
>      40.03            -1.6       38.42        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.wait4
>      40.05            -1.6       38.44        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.wait4
>      40.16            -1.6       38.57        perf-profile.calltrace.cycl=
es-pp.wait4
>      19.86            -0.4       19.50        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.ptrace_sto=
p.ptrace_do_notify.ptrace_notify
>       1.09            -0.3        0.78        perf-profile.calltrace.cycl=
es-pp.try_to_wake_up.ptrace_request.arch_ptrace.__x64_sys_ptrace.do_syscall=
_64
>       1.14            -0.3        0.83        perf-profile.calltrace.cycl=
es-pp.arch_ptrace.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.ptrace
>       1.14 =C2=B1  2%      -0.3        0.83        perf-profile.calltrace=
.cycles-pp.ptrace_request.arch_ptrace.__x64_sys_ptrace.do_syscall_64.entry_=
SYSCALL_64_after_hwframe
>      11.71            -0.2       11.50        perf-profile.calltrace.cycl=
es-pp.ptrace_do_notify.ptrace_notify.syscall_trace_enter.do_syscall_64.entr=
y_SYSCALL_64_after_hwframe
>      11.68            -0.2       11.47        perf-profile.calltrace.cycl=
es-pp.ptrace_stop.ptrace_do_notify.ptrace_notify.syscall_trace_enter.do_sys=
call_64
>       9.99            -0.2        9.78        perf-profile.calltrace.cycl=
es-pp.queued_read_lock_slowpath.ptrace_stop.ptrace_do_notify.ptrace_notify.=
syscall_trace_enter
>      10.45            -0.2       10.25        perf-profile.calltrace.cycl=
es-pp.ptrace_notify.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.__munmap
>      10.46            -0.2       10.26        perf-profile.calltrace.cycl=
es-pp.syscall_trace_enter.do_syscall_64.entry_SYSCALL_64_after_hwframe.__mu=
nmap
>      11.75            -0.1       11.61        perf-profile.calltrace.cycl=
es-pp.ptrace_stop.ptrace_do_notify.ptrace_notify.syscall_exit_work.syscall_=
exit_to_user_mode
>      11.77            -0.1       11.63        perf-profile.calltrace.cycl=
es-pp.ptrace_do_notify.ptrace_notify.syscall_exit_work.syscall_exit_to_user=
_mode.do_syscall_64
>      11.78            -0.1       11.64        perf-profile.calltrace.cycl=
es-pp.ptrace_notify.syscall_exit_work.syscall_exit_to_user_mode.do_syscall_=
64.entry_SYSCALL_64_after_hwframe
>      10.03            -0.1        9.91        perf-profile.calltrace.cycl=
es-pp.queued_read_lock_slowpath.ptrace_stop.ptrace_do_notify.ptrace_notify.=
syscall_exit_work
>      10.47            -0.1       10.35        perf-profile.calltrace.cycl=
es-pp.syscall_exit_work.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe.__munmap
>      10.50            -0.1       10.38        perf-profile.calltrace.cycl=
es-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfram=
e.__munmap
>       1.39 =C2=B1  2%      -0.1        1.27        perf-profile.calltrace=
.cycles-pp.wait_task_inactive.ptrace_check_attach.__x64_sys_ptrace.do_sysca=
ll_64.entry_SYSCALL_64_after_hwframe
>       2.62            -0.0        2.58        perf-profile.calltrace.cycl=
es-pp.sigprocmask
>       2.60            -0.0        2.56        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sigprocmask
>       2.60            -0.0        2.56        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.sigprocmask
>       2.47            -0.0        2.44        perf-profile.calltrace.cycl=
es-pp.ptrace_stop.ptrace_signal.get_signal.arch_do_signal_or_restart.exit_t=
o_user_mode_loop
>       2.47            -0.0        2.44        perf-profile.calltrace.cycl=
es-pp.ptrace_signal.get_signal.arch_do_signal_or_restart.exit_to_user_mode_=
loop.exit_to_user_mode_prepare
>       1.29            -0.0        1.27        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.kill
>       1.29            -0.0        1.27        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.kill
>       1.31            -0.0        1.29        perf-profile.calltrace.cycl=
es-pp.syscall_exit_work.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe.sigprocmask
>       1.37            -0.0        1.35        perf-profile.calltrace.cycl=
es-pp.kill
>       2.06            -0.0        2.04        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.ptrace_sto=
p.ptrace_signal.get_signal
>       2.17            +0.0        2.20        perf-profile.calltrace.cycl=
es-pp.exit_notify.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart
>       0.64            +0.0        0.67        perf-profile.calltrace.cycl=
es-pp.anon_vma_interval_tree_insert.anon_vma_clone.anon_vma_fork.dup_mmap.d=
up_mm
>       2.09            +0.0        2.13        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.exit_notify.do_exit.do_group_exit.get_sign=
al
>       3.72            +0.0        3.76        perf-profile.calltrace.cycl=
es-pp.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_user_mode_pr=
epare.irqentry_exit_to_user_mode.asm_exc_page_fault
>       3.72            +0.0        3.76        perf-profile.calltrace.cycl=
es-pp.get_signal.arch_do_signal_or_restart.exit_to_user_mode_loop.exit_to_u=
ser_mode_prepare.irqentry_exit_to_user_mode
>       2.02            +0.0        2.06        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.exit_noti=
fy.do_exit.do_group_exit
>       0.54 =C2=B1  2%      +0.0        0.58 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.copy_p4d_range.copy_page_range.dup_mmap.dup_mm.copy_process
>       2.39            +0.0        2.43        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_prepare.irqentry_exit_to_user_mode.asm_exc_page_fau=
lt
>       2.39            +0.0        2.43        perf-profile.calltrace.cycl=
es-pp.irqentry_exit_to_user_mode.asm_exc_page_fault
>       2.07            +0.0        2.11        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.release_task.wait_task_zombie.do_wait.kern=
el_wait4
>       2.10            +0.0        2.15        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.copy_process.kernel_clone.__do_sys_clone.d=
o_syscall_64
>       2.04            +0.0        2.09        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.copy_proc=
ess.kernel_clone.__do_sys_clone
>       0.57 =C2=B1  2%      +0.0        0.61 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.copy_page_range.dup_mmap.dup_mm.copy_process.kernel_clone
>       2.38            +0.0        2.43        perf-profile.calltrace.cycl=
es-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.irqentry_exit_to_use=
r_mode.asm_exc_page_fault
>       2.38            +0.0        2.43        perf-profile.calltrace.cycl=
es-pp.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_user_mode_=
loop.exit_to_user_mode_prepare
>       2.38            +0.0        2.43        perf-profile.calltrace.cycl=
es-pp.do_exit.do_group_exit.get_signal.arch_do_signal_or_restart.exit_to_us=
er_mode_loop
>       2.01            +0.0        2.06        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.release_t=
ask.wait_task_zombie.do_wait
>       2.15            +0.0        2.20        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.__do_sys_setpgid.do_syscall_64.entry_SYSCA=
LL_64_after_hwframe.__setpgid
>       2.18            +0.1        2.23        perf-profile.calltrace.cycl=
es-pp.__do_sys_setpgid.do_syscall_64.entry_SYSCALL_64_after_hwframe.__setpg=
id
>       2.19            +0.1        2.24        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__setpgid
>       2.19            +0.1        2.24        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__setpgid
>       0.78 =C2=B1  5%      +0.1        0.83        perf-profile.calltrace=
.cycles-pp.schedule.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_aft=
er_hwframe
>       0.77 =C2=B1  5%      +0.1        0.82        perf-profile.calltrace=
.cycles-pp.__schedule.schedule.do_wait.kernel_wait4.do_syscall_64
>       2.28            +0.1        2.33        perf-profile.calltrace.cycl=
es-pp.wait_task_zombie.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_=
after_hwframe
>       2.09            +0.1        2.15        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.__do_sys_=
setpgid.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       2.09            +0.1        2.15        perf-profile.calltrace.cycl=
es-pp.queued_write_lock_slowpath.ptrace_traceme.__x64_sys_ptrace.do_syscall=
_64.entry_SYSCALL_64_after_hwframe
>       2.21            +0.1        2.27        perf-profile.calltrace.cycl=
es-pp.__setpgid
>       2.26            +0.1        2.32        perf-profile.calltrace.cycl=
es-pp.release_task.wait_task_zombie.do_wait.kernel_wait4.do_syscall_64
>       2.03            +0.1        2.09        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_write_lock_slowpath.ptrace_tr=
aceme.__x64_sys_ptrace.do_syscall_64
>       2.12            +0.1        2.18        perf-profile.calltrace.cycl=
es-pp.ptrace_traceme.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_after_=
hwframe.ptrace
>       1.28            +0.1        1.37        perf-profile.calltrace.cycl=
es-pp.anon_vma_clone.anon_vma_fork.dup_mmap.dup_mm.copy_process
>       1.09            +0.1        1.20        perf-profile.calltrace.cycl=
es-pp.unlink_anon_vmas.free_pgtables.unmap_region.__do_munmap.__vm_munmap
>       1.10            +0.1        1.21        perf-profile.calltrace.cycl=
es-pp.zap_pte_range.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region
>       1.16            +0.1        1.27        perf-profile.calltrace.cycl=
es-pp.zap_pmd_range.unmap_page_range.unmap_vmas.unmap_region.__do_munmap
>       1.21            +0.1        1.32        perf-profile.calltrace.cycl=
es-pp.unmap_page_range.unmap_vmas.unmap_region.__do_munmap.__vm_munmap
>       1.24            +0.1        1.35        perf-profile.calltrace.cycl=
es-pp.unmap_vmas.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap
>       1.77            +0.2        1.93        perf-profile.calltrace.cycl=
es-pp.anon_vma_fork.dup_mmap.dup_mm.copy_process.kernel_clone
>       1.49            +0.2        1.65 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.free_pgtables.unmap_region.__do_munmap.__vm_munmap.__x64_sys_mun=
map
>       3.15            +0.3        3.41        perf-profile.calltrace.cycl=
es-pp.dup_mmap.dup_mm.copy_process.kernel_clone.__do_sys_clone
>       3.21            +0.3        3.47        perf-profile.calltrace.cycl=
es-pp.dup_mm.copy_process.kernel_clone.__do_sys_clone.do_syscall_64
>      13.99            +0.3       14.31        perf-profile.calltrace.cycl=
es-pp.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_after_hwframe.ptrace
>      14.01            +0.3       14.33        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.ptrace
>      14.01            +0.3       14.34        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.ptrace
>      14.07            +0.3       14.40        perf-profile.calltrace.cycl=
es-pp.ptrace
>       5.75            +0.3        6.10        perf-profile.calltrace.cycl=
es-pp.copy_process.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>       3.25            +0.3        3.60        perf-profile.calltrace.cycl=
es-pp.unmap_region.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64
>       6.05            +0.4        6.41        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__libc_fork
>       6.05            +0.4        6.41        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fork
>       6.04            +0.4        6.41        perf-profile.calltrace.cycl=
es-pp.kernel_clone.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.__libc_fork
>       6.05            +0.4        6.41        perf-profile.calltrace.cycl=
es-pp.__do_sys_clone.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_fo=
rk
>       3.69            +0.4        4.05        perf-profile.calltrace.cycl=
es-pp.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwf=
rame.__munmap
>       3.67            +0.4        4.03        perf-profile.calltrace.cycl=
es-pp.__do_munmap.__vm_munmap.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_=
64_after_hwframe
>       3.69            +0.4        4.06        perf-profile.calltrace.cycl=
es-pp.__x64_sys_munmap.do_syscall_64.entry_SYSCALL_64_after_hwframe.__munmap
>       6.40            +0.4        6.79        perf-profile.calltrace.cycl=
es-pp.__libc_fork
>       0.17 =C2=B1141%      +0.4        0.57 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.tlb_finish_mmu.unmap_region.__do_munmap.__vm_munmap.__x64_s=
ys_munmap
>       0.17 =C2=B1141%      +0.5        0.63        perf-profile.calltrace=
.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_ca=
ll.do_idle
>       0.00            +0.6        0.56 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.tlb_batch_pages_flush.tlb_finish_mmu.unmap_region.__do_munmap.__=
vm_munmap
>       2.23 =C2=B1  4%      +0.6        2.80        perf-profile.calltrace=
.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>       2.22 =C2=B1  4%      +0.6        2.79        perf-profile.calltrace=
.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_n=
o_verify
>       2.25 =C2=B1  3%      +0.6        2.82        perf-profile.calltrace=
.cycles-pp.secondary_startup_64_no_verify
>      10.65            +0.6       11.22        perf-profile.calltrace.cycl=
es-pp.ptrace_check_attach.__x64_sys_ptrace.do_syscall_64.entry_SYSCALL_64_a=
fter_hwframe.ptrace
>       2.23 =C2=B1  4%      +0.6        2.81        perf-profile.calltrace=
.cycles-pp.start_secondary.secondary_startup_64_no_verify
>       0.00            +0.6        0.60        perf-profile.calltrace.cycl=
es-pp.mwait_idle_with_hints.intel_idle_irq.cpuidle_enter_state.cpuidle_ente=
r.cpuidle_idle_call
>       0.00            +0.6        0.61        perf-profile.calltrace.cycl=
es-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_seconda=
ry.secondary_startup_64_no_verify
>       8.91            +0.6        9.55        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath.queued_read_lock_slowpath.ptrace_che=
ck_attach.__x64_sys_ptrace.do_syscall_64
>       9.01            +0.7        9.67        perf-profile.calltrace.cycl=
es-pp.queued_read_lock_slowpath.ptrace_check_attach.__x64_sys_ptrace.do_sys=
call_64.entry_SYSCALL_64_after_hwframe
>      39.82            -1.6       38.20        perf-profile.children.cycle=
s-pp.do_wait
>      39.94            -1.6       38.32        perf-profile.children.cycle=
s-pp.kernel_wait4
>      40.19            -1.6       38.59        perf-profile.children.cycle=
s-pp.wait4
>      67.21            -1.5       65.70        perf-profile.children.cycle=
s-pp.queued_read_lock_slowpath
>      78.42            -1.4       77.01        perf-profile.children.cycle=
s-pp.native_queued_spin_lock_slowpath
>      91.18            -0.9       90.32        perf-profile.children.cycle=
s-pp.do_syscall_64
>      91.21            -0.9       90.35        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>       2.05            -0.5        1.51        perf-profile.children.cycle=
s-pp.try_to_wake_up
>      25.90            -0.4       25.52        perf-profile.children.cycle=
s-pp.ptrace_stop
>      23.50            -0.4       23.14        perf-profile.children.cycle=
s-pp.ptrace_notify
>      23.49            -0.4       23.13        perf-profile.children.cycle=
s-pp.ptrace_do_notify
>       1.14            -0.3        0.83        perf-profile.children.cycle=
s-pp.arch_ptrace
>       1.14            -0.3        0.83        perf-profile.children.cycle=
s-pp.ptrace_request
>       0.93            -0.2        0.71        perf-profile.children.cycle=
s-pp.__wake_up_common
>       0.76            -0.2        0.54 =C2=B1  2%  perf-profile.children.=
cycles-pp._raw_spin_lock
>       0.95            -0.2        0.73        perf-profile.children.cycle=
s-pp.__wake_up_common_lock
>      11.73            -0.2       11.51        perf-profile.children.cycle=
s-pp.syscall_trace_enter
>       1.00            -0.2        0.80        perf-profile.children.cycle=
s-pp.do_notify_parent_cldstop
>      11.78            -0.1       11.64        perf-profile.children.cycle=
s-pp.syscall_exit_work
>      13.13            -0.1       12.99        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>       0.51 =C2=B1  2%      -0.1        0.39        perf-profile.children.=
cycles-pp.schedule_idle
>       1.39 =C2=B1  2%      -0.1        1.27        perf-profile.children.=
cycles-pp.wait_task_inactive
>       0.15 =C2=B1  3%      -0.1        0.08        perf-profile.children.=
cycles-pp.set_next_entity
>       2.62            -0.0        2.58        perf-profile.children.cycle=
s-pp.sigprocmask
>       0.27 =C2=B1  5%      -0.0        0.24        perf-profile.children.=
cycles-pp.task_tick_fair
>       0.73            -0.0        0.70        perf-profile.children.cycle=
s-pp.update_load_avg
>       0.61 =C2=B1  3%      -0.0        0.58        perf-profile.children.=
cycles-pp.ttwu_do_activate
>       0.36 =C2=B1  4%      -0.0        0.33        perf-profile.children.=
cycles-pp.tick_sched_timer
>       0.35 =C2=B1  4%      -0.0        0.32        perf-profile.children.=
cycles-pp.tick_sched_handle
>       0.35 =C2=B1  3%      -0.0        0.32        perf-profile.children.=
cycles-pp.update_process_times
>       0.31 =C2=B1  4%      -0.0        0.28        perf-profile.children.=
cycles-pp.scheduler_tick
>       0.40 =C2=B1  3%      -0.0        0.38        perf-profile.children.=
cycles-pp.__hrtimer_run_queues
>       0.47 =C2=B1  3%      -0.0        0.44        perf-profile.children.=
cycles-pp.hrtimer_interrupt
>       2.47            -0.0        2.44        perf-profile.children.cycle=
s-pp.ptrace_signal
>       0.47 =C2=B1  3%      -0.0        0.44        perf-profile.children.=
cycles-pp.__sysvec_apic_timer_interrupt
>       1.39            -0.0        1.37        perf-profile.children.cycle=
s-pp.kill
>       0.08 =C2=B1  6%      -0.0        0.06        perf-profile.children.=
cycles-pp.do_send_sig_info
>       0.11            -0.0        0.10 =C2=B1  4%  perf-profile.children.=
cycles-pp.__list_del_entry_valid
>       0.10 =C2=B1  4%      -0.0        0.09        perf-profile.children.=
cycles-pp.__x64_sys_kill
>       0.16            -0.0        0.15        perf-profile.children.cycle=
s-pp.update_rq_clock
>       0.10            -0.0        0.09        perf-profile.children.cycle=
s-pp.kill_something_info
>       0.09            -0.0        0.08        perf-profile.children.cycle=
s-pp.kill_pid_info
>       0.11            -0.0        0.10        perf-profile.children.cycle=
s-pp.__send_signal_locked
>       0.14            +0.0        0.15        perf-profile.children.cycle=
s-pp.ret_from_fork
>       0.05            +0.0        0.06        perf-profile.children.cycle=
s-pp.cgroup_rstat_updated
>       0.05            +0.0        0.06        perf-profile.children.cycle=
s-pp.d_invalidate
>       0.11            +0.0        0.12        perf-profile.children.cycle=
s-pp.switch_fpu_return
>       0.07            +0.0        0.08        perf-profile.children.cycle=
s-pp.shim_clflush_select
>       0.07            +0.0        0.08        perf-profile.children.cycle=
s-pp.__cond_resched
>       0.26            +0.0        0.27        perf-profile.children.cycle=
s-pp.remove_vma
>       0.12            +0.0        0.13        perf-profile.children.cycle=
s-pp.free_pages_and_swap_cache
>       0.08            +0.0        0.09        perf-profile.children.cycle=
s-pp.restore_fpregs_from_fpstate
>       0.08            +0.0        0.09        perf-profile.children.cycle=
s-pp.walk_component
>       0.14 =C2=B1  3%      +0.0        0.16 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.dup_task_struct
>       0.14            +0.0        0.15 =C2=B1  3%  perf-profile.children.=
cycles-pp.vma_interval_tree_remove
>       0.14 =C2=B1  3%      +0.0        0.15        perf-profile.children.=
cycles-pp.___perf_sw_event
>       0.07            +0.0        0.08 =C2=B1  5%  perf-profile.children.=
cycles-pp.perf_trace_sched_wakeup_template
>       0.07 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.getuid(a)plt
>       0.21 =C2=B1  2%      +0.0        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.do_filp_open
>       0.21 =C2=B1  2%      +0.0        0.23 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.path_openat
>       0.16 =C2=B1  2%      +0.0        0.18 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.stress_set_oom_adjustment
>       0.15            +0.0        0.16 =C2=B1  2%  perf-profile.children.=
cycles-pp.__switch_to_asm
>       0.13 =C2=B1  3%      +0.0        0.14        perf-profile.children.=
cycles-pp._find_next_bit
>       0.08 =C2=B1  6%      +0.0        0.09        perf-profile.children.=
cycles-pp.sched_clock_cpu
>       0.11 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__switch_to
>       0.09 =C2=B1  5%      +0.0        0.10        perf-profile.children.=
cycles-pp.wake_affine
>       0.23 =C2=B1  2%      +0.0        0.25        perf-profile.children.=
cycles-pp.do_sys_openat2
>       0.23 =C2=B1  2%      +0.0        0.24        perf-profile.children.=
cycles-pp.update_sg_wakeup_stats
>       0.23 =C2=B1  2%      +0.0        0.24        perf-profile.children.=
cycles-pp.do_set_pte
>       0.15 =C2=B1  3%      +0.0        0.16 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.page_add_file_rmap
>       0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       0.24            +0.0        0.25        perf-profile.children.cycle=
s-pp.find_idlest_group
>       0.24            +0.0        0.25        perf-profile.children.cycle=
s-pp.__x64_sys_openat
>       0.61            +0.0        0.63        perf-profile.children.cycle=
s-pp.kmem_cache_free
>       0.52            +0.0        0.54        perf-profile.children.cycle=
s-pp.kmem_cache_alloc
>       0.28            +0.0        0.30        perf-profile.children.cycle=
s-pp.wake_up_new_task
>       0.11 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.11 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.cpumask_next_wrap
>       0.06            +0.0        0.08        perf-profile.children.cycle=
s-pp.native_sched_clock
>       0.31            +0.0        0.33        perf-profile.children.cycle=
s-pp.open64
>       0.17 =C2=B1  4%      +0.0        0.19 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.set_task_cpu
>       0.16            +0.0        0.18        perf-profile.children.cycle=
s-pp.wait_task_stopped
>       0.08            +0.0        0.10        perf-profile.children.cycle=
s-pp.update_blocked_averages
>       0.24            +0.0        0.26        perf-profile.children.cycle=
s-pp.find_idlest_cpu
>       0.12 =C2=B1  3%      +0.0        0.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.prepare_task_switch
>       0.37            +0.0        0.40 =C2=B1  2%  perf-profile.children.=
cycles-pp.update_cfs_group
>       0.26            +0.0        0.29 =C2=B1  4%  perf-profile.children.=
cycles-pp.copy_present_pte
>       0.17            +0.0        0.20 =C2=B1  2%  perf-profile.children.=
cycles-pp.wait_consider_task
>       4.94            +0.0        4.97        perf-profile.children.cycle=
s-pp.exit_to_user_mode_loop
>       4.90            +0.0        4.93        perf-profile.children.cycle=
s-pp.get_signal
>       0.64            +0.0        0.67        perf-profile.children.cycle=
s-pp.dequeue_task_fair
>       0.49            +0.0        0.52        perf-profile.children.cycle=
s-pp.dequeue_entity
>       0.19 =C2=B1  2%      +0.0        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.up_write
>       0.64            +0.0        0.68        perf-profile.children.cycle=
s-pp.anon_vma_interval_tree_insert
>       0.19            +0.0        0.22 =C2=B1  2%  perf-profile.children.=
cycles-pp.page_remove_file_rmap
>       2.18            +0.0        2.21        perf-profile.children.cycle=
s-pp.exit_notify
>       3.73            +0.0        3.77        perf-profile.children.cycle=
s-pp.irqentry_exit_to_user_mode
>       0.55 =C2=B1  3%      +0.0        0.59 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.copy_p4d_range
>       0.44 =C2=B1  3%      +0.0        0.48 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.copy_pte_range
>       0.30            +0.0        0.34 =C2=B1  3%  perf-profile.children.=
cycles-pp.unlink_file_vma
>       5.06            +0.0        5.10        perf-profile.children.cycle=
s-pp.exit_to_user_mode_prepare
>       0.57 =C2=B1  2%      +0.0        0.62 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.copy_page_range
>       0.13            +0.0        0.18 =C2=B1  2%  perf-profile.children.=
cycles-pp.finish_task_switch
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.llist_reverse_order
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.perf_tp_event
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.__cgroup_account_cputime
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.userfaultfd_unmap_prep
>       0.33            +0.1        0.38        perf-profile.children.cycle=
s-pp.down_write
>       0.30            +0.1        0.35        perf-profile.children.cycle=
s-pp.available_idle_cpu
>       2.42            +0.1        2.47        perf-profile.children.cycle=
s-pp.do_group_exit
>       2.42            +0.1        2.47        perf-profile.children.cycle=
s-pp.do_exit
>       2.27            +0.1        2.32        perf-profile.children.cycle=
s-pp.release_task
>       0.65 =C2=B1  3%      +0.1        0.70        perf-profile.children.=
cycles-pp.cgroup_enter_frozen
>       0.39            +0.1        0.44 =C2=B1  3%  perf-profile.children.=
cycles-pp.page_remove_rmap
>       2.18            +0.1        2.24        perf-profile.children.cycle=
s-pp.__do_sys_setpgid
>       2.28            +0.1        2.33        perf-profile.children.cycle=
s-pp.wait_task_zombie
>       0.24 =C2=B1  8%      +0.1        0.30 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__put_anon_vma
>       2.22            +0.1        2.28        perf-profile.children.cycle=
s-pp.__setpgid
>       0.50            +0.1        0.56 =C2=B1  2%  perf-profile.children.=
cycles-pp.next_uptodate_page
>       0.00            +0.1        0.06        perf-profile.children.cycle=
s-pp.__smp_call_single_queue
>       0.00            +0.1        0.06        perf-profile.children.cycle=
s-pp.llist_add_batch
>       0.38 =C2=B1  3%      +0.1        0.44 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.release_pages
>       2.12            +0.1        2.18        perf-profile.children.cycle=
s-pp.ptrace_traceme
>       0.40 =C2=B1  2%      +0.1        0.46 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.rwsem_spin_on_owner
>       0.70 =C2=B1  3%      +0.1        0.77        perf-profile.children.=
cycles-pp.cgroup_leave_frozen
>       0.59            +0.1        0.65        perf-profile.children.cycle=
s-pp._raw_read_lock
>       0.50 =C2=B1  2%      +0.1        0.57 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tlb_finish_mmu
>       0.49 =C2=B1  2%      +0.1        0.56 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tlb_batch_pages_flush
>       0.00            +0.1        0.07        perf-profile.children.cycle=
s-pp.__flush_smp_call_function_queue
>       0.56            +0.1        0.65        perf-profile.children.cycle=
s-pp.select_idle_cpu
>       0.29 =C2=B1  7%      +0.1        0.38 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.osq_lock
>       0.64            +0.1        0.74        perf-profile.children.cycle=
s-pp.select_idle_sibling
>       1.79 =C2=B1  5%      +0.1        1.88        perf-profile.children.=
cycles-pp.schedule
>       0.95            +0.1        1.05        perf-profile.children.cycle=
s-pp.filemap_map_pages
>       0.00            +0.1        0.10        perf-profile.children.cycle=
s-pp.__sysvec_call_function_single
>       1.28            +0.1        1.38        perf-profile.children.cycle=
s-pp.anon_vma_clone
>       0.77            +0.1        0.88        perf-profile.children.cycle=
s-pp.select_task_rq
>       1.12            +0.1        1.23        perf-profile.children.cycle=
s-pp.zap_pte_range
>       0.99            +0.1        1.09        perf-profile.children.cycle=
s-pp.do_fault
>       0.00            +0.1        0.11 =C2=B1  4%  perf-profile.children.=
cycles-pp.sysvec_call_function_single
>       1.17            +0.1        1.28        perf-profile.children.cycle=
s-pp.zap_pmd_range
>       1.10 =C2=B1  2%      +0.1        1.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.unlink_anon_vmas
>       0.98            +0.1        1.09        perf-profile.children.cycle=
s-pp.do_read_fault
>       1.24            +0.1        1.35        perf-profile.children.cycle=
s-pp.unmap_vmas
>       1.21            +0.1        1.33        perf-profile.children.cycle=
s-pp.unmap_page_range
>       1.00            +0.1        1.12        perf-profile.children.cycle=
s-pp.select_task_rq_fair
>       1.30            +0.1        1.43        perf-profile.children.cycle=
s-pp.__handle_mm_fault
>       1.35            +0.1        1.49        perf-profile.children.cycle=
s-pp.handle_mm_fault
>       0.00            +0.1        0.13 =C2=B1  3%  perf-profile.children.=
cycles-pp.ttwu_queue_wakelist
>       0.00            +0.1        0.13 =C2=B1  3%  perf-profile.children.=
cycles-pp.asm_sysvec_call_function_single
>       1.50 =C2=B1  3%      +0.1        1.63        perf-profile.children.=
cycles-pp._raw_spin_lock_irq
>       1.56            +0.1        1.71        perf-profile.children.cycle=
s-pp.do_user_addr_fault
>       1.59            +0.2        1.74        perf-profile.children.cycle=
s-pp.exc_page_fault
>       1.49            +0.2        1.65 =C2=B1  2%  perf-profile.children.=
cycles-pp.free_pgtables
>       0.77 =C2=B1  4%      +0.2        0.92 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.rwsem_optimistic_spin
>       1.77            +0.2        1.93        perf-profile.children.cycle=
s-pp.anon_vma_fork
>       0.80 =C2=B1  3%      +0.2        0.96 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.rwsem_down_write_slowpath
>       0.47 =C2=B1  5%      +0.2        0.64        perf-profile.children.=
cycles-pp.intel_idle_irq
>       5.56            +0.2        5.77        perf-profile.children.cycle=
s-pp.asm_exc_page_fault
>      10.51            +0.2       10.76        perf-profile.children.cycle=
s-pp.queued_write_lock_slowpath
>       3.21            +0.3        3.47        perf-profile.children.cycle=
s-pp.dup_mm
>       3.15            +0.3        3.42        perf-profile.children.cycle=
s-pp.dup_mmap
>      13.99            +0.3       14.32        perf-profile.children.cycle=
s-pp.__x64_sys_ptrace
>      14.08            +0.3       14.41        perf-profile.children.cycle=
s-pp.ptrace
>       3.25            +0.3        3.60        perf-profile.children.cycle=
s-pp.unmap_region
>       5.75            +0.3        6.10        perf-profile.children.cycle=
s-pp.copy_process
>       3.68            +0.4        4.04        perf-profile.children.cycle=
s-pp.__do_munmap
>       6.05            +0.4        6.41        perf-profile.children.cycle=
s-pp.kernel_clone
>       6.05            +0.4        6.41        perf-profile.children.cycle=
s-pp.__do_sys_clone
>       3.69            +0.4        4.05        perf-profile.children.cycle=
s-pp.__vm_munmap
>       3.69            +0.4        4.06        perf-profile.children.cycle=
s-pp.__x64_sys_munmap
>       6.44            +0.4        6.83        perf-profile.children.cycle=
s-pp.__libc_fork
>       0.00            +0.6        0.55        perf-profile.children.cycle=
s-pp.sched_ttwu_pending
>       2.25 =C2=B1  3%      +0.6        2.82        perf-profile.children.=
cycles-pp.secondary_startup_64_no_verify
>       2.25 =C2=B1  3%      +0.6        2.82        perf-profile.children.=
cycles-pp.cpu_startup_entry
>      10.65            +0.6       11.22        perf-profile.children.cycle=
s-pp.ptrace_check_attach
>       2.24 =C2=B1  4%      +0.6        2.82        perf-profile.children.=
cycles-pp.do_idle
>       2.23 =C2=B1  4%      +0.6        2.81        perf-profile.children.=
cycles-pp.start_secondary
>       0.00            +0.6        0.63        perf-profile.children.cycle=
s-pp.flush_smp_call_function_queue
>      77.89            -1.4       76.52        perf-profile.self.cycles-pp=
.native_queued_spin_lock_slowpath
>       1.29            -0.1        1.18        perf-profile.self.cycles-pp=
.wait_task_inactive
>       0.52 =C2=B1  2%      -0.1        0.47 =C2=B1  2%  perf-profile.self=
.cycles-pp.update_load_avg
>       0.09 =C2=B1  5%      -0.0        0.06        perf-profile.self.cycl=
es-pp.enqueue_entity
>       0.11            -0.0        0.09 =C2=B1  5%  perf-profile.self.cycl=
es-pp.enqueue_task_fair
>       0.12            -0.0        0.10        perf-profile.self.cycles-pp=
.update_rq_clock
>       0.11            -0.0        0.09 =C2=B1  5%  perf-profile.self.cycl=
es-pp.__list_del_entry_valid
>       0.31            -0.0        0.30        perf-profile.self.cycles-pp=
.queued_write_lock_slowpath
>       0.14            +0.0        0.15        perf-profile.self.cycles-pp=
.anon_vma_clone
>       0.05            +0.0        0.06        perf-profile.self.cycles-pp=
.prepare_task_switch
>       0.05            +0.0        0.06        perf-profile.self.cycles-pp=
.task_h_load
>       0.11            +0.0        0.12        perf-profile.self.cycles-pp=
.free_swap_cache
>       0.08            +0.0        0.09        perf-profile.self.cycles-pp=
.restore_fpregs_from_fpstate
>       0.06            +0.0        0.07        perf-profile.self.cycles-pp=
.stress_vm_segv
>       0.06            +0.0        0.07        perf-profile.self.cycles-pp=
.native_sched_clock
>       0.14            +0.0        0.15 =C2=B1  3%  perf-profile.self.cycl=
es-pp.vma_interval_tree_remove
>       0.05            +0.0        0.06 =C2=B1  7%  perf-profile.self.cycl=
es-pp.newidle_balance
>       0.20 =C2=B1  2%      +0.0        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.update_sg_wakeup_stats
>       0.06 =C2=B1  8%      +0.0        0.07        perf-profile.self.cycl=
es-pp.cpumask_next_wrap
>       0.12 =C2=B1  4%      +0.0        0.13        perf-profile.self.cycl=
es-pp.ptrace_check_attach
>       0.11 =C2=B1  4%      +0.0        0.13 =C2=B1  3%  perf-profile.self=
.cycles-pp.__update_load_avg_cfs_rq
>       0.16 =C2=B1  3%      +0.0        0.17        perf-profile.self.cycl=
es-pp.select_idle_cpu
>       0.27            +0.0        0.29        perf-profile.self.cycles-pp=
._raw_spin_lock_irq
>       0.19            +0.0        0.21 =C2=B1  2%  perf-profile.self.cycl=
es-pp.filemap_map_pages
>       0.15 =C2=B1  3%      +0.0        0.16 =C2=B1  2%  perf-profile.self=
.cycles-pp.__switch_to_asm
>       0.11 =C2=B1  4%      +0.0        0.12 =C2=B1  3%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.12 =C2=B1  3%      +0.0        0.14        perf-profile.self.cycl=
es-pp.wait_task_stopped
>       0.06            +0.0        0.08 =C2=B1  6%  perf-profile.self.cycl=
es-pp.__handle_mm_fault
>       0.40            +0.0        0.42        perf-profile.self.cycles-pp=
._raw_spin_lock
>       0.18 =C2=B1  2%      +0.0        0.20 =C2=B1  2%  perf-profile.self=
.cycles-pp.dup_mmap
>       0.15 =C2=B1  3%      +0.0        0.17 =C2=B1  4%  perf-profile.self=
.cycles-pp.do_wait
>       0.58            +0.0        0.61        perf-profile.self.cycles-pp=
.queued_read_lock_slowpath
>       0.37 =C2=B1  2%      +0.0        0.40        perf-profile.self.cycl=
es-pp.update_cfs_group
>       0.64            +0.0        0.67        perf-profile.self.cycles-pp=
.anon_vma_interval_tree_insert
>       0.19            +0.0        0.22 =C2=B1  3%  perf-profile.self.cycl=
es-pp.up_write
>       0.25            +0.0        0.28 =C2=B1  4%  perf-profile.self.cycl=
es-pp.copy_present_pte
>       0.17 =C2=B1  2%      +0.0        0.20 =C2=B1  2%  perf-profile.self=
.cycles-pp.page_remove_file_rmap
>       0.28            +0.0        0.32        perf-profile.self.cycles-pp=
.down_write
>       0.29            +0.0        0.33        perf-profile.self.cycles-pp=
.available_idle_cpu
>       0.63 =C2=B1  2%      +0.0        0.68        perf-profile.self.cycl=
es-pp.zap_pte_range
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.cgroup_rstat_updated
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.llist_reverse_order
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.userfaultfd_unmap_prep
>       0.30 =C2=B1  3%      +0.1        0.36 =C2=B1  3%  perf-profile.self=
.cycles-pp.release_pages
>       0.39 =C2=B1  3%      +0.1        0.45 =C2=B1  4%  perf-profile.self=
.cycles-pp.rwsem_spin_on_owner
>       0.49            +0.1        0.55 =C2=B1  2%  perf-profile.self.cycl=
es-pp.next_uptodate_page
>       0.00            +0.1        0.06        perf-profile.self.cycles-pp=
.llist_add_batch
>       0.58            +0.1        0.64        perf-profile.self.cycles-pp=
._raw_read_lock
>       0.29 =C2=B1  5%      +0.1        0.37 =C2=B1  3%  perf-profile.self=
.cycles-pp.osq_lock
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp9: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10=
GHz (Cascade Lake) with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/ipc/iterations/kconfig/mode/nr_threads/rootfs/t=
box_group/testcase/ucode:
>   gcc-11/performance/pipe/8/x86_64-rhel-8.3/process/50%/debian-11.1-x86_6=
4-20220510.cgz/lkp-csl-2sp9/hackbench/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     317933            +7.2%     340823 =C2=B1  2%  hackbench.throughput
>     281.33            -5.6%     265.66        hackbench.time.elapsed_time
>     281.33            -5.6%     265.66        hackbench.time.elapsed_time=
.max
>  9.332e+08 =C2=B1  2%     -10.1%  8.387e+08 =C2=B1  2%  hackbench.time.in=
voluntary_context_switches
>      22332            -6.2%      20950        hackbench.time.system_time
>       1668            -3.3%       1613        hackbench.time.user_time
>  2.484e+09            -7.0%  2.311e+09        hackbench.time.voluntary_co=
ntext_switches
>       0.99 =C2=B1  2%      +0.3        1.33        mpstat.cpu.all.irq%
>  4.607e+08 =C2=B1  3%     -14.8%  3.927e+08        cpuidle..time
>   59750049           -14.4%   51160896        cpuidle..usage
>     107526 =C2=B1 46%     -44.8%      59395 =C2=B1 13%  numa-meminfo.node=
0.Mapped
>     886278 =C2=B1 86%     -81.7%     162163 =C2=B1 69%  numa-meminfo.node=
1.Mapped
>      26816 =C2=B1 46%     -44.4%      14905 =C2=B1 14%  numa-vmstat.node0=
.nr_mapped
>     220693 =C2=B1 86%     -81.7%      40319 =C2=B1 67%  numa-vmstat.node1=
.nr_mapped
>       1851 =C2=B1  4%     +30.6%       2418 =C2=B1  3%  sched_debug.cpu.a=
vg_idle.min
>      86.08 =C2=B1  9%     +29.5%     111.46 =C2=B1 11%  sched_debug.cpu.c=
lock_task.stddev
>   20680126 =C2=B1  3%     -49.3%   10478464 =C2=B1  2%  turbostat.C1
>       0.43 =C2=B1 22%      -0.2        0.22 =C2=B1  3%  turbostat.C1%
>       0.38 =C2=B1  2%      -0.0        0.35 =C2=B1  3%  turbostat.POLL%
>    4953449 =C2=B1 39%     -34.7%    3235753 =C2=B1  7%  vmstat.memory.cac=
he
>   12228000            -2.2%   11965069        vmstat.system.cs
>    1391657            +4.2%    1450409        vmstat.system.in
>     359385 =C2=B1  9%     -10.0%     323464 =C2=B1  2%  meminfo.AnonPages
>    4834275 =C2=B1 40%     -35.4%    3122465 =C2=B1  8%  meminfo.Cached
>    3260439 =C2=B1 61%     -53.9%    1501744 =C2=B1 17%  meminfo.Committed=
_AS
>    2453612 =C2=B1 81%     -70.9%     713687 =C2=B1 36%  meminfo.Inactive
>    2453432 =C2=B1 81%     -70.9%     713334 =C2=B1 36%  meminfo.Inactive(=
anon)
>     993573 =C2=B1 79%     -77.7%     221100 =C2=B1 53%  meminfo.Mapped
>    6637365 =C2=B1 31%     -27.4%    4821818 =C2=B1  5%  meminfo.Memused
>    2183740 =C2=B1 90%     -78.4%     471571 =C2=B1 53%  meminfo.Shmem
>    7821764 =C2=B1 17%     -21.1%    6170585 =C2=B1  6%  meminfo.max_used_=
kB
>      89894 =C2=B1  9%     -10.0%      80918 =C2=B1  2%  proc-vmstat.nr_an=
on_pages
>    1209129 =C2=B1 40%     -35.5%     779734 =C2=B1  8%  proc-vmstat.nr_fi=
le_pages
>     613996 =C2=B1 81%     -71.0%     178154 =C2=B1 36%  proc-vmstat.nr_in=
active_anon
>     248662 =C2=B1 79%     -77.7%      55432 =C2=B1 52%  proc-vmstat.nr_ma=
pped
>     546495 =C2=B1 90%     -78.6%     117009 =C2=B1 53%  proc-vmstat.nr_sh=
mem
>     613996 =C2=B1 81%     -71.0%     178154 =C2=B1 36%  proc-vmstat.nr_zo=
ne_inactive_anon
>     303380 =C2=B1 16%     -39.0%     185031 =C2=B1 21%  proc-vmstat.numa_=
hint_faults
>     200464 =C2=B1 20%     -42.8%     114585 =C2=B1 22%  proc-vmstat.numa_=
hint_faults_local
>   89782752            +3.6%   93042546        proc-vmstat.numa_hit
>   89705243            +3.6%   92968283        proc-vmstat.numa_local
>     672643 =C2=B1 37%     -45.7%     365098 =C2=B1  9%  proc-vmstat.numa_=
pte_updates
>   89776545            +3.6%   93036044        proc-vmstat.pgalloc_normal
>    1626079 =C2=B1  4%     -10.8%    1450258 =C2=B1  3%  proc-vmstat.pgfau=
lt
>   89378790            +4.1%   93037516        proc-vmstat.pgfree
>      15.75            -2.9%      15.30        perf-stat.i.MPKI
>  2.723e+10            +2.2%  2.782e+10        perf-stat.i.branch-instruct=
ions
>       1.15            -0.0        1.13        perf-stat.i.branch-miss-rat=
e%
>       2.15 =C2=B1  5%      +0.2        2.34 =C2=B1  4%  perf-stat.i.cache=
-miss-rate%
>   42514112 =C2=B1  4%      +8.4%   46069933 =C2=B1  5%  perf-stat.i.cache=
-misses
>   12338031            -2.2%   12068469        perf-stat.i.context-switches
>       1.80            -1.9%       1.76        perf-stat.i.cpi
>  3.993e+10            +2.1%  4.076e+10        perf-stat.i.dTLB-loads
>  2.294e+10            +1.8%  2.336e+10        perf-stat.i.dTLB-stores
>      66.43            +1.1       67.51        perf-stat.i.iTLB-load-miss-=
rate%
>   76738049            -3.1%   74356040        perf-stat.i.iTLB-loads
>  1.353e+11            +2.1%  1.382e+11        perf-stat.i.instructions
>       0.56            +2.1%       0.57        perf-stat.i.ipc
>       1047            +2.0%       1068        perf-stat.i.metric.M/sec
>       5305 =C2=B1  3%      -5.9%       4990 =C2=B1  3%  perf-stat.i.minor=
-faults
>    8761133 =C2=B1  3%      +9.8%    9619722 =C2=B1  4%  perf-stat.i.node-=
load-misses
>    5459816 =C2=B1  2%      +7.2%    5852880 =C2=B1  4%  perf-stat.i.node-=
store-misses
>       5307 =C2=B1  3%      -5.9%       4993 =C2=B1  3%  perf-stat.i.page-=
faults
>      15.51            -3.0%      15.05        perf-stat.overall.MPKI
>       1.13            -0.0        1.12        perf-stat.overall.branch-mi=
ss-rate%
>       2.03 =C2=B1  4%      +0.2        2.22 =C2=B1  4%  perf-stat.overall=
.cache-miss-rate%
>       1.78            -2.0%       1.75        perf-stat.overall.cpi
>       0.12 =C2=B1  6%      -0.0        0.11 =C2=B1  2%  perf-stat.overall=
.dTLB-load-miss-rate%
>      66.43            +1.1       67.51        perf-stat.overall.iTLB-load=
-miss-rate%
>       0.56            +2.1%       0.57        perf-stat.overall.ipc
>  2.714e+10            +2.1%  2.771e+10        perf-stat.ps.branch-instruc=
tions
>   42404117 =C2=B1  4%      +8.3%   45914737 =C2=B1  5%  perf-stat.ps.cach=
e-misses
>   12297697            -2.2%   12031391        perf-stat.ps.context-switch=
es
>  3.978e+10            +2.0%   4.06e+10        perf-stat.ps.dTLB-loads
>  2.286e+10            +1.8%  2.327e+10        perf-stat.ps.dTLB-stores
>   76489212            -3.1%   74128795        perf-stat.ps.iTLB-loads
>  1.349e+11            +2.0%  1.376e+11        perf-stat.ps.instructions
>       5314 =C2=B1  3%      -6.6%       4961 =C2=B1  3%  perf-stat.ps.mino=
r-faults
>    8734611 =C2=B1  3%      +9.7%    9580673 =C2=B1  4%  perf-stat.ps.node=
-load-misses
>    5441379 =C2=B1  2%      +7.1%    5827671 =C2=B1  4%  perf-stat.ps.node=
-store-misses
>       5317 =C2=B1  3%      -6.6%       4964 =C2=B1  3%  perf-stat.ps.page=
-faults
>  3.807e+13            -3.7%  3.667e+13        perf-stat.total.instructions
>      13.75            +0.3       14.09        perf-profile.calltrace.cycl=
es-pp.dequeue_task_fair.__schedule.schedule.pipe_read.new_sync_read
>      15.17 =C2=B1  3%      +0.5       15.70        perf-profile.calltrace=
.cycles-pp.enqueue_task_fair.ttwu_do_activate.try_to_wake_up.autoremove_wak=
e_function.__wake_up_common
>      15.28 =C2=B1  3%      +0.5       15.82        perf-profile.calltrace=
.cycles-pp.ttwu_do_activate.try_to_wake_up.autoremove_wake_function.__wake_=
up_common.__wake_up_common_lock
>       5.21 =C2=B1  4%      +0.7        5.91 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_switch.__schedule.schedule.e=
xit_to_user_mode_loop
>       5.42 =C2=B1  4%      +0.7        6.14 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_switch.__schedule.schedule.exit_to_user_mo=
de_loop.exit_to_user_mode_prepare
>       6.62 =C2=B1  9%      +0.8        7.45 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.__get_user_nocheck_8.perf_callchain_user.get_perf_callchain=
.perf_callchain.perf_prepare_sample
>       3.28 =C2=B1 16%      +1.0        4.24 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.perf_prepare_sample.perf_event_output_forward.__perf_event_=
overflow.perf_tp_event.perf_trace_sched_migrate_task
>       3.38 =C2=B1 16%      +1.0        4.34 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.__perf_event_overflow.perf_tp_event.perf_trace_sched_migrat=
e_task.set_task_cpu.try_to_wake_up
>       3.36 =C2=B1 16%      +1.0        4.33 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.perf_event_output_forward.__perf_event_overflow.perf_tp_eve=
nt.perf_trace_sched_migrate_task.set_task_cpu
>       3.44 =C2=B1 16%      +1.0        4.44 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.perf_tp_event.perf_trace_sched_migrate_task.set_task_cpu.tr=
y_to_wake_up.autoremove_wake_function
>       3.49 =C2=B1 16%      +1.0        4.49 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.perf_trace_sched_migrate_task.set_task_cpu.try_to_wake_up.a=
utoremove_wake_function.__wake_up_common
>       4.06 =C2=B1 15%      +1.1        5.14 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.set_task_cpu.try_to_wake_up.autoremove_wake_function.__wake=
_up_common.__wake_up_common_lock
>       9.21 =C2=B1  4%      +1.1       10.30        perf-profile.calltrace=
.cycles-pp.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.__libc_write
>       9.10 =C2=B1  4%      +1.1       10.19        perf-profile.calltrace=
.cycles-pp.exit_to_user_mode_prepare.syscall_exit_to_user_mode.do_syscall_6=
4.entry_SYSCALL_64_after_hwframe.__libc_write
>      57.10            +1.1       58.22        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.__libc_write
>      56.86            +1.1       57.98        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.__libc_write
>       8.61 =C2=B1  4%      +1.1        9.74 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.exit_to_user_mode_loop.exit_to_user_mod=
e_prepare.syscall_exit_to_user_mode
>       8.67 =C2=B1  4%      +1.1        9.81 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.schedule.exit_to_user_mode_loop.exit_to_user_mode_prepare.s=
yscall_exit_to_user_mode.do_syscall_64
>      58.57            +1.2       59.74        perf-profile.calltrace.cycl=
es-pp.__libc_write
>       8.76 =C2=B1  4%      +1.2        9.99 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.exit_to_user_mode_loop.exit_to_user_mode_prepare.syscall_ex=
it_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe
>       0.65 =C2=B1 69%      -0.6        0.05 =C2=B1 77%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>       0.65 =C2=B1 69%      -0.6        0.05 =C2=B1 77%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>       0.65 =C2=B1 69%      -0.6        0.05 =C2=B1 77%  perf-profile.chil=
dren.cycles-pp.do_idle
>       0.64 =C2=B1 69%      -0.6        0.05 =C2=B1 77%  perf-profile.chil=
dren.cycles-pp.start_secondary
>       1.24 =C2=B1  8%      -0.2        1.04 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.copy_user_enhanced_fast_string
>       0.28 =C2=B1 50%      -0.2        0.09 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.__mutex_lock
>       0.23 =C2=B1 41%      -0.1        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.record__mmap_read_evlist
>       0.23 =C2=B1 41%      -0.1        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.perf_mmap__push
>       0.23 =C2=B1 41%      -0.1        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.record__pushfn
>       0.23 =C2=B1 40%      -0.1        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.generic_file_write_iter
>       0.23 =C2=B1 40%      -0.1        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__generic_file_write_iter
>       0.23 =C2=B1 40%      -0.1        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       0.53 =C2=B1 11%      -0.1        0.42 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.copyin
>       0.24 =C2=B1 37%      -0.1        0.13 =C2=B1 28%  perf-profile.chil=
dren.cycles-pp.__mutex_unlock_slowpath
>       0.16 =C2=B1 55%      -0.1        0.06 =C2=B1 48%  perf-profile.chil=
dren.cycles-pp.wake_up_q
>      15.64            +0.4       16.08        perf-profile.children.cycle=
s-pp.enqueue_task_fair
>      15.75            +0.4       16.20        perf-profile.children.cycle=
s-pp.ttwu_do_activate
>       3.51 =C2=B1 16%      +1.0        4.50 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_migrate_task
>      59.07            +1.0       60.08        perf-profile.children.cycle=
s-pp.__libc_write
>       4.08 =C2=B1 15%      +1.1        5.15 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.set_task_cpu
>      39.22            +1.1       40.33        perf-profile.children.cycle=
s-pp.schedule
>       9.11 =C2=B1  5%      +1.2       10.27        perf-profile.children.=
cycles-pp.exit_to_user_mode_loop
>      10.37 =C2=B1  5%      +1.2       11.60        perf-profile.children.=
cycles-pp.syscall_exit_to_user_mode
>      10.18 =C2=B1  5%      +1.2       11.41        perf-profile.children.=
cycles-pp.exit_to_user_mode_prepare
>       0.16 =C2=B1  3%      -0.0        0.14 =C2=B1  4%  perf-profile.self=
.cycles-pp.finish_task_switch
>       0.06 =C2=B1  6%      +0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.ttwu_queue_wakelist
>       0.21 =C2=B1  8%      +0.0        0.25 =C2=B1  6%  perf-profile.self=
.cycles-pp.set_next_buddy
> =

> =

> =

> *************************************************************************=
**************************
> lkp-icl-2sp2: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2.00=
GHz (Ice Lake) with 256G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> cluster/compiler/cpufreq_governor/ip/kconfig/nr_threads/rootfs/runtime/tb=
ox_group/test/testcase/ucode:
>   cs-localhost/gcc-11/performance/ipv4/x86_64-rhel-8.3/25%/debian-11.1-x8=
6_64-20220510.cgz/300s/lkp-icl-2sp2/UDP_RR/netperf/0xd000331
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>    2897681            +1.3%    2934351        netperf.Throughput_total_tps
>      90552            +1.3%      91698        netperf.Throughput_tps
>      10378            +4.8%      10881        netperf.time.minor_page_fau=
lts
>       1511           -39.2%     918.83        netperf.time.percent_of_cpu=
_this_job_got
>       4215           -39.9%       2532        netperf.time.system_time
>     337.04           -30.3%     235.04        netperf.time.user_time
>  8.693e+08            +1.3%  8.803e+08        netperf.time.voluntary_cont=
ext_switches
>  8.693e+08            +1.3%  8.803e+08        netperf.workload
>      20979 =C2=B1  4%      -9.0%      19095 =C2=B1  5%  proc-vmstat.pgact=
ivate
>      73.20            +3.1       76.26        turbostat.C1%
>       0.78            +2.9        3.64        mpstat.cpu.all.irq%
>       6.06            -1.6        4.47        mpstat.cpu.all.soft%
>      16.74            -2.0       14.74        mpstat.cpu.all.sys%
>      38.00           -28.1%      27.33        vmstat.procs.r
>   11439523            +1.3%   11584593        vmstat.system.cs
>    5951961            +1.2%    6025940        vmstat.system.in
>     119282 =C2=B1  8%     -75.4%      29291 =C2=B1 20%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>    1541193 =C2=B1 12%     -63.0%     570028 =C2=B1  9%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>     354476 =C2=B1  7%     -68.6%     111435 =C2=B1 14%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>       0.32 =C2=B1  3%     -21.1%       0.26 =C2=B1  5%  sched_debug.cfs_r=
q:/.h_nr_running.avg
>       9525 =C2=B1  3%     +20.0%      11432 =C2=B1  4%  sched_debug.cfs_r=
q:/.load.avg
>      33675 =C2=B1 10%    +114.1%      72104 =C2=B1 87%  sched_debug.cfs_r=
q:/.load.max
>      12820 =C2=B1  2%     +57.4%      20178 =C2=B1 26%  sched_debug.cfs_r=
q:/.load.stddev
>     119282 =C2=B1  8%     -75.4%      29291 =C2=B1 20%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>    1541193 =C2=B1 12%     -63.0%     570028 =C2=B1  9%  sched_debug.cfs_r=
q:/.max_vruntime.max
>     354476 =C2=B1  7%     -68.6%     111435 =C2=B1 14%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>    1104703 =C2=B1 10%     -59.1%     451566 =C2=B1 10%  sched_debug.cfs_r=
q:/.min_vruntime.avg
>    1722807 =C2=B1 12%     -54.9%     776144 =C2=B1 20%  sched_debug.cfs_r=
q:/.min_vruntime.max
>     459283 =C2=B1 14%     -50.0%     229644 =C2=B1 22%  sched_debug.cfs_r=
q:/.min_vruntime.min
>     288286 =C2=B1 12%     -67.7%      93188 =C2=B1  9%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.32 =C2=B1  2%     -21.1%       0.26 =C2=B1  5%  sched_debug.cfs_r=
q:/.nr_running.avg
>     296.34           -30.8%     204.95 =C2=B1  2%  sched_debug.cfs_rq:/.r=
unnable_avg.avg
>     263.94           -27.6%     191.18        sched_debug.cfs_rq:/.runnab=
le_avg.stddev
>     810487 =C2=B1 23%     -51.7%     391282 =C2=B1 33%  sched_debug.cfs_r=
q:/.spread0.max
>    -453070           -65.7%    -155225        sched_debug.cfs_rq:/.spread=
0.min
>     288295 =C2=B1 12%     -67.7%      93193 =C2=B1  9%  sched_debug.cfs_r=
q:/.spread0.stddev
>     295.88           -30.8%     204.74 =C2=B1  2%  sched_debug.cfs_rq:/.u=
til_avg.avg
>     263.59           -27.5%     191.03        sched_debug.cfs_rq:/.util_a=
vg.stddev
>     156.07 =C2=B1  3%     -50.1%      77.80 =C2=B1  6%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     735.13 =C2=B1  5%     -11.2%     652.93 =C2=B1  8%  sched_debug.cfs_r=
q:/.util_est_enqueued.max
>     224.80           -36.1%     143.75 =C2=B1  3%  sched_debug.cfs_rq:/.u=
til_est_enqueued.stddev
>       1094 =C2=B1  3%     -13.0%     951.53 =C2=B1  7%  sched_debug.cpu.c=
urr->pid.avg
>       0.28 =C2=B1  2%     -24.9%       0.21 =C2=B1  6%  sched_debug.cpu.n=
r_running.avg
>       9.67           -26.9%       7.07        perf-stat.i.MPKI
>  1.954e+10            +3.9%  2.031e+10        perf-stat.i.branch-instruct=
ions
>       1.33            -0.1        1.27        perf-stat.i.branch-miss-rat=
e%
>       1.25 =C2=B1  2%      +0.3        1.57        perf-stat.i.cache-miss=
-rate%
>  9.408e+08           -24.0%  7.152e+08        perf-stat.i.cache-references
>   11524667            +1.3%   11671113        perf-stat.i.context-switches
>       1.29            -4.6%       1.23        perf-stat.i.cpi
>     366.03            +7.3%     392.62        perf-stat.i.cpu-migrations
>  2.865e+10            +4.1%  2.984e+10        perf-stat.i.dTLB-loads
>  1.744e+10            +3.7%  1.809e+10        perf-stat.i.dTLB-stores
>  9.917e+10            +3.9%   1.03e+11        perf-stat.i.instructions
>       0.79            +4.7%       0.82        perf-stat.i.ipc
>     520.11            +3.6%     538.63        perf-stat.i.metric.M/sec
>    2630922            -4.1%    2523585        perf-stat.i.node-store-miss=
es
>       9.49           -26.8%       6.94        perf-stat.overall.MPKI
>       1.29            -0.1        1.23        perf-stat.overall.branch-mi=
ss-rate%
>       1.18 =C2=B1  3%      +0.3        1.50        perf-stat.overall.cach=
e-miss-rate%
>       1.27            -4.5%       1.21        perf-stat.overall.cpi
>       0.79            +4.7%       0.82        perf-stat.overall.ipc
>      34314            +2.6%      35206        perf-stat.overall.path-leng=
th
>  1.948e+10            +3.9%  2.024e+10        perf-stat.ps.branch-instruc=
tions
>  9.376e+08           -24.0%  7.128e+08        perf-stat.ps.cache-referenc=
es
>   11486058            +1.3%   11632058        perf-stat.ps.context-switch=
es
>     365.07            +7.3%     391.61        perf-stat.ps.cpu-migrations
>  2.856e+10            +4.1%  2.974e+10        perf-stat.ps.dTLB-loads
>  1.738e+10            +3.7%  1.803e+10        perf-stat.ps.dTLB-stores
>  9.884e+10            +3.9%  1.027e+11        perf-stat.ps.instructions
>    2622155            -4.1%    2515203        perf-stat.ps.node-store-mis=
ses
>  2.983e+13            +3.9%  3.099e+13        perf-stat.total.instructions
>      48.27           -48.3        0.00        perf-profile.calltrace.cycl=
es-pp.asm_sysvec_reschedule_ipi.acpi_idle_do_entry.acpi_idle_enter.cpuidle_=
enter_state.cpuidle_enter
>      18.85            -4.4       14.41        perf-profile.calltrace.cycl=
es-pp.ip_finish_output2.ip_send_skb.udp_send_skb.udp_sendmsg.sock_sendmsg
>      19.51            -4.4       15.08        perf-profile.calltrace.cycl=
es-pp.ip_send_skb.udp_send_skb.udp_sendmsg.sock_sendmsg.__sys_sendto
>      19.97            -4.4       15.55        perf-profile.calltrace.cycl=
es-pp.udp_send_skb.udp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto
>      15.81            -4.4       11.39        perf-profile.calltrace.cycl=
es-pp.do_softirq.__local_bh_enable_ip.ip_finish_output2.ip_send_skb.udp_sen=
d_skb
>      16.00            -4.4       11.60        perf-profile.calltrace.cycl=
es-pp.__local_bh_enable_ip.ip_finish_output2.ip_send_skb.udp_send_skb.udp_s=
endmsg
>      30.37            -4.4       25.98        perf-profile.calltrace.cycl=
es-pp.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCAL=
L_64_after_hwframe
>      31.58            -4.4       27.21        perf-profile.calltrace.cycl=
es-pp.__sys_sendto.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hw=
frame.sendto
>      15.53            -4.4       11.17        perf-profile.calltrace.cycl=
es-pp.__softirqentry_text_start.do_softirq.__local_bh_enable_ip.ip_finish_o=
utput2.ip_send_skb
>      29.41            -4.3       25.08        perf-profile.calltrace.cycl=
es-pp.udp_sendmsg.sock_sendmsg.__sys_sendto.__x64_sys_sendto.do_syscall_64
>      13.59            -4.0        9.59 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.process_backlog.__napi_poll.net_rx_action.__softirqentry_text_st=
art.do_softirq
>      14.18            -4.0       10.18 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.net_rx_action.__softirqentry_text_start.do_softirq.__local_bh_en=
able_ip.ip_finish_output2
>      13.68            -4.0        9.70 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__napi_poll.net_rx_action.__softirqentry_text_start.do_softirq._=
_local_bh_enable_ip
>      10.94            -3.7        7.20 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_lo=
cal_deliver_finish.__netif_receive_skb_one_core
>      10.86            -3.7        7.13 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.udp_queue_rcv_one_skb.udp_unicast_rcv_skb.__udp4_lib_rcv.ip_prot=
ocol_deliver_rcu.ip_local_deliver_finish
>       9.47            -3.7        5.82 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.sock_def_readable.__udp_enqueue_schedule_skb.udp_queue_rcv_one_s=
kb.udp_unicast_rcv_skb.__udp4_lib_rcv
>       9.76            -3.6        6.12 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__udp_enqueue_schedule_skb.udp_queue_rcv_one_skb.udp_unicast_rcv=
_skb.__udp4_lib_rcv.ip_protocol_deliver_rcu
>      11.76            -3.6        8.12        perf-profile.calltrace.cycl=
es-pp.__udp4_lib_rcv.ip_protocol_deliver_rcu.ip_local_deliver_finish.__neti=
f_receive_skb_one_core.process_backlog
>       9.20            -3.6        5.56 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__wake_up_common_lock.sock_def_readable.__udp_enqueue_schedule_s=
kb.udp_queue_rcv_one_skb.udp_unicast_rcv_skb
>      11.88            -3.6        8.25 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.ip_protocol_deliver_rcu.ip_local_deliver_finish.__netif_receive_=
skb_one_core.process_backlog.__napi_poll
>       8.12            -3.6        4.49 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.try_to_wake_up.autoremove_wake_function.__wake_up_common.__wake_=
up_common_lock.sock_def_readable
>      11.94            -3.6        8.31 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.ip_local_deliver_finish.__netif_receive_skb_one_core.process_bac=
klog.__napi_poll.net_rx_action
>       8.94            -3.6        5.32 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__wake_up_common.__wake_up_common_lock.sock_def_readable.__udp_e=
nqueue_schedule_skb.udp_queue_rcv_one_skb
>       8.28            -3.6        4.68 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.autoremove_wake_function.__wake_up_common.__wake_up_common_lock.=
sock_def_readable.__udp_enqueue_schedule_skb
>      12.54            -3.4        9.13 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__netif_receive_skb_one_core.process_backlog.__napi_poll.net_rx_=
action.__softirqentry_text_start
>      26.78 =C2=B1  3%      -3.1       23.71 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.send_udp_rr.main.__libc_start_main
>      26.50 =C2=B1  3%      -3.1       23.44 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.send_omni_inner.send_udp_rr.main.__libc_start_main
>      15.83 =C2=B1  3%      -2.6       13.24 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner.send_=
udp_rr.main
>      15.98 =C2=B1  3%      -2.5       13.48 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.sendto.send_omni_inner.send_udp_rr.main.__libc_start_main
>      15.88            -2.4       13.50        perf-profile.calltrace.cycl=
es-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.=
send_omni_inner
>      16.10            -2.4       13.73        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.send_omni_inner.s=
end_udp_rr
>       5.76            -2.3        3.44        perf-profile.calltrace.cycl=
es-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_secondary
>       6.01            -2.3        3.69        perf-profile.calltrace.cycl=
es-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.secondary_sta=
rtup_64_no_verify
>      15.89            -2.0       13.90        perf-profile.calltrace.cycl=
es-pp.__x64_sys_sendto.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.=
recv_omni
>      16.11            -2.0       14.12        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.sendto.recv_omni.process=
_requests
>      16.27            -2.0       14.29        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.sendto.recv_omni.process_requests.spaw=
n_child
>      16.51            -2.0       14.54        perf-profile.calltrace.cycl=
es-pp.sendto.recv_omni.process_requests.spawn_child.accept_connection
>       2.97            -1.8        1.19        perf-profile.calltrace.cycl=
es-pp.pick_next_task_fair.__schedule.schedule_idle.do_idle.cpu_startup_entry
>       2.16            -1.3        0.84        perf-profile.calltrace.cycl=
es-pp.set_next_entity.pick_next_task_fair.__schedule.schedule_idle.do_idle
>       6.30            -1.3        4.99 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__schedule.schedule.schedule_timeout.__skb_wait_for_more_packets=
.__skb_recv_udp
>       6.46            -1.2        5.24 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.schedule.schedule_timeout.__skb_wait_for_more_packets.__skb_recv=
_udp.udp_recvmsg
>       6.54            -1.1        5.47 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.schedule_timeout.__skb_wait_for_more_packets.__skb_recv_udp.udp_=
recvmsg.inet_recvmsg
>       8.34            -0.9        7.48 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.__skb_wait_for_more_packets.__skb_recv_udp.udp_recvmsg.inet_recv=
msg.__sys_recvfrom
>      10.27            -0.8        9.44        perf-profile.calltrace.cycl=
es-pp.__skb_recv_udp.udp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recv=
from
>      14.52            -0.6       13.91        perf-profile.calltrace.cycl=
es-pp.udp_recvmsg.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall=
_64
>      14.60            -0.6       14.00        perf-profile.calltrace.cycl=
es-pp.inet_recvmsg.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SY=
SCALL_64_after_hwframe
>      16.43            -0.6       15.88        perf-profile.calltrace.cycl=
es-pp.__sys_recvfrom.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe.recvfrom
>       8.58 =C2=B1  2%      -0.4        8.18 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.send_=
omni_inner.send_udp_rr
>       2.41            -0.2        2.19        perf-profile.calltrace.cycl=
es-pp.dequeue_task_fair.__schedule.schedule.schedule_timeout.__skb_wait_for=
_more_packets
>       8.36            -0.2        8.16        perf-profile.calltrace.cycl=
es-pp.__x64_sys_recvfrom.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvf=
rom.recv_omni
>       2.08            -0.2        1.89        perf-profile.calltrace.cycl=
es-pp.dequeue_entity.dequeue_task_fair.__schedule.schedule.schedule_timeout
>       8.65            -0.2        8.46        perf-profile.calltrace.cycl=
es-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni.proce=
ss_requests
>       8.79            -0.2        8.61        perf-profile.calltrace.cycl=
es-pp.entry_SYSCALL_64_after_hwframe.recvfrom.recv_omni.process_requests.sp=
awn_child
>       9.72            -0.1        9.58        perf-profile.calltrace.cycl=
es-pp.recvfrom.recv_omni.process_requests.spawn_child.accept_connection
>       2.13            +0.0        2.18        perf-profile.calltrace.cycl=
es-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.start_seconda=
ry
>       0.62            +0.3        0.96        perf-profile.calltrace.cycl=
es-pp.prepare_task_switch.__schedule.schedule_idle.do_idle.cpu_startup_entry
>       0.00            +0.5        0.51        perf-profile.calltrace.cycl=
es-pp.___perf_sw_event.prepare_task_switch.__schedule.schedule_idle.do_idle
>       0.00            +0.5        0.52 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.update_load_avg.enqueue_entity.enqueue_task_fair.ttwu_do_activat=
e.sched_ttwu_pending
>       0.00            +0.8        0.77        perf-profile.calltrace.cycl=
es-pp.resched_curr.check_preempt_curr.ttwu_do_wakeup.sched_ttwu_pending.__s=
ysvec_call_function_single
>       0.00            +0.8        0.82        perf-profile.calltrace.cycl=
es-pp.update_rq_clock.sched_ttwu_pending.__sysvec_call_function_single.sysv=
ec_call_function_single.asm_sysvec_call_function_single
>       0.00            +0.9        0.86 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.tick_irq_enter.irq_enter_rcu.sysvec_call_function_single.asm_sys=
vec_call_function_single.acpi_idle_do_entry
>       0.00            +0.9        0.88        perf-profile.calltrace.cycl=
es-pp.irqentry_enter.sysvec_call_function_single.asm_sysvec_call_function_s=
ingle.acpi_idle_do_entry.acpi_idle_enter
>       0.00            +0.9        0.88        perf-profile.calltrace.cycl=
es-pp.check_preempt_curr.ttwu_do_wakeup.sched_ttwu_pending.__sysvec_call_fu=
nction_single.sysvec_call_function_single
>       0.00            +0.9        0.94        perf-profile.calltrace.cycl=
es-pp.llist_reverse_order.__flush_smp_call_function_queue.__sysvec_call_fun=
ction_single.sysvec_call_function_single.asm_sysvec_call_function_single
>       0.00            +0.9        0.94        perf-profile.calltrace.cycl=
es-pp.ttwu_do_wakeup.sched_ttwu_pending.__sysvec_call_function_single.sysve=
c_call_function_single.asm_sysvec_call_function_single
>       0.00            +1.2        1.20 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.irq_enter_rcu.sysvec_call_function_single.asm_sysvec_call_functi=
on_single.acpi_idle_do_entry.acpi_idle_enter
>       0.00            +1.6        1.61        perf-profile.calltrace.cycl=
es-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.=
__sysvec_call_function_single
>       0.00            +1.7        1.71 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.ttwu_queue_wakelist.try_to_wake_up.autoremove_wake_function.__wa=
ke_up_common.__wake_up_common_lock
>       0.00            +1.8        1.81        perf-profile.calltrace.cycl=
es-pp.__flush_smp_call_function_queue.__sysvec_call_function_single.sysvec_=
call_function_single.asm_sysvec_call_function_single.acpi_idle_do_entry
>       0.00            +2.0        1.97        perf-profile.calltrace.cycl=
es-pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_f=
unction_single.sysvec_call_function_single
>       0.00            +2.1        2.06        perf-profile.calltrace.cycl=
es-pp.ttwu_do_activate.sched_ttwu_pending.__sysvec_call_function_single.sys=
vec_call_function_single.asm_sysvec_call_function_single
>       0.00            +4.3        4.35        perf-profile.calltrace.cycl=
es-pp.sched_ttwu_pending.__sysvec_call_function_single.sysvec_call_function=
_single.asm_sysvec_call_function_single.acpi_idle_do_entry
>      42.79            +4.4       47.19        perf-profile.calltrace.cycl=
es-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_ver=
ify
>      43.00            +4.4       47.41        perf-profile.calltrace.cycl=
es-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      43.06            +4.4       47.46        perf-profile.calltrace.cycl=
es-pp.start_secondary.secondary_startup_64_no_verify
>      43.31            +4.4       47.73        perf-profile.calltrace.cycl=
es-pp.secondary_startup_64_no_verify
>       0.00            +6.8        6.81        perf-profile.calltrace.cycl=
es-pp.__sysvec_call_function_single.sysvec_call_function_single.asm_sysvec_=
call_function_single.acpi_idle_do_entry.acpi_idle_enter
>       6.60            +7.3       13.93        perf-profile.calltrace.cycl=
es-pp.acpi_idle_do_entry.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.=
cpuidle_idle_call
>      31.15            +7.5       38.70        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secon=
dary
>      29.32            +7.6       36.88        perf-profile.calltrace.cycl=
es-pp.acpi_idle_enter.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.d=
o_idle
>      30.97            +7.6       38.54        perf-profile.calltrace.cycl=
es-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_start=
up_entry
>      34.13            +7.6       41.74        perf-profile.calltrace.cycl=
es-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary.secondary=
_startup_64_no_verify
>       0.00            +9.7        9.67        perf-profile.calltrace.cycl=
es-pp.sysvec_call_function_single.asm_sysvec_call_function_single.acpi_idle=
_do_entry.acpi_idle_enter.cpuidle_enter_state
>       0.00           +56.3       56.35        perf-profile.calltrace.cycl=
es-pp.asm_sysvec_call_function_single.acpi_idle_do_entry.acpi_idle_enter.cp=
uidle_enter_state.cpuidle_enter
>      25.79           -25.8        0.00        perf-profile.children.cycle=
s-pp.asm_sysvec_reschedule_ipi
>      49.81            -4.6       45.22        perf-profile.children.cycle=
s-pp.do_syscall_64
>      50.35            -4.6       45.78        perf-profile.children.cycle=
s-pp.entry_SYSCALL_64_after_hwframe
>      15.98            -4.5       11.51        perf-profile.children.cycle=
s-pp.__softirqentry_text_start
>      16.04            -4.4       11.59        perf-profile.children.cycle=
s-pp.do_softirq
>      16.31            -4.4       11.90        perf-profile.children.cycle=
s-pp.__local_bh_enable_ip
>      19.02            -4.4       14.66        perf-profile.children.cycle=
s-pp.ip_finish_output2
>      19.69            -4.4       15.34        perf-profile.children.cycle=
s-pp.ip_send_skb
>      20.14            -4.3       15.81        perf-profile.children.cycle=
s-pp.udp_send_skb
>      29.63            -4.2       25.43        perf-profile.children.cycle=
s-pp.udp_sendmsg
>      30.46            -4.2       26.29        perf-profile.children.cycle=
s-pp.sock_sendmsg
>      31.69            -4.1       27.54        perf-profile.children.cycle=
s-pp.__sys_sendto
>      31.90            -4.1       27.75        perf-profile.children.cycle=
s-pp.__x64_sys_sendto
>      33.74            -4.1       29.64        perf-profile.children.cycle=
s-pp.sendto
>      14.01            -4.1        9.95        perf-profile.children.cycle=
s-pp.__napi_poll
>      14.48            -4.0       10.45        perf-profile.children.cycle=
s-pp.net_rx_action
>      13.86            -4.0        9.83        perf-profile.children.cycle=
s-pp.process_backlog
>       9.73            -3.7        6.03        perf-profile.children.cycle=
s-pp.sock_def_readable
>       8.39            -3.7        4.69        perf-profile.children.cycle=
s-pp.try_to_wake_up
>      10.04            -3.7        6.35        perf-profile.children.cycle=
s-pp.__udp_enqueue_schedule_skb
>      11.14            -3.7        7.46        perf-profile.children.cycle=
s-pp.udp_unicast_rcv_skb
>       9.47            -3.7        5.78        perf-profile.children.cycle=
s-pp.__wake_up_common_lock
>      11.09            -3.7        7.41        perf-profile.children.cycle=
s-pp.udp_queue_rcv_one_skb
>       9.19            -3.7        5.51        perf-profile.children.cycle=
s-pp.__wake_up_common
>      12.00            -3.7        8.33        perf-profile.children.cycle=
s-pp.__udp4_lib_rcv
>       8.52            -3.7        4.86        perf-profile.children.cycle=
s-pp.autoremove_wake_function
>      12.42            -3.7        8.77        perf-profile.children.cycle=
s-pp.__schedule
>      12.16            -3.6        8.52        perf-profile.children.cycle=
s-pp.ip_local_deliver_finish
>      12.11            -3.6        8.46        perf-profile.children.cycle=
s-pp.ip_protocol_deliver_rcu
>      12.78            -3.4        9.36        perf-profile.children.cycle=
s-pp.__netif_receive_skb_one_core
>      27.78            -2.6       25.14        perf-profile.children.cycle=
s-pp.send_udp_rr
>      27.69            -2.4       25.32        perf-profile.children.cycle=
s-pp.send_omni_inner
>       6.07            -2.3        3.74        perf-profile.children.cycle=
s-pp.schedule_idle
>      27.42            -2.1       25.31        perf-profile.children.cycle=
s-pp.accept_connection
>      27.42            -2.1       25.31        perf-profile.children.cycle=
s-pp.spawn_child
>      27.42            -2.1       25.31        perf-profile.children.cycle=
s-pp.process_requests
>      27.40            -2.1       25.30        perf-profile.children.cycle=
s-pp.recv_omni
>       3.50            -1.6        1.94 =C2=B1  2%  perf-profile.children.=
cycles-pp.pick_next_task_fair
>       2.25            -1.3        0.93        perf-profile.children.cycle=
s-pp.set_next_entity
>       6.65            -1.2        5.43        perf-profile.children.cycle=
s-pp.schedule
>       2.41            -1.1        1.29        perf-profile.children.cycle=
s-pp.update_rq_clock
>       1.08            -1.0        0.12 =C2=B1  4%  perf-profile.children.=
cycles-pp.tick_nohz_idle_exit
>       7.25            -0.9        6.37        perf-profile.children.cycle=
s-pp.schedule_timeout
>       8.59            -0.8        7.75        perf-profile.children.cycle=
s-pp.__skb_wait_for_more_packets
>      10.53            -0.8        9.74        perf-profile.children.cycle=
s-pp.__skb_recv_udp
>      14.82            -0.7       14.16        perf-profile.children.cycle=
s-pp.udp_recvmsg
>      14.88            -0.7       14.23        perf-profile.children.cycle=
s-pp.inet_recvmsg
>       2.66            -0.6        2.10        perf-profile.children.cycle=
s-pp.ttwu_do_activate
>       2.55            -0.5        2.03        perf-profile.children.cycle=
s-pp.enqueue_task_fair
>      16.68            -0.5       16.16        perf-profile.children.cycle=
s-pp.__sys_recvfrom
>      16.84            -0.5       16.33        perf-profile.children.cycle=
s-pp.__x64_sys_recvfrom
>       0.74 =C2=B1  2%      -0.5        0.28 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irq
>       0.58            -0.4        0.14 =C2=B1  7%  perf-profile.children.=
cycles-pp.pick_next_entity
>       0.79 =C2=B1  3%      -0.4        0.36        perf-profile.children.=
cycles-pp.finish_task_switch
>       0.64 =C2=B1  2%      -0.4        0.22 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.switch_mm_irqs_off
>      20.21            -0.4       19.80        perf-profile.children.cycle=
s-pp.recvfrom
>       1.03            -0.4        0.63        perf-profile.children.cycle=
s-pp.native_apic_msr_eoi_write
>       2.02            -0.3        1.71        perf-profile.children.cycle=
s-pp.update_load_avg
>       1.22            -0.3        0.96        perf-profile.children.cycle=
s-pp.ttwu_do_wakeup
>       1.14 =C2=B1  2%      -0.2        0.90        perf-profile.children.=
cycles-pp.check_preempt_curr
>       2.50            -0.2        2.28        perf-profile.children.cycle=
s-pp.dequeue_task_fair
>       1.94            -0.2        1.72        perf-profile.children.cycle=
s-pp.enqueue_entity
>       0.71            -0.2        0.52 =C2=B1  4%  perf-profile.children.=
cycles-pp.nr_iowait_cpu
>       2.21            -0.2        2.03        perf-profile.children.cycle=
s-pp.dequeue_entity
>       1.02            -0.1        0.91        perf-profile.children.cycle=
s-pp.irqentry_enter
>       0.94            -0.0        0.90 =C2=B1  2%  perf-profile.children.=
cycles-pp.update_curr
>       0.12 =C2=B1  6%      -0.0        0.08 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.perf_trace_sched_stat_runtime
>       0.57 =C2=B1  2%      -0.0        0.53        perf-profile.children.=
cycles-pp.__update_load_avg_se
>       1.39            -0.0        1.35        perf-profile.children.cycle=
s-pp.native_irq_return_iret
>       0.19 =C2=B1  3%      -0.0        0.16 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.fib_lookup_good_nhc
>       0.21            -0.0        0.18 =C2=B1  4%  perf-profile.children.=
cycles-pp.__list_del_entry_valid
>       0.24 =C2=B1  2%      -0.0        0.22 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.rcu_nmi_enter
>       0.14 =C2=B1  4%      -0.0        0.12        perf-profile.children.=
cycles-pp.error_entry
>       0.22 =C2=B1  2%      -0.0        0.20 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp._raw_spin_unlock_irqrestore
>       0.06 =C2=B1  8%      +0.0        0.07 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__cgroup_account_cputime
>       0.47            +0.0        0.48        perf-profile.children.cycle=
s-pp.tick_nohz_idle_enter
>       0.37            +0.0        0.39 =C2=B1  2%  perf-profile.children.=
cycles-pp.netif_rx_internal
>       0.76            +0.0        0.78        perf-profile.children.cycle=
s-pp.ip_generic_getfrag
>       0.40            +0.0        0.42 =C2=B1  2%  perf-profile.children.=
cycles-pp.__netif_rx
>       0.34            +0.0        0.36 =C2=B1  2%  perf-profile.children.=
cycles-pp.enqueue_to_backlog
>       0.09 =C2=B1  4%      +0.0        0.11 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.place_entity
>       0.16 =C2=B1  5%      +0.0        0.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__get_user_4
>       0.08 =C2=B1  4%      +0.0        0.10 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.ip_rcv_finish_core
>       0.08 =C2=B1  6%      +0.0        0.10 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.clear_buddies
>       0.06 =C2=B1  6%      +0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.menu_reflect
>       0.53            +0.0        0.56        perf-profile.children.cycle=
s-pp.syscall_exit_to_user_mode
>       0.47            +0.0        0.50        perf-profile.children.cycle=
s-pp.aa_sk_perm
>       0.44 =C2=B1  2%      +0.0        0.47        perf-profile.children.=
cycles-pp.__might_fault
>       0.94            +0.0        0.97        perf-profile.children.cycle=
s-pp._raw_spin_lock_irqsave
>       0.74            +0.0        0.78        perf-profile.children.cycle=
s-pp.check_heap_object
>       0.06 =C2=B1  7%      +0.0        0.10 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.rb_erase
>       0.09 =C2=B1  5%      +0.0        0.13 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__list_add_valid
>       1.68            +0.0        1.72        perf-profile.children.cycle=
s-pp.loopback_xmit
>       0.20 =C2=B1  3%      +0.0        0.24 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.__netif_receive_skb_core
>       0.74            +0.0        0.79 =C2=B1  3%  perf-profile.children.=
cycles-pp.select_idle_sibling
>       1.10            +0.0        1.15        perf-profile.children.cycle=
s-pp.__consume_stateless_skb
>       0.74            +0.0        0.79        perf-profile.children.cycle=
s-pp.___perf_sw_event
>       2.19            +0.0        2.24        perf-profile.children.cycle=
s-pp.menu_select
>       1.09            +0.0        1.14        perf-profile.children.cycle=
s-pp.skb_release_data
>       0.38 =C2=B1  2%      +0.0        0.43 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp._copy_to_user
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.idle_cpu
>       1.30            +0.1        1.35        perf-profile.children.cycle=
s-pp.__check_object_size
>       0.21 =C2=B1  3%      +0.1        0.26 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_cfs_group
>       0.00            +0.1        0.05 =C2=B1  7%  perf-profile.children.=
cycles-pp.flush_smp_call_function_queue
>       1.01            +0.1        1.06 =C2=B1  2%  perf-profile.children.=
cycles-pp.select_task_rq_fair
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.children.=
cycles-pp.tick_nohz_idle_got_tick
>       0.10 =C2=B1  4%      +0.1        0.16 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.sched_clock
>       0.65            +0.1        0.71 =C2=B1  2%  perf-profile.children.=
cycles-pp.__switch_to_asm
>       0.00            +0.1        0.06 =C2=B1 17%  perf-profile.children.=
cycles-pp.__update_blocked_fair
>       0.09 =C2=B1  7%      +0.1        0.15 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.update_blocked_averages
>       4.40            +0.1        4.47        perf-profile.children.cycle=
s-pp.__ip_append_data
>       0.16 =C2=B1  4%      +0.1        0.24 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.x2apic_send_IPI
>       0.08 =C2=B1  7%      +0.1        0.16 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.update_sg_lb_stats
>       0.99            +0.1        1.07 =C2=B1  5%  perf-profile.children.=
cycles-pp.move_addr_to_user
>       0.00            +0.1        0.09 =C2=B1  8%  perf-profile.children.=
cycles-pp.tick_check_oneshot_broadcast_this_cpu
>       0.04 =C2=B1 45%      +0.1        0.13 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.cpuacct_charge
>       0.17 =C2=B1  2%      +0.1        0.26 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.ip_rcv_core
>       0.10 =C2=B1  5%      +0.1        0.19 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.update_sd_lb_stats
>       0.10 =C2=B1  6%      +0.1        0.21 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.find_busiest_group
>       0.00            +0.1        0.12 =C2=B1  3%  perf-profile.children.=
cycles-pp.send_call_function_single_ipi
>       0.71            +0.1        0.83        perf-profile.children.cycle=
s-pp.__x2apic_send_IPI_dest
>       0.12 =C2=B1  7%      +0.1        0.25 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.load_balance
>       0.82            +0.2        0.98        perf-profile.children.cycle=
s-pp._raw_spin_lock
>       0.56 =C2=B1  3%      +0.2        0.71 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.available_idle_cpu
>       7.00            +0.2        7.15        perf-profile.children.cycle=
s-pp.ip_make_skb
>       0.33            +0.2        0.50 =C2=B1  2%  perf-profile.children.=
cycles-pp.ip_rcv
>       1.10 =C2=B1  2%      +0.2        1.32        perf-profile.children.=
cycles-pp.prepare_task_switch
>       0.00            +0.2        0.23        perf-profile.children.cycle=
s-pp.llist_add_batch
>       0.38 =C2=B1  5%      +0.2        0.62 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.newidle_balance
>       0.00            +0.3        0.26        perf-profile.children.cycle=
s-pp.__smp_call_single_queue
>       0.18 =C2=B1  4%      +0.3        0.51        perf-profile.children.=
cycles-pp.__irq_exit_rcu
>       0.97            +0.5        1.44        perf-profile.children.cycle=
s-pp.native_sched_clock
>       1.16            +0.6        1.73        perf-profile.children.cycle=
s-pp.sched_clock_cpu
>       0.13 =C2=B1  8%      +0.6        0.78        perf-profile.children.=
cycles-pp.resched_curr
>       0.06 =C2=B1 13%      +0.9        0.95 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.tick_irq_enter
>       0.00            +1.0        0.95        perf-profile.children.cycle=
s-pp.llist_reverse_order
>       0.07 =C2=B1 12%      +1.2        1.27 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.irq_enter_rcu
>       0.07 =C2=B1  5%      +1.7        1.79        perf-profile.children.=
cycles-pp.ttwu_queue_wakelist
>       0.00            +1.8        1.84        perf-profile.children.cycle=
s-pp.__flush_smp_call_function_queue
>      43.06            +4.4       47.46        perf-profile.children.cycle=
s-pp.start_secondary
>      43.19            +4.4       47.61        perf-profile.children.cycle=
s-pp.do_idle
>       0.00            +4.4        4.42        perf-profile.children.cycle=
s-pp.sched_ttwu_pending
>      43.31            +4.4       47.73        perf-profile.children.cycle=
s-pp.secondary_startup_64_no_verify
>      43.31            +4.4       47.73        perf-profile.children.cycle=
s-pp.cpu_startup_entry
>       0.00            +6.9        6.87        perf-profile.children.cycle=
s-pp.__sysvec_call_function_single
>      31.36            +7.6       38.95        perf-profile.children.cycle=
s-pp.cpuidle_enter
>      29.52            +7.6       37.11        perf-profile.children.cycle=
s-pp.acpi_idle_enter
>      31.21            +7.6       38.82        perf-profile.children.cycle=
s-pp.cpuidle_enter_state
>      34.43            +7.7       42.08        perf-profile.children.cycle=
s-pp.cpuidle_idle_call
>      29.00            +7.8       36.80        perf-profile.children.cycle=
s-pp.acpi_idle_do_entry
>       0.00            +9.8        9.77        perf-profile.children.cycle=
s-pp.sysvec_call_function_single
>       0.00           +33.6       33.56        perf-profile.children.cycle=
s-pp.asm_sysvec_call_function_single
>       1.56            -1.3        0.23 =C2=B1  3%  perf-profile.self.cycl=
es-pp.set_next_entity
>       1.92            -1.2        0.76        perf-profile.self.cycles-pp=
.update_rq_clock
>       1.65            -0.6        1.05        perf-profile.self.cycles-pp=
.__schedule
>       0.73 =C2=B1  2%      -0.5        0.28 =C2=B1  2%  perf-profile.self=
.cycles-pp._raw_spin_lock_irq
>       0.57            -0.4        0.12 =C2=B1  7%  perf-profile.self.cycl=
es-pp.pick_next_entity
>       0.64 =C2=B1  3%      -0.4        0.21 =C2=B1  3%  perf-profile.self=
.cycles-pp.switch_mm_irqs_off
>       0.72 =C2=B1  3%      -0.4        0.30        perf-profile.self.cycl=
es-pp.finish_task_switch
>       1.02            -0.4        0.62        perf-profile.self.cycles-pp=
.native_apic_msr_eoi_write
>       0.61            -0.4        0.23 =C2=B1  3%  perf-profile.self.cycl=
es-pp.irqtime_account_irq
>       0.63 =C2=B1  2%      -0.3        0.33 =C2=B1  4%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.88            -0.3        0.60        perf-profile.self.cycles-pp=
.update_load_avg
>       0.52 =C2=B1  2%      -0.2        0.32 =C2=B1  3%  perf-profile.self=
.cycles-pp.acpi_idle_enter
>       0.70            -0.2        0.50 =C2=B1  4%  perf-profile.self.cycl=
es-pp.nr_iowait_cpu
>       0.86            -0.1        0.74 =C2=B1  2%  perf-profile.self.cycl=
es-pp.enqueue_entity
>       0.46 =C2=B1  2%      -0.1        0.35 =C2=B1  3%  perf-profile.self=
.cycles-pp.update_curr
>       0.21 =C2=B1  3%      -0.1        0.12 =C2=B1  5%  perf-profile.self=
.cycles-pp.__napi_poll
>       0.29 =C2=B1  3%      -0.1        0.20 =C2=B1  3%  perf-profile.self=
.cycles-pp.process_backlog
>       0.77            -0.1        0.68        perf-profile.self.cycles-pp=
.irqentry_enter
>       0.43 =C2=B1  3%      -0.1        0.35 =C2=B1  3%  perf-profile.self=
.cycles-pp.select_task_rq
>       0.97            -0.1        0.91        perf-profile.self.cycles-pp=
.udp_sendmsg
>       0.36 =C2=B1  4%      -0.1        0.30 =C2=B1  2%  perf-profile.self=
.cycles-pp.dequeue_entity
>       0.79 =C2=B1  2%      -0.0        0.74 =C2=B1  2%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       0.51 =C2=B1  2%      -0.0        0.47        perf-profile.self.cycl=
es-pp.__update_load_avg_se
>       0.25 =C2=B1  2%      -0.0        0.21 =C2=B1  6%  perf-profile.self=
.cycles-pp.dequeue_task_fair
>       0.12 =C2=B1  5%      -0.0        0.08 =C2=B1 14%  perf-profile.self=
.cycles-pp.perf_trace_sched_stat_runtime
>       0.14 =C2=B1  3%      -0.0        0.10 =C2=B1  7%  perf-profile.self=
.cycles-pp.tick_nohz_idle_exit
>       0.10 =C2=B1  4%      -0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.ttwu_do_activate
>       1.38            -0.0        1.35        perf-profile.self.cycles-pp=
.native_irq_return_iret
>       0.18 =C2=B1  3%      -0.0        0.15 =C2=B1  9%  perf-profile.self=
.cycles-pp.fib_lookup_good_nhc
>       0.13 =C2=B1  3%      -0.0        0.11        perf-profile.self.cycl=
es-pp.error_entry
>       0.19            -0.0        0.16 =C2=B1  4%  perf-profile.self.cycl=
es-pp.__list_del_entry_valid
>       0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  7%  perf-profile.self=
.cycles-pp.ttwu_do_wakeup
>       0.22 =C2=B1  3%      -0.0        0.20 =C2=B1  3%  perf-profile.self=
.cycles-pp.pick_next_task_fair
>       0.62            -0.0        0.60        perf-profile.self.cycles-pp=
.skb_set_owner_w
>       0.07 =C2=B1  5%      +0.0        0.08 =C2=B1  4%  perf-profile.self=
.cycles-pp.place_entity
>       0.45            +0.0        0.46        perf-profile.self.cycles-pp=
.__might_resched
>       0.56            +0.0        0.58        perf-profile.self.cycles-pp=
.check_heap_object
>       0.08            +0.0        0.10 =C2=B1  6%  perf-profile.self.cycl=
es-pp.ip_rcv_finish_core
>       0.12 =C2=B1  4%      +0.0        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.__hrtimer_next_event_base
>       0.53            +0.0        0.55        perf-profile.self.cycles-pp=
.udp_recvmsg
>       0.16 =C2=B1  2%      +0.0        0.18 =C2=B1  4%  perf-profile.self=
.cycles-pp.skb_release_data
>       0.16 =C2=B1  3%      +0.0        0.18 =C2=B1  3%  perf-profile.self=
.cycles-pp.__get_user_4
>       0.20 =C2=B1  3%      +0.0        0.23 =C2=B1  5%  perf-profile.self=
.cycles-pp.do_softirq
>       0.91            +0.0        0.93        perf-profile.self.cycles-pp=
._raw_spin_lock_irqsave
>       0.55            +0.0        0.57        perf-profile.self.cycles-pp=
.entry_SYSCALL_64_after_hwframe
>       0.44 =C2=B1  2%      +0.0        0.46 =C2=B1  2%  perf-profile.self=
.cycles-pp.net_rx_action
>       0.04 =C2=B1 44%      +0.0        0.07 =C2=B1  5%  perf-profile.self=
.cycles-pp.clear_buddies
>       0.08 =C2=B1  6%      +0.0        0.11 =C2=B1  3%  perf-profile.self=
.cycles-pp.__list_add_valid
>       0.26 =C2=B1  2%      +0.0        0.29        perf-profile.self.cycl=
es-pp.__local_bh_enable_ip
>       0.62 =C2=B1  2%      +0.0        0.65        perf-profile.self.cycl=
es-pp.__skb_recv_udp
>       0.20 =C2=B1  4%      +0.0        0.24 =C2=B1  4%  perf-profile.self=
.cycles-pp.__sys_recvfrom
>       0.20 =C2=B1  4%      +0.0        0.24        perf-profile.self.cycl=
es-pp.__netif_receive_skb_core
>       0.66 =C2=B1  2%      +0.0        0.70        perf-profile.self.cycl=
es-pp.___perf_sw_event
>       0.03 =C2=B1 70%      +0.0        0.08 =C2=B1  4%  perf-profile.self=
.cycles-pp.rb_erase
>       0.00            +0.1        0.05        perf-profile.self.cycles-pp=
.__irq_exit_rcu
>       0.18 =C2=B1  4%      +0.1        0.23 =C2=B1  6%  perf-profile.self=
.cycles-pp.update_cfs_group
>       0.00            +0.1        0.05 =C2=B1  8%  perf-profile.self.cycl=
es-pp.sched_clock
>       0.06 =C2=B1  6%      +0.1        0.12 =C2=B1  9%  perf-profile.self=
.cycles-pp.update_sg_lb_stats
>       0.00            +0.1        0.06        perf-profile.self.cycles-pp=
.__sysvec_call_function_single
>       0.63 =C2=B1  2%      +0.1        0.70 =C2=B1  2%  perf-profile.self=
.cycles-pp.__switch_to_asm
>       0.08 =C2=B1  4%      +0.1        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.ip_rcv
>       0.15 =C2=B1  5%      +0.1        0.22 =C2=B1  2%  perf-profile.self=
.cycles-pp.sched_clock_cpu
>       0.16 =C2=B1  3%      +0.1        0.23 =C2=B1  3%  perf-profile.self=
.cycles-pp.x2apic_send_IPI
>       0.00            +0.1        0.08 =C2=B1 13%  perf-profile.self.cycl=
es-pp.tick_check_oneshot_broadcast_this_cpu
>       0.00            +0.1        0.08 =C2=B1  5%  perf-profile.self.cycl=
es-pp.tick_irq_enter
>       0.04 =C2=B1 45%      +0.1        0.13 =C2=B1 15%  perf-profile.self=
.cycles-pp.cpuacct_charge
>       0.17 =C2=B1  2%      +0.1        0.26 =C2=B1  2%  perf-profile.self=
.cycles-pp.ip_rcv_core
>       0.09 =C2=B1  6%      +0.1        0.18 =C2=B1  2%  perf-profile.self=
.cycles-pp.schedule
>       0.71            +0.1        0.82        perf-profile.self.cycles-pp=
.__x2apic_send_IPI_dest
>       0.00            +0.1        0.12 =C2=B1  5%  perf-profile.self.cycl=
es-pp.send_call_function_single_ipi
>       0.54 =C2=B1  3%      +0.2        0.70 =C2=B1  3%  perf-profile.self=
.cycles-pp.available_idle_cpu
>       0.77            +0.2        0.94 =C2=B1  2%  perf-profile.self.cycl=
es-pp._raw_spin_lock
>       0.35 =C2=B1  7%      +0.2        0.52        perf-profile.self.cycl=
es-pp.prepare_task_switch
>       0.07 =C2=B1  5%      +0.2        0.25        perf-profile.self.cycl=
es-pp.ttwu_queue_wakelist
>       0.00            +0.2        0.21 =C2=B1  3%  perf-profile.self.cycl=
es-pp.sched_ttwu_pending
>       0.00            +0.2        0.22        perf-profile.self.cycles-pp=
.llist_add_batch
>       0.00            +0.3        0.29        perf-profile.self.cycles-pp=
.sysvec_call_function_single
>       0.00            +0.3        0.32        perf-profile.self.cycles-pp=
.irq_enter_rcu
>       0.60 =C2=B1  4%      +0.3        0.94        perf-profile.self.cycl=
es-pp.schedule_timeout
>       0.00            +0.4        0.38 =C2=B1  3%  perf-profile.self.cycl=
es-pp.asm_sysvec_call_function_single
>      23.90            +0.4       24.31        perf-profile.self.cycles-pp=
.acpi_idle_do_entry
>       0.93            +0.4        1.38        perf-profile.self.cycles-pp=
.native_sched_clock
>       0.13 =C2=B1  8%      +0.6        0.78        perf-profile.self.cycl=
es-pp.resched_curr
>       0.00            +0.9        0.88        perf-profile.self.cycles-pp=
.__flush_smp_call_function_queue
>       0.00            +1.0        0.95        perf-profile.self.cycles-pp=
.llist_reverse_order
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp9: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10=
GHz (Cascade Lake) with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
testcase/ucode:
>   gcc-11/performance/4BRD_12G/f2fs/x86_64-rhel-8.3/100/RAID1/debian-11.1-=
x86_64-20220510.cgz/lkp-csl-2sp9/sync_disk_rw/aim7/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>       1526 =C2=B1 10%    +246.4%       5285 =C2=B1 25%  aim7.jobs-per-min
>     398.30 =C2=B1 11%     -69.4%     121.76 =C2=B1 26%  aim7.time.elapsed=
_time
>     398.30 =C2=B1 11%     -69.4%     121.76 =C2=B1 26%  aim7.time.elapsed=
_time.max
>   86549701            -7.5%   80055785        aim7.time.file_system_outpu=
ts
>    4061406 =C2=B1 10%     -60.0%    1624315 =C2=B1 22%  aim7.time.involun=
tary_context_switches
>      13445 =C2=B1  3%     -10.5%      12039 =C2=B1  4%  aim7.time.minor_p=
age_faults
>       1767 =C2=B1  9%     -32.9%       1186 =C2=B1 15%  aim7.time.system_=
time
>  3.832e+08 =C2=B1 12%     -67.8%  1.232e+08 =C2=B1 30%  aim7.time.volunta=
ry_context_switches
>  3.208e+10 =C2=B1 12%     -72.0%  8.998e+09 =C2=B1 27%  cpuidle..time
>  5.072e+08 =C2=B1 13%     -69.4%   1.55e+08 =C2=B1 31%  cpuidle..usage
>      43.08           -24.9%      32.37 =C2=B1 21%  iostat.cpu.idle
>       6.13 =C2=B1  3%    +119.1%      13.43 =C2=B1 11%  iostat.cpu.system
>     430.38 =C2=B1 11%     -64.2%     153.88 =C2=B1 20%  uptime.boot
>      17079 =C2=B1 11%     -67.9%       5479 =C2=B1  2%  uptime.idle
>      42.81           -11.5       31.28 =C2=B1 22%  mpstat.cpu.all.idle%
>       0.76 =C2=B1  2%      +0.2        0.93 =C2=B1  7%  mpstat.cpu.all.ir=
q%
>       0.05            +0.0        0.06 =C2=B1  7%  mpstat.cpu.all.soft%
>       5.34 =C2=B1  3%      +7.3       12.64 =C2=B1 12%  mpstat.cpu.all.sy=
s%
>       0.09 =C2=B1  8%      +0.1        0.20 =C2=B1 10%  mpstat.cpu.all.us=
r%
>      42.67           -25.4%      31.83 =C2=B1 22%  vmstat.cpu.id
>     108692 =C2=B1  9%    +212.7%     339895 =C2=B1 24%  vmstat.io.bo
>  1.162e+08 =C2=B1  2%     -16.3%   97235935 =C2=B1  3%  vmstat.memory.free
>      88.33 =C2=B1  2%     -33.6%      58.67 =C2=B1 14%  vmstat.procs.b
>       5.17 =C2=B1  7%    +100.0%      10.33 =C2=B1 14%  vmstat.procs.r
>     185561           +14.2%     211999 =C2=B1  3%  vmstat.system.in
>      10476 =C2=B1  8%     +61.0%      16866 =C2=B1 12%  numa-meminfo.node=
0.Dirty
>      31580 =C2=B1  9%     +18.1%      37306 =C2=B1  8%  numa-meminfo.node=
0.Inactive(file)
>   54824112 =C2=B1  7%     -19.4%   44208669 =C2=B1  8%  numa-meminfo.node=
0.MemFree
>   10835242 =C2=B1 36%     +98.0%   21450685 =C2=B1 17%  numa-meminfo.node=
0.MemUsed
>       9855 =C2=B1 12%     +67.2%      16479 =C2=B1 13%  numa-meminfo.node=
1.Dirty
>      29343 =C2=B1  9%     +26.5%      37127 =C2=B1  6%  numa-meminfo.node=
1.Inactive(file)
>   61393162 =C2=B1  4%     -13.5%   53116009 =C2=B1 10%  numa-meminfo.node=
1.MemFree
>    4621337 =C2=B1 56%    +179.1%   12898489 =C2=B1 41%  numa-meminfo.node=
1.MemUsed
>     180156 =C2=B1  2%     -34.3%     118377 =C2=B1 13%  meminfo.AnonHugeP=
ages
>      20545 =C2=B1  3%     +58.5%      32563 =C2=B1 12%  meminfo.Dirty
>      60890           +22.1%      74342 =C2=B1  6%  meminfo.Inactive(file)
>     138527 =C2=B1  3%     +29.7%     179674 =C2=B1  4%  meminfo.KReclaima=
ble
>  1.157e+08 =C2=B1  2%     -16.3%   96822390 =C2=B1  3%  meminfo.MemAvaila=
ble
>  1.162e+08 =C2=B1  2%     -16.3%   97308937 =C2=B1  3%  meminfo.MemFree
>   15456872 =C2=B1 15%    +122.3%   34364917 =C2=B1 10%  meminfo.Memused
>     138527 =C2=B1  3%     +29.7%     179674 =C2=B1  4%  meminfo.SReclaima=
ble
>     322884           +13.2%     365463 =C2=B1  2%  meminfo.Slab
>   17500146 =C2=B1 16%     +99.0%   34825108 =C2=B1 11%  meminfo.max_used_=
kB
>       2613 =C2=B1  8%     +61.2%       4213 =C2=B1 13%  numa-vmstat.node0=
.nr_dirty
>   13706147 =C2=B1  7%     -19.4%   11052112 =C2=B1  8%  numa-vmstat.node0=
.nr_free_pages
>       7894 =C2=B1  9%     +18.1%       9326 =C2=B1  8%  numa-vmstat.node0=
.nr_inactive_file
>      97.83 =C2=B1 67%    -100.0%       0.00        numa-vmstat.node0.nr_m=
lock
>       7894 =C2=B1  9%     +18.1%       9326 =C2=B1  8%  numa-vmstat.node0=
.nr_zone_inactive_file
>     621.67 =C2=B1 18%     -63.2%     228.50 =C2=B1 72%  numa-vmstat.node0=
.nr_zone_write_pending
>       2462 =C2=B1 12%     +67.5%       4126 =C2=B1 13%  numa-vmstat.node1=
.nr_dirty
>   15348666 =C2=B1  4%     -13.5%   13279101 =C2=B1 10%  numa-vmstat.node1=
.nr_free_pages
>       7336 =C2=B1  9%     +26.6%       9285 =C2=B1  6%  numa-vmstat.node1=
.nr_inactive_file
>       7336 =C2=B1  9%     +26.6%       9285 =C2=B1  6%  numa-vmstat.node1=
.nr_zone_inactive_file
>     568.00 =C2=B1 11%     -68.1%     181.17 =C2=B1 64%  numa-vmstat.node1=
.nr_zone_write_pending
>     444.83           +52.0%     676.33 =C2=B1  4%  turbostat.Avg_MHz
>      15.96            +8.4       24.38 =C2=B1  4%  turbostat.Busy%
>  2.476e+08 =C2=B1 12%     -67.0%   81669432 =C2=B1 35%  turbostat.C1
>      46.80            -6.9       39.93 =C2=B1 12%  turbostat.C1%
>  1.495e+08 =C2=B1 12%     -74.3%   38375703 =C2=B1 18%  turbostat.C1E
>      84.02           -11.2%      74.64 =C2=B1  2%  turbostat.CPU%c1
>       0.02         +4791.7%       0.98 =C2=B1133%  turbostat.CPU%c6
>   74404370 =C2=B1 11%     -64.8%   26214041 =C2=B1 22%  turbostat.IRQ
>  1.096e+08 =C2=B1 18%     -68.6%   34360239 =C2=B1 35%  turbostat.POLL
>      53.17            +3.4%      55.00        turbostat.PkgTmp
>     163.95            +6.6%     174.70        turbostat.PkgWatt
>      14.14            +6.7%      15.08        turbostat.RAMWatt
>      63785            +3.3%      65914        proc-vmstat.nr_anon_pages
>   10809810            -7.6%    9991919        proc-vmstat.nr_dirtied
>       5118 =C2=B1  3%     +59.4%       8158 =C2=B1 12%  proc-vmstat.nr_di=
rty
>    2887461 =C2=B1  2%     -16.3%    2415794 =C2=B1  3%  proc-vmstat.nr_di=
rty_background_threshold
>    5781983 =C2=B1  2%     -16.3%    4837496 =C2=B1  3%  proc-vmstat.nr_di=
rty_threshold
>   29054604 =C2=B1  2%     -16.3%   24327424 =C2=B1  3%  proc-vmstat.nr_fr=
ee_pages
>      15227           +22.0%      18583 =C2=B1  6%  proc-vmstat.nr_inactiv=
e_file
>     114.67 =C2=B1 44%    -100.0%       0.00        proc-vmstat.nr_mlock
>      34630 =C2=B1  3%     +29.7%      44918 =C2=B1  4%  proc-vmstat.nr_sl=
ab_reclaimable
>   10774150            -7.6%    9955315        proc-vmstat.nr_written
>      15227           +22.0%      18583 =C2=B1  6%  proc-vmstat.nr_zone_in=
active_file
>       1097 =C2=B1 12%     -62.0%     417.00 =C2=B1 80%  proc-vmstat.nr_zo=
ne_write_pending
>    6341509 =C2=B1  8%     +89.3%   12003005 =C2=B1  6%  proc-vmstat.numa_=
hit
>    6264928 =C2=B1  8%     +90.3%   11922778 =C2=B1  6%  proc-vmstat.numa_=
local
>    6341353 =C2=B1  8%     +89.3%   12002253 =C2=B1  6%  proc-vmstat.pgall=
oc_normal
>       3894 =C2=B1 22%     +97.2%       7678 =C2=B1  6%  proc-vmstat.pgdea=
ctivate
>    1283415 =C2=B1  6%     -54.3%     586146 =C2=B1 37%  proc-vmstat.pgfau=
lt
>    3193580           -26.2%    2357922 =C2=B1 26%  proc-vmstat.pgfree
>   43111608            -7.6%   39849599        proc-vmstat.pgpgout
>      46760 =C2=B1 10%     -57.3%      19952 =C2=B1 15%  proc-vmstat.pgreu=
se
>       7619 =C2=B1 23%    +100.4%      15269 =C2=B1  6%  proc-vmstat.pgrot=
ated
>       0.09 =C2=B1 15%     +81.1%       0.16 =C2=B1 16%  sched_debug.cfs_r=
q:/.h_nr_running.avg
>       0.28 =C2=B1  6%     +31.3%       0.37 =C2=B1  7%  sched_debug.cfs_r=
q:/.h_nr_running.stddev
>       0.05 =C2=B1142%   +1084.6%       0.61 =C2=B1 46%  sched_debug.cfs_r=
q:/.load_avg.min
>       8133 =C2=B1 17%     -31.6%       5564 =C2=B1 16%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>       0.09 =C2=B1 14%     +80.4%       0.16 =C2=B1 16%  sched_debug.cfs_r=
q:/.nr_running.avg
>       0.28 =C2=B1  6%     +31.0%       0.37 =C2=B1  7%  sched_debug.cfs_r=
q:/.nr_running.stddev
>       8.27 =C2=B1 44%    +243.8%      28.42 =C2=B1 47%  sched_debug.cfs_r=
q:/.removed.load_avg.avg
>     289.86 =C2=B1 31%    +125.7%     654.22 =C2=B1 43%  sched_debug.cfs_r=
q:/.removed.load_avg.max
>      44.17 =C2=B1 30%    +178.7%     123.10 =C2=B1 35%  sched_debug.cfs_r=
q:/.removed.load_avg.stddev
>       3.51 =C2=B1 40%    +254.2%      12.43 =C2=B1 39%  sched_debug.cfs_r=
q:/.removed.runnable_avg.avg
>     144.11 =C2=B1 30%    +121.1%     318.69 =C2=B1 41%  sched_debug.cfs_r=
q:/.removed.runnable_avg.max
>      19.97 =C2=B1 28%    +179.9%      55.88 =C2=B1 32%  sched_debug.cfs_r=
q:/.removed.runnable_avg.stddev
>       3.51 =C2=B1 40%    +254.2%      12.43 =C2=B1 39%  sched_debug.cfs_r=
q:/.removed.util_avg.avg
>     144.11 =C2=B1 30%    +121.1%     318.69 =C2=B1 41%  sched_debug.cfs_r=
q:/.removed.util_avg.max
>      19.97 =C2=B1 28%    +179.9%      55.88 =C2=B1 32%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>     101.10 =C2=B1  4%    +109.3%     211.65 =C2=B1 11%  sched_debug.cfs_r=
q:/.runnable_avg.avg
>       1066 =C2=B1  3%      +8.4%       1155 =C2=B1  7%  sched_debug.cfs_r=
q:/.runnable_avg.max
>       0.12 =C2=B1170%   +6854.8%       8.56 =C2=B1140%  sched_debug.cfs_r=
q:/.runnable_avg.min
>     155.43 =C2=B1  3%     +40.0%     217.67 =C2=B1  7%  sched_debug.cfs_r=
q:/.runnable_avg.stddev
>       8133 =C2=B1 17%     -31.6%       5564 =C2=B1 16%  sched_debug.cfs_r=
q:/.spread0.stddev
>     100.71 =C2=B1  4%    +109.5%     211.01 =C2=B1 11%  sched_debug.cfs_r=
q:/.util_avg.avg
>       1065 =C2=B1  3%      +8.4%       1155 =C2=B1  7%  sched_debug.cfs_r=
q:/.util_avg.max
>       0.17 =C2=B1154%   +4752.3%       8.47 =C2=B1141%  sched_debug.cfs_r=
q:/.util_avg.min
>     155.41 =C2=B1  3%     +40.1%     217.75 =C2=B1  7%  sched_debug.cfs_r=
q:/.util_avg.stddev
>      17.21 =C2=B1  4%     +71.8%      29.56 =C2=B1  8%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>     104.99 =C2=B1  3%     +17.1%     122.98 =C2=B1  3%  sched_debug.cfs_r=
q:/.util_est_enqueued.stddev
>     203519 =C2=B1  6%     +86.0%     378456 =C2=B1 15%  sched_debug.cpu.a=
vg_idle.avg
>      23207 =C2=B1 10%     -34.1%      15298 =C2=B1 15%  sched_debug.cpu.a=
vg_idle.min
>     215927 =C2=B1 12%     -64.8%      75933 =C2=B1 19%  sched_debug.cpu.c=
lock.avg
>     215930 =C2=B1 12%     -64.8%      75937 =C2=B1 19%  sched_debug.cpu.c=
lock.max
>     215922 =C2=B1 12%     -64.8%      75928 =C2=B1 19%  sched_debug.cpu.c=
lock.min
>     214420 =C2=B1 12%     -64.8%      75461 =C2=B1 19%  sched_debug.cpu.c=
lock_task.avg
>     214557 =C2=B1 12%     -64.8%      75513 =C2=B1 19%  sched_debug.cpu.c=
lock_task.max
>     213787 =C2=B1 12%     -65.0%      74884 =C2=B1 19%  sched_debug.cpu.c=
lock_task.min
>     489.12 =C2=B1 10%     +77.2%     866.67 =C2=B1 22%  sched_debug.cpu.c=
urr->pid.avg
>       9698 =C2=B1  7%     -39.1%       5905 =C2=B1  7%  sched_debug.cpu.c=
urr->pid.max
>     538311 =C2=B1  3%     +87.0%    1006375 =C2=B1 51%  sched_debug.cpu.m=
ax_idle_balance_cost.max
>       5365 =C2=B1 62%   +1667.9%      94854 =C2=B1105%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>       0.09 =C2=B1  8%     +87.6%       0.17 =C2=B1 21%  sched_debug.cpu.n=
r_running.avg
>       0.28 =C2=B1  3%     +30.1%       0.37 =C2=B1  8%  sched_debug.cpu.n=
r_running.stddev
>    3886268 =C2=B1 16%     -74.8%     979579 =C2=B1 36%  sched_debug.cpu.n=
r_switches.avg
>    4753123 =C2=B1 19%     -76.3%    1127185 =C2=B1 40%  sched_debug.cpu.n=
r_switches.max
>    2510015 =C2=B1 10%     -69.0%     778502 =C2=B1 32%  sched_debug.cpu.n=
r_switches.min
>     513442 =C2=B1 44%     -85.2%      75784 =C2=B1 69%  sched_debug.cpu.n=
r_switches.stddev
>     215923 =C2=B1 12%     -64.8%      75929 =C2=B1 19%  sched_debug.cpu_c=
lk
>     215350 =C2=B1 12%     -65.0%      75355 =C2=B1 19%  sched_debug.ktime
>     216859 =C2=B1 12%     -64.6%      76708 =C2=B1 19%  sched_debug.sched=
_clk
>  3.027e+09           +37.7%  4.168e+09        perf-stat.i.branch-instruct=
ions
>       1.19            +0.5        1.68 =C2=B1 20%  perf-stat.i.branch-mis=
s-rate%
>   35249374 =C2=B1  2%     +67.7%   59107652 =C2=B1  8%  perf-stat.i.branc=
h-misses
>      18.14 =C2=B1  4%      +5.0       23.10 =C2=B1  5%  perf-stat.i.cache=
-miss-rate%
>   51539072 =C2=B1  2%     +75.3%   90324359 =C2=B1  6%  perf-stat.i.cache=
-misses
>  2.857e+08 =C2=B1  4%     +33.4%  3.811e+08 =C2=B1  8%  perf-stat.i.cache=
-references
>    1945960            +5.2%    2046993 =C2=B1  3%  perf-stat.i.context-sw=
itches
>       2.88            +8.2%       3.12 =C2=B1  4%  perf-stat.i.cpi
>  3.961e+10           +52.3%   6.03e+10 =C2=B1  4%  perf-stat.i.cpu-cycles
>       6686 =C2=B1 11%    +327.7%      28595 =C2=B1 20%  perf-stat.i.cpu-m=
igrations
>       0.01 =C2=B1 23%      +0.0        0.06 =C2=B1 59%  perf-stat.i.dTLB-=
load-miss-rate%
>     565205 =C2=B1 16%    +332.6%    2444922 =C2=B1 28%  perf-stat.i.dTLB-=
load-misses
>  3.747e+09           +45.1%  5.438e+09 =C2=B1  2%  perf-stat.i.dTLB-loads
>       0.00 =C2=B1 24%      +0.0        0.01 =C2=B1 68%  perf-stat.i.dTLB-=
store-miss-rate%
>      51172 =C2=B1 14%    +216.7%     162069 =C2=B1 29%  perf-stat.i.dTLB-=
store-misses
>  1.864e+09           +36.4%  2.544e+09        perf-stat.i.dTLB-stores
>      33.72            +1.2       34.89 =C2=B1  2%  perf-stat.i.iTLB-load-=
miss-rate%
>    7385612           +21.5%    8974148        perf-stat.i.iTLB-load-misses
>   14725202           +20.9%   17808328        perf-stat.i.iTLB-loads
>  1.387e+10           +42.1%  1.972e+10        perf-stat.i.instructions
>       1941           +24.1%       2408 =C2=B1  3%  perf-stat.i.instructio=
ns-per-iTLB-miss
>       0.60 =C2=B1 10%    +181.3%       1.68 =C2=B1  6%  perf-stat.i.major=
-faults
>       0.45           +52.2%       0.69 =C2=B1  4%  perf-stat.i.metric.GHz
>     558.11           +57.7%     880.04 =C2=B1  8%  perf-stat.i.metric.K/s=
ec
>     101.40           +40.4%     142.35        perf-stat.i.metric.M/sec
>      94.97            -3.4       91.55        perf-stat.i.node-load-miss-=
rate%
>   22231769           +56.6%   34809028 =C2=B1  5%  perf-stat.i.node-load-=
misses
>    1074012 =C2=B1  7%    +143.7%    2617508 =C2=B1 13%  perf-stat.i.node-=
loads
>      92.47            -4.1       88.35 =C2=B1  2%  perf-stat.i.node-store=
-miss-rate%
>    8136157           +87.1%   15224518 =C2=B1  8%  perf-stat.i.node-store=
-misses
>     631409 =C2=B1 13%    +160.4%    1644054 =C2=B1 20%  perf-stat.i.node-=
stores
>       1.16            +0.3        1.42 =C2=B1  7%  perf-stat.overall.bran=
ch-miss-rate%
>      18.07 =C2=B1  4%      +5.7       23.74 =C2=B1  3%  perf-stat.overall=
.cache-miss-rate%
>       2.86 =C2=B1  2%      +7.1%       3.06 =C2=B1  2%  perf-stat.overall=
.cpi
>     768.67           -13.0%     668.99 =C2=B1  3%  perf-stat.overall.cycl=
es-between-cache-misses
>       0.02 =C2=B1 15%      +0.0        0.04 =C2=B1 26%  perf-stat.overall=
.dTLB-load-miss-rate%
>       0.00 =C2=B1 12%      +0.0        0.01 =C2=B1 28%  perf-stat.overall=
.dTLB-store-miss-rate%
>       1878           +16.9%       2197        perf-stat.overall.instructi=
ons-per-iTLB-miss
>       0.35 =C2=B1  2%      -6.6%       0.33 =C2=B1  2%  perf-stat.overall=
.ipc
>      95.39            -2.4       93.04        perf-stat.overall.node-load=
-miss-rate%
>      92.80            -2.5       90.35        perf-stat.overall.node-stor=
e-miss-rate%
>  3.019e+09           +36.9%  4.132e+09        perf-stat.ps.branch-instruc=
tions
>   35157825 =C2=B1  2%     +66.6%   58574778 =C2=B1  7%  perf-stat.ps.bran=
ch-misses
>   51407192 =C2=B1  2%     +74.1%   89524967 =C2=B1  6%  perf-stat.ps.cach=
e-misses
>   2.85e+08 =C2=B1  4%     +32.5%  3.777e+08 =C2=B1  8%  perf-stat.ps.cach=
e-references
>    1940981            +4.5%    2029274 =C2=B1  3%  perf-stat.ps.context-s=
witches
>  3.951e+10           +51.3%  5.977e+10 =C2=B1  4%  perf-stat.ps.cpu-cycles
>       6668 =C2=B1 11%    +324.9%      28333 =C2=B1 20%  perf-stat.ps.cpu-=
migrations
>     563754 =C2=B1 16%    +329.7%    2422257 =C2=B1 28%  perf-stat.ps.dTLB=
-load-misses
>  3.738e+09           +44.2%   5.39e+09 =C2=B1  2%  perf-stat.ps.dTLB-loads
>      51038 =C2=B1 14%    +214.6%     160565 =C2=B1 28%  perf-stat.ps.dTLB=
-store-misses
>   1.86e+09           +35.6%  2.521e+09        perf-stat.ps.dTLB-stores
>    7366790           +20.8%    8895533        perf-stat.ps.iTLB-load-miss=
es
>   14687561           +20.2%   17652009        perf-stat.ps.iTLB-loads
>  1.384e+10           +41.2%  1.954e+10        perf-stat.ps.instructions
>       0.60 =C2=B1 10%    +179.5%       1.66 =C2=B1  6%  perf-stat.ps.majo=
r-faults
>   22174931           +55.6%   34501460 =C2=B1  5%  perf-stat.ps.node-load=
-misses
>    1071229 =C2=B1  7%    +142.1%    2593745 =C2=B1 13%  perf-stat.ps.node=
-loads
>    8115368           +85.9%   15089754 =C2=B1  7%  perf-stat.ps.node-stor=
e-misses
>     629775 =C2=B1 13%    +158.6%    1628862 =C2=B1 20%  perf-stat.ps.node=
-stores
>   5.52e+12 =C2=B1 10%     -56.7%  2.392e+12 =C2=B1 24%  perf-stat.total.i=
nstructions
>      73.04 =C2=B1  5%     -19.4       53.65 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.secondary_startup_64_no_verify
>      72.28 =C2=B1  5%     -19.2       53.04 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>      72.26 =C2=B1  5%     -19.2       53.03 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_v=
erify
>      72.23 =C2=B1  5%     -19.2       53.01 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup=
_64_no_verify
>      67.43 =C2=B1  5%     -18.3       49.10 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary=
.secondary_startup_64_no_verify
>      66.16 =C2=B1  5%     -17.8       48.37 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle=
.cpu_startup_entry
>      65.59 =C2=B1  5%     -17.6       48.02 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.cpuidle_enter.cpuidle_idle_call.do_idle.cpu_startup_entry.s=
tart_secondary
>      15.97 =C2=B1 16%      -8.8        7.15 =C2=B1 34%  perf-profile.call=
trace.cycles-pp.poll_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_ca=
ll.do_idle
>      25.00 =C2=B1  7%      -7.9       17.06 =C2=B1 23%  perf-profile.call=
trace.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_id=
le_call.do_idle
>       8.52 =C2=B1 23%      -3.5        5.00 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.asm_sysvec_apic_timer_interrupt.mwait_idle_with_hints.intel=
_idle_irq.cpuidle_enter_state.cpuidle_enter
>       3.83 =C2=B1 28%      -2.9        0.92 =C2=B1 38%  perf-profile.call=
trace.cycles-pp.folio_wake_bit.folio_end_writeback.f2fs_write_end_io.raid_e=
nd_bio_io.raid1_end_write_request
>       3.75 =C2=B1 28%      -2.9        0.86 =C2=B1 40%  perf-profile.call=
trace.cycles-pp.__wake_up_common.folio_wake_bit.folio_end_writeback.f2fs_wr=
ite_end_io.raid_end_bio_io
>       3.68 =C2=B1 28%      -2.8        0.83 =C2=B1 40%  perf-profile.call=
trace.cycles-pp.wake_page_function.__wake_up_common.folio_wake_bit.folio_en=
d_writeback.f2fs_write_end_io
>       3.88 =C2=B1 27%      -2.8        1.04 =C2=B1 32%  perf-profile.call=
trace.cycles-pp.folio_end_writeback.f2fs_write_end_io.raid_end_bio_io.raid1=
_end_write_request.__submit_bio
>       3.56 =C2=B1 28%      -2.8        0.80 =C2=B1 41%  perf-profile.call=
trace.cycles-pp.try_to_wake_up.wake_page_function.__wake_up_common.folio_wa=
ke_bit.folio_end_writeback
>       3.97 =C2=B1 26%      -2.7        1.26 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.f2fs_write_end_io.raid_end_bio_io.raid1_end_write_request._=
_submit_bio.__submit_bio_noacct
>       4.08 =C2=B1 25%      -2.7        1.37 =C2=B1 21%  perf-profile.call=
trace.cycles-pp.raid1_end_write_request.__submit_bio.__submit_bio_noacct.fl=
ush_bio_list.flush_pending_writes
>       5.24 =C2=B1  6%      -2.4        2.80 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.io_schedule.folio_wait_bit_common.folio_wait_writeback.f2fs=
_wait_on_page_writeback.f2fs_wait_on_node_pages_writeback
>       5.19 =C2=B1  6%      -2.4        2.78 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.schedule.io_schedule.folio_wait_bit_common.folio_wait_write=
back.f2fs_wait_on_page_writeback
>       5.13 =C2=B1  6%      -2.4        2.76 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.io_schedule.folio_wait_bit_common.folio=
_wait_writeback
>       4.01 =C2=B1 26%      -2.3        1.67 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.raid_end_bio_io.raid1_end_write_request.__submit_bio.__subm=
it_bio_noacct.flush_bio_list
>       4.55 =C2=B1 21%      -2.2        2.31 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.flush_pending_writes.raid1d.md_thread.kthread.ret_from_fork
>       4.55 =C2=B1 20%      -2.2        2.31 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.raid1d.md_thread.kthread.ret_from_fork
>       4.55 =C2=B1 21%      -2.2        2.31 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.flush_bio_list.flush_pending_writes.raid1d.md_thread.kthread
>       4.51 =C2=B1 21%      -2.2        2.27 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.__submit_bio_noacct.flush_bio_list.flush_pending_writes.rai=
d1d.md_thread
>       4.50 =C2=B1 21%      -2.2        2.27 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.__submit_bio.__submit_bio_noacct.flush_bio_list.flush_pendi=
ng_writes.raid1d
>       4.56 =C2=B1 20%      -2.2        2.33 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.md_thread.kthread.ret_from_fork
>       4.94 =C2=B1 15%      -1.7        3.20 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.ret_from_fork
>       4.94 =C2=B1 15%      -1.7        3.20 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.kthread.ret_from_fork
>       3.31 =C2=B1  4%      -1.3        2.04 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair.__schedule.schedule.io_schedule.folio_w=
ait_bit_common
>       3.28 =C2=B1  4%      -1.3        2.03 =C2=B1 20%  perf-profile.call=
trace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.io_=
schedule
>       1.98 =C2=B1  5%      -0.8        1.14 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       1.93 =C2=B1  4%      -0.8        1.10 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__schedule.schedule_idle.do_idle.cpu_startup_entry.start_se=
condary
>       1.26 =C2=B1 19%      -0.7        0.54 =C2=B1 52%  perf-profile.call=
trace.cycles-pp.down_read.__submit_merged_write_cond.f2fs_wait_on_page_writ=
eback.f2fs_wait_on_node_pages_writeback.f2fs_do_sync_file
>       1.55 =C2=B1  9%      -0.7        0.88 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.menu_select.cpuidle_idle_call.do_idle.cpu_startup_entry.sta=
rt_secondary
>       2.07 =C2=B1  2%      +0.3        2.36 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.sta=
rt_secondary.secondary_startup_64_no_verify
>       0.77 =C2=B1  7%      +0.4        1.15 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.ttwu_do_activate.sched_ttwu_pending.flush_smp_call_function=
_queue.do_idle.cpu_startup_entry
>       0.63 =C2=B1  7%      +0.4        1.03 =C2=B1  7%  perf-profile.call=
trace.cycles-pp.enqueue_task_fair.ttwu_do_activate.sched_ttwu_pending.flush=
_smp_call_function_queue.do_idle
>       1.28 =C2=B1  4%      +0.4        1.69 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cp=
u_startup_entry.start_secondary
>       0.63 =C2=B1 12%      +0.5        1.12 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.prepare_write_begin.f2fs_write_begin.generic_perform_write.=
f2fs_buffered_write_iter.f2fs_file_write_iter
>       2.95 =C2=B1  6%      +0.5        3.48 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.update_sd_lb_stats.find_busiest_group.load_balance.newidle_=
balance.pick_next_task_fair
>       3.00 =C2=B1  6%      +0.5        3.52 =C2=B1  6%  perf-profile.call=
trace.cycles-pp.find_busiest_group.load_balance.newidle_balance.pick_next_t=
ask_fair.__schedule
>       0.26 =C2=B1100%      +0.6        0.82 =C2=B1  8%  perf-profile.call=
trace.cycles-pp.enqueue_entity.enqueue_task_fair.ttwu_do_activate.sched_ttw=
u_pending.flush_smp_call_function_queue
>       0.69 =C2=B1 15%      +0.6        1.30 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.f2fs_write_begin.generic_perform_write.f2fs_buffered_write_=
iter.f2fs_file_write_iter.new_sync_write
>       0.27 =C2=B1100%      +0.6        0.88 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.brd_submit_bio.__submit_bio.__submit_bio_noacct.flush_bio_l=
ist.flush_pending_writes
>       0.00            +0.6        0.62 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.rwsem_down_r=
ead_slowpath.__submit_merged_write_cond.f2fs_wait_on_page_writeback
>       0.00            +0.7        0.66 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irq.rwsem_down_read_slowpath.__submit_merged_writ=
e_cond.f2fs_wait_on_page_writeback.f2fs_wait_on_node_pages_writeback
>       0.10 =C2=B1223%      +0.7        0.84 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.copy_to_brd.brd_do_bvec.brd_submit_bio.__submit_bio.__submi=
t_bio_noacct
>       0.10 =C2=B1223%      +0.8        0.86 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.raid1_end_write_request.__submit_bio.__submit_bio_noacct.fl=
ush_bio_list.raid1_unplug
>       2.10 =C2=B1  7%      +0.8        2.88 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.__submit_merged_write_cond.f2fs_wait_on_page_writeback.f2fs=
_wait_on_node_pages_writeback.f2fs_do_sync_file.f2fs_file_write_iter
>       0.00            +0.8        0.78 =C2=B1 14%  perf-profile.calltrace=
.cycles-pp.pick_next_task_fair.__schedule.schedule.rwsem_down_read_slowpath=
.__submit_merged_write_cond
>       0.70 =C2=B1  5%      +0.8        1.51 =C2=B1 14%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.f2fs_wait_on_node_pages_writeback.f2=
fs_do_sync_file.f2fs_file_write_iter.new_sync_write
>       0.08 =C2=B1223%      +0.8        0.93 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.f2fs_merge_page_bio.f2fs_inplace_write_data.f2fs_do_write_d=
ata_page.f2fs_write_single_data_page.f2fs_write_cache_pages
>       0.00            +0.9        0.95 =C2=B1 39%  perf-profile.calltrace=
.cycles-pp.__percpu_counter_sum.f2fs_space_for_roll_forward.f2fs_do_sync_fi=
le.f2fs_file_write_iter.new_sync_write
>       0.10 =C2=B1223%      +1.0        1.05 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.f2fs_inplace_write_data.f2fs_do_write_data_page.f2fs_write_=
single_data_page.f2fs_write_cache_pages.__f2fs_write_data_pages
>       0.00            +1.0        0.95 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.__schedule.schedule.rwsem_down_read_slowpath.__submit_merged_wri=
te_cond.f2fs_wait_on_page_writeback
>       0.00            +1.0        0.96 =C2=B1 13%  perf-profile.calltrace=
.cycles-pp.schedule.rwsem_down_read_slowpath.__submit_merged_write_cond.f2f=
s_wait_on_page_writeback.f2fs_wait_on_node_pages_writeback
>       0.00            +1.0        0.96 =C2=B1 20%  perf-profile.calltrace=
.cycles-pp.f2fs_outplace_write_data.f2fs_do_write_data_page.f2fs_write_sing=
le_data_page.f2fs_write_cache_pages.__f2fs_write_data_pages
>       0.94 =C2=B1 22%      +1.0        1.91 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.generic_perform_write.f2fs_buffered_write_iter.f2fs_file_wr=
ite_iter.new_sync_write.vfs_write
>       0.00            +1.0        0.98 =C2=B1 37%  perf-profile.calltrace=
.cycles-pp.f2fs_space_for_roll_forward.f2fs_do_sync_file.f2fs_file_write_it=
er.new_sync_write.vfs_write
>       0.00            +1.0        0.98 =C2=B1 16%  perf-profile.calltrace=
.cycles-pp.f2fs_submit_merged_ipu_write.f2fs_wait_on_page_writeback.f2fs_wa=
it_on_node_pages_writeback.f2fs_do_sync_file.f2fs_file_write_iter
>       0.95 =C2=B1 23%      +1.0        1.94 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.f2fs_buffered_write_iter.f2fs_file_write_iter.new_sync_writ=
e.vfs_write.ksys_write
>       0.12 =C2=B1223%      +1.1        1.18 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.__submit_merged_write_cond.f2fs_fsync_node_pages.f2fs_do_sy=
nc_file.f2fs_file_write_iter.new_sync_write
>       3.13 =C2=B1  7%      +1.1        4.20 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule=
.schedule
>       0.00            +1.1        1.08 =C2=B1 41%  perf-profile.calltrace=
.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.rwsem_do=
wn_read_slowpath
>       0.39 =C2=B1105%      +1.1        1.47 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.brd_submit_bio.__submit_bio.__submit_bio_noacct.flush_bio_l=
ist.raid1_unplug
>       0.09 =C2=B1223%      +1.1        1.19 =C2=B1 16%  perf-profile.call=
trace.cycles-pp.osq_lock.rwsem_optimistic_spin.rwsem_down_write_slowpath.f2=
fs_submit_page_write.do_write_page
>       0.13 =C2=B1223%      +1.1        1.28 =C2=B1 30%  perf-profile.call=
trace.cycles-pp.f2fs_is_checkpointed_node.f2fs_do_sync_file.f2fs_file_write=
_iter.new_sync_write.vfs_write
>       0.13 =C2=B1223%      +1.2        1.37 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.sch=
edule_timeout
>       0.13 =C2=B1223%      +1.2        1.37 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.pick_next_task_fair.__schedule.schedule.schedule_timeout.__=
wait_for_common
>       0.00            +1.3        1.26 =C2=B1 12%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.f2fs_wai=
t_on_node_pages_writeback.f2fs_do_sync_file.f2fs_file_write_iter
>       0.39 =C2=B1104%      +1.3        1.74 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.f2fs_submit_merged_ipu_write.f2fs_write_cache_pages.__f2fs_=
write_data_pages.do_writepages.filemap_fdatawrite_wbc
>       0.12 =C2=B1223%      +1.4        1.54 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.rwsem_optimistic_spin.rwsem_down_write_slowpath.f2fs_submit=
_page_write.do_write_page.f2fs_do_write_node_page
>       0.15 =C2=B1223%      +1.4        1.59 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.__schedule.schedule.schedule_timeout.__wait_for_common.f2fs=
_issue_flush
>       0.15 =C2=B1223%      +1.4        1.60 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.schedule.schedule_timeout.__wait_for_common.f2fs_issue_flus=
h.f2fs_do_sync_file
>       0.15 =C2=B1223%      +1.4        1.60 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.schedule_timeout.__wait_for_common.f2fs_issue_flush.f2fs_do=
_sync_file.f2fs_file_write_iter
>       0.16 =C2=B1223%      +1.5        1.64 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.__wait_for_common.f2fs_issue_flush.f2fs_do_sync_file.f2fs_f=
ile_write_iter.new_sync_write
>       0.39 =C2=B1110%      +1.5        1.88 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.f2fs_issue_flush.f2fs_do_sync_file.f2fs_file_write_iter.new=
_sync_write.vfs_write
>       0.27 =C2=B1155%      +1.5        1.79 =C2=B1 33%  perf-profile.call=
trace.cycles-pp.rwsem_down_write_slowpath.set_node_addr.__write_node_page.f=
2fs_fsync_node_pages.f2fs_do_sync_file
>       0.30 =C2=B1154%      +1.6        1.93 =C2=B1 32%  perf-profile.call=
trace.cycles-pp.set_node_addr.__write_node_page.f2fs_fsync_node_pages.f2fs_=
do_sync_file.f2fs_file_write_iter
>       0.65 =C2=B1102%      +1.7        2.33 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.brd_do_bvec.brd_submit_bio.__submit_bio.__submit_bio_noacct=
.flush_bio_list
>       0.10 =C2=B1223%      +1.7        1.84 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.rwsem_down_read_slowpath.__submit_merged_write_cond.f2fs_wa=
it_on_page_writeback.f2fs_wait_on_node_pages_writeback.f2fs_do_sync_file
>       0.61 =C2=B1106%      +1.8        2.40 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.__submit_bio.__submit_bio_noacct.flush_bio_list.raid1_unplu=
g.__blk_flush_plug
>       0.61 =C2=B1106%      +1.8        2.40 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.__submit_bio_noacct.flush_bio_list.raid1_unplug.__blk_flush=
_plug.blk_finish_plug
>       0.73 =C2=B1 86%      +1.8        2.56 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.blk_finish_plug.__f2fs_write_data_pages.do_writepages.filem=
ap_fdatawrite_wbc.__filemap_fdatawrite_range
>       0.64 =C2=B1106%      +1.9        2.53 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.flush_bio_list.raid1_unplug.__blk_flush_plug.blk_finish_plu=
g.__f2fs_write_data_pages
>       0.15 =C2=B1223%      +1.9        2.04 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.rwsem_down_write_slowpath.f2fs_submit_page_write.do_write_p=
age.f2fs_do_write_node_page.__write_node_page
>       0.64 =C2=B1106%      +1.9        2.54 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.raid1_unplug.__blk_flush_plug.blk_finish_plug.__f2fs_write_=
data_pages.do_writepages
>       0.65 =C2=B1106%      +1.9        2.56 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.__blk_flush_plug.blk_finish_plug.__f2fs_write_data_pages.do=
_writepages.filemap_fdatawrite_wbc
>       0.36 =C2=B1111%      +1.9        2.29 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.f2fs_submit_page_write.do_write_page.f2fs_do_write_node_pag=
e.__write_node_page.f2fs_fsync_node_pages
>       0.14 =C2=B1223%      +2.1        2.26 =C2=B1 24%  perf-profile.call=
trace.cycles-pp.osq_lock.__mutex_lock.f2fs_allocate_data_block.do_write_pag=
e.f2fs_do_write_node_page
>       0.36 =C2=B1109%      +2.3        2.63 =C2=B1 23%  perf-profile.call=
trace.cycles-pp.__mutex_lock.f2fs_allocate_data_block.do_write_page.f2fs_do=
_write_node_page.__write_node_page
>       0.58 =C2=B1107%      +2.6        3.21 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.f2fs_do_write_data_page.f2fs_write_single_data_page.f2fs_wr=
ite_cache_pages.__f2fs_write_data_pages.do_writepages
>       0.48 =C2=B1109%      +2.7        3.20 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.f2fs_allocate_data_block.do_write_page.f2fs_do_write_node_p=
age.__write_node_page.f2fs_fsync_node_pages
>       0.62 =C2=B1107%      +2.8        3.43 =C2=B1 19%  perf-profile.call=
trace.cycles-pp.f2fs_write_single_data_page.f2fs_write_cache_pages.__f2fs_w=
rite_data_pages.do_writepages.filemap_fdatawrite_wbc
>       1.39 =C2=B1 69%      +4.2        5.61 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.f2fs_write_cache_pages.__f2fs_write_data_pages.do_writepage=
s.filemap_fdatawrite_wbc.__filemap_fdatawrite_range
>       1.02 =C2=B1 91%      +4.9        5.89 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.do_write_page.f2fs_do_write_node_page.__write_node_page.f2f=
s_fsync_node_pages.f2fs_do_sync_file
>       1.02 =C2=B1 91%      +4.9        5.89 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.f2fs_do_write_node_page.__write_node_page.f2fs_fsync_node_p=
ages.f2fs_do_sync_file.f2fs_file_write_iter
>       2.34 =C2=B1 60%      +6.0        8.30 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.__f2fs_write_data_pages.do_writepages.filemap_fdatawrite_wb=
c.__filemap_fdatawrite_range.file_write_and_wait_range
>       2.35 =C2=B1 60%      +6.0        8.30 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.do_writepages.filemap_fdatawrite_wbc.__filemap_fdatawrite_r=
ange.file_write_and_wait_range.f2fs_do_sync_file
>       2.36 =C2=B1 60%      +6.0        8.32 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.filemap_fdatawrite_wbc.__filemap_fdatawrite_range.file_writ=
e_and_wait_range.f2fs_do_sync_file.f2fs_file_write_iter
>       2.36 =C2=B1 60%      +6.0        8.33 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.__filemap_fdatawrite_range.file_write_and_wait_range.f2fs_d=
o_sync_file.f2fs_file_write_iter.new_sync_write
>       2.39 =C2=B1 60%      +6.1        8.47 =C2=B1 17%  perf-profile.call=
trace.cycles-pp.file_write_and_wait_range.f2fs_do_sync_file.f2fs_file_write=
_iter.new_sync_write.vfs_write
>       2.00 =C2=B1 86%      +8.0        9.96 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.__write_node_page.f2fs_fsync_node_pages.f2fs_do_sync_file.f=
2fs_file_write_iter.new_sync_write
>       2.89 =C2=B1 85%     +10.6       13.51 =C2=B1 22%  perf-profile.call=
trace.cycles-pp.f2fs_fsync_node_pages.f2fs_do_sync_file.f2fs_file_write_ite=
r.new_sync_write.vfs_write
>      19.95 =C2=B1 22%     +19.9       39.80 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.f2fs_do_sync_file.f2fs_file_write_iter.new_sync_write.vfs_w=
rite.ksys_write
>      20.97 =C2=B1 22%     +21.0       41.94 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.f2fs_file_write_iter.new_sync_write.vfs_write.ksys_write.do=
_syscall_64
>      20.97 =C2=B1 22%     +21.0       41.96 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.new_sync_write.vfs_write.ksys_write.do_syscall_64.entry_SYS=
CALL_64_after_hwframe
>      21.37 =C2=B1 21%     +21.0       42.39 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.write
>      21.00 =C2=B1 22%     +21.0       42.02 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.vfs_write.ksys_write.do_syscall_64.entry_SYSCALL_64_after_h=
wframe.write
>      21.00 =C2=B1 22%     +21.0       42.04 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.ksys_write.do_syscall_64.entry_SYSCALL_64_after_hwframe.wri=
te
>      21.02 =C2=B1 22%     +21.1       42.09 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.do_syscall_64.entry_SYSCALL_64_after_hwframe.write
>      21.02 =C2=B1 22%     +21.1       42.10 =C2=B1  9%  perf-profile.call=
trace.cycles-pp.entry_SYSCALL_64_after_hwframe.write
>      73.04 =C2=B1  5%     -19.4       53.65 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>      73.04 =C2=B1  5%     -19.4       53.65 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>      73.01 =C2=B1  5%     -19.4       53.63 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.do_idle
>      72.28 =C2=B1  5%     -19.2       53.04 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.start_secondary
>      68.17 =C2=B1  5%     -18.5       49.67 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.cpuidle_idle_call
>      66.30 =C2=B1  5%     -17.7       48.57 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter
>      66.28 =C2=B1  5%     -17.7       48.56 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.cpuidle_enter_state
>      16.17 =C2=B1 16%      -8.9        7.24 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.poll_idle
>      49.10 =C2=B1  2%      -8.4       40.65 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.mwait_idle_with_hints
>      25.27 =C2=B1  7%      -8.0       17.24 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.intel_idle_irq
>       4.32 =C2=B1 26%      -3.2        1.12 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.folio_wake_bit
>       3.82 =C2=B1 27%      -2.9        0.94 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>       3.69 =C2=B1 28%      -2.8        0.85 =C2=B1 39%  perf-profile.chil=
dren.cycles-pp.wake_page_function
>       3.96 =C2=B1 25%      -2.7        1.27 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.folio_end_writeback
>       4.09 =C2=B1 23%      -2.5        1.64 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.f2fs_write_end_io
>       4.17 =C2=B1 23%      -2.4        1.80 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.raid_end_bio_io
>       5.26 =C2=B1  6%      -2.4        2.90 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.io_schedule
>       4.55 =C2=B1 21%      -2.2        2.31 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.flush_pending_writes
>       4.55 =C2=B1 20%      -2.2        2.31 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.raid1d
>       4.56 =C2=B1 20%      -2.2        2.33 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.md_thread
>       5.54 =C2=B1 17%      -2.1        3.43 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_apic_timer_interrupt
>       4.33 =C2=B1 20%      -2.1        2.23 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.raid1_end_write_request
>       4.01 =C2=B1 17%      -2.0        1.97 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.try_to_wake_up
>       4.94 =C2=B1 15%      -1.7        3.20 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ret_from_fork
>       4.94 =C2=B1 15%      -1.7        3.20 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.kthread
>       2.01 =C2=B1  5%      -0.9        1.15 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       1.58 =C2=B1  9%      -0.7        0.90 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.menu_select
>       1.84 =C2=B1  9%      -0.6        1.29 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       1.51 =C2=B1  7%      -0.5        1.00 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.sysvec_apic_timer_interrupt
>       1.61 =C2=B1  9%      -0.4        1.17 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.enqueue_task_fair
>       0.76 =C2=B1  6%      -0.4        0.38 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       1.05 =C2=B1  8%      -0.3        0.71 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__sysvec_apic_timer_interrupt
>       1.38 =C2=B1 12%      -0.3        1.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.down_read
>       1.04 =C2=B1  8%      -0.3        0.70 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.hrtimer_interrupt
>       0.54 =C2=B1  4%      -0.3        0.22 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       1.26 =C2=B1  8%      -0.3        0.94 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       0.51 =C2=B1 20%      -0.3        0.23 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.f2fs_put_page
>       0.57 =C2=B1 14%      -0.3        0.30 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       0.36 =C2=B1 11%      -0.2        0.12 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.switch_mm_irqs_off
>       0.41 =C2=B1 16%      -0.2        0.18 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       0.56 =C2=B1  9%      -0.2        0.35 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.ktime_get
>       0.55 =C2=B1  8%      -0.2        0.40 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__hrtimer_run_queues
>       0.18 =C2=B1 13%      -0.1        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.check_preempt_curr
>       0.23 =C2=B1 12%      -0.1        0.09 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.tick_nohz_idle_exit
>       0.20 =C2=B1 14%      -0.1        0.06 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.ttwu_do_wakeup
>       0.37 =C2=B1 10%      -0.1        0.24 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.clockevents_program_event
>       0.42 =C2=B1  7%      -0.1        0.29 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       0.40 =C2=B1  5%      -0.1        0.28 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__switch_to_asm
>       0.96 =C2=B1  3%      -0.1        0.84 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_load_avg
>       0.40 =C2=B1  9%      -0.1        0.29 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tick_sched_timer
>       0.36 =C2=B1  6%      -0.1        0.26 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.native_sched_clock
>       0.37 =C2=B1  5%      -0.1        0.26 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.__switch_to
>       1.02 =C2=B1  2%      -0.1        0.93 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       0.18 =C2=B1  9%      -0.1        0.10 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.reweight_entity
>       0.32 =C2=B1 10%      -0.1        0.23 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.tick_sched_handle
>       0.31 =C2=B1 12%      -0.1        0.22 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.update_process_times
>       0.26 =C2=B1  3%      -0.1        0.20 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__irq_exit_rcu
>       0.45 =C2=B1  3%      -0.1        0.39 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.14 =C2=B1 14%      -0.1        0.08 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.rcu_idle_exit
>       0.24 =C2=B1  5%      -0.1        0.18 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_se
>       0.15 =C2=B1  4%      -0.1        0.10 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.read_tsc
>       0.14 =C2=B1 13%      -0.1        0.09 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.get_next_timer_interrupt
>       1.14 =C2=B1  2%      -0.0        1.09 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.dequeue_task_fair
>       0.12 =C2=B1  6%      -0.0        0.07 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.tick_nohz_idle_enter
>       0.20 =C2=B1  3%      -0.0        0.16 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__softirqentry_text_start
>       0.08 =C2=B1  7%      -0.0        0.03 =C2=B1 70%  perf-profile.chil=
dren.cycles-pp.__cgroup_account_cputime
>       0.07 =C2=B1 12%      -0.0        0.03 =C2=B1102%  perf-profile.chil=
dren.cycles-pp.call_cpuidle
>       0.20 =C2=B1 11%      -0.0        0.15 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.scheduler_tick
>       0.07 =C2=B1 15%      -0.0        0.03 =C2=B1100%  perf-profile.chil=
dren.cycles-pp.cpuidle_governor_latency_req
>       0.08 =C2=B1 14%      -0.0        0.04 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.rcu_eqs_exit
>       0.06 =C2=B1  7%      -0.0        0.02 =C2=B1 99%  perf-profile.chil=
dren.cycles-pp.put_prev_task_fair
>       0.12 =C2=B1  6%      -0.0        0.08 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.rebalance_domains
>       0.09 =C2=B1 16%      -0.0        0.06 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.rcu_dynticks_inc
>       0.11 =C2=B1  6%      -0.0        0.07 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__wrgsbase_inactive
>       0.09 =C2=B1  5%      -0.0        0.05 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.lapic_next_deadline
>       0.10 =C2=B1  8%      -0.0        0.06 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.__calc_delta
>       0.07 =C2=B1 15%      -0.0        0.04 =C2=B1 45%  perf-profile.chil=
dren.cycles-pp.hrtimer_get_next_event
>       0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.native_irq_return_iret
>       0.08 =C2=B1 11%      -0.0        0.06 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.update_min_vruntime
>       0.26            -0.0        0.24        perf-profile.children.cycle=
s-pp.prepare_task_switch
>       0.05 =C2=B1 47%      +0.0        0.08 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.__slab_free
>       0.09 =C2=B1 14%      +0.0        0.12 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.__might_resched
>       0.06 =C2=B1 21%      +0.0        0.11 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.__update_blocked_fair
>       0.02 =C2=B1144%      +0.1        0.07 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.bio_associate_blkg_from_css
>       0.04 =C2=B1 75%      +0.1        0.09 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.kmem_cache_alloc
>       0.04 =C2=B1 75%      +0.1        0.10 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.queue_work_on
>       0.03 =C2=B1103%      +0.1        0.09 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.__queue_work
>       0.01 =C2=B1223%      +0.1        0.06 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp._wait_barrier
>       0.10 =C2=B1 14%      +0.1        0.16 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.kmem_cache_free
>       0.01 =C2=B1223%      +0.1        0.07 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.f2fs_lookup_rb_tree
>       0.01 =C2=B1223%      +0.1        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.folio_clear_dirty_for_io
>       0.01 =C2=B1223%      +0.1        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.update_sd_pick_busiest
>       0.01 =C2=B1223%      +0.1        0.07 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.sb_mark_inode_writeback
>       0.06 =C2=B1 56%      +0.1        0.13 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.md_flush_request
>       0.03 =C2=B1100%      +0.1        0.09 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__bio_alloc
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.mutex_lock
>       0.02 =C2=B1141%      +0.1        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__mark_inode_dirty
>       0.06 =C2=B1 51%      +0.1        0.13 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.mempool_alloc
>       0.02 =C2=B1142%      +0.1        0.09 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.copyin
>       0.02 =C2=B1142%      +0.1        0.09 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.copy_user_enhanced_fast_string
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.cpumask_next
>       0.40 =C2=B1  3%      +0.1        0.46 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.up_read
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.rmqueue
>       0.02 =C2=B1152%      +0.1        0.10 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.xas_load
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.f2fs_update_dirty_folio
>       0.04 =C2=B1104%      +0.1        0.11 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.submit_bio_noacct
>       0.02 =C2=B1144%      +0.1        0.10 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.copy_page_from_iter_atomic
>       0.01 =C2=B1223%      +0.1        0.09 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.read_node_page
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.percpu_counter_add_batch
>       0.05 =C2=B1 73%      +0.1        0.13 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.bio_alloc_clone
>       0.01 =C2=B1223%      +0.1        0.09 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.f2fs_update_data_blkaddr
>       0.03 =C2=B1102%      +0.1        0.11 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__mod_lruvec_page_state
>       0.01 =C2=B1223%      +0.1        0.09 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.f2fs_get_node_page
>       0.01 =C2=B1223%      +0.1        0.09 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.wake_q_add
>       0.00            +0.1        0.08 =C2=B1 20%  perf-profile.children.=
cycles-pp.osq_unlock
>       0.04 =C2=B1 78%      +0.1        0.13 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_css_rstat_flush
>       0.16 =C2=B1 17%      +0.1        0.25 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.update_blocked_averages
>       0.10 =C2=B1 34%      +0.1        0.19 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.bio_alloc_bioset
>       0.16 =C2=B1 32%      +0.1        0.25 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.process_one_work
>       0.04 =C2=B1105%      +0.1        0.13 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.f2fs_invalidate_blocks
>       0.01 =C2=B1223%      +0.1        0.11 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.wake_affine
>       0.01 =C2=B1223%      +0.1        0.11 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__is_cp_guaranteed
>       0.07 =C2=B1 61%      +0.1        0.17 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.mem_cgroup_wb_stats
>       0.07 =C2=B1 58%      +0.1        0.17 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.cgroup_rstat_flush_locked
>       0.01 =C2=B1223%      +0.1        0.12 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__remove_ino_entry
>       0.07 =C2=B1 58%      +0.1        0.17 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__mem_cgroup_flush_stats
>       0.07 =C2=B1 58%      +0.1        0.17 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.cgroup_rstat_flush_irqsafe
>       0.04 =C2=B1104%      +0.1        0.14 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.f2fs_truncate
>       0.04 =C2=B1104%      +0.1        0.14 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.f2fs_do_truncate_blocks
>       0.04 =C2=B1104%      +0.1        0.14 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.f2fs_truncate_data_blocks_range
>       0.07 =C2=B1 61%      +0.1        0.17 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.balance_dirty_pages
>       0.06 =C2=B1 83%      +0.1        0.16 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>       0.04 =C2=B1 76%      +0.1        0.15 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.f2fs_del_fsync_node_entry
>       0.01 =C2=B1223%      +0.1        0.13 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.__filemap_fdatawait_range
>       0.00            +0.1        0.12 =C2=B1 22%  perf-profile.children.=
cycles-pp.__insert_extent_tree
>       0.15 =C2=B1 31%      +0.1        0.27 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.__submit_merged_bio
>       0.03 =C2=B1106%      +0.1        0.15 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.up_write
>       0.04 =C2=B1109%      +0.1        0.15 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.update_sit_entry
>       0.14 =C2=B1 36%      +0.1        0.26 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.submit_bio_wait
>       0.14 =C2=B1 33%      +0.1        0.26 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.blkdev_issue_flush
>       0.14 =C2=B1 35%      +0.1        0.26 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__submit_flush_wait
>       0.08 =C2=B1 60%      +0.1        0.21 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__has_merged_page
>       0.08 =C2=B1 59%      +0.1        0.21 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.balance_dirty_pages_ratelimited
>       0.00            +0.1        0.13 =C2=B1 19%  perf-profile.children.=
cycles-pp.f2fs_update_extent_tree_range
>       0.06 =C2=B1 82%      +0.1        0.19 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.f2fs_update_inode
>       0.04 =C2=B1103%      +0.1        0.17 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__folio_mark_dirty
>       0.04 =C2=B1115%      +0.1        0.17 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.__sysvec_call_function_single
>       0.08 =C2=B1 38%      +0.1        0.22 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.clear_page_erms
>       0.16 =C2=B1 28%      +0.1        0.30 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.f2fs_write_inode
>       0.10 =C2=B1 52%      +0.1        0.24 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__filemap_get_folio
>       0.10 =C2=B1 52%      +0.1        0.24 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.pagecache_get_page
>       0.04 =C2=B1112%      +0.2        0.19 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.sysvec_call_function_single
>       0.05 =C2=B1106%      +0.2        0.20 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.down_write
>       0.05 =C2=B1104%      +0.2        0.20 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.f2fs_dirty_data_folio
>       0.03 =C2=B1155%      +0.2        0.18 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.f2fs_balance_fs
>       0.05 =C2=B1117%      +0.2        0.21 =C2=B1 27%  perf-profile.chil=
dren.cycles-pp.xas_find_marked
>       0.05 =C2=B1109%      +0.2        0.21 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.complete
>       0.08 =C2=B1 72%      +0.2        0.25 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.__get_node_page
>       0.07 =C2=B1 82%      +0.2        0.24 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__dentry_kill
>       0.07 =C2=B1 82%      +0.2        0.24 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.evict
>       0.07 =C2=B1 82%      +0.2        0.24 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.f2fs_evict_inode
>       0.22 =C2=B1 33%      +0.2        0.38 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.worker_thread
>       0.11 =C2=B1 54%      +0.2        0.28 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.f2fs_write_end
>       0.08 =C2=B1 65%      +0.2        0.25 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.f2fs_update_inode_page
>       0.07 =C2=B1 81%      +0.2        0.24 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_loop
>       0.07 =C2=B1 82%      +0.2        0.24 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.dput
>       0.07 =C2=B1 82%      +0.2        0.24 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.__fput
>       0.07 =C2=B1 82%      +0.2        0.24 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.dentry_kill
>       0.07 =C2=B1 82%      +0.2        0.24 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.task_work_run
>       0.07 =C2=B1 82%      +0.2        0.24 =C2=B1 25%  perf-profile.chil=
dren.cycles-pp.__close
>       0.05 =C2=B1109%      +0.2        0.23 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.f2fs_dirty_node_folio
>       0.21 =C2=B1 26%      +0.2        0.40 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.05 =C2=B1110%      +0.2        0.24 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_call_function_single
>       0.08 =C2=B1 82%      +0.2        0.28 =C2=B1 24%  perf-profile.chil=
dren.cycles-pp.exit_to_user_mode_prepare
>       0.09 =C2=B1 66%      +0.2        0.28 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.filemap_dirty_folio
>       0.10 =C2=B1 63%      +0.2        0.30 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__folio_end_writeback
>       0.12 =C2=B1 39%      +0.2        0.32 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.get_page_from_freelist
>       0.08 =C2=B1 83%      +0.2        0.29 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.syscall_exit_to_user_mode
>       0.12 =C2=B1 44%      +0.2        0.32 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.raw_spin_rq_lock_nested
>       0.05 =C2=B1111%      +0.2        0.26 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.f2fs_is_valid_blkaddr
>       0.13 =C2=B1 41%      +0.2        0.34 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.__alloc_pages
>       0.26 =C2=B1 25%      +0.2        0.48 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp._find_next_bit
>       0.04 =C2=B1114%      +0.2        0.28 =C2=B1 26%  perf-profile.chil=
dren.cycles-pp.__lookup_nat_cache
>       0.08 =C2=B1 74%      +0.2        0.33 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.rwsem_mark_wake
>       0.16 =C2=B1 40%      +0.2        0.41 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.__radix_tree_lookup
>       0.34 =C2=B1 21%      +0.2        0.58 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.cpumask_next_and
>       0.06 =C2=B1117%      +0.2        0.31 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.release_pages
>       0.09 =C2=B1 88%      +0.2        0.34 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.find_busiest_queue
>       0.07 =C2=B1115%      +0.2        0.32 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.__pagevec_release
>       0.09 =C2=B1 70%      +0.3        0.34 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.__folio_start_writeback
>       0.70 =C2=B1 14%      +0.3        0.96 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.idle_cpu
>       0.24 =C2=B1 38%      +0.3        0.55 =C2=B1 12%  perf-profile.chil=
dren.cycles-pp.raid1_write_request
>       2.08 =C2=B1  2%      +0.3        2.40 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.flush_smp_call_function_queue
>       0.06 =C2=B1114%      +0.3        0.40 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.mutex_spin_on_owner
>       0.13 =C2=B1 89%      +0.3        0.47 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.issue_flush_thread
>       0.34 =C2=B1 40%      +0.4        0.77 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.raid1_make_request
>       0.37 =C2=B1 40%      +0.5        0.85 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.md_handle_request
>       0.63 =C2=B1 12%      +0.5        1.12 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.prepare_write_begin
>       0.40 =C2=B1 40%      +0.5        0.91 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.md_submit_bio
>       1.32 =C2=B1  3%      +0.5        1.83 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.sched_ttwu_pending
>       0.14 =C2=B1 79%      +0.5        0.66 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.rwsem_spin_on_owner
>       0.41 =C2=B1 37%      +0.5        0.95 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.brd_insert_page
>       0.35 =C2=B1 78%      +0.6        0.94 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.wake_up_q
>       0.69 =C2=B1 15%      +0.6        1.30 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.f2fs_write_begin
>       0.21 =C2=B1108%      +0.6        0.84 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.find_get_pages_range_tag
>       0.21 =C2=B1108%      +0.6        0.84 =C2=B1 29%  perf-profile.chil=
dren.cycles-pp.pagevec_lookup_range_tag
>       0.36 =C2=B1 51%      +0.6        0.99 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.copy_to_brd
>       0.24 =C2=B1 69%      +0.7        0.93 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.f2fs_merge_page_bio
>       0.20 =C2=B1 69%      +0.8        0.95 =C2=B1 38%  perf-profile.chil=
dren.cycles-pp.__percpu_counter_sum
>       0.19 =C2=B1109%      +0.8        0.96 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.f2fs_need_inode_block_update
>       0.27 =C2=B1 69%      +0.8        1.05 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.f2fs_inplace_write_data
>       0.20 =C2=B1 69%      +0.8        0.98 =C2=B1 37%  perf-profile.chil=
dren.cycles-pp.f2fs_space_for_roll_forward
>       0.18 =C2=B1 73%      +0.8        0.97 =C2=B1 20%  perf-profile.chil=
dren.cycles-pp.f2fs_outplace_write_data
>       0.44 =C2=B1 75%      +0.9        1.32 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.rwsem_wake
>       0.17 =C2=B1 78%      +0.9        1.12 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.f2fs_lookup_extent_tree
>       0.95 =C2=B1 22%      +1.0        1.92 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.generic_perform_write
>       0.95 =C2=B1 23%      +1.0        1.94 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.f2fs_buffered_write_iter
>       0.27 =C2=B1102%      +1.0        1.28 =C2=B1 30%  perf-profile.chil=
dren.cycles-pp.f2fs_is_checkpointed_node
>       0.25 =C2=B1108%      +1.1        1.31 =C2=B1 34%  perf-profile.chil=
dren.cycles-pp.f2fs_get_node_info
>       0.34 =C2=B1 93%      +1.3        1.62 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.schedule_timeout
>       0.38 =C2=B1 89%      +1.3        1.71 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.__wait_for_common
>       1.22 =C2=B1 16%      +1.4        2.60 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       0.48 =C2=B1 73%      +1.4        1.88 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.f2fs_issue_flush
>       0.93 =C2=B1 42%      +1.4        2.33 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.brd_do_bvec
>       0.94 =C2=B1 42%      +1.4        2.35 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.brd_submit_bio
>       0.42 =C2=B1100%      +1.5        1.94 =C2=B1 32%  perf-profile.chil=
dren.cycles-pp.set_node_addr
>       2.08 =C2=B1  5%      +1.6        3.66 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irqsave
>       0.86 =C2=B1 57%      +1.7        2.54 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.raid1_unplug
>       0.87 =C2=B1 56%      +1.7        2.56 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.blk_finish_plug
>       0.87 =C2=B1 56%      +1.7        2.56 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__blk_flush_plug
>       2.59 =C2=B1  6%      +1.8        4.37 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__submit_merged_write_cond
>       0.78 =C2=B1 55%      +1.9        2.73 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.f2fs_submit_merged_ipu_write
>       0.46 =C2=B1 81%      +2.0        2.50 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.f2fs_submit_page_write
>       3.67 =C2=B1 20%      +2.1        5.78 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.update_sg_lb_stats
>       8.63 =C2=B1 10%      +2.1       10.74 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__schedule
>       3.82 =C2=B1 20%      +2.2        6.05 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.update_sd_lb_stats
>       3.87 =C2=B1 20%      +2.3        6.14 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.find_busiest_group
>       0.47 =C2=B1 75%      +2.4        2.91 =C2=B1 23%  perf-profile.chil=
dren.cycles-pp.__mutex_lock
>       0.75 =C2=B1 64%      +2.5        3.21 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.f2fs_do_write_data_page
>       0.80 =C2=B1 65%      +2.6        3.43 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.f2fs_write_single_data_page
>       5.18 =C2=B1 18%      +2.7        7.84 =C2=B1  8%  perf-profile.chil=
dren.cycles-pp.pick_next_task_fair
>       4.12 =C2=B1 22%      +2.8        6.91 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.load_balance
>       6.70 =C2=B1 15%      +2.9        9.64 =C2=B1  7%  perf-profile.chil=
dren.cycles-pp.schedule
>       0.71 =C2=B1 82%      +2.9        3.65 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.rwsem_optimistic_spin
>       0.69 =C2=B1 72%      +3.0        3.72 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.f2fs_allocate_data_block
>       4.44 =C2=B1 22%      +3.1        7.50 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.newidle_balance
>       2.65 =C2=B1 24%      +3.4        6.02 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock_irq
>       0.86 =C2=B1 78%      +4.2        5.04 =C2=B1 21%  perf-profile.chil=
dren.cycles-pp.osq_lock
>       1.44 =C2=B1 62%      +4.2        5.62 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.f2fs_write_cache_pages
>       1.14 =C2=B1 84%      +4.6        5.72 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.rwsem_down_write_slowpath
>       1.12 =C2=B1 75%      +4.8        5.89 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.f2fs_do_write_node_page
>       1.26 =C2=B1 74%      +5.4        6.64 =C2=B1 18%  perf-profile.chil=
dren.cycles-pp.do_write_page
>       1.35 =C2=B1 85%      +5.8        7.16 =C2=B1 19%  perf-profile.chil=
dren.cycles-pp.rwsem_down_read_slowpath
>       3.33 =C2=B1 24%      +5.9        9.20 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.native_queued_spin_lock_slowpath
>       2.34 =C2=B1 60%      +6.0        8.30 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__f2fs_write_data_pages
>       2.35 =C2=B1 60%      +6.0        8.30 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.do_writepages
>       2.36 =C2=B1 60%      +6.0        8.32 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.filemap_fdatawrite_wbc
>       2.36 =C2=B1 60%      +6.0        8.33 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.__filemap_fdatawrite_range
>       2.39 =C2=B1 60%      +6.1        8.47 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.file_write_and_wait_range
>       2.03 =C2=B1 84%      +7.9        9.96 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.__write_node_page
>       2.95 =C2=B1 81%     +10.6       13.52 =C2=B1 22%  perf-profile.chil=
dren.cycles-pp.f2fs_fsync_node_pages
>      19.95 =C2=B1 22%     +19.9       39.80 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.f2fs_do_sync_file
>      20.97 =C2=B1 22%     +21.0       41.94 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.f2fs_file_write_iter
>      20.98 =C2=B1 22%     +21.0       41.97 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.new_sync_write
>      21.00 =C2=B1 22%     +21.0       42.04 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.vfs_write
>      21.01 =C2=B1 22%     +21.0       42.05 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.ksys_write
>      21.37 =C2=B1 21%     +21.0       42.41 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.write
>      21.18 =C2=B1 22%     +21.3       42.45 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.do_syscall_64
>      21.19 =C2=B1 22%     +21.3       42.46 =C2=B1  9%  perf-profile.chil=
dren.cycles-pp.entry_SYSCALL_64_after_hwframe
>      15.91 =C2=B1 16%      -8.8        7.11 =C2=B1 34%  perf-profile.self=
.cycles-pp.poll_idle
>      48.31 =C2=B1  2%      -8.0       40.27 =C2=B1  2%  perf-profile.self=
.cycles-pp.mwait_idle_with_hints
>       1.05 =C2=B1  8%      -0.5        0.52 =C2=B1 31%  perf-profile.self=
.cycles-pp.folio_wait_bit_common
>       0.87 =C2=B1 11%      -0.4        0.46 =C2=B1 24%  perf-profile.self=
.cycles-pp.f2fs_wait_on_node_pages_writeback
>       0.91 =C2=B1  8%      -0.4        0.53 =C2=B1 10%  perf-profile.self=
.cycles-pp.menu_select
>       0.60 =C2=B1  7%      -0.3        0.27 =C2=B1  4%  perf-profile.self=
.cycles-pp.update_rq_clock
>       1.27 =C2=B1 13%      -0.3        0.96 =C2=B1  7%  perf-profile.self=
.cycles-pp.down_read
>       0.35 =C2=B1 11%      -0.2        0.12 =C2=B1 13%  perf-profile.self=
.cycles-pp.switch_mm_irqs_off
>       0.69            -0.2        0.47 =C2=B1  2%  perf-profile.self.cycl=
es-pp.__schedule
>       0.27 =C2=B1  8%      -0.2        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.set_next_entity
>       0.31 =C2=B1 16%      -0.2        0.12 =C2=B1 39%  perf-profile.self=
.cycles-pp.folio_wait_writeback
>       0.52 =C2=B1  9%      -0.2        0.35 =C2=B1  6%  perf-profile.self=
.cycles-pp.enqueue_entity
>       0.42 =C2=B1 12%      -0.2        0.25 =C2=B1 10%  perf-profile.self=
.cycles-pp.ktime_get
>       0.36 =C2=B1 12%      -0.1        0.23 =C2=B1  4%  perf-profile.self=
.cycles-pp.enqueue_task_fair
>       0.40 =C2=B1  5%      -0.1        0.28 =C2=B1 11%  perf-profile.self=
.cycles-pp.__switch_to_asm
>       0.22 =C2=B1  9%      -0.1        0.10 =C2=B1  9%  perf-profile.self=
.cycles-pp.do_idle
>       0.36 =C2=B1  5%      -0.1        0.26 =C2=B1  8%  perf-profile.self=
.cycles-pp.__switch_to
>       0.23 =C2=B1 16%      -0.1        0.12 =C2=B1 32%  perf-profile.self=
.cycles-pp.ttwu_do_activate
>       0.35 =C2=B1  6%      -0.1        0.24 =C2=B1  7%  perf-profile.self=
.cycles-pp.native_sched_clock
>       0.36 =C2=B1  5%      -0.1        0.27 =C2=B1 11%  perf-profile.self=
.cycles-pp.flush_smp_call_function_queue
>       0.18 =C2=B1  9%      -0.1        0.10 =C2=B1 14%  perf-profile.self=
.cycles-pp.reweight_entity
>       1.12 =C2=B1  2%      -0.1        1.04 =C2=B1  3%  perf-profile.self=
.cycles-pp._raw_spin_lock_irqsave
>       0.24 =C2=B1  5%      -0.1        0.18 =C2=B1  5%  perf-profile.self=
.cycles-pp.__update_load_avg_se
>       0.12 =C2=B1  8%      -0.1        0.06 =C2=B1 49%  perf-profile.self=
.cycles-pp.f2fs_wait_on_page_writeback
>       0.15 =C2=B1  4%      -0.1        0.10 =C2=B1 10%  perf-profile.self=
.cycles-pp.read_tsc
>       0.31 =C2=B1 12%      -0.1        0.26 =C2=B1  4%  perf-profile.self=
.cycles-pp.llist_reverse_order
>       0.13 =C2=B1 10%      -0.1        0.08 =C2=B1 14%  perf-profile.self=
.cycles-pp.cpuidle_idle_call
>       0.07 =C2=B1 12%      -0.0        0.03 =C2=B1102%  perf-profile.self=
.cycles-pp.call_cpuidle
>       0.09 =C2=B1 17%      -0.0        0.05 =C2=B1 47%  perf-profile.self=
.cycles-pp.rcu_dynticks_inc
>       0.13 =C2=B1 11%      -0.0        0.09 =C2=B1  7%  perf-profile.self=
.cycles-pp.cpuidle_enter_state
>       0.11 =C2=B1  6%      -0.0        0.07 =C2=B1 12%  perf-profile.self=
.cycles-pp.__wrgsbase_inactive
>       0.09 =C2=B1  5%      -0.0        0.05 =C2=B1  7%  perf-profile.self=
.cycles-pp.lapic_next_deadline
>       0.27 =C2=B1  5%      -0.0        0.23 =C2=B1  2%  perf-profile.self=
.cycles-pp.__list_add_valid
>       0.09 =C2=B1 11%      -0.0        0.06 =C2=B1  9%  perf-profile.self=
.cycles-pp.__calc_delta
>       0.07 =C2=B1  6%      -0.0        0.04 =C2=B1 45%  perf-profile.self=
.cycles-pp.update_min_vruntime
>       0.08 =C2=B1  5%      -0.0        0.06 =C2=B1  8%  perf-profile.self=
.cycles-pp.native_irq_return_iret
>       0.12 =C2=B1  6%      -0.0        0.11 =C2=B1  4%  perf-profile.self=
.cycles-pp.dequeue_entity
>       0.15 =C2=B1  4%      +0.0        0.18 =C2=B1  6%  perf-profile.self=
.cycles-pp.update_curr
>       0.13 =C2=B1 12%      +0.0        0.16 =C2=B1  5%  perf-profile.self=
.cycles-pp.finish_task_switch
>       0.08 =C2=B1 11%      +0.0        0.12 =C2=B1  4%  perf-profile.self=
.cycles-pp.__might_resched
>       0.10 =C2=B1  9%      +0.0        0.14 =C2=B1  4%  perf-profile.self=
.cycles-pp.dequeue_task_fair
>       0.04 =C2=B1 71%      +0.0        0.08 =C2=B1 10%  perf-profile.self=
.cycles-pp.find_busiest_group
>       0.42 =C2=B1  4%      +0.0        0.46 =C2=B1  2%  perf-profile.self=
.cycles-pp._raw_spin_lock_irq
>       0.10 =C2=B1 13%      +0.0        0.14 =C2=B1  5%  perf-profile.self=
.cycles-pp.perf_trace_sched_wakeup_template
>       0.02 =C2=B1144%      +0.1        0.07 =C2=B1 16%  perf-profile.self=
.cycles-pp.bio_associate_blkg_from_css
>       0.01 =C2=B1223%      +0.1        0.06 =C2=B1 11%  perf-profile.self=
.cycles-pp._wait_barrier
>       0.15 =C2=B1  6%      +0.1        0.20 =C2=B1  9%  perf-profile.self=
.cycles-pp.__flush_smp_call_function_queue
>       0.01 =C2=B1223%      +0.1        0.07 =C2=B1 14%  perf-profile.self=
.cycles-pp.mutex_lock
>       0.10 =C2=B1 23%      +0.1        0.16 =C2=B1 10%  perf-profile.self=
.cycles-pp.cpumask_next_and
>       0.40 =C2=B1  3%      +0.1        0.46 =C2=B1  4%  perf-profile.self=
.cycles-pp.up_read
>       0.01 =C2=B1223%      +0.1        0.07 =C2=B1 17%  perf-profile.self=
.cycles-pp.f2fs_lookup_rb_tree
>       0.00            +0.1        0.06 =C2=B1 11%  perf-profile.self.cycl=
es-pp.update_sd_pick_busiest
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 20%  perf-profile.self=
.cycles-pp.__folio_start_writeback
>       0.00            +0.1        0.07 =C2=B1 14%  perf-profile.self.cycl=
es-pp.f2fs_file_write_iter
>       0.02 =C2=B1142%      +0.1        0.08 =C2=B1 20%  perf-profile.self=
.cycles-pp.copy_user_enhanced_fast_string
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 20%  perf-profile.self=
.cycles-pp.percpu_counter_add_batch
>       0.08 =C2=B1 24%      +0.1        0.15 =C2=B1  7%  perf-profile.self=
.cycles-pp.load_balance
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 13%  perf-profile.self=
.cycles-pp.raid_end_bio_io
>       0.01 =C2=B1223%      +0.1        0.08 =C2=B1 17%  perf-profile.self=
.cycles-pp.md_handle_request
>       0.00            +0.1        0.07 =C2=B1 14%  perf-profile.self.cycl=
es-pp.f2fs_issue_flush
>       0.03 =C2=B1102%      +0.1        0.11 =C2=B1 21%  perf-profile.self=
.cycles-pp.brd_do_bvec
>       0.01 =C2=B1223%      +0.1        0.09 =C2=B1 17%  perf-profile.self=
.cycles-pp.f2fs_submit_page_write
>       0.04 =C2=B1 76%      +0.1        0.12 =C2=B1 18%  perf-profile.self=
.cycles-pp.mem_cgroup_css_rstat_flush
>       0.01 =C2=B1223%      +0.1        0.10 =C2=B1 21%  perf-profile.self=
.cycles-pp.__write_node_page
>       0.00            +0.1        0.08 =C2=B1 19%  perf-profile.self.cycl=
es-pp.osq_unlock
>       0.01 =C2=B1223%      +0.1        0.09 =C2=B1 17%  perf-profile.self=
.cycles-pp.wake_q_add
>       0.17 =C2=B1 15%      +0.1        0.26 =C2=B1  4%  perf-profile.self=
.cycles-pp.newidle_balance
>       0.01 =C2=B1223%      +0.1        0.10 =C2=B1 13%  perf-profile.self=
.cycles-pp.f2fs_inplace_write_data
>       0.01 =C2=B1223%      +0.1        0.10 =C2=B1 22%  perf-profile.self=
.cycles-pp.f2fs_write_end_io
>       0.00            +0.1        0.09 =C2=B1 23%  perf-profile.self.cycl=
es-pp.f2fs_get_node_page
>       0.12 =C2=B1 12%      +0.1        0.21 =C2=B1 14%  perf-profile.self=
.cycles-pp.f2fs_submit_merged_ipu_write
>       0.02 =C2=B1144%      +0.1        0.11 =C2=B1 20%  perf-profile.self=
.cycles-pp.__f2fs_write_data_pages
>       0.12 =C2=B1 23%      +0.1        0.21 =C2=B1  9%  perf-profile.self=
.cycles-pp.update_sd_lb_stats
>       0.03 =C2=B1105%      +0.1        0.13 =C2=B1 17%  perf-profile.self=
.cycles-pp.__filemap_get_folio
>       0.01 =C2=B1223%      +0.1        0.11 =C2=B1 17%  perf-profile.self=
.cycles-pp.__is_cp_guaranteed
>       0.01 =C2=B1223%      +0.1        0.12 =C2=B1 17%  perf-profile.self=
.cycles-pp.rwsem_down_write_slowpath
>       0.03 =C2=B1106%      +0.1        0.15 =C2=B1 18%  perf-profile.self=
.cycles-pp.update_sit_entry
>       0.03 =C2=B1106%      +0.1        0.15 =C2=B1 20%  perf-profile.self=
.cycles-pp.up_write
>       0.08 =C2=B1 63%      +0.1        0.20 =C2=B1 14%  perf-profile.self=
.cycles-pp.__has_merged_page
>       0.03 =C2=B1111%      +0.1        0.16 =C2=B1 13%  perf-profile.self=
.cycles-pp.f2fs_do_sync_file
>       0.04 =C2=B1115%      +0.1        0.18 =C2=B1 25%  perf-profile.self=
.cycles-pp.f2fs_fsync_node_pages
>       0.04 =C2=B1110%      +0.1        0.18 =C2=B1 14%  perf-profile.self=
.cycles-pp.down_write
>       0.03 =C2=B1155%      +0.1        0.16 =C2=B1 19%  perf-profile.self=
.cycles-pp.f2fs_allocate_data_block
>       0.07 =C2=B1 59%      +0.1        0.21 =C2=B1 21%  perf-profile.self=
.cycles-pp.clear_page_erms
>       0.05 =C2=B1117%      +0.2        0.21 =C2=B1 27%  perf-profile.self=
.cycles-pp.xas_find_marked
>       0.04 =C2=B1112%      +0.2        0.20 =C2=B1 13%  perf-profile.self=
.cycles-pp.rwsem_mark_wake
>       0.10 =C2=B1 45%      +0.2        0.27 =C2=B1 12%  perf-profile.self=
.cycles-pp.raid1_write_request
>       0.02 =C2=B1223%      +0.2        0.18 =C2=B1 17%  perf-profile.self=
.cycles-pp.f2fs_balance_fs
>       0.08 =C2=B1 81%      +0.2        0.27 =C2=B1 28%  perf-profile.self=
.cycles-pp.__percpu_counter_sum
>       0.24 =C2=B1 26%      +0.2        0.45 =C2=B1 10%  perf-profile.self=
.cycles-pp._find_next_bit
>       0.05 =C2=B1111%      +0.2        0.26 =C2=B1 20%  perf-profile.self=
.cycles-pp.f2fs_is_valid_blkaddr
>       0.08 =C2=B1 87%      +0.2        0.29 =C2=B1 16%  perf-profile.self=
.cycles-pp.find_busiest_queue
>       0.05 =C2=B1112%      +0.2        0.26 =C2=B1 19%  perf-profile.self=
.cycles-pp.f2fs_lookup_extent_tree
>       0.13 =C2=B1 46%      +0.2        0.36 =C2=B1 17%  perf-profile.self=
.cycles-pp.raid1_end_write_request
>       0.06 =C2=B1120%      +0.2        0.29 =C2=B1 29%  perf-profile.self=
.cycles-pp.release_pages
>       0.16 =C2=B1 40%      +0.2        0.40 =C2=B1 16%  perf-profile.self=
.cycles-pp.__radix_tree_lookup
>       0.68 =C2=B1 14%      +0.2        0.93 =C2=B1  7%  perf-profile.self=
.cycles-pp.idle_cpu
>       0.08 =C2=B1 94%      +0.3        0.37 =C2=B1 19%  perf-profile.self=
.cycles-pp.rwsem_optimistic_spin
>       0.06 =C2=B1114%      +0.3        0.40 =C2=B1 21%  perf-profile.self=
.cycles-pp.mutex_spin_on_owner
>       0.09 =C2=B1 77%      +0.4        0.46 =C2=B1 17%  perf-profile.self=
.cycles-pp.rwsem_down_read_slowpath
>       0.15 =C2=B1117%      +0.5        0.63 =C2=B1 31%  perf-profile.self=
.cycles-pp.find_get_pages_range_tag
>       0.13 =C2=B1 78%      +0.5        0.61 =C2=B1 18%  perf-profile.self=
.cycles-pp.rwsem_spin_on_owner
>       1.07 =C2=B1 10%      +0.5        1.56 =C2=B1  9%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.34 =C2=B1 50%      +0.6        0.95 =C2=B1 17%  perf-profile.self=
.cycles-pp.copy_to_brd
>       2.70 =C2=B1 22%      +1.6        4.35 =C2=B1  9%  perf-profile.self=
.cycles-pp.update_sg_lb_stats
>       0.86 =C2=B1 78%      +4.1        5.01 =C2=B1 21%  perf-profile.self=
.cycles-pp.osq_lock
>       3.32 =C2=B1 24%      +5.9        9.19 =C2=B1  5%  perf-profile.self=
.cycles-pp.native_queued_spin_lock_slowpath
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2sp9: 88 threads 2 sockets Intel(R) Xeon(R) Gold 6238M CPU @ 2.10=
GHz (Cascade Lake) with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/md/rootfs/tbox_group/test/=
testcase/ucode:
>   gcc-11/performance/4BRD_12G/xfs/x86_64-rhel-8.3/300/RAID1/debian-11.1-x=
86_64-20220510.cgz/lkp-csl-2sp9/sync_disk_rw/aim7/0x500320a
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>       6574            +3.9%       6832        aim7.jobs-per-min
>     273.98            -3.8%     263.61        aim7.time.elapsed_time
>     273.98            -3.8%     263.61        aim7.time.elapsed_time.max
>     980796            +6.2%    1041949        aim7.time.involuntary_conte=
xt_switches
>      47635 =C2=B1  2%      -7.0%      44310        aim7.time.minor_page_f=
aults
>       6110 =C2=B1  2%      -8.0%       5624        aim7.time.system_time
>   69966039            +2.2%   71483752        aim7.time.voluntary_context=
_switches
>      34031 =C2=B1  6%     +18.8%      40422 =C2=B1 10%  meminfo.KernelSta=
ck
>      16884 =C2=B1 10%     +26.3%      21319 =C2=B1 14%  numa-meminfo.node=
1.KernelStack
>      16885 =C2=B1 10%     +26.2%      21316 =C2=B1 14%  numa-vmstat.node1=
.nr_kernel_stack
>       5.77 =C2=B1  9%     +27.8%       7.38 =C2=B1 14%  sched_debug.cpu.c=
lock.stddev
>       9750           -14.0%       8382        uptime.idle
>      31.73 =C2=B1  2%     -15.0%      26.97        iostat.cpu.idle
>      40.12           +13.8%      45.67        iostat.cpu.iowait
>      31.25 =C2=B1  3%      -4.8       26.44        mpstat.cpu.all.idle%
>      40.41            +5.6       46.02        mpstat.cpu.all.iowait%
>      34031 =C2=B1  6%     +18.8%      40418 =C2=B1 10%  proc-vmstat.nr_ke=
rnel_stack
>      56829            +3.4%      58750 =C2=B1  2%  proc-vmstat.nr_slab_un=
reclaimable
>     465583            +3.6%     482389        proc-vmstat.pgactivate
>      34967            -3.0%      33923        proc-vmstat.pgreuse
>      31.00 =C2=B1  3%     -15.1%      26.33        vmstat.cpu.id
>      39.50           +14.8%      45.33        vmstat.cpu.wa
>     273156            +4.0%     284008        vmstat.io.bo
>     509661            +5.3%     536464        vmstat.system.cs
>     200604            +4.7%     210117        vmstat.system.in
>   38505571            +7.8%   41516807        perf-stat.i.branch-misses
>      18.74            +0.9       19.61 =C2=B1  2%  perf-stat.i.cache-miss=
-rate%
>   45792562            +6.5%   48766141        perf-stat.i.cache-misses
>     514616            +5.2%     541341        perf-stat.i.context-switches
>       4.99            -3.4%       4.81        perf-stat.i.cpi
>      89102            +7.5%      95767        perf-stat.i.cpu-migrations
>  1.291e+09            +6.3%  1.373e+09        perf-stat.i.dTLB-stores
>    4605702        +6.9e+06%    3.2e+11 =C2=B1223%  perf-stat.i.iTLB-load-=
misses
>       3333            +1.5%       3385        perf-stat.i.minor-faults
>   16366919            +7.2%   17545996        perf-stat.i.node-load-misses
>    2107545            +5.4%    2222279        perf-stat.i.node-loads
>      73.73            +2.4       76.10        perf-stat.i.node-store-miss=
-rate%
>    8621292 =C2=B1  2%      +9.0%    9396473        perf-stat.i.node-store=
-misses
>       3335            +1.5%       3386        perf-stat.i.page-faults
>       1.30            +0.1        1.40        perf-stat.overall.branch-mi=
ss-rate%
>      18.82            +0.9       19.72        perf-stat.overall.cache-mis=
s-rate%
>       4.97            -3.0%       4.82        perf-stat.overall.cpi
>       1533            -8.5%       1402        perf-stat.overall.cycles-be=
tween-cache-misses
>       0.20            +3.1%       0.21        perf-stat.overall.ipc
>      74.18 =C2=B1  2%      +2.2       76.38        perf-stat.overall.node=
-store-miss-rate%
>   38363874            +7.8%   41358628        perf-stat.ps.branch-misses
>   45621719            +6.5%   48579204        perf-stat.ps.cache-misses
>     512684            +5.2%     539255        perf-stat.ps.context-switch=
es
>      88768            +7.5%      95397        perf-stat.ps.cpu-migrations
>  1.286e+09            +6.3%  1.368e+09        perf-stat.ps.dTLB-stores
>    4588811          +7e+06%   3.19e+11 =C2=B1223%  perf-stat.ps.iTLB-load=
-misses
>   16305621            +7.2%   17478491        perf-stat.ps.node-load-miss=
es
>    2099675            +5.4%    2213764        perf-stat.ps.node-loads
>    8589098 =C2=B1  2%      +9.0%    9360368        perf-stat.ps.node-stor=
e-misses
>  3.869e+12            -3.3%  3.743e+12        perf-stat.total.instructions
>       5.91 =C2=B1  2%      -1.2        4.68 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__mutex_lock.__flush_workqueue.xlog_cil_push_now.xlog_cil_f=
orce_seq.xfs_log_force_seq
>       5.52 =C2=B1  2%      -1.2        4.31 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.osq_lock.__mutex_lock.__flush_workqueue.xlog_cil_push_now.x=
log_cil_force_seq
>       7.38 =C2=B1  2%      -1.0        6.42 =C2=B1  3%  perf-profile.call=
trace.cycles-pp.__flush_workqueue.xlog_cil_push_now.xlog_cil_force_seq.xfs_=
log_force_seq.xfs_file_fsync
>       2.32 =C2=B1  2%      -1.0        1.37 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.xlog_wait_on_iclog.xfs_file_fsync.xfs_file_buffered_write.n=
ew_sync_write.vfs_write
>       2.01            -0.9        1.14        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.remove_wait_q=
ueue.xlog_wait_on_iclog.xfs_file_fsync
>       2.01            -0.9        1.15 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_wait_on_iclog.xfs_=
file_fsync.xfs_file_buffered_write
>       2.01            -0.9        1.15 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.remove_wait_queue.xlog_wait_on_iclog.xfs_file_fsync.xfs_file_buf=
fered_write.new_sync_write
>       8.08            -0.8        7.28 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.xlog_cil_push_now.xlog_cil_force_seq.xfs_log_force_seq.xfs_file_=
fsync.xfs_file_buffered_write
>       1.07 =C2=B1  2%      -0.5        0.59 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.remove_wait_queue.xlog_force_lsn.xfs_log_force_seq.xfs_file=
_fsync.xfs_file_buffered_write
>       1.07 =C2=B1  2%      -0.5        0.59 =C2=B1  5%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_force_lsn.xfs=
_log_force_seq.xfs_file_fsync
>       1.06 =C2=B1  3%      -0.5        0.58 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rem=
ove_wait_queue.xlog_force_lsn.xfs_log_force_seq
>       1.50            -0.4        1.11        perf-profile.calltrace.cycl=
es-pp.xlog_force_lsn.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered_wri=
te.new_sync_write
>       0.72 =C2=B1  4%      -0.1        0.63 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.xlog_ioend_work.process_one_work.worker_thread.kthread.ret_=
from_fork
>       0.59 =C2=B1  3%      +0.1        0.65 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.iomap_file_buffered_write.xfs_file_buffered_write.new_sync_=
write.vfs_write.ksys_write
>       0.84 =C2=B1  7%      +0.1        0.93 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.xlog_cil_insert_items.xlog_cil_commit.__xfs_trans_commit.xf=
s_vn_update_time.file_update_time
>       1.15 =C2=B1  4%      +0.1        1.25 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.xlog_cil_commit.__xfs_trans_commit.xfs_vn_update_time.file_=
update_time.xfs_file_write_checks
>       1.22 =C2=B1  4%      +0.1        1.32 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.__xfs_trans_commit.xfs_vn_update_time.file_update_time.xfs_=
file_write_checks.xfs_file_buffered_write
>       0.65 =C2=B1  6%      +0.2        0.81 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.xlog_cil_pu=
sh_now.xlog_cil_force_seq.xfs_log_force_seq
>       0.68 =C2=B1  6%      +0.2        0.84 =C2=B1  5%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.xlog_cil_push_now.xlog_cil_force_seq.xfs_log=
_force_seq.xfs_file_fsync
>       0.72 =C2=B1  4%      +0.6        1.32 =C2=B1  5%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irqsave.rem=
ove_wait_queue.xlog_cil_force_seq.xfs_log_force_seq
>       0.72 =C2=B1  4%      +0.6        1.34 =C2=B1  5%  perf-profile.call=
trace.cycles-pp._raw_spin_lock_irqsave.remove_wait_queue.xlog_cil_force_seq=
.xfs_log_force_seq.xfs_file_fsync
>       0.73 =C2=B1  4%      +0.6        1.34 =C2=B1  4%  perf-profile.call=
trace.cycles-pp.remove_wait_queue.xlog_cil_force_seq.xfs_log_force_seq.xfs_=
file_fsync.xfs_file_buffered_write
>      10.11            +0.6       10.74        perf-profile.calltrace.cycl=
es-pp.xlog_wait_on_iclog.xfs_log_force_seq.xfs_file_fsync.xfs_file_buffered=
_write.new_sync_write
>       0.00            +0.7        0.66 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_sta=
rtup_entry.start_secondary
>      14.74 =C2=B1  2%      +0.9       15.61 =C2=B1  2%  perf-profile.call=
trace.cycles-pp.file_write_and_wait_range.xfs_file_fsync.xfs_file_buffered_=
write.new_sync_write.vfs_write
>       0.00            +0.9        0.87 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_se=
condary.secondary_startup_64_no_verify
>       5.91 =C2=B1  2%      -1.2        4.68 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__mutex_lock
>       5.56 =C2=B1  2%      -1.2        4.35 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.osq_lock
>       7.38 =C2=B1  2%      -1.0        6.42 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__flush_workqueue
>       8.08            -0.8        7.28 =C2=B1  3%  perf-profile.children.=
cycles-pp.xlog_cil_push_now
>       2.02 =C2=B1  2%      -0.5        1.51        perf-profile.children.=
cycles-pp.xlog_force_lsn
>       1.46            -0.2        1.27 =C2=B1  2%  perf-profile.children.=
cycles-pp.try_to_wake_up
>       1.16 =C2=B1  2%      -0.2        1.02 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__wake_up_common
>       0.72 =C2=B1  4%      -0.1        0.63 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.xlog_ioend_work
>       1.16 =C2=B1  2%      -0.1        1.10 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__wake_up_common_lock
>       0.56            -0.1        0.50 =C2=B1  2%  perf-profile.children.=
cycles-pp.schedule_idle
>       0.28 =C2=B1  4%      -0.1        0.22 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.folio_wake_bit
>       0.23 =C2=B1  4%      -0.1        0.17 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.wake_page_function
>       0.47 =C2=B1  4%      -0.1        0.41 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.iomap_finish_ioend
>       0.40 =C2=B1  4%      -0.1        0.34 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.folio_end_writeback
>       0.14 =C2=B1  6%      -0.1        0.09 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.45 =C2=B1  3%      -0.0        0.40 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.xlog_state_clean_iclog
>       0.45 =C2=B1  4%      -0.0        0.41 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.raid_end_bio_io
>       0.12 =C2=B1  6%      -0.0        0.08 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.xlog_state_done_syncing
>       0.36 =C2=B1  3%      -0.0        0.32 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.complete
>       0.08 =C2=B1  5%      +0.0        0.10 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.xfs_buffered_write_iomap_begin
>       0.14 =C2=B1  4%      +0.0        0.16 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sched_clock_cpu
>       0.08 =C2=B1  7%      +0.0        0.10 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.__update_blocked_fair
>       0.15 =C2=B1  2%      +0.0        0.16 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.iomap_write_end
>       0.11 =C2=B1  8%      +0.0        0.12 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__switch_to
>       0.10 =C2=B1  4%      +0.0        0.12 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.prepare_task_switch
>       0.18 =C2=B1  5%      +0.0        0.20 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__update_load_avg_cfs_rq
>       0.18 =C2=B1  3%      +0.0        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.bio_alloc_bioset
>       0.15 =C2=B1  5%      +0.0        0.17 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.finish_task_switch
>       0.06 =C2=B1  8%      +0.0        0.08 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.llist_reverse_order
>       0.12 =C2=B1  7%      +0.0        0.14 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.wake_affine
>       0.03 =C2=B1 70%      +0.0        0.06 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.___perf_sw_event
>       0.26 =C2=B1  3%      +0.0        0.29 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.update_curr
>       0.15 =C2=B1  7%      +0.0        0.18 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.asm_sysvec_call_function_single
>       0.33 =C2=B1  4%      +0.0        0.36 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.xlog_cil_push_work
>       0.51 =C2=B1  2%      +0.0        0.55 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.dequeue_entity
>       0.46 =C2=B1  4%      +0.0        0.51 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.select_task_rq
>       0.15 =C2=B1  5%      +0.0        0.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.xlog_write
>       0.09 =C2=B1  5%      +0.0        0.14 =C2=B1  6%  perf-profile.chil=
dren.cycles-pp.__flush_smp_call_function_queue
>       0.48 =C2=B1  3%      +0.1        0.53 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.iomap_write_iter
>       0.08 =C2=B1  9%      +0.1        0.13 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.llist_add_batch
>       0.08 =C2=B1 11%      +0.1        0.13 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.__smp_call_single_queue
>       0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.=
cycles-pp.xlog_cil_write_commit_record
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.xlog_cil_set_ctx_write_state
>       0.00            +0.1        0.06 =C2=B1  8%  perf-profile.children.=
cycles-pp.xlog_write_get_more_iclog_space
>       0.00            +0.1        0.06 =C2=B1  9%  perf-profile.children.=
cycles-pp.xlog_write_partial
>       0.59 =C2=B1  3%      +0.1        0.65 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.iomap_file_buffered_write
>       0.64            +0.1        0.70 =C2=B1  3%  perf-profile.children.=
cycles-pp.dequeue_task_fair
>       0.47 =C2=B1  2%      +0.1        0.54 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.enqueue_entity
>       0.60 =C2=B1  2%      +0.1        0.67 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ttwu_do_activate
>       0.14 =C2=B1  7%      +0.1        0.23 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.ttwu_queue_wakelist
>       0.62            +0.1        0.71 =C2=B1  3%  perf-profile.children.=
cycles-pp.enqueue_task_fair
>       0.89 =C2=B1  7%      +0.1        0.99 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.xlog_cil_insert_items
>       1.22 =C2=B1  3%      +0.1        1.34 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.xlog_cil_commit
>       1.30 =C2=B1  3%      +0.1        1.42 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.__xfs_trans_commit
>       3.34 =C2=B1  3%      +0.4        3.72 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp._raw_spin_lock
>       0.37 =C2=B1  2%      +0.4        0.78 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.sched_ttwu_pending
>       0.41            +0.5        0.88 =C2=B1  2%  perf-profile.children.=
cycles-pp.flush_smp_call_function_queue
>      14.75 =C2=B1  2%      +0.9       15.61 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.file_write_and_wait_range
>       5.52 =C2=B1  2%      -1.2        4.32 =C2=B1  3%  perf-profile.self=
.cycles-pp.osq_lock
>       0.11 =C2=B1  6%      +0.0        0.13 =C2=B1  6%  perf-profile.self=
.cycles-pp.enqueue_entity
>       0.17 =C2=B1  4%      +0.0        0.19 =C2=B1  4%  perf-profile.self=
.cycles-pp._raw_spin_lock_irq
>       0.05 =C2=B1  7%      +0.0        0.08 =C2=B1  6%  perf-profile.self=
.cycles-pp.flush_smp_call_function_queue
>       0.06 =C2=B1  9%      +0.0        0.08 =C2=B1  4%  perf-profile.self=
.cycles-pp.llist_reverse_order
>       0.01 =C2=B1223%      +0.0        0.06 =C2=B1  9%  perf-profile.self=
.cycles-pp.___perf_sw_event
>       0.08 =C2=B1  9%      +0.1        0.13 =C2=B1  4%  perf-profile.self=
.cycles-pp.llist_add_batch
>       0.66 =C2=B1  2%      +0.1        0.72 =C2=B1  3%  perf-profile.self=
.cycles-pp._raw_spin_lock
>       0.00            +0.1        0.06 =C2=B1  6%  perf-profile.self.cycl=
es-pp.sched_ttwu_pending
>       0.00            +0.1        0.06 =C2=B1  7%  perf-profile.self.cycl=
es-pp.__flush_smp_call_function_queue
> =

> =

> =

> *************************************************************************=
**************************
> lkp-csl-2ap4: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU @ =
2.30GHz (Cascade Lake) with 192G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/kconfig/rootfs/runtime/size/tbox_group/test/tes=
tcase/ucode:
>   gcc-11/performance/x86_64-rhel-8.3/debian-11.1-x86_64-20220510.cgz/300s=
/2T/lkp-csl-2ap4/shm-xread-seq-mt/vm-scalability/0x5003302
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     184978            +2.0%     188643        vm-scalability.median
>   35515817            +2.0%   36219450        vm-scalability.throughput
>   43258493            +2.4%   44297884        vm-scalability.time.maximum=
_resident_set_size
>  1.895e+08            +2.9%  1.951e+08        vm-scalability.time.minor_p=
age_faults
>       6070            -1.1%       6003        vm-scalability.time.system_=
time
>       3793            +2.0%       3869        vm-scalability.time.user_ti=
me
>  2.421e+08            +4.0%  2.518e+08        vm-scalability.time.volunta=
ry_context_switches
>  1.068e+10            +1.9%  1.088e+10        vm-scalability.workload
>      82753 =C2=B1  7%     -22.4%      64197 =C2=B1 37%  numa-numastat.nod=
e3.other_node
>      17603 =C2=B1  3%     -51.0%       8631 =C2=B1  4%  uptime.idle
>      19.58 =C2=B1  4%     -15.1        4.52        mpstat.cpu.all.idle%
>      63.09           +14.9       78.01        mpstat.cpu.all.iowait%
>      22.45 =C2=B1  3%      +1.7       24.14        turbostat.C1%
>     185.33            +0.9%     186.94        turbostat.PkgWatt
>      19.67 =C2=B1  4%     -74.6%       5.00        vmstat.cpu.id
>      62.33           +23.5%      77.00        vmstat.cpu.wa
>    1560904            +4.2%    1626917        vmstat.system.cs
>       3897 =C2=B1 58%     -87.7%     479.00 =C2=B1 62%  numa-vmstat.node0=
.nr_active_anon
>      20435 =C2=B1  9%     +12.9%      23063        numa-vmstat.node0.nr_s=
lab_unreclaimable
>       3898 =C2=B1 58%     -87.7%     479.00 =C2=B1 62%  numa-vmstat.node0=
.nr_zone_active_anon
>      21272 =C2=B1 37%     +67.3%      35581 =C2=B1 23%  numa-vmstat.node1=
.nr_anon_pages
>      20608 =C2=B1  8%     -15.1%      17502 =C2=B1  6%  numa-vmstat.node1=
.nr_slab_unreclaimable
>      82753 =C2=B1  7%     -22.4%      64197 =C2=B1 37%  numa-vmstat.node3=
.numa_other
>      16164 =C2=B1 59%     -88.0%       1945 =C2=B1 63%  numa-meminfo.node=
0.Active
>      16164 =C2=B1 59%     -88.1%       1917 =C2=B1 62%  numa-meminfo.node=
0.Active(anon)
>      29993 =C2=B1 18%     -46.7%      15973 =C2=B1 70%  numa-meminfo.node=
0.AnonHugePages
>      81744 =C2=B1  9%     +12.9%      92252        numa-meminfo.node0.SUn=
reclaim
>     114358 =C2=B1 10%     +12.8%     129008 =C2=B1  5%  numa-meminfo.node=
0.Slab
>      58802 =C2=B1 54%     +79.8%     105739 =C2=B1 24%  numa-meminfo.node=
1.AnonHugePages
>      85161 =C2=B1 37%     +67.2%     142379 =C2=B1 23%  numa-meminfo.node=
1.AnonPages
>      82433 =C2=B1  8%     -15.1%      70013 =C2=B1  6%  numa-meminfo.node=
1.SUnreclaim
>     639048 =C2=B1 15%     -36.6%     404848 =C2=B1 26%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>     639048 =C2=B1 15%     -36.6%     404848 =C2=B1 26%  sched_debug.cfs_r=
q:/.max_vruntime.max
>       3.69 =C2=B1 38%     +44.2%       5.32 =C2=B1 13%  sched_debug.cfs_r=
q:/.removed.load_avg.avg
>      23.90 =C2=B1 20%     +23.6%      29.53 =C2=B1  6%  sched_debug.cfs_r=
q:/.removed.load_avg.stddev
>      11.86 =C2=B1 21%     +21.8%      14.45 =C2=B1 10%  sched_debug.cfs_r=
q:/.removed.runnable_avg.stddev
>      11.86 =C2=B1 21%     +21.8%      14.45 =C2=B1 10%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>    1168918 =C2=B1  8%     -23.2%     897653 =C2=B1 10%  sched_debug.cpu.a=
vg_idle.max
>     104137 =C2=B1  3%     -17.3%      86157 =C2=B1  7%  sched_debug.cpu.a=
vg_idle.stddev
>     847708 =C2=B1 13%     -34.2%     557574 =C2=B1  2%  sched_debug.cpu.m=
ax_idle_balance_cost.max
>      31693 =C2=B1  4%     -75.2%       7859 =C2=B1 17%  sched_debug.cpu.m=
ax_idle_balance_cost.stddev
>    6099863            +2.2%    6235843        proc-vmstat.nr_file_pages
>    5432348            +2.4%    5564713        proc-vmstat.nr_inactive_anon
>    5281557            +2.4%    5407254        proc-vmstat.nr_mapped
>      11825            +2.1%      12071        proc-vmstat.nr_page_table_p=
ages
>    5435377            +2.5%    5571308        proc-vmstat.nr_shmem
>    5432348            +2.4%    5564713        proc-vmstat.nr_zone_inactiv=
e_anon
>     459386            +6.1%     487346 =C2=B1  6%  proc-vmstat.numa_hint_=
faults
>     112359 =C2=B1  2%     +10.0%     123599 =C2=B1  6%  proc-vmstat.numa_=
hint_faults_local
>   21384768            +2.8%   21989232        proc-vmstat.numa_hit
>   21121802            +2.9%   21736481        proc-vmstat.numa_local
>     107929            +2.9%     111042        proc-vmstat.pgactivate
>   21388174            +2.8%   21994884        proc-vmstat.pgalloc_normal
>  1.913e+08            +2.9%  1.969e+08        proc-vmstat.pgfault
>   21487992            +2.6%   22051535        proc-vmstat.pgfree
>   3.43e+10            +2.6%  3.518e+10        perf-stat.i.branch-instruct=
ions
>   44973896            +2.1%   45904401        perf-stat.i.branch-misses
>      21.05            +1.8       22.89        perf-stat.i.cache-miss-rate%
>   92031944 =C2=B1  2%      +5.2%   96820766        perf-stat.i.cache-miss=
es
>  4.426e+08            -3.4%  4.274e+08        perf-stat.i.cache-references
>    1576826            +4.1%    1642153        perf-stat.i.context-switches
>       1.08            -1.3%       1.07        perf-stat.i.cpi
>  1.153e+11            +1.4%  1.169e+11        perf-stat.i.cpu-cycles
>       8256            +4.0%       8584 =C2=B1  2%  perf-stat.i.cpu-migrat=
ions
>       1257 =C2=B1  2%      -3.6%       1212        perf-stat.i.cycles-bet=
ween-cache-misses
>  3.155e+10            +2.6%  3.237e+10        perf-stat.i.dTLB-loads
>     789095 =C2=B1  2%      +7.4%     847518 =C2=B1  4%  perf-stat.i.dTLB-=
store-misses
>   5.17e+09            +3.1%  5.329e+09        perf-stat.i.dTLB-stores
>    9803040            +2.8%   10075875        perf-stat.i.iTLB-loads
>  1.079e+11            +2.6%  1.107e+11        perf-stat.i.instructions
>       0.93            +1.2%       0.94        perf-stat.i.ipc
>       0.60            +1.4%       0.61        perf-stat.i.metric.GHz
>     371.99            +2.6%     381.78        perf-stat.i.metric.M/sec
>     621565            +3.1%     640636        perf-stat.i.minor-faults
>   30443490            +3.5%   31495581        perf-stat.i.node-load-misses
>    1175703 =C2=B1  2%      +3.1%    1212613        perf-stat.i.node-loads
>   13588325            +4.6%   14213349        perf-stat.i.node-store-miss=
es
>     621572            +3.1%     640643        perf-stat.i.page-faults
>       4.10            -5.8%       3.86        perf-stat.overall.MPKI
>      20.79 =C2=B1  2%      +1.8       22.64        perf-stat.overall.cach=
e-miss-rate%
>       1.07            -1.2%       1.06        perf-stat.overall.cpi
>       1253 =C2=B1  2%      -3.7%       1207        perf-stat.overall.cycl=
es-between-cache-misses
>       0.94            +1.2%       0.95        perf-stat.overall.ipc
>  3.417e+10            +2.6%  3.506e+10        perf-stat.ps.branch-instruc=
tions
>   44805288            +2.2%   45780586        perf-stat.ps.branch-misses
>   91687574 =C2=B1  2%      +5.3%   96538109        perf-stat.ps.cache-mis=
ses
>   4.41e+08            -3.3%  4.265e+08        perf-stat.ps.cache-referenc=
es
>    1570810            +4.2%    1636696        perf-stat.ps.context-switch=
es
>  1.149e+11            +1.4%  1.165e+11        perf-stat.ps.cpu-cycles
>       8224            +4.1%       8558 =C2=B1  2%  perf-stat.ps.cpu-migra=
tions
>  3.143e+10            +2.7%  3.227e+10        perf-stat.ps.dTLB-loads
>     786098 =C2=B1  2%      +7.5%     844719 =C2=B1  4%  perf-stat.ps.dTLB=
-store-misses
>  5.151e+09            +3.1%  5.312e+09        perf-stat.ps.dTLB-stores
>    9765845            +2.8%   10042378        perf-stat.ps.iTLB-loads
>  1.075e+11            +2.7%  1.104e+11        perf-stat.ps.instructions
>     619192            +3.1%     638487        perf-stat.ps.minor-faults
>   30330253            +3.6%   31411890        perf-stat.ps.node-load-miss=
es
>    1171464 =C2=B1  2%      +3.4%    1211222        perf-stat.ps.node-loads
>   13537340            +4.7%   14170261        perf-stat.ps.node-store-mis=
ses
>     619199            +3.1%     638494        perf-stat.ps.page-faults
>  3.318e+13            +2.5%    3.4e+13        perf-stat.total.instructions
>      31.35            -0.9       30.42        perf-profile.calltrace.cycl=
es-pp.mwait_idle_with_hints.intel_idle.cpuidle_enter_state.cpuidle_enter.cp=
uidle_idle_call
>      31.35            -0.9       30.43        perf-profile.calltrace.cycl=
es-pp.intel_idle.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_call.do_idle
>      31.22            -0.4       30.78        perf-profile.calltrace.cycl=
es-pp.exc_page_fault.asm_exc_page_fault.do_access
>      31.21            -0.4       30.77        perf-profile.calltrace.cycl=
es-pp.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.do_access
>      30.51            -0.4       30.08        perf-profile.calltrace.cycl=
es-pp.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_page_fault.a=
sm_exc_page_fault
>      31.56            -0.4       31.13        perf-profile.calltrace.cycl=
es-pp.asm_exc_page_fault.do_access
>      30.62            -0.4       30.19        perf-profile.calltrace.cycl=
es-pp.handle_mm_fault.do_user_addr_fault.exc_page_fault.asm_exc_page_fault.=
do_access
>      29.52            -0.4       29.10        perf-profile.calltrace.cycl=
es-pp.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr=
_fault
>      29.53            -0.4       29.11        perf-profile.calltrace.cycl=
es-pp.do_fault.__handle_mm_fault.handle_mm_fault.do_user_addr_fault.exc_pag=
e_fault
>      14.25            -0.3       13.90        perf-profile.calltrace.cycl=
es-pp.finish_fault.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
>      38.30            -0.3       37.95        perf-profile.calltrace.cycl=
es-pp.do_access
>      14.18            -0.3       13.83        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock.finish_fault.do_read_fault.do_fault.__handle_mm_fault
>      13.96            -0.3       13.62        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.finish_fault.do_read_=
fault.do_fault
>       0.56 =C2=B1  4%      -0.2        0.34 =C2=B1 70%  perf-profile.call=
trace.cycles-pp.schedule_idle.do_idle.cpu_startup_entry.start_secondary.sec=
ondary_startup_64_no_verify
>       0.92            -0.2        0.77        perf-profile.calltrace.cycl=
es-pp.wake_page_function.__wake_up_common.folio_wake_bit.do_read_fault.do_f=
ault
>       1.07            -0.1        0.92        perf-profile.calltrace.cycl=
es-pp.__wake_up_common.folio_wake_bit.do_read_fault.do_fault.__handle_mm_fa=
ult
>       0.87            -0.1        0.73        perf-profile.calltrace.cycl=
es-pp.try_to_wake_up.wake_page_function.__wake_up_common.folio_wake_bit.do_=
read_fault
>       1.32            -0.1        1.19        perf-profile.calltrace.cycl=
es-pp.folio_wake_bit.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fau=
lt
>       8.87            -0.1        8.79        perf-profile.calltrace.cycl=
es-pp.filemap_map_pages.do_read_fault.do_fault.__handle_mm_fault.handle_mm_=
fault
>       7.09            -0.1        7.02        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock.filemap_map_pages.do_=
read_fault.do_fault
>       7.16            -0.1        7.09        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock.filemap_map_pages.do_read_fault.do_fault.__handle_mm_f=
ault
>       0.69            -0.1        0.63        perf-profile.calltrace.cycl=
es-pp.folio_wake_bit.filemap_map_pages.do_read_fault.do_fault.__handle_mm_f=
ault
>       0.58            -0.1        0.52        perf-profile.calltrace.cycl=
es-pp.__wake_up_common.folio_wake_bit.filemap_map_pages.do_read_fault.do_fa=
ult
>       1.14            +0.1        1.20        perf-profile.calltrace.cycl=
es-pp.native_queued_spin_lock_slowpath._raw_spin_lock_irq.folio_wait_bit_co=
mmon.__filemap_get_folio.shmem_getpage_gfp
>       1.40            +0.1        1.46        perf-profile.calltrace.cycl=
es-pp._raw_spin_lock_irq.folio_wait_bit_common.__filemap_get_folio.shmem_ge=
tpage_gfp.shmem_fault
>       3.84            +0.1        3.94        perf-profile.calltrace.cycl=
es-pp.folio_wait_bit_common.__filemap_get_folio.shmem_getpage_gfp.shmem_fau=
lt.__do_fault
>       4.34            +0.1        4.47        perf-profile.calltrace.cycl=
es-pp.__filemap_get_folio.shmem_getpage_gfp.shmem_fault.__do_fault.do_read_=
fault
>       4.75            +0.1        4.88        perf-profile.calltrace.cycl=
es-pp.shmem_fault.__do_fault.do_read_fault.do_fault.__handle_mm_fault
>       4.76            +0.1        4.90        perf-profile.calltrace.cycl=
es-pp.__do_fault.do_read_fault.do_fault.__handle_mm_fault.handle_mm_fault
>       4.66            +0.1        4.80        perf-profile.calltrace.cycl=
es-pp.shmem_getpage_gfp.shmem_fault.__do_fault.do_read_fault.do_fault
>       0.66            +0.2        0.83        perf-profile.calltrace.cycl=
es-pp.sched_ttwu_pending.flush_smp_call_function_queue.do_idle.cpu_startup_=
entry.start_secondary
>      18.74            +0.2       18.94        perf-profile.calltrace.cycl=
es-pp.do_rw_once
>       0.34 =C2=B1 70%      +0.2        0.57        perf-profile.calltrace=
.cycles-pp.pick_next_task_fair.__schedule.schedule.io_schedule.folio_wait_b=
it_common
>       0.34 =C2=B1 70%      +0.2        0.57        perf-profile.calltrace=
.cycles-pp.newidle_balance.pick_next_task_fair.__schedule.schedule.io_sched=
ule
>      49.12            +0.2       49.36        perf-profile.calltrace.cycl=
es-pp.do_idle.cpu_startup_entry.start_secondary.secondary_startup_64_no_ver=
ify
>      49.13            +0.2       49.37        perf-profile.calltrace.cycl=
es-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_verify
>      49.14            +0.2       49.38        perf-profile.calltrace.cycl=
es-pp.start_secondary.secondary_startup_64_no_verify
>       1.03            +0.2        1.28        perf-profile.calltrace.cycl=
es-pp.flush_smp_call_function_queue.do_idle.cpu_startup_entry.start_seconda=
ry.secondary_startup_64_no_verify
>       0.00            +0.5        0.51        perf-profile.calltrace.cycl=
es-pp.load_balance.newidle_balance.pick_next_task_fair.__schedule.schedule
>      13.16            +1.0       14.17 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.intel_idle_irq.cpuidle_enter_state.cpuidle_enter.cpuidle_idle_ca=
ll.do_idle
>      31.49            -1.0       30.53        perf-profile.children.cycle=
s-pp.intel_idle
>      31.23            -0.4       30.79        perf-profile.children.cycle=
s-pp.exc_page_fault
>      31.22            -0.4       30.78        perf-profile.children.cycle=
s-pp.do_user_addr_fault
>      30.63            -0.4       30.19        perf-profile.children.cycle=
s-pp.handle_mm_fault
>      31.59            -0.4       31.16        perf-profile.children.cycle=
s-pp.asm_exc_page_fault
>      30.52            -0.4       30.09        perf-profile.children.cycle=
s-pp.__handle_mm_fault
>      29.53            -0.4       29.11        perf-profile.children.cycle=
s-pp.do_fault
>      29.53            -0.4       29.11        perf-profile.children.cycle=
s-pp.do_read_fault
>      22.22            -0.4       21.82        perf-profile.children.cycle=
s-pp._raw_spin_lock
>      14.25            -0.3       13.90        perf-profile.children.cycle=
s-pp.finish_fault
>      23.00            -0.3       22.66        perf-profile.children.cycle=
s-pp.native_queued_spin_lock_slowpath
>      41.25            -0.3       40.92        perf-profile.children.cycle=
s-pp.do_access
>       1.41            -0.2        1.19        perf-profile.children.cycle=
s-pp.wake_page_function
>       1.32            -0.2        1.12        perf-profile.children.cycle=
s-pp.try_to_wake_up
>       1.65            -0.2        1.45        perf-profile.children.cycle=
s-pp.__wake_up_common
>       2.01            -0.2        1.83        perf-profile.children.cycle=
s-pp.folio_wake_bit
>       8.87            -0.1        8.79        perf-profile.children.cycle=
s-pp.filemap_map_pages
>       0.52            -0.1        0.45        perf-profile.children.cycle=
s-pp.ttwu_do_activate
>       0.56 =C2=B1  3%      -0.1        0.51 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.schedule_idle
>       0.45            -0.1        0.40        perf-profile.children.cycle=
s-pp.enqueue_task_fair
>       0.13 =C2=B1  3%      -0.0        0.09 =C2=B1  5%  perf-profile.chil=
dren.cycles-pp.set_next_entity
>       0.28            -0.0        0.25        perf-profile.children.cycle=
s-pp.update_load_avg
>       0.27 =C2=B1  3%      -0.0        0.25 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.update_rq_clock
>       0.35            -0.0        0.33        perf-profile.children.cycle=
s-pp.enqueue_entity
>       0.34            -0.0        0.33        perf-profile.children.cycle=
s-pp.dequeue_entity
>       0.16            -0.0        0.14 =C2=B1  3%  perf-profile.children.=
cycles-pp.update_curr
>       0.09 =C2=B1  5%      -0.0        0.07        perf-profile.children.=
cycles-pp.tick_nohz_idle_exit
>       0.23 =C2=B1  2%      -0.0        0.22 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.timekeeping_max_deferment
>       0.38            -0.0        0.37        perf-profile.children.cycle=
s-pp.dequeue_task_fair
>       0.08            -0.0        0.07        perf-profile.children.cycle=
s-pp.__update_load_avg_se
>       0.10            +0.0        0.11        perf-profile.children.cycle=
s-pp.native_sched_clock
>       0.09 =C2=B1  5%      +0.0        0.11        perf-profile.children.=
cycles-pp.xas_find
>       0.21 =C2=B1  2%      +0.0        0.23 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.xas_load
>       0.22 =C2=B1  2%      +0.0        0.25        perf-profile.children.=
cycles-pp.llist_add_batch
>       0.15 =C2=B1  5%      +0.0        0.17 =C2=B1  2%  perf-profile.chil=
dren.cycles-pp.llist_reverse_order
>       0.22 =C2=B1  2%      +0.0        0.25        perf-profile.children.=
cycles-pp.__smp_call_single_queue
>       0.44            +0.0        0.47        perf-profile.children.cycle=
s-pp.ttwu_queue_wakelist
>       0.43            +0.0        0.48        perf-profile.children.cycle=
s-pp.update_sg_lb_stats
>       0.22 =C2=B1  3%      +0.0        0.27        perf-profile.children.=
cycles-pp.__flush_smp_call_function_queue
>       0.45            +0.0        0.50        perf-profile.children.cycle=
s-pp.update_sd_lb_stats
>       0.46            +0.0        0.51        perf-profile.children.cycle=
s-pp.find_busiest_group
>       0.00            +0.1        0.05        perf-profile.children.cycle=
s-pp.cpumask_next_and
>       0.52            +0.1        0.58        perf-profile.children.cycle=
s-pp.load_balance
>       1.46            +0.1        1.53        perf-profile.children.cycle=
s-pp._raw_spin_lock_irq
>       0.51            +0.1        0.58        perf-profile.children.cycle=
s-pp.newidle_balance
>       3.84            +0.1        3.95        perf-profile.children.cycle=
s-pp.folio_wait_bit_common
>       4.34            +0.1        4.47        perf-profile.children.cycle=
s-pp.__filemap_get_folio
>       4.75            +0.1        4.88        perf-profile.children.cycle=
s-pp.shmem_fault
>       4.76            +0.1        4.90        perf-profile.children.cycle=
s-pp.__do_fault
>       4.66            +0.1        4.80        perf-profile.children.cycle=
s-pp.shmem_getpage_gfp
>       0.66            +0.2        0.84        perf-profile.children.cycle=
s-pp.sched_ttwu_pending
>      16.00            +0.2       16.19        perf-profile.children.cycle=
s-pp.do_rw_once
>      49.14            +0.2       49.38        perf-profile.children.cycle=
s-pp.start_secondary
>       1.04            +0.2        1.28        perf-profile.children.cycle=
s-pp.flush_smp_call_function_queue
>      13.22            +1.0       14.21 =C2=B1  2%  perf-profile.children.=
cycles-pp.intel_idle_irq
>      22.90            -0.3       22.56        perf-profile.self.cycles-pp=
.native_queued_spin_lock_slowpath
>       0.46 =C2=B1  2%      -0.1        0.40 =C2=B1  2%  perf-profile.self=
.cycles-pp.__schedule
>       0.10 =C2=B1  4%      -0.0        0.07        perf-profile.self.cycl=
es-pp.enqueue_task_fair
>       0.08 =C2=B1  6%      -0.0        0.05 =C2=B1  8%  perf-profile.self=
.cycles-pp.ttwu_do_activate
>       0.21 =C2=B1  2%      -0.0        0.18 =C2=B1  2%  perf-profile.self=
.cycles-pp.update_rq_clock
>       0.23            -0.0        0.22 =C2=B1  2%  perf-profile.self.cycl=
es-pp.timekeeping_max_deferment
>       0.09 =C2=B1  5%      -0.0        0.08        perf-profile.self.cycl=
es-pp.update_load_avg
>       0.12            -0.0        0.11        perf-profile.self.cycles-pp=
.enqueue_entity
>       0.07 =C2=B1  6%      +0.0        0.09        perf-profile.self.cycl=
es-pp.__flush_smp_call_function_queue
>       0.12 =C2=B1  3%      +0.0        0.14 =C2=B1  3%  perf-profile.self=
.cycles-pp.ttwu_queue_wakelist
>       0.22 =C2=B1  2%      +0.0        0.25        perf-profile.self.cycl=
es-pp.llist_add_batch
>       0.16 =C2=B1  2%      +0.0        0.19 =C2=B1  2%  perf-profile.self=
.cycles-pp.flush_smp_call_function_queue
>       0.15 =C2=B1  3%      +0.0        0.17 =C2=B1  2%  perf-profile.self=
.cycles-pp.llist_reverse_order
>       0.32            +0.0        0.35        perf-profile.self.cycles-pp=
.update_sg_lb_stats
>       7.54            +0.1        7.62        perf-profile.self.cycles-pp=
.do_access
>      11.15            +0.2       11.30        perf-profile.self.cycles-pp=
.do_rw_once
> =

> =

> =

> *************************************************************************=
**************************
> lkp-icl-2sp5: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ =
2.60GHz (Ice Lake) with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_=
group/test/testcase/ucode:
>   gcc-11/performance/bufferedio/1SSD/ext4_no_jnl/x86_64-rhel-8.3/ssd/debi=
an-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/DWSL/fxmark/0xd000331
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     547.46 =C2=B1  5%     -99.9%       0.48        fxmark.ssd_ext4_no_jnl=
_DWSL_18_bufferedio.idle_sec
>      61.13 =C2=B1  5%     -99.9%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_18_bufferedio.idle_util
>     318.07 =C2=B1  9%    +170.9%     861.59        fxmark.ssd_ext4_no_jnl=
_DWSL_18_bufferedio.iowait_sec
>      35.52 =C2=B1  9%    +170.6%      96.11        fxmark.ssd_ext4_no_jnl=
_DWSL_18_bufferedio.iowait_util
>       4.49 =C2=B1  2%     -21.1%       3.54        fxmark.ssd_ext4_no_jnl=
_DWSL_18_bufferedio.softirq_sec
>       0.50 =C2=B1  2%     -21.2%       0.40        fxmark.ssd_ext4_no_jnl=
_DWSL_18_bufferedio.softirq_util
>      15.09 =C2=B1  2%     +36.6%      20.61 =C2=B1  3%  fxmark.ssd_ext4_n=
o_jnl_DWSL_18_bufferedio.sys_sec
>       1.69 =C2=B1  2%     +36.4%       2.30 =C2=B1  3%  fxmark.ssd_ext4_n=
o_jnl_DWSL_18_bufferedio.sys_util
>      38.97 =C2=B1  3%     -99.9%       0.03        fxmark.ssd_ext4_no_jnl=
_DWSL_2_bufferedio.idle_sec
>      39.44 =C2=B1  3%     -99.9%       0.03        fxmark.ssd_ext4_no_jnl=
_DWSL_2_bufferedio.idle_util
>      52.14 =C2=B1  2%     +74.9%      91.18        fxmark.ssd_ext4_no_jnl=
_DWSL_2_bufferedio.iowait_sec
>      52.77 =C2=B1  2%     +75.1%      92.37        fxmark.ssd_ext4_no_jnl=
_DWSL_2_bufferedio.iowait_util
>       1.18 =C2=B1  3%      -9.3%       1.07 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_2_bufferedio.softirq_sec
>       1.19 =C2=B1  3%      -9.2%       1.08 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_2_bufferedio.softirq_util
>     768.11 =C2=B1  3%     -99.9%       0.97        fxmark.ssd_ext4_no_jnl=
_DWSL_36_bufferedio.idle_sec
>      43.24 =C2=B1  3%     -99.9%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_36_bufferedio.idle_util
>     945.49 =C2=B1  3%     +80.4%       1706        fxmark.ssd_ext4_no_jnl=
_DWSL_36_bufferedio.iowait_sec
>      53.23 =C2=B1  3%     +81.0%      96.35        fxmark.ssd_ext4_no_jnl=
_DWSL_36_bufferedio.iowait_util
>       8.44 =C2=B1  2%     -37.3%       5.29        fxmark.ssd_ext4_no_jnl=
_DWSL_36_bufferedio.softirq_sec
>       0.47 =C2=B1  2%     -37.1%       0.30        fxmark.ssd_ext4_no_jnl=
_DWSL_36_bufferedio.softirq_util
>      36.62           +10.9%      40.61 =C2=B1  3%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_bufferedio.sys_sec
>       2.06           +11.3%       2.29 =C2=B1  3%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_bufferedio.sys_util
>     105.62           -99.9%       0.08 =C2=B1  5%  fxmark.ssd_ext4_no_jnl=
_DWSL_4_bufferedio.idle_sec
>      53.32           -99.9%       0.04 =C2=B1  5%  fxmark.ssd_ext4_no_jnl=
_DWSL_4_bufferedio.idle_util
>      83.46          +126.4%     188.95        fxmark.ssd_ext4_no_jnl_DWSL=
_4_bufferedio.iowait_sec
>      42.13          +126.5%      95.44        fxmark.ssd_ext4_no_jnl_DWSL=
_4_bufferedio.iowait_util
>       1.53           -11.7%       1.35        fxmark.ssd_ext4_no_jnl_DWSL=
_4_bufferedio.softirq_sec
>       0.77           -11.7%       0.68        fxmark.ssd_ext4_no_jnl_DWSL=
_4_bufferedio.softirq_util
>     595.33 =C2=B1  6%     -99.8%       1.44        fxmark.ssd_ext4_no_jnl=
_DWSL_54_bufferedio.idle_sec
>      22.35 =C2=B1  6%     -99.8%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_54_bufferedio.idle_util
>       1978           +30.3%       2578        fxmark.ssd_ext4_no_jnl_DWSL=
_54_bufferedio.iowait_sec
>      74.26           +30.6%      96.96        fxmark.ssd_ext4_no_jnl_DWSL=
_54_bufferedio.iowait_util
>      10.91 =C2=B1  2%     -29.6%       7.68 =C2=B1  6%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_bufferedio.softirq_sec
>       0.41 =C2=B1  2%     -29.5%       0.29 =C2=B1  6%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_bufferedio.softirq_util
>      54.61           -18.2%      44.69 =C2=B1  5%  fxmark.ssd_ext4_no_jnl=
_DWSL_54_bufferedio.sys_sec
>       2.05           -18.0%       1.68 =C2=B1  5%  fxmark.ssd_ext4_no_jnl=
_DWSL_54_bufferedio.sys_util
>     863394           -17.8%     709462        fxmark.ssd_ext4_no_jnl_DWSL=
_54_bufferedio.works
>      17266           -17.8%      14188        fxmark.ssd_ext4_no_jnl_DWSL=
_54_bufferedio.works/sec
>     596.19 =C2=B1  8%     -99.7%       1.93        fxmark.ssd_ext4_no_jnl=
_DWSL_72_bufferedio.idle_sec
>      16.71 =C2=B1  8%     -99.7%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_72_bufferedio.idle_util
>       2876           +20.7%       3471        fxmark.ssd_ext4_no_jnl_DWSL=
_72_bufferedio.iowait_sec
>      80.60           +21.0%      97.49        fxmark.ssd_ext4_no_jnl_DWSL=
_72_bufferedio.iowait_util
>      10.97           -22.5%       8.50        fxmark.ssd_ext4_no_jnl_DWSL=
_72_bufferedio.softirq_sec
>       0.31           -22.4%       0.24        fxmark.ssd_ext4_no_jnl_DWSL=
_72_bufferedio.softirq_util
>      56.89 =C2=B1  2%     -13.8%      49.05        fxmark.ssd_ext4_no_jnl=
_DWSL_72_bufferedio.sys_sec
>       1.59 =C2=B1  2%     -13.6%       1.38        fxmark.ssd_ext4_no_jnl=
_DWSL_72_bufferedio.sys_util
>    1888927            -1.4%    1861568        fxmark.time.voluntary_conte=
xt_switches
>     887.98 =C2=B1  4%     -10.7%     792.61 =C2=B1  4%  uptime.idle
>      46.38           -47.3%      24.46        iostat.cpu.idle
>      47.98           +45.6%      69.87        iostat.cpu.iowait
>      48.04           -22.3       25.74        mpstat.cpu.all.idle%
>      47.58           +22.3       69.86        mpstat.cpu.all.iowait%
>       0.46            -0.1        0.39 =C2=B1  2%  mpstat.cpu.all.soft%
>      91403            -3.8%      87911        vmstat.io.bo
>     115289            -6.9%     107297        vmstat.system.cs
>      74823            -1.5%      73683        vmstat.system.in
>    4783214            -2.7%    4653205        proc-vmstat.nr_dirtied
>    4783215            -2.7%    4653206        proc-vmstat.nr_written
>   49078494            -4.1%   47056073        proc-vmstat.pgpgout
>      55388            +4.0%      57614 =C2=B1  4%  proc-vmstat.slabs_scan=
ned
>     115343            -7.0%     107276        perf-stat.i.context-switches
>      54.43            -4.9%      51.78        perf-stat.i.cpu-migrations
>       0.59 =C2=B1  7%      +0.1        0.68 =C2=B1  5%  perf-stat.i.node-=
load-miss-rate%
>      63.59 =C2=B1 10%      +7.6       71.20 =C2=B1  3%  perf-stat.overall=
.node-load-miss-rate%
>     115098            -7.0%     107046        perf-stat.ps.context-switch=
es
>      54.35            -4.8%      51.71        perf-stat.ps.cpu-migrations
>      15146 =C2=B1 18%    +118.8%      33133 =C2=B1 20%  numa-vmstat.node0=
.nr_anon_pages
>      17357 =C2=B1 13%    +103.2%      35265 =C2=B1 18%  numa-vmstat.node0=
.nr_inactive_anon
>      17357 =C2=B1 13%    +103.2%      35265 =C2=B1 18%  numa-vmstat.node0=
.nr_zone_inactive_anon
>      50846 =C2=B1  5%     -34.0%      33568 =C2=B1 20%  numa-vmstat.node1=
.nr_anon_pages
>     817694           -10.9%     728530        numa-vmstat.node1.nr_dirtied
>      53458 =C2=B1  6%     -31.7%      36517 =C2=B1 18%  numa-vmstat.node1=
.nr_inactive_anon
>     817694           -10.9%     728530        numa-vmstat.node1.nr_written
>      53458 =C2=B1  6%     -31.7%      36517 =C2=B1 18%  numa-vmstat.node1=
.nr_zone_inactive_anon
>      22080 =C2=B1 52%    +314.9%      91604 =C2=B1 17%  numa-meminfo.node=
0.AnonHugePages
>      60566 =C2=B1 18%    +118.8%     132516 =C2=B1 20%  numa-meminfo.node=
0.AnonPages
>      99858 =C2=B1 13%     +65.7%     165482 =C2=B1 13%  numa-meminfo.node=
0.AnonPages.max
>      69760 =C2=B1 13%    +102.7%     141382 =C2=B1 18%  numa-meminfo.node=
0.Inactive
>      69412 =C2=B1 13%    +103.2%     141051 =C2=B1 18%  numa-meminfo.node=
0.Inactive(anon)
>     170305 =C2=B1  6%     -42.1%      98616 =C2=B1 18%  numa-meminfo.node=
1.AnonHugePages
>     203382 =C2=B1  5%     -34.0%     134270 =C2=B1 20%  numa-meminfo.node=
1.AnonPages
>     246182 =C2=B1  8%     -27.3%     178906 =C2=B1 13%  numa-meminfo.node=
1.AnonPages.max
>     213851 =C2=B1  6%     -31.7%     146083 =C2=B1 18%  numa-meminfo.node=
1.Inactive
>     213830 =C2=B1  6%     -31.7%     146061 =C2=B1 18%  numa-meminfo.node=
1.Inactive(anon)
>       0.00            +0.6        0.57 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.dd_insert_reques=
ts.blk_mq_sched_insert_request.blk_mq_submit_bio
>       0.43 =C2=B1 71%      +0.6        1.02 =C2=B1 18%  perf-profile.call=
trace.cycles-pp.dd_dispatch_request.__blk_mq_do_dispatch_sched.blk_mq_do_di=
spatch_sched.__blk_mq_sched_dispatch_requests.blk_mq_sched_dispatch_requests
>       0.00            +0.6        0.60 =C2=B1  5%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.dd_insert_requests.blk_mq_sched_insert_request.bl=
k_mq_submit_bio.submit_bio_noacct_nocheck
>       0.17 =C2=B1141%      +0.6        0.82 =C2=B1 11%  perf-profile.call=
trace.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.dd_dispatch=
_request.__blk_mq_do_dispatch_sched.blk_mq_do_dispatch_sched
>       0.18 =C2=B1141%      +0.7        0.87 =C2=B1 13%  perf-profile.call=
trace.cycles-pp._raw_spin_lock.dd_dispatch_request.__blk_mq_do_dispatch_sch=
ed.blk_mq_do_dispatch_sched.__blk_mq_sched_dispatch_requests
>       0.00            +0.7        0.71 =C2=B1  2%  perf-profile.calltrace=
.cycles-pp.dd_insert_requests.blk_mq_sched_insert_request.blk_mq_submit_bio=
.submit_bio_noacct_nocheck.submit_bh_wbc
>       0.00            +0.7        0.72 =C2=B1  3%  perf-profile.calltrace=
.cycles-pp.blk_mq_sched_insert_request.blk_mq_submit_bio.submit_bio_noacct_=
nocheck.submit_bh_wbc.__sync_dirty_buffer
>       0.12 =C2=B1 71%      +0.1        0.24 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.dd_bio_merge
>       0.22 =C2=B1 71%      +0.5        0.72 =C2=B1  3%  perf-profile.chil=
dren.cycles-pp.blk_mq_sched_insert_request
>       0.54 =C2=B1 71%      +0.6        1.18 =C2=B1 17%  perf-profile.chil=
dren.cycles-pp.dd_dispatch_request
>       0.39 =C2=B1 71%      +0.8        1.20 =C2=B1  4%  perf-profile.chil=
dren.cycles-pp.dd_insert_requests
>       0.11 =C2=B1 18%      -0.1        0.06 =C2=B1 72%  perf-profile.self=
.cycles-pp.__blk_bios_map_sg
>       0.10 =C2=B1 16%      -0.0        0.05 =C2=B1 72%  perf-profile.self=
.cycles-pp.try_to_wake_up
>       0.02 =C2=B1141%      +0.0        0.07 =C2=B1 18%  perf-profile.self=
.cycles-pp.next_uptodate_page
>       3259 =C2=B1 92%     -89.5%     340.97 =C2=B1138%  sched_debug.cfs_r=
q:/.MIN_vruntime.avg
>       8479 =C2=B1 52%     -77.7%       1890 =C2=B1 87%  sched_debug.cfs_r=
q:/.MIN_vruntime.max
>       1892 =C2=B1 53%     -66.7%     631.09 =C2=B1125%  sched_debug.cfs_r=
q:/.MIN_vruntime.stddev
>       0.36 =C2=B1 18%     -28.8%       0.26 =C2=B1  9%  sched_debug.cfs_r=
q:/.h_nr_running.avg
>    3328319 =C2=B1 68%     -74.7%     843434 =C2=B1129%  sched_debug.cfs_r=
q:/.load.avg
>    6926385 =C2=B1 65%     -50.0%    3463840 =C2=B1126%  sched_debug.cfs_r=
q:/.load.max
>    3306751 =C2=B1 68%     -57.3%    1411316 =C2=B1133%  sched_debug.cfs_r=
q:/.load.stddev
>       3259 =C2=B1 92%     -89.5%     340.97 =C2=B1138%  sched_debug.cfs_r=
q:/.max_vruntime.avg
>       8479 =C2=B1 52%     -77.7%       1890 =C2=B1 87%  sched_debug.cfs_r=
q:/.max_vruntime.max
>       1892 =C2=B1 53%     -66.7%     631.09 =C2=B1125%  sched_debug.cfs_r=
q:/.max_vruntime.stddev
>      38246 =C2=B1  7%     +20.3%      45995 =C2=B1  7%  sched_debug.cfs_r=
q:/.min_vruntime.max
>       2837 =C2=B1 19%     +69.2%       4801 =C2=B1 12%  sched_debug.cfs_r=
q:/.min_vruntime.stddev
>     295.82 =C2=B1 21%     -39.7%     178.25 =C2=B1 51%  sched_debug.cfs_r=
q:/.removed.load_avg.max
>      59.77 =C2=B1 21%     -49.1%      30.42 =C2=B1 69%  sched_debug.cfs_r=
q:/.removed.load_avg.stddev
>       6.44 =C2=B1 17%     -56.8%       2.78 =C2=B1 84%  sched_debug.cfs_r=
q:/.removed.runnable_avg.avg
>     148.67 =C2=B1 20%     -39.4%      90.07 =C2=B1 50%  sched_debug.cfs_r=
q:/.removed.runnable_avg.max
>      28.92 =C2=B1 19%     -47.9%      15.06 =C2=B1 67%  sched_debug.cfs_r=
q:/.removed.runnable_avg.stddev
>       6.43 =C2=B1 17%     -56.8%       2.78 =C2=B1 84%  sched_debug.cfs_r=
q:/.removed.util_avg.avg
>     148.64 =C2=B1 20%     -39.5%      89.92 =C2=B1 50%  sched_debug.cfs_r=
q:/.removed.util_avg.max
>      28.91 =C2=B1 19%     -48.0%      15.04 =C2=B1 67%  sched_debug.cfs_r=
q:/.removed.util_avg.stddev
>       4093 =C2=B1 41%    +162.6%      10749 =C2=B1 19%  sched_debug.cfs_r=
q:/.spread0.max
>       2838 =C2=B1 19%     +69.2%       4801 =C2=B1 12%  sched_debug.cfs_r=
q:/.spread0.stddev
>       3280 =C2=B1  5%     -24.2%       2485 =C2=B1  7%  sched_debug.cpu.c=
lock_task.stddev
>    3977314 =C2=B1  5%     -13.8%    3428231 =C2=B1  8%  sched_debug.cpu.n=
r_switches.max
>     603561 =C2=B1  5%     -15.2%     511855 =C2=B1  9%  sched_debug.cpu.n=
r_switches.stddev
> =

> =

> =

> *************************************************************************=
**************************
> lkp-icl-2sp5: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ =
2.60GHz (Ice Lake) with 128G memory
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/directio/disk/fstype/kconfig/media/rootfs/tbox_=
group/test/testcase/ucode:
>   gcc-11/performance/directio/1SSD/ext4_no_jnl/x86_64-rhel-8.3/ssd/debian=
-11.1-x86_64-20220510.cgz/lkp-icl-2sp5/DWSL/fxmark/0xd000331
> =

> commit: =

>   28156108fe ("sched: Fix the check of nr_running at queue wakelist")
>   f3dd3f6745 ("sched: Remove the limitation of WF_ON_CPU on wakelist if w=
akee cpu is idle")
> =

> 28156108fecb1f80 f3dd3f674555bd9455c5ae7fafc =

> ---------------- --------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     518.88 =C2=B1  5%     -99.9%       0.48        fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.idle_sec
>      57.91 =C2=B1  5%     -99.9%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.idle_util
>     348.18 =C2=B1  8%    +148.6%     865.70        fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.iowait_sec
>      38.86 =C2=B1  8%    +148.6%      96.59        fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.iowait_util
>       3.62           -25.6%       2.70 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.softirq_sec
>       0.40           -25.6%       0.30 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_18_directio.softirq_util
>      37.96 =C2=B1  2%     -99.9%       0.03        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.idle_sec
>      38.38 =C2=B1  2%     -99.9%       0.03        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.idle_util
>      53.08 =C2=B1  2%     +72.0%      91.31        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.iowait_sec
>      53.66 =C2=B1  2%     +71.6%      92.06        fxmark.ssd_ext4_no_jnl=
_DWSL_2_directio.iowait_util
>       0.98 =C2=B1  5%     -15.1%       0.83 =C2=B1  2%  fxmark.ssd_ext4_n=
o_jnl_DWSL_2_directio.softirq_sec
>       0.99 =C2=B1  5%     -15.4%       0.84 =C2=B1  2%  fxmark.ssd_ext4_n=
o_jnl_DWSL_2_directio.softirq_util
>     865.64 =C2=B1  5%     -99.9%       0.98        fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.idle_sec
>      48.76 =C2=B1  5%     -99.9%       0.06        fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.idle_util
>     854.04 =C2=B1  5%    +100.5%       1712        fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.iowait_sec
>      48.11 =C2=B1  5%    +100.5%      96.47        fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.iowait_util
>       8.44           -46.7%       4.50 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.softirq_sec
>       0.48           -46.7%       0.25 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.softirq_util
>      28.81           +31.1%      37.76 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.sys_sec
>       1.62           +31.1%       2.13 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.sys_util
>     975762           -23.4%     747169 =C2=B1  3%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.works
>      19514           -23.4%      14942 =C2=B1  3%  fxmark.ssd_ext4_no_jnl=
_DWSL_36_directio.works/sec
>     112.89           -99.9%       0.08 =C2=B1  5%  fxmark.ssd_ext4_no_jnl=
_DWSL_4_directio.idle_sec
>      56.95           -99.9%       0.04 =C2=B1  5%  fxmark.ssd_ext4_no_jnl=
_DWSL_4_directio.idle_util
>      75.46 =C2=B1  2%    +150.0%     188.64        fxmark.ssd_ext4_no_jnl=
_DWSL_4_directio.iowait_sec
>      38.07          +149.7%      95.07        fxmark.ssd_ext4_no_jnl_DWSL=
_4_directio.iowait_util
>       1.34 =C2=B1  3%     -20.2%       1.07 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_4_directio.softirq_sec
>       0.68 =C2=B1  3%     -20.3%       0.54 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_4_directio.softirq_util
>     508.25 =C2=B1  9%     -99.7%       1.46        fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.idle_sec
>      19.07 =C2=B1  9%     -99.7%       0.05        fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.idle_util
>       2075 =C2=B1  2%     +25.1%       2595        fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.iowait_sec
>      77.86 =C2=B1  2%     +24.5%      96.91        fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.iowait_util
>       9.07 =C2=B1  4%     -31.1%       6.26 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_directio.softirq_sec
>       0.34 =C2=B1  4%     -31.4%       0.23 =C2=B1  4%  fxmark.ssd_ext4_n=
o_jnl_DWSL_54_directio.softirq_util
>     816890           -29.5%     575621 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.works
>      16336           -29.5%      11511 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_54_directio.works/sec
>     507.19 =C2=B1 10%     -99.6%       1.97        fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.idle_sec
>      14.21 =C2=B1 10%     -99.6%       0.06        fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.idle_util
>       2974           +17.2%       3486        fxmark.ssd_ext4_no_jnl_DWSL=
_72_directio.iowait_sec
>      83.34           +16.9%      97.44        fxmark.ssd_ext4_no_jnl_DWSL=
_72_directio.iowait_util
>      31.28           +23.0%      38.50 =C2=B1  8%  fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.irq_sec
>       0.88           +22.7%       1.08 =C2=B1  8%  fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.irq_util
>       9.45           -29.6%       6.66 =C2=B1  3%  fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.softirq_sec
>       0.26           -29.7%       0.19 =C2=B1  3%  fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.softirq_util
>     826258           -33.0%     553194 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.works
>      16523           -33.0%      11062 =C2=B1  2%  fxmark.ssd_ext4_no_jnl=
_DWSL_72_directio.works/sec
>    1930279 =C2=B1  3%      -6.2%    1811239 =C2=B1  2%  fxmark.time.volun=
tary_context_switches
>   55807773           -11.6%   49357289 =C2=B1  4%  cpuidle..usage
>   53054978           -11.7%   46862001        proc-vmstat.pgpgout
>     830.64 =C2=B1  3%     -21.2%     654.40 =C2=B1  5%  uptime.idle
>      46.17 =C2=B1  2%     -46.7%      24.59 =C2=B1  2%  iostat.cpu.idle
>      48.27 =C2=B1  2%     +44.6%      69.80        iostat.cpu.iowait
>      47.91 =C2=B1  2%     -22.1       25.77 =C2=B1  2%  mpstat.cpu.all.id=
le%
>      47.73 =C2=B1  2%     +22.1       69.87        mpstat.cpu.all.iowait%
>       0.39 =C2=B1  3%      -0.1        0.31 =C2=B1  2%  mpstat.cpu.all.so=
ft%
>      98555           -11.8%      86971 =C2=B1  3%  vmstat.io.bo
>     102932           -19.4%      82934 =C2=B1  2%  vmstat.system.cs
>      76098            -7.5%      70394 =C2=B1  6%  vmstat.system.in
>     102783           -19.4%      82894 =C2=B1  2%  perf-stat.i.context-sw=
itches
>      54.23            -5.3%      51.38        perf-stat.i.cpu-migrations
>     102570           -19.4%      82720 =C2=B1  2%  perf-stat.ps.context-s=
witches
>      54.15            -5.2%      51.31        perf-stat.ps.cpu-migrations
>       1.39 =C2=B1  5%     -13.0%       1.21 =C2=B1  7%  sched_debug.cfs_r=
q:/.h_nr_running.max
>    1095631 =C2=B1166%     -90.9%     100111 =C2=B1 17%  sched_debug.cfs_r=
q:/.load.avg
>       1990 =C2=B1  9%     -22.9%       1535 =C2=B1 17%  sched_debug.cfs_r=
q:/.load_avg.max
>     306.85 =C2=B1 10%     -17.4%     253.49 =C2=B1 15%  sched_debug.cfs_r=
q:/.load_avg.stddev
>       6.20 =C2=B1  9%     -21.5%       4.86 =C2=B1 25%  sched_debug.cfs_r=
q:/.util_est_enqueued.avg
>       2873 =C2=B1 10%     -29.5%       2026 =C2=B1 10%  sched_debug.cpu.c=
lock_task.stddev
>    3837026 =C2=B1  7%     -23.4%    2940395 =C2=B1  8%  sched_debug.cpu.n=
r_switches.max
>      43.97 =C2=B1 42%     -13.1       30.88 =C2=B1 10%  perf-profile.call=
trace.cycles-pp.cpuidle_idle_call.do_idle.cpu_startup_entry.start_secondary=
.secondary_startup_64_no_verify
>      50.19 =C2=B1 33%     -12.7       37.50 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.secondary_startup_64_no_verify
>      49.35 =C2=B1 33%     -12.4       36.96 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.start_secondary.secondary_startup_64_no_verify
>      49.34 =C2=B1 33%     -12.4       36.96 =C2=B1 14%  perf-profile.call=
trace.cycles-pp.cpu_startup_entry.start_secondary.secondary_startup_64_no_v=
erify
>       1.41 =C2=B1 60%      -0.6        0.78 =C2=B1 15%  perf-profile.call=
trace.cycles-pp.tick_nohz_next_event.tick_nohz_get_sleep_length.menu_select=
.cpuidle_idle_call.do_idle
>       0.00            +0.8        0.75 =C2=B1  9%  perf-profile.calltrace=
.cycles-pp.native_queued_spin_lock_slowpath._raw_spin_lock.dd_insert_reques=
ts.blk_mq_sched_insert_request.blk_mq_submit_bio
>       0.00            +0.8        0.80 =C2=B1 10%  perf-profile.calltrace=
.cycles-pp._raw_spin_lock.dd_insert_requests.blk_mq_sched_insert_request.bl=
k_mq_submit_bio.submit_bio_noacct_nocheck
>       0.08 =C2=B1223%      +0.8        0.93 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.dd_insert_requests.blk_mq_sched_insert_request.blk_mq_submi=
t_bio.submit_bio_noacct_nocheck.submit_bh_wbc
>       0.08 =C2=B1223%      +0.9        0.94 =C2=B1 13%  perf-profile.call=
trace.cycles-pp.blk_mq_sched_insert_request.blk_mq_submit_bio.submit_bio_no=
acct_nocheck.submit_bh_wbc.__sync_dirty_buffer
>      44.82 =C2=B1 42%     -13.4       31.39 =C2=B1 10%  perf-profile.chil=
dren.cycles-pp.cpuidle_idle_call
>      50.17 =C2=B1 33%     -12.7       37.48 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.do_idle
>      50.19 =C2=B1 33%     -12.7       37.50 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.secondary_startup_64_no_verify
>      50.19 =C2=B1 33%     -12.7       37.50 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.cpu_startup_entry
>      49.35 =C2=B1 33%     -12.4       36.96 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.start_secondary
>      24.38 =C2=B1 33%      -6.7       17.72 =C2=B1 14%  perf-profile.chil=
dren.cycles-pp.mwait_idle_with_hints
>       1.78 =C2=B1 59%      -0.8        1.01 =C2=B1 11%  perf-profile.chil=
dren.cycles-pp.tick_nohz_get_sleep_length
>       1.45 =C2=B1 59%      -0.6        0.81 =C2=B1 15%  perf-profile.chil=
dren.cycles-pp.tick_nohz_next_event
>       0.70 =C2=B1 77%      -0.4        0.32 =C2=B1 31%  perf-profile.chil=
dren.cycles-pp.timekeeping_max_deferment
>       0.15 =C2=B1 13%      -0.1        0.09 =C2=B1 46%  perf-profile.chil=
dren.cycles-pp.nr_iowait_cpu
>       0.38 =C2=B1 45%      +0.6        0.94 =C2=B1 13%  perf-profile.chil=
dren.cycles-pp.blk_mq_sched_insert_request
>       0.66 =C2=B1 45%      +0.8        1.47 =C2=B1 16%  perf-profile.chil=
dren.cycles-pp.dd_insert_requests
>       0.70 =C2=B1 77%      -0.4        0.32 =C2=B1 30%  perf-profile.self=
.cycles-pp.timekeeping_max_deferment
>       0.26 =C2=B1 63%      -0.1        0.14 =C2=B1 10%  perf-profile.self=
.cycles-pp.tick_nohz_next_event
> =

> =

> #regzbot introduced: f3dd3f6745
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

>=20
--===============2336182661252183214==--

