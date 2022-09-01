Content-Type: multipart/mixed; boundary="===============7968911763100098154=="
MIME-Version: 1.0
From: David Ahern <dsahern@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH net] ip: fix triggering of 'icmp redirect'
Date: Wed, 31 Aug 2022 20:30:52 -0600
Message-ID: <46edeb7a-da56-e3f2-a823-a025b9386639@kernel.org>
In-Reply-To: <20220829100121.3821-1-nicolas.dichtel@6wind.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7968911763100098154==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 8/29/22 4:01 AM, Nicolas Dichtel wrote:
> __mkroute_input() uses fib_validate_source() to trigger an icmp redirect.
> My understanding is that fib_validate_source() is used to know if the src
> address and the gateway address are on the same link. For that,
> fib_validate_source() returns 1 (same link) or 0 (not the same network).
> __mkroute_input() is the only user of these positive values, all other
> callers only look if the returned value is negative.
> =

> Since the below patch, fib_validate_source() didn't return anymore 1 when
> both addresses are on the same network, because the route lookup returns
> RT_SCOPE_LINK instead of RT_SCOPE_HOST. But this is, in fact, right.
> Let's adapat the test to return 1 again when both addresses are on the sa=
me
> link.
> =

> CC: stable(a)vger.kernel.org
> Fixes: 747c14307214 ("ip: fix dflt addr selection for connected nexthop")
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Reported-by: Heng Qi <hengqi@linux.alibaba.com>
> Signed-off-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
> ---
> =

> This code exists since more than two decades:
> https://git.kernel.org/pub/scm/linux/kernel/git/davem/netdev-vger-cvs.git=
/commit/?id=3D0c2c94df8133f
> =

> Please, feel free to comment if my analysis seems wrong.
> =

> Regards,
> Nicolas
> =

>  net/ipv4/fib_frontend.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/net/ipv4/fib_frontend.c b/net/ipv4/fib_frontend.c
> index f361d3d56be2..943edf4ad4db 100644
> --- a/net/ipv4/fib_frontend.c
> +++ b/net/ipv4/fib_frontend.c
> @@ -389,7 +389,7 @@ static int __fib_validate_source(struct sk_buff *skb,=
 __be32 src, __be32 dst,
>  	dev_match =3D dev_match || (res.type =3D=3D RTN_LOCAL &&
>  				  dev =3D=3D net->loopback_dev);
>  	if (dev_match) {
> -		ret =3D FIB_RES_NHC(res)->nhc_scope >=3D RT_SCOPE_HOST;
> +		ret =3D FIB_RES_NHC(res)->nhc_scope >=3D RT_SCOPE_LINK;
>  		return ret;
>  	}
>  	if (no_addr)
> @@ -401,7 +401,7 @@ static int __fib_validate_source(struct sk_buff *skb,=
 __be32 src, __be32 dst,
>  	ret =3D 0;
>  	if (fib_lookup(net, &fl4, &res, FIB_LOOKUP_IGNORE_LINKSTATE) =3D=3D 0) {
>  		if (res.type =3D=3D RTN_UNICAST)
> -			ret =3D FIB_RES_NHC(res)->nhc_scope >=3D RT_SCOPE_HOST;
> +			ret =3D FIB_RES_NHC(res)->nhc_scope >=3D RT_SCOPE_LINK;
>  	}
>  	return ret;
>  =


Looks ok to me.

Reviewed-by: David Ahern <dsahern@kernel.org>

--===============7968911763100098154==--

