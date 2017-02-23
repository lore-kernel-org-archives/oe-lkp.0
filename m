Content-Type: multipart/mixed; boundary="===============2935942944791790626=="
MIME-Version: 1.0
From: Mel Gorman <mgorman@suse.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Thu, 23 Feb 2017 15:19:08 +0000
Message-ID: <20170223151908.z7disw2es7jlnf7b@suse.de>
In-Reply-To: <20170223073544.uiy6rvw3d44irixf@dhcp22.suse.cz>
List-Id: <oe-lkp.lists.linux.dev>

--===============2935942944791790626==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2017 at 08:35:45AM +0100, Michal Hocko wrote:
> >      57.60 =C2=B1  0%      -11.1%      51.20 =C2=B1  0%  fsmark.files_p=
er_sec
> >     607.84 =C2=B1  0%       +9.0%     662.24 =C2=B1  1%  fsmark.time.el=
apsed_time
> >     607.84 =C2=B1  0%       +9.0%     662.24 =C2=B1  1%  fsmark.time.el=
apsed_time.max
> >      14317 =C2=B1  6%      -12.2%      12568 =C2=B1  7%  fsmark.time.in=
voluntary_context_switches
> >       1864 =C2=B1  0%       +0.5%       1873 =C2=B1  0%  fsmark.time.ma=
ximum_resident_set_size
> >      12425 =C2=B1  0%      +23.3%      15320 =C2=B1  3%  fsmark.time.mi=
nor_page_faults
> >      33.00 =C2=B1  3%      -33.9%      21.80 =C2=B1  1%  fsmark.time.pe=
rcent_of_cpu_this_job_got
> >     203.49 =C2=B1  3%      -28.1%     146.31 =C2=B1  1%  fsmark.time.sy=
stem_time
> >     605701 =C2=B1  0%       +3.6%     627486 =C2=B1  0%  fsmark.time.vo=
luntary_context_switches
> >     307106 =C2=B1  2%      +20.2%     368992 =C2=B1  9%  interrupts.CAL=
:Function_call_interrupts
> >     183040 =C2=B1  0%      +23.2%     225559 =C2=B1  3%  softirqs.BLOCK
> >      12203 =C2=B1 57%     +236.4%      41056 =C2=B1103%  softirqs.NET_RX
> >     186118 =C2=B1  0%      +21.9%     226922 =C2=B1  2%  softirqs.TASKL=
ET
> >      14317 =C2=B1  6%      -12.2%      12568 =C2=B1  7%  time.involunta=
ry_context_switches
> >      12425 =C2=B1  0%      +23.3%      15320 =C2=B1  3%  time.minor_pag=
e_faults
> >      33.00 =C2=B1  3%      -33.9%      21.80 =C2=B1  1%  time.percent_o=
f_cpu_this_job_got
> >     203.49 =C2=B1  3%      -28.1%     146.31 =C2=B1  1%  time.system_ti=
me
> >       3.47 =C2=B1  3%      -13.0%       3.02 =C2=B1  1%  turbostat.%Busy
> >      99.60 =C2=B1  1%       -9.6%      90.00 =C2=B1  1%  turbostat.Avg_=
MHz
> >      78.69 =C2=B1  1%       +1.7%      80.01 =C2=B1  0%  turbostat.CorW=
att
> >       3.56 =C2=B1 61%      -91.7%       0.30 =C2=B1 76%  turbostat.Pkg%=
pc2
> >     207790 =C2=B1  0%       -8.2%     190654 =C2=B1  1%  vmstat.io.bo
> >   30667691 =C2=B1  0%      +65.9%   50890669 =C2=B1  1%  vmstat.memory.=
cache
> >   34549892 =C2=B1  0%      -58.4%   14378939 =C2=B1  4%  vmstat.memory.=
free
> >       6768 =C2=B1  0%       -1.3%       6681 =C2=B1  1%  vmstat.system.=
cs
> >  1.089e+10 =C2=B1  2%      +13.4%  1.236e+10 =C2=B1  3%  cpuidle.C1E-IV=
T.time
> >   11475304 =C2=B1  2%      +13.4%   13007849 =C2=B1  3%  cpuidle.C1E-IV=
T.usage
> >    2.7e+09 =C2=B1  6%      +13.2%  3.057e+09 =C2=B1  3%  cpuidle.C3-IVT=
.time
> >    2954294 =C2=B1  6%      +14.3%    3375966 =C2=B1  3%  cpuidle.C3-IVT=
.usage
> >   96963295 =C2=B1 14%      +17.5%  1.139e+08 =C2=B1 12%  cpuidle.POLL.t=
ime
> >       8761 =C2=B1  7%      +17.6%      10299 =C2=B1  9%  cpuidle.POLL.u=
sage
> >   30454483 =C2=B1  0%      +66.4%   50666102 =C2=B1  1%  meminfo.Cached
> > =

> > Do you see what's happening?
> =

> not really. All I could see in the previous data was that the memory
> locality was different (and better) with my patch, which I cannot
> explain either because get_scan_count is always per-node thing. Moreover
> the change shouldn't make any difference for normal GFP_KERNEL requests
> on 64b systems because the reclaim index covers all zones so there is
> nothing to skip over.
> =

> > Or is there anything we can do to improve fsmark benchmark setup to
> > make it more reasonable?
> =

> Unfortunatelly I am not an expert on this benchmark. Maybe Mel knows
> better.

There is not much to be an expert on with that benchmark. It creates a
bunch of files of the requested size for a number of iterations. In async
configurations, it can be heavily skewed by the first few iterations until
dirty limits are hit. Once that point is reached, the files/sec drops
rapidly to some value below the writing speed of the underlying device.
Hence, looking at the average performance of it is risky and very sensitive
to exact timing unless this is properly accounted for.

In async configurations, stalls are dominated by balance_dirty_pages
and some filesystem details such as whether it needs to wait for space
in a transaction log. That also limits the overall performance of the
workload. Once the stable phase is reached, there still will be quite some
variability due to the timing of the writeback threads that cause a bit
of jitter as well as the usual concerns with multiple threads writing to
different parts of the disk.

When NUMA is taken into account, it is important to consider the size of
the NUMA nodes as assymetric sizes will affect when remote memory is used
and to a lesser extent when balance_dirty_pages is triggered.

The benchmark is what it is. You can force it to generate stable figures
but it won't have the same behaviour so it all depends on how you define
"reasonable".

At the very minimum, take into account that an average of multiple iteratio=
ns
will be skewed early in the workloads lifetime by the fact it hasn't hit
dirty limits yet.

-- =

Mel Gorman
SUSE Labs

--===============2935942944791790626==--

