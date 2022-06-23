Content-Type: multipart/mixed; boundary="===============1580464887814876874=="
MIME-Version: 1.0
From: Xin Long <lucien.xin@gmail.com>
To: lkp@lists.01.org
Subject: Re: [net] 4890b686f4: netperf.Throughput_Mbps -69.4% regression
Date: Thu, 23 Jun 2022 18:50:07 -0400
Message-ID: <CADvbK_eQUmb942vC+bG+NRzM1ki1LiCydEDR1AezZ35Jvsdfnw@mail.gmail.com>
In-Reply-To: <CADvbK_csvmkKe46hT9792=+Qcjor2EvkkAnr--CJK3NGX-N9BQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1580464887814876874==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2022 at 11:08 PM Xin Long <lucien.xin@gmail.com> wrote:
>
> Yes, I'm working on it. I couldn't see the regression in my env with
> the 'reproduce' script attached.
> I will try with lkp tomorrow.
>
> Thanks.
>
> On Wed, Jun 22, 2022 at 8:29 PM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > Could someone working on SCTP double check this is a real regression?
> > Feels like the regression reports are flowing at such rate its hard
> > to keep up.
> >
> > >
> > > commit:
> > >   7c80b038d2 ("net: fix sk_wmem_schedule() and sk_rmem_schedule() err=
ors")
> > >   4890b686f4 ("net: keep sk->sk_forward_alloc as small as possible")
> > >
> > > 7c80b038d23e1f4c 4890b686f4088c90432149bd6de
> > > ---------------- ---------------------------
> > >          %stddev     %change         %stddev
> > >              \          |                \
> > >      15855           -69.4%       4854        netperf.Throughput_Mbps
> > >     570788           -69.4%     174773        netperf.Throughput_tota=
l_Mbps
...
> > >       0.00            +5.1        5.10 =C2=B1  5%  perf-profile.callt=
race.cycles-pp.__sk_mem_reduce_allocated.sctp_wfree.skb_release_head_state.=
consume_skb.sctp_chunk_put
> > >       0.17 =C2=B1141%      +5.3        5.42 =C2=B1  6%  perf-profile.=
calltrace.cycles-pp.skb_release_head_state.consume_skb.sctp_chunk_put.sctp_=
outq_sack.sctp_cmd_interpreter
> > >       0.00            +5.3        5.35 =C2=B1  6%  perf-profile.callt=
race.cycles-pp.sctp_wfree.skb_release_head_state.consume_skb.sctp_chunk_put=
.sctp_outq_sack
> > >       0.00            +5.5        5.51 =C2=B1  6%  perf-profile.callt=
race.cycles-pp.__sk_mem_reduce_allocated.skb_release_head_state.kfree_skb_r=
eason.sctp_recvmsg.inet_recvmsg
> > >       0.00            +5.7        5.65 =C2=B1  6%  perf-profile.callt=
race.cycles-pp.skb_release_head_state.kfree_skb_reason.sctp_recvmsg.inet_re=
cvmsg.____sys_recvmsg
...
> > >       0.00            +4.0        4.04 =C2=B1  6%  perf-profile.child=
ren.cycles-pp.mem_cgroup_charge_skmem
> > >       2.92 =C2=B1  6%      +4.2        7.16 =C2=B1  6%  perf-profile.=
children.cycles-pp.sctp_outq_sack
> > >       0.00            +4.3        4.29 =C2=B1  6%  perf-profile.child=
ren.cycles-pp.__sk_mem_raise_allocated
> > >       0.00            +4.3        4.32 =C2=B1  6%  perf-profile.child=
ren.cycles-pp.__sk_mem_schedule
> > >       1.99 =C2=B1  6%      +4.4        6.40 =C2=B1  6%  perf-profile.=
children.cycles-pp.consume_skb
> > >       1.78 =C2=B1  6%      +4.6        6.42 =C2=B1  6%  perf-profile.=
children.cycles-pp.kfree_skb_reason
> > >       0.37 =C2=B1  8%      +5.0        5.40 =C2=B1  6%  perf-profile.=
children.cycles-pp.sctp_wfree
> > >       0.87 =C2=B1  9%     +10.3       11.20 =C2=B1  6%  perf-profile.=
children.cycles-pp.skb_release_head_state
> > >       0.00           +10.7       10.66 =C2=B1  6%  perf-profile.child=
ren.cycles-pp.__sk_mem_reduce_allocated
...
> > >       0.00            +1.2        1.19 =C2=B1  7%  perf-profile.self.=
cycles-pp.try_charge_memcg
> > >       0.00            +2.0        1.96 =C2=B1  6%  perf-profile.self.=
cycles-pp.page_counter_uncharge
> > >       0.00            +2.1        2.07 =C2=B1  5%  perf-profile.self.=
cycles-pp.page_counter_try_charge
> > >       1.09 =C2=B1  8%      +2.8        3.92 =C2=B1  6%  perf-profile.=
self.cycles-pp.native_queued_spin_lock_slowpath
> > >       0.29 =C2=B1  6%      +3.5        3.81 =C2=B1  6%  perf-profile.=
self.cycles-pp.sctp_eat_data
> > >       0.00            +7.8        7.76 =C2=B1  6%  perf-profile.self.=
cycles-pp.__sk_mem_reduce_allocated

>From the perf data, we can see __sk_mem_reduce_allocated() is the one
using CPU the most more than before, and mem_cgroup APIs are also
called in this function. It means the mem cgroup must be enabled in
the test env, which may explain why I couldn't reproduce it.

The Commit 4890b686f4 ("net: keep sk->sk_forward_alloc as small as
possible") uses sk_mem_reclaim(checking reclaimable >=3D PAGE_SIZE) to
reclaim the memory, which is *more frequent* to call
__sk_mem_reduce_allocated() than before (checking reclaimable >=3D
SK_RECLAIM_THRESHOLD). It might be cheap when
mem_cgroup_sockets_enabled is false, but I'm not sure if it's still
cheap when mem_cgroup_sockets_enabled is true.

I think SCTP netperf could trigger this, as the CPU is the bottleneck
for SCTP netperf testing, which is more sensitive to the extra
function calls than TCP.

Can we re-run this testing without mem cgroup enabled?

Thanks.
--===============1580464887814876874==--

