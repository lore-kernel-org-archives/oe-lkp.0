Content-Type: multipart/mixed; boundary="===============0227400185513662933=="
MIME-Version: 1.0
From: ying.huang@intel.com
To: lkp@lists.01.org
Subject: Re: [sched/numa] bb2dee337b: unixbench.score -11.2% regression
Date: Thu, 19 May 2022 15:54:39 +0800
Message-ID: <5941ce856343c314f829852d3a831cdd19f06573.camel@intel.com>
In-Reply-To: <20220518152258.GR3441@techsingularity.net>
List-Id: <oe-lkp.lists.linux.dev>

--===============0227400185513662933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi, Mel,

On Wed, 2022-05-18 at 16:22 +0100, Mel Gorman wrote:
> On Wed, May 18, 2022 at 05:24:14PM +0800, kernel test robot wrote:
> > =

> > =

> > Greeting,
> > =

> > FYI, we noticed a -11.2% regression of unixbench.score due to commit:
> > =

> > =

> > commit: bb2dee337bd7d314eb7c7627e1afd754f86566bc ("[PATCH 3/4] sched/nu=
ma: Apply imbalance limitations consistently")
> > url: https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Mitigate=
-inconsistent-NUMA-imbalance-behaviour/20220511-223233
> > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git d70522fc=
541224b8351ac26f4765f2c6268f8d72
> > patch link: https://lore.kernel.org/lkml/20220511143038.4620-4-mgorman(=
a)techsingularity.net
> > =

> > in testcase: unixbench
> > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU @=
 2.00GHz with 256G memory
> > with following parameters:
> > =

> > 	runtime: 300s
> > 	nr_task: 1
> > 	test: shell8
> > 	cpufreq_governor: performance
> > 	ucode: 0xd000331
> > =

> > test-description: UnixBench is the original BYTE UNIX benchmark suite a=
ims to test performance of Unix-like system.
> > test-url: https://github.com/kdlucas/byte-unixbench
> =

> I think what is happening for unixbench is that it prefers to run all
> instances on a local node if possible. shell8 is creating 8 scripts,
> each of which spawn more processes. The total number of tasks may exceed
> the allowed imbalance at fork time of 16 tasks. Some spill over to a
> remote node and as they are using files, some accesses are remote and it
> suffers. It's not memory bandwidth bound but is sensitive to locality.
> The stats somewhat support this idea
> =

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A083590 =C2=B1 13%     -73.7%      21988 =
=C2=B1 32%  numa-meminfo.node0.AnonHugePages
> > =C2=A0=C2=A0=C2=A0=C2=A0225657 =C2=B1 18%     -58.0%      94847 =C2=B1 =
18%  numa-meminfo.node0.AnonPages
> > =C2=A0=C2=A0=C2=A0=C2=A0231652 =C2=B1 17%     -55.3%     103657 =C2=B1 =
16%  numa-meminfo.node0.AnonPages.max
> > =C2=A0=C2=A0=C2=A0=C2=A0234525 =C2=B1 17%     -55.5%     104341 =C2=B1 =
18%  numa-meminfo.node0.Inactive
> > =C2=A0=C2=A0=C2=A0=C2=A0234397 =C2=B1 17%     -55.5%     104267 =C2=B1 =
18%  numa-meminfo.node0.Inactive(anon)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A011724 =C2=B1  7%     +17.5%      13781 =
=C2=B1  5%  numa-meminfo.node0.KernelStack
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04472 =C2=B1 34%    +117.1%       97=
08 =C2=B1 31%  numa-meminfo.node0.PageTables
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A015239 =C2=B1 75%    +401.2%      76387 =
=C2=B1 10%  numa-meminfo.node1.AnonHugePages
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A067256 =C2=B1 63%    +206.3%     205994 =
=C2=B1  6%  numa-meminfo.node1.AnonPages
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A073568 =C2=B1 58%    +193.1%     215644 =
=C2=B1  6%  numa-meminfo.node1.AnonPages.max
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A075737 =C2=B1 53%    +183.9%     215053 =
=C2=B1  6%  numa-meminfo.node1.Inactive
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A075709 =C2=B1 53%    +183.9%     214971 =
=C2=B1  6%  numa-meminfo.node1.Inactive(anon)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03559 =C2=B1 42%    +187.1%      102=
16 =C2=B1  8%  numa-meminfo.node1.PageTables
> =

> There is less memory used on one node and more on the other so it's
> getting split.

This makes sense.  I will also check CPU utilization per node to verify
this directly.

> =

> > In addition to that, the commit also has significant impact on the foll=
owing tests:
> > =

> > +------------------+---------------------------------------------------=
----------------------------------+
> > > testcase: change | fsmark: fsmark.files_per_sec -21.5% regression    =
                                  |
> > > test machine     | 192 threads 4 sockets Intel(R) Xeon(R) Platinum 92=
42 CPU @ 2.30GHz with 192G memory |
> > > test parameters  | cpufreq_governor=3Dperformance                    =
                                    |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| disk=3D1SSD                             =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| filesize=3D8K                           =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| fs=3Df2fs                               =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| iterations=3D8                          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| nr_directories=3D16d                    =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| nr_files_per_directory=3D256fpd         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| nr_threads=3D4                          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| sync_method=3DfsyncBeforeClose          =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| test_size=3D72G                         =
                                              |
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0| ucode=3D0x500320a                       =
                                              |
> > +------------------+---------------------------------------------------=
----------------------------------+
> > =

> =

> It's less clearcut for this from the stats but it's likely getting split
> too and had preferred locality. It's curious that f2fs is affected but
> maybe other filesystems were too.
> =

> In both cases, the workloads are not memory bandwidth limited so prefer to
> stack on one node and previously, because they were cache hot, the load
> balancer would avoid splitting them apart if there were other candidates
> available.
> =

> This is a tradeoff between loads that want to stick on one node for
> locality because they are not bandwidth limited and workloads that are
> memory bandwidth limited and want to spread wide. We can't tell what
> type of workload it is at fork time.
> =

> Given there is no crystal ball and it's a tradeoff, I think it's better
> to be consistent and use similar logic at both fork time and runtime even
> if it doesn't have universal benefit.
> =


Thanks for detailed explanation.  So some other workloads may benefit
from this patch.  Can you give me some candidate so I can test them too?

Best Regards,
Huang, Ying


--===============0227400185513662933==--

