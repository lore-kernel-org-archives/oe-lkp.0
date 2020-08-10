Content-Type: multipart/mixed; boundary="===============7077953738524869031=="
MIME-Version: 1.0
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: lkp@lists.01.org
Subject: Re: [PATCH nf] netfilter: nft_compat: remove flush counter optimization
Date: Mon, 10 Aug 2020 13:03:51 +0200
Message-ID: <20200810110351.GA1613@salvia>
In-Reply-To: <20200809182801.9315-1-fw@strlen.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============7077953738524869031==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 09, 2020 at 08:28:01PM +0200, Florian Westphal wrote:
> WARNING: CPU: 1 PID: 16059 at lib/refcount.c:31 refcount_warn_saturate+0x=
df/0xf
> [..]
>  __nft_mt_tg_destroy+0x42/0x50 [nft_compat]
>  nft_target_destroy+0x63/0x80 [nft_compat]
>  nf_tables_expr_destroy+0x1b/0x30 [nf_tables]
>  nf_tables_rule_destroy+0x3a/0x70 [nf_tables]
>  nf_tables_exit_net+0x186/0x3d0 [nf_tables]
> =

> Happens when a compat expr is destoyed from abort path.
> There is no functional impact; after this work queue is flushed
> unconditionally if its pending.
> =

> This removes the waitcount optimization.  Test of repeated
> iptables-restore of a ~60k kubernetes ruleset doesn't indicate
> a slowdown.  In case the counter is needed after all for some workloads
> we can revert this and increment the refcount for the
> !=3D NFT_PREPARE_TRANS case to avoid the increment/decrement imbalance.
> =

> While at it, also flush for match case, this was an oversight
> in the original patch.

Applied, thanks.
--===============7077953738524869031==--

