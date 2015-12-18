Content-Type: multipart/mixed; boundary="===============5509841331974031818=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rhashtable: Kill harmless RCU warning in rhashtable_walk_init
Date: Fri, 18 Dec 2015 21:14:08 +0800
Message-ID: <20151218131408.GA21756@gondor.apana.org.au>
In-Reply-To: <1450443254.8474.120.camel@edumazet-glaptop2.roam.corp.google.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5509841331974031818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2015 at 04:54:14AM -0800, Eric Dumazet wrote:
>
> You can avoid the comment by using the self documented and lockdep
> enabled primitive
> =

> iter->walker->tbl =3D rcu_dereference_protected(ht->tbl,
> 					      lockdep_is_held(&ht->lock));

That is just gross.  I think a comment is much better in this case.

If we were to have more place where ht->lock is taken and we had
to do the RCU dereference on ht->tbl then we could add a helper
for it.  For now it's just a single place and I think a comment
is the best way to deal with it.

> But, storing the ht->tbl and then releasing the lock immediately after
> escapes RCU protection.
> =

> So why do we store ht->tbl in the first place ?
> =

> What exactly prevents it from disappearing after lock is released ?

We add ourselves to the walker list before we release the lock.
The only entity that can destroy ht->tbl will take care of all
walkers before doing so.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============5509841331974031818==--

