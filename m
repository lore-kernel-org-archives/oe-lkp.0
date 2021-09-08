Content-Type: multipart/mixed; boundary="===============2933833219230139885=="
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
To: lkp@lists.01.org
Subject: Re: [PATCH net] mctp: perform route destruction under RCU read lock
Date: Wed, 08 Sep 2021 10:40:08 +0000
Message-ID: <
 <163109760826.16056.8641773139555261021.git-patchwork-notify@kernel.org>>
In-Reply-To: <20210908041310.4014458-1-jk@codeconstruct.com.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============2933833219230139885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello:

This patch was applied to netdev/net.git (refs/heads/master):

On Wed,  8 Sep 2021 12:13:10 +0800 you wrote:
> The kernel test robot reports:
> =

>   [  843.509974][  T345] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>   [  843.524220][  T345] WARNING: suspicious RCU usage
>   [  843.538791][  T345] 5.14.0-rc2-00606-g889b7da23abf #1 Not tainted
>   [  843.553617][  T345] -----------------------------
>   [  843.567412][  T345] net/mctp/route.c:310 RCU-list traversed in non-r=
eader section!!
> =

> [...]

Here is the summary with links:
  - [net] mctp: perform route destruction under RCU read lock
    https://git.kernel.org/netdev/net/c/581edcd0c8a0

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


--===============2933833219230139885==--

