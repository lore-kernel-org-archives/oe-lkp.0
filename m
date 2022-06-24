Content-Type: multipart/mixed; boundary="===============6923495770053239541=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Fri, 24 Jun 2022 13:13:51 +0800
Message-ID: <20220624051351.GA72171@shbuild999.sh.intel.com>
In-Reply-To: <CANn89iLidqjiiV8vxr7KnUg0JvfoS9+TRGg=8ANZ8NBRjeQxsQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6923495770053239541==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Eric,

On Fri, Jun 24, 2022 at 06:13:51AM +0200, Eric Dumazet wrote:
> On Fri, Jun 24, 2022 at 3:57 AM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Thu, 23 Jun 2022 18:50:07 -0400 Xin Long wrote:
> > > From the perf data, we can see __sk_mem_reduce_allocated() is the one
> > > using CPU the most more than before, and mem_cgroup APIs are also
> > > called in this function. It means the mem cgroup must be enabled in
> > > the test env, which may explain why I couldn't reproduce it.
> > >
> > > The Commit 4890b686f4 ("net: keep sk->sk_forward_alloc as small as
> > > possible") uses sk_mem_reclaim(checking reclaimable >=3D PAGE_SIZE) to
> > > reclaim the memory, which is *more frequent* to call
> > > __sk_mem_reduce_allocated() than before (checking reclaimable >=3D
> > > SK_RECLAIM_THRESHOLD). It might be cheap when
> > > mem_cgroup_sockets_enabled is false, but I'm not sure if it's still
> > > cheap when mem_cgroup_sockets_enabled is true.
> > >
> > > I think SCTP netperf could trigger this, as the CPU is the bottleneck
> > > for SCTP netperf testing, which is more sensitive to the extra
> > > function calls than TCP.
> > >
> > > Can we re-run this testing without mem cgroup enabled?
> >
> > FWIW I defer to Eric, thanks a lot for double checking the report
> > and digging in!
> =

> I did tests with TCP + memcg and noticed a very small additional cost
> in memcg functions,
> because of suboptimal layout:
> =

> Extract of an internal Google bug, update from June 9th:
> =

> --------------------------------
> I have noticed a minor false sharing to fetch (struct
> mem_cgroup)->css.parent, at offset 0xc0,
> because it shares the cache line containing struct mem_cgroup.memory,
> at offset 0xd0
> =

> Ideally, memcg->socket_pressure and memcg->parent should sit in a read
> mostly cache line.
> -----------------------
> =

> But nothing that could explain a "-69.4% regression"
 =

We can double check that. =


> memcg has a very similar strategy of per-cpu reserves, with
> MEMCG_CHARGE_BATCH being 32 pages per cpu.
 =

We have proposed patch to increase the batch numer for stats
update, which was not accepted as it hurts the accuracy and
the data is used by many tools.

> It is not clear why SCTP with 10K writes would overflow this reserve cons=
tantly.
> =

> Presumably memcg experts will have to rework structure alignments to
> make sure they can cope better
> with more charge/uncharge operations, because we are not going back to
> gigantic per-socket reserves,
> this simply does not scale.

Yes, the memcg statitics and charge/unchage update is very sensitive
with the data alignemnt layout, and can easily trigger peformance
changes, as we've seen quite some similar cases in the past several
years. =


One pattern we've seen is, even if a memcg stats updating or charge
function only takes about 2%~3% of the CPU cycles in perf-profile data,
once it got affected, the peformance change could be amplified to up to
60% or more.

Thanks,
Feng


--===============6923495770053239541==--

