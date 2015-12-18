Content-Type: multipart/mixed; boundary="===============3333625806859405911=="
MIME-Version: 1.0
From: David Miller <davem@davemloft.net>
To: lkp@lists.01.org
Subject: Re: rhashtable: Kill harmless RCU warning in rhashtable_walk_init
Date: Fri, 18 Dec 2015 16:27:31 -0500
Message-ID: <20151218.162731.305092674804556753.davem@davemloft.net>
In-Reply-To: <20151218131408.GA21756@gondor.apana.org.au>
List-Id: <oe-lkp.lists.linux.dev>

--===============3333625806859405911==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 18 Dec 2015 21:14:08 +0800

> On Fri, Dec 18, 2015 at 04:54:14AM -0800, Eric Dumazet wrote:
>>
>> You can avoid the comment by using the self documented and lockdep
>> enabled primitive
>> =

>> iter->walker->tbl =3D rcu_dereference_protected(ht->tbl,
>> 					      lockdep_is_held(&ht->lock));
> =

> That is just gross.  I think a comment is much better in this case.

Herbert, this macro was created exactly to handle this situation,
and this is what we do everywhere else in the tree.

Please use it.

Thanks.

--===============3333625806859405911==--

