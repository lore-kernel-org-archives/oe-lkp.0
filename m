Content-Type: multipart/mixed; boundary="===============5302626870346092059=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: inet: frags: Turn fqdir->dead into an int for old Alphas
Date: Fri, 07 Jun 2019 23:32:26 +0800
Message-ID: <20190607153226.gzt4yeq5c5i6bpqd@gondor.apana.org.au>
In-Reply-To: <da5eedfe-92f9-6c50-b9e7-68886047dd25@gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============5302626870346092059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 07, 2019 at 08:26:12AM -0700, Eric Dumazet wrote:
>
> There is common knowledge among us programmers that bit fields
> (or bool) sharing a common 'word' need to be protected
> with a common lock.
> =

> Converting all bit fields to plain int/long would be quite a waste of mem=
ory.
> =

> In this case, fqdir_exit() is called right before the whole
> struct fqdir is dismantled, and the only cpu that could possibly
> change the thing is ourself, and we are going to start an RCU grace perio=
d.
> =

> Note that first cache line in 'struct fqdir' is read-only.
> Only ->dead field is flipped to one at exit time.
> =

> Your patch would send a strong signal to programmers to not even try using
> bit fields.
> =

> Do we really want that ?

If this were a bitfield then I'd think it would be safer because
anybody adding a new bitfield is unlikely to try modifying both
fields without locking or atomic ops.

However, because this is a boolean, I can certainly see someone
else coming along and adding another bool right next to it and
expecting writes them to still be atomic.

As it stands, my patch has zero impact on memory usage because
it's simply using existing padding.  Should this become an issue
in future, we can always revisit this and use a more appropriate
method of addressing it.

But the point is to alert future developers that this field is
not an ordinary boolean.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============5302626870346092059==--

