Content-Type: multipart/mixed; boundary="===============3199778414994970742=="
MIME-Version: 1.0
From: Feng Tang <feng.tang@intel.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Fri, 24 Jun 2022 15:06:56 +0800
Message-ID: <20220624070656.GE79500@shbuild999.sh.intel.com>
In-Reply-To: <CALvZod7kULCvHAuk53FE-XBOi4-BbLdY3HCg6jfCZTJDxYsZow@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3199778414994970742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 23, 2022 at 11:34:15PM -0700, Shakeel Butt wrote:
> CCing memcg folks.
> =

> The thread starts at
> https://lore.kernel.org/all/20220619150456.GB34471(a)xsang-OptiPlex-9020/
> =

> On Thu, Jun 23, 2022 at 9:14 PM Eric Dumazet <edumazet@google.com> wrot=
e:
> >
> > On Fri, Jun 24, 2022 at 3:57 AM Jakub Kicinski <kuba@kernel.org> wrot=
e:
> > >
> > > On Thu, 23 Jun 2022 18:50:07 -0400 Xin Long wrote:
> > > > From the perf data, we can see __sk_mem_reduce_allocated() is the o=
ne
> > > > using CPU the most more than before, and mem_cgroup APIs are also
> > > > called in this function. It means the mem cgroup must be enabled in
> > > > the test env, which may explain why I couldn't reproduce it.
> > > >
> > > > The Commit 4890b686f4 ("net: keep sk->sk_forward_alloc as small as
> > > > possible") uses sk_mem_reclaim(checking reclaimable >=3D PAGE_SIZE)=
 to
> > > > reclaim the memory, which is *more frequent* to call
> > > > __sk_mem_reduce_allocated() than before (checking reclaimable >=3D
> > > > SK_RECLAIM_THRESHOLD). It might be cheap when
> > > > mem_cgroup_sockets_enabled is false, but I'm not sure if it's still
> > > > cheap when mem_cgroup_sockets_enabled is true.
> > > >
> > > > I think SCTP netperf could trigger this, as the CPU is the bottlene=
ck
> > > > for SCTP netperf testing, which is more sensitive to the extra
> > > > function calls than TCP.
> > > >
> > > > Can we re-run this testing without mem cgroup enabled?
> > >
> > > FWIW I defer to Eric, thanks a lot for double checking the report
> > > and digging in!
> >
> > I did tests with TCP + memcg and noticed a very small additional cost
> > in memcg functions,
> > because of suboptimal layout:
> >
> > Extract of an internal Google bug, update from June 9th:
> >
> > --------------------------------
> > I have noticed a minor false sharing to fetch (struct
> > mem_cgroup)->css.parent, at offset 0xc0,
> > because it shares the cache line containing struct mem_cgroup.memory,
> > at offset 0xd0
> >
> > Ideally, memcg->socket_pressure and memcg->parent should sit in a read
> > mostly cache line.
> > -----------------------
> >
> > But nothing that could explain a "-69.4% regression"
> >
> > memcg has a very similar strategy of per-cpu reserves, with
> > MEMCG_CHARGE_BATCH being 32 pages per cpu.
> >
> > It is not clear why SCTP with 10K writes would overflow this reserve co=
nstantly.
> >
> > Presumably memcg experts will have to rework structure alignments to
> > make sure they can cope better
> > with more charge/uncharge operations, because we are not going back to
> > gigantic per-socket reserves,
> > this simply does not scale.
> =

> Yes I agree. As you pointed out there are fields which are mostly
> read-only but sharing cache lines with fields which get updated and
> definitely need work.
> =

> However can we first confirm if memcg charging is really the issue
> here as I remember these intel lkp tests are configured to run in root
> memcg and the kernel does not associate root memcg to any socket (see
> mem_cgroup_sk_alloc()).
> =

> If these tests are running in non-root memcg, is this cgroup v1 or v2?
> The memory counter and the 32 pages per cpu stock are only used on v2.
> For v1, there is no per-cpu stock and there is a separate tcpmem page
> counter and on v1 the network memory accounting has to be enabled
> explicitly i.e. not enabled by default.
> =

> There is definite possibility of slowdown on v1 but let's first
> confirm the memcg setup used for this testing environment.
> =

> Feng, can you please explain the memcg setup on these test machines
> and if the tests are run in root or non-root memcg?

I don't know the exact setup, Philip/Oliver from 0Day can correct me.

I logged into a test box which runs netperf test, and it seems to be
cgoup v1 and non-root memcg. The netperf tasks all sit in dir:
'/sys/fs/cgroup/memory/system.slice/lkp-bootstrap.service'

And the rootfs is a debian based rootfs

Thanks,
Feng


> thanks,
> Shakeel
--===============3199778414994970742==--

