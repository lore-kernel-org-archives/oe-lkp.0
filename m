Content-Type: multipart/mixed; boundary="===============0429955490043591420=="
MIME-Version: 1.0
From: Oliver Sang <oliver.sang@intel.com>
To: lkp@lists.01.org
Subject: Re: [veth] 9d3684c24a: kernel-selftests.net/mptcp.mptcp_join.sh.fail
Date: Thu, 21 Oct 2021 23:34:21 +0800
Message-ID: <20211021153421.GD16330@xsang-OptiPlex-9020>
In-Reply-To: <ade152d7877b21adfd3b9680d729c185ef701bb9.camel@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============0429955490043591420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Paolo Abeni,

On Tue, Sep 07, 2021 at 04:35:47PM +0200, Paolo Abeni wrote:
> Hello,
> =

> On Tue, 2021-09-07 at 22:27 +0800, kernel test robot wrote:
> > caused below changes (please refer to attached dmesg/kmsg for entire lo=
g/backtrace):
> =

> It's not entirelly clear to me which are the relevant "changes" ???
> =

> [...]
> =

> > # 36 add multiple addresses IPv6          syn[ ok ] - synack[ ok ] - ac=
k[ ok ]
> > #                                         add[ ok ] - echo  [fail] got =
1 ADD_ADDR echo[s] expected 2
> > # =

> > # Server ns stats
> > # MPTcpExtMPCapableSYNRX          1                  0.0
> > # MPTcpExtMPCapableACKRX          1                  0.0
> > # MPTcpExtMPJoinSynRx             2                  0.0
> > # MPTcpExtMPJoinAckRx             2                  0.0
> > # MPTcpExtEchoAdd                 1                  0.0
> > # Client ns stats
> > # MPTcpExtMPCapableSYNTX          1                  0.0
> > # MPTcpExtMPCapableSYNACKRX       1                  0.0
> > # MPTcpExtMPJoinSynAckRx          2                  0.0
> > # MPTcpExtAddAddr                 2                  0.0
> =

> is the referred change is the above self-test failure?
> =

> I belive this is unrelated to the mentioned commit (which behave as no-
> op in this scenario). We are working to make our self-tests as stable
> as possible, but there are still some sporadic failures. =

> =

> I could not reproduce this failure locally.

sorry for late. we tested it again, right, what we captured is just
above failure.
now we found by more runs, we could also reproduce on parent, though
the rate is very low.
at the same time, always fail on this commit.

4752eeb3d891c279 9d3684c24a5232c2d7ea8f8a3e6
---------------- ---------------------------
       fail:runs  %reproduction    fail:runs
           |             |             |
          1:8          100%           9:10    kernel-selftests.net/mptcp.mp=
tcp_join.sh.fail
          7:8          -88%            :10    kernel-selftests.net/mptcp.mp=
tcp_join.sh.pass


anyway, since reproduced on parent, this seems a false positive.
sorry for inconvenience.

> =

> Cheers,
> =

> Paolo
>=20
--===============0429955490043591420==--

