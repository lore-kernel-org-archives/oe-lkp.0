Content-Type: multipart/mixed; boundary="===============5663599328576973064=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Thu, 06 Jun 2019 14:14:38 +0800
Message-ID: <20190606061438.nyzaeppdbqjt3jbp@gondor.apana.org.au>
In-Reply-To: <20190606060511.GA28207@linux.ibm.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5663599328576973064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 11:05:11PM -0700, Paul E. McKenney wrote:
>
> In case you were wondering, the reason that I was giving you such
> a hard time was that from what I could see, you were pushing for no
> {READ,WRITE}_ONCE() at all.  ;-)

Hmm, that's exactly what it should be in net/ipv4/inet_fragment.c.
We don't need the READ_ONCE/WRITE_ONCE (or volatile marking) at
all.  Even if the compiler dices and slices the reads/writes of
"a" into a thousand pieces, it should still work if the RCU
primitives are worth their salt.

But I do concede that in the general RCU case you must have the
READ_ONCE/WRITE_ONCE calls for rcu_dereference/rcu_assign_pointer.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============5663599328576973064==--

