Content-Type: multipart/mixed; boundary="===============7552249435855718064=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: rhashtable: Use __vmalloc with GFP_ATOMIC for table allocation
Date: Fri, 04 Dec 2015 16:53:34 -0500
Message-ID: <20151204.165334.1119277452308794437.davem@davemloft.net>
In-Reply-To: <20151204143956.GA17471@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============7552249435855718064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 4 Dec 2015 22:39:56 +0800

> When an rhashtable user pounds rhashtable hard with back-to-back
> insertions we may end up growing the table in GFP_ATOMIC context.
> Unfortunately when the table reaches a certain size this often
> fails because we don't have enough physically contiguous pages
> to hold the new table.
> =

> Eric Dumazet suggested (and in fact wrote this patch) using
> __vmalloc instead which can be used in GFP_ATOMIC context.
> =

> Reported-by: Phil Sutter <phil@nwl.cc>
> Suggested-by: Eric Dumazet <eric.dumazet@gmail.com>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Applied, thanks Herbert.

--===============7552249435855718064==--

