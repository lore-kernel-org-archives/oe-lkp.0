Content-Type: multipart/mixed; boundary="===============7329079612411907282=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Tue, 16 Aug 2022 13:52:58 +0800
Message-ID: <YvswusNaC5yr+HwT@xsang-OptiPlex-9020>
In-Reply-To: <20220705050326.GF62281@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7329079612411907282==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi all,

now we noticed this commit has already merged into mainline, and in our tes=
ts
there is still similar regression. [1]

not sure if there is a plan to merge some of the solutions that have been
discussed in this thread? we'll very glad to test patches if there is a req=
uest

Thanks a lot!

[1]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
tbox_group/testcase/rootfs/kconfig/compiler/ip/runtime/nr_threads/cluster/s=
end_size/test/cpufreq_governor/ucode:
  lkp-icl-2sp4/netperf/debian-11.1-x86_64-20220510.cgz/x86_64-rhel-8.3/gcc-=
11/ipv4/300s/50%/cs-localhost/10K/SCTP_STREAM_MANY/performance/0xd000363

7c80b038d23e1f4c 4890b686f4088c90432149bd6de
---------------- ---------------------------
         %stddev     %change         %stddev
             \          |                \
      9078           -55.9%       4006        netperf.Throughput_Mbps
    581006           -55.9%     256385        netperf.Throughput_total_Mbps
     36715           -54.6%      16674 =C2=B1  4%  netperf.time.involuntary=
_context_switches
      1885           -50.2%     938.33 =C2=B1  3%  netperf.time.percent_of_=
cpu_this_job_got
      5533           -49.9%       2771 =C2=B1  2%  netperf.time.system_time
    152.13           -59.5%      61.61 =C2=B1  2%  netperf.time.user_time
    418171 =C2=B1  5%     +89.4%     791954 =C2=B1 17%  netperf.time.volunt=
ary_context_switches
 2.128e+09           -55.9%  9.389e+08        netperf.workload
     30217           +17.8%      35608        uptime.idle
 2.689e+10           +20.3%  3.234e+10        cpuidle..time
 6.366e+08           -48.1%  3.305e+08        cpuidle..usage
     70.26           +13.5       83.78        mpstat.cpu.all.idle%
      4.46            -1.5        2.92 =C2=B1  3%  mpstat.cpu.all.soft%
     23.71           -11.6       12.16 =C2=B1  3%  mpstat.cpu.all.sys%
      0.89            -0.5        0.38        mpstat.cpu.all.usr%
 1.392e+09           -57.5%   5.91e+08 =C2=B1 12%  numa-numastat.node0.loca=
l_node
 1.389e+09           -57.5%  5.906e+08 =C2=B1 12%  numa-numastat.node0.numa=
_hit
 1.369e+09           -54.5%  6.226e+08 =C2=B1 12%  numa-numastat.node1.loca=
l_node
 1.366e+09           -54.4%  6.222e+08 =C2=B1 12%  numa-numastat.node1.numa=
_hit
     36715           -54.6%      16674 =C2=B1  4%  time.involuntary_context=
_switches
      1885           -50.2%     938.33 =C2=B1  3%  time.percent_of_cpu_this=
_job_got
      5533           -49.9%       2771 =C2=B1  2%  time.system_time
    152.13           -59.5%      61.61 =C2=B1  2%  time.user_time
    418171 =C2=B1  5%     +89.4%     791954 =C2=B1 17%  time.voluntary_cont=
ext_switches


On Tue, Jul 05, 2022 at 01:03:26PM +0800, Feng Tang wrote:
> On Sun, Jul 03, 2022 at 03:55:31PM -0700, Roman Gushchin wrote:
> > On Sun, Jul 03, 2022 at 06:43:53PM +0800, Feng Tang wrote:
> > > Hi Shakeel,
> > > =

> > > On Fri, Jul 01, 2022 at 08:47:29AM -0700, Shakeel Butt wrote:
> > > > On Mon, Jun 27, 2022 at 8:49 PM Feng Tang <feng.tang@intel.com> w=
rote:
> > > > > I just tested it, it does perform better (the 4th is with your pa=
tch),
> > > > > some perf-profile data is also listed.
> > > > >
> > > > >  7c80b038d23e1f4c 4890b686f4088c90432149bd6de 332b589c49656a45881=
bca4ecc0 e719635902654380b23ffce908d
> > > > > ---------------- --------------------------- --------------------=
------- ---------------------------
> > > > >      15722           -69.5%       4792           -40.8%       930=
0           -27.9%      11341        netperf.Throughput_Mbps
> > > > >
> > > > >       0.00            +0.3        0.26 =C2=B1  5%      +0.5      =
  0.51            +1.3        1.27 =C2=B1  2%pp.self.__sk_mem_raise_allocat=
ed
> > > > >       0.00            +0.3        0.32 =C2=B1 15%      +1.7      =
  1.74 =C2=B1  2%      +0.4        0.40 =C2=B1  2%  pp.self.propagate_prote=
cted_usage
> > > > >       0.00            +0.8        0.82 =C2=B1  7%      +0.9      =
  0.90            +0.8        0.84        pp.self.__mod_memcg_state
> > > > >       0.00            +1.2        1.24 =C2=B1  4%      +1.0      =
  1.01            +1.4        1.44        pp.self.try_charge_memcg
> > > > >       0.00            +2.1        2.06            +2.1        2.1=
3            +2.1        2.11        pp.self.page_counter_uncharge
> > > > >       0.00            +2.1        2.14 =C2=B1  4%      +2.7      =
  2.71            +2.6        2.60 =C2=B1  2%  pp.self.page_counter_try_cha=
rge
> > > > >       1.12 =C2=B1  4%      +3.1        4.24            +1.1      =
  2.22            +1.4        2.51        pp.self.native_queued_spin_lock_s=
lowpath
> > > > >       0.28 =C2=B1  9%      +3.8        4.06 =C2=B1  4%      +0.2 =
       0.48            +0.4        0.68        pp.self.sctp_eat_data
> > > > >       0.00            +8.2        8.23            +0.8        0.8=
3            +1.3        1.26        pp.self.__sk_mem_reduce_allocated
> > > > >
> > > > > And the size of 'mem_cgroup' is increased from 4224 Bytes to 4608.
> > > > =

> > > > Hi Feng, can you please try two more configurations? Take Eric's pa=
tch
> > > > of adding ____cacheline_aligned_in_smp in page_counter and for first
> > > > increase MEMCG_CHARGE_BATCH to 64 and for second increase it to 128.
> > > > Basically batch increases combined with Eric's patch.
> > > =

> > > With increasing batch to 128, the regression could be reduced to -12.=
4%.
> > =

> > If we're going to bump it, I wonder if we should scale it dynamically d=
epending
> > on the size of the memory cgroup?
>  =

> I think it makes sense, or also make it a configurable parameter? From =

> the test reports of 0Day, these charging/counting play critical role
> in performance (easy to see up to 60% performance effect). If user only
> wants memcg for isolating things or doesn't care charging/stats, these
> seem to be extra taxes.
> =

> For bumping to 64 or 128, universal improvement is expected with the
> only concern of accuracy.
> =

> Thanks,
> Feng
> =

> > Thanks!
--===============7329079612411907282==--

