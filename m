Content-Type: multipart/mixed; boundary="===============2221489879490903771=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@kernel.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [mm, vmscan] 5e56dfbd83: fsmark.files_per_sec -11.1% regression
Date: Thu, 23 Feb 2017 08:35:45 +0100
Message-ID: <20170223073544.uiy6rvw3d44irixf@dhcp22.suse.cz>
In-Reply-To: <20170223012734.GB31776@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============2221489879490903771==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu 23-02-17 09:27:34, Ye Xiaolong wrote:
> Hi, Michal
> =

> On 02/07, Michal Hocko wrote:
> [snip]
> >Could you retest with a single NUMA node? I am not familiar with the
> >benchmark enough to judge it was set up properly for a NUMA machine.
> =

> I've retested the commit with a single NUMA node via "numactl -m 0 fs_mar=
k xxx",
> and it did help recover the performance back.

Thanks for restesting! get_scan_count which was =

> =

> Here is the comparison:
> =

> commit/compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/md/n=
r_threads/rootfs/sync_method/tbox_group/test_size/testcase:
>   5e56dfbd837421b7fa3c6c06018c6701e2704917/gcc-6/performance/3HDD/4M/btrf=
s/1/x86_64-rhel-7.2/RAID5/64/debian-x86_64-2016-08-31.cgz/NoSync/ivb44/130G=
/fsmark
>    =

> (with a single NUMA node)	    (2 NUMA nodes)
> -------------------------------------------------------------------- =

>        fail:runs   %reproduction    fail:runs
>            |              |             |    =

>          %stddev      %change         %stddev
>              \           |                \  =

>      57.60 =C2=B1  0%      -11.1%      51.20 =C2=B1  0%  fsmark.files_per=
_sec
>     607.84 =C2=B1  0%       +9.0%     662.24 =C2=B1  1%  fsmark.time.elap=
sed_time
>     607.84 =C2=B1  0%       +9.0%     662.24 =C2=B1  1%  fsmark.time.elap=
sed_time.max
>      14317 =C2=B1  6%      -12.2%      12568 =C2=B1  7%  fsmark.time.invo=
luntary_context_switches
>       1864 =C2=B1  0%       +0.5%       1873 =C2=B1  0%  fsmark.time.maxi=
mum_resident_set_size
>      12425 =C2=B1  0%      +23.3%      15320 =C2=B1  3%  fsmark.time.mino=
r_page_faults
>      33.00 =C2=B1  3%      -33.9%      21.80 =C2=B1  1%  fsmark.time.perc=
ent_of_cpu_this_job_got
>     203.49 =C2=B1  3%      -28.1%     146.31 =C2=B1  1%  fsmark.time.syst=
em_time
>     605701 =C2=B1  0%       +3.6%     627486 =C2=B1  0%  fsmark.time.volu=
ntary_context_switches
>     307106 =C2=B1  2%      +20.2%     368992 =C2=B1  9%  interrupts.CAL:F=
unction_call_interrupts
>     183040 =C2=B1  0%      +23.2%     225559 =C2=B1  3%  softirqs.BLOCK
>      12203 =C2=B1 57%     +236.4%      41056 =C2=B1103%  softirqs.NET_RX
>     186118 =C2=B1  0%      +21.9%     226922 =C2=B1  2%  softirqs.TASKLET
>      14317 =C2=B1  6%      -12.2%      12568 =C2=B1  7%  time.involuntary=
_context_switches
>      12425 =C2=B1  0%      +23.3%      15320 =C2=B1  3%  time.minor_page_=
faults
>      33.00 =C2=B1  3%      -33.9%      21.80 =C2=B1  1%  time.percent_of_=
cpu_this_job_got
>     203.49 =C2=B1  3%      -28.1%     146.31 =C2=B1  1%  time.system_time
>       3.47 =C2=B1  3%      -13.0%       3.02 =C2=B1  1%  turbostat.%Busy
>      99.60 =C2=B1  1%       -9.6%      90.00 =C2=B1  1%  turbostat.Avg_MHz
>      78.69 =C2=B1  1%       +1.7%      80.01 =C2=B1  0%  turbostat.CorWatt
>       3.56 =C2=B1 61%      -91.7%       0.30 =C2=B1 76%  turbostat.Pkg%pc2
>     207790 =C2=B1  0%       -8.2%     190654 =C2=B1  1%  vmstat.io.bo
>   30667691 =C2=B1  0%      +65.9%   50890669 =C2=B1  1%  vmstat.memory.ca=
che
>   34549892 =C2=B1  0%      -58.4%   14378939 =C2=B1  4%  vmstat.memory.fr=
ee
>       6768 =C2=B1  0%       -1.3%       6681 =C2=B1  1%  vmstat.system.cs
>  1.089e+10 =C2=B1  2%      +13.4%  1.236e+10 =C2=B1  3%  cpuidle.C1E-IVT.=
time
>   11475304 =C2=B1  2%      +13.4%   13007849 =C2=B1  3%  cpuidle.C1E-IVT.=
usage
>    2.7e+09 =C2=B1  6%      +13.2%  3.057e+09 =C2=B1  3%  cpuidle.C3-IVT.t=
ime
>    2954294 =C2=B1  6%      +14.3%    3375966 =C2=B1  3%  cpuidle.C3-IVT.u=
sage
>   96963295 =C2=B1 14%      +17.5%  1.139e+08 =C2=B1 12%  cpuidle.POLL.time
>       8761 =C2=B1  7%      +17.6%      10299 =C2=B1  9%  cpuidle.POLL.usa=
ge
>   30454483 =C2=B1  0%      +66.4%   50666102 =C2=B1  1%  meminfo.Cached
> =

> Do you see what's happening?

not really. All I could see in the previous data was that the memory
locality was different (and better) with my patch, which I cannot
explain either because get_scan_count is always per-node thing. Moreover
the change shouldn't make any difference for normal GFP_KERNEL requests
on 64b systems because the reclaim index covers all zones so there is
nothing to skip over.

> Or is there anything we can do to improve fsmark benchmark setup to
> make it more reasonable?

Unfortunatelly I am not an expert on this benchmark. Maybe Mel knows
better.
-- =

Michal Hocko
SUSE Labs

--===============2221489879490903771==--

