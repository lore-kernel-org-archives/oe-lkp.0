Content-Type: multipart/mixed; boundary="===============4175953134152416702=="
MIME-Version: 1.0
From: Herbert Xu <herbert@gondor.apana.org.au>
To: lkp@lists.01.org
Subject: Re: rhashtable: Prevent spurious EBUSY errors on insertion
Date: Fri, 18 Dec 2015 10:26:54 +0800
Message-ID: <20151218022654.GA18495@gondor.apana.org.au>
In-Reply-To: <CADvbK_e_H91UAatLSOEAvPFxZZTNNs5ZFR5TieXBdWt65z4Qzg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4175953134152416702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 18, 2015 at 12:07:08AM +0800, Xin Long wrote:
>
> I'm just wondering, why do not we handle the genuine double rehash
> issue inside rhashtable? i mean it's just a temporary error that a
> simple retry may fix it.

Because a double rehash means that someone has cracked your hash
function and there is no point in trying anymore.

Cheers,
-- =

Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--===============4175953134152416702==--

