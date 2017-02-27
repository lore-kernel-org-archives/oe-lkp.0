Content-Type: multipart/mixed; boundary="===============2685718263255979416=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: [rhashtable] 5d60de5ff1 [ INFO: suspicious RCU usage. ]
Date: Sun, 26 Feb 2017 21:34:31 -0500
Message-ID: <20170226.213431.1259588475180135466.davem@davemloft.net>
In-Reply-To: <20170225143950.GB28272@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============2685718263255979416==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Sat, 25 Feb 2017 22:39:50 +0800

> Subject: rhashtable: Fix RCU dereference annotation in rht_bucket_nested
> =

> The current annotation is wrong as it says that we're only called
> under spinlock.  In fact it should be marked as under either
> spinlock or RCU read lock.
> =

> Fixes: da20420f83ea ("rhashtable: Add nested tables")
> Reported-by: Fengguang Wu <fengguang.wu@intel.com>
> Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

Applied.

--===============2685718263255979416==--

