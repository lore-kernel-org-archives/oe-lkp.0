Content-Type: multipart/mixed; boundary="===============0929248673069568029=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@techsingularity.net>
To: lkp@lists.01.org
Subject: Re: [sched/numa] bb2dee337b: unixbench.score -11.2% regression
Date: Wed, 18 May 2022 16:22:58 +0100
Message-ID: <20220518152258.GR3441@techsingularity.net>
In-Reply-To: <20220518092414.GA15472@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============0929248673069568029==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 18, 2022 at 05:24:14PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -11.2% regression of unixbench.score due to commit:
> =

> =

> commit: bb2dee337bd7d314eb7c7627e1afd754f86566bc ("[PATCH 3/4] sched/numa=
: Apply imbalance limitations consistently")
> url: https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Mitigate-i=
nconsistent-NUMA-imbalance-behaviour/20220511-223233
> base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git d70522fc54=
1224b8351ac26f4765f2c6268f8d72
> patch link: https://lore.kernel.org/lkml/20220511143038.4620-4-mgorman(a)=
techsingularity.net
> =

> in testcase: unixbench
> on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @ 2=
.00GHz with 256G memory
> with following parameters:
> =

> 	runtime: 300s
> 	nr_task: 1
> 	test: shell8
> 	cpufreq_governor: performance
> 	ucode: 0xd000331
> =

> test-description: UnixBench is the original BYTE UNIX benchmark suite aim=
s to test performance of Unix-like system.
> test-url: https://github.com/kdlucas/byte-unixbench

I think what is happening for unixbench is that it prefers to run all
instances on a local node if possible. shell8 is creating 8 scripts,
each of which spawn more processes. The total number of tasks may exceed
the allowed imbalance at fork time of 16 tasks. Some spill over to a
remote node and as they are using files, some accesses are remote and it
suffers. It's not memory bandwidth bound but is sensitive to locality.
The stats somewhat support this idea

>      83590 =C2=B1 13%     -73.7%      21988 =C2=B1 32%  numa-meminfo.node=
0.AnonHugePages
>     225657 =C2=B1 18%     -58.0%      94847 =C2=B1 18%  numa-meminfo.node=
0.AnonPages
>     231652 =C2=B1 17%     -55.3%     103657 =C2=B1 16%  numa-meminfo.node=
0.AnonPages.max
>     234525 =C2=B1 17%     -55.5%     104341 =C2=B1 18%  numa-meminfo.node=
0.Inactive
>     234397 =C2=B1 17%     -55.5%     104267 =C2=B1 18%  numa-meminfo.node=
0.Inactive(anon)
>      11724 =C2=B1  7%     +17.5%      13781 =C2=B1  5%  numa-meminfo.node=
0.KernelStack
>       4472 =C2=B1 34%    +117.1%       9708 =C2=B1 31%  numa-meminfo.node=
0.PageTables
>      15239 =C2=B1 75%    +401.2%      76387 =C2=B1 10%  numa-meminfo.node=
1.AnonHugePages
>      67256 =C2=B1 63%    +206.3%     205994 =C2=B1  6%  numa-meminfo.node=
1.AnonPages
>      73568 =C2=B1 58%    +193.1%     215644 =C2=B1  6%  numa-meminfo.node=
1.AnonPages.max
>      75737 =C2=B1 53%    +183.9%     215053 =C2=B1  6%  numa-meminfo.node=
1.Inactive
>      75709 =C2=B1 53%    +183.9%     214971 =C2=B1  6%  numa-meminfo.node=
1.Inactive(anon)
>       3559 =C2=B1 42%    +187.1%      10216 =C2=B1  8%  numa-meminfo.node=
1.PageTables

There is less memory used on one node and more on the other so it's
getting split.

> In addition to that, the commit also has significant impact on the follow=
ing tests:
> =

> +------------------+-----------------------------------------------------=
--------------------------------+
> | testcase: change | fsmark: fsmark.files_per_sec -21.5% regression      =
                                |
> | test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242=
 CPU @ 2.30GHz with 192G memory |
> | test parameters  | cpufreq_governor=3Dperformance                      =
                                  |
> |                  | disk=3D1SSD                                         =
                                  |
> |                  | filesize=3D8K                                       =
                                  |
> |                  | fs=3Df2fs                                           =
                                  |
> |                  | iterations=3D8                                      =
                                  |
> |                  | nr_directories=3D16d                                =
                                  |
> |                  | nr_files_per_directory=3D256fpd                     =
                                  |
> |                  | nr_threads=3D4                                      =
                                  |
> |                  | sync_method=3DfsyncBeforeClose                      =
                                  |
> |                  | test_size=3D72G                                     =
                                  |
> |                  | ucode=3D0x500320a                                   =
                                  |
> +------------------+-----------------------------------------------------=
--------------------------------+
> =


It's less clearcut for this from the stats but it's likely getting split
too and had preferred locality. It's curious that f2fs is affected but
maybe other filesystems were too.

In both cases, the workloads are not memory bandwidth limited so prefer to
stack on one node and previously, because they were cache hot, the load
balancer would avoid splitting them apart if there were other candidates
available.

This is a tradeoff between loads that want to stick on one node for
locality because they are not bandwidth limited and workloads that are
memory bandwidth limited and want to spread wide. We can't tell what
type of workload it is at fork time.

Given there is no crystal ball and it's a tradeoff, I think it's better
to be consistent and use similar logic at both fork time and runtime even
if it doesn't have universal benefit.

-- =

Mel Gorman
SUSE Labs
--===============0929248673069568029==--

