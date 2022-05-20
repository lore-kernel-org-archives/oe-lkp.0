Content-Type: multipart/mixed; boundary="===============0783319315285462912=="
MIME-Version: 1.0
From: Ying Huang <ying.huang@intel.com>
To: lkp@lists.01.org
Subject: Re: [sched/numa] bb2dee337b: unixbench.score -11.2% regression
Date: Fri, 20 May 2022 14:44:26 +0800
Message-ID: <4977e67c975723c98a441e08cc9f001b69f5668e.camel@intel.com>
In-Reply-To: <5941ce856343c314f829852d3a831cdd19f06573.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0783319315285462912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, 2022-05-19 at 15:54 +0800, ying.huang(a)intel.com wrote:
> Hi, Mel,
> =

> On Wed, 2022-05-18 at 16:22 +0100, Mel Gorman wrote:
> > On Wed, May 18, 2022 at 05:24:14PM +0800, kernel test robot wrote:
> > > =

> > > =

> > > Greeting,
> > > =

> > > FYI, we noticed a -11.2% regression of unixbench.score due to commit:
> > > =

> > > =

> > > commit: bb2dee337bd7d314eb7c7627e1afd754f86566bc ("[PATCH 3/4] sched/=
numa: Apply imbalance limitations consistently")
> > > url: https://github.com/intel-lab-lkp/linux/commits/Mel-Gorman/Mitiga=
te-inconsistent-NUMA-imbalance-behaviour/20220511-223233
> > > base: https://git.kernel.org/cgit/linux/kernel/git/tip/tip.git d70522=
fc541224b8351ac26f4765f2c6268f8d72
> > > patch link: https://lore.kernel.org/lkml/20220511143038.4620-4-mgorma=
n(a)techsingularity.net
> > > =

> > > in testcase: unixbench
> > > on test machine: 128 threads 2 sockets Intel(R) Xeon(R) Gold 6338 CPU=
 @ 2.00GHz with 256G memory
> > > with following parameters:
> > > =

> > > 	runtime: 300s
> > > 	nr_task: 1
> > > 	test: shell8
> > > 	cpufreq_governor: performance
> > > 	ucode: 0xd000331
> > > =

> > > test-description: UnixBench is the original BYTE UNIX benchmark suite=
 aims to test performance of Unix-like system.
> > > test-url: https://github.com/kdlucas/byte-unixbench
> > =

> > I think what is happening for unixbench is that it prefers to run all
> > instances on a local node if possible. shell8 is creating 8 scripts,
> > each of which spawn more processes. The total number of tasks may exceed
> > the allowed imbalance at fork time of 16 tasks. Some spill over to a
> > remote node and as they are using files, some accesses are remote and it
> > suffers. It's not memory bandwidth bound but is sensitive to locality.
> > The stats somewhat support this idea
> > =

> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A083590 =C2=B1 13%     -73.7%      21988 =
=C2=B1 32%  numa-meminfo.node0.AnonHugePages
> > > =C2=A0=C2=A0=C2=A0=C2=A0225657 =C2=B1 18%     -58.0%      94847 =C2=
=B1 18%  numa-meminfo.node0.AnonPages
> > > =C2=A0=C2=A0=C2=A0=C2=A0231652 =C2=B1 17%     -55.3%     103657 =C2=
=B1 16%  numa-meminfo.node0.AnonPages.max
> > > =C2=A0=C2=A0=C2=A0=C2=A0234525 =C2=B1 17%     -55.5%     104341 =C2=
=B1 18%  numa-meminfo.node0.Inactive
> > > =C2=A0=C2=A0=C2=A0=C2=A0234397 =C2=B1 17%     -55.5%     104267 =C2=
=B1 18%  numa-meminfo.node0.Inactive(anon)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A011724 =C2=B1  7%     +17.5%      13781 =
=C2=B1  5%  numa-meminfo.node0.KernelStack
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A04472 =C2=B1 34%    +117.1%       =
9708 =C2=B1 31%  numa-meminfo.node0.PageTables
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A015239 =C2=B1 75%    +401.2%      76387 =
=C2=B1 10%  numa-meminfo.node1.AnonHugePages
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A067256 =C2=B1 63%    +206.3%     205994 =
=C2=B1  6%  numa-meminfo.node1.AnonPages
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A073568 =C2=B1 58%    +193.1%     215644 =
=C2=B1  6%  numa-meminfo.node1.AnonPages.max
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A075737 =C2=B1 53%    +183.9%     215053 =
=C2=B1  6%  numa-meminfo.node1.Inactive
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A075709 =C2=B1 53%    +183.9%     214971 =
=C2=B1  6%  numa-meminfo.node1.Inactive(anon)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A03559 =C2=B1 42%    +187.1%      1=
0216 =C2=B1  8%  numa-meminfo.node1.PageTables
> > =

> > There is less memory used on one node and more on the other so it's
> > getting split.
> =

> This makes sense.  I will also check CPU utilization per node to verify
> this directly.

I run this workload 3 times for the commit and its parent with mpstat
node statistics.

For the parent commit,

  "mpstat.node.0.usr%": [
    0.1396875,
    3.0806153846153848,
    0.05303030303030303
  ],
  "mpstat.node.0.sys%": [
    0.10515625,
    5.597692307692308,
    0.1340909090909091
  ],

  "mpstat.node.1.usr%": [
    3.1015625,
    0.1306153846153846,
    3.0275757575757574
  ],
  "mpstat.node.1.sys%": [
    5.66703125,
    0.11676923076923076,
    5.498181818181818
  ],

The difference between two nodes are quite large.

For the commit,

  "mpstat.node.0.usr%": [
    1.42109375,
    1.4725,
    1.5140625
  ],
  "mpstat.node.0.sys%": [
    3.00125,
    3.16390625,
    3.1284375
  ],

  "mpstat.node.1.usr%": [
    1.4909375,
    1.41609375,
    1.3740625
  ],
  "mpstat.node.1.sys%": [
    3.1671875,
    3.00109375,
    3.044375
  ],

The difference between 2 nodes reduces greatly.  So this proves your
theory directly.

Best Regards,
Huang, Ying


[snip]

--===============0783319315285462912==--

