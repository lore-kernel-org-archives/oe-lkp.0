Content-Type: multipart/mixed; boundary="===============2713219447130643993=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Thu, 06 Jun 2019 17:28:55 +0800
Message-ID: <20190606092855.dfeuvyk5lbvm4zbf@gondor.apana.org.au>
In-Reply-To: <20190606090619.GC28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2713219447130643993==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 02:06:19AM -0700, Paul E. McKenney wrote:
>
> Or is your point instead that given the initial value of "a" being
> zero and the value stored to "a" being one, there is no way that
> any possible load and store tearing (your slicing and dicing) could
> possibly mess up the test of the value loaded from "a"?

Exactly.  If you can dream up of a scenario where the compiler can
get this wrong I'm all ears.

> > But I do concede that in the general RCU case you must have the
> > READ_ONCE/WRITE_ONCE calls for rcu_dereference/rcu_assign_pointer.
> =

> OK, good that we are in agreement on this part, at least!  ;-)

Well only because we're allowing crazy compilers that can turn
a simple word-aligned word assignment (a =3D b) into two stores.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============2713219447130643993==--

