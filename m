Content-Type: multipart/mixed; boundary="===============8090669926003504492=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [memcg] 45208c9105: aim7.jobs-per-min -14.0% regression
Date: Sun, 05 Sep 2021 15:15:46 -0700
Message-ID: <CALvZod77aP7qdwc5FkaZJf4FikeD0NwSuoJB4N94Uf0yqZFQpQ@mail.gmail.com>
In-Reply-To: <20210905124439.GA15026@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============8090669926003504492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 5, 2021 at 5:27 AM kernel test robot <oliver.sang@intel.com> =
wrote:
>
>
>
> Greeting,
>
> FYI, we noticed a -14.0% regression of aim7.jobs-per-min due to commit:
>
>
> commit: 45208c9105bd96015b98cdf31fbd6a3bcff234b6 ("[patch 097/212] memcg:=
 infrastructure to flush memcg stats")
> url: https://github.com/0day-ci/linux/commits/Andrew-Morton/ia64-fix-typo=
-in-a-comment/20210903-065028
>
>
> in testcase: aim7
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2=
.00GHz with 256G memory
> with following parameters:
>
>         disk: 1BRD_48G
>         fs: xfs
>         test: disk_rr
>         load: 3000
>         cpufreq_governor: performance
>         ucode: 0xd000280
>
> test-description: AIM7 is a traditional UNIX system level benchmark suite=
 which is used to test and measure the performance of multiuser system.
> test-url: https://sourceforge.net/projects/aimbench/files/aim-suite7/
>
> In addition to that, the commit also has significant impact on the follow=
ing tests:
>
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | reaim: reaim.jobs_per_min -10.0% regression         =
                                |
> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242=
 CPU @ 2.30GHz with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | nr_task=3D100%                                      =
                                  |
> |                  | runtime=3D300s                                      =
                                  |
> |                  | test=3Dcompute                                      =
                                  |
> |                  | ucode=3D0x5003006                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -29.8% =
regression                      |
> | test machine     | 104 threads 2 sockets Skylake with 192G memory      =
                                |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dprocess                                      =
                                  |
> |                  | nr_task=3D100%                                      =
                                  |
> |                  | test=3Dfallocate2                                   =
                                  |
> |                  | ucode=3D0x2006a0a                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | fio-basic: fio.read_iops -20.5% regression          =
                                |
> | test machine     | 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU =
@ 2.10GHz with 256G memory      |
> | test parameters  | bs=3D4k                                             =
                                  |
> |                  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | disk=3D2pmem                                        =
                                  |
> |                  | fs=3Dxfs                                            =
                                  |
> |                  | ioengine=3Dmmap                                     =
                                  |
> |                  | nr_task=3D50%                                       =
                                  |
> |                  | runtime=3D200s                                      =
                                  |
> |                  | rw=3Dread                                           =
                                  |
> |                  | test_size=3D200G                                    =
                                  |
> |                  | time_based=3Dtb                                     =
                                  |
> |                  | ucode=3D0x5003006                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -9.2% r=
egression                       |
> | test machine     | 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2=
 @ 2.70GHz with 112G memory     |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dprocess                                      =
                                  |
> |                  | nr_task=3D50%                                       =
                                  |
> |                  | test=3Dpage_fault3                                  =
                                  |
> |                  | ucode=3D0x42e                                       =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -2.3% re=
gression                        |
> | test machine     | 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CP=
U @ 2.50GHz with 128G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dthread                                       =
                                  |
> |                  | nr_task=3D100%                                      =
                                  |
> |                  | test=3Dtlb_flush1                                   =
                                  |
> |                  | ucode=3D0x700001e                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_thread_ops -8.9% re=
gression                        |
> | test machine     | 144 threads 4 sockets Intel(R) Xeon(R) Gold 5318H CP=
U @ 2.50GHz with 128G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dthread                                       =
                                  |
> |                  | nr_task=3D16                                        =
                                  |
> |                  | test=3Dtlb_flush1                                   =
                                  |
> |                  | ucode=3D0x700001e                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -6.4% r=
egression                       |
> | test machine     | 48 threads 2 sockets Intel(R) Xeon(R) CPU E5-2697 v2=
 @ 2.70GHz with 112G memory     |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | mode=3Dprocess                                      =
                                  |
> |                  | nr_task=3D50%                                       =
                                  |
> |                  | test=3Dpage_fault2                                  =
                                  |
> |                  | ucode=3D0x42e                                       =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | netperf: netperf.Throughput_Mbps 89.8% improvement  =
                                |
> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242=
 CPU @ 2.30GHz with 192G memory |
> | test parameters  | cluster=3Dcs-localhost                              =
                                  |
> |                  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | ip=3Dipv4                                           =
                                  |
> |                  | nr_threads=3D200%                                   =
                                  |
> |                  | runtime=3D900s                                      =
                                  |
> |                  | test=3DTCP_MAERTS                                   =
                                  |
> |                  | ucode=3D0x5003006                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
>
>
> If you fix the issue, kindly add following tag
> Reported-by: kernel test robot <oliver.sang@intel.com>
>
>
> Details are as below:
> -------------------------------------------------------------------------=
------------------------->
>
>
> To reproduce:
>
>         git clone https://github.com/intel/lkp-tests.git
>         cd lkp-tests
>         bin/lkp install                job.yaml  # job file is attached i=
n this email
>         bin/lkp split-job --compatible job.yaml  # generate the yaml file=
 for lkp run
>         bin/lkp run                    generated-yaml-file
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> compiler/cpufreq_governor/disk/fs/kconfig/load/rootfs/tbox_group/test/tes=
tcase/ucode:
>   gcc-9/performance/1BRD_48G/xfs/x86_64-rhel-8.3/3000/debian-10.4-x86_64-=
20200603.cgz/lkp-icl-2sp2/disk_rr/aim7/0xd000280
>
> commit:
>   3c28c7680e ("memcg: switch lruvec stats to rstat")
>   45208c9105 ("memcg: infrastructure to flush memcg stats")

I am looking into this. I was hoping we have resolution for [1] as
these patches touch similar data structures.

[1] https://lore.kernel.org/all/20210811031734.GA5193(a)xsang-OptiPlex-9020=
/T/#u
--===============8090669926003504492==--

