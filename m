Content-Type: multipart/mixed; boundary="===============6762197388555495290=="
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
To: lkp@lists.01.org
Subject: Re: [PATCH net] ip: fix triggering of 'icmp redirect'
Date: Thu, 01 Sep 2022 03:00:15 +0000
Message-ID: <
 <166200121572.29714.8922887683350296133.git-patchwork-notify@kernel.org>>
In-Reply-To: <20220829100121.3821-1-nicolas.dichtel@6wind.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6762197388555495290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello:

This patch was applied to netdev/net.git (master)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 29 Aug 2022 12:01:21 +0200 you wrote:
> __mkroute_input() uses fib_validate_source() to trigger an icmp redirect.
> My understanding is that fib_validate_source() is used to know if the src
> address and the gateway address are on the same link. For that,
> fib_validate_source() returns 1 (same link) or 0 (not the same network).
> __mkroute_input() is the only user of these positive values, all other
> callers only look if the returned value is negative.
> =

> [...]

Here is the summary with links:
  - [net] ip: fix triggering of 'icmp redirect'
    https://git.kernel.org/netdev/net/c/eb55dc09b5dd

You are awesome, thank you!
-- =

Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


--===============6762197388555495290==--

