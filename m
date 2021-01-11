Content-Type: multipart/mixed; boundary="===============1556162610729106925=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [percpu_ref] 2b0d3d3e4f: reaim.jobs_per_min -18.4% regression
Date: Mon, 11 Jan 2021 17:58:54 +0800
Message-ID: <20210111095854.GA4155851@T590>
In-Reply-To: <20210110143247.GA6259@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1556162610729106925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 10, 2021 at 10:32:47PM +0800, kernel test robot wrote:
> =

> Greeting,
> =

> FYI, we noticed a -18.4% regression of reaim.jobs_per_min due to commit:
> =

> =

> commit: 2b0d3d3e4fcfb19d10f9a82910b8f0f05c56ee3e ("percpu_ref: reduce mem=
ory footprint of percpu_ref in fast path")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master
> =

> =

> in testcase: reaim
> on test machine: 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.30GHz=
 with 192G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 100%
> 	test: short
> 	cpufreq_governor: performance
> 	ucode: 0x5002f01
> =

> test-description: REAIM is an updated and improved version of AIM 7 bench=
mark.
> test-url: https://sourceforge.net/projects/re-aim-7/
> =

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | vm-scalability: vm-scalability.throughput -2.8% regr=
ession                |
> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GHz with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | runtime=3D300s                                      =
                        |
> |                  | test=3Dlru-file-mmap-read-rand                      =
                        |
> |                  | ucode=3D0x5003003                                   =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops 14.5% i=
mprovement            |
> | test machine     | 144 threads Intel(R) Xeon(R) CPU E7-8890 v3 @ 2.50GH=
z with 512G memory    |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dprocess                                      =
                        |
> |                  | nr_task=3D50%                                       =
                        |
> |                  | test=3Dpage_fault2                                  =
                        |
> |                  | ucode=3D0x16                                        =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | will-it-scale: will-it-scale.per_process_ops -13.0% =
regression            |
> | test machine     | 104 threads Skylake with 192G memory                =
                      |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | mode=3Dprocess                                      =
                        |
> |                  | nr_task=3D50%                                       =
                        |
> |                  | test=3Dmalloc1                                      =
                        |
> |                  | ucode=3D0x2006906                                   =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | vm-scalability: vm-scalability.throughput -2.3% regr=
ession                |
> | test machine     | 96 threads Intel(R) Xeon(R) CPU @ 2.30GHz with 128G =
memory                |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | runtime=3D300s                                      =
                        |
> |                  | test=3Dlru-file-mmap-read-rand                      =
                        |
> |                  | ucode=3D0x5002f01                                   =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | fio-basic: fio.read_iops -4.8% regression           =
                      |
> | test machine     | 192 threads Intel(R) Xeon(R) Platinum 9242 CPU @ 2.3=
0GHz with 192G memory |
> | test parameters  | bs=3D4k                                             =
                        |
> |                  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | disk=3D2pmem                                        =
                        |
> |                  | fs=3Dxfs                                            =
                        |
> |                  | ioengine=3Dlibaio                                   =
                        |
> |                  | nr_task=3D50%                                       =
                        |
> |                  | runtime=3D200s                                      =
                        |
> |                  | rw=3Drandread                                       =
                        |
> |                  | test_size=3D200G                                    =
                        |
> |                  | time_based=3Dtb                                     =
                        |
> |                  | ucode=3D0x5002f01                                   =
                        |
> +------------------+-----------------------------------------------------=
----------------------+
> | testcase: change | stress-ng: stress-ng.stackmmap.ops_per_sec -45.4% re=
gression              |
> | test machine     | 96 threads Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz =
with 256G memory      |
> | test parameters  | class=3Dmemory                                      =
                        |
> |                  | cpufreq_governor=3Dperformance                      =
                        |
> |                  | disk=3D1HDD                                         =
                        |
> |                  | nr_threads=3D100%                                   =
                        |
> |                  | testtime=3D10s                                      =
                        |
> |                  | ucode=3D0x5002f01                                   =
                        |
> +------------------+-----------------------------------------------------=
----------------------+

Just run a quick test of the last two on 2b0d3d3e4fcf ("percpu_ref: reduce =
memory footprint of
percpu_ref in fast path) and cf785af19319 ("block: warn if !__GFP_DIRECT_RE=
CLAIM in bio_crypt_set_ctx()").

Not see difference in the two kernel(fio on null_blk with 224 hw queues,
and 'stress-ng --stackmmap-ops') on one 224 cores, dual sockets system.

BTW this patch itself doesn't touch fast path code, so it is supposed to
not affect performance.

Can you double check if the test itself is good?

Note: cf785af19319 is 2b0d3d3e4fcf^



Thanks,
Ming

--===============1556162610729106925==--

