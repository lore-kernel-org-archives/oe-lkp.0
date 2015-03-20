Content-Type: multipart/mixed; boundary="===============2846480591546091602=="
MIME-Version: 1.0
From: Marcelo <marcelo.leitner@gmail.com>
To: lkp@lists.01.org
Subject: Re: [ipv4, ipv6] baf606d9c9b: INFO: possible circular locking dependency detected ]
Date: Fri, 20 Mar 2015 09:57:21 -0300
Message-ID: <860bbbf6de2d26aa32e09b44b19a1a66@propriete.com.br>
In-Reply-To: <1426840632.5570.54.camel@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2846480591546091602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, 20 Mar 2015 16:37:12 +0800, Huang Ying <ying.huang@intel.com>
wrote:
> FYI, we noticed the below changes on
> =

> git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git master
> commit baf606d9c9b12517e47e0d1370e8aa9f7323f210 ("ipv4,ipv6: grab rtnl
> before locking the socket")
> =

...
> -> #0 (rtnl_mutex){+.+.+.}:
> [   19.816665]        [<ffffffff810c1ea4>] __lock_acquire+0x13f0/0x1a86
> [   19.816665]        [<ffffffff810c2c4d>] lock_acquire+0xb2/0x132
> [   19.816665]        [<ffffffff81b8d97b>] mutex_lock_nested+0x6b/0x38d
> [   19.816665]        [<ffffffff81a552b4>] rtnl_lock+0x17/0x19
> [   19.816665]        [<ffffffff81afc5c6>] ipv6_sock_ac_drop+0x28/0xc4
> [   19.816665]        [<ffffffff81b0fc30>]
do_ipv6_setsockopt+0x95d/0xd98
> [   19.816665]        [<ffffffff81b100bc>] ipv6_setsockopt+0x51/0x9c
> [   19.816665]        [<ffffffff81b160af>] rawv6_setsockopt+0x7c/0x91
> [   19.816665]        [<ffffffff81a345a0>]
sock_common_setsockopt+0x14/0x16
> [   19.816665]        [<ffffffff81a33ad0>] SyS_setsockopt+0x78/0x99
> [   19.816665]        [<ffffffff81b91289>]
system_call_fastpath+0x12/0x17
> [   19.816665] =

...

Missed this syscall, sorry. Will fix this.

  Marcelo


--===============2846480591546091602==--

