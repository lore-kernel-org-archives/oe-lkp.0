Content-Type: multipart/mixed; boundary="===============1252768872087399763=="
MIME-Version: 1.0
From: Paolo Abeni <pabeni@redhat.com>
To: lkp@lists.01.org
Subject: Re: [veth] 9d3684c24a: kernel-selftests.net/mptcp.mptcp_join.sh.fail
Date: Tue, 07 Sep 2021 16:35:47 +0200
Message-ID: <ade152d7877b21adfd3b9680d729c185ef701bb9.camel@redhat.com>
In-Reply-To: <20210907142758.GD17617@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============1252768872087399763==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, 2021-09-07 at 22:27 +0800, kernel test robot wrote:
> caused below changes (please refer to attached dmesg/kmsg for entire log/=
backtrace):

It's not entirelly clear to me which are the relevant "changes" ???

[...]

> # 36 add multiple addresses IPv6          syn[ ok ] - synack[ ok ] - ack[=
 ok ]
> #                                         add[ ok ] - echo  [fail] got 1 =
ADD_ADDR echo[s] expected 2
> # =

> # Server ns stats
> # MPTcpExtMPCapableSYNRX          1                  0.0
> # MPTcpExtMPCapableACKRX          1                  0.0
> # MPTcpExtMPJoinSynRx             2                  0.0
> # MPTcpExtMPJoinAckRx             2                  0.0
> # MPTcpExtEchoAdd                 1                  0.0
> # Client ns stats
> # MPTcpExtMPCapableSYNTX          1                  0.0
> # MPTcpExtMPCapableSYNACKRX       1                  0.0
> # MPTcpExtMPJoinSynAckRx          2                  0.0
> # MPTcpExtAddAddr                 2                  0.0

is the referred change is the above self-test failure?

I belive this is unrelated to the mentioned commit (which behave as no-
op in this scenario). We are working to make our self-tests as stable
as possible, but there are still some sporadic failures. =


I could not reproduce this failure locally.

Cheers,

Paolo

--===============1252768872087399763==--

