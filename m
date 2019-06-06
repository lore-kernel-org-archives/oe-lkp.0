Content-Type: multipart/mixed; boundary="===============4459281011604983741=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Thu, 06 Jun 2019 12:51:09 +0800
Message-ID: <20190606045109.zjfxxbkzq4wb64bj@gondor.apana.org.au>
In-Reply-To: <Pine.LNX.4.44L0.1906041026570.1731-100000@iolanthe.rowland.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4459281011604983741==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2019 at 10:44:18AM -0400, Alan Stern wrote:
>
> Currently the LKMM says the test is allowed and there is a data race, =

> but this answer clearly is wrong since it would violate the RCU =

> guarantee.

Thank you! This is what I tried to say all along in this thread
but you expressed it in a much better way :)
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4459281011604983741==--

