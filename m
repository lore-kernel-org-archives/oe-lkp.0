Content-Type: multipart/mixed; boundary="===============1644895991467532199=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [rhashtable] [ INFO: possible recursive locking detected ]
Date: Thu, 12 Mar 2015 00:25:16 -0400
Message-ID: <20150312.002516.1995642240704082223.davem@davemloft.net>
In-Reply-To: <20150312034713.GA14026@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============1644895991467532199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu, 12 Mar 2015 14:47:13 +1100

> rhashtable: Add annotation to nested lock
>     =

> Commit aa34a6cb0478842452bac58edb50d3ef9e178c92 ("rhashtable:
> Add arbitrary rehash function") killed the annotation on the
> nested lock which leads to bitching from lockdep.
>     =

> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Applied, thanks!

--===============1644895991467532199==--

