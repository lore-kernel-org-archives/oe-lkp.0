Content-Type: multipart/mixed; boundary="===============7578529668364407604=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rcu_read_lock lost its compiler barrier
Date: Thu, 06 Jun 2019 17:32:27 +0800
Message-ID: <20190606093227.kwtjkhjvbqzcym4s@gondor.apana.org.au>
In-Reply-To: <20190606083856.GA5337@andrea>
List-Id: <oe-lkp.lists.linux.dev>

--===============7578529668364407604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 06, 2019 at 10:38:56AM +0200, Andrea Parri wrote:
> On Mon, Jun 03, 2019 at 10:46:40AM +0800, Herbert Xu wrote:
> =

> > The case we were discussing is from net/ipv4/inet_fragment.c from
> > the net-next tree:
> =

> BTW, thank you for keeping me and other people who intervened in that
> discussion in Cc:...

FWIW I didn't drop you from the Cc list.  The email discussion was
taken off-list by someone else and I simply kept that Cc list when
I brought it back onto lkml.  On a second look I did end up dropping
Eric but I think he's had enough of this discussion :)
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============7578529668364407604==--

