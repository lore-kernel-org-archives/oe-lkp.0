Content-Type: multipart/mixed; boundary="===============5720227403714251228=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Mon, 03 Jun 2019 12:01:14 +0800
Message-ID: <20190603040114.st646bujtgyu7adn@gondor.apana.org.au>
In-Reply-To: <20190603034707.GG28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5720227403714251228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 02, 2019 at 08:47:07PM -0700, Paul E. McKenney wrote:
>
> 	CPU2:         if (b !=3D 1)
> 	CPU2:                 b =3D 1;

Stop right there.  The kernel is full of code that assumes that
assignment to an int/long is atomic.  If your compiler breaks this
assumption that we can kiss the kernel good-bye.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============5720227403714251228==--

