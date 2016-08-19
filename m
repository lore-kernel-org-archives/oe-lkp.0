Content-Type: multipart/mixed; boundary="===============5534839123552561229=="
MIME-Version: 1.0
From: Aaron Lu <aaron.lu@intel.com>
To: lkp@lists.01.org
Subject: Re: [sctp] a6c2f79287: netperf.Throughput_Mbps -37.2% regression
Date: Fri, 19 Aug 2016 13:29:41 +0800
Message-ID: <20160819052941.GA1179@aaronlu.sh.intel.com>
In-Reply-To: <CADvbK_cF3Mphd5CDqGVHcbbZ-L8Xz=vRPzdKTzE4A_p-ZBiDVA@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5534839123552561229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 18, 2016 at 08:45:42PM +0800, Xin Long wrote:
> >> Hi, Aaron
> >>
> >> 1)
> >> I talked with Marcelo about this one.
> >> He said it might be related with cacheline.  the  new field distroyed
> >> the prior cacheline. So on top of commit 826d253d57b1, pls only add
> >> +       unsigned long prsctp_param;
> >>
> >> to the end of struct sctp_chunk, then try.
> >
> > This doesn't work.
> >
> =

> If it's because of cache lines changed, I'm not sure this, either.
> Maybe 2) is a good way to fix it.

A comparison of the good commit 826d253d57b1 and the bad a6c2f792873a:

tests: 8
testcase/path_params/tbox_group/run: netperf/ipv4-300s-200%-cs-localhost-10=
K-SCTP_STREAM_MANY-performance/lkp-ivb-d02

826d253d57b11f69             a6c2f792873aff332a4689717c  =

----------------             --------------------------  =

         %stddev      change         %stddev
             \          |                \  =

      3923             -37%       2461        netperf.Throughput_Mbps
         9             -78%          2        vmstat.procs.r
    112616              19%     133981        vmstat.system.cs
      4053               7%       4350        vmstat.system.in
      8598 =C2=B1  4%       957%      90912        softirqs.SCHED
  16466114             -37%   10305467        softirqs.NET_RX
    605899             -46%     329262        softirqs.TIMER
     72067 =C2=B1 10%       -63%      26356 =C2=B1  3%  softirqs.RCU
      4785 =C2=B1  7%        -9%       4352        slabinfo.anon_vma_chain.=
num_objs
       642 =C2=B1  7%        14%        731 =C2=B1  6%  slabinfo.kmalloc-51=
2.active_objs
      4993              15%       5735        slabinfo.kmalloc-64.active_ob=
js
      4993              15%       5735        slabinfo.kmalloc-64.num_objs
      2529 =C2=B1  4%       -15%       2150        proc-vmstat.nr_alloc_bat=
ch
 4.733e+08             -37%  2.999e+08        proc-vmstat.pgalloc_normal
 8.476e+08             -37%   5.36e+08        proc-vmstat.pgfree
 3.742e+08             -37%  2.361e+08        proc-vmstat.pgalloc_dma32
  1.48e+08             -37%   93033641        proc-vmstat.numa_hit
  1.48e+08             -37%   93033640        proc-vmstat.numa_local
      0.05 =C2=B1 17%     52102%      24.80        turbostat.CPU%c1
      0.64            3065%      20.10 =C2=B1  3%  turbostat.CPU%c6
      0.12 =C2=B1 39%      1900%       2.35 =C2=B1  3%  turbostat.Pkg%pc2
      0.46 =C2=B1 10%      1686%       8.22 =C2=B1  6%  turbostat.Pkg%pc6
     37.54             -14%      32.11        turbostat.PkgWatt
     20.20             -25%      15.22        turbostat.CorWatt
     99.31             -45%      54.97        turbostat.%Busy
      3269             -45%       1803        turbostat.Avg_MHz
     76510 =C2=B1 46%     3e+05%  1.954e+08        cpuidle.C1-IVB.time
     19769 =C2=B1 17%      5534%    1113742 =C2=B1  5%  cpuidle.C1E-IVB.time
       151 =C2=B1 11%      4175%       6454 =C2=B1  7%  cpuidle.C1E-IVB.usa=
ge
       114 =C2=B1 14%      6216%       7232 =C2=B1  5%  cpuidle.C3-IVB.usage
     33074 =C2=B1 14%      5159%    1739419 =C2=B1  3%  cpuidle.C3-IVB.time
      8874            4203%     381901        cpuidle.C6-IVB.usage
   8006184            4072%   3.34e+08        cpuidle.C6-IVB.time
     12019 =C2=B1 35%       303%      48398        perf-stat.cpu-migrations
  34232822              19%   40780053        perf-stat.context-switches
    339045               5%     354573        perf-stat.minor-faults
    339041               5%     354568        perf-stat.page-faults
 2.776e+11             -28%  2.003e+11        perf-stat.branch-instructions
 1.505e+12             -29%  1.065e+12        perf-stat.instructions
 6.421e+11             -30%  4.473e+11        perf-stat.dTLB-loads
  5.32e+11             -34%  3.536e+11        perf-stat.dTLB-stores
 1.173e+11             -38%  7.271e+10        perf-stat.cache-references
 3.735e+08 =C2=B1  5%       -48%  1.959e+08 =C2=B1  4%  perf-stat.iTLB-load=
-misses
 3.864e+09             -51%    1.9e+09        perf-stat.branch-misses
 4.069e+09 =C2=B1 20%       -56%  1.798e+09 =C2=B1 40%  perf-stat.dTLB-load=
-misses
 5.285e+08 =C2=B1 22%       -70%  1.585e+08 =C2=B1 16%  perf-stat.dTLB-stor=
e-misses
 7.126e+09 =C2=B1 16%       -97%   2.27e+08 =C2=B1  4%  perf-stat.cache-mis=
ses

The obvious change is:
1 the bad commit has a much fewer runnable process - vmstat.procs.r
2 the context switches are much higher in the bad commit - vmstat.system.cs

It all suggests the netperf processes go to sleep for some reason in the bad
commit.

I used "perf record -p one_netperf_pid -e probe:pick_next_task_idle" as
suggested by Tim to see where it went to sleep:

Samples: 78  of event 'probe:pick_next_task_idle', Event count(approx.): 78
  Children      Self  Trace output
  =E2=96=A0-  100.00%   100.00%  (ffffffff810fc750)
  =E2=96=92     __sendmsg_nocancel
  =E2=96=92     entry_SYSCALL_64_fastpath
  =E2=96=92     sys_sendmsg
  =E2=96=92     __sys_sendmsg
  =E2=96=92     ___sys_sendmsg
  =E2=96=92     inet_sendmsg
  =E2=96=92     sctp_sendmsg
  =E2=96=92     sctp_wait_for_sndbuf
  =E2=96=92     schedule_timeout
  =E2=96=92     schedule
  =E2=96=92     pick_next_task_idle

It doesn't look insane and sctp_wait_for_sndbuf may actually have
something to do with a larger sctp_chunk I suppose?

The same perf record doesn't capture any sample for the good commit,
which suggests the nerperf process doesn't sleep in sctp_wait_for_sndbuf.

Regards,
Aaron

--===============5534839123552561229==--

