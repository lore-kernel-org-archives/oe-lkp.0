Content-Type: multipart/mixed; boundary="===============6385575965512194749=="
MIME-Version: 1.0
From: Roman Gushchin <roman.gushchin@linux.dev>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Sun, 03 Jul 2022 15:55:31 -0700
Message-ID: <YsIeYzEuj95PWMWO@castle>
In-Reply-To: <20220703104353.GB62281@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6385575965512194749==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 03, 2022 at 06:43:53PM +0800, Feng Tang wrote:
> Hi Shakeel,
> =

> On Fri, Jul 01, 2022 at 08:47:29AM -0700, Shakeel Butt wrote:
> > On Mon, Jun 27, 2022 at 8:49 PM Feng Tang <feng.tang@intel.com> wrote:
> > > I just tested it, it does perform better (the 4th is with your patch),
> > > some perf-profile data is also listed.
> > >
> > >  7c80b038d23e1f4c 4890b686f4088c90432149bd6de 332b589c49656a45881bca4=
ecc0 e719635902654380b23ffce908d
> > > ---------------- --------------------------- ------------------------=
--- ---------------------------
> > >      15722           -69.5%       4792           -40.8%       9300   =
        -27.9%      11341        netperf.Throughput_Mbps
> > >
> > >       0.00            +0.3        0.26 =C2=B1  5%      +0.5        0.=
51            +1.3        1.27 =C2=B1  2%pp.self.__sk_mem_raise_allocated
> > >       0.00            +0.3        0.32 =C2=B1 15%      +1.7        1.=
74 =C2=B1  2%      +0.4        0.40 =C2=B1  2%  pp.self.propagate_protected=
_usage
> > >       0.00            +0.8        0.82 =C2=B1  7%      +0.9        0.=
90            +0.8        0.84        pp.self.__mod_memcg_state
> > >       0.00            +1.2        1.24 =C2=B1  4%      +1.0        1.=
01            +1.4        1.44        pp.self.try_charge_memcg
> > >       0.00            +2.1        2.06            +2.1        2.13   =
         +2.1        2.11        pp.self.page_counter_uncharge
> > >       0.00            +2.1        2.14 =C2=B1  4%      +2.7        2.=
71            +2.6        2.60 =C2=B1  2%  pp.self.page_counter_try_charge
> > >       1.12 =C2=B1  4%      +3.1        4.24            +1.1        2.=
22            +1.4        2.51        pp.self.native_queued_spin_lock_slowp=
ath
> > >       0.28 =C2=B1  9%      +3.8        4.06 =C2=B1  4%      +0.2     =
   0.48            +0.4        0.68        pp.self.sctp_eat_data
> > >       0.00            +8.2        8.23            +0.8        0.83   =
         +1.3        1.26        pp.self.__sk_mem_reduce_allocated
> > >
> > > And the size of 'mem_cgroup' is increased from 4224 Bytes to 4608.
> > =

> > Hi Feng, can you please try two more configurations? Take Eric's patch
> > of adding ____cacheline_aligned_in_smp in page_counter and for first
> > increase MEMCG_CHARGE_BATCH to 64 and for second increase it to 128.
> > Basically batch increases combined with Eric's patch.
> =

> With increasing batch to 128, the regression could be reduced to -12.4%.

If we're going to bump it, I wonder if we should scale it dynamically depen=
ding
on the size of the memory cgroup?

Thanks!
--===============6385575965512194749==--

