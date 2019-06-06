Content-Type: multipart/mixed; boundary="===============3493211080496744333=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Thu, 06 Jun 2019 21:38:24 +0800
Message-ID: <20190606133824.aibysezb5qdo3x27@gondor.apana.org.au>
In-Reply-To: <20190606105817.GE28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3493211080496744333==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 03:58:17AM -0700, Paul E. McKenney wrote:
>
> I cannot immediately think of a way that the compiler could get this
> wrong even in theory, but similar code sequences can be messed up.
> The reason for this is that in theory, the compiler could use the
> stored-to location as temporary storage, like this:
> =

> 	a =3D whatever;	// Compiler uses "a" as a temporary
> 	do_something();
> 	whatever =3D a;
> 	a =3D 1;		// Intended store

Well if the compiler is going to do this then surely it would
continue to do this even if you used WRITE_ONCE.  Remember a is
not volatile, only the access of a through WRITE_ONCE is volatile.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============3493211080496744333==--

