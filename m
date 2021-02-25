Content-Type: multipart/mixed; boundary="===============3451344987829505223=="
MIME-Version: 1.0
From: Eric Dumazet <edumazet@google.com>
To: lkp@lists.01.org
Subject: Re: [tcp] 9d9b1ee0b2: packetdrill.packetdrill/gtests/net/tcp/user_timeout/user-timeout-probe_ipv4-mapped-v6.fail
Date: Thu, 25 Feb 2021 10:23:26 +0100
Message-ID: <CANn89iJx5eFnTqgsa_cqan6xKesFfwaaWRbj=BJMvizvOsSR1w@mail.gmail.com>
In-Reply-To: <20210225082118.GA22949@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3451344987829505223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 25, 2021 at 9:06 AM Oliver Sang <oliver.sang@intel.com> wrote:
>
> Hi, Neal,
>
> On Wed, Feb 24, 2021 at 10:13:02PM +0800, Oliver Sang wrote:
> > Hi, Neal,
> >
> > On Fri, Feb 19, 2021 at 09:52:04AM -0500, Neal Cardwell wrote:
> > > On Thu, Feb 18, 2021 at 8:33 PM kernel test robot <oliver.sang@inte=
l.com> wrote:
> > > >
> > > >
> > > > Greeting,
> > > >
> > > > FYI, we noticed the following commit (built with gcc-9):
> > > >
> > > > commit: 9d9b1ee0b2d1c9e02b2338c4a4b0a062d2d3edac ("tcp: fix TCP_USE=
R_TIMEOUT with zero window")
> > > > https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git mas=
ter
> > >
> > > I have pushed to the packetdrill repo a commit that should fix this t=
est:
> > >
> > > 094da3bc77e5 (HEAD, packetdrill/master) net-test: update TCP tests for
> > > USER_TIMEOUT ZWP fix
> > > https://github.com/google/packetdrill/commit/094da3bc77e518d820ebc0ef=
8b94a5b4cf707a39
> > >
> > > Can someone please pull that commit into the repo used by the test
> > > bot, if needed? (Or does it automatically use the latest packetdrill
> > > master branch?)
> >
> > We updated our tool to use this latest packetdrill. seems improved, but=
 not totally fix.
> >
> > before upgrading, we have:
> > b889c7c8c02ebb0b 9d9b1ee0b2d1c9e02b2338c4a4b
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :6          100%           6:6     packetdrill.packetdrill/g=
tests/net/tcp/user_timeout/user-timeout-probe_ipv4-mapped-v6.fail
> >            :6          100%           6:6     packetdrill.packetdrill/g=
tests/net/tcp/user_timeout/user-timeout-probe_ipv4.fail
> >
> > after upgrading, we have:
> > b889c7c8c02ebb0b 9d9b1ee0b2d1c9e02b2338c4a4b
> > ---------------- ---------------------------
> >        fail:runs  %reproduction    fail:runs
> >            |             |             |
> >            :6          100%           5:6     packetdrill.packetdrill/g=
tests/net/tcp/user_timeout/user-timeout-probe_ipv4-mapped-v6.fail
> >            :6          100%           3:6     packetdrill.packetdrill/g=
tests/net/tcp/user_timeout/user-timeout-probe_ipv4.fail
> >
> >
> > attached kmsg.xz and packetdrill from one run where both tests failed.
>
> here is an update. we did't re-test parent with latest packetdrill yester=
day,
> so above results about b889c7c8c02ebb0b are still from old version packet=
drill.
>
> today, we did further tests based on latest packetdrill, and found the te=
sts
> always failed upon b889c7c8c02ebb0b. not sure if a kernel before your com=
mit
> (9d9b1ee0b2d1c9e02b2338c4a4b) is still valid to run latest packetdrill?)

Well, the packetdrill test was relying on old kernel behavior (not
very precise USER_TIMEOUT implementation),
and the test had comments explaining this (
https://github.com/google/packetdrill/commit/094da3bc77e518d820ebc0ef8b94a5=
b4cf707a39

So old packetdrill test only pass on old kernels.

Really the new packetdrill test is now checking the behavior of recent kern=
els
and making sure future kernels won't regress.



>
> attached kmsg and test log from latest packetdrill upon parent commit FYI.
>
>
> >
> >
> > >
> > > thanks,
> > > neal
>
>
> > Running packetdrill/tests/bsd/fast_retransmit/fr-4pkt-sack-bsd.pkt ...
> > 2021-02-24 08:46:09 packetdrill/packetdrill --tolerance_usecs=3D40000 p=
acketdrill/tests/bsd/fast_retransmit/fr-4pkt-sack-bsd.pkt
> > packetdrill/tests/bsd/fast_retransmit/fr-4pkt-sack-bsd.pkt:25: error ha=
ndling packet: live packet payload: expected 1000 bytes vs actual 2000 bytes
> > packetdrill/tests/bsd/fast_retransmit/fr-4pkt-sack-bsd.pkt failed
> > Running packetdrill/tests/linux/fast_retransmit/fr-4pkt-sack-linux.pkt =
...
> > 2021-02-24 08:46:10 packetdrill/packetdrill --tolerance_usecs=3D40000 p=
acketdrill/tests/linux/fast_retransmit/fr-4pkt-sack-linux.pkt
> > packetdrill/tests/linux/fast_retransmit/fr-4pkt-sack-linux.pkt pass
> > Running packetdrill/tests/linux/packetdrill/socket_err.pkt ...
> > 2021-02-24 08:46:10 packetdrill/packetdrill --tolerance_usecs=3D40000 p=
acketdrill/tests/linux/packetdrill/socket_err.pkt
> > packetdrill/tests/linux/packetdrill/socket_err.pkt:6: runtime error in =
socket call: Expected non-negative result but got -1 with errno 93 (Protoco=
l not supported)
> > packetdrill/tests/linux/packetdrill/socket_err.pkt failed
> > Running packetdrill/tests/linux/packetdrill/socket_wrong_err.pkt ...
> > 2021-02-24 08:46:10 packetdrill/packetdrill --tolerance_usecs=3D40000 p=
acketdrill/tests/linux/packetdrill/socket_wrong_err.pkt
> > packetdrill/tests/linux/packetdrill/socket_wrong_err.pkt:4: runtime err=
or in socket call: Expected result -99 but got -1 with errno 93 (Protocol n=
ot supported)
> > packetdrill/tests/linux/packetdrill/socket_wrong_err.pkt failed
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-acce=
pt.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-acce=
pt.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-conn=
ect.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-read=
.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-read=
.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-writ=
e.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-local-clos=
e-then-remote-fin.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-local-clos=
e-then-remote-fin.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-on-syn-sen=
t.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-remote-fin=
-then-close.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-remote-fin=
-then-close.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/cwnd_moderation/cwnd-m=
oderation-disorder-no-moderation.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cwnd_moderation/cwnd-m=
oderation-ecn-enter-cwr-no-moderation-700.pkt (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cwnd_moderation/cwnd-m=
oderation-ecn-enter-cwr-no-moderation-700.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ecn/ecn-uses-ect0.pkt =
(ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-large.=
pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-large.=
pkt (ipv6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-retran=
s.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-small.=
pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-small.=
pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-subseq=
uent.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_in_edge.pk=
t (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_in_edge.pk=
t (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge.p=
kt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge_d=
efault_notsent_lowat.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge_d=
efault_notsent_lowat.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge_n=
otsent_lowat.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/fastopen/server/client=
-ack-dropped-then-recovery-ms-timestamps.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/fastopen/server/client=
-ack-dropped-then-recovery-ms-timestamps.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/gro/gro-mss-option.pkt=
 (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/inq/client.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/inq/client.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/inq/server.pkt (ipv4-m=
apped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ioctl/ioctl-siocinq-fi=
n.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ioctl/ioctl-siocinq-fi=
n.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/limited_transmit/limit=
ed-transmit-no-sack.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/limited_transmit/limit=
ed-transmit-sack.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/md5/md5-only-on-client=
-ack.pkt (ipv4)]
> > stdout:
> > /proc/net/tcp:   1: 0200A8C0:1F90 00000000:0000 0A 00000000:00000000 00=
:00000000 00000000     0        0 54376 2 00000000533bbe98 100 0 0 10 1
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-setsockopt-tcp=
_maxseg-client.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/https_client.pkt=
 (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-route-refres=
h-ip-tos.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-acce=
pt.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-conn=
ect.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-writ=
e.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-local-clos=
e-then-remote-fin.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-on-syn-sen=
t.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/cwnd_moderation/cwnd-m=
oderation-disorder-no-moderation.pkt (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/cwnd_moderation/cwnd-m=
oderation-ecn-enter-cwr-no-moderation-700.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ecn/ecn-uses-ect0.pkt =
(ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-retran=
s.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-small.=
pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-subseq=
uent.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge.p=
kt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge_d=
efault_notsent_lowat.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge_n=
otsent_lowat.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/gro/gro-mss-option.pkt=
 (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/inq/client.pkt (ipv4-m=
apped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/inq/server.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/limited_transmit/limit=
ed-transmit-no-sack.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/limited_transmit/limit=
ed-transmit-sack.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/md5/md5-only-on-client=
-ack.pkt (ipv4-mapped-v6)]
> > stdout:
> > /proc/net/tcp6:   1: 0000000000000000FFFF00000200A8C0:1F90 000000000000=
00000000000000000000:0000 0A 00000000:00000000 00:00000000 00000000     0  =
      0 57703 2 00000000b5e42e7e 100 0 0 10 1
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-getsockopt-tcp=
_maxseg-server.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-getsockopt-tcp=
_maxseg-server.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-setsockopt-tcp=
_maxseg-client.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-setsockopt-tcp=
_maxseg-server.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/https_client.pkt=
 (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/sockopt_cork_nod=
elay.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-default.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-setsockopt.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-sysctl.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-2-6-8-3-9-nofack.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-7-3-4-8-9-fack.pkt (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-7-5-6-8-9-fack.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sendfile/sendfile-simp=
le.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rd-c=
lose.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-conn=
ect.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-writ=
e.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-remote-fin=
-then-close.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ecn/ecn-uses-ect0.pkt =
(ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-retran=
s.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_in_edge.pk=
t (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge_n=
otsent_lowat.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/gro/gro-mss-option.pkt=
 (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ioctl/ioctl-siocinq-fi=
n.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/limited_transmit/limit=
ed-transmit-sack.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-getsockopt-tcp=
_maxseg-server.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-setsockopt-tcp=
_maxseg-server.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/https_client.pkt=
 (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/sendmsg_msg_more=
.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/sockopt_cork_nod=
elay.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-setsockopt.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-sysctl.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-2-6-8-3-9-nofack.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-7-5-6-8-9-fack.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rd-w=
r-close.pkt (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-send-queue-ack-close.pkt (ipv6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-rwnd=
-limited.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-sndb=
uf-limited.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/blocking/blocking-read=
.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/cwnd_moderation/cwnd-m=
oderation-disorder-no-moderation.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-subseq=
uent.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/fastopen/server/client=
-ack-dropped-then-recovery-ms-timestamps.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/limited_transmit/limit=
ed-transmit-no-sack.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-setsockopt-tcp=
_maxseg-client.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mtu_probe/basic-v4.pkt=
 (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/sendmsg_msg_more=
.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/sockopt_cork_nod=
elay.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-setsockopt.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-route-refres=
h-ip-tos.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-2-6-8-3-9-nofack.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-7-5-6-8-9-fack.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-close.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-wr-c=
lose.pkt (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/syscal=
l-invalid-buf-ptr.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/invalid_ack.=
pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/basic.pkt (ip=
v4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/close/close-on-syn-sen=
t.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/epoll/epoll_out_edge.p=
kt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/md5/md5-only-on-client=
-ack.pkt (ipv6)]
> > stdout:
> > /proc/net/tcp6:   1: 7BFA3DFD00007DD10000000000000000:1F90 000000000000=
00000000000000000000:0000 0A 00000000:00000000 00:00000000 00000000     0  =
      0 55408 2 00000000ce767bbd 100 0 0 10 1
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mtu_probe/basic-v4.pkt=
 (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/nagle/sendmsg_msg_more=
.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-default.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-7-3-4-8-9-fack.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rd-w=
r-close.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-close.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-send-queue-ack-close.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-write-queue-close.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-wr-c=
lose.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/fastop=
en-invalid-buf-ptr.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/sendms=
g-empty-iov.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-last=
_data_recv.pkt (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-sndb=
uf-limited.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/client-on=
ly-last-byte.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/reset_tsval.=
pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/reset_tsval.=
pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/batch.pkt (ip=
v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/eor/no-coalesce-large.=
pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mss/mss-setsockopt-tcp=
_maxseg-server.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-default.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-route-refres=
h-ip-tos.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sendfile/sendfile-simp=
le.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rd-c=
lose.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rd-w=
r-close.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-send-queue-ack-close.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-write-queue-close.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/splice/tcp_splice_loop=
_test.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/fastop=
en-invalid-buf-ptr.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/sendms=
g-empty-iov.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/syscal=
l-invalid-buf-ptr.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-last=
_data_recv.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-rwnd=
-limited.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-sndb=
uf-limited.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/client-on=
ly-last-byte.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/partial.p=
kt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/server.pk=
t (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/server.pk=
t (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/fin_tsval.pk=
t (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/invalid_ack.=
pkt (ipv6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/user_timeout/user-time=
out-probe.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/validate/validate-esta=
blished-no-flags.pkt (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/validate/validate-esta=
blished-no-flags.pkt (ipv6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/basic.pkt (ip=
v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/batch.pkt (ip=
v4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/client.pkt (i=
pv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/closed.pkt (i=
pv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/closed.pkt (i=
pv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_edge.pk=
t (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_exclusi=
ve.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_exclusi=
ve.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_oneshot=
.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/fastopen-clie=
nt.pkt (ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/fastopen-clie=
nt.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/fastopen-serv=
er.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/maxfrags.pkt =
(ipv6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/small.pkt (ip=
v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/inq/server.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/notsent_lowat/notsent-=
lowat-sysctl.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sendfile/sendfile-simp=
le.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-close.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-wr-c=
lose.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/fastop=
en-invalid-buf-ptr.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/syscal=
l-invalid-buf-ptr.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-rwnd=
-limited.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/partial.p=
kt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/server.pk=
t (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/fin_tsval.pk=
t (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/reset_tsval.=
pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/user_timeout/user_time=
out.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/user_timeout/user_time=
out.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/basic.pkt (ip=
v4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/client.pkt (i=
pv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/closed.pkt (i=
pv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_edge.pk=
t (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_oneshot=
.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/fastopen-clie=
nt.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/fastopen-serv=
er.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/small.pkt (ip=
v4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/mtu_probe/basic-v6.pkt=
 (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rd-c=
lose.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/splice/tcp_splice_loop=
_test.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/syscall_bad_arg/sendms=
g-empty-iov.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/client-on=
ly-last-byte.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/fin_tsval.pk=
t (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/validate/validate-esta=
blished-no-flags.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/client.pkt (i=
pv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_exclusi=
ve.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/fastopen-serv=
er.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/maxfrags.pkt =
(ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/sack/sack-shift-sacked=
-7-3-4-8-9-fack.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/tcp_info/tcp-info-last=
_data_recv.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/ts_recent/invalid_ack.=
pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/user_timeout/user-time=
out-probe.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/batch.pkt (ip=
v4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_oneshot=
.pkt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/small.pkt (ip=
v4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/shutdown/shutdown-rdwr=
-write-queue-close.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/timestamping/partial.p=
kt (ipv6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/user_timeout/user_time=
out.pkt (ipv4-mapped-v6)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/maxfrags.pkt =
(ipv4)]
> > stdout:
> > stderr:
> > FAIL [/lkp/benchmarks/packetdrill/gtests/net/tcp/user_timeout/user-time=
out-probe.pkt (ipv4)]
> > stdout:
> > stderr:
> > OK   [/lkp/benchmarks/packetdrill/gtests/net/tcp/zerocopy/epoll_edge.pk=
t (ipv4)]
> > stdout:
> > stderr:
> > KILL [/lkp/benchmarks/packetdrill/gtests/net/tcp/splice/tcp_splice_loop=
_test.pkt (ipv6)]
> > stdout:
> > stderr:
> > Ran  222 tests:  194 passing,   27 failing,    1 timed out (180.71 sec)=
: tcp
>
--===============3451344987829505223==--

