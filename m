Content-Type: multipart/mixed; boundary="===============5922073244532202546=="
MIME-Version: 1.0
From: Johannes Weiner <hannes@cmpxchg.org>
To: lkp@lists.01.org
Subject: Re: [mm] 795ae7a0de: pixz.throughput -9.1% regression
Date: Thu, 02 Jun 2016 12:07:06 -0400
Message-ID: <20160602160706.GA24004@cmpxchg.org>
In-Reply-To: <20160602064507.GE30850@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5922073244532202546==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jun 02, 2016 at 02:45:07PM +0800, kernel test robot wrote:
> FYI, we noticed pixz.throughput -9.1% regression due to commit:
> =

> commit 795ae7a0de6b834a0cc202aa55c190ef81496665 ("mm: scale kswapd waterm=
arks in proportion to memory")
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> =

> in testcase: pixz
> on test machine: ivb43: 48 threads Ivytown Ivy Bridge-EP with 64G memory =
with following parameters: cpufreq_governor=3Dperformance/nr_threads=3D100%

Xiaolong, thanks for the report.

It looks like the regression stems from a change in NUMA placement:

> 3ed3a4f0ddffece9 795ae7a0de6b834a0cc202aa55
> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>   78505362 =C2=B1  0%      -9.1%   71324131 =C2=B1  0%  pixz.throughput
>       4530 =C2=B1  0%      +1.0%       4575 =C2=B1  0%  pixz.time.percent=
_of_cpu_this_job_got
>      14911 =C2=B1  0%      +2.3%      15251 =C2=B1  0%  pixz.time.user_ti=
me
>    6586930 =C2=B1  0%      -7.5%    6093751 =C2=B1  1%  pixz.time.volunta=
ry_context_switches
>      49869 =C2=B1  1%      -9.0%      45401 =C2=B1  0%  vmstat.system.cs
>      26406 =C2=B1  4%      -9.4%      23922 =C2=B1  5%  numa-meminfo.node=
0.SReclaimable
>       4803 =C2=B1 85%     -87.0%     625.25 =C2=B1 16%  numa-meminfo.node=
1.Inactive(anon)
>     946.75 =C2=B1  3%    +775.4%       8288 =C2=B1  1%  proc-vmstat.nr_al=
loc_batch
>    2403080 =C2=B1  2%     -58.4%     999765 =C2=B1  0%  proc-vmstat.pgall=
oc_dma32

a bit clearer in the will-it-scale report:

> 3ed3a4f0ddffece9 795ae7a0de6b834a0cc202aa55 =

> ---------------- -------------------------- =

>          %stddev     %change         %stddev
>              \          |                \  =

>     442409 =C2=B1  0%      -8.5%     404670 =C2=B1  0%  will-it-scale.per=
_process_ops
>     397397 =C2=B1  0%      -6.2%     372741 =C2=B1  0%  will-it-scale.per=
_thread_ops
>       0.11 =C2=B1  1%     -15.1%       0.10 =C2=B1  0%  will-it-scale.sca=
lability
>       9933 =C2=B1 10%     +17.8%      11696 =C2=B1  4%  will-it-scale.tim=
e.involuntary_context_switches
>    5158470 =C2=B1  3%      +5.4%    5438873 =C2=B1  0%  will-it-scale.tim=
e.maximum_resident_set_size
>   10701739 =C2=B1  0%     -11.6%    9456315 =C2=B1  0%  will-it-scale.tim=
e.minor_page_faults
>     825.00 =C2=B1  0%      +7.8%     889.75 =C2=B1  0%  will-it-scale.tim=
e.percent_of_cpu_this_job_got
>       2484 =C2=B1  0%      +7.8%       2678 =C2=B1  0%  will-it-scale.tim=
e.system_time
>      81.98 =C2=B1  0%      +8.7%      89.08 =C2=B1  0%  will-it-scale.tim=
e.user_time
>     848972 =C2=B1  1%     -13.3%     735967 =C2=B1  0%  will-it-scale.tim=
e.voluntary_context_switches
>   19395253 =C2=B1  0%     -20.0%   15511908 =C2=B1  0%  numa-numastat.nod=
e0.local_node
>   19400671 =C2=B1  0%     -20.0%   15518877 =C2=B1  0%  numa-numastat.nod=
e0.numa_hit

The way this test is set up (in-memory compression on 48 nodes) I'm
surprised we spill over, though, even with the higher watermarks.

Xiaolong, could you provide the full /proc/zoneinfo of that machine
right before the test is running? I wonder if it's mostly filled with
cache, and the increase in watermarks causes a higher portion of the
anon allocs and frees to spill to the remote node, but never enough to
enter the allocator slowpath and waking kswapd to fix it.

Another suspect is the fair zone allocator, whose allocation batches
increased as well. It shouldn't affect NUMA placement, but I wonder if
there is a bug in there that causes false spilling to foreign nodes
that was only bounded by the allocation batch of the foreign zone.
Mel, does such a symptom sound familiar in any way?

I'll continue to investigate.

--===============5922073244532202546==--

